# Review: Capitolo 15. Integrazioni e API

Reviewer run: 25 novembre 2026. Read fresh: `PRD.md`, `STYLE_BIBLE.md`, `chapter_15_struttura.md` (NUFs, beat list, readiness notes, TARGET), `chapter_15.md`, and `dossier_chapter_15.md` ([PUBLIC], [SHADOW], [CONFLICT], plus the 20 corrections at the top). Cross-checked the promises other chapters make to this one: `chapter_4.md:198`, `chapter_5.md:28,112,144`, `chapter_8.md:187,203`, `chapter_9.md:199`, `chapter_10.md:35,260` and `chapter_12.md:27`. To check the chapter 9 pointer, I listed `docs/mobile-v3/` in the GOPlanner repository (read only) and grepped `magazzino.md` and `magazziniere.md` for `/v3/magazzino` routes.

## 1. Executive Summary

The chapter has a real thesis and keeps it. Every door has to answer chi chiama, su quale commessa and con quale contratto, and the opening bug proves why in a few sentences: 120-minute slots that no configuration produced, then 2404 operatori against 50. The door map, the `/v3/` check table, the Call Center glossary table and the motore's numbers table are reference material a developer will keep open. Almost every number traces to the dossier, and the Writer applied most of the dossier's 20 corrections: 500 not 503, the purge that is not scheduled, `PUT` locked only in lotti a fasce, two `0031` migrations, 46 operations.

Five things kept it below the pass line:

- **Two of the credentials, the chapter's own subject, were wrong.** The table gave `json_admin.php` the credential `users.admin = 1`. GOP-294 actually requires `users.tipo = 0` or the global super-admin. The text also said a call-center key kept only in the commessa's configuration selects the commessa by itself. In fact it needs a `customer_id` (`api_cc.php:165-182`).
- **Two statements contradicted the text around them.** One said «sono ritentabili solo» five codes, yet `dependency_pending` is retryable. One said «si salvano tutti … i 4xx che non sono ritentabili», yet the next sentence excludes two of them.
- **The serious 1.x findings were buried.** «Il ciclo di scrittura, però, termina dopo la prima riga» appeared with no consequence and no escalation. The Stato Master Override paragraph also left out the `interventi` update.
- **A circular pointer.** Chapter 9 sends the reader here for the magazzino routes, and this chapter sent them back to chapter 9 with only a count.
- **Length.** About 6,630 words of prose, about 7,800 by `wc`, against a hard ceiling of 6,000. § 4 runs to about 1,490 words against the 1,200 section maximum.

All five are fixable in place, and I have applied the fixes.

## 2. Score: 47/60 → REVIEWER_CORRECTIONS

| Dimension | Score | One-line reason |
|---|---|---|
| Narrative & Structure | 8/10 | Hook → three questions → door map → one section per door → outbound → a closing rule. The order is clear and the counter-objections sit where the doubt arises. The thesis thins out in § 4–§ 6 (the three questions are rarely named again), and the original closing ignored the outbound rule § 6 had just established. |
| Language, Style & Voice | 8/10 | The persona holds: short rule sentences after long ones («La domanda «su quale commessa?» la risolve la porta. Se la porta la risolve a metà, più a valle nessuno se ne accorge.»), exact names, no banned patterns, no «noi» outside verbatim quotes. Drift: catalogue paragraphs (the OAuth paragraph packed ten facts), the awkward «GOPlanner è anche chiamante: del gateway AI…», «gettone» and «token» mixed in one sentence with no gloss, and «il heartbeat». |
| Factual Accuracy | 7/10 | About 300 checkable claims, nearly all traceable. Errors: the `json_admin.php` credential, the configuration key that «sceglie la commessa da solo», «solo» five retryable codes, the self-contradicting storage rule, and the Master Override told as utenza-only when the dossier says `interventi` is updated too. In a chapter about credentials, two credential errors weigh more than their number suggests. |
| Audience Alignment | 8/10 | Every litmus-test task is covered: the door and first file for each caller, reading a `/v3/` error, why call-center reads carry the schema and which tests prove it, adding a read to the motore, why Gea has no database credential, and what happens when the gateway, Nominatim or OSRM goes quiet. Lost points: the overrun (dense reference prose a reader must wade through), the chapter 9 dead end, and 1.x hazards with no escalation path. |
| Sensory & Emotional Engagement | 7/10 | Real stakes, told as facts: the hook, `BOOKING_BUSY` without the `0015` index, «dev usa il database di produzione», the `finish_reason=length` case, 93 of 4100 utenze. § 2 (idempotency) and § 4 (numbers, OAuth, transport) read like a well-annotated spec. They are correct, but nothing in them breaks in front of the reader. |
| Originality & Angle | 9/10 | The «tre domande per ogni porta» lens is original, useful and earned: it turns a list of endpoints into a way to debug. The door map exists nowhere else in the repository. The chapter catches the repository contradicting itself (pattern 16 against the code, envelope.md against `Response::isStorable`, cookbook 16 against the queries of 25 novembre) without mocking it. |
| **Total** | **47/60** | |

