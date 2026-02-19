import os
import subprocess
import sys
import argparse
from datetime import datetime

# Configuration
BOOK_DIR = "chapters"
OUTPUT_DIR = "release"
OUTPUT_FILENAME = "CUORE_SOTTO_RETE_L_ORO_DEL_2025"
TITLE = "CUORE SOTTO R E T E: L'Oro del 2025"
AUTHOR = "Il Collettivo (AI & Human)"
COVER_IMAGE = "cover.jpg" # Not yet present, but ready
STYLES_DIR = "styles"

def check_tool(tool_name):
    from shutil import which
    return which(tool_name) is not None

def get_chapters():
    """
    Generates the list of files in order.
    """
    files = []
    
    # Explicit order based on file names
    # We look for 00_*.md, 01_*.md, etc.
    if not os.path.exists(BOOK_DIR):
        print(f"Error: Directory {BOOK_DIR} not found.")
        return []

    all_files = sorted(os.listdir(BOOK_DIR))
    for f in all_files:
        if f.endswith(".md"):
            files.append(os.path.join(BOOK_DIR, f))
            
    return files

def export_pdf(chapters):
    print(f"\n--- Starting PDF export ---")
    
    if not check_tool("pandoc"):
        print("Error: Pandoc is not installed.")
        return

    # Create output dir if not exists
    if not os.path.exists(OUTPUT_DIR):
        os.makedirs(OUTPUT_DIR)

    output_file = os.path.join(OUTPUT_DIR, f"{OUTPUT_FILENAME}.pdf")
    
    cmd = ["pandoc"]
    cmd.extend(["-f", "markdown+raw_html+fenced_divs"])
    cmd.extend(["-o", output_file])
    
    # Input files
    cmd.extend(chapters)
    
    # TOC
    cmd.extend(["--toc"])
    cmd.extend(["--toc-depth=2"])
    
    # Metadata
    cmd.extend(["--metadata", f"title={TITLE}"])
    cmd.extend(["--metadata", f"author={AUTHOR}"])
    cmd.extend(["--metadata", f"date={datetime.now().strftime('%Y-%m-%d')}"])
    
    # CSS
    pdf_style = os.path.join(STYLES_DIR, "style.css")
    if os.path.exists(pdf_style):
        cmd.extend(["--css", pdf_style])
    else:
        print("Warning: style.css not found.")

    # PDF Engine
    if check_tool("pdflatex"):
        print("Using pdflatex engine...")
        cmd.extend(["--pdf-engine=pdflatex"])
        cmd.extend(["-V", "geometry:margin=2cm"])
        cmd.extend(["-V", "geometry:a5paper"])
    elif check_tool("weasyprint"):
        print("Using weasyprint engine...")
        cmd.extend(["--pdf-engine=weasyprint"])
    else:
        print("Error: No PDF engine found.")
        return

    print(f"Converting {len(chapters)} chapters...")
    try:
        subprocess.run(cmd, check=True)
        print(f"Success! PDF exported to {output_file}")
    except subprocess.CalledProcessError as e:
        print("Error during PDF conversion.")
        print(e)

def export_epub(chapters):
    print(f"\n--- Starting EPUB export ---")
    
    if not check_tool("pandoc"):
        print("Error: Pandoc is not installed.")
        return

    if not os.path.exists(OUTPUT_DIR):
        os.makedirs(OUTPUT_DIR)

    output_file = os.path.join(OUTPUT_DIR, f"{OUTPUT_FILENAME}.epub")
    
    cmd = ["pandoc"]
    cmd.extend(["-f", "markdown+raw_html+fenced_divs"])
    cmd.extend(["-o", output_file])
    
    cmd.extend(chapters)
    
    cmd.extend(["--toc"])
    cmd.extend(["--toc-depth=2"])
    
    cmd.extend(["--metadata", f"title={TITLE}"])
    cmd.extend(["--metadata", f"author={AUTHOR}"])
    
    if os.path.exists(COVER_IMAGE):
        cmd.extend([f"--epub-cover-image={COVER_IMAGE}"])
        
    epub_style = os.path.join(STYLES_DIR, "epub_style.css")
    if os.path.exists(epub_style):
        cmd.extend(["--css", epub_style])

    print(f"Converting {len(chapters)} chapters...")
    try:
        subprocess.run(cmd, check=True)
        print(f"Success! EPUB exported to {output_file}")
    except subprocess.CalledProcessError as e:
        print("Error during EPUB conversion.")
        print(e)

if __name__ == "__main__":
    chapters = get_chapters()
    if not chapters:
        print("No content found!")
        sys.exit(1)
        
    print(f"Found {len(chapters)} chapters: {[os.path.basename(f) for f in chapters]}")
    
    export_pdf(chapters)
    export_epub(chapters)
