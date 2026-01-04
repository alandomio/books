import os
import subprocess
import sys
from datetime import datetime

# Configuration
BOOK_DIR = "book"
OUTPUT_FILE = "FORTRESS_AMERICA.pdf"
FRONTPAGE_IMAGE = "fortress_america_cover.jpg"
ORDER = [
    "Chapter_1_Scene_1.md",
    "Chapter_1_Scene_2.md",
    "Chapter_1_Scene_3.md",
    "Chapter_1_Scene_4.md",
    "Chapter_1_Scene_5.md",
    "Chapter_1_Scene_6.md",
    "Chapter_2_Scene_1.md",
    "Chapter_2_Scene_2.md",
    "Chapter_2_Scene_3.md",
    "Chapter_2_Scene_4.md",
    "Chapter_2_Scene_5.md",
    "Chapter_2_Scene_6.md",
    "Chapter_3_Scene_1.md",
    "Chapter_3_Scene_2.md",
    "Chapter_3_Scene_3.md",
    "Chapter_3_Scene_4.md",
    "Chapter_3_Scene_5.md",
    "Chapter_3_Scene_6.md",
    "Chapter_4_Scene_1.md",
    "Chapter_4_Scene_2.md",
    "Chapter_4_Scene_3.md",
    "Chapter_4_Scene_4.md",
    "Chapter_4_Scene_5.md",
    "Chapter_4_Scene_6.md",
    "Chapter_5_Scene_1.md",
    "Chapter_5_Scene_2.md",
    "Chapter_5_Scene_3.md",
    "Chapter_5_Scene_4.md",
    "Chapter_5_Scene_5.md",
    "Chapter_5_Scene_6.md",
    "Chapter_6_Scene_1.md",
    "Chapter_6_Scene_2.md",
    "Chapter_6_Scene_3.md",
    "Chapter_6_Scene_4.md",
    "Chapter_6_Scene_5.md",
    "Chapter_6_Scene_6.md",
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
    if FRONTPAGE_IMAGE and os.path.exists(FRONTPAGE_IMAGE):
        print(f"Adding frontpage: {FRONTPAGE_IMAGE}")
        with open("cover.html", "w") as f:
            # Empty div that triggers the @page cover style
            f.write('<div class="cover">&nbsp;</div>\n')
        cmd.extend(["--include-before-body=cover.html"])
    elif FRONTPAGE_IMAGE:
        print(f"Warning: Frontpage image {FRONTPAGE_IMAGE} not found.")

    cmd.extend(chapters)
    cmd.extend(["-o", OUTPUT_FILE])
    cmd.extend(["--toc"]) # Table of contents
    
    # Metadata
    cmd.extend(["--metadata", f"title=FORTRESS AMERICA: Il Nuovo Ordine Chiuso"])
    cmd.extend(["--metadata", "author=Autore Anonimo"])
    cmd.extend(["--metadata", f"date={datetime.now().strftime('%Y-%m-%d')}"])

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
    OUTPUT_FILE_EPUB = "FORTRESS_AMERICA.epub"
    
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
    cmd.extend(["--metadata", f"title=FORTRESS AMERICA: Il Nuovo Ordine Chiuso"])
    cmd.extend(["--metadata", "author=Autore Anonimo"])
    cmd.extend(["--metadata", f"date={datetime.now().strftime('%Y-%m-%d')}"])

    # Cover image
    if FRONTPAGE_IMAGE and os.path.exists(FRONTPAGE_IMAGE):
        cmd.extend([f"--epub-cover-image={FRONTPAGE_IMAGE}"])
    elif FRONTPAGE_IMAGE:
        print(f"Warning: Frontpage image {FRONTPAGE_IMAGE} not found.")

    # CSS
    if os.path.exists("style.css"):
        cmd.extend(["--css", "style.css"])

    print("Running conversion...")
    print(" ".join(cmd))

    try:
        subprocess.run(cmd, check=True)
        print(f"Success! Book exported to {OUTPUT_FILE_EPUB}")
    except subprocess.CalledProcessError as e:
        print("Error during EPUB conversion.")
        print(e)

if __name__ == "__main__":
    export_pdf()
    export_epub()
