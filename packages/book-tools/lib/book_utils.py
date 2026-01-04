import os
import sys
import subprocess
from shutil import which

def check_tool(tool_name):
    # On some systems, we need to check specific paths manually if the shell environment isn't fully inherited
    found = which(tool_name)
    if found:
        return found
    
    # Common Mac paths for Python/Homebrew tools if not in PATH
    extras = [
        "/opt/homebrew/bin",
        "/usr/local/bin",
        os.path.expanduser("~/Library/Python/3.12/bin"),
        os.path.expanduser("~/Library/Python/3.11/bin"),
        os.path.expanduser("~/Library/Python/3.9/bin"),
        "/Library/TeX/texbin"
    ]
    for path in extras:
        full = os.path.join(path, tool_name)
        if os.path.exists(full):
            return full
    return None

def run_pandoc_pdf(input_files, output_file, title=None, author=None, cover_image=None, css=None, pdf_engine_args=None):
    print(f"--- Exporting PDF: {output_file} ---")
    pandoc = check_tool("pandoc")
    if not pandoc:
        print("Error: Pandoc not found")
        return False
    
    cmd = [pandoc, "-f", "markdown+raw_html+fenced_divs", "-o", output_file]
    cmd.extend(input_files)
    cmd.extend(["--toc", "--toc-depth=1"])
    
    if title: cmd.extend(["--metadata", f"title={title}"])
    if author: cmd.extend(["--metadata", f"author={author}"])
    
    # Cover handling for PDF (often requires HTML hack or specific engine support)
    # Keeping it simple/generic for now, can be extended
    
    if css:
        cmd.extend(["--css", css])
        
    # Pdf engine detection
    pdflatex = check_tool("pdflatex")
    weasyprint = check_tool("weasyprint")
    
    if pdflatex:
        cmd.extend([f"--pdf-engine={pdflatex}"])
        cmd.extend(["-V", "geometry:margin=1in"])
    elif weasyprint:
        cmd.extend([f"--pdf-engine={weasyprint}"])
    else:
        print("Warning: No PDF engine found (pdflatex or weasyprint).")
        return False
        
    try:
        subprocess.run(cmd, check=True)
        print(f"Successfully generated {output_file}")
        return True
    except subprocess.CalledProcessError as e:
        print(f"Error generating PDF: {e}")
        return False

def run_pandoc_epub(input_files, output_file, title=None, author=None, cover_image=None, css=None):
    print(f"--- Exporting EPUB: {output_file} ---")
    pandoc = check_tool("pandoc")
    if not pandoc:
        print("Error: Pandoc not found")
        return False
        
    cmd = [pandoc, "-f", "markdown+raw_html+fenced_divs", "-o", output_file]
    cmd.extend(input_files)
    cmd.extend(["--toc", "--toc-depth=1"])
    
    if title: cmd.extend(["--metadata", f"title={title}"])
    if author: cmd.extend(["--metadata", f"author={author}"])
    if cover_image: cmd.extend([f"--epub-cover-image={cover_image}"])
    if css: cmd.extend(["--css", css])
    
    try:
        subprocess.run(cmd, check=True)
        print(f"Successfully generated {output_file}")
        return True
    except subprocess.CalledProcessError as e:
        print(f"Error generating EPUB: {e}")
        return False
