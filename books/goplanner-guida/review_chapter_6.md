# Review — Capitolo 6. Interventi, esiti e verifica

Reviewer run: 25 novembre 2026. Read fresh: `PRD.md`, `STYLE_BIBLE.md`, `chapter_6_struttura.md`, `chapter_6.md`, `dossier_chapter_6.md`. Two claims were also checked read-only against code on `php8` (`lib/ChatbotStrumentoRiaffidaIntervento.php`, `lib/ChatbotStrumentoCambiaDataIntervento.php`) and `wiki/assistenza-clienti/riaffida-intervento.md`.

## 1. Executive Summary

The chapter is close to the dossier. Labels are exact, codes are right, error messages are quoted word for word, and every section has a Limite. The two-records thesis (`interventi` vs `interventi_eseguiti`) runs through the whole chapter. A skeptical back-office reader would trust it. Four things kept it under the pass line:

- one internal contradiction: deleting the precedente «loses» its count in the carico, and the counter-objection right after says the count is the same either way;
- one invented chapter title for chapter 12;
- two safety chains it set up but never connected: «Verificato» on an «Interventi mancanti» row locks out the phone's later send, and Inviato (7) does not prove delivery, although the closing rule depends on knowing it;
- an irreversible-loss path («Cancella precedente» missing from the window) left without a decision rule.

All fixes are local. Verdict: **corrections applied, 14 paragraphs rewritten** (12 replaced, 2 new boxes).

## 2. Score: 47/60 → REVIEWER_CORRECTIONS

| Dimension | Score | One-line reason |
|---|---|---|
| Narrative & Structure | 8/10 | Clean build (stati → two records → office buttons → Ripianifica → Verifica → AI) with a sintesi line per section. The hook's lesson did not follow from its story, and the closing was folded into § 6 with «quindi» as if it followed from the AI section. |
| Language, Style & Voice | 8/10 | Short rule sentences after long explanations, on-persona. A few drifts: a style-bible instruction leaked into the text, vague quantifiers, one «come si è visto». |
| Factual Accuracy | 8/10 | About 150 checkable claims, almost all traced to the dossier. Problems: one contradiction, one invented title, «ha preso il posto di undici versioni» (overclaim), Inviato written as «quando il dato è stato consegnato», «compare nel Piano» (not in the dossier). |
| Audience Alignment | 8/10 | Procedures, tables, Limite and DEV boxes are what the back office needs. Missing: what to do when «Cancella precedente» is absent, the «Interventi mancanti» trap, one place that says when to call the staff tecnico. |
| Sensory & Emotional Engagement | 7/10 | Strong in § 1–§ 4 (the ripianificato with three foto, the sick operatore, the silent skip). § 5 and the settings subsection of § 6 read like a list of labels. |
| Originality & Angle | 8/10 | «The button you press decides what remains» is a real angle. The «now or never» choice and the silent skip are insights. It missed the two strongest consequences already in its own dossier (mancanti + Verificato; Inviato ≠ delivered). |
| **Total** | **47/60** | |

## 3. Detailed Findings by section

### Opening and § 1 — Gli stati di un intervento

- **Leaked instruction.** «Un esempio inventato, dichiarato come tale.» This copies STYLE_BIBLE § Concreteness («dichiarati come tali») into the prose. The reader needs to know the case is invented, but not in the words of the style rule.
- **Non sequitur.** The hook ends «Il pulsante ha fatto quello che fa su quella commessa», which is a commessa setting. The next line says «Il primo dato da leggere è sempre lo stato.» In the story the stato (a normal non fattibile) would have warned nobody. The chapter's real thesis has two parts, stato and commessa configuration, and the hook should set up both.
- **Unsourced detail.** «Il nuovo intervento compare nel Piano.» The dossier says the utenza becomes Assegnata and «l'operatore la vede nell'app».
- **Overclaim on Inviato.** «Infine, quando il dato è stato consegnato al committente, l'esecuzione passa a Inviato (7).» The dossier finds 7 written only by `importazione_inviati`, a legacy readings export (`export_letture_aceaA4.inc.php`) and an admin repair. Tenant exports show only commented-out lines (UNVERIFIED item). The table row («l'importazione di un file di inviati; alcune esportazioni») is right; the prose is not. This matters because the closing rule and the § 4 rule («tienilo se è stato… inviato o esportato») depend on the reader knowing whether an esito left. The stato column cannot tell them.
- «Due righe chiedono una spiegazione», but the paragraph explains three (8, 9, 10).
- Strong: the Limite on stati 9/10 missing from older seeds, and «le fonti non dicono che cosa mostri la colonna «Stato» per un Utente assente». This is the persona's «se non lo so, non lo scrivo» done well.

