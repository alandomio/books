#!/bin/bash
# ══════════════════════════════════════════════════════════════════════════════
# publish.sh — assemble storia_c2 chapters into ePub/PDF (Italian, Slovenian)
# Copied from books/storia_c/publish.sh and adapted for storia_c2 (version 2.0):
#   - Italian first (D7): the Slovenian edition contains only the chapters that
#     already have chapter_N_sl.md, which exist only after the Italian chapter
#     was approved;
#   - the teacher appendix (appendice_chapter_N.md, PRD § 4.3) is appended as
#     back matter of the Italian edition;
#   - a per-edition identifier and the version go into the pandoc metadata;
#   - images referenced by chapters are resolved from this folder.
# ══════════════════════════════════════════════════════════════════════════════
#
# Usage:
#   ./publish.sh              Build both languages, both formats
#   ./publish.sh --epub-only  Build only EPUBs
#   ./publish.sh --pdf-only   Build only PDFs
#   ./publish.sh --it-only    Build only the Italian edition
#   ./publish.sh --sl-only    Build only the Slovenian edition
#
# Requires: pandoc, and a PDF engine (default weasyprint).
#
# Per-book settings live in INSTRUCTION.md (Title, Version) and PUBLISH_CONFIG.md
# (Author, Description, Slovenian title); edit those, not this script.
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
BOOK_ID="chronos-seconda-media-storia_c2"

PDF_ENGINE="${PDF_ENGINE:-weasyprint}"
# Used through a nameref in build_edition, which shellcheck cannot follow.
# shellcheck disable=SC2034
FRONT_MATTER_IT=("00_disclaimer_it.md")
# shellcheck disable=SC2034
FRONT_MATTER_SL=("00_disclaimer_sl.md")

DO_EPUB=true
DO_PDF=true
DO_IT=true
DO_SL=true
case "${1:-}" in
  --epub-only) DO_PDF=false ;;
  --pdf-only)  DO_EPUB=false ;;
  --it-only)   DO_SL=false ;;
  --sl-only)   DO_IT=false ;;
  "") ;;
  *) echo "Usage: ./publish.sh [--epub-only|--pdf-only|--it-only|--sl-only]" >&2; exit 1 ;;
esac

log()  { echo "[PUBLISH] $*"; }
err()  { echo "[PUBLISH] ERROR: $*" >&2; }

command -v pandoc >/dev/null || { err "pandoc not found."; exit 1; }
[[ -f "$PUBLISH_CONFIG" ]] || { err "PUBLISH_CONFIG.md not found."; exit 1; }
[[ -f "$INSTRUCTION" ]] || { err "INSTRUCTION.md not found."; exit 1; }

field() { grep -m1 -- "\*\*$1:\*\*" "$2" 2>/dev/null | sed -E "s/^.*\*\*$1:\*\* *//" || true; }

TITLE_IT="$(field Title "$INSTRUCTION")"
VERSION="$(field Version "$INSTRUCTION")"
TITLE_SL="$(field "Title SL" "$PUBLISH_CONFIG")"
AUTHOR="$(field Author "$PUBLISH_CONFIG")"
DESCRIPTION_IT="$(field Description "$PUBLISH_CONFIG")"
DESCRIPTION_SL="$(field "Description SL" "$PUBLISH_CONFIG")"

if [[ -z "$TITLE_IT" ]]; then
  err "Could not read '**Title:**' from INSTRUCTION.md."
  exit 1
fi
[[ -n "$TITLE_SL" ]] || TITLE_SL="$TITLE_IT"
[[ -n "$DESCRIPTION_SL" ]] || DESCRIPTION_SL="$DESCRIPTION_IT"
if [[ -z "$AUTHOR" ]]; then
  log "Warning: no '**Author:**' field in PUBLISH_CONFIG.md — using placeholder 'Unknown'."
  AUTHOR="Unknown"
fi

log "Title (it): ${TITLE_IT}"
log "Title (sl): ${TITLE_SL}"
log "Version: ${VERSION:-<none>} | Author: ${AUTHOR}"

mkdir -p "$DIST_DIR"

append_with_pagebreak() {
  cat "$1" >> "$2"
  printf '\n\n<div style="page-break-after: always;"></div>\n\n' >> "$2"
}

