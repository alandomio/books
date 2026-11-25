# Review: Capitolo 16. Operazioni, qualità e rilasci

Reviewer run: 25 novembre 2026. Read fresh: `PRD.md`, `STYLE_BIBLE.md`, `chapter_16_struttura.md` (NUFs, beat list, readiness notes, TARGET), `chapter_16.md`, `dossier_chapter_16.md` ([PUBLIC], [SHADOW], [CONFLICT] 1–23). I also checked the promises other chapters make to chapter 16 (ch.2:68 and :237, ch.8:201 and :256, ch.12:172 and :212, ch.13:269, ch.14:293, ch.15:111 and :235), the closings of ch.12–15, and `oracle_questions.md` (the six chapter-16 questions are still unanswered). Three claims were checked in the GOPlanner repository on `php8`, read only: the first line of `.gitlab-ci.yml`, the changesets of GOP-777 and GOP-810 (production is split by commessa as well as by function), and the file names of cookbooks 11, 15 and 19.

## 1. Executive Summary

This chapter earns its place as the last one. The Architect built it on GOP-270 as tag/digest drift. The Researcher found that Jira contradicts that cause: GOP-270 was closed as a duplicate of GOP-195, and the real cause was the worker discarding mobile log jobs. The Writer turned the contradiction into the lesson itself. The first diagnosis was plausible and wrong, and the line in § 6 «Il guasto stava prima della scrittura, dove il registro dei fallimenti di scrittura non guarda» is the best insight in Part IV. Procedures, refusals, exit codes and thresholds all trace to the dossier. What held it back:

- **A cross-chapter gap.** Ch.15 says production is «mista, con commesse spostate una alla volta sull'immagine `php8`, e il capitolo 16 segue il rilascio». Ch.16 described the split only by function. The changesets on `php8` confirm the split by commessa.
- **Two invented counts** («in tre parole» quoting five words, «in quattro parole» quoting five), a self-contradiction («mai per il contenuto» in a chapter that quotes Jira comments), «canale mobile» meaning both a moving tag and the mobile log channel, two pacing violations, a closing that repeated the «Prima di scrivere…» formula of ch.13–15, and gaps in Fonti.
- **Length.** The body is about 8,200 words (wc, tables included) against the PRD's 4,000–6,000. Inline fixes cannot solve this; see § 6.

19 inline corrections applied, 7 of them paragraph rewrites. Verdict: **REVIEWER_PASS_MINOR**.

## 2. Score: 49/60 → REVIEWER_PASS_MINOR

| Dimension | Score | One-line reason |
|---|---|---|
| Narrative & Structure | 8/10 | The spine works: § 1 states the symptom, § 5 the drift as a real but different risk, § 6 the true cause and why only the sibling comparison would have caught it. The thesis table maps every stage to a proof. Weak spots: the original opening announced that the story «insegna due volte» without saying what the two lessons were. § 3 (7 prose paragraphs) and § 6 (6) broke the pacing rule. § 5 reads as a catalogue in places. |
| Language, Style & Voice | 7/10 | Mostly on-persona: short rule sentences («È una cartella mancante.», «Si alza, si legge, si riabbassa.»), exact names, impersonal procedures, no banned patterns. Drift: two invented word counts. «il canale mobile» and «tag mobile» used for a *moving* tag in the chapter whose spine is the *mobile* channel. «al momento del deploy» breaks glossary trap 9. «una copia fatta da una copia di lavoro». «toccate singolarmente solo in una o due» is garbled. |
| Factual Accuracy | 8/10 | Very high density of checkable facts, nearly all traceable, and the 23 dossier conflicts are resolved honestly (code wins; «previsto» where Jira is «In corso»; `latest` line stated as unknown). Errors: the production split by commessa was missing. The «MR unita su php8, rilascio in corso» quote was a paraphrase in guillemets. «Lo hanno deciso … il documento 46 dei pattern e GOP-711». «il controllo che oggi la segnalerebbe» overclaims when the cron is only «prevista». The crash-report sentence credited the 23→2 KB reduction to trace truncation alone. |
| Audience Alignment | 9/10 | Every litmus-test task is covered: telling whether a Jira ticket is ready, starting an isolated stack, choosing the lightest test, writing a valid changeset, knowing what CI proves, publish + re-pin + digest check, dry-run then release of the API folder, a migration on one commessa, an app update with the signer named, from an 8-character code to the full error, the four alarms. The office reader is routed to § 4's box. The cost is length: a reference chapter of 8,200 words. |
| Sensory & Emotional Engagement | 8/10 | Real stakes, told without blame: 28 of 29 commesse silent for ten months, GOP-317 breaking the call-center schedules, the empty HTTP 200 page with «There is no error in any log», migration 0032 locking out every new user, the PNG opened as JPEG. Catalogue stretches remain: the ten release_api safeguards, the pipeline table, the § 5 Limite paragraph. |
| Originality & Angle | 9/10 | «Ogni tappa lascia una prova» could have been a slogan. It is earned because the book's own spine story contains a wrong diagnosis, and the chapter shows that the write-failure alarm (`LogChannelHealth`) would *not* have seen the fault and the web/mobile comparison would have. |
| **Total** | **49/60** | |

