# Chapter 15 — Struttura (Architect spec)

**Chapter title (H1 for the Writer):** `# 15. Integrazioni e API`
**PRD row:** «Con chi parla GOPlanner: API per l'app mobile (envelope, sincronizzazione in ingresso), API v2 e Call Center / VoiceAI, motore unico di operazioni console/API/MCP, AI vision, mappe, Portolano (RAG)» — audience **DEV**. PRD § 4 «Confini» also assigns here: the architecture of the Gea service.
**Core question of the chapter:** who talks to GOPlanner from outside, through which door each caller enters, and what every door must settle before it touches the data of a commessa?
**Chapter thesis (the rule the whole chapter proves):** every door answers three questions, in this order, before reading or writing anything: **chi chiama** (the credential), **su quale commessa** (where the tenant context is set, and on which connection), **con quale contratto** (format, errors, retries). The newer doors (`/v3/` for GOPlanner 3, the motore unico behind `/api/v2/` and `/mcp`, the Gea service) answer them once, in one declared place; the older doors answer them each in their own way — and that is where the bugs of «commessa sbagliata» are born. A new capability enters as an operation of the motore or as a PHP action, never as a database credential given to an external service.

### Continuity and glossary check (done by the Architect, 25 novembre 2026)
- `chapter_index.md`: not present. `NARRATIVE_GLOSSARY.md`: not present. Canonical vocabulary = `/home/alan/firstmate/projects/GOPlanner/CONTEXT.md`. Chapters 13, 14 and 16 have no struttura yet: the boundaries below are the Architect's reading of PRD § 4.
- Promises already made **to this chapter** by written chapters (ch.15 must keep each one, briefly):
  - ch.4: the call center and «Sara» (annullata nel file, «Pratiche da richiamare») → only for commesse that use the call center; «per il call center vedi il capitolo 15».
  - ch.5: «Centralino» appears only where the commessa has it on (→ ch.15); interventi in state Prenotato (10) «nascono dall'assistente vocale del call center quando prenota senza indicare un operatore (capitolo 15)»; «[VERIFICARE UTENZA]» = intervento taken by the assistente vocale recognising the utenza from the nominativo.
  - ch.8 (DEV boxes): key pair EC P-256 in the phone's keystore, `device_id` = first 32 hex characters of the SHA-256 of the public key, every `/v3/` request signed `GOP-Sig-1`; `GET /v3/interventi` is a complete snapshot with a hash per intervento; `Idempotency-Key` on every write; only 2xx and non-retryable 4xx are saved, **except** `intervento_locked` and `already_closed` (`ApiError::STATE_DEPENDENT`); `not_found` **is** saved; registry kept 30 giorni; comandi remoti are sent by an agent or the porta MCP, the office page only approves; clock accepted within 300 secondi. **Ch.15 must not contradict any of these**; it explains the server side, it does not retell the phone side.
  - ch.9: the routes of the app for the magazzino are «in `docs/mobile-v3/magazziniere.md` (capitolo 15)» → route names only.
  - ch.10: «L'architettura del servizio è nel capitolo 15»; the table row «spiega come funziona → per l'architettura, il capitolo 15». Ch.10 named no provider and no model; ch.6 named no model either.
  - ch.6: AI analysis «propone, l'ufficio decide»; «Analisi AI non ancora disponibile su questa commessa.»; an analysis stuck «in corso» > 30 minuti becomes an error. Ch.15 explains the engine behind it; it does not repeat the Verifica procedure.
  - ch.12 (struttura): «Console JSON» → one row there + pointer to ch.15. Ch.15 § 2 explains it.
- **Glossary traps specific to this chapter (Writer and Editor must check all nine):**
  1. **Commessa / tenant.** This is a DEV chapter: «tenant» is allowed only when it names code (`custom/{tenant}`, `TenantBootstrap`, `tenant_disabled`). First occurrence: «la commessa, che nel codice si chiama tenant». In prose the word is «commessa».
  2. **The Call Center API speaks English nouns that clash with the glossary.** `customer` = the commessa (a row of `clienti`, found from the number called), `users` = **utenze** (not utenti!), `technicians` = **operatori**, `campaigns` = **liste**, `leads` = **pratiche** of a lista, `appointments` = **interventi** prenotati. The Writer gives this as a table (§ 3) and from then on writes the glossary word in prose, the English word only inside `code`.
  3. **«Appuntamento»** is a «Da evitare» word for intervento. Prose: «intervento prenotato»; `appointments` only as code; «Appuntamenti in attesa di assegnazione» only as a quoted UI label (ch.5).
  4. **Gea** in prose; `chatbot-service/`, `chatbot_*` only as code names. Never «il chatbot» or «il bot» as a noun in prose (CONTEXT.md «Da evitare»), not even in this DEV chapter: write «il servizio di Gea».
  5. **AI**: prose says «l'AI» or «l'analisi AI delle foto». The **gateway** (OpenRouter) and the configuration variable names may be named here, in DEV text only; **model names are never written** (they change and the variable is what a developer needs).
  6. **Operatore** (field) vs **utente** (gestionale) vs **identità** (the person on the DB master, ADR 25, ch.11). The motore unico and OAuth bind to the **identità**: say it with that word and point to ch.11 for its meaning.
  7. **Staff tecnico**, never «sviluppatori» as a role of GOPlanner people who decide. The reader *is* a developer; decisions such as applying a migration or opening a door in production belong to «lo staff tecnico» (never a personal name, never «il capitano»).
  8. **Attività** (glossary) vs **log/registro**: in this DEV chapter «log» is allowed for server logs; the registers of the motore and of the idempotency are «registro» (their code names: `operazioni_registro`, `mobile_v3_richieste`).
  9. **Portolano** = the RAG knowledge base of the staff and of Gea (PRD wording). First occurrence: «il Portolano, la base di conoscenza interrogabile per significato (RAG)».

### Chapter boundaries (one-line pointers only, per PRD § 4 «Confini tra capitoli»)
| Topic touched here | Owned by | What ch.15 may say |
|---|---|---|
| Internal request flow `index.php` → `pages/` → Smarty; `json.php?action=` → controller method; job queue, worker, websocket | ch.13 | One row in the § 1 door table («il gestionale stesso») + «vedi il capitolo 13» |
| Tables and columns (`interventi_eseguiti.servizi`, `foto`, `posizione`, `operazioni_registro`, `mobile_v3_richieste`) | ch.14 | Name the table an integration writes to; never its schema; «vedi il capitolo 14» |
| Deploy of the PHP image and of `chatbot-service/`, Docker, environment variables in production, CloudWatch, test suites, PHP 8.4 migration | ch.16 | «La porta è chiusa senza configurazione» + the variable **names**; how to set them → «vedi il capitolo 16» |
| What the operatore sees: pairing, «Riprova», queue, comandi remoti page | ch.8 | Server contract only; one sentence + «vedi il capitolo 8» |
| Gea for the user: panel, runbook, proposte, ticket card | ch.10 | Only the service architecture; proposte as «vedi il capitolo 10» |
| Verifica interventi, «Analisi AI» flow for the revisore, Impostazioni › Analisi AI delle foto | ch.6 | The engine and its contract; one sentence + «vedi il capitolo 6» |
| Cruscotto Analisi AI, Manutenzione, Errori app e Log | ch.12 | One sentence each + «vedi il capitolo 12» |
| Prenotato page, zone outbound, fasce/slot, Centralino as a menu voice, Geocodifica «Riprova le non trovate» | ch.5 (and ch.3 for coordinates) | The API side and the chain; one sentence + pointer |
| Identità, RBAC, `rbac_enforce`, profili | ch.11 | The rule the doors apply (tipo minimo, permesso); the meaning → «vedi il capitolo 11» |

---

## NUFs (Goal Scoring)

Ten NUFs, so the Editor can score one point each against the 8.5/10 gate. Format per INSTRUCTION.md § Architect.

