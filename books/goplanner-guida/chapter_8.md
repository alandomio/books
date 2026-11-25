# 8. Gli operatori e l'app GOPlanner 3

*In questo capitolo si vede che cosa tiene il telefono di un operatore, che cosa rimanda all'ufficio e quando, e che cosa l'ufficio può vedere e fare dal gestionale. È per tutti: le parti con le procedure per gli amministratori e i riquadri per gli sviluppatori sono segnate all'inizio con una riga in corsivo. Le scritte del gestionale citate qui vengono dal codice; quelle del telefono vengono dalla documentazione dell'app e non sono state verificate sullo schermo.*

## Il telefono dell'operatore: abbinare, abilitare, disabilitare

*Per gli amministratori della commessa; gli altri possono leggere i primi due paragrafi e l'ultimo.*

Un caso inventato, per fissare il problema. Un operatore lavora tutta la mattina in una zona senza rete e registra gli esiti sul telefono. In ufficio, a mezzogiorno, si vedono pochi esiti: il pianificatore pensa a un ritardo e sposta su un collega gli interventi del pomeriggio, e già che c'è anche due della mattina che risultano ancora da fare. Alle 13 il telefono trova la rete e invia. Gli esiti di quei due interventi vengono rifiutati, perché adesso appartengono a un altro operatore: le visite sono state fatte, ma in ufficio non arrivano, e il collega ha in elenco due visite già fatte. Nessuno ha sbagliato un clic. L'ufficio ha deciso guardando metà della giornata.

La lezione è una sola. Il telefono di un operatore tiene una sua copia del lavoro e la rimanda quando può. Quasi ogni domanda che l'ufficio si fa sugli operatori («non vede l'intervento», «dice di averlo chiuso ma non lo vedo», «l'app non va») si risolve con tre domande, sempre nello stesso ordine: quale telefono è abilitato per quale operatore; quali interventi quel telefono ha ricevuto; che cosa non ha ancora inviato. Questa sezione risponde alla prima, la sezione successiva alla seconda, le due dopo alla terza.

### Come un telefono diventa il telefono di un operatore

L'abbinamento sostituisce i vecchi identificativi del telefono (SIM, IMEI e simili): l'operatore e la commessa vengono dall'abbinamento, mai da quello che il telefono dichiara in una richiesta. Alla prima apertura l'app crea una sua chiave, che non lascia mai il telefono. Poi chiede al server un codice di 3 caratteri, valido 24 ore e utilizzabile una volta sola. L'operatore legge il codice all'ufficio, l'amministratore lo inserisce nel gestionale, sceglie l'operatore e abilita. Nel frattempo l'app controlla ogni 30 secondi; quando l'abilitazione arriva mostra «Telefono abilitato». Il server non consegna mai un segreto al telefono: all'abilitazione cambia solo uno stato.

Ne segue una regola che conviene sapere prima che squilli il telefono. Una chiave nuova è un telefono nuovo. Se l'operatore reinstalla l'app, ripristina il telefono o lo cambia, serve un nuovo abbinamento con un nuovo codice. Un aggiornamento dell'app, invece, non lo richiede. Durante un test lo stesso telefono, reinstallato, si è ritrovato abbinato due volte con due identificativi diversi (GOP-455); il riabbinamento automatico è stato deciso il 17 ottobre 2026, ma al 25 novembre 2026 non è costruito.

All'abbinamento l'operatore accetta l'informativa su posizione e telefono personale; il server registra versione e ora dell'accettazione. Il 14 ottobre 2026 è stato deciso che l'informativa si ripresenti a ogni aggiornamento dell'app; il server, però, oggi registra l'accettazione solo all'abbinamento.

### Abilitare un telefono

1. Aprite Impostazioni › Dispositivi mobili (nel menu di sinistra, dopo «Generale»).
2. Premete «Nuovo dispositivo».
3. Nel campo «Codice» scrivete i 3 caratteri letti dall'operatore; maiuscole e minuscole sono indifferenti.
4. Premete «Cerca».
5. Controllate la scheda del telefono trovato: «Telefono:», «App:», «Richiesta del:», «Codice valido fino al:», «ID dispositivo:». Se compare «Questo telefono era stato disabilitato e chiede di essere riabilitato.», sapete che non è un telefono nuovo.
6. In «Scegli l'operatore» scegliete l'operatore; l'elenco contiene solo gli operatori della commessa.
7. Premete «Abilita». Il codice viene consumato e non vale una seconda volta.

Se il codice è sbagliato o vecchio, la pagina risponde «Codice inesistente, scaduto o gia' usato.» e chiede il codice che il telefono mostra adesso. Un codice scaduto si rimedia sul telefono: l'app ne chiede uno nuovo con «Chiedi un nuovo codice» e l'operatore lo rilegge.

C'è una seconda strada. Dalla scheda dell'operatore (Operatori › Elenco operatori, finestra «Modifica operatore») il campo «Dispositivo» elenca i telefoni GOPlanner 3 già abilitati di quell'operatore, ognuno con versione dell'app, modello e ID dispositivo, e con il pulsante «Disabilita». Sotto c'è un campo «Codice» di 3 caratteri e il pulsante «Collega telefono». Stesso codice, stesso permesso, stesso evento registrato. Un operatore può avere più di un telefono.

### Disabilitare un telefono

Nell'elenco dei telefoni selezionate la riga e premete «Disabilita»; la conferma chiede «Disabilitare il telefono {ID dispositivo}? Per riabilitarlo servirà un codice nuovo.». Da quel momento ogni richiesta del telefono viene rifiutata e l'app mostra «Questo telefono non è più abilitato». Lo stesso messaggio compare se l'operatore abbinato non esiste più o è passato a un'altra commessa. E «Disattiva operatore» dalla scheda disabilita in un colpo tutti i telefoni di quell'operatore: se la disabilitazione non riesce, l'operatore resta attivo e la pagina lo dice.

### Ritrovare un telefono

