# Review — Capitolo 10. Gea, l'assistente di GOPlanner

Reviewer run: 25 novembre 2026. Read fresh: `PRD.md`, `STYLE_BIBLE.md`, `chapter_10_struttura.md`, `chapter_10.md`, `dossier_chapter_10.md`. Cross-checked the Gea claims in chapters 1, 2, 4, 6 and 8 and the closings of chapters 1–9. Two claims were also checked read-only against `php8` in the GOPlanner repository: the 22 novembre fix (commit `2b7274c43`, which touches `page-actions.ts`, `page-context.ts`, `widget.ts` and `server.ts`) and how conversation memory is deleted (`chatbot-service/scripts/memoria-conversazioni.mjs`, command `dimentica`).

## 1. Executive Summary

The chapter is precise and keeps to its spec. Labels, limits and refusal messages match the dossier word for word. Every section has a Limite. The 22 novembre hook carries the thesis («Gea fa quello che le sue istruzioni scritte e i suoi strumenti le permettono»), and the «Autorizza» tension resolves into a habit, not into fear. Four things kept it below the pass line:

- **The hook told half the story.** It said the fix «è stata una regola scritta». The commit shows the screen reading could not see page messages at all before 22/11. The fix added a rule *and* a reading, which proves the thesis better than the draft did.
- **Factual slips:** «cinque controlli» lists four controls plus the write; «Due colleghi … ricevono lo stesso numero» ignores lotti; «il caso del 22 novembre è nato così» claims an unsourced discovery path; «La memoria si può cancellare su richiesta» does not say whose request (it is a staff-run command).
- **Researcher and developer voice in office prose:** «le fonti non provano» four times, «ramo `php8`» three times, «parametro».
- **Over length** (6.272 words of prose against a hard ceiling of 6.000), part of it a third retelling of the mappatura correction already in chapters 1 and 4.

All fixes are local. Verdict: **corrections applied, 23 paragraphs rewritten.**

## 2. Score: 45/60 → REVIEWER_CORRECTIONS

| Dimension | Score | One-line reason |
|---|---|---|
| Narrative & Structure | 8/10 | Good build: who and where → what to ask → what Gea sees → what she changes → what she sends → where she stops. The hook returns in § 3 and § 6. Weak points: a misplaced «doppio controllo» sentence at the end of the deletion paragraph, a table restated in prose right after the table, and a closing that reuses the «la regola … è una» frame of chapters 2 and 8. |
| Language, Style & Voice | 7/10 | Mostly on-persona: exact labels, short rule sentences after longer ones. Drift: researcher hedging («le fonti non provano» ×4), branch names in office text, an intensifier («va detta senza attenuanti»), meta sentences («Il limite va detto con le parole esatte», «Il nemico di questa guida»), four counter-objections opened with the same «Un dubbio …:» formula. |
| Factual Accuracy | 7/10 | About 140 checkable claims, almost all traced to the dossier. Wrong or overreaching: the hook's account of the fix, «cinque controlli», «stesso numero», «è nato così», memory deletion without an actor. |
| Audience Alignment | 8/10 | All three procedures, all five planned tables and a six-trigger staff box are present. Office readers still meet «ramo `php8`», «pagine pilota … non sono ancora sul ramo» and «parametro», and the chapter is about 5% over its word ceiling. |
| Sensory & Emotional Engagement | 7/10 | § 1 (the 22/11 answer) and § 4 (step 3, the 6.193 deleted interventi) land. § 5 and the second half of § 6 read as catalogues of messages. |
| Originality & Angle | 8/10 | «Gea = written instructions + tools, no more, no less» is a real angle, and «quanti operatori sono attivi» is a sharp example of a rule replacing an opinion. The draft missed the most useful consequence in its own dossier: the daily limit belongs to the commessa, so all its utenti share it. |
| **Total** | **45/60** | |

## 3. Detailed Findings by section

### Opening («In questo capitolo»)
- Format: only the words «*In questo capitolo*» were in italics. STYLE_BIBLE § Formato asks for «un paragrafo in corsivo», and chapters 1–7 and 9 italicise the whole paragraph. **Fixed.** (Chapter 8 has the same defect; not touched here.)

