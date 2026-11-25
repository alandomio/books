# Review: Capitolo 14. Il modello dei dati

Reviewer run: 25 novembre 2026. Read fresh: `PRD.md`, `STYLE_BIBLE.md`, `chapter_14_struttura.md` (NUFs, beat list, readiness notes, TARGET), `chapter_14.md`, `dossier_chapter_14.md` ([PUBLIC], [SHADOW], [CONFLICT]). Cross-checked `chapter_3.md` (campi nuovi, `getCampiCustom()`), `chapter_6.md` line 117 (orphan case, MyISAM) and `chapter_7.md` line 158 («Esporta in Excel»). For three claims missing from the dossier I read the GOPlanner repository on branch `php8`, read only: `docs/02-patterns/24-join-dinamico-griglie-tenant.md:4` (~26 azioni), `docs/03-cookbooks/33-esportare-in-excel-una-griglia.md:31` (hidden columns in the Excel) and `lib/DatiProva.php:497-545` (how the test-data cleaner finds child tables).

## 1. Executive Summary

This is the strongest DEV chapter so far. The thesis is that the database does not defend the relations and the code does, and every section proves it with a file, a column or a ticket. The opening is very good: the repository's own «Zero Cognitive Load Reference» for agents gives a join that fails against v0. The Writer also corrected the Architect where the dossier required it: 28 tables, not 29; foreign keys on the magazzino, DDT and zone tables; `updateStatoUtenza()` as the main writer but not the only one; 58 commesse that skip `Intervento::delete()`. A skeptical developer would trust it. Five things kept it near the line:

- **Pipeline language leaked into the book.** «il dossier» appears four times in reader-facing prose (§ 2 ×2, § 4 ×2). The reader does not know what a dossier is.
- **One factual error in a counter-objection.** Deleting an intervento was said to orphan «la sua pratica», but `carichi_righe` does not point to the intervento. The same answer also dropped the condition ch.6 gives for the export loss (a filter on `interventi` columns).
- **The closing overreached.** «Ogni relazione di GOPlanner … nessuno nel database» contradicts § 3, which lists the foreign keys of 0008, 0042 and `zone_outbound`.
- **Smaller slips.** One magazzino map row credits all four tables to 0032. The `operatori` «Chi la scrive» cell named a migration as the writer. «in tre punti» could not be counted. «le altre `decimal(9,6)`» also covered `timbratura`, which is unverified. «oggi 18 marcatori» had no date. Intensifiers: «sorprende tutti», «l'errore peggiore», «Il guaio».
- **Fonti were incomplete.** About fifteen files named in the body were missing: `json.php`, `json_android.php`, `DeviceStore`, `PosizioniWriter`, `MigrationRunner`, cookbook 33 and others.

All fixes are local and have been applied. Verdict: **REVIEWER_PASS_MINOR, 24 inline corrections**, eight of them paragraph rewrites (R1–R8).

## 2. Score: 48/60 → REVIEWER_PASS_MINOR

