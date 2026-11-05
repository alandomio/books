#!/bin/bash
# ══════════════════════════════════════════════════════════════════════════════
# ralph.sh — Ralph Loop for storia_c2 (CHRONOS, seconda media, new version)
# Derived from books/storia_c/ralph.sh. Every stage prompt follows storia_c2's
# own PRD.md, STYLE_BIBLE.md and decisions D1-D9 (5 November 2026):
#   ~3,000-word chapters (2,800-3,300) with a fixed six-part shape, a light
#   Alex/Maja mystery thread (MYSTERY.md), real public-domain images only
#   (IMAGES.md), Italian first, Slovenian as a light adaptation only after the
#   Italian chapter is approved, checks.sh as a hard gate in the Editor stage.
# Requires bash 4.0+.
# ══════════════════════════════════════════════════════════════════════════════
#
# Usage:
#   ./ralph.sh <chapter>                Italian pipeline; continues to the Slovenian
#                                       adaptation only if chapter_<N>_it.approved exists
#   ./ralph.sh <chapter> plan           Print the stage plan (no model is called)
#   ./ralph.sh <chapter> architect      Architect only (chapter_<N>_struttura.md)
#   ./ralph.sh <chapter> researcher     Extend the dossier with the gaps the struttura lists
#   ./ralph.sh <chapter> photo          Photo researcher (images_chapter_<N>.md)
#   ./ralph.sh <chapter> writer         Writer Stage 1 + 2 (Italian)
#   ./ralph.sh <chapter> writer1        Writer Stage 1 only (draft_prose_<N>_it.md)
#   ./ralph.sh <chapter> writer2        Writer Stage 2 only (chapter + teacher appendix)
#   ./ralph.sh <chapter> editor         Editor with checks.sh hard gate and retry loop
#   ./ralph.sh <chapter> repair         Targeted repair after an Editor FAIL
#   ./ralph.sh <chapter> reviewer       Reviewer (Italian) + chapter_index.md
#   ./ralph.sh <chapter> linguista      Slovenian light adaptation (needs approval marker)
#   ./ralph.sh <chapter> status         Show pipeline state for chapter N
#   ./ralph.sh review_all               Review every existing Italian chapter
#
# Flags:
#   --force                  Re-run phase even if output files already exist
#   --model <model[:level]>  Override model for all phases
#   --reasoning <level>      Override reasoning for all phases (medium|high|xhigh)
#   --phase-model P=SPEC     Override one phase, e.g. architect=gpt-5.5:xhigh
#   --dry-run                Show what would run without calling any model
#
# Approval gate (D7, D8): after the test reader has read the Italian chapter and the
# captain approves it, create chapter_<N>_it.approved (any content, e.g. date and notes).
# Only then does the linguista phase write chapter_<N>_sl.md.
# ══════════════════════════════════════════════════════════════════════════════

set -euo pipefail

# EDITING WARNING (same bug class as storia_c/ralph.sh): every PROMPT below is an
# UNQUOTED heredoc so that ${VAR} expands. Backticks inside a prompt are command
# substitution. Never use backtick code spans inside a PROMPT block, and run
# bash -n ralph.sh and shellcheck ralph.sh after editing any prompt.

if [[ "${BASH_VERSION%%.*}" -lt 4 ]]; then
  echo "Error: ralph.sh requires bash 4.0+. Your bash: ${BASH_VERSION}"
  exit 1
fi

# ─── LOGGING (defined first: argument parsing already reports errors) ──────
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'
BLUE='\033[0;34m'; CYAN='\033[0;36m'; BOLD='\033[1m'; DIM='\033[2m'; NC='\033[0m'

log()     { echo -e "${BLUE}[RALPH]${NC} $*"; }
ok()      { echo -e "${GREEN}[✓]${NC} $*"; }
warn()    { echo -e "${YELLOW}[!]${NC} $*"; }
err()     { echo -e "${RED}[✗]${NC} $*" >&2; }
info()    { echo -e "${DIM}    $*${NC}"; }
divider() { echo -e "\n${BOLD}${CYAN}══════════════════════════════════════════════════════════${NC}"; \
            echo -e "${BOLD}${CYAN}  $*${NC}"; \
            echo -e "${BOLD}${CYAN}══════════════════════════════════════════════════════════${NC}\n"; }

# ─── CONFIG ────────────────────────────────────────────────────────────────
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MAX_RETRIES=3
DEFAULT_MODEL_KEY="sonnet"
DEFAULT_REASONING_LEVEL="high"
LOG_DIR="${PROJECT_DIR}/.ralph_logs"
OUTPUT_FILE="${PROJECT_DIR}/.ralph_output"

declare -A MODEL_TO_AGENT=(
  [haiku]="claude"
  [sonnet]="claude"
  [opus]="claude"
  [gemini-flash-3.6]="agy"
  [gemini-flash-3.7]="agy"
  [gemini-flash-3.8]="agy"
  [gpt-5.6]="codex"
  [gpt-5.6-sol]="codex"
  [gpt-5.5]="codex"
)

declare -A MODEL_TO_PROVIDER_MODEL=(
  [haiku]="haiku"
  [sonnet]="claude-sonnet-5"
  [opus]="opus"
  [gpt-5.6]="gpt-5.6"
  [gpt-5.6-sol]="gpt-5.6-sol"
  [gpt-5.5]="gpt-5.5"
)

declare -A MODEL_TO_DISPLAY_NAME=(
  [haiku]="Haiku"
  [sonnet]="Sonnet 5"
  [opus]="Opus"
  [gemini-flash-3.6]="Gemini Flash 3.6"
  [gemini-flash-3.7]="Gemini Flash 3.7"
  [gemini-flash-3.8]="Gemini Flash 3.8"
  [gpt-5.6]="GPT 5.6"
  [gpt-5.6-sol]="GPT 5.6 Sol"
  [gpt-5.5]="GPT 5.5"
)

declare -A PHASE_MODEL_KEYS=()
declare -A PHASE_REASONING_LEVELS=()
PIPELINE_PHASES=(architect researcher photo writer1 writer2 repair editor reviewer linguista)

# ─── ARGS ──────────────────────────────────────────────────────────────────
usage() {
  echo "Usage: ./ralph.sh <chapter_number|review_all> [phase] [--force] [--dry-run] [--model <model[:level]>] [--reasoning <level>] [--phase-model <phase=model[:level]>]"
  echo "Phases: all | plan | architect | researcher | photo | writer | writer1 | writer2 | editor | repair | reviewer | linguista | status"
}

if [[ $# -lt 1 ]]; then
  usage
  exit 1
fi

CHAPTER="${1}"
PHASE="all"
FORCE=false
DRY_RUN=false

if [[ "$CHAPTER" != "review_all" && ! "$CHAPTER" =~ ^([0-9]|1[0-2])$ ]]; then
  err "Chapter must be a number from 0 to 12 (or review_all), got: ${CHAPTER}"
  exit 1
fi

PARSED_MODEL_KEY=""
PARSED_REASONING_LEVEL=""
RESOLVED_REASONING=""
RESOLVED_AGENT=""
RESOLVED_PROVIDER_MODEL=""
RESOLVED_DISPLAY_NAME=""

normalize_model_key() {
  local raw="${1,,}"
  raw="${raw// /}"
  case "$raw" in
    haiku|claude-haiku) echo "haiku" ;;
    sonnet|claude-sonnet) echo "sonnet" ;;
    opus|claude-opus) echo "opus" ;;
    gemini-flash-3.6|gemini-3.6-flash) echo "gemini-flash-3.6" ;;
    gemini-flash-3.7|gemini-3.7-flash) echo "gemini-flash-3.7" ;;
    gemini-flash-3.8|gemini-3.8-flash) echo "gemini-flash-3.8" ;;
    gpt-5.5|gpt5.5) echo "gpt-5.5" ;;
    gpt-5.6|gpt5.6) echo "gpt-5.6" ;;
    gpt-5.6-sol|gpt5.6sol) echo "gpt-5.6-sol" ;;
    *)
      err "Unsupported model: $1"
      err "Supported models: haiku | sonnet | opus | gemini-flash-3.6 | gemini-flash-3.7 | gemini-flash-3.8 | gpt-5.5 | gpt-5.6 | gpt-5.6-sol"
      exit 1
      ;;
  esac
}

normalize_reasoning_level() {
  local raw="${1,,}"
  case "$raw" in
    medium|med) echo "medium" ;;
    high) echo "high" ;;
    xhigh|x-high|max) echo "xhigh" ;;
    *)
      err "Unsupported reasoning level: $1 (supported: medium | high | xhigh)"
      exit 1
      ;;
  esac
}

