# 9. Il magazzino

*In questo capitolo si vede dove può trovarsi un pezzo con un codice, come passa da un posto all'altro e che cosa resta scritto a ogni passaggio. Si impara a caricare, assegnare, far rientrare e cercare i contatori dal back office, a leggere le anomalie e a riconoscere che cosa non si annulla. Il capitolo è per il back office, con riquadri per gli sviluppatori; DDT e Magazziniere valgono solo per le commesse che li hanno accesi.*

## Dove sta un pezzo: depositi, stati e le voci del menu

Un caso inventato, per fissare le idee. Un operatore chiude una sostituzione e scrive come matricola nuova un contatore che il registro dava nel furgone di un collega. La chiusura passa. Il furgone del collega ha un pezzo in meno, la sua assegnazione cade, e l'unica traccia di quello che è successo è una riga «Installazione forzata» in Magazzino › Anomalie, con un numero accanto alla voce del menu. Il magazzino di GOPlanner non ferma mai il lavoro sul campo. Registra, e lascia all'ufficio il compito di leggere.

Il magazzino tiene traccia dei pezzi che hanno un **Codice**: una riga per pezzo. Per un contatore il codice è la sua matricola, ma in ogni etichetta del magazzino il campo si chiama «Codice», per una decisione dell'11 novembre 2026; «matricola» resta solo per il contatore registrato su un'utenza e per il campo «matricola nuova» della chiusura. Dove la commessa ha il catalogo, il magazzino conta anche gli articoli a quantità, come basette e accessori, che non hanno un codice per pezzo e si contano per deposito (se ne parla nella sezione sui DDT). I depositi sono di due soli tipi. C'è il deposito centrale, uno per commessa, che in Giacenze compare come «Magazzino centrale», e c'è il furgone di ogni operatore, uno per operatore, che compare con il cognome e il nome dell'operatore. Il furgone nasce con il primo movimento che lo riguarda; consultare le giacenze non lo crea. Depositi periferici e collocazioni, previsti nel progetto originale, in questa versione non esistono.

Ogni pezzo sta in un solo posto alla volta, e il posto si legge nella colonna Stato di Giacenze.

| Stato come appare | Che cosa vuol dire | Dove conta |
|---|---|---|
| «In centrale» | nessun operatore lo ha in scorta | nelle giacenze del deposito centrale |
| «Assegnata, da ritirare» | l'ufficio lo ha già messo nel furgone di un operatore, che non lo ha ancora letto con Carica | nel furgone, segnato come da ritirare |
| «In furgone» | è nella scorta dell'operatore, senza assegnazione in sospeso | nel furgone |
| «Installata» | montato su un'utenza | fuori dalle giacenze, resta nei movimenti |
| «Smontato» | contatore tolto a una chiusura, in un furgone o in centrale | non conta nei pezzi né nei totali, non si assegna (solo dove la commessa lo ha) |

Manca uno stato, e la mancanza è voluta. Un pezzo consegnato al committente con un DDT di uscita non compare più in Giacenze né nei totali, e non si muove più. L'etichetta «Consegnato al committente» esiste solo fuori da Giacenze: nella Storia del pezzo, e come «Già consegnato al committente» nell'anteprima dei dialoghi di carico e assegnazione.

Le domande hanno ciascuna la sua voce nel menu di sinistra della sezione Magazzino.

| Voce | La domanda a cui risponde | Quando c'è |
|---|---|---|
| Giacenze | dov'è adesso ogni pezzo | sempre; è la voce di apertura |
| Movimenti | come ci è arrivato | sempre |
| Anomalie | dove il campo e il registro non si sono trovati d'accordo | sempre, con accanto il numero di quelle da vedere quando è maggiore di zero |
| Storia del pezzo | tutto quello che si sa di un codice | sempre |
| Articoli | catalogo e saldi dei materiali a quantità | solo dove la commessa ha il catalogo |
| DDT, Smontati | documenti di trasporto e contatori smontati | solo dove la commessa ha i DDT accesi |

In fondo una commessa può aggiungere voci proprie, che questa guida non descrive; non possono però sostituire le voci di base, né DDT e Smontati.

### Il registro, i permessi e le parole

Al centro della sezione c'è il registro. Ogni cambio di posto è una riga di Movimenti, con le colonne Data, Codice, Movimento, Da, A, Operatore, Origine e Intervento, ordinate dalla più recente. Un pezzo cambia posto solo quando viene scritto un movimento. Niente nel magazzino si sposta da solo.

Chi vede e chi scrive lo decidono due permessi. «Vedere il magazzino» ha come descrizione «Consulta carichi, giacenze e lotti.»; «Gestire il magazzino» ha «Registra carichi e movimenti e modifica i lotti.». Senza il secondo i pulsanti che scrivono non ci sono proprio, perché vengono tolti dal server, e accanto al titolo compare l'etichetta «Sola consultazione». Tra i profili della piattaforma, «Amministratore commessa», «Pianificatore» e «Magazziniere» hanno entrambi i permessi; «Call center» e «Consultazione» vedono soltanto; «Consultazione esterno» e «Tecnico» non vedono la sezione. Come si assegnano i profili è materia del capitolo 11.

Tre parole qui hanno un senso diverso da quello del resto della guida. «Codice» sostituisce «matricola», come detto. La colonna «Lotto» è il lotto di provenienza di un pezzo (per esempio, inventato, *L2026-014*), non il lotto della commessa a cui appartiene una lista. E i «carichi» della descrizione del permesso sono pezzi caricati in un deposito, non liste: la griglia Interventi › Carichi del capitolo 3 è un'altra cosa.

Ogni griglia finisce con il pulsante «Excel», che esporta tutte le righe filtrate come lavoro in coda, con una finestra di avanzamento. Non è l'esportazione verso il committente, che ha il suo capitolo, il 7. Le righe per pagina si scelgono tra 10, 25, 50, 100 e 200; il valore di partenza è 25.

