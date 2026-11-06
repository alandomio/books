# PROJECT CONFIGURATION: CHRONOS — Ai Confini dell'Impero (storia_c2)

> Riscritta da `storia_c/INSTRUCTION.md` per storia_c2 (5 novembre 2026). Le regole del libro stanno in `PRD.md` e `STYLE_BIBLE.md` (decisioni D1-D9); questo file descrive chi fa che cosa nella pipeline `ralph.sh` e quali file produce. Dove questo file e `PRD.md`/`STYLE_BIBLE.md` divergono, valgono questi ultimi. Il campo `Title` qui sotto è letto da `publish.sh` e `generate_cover.sh`, il campo `Version` da `publish.sh`.

## 1. METADATA & VISION
- **Title:** CHRONOS: Ai Confini dell'Impero — Dal Rinascimento alla Belle Époque, tra la Grande Storia e le Terre di Mezzo
- **Version:** 2.0 (storia_c2)
- **Target Audience:** Studenti di seconda media (11-13 anni). Lettrice di prova: la figlia del capitano. Vedi `PRD.md § 2`.
- **Positioning (D1):** lettura integrativa accanto al manuale, non un sostituto. Ogni capitolo dichiara a quale parte del programma si aggancia.
- **Enemy:** L'idea che la storia "vera" sia solo quella dei grandi centri, e che le periferie di confine siano comparse mute.
- **Tone target (D6):** un racconto che aiuta a capire e ad amare la storia: avventuroso, documentaristico, partecipativo. Scene romanzate ammesse entro i due limiti di `STYLE_BIBLE.md § 7`.
- **Source corpus:** i 13 dossier corretti di questa cartella (D2). Il Researcher aggiunge solo le lacune che la struttura del capitolo elenca.
- **Style Reference:** `STYLE_BIBLE.md` (lettura obbligatoria per ogni fase che scrive o valuta).
- **Language (D7):** Italiano prima. Lo sloveno è un adattamento leggero scritto solo dopo che il capitolo italiano è approvato (file `chapter_X_it.approved`). Ogni capitolo produce `chapter_X_it.md` e, dopo l'approvazione, `chapter_X_sl.md`.
- **Capitolo 0:** capitolo di orientamento nel presente, circa 2.000 parole, senza checkpoint; si genera prima del Capitolo 1.

---

## 2. THE TEAM (pipeline stateless, `ralph.sh`)

### 🏛️ THE ARCHITECT (Regista / Mission Control)
- **Role:** progetta il capitolo; non scrive prosa.
- **Input:** `PRD.md`, `STYLE_BIBLE.md`, `dossier_chapter_X.md`, `MYSTERY.md`, `IMAGES.md`, `chapter_index.md` (esiti dei checkpoint, scene per narratore, indizi già piantati); `storia_c/writing_plan.md` solo come riferimento di contenuto.
- **Output:** `chapter_X_struttura.md` con: pagina d'apertura (mappa, linea del tempo, domanda guida, aggancio al manuale, ipotesi con la crepa), tre scene da 600-700 parole (una di Maja su un fatto europeo, una condivisa Alex+Maja sullo stesso evento), "Cosa devi ricordare", documento vero con domanda, checkpoint con esito pianificato (A / B / nessuna / domanda aperta, variato), debriefing breve, filo del mistero di 150-250 parole, al massimo 5 termini di glossario, lacune per il Researcher, budget di 2.800-3.300 parole.

### 🔍 THE RESEARCHER (Archivista)
- **Role:** nessuna invenzione, solo fatti con fonte.
- **Input:** la sezione RESEARCHER GAPS della struttura. Se dice "NONE", la fase non gira.
- **Output:** una sezione `## [AGGIUNTE storia_c2 — capitolo X]` in fondo a `dossier_chapter_X.md`. Mai modificare o cancellare voci, fonti o marcatori esistenti.
- **Regole:** triangolazione su almeno 2 fonti (almeno una slovena per i temi sloveni); `[ESTIMATE]`, `[RECONSTRUCTED]`, `[NO SOURCE: ... Usare: "..."]`, `[UNVERIFIED]` come nel resto del dossier; una cifra precisa solo con una fonte che può contenerla.