L'elenco ha le colonne «ID dispositivo», «Stato», «Operatore», «Telefono», «App», «Abilitato il», «Ultimo uso» e «Permessi», 20 righe per pagina, gli ultimi abilitati per primi. I filtri sono «Stato» (Abilitato, Disabilitato, In attesa), «Operatore», «Permessi», «Abilitato dal … al …», «Ultimo uso dal … al …», più un «Filtro Avanzato». Lo stato «Disabilitato, chiede di essere riabilitato» indica un telefono disabilitato che ha già chiesto un codice nuovo: torna abilitato solo quando l'ufficio usa quel codice. L'«ID dispositivo» ha 8 caratteri ed è il riferimento da dare allo staff tecnico; non è segreto e non è il codice di abbinamento. Ogni evento (registrato, codice emesso, abilitato, disabilitato) resta registrato con l'utente e la commessa, mai con chiavi o codici.

### Un telefono perso, e i limiti della pagina

Davanti a un telefono perso il dubbio è questo: «Se disabilito il telefono, l'operatore perde gli esiti che non aveva ancora inviato?» No. Il lavoro non inviato resta sul telefono; il server non lo tocca e non ha comandi che lo cancellino. Disabilitare, quindi, non cancella il lavoro già fatto; però, finché il telefono resta disabilitato, la sua coda non può partire, perché ogni richiesta viene rifiutata. Riabilitare costa solo un codice nuovo. Resta però un limite: recuperare il lavoro da un telefono rotto o perso non è oggi un servizio. La documentazione prevede una chiave di recupero, ma la segna come «aggancio, non costruito». Un caso così va allo staff tecnico, senza promesse.

Altri limiti della pagina. La vedono solo gli amministratori della commessa con il permesso di vedere o di abbinare i telefoni; gli altri leggono «Solo gli amministratori del cliente possono abilitare o disabilitare i telefoni.». Se mancano le tabelle del database principale, la pagina si apre con «Gestione telefoni GOPlanner 3 non disponibile» e il motivo: è un caso per lo staff tecnico. La pagina compare per ogni amministratore con il permesso, anche su commesse che non usano GOPlanner 3. E i telefoni con l'app precedente, GOPlanner 1.x, qui non ci sono.

> **Per gli sviluppatori:** la coppia di chiavi EC P-256 nasce nel keystore del telefono; il `device_id` sono i primi 32 caratteri esadecimali dello SHA-256 della chiave pubblica; ogni richiesta `/v3/` è firmata (`GOP-Sig-1`). File: `pages/dispositivi.php`, `lib/MobileV3/Device/OfficeDevices.php`. Dettagli nel capitolo 15, *Integrazioni e API*.

La regola da ricordare: prima di cercare un intervento, si cerca il telefono, e nella pagina Dispositivi mobili si guarda se è abilitato e per chi.

## Quali interventi arrivano sul telefono

Dal campo arriva la domanda «non vedo l'intervento». In ufficio l'intervento c'è, assegnato e pianificato. Sul telefono no. Quasi sempre la risposta sta in una regola che l'ufficio può leggere da sé.

Il telefono riceve gli interventi assegnati all'operatore abbinato a quel telefono, con una data pianificata dentro una finestra di giorni prima e dopo oggi. La regola generale chiede anche lo stato Assegnato (3) e un carico non chiuso. Su alcune commesse si aggiungono altri interventi: per esempio quelli già chiusi oggi, o quelli chiusi con esito utente assente entro un certo numero di giorni. Alcune commesse hanno poi un elenco tutto loro, a cui la finestra generale non si applica. In pratica, come dice la documentazione del contratto, l'app vede soprattutto interventi in stato 3. Un intervento salvato a metà con l'esito «Rapportino» (su alcune commesse si chiama «Da finire») non chiude: resta in stato 3, quindi resta sul telefono.

### La finestra dei giorni

*Per gli amministratori.*

La finestra si imposta in Impostazioni › Generale, nel riquadro «Telefoni GOPlanner 3», con l'etichetta «Valgono per tutto il cliente». Il testo d'aiuto dice: «Quali interventi arrivano sul telefono: quelli con data compresa tra questi giorni prima e dopo oggi. Lasciando vuoto vale quanto impostato per il cliente (indicato sotto il campo). Non cambia l'app 1.x.». I due campi sono «Giorni prima di oggi» e «Giorni dopo oggi»; sotto ciascuno, «Vuoto = …» mostra il valore che vale quando il campo è vuoto. Su una commessa, per esempio, la finestra è di 7 giorni indietro e 10 avanti.

Per ciascuno dei due campi vince il primo valore presente, in quest'ordine: quello salvato da questa pagina; se il campo è vuoto, quello della configurazione della commessa; se manca anche quello, quello dell'app precedente. Da qui viene la prima cosa da controllare quando manca l'intervento di domani: se nessuno ha mai impostato i giorni avanti, a nessuno dei tre livelli, la finestra in avanti è di 0 giorni. Il telefono vede fino a oggi, non domani.

### L'elenco del telefono segue il server

L'elenco di GOPlanner 3 non ha cache sul server: un esito, una ripianificazione, una modifica d'ufficio o un'importazione compaiono alla richiesta successiva del telefono. La richiesta però la fa il telefono, non l'ufficio. L'app aggiorna l'elenco a intervallo, quando torna in primo piano e quando l'operatore trascina la lista verso il basso; l'intervallo esatto è nell'app e le fonti non lo danno. Nessuna azione dell'ufficio (riassegnare, verificare, cancellare) manda da sola un avviso al telefono.

A ogni aggiornamento l'app toglie gli interventi che il server non le manda più. Se l'ufficio sposta un intervento su un altro operatore (Interventi › Lista, «Modifica», vedi il capitolo 6, *Interventi, esiti e verifica*), l'intervento esce dal primo telefono al prossimo aggiornamento di quel telefono, e arriva al secondo al prossimo aggiornamento dell'altro. C'è un'eccezione, ed è quella del caso d'apertura: un intervento che sul telefono ha un esito non ancora inviato resta lì finché l'invio non è confermato. L'operatore continua a vederlo, e il suo esito partirà verso un intervento che non è più suo.

Su ogni intervento l'operatore vede, tra l'altro:

- indirizzo, comune e coordinate;
- utenza, matricola e tipo;
- stato, note ed eventuale orario dell'appuntamento;
- i campi della commessa.

Dal telefono si può anche leggere lo storico delle foto di un'utenza: di base gli ultimi 12 mesi, regolabili per commessa da 1 a 120. Queste regole sono segnate nella documentazione come «da confermare».

### L'operatore non vede un intervento

