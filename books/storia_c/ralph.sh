#!/bin/bash
# ══════════════════════════════════════════════════════════════════════════════
# ralph.sh — Ralph Loop V5.1 (Edu/Bilingue) — 7-Agent Stateless Writing Pipeline
# Adapted from books/guerra_fredda_silicio/ralph.sh for a bilingual (IT+SL)
# middle-school history book: adds a LINGUISTA phase (parallel adaptation, not
# mechanical translation) and splits Writer/Editor/Reviewer outputs per language.
# Requires bash 4.0+. macOS: shebang uses /opt/homebrew/bin/bash (bash 5.x).
# ══════════════════════════════════════════════════════════════════════════════
#
# Usage:
#   ./ralph.sh <chapter>               Full pipeline (skips completed phases)
#   ./ralph.sh <chapter> architect     Architect only
#   ./ralph.sh <chapter> researcher    Researcher only
#   ./ralph.sh <chapter> writer        Writer Stage 1 + 2 (IT+SL)
#   ./ralph.sh <chapter> writer1       Writer Stage 1 only (IT+SL)
#   ./ralph.sh <chapter> writer2       Writer Stage 2 only (IT+SL)
#   ./ralph.sh <chapter> linguista     Linguista only (parallel adaptation pass)
#   ./ralph.sh <chapter> editor        Editor only (with retry loop, bilingual gate)
#   ./ralph.sh <chapter> reviewer      Reviewer only (editorial audit + corrections)
#   ./ralph.sh review_all              Review all chapters with existing files
#   ./ralph.sh <chapter> status        Show pipeline state for chapter N
#
# Flags:
#   --force                  Re-run phase even if output files already exist
#   --model <model[:level]>  Override model for all phases
#   --reasoning <level>      Override reasoning for all phases (medium|high|xhigh)
#   --phase-model P=SPEC     Override one phase, e.g. architect=gpt-5.5:xhigh
#   --dry-run                Show what would run without executing
#
# Examples:
#   ./ralph.sh 1                        # Full pipeline, Chapter 1 (IT+SL)
#   ./ralph.sh 1 researcher --force     # Re-research Chapter 1
#   ./ralph.sh 1 linguista              # Re-run parallel adaptation pass only
#   ./ralph.sh 1 editor                 # Run Editor + retry loop (bilingual gate)
#   ./ralph.sh review_all               # Review all existing chapters
#   ./ralph.sh 1 status                 # Check what's done
#   ./ralph.sh 1 --phase-model architect=gpt-5.5:xhigh
#   ./ralph.sh 1 --phase-model linguista=opus:high
# ══════════════════════════════════════════════════════════════════════════════

set -euo pipefail

# ⚠️  EDITING WARNING — recurring bug class (bitten twice already):
# Every PROMPT below is built with an UNQUOTED heredoc (<<ENDPROMPT, not <<'ENDPROMPT'),
# required so ${VAR} expands. That means BACKTICKS ARE LIVE inside every prompt block —
# `text` triggers command substitution and breaks with a cryptic "syntax error near
# unexpected token" pointing at some unrelated later line. NEVER use backtick-wrapped
# markdown code-spans (`like this`) inside a PROMPT heredoc — write the term plain, or
# use a HTML-escaped/backslash-escaped backtick (\`like this\`) only if you verify it
# with `bash -n ralph.sh` immediately after. Always run `bash -n ralph.sh` after editing
# any PROMPT block, before considering the edit done.

if [[ "${BASH_VERSION%%.*}" -lt 4 ]]; then
  echo "Error: ralph.sh requires bash 4.0+. Your bash: ${BASH_VERSION}"
  echo "Fix: /opt/homebrew/bin/bash ralph.sh $*"
  echo "  or: brew install bash && add /opt/homebrew/bin to PATH"
  exit 1
fi

# ─── CONFIG ────────────────────────────────────────────────────────────────
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MAX_RETRIES=3
DEFAULT_MODEL_KEY="sonnet"
DEFAULT_REASONING_LEVEL="high"
LOG_DIR="${PROJECT_DIR}/.ralph_logs"
OUTPUT_FILE="${PROJECT_DIR}/.ralph_output"

# Bash 4 associative arrays let us map logical model names to the correct CLI.
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
PIPELINE_PHASES=(architect researcher writer1 writer2 linguista repair editor reviewer)

# ─── ARGS ──────────────────────────────────────────────────────────────────
if [[ $# -lt 1 ]]; then
  echo "Usage: ./ralph.sh <chapter_number|review_all> [phase] [--force] [--dry-run] [--model <model[:level]>] [--reasoning <level>] [--phase-model <phase=model[:level]>]"
  echo "Phases: all | architect | researcher | writer | writer1 | writer2 | linguista | repair | editor | reviewer | status"
  echo "Special: ./ralph.sh review_all  — runs reviewer on every chapter with existing files"
  exit 1
fi

CHAPTER="${1}"
PHASE="all"
FORCE=false
DRY_RUN=false

# Globals filled by parse_model_spec / resolve_phase_runtime.
PARSED_MODEL_KEY=""
PARSED_REASONING_LEVEL=""
RESOLVED_MODEL_KEY=""
RESOLVED_REASONING=""
RESOLVED_AGENT=""
RESOLVED_PROVIDER_MODEL=""
RESOLVED_DISPLAY_NAME=""

normalize_model_key() {
  local raw="${1,,}"
  raw="${raw// /}"
  case "$raw" in
    haiku|claude-haiku|claude-haiku-4-5|claude-haiku-4.5) echo "haiku" ;;
    sonnet|claude-sonnet|claude-sonnet-4-6|claude-sonnet-4.6) echo "sonnet" ;;
    opus|claude-opus|claude-opus-4-6|claude-opus-4.6) echo "opus" ;;
    gemini-flash-3.5|gemini3.5flash|gemini-3.5-flash|gemini_flash_3_5) echo "gemini-flash-3.5" ;;
    gemini-flash-3.6|gemini3.6flash|gemini-3.6-flash|gemini_flash_3_6) echo "gemini-flash-3.6" ;;
    gemini-flash-3.7|gemini3.7flash|gemini-3.7-flash|gemini_flash_3_7) echo "gemini-flash-3.7" ;;
    gemini-flash-3.8|gemini3.8flash|gemini-3.8-flash|gemini_flash_3_8) echo "gemini-flash-3.8" ;;
    gpt-5.4|gpt5.4|gpt54) echo "gpt-5.4" ;;
    gpt-5.5|gpt5.5|gpt55|gpt-5.3-codex) echo "gpt-5.5" ;;
    gpt-5.6|gpt5.6|gpt56) echo "gpt-5.6" ;;
    gpt-5.6-sol|gpt5.6sol|gpt56sol) echo "gpt-5.6-sol" ;;
    *)
      err "Unsupported model: $1"
      err "Supported models: haiku | sonnet | opus | gemini-flash-3.5 | gemini-flash-3.6 | gemini-flash-3.7 | gemini-flash-3.8 | gpt-5.4 | gpt-5.5 | gpt-5.6 | gpt-5.6-sol"
      exit 1
      ;;
  esac
}

normalize_reasoning_level() {
  local raw="${1,,}"
  case "$raw" in
    medium|med) echo "medium" ;;
    high) echo "high" ;;
    xhigh|x-high|veryhigh|very-high|max) echo "xhigh" ;;
    *)
      err "Unsupported reasoning level: $1"
      err "Supported levels: medium | high | xhigh"
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
  # Researcher and Writer Stage 1 default to medium effort (agreed baseline).
  PHASE_REASONING_LEVELS["researcher"]="medium"
  PHASE_REASONING_LEVELS["writer1"]="medium"
  # Writer Stage 2 is surface-level polishing — medium is enough and keeps
  # the retry loop (up to 3x) cheap.
  PHASE_REASONING_LEVELS["writer2"]="medium"
  # Architect and Reviewer run once per chapter (no retry multiplier) and
  # carry the pipeline's structural/critical apex tasks — max effort.
  PHASE_REASONING_LEVELS["architect"]="xhigh"
  PHASE_REASONING_LEVELS["reviewer"]="xhigh"
  # Linguista is a precision task (anti-calco judgment, Slovenian vocabulary
  # accuracy) that runs once per chapter — high effort, not xhigh (cost/quality).
  PHASE_REASONING_LEVELS["linguista"]="high"

  # Cost/quality-tuned per-phase model assignment.
  # Architect: structural/logical reasoning + strict constraint adherence.
  PHASE_MODEL_KEYS["architect"]="gpt-5.6-sol"
  # Researcher: native search grounding, low hallucination, low cost.
  PHASE_MODEL_KEYS["researcher"]="gemini-flash-3.8"
  # Writer Stage 1: strongest literary/prose fidelity (both Alex's IT and Maja's SL).
  PHASE_MODEL_KEYS["writer1"]="opus"
  # Writer Stage 2 and Editor keep the default (sonnet) — fine-grained style
  # editing and scoring against Claude-authored drafts, at retry-loop cost.
  # Linguista keeps the default (sonnet) — judgment-heavy but not novel prose.
  # Reviewer: deep deductive critique plus creative rewriting.
  PHASE_MODEL_KEYS["reviewer"]="opus"
}

parse_model_spec() {
  local spec="$1"
  local raw_model raw_reasoning

  raw_model="${spec%%:*}"
  raw_reasoning="${spec#*:}"

  PARSED_MODEL_KEY="$(normalize_model_key "$raw_model")"
  if [[ "$spec" == *:* ]]; then
    PARSED_REASONING_LEVEL="$(normalize_reasoning_level "$raw_reasoning")"
  else
    PARSED_REASONING_LEVEL=""
  fi
}

apply_phase_model_spec() {
  local phase_selector="$1"
  local spec="$2"
  local target_phases=()
  local phase

  parse_model_spec "$spec"

  case "$phase_selector" in
    all) target_phases=("${PIPELINE_PHASES[@]}") ;;
    writer) target_phases=(writer1 writer2) ;;
    review_all|reviewer) target_phases=(reviewer) ;;
    architect|researcher|writer1|writer2|linguista|repair|editor) target_phases=("$phase_selector") ;;
    *)
      err "Unsupported phase selector for --phase-model: $phase_selector"
      exit 1
      ;;
  esac

  for phase in "${target_phases[@]}"; do
    PHASE_MODEL_KEYS["$phase"]="$PARSED_MODEL_KEY"
    [[ -n "$PARSED_REASONING_LEVEL" ]] && PHASE_REASONING_LEVELS["$phase"]="$PARSED_REASONING_LEVEL"
  done
}

apply_global_reasoning() {
  local reasoning="$1"
  local phase
  reasoning="$(normalize_reasoning_level "$reasoning")"
  for phase in "${PIPELINE_PHASES[@]}"; do
    PHASE_REASONING_LEVELS["$phase"]="$reasoning"
  done
}

describe_phase_model() {
  local phase="$1"
  local model_key="${PHASE_MODEL_KEYS[$phase]}"
  local reasoning="${PHASE_REASONING_LEVELS[$phase]}"
  local agent="${MODEL_TO_AGENT[$model_key]}"
  echo "${MODEL_TO_DISPLAY_NAME[$model_key]} / ${reasoning} via ${agent}"
}

