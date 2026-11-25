# Chapter 8 — Struttura (Architect spec)

**Chapter title (H1 for the Writer):** `# 8. Gli operatori e l'app GOPlanner 3`
**PRD row:** «Come lavora l'operatore: abbinamento del telefono, scarico degli interventi, esiti, foto, firma, posizione, segnalazioni, comandi remoti approvati dall'ufficio, aggiornamenti; Operatori › Confronto e dashboard» — audience **ALL**.
**Core question of the chapter:** what does the operatore's phone hold, what does it send back and when, and what can the office see and do about it from the gestionale?
**Chapter thesis (the rule the whole chapter proves):** the phone of an operatore keeps its own copy of the work and sends it back when it can. Almost every office question about operatori («non vede l'intervento», «dice di averlo chiuso ma non lo vedo», «dov'era», «l'app non va») is answered by three facts: **which phone is abilitato for which operatore**, **which interventi that phone has received**, and **what it has not sent yet**. The office's levers on the phone are few, explicit and recorded (abilita/disabilita, the day window, the photo stamp, the ricevuta, the comandi remoti with approval), and none of them deletes work the phone has not sent. The only office actions that can make a later send fail are changes to the same interventi on the office side — so the office checks the phone before touching today's work.

**Angle against tribal knowledge:** today, «perché l'operatore non vede l'intervento?» is answered by calling whoever knows the app. The chapter replaces that call with a five-step check, an exact page per step, and the rule behind each step.

**Anti-target guard (PRD § 2, hard):** this is **not** a click-by-click manual of the app for operatori. The app is described from the office's side: what it does, what it sends, which screens the operatore will mention on the phone (only labels the dossier confirms, e.g. «Telefono abilitato», «Chiedi un nuovo codice», «Questo telefono non è più abilitato», «Segnala un problema», «Le mie segnalazioni», «Riprova»), and what the office does about it. No screen-by-screen walkthrough of the Android app.

### Continuity and glossary check (done by the Architect, 25 novembre 2026)
- `chapter_index.md`: not present yet. `NARRATIVE_GLOSSARY.md`: not present yet. Canonical vocabulary = `/home/alan/firstmate/projects/GOPlanner/CONTEXT.md`.
- **Established claims in chapters already written that this chapter must not contradict** (read in `chapter_5.md` and `chapter_6.md`):
  1. `chapter_6.md` § *Intervento ed esecuzione*: after «Verificato» no send from the app overwrites anything, on any commessa; GOPlanner 3 also refuses to rewrite an intervento already Eseguito or Non fattibile; the overwrite risk remains only with the previous app, before verification, on commesse without the office protection. Chapter 8 states the same rule from the phone side in one sentence and points to chapter 6.
  2. `chapter_6.md` § *Verifica*: «Verificato» on an intervento listed among «Interventi mancanti» creates an empty esecuzione; the operatore's later send is then refused by GOPlanner 3 and ignored silently by the previous app. Chapter 8 reuses this as one link in its main chain (§ 4), with the pointer, without re-explaining the Verifica page.
  3. `chapter_5.md`: «Gli interventi assegnati arrivano poi all'app dell'operatore, come spiega il capitolo 8.» Chapter 8 § 2 must deliver exactly that: which interventi arrive, when, and when they leave the phone.
  4. `chapter_6.md` line 13: the path of an intervento from the phone is Eseguito (4), Non fattibile (5), Ripianificabile (8), Utente assente (99). Chapter 8 uses the same codes and the same labels.
- **Continuity defect to flag (not to fix here):** `chapter_6.md` line 67 cites this chapter as «il capitolo 8, *L'app*». The PRD title is *Gli operatori e l'app GOPlanner 3*. The Reviewer of chapter 6 or chapter 8 should correct the pointer in chapter 6. Chapter 8 itself must cite other chapters only with the exact PRD titles (table below) — chapter 6's review lost points for an invented chapter title.
- **Exact chapter titles for pointers (copy verbatim, no paraphrase):** cap. 3 *Utenze, liste, pratiche, lotti e carichi*; cap. 5 *Pianificazione e giri*; cap. 6 *Interventi, esiti e verifica*; cap. 7 *Esportazione e consegna al committente*; cap. 9 *Il magazzino*; cap. 10 *Gea, l'assistente di GOPlanner*; cap. 11 *Utenti, ruoli e permessi*; cap. 12 *Strumenti di amministrazione e diagnostica*; cap. 14 *Il modello dei dati*; cap. 15 *Integrazioni e API*; cap. 16 *Operazioni, qualità e rilasci*.

- **Glossary traps specific to this chapter (Writer and Editor must check all eight):**
  1. **Operatore, never «tecnico» or «utente».** The source docs and even one UI string say «tecnico» (the pairing box of the Dispositivi mobili page reads «Il tecnico legge il codice di 3 caratteri che vede sul telefono.»). In prose: «operatore». Quote the UI sentence only if needed, as a quoted label, never adopt the word.
  2. **«Scarico» is a forbidden word.** The PRD row says «scarico degli interventi», but CONTEXT.md lists «scarico» among the words to avoid (for esportazione). Use the UI's own phrasing: «gli interventi arrivano sul telefono» (Impostazioni: «Quali interventi arrivano sul telefono»), «l'app riceve», «l'elenco del telefono».
  3. **Esito, not «chiusura» or «risultato».** «Chiusura» is a to-avoid synonym of esito. Verb forms are fine («l'operatore registra l'esito», «chiude l'intervento»). The UI label «Ricevuta alla chiusura» is quoted as a label.
  4. **Comando remoto ≠ proposta di Gea.** A proposta is what Gea prepares and the utente confirms with «Autorizza» (CONTEXT.md, and «comando» is a to-avoid word for proposta). A comando remoto is a message to phones that an amministratore confirms with «Approva e invia». Never mix the two buttons or the two nouns.
  5. **Segnalazione ≠ anomalia ≠ ticket.** Segnalazione = what the operatore writes by hand with «Segnala un problema» about the **app** (not about the job). Anomalia = crash, error or warning the app sends **by itself**. Ticket = the item in the back-office Ticket section, where segnalazioni also land. Do not confuse with the Magazzino «Anomalie» (chapter 9) or with «Anomalie di intervento» (AI review, chapter 6). Also keep apart the `segnalazione` text field of the esito (max 25 characters) if the dossier shows it is a different thing: name it only if the dossier says what it is for.
  6. **Telefono in prose; «Dispositivi mobili» / «Telefoni GOPlanner 3» only as labels.** The UI uses both names (see CONFLICT 1 in the Researcher brief). Prose says «telefono».
  7. **Attività** = what an operatore did in the app, with day and time (CONTEXT.md). Use it for the «azioni degli operatori» list of Admin › Errori app e Log; never for an intervento.
  8. **App names:** «app GOPlanner 3» (or «GOPlanner 3») and «l'app precedente» / «GOPlanner 1.x». The login page labels the old app «versione precedente»; the Dashboard labels it «Obsoleta». Never «la vecchia app» as if it were dismissed: the sources show both apps still in use.
- **AI vocabulary rule (hard, as in chapter 6):** only «AI». No model, vendor or provider name, not even in DEV boxes. The push service of the phone is «notifica push» in UFFICIO text; its vendor name may appear at most once in a DEV box.

### Chapter boundaries (one-line pointers only, per PRD § 4 «Confini tra capitoli»)
| Topic touched here | Owned by | What ch.8 may say |
|---|---|---|
| Stati of the intervento, Verifica, «Verificato», Ripianifica, office protection of corrections, «Da finire» on the Verifica page | ch.6 | The phone-side consequence in one sentence + «vedi il capitolo 6, *Interventi, esiti e verifica*». No stato table: ch.6 owns it. |
| Pianificazione, giro, Interventi › Lista «Modifica» | ch.5, ch.6 | Only the consequence on the phone (the intervento leaves one phone and reaches another at the next update) |
| Esportazione delle foto; «Scritta sulle foto» does not change it | ch.7 | One sentence |
| The Magazziniere app, QR, inventario del furgone | ch.9 | One sentence: the same app has a magazzino part on the commesse that use it |
| Gea reading app problems (runbook «problemi con l'app»), Gea opening tickets | ch.10 | One sentence each |
| Permissions «Confronto operatori», `dispositivi.abbinare`, profiles | ch.11 | Say who has the permission in words; how to assign it → ch.11 |
| Admin › Errori app e Log, runbook «dove si è fermato il dato», Ticket section | ch.12 | One sentence each; this chapter says what the operatore and the office see, ch.12 how the staff investigates |
| Table `posizione`, `interventi_eseguiti` columns, `mobile_v3_dispositivi` | ch.14 | DEV boxes only, max 4 lines |
| API envelope, signature `GOP-Sig-1`, inbound sync, MCP port and the motore unico | ch.15 | DEV boxes only, max 4 lines; «la porta MCP» named once in UFFICIO text because the UI box names it |
| Publishing an app release, signing the update, CloudWatch, mobile channel observability | ch.16 | One sentence + pointer |

---

## NUFs (Goal Scoring)

Ten NUFs, so the Editor can score them one point each against the 8.5/10 gate. Format per INSTRUCTION.md § Architect.

```
utility(reader): Reader (amministratore) can abilitare a new phone for an operatore — operatore reads the 3-character code on the phone; Impostazioni › Dispositivi mobili › «Codice» › «Cerca» › «Scegli l'operatore» › «Abilita» (or «Collega telefono» from the operatore's scheda) — knows that the code is valid 24 hours and once, and can «Disabilita» a lost phone knowing that work not yet sent stays on the phone → score += 1

utility(reader): Reader can answer «l'operatore non vede l'intervento» before opening a ticket by checking, in order: the operatore of the intervento; its data pianificata against «Giorni prima di oggi» / «Giorni dopo oggi»; its stato; whether the phone is abilitato and its «Ultimo invio» is recent; the visibility of the operatore (attivo, lotti) → score += 1

utility(reader): Reader can say what reaches the office when the operatore registers an esito — the esito with its motivo, letture and note, the foto with the «Scritta sulle foto», the firma with the optional printed name, the posizione with its source or the motivo of its absence («permesso negato», «GPS spento», «nessun fix») — and where in the gestionale each piece is visible → score += 1

utility(reader): Reader can tell apart the four reasons why «the phone did not send»: work still queued on the phone (no network → «Riprova»), work refused by the server (e.g. the intervento was reassigned or verified in the meantime, or the phone clock is wrong), a segnalazione the operatore wrote with «Segnala un problema», an anomalia the app sent by itself — and knows where each one is seen (Operatori › Dashboard «Ultimo invio», Ticket, Admin › Errori app e Log, Gea) → score += 1

utility(reader): Reader (amministratore) can approve or refuse a pending comando remoto within 60 minutes from the box «Comandi in attesa di approvazione» («Approva e invia» / «Rifiuta»), knows what each of the seven commands does, and can tell from Operatori › Dashboard («Versione app»: Aggiornata / Precedente / Obsoleta; «App da aggiornare») which phones need the update and where the operatore downloads it (login page and QR; «beta»; «versione precedente») → score += 1

utility(reader): Reader can read Operatori › Dashboard (one operatore at a time) and Operatori › Confronto (each operatore against the mediana of the squadra): choose Periodo and Lotto, read the signals «Non fattibili alti», «Pochi interventi», «Poche foto», the «n.d.» / «non misurabile» cells and the motivi dei non fattibili, and explain why an operatore is «fuori dal confronto» → score += 1

utility(emotional): Reader feels safe using the office's levers on the phone — disabilitare, comandi remoti, aggiornamento — because none deletes work the phone has not sent; and knows the one habit that prevents a lost visit: look at the phone's «Ultimo invio» before moving, verifying or deleting today's interventi of that operatore → score += 1

utility(emotional): Reader knows where to stop and ask the staff tecnico: the Dispositivi mobili page says the GOPlanner 3 phone management is not available; comandi remoti are not active on the commessa; a phone broken or lost with unsent work; a phone refused for its clock that keeps failing after the time is fixed; a new app release to publish → score += 1

utility(factual): The chapter states, each with its source: code of 3 characters valid 24 hours and once, the app checking every 30 seconds (`docs/mobile-v3/abbinamento.md`, `Smarty_templates/it/dispositivi.html`); phone clock tolerated within ±300 seconds (`abbinamento.md` § firma); foto and firma max 20 MB, firma PNG only, note max 2.000 characters (`docs/mobile-v3/foto-upload.md`, `firma.md`, `esito-write.md`); comando remoto: request valid 60 minutes, message max 500 characters, no command deletes data on the phone, default limit of 10 commands per phone in a time window (`docs/mobile-v3/comandi-remoti.md`, `wiki/assistenza-clienti/approvazione-comandi-remoti.md`) → score += 1

utility(factual): The chapter states, each with its source: Dashboard «Eseguiti» = stati 4, 6, 7; km in straight line, positions with precision over 100 m discarded, moves under 30 m treated as noise, jumps over 160 km/h discarded, gaps over 30 minutes restart the count; quality warning under 80% (`docs/02-patterns/53-operatori-dashboard.md`, `lib/OperatoriDashboard.php`); Confronto: at least 5 giornate di lavoro to enter, at least 4 operatori for signals, no fixed thresholds, last 21 working days, tempo sul posto reliable only with at least 30 measured interventi in the squadra and at least 5 measures per operatore (`wiki/assistenza-clienti/pagina-operatori-confronto.md`, `docs/02-patterns/54-operatori-confronto.md`, `lib/OperatoriConfronto.php`) → score += 1
```

---

## BEAT LIST

Six sections (`##` in the final chapter). Each needs: italic audience line at the top when not for everyone (STYLE_BIBLE § Voice rule 6), at least one exact concrete detail, at least one **Limite** paragraph, max 5 prose paragraphs in a row without a table, list, box or subheading. Every section ends with a one-line **Sintesi** (the rule to remember).

Before § 1 the Writer puts the mandatory `*In questo capitolo…*` paragraph (2–3 sentences): the phone keeps its own copy of the work; what the office can see and do about it; for everyone, with italic lines marking the parts for amministratori and the boxes for developers.

**Structural spine (state it once in § 1, reuse in § 2 and § 4):** the three questions — *quale telefono*, *quali interventi*, *che cosa non ha ancora inviato*. § 1 answers the first, § 2 the second, §§ 3–4 the third; § 5 is the office's levers; § 6 is reading the squadra.

---

### § 1 — `## Il telefono dell'operatore: abbinare, abilitare, disabilitare`
**Tag:** [UFFICIO] — the procedure part for amministratori (italic line: *Per gli amministratori della commessa; gli altri possono leggere solo il primo e l'ultimo paragrafo.*). One `> **Per gli sviluppatori:**` box.
**Core question:** how does a phone become the phone of one operatore, how does the office stop it, and what happens to the work on it?
**Word target:** 950 (range 850–1.100)
**Paragraph functions:** Aggancio (the opening case, see TARGET) → Spiegazione (the three questions; why pairing replaces the old phone identifiers) → Procedura (abilitare) → Procedura (disabilitare) → Dimostrazione (what the page shows per phone) → contro-obiezione → Limite → Sintesi.

**Content plan**
- Opening case (invented and declared as such; see TARGET) → the three questions. One sentence: the rest of the chapter follows them in order.
- How pairing works, in office words: at the first opening the app creates its own key, which never leaves the phone; it asks the server for a **3-character code**, valid **24 hours** and usable once; the operatore reads it to the office; the office enables; the app checks about every **30 seconds** and shows «Telefono abilitato». The server never hands a password to the phone. A new key (app reinstalled, phone reset or changed) is a new phone and needs a new pairing.
- At pairing the operatore accepts the **informativa** on position and personal phone, shown at every pairing; the server records version and time. One sentence, it is the balancing context for positions in § 3 and § 6.
- `### Abilitare un telefono` — numbered procedure: 1. Impostazioni › Dispositivi mobili; 2. type the code in «Codice» (case does not matter); 3. «Cerca»; 4. check what the page shows («Telefono», «App», «Richiesta del», «Codice valido fino al», «ID dispositivo»; if shown, «Questo telefono era stato disabilitato e chiede di essere riabilitato.»); 5. «Scegli l'operatore» (only operatori of the commessa); 6. «Abilita».
- Alternative path: from the operatore's scheda (Operatori › Elenco operatori, edit window, field «Dispositivo»): lists the operatore's enabled phones (model, app version, ID dispositivo), with «Collega telefono» and «Disabilita». Same permission, same record. An operatore may have more than one phone.
- `### Disabilitare un telefono` — the row action «Disabilita» in the phone list (filters: Stato, Operatore, Abilitato dal/al, Ultimo uso dal/al, «Filtro Avanzato»). From that moment the phone is refused on every request and shows «Questo telefono non è più abilitato». To re-enable it the phone asks for a new code («Chiedi un nuovo codice») and the office uses it.
- The «ID dispositivo» (8 characters) is the reference to give the staff tecnico; it is not the pairing code and it is not secret. Do not print a real one: an invented example only if needed, declared as invented.
- Every event (registrato, codice emesso, abilitato, disabilitato) is recorded with the utente and the commessa, never with keys or codes.
- **Contro-obiezione 1:** «Se disabilito il telefono perso, l'operatore perde gli esiti che non aveva ancora inviato?» → No: the work not sent stays on the phone; the server does not touch it and has no command that deletes it. Recovering it from a phone that is broken or lost is a question for the staff tecnico, with no promise: the dossier must say whether a recovery service exists (the doc describes it as **not built**) — the Writer states what the dossier says, nothing more.

**Limite (mandatory):** only the amministratori of the commessa with the permission to pair phones see the page (others read «Solo gli amministratori del cliente possono abilitare o disabilitare i telefoni.» — quote verbatim only if the dossier confirms the string; the word «cliente» stays inside the quote); the page exists only where GOPlanner 3 is allowed for the commessa; if the GOPlanner 3 tables are missing, the page shows an error that it is not available (exact text from `pages/dispositivi.php`) → staff tecnico; phones of GOPlanner 1.x are not on this page.

**DEV box (≤ 4 lines):** key pair EC P-256 created in the phone's keystore; `device_id` = first 32 hex characters of the SHA-256 of the public key; every `/v3/` request is signed (`GOP-Sig-1`); pages `pages/dispositivi.php`, `lib/MobileV3/Device/OfficeDevices.php`; details → chapter 15, *Integrazioni e API*.

**Key facts the Researcher must find**
- Exact menu path and page title: «Impostazioni › Dispositivi mobili» vs. «Telefoni GOPlanner 3» (CONFLICT 1).
- Exact labels of the pairing box, the found-phone card, the list columns and filters (`Smarty_templates/it/dispositivi.html`, `js/code/dispositivi.js`, `lib/flexifields_defaults.php` voce `dispositivi`).
- Exact texts shown by the app: «Telefono abilitato», «Chiedi un nuovo codice», «Questo telefono non è più abilitato» (`abbinamento.md` refers to `_C`, `_D`, `_4_codice` screens: find the Italian strings if they are in the repository; if not, mark `[UNVERIFIED]` and the Writer does not quote them).
- Who can open the page: `users.tipo` 0 or 1 and permission `canViewDispositivi` / `dispositivi.abbinare` / `dispositivi.vedere` — translate into words for the reader.
- The operatore scheda path (GOP-600): field «Dispositivo», button «Collega telefono» — exact labels and menu path.
- Recovery of unsent work: confirm «aggancio, non costruito» in `abbinamento.md` § «Chiave di recupero del lavoro non inviato»; check Jira for a later ticket.
- Whether the pairing tables (`migrations/main/0001…0004`) are applied in production at 25/11/2026 (CONFLICT 3).
- One real ticket story about pairing (expired code, phone changed, operatore moved to another commessa → `device_revoked`) — problem → cause → remedy, no personal data.

---

### § 2 — `## Quali interventi arrivano sul telefono`
**Tag:** [TUTTI] (the settings subsection is for amministratori: italic line). One DEV box.
**Core question:** which interventi does the phone receive, when does it notice a change made in the office, and why can an operatore not see an intervento the office can see?
**Word target:** 900 (range 800–1.050)
**Paragraph functions:** Aggancio (the most common phone question to the office) → Spiegazione (the rule: operatore + window + stato) → Spiegazione (the phone list follows the server) → Procedura (diagnosis, numbered) → contro-obiezione → Limite → Sintesi.

**Content plan**
- The rule in one sentence, then explained: the phone receives the interventi **assigned to the operatore of that phone** (the operatore comes from the pairing, never from the request) with a «Data pianificata» inside a window of days before and after today. Which stati are included: from the dossier only (see key facts).
- `### La finestra dei giorni` — *Per gli amministratori.* Impostazioni › Generale, section «Telefoni GOPlanner 3» («Valgono per tutto il cliente» — label): «Giorni prima di oggi», «Giorni dopo oggi»; empty = the value of the commessa, shown under the field («Vuoto = …»). Quote the help text: «Quali interventi arrivano sul telefono: quelli con data compresa tra questi giorni prima e dopo oggi.» It does not change GOPlanner 1.x. One example of real values only if the dossier gives one and only as «su una commessa» (the doc shows 7 days back and 10 ahead on one commessa).
- The list on the phone follows the server: at each update the app removes the interventi the server no longer sends. Consequence chain: the office moves an intervento to another operatore (Interventi › Lista › «Modifica», chapter 6) → it leaves the first phone and reaches the second **at the next update**. When the phone updates (on opening, on a pull, on a push notification, on a timer): from the dossier only.
- What the operatore sees on each intervento, in one bulleted list of 4–6 items: address, utenza code, tipo, matricola, appointment if any, stato, note, the campi personalizzati and the read-only «campi informativi» of the commessa (`docs/mobile-v3/campi.md`, `campi-informativi.md`). No click-through.
- The foto history of an utenza is readable from the phone (storico foto): one sentence, with the rule of which foto are shown (from the dossier; the doc marks the rules «da confermare»).
- `### L'operatore non vede un intervento` — numbered diagnosis, one check per step, each with the page: 1. is the intervento assigned to that operatore (Interventi › Lista, filter Operatore)? 2. is the «Data pianificata» inside the window (Impostazioni › Generale)? 3. is the stato one the phone receives? 4. is the phone abilitato for that operatore and is its «Ultimo invio» recent (Impostazioni › Dispositivi mobili; Operatori › Dashboard)? 5. does the operatore pass the visibility checks (attivo, nascosto, lotti: `wiki/assistenza-clienti/diagnostica-visibilita-operatore.md`)? 6. still missing → ask Gea or the staff tecnico (one sentence + «vedi il capitolo 10» / «vedi il capitolo 12»).
- **Contro-obiezione 2:** «Ho spostato l'intervento su un altro operatore: perché il primo lo vede ancora?» → the first operatore's phone has not updated yet; it drops the intervento at the next update; where comandi remoti are active, the amministratore can send «sincronizza» (§ 5). Do not promise a time the dossier does not give.

**Limite (mandatory):** the window is one value for the whole commessa (not per operatore); it does not apply to GOPlanner 1.x, which keeps its own settings; a phone without network keeps showing its last list (so an intervento cancelled in the office can still appear until the phone updates — only if the dossier confirms); the magazzino part of the app follows other rules (one sentence + «vedi il capitolo 9, *Il magazzino*»).

**DEV box (≤ 4 lines):** `GET /v3/interventi`; window in `lib/MobileV3/Domain/FinestraInterventi.php` (order: tenant row in `impostazioni`, then `$custom['mobile']`, then the 1.x `$conf`); change detection by `row_hash` / `list_hash` and `ETag` (304 when nothing changed); the list is an authoritative snapshot. → chapter 15.

**Key facts the Researcher must find**
- Which stati `GET /v3/interventi` returns (`lib/MobileV3/Bridge/LegacyInterventi.php`, `lib/MobileV3/Resource/InterventiController.php`): only Assegnato (3)? also Prenotato (10), Ripianificabile, «Da finire» (rapportino, stato 3)? Exact rule.
- When the app updates its list: on opening, timer, push event (`docs/mobile-v3/push.md` § Eventi tipizzati), `sincronizza` command. If only the app repository knows, mark `[UNVERIFIED]`.
- Exact labels and help text of the «Telefoni GOPlanner 3» block in `Smarty_templates/it/impostazioni.html` (lines ~88–100) and the gate `OfficeDevices::allowed()`.
- Fallback order of the window (`FinestraInterventi::applica`), and the default when nothing is set.
- Whether an intervento removed from the phone list while the operatore has an unsent esito for it keeps the esito in the phone's queue (the key link to § 4).
- `docs/mobile-v3/campi.md` and `campi-informativi.md`: what is editable vs read-only on the phone.
- `docs/mobile-v3/storico-foto.md` § Regole: which foto, how many, how far back; status «da confermare».
- `docs/mobile-v3/ricerca-assegnazione.md`: does the operatore search and self-assign utenze (`features.auto_assegnazione`)? If yes, on which commesse — one sentence in § 2 only if confirmed and tenant-limited.

---

### § 3 — `## Registrare l'esito: foto, firma e posizione`
**Tag:** [TUTTI], with `### La scritta sulle foto e la ricevuta` for amministratori (italic line). One DEV box.
**Core question:** what exactly does the operatore send when registering the esito of an intervento, in what order, and what does each piece become in the office?
**Word target:** 1.100 (range 950–1.200)
**Paragraph functions:** Aggancio (one intervento, four kinds of data) → Spiegazione (the esito) → Dimostrazione (what an esito carries, table) → Spiegazione (foto, firma) → Spiegazione (posizione) → contro-obiezione → Limite → Sintesi.

**Content plan**
- The esito: the operatore chooses one esito from the list of the commessa (labels can change per commessa); each esito says whether it closes the intervento. The stato each one writes belongs to chapter 6: one sentence with the codes (Eseguito 4, Non fattibile 5, Ripianificabile 8, Utente assente 99) + «vedi il capitolo 6». The save-halfway esito does not close and can be sent more than once; on some commesse its label is «Da finire» (one sentence, label as in ch.6, never «Rapportino» in UFFICIO text).
- Table «Che cosa porta un esito» (columns: dato · regola · dove si vede in ufficio): esito; motivo of a non fattibile (where the commessa records it; GOPlanner 1.x closures do not carry it); letture (stored as typed, max 100 characters each); note (max 2.000 characters); campi personalizzati of closure; date and time of the esito; posizione. The «dove si vede» column from the dossier (Verifica «Dati rilevati», Interventi › Lista, exports).
- `### Foto e firma` — foto: JPEG or PNG, max **20 MB**, a PNG is saved as JPEG; each foto has a tipo; taken with the camera or chosen from the gallery (the server records which, if the dossier confirms it is visible). Firma: PNG only, max 20 MB, with an optional printed name (max 100 characters); it is stored like a foto with a reserved tipo, so the PDF documents of the commessa (e.g. «Verbale», chapter 6) read it. Order: foto and firma travel first, the esito names them; if one has not arrived yet, the server waits and the app retries (`dependency_pending`), nothing half-written.
- `### La scritta sulle foto e la ricevuta` — *Per gli amministratori.* Impostazioni › Generale: «Scritta sulle foto» — the line the phone prints on every foto (data, matricola, coordinate, others); «Modello» shows «Predefinito», «Personalizzato» or «Non valido» (then phones use the default); «Modifica…»; «Anteprima con dati inventati». Applies to GOPlanner 3 only; GOPlanner 1.x and the esportazione delle foto do not change (pointer ch.7). «Ricevuta alla chiusura»: with the box ticked, the app offers to print the ricevuta when the operatore closes an intervento; off by default.
- `### La posizione` — two different data, keep them apart:
  - **Posizione dell'esito:** where the intervento was closed, saved on the esecuzione; it is either the current fix or the last one taken before, with its age (`fix_source` «attuale» / «ultima rilevata», `fix_age_s`). When there is none, the app says why: **permesso negato**, **GPS spento**, **nessun fix** (GOP-621). The office reads the absence and its motivo, not an empty value.
  - **Posizioni durante la giornata (tracciamento):** sent only on commesse that record them and only after the operatore's consent; the office can invite the operatore («invita tracciamento», § 5) but cannot switch it on. They feed the km of § 6.
  - The phone reports which permissions it has (position precise and in background, camera, notifications): column «Permessi» in Impostazioni › Dispositivi mobili, badges «concesso», «negato», «negato per sempre», «non richiesto», the note «manca la posizione», filter «Permessi» with «Senza posizione» and «Mai riportati».
- **Contro-obiezione 3:** «L'esito è arrivato senza posizione: l'operatore non era sul posto?» → the absence is recorded with its motivo; a «permesso negato» shows in the «Permessi» column and is fixed on the phone; a «nessun fix» in a basement says nothing about presence. The chapter must not suggest a conclusion about the operatore.
- Backoffice use: where allowed, the office can use the closing position as the position of the utenza (`docs/mobile-v3/intervento-posizione.md` § Backoffice) — one sentence, only if the dossier confirms the UI path.

**Limite (mandatory):** the list of esiti, the campi and the motivi change by commessa; the start and end times of an intervento sent by the app are accepted but **not stored** at the time of the sources (so the office cannot read the time spent from them — link to «Tempo sul posto» estimated from foto in § 6; CONFLICT 5); some commesse with their own closing logic were held back from the GOPlanner 3 closing path (`esito-write.md` § Rischi per tenant) — say «alcune commesse» only, no list; the foto cannot be modified from the back office (consistent with ch.6).

**DEV box (≤ 4 lines):** `POST /v3/interventi/{id}/foto`, `/firma`, `/esito`, `PUT /v3/interventi/{id}/posizione`; each write carries an `Idempotency-Key`, so the same retry never writes twice; files `lib/MobileV3/Domain/FotoStore.php`, `EsitoWriter.php`; firma tipo 99 (firma del cliente) and 98 (domiciliazione) in `foto`. → chapters 14 and 15.

**Key facts the Researcher must find**
- `lib/MobileV3/Domain/EsitoCatalog.php` `DEFAULTS`: ids, default labels, `chiude`, `positivo`; how a commessa overrides labels (`esiti.md` § Configurazione per tenant).
- `esito-write.md`: field limits (note 2.000, letture 100, `segnalazione` 25 — and what that field is), `posizione_assente_motivo` values and how the office sees them (which page shows «posizione assente» and the motivo? Verifica «Dati rilevati»? grep `posizione_assente` in `js/code/verifica_unica.js`, `lib/VerificaInterventi.php`).
- `foto-upload.md`, `firma.md`: limits, PNG→JPEG, `source` camera/gallery and whether the office sees it.
- `impostazioni.html` lines ~107–140: exact labels of «Scritta sulle foto» and «Ricevuta alla chiusura»; `bootstrap-interventi.md` § `photo_stamp` (GOP-695) and § `receipt`.
- `device.md` § tracking-consent and `posizioni.md`: who can send positions, consent, which commesse record them (`features.tracking`).
- `dispositivo-permessi.md` § Back-office: exact badge texts, filter labels.
- `inizio`/`fine` not persisted: confirm on `php8` (`esito-write.md` § Rischi 4 vs ADR 53, CONFLICT 5).
- GOP-621 story (why posizione assente was added): problem → cause → fix, no personal data.

---

### § 4 — `## Quando il dato non arriva: coda, rifiuti, segnalazioni e anomalie`
**Tag:** [TUTTI], with one `> **Quando chiedere allo staff tecnico:**` box. One DEV box.
**Core question:** when the office does not see what the operatore says was sent, where is the data — still on the phone, refused by the server, or never recorded — and who sees what?
**Word target:** 1.000 (range 900–1.150)
**Paragraph functions:** Aggancio (the opening case returns) → Spiegazione (the queue) → Dimostrazione (table of the four channels) → Spiegazione (refusals caused by office actions — the main tension) → Procedura (what the office does) → Limite → Sintesi.

**Content plan**
- The queue: the app keeps esiti, foto and firme on the phone and sends them when it can; without network nothing is lost, it waits. «Riprova» on the phone resends what is queued and what was refused with a retryable error. The server writes each item once even if the phone resends (idempotency) — **state this only for GOPlanner 3**; for the previous app the runbook says deduplication is not yet in production (CONFLICT 2).
- Table «Quattro strade, quattro posti dove guardare» (columns: che cosa è successo · che cosa vede l'operatore · dove guarda l'ufficio · chi agisce):
  1. *In coda sul telefono* (no network, phone off) → work waiting, «Riprova» → Operatori › Dashboard «Ultimo invio» → wait or ask the operatore to open the app with network.
  2. *Rifiutato dal server* → refused send on the phone (label from the dossier) → Admin › Errori app e Log, Gea («problemi con l'app») → depends on the reason (below).
  3. *Segnalazione* («Segnala un problema», about the app, not the job) → «Le mie segnalazioni» → the Ticket section of the back office (chapter 12).
  4. *Anomalia* (crash, error, warning sent by the app by itself) → nothing to do → Admin › Errori app e Log; Gea → staff tecnico.
- `### Quando è l'ufficio a far rifiutare un invio` — the core chain of the chapter, built from the dossier: an esito registered offline arrives **after** the office has changed that intervento:
  - reassigned to another operatore → the server refuses it as an intervento of another operatore (`not_found`);
  - already verified or otherwise blocked by the office (stato 6 or higher, including 8 and 99) → refused, the office version is never overwritten (`intervento_locked`) — consistent with ch.6;
  - already closed with a different esito → refused (`already_closed`);
  - verified from «Interventi mancanti» before the phone sent → the same refusal, see ch.6.
  Resolution (habit): before moving, verifying or deleting **today's** interventi of an operatore, look at «Ultimo invio»; if it is older than the morning, ask the operatore whether the phone still has work queued. What can be done after a refusal (correct the stato and let the phone retry with «Riprova» / «ritenta invii»?): **only what the dossier confirms** (`esito-write.md` says `intervento_locked` and `already_closed` are re-evaluated on an identical retry after the office corrects the stato; check whether `not_found` is stored as definitive).
- Phone clock: a phone whose clock is wrong by more than 5 minutes is refused on every request; fixing the time (automatic time) and retrying sends the queue. Gea's runbook names it («un orologio del telefono sbagliato»).
- `### Le segnalazioni degli operatori` — the operatore writes a problem or a suggestion about the app; the app may attach a cleaned diagnostic log and a screenshot (from the dossier); in «Le mie segnalazioni» the operatore sees the segnalazioni of the commessa (privacy: what of colleagues is hidden, from `segnalazioni-operatori.md` § Cosa vede l'operatore), confirms one of a colleague («capita anche a me»), says a closed one is not solved, gets similar open ones while writing, and is told when the fix reaches production. In the back office they appear in the Ticket section (source «app»). Pointer ch.12.
- **Quando chiedere allo staff tecnico** box (3–4 lines): the phone keeps failing after «Riprova» with network and the right time; a phone broken or lost with work queued; a refused send the office cannot explain; the «Ultimo invio» of many operatori stopped at the same hour.

**Limite (mandatory):** the office does not see the content of the queue of a phone; the staff tecnico sees how much work a phone has queued through the app's signal every 5 minutes (heartbeat) — staff tool, pointer ch.16; Admin › Errori app e Log is read-only and its detail is for the staff (ch.12); a problem the app never recorded (phone off, no network) is not visible anywhere; GOPlanner 1.x crashes come from a different log (one sentence).

**DEV box (≤ 4 lines):** envelope errors carry `retryable`; the app stores only 2xx and non-retryable 4xx under the `Idempotency-Key`; `request_id` links phone, server and logs (GOP-264, runbook «dove si è fermato il dato»); heartbeat `POST /v3/heartbeat` every 5 minutes. → chapters 15 and 16.

**Key facts the Researcher must find**
- `envelope.md` lines ~81–160: error table with `retryable`; which errors are stored under the idempotency key (`not_found`?); the exact rule for `intervento_locked` / `already_closed` on retry (`ApiError::STATE_DEPENDENT`).
- `lib/MobileV3/Resource/InterventiEsitoController.php`: confirm `not_found` for an intervento of another operatore and whether it is retryable.
- What the app shows for a definitively refused send (label), and whether «Riprova» exists with that label (app strings — `[UNVERIFIED]` if not in this repository).
- `clock_skew` tolerance ±300 s (`abbinamento.md`), and the Italian wording in `wiki/assistenza-clienti/runbook-problemi-app-operatori.md`.
- `docs/mobile-v3/segnalazioni.md`, `segnalazioni-operatori.md`: tipi, attachments (log, screenshot), «Le mie segnalazioni», confirmation, reopening, similar, notification when in production, retention; migrations «preparate, NON applicate» (CONFLICT 3); ADR 48 ticketing (`docs/02-patterns/48-ticketing-base.md`): how they show in Ticket.
- `docs/mobile-v3/anomalie.md`: offline encrypted queue, retention; where the office sees them (Admin › Errori app e Log? `wiki/assistenza-clienti/pagina-admin-errori-app-e-log.md`).
- `docs/mobile-v3/heartbeat.md`: every 5 minutes and at every opening; what it contains (queue size, last send error, network) — staff only.
- `wiki/assistenza-clienti/runbook-dove-si-e-fermato-il-dato.md` line 39 (deduplication not in production) vs `esito-write.md` (`Idempotency-Key`): resolve per app version (CONFLICT 2).
- One real case (Jira or wiki) of an esito refused because of an office action or a phone clock — problem → cause → remedy, no personal data.

---

### § 5 — `## Le leve dell'ufficio sul telefono: comandi remoti e aggiornamenti`
**Tag:** [UFFICIO] for amministratori (italic line), with one [STAFF] paragraph and one DEV box.
**Core question:** what can the office make a phone do from afar, who decides, and how does the app get updated?
**Word target:** 1.000 (range 900–1.150)
**Paragraph functions:** Aggancio (a command from an agent waits for a person) → Dimostrazione (the seven commands, table) → Procedura (approve) → Spiegazione (recapitato vs eseguito; app versions) → Spiegazione (updates) → contro-obiezione → Limite → Sintesi.

**Content plan**
- Principle first: on the commesse where comandi remoti are active, a command sent to phones by an agent or by the office through the MCP port does **not** leave until an amministratore of the commessa approves it in the gestionale; the approver is recorded. No command deletes data on the phone, and the catalogue does not allow one.
- Table «I comandi» (comando · che cosa fa il telefono · da quale versione): send a message (shown as notification and in the app, max 500 characters); sincronizza (interventi, magazzino or configurazione); ritenta invii (like «Riprova»: resends queued and retryable-refused work; deletes nothing; does not touch definitive refusals); richiedi log (uploads the cleaned diagnostic log as a segnalazione «Log richiesto dall'ufficio», without asking the operatore); invita al tracciamento (shows the invitation; no position leaves without consent); apri intervento; aggiorna app (offers the update). Three of them only from app 3.0.0; older builds ignore them.
- `### Approvare un comando` — numbered: 1. Impostazioni › Dispositivi mobili; 2. box «Comandi in attesa di approvazione» («Mandati da un agente o dall'ufficio dalla porta MCP: non partono finché non li approvi qui.»); 3. read «Comando», «Telefoni», «Richiesto», «Valido fino»; 4. «Approva e invia» or «Rifiuta». Rules: valid **60 minutes**, then it must be sent again; approval only from this page with one's own session (not from an agent, not from an API); phones are re-read at approval and limited to those listed (a phone disabled meanwhile receives nothing; one enabled after does not receive it); the text of the command is kept only while pending; on test commesse it leaves at once.
- Recapitato ≠ eseguito: the sender sees per phone whether the push was accepted and whether the app confirmed (states from the dossier: non recapitato, recapitato, eseguito, fallito, rifiutato, non supportato). A phone that never sent its push token cannot be reached. Limit: by default 10 commands per phone in a time window (say the window only if the dossier gives it).
- `### Aggiornare l'app` — GOPlanner 3 is installed and updated outside the app store. The operatore downloads it from the login page of the gestionale (link and QR, no version written; marked «beta» when the release is a test build; the previous app below as «versione precedente»); if no release is available the page says the download is not available. Updates: optional or mandatory; a phone below the minimum accepted version is refused until it updates — the update route stays open for it (from the dossier: what the operatore sees). The office sees who needs it in Operatori › Dashboard («Versione app»: Aggiornata / Precedente / Obsoleta; the warning «App da aggiornare»; GOPlanner 1.x counts as Obsoleta) and can send «aggiorna app» where commands are active (outcomes: accepted, already up to date, mandatory started, postponed by the operatore, check failed).
- [STAFF] one paragraph: the update is signed outside the server by people, never by agents; the server only checks the signature before offering it; publishing a release is in chapter 16, *Operazioni, qualità e rilasci*.
- **Contro-obiezione 4:** «Ho approvato il comando, ma il telefono non ha fatto niente.» → check in order: approved within 60 minutes? phone still abilitato? app version understands the command (3.0.0 for the three new ones)? push token present? «recapitato» but not «eseguito» = the phone has not confirmed yet (off, no network).

**Limite (mandatory):** comandi remoti work only on the commesse where GOPlanner staff has activated them (by default only a test commessa — the Writer says «solo sulle commesse dove lo staff tecnico li ha attivati», no tenant codes, no variable names); without the approvals table, commands on a production commessa answer that the service is not available → staff tecnico; the office cannot send commands to GOPlanner 1.x phones through this channel; commands are sent by agents or through the MCP port, not from a button of this page (the page only approves) — confirm in the dossier whether any office page sends commands directly; how an agent prepares them → «vedi il capitolo 15, *Integrazioni e API*».

**DEV box (≤ 4 lines):** `lib/MobileV3/Push/` (`EventCatalog`, `CommandStore`, `CommandDispatcher`), ack `POST /v3/device/commands/{request_id}/ack`; approvals in `mobile_v3_comandi_approvazioni` (migration 0031); MCP tools are writes of the motore unico (ADR 42) with a two-step confirmation code valid 5 minutes; update route `GET /v3/app/update` is public and exempt from the minimum-version refusal.

**Key facts the Researcher must find**
- `docs/mobile-v3/comandi-remoti.md` full: table of commands, minimum versions, ack states, `MCP_COMANDI_LIMITE` default and window, approval rules; `wiki/assistenza-clienti/approvazione-comandi-remoti.md`; GOP-784, GOP-787 (and the changeset `changeset/2026-11-19-gop-787-approvazione-comandi-remoti.md`).
- Which commesse have commands active in production at 25/11/2026: if not in the sources → `[BLOCKED: needs human input]`; the chapter then stays generic.
- Migration 0031 applied in production? (CONFLICT 3).
- `docs/mobile-v3/aggiornamento.md` §§ `GET /v3/app/update`, Pubblicare un rilascio (only: who signs, optional vs mandatory), Collegamento di download nella pagina di login; `pages/login.php`, `Smarty_templates/it/login_new.html`, `scarica_app.php`: exact labels («beta», «versione precedente», the not-available message).
- What the operatore sees when the version is below the minimum (426): app string or `[UNVERIFIED]`.
- `aggiorna_app` outcome details (`accepted`, `up_to_date`, `mandatory`, `declined`/`later`, `check_failed`) — translate into words.
- Push tokens (`docs/mobile-v3/push.md`): what «no_token» means for the office.

---

### § 6 — `## Operatori › Dashboard e Confronto: leggere il lavoro della squadra`
**Tag:** [UFFICIO] (italic line: *Per chi coordina gli operatori; il Confronto richiede un permesso.*). One DEV box.
**Core question:** how does a supervisor read, operatore by operatore and against the squadra, what the phones returned — without turning it into a ranking?
**Word target:** 1.050 (range 950–1.200)
**Paragraph functions:** Aggancio (the question «chi va guardato?») → Spiegazione (two pages, two questions) → Dimostrazione (Dashboard columns table) → Spiegazione (Confronto: squadra, mediana, signals) → Dimostrazione (a reading of one invented row, declared as invented) → contro-obiezione → Limite → Sintesi.

**Content plan**
- Two pages under Operatori, next to «Elenco operatori»: **Dashboard** looks at one operatore at a time (with the app, the km, the foto); **Confronto** puts each operatore against the mediana of the squadra. Both: «Periodo» («Oggi», «Ultimi 7 giorni», «Ultimi 30 giorni», «Ultimi 90 giorni»), «Lotto» («Tutti» or one), «Excel». A utente with assigned lotti sees only the operatori of those lotti.
- `### La Dashboard` — table of columns (colonna · che cosa conta · quando dice «n.d.»): «Versione app» (Aggiornata / Precedente / Obsoleta, rule from ADR 53); «Eseguiti» (stati 4, 6, 7 by date of the esito); «Km» (straight-line sum of consecutive phone positions; precision over 100 m discarded; under 30 m noise; over 160 km/h a GPS jump; over 30 minutes between points the chain restarts; km ignore the Lotto filter); «Foto»; «Qualità foto» (only where the AI analysis is active: conforming foto / analysed foto; warning under 80%); «Tempo medio sul posto» (measured if the app records start and end, otherwise **estimated** from first to last foto of the same intervento — the page says so); «Ultimo invio» (the most recent among phone use, the old app's ping, last position). Clicking a row opens the last 10 working days. A missing source shows «non disponibile» with the reason, never a 0 that looks like data.
- `### Il Confronto` — permission «Confronto operatori» (given normally to amministratori and pianificatori; how to assign → chapter 11). Entry rule: at least **5 giornate di lavoro** in the period (a day with at least one esito, eseguito or non fattibile); the others go to the bottom in grey, «fuori dal confronto», out of the mediane; with «Oggi» nobody enters. Columns: «Operatore», «Eseguiti» (with gap % from the mediana), «Non fattibili» (share and count), «Int./giornata», «Foto/int.», «Min sul posto», «Km/giorno», «Ultimi 21 gg lav.», «Segnali». Signals: «Non fattibili alti», «Pochi interventi», «Poche foto» — appear when a value is outside the central half of the squadra on the side worth a look; **no fixed thresholds**; only with at least **4 operatori** in the comparison; being above for interventi or foto is never a signal. «Tempo sul posto» and «Km» show «non misurabile» with the reason when the data are not reliable (rules from the wiki: fewer than 30 measured interventi in the squadra; with the foto estimate, median under one minute between first and last foto; at least 5 measures per operatore; km not measurable if the commessa does not record positions or fewer than half of the operatori sent them). Detail panel: the 21-day bars, the numbers next to the mediana, the motivi dei non fattibili (most frequent first, «Non indicato» last; GOPlanner 1.x closures carry no motivo).
- Invented reading (declared as invented, 4–5 lines): one operatore with «Non fattibili alti» and the motivi in the detail mostly «utente assente» in one zone → the conversation is about the zone and the appointments, not about the operatore.
- «Attivo» means: has closed at least one intervento in the period (runbook «operatori attivi»), not «present in the anagrafica» — one sentence, because the Dashboard also lists operatori with an enabled phone who did not work.
- **Contro-obiezione 5:** «Il Confronto segna Non fattibili alti: l'operatore lavora male?» → No by itself: it says that operatore's share is above the central half of the squadra in that period; zones and lists differ; read the motivi; the page has no podium, no score, no target.

**Limite (mandatory):** «Tempo sul posto» is an estimate on the commesse where the app does not record start and end (on the commesse checked on 13 novembre 2026 the start and end were always empty — state only as «sulle commesse verificate», CONFLICT 5); «Qualità foto» exists only where the AI analysis of the foto is active (chapter 6); «Km» exist only where the commessa records positions, and only with the operatore's consent (§ 3); the Confronto was tested on invented data on a local bench, not on a customer's data (wiki «Non verificato») — the Writer may say it is recent (GOP-873, 24 novembre 2026) without overclaiming field validation; the operatore's personal data never appear in the chapter's examples.

**DEV box (≤ 4 lines):** `pages/operatori.php?action=dashboard|confronto`; `lib/OperatoriDashboard.php`, `lib/OperatoriConfronto.php` (`GIORNATE_MIN`), controllers and `json.php?action=operatori_dashboard_*`; optional tables are checked with `SHOW TABLES` because a missing table would read as zero; ADR 53 and 54.

**Key facts the Researcher must find**
- `docs/02-patterns/53-operatori-dashboard.md`, `54-operatori-confronto.md`, `wiki/assistenza-clienti/pagina-operatori-confronto.md`, `changeset/2026-11-13-gop-783-dashboard-operatori.md`, `changeset/2026-11-24-gop-873-confronto-operatori.md`.
- Exact column labels and warnings in `js/code/operatori_dashboard.js` (seen: «Versione app», «Eseguiti», «Km», «Foto», «Qualità foto», «Tempo medio», «Ultimo invio», «App da aggiornare», «Scegli un operatore», «Clicca una riga della tabella per vedere gli ultimi 10 giorni lavorativi.») and `js/code/operatori_confronto.js`, `Smarty_templates/it/operatori_confronto.html`.
- Exact reasons shown when a source is missing («L'analisi delle foto non è attiva su questa commessa», «Questa commessa non registra le posizioni dei telefoni»…).
- Permission: `operatori.confronto` (tipo ≤ 2 while RBAC enforcement is off) — translate into words; `operatori.vedere` for the Dashboard.
- Confronto «Eseguiti»: which stati (same 4, 6, 7?) (CONFLICT 6).
- `wiki/assistenza-clienti/runbook-operatori-attivi.md`: definition of attivo.

---

### Closing (no separate `##`: last paragraph of § 6, or a 3-line `> **Quando chiedere allo staff tecnico:**` box placed after § 6 and before `## Fonti`)
A rule the reader applies at the desk, not an echo of chapter 6 (whose closing rule is «read the stato of the intervento first») and not an announcement of chapter 9. See TARGET.

### `## Fonti`
Built by the Writer from the dossier entries actually used, in the STYLE_BIBLE format (`codice: …`, `wiki: …`, `docs: …`, `Portolano: …`, `Jira: GOP-NNN — titolo breve`).

---

## REVIEWER READINESS NOTES

### Tension points (where the chapter must create real stakes)
1. **The office changes an intervento the phone has already done (§ 4, set up by the opening case).** Stakes: a visit made in the field does not reach the office; the operatore sees a refused send; the office believes the work was never done and plans it again. Build-up: opening case (§ 1) → the phone list follows the server (§ 2) → the queue (§ 4) → the refusals caused by office actions. Resolution: a habit (check «Ultimo invio» before touching today's interventi of that operatore) plus the remedy the dossier confirms. Must not resolve into fear of «Modifica»: the refusal protects the office's own corrections (ch.6).
2. **Losing or disabling a phone (§ 1).** Stakes: the supervisor hesitates to disable a lost phone for fear of losing the day's work. Resolution: unsent work stays on the phone, nothing deletes it; recovery from a broken phone is a staff question with no promise.
3. **An agent sending commands to the phones of a production commessa (§ 5).** Stakes: messages or actions reaching operatori without a person deciding. Resolution: approval by an amministratore, 60-minute validity, approver recorded, phones re-read at approval, no deleting command, a per-phone limit.
4. **The Confronto read as a ranking (§ 6).** Stakes: a supervisor treats a zone effect as an operatore's fault; positions read as surveillance. Resolution: no thresholds, no podium, signals relative to the squadra with their sentence and the motivi; positions only with consent and an informativa accepted at pairing; «non misurabile» instead of a wrong number.

### Key chains to make explicit (cause → consequence → reader action)
- Phone not abilitato or disabilitato → every request refused → «Questo telefono non è più abilitato» on the phone and nothing in the office → check the phone's state in Impostazioni › Dispositivi mobili; to re-enable, a new code.
- Code older than 24 hours → no longer valid → «Chiedi un nuovo codice» on the phone → read the new code.
- «Data pianificata» outside «Giorni prima/dopo oggi» → the intervento does not reach the phone → move the data or widen the window (amministratore) → the phone receives it at its next update.
- Office reassigns an intervento → it leaves the first phone at the next update → if the first operatore had already registered its esito offline, that send is refused → check «Ultimo invio» and ask before reassigning today's work.
- Office verifies (stato 6) or closes from «Interventi mancanti» before the phone sends → send refused, office version kept (ch.6) → same habit; remedy only as the dossier says.
- Phone clock wrong by more than 5 minutes → every request refused → work stays queued → set automatic time, «Riprova».
- Position permission denied → esiti with «posizione assente: permesso negato» and «manca la posizione» in «Permessi» → ask the operatore to grant it; filter «Senza posizione» to find the others → if fewer than half of the squadra send positions, «Km» become «non misurabile».
- App older than 3.0.0 → ignores «ritenta invii», «richiedi log», «aggiorna app» → update the app first (login page, QR).
- Command not approved within 60 minutes → expires → must be sent again.
- Operatore with fewer than 5 giornate in the period → «fuori dal confronto», grey, out of the mediane → choose a longer period.
- AI analysis not active on the commessa → «Qualità foto» «non disponibile» and no warning under 80%.

### Risk proportionality guards (each risk paired with its balancing context, in the same paragraph)
- **Refused sends after office actions** → balance: it happens only when the office changes an intervento the phone has already done and not yet sent; the same mechanism is what protects the office's corrections from being overwritten (ch.6); an identical resend of an esito already stored is recognised, not duplicated (GOPlanner 3).
- **Disabling a phone** → balance: nothing on the phone is deleted; re-enabling needs only a new code.
- **Comandi remoti** → balance: no command deletes data; approval by a person; 60 minutes; limited to listed phones; only on commesse where the staff activated them.
- **Positions and km** → balance: positions only with consent and on commesse that record them; informativa at every pairing; km are straight-line and filtered for GPS noise, «non misurabile» when data are thin; no personal data in the chapter.
- **«Obsoleta» on the Dashboard** → balance: it is a label for who to update, not a block; GOPlanner 1.x still works where it is used; only a version below the minimum is refused (from the dossier).
- **Signals of the Confronto** → balance: relative to the squadra of that commessa and period; at least 4 operatori; above-median interventi or foto never a signal; motivi in the detail.
- **Staff-only monitoring (heartbeat, logs)** → balance: the operatore is asked nothing; read-only for the office; content of logs cleaned before upload.
- **Rate limits** → balance: normal use stays far below them (the pairing polling uses 2 of 12 requests a minute) — mention only if needed, with the source.

### Counter-objections planned (STYLE_BIBLE requires ≥ 2; five are planned)
1. § 1 — «Se disabilito il telefono perso, l'operatore perde gli esiti non inviati?»
2. § 2 — «Ho spostato l'intervento su un altro operatore: perché il primo lo vede ancora?»
3. § 3 — «L'esito è arrivato senza posizione: l'operatore non era sul posto?»
4. § 5 — «Ho approvato il comando, ma il telefono non ha fatto niente.»
5. § 6 — «Il Confronto segna Non fattibili alti: l'operatore lavora male?»

### Points the chapter 6 review penalised — avoid them here
- The opening case's lesson must follow from its story (see TARGET: the case is about the phone's unsent copy, and the lesson is the three questions).
- No invented chapter titles (use the table in the Continuity check).
- Connect every safety chain the dossier provides; do not leave a risk without the decision rule.
- Sections that read as a list of labels lose engagement: § 5 and § 6 each need one short case (the failed command in contro-obiezione 4; the invented Confronto row).
- No overclaims: features that are tenant-limited, test-only or «preparate, non applicate» are written as such.

### Litmus test for this chapter
A new back-office colleague, with only this chapter, can: enable the new phone of an operatore and disable the lost one without fearing for the day's work; find in five checks why an operatore does not see tomorrow's interventi; explain why an esito arrived without position; decide whether to reassign the afternoon of an operatore whose phone has not sent since the morning; approve a pending command before it expires; read the Confronto without turning it into a ranking.

---

## RESEARCHER BRIEF

**Web search terms:** none. INSTRUCTION.md § Researcher, SOURCE OVERRIDE: the web is not a source for this book. Use only the sources below, in this priority order. The GOPlanner repository is READ ONLY (no checkout, pull, stash, composer, npm; only Read, Grep, Glob, `git log`, `git show`, `git grep`).

### Documents to prioritize (in order)
1. Code on `php8` (authority when sources disagree): `pages/dispositivi.php`, `pages/impostazioni.php`, `pages/operatori.php`, `lib/MobileV3/**`, `lib/OperatoriDashboard*.php`, `lib/OperatoriConfronto*.php`, templates and JS listed below.
2. `docs/mobile-v3/*.md` (contract docs, dated October–November 2026) — translate API terms into office words; never copy hostnames or example personal names from them.
3. ADRs `docs/02-patterns/53-operatori-dashboard.md`, `54-operatori-confronto.md`, `48-ticketing-base.md`, `42-motore-unico-operazioni-console-api-mcp.md`, `16-mobile-inbound-sync.md`; cookbook `docs/03-cookbooks/36-osservabilita-canale-mobile.md`; changesets in `changeset/` for GOP-783, GOP-787, GOP-873.
4. Wiki articles under `wiki/assistenza-clienti/` (listed below), dated 2026-11-17 or later preferred.
5. Portolano, then Jira.

### Wiki paths
- `wiki/assistenza-clienti/approvazione-comandi-remoti.md`
- `wiki/assistenza-clienti/pagina-operatori-confronto.md`
- `wiki/assistenza-clienti/runbook-problemi-app-operatori.md`
- `wiki/assistenza-clienti/pagina-admin-errori-app-e-log.md` (pointer to ch.12 only)
- `wiki/assistenza-clienti/runbook-dove-si-e-fermato-il-dato.md` (pointer to ch.12; line 39 for CONFLICT 2)
- `wiki/assistenza-clienti/diagnostica-visibilita-operatore.md` (step 5 of the § 2 diagnosis)
- `wiki/assistenza-clienti/runbook-operatori-attivi.md`
- `wiki/assistenza-clienti/sezione-ticket.md` (where segnalazioni land; pointer only)
- `wiki/assistenza-clienti/magazziniere-app.md` (pointer to ch.9 only)
- `wiki/index.md` — scan for any article on pairing, app updates or segnalazioni not listed here.

### Docs paths
- `docs/mobile-v3/abbinamento.md` — § In breve, § Firma (±300 s), § `POST/GET /v3/pairing` (states, 24 h, 30 s), § Ufficio: abilitare e disabilitare, § Limiti di frequenza, § Server: tabelle e file («preparate, non applicate»), § Informativa, § Chiave di recupero (not built)
- `docs/mobile-v3/bootstrap-interventi.md` — § `GET /v3/interventi` (window, snapshot), § `photo_stamp`, § `receipt`, § Rilevare le modifiche
- `docs/mobile-v3/esiti.md`, `esito-write.md` (§ Richiesta, § Posizione di chiusura GOP-621, § Errori, § Riferimenti a firma e foto, § Rischi per tenant)
- `docs/mobile-v3/foto-upload.md`, `firma.md`, `storico-foto.md`
- `docs/mobile-v3/intervento-posizione.md`, `posizioni.md`, `device.md` (tracking consent), `dispositivo-permessi.md`
- `docs/mobile-v3/campi.md`, `campi-informativi.md`, `ricerca-assegnazione.md`
- `docs/mobile-v3/envelope.md` (errors, `retryable`, idempotency)
- `docs/mobile-v3/segnalazioni.md`, `segnalazioni-operatori.md`, `anomalie.md`, `heartbeat.md`, `log-richieste.md`
- `docs/mobile-v3/comandi-remoti.md`, `push.md`, `aggiornamento.md`
- `docs/02-patterns/53-operatori-dashboard.md`, `54-operatori-confronto.md`, `48-ticketing-base.md`

### Code paths and grep patterns (read-only)
- `Smarty_templates/it/dispositivi.html`, `js/code/dispositivi.js`, `lib/flexifields_defaults.php` (grep `'dispositivi'`) — labels, columns, filters, badges
- `pages/dispositivi.php` — the «non disponibile» error text, permission gate
- `pages/impostazioni.php` (grep `app3`, `stampa`, `ricevuta`), `Smarty_templates/it/impostazioni.html` lines ~86–160
- `lib/MobileV3/Device/OfficeDevices.php` (`allowed`, `approve`), `lib/MobileV3/Device/PermessiView.php`
- `lib/MobileV3/Domain/FinestraInterventi.php`, `lib/MobileV3/Bridge/LegacyInterventi.php`, `lib/MobileV3/Resource/InterventiController.php`
- `lib/MobileV3/Domain/EsitoCatalog.php` (`DEFAULTS`), `lib/MobileV3/Domain/EsitoWriter.php`, `lib/MobileV3/Resource/InterventiEsitoController.php`
- `lib/MobileV3/Domain/FotoStore.php`, `lib/MobileV3/Domain/Firma.php`, `lib/MobileV3/Domain/PhotoStamp.php`, `lib/MobileV3/Domain/ClosingReceipt.php`
- `lib/MobileV3/Push/` (`EventCatalog`, `CommandStore`, `CommandDispatcher`), `lib/MobileV3/Resource/DeviceCommandsController.php`, `lib/OperazioniComandi.php`
- `lib/MobileV3/Update/`, `pages/login.php`, `Smarty_templates/it/login_new.html`, `scarica_app.php` (grep `beta`, `versione precedente`)
- `lib/MobileV3/Feedback/`, `lib/MobileV3/Anomalie/`
- `pages/operatori.php`, `lib/OperatoriDashboard.php`, `lib/OperatoriDashboardController.php`, `js/code/operatori_dashboard.js`, `Smarty_templates/it/operatori_dashboard.html`, `lib/OperatoriConfronto.php`, `lib/OperatoriConfrontoController.php`, `js/code/operatori_confronto.js`, `Smarty_templates/it/operatori_confronto.html`
- `git grep -n "posizione_assente" -- lib js Smarty_templates` — where the office sees the motivo
- `git grep -n "Collega telefono\|campo Dispositivo\|dispositivo_disabilita" -- js lib Smarty_templates` — GOP-600
- `git grep -n "MCP_COMANDI_LIMITE\|MCP_COMANDI_FINESTRA" -- lib` — default limit and window (numbers only; no environment values from `.env` files)
- `ls migrations/main/ | grep mobile_v3` and `cat migrations/main/README.md` — which migrations exist; whether production status is recorded anywhere
- `git log --oneline -15 -- lib/MobileV3/ docs/mobile-v3/` — most recent changes, to date the state of affairs

### Portolano queries (`mcp__rag_qdrant_server__query_rag_hybrid`, **`user_roles: ""` (empty string)** per INSTRUCTION.md; fall back to `query_rag`)
- «abbinamento telefono codice 3 caratteri abilita operatore»
- «Dispositivi mobili Telefoni GOPlanner 3 disabilita telefono»
- «interventi arrivano sul telefono giorni prima dopo oggi»
- «operatore non vede intervento app»
- «esito posizione assente permesso negato GPS spento nessun fix»
- «scritta sulle foto modello predefinito ricevuta alla chiusura»
- «firma PNG nome stampato intervento»
- «Segnala un problema Le mie segnalazioni operatori»
- «anomalie app GOPlanner 3 crash heartbeat coda»
- «comandi remoti approva e invia 60 minuti»
- «aggiornamento app GOPlanner 3 APK obbligatorio versione minima»
- «Operatori Dashboard versione app obsoleta qualità foto»
- «Operatori Confronto segnali mediana squadra fuori dal confronto»
- «intervento_locked already_closed esito rifiutato»

### JQL fragments (cloudId `21873985-2e5d-4a8a-bb45-e6d453128985`, project GOP, READ ONLY)
- `project = GOP AND key in (GOP-399, GOP-398, GOP-400, GOP-401, GOP-403, GOP-405, GOP-407, GOP-408, GOP-449, GOP-454, GOP-456, GOP-457, GOP-550, GOP-560, GOP-600, GOP-621, GOP-623, GOP-695, GOP-757, GOP-783, GOP-784, GOP-787, GOP-873)`
- `project = GOP AND text ~ "GOPlanner 3" AND updated >= -60d ORDER BY updated DESC` — rollout status per commessa
- `project = GOP AND text ~ "abbinamento" ORDER BY updated DESC`
- `project = GOP AND (text ~ "telefono" OR text ~ "app") AND text ~ "non vede" ORDER BY updated DESC`
- `project = GOP AND text ~ "posizione assente" ORDER BY updated DESC`
- `project = GOP AND text ~ "orologio" ORDER BY updated DESC`
- `project = GOP AND text ~ "comandi remoti" ORDER BY updated DESC`
- Purpose: (a) one real ticket story per § 1, § 3 or § 4 (problem → cause → fix), told without personal data and without contractual details; (b) the production status of GOPlanner 3, of the pairing tables, of migration 0031 and of the commesse with comandi remoti.

### Specific facts, numbers and labels to hunt
- Pairing: 3 characters, 24 hours, once; polling 30 seconds; «ID dispositivo» 8 characters; clock ±300 s; 12 requests a minute per phone (polling uses 2).
- Window: «Giorni prima di oggi», «Giorni dopo oggi», «Vuoto = …»; one commessa's example values (7 / 10) — commessa name only if it is already visible in the product, otherwise «una commessa».
- Esito: note max 2.000; letture max 100; `segnalazione` max 25 (and its meaning); `posizione_assente_motivo` values; `fix_source` values; `fix_age_s` max 604.800 s (7 days) if relevant.
- Foto and firma: 20 MB (20.971.520 byte); PNG→JPEG for foto; firma PNG only; printed name max 100; firma tipi 99 and 98.
- Commands: 7 commands, message max 500, 3 new from app 3.0.0; request valid 60 minutes; confirmation code 5 minutes (DEV); default 10 commands per phone per window; ack states.
- Updates: channels stable / pilot (pilot never on the login page); «beta» label; «versione precedente»; mandatory vs optional; minimum accepted version → refusal (426) except the update route.
- Heartbeat: every 5 minutes and at every opening.
- Dashboard: stati 4, 6, 7; km rules 100 m / 30 m / 160 km/h / 30 minutes; tempo sul posto discards over 8 hours (measured) and over 2 hours (estimated); quality warning under 80%; detail 10 working days; check of 13 novembre 2026 on start/end always empty on some commesse.
- Confronto: 5 giornate; 4 operatori; 21 working days; 30 measured interventi; under one minute median between foto; 5 measures; half of the operatori with positions; Periodo default «Ultimi 30 giorni».
- Dates of the state of affairs: GOP-783 (13 novembre 2026), GOP-787 (19–20 novembre 2026), GOP-873 (24 novembre 2026).

### Mandatory [CONFLICT] items to record
1. **Page name:** menu «Dispositivi mobili» and page title «Dispositivi mobili» (`dispositivi.html`) vs. «Telefoni GOPlanner 3» (wiki «pagina Telefoni GOPlanner 3», `pages/dispositivi.php` header comment, `comandi-remoti.md`) vs. the section «Telefoni GOPlanner 3» inside Impostazioni › Generale (day window, photo stamp, ricevuta). Record which label is shown where; the chapter uses the on-screen labels.
2. **Duplicate sends:** `esito-write.md` / `envelope.md` (`Idempotency-Key`: a resend is never written twice) vs. `runbook-dove-si-e-fermato-il-dato.md` line 39 («la deduplicazione per identificativo non è ancora in produzione»). Resolve by app version (GOPlanner 3 vs 1.x) and production status.
3. **Migrations:** `abbinamento.md` (pairing tables «preparate, non applicate»), `segnalazioni-operatori.md` («Migrazioni (preparate, NON applicate)»), `comandi-remoti.md` (migration 0031) vs. pages described as live in the wiki. What is applied in production on 25 novembre 2026? If no source says → `[BLOCKED: needs human input]`, and the Writer phrases each feature as «sulle commesse dove è attiva».
4. **«tecnico» in the UI** (`dispositivi.html`: «Il tecnico legge il codice…») vs. the glossary (operatore). Record; the chapter uses «operatore» and quotes the UI only if indispensable.
5. **Start and end of the intervento:** contract fields `inizio` / `fine` accepted but not persisted (`esito-write.md` § Rischi 4) vs. ADR 53 «se l'app registra inizio e fine» and the check of 13 novembre 2026. State what the code on `php8` does today.
6. **«Eseguiti» in Dashboard vs Confronto:** Dashboard stati 4, 6, 7; Confronto «giornata di lavoro» counts eseguiti + non fattibili. Confirm the stati behind each column.
7. **GOPlanner 3 rollout:** which commesse use GOPlanner 3 vs GOPlanner 1.x on 25 novembre 2026, and whether `OfficeDevices::allowed()` limits the Dispositivi mobili page to some commesse. Likely `[BLOCKED]`; the chapter then says «sulle commesse che usano GOPlanner 3».
8. **Comandi remoti in production:** default enabled commessa is a test one; which production commesse are enabled is a service configuration. Record only «test vs production» behaviour, no variable values.

### Security filter reminder
No logins, names of operatori/utenti/intestatari (the contract docs contain example names of real people: never copy them), addresses, phone numbers, real `device_id`, `ref`, `sim_id`, IMEI or SIM numbers, push tokens, IPs, hostnames (the update doc names an internal host: do not copy it), keys, key ids, `.env` values, APK URLs, model or vendor names of the AI, contractual or tender details of committenti. Committente names: at most as one example of a commessa, sparingly; prefer «una commessa».

---

## TARGET

- **Word count:** 5.700–6.000 words in total (PRD § 4: 4.000–6.000 per chapter). Breakdown: «In questo capitolo» ~80; § 1 950; § 2 900; § 3 1.100; § 4 1.000; § 5 1.000; § 6 1.050; closing + `## Fonti` ~150. If the dossier is thin on app-side labels (`[UNVERIFIED]`), cut § 2 and § 4 toward their lower bound rather than padding.
- **Opening hook strategy:** open § 1 with an invented case, declared as invented in plain words (not in the Style Bible's words), in three or four sentences — an operatore works a morning without signal, the office sees few esiti and moves the afternoon's interventi to a colleague, and the esiti the phone sends at lunch are refused for interventi that now belong to someone else (use exactly the refusal the dossier confirms; if the dossier does not confirm it, switch to the case of tomorrow's interventi outside «Giorni dopo oggi») — so that the lesson follows from the story: the phone keeps its own copy of the work, and the office asks three questions (which phone, which interventi, what is still unsent) before acting.
- **Closing beat promise:** end on a desk rule that only this chapter can give — before moving, verifying or deleting today's interventi of an operatore, or disabling the operatore's phone, look at the «Ultimo invio» of that phone: if it is older than the work you are about to touch, the phone still holds part of the day the office cannot see, and the first move is to ask the operatore, not to change the Piano.
