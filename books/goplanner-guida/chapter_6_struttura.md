# Chapter 6 — Struttura (Architect spec)

**Chapter title (H1 for the Writer):** `# 6. Interventi, esiti e verifica`
**PRD row:** «Il ciclo di vita di un intervento: stati, esecuzioni (`interventi_eseguiti`), riaffidare, ripianificare un non fattibile, eliminare il precedente, Verifica interventi e analisi AI delle foto» — audience **BACKOFFICE**.
**Core question of the chapter:** after an intervento leaves the Piano, what can the office do with it, and what does each button keep or destroy?
**Chapter thesis (the rule the whole chapter proves):** an intervento has two records, the planned one (`interventi`) and the one the operator returned (`interventi_eseguiti`). Every office action (Modifica, Annulla, Elimina, Ripianifica, Verificato, the AI review) touches one, the other or both, and the reader must know which before pressing the button.

### Continuity and glossary check (done by the Architect, 25 novembre 2026)
- `chapter_index.md`: not present yet. No established claims to contradict. Chapters 1–5 run in parallel; this spec only points to them.
- `NARRATIVE_GLOSSARY.md`: not present yet. Canonical vocabulary = `/home/alan/firstmate/projects/GOPlanner/CONTEXT.md`.
- **Glossary traps specific to this chapter (Writer and Editor must check all five):**
  1. **Esito ≠ stato.** Esito = what the operator records with the app (eseguito, or non eseguito with the motivo). Stato = where the intervento is (assegnato, eseguito, controllato…). The Verifica page has a field labelled «Esito intervento» that actually sets the stato, and a second field «Esito» (Positivo/Negativo). Quote both labels exactly and say once, plainly, which is which.
  2. **«Verificato» is the button; «Controllato» is the stato it writes (code 6).** Never write «stato Verificato» in UFFICIO text.
  3. **Operatore**, never «tecnico» or «utente» for the field worker, even though some pages say «tecnico» (e.g. Interventi › Da assegnare). If a UI label says «tecnico», quote it as a label.
  4. **Attività** in the glossary means *what a user or operatore did in the gestionale* (log-like), not an intervento. Do not use «attività» for interventi.
  5. **«Cliente»/«Clienti»/«Campi del cliente»/«Anagrafica»** appear only as quoted UI labels («Clienti», «Cliente»). In prose: committente or utenza. «Tenant» only inside `> **Per gli sviluppatori:**` boxes, with the correspondence stated the first time («la commessa, che nel codice si chiama tenant»).
- **AI vocabulary rule (hard, from `docs/analisi-ai/contratto.md`):** in UFFICIO text there is only «AI». Never a model name, vendor or provider, not even in DEV boxes.

### Chapter boundaries (one-line pointers only, per PRD § 4 «Confini tra capitoli»)
| Topic touched here | Owned by | What ch.6 may say |
|---|---|---|
| Stato of an utenza derived from the last intervento touched | ch.3 | One sentence + «vedi il capitolo 3». Use it only inside the diagnosis of § 2 |
| Assegna, Interventi › Pianificazione, Interventi › Mappa «Elimina» | ch.5 | One sentence: Assegna creates interventi for utenze that have none; it does not reassign |
| How the operator records esito, foto, firma from the phone; Rapportino from the app | ch.8 | One sentence: the app side is in ch.8; here only what arrives in the office |
| Export built from `interventi_eseguiti`; return file that takes only Controllato | ch.7 | The *consequence* (why Verificato matters, why a deleted esito disappears from the export), then «vedi il capitolo 7» |
| Gea preparing a change with «Autorizza»; Gea proposing an AI rule | ch.10 | One sentence each |
| Runbook «dove si è fermato il dato», Admin › Cruscotto Analisi AI, Admin › Manutenzione «Analisi AI per carico» | ch.12 | One sentence each |
| Table schemas `interventi`, `interventi_eseguiti`, `stati` | ch.14 | DEV boxes only, max 4 lines each |

---

## NUFs (Goal Scoring)

Ten NUFs, so the Editor can score them one point each against the 8.5/10 gate. Format per INSTRUCTION.md § Architect.

