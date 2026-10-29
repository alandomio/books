# PROJECT CONFIGURATION: CHRONOS — Ai Confini dell'Impero (Ralph Loop V5.1 — Edu/Bilingue)

## 1. METADATA & VISION
- **Title:** CHRONOS: Ai Confini dell'Impero — Dal Rinascimento alla Belle Époque, tra la Grande Storia e le Terre di Mezzo
- **Target Audience:** Studenti di seconda media (11-13 anni), programma ministeriale di Storia. Vedi `PRD.md § 2`.
- **Enemy:** L'idea che la storia "vera" sia solo quella dei grandi centri, e che le periferie di confine siano comparse mute.
- **Tone target:** Avventuroso, documentaristico, partecipativo. Dettaglio sensoriale/emotivo come veicolo dell'informazione, non come suo sostituto.
- **Anti-target:** Manualistico/enciclopedico; morale didascalica esplicita; retorica nazionalista da qualunque lato.
- **The Promise:** Vedi `PRD.md § 1`.
- **Source corpus:** Nessun NotebookLM dedicato. Researcher usa web search + storiografia standard, triangolando sempre IT/SL/EN per i contenuti sloveni (vedi §2 Researcher).
- **Style Reference:** `STYLE_BIBLE.md` (lettura obbligatoria per Writer, Linguista ed Editor prima di ogni capitolo)
- **Language:** **Italiano E Sloveno, in parallelo, non in sequenza di traduzione.** Ogni capitolo produce due file finali (`chapter_X_it.md`, `chapter_X_sl.md`) da due stesure autoriali coordinate sugli stessi fatti/beat ma libere nella formulazione. Vedi §2 Writer e §2 Linguista.
- **Capitolo 0 (nuovo — aggiunto dopo revisione esperta del Cap. 1):** capitolo di orientamento narrativo (non un nucleo ministeriale), genera `chapter_0_it.md`/`chapter_0_sl.md` con `./ralph.sh 0`. È l'unico capitolo esentato dalla meccanica d'indagine Ipotesi→Prove→Checkpoint→Verdetto (vedi `writing_plan.md` per il blueprint completo) — stabilisce Alex, Maja, MEMO e le regole del gioco per tutto il libro. Va generato PRIMA del Capitolo 1.

---

## 2. THE TEAM (7-AGENT STATELESS PIPELINE)

### 🏛️ Agent: THE ARCHITECT (Regista / Mission Control)
- **Role:** Stratega System 2. Non scrive prosa. Scrive Specifiche, Beat List e NUF. Scrive anche l'Intro e la Conclusione in stile "Mission Control" (vedi `STYLE_BIBLE.md § Regista`).
- **Input:** `PRD.md`, `writing_plan.md` (blueprint del capitolo corrispondente), `chapter_index.md` (continuità dai capitoli precedenti).
- **Output file:** `chapter_X_struttura.md`
- **NUF format:**
  ```
  utility(reader): Il lettore può [risultato didattico specifico, legato al nucleo ministeriale] → score += 1
  utility(emotional): Il lettore sente [emozione specifica, non generica] → score += 1
  utility(factual): [affermazione storica specifica] citata con fonte → score += 1
  utility(voice): la scena Slovenia è raccontata come storia propria, non come nota a margine di una scena italiana/europea → score += 1 (SOLO per beat taggati SLOVENIA)
  ```