Il limite di tutto questo è che la sezione nuova non c'è dappertutto. Giacenze, Movimenti e Anomalie esistono solo sulle commesse che hanno il nuovo magazzino acceso, oggi alcune. Le altre hanno ancora la pagina precedente, con le voci «Articoli» e «Collocazioni», che questo capitolo non descrive. Se la commessa ha il magazzino acceso ma le manca l'aggiornamento del database, la pagina non mostra griglie e dice: «Il magazzino base non è ancora attivo su questo cliente: manca un aggiornamento del database. Contatta l'assistenza.» («cliente» è la parola del messaggio: qui vuol dire la commessa.) Se invece manca proprio la voce Magazzino nel menu in alto, le cause possibili sono due: la commessa non usa il nuovo magazzino, oppure il menu personalizzato dell'utente la toglie. Il 12 novembre 2026, il giorno dopo il rilascio, la voce sparì per tutti gli utenti delle commesse con il nuovo magazzino, perché la configurazione del tipo di commessa la spegneva; da allora il codice comune la riaccende, e il menu personalizzato resta l'ultima parola (vedi il capitolo 2). In entrambi i casi si chiede all'amministratore o allo staff tecnico.

> **Per gli sviluppatori:** `pages/magazzino.php` sceglie tra pagina nuova e vecchia con `MagazzinoPagina::attiva()`, che legge `$custom['mobile']['features']['magazzino']` (la commessa, che nel codice si chiama tenant). Le tabelle di base arrivano con la migrazione `0032_magazzino_base.sql`; la giacenza autorevole è `magazzino`, il registro `magazzino_movimenti`, che contiene i movimenti v3 e non tutta la storia. Le etichette stanno in `lib/MagazzinoGriglie.php`. Schema nel capitolo 14.

Un pezzo, un posto, un movimento per ogni spostamento: Giacenze dice dove, Movimenti come, Anomalie dove i due racconti divergono.

## Far entrare il materiale: Carica in centrale e Importa da Excel

*Per chi ha il permesso «Gestire il magazzino».*

Sono arrivati contatori nuovi. Prima che un operatore possa portarli via, devono esistere nel deposito centrale, e ci sono due strade: il dialogo «Carica in centrale…» per pochi pezzi o per il banco con il lettore, «Importa da Excel» per il file del fornitore. Entrambe scrivono lo stesso movimento, «Carico in centrale», che va da nessun deposito al centrale.

### Pochi pezzi: «Carica in centrale…»

1. Aprite Magazzino › Giacenze.
2. Premete «Carica in centrale…».
3. Nel campo «Codice o QR» leggete un codice con il lettore, oppure incollate un elenco. Ogni lettura termina con Invio e il campo resta selezionato.
4. Leggete l'anteprima: ogni codice compare con il suo stato («Nuovo, non ancora in magazzino», «In centrale», «Assegnato a {operatore}, da ritirare», «Nel furgone di {operatore}», «Contatore smontato», «Già installato», «Già consegnato al committente», «Codice non valido»). Si caricano solo i «Nuovo»; gli altri restano in elenco con il motivo. La «×» accanto a una riga la toglie.
5. Premete Invio a campo vuoto, oppure il pulsante blu «Carica in centrale», per vedere il riepilogo: «Carichi in centrale N codici.»
6. Un secondo Invio, o il clic, conferma.
7. I pezzi compaiono in Giacenze come «In centrale» e in Movimenti come «Carico in centrale» con origine «Back office».

Sotto il campo una riga di conteggio dice quanti codici sono stati letti, quanti si caricheranno e quanti «restano fuori (vedi il motivo)». In un dialogo di carico o di assegnazione stanno fino a 5000 codici per lettura, che la pagina spedisce al server in blocchi da 500. Se tutto riesce, il dialogo si chiude e la griglia si ricarica. Se qualcosa viene rifiutato, il dialogo resta aperto con un riquadro del tipo «N caricati, K non caricati:» e l'elenco «codice · motivo».

### Il QR della scatola e della pedana

Una scatola contiene 5 contatori; una pedana contiene scatole. Leggere il QR di una scatola equivale a leggere i suoi contatori uno per uno: un movimento per contatore, con le stesse regole riga per riga. Secondo la nota del 23 novembre 2026 su GOP-862, il QR della scatola del committente contiene i codici dei suoi 5 contatori separati da punto e virgola (per esempio, inventato, `AB1;AB2;AB3;AB4;AB5`); il formato del QR della pedana, alla stessa data, è ancora aperto. Una scatola aperta non è un problema: si leggono i pezzi singoli.

Quando la scatola o la pedana hanno un codice proprio, per esempio perché il file d'importazione lo porta nelle colonne Scatola e Pedana, quel codice viene salvato su ogni pezzo. Si può poi cercare in Giacenze e nella Storia del pezzo. Un QR che porta solo il codice di una scatola ritrova i pezzi dai codici salvati al carico: serve ad assegnare una scatola già in centrale, non a caricarne una nuova.

Qui sta la cautela. Finché il formato del committente non è impostato per la commessa, il QR di una scatola nuova che porta solo il proprio codice compare nell'anteprima come un unico codice «Nuovo, non ancora in magazzino». Non va confermato: va segnalato. L'anteprima esiste proprio per questo, e la lettura dei codici singoli funziona sempre. Se il dialogo mostra «Parti del QR non riconosciute: …», si manda allo staff tecnico una foto del QR.

### Molti pezzi: «Importa da Excel»

Il pulsante «Importa da Excel» apre File › Importazione già sulla scelta «Cosa importi: Magazzino», descritta come «Articoli con codice da caricare nel deposito centrale. I codici già presenti non si ricaricano.». La scelta del file (xls, xlsx, ods o csv, uno alla volta), le quattro modalità di mappatura e il lavoro in coda con «Annulla lavoro» sono gli stessi delle pratiche: vedi il capitolo 4, *Importazione*. Qui conta quello che cambia.