### § 1 — Chi è Gea, dove si apre e chi la vede
- Hook: «Il messaggio era sullo schermo, ma nessuna istruzione scritta le diceva di leggere la schermata per quel tipo di domanda. La correzione, lo stesso giorno, è stata una regola scritta.» Commit `2b7274c43` (22/11/2026 17:12, «Gea legge gli errori e gli avvisi mostrati nella pagina») adds `avvisi` and `errori_pagina` to the screen reading in `page-actions.ts` and `widget.ts`, and changes two lines of the prompt in `server.ts`. Before that day, reading the screen would not have shown the banner either. The dossier [SHADOW] entry records both halves (context `avvisi=N` + prompt rule). The true story proves the thesis sentence that follows it, «istruzioni scritte e … strumenti». **Rewritten (R1).**
- Procedure «Aprire il pannello»: labels all match `widget.ts`. The panel position (in basso a sinistra) agrees with ch.1 and the code ([CONFLICT] 1 resolved correctly).
- «Chi vede il pulsante»: right and complete, including «Nessun permesso dei profili apre o chiude Gea» ([CONFLICT] 7). Limite present.
- DEV box: fine, ≤ 5 lines, with the skip notice.

### § 2 — Che cosa chiedere: domande, indagini e runbook
- «Il nemico di questa guida è il sapere che passa a voce» is the PRD talking about itself. The reader is told what the enemy is instead of being shown it. **Rewritten (R2).**
- «Due colleghi che fanno la stessa domanda ricevono lo stesso numero.» The chapter says three paragraphs earlier that Gea reads «con i vostri lotti e la vostra visibilità», and the operatori-attivi runbook uses that tool (dossier: «Se manca lo strumento di lettura dati (utente con lotti) Gea lo dice»). Two colleagues with different lotti can get different numbers. The definition is what is shared. **Rewritten (R3).**
- «Anche le regole di risposta sono scritte: … Per ogni conclusione dice quale verifica …» The subject changes from «le regole» to an implied Gea. **Fixed.**
- Runbook table: 12 rows, all in the dossier, with the right chapter owners. «L'importazione ha perso righe … poi i registri del file» uses «registri» instead of the dossier's «log», which is correct for office text.
- Counter-objection 1 and the GOP-536 Limite are stated exactly as resolved in [CONFLICT] 2. Good.
- **Cross-chapter flag (not fixed here):** `chapter_1.md:186` says «senza un runbook Gea spiega soltanto», as if the rule were in force. Chapter 10 says, correctly and with its source, that GOP-536 is decided but not active. Chapter 1 should get the chapter 10 wording. Chapter 6 (line 101) agrees with chapter 10 and needs nothing.

### § 3 — Il contesto della pagina
- «Le barriere sono due: il pannello non legge quei campi, e il servizio toglie quelli che passano comunque.» This repeats the two sentences before it. **Cut and merged.**
- «Di base questa lettura è spenta, e le fonti non provano che sia accesa in nessun ambiente.» This is the researcher's note to the writer. The reader needs the operational fact: it is switched by the service, and where it is off Gea sees no foto. **Rewritten (R8).**
- «Un dubbio legittimo:» is a formula (see the persona audit). **Rewritten** as the real asker: «Chi lavora con i dati di altre persone chiede: …».
- After the levels table, «Compilare, filtrare, aprire una finestra e cambiare pagina non chiedono autorizzazione. Modificare dati salvati la chiede sempre.» restates the table. It is replaced by the one rule the table lacks, «Leggere non chiede mai autorizzazione.» (pattern 39 § Livelli, in the dossier).
- «Sul ramo `php8` del 25 novembre 2026 … Le pagine pilota descritte nei documenti di progetto … non sono ancora sul ramo.» Branch and design-doc language in an ALL section. **Rewritten (R8):** «Al 25 novembre 2026 …», with the other pages «previste» (GOP-537/538/539 Da completare).
- «Il limite va detto con le parole esatte.» is a meta sentence. **Cut.** «Infine, la lettura della pagina ha un tempo massimo di 10 secondi» now says what happens: «Se la pagina non risponde entro 10 secondi, la lettura si ferma.»
- [CONFLICT] 10 was handled correctly: the «20 eventi / 10 minuti» from the spec was rightly left out because the code wins.