## 3. Detailed Findings by section

### «In questo capitolo»
- Correct format: three italic sentences, names the audience and routes the office reader to § 4. No change.

### § 1 — Il percorso di una modifica, e le prove che lascia
- **Opening overloaded with signposting, and an overclaim.** «Il meccanismo del rilascio è nella sezione 5; la causa vera, e il controllo che oggi la segnalerebbe, nella sezione 6. Qui serve la regola che la storia insegna due volte». The two lessons were never named. «che oggi la segnalerebbe» contradicts § 6's Limite («anche le righe crontab dei due script sono indicate come previste»). → Rewritten (R1). The two lessons are now named: the system was silent, and the investigators trusted a plausible explanation. The confirming proof is stated: the registers arriving again after the fix.
- **Missing: production split by commessa.** «In produzione il servizio della linea `php8` serve il back office nuovo, mentre i servizi storici … servono ancora il traffico dell'app 1.x.» Ch.15:111 promises that ch.16 «segue il rilascio» of commesse moved one at a time to `php8`. The changesets on `php8` confirm it: GOP-777's «Tecnica» says some commesse «sono ancora sulla linea master: la modifica è visibile agli utenti solo con il passaggio a php8»; GOP-807/809/810 are per-commessa moves «a php8 + app 3». → Two sentences added (R2), citing keys only, with no committente names. This is a **Researcher gap**: the ch.16 dossier did not record it.
- **Invented count.** «l'intestazione di `.gitlab-ci.yml` lo dice in tre parole, «CI di GOPlannerWeb: solo test»». That is five words. → «la prima riga di `.gitlab-ci.yml` lo dice» (verified: it is line 1).
- Map table, four routes, counter-objection 1, Limite, Sintesi and DEV box all match the beat list. The DEV box's note that ECS and GitHub Actions are not in use (`.github/workflows/` absent) is a good catch from [CONFLICT] 3.

### § 2 — Jira come registro dei task
- GOP-103 as the surgical example is exact (GOP-120/GOP-110, GOP-117/GOP-112). The contract table, states, `CP-` and «Bloccato» with «0 ticket» at the research date are all sourced.
- **Paraphrase inside guillemets.** «prima «MR unita su php8, rilascio in corso», poi «in produzione dal 18/11. Chiuso.»». The dossier's text is «MR … unita su php8 … Rilascio in corso su dev e produzione». → The first part is now in plain prose. Only the verbatim closing quote stays in guillemets.
- **Self-contradiction.** «In questo libro i ticket Jira si citano per chiave e titolo breve, mai per il contenuto.» The same chapter quotes GOP-195's comment («la diagnosi del rilascio vecchio era errata») and GOP-827's closing. → Rewritten (R4) to state the real rule: key, a rewritten short title, and only quotes without names.
- Good honest Limite: «GOP-828 è passato a «Completata» il 20 novembre 2026 senza nessun commento». It shows that the rule is not always followed, without blame.

### § 3 — L'ambiente locale
- The rule comes first («Lo stack locale non ha un database suo»), the six steps are numbered, and GOP-205 is told as a mechanism. All correct.
- **Pacing violation.** After the PHP table there were seven consecutive prose paragraphs (lines 138–150). → The validated/not-validated paragraph became a two-item list. This also fixes a garbled sentence: «Restano fuori PDF ed Excel sulle altre commesse, circa cinquanta, toccate singolarmente solo in una o due» now reads «circa cinquanta (le prove ne hanno toccate una o due)».
- **Ambiguous term.** «non sovrascrivere mai il tag mobile di produzione come primo passo». The source says «Non sovrascrivere mai `:latest` come primo passo». → «non sovrascrivere mai `latest` come primo passo».
- The Limite paragraph honestly says that the `latest` line is unknown («Quale linea costruisca oggi il tag `latest` non risulta dalle fonti lette»). It matches [CONFLICT] 2 and oracle question 2.