## 3. Detailed Findings by section

### «In questo capitolo»
- Good: it names the callers, the three questions, and where the office reader can stop («chi lavora in ufficio può fermarsi dopo la tabella della prima sezione»). Format is correct.

### § 1 — Le porte
- **Hook, strong but missing its sharpest consequence.** «`OperatoreLocale::getAll()` restituiva gli operatori di tutte le commesse, 2404 operatori attivi nello schema centrale contro i 50 della commessa interessata (GOP-276).» The dossier (Jira GOP-276) adds that `book` «poteva scrivere l'operatore scelto nella commessa». The real danger was a write, not only a read. **Fixed.**
- **Credential error in the door table.** «| Staff GOPlanner | `json_admin.php`, Admin › «Console JSON» | sessione con `users.admin = 1` |…». Dossier § 2-J: `json_admin.php` accepts only `users.tipo === 0` or the global super-admin (GOP-294). `users.admin = 1` gates the Admin page. The Console itself calls `json_android.php` with the chosen operatore's `sim_id`, not `json_admin.php`. **Fixed**, and the row now points to chapter 12 as well.
- **Gloss missing.** «un gettone OAuth legato all'identità»: «gettone» appears for the first time next to two «token» with no explanation. **Fixed** with a one-clause gloss.
- **Awkward Italian.** «GOPlanner è anche chiamante: del gateway AI (foto, Gea), di un server AI locale (indirizzi)…» («chiamante del gateway» does not parse). **Rewritten** (R2).
- **Weak sintesi.** «La regola da portare via è la tabella stessa: prima di aprire un file si individua la porta, e la porta dice quale file aprire per primo.» This is circular and does not tie back to the hook. **Rewritten** (R3).
- The unreached root rules for `/api/…` are stated as fact. The dossier marks them «[UNVERIFIED a runtime]», but the root comment quoted in the same paragraph supports the claim. Acceptable.

### § 2 — L'API dell'app
- **Internal contradiction on retryable codes.** «Dei 23 codici di `ApiError::CODES` sono ritentabili solo `request_in_progress` (409), `rate_limited` (429), `internal_error` (500), `unavailable` e `maintenance` (503).» Four paragraphs later: «i 4xx ritentabili come `dependency_pending`». Both statements are true only because `dependency_pending` and `unsupported_media_type` come from subclasses outside the frozen `CODES` (dossier § 2-A). The reader is not told that. **Fixed** (R4).
- **Self-contradicting storage rule.** «Si salvano tutti i 2xx e i 4xx che non sono ritentabili. Non si salvano mai … i due rifiuti che dipendono dallo stato del momento». Those two are non-retryable 4xx. The fact that a non-storable answer releases the key (dossier § 2-E) was also missing. **Rewritten** (R5).
- **Circular pointer.** Chapter 9 says «Le rotte dell'app sono in `docs/mobile-v3/magazziniere.md` (capitolo 15)». This chapter said only «16 del magazzino (capitolo 9)». **Fixed**: the route families from the dossier § 2-D are named, with `docs/mobile-v3/magazzino.md` and `magazziniere.md` (both exist on the repository; their `/v3/magazzino` routes were checked by grep).
- **1.x, the most serious facts were buried.** «Il ciclo di scrittura, però, termina dopo la prima riga.» This is a code-reading finding: a multi-row batch writes one row and answers for one row. It was dropped mid-paragraph with no consequence, and it did not appear in the staff box. «la riga dell'esito non si sovrascrive, ma il telefono riceve comunque `success: true` e lo stato dell'utenza viene aggiornato lo stesso» also leaves out what dossier correction 8 says: on the generic path `interventi` is updated too. **Rewritten** (R6). Both cases were also added to «Quando chiedere allo staff tecnico».
- **Limite told the rule but not the case.** «dove manca, una scrittura risponde 500 `internal_error` e non viene eseguita.» The dossier has the real case: two commesse moving to GOPlanner 3 in November 2026 lacked `0007`, and the release note says «le chiusure e le foto dell'app 3 vanno in errore» (changeset GOP-806, GOP-809). **Added** (R7). Sources were updated.
- Nit: «il heartbeat» → «l'heartbeat». **Fixed.**
- Good: the check-order table (with the 413 row the dossier required), `already_applied` in the counter-objection, and the PHP 7.3 rule dated and conditioned.