### § 4 — Le proposte
- «Il passo 3 è quello che conta: una scheda corretta in ogni riga può riferirsi all'intervento sbagliato, e il clic agisce con il vostro nome.» This is the best tension line in the chapter. Kept.
- «Fra il clic e la scrittura passano cinque controlli:» The fifth bullet («solo allora la modifica la fa la stessa funzione …») is the write, not a control. **Rewritten (R4):** four controls, then the write as its own sentence.
- «Il «doppio controllo» … è spento per tutte le operazioni.» sat at the end of the deletion paragraph, where it has nothing to do with deletion. **Moved** to the exclusions paragraph, with what it means today: only the person who asked for the proposta authorises it.
- «Un esempio completo: la mappatura» was 190 words and the third full telling of the same mechanism (ch.1:188 and ch.4 § «La correzione con Gea» already give the copy «NOME (aggiornato)», the once-only «Ripristina», the permesso and the missing-history refusal). It is cut to the part that belongs to this chapter: why the mappatura is the declared exception (a whole model, not one record). **Rewritten (R6),** about 70 words shorter.
- «Il registro conserva 12 mesi» is unidiomatic. «Le fonti non provano che il registro esista in ogni database di produzione» is researcher voice again. Dossier [CONFLICT] 4 gives the operational fact: the register row is written before the proposta is returned, so without the table no proposta appears. **Rewritten (R7).**
- «Il dubbio che tutti si pongono:» overstates («tutti») and repeats the formula. **Rewritten:** «Resta l'errore di mano: …».
- «C'è una cosa che Gea non può fare, e va detta senza attenuanti:» intensifies, and the persona specifies instead. «sono stati recuperabili» is ungrammatical. **Rewritten (R5).**

### § 5 — Il ticket dalla chat
- Step 1 quoted the prompt's whole example, «… Puoi dividere gli interventi in gruppi da mille. …». Out of context it puzzles the reader (which interventi? why a thousand?). It is cut to the question that matters to the reader. **Fixed.**
- «Questo percorso è sul ramo `php8` dal 25 novembre 2026; le fonti non provano ancora che sia rilasciato in produzione» is branch and researcher voice. **Rewritten (R8).**
- The ticket failure table, the allegati quote and the idempotency sentence all match `widget.ts` and `TicketService.php`. The column «Che cosa fare» gives a cause, not an action, in two rows («il limite è 50 ticket in 24 ore», «il testo è vuoto …»). Optional fix.
- «Rispondere con esattezza è quello che tiene veloci le urgenze vere.» is factual and does not moralise. Good.

### § 6 — Che cosa Gea non fa
- Table row «non accetta una commessa come parametro»: «parametro» is code vocabulary. **Rewritten.** Row «non ha questa informazione e non deve inventarla»: the dossier does not say what Gea knows, only that her instructions forbid promises. **Rewritten** to the sourced reason.
- «il caso del 22 novembre è nato così, da una risposta sbagliata diventata una regola scritta.» The dossier does not say the 22/11 case was found by reviewing recorded conversations. **Rewritten** so it no longer claims how the case was found (R1 follow-through).
- «La memoria si può cancellare su richiesta.» Whose request, made to whom? `memoria-conversazioni.mjs dimentica <tenant> <id utente>` is a staff-run command that deletes all of one person's conversations. **Rewritten (R9)**, with the source added to Fonti.
- Daily limit: the draft says «la commessa ha esaurito le richieste del giorno» but never says what follows for the reader. The limit is shared, so one colleague's long investigation spends everyone's quota (dossier `cost-cap.ts`: key per tenant and day). **Added** in eight words.
- Closing: «La regola da tenere sulla scrivania è una.» reuses the frame of ch.2 («Resta una regola da usare …») and ch.8 («La regola di questa sezione, che è anche quella del capitolo …»). STYLE_BIBLE persona: «My ending cannot echo any previous chapter.» **Rewritten (R10)** as an action at the two buttons that matter.

