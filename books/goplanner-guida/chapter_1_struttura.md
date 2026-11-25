# Capitolo 1 — Struttura: «Che cos'è GOPlanner»

**Final H1 (Writer Stage 2):** `# 1. Che cos'è GOPlanner`
**Part:** Parte I — Il dominio
**Chapter audience tag (PRD § 4):** ALL. Section tags below: [TUTTI] unless stated, with boxed asides for [STAFF] and [DEV].
**Core question (PRD § 4):** Quale lavoro organizza GOPlanner, chi lo usa, e qual è il ciclo completo dal file del committente all'esportazione? Con il glossario di base: utente, operatore, committente, commessa, utenza, lista, pratica, intervento, esito, stato.

**Chapter thesis (one sentence the Writer must be able to prove by the end):** GOPlanner si capisce con dieci parole e sei passi; ogni domanda «perché non torna?» diventa risolvibile quando si nomina l'oggetto con la parola del glossario, lo si colloca in un passo del ciclo e si apre la pagina dove quel passo lascia traccia.

**Continuity / glossary check (done by the Architect):**
- `chapter_index.md` and `NARRATIVE_GLOSSARY.md` do not exist yet: this chapter sets the canonical terms for the whole book. The canonical vocabulary is `/home/alan/firstmate/projects/GOPlanner/CONTEXT.md`.
- Known word traps the chapter must defuse rather than repeat:
  1. The menu label «Clienti» lists **utenze**. The glossary bans «cliente» for both committente and utenza. The Writer uses «Clienti» only as a menu label between «», never as a noun.
  2. The interface has a grid/menu item «Carichi» (Interventi › Carichi), and the code calls a lista `carichi`. The glossary bans «carico» as a synonym of lista. The guide says **lista**; «Carichi» appears only as a label.
  3. The utenze table in code is `utenti` (`lib/UtenzaBase.php`, `$table = 'utenti'`), **not** `utenze`, and has nothing to do with the gestionale's utenti (table `users` in the DB master `goplanner`). PRD § 4 row 14 says `utenze`: the Researcher must record this as a [CONFLICT]; code on `php8` wins.
  4. **Esito** and **stato** are not synonyms (CONTEXT.md lists each as «da evitare» for the other).
  5. The STYLE_BIBLE example name «Lotto 3 — marzo» is a bad name **for a lista** in this chapter, because it blurs lista and lotto. Invented example lista for this chapter: *Letture marzo — zona nord*, in lotto *Lotto 2*, declared as invented.

**Out of scope (one-line pointer only, per PRD «Confini tra capitoli»):** database per commessa, DB master and override priority (cap. 2); lotto, distretto, carico, campi personalizzati and the full rule of the stato dell'utenza (cap. 3); mappature, scarti in detail, Gea on the tracciato (cap. 4); planning tools (cap. 5); intervento lifecycle and transitions between stati (cap. 6); export models (cap. 7); the phone side (cap. 8); magazzino (cap. 9); Gea in full (cap. 10); permessi (cap. 11); Admin pages (cap. 12); code architecture (cap. 13–16).

---

## NUFs (Narrative Utility Functions)

Scoring: 10 NUFs, each 0 / 0.5 / 1. Pass = 8.5/10. Each NUF carries a **PASS test** so the Editor can score it without interpretation.

```
utility(reader-1): Reader can name the ten objects of the base glossary (utente, operatore, committente, commessa, utenza, lista, pratica, intervento, esito, stato) with the glossary word AND say where each one shows up in the gestionale (e.g. utenze under the menu «Clienti», liste under «Lista») → score += 1
  PASS test: the chapter contains a table (or equivalent) covering all ten words, each with a one-line definition consistent with CONTEXT.md and a "where you see it" column; no «da evitare» word is used as a synonym anywhere in the office-facing prose.

utility(reader-2): Reader can walk the six steps of the ciclo di una commessa (importazione → pianificazione → app → esito → verifica → esportazione), naming for each step the exact menu path or place, who acts (utente or operatore), what object is created or changed, and the chapter that covers it in depth → score += 1
  PASS test: a six-row table or six numbered steps with all four attributes per step; every menu path matches the dossier.

utility(reader-3): Reader can tell esito from stato and explain, with one concrete case, why an utenza can show «assegnato» after the operatore registered an esito, and what to check before opening a ticket → score += 1
  PASS test: the open loop set in the opening is closed in the esito/stato section with the sourced rule (stato dell'utenza copied from the last intervento touched by a back-office action), the reassurance that the work is not lost, the check to do, and the pointer to cap. 3 and cap. 6.

utility(reader-4): Reader can map a symptom to the first place to look: given «righe mancanti dopo l'importazione», «lista assente dal Piano», «utenze che non si riescono ad assegnare», «esportazione vuota o fallita», the reader knows the step of the ciclo involved, the page or tool to open first, and the chapter to read → score += 1
  PASS test: a symptom → passo → dove guardare → capitolo table with at least four rows, each "dove guardare" sourced.

utility(emotional-1): Reader feels confident explaining GOPlanner to a new colleague in five minutes, using only glossary words, because the chapter gave them a stable map (ten words, six steps) instead of a list of exceptions → score += 1
  PASS test: the chapter ends with a rule the reader can repeat (not a teaser for cap. 2), and the six steps are stated once in a single memorable line besides the table.

utility(emotional-2): Reader knows where to stop: what an utente can do alone (read the esito of an importazione, ask Gea, accept or refuse a proposta with «Autorizza», open a ticket from the chat) and when to hand over to the staff tecnico (pagina bianca, Admin pages, system-level configuration) → score += 1
  PASS test: at least one `> **Quando chiedere allo staff tecnico:**` box with ≥2 sourced triggers, plus one explicit statement that Gea's proposte change data only after «Autorizza» and that the ticket is opened by the utente, not by Gea.

utility(factual-1): The ten stato codes of an intervento, with constant name, number and interface label (1 importato, 2 validato, 3 assegnato, 4 eseguito, 5 non fattibile, 6 controllato, 7 inviato, 8 ripianificabile, 9 annullato, 10 prenotato), and the "da fare" set, cited from `lib/InterventoBase.php` and the `stati` table / UI labels → score += 1
  PASS test: a stati table whose numbers and labels match the dossier; any stato whose triggering action is not sourced is described only by its name, not tied to a step.

utility(factual-2): The interface-word ↔ code-name correspondence for developers (commessa = tenant, DB `goplanner_{db}` + `custom/{tenant}`; utenza = table `utenti`; lista = `carichi`; pratica = row of `carichi_righe`; intervento = `interventi`; esecuzione = `interventi_eseguiti`; gestionale utenti = `users` in DB `goplanner`) cited from `docs/01-foundations/03-database-facts.md` and code → score += 1
  PASS test: a `> **Per gli sviluppatori:**` box or small table with these pairs, each matching the dossier, and the `utenti` ≠ `users` trap stated explicitly.

utility(factual-3): Exact menu paths and limits of the ciclo: File › Importazione and «Importazione classica» (file max 10 MB), Interventi › Pianificazione (Operatore, Data, «Assegna»), the verification page path, File › Esportazione (esportazione in coda; file available 30 giorni), Clienti › Geocodifica «Riprova le non trovate» — each cited → score += 1
  PASS test: every path and number in the chapter appears in the dossier with a source; at least four of the listed items present.

utility(factual-4): Gea's place and rules cited: panel in basso a sinistra; a proposta becomes real only with «Autorizza»; the utente (not Gea) opens a ticket from the chat; Gea's answers follow written runbooks → score += 1
  PASS test: these four facts appear with sources from CONTEXT.md and the wiki articles listed in the Researcher brief; full Gea treatment deferred to cap. 10 with a pointer.
```

