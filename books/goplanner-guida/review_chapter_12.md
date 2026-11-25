# Review — Capitolo 12. Strumenti di amministrazione e diagnostica

Reviewer run: 25 novembre 2026. Read fresh: `PRD.md`, `STYLE_BIBLE.md`, `chapter_12_struttura.md` (NUFs, beat list, readiness notes, TARGET), `chapter_12.md`, `dossier_chapter_12.md` (facts and every [CONFLICT] row). For continuity and endings: the last paragraph of `chapter_1.md` and `chapter_11.md`, `chapter_11.md` (the «Accessi» box, § 5 menu paragraph), pointers into ch.12 from `chapter_5.md:30`, `chapter_7.md:264`, `chapter_8.md:195,201`, `chapter_10.md:193,245`. Spot-checks on GOPlanner `php8` (read only): `js/code/admin_errori.js:15`, `js/code/admin_diagnostica.js` (`statoVuoto`), `lib/AdminDiagnostica.php:175`, `js/code/admin_manutenzione.js:17-68`, `lib/MenuAdmin.php`.

## 1. Executive Summary

This is the most operational chapter so far. Its thesis, «una staffetta in tre tratti», holds from § 1 to the ending. Each tool belongs to one leg, and the § 4 evidence table turns the thesis into what to write in a ticket. Almost every claim traces to the dossier, and the Writer resolved every [CONFLICT] by following the code: Consolida has no cap, the per-carico cost is gone, «Svuota cache» does not touch the Giro, «Nessuno (problema generale)», «Apri ticket» vs «Apri il ticket», «letto per utente», 50 ticket per persona by any route.

The chapter passes with local repairs:
- **Three factual slips.** The empty-page message of Errori app was tied to the wrong code path. «Nessuna modifica eseguita.» was given as the «niente da fare» message. «non si possono dare a un amministratore» overclaims, and it named the `users.admin` flag differently from chapter 11.
- **A hook that was never paid off.** The Monday-morning case was dropped after its first paragraph, and the original ending repeated § 4's sintesi word for word.
- **Repetition and meta.** «Verificato» was explained three times in § 3. «Read-only» was said three times in § 5. «Di «Mappa» le fonti danno solo il nome» and the wiki-provenance Limite (said twice) are process notes, not guidance.

17 passages corrected inline. The body is still about 6% over the PRD's «circa 6.000» (see Important).

## 2. Score: 49/60 → REVIEWER_PASS_MINOR

