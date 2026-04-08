#!/bin/bash

# ralph.sh - Orchestratore R.A.L.P.H. V5 Specialist (PayPal Mafia)
# Gestisce il loop: Architect (NUFs) -> Researcher (Pivot) -> Artigiano (DSR) -> Editor (Audit)

# --- CONFIGURAZIONE ---
CLI_TOOL="gemini"
ENGINE="gemini-ralph-loop"
MAX_ITERS=${1:-50}

echo "🚀 R.A.L.P.H. V5 Specialist Loop — Progetto: PayPal Mafia"
echo "🛠️  Mode: YOLO (Non-interactive)"
echo "🔄  Stateless Normalization: ON"
echo "🛑  Power-Down Enforcement: ACTIVE"

# --- EXECUTION LOOP ---
for ((i=1; i<=MAX_ITERS; i++)); do
    echo "============================================================"
    echo "🔹 Iterazione #$i"

    # 0. Normalizzazione File (Auto-rename per Statelessness)
    SPECIFIC_STRUTTURA=$(ls *_struttura.md 2>/dev/null | grep -v "current_struttura.md" | head -n 1)
    if [ -n "$SPECIFIC_STRUTTURA" ] && [ ! -f "current_struttura.md" ]; then
        echo "📦 Normalizzazione: $SPECIFIC_STRUTTURA -> current_struttura.md"
        mv "$SPECIFIC_STRUTTURA" current_struttura.md
    fi

    SPECIFIC_DOSSIER=$(ls dossier_*.md 2>/dev/null | grep -v "current_dossier.md" | head -n 1)
    if [ -n "$SPECIFIC_DOSSIER" ] && [ ! -f "current_dossier.md" ]; then
        echo "📦 Normalizzazione: $SPECIFIC_DOSSIER -> current_dossier.md"
        mv "$SPECIFIC_DOSSIER" current_dossier.md
    fi
    
    # 1. Identifica il Task Corrente dal PLAN.md
    RAW_TASK=$(grep -m 1 "\- \[ \]" PLAN.md)
    if [ -z "$RAW_TASK" ]; then
        echo "✅ TUTTI I TASK COMPLETATI! Uscita in corso..."
        exit 0
    fi
    CURRENT_TASK=$(echo "$RAW_TASK" | sed 's/- \[ \]//;s/^ *//;s/ *$//')
    echo "📍 Task Attivo: $CURRENT_TASK"

    # 2. Rilevamento Ruolo Specialistico (Protocollo Stateless V5)
    role=""
    role_prompt=""
    instruction=""

    if [ ! -f "current_struttura.md" ]; then
        role="ARCHITECT"
        role_prompt="ralph/prompts/architect.md"
        instruction="Esegui ARCHITECT ENGINE: Definisci i Beats e le NUFs."
    elif [ ! -f "current_dossier.md" ]; then
        role="RESEARCHER"
        role_prompt="ralph/prompts/researcher.md"
        instruction="Esegui RESEARCHER ENGINE: Effettua la triangolazione Pivot."
    elif [ ! -f "current_draft_prose.md" ]; then
        role="WRITER_STAGE_1"
        role_prompt="ralph/prompts/writer.md"
        instruction="Esegui ARTEGiano STAGE 1 (Prose Engine): Scrivi la bozza narrativa."
    elif [ ! -f "current_final.md" ]; then
        role="WRITER_STAGE_2"
        role_prompt="ralph/prompts/writer.md"
        instruction="Esegui ARTEGiano STAGE 2 (Refinement Engine): Applica la Style Bible."
    else
        role="EDITOR"
        role_prompt="ralph/prompts/editor.md"
        instruction="Esegui EDITOR AUDIT: Valuta le NUFs. Usa EXIT 2 (BLOCKED) per segnalare fallimenti."
    fi

    echo "🎭 Ruolo Attivo: $role"

    # 3. Assemblaggio del Contesto Stateless (Forzatura Chiusura)
    CONTEXT="
    ---
    SYSTEM_ROLE: $(cat "$role_prompt")
    ---
    PROJECT_INSTRUCTIONS:
    $(cat INSTRUCTIONS.md)
    ---
    PROJECT_PLAN:
    $(cat PLAN.md)
    ---
    $( [ -f feedback_loop.md ] && echo '⚠️ FEEDBACK PRECEDENTE:' && cat feedback_loop.md )
    ---
    ACTION_REQUIRED:
    Sei $role. Lavora sul task: '$CURRENT_TASK'.
    $instruction

    IMPORTANTE: Concludi il tuo lavoro con un riepilogo finale e scrivi rigorosamente '/quit' come ultimo comando per terminare la sessione.
    "

    # 4. Invocazione Agentica (YOLO + Pipe-to-Exit)
    echo "⚡ Invocazione di $CLI_TOOL (YOLO)..."
    printf "%s\n/quit\n" "$CONTEXT" | $CLI_TOOL --yolo -e "$ENGINE"
    EXIT_CODE=$?

    # 5. Gestione Stop-Hook e Cleanup
    if [ $EXIT_CODE -eq 2 ]; then
        echo "🛑 STOP-HOOK: L'Editor ha bloccato l'output. Ripartenza richiesta..."
        sleep 5
        continue
    elif [ $EXIT_CODE -eq 0 ] && [ "$role" == "EDITOR" ]; then
        echo "✨ VALIDAZIONE SUPERATA!"
        TIMESTAMP=$(date +%Y%m%d_%H%M%S)
        FINAL_NAME="capitolo_scena_${TIMESTAMP}.md"
        
        if [ -f current_final.md ]; then
            mv current_final.md "$FINAL_NAME"
            echo "[$(date '+%Y-%m-%d %H:%M:%S')] COMPLETED: $CURRENT_TASK -> $FINAL_NAME" >> activity.md
            rm -f current_struttura.md current_dossier.md current_draft_prose.md feedback_loop.md
            echo "🧹 Cleanup completato. Passaggio al prossimo task..."
        else
            echo "⚠️  ERRORE: current_final.md non trovato."
        fi
    fi

    echo "💤 Pausa di sicurezza..."
    sleep 3
done
