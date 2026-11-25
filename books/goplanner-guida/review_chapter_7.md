# Review — Capitolo 7. Esportazione e consegna al committente

Reviewer run: 25 novembre 2026. Read fresh: `PRD.md`, `STYLE_BIBLE.md`, `chapter_7_struttura.md`, `chapter_7.md`, `dossier_chapter_7.md` (all 234 lines, including [SHADOW] and [CONFLICT]), `oracle_questions.md` (ch.7 block), and the closing paragraphs of `chapter_1.md`–`chapter_6.md` (echo check). One claim was checked read-only against code on `php8` (HEAD `21e974921`): `JSONController::isStandardExportModel()`, to decide whether «Conteggio non disponibile» can be used as a sign that a modello has its own query. It cannot: the gate tests the signature of `getForExport()`, not whether the commessa redeclares it. No such claim was added.

## 1. Executive Summary

Ch.7 is the most source-faithful chapter of the book so far. Almost every label, message and number is quoted from the dossier, and the thesis (the standard esportazione reads and does not write; the file is a snapshot of the launch) is proven by the opening case. Four defects kept it below the pass line:

- **One invented UI state.** «Il pulsante dice 0 interventi»: the button never shows 0. With a zero count it stays off and the page says «Nessun intervento con questi filtri…».
- **One promise the dossier marks UNVERIFIED.** «Gli altri formati funzionano» contradicts [CONFLICT] 15 (format choice on the new page for modelli without their own format).
- **The closing echoes earlier chapters.** It echoes ch.3 («vero … per il momento in cui è stato letto») and the «Prima di X si leggono N cose» shape of ch.5 and ch.6. It also strings together the § 1–§ 3 sintesi lines.
- **The voice leaks its own research process** («la guida interna … senza una prova nel browser», «La regola delle fonti», «non si ricava dal codice»). The Limite paragraphs also open with signposts.

Verdict: **REVIEWER_CORRECTIONS, 45/60.** 26 blocks were rewritten or added in `chapter_7.md` (2 new paragraphs, 1 new subheading, 1 paragraph moved), plus 7 one-line fixes. The chapter is now 5,983 words, inside the PRD ceiling.

## 2. Score: 45/60 → REVIEWER_CORRECTIONS

| Dimension | Score | One-line reason |
|---|---|---|
| Narrative & Structure | 7/10 | The opening case proves the thesis, but the throughline was dropped after § 1. The closing was a collage of three sintesi lines and echoed ch.3/ch.5/ch.6. Sections were unbalanced: § 3 had 1,405 words against a 1,200 cap and § 5 had 583 against a 600 floor. § 5 had six prose paragraphs in a row. |
| Language, Style & Voice | 7/10 | The rhythm is on-persona («Non il log, non la memoria di chi l'ha lanciata»). Drifts: research narration, intensifiers («la trappola più facile del capitolo», «L'obiezione è seria», «merita attenzione»), signposted Limite openers, a vague quantifier («buona parte»), «tracciato» in prose, glosses in guillemets. |
| Factual Accuracy | 8/10 | Nearly every label, message and number traces to a dossier line with its exact string. Red flags: the «0 interventi» button; «Gli altri formati funzionano» (UNVERIFIED); foto «Gira sempre in background» contradicted in the same section; «Lo dice il pannello» overstated what «Ultime esportazioni» can tell; «Una quindicina» where the dossier lists exactly 15. |
| Audience Alignment | 8/10 | The procedure, the symptom table and what to give the staff tecnico are exactly what the back office needs. Weak spot: the fact that matters most to most readers is buried in a box and scattered across Limite fragments. 61 of 74 commesse folders have their own query, so «Filtra per» is ignored and the stato condition is hidden. |
| Sensory & Emotional Engagement | 7/10 | Strong where cases appear: 412 vs 415, five retries on the same period, the 5-second «Conferma l'eliminazione», the revoked-link message. The middle (riepilogo, link messages, editor) reads like an inventory of strings. |
| Originality & Angle | 8/10 | Real insights that only the code could give: «Validazione» reads a field no normal flow writes, «Ripeti» moves the period forward, «Completata» ≠ consegnata, a modello that sends closes «Completata» on purpose so that it is not sent twice, and the 36 Controllato-only queries. This chapter earns its place. |
| **Total** | **45/60** | |