phase_selector_summary() {
  local selector="$1"
  case "$selector" in
    all)
      echo "architect=$(describe_phase_model architect), researcher=$(describe_phase_model researcher), writer1=$(describe_phase_model writer1), writer2=$(describe_phase_model writer2), linguista=$(describe_phase_model linguista), repair=$(describe_phase_model repair), editor=$(describe_phase_model editor), reviewer=$(describe_phase_model reviewer)"
      ;;
    writer)
      echo "writer1=$(describe_phase_model writer1), writer2=$(describe_phase_model writer2)"
      ;;
    review_all|reviewer)
      echo "reviewer=$(describe_phase_model reviewer)"
      ;;
    architect|researcher|writer1|writer2|linguista|repair|editor)
      echo "${selector}=$(describe_phase_model "$selector")"
      ;;
    status)
      echo "architect=$(describe_phase_model architect), researcher=$(describe_phase_model researcher), writer1=$(describe_phase_model writer1), writer2=$(describe_phase_model writer2), linguista=$(describe_phase_model linguista), repair=$(describe_phase_model repair), editor=$(describe_phase_model editor), reviewer=$(describe_phase_model reviewer)"
      ;;
    *)
      echo "custom phase selection"
      ;;
  esac
}

print_phase_model_summary() {
  local phase
  for phase in "${PIPELINE_PHASES[@]}"; do
    info "${phase}: $(describe_phase_model "$phase")"
  done
}

init_phase_model_defaults

if [[ "${CHAPTER}" == "review_all" ]]; then
  PHASE="review_all"
fi

shift
while [[ $# -gt 0 ]]; do
  case "$1" in
    all|architect|researcher|writer|writer1|writer2|linguista|repair|editor|reviewer|status)
      PHASE="$1"; shift ;;
    --force)    FORCE=true; shift ;;
    --dry-run)  DRY_RUN=true; shift ;;
    --model)    apply_phase_model_spec "all" "${2:?--model requires a value}"; shift 2 ;;
    --reasoning) apply_global_reasoning "${2:?--reasoning requires a value}"; shift 2 ;;
    --phase-model)
      phase_override="${2:?--phase-model requires <phase>=<model[:level]>}"
      if [[ "$phase_override" != *=* ]]; then
        err "--phase-model requires <phase>=<model[:level]>"
        exit 1
      fi
      phase_name="${phase_override%%=*}"
      phase_spec="${phase_override#*=}"
      apply_phase_model_spec "$phase_name" "$phase_spec"
      shift 2
      ;;
    *)          echo "Unknown argument: $1"; exit 1 ;;
  esac
done

# ─── FILE PATHS ────────────────────────────────────────────────────────────
STRUTTURA="${PROJECT_DIR}/chapter_${CHAPTER}_struttura.md"
DOSSIER="${PROJECT_DIR}/dossier_chapter_${CHAPTER}.md"
DRAFT_PROSE_IT="${PROJECT_DIR}/draft_prose_${CHAPTER}_it.md"
DRAFT_PROSE_SL="${PROJECT_DIR}/draft_prose_${CHAPTER}_sl.md"
CHAPTER_FILE_IT="${PROJECT_DIR}/chapter_${CHAPTER}_it.md"
CHAPTER_FILE_SL="${PROJECT_DIR}/chapter_${CHAPTER}_sl.md"
LINGUISTA_NOTE="${PROJECT_DIR}/linguista_note_${CHAPTER}.md"
FEEDBACK="${PROJECT_DIR}/feedback_loop_${CHAPTER}.md"
ACTIVITY="${PROJECT_DIR}/activity.md"
INSTRUCTION="${PROJECT_DIR}/INSTRUCTION.md"
STYLE_BIBLE="${PROJECT_DIR}/STYLE_BIBLE.md"
PRD="${PROJECT_DIR}/PRD.md"
WRITING_PLAN="${PROJECT_DIR}/writing_plan.md"
GLOSSARY="${PROJECT_DIR}/NARRATIVE_GLOSSARY.md"
CHAPTER_INDEX="${PROJECT_DIR}/chapter_index.md"
ORACLE="${PROJECT_DIR}/oracle_questions.md"
REVIEW="${PROJECT_DIR}/review_chapter_${CHAPTER}.md"
REWRITE_PLAN="${PROJECT_DIR}/rewrite_plan_chapter_${CHAPTER}.md"
BOOK_REWRITE_PLAN="${PROJECT_DIR}/BOOK_REWRITE_PLAN.md"

# ─── COLORS ────────────────────────────────────────────────────────────────
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

# ─── HELPERS ───────────────────────────────────────────────────────────────
file_exists()  { [[ -f "$1" ]]; }
should_run()   { ! file_exists "$1" || $FORCE; }
both_exist()   { file_exists "$1" && file_exists "$2"; }
should_run_pair() { ! both_exist "$1" "$2" || $FORCE; }
timestamp()    { date '+%Y-%m-%d %H:%M:%S'; }

log_run() {
  local phase="$1"
  mkdir -p "$LOG_DIR"
  echo "${LOG_DIR}/chapter_${CHAPTER}_${phase}_$(date +%Y%m%d_%H%M%S).log"
}

export CLAUDE_CODE_MAX_OUTPUT_TOKENS="32000"
CLAUDE_SETTINGS='{"env":{"CLAUDE_CODE_MAX_OUTPUT_TOKENS":"32000"}}'

resolve_phase_runtime() {
  local phase="$1"
  local model_key="${PHASE_MODEL_KEYS[$phase]}"
  local reasoning="${PHASE_REASONING_LEVELS[$phase]}"
  local agent="${MODEL_TO_AGENT[$model_key]}"

  if [[ -z "$agent" ]]; then
    err "No CLI agent configured for model key: $model_key"
    exit 1
  fi

  RESOLVED_MODEL_KEY="$model_key"
  RESOLVED_REASONING="$reasoning"
  RESOLVED_AGENT="$agent"
  RESOLVED_PROVIDER_MODEL="${MODEL_TO_PROVIDER_MODEL[$model_key]:-}"
  RESOLVED_DISPLAY_NAME="${MODEL_TO_DISPLAY_NAME[$model_key]}"

  if [[ "$agent" == "agy" ]]; then
    # agy's --model flag wants the machine slug from `agy models`, e.g.
    # "gemini-3.8-flash-high" — NOT a human display string like "Gemini 3.8
    # Flash (High)". Verified against real `agy models` output (2026-09-03):
    # gemini-<major.minor>-flash-<low|medium|high>. Built dynamically here
    # (version extracted from the model key) so a new Gemini point release
    # only requires adding it to normalize_model_key — not another hardcoded
    # case arm here.
    if [[ "$model_key" =~ ^gemini-flash-([0-9]+\.[0-9]+)$ ]]; then
      local gemini_version="${BASH_REMATCH[1]}"
      local gemini_level="$reasoning"
      if [[ "$reasoning" == "xhigh" ]]; then
        warn "agy/Gemini Flash has no 'xhigh' tier (only low|medium|high). Falling back to 'high' for phase '${phase}'."
        gemini_level="high"
        RESOLVED_REASONING="high"
      fi
      RESOLVED_PROVIDER_MODEL="gemini-${gemini_version}-flash-${gemini_level}"
    else
      err "Unsupported agy model key: ${model_key} (expected gemini-flash-<major.minor>)"
      exit 1
    fi
  fi
}

build_automation_prompt() {
  local prompt="$1"
  cat <<EOF
$prompt

CRITICAL AUTOMATION INSTRUCTION:
You are running inside the Ralph automated writing pipeline.
When you have finished writing or editing files, you MUST write your final status line to '${OUTPUT_FILE}'.
The file must contain the exact terminal status you want Ralph to read, such as:
- ARCHITECT DONE ✓
- RESEARCHER DONE ✓ (...)
- WRITER STAGE 1 DONE ✓ (...)
- WRITER STAGE 2 DONE ✓ (...)
- LINGUISTA DONE ✓ (...)
- EDITOR PASS ✓ Score IT: X.X/10 | Score SL: X.X/10
- EDITOR FAIL ✗ Score IT: X.X/10 | Score SL: X.X/10
- REVIEWER PASS ✓ Score IT: X/60 | Score SL: X/60

Do not only print the status to stdout. Persist it to '${OUTPUT_FILE}' before you stop.
EOF
}

wait_for_agent_output_file() {
  # NOTE: codex/agy invocations in run_agent() are SYNCHRONOUS (no trailing
  # `&`) — by the time this function is called, the CLI process has already
  # exited. This is therefore only a short grace period for a slow filesystem
  # flush, NOT a wait for the agent to finish working. If the file hasn't
  # appeared within a few seconds of the process exiting, it never will —
  # don't wait 30 minutes for it.
  local log_file="$1"
  local timeout=30
  local elapsed=0
  local check_interval=2

  while [[ ! -f "$OUTPUT_FILE" ]]; do
    if [[ $elapsed -ge $timeout ]]; then
      err "${RESOLVED_AGENT} exited but never wrote ${OUTPUT_FILE##*/} (waited ${timeout}s grace period)."
      [[ -f "${log_file}.raw" ]] && { warn "Raw ${RESOLVED_AGENT} output (last 15 lines):"; tail -15 "${log_file}.raw" >&2; }
      exit 1
    fi
    sleep "$check_interval"
    elapsed=$((elapsed + check_interval))
    echo -n "." >&2
  done
  echo "" >&2

  local output
  output="$(cat "$OUTPUT_FILE")"
  echo "$output" | tee "$log_file"
  rm -f "$OUTPUT_FILE"
}