```
utility(reader): Reader can name every stato an intervento can have (codes 1–10 and 99), say which actor sets it (importazione, pianificazione, app, Verifica, esportazione, back office, call center) and which stati are final for office actions → score += 1

utility(reader): Reader can explain the difference between an intervento (`interventi`) and its esecuzione (`interventi_eseguiti`), and use it to answer «l'operatore dice di averlo chiuso ma non vedo l'esito» before opening a ticket → score += 1

utility(reader): Reader can reassign an assigned intervento to another operatore or move its date with Interventi › Lista › «Modifica» › «Modifica intervento», and knows why the row may not change (eseguito, non fattibile, controllato, inviato or ripianificabile interventi are skipped without any message) → score += 1

utility(reader): Reader can choose correctly between «Modifica», «Annulla», «Elimina» and «Ripianifica» for a given case, and knows that «Elimina» refuses an intervento that already has an esito («Intervento non cancellato perché già chiuso») → score += 1

utility(reader): Reader can ripianificare a non fattibile from Rapporti › Verifica interventi › scheda › «Ripianifica» › «Assegna incarico», and decides «Cancella precedente» with the written rule (keep it if verified, sent, exported or with useful foto; delete only if it was a mistake or a duplicate; when in doubt keep it) → score += 1

utility(reader): Reader can find an intervento in Rapporti › Verifica interventi (filters Lista, Operatore, Periodo, Codice, «Solo da verificare»), correct the fields of the scheda, and close the check with «Verificato», knowing that this writes stato Controllato (6) and that, on some commesse, only Controllato interventi reach the return file → score += 1

utility(reader): Reader can run «Analisi AI» on selected interventi or on the whole lista, read «Esito AI» (Conforme / Da verificare / Non conforme), review one intervento in the window, and end it with «Approva l'intervento» or «Rimanda all'operatore» → score += 1

utility(emotional): Reader feels safe pressing the office buttons because, for each one, they know what is kept and what is lost — and that the only irreversible loss of an esito in this chapter is «Cancella precedente» / Ripianifica on commesse without interventi multipli → score += 1

utility(emotional): Reader knows where to stop and ask the staff tecnico: AI missing on a commessa («Analisi AI non ancora disponibile su questa commessa»), an esito missing after the operatore says they sent it, a commessa still on the old Verifica page, a deleted esito to recover → score += 1

utility(factual): The chapter states, each with its source: the stato table (`lib/InterventoEseguitoBase.php` STATO_* constants, 9 Annullato and 10 Prenotato from `docs/02-patterns/23-cc-cancellazione-stato-annullato.md`); «Verificato» = stato 6 (`lib/VerificaInterventi.php` STATO_VERIFICATO); «Solo da verificare» excludes stati 6 and 7 (`VerificaInterventi::STATI_CHIUSI`); the AI review never changes the intervento by itself (`docs/analisi-ai/contratto.md` § 1); the AI settings limits (2.000 caratteri, 50 regole in più, prova on max 20 casi) from `docs/analisi-ai/impostazioni.md` → score += 1
```

---

## BEAT LIST

Six sections (`##` in the final chapter). Each needs: italic audience line at the top when not for everyone (STYLE_BIBLE § Voice rule 6), at least one exact concrete detail, at least one **Limite** paragraph, max 5 prose paragraphs in a row without a table/list/box/subheading.

Before § 1 the Writer puts the mandatory `*In questo capitolo…*` paragraph (2–3 sentences: the two records of an intervento; what the office can do after the app returns an esito; for back office, with boxes for developers).

---

### § 1 — `## Gli stati di un intervento`
**Tag:** [UFFICIO] (with one `> **Per gli sviluppatori:**` box)
**Core question:** In which stati can an intervento be, who moves it from one to the next, and which stati block further office changes?
**Word target:** 850 (range 800–1.000)
**Paragraph functions:** Aggancio (the Stato column is the first thing to read before any action) → Spiegazione → Dimostrazione (table) → Limite → Sintesi.

**Content plan**
- Markdown table, one row per stato: code, label as shown, who sets it, can the office still change operatore/data with «Modifica»? Rows: 1 Importato, 2 Validato, 3 Assegnato, 4 Eseguito, 5 Non fattibile, 6 Controllato, 7 Inviato, 8 Ripianificabile, 9 Annullato, 10 Prenotato, 99 Utente assente.
- The path of a normal intervento: Importato → Assegnato (pianificazione, ch.5) → Eseguito / Non fattibile / Utente assente / Ripianificabile (from the app, ch.8) → Controllato (Verificato) → Inviato.
- Annullato (9) is final: the call-center decision (ADR 23) says it is the administrative cancellation, while Ripianificabile (8) is «non completato sul campo, da rifissare». One sentence on why they are kept apart.
- Prenotato (10): appointment booked, not yet given to an operatore (Interventi › Da assegnare, pointer ch.5).
- Where the reader sees the stato: Interventi › Lista, column «Stato» (coloured tag) and filter «Stato».
- «Da finire» (GOP-782): only on commesse that declare it; the operatore saved halfway; the Verifica page will not close it.
- Stato of the utenza: one sentence + «vedi il capitolo 3».

**Limite (mandatory):** labels and the set of stati shown can change by commessa (`stati` in `VerificaInterventi::configPredefinita()` is overridable); the Lista without filters shows only interventi with «Data pianificata» in the last six months.

**DEV box:** `interventi.stato_id` and `interventi_eseguiti.stato_id` → table `stati`; constants in `lib/InterventoEseguitoBase.php` and `lib/UtenzaBase.php`; label map in `lib/VerificaInterventi.php`.

**Key facts the Researcher must find**
- Exact label of every code in the UI (Lista tag and Verifica tag), including whether 8, 9, 10 appear as tags in the Verifica page (they are not in the default `stati` array: check).
- Who writes stato 7 Inviato (export? a specific action?) — exact code path.
- Who writes stato 2 Validato, and whether it is still used on `php8`.
- Which commesse declare `stato_da_finire`, and the exact «Da finire» message text (`VerificaInterventi::MOTIVO_DA_FINIRE`).
- The «Ripianificabile» esito from the app: what the office sees and does with it (`lib/InterventoBase.php:266`, `lib/InterventoEseguitoBase.php:444`, `lib/AndroidController.php:686`). Is there a page or filter that lists them? If not found: `[UNVERIFIED]`.

---

### § 2 — `## Intervento ed esecuzione: che cosa torna dal telefono`
**Tag:** [TUTTI] (one DEV box)
**Core question:** What is stored when the operatore closes an intervento, where does it live, and why does the difference between intervento and esecuzione explain most «missing data» questions?
**Word target:** 900 (range 800–1.100)
**Paragraph functions:** Aggancio (a real support question) → Spiegazione → Dimostrazione (list of data in an esecuzione; esiti table) → contro-obiezione → Limite.

