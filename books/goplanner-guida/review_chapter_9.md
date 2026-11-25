# Review — Capitolo 9. Il magazzino

Reviewer run: 25 novembre 2026. Read fresh: `PRD.md`, `STYLE_BIBLE.md`, `chapter_9_struttura.md`, `chapter_9.md`, `dossier_chapter_9.md` (all [PUBLIC], [SHADOW], [CONFLICT] and Jira rows). For the ending check, also read the last paragraphs of `chapter_1.md`–`chapter_7.md`, plus `chapter_4.md` for the 24-hour undo and the «momentaneamente sospese» message.

## 1. Executive Summary

The chapter is faithful to the dossier. It quotes stati, movimenti, origini, anomalie, motivi and messages word for word. It resolves every [CONFLICT] the way the dossier says: «Magazzino centrale», no «Dati del pezzo», 5000/500, DDT «oggi una, dal 23 novembre 2026», app screens not released. It also keeps every feature condition dated. The thesis («un pezzo, un posto, un movimento») is set by a strong invented hook, the installazione forzata, which § 3 pays off and the closing returns to. A skeptical back-office reader would trust it. Six things kept it below the pass line:

- **Two factual slips in § 5.** The closure «fa tre cose in più rispetto all'installazione» (there are two extra movimenti), and the text says a failed DDT «resta bozza» while quoting the message «il DDT non è stato creato».
- **One unreachable safety net.** The § 5 sintesi tells the reader to rely on a «bozza di uscita», but the procedure just described («Crea DDT») creates and confirms in one go.
- **One on-screen contradiction left open.** The import resoconto says «Un articolo caricato per errore si corregge con un movimento di magazzino». The chapter says «staff tecnico» and never explains the gap.
- **An invented visual and some unsourced intensifiers:** «righe rosse», «l'errore più comune», «il dubbio più frequente», «il modo più sicuro», «le domande più comuni».
- **Ambiguous words in a chapter about meters and readings:** «contatore» for the UI counter, «lettura» for a database read, «ritirare» for «annullare», «matricole» for codici in a box QR.
- **A closing whose shape echoes chapters 1 and 2** («quando … non torna → ordine → staff tecnico»).

All fixes are local. Verdict: **corrections applied, 21 passages rewritten** (one paragraph split into prose plus a bulleted list).

## 2. Score: 45/60 → REVIEWER_CORRECTIONS

