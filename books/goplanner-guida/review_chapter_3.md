# Revisione — Capitolo 3: Utenze, liste, pratiche, lotti e carichi

Reviewer, 25 novembre 2026. Letti: `PRD.md`, `STYLE_BIBLE.md`, `chapter_3_struttura.md`, `chapter_3.md`, `dossier_chapter_3.md`. Fatti controllati sul dossier e, per tre punti dubbi, sul codice del ramo `php8` (commit `21e974921`): `lib/ImportazioneEsecuzione.php`, `lib/ImportazioneReimportazione.php`, `lib/VistaTendinaListe.php`, `lib/MobileV3/Domain/EsitoWriter.php`. Per la coerenza fra capitoli: `chapter_2.md` (chiusura), `chapter_6.md` e `dossier_chapter_6.md` (Verifica unica).

## 1. Executive Summary

Il capitolo è forte. L'ufficio trova le etichette, le procedure, l'ordine dei controlli e i pulsanti senza ritorno; lo sviluppatore trova le tabelle giuste nei riquadri. Tre pagine (la lista che sparisce dalla tendina, «assegnato» dopo la chiusura, «Chiudi carico») sono documentazione di livello Kidder: un caso, un meccanismo, un controllo, una data.
Ci sono però quattro difetti che un lettore scettico vede subito:
1. la sezione 1 dice che File › Importazione crea «sempre» una lista nuova, ma due paragrafi dopo la tabella elenca «lista nuova / lista esistente»;
2. le regole di reimportazione sono presentate come generali, mentre valgono solo per File › Importazione;
3. il punto 3 dei controlli della tendina sbaglia su quando si rinnova la copia salvata;
4. la chiusura ripete la mossa finale del capitolo 2 («una regola da usare ogni volta: chiedetevi, in ordine…»).
Si aggiungono una voce che a tratti scivola nel commento sulle fonti («le fonti non dicono…») e i dettagli da staff nella prosa per l'ufficio.
**Verdetto: 47/60 → REVIEWER_CORRECTIONS. 24 paragrafi riscritti direttamente in `chapter_3.md`.**

## 2. Score: 47/60 → REVIEWER_CORRECTIONS

| # | Dimensione | Voto | Motivo in una riga |
|---|---|---|---|
| 1 | Narrative & Structure | 8/10 | Mappa → utenza → lista → lotto → stato → campi regge e paga le tensioni promesse; titolo della sezione 1 contraddetto dal testo, controobiezione della sezione 4 mal collocata, chiusura che riecheggia il capitolo 2. |
| 2 | Language, Style & Voice | 8/10 | Frasi esatte e ritmate («Un lotto sbagliato su una lista non produce un errore: produce una lista che qualcuno non vede.»); scivolamenti nel commento sulle fonti, impalcatura «C'è un limite» visibile cinque volte. |
| 3 | Factual Accuracy | 7/10 | Quasi tutto tracciabile e datato; una contraddizione interna nella sezione 1, una regola non circoscritta, un rimedio sbagliato nella diagnosi, due affermazioni [UNVERIFIED] date per certe, una incoerente con il capitolo 6. |
| 4 | Audience Alignment | 8/10 | L'ufficio ha tutto ciò che il PRD promette; il riquadro staff annunciato nella sezione 2 non c'era e i dettagli di «Consolida utenze» erano nella prosa per l'ufficio, con le «righe» del database. |
| 5 | Sensory & Emotional Engagement | 8/10 | Concretezza alta: «Valore salvato in carichi.lotto», «Edit» non tradotto, i messaggi senza accenti, i 200 interventi del 15 ottobre, «ieri» al posto di una data. Le sezioni 2 e 6 restano più elenco che esperienza. |
| 6 | Originality & Angle | 8/10 | Tre intuizioni che il lettore non trova altrove: lo stato è una copia, «Cliente» è il nome della lista, «Dove si vede» è una domanda che nessuno legge. La chiusura, nella forma, era già stata usata dal capitolo 2. |

## 3. Detailed Findings by section

### Sezione 1 — Dal file del committente all'intervento

- **[Critico, corretto] Contraddizione interna.** Testo: «Con la pagina File › Importazione la lista è sempre nuova: il codice dice che non si aggiunge in silenzio a una lista con lo stesso nome di file.» La tabella della stessa sezione dice «"lista nuova / lista esistente" in File › Importazione», e la sezione 3 apre con «File › Importazione dice «lista nuova» e «lista esistente»». Il dossier (§ C, wiki `import-carico.md`) e il codice (`lib/ImportazioneController.php`: «Una lista esistente scelta apposta vince», GOP-745) confermano la lista esistente. L'intestazione di `ImportazioneEsecuzione.php` che il Writer ha citato risale a GOP-478 ed è superata.
- **[Critico, corretto] Regole di reimportazione presentate come generali.** Testo: «L'importazione riconosce un'utenza per codice, su tutta la commessa. […] GOPlanner riusa la stessa utenza…». Le sei regole sono di `ImportazioneReimportazione` e valgono per File › Importazione; il codice dice che sostituiscono «le caselle dell'importazione classica (Ignora duplicati, Reimport data, Sovrascrivi dati, Continua importazione), che restano solo li'». Mancava anche il caso dell'appuntamento da svolgere, che giustifica il «1.200 pratiche al massimo».
- **[Importante, corretto] Titolo smentito dal corpo.** Il titolo diceva «sei oggetti, uno dentro l'altro», il corpo: «Lotto e distretto, invece, non sono contenitori: sono etichette scritte sulla lista.» Nuovo titolo: «quattro oggetti e due etichette».
- **[Minore, corretto] Aggancio che esagera.** «la risposta giusta non è 1.200»: può esserlo, se tutti i codici sono nuovi e non ci sono scarti. Ora: «non è per forza 1.200».
- **[Minore, corretto]** «C'è un limite da tenere presente.» fa vedere l'impalcatura del paragrafo «Limite».

