#!/bin/bash
# Local Ralph Orchestrator for ralph_test

MAX_ITERS=${1:-50}

for ((i=1; i<=MAX_ITERS; i++)); do
    echo "--- Iteration $i ---"
    
    # Determina il ruolo basandosi sul file system
    # (Logica di switch dei prompt in base alla presenza di struttura/dossier/prosa)
    
    # Esempio semplificato:
    # claude -p "$(cat ralph/prompts/writer.md)"
    
    sleep 2
done