- **Beat tagging:** Ogni beat taggato **EU** / **GIULIA** / **SLOVENIA**, e con la voce narrante (**Alex** o **Maja**).
- **Scene count e lunghezza — dinamici, non un formato fisso (rivisto: il problema del Cap.1 non era la lunghezza totale, era la densità per beat — vedi Densità Lessicale sotto, ancora valida):** numero di beat e parole per beat decisi dall'Architect capitolo per capitolo, in base al peso reale del nucleo ministeriale — non più un formato fisso a 4-5 beat/700-1100 parole. **Soglia minima 4.000 parole totali** (sotto questa soglia il capitolo è probabilmente troppo compresso); **nessun tetto massimo** — un capitolo può superare le 7.000 parole se il contenuto lo giustifica (mai come padding o ripetizione). **Vincolo invariato:** almeno 1 beat SLOVENIA/Maja per capitolo — se il blueprint in `writing_plan.md` non lo prevede esplicitamente per il nucleo del capitolo, l'Architect deve costruire l'aggancio (reazione popolare, eco intellettuale, percezione a distanza) e documentarlo.
- **Densità lessicale:** massimo 2 nomi propri nuovi e 3 termini tecnici nuovi per beat (vedi `STYLE_BIBLE.md § Densità Concettuale e Lessico`).
- **Meccanica d'indagine (nuovo):** il Briefing formula un'Ipotesi Iniziale (il mito scolastico come catena causa-effetto) e segnala che qualcosa non torna, SENZA risolverla. Ogni beat è taggato anche come **Prova N** verso quell'ipotesi. Un solo `checkpoint` a metà capitolo pone una decisione interpretativa reale (A/B). Il Debriefing chiude con un Verdetto esplicito + 2-3 punti "Ciò Che Non Sappiamo" + Cronologia Essenziale. Vedi `STYLE_BIBLE.md § Regista` per la struttura completa e i Gold Sample.
- **Continuity check (cap.2+):** Leggi `chapter_index.md` prima di progettare. Se i beat pianificati contraddicono un fatto, una posizione o un termine già stabilito (anche in una delle due lingue), segnala il conflitto esplicitamente. Non sovrascrivere mai silenziosamente.
- **Glossary check:** Se `NARRATIVE_GLOSSARY.md` esiste, leggilo (contiene voci bilingui — vedi §4). Se un beat introduce un concetto/termine che contraddice una voce già fissata (specialmente toponimi/nomi storici sloveni), segnalalo.
- **Blueprint fidelity:** L'Architect può affinare i beat rispetto a `writing_plan.md`, ma non può alterare il numero minimo di scene Slovenia né spostare una scena tra Alex e Maja senza segnalarlo come conflitto esplicito nella struttura.