### § 3 — Il call center
- **Credential error.** «Il token della commessa, cioè `clienti.apikey` o la chiave nella configurazione della commessa, sceglie la commessa da solo.» Dossier § 3 (`api_cc.php:165-182, 238-256`) says otherwise. A token that is not master and not `clienti.apikey` needs a `customer_id`. It is accepted only after the configuration of that commessa has been read and matched (`$custom['call_center_api_key']` or `CALL_CENTER_API_KEY`). A developer following the old text would get a 401. **Fixed** (R8).
- Good: the glossary table («utenze, non utenti»), the states with codes and the reason 9 is used and not 8, the qualified-read `php` fragment, the honest gaps of the lock («fuori dai lotti a fasce», no UNIQUE), and `0015` «preparata, non applicata».
- The section is 1,047 words, within range.

### § 4 — Il motore unico
- **Over length** (about 1,490 words; the maximum is 1,200). The OAuth paragraph was the densest block: «I client registrati da oltre 30 giorni e senza più gettoni vengono cancellati da una pulizia che parte a caso, circa una richiesta di gettone su 50.» That is trivia for this reader. **Rewritten** (R9, cut about 40 words).
- The procedure's closing repeated the «esegui()» bullet list two paragraphs up: «Validazione dello schema, perimetro della commessa, permesso o tipo minimo, campi, cursore e registro li dà il motore.» **Shortened.**
- **Limite paragraph.** About 200 words held four unrelated limits in one run of semicolons. **Turned into** an intro plus a four-item list (R10), and it reads at a glance.
- Good: the «Attenzione» box pairs the risk («dev usa il database di produzione») with every guard, as the readiness notes asked. The counter-objection names what stays *out* of the register, an honest detail most writers would skip.

### § 5 — Gea e il Portolano
- **Ambiguous Limite.** «Gea, oggi, può eseguire una sola SELECT controllata con lo strumento `interroga_dati`». This reads as «Gea may run one SELECT, ever». The text means one statement per query. The paragraph also missed «solo per chi vede tutti i lotti» and «eseguita o rifiutata» (dossier § 5). **Rewritten** (R11).
- Good: the reason for «PHP unico broker» comes from pattern 27 and is told plainly. The two-piece identity bridge explains why the header exists. The Portolano traps are dated and backed by the queries of 25 novembre. No header name, no host, no model.

### § 6 — Servizi esterni
- Good: the outbound rule opens the section. The `finish_reason=length` case gives problem, cause and remedy in one sentence. The geocoding order follows the code, not pattern 48. The correction that the address AI uses only the local server (dossier correction 11) is applied. The `zone_outbound` module migration is cited correctly.
- **Closing ignored the outbound rule.** The closing restated the three questions, which fit inbound doors, and dropped the rule § 6 had just established for outbound calls. **Fixed** with one sentence (R12).

### Fonti
- Missing: `docs/mobile-v3/magazzino.md`, `docs/mobile-v3/magazziniere.md`, `migrations/tenant/0007_mobile_v3_richieste.sql`, and GOP-806/GOP-809. **Added.**