| Dimension | Score | One-line reason |
|---|---|---|
| Narrative & Structure | 8/10 | Clear thesis, six sections each tied to a leg, a strong § 3 stake («Verificato» pressed too early). Against it: the opening case vanished after paragraph 1, § 3 explained the same stake three times, and the original closing echoed § 4's sintesi instead of landing the chapter. |
| Language, Style & Voice | 8/10 | On persona almost throughout: verbatim labels, short rule sentences after long explanations, no «noi», glossary traps handled («Clienti», «Tenant», «Log», «super-admin globale» only inside quotes). Drift: researcher meta in two Limiti, label catalogues in prose (§ 4 list filters, § 5 permessi paragraph of 190 words), one grammar slip («Quel «svuotato»»). |
| Factual Accuracy | 8/10 | About 200 checkable claims; all but four trace. Errors: Errori app empty-state message, «Nessuna modifica eseguita.» attribution, «non si possono dare a un amministratore», and «costò mezza giornata» reused from ch.1 (the struttura forbids ch.1's numbers). |
| Audience Alignment | 9/10 | The ADMIN reader gets exactly what PRD § 5 promises: copy the code, ask Gea, the office order before «perso», how to open/follow/reopen a ticket, the evidence table, and where to stop. Staff get the four read-only pages and the three write tools with their confirmations. Minus one: no word on what to do where the page says «I ticket non sono ancora disponibili.» |
| Concreteness (replaces Sensory) | 8/10 | Dense with exact detail: 8 hex characters, 30 minuti / one day / 22 novembre 2026, 48 ore, 4.000 caratteri, 5 × 10 MB, nine states, 06:30, 2 giorni lavorativi, 60 minuti, 5/30/120 minutes of Giro retries. Four real cases: GOP-249 before/after, the PNG-as-JPEG export, tickets tied to the identity, and the GOP-842 date. The GOP-249 «before» was told in the abstract («una frase in inglese»); now it is shown verbatim. |
| Originality & Angle | 8/10 | «Il codice non spiega l'errore: lo rende trovabile», «un registro muto non è un telefono muto», the reason the Giro sorts failures first, and «un annuncio che non si può chiudere per sempre non si mostra» are knowledge nobody had written down. The relay frame is new in the book and does not repeat ch.1's «dove guardare». |
| **Total** | **49/60** | |

## 3. Detailed Findings by section

### «In questo capitolo» and § 1 — Chi ha quali strumenti

- Strong: the map table is complete against `lib/MenuAdmin.php`, including «Svuota cache Redis» (menu) vs «Svuota cache» (button) per [CONFLICT] 2. «Report» is described without naming the commessa. The two server guards are quoted verbatim, with their 403.
- **Tautology in the map table.** The Gea row read «dove è attiva (capitolo 10) | chi ha Gea». Fixed with the position chapters 1 and 10 use («pannello in basso a sinistra») and «gli utenti di quelle commesse».
- **Meta leak.** «Di «Mappa» le fonti danno solo il nome.» The reader is not the researcher. Removed. Replaced with the fact the reader needs: «Console JSON» is the one Diagnostica voce that can write on the data. That matters because § 5 says its four pages write nothing.
- **Cross-chapter naming drift + overclaim.** The text said: «I quattro gruppi tecnici dipendono da un contrassegno sull'accesso dello staff tecnico … nessun permesso li concede», and the counter-objection added «non si possono dare a un amministratore». Chapter 11 names the same `users.admin` flag «il contrassegno di amministratore» and says it opens the «Accessi» button. Two names for one flag leave the reader unable to connect the chapters. On the code, an access that carries the flag *does* see the technical groups. What is true is that no profilo grants it and no invito sets it (`users.admin = 0` on every creation path, dossier ch.11). Rewritten (R3).
- **Limite as process.** «Le guide della wiki … dicono di sé «Guida scritta dal codice, non provata nel browser»: questo capitolo usa solo le etichette…» is the research method, not a limit of the product. Rewritten as reader guidance: if the screen differs, the screen wins, and the difference is reported. «non risultano applicate» → «possono non essere attive» (the dossier has this as [BLOCKED], not as a negative).
- Hook: «in un caso inventato,» reads like a footnote in the middle of a sentence. Now «(il caso è inventato)». «schermata bianca» → «schermata d'errore». The white page is a different symptom (the «Pagina bianca nel menu File» row of § 4, ch.1's box), and the error screen is an Industry page, not a blank one.

### § 2 — «Perché ho visto un errore»

- Best section of the chapter. The procedure is five single actions. «Che cosa legge Gea» stays within the three sentences ch.10 allows. The «avvisato» paragraph says exactly what happens: a row in the central table, an entry in the commessa's errors register, no e-mail, no call back. It does not claim the alarms the dossier marks [UNVERIFIED]. The PNG-as-JPEG story (cookbook 35) is the right real case, told without the commessa's name.
- **Told, not shown.** «Prima di GOP-249 l'utente vedeva una frase in inglese attaccata in fondo a una pagina disegnata a metà.» The dossier has the exact string and the HTTP 200 (Jira GOP-249). The string, typo included, is the single most vivid proof of why decision 6 exists. Rewritten (R5), with the «before» placed ahead of the decision so the paragraph builds.
- Counter-objection («il codice di un collega») is in its strongest form and answered from `backend-errors.ts` («non escono mai, nemmeno contati»).

### § 3 — «Dove si è fermato il dato»

- **Opening paragraph overloaded (≈170 words).** It held the stake, the three causes and their owners, and the rule all in one paragraph. The three owners, the fact the reader must carry away, sat in a run of «Non è mai partito… È stato respinto… È arrivato…». Rewritten (R6). The stake now opens on the Monday operatore's message («ho chiuso 9 interventi e ne risultano meno»), so the hook is used. The three causes are a three-item list with owners.
- **Ch.1's number reused.** «È nata da un caso, quello raccontato nel capitolo 1, che costò mezza giornata». `chapter_1.md:173` already says «Rispondere costò mezza giornata»; the struttura says «no numbers from ch.1». Now one clause with no number.
- **Three explanations of one stake.** The «Verificato» danger appeared in the opening, in step 4, and again in «Il quarto passo spiega perché l'ordine conta. «Verificato» chiude l'intervento…». The third copy was cut.
- The five-readings table and Gea's three verbatim conclusions are excellent. The table maps the runbook into office words, as asked. The [CONFLICT] on two marks (1.x) vs one line (GOPlanner 3) is handled in the body. The staff box repeated it («GOPlanner 3 scrive una riga per richiesta»), so that copy was cut.
- Limite: the deduplication sentence said the same thing twice («può duplicare un dato quando la conferma si perde … Serve una conferma persa e un nuovo tentativo»). Tightened, and the proportionality guard kept: «Il doppione si vede, e lo tratta lo staff tecnico».