| Campo | Obbligatorio | Che cosa contiene |
|---|---|---|
| Codice | sì | al massimo 20 caratteri: lettere, cifre e `.` `_` `/` |
| Modello | no | il modello del contatore |
| Calibro | no | un numero da 0 a 100000; un testo scarta la riga |
| Lotto | no | il lotto di provenienza |
| Pedana | no | il codice della pedana |
| Scatola | no | il codice della scatola |

Prima di confrontarlo, il codice perde spazi e trattini, e maiuscole e minuscole non fanno differenza: `A-1000004` e `A1000004` (esempi inventati) sono lo stesso codice. Prima di «Importa», un controllo in sola lettura su tutto il file mostra quante righe sono «Da caricare», «Già presenti» (divise tra centrale, furgoni e installati), «Non valide» e «Ripetute nel file». A fine lavoro il resoconto riporta «Caricate in centrale», «Già presenti», «Non valide», «Ripetute nel file» e, quando serve, «Da riprovare», con le prime 100 righe non caricate per esteso; oltre, si contano soltanto. In Movimenti i pezzi entrano come «Carico in centrale» con origine «Importazione» e il nome del file.

I motivi di scarto, come li scrive il resoconto:

- «Codice vuoto»
- «Codice con caratteri non ammessi»
- «Codice troppo lungo»
- «Lunghezza del codice non valida per la commessa» e «Formato del codice non valido per la commessa»
- «Calibro non valido»
- «Già in magazzino, nel deposito centrale» e «Già in magazzino, nel furgone di un operatore»
- «Già installato»
- «Stesso codice di una riga più in alto nel file»
- «Codice occupato da un altro movimento: importa di nuovo il file»

Una riga scartata non ferma le altre.

Dopo la prima importazione, il dubbio è questo: «Ho importato due volte lo stesso file: adesso ho i contatori doppi?». No. Alla seconda importazione quei codici risultano «Già presenti» e si caricano solo quelli che mancavano. È anche il modo previsto per completare un'importazione fermata a metà: si importa di nuovo lo stesso file. Ne discende la regola della sezione. Un codice entra nel magazzino una volta sola. Non si ricarica e non si aggiorna: Modello, Calibro e Lotto già salvati restano com'erano, e non esiste un «sovrascrivi» come nell'importazione delle pratiche.

Il rovescio della regola è che un carico non si annulla. L'importazione delle pratiche in una lista nuova si annulla entro 24 ore (vedi il capitolo 4); quella del magazzino no, perché un carico in centrale è un movimento e resta nel registro. Le difese stanno tutte prima della conferma: il controllo in sola lettura dell'intero file e l'anteprima con lo stato di ogni codice. Il resoconto chiude con la frase «Un articolo caricato per errore si corregge con un movimento di magazzino: l'importazione non si annulla in blocco.», ma tra i pulsanti dell'ufficio nessun movimento fa uscire dal magazzino un pezzo nuovo (l'uscita al committente vale solo per i contatori smontati). Per i pezzi caricati per errore, quindi, si chiede allo staff tecnico.

Gli altri limiti si riconoscono da un messaggio:

- i due motivi che finiscono con «… per la commessa»: le regole sul formato sono della commessa, e la pagina mostra il motivo senza applicarle da sé;
- l'avviso giallo «Il lotto non viene salvato per questa commessa: segnalarlo all'assistenza.»: la mappatura contiene il Lotto e la commessa non può ancora salvarlo; i pezzi si caricano, il lotto va perso;
- «Le importazioni sono momentaneamente sospese…»: lo stesso messaggio dell'importazione delle pratiche, e si riprova più tardi (capitolo 4).

Il Magazziniere non ha «Importa da Excel» (sezione sul Magazziniere).

> **Per gli sviluppatori:** campi e motivi in `lib/ImportazioneMagazzino.php` (`CAMPI`, `MOTIVI`, `MAX_SCARTI = 100`). L'esecuzione è un `ImportazioneJob` in coda che chiama `MagazzinoGestione::caricoCentrale(…, 'importazione', $nomeFile)` a blocchi di 500 righe. Il parsing dei QR è configurabile per commessa in `$custom['mobile']['magazzino']['qr']`, con prefissi come `SCATOLA:` e `PEDANA:`; il separatore del prefisso è obbligatorio.

## Dal centrale al furgone, dal furgone all'utenza: assegnare, ritirare, rientrare, installare

*Per il back office.*

Un contatore in centrale non serve a nessuno finché non è nel furgone giusto. Il passaggio ha due tempi, e il registro li tiene distinti: l'ufficio assegna, l'operatore ritira. Tra il primo e il secondo il pezzo è già nel furgone, con uno stato che dice che l'operatore non lo ha ancora preso.

### Assegnare a un operatore

1. Aprite Magazzino › Giacenze.
2. Premete «Assegna a operatore…».
3. Scegliete l'operatore dal menu «Scegli l'operatore…». L'elenco contiene gli operatori attivi e visibili, più chiunque abbia ancora pezzi nel furgone.
4. Leggete o incollate i codici, oppure il QR di una scatola o di una pedana.
5. Leggete l'anteprima. Si assegnano solo i pezzi «In centrale». Un codice «Nuovo, non ancora in magazzino» va prima caricato con «Carica in centrale…»; uno «Nel furgone di …» è già di un operatore.
6. Invio a campo vuoto per il riepilogo («Assegni N codici a <operatore>.»), poi un secondo Invio per confermare, come nel carico.

Dopo la conferma il pezzo è già nel furgone dell'operatore, ma con lo stato «Assegnata, da ritirare». Diventa «In furgone» quando l'operatore lo legge con Carica nell'app, e in Movimenti compare il movimento «Ritiro (app)». Il pezzo si conta una volta sola. Che cosa vede l'operatore sul telefono è nel capitolo 8.

