# Review — Capitolo 4. Importazione: dal file del committente alla lista

Reviewer, 25 novembre 2026. Letti: `PRD.md`, `STYLE_BIBLE.md`, `chapter_4_struttura.md`, `chapter_4.md`, e `dossier_chapter_4.md` per controllare i fatti.

## 1. Executive Summary

**Verdetto: REVIEWER_CORRECTIONS, 45/60.** Il capitolo è solido e molto fedele al dossier. Etichette e messaggi sono riportati alla lettera, ogni numero ha la sua fonte, ci sono tutte le tabelle previste e le reti di sicurezza sono dette con misura. Tre difetti lo tenevano sotto la soglia del PASS:
1. **Una contraddizione nella spina dorsale del capitolo.** Il caso d'apertura ha 8 scarti per «codice ripetuto» e «senza codice». Ma la sezione 3 dice che proprio questi due casi tengono «Importa» disabilitato. Un lettore attento se ne accorge, e il capitolo non risponde.
2. **Il lavoro di ricerca trapela nel testo.** Almeno sette frasi parlano delle fonti invece che del prodotto: «La wiki avverte che nessuno lo ha provato», «non sono state viste nel browser durante la ricerca per questo capitolo». Non dicono al lettore che cosa fare.
3. **Quattro imprecisioni puntuali.**
   - «nessuno può dire dal gestionale se fosse nel file» ignora l'archivio dei file, 90 giorni anche per la classica.
   - «non si distinguono nel registro» è detto di una voce, la classica, che il registro non lo scrive.
   - I codici troncati sono detti «scartati», ma il controllo blocca «Importa».
   - La somma con le invariate non si può fare a schermo, perché le invariate non hanno un indicatore loro.

Ho riscritto o aggiunto 22 paragrafi, invertito i due riquadri finali e completato le Fonti. Resta aperto un problema: la lunghezza, 6.632 parole contro un tetto di 6.000.

## 2. Score: 45/60 → REVIEWER_CORRECTIONS

| Dimensione | Voto | Motivo in una riga |
|---|---|---|
| 1. Narrative & Structure | 8/10 | Il caso d'apertura torna nella sezione 5 e la chiusura è una regola utile. Però la catena dei «sei anelli» viene annunciata come indice e poi non si usa più, e il caso d'apertura contraddiceva la sezione 3. |
| 2. Language, Style & Voice | 7/10 | Frasi di misura variata, buone chiuse brevi («Va preso alla lettera.», «Nessuna delle due accade per caso.»). Ma ci sono 7 frasi di processo di ricerca, 3 attacchi formulaici alle obiezioni con una frequenza senza fonte, e un «modello» ambiguo (AI o mappatura?). |
| 3. Factual Accuracy | 7/10 | La base è eccellente e i numeri tornano tutti col dossier. Ci sono però la contraddizione sugli scarti, quattro inesattezze, GOP-10 usato nel testo e assente dalle Fonti, e un caso preso da un'anteprima troncata del Portolano senza slug. |
| 4. Audience Alignment | 8/10 | Procedure, etichette e punti di arresto ci sono tutti. Nel testo per l'ufficio però compare gergo DEV («direttamente nella richiesta», «la tabella del registro»), e la somma della regola finale non si poteva fare a schermo. |
| 5. Sensory & Emotional Engagement | 7/10 | Alcuni momenti vissuti funzionano: il giro di domani, «Chi pianifica subito dopo l'importazione chiude da sé la finestra», i codici rovinati che non si vedono. La sezione 2 invece era un catalogo di etichette senza un caso, e «va trattato con cura» dice senza mostrare. |
| 6. Originality & Angle | 8/10 | Tre intuizioni che valgono il capitolo: «la differenza fra le due voci sta nelle reti di sicurezza», «la differenza tra file e lista è una somma», e la diversa esposizione dei dati verso l'AI fra pagina nuova e classica. |
| **Totale** | **45/60** | |

## 3. Detailed Findings by section

