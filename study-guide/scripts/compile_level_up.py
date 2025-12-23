import os
import subprocess
import sys
from datetime import datetime

# Configuration
BOOK_DIR = "book_content"
OUTPUT_FILE_PDF = "LEVEL_UP.pdf"
OUTPUT_FILE_EPUB = "LEVEL_UP.epub"
TITLE = "LEVEL UP: La Tua Guida Definitiva per Hackerare la Scuola"
AUTHOR = "A. Domio"

def check_tool(tool_name):
    from shutil import which
    return which(tool_name) is not None

def get_files():
    """
    Generates the list of files to include in the book.
    """
    files = []
    
    # 1. Index
    index_file = os.path.join(BOOK_DIR, "00_INDEX.md")
    if os.path.exists(index_file):
        files.append(index_file)
    else:
        print(f"Warning: {index_file} not found.")

    # 2. Levels (Chapters)
    # We look for files starting with "01_", "02_", etc.
    # Or we can just sort the files in the directory.
    
    all_files = sorted(os.listdir(BOOK_DIR))
    for f in all_files:
        if f == "00_INDEX.md":
            continue # Already added
        if f.endswith(".md"):
            full_path = os.path.join(BOOK_DIR, f)
            files.append(full_path)
            
    return files

def export_book(output_format="pdf"):
    output_file = OUTPUT_FILE_PDF if output_format == "pdf" else OUTPUT_FILE_EPUB
    print(f"\n--- Starting {output_format.upper()} export ---")
    
    if not check_tool("pandoc"):
        print("Error: Pandoc is not installed.")
        return

    files = get_files()
    if not files:
        print("No files found.")
        return

    print(f"Found {len(files)} files: {files}")

    cmd = ["pandoc"]
    cmd.extend(["-f", "markdown+raw_html+fenced_divs"])
    cmd.extend(["-o", output_file])

    # Cover Image Handling
    if os.path.exists("cover.jpg"):
        if output_format == "epub":
            cmd.extend(["--epub-cover-image=cover.jpg"])
        elif output_format == "pdf":
            # For PDF, we prepend a cover page markdown file
            cover_md = "cover_page_temp.md"
            with open(cover_md, "w") as f:
                # Use raw HTML to apply the class and ensure full page
                f.write('<img src="cover.jpg" class="cover-image" />\n\n<div style="page-break-after: always;"></div>\n\n')
            cmd.append(cover_md)

    cmd.extend(files)
    
    # TOC
    # We are using a manual index (00_INDEX.md), so we disable auto-generated TOC
    # cmd.extend(["--toc"])
    # cmd.extend(["--toc-depth=2"])
    
    # Metadata
    cmd.extend(["--metadata", f"title={TITLE}"])
    cmd.extend(["--metadata", f"author={AUTHOR}"])
    cmd.extend(["--metadata", f"date={datetime.now().strftime('%Y-%m-%d')}"])
    cmd.extend(["--metadata", "lang=it-IT"])
    
    # CSS (reuse existing style if present)
    if os.path.exists("style.css"):
        cmd.extend(["--css", "style.css"])

    # PDF Engine
    if output_format == "pdf":
        if check_tool("pdflatex"):
            cmd.extend(["--pdf-engine=pdflatex"])
            cmd.extend(["-V", "geometry:margin=1in"])
        elif check_tool("weasyprint"):
            cmd.extend(["--pdf-engine=weasyprint"])
        else:
            print("Error: No PDF engine found.")
            return

    print("Running conversion...")
    
    # Set environment variable for WeasyPrint to find libraries
    env = os.environ.copy()
    if output_format == "pdf" and check_tool("weasyprint"):
        current_path = env.get("DYLD_FALLBACK_LIBRARY_PATH", "")
        env["DYLD_FALLBACK_LIBRARY_PATH"] = f"/opt/homebrew/lib:{current_path}"

    try:
        subprocess.run(cmd, check=True, env=env)
        print(f"Success! Book exported to {output_file}")
    except subprocess.CalledProcessError as e:
        print("Error during conversion.")
        print(e)

if __name__ == "__main__":
    export_book("pdf")
    export_book("epub")