```
utility(reader): Reader can name, for each caller of GOPlanner — the gestionale, the app GOPlanner 3, the app GOPlanner 1.x and the timbratori, the call center and its assistente vocale, an agent or integration on the motore unico (REST or MCP), the service of Gea — the door it enters (URL prefix and PHP file), its credential, and where the commessa is chosen; and can open the right file first when that caller misbehaves → score += 1

utility(reader): Reader can read a `/v3/` response and error: the envelope (`contract`, `request_id`, `data`/`error`), the meaning of `retryable` and `Retry-After`, the order of the checks (`X-Request-Id` → `X-GOP-Client` → signature → route → commessa → `Idempotency-Key` → controller), and can say which HTTP code each check produces → score += 1

utility(reader): Reader can explain what the idempotency registry does with a repeated write (same key, same body → saved answer with `Idempotent-Replay: true`; different body → 409 `idempotency_conflict`; still running → 409 `request_in_progress`, `Retry-After: 2`), what is never saved (5xx, 429, retryable errors, the two state-dependent 409), and why the legacy `json_android.php` cannot promise the same → score += 1

utility(reader): Reader can map the Call Center API to the glossary (`customer`, `users`, `technicians`, `campaigns`, `leads`, `appointments`), say which state each booking call writes (Assegnato 3, Prenotato 10 with operatore 0, Annullato 9 — and why not Ripianificabile 8), and explain the lock that protects a booking (409 `SLOT_TAKEN` with alternatives, 503 `BOOKING_BUSY` after 5 secondi) → score += 1

utility(reader): Reader can state the invariant of `api_cc.php` — every read reachable from `CallCenterController` must be qualified with the schema of the commessa, because the switch re-points only the master connection — tell the two real cases (GOP-274, GOP-276) and find their regression tests → score += 1

utility(reader): Reader can add a read operation to the motore unico (a method of `OperazioniController` + an entry of `OperazioniCatalogo`) and list what the engine gives for free: schema validation, perimeter of the commessa per call, permesso or tipo minimo, fields and cursor, register; and for a write: preview, signed code (5 minuti, single use), re-read of the record (`record_cambiato`), `conferma_blocco` over 50 records → score += 1

utility(reader): Reader can explain why the service of Gea holds no database credential (every read through `JSONController` `chatbot_*` actions, a short-lived token plus a service header, both required), where the Portolano sits in Gea's answers (public role only, no developer paths, the README of the session's commessa only), and how the staff's own Portolano is fed (analyser skill, completed Jira tickets with a secret scan) → score += 1

utility(reader): Reader can trace the outbound calls GOPlanner makes — AI of the foto (one call per foto, fixed validated format, own tables only), geocoding (order of the sources, never the centre of the comune, AI correction with code checks), distance matrix of the zone (OSRM `/table`, blocks, NULL never 0, retry schedule) — and say what happens to the data when each external service does not answer → score += 1

utility(emotional): Reader feels safe touching an integration because the dangerous paths are named with their guard: the motore writes only after preview and code and keeps a register for 12 mesi; the dati di prova only on test commesse; the comandi remoti only on enabled commesse and, in production, after approval; the Console JSON and the `dev` environment write on real data and say so — and knows which decisions are not theirs to take alone (applying migrations, opening a door in production, enabling commands on a production commessa) → score += 1

utility(factual): The chapter states, each with its source: `/v3/` limits (JSON 1 MiB, multipart 21 MiB, in-progress row taken back after 120 s, registry 30 giorni; `docs/mobile-v3/envelope.md`); motore numbers (OAuth code 60 s, access 1 ora, refresh 30 giorni, rows 20/max 200, 120 chiamate al minuto, code 5 minuti, register 12 mesi; `docs/02-patterns/42-…`); call center lock timeout 5 s (`docs/cc/architettura-api-cc.md`); OSRM `MAX_TABLE_COORDS` 100 and retries 1/5/15 min, 1/3 h (`docs/02-patterns/45-matrice-distanze-zone-outbound.md`); AI correction checks `place_rank` ≥ 26 and 30 km (`docs/02-patterns/51-geocodifica-correzione-ai.md`); Gea's RAG limits (10 results, 2 searches per turn; `chatbot-service/src/tools.ts`) → score += 1
```

**PASS tests the Editor can apply quickly:** the chapter contains (a) one door table (caller → door → credential → commessa → contract → chapter) in § 1; (b) one glossary-mapping table for the Call Center API in § 3; (c) one table or list of the `/v3/` checks in order with their codes in § 2; (d) one table of the motore's numbers (OAuth, rows, rate, code, register) in § 4; (e) one numbered procedure «aggiungere un'operazione di lettura al motore» in § 4; (f) at least one `> **Attenzione:**` box on real writes (Console JSON or the `dev` environment) and one `> **Quando chiedere allo staff tecnico:**` box; (g) no model name, no hostname, no key or token value, no IP anywhere.

---
## BEAT LIST

Six sections (`##` in the final chapter). Each needs: at least one exact concrete detail (route, file, number, code, real case), at least one **Limite** paragraph, max 5 prose paragraphs in a row without a table/list/box/code block/subheading. Every section starts with its italic audience line (STYLE_BIBLE voice rule 6): § 1 *Per lo staff tecnico e gli sviluppatori.*; § 2–§ 6 *Per gli sviluppatori.* (§ 3 and § 5 may add «e lo staff tecnico»). Code blocks: at most one per section, short, real, with the language declared, no host and no secret.

Before § 1 the Writer puts the mandatory `*In questo capitolo…*` paragraph (2–3 sentences): which callers the chapter covers, the three questions every door answers, and that it is written for developers and the staff tecnico — an office reader can stop after the table of § 1.

---

### § 1 — `## Le porte di GOPlanner: chi chiama, su quale commessa, con quale contratto`
**Tag:** [DEV] (readable by [STAFF])
**Core question:** Who talks to GOPlanner from outside, through which door, and which three questions must every door settle before it touches data?
**Word target:** 900 (range 850–1.000)
**Paragraph functions:** Aggancio (the hook case, see TARGET) → Spiegazione (the three questions) → Dimostrazione (door table; the rewrite rules) → contro-obiezione → Limite → Sintesi.

**Content plan**
- Aggancio — the call center case, 4–5 sentences, no committente name: `api_cc.php` switched to the commessa's database by re-pointing only the master connection; reads went to the slave, still on the central schema `goplanner`; an unqualified `SELECT` returned «un risultato plausibile ma sbagliato», without error. GOP-276: `OperatoreLocale::getAll()` returned the operatori of **every** commessa; GOP-274: the slot configuration read from `impostazioni` of the wrong schema. Both fixed, both with a regression test (§ 3 tells the invariant). The lesson stated once: the question «su quale commessa?» is answered by the door, and if the door answers it halfway, nothing downstream notices.
- The three questions, as a short bulleted list: **chi chiama** (session, device signature, `sim_id`, Bearer token, OAuth token bound to the identità, short-lived token of the Gea service); **su quale commessa** (from the session, from the device, from the `sim_id`, from the token or `customer_id`, from the `commessa` parameter checked on every call); **con quale contratto** (HTML/JSON of the gestionale, envelope `contract 3.0`, JSON of the call center, TOON/JSON of the motore).
- `### La mappa` — the door table (one row per caller; only rows the dossier confirms): *Chi chiama | Porta (prefisso → file) | Credenziale | Come si sceglie la commessa | Contratto | Capitolo*. Candidates:
  - il gestionale (browser) → `index.php`, `json.php?action=` → session → session (switch of commessa, ch.2) → HTML / JSON → ch.13;
  - app GOPlanner 3 → `/v3/` → `mobile_v3.php` → signature `GOP-Sig-1` of the paired phone → from the phone's pairing → envelope `contract 3.0` → § 2, ch.8;
  - app GOPlanner 1.x → `json_android.php` (`lib/AndroidController.php`) → `sim_id` → the `operatori` row on the DB master → legacy JSON → § 2;
  - timbratori → `json_timbratori.php` → `sim_id` (GOP-279: the only credential, validated once) → idem → legacy JSON → one line;
  - legacy API → `/api/…` → `api.php` (`ApiController`) → `key` parameter (GOP-279) → from the key → JSON → one line, [verify purpose];
  - call center / assistente vocale → `/api/cc/v1/` → `api_cc.php` (`CallCenterController`) → Bearer: master token or commessa token → `customer_id`, or the token, or the number called → JSON v1 → § 3;
  - agents and integrations → `/api/v2/` → `api_v2.php` and `/mcp` → `mcp.php` → OAuth token bound to the identità → `commessa` parameter, checked on every call → TOON (JSON on request) → § 4;
  - service of Gea → `json.php?action=chatbot_*` → short-lived token + service header → claims of the token, never a request parameter → JSON → § 5, ch.10;
  - staff tools → `json_admin.php`, Admin › «Console JSON» → session of GOPlanner staff only (GOP-294) → chosen by the staff → JSON → § 2, ch.12;
  - public reading forms → `/telelettura/…`, `/autolettura/…` → `telelettura.php` → a form key → the `form` row → HTML → one line **only if** the Researcher confirms what it is.