### Apertura e «In questo capitolo»
- Il formato è corretto: un solo H1, il paragrafo in corsivo con «In questo capitolo», sei `##`, le `## Fonti` in fondo. I commenti HTML finali sono richiesti da `ralph.sh` (piè di pagina del Writer Stage 2) e li ho lasciati. **Va però verificato che `publish.sh` li tolga**, perché STYLE_BIBLE § Formato vieta l'HTML grezzo.

### Sezione 1 — Che cosa fa un'importazione (735 parole; obiettivo 800)
- **Meta-ricerca nell'aggancio.** «Il caso viene dal banco di prova di Gea, con un'istantanea del 9 novembre 2026, e la fonte non dice se sia un episodio vero o uno scenario costruito.» Il dubbio sulla provenienza è una nota per l'Editor. Al lettore basta sapere che è uno scenario del banco di prova. → Riscritto.
- **Meta-ricerca sul limite di 10 MB.** «La wiki avverte che nessuno lo ha provato. Per la pagina nuova la configurazione del server non è riportata nelle fonti di questo capitolo.» Sono due frasi che non servono a chi importa. Il dossier dice invece una cosa utile: un caricamento troppo grande per il server produce un messaggio di errore. → Riscritto.
- «ma la wiki le descrive come strumenti usati da alcune commesse e non ne verifica il funzionamento» → Riscritto.
- La catena dei «sei anelli» è annunciata con «questo capitolo li segue nell'ordine», ma nessuna sezione la richiama. → Opzionale (vedi § 6).
- Punto di forza: «La pagina nuova salva le pratiche con lo stesso percorso della classica. […] la differenza fra le due voci sta nelle reti di sicurezza intorno al file». È la sintesi migliore del capitolo.

### Sezione 2 — La mappatura (1.230 parole; obiettivo 950 ± 100 → **sopra**)
- **Catalogo senza esempio.** Elenchi di etichette (quattro scelte, sette stati, cinque cartellini) e nessun caso che faccia vedere una colonna spostata e ritrovata. → Aggiunto un esempio dichiarato come inventato (matricola da C a E).
- **Attacco formulaico con frequenza senza fonte:** «Un dubbio ricorrente: …». → Tolto.
- **Caso senza fonte tracciabile.** Il dossier stesso avverte che i fatti del Portolano vanno usati «solo dove sono confermati da codice o wiki». Il caso del telefono finito sul PDR viene da una scheda senza slug, letta in un'anteprima troncata, e non era nelle Fonti. Ho tolto la parte più specifica e non confermata («che da allora trova da solo dove cominciano i dati») e aggiunto la scheda alle Fonti, dichiarata «senza slug». **Se il Researcher non trova uno slug o una conferma nel codice, il caso va tolto.** La risposta all'obiezione regge anche senza.
- «Le fonti danno come ancora aperta la decisione su questa differenza.» Dice all'amministratore che c'è un problema, ma non che cosa può fare. → Sostituito con l'azione: l'AI dell'importazione si spegne nella configurazione della commessa, per tutte e due le voci.
- La sottosezione sull'AI e il riquadro DEV sono corretti.

### Sezione 3 — Importare passo per passo (1.176 parole; obiettivo 1.050 ± 100 → poco sopra)
- La procedura è eccellente: 13 passi, un'azione per passo, etichette verificate nel dossier (il dossier corregge giustamente «Scheda 1» in «1 · Mappatura»).
- **Gergo DEV nel testo per l'ufficio:** «una commessa che non ha ancora la tabella del registro delle importazioni importa come prima, direttamente nella richiesta». Il lettore non vede tabelle né richieste HTTP. Vede invece il messaggio «Il registro delle importazioni non è ancora attivo per questa commessa.». → Riscritto con il segnale che si vede a schermo.
- **Meta-ricerca:** «quelle elencate qui non sono state viste nel browser durante la ricerca per questo capitolo». → Riscritto in termini del lettore.
- «Il dubbio più comune riguarda le interruzioni.» è un superlativo senza fonte. → Tolto.
- Riga tagliata: il riassunto prima di «Importa» ripeteva «Nulla è scritto finché non premi Importa», già detto al passo 2.

