# 4. Importazione: dal file del committente alla lista

*In questo capitolo si impara a portare in GOPlanner il file che manda il committente, a leggere il resoconto che spiega perché la lista ha meno pratiche del file e a correggere la mappatura quando il tracciato cambia. È scritto per il back office; i riquadri per gli sviluppatori si possono saltare.*

## Che cosa fa un'importazione

*Per tutti.*

Lunedì 9 novembre 2026, alle 11.30, un amministratore scrive a Gea: «ho importato il file di stamattina ma mancano delle utenze». È uno degli scenari del banco di prova su cui si verifica Gea, e la risposta che Gea deve dare è una somma. Il file aveva 120 righe: 112 importate, 8 scartate. Cinque righe portavano un codice già comparso più in alto nel file, tre non avevano il codice. Il rimedio è correggere quelle otto righe nel file e reimportarlo. In GOPlanner non c'è niente da cercare: il resoconto dell'importazione aveva già scritto la differenza, motivo per motivo.

Per arrivare a quel resoconto il file attraversa una catena di sei anelli, e questo capitolo li segue nell'ordine. Primo, il file: un foglio Excel o un CSV con una riga per pratica. Secondo, la mappatura, cioè la regola che dice quale colonna del file va in quale campo di GOPlanner. Terzo, i controlli sul file intero, che girano in sola lettura e possono bloccare l'importazione prima che scriva qualcosa. Quarto, la lista, nuova o già esistente, in cui le pratiche finiscono. Quinto, le pratiche stesse, con le regole che decidono che cosa succede a quelle già presenti. Sesto, la geocodifica, che parte a fine importazione per le pratiche senza coordinate e appartiene al capitolo 5. Che cosa siano lista, pratica, utenza e lotto lo spiega il capitolo 3; qui le parole si usano e basta.

### Le voci del menu File

Si parte dal menu File. Chi ha il permesso «Importare interventi» vede, in quest'ordine, «Importazione», «Importazione classica», «Esportazione», «Esportazione classica», «Conversione» e «Analisi»; dopo vengono le voci proprie della commessa, perché alcune commesse aggiungono al menu File voci loro. «Conversione» e «Analisi» compaiono a tutti i profili con il permesso, ma le usano solo alcune commesse, e questo capitolo non le tratta. Chi non ha il permesso vede al più «Esportazione» ed «Esportazione classica». Il permesso e i profili che lo hanno sono nel capitolo 11.

Le due voci di importazione non sono due versioni della stessa pagina. «Importazione» è la pagina nuova (`file.php?action=importa`); «Importazione classica» è il percorso precedente (`file.php?action=tabulati`), ancora usato dalle mappature che non sono passate alla pagina nuova.

| | «Importazione» | «Importazione classica» |
|---|---|---|
| Formati | xls, xlsx, ods, csv, un file alla volta | quello previsto dalla mappatura: Excel, testo a colonne fisse o delimitato (per esempio CSV con il punto e virgola) |
| Scelta della mappatura | quattro modi | una tendina |
| Dimensione massima | nessuna nel codice: decide la configurazione del server | 10 MB |
| Scarti | salvati, con il motivo | non salvati |
| Dove si legge l'esito | elenco «Ultime importazioni» | solo l'elenco delle liste |
| Annullamento | entro 24 ore, per una lista nuova | non esiste |

Nella classica un file oltre i 10 MB si ferma con il messaggio «Il file eccede la dimensione massima consentita (max 10MB)». La pagina nuova non ha un limite suo: se il file supera quello del server, il caricamento non riesce e la pagina mostra un messaggio di errore.

La pagina «Importazione» si apre con il riquadro «Cosa importi». Le scelte sono «Pratiche» («Liste di lavoro: pratiche e utenze da pianificare. Il file crea o aggiorna una lista.») e «Magazzino». La seconda compare solo dove il magazzino è attivo per la commessa e il profilo vi ha accesso; altrimenti la pagina importa pratiche senza chiedere. Questo capitolo tratta «Pratiche». Per il magazzino vedi il capitolo 9.

La scelta fra le due voci non spetta a chi importa. Dipende da come è configurata la mappatura della commessa. Un modello di sistema può essere marcato come importabile solo dalla classica: succede ai modelli a posizioni fisse, a quelli con un importatore dedicato e a quelli con un formato diverso da xls, xlsx o csv. In quel caso la pagina nuova lo dice con un messaggio esplicito, «Il modello … e' a posizioni fisse: si usa solo dall'importazione classica». Se il modello che serve compare solo nella classica, si importa dalla classica, sapendo in anticipo che gli scarti non resteranno registrati.

La pagina nuova salva le pratiche con lo stesso percorso della classica. Cambia quello che viene prima del salvataggio e dopo, non il salvataggio: la differenza fra le due voci sta nelle reti di sicurezza intorno al file, cioè lettura del formato, controlli, registro, annullamento.

## La mappatura: come GOPlanner legge il file

*Per il back office.*

GOPlanner non sa che la colonna C del file è la matricola. Glielo dice la mappatura. Un modello di mappatura registra quale colonna del file va in quale campo di GOPlanner, insieme al foglio da leggere, a se la prima riga contiene i nomi delle colonne e alla riga da cui partono i dati. Più campi possono leggere la stessa colonna. Quando il committente manda ogni mese un file con la stessa disposizione, il modello salvato la prima volta basta per tutte le volte successive.

### Modelli salvati e modelli di sistema

