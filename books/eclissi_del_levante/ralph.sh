#!/bin/bash

# ralph.sh - Launcher for the Ralph Wiggum Agent Loop (Gemini Plugin)

echo "============================================================"
echo "💉 AVVIO LABORATORIO: L'ANATOMISTA GONZO (RALPH FRAMEWORK)"
echo "📂 Working Directory: $(pwd)"
echo "============================================================"

echo "📜 Caricamento del Contesto..."
echo "   - INSTRUCTIONS.md"
echo "   - PROMPT.md"
echo "   - PLAN.md"
echo "   - activity.md"

CONTEXT="
SYSTEM PROMPT:
$(cat PROMPT.md)

PROJECT INSTRUCTIONS:
$(cat INSTRUCTIONS.md)

PROJECT PLAN E STATO:
$(cat PLAN.md)
$(cat activity.md)

TASK:
Sei 'L'Anatomista Gonzo'. Leggi il contesto, analizza lo stato in activity.md e avvia l'elaborazione del prossimo step previsto dal PLAN.md. Ricorda le regole e aggiorna l'activity al termine.
"

echo "🚀 Lancio del Loop Gemini Ralph..."
gemini -e gemini-ralph-loop "$CONTEXT"

echo "============================================================"
echo "🏁 ESECUZIONE TERMINATA. Controllare activity.md per il log."
echo "============================================================"
