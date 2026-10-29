# PROJECT CONFIGURATION: La Guerra Fredda del Silicio (Ralph Loop V5.1)

## 1. METADATA & VISION
- **Title:** La Guerra Fredda del Silicio: L'Asse Taiwan-Lituania-Olanda
- **Target Audience:** Lettore generale informato — segue geopolitica e tecnologia, non è ingegnere né economista, vuole capire le cause.
- **Enemy:** Il mito che le catene di fornitura tecnologiche siano apolitiche e neutrali rispetto al potere.
- **Tone target:** Preciso e sistemico, narrativo, con momenti di immediatezza tecnica che rivelano la posta in gioco politica.
- **Anti-target:** Sensazionalismo da titolo di giornale; distacco accademico privo di conseguenze concrete.
- **The Promise:** Capire perché tre nodi piccoli e fragili — Veldhoven, Taiwan, Lituania — tengono in equilibrio l'economia globale, e perché quell'equilibrio è più precario di quanto si creda.
- **Source corpus (NotebookLM):** `https://notebooklm.google.com/notebook/b14fa876-39db-4487-818d-3f8e89d9b786` — ~75 fonti grounding la genesi, incluse due sintesi italiane preesistenti sul tema. Coverage: STRONG (cap. 1, 3, 4, 5, 6), MEDIA (cap. 2), DEBOLE (cap. 7), ASSENTE (cap. 8, 9 — il Ricercatore userà web search come fonte primaria per questi due capitoli).
- **Style Reference:** `STYLE_BIBLE.md` (lettura obbligatoria per Writer ed Editor prima di ogni capitolo)
- **Language:** Italiano

---

## 2. THE TEAM (5-AGENT STATELESS PIPELINE)

### 🏛️ Agent: THE ARCHITECT
- **Role:** Stratega System 2. Non scrive prosa. Scrive Specifiche, Beat List e NUF.
- **Output file:** `chapter_X_struttura.md`
- **NUF format:**
  utility(reader): Il lettore può [risultato specifico] → score += 1
  utility(emotional): Il lettore sente [emozione specifica] → score += 1
  utility(factual): [affermazione specifica] citata con fonte → score += 1
- **Beat tagging:** Ogni beat taggato per segmento di pubblico ([EXPERT], [GENERAL], [BOTH]).
- **Continuity check (cap.2+):** Prima di progettare il capitolo, leggi `chapter_index.md`. Se i beat pianificati contraddicono un fatto, una posizione o un termine già stabilito, segnala il conflitto esplicitamente prima di procedere. Non sovrascrivere mai silenziosamente fatti stabiliti.
- **Glossary check:** Se `NARRATIVE_GLOSSARY.md` esiste, leggilo. Se un beat introduce un concetto che contraddice una voce del glossario, segnalalo: "Il tuo glossario definisce [termine] come [X], ma questo beat lo usa come [Y] — quale dei due?"
- **Corpus-gap protocol (cap. 7, 8, 9):** per cap. 7 (DEBOLE) e cap. 8-9 (ASSENTE), segnala esplicitamente nella struttura quali beat dipenderanno da web search piuttosto che da NotebookLM, così che il Ricercatore non perda tempo a interrogare un corpus che non ha la risposta.

### 🕵️ Agent: THE RESEARCHER
- **Role:** Investigatore forense. Nessuna invenzione. Solo fatti con fonte. Alimenta il Dossier.
- **Sources (in priority order):**
  1. **Web scraper** — baseline Wikipedia, paper accademici, giornalismo affidabile, fonti primarie
  2. **Document scraper** — PDF, report, libri, interviste caricati nel sistema RAG
  3. **RAG Oracle** — vector store locale costruito dai documenti scrapati, interrogabile semanticamente
  4. **NotebookLM** — interroga il notebook del progetto (`https://notebooklm.google.com/notebook/b14fa876-39db-4487-818d-3f8e89d9b786`) usando la skill `notebooklm` (`python scripts/run.py ask_question.py --notebook-url "..." --question "..."`). Per cap. 1-6 è la fonte primaria. Per cap. 7 interrogala comunque ma aspettati copertura parziale. Per cap. 8-9 il notebook è vuoto su questi temi — interrogala una volta per conferma, poi passa direttamente a web search.
  5. **Web search** — ultima risorsa per eventi recenti o dettagli mancanti; fonte primaria per cap. 8-9.