### Sezione 4 — Reimportazione (1.068 parole; obiettivo 950 ± 100 → al limite)
- La tabella dei sei casi è corretta. Usa il testo del resoconto, che è quello che l'utente vede, e non la costante `CASI`, come risolve il dossier [CONFLICT].
- «Il quinto caso fa l'opposto, e per questo va trattato con cura.» «Con cura» non dice nulla. Il dossier dà la posta vera: un'importazione che ha annullato appuntamenti non si annulla più in blocco. → Riscritto.
- La **contro-obiezione di riserva** («raddoppio le pratiche?») era giusta ma incompleta. Le pratiche non raddoppiano, ma importando lo stesso file in una «Lista nuova» le pratiche aperte passano alla lista nuova e la vecchia non le conta più. È la sorpresa che il lettore deve conoscere. → Completata.
- «Vengono dalla tavola 04 di uno studio interno»: la «tavola 04» non compare nell'interfaccia. → Tolta; resta «REV.1», che invece il lettore vede.
- «il riferimento all'agente vocale «Sara» nella tavola 04 […] e le fonti non dicono quali siano»; «non è stato letto nel codice, e qui non si descrive». → Riscritto. Il limite resta, ma con un punto di arresto: chiedere allo staff tecnico prima di usare «Reimport data» o «Continua importazione» su una lista già pianificata.

### Sezione 5 — Esito (1.022 parole; obiettivo 950 ± 100)
- **Critico: contraddizione non risolta.** Sezione 3: «I codici ripetuti nel file […] Le righe senza «Codice»» bloccano «Importa». Sezione 5: «gli otto scarti avevano due motivi, cinque codici ripetuti e tre righe senza codice». Il dossier segnala lo stesso punto in [CONFLICT] («Senza codice» come motivo di scarto) e nessuno lo aveva portato nel testo. → Aggiunto un paragrafo-obiezione che risolve il punto con le fonti.
- **Somma non eseguibile.** «le righe lette sono importate più ignorate più invariate più scartate». Gli indicatori del resoconto (`disegnaEsito()`, dossier r. 149) sono «Importate», «Pratiche nuove», «Già presenti», «Ignorate», «Scartate», «Tempo»: le invariate non ci sono. → Aggiunta una frase che dice come ricavarle. *Da confermare a schermo dall'Editor.*
- **Inesatto:** «nessuno può dire dal gestionale se fosse nel file». Il dossier dice che anche il file della classica si copia nell'archivio della commessa e si conserva 90 giorni (`ImportazioneArchivio`). → Corretto.
- **Inesatto:** «Nella classica, inoltre, l'anteprima e l'importazione non si distinguono nel registro». La classica non scrive il registro. Il runbook parla del file archiviato. → Corretto.

### Sezione 6 — Tracciato (1.291 parole; obiettivo 1.000 ± 100 → **sopra**)
- Ottimo aggancio con il caso GOP-10 e la svolta «Allora serviva lo staff tecnico. Oggi …». Ma **GOP-10 non era nelle Fonti.** → Aggiunto, insieme a GOP-815 e a `js/code/job-progress.js`.
- **Inesatto rispetto alla sezione 3:** «due codici troncati diventano uguali e uno finisce scartato come «codice ripetuto nel file»». Con la pagina nuova il controllo blocca «Importa». La frase «La catena porta dalla colonna del «Codice» della mappatura alle sei regole della reimportazione» dice il legame invece di mostrarlo. → Paragrafo riscritto.
- **Ambiguità:** «mai da una decisione del modello». In questo capitolo «modello» vuol dire modello di mappatura, quindi il lettore capisce il contrario. → «mai da una decisione di Gea».
- Struttura: il riquadro DEV stava fra il riquadro staff e la regola d'indagine, e allontanava il punto 5 della regola («scrivete allo staff tecnico») dal riquadro che dice come farlo. → Ho invertito i due riquadri.

## 4. Persona Audit

**Prima della revisione: in gran parte nel personaggio, con una deriva precisa.** The Engineer + The Scholar si vede nelle etichette alla lettera, nei numeri con la loro unità, nel «come si rompe e come si rimedia» (tabella sintomo → rimedio) e in un Limite per sezione. La deriva non è verso la prosa da assistente, che è assente: nessuna frase della § Banned patterns. È verso la **prosa da dossier**. Il Writer racconta che cosa le fonti sanno e non sanno («la fonte non dice», «la wiki avverte», «le fonti registrano», «le fonti danno come ancora aperta», «non sono state viste nel browser», «non è stato letto nel codice», «le fonti non dicono quali siano»). La frase-guida della persona è «*Se non lo so, non lo scrivo*», non «scrivo che non lo so». Quando un limite di conoscenza serve al lettore, va detto nei suoi termini, con un'azione: «chiedete allo staff tecnico prima di usarla». Altrimenti va tolto.

