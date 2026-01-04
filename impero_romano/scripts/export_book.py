import os
import subprocess
import sys
from datetime import datetime

# Configuration
BOOK_DIR = "chapters"
OUTPUT_FILE_PDF = "Ultimo_Orizzonte.pdf"
OUTPUT_FILE_EPUB = "Ultimo_Orizzonte.epub"
FRONTPAGE_IMAGE = "cover.jpg"

def check_tool(tool_name):
    from shutil import which
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

def get_chapter_files():
    """
    Generates the list of chapter files for 'L'Ultimo Orizzonte'.
    Looks for chapter_01.md, chapter_02.md, etc.
    """
    files = []
    
    # 0. Prologue
    if os.path.exists(os.path.join(BOOK_DIR, "prologue.md")):
        files.append(os.path.join(BOOK_DIR, "prologue.md"))
        
    # Part I (Ch 1-3)
    for i in range(1, 4):
        f = os.path.join(BOOK_DIR, f"chapter_{i:02d}.md")
        if os.path.exists(f): files.append(f)
        
    # Intermezzo 1
    if os.path.exists(os.path.join(BOOK_DIR, "intermezzo_01.md")):
        files.append(os.path.join(BOOK_DIR, "intermezzo_01.md"))
        
    # Part II (Ch 4-6)
    for i in range(4, 7):
        f = os.path.join(BOOK_DIR, f"chapter_{i:02d}.md")
        if os.path.exists(f): files.append(f)

    # Intermezzo 2
    if os.path.exists(os.path.join(BOOK_DIR, "intermezzo_02.md")):
        files.append(os.path.join(BOOK_DIR, "intermezzo_02.md"))
        
    # Part III (Ch 7-10)
    for i in range(7, 11):
        f = os.path.join(BOOK_DIR, f"chapter_{i:02d}.md")
        if os.path.exists(f): files.append(f)

    # Epilogue
    if os.path.exists(os.path.join(BOOK_DIR, "epilogue.md")):
        files.append(os.path.join(BOOK_DIR, "epilogue.md"))
        
    return files

def export_pdf(output_file):
    print(f"\n--- Starting PDF export for 'L'Ultimo Orizzonte' ---")
    
    # Environment setup (Mac specific)
    env = os.environ.copy()
    if sys.platform == "darwin":
        # Ensure brew and python bin paths are in PATH for this process
        extra_paths = ["/opt/homebrew/bin", "/usr/local/bin", os.path.expanduser("~/Library/Python/3.12/bin")]
        env["PATH"] = os.pathsep.join(extra_paths) + os.pathsep + env.get("PATH", "")
        
        # Library path for WeasyPrint
        if os.path.exists("/opt/homebrew/lib"):
            current_ld = env.get("DYLD_FALLBACK_LIBRARY_PATH", "")
            env["DYLD_FALLBACK_LIBRARY_PATH"] = f"/opt/homebrew/lib:{current_ld}"

    print("Checking tools...")
    pandoc_path = check_tool("pandoc")
    pdflatex_path = check_tool("pdflatex")
    weasyprint_path = check_tool("weasyprint")
    
    if not pandoc_path:
        print("Error: Pandoc is not installed.")
        return

    chapters = get_chapter_files()
    if not chapters:
        print("No chapters found in 'chapters/' directory.")
        return

    print(f"Found {len(chapters)} chapters for export.")

    # Construct Pandoc command
    cmd = [pandoc_path]
    cmd.extend(["-f", "markdown+raw_html+fenced_divs"])
    cmd.extend(["-o", output_file])
    
    # Cover handling
    if os.path.exists(FRONTPAGE_IMAGE):
        print(f"Adding frontpage: {FRONTPAGE_IMAGE}")
        with open("cover.html", "w") as f:
            f.write('<div class="cover">&nbsp;</div>\n')
        cmd.extend(["--include-before-body=cover.html"])
        
        with open("cover_override.css", "w") as f:
            f.write(f"""
@page cover {{
    margin: 0;
    background-image: url("{FRONTPAGE_IMAGE}");
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center;
    @bottom-center {{ content: none; }}
}}
""")

    cmd.extend(chapters)
    cmd.extend(["--toc"])
    cmd.extend(["--toc-depth=1"])
    
    # Metadata
    title = "L'Ultimo Orizzonte: Cronache dal Crollo dell'Impero"
    cmd.extend(["--metadata", f"title={title}"])
    cmd.extend(["--metadata", "author=A. Domio"])
    cmd.extend(["--metadata", f"date={datetime.now().strftime('%Y-%m-%d')}"])

    # CSS
    if os.path.exists("style.css"):
        cmd.extend(["--css", "style.css"])
    if os.path.exists("cover_override.css"):
        cmd.extend(["--css", "cover_override.css"])

    # Engine selection
    if pdflatex_path:
        print(f"Using pdflatex at {pdflatex_path}")
        cmd.extend([f"--pdf-engine={pdflatex_path}"])
        cmd.extend(["-V", "geometry:margin=1in"])
    elif weasyprint_path:
        print(f"Using weasyprint at {weasyprint_path}")
        cmd.extend([f"--pdf-engine={weasyprint_path}"])
    else:
        print("Error: No PDF engine found (pdflatex or weasyprint).")
        # Fallback to HTML
        html_out = output_file.replace(".pdf", ".html")
        cmd_html = cmd[:]
        cmd_html[cmd_html.index("-o") + 1] = html_out
        subprocess.run(cmd_html, check=True, env=env)
        print(f"Intermediate HTML created: {html_out}")
        return

    print("Running PDF conversion...")
    try:
        subprocess.run(cmd, check=True, env=env)
        print(f"Success! Book exported to {output_file}")
    except subprocess.CalledProcessError as e:
        print("Error during PDF conversion.")
        print(e)
    finally:
        for temp in ["cover.html", "cover_override.css"]:
            if os.path.exists(temp): os.remove(temp)

def export_epub(output_file):
    print(f"\n--- Starting EPUB export for 'L'Ultimo Orizzonte' ---")
    pandoc_path = check_tool("pandoc")
    if not pandoc_path: return

    chapters = get_chapter_files()
    if not chapters: return

    cmd = [pandoc_path, "-f", "markdown+raw_html+fenced_divs"]
    cmd.extend(chapters)
    cmd.extend(["-o", output_file, "--toc", "--toc-depth=1"])
    
    title = "L'Ultimo Orizzonte: Cronache dal Crollo dell'Impero"
    cmd.extend(["--metadata", f"title={title}", "--metadata", "author=A. Domio"])
    
    if os.path.exists(FRONTPAGE_IMAGE):
        cmd.extend([f"--epub-cover-image={FRONTPAGE_IMAGE}"])
    if os.path.exists("epub_style.css"):
        cmd.extend(["--css", "epub_style.css"])
    elif os.path.exists("style.css"):
        cmd.extend(["--css", "style.css"])

    print("Running EPUB conversion...")
    try:
        subprocess.run(cmd, check=True)
        print(f"Success! Book exported to {output_file}")
    except subprocess.CalledProcessError as e:
        print("Error during EPUB conversion.")
        print(e)

if __name__ == "__main__":
    export_pdf(OUTPUT_FILE_PDF)
    export_epub(OUTPUT_FILE_EPUB)
