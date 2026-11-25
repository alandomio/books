# Chapter 14 — Struttura (Architect spec)

**Chapter title (H1 for the Writer):** `# 14. Il modello dei dati`
**PRD row:** «Le tabelle centrali (`utenze`, `interventi`, `interventi_eseguiti`, `operatori`, `carichi`, posizioni), le relazioni, il DB master `goplanner`, campi personalizzati e flexigrid, schema canonico dei tenant, regole di accesso al database» — audience **DEV** (sviluppatori e agenti di codice; the staff tecnico reads § 1 and § 6).
**Core question of the chapter:** where does each piece of data live, what really ties one table to another, and what rules must a developer or an agent follow so that a query, a new column or a migration does not break a commessa?
**Chapter thesis (the rule the whole chapter proves):** in GOPlanner **the database does not defend the relations; the code does.** The canonical schema of a commessa (`migrations/tenant/0000_baseline.sql`, 29 tables) declares **zero `FOREIGN KEY`**: every `id_*` column is a number that only the code keeps aligned. Three consequences organise the chapter: (1) the schema is read in a fixed order — migration files first (what exists), then the `*Base.php` classes (how rows are joined and who writes them), documents last; (2) the relations are protected by a handful of code paths (deletion guards, single writers of copied columns, the ORM), and bypassing them leaves rows that no constraint will catch; (3) the access rules (MainOrm / SimpleOrm, bound values, additive migrations, never from a stack that points at production) are not style: they are the only constraint there is.

### Continuity and glossary check (done by the Architect, 25 novembre 2026)
- `chapter_index.md`: not present. `NARRATIVE_GLOSSARY.md`: not present. Canonical vocabulary = `/home/alan/firstmate/projects/GOPlanner/CONTEXT.md`. Final text exists for chapters 1–11 (`chapter_N.md`); ch.12 exists as struttura; ch.13, 15, 16 do not exist yet. **Before writing, the Writer re-checks whether `chapter_12.md`, `chapter_13.md`, `chapter_15.md`, `chapter_16.md` exist** and aligns pointers with their final titles (PRD § 4 titles: cap. 13 *Architettura di GOPlanner su PHP 8*, cap. 15 *Integrazioni e API*, cap. 16 *Operazioni, qualità e rilasci*).
- **Promises made by earlier chapters that ch.14 must keep** (the Writer covers each; the Reviewer checks each):
  1. ch.1 (`chapter_1.md` line 72, DEV box): word ↔ table map (utenza = `utenti`, not `utenze`; gestionale utenti = `users` in DB `goplanner`; lista = `carichi`; pratica = `utenti` + its row in `carichi_righe`; intervento = `interventi`; esecuzione = `interventi_eseguiti`) and «Il capitolo 14 approfondisce il modello dei dati» → § 1 and § 2. Reuse the same mapping, same words; do not contradict.
  2. ch.2 (`chapter_2.md` lines 62 and 68): MainOrm / SimpleOrm rule, `config.inc.php` composing `'goplanner_' . $_SESSION['user']['db']`, `GOPlanner::$account`, five fields of `clienti`; «Per lo staff tecnico c'è un controllo, `make schema_check`, e il percorso è nei capitoli 14 e 16»; ch.2 already quoted «40 database di commessa erano esclusi» (GOP-697, GOP-702). → § 1 (one sentence + «vedi il capitolo 2» for the session mechanics, **do not re-explain them**) and § 6 (**owns** the `schema_check` path; the release gate is ch.16). Do not repeat ch.2's numbers 67/26/1; if a number is needed, the 40 excluded with its date, quoted once.
  3. ch.3 (lines 35, 137, 264): `utenze` exists in the tenant DB with an old layout, read only by old paths; `carichi.lotto` −128…127, names in master `lotti`; `AvanzamentoCarichi` reads `interventi_eseguiti.stato_id`; campi dell'intervento in `servizi`, «Campi Extra», `extra_<nome>` columns of `carichi_righe`, `campi_nuovi`, 30 per commessa / 400 columns, `flexifields.php`; «Schema completo nel capitolo 14», «Rimando al capitolo 14» three times → § 2, § 3, § 5. Ch.3 owns the **office rule** of the stato dell'utenza (section «Lo stato di un'utenza: una copia dell'ultimo intervento toccato»): ch.14 gives only the writer (`updateStatoUtenza()`) and the query consequence, one paragraph + «vedi il capitolo 3».
  4. ch.4 (struttura): tables `carichi`, `carichi_righe`, `utenze` named only in DEV boxes, ch.14 owns them → § 2.
  5. ch.6 (lines 43, 79, 117): `stati` table and constants; `interventi_eseguiti.id = interventi.id_intervento`, no `id_intervento` column; `getInterventoEseguito()` never null → `!$ie->isNew()`; flag `backoffice`; the **orphan-esecuzioni case** (already told — do not retell: one sentence «il caso del capitolo 6»). **Flag:** ch.6 says «le tabelle sono MyISAM, senza chiavi esterne» (from `docs/02-patterns/21-guard-cancellazione-intervento-eseguito.md`); v0 declares all 29 tenant tables `ENGINE=InnoDB` and no foreign key. See [CONFLICT] 2: ch.14 states the precise version; the Reviewer notes ch.6's wording.
  6. ch.7 (struttura): `esportazioni_registro`, `esportazioni_link`, `mappature_export` are ch.14 tables (names in the § 1 map only); «Esporta in Excel» of a grid → § 5 Limite, one sentence + «vedi il capitolo 7».
  7. ch.8 (line 155): «posizione dell'esito in `servizi` sotto `_posizione`. Vedi i capitoli 14 e 15»; `foto` with tipo 99 / 98 for signatures; `mobile_v3_dispositivi` → § 4. **Do not retell GOP-621** (130 esiti at 0,0 — ch.8's story): name the ticket as the origin of `_posizione`, nothing more.
  8. ch.9 (line 48): magazzino tables, migration `0032_magazzino_base.sql`, «Schema nel capitolo 14» → § 1 map, one row; no magazzino walkthrough.
  9. ch.11 (lines 29, 142, 178, 219): `identita`, `identita_users`, `users`, `ruoli*`, `lotti` in master; «Mai inserire direttamente in `goplanner.users`» → § 1 map + § 6 access rules (cite ch.11, do not re-explain identity).
  10. ch.12 (struttura): `stato_commesse_giorno`, ticket tables (`mobile_v3_segnalazioni` + 0027), `annunci_letti` → § 1 map only.
- **Closings already used (the ch.14 ending must not echo them):** ch.1 «prima la parola del glossario, poi il passo del ciclo, poi la pagina…»; ch.2 «La persona sta nel master; il lavoro sta nella commessa.» (**the closest risk: § 1 must not restate this as its Sintesi**); ch.3 «un campo personalizzato appartiene a un oggetto preciso…»; ch.6 «servono due risposte: in che stato si trova, e se il suo esito è già stato verificato…»; ch.11 «il primo livello che lo nasconde, l'accesso più piccolo»; ch.12 (planned) «evidence travels with the problem; tools show numbers before writing». Ch.14 ends on the reading order and on who keeps a relation (see TARGET).
- **Glossary traps specific to this chapter (Writer and Editor check all ten):**
  1. **The `utenti` triangle.** The table `utenti` holds **utenze** (`UtenzaBase::$table = 'utenti'`); the persons of the gestionale (glossary **utente**) are rows of `users` in the master DB; the persons with the phone are `operatori`. The Italian word «utenti» in prose always means persons; the table is always in monospace and introduced once as «la tabella `utenti`, che contiene le utenze». Never «utenti» unformatted for utenze.
  2. **`utenze` is a real table and the wrong one.** It exists in v0 (67 columns, legacy layout, no `id_utenza` column). Same treatment as ch.3: exists, old layout, old paths only.
  3. **Two `users` tables.** v0 contains a tenant `users` table (5 columns: `id`, `login`, `password`, `admin`, `tipo`); the users of the gestionale are `goplanner.users`. Researcher confirms who, if anyone, reads the tenant one ([CONFLICT] 6). **Never print or describe password storage beyond the column name.**
  4. **`clienti` = commesse.** The master table `clienti` has one row per commessa; `carichi.cliente` is the **name of the lista**; the UI grid «Clienti» shows utenze. Explain once in a table; in prose «commessa», «nome della lista», «utenza».
  5. **«Tenant»** is allowed (DEV chapter) only when naming code or paths (`custom/<tenant>`, `migrations/tenant/`), with the first-use gloss «la commessa, che nel codice si chiama tenant».
  6. **«Carico» / «lista».** Glossary: lista (avoid «carico»). The table is `carichi`; prose says «lista». Same for **«percorso»** (avoid for giro): `percorsi`, `percorsi_gp` appear only as table names.
  7. **Campo personalizzato.** Glossary word for the concept; «campo custom», «flexifield», «colonna» are «da evitare» as synonyms. In this chapter «colonna» is allowed **only for a real database column**; code names (`getCampiCustom()`, `flexifields.php`, `campi_extra`) stay in monospace. The four mechanisms of § 5 are called by the names of § 5's table, never «campi custom» in prose.
  8. **Esito vs stato.** `interventi_eseguiti` has both `stato_id` (stato) and `esito` (esito, verify values). Keep the two words apart in every sentence; «esecuzione» = one row of `interventi_eseguiti` (ch.6 term).
  9. **Attività / log.** Tables `log`, `log_pc`, events `rbac_deny`: code names only; in prose «registro» or «attività».
  10. **AI.** Columns and tables with AI (`ai_status`, `analisi_ai*`, cost columns) are named only, as «AI»; no vendor or model name, no cost values.
