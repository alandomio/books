#!/bin/bash
# ══════════════════════════════════════════════════════════════════════════════
# generate_cover.sh — storia_c2 cover from a REAL public-domain image + title
# Copied from books/storia_c/generate_cover.sh and adapted to decision D5:
# no invented illustrations. The cover starts from a real public-domain image
# (a scan or photo listed in IMAGES.md, downloaded by a person to the path in
# PUBLISH_CONFIG.md "Base image"). By default the script only resizes it and
# sets the title and author with ImageMagick: no model is called.
# With --ai, codex may clean, crop or recolour that same image, adding nothing
# the image does not show (the captain: "con base di una foto vera, senza
# inventare niente"). --ai calls a real model and costs tokens: use it once,
# on purpose, never to test the script.
# ══════════════════════════════════════════════════════════════════════════════
#
# Usage:
#   ./generate_cover.sh              Build cover.png from the base image (no model)
#   ./generate_cover.sh --force      Rebuild even if cover.png exists
#   ./generate_cover.sh --ai         Let codex adapt the base image first (costs tokens)
#   ./generate_cover.sh --ai --force
#
# Requires: ImageMagick (convert); for --ai also the codex CLI with image tools.
# ══════════════════════════════════════════════════════════════════════════════

set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$PROJECT_DIR"

PUBLISH_CONFIG="${PROJECT_DIR}/PUBLISH_CONFIG.md"
INSTRUCTION="${PROJECT_DIR}/INSTRUCTION.md"
COVER_ART="${PROJECT_DIR}/cover_art.png"
COVER_FINAL="${PROJECT_DIR}/cover.png"

COVER_WIDTH="${COVER_WIDTH:-1600}"
COVER_HEIGHT="${COVER_HEIGHT:-2560}"
TITLE_FONT="${TITLE_FONT:-Georgia-Bold}"
TITLE_COLOR="${TITLE_COLOR:-white}"
TITLE_POINTSIZE="${TITLE_POINTSIZE:-96}"
AUTHOR_FONT="${AUTHOR_FONT:-Georgia}"
AUTHOR_COLOR="${AUTHOR_COLOR:-white}"
AUTHOR_POINTSIZE="${AUTHOR_POINTSIZE:-48}"

FORCE=false
USE_AI=false
for arg in "$@"; do
  case "$arg" in
    --force) FORCE=true ;;
    --ai)    USE_AI=true ;;
    *) echo "Usage: ./generate_cover.sh [--force] [--ai]" >&2; exit 1 ;;
  esac
done

log()  { echo "[COVER] $*"; }
err()  { echo "[COVER] ERROR: $*" >&2; }

command -v convert >/dev/null || { err "ImageMagick 'convert' not found."; exit 1; }
[[ -f "$PUBLISH_CONFIG" ]] || { err "PUBLISH_CONFIG.md not found."; exit 1; }
[[ -f "$INSTRUCTION" ]] || { err "INSTRUCTION.md not found."; exit 1; }

if [[ -f "$COVER_FINAL" ]] && ! $FORCE; then
  log "cover.png already exists. Use --force to regenerate."
  exit 0
fi

field() { grep -m1 -- "\*\*$1:\*\*" "$2" 2>/dev/null | sed -E "s/^.*\*\*$1:\*\* *//" || true; }

TITLE="$(field Title "$INSTRUCTION")"
AUTHOR="$(field Author "$PUBLISH_CONFIG")"
BASE_IMAGE="$(field "Base image" "$PUBLISH_CONFIG")"
BASE_CREDIT="$(field "Base image credit" "$PUBLISH_CONFIG")"

if [[ -z "$TITLE" ]]; then
  err "Could not read '**Title:**' from INSTRUCTION.md."
  exit 1
fi
if [[ -z "$BASE_IMAGE" || "$BASE_IMAGE" == "<"* ]]; then
  err "No '**Base image:**' set in PUBLISH_CONFIG.md. Choose a real public-domain image (see IMAGES.md), download it into this folder and write its file name there."
  exit 1
fi
BASE_PATH="${PROJECT_DIR}/${BASE_IMAGE}"
if [[ ! -f "$BASE_PATH" ]]; then
  err "Base image not found: ${BASE_PATH}"
  exit 1
fi
if [[ -z "$BASE_CREDIT" || "$BASE_CREDIT" == "<"* ]]; then
  err "No '**Base image credit:**' in PUBLISH_CONFIG.md: every image in the book needs its source (D5)."
  exit 1
fi
[[ -z "$AUTHOR" ]] && log "Warning: no '**Author:**' field in PUBLISH_CONFIG.md — cover will have no author line."

log "Title: ${TITLE} | Author: ${AUTHOR:-<none>}"
log "Base image: ${BASE_IMAGE} (${BASE_CREDIT})"

if $USE_AI; then
  command -v codex >/dev/null || { err "codex CLI not found (needed only for --ai)."; exit 1; }
  log "Adapting the base image with codex (real model call, costs tokens)..."
  PROMPT=$(cat <<EOF
Read ${PUBLISH_CONFIG}, section "Cover Brief".
Start from this real public-domain image and ONLY from it: ${BASE_PATH}
Allowed: crop or extend the frame with plain background, clean stains and scan noise, adjust contrast and colour toward the palette of the Cover Brief.
Forbidden: adding any object, person, building, text, letter, symbol or detail that is not in the original image; changing what the image shows.
Leave visually clear space in the upper and lower third for the title and author, which are set later.
Save the result to exactly this path: ${COVER_ART}
Then print ONLY: "COVER ART DONE"
EOF
)
  rm -f "$COVER_ART"
  printf "%s" "$PROMPT" | codex exec \
    --dangerously-bypass-approvals-and-sandbox \
    --add-dir "$PROJECT_DIR" \
    --ephemeral \
    - >/dev/null 2>&1
  if [[ ! -f "$COVER_ART" ]]; then
    err "codex did not produce ${COVER_ART}."
    exit 1
  fi
  SOURCE_IMAGE="$COVER_ART"
else
  SOURCE_IMAGE="$BASE_PATH"
fi

log "Compositing title/author over ${SOURCE_IMAGE##*/}..."
convert "$SOURCE_IMAGE" \
  -resize "${COVER_WIDTH}x${COVER_HEIGHT}^" -gravity center -extent "${COVER_WIDTH}x${COVER_HEIGHT}" \
  -gravity North -pointsize "$TITLE_POINTSIZE" -font "$TITLE_FONT" -fill "$TITLE_COLOR" \
    -stroke black -strokewidth 2 -annotate +0+180 "$TITLE" \
  -gravity South -pointsize "$AUTHOR_POINTSIZE" -font "$AUTHOR_FONT" -fill "$AUTHOR_COLOR" \
    -stroke black -strokewidth 1 -annotate +0+120 "${AUTHOR:-}" \
  "$COVER_FINAL"

log "Final cover: $COVER_FINAL"
log "Remember the credit line in the teacher appendix: ${BASE_CREDIT}"