run_agent() {
  local phase="$1"
  local prompt="$2"
  local log_file="${3:-/dev/null}"
  local full_prompt

  resolve_phase_runtime "$phase"

  if $DRY_RUN; then
    echo -e "${DIM}[DRY-RUN] Would invoke ${RESOLVED_AGENT} with ${RESOLVED_DISPLAY_NAME} (${RESOLVED_REASONING})${NC}"
    echo -e "${DIM}          Prompt preview: $(echo "$prompt" | head -3 | tr '\n' ' ')...${NC}"
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
      info "Running codex synchronously — raw output: ${log_file}.raw (tail -f it in another terminal to watch progress live)"
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
      info "Running agy synchronously — raw output: ${log_file}.raw (tail -f it in another terminal to watch progress live)"
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
        err "agy exited with code ${agy_exit} (possibly hit its own --print-timeout 15m). Raw output (last 20 lines):"
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

# ─── STATUS ────────────────────────────────────────────────────────────────
show_status() {
  echo ""
  echo -e "${BOLD}Chapter ${CHAPTER} — Pipeline Status (IT+SL)${NC}"
  echo "────────────────────────────────────────────────────"

  check_file() {
    local label="$1"; local file="$2"
    if file_exists "$file"; then
      local lines; lines=$(wc -l < "$file" | tr -d ' ')
      local size; size=$(wc -c < "$file" | awk '{printf "%.1f KB", $1/1024}')
      ok "$label"
      info "${file##*/} — ${lines} lines, ${size}"
    else
      warn "$label"
      info "${file##*/} — NOT FOUND"
    fi
  }

  check_file "Architect  (struttura)  " "$STRUTTURA"
  check_file "Researcher (dossier)    " "$DOSSIER"
  check_file "Writer S1  (draft IT)   " "$DRAFT_PROSE_IT"
  check_file "Writer S1  (draft SL)   " "$DRAFT_PROSE_SL"
  check_file "Writer S2  (chapter IT) " "$CHAPTER_FILE_IT"
  check_file "Writer S2  (chapter SL) " "$CHAPTER_FILE_SL"

  if file_exists "$LINGUISTA_NOTE"; then
    ok "Linguista  — linguista_note_${CHAPTER}.md exists"
  else
    info "Linguista  — no terminology note (may be fine if no new decisions)"
  fi

  if file_exists "$FEEDBACK"; then
    warn "Editor     — feedback_loop.md exists (chapter needs revision)"
    info "Run: ./ralph.sh ${CHAPTER} editor"
  else
    ok "Editor     — No feedback (clean state)"
  fi

  if file_exists "$ACTIVITY"; then
    local entries; entries=$(grep -c "^## Circuit Breaker" "$ACTIVITY" 2>/dev/null || echo 0)
    [[ $entries -gt 0 ]] && warn "Circuit Breaker — ${entries} event(s) logged in activity.md"
  fi

  if file_exists "$REVIEW"; then
    ok "Reviewer   — review_chapter_${CHAPTER}.md exists"
    file_exists "$REWRITE_PLAN" && warn "Reviewer   — rewrite_plan_chapter_${CHAPTER}.md exists (full rewrite needed)"
  else
    warn "Reviewer   — No review (run: ./ralph.sh ${CHAPTER} reviewer)"
  fi

  echo ""
  echo -e "${DIM}Logs: ${LOG_DIR}/${NC}"
  echo ""
}

# ─── ARCHITECT ─────────────────────────────────────────────────────────────
run_architect() {
  divider "🏛️  ARCHITECT (Regista) — Chapter ${CHAPTER}"

  if ! should_run "$STRUTTURA"; then
    ok "Struttura exists. Skipping (--force to override)."
    info "$STRUTTURA"
    return 0
  fi

  local prev=$((CHAPTER - 1))
  local prev_context=""
  file_exists "${PROJECT_DIR}/chapter_${prev}_it.md" && \
    prev_context="- Skim previous chapter for narrative continuity: ${PROJECT_DIR}/chapter_${prev}_it.md and ${PROJECT_DIR}/chapter_${prev}_sl.md"

  local index_line=""
  file_exists "$CHAPTER_INDEX" && index_line="- Read ${CHAPTER_INDEX} for canonical terms, established facts, and adopted narrative positions — flag any conflict, never silently overwrite"

  local glossary_line=""
  file_exists "$GLOSSARY" && glossary_line="- Read ${GLOSSARY} (bilingual) — flag any beat that contradicts an existing term definition"

  local chapter_zero_note=""
  if [[ "$CHAPTER" == "0" ]]; then
    chapter_zero_note="## CHAPTER 0 — SPECIAL CASE (orientation chapter, not a curriculum unit)
This is the orientation chapter, not one of the 12 ministerial-nucleus chapters. Per writing_plan.md's 'CAPITOLO 0' blueprint and STYLE_BIBLE exceptions:
- Do NOT apply the Ipotesi Iniziale / Prova / Checkpoint / Verdetto investigation mechanic — there is no historical mystery yet to investigate.
- Length floor for THIS chapter only: at least 2,000 words (chapters 1-12 use a 4,000-word floor). No fixed maximum, same as chapters 1-12.
- The BEAT LIST covers: Alex/CHRONOS recap through action not infodump, Alex-Maja first meeting establishing her voice/tic, Mission Control explaining the three-voice structure + the Fatto/Stima/Ricostruzione convention + the new investigation protocol as in-universe 'new rules', ending with an unresolved hook into Chapter 1's Ipotesi Iniziale.
- Briefing/Debriefing still use Regista voice, but the Briefing/Debriefing structural checklists (temporal anchor to a historical year, OBIETTIVI DEL SALTO as historical scenes) adapt to 'today, at Mission Control' framing — there is no historical year to anchor to, the anchor is 'your third mission, the team just changed.'
Skip the CHECKPOINT SPEC and the Ipotesi-Iniziale/Prova framing entirely in the struttura below — replace with a simple scene list.

## CHAPTER 0 OBJECTIVES SECTION — REVISED after external audit of the first draft (do not repeat these 3 defects)
The first draft's 'Obiettivi a Mission Control' section had three flaws: (1) mixed narrative goals, methodological goals, and editorial/production instructions in one list — readers should see ONLY what they can actually do or understand, never internal beat-design notes; (2) the Briefing promised 'three things to learn' then listed five — internal contradiction, count what you promise; (3) objectives spoiled the plot instead of posing a problem (e.g. 'understand why Maja isn't Alex's assistant' tells the reader the scene's outcome before it happens — a briefing assigns the problem, it does not hand over the solution).
Design the struttura's objectives section as EXACTLY 4 transversal, reader-verifiable skills (not per-scene spoilers), per writing_plan.md's CAPITOLO 0 blueprint:
1. Completare la squadra — scoprire chi sono Alex, Maja e MEMO e che cosa osserva ciascuno.
2. Leggere tre mappe insieme — seguire EU, Giulia e le terre slovene senza trattarne una come nota a margine.
3. Misurare la certezza — distinguere un fatto documentato, una stima e una ricostruzione plausibile.
4. Mettere alla prova una spiegazione — partire da un'ipotesi, cercare ciò che potrebbe smentirla, cambiare risposta se cambiano le prove.
Plus ONE summary objective line at the very top of the Briefing (not scene-enumerated): 'Obiettivo della Missione Zero: imparare a distinguere ciò che sappiamo, ciò che possiamo stimare e ciò che dobbiamo ricostruire — prima di giudicare una storia già pronta.'
The Writer must bring these 4 objectives back in the Debriefing as a completion table (Obiettivo | Esito) — this is where real gamification payoff lives, not in the Briefing's promise alone. The 5 catchy scene titles from the original draft stay in the Architect's internal scene list (writing_plan.md) — do NOT expose them 1:1 as reader-facing 'objectives' matching each section title, or the chapter becomes predictable."
  fi

  local log_file; log_file=$(log_run "architect")
  log "Running Architect... (log: ${log_file##*/})"

  local PROMPT
  PROMPT=$(cat <<ENDPROMPT
You are THE ARCHITECT (Regista / Mission Control) — System 2 strategist for this bilingual (IT+SL) middle-school history book.
You do not write prose. You write Specs, Beat Lists, and Narrative Utility Functions (NUFs).

${chapter_zero_note}

## Read These Files First (in this order)
1. Read ${INSTRUCTION} — your role definition, NUF format, and pipeline rules (7-agent bilingual pipeline)
2. Read ${PRD} — the full book vision, chapter structure table, and success criteria
3. Read ${WRITING_PLAN} — the human-authored blueprint for THIS chapter: concept didattico/narrativo and the seed scene list (EU/GIULIA/SLOVENIA tags, Alex/Maja voice)
4. Read ${STYLE_BIBLE} — Alex's and Maja's personas, voice, and the quality bar
${index_line}
${glossary_line}
${prev_context}

## Your Task
Design Chapter ${CHAPTER} so it passes both quality gates on BOTH languages:
- EDITOR: NUF scoring ≥ 8.5/10 on IT and on SL
- REVIEWER: editorial score ≥ 48/60 across 6 dimensions on IT and on SL

## Non-Negotiable Structural Constraint
At least 1 beat MUST be tagged SLOVENIA with Maja as narrating voice. If the writing_plan.md blueprint for this chapter does not offer an obvious anchor, YOU must construct one (popular reaction, intellectual echo, perception from a distance) and document why in the beat's core question — never a filler scene.

## Length: Dynamic, Not a Fixed Ceiling (REVISED — the Chapter 1 problem was density-per-beat, not total length; see Lexical Density Cap below, which still applies in full)
**No fixed maximum.** Chapters flex in length based on the real weight of the ministerial content — a light chapter can stay under 5,000 words, a dense one can legitimately exceed 7,000. **Minimum: 4,000 words total** (Briefing + all beats + Debriefing) — below this a chapter is probably too compressed to do its didactic job. Beat count and per-beat word targets are NOT fixed at 4-5/700-1,100 — decide them per chapter based on how much the specific ministerial nucleus and its Giulia/Slovenia anchors actually need. A chapter earns extra length only with content that wouldn't fit elsewhere (never padding, never repetition of a point already made).

## Avoid Formulaic Repetition (NEW)
The book now has many optional mechanisms (Life Hack Storico, voice tics, Ipotesi→Prove→Checkpoint→Verdetto, the three Alex-Maja connective devices — question handoff / brief field interference / shared checkpoint, Easter Egg, gamification boxes). NONE of these is mandatory everywhere it could apply. If a reader who has read 3 chapters could predict exactly how chapter 4 will unfold, a mechanism is being used too mechanically. Choose deliberately, per chapter, which tools actually serve that chapter's specific story — vary structure between chapters as a quality requirement, not a style detail.

## Lexical Density Cap (NEW — Chapter 1 crammed 5 explorers + 11 technical terms into one beat)
Max 2 new proper nouns and 3 new technical terms per beat. If a beat's real content needs more names, keep the extras as passing mentions (not developed) and push their development to a later beat or a memo-box — never dump them all in one paragraph. Every new technical term gets a memo-box at first occurrence in that same beat.

## Output: Write EXACTLY This File Using the Write Tool
${STRUTTURA}

CRITICAL: Use the Write tool to save to disk. Do NOT print to stdout.

## Required Structure (derive specifics from INSTRUCTION.md NUF format)

### NUFs (Goal Scoring)
Define at least 3 NUFs (reader/emotional/factual) from the INSTRUCTION.md NUF template, PLUS 1 NUF(voice) for each beat tagged SLOVENIA per INSTRUCTION.md.

### BEAT LIST
Beat count and per-beat word targets are decided by YOU based on this chapter's real content weight (see "Length: Dynamic" above) — not a fixed 4-5/700-1,100 formula. Each beat:
- Title and core question
- Voice tag: EU/GIULIA (Alex) or SLOVENIA (Maja) — per INSTRUCTION.md beat tagging convention
- **Prova N tag:** what this beat proves or complicates relative to the chapter's Ipotesi Iniziale (see BRIEFING DRAFT below)
- Word count target (justify it against the beat's actual content — a beat introducing a genuinely dense concept can run longer than one that doesn't)
- Max 2 new proper nouns / 3 new technical terms this beat may introduce (Lexical Density Cap above — this stays fixed regardless of beat length)
- Key facts the Researcher must find (derive from writing_plan.md blueprint + PRD chapter goals)
- For SLOVENIA beats: note explicitly that ≥1 source must be in Slovenian (Researcher triangulation rule)

### REVIEWER READINESS NOTES
- Tension points (≥2): where the narrative must create genuine stakes
- Key chains to make explicit (cause → consequence → reader understanding)
- Voice balance check: does the chapter respect the EU/GIULIA/SLOVENIA proportion from writing_plan.md, or is the Slovenia beat a weak alibi?

### RESEARCHER BRIEF
Exact search queries for the Researcher, split by beat. For SLOVENIA beats, include at least one query phrased for Slovenian-language sources (Wikipedia SL, Slovenian historiography).

### BRIEFING DRAFT (mandatory — feeds the Writer's Regista Introduzione, per STYLE_BIBLE § Regista "Struttura Obbligatoria del Briefing" — REVISED after expert review: the Chapter 1 briefing gave away the answer)
Draft all six required elements so the Writer has concrete material, not a vibe to improvise from. **Critical: do NOT resolve the mystery here — that happens only in the Debriefing's Verdetto.**
1. Explicit temporal anchor: the exact year/century, stated in plain language, plus this chapter's position relative to the previous/next chapter (read chapter_index.md / writing_plan.md for what came before).
2. **Ipotesi Iniziale:** the school-textbook myth, written as a 1-2 sentence cause-effect chain, PLUS one sentence flagging that something doesn't add up — without yet explaining what. Do not state the correction here.
3. The mission in one direct sentence, framed as evidence-gathering, not as a promise of the answer ("La tua missione è raccogliere le prove e ricostruire la vera catena degli eventi" — NOT "La tua missione è capire che la catena è sbagliata").
4. Per-beat OBJECTIVES list: for EACH beat in the BEAT LIST above, one line in the format "[Scene subtitle] ([Place], [Year]) — voce: Alex/Maja — Prova da raccogliere: [what this beat proves or complicates relative to the Ipotesi Iniziale, NOT the conclusion]". This list is the explicit timeline/table-of-contents the reader sees BEFORE the narrative.
5. One sentence noting that the chapter is followed by two co-reporters (Alex and Maja) if the chapter includes both voices.
6. One-line method warning: not all testimonies/sources carry equal weight — a hint that evidence quality will need judgment.

### CHECKPOINT SPEC (mandatory — one per chapter, per STYLE_BIBLE § Formatting "Checkpoint")
Specify: which beat it follows (the one that introduces the decisive complication — usually the middle beat), the interpretive question in one line, and two plausible interpretations (A/B) both consistent with the evidence shown so far — never an obvious trap.

### DEBRIEFING DRAFT (mandatory — feeds the Writer's Regista Conclusione, per STYLE_BIBLE § Regista "Struttura Obbligatoria del Debriefing")
Draft: (1) the Verdetto — a direct 2-4 sentence answer to the Ipotesi Iniziale's question, resolving the Checkpoint's A/B if one was posed; (2) 2-3 genuine historiographical uncertainties for "Ciò Che Non Sappiamo" (derive from dossier [ESTIMATE]/[CONFLICT] tags once research exists — flag as TBD for the Researcher if not yet known); (3) 3-6 dates for the Cronologia Essenziale; (4) how the Debriefing reconciles the voices actually present (EU+Giulia, EU+Slovenia, or all three) per STYLE_BIBLE § Regista.

### TARGET
Word count: sum of beat targets (per PRD.md / STYLE_BIBLE pacing preference)

## After Writing
Use the Write tool to save the file. Then print ONLY: "ARCHITECT DONE ✓"
ENDPROMPT
)

  local output exit_code=0
  output=$(run_agent "architect" "$PROMPT" "$log_file") || exit_code=$?
  if [[ $exit_code -ne 0 ]]; then
    err "Architect: ${RESOLVED_AGENT} exited with code ${exit_code}. Check log: ${log_file##*/}"
    [[ -f "$log_file" && -s "$log_file" ]] && { warn "Log tail:"; tail -5 "$log_file" >&2; }
    exit 1
  fi
  $DRY_RUN && { ok "[DRY-RUN] Would write: $STRUTTURA"; return 0; }

  if echo "$output" | grep -q "ARCHITECT DONE" || file_exists "$STRUTTURA"; then
    ok "Struttura written: $STRUTTURA"
  else
    err "Architect: ${RESOLVED_AGENT} ran but did not write struttura. Check log: ${log_file##*/}"
    [[ -f "$log_file" && -s "$log_file" ]] && { warn "Log tail:"; tail -5 "$log_file" >&2; }
    exit 1
  fi
}