## 3. Detailed Findings by section

### «In questo capitolo» and § 1 — Che cosa legge un'esportazione

- **Strong hook, correctly built.** «Nessun errore: il file ha risposto alla domanda posta al momento del lancio» follows from the story (the ch.6 lesson is applied). One precision was missing: the re-launch contains the three esecuzioni only because «Filtra per» is on «Esecuzione». On «Pianificazione», or on a commessa query that reads `data_validazione`, the story changes. Fixed by naming the option in the case.
- **English code comment in office prose.** «Il codice lo dice in chiaro: il conteggio mostrato e l'esportazione «cannot silently use different filters».» An office reader gets an English quote and an appeal to code. Replaced with «per costruzione».
- **Overstated claim.** «Lo dice il pannello «Ultime esportazioni», che registra chi ha lanciato quale modello…» The panel shows the last 15 esportazioni and lists no interventi. It tells which question left, not which esito left. Rewritten to say so.
- **Weak balance line.** «Non è un difetto. L'ufficio decide che cosa parte con il filtro dell'esito e verificando prima di esportare.» On a commessa query such as `WHERE esito=1 AND ie.stato_id=6` the esito filter is hard-coded, so the sentence over-generalises. It also repeats the box above it. Rewritten and scoped to the standard modello.
- **Missing counter-objection, the strongest one available.** After «61 delle 74 cartelle … hanno una propria interrogazione», a skeptical reader asks what the standard-modello rules are good for. The chapter never answered. Added: the page, coda, registro, link, «Ripeti», durations, firme exclusion and failure causes are the same everywhere; only the selection changes; ask the staff tecnico once per modello.
- **Formats.** «Gli altri formati funzionano» contradicts dossier [CONFLICT] 15 and oracle question 3. Rewritten so that the table describes the engine and the page choice is not promised.
- **Limite opener.** «Tutto questo ha limiti precisi.» This signposts the paragraph's function and was removed. The Inviato writers were listed twice, in the counter-objection and in the Limite. The Limite now names them once by type.
- **Gloss in guillemets.** «già esportato» and «legge, non scrive» are not UI labels; they are now in italic.

### § 2 — File › Esportazione: modello, filtri, riepilogo

- **Vague quantifier (ch.6 lesson).** «queste due scelte spiegano buona parte dei file inattesi» has no count in the dossier. Replaced with the concrete effect: last month only, positivi only, a shorter file and no error.
- **«Due precisazioni sui filtri»** introduces three. Fixed.
- **«Filtra per» table without its scope.** The table reads as universal, and the scope appears only 20 lines later, in the Limite. A one-sentence scope line now sits above the table.
- **Validazione paragraph.** «merita attenzione» is filler. «quante siano in produzione non si ricava dal codice» is a research note addressed to nobody in the office. Rewritten: the label does not mean what it seems, and a month of verified work can leave the button off.
- **Factual error in counter-objection 2.** «Il pulsante dice 0 interventi». Per `esportazione.js:428-446` the label is «Esporta N interventi» only when the count is above 0. Otherwise the button is off with «Nessun intervento con questi filtri: allarga il periodo o togli un filtro.» «L'obiezione è seria» was also removed, because it describes the objection instead of answering it.
- **Limite.** «Una quindicina» → «Quindici» (`RAMI_PAGINA` has 15 entries). «il link finale» could be read as the committente link of § 3; it now reads «il collegamento per scaricare il file». «verbali PDF» appeared both here (synchronous) and in § 3 (background since 24 novembre). The list is now «tra cui … un modello di verbali PDF», so the reader can tell the two apart. «Lo stesso vale per «Codici»» said the opposite of what followed and now reads «fa il percorso inverso». «sono «classici» perché…» was a gloss in guillemets.

### § 3 — In coda: avanzamento, «Ultime esportazioni», file e link

