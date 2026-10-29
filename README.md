# Monorepo Libri

Questo repository è un **monorepo** progettato per gestire la scrittura, la generazione e la pubblicazione di più libri utilizzando agenti AI e script automatizzati.

## 📂 Struttura

```
books/<libro>/        un libro per cartella
  PRD.md              visione e struttura del libro        (libri vecchi: PLAN.md)
  INSTRUCTION.md      regole per gli agenti                (libri vecchi: INSTRUCTIONS.md)
  STYLE_BIBLE.md      voce e stile (opzionale)
  chapter_N_struttura.md   Architect: struttura e beat del capitolo
  dossier_chapter_N.md     Researcher: dossier di ricerca
  chapter_N.md             Writer/Editor: testo finale     (libri vecchi: capitolo_N.md)
  scripts/export_book.py   build PDF/EPUB (i PDF/EPUB sono ignorati da git)
packages/book-tools/  utility condivise (release su GitHub)
scripts/ralph.sh      runner canonico della pipeline Ralph
ralph/prompts/        prompt dei ruoli
.claude/skills/       skill (new-book crea un libro nuovo con la pipeline Ralph)
```

I libri più recenti (`la-geometria-del-pensiero`, `storia_c`) usano i nomi in inglese; i libri più vecchi
(`brexit`, `trump`, `musk`, ...) usano `PLAN.md`/`INSTRUCTIONS.md`/`capitolo_N.md` e non sono lanciabili con il runner senza rinominare i file.

I workspace NPM sono `books/*` e `packages/*`. `make list` elenca i libri, `make build BOOK=<libro>` li compila.
Esempi di libri con pacchetto: `@books/impero-romano`, `@books/tritacarne`.

## 🔁 Flusso Ralph

Ogni capitolo passa da cinque agenti senza stato: **Architect → Researcher → Writer → Editor → Reviewer**.
Ogni agente legge e scrive solo file nella cartella del libro (nomi sopra); se l'Editor boccia il capitolo
tre volte di fila scatta il circuit breaker e serve un intervento umano.

```bash
make ralph BOOK=la-geometria-del-pensiero CH=3                 # pipeline completa, capitolo 3
make ralph BOOK=la-geometria-del-pensiero CH=3 PHASE=status    # cosa è già fatto
BOOK_DIR=books/la-geometria-del-pensiero scripts/ralph.sh 3 editor --dry-run
```

Per iniziare un libro nuovo usa la skill `new-book` (`.claude/skills/new-book/SKILL.md`), che genera
`PRD.md`, `INSTRUCTION.md` e `STYLE_BIBLE.md` e usa lo stesso `scripts/ralph.sh`.
Metodo e ruoli in dettaglio: [AI Writing Guru Guide](./ai_writing_guru_guide.md), [Ralph Wiggum methodology](./ralph-wiggum-methodology-complete-guide.md)
e la wiki del repository su GitHub.

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
