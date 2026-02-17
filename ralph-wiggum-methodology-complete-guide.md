# Ralph Wiggum Methodology - Complete Implementation Guide

## Overview

The Ralph Wiggum methodology is an autonomous, iterative development approach for LLM-powered agents. Named after the persistent Simpsons character, it enables "AFK coding" through a write-test-fail-fix cycle with fresh context windows and file-system-based memory.

**Core Philosophy**: Persistence over perfection. Iteration over inspiration.

## Key Principles

### 1. File System as Memory
- Agent reads current state from disk each iteration
- No reliance on conversational history
- Progress persists across context resets
- **PLAN.md**: Task tracking with `[ ]` (pending) and `[x]` (complete) markers
- **activity.md**: Iteration-by-iteration progress log
- **Source files**: Current implementation state

### 2. Fresh Context Windows
- Each iteration starts with a clean slate
- No context pollution or "context rot"
- Prevents reasoning degradation in long-running sessions
- Agent rediscovers state from disk artifacts

### 3. Fail Forward Philosophy
- Agent is NOT expected to be perfect on first try
- Each iteration gets closer to the goal
- Errors guide the next attempt
- Circuit breaker prevents infinite loops (3 failures on same task)

### 4. Backpressure Guidance
Quality gates guide development:
- **TypeScript type-check**: Defines type safety
- **Linting (oxlint/ESLint)**: Defines code quality
- **Unit tests (Vitest)**: Defines correctness
- Agent follows these signals to "fail forward"

### 5. Atomic Operations
- **One task per iteration**: Maintains context density
- **One commit per task**: Focused, reviewable changes
- **All-or-nothing validation**: Must pass all gates before commit

## System Architecture

### Core Scripts

#### ralph.sh (Main Orchestrator)
```bash
#!/bin/bash
# Runs autonomous development loop
# Usage: ./ralph.sh <max_iterations>

for ((i=1; i<=$1; i++)); do
  # Execute Claude Code with fresh context
  claude -p "$(cat PROMPT.md)" --dangerously-skip-permissions
  
  # Check completion signal
  if grep -q "<promise>COMPLETE</promise>"; then
    exit 0
  fi
  
  # Check circuit breaker (same task 3x)
  # Exit if stuck
done
```

**Key Features**:
- Tracks git commits as proof of progress
- Circuit breaker stops after 3 failures on same task
- Supports model selection (Haiku/Sonnet/Opus)
- Logs all activity to activity.md

#### PROMPT.md (Agent Instructions)
**5-Phase Workflow** executed each iteration:

**Phase 0: Orientation**
- Read PLAN.md (task list)
- Read activity.md (history)
- Read current source files

**Phase 1: Task Selection**
- Find highest priority incomplete task
- Select exactly ONE task to work on

**Phase 2: Implementation**
- Write/modify code
- Follow TDD (test-first)
- Adhere to TypeScript best practices

**Phase 3: Validation**
- Run type-check (must pass)
- Run lint (must pass)
- Run tests (must pass)
- Fix and retry within iteration if fails

**Phase 4: Persistence**
- Update activity.md with progress
- Mark task complete in PLAN.md (`@@passed:true`)
- Create atomic git commit (conventional format)

**Phase 5: Completion Check**
- All tasks done? → Output `<promise>COMPLETE</promise>`
- Tasks remain? → Next iteration

#### ralph-control.sh (Control Panel)
```bash
./ralph-control.sh status      # Current progress
./ralph-control.sh validate    # Run quality gates
./ralph-control.sh next-task   # See what's next
./ralph-control.sh stats       # Detailed statistics
./ralph-control.sh reset       # Clear activity log
```

#### ralph-monitor.sh (Real-time Dashboard)
- Phase completion percentages
- Current task display
- Recent activity log
- Git commit history
- Auto-refreshes every 10 seconds