### § 4 — Ticket, campanella e annunci

- The evidence table is the chapter's core and the clearest replacement of tribal knowledge in the book: one row per kind of problem, what to write, where to take it. The procedure uses the code labels where the wiki is stale: «Nessuno (problema generale)», «Allegati (facoltativi)», «Ticket aperti simili», «Apri ticket».
- **Self-echo.** The section opened «vale quanto le prove che porta» and closed with «Un ticket vale quanto le prove che porta». The opening now states the leg's function instead.
- **Duplicates trimmed.** «Chi vede che cosa» repeated the UI sentence quoted three lines above («senza il tuo nome», «Senza tenant resta visibile solo a te»). The list now adds only what the quote does not say. «Lo stato, intanto, dice già dove si trova il ticket» appeared both in the drafts paragraph and in the counter-objection, and is kept once. The four closed states were listed twice in a row; since they are the last four of the nine, «Gli ultimi quattro, da «Risolta» in poi».
- Still long: 1.231 words including the DEV box (cap 1.200 for sections). The prose is about 1.145. Acceptable; see Optional.
- Gap (not fixed, no source): where the page answers «I ticket non sono ancora disponibili.», the reader is not told by what route to hand over the same evidence. See Optional.

### § 5 — Le pagine di sola lettura dello staff

- **Factual: Errori app empty state.** The text put «Nessun errore app qui. I crash dell'app ora sono registrati nei log centrali: chiedili a Gea…» right after «quando la lettura dai registri centrali è accesa». On `php8` it works the other way round. With the central reading on and nothing found, the server's `vuoto` replaces the default (`lib/AdminDiagnostica.php:175`, `admin_diagnostica.js` `statoVuoto`: `dati.vuoto || o.vuoto`), and the page reads «Nessun crash dell'app negli ultimi 7 giorni.». The «chiedili a Gea» text shows when the switch is off and the page reads the old table, in which nobody has written since 12 luglio 2025 (GOP-849). Rewritten (R10). This also explains *why* empty is normal.
- Giro: excellent («I falliti … vengono prima, perché un fallito di ieri non sparisca sotto i completati di oggi»; 5 / 30 / 120 minuti; four executions). [CONFLICT] 1 is resolved in the reader's words. Grammar: «Quel «svuotato»» → «Quello «svuotato»»; «che i record del Giro non li tocca mai» (redundant clitic) → «che non tocca mai i record del Giro».
- Stato commesse: the colour table with on-screen names («Da guardare», «Attenzione», «Regolare», «Ferma») is better than the struttura asked for. «lunedì–venerdì» correctly drops the legend's «festivi esclusi» per [CONFLICT]. The reason message is quoted with the declared minimum 3. The GOP-836 sentence (headers that wrap) was low value for this reader and has been cut, together with its Fonti line, to bring the section under 1.200.
- «Read-only» was said three times: in the aggancio («nessuna scrive: da qui non si corregge niente»), in «Entrambe le pagine sono di sola lettura» and in the Limite («Le quattro pagine sono di sola lettura»). Kept once in the aggancio and once in the sintesi.
- «Un permesso che non torna» was a single 190-word paragraph with three proofs inline. Turned into a three-item list (STYLE_BIBLE allows lists for «controlli»), with the sola-registrazione guard kept as its own sentence.

### § 6 — Gli strumenti che scrivono

- Strong aggancio: it states the irreversibility first, then the common form. Consolida, Analisi AI per carico and Svuota cache all follow the code over the stale wiki, as the dossier requires (no cap, no cost, protected keys, «Esito sconosciuto…»). The GOP-842 date story («03/04/2026» read as 4 March) is the right surgical example.
- **Factual: «Nessuna modifica eseguita.»** It was given as what the page says «se non c'è niente da fare». In `admin_manutenzione.js` that text ends the unreadable-preview line (and, in lower case, the cancel line). «Niente da fare» has its own message per tool («Nessun codice utenza duplicato da consolidare.», «La cache Redis è già vuota (…)»). Corrected.
- Limite repeated § 1's wiki-provenance sentence. Removed here.
- **Closing.** The original («Il problema arriva allo staff tecnico con le sue prove: pagina, ora e codice; oppure operatore e periodo; oppure il numero del registro…») re-ran § 4's sintesi and left the Monday hook unanswered. Rewritten (R15): the Monday ends in three moves, and the ending keeps the TARGET's last line («Chi segnala porta le prove; chi agisce legge i numeri prima di confermare»). It echoes neither ch.1 (order of where to look) nor ch.11 (smallest access).

