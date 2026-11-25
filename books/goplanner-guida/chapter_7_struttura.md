# Chapter 7 — Struttura (Architect spec)

**Chapter title (H1 for the Writer):** `# 7. Esportazione e consegna al committente`
**PRD row:** «Come si produce il file per il committente: menu Esportazione, modelli salvati e duplicati, esportazione in coda, avanzamento, file scaduti, esportazione delle foto, cosa fare se è vuota o fallita» — audience **BACKOFFICE**.
**Core question of the chapter:** how does the office produce the file for the committente, check it before it leaves, hand it over, and recover when it comes out empty, failed or expired?
**Chapter thesis (the rule the whole chapter proves):** an esportazione *reads* and does not *write*. It takes the esecuzioni (`interventi_eseguiti`) that the modello and the filters select **at the moment of the launch**, turns them into a file that is kept 30 giorni, and (for the standard modello) changes nothing in GOPlanner: no stato, no flag. So every «manca una riga» or «c'è una riga di troppo» is answered by four things, always in this order: the modello, the filters (above all «Filtra per» and the period), the moment of the launch, and the stato of the esportazione itself. *(The Researcher must confirm «changes nothing» on `php8`; if a generic path writes back, the thesis is narrowed to «il modello standard non cambia nulla» and the exceptions are named.)*

### Continuity and glossary check (done by the Architect, 25 novembre 2026)
- `chapter_index.md`: not present yet. `NARRATIVE_GLOSSARY.md`: not present yet. Canonical vocabulary = `/home/alan/firstmate/projects/GOPlanner/CONTEXT.md`.
- **Established claims from `chapter_6.md` that this chapter must not contradict:**
  1. «L'esportazione parte dalle esecuzioni, quindi un intervento senza esecuzione non entra nel file.» Ch.7 explains the mechanism; it must stay consistent.
  2. **Inviato (7) is not written by every esportazione.** Ch.6 sources found stato 7 written by the importazione di un file di inviati, by a historical letture export of one commessa, and by an Admin repair procedure. Ch.7 must not say or imply «dopo l'esportazione l'intervento diventa Inviato». A delivered intervento can still read Controllato (6).
  3. **«Verificato» → Controllato (6) matters for the file only on some commesse.** Ch.6 says one commessa's return file takes only Controllato interventi with positive esito and «Data validazione» in the period. The Architect checked `lib/ExportInterventiQuery.php`: the **standard** query has no filter on stato. So in ch.7, «the file contains only verified interventi» is **commessa-dependent** and must be said that way.
  4. The ch.6 closing rule («prima di qualunque azione su un intervento servono due risposte…») must **not** be echoed. Ch.7 closes on the file, not on the intervento.
- **Glossary traps specific to this chapter (the Writer and the Editor must check all six):**
  1. **«Esportazione», never «export», «scarico» or «tracciato» in prose** (CONTEXT.md «Da evitare»). UI labels that contain those words are quoted as labels only: «Tracciato testuale (txt)». In DEV boxes, class and table names (`ExportInterventiJob`, `esportazioni_registro`) are code and stay as they are.
  2. **«Modello» and «mappatura».** The page says «modello» (scheda, «Duplica e modifica», «modello salvato»). CONTEXT.md has no entry for either word. PRD § 4 names the *mappatura* as the configuration object owned by ch.4 (import) and ch.7 (export). Rule: in UFFICIO prose use «modello», as on the page. State once that the modello is the mappatura di esportazione of the commessa, with a pointer to ch.4 for the import side. `mappature.php` as code belongs to ch.13: at most one DEV-box line.
  3. **«Cliente»** appears only as a quoted UI label (the filter «Cliente» in «Altri filtri»; the Researcher confirms what it filters). In prose: committente, or utenza.
  4. **«Utente» vs «operatore».** The one who launches an esportazione is an *utente* of the gestionale («Ultime esportazioni» shows the utente). The filter «Operatore» is the field worker. Never swap the two.
  5. **Esito vs stato** (from ch.6): the esportazione filter «Positivi / Negativi / Tutti» works on the esito (`interventi_eseguiti.esito`). It is not a stato filter. Say it in one sentence.
  6. **«Tenant»** only inside `> **Per gli sviluppatori:**` boxes, with the correspondence stated the first time («la commessa, che nel codice si chiama tenant»). No tenant codes (`sg_smat`, `easy_areti`…) in UFFICIO text. Committenti by name: at most one example per section, only where the dossier supports it (PRD § 6).

### Chapter boundaries (one-line pointers only, per PRD § 4 «Confini tra capitoli»)
| Topic touched here | Owned by | What ch.7 may say |
|---|---|---|
| Mappatura di importazione, scarti, «Importazione classica» | ch.4 | One sentence: the export modello is the same kind of configuration, seen from the other side; «vedi il capitolo 4, *Importazione: dal file del committente alla lista*» |
| Stati of an intervento, «Verificato» → Controllato (6), Inviato (7) | ch.6 | The consequence for the file only (see continuity 2–3), then «vedi il capitolo 6, *Interventi, esiti e verifica*» |
| How foto and firma are taken on the phone; when an esito reaches the server | ch.8 | One sentence: the app side is in ch.8; here only what the esportazione reads |
| Gea reading the registro delle esportazioni and explaining a failure | ch.10 | One sentence + «vedi il capitolo 10, *Gea, l'assistente di GOPlanner*». Gea's tool names (`stato_import_export`, `log_import_export`) only in a DEV or STAFF box |
| Who sees the menu Esportazione (profile, permission) | ch.11 | One sentence, in words, + «vedi il capitolo 11, *Utenti, ruoli e permessi*» |
| Admin › Errori app e Log, runbook «dove si è fermato il dato» | ch.12 | One sentence + «vedi il capitolo 12, *Strumenti di amministrazione e diagnostica*» |
| Job asincroni, worker, avanzamento (segnalibro) as architecture; `mappature.php` as code | ch.13 | DEV boxes only, max 4 lines each |
| Tables `esportazioni_registro`, `esportazioni_link`, `mappature_export`, `interventi_eseguiti` | ch.14 | DEV boxes only |
| Per-commessa migrations applied at release time | ch.16 | One sentence in a Limite: «una funzione che dipende da un aggiornamento della commessa non ancora fatto» → staff tecnico |
| «Esporta in Excel» of a grid (flexigrid) | ch.14 | One sentence in the Limite of § 3, only if the dossier confirms it shares the queue: it is not a file for the committente |

> **Exact chapter titles for cross-references** (the ch.6 review found an invented title): use only the PRD § 4 titles quoted in the table above.

---

## NUFs (Goal Scoring)

Ten NUFs, so the Editor can score them one point each against the 8.5/10 gate. Format per INSTRUCTION.md § Architect.