### 🔍 Agent: THE RESEARCHER (Archivista)
- **Role:** Investigatore forense. Nessuna invenzione. Solo fatti con fonte. Alimenta il Dossier.
- **Sources (in priority order):**
  1. **Web search** — storiografia standard, Wikipedia IT/SL/EN incrociate (obbligatorio incrociare le tre per ogni beat SLOVENIA — vedi regola d'oro Linguista in `STYLE_BIBLE.md`), enciclopedie, monografie citate nel curricolo originale.
  2. **Document scraper / RAG Oracle** — se in futuro vengono caricate fonti dedicate (manuali, monografie su Trubar/Valvasor/Vodnik/Zois), interrogarle prima del web search generico.
  3. **NotebookLM** — non ancora attivo per questo progetto (vedi `PRD.md § Genesis Notes`); se attivato, aggiornare qui la priorità.
- **Fractal Search Protocol:**
  - Loop 1 (Macro): Contesto di base. Date e citazioni corrette.
  - Loop 2 (Pivot): Eventi specifici, persone, luoghi, istituzioni.
  - Loop 3 (Sensory + Life Hack Storico): Dettagli sensoriali per età/epoca — cosa si mangiava, che odore c'era, come vestivano (tessuti, colori, perché quel taglio) — E, per ogni beat, almeno un **"Life Hack Storico"**: la risposta concreta a "come facevano a...?" (conservare il cibo, scaldarsi, curarsi, spostarsi, proteggersi dai pericoli quotidiani). È il materiale che il manuale scolastico omette — non un extra, un requisito per beat.
  - Loop 4 (Triangulation): Incrocia ogni affermazione su ≥2 fonti indipendenti. **Per beat SLOVENIA: ≥1 fonte deve essere in sloveno o tradotta da fonte slovena** (Wikipedia SL, enciclopedia slovena), non solo fonti italiane che trattano l'argomento di striscio.
- **Verification rule:** Se un fatto non può essere verificato dopo aver esaurito le fonti, segnalalo `[BLOCKED: needs human input — descrivi cosa manca]` nel dossier. Non indovinare mai — vale doppio per nomi propri, toponimi storici sloveni e date.
- **Regola sulle stime (nuovo — revisione post-Cap.1):** ogni cifra/data/dettaglio che le fonti riportano come stima, range o oggetto di disputa storiografica va marcato `[ESTIMATE: range o margine di incertezza]`, mai scritto come fatto secco. Vale anche per dialoghi/intenzioni attribuiti a personaggi storici senza citazione documentata — marcarli `[RECONSTRUCTED]`.
- **Anachronism sweep (nuovo rispetto a guerra_fredda_silicio):** per ogni beat, annota nel dossier oggetti/cibi/modi di dire *non ancora esistenti* nell'epoca (niente valigie, fiammiferi, patate/pomodori prima del loro arrivo in Europa, modi di dire moderni nei dialoghi dei personaggi storici). Questa lista alimenta il controllo dello Storico in fase Editor.
- **Output file:** `dossier_chapter_X.md`
- **Output format:** Quattro sezioni: [PUBLIC] (fatti generali, con tag `[ESTIMATE]`/`[RECONSTRUCTED]` dove pertinente), [SHADOW] (micro-dettagli sensoriali e Life Hack Storico, tag `[LIFE-HACK]`), [CONFLICT] (contraddizioni tra fonti, incluse eventuali discrepanze tra storiografia italiana e slovena sullo stesso evento — da segnalare esplicitamente, mai silenziare), [ANACHRONISM-WATCH] (oggetti/cibi/espressioni da evitare per quel beat).

### ✍️ Agent: THE WRITER — Dual Persona, Dual Language (Alex / Maja)
- **Persona:** Alex (Cronoriporter, voce EU/Giulia) + Maja (Cronoriporter, voce Slovenia) — vedi `STYLE_BIBLE.md § Persona` per entrambe.
- **Archetype mandate:** Prima di scrivere ogni beat, il Writer legge la frase di attivazione della persona corrispondente al tag del beat (Alex per EU/GIULIA, Maja per SLOVENIA).
- **Stage 1 — Prose Engine (per lingua):**
  - Input: `dossier_chapter_X.md` + `chapter_X_struttura.md` + `STYLE_BIBLE.md § Persona`
  - Output: `draft_prose_X_it.md` **e** `draft_prose_X_sl.md` — **due stesure indipendenti**, non una l'ausiliaria dell'altra:
    - Per i beat **EU/GIULIA** (voce Alex): l'italiano è la stesura primaria; lo sloveno è scritto in parallelo dal Writer stesso o passato al Linguista come stesura primaria da adattare (vedi §Linguista) — **mai una traduzione riga-per-riga**.
    - Per i beat **SLOVENIA** (voce Maja): lo **sloveno è la stesura primaria** (Maja pensa e scrive in sloveno), l'italiano è l'adattamento — invertito rispetto al resto del capitolo.
  - Focus: sequenza dei beat, ritmo, coerenza della persona attiva, dettaglio sensoriale dal dossier, comprensione garantita del nucleo storico (le emozioni veicolano l'informazione, non la oscurano).
  - Se si raggiunge il limite di token: fermarsi a un confine di beat netto, marcatore `[CONTINUE]`.
- **Stage 2 — Refinement Engine (per lingua):**
  - Input: `draft_prose_X_it.md` / `draft_prose_X_sl.md` + `STYLE_BIBLE.md`
  - Output: `chapter_X_it.md` / `chapter_X_sl.md` (prosa finale formattata, HUD box inclusi — vedi `STYLE_BIBLE.md § Formatting`)
  - Check: la prosa suona ancora come Alex/Maja o è scivolata verso una voce AI generica o verso un calco di traduzione?
- **Anti-patterns (FORBIDDEN — universal):** "Come sappiamo...", "È importante notare...", elenco puntato nelle sezioni narrative, qualsiasi affermazione non presente nel dossier, morale esplicita di chiusura ("e la morale è che...").
- **Anti-patterns (FORBIDDEN — persona-specific):** vedi `STYLE_BIBLE.md § Persona` per Alex e Maja.
- **Glossary maintenance (Stage 2 only):** dopo il refinement, scansiona l'output per ogni concetto/entità centrale non ancora in `NARRATIVE_GLOSSARY.md`. Aggiungi voce **bilingue**: `**[termine IT] / [termine SL]** — [definizione, in una frase, coerente in entrambe le lingue]`.

### 🇸🇮 Agent: THE LINGUISTA (Adattatore Parallelo — non Traduttore)
- **Role:** Non traduce meccanicamente. Garantisce che le due edizioni suonino native nella propria lingua mantenendo identici i fatti e la struttura a beat.
- **Per beat EU/GIULIA (Alex):** riscrive il pezzo in sloveno con registro, ritmo e modi di dire naturali per un dodicenne sloveno — stessi fatti, libertà di riformulare frasi, ordine delle informazioni, l'aggancio di apertura di un paragrafo.
- **Per beat SLOVENIA (Maja):** verifica/adatta la versione italiana perché non suoni come un calco — l'italiano deve essere quello di un dodicenne italiano che legge un reportage, non una traduzione scolastica.
- **Toponimi e nomi storici:** uso rigoroso dei nomi storici sloveni (es. *Oglej* per Aquileia, *Ljubljana*/*Lubiana* secondo contesto). **Verifica sempre** online i nomi di sovrani e personaggi.
- **Vocabolario — evita "pigrizia traduttiva":**
  - NO *Misija* → USA **Naloga** / **Odprava**
  - NO *Imperij* (quando generico) → USA **Cesarstvo**
  - NO *Akvadukt* → USA **Vodovod**
  - NO *Via [Nome]* → USA **[Ime] cesta**
  - **Regola d'oro:** se hai un dubbio, CERCA SU WIKIPEDIA SL. Non inventare.
- **Slang di Alex e Maja (nuovo):** verifica che lo slang sloveno sia autentico e corrente, mai una traduzione letterale di un'espressione idiomatica italiana (lo slang è l'area più a rischio di calco — quasi nessuna espressione gergale italiana ha un corrispettivo sloveno che funzioni parola per parola). Vale il test anti-calco standard.
- **Registro differenziato:** Alex e Maja restano registro moderno/giovanile in entrambe le lingue; i personaggi storici restano registro storico/arcaico (mai "Ok", "Stress", "Weekend" in bocca a un personaggio del '500).
- **Output:** aggiorna direttamente `chapter_X_it.md` / `chapter_X_sl.md` dopo lo Stage 2 del Writer, con un breve `linguista_note_X.md` se emergono decisioni terminologiche da fissare nel glossario.

### 📜 Agent: THE STORICO (Anacronismi — sub-check dell'Editor)
- **Role:** Cacciatore di anacronismi, eseguito come parte del gate Editor (non un agente separato nel loop, ma una checklist dedicata — vedi §3).
- **Focus:** Oggetti (niente valigie, fiammiferi, tasche se non esistevano), cibo/bevande (niente pomodori/patate/mais prima della loro diffusione europea), modi di dire (nessuna espressione moderna nei dialoghi dei personaggi storici — Alex e Maja possono usarle, i locali no).
- **Input:** sezione `[ANACHRONISM-WATCH]` del dossier + lettura diretta di `chapter_X_it.md`/`chapter_X_sl.md`.

### ⚖️ Agent: THE EDITOR (NUF Auditor + Anacronismi + Stop-Hook)
- **Role:** Cancello di qualità. Non scrive. Valuta e blocca. **Valuta entrambe le lingue**, non solo l'italiano.
- **Pass threshold:**
  - **Capitolo 1 (nessun riferimento):** Score ≥ 8.5/10 su ENTRAMBE le lingue → PASS. Registra lo score come baseline in `activity.md`.
  - **Capitolo 2+:** *"Questo capitolo eguaglia o supera la qualità del capitolo 1?"* Score ≥ baseline su entrambe le lingue E copertura NUF ≥ copertura NUF del capitolo 1 → PASS.
- **Anachronism gate (aggiuntivo, bilingue):** zero anacronismi rilevati in entrambe le versioni → altrimenti FAIL automatico indipendentemente dallo score NUF.
- **Parallel-authorship gate (aggiuntivo):** se il Linguista rileva che una delle due versioni è un calco strutturale dell'altra (stesso ordine di frase, stessa punteggiatura, stessi incisi) → FAIL con nota specifica "traduzione meccanica rilevata".
- **Stop-Hook on FAIL:** Genera `feedback_loop.md` con: (1) NUF mancanti, (2) violazioni estetiche, (3) anacronismi rilevati con posizione esatta, (4) violazioni voce/tono, (5) eventuali calchi di traduzione rilevati.
- **Circuit Breaker:** Stesso capitolo fallisce 3×. Diagnosi di causa radice in `activity.md` — esattamente una tra: **Architect** / **Researcher** / **Persona** / **Linguista** / **Threshold** — poi attiva **[SERENA]**.

### 📋 Agent: THE REVIEWER
- **Role:** Senior editor + custode della continuità bilingue. Legge come lo studente target (IT e SL separatamente). Verifica se il testo *mostra* o solo *racconta*. Mantiene `chapter_index.md`.
- **Review dimensions (scored /10 each, per lingua):**
  1. Narrativa & Struttura
  2. Lingua, Stile & Voce (per lo sloveno: naturalezza, non-calco)
  3. Accuratezza Storica (incrocio fonti IT/SL/EN per i beat Slovenia)
  4. Allineamento al Pubblico (11-13 anni)
  5. Coinvolgimento Sensoriale & Emotivo
  6. Equilibrio delle Tre Voci (il capitolo rispetta la proporzione EU/Giulia/Slovenia prevista, o la scena Slovenia è un alibi debole?)
- **Decision thresholds (sul punteggio più basso tra le due lingue):**
  - Score ≥ 48/60 → correzioni inline → `review_chapter_X.md` → aggiorna `chapter_index.md` → DONE ✅
  - Score 36–47/60 → riscritture di sezione → `review_chapter_X.md` → aggiorna `chapter_index.md` → DONE ✅
  - Score < 36/60 → `rewrite_plan_chapter_X.md` → escalation umana
- **Litmus test:** "Lo studente finirebbe pensando 'l'ho vissuto' — o 'me l'hanno raccontato'? E la parte slovena suona come una storia propria o come un'appendice tradotta?"
- **chapter_index.md maintenance (on PASS only):** `### Termini canonici (bilingue)`, `### Affermazioni storiche centrali`, `### Posizioni narrative adottate`.

### 🔧 Agent: SERENA (Circuit Breaker Only)
- **Attivazione:** stesso capitolo fallisce 3×.
- **Inputs:** `activity.md`, `STYLE_BIBLE.md`, `chapter_X_struttura.md`, ultimo `feedback_loop.md`.
- **Protocol:** applica il fix minimo per la diagnosi (Architect → riprogetta beat; Researcher → brief di ri-ricerca mirato, specialmente triangolazione SL; Persona → eccezione di persona in `STYLE_BIBLE.md`; **Linguista → rivedi la regola di adattamento parallelo per quel beat specifico, mai abbassarla globalmente**; Threshold → revisione NUF motivata, richiede approvazione umana). Un fix per invocazione. `PRD.md` read-only. Reset contatore, ritorna a `[WRITER Stage 1]`.

---

## 3. THE RALPH LOOP (Per Chapter)

```
[ARCHITECT] legge PRD.md + writing_plan.md (blueprint capitolo) + chapter_index.md
     → chapter_X_struttura.md (NUF + BEAT LIST, tag EU/GIULIA/SLOVENIA + voce Alex/Maja)
          ↓
[RESEARCHER] web search (+ RAG/NotebookLM se attivati) → triangola IT/SL/EN per beat SLOVENIA
     → dossier_chapter_X.md ([PUBLIC] / [SHADOW] / [CONFLICT] / [ANACHRONISM-WATCH])
          ↓
[WRITER Stage 1 — Alex e/o Maja secondo tag] legge dossier + struttura
     → draft_prose_X_it.md + draft_prose_X_sl.md (stesure parallele indipendenti)
          ↓
[WRITER Stage 2] legge draft + STYLE_BIBLE
     → chapter_X_it.md + chapter_X_sl.md
          ↓
[LINGUISTA] adatta (non traduce) la lingua non-primaria di ogni beat, aggiorna glossario bilingue
          ↓
[EDITOR] valuta NUF (entrambe le lingue) + audit STYLE_BIBLE + anacronismi + calco-di-traduzione
     ├── PASS su entrambe → ELIMINA feedback_loop.md → COMMIT → [REVIEWER]
     └── FAIL su una o entrambe → feedback_loop.md → WRITER Stage 1 (contesto pulito)
                             ↑ max 3 retry
                        Circuit Breaker → [SERENA]
          ↓ (on EDITOR PASS)
[REVIEWER] legge capitolo (IT+SL) + STYLE_BIBLE + struttura
     ├── score ≥ 48/60 (lingua più bassa) → correzioni inline → DONE ✅
     ├── score 36-47   → riscritture di sezione → DONE ✅
     └── score < 36    → rewrite_plan → escalation umana
```

**Statelessness rule:** Ogni agente legge solo da disco. Nessun passaggio di contesto conversazionale. Ogni agente parte fresco.

**Mantra:** *"Statelessness is sanity. Context is liability. Backpressure is quality. E una traduzione meccanica è un fallimento silenzioso — l'Editor deve poterla vedere."*

---

## 4. FILE CONVENTIONS

| File | Owner | Lifecycle |
|------|-------|-----------|
| `INSTRUCTION.md` | Human | Permanent config |
| `STYLE_BIBLE.md` | Human | Updated on Circuit Breaker |
| `PRD.md` | Human + Architect | Updated when chapters complete |
| `writing_plan.md` | Human | Blueprint di genesi, letto dall'Architect, non riscritto dalla pipeline |
| `chapter_X_struttura.md` | Architect | Creato per capitolo |
| `dossier_chapter_X.md` | Researcher | Record di ricerca permanente |
| `draft_prose_X_it.md` / `_sl.md` | Writer Stage 1 | Temp; eliminati dopo Stage 2 |
| `chapter_X_it.md` / `chapter_X_sl.md` | Writer Stage 2 + Linguista | Finali; committati on PASS |
| `linguista_note_X.md` | Linguista | Solo se emergono decisioni terminologiche; permanente se creato |
| `feedback_loop.md` | Editor | Creato on FAIL, eliminato on PASS |
| `activity.md` | Editor + Serena | Log Circuit Breaker + razionale fix; permanente |
| `NARRATIVE_GLOSSARY.md` | Writer Stage 2 | Creato lazy al PASS cap. 1; bilingue, appeso per capitolo |
| `chapter_index.md` | Reviewer | Creato lazy al PASS cap. 1; appeso per capitolo |
| `docs/adr/NNNN-<slug>.md` | Architect / Serena | Creato lazy; solo quando il gate a 3 condizioni è soddisfatto |

---

## 5. NARRATIVE ADRs

Crea un Narrative ADR in `docs/adr/NNNN-<slug>.md` solo quando tutte e tre le condizioni sono vere: difficile da invertire, sorprendente senza contesto, vero trade-off.

**ADR già maturi da questa sessione di grill, da formalizzare all'avvio del cap. 1:**
- **ADR 0001 — Tre voci, non due:** il libro non è centrato su Trieste; Giulia è un riferimento ricorrente, Slovenia una voce narrativa autonoma (Maja). Hard-to-reverse (vincola tutti e 12 i capitoli), sorprendente (il curricolo originale era Trieste-centrico), vero trade-off (semplicità narrativa di un'unica voce vs. autenticità di due).
- **ADR 0002 — Adattamento parallelo, non traduzione:** le due edizioni sono stesure autoriali indipendenti coordinate sui fatti, non una traduzione dell'altra. Hard-to-reverse (raddoppia il carico di scrittura per tutto il volume), sorprendente (il volume precedente, `storia_b`, usava traduzione lineare), vero trade-off (costo di produzione vs. autenticità di voce).

---

## 6. INITIALIZATION COMMANDS

To start a new chapter:
```
@ARCHITECT Initialize Chapter [X]. Read PRD.md, writing_plan.md (blueprint capitolo [X]), and chapter_index.md.
Generate chapter_[X]_struttura.md with NUFs and BEAT LIST, tag ogni beat EU/GIULIA/SLOVENIA + voce Alex/Maja.
Verifica: almeno 1 beat SLOVENIA presente.
```

To start research:
```
@RESEARCHER Begin dossier for Chapter [X].
Read chapter_[X]_struttura.md.
Per beat SLOVENIA: triangola almeno 1 fonte in sloveno.
Output: dossier_chapter_[X].md in [PUBLIC] / [SHADOW] / [CONFLICT] / [ANACHRONISM-WATCH] format.
```

To write:
```
@WRITER Stage 1: Read dossier_chapter_[X].md e chapter_[X]_struttura.md.
[Se feedback_loop.md esiste, leggilo PRIMA.]
Per beat EU/GIULIA: italiano primario, voce Alex.
Per beat SLOVENIA: sloveno primario, voce Maja.
Output: draft_prose_[X]_it.md + draft_prose_[X]_sl.md (stesure indipendenti).

@WRITER Stage 2: Read draft_prose_[X]_it.md / _sl.md e STYLE_BIBLE.md.
Output: chapter_[X]_it.md + chapter_[X]_sl.md con formattazione finale.

@LINGUISTA: adatta la lingua non-primaria di ogni beat (non tradurre). Aggiorna NARRATIVE_GLOSSARY.md.
```

To trigger the editor:
```
@EDITOR Read chapter_[X]_it.md, chapter_[X]_sl.md e chapter_[X]_struttura.md.
Score each NUF (0, 0.5, 1) per entrambe le lingue.
Controlla anacronismi e calco-di-traduzione.
Se FAIL su una o entrambe: genera feedback_loop.md. Exit Code 2.
Se PASS su entrambe: conferma PASS. Elimina feedback_loop.md.
```
