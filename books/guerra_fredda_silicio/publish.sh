#!/bin/bash
# Script to compile 'La Guerra Fredda del Silicio' to PDF and EPUB using Pandoc

set -euo pipefail

# Configuration
BOOK_TITLE="La Guerra Fredda del Silicio"
AUTHOR="Alan Domio"
LANG="it-IT"
OUTPUT_NAME="LA_GUERRA_FREDDA_DEL_SILICIO"
STYLE_CSS="style.css"
EPUB_CSS="epub_style.css"

# Colors for log output
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

log_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1" >&2
}

# Check dependencies
check_dep() {
    if ! command -v "$1" &>/dev/null; then
        log_error "Dependency '$1' is not installed or not in PATH."
        exit 1
    fi
}

check_dep pandoc

# Discover chapter files (chapter_N.md, excludes chapter_N_struttura.md etc.),
# sorted numerically by chapter number.
CHAPTERS=()
shopt -s nullglob
for f in chapter_*.md; do
    [[ "$f" =~ ^chapter_([0-9]+)\.md$ ]] && CHAPTERS+=("$f")
done
shopt -u nullglob

if [ ${#CHAPTERS[@]} -eq 0 ]; then
    log_error "No chapter files found (expected chapter_N.md)."
    exit 1
fi

IFS=$'\n' CHAPTERS=($(printf '%s\n' "${CHAPTERS[@]}" | sort -t_ -k2 -n))
unset IFS

log_info "Found ${#CHAPTERS[@]} chapters: ${CHAPTERS[*]}"

# Create a temporary directory for preprocessed chapters
TMP_DIR=".tmp_chapters"
mkdir -p "$TMP_DIR"
cleanup() {
    rm -rf "$TMP_DIR"
}
trap cleanup EXIT

# Preprocess chapters: strip metadata blocks (from first ``` line to EOF)
PREPROCESSED_CHAPTERS=()
for chapter in "${CHAPTERS[@]}"; do
    cleaned_chapter="${TMP_DIR}/${chapter}"
    # Remove metadata block from ``` to the end of the file
    sed '/^```/,$d' "$chapter" > "$cleaned_chapter"
    PREPROCESSED_CHAPTERS+=("$cleaned_chapter")
done

# Compile EPUB
log_info "Compiling to EPUB..."
EPUB_CMD=(
    pandoc
    -f markdown+raw_html+fenced_divs
    -t epub3
    --toc
    --metadata "title=${BOOK_TITLE}"
    --metadata "author=${AUTHOR}"
    --metadata "lang=${LANG}"
)

if [ -f "cover.jpg" ]; then
    EPUB_CMD+=(--epub-cover-image=cover.jpg)
elif [ -f "cover.png" ]; then
    EPUB_CMD+=(--epub-cover-image=cover.png)
fi

if [ -f "$EPUB_CSS" ]; then
    EPUB_CMD+=(--css="$EPUB_CSS")
fi

EPUB_CMD+=("${PREPROCESSED_CHAPTERS[@]}" -o "${OUTPUT_NAME}.epub")

"${EPUB_CMD[@]}"
log_info "EPUB successfully compiled to ${OUTPUT_NAME}.epub"

# Compile PDF
log_info "Compiling to PDF..."
PDF_CMD=(
    pandoc
    -f markdown+raw_html+fenced_divs
    --toc
    --metadata "title=${BOOK_TITLE}"
    --metadata "author=${AUTHOR}"
    --metadata "lang=${LANG}"
)

# Check for WeasyPrint PDF engine
if command -v weasyprint &>/dev/null; then
    log_info "Using weasyprint PDF engine"
    PDF_CMD+=(--pdf-engine=weasyprint)
else
    log_error "weasyprint not found in PATH. Cannot compile PDF."
    exit 1
fi

if [ -f "$STYLE_CSS" ]; then
    PDF_CMD+=(--css="$STYLE_CSS")
fi

PDF_CMD+=("${PREPROCESSED_CHAPTERS[@]}" -o "${OUTPUT_NAME}.pdf")

"${PDF_CMD[@]}"
log_info "PDF successfully compiled to ${OUTPUT_NAME}.pdf"

# Copy EPUB to Google Drive Rakuten Kobo folder if it exists
KOBO_DIR="/home/alan/googledrive/Rakuten Kobo"
if [ -d "$KOBO_DIR" ]; then
    log_info "Copying EPUB to Google Drive Kobo folder..."
    cp "${OUTPUT_NAME}.epub" "$KOBO_DIR/"
    log_info "EPUB successfully copied to Google Drive."
else
    log_error "Google Drive Kobo directory not found at: $KOBO_DIR"
fi