### Far rientrare in centrale

Il dialogo «Rientro in centrale…» fa il percorso inverso. Si sceglie l'operatore, e accanto a ogni nome compare quanti pezzi ha «(N nel furgone)». Si leggono o si incollano i codici nel campo «Codice». Qui le regole cambiano: al massimo 500 codici per volta, nessuna anteprima, ogni lettura è un codice; il QR di scatola e pedana si legge solo in carico e in assegnazione. Il pulsante di conferma è «Registra rientro». Un rientro registrato prima del ritiro cancella anche l'assegnazione, e lo stesso vale per uno Scarica dall'app.

Tutte queste operazioni rispondono codice per codice, e qui sta la prima vera trappola. I codici rifiutati restano nel dialogo con il motivo: «È nel furgone di un altro operatore.», «Non è in magazzino: caricalo prima in centrale.», «Già installato.», «Non è nel furgone di questo operatore.», «Occupato da un altro movimento: riprova.». Tutti gli altri sono **già registrati**, e la prima riga del riquadro lo dice: «N assegnati, K non assegnati:». Chi legge solo l'elenco dei rifiutati, pensa che non sia successo nulla e riconferma tutto non fa danni: un codice già assegnato non è più «In centrale» e non si assegna una seconda volta. Chi chiude la finestra convinto che tutto sia passato, invece, manda un operatore in giro senza i contatori che l'ufficio crede di avergli dato. Si correggono e si riconfermano solo i rifiutati.

| Movimento come appare | Da → A | Chi lo registra |
|---|---|---|
| «Carico in centrale» | nessuno → centrale | ufficio, anche con l'importazione |
| «Assegnazione» | centrale → furgone | ufficio |
| «Ritiro (app)» | centrale → furgone, o furgone → furgone se era da ritirare | app, con Carica |
| «Ritiro non previsto» | nessuno → furgone | app, Carica di un codice mai visto |
| «Cambio collocazione» | furgone → furgone | app, Carica di un pezzo già in scorta |
| «Rientro in centrale» | furgone → centrale | app con Scarica, o ufficio |
| «Installazione» | furgone → nessuno | app con Installa, o chiusura |
| «Installazione forzata» | dove si trova → nessuno | chiusura, codice non nella scorta |

«Contatore smontato», «Consumo (chiusura)» e «Uscita al committente» appartengono alla sezione sui DDT. Le origini sono quattro: «Back office», «App», «Importazione», «Chiusura intervento». In Movimenti si filtra per Movimento, Origine, Operatore e per data, con i campi Dal e Al.

### Che cosa scrive la chiusura dell'intervento

Quando un intervento si chiude come eseguito (stato 4) con una matricola nuova, il server registra «Installazione» con origine «Chiusura intervento». Il pezzo esce dal furgone e diventa «Installata» su quell'utenza e quell'intervento. Se l'operatore aveva già premuto Installa nell'app, il pezzo conta comunque una volta: una chiusura ripetuta non scrive un secondo movimento.

Il caso difficile è il codice che non era nel furgone di quell'operatore. L'installazione viene registrata lo stesso, dal deposito in cui il pezzo si trova, e nasce un'anomalia «Installazione forzata». La colonna Dettaglio dice da dove: «Il pezzo era in centrale»; «Il pezzo era nel furgone di un altro operatore», e allora il pezzo esce da quel furgone e l'assegnazione del collega cade; «Codice mai caricato», e la riga nasce già installata; «Codice già installato», e in questo caso il pezzo non si muove, resta solo l'anomalia. Il magazzino non fa mai fallire la chiusura (esito e chiusura sono nel capitolo 6). Il prezzo di questa scelta è che il registro segue il campo senza chiedere a nessuno: il furgone di un collega può perdere un pezzo e un'assegnazione senza che l'ufficio lo abbia deciso. Il contrappeso è che l'anomalia dice esattamente da dove il pezzo è stato tolto, un pezzo già installato non viene spostato, e il numero delle anomalie «Da vedere» sta accanto alla voce del menu.

Seconda obiezione tipica: «Ho assegnato i contatori ma l'operatore dice che non li ha nel furgone.». In Giacenze si filtra per deposito, scegliendo il furgone di quell'operatore. «Assegnata, da ritirare» vuol dire assegnato e non ancora letto con Carica: il pezzo è dove deve essere, manca il secondo tempo. Poi si controlla se quei codici erano tra le righe rifiutate dell'assegnazione. Un pezzo assegnato e non ritirato, comunque, non risulterà mai mancante nell'inventario del furgone (sezione sulle anomalie).

Il limite di questa sezione riguarda le differenze tra commesse. Su alcune commesse la chiusura muove il magazzino solo per alcuni tipi di intervento, per esempio solo le sostituzioni; e il campo da cui si legge la matricola nuova cambia da commessa a commessa. L'operatore si sceglie dall'elenco, non leggendo un suo codice. I pezzi mossi solo con la versione precedente dell'app non hanno movimenti nel nuovo registro, e la loro Storia del pezzo è vuota (sezione sulle anomalie).

> **Per gli sviluppatori:** `MagazzinoChiusura` si aggancia in due punti: in v3 dopo il commit di `EsitoWriter` (`InterventiEsitoController`), in 1.x in `AndroidController::put_intervento` dopo `afterPutFromAndroid`. Non agisce sulle commesse senza flag o senza la migrazione 0032 e non fa mai fallire la chiusura: gli errori vanno nel log. Chiave contro il doppio conteggio: `(intervento_id, matricola, tipo_movimento = installazione)`. La lista dei tipi è `tipi_intervento`.

## Il Magazziniere: il banco con il lettore e il telefono

*Per gli amministratori che assegnano il profilo e per chi lavora al banco del magazzino.*