### Format and security
- One H1. Six `##` sections, each with its italic audience line. `## Fonti` last. All four required tables, the procedure and both boxes are present. No model name, host, IP, key value, service-header name, personal name or assistente vocale vendor. «Tenant» appears only as code (`tenant_disabled`, `migrations/tenant/`), in verbatim quotes, or after «la commessa, che nel codice si chiama tenant». «Chatbot» appears only as code.
- The trailing `<!-- … -->` comments are pipeline metadata, present in every chapter. They must be stripped before publishing (PRD: «niente HTML grezzo»). Pipeline item, not a chapter defect.

### Cross-chapter consistency (for the Editor and the oracle)
- `chapter_8.md:187` («il server conserva quella risposta per 30 giorni») and `chapter_8.md:203` («registro conservato 30 giorni») contradict the dossier and this chapter. On `php8`, `IdempotencyStore::purge()` has no caller, so saved answers are kept until a purge job exists. Chapter 8 should say «30 giorni scritti nel contratto; la pulizia non è ancora schedulata». The dossier [CONFLICT] § 2 asks for exactly this. Not edited here, because the scope is chapter 15.
- The chapter 9 pointer is now resolved on this side.

## 4. Persona Audit

**Verdict: on persona, with drift in density rather than tone.**

- *«Spiego come funziona davvero, con il nome esatto di ogni cosa.»* Yes, throughout: `Kernel::handle`, `Response::isStorable`, `SimpleOrm::sqlMaster()`, `OperazioniConferma`, `ChatbotQuerySelect`, `GeocodificaAi::nomeCoerente`.
- *«Ogni regola ha il suo perché e la sua fonte.»* Yes: why 9 and not 8, why the service header, why `esegui()` cannot be reached from the console adapter, why reasoning is off at 6,000 tokens.
- *«Se una cosa vale solo per alcune commesse, lo dico.»* Yes: the call center, comandi remoti, dati di prova, Google with the commessa's own key, «alcune commesse storiche».
- *«Se non lo so, non lo scrivo.»* Exemplary: «nessuna fonte prova che sia avvenuta», «lo stato del collaudo, dopo il 25 settembre 2026, non è documentato», «non c'è prova di dove sia stata eseguita».
- *«I prove every point with one surgical example, not three.»* Mostly. Drift where a paragraph lists facts without ranking them (the original OAuth and § 4 Limite paragraphs).
- *«I do not intensify — I specify.»* Yes. The only intensifier in the original was «un caso peggiore» in the hook, and it is earned by the 2404/50 figure that follows.
- *«My ending cannot echo any previous chapter.»* It does not. It restates this chapter's own thesis as a procedure, which is what the TARGET asked for. With R12 it now covers both directions of traffic.

Where it drifted, the drift was toward the reference manual, not toward the generic assistant. That is the right failure mode for this persona, but it is still a failure in § 2 and § 4.

## 5. Counter-Objection Check

Six are present (the STYLE_BIBLE requires at least two). Each is in the reader's voice, at the point where the doubt arises, and answered from the dossier.

| # | Question as written | Strongest form? | Evidence-based answer? |
|---|---|---|---|
| 1 | «Ma `/api/v2/` è la versione 2 dell'API del call center?» | A naming confusion, the weakest of the six, but it is real: the PRD makes it too. | Yes: `api/.htaccess`, GOP-629, separate credentials. |
| 2 | «E se il telefono rimanda lo stesso esito, il server lo scrive due volte?» | Strong: the fear behind every retry design. | Yes: same key → saved answer; lost key after commit → `already_applied`; 1.x → can duplicate, and only foto are deduplicated. |
| 3 | «Se due chiamate prenotano lo stesso posto nello stesso istante?» | Strong, and it names its own gaps. | Yes: lock → 409 `SLOT_TAKEN`, the concurrency script, `PUT` outside lotti a fasce, no UNIQUE. |
| 4 | «Un agente collegato all'MCP può fare più dell'utente che l'ha collegato?» | Strongest of the six: the question a security reviewer asks first. | Yes, and it goes further, listing what is *not* registered. |
| 5 | «Ma Gea legge anche i documenti per sviluppatori del Portolano?» | Moderate. | Yes: public role, path filter, README only for the session's commessa. |
| 6 | «Se l'AI corregge un indirizzo, cambia l'anagrafica dell'utenza?» | Strong for the office reader who reaches this DEV chapter. | Yes: `utenti.indirizzo`/`civico` never change, recorded, reversible. |