### Fonti
- Complete for the claims used. One line added: `codice: chatbot-service/scripts/memoria-conversazioni.mjs`.
- The four HTML comments at the end appear in every chapter (pipeline convention). Their «WORD COUNT ~6.500» is now stale (prose is about 6.260). Left to the pipeline.

## 4. Persona Audit

**Verdict: on persona for about 90% of the text, with one systematic drift.** The Engineer + Scholar is present where it counts: every label is quoted as it appears on screen, every number has its unit and its source, and functions that are only partly live are conditioned («dove è attiva»), never presented as general. Code stays in DEV boxes that tell office readers to skip them. The short-rule-after-long-explanation rhythm holds (for example «Il passo 3 è quello che conta: …»; «Una correzione che non si può annullare non si fa.»).

The drift is **the pipeline's voice leaking into the reader's text**:

| Drift | Occurrences (draft) | Why it is off-persona |
|---|---|---|
| «le fonti non provano …» | 4 (foto, registro, funzioni, memoria) | The persona says «Se non lo so, non lo scrivo.» A sentence about the evidence the writer has is a note to the editor. The reader needs the operational fact (switched by the service; without X, Y happens) plus the single «chiedete allo staff tecnico se è accesa» that § 6 already gives. |
| «ramo `php8`», «non sono ancora sul ramo», «parametro» | 4 | Developer vocabulary in [TUTTI] sections, with no skip notice. |
| «va detta senza attenuanti», «Il dubbio che tutti si pongono» | 2 | Intensifying. Activation phrase 2: «I do not intensify — I specify.» |
| «Il limite va detto con le parole esatte», «Il nemico di questa guida …» | 2 | Meta sentences: the text describes its own rules instead of applying them. |
| «Un dubbio ricorrente: / Un dubbio legittimo: / Il dubbio che tutti si pongono: / Una domanda tocca da vicino …» | 4 | One formula for every counter-objection. The reader starts to see the template. |

All of these are fixed except «Un dubbio ricorrente» (§ 2, kept because one formula use alone is fine) and the § 6 «Una domanda tocca da vicino la riga sui colleghi», which reads naturally.

## 5. Counter-Objection Check and Litmus Test

| # | Where | Objection as written | Strongest form? | Response evidence-based? |
|---|---|---|---|---|
| 1 | § 2 | «Gea mi ha detto che non ha trovato problemi: allora non c'è niente?» | Yes, this is the dangerous one, because the user stops looking. | Yes: the prompt rule «una singola ricerca ristretta … non permette mai di concludere», the obligation to name the register and period, «fino a 7 giorni». It also admits what is left over («un problema che non lascia tracce nei registri che Gea legge»). Best of the four. |
| 2 | § 3 | «Gea legge tutto quello che ho sullo schermo?» | Yes, and the answer adds the uncomfortable truth (unsaved values are read) with a practical defence («fate la domanda prima di scriverlo»). | Yes: `page-actions.ts` exclusions, 50 rows, 48 KB. |
| 3 | § 4 | «E se premo "Autorizza" per sbaglio?» | Yes. | Yes, and honest: «l'annullamento delle modifiche eseguite non esiste ancora (GOP-528)». It ties back to step 3. |
| 4 | § 6 | «Posso chiedere a Gea che cosa ha fatto un collega?» | Medium: it repeats § 2 «Sui colleghi c'è una regola precisa». | Yes (`web-activity.ts`). Optional cut if words are needed. |