#### ralph-preflight.sh (Pre-flight Checks)
- Validates required files exist
- Checks dependencies installed
- Verifies git status
- Runs baseline quality gates

### Model Selection & Cost Optimization

```bash
# Default: Haiku 4.5 (best value)
./ralph.sh 50

# Legacy Haiku 3.5
RALPH_MODEL=haiku-3.5 ./ralph.sh 50

# Sonnet 3.5 (complex reasoning)
RALPH_MODEL=sonnet ./ralph.sh 50

# Sonnet 4.5 (maximum reasoning)
RALPH_MODEL=sonnet-4 ./ralph.sh 50

# Opus 4.5 (critical work)
RALPH_MODEL=opus ./ralph.sh 50
```

**Cost Comparison** (per 1M input tokens):
- **Haiku 4.5**: $1.00 - Best cost/performance, comparable to Sonnet 4 (recommended for 80% of work)
- **Haiku 3.5**: $1.00 - Legacy model
- **Sonnet 3.5**: $3.00 - Complex logic/architecture
- **Sonnet 4.5**: ~$3.00 - Latest capabilities
- **Opus 4.5**: $15.00 - Critical decisions only

**Strategy**: Start with Haiku 4.5. Escalate to Sonnet 4.5 if stuck 3x.

## Safety Features

### Circuit Breaker (Enhanced)
Tracks **git commits** as proof of progress:
```bash
if [ "$current_commit" != "$LAST_GIT_COMMIT" ]; then
  # New commit = progress made
  STUCK_COUNT=0
else
  # No commit + same task = stuck
  STUCK_COUNT=$((STUCK_COUNT + 1))
  if [ $STUCK_COUNT -ge 3 ]; then
    # Trigger circuit breaker
    exit 1
  fi
fi
```

**Prevents**:
- False positives from deferred tasks
- Infinite loops on failing tests
- API token waste

**Triggers when**:
- 3 iterations with no commits
- Same task description
- Requires human intervention

### Quality Gates
All must pass before commit:
1. **Type Check**: No `any` types, proper type guards
2. **Lint**: Code style and best practices
3. **Tests**: Functionality and correctness

### Progress Tracking
- **PLAN.md**: `[ ]` → `[x]` and `@@passed:false` → `@@passed:true`
- **activity.md**: Timestamped iteration log
- **Git commits**: Atomic, conventional format

## Usage Patterns

### Quick Start (3 Steps)
```bash
cd packages/infra-agent

# 1. Pre-flight check
./ralph-preflight.sh

# 2. Start loop (50 iterations)
./ralph.sh 50

# 3. Monitor (optional, separate terminal)
./ralph-monitor.sh
```

### AFK Coding (Overnight)
```bash
# Run in background
nohup ./ralph.sh 200 > ralph-output.log 2>&1 &

# Monitor next morning
./ralph-control.sh status
tail -f ralph-output.log
```

### Supervised Development
```bash
# Terminal 1: Run loop
./ralph.sh 50

# Terminal 2: Monitor dashboard
./ralph-monitor.sh

# Terminal 3: Check status
./ralph-control.sh status
```

### Testing Changes
```bash
# Short test run
./ralph.sh 10

# Review commits
git log --oneline -10

# Check activity
cat activity.md
```

## Troubleshooting

### Circuit Breaker Activated
**Cause**: Same task failed 3 times with no commits

**Fix**:
1. `./ralph-control.sh status` - See stuck task
2. Check activity.md for error details
3. Manually fix the blocker
4. Mark task complete in PLAN.md
5. Resume with `./ralph.sh 50`

### Quality Gates Failing
**Cause**: Tests/lint/type-check failing

**Fix**:
```bash
./ralph-control.sh validate              # See failures
pnpm --filter <package> lint:fix         # Auto-fix lints
pnpm --filter <package> test:run         # Debug tests
pnpm --filter <package> type-check       # Check types
```

### No Progress Multiple Iterations
**Cause**: Task too complex or unclear