# Print files matching "<prefix><N><suffix>" sorted by chapter number N.
sorted_by_chapter() {
  local prefix="$1" suffix="$2" f n
  local -a found=()
  shopt -s nullglob
  for f in "${prefix}"[0-9]*"${suffix}"; do
    n="${f#"$prefix"}"
    n="${n%"$suffix"}"
    [[ "$n" =~ ^[0-9]+$ ]] && found+=("${n} ${f}")
  done
  shopt -u nullglob
  [[ ${#found[@]} -gt 0 ]] || return 0
  printf '%s\n' "${found[@]}" | sort -n | cut -d' ' -f2-
}

build_edition() {
  local lang_code="$1" title="$2" description="$3"
  local -n front_matter_ref="$4"
  local manuscript="${DIST_DIR}/manuscript_${lang_code}.md"
  local metadata="${DIST_DIR}/metadata_${lang_code}.yaml"
  local -a chapters=() appendices=()
  local f

  mapfile -t chapters < <(sorted_by_chapter "chapter_" "_${lang_code}.md")
  if [[ ${#chapters[@]} -eq 0 ]]; then
    err "No chapter_N_${lang_code}.md files found. Skipping the ${lang_code} edition."
    return 0
  fi

  {
    echo "---"
    echo "title: \"${title}\""
    echo "author: \"${AUTHOR}\""
    echo "lang: \"${lang_code}\""
    echo "identifier: \"${BOOK_ID}-${lang_code}\""
    [[ -n "$VERSION" ]] && echo "version: \"${VERSION}\""
    [[ -n "$description" ]] && echo "description: \"${description}\""
    [[ -f "$COVER" ]] && echo "cover-image: \"${COVER}\""
    echo "---"
  } > "$metadata"

  [[ -f "$COVER" ]] || log "Warning (${lang_code}): cover.png not found — building without a cover (run generate_cover.sh first)."

  : > "$manuscript"
  for f in "${front_matter_ref[@]}"; do
    if [[ -f "$f" ]]; then
      log "  [${lang_code}] + (front matter) $f"
      append_with_pagebreak "$f" "$manuscript"
    fi
  done
  for f in "${chapters[@]}"; do
    log "  [${lang_code}] + $f"
    append_with_pagebreak "$f" "$manuscript"
  done
  if [[ "$lang_code" == "it" ]]; then
    mapfile -t appendices < <(sorted_by_chapter "appendice_chapter_" ".md")
    for f in "${appendices[@]}"; do
      log "  [it] + (teacher appendix) $f"
      append_with_pagebreak "$f" "$manuscript"
    done
  fi

  local -a css_flag=()
  if $DO_EPUB; then
    log "Building EPUB (${lang_code})..."
    css_flag=()
    if [[ -f "$EPUB_CSS" ]]; then css_flag=(--css="$EPUB_CSS"); else log "Warning: epub_style.css not found."; fi
    pandoc "$metadata" "$manuscript" -o "${DIST_DIR}/book_${lang_code}.epub" \
      --resource-path="$PROJECT_DIR" --toc --toc-depth=1 "${css_flag[@]}"
    log "EPUB: ${DIST_DIR}/book_${lang_code}.epub"
  fi
  if $DO_PDF; then
    log "Building PDF (${lang_code}, engine: ${PDF_ENGINE})..."
    css_flag=()
    if [[ -f "$PDF_CSS" ]]; then css_flag=(--css="$PDF_CSS"); else log "Warning: style.css not found."; fi
    pandoc "$metadata" "$manuscript" -o "${DIST_DIR}/book_${lang_code}.pdf" \
      --resource-path="$PROJECT_DIR" --pdf-engine="$PDF_ENGINE" --toc --toc-depth=1 "${css_flag[@]}"
    log "PDF: ${DIST_DIR}/book_${lang_code}.pdf"
  fi
}

if $DO_IT; then build_edition "it" "$TITLE_IT" "$DESCRIPTION_IT" FRONT_MATTER_IT; fi
if $DO_SL; then build_edition "sl" "$TITLE_SL" "$DESCRIPTION_SL" FRONT_MATTER_SL; fi

log "Done. Output in ${DIST_DIR}/"