```
utility(reader): Reader can explain what an esportazione reads — the esecuzioni in `interventi_eseguiti`, joined to their intervento, lista and utenza — and use it to answer «perché questo intervento non è nel file?» (no esecuzione; outside the period of the «Filtra per» date; filtered out by esito, lista, operatore or lotto; arrived after the launch) before opening a ticket → score += 1

utility(reader): Reader can launch an esportazione from File › Esportazione: choose the modello from its scheda (with «Ultime usate» on top), set «Filtra per», «Dal», «Al» or a quick button (Oggi, Ieri, Settimana precedente, Mese precedente, Anno corrente), the esito (Positivi / Negativi / Tutti), the row «Del modello» and «Altri filtri», read the riepilogo and press «Esporta N interventi» → score += 1

utility(reader): Reader can pick the right «Filtra per» date (esecuzione, pianificazione, validazione) for the committente's question, and knows what the «validazione» date really reads in the standard modello → score += 1

utility(reader): Reader can follow an esportazione in background from the segnalibro in the left menu and from «Ultime esportazioni», read its stato (In coda, In corso, Completata, Fallita, Annullata, File scaduto), download it with «Scarica il file», and knows that «Ripeti» moves the period forward (ottobre → novembre), so it does not redo the same period → score += 1

utility(reader): Reader can hand a file to the committente with «Copia link» and withdraw it with «Revoca link», knowing that the link opens without logging in to GOPlanner, lasts 30 giorni by default (a commessa can set a different value) and never outlives the file, which is kept 30 giorni → score += 1

utility(reader): Reader can create a modello salvato with «Duplica e modifica», change titolo, campo, posizione, valore fisso and formato data of each column, check the first row in the anteprima, and knows that the copy is shared by the whole office and that modelli marked «classica» cannot be duplicated → score += 1

utility(reader): Reader can run an esportazione delle foto and read its result correctly: firme are never in the file and never counted; a foto that cannot be read is skipped and counted in the final message; a «Completata» with foto missing is not a failure of the office → score += 1

utility(reader): Reader can diagnose an esportazione vuota, fallita or scaduta with the symptom table of § 6 (0 righe attese → filters; Fallita with a cause → the known causes; Fallita without a cause → not recorded, do not guess; righe < attese → scartati; File scaduto → export again) and knows what to give the staff tecnico (numero dell'esportazione, ora, periodo, causa, codice errore) → score += 1

utility(emotional): Reader feels safe launching and relaunching an esportazione, because the standard modello only reads (it changes no stato and no esito), and knows the exceptions where a launch acts outside GOPlanner (modelli that send by mail, SOAP or FTP) → score += 1

utility(factual): The chapter states, each with its source: the 30-day retention (`lib/EsportazioneRegistro.php`, `GIORNI_CONSERVAZIONE = 30`); the link default and its per-commessa setting (`lib/EsportazioneLink.php`, `$custom['esportazioni_link_giorni']`); the menu rule (`pages/file.php`: shown with the import permission, otherwise only where the commessa enables «esportazione»); the same query for the count and the file (`lib/ExportInterventiQuery.php`); the 15 rows of «Ultime esportazioni»; the formats trap (XML not implemented, «Excel 2007» writes a legacy .xls); GOP-817, GOP-818, GOP-647, GOP-824 → score += 1
```

---

## BEAT LIST

Six sections (`##` in the final chapter). Each needs: italic audience line at the top when not for everyone (STYLE_BIBLE § Voice rule 6), at least one exact concrete detail, at least one **Limite** paragraph, max 5 prose paragraphs in a row without a table, list, box or subheading.

Before § 1 the Writer puts the mandatory `*In questo capitolo…*` paragraph (2–3 sentences): what an esportazione reads; how to launch, follow, hand over and duplicate it; what to do when it is empty or failed. For back office, with boxes for developers.

---

### § 1 — `## Che cosa legge un'esportazione`
**Tag:** [TUTTI] (one `> **Per gli sviluppatori:**` box)
**Core question:** Where do the rows of the file come from, what decides which ones enter, and what does an esportazione change in GOPlanner?
**Word target:** 850 (range 800–1.000)
**Paragraph functions:** Aggancio (the opening case, see TARGET) → Spiegazione (esecuzioni + modello + filtri + momento) → Dimostrazione (formats table) → contro-obiezione → Limite → Sintesi.

**Content plan**
- Opening case (invented; say so in plain words, **without** copying the style-bible phrase «dichiarato come tale», which the ch.6 review flagged as a leaked instruction). See TARGET for the case. Its lesson must follow from the story: the file answered the question asked at the moment of the launch.
- The source: one row per esecuzione (`interventi_eseguiti`), joined to the intervento, the lista and the utenza. An intervento without an esecuzione is not in the file. One sentence linking ch.6, no repeat of the two-records explanation.
- The **modello** decides the columns, their order and the format. It is the mappatura di esportazione of the commessa (one sentence + pointer ch.4 for the import side). The modelli of the commessa are *di sistema* and read-only. The office can make its own copy (§ 4).
- The **filters** decide the rows (detailed in § 2). The count on the button and the file use **the same query**, so «Esporta 412 interventi» and a file of 412 rows are the same selection (number invented; say so). Only scartati (§ 6) can make them differ.
- **Reads, does not write.** The standard esportazione changes no stato and no esito. Two consequences, one sentence each: (a) relaunching an esportazione is safe for the data; (b) an exported intervento does not become Inviato (7). Ch.6 continuity: the stato column cannot tell you whether an esito has already left; the «Ultime esportazioni» list can (§ 3).
- **Verified or not?** The standard modello does not filter on the stato: an esecuzione not yet verified is in the file if the filters select it. Some commesse have a modello that takes only Controllato interventi (ch.6). Rule: know which kind your modello is before sending. If the scheda does not say it, ask the staff tecnico (to be checked by the Researcher: does the scheda or the column list show a stato condition?).
- `### I formati` — table: option as shown («Tracciato testuale (txt)», «XML», «Excel 2007 (xls)», «CSV») → what really comes out. XML: selectable, **never implemented**, does not produce a usable file. «Excel 2007»: writes a legacy `.xls` (`Excel5` writer), not `.xlsx`. If the modello declares its own format, that format wins over the choice on the page (example: a modello that always writes `.xlsx`). The row «Del modello» proposes a format only when the modello does not fix one.
- **Contro-obiezione 1:** «Ho esportato ieri: perché quell'intervento risulta ancora Controllato e non Inviato?» → The standard esportazione does not write the stato. Inviato comes from other paths (one sentence + «vedi il capitolo 6»). Whether an esito left is read in «Ultime esportazioni» (who, when, which modello, which period), not in the «Stato» column.

**Limite (mandatory):** columns, formats and conditions of the modelli change by commessa; some modelli have their own logic, written for one committente (fixed-position text files, files built inside a file of the committente, modelli that send by mail, SOAP or FTP instead of producing a file). For those modelli the rule «reads, does not write» covers the data in GOPlanner but not the effect outside: a modello that sends, sends again when relaunched (the Researcher confirms whether a relaunch resends).

**Sintesi:** a file says what the modello and the filters selected when it was launched. Nothing more, nothing later.

