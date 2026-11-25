# Chapter 16 — Struttura (Architect spec)

**Chapter title (H1 for the Writer):** `# 16. Operazioni, qualità e rilasci` (chapter 8 already points to it with this exact title: «capitolo 16, *Operazioni, qualità e rilasci*»).
**PRD row:** «Come si porta una modifica in produzione: ambiente locale Docker, test (headless, E2E, mobile), Jira come registro dei task, rilascio e deploy su AWS, changelog per tenant, log e osservabilità (CloudWatch, canale mobile), migrazione PHP 8.4» — audience **DEV** (sviluppatori and agenti di codice; the staff tecnico who releases reads § 5 and § 6). It is the last chapter of the book.
**Core question of the chapter:** what path does a change take from a Jira ticket to the service that runs in production, which tool governs each stage, and how does anyone know — with evidence, not with a feeling — that the change is really running and that production is speaking?
**Chapter thesis (the rule the whole chapter proves):** a change reaches production through distinct stages — ticket Jira → copia di lavoro and stack locale → test → merge request (pipeline + changeset) → unione in `php8` → immagine pubblicata → servizio ri-agganciato → migrazioni → osservazione — and **every stage leaves a readable proof**: the key `GOP-NNN` and the verification output in the ticket, the green pipeline and the changeset file, the commit SHA as an immutable image tag, the digest the running service is pinned to, the row in `schema_migrations`, the manifest in `.rilascio/`, the events that keep arriving in the log groups. «In produzione» is read in the last proof, never inferred from a command that ended without errors; and a channel that falls silent is not a healthy channel (GOP-270, the chapter's spine story: § 1 states the symptom, § 5 the mechanism, § 6 the detection — each told once, in its own place).

### Continuity and glossary check (done by the Architect, 25 novembre 2026)
- `chapter_index.md`: not present. `NARRATIVE_GLOSSARY.md`: not present. Canonical vocabulary = `/home/alan/firstmate/projects/GOPlanner/CONTEXT.md`. Final text exists for chapters 1–11 (`chapter_N.md`); chapter 12 exists only as `chapter_12_struttura.md`; chapters 13–15 have no file yet. **Before writing, the Writer re-checks whether `chapter_12.md` … `chapter_15.md` now exist** and aligns the pointers below with their final wording and titles.
- **Promises made by earlier chapters that ch.16 must keep** (the Writer covers each; the Reviewer checks each):
  1. ch.2 (`chapter_2.md`, § «Dove stanno i dati»): «Per lo staff tecnico c'è un controllo, `make schema_check`, e il percorso è nei capitoli 14 e 16»; staff box: «migrazioni e controllo dello schema nel capitolo 16». Ch.2 already said: `make schema_check` compares in sola lettura on a throwaway MySQL; `php scripts/migrate.php --tenant=<commessa>` is a preview by default, applies only with `--apply`, refuses without `--tenant` or `--all`. → § 5 `### Le migrazioni del database` gives the procedure and the rules; it must not contradict ch.2 and must **not** re-quote ch.2's numbers (40 database esclusi, 67 attivi…): one pointer «vedi il capitolo 2».
  2. ch.8 (`chapter_8.md`, § «Quando il dato non arriva»): «lo staff lo vede: l'app manda ogni 5 minuti, e a ogni apertura, un segnale con quanti esiti, foto e posizioni aspettano, l'ultimo errore di invio e il tipo di rete … (vedi il capitolo 16)» → § 6 `### Il canale mobile` says where the staff reads that signal (the heartbeat) and what it contains. The route contract belongs to ch.15: no JSON body, no status codes beyond what the staff needs.
  3. ch.8 (`chapter_8.md`, staff box in § «Le leve dell'ufficio sul telefono»): «il pacchetto di aggiornamento è firmato fuori dal server da una persona, con una chiave mai raggiungibile dagli agenti; il server non firma e controlla soltanto. Come si pubblica un rilascio è nel capitolo 16» → § 5 `### Un rilascio dell'app GOPlanner 3`.
  4. ch.12 (struttura § 2 staff box): «where the full error lives and how to search it by code: vedi il capitolo 16» → § 6 `### Dal codice di 8 caratteri all'errore completo`. Do **not** re-describe the error screen or Gea's reading (ch.12 owns them).
  5. ch.12 (struttura § 3 staff box): the mobile channel's two groups, `check_canale_log.php`, `check_mobile_log_silence.php`, `log_level` → «Channel and tooling: vedi il capitolo 16» → § 6. Do **not** retell ch.12's runbook «dove si è fermato il dato» (the five readings): one sentence + pointer.
  6. ch.12 (struttura, boundaries): CloudWatch, log groups, «Novità» as per-commessa changelog, releases → ch.16; Stato commesse yellow «database indietro» → «migration (ch.16)» → § 4 (changeset → Novità) and § 5 (migrations, one sentence on the yellow dot).
  7. ch.7 (struttura): «una funzione che dipende da un aggiornamento della commessa non ancora fatto» is a staff matter → § 5, one sentence (migrations are applied per commessa).
  8. ch.10 (`chapter_10.md`, DEV box): Gea's service lives in `chatbot-service/` with its own build and release → § 5, one sentence (`make publish_chatbot` / `make deploy_chatbot`, same separation and confirmation as the main image).
  9. ch.2 / ch.1 (`chapter_2.md`, `chapter_1.md`): in the Docker image `config.inc.php` is replaced by `config-docker.inc.php` → § 3, one clause, consistent wording.
- **Closings already used (the ch.16 ending must not echo them):** ch.1 the order «prima la parola del glossario, poi il passo del ciclo, poi la pagina … poi Gea … poi lo staff tecnico»; ch.2 three questions (which commessa, what its folder says, what comes from common code); ch.5 three numbers before a correction; ch.6 two answers before acting on an intervento; ch.8 one column, «Ultimo invio»; ch.9 only a movimento moves a code; ch.10 read what «Autorizza» / «Apri il ticket» carry; ch.11 the smallest access that removes the first «no»; ch.12 (planned) the evidence travels with the problem and every staff tool shows its numbers **before** it writes. Ch.16 ends on proof **after** the act (see TARGET): the change is in production when the running service and a speaking channel say so. This is the book's last chapter: no book-level farewell, no «In conclusione», no summary of the sixteen chapters.
- **Glossary traps specific to this chapter (Writer and Editor check all eleven):**
  1. **«Tenant», «database», «ambiente».** DEV prose may say «tenant» only when naming code (`custom/<tenant>/`, `--tenant=`, `migrations/tenant/`); the first time: «la commessa, che nel codice si chiama tenant». «Ambiente» here means a runtime place (locale, sviluppo, produzione): never use it, nor «istanza», to mean a commessa.
  2. **«Ticket» has two meanings.** The Jira issue is «il ticket Jira» or simply its key («GOP-270»); the item of GOPlanner's Ticket section is «il ticket della sezione Ticket» (ch.12). Never «ticket» alone where both could fit (§ 2 especially). «Task» only as the Jira issue type (Task, Epic, Sottotask), said once; never for an attività.
  3. **«Log», «evento».** Allowed as names of AWS objects and of code («log group», «Logs Insights», `LogJob`, the event `rbac_deny`); in prose the concept is «registro». Never «log» for what a utente or operatore did (that is an attività).
  4. **«Comando».** Shell and `make` commands are fine. Never call a proposta of Gea a «comando», and keep apart the **comandi remoti** to phones (ch.8) from `make` targets.
  5. **«Sviluppatori» vs «staff tecnico».** The glossary avoids «sviluppatori» for the staff role. Book convention: the reader of Part IV is the «sviluppatore» (PRD; box label «Per gli sviluppatori»); the people who release, hold the signing key and decide the deploy command are «staff tecnico» / «una persona dello staff tecnico». Never «capitano», «macchinista», «firstmate» or any internal nickname/tool name that appears in the sources: «decisione del capitano del 14/10/2026» becomes «una decisione del 14 ottobre 2026».
  6. **Gea, not «chatbot».** «il servizio di Gea» in prose; `chatbot-service`, `publish_chatbot` only as code names.
  7. **«Cliente».** The sources say «clienti (tenant)» and the changeset heading is literally «## Per il cliente». Quote the heading verbatim as a label, then say «commessa» / «chi lavora nella commessa» in prose. The table `clienti` is a code name.
  8. **AI vocabulary:** only «AI». No vendor, provider or model name anywhere (CI jobs and the chatbot suites included).
  9. **Pubblicare ≠ ri-agganciare ≠ rilasciare.** Define once in § 5 and keep: *pubblicare* = move a tag in the image registry (`make publish_app`); *ri-agganciare* = make the running service use the new image digest (`make deploy_app`); *rilascio* = the whole act, closed only by the check. «Deploy» only as the name of a target or of `docker stack deploy`.
  10. **«Stato».** Say «stato del ticket Jira» («Da completare», «In corso», «Bloccato», «Completata») so it is never confused with the stato of an intervento or utenza (ch.1, ch.6), nor with the nine states of the Ticket section (ch.12).
  11. **Versions and names as in the product:** «PHP 7.3», «PHP 8.3», «PHP 8.4», «GOPlanner 3», «GitLab», «Docker», «CloudWatch». Branches in monospace: `php8`, `master`.
- **Security (blocking, chapter-specific — the sources for this chapter contain more secrets than any other):** never in the text, not even inside code blocks or boxes: AWS account numbers, regions, ARNs, IAM role or policy text, image-registry URIs, database cluster hostnames, IP addresses, any hostname (public or internal — the sources name several servers and domains: describe them by role, e.g. «il server che serve l'API del call center e lo sviluppo»), SSH users, `ssh`/`scp` lines, key file paths, mount paths, Swarm service names and ports, image digests, the contents of `.env`/`.env.aws`, values of any environment variable, names of secret-bearing variables, login credentials of test accounts, the public key material printed in `docs/mobile-v3/aggiornamento.md`, `clienti.id` values, operator ids, the debug identifier the test build sends, Terraform or alarm ARNs, licence keys. Commands may appear only as `make` targets and repository scripts with neutral placeholders (`make release_api_dry_run COMMIT=<sha>`, `php scripts/migrate.php --tenant=<commessa>`), in short ```bash blocks. No names of people; no committente or test-commessa names (say «una commessa di prova»); Jira tickets cited by key and a short neutral title (some Jira summaries contain names: never copy them).

### Chapter boundaries (one-line pointers only, per PRD § 4 «Confini tra capitoli»)
| Topic touched here | Owned by | What ch.16 may say |
|---|---|---|
| Entry points, MVC, `lib/`, queue, workers, websocket, `mappature.php` as code | ch.13 | § 3 names the stack's services by role in one table; § 6 says web telemetry passes through the queue; one sentence + «vedi il capitolo 13» |
| Tables, relations, canonical schema as a data model, `schema_migrations` columns | ch.14 | § 5 owns the **procedure** of migrations and their rules; tables only named |
| Mobile API envelope, heartbeat route contract, API v2 / call center, Gea's service architecture, Portolano | ch.15 | § 6 uses the heartbeat as a signal; § 5 releases the API folder and Gea's image; § 2 says completed tickets go into the Portolano; one sentence + «vedi il capitolo 15» each |
| Ticket section, its nine states, campanella, Novità page UI | ch.12 | § 2: how a Jira ticket moves a Ticket-section ticket (one sentence + pointer); § 4: what a changeset becomes in Novità; no UI walkthrough |
| Error screen, 8-character code, Gea's reading, runbook «dove si è fermato il dato» | ch.12 | § 6: where the full error lives and how the staff finds it by code; the channel's alarms and tools |
| App update as seen by the operatore; comandi remoti | ch.8 | § 5: how a release is prepared, signed, verified and published |
| Schema-check numbers (40, 67, 26, 1) | ch.2 | Pointer only |
| Permessi, `rbac_deny` report | ch.11, ch.12 | One clause in § 6: audit events travel on the same asynchronous path to CloudWatch |
| Moving a commessa to the new magazzino | ch.9 | Nothing, or one clause in § 5: a per-commessa switch is a staff job |

---

## NUFs (Goal Scoring)

Ten NUFs, so the Editor can score one point each against the 8.5/10 gate. Format per INSTRUCTION.md § Architect.

```
utility(reader): Reader can draw the path of a change and name, for each stage, the tool and the proof it leaves: ticket Jira (key, description with «Criteri di accettazione» and «Verifica», comments with SHA and real verification output) → copia di lavoro with its own Docker stack → tests → merge request (GitLab pipeline, changeset) → unione in `php8` (cherry-pick to `master` for the older line) → `make publish_app` (moving channel tag + immutable SHA tag) → `make deploy_app` (service re-pinned) → `scripts/migrate.php` (rows in `schema_migrations`) → `make app_image_digests` and the log groups; and knows the four release routes (main image, the folder of the call-center API and of the development server, Gea's image, the GOPlanner 3 APK manifest) → score += 1

utility(reader): Reader can work a Jira ticket by its contract: the description (Contesto / Passi / Fuori scope / Criteri di accettazione / Verifica) is written only by a person and never rewritten; the order of work is computed from «is blocked by» links; states «Da completare» → «In corso» → «Completata», or «Bloccato» with a comment naming the decision needed; a `CP-` ticket is a human checkpoint no agent implements or closes; no closure without the «Verifica» executed and its real output in a comment; `tasks/{EPIC}/todo.md` is a mirror, never authoritative → score += 1

utility(reader): Reader can start a Docker stack from a fresh copy of work without attaching to someone else's containers (`scripts/run-tests-worktree.sh`, own project name and port, GOP-205), with the database password exported from the secrets manager and never written to a versioned file, `composer install` inside the container and the Smarty runtime folders created (otherwise every page answers 200 with an empty body); and knows the local stack has no database of its own: it points at the same cluster as production → score += 1

utility(reader): Reader can choose the lightest test that proves a change (HTTP request → ORM script in the container → browser only for JS and maps), run PHPUnit inside the container and every test that writes on a throwaway MySQL (`scripts/with-throwaway-mysql.sh`, tenant tables built from the canonical schema, GOP-698), run the mobile headless cycle with `--tenant=<commessa>` so the script aborts on the wrong commessa, and knows which GitLab jobs run on every MR and which tests run only by hand → score += 1

utility(reader): Reader can write a valid changeset (`changeset/AAAA-MM-GG-gop-NNN-slug.md`, `tipo`, `tenant`, optional `modulo`, `ticket`, sections «## Per il cliente» and «## Tecnica»), knows that an invalid changeset fails the MR while code without a changeset only raises a warning (silenced by the label «nessun changeset»), previews a commessa's changelog with `make changeset_anteprima TENANT=<commessa>`, and knows that the Novità page shows only «Per il cliente», for that commessa, from the moment the code containing it runs → score += 1

utility(reader): Reader (staff tecnico) can release the main application without the GOP-270 trap: `make publish_app` moves a tag and restarts nothing; `make deploy_app` re-pins the running service, refuses without a terminal and asks to type `deploy`; `make app_image_digests` plus the running service's image tell whether production runs what was published; and can release the call-center API folder with `make release_api_dry_run COMMIT=<sha>` then `make release_api COMMIT=<sha>` (sha on `origin/php8`, lock, plan, `php -l` before touching, backup, manifest, external check) → score += 1

utility(reader): Reader (staff tecnico) can apply migrations safely: rules (expand-only, one change per file, rerunnable, no down-migration — fix forward, checksum forbids editing an applied file, same folder on `master` and `php8`); executor `php scripts/migrate.php` (preview by default; `--tenant=` or `--all` mandatory; `--apply`; `--yes` mandatory without a terminal; exit codes 0/1/2; commesse not conforming to v0 are «excluded» and untouched); the series of the master database applied by hand; and the warning that an `--apply` launched from development, a local stack or a test stack migrates production, because the cluster is one → score += 1

utility(reader): Reader (staff tecnico) can find the full error behind an 8-character code (same `errorId` in `/goplanner/<tenant>/errors` with user, page and action; time window and result limit always), read the mobile channel (ingresso/esito, heartbeat contents, `log_level` 0–4 raised only temporarily) and interpret the four alarms of `scripts/check_canale_log.php` (canale di log guasto, dispositivo silenzioso oltre 48 ore, picco di scarti ≥ 0,2 su 60 minuti con almeno 30 richieste, coda ferma oltre 6 ore) plus the web-versus-mobile silence check → score += 1

utility(emotional): Reader knows where to stop: the signing key of the app update, the concrete deploy command, an `--apply` on real databases, the alarm infrastructure outside the repository and the choice among remedies belong to persons of the staff tecnico; an agent never signs, never deploys without a terminal and never migrates by default — and the reader feels calm because each irreversible step has a refusal built in (no terminal = no consent; preview by default; explicit target; drift refused unless `ALLOW_DRIFT=1`; nothing written when `php -l` fails) → score += 1

utility(factual): The chapter states, each with its source: two tags per publication and the GOP-270 mechanism and dates (`Makefile` header and targets, `docs/03-cookbooks/07-deployment-guide.md`, `docs/03-cookbooks/26-controllo-silenzio-log-mobile.md`, GOP-270); releases outside CI by decision of 14 ottobre 2026 and the CI job list (`.gitlab-ci.yml`); the Jira contract and states (`docs/02-patterns/26-jira-come-state-storage-dei-task.md`); the changeset rules (`docs/02-patterns/46-changeset-changelog-per-tenant.md`, `changeset/README.md`, GOP-711, GOP-712); migration rules and executor options (`migrations/README.md`, `scripts/migrate.php`, GOP-338/339/696); the release script's steps (`docs/03-cookbooks/27-rilascio-api-dev.md`, `scripts/release-api-dev.sh`, GOP-317); PHP runtimes and the 8.4 validation (`Dockerfile`, `Dockerfile-8.4`, `docs/03-cookbooks/22-migrazione-php84.md`, GOP-226, GOP-482); channel alarms and thresholds (`docs/03-cookbooks/36-osservabilita-canale-mobile.md`, GOP-264, GOP-828); the app-update publishing steps (`docs/mobile-v3/aggiornamento.md`, GOP-407) → score += 1
```

---
## BEAT LIST

Six sections (`##` in the final chapter), per INSTRUCTION.md (5–6 sections). Each needs: the italic audience line at the top (STYLE_BIBLE § Voice rule 6), at least one exact concrete detail (target, script, file, number, date), at least one **Limite** paragraph, max 5 prose paragraphs in a row without a table/list/box/subheading/code block, 600–1.200 words. Audience tags per INSTRUCTION.md: [UFFICIO], [STAFF], [DEV], [TUTTI]. Code blocks: only short ```bash blocks with `make` targets or repository scripts and neutral placeholders (see Security).

Before § 1 the Writer puts the mandatory `*In questo capitolo…*` paragraph (2–3 sentences, all italic): how a change goes from a Jira ticket to production and which proof each stage leaves; that the chapter is for sviluppatori, agenti di codice and the staff tecnico who releases; that an office reader finds in § 4 what reaches the Novità page and can skip the rest.

---

### § 1 — `## Il percorso di una modifica, e le prove che lascia`
**Tag:** [DEV] + [STAFF] (italic line: *Per gli sviluppatori e per lo staff tecnico che rilascia.*)
**Core question:** Which stages does a change cross from the Jira ticket to the running service, which tool governs each stage, and what proof does each stage leave behind?
**Word target:** 800 (range 700–900)
**Paragraph functions:** Aggancio (GOP-270, symptom only) → Spiegazione (the thesis: stages and proofs) → Dimostrazione (map table) → Spiegazione (two lines, four routes) → contro-obiezione → Limite → Sintesi.

**Content plan**
- **Opening (see TARGET):** GOP-270, symptom and scale only — between 16 and 31 ottobre 2025 the mobile log channel stopped for 28 commesse out of 29 that had an active web channel, and it was noticed about ten months later (verified on 9 settembre 2026). One sentence of cause, no mechanism: the new image had been published, but the running services were still on an older one. Then the rule of the chapter: a stage is done when its proof says so. The mechanism is told in § 5, the detection in § 6 — the Writer does not anticipate them here.
- **Map table** (Tappa | Strumento | Prova che resta | Sezione), one row per stage, labels exactly as in the sources:
  - Ticket | Jira, progetto GOP | the key `GOP-NNN`; description with «Criteri di accettazione» and «Verifica»; comments with SHA and real output | § 2
  - Copia di lavoro e stack locale | git worktree, Docker Compose, `scripts/run-tests-worktree.sh` | containers that belong to that copy only | § 3
  - Test | PHPUnit, `scripts/with-throwaway-mysql.sh`, headless scripts, browser targets | output pasted in the Jira comment | § 4
  - Merge request | GitLab pipeline (tests only), `changeset/` | green pipeline; one changeset file (or the label «nessun changeset») | § 4
  - Unione | branch `php8` (cherry-pick to `master` for the older line) | the commit SHA | § 5
  - Pubblicazione | `make publish_app` | two tags: the channel and the commit SHA | § 5
  - Rilascio | `make deploy_app`; `make release_api COMMIT=<sha>` | the digest the service runs; `.rilascio/COMMIT` and the manifest | § 5
  - Migrazioni | `php scripts/migrate.php` | rows in `schema_migrations`, with checksum | § 5
  - Osservazione | `make app_image_digests`, CloudWatch, `scripts/check_canale_log.php` | digests that match; channels that keep writing | § 6
  - Chiusura | Jira «Completata» | the closing comment (see [CONFLICT] 6) | § 2
- **Two lines:** `php8` is the integration branch; `master` is the older production line and receives changes by cherry-pick; the `migrations/` folder is identical on both, and a changeset travels with its cherry-pick. Which PHP runs on each line and which users each line serves at the research date: from the dossier ([CONFLICT] 1); never by hostname.
- **Four release routes** (one line each, details in § 5): the main application image; the folder that serves the call-center API and the development server (no image of its own: «la cartella è il rilascio»); the image of Gea's service; the signed manifest of the GOPlanner 3 app.
- **Contro-obiezione 1:** «La pipeline è verde e la MR è unita: la modifica è in produzione?» → No. The pipeline runs only tests and checks (releases are outside CI by a decision of 14 ottobre 2026); the merge puts the commit on `php8`; production changes only after publication and re-pinning, and the proof is the digest of the running service. The Jira ticket stays «In corso» until then (wording per [CONFLICT] 6).

**Limite (mandatory):** the repository does not contain the whole infrastructure: the Swarm stack file, the proxy in front of it and the alarm definitions live outside (`tasks/php84-rollout.md` says what is «non visibile da questo repo»; cookbook 36 says the alarms are «fuori da questo repository»); `make deploy_app` runs a command provided by whoever releases, deliberately not written in the Makefile. The chapter describes what the repository proves; the rest is the staff tecnico's and is named as such.

**Sintesi:** «Ogni tappa lascia una prova; "in produzione" si legge nell'ultima, non si deduce dalla prima.»

**DEV box (max 4 lines):** `Makefile` (header: the list of targets and the GOP-270 warning), `.gitlab-ci.yml`, `docs/03-cookbooks/07-deployment-guide.md` § «Percorso canonico: `make publish_app`», `AGENTS.md` (index of cookbooks). No command lines.

**Key facts the Researcher must find**
- GOP-270: title, dates and figures — 16–31/10/2025 and «28 tenant su 29» (`docs/03-cookbooks/26-controllo-silenzio-log-mobile.md`), «dieci mesi» (`Makefile` header, cookbook 07), «verificato il 09/09/2026» (cookbook 07). Triangulate with the Jira ticket; record any difference.
- The decision date of «rilasci fuori dalla CI» (`.gitlab-ci.yml` header and footer: 14/10/2026).
- Which line (`php8` or `master`) serves which part of production at the research date, in words (no hostnames, no service names): `Makefile` comment on `APP_CHANNEL`, cookbook 07 table «Tag | Natura | Chi lo segue», `tasks/php84-rollout.md`. If no source states the current split: `[BLOCKED: needs human input — quale linea serve oggi l'ufficio e quale l'app]`.
- Cherry-pick rule from `php8` to `master` (ADR 46 § Contesto; `migrations/README.md` first line).

---

### § 2 — `## Jira come registro dei task`
**Tag:** [DEV] + [STAFF] (italic line: *Per gli sviluppatori, gli agenti di codice e lo staff tecnico.*)
**Core question:** Where does the specification of a change live, who may write what in a Jira ticket, how is the order of work decided, and when may a ticket be closed?
**Word target:** 800 (range 700–900)
**Paragraph functions:** Aggancio (the drift story) → Spiegazione (contract table) → Spiegazione (states and `CP-`) → Procedura (life of a ticket) → Spiegazione (link to the Ticket section and to the Portolano) → contro-obiezione → Limite → Sintesi.

**Content plan**
- **One surgical example** (ADR 26 § Contesto): for epic GOP-103 a local `plan.md` showed one task as independent while Jira had it blocked by another (GOP-120 blocked by GOP-110): an agent ordering work from the file would have started a task before its blocker was done. That drift is why Jira became the only authority, for both specification and execution state.
- **Contract table** (Elemento | Ruolo | Chi scrive), from ADR 26: «Descrizione» = immutable specification in five parts (Contesto / Passi / Fuori scope / Criteri di accettazione / Verifica) — only a person; links «is blocked by» / «blocks» = the dependency graph — a person (or a planning skill); «Stato» = execution state — whoever executes; «Commenti» = append-only record: commit SHA, files touched, the **real** output of the verification, open doubts — whoever executes; `tasks/{EPIC}/todo.md` = a mirror regenerated from Jira, never authoritative; `tasks/{EPIC}/plan.md` = design rationale, not an input of execution. The reason the description is never rewritten (one sentence, from ADR 26): otherwise nobody could check that what was asked is what was done.
- **States** (in words, no numeric ids): «Da completare», «In corso», «Completata», plus «Bloccato», added because the three original states could not say «started, not finished, a human decision is needed»; «Bloccato» sits in the category «In corso» on purpose, so a blocked ticket stays visible as open work.
- **`CP-` checkpoints:** a ticket whose summary starts with `CP-` is a human checkpoint inside the graph; no agent implements or closes it. One clause on why it moved from `todo.md` to Jira (ADR 26: an automatic run would have crossed CP-1 of GOP-103, skipping the security check of the commessa perimeter).
- `### Il ciclo di un ticket` — numbered, one action per step:
  1. Read the description and its «is blocked by» links: the ticket is ready only if every blocker is «Completata».
  2. Refuse, do not interpret, a ticket without «Criteri di accettazione» and «Verifica».
  3. Move it to «In corso».
  4. Work in a copy of work; the key goes into the changeset file name (`…-gop-NNN-…`) and into the commit or MR title (convention to confirm in `git log`, see key facts).
  5. Comment with SHA, files touched and the real output of «Verifica».
  6. If a human decision is missing: «Bloccato», with a comment that names the decision.
  7. Close as «Completata» only under the closing rule of [CONFLICT] 6 (verification executed; in production).
- **Link with the Ticket section** (one sentence + «vedi il capitolo 12»): GOPlanner never calls Jira; a ticket of the Ticket section carries the key `GOP-NNN`, several tickets can point to one GOP; when the work starts, the MR is merged and the release happens, the ticket of the Ticket section moves to «In correzione», «Nella prossima versione», «Risolta» (ADR 48 § 8, `lib/MobileV3/Feedback/TicketGop.php`) — the Writer states only what the dossier confirms is active ([CONFLICT] 10). Assistance without code does not pass through Jira.
- **The Portolano:** at closure a «Completata» ticket is ingested into the Portolano, development collection, with its dependency graph (ADR 30): the next person finds the «why» without asking. One sentence + «vedi il capitolo 15».
- **Contro-obiezione 2:** «Il piano in `tasks/` dice un ordine diverso da quello di Jira: chi ha ragione?» → Jira. `todo.md` is regenerated from Jira and manual edits have no effect; `plan.md` explains the reasoning and is read as such; a dependency is added as a link in Jira, not in an ASCII diagram.

**Limite (mandatory):** Jira enforces the states, not the contract: a ticket created without «is blocked by» links becomes executable at once, even wrongly (ADR 26 § Conseguenze); the quality of the result is the quality of the description; Jira is outside GOPlanner — the office never sees it, it sees the Ticket section; the book cites tickets only by key and short title, never their content (Jira summaries may contain names).

**Sintesi:** «La descrizione del ticket è la specifica e non si riscrive; lo stato e i commenti sono il registro di chi esegue.»

**DEV box (max 4 lines):** `docs/02-patterns/26-jira-come-state-storage-dei-task.md`, `docs/02-patterns/30-ingestione-ticket-completati-in-rag.md`, `.agents/skills/implement-ticket/` (the repository's procedure for an agent), `docs/02-patterns/48-ticketing-base.md` § 8 and `lib/MobileV3/Feedback/TicketGop.php`.

**Key facts the Researcher must find**
- ADR 26 in full: the five parts of the description, the state machine, the `CP-` rule, the GOP-103 example (keys GOP-120, GOP-110, GOP-117, GOP-112 and CP-1 as written there).
- The key convention: does every merge on `php8` carry `GOP-NNN` in the commit, branch or MR title? Read `git log --oneline php8 -200` (read only) and `changeset/` names; report the share and the exceptions without guessing. Note: many recent commits are prefixed `no-mistakes(...)`; include that prefix only if a repository document explains it, otherwise leave it out.
- Closing rule: ADR 26 («Completata» only after the «Verifica» executed and its output attached) vs the practice visible in Jira comments («in produzione dal …»): JQL below. → [CONFLICT] 6.
- `TicketGop`: the events it maps (`in_corso`, `mr_unita`, `rilascio`), the message «Risolta nella versione X», and whether anything in the repository triggers it; ADR 48 says the trigger is outside GOPlanner.
- ADR 30: collection used, trigger at closure, graph metadata.

---

### § 3 — `## L'ambiente locale: Docker, il database condiviso e le versioni di PHP`
**Tag:** [DEV] (italic line: *Per gli sviluppatori e gli agenti di codice.*)
**Core question:** What does a developer start on their machine, what does that stack talk to, how do two copies of work avoid sharing containers, and which PHP runs where?
**Word target:** 1.000 (range 900–1.100)
**Paragraph functions:** Aggancio (the shared-cluster rule first) → Dimostrazione (services table) → Procedura (fresh copy of work) → Dimostrazione (GOP-205 trap) → `###` PHP versions (Spiegazione + table + one root cause) → contro-obiezione → Limite → Sintesi.

**Content plan**
- **The rule first:** the local stack has no database of its own. Development, local stacks and test stacks point at the same database cluster as production (header of `scripts/migrate.php`; header of `scripts/with-throwaway-mysql.sh`; cookbook 21 «DB unico condiviso»; the local compose files reach it through a tunnel, `scripts/ssm-tunnel.sh` — name only). Consequence in one sentence: what a local script writes, it writes on the real database of the commessa it points at; tests that write run on a throwaway MySQL (§ 4).
- **Services table** (Servizio | Che cosa fa), from `docker-compose-linux.yml` and cookbook 11, confirmed by the Researcher: `app` (Apache + mod_php), `queue-worker` (`worker.php`, background jobs), `redis` (cache and job queue), `ws-server` (Node, websocket for progress), `app-php84` and `queue-worker-php84` (the PHP 8.4 runtime, § «Quale PHP gira dove»), `phpmyadmin`; and in `docker-compose.yml` `mailpit` for test e-mails (cookbook 16). Say which compose file serves which purpose: `docker-compose-linux.yml` (the reference for headless tests, cookbook 18), `docker-compose-local.yml` (`make start_local`), `docker-compose.yml` (`make start_dev`). No ports, no image URIs. The architecture of these pieces: «vedi il capitolo 13». One clause: inside the image `config.inc.php` is replaced by `config-docker.inc.php` (as in ch.2).
- **Rule of execution:** every PHP script, Redis inspection or test runs **inside** the containers, never with the host's PHP (cookbook 11: missing extensions, different database and Redis).
- `### Avviare lo stack da una copia di lavoro nuova` — numbered, from cookbook 25:
  1. Export the database password in the shell, taken from the secrets manager; the compose files refuse to start without it (IN-70) and it is never written in a versioned file.
  2. Create `chatbot-service/.env` from `chatbot-service/.env.example` (without it every `docker-compose … exec` stops).
  3. Start the stack with `scripts/run-tests-worktree.sh`, not `./run_tests.sh`.
  4. Run `composer install` inside the app container: the image carries no `vendor/`.
  5. Create the Smarty runtime folders: without them every page answers 200 with an empty body and no error in any register — it looks like a defect and is not.
  6. Check that the containers belong to this copy (the Compose label with the working directory).
- **The trap (surgical example, GOP-205):** Compose takes the project name from the folder's last name, not from its full path; a copy of work whose folder has the same name as the main checkout attaches to the containers already running there — the suite runs in someone else's stack. `scripts/run-tests-worktree.sh` generates `docker-compose.test.yaml` from `docker-compose.test.yaml.template` with a project name derived from the absolute path and a free port: many copies in parallel, each with its own containers.
- `### Quale PHP gira dove` — table (Runtime | File | Dove gira | Stato), filled from the dossier after [CONFLICT] 1 is resolved; expected shape: PHP 7.3 — the older line `master`; PHP 8.3 — `Dockerfile` on `php8` (the build refuses a base older than 8.3.36, the first with the fix for the vulnerability named in GOP-482; CI images are `php:8.3-cli`); PHP 8.4 — `Dockerfile-8.4`, services `app-php84` / `queue-worker-php84`, **not in production** (cookbook 22). Then:
  - What was validated on 8.4 (cookbook 22): login and 16 main pages, the mobile cycle end to end, ORM writes, the Redis worker, a real PDF, an Excel import and an Excel export, the PHPUnit suite green at that time. What was not: PDF and Excel only on one or two commesse out of about fifty; real image signatures on PDF reports; `ws_server/` and the worker under load.
  - **One root cause, not the list:** constructors written as a method with the class name are no longer called in PHP 8; in the database layer the connection stayed `null` and every query — the login included — failed: the origin of the first HTTP 500. The other patterns are in the cookbook.
  - Static audit, repeatable: `scripts/php84_lint.sh` (syntax) and PHPCompatibility with `phpcs.xml`; both exclude `vendor/`, `Smarty_old/`, `lib/phpexcel/`, `lib/fpdf/`, `archived/`.
  - Legacy libraries made syntax-compatible, **not** migrated (`lib/phpexcel/`, `lib/fpdf/`; decision in `tasks/excel-migration-design.md`).
  - Rollout principle (`tasks/php84-rollout.md`, declared a **draft**; the final plan is the team's): never overwrite the moving production tag as a first step — an immutable tag for the current image comes first, so a rollback exists. The Writer presents it as the draft's principle, not as a procedure in force.
- **Contro-obiezione 3:** «Ho cancellato dati di prova dal mio stack locale: ho toccato la produzione?» → The stack points at the same cluster; the commesse di prova are separate databases on that cluster, so the data deleted are those of the commessa the stack was pointing at. Before writing, check which commessa and database the stack reads; write only on a commessa di prova or on a throwaway MySQL. Proportion: scripts that write default to a preview and require an explicit target (§ 5).

**Limite (mandatory):** the local stack does not reproduce production's topology (replicas, proxy, alarms); the PHP in the local container may differ from the line being developed ([CONFLICT] 1: cookbook 18 reports PHP 7.3.33 in the `app` container); the 8.4 runtime is validated only on the listed flows; Smarty 2 compiles a template comment `{{* … *}}` with a function removed in PHP 8, so one such comment makes the whole page fatal (AGENTS.md § PHP Migration; guarded by `tests/CreaInvitoTemplate_Test.php`) — put it in the DEV box if space is short.

**Sintesi:** «Lo stack locale è tuo, il database no: prima di scrivere si guarda a quale commessa punta.»

**DEV box (max 5 lines):** `docker-compose-linux.yml`, `docker-compose.test.yaml.template`, `scripts/generate-test-compose.sh`, `scripts/run-tests-worktree.sh`, `Dockerfile`, `Dockerfile-8.4`, the overlay `docker-data/` copied late into every image (AGENTS.md § Container config overlay), Makefile `start_dev` / `start_local` / `stop_dev`, cookbooks 11, 22, 25.

**Key facts the Researcher must find**
- `FROM` line of `Dockerfile`, `Dockerfile-8`, `Dockerfile-8.4` on `php8`; the minimum-version check (8.3.36) and its ticket; `composer.json` PHP constraint at the research date; GOP-226 resolution (read the closing comment) → [CONFLICT] 1.
- Which image tag each compose file uses (no URI in the dossier: say «immagine della linea `php8`» / «immagine senza tag esplicito»), and therefore which PHP the local `app` container runs.
- Services and their roles in `docker-compose-linux.yml`; `mailpit` in `docker-compose.yml`; `make start_dev` / `start_local` (what each does, without credentials).
- Cookbook 25: the six first-run steps verbatim in substance, the empty-page symptom, GOP-205 title.
- Cookbook 22: the validated and non-validated lists; the three root causes (choose one for the text); the two audit tools and the exclusions.
- `tasks/php84-rollout.md`: status line («bozza di riferimento»), «Principio guida».

---

### § 4 — `## I test, la pipeline e il changeset: che cosa si prova prima di unire`
**Tag:** [DEV] (italic line: *Per gli sviluppatori e gli agenti di codice; il riquadro sulle Novità è anche per l'ufficio.*)
**Core question:** Which test proves a change at the lowest cost, where does each kind run (throwaway MySQL, local stack, real phone), what does the GitLab pipeline check on every merge request — and what does it not — and how does a change tell the commesse what it changed?
**Word target:** 1.050 (range 950–1.150)
**Paragraph functions:** Aggancio (the preference ladder) → Dimostrazione (ladder list) → Spiegazione (PHPUnit and the throwaway MySQL) → Dimostrazione (the mobile guard) → Spiegazione (E2E in two sentences) → Dimostrazione (pipeline table) → `###` changeset → contro-obiezione → Limite → Sintesi.

**Content plan**
- **The ladder** (cookbook 18), as a numbered list, with the rule «si sceglie sempre il livello più alto che basta»: 1. HTTP request (curl or PHP cURL): login, web API, mobile API — fastest and deterministic; one exact detail: the web login is a POST to `index.php`, handled by `pages/login.php` (a route like `/utente/login` quoted elsewhere does not exist); 2. ORM script inside the container: seeding test data and inspecting the database (cookbook 19); 3. browser (Chrome DevTools MCP, Playwright) only when real JS or maps are needed (cookbook 15).
- **PHPUnit:** `phpunit.xml` declares the suites `default` (`tests/`) and `db_canonico`; coverage is scoped to `lib/`; it runs inside the container (`./run_tests.sh` in the main checkout, `scripts/run-tests-worktree.sh` in a copy of work). The number of test files at the research date from the dossier, with its date (no number from cookbook 22, which is historical: [CONFLICT] 4). Tests that need MySQL run through `scripts/with-throwaway-mysql.sh`: a MySQL 8.0 started for the test on the local address only, on a random port, removed at the end; the script exists because development, local and test stacks share production's cluster. Since GOP-698 such tests build the commessa tables from the canonical schema (`tests/support/SchemaCanonico.php`): a test that uses a non-canonical column fails in development, not in production. Example targets: `make test_migrate`, `make test_db_canonico` (one or two names only).
- **Mobile headless** (cookbook 20): `scripts/test_mobile_android_live.php` runs authorization → download of interventi → closing of an intervento → photo upload without a phone. **Surgical example of a guard:** the debug build of the app always presents the same identifier, and that identifier points to the last commessa that took it — possibly a production commessa. With `--tenant=<commessa>` the script resolves the real commessa from the master database and aborts if it differs; without it, it proceeds with a visible warning. Never print the identifier itself. For GOPlanner 3: `make smoke_v3_pairing` pairs a throwaway phone on a deployed API and removes its rows; `make smoke_v3_pairing_test` does the same on a throwaway MySQL.
- **E2E** (cookbook 21), two sentences: the whole cycle — preparation of data, pianificazione, download on the phone, closing with the fields, photo and save, sync, check on the server — with the server part headless and the phone part on a real device or emulator; one database, two front ends (local stack and development server). State which app version the cookbook covers ([CONFLICT] 9).
- **Pipeline table** (`.gitlab-ci.yml`; Job | Che cosa controlla), one row each, wording from the job comments: `php_lint` (`php -l` on `lib/`: merging two MRs can leave a method declared twice, «Cannot redeclare», which no single-file test sees and the release refuses); `chatbot_test` and `chatbot_php_test` (the two sides of Gea's contract); `tokens_check`; `openapi_check` (the call-center API contract stays valid YAML, GOP-709); `vendor_fa_check`; `css_lint` (only changed lines: no new hex or rgb colours); `industry2_check`; `job_segnalibri_test`; `changeset_check` (below). The pipeline runs on every branch and every MR, on GitLab's shared runners (free plan, 400 minuti di calcolo al mese), or on a workstation runner by changing one project variable. Then the sentence that matters: by decision of 14 ottobre 2026 the pipeline runs **only tests and no secrets**; releases are outside it. Whether the PHPUnit suite of `tests/` is a pipeline job: from the dossier ([CONFLICT] 4b) — if not, say it runs by hand and its output goes into the Jira comment (§ 2).
- `### Il changeset: che cosa cambia per chi lavora nella commessa` (keeps ch.12's promise on «Novità»):
  - One file per change visible to the commesse, `changeset/AAAA-MM-GG-gop-NNN-slug.md`, in the **same MR** as the code, written by whoever makes the change (ADR 46, decision of 5 novembre 2026; GOP-711).
  - Front matter: `tipo` (`novita` | `miglioramento` | `correzione`), `tenant` (`tutti` or a list of folders of `custom/`), `modulo` (optional, a folder of `migrations/tenant/modules/`), `ticket` (must match the number in the file name); `pubblicato` only for reconstructed changesets.
  - Body: «## Per il cliente» (mandatory, not empty — the text the commessa reads) and «## Tecnica» (staff only, never shown). The filter is in the data, not in the template (`Novita::perCliente()` vs `perAmministratore()`).
  - Pipeline behaviour: an invalid changeset **fails** the MR; an MR that touches code without a changeset gets a **warning** (exit code 2, allowed), silenced by the MR label «nessun changeset» for changes invisible to the commesse. Preview of a commessa's changelog: `make changeset_anteprima TENANT=<commessa>`.
  - The changelog is a function of the changesets present in the **commit that is running**: no generated file, no release register; each line (`php8`, `master`) has its own. The publication time is the first time the application reads the changeset, per line and environment.
  - `> **Per l'ufficio:**` box (2–3 sentences): the Novità page shows only the «Per il cliente» text of the changes that concern your commessa; an entry appears when the code that contains it is running, not when someone writes it; where the campanella and the Novità page are: «vedi il capitolo 12».
- **Contro-obiezione 4:** «La pipeline è verde: i test sono passati?» → The pipeline proved what its jobs check (lint, contracts, tokens, styles, changeset, Gea's suites). The tests that need a database, a browser or a phone run by hand, and their real output goes into the Jira comment; without it the ticket does not close (§ 2).

**Limite (mandatory):** E2E needs a real phone and the shared database; browser targets need Docker and an application image and are marked «non in CI» in the Makefile; the free CI minutes are finite, which is why jobs are light (timeouts of 5–15 minuti); a changeset written for the wrong commesse is valid for the pipeline (it checks that the folders exist, not that the choice is right); a changeset is never deleted, so the changelog grows with the branch history.

**Sintesi:** «Si sceglie il test più leggero che prova la modifica; quello che la pipeline non esegue si esegue a mano e si incolla nel ticket Jira.»

**DEV box (max 5 lines):** `phpunit.xml`, `scripts/with-throwaway-mysql.sh`, `tests/support/SchemaCanonico.php`, cookbooks 15, 18, 19, 20, 21; repository skills `.agents/skills/goplanner-headless-tests`, `goplanner-e2e-test`, `goplanner-browser-mcp-tests`; `scripts/changeset_check.mjs`, `changeset/README.md`, `lib/Novita.php`, `lib/NovitaArchivio.php`.

**Key facts the Researcher must find**
- `.gitlab-ci.yml`: every job name, its one-line purpose from its comment, image, timeout; the runner variable and the 400-minute plan; the footer on releases; whether any job runs `vendor/bin/phpunit` on `tests/` ([CONFLICT] 4b).
- Count of `tests/*_Test.php` at the research date (read-only `ls | wc -l`), with the date; `phpunit.xml` suites.
- Cookbook 18: the ladder, the login detail; cookbook 20: the guard's behaviour with and without `--tenant` (no identifier value); Makefile comments for `smoke_v3_pairing` and `_test`.
- ADR 46 and `changeset/README.md`: every rule above; the date of the decision; `make changeset_anteprima`; the count of changesets at the research date (optional).
- `lib/Novita.php` docblock: «pura», per-tenant filter, «Tecnica» only from `perAmministratore()`, environment in the key of the first-read time.

---

### § 5 — `## Rilasciare: pubblicare, ri-agganciare, migrare`
**Tag:** [STAFF] + [DEV] (italic line: *Per lo staff tecnico che rilascia e per gli sviluppatori.*)
**Core question:** What are the distinct acts of a release, which command and which safeguard belong to each, and how do the API folder, the migrations and the GOPlanner 3 app differ from the main image?
**Word target:** 1.200 (range 1.100–1.250)
**Paragraph functions:** Aggancio (GOP-270, the mechanism) → `###` main image: Spiegazione + Procedura → `###` API folder: Dimostrazione (GOP-317) + Spiegazione → `###` migrations: Spiegazione (rules) + Procedura + Limite → `###` app GOPlanner 3: Procedura → Limite → Sintesi.

**Content plan**
- `### Pubblicare non è rilasciare` — the GOP-270 mechanism, told here once: `docker stack deploy` resolves a tag into a digest once, at deploy time, and pins the service to it; from then on the service no longer follows the tag. On 9 settembre 2026 three production services were running an older digest than the one the tag pointed to, code that predated the asynchronous mobile log, and wrote no mobile log. Hence two targets on purpose:
  - `make publish_app` builds from `Dockerfile` for two architectures and pushes **two tags**: the moving channel (`php8` by default — so a publication launched by hand from a normal checkout never retags the older production line; `latest` only when written explicitly) and the **immutable commit SHA**, so a digest can be named afterwards. It restarts nothing.
  - `make deploy_app` is the step that re-pins running services; it runs a command provided by whoever releases (not written in the Makefile, because the choice among GOP-270's remedies belongs to a person), refuses when no terminal is attached («l'assenza di conferma non vale come conferma») and asks to type `deploy`.
  - `make app_image_digests` (read only) lists which digest each tag points at; compared with the image of the running service, it shows the drift that caused GOP-270.
  - Numbered procedure (order from the Makefile comments only): 1. clean checkout of the commit to release; 2. `make publish_app`; 3. note the SHA tag; 4. `make deploy_app` from an interactive shell; 5. `make app_image_digests` and compare with the running service. The Writer adds no smoke step the dossier does not source.
  - One sentence: Gea's service has the same pair, `make publish_chatbot` / `make deploy_chatbot`, with the same confirmation.
- `### La cartella dell'API del call center e del server di sviluppo` — **surgical story (GOP-317):** that server has no image of its own: «la cartella è il rilascio». Until GOP-317 it was updated by copying files by hand; on 16 settembre 2026 a copy of a working copy erased an already-released correction (GOP-274) and broke the call-center schedules in production. Since then: `make release_api_dry_run COMMIT=<sha>` (read only, prints the plan) and `make release_api COMMIT=<sha>`. Safeguards as a bullet list (from cookbook 27): refuses a dirty copy, a branch name instead of a sha, a commit not on `origin/php8`, and a copy of the script different from `origin/php8`'s; takes a lock before reading; runs `php -l` on changed files **before** touching the folder; syncs without deleting, keeping a backup of every overwritten file; runs `composer install` only if the lock file changed; writes the released commit, a SHA-256 manifest of every file and a history line, then re-verifies the folder; refuses hand-made changes since the last release unless `ALLOW_DRIFT=1` is typed on the command line; never ships `.env`, the host's compose file, `deploy/` or uploads; checks from outside that the API answers 401 without a token and the development site answers 200, printing only the code, never the body. The explicit sha on the command line **is** the consent: no prompt. It also runs the GOPlanner 3 pairing smoke and a read-only schema-conformance check (GOP-699; warning by default) — wording per [CONFLICT] 12.
- `### Le migrazioni del database` (keeps ch.2, ch.7, ch.12):
  - Rules (from `migrations/README.md`), as a short bulleted list: **expand-only** — only additions (tables, nullable or defaulted columns, indexes); removals and renames in a later release, when neither line uses the object; one schema change per file, rerunnable; explicit charset, collation and engine; no `USE` and no qualified names of other databases; **no down-migration: you fix forward**; an applied file can no longer be edited — its recorded checksum makes the executor refuse it; the folder is the same on `master` and `php8`.
  - Two series: `migrations/main/` for the master database, **without an executor, applied by hand** (its README); `migrations/tenant/` for the commesse — `0000_baseline` (v0), core migrations in numeric order, `modules/<modulo>/` only for commesse that declare the module in `custom/<tenant>/moduli.json`, `custom/<tenant>/` only for that commessa (GOP-696). The id recorded in `schema_migrations` is the file path without `.sql`. The content of the canonical schema: «vedi il capitolo 14».
  - Executor, in a ```bash block with placeholders only: `php scripts/migrate.php --tenant=<commessa>` (preview, the default), `--all` (preview of every active commessa), `--tenant=<commessa> --apply`. Rules: a target is mandatory; `--yes` is mandatory for `--apply` without a terminal; lock timeout 10 secondi by default; exit 0 all fine, 1 at least one commessa failed or blocked, 2 wrong usage; commesse not conforming to v0 are «excluded» and not touched until aligned (`make schema_check`, as in ch.2).
  - `> **Attenzione:**` box, from the script header, in substance: development, local stacks, test stacks and production share the same cluster: an `--apply` from any of them migrates production. It is run by hand, from a throwaway container of the release image.
  - One sentence for the office-facing effect (pointers only): a commessa whose database is behind the code's migrations shows yellow in Stato commesse (capitolo 12), and a function that needs a missing migration says so on the page (capitolo 4, capitolo 8).
- `### Un rilascio dell'app GOPlanner 3` (keeps ch.8): the server never signs and holds no private key; the manifest is signed off line with a key **different** from the one that signs the APK, kept by a person and never reachable by agents; the server verifies the signature before serving the manifest, and the app verifies it again with the public key it carries — the server's check is a safety net for whoever publishes, not a guarantee for the phone. Three scripts in `scripts/mobile-v3-update/` (Script | Chi lo esegue | Chiavi che tocca): `prepara-manifesto.php` (whoever prepares; none), `firma-manifesto.sh` (only the key holder, on their machine; the private key, read only), `verifica-manifesto.php` (anyone; the public key). Numbered steps: 1. build the APK and name it by version — a published APK is never overwritten; 2. prepare the payload (expiry 14 giorni by default, from 1 to 90; `release_sequence` one more than the highest ever published on any channel; optional update by default); 3. signature, by the key holder; 4. verification with the server's own code; 5. copy to the server first the APK, then the envelope renamed in one move, so the server never sees a manifest pointing to a missing APK. Channels `stable` and `pilot`; a mandatory update is decided by a person and raises both the manifest's minimum and the server's minimum client version. Manifests and APKs never go into a Docker image nor into the code release folder: an app release needs no image rebuild. No paths, hosts or `scp` lines in the text.

**Limite (mandatory):** releases are manual by decision of 14 ottobre 2026 (the release runner is a later phase); the deploy command is not in the repository; the master database series has no executor; a wrong migration is fixed only forward; the schema conformity check at release time and every night (GOP-699) is «In corso» at the time of the Architect's check — the Writer says «previsto» unless the dossier finds it active; the replica count of the queue workers must survive a deploy (GOP-199) — one clause, only with the dossier's resolution.

**Sintesi:** «Pubblicare sposta un'etichetta; rilasciare cambia ciò che gira. Ogni atto ha il suo comando, e il comando che scrive in produzione vuole un consenso esplicito.»

**DEV box (max 5 lines):** `Makefile` (`publish_app`, `deploy_app`, `app_image_digests`, `release_api*`, `publish_chatbot`, `deploy_chatbot`, `schema_check`), `scripts/release-api-dev.sh` (header), `docs/03-cookbooks/27-rilascio-api-dev.md`, `migrations/README.md`, `migrations/main/README.md`, `scripts/migrate.php`, `lib/MigrationRunner.php`, `docs/02-patterns/45-schema-canonico-tenant.md`, `docs/mobile-v3/aggiornamento.md`.

**Key facts the Researcher must find**
- `Makefile`: header comment (GOP-270 paragraph), `APP_CHANNEL` default and comment, `publish_app` (architectures, two tags), `deploy_app` (no-terminal refusal, the word to type), `app_image_digests`, `publish_chatbot` / `deploy_chatbot` confirmation. Quote no URI, account or region.
- Cookbook 07 § «Percorso canonico»: the 9/9/2026 verification and the drift (describe without digests).
- GOP-317: title in neutral words, date 16/09/2026, GOP-274 as the erased correction; cookbook 27 steps 1–11 and «Cosa resta dell'host».
- `scripts/release-api-dev.sh` around the conformance step: is `migrate.php --all` a preview only? what does `SCHEMA_GATE` do? → [CONFLICT] 12.
- `migrations/README.md` and `migrations/main/README.md`: rules, series, «nessun esecutore»; `scripts/migrate.php` header: options, defaults, exit codes, the shared-cluster warning.
- `docs/mobile-v3/aggiornamento.md` § «Chi firma», § «Pubblicare un rilascio»: scripts, roles, five steps, 14 giorni / 1–90, `release_sequence`, `stable` / `pilot`, external volume; the date of the decision (23/10/2026); GOP-407 status.
- GOP-199 resolution (comment) and GOP-699 status at the research date.

---

### § 6 — `## Registri, allarmi e silenzi: osservare GOPlanner in produzione`
**Tag:** [STAFF] + [DEV] (italic line: *Per lo staff tecnico e gli sviluppatori. L'ufficio arriva a questi registri attraverso Gea e la sezione Ticket (capitolo 12).*)
**Core question:** Where does GOPlanner write what happens in production, how does the staff go from an error code or a phone to the full record, and how does the system notice a channel that has gone silent?
**Word target:** 1.000 (range 900–1.100)
**Paragraph functions:** Aggancio (silence is not health) → Spiegazione (how a record is written) → Dimostrazione (log groups table) → `###` Procedura (from the 8-character code to the full error) → `###` Spiegazione (mobile channel and heartbeat) → Dimostrazione (alarms table) → contro-obiezione → Limite → Sintesi = chapter closing.

**Content plan**
- **How a record is written** (pattern 18): `lib/CloudWatchLogHelper.php` writes every record twice — to a group of the commessa and channel (`/goplanner/<tenant>/web`, `/mobile`, `/errors`) and to the central group `/goplanner`; groups and streams are created once per process (a quota of 5 operations per second per account made it necessary, GOP-483). Web telemetry does not slow the page: `json.php` puts a `LogJob` on the queue (except a list of frequent polls) and a worker sends it later (architecture of the queue: «vedi il capitolo 13»). Crash reports of the older Android app are written synchronously to `/goplanner/android/crash-report`, through an allowlist (`lib/CrashReportFilter.php`) that drops the device log and the IP and cuts the trace to about 4 KB. Audit events (change of commessa refused, `rbac_deny`) travel on the same asynchronous path — one clause, «vedi i capitoli 11 e 12».
- **Log groups table** (Gruppo | Che cosa contiene), groups from the dossier only: `/goplanner/<tenant>/web`; `/goplanner/<tenant>/errors` (server errors with their code, failures of background jobs, avvisi — GOP-700); `/goplanner/sconosciuto/mobile` (every ingresso from a phone, before the commessa is known); `/goplanner/<tenant>/mobile` (esiti); the GOPlanner 3 group that receives the heartbeat ([CONFLICT] 8); `/goplanner/android/crash-report`; `/goplanner/giro/scheduler` (the scheduler's heartbeat, ch.12); `/goplanner/chatbot` (Gea's audit, staff only); `/goplanner` (central). Explain `<tenant>` once.
- `### Dal codice di 8 caratteri all'errore completo` (keeps ch.12): the handler writes the same code (`errorId`) in `/goplanner/<tenant>/errors`, with the user, the page and the action of the request (GOP-864), and in the errors table of the master database when a user is logged in (otherwise only in PHP's own error register) — table name per dossier. Numbered: 1. take from the ticket the code, the commessa and the time; 2. query the errors group of that commessa with Logs Insights, a time window around the reported time and a result limit, filtering on `errorId`; 3. if nothing is there, look in the errors table for the same code; 4. write in the Jira ticket what was found and where. Rules from the repository skill `cloudwatch-log-investigator`: always a window and a limit; always the commessa; never conclude from one channel when the problem may involve both web and mobile. At most one short query shape in a ```bash or plain block, with no region or account — or none.
- `### Il canale mobile` (keeps ch.8 and ch.12): one sentence on ingresso/esito with a common `request_id` + «vedi il capitolo 12» for the five readings. What never goes into these records (cookbook 36): parameter values, passwords, tokens, photo bytes, exception text, the phone's identifier in clear (only a 12-character fingerprint). The **heartbeat** of GOPlanner 3: every 5 minuti while the app runs and at every opening; queued esiti, foto and posizioni, the age of the oldest pending item, the last sending error (code, HTTP status, route model), network, battery; body at most 2048 byte; when the phone is revoked or not yet enabled the app stops sending it. `log_level` per commessa (`$custom['mobile']['log_level']`, 0–4, 1 when absent), read by the app at the next opening: raise it, read, lower it again.
- **Alarms table** (Allarme | Regola | Da dove legge), from cookbook 36 (GOP-264, GOP-828): canale di log guasto (a group with a write failure not followed by a success; record in Redis by `LogChannelHealth` and a `LOGCHANNEL_FAIL` line); dispositivo silenzioso (last contact older than 48 ore, among phones active in the last 30 giorni); picco di scarti (refused requests / all requests of the commessa ≥ 0,2 over 60 minuti, with at least 30 requests); coda ferma (a phone whose sending failed more than 6 ore ago with no later success of the same action). `scripts/check_canale_log.php` runs every hour, is read only (except cleaning expired records) and exits with 1 when a condition fires; it sends no notification by itself. Then `scripts/check_mobile_log_silence.php`: for each commessa with both a web and a mobile group, compares the last event of the two; a silent mobile group alone proves nothing (the commessa may not use the app), **paired with a web group that writes** it becomes an anomaly — «il giorno dopo invece che dieci mesi dopo» (cookbook 26).
- **Contro-obiezione 5:** «Il gruppo mobile di una commessa è vuoto da una settimana: è un guasto?» → Not by itself: compare it with the web group of the same commessa (the silence check) and with the phones' last contact; a write failure would be recorded per group by `LogChannelHealth`. Without those two readings nobody says «è rotto» or «è tutto a posto»: they say what was checked.

**Limite (mandatory):** a phone that never reaches the server leaves no trace until it counts as silent after 48 ore; idempotent ingestion is a project, not implemented — a sending can be duplicated only if the server saves and the confirmation is lost (one sentence, proportion); notifications and CloudWatch alarms on these checks are defined outside the repository and their status is per [CONFLICT] 7; some groups have no retention set in the repository (cookbook 05, only if the dossier confirms); the office never reads CloudWatch.

**Closing (last paragraph of § 6 = chapter closing, see TARGET).**

**DEV box (max 5 lines):** `lib/CloudWatchLogHelper.php`, `lib/LogChannelHealth.php`, `lib/LogToCloudWatchJob.php`, `lib/MobileRequestLog.php`, `lib/MobileTassiCanale.php`, `lib/CrashReportFilter.php`, `lib/BaseErrorHandler.php` (`sendToCloudWatch()`, `sendToDB()`), `lib/MobileV3/Resource/HeartbeatController.php`, `scripts/check_canale_log.php`, `scripts/check_mobile_log_silence.php`, `docs/02-patterns/18-cloudwatch-logging-infrastructure.md`, `docs/diagramma_cloudwatch_logging.md`, cookbooks 05, 26, 35, 36, `docs/mobile-v3/heartbeat.md`.

**Key facts the Researcher must find**
- Pattern 18 and `CloudWatchLogHelper`: double write, central group, per-process cache (GOP-483), `LogJob` from `json.php` and its blacklist (name only), crash-report allowlist.
- `lib/BaseErrorHandler.php`: the group of `sendToCloudWatch()` and the fields (`errorId`, `utente`, `pagina`, …); `sendToDB()`: the model/table written (`ErrorLog` → which table of which database) and the no-user branch (`error_log`).
- Every log group name actually written by code on `php8` (`git grep "/goplanner/"` in `lib/`, `scripts/`, entry points); in particular the heartbeat's group in `HeartbeatController` / `MobileV3/AccessLog.php` → [CONFLICT] 8.
- Cookbook 36: never-logged fields, `log_level`, the four alarms with thresholds and options, the hourly cron, the Terraform paragraph («fuori da questo repository»); cookbook 26: dates, 28/29, the pairing rule.
- `docs/mobile-v3/heartbeat.md`: frequency, fields (names in words), 2048 byte, the 403 behaviour; GOP-550.
- The «Logs Insights» rules of `.agents/skills/cloudwatch-log-investigator/SKILL.md` (only the rules, never the region or tool names beyond «Logs Insights»).
- Retention of log groups: any statement in the repository or Jira (GOP-163); if none, omit.

---
### `## Fonti`
Built by the Writer from the dossier entries actually used, in the STYLE_BIBLE format (`codice: …`, `wiki: …`, `docs: …`, `Portolano: …`, `Jira: GOP-NNN — titolo breve`). Every Jira key with a short **neutral** title written by the Writer (never a Jira summary that contains a name, a committente or a host). No URLs, no hostnames.

---

## REVIEWER READINESS NOTES

### Tension points (where the chapter must create real stakes)
1. **Published is not running (GOP-270; § 1 symptom, § 5 mechanism, § 6 detection).** Stakes: ten months of mobile records missing for 28 commesse out of 29, while every publication looked done; the diagnosis of «dove si è fermato il dato» (ch.12) had no data to read for that period. Resolution: two separate targets, an immutable SHA tag, the digest comparison, the silence check. The story is told once per role; no section retells another's part.
2. **One cluster for everyone (§ 3, § 5).** Stakes: an `--apply` launched from a development or local stack migrates production; a test that writes from the local stack writes on a real commessa; the debug identifier of the app can route a mobile test onto a production commessa. Resolution: preview by default, explicit target, `--yes` without a terminal, throwaway MySQL for every test that writes, the `--tenant` guard.
3. **The folder copied by hand (GOP-317, § 5).** Stakes: a copy of a working copy erased an already-released correction and broke the call-center schedules in production, with no trace of what had been put there. Resolution: release by explicit sha, lock, plan, `php -l` first, backup, manifest, refusal of hand-made drift.
4. **Green does not mean tested, merged does not mean released (§ 1, § 4).** Stakes: a ticket closed on a green pipeline while the database tests never ran, or on a merge while production still runs the old image. Resolution: the pipeline's exact job list; the tests that run by hand go into the Jira comment; the closing rule ([CONFLICT] 6).
5. **The plan that lies (GOP-103, § 2).** Stakes: an agent starting a task before its blocker, or crossing a human checkpoint without stopping. Resolution: Jira is the only authority; `CP-` tickets are never implemented or closed by an agent.
6. **Someone else's containers (GOP-205, § 3).** Stakes: a suite run in a copy of work actually runs in the main checkout's stack. Resolution: `scripts/run-tests-worktree.sh` and the label check.
7. **The key that signs the phones' update (§ 5).** Stakes: whoever holds the signing key can make every phone install an APK. Resolution: off-line signature by one person with a key separate from the APK's, never reachable by agents; the server verifies and never signs; the app verifies again.

### Key chains to make explicit (cause → consequence → reader action)
- `docker stack deploy` pins a digest → a moved tag does not move the service → publish, then `make deploy_app`, then compare with `make app_image_digests`.
- Publication from a normal checkout → default channel `php8` → the older production line is never retagged by accident → `latest` only when typed.
- No terminal on stdin → no consent → `make deploy_app` refuses → release from an interactive shell.
- Same cluster for development, local, test and production → `--apply` anywhere migrates production → preview first, explicit `--tenant`, run from a throwaway container of the release image.
- Applied migration edited → checksum mismatch → the executor refuses → write a new migration (fix forward).
- Commessa not conforming to v0 → «excluded» → untouched until aligned → `make schema_check`.
- Folder of the API released by hand → no trace, erased correction (GOP-317) → `make release_api_dry_run COMMIT=<sha>`, then `make release_api COMMIT=<sha>`.
- Hand-made change on the host since the last release → the script refuses → read the dry run, then decide whether `ALLOW_DRIFT=1` is justified.
- MR touches code without a changeset → warning, not failure → write the changeset or add the label «nessun changeset».
- Changeset merged → appears in Novità only when the code that contains it runs → the office sees it after the release, not after the merge.
- Debug build presents one shared identifier → it may route to a production commessa → always `--tenant=<commessa>`.
- Copy of work with the main checkout's folder name → same Compose project → `scripts/run-tests-worktree.sh`.
- Mobile group silent, web group writing → anomaly → `check_mobile_log_silence.php` flags it the next day.
- Phone silent more than 48 ore → «dispositivo silenzioso» → staff checks the phone side (ch.8), not the server.
- `release_sequence` reused → the update is not newer for the app → one more than the highest ever published, on any channel.

### Risk proportionality guards (each risk paired with its balancing context)
- **Shared cluster** → the commesse di prova are separate databases; writing scripts default to a preview and require an explicit target; every test that writes has a throwaway MySQL. Never write «lo stack locale scrive in produzione» as a blanket statement: say «punta allo stesso cluster; quello che scrive, lo scrive sul database della commessa a cui punta».
- **GOP-270** → closed; what changed is concrete (two targets, SHA tag, digests, silence check, `LogChannelHealth`). Tell it as the reason for today's rules, not as an ongoing failure; no blame, no names.
- **GOP-317** → closed by the release script; same tone.
- **Manual releases** → a deliberate decision (no secrets in CI, release runner later); each target has its refusals. Never «i rilasci non sono controllati».
- **PHP 8.4 not in production** → validated flows listed, gaps listed, legacy libraries syntax-compatible and functionally tested on real files. Never «PHP 8.4 non funziona»; never present it as live.
- **Idempotency missing** → needs a saved request plus a lost confirmation plus a retry; visible to the staff; one sentence (same guard as ch.12).
- **Free CI minutes** → reason for light jobs; no alarm.
- **Alarms outside the repository** → say «definiti fuori dal repository»; if their status is unknown, say so; never claim they page someone.
- **Signing key** → separation of keys plus double verification; never imply an agent or the server could publish an update.
- **Secrets in the sources** → the book shows none of them; «il gestore segreti» is named only as the place passwords come from.

### Counter-objections planned (STYLE_BIBLE requires ≥ 2; five are planned)
1. § 1 — «La pipeline è verde e la MR è unita: la modifica è in produzione?»
2. § 2 — «Il piano in `tasks/` dice un ordine diverso da quello di Jira: chi ha ragione?»
3. § 3 — «Ho cancellato dati di prova dal mio stack locale: ho toccato la produzione?»
4. § 4 — «La pipeline è verde: i test sono passati?»
5. § 5/§ 6 — «Il gruppo mobile di una commessa è vuoto da una settimana: è un guasto?»

### Litmus test for this chapter
A new developer or coding agent, with only this chapter, can: take a Jira ticket and tell whether it is ready; start a stack in a fresh copy of work without touching anyone else's containers; choose and run the right test, writing only on a throwaway MySQL or a commessa di prova; open an MR with a valid changeset; know what the pipeline proved and what still has to be run by hand. A new member of the staff tecnico can: publish and re-pin the main image and prove which commit is running; release the API folder from a sha with a dry run first; preview and apply a migration to one commessa without migrating the others; publish a GOPlanner 3 update knowing who signs; go from an 8-character code to the full error; read the four channel alarms and the silence check.

### Structural checks for the Editor
- One H1 `# 16. Operazioni, qualità e rilasci`; the italic «In questo capitolo»; six `##`; `## Fonti` last; no raw HTML; no images.
- Every section has its italic audience line, a Limite paragraph and at least one exact target, script, file, number or date.
- Code blocks: ```bash only, short, `make` targets and repository scripts with placeholders; no `aws`, `ssh`, `scp`, `docker login` lines; no URIs, hostnames, accounts, regions, digests, ports, paths outside the repository.
- No vendor or model name for AI; no person, committente or test-commessa name; «capitano»/«macchinista» never appear.
- GOP-270 told once per role (§ 1 symptom, § 5 mechanism, § 6 detection); ch.12's runbook referred to, not retold; ch.2's numbers not repeated.
- The closing is a desk rule about proof after the act; it echoes no earlier chapter and is not a farewell to the book.

---

## RESEARCHER BRIEF

**Web search terms:** none. INSTRUCTION.md § Researcher, SOURCE OVERRIDE: the web is not a source for this book. The behaviour of `docker stack deploy` (tag resolved to a digest once) is already stated in the repository (`Makefile`, cookbook 07): cite those, not the web. The GOPlanner repository (`/home/alan/firstmate/projects/GOPlanner`, branch `php8`) is READ ONLY: Read/Grep/`git grep`/`git log`/`git show` only; no checkout, pull, stash, composer, npm, docker, make, and **never run any release, migration, check or test script** — read their headers and code.

### Documents to prioritize (in order)
1. Code and build files on `php8` (authority when sources disagree): `Makefile`, `.gitlab-ci.yml`, `Dockerfile`, `Dockerfile-8.4`, `docker-compose-linux.yml`, `docker-compose.test.yaml.template`, `phpunit.xml`, `scripts/migrate.php`, `scripts/release-api-dev.sh`, `scripts/with-throwaway-mysql.sh`, `scripts/run-tests-worktree.sh`, `scripts/changeset_check.mjs`, `scripts/check_canale_log.php`, `scripts/check_mobile_log_silence.php`, `scripts/mobile-v3-update/`, `lib/CloudWatchLogHelper.php`, `lib/BaseErrorHandler.php`, `lib/Novita.php`, `lib/MigrationRunner.php`, `lib/MobileV3/Feedback/TicketGop.php`.
2. Decision records: `docs/02-patterns/26-jira-come-state-storage-dei-task.md`, `30-ingestione-ticket-completati-in-rag.md`, `45-schema-canonico-tenant.md`, `46-changeset-changelog-per-tenant.md`, `48-ticketing-base.md` (§ 8 only), `18-cloudwatch-logging-infrastructure.md`.
3. Cookbooks: `docs/03-cookbooks/05-cloudwatch-logging.md`, `07-deployment-guide.md` (§ «Percorso canonico» and the GOP-482 paragraph; the rest is partly historical — see [CONFLICT] 2, 3), `11-local-testing-with-docker.md`, `15-guida-test-ui.md`, `18-testing-headless-master.md`, `19-seeding-dati-test-db.md`, `20-test-mobile-headless.md`, `21-e2e-test-cycle.md`, `22-migrazione-php84.md`, `25-isolated-worktree-docker-testing.md`, `26-controllo-silenzio-log-mobile.md`, `27-rilascio-api-dev.md`, `35-errori-dei-job-in-background.md`, `36-osservabilita-canale-mobile.md`.
4. `migrations/README.md`, `migrations/main/README.md`, `changeset/README.md`, `docs/mobile-v3/aggiornamento.md`, `docs/mobile-v3/heartbeat.md`, `AGENTS.md` (§ 3 PHP Migration, § Container config overlay, § 8.5, § 8.6), `tasks/php84-rollout.md` (status and «Principio guida» only), `DUBBI.md` (only PHP 8.4 items).
5. Repository skills (procedures, cite as code paths): `.agents/skills/implement-ticket/`, `goplanner-headless-tests/`, `goplanner-e2e-test/`, `cloudwatch-log-investigator/`.
6. Portolano, then Jira.

### Wiki paths
The wiki has no page on releases, tests or CloudWatch (checked in `wiki/index.md` on 25 novembre 2026). Use only:
- `wiki/index.md` (to confirm the absence, one line in the dossier)
- `wiki/assistenza-clienti/runbook-dove-si-e-fermato-il-dato.md` (only to point to it from § 6, no content)
- `wiki/assistenza-clienti/annunci-novita-campanella.md` (only the Novità sentence for the § 4 office box)
- `wiki/documentation/documentation-maintenance-workflow.md` (only if it says how docs and the Portolano are updated at the end of a task)

### Code paths and grep patterns (read-only)
- Release targets: `sed -n '1,100p' Makefile`; `grep -n "^publish_app:\|^deploy_app:\|^app_image_digests:\|^release_api\|^publish_chatbot:\|^deploy_chatbot:\|^schema_check:\|^changeset_" Makefile` and the comment block above each.
- CI: `grep -n "^[a-z_0-9]*:$" .gitlab-ci.yml`; `grep -n "phpunit" .gitlab-ci.yml`; header and footer comments.
- Runtimes: `grep -n "^FROM\|8\.3\.36" Dockerfile Dockerfile-8 Dockerfile-8.4`; `grep -n '"php"' composer.json`; `grep -n "image:" docker-compose-linux.yml docker-compose-local.yml docker-compose.yml` (record the tag only, never the URI).
- Migrations: header of `scripts/migrate.php` (options, exit codes, warning); `ls migrations/main | wc -l`, `ls migrations/tenant | wc -l`, `ls migrations/tenant/modules`; `git grep -n "checksum" -- lib/MigrationRunner.php | head`.
- API folder release: `sed -n '1,120p' scripts/release-api-dev.sh` (header); `grep -n "SCHEMA_GATE\|migrate.php\|ALLOW_DRIFT\|php -l\|smoke" scripts/release-api-dev.sh`.
- Changeset and Novità: `scripts/changeset_check.mjs` (exit codes, what counts as code), `ls changeset | wc -l`, docblock of `lib/Novita.php` (`perCliente`, `perAmministratore`, `GOP_AMBIENTE` — name only).
- Jira link: `lib/MobileV3/Feedback/TicketGop.php` (events and target states), `git grep -n "TicketGop" -- lib scripts *.php | head`.
- Errors: `grep -n "function sendToCloudWatch\|function sendToDB\|log_group\|ErrorLog" lib/BaseErrorHandler.php`; `git grep -n "class ErrorLog" -- lib` (which table).
- Log groups: `git grep -h -o "/goplanner/[A-Za-z0-9_<>{}\$.-]*\(/[A-Za-z0-9_-]*\)\?" -- lib scripts json.php json_android.php mobile_v3.php acra-report.php | sort | uniq -c | sort -rn`; heartbeat: `grep -n "goplanner/" lib/MobileV3/Resource/HeartbeatController.php lib/MobileV3/AccessLog.php lib/MobileV3/Kernel.php`.
- Channel checks: headers of `scripts/check_canale_log.php` and `scripts/check_mobile_log_silence.php`; `grep -n "const\|48\|0.2\|30\|6" lib/MobileTassiCanale.php | head -20`.
- Tests: `ls tests/*_Test.php | wc -l`; `grep -n "testsuite\|directory" phpunit.xml`; header of `scripts/test_mobile_android_live.php` (guard; never copy the identifier value).
- App update: `ls scripts/mobile-v3-update/`; header of each script.
- Key convention: `git log --oneline php8 -300 | grep -c "GOP-"` and `git log --merges --oneline php8 -100` (branch names) — report counts and the date.
- History: `git log --oneline -i --grep="GOP-270\|GOP-317\|GOP-205\|GOP-711\|GOP-712\|GOP-339\|GOP-696\|GOP-828" php8 | head -40`.

### Portolano queries (`mcp__rag_qdrant_server__query_rag_hybrid` with `user_roles: ""` — the EMPTY string, per INSTRUCTION.md; fall back to `query_rag`)
- «publish_app deploy_app tag digest docker stack deploy GOP-270»
- «log mobile CloudWatch spento dieci mesi 28 tenant su 29»
- «rilascio api dev release_api COMMIT sha manifest drift GOP-317»
- «migrate.php anteprima apply schema_migrations checksum expand-only»
- «schema canonico baseline v0 moduli migrazioni del tenant GOP-696»
- «changeset Per il cliente Tecnica changelog per tenant Novità GOP-711»
- «Jira source of truth stato Bloccato checkpoint CP- criteri di accettazione verifica»
- «stack Docker worktree isolato run-tests-worktree progetto compose GOP-205»
- «MySQL usa e getta with-throwaway-mysql test che scrivono»
- «test mobile headless guardia tenant sim_id fluttuante»
- «migrazione PHP 8.4 costruttori PHP4 validazione funzionale Dockerfile-8.4»
- «CI GitLab job php_lint changeset_check rilasci fuori dalla CI»
- «check_canale_log allarmi coda ferma picco scarti dispositivo silenzioso»
- «heartbeat GOPlanner 3 ogni 5 minuti coda pending ultimo errore di invio»
- «manifesto aggiornamento APK firma fuori linea release_sequence stable pilot»
- «errorId CloudWatch errors gruppo codice errore Logs Insights»

### JQL fragments (cloudId `21873985-2e5d-4a8a-bb45-e6d453128985`, project GOP, READ ONLY)
- `project = GOP AND key in (GOP-103, GOP-163, GOP-199, GOP-205, GOP-226, GOP-234, GOP-264, GOP-270, GOP-274, GOP-317, GOP-338, GOP-339, GOP-340, GOP-407, GOP-482, GOP-483, GOP-550, GOP-698, GOP-699, GOP-700, GOP-709, GOP-711, GOP-712, GOP-735, GOP-828, GOP-864)`
- `project = GOP AND comment ~ "in produzione dal" ORDER BY updated DESC` (closing practice, [CONFLICT] 6; read 5–10 comments, record only the pattern, never names)
- `project = GOP AND status = Bloccato ORDER BY updated DESC` (does the state exist and is it used; count only)
- `project = GOP AND summary ~ "CP-" ORDER BY created DESC` (checkpoint convention in use; count only)
- `project = GOP AND (text ~ "php84" OR text ~ "PHP 8.4") ORDER BY updated DESC` (rollout status at the research date)
- `project = GOP AND text ~ "Terraform" AND text ~ "allarm" ORDER BY updated DESC` ([CONFLICT] 7)
- Purpose: neutral short titles for `## Fonti`; one real story per section where the dossier allows (problem → cause → fix, no names): GOP-103 drift (§ 2), GOP-205 (§ 3), GOP-698 (§ 4), GOP-270 and GOP-317 (§ 5), GOP-270 detection and GOP-828 (§ 6); statuses of GOP-699 and GOP-407 at the research date.

### Specific facts, numbers and labels to hunt
- GOP-270: 16–31/10/2025; 28 of 29; «dieci mesi»; 9 settembre 2026.
- Two tags per publication; default channel `php8`; two architectures; the word typed for `deploy_app`.
- Releases outside CI: 14/10/2026. CI: job names; 400 minuti al mese; timeouts 5/15 minuti.
- Jira: four states; `CP-`; five parts of the description.
- Local: the six first-run steps; empty page 200; GOP-205.
- PHP: 7.3 / 8.3 (≥ 8.3.36) / 8.4 (version of the 8.4 image); 16 pages; the root cause in the database layer; the two audit tools; «bozza».
- Tests: count of test files and date; suites; the ladder; the `--tenant` guard; smoke targets.
- Changeset: three `tipo`; two sections; failure vs warning (exit 2); label «nessun changeset»; `changeset_anteprima`.
- Release of the API folder: the eleven steps; 401 and 200 checks; `ALLOW_DRIFT=1`; 16/09/2026; GOP-274.
- Migrations: expand-only; checksum; `--yes`; lock 10 secondi; exit 0/1/2; «excluded»; main series by hand; 100-character id limit for per-commessa migrations.
- App update: three scripts and roles; five steps; 14 giorni (1–90); `release_sequence`; `stable` / `pilot`; decision date 23/10/2026.
- Observability: double write; quota 5 per second (GOP-483); crash trace ~4 KB; never-logged fields; heartbeat every 5 minuti, 2048 byte; `log_level` 0–4 default 1; alarms 48 ore / 30 giorni, 0,2 / 60 minuti / 30 richieste, 6 ore; hourly cron; exit 1.

### Mandatory [CONFLICT] items to record
1. **PHP per line.** `AGENTS.md` § 3 «PHP 7.3 → PHP 8.1»; cookbook 07 «PHP 7.3 … (`Dockerfile`, produzione)» and, lower down, «`Dockerfile` (php 8.3, radice del repository)»; cookbook 22 «Il runtime di produzione resta PHP 7.3 (`Dockerfile`)»; cookbook 18 «PHP 7.3.33» in the local `app` container; `Dockerfile` on `php8` `FROM php:8.3-…`; CI `php:8.3-cli`; GOP-226 (closed) asked exactly this. Code wins: state which runtime each line and each compose service uses at the research date.
2. **Orchestration.** Cookbook 07 § Panoramica «AWS ECS» and a GitHub Actions workflow marked «Raccomandato» vs Docker Swarm (`docker stack deploy`) in the `Makefile`, cookbook 07 § «Percorso canonico» and `tasks/php84-rollout.md`; GitLab CI runs tests only; the `Makefile` mentions «the abandoned ECS deployment». Check whether `.github/workflows/` exists. Code wins: the chapter describes Swarm and GitLab; ECS and GitHub Actions are not presented as in use.
3. **Local database.** Cookbook 07 § «Setup Sviluppo Locale» shows a `mysql` container in `docker-compose-local.yml`; the actual file and cookbook 18 («non esiste un container `db` locale») point at the shared cluster through a tunnel. Code wins.
4. **Test counts and CI coverage.** (a) cookbook 22 «Suite PHPUnit: 136/136» (historical) vs the current number of test files; use the current count with its date, or no number. (b) Is any CI job running the PHPUnit suite of `tests/`? From `.gitlab-ci.yml`; the Writer's § 4 sentence depends on it.
5. **Runner of `changeset_check`.** ADR 46 says the job runs on the `wsl-test` runner; `.gitlab-ci.yml` defaults to GitLab's shared runners with `RUNNER_TAG` as the switch. Code wins.
6. **When a Jira ticket closes.** ADR 26: «Completata» after the «Verifica» is executed and its output attached; practice visible in Jira comments: closure once the work is in production («in produzione dal …»). Record both; if they are two conditions of one rule, say so; if no Jira evidence, `[UNVERIFIED]` and the Writer states only ADR 26.
7. **Alarms.** Cookbook 36 § «CloudWatch / Terraform» describes the alarms as to be built outside the repository («non fatto qui»). Are they live at the research date? If no source says: `[BLOCKED: needs human input — allarmi CloudWatch sul canale mobile attivi?]`; the Writer says «previsti, definiti fuori dal repository».
8. **Heartbeat group.** `docs/mobile-v3/heartbeat.md` says «da CloudWatch» without naming the group; find the group in code (`HeartbeatController`, `AccessLog`, `Kernel`). If not found: no group name in the text.
9. **E2E app version.** Cookbook 21 describes the older Android app (1.x package and its screens); is there an E2E cycle for GOPlanner 3 (`docs/mobile-v3/`, `.agents/skills/goplanner-e2e-test/`)? The Writer names the version the dossier confirms.
10. **`TicketGop` active?** ADR 48 § 8 describes automatic transitions triggered from outside GOPlanner; confirm the class and whether any repository code calls it. If only the library exists: «previsto» / «la libreria esiste; chi la attiva è fuori da GOPlanner».
11. **Master database migrations.** `migrations/README.md` / `migrations/main/README.md`: «nessun esecutore, si applica a mano» — confirm no newer executor covers `migrations/main/` (`git grep -n "migrations/main" -- scripts lib`).
12. **What `release_api` does with migrations.** `scripts/release-api-dev.sh` step 12 runs `php scripts/migrate.php --all` (a preview, by the executor's default) and `schema_conformita.php`; `SCHEMA_GATE=block` turns «tenants left behind» into an exit code. Confirm it never applies; state it in words.

### Security filter reminder
The sources for this chapter carry an AWS account number, a region, registry URIs, database cluster hostnames, an internal IP, SSH users and hosts, key paths, an IAM role ARN, public-key material, mount paths, Swarm service names and ports, image digests, test login names and a commessa id, and placeholder notes for passwords. None of these goes into the dossier: replace each with a neutral description («il registro delle immagini», «il cluster del database», «il server di sviluppo», «un'impronta dell'immagine», «la chiave pubblica di verifica»). No names of people (the sources call the release decider by an internal nickname: write «una persona dello staff tecnico»), no committente or test-commessa names, no Jira text with names, no `.env` values, no secret-variable names, no identifier the debug app sends. Example commands keep only `make` targets and repository scripts with placeholders.

---

## TARGET

- **Word count:** 5.600–5.900 words in total (PRD § 4: 4.000–6.000), `## Fonti` excluded. Breakdown: «In questo capitolo» ~80; § 1 800; § 2 800; § 3 1.000; § 4 1.050; § 5 1.200; § 6 1.000. If the Writer must cut, cut from § 3 (PHP 8.4 detail) and § 5 (release_api safeguards list), never the procedures or the Limite paragraphs.
- **Opening hook strategy:** open § 1 on GOP-270 told as a symptom — between 16 and 31 ottobre 2025 the mobile records stopped for 28 commesse out of 29 with an active web channel and nobody noticed for about ten months, because a new image had been published while the running services stayed on an older one — so that in four sentences the reader holds the chapter's rule: a stage is finished when its proof says so, not when its command ends.
- **Closing beat promise:** end § 6 on the same story turned into a desk rule that echoes no earlier chapter — today the silence check would have flagged it the next day, because a channel is judged next to a sibling that speaks — and before anyone writes «in produzione» in a Jira comment they read the proofs (the SHA tag, the digest the service runs, the row in `schema_migrations`, a channel that keeps writing), never the success message of the command they launched.