**Fix**:
1. Stop loop (Ctrl+C)
2. Review activity.md
3. Break task into smaller sub-tasks in PLAN.md
4. Restart

### API Rate Limits
**Cause**: Too many Claude API requests

**Fix**:
1. Stop loop
2. Wait for reset
3. Resume (continues where left off)

## Expected Performance

### Typical Iteration
- **Duration**: 2-5 minutes
- **Actions**: Read → Implement → Test → Commit
- **Output**: 1 git commit, updated activity.md

### Phase Completion
- **Duration**: 2-4 hours
- **Iterations**: 20-30
- **Tasks**: 15-20 completed
- **Files Modified**: 5-10

### Full Implementation
- **Duration**: 8-12 hours
- **Iterations**: 60-100
- **Tasks**: 50-70 completed
- **Files Modified**: 15-25
- **Tests Added**: 50+ tests

## Integration with TypeScript Monorepos

### Monorepo Structure
```
packages/
├── infra-agent/           # Investigation agent package
│   ├── ralph.sh          # Orchestrator
│   ├── PROMPT.md         # Agent instructions
│   ├── PLAN.md           # Task tracking
│   └── src/              # Source code
└── shared/               # Shared utilities
```

### Package Configuration
```json
{
  "name": "@project/infra-agent",
  "scripts": {
    "test": "vitest run",
    "lint": "eslint .",
    "typecheck": "tsc --noEmit",
    "verify": "pnpm lint && pnpm typecheck && pnpm test"
  }
}
```

### CLAUDE.md Integration
Place at package root:
- TypeScript conventions (no `any`, type guards)
- Test patterns (Vitest)
- Build commands (Turbo)
- Code style preferences

### XState Integration (for FSM Development)
Ralph works excellently with XState finite state machines:
- **States**: Model investigation lifecycle
- **Actors**: Wrap MCP server calls
- **Guards**: Type-safe transitions
- **Testing**: TDD for each state/transition

## Best Practices

### Do:
✅ Check status before starting
✅ Monitor first few iterations
✅ Run validation after manual changes
✅ Review commits periodically
✅ Keep PLAN.md up to date
✅ Use Haiku 4.5 by default (cost-effective)

### Don't:
❌ Edit code while loop running (conflicts!)
❌ Delete activity.md during execution
❌ Modify PROMPT.md mid-loop
❌ Force-push Ralph's commits
❌ Run without pre-flight checks

## Common Commands Reference

```bash
# Setup & Start
./ralph-preflight.sh                      # Pre-flight check
./ralph.sh 50                             # Standard run (Haiku 4.5)
RALPH_MODEL=sonnet ./ralph.sh 50          # Use Sonnet

# Monitoring
./ralph-control.sh status                 # Current status
./ralph-control.sh stats                  # Detailed stats
./ralph-control.sh next-task              # What's next
./ralph-monitor.sh                        # Live dashboard

# Validation
./ralph-control.sh validate               # Run quality gates
pnpm --filter <package> test:run          # Run tests
pnpm --filter <package> type-check        # Check types

# Git Operations
git log --oneline -20                     # Recent commits
git diff HEAD~5                           # Review changes
cat activity.md                           # Full activity log

# Background Operations
nohup ./ralph.sh 200 > ralph.log 2>&1 &   # Background run
tail -f ralph.log                         # Watch output
ps aux | grep ralph.sh                    # Find process
kill [PID]                                # Stop background
```

## File System Structure