Prima di aprire un ticket, i controlli in ordine, dal telefono all'intervento, come le tre domande della prima sezione:

1. Il telefono è abilitato per quell'operatore? Impostazioni › Dispositivi mobili. Un operatore disattivato ha i telefoni disabilitati; uno passato a un'altra commessa ha il telefono rifiutato.
2. Il suo «Ultimo invio» è recente? Operatori › Dashboard. Un telefono che non parla con il server da prima della modifica non può avere l'elenco nuovo.
3. L'intervento è assegnato proprio a quell'operatore? Interventi › Lista, filtro Operatore.
4. La data pianificata cade dentro «Giorni prima di oggi» e «Giorni dopo oggi»? Impostazioni › Generale; attenzione al valore 0 in avanti.
5. Lo stato è uno di quelli che il telefono riceve, di regola Assegnato (3), e il carico è aperto?
6. Se tutto torna e l'intervento manca ancora, chiedete a Gea (vedi il capitolo 10, *Gea, l'assistente di GOPlanner*) o allo staff tecnico (vedi il capitolo 12, *Strumenti di amministrazione e diagnostica*).

Un dubbio collegato: «Ho spostato l'intervento su un altro operatore: perché il primo lo vede ancora?». Perché il suo telefono non si è ancora aggiornato. Lo toglierà al prossimo aggiornamento, che avviene da sé o quando l'operatore riapre l'app o trascina la lista. Dove i comandi remoti sono attivi, un amministratore può approvare un «sincronizza» (vedi più avanti, *Le leve dell'ufficio sul telefono*). Un tempo massimo le fonti non lo danno. E se il primo operatore aveva già registrato l'esito senza rete, il problema non è più che lo vede: è che il suo invio verrà rifiutato, come si vede due sezioni più avanti.

I limiti. La finestra è un valore per tutta la commessa, non per operatore. Non vale per GOPlanner 1.x, che tiene le sue impostazioni. Un telefono senza rete continua a mostrare l'ultimo elenco ricevuto. La parte magazzino dell'app segue altre regole: vedi il capitolo 9, *Il magazzino*.

> **Per gli sviluppatori:** `GET /v3/interventi`; l'elenco è prodotto dal codice 1.x (`AndroidController::get_interventi()`) con l'operatore memorizzato, mai quello della richiesta; finestra in `lib/MobileV3/Domain/FinestraInterventi.php`; l'elenco è uno snapshot completo, con un hash per intervento che cambia a ogni modifica visibile. Vedi il capitolo 15.

La regola: un intervento arriva sul telefono se è dell'operatore giusto, nella finestra di giorni e nello stato giusto; e arriva quando il telefono chiede, non quando l'ufficio salva.

## Registrare l'esito: foto, firma e posizione

Quando l'operatore chiude un intervento, dal telefono non parte solo l'esito. Partono le foto, a volte una firma, e la posizione o il motivo per cui manca. Ogni pezzo ha le sue regole e un posto diverso dove l'ufficio lo ritrova.

### L'esito

L'operatore sceglie un esito dall'elenco della commessa. Gli esiti predefiniti sono «Eseguito», «Non fattibile», «Ripianificabile», «Rapportino» e «Utente assente»; le etichette possono cambiare per commessa. Ognuno dice se chiude l'intervento: tutti chiudono tranne «Rapportino», che serve a salvare a metà e riprendere, può essere inviato più volte e su alcune commesse si chiama «Da finire». Lo stato che ogni esito scrive appartiene al capitolo 6: Eseguito (4), Non fattibile (5), Ripianificabile (8), Utente assente (99); vedi il capitolo 6, *Interventi, esiti e verifica*. Alcune commesse registrano l'utente assente come 5, e il server risponde con lo stato che la riga ha davvero.

Che cosa porta con sé un esito, con le sue regole:

- l'esito e la data e ora in cui è stato registrato, obbligatori;
- il motivo di un non fattibile, dove la commessa lo registra;
- le letture, conservate così come l'operatore le scrive, al massimo 100 caratteri ciascuna;
- le note, al massimo 2.000 caratteri;
- i campi personalizzati di chiusura, solo quelli che la commessa definisce;
- le foto e la firma già inviate, al massimo 100 foto;
- la posizione, o il motivo della sua assenza.

Un esito con un'emoji in un testo libero viene rifiutato per intero, non ripulito in silenzio, e non è un errore che si ritenta. Il server scrive tutto in una sola transazione e non crea mai un intervento nuovo.

### Foto e firma

Una foto è un file JPEG o PNG di al massimo 20 MB, con un tipo obbligatorio, scattata con la fotocamera o scelta dalla galleria. Un PNG non resta PNG: viene salvato come JPEG, con il lato lungo a 1600 pixel. Sono rifiutati per sempre i file oltre 20 MB e i formati diversi (il controllo guarda il contenuto del file, non il nome). Su alcune commesse una foto identica a una già presente viene rifiutata come duplicata.

La firma è solo PNG, al massimo 20 MB, con un nome stampato facoltativo fino a 100 caratteri; nessuna impostazione la rende obbligatoria. Il server la conserva come una foto con un tipo riservato, e per questo i documenti della commessa la ritrovano: la ricevuta la stampa con l'etichetta «Firma del cliente» e il nome sotto.

Conta l'ordine. Foto e firma partono prima, l'esito le nomina. Se una non è ancora arrivata, il server risponde che manca un pezzo, non chiude nulla e chiede al telefono di riprovare dopo 5 secondi; il telefono manda ciò che manca e riprova. Mai un intervento chiuso a metà.

### La scritta sulle foto e la ricevuta

*Per gli amministratori.*

In Impostazioni › Generale il riquadro «Scritta sulle foto» decide la riga che il telefono stampa su ogni foto, con data, matricola, coordinate e altro a scelta. Vale solo per GOPlanner 3: l'app 1.x e l'esportazione delle foto non cambiano. Il «Modello» mostra «Predefinito», «Personalizzato» o «Non valido»; si cambia con «Modifica…» e si controlla con l'«Anteprima con dati inventati». Il modello predefinito è data, ora e matricola; il massimo è 120 caratteri, senza a capo. Un modello non valido arriva ai telefoni come quello predefinito, e un valore che manca (per esempio senza GPS) il telefono lo omette. Sul server non si stampa niente: la riga la compone il telefono. Al 25 novembre 2026 il ticket della scritta (GOP-695) risulta ancora in corso. Per l'esportazione delle foto vedi il capitolo 7, *Esportazione e consegna al committente*.

