import os
import subprocess
import sys
from datetime import datetime

# Configuration
BOOK_DIR = "chapters"
OUTPUT_FILE_IT_PDF = "CHRONOS_IT.pdf"
OUTPUT_FILE_SL_PDF = "CHRONOS_SL.pdf"
OUTPUT_FILE_IT_EPUB = "CHRONOS_IT.epub"
OUTPUT_FILE_SL_EPUB = "CHRONOS_SL.epub"
FRONTPAGE_IMAGE_IT = "cover_it.jpg"
FRONTPAGE_IMAGE_SL = "cover_sl.jpg"

def check_tool(tool_name):
    from shutil import which
    return which(tool_name) is not None

def get_files_for_language(language_code):
    """
    Generates the list of files for the given language code ('it' or 'sl').
    language_code: 'it' for Italian, 'sl' for Slovenian.
    """
    files = []
    suffix = "_sl" if language_code == "sl" else ""
    
    # Note: Disclaimer is now handled separately in export_pdf to place it before TOC.
    
    # Loop through 12 chapters
    for i in range(1, 13):
        # Introduction
        intro_file = os.path.join(BOOK_DIR, f"capitolo_{i}_intro{suffix}.md")
        if os.path.exists(intro_file):
            files.append(intro_file)
        else:
            # Only warn for the first few chapters to avoid spamming if the book is incomplete
            if i <= 2: 
                print(f"Warning: {intro_file} not found.")

        # Scenes 1 to 6
        for j in range(1, 7):
            scene_file = os.path.join(BOOK_DIR, f"capitolo_{i}_scena_{j}{suffix}.md")
            if os.path.exists(scene_file):
                files.append(scene_file)
            else:
                 if i <= 2:
                    print(f"Warning: {scene_file} not found.")

        # Conclusion
        concl_file = os.path.join(BOOK_DIR, f"capitolo_{i}_conclusione{suffix}.md")
        if os.path.exists(concl_file):
            files.append(concl_file)
        else:
             if i <= 2:
                print(f"Warning: {concl_file} not found.")
                
    return files

def export_pdf(language_code, output_file):
    print(f"\n--- Starting PDF export for language: {language_code.upper()} ---")
    print("Checking tools...")
    has_pandoc = check_tool("pandoc")
    has_pdflatex = check_tool("pdflatex")
    has_weasyprint = check_tool("weasyprint")
    
    if not has_pandoc:
        print("Error: Pandoc is not installed. Please install it.")
        return

    chapters = get_files_for_language(language_code)
    if not chapters:
        print(f"No chapters found for language {language_code}.")
        return

    print(f"Found {len(chapters)} files.")

    # Construct Pandoc command
    cmd = ["pandoc"]
    
    # Explicitly set input format to allow markdown, raw HTML, and fenced divs
    cmd.extend(["-f", "markdown+raw_html+fenced_divs"])
    cmd.extend(["-o", output_file])
    
    # Frontpage handling
    cover_image = FRONTPAGE_IMAGE_IT if language_code == "it" else FRONTPAGE_IMAGE_SL
    if os.path.exists(cover_image):
        print(f"Adding frontpage: {cover_image}")
        
        # 1. Generate cover.html with a container div
        with open("cover.html", "w") as f:
            # We use a non-breaking space to ensure the div isn't collapsed
            f.write('<div class="cover">&nbsp;</div>\n')
        cmd.extend(["--include-before-body=cover.html"])
        
        # 2. Generate cover_override.css to set the background image on the @page
        # This ensures full bleed without margins
        with open("cover_override.css", "w") as f:
            f.write(f"""
@page cover {{
    margin: 0;
    background-image: url("{cover_image}");
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center;

    @bottom-center {{
        content: none;
    }}
}}
""")
    else:
        print(f"Warning: Frontpage image {cover_image} not found.")

    # Disclaimer handling (Before TOC)
    suffix = "_sl" if language_code == "sl" else ""
    disclaimer_md = os.path.join(BOOK_DIR, f"00_disclaimer{suffix}.md")
    if os.path.exists(disclaimer_md):
        print(f"Adding disclaimer: {disclaimer_md}")
        # Convert markdown disclaimer to HTML temp file
        subprocess.run(["pandoc", disclaimer_md, "-o", "disclaimer.html"], check=True)
        cmd.extend(["--include-before-body=disclaimer.html"])

    cmd.extend(chapters)
    cmd.extend(["--toc"]) # Table of contents
    cmd.extend(["--toc-depth=2"]) # Only H1 and H2
    
    # Metadata
    title = "CHRONOS: L'Avventura della Storia" if language_code == "it" else "CHRONOS: Pustolovščina Zgodovine"
    cmd.extend(["--metadata", f"title={title}"])
    cmd.extend(["--metadata", "author=A. Domio"]) # Placeholder
    cmd.extend(["--metadata", f"date={datetime.now().strftime('%Y-%m-%d')}"])

    # CSS
    if os.path.exists("style.css"):
        cmd.extend(["--css", "style.css"])
    
    if os.path.exists("cover_override.css"):
        cmd.extend(["--css", "cover_override.css"])

    # Engine selection
    if has_pdflatex:
        print("Using pdflatex engine...")
        cmd.extend(["--pdf-engine=pdflatex"])
        cmd.extend(["-V", "geometry:margin=1in"])
    elif has_weasyprint:
        print("Using weasyprint engine...")
        cmd.extend(["--pdf-engine=weasyprint"])
    else:
        print("Error: No suitable PDF engine found (pdflatex or weasyprint).")
        return

    print("Running conversion...")
    # print(" ".join(cmd)) # Debug
    
    # Set environment variable for WeasyPrint to find libraries
    env = os.environ.copy()
    if has_weasyprint:
        current_path = env.get("DYLD_FALLBACK_LIBRARY_PATH", "")
        env["DYLD_FALLBACK_LIBRARY_PATH"] = f"/opt/homebrew/lib:{current_path}"

    try:
        subprocess.run(cmd, check=True, env=env)
        print(f"Success! Book exported to {output_file}")
        # Cleanup
        if os.path.exists("cover.html"):
            os.remove("cover.html")
        if os.path.exists("cover_override.css"):
            os.remove("cover_override.css")
        if os.path.exists("disclaimer.html"):
            os.remove("disclaimer.html")
    except subprocess.CalledProcessError as e:
        print("Error during conversion.")
        print(e)