### Format and pipeline

- One H1, the italic «In questo capitolo», six `##`, an audience line and a Limite in every section, `## Fonti` last, Jira keys with titles. The trailing `<!-- … -->` comments follow the pipeline convention of chapters 10–11. The WORD COUNT comment said «~6800» and is updated.
- Length: body 6.346 words (6.340 before review; additions and cuts net out). The struttura's TARGET was 5.500–5.900; the PRD says «circa 4.000-6.000».

### Cross-chapter corrections to schedule (not applied here)

1. `chapter_5.md:30`: «Admin › Giro e Stato commesse» is the wiki article title, not a menu path. The reader will look for it and not find it. Proposed: «in Admin › Diagnostica › «Giro»», and «staff tecnico» instead of «personale di GOPlanner» (glossary).
2. `chapter_8.md:201`: «riservati al personale GOPlanner». Use «staff tecnico» (glossary trap 7).
3. `chapter_10.md:193`: «come modifica fatta da Gea … (dove lo staff lo legge: capitolo 12)». Chapter 12 does not say where the staff reads Gea's attività or the proposals register, and `dossier_chapter_12.md` has no fact for it. Either drop the pointer in ch.10 or add one dossier fact and one sentence to ch.12 § 5.

## 4. Persona Audit

**Verdict: on persona.** The chapter sounds like The Engineer + The Scholar Who Can Write for about 95% of its length.
- *What the persona notices first* is everywhere: exact names («Accesso negato: pagina riservata al super-admin globale», «Ticket aperti simili», «Esito sconosciuto: risposta del server non leggibile. Riprova l'anteprima prima di ripetere.»); the rule behind a behaviour («perché un fallito di ieri non sparisca sotto i completati di oggi»); the number (48 ore, 4.000, 06:30, 2 giorni lavorativi); how it breaks and how to fix it (Verificato pressed early, the «sconosciuto» second click).
- *«Se una cosa vale solo per alcune commesse, lo dico»*: done for Gea («dove è attiva»), the Ticket section, «Report», and the central crash reading behind a switch.
- *«Se non lo so, non lo scrivo»*: honoured. The [UNVERIFIED] alarms are not claimed, and neither is Mappa's content. The draft let the method show through («le fonti danno solo il nome», «la guida … non provata nel browser»), and those were removed. The persona states limits of the product, not of the research.
- *«I prove every point with one surgical example, not three»*: § 3 broke this, with the same stake proved three times. Fixed.
- *«I do not intensify — I specify»*: one near-intensifier («Due righe vanno lette con attenzione») is acceptable. There are no banned patterns. A sweep for «semplicemente», «gestire», «È importante notare», «noi», «In sintesi», «potente» and series of rhetorical questions found nothing. «non solo… ma anche» is used once (allowed).
- Drift that remains: § 4 still has a stretch of label catalogue in prose (filters, row tags, three buttons). It is accurate and useful, but it reads as a list read aloud. See Optional.

## 5. Counter-Objection Check

Five present (STYLE_BIBLE requires ≥ 2), all in the reader's own voice and answered from sources:

| # | Objection | Strongest form? | Evidence-based answer? |
|---|---|---|---|
| 1 (§ 1) | «Il collega dello staff ha il menu Admin pieno di voci, io ho solo «Utenti»: mi manca un permesso?» | Yes: the real suspicion of an amministratore. | Yes after R3. Before, «non si possono dare a un amministratore» was stronger than the code; now «non stanno in nessun profilo, e nessun invito li porta». |
| 2 (§ 2) | «Un collega mi ha girato il suo codice, ma Gea non lo trova.» | Yes: the natural office workflow. | Yes: `backend-errors.ts` filters on the asker; gives the two routes (colleague asks, or ticket). |
| 3 (§ 3) | «Gea dice che il dato non è mai arrivato, ma l'operatore giura di averlo mandato.» | Yes: the hardest conversation in the chapter. | Yes: three checks in order (queue, clock, register channel), and the honesty rule «si dice che cosa si è controllato». |
| 4 (§ 4) | «Ho risposto «Sì» … e non vedo ancora una risposta.» | Yes. | Yes: same alert as blocking app reports, no promised times, drafts awaiting approval. |
| 5 (§ 5) | «Il Giro dice «Fallito»: l'ufficio deve fare qualcosa?» | Medium: the office cannot see the Giro, so it is a staff reader's question in office words. | Yes: four failed executions plus an alarm, and a ticket only for a visible effect. |

**Missing, and the strongest one available:** «Lo schermo dice già «Il nostro team ne è stato avvisato»: perché devo anche aprire un ticket?» The answer is in § 2's «avvisato» paragraph as an explanation. It is the objection an office reader will actually raise, and it could carry the *Contro-obiezione* label. Optional.

## 6. Priority Improvements

### Critical (applied)
1. Errori app: the empty-state message tied to the right code path, with the reason (old table silent since 12 luglio 2025) (§ 5, R10).
2. `users.admin` named as in chapter 11 («contrassegno di amministratore»); «non si possono dare a un amministratore» → «nessun profilo lo concede e nessun invito lo porta» (§ 1, R3).
3. «Nessuna modifica eseguita.» attributed to the unreadable preview, not to «niente da fare» (§ 6).

### Important (applied)
4. Closing rewritten to pay off the Monday hook and stop repeating § 4's sintesi (R15).
5. § 3 opening split; the three causes as a list with owners; hook reused (R6).
6. Ch.1's «mezza giornata» removed (§ 3).
7. Redundant «Il quarto passo spiega…» paragraph cut (§ 3).
8. GOP-249 «before» shown verbatim with HTTP 200 (§ 2, R5).
9. Meta removed: «Di «Mappa» le fonti danno solo il nome»; § 1 Limite rewritten as reader guidance; § 6 duplicate removed.
10. Gea map-table row de-tautologised (R1).
11. «Un permesso che non torna» turned into a three-item list (§ 5).
12. Repetitions trimmed in § 4 (visibility bullets, state list, «Lo stato…») and § 5 (read-only ×3, GOP-836 sentence and its Fonti line).
13. Grammar: «Quello «svuotato»», «che non tocca mai i record del Giro»; hook «(il caso è inventato)», «schermata d'errore».

### Important (not applied — Writer's next pass)
14. **Length.** The body is 6.346 words against «circa 6.000» (PRD) and 5.500–5.900 (TARGET). The cheapest 300 words without losing a NUF:
    - § 4: the three-buttons paragraph and the «Chi vede che cosa» list could merge into one table (Pulsante | Chi lo vede | Quando).
    - § 1: «Due righe vanno lette con attenzione» could shrink to one sentence on «Clienti» plus the Console JSON warning.
    - § 3: Gea's three verbatim conclusions could be cut to the first one plus «e le altre due nello stesso modo».
    - § 2: the «Quando Gea non trova l'errore» subsection (two sentences) could fold into the Limite.

### Optional
15. Label the «Il nostro team ne è stato avvisato» paragraph as a *Contro-obiezione* in the reader's voice (see § 5 of this review).
16. One sentence on the route where the page says «I ticket non sono ancora disponibili.» This needs a source first: add an oracle question («dove la sezione Ticket non è attiva, per quale canale l'ufficio consegna le prove allo staff tecnico?») rather than inventing one.
17. Ch.10's pointer about where the staff reads Gea's attività (cross-chapter item 3).

## 7. Rewritten Paragraphs

### R1 — § 1, map table, row «Gea»

**Original**
> | Gea | dove è attiva (capitolo 10) | chi ha Gea | «perché ho visto un errore», «dove si è fermato il dato» (sezioni 2 e 3) |

**Rewritten**
> | Gea | pannello in basso a sinistra, sulle commesse dove è attiva (capitolo 10) | gli utenti di quelle commesse | «perché ho visto un errore», «dove si è fermato il dato» (sezioni 2 e 3) |

**Why:** «chi ha Gea» answers «chi lo vede» with the question. Every other row gives a place; this one now does too, with the position chapters 1 and 10 use (`chapter_1.md:19`, `chapter_10.md:11`).

### R2 — § 1, «Due righe vanno lette con attenzione» (last sentence)

**Original**
> … e la pagina stessa avverte che le chiamate «vengono eseguite davvero sul database del cliente» (vedi il capitolo 15). Di «Mappa» le fonti danno solo il nome.

**Rewritten**
> … e la pagina stessa avverte che le chiamate «vengono eseguite davvero sul database del cliente» (vedi il capitolo 15): è l'unica voce di «Diagnostica» che può scrivere sui dati.

**Why:** «le fonti danno solo il nome» is the researcher talking (the dossier marks Mappa [UNVERIFIED]), not the guide. The replacement turns the Console JSON warning into a fact the reader needs before § 5, whose pages «nessuna scrive». Without it, a staff reader could take the whole Diagnostica group as read-only (dossier: «I metodi che scrivono … modificano i dati»).

### R3 — § 1, «Perché la voce si chiama «Utenti» o «Admin»» + counter-objection

**Original**
> I quattro gruppi tecnici dipendono da un contrassegno sull'accesso dello staff tecnico, non da un profilo: nessun permesso li concede. Chi non è dello staff tecnico e vede solo le voci di «Utenti» trova la voce intitolata «Utenti»; chi vede solo l'estrazione mensile la trova intitolata «Admin».
> …
> No. I gruppi tecnici non sono un permesso di alcun profilo, e non si possono dare a un amministratore.

**Rewritten**
> I quattro gruppi tecnici non dipendono da un profilo, ma dal contrassegno di amministratore sull'accesso, lo stesso che nel capitolo 11 fa comparire il pulsante «Accessi». Nessun permesso lo concede e nessun invito lo porta: ogni accesso nasce senza. Chi ha il contrassegno vede la voce intitolata «Admin», con i gruppi tecnici. Chi non lo ha e vede solo le voci di «Utenti» la trova intitolata «Utenti»; chi vede solo l'estrazione mensile, «Admin».
> …
> No. I gruppi tecnici non stanno in nessun profilo, e nessun invito li porta.

**Why:** Chapter 11 calls `users.admin` «il contrassegno di amministratore». Calling it «contrassegno … dello staff tecnico» here made one flag look like two. «Non si possono dare a un amministratore» is also stronger than the code: `MenuAdmin::voci()` opens the groups to any access with `users.admin = 1`. What is true and checkable is that no profilo grants the flag and every creation path writes it as 0 (`dossier_chapter_11.md:85`). The rule of the title is now stated the way `AdminAreaUtenti::titoloAdmin()` decides it.

### R4 — § 1, Limite

**Original**
> *Limite.* Le guide della wiki sulle pagine Admin dicono di sé «Guida scritta dal codice, non provata nel browser»: questo capitolo usa solo le etichette che compaiono nei modelli e negli script delle pagine. La sezione Ticket, gli annunci e il contatore delle «Novità» dipendono da tabelle che non risultano applicate su ogni installazione. Per questo il capitolo dice «dove la sezione è attiva», e non lo promette.

**Rewritten**
> *Limite.* Le etichette di questo capitolo vengono dai modelli e dagli script delle pagine Admin. Se a schermo una parola è diversa, vale quella a schermo, e la differenza si segnala allo staff tecnico. La sezione Ticket, gli annunci e il contatore delle «Novità» dipendono da tabelle che possono non essere attive su ogni installazione: per questo il capitolo dice «dove la sezione è attiva», e non lo promette.

**Why:** The original was the research method, which the ch.11 review already flagged as a pattern. The reader needs an instruction: what to do if a label differs. «non risultano applicate» is a negative the dossier does not establish ([BLOCKED]); «possono non essere attive» says exactly what is known.

### R5 — § 2, why the screen is the same everywhere

**Original**
> La schermata è uguale su ogni commessa, in italiano, e non si personalizza. È una scelta registrata in GOP-249, la sesta decisione: una schermata sobria, con una frase, il codice in grande e selezionabile e un pulsante per tornare indietro, non ridefinibile commessa per commessa, perché una schermata d'errore ridefinibile è una schermata che si scopre rotta proprio nel momento peggiore. Prima di GOP-249 l'utente vedeva una frase in inglese attaccata in fondo a una pagina disegnata a metà.

**Rewritten**
> La schermata è uguale su ogni commessa, in italiano, e non si personalizza. Prima di GOP-249, in produzione, un errore grave lasciava la pagina disegnata a metà, con in fondo la frase inglese «Sorry, an error has occured. Please contact your system administrator.», e il server la consegnava con il codice 200, quello delle risposte riuscite. La sesta decisione di GOP-249 ha fissato la forma di oggi: una frase, il codice in grande e selezionabile, un pulsante per tornare indietro, e nessuna versione per commessa, perché una schermata d'errore ridefinibile è una schermata che si scopre rotta proprio nel momento peggiore.

**Why:** «Show, don't tell.» The «before» was an afterthought in the abstract («una frase in inglese»). The dossier (Jira GOP-249) has the exact string, typo included, and the 200 status. Together they show why every element of decision 6 exists: translated, a code, a clean replacement of the half page, the right status. Moving the «before» ahead of the decision lets the paragraph build to the rule. The status code is explained at first use (STYLE_BIBLE § Number rules).

### R6 — § 3, opening

**Original**
> L'ufficio verifica un intervento che non ha esecuzione. Un'ora dopo il telefono dell'operatore manda l'esito, e il server lo respinge, perché l'intervento risulta già chiuso: le foto e le letture non arrivano più. È il danno che questa sezione evita. Un dato che dovrebbe arrivare dal telefono, cioè una foto, l'esito di un intervento o una posizione, e che in ufficio non c'è, ha tre cause diverse con tre responsabili diversi. Non è mai partito dal telefono: telefono, rete o app, e se ne occupa l'operatore. È stato respinto dal server: una regola del server o un difetto di formato dell'app, e se ne occupa lo staff tecnico. È arrivato e non è stato salvato: il server, ancora lo staff tecnico. Il compito è dire quale delle tre, non indovinare.
>
> Oggi la distinzione si può fare. È nata da un caso, quello raccontato nel capitolo 1, che costò mezza giornata proprio perché i tre casi non si distinguevano.

**Rewritten**
> Il secondo messaggio del lunedì, «ho chiuso 9 interventi e ne risultano meno», porta con sé una tentazione: aprire gli interventi che mancano e premere «Verificato». Se un'ora dopo il telefono dell'operatore manda l'esito, il server lo respinge, perché l'intervento risulta già chiuso, e le foto e le letture di quell'intervento non arrivano più. È il danno che questa sezione evita.
>
> Un dato che dovrebbe arrivare dal telefono (una foto, l'esito di un intervento, una posizione) e che in ufficio non c'è si è fermato in uno di tre punti, e ogni punto ha il suo responsabile:
>
> - **mai partito** dal telefono: telefono, rete o app; se ne occupa l'operatore;
> - **respinto** dal server: una regola del server o un difetto di formato dell'app; se ne occupa lo staff tecnico;
> - **arrivato e non salvato**: un guasto del server; di nuovo lo staff tecnico.
>
> Il compito è dire quale dei tre, non indovinare. Oggi si può: i segni che servono sono nati dal caso raccontato nel capitolo 1, in cui i tre punti non si distinguevano.

**Why:** The hook's second message is the case this section solves, and it was never used. The reader now *lives* the temptation before learning the rule. The three owners are the fact to remember, so they get the list form STYLE_BIBLE allows for enumerations. «costò mezza giornata» is chapter 1's number (`chapter_1.md:173`), which the struttura says not to reuse.

### R7 — § 3, the redundant paragraph after the procedure (cut)

**Original**
> Il quarto passo spiega perché l'ordine conta. «Verificato» chiude l'intervento per ogni invio successivo del telefono. Va quindi premuto dopo aver stabilito dove si è fermato il dato, mai prima.

**Rewritten**
> *(removed — the opening states the stake, step 4 states the rule and its reason)*

**Why:** It was the third telling of one point. Persona activation 2: «one surgical example, not three». Cutting it also puts the procedure and the five-readings table next to each other, which is the order the reader uses them in.

### R10 — § 5, Errori app empty state

**Original**
> Una pagina vuota è normale. Lo dice la pagina stessa: «Nessun errore app qui. I crash dell'app ora sono registrati nei log centrali: chiedili a Gea, l'assistente virtuale.»

**Rewritten**
> Una pagina vuota è normale, e il messaggio dice perché. Con la lettura dai registri centrali accesa, la pagina scrive «Nessun crash dell'app negli ultimi 7 giorni.» Senza, legge ancora la vecchia tabella dei crash, in cui nessuno scrive dal 12 luglio 2025, e rimanda a Gea: «Nessun errore app qui. I crash dell'app ora sono registrati nei log centrali: chiedili a Gea, l'assistente virtuale.»

**Why:** Factual. Coming right after «quando la lettura dai registri centrali è accesa», the original implied the «chiedili a Gea» text is what the central reading shows. On `php8` the server's `vuoto` (`AdminDiagnostica.php:175`) replaces it in that case. A staff member who sees «Nessun crash … 7 giorni» now knows the switch is on; one who sees «chiedili a Gea» knows it is off. That reading of the switch is itself a diagnostic. The 12 luglio 2025 date (GOP-849) explains why empty is normal instead of just asserting it.

### R13 — § 6, the common form

**Original**
> Se non c'è niente da fare, o l'anteprima non si legge, non cambia niente e la pagina lo dice: «Nessuna modifica eseguita.»

**Rewritten**
> Se non c'è niente da fare, la pagina lo dice con un messaggio suo e non parte nulla; se l'anteprima non si legge, la riga dell'esito chiude con «Nessuna modifica eseguita.»

**Why:** Factual. `admin_manutenzione.js:17,23` prints «Nessuna modifica eseguita.» only at the end of the unreadable-preview line. «Niente da fare» has a message per tool, and the subsections below quote it correctly. A staff reader who expects the wrong text will misread the outcome line.

### R15 — Chapter closing (end of § 6)

**Original**
> Il problema arriva allo staff tecnico con le sue prove: pagina, ora e codice; oppure operatore e periodo; oppure il numero del registro. Ogni strumento dello staff che scrive mostra i suoi numeri prima di scrivere. Chi segnala porta le prove; chi agisce legge i numeri prima di confermare.

**Rewritten**
> Rifatto con questi strumenti, il lunedì della sezione 1 si chiude in tre mosse: il codice di 8 caratteri copiato con la pagina e l'ora; l'«Ultimo invio» del telefono letto prima di premere «Verificato»; per il menu «Utenti», nessun permesso da chiedere. Quello che finisce in un ticket porta già le sue prove, e lo staff tecnico parte da lì senza richiedere niente; quando deve scrivere sui dati, legge prima i numeri della conferma. Chi segnala porta le prove; chi agisce legge i numeri prima di confermare.

**Why:** The original's first sentence was § 4's sintesi again («pagina, ora e codice, oppure operatore e periodo, oppure il numero del registro»), so the chapter ended on an echo of itself. The hook promised three problems and three tools and was never resolved. Now the reader sees the Monday end, one concrete move per message, and the chapter lands on the core question of the struttura («without anyone having to ask again»). The TARGET's last sentence is kept. It echoes neither ch.1 (order of where to look) nor ch.11 (the smallest access).

### Additional inline corrections (short)

| Where | Original | Rewritten | Why |
|---|---|---|---|
| § 1 hook | «Un lunedì mattina, in un caso inventato, all'ufficio…» / «una schermata bianca» | «Un lunedì mattina (il caso è inventato) all'ufficio…» / «una schermata d'errore» | Reads as a sentence, not a footnote; «pagina bianca» is a different symptom in the evidence table |
| § 3 Limite | «… può duplicare un dato quando la conferma si perde … Serve una conferma persa e un nuovo tentativo; il doppione si vede…» | «… se la conferma si perde, il nuovo tentativo può duplicare un dato, perché lì la deduplicazione … Il doppione si vede, e lo tratta lo staff tecnico.» | Same condition said twice |
| § 3 staff box | «… poi si riabbassa. GOPlanner 3 scrive una riga per richiesta.» | «… poi si riabbassa.» | Already in the body |
| § 4 opening | «… e vale quanto le prove che porta.» | «: porta le prove da chi ha visto il problema allo staff tecnico.» | The section's sintesi says it; no self-echo |
| § 4 states | «Quattro chiudono il ticket: «Risolta», «Non è un difetto», «Risposto», «Non prevista».» | «Gli ultimi quattro, da «Risolta» in poi, chiudono il ticket.» | The four were listed twice in two lines |
| § 5 Giro | «Quel «svuotato» non si riferisce a «Svuota cache Redis», che i record del Giro non li tocca mai» | «Quello «svuotato» non si riferisce a «Svuota cache Redis», che non tocca mai i record del Giro» | «quello» before s+consonant; redundant clitic |
| § 5 permessi | one 190-word paragraph | three-item list + guard sentence | Three proofs are an enumeration; the paragraph broke Voice rule 1 rhythm |

## 8. Verdict

**REVIEWER_PASS_MINOR** — The relay thesis is earned, the evidence table and the error-code section replace real tribal knowledge, and every fact traces to the dossier. The three factual slips, the unpaid hook and the repetitions were local and are now fixed inline. The one open item is length, about 6% over the PRD. Litmus: after these corrections a new amministratore finishes the chapter thinking «I lived this» for §§ 2–3 and the closing, and «I was told this, accurately» for the label catalogues of §§ 4–5.