Seconda deriva, minore: tre attacchi di contro-obiezione con una frequenza inventata («Un dubbio ricorrente», «Il dubbio più comune», «Una domanda si sente spesso»). È l'«in genere» senza fonte che la persona non usa mai. Tolti tutti e tre.

**Dopo la revisione:** nessuna frase di processo di ricerca rimasta. L'unica traccia voluta è «Questa guida non descrive «Reimport data» e «Continua importazione»», che è un limite con un'azione.

## 5. Counter-Objection Check

| # | Dove | Obiezione | Forma più forte? | Risposta con fonti? |
|---|---|---|---|---|
| 1 | s. 2 (riserva) | «Ma la mappatura «Automatica (regole e AI)» può mettere una colonna nel campo sbagliato?» | Sì: concede («Può proporlo») e porta un caso | Sì: soglia 0,9, «Proposta» blocca «Importa», controlli, 24 ore (`ImportazioneRegole`, `OpenAIImporterHelper`, `motivoBlocco()`). Il caso ha una fonte debole (vedi s. 2). |
| 2 | s. 3 (obbligatoria) | «Ma se l'importazione si ferma a metà, o chiudo la pagina, devo ricominciare da capo e ottengo una lista doppia?» | Sì | Sì: coda, «Annulla lavoro», ripresa, criterio di accettazione del GOP-745. Condizioni di ripresa dette subito dopo. |
| 3 | s. 4 (riserva) | «Ma se reimporto lo stesso file due volte, raddoppio le pratiche?» | Ora sì: prima mancava il caso «Lista nuova», che è quello che sorprende | Sì: `ImportazioneReimportazione` (casi `aperta`, `conclusa`), proposta della lista con lo stesso nome. |
| 4 | s. 5 (aggiunta dal Reviewer) | «Ma se il controllo sul file intero tiene «Importa» disabilitato quando ci sono codici ripetuti o righe senza codice, come arrivano quegli scarti nel resoconto?» | Sì: è l'obiezione che il capitolo stesso faceva nascere | In parte: dossier [CONFLICT] «Senza codice». L'esempio del codice composto viene dalla risoluzione del Researcher; i casi concreti restano [UNVERIFIED]. |
| 5 | s. 5 (obbligatoria) | «Ma se uso l'Importazione classica, dove vedo quali righe sono rimaste fuori?» | Sì | Sì: `pages/file.php` r. 1315–1330, wiki `stato-import-export.md`. Ora con il rimedio dell'archivio. |

Le due obbligatorie ci sono. Con le tre di riserva o aggiunte il totale è cinque.

## 6. Priority Improvements

### Critical
- ✅ **Applicato.** Risolta la contraddizione fra il caso d'apertura (scarti per codici ripetuti e senza codice) e i controlli che bloccano «Importa» (s. 5, nuovo paragrafo; s. 6, codici troncati).
- ✅ **Applicato.** Tolte le 7 frasi di processo di ricerca e sostituite con limiti in termini del lettore (s. 1 ×3, s. 2 ×2, s. 3, s. 4).