**Content plan**
- The intervento (`interventi`) is the job: utenza, lista, operatore, data. The esecuzione (`interventi_eseguiti`) is what came back: date and time, position (lat/lng, precision, distance), letture, `servizi` (the campi personalizzati of closure), stato, esito (1 positivo / 0 negativo), motivo, note; the foto are attached to the intervento eseguito.
- Esiti of GOPlanner 3 and the stato they write (table from `EsitoCatalog::DEFAULTS`): Eseguito → 4; Non fattibile → 5; Ripianificabile → 8; Utente assente → 99; the save-halfway esito → stays 3 (does not close). State clearly that the app side is ch.8.
- Three consequences, each in one sentence: (a) the export starts from the esecuzioni, so an intervento without esecuzione is not in the file (pointer ch.7); (b) the foto belong to the intervento eseguito, so opening a different intervento of the same utenza shows «no foto» without anything being lost; (c) an utenza can still read «assegnato» after a closure when the commessa has interventi multipli (one sentence + «vedi il capitolo 3»).
- **Contro-obiezione 1:** «L'operatore dice di aver chiuso l'intervento, ma in ufficio non vedo l'esito.» Answer in order: is it the right intervento of the utenza? → filter the Lista by operatore and date → if the esecuzione is really missing, the data stopped between phone and server: runbook «dove si è fermato il dato» (one sentence + «vedi il capitolo 12»).

**Limite (mandatory):** the office can correct an esecuzione only from the Verifica page (§ 5); there is no button to re-create an esecuzione lost on the phone; on most commesse a later resend from the app can overwrite an office correction — only commesse with the «backoffice» protection keep it (see § 5).

**DEV box:** one-to-one link via the intervento; gotcha from `docs/02-patterns/21-guard-cancellazione-intervento-eseguito.md`: `InterventoBase::getInterventoEseguito()` never returns null (check `!$ie->isNew()`).

**Key facts the Researcher must find**
- Exact columns of `interventi_eseguiti` on `php8` (the schema doc may be older than the code; check `lib/InterventoEseguitoBase.php` properties) — at least: `data`, `lat`, `lng`, `servizi`, `stato_id`, `esito`, `motivo`, `note`, `backoffice` (tenant-specific?).
- Where foto are linked (table `foto`? column?) — `lib/MobileV3/Domain/FotoStore.php`, `pages/foto.php`.
- Whether `interventi_eseguiti` has an `id_intervento` column or the link is the same id: exact join.
- `EsitoCatalog` labels and the GOP-782 rule «mai Rapportino» in the UI.

---

### § 3 — `## Cambiare operatore o data: Modifica, Annulla, Elimina`
**Tag:** [UFFICIO] (one DEV box with the real case)
**Core question:** How does the office reassign or move an intervento already assigned, and when must it annul or delete it instead?
**Word target:** 1.000 (range 900–1.200)
**Paragraph functions:** Aggancio → Procedura (numbered) → Spiegazione (which stati, why not Assegna) → Procedura (Annulla, Elimina) → Dimostrazione (real case) → Limite → Sintesi.

**Content plan**
- `### Riaffidare o spostare` — numbered procedure: 1. Interventi › Lista; 2. choose the «Lista» in the bar, filter or search; 3. select the row(s); 4. «Modifica» → window «Modifica intervento» showing how many are selected; 5. choose «Operatore» and/or «Data» (gg/mm/aaaa), leave empty what must not change; 6. «Modifica intervento»; 7. check operatore and data in the reloaded row.
- The rule: only Assegnato (3) and Annullato (9). An Annullato stays Annullato: only operatore and data change. Eseguito, Non fattibile, Controllato, Inviato, Ripianificabile are **skipped without any message** and the list reloads as if it worked. Sintesi: «se la riga non cambia, guarda lo Stato».
- Why not «Assegna»: it creates the intervento for utenze that have none; on an utenza already assigned it reports «già pianificata/già assegnata» (one sentence, pointer ch.5).
- `### Annullare` — «Annulla» → stato Annullato; exact confirmation text «Sei sicuro di voler annullare gli interventi selezionati? L'operazione non è reversibile.»
- `### Eliminare` — «Elimina»; exact confirmation text; interventi with an esito are not deleted («Intervento non cancellato perché già chiuso»); a call-center appointment is not deleted but goes to Annullato with a note at the top «[Annullato da back-office: …]» (GOP-462; do not reproduce a real login).
- Selection rule: «Tutti» selects only the visible page; the buttons work only on selected rows.
- Gea can prepare an operatore change if the user gives the intervento id; nothing happens until «Autorizza» (one sentence + «vedi il capitolo 10»).
- **Real case (DEV box, problem → cause → fix, no personal data):** on one commessa some esecuzioni disappeared from the export: interventi had been deleted with their esecuzione still in the database, and the export's join dropped the orphan rows. Fix: the delete paths now skip interventi that have an esecuzione (`Intervento::delete()`, `elimina_interventi_non_chiusi()` in `lib/json_functions.php`) and report how many were blocked. Source: `docs/02-patterns/21-guard-cancellazione-intervento-eseguito.md`. Committente name: omit or use «una commessa».

**Limite (mandatory):** the buttons and the extra fields of the «Modifica intervento» window change by commessa (some add the tipo di intervento or «Prioritario»; some lack «Aggiungi» and «Avviso»); Interventi › Mappa has its own «Elimina» that deletes all planned interventi of the operatore for that day — one sentence + «vedi il capitolo 5».