---

## BEAT LIST

Six `##` sections (INSTRUCTION.md: 5–6). Total body target ≈ 5,400 words. Every section: italic audience line at the top when not for everyone, ≥1 exact detail (menu path, label, number, file, short real case), ≥1 **Limite** paragraph (the Editor's "Concede" check), and ≤5 consecutive prose paragraphs without a table, list, procedure or box.

Opening paragraph before section 1 (≈100 words, not counted in beats): `*In questo capitolo* …` in italics, 2–3 sentences: what GOPlanner organizes, the ten words and six steps, for whom (tutti; i riquadri per gli sviluppatori si possono saltare).

### Beat 1 — `## Il lavoro che GOPlanner organizza`
- **Core question:** Quale lavoro organizza GOPlanner, per chi, e perché questa guida parte dalle parole?
- **Audience tag:** [TUTTI]
- **Word target:** 800–900
- **Paragraph functions, in order:**
  1. **Aggancio** — the open loop. A real, sourced situation told without personal data: in ufficio un'utenza risulta ancora «assegnato» anche se l'operatore ha registrato l'esito. The question that follows («il lavoro è andato perso?») is exactly the kind of question that today is answered by asking whoever was there. Do NOT answer it here: promise the answer in section 4.
  2. **Spiegazione** — what GOPlanner organizes, using the CONTEXT.md framing: liste di utenze da visitare, interventi pianificati per gli operatori, esiti e foto che tornano al committente. Committente as «il gestore dell'acqua o del gas» (CONTEXT.md example). Two working places: the gestionale (ufficio) and the app GOPlanner 3 (campo).
  3. **Dimostrazione** — the kinds of work visible in the sources, as examples and explicitly marked as varying by commessa (e.g. letture dei contatori, sostituzione dei contatori with the magazzino, allacci, cassettinaggio, censimento — only those the dossier sources; no tenant names in this chapter).
  4. **Limite** — what this guide and this chapter are not: not the step-by-step app manual for the operatore (cap. 8 covers the phone side from the office viewpoint); not the documentation of each commessa's customisations (those stay in the commessa's README, `custom/{tenant}/README.md`); features that exist only for some commesse are labelled as such throughout.
  5. **Sintesi** — the chapter's method in one line: ten words, six steps, one place per step where the trace stays.
- **Key facts the Researcher must find:**
  - The CONTEXT.md opening definition of GOPlanner (exact wording).
  - The sourced case "utenza ancora assegnata dopo la chiusura" (`wiki/assistenza-clienti/stato-utenza-assegnato-dopo-chiusura.md`) — the problem statement only, for the hook.
  - The list of work types that the sources actually show (export modules `lib/export_letture_*.inc.php`, wiki «Chiudi cassettinaggio», magazzino «contatori nuovi», menu voices «allacci e letture», `sorical_censimento` censimento) — report as work types, not as tenant names.
  - The official name of the app as written in the product: «GOPlanner 3» (`docs/mobile-v3/`, wiki magazziniere-app).
  - Whether the gestionale is described as «gestionale» / «back office» in the sources (pick the product's word).

### Beat 2 — `## Chi lavora in GOPlanner, e dove`
- **Core question:** Chi sono le persone di GOPlanner, dove lavora ciascuna (gestionale, app, fuori dal sistema), e che cosa può fare da sola?
- **Audience tag:** [TUTTI]
- **Word target:** 800–950
- **Paragraph functions, in order:**
  1. **Spiegazione** — the persone of CONTEXT.md: utente (accesso al gestionale, di solito in ufficio, supervisore degli operatori), amministratore, collega, operatore (campo, app), staff tecnico (persone di GOPlanner che fanno assistenza), Gea (assistente nel pannello in basso a sinistra), and the committente outside the system (manda le liste, riceve le esportazioni).
  2. **Dimostrazione** — table: *Chi | Dove lavora | Che cosa fa nel ciclo | Parola da non usare* (the «da evitare» column straight from CONTEXT.md: e.g. operatore ≠ «utente», «tecnico», «risorsa»; staff tecnico ≠ «supporto di secondo livello»; Gea ≠ «chatbot»).
  3. **Spiegazione** — how office and field meet: what the office does to the operatore's phone without touching it (one sourced example, e.g. comandi remoti approvati dall'ufficio in Impostazioni › Dispositivi mobili, richiesta valida 60 minuti — only if the dossier confirms; otherwise the abbinamento del telefono), with a pointer to cap. 8.
  4. **Contro-obiezione (optional, short)** — «L'operatore non è anche lui un utente?» Answer from the sources: in the glossary no; if the dossier confirms that an operatore can have a linked gestionale access ("account collegato"), state it as the exception and point to cap. 11.
  5. **Limite** — the chapter does not explain profili, ruoli and lotti di competenza (cap. 11); what a person sees depends on commessa and permessi (wiki menu pages say so explicitly). Name one profile as an example only if sourced (e.g. «Magazziniere», which sees only Magazzino).
  6. **Sintesi** — one rule: in GOPlanner «utente» means a person in the gestionale; the person on the street is the operatore.