Il riquadro «Ricevuta alla chiusura» ha la casella «Stampa ricevuta alla chiusura»: se è attiva, l'app GOPlanner 3 propone di stampare la ricevuta quando l'operatore chiude un intervento. Di base è spenta, e la stessa casella si trova anche in Impostazioni › Documenti, scheda Ricevuta.

### La posizione

Le posizioni sono due dati diversi, da non confondere.

La posizione dell'esito dice dove l'intervento è stato chiuso. È quella del momento, oppure l'ultima rilevata prima, con la sua età. Quando non c'è, l'app manda il motivo: permesso negato, GPS spento o nessun fix. Questa regola nasce da un caso reale (GOP-621). Su una commessa, dal 26 ottobre 2026, tutti i 130 esiti registrati con GOPlanner 3 avevano posizione 0,0: l'app non mandava le coordinate, anche se il server era pronto a riceverle. La correzione, chiusa il 5 novembre 2026, manda la posizione quando c'è il permesso (l'ultima se ha meno di 2 minuti, altrimenti una rilevazione rapida), chiede il permesso una volta, la prima volta che l'operatore chiude un intervento, e non blocca né ritarda mai l'esito in attesa del GPS. Dove manca, l'ufficio legge «posizione assente: permesso negato», «posizione assente: GPS spento» o «posizione assente: nessun fix disponibile» invece di uno 0,0 muto.

Dove la si legge, però, dipende dalla commessa. Il testo compare nel campo «Posizione» della scheda di verifica solo sulle commesse che lo hanno nella configurazione della verifica, una decina. Altrove resta salvato ma non si vede sullo schermo. Gli esiti registrati con GOPlanner 1.x non hanno queste informazioni.

Le posizioni durante la giornata sono un'altra cosa: punti mandati dal telefono mentre l'operatore lavora, che alimentano i km della Dashboard. Il progetto le vuole solo con il consenso dell'operatore: l'ufficio può invitarlo, l'operatore accetta o rifiuta e può sempre revocare. Oggi l'invito parte solo da un comando remoto, non c'è una pagina dell'ufficio per farlo, e la tabella degli inviti è indicata nella documentazione come preparata e non applicata.

Che il telefono abbia i permessi giusti si vede nella colonna «Permessi» di Impostazioni › Dispositivi mobili: un'etichetta per «Posizione», «Posizione in background», «Fotocamera» e «Notifiche», verde «concesso», rossa «negato» o «negato per sempre», grigia «non richiesto». Quando manca la posizione, «manca la posizione» viene per prima; un telefono che non ha mai riferito mostra «non riportati». Il filtro «Permessi» offre «Senza posizione» e «Mai riportati».

### Un esito senza coordinate

Il dubbio che nasce davanti a un esito senza coordinate: «L'operatore non era sul posto?». La pagina non lo dice, e il capitolo nemmeno. L'assenza è registrata con il suo motivo. Un «permesso negato» si ritrova nella colonna «Permessi» e si corregge sul telefono. Un «nessun fix disponibile» in uno scantinato non dice niente sulla presenza di nessuno.

I limiti. Esiti, campi e motivi cambiano da commessa a commessa. L'app può mandare inizio e fine dell'intervento, ma il server oggi li accetta e non li salva, per nessuna commessa: dal telefono non si ricava il tempo passato sul posto, che la Dashboard stima dalle foto. Sulle commesse che hanno regole proprie per chiudere gli interventi, la documentazione chiede di non abilitare gli esiti di GOPlanner 3 finché non c'è una decisione. Le foto non si modificano dal gestionale. Al 25 novembre 2026 il ticket della firma (GOP-449) risulta ancora in corso. Lo stesso giorno è stato deciso anche che un'impostazione per commessa impedirà di chiudere un intervento quando l'ora del telefono è stata cambiata o la posizione è spenta: per ora è solo una decisione, nel codice non c'è.

> **Per gli sviluppatori:** `POST /v3/interventi/{id}/foto`, `/firma`, `/esito`; ogni scrittura porta un `Idempotency-Key`, quindi lo stesso tentativo ripetuto non scrive due volte; firma con tipo 99 (firma del cliente) o 98 (domiciliazione) nella tabella `foto`; posizione dell'esito in `servizi` sotto `_posizione`. Vedi i capitoli 14 e 15.

La regola: un esito senza un pezzo non si chiude a metà, e un esito senza posizione porta sempre il motivo; si legge il motivo, non si deduce.

## Quando il dato non arriva: coda, rifiuti, segnalazioni e anomalie

Il caso d'apertura, visto dall'ufficio: l'operatore della mattina senza rete dice di aver chiuso, e in ufficio non si vede niente. Il runbook dell'assistenza dà tre possibilità: il dato non è mai partito dal telefono, si è perso per strada, oppure è arrivato al server e non è stato salvato. Il compito è dire quale delle tre, non indovinare.

### La coda del telefono

L'app tiene sul telefono esiti, foto e firme e li invia quando può. Senza rete niente si perde: aspetta. Il tasto «Riprova» rimanda ciò che è in coda e ciò che è stato rifiutato con un errore che si può ritentare: un pezzo che manca ancora, troppe richieste, un problema del server. Con GOPlanner 3 il server scrive ogni dato una volta sola anche se il telefono lo rimanda: lo stesso tentativo ripetuto riceve la risposta già salvata, e un esito identico a uno già registrato viene riconosciuto, non duplicato. Con l'app precedente questo non vale: un invio ripetuto dopo una conferma persa può duplicare.

Quattro strade, ognuna con il suo posto dove guardare. Le prime due dicono dove sta il dato; le altre due sono i canali da cui un problema dell'app arriva all'ufficio.