# ─── RESEARCHER ────────────────────────────────────────────────────────────
run_researcher() {
  divider "🕵️  RESEARCHER (Archivista) — Chapter ${CHAPTER}"

  if ! should_run "$DOSSIER"; then
    ok "Dossier exists. Skipping (--force to override)."
    info "$DOSSIER"
    return 0
  fi

  if ! $DRY_RUN && ! file_exists "$STRUTTURA"; then
    err "Struttura not found. Run: ./ralph.sh ${CHAPTER} architect"
    exit 1
  fi

  local log_file; log_file=$(log_run "researcher")
  log "Running Researcher... (log: ${log_file##*/})"

  local oracle_line=""
  file_exists "$ORACLE" && oracle_line="4. Read ${ORACLE} — check existing answers before searching"

  local PROMPT
  PROMPT=$(cat <<ENDPROMPT
You are THE RESEARCHER (Archivista) — Forensic investigator for this bilingual middle-school history book.
Prime directive: No invention. No narrative. Only sourced, triangulated facts.
If you cannot find a fact, mark it [UNVERIFIED: description] — never guess. This matters double for Slovenian proper nouns, place names, and dates.

## Read These Files First
1. Read ${STRUTTURA} — focus on the RESEARCHER BRIEF section for exact queries, and the voice tag (EU/GIULIA/SLOVENIA) per beat
2. Read ${INSTRUCTION} — your role definition and verification rules
3. Read ${PRD} — understand the book's topic, angle, and audience (2nd-year Italian middle school)
${oracle_line}

## Fractal Search Protocol (execute all 4 loops)

### Loop 1 — Macro (Baseline)
Web search for the foundational context of each beat topic. Get dates, names, key events right.

### Loop 2 — Pivot (Specific)
Web search for specific events, people, places, institutions from the RESEARCHER BRIEF.
Minimum 3 distinct searches per beat, more for SLOVENIA beats.

### Loop 3 — Sensory + Life Hack Storico (Shadow Data)
Hunt for micro-details that make prose feel real for an 11-13 year old reader: what people ate, wore (material, cut, WHY that cut solved a real problem — never generic "a tunic"), smelled, heard; how objects/technology of the era actually worked; prices, distances, durations.
**Mandatory per beat, not optional:** at least one "Life Hack Storico" — a concrete answer to "how did they manage to...?" (preserve food without refrigeration, stay warm, treat illness, travel, protect themselves from real daily dangers of that place/era). This is the material a standard textbook omits — it is often THE way a scene teaches its historical concept, not decoration. Tag these findings explicitly [LIFE-HACK] within the [SHADOW] section so the Writer can find them fast.

### Loop 4 — Triangulation (STRICT for SLOVENIA beats)
Cross-reference every key claim across ≥2 independent sources.
For every beat tagged SLOVENIA: at least 1 source MUST be Slovenian-language (Wikipedia SL, Slovenian historiography/encyclopedia) — not only Italian sources that mention the topic in passing. Flag conflicts as [CONFLICT: source A says X, source B says Y], including any divergence between Italian and Slovenian historiography on the same event (never silently harmonize — the Architect/Editor decide which to adopt and why).

### Estimate & Reconstruction Tagging (NEW — expert review of Chapter 1 found flat-fact claims for disputed/estimated figures like cannon weight, "petola" definition, and reconstructed dialogue presented as documented)
Any figure/date/detail that sources report as an estimate, a range, or genuinely disputed among historians: tag it [ESTIMATE: range or margin of uncertainty] instead of writing it as a bare fact. Any intention/thought/dialogue attributed to a real historical figure with NO documented direct quote: tag it [RECONSTRUCTED] — the Writer must hedge these in prose (STYLE_BIBLE § Fatto, Stima e Ricostruzione), never present them with the authority of a documented citation.

### Anachronism Sweep (NEW for this project — feeds the Editor's anachronism gate)
For each beat, note objects/food/expressions that did NOT YET EXIST in that era and must be avoided in the prose (e.g. no potatoes/tomatoes/maize/chocolate before their post-1492 diffusion in Europe; no matches before their invention; no modern idioms in historical characters' dialogue).

## Output: Write EXACTLY This File Using the Write Tool
${DOSSIER}

CRITICAL: Use the Write tool to save to disk. Do NOT print to stdout.

## Required Format (four sections ONLY — no narrative prose)

### [PUBLIC]
General facts. Format: **Source:** [URL or publication] | **Fact:** [verbatim or precise paraphrase]. Prefix uncertain/disputed entries: **Source:** [...] | **[ESTIMATE] Fact:** [claim + range/margin]. Prefix reconstructed character intentions/dialogue: **Source:** [...] | **[RECONSTRUCTED] Fact:** [what we can plausibly infer, and from what].

### [SHADOW]
Sensory micro-details AND Life Hack Storico entries. Format: **Source:** [URL or publication] | **Detail:** [exact sensory or numerical detail]. Prefix Life Hack entries with [LIFE-HACK] so they're easy to find: **Source:** [...] | **[LIFE-HACK] Detail:** [concrete survival/daily-life answer]

### [CONFLICT]
Contradictions between sources, including IT/SL historiographical divergence. Format: | Claim | Source A | Source B | Resolution |

### [ANACHRONISM-WATCH]
Per beat: objects/food/expressions to avoid, with the correct period-appropriate alternative where relevant.

## After Writing
Use the Write tool to save the file. Then print ONLY: "RESEARCHER DONE ✓ ([N] facts collected)"
ENDPROMPT
)

  local output exit_code=0
  output=$(run_agent "researcher" "$PROMPT" "$log_file") || exit_code=$?
  if [[ $exit_code -ne 0 ]]; then
    err "Researcher: ${RESOLVED_AGENT} exited with code ${exit_code}. Check log: ${log_file##*/}"
    [[ -f "$log_file" && -s "$log_file" ]] && { warn "Log tail:"; tail -5 "$log_file" >&2; }
    exit 1
  fi
  $DRY_RUN && { ok "[DRY-RUN] Would write: $DOSSIER"; return 0; }

  if echo "$output" | grep -q "RESEARCHER DONE" || file_exists "$DOSSIER"; then
    ok "Dossier written: $DOSSIER"
    echo "$output" | grep "RESEARCHER DONE" || true
  else
    err "Researcher: ${RESOLVED_AGENT} ran but did not write dossier. Check log: ${log_file##*/}"
    [[ -f "$log_file" && -s "$log_file" ]] && { warn "Log tail:"; tail -5 "$log_file" >&2; }
    exit 1
  fi
}

# ─── WRITER STAGE 1 (IT + SL, parallel authorship) ────────────────────────
run_writer1() {
  divider "✍️  WRITER Stage 1 (Alex + Maja) — Chapter ${CHAPTER} (Prose Engine, IT+SL)"

  if ! should_run_pair "$DRAFT_PROSE_IT" "$DRAFT_PROSE_SL"; then
    ok "Draft prose (IT+SL) exists. Skipping (--force to override)."
    info "$DRAFT_PROSE_IT"
    info "$DRAFT_PROSE_SL"
    return 0
  fi

  if ! $DRY_RUN && ! file_exists "$DOSSIER"; then
    err "Dossier not found. Run: ./ralph.sh ${CHAPTER} researcher"
    exit 1
  fi

  local feedback_directive=""
  if file_exists "$FEEDBACK"; then
    warn "feedback_loop.md found — Writer will address Editor feedback."
    feedback_directive="CRITICAL FIRST STEP: Read ${FEEDBACK} before writing anything. Address every point listed, for whichever language(s) it flags."
  fi

  local log_file; log_file=$(log_run "writer1")
  log "Running Writer Stage 1 (IT+SL)... (log: ${log_file##*/})"

  local PROMPT
  PROMPT=$(cat <<ENDPROMPT
You are THE WRITER — Stage 1 Prose Engine for this bilingual (IT+SL) book, embodying TWO personas: Alex (EU/GIULIA beats) and Maja (SLOVENIA beats).

## Read These Files (in order — stateless, read everything fresh)
${feedback_directive:+0. ${feedback_directive}}
1. Read ${STYLE_BIBLE} — § Persona for BOTH Alex and Maja, § Anti-Calco, voice rules, forbidden patterns, sensory mandate
2. Read ${STRUTTURA} — NUFs, BEAT LIST (with voice tags), REVIEWER READINESS NOTES
3. Read ${DOSSIER} — ALL facts come exclusively from here. Invent nothing. Respect [ANACHRONISM-WATCH].
4. Read ${INSTRUCTION} — anti-patterns and the parallel-authorship rule (§2 Writer)

## CRITICAL: This is NOT a translation task
You are producing TWO independent authorial drafts, not a draft-plus-translation:
- For beats tagged EU/GIULIA (Alex): **Italian is the primary draft.** Write it first in Alex's voice.
- For beats tagged SLOVENIA (Maja): **Slovenian is the primary draft.** Write it first, in Slovenian, in Maja's voice — she thinks and writes in Slovenian, this is not a scene translated for her.
- Then write the OTHER language for that beat as an independent adaptation: same facts, same beat sequence, freely reformulated sentence order, register, and opening hooks. If you can reconstruct the sentence order of one language by reading the other, you have failed this task — rewrite it.

## Activate Your Personas
Before writing each beat, read the relevant § Persona activation phrase in STYLE_BIBLE.md (Alex for EU/GIULIA, Maja for SLOVENIA). Inhabit it for that beat.

## Mandatory Rules
- Sentence rhythm: vary length within every paragraph (short ≤8 words alternating with long 20-30 words).
- Sensory grounding: every scene has ≥1 physical detail from [SHADOW] in the dossier.
- Forbidden patterns per STYLE_BIBLE (both languages): "come sappiamo"/"kot vemo", bullet-point prose in narrative sections, any claim not in the dossier, explicit closing morals.
- Zero anachronisms per [ANACHRONISM-WATCH] in the dossier — in BOTH languages.
- **Axis tags are production metadata, not book text (see STYLE_BIBLE.md's rendering table):** the struttura's beat tags EU/GIULIA/SLOVENIA must NEVER be pasted verbatim into dialogue, narration, or HUD boxes. Always render them naturally — EU → "Europa e mondo"/"Evropa in svet", GIULIA → "Alto Adriatico"/"Zgornji Jadran", SLOVENIA → "terre slovene"/"slovenske dežele". This is the same class of error as leaking "Beat N" into final prose.
- If you hit the token limit: stop at a clean beat boundary, write [CONTINUE: next beat is "Beat X: description"]. Do not summarize remaining beats.

## Output: Write EXACTLY These Two Files Using the Write Tool
${DRAFT_PROSE_IT}
${DRAFT_PROSE_SL}

CRITICAL: Use the Write tool to save BOTH files to disk. Do NOT print to stdout. Do NOT skip one language.
After writing both, print ONLY: "WRITER STAGE 1 DONE ✓ (IT: ~[word count] words, SL: ~[word count] words, beats covered: [X/Y])"
ENDPROMPT
)

  local output exit_code=0
  output=$(run_agent "writer1" "$PROMPT" "$log_file") || exit_code=$?
  if [[ $exit_code -ne 0 ]]; then
    err "Writer S1: ${RESOLVED_AGENT} exited with code ${exit_code}. Check log: ${log_file##*/}"
    [[ -f "$log_file" && -s "$log_file" ]] && { warn "Log tail:"; tail -5 "$log_file" >&2; }
    exit 1
  fi
  $DRY_RUN && { ok "[DRY-RUN] Would write: $DRAFT_PROSE_IT and $DRAFT_PROSE_SL"; return 0; }

  if echo "$output" | grep -q "WRITER STAGE 1 DONE" || both_exist "$DRAFT_PROSE_IT" "$DRAFT_PROSE_SL"; then
    ok "Draft prose written: $DRAFT_PROSE_IT"
    ok "Draft prose written: $DRAFT_PROSE_SL"
    echo "$output" | grep "WRITER STAGE 1 DONE" || true
  else
    err "Writer S1: ${RESOLVED_AGENT} ran but did not write both draft prose files. Check log: ${log_file##*/}"
    [[ -f "$log_file" && -s "$log_file" ]] && { warn "Log tail:"; tail -5 "$log_file" >&2; }
    exit 1
  fi
}

# ─── WRITER STAGE 2 (IT + SL) ──────────────────────────────────────────────
run_writer2() {
  divider "✍️  WRITER Stage 2 — Chapter ${CHAPTER} (Refinement Engine, IT+SL)"

  if ! should_run_pair "$CHAPTER_FILE_IT" "$CHAPTER_FILE_SL"; then
    ok "Chapter files (IT+SL) exist. Skipping (--force to override)."
    info "$CHAPTER_FILE_IT"
    info "$CHAPTER_FILE_SL"
    return 0
  fi

  if ! $DRY_RUN && ! both_exist "$DRAFT_PROSE_IT" "$DRAFT_PROSE_SL"; then
    err "Draft prose (IT+SL) not found. Run: ./ralph.sh ${CHAPTER} writer1"
    exit 1
  fi

  local log_file; log_file=$(log_run "writer2")
  log "Running Writer Stage 2 (IT+SL)... (log: ${log_file##*/})"

  local PROMPT
  PROMPT=$(cat <<ENDPROMPT
You are THE WRITER — Stage 2 Refinement Engine for this bilingual book.
Task: Transform both raw prose drafts into the final formatted chapters, independently.

## Read These Files (in order — stateless)
1. Read ${STYLE_BIBLE} — all formatting rules (§ Formatting & Gamification HUD), voice rules, Anti-AI checklist for BOTH languages
2. Read ${DRAFT_PROSE_IT} and ${DRAFT_PROSE_SL} — the narratives to refine (do not change substance — only refine, and only within each language)
3. Read ${STRUTTURA} — verify NUFs are satisfied and all beats are covered, in both languages

## Your Task
Apply STYLE_BIBLE rules to each draft SEPARATELY. Do not use one language's phrasing to "fix" the other — each stays independently refined.

Key checks (run for EACH language):
- Does the prose still sound like Alex/Maja after refinement, or has it drifted to generic AI voice / a translation-flavored register?
- **Briefing structure (mandatory, per STYLE_BIBLE § Regista "Struttura Obbligatoria del Briefing"):** does the Introduzione contain ALL FIVE elements — direct address, explicit temporal anchor (year stated plainly, not hidden in metaphor), the school-myth-vs-reality thesis stated directly, the mission in one direct sentence, and the "OBIETTIVI DEL SALTO" per-beat list (scene subtitle + place + year + narrating voice + one-line didactic objective) BEFORE the narrative begins? If the struttura's BRIEFING DRAFT section was thin, expand it — do not ship an atmospheric-only opening with no explicit timeline anchor or objectives list.
- HUD boxes (scan-result / target-profile / reality-check / memo-box / checkpoint) present per STYLE_BIBLE, with natively-written content in each language (not translated box-by-box)
- **target-profile's Abilità Speciale passes STYLE_BIBLE's operational test:** not a job description ("stampa un libro", "vende sale"). Either axis is valid: (a) what makes THIS person extraordinary/first/unique in context, or (b) something mundane for them that reads as superhuman to a modern reader without modern tools (mental arithmetic, celestial navigation, childhood Latin) — framed with irony. If it could describe anyone else in the same trade with no historical or ironic edge, rewrite it.
- Dialogue format: **Nome:** "battuta" on its own line, blank line between turns
- **Narrator byline present under every scene subtitle** (per STYLE_BIBLE § Formatting "Firma del cronoriporter"): HTML span, NOT markdown italics — literally <span class="byline">Cronaca di Alex</span> or <span class="byline">Cronaca di Maja</span> (IT), <span class="byline">Poroča Alex</span> or <span class="byline">Poroča Maja</span> (SL), matching whoever actually narrates that scene in first person. Not needed for Briefing/Debriefing (Regista voice).
- **If this chapter has an Easter Egg AND it's the first use of that cipher in the volume:** include the inline decoder key (memo-box) per STYLE_BIBLE § Formatting "Chiave di decifrazione" — a cipher with no way to decode it is a broken element, not a bonus.
- Production-jargon labels ("Scena 1", "Beat 1", "Beat 1 — Titolo"...) must NOT appear anywhere in the final text — not as headers, not as meta-references inside the prose ("in questo beat", "nel prossimo capitolo"). Section headers are the pure subtitle only (## Il Sottotitolo). "Capitolo" appears exactly once, in the opening # Capitolo N — Titolo line — never again in the body. Narration flows continuously (per STYLE_BIBLE § Formatting, "struttura vs. testo finale" — this is exactly the Chapter 1 defect being fixed: "## Beat 1 — La porta e la mappa" must become "## La Porta e la Mappa")
- Every scene has a physical sensory detail AND at least one concrete detail of everyday life / survival (see STYLE_BIBLE § Vita Quotidiana e Sopravvivenza — not decorative, substantive)
- All forbidden patterns removed (per language)
- Zero anachronisms

## Footer Comment (add at end of EACH file)
\`\`\`
<!-- WORD COUNT: ~X -->
<!-- PERSONA CHECK: Alex/Maja voice intact? Pass/Fail — reason -->
<!-- NUF CHECK: [list each NUF with ✅ or ⚠️] -->
<!-- ANTI-AI CHECK: [any flags from the checklist?] -->
\`\`\`

## Output: Write EXACTLY These Two Files Using the Write Tool
${CHAPTER_FILE_IT}
${CHAPTER_FILE_SL}

CRITICAL: Use the Write tool to save BOTH files to disk. Do NOT print to stdout.
After writing both, print ONLY: "WRITER STAGE 2 DONE ✓ (IT: ~[word count] words, SL: ~[word count] words)"
ENDPROMPT
)

  local output exit_code=0
  output=$(run_agent "writer2" "$PROMPT" "$log_file") || exit_code=$?
  if [[ $exit_code -ne 0 ]]; then
    err "Writer S2: ${RESOLVED_AGENT} exited with code ${exit_code}. Check log: ${log_file##*/}"
    [[ -f "$log_file" && -s "$log_file" ]] && { warn "Log tail:"; tail -5 "$log_file" >&2; }
    exit 1
  fi
  $DRY_RUN && { ok "[DRY-RUN] Would write: $CHAPTER_FILE_IT and $CHAPTER_FILE_SL"; return 0; }

  if echo "$output" | grep -q "WRITER STAGE 2 DONE" || both_exist "$CHAPTER_FILE_IT" "$CHAPTER_FILE_SL"; then
    ok "Chapter written: $CHAPTER_FILE_IT"
    ok "Chapter written: $CHAPTER_FILE_SL"
    echo "$output" | grep "WRITER STAGE 2 DONE" || true
  else
    err "Writer S2: ${RESOLVED_AGENT} ran but did not write both chapter files. Check log: ${log_file##*/}"
    [[ -f "$log_file" && -s "$log_file" ]] && { warn "Log tail:"; tail -5 "$log_file" >&2; }
    exit 1
  fi
}

# ─── LINGUISTA (parallel-adaptation audit — new phase) ────────────────────
run_linguista() {
  divider "🇸🇮 LINGUISTA — Chapter ${CHAPTER} (Anti-Calco Audit + Terminology)"

  if ! $DRY_RUN && ! both_exist "$CHAPTER_FILE_IT" "$CHAPTER_FILE_SL"; then
    err "Chapter files (IT+SL) not found. Run: ./ralph.sh ${CHAPTER} writer"
    exit 1
  fi

  if $DRY_RUN; then
    ok "[DRY-RUN] Would audit/edit: $CHAPTER_FILE_IT and $CHAPTER_FILE_SL"
    return 0
  fi

  local log_file; log_file=$(log_run "linguista")
  log "Running Linguista... (log: ${log_file##*/})"

  local glossary_line=""
  file_exists "$GLOSSARY" && glossary_line="- Read ${GLOSSARY} — existing bilingual terminology decisions, do not contradict without flagging"

  local PROMPT
  PROMPT=$(cat <<ENDPROMPT
You are THE LINGUISTA — parallel-adaptation editor, NOT a translator, for this bilingual (IT+SL) middle-school history book.

## Read These Files First
1. Read ${STYLE_BIBLE} — § Anti-Calco (test operativo), Slovenian vocabulary rules, register rules
2. Read ${INSTRUCTION} — §2 Linguista role definition
3. Read ${CHAPTER_FILE_IT} and ${CHAPTER_FILE_SL} — the two drafts to audit
${glossary_line}

## Your Task
1. **Anti-calco test:** for each paragraph pair (same beat, both languages), check: can you reconstruct one language's sentence order by reading the other without understanding the content? If yes, it's a calque — rewrite the NON-PRIMARY language for that beat (Slovenian for EU/GIULIA beats written by Alex; Italian for SLOVENIA beats written by Maja) so it reads as an independent, natively-composed text. Use the Edit tool directly on ${CHAPTER_FILE_IT} / ${CHAPTER_FILE_SL}.
2. **Slovenian vocabulary check:** scan for "pigrizia traduttiva" per STYLE_BIBLE (e.g. Misija→Naloga/Odprava, Imperij→Cesarstvo when generic, Akvadukt→Vodovod, Via X→X cesta). Fix directly.
3. **Toponym/proper noun check:** verify historical Slovenian names of places and rulers are used correctly per context — flag anything you cannot verify rather than guessing.
4. **Register check:** Alex/Maja stay modern/youthful in both languages; historical characters stay period-register in both languages (no anachronistic idioms).
5. **Glossary maintenance:** for every central concept/entity not yet in ${GLOSSARY}, append a bilingual entry: \`**[termine IT] / [termine SL]** — [definition, one sentence, consistent across languages]\`. Create ${GLOSSARY} if it doesn't exist yet (first chapter to pass).

## If Terminology Decisions Emerge
Write a short ${LINGUISTA_NOTE} documenting any non-obvious terminology call you made (e.g. a toponym choice, a register decision) — skip this file if nothing noteworthy emerged.

## After Editing
Use the Edit tool to apply fixes directly to ${CHAPTER_FILE_IT} and ${CHAPTER_FILE_SL}. Use the Write tool to update ${GLOSSARY}.
Then print ONLY: "LINGUISTA DONE ✓ ([N] calques fixed, [N] vocabulary fixes, glossary entries added: [N])"
ENDPROMPT
)

  local output exit_code=0
  output=$(run_agent "linguista" "$PROMPT" "$log_file") || exit_code=$?
  if [[ $exit_code -ne 0 ]]; then
    err "Linguista: ${RESOLVED_AGENT} exited with code ${exit_code}. Check log: ${log_file##*/}"
    [[ -f "$log_file" && -s "$log_file" ]] && { warn "Log tail:"; tail -5 "$log_file" >&2; }
    exit 1
  fi

  if echo "$output" | grep -q "LINGUISTA DONE"; then
    ok "Linguista pass complete."
    echo "$output" | grep "LINGUISTA DONE" || true
  else
    warn "Linguista: no explicit DONE marker found. Check log: ${log_file##*/}"
  fi
}

# ─── REPAIR (targeted Edit-tool fixes — default retry path, cheaper than a full rewrite) ──
run_repair() {
  divider "🔧 REPAIR — Chapter ${CHAPTER} (Targeted Fix, not a rewrite)"

  if ! $DRY_RUN && ! file_exists "$FEEDBACK"; then
    err "No feedback_loop.md found. Run: ./ralph.sh ${CHAPTER} editor (repair only makes sense after an Editor FAIL)."
    exit 1
  fi

  if ! $DRY_RUN && ! both_exist "$CHAPTER_FILE_IT" "$CHAPTER_FILE_SL"; then
    err "Chapter files (IT+SL) not found. Run: ./ralph.sh ${CHAPTER} writer"
    exit 1
  fi

  if $DRY_RUN; then
    ok "[DRY-RUN] Would apply targeted edits to: $CHAPTER_FILE_IT and $CHAPTER_FILE_SL per $FEEDBACK"
    return 0
  fi

  local log_file; log_file=$(log_run "repair")
  log "Running Repair... (log: ${log_file##*/})"

  local PROMPT
  PROMPT=$(cat <<ENDPROMPT
You are THE REPAIR AGENT — a cheap, targeted alternative to a full Writer rewrite.
The Editor already classified this FAIL as TARGETED (not STRUCTURAL) — meaning the violations are localized, not pervasive. Your job is to fix EXACTLY what is flagged, using the Edit tool, and touch NOTHING else. Do not use the Write tool to regenerate a file. Do not rewrite paragraphs that were not flagged, even if you personally would phrase them differently.

## Read These Files (stateless — read everything fresh)
1. Read ${FEEDBACK} — the exact violations and Repair Instructions, with quoted passages and line numbers
2. Read ${STYLE_BIBLE} — the rules you must satisfy when rewriting a flagged passage (Persona, Anti-Calco, Anacronismi, Formatting)
3. Read ${DOSSIER} — the ONLY source of facts for this chapter (Fractal Search Protocol output: [PUBLIC]/[SHADOW]/[CONFLICT]/[ANACHRONISM-WATCH]). Any factual claim you touch or add during a fix must trace back to this file, exactly like the Writer's own rule.
4. Read ${CHAPTER_FILE_IT} and ${CHAPTER_FILE_SL} — the files to edit in place

## Your Task
For each item in feedback_loop.md's Repair Instructions and Hard Gate Violations:
1. Locate the EXACT passage quoted (search for it verbatim in the relevant language file).
2. Use the Edit tool to replace ONLY that passage with a corrected version that satisfies the specific rule violated — same facts, same beat, same surrounding context, minimal surface area of change.
3. If a violation spans a genuinely large passage (e.g. an entire beat is a structural calque — the Editor still classified this as TARGETED because it's confined to one beat, not the whole chapter), a single larger Edit replacing that whole beat's non-primary-language text is still "targeted" — it's still ONE Edit call scoped to ONE beat, not a Write-tool full-file regeneration.
4. If, once you are actually in the text, a flagged item turns out to be more pervasive than feedback_loop.md suggested (touches most of the chapter, not a beat or two) — STOP, do not attempt it, and report this explicitly in your final status line as "ESCALATE: [reason]" so the pipeline falls back to a full Writer rewrite. Do not silently do a bigger rewrite than instructed.
5. **No invented facts, ever — same rule as the Writer and the Researcher.** If a fix requires a factual detail (a date, a quantity, a name, a sensory detail) that is NOT already in ${DOSSIER}, do not invent a plausible-sounding one. Report it in your final status line as "ESCALATE: needs Researcher — [what fact is missing]" so a real Fractal Search Protocol pass can find it, rather than silently degrading the chapter's sourcing.

## Rules
- Every Edit must keep the file's word count at or above the chapter's 4,000-word floor (no maximum — see STYLE_BIBLE § Pacing Rules). A fix should virtually never push a chapter below the floor; if it would, flag it instead of applying it.
- Every fix must still pass STYLE_BIBLE's Anti-Calco test between IT and SL for the beat touched.
- Do not touch the word-count footer comments unless a Repair Instruction specifically asks for it — but DO correct them if flagged (they're a common Aesthetic Violation).
- Do not add new HUD boxes, new beats, or new dialogue not implied by the fix itself.

## After Editing
Use the Edit tool for every change (never Write, never regenerate a file from scratch).
Then print ONLY one of:
- "REPAIR DONE ✓ ([N] fixes applied: [one-line summary per fix])"
- "REPAIR ESCALATE ✗ [reason the issue is too pervasive for a targeted fix — name the specific beat/section]"
ENDPROMPT
)

  local output exit_code=0
  output=$(run_agent "repair" "$PROMPT" "$log_file") || exit_code=$?
  if [[ $exit_code -ne 0 ]]; then
    err "Repair: ${RESOLVED_AGENT} exited with code ${exit_code}. Check log: ${log_file##*/}"
    [[ -f "$log_file" && -s "$log_file" ]] && { warn "Log tail:"; tail -5 "$log_file" >&2; }
    # Return (not exit): when called from run_editor's retry loop this must fall back
    # to a full Writer rewrite, not kill the whole pipeline. Standalone invocation
    # (./ralph.sh N repair) still surfaces as a non-zero script exit via $?.
    return 1
  fi

  if echo "$output" | grep -q "REPAIR DONE"; then
    ok "Targeted repair applied."
    echo "$output" | grep "REPAIR DONE" || true
    return 0
  elif echo "$output" | grep -q "REPAIR ESCALATE"; then
    warn "Repair agent escalated — issue too pervasive for a targeted fix."
    echo "$output" | grep "REPAIR ESCALATE" || true
    return 1
  else
    warn "Repair: no explicit DONE/ESCALATE marker found. Treating as escalation to be safe."
    return 1
  fi
}

# ─── EDITOR (bilingual NUF audit + anachronism + anti-calco gate) ─────────
run_editor() {
  divider "⚖️  EDITOR — Chapter ${CHAPTER} (NUF Audit + Anachronism + Anti-Calco Gate)"

  if ! $DRY_RUN && ! both_exist "$CHAPTER_FILE_IT" "$CHAPTER_FILE_SL"; then
    err "Chapter files (IT+SL) not found. Run: ./ralph.sh ${CHAPTER} writer"
    exit 1
  fi

  if ! $DRY_RUN && ! file_exists "$STRUTTURA"; then
    err "Struttura not found. Cannot score without NUF definitions."
    exit 1
  fi

  if $DRY_RUN; then
    ok "[DRY-RUN] Would score: $CHAPTER_FILE_IT and $CHAPTER_FILE_SL against NUFs in struttura"
    ok "[DRY-RUN] Would write: $FEEDBACK (on FAIL) or delete it (on PASS)"
    return 0
  fi

  local retry=0

  while [ $retry -lt $MAX_RETRIES ]; do
    [[ $retry -gt 0 ]] && divider "⚖️  EDITOR — Retry $retry of $((MAX_RETRIES - 1))"

    local log_file; log_file=$(log_run "editor_r${retry}")
    log "Running Editor... (log: ${log_file##*/})"

    local PROMPT
    PROMPT=$(cat <<ENDPROMPT
You are THE EDITOR — Quality Gate for this bilingual (IT+SL) book project.
You do not write. You score, block, and generate repair instructions. You score BOTH languages.

## Read These Files (stateless — read everything fresh)
1. Read ${STRUTTURA} — NUF definitions (the contract the Writer must satisfy, in both languages)
2. Read ${STYLE_BIBLE} — the quality standard, Anti-AI checklist, § Anti-Calco, § Anacronismi
3. Read ${DOSSIER} — [ANACHRONISM-WATCH] section is your ground truth for the anachronism gate
4. Read ${CHAPTER_FILE_IT} and ${CHAPTER_FILE_SL} — the chapters to audit

## NUF Scoring (BOTH languages, separately)
Score each NUF from struttura: 0 / 0.5 / 1, for the IT text and for the SL text independently.
Sum the scores per language. Pass threshold = 8.5/10 each (adjust denominator to number of NUFs × 2).

## Hard Gates (fail regardless of NUF score if violated)
1. **Anachronism gate:** any object/food/expression from [ANACHRONISM-WATCH] present in EITHER language → automatic FAIL, quote the exact passage.
2. **Anti-calco gate:** if either language reads as a structural calque of the other (same sentence order, same incisi, reconstructable without understanding content) → automatic FAIL, quote both passages side by side.
3. **Voice balance gate:** if a SLOVENIA-tagged beat reads as a footnote to an Alex scene rather than an autonomous Maja narrative → automatic FAIL, quote the passage.
4. **Length gate (REVISED — no more fixed ceiling):** total chapter word count (both languages, checked separately) must be **at least 4,000 words** — below that, FAIL as too compressed. There is NO maximum: a longer chapter is fine as long as it isn't padded (cross-check against Banned Patterns / repeated points — if you find genuine padding or a point made twice, that's an Aesthetic Violation, not this gate). **EXCEPTION for Chapter 0:** floor is 2,000 words instead (orientation chapter, see writing_plan.md), also no fixed maximum.
5. **Production-jargon gate (NEW, extended after Cap.0 axis-label incident):** any "Scena N", "Beat N", or "Beat N — Title" appearing as a header or as a meta-reference inside the prose (in either language) → automatic FAIL, quote the exact passage. "Capitolo" may appear only once, in the opening title line. Same rule for internal axis tags: the bare strings "EU", "GIULIA", "SLOVENIA" (tag-style, uppercase) must NEVER appear in dialogue, narration, or HUD boxes — they must always be rendered as their natural reader-facing form per STYLE_BIBLE.md's table (EU → "Europa e mondo"/"Evropa in svet", GIULIA → "Alto Adriatico"/"Zgornji Jadran", SLOVENIA → "terre slovene"/"slovenske dežele"). Any bare tag found in final prose → automatic FAIL, quote the passage.
6. **Narrator byline gate (NEW):** every scene subtitle (except Briefing/Debriefing) must be followed immediately by a narrator byline per STYLE_BIBLE.md § Formatting (<span class="byline">Cronaca di Alex</span> / <span class="byline">Cronaca di Maja</span> (IT), <span class="byline">Poroča Alex</span> / <span class="byline">Poroča Maja</span> (SL)). Missing byline, or a byline that doesn't match who is actually narrating in first person → automatic FAIL, quote the section.
7. **Estimate-hedging gate (NEW):** any dossier [ESTIMATE] or [RECONSTRUCTED] entry rendered in the chapter as a flat, unhedged fact (no "si stima"/"secondo alcune fonti"/equivalent) → automatic FAIL, quote the passage and the dossier entry it contradicts.
8. **Investigation-structure gate (NEW) — SKIP ENTIRELY FOR CHAPTER 0:** for chapters 1-12 only: Briefing must NOT resolve the Ipotesi Iniziale (if it states the correction outright instead of flagging the crack, FAIL); Debriefing MUST contain an explicit Verdetto + "Ciò Che Non Sappiamo" (2-3 points) + Cronologia Essenziale (3-6 dates); exactly one "checkpoint" box with a real A/B interpretive choice must be present → FAIL on any missing piece, in either language. Chapter 0 has no historical mystery yet — do not apply this gate to it.
9. **Easter Egg decoder-key gate (NEW — real bug found in Cap.0: a ROT13 footnote gave zero explanation of how to decode it):** if this chapter contains the FIRST occurrence of a given cipher (ROT13, binary) anywhere in the volume (check chapter_index.md / prior chapters for earlier uses), it MUST include an inline decoder key (memo-box teaching the mechanism, per STYLE_BIBLE.md § Formatting "Chiave di decifrazione") — not just the cipher name. A ciphered footnote with no way for an 11-13 year old to actually decode it → automatic FAIL, quote the passage.

## STYLE_BIBLE Audit (both languages)
□ Sentence rhythm: no paragraph with all sentences within 3 words of each other
□ Sensory grounding: ≥1 physical detail from [SHADOW] dossier per scene, AND ≥1 substantive Life Hack Storico per scene (clothing/food/survival — not decorative, see STYLE_BIBLE § Vita Quotidiana e Sopravvivenza)
□ Forbidden patterns: none of the banned phrases from STYLE_BIBLE (in either language)
□ Persona consistency: IT sounds like Alex/Maja, SL sounds like Alex/Maja — not generic AI, not a translation register
□ No invented facts: every claim traceable to dossier
□ Lexical density: ≤2 new proper nouns / ≤3 new technical terms per beat, each with a memo-box at first occurrence
□ MEMO interventions: ≤3 pieces of information each
□ "A scuola..."/"perché non lo so già" tics: ≤3 occurrences each, per chapter
□ Crude/intense content calibrated (STYLE_BIBLE § Calibrazione del Contenuto Crudo) — not more graphic than the rest of the chapter warrants

## Verdict

### If PASS (NUF score ≥ 8.5 on BOTH languages, all hard gates clear):
Print: "EDITOR PASS ✓ Score IT: X.X/10 | Score SL: X.X/10"
Print NUF breakdown per language.
Delete feedback_loop.md if it exists: use Bash to run: rm -f ${FEEDBACK}

### If FAIL (either language < 8.5, or any hard gate violated):
**Classify the repair mode before printing anything — this determines whether the pipeline calls a cheap targeted-fix agent or re-runs the full Writer (real cost difference, decide carefully):**
- **REPAIR_MODE: TARGETED** — the violations are a small number (roughly ≤4-5) of localized, quotable passages: a wrong term, a missing byline, one calqued paragraph, a missing decoder key, a weak Abilità Speciale line, a word-count footer typo, one unhedged [ESTIMATE]. Each can be fixed with a small in-place Edit without touching the rest of the chapter.
- **REPAIR_MODE: STRUCTURAL** — the chapter is missing a whole required section (no Briefing/Debriefing, no Checkpoint, wrong beat count), NUF failures reflect a content/beat-design problem rather than a wording problem, the anti-calco violation spans MOST of the chapter (not one beat), or fixing the violations piecemeal would leave internal inconsistencies (e.g. changing the Ipotesi Iniziale invalidates several downstream Prove). Default to STRUCTURAL when in doubt — a wrong targeted-vs-structural call that under-fixes costs more retries than one honest full rewrite.

Print: "EDITOR FAIL ✗ Score IT: X.X/10 | Score SL: X.X/10 | REPAIR_MODE: [TARGETED|STRUCTURAL]"
Use Write tool to write ${FEEDBACK} with:

#### Repair Mode
[TARGETED or STRUCTURAL, one paragraph justifying the call against the criteria above]

#### Missing NUFs (per language)
#### Hard Gate Violations (anachronism / anti-calco / voice-balance — exact quotes)
#### Aesthetic Violations (per language)
#### Repair Instructions (numbered, specific; tag which language(s) each applies to; for TARGETED mode, each instruction must name the exact passage to locate and replace — the repair agent searches for this text verbatim)

Then print: "FAIL: <promise>BLOCKED: [top reason in one sentence]</promise>"
ENDPROMPT
)

    local output
    output=$(run_agent "editor" "$PROMPT" "$log_file" 2>&1 || true)
    echo "$output"

    if echo "$output" | grep -q "EDITOR PASS"; then
      ok "Chapter ${CHAPTER} PASSED ✓ (IT+SL)"
      [[ -f "$FEEDBACK" ]] && rm -f "$FEEDBACK" && info "feedback_loop.md removed."
      return 0

    elif echo "$output" | grep -q "EDITOR FAIL"; then
      retry=$((retry + 1))

      if [ $retry -ge $MAX_RETRIES ]; then
        err "Circuit Breaker: Chapter ${CHAPTER} failed ${MAX_RETRIES} consecutive Editor reviews."
        {
          echo ""
          echo "## Circuit Breaker — Chapter ${CHAPTER} — $(timestamp)"
          echo "Failed ${MAX_RETRIES} consecutive Editor reviews."
          echo ""
          echo "### Last Editor Output"
          echo "$output"
          echo ""
          echo "### Action Required"
          echo "Diagnose root cause as exactly one of: Architect / Researcher / Persona / Linguista / Threshold."
          echo "Review struttura NUFs, STYLE_BIBLE § Persona / § Anti-Calco, and dossier ANACHRONISM-WATCH before continuing."
        } >> "$ACTIVITY"
        warn "Circuit Breaker logged to: $ACTIVITY"
        warn "Manual intervention required."
        exit 2
      fi

      if echo "$output" | grep -q "REPAIR_MODE: TARGETED"; then
        warn "Editor returned FAIL (TARGETED). Applying repair, not a full rewrite (attempt $retry of $((MAX_RETRIES - 1)))..."
        if run_repair; then
          info "Targeted repair applied — re-auditing."
        else
          warn "Repair agent escalated or failed — falling back to full Writer rewrite for this attempt."
          FORCE=true run_writer1
          FORCE=true run_writer2
          FORCE=true run_linguista
          FORCE=false
        fi
      else
        warn "Editor returned FAIL (STRUCTURAL or unclassified). Retrying full Writer (attempt $retry of $((MAX_RETRIES - 1)))..."
        FORCE=true run_writer1
        FORCE=true run_writer2
        FORCE=true run_linguista
        FORCE=false
      fi

    else
      err "Editor produced unexpected output. Manual review required."
      info "Log: $log_file"
      exit 1
    fi
  done
}

# ─── REVIEWER (bilingual) ──────────────────────────────────────────────────
run_reviewer() {
  divider "📋  REVIEWER — Chapter ${CHAPTER} (Editorial Audit + Corrections, IT+SL)"

  if ! should_run "$REVIEW"; then
    ok "Review exists. Skipping (--force to override)."
    info "$REVIEW"
    return 0
  fi

  if ! $DRY_RUN && ! both_exist "$CHAPTER_FILE_IT" "$CHAPTER_FILE_SL"; then
    err "Chapter files (IT+SL) not found. Run: ./ralph.sh ${CHAPTER} writer"
    exit 1
  fi

  local log_file; log_file=$(log_run "reviewer")
  log "Running Reviewer... (log: ${log_file##*/})"

  local struttura_line=""
  file_exists "$STRUTTURA" && struttura_line="- Read ${STRUTTURA} — NUFs and BEAT LIST (original spec)"

  local PROMPT
  PROMPT=$(cat <<ENDPROMPT
You are THE REVIEWER — Senior editor + continuity keeper for this bilingual book project.
You read like the skeptical target reader described in PRD.md — TWICE: once as an Italian 2nd-year middle schooler, once as a Slovenian one.
You test whether the text shows or merely tells, and whether the SL edition reads as its own text or a translation.

## Mandatory First Steps (stateless — read everything fresh)
1. Read ${PRD} — target reader, tone, success criteria, structure table
2. Read ${STYLE_BIBLE} — voice rules, Alex/Maja personas, § Anti-Calco, forbidden patterns
${struttura_line}
3. Read ${CHAPTER_FILE_IT} and ${CHAPTER_FILE_SL} — the chapters to review

## Score Across 6 Dimensions (/10 each = 60 total), computed SEPARATELY for IT and SL
1. Narrativa & Struttura
2. Lingua, Stile & Voce (for SL: naturalness, not-a-calque)
3. Accuratezza Storica (facts traceable; for Slovenia beats, cross-checked against Slovenian sourcing)
4. Allineamento al Pubblico (11-13 anni)
5. Coinvolgimento Sensoriale & Emotivo
6. Equilibrio delle Tre Voci (does the chapter respect its EU/GIULIA/SLOVENIA balance, or is Slovenia a weak alibi?)

## Decision Thresholds (apply to the LOWER of the two language scores)
- Score ≥ 48/60 → REVIEWER_PASS_MINOR: apply inline corrections to both ${CHAPTER_FILE_IT} and ${CHAPTER_FILE_SL}
- Score 36–47/60 → REVIEWER_CORRECTIONS: rewrite identified paragraphs in both files
- Score < 36/60 → REVIEWER_REWRITE: write ${REWRITE_PLAN}, do not touch either chapter file

## Mandatory In Every Review
- ≥3 paragraph rewrites PER LANGUAGE with: Original / Rewritten / Why format
- Persona audit for both Alex and Maja: sound intact, or drifted?
- Anti-calco audit: any passage where SL reads as translated IT (or vice versa)?
- Litmus test: "Lo studente finirebbe pensando 'l'ho vissuto' — o 'me l'hanno raccontato'? E la parte slovena suona come una storia propria?"

## Output Files

### Always write: ${REVIEW}
Structure:
  1. Executive Summary (max 10 lines — verdict immediately, both languages)
  2. Score: IT X/60, SL X/60 → [decision code]
  3. Detailed Findings by section, per language (quote exact text)
  4. Persona Audit (Alex + Maja)
  5. Anti-Calco Audit
  6. Priority Improvements: Critical / Important / Optional
  7. Rewritten Paragraphs (≥3 per language, Original / Rewritten / Why)
  8. Verdict: [decision code + one-line reason]

### If REVIEWER_PASS_MINOR or REVIEWER_CORRECTIONS:
Apply corrections/rewrites directly to ${CHAPTER_FILE_IT} and ${CHAPTER_FILE_SL} using the Edit tool.
Then update ${CHAPTER_INDEX} (create if this is the first chapter to PASS): append a section for Chapter ${CHAPTER} with:
  ### Termini canonici (bilingue)
  ### Affermazioni storiche centrali
  ### Posizioni narrative adottate
Print: "REVIEWER PASS ✓ Score IT: X/60 | Score SL: X/60"

### If REVIEWER_REWRITE:
Write ${REWRITE_PLAN} with: Root Cause Analysis / New Beat List Recommendation / Researcher Gaps / Writer Anti-Patterns (per language).
Do NOT modify either chapter file. Do NOT update chapter_index.md.
Print: "REVIEWER REWRITE NEEDED ✗ Score IT: X/60 | Score SL: X/60 — rewrite plan written"
ENDPROMPT
)

  local output exit_code=0
  output=$(run_agent "reviewer" "$PROMPT" "$log_file") || exit_code=$?
  if [[ $exit_code -ne 0 ]]; then
    err "Reviewer: ${RESOLVED_AGENT} exited with code ${exit_code}. Check log: ${log_file##*/}"
    [[ -f "$log_file" && -s "$log_file" ]] && { warn "Log tail:"; tail -5 "$log_file" >&2; }
    exit 1
  fi
  $DRY_RUN && { ok "[DRY-RUN] Would write: $REVIEW"; return 0; }

  if file_exists "$REVIEW"; then
    local verdict_line; verdict_line=$(grep -m1 "^REVIEWER " <<<"$output" || true)
    [[ -n "$verdict_line" ]] && ok "$verdict_line" || ok "Review written: $REVIEW"
  else
    err "Reviewer failed to produce review file. Check log: $log_file"
    exit 1
  fi
}

# ─── REVIEW ALL ─────────────────────────────────────────────────────────────
run_review_all() {
  divider "📋  REVIEWER — All Chapters (Book-Wide Editorial Audit, IT+SL)"

  local chapters_found=()
  local rewrite_count=0 pass_count=0

  for ch in $(seq 0 50); do
    both_exist "${PROJECT_DIR}/chapter_${ch}_it.md" "${PROJECT_DIR}/chapter_${ch}_sl.md" && chapters_found+=("$ch")
  done

  if [[ ${#chapters_found[@]} -eq 0 ]]; then
    warn "No chapter files (IT+SL pairs) found in ${PROJECT_DIR}."
    exit 0
  fi

  log "Found ${#chapters_found[@]} chapters to review: ${chapters_found[*]}"
  echo ""

  for ch in "${chapters_found[@]}"; do
    CHAPTER="$ch"
    STRUTTURA="${PROJECT_DIR}/chapter_${CHAPTER}_struttura.md"
    CHAPTER_FILE_IT="${PROJECT_DIR}/chapter_${CHAPTER}_it.md"
    CHAPTER_FILE_SL="${PROJECT_DIR}/chapter_${CHAPTER}_sl.md"
    REVIEW="${PROJECT_DIR}/review_chapter_${CHAPTER}.md"
    REWRITE_PLAN="${PROJECT_DIR}/rewrite_plan_chapter_${CHAPTER}.md"
    run_reviewer
    file_exists "$REWRITE_PLAN" && rewrite_count=$((rewrite_count + 1)) || pass_count=$((pass_count + 1))
  done

  echo ""
  divider "📋  REVIEWER — Book-Wide Summary"
  ok "Chapters reviewed: ${#chapters_found[@]}"
  ok "  PASS / corrections: ${pass_count}"
  [[ $rewrite_count -gt 0 ]] && err "  Full rewrites needed: ${rewrite_count}"

  if [[ $rewrite_count -ge 3 ]]; then
    warn "⚠️  ${rewrite_count} chapters need full rewrite. Generating ${BOOK_REWRITE_PLAN}..."
    local log_file; log_file=$(log_run "book_rewrite_plan")

    local rewrite_list=""
    for ch in "${chapters_found[@]}"; do
      local rp="${PROJECT_DIR}/rewrite_plan_chapter_${ch}.md"
      file_exists "$rp" && rewrite_list+="- Chapter ${ch}: ${rp}\n"
    done

    local PROMPT
    PROMPT=$(cat <<ENDPROMPT
You are THE REVIEWER synthesizing a book-level rewrite plan for a bilingual (IT+SL) book.

Read PRD.md for context.
Read each rewrite plan listed below and synthesize cross-chapter patterns, noting whether failures cluster in IT, in SL, or in both.

Rewrite plans to read:
$(printf '%b' "$rewrite_list")

Write ${BOOK_REWRITE_PLAN} with:
  # Book Rewrite Plan
  ## Executive Summary
  ## Cross-Chapter Failure Patterns (problems appearing in ≥2 chapters; note IT-only / SL-only / both)
  ## Recommended Structural Changes
  ## Pipeline Diagnosis (Writer failure? Researcher gaps? Architect NUF errors? Persona mismatch? Linguista anti-calco failures?)
  ## Suggested Action Plan (ordered: fix first → can wait → parallel)

After writing, print: "BOOK_REWRITE_PLAN DONE ✓"
ENDPROMPT
)
    run_agent "reviewer" "$PROMPT" "$log_file" || true
    file_exists "$BOOK_REWRITE_PLAN" && ok "Book rewrite plan: $BOOK_REWRITE_PLAN"
  fi

  log "Review complete. Check review_chapter_X.md files for per-chapter findings."
}

# ─── FULL PIPELINE ─────────────────────────────────────────────────────────
run_full_pipeline() {
  log "Starting full pipeline — Chapter ${CHAPTER} (IT+SL)"
  log "Force: ${FORCE}"
  log "Project: ${PROJECT_DIR}"
  print_phase_model_summary
  echo ""

  run_architect
  run_researcher
  run_writer1
  run_writer2
  run_linguista
  run_editor
  run_reviewer

  echo ""
  ok "Pipeline complete — Chapter ${CHAPTER}"
  echo ""
  show_status
}

# ─── MAIN ──────────────────────────────────────────────────────────────────
cd "$PROJECT_DIR"

FORCE_STR=""; $FORCE && FORCE_STR=" | FORCE"
DRYRUN_STR=""; $DRY_RUN && DRYRUN_STR=" | DRY-RUN"

echo ""
echo -e "${BOLD}Ralph Loop V5.1 (Edu/Bilingue) — 7-Agent Stateless Writing Pipeline${NC}"
echo -e "  Chapter: ${BOLD}${CHAPTER}${NC} | Phase: ${BOLD}${PHASE}${NC}${FORCE_STR}${DRYRUN_STR}"
echo -e "  Models: ${DIM}$(phase_selector_summary "$PHASE")${NC}"
echo ""

case "$PHASE" in
  all)         run_full_pipeline ;;
  architect)   run_architect ;;
  researcher)  run_researcher ;;
  writer)      run_writer1; run_writer2 ;;
  writer1)     run_writer1 ;;
  writer2)     run_writer2 ;;
  linguista)   run_linguista ;;
  repair)      run_repair ;;
  editor)      run_editor ;;
  reviewer)    run_reviewer ;;
  review_all)  run_review_all ;;
  status)      show_status ;;
  *)
    err "Unknown phase: ${PHASE}"
    echo "Valid phases: all | architect | researcher | writer | writer1 | writer2 | linguista | repair | editor | reviewer | status"
    exit 1
    ;;
esac
