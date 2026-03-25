#!/bin/bash

# Configuration
PROJECT_DIR="/home/alan/dev/books/books/pallavolo"
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

echo "--- Starting GitHub Publication ---"
cd "$PROJECT_DIR" || exit

# 1. Add changes
echo "Adding new files..."
git add chapters/*.md
git add styles/*.css
git add scripts/*
git add INSTRUCTIONS.md WRITING_PLAN.md

# 2. Commit
echo "Committing with timestamp: $TIMESTAMP"
git commit -m "Update Pallavolo Book Content ($TIMESTAMP)"

# 3. Push
echo "Pushing to remote..."
git push origin main

echo "--- GitHub Sync Complete ---"