| Strada | Che cosa vuol dire | Dove guarda l'ufficio | Che cosa si fa |
|---|---|---|---|
| In coda sul telefono | Niente rete o telefono spento: l'operatore ha lavoro in attesa | «Ultimo invio» in Operatori › Dashboard | Si aspetta, o si chiede all'operatore di aprire l'app con la rete e usare «Riprova» |
| Rifiutato dal server | L'invio arriva ma non passa | Gea, che legge le richieste dell'app GOPlanner 3 finite con un errore | Dipende dal motivo, spiegato qui sotto |
| Segnalazione | L'operatore ha scritto qualcosa sull'app con «Segnala un problema» e la ritrova in «Le mie segnalazioni» | Sezione Ticket | Si legge e si risponde |
| Anomalia | Un crash, un errore o un avviso che l'app ha mandato da sola | Gea | L'operatore non deve fare niente; il resto è dello staff tecnico |

### Quando è l'ufficio a far rifiutare un invio

Come nel racconto iniziale, un esito registrato senza rete arriva al server dopo che l'ufficio ha già cambiato quell'intervento. Il server allora rifiuta, e il motivo dipende da che cosa ha fatto l'ufficio:

- intervento riassegnato a un altro operatore: per il server è un intervento che quell'operatore non ha, e lo tratta come inesistente;
- intervento già controllato dall'ufficio, cioè in stato 6 o superiore, compresi 8 e 99: rifiutato con «Intervento gia' controllato dal backoffice: non si modifica.»;
- intervento già chiuso con un esito diverso, in stato 4 o 5: rifiutato con «Intervento gia' chiuso.»;
- intervento messo «Verificato» dalla lista degli «Interventi mancanti» prima che il telefono inviasse: stesso rifiuto, perché l'esecuzione vuota creata dall'ufficio blocca quella del telefono (vedi il capitolo 6, *Interventi, esiti e verifica*).

Il rischio va misurato bene. Il rifiuto succede solo quando l'ufficio cambia un intervento che il telefono ha già fatto e non ancora inviato. Ed è lo stesso meccanismo che protegge le correzioni dell'ufficio: dopo il controllo, nessun invio dal telefono sovrascrive niente.

Che cosa si recupera dopo, invece, dipende dal motivo. Se il rifiuto è per un intervento controllato o già chiuso, e l'ufficio corregge lo stato, lo stesso «Riprova» viene valutato di nuovo e può passare. Se il rifiuto è per un intervento riassegnato, il server conserva quella risposta per 30 giorni come definitiva per quell'invio: riassegnare l'intervento al primo operatore non basta a far passare lo stesso tentativo. Le fonti non dicono se l'app crea un nuovo tentativo; quel caso va allo staff tecnico.

Il rimedio, quindi, non è garantito; la prevenzione costa un'occhiata. Prima di spostare, verificare o cancellare gli interventi di oggi di un operatore, guardate il suo «Ultimo invio» in Operatori › Dashboard. Se è di prima del lavoro che state per toccare, chiedete all'operatore se il telefono ha ancora esiti in coda.

C'è un rifiuto che con l'ufficio non c'entra: l'orologio. Ogni richiesta porta l'ora del telefono, accettata entro 300 secondi da quella del server. Fuori da quei 5 minuti la richiesta viene rifiutata; l'app corregge lo scarto e ritenta una volta. Se il problema resta, l'operatore imposta l'ora automatica e usa «Riprova»: la coda parte. Gea lo sa riconoscere: tra le richieste con errore il runbook cita proprio «un orologio del telefono sbagliato», che tra l'altro sposta i dati di giorno.

### Le segnalazioni degli operatori

Con «Segnala un problema» l'operatore scrive un problema o un suggerimento sull'app, non sul lavoro. Può scegliere un tipo (tra cui «Problema bloccante») e allegare uno screenshot e il registro diagnostico, già ripuliti dall'app. In ufficio le segnalazioni arrivano nella sezione Ticket, accanto a Impostazioni e Admin, dove gli utenti del gestionale le vedono tutte, senza l'autore (vedi il capitolo 12, *Strumenti di amministrazione e diagnostica*). Si conservano 12 mesi.

Sul telefono, «Le mie segnalazioni» risulta ancora in corso al 25 novembre 2026 (GOP-560). Com'è progettata: l'operatore vede le segnalazioni condivise della commessa, con stato, risposta e numero di conferme, ma mai chi le ha scritte o confermate, né gli allegati. Può confermare quella di un collega o dire che una chiusa non è risolta, e mentre scrive gli vengono proposte quelle simili ancora aperte. Una segnalazione chiusa resta visibile sul telefono 2 giorni.

> **Quando chiedere allo staff tecnico:** il telefono continua a fallire dopo «Riprova», con la rete e l'ora giusta; un telefono rotto o perso ha lavoro in coda; un invio rifiutato che l'ufficio non sa spiegare, in particolare dopo una riassegnazione; l'«Ultimo invio» di molti operatori si è fermato alla stessa ora. Nel ticket servono commessa, operatore, periodo e, se Gea lo mostra, l'identificativo della richiesta.

I limiti. L'ufficio non vede il contenuto della coda di un telefono. Lo staff lo vede: l'app manda ogni 5 minuti, e a ogni apertura, un segnale con quanti esiti, foto e posizioni aspettano, l'ultimo errore di invio e il tipo di rete, senza chiedere niente all'operatore (vedi il capitolo 16, *Operazioni, qualità e rilasci*). Le anomalie di GOPlanner 3 non hanno una pagina del gestionale: le legge Gea. Admin › Diagnostica › «Errori app» e «Log» sono in sola lettura e riservati al personale GOPlanner (vedi il capitolo 12). Un problema che l'app non ha mai registrato, con il telefono spento o senza rete, non si vede da nessuna parte: lo dice anche il runbook di Gea.

> **Per gli sviluppatori:** ogni errore porta `retryable`; sotto l'`Idempotency-Key` si salvano solo le risposte 2xx e le 4xx non ritentabili, esclusi `intervento_locked` e `already_closed` (`ApiError::STATE_DEPENDENT`); `not_found` invece si salva; registro conservato 30 giorni; heartbeat `POST /v3/heartbeat`. Vedi i capitoli 15 e 16.

La regola: un dato che manca o è ancora sul telefono o è stato rifiutato dal server; prima di ripianificare la visita si cerca dove sta.

## Le leve dell'ufficio sul telefono: comandi remoti e aggiornamenti

*Per gli amministratori della commessa.*

