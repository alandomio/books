# Chapter 13 — Struttura (Architect spec)

**Chapter title (H1 for the Writer):** `# 13. Architettura di GOPlanner su PHP 8`
**PRD row:** «Come è fatto il gestionale: punti di ingresso, flusso MVC `index.php` → `pages/` → Smarty, `lib/`, controller API, personalizzazioni per tenant, job asincroni e avanzamento, worker, websocket, frontend JS» — audience **DEV** (sviluppatori nuovi e agenti di codice sul ramo `php8`; lo staff tecnico legge § 1 e § 5).
**Core question of the chapter:** when a request reaches GOPlanner — a page, a JSON call, an app call, a scheduled task — which file receives it, what does every request do before any business logic, and where does the work go when it lasts longer than a response?
**Chapter thesis (the rule the whole chapter proves):** GOPlanner is **one codebase with many doors**. Every door (entry point) does the same three things before any business logic: **(1)** it finds the commessa and opens its database (`config.inc.php`, session or job context); **(2)** it loads the configuration in layers and registers the autoloader that prefers the commessa's class; **(3)** it hands the request to a controller **by name** — `page` → `pages/<page>.php`, `action` → public method of a `*Controller`, route `/v3/…` → `lib/MobileV3/Router`, job class → `Job::run()`. Knowing the door tells you where the code lives, which guard protects it, how long it may run and where its errors go. Work that outlives a response leaves the request: it goes into a Redis queue and runs in a worker, **one job per fresh process**, because a PHP process cannot unload a commessa's class once it has loaded it (GOP-687).

### Continuity and glossary check (done by the Architect, 25 novembre 2026)
- `chapter_index.md`: not present. `NARRATIVE_GLOSSARY.md`: not present. Canonical vocabulary = `/home/alan/firstmate/projects/GOPlanner/CONTEXT.md`. Final text exists for chapters 1–10; chapters 11–12 exist as `chapter_N_struttura.md`. **Before writing, the Writer re-checks whether `chapter_11.md` and `chapter_12.md` now exist** and aligns the pointers below with their final wording.
- **Promises made by earlier chapters that ch.13 must keep** (the Writer covers each; the Reviewer checks each):
  1. ch.1 (`chapter_1.md`, DEV box of «Dove guardare…»): «Il flusso web è `index.php` → `pages/{nome_pagina}.php` → `Smarty_templates/it/` … Le personalizzazioni di una commessa stanno in `custom/{nome_cliente}/` … e prevalgono su `lib/`. Il capitolo 13 descrive l'architettura.» → § 1 and § 2 must describe that flow in full, consistently.
  2. ch.4 (`chapter_4.md`, DEV box of § 1): «La struttura di `mappature.php` è nel capitolo 13.» → § 4 must show the structure of `custom/{tenant}/php/mappature.php` (import side), with a short real fragment without data of the committente.
  3. ch.4 (`chapter_4.md`, DEV box): «La lista, che nel codice si chiama carico, sta nelle tabelle `carichi` e `carichi_righe`. Il flusso è spiegato nel capitolo 13.» → § 3 or § 5 must walk the importazione as code: `ImportazioneController::call()` → queue (`ImportazioneJob`, tipo `importazione` of `AvanzamentoJob`, GOP-745) → registro `importazioni`. Tables only named (schema is ch.14).
  4. ch.7 (`chapter_7.md`, DEV box): «I modelli di sistema sono le chiavi del `mappature.php` della commessa (codice: capitolo 13).» → § 4 must also show the export side of `mappature.php` (how a key becomes a «modello di sistema»).
  5. ch.7 (struttura): «Job asincroni, worker, avanzamento (segnalibro) as architecture» → § 5.
  6. ch.11 (struttura): «`index.php` routing, `SimpleOrm` gate → ch.13» → § 2 (the RBAC gate in `index.php`, one sentence + «vedi il capitolo 11») and § 3/§ 4 (`SimpleOrm`/`MainOrm`, one sentence + pointer ch.2/ch.14).
  7. ch.12 (struttura): «`pages/admin.php` routing, `index.php`, `json_admin.php`» → § 1 table row + § 3 guard sentence.
