# Dossier — Capitolo 6. Interventi, esiti e verifica

Researcher run: 25 novembre 2026. Code read on branch `php8` (HEAD `21e974921`), read only. Sources used: code, `docs/`, `wiki/`, Jira GOP (read only). Portolano (`query_rag_hybrid` and `query_rag`, `user_roles: goplanner`, 9 queries from the brief) returned only two unrelated cards each time (`goplanner-grill-g3-blocco-ora-posizione-2026-11-25`, `goplanner-grill-layout-schede-2026-11-25`). **Portolano gave no usable fact for this chapter**; do not cite it in `## Fonti`.

Security filter applied: no logins, personal names, hosts, keys, meter numbers, lead or appointment ids, AI model or vendor names. Tenant codes appear only where the Writer needs them to choose one example; in UFFICIO text use at most one, as «una commessa».

---

## [PUBLIC]

### § 1 — Gli stati di un intervento

- **Source:** code: lib/InterventoBase.php:149-158 | **Fact:** constants on the intervento: IMPORTATO=1, VALIDATO=2, ASSEGNATO=3, ESEGUITO=4, NON_FATTIBILE=5, CONTROLLATO=6, INVIATO=7, RIPIANIFICABILE=8, ANNULLATO=9, PRENOTATO=10.
- **Source:** code: lib/InterventoEseguitoBase.php:54-62 | **Fact:** constants on the esecuzione: STATO_IMPORTATO=1 … STATO_INVIATO=7, STATO_RIPIANIFICABILE=8, STATO_UTENTEASSENTE=99. There are no constants for 9 or 10 here.
- **Source:** code: lib/UtenzaBase.php:74-85 | **Fact:** the utenza has the STATO_* constants 1–8 and 99, plus ANNULLATO=9.
- **Source:** code: lib/InterventoBase.php:161 | **Fact:** `STATI_DA_FARE = [IMPORTATO, VALIDATO, ASSEGNATO, PRENOTATO]`. Code comment: «Stati in cui l'intervento e' ancora da fare: la Verifica lo allinea solo da qui, mai all'indietro».
- **Source:** code: lib/db/db.sql:555; lib/db_create.sql:424 | **Fact:** the `stati` table is seeded with `nome` 1 'importato', 2 'validato', 3 'assegnato', 4 'eseguito', 5 'non_fattibile', 6 'controllato', 7 'inviato', 8 'ripianificabile', 9 'annullato', 10 'prenotato'. There is no row 99.
- **Source:** code: lib/db/2026-09-18-gop319-stati-annullato-prenotato.sql (GOP-319) | **Fact:** before 18/09/2026 the base seeds had only stati 1–8. Without rows 9 and 10, «la Lista interventi (LEFT JOIN stati) mostra questi appuntamenti con lo stato vuoto e il filtro per stato non li seleziona». The migration has to be run by hand.
- **Source:** code: js/code/industry.js:24-46 (industryStatoTag, GOP-501) | **Fact:** the «Stato» column of Interventi › Lista is a coloured tag. Its text is `stati.nome` in lower case with `_` turned into a space: «assegnato», «non fattibile», «controllato», and so on. Controllato has a double-check icon. Annullato is struck through.
- **Source:** code: json.php:7676 (action `stato_select`) | **Fact:** the «Stato» filter of the Lista is filled from `SELECT id, nome FROM stati ORDER BY id`, cached for 3600 s. It offers whatever rows the commessa's `stati` table has.
- **Source:** code: lib/VerificaInterventi.php:92-101 (configPredefinita 'stati') | **Fact:** the default Verifica tags are 1 «Importato», 2 «Validato», 3 «Assegnato», 4 «Eseguito», 5 «Non fattibile», 6 «Controllato», 7 «Inviato», 99 «Utente assente». Codes 8, 9 and 10 are not in the array. The tenant can override the map.
- **Source:** code: js/code/verifica_unica.js:401-403 (tagStato) | **Fact:** a stato missing from the map is shown as «Stato N», so a Ripianificabile reads «Stato 8».
- **Source:** code: js/code/verifica_unica.js (tagStato) | **Fact:** on the Verifica page the tag for stato 6 reads «Verificato», not «Controllato» (`etichetta = id === stato_verificato ? 'Verificato' : s[0]`).
- **Source:** code: lib/export_letture_aceaA4.inc.php:44 | **Fact:** one legacy readings export runs `UPDATE interventi_eseguiti SET stato_id=7`.
- **Source:** code: pages/file.php:1480-1495 (case `importazione_inviati`) | **Fact:** importing an «inviati» file sets `interventi_eseguiti.stato_id = 7`.
- **Source:** code: lib/ADMINController.php:1075 | **Fact:** an admin repair routine also writes STATO_INVIATO.
- **Source:** docs: docs/02-patterns/43-avanzamento-carichi-fonte-stati.md | **Fact:** «L'esportazione scrive `UPDATE interventi_eseguiti SET stato_id = 7` … e non tocca `interventi.stato_id`, che resta a 4 o 6». Stati 6 and 7 must be read from `interventi_eseguiti.stato_id`.
- **Source:** code: lib/InterventoBase.php:404-406 (disassegna), :465-467 (elimina); lib/UtenzaBase.php:248-256 | **Fact:** Validato (2) is written on the **utenza** when an intervento is unassigned or deleted. An utenza with no intervento gets Validato. No path on `php8` writes 2 on `interventi` or on `interventi_eseguiti`.
- **Source:** docs: docs/02-patterns/23-cc-cancellazione-stato-annullato.md | **Fact:** 9 Annullato is the administrative cancellation and is terminal. 8 Ripianificabile is «in sospeso e da rifissare», not completed in the field. The rest of the app filters `stato_id<>9` out of the active lists.
- **Source:** docs: docs/02-patterns/23-cc-cancellazione-stato-annullato.md | **Fact:** a Call Center `PUT` on a stato-9 appointment answers 409. The only way to reactivate it is `v1_appointments_book`, which reuses the same row (GOP-318).
- **Source:** docs: docs/02-patterns/23-cc-cancellazione-stato-annullato.md | **Fact:** a Call Center move sets 3 when the appointment has an operatore, otherwise 10 Prenotato.
- **Source:** wiki: wiki/assistenza-clienti/pagina-da-assegnare.md | **Fact:** Interventi › Da assegnare lists the interventi in stato «prenotato», «fissati ma senza un tecnico». «Assegna» moves them to assegnato. The page has no filters and no map.
- **Source:** code: lib/VerificaInterventi.php:35-39; jira: GOP-782 | **Fact:** `ETICHETTA_DA_FINIRE = 'Da finire'`, commented «nome per l'utente dell'esito che non chiude (mai «Rapportino»)». GOP-782 (13/11/2026, Completata): the half-save esito was renamed «Da finire», and the Verifica does not close an intervento left «Da finire» until the operatore closes it, so only one person is responsible at a time.
- **Source:** code: custom/sg_smat/verifica_unica.inc.php:8; custom/sg_smat_test/verifica_unica.inc.php:8 | **Fact:** `'stato_da_finire' => 3`. These are the only two tenant folders that declare it.
- **Source:** code: lib/VerificaInterventi.php:41-59 (erroreDaFinire) | **Fact:** the Verifica cannot move a «Da finire» intervento to another stato. Bringing one back to «Da finire», for example with «Rimanda all'operatore», is always allowed.
- **Source:** code: js/code/admin_carichi.js:60; js/code/carico_avanzamento.js:63; json.php:7676 | **Fact:** ripianificabili appear as a «Ripianificabili» column in the Admin carichi grid, as a segment of the avanzamento bar, and as a value in the Lista «Stato» filter when the seed has row 8. No dedicated page or action for ripianificabili was found.
- **Source:** code: lib/JSONController.php:8687-8688; lib/OperazioniController.php:76; wiki: wiki/assistenza-clienti/pagina-lista-interventi.md | **Fact:** with no filter, the Lista applies `interventi.data_pianificata > DATE_SUB(NOW(), INTERVAL 6 MONTH)`, so it shows only the last six months of «Data pianificata».