### § 4 — I test, la pipeline e il changeset
- The ladder, the 450 test files with their date, GOP-698, the `--tenant` guard (without printing the identifier), «dieci job» against a table that does contain ten, and «Nessun job esegue la suite PHPUnit generale» are all exact.
- **Stray note.** «Una nota pratica da GOP-270: … `.phpunit.cache` …». It drags the spine ticket into an unrelated tip and gives no action. → Rewritten as a symptom → cause → action, with GOP-270 kept as the source.
- **Agency error.** «Lo hanno deciso il 5 novembre 2026 il documento 46 dei pattern e GOP-711». A document does not decide, and GOP-711 closed on 8 novembre. → «La decisione è del 5 novembre 2026, registrata nel documento 46 dei pattern e realizzata con GOP-711».
- **Glossary.** «sezione per il cliente vuota» → «sezione «Per il cliente» vuota o mancante» (the label quoted, as glossary trap 7 requires, and «mancante» from the source).
- **Ambiguous pointer.** The DEV box says «cookbook 15», but there are three cookbooks numbered 15 on `php8`. → `15-guida-test-ui.md` (verified as the browser one; cookbook 18 links to it).

### § 5 — Rilasciare: pubblicare, ri-agganciare, migrare
- The honest handling of GOP-270 is the high point: «Quella deriva è stata letta come la causa … e il commento in testa al `Makefile` lo dice ancora. Jira dice altro». The drift stays as a real risk, without the false causality.
- **Terminology collision.** «pubblica due tag: il canale mobile e lo SHA del commit». In this chapter «canale mobile» is the name of the mobile log channel (§ 6 heading «Il canale mobile»). → Rewritten (R3): «il tag del canale, che si sposta a ogni pubblicazione, e lo SHA del commit, che non si sposta più».
- **Glossary trap 9.** «al momento del deploy» → «nel momento in cui viene eseguito».
- **Invented count and clumsy echo** in the GOP-317 paragraph: «lo dice in quattro parole, «la cartella è il rilascio»» (five words); «una copia fatta da una copia di lavoro». → Rewritten (R6). The missing proof (no commit traceable) is now explicit and tied to the thesis.
- **Function presented as active.** The app-update subsection read as a procedure in force, and GOP-407 «In corso» appeared only in the Limite at the end of the section. → The status clause moved to the first sentence of the subsection.
- Migrations: rules, the two series, the executor, the Attenzione box and the 0032/0033 fix-forward case are exact. The office-facing sentence matches ch.12:212 (yellow = «migrazioni: capitolo 16»).