### Sezione 2 — L'utenza

- **[Importante, corretto] Promessa di pubblico non mantenuta.** Il rigo dice «*Per l'ufficio, con un riquadro per lo staff tecnico.*», ma l'unico riquadro era «Quando chiedere allo staff tecnico», che è per l'ufficio. I dettagli da staff erano nella prosa: «Per ogni codice crea un'utenza che unisce i valori non vuoti di tutte le righe con quel codice, […] e cancella le righe vecchie. Si lancia su al massimo 500 codici per volta…». Ora sono in un riquadro `> **Per lo staff tecnico:**`, e «righe» è diventato «utenze» (glossario: «riga» solo per il file).
- **[Importante, corretto] Commento sulle fonti.** «Il codice ripetuto da una pratica conclusa è un'origine certa dei duplicati, ma le fonti non dicono che sia l'unica.» La persona dice «Se non lo so, non lo scrivo». Ora: «È una delle origini dei doppioni, ed è prevista dalle regole dell'importazione.»
- **[Minore, corretto]** «Il pulsante «Modifica» della griglia non è stato verificato in tutte le commesse» travisa il dossier («segnato "Non verificato"», senza riferimento alle commesse) e parla al lettore dello stato della documentazione.
- **[Minore, corretto]** «le coordinate che servono alla mappa e allo smistamento»: «smistamento» non è nel dossier.

### Sezione 3 — Lista e pratica

- **[Importante, corretto] «Cliente» non circoscritto.** «contiene il nome della lista, quello scritto in «lista nuova» al momento dell'importazione». Il dossier (C2) lo stabilisce per File › Importazione; per i percorsi classici è [UNVERIFIED] (alcune commesse vecchie scrivevano un nome di committente). Ora: «Nelle liste create con File › Importazione contiene il nome della lista…».
- **[Importante, corretto]** «Le fonti non dicono quali commesse usino davvero ciascun valore.» Stesso difetto di voce della sezione 2; tolto. Spiegato meglio il valore fuori elenco.
- **[Minore, corretto]** La sintesi «Lista e carico sono lo stesso oggetto con due nomi.» usava «carico» fuori dalle virgolette, contro il glossario del capitolo. Ora richiama anche «non la riga del file» (NUF 2).
- **[Opzionale, non corretto]** Sezione a 1.212 parole (tetto 1.200). Candidata al taglio: «Nel dizionario dell'interfaccia l'inglese *Batch* è tradotto «Carico».», che starebbe meglio nel riquadro per gli sviluppatori.

### Sezione 4 — Lotto e distretto

- **[Critico, corretto] Rimedio sbagliato al punto 3.** Testo: «Il rimedio è assegnare il lotto all'utente o correggere il lotto della lista […]. Anche qui la copia salvata non si rinnova da sola.» Il dossier (§ L) e `lib/VistaTendinaListe.php` dicono che la chiave della copia «dipende dalla query (quindi dall'utente, dai lotti e dalle opzioni)». Assegnare un lotto all'utente cambia la query, quindi la chiave; correggere il lotto della lista no. La frase ora vale solo per il secondo rimedio.
- **[Importante, corretto] Rimedio senza fonte al punto 1.** «il lavoro che resta va portato in un'altra lista con una nuova importazione (capitolo 4)» non è nel dossier. Ora il testo dice soltanto ciò che segue dalle condizioni della tendina: serve una lista aperta, e il capitolo 4 spiega come prepararla.
- **[Importante, corretto] Controobiezione mal collocata.** «Il giorno della pianificazione l'ufficio apre Interventi › Pianificazione e la lista non c'è nella tendina. «Ma se la lista c'è e non compare nel Piano?» La lista esiste…». La domanda ripeteva la frase che la precedeva. Ora arriva dopo la scena e ha una risposta vera: «Perché la tendina non mostra tutte le liste aperte».
- **[Minore, corretto]** «La pagina Pianificazione non mostra quando la copia è stata scritta.»: nel dossier è [UNVERIFIED]. Ora rimanda a Gea, che lo dice davvero.
- **[Minore, corretto]** «dal numero di righe delle liste»: le righe di `carichi_righe` sono pratiche. Ora: «dal numero di pratiche».
- **Punto di forza:** l'avviso sull'«Elimina» del lotto contiene la conseguenza più sorprendente del capitolo: «chi resta senza lotti torna a vedere tutto». Eliminare un lotto **allarga** la visibilità. Vedi le priorità opzionali.