init_phase_model_defaults() {
  local phase
  for phase in "${PIPELINE_PHASES[@]}"; do
    PHASE_MODEL_KEYS["$phase"]="$DEFAULT_MODEL_KEY"
    PHASE_REASONING_LEVELS["$phase"]="$DEFAULT_REASONING_LEVEL"
  done
  # Same cost/quality split as storia_c: structure and review at max effort,
  # search-grounded research on Gemini Flash, first-draft prose on Opus.
  PHASE_MODEL_KEYS["architect"]="gpt-5.6-sol";  PHASE_REASONING_LEVELS["architect"]="xhigh"
  PHASE_MODEL_KEYS["researcher"]="gemini-flash-3.8"; PHASE_REASONING_LEVELS["researcher"]="medium"
  PHASE_MODEL_KEYS["photo"]="gemini-flash-3.8"; PHASE_REASONING_LEVELS["photo"]="medium"
  PHASE_MODEL_KEYS["writer1"]="opus";           PHASE_REASONING_LEVELS["writer1"]="medium"
  PHASE_REASONING_LEVELS["writer2"]="medium"
  PHASE_MODEL_KEYS["reviewer"]="opus";          PHASE_REASONING_LEVELS["reviewer"]="xhigh"
}

parse_model_spec() {
  local spec="$1"
  PARSED_MODEL_KEY="$(normalize_model_key "${spec%%:*}")"
  if [[ "$spec" == *:* ]]; then
    PARSED_REASONING_LEVEL="$(normalize_reasoning_level "${spec#*:}")"
  else
    PARSED_REASONING_LEVEL=""
  fi
}

apply_phase_model_spec() {
  local phase_selector="$1" spec="$2" phase
  local target_phases=()
  parse_model_spec "$spec"
  case "$phase_selector" in
    all) target_phases=("${PIPELINE_PHASES[@]}") ;;
    writer) target_phases=(writer1 writer2) ;;
    review_all|reviewer) target_phases=(reviewer) ;;
    architect|researcher|photo|writer1|writer2|repair|editor|linguista) target_phases=("$phase_selector") ;;
    *) err "Unsupported phase selector for --phase-model: $phase_selector"; exit 1 ;;
  esac
  for phase in "${target_phases[@]}"; do
    PHASE_MODEL_KEYS["$phase"]="$PARSED_MODEL_KEY"
    [[ -n "$PARSED_REASONING_LEVEL" ]] && PHASE_REASONING_LEVELS["$phase"]="$PARSED_REASONING_LEVEL"
  done
  return 0
}

apply_global_reasoning() {
  local reasoning phase
  reasoning="$(normalize_reasoning_level "$1")"
  for phase in "${PIPELINE_PHASES[@]}"; do
    PHASE_REASONING_LEVELS["$phase"]="$reasoning"
  done
}

describe_phase_model() {
  local phase="$1"
  local model_key="${PHASE_MODEL_KEYS[$phase]}"
  echo "${MODEL_TO_DISPLAY_NAME[$model_key]} / ${PHASE_REASONING_LEVELS[$phase]} via ${MODEL_TO_AGENT[$model_key]}"
}

init_phase_model_defaults

if [[ "${CHAPTER}" == "review_all" ]]; then
  PHASE="review_all"
fi

shift
while [[ $# -gt 0 ]]; do
  case "$1" in
    all|plan|architect|researcher|photo|writer|writer1|writer2|repair|editor|reviewer|linguista|status)
      PHASE="$1"; shift ;;
    --force)     FORCE=true; shift ;;
    --dry-run)   DRY_RUN=true; shift ;;
    --model)     apply_phase_model_spec "all" "${2:?--model requires a value}"; shift 2 ;;
    --reasoning) apply_global_reasoning "${2:?--reasoning requires a value}"; shift 2 ;;
    --phase-model)
      phase_override="${2:?--phase-model requires <phase>=<model[:level]>}"
      if [[ "$phase_override" != *=* ]]; then
        err "--phase-model requires <phase>=<model[:level]>"
        exit 1
      fi
      apply_phase_model_spec "${phase_override%%=*}" "${phase_override#*=}"
      shift 2
      ;;
    *) err "Unknown argument: $1"; usage; exit 1 ;;
  esac
done

# ─── FILE PATHS ────────────────────────────────────────────────────────────
PRD="${PROJECT_DIR}/PRD.md"
STYLE_BIBLE="${PROJECT_DIR}/STYLE_BIBLE.md"
MYSTERY="${PROJECT_DIR}/MYSTERY.md"
IMAGES="${PROJECT_DIR}/IMAGES.md"
README="${PROJECT_DIR}/README.md"
CHECKS="${PROJECT_DIR}/checks.sh"
# storia_c's human blueprint stays a content reference only (PRD § 4.1): its scene
# counts, 4,000-word floor and SCANNING-heavy shape do NOT apply here.
WRITING_PLAN_REF="${PROJECT_DIR}/../storia_c/writing_plan.md"
GLOSSARY="${PROJECT_DIR}/NARRATIVE_GLOSSARY.md"
CHAPTER_INDEX="${PROJECT_DIR}/chapter_index.md"
ACTIVITY="${PROJECT_DIR}/activity.md"
BOOK_REWRITE_PLAN="${PROJECT_DIR}/BOOK_REWRITE_PLAN.md"

set_chapter_paths() {
  STRUTTURA="${PROJECT_DIR}/chapter_${CHAPTER}_struttura.md"
  DOSSIER="${PROJECT_DIR}/dossier_chapter_${CHAPTER}.md"
  IMAGES_CHAPTER="${PROJECT_DIR}/images_chapter_${CHAPTER}.md"
  DRAFT_PROSE_IT="${PROJECT_DIR}/draft_prose_${CHAPTER}_it.md"
  CHAPTER_FILE_IT="${PROJECT_DIR}/chapter_${CHAPTER}_it.md"
  APPENDIX="${PROJECT_DIR}/appendice_chapter_${CHAPTER}.md"
  APPROVAL="${PROJECT_DIR}/chapter_${CHAPTER}_it.approved"
  CHAPTER_FILE_SL="${PROJECT_DIR}/chapter_${CHAPTER}_sl.md"
  LINGUISTA_NOTE="${PROJECT_DIR}/linguista_note_${CHAPTER}.md"
  FEEDBACK="${PROJECT_DIR}/feedback_loop_${CHAPTER}.md"
  REVIEW="${PROJECT_DIR}/review_chapter_${CHAPTER}.md"
  REWRITE_PLAN="${PROJECT_DIR}/rewrite_plan_chapter_${CHAPTER}.md"
}
set_chapter_paths

# ─── HELPERS ───────────────────────────────────────────────────────────────
file_exists()  { [[ -f "$1" ]]; }
should_run()   { ! file_exists "$1" || $FORCE; }
timestamp()    { date '+%Y-%m-%d %H:%M:%S'; }
is_chapter_zero() { [[ "$CHAPTER" == "0" ]]; }

log_run() {
  $DRY_RUN || mkdir -p "$LOG_DIR"
  echo "${LOG_DIR}/chapter_${CHAPTER}_${1}_$(date +%Y%m%d_%H%M%S).log"
}

require_file() {
  local file="$1" hint="$2"
  if ! $DRY_RUN && ! file_exists "$file"; then
    err "${file##*/} not found. ${hint}"
    exit 1
  fi
}

export CLAUDE_CODE_MAX_OUTPUT_TOKENS="32000"
CLAUDE_SETTINGS='{"env":{"CLAUDE_CODE_MAX_OUTPUT_TOKENS":"32000"}}'

resolve_phase_runtime() {
  local phase="$1"
  local model_key="${PHASE_MODEL_KEYS[$phase]}"
  local reasoning="${PHASE_REASONING_LEVELS[$phase]}"
  local agent="${MODEL_TO_AGENT[$model_key]:-}"

  if [[ -z "$agent" ]]; then
    err "No CLI agent configured for model key: $model_key"
    exit 1
  fi

  RESOLVED_REASONING="$reasoning"
  RESOLVED_AGENT="$agent"
  RESOLVED_PROVIDER_MODEL="${MODEL_TO_PROVIDER_MODEL[$model_key]:-}"
  RESOLVED_DISPLAY_NAME="${MODEL_TO_DISPLAY_NAME[$model_key]}"

  if [[ "$agent" == "agy" ]]; then
    # agy wants the machine slug gemini-<major.minor>-flash-<low|medium|high>.
    if [[ "$model_key" =~ ^gemini-flash-([0-9]+\.[0-9]+)$ ]]; then
      local level="$reasoning"
      if [[ "$reasoning" == "xhigh" ]]; then
        warn "agy/Gemini Flash has no 'xhigh' tier. Falling back to 'high' for phase '${phase}'."
        level="high"
        RESOLVED_REASONING="high"
      fi
      RESOLVED_PROVIDER_MODEL="gemini-${BASH_REMATCH[1]}-flash-${level}"
    else
      err "Unsupported agy model key: ${model_key}"
      exit 1
    fi
  fi
}

