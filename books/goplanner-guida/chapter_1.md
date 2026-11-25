# 1. Che cos'è GOPlanner

*In questo capitolo si vede quale lavoro organizza GOPlanner, chi lo fa e dove, e come il file di un committente diventa, sei passi dopo, l'esportazione che torna allo stesso committente. Bastano dieci parole e sei passi. Il capitolo è per tutti: i riquadri per gli sviluppatori si possono saltare.*

## Il lavoro che GOPlanner organizza

In ufficio, nella pagina «Clienti», la colonna «Stato» di un'utenza dice «assegnato». L'operatore però è passato: ha registrato l'esito con l'app e conferma che il lavoro è fatto. La domanda che segue è una sola: il lavoro è andato perso? Se la risposta non è scritta da nessuna parte, la si chiede a chi c'era la volta prima, oppure si apre un ticket di sincronizzazione, oppure, peggio, si ripianifica una visita già fatta. Il comportamento ha invece una regola precisa, e in certe commesse è quello previsto. Per leggerla servono due parole che non sono sinonimi, esito e stato. La sezione *Intervento, esito e stato* le distingue e risponde alla domanda.

Il glossario del progetto apre con una frase che vale come definizione: «GOPlanner organizza il lavoro sul campo: liste di utenze da visitare, interventi pianificati per gli operatori, esiti e foto che tornano al committente.» Ogni pezzo di quella frase è un oggetto con un nome. Il committente è l'azienda che affida il lavoro, per esempio il gestore dell'acqua o del gas: manda le liste e riceve le esportazioni. Le utenze sono i punti in cui si va a lavorare. Gli interventi sono i lavori assegnati a un operatore per un giorno. Gli esiti e le foto sono ciò che l'operatore riporta. Il lavoro si svolge in due posti. In ufficio si usa il gestionale, l'applicazione web; sul campo l'operatore usa l'app sul telefono, che nel prodotto si chiama GOPlanner 3.

Che lavoro, in concreto? Dipende dalla commessa, e nessun tipo di lavoro vale per tutte. Ci sono le letture dei contatori: sei commesse hanno un'esportazione delle letture costruita apposta per il proprio committente. C'è la sostituzione dei contatori, che si appoggia al magazzino: i contatori nuovi si caricano nel deposito centrale, e alla chiusura di una sostituzione il contatore smontato entra nel furgone (capitolo 9). C'è il cassettinaggio, cioè il recapito degli avvisi nelle cassette, con un pulsante «Chiudi cassettinaggio» in Interventi › Lista che esiste per una sola commessa. Ci sono gli allacci, con le voci «Pianificazione allacci» e «Pianificazione letture» riservate a una commessa. E c'è il censimento dei contatori, con importazione ed esportazione dedicate in poche commesse. La sequenza dei passi che questo capitolo descrive è la stessa per tutti. Cambiano il contenuto della lista, i dati che l'operatore raccoglie e, in alcune commesse, gli strumenti di un singolo passo.

Che cosa questo capitolo non è. Non è il manuale passo per passo dell'app per l'operatore: il lato telefono si vede dall'ufficio nel capitolo 8. Non è nemmeno la documentazione delle personalizzazioni di ogni commessa. Quelle stanno nelle note tecniche della commessa, che consulta lo staff tecnico, e prevalgono sulle regole comuni; il capitolo 2 spiega come. Per questo, ogni volta che una funzione esiste solo in alcune commesse, la guida lo dice con le parole «in alcune commesse», senza nomi. Quello che segue vale per il ciclo comune. Quello che una singola commessa aggiunge o cambia si chiede allo staff tecnico.

Il metodo del capitolo sta in tre righe. Dieci parole per nominare gli oggetti: utente, operatore, committente, commessa, utenza, lista, pratica, intervento, esito, stato. Sei passi per collocarli nel ciclo: importazione, pianificazione, app, esito, verifica, esportazione. Per ogni passo, una pagina dove resta la traccia. Le altre parole delle tabelle che seguono servono a non confondere queste dieci. Con queste tre cose la domanda «perché non torna?» smette di essere una domanda da rivolgere a chi c'era e diventa un controllo da fare.

## Chi lavora in GOPlanner, e dove

Nel glossario di GOPlanner ogni persona ha una parola sola, e quella parola dice anche dove lavora. L'utente è «una persona che entra nel gestionale con il proprio accesso, di solito in ufficio»; gli utenti del gestionale sono i supervisori degli operatori. L'amministratore è un utente che può vedere e cambiare tutto nella propria azienda, compresi gli altri utenti. Il collega è un altro utente della stessa azienda. L'operatore lavora sul campo con l'app sul telefono ed esegue gli interventi. Lo staff tecnico sono le persone di GOPlanner che seguono l'assistenza e possono fare ciò che l'utente non può fare da solo. Gea è l'assistente virtuale di GOPlanner, nel pannello in basso a sinistra del gestionale. Fuori dal sistema c'è il committente: non entra nel gestionale, ma il ciclo comincia e finisce con lui.

La tabella mette in fila le persone, il posto dove lavorano, il loro ruolo nel ciclo e le parole che il glossario chiede di non usare.

