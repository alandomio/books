# 3. Utenze, liste, pratiche, lotti e carichi

*In questo capitolo si vede che cosa diventa un file del committente dentro GOPlanner, perché lo stesso oggetto ha due nomi in pagine diverse, da dove viene lo stato che si legge su un'utenza e quali dati in più può avere una commessa. È per tutti; i riquadri «Per gli sviluppatori» si possono saltare.*

## Dal file del committente all'intervento: quattro oggetti e due etichette

Il committente manda un file. Per esempio un file di letture di 1.200 righe, che l'ufficio importa in una lista chiamata *Letture marzo* (numero e nome sono inventati). Un'ora dopo qualcuno chiede «quante utenze abbiamo caricato?», e la risposta non è per forza 1.200. Per capire perché, bisogna sapere quali oggetti nascono dall'importazione e come stanno l'uno dentro l'altro.

Il primo oggetto è la lista. Il glossario di GOPlanner la definisce così: «un gruppo di utenze arrivato con un'importazione o creato a mano. Ha un nome, un lotto e una scadenza.» File › Importazione chiede ogni volta dove mettere le righe: in una «lista nuova» o in una «lista esistente», scelta apposta fra quelle aperte. Non le aggiunge mai in silenzio a una lista che ha lo stesso nome di file. Nell'esempio *Letture marzo* è una lista nuova, e nasce come oggetto a sé, con il suo nome, il suo lotto, la sua scadenza.

Dentro la lista ci sono le pratiche. Una pratica è «un'utenza dentro una lista», e la stessa utenza può stare in più liste. Ogni riga accettata del file diventa una pratica. Non tutte le righe vengono accettate: una riga senza codice, con un codice già visto più in alto nello stesso file o rifiutata dalle regole della commessa si scarta e finisce nel resoconto con il suo motivo. Un errore su una riga non ferma le altre.

Dietro ogni pratica c'è un'utenza: «il punto in cui si va a lavorare: un indirizzo con il suo contatore e il nominativo dell'intestatario». Qui sta la risposta alla domanda di prima. File › Importazione riconosce un'utenza per codice, su tutta la commessa, e decide che cosa fare guardando la pratica che quel codice ha già:

- codice mai visto: nasce un'utenza nuova;
- pratica aperta e senza appuntamento: GOPlanner riusa la stessa utenza, aggiorna i dati con i valori pieni del file e la porta nella lista nuova;
- pratica con un appuntamento ancora da svolgere: l'appuntamento resta com'è e si aggiornano solo le note;
- pratica conclusa (eseguita, non fattibile, controllata, inviata o annullata): si crea una pratica nuova con lo stesso codice, e lo storico della vecchia resta.

Il file di 1.200 righe produce dunque 1.200 pratiche al massimo, meno gli scarti, e un numero di utenze nuove che dipende da quanti codici erano già presenti nella commessa. L'Importazione classica non segue queste regole: ha le sue caselle per i duplicati (capitolo 4).

Ultimo oggetto: l'intervento, «un lavoro da fare in un'utenza, assegnato a un operatore per un giorno». Subito dopo l'importazione *Letture marzo* non ha nessun intervento. Gli interventi nascono con la pianificazione (capitolo 5). Lotto e distretto, invece, non sono contenitori: sono etichette scritte sulla lista. Il lotto dice a quale parte della commessa appartiene; il distretto dice in quale zona del committente si trova.

| Oggetto | Che cos'è (glossario) | Dove si vede |
|---|---|---|
| Utenza | Il punto in cui si va a lavorare: indirizzo, contatore, intestatario | Menu «Clienti» |
| Lista | Un gruppo di utenze arrivato con un'importazione o creato a mano | Interventi › «Carichi»; filtro «Lista» in «Clienti»; «lista nuova / lista esistente» in File › Importazione |
| Pratica | Un'utenza dentro una lista | Dentro la lista: è l'unità con cui «Carichi» conta l'avanzamento |
| Lotto | La parte di commessa o di contratto a cui appartiene una lista | Interventi › «Lotti» |
| Distretto | Una zona del committente indicata sulla lista | Colonna «Distretto» della lista |
| Intervento | Un lavoro da fare in un'utenza, assegnato a un operatore per un giorno | Menu Interventi (capitolo 6) |

La regola che regge tutto il capitolo è una sola. Un intervento appartiene a una pratica, cioè a un'utenza dentro una lista: porta con sé sia la lista sia l'utenza. Per questo la stessa utenza, se compare in due liste, può avere due interventi, uno per lista. Da questa regola dipendono la tendina del Piano della sezione 4 e lo stato «assegnato» della sezione 5.