I modelli sono di due famiglie. I modelli salvati nascono dalla pagina «Importazione»: si modificano, e ogni aggiornamento diventa una versione nuova. I modelli di sistema li prepara lo staff tecnico per la commessa, e dalla pagina si leggono soltanto. Il messaggio lo dice testualmente: «Un modello di sistema non si modifica: va duplicato». Il pulsante «Duplica e modifica» ne crea una copia salvata, che da quel momento si comporta come qualsiasi altro modello salvato.

Nel riquadro «Mappatura» si sceglie come leggere il file. Le scelte sono quattro, con il testo che la pagina mostra accanto a ciascuna:

- «Riconosci dal file», la predefinita: «Se l'impronta del file coincide con un modello, lo applica; altrimenti passa all'automatica.»
- «Usa un modello»: «Il file viene letto con il modello scelto qui sotto.»
- «Automatica (regole e AI)»: «GOPlanner propone un campo per ogni colonna; confermi tu.»
- «Manuale»: «Parti da zero e scegli ogni campo a mano.»

La scelta si può fare prima o dopo aver caricato il file.

### Impronta e colonne spostate

Il riconoscimento si basa sull'impronta del file, che mette insieme tre cose: il numero di colonne, le intestazioni e la forma dei valori delle prime 50 righe. «Forma» vuol dire, per esempio, «sedici cifre», «comincia con ODL-», «data», «numero», «testo»; una colonna ha una forma quando almeno l'80% dei suoi valori non vuoti la condivide. Nessun valore del file entra nell'impronta, solo la sua forma. Se l'impronta coincide con quella di un modello, la pagina applica il modello. Se il committente sposta una colonna, l'impronta non coincide più, e la pagina dice perché.

Reimportando con lo stesso modello, le colonne vengono ritrovate per nome e per forma dei valori, non per posizione. Prima si cerca la stessa intestazione nella stessa posizione, poi la stessa intestazione altrove, infine, per le colonne mappate, l'unica colonna libera che ha la stessa forma riconoscibile: un codice ODL-, sedici cifre, una data. Per esempio, con dati inventati: il modello legge la matricola dalla colonna C, intestata «MATRICOLA», e il file di marzo la porta in colonna E. La pagina la ritrova in E per il nome, la lascia sullo stesso campo e lo segnala. Nella scheda «1 · Mappatura» ogni colonna porta il suo stato:

- «Come prima»;
- «Spostata da X», con la nota «Riconosciuta dal nome e dalla forma dei valori»;
- «Valori diversi», quando il modello si aspetta valori di un'altra forma;
- «Nuovi dati», per una colonna che nel modello era vuota e ignorata;
- «Colonna nuova», che nel file precedente non c'era;
- «Ignorata»;
- «Da scegliere», quando la colonna ha valori ma nessun campo.

Altri cartellini dicono da dove viene la scelta: «Dal modello», «Dalle regole», «Dall'AI», «Scelto a mano», e «Proposta» finché nessuno l'ha confermata.

Nella tendina di ogni colonna ci sono due voci da conoscere. «Ignora questa colonna» la lascia fuori. «+ Nuovo campo…» apre il modulo «Nuovo campo per la colonna …»: si sceglie nome e tipo (testo, numero o data) e dove si vede («Scheda pratica» oppure «Scheda pratica e app»), poi «Crea e mappa». Il campo che nasce è un campo personalizzato vero, che si ritrova in coda alla griglia «Clienti», nei filtri avanzati e nell'Excel; se esiste già un campo con lo stesso nome, viene riusato. Per i campi personalizzati vedi il capitolo 3.

### Il campo «Codice» e la fine della mappatura

Una colonna conta più delle altre: quella mappata sul campo «Codice». È il codice che riconosce le pratiche già presenti in GOPlanner, e senza di esso la pagina non lascia importare: «Manca il campo Codice: serve a riconoscere le pratiche già presenti.» Fanno eccezione le commesse che compongono il codice da più colonne. La sezione sulla reimportazione mostra perché questa colonna decide quasi tutto.

A fine mappatura la pagina offre tre strade. «Aggiorna il modello «NOME»» compare solo per un modello salvato e lo porta alla versione successiva. «Usa queste scelte solo per questo file» non salva niente. «Aggiungi nuovo modello» chiede un «Nome del modello», fino a 100 caratteri, e lo salva. Il pulsante «Continua con N colonne» porta alla scheda successiva.

### L'automatica e l'AI

«Ma la mappatura «Automatica (regole e AI)» può mettere una colonna nel campo sbagliato?» Può proporlo. È successo con un file di una sola riga senza intestazione: la colonna del telefono era finita sul codice PDR, e per quei file il rimedio è stato usare il modello di sistema della commessa. Il resto della risposta sta nel modo in cui le proposte arrivano alla pagina. Prima lavorano le regole, che guardano l'intestazione (anche con parole in altro ordine o con un sinonimo: «NOMINATIVO» per la ragione sociale, «PDR» per il codice) e la forma dei valori. Un'intestazione smentita dai valori resta una proposta, con il motivo scritto: «…, ma solo il N% dei valori ha la forma attesa». Le colonne che le regole non risolvono vanno all'AI. Sotto una confidenza di 0,9 nessuna proposta si applica da sola, e finché un campo resta in «Proposta» il pulsante «Importa» è disabilitato. I controlli sul file intero girano prima di ogni scrittura, nulla entra prima di «Importa», e un'importazione in una lista nuova si annulla entro 24 ore.

Che cosa esce verso l'AI è scritto nel codice. Dalla pagina nuova partono l'intestazione e 5 valori per colonna, mascherati: nomi di persona, telefoni, email e codici fiscali non escono mai in chiaro ma conservano una forma riconoscibile, mentre i comuni restano in chiaro. L'Importazione classica funziona diversamente: dove la sua verifica AI è attiva, manda al servizio le prime 10 righe dell'anteprima senza mascheratura. Per tutte e due le voci l'AI dell'importazione si spegne nella configurazione della commessa, che cambia lo staff tecnico (vedi il capitolo 2), e allora non esce nulla.