**Key facts the Researcher must find**
- Code confirmation of the stati accepted by «Modifica» (`lib/JSONController.php` `modifica_interventi`, `lib/InterventoBase.php` `modificaPianificazione`) — exact list, and confirm «nessun messaggio».
- Exact text of the Elimina confirmation and of the blocked-delete alert (`js/code/core_functions.js` `eliminaInterventi()`, `lib/JSONController.php` `elimina_intervento`, `lib/dict/lang_it.php`).
- Does «Annulla» write `interventi.stato_id = 9` or something else; can an Annullato be brought back (only via call center `book`, per ADR 23)?
- What happens to the stato of the utenza after Modifica/Annulla (`updateStatoUtenza()` call sites) — only to support one sentence.

---

### § 4 — `## Il non fattibile: Ripianifica e il destino del precedente`
**Tag:** [UFFICIO]
**Core question:** How is a non fattibile done again, and what happens to the old intervento, its esito and its foto?
**Word target:** 1.050 (range 900–1.200)
**Paragraph functions:** Aggancio (a non fattibile does not reopen) → Procedura → Spiegazione (what is created) → Spiegazione (what is lost) → Limite → Sintesi (the rule).

**Content plan**
- Principle: a closed non fattibile is not reopened and not modified. «Ripianifica» **always creates a new intervento** for the same utenza and lista, in stato Assegnato, with the chosen operatore and data; the utenza becomes Assegnata again and the operatore sees it in the app.
- Numbered procedure: 1. Rapporti › Verifica interventi; 2. find the intervento (filters) and open its scheda; 3. «Ripianifica» (bottom, next to «Verificato»); 4. window «Ripianifica» with the intervento code: «Operatore» (required), «Data» gg/mm/aaaa (required); 5. «Cancella precedente», only where the commessa has it; 6. «Assegna incarico»; 7. the notice «È stato creato un nuovo intervento» with its number.
- Error messages verbatim: «Seleziona l'operatore a cui assegnare l'intervento»; «Data di ripianificazione non valida». Nothing changes in either case.
- `### Che fine fa il precedente` — table with two rows: commesse **without** interventi multipli → Ripianifica always deletes the old one, with esito and foto (files on disk included); commesse **with** interventi multipli → «Cancella precedente» decides: without «Sì» the old one stays with esito and foto, next to the new one.
- What is lost when it is deleted (bulleted): the esito and its stato; the foto, files included; the old intervento disappears from the exports (built on esecuzioni) and from the history of the utenza; it stops counting among the non fattibili of the carico.
- Proportionality fact (must be stated next to the loss): keeping the old one does **not** inflate the numbers — in the avanzamento dei carichi a non fattibile counts only while it is the last non-annulled intervento of the utenza.
- **The rule** (Sintesi, as a short bulleted rule, then one sentence on timing): keep it if verified, sent or exported to the committente, or if foto/motivazioni matter; delete it only if recorded by mistake or a useless duplicate; when in doubt keep it. The choice is now-or-never: «Elimina» refuses a closed intervento, so a kept non fattibile cannot be removed later from the gestionale.
- **Contro-obiezione 2:** «Ma se tengo il vecchio, il carico non mi mostra un non fattibile in più?» → No: see the avanzamento rule above.

**Limite (mandatory):** the button does not check the stato (it works on any intervento open in the Verifica, not only non fattibili); commesse still on the old Verifica page have their own scheda, with «Ripianifica» elsewhere; a deleted esito cannot be recovered from the gestionale — that is a question for the staff tecnico, with no promise of recovery.

**Key facts the Researcher must find**
- `lib/JSONController.php` `ripianifica_intervento`: confirm new-intervento creation, stato 3, deletion logic with/without `interventi_multipli`, foto file deletion, exact messages.
- **Count conflict to resolve:** the wiki says commesse *without* interventi multipli are «la maggior parte»; `docs/02-patterns/34-stato-utenza-derivato-ultimo-intervento.md` says about forty tenants have it on. Count `$custom['interventi_multipli'] = true` in `custom/*/config.inc.php` against the number of tenant folders, record in [CONFLICT]. The Writer must not write «la maggior parte» unless the count supports it; otherwise «dipende dalla commessa».
- Where «Cancella precedente» comes from (`custom/sg_smat/js/custom.js`? config?) and its exact options («Sì»/«No»?).
- Avanzamento rule: `lib/AvanzamentoCarichi.php` — confirm «ultimo intervento non annullato».

---

### § 5 — `## Rapporti › Verifica interventi: controllare e chiudere`
**Tag:** [UFFICIO] (one DEV box)
**Core question:** How does the office check what came back from the field, correct it, and mark it as checked — and why does «Verificato» matter beyond the page?
**Word target:** 1.100 (range 900–1.200)
**Paragraph functions:** Aggancio → Spiegazione (layout) → Procedura → Dimostrazione (the field list; the export consequence) → contro-obiezione → Limite.

