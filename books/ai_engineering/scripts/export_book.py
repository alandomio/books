#!/usr/bin/env python3
import os
import subprocess
import sys
from datetime import datetime

# Configuration
PROJECT_ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
OUTPUT_NAME = "VIBE_CODING_ERA"
COVER_IMAGE = os.path.join(PROJECT_ROOT, "cover.png")
STYLE_CSS = os.path.join(PROJECT_ROOT, "style.css")

# The order of chapters as defined in the book structure
CHAPTER_ORDER = [
    f"chapter_{i:02d}" for i in range(1, 14)
]

def check_tool(tool_name):
    from shutil import which
    found = which(tool_name)
    if found:
        return found
    
    # Common Mac paths for Python/Homebrew tools
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
    for chapter_dir in CHAPTER_ORDER:
        chapter_path = os.path.join(PROJECT_ROOT, chapter_dir)
        if not os.path.exists(chapter_path):
            continue
        
        scenes = sorted([f for f in os.listdir(chapter_path) if f.startswith("scene_") and f.endswith(".md")])
        if not scenes:
            continue
            
        merged_filename = f"{chapter_dir}_merged.md"
        merged_path = os.path.join(PROJECT_ROOT, merged_filename)
        
        with open(merged_path, "w") as outfile:
            for scene in scenes:
                with open(os.path.join(chapter_path, scene), "r") as infile:
                    outfile.write(infile.read())
                    outfile.write("\n\n")
        
        chapter_files.append(merged_path)
    return chapter_files

def get_env():
    env = os.environ.copy()
    if sys.platform == "darwin":
        extra_paths = ["/opt/homebrew/bin", "/usr/local/bin", os.path.expanduser("~/Library/Python/3.12/bin")]
        env["PATH"] = os.pathsep.join(extra_paths) + os.pathsep + env.get("PATH", "")
        
        if os.path.exists("/opt/homebrew/lib"):
            current_ld = env.get("DYLD_FALLBACK_LIBRARY_PATH", "")
            env["DYLD_FALLBACK_LIBRARY_PATH"] = f"/opt/homebrew/lib:{current_ld}"
            env["DYLD_LIBRARY_PATH"] = f"/opt/homebrew/lib:{env.get('DYLD_LIBRARY_PATH', '')}"
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
    
    if os.path.exists(COVER_IMAGE):
        cover_html = os.path.join(PROJECT_ROOT, "temp_cover.html")
        with open(cover_html, "w") as f:
            f.write('<div class="cover">&nbsp;</div>\n')
        cmd.extend(["--include-before-body=" + cover_html])
    
    cmd.extend(chapter_files)
    cmd.extend(["-o", output_pdf, "--toc"])
    
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
    finally:
        if 'cover_html' in locals() and os.path.exists(cover_html):
            os.remove(cover_html)

def export_epub(chapter_files):
    print("\n--- Exporting EPUB ---")
    output_epub = os.path.join(PROJECT_ROOT, f"{OUTPUT_NAME}.epub")
    pandoc_path = check_tool("pandoc")
    if not pandoc_path: return

    cmd = [pandoc_path, "-f", "markdown+raw_html+fenced_divs"]
    cmd.extend(chapter_files)
    cmd.extend(["-o", output_epub, "--toc"])
    
    cmd.extend(["--metadata", f"title=The Vibe Coding Era"])
    cmd.extend(["--metadata", "author=Fractal Architect"])
    
    if os.path.exists(COVER_IMAGE):
        cmd.extend([f"--epub-cover-image={COVER_IMAGE}"])
    
    if os.path.exists(STYLE_CSS):
        epub_css = os.path.join(PROJECT_ROOT, "epub_style_temp.css")
        with open(STYLE_CSS, "r") as f:
            content = f.read()
        import re
        content = re.sub(r'@page[^\{]*\{[^\}]*\}', '', content, flags=re.DOTALL)
        with open(epub_css, "w") as f:
            f.write(content)
        cmd.extend(["--css", epub_css])

    try:
        subprocess.run(cmd, check=True, cwd=PROJECT_ROOT)
        print(f"Success: {output_epub}")
    except subprocess.CalledProcessError as e:
        print(f"Error: {e}")
    finally:
        if 'epub_css' in locals() and os.path.exists(epub_css):
            os.remove(epub_css)

def cleanup(chapter_files):
    for f in chapter_files:
        if os.path.exists(f): os.remove(f)

if __name__ == "__main__":
    files = get_chapter_files()
    if not files:
        sys.exit(1)
    try:
        export_pdf(files)
        export_epub(files)
    finally:
        cleanup(files)
