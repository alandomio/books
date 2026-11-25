# Review — Capitolo 13. Architettura di GOPlanner su PHP 8

Reviewer run: 25 novembre 2026. Read fresh: `PRD.md`, `STYLE_BIBLE.md`, `chapter_13_struttura.md` (NUFs, beat list, readiness notes, TARGET), `chapter_13.md`, `dossier_chapter_13.md` (every [PUBLIC], [SHADOW] and [CONFLICT] row). Glossary checked against `CONTEXT.md` (entry «Lotto»). Spot-checks on GOPlanner `php8` (read only, commit `21e974921`): `lib/JSONController.php:2588-2660` (docblocks of `enqueueStandardExport` and `enqueueFotoExport`), `json_admin.php:1-40` (order of the two guards), `js/code/esportazione.js` (`segui` → `GopJobProgress`), `index.php:115-118`. One PHP language check (PHP 7.3 CLI, toy class in `/tmp`, no project code run) on how `call()` resolves method names.

## 1. Executive Summary

This is the best-sourced chapter in Part IV so far. The thesis («un solo codice con molte porte», three first steps at every door) holds from the opening click to the closing design rule. The GOP-687 case («L'errore era la parte fortunata») is the strongest single passage in the book: a real failure, quoted, fixed, with its side effect (GOP-686) and its guard. The chapter also names seven places where `docs/` contradicts `php8`, which is exactly the protection a coding agent needs.

It does not pass as minor, for two reasons:
- **Four factual errors on a chapter whose whole promise is verifiability.** The GOP-647 quote («un altro ZIP da 13 MB») was attached to the standard «Esporta», but in the code it sits on `enqueueFotoExport()`, the photo ZIP. `json_admin.php` was said to have both guards «prima di `config.inc.php`», but the second guard sits after it (the code comment says why). The opening said «due processi» while describing three. And § 3 taught that helpers are `private` *so that* `call()` cannot reach them. That reason could not be confirmed as stated (see § 3 and the security note). The chapter no longer makes the claim.
- **Overlength.** The body is 7.333 words against the PRD's 4.000–6.000 and the struttura's 5.600–5.900. § 5 alone is about 1.700 words against a 1.200 cap.

21 passages were rewritten and the Fonti list was completed with 8 missing Jira keys. The overlength remains, and the next Editor pass should cut it (see Important).

## 2. Score: 47/60 → REVIEWER_CORRECTIONS

| Dimension | Score | One-line reason |
|---|---|---|
| Narrative & Structure | 7/10 | Clear build: click → doors → page → JSON → commessa → queue → browser → choose the door. The closing pays off the opening. Against: 24% over the PRD ceiling. § 5 reads as a catalogue (queue, signals, cron, Giro, contract, seven types, timers, ten-step procedure, objection, two boxes, a 170-word Limite). § 4 made the same point («una classe caricata non si scarica») three times. |
| Language, Style & Voice | 8/10 | On persona almost throughout: exact names, line numbers, dated decisions, short rule sentences after long explanations, no «noi». Drift: narrator meta («va letta con attenzione», «Va detto con equilibrio», «va descritto per quello che fa», «va detto senza drammi»), Limite paragraphs that announce themselves («Tre limiti vanno tenuti presenti», «I limiti della sezione sono tre»), two unsourced frequency claims, and «lotti» used for `Batch` five times (a glossary collision). |
| Factual Accuracy | 6/10 | Around 250 checkable claims; almost all trace to the dossier with a line number. Four errors (above), one unsourced consequence presented as fact («la commessa si ritrova con due file o due importazioni»), one over-general table cell («includono `config.inc.php` e un controller dedicato» for a row ending in «e simili»), one research-process leak («non è stato verificato»), and 7 Jira keys cited in the body but missing from Fonti. |
| Audience Alignment | 9/10 | The DEV reader gets what NUFs 1–7 promise: the door table, the 14 steps of `index.php`, «Trovare i file di una pagina», the `call()` fragment, `mappature.php` as code, the ten-step «Aggiungere un lavoro asincrono», the process table with service names. The staff tecnico gets the boxes and stops at the right place. Line numbers will rot, but the chapter dates its research (25 novembre 2026). |
| Concreteness (replaces Sensory) | 8/10 | Dense with exact detail: 427 lines of `index.php`, 246 legacy branches in 9.570 lines, 170 public methods, «Undefined constant Intervento::codici_note_lettura», SIGWINCH as the real stop signal, 2 s / 4 s / 3 s / 60 s polling, `md5` of mtime and size. Real cases are told as problem → cause → fix: GOP-687, GOP-686, GOP-704, GOP-703, GOP-689, GOP-249. § 5 loses the reader in numbers before the procedure. |
| Originality & Angle | 9/10 | «Choose the door before the first line» is a design rule no earlier chapter gives. The doc-vs-code drifts are new knowledge: no template override, `$mappatura` not `$custom['mappature']`, `.html` not `.tpl`, websocket not used for job progress, `AssetUrl` not a content hash, `js/js.php` that doesn't exist, `$DEFAULT_PAGE` never defined. Nobody had written them down. |
| **Total** | **47/60** | |

## 3. Detailed Findings by section

### «In questo capitolo» and § 1 — Molte porte, un solo codice

- Strong: the door table covers every entry point in the struttura plus `/json/<action>`, `/api/cc/v1/…` and the `.htaccess` fallback that turns `utenze.php` into `index.php?page=utenze`. The fallback is a genuinely useful surprise for a new developer. The counter-objection «Ma perché tante porte…» is in its strongest form and answered from two sources (`02-project-structure-map.md` «DEBITO TECNICO», GOP-628 «estratto … non riscritto»).
- **Process count wrong.** «Un clic su «Esporta» … attraversa cinque file e due processi.» The same paragraph then names the web request, `worker.php` and the child `worker_job.php`, and § 4 explains that the child is a separate exec'd process. Fixed: «tre processi PHP».
- **Misattributed quote (verified in code).** «Prima della coda le cose andavano diversamente, e il commento di GOP-647 nel codice lo racconta senza giri di parole: «Lo ZIP richiede minuti…»» The text placed this right after `enqueueStandardExport()`, as if it were the history of that click. In `lib/JSONController.php` the comment is the docblock of `enqueueFotoExport()`: «GOP-647: esportazione classica in coda (… foto, verbali PDF, invii SOAP e mail)». The standard model went to the queue under GOP-238 (docblock of `enqueueStandardExport()`, in the dossier). The dossier row («commento in `lib/JSONController.php:2645-2650`») did not name the method, and the Writer guessed. Rewritten (R1). The quote stays, attributed to the photo ZIP.
- **Guard order wrong (verified in code).** «`json_admin.php` ha due cancelli, entrambi in cima al file e prima di `config.inc.php`». Only the first is. `json_admin.php:31-33` puts `denyUnlessCanUseJsonAdmin()` after `config.inc.php`, with the comment «sta dopo config.inc.php perche' risolvere l'identita' richiede il DB». Rewritten (R2).
- **Over-general table cell.** The «altri file di utilità … e simili» row said «includono `config.inc.php` e un controller dedicato». The dossier verifies `config.inc.php` only for `export.php`, `getconfig.php` and `acra-report.php`, and a controller for none of the three. «e simili» also covers files the dossier marks [BLOCKED]. Now: «dipende dal file | quelli nominati includono `config.inc.php`; alcuni hanno un controller proprio (terza sezione)». The [BLOCKED] items stay out of the chapter.

### § 2 — Una pagina, dal clic all'HTML

- Strong: the 14 numbered steps, each with its line number, match the dossier line by line. The two `die()` messages are explained precisely («stampa il percorso completo che ha cercato»). `$DEFAULT_PAGE` is caught as a variable nobody defines. The `DizionarioVoce::appendi()` paragraph, with GOP-689's «spegnere tutto il sito», is the kind of thing a developer learns only by breaking it.
- **Wrong word.** «attraverso tre strati: `MyWrapper` …, `SimpleOrm` …, `MainOrm` …». These are three alternative classes, not stacked layers. Fixed: «tre classi».
- **Unsourced frequency claim.** «È l'obiezione più frequente di chi aggiunge la prima pagina». No source measures this (STYLE_BIBLE: no «in genere» without a source). Removed. The objection now opens on the fact: «Il controller e il menu sono due cose separate, e il menu si costruisce da un'altra parte.»
- **Self-announcing Limite.** «Tre limiti vanno tenuti presenti.» Removed. The paragraph now starts on the first limit.

### § 3 — Le chiamate JSON

- Strong: the `call()` fragment is verbatim. The «tre esiti» paragraph is exact. The fall-through into 246 branches is the right tension point. The six-step import chain keeps chapter 4's promise.
- **Claim removed: `private` as the reason a helper is out of reach.** The draft said: «ogni metodo chiamabile del controller è un'action raggiungibile per nome … Per questo ogni metodo di servizio è `private` … Il contesto ridimensiona il rischio … `private` resta un'abitudine di progetto, e va rispettata.» `call()` tests `is_callable(array($this, $method))` *from inside the class*. The PHP check (toy class only) does not support the inference that `private` takes a method out of that dispatch. Per the struttura's security rule, the chapter neither describes nor assesses the dispatch's reach. The paragraph now states only what the code shows: the action name is the method name, there is no allowlist, and `export()` delegates to a private helper (R3). The Sintesi changed accordingly: «Un'action nuova è un metodo pubblico di un controller, con il nome dell'action, che restituisce una stringa JSON e non stampa nulla.» NUF 4 in the struttura («every helper method is `private`») rested on the same premise. See the security note in § 6 of this review.
- **Narrator meta.** «È il debito tecnico della mappa della struttura. Va detto con equilibrio: …». Rewritten to quote the document's own label and drop the stage direction.
- **Glossary trap 4.** «prima del dispatch normale» (Gea's actions). The struttura allows «dispatch» only as code. Fixed: «prima dello smistamento normale».
- **To verify (not changed).** Counter-objection cause 2 («Il metodo fa `echo` invece di `return` … finisce nel buffer invece che in una risposta pulita») is plausible but not in the dossier. A method that echoes returns `null`, so `json.php` treats it like an unknown action. What reaches the browser then depends on whether the global buffer is flushed at the end, and nobody has verified that. The wording is vague enough not to be wrong. The Researcher should confirm it before the next pass.

### § 4 — La commessa nel codice

- Strong: GOP-687 told in the ticket's own words, with the decisive sentence «il Job non fallisce ma gira con la logica dell'altro tenant, senza avviso». It is followed by exec-not-fork with the reason from the `processInFiglio` docblock, the GOP-686 side effect, the composer condition, and the guard with its verbatim message. This section is the chapter's spine. The `mappature.php` subsection corrects `04-configuration-priority.md` (`$mappatura`, two folders), reports real key frequencies over 72 files, and shows `isEsportazione()`'s exact rule.
- **Triple repetition.** The same fact appears in the `ClassiCustom` docblock quote (l. 163), the GOP-687 quote (l. 167) and again in counter-objection 4 («Il caricatore da solo non basta: in PHP una classe caricata non si scarica né si ridefinisce nello stesso processo. Nessun autoloader, per quanto scritto bene, può sostituire una classe già caricata.»). Counter-objection 4 compressed (R6).
- **Self-announcing Limite.** «I limiti della sezione sono tre.» Removed.
- Security: the fragment comes from a commessa whose folder name is a generic word. The chapter names neither the file nor the folder. The `'Teleriscaldamento.xlsx'` template name is generic. Accepted.

### § 5 — Il lavoro che dura

- Strong: queue names, the `ATTESA_CODA` wait, GOP-703 and GOP-704 told as cases, the honest «fermo su `php8`, da non riparare» for `cron.php`, the seven-type table, the verbatim three-part rule, the cookbook procedure, the «In attesa» objection with the real alarm text, and two staff boxes with compose service names only.
- **Unsourced consequence in the hook.** «L'utente non sa se è finito, lo riavvia, e la commessa si ritrova con due file o due importazioni.» This is the Architect's tension point, not a sourced fact. Only pattern 47's «l'utente perde il lavoro di vista e non sa quando finisce» is in the dossier. Rewritten (R4).
- **Unsourced frequency claim.** «È la domanda che arriva più spesso a chi sviluppa». Removed.
- **Narrator meta + detail overload.** «La riga di `cron.php` va letta con attenzione.» The same paragraph also carried two scheduler modes and a MySQL reconnection detail that no reader action depends on. Rewritten and trimmed (R5).
- **Research-process leak.** «Come appaia Admin › «Giro» in quel caso non è stato verificato.» That is the dossier's [UNVERIFIED] note, not guidance. Now: «… e che cosa mostri allora Admin › «Giro» è una domanda per lo staff tecnico.»
- «Non ogni tipo è annullabile» → «Non tutti i tipi sono annullabili» (natural Italian). «I limiti di questo meccanismo sono scritti nel codice.» → «Il codice dichiara da sé i limiti del meccanismo.»
- **Glossary collision.** «inoltra l'avanzamento dei lotti `Batch`» and, in the staff box, «i contatori dei lotti». «Lotto» is a glossary word (`CONTEXT.md`: «La parte di commessa o di contratto a cui appartiene una lista»). A back-office reader who opens this chapter would read «the websocket serves the lotti». Fixed to «gruppi di lavori `Batch`» / «i contatori dei `Batch`».
- **Still too long** (≈1.700 words). See Important.

### § 6 — Nel browser

- Strong: `js/code/.htaccess` → `js.php?source=`, with its «niente percorsi» rule. jQuery 1.8.3 named as the one that actually loads, with the old copies commented out. The `AssetUrl` contradiction («calcolata dal contenuto» vs `md5` of mtime and size) is stated without drama. The cache table. The websocket scoped to exactly one consumer, with the docs that say otherwise named and GOP-124 as independent confirmation.
- **Glossary collision, three more times.** «nell'analisi delle foto in lotto», «la barra del lotto», «serve solo i lotti della pagina Admin». Fixed («più foto insieme (`analyze_batch_photos`, `start_photo_batch`)», «la barra del `Batch`», «i `Batch`»).
- **Narrator meta.** «Il websocket va descritto per quello che fa, e fa poco.» → «Il websocket ha un compito solo.» «Il websocket ha un limite che va detto senza drammi.» Removed; the paragraph starts on the condition.
- **Closing overclaim.** «Il codice dentro può essere identico: a cambiare il risultato è la porta.» Nothing in the dossier says the sync and queued exports share their inner code, and the line is the intensifier the Editor's own note says was removed («È la porta a fare la differenza»). Rewritten to end on the sourced case (R7).

### Fonti

- Added the Jira keys cited in the body but missing from the list: GOP-238, GOP-249, GOP-601, GOP-654, GOP-712, GOP-758, GOP-770, GOP-842. Titles reuse the wording of chapters 10–12. GOP-238's is taken from the code docblock.
- No host, no credentials file, no file name containing a host, no personal names. Pass.

### Format

- One H1, «*In questo capitolo*», six `##`, italic audience line on each, `## Fonti` last, code blocks with `php` declared and ≤ 12 lines, pipe tables with single-line cells. Pass.
- The trailing `<!-- … -->` Editor notes are raw HTML (STYLE_BIBLE § Formato). Every chapter carries four, so this is a pipeline convention, but the build must strip them. Their NUF note («private helpers ✅») is now out of date.

## 4. Persona Audit

**Verdict: on persona, with local drift that is now repaired.**

The Engineer + Scholar is audible in nearly every paragraph. Each claim has a name, a line, a ticket or a date: «la riga 270, `if(empty($page)) $page = 'utenze';`», «SIGWINCH, lo STOPSIGNAL dell'immagine php:apache, che PHP come PID 1 ignorava fino al SIGKILL». Rules come as one short sentence after a long one: «La risposta alla pagina è immediata. Il file arriva dopo, a volte minuti dopo.» Where the documentation is wrong, the chapter says so calmly and gives the code that wins. That is the persona's «Se non lo so, non lo scrivo» in practice. The Kidder side shows in GOP-687 and GOP-704: real work, real failure, what it cost.

Where it drifted:
1. **Narrator stage directions.** «va letta con attenzione», «Va detto con equilibrio», «va descritto per quello che fa», «va detto senza drammi». This is the assistant voice commenting on its own tone. All four removed.
2. **Template showing through.** Limite paragraphs that open by counting themselves («Tre limiti vanno tenuti presenti», «I limiti della sezione sono tre», «I limiti di questo meccanismo sono scritti nel codice»). Two removed, one rephrased. «Il limite di questa sezione è di perimetro» (§ 3) is left because it carries information.
3. **Authority without a source.** «l'obiezione più frequente», «la domanda che arriva più spesso», and the double-file consequence. These break «"in genere" senza fonte». Removed.
4. **One reason stated as fact that the code does not support** (the `private` rule). The persona would not write a protective claim it had not checked. Removed.

## 5. Counter-Objection Check

Six planned, **six present** (STYLE_BIBLE requires ≥ 2; struttura requires ≥ 4).

| # | Objection as written | Strongest form? | Evidence-based answer? |
|---|---|---|---|
| 1 | «Ma perché tante porte e non un unico punto d'ingresso?» | Yes. The chapter concedes it («L'obiezione è giusta») before answering. | Yes: `02-project-structure-map.md` «DEBITO TECNICO», GOP-628, GOP-629, `docs/mobile-v3/…` «non viene toccato». |
| 2 | «Ho aggiunto `pages/nuova.php`, ma la pagina non compare nel menu.» | Yes, as a practical failure. | Yes: `_header.html`, `$MENU` defaults in `config.inc.php`, `can_tipo(...)`, `lib/Menu*.php`. |
| 3 | «La mia action risponde vuota.» | Yes, ordered by likelihood. | Causes 1 and 3: yes. Cause 2 (echo): plausible, not in the dossier (see § 3 above). |
| 4 | «Perché non tenere acceso un solo processo …? Sarebbe più veloce.» | Yes. «Forse.» concedes speed. The strongest version (namespaces per commessa) is answered: examined and deferred. | Yes: GOP-687 decision, GOP-686 «valori non registrati». Now without the triple repetition. |
| 5 | «L'esportazione resta "In attesa" da dieci minuti.» | Yes. | Yes: `AvanzamentoAllarme::inCodaDaTroppo()`, «ALLARME lavoro non parte», `EsportazioneRegistro` message; staff box for what a branch cannot fix. |
| 6 | «Ho cambiato un file JavaScript e il browser carica ancora il vecchio.» | Yes. | Yes: `{{asset}}` versioning, the grep showing no hand-written `js/code/` address, `custom.js` 24 ore. |

Missing but worth one line in a future pass: «Il documento in `docs/` dice il contrario: chi ha ragione?» The rule is stated in § 2's Limite («vale il codice: si annota la differenza») but never voiced as the reader's doubt. A coding agent hits this first.

## 6. Priority Improvements

### Critical (all applied in this pass)
1. GOP-647 quote moved to the photo ZIP. The standard export's queue rule is attributed to GOP-238 (R1).
2. `json_admin.php` guard order corrected, with the code's reason (R2).
3. The `private`-as-protection claim and the risk-balancing sentence removed. The Sintesi was rewritten (R3).
4. «lotti» for `Batch` removed in all five places (glossary).
5. «due processi» → «tre processi PHP».

### Important (for the next Editor pass)
1. **Cut ≈ 800–1.000 words** to reach ≤ 6.500 (PRD ceiling 6.000). Concrete candidates:
   - § 5 (≈1.700 → ≤ 1.250): merge the two staff boxes; compress the segnalibro numbers paragraph (TTLs, 4/50 limits, three polling rates) into one table or into the procedure; drop «Nel codice ci sono 34 punti…» and `ORE_ANNULLAMENTO` (chapter 4's); shorten the GOP-704 story to cause + fix.
   - § 1 (≈1.260 → ≤ 1.050): the three-steps paragraph carries two verbatim docblock quotes (`bootstrapJobContext`, `TenantBootstrap`). Keep the file names and drop the quotes.
   - § 4 (≈1.300 → ≤ 1.150): turn the key-frequency list into one sentence («le più frequenti sono `model`, `formato`, `colModel`»).
2. **Researcher:** add to the dossier the method that carries the GOP-647 comment (`enqueueFotoExport`) and the `json_admin.php:31-33` comment on guard order. Verify counter-objection 3, cause 2 (what an echoing method actually returns to the browser).
3. **Architect:** NUF 4 and the struttura's § 3 «Risk proportionality guard» assume `private` keeps a helper out of `call()`. That premise is not established. Rewrite NUF 4 as «a new action is a public method named like the action, returning a JSON string, no `echo`», and leave the question to the staff tecnico (security note below).

### Optional
1. Add the docs-vs-code doubt as a voiced objection (see § 5).
2. Line numbers (`index.php:270`, `json.php:283`…) date fast. The chapter already states the research date once. Consider one more line in the Limite of § 2: «i numeri di riga valgono per il commit del 25 novembre 2026».
3. Refresh the trailing Editor `<!-- NUF CHECK -->` note, which still lists «private helpers ✅».

### Security note (for the staff tecnico, not for the chapter)
- [BLOCKED: needs human input — verificare con lo staff tecnico se la visibilità `private` basta a escludere un metodo dallo smistamento di `JSONController::call()`; il capitolo non lo afferma più]

## 7. Rewritten Paragraphs

### R1 — § 1, the history of the click (misattributed quote)

**Original:**
> Prima della coda le cose andavano diversamente, e il commento di GOP-647 nel codice lo racconta senza giri di parole: «Lo ZIP richiede minuti: un POST sincrono lasciava la pagina ferma su "In attesa" e ogni clic ripetuto produceva un altro ZIP da 13 MB.» Quel clic contiene già la mappa del capitolo: …

**Rewritten:**
> Per il modello standard la coda è una regola scritta nel docblock di `enqueueStandardExport()`: «GOP-238: export sempre in coda per il modello standard». Il motivo si legge poche righe sotto, nel commento che GOP-647 ha lasciato sull'esportazione delle foto, quella che produce uno ZIP: «Lo ZIP richiede minuti: un POST sincrono lasciava la pagina ferma su "In attesa" e ogni clic ripetuto produceva un altro ZIP da 13 MB.» Il clic su «Esporta» contiene già la mappa del capitolo: …

**Why:** In `lib/JSONController.php` the quote is the docblock of `enqueueFotoExport()`, not the history of the standard «Esporta». The rewrite keeps the vivid number and attributes it correctly. It also gives the standard path its real source (GOP-238, already in the dossier). A developer who follows the citation now lands on the right method.

### R2 — § 1, the two guards of `json_admin.php`

**Original:**
> `json_admin.php` ha due cancelli, entrambi in cima al file e prima di `config.inc.php`: `AdminRequestGuard::denyUnlessAuthenticated()` risponde 401 … se in sessione non c'è un utente; `denyUnlessCanUseJsonAdmin()` (GOP-294) risponde 403 … Il commento di GOP-275 spiega perché il controllo sta in cima e non nei rami: «…».

**Rewritten:**
> `json_admin.php` ha due cancelli. Il primo, `AdminRequestGuard::denyUnlessAuthenticated()`, sta in cima al file, prima di `config.inc.php`, e risponde 401 con `{"success":false,"message":"User not allowed"}` se in sessione non c'è un utente. Il commento di GOP-275 spiega perché sta in cima e non nei rami: «una catena di elseif di migliaia di righe non si mette in sicurezza un ramo alla volta». Il secondo, `denyUnlessCanUseJsonAdmin()` (GOP-294), viene subito dopo `config.inc.php`, perché per riconoscere l'identità serve il database, e risponde 403 con lo stesso messaggio a chiunque non sia staff tecnico, …

**Why:** `json_admin.php:31-33` puts the second guard after `config.inc.php`, and its comment gives the reason. The order matters to a developer who adds a branch or a door: an identity check needs the database, a presence check doesn't. Splitting the sentence in two also follows Voice rule 1 (one guard, one sentence).

### R3 — § 3, the method contract

**Original:**
> Dal modo in cui `call()` smista viene una conseguenza che il codice non scrive da nessuna parte: ogni metodo chiamabile del controller è un'action raggiungibile per nome. `JSONController` non ha un elenco di action ammesse, e l'inventario di GOP-664 conta «oggi 170 metodi pubblici». Per questo ogni metodo di servizio è `private`. L'esempio sta nello stesso clic d'apertura: … Il contesto ridimensiona il rischio, perché `call()` risponde solo con una commessa aperta in sessione e `json.php` arriva al dispatch dopo l'avvio della sessione. `private` resta un'abitudine di progetto, e va rispettata.

**Rewritten:**
> Il nome dell'action è il nome del metodo: `JSONController` non ha un elenco di action ammesse, e l'inventario di GOP-664 vi conta «oggi 170 metodi pubblici». Lo stesso clic d'apertura mostra come il codice separa l'action dal lavoro che c'è dietro: l'action è `export()`, pubblica e senza argomenti; il pezzo che apre il registro e accoda sta in un metodo a parte, `private function enqueueStandardExport(array $mappatura, array $request)`, che riceve dall'action la mappatura già risolta.

**Why:** The original drew a protective conclusion («Per questo … `private`») that the code shown does not support, then weighed a risk the struttura forbids the chapter to discuss. The rewrite keeps every sourced fact (name = method, no allowlist, 170 public methods, the export/helper split) and drops the inference. «senza argomenti» is visible in the fragment: `call_user_func(array($this, $method))` passes none. It also removes the «dispatch» glossary slip.

### R4 — § 5, the hook

**Original:**
> Un lavoro asincrono senza segnalibro sparisce quando si chiude il modale. L'utente non sa se è finito, lo riavvia, e la commessa si ritrova con due file o due importazioni. Il pattern 47 descrive proprio la situazione di prima: …

**Rewritten:**
> Un lavoro che dura più di una risposta deve restare visibile anche dopo che la pagina che l'ha avviato si è chiusa. Prima della regola del pattern 47 non era così: chiuso il modale o cambiata pagina, «l'utente perde il lavoro di vista e non sa quando finisce». Questa sezione segue quel lavoro da chi lo accoda a chi lo esegue, fino al momento in cui l'utente lo vede finire.

**Why:** «due file o due importazioni» was the Architect's imagined stake, presented as fact. For importazioni it may even be false, since GOP-745 resumes «lo stesso file nella stessa lista». The rewrite states the rule first, then the sourced «before», and loses nothing a developer needs.

### R5 — § 5, `cron.php` and the Giro schedulatore

**Original:**
> La riga di `cron.php` va letta con attenzione. Il file è ancora lì, … e GOP-656, ancora in corso, registra che non è stato corretto per scelta: le decisioni del 3 novembre 2026 dicono «fermi su php8, da non riparare». Lo sostituisce lo schedulatore del Giro. Il pattern 44 lo definisce «…», con semantica «almeno una volta». Oltre a `--ciclo` ha tre modi: nessuna opzione (un giro solo), `--elenco` (i record recenti del registro) e `--avvia=…` per l'avvio manuale, «stessa coda, stessa deduplica». A ogni giro apre una connessione nuova, perché «il processo dura giorni e MySQL chiude le connessioni inattive».

**Rewritten:**
> `cron.php` è ancora nel repository, e il suo commento lo descrive come «Entry point per il cron system»: per ogni commessa attiva lancia `php cron_worker.php --tenant=<codice>` e, alla fine, cancella le anomalie dell'app GOPlanner 3 più vecchie di 12 mesi (GOP-457). Ma su `php8` `cron_worker.php` si ferma con un TypeError su `SimpleOrm::useConnection(MySqlWrapper)`, e non per una svista: le decisioni di GOP-656 del 3 novembre 2026 lo dicono «fermi su php8, da non riparare». Il suo posto lo prende lo schedulatore del Giro, che il pattern 44 definisce così: «Uno schedulatore leggero da riga di comando, ogni 5 minuti, calcola i Job dovuti e li accoda con una chiave di deduplica, senza eseguire nulla». La semantica è «almeno una volta». Per l'avvio manuale c'è `--avvia=<attivita> --tenant=<db> --periodo=<…>`, con «stessa coda, stessa deduplica».

**Why:** It drops the stage direction («va letta con attenzione») and two details no reader action depends on (`--elenco`, the MySQL reconnection), about 35 words saved in the longest section. «e non per una svista» carries the point that «per scelta» buried: the TypeError is a decision, so nobody should send an MR that fixes it.

### R6 — § 4, counter-objection 4

**Original:**
> Forse. Ma il ticket risponde con il motivo tecnico, non con una preferenza: «Il caricatore da solo non basta: in PHP una classe caricata non si scarica né si ridefinisce nello stesso processo.» Nessun autoloader, per quanto scritto bene, può sostituire una classe già caricata. I namespace per commessa sono stati presi in esame e rimandati. Sul costo una cifra non c'è: … Il costo di un processo nuovo per lavoro è stato accettato in cambio di una garanzia.

**Rewritten:**
> Forse, ma un autoloader diverso non risolverebbe nulla, e il ticket lo dice in una riga: «Il caricatore da solo non basta». I namespace per commessa sono stati presi in esame e rimandati. Quanto costi un processo per lavoro non è scritto: GOP-686 chiedeva di misurare memoria e tempo, ma i valori non sono registrati in Jira. Il costo è stato accettato senza una cifra, in cambio di una garanzia.

**Why:** «una classe caricata non si scarica» was already quoted twice in the same section (the `ClassiCustom` docblock, GOP-687). Saying it a third time, then paraphrasing it a fourth («Nessun autoloader, per quanto scritto bene…»), is intensifying, not specifying. The rewrite keeps the ticket's verdict and the honest «senza una cifra».

### R7 — § 6, the closing

**Original:**
> … Un'esportazione scritta come action sincrona lascia la pagina ferma su «In attesa»; la stessa esportazione scritta come lavoro in coda risponde subito e si fa trovare nel segnalibro. Il codice dentro può essere identico: a cambiare il risultato è la porta.

**Rewritten:**
> … L'esportazione delle foto è passata da due porte: come action sincrona lasciava la pagina ferma su «In attesa» e produceva uno ZIP in più a ogni clic; come lavoro in coda risponde subito con un id che la pagina può seguire.

**Why:** «Il codice dentro può essere identico» has no source. «a cambiare il risultato è la porta» is the same intensifier the Editor's own note says it removed. The new ending lands on a sourced, physical case (GOP-647: «un altro ZIP da 13 MB», «risponde subito … {queued, id, record_attesi}»). It closes the loop opened in § 1 and echoes no earlier chapter. The design rule stays in the two sentences before it, unchanged.

### Also rewritten (short)
- § 1: «cinque file e due processi» → «cinque file e tre processi PHP».
- § 1 table, utility row: «come la porta di cui sono un pezzo | includono `config.inc.php` e un controller dedicato» → «dipende dal file | quelli nominati includono `config.inc.php`; alcuni hanno un controller proprio (terza sezione)».
- § 2: «tre strati» → «tre classi»; objection opener without «più frequente»; Limite without «Tre limiti vanno tenuti presenti».
- § 3: «Va detto con equilibrio» paragraph; «dispatch» → «smistamento»; Sintesi.
- § 4: Limite without «I limiti della sezione sono tre».
- § 5: objection opener without «più spesso»; Limite opener and ending; process-table row and staff box («lotti» → `Batch`).
- § 6: websocket opener; limit paragraph without «va detto senza drammi»; two more «lotti» → `Batch`; Sintesi.
- Fonti: eight Jira keys added.

## 8. Verdict

**REVIEWER_CORRECTIONS.** This is a strong, original architecture chapter whose verifiability promise was broken in four places: a misattributed quote, a wrong guard order, a process miscount, and an unsupported claim about `private`. All four are now fixed, along with a glossary collision on «lotto». The remaining debt is length (≈ 7.300 words, § 5 ≈ 1.700), for the next Editor pass.