```
packages/infra-agent/
├── ralph.sh                  # Main orchestrator (executable)
├── ralph-preflight.sh        # Pre-flight checks (executable)
├── ralph-control.sh          # Control commands (executable)
├── ralph-monitor.sh          # Real-time monitor (executable)
├── PROMPT.md                 # Agent instructions (don't modify during run)
├── PLAN.md                   # Task tracking (auto-updated)
├── activity.md               # Auto-generated log
├── RALPH.md                  # Full methodology
├── RALPH_README.md           # System overview
├── RALPH_QUICKSTART.md       # Quick start guide
├── RALPH_SETUP.md            # Detailed setup
├── RALPH_CHANGELOG.md        # Version history
├── RALPH_CIRCUIT_BREAKER_FIX.md  # Circuit breaker details
├── RALPH_IMPLEMENTATION_SUMMARY.md  # Implementation summary
└── ralph-architecture.md     # Architecture diagrams
```

## Key Fixes & Improvements

### Circuit Breaker Enhancement (2026-01-28)
**Problem**: False positives on deferred tasks
**Solution**: Track git commits instead of just task names
```bash
# Before: Task-name based (buggy)
if [ "$current_task" = "$LAST_TASK" ]; then
  STUCK_COUNT=$((STUCK_COUNT + 1))
fi

# After: Git-commit based (fixed)
if [ "$current_commit" != "$LAST_GIT_COMMIT" ]; then
  STUCK_COUNT=0  # Progress made!
fi
```

### Task Extraction Fix
**Problem**: Broken regex deleted all task text
```bash
# Before (broken):
sed 's/^[^#]*#*//'  # Matched entire line

# After (fixed):
sed 's/^- \[ \] //'  # Only removes checkbox
```

### Bash grep -c Bug Fix
**Problem**: `grep -c "pattern" || echo "0"` appended "0" even on success
**Solution**: Use `wc -l` pattern instead
```bash
# Before (buggy):
count=$(grep -c "pattern" file || echo "0")

# After (fixed):
count=$(grep "pattern" file 2>/dev/null | wc -l | tr -d ' ')
[ -z "$count" ] && count=0
```

## When to Use Ralph Wiggum

### Ideal Use Cases:
✅ Well-defined implementation plans
✅ Clear acceptance criteria (tests)
✅ Routine implementation work
✅ Monorepo package development
✅ FSM/state machine implementations
✅ Infrastructure tooling
✅ Known architectural patterns

### Not Suitable For:
❌ Open-ended research
❌ Unclear requirements
❌ Highly novel solutions
❌ Architecture decisions (use human)
❌ Security-critical code (needs review)

## Success Criteria

Loop is successful when:
- ✅ All tasks in PLAN.md marked complete
- ✅ All quality gates passing
- ✅ Agent outputs `<promise>COMPLETE</promise>`
- ✅ Git history shows atomic commits
- ✅ activity.md documents journey

## Philosophy Summary

**Problem Solved**:
Traditional AI coding suffers from context rot, manual intervention, and progress loss.

**Solution**:
- Fresh context each iteration (no pollution)
- File system as persistent memory
- Automatic quality gates (backpressure)
- Circuit breakers (safety)
- Atomic commits (reviewability)

**Human Role**:
"Sit on the loop, not in it" - Engineer the environment, prompts, and validation criteria. Let AI execute.

**Result**:
8-12 hours of autonomous, reliable development work.

---

## References

Original methodology by **Geoffrey Huntley**, popularized late 2025.

Core insight: LLMs are mirrors of operator skill. With clear specs and backpressure, they "fail forward" into working solutions.

**"Ralph Wiggum eats paste, but he never gives up."**


# Ralph Wiggum Methodology: Autonomous Loop Specification v2.0

## 1. System Manifest

The setup agent must ensure the following file structure exists in the target directory.

| File | Permission | Purpose |
| --- | --- | --- |
| `ralph.sh` | `755` (Executable) | The main event loop orchestrator. |
| `ralph-preflight.sh` | `755` (Executable) | Environment validation and dependency checks. |
| `ralph-control.sh` | `755` (Executable) | User interface for status and maintenance. |
| `PROMPT.md` | `644` (Read) | The immutable system prompt for the LLM. |
| `PLAN.md` | `644` (Read/Write) | The task queue (Markdown checklist). |
| `activity.md` | `644` (Append) | The immutable execution log. |
| `.env.ralph` | `600` (Read) | Configuration (API Keys, Model selection). |