### § 2 — Intervento ed esecuzione

- Wrong cross-reference: «vedi il capitolo 12, *Assistenza e diagnosi*». No chapter has this title. PRD: chapter 12 is *Strumenti di amministrazione e diagnostica* (*Assistenza e amministrazione* is the name of Parte III).
- «a ogni intervento corrisponde al massimo una esecuzione»: missing elision («un'esecuzione»).
- «Un'esecuzione contiene parecchio.» A vague quantifier in a paragraph that then lists exact columns. The list makes the point by itself (kept, but noted).
- The Limite answers the spec's «resend can overwrite» point carefully (CONFLICT 10 respected). It does not cover the spec's other Limite item, «no button to re-create an esecuzione lost on the phone». The Writer's own ANTI-AI note admits this. The fix went into § 5, where the mechanism lives (see below).

### § 3 — Modifica, Annulla, Elimina

- **Stakes misdescribed.** «Un Eseguito, un Non fattibile, un Controllato, un Inviato, un Ripianificabile restano come sono… Il risultato, se nessuno guarda, è un operatore che non riceve l'intervento e un'utenza che nessuno visita.» A skipped Eseguito or Controllato needs no visit, so skipping it is harmless. The real damage comes from the skipped stati that still need a visit: Prenotato (10), Non fattibile (5), Ripianificabile (8), Utente assente (99). Prenotato and Utente assente were missing from the prose list.
- **Gea.** «con lo stesso meccanismo di «Modifica»». Verified in code: both Gea tools (`riaffida_intervento`, `cambia_data_intervento`) apply the same Assegnato/Annullato rule, but they **refuse with an error** (`stato_non_riaffidabile`, `intervento_non_modificabile`) where the button skips without a message. This difference helps the reader and is now stated. The source is code on `php8`, not the dossier: the Researcher should add it to the dossier.
- **Annulla.** The dossier says `annulla_intervento` «does not update the utenza». The chapter left this out, though it explains a common «perché l'utenza risulta ancora assegnata» question (an Enemy item in the PRD).
- «riceveva un errore 404, cioè «risorsa non trovata»»: guillemets mark UI labels. A gloss is not a label.
- Strong: the Mappa «Elimina» warning («tutti gli interventi non chiusi dell'operatore e non solo quelli del giorno») follows the code against the brief (CONFLICT 13). Good catch, worth keeping.

### § 4 — Ripianifica e il precedente

- **Internal contradiction (critical).** The loss list ends «il conteggio tra i non fattibili del carico». Eight lines later the counter-objection says, correctly from `AvanzamentoCarichi`, that after a ripianificazione the old one leaves the count anyway. Deleting it therefore loses nothing from the carico. A careful reader catches the contradiction and stops trusting the list.
- **Irreversible path without a rule (critical).** «se la finestra mostra «Cancella precedente», la commessa ha gli interventi multipli». The reader will take the converse: no field, so the old one is kept. On a commessa without the field the old one is the one that **always** disappears. The paragraph needed the worst-case rule and a stop point.
- «nel codice sono la maggioranza delle cartelle»: «cartelle» is a code concept in UFFICIO text. The claim is right (CONFLICT 1: 47 of 73 configurations), and the wording now avoids the word.
- Length: 713 words against a 900–1.200 target. It is dense, not thin, so no padding was added.

### § 5 — Rapporti › Verifica interventi

- **Overclaim + ambiguity.** «la Verifica unica, che ha preso il posto di undici versioni diverse della stessa pagina … al 24 novembre 2026 sono undici configurazioni». CONFLICT 5: the old pages are still in use (11 core files + 79 tenant copies), so nothing «ha preso il posto» yet. And the two «undici» count different things (JS variants, tenant folders, one of which is `sg_smat_test`).
- **Dangling consequence.** «Su un intervento già Inviato, Invio non funziona (…); il clic del mouse invece sì.» Sì *what*? The click writes stato 6 on a 7. The reader has to be told that this is the effect, and that the keyboard guard exists to stop it happening by accident.
- **Unconnected chain (critical).** The section says «Se l'intervento era fra gli «Interventi mancanti», senza esecuzione, la riga dell'esecuzione viene creata in quel momento». It also says «dopo «Verificato» nessun invio dall'app le sovrascrive». Put together: verifying a «mancante» while the data is still on the phone creates an empty Controllato esecuzione, and the late send is then refused (GOPlanner 3: 409 `intervento_locked`) or silently ignored (legacy, `isBlockedByBackoffice`). That is the most likely way the office could lose field data, and the chapter had both halves without connecting them. It is derived from dossier facts (`verificaImpostaStato`, `EsitoWriter`, `isBlockedByBackoffice`), not from a recorded incident. The Editor should keep the wording as a consequence, not as a case.
- «come si è visto nella sezione sull'esecuzione»: in the family of banned pattern 2 (no chapter number). Replaced with an explicit pointer.
- Strong: the «Esito» vs «Esito intervento» paragraph (glossary trap 1) is the clearest in the chapter. «Verificato» = Controllato (6) with the two on-screen labels (CONFLICT 6) is stated once, exactly as the spec asked.

### § 6 — L'analisi AI delle foto

- «L'ultima regola ha una storia», but the GOP-738 story explains two rules (seal and multiple foto).
- «la lettura ha una tolleranza predefinita di 2»: no unit. The dossier gives none (Researcher gap; not invented here).
- `### Le istruzioni dell'AI` lists more than twenty labels in two paragraphs and never says *why* the banco di riferimento exists: to catch a rule that makes results worse before it goes live. The «Attiva comunque» confirmation only makes sense once the reader knows that. Optional fix, not applied.
- **Closing.** «Prima di qualunque azione su un intervento servono quindi due risposte…». The «quindi» makes a chapter-level rule look like a conclusion of the AI section. «Se una delle due non ha risposta, ci si ferma e si chiede allo staff tecnico» sends the reader to the staff even in the case where the chapter's own rule («nel dubbio, tienilo») already answers. The «when to ask» items (NUF emotional 2) were spread over four sections and are now collected in one `> **Quando chiedere allo staff tecnico:**` box.
- Section length: 1.292 words including the chapter closing (cap 1.200). Acceptable, because the closing is chapter-level.

### Fonti

- «Jira: GOP-674 — Analisi AI delle foto (epic); GOP-718, GOP-738»: two keys without titles, against the STYLE_BIBLE format.
- Missing sources for claims in the text: `js/code/industry.js` (stato tag), `json.php` (`stato_select`, `del_interventi`), the GOP-319 migration (18 settembre 2026), `pages/file.php` (inviati), `lib/AnalisiAiCatalogo.php` (check names and tolerances), `lib/AnalisiAiPrompt.php` (hidden values), `lib/AnalisiAiRevisione.php` (blocking), GOP-807 (3.644 interventi), GOP-721 (Gea rule), the commessa-specific return-file rule. All added.
- **Captain decision:** Fonti now cites `custom/easy_iren/php/InterventoEseguito.php` for the return-file rule, while the body still says «una commessa». The PRD allows tenant names «con parsimonia» and makes verifiability a hard constraint. If anonymity in Fonti is preferred, replace it with `custom/{commessa}/php/InterventoEseguito.php` and accept the loss of verifiability.

## 4. Persona Audit

**Verdict: on persona (The Engineer + The Scholar Who Can Write), with small drifts, now removed.**

On persona:
- «Il pulsante ha fatto quello che fa su quella commessa, e chi lo ha premuto non lo sapeva.» Kidder: what the system does, told without blame.
- «Il rischio ha una misura precisa. Non si rompe niente: l'intervento saltato è identico a prima…» The persona's «I do not intensify — I specify»: risk paired with proportion, as the spec's guards require.
- «Le fonti non indicano un modo per riportare un intervento annullato allo stato precedente dal back office.» «Se non lo so, non lo scrivo», said openly instead of guessed.
- «L'AI legge la foto; il confronto lo fa il gestionale.» One sentence that explains the machine.

Drift (fixed):
- «Un esempio inventato, dichiarato come tale.» This is the bureaucratic register of the style bible, not the voice.
- «come si è visto nella sezione sull'esecuzione». An assistant's connective.
- «Un'esecuzione contiene parecchio.» A soft quantifier where the persona would give a count (left in place; the list after it gives the numbers).

Remaining drift (optional): the settings subsection of § 6 reads like a label inventory, not like Petzold. It names every control and explains few of them.

No banned patterns found (checked 1–14). No marketing adjectives. No «noi». «Tenant» appears only in DEV boxes, with the correspondence stated. No AI model or vendor names. No personal data.

## 5. Counter-Objection Check

STYLE_BIBLE requires ≥ 2. The chapter has **four**, each in a box, each in the reader's own voice:

| # | Objection | Strongest form? | Evidence-based answer? |
|---|---|---|---|
| 1 (§ 2) | «L'operatore dice di aver chiuso l'intervento, ma in ufficio non vedo l'esito.» | Yes: the real support question that opens the runbook | Yes: an ordered check (right intervento → filter by operatore/date with the six-month window → the three causes, the 48-hour tablet), pointer to ch.12 |
| 2 (§ 4) | «Se tengo il vecchio non fattibile, il carico non mi conta un non fattibile in più?» | Yes: the fear that pushes people to delete | Yes: the `AvanzamentoCarichi` rule. Strengthened: deleting does not correct the count either. |
| 3 (§ 5) | «Ho verificato un intervento e ora non lo trovo più.» | Real but weak: a filter question | Yes: `STATI_CHIUSI = '6, 7'` |
| 4 (§ 6) | «L'AI ha segnato Non conforme: devo rifare l'intervento?» | Yes | Yes: the AI never changes the intervento; the decision is the reviewer's |

The strongest objection the chapter could have met is a temptation, not a question: «Verifico subito gli interventi mancanti, così la giornata è chiusa.» It is now answered in the § 5 prose. A future revision could promote it to a boxed counter-objection and drop #3 to a sentence.

## 6. Priority Improvements

### Critical (applied)
1. Remove «il conteggio tra i non fattibili del carico» from the § 4 loss list (it contradicts the counter-objection) and close the counter-objection with «cancellarlo non li corregge».
2. Give a decision rule for a missing «Cancella precedente»: assume the worst case, stop before «Assegna incarico» when the foto matter.
3. Connect «Verificato» on «Interventi mancanti» with the lock on later sends, and tell the reader to rule out data stuck on the phone first.
4. Correct the chapter 12 title.

### Important (applied)
5. Hook: replace the leaked instruction, drop «compare nel Piano», and set up both axes (stato and commessa configuration).
6. Inviato (7): soften the prose and add an `> **Attenzione:**` box saying the stato column does not prove delivery.
7. § 3: correct the list of skipped stati and describe the real damage (Prenotato and non fattibile not handed over).
8. § 3: Gea uses the same rule but refuses openly (verified in code).
9. § 3: «Annulla» does not update the utenza.
10. § 5: correct «ha preso il posto di undici versioni» / «undici configurazioni»; spell out what a mouse click on an Inviato does.
11. Closing: a `> **Quando chiedere allo staff tecnico:**` box plus a desk rule that ends on «nel dubbio» («Quando la seconda risposta manca, l'esito si conserva»).
12. Fonti: Jira format and missing code paths.
13. Small fixes: «Tre righe», «un'esecuzione», «404 (risorsa non trovata)», «Le ultime due regole».

### Optional (not applied: for the Editor/Researcher)
- Researcher: the unit of the default lettura tolerance («2»).
- Researcher: confirm the UNVERIFIED item that «Ripianifica» may do nothing on two commesse without `getCampiAssegnaDialog`. If confirmed, it belongs in the § 4 Limite.
- Researcher: «Applica a eseguiti» (17 commesse) may never take effect (`== 'i'` vs `Si`). If it does work, the § 3 rule «only 3 and 9» has a commessa-level exception.
- Researcher: add the Gea refusal behaviour (`lib/ChatbotStrumentoRiaffidaIntervento.php`, `lib/ChatbotStrumentoCambiaDataIntervento.php`) to the dossier.
- Writer: in `### Le istruzioni dell'AI`, one sentence on *why* the banco exists, and move the label inventory into a short table.
- Writer: «No tipo» and «Carica dati dai terminali» are named and never explained. Explain them or drop them.
- Writer: § 4 is 713 words against a 900–1.200 target. If anything is added, add the UNVERIFIED Ripianifica case above, not padding.
- Captain: the anonymity of `custom/easy_iren/...` in Fonti (see § 3, Fonti).

## 7. Rewritten Paragraphs

### R1 — Hook (§ 1)

**Original:**
> Un esempio inventato, dichiarato come tale. Su una commessa senza interventi multipli un operatore registra un non fattibile con tre foto e il motivo; il giorno dopo l'ufficio apre la scheda, preme «Ripianifica», sceglie un collega e una data, conferma. Il nuovo intervento compare nel Piano. Il vecchio, con il suo esito e le sue tre foto, non esiste più: né nel gestionale né sul disco. Nessuno ha sbagliato procedura. Il pulsante ha fatto quello che fa su quella commessa, e chi lo ha premuto non lo sapeva.
>
> Questo capitolo serve a sapere, prima di premere, che cosa resta. Il primo dato da leggere è sempre lo stato.

**Rewritten:**
> Un caso inventato, ma possibile. Su una commessa senza interventi multipli un operatore registra un non fattibile con tre foto e il motivo. Il giorno dopo l'ufficio apre la scheda, preme «Ripianifica», sceglie un collega e una data, conferma. Il collega trova il nuovo intervento nell'app. Il vecchio, con il suo esito e le sue tre foto, non esiste più: né nel gestionale né sul disco. Nessuno ha sbagliato procedura. Il pulsante ha fatto quello che fa su quella commessa, e chi lo ha premuto non lo sapeva.
>
> Questo capitolo serve a sapere, prima di premere, che cosa resta. Lo decidono due cose: lo stato dell'intervento, che dice quali pulsanti agiscono, e le impostazioni della commessa, che dicono che cosa ogni pulsante conserva. Il primo dato da leggere è lo stato.

**Why:** The old opening copied the style rule into the text. «Compare nel Piano» is not in the dossier. And the moral (read the stato) did not follow from a story whose trap was a commessa setting. The new second paragraph names the two axes the chapter actually teaches.

### R2 — The silent skip (§ 3)

**Original:**
> Il settimo passo non è una formalità. «Modifica» agisce solo sugli interventi Assegnato (3) e Annullato (9); gli altri vengono scartati già nella ricerca sul server. Un Eseguito, un Non fattibile, un Controllato, un Inviato, un Ripianificabile restano come sono. Nessun messaggio lo segnala. La pagina si ricarica come se tutto fosse andato bene. Il risultato, se nessuno guarda, è un operatore che non riceve l'intervento e un'utenza che nessuno visita.

**Rewritten:**
> Il settimo passo non è una formalità. «Modifica» agisce solo sugli interventi Assegnato (3) e Annullato (9); tutti gli altri vengono scartati già nella ricerca sul server. Un Prenotato, un Non fattibile, un Ripianificabile, un Utente assente restano come sono, con l'operatore e la data di prima. Nessun messaggio lo segnala: la pagina si ricarica come se tutto fosse andato bene. Se nella selezione c'era un Prenotato da dare al collega, o un non fattibile da rifare, il collega non lo riceve e nessuno passa da quell'utenza.

**Why:** The old list named the skipped stati where skipping is harmless (Eseguito, Controllato, Inviato are already done) and left out two where it hurts (Prenotato, Utente assente). The new list names the stati that still need a visit. That matches the spec's tension point 2 («the utenza is not visited») without overstating it.

### R3 — «Cancella precedente» (§ 4)

**Original:**
> «Cancella precedente» è un menu a tendina con tre voci: vuoto, «Sì» e «No». Solo «Sì» cancella. Quante commesse abbiano gli interventi multipli dipende dalla configurazione: nel codice sono la maggioranza delle cartelle, ma le fonti non dicono quante siano commesse attive. La cosa da verificare è la propria commessa: se la finestra mostra «Cancella precedente», la commessa ha gli interventi multipli.

**Rewritten:**
> «Cancella precedente» è un menu a tendina con tre voci: vuoto, «Sì» e «No». Solo «Sì» cancella; lasciarlo vuoto equivale a «No». Quante commesse abbiano gli interventi multipli dipende dalla configurazione di ciascuna: nel codice le configurazioni con gli interventi multipli sono più di quelle senza, ma le fonti non dicono quante siano commesse attive. Conta la propria commessa, e per orientarsi basta la finestra. Se mostra «Cancella precedente», la commessa ha gli interventi multipli e il vecchio resta, salvo «Sì». Se non lo mostra, si dà per certo il caso peggiore: il vecchio sparirà con esito e foto. Quando quelle foto contano, ci si ferma prima di «Assegna incarico» e si chiede allo staff tecnico.

**Why:** This is the chapter's only irreversible loss, and the old paragraph gave a test that worked in one direction only. The reader who did not see the field got no rule. The new text gives the worst-case rule and a stop point, and states the code fact that an empty choice keeps the old one (`cancella_precedente == 'Si'` only). It also removes «cartelle» from UFFICIO text.

### R4 — Counter-objection 2 and the loss list (§ 4)

**Original (list item + box ending):**
> - il conteggio tra i non fattibili del carico.
>
> … e il vecchio esce dal conteggio pur restando nello storico. Tenerlo non gonfia i numeri.

**Rewritten:**
> (list item removed)
>
> … e il vecchio esce dal conteggio pur restando nello storico. Tenerlo non gonfia i numeri, e cancellarlo non li corregge: i conti del carico sono gli stessi nei due casi.

**Why:** The list and the counter-objection contradicted each other. By the `AvanzamentoCarichi` rule («nf e rp guardano l'ultimo intervento non annullato»), the old non fattibile leaves the count at ripianificazione whether it is kept or deleted. The new last line removes the one reason a back-office user might have to delete it.

### R5 — The two «undici» (§ 5)

**Original:**
> La pagina descritta qui è la Verifica unica, che ha preso il posto di undici versioni diverse della stessa pagina. Si apre da Rapporti › Verifica interventi, la prima voce del menu Rapporti, sulle commesse che sono passate alla nuova pagina: al 24 novembre 2026 sono undici configurazioni. Le altre usano ancora la loro pagina precedente.

**Rewritten:**
> La pagina descritta qui è la Verifica unica: una sola pagina, adattata commessa per commessa, scritta per sostituire le varianti che esistevano prima, una per tipo di commessa. La sostituzione è in corso. La pagina si apre da Rapporti › Verifica interventi, la prima voce del menu Rapporti, solo sulle commesse già passate: al 24 novembre 2026 le configurazioni attivate sono undici, una delle quali di prova. Le altre commesse usano ancora la pagina precedente.

**Why:** «Ha preso il posto» is false while the old pages still serve most commesse (CONFLICT 5). Two «undici» with different meanings in three lines invite the reader to think every commessa has switched. «Una delle quali di prova» is `sg_smat_test`, stated without a tenant code.

### R6 — Inviato and the mouse click (§ 5)

**Original:**
> «Verificato» porta l'esecuzione a Controllato (6). […] È lo stesso stato. Se l'intervento era fra gli «Interventi mancanti», senza esecuzione, la riga dell'esecuzione viene creata in quel momento. Su un intervento già Inviato, Invio non funziona («Intervento già inviato: Invio non lo riporta a Verificato»); il clic del mouse invece sì.

**Rewritten:**
> «Verificato» porta l'esecuzione a Controllato (6). […] È lo stesso stato. Su un intervento già Inviato il tasto Invio non funziona («Intervento già inviato: Invio non lo riporta a Verificato»); il clic del mouse invece lo riporta a Controllato. Su un Inviato, quindi, «Verificato» si preme solo di proposito.

**Why:** «Il clic del mouse invece sì» left the effect unstated: a stato 7 goes back to 6. The keyboard guard exists to stop that happening by accident, and the reader should know it. The «Interventi mancanti» sentence moved to R7, where its consequence is drawn.

### R7 — The other side of «Verificato» (§ 5)

**Original:**
> Le correzioni fatte qui sono al sicuro dopo «Verificato»: da quel momento nessun invio dall'app le sovrascrive, come si è visto nella sezione sull'esecuzione.

**Rewritten:**
> Le correzioni fatte qui sono al sicuro dopo «Verificato»: da quel momento nessun invio dall'app le sovrascrive (vedi la sezione *Intervento ed esecuzione*). La stessa regola ha un rovescio. Su un intervento fra gli «Interventi mancanti», senza esecuzione, «Verificato» crea la riga dell'esecuzione in quel momento, già Controllata, ma vuota di tutto quello che il telefono non ha ancora mandato. Se poi l'invio dell'operatore arriva, trova un intervento già chiuso e non viene scritto: GOPlanner 3 lo rifiuta, l'app precedente lo ignora senza avvisare. Prima di verificare un intervento mancante si esclude quindi che il dato sia fermo sul telefono (vedi il capitolo 12).

**Why:** This is the chapter's most original point, and it was already in the text in two disconnected halves. It covers the spec's missing § 2 Limite (no button re-creates an esecuzione lost on the phone) and links back to counter-objection 1 (the tablet silent for 48 hours). It also removes a banned-pattern-family phrase. Source chain: `verificaImpostaStato` (row created, stato 6) + `EsitoWriter` (409 `intervento_locked` at stato ≥ 6) + `isBlockedByBackoffice` (stato ≥ 6, ignored silently).

### R8 — Gea (§ 3)

**Original:**
> Anche Gea può preparare un cambio di operatore o di data, se le si dà il numero dell'intervento, con lo stesso meccanismo di «Modifica». Non succede nulla finché qualcuno non preme «Autorizza» (vedi il capitolo 10, *Gea*).

**Rewritten:**
> Anche Gea può preparare un cambio di operatore o di data, se le si dà il numero dell'intervento. Vale la stessa regola sugli stati, con una differenza: quando l'intervento non è Assegnato né Annullato, Gea rifiuta e lo dice, invece di saltarlo in silenzio. Non succede nulla finché qualcuno non preme «Autorizza» (vedi il capitolo 10, *Gea*).

**Why:** «Lo stesso meccanismo» suggested Gea also skips without a message. The code (`STATI_MODIFICABILI`, errors `stato_non_riaffidabile` / `intervento_non_modificabile`) shows it refuses openly. That gives the reader a practical way round the silent skip.

### R9 — Closing

**Original:**
> Prima di qualunque azione su un intervento servono quindi due risposte: in che stato si trova, e se il suo esito è già stato verificato, inviato o esportato. La prima dice quale pulsante può funzionare. La seconda dice se il vecchio esito va conservato. Se una delle due non ha risposta, ci si ferma e si chiede allo staff tecnico.

**Rewritten:**
> > **Quando chiedere allo staff tecnico:** un esito che l'operatore dice di aver inviato e che manca anche dopo i controlli della sezione *Intervento ed esecuzione*; un esito cancellato da recuperare; una commessa che dovrebbe avere la nuova Verifica, o l'analisi AI, e non le ha; una ripianificazione dove la finestra non mostra «Cancella precedente» e le foto del vecchio intervento contano.
>
> Prima di qualunque azione su un intervento servono due risposte: in che stato si trova, e se il suo esito è già stato verificato, inviato o esportato. La prima si legge nella colonna «Stato» e dice quale pulsante può agire. La seconda dice se il vecchio esito va conservato, e non sempre si legge sullo schermo: un intervento già esportato può essere ancora Controllato. Quando la seconda risposta manca, l'esito si conserva.

**Why:** «Quindi» tied a chapter-level rule to the AI section. The four «ask the staff» cases (NUF emotional 2) were spread over four sections and are now in one box. The last line now ends on the chapter's own rule («nel dubbio, tienilo») instead of sending every doubt to the staff. It also says plainly why the second answer may be missing: the Inviato limit added in § 1.

### R10 — Inviato box (§ 1, new)

**Original (prose):**
> Infine, quando il dato è stato consegnato al committente, l'esecuzione passa a Inviato (7).

**Rewritten (prose + new box):**
> Infine, su alcune commesse, l'esecuzione passa a Inviato (7), lo stato del dato consegnato al committente.
>
> > **Attenzione:** Inviato (7) non è la prova che il dato sia arrivato al committente. Le fonti trovano lo stato 7 scritto dall'importazione di un file di inviati, da un'esportazione storica delle letture e da una procedura di riparazione dell'area Admin, non da ogni esportazione. Un intervento già consegnato può quindi essere ancora Controllato (6): per sapere se un esito è uscito verso il committente, la colonna «Stato» non basta.

**Why:** The § 4 rule («tienilo se è stato… inviato o esportato») and the closing both rely on the reader knowing whether an esito left. The old prose implied the stato tells them. Source: dossier § 1 (writers of stato 7) plus UNVERIFIED item 3, and the commessa-specific return file that selects stato 6. The box also breaks up a run of five prose paragraphs.

### R11 — Annulla (§ 3)

**Original:**
> «Annulla» non controlla lo stato di partenza e non tocca l'esecuzione: cambia solo lo stato dell'intervento.

**Rewritten:**
> «Annulla» non controlla lo stato di partenza, non tocca l'esecuzione e non aggiorna l'utenza: cambia solo lo stato dell'intervento. Un'utenza il cui intervento è stato annullato può quindi leggere ancora «assegnato» (vedi il capitolo 3).

**Why:** The dossier says `annulla_intervento` does not call `updateStatoUtenza()`. «Perché l'utenza risulta ancora assegnata» is one of the three tribal-knowledge questions the PRD names as the Enemy. One sentence and a pointer is all the chapter boundary allows.

## 8. Litmus test

*Would the reader finish thinking «I lived this» or «I was told this»?*

Before corrections: **«I lived this» for § 1–§ 4** (the vanished foto, the sick operatore, the button that does nothing without saying so) and **«I was told this» for § 5–§ 6** (label inventories).

After corrections, § 5 has a lived trap of its own (verifying a «mancante» too early), and the chapter ends on a desk rule instead of a referral. The settings subsection of § 6 still reads «I was told this» (optional fix above).

The spec's own test also passes. A new colleague can now move an absent operatore's interventi, knowing which rows will not move. They can redo a non fattibile without losing foto the committente has seen, with a rule for when the field is missing. They can verify a day's work without locking out a late send. And they can read an «Esito AI» without taking it as a verdict.

## 9. Verdict

**REVIEWER_CORRECTIONS (47/60):** an accurate chapter that follows its sources, held back by one internal contradiction, one invented chapter title and two safety chains it never connected. All are fixed in place, with 14 paragraphs rewritten.