| Dimension | Score | One-line reason |
|---|---|---|
| Narrative & Structure | 8/10 | The build goes from where a piece is, to how it enters, how it moves, who works the banco, DDT, and what to do when the registro disagrees. The hook is paid off in § 3 and the closing restates the § 1 sintesi. Weak spots: § 2's Limite was a nine-item dump in one paragraph, the «letti durante l'invio» rule appeared twice (§ 3 and § 4), and the § 5 bozza logic did not hold together. |
| Language, Style & Voice | 7/10 | Mostly on-persona: short rule sentences after long ones, exact labels, no «noi». Drift: architect jargon («Il bilanciamento sta prima della conferma»), researcher meta («l'etichetta non è stata verificata nel codice»), unsourced intensifiers, and four ambiguous words (see § 3 below). |
| Factual Accuracy | 7/10 | About 200 checkable claims, nearly all traced to the dossier. Errors: «tre cose in più», «il DDT resta bozza» against the quoted message, «righe rosse» (no colour in the dossier), «non chiede mai di staccare le mani dal lettore» (the procedure itself says the operatore is chosen first, from a menu), the box QR described as «5 matricole» (glossary trap 1), and the bozza di uscita safety net. |
| Audience Alignment | 8/10 | The litmus-test tasks are all covered: Excel import with rejected rows, assigning 50 and knowing when they are really picked up, reading an installazione forzata, affido and uscita, finding a piece by codice, scatola or utenza. Developer material stays in boxes. The body runs about 6,450 words, above the PRD's «circa 4.000–6.000». |
| Sensory & Emotional Engagement | 7/10 | Real stakes in three places: the hook, the § 3 trap (the closed window sends an operatore out without the contatori), and the § 6 chain («Segna come vista» moves nothing). § 2's motivi and limits and § 5's Articoli/DDT label runs read as catalogues. |
| Originality & Angle | 8/10 | «Il magazzino non ferma mai il campo: registra, e lascia all'ufficio il compito di leggere» is a real insight, and so is «nothing heals itself» (inventario and «Segna come vista» are protections, not missing features). The original ending, however, repeated the shape of chapters 1 and 2. |
| **Total** | **45/60** | |

## 3. Detailed Findings by section

### «In questo capitolo» and § 1 — Dove sta un pezzo

- Strong hook: «La chiusura passa. Il furgone del collega ha un pezzo in meno, la sua assegnazione cade, e l'unica traccia … è una riga «Installazione forzata»». It is declared as invented, it runs three sentences, and it states the thesis.
- **Ambiguous «lettura».** «Il furgone nasce alla prima scrittura che ne ha bisogno, mai a una semplice lettura.» Everywhere else in this chapter «lettura» means a reading with the barcode reader. A reader can take this sentence to mean that reading a codice does not create the furgone, which is the opposite of what Assegna does. The dossier means a database read («created at the first write … never on read»).
- Correct and well handled: the missing stato for pieces gone to the committente («Manca uno stato, e la mancanza è voluta»), the «Sola consultazione» tag, the profile list, the exact «magazzino base non è ancora attivo su questo cliente» message with the «cliente» gloss, and the GOP-767 menu story with the pointer to chapter 2.
- The three glossary traps (Codice, Lotto, carichi) are handled in one paragraph, as planned.

### § 2 — Far entrare il materiale

- **Ambiguous «contatore».** «Sotto il campo un contatore dice quanti codici sono stati letti». In a chapter where «contatore» means the meter, the UI counter needs another word. Same problem in § 4, step 3.
- **Glossary trap 1.** «il QR della scatola del committente è una sequenza di 5 matricole». The architect's trap list allows «matricola» only for a contatore on an utenza, the closure field, and DEV boxes. The dossier ([CONFLICT] 14) says to describe it as «i 5 codici dei contatori».
- **Unsourced frequency.** «Il dubbio più frequente suona così». No source counts doubts.
- **Limite paragraph overloaded.** One paragraph held the no-undo rule, the balancing argument, the staff referral, the format rules, the yellow Lotto notice (full quote), the suspended-imports message (28 words, already in chapter 4) and the Magazziniere. «Il bilanciamento sta prima della conferma» is architect vocabulary from the struttura's «Risk proportionality guards». «I pezzi caricati per errore si portano allo staff tecnico» says the pieces are carried to the staff.
- **On-screen contradiction not addressed.** The dossier ([PUBLIC] § 2; [CONFLICT] 11) records that the resoconto ends with «Un articolo caricato per errore si corregge con un movimento di magazzino: l'importazione non si annulla in blocco.» A reader who sees that line and then reads «staff tecnico» will think the book is out of date. The facts settle it: no office movimento takes a new piece out of the magazzino, because the uscita is «solo gli smontati». Saying this turns a contradiction into a reason.
- The import table, normalisation example, KPI labels, MAX_SCARTI and motivi list are exact.

### § 3 — Dal centrale al furgone

- **Unsourced intensifier.** «confonderli è l'errore più comune».
- **Invented visual.** «Chi vede le righe rosse». The dossier has the riquadro «N caricati, K non caricati:» and the list «codice · motivo». It gives no colour, and the persona never invents interface details.
- **Duplicate.** «Anche i codici letti mentre l'invio è in corso non si perdono…» is repeated almost word for word after the § 4 procedure, where it belongs: the banco is where you read while a confirmation is running.
- **Imprecise consequence.** «Il prezzo di questa scelta è che una cosa fatta sul campo non è automaticamente vera nel registro.» After a forced installation the registro does follow the field: it writes the movimento. The real cost is that the registro moves a colleague's piece and assignment without anyone in the office deciding it.
- The forward reference «non viene mai contato come mancante nell'inventario del furgone» states as present a feature whose app screens are not released (feature-status rule).
- The movimenti table, Rientro rules, «Registra rientro» and the closure dettagli are exact. The two-way trap paragraph (re-confirm all: harmless; close the window: the operatore leaves without contatori) is the best passage in the chapter.

### § 4 — Il Magazziniere

- **Intensifier and overstatement.** «è il modo più sicuro di saltare un pezzo», and «un modo di lavorare che non chiede mai di staccare le mani dal lettore». Step 1 of the procedure says to choose the operatore from a menu first, and step 2 says the field does not come back by itself after the menu or a button.
- **Researcher voice in reader text.** «l'etichetta non è stata verificata nel codice». The wiki attribution is enough for the reader, and the wiki is in the Fonti.
- «È il principio del privilegio minimo, e il profilo ha esattamente i due permessi del magazzino.» The second clause repeats «Ha i permessi … e nient'altro» from two paragraphs earlier.
- The «Dal telefono» paragraph is correctly dated («Al 25 novembre 2026 … non sono rilasciate»). It matches Jira GOP-856 «Da completare».

### § 5 — Sostituzioni con i DDT

- **Ambiguous «ritirare».** «alcune non si possono più ritirare». In this chapter «ritiro» is the operatore's pickup with Carica, so the sentence can be read as «some pieces can no longer be picked up».
- **Count error.** «la chiusura fa tre cose in più rispetto all'installazione». The dossier lists three independent movimenti in total: installazione, smontaggio and consumo. That is two more than the installation. The anomalie are consequences, not movimenti.
- **Internal contradiction.** «Se alla conferma nessun codice riesce, il DDT resta bozza e il numero non viene consumato: «Nessun codice è stato movimentato: il DDT non è stato creato.»» The quoted message says the DDT does not exist. The dossier agrees for the one-shot path used by «Crea DDT»: `affido()`, `reso()` and `uscitaConDdt()` delete the bozza.
- **Unreachable safety net.** «Si controlla l'elenco prima di confermare: una bozza di uscita, quella sì, si può ancora annullare.» Step 6 of the procedure says «Il DDT nasce confermato e numerato». A reader using that procedure never has a bozza di uscita, so the advice protects nothing. The only real checkpoint is before «Crea DDT».
- Exact and well placed: the DDT types table, «Destinazione dei pezzi», the 8 MB attachment limit, the «Annulla DDT…» text, the Smontati cap and the two rejection texts of the uscita.

### § 6 — Quando il magazzino non torna

- Good: step 2 follows [CONFLICT] 9 (no «Dati del pezzo»), the chain «Segna come vista → giacenza unchanged → movimento» is spelled out, and the two counter-objections are answered from sources.
- Table row «Inventario: quantità diversa dal saldo» | «contati M, il saldo dice N». The dossier gives the dettaglio text «risultano N, contati M», and it is better quoted.
- «Gea risponde alle domande più comuni sul magazzino». This is the third unsourced «più comune». The dossier lists the eval topics: carico, importazione, inventario differences, Magazziniere affido.
- **Closing echo.** «Quando Giacenze e lo scaffale, o il furgone, non dicono la stessa cosa, non si aspetta che GOPlanner rimetta a posto…» Chapter 1 ends «Quando qualcosa non torna, l'ordine è questo: …», and chapter 2 ends «Resta una regola da usare ogni volta che qualcosa non torna.» All three follow the same pattern: when it doesn't add up, steps in order, then staff tecnico. The persona's activation phrase 2 forbids an ending that echoes a previous chapter.

### Format and length

- One H1, the «In questo capitolo» paragraph, `## Fonti`, no raw HTML in the body, DEV boxes no longer than 4 lines. The trailing `<!-- … -->` lines are the pipeline template (`ralph.sh`) and appear in every chapter; publishing must strip them.
- Section lengths after corrections: 1,152 / 1,273 / 1,075 / 769 / 1,028 / 1,157. § 2 is above the 1,200 pacing cap, and the body is about 6,450 words against the PRD's «circa 4.000–6.000».

## 4. Persona Audit

**Verdict: on-persona, with four kinds of drift, all corrected.**

The Engineer + Scholar is clearly present. Every section opens on a concrete detail: a menu path, an exact label or a dated condition. Numbers carry their unit and source (20 caratteri, 0–100000, 5000/500, 100 righe, 8 MB, «n/anno»). The persona's «Se una cosa vale solo per alcune commesse, lo dico» is followed throughout: «oggi alcune», «oggi una, dal 23 novembre 2026», «dove la commessa lo ha». So is «Se non lo so, non lo scrivo»: the chapter never quotes «Dati del pezzo» and keeps the pedana QR format open. The thesis sentence («Un pezzo, un posto, un movimento per ogni spostamento») specifies rather than intensifies.

Drift found:

1. **Intensifying instead of specifying.** Five unsourced superlatives: «l'errore più comune», «il dubbio più frequente», «il modo più sicuro di saltare un pezzo», «le domande più comuni», and the absolute «non chiede mai». Activation phrase 2: «I do not intensify — I specify.»
2. **Pipeline vocabulary leaking into prose.** «Il bilanciamento sta prima della conferma» comes from the struttura's risk-guard heading, and «l'etichetta non è stata verificata nel codice» comes from the dossier's caveat.
3. **Invented UI detail.** «righe rosse». «What I never do: inventare etichette dell'interfaccia».
4. **Word collisions the glossary does not cover:** «contatore» as UI counter, «lettura» as database read, «ritirare» as revoke, «matricole» for box codici. A precise writer avoids a homonym in the one chapter where it is a term of art.

## 5. Counter-Objection Check

**Present: 5 (≥ 2 required). All in the reader's voice, all answered from sources.**

| # | Where | Objection | Strongest form? | Evidence-based answer? |
|---|---|---|---|---|
| 1 | § 2 | «Ho importato due volte lo stesso file: adesso ho i contatori doppi?» | Yes, and turned into the section rule (a codice enters once; re-importing completes a stopped import). | Yes: docs § Importazione, wiki «non si ricarica e non si aggiorna». |
| 2 | § 3 | «Ho assegnato i contatori ma l'operatore dice che non li ha nel furgone.» | Yes: a phone call the office actually gets. | Yes: the stato «Assegnata, da ritirare» plus the rejected rows. |
| 3 | § 4 | «Il magazziniere dice che non vede le utenze e gli interventi: è un guasto?» | Medium: an expected reaction to least privilege. | Yes: `Magazziniere::azioneAmmessa`. |
| 4 | § 6 | «Ho segnato l'anomalia come vista: ora il pezzo è a posto?» | Yes, the core misconception of § 6. | Yes, with the consequence (the next assignment is refused). |
| 5 | § 6 | «L'inventario dice che un pezzo manca: lo tolgo dalle giacenze?» | Yes. | Yes: «nessuna rettifica dell'ufficio in questa versione». |

**Missing before corrections:** the strongest objection, the one raised by the screen itself. The resoconto tells the reader «si corregge con un movimento di magazzino», and the book said «staff tecnico». That is now answered in § 2 from the dossier's own facts: no office movimento takes a new piece out of the magazzino, because the uscita is for smontati only. A second strong objection, «perché non bloccare la chiusura invece di forzare?», is answered in substance in § 3 («Il prezzo di questa scelta… Il contrappeso…») but not in the reader's voice. That is acceptable, because the chapter already has five objections.

## 6. Priority Improvements

### Critical (applied)
1. § 5: fix «il DDT resta bozza» so it matches the quoted «il DDT non è stato creato».
2. § 5: replace the bozza di uscita safety net. The checkpoint is before «Crea DDT», which creates and confirms in one go.
3. § 5: «tre cose in più» → «altri due movimenti».
4. § 3: remove the invented «righe rosse» and anchor the trap on the riquadro's real first line, «N assegnati, K non assegnati:».

### Important (applied)
5. § 2: address the resoconto sentence «si corregge con un movimento di magazzino», and split the Limite into prose plus a list of messages. Remove «bilanciamento» and «si portano allo staff tecnico».
6. Remove the five unsourced superlatives and absolutes (§ 2, § 3, § 4, § 6).
7. Fix the word collisions: «contatore» → «riga di conteggio» (twice), «lettura» → «consultare le giacenze», «ritirare» → «annullare», «matricole» → «codici dei suoi 5 contatori».
8. Rewrite the closing so it no longer echoes chapters 1 and 2, and so it closes on this chapter's mechanism: a codice moves only when someone registers a movimento.
9. § 3: restate the cost of the forced installation accurately.
10. Remove the duplicated «letti durante l'invio» rule from § 3 and quote it exactly once, in § 4.

### Optional (left to the Editor)
11. Length. The body is about 6,450 words; the PRD says «circa 4.000–6.000». Cut candidates that lose no NUF:
    - the full anteprima list in § 2 step 4, which could keep three states and say «e gli altri, ciascuno con il motivo»;
    - the Articoli button list in § 5, which could become one sentence;
    - the Articoli example `TAA2 × 2` with «inventato sulla base della documentazione»;
    - the second sentence of the § 1 Limite on the GOP-767 menu story, which chapter 2 already tells.
12. § 6 table, «che cosa fa l'ufficio» column. «registra l'affido mancante» for «Scarico oltre il saldo del furgone» is the Writer's inference, reasonable but not in the dossier. Consider «verifica il saldo e registra il movimento che manca».
13. Publishing: strip the trailing `<!-- … -->` lines in `publish.sh` for every chapter.

## 7. Rewritten Paragraphs

### R1 — § 5, the closing sintesi (Critical)

**Original:**
> Un'uscita confermata non ha «Annulla DDT…». I pezzi sono già dal committente, e l'uscita non si torna indietro. Si controlla l'elenco prima di confermare: una bozza di uscita, quella sì, si può ancora annullare.

**Rewritten:**
> Un'uscita confermata non ha «Annulla DDT…»: i pezzi sono già dal committente, e l'uscita non torna indietro. Una bozza di uscita si potrebbe ancora annullare, ma «Crea DDT» crea e conferma nello stesso gesto. L'elenco dei codici si controlla prima di premerlo, perché dopo non c'è più un passo intermedio.

**Why:** The original promised a safety net the described procedure never produces: step 6 says «Il DDT nasce confermato e numerato», and the dossier confirms that `uscitaConDdt()` does bozza + conferma in one go. Telling a reader to rely on a bozza that never appears means the check happens after the irreversible moment. The rewrite puts the checkpoint where it really is. It also fixes «non si torna indietro», which is not idiomatic.

### R2 — § 5, the failed DDT (Critical)

**Original:**
> «Annulla DDT…» lo dice in chiaro prima di procedere: «…», chiede un motivo obbligatorio e poi una conferma in rosso. Se alla conferma nessun codice riesce, il DDT resta bozza e il numero non viene consumato: «Nessun codice è stato movimentato: il DDT non è stato creato.».

**Rewritten:**
> «Annulla DDT…» lo dice in chiaro prima di procedere: «…», chiede un motivo obbligatorio e poi una conferma in rosso. Se invece, alla creazione, nessun codice riesce, il DDT non nasce e il numero non viene consumato: «Nessun codice è stato movimentato: il DDT non è stato creato.».

**Why:** The sentence contradicted its own quotation. For the path the reader uses («Crea DDT»), the dossier says «with no codice succeeding the bozza is deleted and the number is not used». «Se invece» also marks the change of topic from annulment to creation, which the original ran together.

### R3 — § 2, the Limite paragraph (Important)

**Original:**
> Il rovescio della regola è che un carico non si annulla. Non c'è «Annulla importazione» entro 24 ore: un carico in centrale è un movimento del magazzino e resta nel registro. Il bilanciamento sta prima della conferma, non dopo: il controllo in sola lettura dell'intero file, l'anteprima con lo stato di ogni codice, la garanzia che reimportare non raddoppia nulla. I pezzi caricati per errore si portano allo staff tecnico. Le regole sul formato del codice appartengono alla commessa: … Se compare «Le importazioni sono momentaneamente sospese: il file non è stato importato. Riprova fra qualche minuto; il nostro team è già stato avvisato.», si riprova più tardi. Il Magazziniere, infine, non ha «Importa da Excel» (sezione sul Magazziniere).

**Rewritten:**
> Il rovescio della regola è che un carico non si annulla. L'importazione delle pratiche in una lista nuova si annulla entro 24 ore (vedi il capitolo 4); quella del magazzino no, perché un carico in centrale è un movimento e resta nel registro. Le difese stanno tutte prima della conferma: il controllo in sola lettura dell'intero file e l'anteprima con lo stato di ogni codice. Il resoconto chiude con la frase «Un articolo caricato per errore si corregge con un movimento di magazzino: l'importazione non si annulla in blocco.», ma tra i pulsanti dell'ufficio nessun movimento fa uscire dal magazzino un pezzo nuovo (l'uscita al committente vale solo per i contatori smontati). Per i pezzi caricati per errore, quindi, si chiede allo staff tecnico.
>
> Gli altri limiti si riconoscono da un messaggio:
>
> - i due motivi che finiscono con «… per la commessa»: le regole sul formato sono della commessa, e la pagina mostra il motivo senza applicarle da sé;
> - l'avviso giallo «Il lotto non viene salvato per questa commessa: segnalarlo all'assistenza.»: …;
> - «Le importazioni sono momentaneamente sospese…»: lo stesso messaggio dell'importazione delle pratiche, e si riprova più tardi (capitolo 4).
>
> Il Magazziniere non ha «Importa da Excel» (sezione sul Magazziniere).