### Important
- ✅ **Applicato.** La classica ora dice che il file originale resta nell'archivio per 90 giorni (s. 5).
- ✅ **Applicato.** Corretto «non si distinguono nel registro» (s. 5).
- ✅ **Applicato.** Detto come si ricavano le invariate dalla somma (s. 5). *L'Editor confermi a schermo che il resoconto non mostra un indicatore «Invariate».*
- ✅ **Applicato.** Fonti: aggiunti GOP-10, GOP-815, `js/code/job-progress.js` e la scheda Portolano senza slug.
- ✅ **Applicato.** «decisione del modello» → «decisione di Gea» (s. 6).
- ✅ **Applicato.** Gergo DEV nella ripresa sostituito con il messaggio a schermo (s. 3).
- ⚠️ **Da fare al prossimo giro.** Il capitolo è a 6.632 parole contro un tetto di 6.000. Le correzioni hanno aggiunto circa 200 parole per chiudere buchi di fatto; i 3 tagli applicati ne hanno tolte circa 60. Tagli consigliati, nell'ordine:
  1. in s. 2 trasformare i sette stati e i cinque cartellini in una tabella a due colonne;
  2. in s. 6 accorciare il paragrafo «Le reti di sicurezza sono scritte nel codice», che ripete l'elenco già nella procedura;
  3. in s. 6 tenere una sola delle due diagnosi citate di Gea;
  4. in s. 3 accorciare il paragrafo «Lista nuova o lista esistente», che ripete i passi 8–9.
- ⚠️ **Da fare al prossimo giro.** Caso «telefono sul PDR» (s. 2): trovare uno slug o una conferma nel codice, altrimenti toglierlo.

### Optional
- Usare davvero la catena dei sei anelli come indice: una frase alla fine del secondo paragrafo che dica quale sezione segue quale anello. Oppure togliere «e questo capitolo li segue nell'ordine».
- In s. 5, «rifiutata dai controlli del tenant»: «va corretta secondo quelle regole» non dice dove si trovano quelle regole. Aggiungere il punto di arresto (staff tecnico) se il dossier lo sostiene.
- Nella tabella dei sei casi, distinguere in una nota «annullata» come stato in GOPlanner (caso «conclusa») da «ANNULLATA» come valore nel file (quinto caso). Un lettore veloce li confonde.
- Gli URL `file.php?action=importa` / `?action=tabulati` nel testo per l'ufficio (s. 1) starebbero meglio nel riquadro DEV.

## 7. Rewritten Paragraphs

### R1 — Aggancio d'apertura (s. 1)
**Original:** «Un lunedì mattina un amministratore importa il file arrivato in giornata e poco dopo scrive a Gea: «ho importato il file di stamattina ma mancano delle utenze». Il caso viene dal banco di prova di Gea, con un'istantanea del 9 novembre 2026, e la fonte non dice se sia un episodio vero o uno scenario costruito. La risposta attesa è comunque una somma. […] In GOPlanner non c'è niente da indagare: […]»

**Rewritten:** «Lunedì 9 novembre 2026, alle 11.30, un amministratore scrive a Gea: «ho importato il file di stamattina ma mancano delle utenze». È uno degli scenari del banco di prova su cui si verifica Gea, e la risposta che Gea deve dare è una somma. […] In GOPlanner non c'è niente da cercare: […]»

**Why:** la data e l'ora esatte del banco sono il dettaglio concreto. «Scenario del banco di prova» dichiara la natura del caso senza aprire, nella prima riga del capitolo, una nota sulla provenienza delle fonti. «Indagare» lasciava a metà il rimando alla «regola d'indagine» finale; «cercare» è più semplice.

### R2 — Limite di dimensione (s. 1)
**Original:** «Il limite di 10 MB è letto dal codice e ha il suo messaggio: «Il file eccede la dimensione massima consentita (max 10MB)». La wiki avverte che nessuno lo ha provato. Per la pagina nuova la configurazione del server non è riportata nelle fonti di questo capitolo.»

**Rewritten:** «Nella classica un file oltre i 10 MB si ferma con il messaggio «Il file eccede la dimensione massima consentita (max 10MB)». La pagina nuova non ha un limite suo: se il file supera quello del server, il caricamento non riesce e la pagina mostra un messaggio di errore.»

**Why:** tre frasi su che cosa sanno le fonti diventano due frasi su che cosa vede il lettore. Il dossier (r. 27) dice proprio questo: nessuna costante per la pagina nuova, messaggio di errore se il caricamento supera il limite del server.

### R3 — Contro-obiezione sui doppioni (s. 4)
**Original:** «Una domanda si sente spesso: «Ma se reimporto lo stesso file due volte, raddoppio le pratiche?» No. […] L'unica pratica nuova che nasce da un codice già noto è quella conclusa, e lo storico della vecchia resta com'era.»