Al banco le scatole arrivano una dopo l'altra, e dieci scatole sono già 50 contatori. Se ogni lettura chiedesse un clic, il banco andrebbe al ritmo del mouse. Per questo esiste un profilo apposta, e un modo di lavorare in cui, scelto l'operatore, bastano il lettore e il tasto Invio dalla prima lettura alla conferma.

Il profilo si chiama **Magazziniere** ed è comune a tutte le commesse con il nuovo magazzino. Nel modulo di invito ha la descrizione «Solo la sezione Magazzino: carica, assegna agli operatori e fa rientrare i pezzi (tenant con il magazzino v3).», dove «tenant» vuol dire commessa. Ha i permessi «Vedere il magazzino» e «Gestire il magazzino», e nient'altro. Dopo l'accesso atterra su Magazzino › Giacenze; il menu in alto mostra solo Magazzino, qualunque cosa dicano la configurazione della commessa e il menu personalizzato; ogni altro indirizzo riporta al Magazzino. I pulsanti sono «Assegna a operatore…», «Rientro in centrale…», «Carica in centrale…», «Storia del pezzo» ed «Excel». Manca «Importa da Excel»: le importazioni di file restano a chi apre File › Importazione. Il Magazziniere non ha neppure Gea, che è chiusa ai profili di questo livello.

Il profilo lo assegna chi amministra gli utenti della commessa, in Admin › Utenti, quando crea o invita un utente o ne cambia l'accesso. Il dettaglio da ricordare: il profilo compare tra le scelte solo se la commessa **in cui si è entrati** ha il nuovo magazzino. L'elenco segue la commessa corrente, non quella di destinazione, quindi si entra prima nella commessa giusta e poi si invita. Il resto è nel capitolo 11.

### Al banco con il lettore

Il lettore deve funzionare «come una tastiera»: modalità USB HID, con un Invio dopo ogni lettura. La procedura è la stessa in carico, assegnazione e rientro.

1. Aprite il dialogo; in assegnazione e rientro scegliete prima l'operatore.
2. Il campo del codice è pronto e resta selezionato: ci torna da solo, tranne quando si usa il menu a tendina o un pulsante.
3. Leggete una scatola dopo l'altra. Il lettore scrive il codice e preme Invio da sé, e ogni lettura si aggiunge all'elenco. La riga di conteggio mostra quanti codici sono stati letti e l'ultimo («N codici letti · ultimo <codice>»). Una lettura doppia non si ripete: compare «<codice> era già letto».
4. Premete Invio a campo vuoto, o il pulsante blu, per il riepilogo, per esempio «Assegni 50 codici a <operatore>.».
5. Un secondo Invio conferma.

Le letture fatte mentre la conferma è in corso non si perdono: il dialogo resta aperto con «N codici letti durante l'invio: ancora da confermare.», e serve un altro doppio Invio.

### Dal telefono

Questa parte va letta con la sua data. Al 25 novembre 2026 le schermate dell'app per il Magazziniere non sono rilasciate; il lato server è pronto e provato con test automatici, e quello che segue è ciò che il server fa quando l'app glielo chiede. Un telefono è di un Magazziniere quando il suo operatore è collegato a un utente della stessa commessa che ha «Gestire il magazzino». Lo decide GOPlanner, non l'app. Le operazioni sono le stesse tre del banco, con il QR letto dalla fotocamera, e producono gli stessi movimenti e, dove la commessa li ha, gli stessi DDT. La risoluzione del QR funziona solo con la rete. Oltre 500 contatori servono più invii, ciascuno con il suo DDT; un invio ripetuto non registra niente due volte e non crea un secondo DDT. In Movimenti compare il nome dell'utente collegato al telefono. Secondo la wiki di assistenza, il collegamento tra operatore e utente si controlla in Admin › Operatori.

L'obiezione che arriva dal banco: «Il magazziniere dice che non vede le utenze e gli interventi: è un guasto?». No. Il profilo legge solo giacenze, movimenti, anomalie, le proprie esportazioni Excel e i propri ticket; tutto il resto risponde «non permesso» per costruzione. È il principio del privilegio minimo.

Il limite. Su una commessa senza il nuovo magazzino il Magazziniere vede soltanto «Il magazzino di questa commessa non è attivo per il Magazziniere.», non la vecchia pagina: è il comportamento previsto, non un guasto. Il banco è stato provato il 22 novembre 2026 nel browser, simulando 50 letture da tastiera con dati inventati; un lettore fisico non è stato provato. Se l'operatore non è collegato a nessun utente, il suo telefono resta il telefono di un operatore.

> **Per gli sviluppatori:** `lib/Magazziniere.php` (`TIPO = 7`, `paginaAmmessa()`, `azioneAmmessa()`, `MAGAZZINO_NON_ATTIVO`) e il profilo `magazziniere` in `lib/ProfiliPiattaforma.php`. Le rotte dell'app sono in `docs/mobile-v3/magazziniere.md` (capitolo 15).

## Sostituzioni con i DDT: materiali a quantità, contatori smontati e uscita al committente

*Solo per le commesse che hanno i DDT accesi; oggi una, dal 23 novembre 2026.*

In una sostituzione entra un contatore nuovo, ne esce uno vecchio e si consumano basette e accessori. Su una commessa che lavora con i documenti di trasporto (DDT) ognuna di queste cose lascia una riga nel registro, e una, l'uscita al committente, non si annulla più.

### Che cosa scrive la chiusura di una sostituzione

Dove la commessa lo ha configurato, la chiusura scrive, oltre all'installazione, altri due movimenti, ciascuno indipendente dagli altri. Il contatore tolto, cioè la matricola registrata sull'utenza, entra nel furgone dell'operatore come «Smontato», con il movimento «Contatore smontato» e origine «Chiusura intervento», una volta sola. Non è mai scorta e non è mai un pezzo da installare. Le basette e gli accessori usati escono dal furgone con «Consumo (chiusura)», una volta per intervento: una chiusura ripetuta non scarica niente, anche se i campi sono cambiati. Se il furgone non ne aveva abbastanza, lo scarico avviene lo stesso, il saldo va sotto zero e nasce l'anomalia «Scarico oltre il saldo del furgone», con un dettaglio del tipo «nel furgone N, scaricati M». Un codice che non è nel catalogo produce l'anomalia «Articolo non in catalogo» e nessun movimento. Niente di tutto questo blocca la chiusura. Il saldo negativo è visibile, non nascosto.