**Why:** Four changes.
- The reader will see the resoconto's «si corregge con un movimento di magazzino» on screen. The book now explains why, in practice, that still means the staff tecnico. It uses only dossier facts: «al committente escono solo gli smontati», and no rettifica.
- «Bilanciamento» was architect vocabulary, and «si portano allo staff tecnico» said the pieces are carried there.
- «Non c'è «Annulla importazione» entro 24 ore» assumed the reader remembered chapter 4. The rewrite says what the comparison is.
- The messages are enumerations, which the style bible allows as a list. The 28-word suspension message is already quoted in chapter 4, and the pacing rule says not to explain twice.

### R4 — § 3, the row-by-row trap (Critical)

**Original:**
> … Tutti gli altri sono **già registrati**. Chi vede le righe rosse e pensa che non sia successo nulla, e riconferma tutto, non fa danni: un codice già assegnato non si assegna due volte. Chi chiude la finestra convinto che tutto sia passato, invece, manda un operatore in giro senza i contatori che l'ufficio crede di avergli dato. Si correggono e si riconfermano solo i rifiutati. Anche i codici letti mentre l'invio è in corso non si perdono: restano con la scritta «N codici letti durante l'invio: ancora da confermare.» e chiedono un altro doppio Invio.

**Rewritten:**
> … Tutti gli altri sono **già registrati**, e la prima riga del riquadro lo dice: «N assegnati, K non assegnati:». Chi legge solo l'elenco dei rifiutati, pensa che non sia successo nulla e riconferma tutto non fa danni: un codice già assegnato non è più «In centrale» e non si assegna una seconda volta. Chi chiude la finestra convinto che tutto sia passato, invece, manda un operatore in giro senza i contatori che l'ufficio crede di avergli dato. Si correggono e si riconfermano solo i rifiutati.