**Rewritten:** ««Ma se reimporto lo stesso file due volte, raddoppio le pratiche?» No. […] L'unica pratica nuova che nasce da un codice già noto è quella conclusa, e lo storico della vecchia resta com'era. Le pratiche non raddoppiano, ma la lista può cambiare. Se il file ha lo stesso nome di una lista aperta, la pagina propone quella lista, e con «Ignora i duplicati» le pratiche che la lista ha già restano come sono. Se invece scegliete «Lista nuova», le pratiche aperte passano nella lista nuova e la vecchia non le conta più.»

**Why:** l'obiezione nella forma più forte non è «raddoppio?» ma «che cosa succede alla mia lista?». Il caso `aperta` del dossier («la porta in questa lista; la lista vecchia non la considera più») risponde, e mostra la conseguenza che sorprende. Tolta anche la frequenza inventata «si sente spesso».

### R4 — La somma e la contraddizione sugli scarti (s. 5)
**Original:** «La somma deve tornare: le righe lette sono importate più ignorate più invariate più scartate. Nel caso del banco tornava, 112 più 8 fa 120, e gli otto scarti avevano due motivi, cinque codici ripetuti e tre righe senza codice. Il conto chiude l'indagine prima ancora di aprire il file.»

**Rewritten:** «La somma deve tornare: le righe lette sono importate più ignorate più invariate più scartate. Le invariate non hanno un indicatore loro: se «Importate», «Ignorate» e «Scartate» insieme restano sotto le righe lette, la differenza sono loro. Nel caso del banco la somma tornava, […]. Il conto chiude l'indagine prima ancora di aprire il file.

Chi ha seguito la procedura può obiettare: «Ma se il controllo sul file intero tiene «Importa» disabilitato quando ci sono codici ripetuti o righe senza codice, come arrivano quegli scarti nel resoconto?» Con la pagina «Importazione» il controllo li trova prima, e il file si corregge prima di importare. I due motivi restano nel resoconto per i casi che il controllo non ferma allo stesso modo, per esempio una commessa che compone il codice da più colonne. Lo scenario del banco insegna a leggere la somma, e la somma vale per qualunque motivo.»

**Why:** la regola finale (passo 1) chiede una somma che a schermo non si poteva fare. E il caso su cui il capitolo è costruito contraddiceva la sezione 3. Ora la contraddizione è un'obiezione esplicita con la risposta del dossier ([CONFLICT] «Senza codice»), e non una crepa che il lettore trova da solo.

### R5 — Classica: che cosa resta (s. 5)
**Original:** «Se il committente chiede perché un'utenza non è mai stata visitata, nessuno può dire dal gestionale se fosse nel file. Per avere il dettaglio degli scarti serve la pagina «Importazione», quando il modello della commessa lo permette.»

**Rewritten:** «Se il committente chiede perché un'utenza non è mai stata visitata, il gestionale non dice se la sua riga era nel file né perché non è entrata. Resta il file originale: anche quello della classica si copia nell'archivio della commessa e si conserva 90 giorni, salvo un'impostazione diversa della commessa. Per avere il dettaglio degli scarti serve la pagina «Importazione», quando il modello della commessa lo permette.»

**Why:** «nessuno può dire» era falso. `ImportazioneArchivio` copia ogni file caricato, classica compresa. La posta resta (il gestionale non lo dice), ma il lettore sa da dove partire.

### R6 — Codici rovinati (s. 6)
**Original:** «Il «Codice» non coincide più con quello salvato. La pratica, che c'era già, non viene riconosciuta come presente: diventa una pratica nuova, oppure due codici troncati diventano uguali e uno finisce scartato come «codice ripetuto nel file». La catena porta dalla colonna del «Codice» della mappatura alle sei regole della reimportazione.»

**Rewritten:** «Il «Codice» non coincide più con quello salvato, e per GOPlanner è un codice mai visto. Invece di uno dei casi di pratica già presente, che per esempio tiene l'appuntamento, scatta il caso della pratica nuova: nasce un'utenza con il codice sbagliato, mentre quella vera resta dov'era. Se due codici troncati diventano uguali, il controllo sul file intero li segnala come codici ripetuti e «Importa» resta disabilitato. Negli altri casi il segnale va cercato, e lo trova la verifica del file con Gea descritta qui sotto.»

