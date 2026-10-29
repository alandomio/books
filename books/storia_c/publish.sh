#!/bin/bash
# ══════════════════════════════════════════════════════════════════════════════
# publish.sh — assemble chapters into a sellable ePub/PDF (Bilingual: IT + SL)
# Adapted from .claude/skills/new-book/scripts/publish.sh for this project's
# dual-file-per-chapter convention (chapter_N_it.md / chapter_N_sl.md), matching
# the precedent set by books/storia_b (CHRONOS_IT.epub / CHRONOS_SL.epub).
# ══════════════════════════════════════════════════════════════════════════════
#
# Usage:
#   ./publish.sh              Build both languages, both formats (4 files)
#   ./publish.sh --epub-only  Build only EPUBs (IT+SL)
#   ./publish.sh --pdf-only   Build only PDFs (IT+SL)
#   ./publish.sh --it-only    Build only the Italian edition
#   ./publish.sh --sl-only    Build only the Slovenian edition
#
# Requires: pandoc, and a PDF engine (default assumes `weasyprint`; see below).
#
# ─── CUSTOMIZE PER PROJECT ────────────────────────────────────────────────────
# 1. PUBLISH_CONFIG.md — Author, Description, and any other pandoc metadata
#    you want on the title page / ebook store listing. Title/Language are
#    read from INSTRUCTION.md so they stay a single source of truth.
#    NOTE: Title is used for BOTH editions here (no separate Slovenian title
#    field yet) — see PUBLISH_CONFIG.md notes if that needs to diverge.
# 2. CHAPTER_GLOB_IT / CHAPTER_GLOB_SL below — this project's chapters are
#    named chapter_N_it.md / chapter_N_sl.md (not chapter_N.md), because the
#    Writer produces two independent authorial drafts per chapter, not a
#    translation — see INSTRUCTION.md § Team → Writer / Linguista.
# 3. PDF_ENGINE below — swap for `xelatex`/`pdflatex` if you want LaTeX-quality
#    typography and have a LaTeX distribution installed; weasyprint (HTML-based)
#    needs nothing extra beyond pandoc and is used here as the zero-setup default.
# 4. Front/back matter — this script has no dedication page, acknowledgments,
#    or author bio by default. Add markdown files to FRONT_MATTER/BACK_MATTER
#    arrays below if the project needs them (per language, if they differ).
# ══════════════════════════════════════════════════════════════════════════════

set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$PROJECT_DIR"

PUBLISH_CONFIG="${PROJECT_DIR}/PUBLISH_CONFIG.md"
INSTRUCTION="${PROJECT_DIR}/INSTRUCTION.md"
COVER="${PROJECT_DIR}/cover.png"
DIST_DIR="${PROJECT_DIR}/dist"
PDF_CSS="${PROJECT_DIR}/style.css"
EPUB_CSS="${PROJECT_DIR}/epub_style.css"

# ─── CUSTOMIZE PER PROJECT: chapter files and PDF engine ─────────────────────
CHAPTER_GLOB_IT="chapter_[0-9]*_it.md"
CHAPTER_GLOB_SL="chapter_[0-9]*_sl.md"
PDF_ENGINE="${PDF_ENGINE:-weasyprint}"
FRONT_MATTER_IT=("00_disclaimer_it.md")
FRONT_MATTER_SL=("00_disclaimer_sl.md")
BACK_MATTER_IT=()    # e.g. BACK_MATTER_IT=("acknowledgments_it.md")
BACK_MATTER_SL=()

DO_EPUB=true
DO_PDF=true
DO_IT=true
DO_SL=true
case "${1:-}" in
  --epub-only) DO_PDF=false ;;
  --pdf-only)  DO_EPUB=false ;;
  --it-only)   DO_SL=false ;;
  --sl-only)   DO_IT=false ;;
esac

log()  { echo "[PUBLISH] $*"; }
err()  { echo "[PUBLISH] ERROR: $*" >&2; }

command -v pandoc >/dev/null || { err "pandoc not found."; exit 1; }
[[ -f "$PUBLISH_CONFIG" ]] || { err "PUBLISH_CONFIG.md not found. Create it first (see SKILL.md Phase 2 Step 2.4)."; exit 1; }
[[ -f "$INSTRUCTION" ]] || { err "INSTRUCTION.md not found."; exit 1; }