**≥ 2 present: yes (4).** A stronger form was available and is still missing: *«Se Gea mi propone una modifica, la responsabilità è sua o mia?»* The chapter answers it implicitly (the click uses your session and permessi, and the activity records «su autorizzazione dell'utente») but never asks it. Optional for the Editor.

**Litmus test — «I lived this» or «I was told this»?**
- § 1 and § 4: *lived*. The reader watches Gea say «non vedo nessun errore» while the banner is on screen, and after R1 learns that two things were missing. They hold the proposta card and know which step stops a wrong click. The 6.193 deleted interventi make «senza promesse» real.
- § 2: *shown*. The operatori-attivi example is a real argument settled by a written definition.
- § 5 and the second half of § 6: *told, but usable*. These are catalogues of messages, which is what a reader at the desk will search for. They do not need to be narrative, but neither has a case. Optional: one short case of an urgent ticket (Sì → immediate alert → what the staff received without asking again), if the dossier can supply one without personal data.

A new back-office colleague with only this chapter can do the five things in the spec's litmus test: find Gea and explain a missing button; ask the right import question and judge the answer; decide a proposta knowing what the click does; open an urgent ticket without retyping the context; name what Gea will never do.

## 6. Priority Improvements

### Critical (applied)
1. **Hook (§ 1):** the fix was a rule *and* a new reading of the page messages, not only a rule (commit `2b7274c43`). The § 6 echo was aligned with it. → R1.
2. **«cinque controlli» (§ 4):** four controls, then the write. → R4.

### Important (applied)
3. «Due colleghi … stesso numero»: the same definition; the number changes with the period and the lotti. → R3.
4. Memory deletion: done by the staff tecnico, all of one person's conversations; source added. → R9.
5. Researcher and developer voice removed: «le fonti non provano» ×4, «ramo `php8`» ×3, «parametro», «pagine pilota … sul ramo». → R7, R8.
6. Unsourced causal claim «il caso del 22 novembre è nato così» → «mostra dove porta una risposta sbagliata».
7. Mappatura example cut to the part chapter 10 owns. → R6.
8. Deletion paragraph: intensifier and grammar fixed; «doppio controllo» moved to where it belongs. → R5.
9. Closing no longer echoes the «la regola … è una» frame of chapters 2 and 8. → R10.
10. Shared daily limit stated («in comune fra tutti i suoi utenti»).
11. «In questo capitolo» italicised in full.
12. Counter-objection formulas varied; table restatement in § 3 replaced by «Leggere non chiede mai autorizzazione.»; meta sentence «Il limite va detto …» cut.

### Important (not applied: for the Editor)
13. **Length.** Prose is now about 6.260 words against the spec's hard ceiling of 6.000 (PRD: 4.000–6.000). Chapters 1–9 run over as well, so this is a series pattern, but the spec for this chapter is explicit. Cut list for about 260 words, with no NUF lost: (a) merge the two § 5 table rows that end in «riprovate fra un minuto, poi il menu Ticket» (HTTP error / unreadable answer) into one row (−20); (b) drop counter-objection 4 in § 6, already covered by § 2 «Sui colleghi …» and the table row (−50); (c) in § 2 «Per indagare Gea legge», drop the first bullet's «con l'utente, i conteggi e i motivi degli scarti (capitolo 4)», which the runbook table already says (−12); (d) merge the «Spiegamelo meglio» and «Ti presentiamo Gea» paragraphs in § 1 (−25); (e) in § 5 «Che cosa parte insieme al ticket», drop «Utente e commessa vengono dall'accesso e non si modificano.», which the quoted card already implies (−10); (f) trim § 6 «Le conversazioni» first paragraph to two sentences (−25); (g) in § 2, merge the Limite paragraph's two timeout messages into one sentence, keeping the verbatim text only in § 6 (−30); the rest from line-level tightening.
14. **Chapter 1, line 186:** «senza un runbook Gea spiega soltanto» contradicts [CONFLICT] 2 (GOP-536 not in force). Replace it with the chapter 10 wording: «la regola "senza un runbook Gea spiega e basta" è decisa ma non ancora in vigore (GOP-536)». No `chapter_index.md` exists yet to record this in.

### Optional
15. § 5 failure table: make the two «cause» cells into actions («il limite è 50 ticket in 24 ore: riprovate il giorno dopo, o scrivete allo staff tecnico se è urgente»).
16. Add the responsibility counter-objection (see § 5 above) in § 4 «Che cosa succede al clic», one sentence.
17. One short real case for § 5 (urgent ticket) if the Researcher can supply it without personal data.
18. Chapter 8, line 3: the same «*In questo capitolo*» italics defect.

## 7. Rewritten Paragraphs

### R1 — The hook (§ 1)
**Original:**
> Il 22 novembre 2026, nella pagina di importazione, un utente ha chiesto a Gea spiegazioni su un errore che aveva davanti: «I modelli salvati non sono attivi per questo tenant». Gea ha aperto la guida della pagina File e ha risposto di non vedere nessun errore. Il messaggio era sullo schermo, ma nessuna istruzione scritta le diceva di leggere la schermata per quel tipo di domanda. La correzione, lo stesso giorno, è stata una regola scritta. Da allora, quando l'utente chiede di un messaggio che vede, Gea legge la schermata anche dopo aver aperto una guida, e non può dire di non vedere l'errore senza averla letta.

**Rewritten:**
> Il 22 novembre 2026, nella pagina di importazione, un utente ha chiesto a Gea spiegazioni su un errore che aveva davanti: «I modelli salvati non sono attivi per questo tenant». Gea ha aperto la guida della pagina File e ha risposto di non vedere nessun errore. Mancavano due cose. Nessuna istruzione scritta le diceva di leggere la schermata per quel tipo di domanda, e la lettura della schermata non comprendeva i messaggi mostrati dalla pagina. La correzione, lo stesso giorno, le ha aggiunte entrambe: la lettura ora riporta i messaggi di errore e di avviso, e una regola scritta impone di leggerla quando l'utente chiede di un messaggio che vede, anche dopo aver aperto una guida. Gea non può più dire di non vedere un errore senza aver letto la schermata.

**Why:** the draft's account was half true. Commit `2b7274c43` adds `avvisi` and `errori_pagina` to the screen reading and changes the prompt, so even a rule alone would not have shown Gea the banner. The corrected story is also the stronger one. The next paragraph says «Gea fa quello che le sue istruzioni scritte e i suoi strumenti le permettono», and now the hook shows one of each going missing and being added. The thesis is shown before it is stated.

### R2 — Opening of § 2
**Original:**
> Il nemico di questa guida è il sapere che passa a voce: «chiedi a chi c'era». Gea lo sostituisce solo quando segue un'istruzione scritta.

**Rewritten:**
> In ufficio molte risposte si ottengono chiedendo a chi c'era, e cambiano con la persona a cui si chiede. Quelle di Gea non cambiano solo dove Gea segue un'istruzione scritta.

**Why:** «il nemico di questa guida» is the PRD's vocabulary, so the book is talking about its own brief. The rewrite states the problem the reader knows (answers vary with who you ask) and sets up the operatori-attivi example, which shows a written definition ending that variation.

### R3 — The surgical example (§ 2)
**Original (last sentence):**
> Due colleghi che fanno la stessa domanda ricevono lo stesso numero.

**Rewritten:**
> Due colleghi che fanno la stessa domanda ricevono la stessa definizione; il numero cambia solo con il periodo e con i lotti che ciascuno vede.

**Why:** the chapter itself says Gea reads «con i vostri lotti e la vostra visibilità», and the runbook depends on that data tool. A reader whose number differs from a colleague's would decide the chapter, or Gea, is wrong. The rewrite keeps the point (the definition no longer depends on who answers) and names the two legitimate sources of difference.

### R4 — What happens at the click (§ 4)
**Original:**
> Fra il clic e la scrittura passano cinque controlli:
> […four control bullets…]
> - solo allora la modifica la fa la stessa funzione che usa la pagina del gestionale, e il prima e il dopo vengono registrati.

**Rewritten:**
> Fra il clic e la scrittura passano quattro controlli:
> […the same four control bullets…]
>
> Solo dopo il quarto controllo la modifica la fa la stessa funzione che usa la pagina del gestionale, e il prima e il dopo vengono registrati.

**Why:** a technical guide that miscounts its own list loses the skeptical reader at the most safety-critical point of the chapter. The write is the result of the controls, not one of them. Setting it apart also makes the order visible: nothing is written until all four have passed.

### R5 — Deleted interventi (§ 4)
**Original:**
> C'è una cosa che Gea non può fare, e va detta senza attenuanti: non può riportare in vita un intervento eliminato. L'eliminazione è fisica; nel gestionale non resta nulla da ripristinare. Il 12 ottobre 2026, su una commessa, 6.193 interventi di un solo carico sono stati recuperabili solo da un backup del database. Il recupero è una decisione dello staff tecnico, senza promesse. Per gli appuntamenti del call center il problema non si pone: si annullano, non si cancellano (capitolo 6). Il «doppio controllo», cioè un secondo utente che autorizza, esiste nel codice ma è spento per tutte le operazioni.

**Rewritten:**
> Gea non può riportare in vita un intervento eliminato. L'eliminazione è fisica: nel gestionale non resta nulla da ripristinare. Il 12 ottobre 2026, su una commessa, 6.193 interventi eliminati di un solo carico si sono potuti recuperare soltanto da un backup del database. Il recupero è una decisione dello staff tecnico, senza promesse. Per gli appuntamenti del call center il problema non si pone: si annullano, non si cancellano (capitolo 6).

**Why:** «va detta senza attenuanti» announces gravity instead of letting the number carry it, and the number is strong enough on its own. «sono stati recuperabili» is ungrammatical. The «doppio controllo» sentence has nothing to do with deletion. It now sits in the exclusions paragraph, with its practical meaning: «oggi autorizza solo chi ha chiesto la proposta».

### R6 — The mappatura example (§ 4)
**Original (190 words):**
> La procedura completa è nel capitolo 4; qui serve come esempio del meccanismo. La scheda elenca, campo per campo, la colonna di prima e quella di dopo, e la riga «Riconoscimento automatico del file». […] altrimenti la scheda risponde «Non posso ripristinare: il modello è stato cambiato dopo la correzione. Si modifica dalla pagina Importazione.». Dove manca lo storico delle correzioni Gea non propone nulla e risponde «Le correzioni di Gea non sono ancora attive per questo tenant: manca lo storico delle modifiche, che permette di annullarle. La mappatura si corregge dalla pagina Importazione.». Una correzione che non si può annullare non si fa.

**Rewritten (about 120 words):**
> La procedura completa è nel capitolo 4. Qui la mappatura mostra il meccanismo nel suo caso più largo, perché tocca un modello intero e non un record. La scheda elenca campo per campo la colonna di prima e quella di dopo, più la riga «Riconoscimento automatico del file». Serve il permesso «Importare interventi», controllato all'anteprima e di nuovo al clic. Un modello di sistema non si tocca: Gea ne crea una copia, «NOME (aggiornato)». Dopo «Autorizza» Gea rifà la verifica sul file e dice se ora è conforme al modello. «Ripristina» rimette il modello com'era, una volta sola e solo se nessuno lo ha cambiato dopo. Dove manca lo storico delle correzioni Gea non propone nulla, e la mappatura si corregge dalla pagina Importazione: una correzione che non si può annullare non si fa.

**Why:** this was the third full telling (ch.1:188, ch.4 § «La correzione con Gea», here). STYLE_BIBLE § Pacing: «Un capitolo non ripete la spiegazione di un concetto che appartiene a un altro capitolo». The rewrite keeps what chapter 10 adds, why this proposta is the exception to «un record alla volta», and drops two verbatim messages already paraphrased in ch.4. That saves about 70 words in an over-length chapter.

### R7 — The register and the third counter-objection (§ 4)
**Original:**
> […] Il registro conserva 12 mesi. […] Le fonti non provano che il registro esista in ogni database di produzione; dove manca, però, non nasce nessuna proposta e nessun dato cambia.
>
> Il dubbio che tutti si pongono: «E se premo "Autorizza" per sbaglio?».

**Rewritten:**
> […] Le righe del registro restano 12 mesi. […] Il registro viene scritto prima che la proposta compaia: dove manca, non nasce nessuna proposta e nessun dato cambia.
>
> Resta l'errore di mano: «E se premo "Autorizza" per sbaglio?».

**Why:** «le fonti non provano» is the dossier's [UNVERIFIED] tag carried into prose. Dossier [CONFLICT] 4 gives the mechanism («l'inserimento nel registro avviene prima che la proposta sia restituita»), and the mechanism is what reassures the reader. «Il registro conserva 12 mesi» lacks an object. «Il dubbio che tutti si pongono» overstates and repeats the counter-objection formula.