**Why:** «Righe rosse» is an invented interface detail with no colour in the dossier. The rewrite replaces it with the real signal the reader can check, the riquadro's first line (dossier: Assegna «assegnati / non assegnati»). «Non si assegna due volte» becomes the mechanism, which a reader can verify in the anteprima: only «In centrale» is sent. The duplicated «letti durante l'invio» rule moves to § 4, where the banco makes it happen.

### R5 — § 3, the cost of the forced installation (Important)

**Original:**
> Il magazzino non fa mai fallire la chiusura: esito e chiusura sono nel capitolo 6. Il prezzo di questa scelta è che una cosa fatta sul campo non è automaticamente vera nel registro. Il contrappeso è che l'anomalia dice esattamente dove era il pezzo, un pezzo già installato non viene spostato, e il conteggio di quelle «Da vedere» sta accanto alla voce del menu.

**Rewritten:**
> Il magazzino non fa mai fallire la chiusura (esito e chiusura sono nel capitolo 6). Il prezzo di questa scelta è che il registro segue il campo senza chiedere a nessuno: il furgone di un collega può perdere un pezzo e un'assegnazione senza che l'ufficio lo abbia deciso. Il contrappeso è che l'anomalia dice esattamente da dove il pezzo è stato tolto, un pezzo già installato non viene spostato, e il numero delle anomalie «Da vedere» sta accanto alla voce del menu.