---

## 2. Core Script Specifications

*Use these exact contents when generating files.*

### 2.1 `ralph.sh` (The Orchestrator)

```bash
#!/bin/bash
# ralph.sh - Autonomous Development Loop Orchestrator
# Strict Mode
set -u

MAX_ITERS=${1:-50}
MODEL=${RALPH_MODEL:-"claude-3-haiku-20240307"} # Default to Haiku 3.5/4.5 equivalent
STUCK_THRESHOLD=3

# Ensure we have a plan
if [ ! -f PLAN.md ]; then
    echo "❌ PLAN.md missing. Please create a task list."
    exit 1
fi

echo "🚀 Starting Ralph Wiggum Loop ($MAX_ITERS iterations) using $MODEL..."

for ((i=1; i<=MAX_ITERS; i++)); do
    echo "--- Iteration $i / $MAX_ITERS ---"
    
    # 1. Capture State for Circuit Breaker
    LAST_COMMIT=$(git rev-parse HEAD 2>/dev/null || echo "init")
    
    # 2. Execute Agent (Claude Code / LLM CLI wrapper)
    # Note: Assumes 'claude' CLI is installed and authenticated
    # Passes PROMPT.md as the system directive
    claude -p "$(cat PROMPT.md)" --dangerously-skip-permissions
    
    # 3. Check for Completion Signal
    if grep -q "<promise>COMPLETE</promise>" activity.md; then
        echo "✅ Agent signaled completion."
        exit 0
    fi
    
    # 4. Circuit Breaker Logic
    CURRENT_COMMIT=$(git rev-parse HEAD 2>/dev/null || echo "init")
    
    if [ "$CURRENT_COMMIT" == "$LAST_COMMIT" ]; then
        STUCK_COUNT=${STUCK_COUNT:-0}
        STUCK_COUNT=$((STUCK_COUNT + 1))
        echo "⚠️  Warning: No git commit generated (Stuck count: $STUCK_COUNT/$STUCK_THRESHOLD)"
        
        if [ $STUCK_COUNT -ge $STUCK_THRESHOLD ]; then
            echo "🚨 Circuit Breaker Triggered: Agent failed to progress for 3 iterations."
            echo "   Action: Check activity.md and PLAN.md manually."
            exit 1
        fi
    else
        STUCK_COUNT=0
        echo "✅ Progress detected (Commit: ${CURRENT_COMMIT:0:7})"
    fi
    
    # Optional: Rate limit backoff
    sleep 2
done

echo "⏹️  Max iterations reached."

```

### 2.2 `PROMPT.md` (The Brain)

*This is the system prompt that drives the autonomous behavior.*

```markdown
You are Ralph, an autonomous developer agent. Your goal is to complete tasks from `PLAN.md` by modifying the codebase, running tests, and committing changes.

**OPERATIONAL CONSTRAINTS:**
1.  **File System is Memory:** You do not have conversation history. You must read `PLAN.md`, `activity.md`, and source files to understand your state.
2.  **Iterative Workflow:** You perform exactly ONE iteration of work per execution.
3.  **Atomic Commits:** You must commit your work to git if and only if quality gates pass.

**EXECUTION LOOP (Perform these steps in order):**

**PHASE 1: ORIENTATION**
* Read `PLAN.md`. Identify the first unchecked task (`- [ ]`).
* Read `activity.md`. See what happened in the previous iteration.

**PHASE 2: IMPLEMENTATION**
* Select the task.
* Write or modify code to satisfy the task.
* **MANDATORY:** Create/Update a Unit Test for this task before marking it complete.

**PHASE 3: VALIDATION (The Quality Gate)**
* Run the project's build/check command (e.g., `npm test`, `cargo check`).
* IF FAILURE: Attempt to fix the code immediately.
* IF SUCCESS: Proceed to Phase 4.

**PHASE 4: PERSISTENCE**
* Git add and commit with a conventional commit message (e.g., `feat: implement login handler`).
* Update `PLAN.md`: Change `[ ]` to `[x]` for the completed task.
* Append a log entry to `activity.md` with:
    * Timestamp
    * Task ID
    * Outcome (Success/Fail)
    * Files changed

**PHASE 5: COMPLETION CHECK**
* Scan `PLAN.md`.
* IF all tasks are `[x]`, print strictly: `<promise>COMPLETE</promise>` to stdout/activity log.
* IF tasks remain, exit so the loop can restart.

**CRITICAL RULES:**
* NEVER leave the codebase in a broken state (tests failing) when committing.
* NEVER remove `activity.md`.
* If you get stuck, log the error in `activity.md` and move to the next task if possible, or mark the current task as `failed`.

```