Un agente, o qualcuno dalla porta MCP, può preparare un comando per i telefoni degli operatori. Su una commessa di produzione quel comando non parte da solo: aspetta che una persona lo approvi. È la leva più nuova che l'ufficio ha sul telefono (GOP-784 del 14 novembre 2026, approvazione GOP-787 del 20 novembre 2026), ed è costruita perché nessun telefono riceva qualcosa senza che un amministratore l'abbia deciso.

### I comandi

Il catalogo è chiuso: sette comandi, nient'altro. Nessuno cancella dati sul telefono, e il catalogo non ne ammette.

| Comando | Che cosa fa sul telefono |
|---|---|
| Inviare un messaggio | Lo mostra come notifica e nell'app; al massimo 500 caratteri, non vuoto |
| Sincronizza | Fa riscaricare all'app gli interventi, il magazzino o la configurazione |
| Ritenta invii | Come il tasto «Riprova»: rimanda la coda e gli invii rifiutati con un errore ritentabile; non cancella niente e non tocca i rifiuti definitivi |
| Richiedi log | Carica il registro diagnostico già ripulito come segnalazione con il testo «Log richiesto dall'ufficio», senza screenshot e senza chiedere all'operatore |
| Invita al tracciamento | Mostra l'invito; nessuna posizione parte senza il consenso dell'operatore |
| Apri intervento | Apre la scheda di un intervento; se non è sul telefono, l'app risponde che non l'ha trovato |
| Aggiorna app | Propone l'ultima versione; l'operatore può rimandare |

Ritenta invii, richiedi log e aggiorna app chiedono l'app 3.0.0; le versioni precedenti li ignorano.

### Approvare un comando

1. Aprite Impostazioni › Dispositivi mobili.
2. In cima, se ci sono richieste in sospeso, compare il riquadro «Comandi in attesa di approvazione», con la frase «Mandati da un agente o dall'ufficio dalla porta MCP: non partono finché non li approvi qui.».
3. Leggete «Comando», «Telefoni», «Richiesto» e «Valido fino».
4. Premete «Approva e invia» oppure «Rifiuta».

La pagina conferma con «Comando approvato e inviato a N telefono/i.» o «Comando rifiutato: non è partito nulla.».

Le regole dietro i due pulsanti sono strette. Una richiesta vale 60 minuti; poi la pagina risponde «La richiesta è scaduta: serve un nuovo invio.». Si approva solo da questa pagina, con la propria sessione: non da un agente, non da un'API. Al momento dell'approvazione il server rilegge i telefoni abilitati e tiene solo quelli della richiesta: un telefono disabilitato nel frattempo non riceve niente, uno abilitato dopo nemmeno. La decisione è una sola: due approvazioni insieme non mandano due volte. Chi approva resta registrato con l'ora. Il testo del comando si conserva solo finché è in sospeso. Sulle commesse di prova, invece, il comando parte subito. C'è anche un tetto: di base 10 comandi per telefono in 10 minuti; oltre, quel telefono viene saltato e gli altri ricevono.

Recapitato non vuol dire eseguito. Per ogni telefono chi ha mandato il comando vede «recapitato» (il servizio di notifica ha accettato il messaggio) o «non recapitato», e poi, quando l'app conferma, «eseguito», «fallito», «rifiutato» o «non supportato». Un telefono che non ha mai mandato il suo indirizzo per le notifiche push non si può raggiungere.

Un caso tipico: «Ho approvato il comando, ma il telefono non ha fatto niente.». I controlli, in ordine:

1. L'approvazione è arrivata entro i 60 minuti dalla richiesta.
2. Al momento dell'approvazione il telefono era ancora abilitato.
3. L'app capisce il comando: per ritenta invii, richiedi log e aggiorna app serve almeno la 3.0.0.
4. Il telefono ha mandato almeno una volta il suo indirizzo per le notifiche push; senza, non si raggiunge.
5. Se lo stato è «recapitato» ma non «eseguito», il telefono non ha ancora confermato: è spento o senza rete.

### Aggiornare l'app

GOPlanner 3 si installa e si aggiorna fuori da Google Play. L'operatore la scarica dalla pagina di accesso del gestionale, dal collegamento «Scarica GOPlanner per Android» (o dal QR). Se non c'è una versione disponibile, la pagina dice «Il download di GOPlanner per Android non è al momento disponibile». Con la modifica del 22 novembre 2026 la pagina non mostra più la versione né un collegamento all'app precedente; le fonti non dicono da dove la scarichi ora chi usa GOPlanner 1.x.

Gli aggiornamenti sono facoltativi di base e diventano obbligatori solo per decisione esplicita. Un telefono sotto la versione minima viene rifiutato su ogni richiesta con «Versione dell'app non piu' supportata.», tranne la strada dell'aggiornamento, che resta aperta. Sulla schermata dell'aggiornamento obbligatorio l'app continua a lasciar partire la coda. In ufficio si vede chi aggiornare in Operatori › Dashboard: la colonna «Versione app» dice Aggiornata, Precedente o Obsoleta, e il riquadro «App da aggiornare» conta gli operatori con l'app non aggiornata. GOPlanner 1.x risulta sempre Obsoleta. È un'indicazione di chi aggiornare, non un blocco: l'app precedente continua a funzionare dove si usa. Dove i comandi sono attivi, «aggiorna app» risponde con uno di questi esiti: aggiornamento accettato, già aggiornata, aggiornamento obbligatorio avviato, rimandato dall'operatore, controllo della versione non riuscito.

> **Per lo staff tecnico:** il pacchetto di aggiornamento è firmato fuori dal server da una persona, con una chiave mai raggiungibile dagli agenti; il server non firma e controlla soltanto. Come si pubblica un rilascio è nel capitolo 16, *Operazioni, qualità e rilasci*.

I limiti. I comandi remoti funzionano solo sulle commesse dove lo staff tecnico li ha attivati; altrove chi li manda riceve «I comandi remoti non sono abilitati su questa commessa.». Se manca la tabella delle approvazioni, la pagina dice «Approvazione dei comandi non disponibile: manca la migrazione 0031 del database principale, oppure il database non risponde.», e i comandi su una commessa di produzione non partono: è un caso per lo staff tecnico. Nessuna pagina dell'ufficio manda comandi: la pagina li approva o li rifiuta soltanto, e i comandi partono da un agente o dalla porta MCP (vedi il capitolo 15, *Integrazioni e API*). I telefoni con GOPlanner 1.x non si raggiungono da qui. Al 25 novembre 2026 il ticket degli aggiornamenti firmati (GOP-407) risulta ancora in corso.