**Why:** The original said the opposite of what happens. After a forced installation the registro does record the field: it writes «Installazione forzata». The risk is that it moves a colleague's stock without an office decision. That is the hook's story, and the rewrite closes the loop with § 1. «Il conteggio di quelle» was also vague.

### R6 — § 4, the hook of the banco (Important)

**Original:**
> Al banco arrivano scatole a decine. Staccare la mano dal lettore per prendere il mouse, una lettura dopo l'altra, è il modo più sicuro di saltare un pezzo. Per questo esiste un profilo apposta, e un modo di lavorare che non chiede mai di staccare le mani dal lettore.

**Rewritten:**
> Al banco le scatole arrivano una dopo l'altra, e dieci scatole sono già 50 contatori. Se ogni lettura chiedesse un clic, il banco andrebbe al ritmo del mouse. Per questo esiste un profilo apposta, e un modo di lavorare in cui, scelto l'operatore, bastano il lettore e il tasto Invio dalla prima lettura alla conferma.

**Why:** «Il modo più sicuro di saltare un pezzo» is an unsourced superlative. «Non chiede mai di staccare le mani» is contradicted three lines later by steps 1–2 (choose the operatore from a menu; the field does not refocus after a menu or button). The rewrite specifies instead of intensifying. It uses the dossier's own numbers: 5 contatori per scatola, and the riepilogo example «Assegni 50 codici». The «mai» becomes the precise rule: after the operatore is chosen, reader + Invio to the end.