**Content plan**
- Which page: the single Verifica page (GOP-630), opened by Rapporti › Verifica interventi on the commesse that have switched to it; the others still have their previous page. Say it in one sentence, no list of tenant codes in UFFICIO text (at most one example of a commessa visible in the product, if the dossier supports it).
- `### Trovare l'intervento` — bar: «Lista», «Operatore», «Periodo», «Codice», ticks «Solo da verificare» (on at opening), «Interventi mancanti», «No tipo». Keys: up/down change intervento, left/right change foto, Invio presses «Verificato». «Codice» with a suggestion chosen shows all interventi of that utenza regardless of Periodo (only where the commessa has the utenza search — check).
- `### La scheda` — left the list, right foto and scheda. Blocks: foto strip with foto types and «Cambia tipo»; «Dati rilevati» (read-only: operatore, esito Positivo/Negativo, distanza, matricola attuale, posizione…); the verification fields (editable: «Data e ora», «Esito intervento», then the campi personalizzati of the commessa, «Note»). Every changed field saves itself; the intervento becomes checked only with «Verificato».
- Glossary trap made explicit (one short paragraph): «Esito intervento» sets the stato (Eseguito / Non fattibile…); «Esito» in «Dati rilevati» is the positive/negative flag written by the phone.
- Buttons at the bottom (bulleted): «Verificato» (→ stato Controllato, 6), «Verbale» (PDF), «Ripianifica» (§ 4), «Anagrafica» (scheda of the utenza).
- **Why Verificato matters (chain):** on some commesse the return file to the committente takes only Controllato interventi with a positive esito and the «Data validazione» in the chosen period → an intervento left unverified is missing from the file → the office presses «Verificato» before exporting. Pointer «vedi il capitolo 7».
- Office corrections and the app: on commesse with the backoffice protection, a later resend from the app does not overwrite a correction made here; on the others it can. State it as tenant-dependent.
- «Da finire»: the page refuses to close it; quote `MOTIVO_DA_FINIRE` verbatim.
- **Contro-obiezione 3:** «Ho verificato un intervento e ora non lo trovo più.» → «Solo da verificare» hides stati 6 and 7: untick it and check «Periodo».