Missing in its strongest form: «Se il canale 1.x scrive solo la prima riga e scavalca il Controllato, perché è ancora acceso?» The sources do not answer it, so the chapter correctly does not ask it. The new staff-box item now sends the reader to the right people.

## 6. Priority Improvements

### Critical (applied)
1. The `json_admin.php` credential in the door table.
2. The configuration-only call-center key requires a `customer_id`.
3. The 1.x write loop (first row only) and the partial Master Override, stated with their consequence and added to the staff box.

### Important
4. (Applied) The retryable codes and the storage rule, stated without contradiction.
5. (Applied) The chapter 9 ↔ chapter 15 circular pointer.
6. (Applied) The real `0007` case (GOP-806/809) in the § 2 Limite.
7. **(Open) Length.** After the corrections the prose is about 6,860 words (§ 2 ≈ 1,255, § 4 ≈ 1,470). The struttura gives the order of cuts: «cut § 2's 1.x subsection and § 5's file map first». The surgical candidates, in order:
   - § 4: compress the four write families into one line each (about −60). Drop the sentence on `tests/e2e-mcp/console.php` from the aggancio, since step 4 of the procedure already names `run.sh` (about −25).
   - § 2: fold the paragraph on non-idempotent writes into the idempotency list as one bullet (about −30). Shorten the signature paragraph to the server-only facts (about −25).
   - § 5: shorten the file map to the four files a developer opens (about −40).
   - § 1: cut the second half of the timbratori/telelettura paragraph to one clause each (about −20).
   That brings it to about 6,650, still over. Reaching 6,000 needs a decision from the Editor on whether § 4 keeps the full OAuth paragraph.
8. **(Open, other chapter) Chapter 8, lines 187 and 203:** «30 giorni» must become «30 giorni scritti nel contratto; la pulizia non è ancora schedulata».

### Optional
9. Name the three questions once more inside § 4 («chi chiama» = the gettone; «su quale commessa» = the `commessa` parameter; «con quale contratto» = TOON) and § 5, so the thesis visibly carries the middle of the chapter.
10. «`carichi`, `pratiche` e `interventi` partono dal tipo 2» is ambiguous to a reader who does not know that a lower `tipo` means more power. Add «(tipo 2 o inferiore: il numero più basso ha più potere)».
11. Strip the pipeline `<!-- … -->` comments at publish time (all chapters).

## 7. Rewritten Paragraphs

**R1 — § 1, hook (sentence 6)**
- *Original:* «Lo stesso giorno, cercando la stessa causa in altri punti, è emerso un caso peggiore: `OperatoreLocale::getAll()` restituiva gli operatori di tutte le commesse, 2404 operatori attivi nello schema centrale contro i 50 della commessa interessata (GOP-276).»
- *Rewritten:* «Lo stesso giorno, cercando la stessa causa in altri punti, è emerso un caso peggiore: `OperatoreLocale::getAll()` restituiva gli operatori di tutte le commesse, 2404 operatori attivi nello schema centrale contro i 50 della commessa interessata, e la prenotazione poteva scrivere nella commessa un operatore di un'altra (GOP-276).»
- *Why:* «Un caso peggiore» needs its proof. A wrong read is bad; a wrong *write* into another commessa's calendar is the stake that makes the reader care about qualifying every read. The fact is in Jira GOP-276 (dossier, Jira section).

**R2 — § 1, outbound doors**
- *Original:* «GOPlanner è anche chiamante: del gateway AI (foto, Gea), di un server AI locale (indirizzi), di Nominatim e Google (geocodifica), di OSRM (distanze), di FCM (comandi remoti), del Portolano e dei log cloud. Le ultime due sezioni del capitolo entrano nel dettaglio.»
- *Rewritten:* «Le porte in uscita vanno nel verso opposto: lì il chiamante è GOPlanner. Chiama il gateway AI per le foto e per Gea, un server AI locale per gli indirizzi, Nominatim e Google per la geocodifica, OSRM per le distanze, FCM per i comandi remoti e, dal servizio di Gea, il Portolano e i log cloud. Le ultime due sezioni del capitolo entrano nel dettaglio.»
- *Why:* «Essere chiamante di» is not idiomatic Italian, and the parenthetical tags made the reader decode a list. The new version states the turn (inbound → outbound) in a short sentence and attributes the Portolano and the logs to the service of Gea, as the dossier does.

