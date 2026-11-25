# Review — Capitolo 8. Gli operatori e l'app GOPlanner 3

Reviewer run: 25 novembre 2026. Read fresh: `PRD.md`, `STYLE_BIBLE.md`, `chapter_8_struttura.md` (NUFs, BEAT LIST, TARGET), `chapter_8.md`, and `dossier_chapter_8.md` (every technical claim checked against it). Cross-checked `chapter_6.md` for continuity and `CONTEXT.md` for the glossary.

## 1. Executive Summary

**Verdict: REVIEWER_CORRECTIONS, 46/60.** This chapter does what the PRD promises. The opening case (esiti refused because the office reassigned the work while the phone was offline) leads into the three-question spine. It comes back in § 4, where the chapter finds a non-obvious and verified fact: assigning the intervento back does **not** make the same retry pass, because the server stores the `not_found` answer for 30 days. The chapter closes on a desk rule that only it can give. The facts track the dossier closely, and the Writer resolved CONFLICTs 7, 9, 10, 11, 12 and 13 the way the dossier says.

The text fell short of a pass on five points, all fixable:
- **Glossary:** «chiusura» is used as a noun for esito nine times.
- **Spine:** the spine promises «sempre nello stesso ordine», but the § 2 checklist checked the phone fourth.
- **Accuracy:** the window-fallback sentence contradicted itself, and four features still marked «in corso» in Jira were presented as live.
- **Language:** «parte più di un esito» said the wrong thing.
- **Length:** the chapter runs over the PRD cap.

I corrected about 50 passages in `chapter_8.md` (most are one-sentence fixes; 8 paragraph rewrites are shown in § 7) and fixed the continuity pointer in `chapter_6.md` that the Architect asked for.

## 2. Score: 46/60 → REVIEWER_CORRECTIONS

| Dimension | Score | One-line reason |
|---|---|---|
| Narrative & Structure | 8/10 | Strong spine and payoff. The checklist order broke the spine, § 4 used three different taxonomies, and the closing replaced § 6's own Sintesi. |
| Language, Style & Voice | 7/10 | Calm and exact, but «chiusura» appears ×9, six unsourced intensifiers, one wrong-meaning sentence, five different hedges for the app labels, and diagnostic questions written as a series in § 5. |
| Factual Accuracy | 8/10 | Close to the dossier. Errors: the window fallback (self-contradictory), the informativa (a decision presented as live), the emoji refusal (scope wrong), «telefono di produzione», «attivo» with two meanings, and status «in corso» left out for GOP-695, GOP-449 and GOP-407. |
| Audience Alignment | 8/10 | The office reader gets exact paths and stop points, and the DEV boxes stay contained. Two gaps: about 880 words over the PRD cap, and NUF 3 («dove si vede in ufficio» for each part of the esito) is only half delivered. |
| Sensory & Emotional Engagement | 7/10 | The opening case, the GOP-621 story and the invented Confronto reading all work. The closing did not call back to the opening case, and the § 1 list paragraphs and the § 5 rules paragraph read like a list of labels. |
| Originality & Angle | 8/10 | The «Ultimo invio» habit, the stored `not_found`, the warning that disabling does not delete, and the Confronto read as a question rather than a ranking all earn the chapter its place. |
| **Total** | **46/60** | |

## 3. Detailed Findings by Section