### Materiali senza codice: la vista Articoli

La vista Articoli raccoglie, come dice il suo riquadro, gli «Articoli senza matricola (basette, coperchi, kit, serrature…): si caricano, si affidano e rientrano a quantità.» Le colonne mostrano il saldo In centrale, Sui furgoni e Nel deposito scelto. I pulsanti sono:

- «Nuovo articolo…» e «Modifica…»
- «Carica in centrale…»
- «Affida a operatore…»
- «Rientro in centrale…»
- «Importa catalogo…»

Un affido o un rientro oltre il saldo viene rifiutato con «Quantità non disponibile.». In Movimenti questi materiali compaiono come «codice × quantità» (per esempio, inventato sulla base della documentazione, `TAA2 × 2`).

### I tre tipi di DDT

| Tipo | Movimento | Da → A | Destinatario |
|---|---|---|---|
| Affido | «Assegnazione» | centrale → furgone | l'operatore |
| Reso | «Rientro in centrale» | furgone → centrale | il magazzino centrale (contatori smontati e materiale non usato) |
| Uscita | «Uscita al committente» | centrale → fuori | il committente; il pezzo risulta «Restituito al committente» o «Smaltito» |

Il DDT non ha movimenti suoi: guida quelli consueti, e in Movimenti l'origine porta « · DDT <numero>».

### Creare e firmare un DDT

1. Aprite Magazzino › DDT.
2. Premete «Nuovo affido…», «Nuovo reso…» o «Nuova uscita…».
3. Scegliete l'operatore o la destinazione; per l'uscita il campo «Destinazione dei pezzi».
4. Nel campo «Codici» incollate l'elenco o usate il lettore, un codice per riga, al massimo 500 per DDT.
5. Aggiungete, se serve, le «Note (facoltative, stampate sul DDT)».
6. Premete «Crea DDT». Il DDT nasce confermato e numerato e si apre per la stampa; i codici rifiutati restano con il motivo.

Anche «Assegna a operatore…» e «Rientro in centrale…» di Giacenze creano il DDT da sé, su queste commesse, e il dialogo resta aperto con il collegamento «Stampa il DDT n. <numero>», uno per blocco inviato. Per la firma dal back office si stampa, poi si allega la scansione firmata con «Allega scansione firmata…» (PDF, JPEG o PNG, al massimo 8 MB) oppure si usa «Segna come firmato». Si firma solo un DDT confermato. Dall'app, quando le schermate saranno rilasciate, ciascuno firma la propria parte con il dito, oppure conferma con un clic e nel PDF compare «Confermato da <nome> il <data>». Una firma data non cambia più. La ristampa è identica, perché mittente, destinatario e causale vengono copiati sul DDT al momento della creazione.

La vita di un DDT ha tre stati:

- «Bozza»: righe, nessun movimento, nessun numero.
- «Confermato»: movimenti fatti, numero nella forma «n/anno», progressivo per anno.
- «Annullato»: il numero resta usato e **i movimenti restano registrati**; la merce si rimette a posto con il movimento inverso e un suo DDT.

«Annulla DDT…» lo dice in chiaro prima di procedere: «Perché annulli il DDT n. …? Il numero resta usato e i movimenti già fatti restano registrati.», chiede un motivo obbligatorio e poi una conferma in rosso. Se invece, alla creazione, nessun codice riesce, il DDT non nasce e il numero non viene consumato: «Nessun codice è stato movimentato: il DDT non è stato creato.».

### Smontati e uscita al committente

La vista Smontati elenca i «Contatori smontati alla chiusura delle sostituzioni e non ancora consegnati al committente.», per deposito, con le colonne Smontato il e Giorni. I conteggi valgono per tutti; l'elenco si ferma ai 5000 più vecchi. Il pulsante «Consegna al committente…» apre il DDT di uscita con i pezzi selezionati che sono in centrale; scegliendo un furgone, «Reso in centrale con DDT…» li riporta prima in centrale. Escono solo i contatori smontati: per gli altri il motivo è «Non è un contatore smontato: al committente escono solo gli smontati.». Un pezzo ancora in un furgone non esce: «È ancora in un furgone: fallo prima rientrare con un DDT di reso.». La catena completa è quindi sostituzione chiusa, «Smontato» nel furgone, reso in centrale, uscita al committente, e il pezzo lascia Giacenze per sempre.

Il limite di tutta la sezione è la sua portata. DDT, Smontati e Articoli esistono solo dove la commessa li ha accesi, con la configurazione e l'aggiornamento del database; altrove Assegna e Rientro funzionano senza DDT. La causale dell'affido per gli operatori esterni è ancora da confermare (GOP-862). La firma a schermo si fa solo dall'app, non dal back office.

> **Per gli sviluppatori:** `lib/MobileV3/Domain/MagazzinoDdt.php` guida i movimenti consueti, ciascuno con `magazzino_movimenti.ddt_id`; migrazione `0042_magazzino_ddt.sql`; accensione con `$custom['ddt']['attivo']`, non con `$custom['magazzino']`, che su molte commesse è un booleano. PDF in `lib/MagazzinoDdtPdf.php`. Alla chiusura: `MagazzinoLedger::smontaggioDaChiusura` e `MagazzinoArticoli::consumaDaChiusura`, in una transazione, una volta per intervento.

Un'uscita confermata non ha «Annulla DDT…»: i pezzi sono già dal committente, e l'uscita non torna indietro. Una bozza di uscita si potrebbe ancora annullare, ma «Crea DDT» crea e conferma nello stesso gesto. L'elenco dei codici si controlla prima di premerlo, perché dopo non c'è più un passo intermedio.