**R3 — § 1, sintesi**
- *Original:* «La regola da portare via è la tabella stessa: prima di aprire un file si individua la porta, e la porta dice quale file aprire per primo.»
- *Rewritten:* «La regola: quando un chiamante si comporta male, si parte dalla sua riga della tabella. La colonna «Porta» dice quale file aprire per primo; la colonna «Da dove viene la commessa» dice dove guardare se i dati sono di un'altra commessa.»
- *Why:* The original was circular («la porta dice quale file… si individua la porta») and used only one column. The rewrite turns the table into a two-step diagnostic and ties the second step back to the hook (data of another commessa).

**R4 — § 2, the envelope: retryable codes**
- *Original:* «Dei 23 codici di `ApiError::CODES` sono ritentabili solo `request_in_progress` (409), `rate_limited` (429), `internal_error` (500), `unavailable` e `maintenance` (503).»
- *Rewritten:* «Dei 23 codici di `ApiError::CODES` sono ritentabili solo cinque: `request_in_progress` (409), `rate_limited` (429), `internal_error` (500), `unavailable` e `maintenance` (503). Due codici stanno fuori dall'elenco, che è in un file congelato, e nascono da sottoclassi locali di `ApiError`: `dependency_pending` (409, ritentabile) e `unsupported_media_type` (415).»
- *Why:* Without the second sentence, «solo» is contradicted three paragraphs later by «i 4xx ritentabili come `dependency_pending`». A developer grepping `CODES` for `dependency_pending` would not find it. The dossier (§ 2-A) explains why: the frozen file plus local subclasses.

**R5 — § 2, what the idempotency registry saves**
- *Original:* «Che cosa si salva lo decide `Response::isStorable`. Si salvano tutti i 2xx e i 4xx che non sono ritentabili. Non si salvano mai i 5xx, i 429, i 4xx ritentabili come `dependency_pending`, e i due rifiuti che dipendono dallo stato del momento, `intervento_locked` e `already_closed`: se l'ufficio cambia l'intervento, lo stesso «Riprova» deve essere giudicato di nuovo. `not_found`, invece, si salva.»
- *Rewritten:* «Che cosa si salva lo decide `Response::isStorable`: i 2xx e i 4xx definitivi. Restano fuori i 5xx, i 429, i 4xx ritentabili come `dependency_pending` e due rifiuti che pure non sono ritentabili, `intervento_locked` e `already_closed` (`ApiError::STATE_DEPENDENT`): dipendono dallo stato del momento, e se l'ufficio cambia l'intervento lo stesso «Riprova» deve essere giudicato di nuovo. Una risposta che non si salva libera la chiave. `not_found`, invece, si salva.»
- *Why:* «Tutti … i 4xx che non sono ritentabili» followed by two non-retryable 4xx that are *not* saved is a contradiction. «Pure non sono ritentabili» names the exception as an exception. The constant name lets the reader find it, and «libera la chiave» (dossier § 2-E) is the mechanism that makes a re-judged «Riprova» possible.