### «In questo capitolo»
- Only the words *In questo capitolo* were in italics. STYLE_BIBLE § Formato asks for «un paragrafo in corsivo», and chapter 6's Editor made the whole paragraph italic. **Fixed.**
- The chapter hedged the phone-side labels five different ways: «un messaggio come «Telefono abilitato» (è la dicitura del contratto dell'app, non verificata sullo schermo)», «(la voce documentata è «Chiedi un nuovo codice»)», «un messaggio come «Questo telefono non è più abilitato»», «Il tasto documentato come «Riprova»». The hedge is correct (dossier: «[UNVERIFIED: exact on-screen text of the app]»), but repeating it in five forms makes the procedures read like a disclaimer. **Fixed:** one sentence in the intro now says where the labels come from, and the inline hedges are gone.

### § 1 — Il telefono dell'operatore
- The opening case is good. «Nessuno ha sbagliato un clic. L'ufficio ha deciso guardando metà della giornata.» is the best pair of sentences in the chapter. I added the missing consequence from the struttura's tension point 1 («the office believes the work was never done and plans it again»): «e il collega ha in elenco due visite già fatte».
- «Il server non consegna mai una password al telefono». The dossier says «segreto» («il server non consegna mai un segreto»), and a password is only one kind of secret. **Fixed.**
- «Per decisione del 14 ottobre 2026 l'informativa viene mostrata di nuovo a ogni aggiornamento dell'app.» The dossier records this as the captain's *decision*, and adds that recording acceptances after pairing «il contratto attuale non la richiede e qui non c'e'». The text presented a decision as live behaviour (STYLE_BIBLE § Persona, «What I never do»). **Fixed.**
- «Il codice si azzera: non serve una seconda volta.» «Non serve» means «is not needed», but the rule is that the code *cannot* be reused. **Fixed.**
- «Il dubbio più frequente arriva con un telefono perso.» The frequency claim has no source. **Fixed.**
- Contro-obiezione 1: «Disabilitare, quindi, non costa niente al lavoro già fatto». This answers the weak form of the doubt. The strong form is «and can the queue still leave?». The dossier says every request of a disabled phone is refused (`device_revoked`), so the queue cannot leave while the phone stays disabled. That is exactly why the closing rule says to check «Ultimo invio» *before disabling*. **Fixed.**
- The Sintesi «prima di cercare un intervento, si cerca il telefono» contradicted the § 2 checklist, which put the phone at step 4. I fixed the checklist instead (see § 2).

### § 2 — Quali interventi arrivano sul telefono
- «La domanda che arriva più spesso dal campo» and «Un dettaglio che spiega molte telefonate» are unsourced frequency claims. **Fixed.**
- «Quando il campo è vuoto, vince il primo valore presente in quest'ordine: quello salvato da questa pagina, …» contradicts itself: if the field is empty, nothing is saved from this page. The dossier (`FinestraInterventi::applica`) says that for each value the first one present wins: tenant row, then `$custom['mobile']`, then `$conf`. **Fixed.**
- «Con un'eccezione decisiva: un intervento che ha sul telefono un esito non ancora inviato resta lì […] La catena è questa: l'ufficio sposta […] l'intervento esce dal primo telefono». The text stated the exception, then gave the reassignment chain *without* it, so the reader could not see that the two collide. **Fixed** (Rewrite 3).
- Checklist: the spine sentence says «tre domande, sempre nello stesso ordine: quale telefono…; quali interventi…; che cosa non ha ancora inviato», but the checklist began with the intervento. **Fixed:** the order is now phone, «Ultimo invio», assignment, window, stato. The old step 5 (operatore disattivato) folds into step 1, since a deactivated operatore's phones are disabled (dossier § 1, `disabilitaTelefoniOperatore`).
- «(sezione sulle leve dell'ufficio)» was a vague internal pointer. **Fixed:** it now names the section title.
- «Rapportino»: the struttura said «never «Rapportino» in UFFICIO text», but the dossier shows «Rapportino» is the default label in `EsitoCatalog::DEFAULTS`. Naming the exact label is the persona's first habit, so I **kept it**. Continuity note: chapter 6 line 39 says «Una commessa ha uno stato in più» for «Da finire», while the dossier says two commesse (`esito-write.md:116`). Chapter 8's «alcune commesse» is right; chapter 6 should be checked.

### § 3 — Registrare l'esito
- «Quando l'operatore chiude un intervento, dal telefono parte più di un esito.» As written this means *several esiti* leave the phone. The intended meaning is *not only the esito*. A reader stops here. **Fixed** (Rewrite 4).
- «Le emoji nei testi liberi vengono rifiutate, non tolte in silenzio.» This reads as if only the emoji is refused. The dossier says an emoji in free text makes the server refuse the request (422), and `envelope.md` lists 422 as not retryable. So the **whole esito** is refused, and «Riprova» will not help. That matters to the office reader. **Fixed.** Also «Il server lavora tutto» → «scrive tutto».
- «la provenienza resta nei dati della foto, ma le fonti non dicono se una pagina dell'ufficio la mostra». This hedge is true but tells the office reader nothing they can act on. **Cut.**
- «Sulle commesse dove l'impronta delle foto è unica» is a translation of a code detail that the reader cannot check. **Simplified** to «Su alcune commesse».
- «riprova dopo pochi secondi»: the dossier gives `Retry-After: 5`. **Specified** as «chiede al telefono di riprovare dopo 5 secondi».
- «Scritta sulle foto»: Jira GOP-695 is «In corso» on 25/11/2026 (dossier Timeline). The card exists in the code, but the line is composed by the phone, so the text must not imply the feature is finished. **Added the status.** The same applies to the firma (GOP-449 «In corso»), **added** to the Limite.
- «Chiusura» as a noun for esito: «tutte le 130 chiusure», «alla prima chiusura», «non blocca né ritarda mai la chiusura», «Le chiusure con GOPlanner 1.x», «logica di chiusura la chiusura di GOPlanner 3», «bloccherà la chiusura», plus «le chiusure per utente assente» (§ 2) and «le chiusure con l'app precedente» (§ 6). CONTEXT.md lists «chiusura» under *Da evitare* for esito, and struttura glossary trap 3 names it. **All fixed.** The labels «Ricevuta alla chiusura» and «Stampa ricevuta alla chiusura» stay, because they are quoted UI labels.
- «Per alcune commesse con una loro logica di chiusura la chiusura di GOPlanner 3 è stata tenuta ferma». Besides the glossary problem, the dossier source is a documentation instruction («Non abilitare la chiusura v3 per loro»), not a recorded action. **Fixed** to say what the documentation asks.

### § 4 — Quando il dato non arriva
- Three taxonomies in one section: the runbook's three possibilities («mai partito / perso per strada / arrivato e non salvato»), then «quattro strade», then a Sintesi with a third list («in coda, rifiutato o mai registrato»). Segnalazione and anomalia are not places where data sits. They are channels through which problems reach the office. **Fixed:** the table intro now says which two rows locate the data and which two are channels, and the Sintesi now gives a decision rule (find the data before replanning the visit) instead of a fourth list.
- «Qui sta il punto più delicato del capitolo.» This intensifies instead of specifying. **Fixed:** «Come nel racconto iniziale, …».
- «la risposta è «non trovato»»: the «…» marks suggest an on-screen label, but this is a translated error code (`not_found`) that the office never sees. STYLE_BIBLE Voice rule 4 reserves «…» for labels. **Fixed.**
- «Per questo la prevenzione vale più del rimedio» is a proverb, not a specification. The § 4 Sintesi also repeated the «Ultimo invio» habit, so the habit appeared three times (§ 4 body, § 4 Sintesi, closing). **Fixed:** the habit is stated once in the § 4 body and once in the closing.
- Segnalazioni: the paragraph described «Le mie segnalazioni» in the present tense for six sentences and only then said the feature is «ancora in corso». The reader needs the status before the description. **Fixed:** the text is split into what reaches the office today (Ticket section) and what the phone screen is designed to show.
- The «Errori app» detail («crash letti dai log centrali, ultimi 7 giorni») belongs to chapter 12. **Cut** to a pointer.

### § 5 — Le leve dell'ufficio
- «può preparare un messaggio per i telefoni […] quel messaggio non parte da solo». «Messaggio» is also the name of one of the seven commands (row «Inviare un messaggio»). **Fixed** to «comando».
- Contro-obiezione 4 was written as five questions in a row: «L'approvazione è arrivata entro i 60 minuti? Il telefono era ancora abilitato? …». That hits STYLE_BIBLE banned pattern 9, and the checks are a procedure (§ Formato). **Fixed** as a numbered list (Rewrite 6).
- «Dal 22 novembre 2026 la pagina non mostra più…»: 22/11 is the date of a commit on `php8` (dossier CONFLICT 10), not a confirmed production date. **Fixed** to «Con la modifica del 22 novembre 2026».
- Signed updates: GOP-407 is «In corso» on 25/11/2026. **Status added** to the Limite.
- Sintesi: «ogni comando verso un telefono di produzione». The approval rule depends on the *commessa* (test commessa vs production commessa), not the phone. **Fixed.**
- «per default» → «di base», matching the rest of the chapter. The DEV-style box «Per lo staff tecnico:» started with a capital letter after the colon. **Fixed.**

### § 6 — Dashboard e Confronto
- «Gli operatori non attivi o nascosti non compaiono» uses «attivo» in the registry sense. Three paragraphs later the text says «Non va confuso con «attivo», che nel gestionale vuol dire aver chiuso almeno un intervento nel periodo». § 2 step 5 also used the registry sense. One section gives the word two meanings. The dossier separates the anagrafica flag (`OperatoriDashboardController:588-600`) from the runbook definition (`runbook-operatori-attivi.md`). **Fixed:** «disattivati» for the flag, and «attivo nel senso del runbook dell'assistenza» for the count.
- «Ed è la risposta al dubbio più naturale» is an intensifier. **Fixed.**
- «i profili personalizzati prima del rilascio» was ambiguous. **Fixed.**
- Closing: «La regola di questa sezione, che è anche quella del capitolo, sta in una colonna: «Ultimo invio».» This sentence took over § 6's Sintesi slot. § 6's own rule (a signal opens a question, it is not a verdict) was never stated as a rule, and the closing did not return to the opening case it was meant to resolve. **Fixed** (Rewrite 5).

### Fonti
- The newly cited tickets GOP-407, GOP-449 and GOP-695 are **added**. The other entries match the dossier.

### Format and security
- One H1, «In questo capitolo» paragraph, `## Fonti`, blockquote boxes, standard tables. No raw HTML in the body. The trailing `<!-- … -->` pipeline comments follow the convention of chapters 1, 6 and 7. I updated the word-count comment to the real figure.
- No secrets, no personal data, no AI vendor or model names, no tenant codes. «cliente» appears only inside quoted UI labels and in one DEV box. «tecnico» appears only in «staff tecnico». No «scarico».

### Length
The PRD (§ 4) sets «circa 4.000-6.000 parole per capitolo»; the struttura TARGET is 5.700–6.000.

| Version | Total words | Prose |
|---|---|---|
| Original draft | ≈ 6.730 | — |
| After my corrections | ≈ 6.880 | ≈ 5.450 |

The rest of the total is tables (≈ 420), numbered and bulleted lists (≈ 560), DEV boxes (≈ 290) and headings. The prose is inside the range; the full file is about 15% over. My trims were smaller than the precision and status sentences I added. Cuts for the Editor's next pass are listed under *Important*.

## 4. Persona Audit

**Verdict: on persona, with drift at the edges.** Most of the chapter sounds like The Engineer + The Scholar:
- exact labels, verbatim («Codice inesistente, scaduto o gia' usato.», «Comandi in attesa di approvazione»);
- numbers with their sources (3 caratteri, 24 ore, 30 secondi, 300 secondi, 20 MB, 60 minuti, 10 comandi in 10 minuti, 5 giornate, 4 operatori);
- tenant-limited features marked as such («una decina» of commesse for the «Posizione» field);
- one surgical case per point (GOP-621);
- honest gaps («le fonti non lo danno», «senza promesse»).

The second activation phrase holds: «I do not intensify — I specify» is honoured by «Un «nessun fix disponibile» in uno scantinato non dice niente sulla presenza di nessuno.»

It drifted in three ways:
1. **Intensifiers without sources.** «più frequente», «più spesso», «molte telefonate», «decisiva», «più delicato», «più naturale». Each claims a frequency or importance the dossier does not give. All six are removed.
2. **Glossary slippage.** «chiusura» as a noun ×9, and «attivo» with two meanings. That is the Persona's «il nome esatto di ogni cosa» failing on the chapter's most-used word.
3. **Hedge sprawl.** Five different phrasings of «unverified on screen». The persona says «Se non lo so, non lo scrivo»; it does not say to repeat it five times. Now there is one sentence in the intro.

The procedures use the second person plural («Aprite», «Premete»). There is no «noi» and no «io». The audience lines are present on §§ 1, 2 (subsection), 3 (subsection), 5 and 6.

## 5. Counter-Objection Check

STYLE_BIBLE requires at least two. **Five are present**, all in the form of the reader's real doubt, all answered from the sources:

| # | Where | Objection as written | Strongest form? | Evidence-based response? |
|---|---|---|---|---|
| 1 | § 1 | «Se disabilito il telefono, l'operatore perde gli esiti che non aveva ancora inviato?» | **Was weak, now strong.** The strong form is «and can that queue still leave?». The answer now says the queue is blocked while the phone is disabled (`device_revoked` on every call). | Yes: `abbinamento.md` 172-176; recovery «aggancio, non costruito». |
| 2 | § 2 | «Ho spostato l'intervento su un altro operatore: perché il primo lo vede ancora?» | Yes. It escalates to the worse case (an esito already queued) and points forward. | Yes: `bootstrap-interventi.md` 280-287. No promised time («le fonti non lo danno»). |
| 3 | § 3 | «L'operatore non era sul posto?» | Yes. This is the accusatory form a supervisor actually thinks. | Yes: GOP-621, `PosizioneChiusura`, «Permessi» column. The answer refuses to conclude, which is right. |
| 4 | § 5 | «Ho approvato il comando, ma il telefono non ha fatto niente.» | Yes. | Yes: 60 minutes, re-read of phones, 3.0.0, push token, recapitato ≠ eseguito. Now a numbered procedure. |
| 5 | § 6 | «Il Confronto segna Non fattibili alti: l'operatore lavora male?» | Yes. | Yes: the band is the central half, at least 4 operatori, no thresholds, the legend «niente podio, niente voto». |

The chapter does not answer one objection a skeptical office reader would raise after § 4: **«Allora l'ufficio non deve più toccare gli interventi di oggi?»** The struttura warns that the chapter «must not resolve into fear of «Modifica»». The «Il rischio va misurato bene» paragraph covers the substance, but not in the reader's voice. Optional improvement below.

## 6. Priority Improvements

### Critical (all applied)
1. The checklist order contradicted the spine and the § 1 Sintesi. Reordered from the phone to the intervento.
2. The window-fallback sentence contradicted itself. Rewritten per `FinestraInterventi::applica`.
3. «parte più di un esito» meant the wrong thing. Rewritten.
4. «chiusura» as a noun for esito, ×9 (CONTEXT.md *Da evitare*). All replaced.
5. Features still «in corso» were presented as live: the informativa at every update (a decision), Scritta sulle foto (GOP-695), firma (GOP-449) and signed updates (GOP-407). Status stated.

### Important (applied unless noted)
6. Emoji refusal: the whole esito is refused, and the error is not retryable. Applied.
7. Contro-obiezione 1 now gives the strong form: the queue is blocked while the phone is disabled. Applied.
8. «attivo» had two meanings in § 6. Applied.
9. § 4 taxonomies aligned, and the Sintesi made a decision rule. Applied.
10. The closing callback to the opening case, and § 6 given its own Sintesi. Applied.
11. **Not applied, for the Editor:** length. Total ≈ 6.880 against a PRD cap of about 6.000. Cut candidates that keep every NUF:
    - (a) the help-text quote in «La finestra dei giorni» (≈ 35 words; the labels are already named);
    - (b) the «Ritrovare un telefono» filter list (≈ 30);
    - (c) the GOP-621 parenthetical «l'ultima se ha meno di 2 minuti, altrimenti una rilevazione rapida» (≈ 11);
    - (d) the «aggiorna app» outcome list in § 5 (≈ 30);
    - (e) the storico foto paragraph in § 2 (≈ 35; feature rules «da confermare»);
    - (f) merge the § 5 «Le regole dietro i due pulsanti» paragraph's last three sentences into the Limite (≈ 25).
    
    That is about 170 words. Further cuts mean dropping a subsection, which is the Architect's call.
12. **Not applied, a researcher gap:** NUF 3 asks *where in the gestionale each part of the esito is visible*. The chapter shows this for the posizione (Verifica card «Posizione», about ten commesse), the firma (ricevuta), the motivo (Confronto «Motivi dei non fattibili») and the foto (Dashboard). It does not for note, letture and campi di chiusura. The dossier does not have it (see Researcher Gaps below).

### Optional
13. Add a sixth counter-objection in § 4: «Allora l'ufficio non deve più toccare gli interventi di oggi?» Answer: no. The refusal happens only on interventi the phone has done and not yet sent, the same mechanism protects the office's corrections (chapter 6), and the check costs one look at «Ultimo invio».
14. Chapter 6 line 39 says «Da finire» exists on «una commessa»; the dossier says two. Ask chapter 6's Editor to check.
15. The § 5 rules paragraph («Le regole dietro i due pulsanti sono strette…») has nine sentences of rules. A five-row table (validity · where you approve · which phones · double approval · limit) would scan better and save about 20 words.

### Researcher gaps (for any future pass)
- Whether a send refused with `device_revoked` (403, not retryable) is stored under the `Idempotency-Key` and replayed after the phone is re-enabled. If so, re-enabling a phone would not release its queue for 30 days, and contro-obiezione 1 would need a warning. Check `Response::isStorable` against the order of checks in `Kernel` (does the device check run before the idempotency store?).
- Where the office reads note, letture and campi di chiusura of a GOPlanner 3 esito (Verifica «Dati rilevati»? Interventi › Lista?). This is needed for NUF 3.
- Whether «Ultimo uso» of a GOPlanner 3 phone is updated by `GET /v3/interventi` (a list fetch) or only by writes. That would let step 2 of the § 2 checklist state firmly that a stale «Ultimo invio» means a stale list.

## 7. Rewritten Paragraphs

### Rewrite 1 — § 2, the window fallback (factual and logical)
**Original:**
> Quando il campo è vuoto, vince il primo valore presente in quest'ordine: quello salvato da questa pagina, poi quello della configurazione della commessa, poi quello dell'app precedente. Un dettaglio che spiega molte telefonate: se nessuno ha mai impostato i giorni avanti, la finestra in avanti è di 0 giorni. Il telefono vede fino a oggi, non domani.

**Rewritten:**
> Per ciascuno dei due campi vince il primo valore presente, in quest'ordine: quello salvato da questa pagina; se il campo è vuoto, quello della configurazione della commessa; se manca anche quello, quello dell'app precedente. Da qui viene la prima cosa da controllare quando manca l'intervento di domani: se nessuno ha mai impostato i giorni avanti, a nessuno dei tre livelli, la finestra in avanti è di 0 giorni. Il telefono vede fino a oggi, non domani.

**Why:** the original opened with «Quando il campo è vuoto» and then named «quello salvato da questa pagina» as the first source, which is impossible when the field is empty. The rewrite follows `FinestraInterventi::applica` (first value present wins, for each value separately) and makes clear that 0 days applies only when *all three* levels are empty. «Spiega molte telefonate» claimed a frequency with no source; it is replaced by what the reader should do.

### Rewrite 2 — § 2, the checklist (structure: the spine promised «sempre nello stesso ordine»)
**Original:**
> Prima di aprire un ticket, i controlli in ordine:
> 1. L'intervento è assegnato proprio a quell'operatore? Interventi › Lista, filtro Operatore.
> 2. La data pianificata cade dentro «Giorni prima di oggi» e «Giorni dopo oggi»? […]
> 3. Lo stato è uno di quelli che il telefono riceve […]?
> 4. Il telefono è abilitato per quell'operatore? Impostazioni › Dispositivi mobili. Il suo «Ultimo invio» è recente? Operatori › Dashboard.
> 5. L'operatore è ancora attivo? Un operatore disattivato ha i telefoni disabilitati; uno passato a un'altra commessa ha il telefono rifiutato.

**Rewritten:**
> Prima di aprire un ticket, i controlli in ordine, dal telefono all'intervento, come le tre domande della prima sezione:
> 1. Il telefono è abilitato per quell'operatore? Impostazioni › Dispositivi mobili. Un operatore disattivato ha i telefoni disabilitati; uno passato a un'altra commessa ha il telefono rifiutato.
> 2. Il suo «Ultimo invio» è recente? Operatori › Dashboard. Un telefono che non parla con il server da prima della modifica non può avere l'elenco nuovo.
> 3. L'intervento è assegnato proprio a quell'operatore? […]
> 4. La data pianificata cade dentro «Giorni prima di oggi» e «Giorni dopo oggi»? […]
> 5. Lo stato è uno di quelli che il telefono riceve […]?

**Why:** § 1 sets the rule «tre domande, sempre nello stesso ordine: quale telefono…; quali interventi…» and ends on «prima di cercare un intervento, si cerca il telefono». The checklist then checked the phone fourth. A reader who follows the book's own rule would do the checks in a different order from the book's own procedure. Putting the phone first also matches the cost of each check: if the phone is disabled or silent, the other three checks do not matter. Each step still asks one question and names one page.

### Rewrite 3 — § 2, the list follows the server (chain made explicit)
**Original:**
> A ogni aggiornamento l'app toglie gli interventi che il server non le manda più. Con un'eccezione decisiva: un intervento che ha sul telefono un esito non ancora inviato resta lì finché l'invio non è confermato. La catena è questa: l'ufficio sposta un intervento su un altro operatore (Interventi › Lista, «Modifica», vedi il capitolo 6, *Interventi, esiti e verifica*); l'intervento esce dal primo telefono e arriva al secondo al rispettivo aggiornamento successivo.

**Rewritten:**
> A ogni aggiornamento l'app toglie gli interventi che il server non le manda più. Se l'ufficio sposta un intervento su un altro operatore (Interventi › Lista, «Modifica», vedi il capitolo 6, *Interventi, esiti e verifica*), l'intervento esce dal primo telefono al prossimo aggiornamento di quel telefono, e arriva al secondo al prossimo aggiornamento dell'altro. C'è un'eccezione, ed è quella del caso d'apertura: un intervento che sul telefono ha un esito non ancora inviato resta lì finché l'invio non è confermato. L'operatore continua a vederlo, e il suo esito partirà verso un intervento che non è più suo.

**Why:** the original gave the exception first and the chain second, and the chain («l'intervento esce dal primo telefono») contradicted the exception it followed. «Decisiva» asserted importance without showing it. The rewrite gives the rule, then the exception, then the consequence, and ties the exception to the opening case. That is the link the struttura asks § 2 to make («the key link to § 4»).

### Rewrite 4 — § 3, opening (language: the sentence said the wrong thing)
**Original:**
> Quando l'operatore chiude un intervento, dal telefono parte più di un esito. Partono le foto, a volte una firma, una posizione o il motivo per cui la posizione manca.

**Rewritten:**
> Quando l'operatore chiude un intervento, dal telefono non parte solo l'esito. Partono le foto, a volte una firma, e la posizione o il motivo per cui manca.

**Why:** «parte più di un esito» means *several esiti leave the phone*, which is false: one esito per intervento, plus attachments. In a chapter whose readers will repeat its wording to operatori on the phone, the mistake would spread. The second sentence also made posizione and motivo look like alternatives to a firma («a volte una firma, una posizione o il motivo»). In fact the esito always carries one of the two (GOP-621).

### Rewrite 5 — § 6 closing (structure: a Sintesi for § 6, and a callback to the opening)
**Original:**
> La regola di questa sezione, che è anche quella del capitolo, sta in una colonna: «Ultimo invio». Prima di spostare, verificare o cancellare gli interventi di oggi di un operatore, o di disabilitarne il telefono, guardatela. Se è più vecchia del lavoro che state per toccare, il telefono tiene ancora una parte della giornata che l'ufficio non vede, e la prima mossa è chiedere all'operatore, non cambiare il Piano.

**Rewritten:**
> La regola di questa sezione: un segnale del Confronto apre una domanda sulla zona e sui motivi, non un giudizio sull'operatore.
>
> La regola del capitolo sta invece in una sola colonna della Dashboard, «Ultimo invio». Il pianificatore del caso d'apertura, a mezzogiorno, l'avrebbe trovata ferma al primo mattino, e avrebbe saputo che il telefono teneva una parte della giornata che l'ufficio non vedeva. Prima di spostare, verificare o cancellare gli interventi di oggi di un operatore, o di disabilitarne il telefono, guardate quella colonna. Se è più vecchia del lavoro che state per toccare, la prima mossa è chiedere all'operatore, non cambiare il Piano.

**Why:** «La regola di questa sezione, che è anche quella del capitolo» was not true. § 6's rule is about reading signals; «Ultimo invio» is the chapter's rule. As written, § 6 lost its Sintesi, and the beat-list rule «every section ends with a one-line Sintesi» was broken. The closing also stated the habit in the same words as § 4 without paying off the opening case it was built to resolve. The callback is valid within the declared-invented case: with no network, the phone sends neither requests nor positions, so «Ultimo invio» (dossier: last use, last ping, last position) stays at the morning. The reader finishes having seen the mistake happen and then seen how to avoid it.

### Rewrite 6 — § 5, contro-obiezione 4 (format: questions in a row → procedure)
**Original:**
> Un caso tipico: «Ho approvato il comando, ma il telefono non ha fatto niente.». I controlli, in ordine. L'approvazione è arrivata entro i 60 minuti? Il telefono era ancora abilitato? La versione dell'app capisce il comando, cioè almeno 3.0.0 per i tre nuovi? Il telefono ha mai mandato il suo indirizzo per le notifiche? Se lo stato è «recapitato» ma non «eseguito», il telefono non ha ancora confermato: spento o senza rete.

**Rewritten:**
> Un caso tipico: «Ho approvato il comando, ma il telefono non ha fatto niente.». I controlli, in ordine:
>
> 1. L'approvazione è arrivata entro i 60 minuti dalla richiesta.
> 2. Al momento dell'approvazione il telefono era ancora abilitato.
> 3. L'app capisce il comando: per ritenta invii, richiedi log e aggiorna app serve almeno la 3.0.0.
> 4. Il telefono ha mandato almeno una volta il suo indirizzo per le notifiche push; senza, non si raggiunge.
> 5. Se lo stato è «recapitato» ma non «eseguito», il telefono non ha ancora confermato: è spento o senza rete.

**Why:** the original had four questions in a row (STYLE_BIBLE banned pattern 9) and was a procedure written as prose (§ Formato: «Procedure come elenco numerato»). The numbered form matches the § 2 checklist, so the chapter now has one way to show diagnosis. Step 2 now says *when* the phone must be enabled («al momento dell'approvazione»), which is the rule in `CommandApprovals.php:60-80`. Step 3 names the three commands instead of «i tre nuovi», which made the reader look back at the table.

### Rewrite 7 — § 1, contro-obiezione 1 (strong form of the doubt)
**Original:**
> […] No. Il lavoro non inviato resta sul telefono; il server non lo tocca e non ha comandi che lo cancellino. Disabilitare, quindi, non costa niente al lavoro già fatto, e riabilitare costa solo un codice nuovo.

**Rewritten:**
> […] No. Il lavoro non inviato resta sul telefono; il server non lo tocca e non ha comandi che lo cancellino. Disabilitare, quindi, non cancella il lavoro già fatto; però, finché il telefono resta disabilitato, la sua coda non può partire, perché ogni richiesta viene rifiutata. Riabilitare costa solo un codice nuovo.

**Why:** «non costa niente» was too reassuring. A disabled phone gets `device_revoked` on every call (dossier § 1, `abbinamento.md` 235-236), so its queue stays on the phone until it is re-enabled. The supervisor who disables a phone that was only *misplaced* needs to know that. It is also why the closing rule lists disabling among the actions to take only after checking «Ultimo invio». The first answer («No») is kept: nothing is deleted.

### Rewrite 8 — § 3, emoji (scope of the refusal)
**Original:**
> Le emoji nei testi liberi vengono rifiutate, non tolte in silenzio. Il server lavora tutto in una sola transazione e non crea mai un intervento nuovo.

**Rewritten:**
> Un esito con un'emoji in un testo libero viene rifiutato per intero, non ripulito in silenzio, e non è un errore che si ritenta. Il server scrive tutto in una sola transazione e non crea mai un intervento nuovo.

**Why:** the original read as if only the emoji is rejected. The dossier says the request is refused (422), and `envelope.md` lists 422 as not retryable. So an operatore who puts an emoji in the note loses that esito's send, and «Riprova» will not recover it. That fact belongs in § 4's list of refusals, and the office reader must be able to recognise it. «Lavora tutto» was colloquial and vague; «scrive tutto» says what the transaction does.

## 8. Verdict

**REVIEWER_CORRECTIONS (46/60).** A strong, verifiable chapter with a real angle. I corrected about 50 passages (8 full paragraph rewrites) to restore the spine's order, the glossary, factual precision on four in-progress features and three logic slips, and to land the closing on the opening case. The only open item is length (about 6.880 words against a cap of about 6.000), which is left to the Editor with a list of cuts.

**Litmus test:** *«Would the reader finish thinking "I lived this" or "I was told this"?»* After the corrections, **«I lived this»** for §§ 1, 2, 4 and the closing. The opening case comes back in § 2 (the queued esito keeps the intervento on the phone), in § 4 (why the refusal happens and why re-assigning back does not help) and in the closing (the column the planner should have checked at noon). §§ 3 and 5 are still partly «I was told this»: they are accurate, but they read as rules and labels, carried by one real case (GOP-621) and one failing-command case. That is acceptable for reference sections of a technical guide.

**Also changed outside this chapter:** `chapter_6.md` line 67, «il capitolo 8, *L'app*» → «il capitolo 8, *Gli operatori e l'app GOPlanner 3*», as the struttura's Continuity check asked the Reviewer of chapter 6 or 8 to do.