build_automation_prompt() {
  cat <<EOF
$1

CRITICAL AUTOMATION INSTRUCTION:
You are running inside the Ralph automated writing pipeline.
When you have finished writing or editing files, you MUST write your final status line to '${OUTPUT_FILE}'.
The file must contain the exact terminal status you want Ralph to read, such as:
- ARCHITECT DONE ✓
- RESEARCHER DONE ✓ (...)
- PHOTO RESEARCHER DONE ✓ (...)
- WRITER STAGE 1 DONE ✓ (...)
- WRITER STAGE 2 DONE ✓ (...)
- EDITOR PASS ✓ Score IT: X.X/10
- EDITOR FAIL ✗ Score IT: X.X/10 | REPAIR_MODE: TARGETED
- REPAIR DONE ✓ (...)
- REVIEWER PASS ✓ Score IT: X/60
- LINGUISTA DONE ✓ (...)

Do not only print the status to stdout. Persist it to '${OUTPUT_FILE}' before you stop.
EOF
}

wait_for_agent_output_file() {
  # codex/agy run synchronously: this is only a short grace period for the file flush.
  local log_file="$1" timeout=30 elapsed=0
  while [[ ! -f "$OUTPUT_FILE" ]]; do
    if [[ $elapsed -ge $timeout ]]; then
      err "${RESOLVED_AGENT} exited but never wrote ${OUTPUT_FILE##*/} (waited ${timeout}s)."
      [[ -f "${log_file}.raw" ]] && { warn "Raw ${RESOLVED_AGENT} output (last 15 lines):"; tail -15 "${log_file}.raw" >&2; }
      exit 1
    fi
    sleep 2
    elapsed=$((elapsed + 2))
  done
  local output
  output="$(cat "$OUTPUT_FILE")"
  echo "$output" | tee "$log_file"
  rm -f "$OUTPUT_FILE"
}

run_agent() {
  local phase="$1" prompt="$2" log_file="${3:-/dev/null}" full_prompt

  resolve_phase_runtime "$phase"

  if $DRY_RUN; then
    echo -e "${DIM}[DRY-RUN] Would invoke ${RESOLVED_AGENT} with ${RESOLVED_DISPLAY_NAME} (${RESOLVED_REASONING})${NC}" >&2
    echo -e "${DIM}          Prompt preview: $(echo "$prompt" | head -3 | tr '\n' ' ')...${NC}" >&2
    return 0
  fi

  case "$RESOLVED_AGENT" in
    claude)
      claude -p "$prompt" \
        --permission-mode bypassPermissions \
        --model "$RESOLVED_PROVIDER_MODEL" \
        --effort "$RESOLVED_REASONING" \
        --add-dir "$PROJECT_DIR" \
        --settings "$CLAUDE_SETTINGS" \
        2>&1 | tee "$log_file"
      ;;
    codex)
      full_prompt="$(build_automation_prompt "$prompt")"
      rm -f "$OUTPUT_FILE"
      info "Running codex synchronously — raw output: ${log_file}.raw"
      set +e
      printf "%s" "$full_prompt" | codex exec \
        --model "$RESOLVED_PROVIDER_MODEL" \
        -c "model_reasoning_effort=\"${RESOLVED_REASONING}\"" \
        --dangerously-bypass-approvals-and-sandbox \
        --ephemeral \
        - > "${log_file}.raw" 2>&1
      local codex_exit=$?
      set -e
      if [[ $codex_exit -ne 0 ]]; then
        err "codex exited with code ${codex_exit}. Raw output (last 20 lines):"
        tail -20 "${log_file}.raw" >&2
        exit "$codex_exit"
      fi
      wait_for_agent_output_file "$log_file"
      ;;
    agy)
      full_prompt="$(build_automation_prompt "$prompt")"
      rm -f "$OUTPUT_FILE"
      info "Running agy synchronously — raw output: ${log_file}.raw"
      set +e
      agy --print="$full_prompt" \
        --dangerously-skip-permissions \
        --model "$RESOLVED_PROVIDER_MODEL" \
        --add-dir "$PROJECT_DIR" \
        --print-timeout 15m \
        > "${log_file}.raw" 2>&1
      local agy_exit=$?
      set -e
      if [[ $agy_exit -ne 0 ]]; then
        err "agy exited with code ${agy_exit}. Raw output (last 20 lines):"
        tail -20 "${log_file}.raw" >&2
        exit "$agy_exit"
      fi
      wait_for_agent_output_file "$log_file"
      ;;
    *)
      err "Unsupported CLI agent: $RESOLVED_AGENT"
      exit 1
      ;;
  esac
}

agent_failed() {
  local label="$1" code="$2" log_file="$3"
  err "${label}: ${RESOLVED_AGENT} exited with code ${code}. Check log: ${log_file##*/}"
  [[ -f "$log_file" && -s "$log_file" ]] && { warn "Log tail:"; tail -5 "$log_file" >&2; }
  exit 1
}