def export_epub(language_code, output_file):
    print(f"\n--- Starting EPUB export for language: {language_code.upper()} ---")
    
    has_pandoc = check_tool("pandoc")
    if not has_pandoc:
        print("Error: Pandoc is not installed. Please install it.")
        return

    chapters = get_files_for_language(language_code)
    if not chapters:
        print(f"No chapters found for language {language_code}.")
        return

    cmd = ["pandoc"]
    cmd.extend(["-f", "markdown+raw_html+fenced_divs"])
    cmd.extend(chapters)
    cmd.extend(["-o", output_file])
    cmd.extend(["--toc"])
    cmd.extend(["--toc-depth=2"])
    
    # Metadata
    title = "CHRONOS: L'Avventura della Storia" if language_code == "it" else "CHRONOS: Pustolovščina Zgodovine"
    cmd.extend(["--metadata", f"title={title}"])
    cmd.extend(["--metadata", "author=A. Domio"])
    cmd.extend(["--metadata", f"date={datetime.now().strftime('%Y-%m-%d')}"])

    # Cover image
    cover_image = FRONTPAGE_IMAGE_IT if language_code == "it" else FRONTPAGE_IMAGE_SL
    if os.path.exists(cover_image):
        cmd.extend([f"--epub-cover-image={cover_image}"])
    
    # CSS
    if os.path.exists("epub_style.css"):
        cmd.extend(["--css", "epub_style.css"])
    elif os.path.exists("style.css"):
        cmd.extend(["--css", "style.css"])

    print("Running conversion...")
    
    try:
        subprocess.run(cmd, check=True)
        print(f"Success! Book exported to {output_file}")
    except subprocess.CalledProcessError as e:
        print("Error during EPUB conversion.")
        print(e)

if __name__ == "__main__":
    # Export Italian
    export_pdf("it", OUTPUT_FILE_IT_PDF)
    export_epub("it", OUTPUT_FILE_IT_EPUB)
    
    # Export Slovenian
    export_pdf("sl", OUTPUT_FILE_SL_PDF)
    export_epub("sl", OUTPUT_FILE_SL_EPUB)