| Chi | Dove lavora | Che cosa fa nel ciclo | Parole da non usare |
|---|---|---|---|
| Utente | Gestionale, di solito in ufficio | Importa, pianifica, verifica, esporta | utenza, account, login, user |
| Amministratore | Gestionale | Come l'utente, più gli altri utenti della propria azienda | admin, superuser |
| Collega | Gestionale | Un altro utente della stessa azienda | altro account |
| Operatore | App GOPlanner 3, sul campo | Esegue gli interventi e registra l'esito | utente, tecnico, risorsa |
| Staff tecnico | Assistenza GOPlanner | Fa ciò che l'utente non può fare da solo | sviluppatori, sistemisti, supporto di secondo livello |
| Gea | Pannello in basso a sinistra del gestionale | Risponde, legge, prepara proposte | chatbot, bot, intelligenza artificiale, modello |
| Committente | Fuori dal sistema | Manda le liste, riceve le esportazioni | cliente, ente, stazione appaltante |

Gea si presenta da sola. Al primo accesso si apre l'annuncio «Ti presentiamo Gea» nella campanella, in alto a destra; dopo «Ho capito» l'annuncio risulta letto e resta nella campanella, da rileggere. Il pannello in cui si parla con Gea sta invece nell'angolo opposto, in basso a sinistra.

Ufficio e campo si incontrano anche senza che l'ufficio tocchi il telefono. Un esempio preciso sono i comandi remoti: un messaggio all'operatore, la richiesta di riscaricare gli interventi, l'invito ad aggiornare l'app, mandati ai telefoni dall'ufficio. Nelle commesse che hanno i comandi remoti attivi, un comando non parte subito: resta in attesa finché un amministratore della propria azienda non lo approva. Il posto è Impostazioni › Dispositivi mobili, sezione «Telefoni GOPlanner 3». Ogni comando in attesa ha la colonna «Valido fino» e due pulsanti: «Approva e invia» lo manda ai telefoni elencati, «Rifiuta» lo scarta. La richiesta vale 60 minuti; scaduta, non si approva più e va rifatta. Che cosa succede sul telefono, e come si abbina un telefono, è materia del capitolo 8.

Un dubbio: «L'operatore non è anche lui un utente?» Nel glossario no, ed è proprio la prima parola da non usare per l'operatore. C'è però un'eccezione. Un operatore può essere collegato a un utente della commessa, e allora il telefono si comporta secondo il profilo di quell'utente: «Il telefono è quello di un Magazziniere quando l'operatore è collegato a un utente della commessa con il profilo Magazziniere»; se l'operatore non è collegato a nessun utente, l'app resta quella dell'operatore. Il collegamento si controlla in Admin › Operatori, che è una pagina dello staff tecnico. La parola resta operatore; il collegamento è un dettaglio di configurazione, trattato con i permessi nel capitolo 11.

Questo capitolo non spiega profili, ruoli e lotti di competenza: sono nel capitolo 11. Basta sapere che ciò che una persona vede dipende dalla commessa e dai permessi. Le voci di un menu compaiono o no secondo la commessa e i permessi dell'utente, e nella pagina «Clienti» colonne, campi di ricerca, pulsanti e filtri cambiano da commessa a commessa. Il profilo «Magazziniere» è il caso più netto. Chi lo ha vede solo il Magazzino, con i permessi «Vedere il magazzino» e «Gestire il magazzino» e nient'altro: nel menu in alto c'è solo Magazzino, più le notifiche e Esci. All'estremo opposto c'è il menu Admin, riservato allo staff tecnico: gli utenti delle commesse non lo vedono. Se due colleghi descrivono menu diversi, prima di pensare a un errore conviene pensare ai permessi.

La regola da tenere: in GOPlanner «utente» indica una persona nel gestionale. La persona per strada, con il telefono in mano, è l'operatore.

## Le parole del lavoro: dal committente alla pratica

In ufficio «cliente» può voler dire il committente oppure l'utenza da visitare. Il menu del gestionale si chiama «Clienti» ed elenca le utenze. Il codice, a sua volta, tiene le utenze nella tabella `utenti`, che non ha niente a che fare con gli utenti del gestionale. Ufficio, menu e codice usano parole che si somigliano per oggetti diversi. La documentazione tecnica lo ammette apertamente: «I nomi delle tabelle non coincidono con quelli dell'interfaccia». Una parola sbagliata in un ticket manda chi lo legge a cercare sull'oggetto sbagliato. Il glossario esiste per questo: fissa una parola per ogni cosa, e lo usano gli sviluppatori e Gea, che lo riceve nelle sue istruzioni.

Ecco le parole del lavoro, con il posto dove si vedono nel gestionale.