- **Key facts the Researcher must find:**
  - CONTEXT.md definitions and «da evitare» lists for the six persone + committente.
  - Gea's position (CONTEXT.md: «nel pannello in basso a sinistra del gestionale») and the first-access presentation («Ho capito», rileggibile dalla campanella) from `wiki/assistenza-clienti/annunci-novita-campanella.md`.
  - Whether an operatore can also have a gestionale access: `wiki/assistenza-clienti/diagnostica-visibilita-operatore.md` ("account collegato, tipo utente"), `docs/01-foundations/06-user-profiles-and-permissions.md`.
  - Comandi remoti: label «Approva e invia» / «Rifiuta», path Impostazioni › Dispositivi mobili, 60 minuti (`wiki/assistenza-clienti/approvazione-comandi-remoti.md`, `docs/mobile-v3/comandi-remoti.md`).
  - Magazziniere profile (`wiki/assistenza-clienti/magazziniere-postazione-lettore.md`).
  - Where the "identità centralizzata" lives (DB master `goplanner`, table `users`) — for the DEV box of beat 3 only.

### Beat 3 — `## Le parole del lavoro: dal committente alla pratica`
- **Core question:** Che cosa sono committente, commessa, utenza, lista e pratica, dove si vedono nel gestionale, e quali parole confondono?
- **Audience tag:** [TUTTI] (with a `> **Per gli sviluppatori:**` box the office reader may skip — say so)
- **Word target:** 950–1,100
- **Paragraph functions, in order:**
  1. **Aggancio** — the same word means different things to three people: in the office «cliente» may mean the committente or the utenza; the menu says «Clienti» and lists utenze; the code calls the utenze table `utenti`. One wrong word in a ticket sends someone to the wrong object. (Source the claim on the docs line «I nomi delle tabelle non coincidono con quelli dell'interfaccia» and on CONTEXT.md's purpose statement.)
  2. **Dimostrazione** — the core table: *Parola | Che cos'è | Dove la vedi | Da non confondere con*, rows: committente, commessa, utenza (menu «Clienti»), lista (menu «Lista»), pratica (l'utenza dentro una lista; la stessa utenza in più liste), importazione, scarto, esportazione. Lotto, distretto and campo personalizzato get one row each with «vedi il capitolo 3».
  3. **Spiegazione** — the invented example (declared invented): lista *Letture marzo — zona nord*, lotto *Lotto 2*; one utenza that is in this lista and also in an older one → two pratiche, one utenza. Use only invented, non-personal data; the utenza's intestatario is never named.
  4. **Contro-obiezione 1 (mandatory)** — «Nel menu c'è scritto Clienti: allora le utenze sono i clienti?» Answer: «Clienti» is the menu label (CONTEXT.md says the utenza «nel menu si trova sotto «Clienti»»); the guide says utenza, because «cliente» would mix up committente and utenza.
  5. **Per gli sviluppatori (box)** — interface word ↔ code name: commessa = tenant (DB `goplanner_{db}`, folder `custom/{tenant}`; cap. 2); utenza = table `utenti` (not `utenze`; not the gestionale utenti, which are `users` in DB `goplanner`); lista = `carichi` (name in `cliente`, file in `nomefile` — only if needed); pratica = `utenti` + its row in `carichi_righe`; intervento = `interventi`; esecuzione = `interventi_eseguiti`. Pointer: cap. 14.
  6. **Limite** — some commesse show their own labels or extra fields (e.g. legacy lotto labels from `$custom['lotti']`, campi personalizzati); the glossary word stays the same even when a commessa's screen uses its own label; the chapter does not cover lotto/distretto rules (cap. 3).
  7. **Sintesi** — rule: name the object first, then look for it; the menu label is where it lives, the glossary word is what it is.
- **Key facts the Researcher must find:**
  - CONTEXT.md entries for committente, commessa, lotto, distretto, utenza, lista, pratica, importazione, scarto, esportazione, campo personalizzato (exact wording + «da evitare»).
  - `docs/01-foundations/03-database-facts.md` «Glossario: lista, lotto, pratica, distretto» table and the DB master / DB tenant section.
  - `lib/UtenzaBase.php` (`$table = 'utenti'`) and the classes for lista/pratica (grep `protected static $table = 'carichi'` / `'carichi_righe'` in `lib/`).
  - Exact top-menu labels as shown in the gestionale (Clienti, Lista, Interventi, File, Operatori, Magazzino, Impostazioni, Ticket, …) and which depend on permessi/commessa.
  - The [CONFLICT] PRD «`utenze`» vs code «`utenti`», resolved in favour of code.

