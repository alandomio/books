# Chapter 12 — Struttura (Architect spec)

**Chapter title (H1 for the Writer):** `# 12. Strumenti di amministrazione e diagnostica`
**PRD row:** «Le pagine Admin (Cruscotto Analisi AI, Manutenzione, Errori app e Log, Giro e Stato commesse), la sezione Ticket, i runbook «dove si è fermato il dato» e «perché ho visto un errore», annunci e campanella» — audience **ADMIN** (amministratori and staff tecnico). The back office reads § 1–§ 4; § 5–§ 6 are for the staff tecnico, and say so in their italic line.
**Core question of the chapter:** when something does not work, which tools does each person have, what evidence does each tool produce, and how does a problem pass from whoever sees it to the staff tecnico without anyone having to ask again?
**Chapter thesis (the rule the whole chapter proves):** diagnosis in GOPlanner is a **relay with three legs**: (1) whoever sees the problem collects the evidence with their own pages and Gea (the error code, the operatore and the period, the number of the importazione or esportazione); (2) the **ticket** carries that evidence to the staff tecnico; (3) the staff tecnico reads it in the Admin pages and in the server's registers, and uses the tools that write only after reading the numbers they show. Every tool in the chapter belongs to exactly one leg, and the chapter says which. Two runbooks («perché ho visto un errore», «dove si è fermato il dato») are the shared method for the first and third legs.

### Continuity and glossary check (done by the Architect, 25 novembre 2026)
- `chapter_index.md`: not present. `NARRATIVE_GLOSSARY.md`: not present. Canonical vocabulary = `/home/alan/firstmate/projects/GOPlanner/CONTEXT.md`. Final text exists for chapters 1–6; chapters 7–11 exist only as `chapter_N_struttura.md`. **Before writing, the Writer re-checks whether `chapter_7.md` … `chapter_11.md` now exist** and aligns the pointers below with their final wording.
- **Promises made by earlier chapters that ch.12 must keep** (the Writer covers each; the Reviewer checks each):
  1. ch.1 (`chapter_1.md`, § «Dove guardare quando qualcosa non torna»): «Su quei segni si basa oggi la domanda «dove si è fermato il dato» (capitolo 12)» and the table row «Un errore a schermo → Il codice dell'errore mostrato a schermo → 12» → § 3 and § 2. **Do not retell ch.1's story** (the foto case, 51 ore, 22.173 errori su 95 dispositivi): one sentence that refers to it («il caso raccontato nel capitolo 1») is enough.
  2. ch.2 (`chapter_2.md`, staff box): «La pagina Stato commesse è descritta nel capitolo 12»; and «Un permesso mancante, un profilo sbagliato, una voce di menu negata a una persona e non a un'altra si diagnosticano nel capitolo 12» → § 5 (Stato commesse; `### Un permesso che non torna`). Ch.2 quoted the reason «Nessun invio dagli operatori da 3 giorni lavorativi»: the code's threshold is «more than 2 working days» (`StatoCommesseSalute::SOGLIA_GIORNI_LAVORATIVI = 2`) and the message prints the actual count. Consistent; state the rule, quote the message with an invented count declared as an example.
  3. ch.3 (`chapter_3.md`, box): «nessun intervento dell'utenza risulta eseguito, ma l'operatore dice di averlo chiuso … È il caso del capitolo 12, «dove si è fermato il dato»» → § 3.
  4. ch.4 (`chapter_4.md`): «Le pagine di diagnostica dello staff sono nel capitolo 12» → § 5.
  5. ch.5 (`chapter_5.md`, box «Attenzione»): «in Admin › Giro e Stato commesse «Giro» è il registro delle attività automatiche … GOP-656, capitolo 12» → § 5. **Flag:** in the code these are two separate voci in two groups (Diagnostica › «Giro»; Clienti › «Stato commesse»); ch.5 used the wiki's page title. Ch.12 names each voce where it sits; the Reviewer notes the ch.5 wording, no correction required unless the Reviewer judges it misleading.
  6. ch.6 (`chapter_6.md`): «Prima di verificare un intervento mancante si esclude quindi che il dato sia fermo sul telefono (vedi il capitolo 12)» → § 3 must say **how** to exclude it, in office steps. Ch.6 also: «I costi e il lancio massivo, in Admin › Cruscotto Analisi AI e Admin › Manutenzione, sono strumenti dello staff tecnico (vedi il capitolo 12)» and «Analisi AI non ancora disponibile su questa commessa» is a question for the staff → § 6.
  7. ch.7 (struttura): the office cannot read the worker's registers; «Admin › Errori app e Log is ch.12, for whoever has access» → § 5.
  8. ch.8 (struttura): segnalazioni written in the app land in the Ticket section (source «app»); Errori app is read-only and its detail is for the staff → § 4 and § 5.
  9. ch.9 (struttura): «Anomalia» in Magazzino is not an app crash (Errori app, ch.12) → § 5, one sentence.
  10. ch.10 (struttura): the menu Ticket (attachments the chat cannot add; daily limit of Gea), the 8-character code, announcements and campanella as staff/admin topics → § 2 and § 4. Ch.10 owns Gea: ch.12 says what Gea reads in at most three sentences per section, then «vedi il capitolo 10».
  11. ch.11 (struttura): the `rbac_deny` report as a tool, the event `rbac_ambito_divergenza`, the Admin pages, the visibility of tickets → § 5 and § 4. Ch.11 § 6 owns the amministratore's ordered check «perché non vede…»: ch.12 does **not** repeat it; it starts where that check stops (one sentence + «vedi il capitolo 11»).