> **Per gli sviluppatori:** lista = una riga di `carichi` (`CaricoBase::$table`); pratica = una riga di `carichi_righe` con `id_carico` e `id_utenza`; utenza = una riga di `utenti` (`UtenzaBase::$table = 'utenti'`), non di `utenze`; intervento = una riga di `interventi`, che porta `id_carico` e `id_utenza` (entrambi NOT NULL). `VistaTendinaListe` e `AvanzamentoCarichi` uniscono interventi e pratiche su tutte e due le chiavi. Attenzione: `docs/01-foundations/07-database-schema.md` e `docs/00-concept-index.md` chiamano `utenze` la tabella principale. È sbagliato: `utenze` esiste in `db.sql`, con un tracciato vecchio, ed è letta solo da percorsi vecchi (per esempio i conteggi della griglia dell'Importazione classica). Il lotto è il numero `carichi.lotto` (da −128 a 127), con il nome nell'anagrafica `lotti` del DB master; il distretto è `carichi.distretto`. Schema completo nel capitolo 14.

La catena utenza › pratica › lista › intervento è codice comune; le pagine che la mostrano no. Cambiano da commessa a commessa: voci di menu spente, colonne in più o in meno, pulsanti assenti. Anche la regola «si riconosce per codice» è quella comune, non universale: al 25 novembre 2026, 49 commesse hanno una propria versione del riconoscimento dell'utenza. Come una commessa si discosta dal codice comune è il tema del capitolo 2.

Il file del committente non diventa «1.200 utenze». Diventa una lista, le sue pratiche e un certo numero di utenze, nuove o ritrovate. Gli interventi arrivano dopo, con la pianificazione.

## L'utenza: il punto in cui si lavora

*Per l'ufficio, con un riquadro per lo staff tecnico.*

La voce di menu si chiama «Clienti». Dentro però non ci sono clienti: ci sono utenze. Chi impara GOPlanner a voce si porta dietro la parola sbagliata e poi la usa per cose diverse, il committente, l'intestatario, la lista. In questa guida «Clienti» è solo l'etichetta del menu; l'oggetto si chiama utenza.

Un'utenza è il punto in cui si va a lavorare. Ha un indirizzo, un contatore con la sua matricola, l'intestatario, le coordinate che la mettono sulla mappa, un codice e uno stato. Il codice è la chiave che conta di più per l'ufficio. Quando il committente manda di nuovo un file con la stessa utenza, è il codice a dire a GOPlanner che quella pratica c'è già, e quindi se aggiornarla, lasciarla com'è o crearne una nuova. Le regole sui duplicati sono nel capitolo 4, *Importazione*.

La voce «Clienti» compare solo a chi ha il permesso «Vedere le utenze». Il menu a sinistra della pagina ha quattro voci: «Lista», che è l'elenco delle utenze e la vista di apertura, «Geocodifica», «Mappa» e «Modifica indirizzi». Ognuna può essere spenta per commessa. Il gruppo «Clienti» dell'area Admin (Account, Carichi, Stato commesse) è un'altra pagina e non va confuso con questo menu.

Per aprire la scheda di un'utenza:

1. Aprite «Clienti» › «Lista».
2. Nella casella «Cerca» scegliete dalla tendina il campo su cui cercare.
3. Scrivete il valore e premete Invio.
4. Fate doppio clic sulla riga dell'utenza (oppure selezionatela e premete Invio o Spazio).

Si apre la finestra «Riepilogo dati utenza». Il doppio clic è il modo sicuro di aprirla.

Nella finestra, a sinistra, ci sono i dati chiave con queste etichette: «PDR», «Matricola», «Lotto», «Carico», «Prossimo intervento». Due di queste non parlano dell'utenza ma della sua lista. «Lotto» mostra il nome del lotto se c'è, altrimenti il numero; «Carico» mostra il nome della lista della pratica. È la prima volta che si incontra la parola «carico» al posto di «lista», e non sarà l'ultima: la sezione 3 spiega perché. A destra ci sono le schede «Mappa», «Interventi» (con il numero), «Foto» (con il numero), «Rapporti» e «Storico». La scheda «Interventi» è quella da aprire quando lo stato dell'utenza non torna, come si vede nella sezione 5.

La griglia ha anche una colonna «Geocodifica», che dice quanto è affidabile la posizione dell'utenza sulla mappa. Gli stati possibili sono:

- Da geocodificare
- Al civico
- Verificata
- Approssimata
- Fuori comune
- Non trovata
- Approssimata accettata
- Fuori comune accettata

Un'etichetta «AI» accanto indica che l'indirizzo è stato corretto dall'AI. Qui conta solo come dato dell'utenza; il lavoro di geocodifica è nei capitoli 4 e 5. Dove la commessa ha il dato, un'utenza può anche portare l'etichetta «Non chiamare»: nella scheda compare una striscia con «Togli il segno», per chi può modificare le utenze. Sulle commesse che non hanno questo dato la striscia non c'è.

Una domanda torna spesso: «Lo stesso contatore compare due volte in Clienti: è un errore?» Non per forza. Dalla sezione 1 si sa che una pratica conclusa, reimportata, crea una nuova utenza con lo stesso codice: lo storico della vecchia resta separato, e il risultato è un codice utenza ripetuto. È una delle origini dei doppioni, ed è prevista dalle regole dell'importazione. Per riunirli esiste uno strumento, «Consolida utenze», che però non è dell'ufficio.

> **Quando chiedere allo staff tecnico:** se la stessa utenza compare più volte e le pratiche si confondono, chiedete il consolidamento allo staff tecnico, indicando il codice. L'ufficio non lancia «Consolida utenze» da solo: lo strumento è del personale GOPlanner e i suoi lavori non tornano indietro.

> **Per lo staff tecnico:** «Consolida utenze» sta nel menu Admin, gruppo Strumenti. Per ogni codice crea un'utenza che unisce i valori non vuoti di tutte le utenze con quel codice, ci sposta sopra interventi, esiti, pratiche e foto, e cancella le utenze vecchie. Si lancia su al massimo 500 codici per volta (il valore proposto è 50) e prima di partire chiede conferma con un testo del tipo «Verranno consolidati N codici utenza (su M duplicati ancora da consolidare)». I lavori partono in coda e non si possono annullare.

La pagina «Clienti» non è uguale in tutte le commesse. Colonne, campi di ricerca, filtri e pulsanti cambiano: in alcune mancano «Excel» o «Assegna». Alcune scritte possono comparire in inglese. Ed «Elimina» cancella davvero l'utenza. Chiede conferma, con il titolo «Cancella i clienti» e il testo «Sei sicuro di voler cancellare i clienti selezionati? L'operazione non è reversibile.», ed è legato al permesso «Eliminare le utenze», che il catalogo dei permessi segna come sensibile. È un'azione rara, e dopo la conferma non c'è rimedio dall'interfaccia.

L'utenza è il posto fisico; il codice è il modo in cui GOPlanner la riconosce. Lista, lotto e stato le arrivano dalle pratiche e dagli interventi.

## Lista e pratica: il lavoro che arriva con un file

*Per l'ufficio; il riquadro per gli sviluppatori si può saltare.*

La lista ha due nomi. Il glossario la chiama lista, File › Importazione dice «lista nuova» e «lista esistente», il filtro di «Clienti» si chiama «Lista». Ma la pagina che elenca le liste si chiama «Carichi», il pulsante che ne chiude una si chiama «Chiudi carico» e la scheda per modificarla si chiama «Modifica carico». Nel dizionario dell'interfaccia l'inglese *Batch* è tradotto «Carico». Chi cerca «la lista» nel menu trova la voce «Lista» di Interventi, la apre e vede interventi. La conclusione sbagliata è che la lista non ci sia. C'è: si chiama «Carichi».

In questa guida si dice sempre «lista». «Carico» compare solo dentro le etichette dell'interfaccia, tra virgolette, e nei nomi del codice.

I dati di una lista si leggono e si correggono in «Modifica carico»: «Nome file», «Cliente», «Nome cliente», «Distretto», «Scadenza», «Lotto», «Tipo carico» e «Stato». Lo stato vale «aperto» o «chiuso» ed è solo da leggere. Due di queste etichette ingannano. Il campo «Cliente» non contiene il committente. Nelle liste create con File › Importazione contiene il nome della lista, quello scritto in «lista nuova», al massimo 50 caratteri. Nell'Importazione classica la stessa colonna si intitola infatti «Lista». Il committente, quando c'è, sta in «Nome cliente». Un «Cliente» vuoto sembra un dettaglio. Non lo è: la sezione 4 mostra che basta a far sparire la lista dalla pianificazione.

«Tipo carico» è una tendina con le voci A4, B3, Cassettinaggio, CRZ e «Lettura aperiodica MIS», più la voce vuota. Le voci sono le stesse in tutte le commesse, ma il campo è testo libero fino a 50 caratteri: un valore fuori elenco già salvato sulla lista, per esempio arrivato con l'importazione, compare nella tendina accanto alle voci fisse e non si perde al salvataggio. Data di importazione e numero di interventi, invece, non si modificano: «Modifica carico» non ha quei campi.

La pratica è ciò che la lista aggiunge all'utenza. Un'utenza da sola è un indirizzo; la stessa utenza dentro *Letture marzo* è un lavoro di quella lista, con quella scadenza e quel lotto. La pratica è anche l'unità con cui GOPlanner misura l'avanzamento: «Carichi» conta le pratiche, mai le righe del file. Il totale è il numero di pratiche distinte della lista meno quelle che hanno soltanto interventi annullati. Le pratiche non fattibili e ripianificabili restano nel totale e si vedono in colonne a parte.

Ecco come le etichette dell'interfaccia corrispondono agli oggetti del glossario:

| Etichetta nell'interfaccia | Dove si trova | Oggetto |
|---|---|---|
| «Carichi» | Menu a sinistra di Interventi | L'elenco delle liste |
| «Modifica carico» | Dettaglio di una lista in «Carichi» | La scheda dei dati di una lista |
| «Chiudi carico» | Pulsante di «Carichi» | Chiude una lista |
| «Valore nel carico» | Interventi › «Lotti» | Il numero del lotto scritto su ogni lista |
| «Carico» | Scheda dell'utenza | Il nome della lista della pratica |
| Colonna «Cliente» | Griglia «Carichi» | Il nome della lista, non il committente |
| Filtro «Lista» | «Clienti» | Una lista |
| «Lista» | Menu a sinistra di Interventi | L'elenco degli interventi, non una lista |
| «Lista» | Menu a sinistra di «Clienti» | L'elenco delle utenze |
| «lista nuova / lista esistente» | File › Importazione | Una lista |
| «carichi» e «lotti» del magazzino | Permesso «Vedere il magazzino» | Altro significato: il magazzino (capitolo 9) |

Per vedere a che punto è una lista:

1. Aprite Interventi › «Carichi».
2. Nel filtro «Stato» scegliete «Tutti», «Aperto» o «Chiuso».
3. Cercate la lista per «Nome file» (ricerca predefinita), «Cliente» o «Nome cliente».
4. Fate doppio clic sulla riga della lista.
5. Leggete le schede delle fasi: «Assegnati a operatore», «Eseguiti», «Completati», ciascuna con «su N pratiche» e la percentuale.
6. Aprite «Operatori del carico» per vedere, operatore per operatore, le pratiche assegnate, eseguite e completate.
7. Premete «Elenco carichi» per tornare all'elenco.

Nell'elenco l'ordine è per ID decrescente: le liste più recenti sono in alto. Le colonne mostrano anche «Non fattibili», «Ripianificabili» e «Completamento» in percento. Solo le commesse con il modulo Zone hanno in più la fase «Assegnati a zona» e la sezione «Zone e operatori del carico»; al 25 novembre 2026 le commesse con quel modulo sono due. Se i dati non arrivano, il dettaglio mostra «Avanzamento non disponibile».

Le fasi contano cose precise. «Assegnati a operatore» conta le pratiche con un intervento non annullato che ha un operatore, o già eseguito; le prenotazioni a fasce senza operatore non contano. «Eseguiti» conta le pratiche eseguite, controllate o inviate. «Completati» dipende da un'impostazione della commessa, in Impostazioni › Generale, sezione «Carichi», campo «Una pratica è completata quando è». Con «Verificata (controllata o inviata)», la scelta predefinita, contano le pratiche controllate e quelle inviate; con «Inviata o esportata» contano solo le inviate. L'impostazione vale per tutta la commessa e la vede chi ha il permesso «Modificare le impostazioni». Verifica ed esportazione sono nei capitoli 6 e 7.

Prima o poi una lista finisce. Il modo previsto per chiuderla è «Chiudi carico».

> **Attenzione:** «Chiudi carico» chiede conferma con il testo «Chiudere il carico selezionato?» e un pulsante rosso «Chiudi carico». Dopo la conferma: gli interventi della lista che non sono ancora stati eseguiti vengono cancellati; gli interventi eseguiti restano, con i loro esiti e le loro foto; ogni operatore che aveva interventi sulla lista riceve una notifica; la lista passa a «chiuso». Non c'è un pulsante per riaprirla. Senza una riga selezionata il pulsante non fa nulla.

«Ho chiuso la lista per sbaglio: posso riaprirla?» No. Nel codice non esiste un'azione che riporti una lista a «aperto», e la pagina non ha un pulsante per farlo. Ciò che resta è il lavoro registrato: interventi eseguiti, esiti, foto. Ciò che si è perso sono gli interventi non ancora eseguiti, cancellati al momento della chiusura. Le utenze di quelle pratiche non si perdono. Prima di premere, quindi, la domanda giusta è una sola: ci sono ancora interventi aperti che qualcuno dovrà fare?

Leggere e modificare le liste sono due permessi diversi. Chi non ha quello di modifica può premere «Salva» in «Modifica carico», o «Chiudi carico», e non vedere niente: il server rifiuta, la pagina non mostra un messaggio chiaro, il salvataggio o la chiusura non avvengono. Se dopo un salvataggio i dati sono ancora quelli vecchi, il primo sospetto è il permesso. C'è poi l'elenco «Liste» dell'Importazione classica, dentro File: è un'altra griglia sulle stesse liste, con alcune intestazioni ancora in inglese (Completion, Executed). I suoi numeri si calcolano in un altro modo e non coincidono per costruzione con quelli di «Carichi». Per l'avanzamento vale «Carichi».

> **Per gli sviluppatori:** `lib/AvanzamentoCarichi.php` è l'unica fonte dei numeri dell'elenco e del dettaglio (GOP-640). Gli stati di chiusura si leggono da `interventi_eseguiti.stato_id`, non da `interventi.stato_id`: l'invio (stato 7) lo scrivono gli esportatori solo in `interventi_eseguiti`, e `interventi.stato_id` resta indietro. L'avanzamento non legge `utenti.stato_id`. L'impostazione è la chiave `carichi_completati_da` (`verificati` o `inviati`; qualunque altro valore vale `verificati`). La chiusura è `JSONController::chiudi_carico`, che non chiama `updateStatoUtenza`. Rimando al capitolo 14.

Una lista resta una lista anche quando l'etichetta dice «carico». E l'unità che «Carichi» conta è la pratica, non la riga del file.

## Lotto e distretto: come si divide il lavoro, e perché una lista non si vede

*Per l'ufficio; la creazione dei lotti è per gli amministratori. La sottosezione di diagnosi è anche per lo staff tecnico.*

Il lotto decide chi vede che cosa. Secondo il glossario è «la parte di commessa o di contratto a cui appartiene una lista», e chi ha dei lotti assegnati vede solo le liste di quei lotti. Un lotto sbagliato su una lista non produce un errore: produce una lista che qualcuno non vede.

Un lotto è un nome legato a un numero. Il numero si chiama «Valore nel carico»: è un intero da −128 a 127, unico nella commessa. Sotto il campo la pagina scrive «Valore salvato in carichi.lotto», e quella nota dice la cosa che conta. La lista porta il numero, non il nome. Il nome sta nell'anagrafica dei lotti e serve alle persone; il numero sta sulla lista e serve a GOPlanner.

Per creare un lotto:

1. Aprite Interventi › «Lotti».
2. Premete «Aggiungi».
3. Scrivete il «Nome» (obbligatorio, al massimo 100 caratteri).
4. Controllate la «Commessa»: è già scelta la vostra.
5. Scrivete il «Valore nel carico»: un intero non ancora usato nella commessa.
6. Lasciate spuntato «Attivo» se il lotto deve comparire nelle tendine.
7. Premete «Salva».

Se manca un dato o il valore è già usato, un avviso lo dice e il lotto non si salva. I messaggi sono, per esempio, «Il nome del lotto e obbligatorio.» o «Esiste gia un lotto con questo valore per il tenant.» (scritti così nel codice, senza accenti). Il pulsante per modificare un lotto si chiama ancora «Edit».

Le tendine «Lotto» del gestionale seguono una regola di precedenza. Se la commessa ha almeno un lotto nell'anagrafica, attivo o no, valgono solo i lotti attivi dell'anagrafica. Altrimenti valgono i nomi configurati in precedenza per la commessa, e in mancanza anche di quelli i numeri già presenti sulle liste. La conseguenza è netta: una commessa che ha l'anagrafica e disattiva tutti i suoi lotti ottiene una tendina vuota. La migrazione all'anagrafica si fa commessa per commessa (GOP-227 è ancora aperto al 25 novembre 2026); per questo due commesse possono mostrare tendine costruite in modo diverso.

Sulla visibilità basta una frase: un utente senza nessun lotto assegnato vede tutti i lotti della commessa; il primo lotto assegnato lo limita a quello. Gli utenti di competenza sono nel capitolo 11.

> **Attenzione:** «Elimina» nella pagina «Lotti» non chiede conferma e non si annulla. Cancella il lotto dall'anagrafica e toglie le assegnazioni di quel lotto agli utenti; chi resta senza lotti torna a vedere tutto. Le liste non vengono cancellate: conservano il loro numero. Se volete solo togliere un lotto dalle tendine, l'alternativa sicura è togliere la spunta «Attivo». Anche cambiare il «Valore nel carico» di un lotto esistente ha un effetto che non si vede subito: le liste già importate conservano il vecchio numero e si staccano dal lotto. Cambiate il valore solo se nessuna lista lo usa.

Il distretto è un'altra cosa. Il glossario lo definisce «una zona del committente (un comune, un'area) indicata sulla lista»; nel vecchio modulo d'importazione il campo si chiamava «Comune». Sulla lista è testo di al massimo 30 caratteri. Dove la commessa ha i campi della pratica della nuova importazione (per ora una sola commessa, con la sua commessa di prova), il distretto può stare anche sulla singola pratica: vale quello della pratica, e quello della lista solo per le pratiche che non ne hanno uno. Il distretto della lista non viene copiato nelle pratiche. Il distretto non è la zona della pianificazione, che è del capitolo 5.