- **Security (blocking, chapter-specific):** this chapter sits next to the most sensitive files of the repository. Never in text: hosts, ports, IPs (`docs/01-foundations/03-database-facts.md` contains a legacy IP and a local DB user — **do not copy**), `DBHOST`/`DBUSER`/`DBPASS` values, cluster names, the content of `config*.inc.php` connection lines, any credentials JSON in the repository root; no row values from any table (no names, addresses, phone numbers, emails, codici utenza, SIM numbers, matricole, PDR); example queries select `id`, `stato_id`, dates and counts only, and any example value is invented and declared; no committente or tenant names (the v0 «famiglia dominante» is described in words, not by its tenant code; no per-tenant closure counts from ADR 45); `users.password` is named as a column, never discussed as a format; no cost figures.

### Chapter boundaries (one-line pointers only, per PRD § 4 «Confini tra capitoli»)
| Topic touched here | Owned by | What ch.14 may say |
|---|---|---|
| Session mechanics (`config.inc.php`, `SimpleOrm::useConnection()`, `GOPlanner::$account`, the five fields of `clienti`, override order) | ch.2 | One sentence + «vedi il capitolo 2» |
| Meaning of stati for the office; stato dell'utenza as office rule; lotto/distretto as work division | ch.3, ch.6 | Constants table + writer + query rule; pointers |
| Mappatura as configuration | ch.4, ch.7 | Only that import columns are generated from it |
| `mappature.php`, `json.php`, `getconfig.php` request flow, job queue, workers | ch.13 | Name the file where a grid or column is resolved; flow → ch.13 |
| GPS, foto, firma as app data; `Idempotency-Key` | ch.8 | Tables and columns only |
| Identity, profili, ambito as rules | ch.11 | Table names in the § 1 map |
| Admin pages reading `stato_commesse_giorno`, tickets, annunci | ch.12 | Table names in the § 1 map |
| API envelope, mobile sync, v2, Gea's data access | ch.15 | One sentence: Gea has no database credentials (ch.10 box) |
| Release gate (`migrate --all` preview at release), deploy, CloudWatch, PHP 8.4 | ch.16 | One sentence + «vedi il capitolo 16» |
| Orphan-esecuzioni story; GOP-621 story | ch.6, ch.8 | One clause each, no retelling |

---

## NUFs (Goal Scoring)

Ten NUFs, so the Editor can score one point each against the 8.5/10 gate. Format per INSTRUCTION.md § Architect.

```
utility(reader): Reader can place any table in the right database and pick the right ORM: master `goplanner` (`clienti`, `users`, `identita`, `identita_users`, `lotti`, `ruoli*`, `mobile_v3_*`, `stato_commesse_giorno`, `annunci_letti`, the Novità and operazioni registers) with `MainOrm`; `goplanner_{clienti.db}` (`utenti`, `carichi`, `carichi_righe`, `interventi`, `interventi_eseguiti`, `foto`, `posizione`, `operatori`, `stati`, `impostazioni`, `flexigrid`, `esportazioni_registro`, `importazioni`, `mappature_*`, `magazzino*`, `campi_nuovi`, `schema_migrations`) with `SimpleOrm` — and names the two traps: `utenze` and a tenant `users` both exist and are not what their names suggest → score += 1

utility(reader): Reader can draw the core relations with the real join keys: `carichi` 1–N `carichi_righe` N–1 `utenti` (UNIQUE `id_carico` + `id_utenza`); `interventi` with `id_carico` and `id_utenza` NOT NULL, `operatore`, `stato_id` → `stati`; `interventi_eseguiti.id = interventi.id_intervento` (no `id_intervento` column); `foto.id_intervento` and `foto.id_utenza`; `interventi_servizi` N–N → score += 1

utility(reader): Reader knows which column answers which question and writes the query accordingly: closure stati from `interventi_eseguiti.stato_id` (Inviato 7 is written only there); `utenti.stato_id` is a copy written only by `InterventoBase::updateStatoUtenza()` and is not the real state when `interventi_multipli` is active; `getInterventoEseguito()` never returns null, so the check is `!$ie->isNew()` → score += 1

utility(reader): Reader knows that v0 declares zero foreign keys and can name the code paths that hold the relations (deletion guard in `Intervento::delete()` and `elimina_interventi_non_chiusi()`, single writer of `utenti.stato_id`, `AvanzamentoCarichi` as single source of list numbers), and therefore never deletes or rewrites rows of `interventi`, `interventi_eseguiti` or `carichi_righe` with raw SQL → score += 1

utility(reader): Reader can tell the places where a coordinate lives and which to read: `posizione` (the operatore's trail: `ora`, `oratelefono`, `latitudine`, `longitudine`, `precisione`, `providergps`, `batteria`; UNIQUE on `oratelefono` + coordinates), `interventi_eseguiti.lat`/`lng`/`precisione` plus `servizi._posizione` (where the esito was closed, its age or the reason it is missing), `utenti.lat`/`lng`/`precisione` (the geocoded utenza), `interventi.lat`/`lng` and `operatori.lat`/`lng` (meanings as confirmed by the dossier) → score += 1

utility(reader): Reader can choose the right home for a field that only one commessa needs, among the four mechanisms — import column of `carichi_righe`/`utenti` generated from the mappatura (outside the canon, never declared), campo nuovo `extra_<nome>` registered in `campi_nuovi` (GOP-770), campo dell'intervento from `getCampiCustom()` with values in `interventi_eseguiti.servizi` (a `text` column holding JSON; `JSON_EXTRACT`; reserved key `_posizione`), Campo Extra as a read-only SQL expression (`generaSQLExtra()`) — and never writes into `campi_extra` → score += 1

utility(reader): Reader can add or change a grid column without breaking the grid: `custom/<tenant>/php/flexifields.php` (`colmodel`, `searchitems`, `buttons`) loaded by `FlexifieldsTenant::carica()` (shared defaults → `custom/<tipo>` → `custom/<tenant>`); per-user layout in the table `flexigrid` (only a saved `visible=0` has effect; `hide` is a floor); one resolver `FlexigridLayout::colonne()`; a new grid action registered in `GridRequest::endpointDefinitions()` or the page gets HTTP 400 «Invalid grid parameters»; unique SQL labels; `tests/FlexigridColonneTenant_Test.php` → score += 1

utility(reader): Reader can add a column the right way: canonical schema = v0 + core migrations + declared modules (+ the commessa's own migrations); the migration ships in the same MR as the code; one change per file, rerunnable, additive only, explicit charset/collation/engine, no `USE` and no `goplanner*.` names, no down; the checksum in `schema_migrations` forbids editing an applied file; `php scripts/migrate.php --tenant=…` is a preview by default; `make test_migrate` and `SchemaCanonico::installa()` test on a throwaway MySQL; the master DB has no runner → score += 1

utility(emotional): Reader (developer or agent) knows where to stop: never `--apply`, never a master migration, never DDL from dev, local stacks or `goplanner-test-*` (they point at the same database cluster as production); never «repairs» drift with DROP/MODIFY; never removes a `// TEMP schema-drift GOP-700` guard alone; brings the preview and the `schema_check` output to the staff tecnico, who decides when and where a migration is applied → score += 1

utility(factual): The chapter states, each with its source: 29 tables in v0, all `ENGINE=InnoDB`, zero `FOREIGN KEY`, from a production snapshot of 30 settembre 2026, tables present in ≥ 90% of active commesse (`migrations/tenant/0000_baseline.sql` header, GOP-339); stato constants 1–10 and 99 (`lib/InterventoBase.php`, `lib/InterventoEseguitoBase.php`); expand-only because `master` (PHP 7.3) and `php8` share the same databases (`docs/02-patterns/45-schema-canonico-tenant.md`, GOP-696); `SimpleOrm::insert()`/`update()` drop unknown fields, now logged as a warning, once per field per process, max 50 per process, never values (GOP-700); `schema_migrations.id` max 100 characters; the truncated-key case of `impostazioni.chiave` (GOP-546, migration 0026, `ImpostazioniGenerale::chiaveEntra()`); `lotti` in master to avoid a cross-database join (GOP-227); `PosizioneChiusura::CHIAVE = '_posizione'` (GOP-621); grid limits of `FlexigridLayout` (GOP-691) → score += 1
```

---
## BEAT LIST

Six sections (`##` in the final chapter). Each needs: the italic audience line at the top (STYLE_BIBLE § Voice rule 6), at least one exact concrete detail (table, column, file, constant, number), at least one **Limite** paragraph, max 5 prose paragraphs in a row without a table/list/box/code block/subheading, 600–1.200 words. Audience tags per INSTRUCTION.md: [UFFICIO], [STAFF], [DEV], [TUTTI]. Code blocks: short, real, `sql` or `php` declared, no secrets, no row values; schema excerpts copied from `0000_baseline.sql` and trimmed to the columns discussed (say «estratto»).

Before § 1 the Writer puts the mandatory `*In questo capitolo…*` paragraph (2–3 sentences): where each table lives, what ties the tables together when the database itself does not, and the rules for reading, querying and changing the schema; for developers and coding agents, with § 1 and § 6 useful to the staff tecnico. Mention once that whoever reads for the office can stop here: chapters 3 and 6 tell the same objects from the office side.

---

### § 1 — `## Dove si legge lo schema e dove sta ogni tabella`
**Tag:** [DEV] + [STAFF] (italic line: *Per gli sviluppatori, gli agenti di codice e lo staff tecnico.*)
**Core question:** Where is the true schema written, and in which of the two databases does each table live?
**Word target:** 950 (range 850–1.050)
**Paragraph functions:** Aggancio (the failing query, see TARGET) → Spiegazione (the reading order: migrations → `*Base.php` → documents) → Dimostrazione (map table of the two databases) → contro-obiezione → Limite → Sintesi.

