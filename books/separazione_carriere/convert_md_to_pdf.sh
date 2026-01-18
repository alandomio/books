#!/bin/bash

# Script per convertire file Markdown in PDF usando Pandoc e WeasyPrint.

# Controlla se Pandoc è installato
if ! command -v pandoc &> /dev/null; then
    echo "Errore: pandoc non è installato."
    exit 1
fi

# Controlla se l'input è fornito
if [ -z "$1" ]; then
    echo "Usage: $0 <input_file.md> [css_file.css]"
    exit 1
fi

INPUT_FILE="$1"
CSS_FILE="${2:-pdf_style.css}"
OUTPUT_FILE="${INPUT_FILE%.md}.pdf"

# Controlla se il file di input esiste
if [ ! -f "$INPUT_FILE" ]; then
    echo "Errore: Il file di input '$INPUT_FILE' non esiste."
    exit 1
fi

# Se il file CSS non esiste nel percorso specificato, usa quello di default se presente
if [ ! -f "$CSS_FILE" ] && [ -f "pdf_style.css" ]; then
    CSS_FILE="pdf_style.css"
fi

echo "Sto convertendo '$INPUT_FILE' in '$OUTPUT_FILE'..."
echo "Utilizzo dello stile: $CSS_FILE"

# Esecuzione della conversione
pandoc "$INPUT_FILE" \
    --pdf-engine=weasyprint \
    --css="$CSS_FILE" \
    -o "$OUTPUT_FILE"

if [ $? -eq 0 ]; then
    echo "Conversione completata con successo: $OUTPUT_FILE"
else
    echo "Errore durante la conversione."
    exit 1
fi
