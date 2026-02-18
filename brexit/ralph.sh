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