### R8 — Researcher and branch voice (§ 3, § 5, § 6)
**Original (four passages):**
> Di base questa lettura è spenta, e le fonti non provano che sia accesa in nessun ambiente.
>
> Sul ramo `php8` del 25 novembre 2026 una sola pagina dichiara azioni a Gea: […] Le pagine pilota descritte nei documenti di progetto (Clienti e Interventi, Utenze, Verifica interventi) non sono ancora sul ramo. Sulle altre pagine Gea spiega dove fare clic, e il clic lo fa l'utente.
>
> Questo percorso è sul ramo `php8` dal 25 novembre 2026; le fonti non provano ancora che sia rilasciato in produzione, quindi vale dove è attivo.
>
> Tabella e messaggi descrivono il ramo `php8` al 25 novembre 2026.

**Rewritten:**
> Di base questa lettura è spenta: si accende con un interruttore del servizio, e dove è spenta Gea non guarda nessuna foto.
>
> Al 25 novembre 2026 una sola pagina dichiara azioni a Gea: […] Altre pagine (Clienti e Interventi, Utenze, Verifica interventi) sono previste ma non hanno ancora azioni per Gea. Altrove Gea spiega dove fare clic, e il clic lo fa l'utente.
>
> Le richieste di funzione sono la parte più recente di Gea, arrivata il 25 novembre 2026: valgono dove sono già attive.
>
> Tabella e messaggi descrivono GOPlanner al 25 novembre 2026.

