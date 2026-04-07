#!/bin/bash

# serena_ralph_kickstart.sh - Inizializzatore Progetti Libri Ralph V5
# Utilizzo: ./scripts/serena_ralph_kickstart.sh [PROJECT_NAME]

PROJECT_NAME=$1

if [ -z "$PROJECT_NAME" ]; then
    echo "❌ Errore: specifica un nome per il progetto."
    echo "Utilizzo: ./scripts/serena_ralph_kickstart.sh [PROJECT_NAME]"
    exit 1
fi

TARGET_DIR="books/$PROJECT_NAME"

echo "🚀 Inizializzazione progetto: $PROJECT_NAME in $TARGET_DIR..."

# 1. Crea directory
mkdir -p "$TARGET_DIR/ralph/prompts"
mkdir -p "$TARGET_DIR/chapters"

# 2. Copia i prompt template
cp ralph/prompts/*.md "$TARGET_DIR/ralph/prompts/"

# 3. Crea i file di base se non esistono
if [ ! -f "$TARGET_DIR/INSTRUCTIONS.md" ]; then
    cat <<EOF > "$TARGET_DIR/INSTRUCTIONS.md"
# 🚗 INSTRUCTIONS.md - $PROJECT_NAME

## 1. PROJECT DEFINITION
| Attribute | Value |
| :--- | :--- |
| **Title** | $PROJECT_NAME |
| **Topic** | [Inserisci Topic] |
| **Audience** | [Inserisci Audience] |
| **The Enemy** | [Inserisci Enemy] |
| **The Vibe** | [Inserisci Vibe] |

## 2. THE WRITER (SOUL)
- **Persona:** [Scegli dallo Zoo delle Personae]
- **Style Details:** [Dettagli aggiuntivi]

## 3. STYLE RULES
- Zero Bullet points nella narrativa.
- Triangolazione obbligatoria dei dati.
EOF
fi

if [ ! -f "$TARGET_DIR/OUTLINE.md" ]; then
    echo "# OUTLINE: $PROJECT_NAME" > "$TARGET_DIR/OUTLINE.md"
fi

# 4. Inizializza PLAN e ACTIVITY
cat <<EOF > "$TARGET_DIR/PLAN.md"
# PLAN: $PROJECT_NAME
- [ ] Capitolo 1: [Titolo] @@passed:false
- [ ] Capitolo 2: [Titolo] @@passed:false
EOF

cat <<EOF > "$TARGET_DIR/activity.md"
# Ralph Activity Log - $PROJECT_NAME
[$(date '+%Y-%m-%d %H:%M:%S')] Project Initialized.
EOF

# 5. Crea l'orchestratore locale ralph.sh
cat <<EOF > "$TARGET_DIR/ralph.sh"
#!/bin/bash
# Local Ralph Orchestrator for $PROJECT_NAME

MAX_ITERS=\${1:-50}

for ((i=1; i<=MAX_ITERS; i++)); do
    echo "--- Iteration \$i ---"
    
    # Determina il ruolo basandosi sul file system
    # (Logica di switch dei prompt in base alla presenza di struttura/dossier/prosa)
    
    # Esempio semplificato:
    # claude -p "\$(cat ralph/prompts/writer.md)"
    
    sleep 2
done
EOF

chmod +x "$TARGET_DIR/ralph.sh"

echo "✅ Progetto inizializzato con successo!"
echo "📍 Directory: $TARGET_DIR"
echo "👉 Prossimi passi: configura INSTRUCTIONS.md e OUTLINE.md, poi avvia ralph.sh."