| Parola | Che cos'è | Dove la vedi | Da non confondere con |
|---|---|---|---|
| Committente | L'azienda che affida il lavoro; manda le liste, riceve le esportazioni | Fuori dal gestionale | cliente, ente, stazione appaltante |
| Commessa | Il lavoro svolto per un committente, con i suoi dati e le sue regole in GOPlanner | Il gestionale in cui si entra; vedi il capitolo 2 | tenant, database, istanza, ambiente |
| Utenza | Il punto in cui si va a lavorare: un indirizzo, il suo contatore, il nominativo dell'intestatario | Menu «Clienti» | utente, cliente finale, record, anagrafica |
| Lista | Un gruppo di utenze arrivato con un'importazione o creato a mano; ha un nome, un lotto e una scadenza | Interventi › «Carichi»; filtro «Lista» in «Clienti», tendina in Pianificazione | carico, batch, elenco, file |
| Pratica | Un'utenza dentro una lista; la stessa utenza può stare in più liste | Righe della lista | riga, record |
| Importazione | Il caricamento di un file del committente che crea o aggiorna una lista | File › Importazione | import, upload, caricamento dati |
| Scarto | Una riga del file che l'importazione non ha preso, con il suo motivo | Resoconto dell'importazione | errore, riga rifiutata, riga persa |
| Esportazione | Il file con i dati degli interventi da mandare al committente | File › Esportazione | export, scarico, tracciato |
| Lotto | La parte di commessa o di contratto a cui appartiene una lista | Sulla lista; vedi il capitolo 3 | lista, blocco |
| Distretto | Una zona del committente (un comune, un'area) indicata sulla lista | Sulla lista; vedi il capitolo 3 | comune, zona settimanale |
| Campo personalizzato | Un dato in più che una commessa raccoglie, per esempio una seconda lettura | Schede e app, dove la commessa li usa; vedi il capitolo 3 | campo custom, flexifield, colonna |
| Intervento | Un lavoro da fare in un'utenza, assegnato a un operatore per un giorno | Interventi › «Lista»; vedi la sezione seguente | attività, task, ordine di lavoro, appuntamento |
| Esito | Il risultato che l'operatore registra con l'app: eseguito, oppure non eseguito con il motivo | Rapporti › Verifica interventi | stato, risultato, chiusura |
| Stato | Il punto in cui si trova un'utenza o un intervento nel lavoro | Colonna e filtro «Stato» in «Clienti» | esito, fase |

La riga della lista merita una nota. Nel gestionale non c'è una voce di primo livello «Lista». «Lista» è la prima voce dei menu a sinistra: in Interventi apre l'elenco degli interventi, in «Clienti» l'elenco delle utenze. Le liste vere stanno in Interventi › «Carichi», e si scelgono con il filtro «Lista» in «Clienti» o con la tendina della Pianificazione. «Carichi» è un'etichetta dell'interfaccia; la parola della guida resta lista.

Un esempio, con dati inventati. Il committente manda il file delle letture di marzo per la zona nord; l'importazione crea la lista *Letture marzo — zona nord*, nel lotto *Lotto 2*. Una delle utenze del file era già in una lista di gennaio. Dopo l'importazione esiste una sola utenza, con il suo indirizzo e il suo contatore, ma due pratiche: una nella lista di gennaio e una nella lista di marzo. Chi chiede «quante utenze ho?» e chi chiede «quante pratiche ho?» ottengono due numeri diversi, ed entrambi sono giusti.

Qui nasce un'obiezione. «Nel menu c'è scritto Clienti: allora le utenze sono i clienti?» No. «Clienti» è l'etichetta del menu, e il glossario lo dice nella definizione stessa di utenza: «Nel menu si trova sotto «Clienti»». La pagina elenca «l'anagrafica delle utenze (i punti di fornitura da lavorare)», una riga per utenza con indirizzo, matricola, stato e coordinate. La guida dice utenza perché «cliente» mescolerebbe due oggetti: il committente, che affida il lavoro, e l'utenza, dove il lavoro si fa. «Clienti» compare nel testo solo tra virgolette, come nome di menu. Attenzione anche a un omonimo: nell'area Admin c'è un gruppo «Clienti» che non è questa pagina.

> **Per gli sviluppatori:** chi lavora in ufficio può saltare questo riquadro. Le parole dell'interfaccia corrispondono così ai nomi del codice. La commessa, che nel codice si chiama tenant, ha un proprio database `goplanner_{db}` (`config.inc.php`: `$DBDATA = 'goplanner_' . $_SESSION['user']['db'];`) e una cartella `custom/{tenant}`; il capitolo 2 ne spiega le regole. L'utenza è la tabella `utenti` (`lib/UtenzaBase.php`, `$table = 'utenti'`), non `utenze`: le query SQL la chiamano `utenze` come alias, e da lì nasce l'equivoco. Gli utenti del gestionale sono invece la tabella `users` nel database master `goplanner` (`lib/User.php`): `utenti` e `users` sono due cose diverse. La lista è `carichi` (nome nella colonna `cliente`, file in `nomefile`; `lib/CaricoBase.php`); la pratica è l'utenza in `utenti` più la sua riga in `carichi_righe` (`lib/CaricoRigaBase.php`); l'intervento è `interventi` (`lib/InterventoBase.php`); l'esecuzione, cioè l'esito registrato, è `interventi_eseguiti` (`lib/InterventoEseguitoBase.php`). Il capitolo 14 approfondisce il modello dei dati.

Una commessa può mostrare etichette proprie o dati in più. Alcune commesse hanno le etichette dei lotti scritte nella propria configurazione (`$custom['lotti']`), in attesa di un'anagrafica dei lotti vera; molte raccolgono campi personalizzati. La parola del glossario resta la stessa anche quando lo schermo di una commessa usa la sua. Questo capitolo non entra nelle regole di lotto e distretto, che sono nel capitolo 3.

La regola: prima si nomina l'oggetto, poi lo si cerca. L'etichetta del menu dice dove l'oggetto sta; la parola del glossario dice che cos'è.

## Intervento, esito e stato

Tre parole sembrano dire la stessa cosa e non la dicono. L'intervento è «un lavoro da fare in un'utenza, assegnato a un operatore per un giorno». L'esito è «il risultato di un intervento che l'operatore registra con l'app: eseguito, oppure non eseguito con il motivo». Lo stato è «il punto in cui si trova un'utenza o un intervento nel lavoro, per esempio da pianificare, assegnato o eseguito». Il glossario mette esito e stato ciascuno nella lista delle parole da evitare dell'altro, e non per pignoleria. L'esito lo scrive l'operatore. Lo stato lo legge l'ufficio.

Gli stati sono dieci, e gli stessi numeri valgono per l'intervento e per l'utenza: i primi due, infatti, descrivono un'utenza che non ha ancora un intervento. Numeri e nomi sono fissati nel codice e nella tabella `stati`; le etichette sono quelle del gestionale.

| Codice | Stato | Che cosa vuol dire |
|---|---|---|
| 1 | Importato | L'utenza è arrivata con l'importazione e non ha ancora un intervento; da fare |
| 2 | Validato | Utenza già nota, senza intervento; da fare |
| 3 | Assegnato | L'intervento ha un operatore e un giorno; da fare |
| 4 | Eseguito | L'operatore ha registrato l'esito «eseguito» |
| 5 | Non fattibile | L'operatore ha registrato che il lavoro non si può fare, con il motivo |
| 6 | Controllato | L'ufficio ha verificato l'esecuzione con «Verificato» |
| 7 | Inviato | Nessuna azione comune lo imposta: vedi il capitolo 6 |
| 8 | Ripianificabile | L'esito dell'operatore dice che va ripianificato |
| 9 | Annullato | L'intervento è annullato |
| 10 | Prenotato | Fissato ma senza un operatore; da fare |

Gli stati «da fare» sono quattro: 1, 2, 3 e 10 (nel codice, `STATI_DA_FARE`). Tre stati hanno una precisazione. Lo stato 7, «inviato», non ha un'azione comune che lo produca: la normale esportazione non lo imposta, e lo scrivono solo un vecchio tipo di importazione usato da alcune commesse e il codice di esportazione di una singola commessa. Lo stato 8 nasce solo dall'esito mandato dal telefono; nessuna azione d'ufficio lo imposta. Lo stato 10 si trova in Interventi › «Da assegnare», la pagina intitolata «Appuntamenti in attesa di assegnazione»; quale azione crei un intervento «prenotato» non è documentato, e la guida non lo indovina. Oltre ai dieci, il codice conosce un valore 99, «Utente assente», fuori dalla tabella `stati`.

Dove sta l'esito? In un'esecuzione: la registrazione di ciò che l'operatore ha fatto su quell'intervento. Con l'esito arrivano le letture, le foto, la firma e la posizione del telefono, e i campi personalizzati dove la commessa li raccoglie. Un «non eseguito» porta il suo motivo: un codice, una segnalazione scelta da un elenco e le note. In GOPlanner 3 i tipi di esito sono cinque, e ciascuno lascia l'intervento in uno stato preciso.

| Esito registrato in GOPlanner 3 | Stato dell'intervento dopo l'esito |
|---|---|
| Eseguito | 4 eseguito |
| Non fattibile | 5 non fattibile |
| Ripianificabile | 8 ripianificabile |
| Rapportino («Da finire» in alcune commesse): salva senza chiudere | 3 assegnato, come prima |
| Utente assente | 99 utente assente |

> **Per gli sviluppatori:** l'esecuzione è una riga di `interventi_eseguiti`. Nel modello dati più vecchio la colonna `esito` vale 1 per «eseguito» e 0 per ogni altro risultato, e con `esito = 1` la lettura e, se serve, la nuova matricola devono essere presenti; il risultato vero e proprio sta in `stato_id`. La segnalazione è un codice della tabella `segnalazioni`, al massimo 25 caratteri in GOPlanner 3. La corrispondenza tra esito e stato è in `lib/MobileV3/Domain/EsitoCatalog.php`.

Torna ora la domanda dell'inizio. «L'operatore ha registrato l'esito: perché l'utenza risulta ancora «assegnato»?» Le risposte sono due: una si legge nella tabella qui sopra, l'altra chiede una regola.

La prima: l'operatore ha registrato un rapportino. Il rapportino salva senza chiudere, quindi l'intervento resta in stato 3 e l'utenza lo mostra. L'esito che chiude deve ancora arrivare.

La seconda sta nella regola con cui l'utenza riceve il suo stato. Lo stato dell'utenza non è un riassunto dei suoi interventi: è copiato. Il gestionale scrive sull'utenza lo stato dell'intervento su cui l'ufficio ha appena fatto un'azione, e la documentazione lo dice senza giri: «qualunque azione di back-office su un intervento riscrive lo stato dell'utenza con lo stato di quell'intervento». Alcune commesse ammettono più interventi aperti sulla stessa utenza: è l'impostazione `interventi_multipli`, una configurazione intenzionale e non un difetto. Lì «Assegna» non annulla gli interventi già assegnati, e «Ripianifica» ne crea uno nuovo lasciando il vecchio. Basta quindi che l'ultimo intervento toccato dall'ufficio sia un altro, ancora assegnato, perché l'utenza mostri «assegnato» anche se un suo intervento è eseguito. In nessuno dei due casi il lavoro è andato perso: le foto e gli esiti restano agganciati all'intervento su cui l'operatore li ha registrati, non all'utenza.

Prima di aprire un ticket di sincronizzazione:

1. Guardate come l'operatore ha registrato l'intervento: se è un rapportino, l'intervento è ancora aperto e lo stato è giusto.
2. Controllate se un altro intervento della stessa utenza risulta già «eseguito». Dove Gea è attiva, questo controllo lo sa fare lei.
3. Se la commessa ammette più interventi aperti e volete che l'utenza mostri «eseguito», chiudete o annullate tutti gli interventi ancora aperti di quella utenza: chiudere solo il più recente non basta.

La regola completa dello stato dell'utenza è nel capitolo 3.

Questa sezione dà i nomi degli stati, non le strade tra uno stato e l'altro. Chi può spostare un intervento, con quale pulsante e da quale stato, è nel capitolo 6; come l'app manda l'esito al gestionale è nel capitolo 8. Anche la tabella degli stati va letta con una cautela: in alcune commesse la tabella `stati` non ha le righe 9 e 10. Per lo stato 7 la tabella del ciclo, nella sezione seguente, non indica un passo, perché un passo comune che lo produca non c'è.

La regola da ricordare: l'esito dice che cosa è successo sul posto; lo stato dice dove si trova il lavoro adesso. Possono non coincidere, e quando non coincidono c'è una regola che lo spiega.

## Il ciclo di una commessa, dal file all'esportazione

Tutto il lavoro di una commessa passa per sei passi, sempre nello stesso ordine: importazione → pianificazione → app → esito → verifica → esportazione. Ogni passo ha un posto nel gestionale o nell'app, qualcuno che lo compie e un oggetto che nasce o cambia.

| Passo | Dove | Chi | Che cosa nasce o cambia | Stato dopo il passo | Capitolo |
|---|---|---|---|---|---|
| 1. Importazione | File › Importazione (oppure «Importazione classica», file al massimo 10 MB) | Utente con il permesso «Importare interventi» | Lista, pratiche, utenze nuove o aggiornate, scarti con il motivo | Utenza: 1 importato o 2 validato; nessun intervento ancora | 4 |
| 2. Pianificazione | Interventi › Pianificazione: «Operatore», «Data», «Assegna» | Utente | Interventi | 3 assegnato | 5 |
| 3. App | GOPlanner 3: il telefono scarica gli interventi del giro | Operatore | Il giro sul telefono | — | 8 |
| 4. Esito | GOPlanner 3: eseguito o non eseguito con il motivo, con foto, firma e posizione | Operatore | Esecuzione in `interventi_eseguiti` | 4 eseguito, 5 non fattibile, 8 ripianificabile | 6, 8 |
| 5. Verifica | Rapporti › Verifica interventi: «Verificato» o «Ripianifica» | Utente | Esecuzione controllata, oppure un intervento nuovo | 6 controllato; il nuovo intervento nasce in 3 | 6 |
| 6. Esportazione | File › Esportazione: modello, formato, periodo; esportazione in coda | Utente | Il file per il committente, conservato 30 giorni | — | 7 |

All'importazione il gestionale accetta file xls, xlsx, ods o csv, uno alla volta, e nulla entra in GOPlanner finché non si preme «Importa». Sopra le 2.000 righe l'importazione va in coda e a fine lavoro arriva una mail; un'importazione si può annullare entro 24 ore. Il limite di 10 MB è verificato nel codice solo per i moduli classici, come «Importazione classica»: per la nuova pagina File › Importazione un limite non è documentato. Dopo l'importazione esiste la lista, ma non ancora un intervento. Il giro è l'insieme degli interventi di un operatore in un giorno, nell'ordine in cui li visita: il telefono lo scarica dal server, e scarica di nuovo solo quando qualcosa è cambiato. Un esito, una ripianificazione, una modifica d'ufficio o un'importazione compaiono alla richiesta successiva del telefono.

Ecco il ciclo percorso da una lista, con dati inventati: *Letture marzo — zona nord*, 120 righe nel file del committente.

1. Aprite File › Importazione e scegliete il file del committente.
2. Scegliete «lista nuova», scrivete il nome *Letture marzo — zona nord* e scegliete il lotto *Lotto 2* (il lotto è obbligatorio se la commessa ha dei lotti).
3. Premete «Importa».
4. Leggete il resoconto: righe importate, nuove e già presenti, scartate con il motivo, coordinate trovate o da geocodificare. Nell'esempio le righe importate sono 119. Una è scartata perché ripete un codice già presente nel file: vale la prima riga, la seconda si scarta. Quattro utenze restano da geocodificare.
5. Aprite Interventi › Pianificazione e scegliete la lista nella tendina.
6. Selezionate le utenze sulla mappa. Le quattro senza coordinate non ci sono: è il caso dell'obiezione qui sotto.
7. Scegliete l'«Operatore» e la «Data», poi premete «Assegna». Senza data compare «Attenzione! Devi inserire la data!».
8. Il giorno stabilito l'operatore trova gli interventi nel giro su GOPlanner 3 e, utenza per utenza, registra l'esito.
9. Aprite Rapporti › Verifica interventi e controllate ogni esecuzione.
10. Premete «Verificato» sulle esecuzioni corrette; per un non fattibile da rifare premete invece «Ripianifica».
11. Aprite File › Esportazione, scegliete la scheda del modello, il formato e il periodo, e avviate l'esportazione.
12. Quando nel pannello «Ultime esportazioni» lo stato è «Completata», premete «Scarica» e mandate il file al committente.

Due passi chiedono una precisazione. «Ripianifica» crea sempre un nuovo intervento per la stessa utenza, in stato «assegnato», con «Operatore» e «Data» obbligatori; dopo «Assegna incarico» compare «È stato creato un nuovo intervento». Il vecchio non si riapre e non cambia stato. Dove la commessa lo prevede, «Cancella precedente» elimina il vecchio. L'esportazione, invece, non produce il file subito. Va in coda, compare un segnalibro nel menu a sinistra, e lo stato passa per «In coda», «In corso», «Completata», oppure «Fallita», «Annullata», «File scaduto». Il file si conserva 30 giorni dalla chiusura dell'esportazione (`GIORNI_CONSERVAZIONE = 30` in `lib/EsportazioneRegistro.php`). Un file scaduto non è un dato perso: gli interventi restano nel gestionale, e «Ripeti» costruisce una nuova esportazione con lo stesso modello e gli stessi filtri. «Ripeti» sposta in avanti il periodo, quindi le date vanno rimesse se si vuole lo stesso periodo di prima.

L'obiezione arriva alla pianificazione. «Ho importato la lista, perché non riesco ad assegnare alcune utenze?» La pagina della Pianificazione lo dice in una riga: «Sulla mappa si vedono solo le utenze che hanno coordinate valide». Un'utenza senza coordinate non è sulla mappa, quindi non si seleziona, quindi non si assegna. È la causa più frequente dopo un'importazione. I rimedi sono due. Il primo, nelle commesse che hanno la voce, è Clienti › Geocodifica, pulsante «Riprova le non trovate»: il sistema rimette «da geocodificare» tutte le utenze che hanno un indirizzo ma nessuna coordinata e fa ripartire il lavoro su tutte, senza guardare la selezione; serve il permesso «Modificare le utenze», e parte un solo lavoro alla volta per commessa. Il secondo è assegnare da «Clienti», che funziona anche senza coordinate: si sceglie la lista, si selezionano le utenze, si indicano «Operatore» e «Data» e si preme «Assegna incarico». Le altre cause da controllare, nell'ordine, sono un'utenza già assegnata (viene saltata, non riassegnata), una lista chiusa e un operatore non valido per il lotto. Il capitolo 5 le tratta una per una.

La sequenza dei passi è la stessa ovunque; gli strumenti di un passo no. Le modalità comuni di pianificazione sono manuale su mappa, per gruppi geografici e da Calendario; alcune commesse ne hanno altre, come il Centralino, la Pianificazione giri o le pianificazioni per zone. La pagina unica di Verifica interventi vale per le commesse che la attivano; le altre hanno una propria scheda di verifica, e in alcune commesse Rapporti apre il Riepilogo interventi perché la Verifica non c'è. Conversione e Analisi, nel menu File, sono strumenti di alcune commesse; il magazzino entra nel ciclo solo dove si usa. E il ciclo può tornare indietro: un non fattibile ripianificato è un intervento nuovo che riparte dal passo 2, e così il lavoro sulla stessa utenza può fare più giri.

La regola: ogni passo consuma ciò che il passo prima ha lasciato. Se un passo sembra vuoto, si guarda il passo precedente.

## Dove guardare quando qualcosa non torna

*Per l'ufficio; il riquadro finale è per gli sviluppatori.*

Ogni passo del ciclo lascia una traccia. L'importazione lascia il suo resoconto e il registro delle importazioni; la pianificazione lascia gli interventi; l'app lascia le esecuzioni con foto e letture; l'esportazione lascia il proprio stato nel pannello «Ultime esportazioni». C'è poi una traccia che attraversa tutti i passi: le attività. Il glossario chiama attività «ciò che un utente o un operatore ha fatto nel gestionale o nell'app, con giorno e ora: per esempio un'importazione, una pianificazione, un'eliminazione», e chiede di non dire «log». Quando un dato non torna, la prima domanda non è «chi ha sbagliato?». È «in quale passo si è fermato?».

Per i dati che partono dal telefono, questa domanda ha una storia, ed è registrata in un ticket. Un committente segnalò che mancavano delle foto. Rispondere costò mezza giornata, incrociando database, registri degli errori dell'app e codice, perché tre casi non si distinguevano: il dato non era mai partito dal dispositivo, si era perso per strada, oppure era arrivato e non era stato salvato. Il tablet coinvolto era fermo da 51 ore, e a scoprirlo non fu il sistema ma la segnalazione arrivata per telefono. Nelle cinque settimane esaminate i registri contavano 22.173 errori su 95 dispositivi: tutti invii ripetuti di file già consegnati, rumore che non diceva niente del tablet fermo. Da quel caso ogni richiesta del telefono lascia due segni, l'ingresso e l'esito, con un identificativo comune. Su quei segni si basa oggi la domanda «dove si è fermato il dato» (capitolo 12).

| Sintomo | Passo | Dove guardare per primo | Capitolo |
|---|---|---|---|
| Righe mancanti dopo l'importazione | Importazione | Il resoconto dell'importazione: scarti con il motivo; oppure chiedere a Gea l'esito delle ultime importazioni | 4 |
| La lista non compare nella tendina del Piano | Pianificazione | La lista: aperta, in un lotto dell'utente, con almeno un'utenza senza intervento; poi le attività del giorno | 5 |
| Utenze che non si riescono ad assegnare | Pianificazione | Le coordinate: Clienti › Geocodifica, «Riprova le non trovate» | 5 |
| Un dato partito dal telefono che in ufficio non c'è | App | Dove si è fermato il dato: mai partito, respinto, arrivato e non salvato | 8, 12 |
| Esportazione vuota, fallita o file scaduto | Esportazione | «Ultime esportazioni»: stato, righe attese e prodotte, scartati, mappatura e filtri | 7 |
| Un errore a schermo | Qualunque | Il codice dell'errore mostrato a schermo | 12 |

Ogni riga ha un dettaglio che fa risparmiare tempo. Con l'«Importazione classica» le righe scartate e i loro motivi non vengono salvati, e le righe «invariate» sono righe già presenti e identiche, non scarti. La tendina del Piano legge una copia salvata valida un'ora: una lista appena cambiata può comparire con ritardo. Il caso tipico del dato mai partito è un tablet fermo da più di 48 ore. Un'esportazione con 0 righe attese vuol dire che i filtri (date, lista, lotto, esito) non selezionano nulla. Un errore a schermo, «Si è verificato un errore imprevisto», porta un codice di 8 caratteri, cifre e lettere da A a F: è il dato da riportare.

Il primo posto dove chiedere è Gea, nelle commesse in cui è attiva: Gea si può spegnere per commessa, e il capitolo 2 spiega da che cosa dipende. Le sue risposte seguono istruzioni d'indagine scritte, i runbook, con i controlli da fare, la soluzione e che cosa fare se non basta: senza un runbook Gea spiega soltanto. Gea legge l'esito delle ultime 10 importazioni, delle ultime 10 liste e delle ultime 10 esportazioni, con i conteggi e i motivi degli scarti. Legge anche le attività dell'utente che le scrive: le proprie fino a 30 giorni, quelle dei colleghi per 7 giorni (30 per un amministratore). Se serve un ticket, Gea prepara il testo, ma il ticket lo apre l'utente, mai Gea: l'utente legge il testo e preme «Apri il ticket». La domanda «Ti impedisce di lavorare?» è obbligatoria, e con «Sì» il ticket arriva subito allo staff come urgente. I ticket si ritrovano nella voce «Ticket» del menu in alto, presente per chi ha un'identità personale (capitolo 11). Il capitolo 10 descrive Gea per intero.

Un'ultima obiezione. «Posso chiedere a Gea di correggere i dati da sola?» No: Gea prepara una proposta, cioè una modifica che mostra prima di farla, e la proposta diventa vera solo quando l'utente preme «Autorizza». Accanto c'è «Annulla», e dopo 10 minuti la proposta scade. Gea non scrive mai sui dati da sola: propone, e decide l'utente. Un esempio è la correzione di una mappatura di importazione, cioè della regola che dice quale colonna del file va in quale campo di GOPlanner (capitolo 4). Serve il permesso «Importare interventi»; un modello di sistema non si tocca mai, e ne nasce una copia della commessa, «NOME (aggiornato)»; «Ripristina» rimette il modello com'era, ma solo se nessuno lo ha cambiato dopo. Alcune operazioni restano comunque fuori da Gea: cancellazioni definitive, utenti e permessi, configurazione della commessa, importazioni e operazioni in blocco.

> **Quando chiedere allo staff tecnico:** quando una pagina del menu File, o una sua voce, resta bianca: è un errore del server che la pagina non mostra, e va segnalato con la voce aperta, l'ora, i codici errore e, per un'importazione o un'esportazione, la mappatura scelta. Quando un'esportazione è «Fallita»: si segnalano il numero dell'esportazione, l'ora e la causa registrata. Quando il dato è arrivato dal telefono ma non è stato salvato, o il server lo respinge più volte. Quando servono le pagine Admin, che sono strumenti dello staff. Quando sono stati eliminati degli interventi: dall'applicazione non si recuperano; si ripianifica la lista da Interventi › Pianificazione, oppure lo staff tecnico valuta un ripristino dal backup. Le attività dicono chi li ha eliminati e quando.

> **Per gli sviluppatori:** ogni passo ha un posto nel codice. Il flusso web è `index.php` → `pages/{nome_pagina}.php` → `Smarty_templates/it/`. L'importazione sta in `pages/file.php` e nei file `lib/Importazione*.php`; il menu della pianificazione in `lib/MenuInterventi.php`, quello della verifica in `lib/MenuRapporti.php`. L'API di GOPlanner 3 entra da `mobile_v3.php`; le chiamate del gestionale passano per `lib/JSONController.php`. L'esportazione sta in `lib/Export.php`, `lib/ExportBase.php`, `lib/EsportazioneRegistro.php`, `lib/EsportazioneLink.php` e `lib/EsportazioneModelli.php`. Le personalizzazioni di una commessa stanno in `custom/{nome_cliente}/`, compresa la sua `config.inc.php`, e prevalgono su `lib/`. Il capitolo 13 descrive l'architettura.

Quando qualcosa non torna, l'ordine è questo: prima la parola del glossario, poi il passo del ciclo, poi la pagina dove quel passo lascia traccia. Solo dopo Gea, dove è attiva, e dopo Gea lo staff tecnico.

## Fonti

- docs: `CONTEXT.md`
- codice: `lib/InterventoBase.php`
- codice: `lib/UtenzaBase.php`
- codice: `lib/CaricoBase.php`
- codice: `lib/CaricoRigaBase.php`
- codice: `lib/InterventoEseguitoBase.php`
- codice: `lib/User.php`
- codice: `config.inc.php`
- codice: `lib/db/db.sql`
- codice: `lib/GOPlanner.php`
- codice: `lib/JSONController.php`
- codice: `lib/VerificaInterventi.php`
- codice: `lib/MenuInterventi.php`
- codice: `lib/MenuRapporti.php`
- codice: `lib/EsportazioneRegistro.php`
- codice: `lib/EsportazioneLink.php`
- codice: `lib/MobileV3/Push/CommandApprovals.php`
- codice: `lib/MobileV3/Domain/EsitoWriter.php`
- codice: `lib/MobileV3/Domain/EsitoCatalog.php`
- codice: `lib/export_letture_*.inc.php`
- codice: `lib/CalendarioController.php`
- codice: `lib/ChatbotAuth.php`
- codice: `config-docker.inc.php`
- codice: `pages/file.php`
- codice: `Smarty_templates/it/file.html`
- codice: `js/code/esportazione.js`
- codice: `Smarty_templates/it/_header.html`
- codice: `Smarty_templates/it/dispositivi.html`
- codice: `Smarty_templates/it/interventi.html`
- wiki: `wiki/assistenza-clienti/stato-utenza-assegnato-dopo-chiusura.md`
- wiki: `wiki/assistenza-clienti/chiudi-cassettinaggio.md`
- wiki: `wiki/assistenza-clienti/magazzino.md`
- wiki: `wiki/assistenza-clienti/modalita-pianificazione.md`
- wiki: `wiki/assistenza-clienti/annunci-novita-campanella.md`
- wiki: `wiki/assistenza-clienti/approvazione-comandi-remoti.md`
- wiki: `wiki/assistenza-clienti/magazziniere-app.md`
- wiki: `wiki/assistenza-clienti/magazziniere-postazione-lettore.md`
- wiki: `wiki/assistenza-clienti/pagina-interventi-menu.md`
- wiki: `wiki/assistenza-clienti/pagina-clienti.md`
- wiki: `wiki/assistenza-clienti/pagina-admin-menu.md`
- wiki: `wiki/assistenza-clienti/pagina-da-assegnare.md`
- wiki: `wiki/assistenza-clienti/pagina-file.md`
- wiki: `wiki/assistenza-clienti/import-carico.md`
- wiki: `wiki/assistenza-clienti/stato-import-export.md`
- wiki: `wiki/assistenza-clienti/pagina-pianificazione.md`
- wiki: `wiki/assistenza-clienti/pagina-geocodifica-clienti.md`
- wiki: `wiki/assistenza-clienti/ripianifica-non-fattibile.md`
- wiki: `wiki/assistenza-clienti/export-dati.md`
- wiki: `wiki/assistenza-clienti/runbook-import-righe-mancanti.md`
- wiki: `wiki/assistenza-clienti/runbook-lista-assente-tendina-piano.md`
- wiki: `wiki/assistenza-clienti/runbook-assegna-utenze.md`
- wiki: `wiki/assistenza-clienti/runbook-dove-si-e-fermato-il-dato.md`
- wiki: `wiki/assistenza-clienti/runbook-export-vuoto-o-fallito.md`
- wiki: `wiki/assistenza-clienti/runbook-errore-a-schermo.md`
- wiki: `wiki/assistenza-clienti/runbook-pagina-file-non-funziona.md`
- wiki: `wiki/assistenza-clienti/sezione-ticket.md`
- wiki: `wiki/assistenza-clienti/runbook-attivita-utente.md`
- wiki: `wiki/assistenza-clienti/runbook-correggere-mappatura.md`
- wiki: `wiki/assistenza-clienti/runbook-lista-tutta-da-pianificare.md`
- wiki: `wiki/assistenza-clienti/aprire-un-ticket-da-gea.md`
- docs: `docs/01-foundations/01-architecture-rules.md`
- docs: `docs/01-foundations/03-database-facts.md`
- docs: `docs/01-foundations/08-ui-ux-architecture.md`
- docs: `docs/02-patterns/13-import-logic-pattern.md`
- docs: `docs/02-patterns/15-data-export-pattern.md`
- docs: `docs/02-patterns/34-stato-utenza-derivato-ultimo-intervento.md`
- docs: `docs/02-patterns/38-chatbot-operazioni-anteprima-esegui.md`
- docs: `docs/03-cookbooks/34-verifica-interventi-estensioni-tenant.md`
- docs: `docs/mobile-v3/comandi-remoti.md`
- docs: `docs/mobile-v3/bootstrap-interventi.md`
- docs: `docs/mobile-v3/esito-write.md`
- Jira: GOP-264 — dove si è fermato il dato dell'app
- Jira: GOP-481 — registro delle importazioni
- Jira: GOP-227 — anagrafica dei lotti
- Jira: GOP-858 — contatore smontato nel furgone
- Jira: GOP-444 — Gea accesa solo sulle commesse pilota
- Jira: GOP-536 — Gea propone solo da un runbook
- Jira: GOP-782 — rapportino rinominato «Da finire»
- Jira: GOP-820 — attività dell'utente lette da Gea