**Why:** «La catena porta da … a …» dichiarava il legame con la sezione 4 invece di mostrarlo. Ora si vede che cosa va storto: un'utenza in più, quella vera ferma. Corretta anche l'incoerenza con la sezione 3: con la pagina nuova i codici ripetuti bloccano, non finiscono scartati.

### R7 — Il quinto caso (s. 4)
**Original:** «Il quinto caso fa l'opposto, e per questo va trattato con cura. Il file stesso dice che la pratica è annullata, e GOPlanner annulla l'appuntamento.»

**Rewritten:** «Il quinto caso fa l'opposto. Il file stesso dice che la pratica è annullata, e GOPlanner annulla l'appuntamento. Quell'annullamento non torna indietro, nemmeno annullando l'importazione: lo spiega la sottosezione *Annullare un'importazione*.»

**Why:** «va trattato con cura» è un'intensificazione («I do not intensify — I specify»). La specifica è nel dossier: `motivoNonAnnullabile()` rifiuta l'annullamento se il file ha annullato pratiche.

### R8 — Ripresa senza registro (s. 3)
**Original:** «E una commessa che non ha ancora la tabella del registro delle importazioni importa come prima, direttamente nella richiesta, senza registro, senza coda e quindi senza ripresa.»

**Rewritten:** «E serve il registro delle importazioni: dove l'elenco «Ultime importazioni» dice «Il registro delle importazioni non è ancora attivo per questa commessa.», l'importazione si fa come prima, dentro la pagina, senza coda e quindi senza ripresa.»

**Why:** «tabella» e «richiesta» sono parole del codice in una sezione «Per il back office». Il lettore non vede la tabella, vede quel messaggio: ora ha un segnale riconoscibile.

### R9 — Limiti finali della sezione 4
**Original:** «Il caso «nel file con stato ANNULLATA», l'elenco «Pratiche da richiamare» e il riferimento all'agente vocale «Sara» nella tavola 04 valgono solo per le commesse che lavorano con il call center, e le fonti non dicono quali siano […] Il comportamento esatto di «Reimport data» e di «Continua importazione» non è stato letto nel codice, e qui non si descrive.»

**Rewritten:** «Il caso «nel file con stato ANNULLATA» e l'elenco «Pratiche da richiamare» valgono solo per le commesse che lavorano con il call center: per il call center vedi il capitolo 15. […] Questa guida non descrive «Reimport data» e «Continua importazione»: prima di usarle su una lista già pianificata, chiedete allo staff tecnico che cosa fanno con la mappatura della vostra commessa.»

**Why:** «Sara» e la «tavola 04» non compaiono nell'interfaccia. «Non è stato letto nel codice» è un'informazione per l'Editor. Il limite resta, e diventa un punto di arresto (PRD § 5: il lettore deve sentirsi «sicuro di dove fermarsi»).

## 8. Litmus test

*«Il lettore finisce pensando "l'ho vissuto" o "me l'hanno detto"?»*

- **Prima della revisione:** «l'ho vissuto» per le sezioni 3, 4 e 6 (il giro di domani, la finestra di 24 ore che si chiude da sé pianificando, i codici che Excel rovina). «Me l'hanno detto» per la sezione 2, un catalogo di etichette, e per i passaggi in cui la voce raccontava le fonti invece del prodotto. Il caso d'apertura, poi, si incrinava proprio dove il lettore lo ricontrollava.
- **Dopo la revisione:** «l'ho vissuto» per tutto il capitolo, con la sezione 2 ancora un po' più fredda delle altre. Il litmus della struttura («un collega nuovo importa, spiega perché la lista ha meno pratiche, sa quando fermarsi») ora passa: la somma si può fare a schermo e i punti di arresto sono detti.

## 9. Verdict

**REVIEWER_CORRECTIONS** — capitolo accurato e utile, frenato da una contraddizione sul caso d'apertura, da frasi di processo di ricerca e da quattro inesattezze. Ho corretto tutto questo in 22 paragrafi; resta da ridurre la lunghezza (6.632 parole contro 6.000).
