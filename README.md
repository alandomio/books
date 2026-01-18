# Monorepo Libri

Questo repository è un **monorepo** progettato per gestire la scrittura, la generazione e la pubblicazione di più libri utilizzando agenti AI e script automatizzati.

## 📂 Struttura

Il progetto è organizzato in workspace gestiti da NPM:

- **`books/`**: Contiene il codice sorgente e il testo di ogni libro.
    - **`@books/impero-romano`**: "L'Ultimo Orizzonte".
    - **`@books/tritacarne`**: "TRITACARNE".
    - *Altri progetti*: `musk`, `separazione_carriere`, `storia`, ecc. (Non ancora configurati come pacchetti).
- **`packages/`**: Strumenti e utility condivisi.
    - **`@books/book-tools`**: Tool CLI per rilasciare i libri su GitHub.

## 🤖 Framework di Scrittura AI
Abbiamo standardizzato il nostro approccio alla scrittura con agenti nel file:
👉 **[AI Writing Guru Guide](./ai_writing_guru_guide.md)**

Questa guida copre:
*   **The Agent Team**: Definizione dei ruoli (Architect, Researcher, Writer).
*   **The Writer Zoo**: Archetipi di scrittura (Gonzo, Bard, Analyst, ecc.).
*   **Deep Search**: Protocolli per il fact-checking frattalico.
*   **Workflow**: Come passare dall'idea alla bozza finale.

## 🛠 Strumenti e Flussi di Lavoro

### Prerequisiti
- **Node.js**: Per gestire il monorepo ed eseguire gli script.
- **GitHub CLI (`gh`)**: Per creare release su GitHub.
- **Python 3**: Per gli script di build sottostanti (`export_book.py`).
- **Pandoc, WeasyPrint, PDFLaTeX**: Strumenti principali per la conversione dei documenti.

### Installazione
Esegui `npm install` nella directory principale per installare le dipendenze e collegare i pacchetti locali.

```bash
npm install
```

### 📖 Lavorare su un Libro

Ogni libro configurato (come `impero_romano` o `tritacarne`) è un pacchetto distinto.

1. **Compilare un Libro (Build)**
   Naviga nella directory del libro ed esegui lo script di build. Questo di solito produce un PDF e un EPUB.
   ```bash
   cd books/impero_romano
   npm run build
   ```

2. **Pubblicare una Release**
   Per pubblicare gli artefatti generati sulle Release di GitHub:
   ```bash
   npm run release
   ```
   Questo comando:
   1. Esegue la build.
   2. Usa `book-release` per trovare gli artefatti definiti nel `package.json`.
   3. Crea una release taggata su GitHub (es. `@books/impero-romano@1.0.0`).

### 📦 Versionamento (Changesets)

Utilizziamo [Changesets](https://github.com/changesets/changesets) per la gestione delle versioni.

1. **Creare un Changeset**:
   Quando apporti modifiche a un libro, esegui:
   ```bash
   npx changeset
   ```
   Seleziona il pacchetto modificato e scrivi un riepilogo.

2. **Versionare i Pacchetti**:
   Per applicare i changeset e aggiornare le versioni:
   ```bash
   npx changeset version
   ```
   Questo aggiorna le versioni in `package.json` e i changelog.

3. **Pubblicare**:
   Fai il commit delle modifiche e dei tag, poi esegui il push. Gli script di release individuali possono quindi essere usati per caricare gli artefatti associati a quei tag.

## 🧩 Aggiungere un Nuovo Libro

Per aggiungere un nuovo libro all'infrastruttura del monorepo:

1. Sposta la cartella del libro in `books/`.
2. Aggiungi un `package.json`:
   ```json
   {
     "name": "@books/tuo-nome-libro",
     "version": "0.1.0",
     "book": {
       "pdf": "OUTPUT.pdf",
       "epub": "OUTPUT.epub"
     },
     "scripts": {
       "build": "python3 scripts/export_book.py",
       "release": "npm run build && book-release"
     },
     "devDependencies": {
       "@books/book-tools": "*"
     }
   }
   ```
3. Esegui `npm install` nella root.