### § 2 — Intervento ed esecuzione

- **Source:** code: lib/InterventoBase.php:144, :229; lib/InterventoEseguitoBase.php:47; docs: docs/02-patterns/43-avanzamento-carichi-fonte-stati.md | **Fact:** the primary key of `interventi` is `id_intervento`; that of `interventi_eseguiti` is `id`. The join is one to one: `interventi_eseguiti.id = interventi.id_intervento`. `interventi_eseguiti` has no `id_intervento` column.
- **Source:** code: lib/db/db.sql (CREATE TABLE interventi_eseguiti) | **Fact:** base columns of `interventi_eseguiti`:
  - `id`, `id_utenza`, `id_carico`, `data`, `operatore`.
  - position: `lat`, `lng`, `precisione`, `distanza`.
  - `lettura1`–`lettura9`, `note` varchar(2000), `segnalazione`, `inizio`, `fine`, `servizi` text.
  - `stato_id`, `motivo` int, `flag1`–`flag10`, `esportato`, `modificato`.
  - `lat_m`, `lng_m`, `data_m`, `lettura_m`, `sim_m`, `precisione_m`, `backoffice` tinyint default 0.
  - `lettura_eseguita`, `esito` tinyint, `distanza_da_precedente`, `progressivo_giornata`, `tempo_da_precedente`, `durata`.
- **Source:** docs: docs/02-patterns/16-mobile-inbound-sync.md | **Fact:** the campi custom sent by the app are stored as raw JSON in `servizi`. `getCampiCustom()` decodes them.
- **Source:** code: lib/VerificaInterventi.php ('fatti') | **Fact:** `interventi_eseguiti.esito` is 1 for positive and 0 for negative, written by the phone. The Verifica shows it as «Esito», «Positivo» / «Negativo».
- **Source:** code: lib/db/db.sql (CREATE TABLE foto); lib/MobileV3/Domain/FotoStore.php:223-301 | **Fact:** the `foto` table has `id_intervento`, `id_utenza`, `file`, `data`, `operatore`, `tipo`, `progressivo`, `hash`, `archiviato`, `nome_export`, `w`, `h`, `filesize`, `not_readable`. GOPlanner 3 writes foto keyed by `id_intervento`, the same id as the esecuzione.
- **Source:** code: lib/MobileV3/Domain/EsitoCatalog.php:27-48 (DEFAULTS) | **Fact:** default esiti and the stato each writes:

  | id | label | stato | closes |
  |---|---|---|---|
  | eseguito | «Eseguito» | 4 | yes |
  | non_fattibile | «Non fattibile» | 5 | yes |
  | ripianificabile | «Ripianificabile» | 8 | yes |
  | rapportino | «Rapportino» | 3 | no |
  | utente_assente | «Utente assente» | 99 | yes |

  Only «Eseguito» is `positivo`. `TENANT_OVERRIDES` is empty.