### I limiti del riconoscimento

I modelli di sistema non conservano la forma dei valori: si controllano solo le date, dedotte dal nome del campo. Un modello senza nomi di colonna, o un file senza intestazione, si confronta per posizione. In questi casi una colonna spostata non viene ritrovata per forma come con un modello salvato. Un modello di sistema senza un'etichetta per ogni colonna non si riconosce dal file: si sceglie a mano, oppure lo si duplica e lo si salva da un file vero, che gli dà la forma dei valori. Cambiare il modello di sistema in sé resta compito dello staff tecnico.

> **Per gli sviluppatori:** la commessa, che nel codice si chiama tenant, ha i suoi modelli salvati nella tabella `mappature_import` del proprio database (migrazione 0012), con id intero. I modelli di sistema si leggono da `custom/{tenant}/php/mappature.php`, con id `sistema:<chiave>`. Impronta, riconoscimento e allineamento sono in `lib/MappaturaImport.php`, le regole di deduzione in `lib/ImportazioneRegole.php`, la chiamata all'AI in `lib/OpenAIImporterHelper.php` con la mascheratura di `lib/ImportazioneMaschera.php`. La struttura di `mappature.php` è nel capitolo 13.

## Importare una lista, passo per passo

*Per il back office.*

La procedura vale per la pagina «Importazione», con una lista nuova o con una lista esistente.

1. Aprite File › Importazione.
2. Trascinate il file nel riquadro «Trascina qui il file della lista», oppure premete «Scegli il file…». Il file viene letto subito, ma nulla entra in GOPlanner finché non premete «Importa».
3. Nel riquadro «Mappatura» scegliete «Riconosci dal file», «Usa un modello», «Automatica (regole e AI)» o «Manuale».
4. Nella scheda «1 · Mappatura» controllate lo stato di ogni colonna e confermate le proposte.
5. Verificate quale colonna va sul campo «Codice».
6. Scegliete se aggiornare il modello, usare le scelte solo per questo file o aggiungere un nuovo modello, poi premete «Continua con N colonne».
7. Nella scheda «2 · Dati da importare», riquadro «1 File», controllate «Foglio» e la casella «Prima riga = nomi delle colonne».
8. Nel riquadro «2 Lista» scegliete «Lista nuova» e compilate «Nome lista» e, se la commessa ha lotti, «Lotto»; «Scadenza» è facoltativa. Oppure scegliete «Lista esistente» e la lista in cui aggiungere le pratiche.
9. Con una lista esistente scegliete «Ignora i duplicati» oppure «Sovrascrivi i duplicati».
10. Dove compare il riquadro «Contatto e pianificazione (REV.1)», scegliete «Tipologia chiamata» e «Data cardine» per le righe in cui la colonna del file è vuota o non è mappata.
11. Guardate la tabella delle prime righe: le colonne ignorate che contengono dati sono in arancio, e il campo si può scegliere lì.
12. Premete «Controlla il file intero» e leggete il risultato.
13. Premete «Importa».

Lista nuova o lista esistente è la scelta che cambia di più. Una lista nuova richiede un nome di al massimo 50 caratteri e, se la commessa lavora per lotti, il lotto; la scadenza va scritta come gg/mm/aaaa. Una lista esistente si sceglie fra le ultime liste aperte che il vostro profilo vede. Quando il file ha lo stesso nome di una lista aperta, la pagina la propone già: «Il file ha lo stesso nome di questa lista: le pratiche vanno lì. Scegli «Lista nuova» per crearne un'altra». Con una lista esistente resta da decidere che cosa fare delle pratiche che la lista ha già, cioè con lo stesso «Codice». «Ignora i duplicati», la scelta predefinita, le lascia come sono e aggiunge solo le altre. «Sovrascrivi i duplicati» le aggiorna con i valori del file, ma una cella vuota non cancella il dato salvato.

«Controlla il file intero» applica la mappatura a tutte le righe in sola lettura e conta che cosa succederebbe. Alcune cose bloccano l'importazione: «Importa» resta disabilitato e la nota accanto dice perché.

- I codici ripetuti nel file: «N codici ripetuti nel file: correggi il file o la colonna del Codice.»
- Le righe senza «Codice»: «N righe senza Codice, che è obbligatorio.»
- I campi obbligatori senza colonna o vuoti; oltre al codice sono indirizzo e comune: «N righe con campi obbligatori vuoti (Indirizzo 3, Comune 1).»
- Un campo ancora in «Proposta».
- Un file senza righe di dati.
- I controlli non ancora finiti.
- La lista senza nome o senza lotto.

Altre cose non bloccano: le righe rifiutate dai controlli propri della commessa, i telefoni mancanti o non validi, le coordinate non valide. La pagina mostra le prime 50 «righe da guardare»; tutte le altre sono nel file xlsx che si scarica dal riquadro.

### Mentre l'importazione lavora

Dopo «Importa» l'importazione va in coda e lavora sul server. La pagina lo dice: «L'importazione continua sul server anche se chiudi la pagina: la ritrovi nel segnalibro a sinistra, in ogni pagina». Il segnalibro cambia colore.

| Colore | Significato |
|---|---|
| giallo | l'importazione lavora o aspetta di partire |
| verde | il lavoro è finito |
| rosso | non è riuscita, oppure è ferma da più di 30 minuti: in 30 minuti non ha aggiornato l'avanzamento o non è mai partita |

