# Chapter 10 — Struttura (Architect spec)

**Chapter title (H1 for the Writer):** `# 10. Gea, l'assistente di GOPlanner`
**PRD row:** «Che cosa fa Gea e che cosa non fa: domande, runbook di indagine, proposte con «Autorizza», correzione delle mappature, ticket aperti dalla chat, contesto della pagina, limiti» — audience **ALL**.
**Core question of the chapter:** what can a person in the office ask Gea, what does Gea read and do to answer, and where does her work end and the user's decision (or the staff tecnico) begin?
**Chapter thesis (the rule the whole chapter proves):** Gea reads, investigates with written instructions, and prepares; she never decides. Every change to the data and every ticket needs a button pressed by the user («Autorizza», «Apri il ticket»), with the user's own permessi, and whatever no button can do goes to the staff tecnico. Knowing exactly where that line is makes Gea useful instead of mysterious.

### Continuity and glossary check (done by the Architect, 25 novembre 2026)
- `chapter_index.md`: not present yet. `NARRATIVE_GLOSSARY.md`: not present yet. Canonical vocabulary = `/home/alan/firstmate/projects/GOPlanner/CONTEXT.md`.
- The Architect read the chapters already written (1–6) for claims about Gea. Claims chapter 10 must stay consistent with:
  - ch.1 (structure): Gea is «nel pannello in basso a sinistra»; proposte become real only with «Autorizza»; the ticket is opened by the utente, never by Gea; Gea follows written runbooks. **Code confirms bottom-left** (see [CONFLICT] 1).
  - ch.2: Gea answers only for the commessa open in the session; Gea is on by default in the repository file (GOP-143) but in production a service switch must be on too; message «Limite giornaliero raggiunto, riprova domani o contatta lo staff.».
  - ch.3: Gea does the lista-in-tendina checks read-only; Gea does not recalculate the stato of an utenza; Gea describes the configurazione of the open commessa (campi personalizzati, colonne, mappature).
  - ch.4: Gea reads the last 10 importazioni, 10 liste and 10 esportazioni; the **full procedure** of the mappatura correction (verify file → proposta → «Autorizza» → verifica → «Ripristina») is already told in ch.4 § «La correzione con Gea». **Chapter 10 must not retell it**: it uses it as the worked example of the proposta mechanism in ≤ 200 words and points to ch.4.
  - ch.5: «Se non ricompare, controllate le quattro condizioni o chiedete a Gea.»
  - ch.6: «Anche Gea può preparare un cambio di operatore o di data, se le si dà il numero dell'intervento.» **FLAG:** `docs/02-patterns/39-…` (GOP-536) says that to a direct order («affida a…», «cambia la data») Gea explains how to do it without executing, and proposes changes only as steps of a runbook; the code still registers the operations (`lib/ChatbotRegistro.php` `CLASSI`) and the system prompt (`chatbot-service/src/server.ts`) has no explicit "orders → explain only" sentence. The Researcher must resolve this ([CONFLICT] 2). Chapter 10 states what the code and Jira support; if it contradicts ch.6, the Writer states the rule correctly here and the Reviewer records the contradiction in `chapter_index.md` for a ch.6 fix.
- **Glossary traps specific to this chapter (Writer and Editor must check all eight):**
  1. **Gea**, never «chatbot», «bot», «intelligenza artificiale», «modello» in text for the office (CONTEXT.md «Da evitare»). The launcher label is «Assistente virtuale» and the panel title «Gea · assistente virtuale»: quote them as labels. Code names such as `chatbot-service/` appear only inside `> **Per gli sviluppatori:**` boxes.
  2. **Proposta** = a change Gea prepares and shows before doing it; real only after «Autorizza». Never «comando», «operazione eseguita» for a proposta.
  3. **Staff tecnico**, never «supporto», «sviluppatori», «secondo livello». Some UI messages say «contatta lo staff» or «Il supporto non è disponibile…»: quote them verbatim as messages.
  4. **Commessa**, never «tenant» in prose. The ticket card has the label «I colleghi di questo tenant, senza il tuo nome»: quote it verbatim and say once, in parentheses, that here «tenant» means the commessa.
  5. **Collega** = another utente of the same company; Gea itself calls others «un collega» — use it as the glossary word, not as an anonymising trick.
  6. **Attività** = what an utente or operatore did in the gestionale or app (glossary). Gea's reading of «attività» matches the glossary exactly; never use «log» in office text (allowed in DEV boxes for CloudWatch).
  7. **Utente** (office) vs **operatore** (field). Gea is for utenti; the operatore's app has no Gea.
  8. **AI vocabulary:** for the office there is only «AI» (as in ch.6). No model, vendor or provider names anywhere in the chapter, not even in DEV boxes (the provider is ch.15 material and Gea herself is forbidden to name it).
- **«Runbook»** is not a glossary word. First occurrence: «runbook, cioè un'istruzione d'indagine scritta» (PRD uses the word). After that «runbook» is allowed.