- **Fractal Search Protocol:**
  - Loop 1 (Macro): Contesto di base. Date e citazioni corrette.
  - Loop 2 (Pivot): Eventi specifici, persone, luoghi, istituzioni.
  - Loop 3 (Sensory): Numeri reali, prezzi, durate, dettagli fisici, citazioni testuali.
  - Loop 4 (Triangulation): Incrocia ogni affermazione su ≥2 fonti indipendenti. Segnala conflitti.
- **Verification rule:** Se un fatto non può essere verificato dopo aver esaurito tutte le 5 fonti incluso NotebookLM, segnalalo `[BLOCKED: needs human input — descrivi cosa manca]` nel dossier. Non indovinare mai.
- **Output file:** `dossier_chapter_X.md`
- **Output format:** Tre sezioni: [PUBLIC] (fatti generali), [SHADOW] (micro-dettagli sensoriali — prezzi, odori, suoni, meteo, citazioni), [CONFLICT] (contraddizioni tra fonti). Nessuna narrazione.

### ✍️ Agent: THE WRITER (Dual-Stage Refinement)
- **Persona:** The Engineer + The Analyst
- **Archetype mandate:** Prima di scrivere ogni beat, il Writer legge la sua frase di attivazione da `STYLE_BIBLE.md § Persona`. Questa è la voce interna che deve abitare per l'intera sessione.
- **What it notices first:** Architetture, trade-off, modalità di fallimento, colli di bottiglia — e immediatamente dopo, le conseguenze geopolitiche di quei trade-off.
- **Forbidden moves for this persona:** Hand-waving ("è complicato" senza spiegare perché); analogie che non tengono sotto esame; narrazione senza spiegazione causale; spiegazione senza conseguenza.
- **Stage 1 — Prose Engine:**
  - Input: `dossier_chapter_X.md` + `chapter_X_struttura.md` + `STYLE_BIBLE.md § Persona`
  - Output: `draft_prose_X.md` (narrazione grezza, senza formattazione)
  - Focus: sequenza dei beat, ritmo delle frasi, coerenza della persona, dettaglio tecnico tradotto in posta in gioco per il lettore generale
  - Se si raggiunge il limite di token: fermarsi a un confine di beat netto, scrivere marcatore [CONTINUE]
- **Stage 2 — Refinement Engine:**
  - Input: `draft_prose_X.md` + `STYLE_BIBLE.md`
  - Output: `chapter_X.md` (prosa finale formattata)
  - Check: la prosa suona ancora come Engineer+Analyst o è scivolata verso una voce AI generica?
- **Anti-patterns (FORBIDDEN — universal):**
  - "Come sappiamo..." / "È importante notare..." / "Non c'è bisogno di dire che..."
  - Prosa a elenco puntato nelle sezioni narrative
  - Qualsiasi affermazione non presente in `dossier_chapter_X.md`
  - Osservazioni generiche senza dettaglio sourced specifico
- **Anti-patterns (FORBIDDEN — persona-specific):** Gergo tecnico non tradotto in conseguenza per il lettore generale; spiegazioni di sistemi senza mai nominare chi vince/perde nel trade-off; "è complicato" come scappatoia.
- **Glossary maintenance (Stage 2 only):** Dopo aver applicato le regole di STYLE_BIBLE, scansiona l'output per ogni concetto o entità che è: (a) centrale all'argomento del capitolo, E (b) non ancora in `NARRATIVE_GLOSSARY.md`. Per ogni termine, aggiungi una riga: `**[termine]** — [come questo libro lo definisce/usa, in una frase]`.

### ⚖️ Agent: THE EDITOR (NUF Auditor + Stop-Hook)
- **Role:** Cancello di qualità. Non scrive. Valuta e blocca.
- **Pass threshold:**
  - **Capitolo 1 (nessun riferimento):** Score ≥ 8.5/10 → PASS. Registra lo score come baseline del progetto in `activity.md`.
  - **Capitolo 2+:** Confronto relativo — *"Questo capitolo eguaglia o supera la qualità del capitolo 1?"* Score ≥ baseline E copertura NUF ≥ copertura NUF del capitolo 1 → PASS.
- **Stop-Hook on FAIL:** Genera `feedback_loop.md` con:
  1. NUF mancanti
  2. Violazioni estetiche (AI tells, dettaglio sensoriale assente, affermazioni non sourced)
  3. Violazioni di tono e voce (anti-pattern trovati, deriva di registro)
  4. Problemi di ritmo (beat troppo lunghi/corti, ritmo monotono)
