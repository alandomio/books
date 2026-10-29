#!/bin/bash
# ══════════════════════════════════════════════════════════════════════════════
# generate_cover.sh — AI-generated book cover artwork + title/author typesetting
# Generic template: copy into the book project directory alongside ralph.sh.
# ══════════════════════════════════════════════════════════════════════════════
#
# Usage:
#   ./generate_cover.sh              Generate cover.png (skips if it already exists)
#   ./generate_cover.sh --force      Regenerate even if cover.png exists
#
# Requires:
#   - codex CLI with the built-in `image_gen` tool (no OPENAI_API_KEY needed for this path)
#   - ImageMagick (`convert`) for the title/author typography overlay
#
# ─── CUSTOMIZE PER PROJECT ────────────────────────────────────────────────────
# 1. PUBLISH_CONFIG.md § Cover Brief — visual style, mood/palette, symbolic
#    elements. This is the actual creative brief; edit it, not this script.
# 2. COVER_WIDTH / COVER_HEIGHT below — default is the standard KDP ebook
#    portrait ratio (1600x2560, 1:1.6). Change for other platforms/trim sizes.
# 3. TITLE_FONT / AUTHOR_FONT below — must be a font ImageMagick can resolve.
#    Run `convert -list font` to see what's installed; install more with your
#    package manager if the genre calls for something specific (serif for
#    literary nonfiction, condensed sans for thriller, etc).
# 4. Title/author vertical position (+0+180 / +0+120 in the `convert` call) —
#    nudge if the generated artwork places its focal point differently.
# ══════════════════════════════════════════════════════════════════════════════

set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$PROJECT_DIR"

PUBLISH_CONFIG="${PROJECT_DIR}/PUBLISH_CONFIG.md"
INSTRUCTION="${PROJECT_DIR}/INSTRUCTION.md"
COVER_ART="${PROJECT_DIR}/cover_art.png"
COVER_FINAL="${PROJECT_DIR}/cover.png"

# ─── CUSTOMIZE PER PROJECT: pixel size (default: KDP ebook portrait, 1:1.6) ──
COVER_WIDTH="${COVER_WIDTH:-1600}"
COVER_HEIGHT="${COVER_HEIGHT:-2560}"

# ─── CUSTOMIZE PER PROJECT: typography ───────────────────────────────────────
TITLE_FONT="${TITLE_FONT:-Georgia-Bold}"
TITLE_COLOR="${TITLE_COLOR:-white}"
TITLE_POINTSIZE="${TITLE_POINTSIZE:-96}"
AUTHOR_FONT="${AUTHOR_FONT:-Georgia}"
AUTHOR_COLOR="${AUTHOR_COLOR:-white}"
AUTHOR_POINTSIZE="${AUTHOR_POINTSIZE:-48}"

FORCE=false
[[ "${1:-}" == "--force" ]] && FORCE=true

log()  { echo "[COVER] $*"; }
err()  { echo "[COVER] ERROR: $*" >&2; }

command -v codex >/dev/null || { err "codex CLI not found."; exit 1; }
command -v convert >/dev/null || { err "ImageMagick 'convert' not found."; exit 1; }

[[ -f "$PUBLISH_CONFIG" ]] || { err "PUBLISH_CONFIG.md not found. Create it first (see SKILL.md Phase 2 Step 2.4)."; exit 1; }
[[ -f "$INSTRUCTION" ]] || { err "INSTRUCTION.md not found."; exit 1; }

if [[ -f "$COVER_FINAL" ]] && ! $FORCE; then
  log "cover.png already exists. Use --force to regenerate."
  exit 0
fi

field() { grep -m1 -- "\*\*$1:\*\*" "$2" 2>/dev/null | sed -E "s/^.*\*\*$1:\*\* *//"; }

TITLE="$(field Title "$INSTRUCTION")"
AUTHOR="$(field Author "$PUBLISH_CONFIG")"

[[ -z "$TITLE" ]] && { err "Could not read '**Title:**' from INSTRUCTION.md."; exit 1; }
[[ -z "$AUTHOR" ]] && log "Warning: no '**Author:**' field in PUBLISH_CONFIG.md — cover will have no author line."

log "Title: ${TITLE} | Author: ${AUTHOR:-<none>}"
log "Generating background artwork via codex image_gen (no text baked in)..."

PROMPT=$(cat <<EOF
Read ${PUBLISH_CONFIG} — section "Cover Brief" (visual style, mood/palette, symbolic elements).
Read ${INSTRUCTION} — § METADATA for the book's title and genre context, for tone only.

Use the built-in image_gen tool to generate ONE book cover BACKGROUND image:
- Aspect ratio matching ${COVER_WIDTH}x${COVER_HEIGHT} (portrait ebook cover)
- Visual style, mood, palette and symbolic elements exactly as specified in PUBLISH_CONFIG.md § Cover Brief
- Absolutely NO text, letters, or typography of any kind baked into the image — title and author are
  composited separately in post-processing, and any AI-rendered text would look wrong and can't be fixed
- Composition should leave visually clear space in the upper third and lower third for text overlay

After generating, move or copy the final selected image to exactly this path: ${COVER_ART}
Then print ONLY: "COVER ART DONE"
EOF
)

printf "%s" "$PROMPT" | codex exec \
  --dangerously-bypass-approvals-and-sandbox \
  --add-dir "$PROJECT_DIR" \
  --ephemeral \
  - >/dev/null 2>&1

if [[ ! -f "$COVER_ART" ]]; then
  err "codex did not produce ${COVER_ART}. Check that the built-in image_gen tool is available in this codex install."
  exit 1
fi

log "Background art: $COVER_ART"
log "Compositing title/author..."

convert "$COVER_ART" \
  -resize "${COVER_WIDTH}x${COVER_HEIGHT}^" -gravity center -extent "${COVER_WIDTH}x${COVER_HEIGHT}" \
  -gravity North -pointsize "$TITLE_POINTSIZE" -font "$TITLE_FONT" -fill "$TITLE_COLOR" \
    -stroke black -strokewidth 2 -annotate +0+180 "$TITLE" \
  -gravity South -pointsize "$AUTHOR_POINTSIZE" -font "$AUTHOR_FONT" -fill "$AUTHOR_COLOR" \
    -stroke black -strokewidth 1 -annotate +0+120 "${AUTHOR:-}" \
  "$COVER_FINAL"

log "Final cover: $COVER_FINAL"