Il filtro «Distretto» di «Clienti» ha effetto sulla griglia solo per alcune commesse. Se lo scegliete e non cambia nulla, non è un guasto.

### Quando una lista non compare nella pianificazione

Il giorno della pianificazione l'ufficio apre Interventi › Pianificazione e cerca la lista nella tendina. Non c'è. In «Carichi» invece c'è, aperta, con le sue pratiche. «Ma se la lista c'è, perché non compare nel Piano?» Perché la tendina non mostra tutte le liste aperte. Mostra solo quelle che soddisfano insieme quattro condizioni, e non le ricalcola ogni volta: legge il risultato da una copia salvata. Ogni voce si presenta come «nome file, tipo carico (numero di utenze senza intervento)», in ordine dalla lista più recente: va cercata per nome file, non per il nome scritto in «Cliente».

Controllate nell'ordine:

1. **La lista è chiusa.** In «Carichi» la colonna «Stato» dice «chiuso». Una lista chiusa non torna nella tendina e non si riapre (sezione 3): per pianificare il lavoro rimasto serve una lista aperta, e come se ne prepara una è nel capitolo 4, *Importazione*.
2. **Il campo «Cliente» della lista è vuoto.** Aprite la lista in «Carichi» e premete «Modifica carico». Se «Cliente» è vuoto, scrivete il nome della lista e salvate. La lista entra nella tendina, ma solo quando scade la copia salvata (punto 5).
3. **L'utente ha lotti assegnati e la lista è di un altro lotto.** Confrontate il «Lotto» della lista con i lotti dell'utente. Il rimedio è assegnare il lotto all'utente o correggere il lotto della lista: lo fa un amministratore (capitolo 11). Se si corregge il lotto della lista, la lista ricompare solo alla scadenza della copia salvata (punto 5).
4. **La lista non ha più pratiche senza intervento.** Se tutte le pratiche hanno già un intervento, la lista è nascosta correttamente: non c'è niente da pianificare.
5. **La tendina legge una copia salvata che dura un'ora.** Il risultato della tendina resta valido 3600 secondi. La copia si rinnova prima solo se cambiano il numero di pratiche, il numero di interventi, l'ultimo intervento creato o il numero di liste aperte. Compilare «Cliente» o cambiare il lotto di una lista non tocca nessuno di questi numeri: la lista ricompare alla scadenza della copia. Per sapere quando scade, chiedete a Gea (sotto).