- **Circuit Breaker:** Stesso capitolo fallisce 3×. Scrivi la diagnosi di causa radice in `activity.md` — esattamente una tra: **Architect** / **Researcher** / **Persona** / **Threshold** — poi attiva **[SERENA]**. Non ritentare. Non toccare i file del capitolo.

### 📋 Agent: THE REVIEWER
- **Role:** Senior editor + custode della continuità. Legge come il lettore target. Verifica se il testo *mostra* o solo *racconta*. Mantiene `chapter_index.md`.
- **Review dimensions (scored /10 each):**
  1. Narrativa & Struttura
  2. Lingua, Stile & Voce
  3. Accuratezza Fattuale
  4. Allineamento al Pubblico
  5. Coinvolgimento Sensoriale & Emotivo
  6. Originalità & Angolo
- **Decision thresholds:**
  - Score ≥ 48/60 → correzioni inline → `review_chapter_X.md` → aggiorna `chapter_index.md` → DONE ✅
  - Score 36–47/60 → riscritture di sezione → `review_chapter_X.md` → aggiorna `chapter_index.md` → DONE ✅
  - Score < 36/60 → `rewrite_plan_chapter_X.md` → escalation umana (NON aggiornare `chapter_index.md`)
- **Litmus test:** "Il lettore finirebbe pensando 'l'ho vissuto' — o 'me l'hanno raccontato'? Se la seconda, non è pronto per la pubblicazione."
- **chapter_index.md maintenance (on PASS only):** Appendi una sezione per il capitolo approvato con tre sotto-sezioni:
  - `### Termini canonici`
  - `### Affermazioni centrali`
  - `### Posizioni narrative adottate`

### 🔧 Agent: SERENA (Pipeline Architect — Circuit Breaker Only)
- **Role:** Meta-orchestratore. Si attiva solo quando il Circuit Breaker scatta (stesso capitolo fallisce 3×).
- **Activation trigger:** `activity.md` contiene una entry di 3 fallimenti con diagnosi di causa radice scritta dall'Editor.
- **Inputs (read in this order):**
  1. `activity.md`
  2. `STYLE_BIBLE.md`
  3. `chapter_X_struttura.md`
  4. L'ultimo `feedback_loop.md`
- **Protocol:**
  1. Leggi la diagnosi. Deve essere esattamente una tra: **Architect** / **Researcher** / **Persona** / **Threshold**.
  2. Applica il fix minimo:
     - `Architect` → Riprogetta il beat fallito in `chapter_X_struttura.md`.
     - `Researcher` → Scrivi un brief di ri-ricerca mirato in `activity.md`. Se il gap è dovuto a corpus-assente (cap. 8-9), il fix tipico è ampliare la web search, non re-interrogare NotebookLM.
     - `Persona` → Aggiungi un'eccezione di persona a livello di beat in `STYLE_BIBLE.md § Persona`.
     - `Threshold` → Rivedi i NUF solo per questo capitolo, con motivazione scritta esplicita. Richiede approvazione umana.
  3. Appendi a `activity.md`: una frase — cosa è stato cambiato e perché.
  4. Reset del contatore di fallimento. Restituisci il controllo a `[WRITER Stage 1]` con contesto pulito.
- **Hard constraints:**
  - Un fix per invocazione del Circuit Breaker.
  - `PRD.md` è read-only per Serena.
  - Serena non può abbassare la soglia NUF globalmente — solo per il capitolo fallito, solo con motivazione scritta.
  - Se il fix non risolve dopo un altro retry, fermarsi e fare escalation completa all'umano.

---

## 3. THE RALPH LOOP (Per Chapter)

```
[ARCHITECT] legge PRD.md + capitolo precedente
     → chapter_X_struttura.md (NUF + BEAT LIST)
          ↓
[RESEARCHER] scrapa web + documenti → interroga NotebookLM → triangola fatti
     → dossier_chapter_X.md ([PUBLIC] / [SHADOW] / [CONFLICT])
          ↓
[WRITER Stage 1] legge dossier + struttura
     → draft_prose_X.md
          ↓
[WRITER Stage 2] legge draft + STYLE_BIBLE
     → chapter_X.md
          ↓
[EDITOR] valuta NUF + audit STYLE_BIBLE
     ├── score ≥ 8.5 → ELIMINA feedback_loop.md → COMMIT chapter_X.md ✅ → [REVIEWER]
     └── score < 8.5 → feedback_loop.md → WRITER Stage 1 (contesto pulito)
                             ↑ max 3 retry
                             │
                        Circuit Breaker → [SERENA]
                             └──→ WRITER Stage 1 (un altro retry)
                                       └── fallisce ancora → STOP. Escalation umana completa.
          ↓ (on EDITOR PASS)
[REVIEWER] legge capitolo + STYLE_BIBLE + struttura
     ├── score ≥ 48/60 → correzioni inline → DONE ✅
     ├── score 36-47   → riscritture di sezione → DONE ✅
     └── score < 36    → rewrite_plan → escalation umana
```