> **Per gli sviluppatori:** `lib/MobileV3/Push/` (`EventCatalog`, `CommandStore`, `CommandDispatcher`); approvazioni in `mobile_v3_comandi_approvazioni` (migrazione 0031); gli strumenti MCP sono scritture del motore unico, con un codice di conferma valido 5 minuti e usabile una volta; la rotta dell'aggiornamento è esente dal rifiuto per versione minima.

La regola: ogni comando verso i telefoni di una commessa di produzione passa da un amministratore entro 60 minuti, e nessun comando cancella il lavoro sul telefono.

## Operatori › Dashboard e Confronto: leggere il lavoro della squadra

*Per chi coordina gli operatori; il Confronto richiede un permesso.*

A fine settimana il coordinatore si chiede chi va guardato. Le due pagine di Operatori servono a rispondere senza trasformare la risposta in una classifica.

Sotto Operatori, accanto a «Elenco operatori», ci sono «Dashboard» e, per chi può, «Confronto». La Dashboard guarda un operatore alla volta: l'app, i km, le foto. Il Confronto mette ogni operatore davanti alla mediana della squadra. Entrambe hanno «Periodo» («Oggi», «Ultimi 7 giorni», «Ultimi 30 giorni», «Ultimi 90 giorni»), «Lotto» («Tutti» o uno) e il pulsante «Excel». Un utente con lotti assegnati vede solo quelli, anche con «Tutti». Gli operatori disattivati o nascosti non compaiono.

### La Dashboard

Il periodo di base è «Ultimi 7 giorni». Le colonne:

| Colonna | Che cosa mostra |
|---|---|
| «Versione app» | Aggiornata, Precedente o Obsoleta rispetto alla build più alta tra i telefoni GOPlanner 3 abilitati della commessa; GOPlanner 1.x è sempre Obsoleta |
| «Eseguiti» | Le esecuzioni negli stati 4, 6 e 7 (eseguito, controllato, inviato), contate per data dell'esito |
| «Km» | La somma in linea retta tra posizioni consecutive del telefono |
| «Foto» | Le foto scattate nel periodo, qualunque sia lo stato dell'intervento |
| «Qualità foto» | Foto conformi su foto analizzate |
| «Tempo medio» | Il tempo sul posto, misurato o stimato |
| «Ultimo invio» | Il più recente tra l'ultimo uso di un telefono GOPlanner 3, l'ultimo segnale dell'app precedente e l'ultima posizione |

I km hanno filtri precisi, e si capisce perché. Le posizioni con una precisione peggiore di 100 metri si scartano. Uno spostamento sotto 30 metri è rumore. Un salto oltre 160 km/h è un errore del GPS. Più di 30 minuti tra due punti fanno ripartire il conto senza aggiungere distanza. I km sono di tutta la giornata, non solo del lotto scelto. La qualità delle foto esiste solo dove è attiva l'analisi automatica con l'AI; sotto l'80% la pagina avvisa: «Qualità foto sotto l'80%: controllare inquadratura, messa a fuoco e luce.». Il tempo sul posto è misurato da inizio e fine dell'esecuzione se ci sono; altrimenti è stimato dalla prima all'ultima foto dello stesso intervento, e la pagina lo scrive.

Quando una fonte manca, la cella mostra «n.d.» e il riquadro «non disponibile» con il motivo, per esempio «Questa commessa non registra le posizioni dei telefoni: i km non sono misurabili.». Mai uno zero che sembra un dato. Un clic su una riga mostra gli eseguiti degli ultimi 10 giorni lavorativi.

La Dashboard elenca anche operatori che nel periodo non hanno lavorato ma hanno un telefono GOPlanner 3 abilitato o un segnale recente dell'app precedente. Essere nell'elenco, quindi, non vuol dire essere un operatore attivo nel senso del runbook dell'assistenza, che conta solo chi ha chiuso almeno un intervento nel periodo, con qualunque esito.

### Il Confronto

Serve il permesso «Confronto operatori», dato di base ad amministratori e pianificatori; come assegnarlo è nel capitolo 11, *Utenti, ruoli e permessi*. Il periodo di base è «Ultimi 30 giorni».

Per entrare nel confronto un operatore deve avere almeno 5 giornate di lavoro nel periodo, cioè giorni con almeno un esito eseguito o non fattibile. Gli altri finiscono in fondo, in grigio, con «N giornate · fuori dal confronto», e non pesano sulle mediane. Con «Oggi» non entra nessuno, e la pagina chiede un periodo più lungo.

Le colonne sono «Operatore», «Eseguiti» (con lo scarto dalla mediana), «Non fattibili» (quota e numero), «Int./giornata», «Foto/int.», «Min sul posto», «Km/giorno», «Ultimi 21 gg lav.» (sempre gli ultimi 21 giorni lavorativi, qualunque sia il periodo) e «Segnali». I segnali sono tre: «Non fattibili alti», «Pochi interventi», «Poche foto». Compaiono quando un valore esce dalla metà centrale della squadra, dal lato che merita uno sguardo; soglie fisse non ce ne sono. Servono almeno 4 operatori nel confronto, altrimenti i numeri restano affiancati ma i segnali tacciono. Stare sopra la squadra per interventi o foto non è mai un segnale. Ogni segnale ha la sua frase, con valore, mediana e fascia.

Tempo sul posto e km diventano «non misurabile» quando i dati non reggono. Per il tempo: nessuna fonte, meno di 30 interventi misurati nella squadra, oppure, con la stima dalle foto, una mediana sotto il minuto tra la prima e l'ultima foto. Per il singolo operatore il tempo compare solo con almeno 5 misure. Per i km: la commessa non registra le posizioni, oppure le hanno mandate meno della metà degli operatori. Il dettaglio di una riga mostra le barre dei 21 giorni, i numeri accanto alla mediana e i «Motivi dei non fattibili», dal più frequente, con «Non indicato» in fondo; gli esiti registrati con l'app precedente il motivo non lo hanno.

### Leggere un segnale