**Content plan**
- **Opening case (real, from the repository, no invention needed):** `docs/00-concept-index.md` presents itself as the «Zero Cognitive Load Reference» for agents and gives a query «Get Interventions for Operator» with `JOIN utenze u ON i.id_utenza = u.id_utenza`, and an «Update GPS Position» query `INSERT INTO posizione (operatore, lat, lng, quando, precisione)`. Against v0, `utenze` has no column `id_utenza` (its key is `id`) and `posizione` has no `lat`, `lng` or `quando` (it has `latitudine`, `longitudine`, `ora`, `oratelefono`). The first query fails with an unknown-column error; the second fails too; and even when fixed the first reads the wrong table. The Researcher confirms both against `0000_baseline.sql` (static read; **no query is run**). Tone: calm statement of fact, no mockery; the documents predate v0 (proportionality guard).
- **The reading order (the section's rule):** (1) `migrations/tenant/0000_baseline.sql` + `migrations/tenant/NNNN_*.sql` (+ `modules/`, `custom/<tenant>/`) say **what exists** in a commessa's database; `migrations/main/*.sql` + `docker/db/sql/02-goplanner.sql` (verify which is authoritative, [CONFLICT] 7) for the master; (2) the model classes say the table name and the constants (`UtenzaBase::$table = 'utenti'`, `CaricoBase`, `CaricoRigaBase`, `InterventoBase`, `InterventoEseguitoBase`, `Posizione::$table = 'posizione'`); (3) documents last: `docs/01-foundations/07-database-schema.md` and the query examples of `docs/00-concept-index.md` were written before v0 and disagree with it on table names, columns and types ([CONFLICT] 1, 3, 4).
- **Map table — «Dove sta ogni tabella»** (Tabella | Database | Che cosa contiene | Capitolo). Rows (Researcher confirms each table's database):
  - `clienti` | master | one row per commessa (`db`, `nome`, `apikey`, `tipo`, `attivo`) | ch.2
  - `users`, `identita`, `identita_users`, `ruoli`, `ruoli_permessi`, `identita_users_lotti` | master | persons, accesses, profili | ch.11
  - `lotti` | master | name of each lotto (`id_cliente`, `valore`, `nome`, `attivo`) | ch.3
  - `mobile_v3_dispositivi` and the other `mobile_v3_*` | master | GOPlanner 3 phones, segnalazioni and tickets, comandi | ch.8, ch.12
  - `stato_commesse_giorno`, `annunci_letti`, Novità tables, `operazioni_registro` | master | Admin and campanella data | ch.12, ch.15
  - `utenti` | commessa | the utenze | ch.3
  - `carichi`, `carichi_righe` | commessa | liste and pratiche | ch.3, ch.4
  - `interventi`, `interventi_eseguiti`, `foto`, `stati`, `interventi_servizi` | commessa | the work and its esecuzioni | ch.6
  - `operatori`, `posizione` | commessa | the operatori and their trail | ch.8, § 4
  - `impostazioni`, `flexigrid` | commessa | settings, per-user grid layouts | § 5
  - `importazioni`, `mappature_import`, `esportazioni_registro`, `esportazioni_link`, `mappature_export` | commessa | registers and saved models | ch.4, ch.7
  - `magazzino`, `magazzino_movimenti`, `magazzino_anomalie`, `ddt` | commessa | magazzino | ch.9
  - `campi_nuovi`, `schema_migrations` | commessa | registry of new fields; applied migrations | § 5, § 6
- **The access rule in one sentence** (already in ch.2: do not re-explain): master always with `MainOrm`, commessa always with `SimpleOrm`; the connection is chosen at session start — «vedi il capitolo 2». Why `lotti` sits in master (GOP-227): `identita_users.lotti` lives there and a per-commessa table would need a join across databases. This is the section's one surgical example of *why* a table sits where it sits.
- **`> **Attenzione:**` box — three names that mislead:** `utenze` (exists in v0, 67 columns, old layout, read only by old paths — ch.3); a `users` table also exists in the commessa's database (5 columns, legacy) and is not the users of the gestionale; `clienti` (master) are commesse, while `carichi.cliente` is the name of a lista and the UI grid «Clienti» shows utenze.
- **Contro-obiezione 1:** «Il documento dello schema dice `utenze`, e la tabella c'è: perché non usarla?» → Because the utenza of the code is `utenti` (`UtenzaBase::$table`); `utenze` keeps an old layout and is read only by old paths (ch.3 gives the example of the Importazione classica counts). A query on `utenze` runs and returns another dataset.

**Limite (mandatory):** the repository does not see production: v0 is a snapshot (30 settembre 2026) of the most common layout, and an excluded commessa may differ (§ 6); the master DB has no single schema file kept by a runner — its tables come from `migrations/main/` applied by hand plus older scripts in `lib/db/` ([CONFLICT] 7); the map lists the tables the book uses, not every table (legacy tables such as `checkpoint`, `rpc`, `log_pc`, `percorsi_gp` are named only if the dossier says what they are).

**Sintesi (must not echo ch.2's «La persona sta nel master; il lavoro sta nella commessa»):** «Lo schema vero è quello che le migrazioni creano; il nome vero di una tabella è quello scritto in `$table`.»

**Key facts the Researcher must find**
- Verify statically that the two queries of `docs/00-concept-index.md` (§ «Query Patterns by Use Case») name columns absent from v0; quote the exact lines; record also the third query (`INSERT INTO interventi_eseguiti …`) and whether its columns exist.
- `$table` of each model class: `lib/UtenzaBase.php`, `lib/CaricoBase.php`, `lib/CaricoRigaBase.php`, `lib/InterventoBase.php`, `lib/InterventoEseguitoBase.php`, `lib/Posizione.php`, `lib/Operatore*.php`, `lib/Foto*.php`; which extend `SimpleOrm` and which `MainOrm` (`grep -n "extends MainOrm" lib/*.php`).
- For each table in the map, its database: `migrations/main/*.sql` (master) vs `migrations/tenant/*.sql` (commessa); `lib/db/2026-09-02-gop227-lotti.sql` for `lotti`; `docs/02-patterns/25-identita-centralizzata-e-rbac.md` for identity tables.
- Who reads the tenant `users` and `utenze` tables: `git grep -n "FROM utenze\|JOIN utenze" -- lib pages custom | head`, `git grep -n "\busers\b" -- lib/*.php` filtered for SimpleOrm classes.
- GOP-227 wording on «join cross-database» (`docs/02-patterns/35-lotti-entita-e-etichette-legacy.md`).

---

### § 2 — `## Le tabelle del lavoro: dalla lista all'esecuzione`
**Tag:** [DEV] (italic line: *Per gli sviluppatori e gli agenti di codice.*)
**Core question:** Which tables carry the life of a commessa's work, with which keys, and which column answers which question?
**Word target:** 1.050 (range 950–1.150)
**Paragraph functions:** Aggancio (one sentence: the cycle of ch.1 seen as rows) → Spiegazione (the chain lista → pratica → utenza → intervento → esecuzione → foto) → Dimostrazione (relations table + short schema excerpt) → Spiegazione (stati) → contro-obiezione → Limite → Sintesi.

**Content plan**
- The chain in prose, one sentence per link, glossary word first and table second: a lista is one row of `carichi` (name in `cliente`, file in `nomefile`, `lotto`, `distretto`, `tipo_carico`, `scadenza`, `stato` aperto/chiuso); a pratica is one row of `carichi_righe` (`id_carico`, `id_utenza`, UNIQUE on the pair — an utenza appears once per lista, and can be in many liste); the utenza is one row of `utenti`; an intervento is one row of `interventi` with `id_carico` **and** `id_utenza` both NOT NULL, `operatore`, `data_pianificata`, `stato_id`, `fascia`, `ordine`; the esecuzione is one row of `interventi_eseguiti`, **with the same id as its intervento**; the foto are rows of `foto` with `id_intervento` and `id_utenza` (`tipo` 99 firma del cliente, 98 domiciliazione — ch.8).
- **Relations table — «Chi punta a chi»** (Colonna | Punta a | Chi la tiene allineata): `carichi_righe.id_carico` → `carichi.id`; `carichi_righe.id_utenza` → `utenti.id`; `interventi.id_carico` → `carichi.id`; `interventi.id_utenza` → `utenti.id`; `interventi.operatore` → `operatori.id`; `interventi.stato_id` → `stati.id`; `interventi_eseguiti.id` = `interventi.id_intervento`; `interventi_eseguiti.id_utenza`, `.id_carico`, `.operatore`, `.stato_id`; `foto.id_intervento` → `interventi.id_intervento`; `foto.id_utenza` → `utenti.id`; `interventi_servizi` (`id_intervento`, `id_servizio`) → `servizi`. Third column: «il codice» everywhere (bridge to § 3). Researcher verifies `foto.operatore` (`varchar(15)` in v0, not an `operatori.id`?) — if confirmed, one line: not every column named `operatore` holds the same thing.
- **Schema excerpt** (`sql`, trimmed, declared «estratto da `0000_baseline.sql`»): `carichi_righe` complete (3 columns + its UNIQUE key) — short enough to show the whole thing and why the import columns are not in v0 (§ 5).
- **Stati** (table: Codice | Costante | Dove si legge): 1 IMPORTATO, 2 VALIDATO, 3 ASSEGNATO, 4 ESEGUITO, 5 NON_FATTIBILE, 6 CONTROLLATO, 7 INVIATO, 8 RIPIANIFICABILE, 9 ANNULLATO, 10 PRENOTATO (`InterventoBase`); 99 `STATO_UTENTEASSENTE` (only `InterventoEseguitoBase`; ch.6 box). Rule: closure stati (6, 7) are read from `interventi_eseguiti.stato_id`; 7 is written only there by the exporters; `interventi.stato_id` stays at 4 or 6 (ch.3/ch.6 boxes — consistent wording). Labels are the office's business (ch.3, ch.6); `stati` table names may differ by commessa (Researcher: `stati.nome`, `char(15)`).
- `utenti.stato_id`: a copy, written only by `InterventoBase::updateStatoUtenza()`, called from ~50 places in `lib/ADMINController.php`; with `interventi_multipli` an utenza with two open interventi shows the state of the last one touched. One paragraph + «vedi il capitolo 3». The rule for a new report: compute the real state from `interventi` / `interventi_eseguiti` (`UtenzaBase::getUltimoInterventoChiuso()`), not from `utenti.stato_id`.
- `> **Attenzione:**` the **id of the esecuzione is the id of the intervento**: `interventi_eseguiti` has no `id_intervento` column; a join written on `ie.id_intervento` fails. `InterventoBase::getInterventoEseguito()` returns a new unsaved object when there is no row: test `!$ie->isNew()`, never `null`.
- **Contro-obiezione 2:** «Per sapere se un intervento è chiuso guardo `interventi.stato_id`, no?» → Not for 6 and 7: read `interventi_eseguiti.stato_id`; `AvanzamentoCarichi` (GOP-640) is the single source of the list numbers and reads the esecuzione. Pointer ch.3.

**Limite (mandatory):** v0 lists only the columns common to ≥ 90% of commesse — `carichi_righe` and `utenti` carry many more columns per commessa (import columns, § 5); `interventi_eseguiti` has 52 columns in v0 (`lettura1`…`lettura9`, `flag1`…`flag10`, the `_m` columns, `backoffice`, `esportato`, `modificato`) whose meaning varies by commessa: the chapter names only those whose meaning the dossier confirms; the labels of the stati can be redefined per commessa (`VerificaInterventi::configPredefinita()`, ch.6).

**Sintesi:** «Una lista, le sue pratiche, l'utenza, l'intervento e la sua esecuzione sono cinque tabelle legate da numeri; l'esecuzione porta lo stesso numero dell'intervento.»

**DEV box:** not needed (the section is DEV); instead one `> **Per lo staff tecnico:**` box (max 3 lines): which column to quote in a ticket — `id_intervento` (= id dell'esecuzione), `utenti.codice` for the utenza (never names), `carichi.id` for the lista.

**Key facts the Researcher must find**
- v0 definitions of `carichi`, `carichi_righe`, `utenti`, `interventi`, `interventi_eseguiti`, `foto`, `stati`, `interventi_servizi`, `servizi` (column names, types, keys) — `migrations/tenant/0000_baseline.sql`; later migrations touching them (`0003`, `0004`, `0005`, `0006`, `0015`, `0016`, `0017`, `0019`, `0022`).
- Meaning of `interventi_eseguiti.esito` (values; `docs/01-foundations/03-database-facts.md` says `esito = 1` success; is `esito` in v0? — the Architect's static check says yes; GOP-645 says it was missing in 13 schemas).
- What `foto.operatore` contains (`lib/Foto*.php`, writers in `lib/MobileV3/`).
- `InterventoBase::getInterventoEseguito()`, `updateStatoUtenza()` (line), count of call sites (`git grep -c "updateStatoUtenza" -- lib/ADMINController.php`), `UtenzaBase::getUltimoInterventoChiuso()`.
- `docs/02-patterns/43-avanzamento-carichi-fonte-stati.md`, `docs/02-patterns/34-stato-utenza-derivato-ultimo-intervento.md`.

---

### § 3 — `## Relazioni senza chiavi esterne: che cosa tiene insieme i dati`
**Tag:** [DEV] (italic line: *Per gli sviluppatori e gli agenti di codice; lo staff tecnico può leggere la tabella dei percorsi protetti.*)
**Core question:** If no constraint in the database ties `interventi_eseguiti` to `interventi`, what does — and what happens when a change bypasses it?
**Word target:** 950 (range 850–1.050)
**Paragraph functions:** Aggancio (the number: zero `FOREIGN KEY` in 29 tables) → Spiegazione (what that means: MySQL accepts any number in `id_*`, deletes do not cascade, nothing refuses an orphan) → Dimostrazione (table of the protected paths) → Dimostrazione (one real case, not told before) → contro-obiezione → Limite → Sintesi.

**Content plan**
- The fact, verified: v0 declares 29 tables, all `ENGINE=InnoDB`, and no `FOREIGN KEY`; none of the core migrations adds one (Researcher: `grep -c "FOREIGN KEY" migrations/tenant/*.sql migrations/tenant/*/*/*.sql`). InnoDB would allow foreign keys; the schema does not declare them. State it without guessing a reason; if the dossier finds a stated reason, use it; otherwise say the sources do not give one.
- **Engine conflict** ([CONFLICT] 2), in one short paragraph: older documents and ch.6 speak of MyISAM; v0 (snapshot of 30 settembre 2026) is InnoDB for the commessa tables; in the master, code comments say `users` «può essere MyISAM», so `AccessoCommessa` and `InvitoUtente` write `users.tipo` after the commit, outside the transaction. Rule: a transaction on the master does not protect `users`; the code that writes it does so after the commit (`lib/AccessoCommessa.php` ~line 186). This is the section's surgical example (not told by ch.6 or ch.11 — Researcher confirms ch.11 does not tell it).
- **Table — «I percorsi che tengono le relazioni»** (Relazione | Che cosa la protegge | Che cosa la aggira):
  - esecuzione ↔ intervento | `Intervento::delete()` refuses an intervento with an esecuzione; `elimina_interventi_non_chiusi()` in `lib/json_functions.php` skips them and returns how many it blocked (`del_intervento`, `del_interventi`; ch.6) | a raw `DELETE FROM interventi` (GOP pattern 21: «rischio residuo»)
  - `utenti.stato_id` | single writer `updateStatoUtenza()` | any other `UPDATE utenti SET stato_id`
  - list numbers | `AvanzamentoCarichi` (GOP-640) | a report that recounts on `interventi.stato_id`
  - lotto name | `LottoService::opzioniSelect()` (DB first, then `$custom['lotti']`, then raw values) | reading `$custom['lotti']` directly
  - fields of a table | `SimpleOrm::insert()`/`update()` drop fields the table lacks (now logged, § 6) | raw `INSERT` with a missing column (fails) 
  Researcher confirms each row and adds or removes rows per the dossier.
- One clause referring to ch.6's case («il caso del capitolo 6: esecuzioni orfane cadute fuori dalle esportazioni») — **do not retell**.
- **Contro-obiezione 3:** «Devo pulire degli interventi di prova: una `DELETE` con un `WHERE` preciso non basta?» → It removes the intervento and leaves its esecuzione, its foto and its pratica pointing at nothing; exports built with `LEFT JOIN interventi` drop the esecuzione. Use the ORM path (`Intervento::delete()` / the JSON actions) that refuses rows with an esecuzione; data cleaning on a production commessa is the staff tecnico's decision.
- **Contro-obiezione 4 (optional, if words allow):** «Perché non aggiungere le chiavi esterne con una migrazione?» → Only what the sources say: migrations are additive and must run on every conforming commessa; a foreign key fails on a table that already holds orphan rows, and the ADR on the canonical schema does not plan it. If the dossier has no source on foreign keys, **drop this objection** (no invented rationale).

**Limite (mandatory):** the guards cover the paths that go through `Intervento::delete()` and `json_functions.php`; raw SQL that deletes `interventi` remains a residual risk wherever it has not been migrated (`docs/02-patterns/21-guard-cancellazione-intervento-eseguito.md`); commesse with their own `php/Intervento.php` repeat the check in their override (ch.6); the engine of an excluded commessa's tables is not known from the repository.

**Sintesi:** «Nessun vincolo del database rifiuta una riga orfana: la rifiuta il codice, se la modifica passa da lì.»

**Key facts the Researcher must find**
- Count of `FOREIGN KEY` in all tenant migrations (expected 0) and in `migrations/main/` (identity/ticket tables may have some — record exactly; the claim «zero» is only for the commessa's canonical schema).
- `ENGINE=` per table in v0 (expected all InnoDB) and the MyISAM mentions: `docs/02-patterns/21-…`, `docs/02-patterns/32-creazione-utenti-percorsi-e-metodo-canonico.md` line ~174, `lib/InvitoUtente.php` ~671, `lib/AccessoCommessa.php` ~106/186, `lib/db/db.sql` engine of `users`.
- `lib/InterventoBase.php` / `lib/Intervento.php::delete()`, `lib/json_functions.php::elimina_interventi_non_chiusi()` (return value), GOP ticket of the guard (Jira text ~ «elimina_interventi_non_chiusi»).
- `lib/LottoService.php::opzioniSelect()` precedence (GOP-227).
- Whether any ADR or ticket discusses foreign keys: `git grep -n -i "foreign key\|chiave esterna\|chiavi esterne" -- docs migrations lib`.

---
### § 4 — `## Operatori, telefoni e posizioni`
**Tag:** [DEV] (italic line: *Per gli sviluppatori e gli agenti di codice.*)
**Core question:** Where are the operatori and their phones recorded, and which of the many `lat`/`lng` columns answers «dov'era l'operatore» versus «dove si trova l'utenza»?
**Word target:** 850 (range 750–950)
**Paragraph functions:** Aggancio (five tables carry a latitude; a report that picks the wrong one draws the right map of the wrong thing) → Spiegazione (`operatori` and the phones) → Dimostrazione (coordinates table) → Spiegazione (`posizione` and `_posizione`) → contro-obiezione → Limite → Sintesi.

**Content plan**
- `operatori` (commessa DB): `id`, `sim_id` (indexed), `id_user`, `attivo`, `nascosto`, `stato`, `tag_id`, `correzione_gps` (default 2), `lat`/`lng` (Researcher: starting address, migration `0020_operatori_indirizzo_partenza.sql`?). Personal columns exist (`nome`, `cognome`, `telefono`, `email`, `domicilio`): name them as personal data, never show values (guard). GOPlanner 3 phones live in the **master** (`mobile_v3_dispositivi`, migration `main/0001`, with `permessi` from `main/0019`); Researcher confirms how a phone is tied to an operatore of a commessa and whether a master `operatori`/`operatori_db` table maps SIM → commessa (`docs/03-cookbooks/20-test-mobile-headless.md`: «unicità globale, doppia tabella master/tenant») — [CONFLICT] 8.
- **Coordinates table — «Quale posizione»** (Dove | Colonne | Che cosa dice | Chi la scrive):
  - `posizione` | `ora`, `oratelefono`, `latitudine`, `longitudine`, `precisione`, `providergps` (`fused`/`network`), `batteria`, `operatore` | the operatore's trail, point by point | the app (ch.8), `Posizione` class
  - `interventi_eseguiti` | `lat`, `lng`, `precisione`, `distanza` + `servizi._posizione` | where the esito was closed, how old the fix was, or why it is missing | `EsitoWriter` / `PosizioneChiusura` (GOP-621)
  - `utenti` | `lat`, `lng`, `precisione` | where the utenza is (geocoded) | geocodifica (Researcher: ADR 48 «precisione utenti geocodifica anomalie», ADR 51, migration `0043_geocodifica_ai.sql`)
  - `interventi` | `lat`, `lng`, `precisione`, `distanza` | Researcher confirms meaning and writer
  - `operatori` | `lat`, `lng` | Researcher confirms (starting address?)
  - `interventi_eseguiti` `lat_m`, `lng_m`, `data_m`, `sim_m`, `precisione_m` | Researcher confirms («_m» = manual? modified?) or omit
  Rows whose meaning the dossier cannot confirm are dropped, not guessed.
- **`_posizione` in prose** (one paragraph, the section's surgical example of a design choice): the age of the closing fix and the reason for a missing position are stored in `servizi` under the reserved key `_posizione` — «nessuna colonna nuova, nessuna migrazione per tenant» (`PosizioneChiusura` docblock); the key starts with `_` because no campo of a commessa can have that name (`EsitoWriter` accepts only names the commessa defines). A short `json` block with the two shapes from the docblock (invented timestamp declared as example). Values of `fix_source` (`attuale`, `ultima_rilevata`) and of the motivo (`permesso_negato`, `gps_spento`, `nessun_fix`) with the labels of `PosizioneChiusura::MOTIVI`.
- `posizione` details: the UNIQUE key on (`oratelefono`, `latitudine`, `longitudine`) — the same point sent twice is stored once (Researcher confirms the insert path relies on it: `INSERT IGNORE`?); indexes on `operatore` and `ora`; `ora` (server) vs `oratelefono` (phone clock) — a wrong phone clock moves points to another day (ch.12/ch.8 use this; one clause).
- **Contro-obiezione 5:** «Perché la posizione dell'esito non sta in `posizione`?» → `posizione` is the trail; the closing position belongs to the esecuzione, with its age or its reason, so that it travels with the esito into the Verifica and the esportazione (ch.6, ch.7).

**Limite (mandatory):** `posizione` grows with every point and is per commessa; retention and size are not stated by the sources unless the dossier finds them (`stato_commesse_giorno` records database size — ch.12); the app may send inizio/fine of an intervento that the server does not store (ch.8) — do not look for them in `interventi_eseguiti.inizio`/`fine` without checking the writer; personal columns of `operatori` and `utenti` are personal data: queries for diagnosis select ids and codes.

**Sintesi:** «Prima di leggere una latitudine si chiede di chi è: dell'operatore, dell'esito o dell'utenza.»

**Key facts the Researcher must find**
- v0 definitions of `operatori`, `posizione`; migrations `0020_operatori_indirizzo_partenza.sql`, `0043_geocodifica_ai.sql`, `main/0001`, `main/0019`.
- `lib/Posizione.php` (insert path, use of the unique key), `lib/PosizioneChiusura.php` (`CHIAVE`, `SORGENTI`, `MOTIVI`), the writer of `interventi_eseguiti.lat/lng` (`git grep -n "_posizione\|PosizioneChiusura" -- lib`).
- Meaning of `interventi.lat/lng/precisione/distanza` and of the `_m` columns (`git grep -n "lat_m\|sim_m" -- lib | head`).
- How `sim_id` / device maps to commessa and operatore (`docs/02-patterns/14-android-auth-pattern.md`, `docs/03-cookbooks/20-test-mobile-headless.md` §1–2, `docs/mobile-v3/`), master `operatori` / `operatori_db` in `docker/db/sql/02-goplanner.sql` vs `lib/db_create.sql`.
- Geocoding precision columns: `docs/02-patterns/48-precisione-utenti-geocodifica-anomalie.md`, `51-geocodifica-correzione-ai.md` (one row only).

---

### § 5 — `## Campi personalizzati e griglie: dove una commessa aggiunge dati`
**Tag:** [DEV] (italic line: *Per gli sviluppatori e gli agenti di codice.*)
**Core question:** When one commessa needs a datum the others do not have, where does it go — and how does a grid of the back office learn to show it?
**Word target:** 1.100 (range 1.000–1.200)
**Paragraph functions:** Aggancio (four ways in, one right answer per case) → Dimostrazione (mechanisms table) → Spiegazione (`servizi` as JSON in text) → `### Le griglie` Spiegazione + numbered procedure → contro-obiezione → Limite → Sintesi.

**Content plan**
- **Mechanisms table — «Dove va un dato in più»** (Meccanismo | Dove sta il valore | Chi lo crea | Si filtra e si ordina? | Nel canone?):
  - colonna di import | a column of `carichi_righe` (or `utenti`) | generated from the mappatura (`mappature.php`, ch.4; code ch.13) | yes | no — free by rule, never declared in a migration (`migrations/README.md`)
  - campo nuovo | `carichi_righe.extra_<nome>` (`VARCHAR(255)`, `DECIMAL(18,4)`, `DATE`, NULL), registered in `campi_nuovi` | the server, from «+ Nuovo campo…» in File › Importazione (GOP-770; name rule `^extra_[a-z0-9_]{1,50}$`) | yes | the registry table is canonical (`0034_campi_nuovi.sql`); the columns are per commessa
  - campo dell'intervento | key in `interventi_eseguiti.servizi` | `Intervento::getCampiCustom()` of the commessa; the app compiles it | only through `JSON_EXTRACT`, no index | the column is canonical; the keys are per commessa
  - Campo Extra | nowhere: an SQL expression computed at read time | `Intervento::getCampiExtra()` → `InterventoBase::generaSQLExtra()` | depends on the expression | not schema
  Numbers already given by ch.3 (30 campi nuovi per commessa, 400 columns per table): quote once with «vedi il capitolo 3», do not re-explain.
- **The rule from GOP-770, the section's surgical example:** the old choice (migration `0014`, values in `carichi_righe.campi_extra` as JSON) was replaced because no grid, filter or esportazione could read it and the Filtro Avanzato cannot do `>=`, `BETWEEN` or sort on a key inside a JSON text; no row ever used it. Rule: never write into `campi_extra`; a value that must be filtered is a real column.
- `servizi`: in v0 it is a `text` column containing JSON (not a MySQL `JSON` type — [CONFLICT] 5); query with `JSON_EXTRACT(servizi, '$.nome_campo')`; reserved keys start with `_` (`_posizione`, § 4). One short `sql` example selecting `id` and one extracted key from `interventi_eseguiti` with an invented key name, declared as example.
- `### Le griglie: flexifields e la tabella flexigrid` — what defines a grid: `$flexifields['<griglia>']` in `custom/<tenant>/php/flexifields.php` with `colmodel` (`display`, `name`, `width`, `align`, `sortable`, `hide`, `format`, `process`, `cls`), `searchitems`, `buttons`; loaded only by `FlexifieldsTenant::carica()` in the order shared defaults → `custom/<tipo>` → `custom/<tenant>` (consistent with ch.2's override order: one clause); the shared defaults file exists only for grids that declare it (pattern 31: «Carichi» first; Researcher confirms the actual file name). Per-user layout: table `flexigrid` (`user`, `grid`, `field`, `width`, `ordine`, `visible`); only a saved `visible=0` has effect, `hide => true` is a floor (reason: before GOP-222 every row was saved with `visible=1`); saved rows with a name the grid no longer has are ignored, new columns go to the end (GOP-763/756/770). One resolver: `FlexigridLayout::colonne()` / `::griglia()` serves headers, cells, Excel and Dispositivi — «non va scritta una terza copia».
- **Procedure — «Aggiungere una colonna a una griglia di una commessa»** (numbered, one action per step; Researcher validates the order):
  1. add the element to `colmodel` in `custom/<tenant>/php/flexifields.php`, with an SQL label unique in the grid;
  2. if the expression reads a table the grid action does not join, add the join through the grid's hook where one exists (`MagazzinoBase::getJoinGriglia()`, ADR 24), never a new `if ($_SESSION['user']['db'] == …)` in `json.php`; Clienti and Interventi joins live in the operations engine (ADR 42 → ch.15);
  3. if the page sends an initial `sortname` or a column not in `flexifields`, add it to the action's extra columns in `GridRequest::endpointDefinitions()`;
  4. run `tests/FlexigridColonneTenant_Test.php` (headers and cells must match by name and count; duplicate SQL labels fail).
- Validation facts (GOP-416, GOP-691): `sortname` and `qtype` only from the grid's closed list; `rp` 0–1000; `width` 1–5000; `campi` 1–127 items of max 50 latin1 characters; otherwise HTTP 400 `{"error":true,"message":"Invalid grid parameters"}` and no query runs.
- **Contro-obiezione 6:** «Ho aggiunto la colonna nel `colmodel` e la griglia risponde 400.» → The request names a column outside the closed list of the action: register it in `endpointDefinitions()` (step 3); if instead the grid shows the header with empty cells, the log line `griglia_sfasata … missing=…` names the column without a cell.

**Limite (mandatory):** a campo dell'intervento in `servizi` cannot be indexed or compared as a number without extraction, so a filter on it scans; import columns differ by commessa and the code shared by all must not read them; ~26 grid actions of `json.php` still carry hard-coded joins per commessa (ADR 24) — new work uses the hook, old chains are not migrated in one go; the Excel of a grid exports every column of the colmodel, including hidden ones, and is not a file for the committente («vedi il capitolo 7»).

**Sintesi:** «Un dato da filtrare è una colonna vera; un dato che compila l'operatore è una chiave di `servizi`; una griglia si cambia in `flexifields.php`, non in `json.php`.»

**Key facts the Researcher must find**
- `docs/02-patterns/17-flexigrid-and-campicustom.md` (§§ 1.2–1.5, 2), `31-flexifields-colmodel-fallback-globale.md`, `24-join-dinamico-griglie-tenant.md`, `51-campo-nuovo-colonna-di-carichi-righe.md`; `docs/03-cookbooks/03-definizione-campi-custom-extra.md`, `33-esportare-in-excel-una-griglia.md`.
- Code: `lib/FlexifieldsTenant.php` (`carica()`, defaults file name), `lib/FlexigridLayout.php` (limits), `lib/GridRequest.php` (`endpointDefinitions`, `bind`, `compile`), `lib/GrigliaRisposta.php` (`griglia_sfasata`), `lib/ImportazioneCampoNuovo.php` (`nomeColonna`, `colonnaValida`, limits), `migrations/tenant/0034_campi_nuovi.sql`, `0014_mappatura_colonne.sql`, `InterventoBase::generaSQLExtra()`.
- v0 type of `interventi_eseguiti.servizi` (`text`) and of `flexigrid` (latin1 charset).
- Count of commesse that redefine `getCampiCustom()` (ch.3 says 59 — reuse ch.3's number and source, or re-count and record a [CONFLICT] if different).

---

### § 6 — `## Schema canonico, migrazioni e regole di accesso`
**Tag:** [DEV] + [STAFF] (italic line: *Per gli sviluppatori, gli agenti di codice e lo staff tecnico che applica le migrazioni.*)
**Core question:** What is the schema every commessa must have, how does a change reach it, and which rules keep a query or a migration from damaging data?
**Word target:** 1.100 (range 1.000–1.200)
**Paragraph functions:** Aggancio (the GOP-546 case) → Spiegazione (canonical schema, three levels, expand-only and why) → Procedura (adding a column) → Dimostrazione (rules table for access) → contro-obiezione → Limite → Sintesi = chapter closing.

**Content plan**
- **Opening case (GOP-546, problem → cause → remedy, no tenant names):** on commesse where `impostazioni.chiave` was `VARCHAR(20)`, the setting keys `interventi_giorni_indietro` and `interventi_giorni_avanti` were saved truncated as `interventi_giorni_in` and `interventi_giorni_av`; the code read the full key and did not find them. Cause: the widening migration (`0002`) never reached commesse without the baseline. Remedy: migration `0026_impostazioni_chiave_troncata_riparata` (widens to 64 only where narrower, restores the full key; if both exist the full one wins) after a read-only preview on every commessa; and the write guard `ImpostazioniGenerale::chiaveEntra()` now refuses and logs a key longer than the column instead of truncating it. Point: a schema that differs by commessa fails silently.
- **The canonical schema** (decision of 5 novembre 2026, GOP-696): v0 + core migrations + modules declared in `custom/<tenant>/moduli.json` (+ the commessa's own migrations in `migrations/tenant/custom/<tenant>/`). Outside the standard, and never removed: import columns of `carichi_righe`/`utenti`; tables and fields of a commessa's own logic, declared as its migration. Everything else is drift.
- **Table — three levels** (Livello | Cartella | A chi si applica): generali `migrations/tenant/NNNN_slug.sql` → every commessa database; moduli `migrations/tenant/modules/<modulo>/` → commesse that declare the module; della commessa `migrations/tenant/custom/<tenant>/` → only that database. Order: generali, moduli, commessa. Master: `migrations/main/`, no runner, applied by hand in numeric order by decision of the staff tecnico (the source says «del capitano»: say «per decisione del responsabile tecnico», Researcher confirms wording).
- **Why only additions:** `master` (PHP 7.3) and `php8` run on the **same databases**: a removal or rename would break the other branch; removals come in a later release when neither version uses the object.
- **The v0 gate in two sentences:** `0000_baseline` is registered only on a commessa already conforming to `0000_baseline.expected.json`; the others are `excluded` and receive nothing, not even general migrations, until realigned one at a time (additive script + report, `make riallinea_tenant`, GOP-697). Ch.2 gave the 40 excluded: refer to it, no new numbers.
- **Procedure — «Aggiungere una colonna che il codice comune usa»** (numbered):
  1. write `migrations/tenant/NNNN_slug.sql`: one change, rerunnable (`IF NOT EXISTS` or check on `information_schema` + `PREPARE`/`EXECUTE`), additive, charset/collation/engine explicit, no `USE`, no `goplanner*.` names, no down;
  2. put it in the same MR as the code that reads the column;
  3. if the column belongs to one commessa's logic, put it in `migrations/tenant/custom/<tenant>/` instead (it must run on v0 alone: no `AFTER` a column created by core migrations);
  4. test on a throwaway MySQL: `make test_migrate`; tests that need tenant tables build them with `SchemaCanonico::installa()` (GOP-698), so a column outside the canon fails in development;
  5. preview: `php scripts/migrate.php --tenant=<db>` (read-only by default; without `--tenant` or `--all` it refuses to start);
  6. hand the preview and `make schema_check` to the staff tecnico; `--apply` is theirs, and the release gate is in «vedi il capitolo 16».
  Never edit a file already applied: its checksum in `schema_migrations` makes the runner refuse it. The id is the path without `.sql`, max 100 characters.
- **Table — «Regole di accesso al database»** (Regola | Perché | Dove):
  - master with `MainOrm`, commessa with `SimpleOrm` | two connections, two databases | `lib/MainOrm.php`, `lib/SimpleOrm.class.php` (ch.2)
  - `MyWrapper` only for minimal maintenance of old code | deprecated | `docs/02-patterns/01-database-rules.md`
  - request values bound, never concatenated: `SimpleOrm::sqlBind()`, `GridRequest::bind()` + `compile()` | SQL injection; tenant column expressions reorder fragments | `lib/GridRequest.php` (GOP-416)
  - `SimpleOrm::escapeString()` only for names that cannot be bound (grid column names) | — | `FlexigridLayout`
  - the code shared by all uses only canonical columns | an excluded commessa may lack the rest | ADR 45
  - `SimpleOrm::insert()`/`update()` drop fields the table lacks; the drop is logged as a warning (tenant, table, field; once per field per process, max 50 per process, never values) | a save that «works» without the datum | GOP-700
  - guards `columnExists`/`tableExists` only with `// TEMP schema-drift GOP-700`, removed when commesse conform | they hide drift | `grep -rn "TEMP schema-drift"`
  - never `INSERT` directly into `goplanner.users` | an access without identity is invisible to profili | ch.11
  - nothing that writes or changes structure from dev, local stacks or `goplanner-test-*`: they point at the same database cluster as production | — | `migrations/README.md` § Esecuzione
  - Gea has no database credentials; it reads through `chatbot_*` actions with the user's identity | — | ch.10 box, ch.15
- **Contro-obiezione 7:** «La provo sul mio stack locale, tanto è locale.» → The local and dev stacks point at the production cluster: a migration «tried» there has been applied to a real commessa. The throwaway MySQL of `make test_migrate` is the place to try.
- **Closing** (last paragraph of § 6, see TARGET).

**Limite (mandatory):** the repository cannot see production — the catalogue of customisations lists only what code names, not unused leftovers (`docs/01-foundations/10-catalogo-personalizzazioni-schema-tenant.md`); the silent drop will become an error on canonical tables only after realignment (planned, not live: say «diventerà», with its source); the master has no conformity check like `schema_check`; deciding the fate of a non-conforming item (narrowing, incompatible type, duplicates that stop `0018`) is not the developer's: it goes in the report with its numbers.

**DEV/staff box (max 5 lines):** `scripts/migrate.php` (`--tenant`, `--all`, `--apply`, `--yes` only without a terminal), `make schema_check` (reference v0 + modules, or v0 + migrations when `0000_baseline` is registered), `make schema_expected` after any change to `0000_baseline.sql`, `MigrationRunner::loadMigrations($moduli, $tenant)`, `SchemaDiff::$aheadOfV0`, `lib/SchemaConformita.php` (GOP-699). Host and credentials only from the environment, no defaults.

**Key facts the Researcher must find**
- `migrations/README.md` (all sections), `migrations/main/README.md` (header, «Mai da dev…», who decides), `docs/02-patterns/45-schema-canonico-tenant.md` (decision, three levels, master constraint, rules of code, alternatives rejected), `docs/02-patterns/01-database-rules.md`.
- GOP-546: migration `0026_…sql` header, `ImpostazioniGenerale::chiaveEntra()`, Jira title; confirm the two truncated keys.
- `lib/SimpleOrm.class.php`: drop and log (~line 474 and ~707), the 50-per-process cap, `sqlBind()` (~1091), `escapeString()` (~356), `columnExists()`/`tableExists()`.
- `tests/support/SchemaCanonico.php` (GOP-698); `Makefile` targets `test_migrate`, `schema_check`, `schema_expected`, `riallinea_tenant`.
- `schema_migrations.id` `VARCHAR(100)`; the checksum rule.
- Jira: GOP-338, GOP-339, GOP-340, GOP-546, GOP-645, GOP-696, GOP-697, GOP-698, GOP-699, GOP-700, GOP-701 — titles for `## Fonti`.

---
### `## Fonti`
Built by the Writer from the dossier entries actually used, in the STYLE_BIBLE format (`codice: …`, `wiki: …`, `docs: …`, `Portolano: …`, `Jira: GOP-NNN — titolo breve`). Every Jira key with its short title.

---
## REVIEWER READINESS NOTES

### Tension points (where the chapter must create real stakes)
1. **The document an agent reads first is wrong about the schema (§ 1).** Stakes: an agent copies the index's query, joins `utenze` on a column that does not exist, «fixes» it by joining on `id`, and reads the legacy table instead of the utenze — a report that runs and is wrong. Resolution: the reading order (migrations → `$table` → documents) and one mechanical check.
2. **No foreign key (§ 3).** Stakes: a raw `DELETE` on `interventi` leaves esecuzioni, foto and pratiche pointing at nothing; exports built on `LEFT JOIN interventi` drop the esecuzione (ch.6's case, referred to). Resolution: the protected paths table; deletions through `Intervento::delete()` / the JSON actions.
3. **The save that «works» (§ 6).** Stakes: `SimpleOrm::insert()` drops a field the table lacks; the page says saved, the datum is gone. Resolution: canonical columns only, migration in the same MR, the warning in the errors register (since GOP-700).
4. **A migration «tried locally» (§ 6).** Stakes: local and dev stacks point at the production cluster; an `--apply` there changes a real commessa. Resolution: `make test_migrate` on a throwaway MySQL, preview by default, `--apply` is the staff tecnico's.
5. **Schema that differs by commessa (§ 6, GOP-546).** Stakes: a setting saved truncated is never found again, silently, only on some commesse. Resolution: the canonical schema, the v0 gate, `schema_check`, write guards that refuse instead of truncating.
6. **The wrong latitude (§ 4).** Stakes: a map of «where the operatore closed» drawn from `utenti.lat` shows the utenza, not the operatore. Resolution: the coordinates table and the question «di chi è».

### Key chains to make explicit (cause → consequence → reader action)
- Document predates v0 → names columns that do not exist → open `0000_baseline.sql` and the model's `$table` first.
- No `FOREIGN KEY` → MySQL accepts any `id_*` and deletes do not cascade → modify `interventi`/`interventi_eseguiti`/`carichi_righe` only through the guarded paths.
- Esecuzione shares the intervento's id → no `id_intervento` column in `interventi_eseguiti` → join on `ie.id = i.id_intervento`; test `!$ie->isNew()`.
- Inviato (7) written only on the esecuzione → `interventi.stato_id` lags → read closure stati from `interventi_eseguiti.stato_id` (or `AvanzamentoCarichi`).
- `utenti.stato_id` copied from the last intervento touched → wrong with `interventi_multipli` → compute the real state from interventi (ch.3).
- `users` in the master may be MyISAM → a transaction does not cover it → the code writes it after the commit; never `INSERT` into `goplanner.users` (ch.11).
- Value filtered or sorted → a JSON key cannot be compared → a real column (`extra_<nome>`, GOP-770), never `campi_extra`.
- New column in a grid → closed list in `GridRequest` → register it, or the page gets 400 «Invalid grid parameters».
- Saved layout with `visible=1` from before GOP-222 → would reveal technical columns → `hide` is a floor; only `visible=0` acts.
- `master` and `php8` share the databases → only additions → removals in a later release.
- Commessa not conforming to v0 → `excluded` → receives no migration until realigned (`riallinea_tenant`, one at a time).
- Applied migration edited → checksum mismatch → runner refuses → correct forward with a new file.
- Local stack → production cluster → try migrations only on `make test_migrate`.

### Risk proportionality guards (each risk paired with its balancing context)
- **Wrong documents** → only the schema document and the index's query examples predate v0 (30 settembre 2026); the pattern documents (`docs/02-patterns/`) remain the place for rules; the check is mechanical (one file). Never «la documentazione è inaffidabile».
- **No foreign keys** → the main delete paths are guarded; the residual risk is raw SQL not yet migrated, as the pattern itself states. Never «i dati si corrompono».
- **Silent field drop** → it is logged since GOP-700 and will become an error on canonical tables after realignment («diventerà», planned); the code shared by all uses canonical columns.
- **Schema drift** → numbers are dated (ch.2 already gave the 40 excluded as of 5 novembre 2026); there is a plan with an order and per-commessa review; excluded commesse keep working with temporary guards.
- **Shared production cluster** → reading the structure needs no connection: the repository files are enough; tests run on a throwaway MySQL; writing is the staff's, with preview first.
- **MyISAM / InnoDB** → state exactly what v0 says and where code says «può essere MyISAM»; do not generalise to every commessa or to the master as a whole.
- **Personal data in `utenti` and `operatori`** → column names only; example queries select ids, codes of stato, dates, counts; no example values except invented and declared.
- **AI columns** → named, no figures (cost tables `analisi_ai_costi*` named only if needed).

### Counter-objections planned (STYLE_BIBLE requires ≥ 2; six planned, one optional)
1. § 1 — «Il documento dello schema dice `utenze`, e la tabella c'è: perché non usarla?»
2. § 2 — «Per sapere se un intervento è chiuso guardo `interventi.stato_id`, no?»
3. § 3 — «Devo pulire degli interventi di prova: una `DELETE` con un `WHERE` preciso non basta?»
4. § 3 (optional, only with a source) — «Perché non aggiungere le chiavi esterne con una migrazione?»
5. § 4 — «Perché la posizione dell'esito non sta in `posizione`?»
6. § 5 — «Ho aggiunto la colonna nel `colmodel` e la griglia risponde 400.»
7. § 6 — «La provo sul mio stack locale, tanto è locale.»

### Litmus test for this chapter
A new developer or coding agent, with only this chapter, can: say in which database a table lives and use the right ORM; write the join from lista to esecuzione and foto with the real keys; read the closure state from the right column; delete test interventi without leaving orphans; choose where a datum of one commessa goes and add it to a grid without a 400; write an additive, rerunnable migration in the right folder, test it on a throwaway MySQL and hand the preview to the staff tecnico — without ever writing to production from a local stack.

### Structural checks for the Editor
- One H1 `# 14. Il modello dei dati`; «In questo capitolo»; six `##`; `## Fonti` last; no raw HTML.
- Every section has its italic audience line, a Limite paragraph, at least one exact table/column/file/number.
- Code blocks: `sql`, `php` or `json` declared, ≤ 12 lines, real or declared as invented, no row values, no hosts, no credentials.
- The `utenti` table is never written «utenti» outside monospace; «tenant» only with code; no committente/tenant names.
- ch.6's orphan case and ch.8's GOP-621 are referred to, not retold; ch.2's session mechanics and 40-excluded figure are referred to, not repeated.

---

## RESEARCHER BRIEF

**Web search terms:** none. INSTRUCTION.md § Researcher, SOURCE OVERRIDE: the web is not a source for this book (MySQL documentation only if strictly needed for a statement about InnoDB/foreign keys or `JSON_EXTRACT` on a `text` column — prefer not to). The GOPlanner repository (`/home/alan/firstmate/projects/GOPlanner`, branch `php8`) is READ ONLY: Read/Grep/`git grep`/`git log`/`git show` only; no checkout, pull, stash, composer, npm, `make`, `php scripts/*`. **Do not connect to any database and do not use any `mysql_query` tool**: the dev and local stacks point at the production cluster; every schema fact comes from files.

### Documents to prioritize (in order)
1. Schema files (authority for what exists): `migrations/tenant/0000_baseline.sql` (header + the core tables), `migrations/tenant/0000_baseline.expected.json` (only to confirm counts), `migrations/tenant/00NN_*.sql` touching core tables, `migrations/tenant/modules/`, `migrations/tenant/custom/`, `migrations/main/*.sql`, `migrations/README.md`, `migrations/main/README.md`.
2. Model classes and access code: `lib/SimpleOrm.class.php`, `lib/MainOrm.php`, `lib/UtenzaBase.php`, `lib/CaricoBase.php`, `lib/CaricoRigaBase.php`, `lib/InterventoBase.php`, `lib/InterventoEseguitoBase.php`, `lib/Posizione.php`, `lib/PosizioneChiusura.php`, `lib/LottoService.php`, `lib/AccessoCommessa.php`, `lib/InvitoUtente.php`, `lib/json_functions.php`, `lib/AvanzamentoCarichi.php`, `lib/FlexifieldsTenant.php`, `lib/FlexigridLayout.php`, `lib/GridRequest.php`, `lib/GrigliaRisposta.php`, `lib/ImportazioneCampoNuovo.php`, `lib/ImpostazioniGenerale.php`, `lib/SchemaConformita.php`, `tests/support/SchemaCanonico.php`, `Makefile`.
3. Decision records: `docs/02-patterns/45-schema-canonico-tenant.md`, `01-database-rules.md`, `17-flexigrid-and-campicustom.md`, `21-guard-cancellazione-intervento-eseguito.md`, `24-join-dinamico-griglie-tenant.md`, `31-flexifields-colmodel-fallback-globale.md`, `34-stato-utenza-derivato-ultimo-intervento.md`, `35-lotti-entita-e-etichette-legacy.md`, `43-avanzamento-carichi-fonte-stati.md`, `48-precisione-utenti-geocodifica-anomalie.md`, `51-campo-nuovo-colonna-di-carichi-righe.md`; `docs/01-foundations/03-database-facts.md` (**security: contains a legacy IP and a local DB user — do not copy**), `07-database-schema.md` and `docs/00-concept-index.md` (as **conflict sources**, not as authority), `10-catalogo-personalizzazioni-schema-tenant.md` (only the «Da dove viene e che cosa non può dire» part); `docs/03-cookbooks/03-definizione-campi-custom-extra.md`, `20-test-mobile-headless.md` (§1–2), `33-esportare-in-excel-una-griglia.md`.
4. Earlier dossiers for consistency (reuse sources, do not re-research): `dossier_chapter_1.md`, `dossier_chapter_2.md`, `dossier_chapter_3.md`, `dossier_chapter_6.md`, `dossier_chapter_8.md`, `dossier_chapter_11.md` in the book folder.
5. Portolano, then Jira.

### Wiki paths
- `wiki/index.md` (search for any data-model or schema article; the Architect found none — record if one exists)
- `wiki/identita-rbac/` (only to confirm which identity tables are in the master)
- `wiki/assistenza-clienti/import-carico.md` (only «+ Nuovo campo…» label, if § 5 quotes it)

### Code paths and grep patterns (read-only)
- Tables and databases: `grep -o "CREATE TABLE IF NOT EXISTS \`[a-z_0-9]*\`" migrations/tenant/0000_baseline.sql`; `grep -c "FOREIGN KEY" migrations/tenant/*.sql`; `git grep -n "FOREIGN KEY" -- migrations/`; `grep -o "ENGINE=[A-Za-z]*" migrations/tenant/0000_baseline.sql | sort | uniq -c`.
- Model table names: `git grep -n "\$table *= *'" -- lib/*Base.php lib/Posizione.php lib/Foto*.php lib/Operatore*.php`; `git grep -n "extends MainOrm" -- lib`.
- Legacy names: `git grep -n "FROM utenze\|JOIN utenze" -- lib pages json.php | head -20`; tenant `users`: `git grep -n "FROM users\|JOIN users" -- lib json.php | head -20` and check the ORM class of each hit.
- Relations and guards: `git grep -n "function getInterventoEseguito\|function updateStatoUtenza\|function getUltimoInterventoChiuso" -- lib`; `git grep -c "updateStatoUtenza" -- lib/ADMINController.php`; `git grep -n "function elimina_interventi_non_chiusi" -- lib`; `git grep -n "MyISAM" -- lib docs`.
- Positions: `git grep -n "_posizione\|PosizioneChiusura" -- lib | head -20`; `git grep -n "lat_m\|sim_m\|data_m" -- lib | head`; `git grep -n "INSERT IGNORE INTO posizione\|INTO posizione" -- lib json_android.php mobile_v3.php`.
- Grids: `git grep -n "function carica" -- lib/FlexifieldsTenant.php`; `ls lib | grep -i flexifields`; `git grep -n "endpointDefinitions" -- lib/GridRequest.php`; `git grep -n "griglia_sfasata" -- lib json.php`.
- Access and drift: `git grep -n "campo scartato\|function sqlBind\|function escapeString" -- lib/SimpleOrm.class.php`; `grep -rn "TEMP schema-drift" --include=*.php . | wc -l` (count only); `git grep -n "function chiaveEntra" -- lib`.
- History: `git log --oneline -i --grep="GOP-339\|GOP-340\|GOP-546\|GOP-696\|GOP-698\|GOP-700\|GOP-770" | head -30`.

### Portolano queries (`mcp__rag_qdrant_server__query_rag_hybrid` with `user_roles: ""` — the EMPTY string, per INSTRUCTION.md; fall back to `query_rag`)
- «schema canonico tenant v0 baseline migrazioni moduli»
- «utenti utenze tabella UtenzaBase table»
- «interventi_eseguiti id uguale id_intervento getInterventoEseguito isNew»
- «chiavi esterne foreign key MyISAM InnoDB tenant»
- «updateStatoUtenza stato utenza ultimo intervento interventi_multipli»
- «posizione tabella oratelefono latitudine providergps»
- «_posizione PosizioneChiusura fix_age gps_spento»
- «campo nuovo extra_ carichi_righe campi_nuovi campi_extra»
- «servizi JSON_EXTRACT campi custom getCampiCustom generaSQLExtra»
- «flexifields colmodel flexigrid visible hide FlexigridLayout»
- «GridRequest Invalid grid parameters endpointDefinitions»
- «SimpleOrm campo scartato colonna assente TEMP schema-drift»
- «impostazioni chiave troncata interventi_giorni_indietro GOP-546»
- «migrate.php anteprima apply schema_check cluster produzione»

### JQL fragments (cloudId `21873985-2e5d-4a8a-bb45-e6d453128985`, project GOP, READ ONLY)
- `project = GOP AND key in (GOP-222, GOP-227, GOP-338, GOP-339, GOP-340, GOP-416, GOP-546, GOP-621, GOP-640, GOP-645, GOP-691, GOP-696, GOP-697, GOP-698, GOP-699, GOP-700, GOP-701, GOP-747, GOP-770)`
- `project = GOP AND text ~ "chiave esterna" ORDER BY updated DESC`
- `project = GOP AND text ~ "schema_check" ORDER BY updated DESC`
- `project = GOP AND text ~ "campo scartato" ORDER BY updated DESC`
- Purpose: titles for `## Fonti`; at most one real story per section (problem → cause → fix, no names): GOP-546 (§ 6, primary), GOP-770 (§ 5), GOP-700 (§ 6 chain), GOP-645 (§ 2, only the fact that a canonical column was missing on some schemas).

### Specific facts, numbers and labels to hunt
- v0: 29 tables; engine per table; 0 foreign keys; snapshot date 30 settembre 2026; threshold ≥ 90%; column counts of `utenti` (24), `interventi` (25), `interventi_eseguiti` (52), `utenze` (67), tenant `users` (5) — recount.
- Stati: constants 1–10 (`InterventoBase`), 99 (`InterventoEseguitoBase`); `stati.nome` `char(15)`.
- `carichi.lotto` `tinyint` (−128…127, ch.3); UNIQUE `carichi_righe(id_carico, id_utenza)`.
- `posizione`: UNIQUE (`oratelefono`, `latitudine`, `longitudine`); `providergps` enum `fused`/`network`.
- `_posizione` shapes and motivi labels.
- Campi nuovi: types, name regex, 30 / 400 (ch.3).
- Grid: `rp` 0–1000; `width` 1–5000; `campi` 1–127, 50 characters, latin1; HTTP 400 body.
- Migrations: `schema_migrations.id` 100 characters; `impostazioni.chiave` 20 → 64; drop log cap 50 per process.

### Mandatory [CONFLICT] items to record
1. **`utenze` vs `utenti`.** PRD § 4 row 14, `docs/00-concept-index.md`, `docs/01-foundations/07-database-schema.md` name `utenze` the main table; `UtenzaBase::$table = 'utenti'`. Already resolved in ch.1/ch.3: code wins; keep the same wording.
2. **Engine.** ch.6 and `docs/02-patterns/21-…` («MyISAM»), `07-database-schema.md` (`ENGINE=MyISAM`) vs v0 (InnoDB on all 29 tables) vs code comments on master `users` («può essere MyISAM»). Record each; resolution: v0 for the canonical commessa schema; the master `users` per code comments; excluded commesse unknown.
3. **Column types in `07-database-schema.md` vs v0:** `lettura1…` `decimal(12,3)` vs `varchar(100)`; `servizi` `varchar(500)` vs `text`; `carichi.nomefile` 50 vs 100; `impostazioni` columns (`categoria`, UNIQUE `chiave`) vs v0 (`user`, `sezione`, `chiave varchar(20)`) and later migrations (0002, 0018, 0026); `stati` sample values («1=Programmato…») vs constants. Code wins.
4. **`posizione` columns:** index and schema doc (`lat`, `lng`, `quando`) vs v0 (`latitudine`, `longitudine`, `ora`, `oratelefono`).
5. **`servizi` type:** pattern 17 «colonna di tipo JSON», ch.3 «colonna JSON» vs v0 `text`. Resolution in words: a `text` column holding JSON.
6. **Tenant `users`:** present in v0 (5 columns); the users of the gestionale are `goplanner.users`. Who reads the tenant one?
7. **Master schema source:** `migrations/main/` (additive, by hand) vs `docker/db/sql/02-goplanner.sql` (a dump that also contains commessa-like tables) vs `lib/db/*.sql`. Which tables are really in the master?
8. **Phones and operatori across databases:** `mobile_v3_dispositivi` (master), `operatori` (commessa), a possible master `operatori`/`operatori_db`; cookbook 20 «doppia tabella master/tenant».
9. **Flexifields defaults file name:** pattern 31 says «`lib/flexifields_defaults.php` (o nome equivalente)»; confirm the real file loaded by `FlexifieldsTenant::carica()`.
10. **`getCampiCustom()` count:** ch.3 says 59 commesse; recount only if cheap, otherwise reuse ch.3's figure with its source.

### Security filter reminder
No hosts, ports, IPs, cluster names, DB users or passwords (`docs/01-foundations/03-database-facts.md` has some: skip those lines), no `DBHOST=`/`DBUSER=`/`DBPASS=` values, no content of `config*.inc.php` connection code or of credentials JSON in the repository root, no row values of any table, no tenant or committente names (including the v0 reference family and the per-tenant numbers of ADR 45), no cost values, nothing about password formats.

---

## TARGET

- **Word count:** 5.500–5.900 words in total (PRD § 4: 4.000–6.000), `## Fonti` excluded. Breakdown: «In questo capitolo» ~80; § 1 950; § 2 1.050; § 3 950; § 4 850; § 5 1.100; § 6 1.100.
- **Opening hook strategy:** open § 1 on the query that `docs/00-concept-index.md` offers agents as a zero-effort reference — `JOIN utenze u ON i.id_utenza = u.id_utenza` — and on the fact, checked against `0000_baseline.sql`, that `utenze` has no `id_utenza` and is not even the table of the utenze, so that in three sentences the reader learns why this chapter reads the schema from the migrations and the `$table` of each class before any document.
- **Closing beat promise:** end § 6 on a rule that echoes neither ch.2 nor ch.11 — every relation in GOPlanner has a keeper in the code and none in the database, so before touching a row one asks which code path keeps it, and before touching the schema one writes an additive migration, tests it on a throwaway database and leaves `--apply` to the staff tecnico.