### 2.3 `ralph-control.sh` (The Interface)

```bash
#!/bin/bash
# ralph-control.sh - Interaction Utility

COMMAND=$1

case $COMMAND in
  status)
    echo "📊 Project Status:"
    total=$(grep -c "\- \[" PLAN.md)
    done=$(grep -c "\- \[x\]" PLAN.md)
    echo "   Progress: $done / $total tasks"
    echo "   Last Activity:"
    tail -n 3 activity.md
    ;;
  
  reset)
    echo "WARNING: This will clear activity.md. Continue? (y/n)"
    read -r confirm
    if [ "$confirm" == "y" ]; then
        echo "# Ralph Activity Log" > activity.md
        echo "Cleared activity log."
    fi
    ;;
    
  validate)
    echo "Running Quality Gates..."
    # Replace with specific project commands
    if [ -f package.json ]; then npm test; fi
    if [ -f Cargo.toml ]; then cargo test; fi
    ;;
    
  *)
    echo "Usage: ./ralph-control.sh [status|reset|validate]"
    ;;
esac

```

---

## 3. Setup Logic for Agents

When an agent is asked to "Implement Ralph Wiggum," it should execute the following logic:

1. **Check Dependencies:**
* Verify `git`, `jq`, `curl` are installed.
* Verify an LLM CLI tool (e.g., `claude`, `llm`, or a custom python script) is available in `$PATH`.


2. **Scaffold Files:**
* Write the scripts defined in **Section 2** to disk.
* `chmod +x *.sh`.


3. **Initialize Git:**
* `git init` (if not already a repo).
* `git ignore` logic should include `.env.ralph`.


4. **Create Baselines:**
* Create an empty `activity.md` with header `# Ralph Activity Log`.
* Create a template `PLAN.md`:
```markdown
# Implementation Plan
- [ ] Validated Environment Setup
- [ ] (Add your tasks here)

```





---

## 4. Troubleshooting & Self-Correction Logic

*Guidance for the agent to resolve common runtime issues.*

### 4.1 "Sed" Compatibility

MacOS and Linux `sed` differ. The agent should use this function for in-place editing of `PLAN.md`:

```bash
safe_sed() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        sed -i '' "$@"
    else
        sed -i "$@"
    fi
}

```

### 4.2 Handling "Grep" Failures

When counting tasks, standard grep returns exit code 1 if 0 lines are found, potentially crashing the script if `set -e` is on.
*Correct Implementation:*

```bash
# Correct way to count without crashing
count=$(grep "pattern" file 2>/dev/null | wc -l | tr -d ' ')

```

### 4.3 The "Stuck" Condition

If the Circuit Breaker trips:

1. **Diagnose:** The Agent is likely looping on a compilation error or a test failure it cannot fix.
2. **Resolution:** The setup agent does not resolve this; the *human operator* must intervene or the LLM model must be upgraded (e.g., switch `RALPH_MODEL` from `haiku` to `sonnet` via env var).