**R6 — § 2, GOPlanner 1.x inbound sync (core of the paragraph)**
- *Original:* «Il lotto si valida tutto prima di scrivere: un campo intero non numerico lo rifiuta intero (GOP-242). Il ciclo di scrittura, però, termina dopo la prima riga. Se l'ufficio ha portato l'intervento a Controllato (6) o oltre, vale lo «Stato Master Override» del pattern 16: la riga dell'esito non si sovrascrive, ma il telefono riceve comunque `success: true` e lo stato dell'utenza viene aggiornato lo stesso.»
- *Rewritten:* «Il lotto si valida tutto prima di scrivere: un campo intero non numerico lo rifiuta intero (GOP-242). La scrittura, invece, non arriva in fondo: tutti e due i rami dell'esito fanno `return` dentro il `foreach`, quindi, a leggere il codice, di un lotto si scrive la prima riga e la risposta riguarda solo quella. Se l'ufficio ha portato l'intervento a Controllato (6) o oltre, il pattern 16 promette che i dati dell'app vengano «ignorati silenziosamente» e chiama la regola «Stato Master Override». Il codice protegge meno: la riga dell'esito non si sovrascrive, ma lo stato dell'utenza si aggiorna lo stesso, sul percorso generico parte anche un aggiornamento di `interventi`, e il telefono riceve `success: true`.»
- *Why:* These are the two ways the old channel actually breaks, and the original passed over both in a sentence each. The rewrite shows the mechanism (`return` inside `foreach`), marks the finding as a code reading (the dossier tags it as not executed), contrasts the documented promise with the code, and restores the `interventi` update from dossier correction 8. The matching staff-box item tells the reader what to do with it.

**R7 — § 2, Limite: missing migration `0007`**
- *Original:* «Il registro richiede la migrazione tenant `0007`, applicata commessa per commessa: dove manca, una scrittura risponde 500 `internal_error` e non viene eseguita.»
- *Rewritten:* «Il registro richiede la migrazione tenant `0007`, applicata commessa per commessa. Dove manca, ogni scrittura risponde 500 `internal_error` e non viene eseguita. Non è un caso di scuola: a novembre 2026 due commesse in passaggio a GOPlanner 3 ne erano prive, e la nota di rilascio annota che senza quella tabella «le chiusure e le foto dell'app 3 vanno in errore» (GOP-806, GOP-809).»
- *Why:* The original told a rule. The rewrite shows that it happened and what it cost (closures and foto failing), from the dossier § 2-G. That turns a conditional into a check the reader will actually run before moving a commessa to GOPlanner 3.

**R8 — § 3, call-center credentials**
- *Original:* «Con il token master serve un `customer_id` esplicito. Il token della commessa, cioè `clienti.apikey` o la chiave nella configurazione della commessa, sceglie la commessa da solo.»
- *Rewritten:* «Con il token master serve un `customer_id` esplicito. Il token della commessa in `clienti.apikey` sceglie la commessa da solo. Una chiave scritta solo nella configurazione della commessa (`$custom['call_center_api_key']`) vale invece soltanto insieme a un `customer_id`, e si confronta dopo aver letto quella configurazione.»
- *Why:* This was factually wrong. `api_cc.php:165-182` asks for a `customer_id` when the token is neither master nor `clienti.apikey`, and `:238-256` checks the configuration key only after that commessa's `config.inc.php` is loaded. «Chi chiama» is this chapter's first question, so the chapter cannot get a credential wrong.

**R9 — § 4, OAuth paragraph**
- *Original:* «GOPlanner fa da server di autorizzazione (`mcp_oauth.php`, `McpOAuth`) e delega il login all'accesso Google già esistente. Il clic sul pulsante è il consenso, mai un accesso automatico. Il gettone è legato all'identità; `clienti.apikey` non viene mai letta da queste porte. […] Disattivare l'identità toglie l'accesso alla chiamata successiva, perché l'identità si ricontrolla ogni volta. Lo stesso gettone vale su `/mcp` e su `/api/v2/`. I client registrati da oltre 30 giorni e senza più gettoni vengono cancellati da una pulizia che parte a caso, circa una richiesta di gettone su 50.»
- *Rewritten:* «GOPlanner fa da server di autorizzazione (`mcp_oauth.php`, `McpOAuth`) e delega il login all'accesso Google già esistente; il clic sul pulsante è il consenso, mai un accesso automatico. Il gettone è legato all'identità, e `clienti.apikey` non viene mai letta da queste porte. Di codici e gettoni si salva solo l'hash SHA-256 (migrazione main `0021_mcp_oauth.sql`). Un codice o un gettone di rinnovo riusato revoca l'intera famiglia, perché, dice il codice, «un gettone gia' usato che ritorna vuol dire che qualcuno ne ha una copia». Gli indirizzi di ritorno sono di loopback, o https solo se l'host è in `MCP_OAUTH_REDIRECT_HOSTS`. L'identità si ricontrolla a ogni chiamata: disattivarla toglie l'accesso dalla chiamata successiva. Lo stesso gettone vale su `/mcp` e su `/api/v2/`.»
- *Why:* § 4 is the longest section. The client purge (1 in 50) is housekeeping a developer adding an operation never needs, so cutting it trims the section. The rotation quote now works as the reason for the revocation, not as a free-standing line. The cause comes before the effect in the identity check.