| Dimension | Score | One-line reason |
|---|---|---|
| Narrative & Structure | 8/10 | The chapter builds in a clear order: where the schema is, the chain of rows, no foreign keys, whose coordinates, where a commessa adds data, how to change the schema. It turns at § 3 («le relazioni le tengono pochi percorsi») and lands on a rule. Weak spots: the engine subsection sits between the thesis and the protections table. § 4 opens on operatori and phones before the coordinates question it promised. The original closing generalised beyond what § 3 had just shown. |
| Language, Style & Voice | 7/10 | Mostly on-persona: short rule sentences after long ones («Si aggiunge e basta.», «Lo impone chi scrive.»), exact names, no «noi», no banned patterns. Drift: «il dossier» ×4, «sorprende tutti», «È l'errore peggiore», «Il guaio», «Non è una colpa del documento», a confusing «La seconda … la prima», and the syntax of «Le esecuzioni orfane che sono già successe sono il caso del capitolo 6, cadute fuori dalle esportazioni». |
| Factual Accuracy | 7/10 | About 300 checkable claims, nearly all traceable, many of them corrections of the struttura. Errors: the orphaned pratica, the missing filter condition, the closing's «ogni relazione», the 0032 map row, the migration named as the writer of `operatori.lat`, «in tre punti», `timbratura` typed without a source, an undated «oggi». Not flagged: GOP-770 is «In corso» and no production commessa had `extra_*` columns on 11 novembre 2026. |
| Audience Alignment | 9/10 | Every litmus-test task is covered: database and ORM per table, the real join keys, which column holds closure stati, deleting test interventi without orphans, where a datum of one commessa goes, a grid column without a 400, an additive migration tested on a throwaway MySQL and handed to the staff. The staff tecnico gets the two boxes, § 1 and § 6. Prose is about 5,500 words plus tables, within the PRD range. |
| Sensory & Emotional Engagement | 8/10 | Real stakes, told as facts: the failing index query, the `DatiProva` comment «non ci sono chiavi esterne», GOP-546's 20-character truncation, `campi_extra` at «zero su 28», `visible=1` rows that would expose technical columns, «Una migrazione "provata" lì è stata applicata a una commessa vera». Catalogue stretches: the § 2 Limite paragraph (52 columns) and the `operatori` paragraph in § 4. |
| Originality & Angle | 9/10 | The angle is original and earned: the database guarantees nothing, so every rule of access is «il solo vincolo che c'è». The chapter catches the repository's own documents in contradiction with v0 (index, schema doc, pattern 34's «unico punto») without mocking them. The `_posizione` passage shows how to add data without touching the schema. |
| **Total** | **48/60** | |

## 3. Detailed Findings by section

### «In questo capitolo»
- Fine. It tells office readers where to stop and points them to ch.3 and ch.6.

### § 1 — Dove si legge lo schema e dove sta ogni tabella
- **Unsourced premise in the first sentence.** «Il primo documento che un agente di codice trova nel repository è `docs/00-concept-index.md`». Nothing supports «primo»: an agent usually reads `CLAUDE.md`/`AGENTS.md` first. What can be verified is the position in `docs/`. **Fixed.**
- **Confusing reference and personification.** «ma omette `id` e `id_carico`. La seconda è obbligatoria; senza la prima l'esecuzione riceve…» makes the reader map «seconda» and «prima» back to the list. «Non è una colpa del documento» gives the document a will. «nessuno le ha confrontate dopo» guesses at intent. **Rewritten** (see § 7, R1).
- **Map row inaccurate.** «`magazzino`, `magazzino_movimenti`, `magazzino_anomalie`, `ddt` | … | il magazzino (migrazione `0032_magazzino_base.sql`)». Per the dossier, `magazzino` is in v0, `magazzino_movimenti` comes from 0008, `magazzino_anomalie` from 0032 and `ddt` from 0042. **Fixed.**
- **Intensifier.** «È l'errore peggiore, perché non si vede.» changed to «…e nessun messaggio lo segnala.» That specifies the problem instead of ranking it. **Fixed.**
- Kept: «Lo schema vero è quello che le migrazioni creano; il nome vero di una tabella è quello scritto in `$table`.» It is a strong sintesi and does not echo ch.2.
- Optional, not applied: the «Capitolo» column cites the chapter itself («14 (operatori e telefoni)», «14 (campi e griglie)», «14 (migrazioni)»). Readable, but a section name would be cleaner.

### § 2 — Le tabelle del lavoro
- **Intensifier.** «e qui c'è il punto che sorprende tutti». No source says «tutti», and the persona specifies rather than intensifies. Now: «qui sta il legame che lo schema non mostra». That is literally true: there is no `id_intervento` column. **Fixed.**
- **Pipeline leak ×2.** «il dossier non ha verificato che cosa scrivano lì i percorsi delle foto» and «Delle colonne con il suffisso `_m` il dossier sa una cosa precisa». **Fixed**; the first now ends on an action («prima di unire `foto.operatore` a `operatori.id` si legge il codice che la scrive»).
- **Vague source.** «Un documento di fondazione annota che con `esito = 1`…» now names `docs/01-foundations/03-database-facts.md`. The path is named and nothing from the file is copied. That matters because the file contains connection data. Also «i Carichi» became «la pagina «Carichi»». **Fixed.**
- **Box wording.** «bastano tre numeri» changed to «tre riferimenti», because `utenti.codice` is a `varchar(20)`, not a number. **Fixed.**
- Kept and praised: the «Attenzione» box on `getInterventoEseguito()` resolves [CONFLICT] 13 exactly (`$ie !== null && !$ie->isNew()`). The `utenti.stato_id` paragraph contradicts pattern 34's «l'unico punto» with the list of other writers. That is the right call ([CONFLICT] 11).
- Optional, not applied: the Limite paragraph (line ~122) is one block listing the lettura, flag and `_m` columns. A short bulleted list would read better.

### § 3 — Relazioni senza chiavi esterne
- **Factual error in counter-objection 3.** «Toglie l'intervento e lascia la sua esecuzione, le sue foto e la sua pratica che puntano a un numero che non c'è più». The excerpt the chapter itself prints shows `carichi_righe` has only `id`, `id_carico` and `id_utenza`, so the pratica does not point to the intervento. The orphans are `interventi_eseguiti`, `foto` and `interventi_servizi`. **Rewritten** (R4).
- **Condition dropped.** «un'esportazione costruita con `LEFT JOIN interventi` perde quell'esecuzione» is incomplete. A plain LEFT JOIN from the esecuzione keeps the row. Ch.6 says the loss comes from «`LEFT JOIN interventi` e un filtro su colonne di `interventi`». **Fixed** in R4.
- **Uncountable count.** «dice in tre punti che `users` «può essere MyISAM»». The dossier lists four lines in three files, and one of them says «è MyISAM», not «può essere». Now «in più punti». **Fixed.**
- **Duplicate.** The last sentence of the engine subsection («Il motore delle tabelle di una commessa esclusa da v0 il repository non lo conosce») was repeated at the end of the Limite. The engine paragraph now ends on a sourced example from the dossier ([PUBLIC] § 3, `MagazzinoColdSwitch.php:158`): the code checks that `operatori` is InnoDB because otherwise «le chiavi esterne di 0008 falliranno». The Limite repetition was replaced (R3).
- **New Limite sentence, derived from two dossier facts and checked in code.** `DatiProva` finds child tables by `COLUMN_NAME = 'id_intervento'` (`lib/DatiProva.php:520-525`), and `interventi_eseguiti` has no such column (§ 2 of the dossier). So the cleaner the chapter praises in its second paragraph does not find the esecuzioni. The new sentence states this neutrally. **See § 6, item for the staff tecnico:** this may be a real gap in GOPlanner, not only a book detail.
- **Syntax.** «Le esecuzioni orfane che sono già successe sono il caso del capitolo 6, cadute fuori dalle esportazioni.» **Rewritten** (R2). «Il guaio della guardia» became «Il punto debole della guardia». **Fixed.**

### § 4 — Operatori, telefoni e posizioni
- **Unsourced type claim.** «`interventi.lat` e `interventi.lng` sono `double`, le altre `decimal(9,6)`». «le altre» includes `timbratura`, whose type the dossier does not give ([SHADOW] lists only `interventi_eseguiti`, `utenti`, `operatori`, `posizione`). The count of six tables is now scoped to «In v0». **Fixed.**
- **Wrong writer.** The `operatori` row, «Chi la scrive», said «migrazione 0020 (GOP-682)». A migration writes no coordinates. The dossier says `lat`/`lng` already exist in v0 and 0020 only adds `geocodifica_fonte` and `geocodifica_il`. **Fixed.**
- **Pipeline leak ×2.** «il dossier non ha verificato se lo faccia anche GOPlanner 3» and «il dossier non sa nulla». **Rewritten** (R5, R6). R5 also turns the `COALESCE(interventi.lat, utenti.lat)` mention into the section's own lesson: one read mixes two owners.
- Kept: the `posizione` UNIQUE key paragraph. It covers both behaviours ([CONFLICT] 4b) and the phone-clock consequence. Clean, exact and new.
- Optional, not applied: the `operatori` paragraph (line ~171) carries nine facts. The `sim_id` mechanics could go into a short list.

### § 5 — Campi personalizzati e griglie
- **Feature status missing.** The campo nuovo is presented as live («il server, quando l'ufficio usa «+ Nuovo campo…»»). GOP-770 is «In corso» (dossier, Jira titles), and [SHADOW] records «nessun tenant di produzione ha colonne `extra_*`, verificato l'11/11/2026». STYLE_BIBLE § Persona forbids presenting as active a function the sources give as limited. One dated sentence was added. **Fixed.**
- **Claims outside the dossier.** «Circa ventisei azioni di griglia di `json.php`» and «L'Excel di una griglia esporta ogni colonna del `colmodel`, anche quelle nascoste» came from the struttura, not the dossier. I verified both in the repository (pattern 24 line 4: «~26 azioni diverse»; cookbook 33 line 31: «Nel file vanno tutte le colonne, anche quelle con `hide`…»). Cookbook 33 was added to Fonti. **Fixed.**
- Kept and praised: the four-mechanism table, the GOP-770 story with the quoted request and «zero su 28», and the `visible=1` history. The best paragraph of the chapter for a developer is the one ending on «una terza copia della logica non va scritta».
- Optional, not applied: «Carichi, Dispositivi e Magazzino» (line ~245) are grid names and could take «».

### § 6 — Schema canonico, migrazioni e regole di accesso
- **Undated number.** «oggi 18 marcatori in 8 file» became «al 25 novembre 2026» (Number rules). **Fixed.**
- **Orphan sentence.** «Sulla regola degli stack `migrations/README.md` spende una riga sola: …» sat after the log format and did nothing there. The quote now opens the answer to counter-objection 7 (R7). **Fixed.**
- **Closing overreach.** See R8. «Ogni relazione di GOPlanner» became «Ogni relazione tra le tabelle del lavoro». Otherwise § 3's foreign keys (0008, 0042, `zone_outbound`) and the UNIQUE key of `carichi_righe` contradict it. **Fixed.**
- Kept: the GOP-546 opening (problem → cause → remedy, no tenant names), the three-level table, «Si aggiunge e basta.», the six-step procedure, and the Limite that dates GOP-699 and GOP-701 as in progress.

### Fonti
- Missing sources named in the body were added: `json.php`, `json_android.php`, `json_admin.php`, `grid.php`, `lib/Operatore.php`, `lib/MobileV3/Device/DeviceStore.php`, `lib/MobileV3/Domain/PosizioniWriter.php`, `EsitoWriter.php`, `MagazzinoRuolo.php`, `lib/MigrationRunner.php`, `lib/MagazzinoColdSwitch.php`, `migrations/main/0001_…`, `0019_…`, `docs/01-foundations/03-database-facts.md`, `docs/02-patterns/48-…`, `docs/03-cookbooks/33-…`. **Fixed.**

### Security and format
- No hosts, IPs, credentials, cluster names, tenant or committente names, or row values. The module list correctly leaves out the module whose name contains a place. `users.password` is named as a column only. One H1, «In questo capitolo», seven `##` including Fonti, a Limite in every section, at most 5 prose paragraphs in a row (§ 4 reaches exactly 5). The trailing `<!-- … -->` pipeline comments are the convention of every chapter in this book. They are left in place, but they must be stripped before HTML/PDF publication, because raw HTML is banned.

## 4. Persona Audit

**Verdict: on-persona, with one systematic drift (now removed).**

- *«Spiego come funziona davvero, con il nome esatto di ogni cosa»*: yes, throughout. Every relation names its column, every rule names its file and line owner, and every number has a ticket or a date.
- *«Ogni regola ha il suo perché e la sua fonte»*: yes. Each rule comes with a reason: why `lotti` is in the master (no cross-database join), why `hide` is a floor (GOP-222), why only additions (`master` and `php8` share the databases).
- *«Se una cosa vale solo per alcune commesse, lo dico»*: yes. The 58/61 commesse that skip `Intervento::delete()`, the `interventi_multipli` setting, import columns «diverse per ogni commessa», the excluded commesse. GOP-770's status was the one miss, now fixed.
- *«Se non lo so, non lo scrivo»*: the chapter respects this, and says out loud what it does not know. The drift was in how it said it. «il dossier non ha verificato» is the voice of the research pipeline, not of the Engineer + Scholar. The persona speaks for its sources («le fonti non dicono») and, where possible, gives the reader the next step («si legge il codice che la scrive»). All four occurrences were fixed.
- *«I prove every point with one surgical example, not three»*: mostly. The DatiProva comment for «no FK», GOP-546 for drift and GOP-770 for campi_extra are each one example. Exception: the list of other writers of `utenti.stato_id` (seven items). Here the list is the proof, so it stays.
- *«I do not intensify — I specify»*: three lapses («sorprende tutti», «l'errore peggiore», «Il guaio»). All fixed.
- *«My ending cannot echo any previous chapter»*: the ending («un custode nel codice e nessuno nel database … l'`--apply` lo si lascia allo staff tecnico») does not echo ch.1, 2, 3, 6, 11 or 12. It matches the struttura's TARGET.

## 5. Counter-Objection Check

The chapter has six, against the STYLE_BIBLE minimum of two. All are in the reader's real voice and all are answered from sources.

| # | Section | Objection | Strongest form? | Evidence-based answer? |
|---|---|---|---|---|
| 1 | § 1 | «Il documento dello schema dice `utenze`, e la tabella c'è: perché non usarla?» | Yes: it uses the reader's best evidence (the doc and the table both exist). | Yes: `UtenzaBase::$table`, legacy readers, ch.3 example. |
| 2 | § 2 | «Per sapere se un intervento è chiuso guardo `interventi.stato_id`, no?» | Yes: the natural assumption. | Yes. It quotes `AvanzamentoCarichi`, and adds the nuance of `allineaStatoAEsitoVerificato()`, which makes the answer more honest. |
| 3 | § 3 | «una `DELETE` con un `WHERE` preciso non basta?» | Yes: it is the experienced developer's view. | It had a factual error (the pratica) and an incomplete mechanism (the filter). **Fixed in R4.** |
| 4 | § 4 | «Perché la posizione dell'esito non sta in `posizione`?» | Medium. It is a design question rather than a mistake a reader would make. | Yes: trail vs esecuzione, it travels with the esito. |
| 5 | § 5 | «Ho aggiunto la colonna nel `colmodel` e la griglia risponde 400.» | Yes: a real symptom with a real log line. | Yes: `endpointDefinitions()`, `griglia_sfasata … missing=…`. |
| 6 | § 6 | «La provo sul mio stack locale, tanto è locale.» | Yes: the most dangerous belief in the chapter. | Yes. It now opens with the README's own one-line rule. |

The planned objection 4 («Perché non aggiungere le chiavi esterne?») was correctly dropped: the dossier found no source (JQL: one unrelated hit). This is the question a developer will ask most, and the chapter says honestly that no source explains the choice. The new `MagazzinoColdSwitch` sentence answers the factual half without inventing a rationale: on a non-InnoDB table, a foreign key fails.

## 6. Priority Improvements

### Critical (all applied)
1. Remove «il dossier» from reader-facing prose (×4).
2. Correct counter-objection 3: the pratica is not orphaned, `interventi_servizi` is, and the export loss needs the filter on `interventi` columns (ch.6 wording).
3. Scope the closing to «le tabelle del lavoro», so it does not contradict § 3.

### Important (all applied)
4. Magazzino map row: v0 + 0008 / 0032 / 0042, not «0032» for all.
5. `operatori` coordinates row: the writer is the geocodifica of the starting address (GOP-682), not migration 0020.
6. GOP-770 status: «In corso», no `extra_*` column in production on 11 novembre 2026.
7. «in tre punti» → «in più punti»; «le altre `decimal(9,6)`» → the four tables the dossier types; «oggi 18 marcatori» → dated.
8. Remove the intensifiers («sorprende tutti», «l'errore peggiore», «Il guaio») and the unsourced «Il primo documento che un agente … trova».
9. Fonti: add the ~15 files named in the body.
10. Engine paragraph: replace the repeated «motore sconosciuto» sentence with the sourced `MagazzinoColdSwitch` check. The Limite then points out that the test-data cleaner cannot find `interventi_eseguiti`.

### Optional (not applied)
11. **Outside the book, for the staff tecnico:** `lib/DatiProva.php::elimina()` (GOP-705) deletes the children of test interventi from every table with an `id_intervento` column. `interventi_eseguiti` has no such column, so any esecuzione of a test intervento would be left orphaned. Worth an oracle question or a GOP ticket. The book now states only the fact.
12. **Cross-chapter:** ch.6 line 117 still says «le tabelle sono MyISAM, senza chiavi esterne». The struttura ([CONFLICT] 2) asked the Reviewer to note it. For v0 commesse the tables are InnoDB, and what is missing is the declared foreign keys. Suggested ch.6 wording: «le tabelle del lavoro non hanno chiavi esterne».
13. Split the § 2 Limite paragraph (52 columns) and the § 4 `operatori` paragraph into short lists.
14. Replace the chapter's self-references in the § 1 map («14 (operatori e telefoni)») with the section titles.
15. Put the grid names «Carichi», «Dispositivi», «Magazzino» in § 5 between «».
16. Update the `<!-- WORD COUNT -->` comment if the pipeline relies on it (body prose ≈ 5,550 words, tables ≈ 1,350).

## 7. Rewritten Paragraphs

### R1 — § 1, the three index queries
**Original:**
> Lo stesso indice propone, per salvare una posizione GPS, `INSERT INTO posizione (operatore, lat, lng, quando, precisione)`. La tabella `posizione` non ha `lat`, `lng` né `quando`: ha `latitudine`, `longitudine`, `ora` e `oratelefono`, e altre colonne obbligatorie senza valore predefinito. Anche questa riga fallisce. La terza query dell'indice, `INSERT INTO interventi_eseguiti (id_utenza, operatore, data, lat, lng, lettura1, note)`, nomina sette colonne che esistono tutte, ma omette `id` e `id_carico`. La seconda è obbligatoria; senza la prima l'esecuzione riceve un numero automatico che non è quello del suo intervento (il perché è nella sezione successiva). Non è una colpa del documento. Le query sono state scritte prima che esistesse un riferimento verificato dello schema, e nessuno le ha confrontate dopo.

**Rewritten:**
> Lo stesso indice propone, per salvare una posizione GPS, `INSERT INTO posizione (operatore, lat, lng, quando, precisione)`. La tabella `posizione` non ha `lat`, `lng` né `quando`: ha `latitudine`, `longitudine`, `ora` e `oratelefono`, e altre colonne obbligatorie senza valore predefinito. Anche questa riga fallisce. La terza query dell'indice, `INSERT INTO interventi_eseguiti (id_utenza, operatore, data, lat, lng, lettura1, note)`, nomina sette colonne che esistono tutte, e sbaglia per quelle che omette. Senza `id_carico`, che è obbligatoria e non ha un valore predefinito, l'inserimento fallisce. Senza `id`, anche con `id_carico` aggiunta, l'esecuzione riceve un numero automatico che non è quello del suo intervento (il perché è nella sezione successiva). Le tre query sono più vecchie del riferimento verificato dello schema, e nessuno le ha ancora allineate.

**Why:** «La seconda … la prima» made the reader map the words back to a list. Naming each column and its consequence removes that work. It also shows the two failures are different: one fails loudly, the other succeeds wrongly. «Non è una colpa del documento» personified the file. «nessuno le ha confrontate dopo» guessed at what people did, while «nessuno le ha ancora allineate» is checkable: the file was edited on 11 novembre 2026 with the queries unchanged.

### R2 — § 3, the guard that 58 commesse skip
**Original:**
> Il guaio della guardia in `Intervento::delete()` sta nel numero delle commesse che la saltano. […] È il motivo per cui il commento di `elimina_interventi_non_chiusi()` dice: «Il controllo e' fatto qui e non solo in Intervento::delete()». Le esecuzioni orfane che sono già successe sono il caso del capitolo 6, cadute fuori dalle esportazioni.

**Rewritten:**
> Il punto debole della guardia in `Intervento::delete()` è il numero delle commesse che la saltano. […] È il motivo per cui il commento di `elimina_interventi_non_chiusi()` dice: «Il controllo e' fatto qui e non solo in Intervento::delete()». Che cosa succede quando un percorso di cancellazione non controlla lo racconta il capitolo 6: esecuzioni orfane cadute fuori dalle esportazioni.

**Why:** «Il guaio» is a colloquial intensifier, and the persona is calm. The last sentence had a dangling participle («cadute») attached to the wrong noun. The rewrite links cause to consequence and keeps ch.6's story as one clause, as the struttura requires («do not retell»).

### R3 — § 3, end of the engine subsection, and the Limite
**Original (engine):**
> La regola che ne segue è stretta. Una transazione aperta sul master non protegge `users`. Il motore delle tabelle di una commessa esclusa da v0 il repository non lo conosce.

**Original (Limite, last sentence):**
> Per le commesse escluse da v0 non si conosce nemmeno il motore delle tabelle.

**Rewritten (engine):**
> La regola che ne segue è stretta. Una transazione aperta sul master non protegge `users`. Per le commesse escluse da v0 il repository non conosce il motore, e il codice ne tiene conto: `MagazzinoColdSwitch` controlla che la tabella `operatori` sia InnoDB e, se non lo è, avverte che «le chiavi esterne di 0008 falliranno».

**Rewritten (Limite, last sentence):**
> Anche il pulitore dei dati di prova ha il suo perimetro: cerca i figli in `information_schema` per nome di colonna, `id_intervento`, e `interventi_eseguiti`, legata all'intervento dal proprio `id`, non è tra le tabelle che trova.

**Why:** The same unknown was stated twice. The engine sentence now carries a sourced example (dossier § 3, `MagazzinoColdSwitch.php:158`) showing why the engine matters: a foreign key needs InnoDB. The Limite now gives new information. It follows from two dossier facts (the cleaner matches `COLUMN_NAME = 'id_intervento'`; `interventi_eseguiti` has no such column), confirmed in `lib/DatiProva.php:520-525`. It also applies the chapter's own § 2 lesson («l'esecuzione porta lo stesso numero dell'intervento») to the one tool § 3 had presented as fully aware of the missing foreign keys.

### R4 — § 3, counter-objection 3
**Original:**
> «Devo pulire degli interventi di prova: una `DELETE` con un `WHERE` preciso non basta?» No. Toglie l'intervento e lascia la sua esecuzione, le sue foto e la sua pratica che puntano a un numero che non c'è più; un'esportazione costruita con `LEFT JOIN interventi` perde quell'esecuzione. Il percorso giusto passa dalle azioni JSON, […]

**Rewritten:**
> «Devo pulire degli interventi di prova: una `DELETE` con un `WHERE` preciso non basta?» No. Toglie l'intervento e lascia la sua esecuzione, le sue foto e le sue righe di `interventi_servizi` che puntano a un numero che non c'è più. La pratica resta com'era, perché `carichi_righe` punta alla lista e all'utenza, non all'intervento. Un'esportazione costruita con `LEFT JOIN interventi` e un filtro sulle colonne di `interventi` perde quell'esecuzione senza avvisare. Il percorso giusto passa dalle azioni JSON, […]

**Why:** The original contradicted the chapter's own `carichi_righe` excerpt, which has no `id_intervento`. A developer who has just read that excerpt would catch the error and stop trusting the answer. The real third child is `interventi_servizi` (dossier § 2). Without the filter, a LEFT JOIN keeps the row. The loss needs the filter on `interventi` columns, as ch.6 line 117 says, so leaving it out would teach the wrong mechanism.

### R5 — § 4, `interventi.lat` and the mixed owners
**Original:**
> In `interventi`, la copia dei valori di chiusura la scrive il percorso 1.x; il dossier non ha verificato se lo faccia anche GOPlanner 3, e una lettura di `json.php` usa `COALESCE(interventi.lat, utenti.lat)`.

**Rewritten:**
> In `interventi`, la copia dei valori di chiusura la scrive il percorso 1.x; le fonti non dicono se lo faccia anche GOPlanner 3. Una lettura di `json.php` mostra il rischio: con `COALESCE(interventi.lat, utenti.lat)`, dove manca il punto di chiusura prende quello dell'utenza, e sulla mappa i due proprietari si confondono.

**Why:** The original leaked the pipeline («il dossier») and left the `COALESCE` as a loose fact. The rewrite turns that fact into the section's thesis («Prima di leggere una latitudine si chiede di chi è»). The code itself has a read where a missing closing point silently becomes the utenza's point. This is the struttura's tension point 6 («the wrong latitude»), shown with a real line of code instead of an invented report.

### R6 — § 4, Limite, `operatori_db`
**Original:**
> Del ruolo attuale della tabella `operatori_db`, presente solo nei dump vecchi del master, il dossier non sa nulla.

**Rewritten:**
> La tabella `operatori_db` compare solo nei dump vecchi del master: nel codice di `php8` non si trova chi la legga, e il suo ruolo attuale le fonti non lo dicono.

**Why:** It removes the pipeline word and adds the one fact the research did establish ([CONFLICT] 8: «no php8 reader found by grep»). A developer who finds the table now knows the code does not use it, not only that the book is silent.

### R7 — § 6, the README's one line and counter-objection 7
**Original:**
> L'avviso dello scarto ha questa forma: […] e mai con i valori, perché possono essere dati personali. Sulla regola degli stack `migrations/README.md` spende una riga sola: «Mai da dev, stack locali o `goplanner-test-*`».
>
> «La provo sul mio stack locale, tanto è locale.» Lo stack locale e quello di dev puntano al cluster di produzione. Una migrazione «provata» lì è stata applicata a una commessa vera. Il posto per provarla è il MySQL usa e getta di `make test_migrate`.

**Rewritten:**
> L'avviso dello scarto ha questa forma: […] e mai con i valori, perché possono essere dati personali.
>
> «La provo sul mio stack locale, tanto è locale.» `migrations/README.md` risponde in una riga: «Mai da dev, stack locali o `goplanner-test-*`». Lo stack locale e quello di dev puntano allo stesso cluster di database della produzione. Una migrazione «provata» lì è stata applicata a una commessa vera. Il posto per provarla è il MySQL usa e getta di `make test_migrate`.

**Why:** The README sentence was attached to the log-format paragraph, where it had no job. Inside the objection it becomes the source's own answer, quoted before the explanation. «allo stesso cluster di database della produzione» matches the dossier's security-filtered wording and the rules table.

### R8 — § 6, closing
**Original:**
> Ogni relazione di GOPlanner ha un custode nel codice e nessuno nel database. Prima di toccare una riga si cerca il percorso che la custodisce e si passa da lì. […]

**Rewritten:**
> Ogni relazione tra le tabelle del lavoro ha un custode nel codice e nessuno nel database. Prima di toccare una riga si cerca il percorso che la custodisce e si passa da lì. […]

**Why:** § 3 lists foreign keys in 0008, 0042 and `zone_outbound`, and § 2 prints the UNIQUE key `id_carico_2`, which the database does enforce. «Ogni relazione di GOPlanner» was therefore false by the chapter's own evidence, in the sentence the reader is most likely to remember. The scoped version is exactly what the dossier ([CONFLICT] 0b) says the thesis covers, and it loses none of the rhythm.

### Litmus test

*«Would the reader finish thinking "I lived this" or "I was told this"?»* For the primary DEV reader, **«I lived this»** in § 1, § 3 and § 6. Developers who have copied a query from a doc, deleted test rows by hand, or «tried» a migration on a local stack will recognise the failure before the chapter names it. The GOP-546 truncation and the `visible=1` history read as lived engineering, not instruction. § 2's column catalogue and § 4's operatori/phone mechanics are still closer to «I was told this». They are reference material the reader needs, but the stakes there are shown less than stated. R5 moves § 4 a step toward «lived».

## 8. Verdict

**REVIEWER_PASS_MINOR (48/60).** The chapter is precise, original and well sourced, and earns its thesis. Twenty-four local corrections were applied. They remove pipeline language, fix one wrong counter-objection and the overreaching close, date or scope five claims, and complete the Fonti.