- **Closings already used by earlier chapters (the ch.12 ending must not echo them):** ch.1 ends on the order «prima la parola del glossario, poi il passo del ciclo, poi la pagina … Solo dopo Gea, … e dopo Gea lo staff tecnico»; ch.11 (planned) ends on «find the first layer that hides it, give the smallest access, leave the rest to the staff». Ch.12 ends on the evidence that travels with the problem and on the numbers a writing tool shows before it writes (see TARGET).
- **Glossary traps specific to this chapter (Writer and Editor check all nine):**
  1. **«Giro» has two meanings.** In the glossary the giro is the operatore's daily route (ch.5). Admin › «Giro» is the register of the automatic activities the system runs at intervals (`lib/GiroRegistro.php`, GOP-656). In prose: «il registro del Giro» or «le attività automatiche del Giro»; never «giro» alone in § 5. One `> **Attenzione:**` line, not a re-explanation (ch.5 already warned).
  2. **«Cliente» appears only inside labels:** the Admin group «Clienti», the filter «Cliente» in the Giro page (it means the commessa). Quote them as labels, then say «commessa» in prose.
  3. **«Tenant» appears inside labels of the Ticket section** (the field «Tenant», the choice «I colleghi di questo tenant, senza il tuo nome»). Quote verbatim and say once, in parentheses, that there «tenant» means the commessa (same treatment as ch.10). Never «tenant» in UFFICIO prose; allowed in staff/DEV boxes.
  4. **«Log».** The glossary forbids «log» for attività. Admin › «Log» is a menu label: quote it as a label. In prose: «registro» (registro degli errori, registro delle azioni inviate dall'app). «Log» and CloudWatch names only inside `> **Per lo staff tecnico:**` or `> **Per gli sviluppatori:**` boxes.
  5. **Crash ≠ anomalia ≠ segnalazione ≠ ticket.** Errori app shows **blocchi dell'app** (crash); an anomalia of the app is something the app sends by itself (ch.8); a segnalazione is written by the operatore with «Segnala un problema» (ch.8); a ticket is the item of the Ticket section, where segnalazioni also land. Magazzino › Anomalie is a third thing (ch.9).
  6. **Errore vs avviso.** The error register distinguishes an **errore** from an **avviso** (runbook «perché ho visto un errore», step 3). Keep the two words apart.
  7. **Staff tecnico** is the glossary word. The wiki says «personale GOPlanner», the code «super-admin»: in prose always «staff tecnico». «super-admin globale» appears only inside the verbatim refusal message «Accesso negato: pagina riservata al super-admin globale» and in boxes; explain it once in words («un solo accesso tecnico dello staff»).
  8. **AI vocabulary:** only «AI». No vendor, provider or model name anywhere, not even in boxes (ch.10 rule; `StatoCommessePagina` docblock: «L'AI compare sempre e solo come «AI»»). «Modello locale» (UI text of the Cruscotto) may be quoted as the page's own sentence.
  9. **Utente vs operatore; attività.** The person in the gestionale is the utente; the person with the phone is the operatore. What a utente or operatore did is an **attività**; the actions the app sends, shown in Admin › «Log», are «azioni inviate dall'app».
- **Security (blocking, chapter-specific):** no `aws` command lines with region, account, ARN or IAM policy text (`docs/03-cookbooks/30-…` and `06-errori-app-crash-da-log-iam.md` contain some); no real error codes, `request_id` values or device fingerprints from tickets or logs — the example code is invented and declared as such; no names of operatori, utenti or committenti from ticket stories; no money figures (Stato commesse has a column «Costo AI · mese» and the per-carico preview shows a «costo stimato»: name the column and say what the figure is, never a value or a tariff); the voce «Report» exists for one commessa (`RiepilogoMese`, GOP-654): say «una commessa», never its name; no SIM numbers or phone models from crash details.

### Chapter boundaries (one-line pointers only, per PRD § 4 «Confini tra capitoli»)
| Topic touched here | Owned by | What ch.12 may say |
|---|---|---|
| The three causes of missing foto as a story; the cycle «dove guardare» | ch.1 | One sentence referring to it; no numbers from ch.1 |
| `make schema_check`, `scripts/migrate.php`, migrations | ch.2, ch.16 | Only as the reason behind the yellow «database indietro» in Stato commesse, one sentence + «vedi il capitolo 16» |
| Importazione registro, scarti and their motivi | ch.4 | Which number to put in a ticket; one sentence + pointer |
| Verifica, «Verificato» on a missing intervento, AI analysis of foto as office work | ch.6 | § 3 gives the exclusion steps; § 6 the bulk launch and the costs; no Verifica walkthrough |
| Ultime esportazioni, file scaduto, causa salvata | ch.7 | Which number to put in a ticket; one sentence + pointer |
| The phone's queue, «Riprova», «Ultimo invio», heartbeat, segnalazioni and anomalie of the app, comandi remoti (Admin › «GCM») | ch.8 | One sentence each + «vedi il capitolo 8» |
| Gea: panel, runbook catalogue, proposte, ticket card from the chat, daily limit | ch.10 | What Gea reads for the two runbooks (≤ 3 sentences each) and the ticket card in one sentence + «vedi il capitolo 10» |
| Permessi, profili, `rbac_enforce`, Impersona as a rule, the amministratore's checklist | ch.11 | Only the staff's diagnostic tools (the deny report, the ambito divergence event, Impersona used to look with the person's eyes); one sentence + «vedi il capitolo 11» for every rule |
| `pages/admin.php` routing, `index.php`, `json_admin.php`, «Console JSON» | ch.13, ch.15 | One row of the § 1 table + DEV box line |
| Tables `stato_commesse_giorno`, ticket tables, `annunci_letti` | ch.14 | DEV boxes only |
| CloudWatch, log groups, the mobile channel, Novità as per-commessa changelog, releases | ch.16 | Inside staff/DEV boxes, max 5 lines each, + «vedi il capitolo 16» |

---

## NUFs (Goal Scoring)

Ten NUFs, so the Editor can score one point each against the 8.5/10 gate. Format per INSTRUCTION.md § Architect.

```
utility(reader): Reader can say, for each diagnostic tool, where it is and who sees it: the Admin groups «Clienti», «Diagnostica», «Strumenti», «Sistema» only for the staff tecnico; «Stato commesse» only for one technical account of the staff («Accesso negato: pagina riservata al super-admin globale» to anyone else, even with the direct address); the group «Utenti» for whoever has the permesso, with the menu entry titled «Utenti» instead of «Admin»; «Ticket» and the campanella in the top bar for every person with a personal identity; Gea where it is active → score += 1

utility(reader): Reader can handle the error screen «Si è verificato un errore imprevisto. Il nostro team ne è stato avvisato.»: copy the 8-character code (digits and letters A–F), note page and time, ask Gea from the same page, and knows what Gea reads (errors of the asker's own requests, last 30 minuti, or the exact code over the last day; cleaned text) and what it cannot read (a colleague's code → «non trovato»; requests before 22 novembre 2026 without the user) → score += 1

utility(reader): Reader can run the office order before calling a dato «perso» — the right intervento of the utenza (ch.6), the operatore's last contact (more than 48 ore = the typical «mai partito»), Gea's check of the app for that operatore — and can name which of the three causes applies (mai partito, respinto, arrivato e non salvato) and who acts on each; and knows not to press «Verificato» on a missing intervento until the dato on the phone is excluded → score += 1

utility(reader): Reader can open a ticket from Ticket › «Nuovo ticket» («Che cosa succede» up to 4.000 caratteri, the commessa, «Ti impedisce di lavorare?» Sì/No obbligatoria, up to 5 allegati da 10 MB), uses «Capita anche a me» instead of a duplicate, «Ancora non risolto» to reopen, «Invia messaggio» to answer; reads the nine states and knows which four close a ticket; knows who sees what (colleagues of the commessa without the author's name; conversation and attachments only author and team) → score += 1

utility(reader): Reader can write a ticket the staff tecnico can start from without asking back, using the evidence table: errore a schermo → pagina, ora, codice di 8 caratteri; dato dal telefono → operatore, giorno e ora dell'azione, codice dell'utenza o dell'intervento; importazione o esportazione → numero del registro, nome del file, mappatura; visibilità → profilo della persona, commessa, the layer of ch.11 where the check stopped → score += 1

utility(reader): Reader (staff tecnico) can read the four read-only pages: «Errori app» (blocchi dell'app from the central registers, last 7 giorni, max 500 righe, only the commessa entered; the empty-page message), «Log» (actions sent by the app, «Dettaglio»), «Giro» (six stati with counts, failures first, 100 righe per pagina, scheduler stale after three intervals without a giro), «Stato commesse» (grigio / verde / giallo / rosso and the reason behind each colour, filled once a day at 06:30) → score += 1

utility(reader): Reader (staff tecnico) can run the tools that write without surprises: every one shows a confirmation with the numbers before writing and writes nothing when there is nothing to do; «Consolida utenze» max 500 codes per run, queued, not cancellable; «Svuota cache» never touches the protected keys and, on an «sconosciuto» outcome, the preview is redone before repeating; the Cruscotto takes the date as gg/mm/aaaa and a ceiling from 1 to 500, and a new launch for the same date resumes the «Non riusciti» → score += 1

utility(emotional): Reader (amministratore) knows where to stop: they read the error code, the operatore's last contact, the state of their tickets and Gea's answer themselves; logs, request identifiers, the Admin pages, consolidation, cache and bulk AI launches are the staff tecnico's; «Il nostro team ne è stato avvisato» means the error was recorded, not that someone will call back — when the error blocks work, a ticket with «Sì» is what puts it in front of a person → score += 1

utility(emotional): Reader feels calm in front of empty or red screens because each has a written meaning: «Errori app» empty is normal (crashes live in the central registers; Gea reads them); a Giro register empty is a state with its own message; a grey commessa is «ferma, nessun allarme»; a ticket answer that has not appeared yet is a draft waiting for approval, not a lost reply → score += 1

utility(factual): The chapter states, each with its source: Admin groups and voci (`lib/MenuAdmin.php`, `lib/AdminAreaUtenti.php::titoloAdmin()`); the error screen text and the 8-character code (`lib/BaseErrorHandler.php`, `renderErrorScreen()`, `random_bytes(4)`; GOP-249); 30 minuti / one day / 22 novembre 2026 (`wiki/assistenza-clienti/runbook-errore-a-schermo.md`, GOP-864); ingresso and esito with a common identifier (GOP-264, `runbook-dove-si-e-fermato-il-dato.md`); ticket fields, limits and nine state labels (`wiki/assistenza-clienti/sezione-ticket.md`, `lib/MobileV3/Feedback/TicketModel.php`); 12 mesi retention (`docs/02-patterns/48-ticketing-base.md`); health rules and thresholds (`lib/StatoCommesseSalute.php`); protected cache keys (`lib/RedisChiaviProtette.php`); Cruscotto limits (`wiki/assistenza-clienti/pagina-admin-cruscotto-analisi-ai.md`, GOP-842) → score += 1
```

---
## BEAT LIST

Six sections (`##` in the final chapter). Each needs: the italic audience line at the top (STYLE_BIBLE § Voice rule 6), at least one exact concrete detail, at least one **Limite** paragraph, max 5 prose paragraphs in a row without a table/list/box/subheading, 600–1.200 words. Audience tags per INSTRUCTION.md: [UFFICIO], [STAFF], [DEV], [TUTTI].

Before § 1 the Writer puts the mandatory `*In questo capitolo…*` paragraph (2–3 sentences): which tools exist when something does not work, who sees each one, and how a problem passes from whoever sees it to the staff tecnico with its evidence; § 1–§ 4 are for amministratori and the back office, § 5–§ 6 for the staff tecnico.

---

### § 1 — `## Chi ha quali strumenti: il menu Admin, la barra in alto e Gea`
**Tag:** [TUTTI] (one `> **Per gli sviluppatori:**` box)
**Core question:** When something does not work, which tools does each person have, and why does an amministratore see a menu called «Utenti» where the staff tecnico sees «Admin»?
**Word target:** 800 (range 750–950)
**Paragraph functions:** Aggancio (the opening case, see TARGET) → Spiegazione (the three legs) → Dimostrazione (map table) → Spiegazione (the «Utenti»/«Admin» title rule) → contro-obiezione → Limite → Sintesi.

**Content plan**
- Opening case (invented, said once as invented; do not quote the style rule — the ch.6 review flagged «Un esempio inventato, dichiarato come tale» as a leaked instruction): one Monday morning the office receives three messages — a white screen with «Si è verificato un errore imprevisto» and a code of 8 characters; an operatore who says «ho chiuso 9 interventi e ne risultano meno» (symptom wording from the runbook); a colleague who asks why their menu says «Utenti» while the staff's says «Admin». Three problems, three tools, one rule: the evidence travels with the problem. Name the three legs (chi vede il problema → il ticket → lo staff tecnico).
- **Map table** (Strumento | Dove si trova | Chi lo vede | A che cosa risponde), one row per tool, labels exactly as in code:
  - «Ticket» (barra in alto) | every person with a personal identity, where the section is active | «a che punto è il mio problema» → § 4
  - Campanella (barra in alto: «Novità», «Ticket», annunci) | every utente of the back office | «che cosa è cambiato, che cosa aspetta una mia risposta» → § 4
  - Gea («Assistente virtuale») | where active (ch.10) | «perché ho visto un errore», «dove si è fermato il dato» → § 2, § 3
  - Admin › «Utenti» («Elenco utenti», «Profili e varianti») | whoever has the permesso | ch.11
  - Admin › «Diagnostica» («Errori app», «Log», «Console JSON», «Giro») | staff tecnico | § 5
  - Admin › «Clienti» («Account», «Carichi», «Stato commesse») | staff tecnico; «Stato commesse» one technical account only | § 5
  - Admin › «Strumenti» («Consolida utenze», «Analisi AI foto per carico», «Svuota cache Redis», «Cruscotto Analisi AI») | staff tecnico | § 6
  - Admin › «Sistema» («Mappa», «GCM») | staff tecnico | «GCM» = notifications and remote commands to phones → ch.8
  - Admin › «Report» | by permesso, on one commessa that has a monthly extraction | one row, no commessa name
- **Rule of the title:** a group appears only if the viewer sees at least one of its voci. Whoever is not staff tecnico and sees only the «Utenti» voci finds the entry titled «Utenti»; the four technical groups are tied to the staff flag on the access, which no profilo grants (consistent with ch.11; one sentence + «vedi il capitolo 11»).
- **Guard on the address, not only on the menu:** «Stato commesse» refuses anyone else with «Accesso negato: pagina riservata al super-admin globale» even if the address is typed by hand. One sentence: the same principle applies to `json_admin.php` (ch.2 and ch.11 quote «User not allowed»; do not re-explain).
- **Contro-obiezione 1:** «Il collega dello staff ha il menu Admin pieno di voci, io ho solo «Utenti»: mi manca un permesso?» → No: the technical groups are not a permesso of any profilo; what you need from them reaches you through Gea and the ticket. If even «Utenti» is missing, that is a permesso question → ch.11.

**Limite (mandatory):** the Admin pages are described by the wiki «dal codice, non provata nel browser» (pages Errori app, Giro, Manutenzione, Cruscotto): the chapter uses only labels confirmed in templates/JS by the Researcher; the amministratore cannot be given the technical groups; the Ticket section, the annunci and the «Novità» counter depend on tables that may not be active on every installation (see [CONFLICT] 3) — say «dove la sezione è attiva», never promise it.

**Sintesi:** «Ogni strumento appartiene a un tratto della staffetta: chi vede il problema, il ticket, lo staff tecnico.»

**DEV box (max 5 lines):** `lib/MenuAdmin.php::voci()` (technical groups when `users.admin = 1`, GOP-658/659), `AdminAreaUtenti::gruppo()` / `titoloAdmin()` (GOP-601), `pages/admin.php?action=…` routes every Admin voce, `StatoCommessePagina::negaSeNonConsentito()` (guard on the action, GOP-726), `RiepilogoMese::voceMenu()` for «Report» (GOP-654). Architecture: «vedi il capitolo 13».

**Key facts the Researcher must find**
- Confirm every voce label and group in `lib/MenuAdmin.php` on `php8` at the research date, including «Svuota cache Redis» (menu) vs «Svuota cache» (button, `Smarty_templates/it/admin.html`) — [CONFLICT] 2.
- What «Account», «Carichi», «Console JSON», «Mappa» do, one line each, from `pages/admin.php` and `docs/02-patterns/11-admin-routing.md` (only what is needed for the table; Console JSON → pointer ch.15).
- Where the «Ticket» entry and the campanella sit in the top bar (`Smarty_templates/it/_header.html`), and the condition under which «Ticket» is shown (personal identity; tables present).
- `StatoCommessePagina::MESSAGGIO_NEGATO` verbatim and HTTP code.

---

### § 2 — `## «Perché ho visto un errore»: il codice di 8 caratteri`
**Tag:** [TUTTI] (italic line: *Per tutti; il riquadro finale è per lo staff tecnico.*)
**Core question:** What does the error screen say, what does its code identify, and what can the utente, Gea and the staff tecnico each read behind it?
**Word target:** 850 (range 750–1.000)
**Paragraph functions:** Aggancio → Dimostrazione (the screen, verbatim) → Spiegazione (why it is the same everywhere) → Procedura (what the utente does) → Spiegazione (what is read behind the code) → contro-obiezione → Limite → Sintesi.

**Content plan**
- The screen, verbatim: «Si è verificato un errore imprevisto. Il nostro team ne è stato avvisato.», the code in large characters, the button «Torna indietro». The code is 8 characters, digits and letters from A to F; it is generated for that single error and written in the server's register with the error. Example code invented and declared (the runbook's «3FA9C21B» is itself an example: use another invented one or say it is an example).
- **Why the screen is the same on every commessa:** GOP-249, decision 6 — sober, translated, deliberately not customisable per commessa, «una schermata d'errore ridefinibile è una schermata d'errore che si scopre rotta nel momento peggiore» (rephrase from the docblock of `renderErrorScreen()`; cite GOP-249). This is the one surgical example of the section.
- **What «Il nostro team ne è stato avvisato» means:** the Researcher confirms what is actually sent (register entry; alarm on the errors group). The Writer states exactly that and no more (proportionality guard below).
- `### Che cosa fa chi vede l'errore` — numbered, one action per step: 1. copy the code (it is selectable); 2. note the page (voce di menu as on screen) and the time; 3. from the same page, ask Gea «perché ho visto questo errore?», giving the code; 4. if the cause is something the utente can fix (a file, a required field), fix and repeat; 5. otherwise open a ticket of type «segnalare un difetto» with page, time and code (§ 4).
- `### Che cosa legge Gea` (≤ 3 sentences + «vedi il capitolo 10»): the page context first (a clue, not a proof); then the server errors of the asker's own requests, last 30 minuti by default, up to one day; with the code the search is exact over the last day. For each type: how many times, first and last time (ora italiana), codes, errore or avviso, where it started (request of a page, opening of a page, a job in coda such as an importazione or esportazione), cleaned text.
- **Errori dei lavori in coda:** an error from an importazione or esportazione leads to the registro number → ch.4 / ch.7 (one sentence).
- **No server error found:** the message may come from a check of the page on the data typed (campo obbligatorio, formato), not from a fault. Say so; the remedy is to read what was written on screen.
- **Contro-obiezione 2:** «Un collega mi ha girato il suo codice, ma Gea non lo trova.» → By design: Gea reads only the errors of the asker's own requests, in their commessa; a colleague's code is «non trovato». The colleague asks Gea, or the code goes into a ticket for the staff.

**Limite (mandatory):** errors of requests recorded before 22 novembre 2026 carry no user and cannot be found by Gea (failed jobs already carried the user); an error reaches the register a few seconds later — if it is not there, retry after a minute; the text Gea shows is cleaned (no file paths, no call list, the end customer's data replaced by `[…]`, no emails, phones, tax codes, IBAN, access secrets): the full error is read only by the staff tecnico; Gea never gives file, class, action or field names.

**Sintesi:** «Il codice non spiega l'errore: lo rende trovabile. Va copiato, con la pagina e l'ora.»

**Staff box `> **Per lo staff tecnico:**` (max 5 lines):** the code is `strtoupper(bin2hex(random_bytes(4)))` in `lib/BaseErrorHandler.php`; the handler writes user, page and action with the error (`richiestaCorrente`, GOP-864); jobs write their errors per `docs/03-cookbooks/35-errori-dei-job-in-background.md`; Gea's tool `errori_applicazione` (`chatbot-service/src/backend-errors.ts`) reads them; where the full error lives and how to search it by code: «vedi il capitolo 16».

**Key facts the Researcher must find**
- `lib/BaseErrorHandler.php`: `renderErrorScreen()` text and button; code generation (lines ~354 and ~435: two paths — which errors get which); what is sent and where (`sendToCloudWatch`, alarms) to support «avvisato» truthfully; whether the screen also appears inside JSON calls (`json.php`, `api.php` exclusions near line 600).
- GOP-249: title and decision 6 wording; GOP-864: what changed on 22 novembre 2026.
- `wiki/assistenza-clienti/runbook-errore-a-schermo.md`: 30 minuti, one day, cleaning rules, errore vs avviso, origins.
- `chatbot-service/src/backend-errors.ts` (read only): confirm the windows and the «non trovato» behaviour for a colleague's code.
- Whether any office page shows the code outside the full-screen error (e.g. JSON error toasts): grep `errorId`, `codice errore` in `js/code/`.

---

### § 3 — `## «Dove si è fermato il dato»: mai partito, respinto, non salvato`
**Tag:** [UFFICIO] + [STAFF] (italic line: *Per l'ufficio fino alla tabella; il riquadro finale è per lo staff tecnico.*)
**Core question:** A dato that should come from the phone (foto, esito, posizione) is not in the office: did it never leave, was it refused, or did it arrive and not get saved — and who acts on each?
**Word target:** 1.000 (range 900–1.150)
**Paragraph functions:** Aggancio (one sentence referring to ch.1's case; the rule «dire quale delle tre, non indovinare») → Spiegazione (two marks per request) → Procedura (office order) → Dimostrazione (five-readings table) → contro-obiezione → Limite → Sintesi.

**Content plan**
- The rule first: a missing dato has three causes with three different owners — never left the phone (phone, network, app: the operatore), refused by the server (the server's rule or a defect of the app's format: staff tecnico), arrived and not saved (the server: staff tecnico). The job is to say which, not to guess.
- **Why it can be told today:** since GOP-264 every request from the phone leaves two marks with a common identifier — the **ingresso** (the request reached the server) and the **esito** (how it ended). One sentence referring to ch.1 («il caso del capitolo 1»), no numbers from ch.1.
- `### Prima di chiamarlo perso: i controlli dell'ufficio` — numbered, one check per step:
  1. Is it the right intervento of the utenza? (an utenza can have more than one; the esito is only on the closed one — ch.6, one clause.)
  2. When did the operatore's phone last contact the server? (the last contact is updated every time the app opens; Operatori › Dashboard «Ultimo invio» — label to verify — ch.8). More than 48 ore of silence is the typical «mai partito».
  3. Ask Gea to check the app for that operatore (runbook «problemi con l'app»: crashes, requests that went wrong, anomalie — ch.8/ch.10, one sentence).
  4. Only then: if the intervento has no esecuzione, **do not press «Verificato»** until the phone is excluded — keeps ch.6's promise: «Verificato» on a missing intervento creates an empty esecuzione and the phone's later sending is refused (GOPlanner 3) or ignored (older app). One sentence + «vedi il capitolo 6».
  5. Silent phone → the operatore opens the app with the network on: the queue leaves by itself (ch.8, «Riprova»). Refusals or errors → ticket (§ 4) with operatore, period and what is missing.
- **Table — the five readings** (Che cosa risulta | Che cosa vuol dire | Chi interviene), from the runbook, in office words:
  - no ingresso from that phone in the period | the dato never reached the server | operatore (phone, network, app)
  - ingresso without esito, same request, an action that writes | the server stopped halfway (timeout, memory, restart) | staff tecnico (infrastructure)
  - esito «rifiutata» with a motivo | the server refused; the motivo says why; on many phones right after a release it is a format defect of the app; an unknown phone → «Sim non trovata» | staff tecnico (ch.8 for the phone side)
  - esito «errore» without a later «ok» for the same dato | arrived, saving failed | staff tecnico (server)
  - esito «ok» but the dato is not on the page | saved; look at the page's filter or the commessa open, not at the phone | ufficio (ch.6 filters)
- Who reads the table: the first column is read by the staff tecnico (and by Gea for the phone checks); the office reads its conclusion. Gea says the conclusion in one sentence among the three, the period checked and the last contact time; never request identifiers, device fingerprints or register names.
- **Contro-obiezione 3:** «Gea dice che il dato non è mai arrivato, ma l'operatore giura di averlo mandato.» → Three checks, in order: the phone's queue (still waiting: «Riprova», ch.8); the phone's clock (a wrong clock moves data to another day); and — staff only — whether the register channel itself was silent (a silent register is not a silent phone). Without proof in the registers, nobody says «è tutto arrivato»: they say what was checked.

**Limite (mandatory):** the runbook is read-only — neither Gea nor the staff resends or corrects data from it; a problem the app never recorded (phone off, no network) leaves no trace anywhere; phones retry, and a retried sending can duplicate a dato when the confirmation was lost: deduplication by identifier is not yet in production (`docs/03-cookbooks/36-osservabilita-canale-mobile.md`) — state it as a known limit, in proportion (see guards); the detail level of the app's register is per commessa and is raised only temporarily by the staff.

**Sintesi:** «Un dato mancante ha tre cause e tre responsabili: prima di cercarlo, si stabilisce dove si è fermato.»

**Staff box `> **Per lo staff tecnico:**` (max 5 lines):** read the two groups together, `/goplanner/sconosciuto/mobile` (every ingresso, without commessa) and `/goplanner/<tenant>/mobile` (esiti), filtering by `dispositivo` or `request_id` (= `X-Request-Id` of the response); for retried foto of the same file the ingresso is logged once every 5 minuti, so an esito without ingresso is a retry; before concluding «nothing arrived» run `php scripts/check_canale_log.php` and `php scripts/check_mobile_log_silence.php` (GOP-195, GOP-270); `custom['mobile']['log_level']` 0–4 (1 if absent), raise to 3–4, have the app reopened, read, lower again. Channel and tooling: «vedi il capitolo 16».

**Key facts the Researcher must find**
- `wiki/assistenza-clienti/runbook-dove-si-e-fermato-il-dato.md` (2026-11-19): every step; triangulate with `docs/03-cookbooks/36-osservabilita-canale-mobile.md` and GOP-264.
- The field updated at every app opening (`last_ping` per the runbook) and the office label that shows it (Operatori › Dashboard, «Ultimo invio»? ch.8's struttura uses that label — confirm in `js/code/` or `Smarty_templates/it/`).
- The exact values of esito (`ok`, `rifiutata`, `errore`, `vuota`, `non_json`) and the motivo «Sim non trovata» (code: grep `rifiutata`, `Sim non trovata` in `lib/MobileV3/` and the mobile entry points).
- Ch.6 continuity: «Verificato» on a missing intervento and what GOPlanner 3 / the older app do with the later sending (dossier_chapter_6.md has it — reuse, cite the same source).
- The 48-hour figure (runbook) and whether a code constant backs it; the 5-minute ingresso rule.
- Status of deduplication at the research date (cookbook 36; Jira text ~ «deduplicazione»).

---
### § 4 — `## Ticket, campanella e annunci: consegnare un problema allo staff`
**Tag:** [UFFICIO] (italic line: *Per amministratori e back office; il riquadro finale è per gli sviluppatori.*)
**Core question:** How does a utente hand a problem to the staff tecnico so that the staff can start without asking back, how do they follow it, and what reaches them through the campanella?
**Word target:** 1.050 (range 950–1.200)
**Paragraph functions:** Aggancio → Procedura (open a ticket) → Dimostrazione (evidence table) → Spiegazione (states, visibility, drafts) → `###` campanella and annunci → contro-obiezione → Limite → Sintesi.

**Content plan**
- Where: «Ticket» in the top bar, with the number of tickets to read beside it; the same number in the campanella under «Ticket». Present only for persons with a personal identity (an access «Da collegare» does not have it → ch.11) and where the section is active.
- Two ways in, one sentence each: by hand from «Nuovo ticket»; from Gea's ticket card («Apri il ticket», Gea never opens it by itself, limit 50 in 24 ore → «vedi il capitolo 10»). Segnalazioni written in the app with «Segnala un problema» land here too (source «app» → ch.8).
- `### Aprire un ticket` — numbered: 1. Ticket › «Nuovo ticket»; 2. «Che cosa succede» (obbligatorio, up to 4.000 caratteri); 3. the commessa (field labelled «Tenant»: say once that here it means the commessa) or «Nessuno, problema generale»; 4. «Ti impedisce di lavorare?» Sì/No (obbligatoria; «Sì» = urgent, the team is notified at once); 5. «Allegati» (optional, up to 5 files of 10 MB: immagini, PDF, CSV, TXT, Excel, ZIP); 6. while typing, similar open tickets appear: if it is the same problem, open it and press «Capita anche a me» instead; 7. «Apri ticket» (verify exact button label — the wiki says «Apri ticket», Gea's card says «Apri il ticket»).
- **Evidence table — «Che cosa scrivere perché lo staff parta subito»** (Problema | Che cosa mettere nel ticket | Dove si prende): this is the section's core and the chapter's thesis made operational.
  - Errore a schermo | pagina (voce di menu), ora, codice di 8 caratteri | the error screen; Gea (§ 2)
  - Dato dal telefono mancante | operatore, giorno e ora dell'azione sul telefono, codice dell'utenza o dell'intervento, the conclusion Gea gave | § 3
  - Importazione con righe mancanti o fallita | numero dell'importazione, nome del file, mappatura | ch.4
  - Esportazione vuota o «Fallita» | numero dell'esportazione, ora, causa registrata | ch.7
  - Una persona non vede qualcosa | profilo della persona sulla commessa, commessa, che cosa manca, the step of ch.11's check where it stopped | ch.11
  - Pagina bianca nel menu File | the voce aperta, ora, codici errore (ch.1 box already lists this: reuse its words, do not contradict)
  Rule under the table: never personal data of third parties in the text (names of intestatari, phone numbers): the code of the utenza is enough.
- **The nine states** (table: Stato | Che cosa vuol dire | Chiuso?): «Ricevuta», «In analisi», «In attesa di risposta» (the team asked something: answer with «Invia messaggio»), «In correzione», «Nella prossima versione», «Risolta», «Non è un difetto», «Risposto», «Non prevista». Closed = «Risolta», «Non è un difetto», «Risposto», «Non prevista» (`TicketModel::STATI_CHIUSI`). Only the team changes the state.
- **Following it:** «Aperti / Chiusi / Tutti»; the labels «Mio», «Urgente», «Attende una risposta», «Da leggere»; the scheda's buttons «Capita anche a me» (only on others' open tickets), «Ancora non risolto» (reopens a closed one; only the author or who confirmed), «Invia messaggio» (only the author, while open).
- **Who sees what** (bulleted): one's own tickets + those of colleagues of the commessa chosen at the top, without the author's name; a ticket without commessa only its author; conversation and attachments only author and team — who follows sees state, explanation and version; a ticket of a commessa one has lost access to disappears from the list and the notices.
- **Drafts:** explanations («Non è un difetto», «Non prevista», closures with an explanation) and commitments on times are drafts until the responsabile approves them («Bozze da approvare», team only). A reply that has not appeared yet is not lost.
- `### La campanella e gli annunci` — the campanella collects three sources (GOP-712, GOP-757): annunci (one entry per announcement), «Novità» (the page of changes; per-commessa changelog → «vedi il capitolo 16»), «Ticket» (only for the author and for who pressed «Capita anche a me»: tickets changed since last opening and tickets waiting for the person's answer, which stay until answered). Announcements: open by themselves as a window at the first access after release; «Ho capito» marks them read **per persona**; closing with Esc does not mark read (it reappears at the next access); re-read from the campanella (the entry reads «Novità · letta · clicca per rileggerla» — verify). First announcement: «Ti presentiamo Gea» (ch.1 and ch.10 already describe it: one clause). Only in the back office, not in the app. A source that fails counts zero: the campanella never breaks a page.
- **Contro-obiezione 4:** «Ho segnalato ieri, ho risposto «Sì» a «Ti impedisce di lavorare?», e non vedo ancora una risposta.» → «Sì» notifies the team immediately but does not change response times beyond that notice; an explanation may be a draft awaiting approval; the state tells where the ticket is. Do not promise times (the wiki forbids it).

**Limite (mandatory):** an opened ticket cannot be edited or deleted, and its state is decided by the team; the section does not appear without a personal identity or where the ticket tables are not active ([CONFLICT] 3: phrase «dove la sezione Ticket è attiva»); tickets, messages, attachments, confirmations and readings are deleted together after 12 mesi; an announcement cannot be written by an amministratore — announcements are files that arrive with a release (DEV box); Gea does not see the content of others' tickets.

**Sintesi:** «Un ticket vale quanto le prove che porta: pagina, ora, codice, oppure operatore e periodo, oppure il numero del registro.»

**DEV box (max 5 lines):** `pages/ticket.php`, `js/code/ticket.js`, `lib/TicketWeb.php` (count for the campanella), `lib/MobileV3/Feedback/TicketModel.php` (STATI, STATI_CHIUSI, labels), JSON actions `ticket_*` (`docs/03-cookbooks/24-ticket-azioni-json.md`); tickets belong to the identity, not to the `users` row (ADR 49, GOP-762); `lib/CentroNotifiche.php` sources; an announcement = `annunci/AAAA-MM-GG-nome.json` + `.html` + `.svg`, shown from its `pubblicato` date, hidden if `annunci_letti` is missing (migration 0030) — «un annuncio che non si può chiudere per sempre non si mostra».

**Key facts the Researcher must find**
- `wiki/assistenza-clienti/sezione-ticket.md` (2026-11-16) vs code: field labels and limits in `js/code/ticket.js` / `pages/ticket.php` / the template (4.000 caratteri, 5 files, 10 MB, allowed types), the open button label, the list labels and buttons.
- `TicketModel` labels for the nine states and the three types («Difetto», «Richiesta», «Assistenza»); whether a «richiesta di funzione» uses the same states or the six of the wiki («Ricevuta», «In valutazione», «Pianificata», «Non prevista», «Risposta», «Disponibile») — [CONFLICT] 8.
- Retention 12 mesi (`FeedbackRetention`, ADR 48 § Privacy e conservazione).
- Whether tables 0027 (ticket), 0025 (novità), 0030 (annunci_letti) are applied in production at the research date — [CONFLICT] 3; if no source says, `[BLOCKED: needs human input — tabelle dei ticket applicate in produzione?]`.
- `lib/CentroNotifiche.php`: who is notified for tickets; `annunci-novita-campanella.md` labels; the read-again entry text in `js/code/annunci.js` or `Smarty_templates/it/_annunci.html`.
- One real story (problem → cause → fix, no names) for concreteness: candidates ADR 49 «ticket legati all'identità» (why a ticket follows the person, not the access), or ADR 48 «bozze» (why explanations wait for approval). One only.

---

### § 5 — `## Le pagine di sola lettura dello staff: Errori app, Log, Giro, Stato commesse`
**Tag:** [STAFF] (italic line: *Per lo staff tecnico; l'ufficio può leggerla per sapere che cosa lo staff guarda dopo un ticket.*)
**Core question:** After the ticket, where does the staff tecnico look, what does each read-only page answer, and how is a permission problem diagnosed beyond the amministratore's own check?
**Word target:** 1.100 (range 1.000–1.200)
**Paragraph functions:** Aggancio (every page answers one question; none of them writes) → four `###` subsections, each Spiegazione + Dimostrazione → `###` permissions → contro-obiezione → Limite → Sintesi.

**Content plan**
- `### Errori app e Log` (Admin › Diagnostica): «Errori app» = blocchi dell'app (crash) of the commessa's phones, read from the central registers (GOP-849), last 7 giorni, at most 500 righe, only the commessa entered. Columns «ID», «Data», «Operatore», «Versione», «Stack trace»; filters «Operatore», «Periodo»; «Dettaglio» (date, operatore, app version and build, Android version, phone model, SIM, full trace, «Copia testo»). Empty is normal: quote «Nessun errore app qui. I crash dell'app ora sono registrati nei log centrali: chiedili a Gea, l'assistente virtuale» (verify verbatim). A crash of a phone whose SIM is not tied to exactly one operatore does not appear. «Log» = actions sent by the app: «ID», «Data», «Operatore», «Azione», «Dati inviati»; filters «Operatore», «Azione», «Periodo»; «Dettaglio». Both read-only. One sentence: not to be confused with Magazzino › Anomalie (ch.9) or the anomalie of the app (ch.8).
- `### Giro` (Admin › Diagnostica): one `> **Attenzione:**` line on the word (trap 1). The register of the activities the scheduler runs at intervals, including the «sonda» that does nothing but proves the scheduler is alive. Filters «Stato» with counts — «In coda», «In corso», «Completato», «Non applicabile», «Da ritentare», «Fallito» — and «Cliente» (= commessa); «Azzera». One date per column, Rome time, UTC on hover; the sonda grouped in one row per activity, period and stato; 100 righe per pagina, «Precedente» / «Successiva»; failures and unfinished work first. Rules: a scheduler that registers no giro for three intervals is stale; a definitive failure = four failed executions, and it raises an alarm in the errors register (staff box). Empty register: quote the page's message.
- `### Stato commesse` (Admin › Clienti; one technical account only): one row per commessa with a coloured dot and its reasons, the month's numbers and 30-day charts in the detail. **Table of the four colours** (Colore | Quando | Che cosa fare): grigio — no intervento eseguito in the month: «commessa ferma, nessun allarme», other reasons not shown; rosso — no sending from the operatori for more than 2 giorni lavorativi (message with the actual count and the last date); giallo — the commessa's database is behind the code's migrations (how many), or «fuori standard» without a baseline; giallo — an esportazione open for more than 60 minuti; verde — no reason. The colour is the most serious reason that fires. Data come from a central table written by the giro at 06:30; the page queries no commessa database. Columns include «Costo AI · mese»: name it, never print a value. AI only as «AI». Readability fixes: headers wrap, the reason up to three lines, full on hover (GOP-836).
- `### Un permesso che non torna` (keeps ch.2 and ch.11): the amministratore's check stops at the four layers of ch.11 (one sentence + «vedi il capitolo 11»). The staff continues with: (a) the report «cosa verrebbe negato» — while the profile controls run in sola registrazione, every permesso an identity would lack leaves an `rbac_deny` event; the report classifies them «sospetto» (old level allowed, profile not: probably an incomplete profilo), «da_verificare» (gate without comparison), «atteso» (missing for real), «gia_applicato» (already blocking, e.g. `json_admin`); it is a command run by the staff, not a page; (b) the event `rbac_ambito_divergenza` (the ambito by profilo differs from the old one); (c) «Impersona», to look with the person's eyes, within the rules of ch.11. No new rule here: only where the evidence is.
- **Contro-obiezione 5:** «Il Giro dice «Fallito» su una commessa: l'ufficio deve fare qualcosa?» → No action from the office: four executions failed and an alarm already reached the errors register; the staff reads the record. If the office noticed an effect (a number not updated, a report missing), a ticket with the commessa and the time.

**Limite (mandatory):** all four pages are read-only — nothing is corrected from them; «Errori app» covers 7 giorni and 500 righe, and only crashes of phones tied to one operatore; «Stato commesse» shows only what the central table records (operatori distinti as a daily peak; no foto-arrival delay) and is not visible to anyone but one technical account; the deny report reads exported events and does not switch any control on (decision outside the page, ch.11).

**Sintesi:** «Ogni pagina dello staff risponde a una domanda sola, e nessuna scrive: si legge, poi si decide.»

**Staff/DEV box (max 5 lines):** `lib/AdminDiagnostica.php`, `lib/CrashLogReader.php` (GOP-833, 834, 849); `lib/GiroPagina.php`, `lib/GiroRegistro.php`, `lib/GiroAllarme.php` (definitive failure → ERROR in `/goplanner/<tenant>/errors`, scheduler heartbeat in `/goplanner/giro/scheduler`); `lib/StatoCommessePagina.php`, `lib/StatoCommesseSalute.php` (thresholds in constants), table `stato_commesse_giorno` (migration 0024, 0026); `scripts/rbac_report_negazioni.php` + `docs/03-cookbooks/30-rapporto-negazioni-rbac.md`. Logs and alarms: «vedi il capitolo 16».

**Key facts the Researcher must find**
- `wiki/assistenza-clienti/pagina-admin-errori-app-e-log.md`, `pagina-admin-giro-stato-commesse.md` (both 2026-11-20, «non provato nel browser») vs `js/code/admin_errori.js`, `admin_logs.js`, `admin_diagnostica.js`, `Smarty_templates/it/admin.html`: every label and message verbatim; the 7-day and 500-row limits in code.
- `lib/GiroPagina.php`: `SCADENZA_SCHEDULATORE` (the «three intervals» rule, in minutes), the six stato labels, page size 100; `lib/GiroAllarme.php` four executions.
- `lib/StatoCommesseSalute.php`: the four rules, `SOGLIA_GIORNI_LAVORATIVI = 2`, `SOGLIA_ESPORTAZIONE_MINUTI = 60`, the reason texts verbatim; the 06:30 job (GOP-725) and `GIORNI_GRAFICO = 30`; what «Costo AI · mese» sums (only to describe it, no values).
- `docs/03-cookbooks/30-rapporto-negazioni-rbac.md`: classes and their meaning; `rbac_ambito_divergenza` source (`lib/Rbac.php` or `lib/AmbitoDati.php`).
- Ch.5 continuity: confirm «Giro» (Diagnostica) and «Stato commesse» (Clienti) are separate voci.

---

### § 6 — `## Gli strumenti che scrivono: Manutenzione e Cruscotto Analisi AI`
**Tag:** [STAFF] (italic line: *Per lo staff tecnico. L'ufficio trova qui che cosa chiedere quando servono questi lavori.*)
**Core question:** Which Admin tools change data or launch work, how does each protect against a mistake, and what does the office ask for when it needs one of them?
**Word target:** 900 (range 800–1.050)
**Paragraph functions:** Aggancio (the common form: field, button, confirmation with numbers) → three short `###` (Consolida utenze, Analisi AI foto per carico, Svuota cache) → `###` Cruscotto Analisi AI with a numbered procedure → contro-obiezione-free (two are enough elsewhere; optional sixth) → Limite → Sintesi = chapter closing.

**Content plan**
- **Common form** (GOP-839, 840, 841): a field with its label, a button, and — before writing anything — a confirmation with the numbers. If there is nothing to do, or the preview is unavailable, nothing changes and the page says so. One sentence of the reason: the operator of the tool sees the size of the change before it happens.
- `### Consolida utenze`: joins the codici utenza that appear more than once. Field «Numero massimo di codici da consolidare» (proposed 50, max 500, also enforced on the server). Confirmation «Verranno consolidati N codici utenza (su M duplicati ancora da consolidare)». Work goes to the queue and **cannot be cancelled**. Nothing to consolidate → it says so, nothing starts.
- `### Analisi AI foto per carico`: the «ID del carico» → confirmation with interventi, analysable foto (jpg, jpeg, png) and a **cost estimate** that is indicative (one flat rate per foto), not an invoice; no interventi or no analysable foto → nothing starts. Buttons «Avvia analisi AI» → «Avvia analisi». No figures in the chapter. Keeps ch.6's promise on costs, in proportion (see guards and [CONFLICT] 4).
- `### Svuota cache`: button «Svuota cache» → confirmation «Svuota» (red, because it cannot be undone) with how many keys will be deleted and how many are **protected**: the job queue, the lotti, the Giro records and the history of the AI launches are never touched (`lib/RedisChiaviProtette.php`: «non sono cache ma stato»). Result under the button: «Cache svuotata alle HH:MM: N chiavi eliminate»; «già vuota» if empty. Outcome «sconosciuto» (unreadable answer) → redo the preview before repeating: it may already have run.
- `### Cruscotto Analisi AI` — numbered: 1. Admin › Strumenti › «Cruscotto Analisi AI»; 2. «Data di esecuzione» — the day the interventi were **executed**, not planned — as gg/mm/aaaa (otherwise «Scrivi la data come gg/mm/aaaa»); 3. «Interventi per lancio (massimo)» 1–500 (default 50); 4. «Avvia elaborazione»; 5. read the confirmation (interventi, foto, chiamate AI — one per intervento — and how many stay outside the ceiling); 6. «Avvia analisi». Then «Stato avanzamento» with «Analizzati», «Non riusciti», «Saltati»; the work continues in the queue if the page is closed (a bookmark in the left menu). «Ultimi 10 lanci» with esiti «In corso», «Completato», «Completato con errori», «Non riuscito». «Non riusciti» are not wrong interventi: the analysis did not complete; a new launch for the same date takes only those not yet analysed. The page's own sentence: the analysis runs on the local model and shows counts, not a cost.
- **What the office asks for** (one short paragraph or `> **Quando chiedere allo staff tecnico:**` box): a bulk AI analysis of a day or a carico; duplicated codici utenza; «Analisi AI non ancora disponibile su questa commessa» (ch.6). Each through a ticket with the commessa, the date or the ID del carico.
- **Closing** (last paragraph of § 6, see TARGET).

**Limite (mandatory):** consolidation jobs and cache deletion cannot be undone; the per-carico cost is an estimate; the Cruscotto analyses only foto present on disk (jpg, png) and skips interventi already analysed; the guides of these pages were written from the code and not tried in a browser — the Writer uses only labels the Researcher confirms in `admin.html` / JS.

**DEV box (max 4 lines):** `docs/02-patterns/12-admin-maintenance.md` (preview, confirm, outcome), `lib/AdminManutenzioneAnteprima.php`, `js/code/admin_manutenzione.js`, `lib/RedisChiaviProtette.php` (`CODE`, `FRAMMENTI`), `js/code/admin_ai_dashboard.js`, `lib/AnalisiAiLanci.php`, `docs/02-patterns/18-ai-photo-analysis-batching.md` (GOP-842). Queue and workers: «vedi il capitolo 13».

**Key facts the Researcher must find**
- `wiki/assistenza-clienti/pagina-admin-manutenzione.md`, `pagina-admin-cruscotto-analisi-ai.md` (2026-11-20) vs `Smarty_templates/it/admin.html` and the two JS files: every label, the confirmation and outcome texts verbatim, max 500 and default 50 in code.
- `lib/RedisChiaviProtette.php` and the Giro empty-register messages («o Redis è stato svuotato») — [CONFLICT] 1.
- The per-carico cost estimate: where it is computed and labelled (grep `costo`, `stima` in `lib/Admin*.php`, `js/code/admin_manutenzione.js`) vs the Cruscotto's «non un costo» and Stato commesse's «Costo AI · mese» — [CONFLICT] 4. Resolve in words; no figures.
- GOP-842 story for the date format (why mm/gg/aaaa is no longer accepted): one sentence, only if the ticket or changeset says it.

---
### `## Fonti`
Built by the Writer from the dossier entries actually used, in the STYLE_BIBLE format (`codice: …`, `wiki: …`, `docs: …`, `Portolano: …`, `Jira: GOP-NNN — titolo breve`). Every Jira key with its short title (the ch.6 review flagged bare keys).

---

## REVIEWER READINESS NOTES

### Tension points (where the chapter must create real stakes)
1. **«Verificato» pressed too early (§ 3).** Stakes: the office verifies an intervento that has no esecuzione; the operatore's phone sends the esito an hour later and the server refuses it, because the intervento is already closed — the foto and letture never reach the office. Build-up: the three causes → the office order → step 4 «do not press «Verificato» until the phone is excluded». Resolution: a rule with its reason, not fear of the button.
2. **The code that does not travel (§ 2, § 4).** Stakes: a ticket that says «errore in importazione, ieri» forces the staff to search blind across a day of errors of a whole commessa; Gea cannot find a colleague's code. Resolution: the code is selectable on screen, the procedure says copy it first, the evidence table says where it goes.
3. **The silent register vs the silent phone (§ 3).** Stakes: concluding «the phone sent nothing» when it was the register channel that failed sends the operatore to fix a phone that works. Resolution: the staff checks the channel before concluding; the office hears only what was checked.
4. **Tools that cannot be undone (§ 6).** Stakes: consolidation jobs are not cancellable; cache deletion is irreversible; an «sconosciuto» outcome invites a second click that runs twice. Resolution: every tool shows its numbers before writing, protected keys are untouched, and the rule «redo the preview before repeating».
5. **A red commessa (§ 5).** Stakes: no sending from the operatori for more than 2 giorni lavorativi is the signal the system did not have in ch.1's case. Resolution: the rule, the colour order, and what it does not see (one phone silent inside an active commessa: ch.8's per-phone signals).
6. **Urgency without a promise (§ 4).** Low stakes, high frequency: a utente answers «Sì» and expects a call. Resolution: «Sì» notifies at once; it does not change the response time; drafts explain why an answer may not be visible yet.

### Key chains to make explicit (cause → consequence → reader action)
- Error on screen → a code of 8 characters written with the error → copy it with page and time → Gea finds it (own requests, one day) → a ticket carries it to the staff.
- Error before 22 novembre 2026 → no user recorded → Gea cannot find it → put the code and time in a ticket.
- No contact from the phone for more than 48 ore → the dato never left → the operatore opens the app with the network → the queue leaves by itself.
- Esito «rifiutata» on many phones right after a release → format defect of the app → staff tecnico, not the operatore.
- Intervento verified before the phone is excluded → the later sending is refused → exclude the phone first (§ 3 step 4).
- Ticket of a commessa you lost access to → disappears from your list and notices → ask a colleague who still has the access to follow it.
- Explanation written by the team → draft until approved → the answer appears later; the state already tells where the ticket is.
- Announcement closed with Esc → not read → reappears at the next access → «Ho capito» to close it for good.
- Giro: three intervals without a giro → scheduler stale; four failed executions → «Fallito» + alarm → staff reads the record.
- Database of a commessa behind the migrations → yellow in Stato commesse → migration (ch.16).
- Duplicated codici utenza → «Consolida utenze» (max 500 per run, not cancellable) → read the confirmation numbers first.
- «Sconosciuto» after «Svuota» → redo the preview → it may already have run.
- Profile controls in sola registrazione → `rbac_deny` events → the report's classes tell the staff which profili are incomplete before any switch-on (ch.11).

### Risk proportionality guards (each risk paired with its balancing context)
- **«Il nostro team ne è stato avvisato»** → state exactly what happens (the error and its code are recorded; alarms watch the errors register — only if the dossier confirms). Never imply a person will call back; never imply nothing happens. The ticket with «Sì» is the route to a person when work is blocked.
- **Dato «perso»** → the most common case in the runbook is a silent phone, and its queue leaves by itself when the app opens with the network; refusals and save failures are the staff's and are visible in the registers. Never write «i dati si perdono».
- **Deduplication not in production** → a duplicate needs a lost confirmation and a retry; it is visible and the staff handles it. One sentence, no alarm.
- **Errori app empty** → normal: crashes live in the central registers; Gea reads them.
- **Irreversible tools** → confirmation with numbers before writing; nothing happens when there is nothing to do; protected keys untouched; max 500 per consolidation run.
- **AI costs** → the per-carico figure is an indicative estimate; the Cruscotto shows counts, not a cost; Stato commesse has a monthly cost column read only by one technical account. No figures in the book.
- **Ticket privacy** → colleagues see tickets without the author's name; conversation and attachments only author and team; retention 12 mesi. Personal data of third parties stay out of the text.
- **Ticket section possibly not active** → «dove la sezione è attiva»; the alternative route (Gea's card, the office, the staff) exists.
- **Stato commesse red** → per commessa, not per phone; grey means «ferma, nessun allarme»; a single silent phone is seen in ch.8's per-phone signals.
- **Profile controls in sola registrazione** → copy ch.11's guard: the older level, the commessa menu and the server rules still block; never «oggi tutti possono fare tutto».

### Counter-objections planned (STYLE_BIBLE requires ≥ 2; five are planned)
1. § 1 — «Il collega dello staff ha il menu Admin pieno di voci, io ho solo «Utenti»: mi manca un permesso?»
2. § 2 — «Un collega mi ha girato il suo codice, ma Gea non lo trova.»
3. § 3 — «Gea dice che il dato non è mai arrivato, ma l'operatore giura di averlo mandato.»
4. § 4 — «Ho segnalato ieri, ho risposto «Sì», e non vedo ancora una risposta.»
5. § 5 — «Il Giro dice «Fallito» su una commessa: l'ufficio deve fare qualcosa?»

### Litmus test for this chapter
A new amministratore, with only this chapter, can: copy an error code and get its cause from Gea or put it in a ticket the staff can act on; tell an operatore's silent phone from a refused sending before verifying an intervento; open, follow, confirm and reopen a ticket and read its state; close an announcement for good. A new member of the staff tecnico can: read Errori app, Log, Giro and Stato commesse and say what each colour or state means; run Consolida utenze, Svuota cache and the Cruscotto reading the confirmation numbers first; find where an `rbac_deny` question is answered.

### Structural checks for the Editor
- One H1; «In questo capitolo»; six `##`; `## Fonti` last; no raw HTML (the error screen is HTML in the code: describe it, do not paste it).
- Every section has its italic audience line, a Limite paragraph and at least one exact label, number or file.
- No vendor or model name; no money value; no committente name; no real error code, request identifier or device fingerprint.
- The ch.1 story is referred to, not retold.

---

## RESEARCHER BRIEF

**Web search terms:** none. INSTRUCTION.md § Researcher, SOURCE OVERRIDE: the web is not a source for this book. Use only the sources below, in priority order. The GOPlanner repository (`/home/alan/firstmate/projects/GOPlanner`, branch `php8`) is READ ONLY: Read/Grep/`git grep`/`git log`/`git show` only; no checkout, pull, stash, composer, npm.

### Documents to prioritize (in order)
1. Code on `php8` (authority when sources disagree). The Admin wiki pages are dated 2026-11-20 and say «Guida scritta dal codice, non provata nel browser»: every label they quote is re-checked in `Smarty_templates/it/admin.html` and `js/code/admin_*.js`.
2. Wiki pages under `wiki/assistenza-clienti/` listed below (runbooks 2026-11-19 and 2026-11-22; Ticket and annunci 2026-11-16).
3. Decision records and cookbooks: `docs/02-patterns/48-ticketing-base.md`, `49-ticket-legati-all-identita.md`, `44-giro-giornaliero-a-job.md` (long: read only D4, D5, D6), `12-admin-maintenance.md`, `33-buffer-output-globale-gestore-errori.md`; `docs/03-cookbooks/35-errori-dei-job-in-background.md`, `36-osservabilita-canale-mobile.md`, `30-rapporto-negazioni-rbac.md`, `24-ticket-azioni-json.md`, `26-controllo-silenzio-log-mobile.md`, `06-errori-app-crash-da-log-iam.md` (only the switch, never the IAM text).
4. `changeset/` entries for GOP-836, GOP-842, GOP-847 (grep `ls changeset | grep -i "gop-8[34]"`).
5. Portolano, then Jira.

### Wiki paths
- `wiki/assistenza-clienti/pagina-admin-menu.md`
- `wiki/assistenza-clienti/pagina-admin-errori-app-e-log.md`
- `wiki/assistenza-clienti/pagina-admin-giro-stato-commesse.md`
- `wiki/assistenza-clienti/pagina-admin-manutenzione.md`
- `wiki/assistenza-clienti/pagina-admin-cruscotto-analisi-ai.md`
- `wiki/assistenza-clienti/runbook-errore-a-schermo.md`
- `wiki/assistenza-clienti/runbook-dove-si-e-fermato-il-dato.md`
- `wiki/assistenza-clienti/runbook-problemi-app-operatori.md` (one sentence only)
- `wiki/assistenza-clienti/sezione-ticket.md`
- `wiki/assistenza-clienti/aprire-un-ticket-da-gea.md` (only: card, 50 in 24 ore, «Apri il ticket»; ch.10 owns the rest)
- `wiki/assistenza-clienti/runbook-richiesta-funzione-nuova.md` (only the states of a function request, for [CONFLICT] 8)
- `wiki/assistenza-clienti/annunci-novita-campanella.md`
- `wiki/assistenza-clienti/runbook-pagina-file-non-funziona.md` (only the «pagina bianca» row of the evidence table)

### Code paths and grep patterns (read-only)
- Menu and guards: `lib/MenuAdmin.php`, `lib/AdminAreaUtenti.php`, `pages/admin.php`, `lib/StatoCommessePagina.php` (`MESSAGGIO_NEGATO`, `consentito`), `lib/AdminRequestGuard.php`, `lib/RiepilogoMese.php` (`voceMenu`, only to describe «Report» without naming the commessa).
- Error screen and errors register: `lib/BaseErrorHandler.php` (`renderErrorScreen`, lines ~354/~435 for the code, `richiestaCorrente`, `sendToCloudWatch`, `avviso`, `erroreJob`); `git grep -n "errorId\|codice errore" -- js/code lib`; `chatbot-service/src/backend-errors.ts` (read only).
- Mobile channel: `git grep -n "ingresso\|'rifiutata'\|Sim non trovata" -- lib mobile_v3.php`; `git grep -n "last_ping" -- lib js/code Smarty_templates/it | head`; scripts `scripts/check_canale_log.php`, `scripts/check_mobile_log_silence.php` (only their purpose, from the header comment).
- Ticket: `pages/ticket.php`, `js/code/ticket.js`, `lib/TicketWeb.php`, `lib/MobileV3/Feedback/TicketModel.php` (`STATI`, `STATI_CHIUSI`, `$etichetteStato`, `$etichetteTipo`), `lib/MobileV3/Feedback/FeedbackStore.php`, `git grep -n "FeedbackRetention" -- lib`, template of the Ticket page (`ls Smarty_templates/it | grep -i ticket`).
- Campanella and annunci: `lib/CentroNotifiche.php`, `lib/Annunci.php`, `lib/AnnunciArchivio.php`, `lib/Novita.php`, `js/code/annunci.js`, `Smarty_templates/it/_annunci.html`, `Smarty_templates/it/_header.html`, `ls annunci/`.
- Read-only Admin pages: `lib/AdminDiagnostica.php`, `lib/CrashLogReader.php`, `js/code/admin_errori.js`, `js/code/admin_logs.js`, `js/code/admin_diagnostica.js`, `lib/GiroPagina.php` (`SCADENZA_SCHEDULATORE`), `lib/GiroRegistro.php`, `lib/GiroAllarme.php`, `lib/StatoCommesseSalute.php`, `lib/StatoCommesseRaccolta.php`, `Smarty_templates/it/admin.html` (actions `errori`, `logs`, `giro`, `stato_commesse`).
- Tools that write: `js/code/admin_manutenzione.js`, `lib/AdminManutenzioneAnteprima.php`, `lib/RedisChiaviProtette.php`, `js/code/admin_ai_dashboard.js`, `lib/AnalisiAiLanci.php`, `Smarty_templates/it/admin.html` (actions `manutenzione`, `ai_dashboard`).
- Permissions diagnosis: `scripts/rbac_report_negazioni.php` (header only), `git grep -n "rbac_ambito_divergenza" -- lib`.
- History: `git log --oneline -i --grep="GOP-8[34][0-9]" -- lib/Admin* lib/Giro* lib/StatoCommesse* js/code/admin_*` ; `git show --stat` on the commits of GOP-726, GOP-727, GOP-836, GOP-842, GOP-849, GOP-864.

### Portolano queries (`mcp__rag_qdrant_server__query_rag_hybrid` with `user_roles: ""` — the EMPTY string, per INSTRUCTION.md; fall back to `query_rag`)
- «menu Admin gruppi Clienti Diagnostica Strumenti Sistema Utenti super-admin»
- «Si è verificato un errore imprevisto codice errore 8 caratteri»
- «perché ho visto un errore errori_applicazione 30 minuti codice errore»
- «dove si è fermato il dato ingresso esito request_id canale mobile»
- «tablet fermo 48 ore last_ping ultimo contatto telefono»
- «sezione Ticket Nuovo ticket Ti impedisce di lavorare Capita anche a me»
- «ticket bozze da approvare spiegazione stato Non è un difetto»
- «campanella annunci Ho capito Ti presentiamo Gea Novità»
- «Errori app crash log centrali ultimi 7 giorni 500 righe»
- «Giro registro schedulatore sonda Fallito Da ritentare»
- «Stato commesse salute pallino motivi giorni lavorativi esportazione aperta»
- «Consolida utenze massimo 500 Svuota cache chiavi protette»
- «Cruscotto Analisi AI data di esecuzione tetto lanci Non riusciti»
- «rapporto negazioni rbac_deny sospetto da_verificare atteso»

### JQL fragments (cloudId `21873985-2e5d-4a8a-bb45-e6d453128985`, project GOP, READ ONLY)
- `project = GOP AND key in (GOP-195, GOP-249, GOP-264, GOP-270, GOP-536, GOP-581, GOP-601, GOP-656, GOP-658, GOP-659, GOP-712, GOP-723, GOP-725, GOP-726, GOP-727, GOP-757, GOP-758, GOP-762, GOP-833, GOP-834, GOP-836, GOP-838, GOP-839, GOP-840, GOP-841, GOP-842, GOP-849, GOP-864)`
- `project = GOP AND text ~ "errore imprevisto" ORDER BY updated DESC`
- `project = GOP AND text ~ "dove si è fermato" ORDER BY updated DESC`
- `project = GOP AND text ~ "ticket" AND text ~ "migrazione" ORDER BY updated DESC` (is 0027 applied?)
- `project = GOP AND text ~ "deduplicazione" ORDER BY updated DESC`
- Purpose: titles for `## Fonti`; one real story per section where the dossier allows (problem → cause → fix, no names): GOP-249 (error screen), GOP-864 (errors tied to the user), GOP-849 (crashes moved to the central registers), GOP-836 (Stato commesse made readable), GOP-839..841 (confirmation with numbers); production status of the ticket, novità and annunci tables.

### Specific facts, numbers and labels to hunt
- Error screen: text, «Torna indietro», 8 characters 0–9 A–F; 30 minuti; one day; 22 novembre 2026.
- Mobile channel: 48 ore; ingresso once every 5 minuti for retried foto; esito values; «Sim non trovata»; `log_level` 0–4, default 1.
- Ticket: 4.000 caratteri; 5 allegati da 10 MB and their types; 50 in 24 ore (Gea's card); nine state labels; four closed; 12 mesi; labels «Nuovo ticket», «Aperti», «Chiusi», «Tutti», «Mio», «Urgente», «Attende una risposta», «Da leggere», «Capita anche a me», «Ancora non risolto», «Invia messaggio», «Nuovo messaggio», «Bozze da approvare», «Nessuno, problema generale».
- Campanella: «Novità», «Ticket», «Ho capito», «Ti presentiamo Gea», the read-again text.
- Errori app: 7 giorni, 500 righe, columns, filters, empty message. Log: columns, filters.
- Giro: six stati; 100 righe; «Azzera», «Precedente», «Successiva»; three intervals (`SCADENZA_SCHEDULATORE`); four executions.
- Stato commesse: four colours; 2 giorni lavorativi; 60 minuti; 06:30; 30 giorni; refusal message.
- Manutenzione: 50 / 500; confirmation and outcome texts; «Avvia analisi AI», «Avvia analisi», «Svuota cache», «Svuota»; protected keys list.
- Cruscotto: gg/mm/aaaa and its error message; 1–500, default 50; «Avvia elaborazione», «Avvia analisi»; «Stato avanzamento»; «Analizzati», «Non riusciti», «Saltati»; «Ultimi 10 lanci»; four esiti.

### Mandatory [CONFLICT] items to record
1. **Svuota cache and the Giro register.** `pagina-admin-giro-stato-commesse.md` says the register is empty «anche dopo aver usato la voce Svuota cache»; `pagina-admin-manutenzione.md` and `lib/RedisChiaviProtette.php` (`FRAMMENTI` includes `giro:`) say the Giro records are protected. The page message says «(o Redis è stato svuotato)», which may mean a flush outside the tool. Code wins; state the resolution in words.
2. **Menu label.** `lib/MenuAdmin.php` «Svuota cache Redis» vs wiki «Svuota cache»; the button is «Svuota cache». The Writer quotes the menu voce as in code and the button as in the template.
3. **Is the Ticket section live?** ADR 48 says migration `0027_ticket_base.sql` is «preparata e non applicata»; the wiki describes the section as working; announcements need 0030, Novità 0025. Record what each source says; if production status is not stated anywhere: `[BLOCKED: needs human input]` and the Writer uses «dove la sezione è attiva».
4. **AI costs.** Cruscotto: «L'analisi gira sul modello locale: … non un costo»; Analisi AI per carico: «costo stimato» (wiki); Stato commesse: column «Costo AI · mese». Find what each figure measures; resolve in words without values or vendor names.
5. **Admin «riservato al personale GOPlanner»** (wiki) vs the «Utenti» and «Report» groups visible by permesso (code). Resolve in words (as ch.11 [CONFLICT] 5).
6. **Ch.2's example reason** «da 3 giorni lavorativi» vs `SOGLIA_GIORNI_LAVORATIVI = 2`: confirm the message prints the actual count (consistent) or not.
7. **Ch.5's «Admin › Giro e Stato commesse»** as one page vs two voci in two groups in code.
8. **States of a function request** (wiki: «Ricevuta», «In valutazione», «Pianificata», «Non prevista», «Risposta», «Disponibile») vs `TicketModel` nine states: same model with different labels, or a separate one?
9. **Open button label**: «Apri ticket» (wiki, Ticket page) vs «Apri il ticket» (Gea's card).

### Security filter reminder
No `aws` commands with region or account, no IAM policies, no log-group content beyond the group names in boxes, no real error codes, `request_id` values, device fingerprints, SIM numbers or phone models, no ticket texts or names from Jira or from the ticket tables, no cost values or tariffs, no committente names (the «Report» commessa included), no IPs, hosts, keys, tokens, `.env` values. Example codes and data are invented and declared as such.

---

## TARGET

- **Word count:** 5.500–5.900 words in total (PRD § 4: 4.000–6.000), `## Fonti` excluded. Breakdown: «In questo capitolo» ~80; § 1 800; § 2 850; § 3 1.000; § 4 1.050; § 5 1.100; § 6 900.
- **Opening hook strategy:** open § 1 on one invented Monday morning, said once as invented, with three messages reaching the office — a white screen with «Si è verificato un errore imprevisto» and an 8-character code, an operatore who says «ho chiuso 9 interventi e ne risultano meno», a colleague who asks why their menu says «Utenti» where the staff's says «Admin» — so that in four sentences the reader sees three problems, three tools and one relay: whoever sees the problem, the ticket, the staff tecnico.
- **Closing beat promise:** end § 6 on a desk rule that echoes neither ch.1 nor ch.11 — a problem reaches the staff tecnico with its evidence (pagina, ora e codice; oppure operatore e periodo; oppure il numero del registro), and every staff tool that writes shows its numbers before it writes: whoever reports brings the evidence, whoever acts reads the numbers before confirming.