### Chapter boundaries (one-line pointers only, per PRD § 4 «Confini tra capitoli»)
| Topic touched here | Owned by | What ch.10 may say |
|---|---|---|
| Mappatura as configuration; tracciato diagnosis column by column; full correction procedure | ch.4 | The mappatura correction only as the example of a proposta (what the card shows, «Autorizza», «Ripristina», system model never touched, permesso «Importare interventi»), ≤ 200 words, then «vedi il capitolo 4» |
| Lista missing from the Piano, Assegna, Pianificazione | ch.3, ch.5 | One row in the runbook table + pointer |
| Riaffidare / cambiare data from the page; stati that «Modifica» accepts | ch.6 | The same stato rule applies to Gea's proposta (Assegnato or Annullato only), one sentence + pointer |
| AI analysis of foto and its Impostazioni page | ch.6 | Gea's rule proposal from Impostazioni › Analisi AI delle foto, ≤ 120 words + pointer |
| Esportazione empty or failed | ch.7 | One row in the runbook table + pointer |
| The operatore's app, its errors | ch.8 | One row in the runbook table (Gea checks all operatori at once) + pointer |
| Permessi, profili, RBAC, who has which tipo | ch.11 | Who sees the Gea button, in words, + «vedi il capitolo 11» |
| Runbooks «dove si è fermato il dato» and «perché ho visto un errore»; menu Ticket; announcements and campanella as admin tools | ch.12 | What Gea reads (errors of the user's own requests, 30 minuti or an 8-character code) in ≤ 3 sentences + pointer; the menu Ticket in one sentence + pointer |
| Architecture of the Gea service (Node service, PHP as data broker, token, knowledge base, audit storage) | ch.15 | DEV boxes only, max 5 lines each, + «vedi il capitolo 15» |

---

## NUFs (Goal Scoring)

Ten NUFs, so the Editor can score one point each against the 8.5/10 gate. Format per INSTRUCTION.md § Architect.

```
utility(reader): Reader can open Gea (button «Assistente virtuale» at the bottom of the left menu; panel «Gea · assistente virtuale» in basso a sinistra; «Ingrandisci»/«Riduci», «Chiudi», «Interrompi», «Spiegamelo meglio», the page suggestions) and can say the three reasons why the button may be missing: Gea switched off for the commessa, an access in sola lettura, Gea not switched on in that environment → score += 1

utility(reader): Reader can ask a question that starts the right investigation (the words of the symptom, asked from the page where the problem shows) and can read the answer: which check supports each conclusion, which register and which period Gea read, and when a conclusion is only a hypothesis → score += 1

utility(reader): Reader can name at least six investigations Gea runs from written runbooks, what Gea reads for each (registro of importazioni/esportazioni, visibilità e lotti di un operatore, configurazione della commessa, attività of the last days, errors of the user's own requests, problems of the operatori's app) and the chapter of the guide that owns each topic → score += 1

utility(reader): Reader can explain what Gea sees of the page — always a few light hints (pagina, lista, operatore, data, finestra aperta, how many warnings); the screen content only when the question is about it (max 50 visible rows; never passwords or hidden fields); a foto only on explicit request — and what Gea may do on the page without asking (fill, filter, search, open a window, change page) versus what always needs «Autorizza» → score += 1

utility(reader): Reader can read a proposta card (record, prima/dopo of the changed fields only, deadline 10 minuti) and choose «Autorizza» or «Annulla», and can explain in words why an authorised proposta may still be refused (the record changed in the meantime, the proposta expired or was already used, a permesso is missing) → score += 1

utility(reader): Reader can open a ticket from the chat end to end — the card «Ticket per lo staff tecnico», «Testo del ticket (puoi correggerlo)», «Ti impedisce di lavorare?» (Sì/No, required), «Chi lo vede», «Apri il ticket» / «Non aprire» — knows what is attached automatically and that only the staff tecnico sees it, and knows what each failure message asks them to do → score += 1

utility(reader): Reader can ask Gea for a new function and knows the path: guide and similar functions first (described without naming other commesse), at most 3–4 questions one at a time, the request card, the states Ricevuta / In valutazione / Pianificata / Non prevista / Risposta / Disponibile, and no promise of times or costs → score += 1

utility(emotional): Reader feels safe letting Gea investigate and prepare changes, because nothing changes without their click, the click acts with their own permessi, Gea re-reads the record before writing, every authorised change is recorded (who, when, prima e dopo), and the riskiest operations — cancellazioni definitive, utenti e permessi, configurazione della commessa, importazioni, operazioni in blocco — are excluded by design → score += 1

utility(emotional): Reader knows where Gea stops and the staff tecnico begins: Gea cannot bring back deleted interventi, does not see other commesse, does not promise times, does not explain how she works; and the concrete triggers to go to the staff (button missing where expected, «Limite giornaliero raggiunto, riprova domani o contatta lo staff.», «Non sono riuscita a completare la diagnosi nel tempo previsto. Contatta lo staff.», a proposta refused again and again, data to recover) → score += 1

utility(factual): The chapter states, each with its source: who sees Gea (`ChatbotAuth::TIPO_MASSIMO = 2`, sola lettura excluded, `$custom['chatbot_enabled']`, `lib/ChatbotAuth.php`); proposta deadline 10 minuti and exclusions (`docs/02-patterns/38-chatbot-operazioni-anteprima-esegui.md`); screen reading limits 50 righe / 48 KB / 10 messaggi and page events 20 / 10 minuti (`docs/02-patterns/39-chatbot-contesto-pagina-azioni-interfaccia.md`); ticket limits 4.000 caratteri and 50 in 24 ore (`wiki/assistenza-clienti/aprire-un-ticket-da-gea.md`); log search up to 7 giorni, own errors 30 minuti or an 8-character code (`chatbot-service/src/server.ts` systemPrompt, `wiki/assistenza-clienti/runbook-errore-a-schermo.md`); registro delle azioni kept 12 mesi (pattern 38) → score += 1
```

**PASS tests the Editor can apply quickly:** the chapter contains (a) one numbered procedure for opening a ticket and one for handling a proposta; (b) one table of runbooks (symptom → what Gea checks → chapter); (c) one table of page action levels (what needs «Autorizza»); (d) one table or list «Gea non…» with the reason of each limit; (e) at least one `> **Quando chiedere allo staff tecnico:**` box with ≥ 4 sourced triggers; (f) no provider or model name anywhere.

---
## BEAT LIST

Six sections (`##` in the final chapter). Each needs: at least one exact concrete detail (label, number, file, case), at least one **Limite** paragraph, max 5 prose paragraphs in a row without a table/list/box/subheading. All sections are [TUTTI] (chapter tag ALL): no italic audience line is required, except where a subsection is only for amministratori (stated below). Code goes only into `> **Per gli sviluppatori:**` boxes, and the first such box tells office readers they can skip it.

Before § 1 the Writer puts the mandatory `*In questo capitolo…*` paragraph (2–3 sentences: what Gea reads, what she prepares, what stays to the user and to the staff tecnico; for everyone who uses the gestionale, with short boxes for developers).

---

### § 1 — `## Chi è Gea, dove si apre e chi la vede`
**Tag:** [TUTTI] (one DEV box)
**Core question:** What is Gea, where is she in the gestionale, how is the panel used, and why can one colleague see her and another not?
**Word target:** 850 (range 800–950)
**Paragraph functions:** Aggancio (the opening hook, see TARGET) → Spiegazione (what Gea is, in the glossary's words) → Procedura (open and use the panel) → Dimostrazione (labels) → Limite (who does not see her) → Sintesi.

**Content plan**
- Aggancio: the real case of 22 novembre 2026 (pattern 39): in the page Importazione a user asked about an error shown on screen; Gea opened the guide of the File page and answered that she did not see the error «I modelli salvati non sono attivi per questo tenant». The cause: no written rule told her to read the screen for that kind of question. The fix was a rule (read the screen when the user asks about a message he sees). Three sentences, no personal data, then the thesis: Gea does what her written instructions and her tools allow, and this chapter is the list of both. Quote the error text as it appeared (it contains «tenant»: it is a quoted message, leave it).
- Definition from CONTEXT.md: l'assistente virtuale di GOPlanner, in the panel in basso a sinistra. She answers in the commessa open in the session, and only for that commessa (one sentence, pointer ch.2).
- `### Aprire il pannello` — numbered procedure: 1. at the bottom of the left menu press «Assistente virtuale»; 2. the panel «Gea · assistente virtuale» opens bottom-left with the greeting «Ciao [nome], sono Gea, l'assistente virtuale di GOPlanner» (only the first name; without a valid first name, «Ciao»); 3. write in «Scrivi un messaggio» and press «Invia», or click one of the suggestions of the page; 4. while Gea works, the panel shows the steps and the elapsed time; «Interrompi» stops the answer; 5. «Ingrandisci» widens the panel for reading («Riduci» brings it back); the corner handle resizes it (double click restores); «Chiudi» closes it.
- Suggestions: a curated list per page (GOP-813). A page without a guide shows no suggestions instead of unrelated ones (GOP-823). One example pair from the widget (e.g. Interventi › Lista: «Perché non trovo un intervento vecchio nella lista» — «Si vedono solo gli ultimi 6 mesi»).
- «Spiegamelo meglio» under an answer: asks Gea to re-explain with simpler words and more context.
- First access: the announcement «Ti presentiamo Gea» opens by itself; «Ho capito» marks it read for that person; it can be re-read from the campanella (one sentence + «vedi il capitolo 12» for announcements).
- Who sees the button (in words, no tipo numbers in office text): the commessa must have Gea on, and the utente must be an amministratore or an office user with write access; an access in sola lettura does not see the button. In production a general switch must be on as well (ch.2 already told the configuration rule: one sentence).

**Limite (mandatory):** Gea is only in the gestionale web, not in the app GOPlanner 3 of the operatori; a commessa can switch her off in its own configuration; if the button is missing where colleagues have it, the cause is the access (profilo/sola lettura → ch.11) or the commessa — ask the amministratore, then the staff tecnico.

**DEV box (≤ 5 lines):** `ChatbotAuth::visibile()` = `$custom['chatbot_enabled']` + `ChatbotAuth::tipoAmmesso()` (`users.tipo` 0–2: super-admin, Amministratore Cliente, back office scrittura; `TIPO_MASSIMO = 2`); production switch `ChatbotAuth::interruttoreAmbiente()` read in `config-docker.inc.php`; launcher `#chatbot-toggle` in `Smarty_templates/it/_header.html` (side footer); first name from `ChatbotAuth::nomeDiBattesimo()` (GOP-819). Service architecture → «vedi il capitolo 15».

**Key facts the Researcher must find**
- Confirm on `php8` the launcher label «Assistente virtuale» and its place (`#side-footer` in `_header.html`), the panel CSS position (`left: 16px; bottom: 16px` in `chatbot-service/src/widget.ts`), the panel title, «Ingrandisci»/«Riduci», «Chiudi», «Scrivi un messaggio», «Invia», «Interrompi», «Spiegamelo meglio», the greeting and its sub-line («Scrivi una domanda o parti da uno di questi suggerimenti.» / «Scrivi una domanda.»).
- The suggestions list (GOP-813) and the no-generic-fallback rule (GOP-823): pick one exact pair (testo + hint) for an office page.
- Whether the RBAC profiles (ch.11) add any permission on top of `users.tipo` for Gea: `git grep -n -i "chatbot" -- lib/Rbac* lib/*Permess* lib/*Profil*`. If none, record «only `tipo`» in [PUBLIC].
- How many commesse switch Gea off: `git grep -n "chatbot_enabled'\] *= *false" -- 'custom/*/config.inc.php' | wc -l` (dossier only; the chapter says «una commessa può spegnerla»).
- Whether the app GOPlanner 3 has any Gea entry (`docs/mobile-v3/`, grep «Gea») — expected none.

---

### § 2 — `## Che cosa chiedere: domande, indagini e runbook`
**Tag:** [TUTTI] (one DEV box)
**Core question:** What kinds of questions does Gea answer, how does a written runbook drive her investigation, and how should the reader judge the answer?
**Word target:** 1.050 (range 950–1.200)
**Paragraph functions:** Aggancio (the enemy: tribal knowledge → a written instruction) → Spiegazione (three kinds of question; what a runbook is) → Dimostrazione (runbook table; one surgical example) → contro-obiezione → Limite → Sintesi.

**Content plan**
- Three kinds of question: «come si fa» (procedure: Gea answers from the guides of the page and the knowledge base); «che cosa è successo nei dati» (an investigation: Gea reads the data of the commessa with her own tools); «che cosa vuol dire questo messaggio» (the screen: § 3).
- What a runbook is: a page of the support wiki (`wiki/assistenza-clienti/runbook-*`) written for Gea, with fixed parts — Sintomi, Controlli (in order), Cosa dire all'utente, Soluzione, Se non risolve, Tenant (= commesse where it applies; say it in words). Gea opens the runbook that matches the symptom **before** answering, runs its checks in order, and does not name the guide to the user. The staff tecnico writes the runbooks and approves each one before it is published (pattern 39: no personal name of the approver in the text).
- Table (one row per runbook the dossier confirms; at least 8 rows): *Sintomo detto dall'utente | Che cosa controlla Gea | Capitolo*. Candidates: lista assente dal Piano (four conditions and the saved copy; ch.3/ch.5); lista tutta da pianificare (state and deletions of the day; ch.5); non riesco ad assegnare le utenze (coordinates, already assigned, lista chiusa, operatore; ch.5); import con righe mancanti (last importazioni, scarti and motivi; ch.4); file non conforme (column by column; ch.4); export vuoto o fallito (last esportazioni, file scaduto dopo 30 giorni; ch.7); problemi con l'app (all operatori of the commessa in one call; ch.8); quanti operatori sono attivi (definition below); storico di un'utenza; attività e consigli; perché ho visto un errore (ch.12); dove si è fermato il dato (ch.12); richiesta di una funzione nuova (§ 5); regola per l'AI delle foto (§ 4, ch.6).
- One surgical example (Dimostrazione), chosen because it shows a rule replacing an opinion: «quanti operatori sono attivi» — for Gea an operatore is active if he closed at least one intervento in the period, not because he is in the anagrafica (`runbook-operatori-attivi.md`). One short paragraph.
- What Gea reads to investigate (bulleted, only what the dossier confirms): the registro of the last importazioni, liste and esportazioni (ch.4 said: last 10 each — reuse, do not re-explain); the configurazione of the commessa (campi personalizzati, colonne, mappature — ch.3); stato, visibilità and lotti of one operatore; the attività of the gestionale (own actions up to 30 giorni; colleagues' actions 7 giorni, 30 for amministratori); registers of the web pages and of the field app up to 7 giorni; errors of the user's own requests (§ 3 / ch.12).
- How Gea must report (from the system prompt, said in office words): conclusions in Italian, ora italiana, menu labels exactly as on screen; for each conclusion which check supports it and how certain it is; says which register, which period and which word it searched; says when a source was unavailable instead of inventing; corrects obvious typos by herself («aoo» = app) and asks only when two readings are both plausible.
- Colleagues: what the asker did is «hai…»; what others did is «un collega». A name only when an amministratore explicitly asks who did it.
- **Contro-obiezione 1:** «Gea mi ha detto che non ha trovato problemi: allora non c'è niente?» → No by itself: a single narrow search without events never proves that there is no problem; Gea must say which register and period she read; ask her to widen the period (up to 7 giorni for the registers) or to check all operatori, then the staff tecnico.

**Limite (mandatory):** without a runbook Gea only explains, she does not investigate by improvising a procedure (state it as the GOP-536 rule only if the Researcher confirms it is in force; otherwise state the softer documented rule: she opens the guide first and follows its checks); Gea never proposes SQL to the user and never asks him to run queries; she does not invent commessa-specific information; an answer can stop with «Non sono riuscita a completare la diagnosi nel tempo previsto. Contatta lo staff.» (limits of steps and time per answer).

**DEV box (≤ 5 lines):** runbooks live in `wiki/assistenza-clienti/runbook-*.md` and are indexed in `wiki/index.md`; Gea opens them with an internal wiki tool before any other tool (system prompt in `chatbot-service/src/server.ts`); tools that read data are PHP classes in `lib/ChatbotRegistro.php` (`CLASSI`) behind `JSONController`; per-answer limits `CHATBOT_MAX_TOOL_ITERATIONS` (default 12) and `CHATBOT_TURN_DEADLINE_MS` (default 90 s). A new runbook is a wiki page, not code.

**Key facts the Researcher must find**
- The current list of `runbook-*` pages in `wiki/index.md` with their one-line summaries (for the table); for each row, the chapter of this guide that owns the topic.
- `wiki/assistenza-clienti/runbook-operatori-attivi.md`: exact definition and the column it uses (dossier only for the column).
- Windows of the attività: `chatbot-service/src/web-activity.ts` and `runbook-attivita-utente.md` (30 giorni own, 7 giorni colleagues, 30 for amministratori) — confirm in code.
- Log window «fino a 7 giorni» and «window_hours: 168» (systemPrompt) — the chapter says only «fino a 7 giorni».
- The exact timeout and step messages (`chatbot-service/src/server.ts` lines ~330–335) and the defaults 12 steps / 90.000 ms.
- Who approves runbooks and how (pattern 39 § «Azioni solo da runbook»; skill chatbot-review in pattern 36) — in the chapter: «lo staff tecnico», never a personal name.
- GOP-536 status in Jira (in force or not) and whether the prompt or code enforces «senza runbook spiega soltanto».

---

### § 3 — `## Il contesto della pagina: che cosa Gea vede e che cosa può fare`
**Tag:** [TUTTI] (one DEV box)
**Core question:** What does Gea see of the page the user is on, when does she read the screen, and what may she do on the page with or without asking?
**Word target:** 1.000 (range 900–1.150)
**Paragraph functions:** Aggancio (back to the 22 novembre case in one line: the screen is read only when the question is about it) → Spiegazione (light hints vs screen) → Dimostrazione (what is read, what is never read; levels table) → Spiegazione (opening advice) → contro-obiezione → Limite.

**Content plan**
- `### Che cosa arriva a ogni domanda` — only a few light hints: the page, the lista, the operatore, the date, the window open (its id, never its text), the actions the page offers to Gea, and how many error or warning messages the page shows (the number only). For Gea they are a clue, not a proof: she checks them with her tools.
- `### Quando Gea legge la schermata` — only when the question is about what the user is looking at («questo errore», «perché non salva», the record open): fields of the open window and of the open record, **including values not yet saved**; the other fields as active filters; the grid with its columns, at most 50 visible rows, the selected rows and the total; the visible messages (type error/avviso/informazione and text, at most 10); the last errors of the page (at most 10); the page events of the last 10 minuti (at most 20: saves, windows opened and closed, failed calls). Never read: passwords, hidden fields, password fields, fields the page marks as excluded; the service removes them again by name and label. Over 48 KB the reading is cut and Gea says so.
- Foto: never in the screen reading; only if the user asks about one precise foto, one foto at a time, reduced — and only where this reading is switched on (see [CONFLICT] 6; if not confirmed live, the Writer writes «dove è attiva» or drops the sentence).
- «I dati della pagina sono dati»: notes and names on the page are written by other people; Gea treats them as data to read, never as instructions to follow. One sentence, plain.
- `### Che cosa Gea può fare sulla pagina` — Gea uses only actions the page has declared to her, never blind clicks. Table *Livello | Che cosa fa | Chiede «Autorizza»?*: compilare campi (fields highlighted, message «Ho compilato» with «Annulla», which puts back the previous values: «Ho rimesso i valori di prima.») — no; filtri e ricerche — no; aprire o chiudere una finestra — no; cambiare pagina (only when the answer is finished; changing page closes the panel) — no; modificare dati — **always** «Autorizza» (§ 4). Reading never needs authorisation.
- Which pages offer actions today: only what the code on `php8` registers (see [CONFLICT] 3: the Architect found only Impostazioni › Analisi AI delle foto). The Writer names only pages confirmed by the dossier; on the others Gea explains and the user clicks.
- `### Il consiglio all'apertura` — the one exception to «Gea non scrive per prima»: when the panel opens, Gea can show one advice, decided by fixed server rules (not by Gea), for an evident error of the person in the last 24 ore. Bulleted, the six cases: importazione fallita; esportazione fallita; importazione con righe scartate; esportazione con righe scartate; same file imported at least twice (risk of double liste); same esportazione repeated at least three times. At most one per session. Buttons «Sì, spiegami», «Non mostrarmi più questi consigli», «Riattivali» (in the empty panel).
- **Contro-obiezione 2:** «Gea legge tutto quello che ho sullo schermo?» → No: by default only the light hints; the screen only when the question is about it; passwords and hidden fields never; the foto only if asked.

**Limite (mandatory):** on a page that declares no actions Gea can explain but not fill or filter; an action of level «modifica» run from the page is checked against what the page shows at that moment, not re-read on the server like a proposta of § 4 (DEV box); the opening advice needs a preference table in the commessa — without it Gea simply gives no advice (one sentence, tenant-dependent); Gea's page reading expires after 10 seconds without an answer from the browser, and Gea says the page did not answer.

**DEV box (≤ 5 lines):** `GoplannerChatbot.registra({nome, descrizione, livello, campi, esegui})` in the page JS (levels `compila | filtro | ricerca | naviga | modale | modifica`); reading in `readScreen` of `chatbot-service/src/widget.ts`, checks in `page-actions.ts`, bridge `page-bridge.ts` (`POST /chat/pagina`, 10 s); excluded fields with `data-chatbot="escludi"`; opening advice in `lib/ChatbotConsigli.php`. To hook a new page: register its actions in its JS, no change to the service (pattern 39 § Conseguenze).

**Key facts the Researcher must find**
- `git grep -n "registra(" -- js/ custom/ Smarty_templates/` and `git grep -n "data-chatbot-record" -- js/ Smarty_templates/ custom/`: the real list of pages with page actions on `php8`.
- Exact labels «Ho compilato», «Ho rimesso i valori di prima.», «Annulla» in the fill card (`showFill` in `widget.ts`).
- Limits in code: 50 rows, 48 KB, 10 messages, 10 page errors, 20 events / 10 minuti, `CHATBOT_PAGE_TIMEOUT_MS` 10.000 (`widget.ts`, `page-actions.ts`, `server.ts`). Record any mismatch with pattern 39 in [CONFLICT].
- Opening advice: the six rules and the three button labels in `lib/ChatbotConsigli.php` / `widget.ts`; migration tenant 0038 (preferences) — present in `migrations/tenant/`?
- `CHATBOT_FOTO_PAGINA` default and any evidence it is on in production (Jira, deploy files without secrets). If none: [UNVERIFIED].

---
### § 4 — `## Le proposte: niente cambia prima di «Autorizza»`
**Tag:** [TUTTI] (one DEV box; `### La regola per l'AI delle foto` with the italic line *Per chi può modificare le Impostazioni.*)
**Core question:** When Gea prepares a change, what does the card show, what happens between the proposta and the click, and what protects the data?
**Word target:** 1.150 (range 1.000–1.200)
**Paragraph functions:** Aggancio (the glossary rule: a proposta is not a change) → Procedura (read and decide the card) → Spiegazione (what happens at the click) → Dimostrazione (which proposte exist; mappatura example) → contro-obiezione → Limite → Sintesi.

**Content plan**
- The rule in one line, from the glossary: a proposta is a change Gea prepares and shows before doing it; it becomes real only when the user presses «Autorizza».
- `### Leggere e decidere una proposta` — numbered procedure: 1. Gea explains in words what would change, on which record, with the value before and after; 2. under the answer a card shows the record and the before/after of **only** the fields that change; 3. check that the record is the one you mean (intervento, operatore, data); 4. press «Autorizza» within 10 minuti, or «Annulla»; 5. read the result on the card («Eseguo…», then «Operazione eseguita.»; or the reason of the refusal; «Proposta annullata.» after «Annulla»). Gea never says the change is done before the click.
- What happens at the click (bulleted, in office words): the click acts with **the user's session and permessi**, not Gea's; the proposta belongs to who asked for it; it is checked again for deadline and for not being already used (two clicks do not execute twice); the record is **read again** and compared with the preview: if even one field changed, or the record is no longer visible to the user, nothing is written and a new proposta is needed; only then the same function the page uses does the change; before and after are recorded.
- Which proposte exist on `php8` (table *Proposta | Che cosa cambia | Quando Gea non la propone*), only rows the dossier confirms: affidare l'intervento of an utenza that has none (lista aperta, utenza in one lista only, operatore attivo; date today if not given); riaffidare an intervento to another operatore (only Assegnato or Annullato, with a date — same rule as «Modifica intervento», pointer ch.6); cambiare la data of one intervento (keeps time and operatore); correggere una mappatura (next subsection); proporre una regola per l'AI delle foto (subsection). State the GOP-536 rule on direct orders exactly as the Researcher resolves it ([CONFLICT] 2).
- Excluded by design (bulleted): cancellazioni definitive; utenti e permessi; configurazione della commessa; importazioni; operazioni in blocco. Proposte touch **one record at a time** (the mappatura correction is the declared exception: one model).
- `### Un esempio completo: la mappatura` (≤ 200 words, then «vedi il capitolo 4»): the card lists field by field «Matricola: colonna A → colonna B», the fields that will no longer be imported, «Riconoscimento automatico del file: no → sì»; after «Autorizza» Gea redoes the check on the file and says if it is now conforme; «Ripristina» puts the model back (or removes the copy) only if nobody changed it since, and only once; a system model is never touched: a copy «NOME (aggiornato)» is created; permesso «Importare interventi». Where the history of corrections is not active, Gea does not propose (a change that cannot be undone is not made).
- `### La regola per l'AI delle foto` (≤ 120 words, then «vedi il capitolo 6»): only from Impostazioni › Analisi AI delle foto; if the description is vague Gea asks for one concrete example; she writes the rule and tests it on the banco di riferimento without changing anything (result: migliora / peggiora / non misurata); if the user wants it, applying it asks «Autorizza» and saves a new version, kept in history; if the test found a worse result the page asks its own confirmation.
- Recording: every proposta and its life (proposta → autorizzata → eseguita / fallita, or rifiutata) is kept in a register for 12 mesi, and the activity of the commessa shows the change as made by Gea on the user's authorisation (pointer ch.12 for where the staff reads it).
- **Contro-obiezione 3:** «E se premo "Autorizza" per sbaglio?» → the change is exactly the one the page would make with the same permessi; for a mappatura there is «Ripristina»; for an operatore or a date the same change can be made again from the page (ch.6). «Annulla» on the card refuses a proposta; it is not the undo of a change already executed (GOP-528).

**Limite (mandatory):** Gea cannot bring back deleted interventi: deletion is physical, nothing remains in the gestionale to restore; recovery is a question for the staff tecnico, with no promise (real case for the DEV box or one sentence: on one commessa, in October 2026, a few thousand interventi of one carico could be recovered only from a database backup — no committente name, exact number only if the dossier confirms it). The «doppio controllo» (a second user authorises) exists but is switched off: do not describe it as active. If the register of proposte is missing on an installation, Gea answers that the function is not available and nothing changes (state it only if the Researcher confirms the migration status).

**DEV box (≤ 5 lines):** `ChatbotStrumentoOperazione` (preview, fingerprint of the record, `applica()` calls the backoffice function); execution only from `json.php?action=chatbot_operazione_esegui` with the user session and the header sent only by the button (`ChatbotOperazioni::esegui`); register `chatbot_azioni` (`migrations/main/0010_chatbot_azioni.sql`, purge after 12 mesi in `cron_worker.php`); new operation = subclass + name in `ChatbotRegistro::CLASSI`. Pattern 38.

**Key facts the Researcher must find**
- Exact card labels and result texts in `showOperation` / `showRestore` (`chatbot-service/src/widget.ts`): «Autorizza», «Annulla», «Eseguo…», «Operazione eseguita.», «Proposta annullata.», «Ripristina», «Ripristino…», «Ripristinato.»; how the deadline and the refusal reasons are shown to the user (Italian texts for `record_cambiato`, `proposta_scaduta`, `proposta_gia_usata`, `permesso_mancante`, `stato_non_riaffidabile`, `intervento_esistente`, `utenza_in_piu_liste`, `lista_chiusa`, `operatore_non_valido`).
- Confirm the 10 minuti deadline in `lib/ChatbotStrumentoOperazione.php` (constant) and the 12 mesi purge in `lib/ChatbotAzioniStore.php`.
- Status of `migrations/main/0010_chatbot_azioni.sql` and `migrations/tenant/0044_mappature_import_storico.sql` (applied? any later note in `migrations/main/README.md`, Jira GOP-525/GOP-816).
- `doppioControllo()` default (expected off) — dossier only.
- The deletion case (pattern 38 § «Ripristino di un intervento eliminato»): date, order of magnitude, that it was recovered only from a backup; **no committente name in the chapter**.
- `proponi_regola_ai` / `applica_regola_ai` labels and flow in `js/code/impostazioni_analisi_ai.js` (lines ~590–610) and GOP-721.

---

### § 5 — `## Il ticket dalla chat: lo prepara Gea, lo apre l'utente`
**Tag:** [TUTTI]
**Core question:** When is a ticket opened from the chat, what does the card contain, what is attached automatically and who sees it, and how does a request for a new function differ?
**Word target:** 1.050 (range 950–1.200)
**Paragraph functions:** Aggancio (three reasons for a ticket) → Procedura (numbered) → Dimostrazione (attachments; failure messages table) → Spiegazione (new function: interview and states) → Limite → Sintesi.

**Content plan**
- Three types of ticket from the chat: the guide does not explain something that exists (update the documentation); the product does not do what is needed (new function); something does not work as it should (defect). Gea proposes a ticket when she cannot solve the problem or finds an error, or prepares it when the user asks («apri un ticket: …»). **Gea never opens it herself.**
- `### Aprire il ticket` — numbered procedure (from the wiki, verify labels): 1. Gea ends her answer, apologises in one sentence and asks if you want a ticket and of which type; 2. answer yes (or ask for it yourself); 3. the card «Ticket per lo staff tecnico» appears: read «Testo del ticket (puoi correggerlo)» (first person, up to 4.000 caratteri) and correct it; 4. answer «Ti impedisce di lavorare?» (Sì / No, required: Sì sends it to the staff as urgent with an immediate alert, No puts it in the normal queue); 5. choose «Chi lo vede» if the default does not fit («I colleghi di questo tenant, senza il tuo nome» — say once that «tenant» here is the commessa — or «Solo io (problema generale)»); 6. press «Apri il ticket» (or «Non aprire» to drop it); 7. Gea confirms with the number («Ho aperto il ticket n. …»).
- What is attached automatically, seen **only by the staff tecnico**, never by colleagues or the committente (bulleted): the conversation so far; the page and the screen as read (fields, filters, table; never access codes, hidden fields or images); the page errors, if any; the commessa and the utente (from the login, not editable).
- Table *Messaggio sotto i pulsanti | Che cosa fare*: «Non riesco a raggiungere GOPlanner: la connessione sembra assente o cambiata» (already retried twice; check the connection, press again in a minute, else menu Ticket); «La sessione è scaduta» (log in again, ask Gea to propose it again); «GOPlanner ha risposto con un errore (HTTP …)» / «una risposta che non riesco a leggere» (retry in a minute or menu Ticket); «Il ticket non è completo» (text or urgency missing); «Hai aperto troppi ticket oggi» (limit 50 in 24 ore). Pressing «Apri il ticket» twice does not create two tickets; the text stays in the card after a failure.
- `### Chiedere una funzione nuova` — Gea first checks the guide and whether something similar exists; if it exists for other commesse she describes it **without naming any commessa or company**; if the same company already has an equal open request she proposes to join it («Si aggiunge alla richiesta n. …»). Then at most 3–4 questions, one at a time, each with Gea's suggested answer (A, B, C or own words): who has the problem and how often, how it is worked around today, what should be obtained. The card adds the summary of the request. States in the menu Ticket: Ricevuta, In valutazione, Pianificata, Non prevista (with the reason), Risposta (with the explanation), Disponibile. Gea can tell the state of the user's own function requests; she never promises times, costs, or that it will be done, not even when «Pianificata».
- Sintesi: Gea writes, the user decides and sends; the staff receives the context without asking for it again.

**Limite (mandatory):** a ticket needs a personal access (otherwise Gea does not propose it and says to report to the office or the staff); no own files (foto, spreadsheets) can be attached from the chat — use the menu Ticket where available (pointer ch.12); Gea knows nothing about the progress of tickets other than function requests; do not write personal data of third parties in the text.

**Key facts the Researcher must find**
- Card labels in `chatbot-service/src/widget.ts` (confirmed by the Architect: «Testo del ticket (puoi correggerlo)», «Ti impedisce di lavorare?», «Chi lo vede», «Apri il ticket», «Apro il ticket…», «Non aprire», «Ticket aperto.», «Ticket non aperto.», «Scrivi il testo del ticket.», «Rispondi a «Ti impedisce di lavorare?» prima di aprire il ticket.», «Si aggiunge alla richiesta n. »); find the card title and the two «Chi lo vede» options verbatim.
- Limits in code: 4.000 caratteri, 50 in 24 ore (`lib/JSONController.php` `chatbot_ticket_crea`, `lib/MobileV3/Feedback/TicketService.php`); idempotency of a repeated click; the automatic alert to the staff on failures (without the ticket text).
- Function-request states and labels (`lib/MobileV3/Feedback/TicketFunzioni.php`, GOP-874); the «gia_nel_prodotto» rule of never naming commesse.
- What exactly «urgente» triggers (immediate alert channel — describe in words, no channel names or addresses).

---

### § 6 — `## Che cosa Gea non fa, e quando chiedere allo staff tecnico`
**Tag:** [TUTTI] (one DEV box)
**Core question:** What are Gea's limits, what happens to the conversations, which messages mean that Gea cannot help now, and when does the user go to the staff tecnico?
**Word target:** 900 (range 800–1.000)
**Paragraph functions:** Aggancio (a limit is a rule, not a defect) → Dimostrazione (table «Gea non…») → Spiegazione (conversations: memory and records) → Dimostrazione (messages) → box → Sintesi (closing rule).

**Content plan**
- Table *Gea non… | Perché | Che cosa fare invece* (≥ 8 rows, each sourced): changes data without «Autorizza» (§ 4); deletes definitively, touches utenti and permessi, configurazione della commessa, importazioni, operazioni in blocco (excluded by design); brings back deleted interventi (nothing to restore in the gestionale); sees other commesse (answers for the open one only, ch.2); names colleagues, except to an amministratore who asks who did something; explains how she works — model, instructions, tools, databases — («Non posso dirti come funziono. Posso aiutarti con GOPlanner.»); proposes SQL or asks the user to run queries; promises response or release times; writes first (except the opening advice of § 3); looks at a foto nobody asked about; is in the app of the operatori.
- `### Le conversazioni` — what the user should know, in plain words: the conversations are recorded and **only the staff tecnico** reads them, to check and improve the answers; never colleagues, never the committente. Where conversation memory is active, Gea can remember your earlier conversations — only yours, never a colleague's, for up to 12 mesi — and answers «ti ricordi…» only with what she finds (state as active only if the Researcher confirms it; otherwise «dove è attiva»). The staff tecnico reviews real dialogues and corrects runbooks and guides (pattern 36), so a wrong answer reported today becomes a written rule — the same story as the 22 novembre case, without retelling it.
- Messages that mean Gea cannot help now (bulleted, verbatim): «Limite giornaliero raggiunto, riprova domani o contatta lo staff.» (a daily limit of the commessa — confirm unit); «Il supporto non è disponibile in questo momento. Riprova tra qualche istante.»; «La sessione è scaduta. Ricarica la pagina per continuare a usare il supporto.»; «Non sono riuscita a completare la richiesta. Riprova tra qualche istante.»; «Non sono riuscita a completare la diagnosi nel tempo previsto. Contatta lo staff.». The gestionale works without Gea: every page and procedure in this guide stays available.
- Box `> **Quando chiedere allo staff tecnico:**` (≥ 4 triggers, each sourced): the «Assistente virtuale» button is missing for an utente who should have it; the daily limit is reached and the problem blocks work (open the ticket from the menu Ticket, ch.12); Gea says a source is unavailable or cannot complete the diagnosis; a proposta is refused again and again for the same record; deleted data to recover; a server error with the 8-character code Gea gave you.
- Closing rule (Sintesi, see TARGET).

**Limite (mandatory):** the limits in the table are those of `php8` on 25 novembre 2026; some capabilities depend on the commessa or on switches (foto reading, conversation memory, opening advice, history of mappatura corrections): the chapter says «dove è attiva» for each one the dossier does not confirm as live everywhere.

**DEV box (≤ 5 lines):** the Gea service is in `chatbot-service/` (same repository, own build and release); it has no database credentials: every data read passes through `JSONController` actions `chatbot_*` with the user's identity; audit of every turn kept for the staff only; daily cost cap per commessa in `chatbot-service/src/cost-cap.ts`; conversation memory in `conversation-memory.ts` (GOP-811). Architecture, knowledge base and deployment → «vedi il capitolo 15» and «vedi il capitolo 16».

**Key facts the Researcher must find**
- The «Non posso dirti come funziono…» sentence and the other refusals in the system prompt (`chatbot-service/src/server.ts`); `technical-leak-guard.ts` (what it blocks — dossier only).
- Unit of the daily limit (per commessa? per user?) in `cost-cap.ts` and the message in `server.ts` line ~475.
- The five unavailability messages verbatim (`server.ts`, `widget.ts`).
- Conversation memory (GOP-811): `CHATBOT_MEMORIA_CONVERSAZIONI` default, 365 giorni retention, user-only visibility, whether the daily indexing process runs in production (Jira, `scripts/memoria-conversazioni.mjs`). If not provable: [UNVERIFIED] and the Writer conditions it.
- Audit storage and retention (pattern 27: staff-only) — the chapter says «solo lo staff tecnico»; no log group names, no ARNs.
- Pattern 36 (review of real dialogues): the loop dialog → runbook correction, in words.

---

### Closing (no separate `##`: last paragraph of § 6, after the box, before `## Fonti`)
A rule the reader can apply at the desk, not an echo of chapter 1 and not an announcement of chapter 11. See TARGET.

### `## Fonti`
Built by the Writer from the dossier entries actually used, in the STYLE_BIBLE format (`codice: …`, `wiki: …`, `docs: …`, `Portolano: …`, `Jira: GOP-NNN — titolo breve`). No internal URLs, no hostnames, no environment values.

---
## REVIEWER READINESS NOTES

### Tension points (where the chapter must create real stakes)
1. **The click on «Autorizza» (§ 4).** Stakes: the user is the last control. A card that looks right can point to the wrong intervento or operatore, and the change is made with the user's name and permessi. Build-up: the procedure says to check the record first; then what the click re-checks (deadline, record changed, permesso); then what cannot be undone by Gea (a deleted intervento). The tension resolves into a habit: read prima e dopo, then click — not into fear of the button.
2. **«Nessun problema trovato» (§ 2).** Stakes: the user stops looking because Gea found nothing, while Gea read one register over a narrow window. Resolution: Gea must say which register, which period, which word; one narrow search never proves absence; widen the period or ask the staff.
3. **What Gea sees of the screen and of the conversation (§ 3, § 6).** Stakes: an office user may fear that Gea reads everything, or may paste personal data of third parties into a ticket. Resolution: the exact list of what is read and when, what is never read, who reads the conversations (staff only), and the one instruction to the user (no third-party personal data in the ticket text).
4. **«Ti impedisce di lavorare?» (§ 5).** Stakes: «Sì» alerts the staff at once; answering it honestly is what keeps real emergencies fast. One sentence, factual, no moralising.
5. **The hook case of 22 novembre 2026 (§ 1).** Stakes: an assistant that says «non vedo l'errore» while the user sees it on screen loses trust. Resolution: the cause was a missing written rule, the fix was a rule — the chapter's thesis in miniature.

### Key chains to make explicit (cause → consequence → reader action)
- Question with the words of the symptom, asked from the page where it shows → Gea opens the matching runbook and runs its checks in order → the answer carries numbers, the check behind each conclusion and its certainty → the reader acts on the page named, or authorises a proposta, or accepts a ticket.
- Question about a message on screen → Gea reads the screen (messages, page errors) and the server errors of the user's own requests (last 30 minuti, or the 8-character code) → plain cause and remedy, plus the code → the code goes into the ticket (pointer ch.12).
- Proposta shown → 10 minuti to decide → «Autorizza» → the record is read again → if anything changed, refused and nothing written → ask Gea for a new proposta.
- Mappatura correction authorised → Gea redoes the file check → if wrong, «Ripristina» (once, and only if nobody changed the model since) → for the full diagnosis, ch.4.
- Gea cannot solve or finds an error → proposes a ticket → the user corrects the text, answers the urgency, presses «Apri il ticket» → conversation, page, screen and errors reach the staff → the staff does not need to ask again.
- Button missing → commessa with Gea off, or access in sola lettura, or Gea not on in that environment → ask the amministratore (profilo, ch.11), then the staff tecnico.
- Opening advice («consiglio all'apertura») → «Sì, spiegami» → Gea explains the error of the last 24 ore and the remedy → the user corrects the file or repeats the esportazione (pointers ch.4, ch.7).

### Risk proportionality guards (each risk paired with its balancing context)
- **Gea changing data** → in the same paragraph: only after the user's click, with the user's own permessi, after re-reading the record, one record at a time, recorded for 12 mesi with prima e dopo; deletions, utenti, permessi, configurazione, importazioni and lavori in blocco excluded by design.
- **Gea reading the screen and the foto** → by default only light hints; the screen only when the question is about it; never passwords, hidden or excluded fields; a foto only on explicit request and only where switched on.
- **Conversations recorded / remembered** → staff tecnico only, never colleagues or the committente; personal memory visible only to the same utente; 12 mesi; used to improve guides. Do not present it as surveillance and do not hide it.
- **Wrong or incomplete answers** → Gea must name the check, the register and the period, and flag hypotheses; the staff reviews real dialogues and fixes the runbooks; the hook case shows a fix.
- **Deleted interventi not recoverable by Gea** → «Elimina» already refuses interventi with an esito (ch.6); a call-center appointment is annulled, not deleted (ch.6); recovery from backup is the staff's decision — no promise.
- **Daily limit / service unavailable** → the gestionale works without Gea; every procedure in this guide stays available from the pages; the menu Ticket is the alternative path for a ticket.
- **Colleagues named by Gea** → only to an amministratore who explicitly asks who did something; everyone else reads «un collega».
- **Function requests** → Gea collects and files, never promises times, costs or delivery, not even for «Pianificata».

### Counter-objections planned (STYLE_BIBLE requires ≥ 2; four are planned)
1. § 2 — «Gea mi ha detto che non ha trovato problemi: allora non c'è niente?»
2. § 3 — «Gea legge tutto quello che ho sullo schermo?»
3. § 4 — «E se premo "Autorizza" per sbaglio?»
4. § 6 (optional, inside the table or the conversations subsection) — «Posso chiedere a Gea che cosa ha fatto un collega?» → yes for the facts («un collega»), the name only for an amministratore who asks.

### Litmus test for this chapter
A new back-office colleague, with only this chapter, can: find Gea and say why a colleague does not see her; ask the right question about an importazione that lost rows and judge whether the answer is backed by a check; accept or refuse a proposta knowing what the click does; open an urgent ticket from the chat without retyping the context; and know the three things Gea will never do for them (decide in their place, recover deleted data, promise a date).

### Format checks the Reviewer should run on this chapter
- One H1 `# 10. Gea, l'assistente di GOPlanner`; «In questo capitolo» in italics; six `##` sections; `## Fonti` last.
- Tables: runbooks (§ 2), page action levels (§ 3), proposte (§ 4), ticket failure messages (§ 5), «Gea non…» (§ 6). Procedures: open the panel (§ 1), decide a proposta (§ 4), open a ticket (§ 5).
- Zero occurrences of «chatbot», «bot», «modello» (as the AI), «tenant» outside quoted labels/messages and DEV boxes; zero provider or model names anywhere.

---
## RESEARCHER BRIEF

**Web search terms:** none. INSTRUCTION.md § Researcher, SOURCE OVERRIDE: the web is not a source for this book. Use only the sources below, in this priority order. The GOPlanner repository is READ ONLY (no checkout, pull, stash, composer, npm, no `npm run build`, no test runs).

### Documents to prioritize (in order)
1. Code on `php8` (authority when sources disagree): `chatbot-service/src/` and the PHP side `lib/Chatbot*.php`, `lib/JSONController.php` (`chatbot_*` actions).
2. Decision docs: `docs/02-patterns/38-…`, `39-…`, `37-…`, `27-…`, `36-…`, `28-…`, `42-…` (MCP only for the boundary sentence «on the MCP channel changes use another mechanism»), `48-ticketing-base.md`, `49-ticket-legati-all-identita.md`; cookbooks `docs/03-cookbooks/23-chatbot-service-guida-al-codice.md`, `24-ticket-azioni-json.md`.
3. Wiki for the user-facing behaviour (dated 2026-11-16 or later preferred).
4. Portolano, then Jira.

### Wiki paths
- `wiki/index.md` (list of `runbook-*`, line 5 explains the runbook format)
- `wiki/assistenza-clienti/aprire-un-ticket-da-gea.md`
- `wiki/assistenza-clienti/runbook-richiesta-funzione-nuova.md`
- `wiki/assistenza-clienti/runbook-correggere-mappatura.md` (only what § 4 needs; ch.4 owns the rest)
- `wiki/assistenza-clienti/runbook-regola-istruzioni-ai.md`
- `wiki/assistenza-clienti/runbook-attivita-utente.md` (opening advice, colleagues rule, windows)
- `wiki/assistenza-clienti/runbook-errore-a-schermo.md` (only for the 30 minuti / 8-character code sentence; ch.12 owns it)
- `wiki/assistenza-clienti/runbook-operatori-attivi.md` (the surgical example of § 2)
- `wiki/assistenza-clienti/runbook-problemi-app-operatori.md` (one table row)
- `wiki/assistenza-clienti/annunci-novita-campanella.md` (first-access presentation; contains the wrong «in basso a destra»)
- `wiki/assistenza-clienti/sezione-ticket.md` (only for the pointer to the menu Ticket)
- `wiki/assistenza-clienti/configurazione-tenant.md` (what Gea says about the configurazione of the commessa)
- `wiki/assistenza-clienti/stato-import-export.md` (what Gea reads about importazioni/esportazioni)

### Docs paths
- `docs/02-patterns/38-chatbot-operazioni-anteprima-esegui.md` — whole file (proposte, click, register, exclusions, deletion case, mappatura)
- `docs/02-patterns/39-chatbot-contesto-pagina-azioni-interfaccia.md` — whole file (hints, screen, foto, levels, bridge, events, GOP-536, pilot pages, the 22/11 case)
- `docs/02-patterns/37-chatbot-registro-strumenti-utente.md` — what the data-reading tools return; lotti rule
- `docs/02-patterns/27-chatbot-supporto-architettura.md` — only: who sees Gea, audit staff-only, cost cap, conversation memory (GOP-811), nightly generalisation (GOP-812) — for DEV boxes and § 6
- `docs/02-patterns/36-chatbot-review-dialoghi-reali.md` — the review loop of real dialogues
- `docs/02-patterns/28-chatbot-tuning-simulazione-e-corsie.md` — banco di prova of Gea, only if useful for § 6
- `docs/02-patterns/48-ticketing-base.md`, `49-ticket-legati-all-identita.md`, `docs/03-cookbooks/24-ticket-azioni-json.md`
- `docs/03-cookbooks/23-chatbot-service-guida-al-codice.md` — file map for the DEV boxes

### Code paths and grep patterns (read-only: `git grep`, Read, Grep)
- `lib/ChatbotAuth.php` — `TIPO_MASSIMO`, `visibile`, `interruttoreAmbiente`, `abilitatoInProduzione`, `nomeDiBattesimo`
- `config.inc.php` (~line 439), `lib/GOPlanner.php` (~line 149), `config-docker.inc.php` (~lines 185–194) — default on / production switch (ch.2 already used this: one sentence only)
- `Smarty_templates/it/_header.html` — `chatbot_visibile`, `#chatbot-toggle`, label «Assistente virtuale», `#side-footer`
- `chatbot-service/src/widget.ts` — `goplanner-chatbot-panel` (position), panel `innerHTML` (title, «Ingrandisci», «Chiudi», «Scrivi un messaggio», «Invia», «Interrompi»), greeting (`goplanner-chatbot-hello`), suggestions (GOP-813, `NO_SUGGESTIONS`), «Spiegamelo meglio», `showOperation`, `showRestore`, `showFill`, `showPageOperation`, ticket card, `readScreen`, `readPageMessages`
- `chatbot-service/src/server.ts` — `systemPrompt` (what Gea must and must not do), progress and timeout messages (~lines 28, 330–335), daily limit message (~line 475), `CHATBOT_MAX_TOOL_ITERATIONS`, `CHATBOT_TURN_DEADLINE_MS`, `CHATBOT_PAGE_TIMEOUT_MS`, `CHATBOT_FOTO_PAGINA`
- `chatbot-service/src/tools.ts` — tool descriptions (`proponi_ticket`, `cerca_funzioni_simili`, `stato_richieste_funzione`, `ricorda_conversazioni`, progress labels such as «Preparo la riassegnazione dell'intervento»)
- `chatbot-service/src/page-actions.ts`, `page-bridge.ts`, `page-context.ts` — levels, limits, light hints
- `chatbot-service/src/cost-cap.ts` — unit of the daily limit
- `chatbot-service/src/conversation-memory.ts` — `CHATBOT_MEMORIA_CONVERSAZIONI`, retention, per-user filter
- `chatbot-service/src/web-activity.ts` — «un collega», `solo_mie`, windows
- `chatbot-service/src/technical-leak-guard.ts` — what Gea is prevented from revealing (dossier only)
- `lib/ChatbotRegistro.php` — `CLASSI` (the real list of tools and operations on `php8`)
- `lib/ChatbotStrumentoOperazione.php`, `lib/ChatbotOperazioni.php`, `lib/ChatbotAzioniStore.php` — deadline, click checks, register, 12 mesi
- `lib/ChatbotStrumentoAffidaIntervento.php`, `lib/ChatbotStrumentoRiaffidaIntervento.php`, `lib/ChatbotStrumentoCambiaDataIntervento.php`, `lib/ChatbotBackoffice.php`
- `lib/ChatbotStrumentoProponiMappatura.php`, `lib/MappaturaImportStorico.php`
- `lib/ChatbotConsigli.php` — six rules of the opening advice and their texts
- `lib/JSONController.php` — `chatbot_operazione_esegui`, `chatbot_operazione_annulla`, `chatbot_mappatura_ripristina`, `chatbot_azione_pagina`, `chatbot_ticket_crea`, `chatbot_consiglio`, `chatbot_consigli_preferenza`
- `lib/MobileV3/Feedback/TicketService.php`, `lib/MobileV3/Feedback/TicketFunzioni.php` — ticket limits and function-request states
- `js/code/impostazioni_analisi_ai.js` (~lines 590–610) — the only page found registering Gea actions
- Grep: `git grep -n "registra(" -- js/ custom/ Smarty_templates/`; `git grep -n "data-chatbot" -- js/ Smarty_templates/ custom/`; `git grep -n "chatbot_enabled'\] *= *false" -- 'custom/*/config.inc.php'`; `git grep -n -i "chatbot" -- lib/Rbac* lib/*Permess* lib/*Profil*`; `ls migrations/main/ migrations/tenant/ | grep -E "0010|0038|0044"`

### Portolano queries (`mcp__rag_qdrant_server__query_rag_hybrid` with `user_roles: ""` — EMPTY string, per INSTRUCTION.md; fall back to `query_rag`)
- «Gea assistente virtuale pannello chi la vede sola lettura»
- «Gea proposta Autorizza Annulla scadenza dieci minuti record cambiato»
- «Gea runbook istruzioni d'indagine Sintomi Controlli Cosa dire»
- «Gea contesto pagina leggi schermata azioni registrate»
- «Gea consiglio all'apertura Sì spiegami Non mostrarmi più questi consigli»
- «aprire un ticket dalla chat di Gea Ti impedisce di lavorare Chi lo vede»
- «richiesta funzione nuova intervista stati Ricevuta In valutazione Pianificata»
- «Gea memoria conversazioni ricorda conversazioni dodici mesi»
- «Gea limite giornaliero raggiunto»
- «Gea non può ripristinare interventi eliminati backup»
- «Gea corregge la mappatura Ripristina modello di sistema copia aggiornato»
- «Gea un collega nomi dei colleghi amministratore»

### JQL fragments (cloudId `21873985-2e5d-4a8a-bb45-e6d453128985`, project GOP, READ ONLY)
- `project = GOP AND key in (GOP-124, GOP-143, GOP-508, GOP-509, GOP-524, GOP-525, GOP-526, GOP-527, GOP-528, GOP-534, GOP-535, GOP-536, GOP-537, GOP-538, GOP-539)` — mechanism and pilot pages; **status of GOP-536 and GOP-537..539 is load-bearing**
- `project = GOP AND key in (GOP-721, GOP-811, GOP-812, GOP-813, GOP-816, GOP-819, GOP-823, GOP-864, GOP-874)` — AI rule, memory, suggestions, mappatura, first name, errors, function requests
- `project = GOP AND text ~ "Gea" AND statusCategory = Done ORDER BY updated DESC` (max 15) — what is actually delivered
- `project = GOP AND text ~ "Gea" AND statusCategory != Done ORDER BY updated DESC` (max 10) — what is planned (must NOT be described as live)
- `project = GOP AND (text ~ "chatbot" OR text ~ "Gea") AND text ~ "errore" ORDER BY updated DESC` (max 10) — one real story problem → cause → fix (the 22/11/2026 Importazione case is the preferred one; confirm its ticket key)
- Purpose: one real ticket story for § 1 (hook) and, if found, one for § 4 or § 6, told without personal data and without contractual details.

### Specific facts, numbers and labels to hunt
- Numbers: `TIPO_MASSIMO = 2`; deadline 10 minuti; 50 righe, 48 KB, 10 messaggi, 10 errori della pagina, 20 eventi / 10 minuti; bridge 10 secondi; 12 passi / 90 secondi per answer; registers up to 7 giorni; attività 30 giorni (own) / 7 giorni (colleagues, 30 for amministratori); own errors 30 minuti or an 8-character code; ticket 4.000 caratteri and 50 in 24 ore; function interview 3–4 domande; register of proposte 12 mesi; memory 365 giorni; one opening advice per session, 24 ore window.
- Labels: «Assistente virtuale», «Gea · assistente virtuale», «Ingrandisci», «Riduci», «Chiudi», «Scrivi un messaggio», «Invia», «Interrompi», «Spiegamelo meglio», «Autorizza», «Annulla», «Eseguo…», «Operazione eseguita.», «Proposta annullata.», «Ripristina», «Ripristinato.», «Ho compilato», «Ho rimesso i valori di prima.», «Sì, spiegami», «Non mostrarmi più questi consigli», «Riattivali», «Ticket per lo staff tecnico», «Testo del ticket (puoi correggerlo)», «Ti impedisce di lavorare?», «Chi lo vede», «I colleghi di questo tenant, senza il tuo nome», «Solo io (problema generale)», «Apri il ticket», «Non aprire», «Ho aperto il ticket n. …», «Ti presentiamo Gea», «Ho capito».
- Messages: «Limite giornaliero raggiunto, riprova domani o contatta lo staff.»; «Il supporto non è disponibile in questo momento. Riprova tra qualche istante.»; «La sessione è scaduta. Ricarica la pagina per continuare a usare il supporto.»; «Non sono riuscita a completare la richiesta. Riprova tra qualche istante.»; «Non sono riuscita a completare la diagnosi nel tempo previsto. Contatta lo staff.»; «Non posso dirti come funziono. Posso aiutarti con GOPlanner.»; the five ticket failure messages of the wiki.
- Function-request states: Ricevuta, In valutazione, Pianificata, Non prevista, Risposta, Disponibile.

### Mandatory [CONFLICT] items to record
1. **Position of Gea:** CONTEXT.md and code (launcher in the side footer of the left menu; panel `left: 16px; bottom: 16px`) vs `annunci-novita-campanella.md` («in basso a destra») vs pattern 27 (button in the header next to the account buttons). Code wins: in basso a sinistra. Note the wiki fix needed.
2. **Direct orders and runbook-only actions:** ch.6 (published text: «Gea può preparare un cambio di operatore o di data, se le si dà il numero dell'intervento») vs pattern 39 / GOP-536 («a un ordine risponde spiegando come farlo, senza eseguire»; actions only as runbook steps) vs code (operations still in `ChatbotRegistro::CLASSI`; no explicit sentence in `systemPrompt`; no `runbook-*` page found using them). Resolve with code + GOP-536 status; state the resolution in one line so the Reviewer can flag ch.6.
3. **Pages with Gea actions:** pattern 39 (pilot pages Clienti/Interventi, Utenze, Verifica interventi verified on dev) vs `php8` (only `js/code/impostazioni_analisi_ai.js` calls `registra`). Code wins; list only what is on `php8`.
4. **Register of proposte and mappatura history:** pattern 38 says `migrations/main/0010_chatbot_azioni.sql` is in the repository «ma non applicata»; ch.4 describes the mappatura correction as working where the history (tenant migration 0044) exists. Record the current evidence; the Writer conditions accordingly.
5. **Conversation memory (GOP-811):** on by default in code (`CHATBOT_MEMORIA_CONVERSAZIONI !== '0'`) but «senza il processo giornaliero la memoria non si riempie». Is the process running? If unproven → «dove è attiva».
6. **Foto reading:** `CHATBOT_FOTO_PAGINA === 'true'` required (default off). If unproven → «dove è attiva» or omit.
7. **Who sees Gea:** `users.tipo` 0–2 (`ChatbotAuth`) vs the RBAC profiles of ch.11 (`docs/plan_identita_centralizzata_rbac.md`, pattern 25). Is there any RBAC permission for Gea? Record.
8. **Unit of the daily limit:** pattern 27 says per tenant per day; confirm in `cost-cap.ts` (per commessa vs per user).

### Security filter reminder
No provider, model or vendor names; no secret header names or values, environment values, IAM ARNs, log group names, hostnames, Redis keys, URLs of the service; no personal names (including whoever approves runbooks: «lo staff tecnico»); no logins, user ids, SIM ids, real error codes tied to a person (an invented 8-character code may be used only if declared as invented); no committente name in the deletion story; no contractual or tender details.

---

## TARGET

- **Word count:** 5.600–5.900 words in total (PRD § 4: 4.000–6.000). Breakdown: «In questo capitolo» ~80; § 1 850; § 2 1.050; § 3 1.000; § 4 1.150; § 5 1.050; § 6 900; closing + `## Fonti` ~150. Hard ceiling 6.000.
- **Opening hook strategy:** open § 1 with the real case of 22 novembre 2026 — in the page Importazione Gea answered that she did not see an error the user had on screen, because no written rule told her to read the screen for that question, and the fix was a rule — to show in three sentences that Gea does exactly what her written instructions and her tools allow, no more and no less.
- **Closing beat promise:** end on a rule the reader can apply at the desk — Gea reads, investigates and prepares, but the last click is always the user's: no data changes and no ticket leaves without a button the user pressed, and what no button can do (recover deleted data, look at another commessa, promise a date) goes to the staff tecnico.
