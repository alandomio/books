#!/bin/bash

# ralph.sh - Launcher for the Ralph Wiggum Agent Loop

echo "🦄 Starting Ralph Wiggum Agent Loop..."
echo "📂 Working Directory: $(pwd)"

# Ensure we are in the right place or variables are set
PROJECT_DIR="/Users/a.domio/books/books/gdpr_pp"

# Navigate to project dir
cd "$PROJECT_DIR" || exit

echo "📜 Loading Context..."
echo "   - PRD.md"
echo "   - INSTRUCTION.md"
echo "   - PROMPT.md"

# Launch Claude Code
# We perform a concatenation of the context files because the CLI flags may vary.
echo "🚀 Launching Claude..."

CONTEXT="
SYSTEM PROMPT:
$(cat PROMPT.md)

PROJECT REQUIREMENTS (PRD):
$(cat PRD.md)

INSTRUCTIONS:
$(cat INSTRUCTION.md)

TASK:
Hello Ralph. Please read the Context above.
1. Acknowledge your role.
2. Tell me what the first task is from the PRD.
3. If you need any specific tech stack details (Oracle Questions) before starting Chapter 1, list them now.
"

claude "$CONTEXT"