## Quando il magazzino non torna: Anomalie, inventario del furgone e Storia del pezzo

*Per il back office.*

Il registro ha ragione finché il campo non dice altro. Quando succede, la tentazione è credere che GOPlanner sistemi da solo. Non lo fa. In questo capitolo «anomalia» vuol dire solo una riga di Magazzino › Anomalie: non gli errori dell'app, non le anomalie di geocodifica, non le anomalie di un intervento.

### Trovare un pezzo

1. In Giacenze, scrivete nel campo «Cerca» un codice, il codice di una scatola o di una pedana, o un'utenza. Più codici si separano con spazi, virgole o punti e virgola. Con lo Stato «Qualsiasi, anche installati» la ricerca include i pezzi installati.
2. Cliccate sul Codice per aprire la Storia del pezzo. La scheda è intestata con il codice e il suo stato, con modello, calibro, lotto, scatola, pedana, deposito e intervento; poi le sezioni «Al suo posto» (per un contatore installato, quello smontato dallo stesso intervento, e viceversa), «Intervento e utenza», «Storia», con ogni movimento, la sua origine e il DDT o il nome del file, e «Anomalie».
3. In alternativa, la ricerca della Storia del pezzo, nel campo «Codice, scatola, pedana o utenza», accetta anche il codice, il nome o l'indirizzo di un'utenza. Un solo risultato apre la scheda direttamente.

Cliccando sul Modello si vede quanti pezzi di quel modello sono in centrale, da ritirare, nei furgoni, smontati, installati e consegnati al committente. Dove la commessa lo ha, oggi una, il pulsante «Storia nel magazzino» nella scheda dell'intervento apre i pezzi installati o tolti da quell'intervento (vedi il capitolo 6). Un'avvertenza sul Filtro Avanzato: se nessuna condizione è valida la griglia resta **vuota**, mai l'intera tabella.

### Leggere le anomalie

La pagina Anomalie ha un riquadro che dice la regola: «Le anomalie non bloccano il lavoro: l'app e la chiusura degli interventi proseguono, l'ufficio le vede qui e le segna come viste.». Le colonne sono Rilevata il, Anomalia, Codice, Operatore, Intervento, Dettaglio e Stato; i filtri sono lo Stato («Da vedere», «Viste», «Tutte», partendo da «Da vedere») e il tipo di Anomalia.

| Anomalia come appare | Che cosa è successo | Che cosa fa l'ufficio |
|---|---|---|
| «Entrata non prevista» | l'operatore ha letto con Carica un codice mai caricato | verifica la provenienza; il pezzo ora è nel suo furgone, con l'etichetta «Non prevista» in Giacenze |
| «Installazione forzata» | la chiusura ha installato un pezzo che non era nel furgone dell'operatore | legge il Dettaglio e controlla il furgone del collega |
| «Scarico oltre il saldo del furgone» | la chiusura ha consumato più materiale di quanto il furgone ne avesse | registra l'affido mancante |
| «Articolo non in catalogo» | la chiusura ha usato un codice che il catalogo non conosce | controlla il catalogo |
| «Inventario: pezzo mancante dal furgone» | atteso nel furgone, non trovato | cerca il pezzo |
| «Inventario: pezzo non previsto nel furgone» | trovato nel furgone, ma il registro lo ha altrove | registra il movimento che corrisponde alla realtà |
| «Inventario: quantità diversa dal saldo» | la quantità contata non è quella del saldo («risultano N, contati M») | verifica e registra il movimento |

Non è un'anomalia il pezzo già in centrale, non assegnato, che l'operatore prende con Carica: è un ritiro normale.

### L'inventario del furgone

Anche questa parte ha una data: al 25 novembre 2026 le schermate dell'app per l'inventario non sono rilasciate; il server è pronto. L'operatore controlla il proprio furgone, e il Magazziniere può farlo per qualunque furgone. L'app mostra che cosa dovrebbe esserci, compresi i contatori smontati e gli articoli a quantità, e l'operatore conferma, scansiona o segna «non trovato». Le differenze diventano le tre anomalie «Inventario: …». All'operatore, per un pezzo che non risulta suo, l'app dice solo «Non risulta nel tuo furgone.»; dove sia davvero il pezzo lo vede l'ufficio, nell'anomalia. Un pezzo «Assegnata, da ritirare» non è mai mancante. Lo stesso pezzo segnalato due volte prima che l'ufficio lo veda resta una riga sola.

La catena va detta tutta, perché è il punto in cui l'ufficio sbaglia. Un'anomalia arriva. «Segna come vista» la sposta in «Viste» con chi e quando, e non cancella niente. La giacenza è ancora quella di prima. Solo l'ufficio, registrando il movimento che corrisponde alla realtà, un carico, un'assegnazione, un rientro, rimette il registro in linea. L'inventario non scrive movimenti né cambia giacenze, e in questa versione l'ufficio non ha una «rettifica».

Da qui due obiezioni. La prima: «Ho segnato l'anomalia come vista: ora il pezzo è a posto?». No: dice solo che qualcuno l'ha guardata. Il posto cambia con un movimento; altrimenti la prossima assegnazione di quel codice viene rifiutata, o il pezzo resta «perso» nel registro mentre sta in un furgone. La seconda: «L'inventario dice che un pezzo manca: lo tolgo dalle giacenze?». In questa versione non c'è un pulsante per toglierlo. Si cerca dove è: Storia del pezzo, l'operatore, il furgone del collega, e si registra il movimento. Un pezzo davvero perso è una domanda per lo staff tecnico. Che l'inventario non corregga è una protezione, non una mancanza: nessuna correzione silenziosa del registro, e ogni differenza resta con chi e quando.