### R7 — Closing paragraph (Important)

**Original:**
> Quando Giacenze e lo scaffale, o il furgone, non dicono la stessa cosa, non si aspetta che GOPlanner rimetta a posto: anomalie e inventario prendono nota e basta. Si registra il movimento che dice il vero, un carico, un'assegnazione, un rientro, un'uscita con il suo DDT. Ci si ferma a chiedere solo quando quel movimento non esiste: un carico fatto per errore, un'uscita già confermata, un QR che il magazzino non riconosce.

**Rewritten:**
> Nel magazzino un codice cambia posto per una ragione sola: qualcuno registra un movimento. Un'anomalia annota una differenza, «Segna come vista» annota chi l'ha letta, e nessuna delle due sposta un pezzo. Se Giacenze dice una cosa e lo scaffale o il furgone un'altra, il rimedio è il movimento che racconta che cosa è successo davvero: un carico, un'assegnazione, un rientro, un'uscita con il suo DDT. Lo staff tecnico serve nei tre casi in cui quel movimento non c'è: un carico fatto per errore, un'uscita già confermata, un QR che il magazzino non riconosce.

**Why:** The original opened with the shape chapters 1 and 2 already use to end: «Quando qualcosa non torna…», an ordered response, then the staff. The rewrite opens on this chapter's own mechanism and restates the § 1 sintesi, so the chapter closes on itself, not on the book's habit. It also drops the inventario from the summary, because its app screens are not released (feature-status rule), and keeps the TARGET's three stop cases.