**Why:** these are [TUTTI] sections. A supervisor of operatori has no use for «ramo» or «documenti di progetto». The facts are unchanged (`CHATBOT_FOTO_PAGINA` default off; GOP-537/538/539 Da completare; GOP-874 code on `php8`, release unproven), but each is now said as something the reader can act on. § 6's existing line «chiedete allo staff tecnico se sulla vostra commessa è accesa» covers the uncertainty once, in the right place.

### R9 — Conversation memory (§ 6)
**Original:**
> La memoria si può cancellare su richiesta. La funzione è accesa nel codice, ma si riempie solo se gira un processo giornaliero, e le fonti non provano che giri in produzione: per questo vale «dove è attiva».

**Rewritten:**
> Per cancellarla si chiede allo staff tecnico, che toglie tutte le conversazioni di quella persona. La memoria si riempie solo se gira un processo giornaliero del servizio: senza, Gea non ricorda nulla, anche se la funzione risulta accesa.

**Why:** «su richiesta» leaves the reader to try «Gea, dimentica tutto» in the chat. The code (`memoria-conversazioni.mjs dimentica <tenant> <id utente>`) shows it is a staff operation that removes all of that person's conversations. That is a privacy fact the reader needs. The second sentence turns researcher doubt into the observable symptom (the function is on, but Gea remembers nothing).

