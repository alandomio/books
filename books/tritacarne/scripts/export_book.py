import os
import subprocess
import sys
from datetime import datetime

# Configuration
BOOK_DIR = "book"
OUTPUT_FILE = "TRITACARNE.pdf"
FRONTPAGE_IMAGE = "Gemini_Generated_Image_u03a35u03a35u03a.png"
ORDER = [
    "preface.md",
    "chapter_1.md",
    "chapter_2.md",
    "chapter_3.md",
    "chapter_4.md",
    "chapter_5.md",
    "chapter_6.md"
]

def check_tool(tool_name):
    from shutil import which
    return which(tool_name) is not None

def get_chapters():
    chapters = []
    for filename in ORDER:
        path = os.path.join(BOOK_DIR, filename)
        if os.path.exists(path):
            chapters.append(path)
        else:
            print(f"Warning: {filename} not found.")
    return chapters

def export_pdf():
    print("Checking tools...")
    has_pandoc = check_tool("pandoc")
    has_pdflatex = check_tool("pdflatex")
    has_weasyprint = check_tool("weasyprint")
    
    if not has_pandoc:
        print("Error: Pandoc is not installed. Please install it.")
        return

    chapters = get_chapters()
    if not chapters:
        print("No chapters found.")
        return

    print(f"Found {len(chapters)} chapters.")

    # Construct Pandoc command
    cmd = ["pandoc"]
    
    # Explicitly set input format to allow markdown and raw HTML
    cmd.extend(["-f", "markdown+raw_html"])
    
    # Frontpage handling
    # We create a simple HTML file that uses the 'cover' page class defined in CSS
    # To ensure it appears BEFORE the TOC, we use --include-before-body
    if os.path.exists(FRONTPAGE_IMAGE):
        print(f"Adding frontpage: {FRONTPAGE_IMAGE}")
        with open("cover.html", "w") as f:
            # Empty div that triggers the @page cover style
            f.write('<div class="cover">&nbsp;</div>\n')
        cmd.extend(["--include-before-body=cover.html"])
    else:
        print(f"Warning: Frontpage image {FRONTPAGE_IMAGE} not found.")

    cmd.extend(chapters)
    cmd.extend(["-o", OUTPUT_FILE])
    cmd.extend(["--toc"]) # Table of contents
    
    # Metadata - Removed to prevent auto-generated title page interfering with Cover
    # cmd.extend(["--metadata", f"title=TRITACARNE: Cronache dal fronte dell'ipocrisia globale"])
    # cmd.extend(["--metadata", "author=Autore Anonimo"])
    # cmd.extend(["--metadata", f"date={datetime.now().strftime('%Y-%m-%d')}"])

    # CSS
    if os.path.exists("style.css"):
        cmd.extend(["--css", "style.css"])

    # Engine selection
    if has_pdflatex:
        # Fallback if user insists on pdflatex, but we prefer weasyprint for the CSS styling
        print("Using pdflatex engine (Warning: CSS styling might be limited)...")
        cmd.extend(["--pdf-engine=pdflatex"])
        cmd.extend(["-V", "geometry:margin=1in"])
    elif has_weasyprint:
        print("Using weasyprint engine...")
        cmd.extend(["--pdf-engine=weasyprint"])
        # Margins are handled in CSS now
    else:
        print("Error: No suitable PDF engine found (pdflatex or weasyprint).")
        return

    print("Running conversion...")
    print(" ".join(cmd))
    
    # Set environment variable for WeasyPrint to find libraries
    env = os.environ.copy()
    if has_weasyprint:
        # Add /opt/homebrew/lib to DYLD_FALLBACK_LIBRARY_PATH
        current_path = env.get("DYLD_FALLBACK_LIBRARY_PATH", "")
        env["DYLD_FALLBACK_LIBRARY_PATH"] = f"/opt/homebrew/lib:{current_path}"

    try:
        subprocess.run(cmd, check=True, env=env)
        print(f"Success! Book exported to {OUTPUT_FILE}")
        # Cleanup
        if os.path.exists("cover.html"):
            os.remove("cover.html")
    except subprocess.CalledProcessError as e:
        print("Error during conversion.")
        print(e)

def export_epub():
    print("\nStarting EPUB export...")
    OUTPUT_FILE_EPUB = "TRITACARNE.epub"
    
    has_pandoc = check_tool("pandoc")
    if not has_pandoc:
        print("Error: Pandoc is not installed. Please install it.")
        return

    chapters = get_chapters()
    if not chapters:
        print("No chapters found.")
        return

    cmd = ["pandoc"]
    cmd.extend(["-f", "markdown+raw_html"])
    cmd.extend(chapters)
    cmd.extend(["-o", OUTPUT_FILE_EPUB])
    cmd.extend(["--toc"])
    
    # Metadata for EPUB
    cmd.extend(["--metadata", f"title=TRITACARNE: Cronache dal fronte dell'ipocrisia globale"])
    cmd.extend(["--metadata", "author=Autore Anonimo"])
    cmd.extend(["--metadata", f"date={datetime.now().strftime('%Y-%m-%d')}"])
    cmd.extend(["--metadata", "lang=it"])

    # Cover image
    if os.path.exists(FRONTPAGE_IMAGE):
        cmd.extend([f"--epub-cover-image={FRONTPAGE_IMAGE}"])
    else:
        print(f"Warning: Frontpage image {FRONTPAGE_IMAGE} not found.")

    # CSS
    # CSS
    if os.path.exists("style.css"):
        # Preprocess CSS to remove @page blocks for EPUB
        print("Preprocessing CSS for EPUB...")
        epub_css = "epub_style.css"
        with open("style.css", "r") as f:
            css_content = f.read()
        
        # Simple state machine to strip @page blocks
        # This handles nested braces which regex might miss
        clean_css = []
        i = 0
        n = len(css_content)
        while i < n:
            if css_content[i:i+5] == "@page":
                # Skip until matching closing brace
                brace_count = 0
                started = False
                while i < n:
                    if css_content[i] == '{':
                        brace_count += 1
                        started = True
                    elif css_content[i] == '}':
                        brace_count -= 1
                        if started and brace_count == 0:
                            i += 1
                            break
                    i += 1
            else:
                clean_css.append(css_content[i])
                i += 1
        
        with open(epub_css, "w") as f:
            f.write("".join(clean_css))
            
        cmd.extend(["--css", epub_css])

    print("Running conversion...")
    print(" ".join(cmd))

    try:
        subprocess.run(cmd, check=True)
        print(f"Success! Book exported to {OUTPUT_FILE_EPUB}")
        if os.path.exists(epub_css):
            os.remove(epub_css)
    except subprocess.CalledProcessError as e:
        print("Error during EPUB conversion.")
        print(e)
        if os.path.exists(epub_css):
            os.remove(epub_css)

if __name__ == "__main__":
    export_pdf()
    export_epub()