La copia salvata è la causa più sorprendente, e ha una storia. Il 15 ottobre 2026, in una commessa, l'ufficio cancellò 200 interventi di una lista e la lista sparì dalla tendina. Allora la copia dipendeva solo dal numero di pratiche, che la cancellazione degli interventi non cambiava: la lista restava nascosta fino a un'ora. Il rimedio immediato fu attendere la scadenza; la correzione nel codice (GOP-442, completata il 31 ottobre 2026) ha allargato l'impronta della copia a pratiche, interventi, ultimo intervento e liste aperte. Quello che resta, per costruzione, è il caso dei punti 2 e 3. In nessuno dei due si perdono dati: le utenze della lista restano.

Gea, l'assistente del gestionale (capitolo 10), fa gli stessi controlli in sola lettura: dice quale condizione manca, se la copia salvata esiste, se contiene la lista e quando scade.

> **Quando chiedere allo staff tecnico:** è passata un'ora, le quattro condizioni risultano vere e la lista manca ancora dalla tendina. Segnalatelo indicando la lista, l'ora e l'utente. Chiedete allo staff tecnico anche quando il salvataggio di un lotto risponde «Salvataggio non riuscito: anagrafica lotti non disponibile.»: l'anagrafica dei lotti non è disponibile per quella commessa.