### 🖼️ THE PHOTO RESEARCHER (D5)
- **Role:** trova solo immagini; non scrive prosa.
- **Input:** `IMAGES.md`, le sezioni DOCUMENT e OPENING PAGE della struttura.
- **Output:** `images_chapter_X.md` con documento verificato (titolo, data, autore, istituzione, segnatura, URL stabile, base del pubblico dominio), punti della mappa, date della linea del tempo, righe di credito.
- **Regole:** solo documenti veri; niente download, niente URL indovinati; AI solo su una foto vera e senza aggiungere nulla (si registra soltanto quale immagine e quale trattamento).

### ✍️ THE WRITER (Alex e Maja, italiano)
- **Stage 1:** `draft_prose_X_it.md` dalla struttura e dal dossier, nella forma di `STYLE_BIBLE.md § 1`, frasi brevi, firme di scena.
- **Stage 2:** `chapter_X_it.md` (forma finale, 2.800-3.300 parole) e `appendice_chapter_X.md` (appendice per l'insegnante: fonti del dossier usate e crediti delle immagini). Niente note a piè di pagina nel capitolo.
- **Anti-patterns:** vedi `STYLE_BIBLE.md § 12`; nessuna cifra senza fonte; nessuna scena smentita dal testo stesso.

### ⚖️ THE EDITOR (cancello di qualità)
- **Hard gate automatico:** `ralph.sh` esegue `checks.sh chapter_X_it.md` (parole, Gulpease ≥ 65, frase media < 14, glossario ≤ 5, tre scene con almeno una di Maja, "Cosa devi ricordare"). Se fallisce, il capitolo non passa, qualunque cosa dica il modello.
- **Gate del modello:** nessuna cifra senza fonte; nessuna scena smentita; forma del capitolo completa; esito del checkpoint variato; filo del mistero entro le regole; anacronismi (`[ANACHRONISM-WATCH]`, compito che in storia_c era dello "Storico"); niente parole di produzione; appendice presente.
- **On FAIL:** `feedback_loop_X.md`; REPAIR_MODE TARGETED → agente di riparazione mirata; STRUCTURAL → riscrittura Writer 1+2. Massimo 3 giri, poi Circuit Breaker in `activity.md` con diagnosi (Architect / Researcher / Writer / Threshold) e intervento umano.

### 🔧 THE REPAIR AGENT
- Corregge con modifiche puntuali solo i passi segnalati; se serve un fatto nuovo o il problema è diffuso, rinuncia ("ESCALATE") e la pipeline passa alla riscrittura.

### 📋 THE REVIEWER
- Legge come la lettrice di prova; sei dimensioni /10 (racconto e struttura, leggibilità, accuratezza, Alex e Maja, documento e checkpoint, voglia di continuare).
- ≥ 48/60 correzioni puntuali; 36-47 riscritture di paragrafi; < 36 `rewrite_plan_chapter_X.md`. Ogni correzione deve continuare a passare `checks.sh`.
- Mantiene `chapter_index.md`: esito del checkpoint, scene per narratore, indizio del mistero, termini di glossario, fatti canonici.

### ✅ APPROVAZIONE (umana)
- La lettrice di prova legge il capitolo italiano (che cosa è successo? perché? vuoi leggere il seguito?). Il capitano, se approva, crea `chapter_X_it.approved`. Le regole si correggono sul suo riscontro prima del capitolo successivo.

### 🇸🇮 THE LINGUISTA (adattamento sloveno leggero)
- Parte solo se esiste `chapter_X_it.approved`.
- Scrive `chapter_X_sl.md`: stessa struttura, scene, documenti e fatti; frasi slovene naturali, non calcate; firme `Poroča Alex` / `Poroča Maja`; glossario `MEMO SLOVAR`.
- Vocabolario: *Naloga*/*Odprava* (non *Misija*), *Cesarstvo* (non *Imperij* generico), toponimi storici sloveni verificati; aggiorna `NARRATIVE_GLOSSARY.md`; `linguista_note_X.md` solo per scelte non ovvie.

---

## 3. THE RALPH LOOP (per capitolo)

```
[ARCHITECT] → chapter_X_struttura.md
     ↓
[RESEARCHER] solo lacune → dossier_chapter_X.md (sezione AGGIUNTE, append-only)
     ↓
[PHOTO RESEARCHER] → images_chapter_X.md (solo documenti veri)
     ↓
[WRITER 1] → draft_prose_X_it.md
     ↓
[WRITER 2] → chapter_X_it.md + appendice_chapter_X.md
     ↓
[EDITOR] checks.sh (hard gate) + gate del modello
     ├── PASS → elimina feedback_loop_X.md → [REVIEWER]
     └── FAIL → feedback_loop_X.md → REPAIR (mirato) o WRITER 1+2   (max 3 giri → Circuit Breaker)
     ↓
[REVIEWER] → review_chapter_X.md + chapter_index.md
     ↓
[APPROVAZIONE UMANA] lettrice di prova + capitano → chapter_X_it.approved
     ↓
[LINGUISTA] → chapter_X_sl.md
```

**Statelessness rule:** ogni fase legge solo da disco, nessun contesto di conversazione.
**Costo:** ogni fase chiama un modello vero e consuma token. Per controllare lo script si usano `bash -n`, `shellcheck` e `./ralph.sh X plan` o `--dry-run`, che non chiamano alcun modello; una corsa vera si fa una volta, sul capitolo da scrivere.

---

## 4. FILE CONVENTIONS

| File | Owner | Lifecycle |
|------|-------|-----------|
| `PRD.md`, `STYLE_BIBLE.md`, `INSTRUCTION.md` | Human | Configurazione; si correggono dopo la lettura di prova |
| `MYSTERY.md`, `IMAGES.md` | Human | Proposta del mistero e ricerca immagini della fase 1 |
| `dossier_chapter_X.md` | Researcher | Ricerca corretta; solo aggiunte in coda |
| `chapter_X_struttura.md` | Architect | Uno per capitolo |
| `images_chapter_X.md` | Photo Researcher | Uno per capitolo |
| `draft_prose_X_it.md` | Writer 1 | Bozza |
| `chapter_X_it.md`, `appendice_chapter_X.md` | Writer 2 (+ Repair, Reviewer) | Finali |
| `feedback_loop_X.md` | Editor | Creato on FAIL, eliminato on PASS |
| `review_chapter_X.md`, `chapter_index.md` | Reviewer | Permanenti |
| `chapter_X_it.approved` | Human | Sblocca lo sloveno |
| `chapter_X_sl.md`, `linguista_note_X.md` | Linguista | Finali |
| `NARRATIVE_GLOSSARY.md` | Linguista | Base da storia_c, da sfoltire (vedi `README.md`) |
| `activity.md` | ralph.sh | Log del Circuit Breaker |
| `checks.sh`, `ralph.sh`, `publish.sh`, `generate_cover.sh` | Human | Script |

---

## 5. NARRATIVE ADRs (in vigore per storia_c2)

- **Tre tracce, due voci:** Europa e mondo, Alto Adriatico (Alex), terre slovene (Maja); il libro non è centrato su Trieste. Invariato da storia_c.
- **Italiano prima, sloveno come adattamento leggero (sostituisce l'"adattamento parallelo" di storia_c):** il capitano ha scelto di partire dall'italiano e di adattare lo sloveno solo dopo l'approvazione del capitolo italiano, senza traduzione letterale.
- **Lettura accanto al manuale (D1):** capitoli di circa 3.000 parole con forma fissa, invece dei capitoli da 5.000-8.800 parole di storia_c.

---

## 6. COMANDI

```
./ralph.sh 1 plan        # le fasi del capitolo 1, senza chiamare modelli
./ralph.sh 1             # parte italiana: architect → reviewer, poi si ferma all'approvazione
./ralph.sh 1 status      # a che punto è il capitolo
./ralph.sh 1 linguista   # sloveno, solo dopo chapter_1_it.approved
./publish.sh --it-only   # ePub/PDF dell'edizione italiana (quando ci sono capitoli)
```