# Shared rules every writing stage must obey (storia_c2 PRD/STYLE_BIBLE, D1-D9).
# Plain text only: this string is expanded inside unquoted heredocs.
read -r -d '' C2_RULES <<'ENDRULES' || true
## storia_c2 rules (PRD.md and STYLE_BIBLE.md are the authority; these are reminders)
- D1 A reading beside the school textbook, not a replacement. Every chapter names the textbook unit it hooks to.
- D3 Chapter shape, about 3,000 words (2,800-3,300), in this order: (1) one-page opening with map and timeline placeholders, the guiding question, the textbook hook and the initial hypothesis with one crack, not resolved; (2) THREE scenes of 600-700 words, at least one narrated by Maja on a European (not only Slovenian) fact and at least one where Alex and Maja see the same event from different perspectives; (3) a "Cosa devi ricordare" reality-check box with 3-4 essential facts; (4) ONE real document (image or short source extract) with a question for the reader, which replaces most SCANNING boxes (at most one scan-result per chapter); (5) a checkpoint where the reader chooses AND motivates the choice BEFORE the verdict; outcomes vary across the book (A, B, neither, open question; the same outcome never in more than two chapters in a row); (6) a short debriefing with the verdict and a hook to the next chapter. Sources go to a teacher appendix, never to footnotes in the text. At most 5 new glossary terms, at most one target-profile.
- D4 A light Alex/Maja thread of 150-250 words per chapter, at the opening or the close, never a fourth scene: the family mystery of MYSTERY.md (the family is invented, history around it is not; family objects are never the chapter's real document and never appear inside a real archival record), mistakes with visible consequences, rivalry that turns into trust.
- D5 Images: only real public-domain documents found by the photo researcher (IMAGES.md, images_chapter_N.md). Maps and timelines are drawn from dossier data. No invented historical illustrations. AI generation only from a real photo (cleaning, cropping, adapting) without adding anything the photo does not show.
- D6 Romanticised scenes are allowed, with two limits: a scene never contradicts the dossier, and the text never contradicts itself (MEMO never debunks a scene afterwards as a twist; anything undocumented gets one light MEMO line at the start). No precise figure without a source in the dossier: use ranges or words like "la maggioranza"; every [NO SOURCE] marker in the dossier already gives the wording to use; every [ESTIMATE] is hedged. Never link two scenes with an element their dates do not allow (storia_c error: the "same salt cargo" from Zaule 1463 seen in Ljubljana 1489).
- D7 Italian first. The Slovenian text is a light adaptation, written only after the Italian chapter is approved.
- D8 Readability: Gulpease >= 65, mean sentence under 14 words, one new concept at a time, at most 2 new proper nouns per scene. checks.sh measures the hard thresholds.
- D9 The test reader likes nature, animals, volleyball, k-pop and cycling: nature and animals only where the dossier documents them; cycling only from the 1817 Drais machine onwards; volleyball and k-pop only as present-day traits of Alex and Maja, never in historical scenes.
- Internal tags EU/GIULIA/SLOVENIA never appear in the text: write "Europa e mondo", "Alto Adriatico", "terre slovene". No production words (scena, beat, NUF) in the text.
ENDRULES

# ─── STATUS ────────────────────────────────────────────────────────────────
show_status() {
  echo ""
  echo -e "${BOLD}Chapter ${CHAPTER} — Pipeline Status (storia_c2)${NC}"
  echo "────────────────────────────────────────────────────"
  check_file() {
    local label="$1" file="$2"
    if file_exists "$file"; then
      ok "$label"
      info "${file##*/} — $(wc -l < "$file" | tr -d ' ') lines"
    else
      warn "$label"
      info "${file##*/} — NOT FOUND"
    fi
  }
  check_file "Architect   (struttura)        " "$STRUTTURA"
  check_file "Dossier     (corrected)        " "$DOSSIER"
  check_file "Photo       (images)           " "$IMAGES_CHAPTER"
  check_file "Writer S1   (draft IT)         " "$DRAFT_PROSE_IT"
  check_file "Writer S2   (chapter IT)       " "$CHAPTER_FILE_IT"
  check_file "Writer S2   (teacher appendix) " "$APPENDIX"
  if file_exists "$FEEDBACK"; then
    warn "Editor      — ${FEEDBACK##*/} exists (chapter needs revision)"
  else
    ok "Editor      — no feedback (clean state)"
  fi
  check_file "Reviewer    (review)           " "$REVIEW"
  check_file "Approval    (test reader)      " "$APPROVAL"
  check_file "Linguista   (chapter SL)       " "$CHAPTER_FILE_SL"
  echo ""
  echo -e "${DIM}Logs: ${LOG_DIR}/${NC}"
}

# ─── STAGE PLAN (dry run) ──────────────────────────────────────────────────
print_stage_plan() {
  divider "STAGE PLAN — Chapter ${CHAPTER} (no model is called)"
  local sl_state="BLOCKED until ${APPROVAL##*/} exists (test reader + captain approval)"
  file_exists "$APPROVAL" && sl_state="unlocked: ${APPROVAL##*/} found"
  local length="2,800-3,300 words, 3 scenes (>=1 Maja), checkpoint, Cosa devi ricordare, real document"
  is_chapter_zero && length="orientation chapter: about 2,000 words, no checkpoint; checks.sh measures Gulpease and sentence length only"

  printf '%s\n' \
    "1. architect   [$(describe_phase_model architect)]" \
    "   in : PRD.md, STYLE_BIBLE.md, MYSTERY.md, IMAGES.md, dossier_chapter_${CHAPTER}.md, chapter_index.md (checkpoint outcomes so far)" \
    "   out: ${STRUTTURA##*/} — ${length}" \
    "2. researcher  [$(describe_phase_model researcher)]" \
    "   in : the struttura's RESEARCHER GAPS section" \
    "   out: appends a sourced 'AGGIUNTE storia_c2' section to ${DOSSIER##*/}; skipped when there are no gaps; never rewrites existing entries or markers" \
    "3. photo       [$(describe_phase_model photo)]" \
    "   in : IMAGES.md chapter section, the struttura's DOCUMENT and MAP specs" \
    "   out: ${IMAGES_CHAPTER##*/} — real public-domain documents only, links and metadata, nothing downloaded, no AI images" \
    "4. writer1     [$(describe_phase_model writer1)]" \
    "   out: ${DRAFT_PROSE_IT##*/} (Italian only)" \
    "5. writer2     [$(describe_phase_model writer2)]" \
    "   out: ${CHAPTER_FILE_IT##*/} + ${APPENDIX##*/} (teacher appendix: sources and image credits)" \
    "6. editor      [$(describe_phase_model editor)] — HARD GATE: checks.sh $(basename "$CHAPTER_FILE_IT") must exit 0" \
    "   checks: word count, Gulpease >= 65, mean sentence < 14 words, <= 5 glossary terms, 3 scenes incl. Maja, Cosa devi ricordare box" \
    "   LLM gates: no unsourced figure, no self-contradicting scene, varied checkpoint outcome, real document, thread 150-250 words, anachronisms" \
    "   on FAIL: repair [$(describe_phase_model repair)] (TARGETED) or writer1+writer2 (STRUCTURAL), max ${MAX_RETRIES} rounds" \
    "7. reviewer    [$(describe_phase_model reviewer)]" \
    "   out: ${REVIEW##*/}, updates chapter_index.md (outcome log, scene counts per narrator, mystery clue)" \
    "8. approval    [human] — test reader reads the Italian chapter; captain creates ${APPROVAL##*/}" \
    "9. linguista   [$(describe_phase_model linguista)] — ${sl_state}" \
    "   out: ${CHAPTER_FILE_SL##*/} (light Slovenian adaptation), ${GLOSSARY##*/} entries"
}

# ─── ARCHITECT ─────────────────────────────────────────────────────────────
run_architect() {
  divider "🏛️  ARCHITECT (Regista) — Chapter ${CHAPTER}"

  if ! should_run "$STRUTTURA"; then
    ok "Struttura exists. Skipping (--force to override)."
    return 0
  fi
  require_file "$DOSSIER" "Every storia_c2 chapter starts from its corrected dossier."

  local prev=$((CHAPTER - 1)) prev_line="" index_line=""
  file_exists "${PROJECT_DIR}/chapter_${prev}_it.md" && \
    prev_line="- Skim ${PROJECT_DIR}/chapter_${prev}_it.md for continuity of the Alex/Maja thread and the mystery clue already planted."
  file_exists "$CHAPTER_INDEX" && \
    index_line="- Read ${CHAPTER_INDEX}: checkpoint outcomes used so far, scenes narrated by Alex and by Maja so far, mystery clues already planted. Pick an outcome that keeps the variety rule and a narrator balance that keeps the book even."

  local chapter_zero_note=""
  if is_chapter_zero; then
    chapter_zero_note="## CHAPTER 0 — orientation chapter (special case)
About 2,000 words in the present day at Mission Control. No investigation, no checkpoint, no verdict. It must, once for the whole book: introduce Alex, Maja and MEMO; teach the method with a low-stakes demo (the paper-ball test approved in storia_c); state the Fatto/Stima/Ricostruzione convention; open the family mystery of MYSTERY.md and say in one light line that the family is invented while the history around it is real. checks.sh measures only Gulpease and sentence length for this chapter."
  fi

  local log_file; log_file=$(log_run "architect")
  log "Running Architect... (log: ${log_file##*/})"

  local PROMPT
  PROMPT=$(cat <<ENDPROMPT
You are THE ARCHITECT (Regista / Mission Control) for storia_c2, the new version of CHRONOS for Italian seconda media (11-13 years old).
You do not write prose. You write the chapter specification.

${chapter_zero_note}

## Read These Files First (in this order)
1. ${PRD} — positioning, the 13 chapters with their textbook hooks, decisions D1-D9
2. ${STYLE_BIBLE} — chapter shape (section 1), readability (section 2), voices, Alex and Maja together, the mystery thread, facts and stories
3. ${DOSSIER} — the ONLY source of facts. Respect every [CORRETTO storia_c2], [NO SOURCE], [CONFLICT], [ESTIMATE] and [ANACHRONISM-WATCH] entry.
4. ${MYSTERY} — the family-mystery options and the clue planned for this chapter (if the captain has not chosen, follow the recommended option and say so in the spec)
5. ${IMAGES} — this chapter's map, timeline and candidate real documents
6. ${WRITING_PLAN_REF} — CONTENT REFERENCE ONLY from storia_c: its scene lists, 4,000-word floor and SCANNING-heavy shape do NOT apply
${index_line}
${prev_line}

${C2_RULES}

## Your Task
Design Chapter ${CHAPTER} so that the Italian chapter passes checks.sh and the Editor's gates on the first or second attempt, and so that a 12-year-old can read it alone and want to read the next one.

## Output: Write EXACTLY This File Using the Write Tool
${STRUTTURA}

## Required Sections
### OPENING PAGE
Year or century in plain words; position relative to the previous chapter; guiding question (one line); textbook hook ("Sul tuo libro di storia è il capitolo su ..."); initial hypothesis as a cause-effect chain plus one sentence that flags a crack without resolving it; MAP spec (places and coordinates from IMAGES.md and the dossier only); TIMELINE spec (3-8 dated events from the dossier only); the three scene titles with place, year and narrator.

### SCENES (exactly three, 600-700 words each)
For each scene: title; place and year; narrator (Alex or Maja); which one is Maja's European-fact scene and which one is the shared Alex+Maja scene on the same event (one scene can be both); the evidence it brings to the hypothesis; dossier entries it uses (quote the entry numbers or first words); at most 2 new proper nouns; the sensory detail and the life-hack it takes from [SHADOW]; anything undocumented that will need one light MEMO line at the start; mistakes and their consequence if the thread needs one.

### COSA DEVI RICORDARE
The 3-4 essential facts, one line each, all from the dossier.

### DOCUMENT
The real document (from IMAGES.md or the dossier), its holder and identifier, and the question for the reader. If IMAGES.md has none for this chapter, specify what the photo researcher must find.

### CHECKPOINT
Where it sits, the question, options A and B (both plausible on the evidence shown), and the planned OUTCOME (A / B / neither / open question) with the reason it respects the variety rule given the outcomes already in chapter_index.md.

### DEBRIEFING
Verdict in 2-4 sentences, at most one thing we still do not know, the hook to the next chapter as a question.

### THREAD (150-250 words)
Where it goes (opening or close), the mystery clue for this chapter, the stage of the Alex/Maja relationship, and where a reader interest (D9) fits without anachronism.

### GLOSSARY
At most 5 terms, each needed by the guiding question.

### RESEARCHER GAPS
Facts the chapter needs that the dossier does not yet contain, each with a suggested query (Slovenian-language sources for Slovenian topics). Write "NONE" if the dossier is enough. Never plan to use a fact that is not in the dossier or in this list.

### WORD BUDGET
Opening, three scenes, boxes, document, checkpoint, debriefing, thread: the total must land in 2,800-3,300 words (about 2,000 for chapter 0).

## After Writing
Use the Write tool to save the file. Then print ONLY: "ARCHITECT DONE ✓"
ENDPROMPT
)

  local output exit_code=0
  output=$(run_agent "architect" "$PROMPT" "$log_file") || exit_code=$?
  [[ $exit_code -ne 0 ]] && agent_failed "Architect" "$exit_code" "$log_file"
  $DRY_RUN && { ok "[DRY-RUN] Would write: $STRUTTURA"; return 0; }

  if echo "$output" | grep -q "ARCHITECT DONE" || file_exists "$STRUTTURA"; then
    ok "Struttura written: $STRUTTURA"
  else
    err "Architect ran but did not write the struttura. Check log: ${log_file##*/}"
    exit 1
  fi
}

# ─── RESEARCHER (extends the corrected dossier, never rewrites it) ─────────
run_researcher() {
  divider "🕵️  RESEARCHER (Archivista) — Chapter ${CHAPTER} (dossier gaps only)"

  require_file "$STRUTTURA" "Run: ./ralph.sh ${CHAPTER} architect"
  require_file "$DOSSIER" "The corrected dossier must exist; the researcher only extends it."

  if ! $DRY_RUN && file_exists "$STRUTTURA" && \
     awk '/^#+ *RESEARCHER GAPS/{f=1;next} /^#+ /{f=0} f' "$STRUTTURA" | grep -qiE '^[[:space:]]*NONE[[:space:].]*$'; then
    ok "Struttura lists no researcher gaps. Dossier unchanged."
    return 0
  fi

  local log_file; log_file=$(log_run "researcher")
  log "Running Researcher... (log: ${log_file##*/})"

  local PROMPT
  PROMPT=$(cat <<ENDPROMPT
You are THE RESEARCHER (Archivista) for storia_c2. Prime directive: no invention. Only sourced, triangulated facts.

## Read These Files First
1. ${STRUTTURA} — the RESEARCHER GAPS section is your whole brief
2. ${DOSSIER} — the corrected dossier you will EXTEND
3. ${README} — the marker conventions ([CORRETTO storia_c2], [NO SOURCE], [CONFLICT tra dossier])

## Your Task
For each gap listed in RESEARCHER GAPS: search, triangulate across at least 2 independent sources (at least one Slovenian-language source for Slovenian topics), and write a sourced entry.

## Hard Rules
- APPEND ONLY. Add one section at the end of ${DOSSIER} titled "## [AGGIUNTE storia_c2 — capitolo ${CHAPTER}]". Never edit, reorder or delete existing entries, sources or markers.
- Format each entry as: **Source:** [publication or stable URL] | **Fact:** [...]. Use [ESTIMATE: range] for estimates and [RECONSTRUCTED] for inferred intentions or dialogue, as in the rest of the dossier.
- A precise figure needs a source that can actually contain it (right period, right topic). If you cannot find one, write the fact with a range or with words, and mark it [NO SOURCE: why. Usare: "wording"].
- Add [ANACHRONISM-WATCH] notes for any new object, food or expression the gap introduces.
- If you cannot find a fact, write [UNVERIFIED: description]; never guess, especially for Slovenian names, places and dates.

## After Writing
Use the Edit tool to append the section. Then print ONLY: "RESEARCHER DONE ✓ ([N] facts added)"
ENDPROMPT
)

  local output exit_code=0
  output=$(run_agent "researcher" "$PROMPT" "$log_file") || exit_code=$?
  [[ $exit_code -ne 0 ]] && agent_failed "Researcher" "$exit_code" "$log_file"
  $DRY_RUN && { ok "[DRY-RUN] Would append the gaps to: $DOSSIER"; return 0; }

  if echo "$output" | grep -q "RESEARCHER DONE"; then
    ok "Dossier extended: $DOSSIER"
    echo "$output" | grep "RESEARCHER DONE" || true
  else
    err "Researcher ran without a RESEARCHER DONE marker. Check log: ${log_file##*/}"
    exit 1
  fi
}

# ─── PHOTO RESEARCHER (real public-domain documents only) ──────────────────
run_photo() {
  divider "🖼️  PHOTO RESEARCHER — Chapter ${CHAPTER}"

  if ! should_run "$IMAGES_CHAPTER"; then
    ok "Image file exists. Skipping (--force to override)."
    return 0
  fi
  require_file "$STRUTTURA" "Run: ./ralph.sh ${CHAPTER} architect"

  local log_file; log_file=$(log_run "photo")
  log "Running Photo Researcher... (log: ${log_file##*/})"

  local PROMPT
  PROMPT=$(cat <<ENDPROMPT
You are THE PHOTO RESEARCHER for storia_c2. You only find images; you never write chapter prose. The captain's rule: "usiamo il researcher solo per le foto. Al limite usiamo generazione AI, ma con base di una foto vera, senza inventare niente."

## Read These Files First
1. ${IMAGES} — the verified candidates for chapter ${CHAPTER} and the verification rules at the top
2. ${STRUTTURA} — the DOCUMENT, OPENING PAGE (map, timeline) and THREAD sections

## Your Task
1. Confirm the chapter's real document: open its file page or institutional record and copy title, date, author, holding institution, shelfmark or inventory number, stable URL and licence or public-domain basis exactly as shown.
2. If the struttura asks for a document IMAGES.md does not have, find one in digital libraries and archives (dLib.si, Europeana, Wikimedia Commons, Gallica, Library of Congress, national archives). Prefer scans of the original object.
3. List the map points (with coordinates) and the timeline dates from the struttura, checking each against the dossier.
4. Note print resolution, and any licence that is not public domain (for example CC BY-SA photos of objects) as "attribution required" or "replace".

## Hard Rules
- Real documents only. Never generate, describe-to-generate or invent an image. If nothing real fits, write "NOT FOUND" and where to look; do not substitute.
- AI processing is allowed only later, on a real photo you list here (cleaning, cropping, adapting), never adding anything the photo does not show: record which image it would be and what processing, nothing more.
- Download nothing. Links and metadata only. Never guess a URL or a shelfmark.
- Images made after the event (a painting decades later) must be labelled as such for the caption.

## Output: Write EXACTLY This File Using the Write Tool
${IMAGES_CHAPTER}
Sections: DOCUMENT (verified metadata + the reader question from the struttura), MAP (points), TIMELINE (dates), OTHER CANDIDATES, CREDIT LINES (for the teacher appendix).

## After Writing
Print ONLY: "PHOTO RESEARCHER DONE ✓ ([N] documents verified, [N] not found)"
ENDPROMPT
)

  local output exit_code=0
  output=$(run_agent "photo" "$PROMPT" "$log_file") || exit_code=$?
  [[ $exit_code -ne 0 ]] && agent_failed "Photo Researcher" "$exit_code" "$log_file"
  $DRY_RUN && { ok "[DRY-RUN] Would write: $IMAGES_CHAPTER"; return 0; }

  if echo "$output" | grep -q "PHOTO RESEARCHER DONE" || file_exists "$IMAGES_CHAPTER"; then
    ok "Images written: $IMAGES_CHAPTER"
  else
    err "Photo Researcher did not write ${IMAGES_CHAPTER##*/}. Check log: ${log_file##*/}"
    exit 1
  fi
}

# ─── WRITER STAGE 1 (Italian) ──────────────────────────────────────────────
run_writer1() {
  divider "✍️  WRITER Stage 1 — Chapter ${CHAPTER} (Italian draft)"

  if ! should_run "$DRAFT_PROSE_IT"; then
    ok "Draft prose exists. Skipping (--force to override)."
    return 0
  fi
  require_file "$STRUTTURA" "Run: ./ralph.sh ${CHAPTER} architect"
  require_file "$DOSSIER" "The corrected dossier must exist."

  local feedback_directive=""
  if file_exists "$FEEDBACK"; then
    warn "${FEEDBACK##*/} found — Writer will address Editor feedback."
    feedback_directive="0. FIRST read ${FEEDBACK} and address every point it lists."
  fi
  local images_line=""
  file_exists "$IMAGES_CHAPTER" && images_line="5. ${IMAGES_CHAPTER} — the verified real document and the map and timeline data"

  local log_file; log_file=$(log_run "writer1")
  log "Running Writer Stage 1... (log: ${log_file##*/})"

  local PROMPT
  PROMPT=$(cat <<ENDPROMPT
You are THE WRITER — Stage 1 for storia_c2, writing in ITALIAN only, with two narrating voices: Alex and Maja.

## Read These Files (stateless — read everything fresh)
${feedback_directive}
1. ${STYLE_BIBLE} — the whole file; sections 1 (chapter shape), 2 (readability), 3 (voices), 4 (Alex and Maja together), 5 (thread), 6 (scene), 7 (facts)
2. ${STRUTTURA} — the spec for this chapter: follow its scenes, checkpoint outcome, document, thread and word budget
3. ${DOSSIER} — ALL facts come from here. Use the wording given by every [NO SOURCE] marker. Hedge every [ESTIMATE]. Respect [ANACHRONISM-WATCH].
4. ${MYSTERY} — the thread rules and this chapter's clue
${images_line}

${C2_RULES}

## How to Write
- Write the whole chapter in Italian, in the order of STYLE_BIBLE section 1. Do not write any Slovenian.
- Short sentences, mostly 8-14 words, with variety; after a sentence carrying a new concept, a short concrete one. Plain words a 12-year-old knows; each technical word explained in the sentence or in the glossary.
- Each scene: a sensory anchor from [SHADOW], the historical character met through objects and gestures, at least 2 dialogue exchanges in the Regola Aurea format, a closing line without a moral. Byline under every scene title: <span class="byline">Cronaca di Alex</span> or <span class="byline">Cronaca di Maja</span>.
- The real document goes in a "::: documento" box with the image placeholder, a caption (what, who, when) and the reader question.
- The checkpoint asks the reader to choose and write why before reading on; the debriefing gives the planned outcome.
- If you hit the token limit, stop at a clean boundary and write [CONTINUE: next part is ...]. Never summarise the missing parts.

## Output: Write EXACTLY This File Using the Write Tool
${DRAFT_PROSE_IT}
Then print ONLY: "WRITER STAGE 1 DONE ✓ (IT: ~[word count] words, scenes covered: [X/3])"
ENDPROMPT
)

  local output exit_code=0
  output=$(run_agent "writer1" "$PROMPT" "$log_file") || exit_code=$?
  [[ $exit_code -ne 0 ]] && agent_failed "Writer S1" "$exit_code" "$log_file"
  $DRY_RUN && { ok "[DRY-RUN] Would write: $DRAFT_PROSE_IT"; return 0; }

  if echo "$output" | grep -q "WRITER STAGE 1 DONE" || file_exists "$DRAFT_PROSE_IT"; then
    ok "Draft prose written: $DRAFT_PROSE_IT"
  else
    err "Writer S1 did not write ${DRAFT_PROSE_IT##*/}. Check log: ${log_file##*/}"
    exit 1
  fi
}

# ─── WRITER STAGE 2 (Italian chapter + teacher appendix) ───────────────────
run_writer2() {
  divider "✍️  WRITER Stage 2 — Chapter ${CHAPTER} (final Italian chapter + teacher appendix)"

  if ! should_run "$CHAPTER_FILE_IT"; then
    ok "Italian chapter exists. Skipping (--force to override)."
    return 0
  fi
  require_file "$DRAFT_PROSE_IT" "Run: ./ralph.sh ${CHAPTER} writer1"

  local log_file; log_file=$(log_run "writer2")
  log "Running Writer Stage 2... (log: ${log_file##*/})"

  local PROMPT
  PROMPT=$(cat <<ENDPROMPT
You are THE WRITER — Stage 2 (refinement) for storia_c2. Italian only.

## Read These Files (stateless)
1. ${STYLE_BIBLE} — formatting (sections 1, 6, 9, 12) and the checklist (section 13)
2. ${DRAFT_PROSE_IT} — the draft to refine (keep its substance)
3. ${STRUTTURA} — check every required section is present
4. ${DOSSIER} — to build the teacher appendix and to check every figure

${C2_RULES}

## Your Task
1. Refine the draft into the final chapter: the six parts of STYLE_BIBLE section 1 in order, three scenes with bylines, exactly one checkpoint, one "Cosa devi ricordare" reality-check box, one documento box, at most one glossary box with at most 5 terms, at most one target-profile, the thread in 150-250 words.
2. Cut to 2,800-3,300 words (about 2,000 for chapter 0) and shorten long sentences: the Editor will run checks.sh and fail the chapter on any threshold.
3. Remove every figure that has no source in the dossier; replace every [NO SOURCE] figure with the wording its marker gives.
4. Write the TEACHER APPENDIX: for each scene and box, the dossier sources used; for the document and every image, the full credit line (holder, identifier, URL, licence). No footnotes in the chapter itself.

## Output: Write EXACTLY These Two Files Using the Write Tool
${CHAPTER_FILE_IT}
${APPENDIX}
Add at the end of the chapter: <!-- WORD COUNT: ~X --> and <!-- CHECKPOINT OUTCOME: A|B|neither|open -->
Then print ONLY: "WRITER STAGE 2 DONE ✓ (IT: ~[word count] words)"
ENDPROMPT
)

  local output exit_code=0
  output=$(run_agent "writer2" "$PROMPT" "$log_file") || exit_code=$?
  [[ $exit_code -ne 0 ]] && agent_failed "Writer S2" "$exit_code" "$log_file"
  $DRY_RUN && { ok "[DRY-RUN] Would write: $CHAPTER_FILE_IT and $APPENDIX"; return 0; }

  if echo "$output" | grep -q "WRITER STAGE 2 DONE" || file_exists "$CHAPTER_FILE_IT"; then
    ok "Chapter written: $CHAPTER_FILE_IT"
    file_exists "$APPENDIX" || warn "Teacher appendix missing: ${APPENDIX##*/} (the Editor will fail the chapter)"
  else
    err "Writer S2 did not write ${CHAPTER_FILE_IT##*/}. Check log: ${log_file##*/}"
    exit 1
  fi
}

# ─── REPAIR (targeted Edit-tool fixes) ─────────────────────────────────────
run_repair() {
  divider "🔧 REPAIR — Chapter ${CHAPTER} (targeted fix, not a rewrite)"

  require_file "$FEEDBACK" "Repair only makes sense after an Editor FAIL."
  require_file "$CHAPTER_FILE_IT" "Run: ./ralph.sh ${CHAPTER} writer"
  if $DRY_RUN; then
    ok "[DRY-RUN] Would apply targeted edits to: $CHAPTER_FILE_IT per ${FEEDBACK##*/}"
    return 0
  fi

  local log_file; log_file=$(log_run "repair")
  log "Running Repair... (log: ${log_file##*/})"

  local PROMPT
  PROMPT=$(cat <<ENDPROMPT
You are THE REPAIR AGENT for storia_c2. The Editor classified this FAIL as TARGETED. Fix EXACTLY what is flagged with the Edit tool and touch nothing else. Never regenerate the file with the Write tool.

## Read These Files (stateless)
1. ${FEEDBACK} — the violations, the checks.sh output and the repair instructions
2. ${STYLE_BIBLE} — the rules a fixed passage must satisfy
3. ${DOSSIER} — the only source of facts
4. ${CHAPTER_FILE_IT} — the file to edit (and ${APPENDIX} if a credit or source is flagged)

${C2_RULES}

## Rules
- Locate each quoted passage verbatim and replace only it.
- Readability fixes: split long sentences and swap hard words; keep facts and voice.
- Length fixes: cut or add within the flagged scene or box only; the chapter must end within 2,800-3,300 words (about 2,000 for chapter 0).
- Never add a fact that is not in the dossier. If a fix needs one, print "REPAIR ESCALATE ✗ needs Researcher — [fact]".
- If a flagged problem turns out to span most of the chapter, stop and print "REPAIR ESCALATE ✗ [reason]".

## After Editing
Print ONLY one of:
- "REPAIR DONE ✓ ([N] fixes applied: [one-line summary per fix])"
- "REPAIR ESCALATE ✗ [reason]"
ENDPROMPT
)

  local output exit_code=0
  output=$(run_agent "repair" "$PROMPT" "$log_file") || exit_code=$?
  if [[ $exit_code -ne 0 ]]; then
    err "Repair: ${RESOLVED_AGENT} exited with code ${exit_code}. Check log: ${log_file##*/}"
    return 1
  fi
  if echo "$output" | grep -q "REPAIR DONE"; then
    ok "Targeted repair applied."
    return 0
  fi
  warn "Repair escalated or gave no DONE marker — falling back to a full rewrite."
  return 1
}

# ─── EDITOR (checks.sh hard gate + LLM gates) ──────────────────────────────
CHECKS_OUTPUT=""
CHECKS_STATUS=0

run_checks_gate() {
  CHECKS_STATUS=0
  CHECKS_OUTPUT="$(bash "$CHECKS" "$CHAPTER_FILE_IT" 2>&1)" || CHECKS_STATUS=$?
  if [[ $CHECKS_STATUS -eq 0 ]]; then
    ok "checks.sh PASS"
  else
    warn "checks.sh FAIL (exit ${CHECKS_STATUS})"
  fi
  echo "$CHECKS_OUTPUT"
}

checks_repair_mode() {
  # Length or scene-count failures need a rewrite; readability, glossary and box
  # failures can be fixed passage by passage.
  if grep -qE 'FAIL +(parole|scene)' <<<"$CHECKS_OUTPUT"; then
    echo "STRUCTURAL"
  else
    echo "TARGETED"
  fi
}

write_checks_feedback() {
  local mode="$1"
  {
    echo "# Feedback — Chapter ${CHAPTER} — $(timestamp)"
    echo ""
    echo "#### Repair Mode"
    echo "${mode} (set by ralph.sh from the checks.sh hard gate)"
    echo ""
    echo "#### Hard Gate Violations — checks.sh"
    echo '```'
    echo "$CHECKS_OUTPUT"
    echo '```'
    echo ""
    echo "#### Repair Instructions"
    echo "1. Bring every FAIL line above inside its threshold (see STYLE_BIBLE section 2 and section 13)."
  } >> "$FEEDBACK"
}

run_editor() {
  divider "⚖️  EDITOR — Chapter ${CHAPTER} (checks.sh hard gate + quality gates)"

  require_file "$CHAPTER_FILE_IT" "Run: ./ralph.sh ${CHAPTER} writer"
  require_file "$STRUTTURA" "Cannot audit without the struttura."
  if [[ ! -f "$CHECKS" ]]; then
    err "checks.sh not found at ${CHECKS}: the Editor hard gate cannot run."
    exit 1
  fi

  if $DRY_RUN; then
    ok "[DRY-RUN] Would run hard gate: bash ${CHECKS##*/} ${CHAPTER_FILE_IT##*/} (must exit 0)"
    ok "[DRY-RUN] Would audit: ${CHAPTER_FILE_IT##*/} against the struttura, the dossier and STYLE_BIBLE section 13"
    ok "[DRY-RUN] Would write: ${FEEDBACK##*/} (on FAIL) or delete it (on PASS)"
    return 0
  fi

  local retry=0
  while [ $retry -lt $MAX_RETRIES ]; do
    [[ $retry -gt 0 ]] && divider "⚖️  EDITOR — Retry $retry of $((MAX_RETRIES - 1))"

    run_checks_gate

    local log_file; log_file=$(log_run "editor_r${retry}")
    log "Running Editor... (log: ${log_file##*/})"

    local PROMPT
    PROMPT=$(cat <<ENDPROMPT
You are THE EDITOR — quality gate for storia_c2 (Italian chapter). You do not write prose. You score, block and write repair instructions.

## Read These Files (stateless)
1. ${STRUTTURA} — the spec the chapter must satisfy
2. ${STYLE_BIBLE} — especially sections 1, 2, 6, 7, 12 and the checklist in section 13
3. ${DOSSIER} — ground truth for facts, [NO SOURCE] wordings, [ESTIMATE] hedging and [ANACHRONISM-WATCH]
4. ${CHAPTER_FILE_IT} and ${APPENDIX} — what you audit
5. ${CHAPTER_INDEX} if it exists — checkpoint outcomes of previous chapters

${C2_RULES}

## Automatic Checks (already run by ralph.sh: bash checks.sh, exit code ${CHECKS_STATUS})
${CHECKS_OUTPUT}
Any FAIL line above is a hard-gate violation. ralph.sh will FAIL this chapter whatever you print while checks.sh fails.

## Hard Gates (FAIL if any is violated; quote the exact passage)
1. checks.sh: every line above is OK.
2. No unsourced figures: every date, number and quantity is in the dossier; [NO SOURCE] figures use the marker's wording; every [ESTIMATE] is hedged.
3. No self-contradiction: no scene shown as fact and then debunked by MEMO or the narrator; anything undocumented has one light MEMO line at its start.
4. Chapter shape: opening page (map and timeline placeholders, guiding question, textbook hook, hypothesis with an unresolved crack), three scenes (one Maja scene on a European fact, one shared Alex+Maja scene on the same event), "Cosa devi ricordare" box, one real document with a reader question and credit in the appendix, a checkpoint asking for a motivated choice before the verdict, a short debriefing with the next-chapter hook. Chapter 0 follows its orientation exception.
5. Checkpoint variety: the outcome is not the same as in the two previous chapters (check chapter_index.md); skip for chapter 0.
6. Thread: 150-250 words, mystery rules respected (invented family never inside a real document, never the chapter's document).
7. Anachronisms per [ANACHRONISM-WATCH]; volleyball, k-pop and phones only in present-day moments.
8. No production words and no EU/GIULIA/SLOVENIA tags in the text; a byline under every scene title matching the narrator.
9. Teacher appendix present with sources and image credits; no footnotes in the chapter.

## Quality Score (0-10)
Score: voice of Alex and Maja, clarity for a 12-year-old, how the scenes carry the history, the document question, the checkpoint tension. Pass threshold 8.5/10 with all hard gates clear.

## Verdict
### PASS
Print: "EDITOR PASS ✓ Score IT: X.X/10". Delete the feedback file: rm -f ${FEEDBACK}
### FAIL
Classify REPAIR_MODE: TARGETED (a few localised, quotable passages: long sentences, one unsourced figure, a missing byline, a hard word) or STRUCTURAL (a missing section, wrong scene count, length far off, a planned element absent). When in doubt, STRUCTURAL.
Print: "EDITOR FAIL ✗ Score IT: X.X/10 | REPAIR_MODE: [TARGETED|STRUCTURAL]"
Write ${FEEDBACK} with: Repair Mode, Hard Gate Violations (exact quotes, including the checks.sh lines), Quality Notes, numbered Repair Instructions that name the exact passage to replace.
Then print: "FAIL: <promise>BLOCKED: [top reason in one sentence]</promise>"
ENDPROMPT
)

    local output
    output=$(run_agent "editor" "$PROMPT" "$log_file" 2>&1 || true)
    echo "$output"

    local passed=false mode=""
    if echo "$output" | grep -q "EDITOR PASS"; then
      if [[ $CHECKS_STATUS -eq 0 ]]; then
        passed=true
      else
        warn "Editor printed PASS but checks.sh failed: the hard gate overrides it."
        mode="$(checks_repair_mode)"
        rm -f "$FEEDBACK"
        write_checks_feedback "$mode"
      fi
    elif echo "$output" | grep -q "EDITOR FAIL"; then
      if echo "$output" | grep -q "REPAIR_MODE: TARGETED"; then
        mode="TARGETED"
      else
        mode="STRUCTURAL"
      fi
      if [[ $CHECKS_STATUS -ne 0 ]]; then
        [[ "$(checks_repair_mode)" == "STRUCTURAL" ]] && mode="STRUCTURAL"
        grep -q "checks.sh" "$FEEDBACK" 2>/dev/null || write_checks_feedback "$mode"
      fi
    else
      err "Editor produced unexpected output. Manual review required. Log: $log_file"
      exit 1
    fi

    if $passed; then
      ok "Chapter ${CHAPTER} PASSED ✓ (checks.sh + Editor)"
      rm -f "$FEEDBACK"
      return 0
    fi

    retry=$((retry + 1))
    if [ $retry -ge $MAX_RETRIES ]; then
      err "Circuit Breaker: Chapter ${CHAPTER} failed ${MAX_RETRIES} consecutive Editor rounds."
      {
        echo ""
        echo "## Circuit Breaker — Chapter ${CHAPTER} — $(timestamp)"
        echo "Failed ${MAX_RETRIES} consecutive Editor rounds."
        echo ""
        echo "### Last checks.sh output"
        echo "$CHECKS_OUTPUT"
        echo ""
        echo "### Last Editor output"
        echo "$output"
        echo ""
        echo "### Action Required"
        echo "Diagnose the root cause as one of: Architect (word budget, scene plan) / Researcher (missing facts) / Writer (voice, readability) / Threshold."
      } >> "$ACTIVITY"
      warn "Circuit Breaker logged to: $ACTIVITY"
      exit 2
    fi

    if [[ "$mode" == "TARGETED" ]] && run_repair; then
      info "Targeted repair applied — re-auditing."
    else
      warn "Editor FAIL (${mode}). Rewriting with Writer Stage 1 + 2 (attempt $retry of $((MAX_RETRIES - 1)))..."
      FORCE=true run_writer1
      FORCE=true run_writer2
      FORCE=false
    fi
  done
}

# ─── REVIEWER (Italian) ────────────────────────────────────────────────────
run_reviewer() {
  divider "📋  REVIEWER — Chapter ${CHAPTER} (editorial audit, Italian)"

  if ! should_run "$REVIEW"; then
    ok "Review exists. Skipping (--force to override)."
    return 0
  fi
  require_file "$CHAPTER_FILE_IT" "Run: ./ralph.sh ${CHAPTER} writer"

  local log_file; log_file=$(log_run "reviewer")
  log "Running Reviewer... (log: ${log_file##*/})"

  local PROMPT
  PROMPT=$(cat <<ENDPROMPT
You are THE REVIEWER for storia_c2: senior editor and continuity keeper. Read the chapter as its test reader would: a 12-year-old girl in seconda media who likes nature, animals, volleyball, k-pop and cycling, reading alone.

## Mandatory First Steps (stateless)
1. ${PRD} — positioning, success criteria, the test-reader questions
2. ${STYLE_BIBLE} — voices, chapter shape, facts and stories
3. ${STRUTTURA} — the original spec
4. ${CHAPTER_FILE_IT} and ${APPENDIX}
5. ${CHAPTER_INDEX} if it exists

${C2_RULES}

## Score Across 6 Dimensions (/10 each = 60)
1. Racconto e struttura (does the chapter shape work, does it pull the reader on)
2. Leggibilità per 11-13 anni (sentences, words, one concept at a time)
3. Accuratezza storica (everything traceable to the dossier, no self-contradiction)
4. Alex e Maja (two distinct voices, balance, nobody always right, the thread)
5. Documento e checkpoint (does the reader really look and really choose)
6. Voglia di continuare (would she want the next chapter)

## Decision Thresholds
- >= 48/60 → REVIEWER_PASS_MINOR: apply small inline corrections with the Edit tool (keep checks.sh thresholds: re-run bash ${CHECKS} ${CHAPTER_FILE_IT} after editing and undo any edit that breaks it)
- 36-47/60 → REVIEWER_CORRECTIONS: rewrite the identified paragraphs, same rule on checks.sh
- < 36/60 → REVIEWER_REWRITE: write ${REWRITE_PLAN}, do not touch the chapter

## Always Write ${REVIEW}
Executive summary; score and decision; findings with exact quotes; the three test-reader questions answered as she would (what happened? why? do you want to read on?); at least 3 rewritten paragraphs (Original / Rewritten / Why); verdict.

## On PASS_MINOR or CORRECTIONS: update ${CHAPTER_INDEX}
Create it if missing. Append a section for Chapter ${CHAPTER} with: checkpoint question and OUTCOME (A / B / neither / open), scenes narrated by Alex and by Maja, the mystery clue planted, glossary terms introduced, canonical facts adopted. Print: "REVIEWER PASS ✓ Score IT: X/60"
## On REWRITE
Print: "REVIEWER REWRITE NEEDED ✗ Score IT: X/60 — rewrite plan written"
ENDPROMPT
)

  local output exit_code=0
  output=$(run_agent "reviewer" "$PROMPT" "$log_file") || exit_code=$?
  [[ $exit_code -ne 0 ]] && agent_failed "Reviewer" "$exit_code" "$log_file"
  $DRY_RUN && { ok "[DRY-RUN] Would write: $REVIEW and update ${CHAPTER_INDEX##*/}"; return 0; }

  if file_exists "$REVIEW"; then
    local verdict_line; verdict_line=$(grep -m1 "^REVIEWER " <<<"$output" || true)
    if [[ -n "$verdict_line" ]]; then ok "$verdict_line"; else ok "Review written: $REVIEW"; fi
  else
    err "Reviewer failed to produce ${REVIEW##*/}. Check log: $log_file"
    exit 1
  fi
}

# ─── APPROVAL GATE + LINGUISTA (Slovenian light adaptation) ────────────────
approval_gate() {
  if file_exists "$APPROVAL"; then
    ok "Approval marker found: ${APPROVAL##*/}"
    return 0
  fi
  warn "AWAITING APPROVAL — Chapter ${CHAPTER} (Italian)"
  info "Next: the test reader reads ${CHAPTER_FILE_IT##*/} (what happened? why? do you want to read on?)."
  info "When the captain approves, create ${APPROVAL##*/}; then run: ./ralph.sh ${CHAPTER} linguista"
  return 1
}

run_linguista() {
  divider "🇸🇮 LINGUISTA — Chapter ${CHAPTER} (Slovenian light adaptation)"

  if ! approval_gate; then
    $DRY_RUN && { ok "[DRY-RUN] Linguista would stay blocked."; return 0; }
    exit 3
  fi
  if ! should_run "$CHAPTER_FILE_SL"; then
    ok "Slovenian chapter exists. Skipping (--force to override)."
    return 0
  fi
  require_file "$CHAPTER_FILE_IT" "Run: ./ralph.sh ${CHAPTER} writer"

  local log_file; log_file=$(log_run "linguista")
  log "Running Linguista... (log: ${log_file##*/})"

  local glossary_line=""
  file_exists "$GLOSSARY" && glossary_line="4. ${GLOSSARY} — existing bilingual terms; do not contradict without flagging"

  local PROMPT
  PROMPT=$(cat <<ENDPROMPT
You are THE LINGUISTA for storia_c2: you write the Slovenian edition of an APPROVED Italian chapter as a light adaptation, not a literal translation. The captain: "La versione slovena non deve essere una traduzione letterale, ma può essere leggermente adattata per non sembrare una traduzione forzata."

## Read These Files First
1. ${STYLE_BIBLE} — section 10 (the two languages) and section 6 (bylines)
2. ${CHAPTER_FILE_IT} — the approved Italian chapter (do not edit it)
3. ${DOSSIER} — for Slovenian names, places and terms
${glossary_line}

## Your Task
- Same structure, same three scenes, same boxes, same document and checkpoint, same facts. Natural Slovenian sentences: you may move a clause, change an idiom, shorten a sentence. If the Italian sentence order can be reconstructed from the Slovenian, rewrite it.
- Bylines: <span class="byline">Poroča Alex</span> / <span class="byline">Poroča Maja</span>. Glossary box title: MEMO SLOVAR. The reality-check box keeps its role ("Kaj si moraš zapomniti").
- Vocabulary: Naloga or Odprava (not Misija), Cesarstvo (not a generic Imperij), historical Slovenian toponyms where relevant; verify rulers' and places' names in Slovenian sources; flag what you cannot verify.
- Alex and Maja speak like real Slovenian teenagers; historical characters keep a period register.
- Add new terms to ${GLOSSARY} as: **[termine IT] / [izraz SL]** — one-sentence definition (create the file if missing).
- Write ${LINGUISTA_NOTE} only if you made a non-obvious terminology call.

## Output: Write EXACTLY This File Using the Write Tool
${CHAPTER_FILE_SL}
Then print ONLY: "LINGUISTA DONE ✓ (SL: ~[word count] words, glossary entries added: [N])"
ENDPROMPT
)

  local output exit_code=0
  output=$(run_agent "linguista" "$PROMPT" "$log_file") || exit_code=$?
  [[ $exit_code -ne 0 ]] && agent_failed "Linguista" "$exit_code" "$log_file"
  $DRY_RUN && { ok "[DRY-RUN] Would write: $CHAPTER_FILE_SL"; return 0; }

  if echo "$output" | grep -q "LINGUISTA DONE" || file_exists "$CHAPTER_FILE_SL"; then
    ok "Slovenian chapter written: $CHAPTER_FILE_SL"
  else
    err "Linguista did not write ${CHAPTER_FILE_SL##*/}. Check log: ${log_file##*/}"
    exit 1
  fi
}

# ─── REVIEW ALL ────────────────────────────────────────────────────────────
run_review_all() {
  divider "📋  REVIEWER — All Italian chapters"
  local chapters_found=() ch rewrite_count=0
  for ch in $(seq 0 12); do
    file_exists "${PROJECT_DIR}/chapter_${ch}_it.md" && chapters_found+=("$ch")
  done
  if [[ ${#chapters_found[@]} -eq 0 ]]; then
    warn "No Italian chapter files found in ${PROJECT_DIR}."
    return 0
  fi
  log "Found ${#chapters_found[@]} chapters to review: ${chapters_found[*]}"
  for ch in "${chapters_found[@]}"; do
    CHAPTER="$ch"
    set_chapter_paths
    run_reviewer
    file_exists "$REWRITE_PLAN" && rewrite_count=$((rewrite_count + 1))
  done
  ok "Chapters reviewed: ${#chapters_found[@]}"
  if [[ $rewrite_count -gt 0 ]]; then
    err "Rewrite plans written: ${rewrite_count} (see rewrite_plan_chapter_N.md; a book-level plan goes to ${BOOK_REWRITE_PLAN##*/} by hand)"
  fi
}

# ─── FULL PIPELINE ─────────────────────────────────────────────────────────
run_full_pipeline() {
  log "Starting full pipeline — Chapter ${CHAPTER} (Italian first)"
  log "Force: ${FORCE} | Project: ${PROJECT_DIR}"
  $DRY_RUN && print_stage_plan

  run_architect
  run_researcher
  run_photo
  run_writer1
  run_writer2
  run_editor
  run_reviewer

  echo ""
  ok "Italian pipeline complete — Chapter ${CHAPTER}"
  if approval_gate; then
    run_linguista
  elif $DRY_RUN; then
    ok "[DRY-RUN] Linguista would stay blocked until ${APPROVAL##*/} exists."
  fi
  $DRY_RUN || show_status
}

# ─── MAIN ──────────────────────────────────────────────────────────────────
cd "$PROJECT_DIR"

FORCE_STR=""; $FORCE && FORCE_STR=" | FORCE"
DRYRUN_STR=""; $DRY_RUN && DRYRUN_STR=" | DRY-RUN"

echo ""
echo -e "${BOLD}Ralph Loop — storia_c2 (CHRONOS, Italian first)${NC}"
echo -e "  Chapter: ${BOLD}${CHAPTER}${NC} | Phase: ${BOLD}${PHASE}${NC}${FORCE_STR}${DRYRUN_STR}"
echo ""

case "$PHASE" in
  all)         run_full_pipeline ;;
  plan)        print_stage_plan ;;
  architect)   run_architect ;;
  researcher)  run_researcher ;;
  photo)       run_photo ;;
  writer)      run_writer1; run_writer2 ;;
  writer1)     run_writer1 ;;
  writer2)     run_writer2 ;;
  repair)      run_repair ;;
  editor)      run_editor ;;
  reviewer)    run_reviewer ;;
  linguista)   run_linguista ;;
  review_all)  run_review_all ;;
  status)      show_status ;;
  *)
    err "Unknown phase: ${PHASE}"
    usage
    exit 1
    ;;
esac
