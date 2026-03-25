# Export Script Guidelines

Quando si crea o si aggiorna uno script di export per i progetti (es. `scripts/export_book.py`), bisogna seguire queste linee guida consolidate (ispirate al progetto "brexit"):

1. **Shebang Python**: Lo script deve sempre iniziare con lo shebang `#!/usr/bin/env python3`.
2. **Setup dell'ambiente**: Assicurarsi di impostare correttamente il `PATH` per trovare `pandoc`, `weasyprint` o `pdflatex`, specialmente su macOS (es. aggiungendo `/opt/homebrew/bin`).
3. **Esportazione EPUB**:
   - Usare `pandoc -f markdown+raw_html+fenced_divs`.
   - **CRITICO (Inclusione Copertina)**: La copertina (`cover.jpg`) **deve sempre** essere inserita nell'ebook. Passare a pandoc gli argomenti `--epub-cover-image=PATH_ALLA_COVER` e `--metadata cover-image=PATH_ALLA_COVER`.
   - **Fix CSS**: Per evitare errori di validazione EPUB, leggere il file `style.css`, rimuovere le direttive `@page` (usando una regex) e salvare un CSS temporaneo da dare in pasto a pandoc tramite `--css`.
4. **Esportazione PDF**:
   - Usare `weasyprint` o `pdflatex` come `--pdf-engine`.
   - Per includere la copertina nel PDF, generare un piccolo file HTML temporaneo (es. `temp_cover.html`) contenente il tag `<img src="...">` e includerlo in pandoc con `--include-before-body=temp_cover.html`.
5. **Dinamicità**: Lo script dovrebbe dedurre autonomamente quali capitoli esistono ed enumerarli nell'ordine corretto prima di passarli a pandoc.