Lotto e distretto dividono il lavoro in due modi diversi: il lotto per contratto e per persona, il distretto per luogo. Dei due, solo il lotto decide che cosa un utente vede.

## Lo stato di un'utenza: una copia dell'ultimo intervento toccato

*Per l'ufficio; il riquadro per gli sviluppatori si può saltare.*

L'operatore ha chiuso l'intervento con l'app. In ufficio, sulla stessa utenza, la colonna dello stato dice ancora «assegnato». Il primo pensiero è un problema di sincronizzazione; il secondo è far tornare l'operatore sul posto. Entrambi costano tempo, e non servono se il lavoro risulta già registrato. Lo stato dell'utenza non dice quello che sembra.

Lo stato, secondo il glossario, è il punto in cui si trova un'utenza o un intervento nel lavoro. Non va confuso con l'esito, che è il risultato che l'operatore registra con l'app (capitolo 6). GOPlanner usa dieci codici di stato:

| Codice | Nome | Che cosa significa |
|---|---|---|
| 1 | Importato | Da fare: è lo stato di una pratica nuova appena importata |
| 2 | Validato | Da fare: è anche lo stato a cui torna l'utenza quando si elimina il suo intervento |
| 3 | Assegnato | Da fare: l'intervento è affidato a un operatore |
| 4 | Eseguito | L'operatore ha chiuso l'intervento; conta fra gli «Eseguiti» di «Carichi» |
| 5 | Non fattibile | Chiuso senza poter fare il lavoro; in «Carichi» si conta a parte |
| 6 | Controllato | L'ufficio ha verificato l'esito |
| 7 | Inviato | L'esportazione lo ha mandato al committente |
| 8 | Ripianificabile | Da rimettere in pianificazione; in «Carichi» si conta a parte |
| 9 | Annullato | Annullato; una pratica con soli interventi annullati esce dal totale di «Carichi» |
| 10 | Prenotato | Da fare |