### § 6 — Registri, allarmi e silenzi
- Groups table (including the heartbeat group resolved from code, [CONFLICT] 9), the error-code procedure that separates «ticket della sezione Ticket» from «ticket Jira», the alarms table with every threshold: all exact.
- **Misattributed number.** «taglia la traccia a 4096 caratteri: da circa 23 KB a circa 2 KB per evento». The reduction comes from the whole filter (LOGCAT is 88% of the size), not the truncation. → «…a 4096 caratteri; in tutto un evento passa da circa 23 KB a circa 2 KB.»
- **Pacing violation.** There were six prose paragraphs after the alarms table. → New subheading «### Il silenzio dei dieci mesi» before the payoff paragraph. It also makes the spine story's resolution findable.
- **Closing.** (a) «La stessa regola vale per chi chiude un rilascio» claimed that two different rules were the same (compare with a sibling / read proofs). (b) «Prima di scrivere «in produzione»…» repeated the «Prima di …, si …» formula that closes ch.13 («Prima di scrivere la prima riga…»), ch.14 («Prima di toccare una riga…») and ch.15 («Prima di scrivere o di correggere…»). → Rewritten (R7): the shared principle is named («l'assenza di errori non è una prova»), and the rule is phrased as *after* the act («si scrive dopo aver letto…»). That is the struttura's intended contrast with ch.12's «before confirming».

### Fonti
- Missing items now added: GOP-274 (cited in § 5), `docs/02-patterns/45-schema-canonico-tenant.md` (in the § 5 DEV box), cookbooks 11, 15 and 19 (cited in § 3/§ 4), and the new sources of R2 (`changeset/` of GOP-777 and GOP-810; Jira GOP-777, GOP-810, all with neutral titles).
- No URLs, hosts or names. Portolano slugs that contain host fragments were correctly omitted by the Writer.

### Security check
- No account, region, URI, digest, hostname, IP, Swarm service name, SSH line, key path, secret-variable name, debug identifier, person or committente name. `scripts/ssm-tunnel.sh` appears by name only, as the struttura allows. «IN-70» is a bare key. Code blocks contain only `make` targets and repository scripts with placeholders. **Pass.**

## 4. Persona Audit

The chapter sounds like The Engineer + The Scholar Who Can Write. The Petzold side explains the machine from below: `docker stack deploy` resolving a tag to a digest once, Compose taking the project name from the folder's basename, the checksum that makes an applied migration unchangeable. The Kidder side shows the real work behind the system: the wrong diagnosis kept in view rather than hidden, the copy that erased GOP-274, the 06:23 cron chosen because twelve commesse stopped between 05:44 and 08:15. Short rule sentences follow long explanations as Voice rule 1 asks («Sembra un difetto del codice. È una cartella mancante.»). There is no «noi», no «io», no marketing adjective and no banned pattern.

Where it drifted:
- **«I do not intensify — I specify» broken twice by invented numbers.** «in tre parole» and «in quattro parole» are flourishes, and both counts were wrong. In a chapter whose thesis is «read the proof», a miscounted quote is the worst kind of slip. Fixed.
- **One term, two meanings.** «mobile» as «moving» (tag) and as «mobile» (app channel). The persona's first instinct is «il nome esatto di ogni cosa». Fixed.
- **Ending formula echo.** Activation phrase 2, «My ending cannot echo any previous chapter». Part IV had settled into a «Prima di X, si Y» template; ch.16 was the fourth in a row. Fixed.
- **Catalogue mode** in § 5 (ten safeguards, four exit codes, a Limite paragraph of seven items). This is reference-appropriate but long; see § 6 Important.

## 5. Counter-Objection Check

Five are present, all in the reader's voice, all answered from sources (the STYLE_BIBLE requires ≥ 2):

1. § 1 «La pipeline è verde e la merge request è unita: la modifica è in produzione?» Strong form. The answer cites the first line of `.gitlab-ci.yml` and the decision of 14 ottobre 2026, and names the real proof (the image the service runs).
2. § 2 «Il piano in `tasks/` dice un ordine diverso da quello di Jira: chi ha ragione?» Strong, and grounded in the GOP-103 drift already told. The answer is from ADR 26 (`todo.md` regenerated, edits lost; dependencies as links).
3. § 3 «Ho cancellato dati di prova dal mio stack locale: ho toccato la produzione?» Proportionate: one shared cluster, separate databases per commessa, scripts that default to a preview. A stronger form would be «ho lanciato uno script che scrive», but the answer covers it.
4. § 4 «La pipeline è verde: i test sono passati?» The answer is evidence-based: the exact job list, and no job runs the general PHPUnit suite. It overlaps a little with #1 (both start from «verde») but asks a different question (testing vs release).
5. § 6 «Il gruppo mobile di una commessa è vuoto da una settimana: è un guasto?» The best of the five, because the chapter has just shown why a silent group alone proves nothing and what two readings are needed.

Unasked but answered in the text: «If the `Makefile`'s diagnosis was wrong, why trust the `Makefile`?» § 5 separates what the code *does* (two targets, a refusal without a terminal) from what a comment *claims* (the cause).

## 6. Priority Improvements

### Critical
- None remaining. The cross-chapter gap with ch.15 (production split by commessa), the self-contradiction on Jira content and the overclaim on the silence check were the candidates. All are fixed.

### Important (not fixable inline: for the Editor or the captain)
1. **Length.** The body is about 8,200 words (wc, tables and code included) against the PRD's 4,000–6,000 and the TARGET of 5,600–5,900. Chapters 13–15 also ran at 7,100–7,300. Possible cuts that keep every procedure and every Limite, about 900–1,100 words:
   - § 5, the `release-api-dev.sh` safeguards list: keep the five that carry the thesis (sha on `origin/php8`, lock, `php -l` first, manifest, drift refused) and send the rest to the DEV box, about 200 words.
   - § 5, the paragraph on worker restarts after `release_api`: move it to the DEV box, about 90 words.
   - § 3, the audit tools and legacy libraries paragraph: move it to the DEV box, about 120 words.
   - § 2, the commit-key statistics paragraph («95 su 300»): one sentence, about 50 words.
   - § 6, the crash-report and job-failure details: about 120 words.
   - § 4, the pipeline table: merge `tokens_check` / `vendor_fa_check` / `industry2_check` / `job_segnalibri_test` into one «coerenza dei file generati e dei token» row, about 60 words.
   - § 5, the app-update channels paragraph: about 60 words.

   Below roughly 7,000 words the cuts would remove substance. A decision is needed: accept about 7,000 words for Part IV, or treat the PRD cap as hard.
2. **Oracle questions 1–3 are still open** (`oracle_questions.md`, chapter 16).
   - If the captain confirms GOP-195 as the cause and the `Makefile` comment gets corrected, update the § 5 sentence «il commento in testa al `Makefile` lo dice ancora».
   - If the `latest` line becomes known, replace the § 3 Limite sentence «Quale linea costruisca oggi il tag `latest` non risulta dalle fonti lette».
   - If the alarms and cron are confirmed installed, change «previsti» in § 6 and the § 1 phrase «il controllo che avrebbe visto il silenzio».
3. **Researcher gap for future runs.** The dossier missed the per-commessa production split, although the ch.15 dossier had it ([CONFLICT] 3 there). When chapters run in parallel, the Researcher should grep the sibling dossiers for claims that concern the same subject.

### Optional
- The HTML comments at the end of the file (`<!-- WORD COUNT … -->`, etc.) are raw HTML under PRD § 6. They are a pipeline convention in every chapter. Strip them in `publish.sh` or before the part-2 HTML import, not by hand.
- The § 6 opening sentence «Questa sezione dice dove GOPlanner scrive…» is signposting; it could be cut if the length cut goes ahead.
- «il heartbeat» vs «l'heartbeat»: decide once for the book (ch.8, 12, 15, 16) and align.

## 7. Rewritten Paragraphs

### R1 — § 1, opening (applied)
**Original:**
> Fra il 16 e il 31 ottobre 2025 il canale dei registri mobili si è spento per quasi tutte le commesse. Il 9 settembre 2026, quando qualcuno ha contato, risultavano ferme 28 commesse su 29 fra quelle con il canale web attivo negli ultimi 30 giorni. Per dieci mesi nessuno se n'era accorto. La diagnosi è arrivata in due tempi, e il secondo ha smentito il primo: la prima lettura dava la colpa a servizi rimasti su un'immagine vecchia, la causa confermata il 29 settembre 2026 stava altrove. Il meccanismo del rilascio è nella sezione 5; la causa vera, e il controllo che oggi la segnalerebbe, nella sezione 6. Qui serve la regola che la storia insegna due volte: una tappa è finita quando la sua prova lo dice, non quando il comando è terminato senza errori.

**Rewritten:**
> Fra il 16 e il 31 ottobre 2025 il canale dei registri mobili si è spento per quasi tutte le commesse. Il 9 settembre 2026, quando qualcuno ha contato, risultavano ferme 28 commesse su 29 fra quelle con il canale web attivo negli ultimi 30 giorni. Per dieci mesi nessuno se n'era accorto. Poi la prima diagnosi, plausibile e sbagliata, ha dato la colpa a servizi rimasti su un'immagine vecchia; la causa vera è stata confermata solo il 29 settembre 2026, quando dopo la correzione i registri sono tornati ad arrivare. La storia insegna la stessa regola due volte, prima sul sistema e poi su chi lo indagava: una tappa è finita quando la sua prova lo dice, non quando il comando è terminato senza errori o la spiegazione suona giusta. Il rischio dell'immagine vecchia è nella sezione 5; la causa, e il controllo che avrebbe visto il silenzio il giorno dopo, nella sezione 6.

**Why:** The original said the story teaches «due volte» but never said what the two lessons were. The rewrite names them: the system was silent, and the investigators accepted a plausible explanation. It also shows the proof that settled the cause (the registers arriving again after the fix), so the hook demonstrates the thesis instead of announcing it. «il controllo che oggi la segnalerebbe» overclaimed, because § 6 says the cron is only «prevista». The signposting moves to the last sentence, where it orients without blocking the hook.

### R2 — § 1, «Due linee, quattro vie» (applied)
**Original:**
> […] In produzione il servizio della linea `php8` serve il back office nuovo, mentre i servizi storici, che seguono il tag `latest`, servono ancora il traffico dell'app 1.x.

**Rewritten:**
> […] In produzione il servizio della linea `php8` serve il back office nuovo, mentre i servizi storici, che seguono il tag `latest`, servono ancora il traffico dell'app 1.x. Al 25 novembre 2026 la divisione passa anche per le commesse: alcune sono ancora servite dalla linea `master`, altre passano a `php8` una alla volta, insieme a GOPlanner 3, ciascuna con un suo ticket Jira (per esempio GOP-810). Per questo la parte tecnica di un changeset può avvertire che la modifica diventerà visibile in una commessa solo con il suo passaggio a `php8` (GOP-777).

**Why:** Ch.15:111 tells the reader that production is mixed per commessa and that «il capitolo 16 segue il rilascio». Ch.16 described only the split by function, so a developer would believe that a merge on `php8` reaches every commessa's office. The changesets on `php8` say otherwise. The addition keeps the cross-chapter promise, gives a verifiable pointer by key only (no committente names), and links to the changeset mechanism of § 4.

### R3 — § 5, `make publish_app` bullet (applied)
**Original:**
> `make publish_app` costruisce da `Dockerfile` per due architetture, `linux/amd64` e `linux/arm64`, e pubblica due tag: il canale mobile e lo SHA del commit. Il canale è `php8` per default, […]

**Rewritten:**
> `make publish_app` costruisce da `Dockerfile` per due architetture, `linux/amd64` e `linux/arm64`, e pubblica due tag: il tag del canale, che si sposta a ogni pubblicazione, e lo SHA del commit, che non si sposta più. Il canale è `php8` per default, […]

**Why:** «canale mobile» is a literal translation of «moving channel». In this chapter «canale mobile» is the name of the mobile log channel: the § 6 heading is «Il canale mobile», and the spine story is about it. A reader who meets the phrase in § 5 will think that `publish_app` has something to do with phones. The rewrite also states the contrast the bullet exists for: one tag moves, the other never does. The same fix was applied in § 3 («tag mobile di produzione» → `latest`).

### R4 — § 2, Limite (applied)
**Original:**
> […] Jira poi sta fuori da GOPlanner: l'ufficio non lo vede, vede la sezione Ticket. In questo libro i ticket Jira si citano per chiave e titolo breve, mai per il contenuto.

**Rewritten:**
> […] Jira poi sta fuori da GOPlanner: l'ufficio non lo vede, vede la sezione Ticket. In questo libro i ticket Jira si citano per chiave, con un titolo breve riscritto, e del loro testo si riportano solo frasi senza nomi di persone o di committenti: i titoli originali a volte li contengono.

**Why:** «mai per il contenuto» is false inside this same chapter. § 5 quotes GOP-195's comment («la diagnosi del rilascio vecchio era errata») and § 2 quotes GOP-827's closing comment. A skeptical developer would catch it at once. The rewrite states the rule the book actually follows and gives its reason (names in titles), which is the struttura's own reason.

### R5 — § 3, what was validated on PHP 8.4 (applied)
**Original:**
> Il cookbook 22 elenca che cosa è stato provato sul runtime 8.4: il login web e 16 pagine principali; il ciclo mobile completo, dall'autorizzazione al caricamento delle foto; scritture reali con l'ORM; il worker Redis con un lavoro vero; un PDF reale; un'importazione Excel `.xlsx` e un'esportazione `.xls`. Restano fuori PDF ed Excel sulle altre commesse, circa cinquanta, toccate singolarmente solo in una o due; le firme reali sui rapportini PDF; `ws_server/` e il worker sotto carico vero.

**Rewritten:**
> Il cookbook 22 separa ciò che sul runtime 8.4 è stato provato da ciò che non lo è stato.
>
> - Provato: il login web e 16 pagine principali; il ciclo mobile completo, dall'autorizzazione al caricamento delle foto; scritture reali con l'ORM; il worker Redis con un lavoro vero; un PDF reale; un'importazione Excel `.xlsx` e un'esportazione `.xls`.
> - Non provato: PDF ed Excel sulle altre commesse, circa cinquanta (le prove ne hanno toccate una o due); le firme reali sui rapportini PDF; `ws_server/` e il worker sotto carico vero.

**Why:** «circa cinquanta, toccate singolarmente solo in una o due» says the opposite of the source: one or two commesse were touched, the other ~50 were not. The list form also breaks a run of seven prose paragraphs (STYLE_BIBLE § Pacing: at most five). The validated/not-validated contrast is the information an 8.4 rollout decision needs, and a list shows it at a glance.

### R6 — § 5, GOP-317 (applied)
**Original:**
> Il server che serve l'API del call center e il sito di sviluppo non ha un'immagine sua: il cookbook 27 lo dice in quattro parole, «la cartella è il rilascio». Fino a GOP-317 la si aggiornava copiando file a mano. Il 16 settembre 2026 una copia fatta da una copia di lavoro ha cancellato una correzione già rilasciata, GOP-274, e ha rotto in produzione gli orari del servizio vocale del call center. Una copia così non lascia traccia di che cosa è stato messo. In più una copia completa portava file diversi da quelli del server, fra cui un file di configurazione con chiavi scadute.

**Rewritten:**
> Il server che serve l'API del call center e il sito di sviluppo non ha un'immagine sua: il cookbook 27 lo dice in una frase, «la cartella è il rilascio». Fino a GOP-317 la cartella si aggiornava copiandoci sopra file a mano, a volte un'intera copia di lavoro. Il 16 settembre 2026 una di queste copie ha cancellato una correzione già rilasciata, GOP-274, e ha rotto in produzione gli orari del servizio vocale del call center. Dopo, nessuno poteva dire da quale commit venisse ciò che stava nella cartella: una copia a mano non lascia traccia. E una copia completa portava con sé anche file che sul server dovevano restare diversi, fra cui un file di configurazione con chiavi scadute.

**Why:** «la cartella è il rilascio» has five words, not four; the persona never invents a number. «una copia fatta da una copia di lavoro» stumbles on its own echo. The rewrite says *which* proof was missing: no commit could be named for what was in the folder. That makes the paragraph a direct case of the chapter's thesis and sets up `.rilascio/COMMIT` and the manifest a few lines below.

### R7 — § 6, chapter closing (applied)
**Original:**
> Il controllo del silenzio esiste da settembre 2026 perché un canale si giudica accanto a un fratello che parla: con il gruppo web della stessa commessa che scriveva ogni giorno, quel silenzio sarebbe diventato un'anomalia il giorno dopo, non dieci mesi dopo. La stessa regola vale per chi chiude un rilascio. Prima di scrivere «in produzione» in un commento Jira si leggono le prove: il tag con lo SHA del commit, l'impronta dell'immagine che il servizio esegue, la riga in `schema_migrations`, un canale che continua a scrivere. Il messaggio di successo del comando appena lanciato non è una di queste.

**Rewritten:**
> Il controllo del silenzio esiste da settembre 2026 perché un canale si giudica accanto a un fratello che parla: con il gruppo web della stessa commessa che scriveva ogni giorno, quel silenzio sarebbe diventato un'anomalia il giorno dopo, non dieci mesi dopo. Il principio è lo stesso per chi chiude un rilascio: l'assenza di errori non è una prova, una prova è qualcosa che si legge. «In produzione», in un commento Jira, si scrive dopo aver letto il tag con lo SHA del commit, l'impronta dell'immagine che il servizio esegue, la riga in `schema_migrations` e un canale che continua a scrivere. Il messaggio di successo del comando appena lanciato non è fra queste prove.

**Why:** «La stessa regola» claimed that two different rules were one: «compare a channel with its sibling» and «read the proofs, not the success message». The rewrite names what they really share, that the absence of errors is not evidence, so the close follows from the story. «Prima di scrivere…» was the fourth Part IV closing in a row built on «Prima di …, si …» (ch.13, ch.14, ch.15). Phrasing the rule as «si scrive dopo aver letto» breaks the echo and states the struttura's intended contrast with ch.12: proof *after* the act, not numbers before it.

## 8. Verdict

**REVIEWER_PASS_MINOR (49/60).** The chapter proves its thesis with its own spine story, wrong first diagnosis included. The fixes were local: a cross-chapter gap, two invented counts, an ambiguous term, a self-contradiction, two pacing breaks, a closing echo and gaps in Fonti. 19 corrections were applied to `chapter_16.md`. Length (about 8,200 words) is the open item for the Editor or the captain.