**DEV box (max 4 lines):** `lib/ExportInterventiQuery.php`: `select()` and `count()` share `joins()` and `filterClauses()` («so the displayed count and the synchronous export cannot silently use different filters»); `FROM interventi_eseguiti LEFT JOIN interventi … LEFT JOIN carichi … LEFT JOIN utenti`. The table of the utenze in the code is `utenti` (ch.6 CONFLICT). The modelli di sistema are the keys of the commessa's `mappature.php` (code: ch.13).

**Key facts the Researcher must find**
- Confirm that no generic export path (`lib/ExportBase.php`, `lib/Export.php`, `lib/jobs/ExportInterventiJob.php`, `lib/jobs/ExportFotoJob.php`, `lib/BaseFotoExport.php`, `JSONController::export()`) writes `stato_id`, `esito` or any «esportato» flag. The Architect's grep found nothing in those files; the only stato-7 writer among export files is `lib/export_letture_aceaA4.inc.php` (legacy, one commessa). Record it.
- Does any modello filter on stato (search `mappature.php` of the commesse for `stato_id`, `stati`, `controllat`)? Give the count and one example for the dossier. The chapter says «alcune commesse».
- Format labels exactly as shown, and the XML / `Excel5` facts in `lib/ExportBase.php` (wiki `export-dati.md` cites lines 22–138, 145, 450–491).
- Does the scheda of a modello show anything that tells the office «only Controllato»? If not: `[UNVERIFIED]`, and the Writer uses the «ask the staff tecnico» rule.
- Modelli that send instead of writing a file (mail, SOAP, FTP): does relaunching resend? (`EsportazioneModelli`, `ExportFotoJob` for `formato json` modelli, the `messaggio` column «Inviati N di M»).

---

### § 2 — `## File › Esportazione: modello, filtri, riepilogo`
**Tag:** [UFFICIO]
**Core question:** How does the office launch the right esportazione, and how does it check the selection before pressing the button?
**Word target:** 1.000 (range 900–1.150)
**Paragraph functions:** Aggancio → Procedura (numbered) → Spiegazione («Filtra per») → Dimostrazione (the riepilogo) → contro-obiezione → Limite → Sintesi.

**Content plan**
- Where it is: menu File, left column: «Esportazione», and under it «Esportazione classica» (the previous page, still there). Who sees it, in words: whoever can import sees it always; for other profiles it appears only if the commessa enables the esportazione for them. One sentence + «vedi il capitolo 11». Never write «tipo < 5» in UFFICIO text.
- Numbered procedure (one action per step): 1. File › Esportazione; 2. choose the modello from its scheda (the most recent ones are under «Ultime usate»; import-only mappature are in a closed list at the bottom); 3. read the scheda (format, columns, file modello if any, background or direct); 4. set the period: «Filtra per», «Dal», «Al», or a quick button (at opening: Mese precedente); 5. choose the esito: Positivi, Negativi, Tutti (the causali appear only with Negativi); 6. fill «Del modello» if present; 7. open «Altri filtri» if needed (lista, operatore, «Cliente», lotto, codici; the closed block shows how many filters are active); 8. read the riepilogo; 9. press «Esporta N interventi».
- `### «Filtra per»: quale data` — short table: option as shown → field read → when to use it. Esecuzione (`interventi_eseguiti.data`) — the work done in the period; pianificazione (`interventi.data_pianificata`) — what was planned in the period, including what has an esecuzione; validazione — in the standard modello this is `interventi_eseguiti.data_m` (code comment: «the base schema exposes data_m as the only generic validation timestamp»). **Trap to state only if the Researcher confirms what writes `data_m`:** if it is the last change of the esecuzione, a correction made today in the Verifica moves an old intervento into today's period. Some commesse have a real «Data validazione» (ch.6): say it as commessa-dependent.
- `### Il riepilogo e il conteggio` — the riepilogo at the bottom: modello, period, active filters, optional nota, and the button «Esporta N interventi» with the live count. The button is off, with the reason, when no modello is chosen or the count is zero (quote the exact reasons). Only the filters the modello uses are shown. Parameters «chiave=valore» are for amministratori only.
- **Contro-obiezione 2:** «Il pulsante dice 0 interventi, ma il lavoro è stato fatto.» → In order: «Filtra per» (pianificazione vs esecuzione); the period (Mese precedente is the default at opening); the esito (Positivi hides the non eseguiti); «Altri filtri» (count of active filters); then whether the esecuzioni exist at all (ch.6, ch.12 pointer for «dove si è fermato il dato»).

**Limite (mandatory):** modelli with their own branch on the page (some foto, letture and PDF modelli of specific commesse, the «pianificazione» modello) do not go in background and keep the previous behaviour; the fields of «Del modello» change by modello (week and year for one committente, reading dates for another: one example at most); the Esportazione classica is still the page for modelli marked «classica» (the Researcher confirms which page launches them).

**Sintesi:** read the riepilogo before the button: modello, «Filtra per», period, esito, number. If the number is wrong, the file will be wrong in the same way.

**Key facts the Researcher must find**
- Exact labels in `Smarty_templates/it/esportazione.html`, `js/code/esportazione.js`, `lib/dict/lang_it.php`: «Ultime usate», «Filtra per» and its three options, «Dal», «Al», quick buttons, esito options, «Del modello», «Altri filtri», label of the «Cliente» filter and what it filters (`carichi.cliente`), «Esporta N interventi» (and the label for modelli whose data are not interventi, e.g. segnalazioni), disabled-button reasons, the nota field, the «chiave=valore» block.
- `interventi_eseguiti.data`: is it the time of the esecuzione recorded by the phone or the time the server received it? (`InterventoEseguitoBase::setFromAndroid`, `lib/MobileV3/…/EsitoWriter`). Needed for the opening case.
- `interventi_eseguiti.data_m`: what writes it (column default `ON UPDATE CURRENT_TIMESTAMP`? explicit writes in the Verifica save, `verificaImpostaStato`, app resend?). Check the tenant schema (`migrations/tenant/`, `docs/01-foundations/07-database-schema.md`) and the code. Record in [CONFLICT] if the label says «validazione» and the field is a last-change timestamp.
- `pages/file.php` lines ~37–52: the menu rule (`can_tipo('interventi.importare', 4)`, else `$MENU['esportazione']`). Translate the profile rule into words a back-office reader understands (ch.11 vocabulary); no `tipo` numbers in UFFICIO text.
- `EsportazioneModelli::RAMI_PAGINA`: the list of modelli with their own branch, for the dossier only.

---

### § 3 — `## In coda: avanzamento, «Ultime esportazioni», file e link`
**Tag:** [UFFICIO] (one DEV box with a real case)
**Core question:** What happens after the button, how does the office follow the job, download the file, hand it over, and how long does each thing last?
**Word target:** 1.100 (range 950–1.200)
**Paragraph functions:** Aggancio → Spiegazione (background) → Dimostrazione (stati table) → Procedura (download, link) → Spiegazione (durations) → contro-obiezione → Limite → Sintesi.