**Limite (mandatory):** fields of the scheda, foto types, the PDF buttons and the AI button change by commessa (`$custom['verifica_unica']`); commesse not yet on the single page use their previous Verifica page, which this chapter does not describe field by field; when to ask the staff tecnico (a commessa that should have the page but doesn't).

**DEV box:** `rapporti.php?action=verifica_unica`, `lib/VerificaInterventi.php`, `js/code/verifica_unica.js`, endpoints `verifica_*` in `lib/JSONController.php`; a tenant switches on with `$custom['verifica_unica']`; extension points in `docs/03-cookbooks/34-verifica-interventi-estensioni-tenant.md` (no copy of the JS in the tenant).

**Key facts the Researcher must find**
- Exact labels of the filter bar and of the three ticks in `js/code/verifica_unica.js` (default, not one commessa's variant).
- The generic default scheda (`configPredefinita()`: `fatti`, `verifica`, `note`) vs. the commessa-specific example in `wiki/assistenza-clienti/verifica-interventi-iren.md` — the Writer must describe the default and mark the example as one commessa.
- Keyboard shortcuts in code.
- Which commesse are on the page at 24 novembre 2026 (cookbook 34) — for the dossier only; the chapter uses at most one example.
- Iren return-file rule (Controllato + Positivo + `data_validazione` in period): confirm in `custom/easy_iren` code, record as tenant-specific.
- Older page for commesse not switched: `pages/interventi.php` `action=visualizza_intervento` and `js/interventi_verifica*.js` — confirm what still exists, for the Limite paragraph only.

---

### § 6 — `## L'analisi AI delle foto: l'AI propone, l'ufficio decide`
**Tag:** [UFFICIO] with `### Le istruzioni dell'AI` tagged [UFFICIO] for amministratori (permission line in italics)
**Core question:** What does the AI check on the foto, how is its result read and reviewed, and who can change what it checks?
**Word target:** 1.100 (range 900–1.200)
**Paragraph functions:** Aggancio (the principle) → Procedura (launch) → Dimostrazione (Esito AI table) → Procedura (review window) → Spiegazione (settings) → Limite → Sintesi.

**Content plan**
- Principle first, verbatim in spirit: the AI writes nothing on the intervento; it only proposes; every change to the intervento goes through an explicit confirmation of the reviewer. The «Esito AI» is informative: it shows which foto to look at, it does not invalidate the intervento or change its stato.
- `### Lanciare l'analisi` — in Rapporti › Verifica interventi, button «Analisi AI», two modes: «Sugli interventi selezionati» (tick them first) or «In background, con avanzamento» / «Su tutto il carico» (choose a «Lista» first; you can close the window; the «Esito AI» column fills in). States: «In coda», «In corso», «Non riuscita».
- Table «Esito AI»: Conforme / Da verificare / Non conforme / Non analizzato, with what each means for the office.
- How the main checks decide (bulleted, 4–5 lines, only the ones the dossier confirms): matricola (spaces, hyphens, case ignored; one different digit → Da verificare); lettura (within tolerance → Conforme, within double → Da verificare); position of the foto vs. the utenza (metres); seal: the AI never rejects, «Non conforme» becomes «Da verificare»; several foto for one check: one non-conforming foto out of several → Da verificare, Non conforme only if all are. The registered values (matricola, lettura) are never shown to the AI.
- `### Rivedere un intervento` — window «Analisi AI delle foto»: foto with their esito; per check, confirm or correct (correction only for value checks: matricola, lettura, modello; a correction also becomes a case of the banco di riferimento); «Blocca» marks a check set to block approval; ending: «Approva l'intervento» (→ Verificato; refused while the analysis is queued or running, or while a blocking check has no decision) or «Rimanda all'operatore» (→ back to Assegnato, or «Da finire» where the commessa has it) with a note. Every action goes to the review log (who, when).
- `### Le istruzioni dell'AI` — *Per gli amministratori* (permission «impostazioni.modificare» → say it in words: chi può modificare le Impostazioni). Impostazioni › Analisi AI delle foto: tipo di lavoro (riconosciuto, «Rilevato», modificabile), controlli accesi and the foto types they run on (empty list = all foto), «Modifica a mano», versions («Rimetti questa» becomes active only with «Salva», as a new version), «Prova sul banco di riferimento» (max 20 casi, giuste / sbagliate / illeggibili per controllo), confirmations «Attiva comunque» and «Salva senza provare». Limits: 2.000 caratteri, 50 regole in più. Gea can propose a rule from this page («Autorizza»): one sentence + «vedi il capitolo 10».
- **Contro-obiezione 4:** «L'AI ha segnato Non conforme: devo rifare l'intervento?» → No by itself: look at the foto; the decision is the office's (confirm, correct, approve or send back).

**Limite (mandatory):** not every commessa has the AI (example: one commessa has it off by configuration); without the database tables the page answers «Analisi AI non ancora disponibile su questa commessa» — staff tecnico; the AI does not read data that are not in the foto; costs and the bulk launcher (Admin › Cruscotto Analisi AI, Admin › Manutenzione) are staff tools → «vedi il capitolo 12».

**Key facts the Researcher must find**
- Exact labels of the review window buttons and the confirm/correct controls in `js/code/analisi_ai.js` (the Architect saw: «Analisi AI», «Avvia in background», «Sugli interventi selezionati», «Su tutto il carico», «In background, con avanzamento», «Rivedi», «Conforme», «Da verificare», «Non conforme», «Non analizzato», «Blocca», «Scrivi il valore corretto.» — confirm, and find the exact text of the approve / send-back buttons and of the confirm/correct choice).
- Catalogue of checks and their names as shown (`lib/AnalisiAiCatalogo.php` or equivalent; contract § 2.2).
- Tolerances: default values for lettura and position, if any (contract § 2.3).
- Settings page labels and limits (`Smarty_templates/it/impostazioni_analisi_ai.html`, `js/code/impostazioni_analisi_ai.js`, `lib/ImpostazioniAnalisiAi.php`), including the wait times between two tests (10 seconds, 10 minutes reuse) only if the dossier finds them shown to the user.
- Exact unavailable message (`contratto.md` § 1.2 vs. JS «Analisi AI non disponibile»): record both if they differ, [CONFLICT].

---

### Closing (no separate `##`, last paragraph of § 6 or a 3-line `> **Quando chiedere allo staff tecnico:**` box before `## Fonti`)
A useful rule, not an echo of another chapter and not an announcement of chapter 7. See TARGET.

### `## Fonti`
Built by the Writer from the dossier entries actually used, in the STYLE_BIBLE format (`codice: …`, `wiki: …`, `docs: …`, `Portolano: …`, `Jira: GOP-NNN — titolo breve`).

---

## REVIEWER READINESS NOTES

### Tension points (where the chapter must create real stakes)
1. **«Cancella precedente» / Ripianifica without interventi multipli (§ 4).** Stakes: an esito with its foto, already possibly sent to the committente, can vanish in one click and cannot be recovered from the gestionale. Build-up: first the procedure, then the table of the two cases, then the list of what is lost, then the rule. The tension must resolve into a decision rule, not into fear.
2. **The silent skip of «Modifica» (§ 3).** Stakes: the office believes it moved an intervento; the operatore never receives it; the utenza is not visited. The page shows no error. The chapter must make the reader check the «Stato» column before and the row after.
3. **«Verificato» as a gate to the committente (§ 5).** Stakes: on some commesse an intervento done in the field but not verified is missing from the return file. Done ≠ delivered.
4. **The AI says «Non conforme» (§ 6).** Stakes: trusting the AI blindly (approving or rejecting by its label) versus wasting it. Resolution: the AI points to the foto; the reviewer decides; blocking checks force a decision before approval.

### Key chains to make explicit (cause → consequence → reader action)
- Intervento in Eseguito/Non fattibile/Controllato/Inviato/Ripianificabile → «Modifica» skips it with no message → read the «Stato» first; for a non fattibile use «Ripianifica».
- Intervento with an esito → «Elimina» refuses it → a closed non fattibile can be removed only at Ripianifica time with «Cancella precedente: Sì» → decide at that moment with the rule.
- Old esito deleted → it leaves the exports (built on esecuzioni) and the history of the utenza → keep anything already verified, sent or exported.
- Intervento not verified → no stato Controllato (and on some commesse no «Data validazione») → missing from the return file → verify before exporting (ch.7).
- Foto belong to the intervento eseguito → the office opens another intervento of the same utenza → «no foto» → open the intervento that has the esecuzione before suspecting data loss.
- Analysis queued/running or blocking check undecided → «Approva l'intervento» refused → wait for the result or decide the blocking check.
- Rule added to the AI instructions → new version, tested on the banco → if the test finds a worse result, the page asks «Attiva comunque»; versions stay in history and can be put back.

### Risk proportionality guards (each risk paired with its balancing context)
- **Irreversible deletion of the precedente** → balance in the same paragraph: «Elimina» never deletes a closed intervento; on commesse with interventi multipli the default is to keep it; keeping it does not inflate the non fattibili of the carico.
- **Silent skip of «Modifica»** → balance: nothing is damaged; the skipped intervento is unchanged; the remedy is one look at the «Stato».
- **AI errors** (wrong matricola, seal judged broken) → balance: the AI never changes the intervento; seal checks never reject; one bad foto among several gives «Da verificare», not «Non conforme»; a correction teaches the banco di riferimento.
- **Office corrections overwritten by a later app resend** → balance: only on commesse without the backoffice protection, and only when the app resends that intervento; say it as tenant-dependent, not as a general danger.
- **Six-month window of the Lista** → balance: nothing is missing, set a filter («Lista» or dates).
- **AI cost** → mention only the cap of the test (max 2 × 20 calls, admins only) if the dossier confirms it; no money figures; costs of bulk runs belong to ch.12.

### Counter-objections planned (STYLE_BIBLE requires ≥ 2; four are planned)
1. § 2 — «L'operatore dice di aver chiuso, ma non vedo l'esito.»
2. § 4 — «Se tengo il vecchio non fattibile, il carico non mi conta un non fattibile in più?»
3. § 5 — «Ho verificato un intervento e non lo trovo più.»
4. § 6 — «L'AI ha segnato Non conforme: devo rifare l'intervento?»

### Litmus test for this chapter
A new back-office colleague, with only this chapter, can: move tomorrow's interventi of an absent operatore to a colleague; redo a non fattibile without losing a foto the committente has already seen; verify a day's work and know it will reach the return file; read an «Esito AI» without taking it as a verdict.

---

## RESEARCHER BRIEF

**Web search terms:** none. INSTRUCTION.md § Researcher, SOURCE OVERRIDE: the web is not a source for this book. Use only the sources below, in this priority order. The GOPlanner repository is READ ONLY (no checkout, pull, stash, composer, npm).

### Documents to prioritize (in order)
1. Code on `php8` (authority when sources disagree).
2. `docs/analisi-ai/contratto.md`, `docs/analisi-ai/impostazioni.md`, `docs/03-cookbooks/34-verifica-interventi-estensioni-tenant.md`, `docs/02-patterns/21-…`, `23-…`, `34-…`.
3. Wiki articles under `wiki/assistenza-clienti/` (listed below), dated 2026-11-16 or later preferred; `verifica-interventi-eseguiti.md` (2026-09-06) describes the older view — use only for the Limite paragraph of § 5.
4. Portolano, then Jira.

### Wiki paths
- `wiki/assistenza-clienti/riaffida-intervento.md`
- `wiki/assistenza-clienti/ripianifica-non-fattibile.md`
- `wiki/assistenza-clienti/elimina-precedente.md`
- `wiki/assistenza-clienti/pagina-lista-interventi.md`
- `wiki/assistenza-clienti/verifica-interventi-iren.md` (one commessa's variant: label as such)
- `wiki/assistenza-clienti/verifica-interventi-eseguiti.md` (older view)
- `wiki/assistenza-clienti/anomalie-intervento.md`
- `wiki/assistenza-clienti/runbook-regola-istruzioni-ai.md`
- `wiki/assistenza-clienti/stato-utenza-assegnato-dopo-chiusura.md` (pointer to ch.3 only)
- `wiki/assistenza-clienti/runbook-dove-si-e-fermato-il-dato.md` (pointer to ch.12 only)
- `wiki/assistenza-clienti/pagina-da-assegnare.md` (stato 10)

### Docs paths
- `docs/analisi-ai/contratto.md` — §§ 1, 2.2, 2.3, 4.4, 4.5, 5.4, 10
- `docs/analisi-ai/impostazioni.md`
- `docs/03-cookbooks/34-verifica-interventi-estensioni-tenant.md`
- `docs/02-patterns/21-guard-cancellazione-intervento-eseguito.md`
- `docs/02-patterns/23-cc-cancellazione-stato-annullato.md`
- `docs/02-patterns/34-stato-utenza-derivato-ultimo-intervento.md`
- `docs/02-patterns/16-mobile-inbound-sync.md` (only for what lands in `interventi_eseguiti`)
- `docs/01-foundations/07-database-schema.md` (check against code: the doc names the table `utenze`, the code writes `utenti.stato_id` → [CONFLICT])

### Code paths and grep patterns (read-only: `git grep`, Read, Grep)
- `lib/InterventoEseguitoBase.php` — `const STATO_`, `setFromAndroid`
- `lib/InterventoBase.php` — `const RIPIANIFICABILE`, `modificaPianificazione`, `updateStatoUtenza`
- `lib/UtenzaBase.php` — `const STATO_`, `getUltimoInterventoChiuso`
- `lib/MobileV3/Domain/EsitoCatalog.php` — `DEFAULTS`
- `lib/VerificaInterventi.php` — `STATO_VERIFICATO`, `STATI_CHIUSI`, `ETICHETTA_DA_FINIRE`, `MOTIVO_DA_FINIRE`, `configPredefinita`
- `lib/JSONController.php` — `function modifica_interventi`, `function ripianifica_intervento`, `function elimina_intervento`, `function verifica_`, `analisi_ai_approva`, `analisi_ai_rimanda`
- `lib/json_functions.php` — `elimina_interventi_non_chiusi`
- `lib/Intervento.php` — `function delete`
- `lib/AvanzamentoCarichi.php` — non fattibili count rule
- `lib/MenuRapporti.php` — «Verifica interventi» menu entry
- `js/code/interventi_elenco.js` — Modifica window labels
- `js/code/verifica_unica.js` — filter bar, ticks, keyboard, bottom buttons
- `js/code/analisi_ai.js` — review window labels
- `js/code/impostazioni_analisi_ai.js`, `Smarty_templates/it/impostazioni_analisi_ai.html`, `lib/ImpostazioniAnalisiAi.php`
- `js/code/core_functions.js` — `eliminaInterventi`
- `lib/dict/lang_it.php` — grep: `non cancellato`, `Sei sicuro di voler`, `ripianificazione`, `Seleziona l'operatore`, `nuovo intervento`
- Count: `git grep -l "interventi_multipli'\] = true" -- 'custom/*/config.inc.php' | wc -l` and `ls -d custom/*/ | wc -l`
- `git grep -n "stato_da_finire" -- custom/` and `git grep -n "verifica_unica" -- 'custom/*/config.inc.php'`
- `git grep -n "backoffice_su_modifica\|isBlockedByBackoffice" -- custom/ lib/`

### Portolano queries (`mcp__rag_qdrant_server__query_rag_hybrid`, `user_roles: "goplanner"`; fall back to `query_rag`)
- «stati intervento assegnato eseguito non fattibile controllato inviato»
- «riaffidare intervento cambiare operatore data Modifica»
- «ripianifica non fattibile cancella precedente»
- «elimina intervento già chiuso interventi_eseguiti»
- «Verifica interventi pagina unica Verificato data validazione»
- «analisi AI foto esito conforme da verificare non conforme»
- «Approva l'intervento Rimanda all'operatore»
- «Impostazioni Analisi AI delle foto banco di riferimento»
- «Da finire rapportino intervento non chiuso»

### JQL fragments (cloudId `21873985-2e5d-4a8a-bb45-e6d453128985`, project GOP, READ ONLY)
- `project = GOP AND key in (GOP-630, GOP-462, GOP-674, GOP-718, GOP-719, GOP-720, GOP-721, GOP-738, GOP-763, GOP-782, GOP-807)`
- `project = GOP AND text ~ "ripianifica" ORDER BY updated DESC`
- `project = GOP AND text ~ "cancella precedente" ORDER BY updated DESC`
- `project = GOP AND text ~ "Verifica interventi" AND updated >= -60d ORDER BY updated DESC`
- `project = GOP AND text ~ "non fattibile" AND text ~ "export" ORDER BY updated DESC`
- Purpose: one real ticket story (problem → cause → fix) per § 3 or § 4, told without personal data and without contractual details.

### Specific facts, numbers and labels to hunt
- Stato codes and labels: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 99 — label as shown in the UI tag.
- «Verificato» → 6; «Solo da verificare» excludes `6, 7`; «Rimanda all'operatore» → `stato_rimandato` default 3.
- Exact messages: «Intervento non cancellato perché già chiuso»; «Sei sicuro di voler eliminare gli interventi selezionati? L'operazione non è reversibile.»; «Sei sicuro di voler annullare gli interventi selezionati? L'operazione non è reversibile.»; «Seleziona l'operatore a cui assegnare l'intervento»; «Data di ripianificazione non valida»; «È stato creato un nuovo intervento»; `MOTIVO_DA_FINIRE`; «Analisi AI non ancora disponibile su questa commessa».
- Window and button names: «Modifica intervento», «Ripianifica», «Assegna incarico», «Cancella precedente», «Verificato», «Verbale», «Anagrafica», «Cambia tipo», «Analisi AI», «Approva l'intervento», «Rimanda all'operatore».
- Lista: six-month window without filters; page sizes 10, 15, 20, 25, 40; max 1000 rows per request (only if needed).
- AI: aggregation rule (one bad foto of several → Da verificare), seal never rejects, registered values hidden from the AI, settings limits 2.000 caratteri / 50 regole / banco max 20 casi, review log (last 30 actions), «Blocca».
- The count of commesse with `interventi_multipli` on vs. total.
- Date of the state of affairs for the Verifica page roll-out (cookbook 34 says 20 and 24 novembre 2026).

### Mandatory [CONFLICT] items to record
1. «La maggior parte» of commesse without interventi multipli (wiki) vs. «una quarantina» with it on (pattern 34).
2. Table name `utenze` (schema doc) vs. `utenti` (code).
3. «Rapportino» (EsitoCatalog label) vs. «Da finire» (GOP-782: never «Rapportino» in the UI).
4. AI unavailable message: contract text vs. JS fallback text.
5. Verifica page: single page (GOP-630) vs. previous pages still used by some commesse — which description applies to whom.

### Security filter reminder
No logins, names of operatori/utenti/intestatari, addresses, matricole of real meters, PDR codes, IPs, hosts, keys, `.env` values, model or vendor names of the AI, contractual or tender details of committenti. Committente names: at most as one example of a commessa, sparingly.

---

## TARGET

- **Word count:** 5.200–5.600 words in total (PRD § 4: 4.000–6.000). Breakdown: «In questo capitolo» ~80; § 1 850; § 2 900; § 3 1.000; § 4 1.050; § 5 1.100; § 6 1.100; closing + `## Fonti` ~150.
- **Opening hook strategy:** start the first section from one invented, declared-as-invented case — a non fattibile ripianificato on a commessa without interventi multipli, whose esito and foto vanish together with the old intervento — to show in three sentences that in the office the button you press decides what remains as a record.
- **Closing beat promise:** end on a rule the reader can apply at the desk — before any action on an intervento, read its stato and ask whether its esito has already been verified, sent or exported, because that answer decides between Modifica, Ripianifica, keeping the precedente, or stopping to ask the staff tecnico.