### Sezione 5 — Lo stato di un'utenza

- **[Importante, corretto] Catena causale incompleta.** La regola diceva solo «Ogni volta che l'ufficio compie un'azione su un intervento […] GOPlanner copia lo stato». Ma anche l'esito che arriva dall'app passa da `updateStatoUtenza` (`EsitoWriter` → `setFromInterventoEseguito` → `updateStatoUtenza`, verificato nel codice). Senza questo, il lettore non capisce perché l'utenza fosse «eseguito» prima che l'ufficio la riportasse ad «assegnato». Aggiunta una frase; adeguate la risposta alla controobiezione e la sintesi.
- **[Minore, corretto]** «Ecco la regola.» e «C'è un limite.»: tic da modello.
- **Punto di forza:** la tabella dei codici, il 99 messo in una frase come chiedeva il conflitto C9, il riquadro per gli sviluppatori che non dice più «unico» (C10). È la sezione migliore del capitolo.

### Sezione 6 — I campi personalizzati

- **[Importante, corretto] Incoerenza con il capitolo 6.** Testo: «L'interfaccia per l'ufficio non dà un nome a schermo alle prime due famiglie.» Il capitolo 6 (riga 195) e `dossier_chapter_6.md` (`js/code/verifica_unica.js`) mostrano i campi dell'intervento sotto «Campi del cliente» nella Verifica unica. Nel dossier del capitolo 3 l'affermazione era comunque [UNVERIFIED]. Ora il testo rimanda a «Campi del cliente» (capitolo 6).
- **[Minore, corretto]** Nella tabella, «Cambiarlo dall'ufficio» era ambiguo (il valore o la definizione?). Ora: «Cambiarne nome, etichetta o tipo».
- **[Minore, corretto]** «Così è andata la prova nel browser dell'11 novembre 2026»: di chi era la prova? Ora: «Lo ha mostrato una prova dell'11 novembre 2026».
- **[Critico, corretto] Chiusura del capitolo.** Testo: «Prima di fidarsi di un numero o di uno stato, chiedetevi di quale oggetto parla (utenza, pratica, lista o intervento) e da dove viene letto. Un'utenza «assegnata», una lista assente dalla tendina, un campo che non compare nell'app hanno quasi sempre la stessa spiegazione: si stava guardando l'oggetto sbagliato.» Ci sono tre problemi:
  1. Il capitolo 2 chiude con la stessa mossa: «Resta una regola da usare ogni volta che qualcosa non torna. Si chiede, in quest'ordine, …». La persona lo vieta: «My ending cannot echo any previous chapter».
  2. «quasi sempre» è una generalizzazione senza fonte.
  3. Per la tendina la spiegazione non è «l'oggetto sbagliato» ma una copia salvata.
  La nuova chiusura mantiene la promessa dell'Architect (di quale oggetto parla, da dove viene letto) in forma dichiarativa. Ripercorre i tre casi del capitolo e finisce su una regola che nessun altro capitolo usa: «Un numero, in GOPlanner, è vero per l'oggetto da cui viene letto e per il momento in cui è stato letto.»

### Formato e vincoli

- Un solo H1, «In questo capitolo», `## Fonti`: ok. Nessun dato personale, nessun segreto: ok. Le «commesse» sono nominate solo come conteggi (2, 46, 49, 59): ok.
- Lunghezza dopo le correzioni: circa 6.190 parole, contro le 4.000–6.000 del PRD («circa»). Sezioni 3 e 4 intorno al tetto di 1.200.
- Il piè di pagina `<!-- WORD COUNT … -->` è HTML grezzo. Lo impone il modello del Writer in `ralph.sh`, ma né `ralph.sh` né `publish.sh` lo tolgono: arriverà nell'HTML dentro GOPlanner (invisibile, ma contro PRD § 6). Problema della pipeline, non del capitolo.
- I percorsi di menu sono scritti in modo incoerente: «Interventi › «Carichi»», «Clienti» › «Lista», «Interventi › Pianificazione». Serve una decisione per tutto il libro.

## 4. Persona Audit

**Suona come The Engineer + The Scholar? Sì, per l'85% del testo.** Le frasi migliori sono la persona allo stato puro: specificano invece di intensificare.
- «Sotto il campo la pagina scrive «Valore salvato in carichi.lotto», e quella nota dice la cosa che conta.»
- «Chi cerca «la lista» nel menu trova la voce «Lista» di Interventi, la apre e vede interventi. La conclusione sbagliata è che la lista non ci sia. C'è: si chiama «Carichi».»
- «I messaggi sono, per esempio, «Il nome del lotto e obbligatorio.» […] (scritti così nel codice, senza accenti).»
- «Il riquadro chiede anche «Dove si vede» […] ma al 25 novembre 2026 la scelta si registra e non è ancora letta da nessuno.»