- **Source:** code: lib/InterventoEseguitoBase.php:430-452 (setFromAndroid); lib/InterventoBase.php:253-273 | **Fact:** legacy app esiti map as 1→4 (`esito=1`), 2→5, 3→8, 4 «rapportino»→3, 6→99. Every other value sets `esito=0`.
- **Source:** code: lib/InterventoBase.php:225-249; docs: docs/02-patterns/21-guard-cancellazione-intervento-eseguito.md | **Fact:** `getInterventoEseguito()` never returns null. When no row exists it returns a new unsaved object, so the check is `!$ie->isNew()`, not `$ie != null`.
- **Source:** code: lib/ExportInterventiQuery.php | **Fact:** the export starts from the esecuzioni: `SELECT interventi_eseguiti.* FROM interventi_eseguiti LEFT JOIN interventi ON interventi.id_intervento=interventi_eseguiti.id`. An intervento with no esecuzione is not in the file.
- **Source:** code: lib/InterventoEseguitoBase.php:712 | **Fact:** base `isBlockedByBackoffice()` is `!($this->stato_id < 6)`. An esecuzione in stato 6 or higher is never overwritten by the legacy app path.
- **Source:** code: custom/*/php/InterventoEseguito.php | **Fact:** 48 tenant overrides read `!($this->stato_id < 6) || $this->backoffice == 1`.
- **Source:** code: custom/{acquedottolucano,easy_iren,easy_mms,sg_italgas}/config.inc.php; lib/VerificaInterventi.php:169 | **Fact:** these four tenants set `'backoffice_su_modifica' => true`. Every field saved on the Verifica page then sets `backoffice = 1`.
- **Source:** code: lib/AndroidController.php:722-737 (put_intervento); docs: docs/02-patterns/16-mobile-inbound-sync.md | **Fact:** the legacy app overwrites the esecuzione only when `!isBlockedByBackoffice()`. Otherwise «i dump dell'app per quell'intervento diventano ignorati silenziosamente».
- **Source:** code: lib/MobileV3/Domain/EsitoWriter.php:15-50 | **Fact:** GOPlanner 3 checks the stato already on the server before writing:
  - stato ≥ 6, including 8 and 99: 409 `intervento_locked`, never overwritten.
  - stato 4 or 5: 409 `already_closed`.
  - same timestamp, operatore and content: `already_applied`, nothing written.
  - The write is one transaction with `FOR UPDATE`.
- **Source:** docs: docs/02-patterns/34-stato-utenza-derivato-ultimo-intervento.md; wiki: wiki/assistenza-clienti/stato-utenza-assegnato-dopo-chiusura.md | **Fact:** `updateStatoUtenza()` copies the stato of the intervento last touched to `utenti.stato_id`. With interventi multipli the utenza can still read «assegnato» after a closure: «Il lavoro non è andato perso». Pointer to ch.3 only.
- **Source:** wiki: wiki/assistenza-clienti/runbook-dove-si-e-fermato-il-dato.md; jira: GOP-264 | **Fact:** the runbook starts from the symptom «l'operatore dice di aver chiuso l'intervento ma non lo vedo». It names three causes: never sent from the phone, lost on the way, or reached the server and not saved. Pointer to ch.12 only.

### § 3 — Modifica, Annulla, Elimina

- **Source:** code: lib/JSONController.php (modifica_interventi) | **Fact:** the query keeps only `stato_id=3 OR stato_id=9` (Assegnato, Annullato); other stati are filtered out in SQL. `$messaggio` is always `''`. `success` is false only when no row matched.
- **Source:** code: js/code/interventi_elenco.js (modifica-dialog) | **Fact:** the callback ignores the response. It only reloads the grid (`flexReload`) and clears the selection, so a skipped row produces no message.
- **Source:** code: lib/InterventoBase.php (modificaPianificazione) | **Fact:** it writes `data_pianificata` (an empty date keeps the current one), plus `operatore` only if not empty, plus `tipo_intervento` if given. It calls the tenant hooks `beforeModifica`/`afterModifica`. It does not touch `stato_id`, so an Annullato stays Annullato. Gea's `cambia_data_intervento` uses the same method (GOP-527).
- **Source:** code: custom/default/js/custom.js (getCampiModificaDialog); lib/dict/lang_it.php:325 | **Fact:** the default «Modifica intervento» window has the heading «Dati intervento», a read-only count «Interventi selezionati», «Operatore» (select) and «Data». Some tenants add «Tipo intervento».
- **Source:** code: lib/JSONController.php (modifica_interventi); custom/*/js/custom.js | **Fact:** tenant option `applica_eseguiti`: when it is `'i'` the filter becomes `stato_id > 3`. 17 tenant folders show it in the window as «Applica a eseguiti».
- **Source:** code: getconfig.php; custom/*/php/flexifields.php | **Fact:** the toolbar buttons of the Lista come from each tenant's `flexifields.php` (71 files); there is no core default list. 37 tenant flexifields define a button with `onpress 'annulla'`.
- **Source:** code: js/code/interventi_elenco.js (selezionaTutti) | **Fact:** «Tutti» adds `trSelected` to `.bDiv tbody tr`, so it selects only the rows rendered on the current page. Modifica, Annulla and Elimina all act on selected rows.
- **Source:** code: lib/JSONController.php (annulla_intervento) | **Fact:** it sets `interventi.stato_id = 9` and saves. It does not check the current stato, does not touch `interventi_eseguiti`, and does not update the utenza.
- **Source:** code: lib/JSONController.php (modifica_interventi, annulla_intervento) | **Fact:** neither calls `updateStatoUtenza()`. The core call sites are ADMINController and one tenant's Admin.php.
- **Source:** code: lib/JSONController.php (elimina_intervento) | **Fact:** if a row exists in `interventi_eseguiti` with the same id, it refuses. An already-deleted id returns success, so a double click is harmless.
- **Source:** code: lib/JSONController.php (elimina_intervento) | **Fact:** after a delete, if the utenza has no open intervento left, `utenti.stato_id` goes from 3 to 2.
- **Source:** code: lib/JSONController.php (elimina_intervento, notaAnnullatoDaBackoffice); jira: GOP-462 | **Fact:** a call-center appointment is not deleted. It is set to 9, and the note gets `[Annullato da back-office: <login> gg/mm/aaaa hh:mm]` at the top, cut to 255 characters. GOP-462 (Completata, 22/10/2026): before the fix «Elimina» physically deleted those appointments, and the call-center API then answered 404 when it tried to move them.
- **Source:** code: lib/Intervento.php (Intervento::delete) | **Fact:** it throws «Impossibile cancellare l'intervento N: esiste già un intervento eseguito associato.» when `!$ie->isNew()`.
- **Source:** docs: docs/02-patterns/21-guard-cancellazione-intervento-eseguito.md; code: lib/json_functions.php (elimina_interventi_non_chiusi) | **Fact (real case: problem → cause → fix):**
  - Problem: on one commessa some esecuzioni disappeared from the export.
  - Cause: several delete paths removed interventi without checking `interventi_eseguiti`. The tables are MyISAM, with no foreign keys. The orphan esecuzioni then dropped out of exports built on `LEFT JOIN interventi` with a WHERE on `interventi` columns.
  - Fix 1: a guard in `Intervento::delete()`. It does not cover tenants with their own `php/Intervento.php`, so `elimina_intervento` also checks the table directly.
  - Fix 2: `del_intervento`/`del_interventi` go through `elimina_interventi_non_chiusi()`, which skips rows with an esecuzione and returns `bloccati`.
  - Committente name: omit.
- **Source:** code: lib/MenuInterventi.php:26; Smarty_templates/it/interventi.html:567; js/code/core_functions.js (eliminaInterventi); json.php:6383 (del_interventi) | **Fact:** the Mappa «Elimina» calls `del_interventi&op=<operatore>`. The server selects `SELECT * FROM interventi WHERE operatore=$id`, **with no date filter**, and deletes through `elimina_interventi_non_chiusi`.
- **Source:** code: lib/OperazioniController / Gea; wiki: wiki/assistenza-clienti/riaffida-intervento.md | **Fact:** the wiki article (16/11/2026) matches the code on the accepted stati and the silent skip.

### § 4 — Ripianifica e il precedente

- **Source:** code: lib/JSONController.php (ripianifica_intervento) | **Fact:** it validates before touching any data: operatore ≤ 0, or a date that is not `d/m/Y` with a year from 2000 to 2100, stops the call and nothing changes.
- **Source:** code: lib/JSONController.php (ripianifica_intervento) | **Fact:** it always inserts a **new** `interventi` row with the same `id_utenza` and `id_carico`, the chosen operatore, `data_pianificata` and `stato_id` 3. It then calls `afterPlan()` and `cambia_stato($idUtenza, 3)`, so the utenza becomes Assegnata. It uses `INSERT` with interventi multipli and `REPLACE` without.
- **Source:** code: lib/JSONController.php (ripianifica_intervento) | **Fact:** there is no check on the stato of the source intervento. It works on any intervento open in the Verifica.
- **Source:** code: lib/JSONController.php (ripianifica_intervento + PHPDoc) | **Fact:** without `interventi_multipli`, `$delete` is always true. It deletes the esecuzione, then the intervento, then the `foto` rows (`WHERE id_intervento=`), and unlinks the files under the commessa's `foto/` folder. The PHPDoc says this is «comportamento attuale… in attesa della decisione su come trattarlo (non e' una scelta di progetto)».
- **Source:** code: lib/JSONController.php (ripianifica_intervento) | **Fact:** with `interventi_multipli`, the old intervento is deleted only if `cancella_precedente == 'Si'`. Otherwise it stays, with its esito and foto.
- **Source:** code: custom/{tenant}/js/custom.js (getCampiAssegnaDialog); js/code/core_functions.js (creaCampo 'sino') | **Fact:** «Cancella precedente» is a tenant field of type `sino`: a select with an empty option, «Sì» (value `Si`) and «No». 48 tenant `custom.js` files define it, and all 48 have `interventi_multipli = true`.
- **Source:** code: js/code/verifica_unica.js | **Fact:** «Ripianifica» is in the bottom bar (only if `azioni.ripianifica`), to the left of «Verificato». It opens a dialog titled «Ripianifica <codice>» with the buttons «Assegna incarico» and «Annulla». The server message is shown in an alert, then the list reloads.
- **Source:** code: lib/AvanzamentoCarichi.php (header, conteggi) | **Fact:** «nf e rp guardano l'ultimo intervento non annullato (una pratica ripianificata e poi riassegnata non e' piu' ripianificabile)». A non fattibile counts «finche' e' l'ultimo intervento non annullato della pratica». Keeping the old one does not inflate the non fattibili of the carico.
- **Source:** wiki: wiki/assistenza-clienti/ripianifica-non-fattibile.md, wiki/assistenza-clienti/elimina-precedente.md (16/11/2026) | **Fact:** the rule is: keep the old intervento if it was verified, sent or exported, or if its foto or motivazioni matter; delete it only if it was recorded by mistake or is a useless duplicate; when in doubt, keep it. The wiki itself labels this «un'indicazione di prudenza… non una decisione registrata».

### § 5 — Rapporti › Verifica interventi

- **Source:** jira: GOP-630 (Completata, 05/11/2026) | **Fact:** before GOP-630 there were 11 copies of `js/code/interventi_verifica*.js` (700–1.050 lines each), chosen by tenant type. They became one page, with only what differs in the tenant configuration. Foto are never modified from the back office: «sono firmate dal telefono».
- **Source:** jira: GOP-763 (Completata, 11/11/2026) | **Fact:** the single page was built as a general library with extension points (custom search, scheda fields, tenant PDF buttons, unified AI). Sorical was the pilot.
- **Source:** jira: GOP-636; code: lib/MenuRapporti.php | **Fact:** «Verifica interventi» is the first item of Rapporti and the page Rapporti opens. Some database groups route to their own Verifica (`verifica_acea`, `verifica_smat`); one database has no Verifica and opens Riepilogo interventi.
- **Source:** code: pages/rapporti.php; lib/VerificaInterventi.php | **Fact:** `rapporti.php?action=verifica` (and `verifica_smat`) is redirected to `action=verifica_unica` when the tenant sets `$custom['verifica_unica']`. The other tenants stay on their previous page.
- **Source:** code: `git grep verifica_unica -- custom/*/config.inc.php` | **Fact:** 11 tenant folders set it: acquedottolucano, easy_iren, easy_mms, easy_santantimo, easy_spot, easy_unareti, italgas_medea, sg_italgas, sg_smat, sg_smat_test, sorical. There are 74 folders under `custom/`.
- **Source:** docs: docs/03-cookbooks/34-verifica-interventi-estensioni-tenant.md; jira: GOP-777 | **Fact:** easy_mms, easy_unareti and acquedottolucano switched on 20/11/2026; sg_italgas and easy_spot on 24/11/2026 (GOP-869). Italgas Medea was configured on 12/11/2026 with the AI off. Other Sologas tenants and 12 Easy commesse still use their own `interventi_verifica*.js`; moving them is undecided (GOP-806).
- **Source:** code: lib/VerificaInterventi.php | **Fact:** `STATO_VERIFICATO = 6`. `STATI_CHIUSI = '6, 7'`, commented «Verificato e inviato: gli stati che il filtro «solo da verificare» esclude».
- **Source:** code: lib/VerificaInterventi.php (configPredefinita) | **Fact:** the default scheda:
  - «Dati rilevati» (`fatti`, read only): «Operatore», «Esito» (Positivo/Negativo), «Distanza», «Matricola attuale», «Prevista sostituzione», «Posizione».
  - `verifica`: «Data e ora» and «Esito intervento» (field `stato_id`, options 4 «Eseguito», 5 «Non fattibile»).
  - Then `verifica_extra`, then the tenant's campi custom (GOP-646), then «Note», always last.
  - `esiti_negativi` = 5 and 99.
- **Source:** code: lib/VerificaInterventi.php (configPredefinita) | **Fact:** default `azioni`: verbale, ripianifica, anagrafica and analisi_ai on; carica_foto off. `stato_rimandato` = 3, `stato_da_finire` = null. `ricerca_utenza`, `scheda_tenant`, `verificato_via_orm` and `backoffice_su_modifica` are false.
- **Source:** jira: GOP-630 | **Fact:** decided in the design: «Esito intervento» (the verificatore's, editable) and «Esito» (declared by the phone, read only) are two separate fields.
- **Source:** code: lib/JSONController.php | **Fact:** endpoints: `verifica_config`, `verifica_scheda`, `verifica_elenco_foto`, `verifica_cambia_tipo_foto`, `verifica_salva_campo`, `verifica_verificato`.
- **Source:** code: lib/JSONController.php | **Fact:** saving a field and «Verificato» need the permission `interventi.modificare`, otherwise «Non hai il permesso di modificare gli interventi».
- **Source:** code: lib/JSONController.php (verificaImpostaStato) | **Fact:** «Verificato» writes `interventi_eseguiti.stato_id = 6` with a direct UPDATE, or through `updateCampo` when `verificato_via_orm` is set. Then `Intervento::allineaStatoAEsitoVerificato()` aligns the intervento, forward only.
- **Source:** code: lib/JSONController.php (verificaImpostaStato) | **Fact:** for an intervento with no esecuzione («Interventi mancanti»), the `interventi_eseguiti` row is created at that moment.
- **Source:** code: lib/VerificaInterventi.php; docs: docs/03-cookbooks/34-verifica-interventi-estensioni-tenant.md | **Fact:** «Codice» shows suggestions only where the tenant has `ricerca_utenza`. Choosing one shows all interventi of that utenza: Periodo is ignored and «Solo da verificare» is not sent. Typing without choosing filters on codice/matricola.
- **Source:** code: custom/*/config.inc.php | **Fact:** `ricerca_utenza` is on for acquedottolucano, easy_iren, easy_mms, easy_spot, easy_unareti, italgas_medea, sg_italgas and sorical. It is off for easy_santantimo, sg_smat and sg_smat_test.
- **Source:** code: custom/easy_iren/php/InterventoEseguito.php (getForExport); custom/easy_iren/README.md | **Fact (one commessa only):** the return file takes only `esito=1 AND ie.stato_id=6 AND ie.data_validazione BETWEEN <inizio> AND <fine> 23:59:59`. The README notes that a direct UPDATE would have made verified interventi vanish from the file, which is why `verificato_via_orm` is set there.
- **Source:** code: custom/*/config.inc.php | **Fact:** `verificato_via_orm` is on for easy_iren, acquedottolucano and sg_italgas.
- **Source:** wiki: wiki/assistenza-clienti/verifica-interventi-iren.md (16/11/2026) | **Fact:** it matches the code for the filter bar, the keys and the «Solo da verificare» tip. Its scheda is Iren only: eight foto types, an «Esito intervento» option «Autolettura», «Segnalazione», «Data validazione». It was tested on a local bench with invented data, not on the real tenant.
- **Source:** jira: GOP-688 (Completata) | **Fact (ticket story, no personal data):**
  - Problem: on one commessa the Verifica showed neither eseguiti nor foto, and the operatore said the work had been sent.
  - Cause: an empty `servizi` string made `json_extract` fail on the whole grid, and a SMAT-specific scheda read a column the tenant lacked.
  - Fix: empty `servizi` is treated as NULL; the column is read only if it exists.
  - The data had not been lost.

### § 6 — Analisi AI delle foto

- **Source:** jira: GOP-674 (epic), GOP-718, GOP-719, GOP-720, GOP-721 | **Fact:** AI analysis in Verifica interventi, built in four steps (07–08/11/2026): settings per commessa (1/4), engine with saved results and background run (2/4), button, «Esito AI» column and review window (3/4), assistant for rules with action buttons (4/4). Rule repeated in each ticket: «L'AI propone, il back office decide: nessun esito scritto sull'intervento senza conferma. Solo "AI" nell'interfaccia».
- **Source:** docs: docs/analisi-ai/contratto.md § 1 | **Fact:** the analysis writes nothing to `interventi`, `interventi_eseguiti`, `foto` or campi custom; it writes only to its own tables. An empty foto-type list means all foto. One call per foto.
- **Source:** docs: docs/analisi-ai/contratto.md § 4.4 | **Fact:** «L'esito AI è informativo»: it does not invalidate the intervento or change its stato.
- **Source:** code: lib/AnalisiAiCatalogo.php; docs: contratto.md § 2.2 | **Fact:** check names as shown: «Tipo di foto», «Matricola», «Nuova matricola», «Lettura», «Sigillo presente», «Modello e calibro», «Targhetta metrica», «Piombatura dopo la verifica», «Qualità della foto», «Posizione dello scatto».
- **Source:** docs: contratto.md § 2.3 | **Fact:** checks on by default: tipo, matricola, nuova matricola, lettura, sigillo, qualità. Matricola and nuova matricola are set to «blocca»; the others to «segnala».
- **Source:** code: lib/AnalisiAiCatalogo.php; lib/AnalisiAiEsito.php (confrontaPosizione) | **Fact:** default tolerances: Lettura 2, Posizione 200 metres. Within tolerance → Conforme; within double → Da verificare; beyond → Non conforme. Missing coordinates → Da verificare.
- **Source:** code: lib/AnalisiAiEsito.php (confrontaMatricola); docs: contratto.md § 4.4 | **Fact:** the matricola comparison ignores spaces, hyphens and case. One different character at the same length → Da verificare. An unreadable value → Da verificare, never Conforme. A matricola that matches the other meter → Da verificare with a «scambio» note.
- **Source:** docs: contratto.md § 4.4 | **Fact:** modello with an expected value: equal → Conforme, different → Da verificare.
- **Source:** code: lib/AnalisiAiEsito.php (GOP-738); docs: contratto.md §§ 2.2, 4.4 | **Fact:** the seal checks (sigillo, piombatura) never reject: «non conforme» becomes Da verificare.
- **Source:** code: lib/AnalisiAiMotore.php; docs: contratto.md § 4.4 | **Fact:** with several foto, the rule depends on the check:
  - «migliore» (matricola, nuova matricola, lettura, modello, targhetta, sigillo, piombatura): the best foto wins.
  - «peggiore» (tipo di foto, qualità): some non-conforming foto → Da verificare, with the note «N foto su M da guardare: …»; Non conforme only if all are.
- **Source:** code: lib/AnalisiAiPrompt.php (VALORI_NASCOSTI); docs: contratto.md § 2.4 | **Fact:** the registered matricola, nuova matricola, lettura and calibro never reach the AI. They are replaced by «[valore registrato: non ti viene mostrato, il confronto lo fa il sistema]».
- **Source:** docs: contratto.md § 5.4 | **Fact:** «corregge» is allowed only on value checks (matricola, nuova matricola, lettura, modello) and adds a case to the banco di riferimento. A «conferma» after a «corregge» removes that case. Neither touches the intervento.
- **Source:** code: lib/VerificaInterventi.php (configPredefinita) | **Fact:** `analisi_ai_campi` is empty by default, so on approval a correction does not change the intervento unless the tenant maps the field.
- **Source:** code: lib/JSONController.php (analisi_ai_approva) | **Fact:** «Approva» is refused while the analysis is queued or running. Otherwise it follows the same path as «Verificato» (stato 6) and logs «approva».
- **Source:** code: lib/AnalisiAiRevisione.php (messaggioBlocco) | **Fact:** «Approva» is refused while a blocking check has no decision.
- **Source:** code: lib/JSONController.php (analisi_ai_rimanda); docs: contratto.md § 10 | **Fact:** «Rimanda all'operatore» sets `stato_rimandato` (default 3, Assegnato) and logs «rimanda» with the note. On sg_smat `stato_rimandato` = `stato_da_finire` = 3, so a sent-back intervento becomes «Da finire».
- **Source:** code: lib/JSONController.php (analisi_ai_esiti) | **Fact:** the review log shows the last 30 actions (`AnalisiAiRegistro::elenco($id, 30)`), table `analisi_ai_registro` (migration 0030). Without the table the actions still work and the log is empty.
- **Source:** code: lib/JSONController.php (analisiAiEsegui) | **Fact:** every AI action needs the permission `interventi.modificare`.
- **Source:** code: pages/impostazioni.php; docs: docs/analisi-ai/impostazioni.md | **Fact:** Impostazioni › «Analisi AI delle foto» (`impostazioni.php?action=analisi_ai`) is visible only with `impostazioni.modificare`, which in words means whoever can change the Impostazioni (amministratori).
- **Source:** code: lib/AnalisiAiIstruzioni.php | **Fact:** `MAX_TESTO = 2000` characters, `MAX_REGOLE = 50`.
- **Source:** code: lib/AnalisiAiBanco.php | **Fact:** `LIMITE_PROVA = 20` cases. There are 10 s between tests. The «prima» result is reused for 600 s (10 min), and a test result is valid at save for 1800 s.
- **Source:** docs: docs/analisi-ai/impostazioni.md | **Fact:** a test costs at most 2 × 20 AI calls. «Aiutami a scriverle» takes a description of up to 1000 characters, proposes a rule of up to 600, with 5 s between requests. Nothing applies without a click or «Autorizza».
- **Source:** wiki: wiki/assistenza-clienti/runbook-regola-istruzioni-ai.md; jira: GOP-721 | **Fact:** Gea uses `proponi_regola_ai` (changes nothing), then `applica_regola_ai` (asks «Autorizza», saves a new version). This works only from Impostazioni › Analisi AI delle foto.
- **Source:** code: custom/*/config.inc.php, verifica_unica.inc.php; docs: cookbook 34 | **Fact:** `azioni.analisi_ai` is **off** for acquedottolucano, easy_iren, easy_mms, easy_spot, easy_unareti and italgas_medea. It is **on** for sg_smat, sg_smat_test, sg_italgas, sorical and easy_santantimo (the last by default). Cookbook 34: «Iren (easy_iren) non usa l'analisi AI».

---

## [SHADOW]

### Labels, messages and numbers — § 1 and § 2

- **Source:** code: lib/VerificaInterventi.php:35-39 | **Detail:** `MOTIVO_DA_FINIRE`, verbatim: «L'intervento è «Da finire»: è in mano all'operatore, che deve chiuderlo dall'app. Dalla Verifica si potrà chiudere dopo.»
- **Source:** code: js/code/verifica_unica.js | **Detail:** on a «Da finire» intervento the page says «Lo chiude l'operatore dall'app».
- **Source:** code: custom/sg_smat/config.inc.php:14-24 | **Detail:** in the app the half-save button reads «Salva e torna all'elenco», and the list label is «DA FINIRE». Config comment: «Il nome all'utente e' sempre «Da finire», mai «Rapportino»».
- **Source:** code: js/code/verifica_unica.js:1655-1668 | **Detail:** pressing Invio on an Inviato intervento: «Intervento già inviato: Invio non lo riporta a Verificato». The mouse still works.
- **Source:** code: lib/AvanzamentoCarichi.php:66-69 | **Detail:** setting `carichi_completati_da`: with «verificati» (the default) the carico counts stati [6, 7] as completed; with «inviati» only [7].
- **Source:** code: js/code/flexigrid.js:78; lib/GridRequest.php:16 | **Detail:** Lista page sizes `[10, 25, 50, 100, 250, 1000]`; `MAX_RP = 1000` rows per request. The default sort is `id_intervento` desc. The initial row count comes from the window height.
- **Source:** wiki: wiki/assistenza-clienti/runbook-dove-si-e-fermato-il-dato.md | **Detail:** a tablet silent for more than 48 hours is the typical «non è mai partito» case.
- **Source:** code: js/code/verifica_unica.js | **Detail:** no foto: «Nessuna foto per questo intervento».

### Labels, messages and numbers — § 3

- **Source:** code: lib/dict/lang_it.php:325; grid buttons | **Detail:** «Modifica intervento» (window title and confirm button). Buttons «Modifica», «Annulla», «Elimina», «Tutti».
- **Source:** code: js/code/interventi_elenco.js (annulla); lib/dict/lang_it.php:1677, 61, 1678 | **Detail:** confirmation titled «Annulla interventi»: «Sei sicuro di voler annullare gli interventi selezionati? L'operazione non è reversibile.» One request is sent per selected row, then the list reloads.
- **Source:** code: js/code/interventi_elenco.js (elimina); lib/dict/lang_it.php:84, 61, 85 | **Detail:** confirmation titled «Elimina interventi»: «Sei sicuro di voler eliminare gli interventi selezionati? L'operazione non è reversibile.»
- **Source:** code: lib/JSONController.php (elimina_intervento) | **Detail:** refused delete, exact text: «Intervento non cancellato perché già chiuso (intervento eseguito associato).»
- **Source:** code: js/code/core_functions.js (eliminaInterventiSelezionati) | **Detail:** the alert after Elimina:
  - lists «<id>: <messaggio>» for each refused row, under the title «Interventi non cancellati»;
  - is titled «Interventi annullati» when only call-center rows were involved;
  - for call-center rows reads «Appuntamenti del call center annullati invece che eliminati (restano nello storico come Annullato): <ids>».
- **Source:** code: lib/JSONController.php (elimina_intervento) | **Detail:** server message for a call-center appointment: «Appuntamento del call center annullato, non eliminato: resta nello storico come Annullato.» The note prefix is `[Annullato da back-office: <login> gg/mm/aaaa hh:mm]`, cut to 255 characters; do not reproduce a login.
- **Source:** code: json.php:6383 (del_interventi) | **Detail:** Mappa «Elimina» messages: «Tutti gli interventi pianificati sono stati cancellati!» or «Interventi cancellati. N intervento/i non cancellati perché già chiusi (intervento eseguito associato).»
- **Source:** jira: GOP-749 (Completata, 10/11/2026) | **Detail (ticket story, no personal data):**
  - Problem: on a commessa with interventi multipli, «Assegna incarico» (`put_incarichi`) created a new intervento at each send without checking for one already assigned.
  - Overlapping selections sent several times produced 299 copies, 182 of which were deleted on 10/11.
  - Fix: the protection already added for another commessa was extended to this one, with a test.

### Labels, messages and numbers — § 4

- **Source:** code: lib/JSONController.php (ripianifica_intervento) | **Detail:** error messages: «Seleziona l'operatore a cui assegnare l'intervento»; «Data di ripianificazione non valida». Generic failure: «Problemi nella ripianificazione dell'intervento».
- **Source:** code: lib/JSONController.php (ripianifica_intervento) | **Detail:** exact success text: «E' stato creato un nuovo intervento di {tipo_intervento} con ID {N}», with «E'» and an apostrophe. When the tipo is empty it reads «…intervento di  con ID N».
- **Source:** code: js/code/verifica_unica.js | **Detail:** dialog «Ripianifica <codice>», buttons «Assegna incarico» / «Annulla».
- **Source:** code: js/code/verifica_unica.js | **Detail:** «Ripianifica» will not open in two cases: «Verificato in corso: ripianifica non aperta» and «Scheda non in vista: ripianifica non aperta».
- **Source:** code: custom/*/js/custom.js (getCampiAssegnaDialog) | **Detail:** tenant fields of the window: «Dati intervento», «Utenze selezionate»/«Utenze», optional «Cancella precedente» (empty / «Sì» / «No»), optional «Tipo intervento», «Operatore», «Data».

### Labels, messages and numbers — § 5

- **Source:** code: Smarty_templates/it/rapporti.html (verifica_unica); lib/dict/lang_it.php | **Detail:** page title «Verifica interventi». Filters «Lista», «Operatore», «Periodo» (from/to), «Codice». Ticks «Solo da verificare» (on when the page opens), «Interventi mancanti», «No tipo». Also the buttons «Carica dati dai terminali» and «Analisi AI».
- **Source:** code: Smarty_templates/it/rapporti.html (hintbar); js/code/verifica_unica.js | **Detail:** keys: ↑/↓ change intervento, ←/→ change foto, Invio presses «Verificato» and moves to the next one to verify. At the end: «Nessun altro intervento da verificare in questa pagina».
- **Source:** jira: GOP-630 | **Detail:** the scheda must fit with no scroll at 1920×950 and 1440×900. Light theme only. The foto viewer is square («contain»), widens to 4:3 and lengthens to 3:4, and rotates only in view.
- **Source:** code: js/code/verifica_unica.js | **Detail:** section headings «Dati rilevati» (subtitle «sola lettura»), «Verifica» («si salva da solo, campo per campo») and «Campi del cliente» («definiti dal tenant»).
- **Source:** code: js/code/verifica_unica.js | **Detail:** field states «In modifica», «Salvataggio…», «Salvato», «Errore». GOP-630: red while typing, saved on blur, green if OK.
- **Source:** code: js/code/verifica_unica.js | **Detail:** «Verificato» is refused while a field is in error: «correggi prima il campo in errore». On failure: «Verificato non salvato: …».
- **Source:** code: lib/JSONController.php (verificaImpostaStato) | **Detail:** server messages «Intervento non trovato» and «Salvataggio non riuscito: …».
- **Source:** code: js/code/verifica_unica.js | **Detail:** bottom bar: «Verbale», the tenant's PDF buttons, «Anagrafica», «Carica foto» (only if on), «Ripianifica», and the primary «Verificato».
- **Source:** code: js/code/verifica_unica.js | **Detail:** changing the foto type: the type tag itself is clickable. Tooltip «… clic per cambiare il tipo (la foto non viene modificata)»; aria-label «Tipo di foto: X. Cambia il tipo (la foto non viene modificata)». A corrected tag shows «· corretto». GOP-630: the original type from the phone and the corrected type stay as two fields, with who corrected and when.
- **Source:** code: js/code/verifica_unica.js | **Detail:** foto metadata: «Scattata il», «Dispositivo», «Posizione … dal cliente», «Provenienza» («Galleria» / «Fotocamera dell'app»). Anomaly tag «Anomalia: foto richiesta dalla galleria».
- **Source:** code: js/code/verifica_unica.js | **Detail:** «Codice» tooltip: «Codice, matricola o ragione sociale: scegli una proposta per vedere tutti gli interventi dell'utenza».
- **Source:** jira: GOP-807 | **Detail:** one commessa had 3.644 interventi eseguiti in the 90 days up to 13/11/2026, which gives the scale of a day of verification. The ticket's passage to the new platform is still «Da completare». Use only if the Writer needs an order of magnitude, without naming the commessa.

### Labels, messages and numbers — § 6

- **Source:** code: js/code/analisi_ai.js | **Detail:** panel note: «L'AI propone, il back office decide: nessun esito viene scritto sull'intervento senza la conferma del revisore.»
- **Source:** code: js/code/analisi_ai.js | **Detail:** the button reads «Analisi AI», or «Analisi AI (n)» with n selected. Panel sections «1 · Cosa controlla l'AI», «2 · Come si avvia», «3 · Istruzioni per l'AI».
- **Source:** code: js/code/analisi_ai.js | **Detail:** launch modes:
  - «Sugli interventi selezionati»: «Spunta gli interventi nell'elenco, poi «Analisi AI».»
  - «Su tutto il carico».
  - «In background, con avanzamento»: «Parte su tutto il carico e puoi chiudere la finestra: la colonna «Esito AI» si riempie man mano.»
  - The last two need a lista: «Scegli prima una lista nei filtri.»
- **Source:** code: js/code/analisi_ai.js | **Detail:** start buttons «Avvia l'analisi» / «Avvia in background». Progress «N di M interventi analizzati · puoi chiudere la finestra». Duplicate launch: «Questi interventi sono già in coda o in corso.»
- **Source:** code: js/code/analisi_ai.js; lib/VerificaInterventi.php (colmodelConAnalisiAi) | **Detail:** column «Esito AI» with values «Conforme», «Da verificare», «Non conforme», «Non analizzato», «In coda», «In corso», «Non riuscita». Row buttons «Rivedi» (when analysed) or «Analizza».
- **Source:** code: js/code/analisi_ai.js | **Detail:** window title «Analisi AI delle foto», header «Intervento <id>» with «‹ Precedente» / «Successivo ›». Table columns «Controllo», «Atteso», «Letto dall'AI», «Esito», «Decisione del revisore».
- **Source:** code: js/code/analisi_ai.js | **Detail:** decision buttons «Confermo» and «Correggo» (value checks only), then a field and «Salva». An empty value gives «Scrivi il valore corretto.»
- **Source:** code: js/code/analisi_ai.js | **Detail:** the tag «Blocca» marks an undecided blocking check. Message: «Per approvare scegli Confermo o Correggo su: «…». Sono impostati su «Blocca l'approvazione».»
- **Source:** code: lib/AnalisiAiRevisione.php (messaggioBlocco) | **Detail:** server text: «Il controllo «X» è impostato su «Blocca l'approvazione»: scegli Confermo o Correggo prima di approvare.»
- **Source:** code: lib/JSONController.php (analisi_ai_approva) | **Detail:** «L'analisi AI è ancora in corso: aspetta che finisca.»
- **Source:** code: js/code/analisi_ai.js | **Detail:** «Nota per l'operatore (facoltativa)», buttons «Rimanda all'operatore» and «Approva l'intervento».
  - «Approva» is disabled when the intervento is blocked or already verified («Intervento già verificato.»).
  - Success texts: «Intervento <id> approvato.» and «Intervento rimandato all'operatore.»
- **Source:** code: js/code/analisi_ai.js | **Detail:** the log is titled «Azioni del revisore (n)», empty state «Ancora nessuna azione.»
- **Source:** code: js/code/analisi_ai.js | **Detail:** «Questo intervento non è ancora stato analizzato.» with «Analizza ora». «Analisi AI in coda… la pagina si aggiorna da sola.» Errors show «Riprova».
- **Source:** code: js/code/analisi_ai.js | **Detail:** zoom help: «Il riquadro giallo indica dove l'AI ha letto il valore. Frecce per scorrere le foto, R per ruotare, Esc per chiudere.»
- **Source:** code: lib/JSONController.php (analisiAiEsegui) | **Detail:** «Non hai il permesso di usare l'analisi AI».
- **Source:** docs: contratto.md § 4.5 | **Detail:** an out-of-format answer gets one retry, then Da verificare with «Risposta dell'AI non interpretabile». After 3 call errors in a row: «L'AI non è al momento disponibile. Riprova tra poco.»
- **Source:** docs: contratto.md § 6 | **Detail:** an analysis stuck «in corso» for more than 30 minutes is treated as an error: «Analisi interrotta. Riprova.»
- **Source:** code: lib/AnalisiAiServizio.php (MSG_NON_DISPONIBILE); docs: contratto.md § 1.2 | **Detail:** «Analisi AI non ancora disponibile su questa commessa.»
- **Source:** code: Smarty_templates/it/impostazioni_analisi_ai.html | **Detail:** settings page:
  - Subtitle «Cosa controlla l'AI sulle foto degli interventi di questa commessa».
  - Columns «1 · Che lavoro fa questa commessa», «2 · Controlli» («Altri controlli disponibili»), «3 · Istruzioni per l'AI».
  - «Riepilogo dei controlli», «Testo che arriva all'AI, foto per foto», «Modifica a mano», «Torna alle istruzioni automatiche», «Prima riga», «Regole in più (una per riga)».
  - «Aiutami a scriverle», «Applica la proposta», «Mostra le differenze», «Scarta», «Storico», «Banco di riferimento», «Prova sul banco di riferimento», «Annulla modifiche», «Salva».
- **Source:** code: js/code/impostazioni_analisi_ai.js | **Detail:** the tag «Rilevato» marks the detected tipo di lavoro. «Rimetti questa» puts an old version back; it becomes active only with «Salva», as a new version noted «Dalla versione N». After saving: «Salvato: ora è in uso la versione N».
- **Source:** code: js/code/impostazioni_analisi_ai.js | **Detail:** bench result per check: «giuste N · sbagliate N · illeggibili N», columns «Prima» / «Dopo», tags «Peggiora» / «Migliora» / «Uguale».
- **Source:** code: js/code/impostazioni_analisi_ai.js | **Detail:** confirmations «Attiva comunque» / «Non attivare» when the result is worse, and «Salva senza provare» / «Non salvare» when untested.
- **Source:** jira: GOP-718 | **Detail:** the tipo di lavoro choices are lettura, verifica metrica, sostituzione contatore and sopralluogo, detected from the tipi di intervento. Each check offers only «Segnala» / «Blocca l'approvazione» and, where needed, the tolerance. The first design said «Prova su 5 interventi recenti»; the code has the banco di riferimento with max 20 cases.
- **Source:** jira: GOP-738 (Completata, 09/11/2026) | **Detail (ticket story, no model, host or meter data):**
  - Problem: in a test on one commessa (4 interventi, 24 foto) the «tipo» check failed on all 4 interventi, because a single Avviso or anomaly foto was enough to reject the intervento. The seal check never came out conforme.
  - Decision: Avviso foto are treated differently.
  - Result: the seal checks never reject, and the «peggiore» rule gives Da verificare when only some foto fail.

---

## [CONFLICT]

| # | Claim | Source A | Source B | Resolution |
|---|---|---|---|---|
| 1 | How many commesse have interventi multipli | wiki: elimina-precedente.md — the ones without it are «la maggior parte» | docs: 02-patterns/34 — «una quarantina di tenant» have it on. code: 47 `config.inc.php` set `$custom['interventi_multipli'] = true` (3 of them `_test`), one sets false, one has it commented out, out of 73 folders with a `config.inc.php` (including `default`, test and dev; 74 directories in all). 48 `custom.js` define «Cancella precedente», all with multipli on | The code contradicts the wiki: interventi multipli **on** is the majority (about 47 of 73 folders). Pattern 34 is roughly consistent. Writer: **«dipende dalla commessa»**, never «la maggior parte senza». [UNVERIFIED: how many of the 73 folders are live production commesse] |
| 2 | Name of the utenza table | docs: 01-foundations/07-database-schema.md — `utenze`, key `id_utenza` | code: lib/UtenzaBase.php:38 `$table = 'utenti'`; pattern 34 `UPDATE utenti SET stato_id`; `elimina_intervento`/`cambia_stato` write `utenti`; but json.php `del_interventi` writes `UPDATE utenze SET stato_id=2` | The seed has both `utenti` and a separate `utenze` table. The Utenza model is `utenti`; code wins. DEV boxes: `utenti.stato_id`. |
| 3 | Name of the esito that does not close | code: EsitoCatalog DEFAULTS — label «Rapportino» (stato 3, does not close) | jira: GOP-782; VerificaInterventi::ETICHETTA_DA_FINIRE; sg_smat config — «Da finire», «mai «Rapportino»» | Only sg_smat and sg_smat_test declare it, relabelled «Da finire». In UFFICIO text write only «Da finire». «Rapportino» may appear only in a DEV box, as the code id. |
| 4 | AI unavailable message | code: AnalisiAiServizio::MSG_NON_DISPONIBILE; docs: contratto.md § 1.2 — «Analisi AI non ancora disponibile su questa commessa.» | code: js/code/analisi_ai.js fallback — «Analisi AI non disponibile» | The JS fallback shows only when the server sends no text. Quote the server text. |
| 5 | Which Verifica page applies | jira: GOP-630, GOP-763 — one single page for all standard active tenants | code + cookbook 34 — single page only on the 11 folders with `$custom['verifica_unica']` (as of 24/11/2026). Other Sologas tenants and 12 Easy commesse still use `interventi_verifica*.js` (11 core files + 79 tenant copies). MenuRapporti routes Acea and SMAT database groups to their own pages. GOP-777: Medea users will see the page only after moving to php8 | The § 5 description applies only to commesse switched to the single page. The Limite paragraph says the others keep their previous page. |
| 5b | What the «older view» is | brief: `wiki/assistenza-clienti/verifica-interventi-eseguiti.md` (visualizza_intervento) is the old Verifica | code: the previous Verifica is `rapporti.php?action=verifica` loading `interventi_verifica*.js`; `pages/interventi.php?action=visualizza_intervento` is a separate consultation page (list plus map) under Interventi, still present on php8 | Do not call visualizza_intervento «la vecchia Verifica». |
| 6 | Label of stato 6 on screen | default `stati` map and Lista tag — «Controllato» / «controllato» | js/code/verifica_unica.js tagStato — the Verifica tag shows «Verificato» for stato 6 | The button and the Verifica tag read «Verificato»; the stato is Controllato (6), and the Lista reads «controllato». Say it once in § 5 (glossary trap 2). |
| 7 | Lista page sizes | wiki: pagina-lista-interventi.md — 10, 15, 20, 25, 40 | code: js/code/flexigrid.js:78 (bundled) — 10, 25, 50, 100, 250, 1000; the 10–40 set is in the unused `flexigrid_bak.js` | Code wins. The brief's «10, 15, 20, 25, 40» is wrong. |
| 8 | Esito «Utente assente» from the legacy app | code: setFromAndroid (InterventoEseguitoBase, InterventoBase), EsitoCatalog — 6 → 99 | code: AndroidController::put_intervento:690 — 6 → 5 NONFATTIBILE, with a TODO | It depends on the path: GOPlanner 3 and setFromAndroid write 99; the legacy `put_intervento` writes 5. In UFFICIO text: «Utente assente → 99» for GOPlanner 3; a DEV box may mention the legacy exception. |
| 9 | Label of 99 | VerificaInterventi, EsitoCatalog, constants — «Utente assente» | js/code/operatori_scheda.js:253 — `99: ['Annullato', 'annullato']` | The constants win (9 = Annullato, 99 = Utente assente). operatori_scheda.js looks wrong. |
| 10 | Can an app resend overwrite an office correction on most commesse? | spec § 2 Limite — yes, except commesse with the backoffice protection | code: (a) once stato ≥ 6 (Verificato), no path overwrites, on any commessa; (b) GOPlanner 3 (EsitoWriter) also refuses stati 4 and 5 (`already_closed`); (c) only the legacy `put_intervento`, with stato < 6 and no `backoffice=1`, overwrites. 4 tenants set `backoffice=1` on every Verifica save; 48 tenant overrides read it | The risk is limited to the legacy app, before «Verificato», on commesse without the backoffice flag. The Writer must not present it as a general danger. |
| 11 | Ripianifica success message | wiki + brief — «È stato creato un nuovo intervento» | code — «E' stato creato un nuovo intervento di {tipo} con ID {N}» | Quote the code text. |
| 12 | Refused-delete message | brief + wiki — «Intervento non cancellato perché già chiuso» | code — «Intervento non cancellato perché già chiuso (intervento eseguito associato).» | Quote the full code text. |
| 13 | Scope of Interventi › Mappa «Elimina» | brief § 3 Limite — deletes the operatore's planned interventi «for that day» | code: json.php `del_interventi` — `WHERE operatore=$id`, no date filter; skips closed ones | Code wins: all the operatore's non-closed interventi, not only that day. Flag for ch.5. [UNVERIFIED: whether the Mappa page filters the operatore list by day before the call — server side has no date] |
| 14 | Where «Cancella precedente» exists | comment in js/code/verifica_unica.js — «presente solo nei tenant con interventi_multipli (sg_smat, sg_italgas)» | code: 48 `custom.js` define it; 9 of the 11 `verifica_unica` tenants declare it | It exists wherever the commessa has interventi multipli and declares the field. The comment is out of date. |
| 15 | «Cambia tipo» as a button | brief; wiki verifica-interventi-iren.md — a «Cambia tipo» button | code: js/code/verifica_unica.js — the foto-type tag is the control (tooltip/aria «Cambia il tipo») | Describe it as: click the foto-type label to change it. Do not invent a button. |
| 16 | Size of the AI test bench | docs: contratto.md § 7.2 — `eseguiSuBanco(..., $limite = 50)`, «50 casi sono 50 chiamate» | code: AnalisiAiBanco::LIMITE_PROVA = 20; impostazioni.md — 2 × 20 calls | The page uses 20. The 50 is only the engine's default parameter. |
| 17 | Rule for several foto of one check | brief § 6 — one bad foto out of several → Da verificare (general) | code: AnalisiAiMotore; contratto.md § 4.4 — true only for «peggiore» checks (tipo di foto, qualità); for value and seal checks the best foto wins | State the rule per type of check. |
| 18 | Schema of `interventi_eseguiti` | docs: 07-database-schema.md — `id` AUTO_INCREMENT, letture 1–5 decimal, `note` varchar(255), `servizi` varchar(500), no `esito` or `backoffice` | code: lib/db/db.sql — `id` = `interventi.id_intervento` (not auto-increment), `lettura1`–`9` varchar, `note` varchar(2000), `servizi` text, with `esito`, `backoffice` and `flag1`–`10` | The doc is out of date; the code wins. |
| 19 | Stati 9 and 10 present in every commessa | migration comment (18/09/2026) — base seeds had only 1–8 | current lib/db/db.sql — seeds 1–10 | New tenants have them. Older tenants have them only if the migration was run by hand. [UNVERIFIED: which tenants lack rows 9/10] |

### Open items (UNVERIFIED)
- [UNVERIFIED: the Lista tag for an intervento in stato 99. The `stati` seed has no row 99, so with the LEFT JOIN the cell is probably empty. Not checked on screen.]
- [UNVERIFIED: whether stato 2 Validato ever appears on an intervento on `php8`. No writer on `interventi` or `interventi_eseguiti` was found; it is written only on utenze.]
- [UNVERIFIED: whether any export other than the legacy readings XML, the «importazione_inviati» file import and the admin repair writes stato 7. Tenant exports grepped show only commented-out lines.]
- [UNVERIFIED: which tenants have the `data_validazione` column. The code cites easy_iren and ciip.]
- [UNVERIFIED: the option «Applica a eseguiti» is a `sino` select sending `Si`/`No`, but the server checks `== 'i'`, so it may never take effect. Not tested at runtime.]
- [UNVERIFIED: on easy_spot and easy_unareti the tenant `custom.js` has no `getCampiAssegnaDialog`, and `ripianifica()` returns silently when it is missing, so «Ripianifica» may do nothing there.]
- [UNVERIFIED: whether an Annullato intervento can be brought back from the back office. The only reactivation found is the call-center `book` (ADR 23).]
- [UNVERIFIED: whether each of the 11 `verifica_unica` folders is already live in production. GOP-777 says Medea users are still on the old platform.]
- [BLOCKED: needs human input — the Ripianifica PHPDoc calls the deletion of the precedente without interventi multipli «non e' una scelta di progetto, in attesa della decisione». The chapter describes the current behaviour; whether it will change is a captain decision (see oracle_questions.md).]
