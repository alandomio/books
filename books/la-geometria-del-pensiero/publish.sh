#!/bin/bash
# Script to compile 'La Geometria del Pensiero' to PDF and EPUB using Pandoc

set -euo pipefail

# Configuration
BOOK_TITLE="La Geometria del Pensiero"
AUTHOR="Alan Domio"
LANG="it-IT"
OUTPUT_NAME="LA_GEOMETRIA_DEL_PENSIERO"
STYLE_CSS="style.css"
EPUB_CSS="epub_style.css"
TOTAL_CHAPTERS=9

# Colors for log output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

log_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
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

# ─── Chapter existence check ───────────────────────────────────────────────
# The book is planned for TOTAL_CHAPTERS chapters (see PRD.md § 4 Structure).
# Verify which of the expected chapter_N.md files exist before compiling, so
# a partial manuscript can still be published while missing chapters are
# clearly flagged rather than silently skipped.
CHAPTERS=()
MISSING=()
for ((n = 1; n <= TOTAL_CHAPTERS; n++)); do
    f="chapter_${n}.md"
    if [ -f "$f" ]; then
        CHAPTERS+=("$f")
    else
        MISSING+=("$f")
    fi
done

if [ ${#CHAPTERS[@]} -eq 0 ]; then
    log_error "No chapter files found. Expected chapter_1.md .. chapter_${TOTAL_CHAPTERS}.md in $(pwd)."
    exit 1
fi

log_info "Found ${#CHAPTERS[@]}/${TOTAL_CHAPTERS} chapters: ${CHAPTERS[*]}"

if [ ${#MISSING[@]} -gt 0 ]; then
    log_warn "Missing ${#MISSING[@]} chapter(s), publishing a PARTIAL manuscript: ${MISSING[*]}"
    read -r -p "Continue with a partial manuscript? [y/N] " REPLY
    if [[ ! "$REPLY" =~ ^[Yy]$ ]]; then
        log_error "Aborted by user. Complete the missing chapters (./ralph.sh <N>) and retry."
        exit 1
    fi
fi

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

if [ ${#MISSING[@]} -gt 0 ]; then
    log_warn "Reminder: this build is PARTIAL — missing ${MISSING[*]}."
fi

# Copy EPUB to Google Drive Rakuten Kobo folder if it exists
KOBO_DIR="/home/alan/googledrive/Rakuten Kobo"
if [ -d "$KOBO_DIR" ]; then
    log_info "Copying EPUB to Google Drive Kobo folder..."
    cp "${OUTPUT_NAME}.epub" "$KOBO_DIR/"
    log_info "EPUB successfully copied to Google Drive."
else
    log_error "Google Drive Kobo directory not found at: $KOBO_DIR"
fi