**Dove scivola:**
1. *Il redattore che parla delle sue fonti.* Le formule erano «le fonti non dicono» (due volte), «il codice dice», «non è stato verificato in tutte le commesse», «la prova nel browser». La persona non scrive ciò che non sa e non racconta come ha controllato: dice la regola e cita la fonte in fondo. Tutte corrette.
2. *L'impalcatura visibile.* Le funzioni dei paragrafi venivano annunciate come etichette: «C'è un limite da tenere presente.», «Anche la pagina «Clienti» ha i suoi limiti.», «Un altro limite riguarda i permessi.», «C'è un limite.», «Il limite principale è un numero». Petzold non annuncia il limite: lo dice. Ne restano due che funzionano («Il limite principale è un numero» ha un contenuto vero).
3. *Le sintesi di fine sezione a stampo.* Ogni sezione chiudeva con una o due frasi riassuntive della stessa forma. Le migliori («Lo stato dell'utenza racconta l'ultimo intervento toccato, non il lavoro fatto.») restano. La più debole («Lista e carico sono lo stesso oggetto con due nomi.») è stata riscritta.
4. *Il lessico da codice nella prosa per l'ufficio.* «presente fra le costanti dell'utenza», «codice comune», «dizionario dell'interfaccia». È tollerabile perché il capitolo 2 ha già introdotto «codice comune»; le «righe» del database in «Consolida utenze» non lo erano, e ora stanno nel riquadro per lo staff.

## 5. Counter-Objection Check

| Sezione | Obiezione | Forma più forte? | Risposta con prove? |
|---|---|---|---|
| 2 | «Lo stesso contatore compare due volte in Clienti: è un errore?» | Sì: è la domanda che l'ufficio fa davvero. | Sì, dopo la correzione: regola CONCLUSA dell'importazione, strumento riservato, riquadro staff. Prima chiudeva su «le fonti non dicono». |
| 3 | «Ho chiuso la lista per sbaglio: posso riaprirla?» | Sì. | Sì: nessuna azione nel codice, che cosa resta, che cosa si perde, la domanda da farsi prima. Ottima. |
| 4 | «Ma se la lista c'è, perché non compare nel Piano?» | Ora sì; prima ripeteva la frase precedente e non aveva un «perché». | Sì: quattro condizioni, copia di un'ora, storia GOP-442 con data. |
| 5 | «Ma l'operatore l'ha chiusa: perché l'utenza è ancora assegnata?» | Sì: è il ticket che fa perdere tempo. | Sì: meccanismo, esempio di luglio e settembre, procedura, regola. Ora include anche la copia fatta dall'esito dell'app. |
| 6 | «Ho creato il campo con il nome sbagliato: posso cancellarlo o rinominarlo?» | Sì. | Sì: no dall'interfaccia, richiesta allo staff, regola «decidere prima». |

Le obiezioni sono cinque contro le due richieste. **Ne manca una, la più forte per un amministratore:** «Se elimino un lotto, chi lo aveva assegnato vede *più* liste di prima?». La risposta è già nel testo («chi resta senza lotti torna a vedere tutto»), ma sepolta in un avviso. Vedi le priorità opzionali.

## 6. Priority Improvements

### Critical (tutte applicate)
1. Sezione 1: «la lista è sempre nuova» contraddiceva «lista nuova / lista esistente». Corretto.
2. Sezione 1: regole di reimportazione circoscritte a File › Importazione, con il caso dell'appuntamento e il rimando alla classica. Corretto.
3. Sezione 4, punto 3: la copia salvata non si rinnova se si corregge il lotto della lista; la frase non vale per l'assegnazione del lotto all'utente. Corretto.
4. Chiusura del capitolo: non riecheggia più il capitolo 2 e non contiene più «quasi sempre». Corretto.

### Important (tutte applicate)
5. Sezione 2: dettagli di «Consolida utenze» spostati nel riquadro `> **Per lo staff tecnico:**` annunciato dal rigo del pubblico; niente «righe» del database nella prosa per l'ufficio.
6. Tolto il commento sulle fonti («le fonti non dicono», «il codice dice», «non verificato in tutte le commesse», «la prova nel browser»).
7. Sezione 3: «Cliente» = nome della lista solo per le liste di File › Importazione.
8. Sezione 5: anche l'esito dell'app copia lo stato. Fonte aggiunta (`lib/MobileV3/Domain/EsitoWriter.php`).
9. Sezione 6: «Campi del cliente» della Verifica unica, coerente con il capitolo 6. Fonte aggiunta (`js/code/verifica_unica.js`).
10. Sezione 4: la controobiezione della tendina ora risponde a un «perché»; rimedio del punto 1 senza invenzioni; «righe delle liste» → «pratiche».