Il limite. Un pezzo mosso solo con la versione precedente ha una Storia del pezzo che mostra dove si trova oggi ma con la storia vuota, e la pagina lo dice: «Nessun movimento nel registro: il pezzo è stato mosso solo dalla versione precedente del magazzino.». Le anomalie non bloccano mai il campo, quindi un numero alto di «Da vedere» è lavoro per l'ufficio, non un guasto. L'inventario non si lancia «su richiesta» del Magazziniere sul telefono di un operatore: l'operatore lo fa sul proprio furgone. Gea risponde su carico, importazione e differenze dell'inventario (vedi il capitolo 10). Quando qualcosa si è fermato a monte, la diagnosi è nel capitolo 12.

> **Quando chiedere allo staff tecnico:**
> - pezzi caricati per errore: un carico non si annulla;
> - un codice che il magazzino non conosce, fisicamente presente, che non si riesce a caricare;
> - «Parti del QR non riconosciute», o il QR di una scatola nuova mostrato come un unico codice «Nuovo»;
> - la pagina che dice «Il magazzino non risponde in questo momento. Riprova tra poco.» per più di qualche momento;
> - un DDT di uscita confermato che non doveva essere emesso.

Nel magazzino un codice cambia posto per una ragione sola: qualcuno registra un movimento. Un'anomalia annota una differenza, «Segna come vista» annota chi l'ha letta, e nessuna delle due sposta un pezzo. Se Giacenze dice una cosa e lo scaffale o il furgone un'altra, il rimedio è il movimento che racconta che cosa è successo davvero: un carico, un'assegnazione, un rientro, un'uscita con il suo DDT. Lo staff tecnico serve nei tre casi in cui quel movimento non c'è: un carico fatto per errore, un'uscita già confermata, un QR che il magazzino non riconosce.

## Fonti

- codice: `lib/MagazzinoGriglie.php`
- codice: `lib/MenuMagazzino.php`
- codice: `lib/MagazzinoPagina.php`
- codice: `pages/magazzino.php`
- codice: `lib/CatalogoPermessi.php`
- codice: `lib/ProfiliPiattaforma.php`
- codice: `lib/Magazziniere.php`
- codice: `lib/ChatbotAuth.php`
- codice: `js/code/magazzino.js`
- codice: `js/code/magazzino_storia.js`
- codice: `js/code/magazzino_ddt.js`
- codice: `js/code/magazzino_articoli.js`
- codice: `js/code/importazione.js`
- codice: `Smarty_templates/it/magazzino_base.html`
- codice: `Smarty_templates/it/magazzino_ddt.html`
- codice: `Smarty_templates/it/importazione.html`
- codice: `lib/ImportazioneMagazzino.php`
- codice: `lib/ImportazioneController.php`
- codice: `lib/MobileV3/Domain/MagazzinoGestione.php`
- codice: `lib/MobileV3/Domain/MagazzinoChiusura.php`
- codice: `lib/MobileV3/Domain/MagazzinoDdt.php`
- docs: `docs/mobile-v3/magazzino.md`
- docs: `docs/mobile-v3/magazziniere.md`
- docs: `docs/02-patterns/50-sezione-magazzino-back-office.md`
- wiki: `wiki/assistenza-clienti/importare-articoli-magazzino.md`
- wiki: `wiki/assistenza-clienti/magazzino-qr-e-storia-del-pezzo.md`
- wiki: `wiki/assistenza-clienti/magazziniere-postazione-lettore.md`
- wiki: `wiki/assistenza-clienti/magazziniere-app.md`
- Portolano: `wiki-assistenza-clienti-pagina-magazzino-movimenti`
- Portolano: `codex-ddt`
- Jira: GOP-767 — sezione Magazzino del back office
- Jira: GOP-852 — magazzino v3 sulla commessa di sostituzioni
- Jira: GOP-853 — carico e affido da QR scatola/pedana
- Jira: GOP-855 — tipo utente Magazziniere e postazione con lettore
- Jira: GOP-856 — app, profilo Magazziniere
- Jira: GOP-857 — DDT di affido e di reso
- Jira: GOP-858 — smontato nel furgone e basette alla chiusura
- Jira: GOP-859 — rientro smontati e uscita al committente
- Jira: GOP-860 — storia per codice e ricerca
- Jira: GOP-861 — inventario del furgone dall'app
- Jira: GOP-862 — questioni aperte

<!-- WORD COUNT: ~6650 -->
<!-- PERSONA CHECK: Pass — exact labels, numbers with dates and sources, one invented case declared as such, conditional sentences for app screens not yet released; no authorial «noi», no marketing adjectives. -->
<!-- NUF CHECK: ✅ stati e viste (§1) · ✅ Carica in centrale e Importa da Excel con resoconto e motivi (§2; il resoconto usa «Non valide», non «Non caricate», come nel dossier) · ✅ Assegna/ritiro/Rientro e righe rifiutate (§3) · ✅ cosa scrive la chiusura, mai bloccata (§3, §5) · ✅ profilo Magazziniere e banco con lettore (§4) · ✅ DDT affido/reso/uscita, ciclo di vita, firma, uscita non annullabile (§5) · ✅ trovare un pezzo e leggere un'anomalia (§6) · ✅ sicurezza emotiva: codice una volta sola, anomalie non bloccano, «Segna come vista» e inventario non cambiano giacenze · ✅ quando chiedere allo staff tecnico (riquadro §6 + limiti §1, §2) · ✅ numeri con fonte (20 caratteri, 0–100000, 5 per scatola, 5000/500, 100 righe, 10–200, 8 MB, n/anno, permessi) -->
<!-- ANTI-AI CHECK: no banned patterns; «cliente» and «tenant» appear only inside quoted UI strings, now glossed as «commessa»; «clienti» in the objection replaced with «utenze»; added a ### subheading in §1 to break the six-paragraph prose run; five counter-objections present; the closing is a desk rule and does not announce chapter 10. -->