### R8 — § 2, the box QR (Important)

**Original:**
> Secondo la nota del 23 novembre 2026 su GOP-862, il QR della scatola del committente è una sequenza di 5 matricole separate da punto e virgola (per esempio, inventato, `AB1;AB2;AB3;AB4;AB5`). Il formato del QR della pedana è ancora aperto.

**Rewritten:**
> Secondo la nota del 23 novembre 2026 su GOP-862, il QR della scatola del committente contiene i codici dei suoi 5 contatori separati da punto e virgola (per esempio, inventato, `AB1;AB2;AB3;AB4;AB5`); il formato del QR della pedana, alla stessa data, è ancora aperto.

**Why:** This is glossary trap 1: the chapter's own § 1 says that in the magazzino «Codice» replaces «matricola». It is also the dossier's [CONFLICT] 14 resolution, «describe the scatola QR as i 5 codici dei contatori». «Alla stessa data» dates the open question, as the feature-status rule requires.

### R9 — § 5, the aggancio and the closure count (Important)

**Original:**
> … ognuna di queste cose lascia una traccia, e alcune non si possono più ritirare.
> …
> Dove la commessa lo ha configurato, la chiusura fa tre cose in più rispetto all'installazione.

**Rewritten:**
> … ognuna di queste cose lascia una riga nel registro, e una, l'uscita al committente, non si annulla più.
> …
> Dove la commessa lo ha configurato, la chiusura scrive, oltre all'installazione, altri due movimenti, ciascuno indipendente dagli altri.