L'avanzamento si aggiorna ogni 250 righe, con i contatori «Importate», «Ignorate» e «Scartate». Sopra le 2.000 righe di dati, a fine lavoro arriva anche una mail all'indirizzo di chi ha importato; sotto quella soglia l'esito si vede solo nella pagina e nel segnalibro.

Può comparire un messaggio prima ancora che il lavoro parta: «Le importazioni sono momentaneamente sospese: il file non e' stato importato. Riprova fra qualche minuto; il nostro team e' gia' stato avvisato.» Va preso alla lettera. Il file non è entrato, quindi non esiste nessuna lista a metà, e il team è stato avvisato in automatico. Si riprova più tardi.

«Ma se l'importazione si ferma a metà, o chiudo la pagina, devo ricominciare da capo e ottengo una lista doppia?» No. Chiudere la pagina non ferma niente, perché il lavoro gira sul server. Il pulsante «Annulla lavoro» nella barra di avanzamento ferma la lettura fra una riga e l'altra senza togliere nulla: le pratiche già salvate restano e la lista resta aperta. Importando di nuovo lo stesso file, la pagina lo riconosce: «Questo file era stato fermato con «Annulla lavoro» alla riga N…», e poi «Riprende dalla riga N nella lista ID «NOME»: le N pratiche già caricate non si rileggono.» La ripresa avviene nella stessa lista, dalla riga dopo l'ultima salvata, e il resoconto finale conta l'intero file. Alla ripresa, con una lista nuova vale sempre «ignora»; «sovrascrivi» vale solo se era stato scelto per una lista esistente. Il GOP-745 è stato accettato proprio su questo criterio: annullare a metà, reimportare, zero duplicati, una sola lista.

La ripresa ha due condizioni. Vale solo per lo stesso file, cioè la stessa impronta e lo stesso foglio: un file corretto nel frattempo è, per GOPlanner, un altro file. E serve il registro delle importazioni: dove l'elenco «Ultime importazioni» dice «Il registro delle importazioni non è ancora attivo per questa commessa.», l'importazione si fa come prima, dentro la pagina, senza coda e quindi senza ripresa.

### Importazione classica

La classica ha un modulo più corto.

1. Aprite File › Importazione classica.
2. Scegliete la «Mappatura» dalla tendina: l'elenco cambia da commessa a commessa.
3. Indicate il «Numero righe».
4. Caricate il file in «Carica il file».
5. Premete «Invia» e leggete l'anteprima.
6. Sotto l'anteprima compilate le opzioni previste dalla mappatura.
7. Premete «Conferma».

