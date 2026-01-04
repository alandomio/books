import os
import subprocess
import sys
from datetime import datetime
import export_book

def create_release():
    print("--- Preparing GitHub Release ---")

    # 1. Build Artifacts
    print("Building artifacts...")
    # Using constants from export_book if available, or falling back to defaults
    pdf_file = getattr(export_book, 'OUTPUT_FILE_PDF', "Ultimo_Orizzonte.pdf")
    epub_file = getattr(export_book, 'OUTPUT_FILE_EPUB', "Ultimo_Orizzonte.epub")

    export_book.export_pdf(pdf_file)
    export_book.export_epub(epub_file)

    # Verify files exist
    if not os.path.exists(pdf_file) or not os.path.exists(epub_file):
        print(f"Error: One or more artifacts missing.\nPDF: {pdf_file}\nEPUB: {epub_file}")
        sys.exit(1)

    # 2. Determine Version
    default_version = datetime.now().strftime("v%Y.%m.%d")
    version = input(f"Enter release tag (default: {default_version}): ").strip()
    if not version:
        version = default_version

    print(f"Releasing version: {version}")

    # 3. Create Release using gh CLI
    # Command: gh release create <tag> <files>... --title <title> --notes <notes>
    cmd = [
        "gh", "release", "create", version,
        pdf_file, epub_file,
        "--title", f"Release {version}",
        "--generate-notes" # Auto-generate release notes based on commits
    ]

    print(f"Running command: {' '.join(cmd)}")
    
    confirm = input("Proceed with release? (y/N): ").strip().lower()
    if confirm != 'y':
        print("Aborted.")
        sys.exit(0)

    try:
        subprocess.run(cmd, check=True)
        print("Release created successfully!")
    except subprocess.CalledProcessError as e:
        print("Error creating release.")
        print(e)
        sys.exit(1)

if __name__ == "__main__":
    # Ensure lines from imported modules don't clutter output too much if they print
    create_release()