Dove un'etichetta passa dal dizionario dell'interfaccia può comparire `non_fattibile` con il trattino basso al posto di «Non fattibile». Esiste anche il codice 99, «utente assente»: è uno stato di esito dell'intervento eseguito, presente fra le costanti dell'utenza, ma non è fra i dieci della tabella. I passaggi da uno stato all'altro sono nel capitolo 6.

Lo stato dell'utenza non è un riassunto dei suoi interventi: è una copia. Ogni volta che l'ufficio compie un'azione su un intervento (lo assegna, lo pianifica, lo chiude, lo annulla), GOPlanner copia lo stato di quell'intervento sull'utenza, senza guardare gli altri. Le azioni dell'ufficio che fanno questa copia sono circa cinquanta, e anche l'esito che arriva dall'app fa la stessa copia. Sull'utenza vince l'ultimo intervento toccato, non quello che conta di più.

Finché un'utenza ha un solo intervento aperto alla volta, la copia coincide con la realtà. Il problema nasce con gli interventi multipli: un'impostazione della commessa che permette più interventi aperti sulla stessa utenza, per esempio su due liste diverse. Al 25 novembre 2026 sono 46 le configurazioni di commessa che la attivano. È una scelta voluta, non un difetto. Ma lì la copia può mostrare lo stato dell'intervento sbagliato. I documenti di progetto lo mostrano con un esempio: un'utenza con un intervento di luglio mai chiuso e uno di settembre eseguito mostra «assegnato» o «eseguito» a seconda di quale dei due l'ufficio ha toccato per ultimo.

«Ma l'operatore l'ha chiusa: perché l'utenza è ancora assegnata?» Perché, dopo l'esito, un'azione dell'ufficio ha toccato un altro intervento della stessa utenza, ancora aperto, e ne ha copiato lo stato. Il lavoro non è andato perso, se l'intervento chiuso dall'operatore risulta eseguito. Lo si controlla così:

1. Aprite la scheda dell'utenza («Clienti» › «Lista», doppio clic sulla riga).
2. Aprite la scheda «Interventi» a destra.
3. Scorrete le schede «Intervento #N».
4. Cercate un intervento chiuso: mostra «Eseguito» con la data, «Operatore», «Esito», «Carico» e «Note».
5. Se c'è, il lavoro è registrato. Premete «Apri» su quell'intervento per andare alla verifica.

Un intervento ancora aperto, invece, mostra «Appuntamento», «Operatore» e «Carico». Foto ed esito stanno sull'intervento eseguito, non sull'utenza: per questo vanno cercati lì.

La regola da ricordare: per far leggere «eseguito» a un'utenza con più interventi aperti, bisogna chiudere o annullare tutti gli interventi ancora aperti di quella utenza. Chiudere solo il più recente non basta.

Questo spiega anche una differenza di numeri. L'avanzamento di «Carichi» (sezione 3) non legge lo stato dell'utenza: conta pratiche ed esecuzioni. Il numero di utenze «assegnate» in «Clienti» e quello di «Eseguiti» in «Carichi» possono quindi non coincidere. Per sapere a che punto è una lista, conta «Carichi».

Né l'ufficio né Gea ricalcolano lo stato dell'utenza. Gea legge gli interventi e dice se uno è già eseguito, ma non corregge lo stato copiato (capitolo 10). Un lavoro di allineamento automatico degli stati è stato chiesto (GOP-641), ma al 25 novembre 2026 è ancora in corso e non è in produzione.

> **Per gli sviluppatori:** il punto principale che scrive `utenti.stato_id` da un intervento è `InterventoBase::updateStatoUtenza()` (`lib/InterventoBase.php:765`), un `UPDATE utenti SET stato_id = <stato dell'intervento>` che non guarda gli altri interventi; `ADMINController` lo chiama da 51 righe. Non è l'unico: scrivono `utenti.stato_id` anche `InterventoBase::allineaStatoAEsitoVerificato` (solo se non esiste un intervento più recente non annullato), `JSONController::elimina_intervento`, `cambia_stato` in `lib/json_functions.php`, gli annulli dell'importazione e l'auto-assegnazione di GOPlanner 3. L'impostazione si legge con `GOPlanner::hasInterventiMultipli()` (`$custom['interventi_multipli']`). Per sapere se esiste un intervento chiuso: `UtenzaBase::getUltimoInterventoChiuso()`. Un report che deve dire lo stato reale non deve fidarsi di `utenti.stato_id` quando gli interventi multipli sono attivi. Rimandi ai capitoli 6 e 14.

> **Quando chiedere allo staff tecnico:** nella scheda «Interventi» nessun intervento dell'utenza risulta eseguito, ma l'operatore dice di averlo chiuso. Non è più un problema di stato copiato: il dato si è fermato da qualche parte fra l'app e il gestionale. È il caso del capitolo 12, «dove si è fermato il dato».

Lo stato dell'utenza racconta l'ultimo intervento toccato, non il lavoro fatto. Il lavoro fatto si legge sugli interventi.

## I campi personalizzati: i dati in più di ogni commessa

*Per l'ufficio; il riquadro per gli sviluppatori si può saltare.*

Una commessa vuole una seconda lettura del contatore. Un'altra riceve dal committente una data di ultima lettura che GOPlanner, di suo, non ha. Il glossario chiama questi dati campi personalizzati: «un dato in più che una commessa raccoglie oltre a quelli comuni, per esempio una seconda lettura». Sotto lo stesso nome stanno però tre famiglie diverse, con regole diverse. Sapere a quale appartiene un dato dice chi lo scrive, dove ritrovarlo e che cosa non si può fare.