**Content plan**
- After the button the standard esportazione runs **in background**. A segnalibro appears at once in the left menu, on every page, with the avanzamento, and at the end the file. The page shows the bar, then esportati, scartati and «Scarica il file». The office can change page. Since 24 novembre 2026 the classic modelli (verbali PDF, foto, invii by SOAP and mail) and the Excel, csv or txt modelli that use the common engine also run in background, even when the data are not interventi (GOP-647).
- **One at a time:** only one esportazione open per commessa and modello; a second launch is refused with a message that names the modello (Researcher: exact text).
- Table of the stati of an esportazione: In coda / In corso / Completata / Fallita / Annullata / File scaduto → what it means → what the office does. «In coda» and «In corso» are not errors. «Completata» can have **no file**: a modello that sends, or a period without data, closes «Completata» with its message instead of «Scarica» (quote «Nessun dato da esportare con questi filtri» and the «Inviati 3 di 5» pattern, marked as an example).
- `### «Ultime esportazioni»` — the panel on the same page: the last 15, with data, modello, periodo, esito, righe esportate and scartate, utente; «Scarica», «Copia link» (then «Revoca link») when the file exists; «Ripeti». **«Ripeti» reloads modello and filters and moves the period forward** (whole months stay whole months: ottobre → novembre). To redo the *same* period after a correction, set the period again by hand.
- `### Il link per il committente` — numbered procedure: 1. «Copia link» next to «Scarica» (or in the row of «Ultime esportazioni»); 2. paste it in the message to the committente; 3. when it is no longer needed, «Revoca link». What the link does: it opens the file **without logging in to GOPlanner**. «Revoca link» disables it at once (who opens it sees an error); the file stays in the list; a new «Copia link» makes a different link.
- **Durations (table, three rows):** file → 30 giorni, then «File scaduto» and a new esportazione is needed; link → 30 giorni from its creation by default (a commessa can have a different value), then it says the link is expired but the file is still there, and a new «Copia link» makes a new one; link vs file → a link never outlives its file.
- **Proportionality (same paragraph as the link, mandatory):** the file holds data of utenze, and whoever has the link opens it. Balance with the facts: the link is a random 256-bit code, not the file name; the folder of the esportazioni cannot be browsed; every download through a link is recorded; the link expires and can be revoked at once. The rule from the source: «Se non serve più, «Revoca link» lo disattiva subito».
- **Contro-obiezione 3:** «L'esportazione è Completata ma non c'è Scarica.» → Read its message: a modello that sends (no file by design) or «Nessun dato da esportare con questi filtri» (§ 2 checks). If it is older than 30 giorni: «File scaduto», export again.

**Limite (mandatory):** the modelli that stay synchronous (own branch on the page; modelli written for one committente, such as a fixed-position text file, an FTP upload, one commessa's anomalie export) download at the end of the request, **without link**. The registro behind «Ultime esportazioni», the link and the saved cause of a failure each depend on an update of the commessa: where it has not been applied, the panel or the button behaves differently (Researcher: confirm today's behaviour on `php8`, see [CONFLICT] 3) → staff tecnico. «Esporta in Excel» of a grid is not an esportazione for the committente (one sentence, only if the dossier supports it).

**Sintesi:** a file lasts 30 giorni and a link at most as long as its file. «Ripeti» moves the period forward; it does not redo it.

**DEV box — a real case (problem → cause → fix, no personal data, GOP-647, 16 novembre 2026):** problem: esportazioni in coda marked «Completata» whose file could not be downloaded. Cause: the queued jobs wrote the ZIP/xlsx inside the commessa's folder of the application image; in production the file stayed in the worker's container and the web side did not see it. Fix: `GOPlanner::getExportPath()` on a shared volume not reachable from the web; `EsportazioneRegistro::percorsoFile()` and the download read through `GOPlanner::trovaFileExport()`, with a fallback for older files. Esportazioni lost before the fix had to be redone. (Do not print container paths or hostnames.)

