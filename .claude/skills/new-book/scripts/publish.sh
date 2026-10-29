#!/bin/bash
# ══════════════════════════════════════════════════════════════════════════════
# publish.sh — assemble chapters into a sellable ePub/PDF
# Generic template: copy into the book project directory alongside ralph.sh.
# ══════════════════════════════════════════════════════════════════════════════
#
# Usage:
#   ./publish.sh              Build both dist/book.epub and dist/book.pdf
#   ./publish.sh --epub-only  Build only the EPUB
#   ./publish.sh --pdf-only   Build only the PDF
#
# Requires: pandoc, and a PDF engine (default assumes `weasyprint`; see below).
#
# ─── CUSTOMIZE PER PROJECT ────────────────────────────────────────────────────
# 1. PUBLISH_CONFIG.md — Author, Description, and any other pandoc metadata
#    you want on the title page / ebook store listing. Title/Language are
#    read from INSTRUCTION.md so they stay a single source of truth.
# 2. CHAPTER_GLOB below — if chapters aren't named chapter_N.md, or if you
#    need a different reading order (e.g. front matter before chapter_1.md),
#    edit the file list assembly loop instead of relying on the glob+sort.
# 3. PDF_ENGINE below — swap for `xelatex`/`pdflatex` if you want LaTeX-quality
#    typography and have a LaTeX distribution installed; weasyprint (HTML-based)
#    needs nothing extra beyond pandoc and is used here as the zero-setup default.
# 4. Front/back matter — this script has no dedication page, acknowledgments,
#    or author bio by default. Add markdown files to FRONT_MATTER/BACK_MATTER
#    arrays below if the project needs them.
# ══════════════════════════════════════════════════════════════════════════════

set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$PROJECT_DIR"

PUBLISH_CONFIG="${PROJECT_DIR}/PUBLISH_CONFIG.md"
INSTRUCTION="${PROJECT_DIR}/INSTRUCTION.md"
COVER="${PROJECT_DIR}/cover.png"
DIST_DIR="${PROJECT_DIR}/dist"

# ─── CUSTOMIZE PER PROJECT: chapter files and PDF engine ─────────────────────
CHAPTER_GLOB="chapter_[0-9]*.md"
PDF_ENGINE="${PDF_ENGINE:-weasyprint}"
FRONT_MATTER=()   # e.g. FRONT_MATTER=("dedication.md")
BACK_MATTER=()    # e.g. BACK_MATTER=("acknowledgments.md" "about_the_author.md")

DO_EPUB=true
DO_PDF=true
case "${1:-}" in
  --epub-only) DO_PDF=false ;;
  --pdf-only)  DO_EPUB=false ;;
esac

log()  { echo "[PUBLISH] $*"; }
err()  { echo "[PUBLISH] ERROR: $*" >&2; }

command -v pandoc >/dev/null || { err "pandoc not found."; exit 1; }
[[ -f "$PUBLISH_CONFIG" ]] || { err "PUBLISH_CONFIG.md not found. Create it first (see SKILL.md Phase 2 Step 2.4)."; exit 1; }
[[ -f "$INSTRUCTION" ]] || { err "INSTRUCTION.md not found."; exit 1; }

field() { grep -m1 -- "\*\*$1:\*\*" "$2" 2>/dev/null | sed -E "s/^.*\*\*$1:\*\* *//"; }

TITLE="$(field Title "$INSTRUCTION")"
AUTHOR="$(field Author "$PUBLISH_CONFIG")"
LANGUAGE="$(field Language "$INSTRUCTION")"
DESCRIPTION="$(field Description "$PUBLISH_CONFIG")"

[[ -z "$TITLE" ]] && { err "Could not read '**Title:**' from INSTRUCTION.md."; exit 1; }
if [[ -z "$AUTHOR" ]]; then
  log "Warning: no '**Author:**' field in PUBLISH_CONFIG.md — using placeholder 'Unknown'."
  AUTHOR="Unknown"
fi

LANG_CODE="it"
[[ "$LANGUAGE" =~ [Ee]nglish ]] && LANG_CODE="en"

log "Title: ${TITLE}"
log "Author: ${AUTHOR}"
log "Language: ${LANG_CODE}"

mkdir -p "$DIST_DIR"
MANUSCRIPT="${DIST_DIR}/manuscript.md"
METADATA="${DIST_DIR}/metadata.yaml"

{
  echo "---"
  echo "title: \"${TITLE}\""
  echo "author: \"${AUTHOR}\""
  echo "lang: \"${LANG_CODE}\""
  [[ -n "$DESCRIPTION" ]] && echo "description: \"${DESCRIPTION}\""
  [[ -f "$COVER" ]] && echo "cover-image: \"${COVER}\""
  echo "---"
} > "$METADATA"

[[ -f "$COVER" ]] || log "Warning: cover.png not found — building without a cover (run generate_cover.sh first)."

: > "$MANUSCRIPT"

append_with_pagebreak() {
  cat "$1" >> "$MANUSCRIPT"
  printf '\n\n<div style="page-break-after: always;"></div>\n\n' >> "$MANUSCRIPT"
}

for f in "${FRONT_MATTER[@]}"; do
  [[ -f "$f" ]] && { log "  + (front matter) $f"; append_with_pagebreak "$f"; }
done

shopt -s nullglob
CHAPTER_FILES=$(ls $CHAPTER_GLOB 2>/dev/null | grep -vE '_(struttura|old)\.md$' | sort -t_ -k2 -n)
shopt -u nullglob

if [[ -z "$CHAPTER_FILES" ]]; then
  err "No chapter files matched '${CHAPTER_GLOB}' (excluding *_struttura.md / *_old.md)."
  exit 1
fi

for f in $CHAPTER_FILES; do
  log "  + $f"
  append_with_pagebreak "$f"
done

for f in "${BACK_MATTER[@]}"; do
  [[ -f "$f" ]] && { log "  + (back matter) $f"; append_with_pagebreak "$f"; }
done

if $DO_EPUB; then
  log "Building EPUB..."
  pandoc "$METADATA" "$MANUSCRIPT" -o "${DIST_DIR}/book.epub" --toc --toc-depth=1
  log "EPUB: ${DIST_DIR}/book.epub"
fi

if $DO_PDF; then
  log "Building PDF (engine: ${PDF_ENGINE})..."
  pandoc "$METADATA" "$MANUSCRIPT" -o "${DIST_DIR}/book.pdf" --pdf-engine="$PDF_ENGINE" --toc --toc-depth=1
  log "PDF: ${DIST_DIR}/book.pdf"
fi

log "Done. Output in ${DIST_DIR}/"