### Optional (non applicate: per il Writer o per il prossimo giro)
11. Portare la sezione 3 sotto le 1.200 parole e il capitolo vicino alle 6.000: spostare la frase su *Batch* nel riquadro per gli sviluppatori. Comprimere il paragrafo «Leggere e modificare le liste…», che tiene insieme due limiti diversi (permessi ed elenco «Liste» della classica).
12. Sezione 4: fare dell'effetto «chi resta senza lotti torna a vedere tutto» una controobiezione esplicita per gli amministratori. Per esempio: «Se elimino un lotto, chi lo aveva vedrà meno liste?» No, ne vedrà di più, se era il suo unico lotto. Prima di eliminare un lotto, controllate a chi è assegnato (capitolo 11).
13. Decisione per tutto il libro sulla grafia dei percorsi di menu (con o senza «…» sull'ultima voce).
14. Pipeline: togliere i commenti `<!-- … -->` prima di `publish.sh` (PRD § 6, «niente HTML grezzo»).
15. Tabella degli stati, riga 1: «è lo stato di una pratica nuova appena importata». In realtà lo stato 1 lo riceve la nuova riga di `utenti` (dossier § C); valutare «di un'utenza appena importata».
16. NUF 8, «Elimina» dell'utenza: manca l'alternativa. Il dossier non ne riporta una; va bene così, ma lo segnalo perché il NUF CHECK del Writer lo dava ⚠️.

## 7. Rewritten Paragraphs

### R1 — Sezione 1, la lista (contraddizione interna)

**Original:**
> Il primo oggetto è la lista. Il glossario di GOPlanner la definisce così: «un gruppo di utenze arrivato con un'importazione o creato a mano. Ha un nome, un lotto e una scadenza.» Con la pagina File › Importazione la lista è sempre nuova: il codice dice che non si aggiunge in silenzio a una lista con lo stesso nome di file. *Letture marzo* nasce quindi come oggetto a sé, con il suo nome, il suo lotto, la sua scadenza.

**Rewritten:**
> Il primo oggetto è la lista. Il glossario di GOPlanner la definisce così: «un gruppo di utenze arrivato con un'importazione o creato a mano. Ha un nome, un lotto e una scadenza.» File › Importazione chiede ogni volta dove mettere le righe: in una «lista nuova» o in una «lista esistente», scelta apposta fra quelle aperte. Non le aggiunge mai in silenzio a una lista che ha lo stesso nome di file. Nell'esempio *Letture marzo* è una lista nuova, e nasce come oggetto a sé, con il suo nome, il suo lotto, la sua scadenza.

**Why:** «sempre nuova» contraddiceva la tabella della stessa sezione e l'apertura della sezione 3; il dossier (§ C, GOP-745) e il codice confermano la «lista esistente». La parte vera dell'intestazione del codice («non si aggiunge in silenzio») resta, senza «il codice dice».

### R2 — Sezione 1, il riconoscimento dell'utenza (regola non circoscritta)

**Original:**
> […] Qui sta la risposta alla domanda di prima. L'importazione riconosce un'utenza per codice, su tutta la commessa. Se il codice non è mai stato visto, nasce un'utenza nuova. Se il codice c'è già e la sua pratica è ancora aperta e senza appuntamento, GOPlanner riusa la stessa utenza, aggiorna i dati con quelli del file e la porta nella lista nuova. Se invece la pratica precedente è conclusa […], si crea una pratica nuova con lo stesso codice e lo storico della vecchia resta. Il file di 1.200 righe produce dunque 1.200 pratiche al massimo, meno gli scarti, e un numero di utenze nuove che dipende da quanti codici erano già presenti nella commessa.

**Rewritten:**
> […] Qui sta la risposta alla domanda di prima. File › Importazione riconosce un'utenza per codice, su tutta la commessa, e decide che cosa fare guardando la pratica che quel codice ha già:
>
> - codice mai visto: nasce un'utenza nuova;
> - pratica aperta e senza appuntamento: GOPlanner riusa la stessa utenza, aggiorna i dati con i valori pieni del file e la porta nella lista nuova;
> - pratica con un appuntamento ancora da svolgere: l'appuntamento resta com'è e si aggiornano solo le note;
> - pratica conclusa (eseguita, non fattibile, controllata, inviata o annullata): si crea una pratica nuova con lo stesso codice, e lo storico della vecchia resta.
>
> Il file di 1.200 righe produce dunque 1.200 pratiche al massimo, meno gli scarti, e un numero di utenze nuove che dipende da quanti codici erano già presenti nella commessa. L'Importazione classica non segue queste regole: ha le sue caselle per i duplicati (capitolo 4).

**Why:** «L'importazione» faceva sembrare generali le regole di `ImportazioneReimportazione`, che valgono per File › Importazione e sostituiscono le caselle della classica (intestazione del file sul ramo `php8`). Il caso dell'appuntamento giustifica il «al massimo». L'elenco rende leggibili quattro casi paralleli (STYLE_BIBLE § Formato: elenco ammesso per enumerare); «valori pieni» riprende la formulazione esatta del dossier.

### R3 — Sezione 2, la controobiezione sulle utenze doppie (voce e pubblico)

**Original:**
> Una domanda torna spesso: «Lo stesso contatore compare due volte in Clienti: è un errore?» Non per forza. Dalla sezione 1 si sa che una pratica conclusa, reimportata, crea una nuova utenza con lo stesso codice, così lo storico della vecchia resta separato. Il risultato sono codici utenza ripetuti. Esiste uno strumento per riunirli, «Consolida utenze», nel menu Admin, gruppo Strumenti, riservato al personale GOPlanner. Per ogni codice crea un'utenza che unisce i valori non vuoti di tutte le righe con quel codice, ci sposta sopra interventi, esiti, pratiche e foto, e cancella le righe vecchie. Si lancia su al massimo 500 codici per volta (il valore proposto è 50), e prima di partire chiede conferma con un testo del tipo «Verranno consolidati N codici utenza (su M duplicati ancora da consolidare)». I lavori partono in coda e non si possono annullare. Il codice ripetuto da una pratica conclusa è un'origine certa dei duplicati, ma le fonti non dicono che sia l'unica.

**Rewritten:**
> Una domanda torna spesso: «Lo stesso contatore compare due volte in Clienti: è un errore?» Non per forza. Dalla sezione 1 si sa che una pratica conclusa, reimportata, crea una nuova utenza con lo stesso codice: lo storico della vecchia resta separato, e il risultato è un codice utenza ripetuto. È una delle origini dei doppioni, ed è prevista dalle regole dell'importazione. Per riunirli esiste uno strumento, «Consolida utenze», che però non è dell'ufficio.
>
> *(segue il riquadro «Quando chiedere allo staff tecnico», invariato, poi:)*
>
> > **Per lo staff tecnico:** «Consolida utenze» sta nel menu Admin, gruppo Strumenti. Per ogni codice crea un'utenza che unisce i valori non vuoti di tutte le utenze con quel codice, ci sposta sopra interventi, esiti, pratiche e foto, e cancella le utenze vecchie. Si lancia su al massimo 500 codici per volta (il valore proposto è 50) e prima di partire chiede conferma con un testo del tipo «Verranno consolidati N codici utenza (su M duplicati ancora da consolidare)». I lavori partono in coda e non si possono annullare.

**Why:** il rigo della sezione prometteva un riquadro per lo staff che non c'era. L'ufficio, che non può usare lo strumento, leggeva tetti, valori proposti e testi di conferma. «Righe» violava il glossario del capitolo. «Le fonti non dicono» è il redattore che parla di sé; la persona tace ciò che non sa e afferma ciò che sa («una delle origini»).

### R4 — Sezione 4, l'apertura della diagnosi (controobiezione)

**Original:**
> Il giorno della pianificazione l'ufficio apre Interventi › Pianificazione e la lista non c'è nella tendina. «Ma se la lista c'è e non compare nel Piano?» La lista esiste, si vede in «Carichi», ma la tendina non la propone. La tendina mostra una lista solo se la lista soddisfa tutte insieme quattro condizioni, e legge il risultato da una copia salvata. Ogni voce si presenta come «nome file, tipo carico (numero di utenze senza intervento)», in ordine dalla lista più recente: va cercata per nome file.

**Rewritten:**
> Il giorno della pianificazione l'ufficio apre Interventi › Pianificazione e cerca la lista nella tendina. Non c'è. In «Carichi» invece c'è, aperta, con le sue pratiche. «Ma se la lista c'è, perché non compare nel Piano?» Perché la tendina non mostra tutte le liste aperte. Mostra solo quelle che soddisfano insieme quattro condizioni, e non le ricalcola ogni volta: legge il risultato da una copia salvata. Ogni voce si presenta come «nome file, tipo carico (numero di utenze senza intervento)», in ordine dalla lista più recente: va cercata per nome file, non per il nome scritto in «Cliente».

**Why:** la domanda ripeteva la frase precedente e la risposta ripeteva la domanda. Ora la scena crea la tensione («Non c'è. In «Carichi» invece c'è»), la domanda ha un «perché» e la risposta comincia con la causa. L'ultima frase collega la trappola di «Cliente» (sezione 3): la tendina mostra il nome file, non il nome della lista.

### R5 — Sezione 4, punto 3 dei controlli (rimedio sbagliato)

**Original:**
> 3. **L'utente ha lotti assegnati e la lista è di un altro lotto.** Confrontate il «Lotto» della lista con i lotti dell'utente. Il rimedio è assegnare il lotto all'utente o correggere il lotto della lista: lo fa un amministratore (capitolo 11). Anche qui la copia salvata non si rinnova da sola.

**Rewritten:**
> 3. **L'utente ha lotti assegnati e la lista è di un altro lotto.** Confrontate il «Lotto» della lista con i lotti dell'utente. Il rimedio è assegnare il lotto all'utente o correggere il lotto della lista: lo fa un amministratore (capitolo 11). Se si corregge il lotto della lista, la lista ricompare solo alla scadenza della copia salvata (punto 5).

**Why:** la chiave della copia dipende dalla query, che contiene i lotti dell'utente (dossier § L; intestazione di `lib/VistaTendinaListe.php`). Assegnare un lotto all'utente cambia la chiave; correggere `carichi.lotto` no (dossier: «cambiarne il lotto non rinnova la copia»). La frase originale mandava ad aspettare un'ora anche chi non doveva.

### R6 — Sezione 5, la regola della copia (catena causale)

**Original:**
> Ecco la regola. Lo stato dell'utenza non è un riassunto dei suoi interventi: è una copia. Ogni volta che l'ufficio compie un'azione su un intervento (lo assegna, lo pianifica, lo chiude, lo annulla), GOPlanner copia lo stato di quell'intervento sull'utenza, senza guardare gli altri. Le azioni dell'ufficio che fanno questa copia sono circa cinquanta.

**Rewritten:**
> Lo stato dell'utenza non è un riassunto dei suoi interventi: è una copia. Ogni volta che l'ufficio compie un'azione su un intervento (lo assegna, lo pianifica, lo chiude, lo annulla), GOPlanner copia lo stato di quell'intervento sull'utenza, senza guardare gli altri. Le azioni dell'ufficio che fanno questa copia sono circa cinquanta, e anche l'esito che arriva dall'app fa la stessa copia. Sull'utenza vince l'ultimo intervento toccato, non quello che conta di più.

**Why:** senza l'esito dell'app la storia del capitolo non torna. Il lettore deve sapere che l'utenza era diventata «eseguito» e che un'azione successiva l'ha riportata ad «assegnato». Verificato sul codice: `EsitoWriter` → `setFromInterventoEseguito` → `updateStatoUtenza`. «Ecco la regola.» era un tic. La frase finale fissa la regola in breve dopo la spiegazione lunga (Voice rule 1). Adeguate di conseguenza la risposta alla controobiezione («Perché, dopo l'esito, un'azione dell'ufficio…») e la sintesi («racconta l'ultimo intervento toccato»).

### R7 — Sezione 6, le tre famiglie (incoerenza con il capitolo 6)

**Original:**
> […] La terza sono i campi nuovi creati dall'ufficio durante l'importazione, con il pulsante «+ Nuovo campo…» di File › Importazione: un dato del file del committente che diventa un dato della pratica. L'interfaccia per l'ufficio non dà un nome a schermo alle prime due famiglie.

**Rewritten:**
> […] La terza sono i campi nuovi creati dall'ufficio durante l'importazione, con il pulsante «+ Nuovo campo…» di File › Importazione: un dato del file del committente che diventa un dato della pratica. Nelle commesse che usano la Verifica unica (Rapporti › Verifica interventi), i campi della prima famiglia compaiono nella scheda sotto l'intestazione «Campi del cliente» (capitolo 6).

**Why:** la frase originale era [UNVERIFIED] nel dossier e smentita dal capitolo 6, che mostra «Campi del cliente» nella Verifica unica (`js/code/verifica_unica.js`). La riscrittura dà al lettore un posto preciso in cui ritrovare quei campi, invece di una negazione.

### R8 — Chiusura del capitolo (eco del capitolo 2, generalizzazione senza fonte)

**Original:**
> Un campo personalizzato, come ogni altro dato di questo capitolo, appartiene a un oggetto preciso: all'intervento, alla pratica o all'utenza. Vale per tutto GOPlanner. Prima di fidarsi di un numero o di uno stato, chiedetevi di quale oggetto parla (utenza, pratica, lista o intervento) e da dove viene letto. Un'utenza «assegnata», una lista assente dalla tendina, un campo che non compare nell'app hanno quasi sempre la stessa spiegazione: si stava guardando l'oggetto sbagliato.

**Rewritten:**
> Un campo personalizzato appartiene a un oggetto preciso: all'intervento se lo compila l'operatore, alla pratica se arriva con l'importazione. Lo stesso vale per ogni numero e ogni stato di questo capitolo, e i tre casi difficili lo mostrano. L'utenza «assegnata» della sezione 5 legge una copia scritta dall'ultima azione su un suo intervento, mentre il lavoro fatto sta sull'intervento eseguito. La lista assente dalla tendina della sezione 4 esiste in «Carichi», ma la tendina legge una copia che dura un'ora. Il campo nuovo che manca nell'app sta sulla pratica, e oggi solo la griglia «Clienti» lo legge. In nessuno dei tre casi il dato manca. Un numero, in GOPlanner, è vero per l'oggetto da cui viene letto e per il momento in cui è stato letto.

**Why:** il capitolo 2 chiude con «una regola da usare ogni volta che qualcosa non torna. Si chiede, in quest'ordine, …»; il capitolo 3 chiudeva con la stessa mossa («chiedetevi…»), contro la seconda frase di attivazione della persona. «Quasi sempre» è un «in genere» senza fonte. «L'oggetto sbagliato» non spiega la tendina, dove il problema è una copia. La nuova chiusura mantiene la promessa dell'Architect (di quale oggetto parla, da dove viene letto) ma la dimostra con i tre casi del capitolo. Finisce su una regola dichiarativa che aggiunge la dimensione del tempo, propria di questo capitolo.

### Altre riscritture applicate (forma breve)

| # | Dove | Original | Rewritten | Why |
|---|---|---|---|---|
| R9 | Titolo sez. 1 | «sei oggetti, uno dentro l'altro» | «quattro oggetti e due etichette» | Il corpo dice che lotto e distretto non sono contenitori. |
| R10 | Aggancio sez. 1 | «la risposta giusta non è 1.200» | «la risposta non è per forza 1.200» | Può esserlo, se tutti i codici sono nuovi. |
| R11 | Limite sez. 1 | «C'è un limite da tenere presente. La catena […] è codice comune, ma le pagine che la mostrano cambiano…» | «La catena […] è codice comune; le pagine che la mostrano no. Cambiano…» | Toglie l'impalcatura; frase breve dopo la lunga. |
| R12 | Sez. 2, utenza | «alla mappa e allo smistamento» | «che la mettono sulla mappa» | «Smistamento» non è nel dossier. |
| R13 | Sez. 2, scheda | «non è stato verificato in tutte le commesse; il doppio clic è il modo sicuro» | «Il doppio clic è il modo sicuro di aprirla.» | Travisava il dossier e parlava della documentazione. |
| R14 | Sez. 2, limiti | «Anche la pagina «Clienti» ha i suoi limiti. […] E «Elimina»…» | «La pagina «Clienti» non è uguale in tutte le commesse. […] Ed «Elimina»…» | Impalcatura; eufonia. |
| R15 | Sez. 3, «Cliente» | «contiene il nome della lista, quello scritto in «lista nuova» al momento dell'importazione» | «Nelle liste create con File › Importazione contiene il nome della lista…» | C2: per la classica il contenuto è [UNVERIFIED]. |
| R16 | Sez. 3, «Tipo carico» | «La tendina è codice comune […]. Le fonti non dicono quali commesse usino davvero ciascun valore.» | «Le voci sono le stesse in tutte le commesse […] non si perde al salvataggio. […] «Modifica carico» non ha quei campi.» | Via il commento sulle fonti; spiegato il valore fuori elenco. |
| R17 | Sez. 3, permessi | «Un altro limite riguarda i permessi. Leggere e modificare…» | «Leggere e modificare…» | Impalcatura. |
| R18 | Sintesi sez. 3 | «Lista e carico sono lo stesso oggetto con due nomi.» | «Una lista resta una lista anche quando l'etichetta dice «carico». E l'unità che «Carichi» conta è la pratica, non la riga del file.» | «Carico» fuori dalle virgolette; rinforza il NUF 2. |
| R19 | Sez. 4, punto 1 | «il lavoro che resta va portato in un'altra lista con una nuova importazione» | «per pianificare il lavoro rimasto serve una lista aperta, e come se ne prepara una è nel capitolo 4» | Il rimedio originale non era nel dossier. |
| R20 | Sez. 4, punto 5 | «La pagina Pianificazione non mostra quando la copia è stata scritta.» | «Per sapere quando scade, chiedete a Gea (sotto).» | [UNVERIFIED] nel dossier; Gea invece lo dice (`scade_il`). |
| R21 | Sez. 4, storia | «dal numero di righe delle liste» | «dal numero di pratiche» | Glossario: le righe di `carichi_righe` sono pratiche. |
| R22 | Sez. 5, obiezione | «Perché l'ultima azione dell'ufficio ha toccato…» | «Perché, dopo l'esito, un'azione dell'ufficio ha toccato…» | Coerente con R6. |
| R23 | Sez. 5, limite | «C'è un limite. Né l'ufficio né Gea…» | «Né l'ufficio né Gea…» | Impalcatura. |
| R24 | Sintesi sez. 5 | «racconta l'ultima azione dell'ufficio» | «racconta l'ultimo intervento toccato» | Coerente con R6 e con il titolo della sezione. |
| R25 | Tabella sez. 6 | «Nell'app, con l'esito; nella verifica» / «Cambiarlo dall'ufficio» | «…; nella Verifica interventi» / «Cambiarne nome, etichetta o tipo» | Ambiguità fra valore e definizione. |
| R26 | Sez. 6, prova | «Così è andata la prova nel browser dell'11 novembre 2026» | «Lo ha mostrato una prova dell'11 novembre 2026» | La prova di chi? Il lettore non lo sa. |
| — | Fonti | — | aggiunte `lib/MobileV3/Domain/EsitoWriter.php`, `js/code/verifica_unica.js` | Fonti delle due affermazioni nuove. |

## Litmus test

**«Ho vissuto questo» o «Me l'hanno detto»?** Nelle sezioni 3, 4 e 5 il lettore *vive* il problema. Cerca la lista e trova interventi; apre la tendina il giorno della pianificazione e la lista non c'è; vede «assegnato» su un lavoro fatto. Poi trova il meccanismo, il controllo e la data in cui è successo davvero. Nelle sezioni 2 e 6 prima della revisione prevaleva il «me l'hanno detto»: elenchi di etichette e di limiti, con dettagli da staff mescolati. Dopo le correzioni la sezione 2 separa ciò che l'ufficio fa da ciò che fa lo staff. La sezione 6 chiude il capitolo tornando ai tre casi vissuti. Un collega nuovo dell'ufficio, con questo capitolo, sa dove trovare una lista anche se si chiama «carico», perché non è nella tendina, perché un'utenza dice «assegnato» e che cosa non può annullare: il litmus atteso dall'Architect è soddisfatto.

## 8. Verdict

**REVIEWER_CORRECTIONS (47/60):** capitolo solido e concreto, con una contraddizione nella sezione 1, un rimedio sbagliato nella diagnosi della tendina, una chiusura che ripeteva il capitolo 2 e una voce che a tratti commentava le proprie fonti. 24 paragrafi riscritti in `chapter_3.md`; restano solo correzioni opzionali di lunghezza e di pipeline.