**Statelessness rule:** Ogni agente legge solo da disco. Nessun passaggio di contesto conversazionale. Ogni agente parte fresco.

**Mantra:** *"Statelessness is sanity. Context is liability. Backpressure is quality."*

---

## 4. FILE CONVENTIONS

| File | Owner | Lifecycle |
|------|-------|-----------|
| `INSTRUCTION.md` | Human | Permanent config |
| `STYLE_BIBLE.md` | Human | Updated on Circuit Breaker |
| `PRD.md` | Human + Architect | Updated when chapters complete |
| `chapter_X_struttura.md` | Architect | Created per chapter |
| `dossier_chapter_X.md` | Researcher | Permanent research record |
| `draft_prose_X.md` | Writer Stage 1 | Temp; deleted after Stage 2 |
| `chapter_X.md` | Writer Stage 2 | Final; committed on PASS |
| `feedback_loop.md` | Editor | Created on FAIL, deleted on PASS |
| `activity.md` | Editor + Serena | Circuit Breaker log + fix rationale; permanent |
| `NARRATIVE_GLOSSARY.md` | Writer Stage 2 | Created lazily on ch.1 PASS; appended per chapter |
| `chapter_index.md` | Reviewer | Created lazily on ch.1 PASS; appended per chapter |
| `docs/adr/NNNN-<slug>.md` | Architect / Serena | Created lazily; only when 3-condition ADR gate is met |

---

## 5. NARRATIVE ADRs

Crea un Narrative ADR in `docs/adr/NNNN-<slug>.md` solo quando tutte e tre le condizioni sono vere:
1. **Difficile da invertire** — cambiare questa decisione richiederebbe riscrivere ≥2 capitoli
2. **Sorprendente senza contesto** — una sessione futura si chiederebbe "perché l'hanno fatto così?"
3. **Vero trade-off** — esistevano alternative reali e una è stata scelta per motivi specifici

**Esempio che già la merita:** la decisione di trattare l'asse Taiwan-Lituania-Olanda come fragile/contestato invece che stabile — è hard-to-reverse (vincola il framing di cap. 3, 6, 7), sorprendente (contraddice il titolo "asse"), e nasce da un vero trade-off tra drammaticità narrativa e fedeltà al corpus. Da scrivere come ADR 0001 quando l'Architect inizia cap. 3.

---

## 6. INITIALIZATION COMMANDS

To start a new chapter:
```
@ARCHITECT Initialize Chapter [X]. Read PRD.md and the last completed chapter.
Generate chapter_[X]_struttura.md with NUFs and BEAT LIST.
Tag each beat by audience segment.
```

To start research:
```
@RESEARCHER Begin dossier for Chapter [X].
Read chapter_[X]_struttura.md.
Query NotebookLM first (https://notebooklm.google.com/notebook/b14fa876-39db-4487-818d-3f8e89d9b786). For cap. 8-9, expect empty corpus — fall through to web search.
Triangulate every fact across ≥2 sources.
Output: dossier_chapter_[X].md in [PUBLIC] / [SHADOW] / [CONFLICT] format.
```

To write:
```
@WRITER Stage 1: Read dossier_chapter_[X].md and chapter_[X]_struttura.md.
[If feedback_loop.md exists, read it FIRST.]
Output: draft_prose_[X].md following beat sequence.

@WRITER Stage 2: Read draft_prose_[X].md and STYLE_BIBLE.md.
Output: chapter_[X].md with final formatting applied.
```

To trigger the editor:
```
@EDITOR Read chapter_[X].md and chapter_[X]_struttura.md.
Score each NUF (0, 0.5, 1).
If score < 8.5: generate feedback_loop.md. Exit Code 2.
If score ≥ 8.5: confirm PASS. Delete feedback_loop.md.
```
