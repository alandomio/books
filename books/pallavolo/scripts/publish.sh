#!/bin/bash

# Master Publish Script
# 1. Generates PDF/EPUB
# 2. Pushes to GitHub (optional argument --github)

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

echo "=== PALLAVOLO BOOK PUBLISHER ==="

# 1. Generate Formats
python3 "$SCRIPT_DIR/publish.py"

# 2. GitHub (if requested)
if [ "$1" == "--github" ]; then
    bash "$SCRIPT_DIR/publish_github.sh"
else
    echo "Skipping GitHub sync. Use --github to publish."
fi

echo "=== DONE ==="