La prima famiglia sono i campi dell'intervento che l'operatore compila nell'app. Sono definiti per commessa, con un nome, un'etichetta e un tipo (testo, scelta da un elenco, codice a barre). Il modulo arriva al telefono quando l'operatore accede, e il valore si salva insieme all'esito dell'intervento. La seconda famiglia sono i campi in sola lettura: informazioni che GOPlanner calcola e manda all'app insieme all'intervento, perché l'operatore le veda, senza poterle modificare. La terza sono i campi nuovi creati dall'ufficio durante l'importazione, con il pulsante «+ Nuovo campo…» di File › Importazione: un dato del file del committente che diventa un dato della pratica. Nelle commesse che usano la Verifica unica (Rapporti › Verifica interventi), i campi della prima famiglia compaiono nella scheda sotto l'intestazione «Campi del cliente» (capitolo 6).

| Famiglia | Chi lo scrive | Dove si vede | Che cosa non si può fare |
|---|---|---|---|
| Campo dell'intervento | L'operatore, nell'app | Nell'app, con l'esito; nella Verifica interventi | Cambiarne nome, etichetta o tipo: la definizione è della commessa |
| Campo in sola lettura | GOPlanner, con un calcolo | Nell'app, insieme all'intervento | Modificarlo, né dall'app né dall'ufficio |
| Campo nuovo dell'importazione | L'ufficio, con «+ Nuovo campo…» | Griglia «Clienti», «Ricerca Avanzata», file Excel | Rinominarlo, cambiarne il tipo, toglierlo |

I campi nuovi sono quelli che l'ufficio crea da sé, e quindi quelli da conoscere meglio. Il passo dell'importazione è nel capitolo 4; qui interessa che cosa succede dopo. Il riquadro «Nuovo campo per la colonna X» chiede un «Nome» (al massimo 60 caratteri) e un «Tipo», fra Testo, Numero e Data, e si chiude con «Crea e mappa». Una volta creato, il campo compare in coda alla griglia «Clienti». Si ordina, si cerca, si filtra con la «Ricerca Avanzata» (per numeri e date anche maggiore, minore, tra) ed esce nel file Excel; la data si legge gg/mm/aaaa. Un valore del file che non è del tipo scelto resta vuoto e finisce fra gli avvisi del resoconto, per esempio «Valore non riconosciuto come data: «ieri»», ma la riga si importa lo stesso. Lo ha mostrato una prova dell'11 novembre 2026, con dati inventati: un campo «Data ultima lettura» di tipo data, un file di 6 righe, la parola «ieri» al posto di una data.

Lo stesso nome, senza distinguere maiuscole e accenti, è un campo solo. Se si prova a crearlo con un altro tipo, il messaggio è del tipo: «Esiste gia' un campo «X» di tipo numero: usalo, oppure scegli un altro nome.»

«Ho creato il campo con il nome sbagliato: posso cancellarlo o rinominarlo?» Dall'interfaccia no. Un campo nuovo non si rinomina, non cambia tipo e non si toglie: resta. Togliere un campo è una richiesta allo staff tecnico. La domanda va fatta prima di premere «Crea e mappa», non dopo: il nome e il tipo giusti, oppure un campo che c'è già.

Il limite principale è un numero: al massimo 30 campi nuovi per commessa. Il motivo è concreto. Ogni campo nuovo è un dato vero sulla pratica, e la pratica ha un limite di spazio; trenta campi lasciano margine a quelli che la pratica ha già. Oltre il tetto il messaggio è «Questo elenco ha gia' tanti campi: non si possono aggiungere altri campi nuovi. Usa un campo che c'e' gia' oppure contatta l'assistenza.» Non è un guasto. C'è poi un limite di visibilità. Il riquadro chiede anche «Dove si vede», con le voci «Scheda pratica» e «Scheda pratica e app», ma al 25 novembre 2026 la scelta si registra e non è ancora letta da nessuno: la scheda della pratica e l'app non mostrano i campi nuovi. Solo la griglia «Clienti» li mostra; la griglia degli interventi e le altre non li hanno. Il lavoro sui campi nuovi (GOP-770) è ancora in corso a quella data.

Quali campi personalizzati ha la propria commessa si può chiedere a Gea, che descrive la configurazione della commessa aperta: i campi dell'intervento con etichetta, tipo, obbligatorietà e ordine, le colonne delle viste, le mappature (capitolo 10). Cambiarli è lavoro dello staff tecnico, con il normale processo di configurazione.

> **Per gli sviluppatori:** i campi dell'intervento si definiscono in `Intervento::getCampiCustom()` della commessa (59 commesse lo ridefiniscono; la versione comune restituisce un elenco vuoto) e arrivano all'app da `$custom['mobile']['campi_custom']`: al login per l'app vecchia, nella sezione `campi` di `GET /v3/bootstrap` per GOPlanner 3. I valori stanno nella colonna JSON `servizi` di `interventi_eseguiti`. I campi in sola lettura sono i «Campi Extra» (`getCampiExtra`, espressione SQL, `generaSQLExtra`). Ogni campo nuovo è una colonna `extra_<nome>` di `carichi_righe`, con il nome deciso dal server, registrata in `campi_nuovi`; tipi `VARCHAR(255)`, `DECIMAL(18,4)`, `DATE`; tetto di 30 per commessa e 400 colonne per la tabella (`lib/ImportazioneCampoNuovo.php`). Mai più valori in `campi_extra`. Le griglie si dichiarano per commessa in `flexifields.php`. Rimando al capitolo 14.

Un campo personalizzato appartiene a un oggetto preciso: all'intervento se lo compila l'operatore, alla pratica se arriva con l'importazione. Lo stesso vale per ogni numero e ogni stato di questo capitolo, e i tre casi difficili lo mostrano. L'utenza «assegnata» della sezione 5 legge una copia scritta dall'ultima azione su un suo intervento, mentre il lavoro fatto sta sull'intervento eseguito. La lista assente dalla tendina della sezione 4 esiste in «Carichi», ma la tendina legge una copia che dura un'ora. Il campo nuovo che manca nell'app sta sulla pratica, e oggi solo la griglia «Clienti» lo legge. In nessuno dei tre casi il dato manca. Un numero, in GOPlanner, è vero per l'oggetto da cui viene letto e per il momento in cui è stato letto.