### Beat 4 — `## Intervento, esito e stato`
- **Core question:** Che differenza c'è tra un intervento, il suo esito e lo stato, e perché un'utenza può risultare «assegnato» dopo che l'operatore ha registrato l'esito?
- **Audience tag:** [TUTTI]
- **Word target:** 850–1,000
- **Paragraph functions, in order:**
  1. **Spiegazione** — intervento (un lavoro da fare in un'utenza, assegnato a un operatore per un giorno); esito (what the operatore registers with the app: eseguito, oppure non eseguito con il motivo); stato (where an utenza or an intervento is in the work). One short sentence fixing the rule: l'esito lo scrive l'operatore, lo stato lo legge l'ufficio.
  2. **Dimostrazione** — the stati table: *Codice | Stato (etichetta) | Che cosa vuol dire*, ten rows from `lib/InterventoBase.php` (1 importato … 10 prenotato) with labels from the `stati` table / interface; mark the "da fare" set (`STATI_DA_FARE`: 1, 2, 3, 10). Mark as "solo alcune commesse" any stato the dossier ties to specific commesse (e.g. prenotato via Interventi › Da assegnare / Call Center, if sourced). Codes first time with their meaning (STYLE_BIBLE § Number rules).
  3. **Spiegazione** — where the esito lives: an esecuzione in `interventi_eseguiti` with letture, foto and, where the commessa collects them, campi personalizzati; the esito value for "eseguito" (`esito = 1`, per docs) and how "non eseguito" carries its motivo (as sourced).
  4. **Contro-obiezione 2 (mandatory, closes the opening loop)** — «L'operatore ha registrato l'esito: perché l'utenza risulta ancora «assegnato»?» Answer: lo stato dell'utenza non è un riassunto dei suoi interventi; è copiato dallo stato dell'ultimo intervento su cui l'ufficio ha fatto un'azione. With commesse that allow more interventi aperti per utenza, the utenza can show the stato of another, still open intervento. The work is not lost: check whether another intervento of the same utenza is «eseguito». Full rule: cap. 3; transitions: cap. 6.
  5. **Limite** — this section names the stati, it does not describe the transitions or who can move an intervento from one stato to another (cap. 6), nor how the app sends the esito (cap. 8). If the dossier cannot source what produces stati 6, 7 or 8, the Writer says only their names and points to cap. 6.
  6. **Sintesi** — rule to remember: esito = what happened on site; stato = where the work is now; they can disagree, and that disagreement has a rule.
- **Key facts the Researcher must find:**
  - `lib/InterventoBase.php` constants `IMPORTATO`…`PRENOTATO` and `STATI_DA_FARE` (lines ~149–161 on `php8`); the shared constants in `lib/UtenzaBase.php`.
  - The interface labels of the stati: table `stati` (`stati.nome`) — grep migrations/schema/seed files and `lib/dict/lang_it.php`; Clienti filter «Stato» value «importato» (`wiki/assistenza-clienti/runbook-utenze-da-pianificare.md`).
  - Which actions set 6 controllato, 7 inviato, 8 ripianificabile: grep `CONTROLLATO`, `INVIATO`, `RIPIANIFICABILE` in `lib/` and `custom/`; record "[UNVERIFIED]" if no single generic trigger exists.
  - `InterventoBase::updateStatoUtenza()` behaviour and the flag `interventi_multipli` (`lib/GOPlanner.php`, `hasInterventiMultipli()`), from `docs/02-patterns/34-stato-utenza-derivato-ultimo-intervento.md` + code (triangulate).
  - `interventi_eseguiti.esito` values and where the motivo of a non eseguito is stored/configured (`docs/01-foundations/03-database-facts.md`, `docs/02-patterns/16-mobile-inbound-sync.md`, `lib/JSONController.php`).
  - Interventi › Da assegnare (stato 10 «prenotato») from `wiki/assistenza-clienti/pagina-da-assegnare.md`.

### Beat 5 — `## Il ciclo di una commessa, dal file all'esportazione`
- **Core question:** Quali sono i sei passi che portano il file del committente fino all'esportazione, dove si fa ciascuno, chi lo fa, e che cosa lascia dietro di sé?
- **Audience tag:** [TUTTI]
- **Word target:** 1,050–1,200
- **Paragraph functions, in order:**
  1. **Spiegazione** — the cycle in one line, plain text (no image): importazione → pianificazione → app → esito → verifica → esportazione.
  2. **Dimostrazione** — the cycle table: *Passo | Dove (menu esatto) | Chi | Che cosa nasce o cambia | Stato dopo il passo | Capitolo*:
     1. Importazione — File › Importazione (or «Importazione classica», file max 10 MB) — utente with the import permission — lista, pratiche, utenze nuove o aggiornate, scarti con motivo — 1 importato — cap. 4
     2. Pianificazione — Interventi › Pianificazione: Operatore, Data, «Assegna» — utente — interventi — 3 assegnato — cap. 5
     3. App — the operatore receives the interventi of the day on GOPlanner 3 (giro) — operatore — the giro on the phone — stato as sourced — cap. 8
     4. Esito — eseguito / non eseguito con motivo, foto (firma, posizione where sourced) — operatore — esecuzione in `interventi_eseguiti` — 4 eseguito / 5 non fattibile — cap. 6, cap. 8
     5. Verifica — the verification page with its exact path (to be confirmed by the Researcher; candidates: Rapporti › Verifica interventi; Interventi › Mappa) — utente — controlled esecuzioni; a non fattibile can be ripianificato, which creates a **new** intervento — stato only as sourced — cap. 6
     6. Esportazione — File › Esportazione: mappatura e formato, esportazione in coda, file available for 30 giorni — utente — the file for the committente — stato only as sourced — cap. 7
  3. **Procedura / walk-through** — the invented lista *Letture marzo — zona nord* (declared invented; e.g. 120 utenze, numbers declared invented) goes through the six steps in short numbered steps, one action per step, each with its exact label. One scarto with a sourced motivo type (e.g. «un codice ripetuto», CONTEXT.md).
  4. **Contro-obiezione 3 (mandatory)** — «Ho importato la lista, perché non riesco ad assegnare alcune utenze?» Sourced chain: utenze senza coordinate are not on the Pianificazione map → cannot be assigned → rimedio from Clienti › Geocodifica, «Riprova le non trovate» (or correct the address in Clienti). Point to cap. 5.
  5. **Limite** — not every commessa runs the cycle the same way: some have extra planning modes (e.g. Centralino, Pianificazione giri, zone), verification pages specific to some commesse (`$custom['verifica_unica']`), Conversione/Analisi in the File menu only for some commesse, magazzino only where used. The cycle can loop (ripianificare = nuovo intervento). Say "alcune commesse" without names.
  6. **Sintesi** — rule: each step consumes what the previous one left; if a step looks empty, look at the step before it.
- **Key facts the Researcher must find:**
  - File menu voices and the 10 MB limit (`wiki/assistenza-clienti/pagina-file.md`; code: `pages/file.php`, `lib/Importazione*.php` — find the 10 MB check).
  - Import result: what is created (lista, pratiche, utenze nuove/aggiornate), scarti with motivo, «Stato di import ed export» (ultime 10 importazioni; import classico senza scarti salvati) — `wiki/assistenza-clienti/import-carico.md`, `stato-import-export.md`, `docs/02-patterns/13-import-logic-pattern.md`, table `importazioni` (GOP-481).
  - Pianificazione row labels Operatore, Data, «Assegna» — `wiki/assistenza-clienti/pagina-pianificazione.md`, `pianificazione-intervento.md`.
  - How the operatore receives the interventi in GOPlanner 3 (scarico / sincronizzazione; exact word used by the product) — `docs/mobile-v3/bootstrap-interventi.md`, `abbinamento.md`.
  - What the app sends with an esito (foto, firma, posizione) — `docs/mobile-v3/`, `docs/02-patterns/16-mobile-inbound-sync.md`.
  - The verification page: exact menu path and whether it is generic or per commessa — `wiki/assistenza-clienti/verifica-interventi-eseguiti.md`, `ripianifica-non-fattibile.md` («Rapporti, Verifica interventi, Ripianifica: crea sempre un nuovo intervento»), `lib/MenuRapporti.php`, `docs/03-cookbooks/34-verifica-interventi-estensioni-tenant.md`.
  - Export: path, mappatura e formato, esportazione in coda, 30 giorni — `wiki/assistenza-clienti/export-dati.md`, `runbook-export-vuoto-o-fallito.md`, `lib/EsportazioneRegistro.php` / `lib/EsportazioneLink.php` (find the 30-day expiry in code) and whether an expired export can simply be produced again.
  - Utenze senza coordinate chain — `wiki/assistenza-clienti/runbook-assegna-utenze.md`, `pagina-geocodifica-clienti.md`.
  - The stato set by each step, from code (import → 1; Assegna → 3; esito → 4/5); anything not sourced stays out of the table's "Stato" column ("—").

### Beat 6 — `## Dove guardare quando qualcosa non torna`
- **Core question:** Quando un dato non torna, in quale passo del ciclo si è fermato, quale pagina lo mostra, che cosa si può fare da soli e quando si chiama lo staff tecnico?
- **Audience tag:** [TUTTI] — italic line: *Per l'ufficio; il riquadro finale è per gli sviluppatori.* Contains an [STAFF] box and a [DEV] box.
- **Word target:** 850–1,000
- **Paragraph functions, in order:**
  1. **Spiegazione** — the rule: every step leaves a trace (registro delle importazioni, interventi and their esecuzioni, registro delle esportazioni, attività of utenti and operatori). The «attività» word from CONTEXT.md (not «log») for what a person did, with day and time.
  2. **Dimostrazione** — table: *Sintomo | Passo | Dove guardare per primo | Capitolo*, ≥5 rows, all sourced:
     - righe mancanti dopo l'importazione → importazione → esito dell'importazione / «Stato di import ed export» → cap. 4
     - lista assente dalla tendina del Piano → pianificazione → the runbook checks (lista, stato, attività del giorno) → cap. 5
     - utenze che non si riescono ad assegnare → pianificazione → coordinate (Clienti › Geocodifica) → cap. 5
     - un dato partito dal telefono che in ufficio non c'è → app → «dove si è fermato il dato» (non partito, respinto, non salvato) → cap. 8, cap. 12
     - esportazione vuota o fallita, o file scaduto → esportazione → ultime esportazioni (stato, righe attese e prodotte, filtri) → cap. 7
     - un errore a schermo → qualunque passo → «perché ho visto un errore» (codice dell'errore) → cap. 12
  3. **Spiegazione** — Gea as the first place to ask: answers follow written runbooks; can read the esito of the last importazioni/esportazioni and what a utente did; prepares proposte that change data only after «Autorizza»; the ticket is opened by the utente from the chat, never by Gea. Pointer to cap. 10.
  4. **Contro-obiezione 4 (recommended)** — «Posso chiedere a Gea di correggere i dati da sola?» Answer: Gea prepares a proposta; nothing changes until the utente presses «Autorizza», and only if the utente has the needed permesso (e.g. «Importare interventi» for mappature, if sourced). Example: a mappatura corrected by Gea is a copy of the commessa, the system model is never touched, and «Ripristina» exists (if sourced).
  5. **Limite / box** — `> **Quando chiedere allo staff tecnico:**` ≥2 sourced triggers: pagina bianca in the File menu = errore del server da segnalare; the Admin pages are tools of the staff; a datum that never left the phone; deleted items that the runbook says are not recoverable from the app (state proportionately, see guards).
  6. **Per gli sviluppatori (box)** — where each step lives, one line each, only paths confirmed by the dossier: flow `index.php` → `pages/` → `Smarty_templates/`; import `pages/file.php` + `lib/Importazione*.php`; planning menu `lib/MenuInterventi.php`; app API `mobile_v3.php` / `lib/JSONController.php`; export `lib/Export*.php`, `lib/Esportazione*.php`; per-commessa overrides in `custom/{tenant}/`. Pointer: cap. 13.
  7. **Sintesi (chapter close)** — the closing rule (see TARGET): prima la parola, poi il passo, poi la pagina; solo dopo Gea o lo staff tecnico. Not a teaser for cap. 2.
- **Key facts the Researcher must find:**
  - The runbooks and their first checks: `wiki/assistenza-clienti/runbook-import-righe-mancanti.md`, `runbook-lista-assente-tendina-piano.md`, `runbook-assegna-utenze.md`, `runbook-dove-si-e-fermato-il-dato.md` (request_id, GOP-264), `runbook-export-vuoto-o-fallito.md`, `runbook-errore-a-schermo.md`, `runbook-pagina-file-non-funziona.md`, `runbook-attivita-utente.md` (30 giorni), `runbook-lista-tutta-da-pianificare.md`.
  - Gea rules: `wiki/assistenza-clienti/runbook-correggere-mappatura.md` («Autorizza», copia del tenant, «Ripristina», permesso «Importare interventi»), `aprire-un-ticket-da-gea.md` («Lo apre l'utente, mai Gea»; «Ti impedisce di lavorare?»), `docs/02-patterns/38-chatbot-operazioni-anteprima-esegui.md`.
  - Ticket section of the back office (menu «Ticket») — `wiki/assistenza-clienti/sezione-ticket.md`.
  - Admin menu groups as a staff tool — `wiki/assistenza-clienti/pagina-admin-menu.md` (one line only; cap. 12).
  - The code paths for the DEV box — confirm each exists on `php8` (`docs/01-foundations/02-project-structure-map.md`, `docs/01-foundations/01-architecture-rules.md`).

---

## REVIEWER READINESS NOTES

### Tension points (where the chapter must create real stakes)
1. **The open loop of the «assegnato» utenza (beats 1 → 4).** Stakes: an ufficio that reads «assegnato» after the operatore's esito may open a false sync ticket or, worse, re-plan a visit already made. The chapter raises the question in the first paragraph and resolves it only in section 4 with the sourced rule. The Writer must not resolve it early, and must not leave it unresolved.
2. **The word trap (beat 3).** Stakes: the same word («cliente», «utenti», «carico») points to different objects for the office, the menu and the code; a ticket or a request to a developer written with the wrong word starts the search on the wrong object. The chapter turns this into a table and a box, not into a lament.
3. **The empty step (beat 5).** Stakes: a lista that "does not plan" usually lacks something from the previous step (utenze senza coordinate are not on the map). The reader must leave with the reflex "look at the step before".
4. **Where to stop (beat 6).** Stakes: doing alone what needs the staff (or the opposite: opening a ticket for something Gea can read in seconds). The «Quando chiedere allo staff tecnico» box makes the boundary explicit.

### Key chains to make explicit (cause → consequence → reader action)
- File del committente → importazione → lista + pratiche + scarti con motivo (stato 1) → **read the esito of the importazione before planning**.
- Utenza senza coordinate → absent from the Interventi › Pianificazione map → cannot be assigned → **Clienti › Geocodifica, «Riprova le non trovate», or correct the address**.
- «Assegna» with Operatore and Data → intervento in stato 3 → the operatore receives it on GOPlanner 3 → **if the operatore does not see it, check assignment and day first** (only as sourced; details cap. 8).
- Esito in the app → esecuzione in `interventi_eseguiti` with foto → stato 4 or 5 → verifica → esportazione → **a non fattibile is ripianificato as a new intervento, not reopened**.
- Back-office action on one intervento → its stato copied onto the utenza → with more interventi aperti the utenza shows the last one touched → **check for another «eseguito» intervento before opening a ticket**.
- Symptom → step of the cycle → page that keeps that step's trace → Gea (read, propose, «Autorizza») → staff tecnico (ticket) — **in this order**.

### Risk proportionality guards (every risk or cost mentioned needs its balancing context)
- **«Assegnato» after the esito:** always paired with "il lavoro non è andato perso" and with "è il comportamento previsto per le commesse che ammettono più interventi aperti sulla stessa utenza", plus the check to do.
- **File di esportazione scaduto dopo 30 giorni:** pair with the remedy the dossier gives (produce the esportazione again from its model, if sourced); never present expiry as data loss unless sourced.
- **Gea changing data:** pair with «Autorizza», the permesso required, and «Ripristina» / system model never touched (if sourced). Never imply Gea acts on its own.
- **Not recoverable deletions** (runbook "lista tutta da pianificare"): if mentioned at all, say what exactly is not recoverable and from where (the app), and that the attività show who and when; one sentence, pointer cap. 6/12.
- **Commessa-specific features** (verification page variants, Conversione/Analisi, Centralino, cassettinaggio, AI on photos): always "in alcune commesse", never as general, and without tenant names in this chapter (DECISIONI.md: whether committente names stay in the in-product edition is still open).
- **Personal data:** an utenza carries the intestatario's nominativo and an address; every example uses invented data, declared as such. No real tenant data, no screenshots (none available).
- **AI features:** analisi AI delle foto is mentioned at most in one line with "dove la commessa la usa"; no claims on accuracy.

### Counter-objections planned (STYLE_BIBLE requires ≥2; four planned, two mandatory)
1. Beat 3 (mandatory): «Nel menu c'è scritto Clienti: allora le utenze sono i clienti?»
2. Beat 4 (mandatory): «L'operatore ha registrato l'esito: perché l'utenza risulta ancora «assegnato»?»
3. Beat 5 (mandatory): «Ho importato la lista, perché non riesco ad assegnare alcune utenze?»
4. Beat 6 (recommended): «Posso chiedere a Gea di correggere i dati da sola?»

### Format reminders for the Writer (Editor blocking checks)
One H1 `# 1. Che cos'è GOPlanner`; the italic «*In questo capitolo*» paragraph; six `##` sections in the order above; tables in standard pipe Markdown with single-line cells; boxes as `> **Per gli sviluppatori:** …` / `> **Quando chiedere allo staff tecnico:** …`; no raw HTML, no images, no footnotes; last section `## Fonti` built only from sources actually used.

---

## RESEARCHER BRIEF

**Source rule (INSTRUCTION.md § Researcher, SOURCE OVERRIDE):** the web is NOT a source for this book. Every "web search term" of the generic template is replaced by the internal queries below, in priority order: code on `php8` (read only) → WikiLLM and `docs/` → Portolano → Jira GOP (read only). Apply the security filter before writing the dossier: no credentials, keys, hosts, IPs, `.env` values, personal names, addresses, phone numbers or emails; no tenant names in the [PUBLIC] facts for this chapter (put them in [SHADOW] only if needed to source a "solo alcune commesse" claim).

### 1. Code — `/home/alan/firstmate/projects/GOPlanner`, branch `php8` (Read/Grep, `git grep`, `git log`/`git show` only)
- `lib/InterventoBase.php` — `const IMPORTATO` … `const PRENOTATO`, `STATI_DA_FARE`, `updateStatoUtenza()`.
- `lib/UtenzaBase.php` — `$table = 'utenti'`, shared stato constants, `getUltimoInterventoChiuso()`.
- `git grep -n "static \$table\|\$table *=" -- lib/ | grep -E "carichi|carichi_righe|interventi|interventi_eseguiti|users"` — table names behind lista, pratica, intervento, esecuzione, utenti del gestionale.
- `git grep -n -E "CONTROLLATO|INVIATO|RIPIANIFICABILE" -- lib/ pages/ custom/` — which actions set stati 6, 7, 8 (generic vs per commessa).
- `git grep -n -i "stati" -- migrations/ docker/ docs/01-foundations/07-database-schema.md` and `git grep -n -i -E "'importato'|'assegnato'|'eseguito'|'non fattibile'|'prenotato'" -- lib/dict/lang_it.php Smarty_templates/it/` — interface labels of the stati.
- `git grep -n -E "hasInterventiMultipli|interventi_multipli" -- lib/` — the flag behind the «assegnato» case.
- Top menu labels: `git grep -n -E "Clienti|Interventi|Operatori|Magazzino|Impostazioni|Ticket" -- Smarty_templates/it/*.html lib/MenuLaterale.php lib/dict/lang_it.php` (note: `lib/menu.php` is legacy and not the gestionale menu).
- `pages/file.php`, `lib/ImportazioneController.php`, `lib/Importazione*.php` — File menu voices and the 10 MB limit (`git grep -n -E "10 ?\* ?1024|10485760|10 ?MB" -- pages/ lib/`).
- `lib/MenuInterventi.php`, `lib/MenuRapporti.php` — the Pianificazione and Verifica interventi menu paths.
- `lib/EsportazioneRegistro.php`, `lib/EsportazioneLink.php`, `lib/Export.php` — esportazione in coda, 30-day expiry (`git grep -n -E "30 ?(giorni|days)|INTERVAL 30|\+30 days" -- lib/`).
- `lib/JSONController.php`, `mobile_v3.php` — how the app receives interventi and sends the esito; `interventi_eseguiti.esito` values.
- `index.php`, `pages/`, `Smarty_templates/`, `custom/` — confirm the paths named in the DEV box of beat 6.

### 2. WikiLLM and repository docs
- `CONTEXT.md` — all entries (persone, organizzazione, lavoro, uso del gestionale), exact wording and «da evitare».
- `wiki/index.md`, then in `wiki/assistenza-clienti/`: `stato-utenza-assegnato-dopo-chiusura.md`, `pagina-file.md`, `pagina-interventi-menu.md`, `pagina-clienti.md`, `pagina-geocodifica-clienti.md`, `import-carico.md`, `stato-import-export.md`, `pagina-pianificazione.md`, `pianificazione-intervento.md`, `pagina-da-assegnare.md`, `verifica-interventi-eseguiti.md`, `ripianifica-non-fattibile.md`, `export-dati.md`, `runbook-export-vuoto-o-fallito.md`, `runbook-assegna-utenze.md`, `runbook-utenze-da-pianificare.md`, `runbook-import-righe-mancanti.md`, `runbook-lista-assente-tendina-piano.md`, `runbook-lista-tutta-da-pianificare.md`, `runbook-dove-si-e-fermato-il-dato.md`, `runbook-errore-a-schermo.md`, `runbook-pagina-file-non-funziona.md`, `runbook-attivita-utente.md`, `runbook-correggere-mappatura.md`, `aprire-un-ticket-da-gea.md`, `sezione-ticket.md`, `annunci-novita-campanella.md`, `approvazione-comandi-remoti.md`, `diagnostica-visibilita-operatore.md`, `pagina-admin-menu.md`, `magazziniere-postazione-lettore.md`, `modalita-pianificazione.md`.
- `docs/00-concept-index.md`, `docs/README.md`; `docs/01-foundations/01-architecture-rules.md`, `02-project-structure-map.md`, `03-database-facts.md` (glossary table, DB master vs DB tenant), `06-user-profiles-and-permissions.md`, `07-database-schema.md` (`stati` FK), `08-ui-ux-architecture.md` (top menu).
- `docs/02-patterns/13-import-logic-pattern.md`, `15-data-export-pattern.md`, `16-mobile-inbound-sync.md`, `25-identita-centralizzata-e-rbac.md` (one-line pointer only), `34-stato-utenza-derivato-ultimo-intervento.md`, `38-chatbot-operazioni-anteprima-esegui.md`, `43-avanzamento-carichi-fonte-stati.md`.
- `docs/03-cookbooks/34-verifica-interventi-estensioni-tenant.md`; `docs/mobile-v3/` (`abbinamento.md`, `bootstrap-interventi.md`, `comandi-remoti.md`).

### 3. Portolano — `mcp__rag_qdrant_server__query_rag_hybrid`, `user_roles: "goplanner"` (fall back to `query_rag`)
- "che cos'è GOPlanner ciclo commessa importazione pianificazione esito esportazione"
- "glossario utenza lista pratica commessa committente"
- "differenza tra esito e stato intervento"
- "stati intervento importato validato assegnato eseguito non fattibile controllato inviato ripianificabile annullato prenotato"
- "quando un intervento passa a controllato" / "stato inviato esportazione"
- "utenza ancora assegnata dopo chiusura interventi_multipli"
- "utenze senza coordinate non compaiono nella pianificazione Riprova le non trovate"
- "app GOPlanner 3 scarico interventi esito foto firma posizione"
- "Gea proposta Autorizza ticket aperto dall'utente"
- "file di esportazione scaduto 30 giorni rifare esportazione"
- "Importazione classica limite 10 MB"
Cite results by `slug`; prefer slugs that triangulate a code or wiki fact.

### 4. Jira GOP — cloudId `21873985-2e5d-4a8a-bb45-e6d453128985`, project `GOP` (read only)
- `project = GOP AND key = GOP-885` — book scope (no facts for the chapter body).
- `project = GOP AND key in (GOP-481, GOP-227, GOP-264, GOP-536)` — importazioni registry, lotti, request_id of the app data, runbook policy of Gea.
- `project = GOP AND text ~ "stato utenza" ORDER BY created DESC`
- `project = GOP AND text ~ "glossario" ORDER BY created DESC`
- `project = GOP AND (summary ~ "Verifica interventi" OR summary ~ "controllato") ORDER BY created DESC`
- `project = GOP AND summary ~ "Gea" AND statusCategory = Done ORDER BY updated DESC` (max 10)
Use tickets for real problem → cause → remedy stories, told without personal data.

### Document types to prioritise
1. Code on `php8` (authority on numbers, labels, table names, stati).
2. Wiki `assistenza-clienti` articles and runbooks (exact menu paths and UI labels, verified in the browser on dev where stated; respect their «Non verificato» sections).
3. `docs/01-foundations` and `docs/02-patterns` decision records.
4. Portolano slugs and Jira tickets for triangulation and real cases.

### Specific facts to hunt (checklist; mark `[UNVERIFIED: …]` if not found)
- [ ] CONTEXT.md opening sentence and the ten base definitions with «da evitare».
- [ ] Top-menu labels of the gestionale, in order, and the rule "dipende da commessa e permessi".
- [ ] The ten stati: number, constant, interface label, `STATI_DA_FARE`.
- [ ] Which action produces stati 3, 4, 5 (generic); whether 6, 7, 8 have a generic trigger.
- [ ] `interventi_eseguiti.esito` values; where the motivo of a non eseguito comes from.
- [ ] Table names: `utenti`, `carichi`, `carichi_righe`, `interventi`, `interventi_eseguiti`, `users` (DB `goplanner`), DB name pattern `goplanner_{db}`.
- [ ] File › Importazione and «Importazione classica» with the 10 MB limit (code location).
- [ ] What an importazione creates; the «Stato di import ed export» view (ultime 10); import classico without saved scarti.
- [ ] Interventi › Pianificazione labels: Operatore, Data, «Assegna».
- [ ] How GOPlanner 3 receives the interventi; what an esito carries (foto, firma, posizione).
- [ ] Verification page: exact path (Rapporti › Verifica interventi?), generic or per commessa; «Ripianifica» creates a new intervento.
- [ ] File › Esportazione: mappatura e formato, in coda, file available 30 giorni (code location), how to obtain it again.
- [ ] Clienti › Geocodifica, «Riprova le non trovate», «Solo anomalie».
- [ ] Gea: position, presentation at first access («Ho capito», campanella), «Autorizza», ticket opened by the utente, «Ti impedisce di lavorare?», runbook-based answers.
- [ ] «Quando chiedere allo staff tecnico» triggers: pagina bianca (errore del server), Admin pages as staff tool, dato non partito dal telefono.
- [ ] [CONFLICT] PRD «`utenze`» vs code «`utenti`»; any other doc-vs-code disagreement found.
- [ ] One real ticket story (problem → cause → remedy) usable for beat 1 or beat 6, without personal data.

---

## TARGET

- **Word count:** ≈ 5,400 words for the chapter body (range 4,800–6,000; PRD § 4: 4,000–6,000 words per chapter, 5–6 sections). Split: intro ≈ 100; beat 1 ≈ 850; beat 2 ≈ 875; beat 3 ≈ 1,000; beat 4 ≈ 925; beat 5 ≈ 1,125; beat 6 ≈ 925; `## Fonti` not counted.
- **Opening hook strategy:** open on the sourced case of the utenza still showing «assegnato» after the operatore registered the esito, and leave the question «il lavoro è andato perso?» open until section 4, so the chapter's first lesson (esito and stato are two different words) is earned rather than announced.
- **Closing beat promise:** the chapter ends on a rule the reader can apply the next morning — prima la parola del glossario, poi il passo del ciclo, poi la pagina dove quel passo lascia traccia; solo dopo Gea, e poi lo staff tecnico — with no announcement of the next chapter.