- **Over length.** The section had 1,405 words against the STYLE_BIBLE cap of 1,200. Three passages covered the same ground: the long quoted note under «Esportazione in corso», which repeats the segnalibro sentence; the scartati definition followed by a quote that says the same; and counter-objection 3, which repeated the «Completata non vuol dire consegnata» paragraph almost line by line. All three were trimmed. The section is now 1,372 words, still over the cap (see Priority Improvements).
- **«Ripeti».** «è comodo, ed è la trappola più facile del capitolo» is an intensifier, not a fact. The rewrite opens with the rule («non rifà un'esportazione: prepara la successiva») and runs it on the opening case: on 3 dicembre «Ripeti» on the 1° dicembre row proposes December. The thirteen-item list of reloaded filters became «il modello e tutti i filtri».
- **Link paragraph.** One paragraph held seven sentences and several quoted strings, ending with a leaked phrase from the brief: «La regola delle fonti è una». It is now split into the risk with its measured limits (adding the dossier fact that only who can download the file can create its link) and the revocation with its effect. It closes on a fact: an unrevoked link stays valid until it expires.
- **Limite.** One paragraph chained «Inoltre … Infine» across four different cases. It is now a four-item list with a single routing sentence.

### § 4 — Modelli salvati: «Duplica e modifica»

- **Leaked research caveat.** «E la guida interna della funzione è stata scritta leggendo il codice, senza una prova nel browser: le etichette di questa sezione vengono dal codice.» The Architect wrote: «keep this caution in the dossier». The whole dossier is code-derived (dossier line 9), so singling out § 4 confuses the reader and points to a «guida interna» that is never named. Removed.
- **Limite gained a consequence.** A modello with its own query has no sample row, so the date-format check that the previous paragraph calls «il controllo più utile» does not exist for it. The rewrite says so and gives the action: open the first file before sending it.
- «un tracciato a posizioni fisse» put «tracciato» in prose, which glossary trap 1 forbids. It now reads «un file di testo a posizioni fisse». «da «31/12/2026» a «20261231» a «14:30»» was clumsy. «condiviso» in guillemets was a gloss.
- The Attenzione box on shared copies is the best risk paragraph in the chapter: exact, proportionate, and actionable.

### § 5 — L'esportazione delle foto

- **Internal contradiction.** The section opened with «Gira sempre in background» and its own Limite then said that some foto modelli «restano sincroni». Fixed.
- **Pacing violation.** Six prose paragraphs ran in a row (lines 199–209 of the draft) against a maximum of 5. The PNG case now has its own `###` subheading, and the Limite sits before it, so the section ends on case → lesson → sintesi.
- **A causal link from the dossier was not used.** [CONFLICT] 1 resolves that the PNGs of the incident were firme. The two rules of the section (firme excluded, unreadable foto skipped) therefore come from the same case on the same day. The case now says so, which turns «Il caso che ha fissato queste regole» from an assertion into a demonstration.
- Added from the dossier (`JSONController.php` comment): one at a time has a concrete reason, because before the queue every repeated click built another ZIP.
- The sintesi said «Nello ZIP si legge il messaggio finale», but the message is on the page, not in the ZIP. Fixed. «foto mancanti» in guillemets was a gloss.
- At 651 words the section is above the STYLE_BIBLE floor but below the spec range of 800–1,000 (see Priority Improvements).

### § 6 — Quando l'esportazione è vuota, fallita o scaduta

- This is the strongest section. The symptom table, the «false given» cause, the honest *causa non registrata*, and the five-item list for the staff tecnico are all exact and usable.
- «La diagnosi dell'ufficio ha un perimetro.» is a signpost opener and was removed.
- The closing box gained the two new stop points introduced by the corrections: an unknown date field, and a file in the wrong format.

### Closing paragraph

- Original: «Un file risponde alla domanda posta al momento del lancio, e a nessun'altra. Prima di spedirlo si leggono nel riepilogo …». The first sentence restates the ch.3 closing thesis about the moment of reading. The second copies the «Prima di [azione] si [leggono/contano] [elenco]» shape that closes ch.5 («Prima di farla si contano tre numeri») and ch.6 («Prima di qualunque azione su un intervento servono due risposte»). The rest repeats the § 2 and § 3 sintesi lines word for word. Persona activation phrase 2 («My ending cannot echo any previous chapter») is violated.
- Rewritten to close the opening case. The correction is a second file, not an edit of the first. The old link is revoked, and the two registro rows are what the office answers from when the committente asks what was received. It is a desk rule specific to delivery, it does not end on the stato column (which would echo ch.6), and it is not an announcement.

### Format and security

One H1; «In questo capitolo» present; `## Fonti` last, with every Jira key titled. No secrets, hosts, container paths, personal names or tenant codes in UFFICIO text; tenant appears only in a DEV box with the correspondence stated. The HTML comments at the end follow the convention of chapters 1–6 (pipeline metadata).

## 4. Persona Audit

**Verdict: mostly on persona, with four kinds of drift, all corrected in place.**

The Engineer + The Scholar is audible wherever the chapter explains the machine. Examples: «i filtri vengono fotografati al lancio e il lavoro in background usa esattamente quelli»; «dopo un invio, un fallimento farebbe ripetere l'esportazione e mandare tutto due volte»; «Non il log, non la memoria di chi l'ha lanciata.» The rule-after-explanation rhythm of Voice rule 1 holds throughout. «Se non lo so, non lo scrivo» is honoured in the hard cases («Che cosa succede quando si rilancia un modello che invia non ha una regola generale»).

Drift found:

1. **Research narration.** The persona explains the machine. Here the writer sometimes narrated the dossier instead: «Il codice lo dice in chiaro», «quante siano in produzione non si ricava dal codice», «la guida interna … senza una prova nel browser», «La regola delle fonti è una». An office reader has no use for the state of the research. «Dalla lettura del codice» in § 1 is kept, because there it scopes a real uncertainty about re-sending.
2. **Intensifying instead of specifying.** «la trappola più facile del capitolo», «L'obiezione è seria», «merita attenzione», «Il rischio è reale». Each was replaced by the fact that makes the point.
3. **Paragraph functions leaking as prose.** «Tutto questo ha limiti precisi», «La funzione ha confini precisi», «Anche qui ci sono limiti», «La diagnosi dell'ufficio ha un perimetro». This is the same failure class as the ch.6 «dichiarato come tale» leak: the STYLE_BIBLE's «Limite» function announced itself. Removed, and each Limite now opens on its content.
4. **Inventory mode.** In the riepilogo paragraph and the link paragraph the voice became a list of strings. The link paragraph was split; the riepilogo stays as an Optional item.

Activation phrase 2 («My ending cannot echo any previous chapter») was violated and is fixed; see Closing. «I prove every point with one surgical example, not three» holds: one opening case, one Ripeti example (now the same case), one real incident per DEV box.

## 5. Counter-Objection Check

**Present: 5 in the draft, 6 after corrections.** STYLE_BIBLE requires at least 2.

| # | Objection | Strongest form? | Evidence-based answer? |
|---|---|---|---|
| 1 | «Ma se l'ho esportato ieri, perché l'intervento risulta ancora Controllato e non Inviato?» (§ 1) | Yes: the reader's real confusion, in their own words. | Yes: no generic export file writes stato; Inviato comes from four named paths. The pointer to «Ultime esportazioni» overclaimed and is now scoped. |
| 2 | Button off / 0 interventi although the work was done (§ 2) | It was framed on an invented UI state. Now framed on the real disabled-button message. | Yes: an ordered checklist (Filtra per → period → esito → Altri filtri → do the esecuzioni exist), with ch.6 and ch.12 pointers. |
| 3 | «Completata ma non c'è Scarica» (§ 3) | Adequate, but it duplicated the paragraph above it; trimmed. | Yes: message of the row, 30 giorni, the exact «non risulta scaricabile» text → staff. |
| 4 | «Posso correggere direttamente il modello della commessa?» (§ 4) | Yes. | Yes: read-only by design, «Un modello di sistema non si elimina», staff request, and Gea cannot help (`ChatbotStrumentoProponiMappatura` is import-only). |
| 5 | «Nei log non c'è nulla: quindi l'esportazione è andata bene?» (§ 6) | Yes, the strongest in the draft. It attacks the reader's default inference. | Yes: the 16 novembre 2026 cutoff and the column update dependency, so the answer is *causa non registrata*. |
| 6 (added) | «Ma se 61 cartelle su 74 hanno un'interrogazione propria, a che cosa servono le regole del modello standard?» (§ 1) | This is the objection a skeptical reader raises the moment they read the Attenzione box. The draft set it up and never answered it. | Yes: dossier lines 20–21, 27, 55, 132. What is common and what is commessa-specific, plus one action (ask once per modello). |

Steelman check: the strongest objection the chapter still does not raise is «Se la pagina mostra «Filtra per» e poi la mia commessa lo ignora, come faccio a fidarmi di qualunque altro filtro?». The honest answer depends on oracle question 2 (is it intended?). It should wait for the captain's answer rather than be invented.

## 6. Priority Improvements

### Critical (all applied in `chapter_7.md`)
1. «Il pulsante dice 0 interventi» → the real disabled state and message.
2. «Gli altri formati funzionano» → the engine behaviour is described, the page choice is not promised ([CONFLICT] 15), and a staff stop point was added.
3. The closing echoed ch.3/ch.5/ch.6 and repeated three sintesi lines → it now closes the opening case on delivery and revocation.
4. Leaked research caveats removed («guida interna … browser», «regola delle fonti», «non si ricava dal codice», the English code quote).

### Important
5. **§ 3 is still 1,372 words** (cap 1,200). The remaining excess is real content: the 409 messages, the durations table, the GOP-647 DEV box. Next pass: either cut the second 409 message to its distinguishing clause, or move the two «commessa senza aggiornamento» bullets into § 6's symptom table, where they also belong as symptoms.
6. **§ 4 (732) and § 5 (651) sit under their spec ranges** (800–1,000). Candidates from the dossier not yet used: in § 4, `MAX_COLONNE = 300` and the validation messages («Il modello deve avere almeno una colonna.»); in § 5, a one-line note that the names inside the ZIP are per commessa, with one invented example of a name pattern. Use only what serves the office reader.
7. **The «own query» majority deserves one compact place.** The facts are now in § 1 (box plus counter-objection), above the «Filtra per» table, and in the § 2 Limite. A short table in § 1, «Che cosa cambia su una commessa con interrogazione propria» (data, stato, esito, «Codici», conteggio), would replace three scattered mentions. Do it after the oracle answers, because questions 2 and 3 may change the rows.
8. Oracle answers that would change this chapter: Q1 (`data_m` in production: if always empty, «Validazione» returns 0 everywhere and the text can say so), Q2 («Filtra per» on own queries), Q3 (format on the new page), Q6 (warning before re-sending a mail modello).

### Optional
9. The § 2 riepilogo paragraph lists eleven labels in one sentence chain. A two-column table (Riga del riepilogo | Che cosa mostra) would read faster.
10. Every section ends on a one-line sintesi. The STYLE_BIBLE requires them, but six identical cadences become predictable. Vary them: let one sintesi be a question the reader can now answer, or fold one into the last Limite.
11. Counter-objections 2, 3 and 5 are declarative sentences («Il pulsante resta spento…»). Italic would mark them as the reader's voice without breaking the guillemets-for-labels rule.

## 7. Rewritten Paragraphs

### R1 — § 2, counter-objection 2 (factual)

**Original:**
> Il pulsante dice 0 interventi, ma il lavoro è stato fatto. L'obiezione è seria, e la risposta è un ordine di controlli. Prima «Filtra per»: …

**Rewritten:**
> Il pulsante resta spento con «Nessun intervento con questi filtri», ma il lavoro è stato fatto. La risposta è un ordine di controlli. Prima «Filtra per»: …

**Why:** the button never reads «0 interventi» (`esportazione.js:428-446`: the label carries N only when N > 0; otherwise it reads «Esporta», disabled, with the reason). The persona never invents a UI state. «L'obiezione è seria» described the objection instead of answering it.

### R2 — § 2, «Validazione»

**Original:**
> «Validazione» merita attenzione. Nel modello standard legge un campo dell'esecuzione (`data_m`) che nessun flusso ordinario scrive: né la Verifica, né l'app, né l'esportazione. Lo valorizza solo una procedura di riparazione dell'amministratore che ripristina i dati originali del telefono. Su un modello standard, quindi, «Filtra per: Validazione» seleziona solo le esecuzioni passate da quella procedura, altrimenti nessuna; quante siano in produzione non si ricava dal codice. Non va usato per dire «verificato nel periodo». …

**Rewritten:**
> «Validazione» non vuol dire quello che sembra. Nel modello standard legge un campo dell'esecuzione (`data_m`) che nessun flusso ordinario scrive: né la Verifica, né l'app, né l'esportazione. Lo valorizza solo una procedura di riparazione dell'amministratore che ripristina i dati originali del telefono. Su un modello standard, quindi, «Filtra per: Validazione» trova solo le esecuzioni passate da quella procedura, e un mese pieno di lavoro verificato può dare un pulsante spento. Non serve a cercare il lavoro verificato nel periodo. …

**Why:** «merita attenzione» is assistant filler. «quante siano in produzione non si ricava dal codice» is a research note, and the office reader cannot act on it. The rewrite shows what the reader will see on screen (a button that stays off over a month of verified work) and removes a gloss in guillemets. The «può» keeps the dossier's [UNVERIFIED] on production data honest.

### R3 — § 3, «Ripeti»

**Original:**
> «Ripeti» è comodo, ed è la trappola più facile del capitolo. Ricarica modello, «Filtra per», esito, causali, lista, operatore, lotto, codici e formato, e sposta il periodo in avanti. […] Chi ha corretto un esito di novembre e vuole rimandare novembre non usa «Ripeti» così com'è: reimposta il periodo a mano. Altrimenti al committente arriva dicembre al posto di un novembre corretto.

**Rewritten:**
> «Ripeti» non rifà un'esportazione: prepara la successiva. Ricarica il modello e tutti i filtri, e sposta il periodo in avanti. […] Nel caso di apertura, chi il 3 dicembre preme «Ripeti» sulla riga del 1° dicembre per recuperare le tre esecuzioni mancanti si vede proporre dicembre, non novembre. Per rimandare novembre il periodo si reimposta: con «Mese precedente», o con le date in «Dal» e «Al».

**Why:** «I do not intensify — I specify»: the first sentence now states the rule instead of rating it. The draft's own list of reloaded filters was incomplete (it left out «Cliente», settimana and anno), so «tutti i filtri» is both shorter and truer. Running the trap on the opening case turns an abstract warning into something the reader lives through. It also gives the practical fix, «Mese precedente», which on 3 dicembre is November.

### R4 — § 3, the link (split into two paragraphs)

**Original:**
> Dopo la copia la pagina avvisa: «Link copiato: …» Il link apre il file senza entrare in GOPlanner, e il file contiene dati di utenze: chi ha il link lo apre. Il rischio è reale e va misurato sui fatti. Il link è un codice casuale di 256 bit, […] «Revoca link» lo disattiva subito. La conferma lo dice senza giri: «…» Dopo la revoca chi apre il link legge «…», il file resta nell'elenco e un nuovo «Copia link» produce un link diverso. La regola delle fonti è una: se non serve più, «Revoca link».

**Rewritten:**
> Dopo la copia la pagina avvisa: «Link copiato: …» Il file contiene dati di utenze, e il link lo apre senza entrare in GOPlanner: chi ha il link ha il file, anche se il messaggio è stato inoltrato a qualcun altro. Il rischio ha però confini che si possono misurare. Il link è un codice casuale di 256 bit, non il nome del file; la cartella delle esportazioni non si può sfogliare; ogni apertura del link viene registrata con ora ed esito; il link scade; e solo chi può scaricare il file può crearne il link.
>
> «Revoca link» chiede conferma («…») e agisce subito. Chi apre poi il link legge «…»; il file resta nell'elenco, e un nuovo «Copia link» produce un link diverso. Un link che non serve più si revoca: altrimenti resta valido fino alla scadenza.

**Why:** «La regola delle fonti» leaked the brief's wording («The rule from the source»). The office reader has no «fonti». One paragraph carried two jobs, risk and remedy. The rewrite makes the risk concrete (a forwarded message) and keeps the proportionality guard in the same paragraph, as the Architect required. It adds one balancing fact from the dossier (`esportazione_link()`: only who can download can create the link) and ends on a consequence instead of a slogan.

### R5 — § 1, the formats paragraph

**Original:**
> Tra le opzioni non c'è una voce che dia `.xlsx`, e «XML» si può scegliere ma non è mai stato implementato. Gli altri formati funzionano. Un modello che dichiara un formato proprio ha la precedenza sulla scelta fatta in pagina: […] Per questo «Formato» compare nella riga «Del modello» solo quando il modello non ne fissa uno.

**Rewritten:**
> Tra le opzioni non c'è una voce che dia `.xlsx`, e «XML» si può scegliere ma non è mai stato implementato. Un modello che dichiara un formato proprio ha la precedenza sulla scelta fatta in pagina: […] Per questo «Formato» compare nella riga «Del modello» solo quando il modello non ne fissa uno. La tabella dice che cosa scrive il motore per ciascun formato; per un modello senza formato proprio, lanciato dalla pagina nuova, non è stato provato che la scelta arrivi fino al file. Se il file esce in un formato diverso da quello scelto, o non esce, lo si segnala allo staff tecnico con il nome del modello.

**Why:** dossier [CONFLICT] 15 says that, by code reading, the format chosen in «Del modello» may not be passed on the new page's path. The Writer was told «do not promise the result for such modelli». «Gli altri formati funzionano» promised exactly that. The persona rule is «Se non lo so, non lo scrivo». The rewrite turns the uncertainty into a symptom the reader can recognise, plus a stop point, which is also added to the closing box.

### R6 — § 1, the balance line and the missing counter-objection

**Original:**
> Non è un difetto. L'ufficio decide che cosa parte con il filtro dell'esito e verificando prima di esportare.

**Rewritten:**
> Non è un difetto, ma va saputo prima: su un modello standard la verifica serve a correggere gli esiti prima che partano, e il filtro dell'esito decide se partono i positivi, i negativi o tutti.
>
> Ma se 61 cartelle su 74 hanno un'interrogazione propria, a che cosa servono le regole del modello standard? Servono per tutto ciò che sta intorno alla selezione. La pagina, la coda, il registro, il link, «Ripeti», le durate, l'esclusione delle firme dalle foto e le cause dei fallimenti sono gli stessi su ogni commessa aggiornata, e il conteggio sul pulsante, quando c'è, usa la stessa interrogazione del file. Cambia solo quali esecuzioni entrano: quale data conta, se serve lo stato Controllato, quali filtri della pagina vengono letti. Questo si chiede allo staff tecnico una volta per ogni modello che si usa, e poi vale per tutti i suoi file.

**Why:** the original over-generalised. On commessa queries such as `WHERE esito=1 AND ie.stato_id=6` (dossier line 27) the esito filter does not decide anything. The box had just told the reader that the standard query is the minority case, so the draft left them asking why the rest of the chapter applies to them. The new counter-objection answers with dossier facts (lines 20–21, 55, 132) and ends on one bounded action.

### R7 — § 4, Limite

**Original:**
> La funzione ha confini precisi. Dipende da un aggiornamento della commessa: […] Duplicare, salvare ed eliminare richiedono il permesso di esportare (capitolo 11). E la guida interna della funzione è stata scritta leggendo il codice, senza una prova nel browser: le etichette di questa sezione vengono dal codice.

**Rewritten:**
> «Duplica e modifica» dipende da un aggiornamento della commessa: dove non è stato fatto, la pagina mostra solo i modelli di sistema, e si chiede allo staff tecnico. Un modello con un'interrogazione propria della commessa mostra nell'anteprima solo colonne e titoli, con la frase «…» Lì la data nel formato sbagliato non si vede prima del file: il primo file del modello nuovo si apre e si controlla prima di mandarlo. Duplicare, salvare ed eliminare richiedono il permesso di esportare (vedi il capitolo 11, *Utenti, ruoli e permessi*).

**Why:** the Architect asked for the browser caveat to stay «in the dossier». In the chapter it points to an unnamed «guida interna» and casts doubt on one section when the whole dossier is code-derived. «La funzione ha confini precisi» signposts the Limite function. The rewrite also turns a bare limitation into a consequence with an action: the date-format check praised one paragraph earlier is missing exactly here. The ch.11 cross-reference now carries its exact title.

### R8 — § 3, Limite (prose chain → list)

**Original:**
> Non tutto passa dalla coda. Alcuni modelli restano sincroni di proposito: […] Inoltre registro, link e causa salvata dipendono ciascuno da un aggiornamento della commessa. Senza il registro […]. Senza l'aggiornamento dei link, […] In questi casi si passa allo staff tecnico. Infine, «Esporta in Excel» di una griglia […]: non è un file per il committente.

**Rewritten:**
> Non tutto passa dalla coda, e non tutto c'è su ogni commessa:
>
> - **Modelli sincroni.** […]
> - **Commessa senza il registro.** […]
> - **Commessa senza i link.** […]
> - **«Esporta in Excel» di una griglia.** […] Non è un file per il committente.
>
> Nel secondo e nel terzo caso manca un aggiornamento della commessa, e si passa allo staff tecnico.

**Why:** four different cases were chained with «Inoltre … Infine» in one paragraph of about 190 words. «In questi casi» sat in the middle and did not clearly cover the grid case after it. STYLE_BIBLE § Formato allows bulleted lists to enumerate cases. A list lets the reader find their symptom, and the routing sentence now says exactly which cases go to the staff tecnico.

### R9 — § 5, the PNG case (new subheading, causal link)

**Original:**
> Il caso che ha fissato queste regole è recente. Dal 13 al 16 novembre 2026 l'esportazione delle foto di una commessa falliva sempre, di solito dopo alcuni minuti. Il codice apriva ogni immagine come JPEG, e bastava una foto PNG nel periodo per far fallire tutta l'esportazione. […] Dallo stesso giorno le nuove foto PNG vengono salvate come JPEG; quelle già in archivio non sono state convertite.

**Rewritten:**
> ### Il caso delle PNG, 13–16 novembre 2026
>
> Le due regole vengono da un caso reale. Dal 13 al 16 novembre 2026 […] bastava una foto PNG nel periodo per far fallire tutta l'esportazione; le PNG di quel periodo erano firme. […] Lo stesso giorno le firme sono uscite da ogni esportazione delle foto, e le nuove foto PNG hanno cominciato a essere salvate come JPEG; quelle già in archivio non sono state convertite.

**Why:** the subheading fixes a six-paragraph prose run (the limit is 5). The dossier's [CONFLICT] 1 resolution (code wins: tipo 99 is the firma, and the PNGs of the incident were firme) links the section's two rules to one incident. «Il caso che ha fissato queste regole» stops being a claim and becomes a demonstration. No tipo number is stated in UFFICIO text, as the Architect required.

### R10 — Closing paragraph

**Original:**
> Un file risponde alla domanda posta al momento del lancio, e a nessun'altra. Prima di spedirlo si leggono nel riepilogo il modello, «Filtra per», il periodo, l'esito e il numero, perché è lì che il file si decide. Per rimandare lo stesso periodo dopo una correzione, il periodo si reimposta a mano: «Ripeti» va al periodo successivo. Il file resta 30 giorni, il link non più del file, e quando il link non serve più si revoca.

**Rewritten:**
> Nel caso del 1° dicembre il primo file non era sbagliato: è partito prima che le tre esecuzioni arrivassero. La correzione è un secondo file, non una modifica del primo, e da quel momento esistono due versioni di novembre. Se il primo è partito con un link, al committente va il link del secondo e quello del primo si revoca: chi apre il vecchio link legge che è stato revocato, invece di scaricare 412 righe. Finché sono tra le ultime 15, le due esportazioni restano in «Ultime esportazioni», ciascuna con la sua ora, il suo utente e il suo periodo; quando il committente chiede che cosa ha ricevuto e quando, si risponde da quelle due righe.

**Why:** the original's first sentence restates ch.3's closing («vero … per il momento in cui è stato letto»). Its second copies the «Prima di X si leggono N cose» shape of ch.5 and ch.6. The rest concatenates the § 2 and § 3 sintesi lines. The rewrite closes the loop the opening opened. It adds the one desk rule the chapter had not said: two versions of the same month exist, so revoke the old link and answer from the registro. It does not end on the stato column, which would echo ch.6.

### R11 — § 2, the default settings

**Original:**
> Lasciate così senza pensarci, queste due scelte spiegano buona parte dei file inattesi.

**Rewritten:**
> Lasciate così, danno il mese scorso e solo gli esiti positivi: chi aspettava anche i non eseguiti, o il mese in corso, riceve un file più corto senza che nulla sia andato storto.

**Why:** «buona parte» is a vague quantifier with no count in the dossier (ch.6 lesson: «No vague quantifiers … without a count»). The rewrite says what the defaults produce, and the reader can check it.

## 8. Verdict

**REVIEWER_CORRECTIONS (45/60):** an exact, deeply sourced chapter with real insights, held back by one invented button state, one unverified promise on formats, a closing that echoed three earlier chapters, and a voice that sometimes narrated its own research. 26 blocks were rewritten or added in `chapter_7.md` and 7 one-line fixes applied. § 3 length and the uneven § 4/§ 5 balance remain for the next pass.