**Why:** «Ritirare» is the operatore's pickup in this chapter, so «non si possono più ritirare» reads as a stock statement. The rewrite also names the one irreversible thing, which the section's sintesi then proves. «Tre cose in più» is wrong: the dossier lists three independent movimenti in total (installazione, smontaggio, consumo), each «in its own try». The two anomalie are consequences of the consumo, not extra movimenti.

### Other line edits applied (one-line fixes)

| Where | Original | Rewritten | Why |
|---|---|---|---|
| § 1 | «Il furgone nasce alla prima scrittura che ne ha bisogno, mai a una semplice lettura.» | «Il furgone nasce con il primo movimento che lo riguarda; consultare le giacenze non lo crea.» | «Lettura» means a barcode reading everywhere else in the chapter. |
| § 2 | «Sotto il campo un contatore dice…» | «Sotto il campo una riga di conteggio dice…» | «Contatore» is the meter in this chapter. |
| § 2 | «Il dubbio più frequente suona così» | «Dopo la prima importazione, il dubbio è questo» | Unsourced frequency. |
| § 3 | «e confonderli è l'errore più comune» | «e il registro li tiene distinti: … Tra il primo e il secondo il pezzo è già nel furgone, con uno stato che dice che l'operatore non lo ha ancora preso.» | Unsourced superlative, replaced by the mechanism. |
| § 3 | «non viene mai contato come mancante nell'inventario del furgone.» | «non risulterà mai mancante nell'inventario del furgone (sezione sulle anomalie).» | The inventario app screens are not released; § 6 carries the date. |
| § 4 | «Il contatore mostra quanti codici…» | «La riga di conteggio mostra quanti codici…» | Same collision as § 2. |
| § 4 | «I codici letti mentre la conferma è in corso restano «da confermare» e chiedono un altro doppio Invio.» | «Le letture fatte mentre la conferma è in corso non si perdono: il dialogo resta aperto con «N codici letti durante l'invio: ancora da confermare.», e serve un altro doppio Invio.» | Single home for the rule, with the exact text. |
| § 4 | «Secondo la wiki … Admin › Operatori; l'etichetta non è stata verificata nel codice.» | «Secondo la wiki di assistenza, il collegamento tra operatore e utente si controlla in Admin › Operatori.» | Researcher caveat leaking into the text; the attribution stays. |
| § 4 | «È il principio del privilegio minimo, e il profilo ha esattamente i due permessi del magazzino.» | «È il principio del privilegio minimo.» | Repeats «e nient'altro» from two paragraphs above. |
| § 6 table | «contati M, il saldo dice N» / «verifica e registra» | «la quantità contata non è quella del saldo («risultano N, contati M»)» / «verifica e registra il movimento» | Quote the dossier's dettaglio text; name the action. |
| § 6 | «Gea risponde alle domande più comuni sul magazzino, dal carico all'importazione alle differenze dell'inventario; vedi il capitolo 10.» | «Gea risponde su carico, importazione e differenze dell'inventario (vedi il capitolo 10).» | Unsourced «più comuni»; the dossier lists the eval topics. |

## 8. Verdict

**REVIEWER_CORRECTIONS — 45/60.** The chapter is accurate and on-thesis. It fell short on two § 5 slips, one unreachable safety net, an on-screen contradiction left unexplained, invented or intensified details, and an ending shaped like chapters 1 and 2. All of these are fixed in `chapter_9.md` (21 passages rewritten). Length, at about 6,450 words, is left to the Editor with the cut list in § 6.

Litmus test: *«I lived this» or «I was told this»?* Before corrections it was mostly «told, precisely», with three «lived» moments: the hook, the closed window in § 3, and «Segna come vista» in § 6. After corrections the § 2 and § 5 traps (the resoconto line, the «Crea DDT» checkpoint) are also written as moments the reader will hit at the desk. A new back-office colleague would finish it thinking «I've seen this screen, and I know what it won't do for me».