### R10 — Closing
**Original:**
> La regola da tenere sulla scrivania è una. Gea legge, indaga e prepara; l'ultimo clic è sempre vostro. Nessun dato cambia e nessun ticket parte senza un pulsante premuto da voi, con i vostri permessi. Quello che nessun pulsante può fare, come recuperare dati eliminati, guardare un'altra commessa o promettere una data, si chiede allo staff tecnico.

**Rewritten:**
> Prima di premere «Autorizza» o «Apri il ticket» si legge che cosa portano con sé: un record con il suo prima e dopo, oppure un testo che lo staff tecnico riceverà insieme alla vostra conversazione. Gea legge, indaga e prepara; il clic è vostro e agisce con i vostri permessi. Quello che nessun pulsante del pannello può fare, come recuperare dati eliminati, guardare un'altra commessa o promettere una data, si chiede allo staff tecnico.

**Why:** «La regola … è una» is the closing frame of ch.2 («Resta una regola da usare …») and ch.8 («La regola di questa sezione …»), and the persona forbids echoing an earlier ending. The rewrite keeps the spec's closing promise (the last click is the user's; the rest goes to the staff tecnico) and opens on an action at the two buttons that matter, in the same place the chapter's tension built up (step 3 of the proposta, the ticket's allegati).

## 8. Verdict

**REVIEWER_CORRECTIONS — 45/60.** A precise, well-sourced chapter whose hook understated its own thesis, with a few factual slips and the pipeline's voice leaking into office prose. 23 paragraphs were rewritten in `chapter_10.md`. Still open: about 260 words over the ceiling (cut list in § 6, item 13) and the chapter 1 line 186 contradiction about GOP-536.