**R10 — § 4, Limite**
- *Original:* «[…] e la configurazione è nel capitolo 16. Ci sono differenze note con la console: `carichi` della console non filtra per lotto, l'operazione del motore sì; sulle commesse dove un join della griglia moltiplica le righe di un intervento, un cursore che cade fra due righe dello stesso intervento salta la seconda; `tools/list` non conosce la commessa e mostra solo i campi base. E i cataloghi sono ancora due: `OperazioniCatalogo` per MCP e REST, `ChatbotRegistro` per Gea, con l'epic GOP-628 ancora aperta.»
- *Rewritten:* «[…] e la configurazione è nel capitolo 16. Restano quattro limiti noti:» followed by four bullets: lotto filter; cursor that skips the second row; `tools/list` with base fields only; two catalogs while GOP-628 is open.
- *Why:* Four unrelated limits joined by semicolons is a list pretending to be prose (STYLE_BIBLE: «Elenchi puntati ammessi per enumerare … il ragionamento resta in prosa»). The catalog item was also not a «differenza con la console», so the new lead-in is accurate for all four.

**R11 — § 5, Limite**
- *Original:* «Il limite di questa parte va detto con i numeri giusti. Gea, oggi, può eseguire una sola SELECT controllata con lo strumento `interroga_dati` (GOP-531): il controllo di `ChatbotQuerySelect` analizza la query a token, non con un albero sintattico, e ammette una sola istruzione senza subquery, solo sul database della commessa di sessione, con 5000 millisecondi e 50 righe al massimo, colonne sensibili escluse; ogni query viene registrata.»
- *Rewritten:* «Il primo limite di questa parte è uno strumento. Con `interroga_dati` (GOP-531) Gea esegue oggi una SELECT scritta dal modello. Il controllo, `ChatbotQuerySelect`, analizza la query a token e non con un albero sintattico; ammette un'istruzione sola, senza subquery, solo sul database della commessa di sessione, con al massimo 5000 millisecondi e 50 righe, colonne sensibili escluse. Lo strumento è riservato a chi vede tutti i lotti, e ogni query, eseguita o rifiutata, viene registrata. Gli altri limiti sono più brevi.»
- *Why:* «Può eseguire una sola SELECT» reads as one SELECT ever. «Il limite … va detto con i numeri giusti» was throat-clearing. The rewrite separates what the tool does from what the guard allows, adds two guards from the dossier (lotti, refused queries registered), and signals the change of topic before the shorter limits.

**R12 — Closing**
- *Original:* «Prima di scrivere o di correggere un'integrazione, si nomina la sua porta e si risponde alle tre domande, in quest'ordine: chi chiama; su quale commessa, e su quale connessione; con quale contratto. Una capacità nuova entra come operazione del motore o come azione PHP, mai come una credenziale di database consegnata a un servizio esterno.»
- *Rewritten:* the same two sentences, with a middle sentence added: «Quando è GOPlanner a chiamare, la risposta che torna resta una proposta finché il codice non l'ha controllata.»
- *Why:* § 6 opens with the outbound rule, and the original closing forgot it, so the closing covered only half the chapter's traffic. One sentence makes the closing a complete rule for both directions without echoing any other chapter.

Also applied (single sentences or cells): the door-table row for staff tools; the «gettone» gloss in § 1; the magazzino routes and docs in § 2; «l'heartbeat»; removal of the duplicated `dependency_pending` message in § 2; the shortened procedure closing in § 4; the 1.x items in «Quando chiedere allo staff tecnico»; three Fonti entries.

## 8. Verdict

**REVIEWER_CORRECTIONS.** The thesis, the tables and the honesty about limits are the best of the DEV chapters. Two wrong credentials, two self-contradictions and the buried 1.x hazards had to be fixed paragraph by paragraph (19 paragraphs rewritten), and § 2 and § 4 are still over the length limit.