Una lettura inventata, per vedere come si usa. In una squadra di sei operatori, uno porta il segnale «Non fattibili alti». Nel dettaglio quasi tutti i motivi sono di utente assente, e i suoi interventi cadono quasi tutti nella stessa zona. La conversazione da fare riguarda la zona e gli appuntamenti, non l'operatore.

Ed è la risposta al dubbio che il segnale fa nascere: «Il Confronto segna Non fattibili alti: l'operatore lavora male?». Da solo, no. Il segnale dice che la sua quota sta sopra la metà centrale della squadra in quel periodo; zone e liste cambiano, e i motivi stanno nel dettaglio. La legenda della pagina lo scrive: niente podio, niente voto, e un operatore con pochi interventi può avere zone difficili.

I limiti. Il tempo sul posto oggi è una stima: il 13 novembre 2026, sulle tre commesse verificate, inizio e fine dell'esecuzione erano sempre vuoti, e il server non li salva. La «Qualità foto» esiste solo dove è attiva l'analisi delle foto (vedi il capitolo 6). I km esistono solo dove la commessa registra le posizioni dei telefoni. Il Confronto è recente (GOP-873, 24 novembre 2026) ed è stato provato solo su dati inventati, in un banco locale, non sui dati reali di una commessa. E i profili che una commessa aveva personalizzato prima del rilascio potrebbero non avere il nuovo permesso.

> **Per gli sviluppatori:** `pages/operatori.php?action=dashboard|confronto`; `lib/OperatoriDashboard.php`, `lib/OperatoriConfronto.php` (`GIORNATE_MIN`); le tabelle facoltative si controllano con `SHOW TABLES` perché una tabella assente tornerebbe vuota e sembrerebbe zero; ADR 53 e 54.

La regola di questa sezione: un segnale del Confronto apre una domanda sulla zona e sui motivi, non un giudizio sull'operatore.

La regola del capitolo sta invece in una sola colonna della Dashboard, «Ultimo invio». Il pianificatore del caso d'apertura, a mezzogiorno, l'avrebbe trovata ferma al primo mattino, e avrebbe saputo che il telefono teneva una parte della giornata che l'ufficio non vedeva. Prima di spostare, verificare o cancellare gli interventi di oggi di un operatore, o di disabilitarne il telefono, guardate quella colonna. Se è più vecchia del lavoro che state per toccare, la prima mossa è chiedere all'operatore, non cambiare il Piano.

## Fonti

- codice: `pages/dispositivi.php`, `Smarty_templates/it/dispositivi.html`, `js/code/dispositivi.js`, `lib/flexifields_defaults.php`
- codice: `lib/MobileV3/Device/OfficeDevices.php`, `lib/MobileV3/Device/PermessiView.php`
- codice: `js/code/operatori_scheda.js`, `lib/JSONController.php`
- codice: `lib/AndroidController.php`, `lib/MobileV3/Bridge/LegacyInterventi.php`, `lib/MobileV3/Domain/FinestraInterventi.php`
- codice: `pages/impostazioni.php`, `Smarty_templates/it/impostazioni.html`
- codice: `lib/MobileV3/Domain/EsitoCatalog.php`, `lib/MobileV3/Domain/EsitoWriter.php`, `lib/PosizioneChiusura.php`
- codice: `lib/MobileV3/ApiError.php`, `lib/MobileV3/Response.php`, `lib/MobileV3/Kernel.php`
- codice: `lib/MobileV3/Push/EventCatalog.php`, `lib/MobileV3/Push/CommandApprovals.php`, `lib/MobileV3/Push/CommandStore.php`, `lib/MobileV3/Push/EventSender.php`, `lib/OperazioniComandi.php`, `lib/OperazioneComando.php`
- codice: `lib/MobileV3/Update/UpdateCatalog.php`, `scarica_app.php`, `Smarty_templates/it/login_new.html`
- codice: `pages/operatori.php`, `lib/OperatoriDashboard.php`, `lib/OperatoriDashboardController.php`, `js/code/operatori_dashboard.js`, `lib/OperatoriConfronto.php`, `lib/OperatoriConfrontoController.php`, `js/code/operatori_confronto.js`, `lib/CatalogoPermessi.php`
- docs: `docs/mobile-v3/abbinamento.md`, `docs/mobile-v3/bootstrap-interventi.md`, `docs/mobile-v3/storico-foto.md`
- docs: `docs/mobile-v3/esito-write.md`, `docs/mobile-v3/foto-upload.md`, `docs/mobile-v3/firma.md`, `docs/mobile-v3/envelope.md`
- docs: `docs/mobile-v3/posizioni.md`, `docs/mobile-v3/device.md`, `docs/mobile-v3/dispositivo-permessi.md`
- docs: `docs/mobile-v3/segnalazioni.md`, `docs/mobile-v3/segnalazioni-operatori.md`, `docs/mobile-v3/anomalie.md`, `docs/mobile-v3/heartbeat.md`
- docs: `docs/mobile-v3/comandi-remoti.md`, `docs/mobile-v3/push.md`, `docs/mobile-v3/aggiornamento.md`
- docs: `docs/02-patterns/42-motore-unico-operazioni-console-api-mcp.md`, `docs/02-patterns/53-operatori-dashboard.md`, `docs/02-patterns/54-operatori-confronto.md`
- docs: `changeset/2026-11-24-gop-873-confronto-operatori.md`
- wiki: `wiki/assistenza-clienti/runbook-problemi-app-operatori.md`, `wiki/assistenza-clienti/runbook-dove-si-e-fermato-il-dato.md`, `wiki/assistenza-clienti/pagina-admin-errori-app-e-log.md`, `wiki/assistenza-clienti/sezione-ticket.md`, `wiki/assistenza-clienti/pagina-operatori-confronto.md`, `wiki/assistenza-clienti/runbook-operatori-attivi.md`
- Portolano: `goplanner-grill-g3-blocco-ora-posizione-2026-11-25`
- Jira: GOP-407 — aggiornamenti firmati dell'app
- Jira: GOP-449 — firma
- Jira: GOP-455 — riabbinamento dopo reinstallazione
- Jira: GOP-560 — Le mie segnalazioni
- Jira: GOP-621 — posizione con l'esito
- Jira: GOP-695 — Scritta sulle foto
- Jira: GOP-784 — comandi remoti
- Jira: GOP-787 — approvazione dei comandi remoti
- Jira: GOP-873 — Confronto operatori