**Key facts the Researcher must find**
- Exact stato labels of an esportazione as shown on the page and in the segnalibro (`lib/EsportazioneRegistro.php` ~389–403, `js/code/esportazione.js`, `lang_it.php`). Is «Annullata» reachable by the utente (a cancel button on the job)? Exact label.
- The 409 message for a second launch (`AvanzamentoJob::registraAttivo()`).
- `messaggio` examples (`esportazioni_registro.messaggio`, migration `0045`): «Nessun dato da esportare con questi filtri», «Inviati N di M».
- «Ultime esportazioni»: confirm 15 rows (page) vs 10 (Gea's tool, wiki `stato-import-export.md`): two different lists, record both.
- «Ripeti»: `js/code/esportazione.js` ~line 85: exact rule for non-month periods (a week, custom dates).
- Link: `lib/EsportazioneLink.php` (`giorniValidita()`, `ESITO_*`, `esportazioni_link_accessi`), `scarica_link.php` (file name only, never a URL with a token), exact error texts for revoked, link expired, file expired, migration missing.
- Retention job: `EsportazioneRegistro` ~418–428 (who removes the file, how often).
- GOP-647 changesets `changeset/2026-11-16-gop-647-export-in-coda-volume-condiviso.md` and `changeset/2026-11-24-gop-647-esportazioni-async-link.md`.

---

### § 4 — `## Modelli salvati: «Duplica e modifica»`
**Tag:** [UFFICIO] (one DEV box)
**Core question:** When the committente asks for a different column, how does the office get its own modello without touching the modello of the commessa, and who else sees it?
**Word target:** 850 (range 800–1.000)
**Paragraph functions:** Aggancio (a committente asks for one more column) → Spiegazione (sistema vs salvato) → Procedura → Dimostrazione (the anteprima, locked titles) → contro-obiezione → Limite → Sintesi.

**Content plan**
- Rule first: the modelli di sistema are read-only. To change one, duplicate it. «Duplica e modifica» creates a **modello salvato**, shared by the whole office, and opens the editor of the columns.
- Numbered procedure: 1. File › Esportazione; 2. open the scheda of a duplicable modello; 3. «Duplica e modifica»; 4. for each column: titolo, campo di GOPlanner, posizione (drag, arrows, or number), valore fisso, formato data (only for date fields); 5. add or remove columns; 6. check the first row of the file in the anteprima; 7. save (Researcher: exact button label and naming of the copy); 8. launch it like any modello: it uses the same engine and the same coda as its origin, and appears in «Ultime esportazioni» with its own name.
- Locked titles: when the origin modello writes inside a file of the committente (a template with its header), only campo and order can change; the page says so.
- Not duplicable: fixed-position text files and modelli with their own logic (some text, letture and foto modelli): the scheda marks them «classica».
- **Consequence of «shared» (tension, see Reviewer notes):** a change to a modello salvato changes the next file of every colleague who uses it. The Researcher must find who can edit, rename and delete a modello salvato, and whether there is a history. The Writer states only what the dossier confirms.
- **Contro-obiezione 4:** «Posso correggere direttamente il modello della commessa?» → No: it is read-only by design; duplicate it. If the modello di sistema itself is wrong for every file (a wrong column for the committente), that is a request for the staff tecnico, not an edit.

**Limite (mandatory):** the function depends on an update of the commessa: without it the page shows only the modelli di sistema and no «Duplica e modifica» → staff tecnico. A modello with data proper to the commessa shows only columns and titles in the anteprima, not a sample row. Only profiles allowed to export can duplicate (in words; ch.11). The guide was written from the code; the wiki article notes it was not tried in the browser (keep this caution in the dossier; the chapter states only labels confirmed in code).

**Sintesi:** never change what the commessa gave; copy it, name it, and remember that the copy belongs to the whole office.

**DEV box (max 4 lines):** saved modelli in the commessa's table `mappature_export` (migration `0039_mappature_export.sql`); classes `MappaturaEsportazione`, `MappatureEsportazioneController`, `EsportazioneModelli`; UI `js/code/esportazione-modelli.js`; GOP-818.

**Key facts the Researcher must find**
- `js/code/esportazione-modelli.js`, `lib/MappaturaEsportazione.php`, `lib/MappatureEsportazioneController.php`: exact labels (editor title, column fields, save, delete, rename), who can edit or delete, whether the copy carries the author's name («una copia con il tuo nome» in the wiki: confirm what the name is, without real names), whether saved modelli are versioned.
- Which modelli are non-duplicable and the exact badge text («classica»?).
- `changeset/2026-11-19-gop-818-modelli-esportazione-salvati.md`; GOP-818 in Jira.
- Can Gea propose an export modello change? (`lib/ChatbotStrumentoProponiMappatura.php`: import only, or export too?) One sentence + ch.10 pointer only if confirmed.

---

### § 5 — `## L'esportazione delle foto`
**Tag:** [UFFICIO] (one DEV box with the real case)
**Core question:** What goes into a foto esportazione, what never goes in, and how does the office read a result with fewer foto than expected?
**Word target:** 850 (range 800–1.000)
**Paragraph functions:** Aggancio → Spiegazione (what goes in) → Dimostrazione (the firme rule; the final message) → Dimostrazione (real case) → Limite → Sintesi.

**Content plan**
- A foto esportazione produces an archive (ZIP) of the foto of the selected interventi; it always runs in background (`ExportFotoJob`). Same page, same filters, same «Ultime esportazioni». The Researcher finds how files are named or grouped inside the ZIP; the Writer uses it only if found.
- **Firme are never in the file and never counted, whatever the format.** Three kinds (bulleted): the firma type of the commessa; the firma of the domiciliazione; any foto the app marked as firma. So a file with fewer images than foto taken is not «foto mancanti» when the difference is firme. One sentence: how the operatore takes foto and firma is in ch.8.
- **A foto that cannot be read is skipped, not fatal.** It is counted, and the final message says how many foto are not in the file. Foto missing from disk are counted the same way.
- **Real case (problem → cause → fix, 13–16 novembre 2026, no personal data, one commessa unnamed):** the foto esportazione opened every image as a JPEG; the foto of the avvisi are saved as PNG; one PNG in the period made the whole esportazione fail, and an utente retried it five times with the same result. The cause was written only in the log of the service that runs the queued jobs, which is lost at every restart, so Gea could not explain it. Fix (GOP-824): foto opened by their true type; an unreadable foto skipped and counted; every failed queued job now writes its cause in the commessa's registro errori with the number of the esportazione. Lesson for the office: an esportazione that fails again and again on the same period has a cause; after 16 novembre 2026 it is recorded (§ 6).

**Limite (mandatory):** some foto modelli of specific commesse have their own branch on the page and stay synchronous, without link; foto missing from the disk are a question for the staff tecnico (the esportazione can only count them); a very long period can exhaust memory → shorter periods (§ 6). Recovery of foto lost from the disk is not an office action (pointer to ch.12 only if the dossier supports a runbook).

**Sintesi:** in the ZIP, read the final message before counting the images: firme never enter, unreadable foto are counted, a failure has a recorded cause.

**DEV box (max 4 lines):** `lib/BaseFotoExport.php` (`apriImmagine()`, firme from `MobileV3\Domain\Firma::tipiFirma()`), `lib/jobs/ExportFotoJob.php`, `lib/BaseErrorHandler.php` (`erroreJob()`), `lib/Queue.php` (`segnalaFallimento()`); column `esportazioni_registro.errore` (migration `0037_esportazioni_registro_errore.sql`).

**Key facts the Researcher must find**
- **[CONFLICT] to resolve:** `wiki/assistenza-clienti/runbook-export-foto-png.md` says the foto of the avvisi are «tipo foto 99»; `wiki/assistenza-clienti/stato-import-export.md` and `lib/BaseFotoExport.php:64` say the firma type of the commessa is 99 unless `$custom['mobile']['firma_tipo_foto']` sets another. If both are true, avvisi foto would be excluded as firme on commesse with the default. Check `MobileV3\Domain\Firma::tipiFirma()` and where avvisi foto get their type; record the resolution. The chapter must not state a tipo number in UFFICIO text unless resolved.
- Firma domiciliazione = tipo 98: confirm in code.
- Exact text of the final message with skipped foto (`BaseFotoExport`), and the failure texts «Nessuna delle N foto era leggibile sul disco» and «Lo ZIP non è stato creato».
- ZIP structure (folders, file names): `BaseFotoExport` / `ExportFotoJob`. Do not copy real codes or names.
- Dates: incident 13–16 novembre 2026; fix MR 680 (GOP-824); changeset `2026-11-16-gop-824-export-foto-causa.md`; banco cases `R-2026-11-16-export-foto-fallito`, `R-2026-11-16-export-foto-png-log` (find where the banco lives, cite by path).

---

### § 6 — `## Quando l'esportazione è vuota, fallita o scaduta`
**Tag:** [UFFICIO], with `### Che cosa dare allo staff tecnico` usable by [STAFF] (one DEV/STAFF box)
**Core question:** What does the office check, in which order, when an esportazione is empty, failed, short or expired, and when does it stop and pass it on?
**Word target:** 1.000 (range 900–1.150)
**Paragraph functions:** Aggancio (the first place to look) → Dimostrazione (symptom table) → Spiegazione (known causes) → contro-obiezione → Procedura (what to give the staff) → Limite → Sintesi.

**Content plan**
- First place to look: the row in «Ultime esportazioni» (stato, righe esportate and scartate, period, modello, message). Gea reads the same registro and can explain it in words: one sentence + «vedi il capitolo 10».
- **Symptom table** (symptom → what it means → what to do):
  - 0 righe attese → the filters select nothing → § 2 checks.
  - Righe in the file fewer than attese → the difference is almost always the scartati.
  - Number of rows not shown (an Excel esportazione done at once, without coda) → the number was not recorded; it does not mean zero.
  - In coda / In corso → still working, not an error.
  - Fallita with a recorded cause → read it (known causes below).
  - Fallita without a recorded cause → the cause was not recorded (failures before 16 novembre 2026, or a commessa without the update); do not deduce it from the absence of logs → staff tecnico.
  - File scaduto (over 30 giorni) → export again.
  - Completata without «Scarica» → a modello that sends, or no data (§ 3).
- `### Le cause note` — bulleted, each with its remedy: «Nessuna delle N foto era leggibile sul disco» / «Lo ZIP non è stato creato» → foto missing or damaged on disk → staff tecnico; memory exhausted («Allowed memory size…», quoted as the technical text the registro may show, in a short form) → the period is too large → retry with a shorter period; «Il lavoro non dava più segni di vita» → the service restarted halfway → retry; if it repeats, staff tecnico; the PNG case of § 5 → already fixed; if it appears again on a recent esportazione it is a new defect → staff tecnico.
- **Contro-obiezione 5:** «Nei log non c'è nulla: quindi l'esportazione è andata bene?» → No. Before 16 novembre 2026 the queued jobs did not write in the registro errori: a missing log proves nothing. Say «causa non registrata» and pass it on.
- `### Che cosa dare allo staff tecnico` — numbered list of what to pass: 1. numero dell'esportazione; 2. ora; 3. modello and period; 4. the recorded cause, if any; 5. the codice errore (8 cifre) found in the logs, if any. Never copy file paths or the raw technical text into a message to the committente.
- One sentence on the historical case of ch.6 (esecuzioni orphaned by a deletion falling out of the esportazione; fixed): pointer only, no retelling.

**Limite (mandatory):** the saved cause exists only for failures after the update and on commesse where it has been applied; the office cannot read the worker's logs (Admin › Errori app e Log is ch.12, for whoever has access); an esportazione failed for a technical cause is redone after the staff tecnico's answer, not in a loop.

**Sintesi:** read the row before relaunching; relaunch only when the cause says it helps (filters, period, a restart); pass on everything else with its number and time.

**DEV/STAFF box (max 4 lines):** registro `esportazioni_registro` (stato, `record_attesi`, `righe`, `scartati`, `righe_registrate`, `errore` 255 caratteri without paths via `causaDaEccezione()`); Gea's tools `stato_import_export` and `log_import_export` (`lib/ChatbotImportExport.php`); job errors in the registro errori via `BaseErrorHandler::erroreJob()` from 16 novembre 2026. Runbooks: `wiki/assistenza-clienti/runbook-export-vuoto-o-fallito.md`, `runbook-export-foto-png.md`.

**Key facts the Researcher must find**
- Confirm every cause text in `lib/EsportazioneRegistro.php` (`causaDaEccezione()`), `lib/jobs/ExportInterventiJob.php` (fatal memory error closes the row as failed), the heartbeat («non dava più segni di vita»: which timeout, in minutes, `lib/Queue.php` or `AvanzamentoJob`).
- The 16 novembre 2026 cutoff (job errors in the registro errori) and the codice errore format (8 cifre) in `lib/BaseErrorHandler.php`.
- `righe_registrate` false for synchronous Excel esportazioni: confirm which paths.
- `docs/03-cookbooks/35-errori-dei-job-in-background.md` for the staff side.
- Jira GOP-739 (Gea import/export), banco case `R-2026-11-09-export-fallito`.

---

### Closing (no separate `##`)
A 3–5 line `> **Quando chiedere allo staff tecnico:**` box placed after § 6's Limite and before the final paragraph, collecting the stop points of the whole chapter (the ch.6 review found them scattered): Fallita without a recorded cause; foto missing from disk; «Duplica e modifica» or «Ultime esportazioni» missing on the commessa; a modello di sistema wrong for every file; not knowing whether the modello takes only verified interventi; «Completata» files from before 16 novembre 2026 that cannot be downloaded.
Then **one final paragraph** of 3–5 sentences that states the chapter rule (see TARGET). It must not start with «quindi», «In sintesi» or «In conclusione» and must not reuse the ch.6 closing structure («servono due risposte»).

### `## Fonti`
Built by the Writer from the dossier entries actually used, in the STYLE_BIBLE format (`codice: …`, `wiki: …`, `docs: …`, `Portolano: …`, `Jira: GOP-NNN — titolo breve`). **Every Jira key with its short title** (the ch.6 review found bare keys). Every code file named in a DEV box must be in the list.

---

## REVIEWER READINESS NOTES

### Tension points (where the chapter must create real stakes)
1. **The file is a snapshot (§ 1, § 2, § 3).** Stakes: the committente receives a file that was right at launch time and wrong a day later (esecuzioni arrived later, corrections made after), and the office relaunches with «Ripeti», which moves the period forward, so it sends December instead of November again. Build-up: opening case → «Filtra per» → «Ripeti». It must resolve into a rule (relaunch the same period by hand), not into fear.
2. **Verified or not: the same button, two opposite risks (§ 1).** On a standard modello, unverified esecuzioni go to the committente if the filters select them. On a commessa whose modello takes only Controllato, unverified ones are missing. The office must know which kind of modello it has. That is a fact about the modello, not a habit.
3. **The link that opens without logging in (§ 3).** Stakes: data of utenze leave GOPlanner to whoever holds the link. It must be balanced in the same paragraph (see guards).
4. **«Completata» is not «consegnata» (§ 3, § 5, § 6).** A «Completata» can have no file (a modello that sends; no data), fewer foto (skipped, counted), or (before 16 novembre 2026) a file nobody could download. The reader learns to read the message, not the stato word.
5. **Fails again and again (§ 5).** Five retries on the same period with the same failure: the real case shows why relaunching does not fix a technical cause, and why the recorded cause now matters.

### Key chains to make explicit (cause → consequence → reader action)
- Intervento without esecuzione → no row in `interventi_eseguiti` → not in the file → check the esecuzione first (ch.6), then the filters.
- Esecuzione arrived after the launch → not in that file → relaunch the same period by hand, not «Ripeti».
- «Filtra per» pianificazione vs esecuzione → different rows for the same month → choose the date the committente's question uses.
- Correction in the Verifica → (if `data_m` is confirmed as last change) the intervento moves into today's «validazione» period → do not use «validazione» to mean «verified in the period» unless the commessa has a real validation date.
- Standard modello has no stato filter → unverified esecuzioni can be sent → verify before exporting, or confirm that the modello filters (ch.6).
- Esportazione does not write the stato → an exported intervento still reads Controllato → whether it left is read in «Ultime esportazioni».
- File older than 30 giorni → «File scaduto» → a link to it stops working too → new esportazione, new link.
- Link no longer needed → «Revoca link» → the link stops at once; the file stays in the list.
- Modello salvato is shared → one colleague's change changes everyone's next file → agree before changing a shared copy (state only if the dossier confirms anyone can edit it).
- Foto failed before 16 novembre 2026 with empty cause → cause not recorded → do not guess, pass it on.
- Same failure on every relaunch → technical cause → stop relaunching; pass number, time, period, cause.

### Risk proportionality guards (each risk paired with its balancing context)
- **Public link** → in the same paragraph: 256-bit random code, not the file name; folder not browsable; every access through a link recorded; expiry (30 giorni by default, never beyond the file); «Revoca link» acts at once. No alarmist wording; no policy the sources do not state.
- **Unverified esecuzioni in the file** → balance: the office controls it with the esito filter and by verifying first; some modelli already filter. Do not present it as a defect.
- **XML not implemented, «Excel 2007» = .xls** → balance: the other formats work; a modello that declares its own format overrides the choice. One sentence each, no drama.
- **Export failures** → balance: an unreadable foto no longer fails the esportazione (skipped and counted); since 16 novembre 2026 the cause is recorded; relaunching is safe for the data (the standard esportazione only reads).
- **File scaduto after 30 giorni** → balance: nothing is lost in GOPlanner; the esecuzioni are still there; a new esportazione of the same period rebuilds the file (with today's data: say so).
- **Shared modelli salvati** → balance: the modelli di sistema can never be changed by the office, so a mistake in a copy never touches the commessa's modello.
- **Relaunching a modello that sends (mail, SOAP, FTP)** → state only what the dossier confirms; if unconfirmed, the Writer says «chiedere allo staff tecnico prima di rilanciare un modello che invia».

### Counter-objections planned (STYLE_BIBLE requires ≥ 2; five are planned)
1. § 1 — «Ho esportato ieri: perché l'intervento è ancora Controllato e non Inviato?»
2. § 2 — «Il pulsante dice 0 interventi, ma il lavoro è stato fatto.»
3. § 3 — «L'esportazione è Completata ma non c'è Scarica.»
4. § 4 — «Posso correggere direttamente il modello della commessa?»
5. § 6 — «Nei log non c'è nulla: quindi è andata bene?»

### Lessons carried from the ch.6 review (Writer and Editor)
- The opening case must prove the thesis it introduces (the ch.6 hook did not). Here: the file answered the question asked at launch.
- Do not leak style-bible wording into prose («dichiarato come tale», «Limite:», «Sintesi:» as labels).
- No vague quantifiers («parecchio», «la maggior parte») without a count from the dossier.
- No «come si è visto» without a chapter number.
- Every guillemet is a UI label; a gloss is not quoted.
- The closing is chapter-level, separate from § 6, not introduced by «quindi».
- Fonti: every Jira key with its title; every code file named in the text.

### Litmus test for this chapter
A new back-office colleague, with only this chapter, can: send November's file to the committente and know which interventi it contains and why; send it by link and withdraw the link; give the committente a version with one more column without touching the commessa's modello; explain a foto ZIP with fewer images than expected; and, when an esportazione fails, know whether to relaunch it or pass it on, and with which data.

---

## RESEARCHER BRIEF

**Web search terms:** none. INSTRUCTION.md § Researcher, SOURCE OVERRIDE: the web is not a source for this book. Use only the sources below, in this priority order. The GOPlanner repository is READ ONLY (no checkout, pull, stash, composer, npm, no writes).

### Documents to prioritize (in order)
1. Code on `php8` (authority when sources disagree).
2. Changesets of November 2026 (`changeset/`), which give dates and the «Per il cliente» wording.
3. Wiki articles under `wiki/assistenza-clienti/` (listed below). Prefer those dated 2026-11-09 or later; `export-dati.md` has a 2026-09-06 header but was updated afterwards (the GOP-818 section): check each claim against code.
4. Docs under `docs/02-patterns/` and `docs/03-cookbooks/`.
5. Portolano, then Jira.

### Wiki paths
- `wiki/assistenza-clienti/export-dati.md` (main article)
- `wiki/assistenza-clienti/esportazione-modelli-salvati.md` (GOP-818; «non provato nel browser»)
- `wiki/assistenza-clienti/runbook-export-vuoto-o-fallito.md`
- `wiki/assistenza-clienti/runbook-export-foto-png.md`
- `wiki/assistenza-clienti/stato-import-export.md`
- `wiki/assistenza-clienti/pagina-file.md` (menu File voices)
- `wiki/assistenza-clienti/runbook-attivita-utente.md` (Gea's advice after an export gone wrong: pointer to ch.10 only)
- `wiki/assistenza-clienti/verifica-interventi-iren.md` (the Controllato-only return file: one commessa; continuity with ch.6)
- `wiki/index.md` → search for any other `export`/`esportazion` article

### Docs paths
- `docs/02-patterns/15-data-export-pattern.md`
- `docs/02-patterns/41-avanzamento-job-asincroni.md`, `docs/02-patterns/47-ogni-job-asincrono-avanzamento-modale-segnalibro.md` (segnalibro; DEV box only)
- `docs/03-cookbooks/02-create-import-export-map.md` (what a mappatura di esportazione declares: `formato`, `template`, `firstRow`, `model`)
- `docs/03-cookbooks/33-esportare-in-excel-una-griglia.md` (only to decide the one-line «Esporta in Excel» Limite)
- `docs/03-cookbooks/35-errori-dei-job-in-background.md`
- `docs/cc/2026-10-12-gop429-recupero-foto-orfane.md` (only if it supports a «foto missing from disk» pointer)
- `docs/01-foundations/07-database-schema.md` (columns `data`, `data_m` of `interventi_eseguiti`; check against migrations)

### Changesets
- `changeset/2026-11-15-gop-817-esportazione-come-importazione.md`
- `changeset/2026-11-17-gop-817-esportazione-classe-tenant.md`
- `changeset/2026-11-16-gop-647-export-in-coda-volume-condiviso.md`
- `changeset/2026-11-24-gop-647-esportazioni-async-link.md`
- `changeset/2026-11-16-gop-824-export-foto-causa.md`
- `changeset/2026-11-19-gop-818-modelli-esportazione-salvati.md`
- `changeset/2026-11-09-gop-739-chatbot-import-export.md`

### Code paths and grep patterns (read-only: `git grep`, Read, Grep)
- `pages/file.php` — menu rule (lines ~37–52), `action=esportazione`, `action=esportazione_classica`, `action=export`, the own-branch modelli
- `Smarty_templates/it/esportazione.html`, `Smarty_templates/it/file.html` (block `esportazione_classica`)
- `js/code/esportazione.js` — `Filtra per`, quick buttons, riepilogo, disabled reasons, `Ripeti` (~line 85), segnalibro
- `js/code/esportazione-modelli.js` — editor labels
- `lib/ExportInterventiQuery.php` — `filterClauses()` (date fields, esito, lista, operatore, lotto, cliente, the `IN (...)` clause at ~line 74: which column?)
- `lib/ExportBase.php`, `lib/Export.php` — formats, `Excel5`, XML
- `lib/EsportazioneModelli.php` — `RAMI_PAGINA`, scheda data, «classica» flag
- `lib/EsportazioneRegistro.php` — `GIORNI_CONSERVAZIONE`, stati, `chiudi()`, `causaDaEccezione()`, retention job
- `lib/EsportazioneLink.php`, `scarica_link.php` — validity, revoke, access log (never copy a token or a full URL)
- `lib/MappaturaEsportazione.php`, `lib/MappatureEsportazioneController.php`
- `lib/jobs/ExportInterventiJob.php`, `lib/jobs/ExportFotoJob.php`, `lib/BaseFotoExport.php` (`apriImmagine()`, firme)
- `lib/MobileV3/Domain/Firma.php` — `tipiFirma()`
- `lib/JSONController.php` — `function export`, `isExportFileInCoda`, `enqueueStandardExport`, `enqueueFotoExport`
- `lib/ChatbotImportExport.php` — `stato_import_export`, `log_import_export` (DEV/STAFF box only)
- `lib/BaseErrorHandler.php` (`erroreJob()`), `lib/Queue.php` (`segnalaFallimento()`), `AvanzamentoJob` (`registraAttivo()`)
- `lib/dict/lang_it.php` — grep: `Ultime esportazioni`, `Esportazione classica`, `Scarica il file`, `Copia link`, `Revoca`, `Ripeti`, `Duplica`, `scadut`, `Nessun dato da esportare`, `In coda`, `In corso`, `Completata`, `Fallita`, `Annullata`
- Migrations: `migrations/tenant/0037_esportazioni_registro_errore.sql`, `0039_mappature_export.sql`, `0045_esportazioni_link.sql`, `lib/db/2026-09-05-gop241-registro-esportazioni.sql`
- Stato-7 writers (continuity): `git grep -n "STATO_INVIATO\|stato_id.*= *7" -- lib pages` (the Architect found `lib/ADMINController.php`, `lib/AvanzamentoCarichi.php`, `lib/InterventoEseguitoBase.php`, `lib/UtenzaBase.php`, `lib/export_letture_aceaA4.inc.php`; check which ones *write*)
- Stato filters inside modelli: `git grep -n "stato_id\|controllat" -- 'custom/*/php/mappature.php'` (count; one example for the dossier)
- `data_m`: `git grep -n "data_m" -- lib/InterventoEseguitoBase.php lib/VerificaInterventi.php migrations/` and the column definition
- Tests that pin behaviour: `tests/export_ui/esportazione.test.mjs`

### Portolano queries (`mcp__rag_qdrant_server__query_rag_hybrid`, `user_roles: ""` — EMPTY string, per INSTRUCTION.md; fall back to `query_rag`)
- «esportazione file committente modello filtri periodo»
- «Esportazione classica pagina nuova GOP-817»
- «esportazione in coda segnalibro avanzamento Ultime esportazioni»
- «Copia link Revoca link esportazione 30 giorni»
- «file scaduto esportazione conservazione»
- «Duplica e modifica modello salvato mappature_export»
- «export foto ZIP firme PNG avvisi fallito»
- «export vuoto fallito causa errore registro»
- «Filtra per data validazione esecuzione pianificazione»
- «formato XML Excel 2007 xls esportazione»

### JQL fragments (cloudId `21873985-2e5d-4a8a-bb45-e6d453128985`, project GOP, READ ONLY)
- `project = GOP AND key in (GOP-241, GOP-641, GOP-647, GOP-739, GOP-743, GOP-817, GOP-818, GOP-824)` — titles for Fonti; GOP-641 only to check whether an «Inviato» change is planned (continuity with ch.6; if open, say nothing about future behaviour)
- `project = GOP AND text ~ "esportazione" AND updated >= -90d ORDER BY updated DESC`
- `project = GOP AND text ~ "export" AND text ~ "foto" ORDER BY updated DESC`
- `project = GOP AND text ~ "Copia link" ORDER BY updated DESC`
- `project = GOP AND text ~ "modelli salvati" ORDER BY updated DESC`
- Purpose: titles for Fonti, dates, and at most one more real story (problem → cause → fix) told without personal data or contract details.

### Specific facts, numbers and labels to hunt
- Numbers: 30 giorni (file); 30 giorni default (link) and the per-commessa setting; 15 rows in «Ultime esportazioni» (vs 10 in Gea's tool); 256-bit link code; 255 characters of the saved cause; 8-digit codice errore; 16 novembre 2026 (job errors recorded); 24 novembre 2026 (classic modelli in background); 13–16 novembre 2026 (PNG incident; five retries).
- Labels: every label listed in § 2–§ 4 «Key facts», exactly as in `lang_it.php` or the template.
- Messages: «Nessun dato da esportare con questi filtri»; «Inviati N di M»; the 409 one-at-a-time message; link revoked / link expired / file expired / migration missing; the final message with skipped foto; «Nessuna delle N foto era leggibile sul disco»; «Lo ZIP non è stato creato»; «Il lavoro non dava più segni di vita».
- Behaviour to confirm: no generic write-back; `data_m` semantics; `interventi_eseguiti.data` semantics; relaunch of a modello that sends; who can edit or delete a modello salvato; whether «Annullata» is user-triggered.

### Mandatory [CONFLICT] items to record
1. Tipo foto 99: avvisi foto (runbook PNG) vs default firma type (`BaseFotoExport`, `stato-import-export.md`).
2. Link expiry: wiki «30 giorni» (fixed) vs code «configurable per commessa, default = file retention; the captain has not chosen yet» (`EsportazioneLink.php` docblock). The chapter says «30 giorni salvo diversa impostazione della commessa».
3. Commesse without the registro migration: wiki `export-dati.md` says the button reloads the page without a file and without a clear message. Check whether this is still true on `php8` after GOP-817/647, and how the page behaves without `0037`, `0039`, `0045`.
4. «Validazione» filter label vs `interventi_eseguiti.data_m` (a last-change timestamp?), and vs a real «Data validazione» on one commessa (ch.6).
5. «Ultime esportazioni»: 15 (page, `export-dati.md`) vs 10 (Gea, `stato-import-export.md`).
6. Menu location: wiki «menu laterale, voce Esportazione» vs changeset «File › Esportazione»: the Architect found both entries in the left menu of `pages/file.php`; confirm the path as the reader sees it.

### Security filter reminder
No tokens, links, full URLs, container or host paths, `.env` values, logins, names of utenti/operatori/intestatari, real codes of utenze, matricole, contents of exported files, contractual or tender details of committenti. Committente names: at most one per section, only as an example of a commessa. In UFFICIO text no tenant codes.

---

## TARGET

- **Word count:** 5.400–5.800 words in total (PRD § 4: 4.000–6.000). Breakdown: «In questo capitolo» ~80; § 1 850; § 2 1.000; § 3 1.100; § 4 850; § 5 850; § 6 1.000; «Quando chiedere» box + closing paragraph ~150; `## Fonti` outside the count.
- **Opening hook strategy:** open § 1 on one invented case, said to be invented in plain words: on 1 dicembre the office exports November with «Mese precedente», the button says 412 and the file has 412 rows, the committente expects 415, and the three missing interventi were done on 30 novembre and reached GOPlanner on 2 dicembre. The file was right for the moment it was made, which is the thesis. *(Requires the Researcher to confirm that `interventi_eseguiti.data` is the time recorded on the phone; if not, the fallback case is an esito corrected in the Verifica after the esportazione had left.)*
- **Closing beat promise:** end on a rule for the desk, not an echo of chapter 6: a file answers the question asked at launch. Before sending it, read in the riepilogo the modello, «Filtra per», the period, the esito and the number. To send the same period again after a correction, set the period by hand («Ripeti» moves it forward). The file lasts 30 giorni and the link no longer than the file.