## Fonti

- docs: `CONTEXT.md`
- codice: `lib/CaricoBase.php`, `lib/CaricoRigaBase.php`, `lib/UtenzaBase.php`, `lib/Utenza.php`, `lib/InterventoBase.php`, `lib/db/db.sql`
- codice: `lib/ImportazioneEsecuzione.php`, `lib/ImportazioneReimportazione.php`, `lib/ImportazionePratica.php`, `lib/ImportazioneCampoNuovo.php`, `lib/ImportazioneMappatura.php`
- codice: `lib/AvanzamentoCarichi.php`, `lib/MenuInterventi.php`, `lib/JSONController.php`, `js/code/carichi.js`, `Smarty_templates/it/Carichi.html`, `Smarty_templates/it/impostazioni.html`
- codice: `lib/LottoService.php`, `lib/db/2026-09-02-gop227-lotti.sql`, `Smarty_templates/it/lotti.html`
- codice: `lib/VistaTendinaListe.php`, `lib/json_functions.php`
- codice: `lib/GOPlanner.php`, `lib/jobs/ConsolidaUtenzaJob.php`, `lib/CatalogoPermessi.php`, `lib/dict/lang_it.php`
- codice: `js/code/scheda_utenza.js`, `js/code/utenze_elenco.js`, `js/code/importazione.js`, `Smarty_templates/it/_footer.html`, `Smarty_templates/it/file.html`, `lib/MobileV3/Config/CampiProvider.php`
- codice: `lib/MobileV3/Domain/EsitoWriter.php`, `js/code/verifica_unica.js`
- wiki: `wiki/assistenza-clienti/pagina-clienti.md`, `wiki/assistenza-clienti/pagina-carichi.md`, `wiki/assistenza-clienti/pagina-lotti.md`, `wiki/assistenza-clienti/pagina-interventi-menu.md`, `wiki/assistenza-clienti/pagina-admin-manutenzione.md`, `wiki/assistenza-clienti/import-carico.md`, `wiki/assistenza-clienti/runbook-lista-assente-tendina-piano.md`, `wiki/assistenza-clienti/stato-utenza-assegnato-dopo-chiusura.md`, `wiki/assistenza-clienti/configurazione-tenant.md`
- docs: `docs/01-foundations/03-database-facts.md`, `docs/01-foundations/07-database-schema.md`, `docs/02-patterns/17-flexigrid-and-campicustom.md`, `docs/02-patterns/34-stato-utenza-derivato-ultimo-intervento.md`, `docs/02-patterns/35-lotti-entita-e-etichette-legacy.md`, `docs/02-patterns/43-avanzamento-carichi-fonte-stati.md`, `docs/02-patterns/51-campo-nuovo-colonna-di-carichi-righe.md`
- Jira: GOP-227 — Gestione lotti come entità
- Jira: GOP-442 — Copia della tendina liste
- Jira: GOP-480 — Importazione nuova REV.1
- Jira: GOP-582 — Lotti di competenza per utente
- Jira: GOP-640 — Carichi: elenco e impostazione Completati
- Jira: GOP-641 — Job di allineamento degli stati
- Jira: GOP-770 — Campo nuovo dell'importazione

<!-- WORD COUNT: ~6192 (dopo la revisione del 25/11/2026) -->
<!-- PERSONA CHECK: Pass — voce da Engineer + Scholar: etichette esatte tra «», codice in monospace, limiti e numeri con data e fonte, nessun «noi» o «io», procedure in seconda persona plurale. Tolte le chiusure di sezione a formula («quindi», «dunque») che si ripetevano e una generalizzazione senza fonte («nella maggior parte dei casi»). -->
<!-- NUF CHECK: 1 ✅ tabella etichetta → oggetto (11 righe, sez. 3) | 2 ✅ procedura «Carichi» + impostazione «Una pratica è completata quando è» | 3 ✅ elenco ordinato di 5 controlli con rimedio (sez. 4) | 4 ✅ caso, procedura scheda «Interventi», regola «chiudere o annullare tutti gli interventi aperti» | 5 ✅ tabella tre famiglie con Chi/Dove/Che cosa non si può fare | 6 ✅ riquadro Attenzione su «Elimina» lotto + liste che conservano il vecchio numero | 7 ✅ «Il lavoro non è andato perso, se…» + 3 riquadri «Quando chiedere allo staff tecnico» | 8 ⚠️ Chiudi carico, Elimina lotto, + Nuovo campo completi; «Elimina» utenza ha conseguenza e conferma ma nessuna alternativa (il dossier non ne riporta una) | 9 ✅ codici 1–10 in tabella, 99 in una frase | 10 ✅ riquadro sviluppatori sez. 1 (carichi, carichi_righe, utenti non utenze, carichi.lotto −128..127, carichi.distretto) | 11 ✅ 30 campi, Testo/Numero/Data, coda griglia «Clienti», non rinominabili né eliminabili, GOP-770 -->
<!-- ANTI-AI CHECK: Nessuna frase della lista vietata. «tenant» compare solo dentro un messaggio d'errore citato alla lettera dal codice. «Cliente»/«Nome cliente» solo come etichette dell'interfaccia. Quattro contro-obiezioni (sez. 2, 3, 4, 5, 6). Ogni sezione ha un paragrafo Limite e un dettaglio esatto. Chiusura: regola d'uso, non annuncio. Fonti: prefissi uniformati a «codice:» e percorsi wiki completi. Nessun dato personale, credenziale o host. -->