Dove la verifica AI della classica è attiva, l'anteprima porta in alto l'esito: «Verifica con esito positivo.» oppure «Sono state riscontrate incongruenze.» Se il file non ha righe valide, non compaiono né l'anteprima né il modulo di conferma. Sotto l'anteprima ci sono le opzioni «Ignora riga intestazioni», «Ignora duplicati», «Reimport data» (in inglese anche nell'interfaccia italiana), «Sovrascrivi dati», la casella «Continua importazione», e campi come «Lotto» e «Scadenza». Il pulsante che importa è «Conferma», non la casella «Continua importazione».

Il limite della classica è nella sua struttura. Non ha la coda, non ha la ripresa, non ha il registro e quindi non ha l'annullamento. Le sue opzioni cambiano con la mappatura della commessa: sotto l'anteprima ne potete trovare meno di quelle elencate qui, o altre. Esiste ancora perché le mappature che non sono passate alla pagina nuova si importano solo da lì.

## Quando la pratica c'è già: reimportazione, duplicati e annullamento

*Per il back office.*

Il committente rimanda lo stesso file, aggiornato, quando metà delle pratiche è già pianificata. Chi importa ha due paure: raddoppiare le pratiche o cancellare il lavoro già fatto. Nessuna delle due accade per caso. Quello che accade dipende da una sola colonna, il «Codice». GOPlanner riconosce una pratica già presente per codice, o nel modo in cui la commessa lo definisce, e poi applica una regola diversa secondo la situazione della pratica.

Le regole sono sei, e prendono il nome «REV.1» dalla specifica del committente per cui sono state scritte. Il resoconto le mostra nella tabella «Pratiche già presenti (regole REV.1)», con le colonne «Situazione», «Righe» e «Che cosa ha fatto GOPlanner». Il testo della seconda colonna qui sotto è quello del resoconto.

| Situazione della pratica | Che cosa fa GOPlanner |
|---|---|
| Nuova, codice mai visto | «creata in questa lista» |
| Già presente, aperta, senza appuntamento | «dati aggiornati e portata in questa lista; la lista vecchia non la considera più» |
| Già presente con appuntamento, prenotata o assegnata ma ancora senza esito | «appuntamento tenuto, aggiornate solo le note; resta nella lista dell'appuntamento» |
| Già conclusa (eseguita, non fattibile, controllata, inviata o annullata) | «pratica nuova in questa lista; lo storico resta» |
| Nel file con stato ANNULLATA | «appuntamento annullato; da richiamare dal call center umano» |
| Ripetuta nello stesso file | «vale la prima riga, le altre scartate» |

Il terzo caso è quello che protegge il giro di domani. Un operatore ha già un appuntamento con quell'utenza: la reimportazione non lo sposta e non lo cancella, aggiorna soltanto le note. Il quinto caso fa l'opposto. Il file stesso dice che la pratica è annullata, e GOPlanner annulla l'appuntamento. Quell'annullamento non torna indietro, nemmeno annullando l'importazione: lo spiega la sottosezione *Annullare un'importazione*. Nel resoconto compare la riga «N appuntamenti annullati: N pratiche da richiamare dal call center umano per avvisare il cliente.», e le pratiche finiscono nell'elenco «Pratiche da richiamare», dove si spuntano con «Richiamata». Una pratica che il file dice annullata ma che GOPlanner non ha mai visto non si crea («annullata dalla committente e mai importata: non si crea»). Una già conclusa resta com'è.

Tre regole valgono in tutti i casi. Sulla pratica già presente si scrivono solo i valori pieni del file: una cella vuota, o una colonna che il file non porta, non svuota il dato salvato. Alcuni campi una reimportazione non li cambia mai: l'identificativo, il codice e lo stato. Infine, un problema su una riga non ferma le altre. Una correzione del GOP-478 ha aggiunto un dettaglio pratico: reimportare una pratica aperta non azzera più le coordinate.

«Ignora» e «sovrascrivi» contano solo quando si importa in una lista esistente, e solo per le pratiche che stanno già in quella lista. Con «Ignora i duplicati» queste restano come sono e si contano fra le ignorate, con il motivo «gia' nella lista: lasciata com'e'». Con «Sovrascrivi i duplicati» si applicano le sei regole e si riscrive anche la riga della lista, sempre senza che una cella vuota svuoti un dato. Una pratica che sta in un'altra lista segue le sei regole in entrambi i casi.

«Ma se reimporto lo stesso file due volte, raddoppio le pratiche?» No. Al secondo passaggio ogni codice è già presente, e la pratica segue il suo caso: aggiornata se aperta, intatta con il suo appuntamento, ignorata se è nella stessa lista e avete scelto «ignora». L'unica pratica nuova che nasce da un codice già noto è quella conclusa, e lo storico della vecchia resta com'era. Le pratiche non raddoppiano, ma la lista può cambiare. Se il file ha lo stesso nome di una lista aperta, la pagina propone quella lista, e con «Ignora i duplicati» le pratiche che la lista ha già restano come sono. Se invece scegliete «Lista nuova», le pratiche aperte passano nella lista nuova e la vecchia non le conta più.

### Annullare un'importazione

Un'importazione sbagliata si può annullare, a certe condizioni.

1. Nel resoconto, sotto «Errore di mappatura? Entro 24 ore, se nessuna pratica ha un intervento o un appuntamento, l'importazione si annulla: si tolgono la lista e i clienti creati.», premete «Annulla importazione». In alternativa, premete «Annulla» sulla riga dell'elenco «Ultime importazioni».
2. Il pulsante diventa «Confermi? Clic di nuovo per annullare»: premetelo di nuovo.
3. Leggete l'esito: «Importazione annullata: la lista e i clienti creati sono stati tolti.»

L'annullamento toglie la lista, le sue pratiche e le utenze che l'importazione aveva creato. Le pratiche che l'importazione aveva portato via da una lista vecchia tornano a contare lì. In «Ultime importazioni» il pulsante «Annulla» compare solo quando l'annullamento è possibile, con il suggerimento «Possibile fino a …» e l'ora limite.

Le condizioni sono strette. Le 24 ore si contano dalla fine dell'importazione; dopo, il messaggio è «Sono passate piu' di 24 ore dalla fine dell'importazione». Si annulla solo un'importazione completata: una fermata con «Annulla lavoro» no. Si annulla solo un'importazione in una lista nuova: «Importata in una lista che esisteva gia': non si annulla in blocco». E non si annulla se una pratica della lista ha già un intervento, se un'utenza della lista ha già un appuntamento, o se il file ha annullato pratiche («Non si annulla: il file ha annullato N pratiche e i loro appuntamenti»), perché gli appuntamenti annullati non si ripristinano. Chi pianifica subito dopo l'importazione chiude da sé la finestra.

> **Attenzione:** anche quando l'annullamento riesce, alcune cose non tornano indietro: i dati aggiornati sulle pratiche già presenti (valori del file e note), le utenze create che nel frattempo sono entrate in un'altra lista, le coordinate trovate dalla geocodifica, i dati che le regole proprie della commessa scrivono altrove. Se l'annullamento non è possibile, si corregge con una nuova importazione o si scrive allo staff tecnico.

Due limiti chiudono la sezione. Il caso «nel file con stato ANNULLATA» e l'elenco «Pratiche da richiamare» valgono solo per le commesse che lavorano con il call center: per il call center vedi il capitolo 15. L'Importazione classica, invece, non segue questa tabella. Segue le sue caselle, «Ignora duplicati», «Reimport data», «Sovrascrivi dati» e «Continua importazione»; senza «Sovrascrivi dati» una riga con un codice già noto viene saltata. Questa guida non descrive «Reimport data» e «Continua importazione»: prima di usarle su una lista già pianificata, chiedete allo staff tecnico che cosa fanno con la mappatura della vostra commessa.

## Leggere l'esito: resoconto, scarti e Ultime importazioni

*Per il back office.*

Il file del caso d'apertura aveva 120 righe. La lista ne mostra 112, e qualcuno chiede dove siano finite le altre otto. La risposta è già nel resoconto che compare a fine importazione, sotto l'intestazione «Lista ID «NOME» importata» oppure «Pratiche aggiunte alla lista ID «NOME»». Si tratta di leggere i numeri nel modo giusto.

| Voce del resoconto | Che cosa conta | È uno scarto? |
|---|---|---|
| «Importate», su N righe lette | le righe diventate pratiche: nuove più già presenti | no |
| «Pratiche nuove» | i codici mai visti prima | no |
| «Già presenti» | i codici già noti, trattati secondo le sei regole | no |
| «Ignorate» | già nella lista, con la scelta «ignora» | no |
| Invariate | già presenti e identiche | no |
| «Scartate» | righe che non sono entrate, ciascuna con il suo motivo | sì |
| Avvisi, nel riquadro «Valori non riconosciuti» | valori che GOPlanner non ha saputo interpretare | no |
| «Tempo» | la durata, in secondi | — |

Invariate e avvisi fanno spesso pensare a un problema che non c'è. Il riquadro degli avvisi lo dice: «Non salvati: per quei campi vale il valore della lista.» La riga si salva lo stesso; resta vuoto, o al valore della lista, solo quel campo. Un avviso non è una riga persa.

I motivi di scarto hanno un testo fisso, e ognuno indica che cosa correggere:

- «senza codice»: nel file manca il codice su quella riga; va aggiunto;
- «codice ripetuto nel file (riga N)»: lo stesso codice compare più in alto, alla riga N; vale la prima riga e la seconda è scartata, quindi si chiede al committente quale delle due è giusta;
- «rifiutata dai controlli del tenant»: la riga non ha superato i controlli propri della commessa; va corretta secondo quelle regole;
- «errore nel salvataggio»: non dipende dal file; si segnala allo staff tecnico;
- «annullata dalla committente e mai importata: non si crea»: viene dalle regole di reimportazione e non richiede correzioni.

Il riquadro «Righe scartate» elenca riga, codice e motivo. Se tutto è entrato, dice «Nessuna: tutte le righe del file sono entrate nella lista.»

La somma deve tornare: le righe lette sono importate più ignorate più invariate più scartate. Le invariate non hanno un indicatore loro: se «Importate», «Ignorate» e «Scartate» insieme restano sotto le righe lette, la differenza sono loro. Nel caso del banco la somma tornava, 112 più 8 fa 120, e gli otto scarti avevano due motivi, cinque codici ripetuti e tre righe senza codice. Il conto chiude l'indagine prima ancora di aprire il file.

Chi ha seguito la procedura può obiettare: «Ma se il controllo sul file intero tiene «Importa» disabilitato quando ci sono codici ripetuti o righe senza codice, come arrivano quegli scarti nel resoconto?» Con la pagina «Importazione» il controllo li trova prima, e il file si corregge prima di importare. I due motivi restano nel resoconto per i casi che il controllo non ferma allo stesso modo, per esempio una commessa che compone il codice da più colonne. Lo scenario del banco insegna a leggere la somma, e la somma vale per qualunque motivo.

### L'elenco «Ultime importazioni»

Il resoconto si rilegge anche dopo, dall'elenco «Ultime importazioni» della pagina, con le colonne «Quando», «File», «Lista», «Pratiche», «Mappatura» ed «Esito». Gli esiti possibili sono «in coda», «in corso», «completata», «fallita», «annullata», «fermata» (interrotta con «Annulla lavoro») e «ripresa». Il pulsante «Esito» riapre il resoconto, «Segui» l'avanzamento, «Annulla» l'annullamento quando è possibile; passando sul cartellino dell'esito si legge il messaggio del registro, per esempio «Importazioni momentaneamente sospese». Il resoconto conserva per esteso i primi 100 scarti e i primi 100 avvisi; oltre li conta soltanto e scrive «e altre N.». Il file caricato si copia in un archivio della commessa prima ancora della lettura, e si conserva 90 giorni. È il valore predefinito, deciso il 3 novembre 2026: la commessa può cambiarlo, e con 0 non lo cancella mai.

Gea è la prima domanda da fare. Legge le ultime 10 importazioni, le ultime 10 liste (anche le classiche) e le ultime 10 esportazioni della commessa corrente, e a «mancano righe dopo l'importazione» risponde con i numeri e i motivi del registro, senza mostrare in chat i dati delle utenze. Per Gea in generale vedi il capitolo 10.

### Con l'Importazione classica

«Ma se uso l'Importazione classica, dove vedo quali righe sono rimaste fuori?» Non si vedono. La classica non salva né le righe scartate né i loro motivi: una riga che non supera la validazione della commessa viene saltata senza lasciare traccia, e anche una riga con un codice già noto viene saltata se «Sovrascrivi dati» non è spuntata. Di una lista classica si conoscono solo le pratiche entrate. L'esito si legge nell'elenco delle liste, la voce «Carichi» del menu Interventi, con le colonne «Numero interventi», «Assegnati a operatore», «Eseguiti», «Completati», «Non fattibili», «Ripianificabili» e «Completamento». La differenza fra il file e la lista si ricostruisce solo a mano, confrontando i due. Se il committente chiede perché un'utenza non è mai stata visitata, il gestionale non dice se la sua riga era nel file né perché non è entrata. Resta il file originale: anche quello della classica si copia nell'archivio della commessa e si conserva 90 giorni, salvo un'impostazione diversa della commessa. Per avere il dettaglio degli scarti serve la pagina «Importazione», quando il modello della commessa lo permette.

Il registro delle importazioni ha a sua volta un limite: esiste solo dove è stata applicata la sua migrazione. Dove manca, la pagina lo dice («Il registro delle importazioni non è ancora attivo per questa commessa.») e restano solo le liste. Per una lista senza registro, classica o precedente, chi ha caricato il file e quando si ricava dal nome del file archiviato, che porta data, ora e identificativo dell'utente. Nella classica, inoltre, anteprima e importazione non si distinguono: un file archiviato non prova che le sue righe siano entrate. Il nome di chi ha importato lo vedono solo gli amministratori: vedi il capitolo 11.

## Quando il tracciato cambia: diagnosi, correzione della mappatura e Gea

*Per il back office.*

Il modello che il mese scorso «Riconosci dal file» applicava da solo, oggi non si applica più. Il file è quello giusto, ma il committente ha cambiato la disposizione delle colonne. È un caso documentato: in un ticket del 2025 un committente aveva cambiato il tracciato del file con cui manda i dati, e lo staff aveva aggiornato la mappatura indicando la colonna A come codice univoco. Allora serviva lo staff tecnico. Oggi la diagnosi si legge nella pagina, o la fa Gea.

| Sintomo nel file | Rimedio |
|---|---|
| Colonne spostate o in più | la pagina le ritrova da sola |
| Colonne finali assenti | solo un avviso, i campi restano vuoti; se sono obbligatori (codice, indirizzo, comune, matricola) diventano colonne mancanti |
| Una colonna mancante | aggiungerla al file, oppure scegliere un modello che non la richiede |
| Colonne scalate di un posto | rimettere l'ordine del modello |
| Intestazione cambiata | ripristinare il nome, oppure scegliere il modello a mano |
| Zeri iniziali persi o codici in notazione scientifica (1,23E+15) | formattare la colonna come testo e ricopiare i codici dal file originale |
| Data come testo o come numero di cinque cifre | formattare la colonna come data gg/mm/aaaa |
| Separatore delle migliaia, virgola e punto misti, unità o valuta | lasciare solo il numero con la virgola decimale |
| Testo dove il modello aspetta un numero | le colonne sono in un altro ordine: rimettere l'ordine del modello |
| Intestazione mancante o in più, dati che cominciano su un'altra riga | aggiungere o togliere righe sopra la tabella, oppure scegliere un altro modello |
| Foglio sbagliato | scegliere il foglio giusto nella pagina «Importazione» |
| Nessun modello coincide | scegliere a mano, oppure creare e salvare la mappatura |

Fra tutti, i codici rovinati sono il sintomo più pericoloso, perché non si vedono. Excel toglie gli zeri iniziali o trasforma un codice lungo in 1,23E+15, perdendo le ultime cifre. Il «Codice» non coincide più con quello salvato, e per GOPlanner è un codice mai visto. Invece di uno dei casi di pratica già presente, che per esempio tiene l'appuntamento, scatta il caso della pratica nuova: nasce un'utenza con il codice sbagliato, mentre quella vera resta dov'era. Se due codici troncati diventano uguali, il controllo sul file intero li segnala come codici ripetuti e «Importa» resta disabilitato. Negli altri casi il segnale va cercato, e lo trova la verifica del file con Gea descritta qui sotto. Il rimedio sta nel file, non in GOPlanner: colonna come testo, codici ricopiati dall'originale, nuova importazione.

I rimedi sono tre, da scegliere in quest'ordine. Il primo è correggere il file, quando il problema è nei valori: codici, date, numeri, foglio, righe sopra la tabella. Il secondo è scegliere un altro modello, quando il committente manda un tracciato che esiste già. Il terzo è aggiornare la mappatura, quando il nuovo tracciato è quello che resterà: dalla pagina, con «Aggiorna il modello «NOME»» dopo aver sistemato le colonne nella scheda «1 · Mappatura», oppure con la proposta di Gea.

### La correzione con Gea

Gea legge il file archiviato, ne ricalcola l'impronta e la confronta con il modello con gli stessi confronti della pagina. Poi spiega colonna per colonna, con la lettera e l'intestazione: colonne mancanti, in più, spostate, con valori di forma diversa. Gli esempi che mostra sono mascherati: «Esempi mascherati: 9 = cifra, x = lettera; zeri iniziali, separatori e date restano come nel file.» La diagnosi usa frasi come «I codici hanno N cifre invece di M: mancano gli zeri iniziali…» o «Le date sono arrivate come numeri (il numero di serie che il foglio usa per le date): formattare la colonna come data (gg/mm/aaaa).» Al servizio AI non escono dati delle utenze: solo intestazioni, nomi di modelli e fogli, forme dei valori ed esempi mascherati.

Quando il problema è la mappatura, Gea può proporre la correzione.

1. Chiedete a Gea di verificare il file dell'importazione, o della lista, che non torna.
2. Leggete l'anteprima della proposta, campo per campo, nella forma «Matricola: colonna A → colonna B»; un campo senza più colonna compare come «colonna non più nel file: il campo non verrà importato».
3. Premete «Autorizza» entro dieci minuti per applicarla, oppure «Annulla».
4. Leggete la verifica sul file, che Gea rifà e mostra dopo la modifica.
5. Se il risultato non va, premete «Ripristina».

Le reti di sicurezza sono scritte nel codice. Nulla cambia prima di «Autorizza»: la modifica parte dal clic, mai da una decisione di Gea. Gea non inventa mappature, usa lo stesso allineamento della pagina. Un modello salvato riceve una versione in più, come con «Aggiorna il modello». Un modello di sistema non si tocca mai: nasce una copia salvata con il nome seguito da « (aggiornato)», poi « (aggiornato 2)», e così via. Ogni correzione resta nello storico con chi, quando, prima e dopo. «Ripristina» rimette il modello com'era solo se nessuno lo ha cambiato dopo; altrimenti lo rifiuta per non cancellare quella modifica, e la correzione si fa dalla pagina. Serve il permesso «Importare interventi»: senza, Gea risponde che la correzione la può applicare un amministratore della commessa o chi ha quel permesso. Se il modello è già allineato, non c'è nulla da cambiare; se non esiste un modello di partenza, lo si crea dalla pagina con «Aggiungi nuovo modello».

Gea non risolve tutto con la mappatura. Valori di forma diversa, un foglio cambiato o una riga d'intestazione spostata non si correggono cambiando il modello: si corregge il file. Dove lo storico delle correzioni non è attivo, Gea non propone modifiche, perché una modifica non sarebbe annullabile: risponde che le sue correzioni non sono ancora attive per quella commessa, e la mappatura si cambia dalla pagina. Un modello di sistema da cambiare davvero, non da copiare, resta allo staff tecnico.

> **Per gli sviluppatori:** mappa dei file. `lib/ImportazioneController.php` (pagina e coda), `lib/ImportazioneEsecuzione.php` (righe e scarti), `lib/ImportazioneReimportazione.php` (i sei casi), `lib/ImportazioneRegistro.php` (registro, tabella `importazioni`, annullamento), `lib/ChatbotVerificaImport.php` e `lib/ChatbotStrumentoProponiMappatura.php` (Gea), `lib/MappaturaImportStorico.php` (tabella `mappature_import_storico`, migrazione 0044), `pages/file.php` (classica). Il permesso «Importare interventi» è la chiave `interventi.importare` di `lib/CatalogoPermessi.php`. La lista, che nel codice si chiama carico, sta nelle tabelle `carichi` e `carichi_righe`. Il flusso è spiegato nel capitolo 13.

> **Quando chiedere allo staff tecnico:** si scrive allo staff con il nome del file, il giorno e l'ora, il numero dell'importazione se è visibile e la mappatura scelta, in questi casi:
>
> - un'importazione con esito «fallita»;
> - uno scarto «errore nel salvataggio»;
> - un file Excel o CSV valido che risulta «File non leggibile»;
> - importazioni «momentaneamente sospese» che restano sospese anche più tardi;
> - un'anteprima vuota o incoerente nella classica, perché la mappatura della commessa va verificata;
> - la pagina File che resta bianca: sul server c'è un problema che la pagina non mostra;
> - un modello di sistema da modificare.
>
> Le pagine di diagnostica dello staff sono nel capitolo 12.

### La regola d'indagine

Ogni volta che una lista non torna con il file, l'indagine segue cinque passi, in quest'ordine.

1. Aprite il resoconto, o la riga in «Ultime importazioni», e fate la somma: lette uguale importate più ignorate più invariate più scartate.
2. Leggete i motivi degli scarti e correggete nel file quello che dipende dal file.
3. Se il problema è il tracciato, verificate il file colonna per colonna, nella scheda «1 · Mappatura» o con Gea.
4. Aggiornate la mappatura dalla pagina, oppure autorizzate la proposta di Gea, e reimportate.
5. Se resta qualcosa che non dipende dal file, scrivete allo staff tecnico con il nome del file, il giorno e l'ora.

## Fonti

- codice: `lib/ImportazioneController.php`, `lib/ImportazioneEsecuzione.php`, `lib/ImportazioneReimportazione.php`, `lib/ImportazioneRegistro.php`, `lib/ImportazioneControllo.php`
- codice: `lib/MappaturaImport.php`, `lib/MappatureImportController.php`, `lib/ImportazioneRegole.php`, `lib/OpenAIImporterHelper.php`, `lib/ImportazioneMaschera.php`
- codice: `lib/ImportazioneLettore.php`, `lib/ImportazioneFileTemporaneo.php`, `lib/ImportazioneArchivio.php`, `lib/AvanzamentoJob.php`, `lib/AvanzamentoCarichi.php`
- codice: `lib/ChatbotVerificaImport.php`, `lib/ChatbotStrumentoProponiMappatura.php`, `lib/ChatbotStrumentoOperazione.php`, `lib/MappaturaImportStorico.php`
- codice: `lib/CatalogoPermessi.php`, `lib/ProfiliPiattaforma.php`, `lib/MenuInterventi.php`, `lib/dict/lang_it.php`
- codice: `pages/file.php`, `Smarty_templates/it/file.html`, `Smarty_templates/it/importazione.html`, `js/code/importazione.js`, `js/code/job-progress.js`
- codice: `migrations/tenant/0012_mappature_import.sql`, `migrations/tenant/0013_importazioni.sql`, `migrations/tenant/0044_mappature_import_storico.sql`
- codice: `chatbot-service/eval/fixtures/R-2026-11-09-import-scarti.json`
- wiki: `wiki/assistenza-clienti/import-carico.md`, `wiki/assistenza-clienti/pagina-file.md`, `wiki/assistenza-clienti/stato-import-export.md`
- wiki: `wiki/assistenza-clienti/runbook-import-righe-mancanti.md`, `wiki/assistenza-clienti/runbook-file-import-non-conforme.md`, `wiki/assistenza-clienti/runbook-correggere-mappatura.md`, `wiki/assistenza-clienti/runbook-pagina-file-non-funziona.md`
- wiki: `wiki/pianificazione/modello-pianificazione-appuntamenti.md`
- Portolano: `goplanner-import-classico-anteprima-ai`
- Portolano: scheda sulla mappatura «senza modello» del 3 novembre 2026 (senza slug)
- Jira: GOP-10 — tracciato del file del committente cambiato, mappatura aggiornata
- Jira: GOP-475 — modelli di mappatura dell'importazione
- Jira: GOP-478 — coordinate conservate alla reimportazione
- Jira: GOP-480 — regole di reimportazione
- Jira: GOP-481 — annullamento dell'importazione
- Jira: GOP-655 — archivio del file importato
- Jira: GOP-739 — Gea legge il registro delle importazioni
- Jira: GOP-745 — duplicati e ripresa dell'importazione
- Jira: GOP-815 — verifica del file d'importazione da parte di Gea
- Jira: GOP-816 — correzione della mappatura su conferma e storico
