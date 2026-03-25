#!/usr/bin/env python3
import os
import subprocess
import sys

# Configuration
PROJECT_ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
OUTPUT_NAME = "ECLISSI_DEL_LEVANTE"
COVER_IMAGE = os.path.join(PROJECT_ROOT, "cover.jpg")
STYLE_CSS = os.path.join(PROJECT_ROOT, "style.css")

CHAPTER_ORDER = [
    f"CAPITOLO_{i:02d}.md" for i in range(0, 25)
]

def check_tool(tool_name):
    from shutil import which
    found = which(tool_name)
    if found:
        return found
    
    # Common Mac paths for Python/Homebrew tools (just in case)
    extras = [
        "/opt/homebrew/bin",
        "/usr/local/bin",
        os.path.expanduser("~/Library/Python/3.12/bin"),
        os.path.expanduser("~/Library/Python/3.11/bin"),
    ]
    for path in extras:
        full = os.path.join(path, tool_name)
        if os.path.exists(full):
            return full
    return None

def get_chapter_files():
    chapter_files = []
    for filename in CHAPTER_ORDER:
        file_path = os.path.join(PROJECT_ROOT, filename)
        if not os.path.exists(file_path):
            print(f"Warning: File not found: {file_path}")
            continue
        chapter_files.append(file_path)
    return chapter_files

def get_env():
    env = os.environ.copy()
    if sys.platform == "darwin":
        extra_paths = ["/opt/homebrew/bin", "/usr/local/bin", os.path.expanduser("~/Library/Python/3.12/bin")]
        env["PATH"] = os.pathsep.join(extra_paths) + os.pathsep + env.get("PATH", "")
    return env

def export_pdf(chapter_files):
    print("\n--- Exporting PDF ---")
    output_pdf = os.path.join(PROJECT_ROOT, f"{OUTPUT_NAME}.pdf")
    env = get_env()
    
    pandoc_path = check_tool("pandoc")
    if not pandoc_path:
        print("Error: Pandoc not found.")
        return

    cmd = [pandoc_path, "-f", "markdown+raw_html+fenced_divs"]
    
    # Optional Cover
    if os.path.exists(COVER_IMAGE):
        cover_html = os.path.join(PROJECT_ROOT, "temp_cover.html")
        with open(cover_html, "w") as f:
            f.write(f'<div class="cover" style="page-break-after: always; text-align: center;"><img src="{COVER_IMAGE}" style="width:100%; height:auto; display: block; margin: 0 auto;"></div>\n')
        cmd.extend(["--include-before-body=" + cover_html])
        # For PDF, usually better to just let pandoc handle it or use a separate pdf tool,
        # but for simplicity we rely on CSS/HTML or just --toc
    
    cmd.extend(chapter_files)
    cmd.extend(["-o", output_pdf, "--toc"])
    
    # Add metadata
    cmd.extend(["--metadata", "title=Eclissi del Levante"])
    cmd.extend(["--metadata", "lang=it-IT"])

    if os.path.exists(STYLE_CSS):
        cmd.extend(["--css", STYLE_CSS])
        
    weasyprint_path = check_tool("weasyprint")
    pdflatex_path = check_tool("pdflatex")

    if weasyprint_path:
        print(f"Using weasyprint at {weasyprint_path}")
        cmd.extend([f"--pdf-engine={weasyprint_path}"])
    elif pdflatex_path:
        print(f"Using pdflatex at {pdflatex_path}")
        cmd.extend([f"--pdf-engine={pdflatex_path}"])
        cmd.extend(["-V", "geometry:margin=1in"])
    else:
        # Try python module
        try:
            subprocess.run([sys.executable, "-m", "weasyprint", "--version"], 
                           stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, check=True, env=env)
            cmd.extend(["--pdf-engine", sys.executable, "-m", "weasyprint"])
            print("Using weasyprint as python module.")
        except:
            print("Error: No suitable PDF engine found.")
            return

    try:
        subprocess.run(cmd, check=True, env=env, cwd=PROJECT_ROOT)
        print(f"Success: {output_pdf}")
    except subprocess.CalledProcessError as e:
        print(f"Error: {e}")

def export_epub(chapter_files):
    print("\n--- Exporting EPUB ---")
    output_epub = os.path.join(PROJECT_ROOT, f"{OUTPUT_NAME}.epub")
    pandoc_path = check_tool("pandoc")
    if not pandoc_path: return

    cmd = [pandoc_path, "-f", "markdown+raw_html+fenced_divs"]
    cmd.extend(chapter_files)
    cmd.extend(["-o", output_epub, "--toc"])
    
    cmd.extend(["--metadata", f"title=Eclissi del Levante"])
    cmd.extend(["--metadata", "lang=it-IT"])
    
    if os.path.exists(COVER_IMAGE):
        cmd.extend([f"--epub-cover-image={COVER_IMAGE}"])
        cmd.extend(["--metadata", f"cover-image={COVER_IMAGE}"])
    
    if os.path.exists(STYLE_CSS):
        # We might need to strip @page rules for EPUB as they can cause validation errors
        epub_css = os.path.join(PROJECT_ROOT, "epub_style_temp.css")
        with open(STYLE_CSS, "r") as f:
            content = f.read()
        import re
        content = re.sub(r'@page[^\{]*\{[^\}]*\}', '', content, flags=re.DOTALL)
        with open(epub_css, "w") as f:
            f.write(content)
        cmd.extend(["--css", epub_css])
    else:
        epub_css = None

    try:
        subprocess.run(cmd, check=True, cwd=PROJECT_ROOT)
        print(f"Success: {output_epub}")
    except subprocess.CalledProcessError as e:
        print(f"Error: {e}")
    finally:
        if epub_css and os.path.exists(epub_css):
            os.remove(epub_css)

if __name__ == "__main__":
    files = get_chapter_files()
    if not files:
        print("No chapter files found.")
        sys.exit(1)
    
    print(f"Found {len(files)} chapters.")
    export_pdf(files)
    export_epub(files)