- Outbound, in one short list after the table (GOPlanner is the caller): the AI gateway (foto, Gea), the geocoding services and the routing server (maps), the push service of the phones (comandi remoti, ch.8), the Portolano (Gea), the log service (ch.16). Details in § 5–§ 6.
- Code block (```apache, ≤ 8 lines, real, from `.htaccess` and `api/.htaccess`): the rewrite rules for `^v3/`, `^mcp/?$`, `^oauth/…`, `^api/cc/v1/`, and `RewriteRule ^v2/ /api_v2.php` — with one sentence: `api/` has its own `RewriteEngine`, so the root rules do not reach it, which is why `/api/v2/` is declared there (pattern 42 § Conseguenze).
- **Contro-obiezione 1:** «`/api/v2/` è la versione 2 dell'API del call center?» → No. `/api/v2/` is the REST door of the motore unico (GOP-629); the call center is `/api/cc/v1/`; they share nothing but the `/api/` prefix. (The PRD row itself lists «API v2 e Call Center» together: the chapter follows the code.)

**Limite (mandatory):** the map is the `php8` branch on 25 novembre 2026; a door present in the code can be closed in an environment (the motore answers 503 without its configuration, § 4) and some legacy doors (`api.php`, `json_timbratori.php`, `telelettura.php`) have little or no documentation — the chapter says what they authenticate with and stops there; how a request flows inside the gestionale is ch.13.

**Key facts the Researcher must find**
- `.htaccess` (root, lines ~49–82) and `api/.htaccess`: the exact rewrite rules for every door; confirm `^api/cc/v1/` vs `^cc/v1/` (both exist).
- `api.php`: which controller, which `method` values exist, who calls it today (Jira, grep `ApiController`), the GOP-279 change («key è l'unica credenziale di questo canale»).
- `json_timbratori.php`: what a «timbratore» is in GOPlanner (one line) and the GOP-279 validation.
- `telelettura.php`: what `/telelettura/{chiave}` and `/autolettura/{chiave}` serve (forms for end customers? which commesse?) — if unclear: `[UNVERIFIED]` and the row is dropped.
- `json_admin.php` + `lib/AdminRequestGuard.php` (GOP-275, GOP-294): who passes.
- GOP-274 and GOP-276: date, symptom, fix, regression tests `tests/CallCenterController_SlotsConfig_Test.php`, `tests/OperatoreLocale_getAll_TenantSchema_Test.php`.

---

### § 2 — `## L'API dell'app: la busta di GOPlanner 3 e la sincronizzazione di GOPlanner 1.x`
**Tag:** [DEV]
**Core question:** What contract does the server keep with the app GOPlanner 3 — envelope, order of checks, signature, idempotency, limits — and how does the older 1.x channel bring esiti and foto in?
**Word target:** 1.050 (range 950–1.150)
**Paragraph functions:** Aggancio (ch.8 told the phone; here the server) → Spiegazione (envelope and checks) → Dimostrazione (table of checks; routes) → Spiegazione (idempotency) → Spiegazione (1.x inbound sync, contrast) → contro-obiezione → Limite.

**Content plan**
- One line of continuity: ch.8 told what the operatore sees («Riprova», the queue); this section is the server's side of the same exchange.
- `### La busta e l'ordine dei controlli` — success `{"contract":"3.0","request_id":"…","data":{…},"meta":{…}}`, error `{"contract":"3.0","request_id":"…","error":{"code","message","retryable","details"}}` (code block ```json, 2 lines). `data` is always an object; a collection is `{"items": [...]}`. The `message` never contains PHP/MySQL text, files or lines: the detail of a 500 stays in the server log under the same `request_id`.
- Table *Controllo (in ordine) | Che cosa verifica | Se non passa*: `X-Request-Id` (kept only if it matches the pattern, otherwise a new one of 26 hex characters, never reflected) → `X-GOP-Client` (format `eu.smartforge.goplanner/<versionName> (<versionCode>) contract=<major>.<minor>`; missing 400 `missing_client_header`, too old or other major 426 `client_too_old`) → signature (401 / 403 `device_revoked`, `device_pending`) → route (404 / 405 with `Allow`) → commessa bootstrap (403 `tenant_disabled`) → `Idempotency-Key` on writes (400 `missing_idempotency_key`) → controller. Note: `X-GOP-Client` is checked **before** authentication, so a phone too old gets 426 even without a valid key; the only public routes are pairing and `/v3/app/update`.
- Signature in 2 sentences (ch.8 already said the key pair): `Authorization: GOP-Sig-1 device=…,ts=…,nonce=…,sig=…`; the authenticator receives the whole request (method, path, query, headers, SHA-256 of the body); `sim_id` is never read on `/v3/`. The development key (`MOBILE_V3_DEV_AUTH`) must not exist in production: there a `Bearer` gets 401.
- Routes: «aggiungere una risorsa = aggiungere un file» — the allow-list is the set of `lib/MobileV3/Resource/<Nome>Controller.php`, each declaring its routes; the path never chooses a class. A compact bulleted list of the route families confirmed on `php8` (interventi: list, esito, foto, firma, posizione, documento; utenze: search, foto; device, push-token, commands ack, heartbeat, posizioni, segnalazioni, anomalie, dispositivo/permessi; magazzino: scorte, ddt, inventario, qr, gestione — ch.9). Count them only if the dossier counts them.
- `### Idempotenza: lo stesso invio non scrive due volte` — bulleted rules from `envelope.md`: required on POST/PUT/PATCH/DELETE (exception `POST /v3/heartbeat`, 204); same key + same route + same body (SHA-256) → the saved answer with `Idempotent-Replay: true`; different body → 409 `idempotency_conflict`; still running → 409 `request_in_progress` with `Retry-After: 2`, a row «in corso» older than 120 s is taken back; never saved: 5xx, 429, 503, retryable 4xx (`dependency_pending`), and the state-dependent `intervento_locked`, `already_closed`, so the same «Riprova» is judged again after the office fixes the intervento; `not_found` **is** saved (ch.8: 30 giorni) — state it as ch.8 did and record the conflict. Registry `mobile_v3_richieste` in the commessa's DB, purge after 30 giorni. Limits: JSON 1 MiB, multipart 21 MiB (20 MB file + 1 MiB).
- `dependency_pending` (GOP-449) in one sentence: foto and firma before the esito; if a piece is missing the server answers 409 with `Retry-After: 5` and `missing_keys` and closes nothing (ch.8 said it from the phone side).
- `### GOPlanner 1.x: la sincronizzazione in ingresso` (≤ 250 words) — `json_android.php?action=put_intervento` → `AndroidController::put_intervento`; the JSON arrives as a string in `$_REQUEST['json']`; fixed columns via `InterventoEseguitoBase::setFromAndroid()`; campi personalizzati as raw JSON in the column `servizi` (pointer ch.14); the whole batch is validated first (GOP-242: one non-numeric integer field rejects everything); **«Stato Master Override»**: if the office has raised the intervento to Controllato (6) or more, the app's data for it are ignored without error; foto via `upload_foto`, file name `[ID_INTERVENTO]-[TIPO]-[TIMESTAMP].jpg`, dedup by `md5_file` (a duplicate answers «success» with the existing size). Some very old commesse take a raw `REPLACE INTO` branch: say «alcune commesse storiche», no names.
- `> **Attenzione:**` box — Admin › «Console JSON» sends a call of the 1.x app to `json_android.php` **as the chosen operatore** and shows the answer; the page itself warns that calls run on the real database of the commessa and that methods that write (inserimenti, timbrature, chiusure) change data. Use read methods, or a test commessa. Who can open it: GOPlanner staff only (confirm, ch.12).
- **Contro-obiezione 2:** «Se il telefono rimanda lo stesso esito, il server lo scrive due volte?» → With GOPlanner 3 no: same key, saved answer; and an esito identical to one already written is recognised (`already_applied`, `esito-write.md`). With 1.x there is no registry: a retry after a lost confirmation can duplicate (ch.8 said so) — the dedup exists only for foto (md5).

**Limite (mandatory):** the code of `/v3/` is held to a declared language level (envelope.md: «PHP 7.3 (produzione)», no typed properties, `match`, enum…) — state the rule only as the dossier confirms it is still in force on 25 novembre 2026 ([CONFLICT] 3); the files frozen after S00 (`mobile_v3.php`, the kernel classes, the one `.htaccess` line) are changed only by a follow-up ticket, never in passing; the registry needs tenant migration `0007` — where it is missing a write answers 503 and is **not** executed ([CONFLICT] 4); the 1.x channel has no idempotency and no envelope, and is not changed by v3 work.

**Key facts the Researcher must find**
- `docs/mobile-v3/envelope.md` (whole), `esito-write.md` (`already_applied`, `dependency_pending`), `abbinamento.md` (signature string, clock 300 s — already in ch.8, confirm only).
- `lib/MobileV3/ApiError.php`: `CODES`, `STATE_DEPENDENT`; `lib/MobileV3/IdempotencyStore.php`: what is saved, the 120 s takeover, `purge()` and who calls it.
- `lib/MobileV3/Kernel.php`: `max_body`, `max_multipart`, `min_client_exempt`, order of checks.
- The route list: `git grep -n -A4 "function routes" -- lib/MobileV3/Resource lib/MobileV3/PublicResource`.
- `AndroidController::put_intervento` comment (GOP-242 rules), `isBlockedByBackoffice()` threshold (≥ 6), `upload_foto` in `json_android.php`, `Foto::getByHash`.
- Console JSON: `Smarty_templates/it/admin.html` (~line 238–250: title, description, warning text verbatim), `lib/MenuAdmin.php` line 34, who can open `admin.php`.
- Status of tenant migration `0007_mobile_v3_richieste.sql` in production (README, Jira GOP-425).

---

### § 3 — `## Il call center e l'assistente vocale: l'API /api/cc/v1`
**Tag:** [DEV] (readable by [STAFF])
**Core question:** How does an external call center — the assistente vocale «Sara» or a human operator at the Centralino — find the commessa and the utenza, offer slots and book an intervento, and what protects the data on the way?
**Word target:** 1.000 (range 900–1.100)
**Paragraph functions:** Aggancio (one sentence back to the hook: this is the door of § 1's case) → Spiegazione (credentials and commessa) → Dimostrazione (glossary mapping; states) → Spiegazione (the invariant; the lock) → contro-obiezione → Limite → Sintesi.

**Content plan**
- Who uses it, in words: an external assistente vocale («Sara», as in ch.4; **no vendor name**) for commesse that work with the call center, inbound (the utenza calls) and outbound (campagne). The page Interventi › Centralino (GOP-710) reuses the same reads and the same booking for a person on the phone, inside the gestionale session (`CentralinoController extends CallCenterController`): one sentence + ch.5.
- Credentials (bulleted): a **master token** from the server environment (`CALL_CENTER_API_TOKEN`; no default; unset or empty → the master path is off, every master request 401, an error logged without the value) that needs an explicit `customer_id`; a **token of the commessa** (`clienti.apikey` or the commessa's configuration) that selects the commessa by itself. Never a value in the text.
- Table *Nella API | Nel glossario | Esempio di rotta*: `customer` → commessa (`GET /customer/lookup`: from the number called, `clienti.callcenter_id`); `users` → utenze (`/users/lookup`, `/address`, `/search`, `/streets`); `technicians` → operatori (`/technicians/verify`); `campaigns` → liste (`GET /campaigns`); `leads` → pratiche (`/campaigns/{id}/leads`, `/leads/{id}/feedback`, `/leads/{id}/appointments`); `appointments` → interventi prenotati (`POST /appointments/book`, `PUT`/`DELETE /appointments/{id}`); plus `POST /slots/available`. Methods are enforced per route (405 `METHOD_NOT_ALLOWED` with `Allow`). Routing convention `v1_{resource}_{action}`.
- What each booking call writes (bulleted, with state codes and meaning the first time): book **with** operatore → Assegnato (3); book **without** → Prenotato (10) under operatore `0`, which is what fills «Appuntamenti in attesa di assegnazione» (ch.5); `PUT` → new date/time and notes, back to Assegnato (3); `DELETE` → Annullato (9), the slot is free and the cancellation is written in the notes. Why not Ripianificabile (8): in the rest of GOPlanner 8 means «l'operatore non ha potuto completare la visita» — a different fact; 9 is what every other channel already excludes (`stato_id<>9`). A pratica can be booked again after either 8 or 9.
- Weak identification → «[VERIFICARE UTENZA]» (ch.5): one sentence on what `CallCenterIdentificazioneDebole` / the nominativo search does — only as the dossier confirms. `do_not_call` → the utenza is marked not to be called (`utenti.non_chiamare`, origin «Sara, chiamata del …»): one sentence.
- `### L'invariante dello schema` — the rule from `docs/cc/architettura-api-cc.md`: `setTenantContext()` calls only `SimpleOrm::useConnection()`, which re-points the master; the slave stays on `goplanner`, and `SimpleOrm::sql()` sends reads to the slave. Therefore every read reachable from `CallCenterController` is qualified with the commessa's schema (`SimpleOrm::getDatabaseName()` or `:database.:table`). The two cases of § 1 are the proof; their tests simulate both schemas. Short ```php fragment (≤ 4 lines) only if the dossier has a real qualified query.
- `### La prenotazione sotto chiave` — `/slots/available` reserves nothing (it scores operatori by proximity to the centroid of their interventi of the period); `book` is a critical section: `GET_LOCK` per pratica, then per operatore-giorno, and per zona-giorno for an outbound zone; fixed order; timeout 5 s → 503 `BOOKING_BUSY`; inside the lock the reads go to the **master** (`SimpleOrm::sqlMaster()`); checks: operatore free at that time (states 3, 4, 10), `max_app_giorno`, places of the zone's day; conflict → 409 `SLOT_TAKEN` with `alternatives`, nothing written; same pratica + same slot → 200 with the same id. Lock names include the commessa's database, so two commesse never block each other.
- UT filter (GOP-325) in one sentence, said generically: a commessa can restrict bookings to some unità territoriali (`$custom['call_center_ut_ammessi']`), read from the most recent lista of the pratica.
- **Contro-obiezione 3:** «Se due chiamate prenotano lo stesso posto nello stesso istante?» → the second waits for the lock; when it gets it the slot is taken: 409 `SLOT_TAKEN` with alternative slots, nothing written. Not covered: `PUT /appointments/{id}` takes no lock, and there is no UNIQUE constraint in the database.

**Limite (mandatory):** only for commesse that use the call center (say it in words; the state of the trials only as the dossier dates it, no committente detail); `PUT` without lock; without the index of tenant migration `0015` (`idx_op_dp`) the checks under lock scan `interventi` and under load end in `BOOKING_BUSY` — whether it is applied is a fact for the dossier; the master path is off where the variable is not set.

**Key facts the Researcher must find**
- `api_cc.php`: allowed methods per route (lines ~55–75), `Cache-Control: no-store` (GOP-624), master vs commessa token resolution (`lib/CallCenterMasterToken.php`).
- `docs/cc/specifiche-finali-api-cc.md`, `docs/cc/openapi.yaml`: the full route list and payload names (only names, no example data).
- `lib/CallCenterController.php`: `v1_appointments_book`, `prenotaSottoLock`, the states written, `v1_slots_available` scoring; line ~2667 first bookable day (`preavviso_minimo_giorni`); `CallCenterIdentificazioneDebole.php`, `CallCenterRicercaNominativo.php` (what produces «[VERIFICARE UTENZA]»).
- `lib/CentralinoController.php` (GOP-710) and `$custom['centralino']`.
- `wiki/voiceai-integration.md`: § 1, § 1b (UT), the `do_not_call` section (~line 422), the trial state (dated 25/09/2026 — any later update in Jira GOP-322/324/325?).
- Regression tests: `tests/CallCenterController_SlotsConfig_Test.php`, `tests/OperatoreLocale_getAll_TenantSchema_Test.php`, `tests/CallCenterController_BookConcorrenza_Test.php`; script `scripts/test-book-concorrenza.php`.
- Status of tenant migration `0015_interventi_indice_operatore_data`.

---
### § 4 — `## Il motore unico delle operazioni: una logica, tre porte (console, API REST, MCP)`
**Tag:** [DEV]
**Core question:** How can an agent or an integration do what the console does, with the same permessi and rules, and what does the engine guarantee on every call?
**Word target:** 1.100 (range 1.000–1.200)
**Paragraph functions:** Aggancio (the decision: «ogni operazione della console deve potersi fare anche da un'API REST e da un server MCP», GOP-628, 30 ottobre 2026) → Spiegazione (engine, catalog, perimeter) → Dimostrazione (numbers table) → Procedura (add a read operation) → Spiegazione (writes) → contro-obiezione → Limite.

**Content plan**
- The engine is **extracted, not rewritten**: `OperazioniController` receives who acts (`ContestoOperazione`: identità, commessa, tipo, permessi, lotti) and the parameters, returns structured data — no `$_POST`, `$_SESSION` or JSON inside, only prepared statements. The console reaches it through adapters (`perConsole()`), REST and MCP through `esegui()`, which cannot be bypassed. The MCP door calls the engine directly, not the REST API over HTTP. Proof that the console did not change: `tests/e2e-mcp/console.php` compares answers with the baseline.
- What `esegui()` does on every call (bulleted): validates parameters against the schema (a parameter outside the schema is an error); checks the permesso; verifies the connection is on the commessa's database; applies fields and cursor; writes the register.
- **Perimeter per call** (stateless): `commessa` is a parameter (the code `clienti.db`); missing → the identità's default, always echoed in the answer. Nonexistent, out of perimeter or disabled commessa → the same error `commessa_non_accessibile`, so the door does not reveal which commesse exist. The confidentiality boundary is the company (`clienti.codice_org`). **Permessi:** with `rbac_enforce` on, the permesso decides (`interventi.vedere`, `utenze.vedere`); with it off — everywhere on 25 novembre 2026 per ch.11 — `users.tipo` against the operation's tipo minimo; `carichi`, `pratiche`, `interventi` start at tipo 2, so Consultazione and Tecnico do not use them: «si parte stretti, allargare è una riga del catalogo». Pointer ch.11.
- Table *Che cosa | Valore | Dove*: OAuth code (PKCE S256, single use) 60 secondi; access token 1 ora; refresh token 30 giorni, rotating; client inactive 30 giorni → removed; list rows 20 by default, `limite` max 200, `cursore` for the next page; rate 120 chiamate al minuto per identità; confirmation code 5 minuti, single use; `conferma_blocco=true` over 50 record; register 12 mesi then `cron_worker.php`. Source: pattern 42 (confirm each in code).
- OAuth in prose (≤ 120 words): GOPlanner is the authorization server (`mcp_oauth.php`, `McpOAuth`) and delegates the login to the existing Google access (ADR 25); the click on the button is the consent; the token is bound to the **identità**, never to `clienti.apikey` (never read by these doors); only SHA-256 hashes of codes and tokens are stored (`migrations/main/0021_mcp_oauth.sql`); reusing a code or refresh token revokes the whole family; return addresses loopback only by default, an https host only if listed; disabling the identità removes access at once. The same token works on `/mcp` and `/api/v2/`.
- Transport and answers (bulleted, short): MCP over stateless HTTP, JSON-RPC on POST, one message per request, no SSE (GET → 405), an `Origin` different from the public address → 403. TOON always on MCP, TOON by default on REST, JSON with `Accept: application/json`. Fields: minimum by default, `campi` to choose, `*` for all; a field outside the catalog is an error («una colonna nuova non esce da sola»). Errors in one line with a stable code and a suggestion — code block ```text with the real format `ERRORE commessa_non_accessibile: La commessa x non è accessibile. Suggerimento: ...`.
- `### Aggiungere un'operazione di lettura` — numbered procedure (from pattern 42 § Conseguenze; verify): 1. write the method in `OperazioniController` (context + parameters in, structured data out, prepared statements); 2. add the entry to `OperazioniCatalogo` (nome, descrizione, schema, effetto `lettura`, tipo minimo, permesso, campi minimi, catalogo dei campi; `griglia` if it must carry the commessa's grid columns); 3. write the unit test next to `tests/OperazioniController_Test.php`; 4. if the operation mirrors a console grid, add it to the end-to-end comparison (`tests/e2e-mcp/run.sh`, local only, with a throwaway MySQL). `tools/list` is built from the catalog: nothing else to register.
- `### Le scritture: anteprima, codice, rilettura` — a write extends `OperazioneScrittura` (same model as Gea's proposte, ch.10) and calls the same function as the back office. Without `codice_conferma` → **preview**: before/after of the changed fields only, nothing written. The code is signed (HMAC, `OperazioniConferma`) and binds operation, commessa, identità, fingerprint of the parameters and of the record; expires in 5 minuti; not stored, the signature is checked. At execution the record is **read again**: changed → `record_cambiato`, nothing written; the same code twice → `codice_gia_usato`. The catalog has **no destructive effect**: models and themes are deleted from the page, not from the MCP.
- What writes exist today (bulleted, one line each, only what the dossier confirms on `php8`): documenti (GOP-716: verbale and etichette, `documenti_attiva` is the only one that changes what the app and the server print); ticket triage, **solo per il team** (GOP-757: only the global super-admin passes `solo_team`; approval of drafts stays in the back office); comandi remoti all'app GOPlanner 3 (GOP-784: only on the enabled commesse; on a production commessa the code does not send but queues the request for approval from the back office, GOP-787 — the page is ch.8; rate 10 commands per phone every 600 s); dati di prova (GOP-705: only on the test commesse of `DatiProva::TENANT_DI_PROVA`, rows tracked in `dati_prova`, `elimina_dati_di_prova` deletes only rows the tools created).
- `> **Attenzione:**` box (risk guard, see REVIEWER NOTES): pattern 42 states that the `dev` environment uses the **production database**: every MCP write there is a write in production. The guards in the same box: preview without writing, signed code 5 minuti single use, re-read of the record, register of every call, no deletion in the catalog, dati di prova refused outside the test commesse, comandi only on enabled commesse and with approval in production.
- **Contro-obiezione 4:** «Un agente collegato all'MCP può fare più dell'utente che l'ha collegato?» → No. The token is the identità's: same perimeter, same permessi or tipo minimo, same lotti as the console; writes need preview and code; every call — reads and refusals included — is in the register with identità, origin (`MCP` or `REST`), client and outcome.

**Limite (mandatory):** without `MCP_HMAC_KEY` and `APP_BASE_URL` the door is **closed** (503) and the rest of the stack is untouched; if the register cannot be written the operation returns no data and changes nothing (503); the activation in production is a separate release (pattern 42: «non coperta qui») — state whether the door is open in production only as the dossier proves ([CONFLICT] 6), configuration → ch.16; known differences with the console (`carichi_grid` of the console does not filter by lotto, the engine does; a cursor can skip the second row of an intervento on commesse whose grid join multiplies rows); `tools/list` does not know the commessa, so it lists only base fields; until GOP-628 ends there are two catalogs (`OperazioniCatalogo` for MCP/REST, `ChatbotRegistro` for Gea) — confirm on `php8`.

**Key facts the Researcher must find**
- `docs/02-patterns/42-motore-unico-operazioni-console-api-mcp.md` (whole file) — every number of the table, confirmed in `lib/McpOAuth.php`, `lib/OperazioniConferma.php`, `lib/OperazioniPorta.php`, `lib/OperazioniRegistro.php`, `lib/OperazioniCatalogo.php`.
- The current catalog on `php8`: `git grep -n "'nome' *=>" -- lib/OperazioniCatalogo.php lib/OperazioniDocumenti.php lib/OperazioniTicket.php lib/OperazioniComandi.php` (names and effects only); is `ChatbotRegistro` merged into the catalog yet?
- `DatiProva::TENANT_DI_PROVA`, `MCP_COMANDI_COMMESSE` default, `MCP_COMANDI_LIMITE`/`FINESTRA` defaults — dossier only; the chapter says «le commesse di prova», «le commesse abilitate».
- Jira GOP-628 (epic status), GOP-629, GOP-642, GOP-705, GOP-716, GOP-757, GOP-784, GOP-787: delivered or in progress.
- Whether migrations `main/0021`, `0022`, `0029`, `0031` are applied and where (README, Jira).
- Tests listed in pattern 42 § Prove (names only).

---

### § 5 — `## Il servizio di Gea e il Portolano`
**Tag:** [DEV] (readable by [STAFF])
**Core question:** How is the service behind Gea built, why does it never hold a database credential, and how does the Portolano feed both Gea and the people who build GOPlanner?
**Word target:** 950 (range 850–1.050)
**Paragraph functions:** Aggancio (ch.10 promised it: «l'architettura del servizio è nel capitolo 15») → Spiegazione (the service) → Dimostrazione (the reason: one cluster) → Spiegazione (identity bridge; limits) → Spiegazione (Portolano: two uses) → contro-obiezione → Limite.

**Content plan**
- The service: `chatbot-service/`, Node.js + TypeScript, in the **same repository** but with its own `Dockerfile` and its own build and release (manual `make` targets; release → ch.16). It orchestrates the conversation with the language model through the AI gateway (OpenRouter, streaming); model and key come only from its environment (variable names allowed, values never; **no model name**).
- **PHP is the only data broker.** Every read of domain data passes through `json.php?action=chatbot_*` (`JSONController`), which reuses session, identità and RBAC. The reason, from pattern 27, said plainly: the databases of all commesse live on the same shared cluster and the application user of MySQL was never limited per commessa — the isolation between commesse is guaranteed by application code; a generic credential in the Node service would read every commessa. Hence the rule for any new capability of Gea: a new PHP action, never a direct query. The one exception: Node reads the server logs directly, limited per commessa by the cloud permissions (say it in words; no group names, no ARNs).
- Identity bridge (bulleted): a short-lived token (pattern 27 says ~15 minuti: confirm in code) issued by a PHP endpoint that checks the session, with minimal claims (`tenant`, `user_id`, `tipo`); on the PHP side the commessa is rebuilt only from verified claims, never from request parameters (`json.php` lines ~18–20); every `chatbot_*` action also requires a service header with a secret known only to the container — **do not name the header** — so a user who copies the token from the browser cannot call the actions directly and bypass rate limit, daily cost cap and audit. Missing one of the two → 403.
- What sits inside the service, as a short file map (bulleted, one line each, only files the dossier confirms): `server.ts` (instructions and loop; per answer at most `CHATBOT_MAX_TOOL_ITERATIONS` steps and `CHATBOT_TURN_DEADLINE_MS` — ch.10 gave 12 and 90 s), `tools.ts` (tools and Portolano calls), `cost-cap.ts` (daily cap per commessa), `audit.ts` (turns kept for the staff only), `technical-leak-guard.ts` (what Gea must not reveal), `widget.ts` (the panel, ch.10). The data tools are PHP classes listed in `lib/ChatbotRegistro.php` (`CLASSI`); proposte → ch.10.
- `### Il Portolano` — what it is: the RAG server of GOPlanner (vector database Qdrant + an MCP server; hybrid search, vector + lexical, with links between documents), fed with code, docs, wiki and completed tickets. Two uses, two audiences:
  - **For Gea** (`consulta_base_conoscenza`): only the public role (`CHATBOT_RAG_PUBLIC_ROLE`, default `goplanner:public`); results whose path is under `docs/` or `retrospective/` are thrown away; the README of a commessa only for the commessa of the session; at most 10 results, at most 2 searches per turn, a 5-minute cache. If the Portolano is not configured or not reachable Gea must say so (`rag_not_configured`, `rag_unavailable`) instead of answering as if she had read it.
  - **For the staff and the agents**: tools `query_rag`, `query_rag_hybrid`, `get_document_by_slug`, `ingest_document`, `rebuild_links`; the collection of development (`rag_documents_internal`, roles `admin`/`dev`/`developer`) is never the one Gea reads. Feeding: the `code-rag-analyzer` skill for code; each Jira ticket, when `/implement-ticket` closes it, is ingested (description + closing comment) after a **mandatory secret scan** (pattern 30); tickets closed before that decision are not back-filled.
- Practical trap for a developer (`### Quando il Portolano risponde poco`): the role filter decides what comes back — record exactly what the dossier proves on 25 novembre 2026 (INSTRUCTION.md: `user_roles: ""` returns wiki, docs, code and tickets, `"goplanner"` only two unrelated cards; cookbook 16 still says `"admin"`) — and the time-out trap of cookbook 16: `HYBRID_DENSE_FUTURE_TIMEOUT_SEC` defaults to 0,2 s, less than a typical embedding + query; set it and the two other time-outs to `"10.0"` in the client's MCP configuration. A result of the Portolano is a pointer, not proof: when it disagrees with the code on `php8`, the code wins (the rule of this guide).
- **Contro-obiezione 5:** «Gea legge anche i documenti per sviluppatori del Portolano?» → No: public role only, developer paths dropped, README only of the session's commessa; and she is forbidden to describe how she works (ch.10).

**Limite (mandatory):** the token lifetime, the cost cap unit and the internal raw-query tool behind an AST validator (pattern 27 T16: SELECT only, schema of the session only — confirm whether `ChatbotStrumentoInterrogaDati`/`ChatbotQuerySelect` is live) are stated only as the dossier confirms; the Portolano can lag behind the code; no address of the Portolano or of the service appears in the chapter; deployment of the service → ch.16.

**Key facts the Researcher must find**
- `docs/02-patterns/27-chatbot-supporto-architettura.md` (Contesto, Conseguenze, cost cap, audit, memory), `docs/03-cookbooks/23-chatbot-service-guida-al-codice.md` (file map).
- Token lifetime and claims in code: `git grep -n -i "jwt\|exp" -- lib/Chatbot*.php json.php | head`; service-header check (name only in dossier, **not** in the chapter).
- `chatbot-service/src/tools.ts` lines ~120–160 and ~310–395: public role default, path filter, 10 / 25 / 2 / 5-minute numbers, `rag_not_configured`/`rag_unavailable`.
- `chatbot-service/src/cost-cap.ts`: unit of the daily cap (per commessa? per day?).
- `docs/03-cookbooks/16-utilizzo-rag-qdrant-mcp.md` (tools, timeouts), `15-uso-rag-qdrant-mcp.md`, `docs/02-patterns/30-ingestione-ticket-completati-in-rag.md`, `24-promozione-memoria-agentmemory-in-rag.md` (only if it adds a feeding path).
- Run 2–3 Portolano queries with `user_roles: ""` and with `"admin"` and record the difference in [CONFLICT] (no content copied, just counts and slugs).

---

### § 6 — `## I servizi esterni che GOPlanner chiama: AI delle foto e mappe`
**Tag:** [DEV]
**Core question:** When GOPlanner is the caller — AI for the foto, geocoding, routing — what does it send, what does it accept back, and what happens to the data when the external service fails?
**Word target:** 1.000 (range 900–1.100)
**Paragraph functions:** Aggancio (the outbound rule: an external answer is a proposal checked by code) → Spiegazione (AI engine) → Dimostrazione (contract principles) → Spiegazione (geocoding chain; AI correction) → Dimostrazione (distance matrix) → contro-obiezione → Limite → Sintesi.

**Content plan**
- `### L'analisi AI delle foto` — the contract is `docs/analisi-ai/contratto.md` (epic GOP-674; engine GOP-719). Principles, bulleted: the AI proposes and the back office decides — the engine never writes `interventi`, `interventi_eseguiti`, `foto` or campi personalizzati, only its own tables (tenant migration `0028_analisi_ai.sql`; without it: «Analisi AI non ancora disponibile su questa commessa.», as ch.6); **one call per foto**, carrying all the controls valid for that foto's type, always one model; an empty list of foto types means all foto; the answer has a fixed format validated by the server — free text never reaches the user; every result keeps the version of the instructions that produced it.
- The provider in code: `AnalisiAiProviderOpenRouter` through the backend client `lib/OpenAI.php`; the model from `ANALISI_AI_MODELLO` (a default constant in the class; **do not write the model name**); `ANALISI_AI_BASE_URL` switches to any OpenAI-compatible server, for example a local one; reasoning switched off and a cap of 6.000 output tokens, because with reasoning on and 4.000 the JSON came back cut (`finish_reason=length`) — a real problem → cause → fix in one sentence. Vocabulary rule of the contract: in the interface and in every JSON sent to the browser only «AI»; provider, model and keys only in server logs. Costs are registered (`AnalisiAiCosti`) and read in Admin › Cruscotto Analisi AI (ch.12).
- Older pipeline, one sentence only: patterns 18/20 and cookbook 13 describe an earlier local-model flow (`ai_status`, `ai_feedback`, `ai_metadata` on `foto`); the Writer states which flow is live on `php8` per [CONFLICT] 5 and does not describe the old one as current.
- `### Mappe e geocodifica` — in the browser: Leaflet with OpenStreetMap tiles; `leaflet_compat.js` keeps a stub of the old `google.maps` API so legacy pages still run (`docs/MAPS_ARCHITECTURE.md`). Geocoding of utenze (`lib/GeocodificaUtenze.php`), the order as the dossier confirms it: cache; Google only if the commessa has **its own** key (tried first, because it has no Nominatim rate limit); then GOPlanner's own Nominatim, at a pace set per server (`NominatimRitmo`, one global turn shared by all workers of all commesse); **never** the centre of the comune alone (GOP-561).
- The AI correction for addresses not found (GOP-773) as a bulleted chain: only an utenza with `precisione = -1` and no previous point; the AI rewrites up to 3 candidates (expands abbreviations, fixes typos); each candidate is searched on Nominatim and accepted only if **all** code checks pass — `place_rank` ≥ 26 (a street or better), the comune coherent, within 30 km of the comune's centre, the street name coherent with what was written («Cav» → «Cavalieri» is not «Vittorio Veneto»), and a second AI question answered exactly `{"stessa_via": true}`; then precisione 1 (civico reached) or 3 (approximate). `utenti.indirizzo` and `utenti.civico` **never change**; each correction is a row of `geocodifica_ai` (tenant migration `0043`), «Annulla correzione AI» puts the utenza back to not found (permesso `utenze.modificare`). The office side (column «Geocodifica», label «AI», filter «Corrette dall'AI») → ch.3/ch.5, one sentence.
- `### Le distanze delle zone` — `lib/DistanzeZona.php` (GOP-683): after a zone is confirmed, a job computes road times and metres between every pair of utenze of the zone with OSRM `/table`, up to 100 coordinates per request, in blocks of 50 × 50 beyond that; tables `zone_outbound_distanze` and `zone_outbound_partenze`; **NULL means no data, never 0**; if OSRM does not answer, the shape is written first, a failed block never overwrites a good value, and the job is re-queued after 1, 5 and 15 minuti, 1 ora and 3 ore, then stops; «Ricalcola distanze» re-queues it; the warning «distanze incomplete» counts the missing pairs. Pointer ch.5 for what the planner sees.
- Push to the phones (comandi remoti) in one line: GOPlanner calls the push service of the phones (FCM) and records each send (§ 4, ch.8).
- **Contro-obiezione 6:** «Se l'AI corregge un indirizzo, cambia l'anagrafica dell'utenza?» → No: only the point and its precisione change; the written address stays; the correction is recorded and can be undone.

**Limite (mandatory):** Google geocoding only where a commessa has its own key; when Nominatim does not answer the utenza is not touched; when OSRM does not answer the matrix stays incomplete after the last retry and the planner sees the warning; the AI of the foto and of the addresses depends on the gateway and on the tenant migrations (`0028`, `0043`) — where they are missing the function says it is not available and writes nothing; the server that runs Nominatim and OSRM is described only as «di GOPlanner» (no host).

**Key facts the Researcher must find**
- `docs/analisi-ai/contratto.md` §1–§7 (principles, format, versioning, the vocabulary rule); `lib/AnalisiAiProviderOpenRouter.php` (`MAX_TOKENS`, `opzioni()`, `modello()` — the default constant **only in the dossier**, not in the chapter); `lib/AnalisiAiMotore.php` (one call per foto); `lib/AnalisiAiCosti.php`.
- Which AI-of-foto pipeline is live on `php8` and in production: `git grep -n "persistAiSuccessMetadata\|AnalisiAiMotore" -- lib/ json.php js/code/` and `docs/03-cookbooks/34-verifica-interventi-estensioni-tenant.md` («un solo flusso AI»); Jira GOP-719/GOP-720 status.
- `lib/GeocodificaUtenze.php` header comment (order of sources), `lib/NominatimRitmo.php` if present, GOP-561, GOP-772 (`IndirizzoVarianti`), `docs/02-patterns/48-precisione-utenti-geocodifica-anomalie.md` (meaning of precisione −1, 1, 2, 3).
- `docs/02-patterns/51-geocodifica-correzione-ai.md` (whole), `lib/GeocodificaAi.php` (`correggi`, `comuneCoerente`, `nomeCoerente`): confirm 3 candidates, rank 26, 30 km, the second question.
- `docs/02-patterns/45-matrice-distanze-zone-outbound.md`, `lib/DistanzeZona.php`, `lib/jobs/CalcolaDistanzeZonaJob.php`: `OsrmRouting::MAX_TABLE_COORDS`, the retry schedule.
- `docs/MAPS_ARCHITECTURE.md`, `docs/MIGRATION_MAPS_OSM.md`: Leaflet/OSM and the compat stub, date of the migration from Google Maps.

---

### Closing (no separate `##`: last paragraph of § 6, before `## Fonti`)
A rule a developer can apply before touching any integration, not an echo of chapter 10 and not an announcement of chapter 16. See TARGET.

### `## Fonti`
Built by the Writer from the dossier entries actually used, in the STYLE_BIBLE format (`codice: …`, `wiki: …`, `docs: …`, `Portolano: …`, `Jira: GOP-NNN — titolo breve`). No URLs, no hostnames, no environment values.

---
## REVIEWER READINESS NOTES

### Tension points (where the chapter must create real stakes)
1. **The wrong commessa, without an error (§ 1, § 3).** Stakes: a read that returns another commessa's data — or every commessa's — looks plausible and raises nothing. Build-up: the hook case → the three questions → the invariant of `api_cc.php` → the regression tests. Resolution: a habit, not fear — qualify every call-center read with the schema; prefer doors that settle the commessa once (`/v3/` bootstrap, the motore's perimeter per call).
2. **The retry that writes twice, or never again (§ 2).** Stakes: a phone that retries after a lost confirmation can duplicate an esito (1.x) or be refused for good (`not_found` saved 30 giorni). Resolution: what the registry saves and what it frees, stated exactly; the 1.x limit stated plainly; the reassignment case flagged as a staff question (as ch.8).
3. **Two bookings, one slot (§ 3).** Stakes: the assistente vocale promises the same time to two utenze. Resolution: the lock sequence, 409 `SLOT_TAKEN` with alternatives, and the honest gap (`PUT` unlocked, no UNIQUE).
4. **An agent with the keys of production (§ 4).** Stakes: `dev` uses the production database; an MCP write there is real. Resolution: the guards in the same box (see risk guards) — the reader leaves knowing the write path is narrow by design, not that the MCP is dangerous.
5. **A credential that would open every commessa (§ 5).** Stakes: one shared cluster, isolation by code only. Resolution: the rule «PHP unico broker», the double check token + service header, the AST validator — and the practical consequence for the reader's next feature.

### Key chains to make explicit (cause → consequence → reader action)
- Unqualified `SELECT` in a call-center path → read on the central schema via the slave → plausible wrong answer, no error → qualify with `SimpleOrm::getDatabaseName()` / `:database.:table` and add a test that simulates both schemas (GOP-274/276 pattern).
- Phone sends an esito before its foto → 409 `dependency_pending`, `Retry-After: 5`, `missing_keys` → app sends the foto and retries → one closure, never half.
- Same `Idempotency-Key` + same body → saved answer, `Idempotent-Replay: true` → no double write; different body → 409 `idempotency_conflict` → a bug in the client, not a retry.
- Office raises an intervento to Controllato (6) → 1.x `put_intervento` ignores the app's data for it without error → if the field data must enter, the office lowers the state first (say only what the dossier supports).
- `book` without operatore → Prenotato (10), operatore 0 → appears in «Appuntamenti in attesa di assegnazione» → the office assigns (ch.5).
- Agent calls a write without code → preview → calls again with the code within 5 minuti → record re-read → `record_cambiato` if it moved → new preview.
- Gea needs a new datum → new `chatbot_*` PHP action registered in `ChatbotRegistro::CLASSI` → reachable only with token + service header → never a direct query from Node.
- Address not found → AI candidates → Nominatim → code checks → point saved with precisione 1 or 3, row in `geocodifica_ai` → «Annulla correzione AI» if wrong.
- OSRM down → NULL pairs, retries 1/5/15 min, 1/3 h → stop → «distanze incomplete» → «Ricalcola distanze».

### Risk proportionality guards (each risk paired with its balancing context, in the same paragraph or box)
- **`dev` writes on production data (pattern 42)** → preview without writing; HMAC code 5 minuti, single use, bound to identità and record fingerprint; re-read of the record; register of every call for 12 mesi; no destructive operation in the catalog; dati di prova refused outside the test commesse; comandi only on enabled commesse and with back-office approval in production.
- **Console JSON writes for real** → staff-only page (confirm), the page warns in its own text, read methods exist for diagnosis; use a test commessa.
- **Call-center schema invariant** → the two known cases are fixed and covered by regression tests; the invariant is written next to the code; new doors (`/v3/`, motore) avoid the problem by construction.
- **Tenant databases on one cluster, isolation by code** → no credential leaves PHP; every door checks the commessa on each call; the motore returns the same error for «non esiste» and «non tua»; do not present it as a current leak.
- **External AI sees foto and addresses** → it writes only its own tables or a reversible point; fixed validated format; keys and model only on the server; a local OpenAI-compatible server is a configuration option; costs registered.
- **Open OAuth client registration** → a client is a declared datum, not an identity; the Google login on existing identità decides; return addresses loopback only unless listed; disabling the identità revokes at once.
- **Token copied from the browser (Gea)** → the service header is required as well; rate limit, cost cap and audit cannot be bypassed.
- **Master token of the call center** → lives only in the server environment, no default; unset = master path off, commessa tokens keep working.

### Counter-objections planned (STYLE_BIBLE requires ≥ 2; six are planned)
1. § 1 — «`/api/v2/` è la versione 2 dell'API del call center?»
2. § 2 — «Se il telefono rimanda lo stesso esito, il server lo scrive due volte?»
3. § 3 — «Se due chiamate prenotano lo stesso posto nello stesso istante?»
4. § 4 — «Un agente collegato all'MCP può fare più dell'utente che l'ha collegato?»
5. § 5 — «Gea legge anche i documenti per sviluppatori del Portolano?»
6. § 6 — «Se l'AI corregge un indirizzo, cambia l'anagrafica dell'utenza?»

### `> **Quando chiedere allo staff tecnico:**` box (place it at the end of § 4 or § 6; ≥ 4 sourced items)
Decisions a new developer does not take alone: applying a migration (main `0021`, `0022`, `0029`, `0031`; tenant `0007`, `0015`, `0028`, `0043`); opening the motore's door in an environment (key and public address, ch.16); enabling comandi remoti on a production commessa; widening the list of test commesse; a call-center read that returns data of another commessa; an idempotency refusal after a reassignment (ch.8).

### Litmus test for this chapter
A new developer, with only this chapter, can: say through which door each caller enters and which file to open first; read a `/v3/` error and tell whether the phone will retry; explain why a call-center read must carry the schema and find the test that proves it; add a read operation to the motore and know what the engine already checks; explain why Gea's service has no database credential; and say what happens to the data when the AI gateway, Nominatim or OSRM does not answer.

### Format checks the Reviewer should run on this chapter
- One H1 `# 15. Integrazioni e API`; «In questo capitolo» in italics; six `##` sections each with its italic audience line; `## Fonti` last.
- Tables: doors (§ 1), checks of `/v3/` (§ 2), Call Center ↔ glossary (§ 3), motore numbers (§ 4). Procedure: add a read operation (§ 4). Boxes: one «Attenzione» on real writes, one «Quando chiedere allo staff tecnico».
- Zero model names, hostnames, IPs, key/token values, ARNs, log group names, secret header names, personal names, committente contractual details, vendor name of the assistente vocale; «tenant» only as code or with the stated correspondence; «chatbot» only inside `code`.

---
## RESEARCHER BRIEF

**Web search terms:** none. INSTRUCTION.md § Researcher, SOURCE OVERRIDE: the web is not a source for this book. Every fact of this chapter is in the GOPlanner repository, its docs, the Portolano or Jira. (Standards such as the OAuth RFC numbers are already cited in pattern 42: cite the pattern, do not browse.) The GOPlanner repository is READ ONLY: no checkout, pull, stash, composer, npm, no test runs, no `curl` against any environment.

### Documents to prioritize (in order)
1. Code on `php8` (authority when sources disagree): entry points `.htaccess`, `api/.htaccess`, `mobile_v3.php`, `api_cc.php`, `api_v2.php`, `mcp.php`, `mcp_oauth.php`, `api.php`, `json_android.php`, `json_timbratori.php`, `json_admin.php`, `telelettura.php`; `lib/MobileV3/`, `lib/CallCenter*.php`, `lib/Centralino*.php`, `lib/Operazioni*.php`, `lib/Mcp*.php`, `lib/ToonEncoder.php`, `lib/AnalisiAi*.php`, `lib/Geocodifica*.php`, `lib/DistanzeZona.php`, `chatbot-service/src/`.
2. Decision docs and contracts: `docs/02-patterns/42-motore-unico-operazioni-console-api-mcp.md`, `27-chatbot-supporto-architettura.md`, `16-mobile-inbound-sync.md`, `14-android-auth-pattern.md`, `03-api-endpoint-pattern.md`, `10-enterprise-api-architecture.md`, `30-ingestione-ticket-completati-in-rag.md`, `45-matrice-distanze-zone-outbound.md`, `48-precisione-utenti-geocodifica-anomalie.md`, `51-geocodifica-correzione-ai.md`, `18-ai-photo-analysis-batching.md`, `18-ai-vision-background-processing.md`, `20-ai-vision-architecture-schema.md`; `docs/mobile-v3/envelope.md`, `abbinamento.md`, `esito-write.md`, `foto-upload.md`, `comandi-remoti.md`, `magazziniere.md` (route names only); `docs/cc/architettura-api-cc.md`, `docs/cc/specifiche-finali-api-cc.md`, `docs/cc/openapi.yaml`; `docs/analisi-ai/contratto.md`; `docs/MAPS_ARCHITECTURE.md`, `docs/MIGRATION_MAPS_OSM.md`; cookbooks `09-rest-api-controller.md`, `13-interfacciamento-ai-vision-locale.md`, `15-uso-rag-qdrant-mcp.md`, `16-utilizzo-rag-qdrant-mcp.md`, `20-test-mobile-headless.md`, `23-chatbot-service-guida-al-codice.md`, `27-rilascio-api-dev.md`, `34-verifica-interventi-estensioni-tenant.md`; `migrations/main/README.md`.
3. Wiki: `wiki/voiceai-integration.md`, `wiki/pianificazione/modello-pianificazione-appuntamenti.md` (only the booking rules § 3 needs).
4. Portolano, then Jira.

### Code paths and grep patterns (read-only: `git grep`, Read, Grep)
- `git grep -n "RewriteRule" -- .htaccess api/.htaccess`
- `git grep -n -A4 "function routes" -- lib/MobileV3/Resource lib/MobileV3/PublicResource`
- `git grep -n "STATE_DEPENDENT\|CODES" -- lib/MobileV3/ApiError.php`; `git grep -n "120\|purge\|30" -- lib/MobileV3/IdempotencyStore.php`
- `git grep -n "isBlockedByBackoffice\|setFromAndroid\|getByHash" -- lib/ json_android.php`
- `git grep -n "useConnection\|getDatabaseName\|sqlMaster\|GET_LOCK\|BOOKING_BUSY\|SLOT_TAKEN" -- lib/CallCenterController.php lib/SimpleOrm*`
- `git grep -n "CALL_CENTER_API_TOKEN\|call_center_api_key\|call_center_ut_ammessi" -- api_cc.php lib/` (names only, never values)
- `git grep -n "MINUTI\|SECONDI\|3600\|60\b\|120\|200\|300" -- lib/McpOAuth.php lib/OperazioniConferma.php lib/OperazioniPorta.php lib/OperazioniController.php`
- `git grep -n "TENANT_DI_PROVA\|MCP_COMANDI_" -- lib/`
- `git grep -n "MAX_TOKENS\|ANALISI_AI_" -- lib/AnalisiAi*.php`
- `git grep -n "MAX_TABLE_COORDS\|addDelayed" -- lib/`
- `git grep -n "RAG_\|rag_not_configured\|rag_unavailable" -- chatbot-service/src/tools.ts`
- `ls migrations/main/ migrations/tenant/ | grep -E "0007|0015|0021|0022|0028|0029|0031|0043"`

### Portolano queries (`mcp__rag_qdrant_server__query_rag_hybrid` with `user_roles: ""` — EMPTY string, per INSTRUCTION.md; fall back to `query_rag`)
- «busta API mobile v3 contract request_id retryable idempotency»
- «Idempotency-Key registro mobile_v3_richieste replay conflitto»
- «put_intervento sincronizzazione app Android servizi stato controllato»
- «Console JSON json_android operatore scelto»
- «API call center customer lookup slots available appointments book»
- «setTenantContext slave schema centrale lettura non qualificata GOP-274»
- «prenotazione concorrente GET_LOCK SLOT_TAKEN BOOKING_BUSY»
- «motore unico operazioni MCP OAuth TOON catalogo»
- «codice di conferma anteprima record_cambiato operazioni scrittura»
- «chatbot service Node PHP broker dati JWT»
- «RAG Qdrant ingestione ticket completati secret scanning»
- «analisi AI foto contratto una chiamata per foto formato fisso»
- «geocodifica Nominatim Google chiave tenant correzione AI indirizzi»
- «matrice distanze OSRM zone outbound»

### JQL fragments (cloudId `21873985-2e5d-4a8a-bb45-e6d453128985`, project GOP, READ ONLY)
- `project = GOP AND key in (GOP-628, GOP-629, GOP-642, GOP-705, GOP-716, GOP-757, GOP-784, GOP-787)` — motore unico: delivered vs in progress (**status of GOP-628 is load-bearing** for «two catalogs»).
- `project = GOP AND key in (GOP-425, GOP-399, GOP-407, GOP-449, GOP-242, GOP-264)` — `/v3/` contract and 1.x inbound.
- `project = GOP AND key in (GOP-274, GOP-276, GOP-279, GOP-322, GOP-324, GOP-325, GOP-624, GOP-708, GOP-710)` — call center, legacy credentials, Centralino (**GOP-274/276 are the hook**: dates and fix).
- `project = GOP AND key in (GOP-674, GOP-718, GOP-719, GOP-720, GOP-721, GOP-561, GOP-683, GOP-684, GOP-772, GOP-773, GOP-803, GOP-275, GOP-294)` — AI, maps, RAG, admin guard.
- `project = GOP AND (text ~ "MCP" OR text ~ "api/v2") AND statusCategory != Done ORDER BY updated DESC` (max 10) — what is planned and must NOT be described as live.
- `project = GOP AND text ~ "call center" AND text ~ "tenant" ORDER BY created ASC` (max 10) — confirm the hook story (problem → cause → fix), no committente details.

### Specific facts, numbers and labels to hunt
- Numbers: `/v3/` JSON 1 MiB, multipart 21 MiB, in-progress takeover 120 s, registry 30 giorni, `Retry-After` 2 and 5, clock 300 s (ch.8), `request_id` 26 hex; call center lock timeout 5 s; OAuth code 60 s, access 1 h, refresh 30 giorni, client purge 30 giorni; rows 20/200; 120 calls/min; code 5 minuti; `conferma_blocco` > 50; register 12 mesi, params truncated over 4 KB; comandi 10 per phone / 600 s; Gea RAG 10 results / 25 fetched / 2 searches / 5-minute cache; token of Gea ~15 minuti (confirm); AI `MAX_TOKENS` 6.000; geocoding 3 candidates, rank 26, 30 km, 5 km provincial rule; OSRM 100 coords, 50 × 50, retries 1/5/15 min, 1/3 h; matrix purge 30 giorni after the week.
- Codes: `malformed_request`, `missing_client_header`, `missing_idempotency_key`, `unauthenticated`, `invalid_key`, `device_revoked`, `device_pending`, `tenant_disabled`, `forbidden`, `not_found`, `method_not_allowed`, `idempotency_conflict`, `intervento_locked`, `already_closed`, `request_in_progress`, `dependency_pending`, `payload_too_large`, `unsupported_media_type`, `validation_failed`, `domain_rejected`, `client_too_old`, `rate_limited`, `internal_error`, `unavailable`, `maintenance`; `SLOT_TAKEN`, `BOOKING_BUSY`, `METHOD_NOT_ALLOWED`; `commessa_non_accessibile`, `record_cambiato`, `codice_gia_usato`, `solo_team`, `commessa_non_abilitata`, `commessa_non_di_prova`, `servizio_non_disponibile`, `errore_interno`.
- Labels: «Console JSON» (title, description and warning verbatim), «Appuntamenti in attesa di assegnazione», «[VERIFICARE UTENZA]», «Analisi AI non ancora disponibile su questa commessa.», «Annulla correzione AI», «Corrette dall'AI», «Ricalcola distanze».

### Mandatory [CONFLICT] items to record
1. **«API v2»:** PRD § 4 lists «API v2 e Call Center / VoiceAI» together; code: `/api/v2/` → `api_v2.php` = REST door of the motore (GOP-629); call center = `/api/cc/v1/` → `api_cc.php`. Code wins; one line for the Reviewer.
2. **Idempotency after reassignment:** `envelope.md` says the state-dependent 409 are not saved so «Riprova» is re-evaluated «dopo che l'ufficio ha riassegnato»; ch.8 (from its dossier) says `not_found` is saved for 30 giorni. Confirm in `IdempotencyStore`/`ApiError`; ch.15 must match ch.8 unless the code says otherwise (then flag ch.8).
3. **Language level of `/v3/` code:** `envelope.md` «Tutto il codice è PHP 7.3 (produzione)» vs branch `php8`, `Dockerfile-8`, `Dockerfile-8.4`, cookbook 22 (PHP 8.4 migration). What runs production on 25 novembre 2026? If unproven: state the rule as «la regola scritta nel contratto» with its date, and point to ch.16.
4. **Migrations status:** tenant `0007` («preparata, non applicata» in `envelope.md`), `0015`, `0028`, `0043`; main `0021`, `0022`, `0029`, `0031`. `migrations/main/README.md` vs Jira vs ch.8's oracle question 1. The Writer conditions every dependent feature («dove la migrazione è applicata»).
5. **AI of the foto, two generations:** patterns 18/20 + cookbook 13 + `00-concept-index.md` («local LLM») + `JSONController::persistAi*` vs contract GOP-674 / `AnalisiAiProviderOpenRouter`. Which is live in Verifica (cookbook 34, «un solo flusso AI»)?
6. **MCP/REST in production:** pattern 42 «Produzione (Swarm): non coperta qui»; activation recorded only for the development environment (01/11/2026). Open in production or not? If unproven → «dove la porta è aperta».
7. **Two catalogs:** pattern 42 says `ChatbotRegistro` moves into the motore «con i prossimi ticket di GOP-628». Still two on `php8`?
8. **Portolano role filter:** cookbook 16 («usa sempre `user_roles: "admin"`») vs INSTRUCTION.md (verified 25/11/2026: `""` works, `"goplanner"` returns two cards) vs Gea's `goplanner:public`. Record what the queries return today.
9. **Gea token lifetime and raw-query tool:** pattern 27 (~15 min; T16 AST validator) vs code.
10. **Geocoding order:** `GeocodificaUtenze.php` header (Google first when the commessa has its key) vs pattern 48 / wiki. Code wins.
11. **Call center trial state:** wiki dated 25/09/2026 («solo Liguria») — any later state in Jira? The chapter says only «le commesse che usano il call center».

### Security filter reminder (stricter than usual: this chapter sits on the credentials)
- **Never open, quote or mention** the credentials JSON file in the repository root, `tunnel.env`, any `.env`, any `docker-compose*` environment value, or SOPS material. `lib/Geocode.php` contains a hard-coded legacy key literal: **do not copy it, do not quote the line, do not mention it in the chapter**; if relevant, record in the dossier only «una chiave legacy è scritta nel codice di `lib/Geocode.php` — segnalare allo staff tecnico», without the value.
- No hostnames or URLs of any environment, of the Portolano or of the services (pattern 42, cookbook 16 and `tools.ts` contain some: drop them); no IPs, ports of internal services, ARNs, log group names, Redis keys.
- Variable **names** are allowed in DEV text (`MCP_HMAC_KEY`, `APP_BASE_URL`, `CALL_CENTER_API_TOKEN`, `ANALISI_AI_MODELLO`, `ANALISI_AI_BASE_URL`, `CHATBOT_RAG_PUBLIC_ROLE`); **values never**. The service header of Gea: not even its name.
- No model names; no vendor name of the assistente vocale; no committente names tied to the call center trials or to the geocoding case (pattern 51 names one: say «una commessa del servizio idrico»); no numeric tenant ids; no personal names, phone numbers or addresses (an example address must be invented and declared as such; the street-name examples of pattern 51 are generic and may be reused).

---

## TARGET

- **Word count:** 5.700–5.950 words in total (PRD § 4: 4.000–6.000). Breakdown: «In questo capitolo» ~80; § 1 900; § 2 1.050; § 3 1.000; § 4 1.100; § 5 950; § 6 1.000 (closing included); `## Fonti` ~120. Hard ceiling 6.000: if over, cut § 2's 1.x subsection and § 5's file map first.
- **Opening hook strategy:** open § 1 with the real call-center bug — the API switched commessa by re-pointing only the master connection, so unqualified reads went to the central schema and returned, without any error, the operatori of every commessa (GOP-276) or the slot configuration of the wrong one (GOP-274) — to show in four sentences that «su quale commessa?» is the question every door must settle first.
- **Closing beat promise:** end on a rule a developer applies before writing or debugging any integration: name its door, then answer the three questions — chi chiama, su quale commessa e su quale connessione, con quale contratto — in that order, and add a new capability as an operation of the motore or a PHP action, never as a database credential handed to an external service.