- **Do NOT re-explain what ch.2 already owns.** `chapter_2.md` § «Chi vince: l'ordine degli override» already states, with line numbers: configuration in three levels (common → `custom/{dbtype}` → `custom/{db}`, `config.inc.php` righe 436-441), classes in two levels via `goplannerAutoload` → `ClassiCustom::carica()` (commessa → `lib/class<X>.php` → `lib/<X>.php` → `lib/jobs/<X>.php`; no `dbtype` level for classes), `custom.js` in two pieces (`js/code/js.php`), templates **only** from `Smarty_templates/<lingua>/` (no per-commessa override), and the PHP 8 abstract-signature trap. Ch.13 states each in **one sentence + «vedi il capitolo 2»** and adds only what ch.2 does not cover: *when* in the request the override takes effect, why long-lived processes break it, and `mappature.php` as code.
- **Contradictions to keep consistent:** ch.2 says the documentation diagram (`docs/diagramma_override_multi_tenant.md`) draws a `custom/{dbtype}/php/` class level and a per-commessa template override that the code does not have. Ch.13 must say the same (code on `php8` wins) and must not draw the doc's diagram.
- **Closings already used (ch.13 ending must not echo them):** ch.1 — order glossary word → step → page → Gea → staff; ch.2 — «quale commessa è aperta, che cosa dice la sua cartella in `custom/`, che cosa viene dal codice comune» (**closest risk: ch.13 must NOT end on "check custom/ before lib/"**); ch.5 — three numbers before correcting; ch.6 — two answers before acting; ch.8 — the column «Ultimo invio»; ch.9 — every move is a movimento; ch.10 — read what «Autorizza» carries; ch.11 (planned) — first layer that hides, smallest access; ch.12 (planned) — evidence travels with the problem. Ch.13 ends on a **design rule for new code** (see TARGET): choose the door before writing the first line.
- **Glossary traps specific to this chapter (Writer and Editor check all ten):**
  1. **«Tenant» / «cliente» in code = commessa.** DEV chapter: «tenant» is allowed when naming code (`custom/{tenant}`, `TenantBootstrap`, `$_SESSION['user']['db']`), with the correspondence stated the first time («la commessa, che nel codice si chiama tenant»). The docs say `custom/{nome_cliente}` and the master table is `clienti`: say once that «cliente» in the code also means the commessa. Never «cliente» for committente or utenza in prose.
  2. **`utenti` vs `users`.** In the code the utenze are the table `utenti` (`UtenzaBase::$table = 'utenti'`, established by ch.1 and ch.3) and the people who use the gestionale are `users`. State it once in a DEV-relevant place (§ 2 or § 4) because a new developer reads `utenti` as «utenti»; then pointer ch.14.
  3. **«Lista» vs `Batch` / `carichi`.** The glossary forbids «batch» and «carico» for the lista. In this chapter `Batch` is a class (`lib/Batch.php`, a group of jobs) and `carichi` a table: write them in `monospace` only, never as Italian words for a lista; when a lista is meant, write «lista».
  4. **«Pianificazione» vs dispatch/scheduling.** The glossary forbids «dispatch» and «scheduling» as synonyms of pianificazione. Here «dispatch» appears only as code (`Batch::dispatch()`); in prose the controller «smista» or «chiama il metodo»; `scheduler_giro.php` is «lo schedulatore del Giro» (the code's own comment says «schedulatore»).
  5. **«Giro» has two meanings** (ch.5 and ch.12 already warned). `scheduler_giro.php`, the queue `job_giro`, `GiroRegistro` belong to the **Giro of automatic activities** (Admin › «Giro», GOP-656), not to the operatore's daily route. Always «il Giro delle attività automatiche» or «la coda `job_giro`»; one `> **Attenzione:**` line.
  6. **«Lavoro» vs `Job`.** The UI says «lavoro» («Annulla lavoro», segnalibro, modale) and the code `Job`, `lib/jobs/`, `AvanzamentoJob`. Prose: «lavoro asincrono» / «lavoro in coda»; «job» only when naming a class or the queue. Never «task» (forbidden for intervento; also Jira «task» is ch.16).
  7. **«Attività» vs log/evento.** The glossary forbids «log», «evento», «azione» for attività. In this chapter registers of the code (`Queue::logQueueEvent`, CloudWatch) appear only in `monospace` or inside boxes; «log» in prose only as part of a code name. Logs and observability are ch.16 (pointer).
  8. **«Esportazione»/«importazione» vs export/import.** Prose uses the Italian glossary words; `Export.php`, `ExportInterventiJob`, `Import.php`, `ImportazioneJob` appear as code names only.
  9. **«Campo personalizzato» vs flexifield.** `$custom['flexifields']` and `flexifields.php` only as code names; the concept is ch.3 and ch.14 (pointer).
  10. **«Staff tecnico» vs «sviluppatori».** The glossary lists «sviluppatori» as a word to avoid **as a synonym of staff tecnico**. The PRD names developers as the reader of Part IV. Rule: «sviluppatore» names the reader who writes code (and the box label «Per gli sviluppatori»); whoever runs production, reads Admin pages and answers tickets is always «staff tecnico». Never use the two as synonyms. «Operatore» is only the field worker; never «utente» or «tecnico» for him.
- **Security (blocking, chapter-specific):** the repository root and some code files carry secrets and private data that must never reach the dossier or the chapter:
  - `config.inc.php`, `config-docker.inc.php`: database host, user and password variables. The chapter may say «`config.inc.php` apre la connessione» and name the database naming rule already used by ch.2 (`'goplanner_' . $_SESSION['user']['db']`); never quote lines with connection values, never `$DBPASS` values.
  - `Makefile`, `deploy.sh`, `multiarch-deploy*.sh`, `release.sh`: AWS account numbers, ARNs, ECR repository addresses, regions, host names. Not used in ch.13 at all (deploy is ch.16).
  - A credentials JSON file at the repository root (a service-account key): never open, never name, not even its file name.
  - `.env*`, `tunnel.env`, `docker-data/`, `coordination.db`, `state/`, `raw/`, `scratch/`: do not open.
  - `js/code/` contains a saved web page whose **file name contains a private host name**: never list `js/code/` exhaustively and never name that file. Describe `js/code/` by rule («un file per pagina») and cite only the files the dossier needs (`job-progress.js`, `job-segnalibri.js`, `esportazione.js`, `js.php`).
  - Host names and URLs in code (e.g. the default chat widget address in `index.php`, domains in Makefile comments): never in the chapter.
  - `ws_server/index.js`: do not describe its CORS setting or ports as a weakness; no host names.
  - `pages/` contains some files named after a commessa or committente (`rapporti_<nome>.php`): say «alcune pagine esistono per una sola commessa», never list them. Same for comments that name a commessa (e.g. a comment in `lib/AvanzamentoJob.php`): «una commessa».
  - **The `page` parameter.** `index.php` builds the path `pages/<page>.php` from the request. The Researcher checks where (if anywhere) the value is validated. If validation exists, cite it as a rule («il nome della pagina è filtrato in …»). If the Researcher cannot find it, they write **only** `[BLOCKED: needs human input — verificare la validazione del parametro page in index.php]` in the dossier, with **no** description of how it could be abused, and the chapter says nothing about it. The same rule applies to any other potential weakness noticed while reading (e.g. which public methods of `JSONController` are reachable): no exploit description in the dossier or in the chapter.
  - No AI vendor, provider or model names (ch.10/ch.12 rule): AI architecture is ch.15; ch.13 needs no AI file names.

### Chapter boundaries (one-line pointers only, per PRD § 4 «Confini tra capitoli»)
| Topic touched here | Owned by | What ch.13 may say |
|---|---|---|
| Database per commessa, DB master, `MainOrm` vs `SimpleOrm`, `GOPlanner::$account` | ch.2 (rule), ch.14 (schema) | One sentence in § 1 bootstrap + «vedi i capitoli 2 e 14» |
| Override order (config 3 levels, classes 2 levels, `custom.js`, no template override, abstract signatures) | ch.2 | One sentence each + «vedi il capitolo 2»; ch.13 adds *when* and *in which process* |
| Mappatura as office configuration (import/export modelli) | ch.4, ch.7 | Ch.13 owns `mappature.php` **as code** (§ 4) |
| Tables `utenti`, `interventi`, `interventi_eseguiti`, `carichi`, `importazioni`; flexigrid and campi personalizzati | ch.3, ch.14 | Names only; schema → ch.14 |
| Profili, permessi, `rbac_enforce`, `Rbac::gate` as rule | ch.11 | § 2: the gate exists in `index.php` and is in sola registrazione today; one sentence + «vedi il capitolo 11» |
| Error screen with 8-character code, Admin pages, Giro register, Errori app | ch.12 | § 3 may name the global error handler and output buffer as architecture (`lib/BaseErrorHandler.php`, pattern 33) in ≤ 3 sentences; screen and diagnosis → «vedi il capitolo 12» |
| GOPlanner 3 API (`mobile_v3.php`, signed `/v3/` routes, envelope), API v2 / operations engine / MCP / console, Call Center, AI vision, Gea's service (`chatbot-service/`) | ch.15 | § 1 table row each (file, who calls, guard in one phrase) + «vedi il capitolo 15»; no route lists |
| Docker, tests, deploy, Swarm services, CloudWatch, PHP 8.4 migration, changelog | ch.16 | § 5 box: which processes must run (web, worker, Giro worker, schedulatore, ws-server) in ≤ 4 lines + «vedi il capitolo 16»; no deploy commands |
| Phone queue, `Ultimo invio`, heartbeat | ch.8 | Nothing (not needed) |

---

## NUFs (Goal Scoring)

Ten NUFs, so the Editor can score one point each against the 8.5/10 gate. Format per INSTRUCTION.md § Architect.

```
utility(reader): Reader can name GOPlanner's entry points and say for each who calls it, how it recognises the caller and where its code continues: `index.php` (pagine del gestionale, sessione), `json.php` (chiamate JSON del gestionale → `JSONController`), `json_admin.php` (solo staff tecnico, `AdminRequestGuard`), `json_android.php` and `api.php` (app 1.x, `MobileRequestGuard`), `mobile_v3.php` (GOPlanner 3, richieste firmate), `api_v2.php`, `api_cc.php`, `mcp.php`, `console.php` (capitolo 15), `worker.php`/`worker_job.php`, `cron.php`/`cron_worker.php`, `scheduler_giro.php` (solo riga di comando: dal web rispondono 403), `ws_server/index.js` (Node) → score += 1

utility(reader): Reader can follow `index.php?page=<pagina>` from the request to the HTML in order — `config.inc.php` (commessa e database) → `smarty.inc.php` (Smarty, delimitatori `{{ }}`) → sessione e cambio commessa (`SessioneTenant`) → menu → controllo dei permessi in sola registrazione → `pages/<pagina>.php`, che deve impostare `$template` → `Smarty_templates/<lingua>/` → filtro delle etichette `@@…@@` da `lib/dict/lang_it.php` → `Cache-Control: no-store` — and can read the two stop messages «missing … controller» and «missing template …» → score += 1

utility(reader): Reader can find, with a numbered procedure, every file behind something seen in the back office: the address gives `page` and `action` → `pages/<page>.php` and the branch of its `action` → `$template` → the template in `Smarty_templates/it/` → the script in `js/code/` → the `json.php?action=…` it calls → the public method of `JSONController` → the override in `custom/{tenant}/php/` (rule in ch.2) → score += 1

utility(reader): Reader can explain the two layers of `json.php`: `JSONController::call($action)` calls any callable method with that name and returns its JSON string, returns `false` when there is none (and then `json.php` falls into its older chain of `if ($_REQUEST['action'] == …)`), and answers «User not allowed» when no commessa is open; and applies the rule for new code: a new action is a public method of a controller that returns `json_encode(...)` and never uses `echo`, and every helper method is `private` → score += 1

utility(reader): Reader can read a commessa's `custom/{tenant}/php/mappature.php`: the import keys that `MappaturaImport` turns into «modelli di sistema» with id `sistema:<chiave>` (capitolo 4) and the export keys that become the modelli di sistema of File › Esportazione (capitolo 7), with one short real fragment without committente data — and knows that the saved modelli live instead in the commessa's database (`mappature_import`) → score += 1

utility(reader): Reader can trace a lavoro asincrono end to end with the real names: the page action calls `Queue::add(new <Job>(…))` → Redis list `job_queue` (or `job_giro`; delayed ones in `job_queue:ritardati`) → `worker.php` → `Queue::lavora()` → one fresh child process `worker_job.php` per job (GOP-687) → state on `AvanzamentoJob` → the page polls `json.php?action=job_stato` (`js/code/job-progress.js`) and can stop it with `job_annulla` → segnalibro in the side menu (GOP-743); knows the job classes in `lib/jobs/` and which `AvanzamentoJob::TIPI` are «annullabili» → score += 1

utility(reader): Reader can add a new lavoro asincrono that passes review — avanzamento registered in `AvanzamentoJob::TIPI` with `titolo`, a modale (own or the generic one), a segnalibro by passing the user's id to `AvanzamentoJob::avvia()` — following `docs/03-cookbooks/32-agganciare-un-job-alla-barra-di-avanzamento.md`, and knows the project rule verbatim: «Un nuovo lavoro asincrono non si accetta in revisione senza le tre parti» → score += 1

utility(emotional): Reader feels sure about the one trap that is invisible in a single request: a PHP process cannot unload a class, so once `Intervento` of commessa A is loaded, the same process cannot use `Intervento` of commessa B; the web is safe because one request opens one commessa, the worker is safe because every job is born in an empty process (`worker_job.php`, exec not fork), and the in-process mode left for tests is guarded by `ClassiCustom::verifica()` — so they can change an override knowing which process will pick it up → score += 1

utility(emotional): Reader knows where to stop: on a branch they add pages, actions, jobs and scripts themselves; the running processes (worker, Giro worker, schedulatore, ws-server), the queues in Redis, access to `json_admin.php`, and releases belong to the staff tecnico and to chapter 16; and when a document in `docs/` contradicts the code on `php8` they trust the code, record the contradiction, and do not "fix" the code to match the document → score += 1

utility(factual): The chapter states, each with its source: the web flow and the two stop messages (`index.php`); Smarty set-up and `{{ }}` delimiters (`smarty.inc.php`); the dispatch of `JSONController::call()` and the fallback chain (`lib/JSONController.php`, `json.php`); the guards of `json_admin.php`, `api.php`, `json_timbratori.php` (`lib/AdminRequestGuard.php`, `lib/MobileRequestGuard.php`; `docs/01-foundations/01-architecture-rules.md`); the queue names, the child process and the job timeout (`lib/Queue.php`, `worker.php`, `worker_job.php`; GOP-687, GOP-704); the job types and their «annullabile» flag (`lib/AvanzamentoJob.php`); the three-part rule (`docs/02-patterns/47-ogni-job-asincrono-avanzamento-modale-segnalibro.md`, GOP-743); the Giro schedulatore every 5 minuti on `job_giro` (`scheduler_giro.php`, GOP-656); the content hash in asset addresses (`lib/AssetUrl.php`, GOP-624); the websocket channel `batch_progress` (`lib/Batch.php`, `ws_server/index.js`) → score += 1
```

---

## BEAT LIST

Six sections (`##` in the final chapter). Each needs: the italic audience line at the top (STYLE_BIBLE § Voice rule 6 — here mostly «*Per gli sviluppatori.*», § 1 and § 5 «*Per gli sviluppatori e lo staff tecnico.*»), at least one exact concrete detail, at least one **Limite** paragraph, max 5 prose paragraphs in a row without a table/list/box/subheading/code block, 800–1.200 words per section. Code blocks: short, real, with the language declared (```php, ```bash), no secrets, at most one per section.

Before § 1 the Writer puts the mandatory `*In questo capitolo…*` paragraph (2–3 sentences): where a request enters GOPlanner and what every request does first; how a page, a JSON call and a lavoro in coda reach their code; for developers and coding agents on `php8` — the back office can skip the chapter, everything it needs is in chapters 1–12.

---

### § 1 — `## Molte porte, un solo codice: i punti d'ingresso`
**Tag:** [DEV] (italic line: *Per gli sviluppatori e lo staff tecnico.*)
**Core question:** Through which files does anything enter GOPlanner, and what do all of them do before any business logic?
**Word target:** 950 (range 850–1.100)
**Paragraph functions:** Aggancio (the opening case, see TARGET) → Spiegazione (one codebase, many doors, same three first steps) → Dimostrazione (the entry-point table) → contro-obiezione → Limite → Sintesi.

**Content plan**
- **Opening case (Aggancio):** one click on «Esporta» in File › Esportazione, followed through the code. The click crosses five files and two processes: `js/code/esportazione.js` posts to `json.php`; `JSONController` (public action → private `enqueueStandardExport()`) calls `Queue::add(new ExportInterventiJob(…))` and answers at once; `worker.php`, in another process, takes the job from Redis and runs it in a child `worker_job.php`; meanwhile the page asks `json.php?action=job_stato` how far it is. The page answered in well under a second; the file arrives minutes later from a process the user never sees. Close the hook by naming the chapter's map: doors (§ 1), pages (§ 2), JSON (§ 3), the commessa in the code (§ 4), the queue (§ 5), the browser (§ 6). **The Researcher must confirm the exact public action name and the job type** (`esportazione` in `AvanzamentoJob::TIPI`); if the path differs, the Writer follows the dossier, not this plan.
- **Spiegazione — the three first steps of every door:** (1) commessa and database: `config.inc.php` builds the database name from the session (`'goplanner_' . $_SESSION['user']['db']`, as in ch.2) — one sentence + «vedi il capitolo 2»; jobs do the same with `GOPlanner::bootstrapJobContext()`; GOPlanner 3 with `lib/MobileV3/TenantBootstrap.php`. (2) configuration in layers and the autoloader `goplannerAutoload` → `ClassiCustom::carica()` (order: ch.2). (3) hand-off by name to a controller.
- **Dimostrazione — table (one row per door; columns: «File» | «Chi lo chiama» | «Come riconosce chi chiama» | «Dove continua» | «Capitolo»):**
  - `index.php` — browser of the gestionale — session after login — `pages/<page>.php` + Smarty — 13 (§ 2)
  - `json.php` — scripts of the pages — session — `JSONController` (+ older chain) — 13 (§ 3)
  - `json_admin.php` — Admin pages — session + staff tecnico only (`AdminRequestGuard`: tenant amministratori and operatori get 403) — `ADMINController` — 12, 13
  - `json_android.php`, `api.php` — app GOPlanner 1.x — `key`/`sim_id` (`MobileRequestGuard`: 401 JSON when missing or empty) — `AndroidController`, `ApiController` — 15
  - `mobile_v3.php` — app GOPlanner 3 — signed requests (ch.8 named `GOP-Sig-1`) — `lib/MobileV3/` (Router, Kernel) — 15
  - `api_v2.php` (via `.htaccess` `^api/v2/`), `mcp.php`, `console.php` — agents and integrations — OAuth of the operations engine (`McpOAuth`) / CLI — `Operazioni*` (motore unico, ADR 42) — 15
  - `api_cc.php` — call center / voice assistant — 15
  - `worker.php` → `worker_job.php` — Docker service, CLI only — none from the web (403) — `Queue`, `lib/jobs/` — 13 (§ 5)
  - `cron.php` → `cron_worker.php --tenant=…`; `cron_daily.php` — system cron, CLI — loop over `clienti WHERE attivo=1` — 13 (§ 5), 16
  - `scheduler_giro.php` — Docker service `--ciclo`, CLI — enqueues on `job_giro` — 12, 13 (§ 5)
  - `ws_server/index.js` — Node + Socket.io — subscribes to Redis — 13 (§ 6)
  - Download/utility doors (`export.php`, `download.php`, `scarica_*.php`, `foto_upload.php`, `crash-report.php`, `acra-report.php`, `getconfig.php`…): **one row "altri" only**, with the rule the Researcher verifies (each includes `config.inc.php`; owners in ch.7/ch.15/ch.16). Do not list them all.
- **Contro-obiezione 1:** «Perché tante porte e non un unico punto d'ingresso?» → history, from the sources: the docs themselves mark `api/`, `json.php`, `json_admin.php`, `json_android.php` as **debito tecnico** to migrate into `*Controller.php` (`docs/01-foundations/02-project-structure-map.md`); new families of calls got their own door with their own guard (v3 signed requests, the operations engine). The rule for a developer is not to add a door, but to add a method behind an existing one (§ 3) — unless the Researcher finds an ADR saying otherwise.
- **CLI-only guard:** every script meant for the command line starts with `if (PHP_SAPI !== 'cli') { http_response_code(403); exit; }` (`worker.php`, `worker_job.php`, `scheduler_giro.php`; Researcher checks `cron.php`, `cron_worker.php`, `cron_daily.php`, `console.php` — if one lacks it, record in [CONFLICT]/[BLOCKED] per the security rule, say nothing in the chapter).

**Limite (mandatory):** the table covers the doors on `php8` at the research date; `chatbot-service/` (Gea's service) is a separate application with its own entry point, described in ch.15. The GOPlanner 3 routes are not listed here. Which doors are actually exposed in production (web server rules, `.htaccess`) is the staff tecnico's and ch.16's.

**Sintesi:** «Ogni porta fa per prima cosa le stesse tre cose: apre la commessa, carica la configurazione, passa la richiesta a un controller per nome.»

**Key facts the Researcher must find**
- The public action that triggers `enqueueStandardExport()` (`lib/JSONController.php` ~ line 2597) and the JS call in `js/code/esportazione.js`; job class `lib/jobs/ExportInterventiJob.php`; type `esportazione` (not annullabile).
- `.htaccess` rules (route `^api/v2/`, `^v3/` → `mobile_v3.php`?): only the routing rules, nothing else.
- `lib/AdminRequestGuard.php`, `lib/MobileRequestGuard.php`: exact status codes and the condition (`users.tipo === 0` or super-admin globale).
- Which root scripts carry the `PHP_SAPI` guard.
- Whether root `admin.php` (118 lines) and `pages/admin.php` are both live and how they relate (ch.12 uses `admin.php?action=…`).

---

### § 2 — `## Una pagina, dal clic all'HTML: index.php, pages/ e Smarty`
**Tag:** [DEV] (italic line: *Per gli sviluppatori.*)
**Core question:** What exactly happens between `index.php?page=interventi` and the HTML in the browser, and where does each step live?
**Word target:** 1.000 (range 900–1.200)
**Paragraph functions:** Spiegazione (the ordered steps) → Dimostrazione (code fragment) → Procedura (find the files of a page) → contro-obiezione → Limite → Sintesi.

**Content plan**
- **The steps, as a numbered list** (each with file and, where useful, line or ticket): 1. `config.inc.php` (commessa, database, `$custom` in layers — ch.2); 2. `smarty.inc.php`: Smarty object, `template_dir` = `Smarty_templates`, `caching = FALSE`, compiled files in `_compiled`, delimiters `{{` `}}`, `AssetUrl::registraInSmarty()` (GOP-624), default variables (`jquery_ui` true, GOP-496); 3. `lib/common.inc.php`, `lib/class.MyWrapper.php`, connection; 4. `page` from the request, default `$DEFAULT_PAGE`; `index` → `login`; 5. session and commessa switch (`SessioneTenant::switchTenant()`, GOP-107) and the special routes the Researcher confirms (GOP-855: the Magazziniere is sent to `magazzino`; GOP-767: Magazzino in the top menu when v3 magazzino is on); 6. language: `template_dir .= '/' . $lang` (→ `Smarty_templates/it/`); 7. RBAC view gate `Rbac::gate(Permessi::permessoVista($page), …)` — **in sola registrazione** while `rbac_enforce` is off (GOP-112), exceptions `novita` and `ticket` (GOP-712, GOP-758) → one sentence + «vedi il capitolo 11»; 8. `require_once "pages/".$page.".php"` — the controller **must** set `$template`; 9. after the controller: campanella, «Ticket» menu count, logo, Admin entry (GOP-601); 10. `header('Cache-Control: no-store')` (GOP-624) and `$smarty->display($template)`; 11. output filter: every `@@etichetta@@` is replaced from `lib/dict/lang_<lingua>.php`.
- **Dimostrazione — short real fragment** (```php, ≤ 8 lines) of the controller hand-off and the two `die()` messages, copied from `index.php` by the Researcher. Explain the two messages: «missing <page> controller» = no readable `pages/<page>.php`; «missing template …» = the controller did not set `$template` or the file is not in `Smarty_templates/<lingua>/`.
- **One controller, many actions:** `pages/` has a few dozen files (Researcher: exact count on `php8`), far fewer than the voci of the menu; a page file branches on `action` (e.g. `pages/interventi.php`, `pages/admin.php?action=…`). Researcher picks **one** real example of a branch.
- **The label filter as a surprise for developers:** an `@@token@@` not found in the dictionary is **appended** to `lib/dict/lang_<lingua>.php` by `DizionarioVoce::appendi()` and shown as is. Consequence for a developer: a typo in a label creates a new dictionary line. (Researcher verifies the behaviour and whether the file is writable in production; if unverified, the Writer drops this point.)
- **Procedure `### Trovare i file di una pagina`** (numbered, one action per step): 1. read `page` (and `action`, if any) in the address bar; 2. open `pages/<page>.php` and find the branch of that `action`; 3. note the value given to `$template`; 4. open it in `Smarty_templates/it/`; 5. in the template find the scripts (`js/code/<nome>.js`, loaded with `{{asset …}}`); 6. in the script find the `json.php?action=…` calls → § 3; 7. before changing a class in `lib/`, check whether `custom/{tenant}/php/` redefines it (rule: ch.2).
- **Contro-obiezione 2:** «Ho aggiunto `pages/nuova.php` ma la pagina non compare nel menu.» → the controller and the menu are separate: the voci come from the menu configuration (`$custom['menu']`, `lib/Menu*.php`, e.g. `lib/MenuInterventi.php` cited in ch.1) and from permessi (ch.11); a page reachable by address is not yet a voce. Researcher confirms where a new voce is declared.

**Limite (mandatory):** templates have no per-commessa override (ch.2; the documentation diagram that draws one is wrong on `php8`); a page that must differ for one commessa does it through configuration, `custom.js` or a class override. The RBAC gate in `index.php` does not block today (ch.11). The Smarty in use is an old major version (Researcher: exact version from `Smarty/`; the code comment at `index.php` ~ line 193 says «Smarty (2.x, questo progetto)»): syntax found in recent Smarty documentation may not work — check the existing templates first.

**Sintesi:** «Una pagina è sempre la stessa terna: `pages/<page>.php` decide i dati e il modello, `Smarty_templates/<lingua>/` li disegna, `js/code/` li fa vivere.»

**DEV detail allowed (the whole chapter is DEV, no box needed):** `MyWrapper` vs `SimpleOrm` vs `MainOrm` in one sentence + «vedi i capitoli 2 e 14»; `users` = utenti (persone), `utenti` = utenze (glossary trap 2).

**Key facts the Researcher must find**
- `index.php`: line numbers of each step listed above; the exact `die()` texts; where `$DEFAULT_PAGE` is set and its value; how `$lang` is chosen.
- Validation of `page` (security rule in the Continuity section).
- `pages/` count; one real `action` branch; `$template` assignment example.
- `lib/AssetUrl.php`: `{{asset path=…}}` → `?v=<hash del contenuto>`; `{{custom_js}}`.
- `lib/DizionarioVoce.php::appendi()` behaviour.
- Smarty version (`Smarty/libs/Smarty.class.php` header or `SMARTY_VERSION`).
- Where menu voci are declared for a new page (`$custom['menu']`, `$MENU`, `lib/Menu*.php`).

---

### § 3 — `## Le chiamate JSON: dall'action al metodo del controller`
**Tag:** [DEV] (italic line: *Per gli sviluppatori.*)
**Core question:** How does `json.php?action=x` become a PHP method, what happens when the method does not exist, and where does a new action go?
**Word target:** 950 (range 850–1.150)
**Paragraph functions:** Spiegazione (two layers) → Dimostrazione (`call()` fragment) → Spiegazione (other controllers and `lib/` layout) → contro-obiezione → Limite → Sintesi (the rule for new actions).

**Content plan**
- **Layer 1 — the controller.** `json.php` builds `new JSONController($db, $configurazione, $User)` and calls `call($_REQUEST['action'])`. `call()`: no commessa in `configurazione->account` → `{"success":false,"message":"User not allowed"}`; a callable method with that name → its return value; otherwise `false`. A non-empty string is printed by `json.php` after `ob_clean()` with `Content-type: application/json`, `Content-Length`, `Cache-Control: no-store`, then `die()`.
- **Dimostrazione — fragment** (```php, ≤ 10 lines) of `JSONController::call()` copied by the Researcher.
- **Layer 2 — the older chain.** When `call()` returns `false`, `json.php` continues into its own sequence of `if ($_REQUEST['action'] == '…')` blocks (the file is about 9.570 lines on the research date; Researcher gives the exact count and the number of such branches). This is the «debito tecnico» of the structure map. Rule: nothing new goes there.
- **The method contract** (`docs/01-foundations/01-architecture-rules.md`, `docs/02-patterns/05-controller-pattern.md`): methods **return** a JSON string (`return json_encode($data);`), never `echo`: the entry point prints. Consequence of the dispatch by name: **every callable method of the controller is an action reachable by name**, so helpers are `private` (example in the code: `enqueueStandardExport()` is private). State it as a design rule; no abuse scenario (security rule).
- **The other controllers:** about twenty `lib/*Controller.php` (Researcher: exact count and list), each with its own `call()`; some take more arguments (`ImportazioneController::call($method, array $request, array $files)`). One table or bulleted list with 6–8 of them and the door they sit behind (`ADMINController` ← `json_admin.php`; `AndroidController` ← `json_android.php`; `ApiController` ← `api.php`; `ImportazioneController` ← File › Importazione; `MagazzinoDdtController` ← `magazzino_ddt_json.php`; `MappatureImportController` ← `mappature_json.php`; `OperazioniController`/`ConsoleController` ← operations engine, ch.15).
- **The importazione as code (promise of ch.4):** File › Importazione → `ImportazioneController` (page and queue) → `ImportazioneJob` in coda (tipo `importazione`, annullabile, `allarme_fermo`: 30 minuti in coda = guasto, GOP-745) → `ImportazioneEsecuzione` (righe e scarti) → registro `importazioni` (`ImportazioneRegistro`). Tables `carichi`, `carichi_righe`: names only + «vedi il capitolo 14». Max 6 lines, ideally a numbered chain.
- **The shape of `lib/`:** ~480 files (Researcher: exact count), mostly flat global classes (`class.MyWrapper.php`, `SimpleOrm`, `MainOrm`, domain classes `InterventoBase`, `UtenzaBase`, `CaricoBase`, services), `lib/jobs/` for jobs, `lib/dict/` for labels, and namespaced subtrees with their own autoload (`lib/MobileV3/autoload.php`: `Router`, `Kernel`, `TenantBootstrap`…). One sentence: the two styles coexist; new GOPlanner 3 code follows the namespaced one (Researcher verifies with docs).
- **Errors as architecture (≤ 3 sentences):** a global error handler and an output buffer wrap the request (`lib/BaseErrorHandler.php`, `docs/02-patterns/33-buffer-output-globale-gestore-errori.md`): this is why a method that echoes or a warning printed before the JSON does not reach the browser as broken JSON — Researcher verifies the exact claim. The error screen and its code are ch.12 → pointer.
- **Contro-obiezione 3:** «La mia action risponde vuota.» → three causes, in order of likelihood, each verified by the Researcher: the method name does not match `action` (or the method is not callable) → `call()` returns `false` → the request ends in the older chain, which matches nothing; the method `echo`es instead of returning; no commessa in session → «User not allowed».

**Limite (mandatory):** `json.php` and the other legacy doors still serve production and work; the chapter does not call them broken and does not plan their rewrite (unless Jira has a ticket — Researcher). The dispatch by name has no list of allowed actions in `JSONController` (Researcher confirms) — stated only as the reason for the `private` rule. `json_admin.php` is the staff tecnico's (ch.12).

**Sintesi:** «Un'action nuova è un metodo pubblico di un controller che restituisce una stringa JSON; tutto il resto della classe è privato.»

**Key facts the Researcher must find**
- `lib/JSONController.php::call()` (line 36 on the Architect's read) and `json.php` ~ lines 283–305 (dispatch and headers): exact text.
- `json.php`: line count, number of `$_REQUEST['action'] ==` branches after the dispatch.
- `lib/*Controller.php` list and count; which entry point instantiates each (`git grep -n "new [A-Za-z]*Controller("`).
- `docs/02-patterns/05-controller-pattern.md` and `03-api-endpoint-pattern.md`: the rule "return, never echo"; whether they say anything about private helpers.
- Import chain: `lib/ImportazioneController.php`, `lib/jobs/ImportazioneJob.php`, `lib/ImportazioneEsecuzione.php`, `lib/ImportazioneRegistro.php`; GOP-745.
- `lib/BaseErrorHandler.php`, pattern 33: what the output buffer guarantees.

---

### § 4 — `## La commessa nel codice: quando entra l'override, e mappature.php`
**Tag:** [DEV] (italic line: *Per gli sviluppatori.*)
**Core question:** At which moment of a request or a job does the commessa's code take over, why can a process serve only one commessa, and how is `mappature.php` written?
**Word target:** 1.050 (range 900–1.200)
**Paragraph functions:** Spiegazione (one-sentence recap + pointer ch.2) → Spiegazione (the timing: first use of a class) → Dimostrazione (the GOP-687 case) → `###` subsection on `mappature.php` with a fragment → contro-obiezione → Limite → Sintesi.

**Content plan**
- **Recap in one paragraph, no repetition:** «L'ordine (commessa, tipo, comune per la configurazione; commessa, comune per le classi; `custom.js` in due pezzi; nessun modello di pagina per commessa) è nel capitolo 2.» Then only what is new here.
- **When the override takes effect:** the autoloader resolves a class **the first time** it is used in a process (`ClassiCustom::carica()`), from the commessa open at that moment. From then on, the name `Intervento` in that process means that file. PHP cannot unload or replace a class. Consequences: (a) the web is safe because each request opens one commessa and dies; (b) `$custom` is a global array filled at bootstrap — keys the Researcher lists (e.g. `menu`, `mobile`, `flexifields`, `mappature`, `chatbot_enabled`, `logo`) — with ch.2 pointer for the order; (c) any process that serves more than one commessa must not load commessa classes twice.
- **Dimostrazione — the real case GOP-687 (problem → cause → fix), told without data:** problem: the worker was one long-lived process that took jobs of different commesse one after the other; cause: a job of commessa A loaded A's class, and a later job of commessa B in the same process would have reused it (Researcher: the exact symptom or risk described in GOP-687 — do not dramatise beyond the ticket); fix: every job runs in a **new process** `worker_job.php`, started with exec (not fork), which reads the job as JSON on standard input and reports the outcome on a separate channel (fd 3), and dies with its classes and connections (`Queue::$sottoprocesso = true` by default). The in-process mode remains only for tests, guarded by `ClassiCustom::verifica()`, which refuses to mix commesse. Follow-up in the same file: the child starts empty, so it must load `vendor/autoload.php` itself — a job using a library from `vendor/` failed with «Class … not found» until it did (GOP-686 named in the comment of `worker_job.php`); composer's loader is safe in front of `goplannerAutoload` only because composer knows no application class (quote the condition from the comment).
- **`### Il file mappature.php`** (promises of ch.4 and ch.7):
  - where: `custom/{tenant}/php/mappature.php` (and `custom/default/php/mappature.php`, which ch.2 listed among the four files of `custom/default`); whether the `dbtype` folder's file is read too — Researcher.
  - what it declares: the array (Researcher: exact variable and top-level keys, e.g. `$custom['mappature']` per `docs/01-foundations/04-configuration-priority.md`), import keys vs export keys, and the fields of one entry.
  - how it is read: `MappaturaImport` turns each import key into a modello di sistema with id `sistema:<chiave>` (ch.4); the export side gives the modelli di sistema of File › Esportazione (ch.7) — Researcher: which class reads them (`EsportazioneModelli`? `MappatureEsportazioneController`?).
  - the contrast: saved modelli are rows of `mappature_import` in the commessa's database (migrazione 0012, ch.4) and change from the office without a release; modelli di sistema change only with a code change and a release (ch.16).
  - **Dimostrazione:** one short real fragment (```php, ≤ 12 lines) from a `mappature.php`, chosen by the Researcher from `custom/default` or another file **without** committente names, real column values that reveal a contract, or personal data; if every candidate contains such data, an invented fragment declared as invented, with the real key names only.
  - Cookbook pointers: `docs/03-cookbooks/02-create-import-export-map.md`, `docs/03-cookbooks/14-mappature-file-per-agent-coder.md`.
- **Contro-obiezione 4:** «Perché non tenere acceso un solo processo che cambia commessa a ogni lavoro? Sarebbe più veloce.» → because the class cannot be replaced (above); the cost is a new PHP process per job, accepted by GOP-687 (Researcher: any measured or stated cost in the ticket; otherwise say no figure).

**Limite (mandatory):** the override is resolved per process, not per call: a test or a script that loads two commesse in the same process gets the first one's classes (unless `ClassiCustom::verifica()` stops it). Templates cannot be overridden per commessa (ch.2). Changing `mappature.php` is a code change for the staff tecnico or a developer; the office changes saved modelli instead (ch.4, ch.7).

**Sintesi:** «Un processo, una commessa: la classe della commessa si sceglie al primo uso e non si cambia più fino alla fine del processo.»

**Key facts the Researcher must find**
- `lib/ClassiCustom.php`: `carica()`, `verifica()` (what it refuses and the message), `analizza()` only if needed.
- `lib/Queue.php` docblocks of `$sottoprocesso`, `$comandoFiglio`, `$timeoutJob`, `$avviaContesto`; `eseguiComeFiglio()`, `eseguiInFiglio()`; `worker_job.php` comment (fd 3, exec not fork, composer).
- GOP-687 and GOP-686 titles and the symptom/risk in the description.
- `mappature.php`: variable, keys, one fragment; reader classes for import (`lib/MappaturaImport.php`) and export.
- `$custom` top-level keys actually read by `index.php` and `config.inc.php` (`git grep -n "\$custom\['" -- index.php config.inc.php | cut -c1-120`).

---

### § 5 — `## Il lavoro che dura: coda, worker, Giro e avanzamento`
**Tag:** [DEV] (italic line: *Per gli sviluppatori e lo staff tecnico.*)
**Core question:** What happens to work that lasts longer than a response — who queues it, who runs it, how does the user follow it, and what runs on a timer?
**Word target:** 1.150 (range 1.000–1.200)
**Paragraph functions:** Spiegazione (queue and worker) → Dimostrazione (table of queues/processes) → Spiegazione (avanzamento, modale, segnalibro) → Procedura (add a new lavoro asincrono) → Spiegazione (timers: cron and schedulatore del Giro) → contro-obiezione → Limite → Sintesi.

**Content plan**
- **Queue and worker:** `lib/Queue.php` is «a simple Redis-backed job queue». `Queue::add(Job $job, $coda = null)` pushes the job (class + parameters + context) on a Redis list: `job_queue` (CODA_PREDEFINITA), `job_giro` (CODA_GIRO, GOP-656); delayed jobs go to `job_queue:ritardati` (`addDelayed()`, promoted by `promuoviRitardati()`). `worker.php` reads `QUEUE_NAME` (none = `job_queue`) and runs `Queue::lavora()`; each job runs in a child (§ 4). Jobs for an unknown commessa are not run (GOP-703: `ammettiTenant()`; the placeholder account `v3_non_autenticato` is not a commessa).
- **Stopping cleanly (GOP-687, GOP-704):** on SIGTERM, SIGINT and SIGWINCH (the stop signal of the php:apache image that `docker stop` and Swarm actually send) the worker finishes the current job and takes no other; needs the `pcntl` extension; the dedicated `job_giro` worker refuses to start without it (10-minute grace period); job timeout from `QUEUE_JOB_TIMEOUT` (0 or absent = no limit), then SIGTERM and SIGKILL after 10 s.
- **Dimostrazione — table «Processi che lavorano fuori dalla richiesta»** (columns: «Processo» | «Che cosa fa» | «Coda o orario» | «Dove si vede»): `worker.php` (default) | runs jobs | `job_queue` | avanzamento of the page/segnalibro; `worker.php` with `QUEUE_NAME=job_giro` | runs Giro jobs | `job_giro` | Admin › «Giro» (ch.12); `scheduler_giro.php --ciclo` | computes due jobs and enqueues them, runs nothing | every 5 minuti | Admin › «Giro»; `cron.php` → `cron_worker.php --tenant=<db>` | daily tasks per active commessa (+ purge of app anomalie older than 12 mesi, GOP-457) | system cron (Researcher: schedule source) | output of the script; `ws_server/index.js` | relays batch progress | Redis channel `batch_progress` | Admin page (§ 6). Plus the list of the job classes in `lib/jobs/` (17 on the Architect's read: Researcher gives the exact list; group them by owner chapter: esportazione ch.7, importazione ch.4, geocodifica, analisi AI ch.6/ch.12, consolidamento utenze ch.12, Stato commesse ch.12, riepilogo mensile — «una commessa» —, distanze delle zone ch.5).
- **`> **Attenzione:**`** one line on «Giro» (glossary trap 5).
- **Avanzamento, modale, segnalibro (GOP-743, pattern 47, contract pattern 41):** every lavoro asincrono has (1) an avanzamento on the common contract `AvanzamentoJob` (type in `AvanzamentoJob::TIPI` with `titolo`, `annullabile`, `permesso`; the seven types on the Architect's read: esportazione, geocodifica_utenze, riepilogo_mese, importazione, campo_nuovo, analisi_ai_data, chiusura_cassettinaggio — Researcher confirms; the last one exists for one commessa); (2) a modale, own or generic (`GopJobProgress` + esito); (3) a segnalibro: the starter's user id passed to `AvanzamentoJob::avvia()` puts the job in the side-menu stack of that user only (Redis key pattern `job_segnalibri:{account}:{id_utente}`, `js/code/job-segnalibri.js`). Colours: giallo in corso/«In attesa», verde completato, rosso non riuscito. The page **polls**: `js/code/job-progress.js` calls `json.php?action=job_stato` with a timer and stops a job with `job_annulla` (only for annullabili types). Quote the project rule verbatim: «Un nuovo lavoro asincrono non si accetta in revisione senza le tre parti.»
- **Procedure `### Aggiungere un lavoro asincrono`** (numbered, from `docs/03-cookbooks/32-agganciare-un-job-alla-barra-di-avanzamento.md`; Researcher supplies the exact steps): e.g. 1. class in `lib/jobs/` extending `Job`; 2. register the type in `AvanzamentoJob::TIPI`; 3. in the action, `AvanzamentoJob::avvia(…, id utente)` then `Queue::add(…)`; 4. in the job, update counters and esito; 5. modale: generic or own; 6. errors per `docs/03-cookbooks/35-errori-dei-job-in-background.md`; 7. test with the in-process mode (`Queue::$sottoprocesso = false`) only in tests.
- **Contro-obiezione 5:** «L'esportazione resta "In attesa" da dieci minuti.» → «In attesa» = still in the queue, nobody has taken it: the worker for that queue is not running or is busy with a long job; for the importazione, 30 minuti in queue raise an alarm to the staff (`allarme_fermo`, `AvanzamentoAllarme`); the developer cannot fix it from a branch → `> **Quando chiedere allo staff tecnico:**` box: the state of the worker services, the queue length, a job that never ends (ch.12 for the Giro register, ch.16 for the services).

**Limite (mandatory):** not every type is annullabile, and an annullamento stops between steps, it does not undo the steps done (e.g. the importazione keeps the pratiche already loaded); without `pcntl` the default worker stops at once on SIGTERM (the current job, in its child, still finishes — quote the comment); by default there is no job timeout. The schedulatore enqueues and runs nothing: if no `job_giro` worker runs, the Giro register fills with due jobs that nobody executes (Researcher verifies the visible state in Admin › «Giro»).

**Sintesi:** «Ciò che dura più di una risposta va in coda, gira in un processo suo e si fa vedere all'utente con avanzamento, modale e segnalibro.»

**`> **Per lo staff tecnico:**` box (max 4 lines):** which processes must be up for the chapter's flows to work — web, `queue-worker` (`job_queue`), the `job_giro` worker, the schedulatore, Redis, `ws-server` (only for the Admin batch tracker) — by **service names as in the compose files**, no hosts, no commands; «vedi il capitolo 16».

**Key facts the Researcher must find**
- `lib/Queue.php`: constants and methods named above, `ATTESA_CODA`, `LOG_BATCH_MAX_JOBS` (only if used); the exact docblock sentences.
- `worker.php` comments (GOP-656, GOP-687, GOP-704).
- `lib/AvanzamentoJob.php`: `TIPI` verbatim (types, flags, titles), `avvia()` signature; `lib/AvanzamentoAllarme.php`.
- `js/code/job-progress.js`: polling interval(s) (the code has `intervallo` and `intervallo * 2`); `job_stato`, `job_annulla` actions in `JSONController`.
- Pattern 41, pattern 47 (decision of 10 novembre 2026, GOP-743), cookbook 32, cookbook 35.
- `scheduler_giro.php` header (modes `--ciclo`, `--elenco`, `--avvia`), interval 5 minuti, `GiroSchedulatore`, pattern 44.
- `cron.php`, `cron_worker.php`, `cron_daily.php`: what each does; where the system cron schedule is defined (Dockerfile/crontab file) — no hosts.
- `lib/jobs/` exact list.
- Service names in `docker-compose*.yml` for worker, Giro worker, schedulatore, ws-server (names only).

---

### § 6 — `## Nel browser: script delle pagine, asset e websocket`
**Tag:** [DEV] (italic line: *Per gli sviluppatori.*)
**Core question:** What runs in the browser, how does a changed script reach it, and what is the websocket server really used for?
**Word target:** 850 (range 800–1.000)
**Paragraph functions:** Spiegazione (`js/code/`, libraries) → Dimostrazione (asset hash) → Spiegazione (websocket, honestly scoped) → contro-obiezione → Limite → Sintesi → closing paragraph (TARGET).

**Content plan**
- **`js/code/`:** one script per page or feature (rule, no exhaustive list — security), served through `js/code/js.php` (dispatcher; `custom.js` assembly → ch.2) and loaded by templates with `{{asset path=…}}`. Libraries: jQuery (Researcher: which version the header actually loads — `js/` contains several old copies; only the loaded one matters), jQuery UI loaded only where the page needs it (`jquery_ui`, GOP-496), flexigrid for the grids (concept → ch.14), chart and map libraries only if the dossier needs them.
- **Asset addresses (GOP-624):** `{{asset path="/css/ui.css"}}` becomes `/css/ui.css?v=<hash del contenuto>`: a changed file gets a new address, so the browser cannot keep the old one; `custom.js` is per commessa in session (403 otherwise) and cached 24 ore (ch.2). Pages themselves are `no-store` (§ 2).
- **Visual layer (≤ 3 sentences, only if the dossier confirms):** design tokens (`tokens.json`, `build-tokens.mjs`, pattern 20) and the Industry 2 visual adapter (pattern 23) — names only, pointer to the docs.
- **Websocket, scoped exactly:** `ws_server/index.js` is a small Node server (Socket.io) that subscribes to the Redis channel `batch_progress` and relays messages to browsers. `lib/Batch.php` publishes on that channel when a `Batch` (a group of jobs, `Batch::dispatch()`) advances. The only consumer found by the Architect is the Admin page (`Smarty_templates/it/admin.html` loads the Socket.io client; on failure the console says «Unable to load socket.io client for batch tracking.»). The avanzamento of the user's lavori (§ 5) **does not** use the websocket: it polls `job_stato`. Say plainly that some documents (`docs/01-foundations/01-architecture-rules.md`, pattern 17) describe the websocket as the channel of job progress, and that on `php8` it is not.
- **Contro-obiezione 6:** «Ho cambiato un file JavaScript e il browser carica ancora il vecchio.» → check that the template loads it with `{{asset …}}` (new hash) and not with a fixed address; `custom.js` has its own 24-ore cache keyed on the files' fingerprint (ch.2). Researcher verifies whether any template still loads scripts without `asset`.

**Limite (mandatory):** if the ws-server is not running, Admin batch counts do not update live, but jobs run and their state is still readable (Researcher verifies what the Admin page falls back to, if anything); whether the ws-server is deployed in production is the staff tecnico's / ch.16's (`[UNVERIFIED]` if no source). The old jQuery copies in `js/` are not a statement about what pages load.

**Sintesi + closing:** see TARGET (closing paragraph after the § 6 Sintesi, before `## Fonti`).

**Key facts the Researcher must find**
- `js/code/js.php` (what it serves besides `custom.js`), `lib/AssetUrl.php`, `Smarty_templates/it/_header.html` and `_footer.html` (which libraries are loaded and how).
- `ws_server/index.js` (channel, what it emits — no hosts, no CORS discussion), `lib/Batch.php` (lines publishing `batch_progress`), `Smarty_templates/it/admin.html` (~ line 621), `test_ws.html` (only to confirm it is a test page; do not cite).
- `git grep -l "socket.io"` in templates and `js/code/`: list of real consumers.
- Patterns 16 (JavaScript loading), 17 (job batching and websocket), 20 (design tokens), 23 (Industry visual adapter): which statements are current.

### Closing (no separate `##`: last paragraph of § 6, before `## Fonti`)
The design rule of TARGET, in 3–4 sentences, no echo of ch.2 (do **not** end on «guarda prima `custom/`»).

### `## Fonti`
Built by the Writer from the dossier entries actually used, in the STYLE_BIBLE format (`codice: …`, `wiki: …`, `docs: …`, `Portolano: …`, `Jira: GOP-NNN — titolo breve`). Every Jira key with its short title. No host names, no file whose name contains a host name, no credentials files.

---

## REVIEWER READINESS NOTES

### Tension points (where the chapter must create real stakes)
1. **One process, one commessa (§ 4, § 5).** Stakes: in a long-lived process, the class of commessa A can serve a job of commessa B, which then runs another commessa's rules on its own data; nothing fails visibly. Build-up: autoload at first use (§ 4) → the GOP-687 case → the child process per job (§ 5). Resolution: a rule the reader can apply (one process, one commessa; tests use the guarded in-process mode), not fear of the worker.
2. **The silent fall-through of `json.php` (§ 3).** Stakes: an action name that does not match a method does not raise an error; the request slides into thousands of lines of older code and comes back empty; and because the dispatch is by name, a helper left public becomes an action. Resolution: the three-line contract (public method, return a JSON string, helpers private) and the diagnosis order of the counter-objection.
3. **Documents that describe another system (§ 2, § 4, § 6).** Stakes: a new developer — or a coding agent, which reads `docs/` first — follows the documentation and builds a per-commessa template that never loads, a `custom/{dbtype}/php/` class nobody reads, or a websocket listener for job progress that never fires. Resolution: the chapter names each drift with the code that wins, and the § «Limite» lines say so; the [CONFLICT] list below is the Reviewer's checklist.
4. **Work the user cannot see (§ 5).** Stakes: a lavoro asincrono without segnalibro disappears when the modale closes; the user starts it again and the commessa gets two files or two importazioni. Resolution: the three-part rule, quoted, and the procedure to add a job.

### Key chains to make explicit (cause → consequence → reader action)
- Address `page=X` → `pages/X.php` must set `$template` → otherwise «missing template …» → open the controller and the `action` branch first.
- Template looked up only in `Smarty_templates/<lingua>/` → no per-commessa copy is read → change a page for one commessa through configuration, `custom.js` or a class override (ch.2).
- `action=x` → `JSONController::call('x')` → method exists: its JSON string is printed; no method: `false` → older chain → empty response → check the method name and that it returns, not echoes.
- Dispatch by name → every callable method is an action → helpers `private`.
- Class resolved at first use → fixed for the life of the process → the worker runs each job in a new process → an override change is picked up by the next job (Researcher verifies; the parent `worker.php` keeps its own loaded code until restarted — state only if sourced).
- Child process starts empty → must load `config.inc.php` and `vendor/autoload.php` itself → «Class … not found» if a library is missing (GOP-686/687).
- Work longer than a response → `Queue::add()` → Redis list → worker → child → `AvanzamentoJob` → page polls `job_stato` → segnalibro after the modale closes.
- Schedulatore every 5 minuti → enqueues on `job_giro` → only a worker with `QUEUE_NAME=job_giro` runs them → no such worker = due jobs pile up in the Giro register (ch.12).
- `Batch` advances → Redis `batch_progress` → ws-server → Admin page only → user avanzamento unaffected if the ws-server is down.
- File changed → content hash changes in `?v=` → browser fetches the new file → a script loaded without `{{asset}}` may stay stale.

### Risk proportionality guards (each risk paired with its balancing context)
- **`json.php` older chain / «debito tecnico»** → balance in the same paragraph: it serves production every day and works; the rule concerns only where *new* code goes; no rewrite is claimed or promised unless a Jira ticket says so.
- **Dispatch by name / public methods reachable** → balance: `call()` answers only with a commessa open in the session (`User not allowed` otherwise) and `json.php` runs after the session bootstrap; the `private` rule is a design habit. No abuse scenario anywhere (security rule).
- **Tenant classes in long-lived processes (GOP-687)** → balance: fixed; the worker runs every job in its own process; the in-process mode is for tests and guarded by `ClassiCustom::verifica()`.
- **RBAC gate in sola registrazione** → balance (one sentence, ch.11 owns it): menu of the commessa and the older level still block; `json_admin.php` is guarded on the server regardless.
- **No job timeout by default; no graceful stop without `pcntl`** → balance: `QUEUE_JOB_TIMEOUT` exists; the current job finishes in its child even when the parent is killed (quote the comment); the dedicated Giro worker refuses to start without `pcntl` so the fault shows at once.
- **Websocket "not used for progress"** → balance: progress works through polling; the websocket adds only live counts in one Admin page.
- **Old library copies in `js/`** → balance: only what `_header.html` loads matters; no security claims about versions.
- **Docs that contradict the code** → balance: most documents in `docs/` are accurate and dated; the chapter names the specific drifts and does not tell the reader to distrust the documentation in general.
- **`DizionarioVoce::appendi()` writing labels** → balance: only if the dossier confirms the behaviour; state what it is for (new labels appear instead of breaking the page), not as a defect.

### Counter-objections planned (STYLE_BIBLE requires ≥ 2; six are planned, at least four must survive in the final text)
1. § 1 — «Perché tante porte e non un unico punto d'ingresso?»
2. § 2 — «Ho aggiunto `pages/nuova.php` ma la pagina non compare nel menu.»
3. § 3 — «La mia action risponde vuota.»
4. § 4 — «Perché non tenere acceso un solo processo che cambia commessa a ogni lavoro?»
5. § 5 — «L'esportazione resta "In attesa" da dieci minuti.»
6. § 6 — «Ho cambiato un file JavaScript e il browser carica ancora il vecchio.»

### Litmus test for this chapter
A new developer (or coding agent), with only this chapter, can: given the address of a back-office page and a button on it, name the controller file, the template, the script and the controller method involved; add a JSON action in the right place with the right contract; add a lavoro asincrono with avanzamento, modale and segnalibro; explain why a job must not run in the same process as a job of another commessa; say which processes must be running for an esportazione to finish; and name at least two statements in `docs/` that the code on `php8` contradicts.

### Format checks the Reviewer should run on this chapter
- One H1 `# 13. Architettura di GOPlanner su PHP 8`; «*In questo capitolo*» paragraph; six `##` sections; `## Fonti` last.
- Every section starts with its italic audience line; every section has a Limite paragraph.
- Code blocks ≤ 12 lines, language declared, copied from the dossier, no secrets, no host names.
- The entry-point table and the process table are standard pipe tables with single-line cells.
- «tenant» only for code, with the correspondence stated once; «sviluppatore» never used for staff tecnico; «Giro» always qualified.
- No echo of ch.2's closing; no announcement of chapter 14.

---

## RESEARCHER BRIEF

**Web search terms:** none. INSTRUCTION.md § Researcher, SOURCE OVERRIDE: the web is not a source for this book (public PHP/Smarty/Redis/Socket.io documentation only if strictly needed to explain one term, and cited as such). Use only the sources below, in priority order. The GOPlanner repository (`/home/alan/firstmate/projects/GOPlanner`, branch `php8`) is READ ONLY: Read/Grep/`git grep`/`git log`/`git show` only; no checkout, pull, stash, composer, npm, no running scripts.

### Documents to prioritize (in order)
1. **Code on `php8`** (authority): `index.php`, `json.php`, `lib/JSONController.php`, `lib/Queue.php`, `worker.php`, `worker_job.php`, `lib/AvanzamentoJob.php`, `lib/ClassiCustom.php`, `smarty.inc.php`, `scheduler_giro.php`, `ws_server/index.js`, `lib/Batch.php`.
2. **Recent decision records** (dated, more reliable than foundations): `docs/02-patterns/47-ogni-job-asincrono-avanzamento-modale-segnalibro.md`, `41-avanzamento-job-asincroni.md`, `44-giro-giornaliero-a-job.md`, `42-motore-unico-operazioni-console-api-mcp.md` (only for the § 1 row), `33-buffer-output-globale-gestore-errori.md`.
3. **Foundations** (older; check each load-bearing statement against code): `docs/01-foundations/01-architecture-rules.md`, `02-project-structure-map.md`, `04-configuration-priority.md`, `05-key-class-definitions.md`, `08-ui-ux-architecture.md`; diagrams `docs/diagramma_architettura_goplanner.md`, `docs/diagramma_flusso_web_mvc.md`, `docs/diagramma_override_multi_tenant.md`, `docs/diagramma_flusso_api_mobile.md`.
4. **Cookbooks:** `docs/03-cookbooks/32-agganciare-un-job-alla-barra-di-avanzamento.md`, `35-errori-dei-job-in-background.md`, `09-rest-api-controller.md`, `12-tenant-bootstrap-modulo.md`, `02-create-import-export-map.md`, `14-mappature-file-per-agent-coder.md`, `24-ticket-azioni-json.md` (only as an example of adding JSON actions), `01-add-new-client.md` (only what ch.2 did not use).
5. `docs/00-concept-index.md`, `docs/README.md`, `docs/RECENT-LEARNINGS.md` (for recent architectural facts), repository `AGENTS.md` / `CLAUDE.md` (rules given to coding agents about where code goes — cite only rules, nothing personal or secret).
6. Portolano, then Jira.

### Wiki paths
- `wiki/index.md` (start), `wiki/documentation/documentation-architecture.md` (how docs/wiki are organised — only if it states which source is authoritative).
- `wiki/assistenza-clienti/pagina-admin-giro-stato-commesse.md` (only the Giro register as the visible face of `job_giro`; one sentence).
- `wiki/assistenza-clienti/pagina-file.md`, `wiki/assistenza-clienti/pagina-analisi-file.md` (only for the visible states of an importazione in coda: «In attesa», segnalibro).
- The wiki is mostly for the office; for ch.13 it is a secondary source.

### Docs paths (complete list for this chapter)
- `docs/01-foundations/01-architecture-rules.md`, `02-project-structure-map.md`, `04-configuration-priority.md`, `05-key-class-definitions.md`, `08-ui-ux-architecture.md`
- `docs/02-patterns/02-customization-pattern.md`, `03-api-endpoint-pattern.md`, `04-error-handling-solutions.md`, `05-controller-pattern.md`, `08-async-job-queue-pattern.md`, `11-admin-routing.md`, `16-javascript-loading-and-architecture.md`, `17-job-batching-and-websocket.md`, `20-design-tokens-material-solid.md`, `23-industry-visual-adapter.md` (long: read only the summary), `33-buffer-output-globale-gestore-errori.md`, `41-avanzamento-job-asincroni.md`, `44-giro-giornaliero-a-job.md`, `47-ogni-job-asincrono-avanzamento-modale-segnalibro.md`
- `docs/diagramma_*.md` (four listed above)
- `docs/03-cookbooks/` (six listed above)

### Code paths and grep patterns (read-only)
- Entry points: `index.php`, `json.php`, `json_admin.php`, `json_android.php`, `api.php`, `api_v2.php`, `api_cc.php`, `mobile_v3.php`, `mcp.php`, `console.php`, `admin.php`, `export.php`, `worker.php`, `worker_job.php`, `cron.php`, `cron_worker.php`, `cron_daily.php`, `scheduler_giro.php`; `.htaccess` (routing lines only).
  - `git grep -n "PHP_SAPI" -- '*.php' ':!vendor' ':!lib'` (which root scripts are CLI-only)
  - `git grep -n "new [A-Za-z]*Controller(" -- '*.php' ':!vendor'` (which door instantiates which controller)
- Web flow: `smarty.inc.php`, `lib/AssetUrl.php`, `lib/DizionarioVoce.php`, `lib/SessioneTenant.php` (`switchTenant`), `lib/Rbac.php` (`gate`, one sentence), `lib/Permessi.php` (`permessoVista`), `lib/Menu*.php` (where a voce is declared), `pages/` (count; one `action` branch, e.g. `pages/interventi.php`), `Smarty_templates/it/_header.html`, `_footer.html`.
  - `git grep -n "\$template *=" -- pages | head`
  - `git grep -n "\$page" -- index.php` (validation of `page`: security rule)
- JSON layer: `lib/JSONController.php` (`call`, `enqueueStandardExport`, `job_stato`, `job_annulla`), `json.php` (dispatch lines and the count of `$_REQUEST['action'] ==` branches: `grep -c "\$_REQUEST\['action'\] *==" json.php`), `lib/ADMINController.php`, `lib/AdminRequestGuard.php`, `lib/MobileRequestGuard.php`, `lib/ImportazioneController.php` (`call`), `lib/BaseErrorHandler.php`; `ls lib/*Controller.php`.
- `lib/` shape: `ls lib | wc -l`, `ls lib/jobs`, `ls lib/MobileV3`, `lib/MobileV3/autoload.php`, `lib/MobileV3/Router.php`, `Kernel.php`, `TenantBootstrap.php` (one sentence each).
- Commessa in code: `lib/ClassiCustom.php` (`carica`, `verifica`), `lib/GOPlanner.php` (`bootstrapJobContext`, `getAccount`), `config.inc.php` (only: autoloader registration and the include order lines ch.2 cited — **never** connection lines), `custom/default/php/mappature.php`, `lib/MappaturaImport.php`, export reader of `mappature.php` (`git grep -n "mappature.php" -- lib`).
- Queue and jobs: `lib/Queue.php`, `lib/Job.php`, `lib/JobContext.php`, `lib/jobs/*.php` (list), `lib/AvanzamentoJob.php` (`TIPI`, `avvia`), `lib/AvanzamentoAllarme.php`, `lib/GiroSchedulatore.php`, `lib/GiroRegistro.php`, `js/code/job-progress.js`, `js/code/job-segnalibri.js`.
  - `git grep -n "Queue::add(" -- lib pages json.php | wc -l` (how many places enqueue)
  - `git log --oneline --grep "GOP-687" | head`, same for GOP-704, GOP-703, GOP-743, GOP-745, GOP-656, GOP-624, GOP-496
- Browser: `js/code/js.php`, `js/code/esportazione.js` (the export click), `ws_server/index.js`, `ws_server/package.json` (Socket.io version only), `lib/Batch.php`, `Smarty_templates/it/admin.html` (Socket.io client), `tokens.json`/`build-tokens.mjs` (names only).
  - `git grep -l "socket.io" -- Smarty_templates js/code` (real consumers)
- Compose service names (names only): `git grep -n -E "^  [a-z0-9_-]+:$" -- 'docker-compose*.yml'`.
- **Do not open:** credentials JSON files at the root, `.env*`, `tunnel.env`, `Makefile` beyond service names already known, deploy scripts, `docker-data/`, `state/`, `raw/`, `scratch/`, the saved web page inside `js/code/`.

### Portolano queries (`mcp__rag_qdrant_server__query_rag_hybrid` with `user_roles: ""` — the EMPTY string, per INSTRUCTION.md; `user_roles: "goplanner"` filters everything out. Fall back to `query_rag`.)
- «flusso richiesta index.php pages Smarty template controller»
- «json.php JSONController call action metodo pubblico»
- «json.php azioni legacy debito tecnico migrazione controller»
- «coda Redis job_queue worker processo figlio worker_job GOP-687»
- «classi personalizzate tenant caricate una volta processo ClassiCustom verifica»
- «AvanzamentoJob avanzamento modale segnalibro lavoro asincrono»
- «schedulatore giro job_giro ogni 5 minuti registro»
- «spegnimento ordinato worker SIGTERM SIGWINCH pcntl»
- «websocket ws_server socket.io batch_progress»
- «AssetUrl hash contenuto cache custom.js GOP-624»
- «mappature.php struttura chiavi importazione esportazione modelli di sistema»
- «punti di ingresso api.php json_android mobile_v3 api_v2 mcp»

### JQL fragments (cloudId `21873985-2e5d-4a8a-bb45-e6d453128985`, project GOP, READ ONLY)
- `project = GOP AND key in (GOP-107, GOP-112, GOP-457, GOP-496, GOP-601, GOP-624, GOP-629, GOP-656, GOP-686, GOP-687, GOP-703, GOP-704, GOP-712, GOP-743, GOP-744, GOP-745, GOP-758, GOP-767, GOP-855)`
- `project = GOP AND text ~ "worker" ORDER BY updated DESC`
- `project = GOP AND text ~ "json.php" ORDER BY updated DESC` (is a migration of the older chain planned?)
- `project = GOP AND text ~ "websocket" ORDER BY updated DESC` (is the ws-server planned to change or be removed?)
- `project = GOP AND text ~ "Smarty" ORDER BY updated DESC` (any planned upgrade — the chapter must not present it as done)
- Purpose: short titles for `## Fonti`; the real case of GOP-687 (problem → cause → fix) and GOP-686; whether anything in § 3 or § 6 is planned rather than live.

### Specific facts, numbers and labels to hunt
- Counts on the research date: files in `lib/`, `pages/`, `lib/jobs/`, `lib/*Controller.php`; lines of `json.php`; legacy `action` branches in `json.php`; places calling `Queue::add(`.
- `index.php`: the two `die()` texts; `Cache-Control: no-store`; `@@…@@` filter; default page.
- `smarty.inc.php`: delimiters `{{ }}`, `caching = FALSE`; Smarty version.
- `JSONController::call()`: the «User not allowed» JSON verbatim.
- Queue names `job_queue`, `job_giro`, `job_queue:ritardati`; `QUEUE_NAME`; `QUEUE_JOB_TIMEOUT`; SIGKILL after 10 s; Giro worker grace period 10 minuti; signals SIGTERM, SIGINT, SIGWINCH.
- `AvanzamentoJob::TIPI` verbatim; `allarme_fermo` 30 minuti; the three-part rule sentence verbatim; segnalibro key pattern; colours.
- `job-progress.js` polling interval (ms) and back-off.
- `scheduler_giro.php` cycle: 5 minuti; modes.
- `cron.php`: «anomalie … conservate 12 mesi» (GOP-457).
- `AssetUrl`: `?v=<hash>`; `custom.js` 24 ore (from ch.2's dossier, re-verify).
- Socket.io client failure message in `admin.html` verbatim.

### Mandatory [CONFLICT] items to record
1. `docs/01-foundations/01-architecture-rules.md` («Real-time Monitoring: … job asincroni … tramite WebSocket») and pattern 17 vs code: user job progress polls `json.php?action=job_stato` (`js/code/job-progress.js`); the websocket serves only `Batch` progress in the Admin page.
2. `docs/diagramma_override_multi_tenant.md`: `custom/{dbtype}/php/Classe.php` level and template override `custom/{cliente}/templates/*` vs `ClassiCustom::carica()` (two levels) and `template_dir = Smarty_templates/<lingua>` (consistent with ch.2's finding; record again with ch.13's sources).
3. `docs/01-foundations/01-architecture-rules.md` says `index.php` «carica la configurazione da `custom/{nome_cliente}/config.inc.php`» vs the include happening in `config.inc.php` (ch.2: righe 436-441).
4. `docs/01-foundations/02-project-structure-map.md` speaks of «Template `.tpl`» vs the real template extension in `Smarty_templates/it/` (verify).
5. `docs/01-foundations/04-configuration-priority.md`: `Configurazione` «istanziato manualmente nei controller delle pagine» vs where it is actually built (`index.php`? `config.inc.php`?).
6. `docs/01-foundations/01-architecture-rules.md` «Autentica la richiesta (solitamente tramite `key` API)» vs today's doors (session, signed `/v3/` requests, OAuth for API v2/MCP, CLI).
7. `docs/02-patterns/08-async-job-queue-pattern.md` vs `lib/Queue.php` after GOP-687/GOP-703/GOP-704 (child process, tenant admission, graceful stop): record what the pattern omits or contradicts.
8. Smarty version: code comment «Smarty (2.x, questo progetto)» vs the `Smarty/` folder (and `Smarty_old/`): which one is loaded (`$SMARTY_DIR`).
9. `docs/01-foundations/02-project-structure-map.md` names the RAG pipeline files at the root as current; check whether they are still used (one line; the chapter does not need them — record only).
10. Any contradiction between ch.1/ch.2 final text and the code found while researching (e.g. the flow line in ch.1's DEV box) — for the Reviewer.

### Security filter reminder
No credentials, connection values, keys, tokens, account numbers, ARNs, registry addresses, regions with account context, host names or IPs (Makefile, deploy scripts, `config*.inc.php`, `index.php` default widget address, Makefile comments with domains). Never open or name the service-account JSON at the root. Never name the file in `js/code/` whose name contains a host. No committente names from page file names or code comments: «una commessa». No exploit or abuse description of any weakness: `[BLOCKED: needs human input — …]` with a neutral one-line description only. No AI vendor or model names. No personal names from code headers (e.g. author lines in file headers) or commits.

---

## TARGET

- **Word count:** 5.600–5.900 words in total (PRD § 4: 4.000–6.000). Breakdown: «In questo capitolo» ~80; § 1 950; § 2 1.000; § 3 950; § 4 1.050; § 5 1.150; § 6 850 (closing included); `## Fonti` ~180.
- **Opening hook strategy:** open § 1 on a single click on «Esporta» followed through the code — five files and two processes in under a second, then minutes of work in a process the user never sees — so that the reader holds the whole map of the chapter (door, controller, queue, worker, browser) before the first table.
- **Closing beat promise:** end § 6 on a design rule for new code that echoes no earlier chapter — before writing the first line, choose the door: a page, a JSON action, a route of GOPlanner 3 or a lavoro in coda; the door decides who may enter, which commessa is open, how long the work may last and where the user will see it finish.