field() { grep -m1 -- "\*\*$1:\*\*" "$2" 2>/dev/null | sed -E "s/^.*\*\*$1:\*\* *//"; }

TITLE="$(field Title "$INSTRUCTION")"
AUTHOR="$(field Author "$PUBLISH_CONFIG")"
DESCRIPTION="$(field Description "$PUBLISH_CONFIG")"

[[ -z "$TITLE" ]] && { err "Could not read '**Title:**' from INSTRUCTION.md."; exit 1; }
if [[ -z "$AUTHOR" ]]; then
  log "Warning: no '**Author:**' field in PUBLISH_CONFIG.md — using placeholder 'Unknown'."
  AUTHOR="Unknown"
fi

log "Title: ${TITLE}"
log "Author: ${AUTHOR}"

mkdir -p "$DIST_DIR"

append_with_pagebreak() {
  cat "$1" >> "$2"
  printf '\n\n<div style="page-break-after: always;"></div>\n\n' >> "$2"
}

build_edition() {
  local lang_code="$1"       # it | sl
  local chapter_glob="$2"
  local -n front_matter_ref="$3"
  local -n back_matter_ref="$4"

  local manuscript="${DIST_DIR}/manuscript_${lang_code}.md"
  local metadata="${DIST_DIR}/metadata_${lang_code}.yaml"

  {
    echo "---"
    echo "title: \"${TITLE}\""
    echo "author: \"${AUTHOR}\""
    echo "lang: \"${lang_code}\""
    [[ -n "$DESCRIPTION" ]] && echo "description: \"${DESCRIPTION}\""
    [[ -f "$COVER" ]] && echo "cover-image: \"${COVER}\""
    echo "---"
  } > "$metadata"

  [[ -f "$COVER" ]] || log "Warning (${lang_code}): cover.png not found — building without a cover (run generate_cover.sh first)."

  : > "$manuscript"

  for f in "${front_matter_ref[@]}"; do
    [[ -f "$f" ]] && { log "  [${lang_code}] + (front matter) $f"; append_with_pagebreak "$f" "$manuscript"; }
  done

  shopt -s nullglob
  local chapter_files
  chapter_files=$(ls $chapter_glob 2>/dev/null | grep -vE '_(struttura|old)\.md$' | sort -t_ -k2 -n)
  shopt -u nullglob

  if [[ -z "$chapter_files" ]]; then
    err "No chapter files matched '${chapter_glob}' (excluding *_struttura.md / *_old.md). Skipping ${lang_code} edition."
    return 1
  fi

  for f in $chapter_files; do
    log "  [${lang_code}] + $f"
    append_with_pagebreak "$f" "$manuscript"
  done

  for f in "${back_matter_ref[@]}"; do
    [[ -f "$f" ]] && { log "  [${lang_code}] + (back matter) $f"; append_with_pagebreak "$f" "$manuscript"; }
  done

  if $DO_EPUB; then
    log "Building EPUB (${lang_code})..."
    local epub_css_flag=()
    [[ -f "$EPUB_CSS" ]] && epub_css_flag=(--css="$EPUB_CSS") || log "Warning (${lang_code}): epub_style.css not found — building without HUD box styling."
    pandoc "$metadata" "$manuscript" -o "${DIST_DIR}/book_${lang_code}.epub" --toc --toc-depth=1 "${epub_css_flag[@]}"
    log "EPUB: ${DIST_DIR}/book_${lang_code}.epub"
  fi

  if $DO_PDF; then
    log "Building PDF (${lang_code}, engine: ${PDF_ENGINE})..."
    local pdf_css_flag=()
    [[ -f "$PDF_CSS" ]] && pdf_css_flag=(--css="$PDF_CSS") || log "Warning (${lang_code}): style.css not found — building without HUD box styling."
    pandoc "$metadata" "$manuscript" -o "${DIST_DIR}/book_${lang_code}.pdf" --pdf-engine="$PDF_ENGINE" --toc --toc-depth=1 "${pdf_css_flag[@]}"
    log "PDF: ${DIST_DIR}/book_${lang_code}.pdf"
  fi
}

$DO_IT && build_edition "it" "$CHAPTER_GLOB_IT" FRONT_MATTER_IT BACK_MATTER_IT
$DO_SL && build_edition "sl" "$CHAPTER_GLOB_SL" FRONT_MATTER_SL BACK_MATTER_SL

log "Done. Output in ${DIST_DIR}/"
