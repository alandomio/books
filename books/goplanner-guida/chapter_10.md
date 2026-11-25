# 10. Gea, l'assistente di GOPlanner

*In questo capitolo si vede che cosa legge Gea per rispondere, come segue le istruzioni d'indagine scritte dallo staff tecnico e che cosa prepara: proposte di modifica, ticket, richieste di funzioni nuove. Si vede soprattutto dove si ferma: ogni modifica e ogni ticket partono da un pulsante premuto dall'utente, e quello che nessun pulsante può fare resta allo staff tecnico. È scritto per chi usa il gestionale; i riquadri per gli sviluppatori si possono saltare.*

## Chi è Gea, dove si apre e chi la vede

Il 22 novembre 2026, nella pagina di importazione, un utente ha chiesto a Gea spiegazioni su un errore che aveva davanti: «I modelli salvati non sono attivi per questo tenant». Gea ha aperto la guida della pagina File e ha risposto di non vedere nessun errore. Mancavano due cose. Nessuna istruzione scritta le diceva di leggere la schermata per quel tipo di domanda, e la lettura della schermata non comprendeva i messaggi mostrati dalla pagina. La correzione, lo stesso giorno, le ha aggiunte entrambe: la lettura ora riporta i messaggi di errore e di avviso, e una regola scritta impone di leggerla quando l'utente chiede di un messaggio che vede, anche dopo aver aperto una guida. Gea non può più dire di non vedere un errore senza aver letto la schermata.

Il caso riassume il capitolo. Gea fa quello che le sue istruzioni scritte e i suoi strumenti le permettono, né più né meno. Questo capitolo è l'elenco degli uni e degli altri.

Nel glossario di GOPlanner Gea è l'assistente virtuale del gestionale, nel pannello in basso a sinistra. Risponde nella commessa aperta nella sessione e solo per quella (capitolo 2), con i dati e i permessi di chi la sta usando.

### Aprire il pannello

1. In fondo al menu laterale sinistro, sotto i segnalibri dei lavori in background, premete «Assistente virtuale».
2. Si apre in basso a sinistra il pannello «Gea · assistente virtuale», con il saluto «Ciao [nome], sono Gea, l'assistente virtuale di GOPlanner». Il nome è solo il primo nome della persona, mai il cognome o il nome utente; se il nome registrato non è valido, il saluto resta «Ciao».
3. Scrivete nel campo «Scrivi un messaggio» e premete «Invia», oppure fate clic su uno dei suggerimenti della pagina.
4. Mentre Gea lavora, il pannello mostra i passi che sta facendo e il tempo trascorso. «Interrompi» ferma la risposta.
5. «Ingrandisci» allarga il pannello per leggere meglio; lo stesso pulsante diventa «Riduci» e lo riporta alla misura normale. La maniglia nell'angolo ridimensiona il pannello, e il doppio clic la ripristina. «Chiudi» (la ×) lo chiude.

I passi dell'attesa sono le etichette vere del lavoro in corso, come «Guardo le attività recenti» o «Confronto il file con il modello»: dicono dove sta cercando Gea.

Sotto il saluto c'è una riga: «Scrivi una domanda o parti da uno di questi suggerimenti.» I suggerimenti vengono da un elenco curato pagina per pagina. In Interventi › Lista, per esempio, uno dice «Perché non trovo un intervento vecchio nella lista», con la spiegazione breve «Si vedono solo gli ultimi 6 mesi». Una pagina che non ha una guida non mostra suggerimenti di ripiego: la riga diventa soltanto «Scrivi una domanda.».

Sotto ogni risposta c'è «Spiegamelo meglio». Chiede a Gea di rispiegare la stessa cosa con parole più semplici e più contesto, senza cambiare i fatti e senza aggiungere numeri nuovi.

Al primo accesso si apre da solo l'annuncio «Ti presentiamo Gea». «Ho capito» lo segna come letto per quella persona. Si può rileggere dalla campanella (gli annunci sono nel capitolo 12).

### Chi vede il pulsante

Il pulsante «Assistente virtuale» non lo vedono tutti. Servono due condizioni insieme: Gea deve essere accesa per la commessa, e l'utente deve essere un amministratore oppure un utente d'ufficio con accesso in scrittura. Un accesso in sola lettura non vede il pulsante. Nessun permesso dei profili apre o chiude Gea: conta solo il tipo di accesso (i profili e i permessi sono nel capitolo 11). In produzione c'è una terza condizione, già raccontata nel capitolo 2: Gea si accende solo se l'interruttore generale del servizio è acceso, e una commessa può spegnerla nella propria configurazione ma non accenderla se quell'interruttore è spento.

Gea è solo nel gestionale web: l'app GOPlanner 3 degli operatori non ha nessuna voce di Gea. Se un collega ha il pulsante e voi no, la causa è il vostro accesso (sola lettura, capitolo 11) oppure la commessa. Chiedete prima all'amministratore della commessa, poi allo staff tecnico.

> **Per gli sviluppatori:** chi legge per l'ufficio può saltare questo riquadro. `ChatbotAuth::visibile()` mostra il pulsante solo se `$custom['chatbot_enabled']` è vero e `ChatbotAuth::tipoAmmesso()` accetta `users.tipo` 0–2 (super-admin, Amministratore Cliente, back office scrittura; `TIPO_MASSIMO = 2`). L'interruttore di produzione è `ChatbotAuth::interruttoreAmbiente()`, letto in `config-docker.inc.php`. Il pulsante `#chatbot-toggle` sta in `#side-footer` di `Smarty_templates/it/_header.html`; il nome del saluto viene da `ChatbotAuth::nomeDiBattesimo()` (GOP-819). L'architettura del servizio è nel capitolo 15.

## Che cosa chiedere: domande, indagini e runbook

In ufficio molte risposte si ottengono chiedendo a chi c'era, e cambiano con la persona a cui si chiede. Quelle di Gea non cambiano solo dove Gea segue un'istruzione scritta.

Le domande a Gea sono di tre tipi. «Come si fa» chiede una procedura: Gea risponde dalle guide della pagina. «Che cosa è successo nei dati» chiede un'indagine: Gea legge i dati della commessa con i suoi strumenti, con i vostri lotti e la vostra visibilità. «Che cosa vuol dire questo messaggio» chiede di guardare lo schermo, ed è la sezione successiva.

Per le indagini Gea usa un runbook, cioè un'istruzione d'indagine scritta. È una pagina della wiki di assistenza, scritta per Gea, con parti fisse: Sintomi, Controlli, Cosa dire all'utente, Soluzione, Se non risolve, e l'elenco delle commesse a cui si applica. Gea sceglie dall'indice la guida che corrisponde ai sintomi e la apre per intero prima di rispondere o di usare altri strumenti. Poi esegue i controlli nell'ordine e risponde con quello che la guida indica. La regola vale sempre, anche quando un'altra istruzione nomina uno strumento da cui partire. All'utente Gea non nomina mai la guida né le sue pagine: ne vedete solo i controlli e le conclusioni. I runbook li scrive lo staff tecnico, e ognuno viene approvato prima della pubblicazione.

Il 25 novembre 2026 l'indice ne elenca 18, datati dal 26 ottobre al 24 novembre 2026. La tabella riporta i principali, con il capitolo della guida che spiega l'argomento per esteso.

| Sintomo detto dall'utente | Che cosa controlla Gea | Capitolo |
|---|---|---|
| La lista non compare nel Piano | la lista, le condizioni della tendina e la copia salvata, lo stato, le attività del giorno | 3, 5 |
| La lista è tutta da pianificare | lo stato della lista e le eliminazioni (quante, a che ora, da chi) | 5 |
| Non riesco ad assegnare le utenze | coordinate, utenza già assegnata, lista chiusa, operatore non valido | 5 |
| L'importazione ha perso righe | le ultime importazioni (righe, scarti e motivi, stato), poi i registri del file | 4 |
| Il file non è conforme | il file contro il modello, colonna per colonna | 4 |
| L'esportazione è vuota o fallita | le ultime esportazioni (stato, righe attese e prodotte, filtri), il file scaduto dopo 30 giorni | 7 |
| Problemi con l'app | tutti gli operatori della commessa in una sola volta | 8 |
| Quanti operatori sono attivi | chi ha chiuso almeno un intervento nel periodo | 8 |
| Perché ho visto un errore | il contesto della pagina, gli errori del server delle proprie richieste | 12 |
| Dove si è fermato il dato | dato non partito dal telefono, respinto o non salvato | 12 |
| Richiesta di una funzione nuova | la guida, le funzioni simili, poche domande, la scheda | 10 |
| Regola per l'AI delle foto | solo da Impostazioni › Analisi AI delle foto | 6, 10 |

Un esempio mostra una regola che sostituisce un'opinione. Alla domanda «quanti operatori sono attivi» ci sono tre risposte oneste: gli abilitati in anagrafica, chi ha interventi pianificati, chi ha lavorato. Il runbook ne sceglie una: «attivi sono gli operatori che hanno chiuso almeno un intervento nel periodo. Non il numero degli operatori abilitati in anagrafica e non quelli che hanno solo interventi pianificati.» Il periodo predefinito è oggi, e zero è una risposta valida. Due colleghi che fanno la stessa domanda ricevono la stessa definizione; il numero cambia solo con il periodo e con i lotti che ciascuno vede.

Per indagare Gea legge:

- le ultime importazioni, liste ed esportazioni, con l'utente, i conteggi e i motivi degli scarti (capitolo 4);
- la configurazione della commessa: campi personalizzati, colonne, mappature di importazione ed esportazione (capitolo 3);
- lo stato, la visibilità e i lotti di un operatore;
- le attività fatte nel gestionale: le proprie fino a 30 giorni; quelle dei colleghi fino a 7 giorni, 30 per gli amministratori;
- i registri delle pagine web, dell'app di campo e degli errori del server, fino a 7 giorni;
- gli errori del server delle richieste di chi chiede: gli ultimi 30 minuti, oppure l'ultimo giorno se l'utente le dà il codice di 8 caratteri che la pagina d'errore mostra. Gli errori dei colleghi no: il loro codice risulta «non trovato» (capitolo 12).

Anche il modo di rispondere è scritto. Gea dà numeri, orari in ora italiana, nomi di pagine e menu come a schermo. Per ogni conclusione dice quale verifica la sostiene e con quale grado di certezza, e quando è solo un'ipotesi. Dice quale registro ha letto, su quale periodo e con quale parola ha cercato. I refusi evidenti li corregge da sola («aoo» è «app»); chiede solo se due letture sono davvero plausibili: «Intendi l'app sul telefono?».

Sui colleghi c'è una regola precisa. Quello che ha fatto chi chiede è «hai…». Quello che hanno fatto gli altri è «un collega». Il nome lo riceve solo un amministratore della commessa che chiede espressamente chi è stato; se il nome non si trova, resta «un collega». Gli operatori dell'app restano con il loro nome.

Un dubbio ricorrente: «Gea mi ha detto che non ha trovato problemi: allora non c'è niente?». Non per forza. La regola di Gea dice che una singola ricerca ristretta, anche senza eventi, non permette mai di concludere che non esiste un problema. Per questo Gea deve dirvi quale registro ha letto e su quale periodo. Se la risposta parla di un solo operatore o di un'ora sola, chiedete di allargare il periodo, fino a 7 giorni per i registri, o di controllare tutti gli operatori della commessa. Resta un margine: un problema che non lascia tracce nei registri che Gea legge. Se il sintomo continua, si passa allo staff tecnico.

Gea ha anche limiti di metodo. Non propone mai query SQL e non vi chiede di eseguirne: i dati si leggono solo con i suoi strumenti. Quando la domanda esce da quello che le guide e gli strumenti coprono, dichiara il limite e non inventa informazioni specifiche della commessa. La regola più severa, «senza un runbook Gea spiega e basta», è decisa ma non è ancora in vigore (GOP-536, da completare al 25 novembre 2026): oggi vale la regola già scritta, cioè la guida prima di tutto e i suoi controlli nell'ordine. Ogni risposta ha poi un numero massimo di passi e di secondi. Quando li supera, la risposta si ferma con «Non sono riuscita a completare la diagnosi nel tempo previsto. Contatta lo staff.», oppure con «Non sono riuscita a completare la diagnosi. Contatta lo staff.» quando ha esaurito i passi.

> **Per gli sviluppatori:** i runbook sono `wiki/assistenza-clienti/runbook-*.md`, indicizzati in `wiki/index.md`; il `systemPrompt` di `chatbot-service/src/server.ts` impone di aprirli prima di ogni altro strumento. Gli strumenti che leggono i dati sono classi PHP in `lib/ChatbotRegistro.php` (`CLASSI`, 13 strumenti) dietro `JSONController`. Limiti per risposta: `CHATBOT_MAX_TOOL_ITERATIONS` 12 e `CHATBOT_TURN_DEADLINE_MS` 90.000 ms; in modalità indagine 12 chiamate e 60.000 ms. Un runbook nuovo è una pagina della wiki, non codice.

## Il contesto della pagina: che cosa Gea vede e che cosa può fare

Il caso del 22 novembre vale anche al contrario: Gea legge la schermata quando la domanda la riguarda, non per abitudine. Il resto del tempo sa soltanto dove siete.

### Che cosa arriva a ogni domanda

A ogni domanda il pannello manda a Gea pochi indizi leggeri: la pagina, la lista, l'operatore, la data, la finestra aperta (solo il suo identificativo, mai il testo) e quanti messaggi di errore o di avviso la pagina mostra (solo il numero). Insieme arriva l'elenco delle azioni che la pagina offre a Gea, che spesso è vuoto. Per Gea questi indizi servono a capire a che cosa si riferisce la domanda. Non sono una prova: le sue istruzioni le chiedono di verificarli con gli strumenti. Anche il numero degli avvisi, da solo, non è mai un motivo per leggere la pagina.

### Quando Gea legge la schermata

Gea legge la schermata solo quando la domanda riguarda ciò che state guardando: «questo errore», «perché non salva», il record aperto. Se chiedete di un messaggio che vedete e la schermata non ne contiene, Gea lo dice e vi chiede di riportarle il testo. La lettura comprende:

- i campi del record o della finestra aperta, compresi i valori non ancora salvati;
- i filtri attivi;
- la tabella, con il totale e al massimo 50 righe visibili;
- i messaggi di errore e di avviso mostrati, al massimo 10;
- gli ultimi errori della pagina, al massimo 10.

Il pannello legge al massimo 60 campi, e l'intera lettura si ferma a 48 KB. Non legge mai le password, i campi nascosti, i campi per i codici monouso e le parti della pagina che il gestionale segna come escluse. Dopo la lettura, il servizio toglie di nuovo, per nome ed etichetta, i campi che somigliano a password, token, segreti, chiavi, PIN o codici monouso, nel caso che uno sia passato.

Le foto non sono mai nella lettura della schermata. Dove la lettura delle foto è attiva, Gea guarda una foto solo se l'utente chiede di quella foto precisa, una alla volta e ridotta; senza il numero della foto dà soltanto l'elenco di quelle visibili. Di base questa lettura è spenta: si accende con un interruttore del servizio, e dove è spenta Gea non guarda nessuna foto.

C'è poi una regola di prudenza. I dati della pagina, note e nomi compresi, sono scritti anche da altre persone. Per Gea sono dati da leggere, mai istruzioni da seguire.

Chi lavora con i dati di altre persone chiede: «Gea legge tutto quello che ho sullo schermo?». No. Di base riceve solo gli indizi leggeri; la schermata la legge quando la domanda la riguarda; password e campi nascosti mai; una foto solo se la chiedete, dove la funzione è attiva. Quello che resta vero è che, quando la domanda riguarda la schermata, Gea legge anche i valori che non avete ancora salvato: se un campo contiene qualcosa che non volete far leggere, fate la domanda prima di scriverlo.

### Che cosa Gea può fare sulla pagina

Gea usa solo le azioni che la pagina le ha dichiarato, con un nome e un livello. Non fa clic alla cieca.

| Livello | Che cosa fa | Chiede «Autorizza»? |
|---|---|---|
| Compilare | riempie dei campi e li evidenzia; la scheda «Ho compilato» ha «Annulla», che rimette i valori di prima («Ho rimesso i valori di prima.») | no |
| Filtrare, cercare | imposta filtri e ricerche della pagina | no |
| Finestra | apre o chiude una finestra | no |
| Cambiare pagina | solo a risposta finita, perché cambiare pagina chiude il pannello | no |
| Modificare dati | cambia dati salvati | sì, sempre |

Leggere non chiede mai autorizzazione.

Al 25 novembre 2026 una sola pagina dichiara azioni a Gea: Impostazioni › Analisi AI delle foto, con la proposta di una regola (livello ricerca, «Non cambia niente») e la sua applicazione (livello modifica, con «Autorizza»). Altre pagine (Clienti e Interventi, Utenze, Verifica interventi) sono previste ma non hanno ancora azioni per Gea. Altrove Gea spiega dove fare clic, e il clic lo fa l'utente.

Su una pagina che non dichiara azioni Gea non può compilare né filtrare: può solo spiegare. Un'azione di modifica dichiarata dalla pagina non è protetta come le proposte della sezione successiva: la sua anteprima è quella che la pagina mostra in quel momento, senza una seconda lettura del record sul server. Se la pagina non risponde entro 10 secondi, la lettura si ferma.

### Il consiglio all'apertura

Gea non scrive per prima: è una regola. C'è una sola eccezione. Quando aprite il pannello, Gea può mostrare un consiglio su un errore evidente fatto da voi nelle ultime 24 ore. Il consiglio non lo decide Gea: lo trovano regole fisse sul server. I casi sono sei:

- un'importazione fallita;
- un'esportazione fallita;
- un'importazione con righe scartate;
- un'esportazione con righe scartate;
- lo stesso file importato almeno due volte, con il rischio di liste doppie;
- la stessa esportazione ripetuta almeno tre volte.

Il testo è concreto, per esempio «Nelle ultime 24 ore hai importato N volte il file «…» (l'ultima …).». Compare al massimo un consiglio per sessione, e non parla mai di un collega. «Sì, spiegami» manda a Gea una domanda già pronta, come «Ho importato più volte il file «…»: ci sono liste doppie?»; la correzione poi si fa nella pagina (capitoli 4 e 7). «Non mostrarmi più questi consigli» li spegne per quella persona; nel pannello vuoto «Riattivali» li riaccende. La preferenza sta in una tabella della commessa: dove la tabella manca, i consigli non si danno.

> **Per gli sviluppatori:** una pagina dichiara le azioni con `GoplannerChatbot.registra({nome, descrizione, livello, campi, esegui})`, livelli `compila | filtro | ricerca | naviga | modale | modifica` (`chatbot-service/src/page-actions.ts`). La lettura è `readScreen` in `widget.ts` (`MAX_ROWS = 50`, `MAX_SCREEN_BYTES = 48 * 1024`); `CHATBOT_PAGE_TIMEOUT_MS` 10.000. Si esclude un'area con `data-chatbot="escludi"`. I consigli sono in `lib/ChatbotConsigli.php` (`ORE = 24`), la preferenza in `chatbot_preferenze` (migrazione tenant 0038).

## Le proposte: niente cambia prima di «Autorizza»

Il glossario lo dice in una riga. Una proposta è una modifica che Gea prepara e mostra prima di farla; diventa reale solo quando l'utente preme «Autorizza». Fino a quel clic non è cambiato niente, e Gea ha l'ordine esplicito di non dire mai che l'affidamento, il riaffidamento o il cambio di data sono stati fatti.

### Leggere e decidere una proposta

1. Gea spiega a parole che cosa cambierebbe, su quale record, con il valore di prima e quello di dopo.
2. Sotto la risposta compare la scheda: in grassetto il record, poi una riga per ogni campo che cambia, nella forma «Campo: prima → dopo». I campi che restano uguali non compaiono.
3. Controllate che il record sia quello che intendete: l'intervento, l'operatore, la data.
4. Premete «Autorizza» entro 10 minuti, oppure «Annulla».
5. Leggete l'esito sulla scheda: «Eseguo…», poi «Operazione eseguita.» e il messaggio «Fatto: [record]. …»; oppure il motivo del rifiuto. Dopo «Annulla» la scheda dice «Proposta annullata.» e Gea scrive «Proposta annullata: non ho cambiato nulla.».

Il passo 3 è quello che conta: una scheda corretta in ogni riga può riferirsi all'intervento sbagliato, e il clic agisce con il vostro nome.

### Che cosa succede al clic

Fra il clic e la scrittura passano quattro controlli:

- il clic usa la vostra sessione e i vostri permessi, non quelli di Gea; se il profilo non basta, la scheda dice «Il tuo profilo non può eseguire questa operazione.»;
- la proposta appartiene a chi l'ha chiesta: un altro utente non può autorizzarla;
- la proposta deve essere ancora valida e non già usata («La proposta è scaduta: chiedi una nuova anteprima.», «Questa proposta è già stata usata.»); un secondo clic, o una richiesta parallela, non esegue due volte;
- il record viene riletto con i vostri lotti e confrontato con l'anteprima: se anche un solo campo è cambiato, o se il record non vi è più visibile, non si scrive nulla e la scheda dice «I dati sono cambiati dopo l'anteprima: non ho eseguito nulla. Chiedi una nuova anteprima.».

Solo dopo il quarto controllo la modifica la fa la stessa funzione che usa la pagina del gestionale, e il prima e il dopo vengono registrati.

### Quali proposte esistono

| Proposta | Che cosa cambia | Quando Gea si ferma |
|---|---|---|
| Affidare un intervento | affida a un operatore l'intervento di un'utenza di una lista che non ne ha ancora; data oggi, se non indicata; la modifica è quella della finestra «Assegna incarico» | l'intervento esiste già, l'utenza è in più liste, la lista è chiusa, l'operatore non è valido, la data non è valida |
| Riaffidare un intervento | cambia solo l'operatore, con la funzione di «Modifica intervento»; la data non si tocca | l'intervento non è Assegnato né Annullato, non ha una data pianificata, l'operatore non è valido, non cambia niente |
| Cambiare la data | sposta la data pianificata; ora e operatore restano | l'intervento non è Assegnato né Annullato; un intervento eseguito non cambia |
| Correggere una mappatura | corregge il modello di importazione, campo per campo | manca il permesso «Importare interventi»; manca lo storico delle correzioni |
| Regola per l'AI delle foto | aggiunge una regola alle istruzioni dell'AI, in una versione nuova | solo da Impostazioni › Analisi AI delle foto |

Per riaffidare e cambiare la data vale la stessa regola sugli stati del pulsante «Modifica» (capitolo 6). Oggi Gea può preparare queste proposte anche quando le si chiede direttamente, per esempio dandole il numero dell'intervento. La regola decisa per il futuro, «a un ordine Gea spiega come farlo, e propone modifiche solo come passi di un runbook», non è ancora in vigore (GOP-536). In entrambi i casi la modifica parte solo da «Autorizza».

Alcune operazioni sono escluse per costruzione: le cancellazioni definitive, gli utenti e i permessi, la configurazione della commessa, le importazioni, le operazioni in blocco. Ogni proposta tocca un record alla volta. L'eccezione dichiarata è la mappatura, che tocca un modello intero. Il «doppio controllo», cioè un secondo utente che autorizza, esiste nel codice ma è spento per tutte le operazioni: oggi autorizza solo chi ha chiesto la proposta.

### Un esempio completo: la mappatura

La procedura completa è nel capitolo 4. Qui la mappatura mostra il meccanismo nel suo caso più largo, perché tocca un modello intero e non un record. La scheda elenca campo per campo la colonna di prima e quella di dopo, più la riga «Riconoscimento automatico del file». Serve il permesso «Importare interventi», controllato all'anteprima e di nuovo al clic. Un modello di sistema non si tocca: Gea ne crea una copia, «NOME (aggiornato)». Dopo «Autorizza» Gea rifà la verifica sul file e dice se ora è conforme al modello. «Ripristina» rimette il modello com'era, una volta sola e solo se nessuno lo ha cambiato dopo. Dove manca lo storico delle correzioni Gea non propone nulla, e la mappatura si corregge dalla pagina Importazione: una correzione che non si può annullare non si fa.

### La regola per l'AI delle foto

*Per chi può modificare le Impostazioni.*

Da Impostazioni › Analisi AI delle foto si può chiedere a Gea una regola nuova. Gea la scrive, la prova sul banco di riferimento e riporta il risultato senza cambiare nulla. Se volete applicarla, la scheda «Aggiungi la regola alle istruzioni dell'AI (versione nuova)» mostra le righe «regola da aggiungere» e «prova sul banco», e chiede «Autorizza». Scartata la proposta, la pagina dice «Proposta scartata: non è cambiato niente.». Le versioni e il banco sono nel capitolo 6.

### Che cosa resta scritto

Ogni proposta e la sua vita (proposta, autorizzata, eseguita o fallita, oppure rifiutata) va in un registro, con chi l'ha proposta, chi l'ha autorizzata, il prima e il dopo e l'esito. Le righe del registro restano 12 mesi. Ogni passo compare anche nelle attività della commessa, come modifica fatta da Gea su autorizzazione dell'utente (dove lo staff lo legge: capitolo 12). Il registro viene scritto prima che la proposta compaia: dove manca, non nasce nessuna proposta e nessun dato cambia.

Resta l'errore di mano: «E se premo "Autorizza" per sbaglio?». La modifica è esattamente quella che la pagina farebbe con i vostri permessi, su un solo record. Per una mappatura c'è «Ripristina». Per un operatore o una data, la stessa modifica si rifà dalla pagina (capitolo 6) o con una nuova proposta. «Annulla» sulla scheda, invece, rifiuta una proposta: non annulla una modifica già eseguita, e l'annullamento delle modifiche eseguite non esiste ancora (GOP-528, da completare). La protezione vera è il passo 3: leggere il record e le righe prima e dopo, poi fare clic.

Gea non può riportare in vita un intervento eliminato. L'eliminazione è fisica: nel gestionale non resta nulla da ripristinare. Il 12 ottobre 2026, su una commessa, 6.193 interventi eliminati di un solo carico si sono potuti recuperare soltanto da un backup del database. Il recupero è una decisione dello staff tecnico, senza promesse. Per gli appuntamenti del call center il problema non si pone: si annullano, non si cancellano (capitolo 6).

> **Per gli sviluppatori:** `ChatbotStrumentoOperazione` prepara l'anteprima con l'impronta del record (`SCADENZA_SECONDI = 600`); `applica()` chiama la funzione del back office. L'esecuzione passa solo da `json.php?action=chatbot_operazione_esegui` con la sessione dell'utente (`ChatbotOperazioni::esegui`). Il registro è `chatbot_azioni` (`migrations/main/0010_chatbot_azioni.sql`, `ChatbotAzioniStore`, `MESI = 12`). Un'operazione nuova è una sottoclasse più il suo nome in `ChatbotRegistro::CLASSI` (pattern 38).

## Il ticket dalla chat: lo prepara Gea, lo apre l'utente

Un ticket dalla chat nasce per tre motivi: la guida non spiega una cosa che esiste (aggiornare la documentazione), il prodotto non fa quello che serve (aggiungere una funzione), qualcosa non funziona come dovrebbe (segnalare un difetto). Gea propone il ticket quando guida e dati non bastano, oppure lo prepara quando glielo chiedete («apri un ticket: …»). Non lo apre mai da sola, e ha l'ordine di non dire mai di averlo aperto lei.

### Aprire il ticket

1. Gea chiude la risposta con una frase di scuse e una domanda sì/no che dice il tipo, per esempio «Vuoi un ticket per segnalare un errore nella guida?».
2. Rispondete sì, oppure chiedete voi il ticket.
3. Compare la scheda «Ticket per lo staff tecnico: » seguita dal tipo («aggiornare la documentazione», «aggiungere una funzione», «segnalare un difetto»).
4. Leggete «Testo del ticket (puoi correggerlo)» e correggetelo; il testo arriva fino a 4.000 caratteri.
5. Rispondete a «Ti impedisce di lavorare?» con Sì o No. La risposta è obbligatoria.
6. In «Chi lo vede» lasciate o cambiate la scelta: «I colleghi di questo tenant, senza il tuo nome» (qui «tenant» vuol dire la commessa; è la scelta predefinita) oppure «Solo io (problema generale)».
7. Premete «Apri il ticket», oppure «Non aprire» per lasciar perdere («Ticket non aperto.»).
8. Gea conferma: «Ho aperto il ticket n. [numero]: lo staff tecnico lo ha ricevuto.».

«Ti impedisce di lavorare?» non è una formalità. Con Sì il ticket arriva subito allo staff come urgente, con un avviso immediato, e Gea aggiunge «Lo hai segnato come urgente, quindi lo vedono subito.». Con No entra nella coda normale. Rispondere con esattezza è quello che tiene veloci le urgenze vere.

### Che cosa parte insieme al ticket

La scheda lo dice prima del clic: «Allego in automatico, solo per lo staff tecnico: la conversazione, la pagina e la schermata che stai guardando, gli errori della pagina, il tuo utente e il tuo tenant.». La schermata ha gli stessi limiti della lettura descritta sopra: niente password, campi nascosti o immagini. Utente e commessa vengono dall'accesso e non si modificano. Gli allegati li vede solo lo staff tecnico, mai i colleghi.

### Quando il ticket non si apre

Sotto i pulsanti può comparire un messaggio. Tutti finiscono con la stessa indicazione: «Il testo resta qui: premi di nuovo «Apri il ticket» fra un minuto; se non va ancora, aprilo dal menu Ticket.».

| Messaggio | Che cosa fare |
|---|---|
| «Non riesco a raggiungere GOPlanner: la connessione sembra assente o cambiata, e il ticket non è stato aperto.» | il pannello ha già riprovato da solo due volte; controllate la connessione e premete di nuovo fra un minuto |
| «La sessione è scaduta, quindi il ticket non è stato aperto. Accedi di nuovo e chiedi a Gea di riproporlo.» | rientrate nel gestionale e chiedete a Gea di riproporre il ticket |
| «GOPlanner ha risposto con un errore (HTTP …) e il ticket non è stato aperto.» | riprovate fra un minuto, poi il menu Ticket |
| «GOPlanner ha dato una risposta che non riesco a leggere, e il ticket non è stato aperto.» | riprovate fra un minuto, poi il menu Ticket |
| «Il ticket non è completo: controlla il testo e rispondi alla domanda sull'urgenza.» | il testo è vuoto o manca la risposta sull'urgenza |
| «Hai aperto troppi ticket oggi. Riprova domani o scrivi allo staff tecnico.» | il limite è 50 ticket in 24 ore |

Premere due volte «Apri il ticket» non crea due ticket: le ripetizioni viaggiano con la stessa chiave, e il server ne apre uno solo. Ogni volta che la scheda non riesce, lo staff tecnico riceve in automatico un avviso con la causa, senza il testo del ticket.

### Chiedere una funzione nuova

Una richiesta di funzione segue un percorso più lungo, scritto in un runbook. Gea controlla prima la guida e se esiste già qualcosa di simile. Se una cosa simile esiste per altre commesse, la descrive in forma generica («una cosa simile esiste già per altre commesse e funziona circa così»), senza mai nominare commessa, azienda o committente, nemmeno se glielo chiedete. Se la vostra azienda ha già una richiesta uguale aperta, Gea propone di aggiungervi a quella: «Si aggiunge alla richiesta n. …, già aperta per la tua azienda.».

Poi fa al massimo 3-4 domande, una alla volta, ognuna con una risposta suggerita: chi ha il problema e quanto spesso, come lo aggira oggi, che cosa vorrebbe ottenere, e una scelta se serve. La scheda «Richiesta di una funzione nuova» aggiunge il riassunto, con le righe «Problema», «Chi lo ha e quanto spesso», «Come si aggira oggi» e «Da decidere». Se le domande si interrompono, la scheda lo segnala: «Scheda incompleta: interrotta prima della fine delle domande.».

Nel menu Ticket la richiesta passa per questi stati: Ricevuta, In valutazione, Pianificata, Non prevista (con il motivo), Risposta (con la spiegazione), Disponibile. Gea può dirvi lo stato delle vostre richieste di funzione, solo delle vostre e solo da questo accesso. Non promette mai tempi, costi o che la funzione verrà fatta, nemmeno quando è Pianificata. Le richieste di funzione sono la parte più recente di Gea, arrivata il 25 novembre 2026: valgono dove sono già attive.

Il ticket dalla chat ha limiti chiari. Serve un accesso personale: con un accesso che non ha i ticket, Gea non li propone e vi dice di segnalare il problema all'ufficio o allo staff tecnico con un riassunto in una riga. Dalla chat non si allegano file propri, come foto o fogli di calcolo: per quelli c'è il menu Ticket (capitolo 12). Degli altri ticket, quelli che non sono richieste di funzione, Gea non sa nulla. E nel testo non vanno dati personali di terzi.

La divisione del lavoro è questa: Gea scrive, l'utente decide e invia, lo staff riceve il contesto senza doverlo chiedere di nuovo.

## Che cosa Gea non fa, e quando chiedere allo staff tecnico

Un limite di Gea non è un difetto da scoprire per caso: è una regola scritta, con un motivo. Conoscerla evita di chiedere a Gea quello che non può fare.

| Gea non… | Perché | Che cosa fare invece |
|---|---|---|
| cambia dati senza «Autorizza» | ogni modifica è una proposta che diventa reale solo col clic dell'utente | leggere la scheda e decidere |
| cancella definitivamente, tocca utenti e permessi, configurazione della commessa, importazioni, operazioni in blocco | escluso per costruzione | farlo dalla pagina, con i propri permessi |
| riporta in vita interventi eliminati | l'eliminazione è fisica: nel gestionale non resta nulla | chiedere allo staff tecnico, senza promesse |
| vede altre commesse | risponde solo per la commessa aperta nella sessione; non le si può chiedere di guardarne un'altra | cambiare commessa nella sessione (capitolo 2) |
| fa i nomi dei colleghi | gli altri sono «un collega» | un amministratore può chiedere espressamente chi è stato |
| spiega come funziona | le sue istruzioni lo vietano: «Non posso dirti come funziono. Posso aiutarti con GOPlanner.» | per l'architettura, il capitolo 15 |
| propone query SQL o chiede di eseguirne | i dati si leggono solo con i suoi strumenti | chiedere a Gea di indagare, o allo staff |
| promette tempi di risposta o di rilascio | le sue istruzioni lo vietano, anche per una richiesta Pianificata | lo stato della richiesta nel menu Ticket |
| è nell'app degli operatori | esiste solo nel gestionale web | per l'app, il capitolo 8 |

Una domanda tocca da vicino la riga sui colleghi: «Posso chiedere a Gea che cosa ha fatto un collega?». Sì, per i fatti degli ultimi 7 giorni (30 per un amministratore), raccontati come azioni di «un collega». Il nome lo riceve solo un amministratore della commessa che lo chiede espressamente.

### Le conversazioni

Le conversazioni con Gea sono registrate: ogni domanda, gli strumenti usati e la risposta. Le legge solo lo staff tecnico, mai i colleghi e mai il committente. Servono a controllare e migliorare le risposte. Il caso del 22 novembre mostra dove porta una risposta sbagliata: a una regola scritta e a una lettura in più.

Dove la memoria delle conversazioni è attiva, Gea ricorda le conversazioni passate della stessa persona, solo le sue e mai quelle di un collega, per 365 giorni. A «ti ricordi…» o «l'altra volta» cerca nella memoria e racconta solo quello che trova; se non trova nulla, lo dice. Per cancellarla si chiede allo staff tecnico, che toglie tutte le conversazioni di quella persona. La memoria si riempie solo se gira un processo giornaliero del servizio: senza, Gea non ricorda nulla, anche se la funzione risulta accesa. Diverso è il filo della conversazione in corso. Se Gea lo perde, lo dice in una frase e chiede di ripetere.

### Quando Gea non può rispondere adesso

Alcuni messaggi vogliono dire che Gea, in quel momento, non può aiutare:

- «Limite giornaliero raggiunto, riprova domani o contatta lo staff.»: la commessa ha esaurito le richieste del giorno, che sono in comune fra tutti i suoi utenti e si contano sull'ora italiana; il valore predefinito è 100 richieste al giorno per commessa, e una commessa può averne uno diverso. Una risposta interrotta o fallita non conta.
- «Il supporto non è disponibile in questo momento. Riprova tra qualche istante.»
- «La sessione è scaduta. Ricarica la pagina per continuare a usare il supporto.»
- «Non sono riuscita a completare la richiesta. Riprova tra qualche istante.»
- «Non sono riuscita a completare la diagnosi nel tempo previsto. Contatta lo staff.»

Il gestionale funziona anche senza Gea. Ogni pagina e ogni procedura di questa guida restano disponibili, e per un ticket c'è sempre il menu Ticket.

Tabella e messaggi descrivono GOPlanner al 25 novembre 2026. Alcune capacità dipendono dalla commessa o da interruttori: lettura delle foto, memoria delle conversazioni, consiglio all'apertura, storico delle correzioni di mappatura, richieste di funzione. Se una di queste non risponde come descritto, chiedete allo staff tecnico se sulla vostra commessa è accesa.

> **Quando chiedere allo staff tecnico:**
> - il pulsante «Assistente virtuale» manca a un utente che dovrebbe averlo, dopo aver verificato con l'amministratore l'accesso e la commessa;
> - compare «Limite giornaliero raggiunto, riprova domani o contatta lo staff.» e il problema vi blocca il lavoro: aprite il ticket dal menu Ticket (capitolo 12);
> - Gea dice che una fonte non è disponibile, o risponde «Non sono riuscita a completare la diagnosi nel tempo previsto. Contatta lo staff.»;
> - una proposta viene rifiutata più volte per lo stesso record;
> - ci sono dati eliminati da recuperare, a partire dagli interventi;
> - avete un errore del server con il codice di 8 caratteri che Gea vi ha dato: il codice va nel ticket.

> **Per gli sviluppatori:** il servizio di Gea è in `chatbot-service/` (stesso repository, build e rilascio propri) e non ha credenziali del database: ogni lettura passa dalle azioni `chatbot_*` di `JSONController` con l'identità dell'utente. L'audit di ogni turno è solo per lo staff. Il limite giornaliero è in `chatbot-service/src/cost-cap.ts` (`CHATBOT_DAILY_REQUEST_LIMIT`, per commessa e giorno; oltre risponde 429, troppe richieste); la memoria in `conversation-memory.ts` (GOP-811, `MEMORY_RETENTION_DAYS = 365`). Architettura e rilascio: capitoli 15 e 16.

Prima di premere «Autorizza» o «Apri il ticket» si legge che cosa portano con sé: un record con il suo prima e dopo, oppure un testo che lo staff tecnico riceverà insieme alla vostra conversazione. Gea legge, indaga e prepara; il clic è vostro e agisce con i vostri permessi. Quello che nessun pulsante del pannello può fare, come recuperare dati eliminati, guardare un'altra commessa o promettere una data, si chiede allo staff tecnico.

## Fonti

- codice: `lib/ChatbotAuth.php`
- codice: `Smarty_templates/it/_header.html`
- codice: `config-docker.inc.php`
- codice: `chatbot-service/src/widget.ts`
- codice: `chatbot-service/src/server.ts`
- codice: `chatbot-service/src/page-context.ts`
- codice: `chatbot-service/src/page-actions.ts`
- codice: `chatbot-service/src/web-activity.ts`
- codice: `chatbot-service/src/cost-cap.ts`
- codice: `chatbot-service/src/conversation-memory.ts`
- codice: `chatbot-service/scripts/memoria-conversazioni.mjs`
- codice: `lib/ChatbotRegistro.php`
- codice: `lib/ChatbotStrumentoOperazione.php`
- codice: `lib/ChatbotOperazioni.php`
- codice: `lib/ChatbotAzioniStore.php`
- codice: `lib/ChatbotStrumentoAffidaIntervento.php`
- codice: `lib/ChatbotStrumentoRiaffidaIntervento.php`
- codice: `lib/ChatbotStrumentoCambiaDataIntervento.php`
- codice: `lib/ChatbotStrumentoProponiMappatura.php`
- codice: `lib/MappaturaImportStorico.php`
- codice: `lib/ChatbotConsigli.php`
- codice: `lib/ChatbotPreferenze.php`
- codice: `lib/CatalogoPermessi.php`
- codice: `lib/MobileV3/Feedback/TicketService.php`
- codice: `lib/MobileV3/Feedback/TicketFunzioni.php`
- codice: `js/code/impostazioni_analisi_ai.js`
- docs: `docs/02-patterns/27-chatbot-supporto-architettura.md`
- docs: `docs/02-patterns/38-chatbot-operazioni-anteprima-esegui.md`
- docs: `docs/02-patterns/39-chatbot-contesto-pagina-azioni-interfaccia.md`
- wiki: `wiki/index.md`
- wiki: `wiki/assistenza-clienti/runbook-operatori-attivi.md`
- wiki: `wiki/assistenza-clienti/runbook-attivita-utente.md`
- wiki: `wiki/assistenza-clienti/runbook-errore-a-schermo.md`
- wiki: `wiki/assistenza-clienti/runbook-richiesta-funzione-nuova.md`
- wiki: `wiki/assistenza-clienti/runbook-regola-istruzioni-ai.md`
- wiki: `wiki/assistenza-clienti/aprire-un-ticket-da-gea.md`
- wiki: `wiki/assistenza-clienti/annunci-novita-campanella.md`
- Jira: GOP-143 — interruttore di produzione di Gea
- Jira: GOP-526 — affidare e riaffidare un intervento da Gea
- Jira: GOP-527 — cambiare la data di un intervento da Gea
- Jira: GOP-528 — annullamento delle modifiche (da completare)
- Jira: GOP-536 — azioni solo da runbook (da completare)
- Jira: GOP-721 — regole dell'AI proposte da Gea
- Jira: GOP-759 — ticket dalla chat
- Jira: GOP-811 — memoria delle conversazioni
- Jira: GOP-813 — suggerimenti per pagina
- Jira: GOP-816 — storico delle correzioni di mappatura
- Jira: GOP-819 — nome nel saluto e «Spiegamelo meglio»
- Jira: GOP-820 — consigli all'apertura
- Jira: GOP-823 — nessun suggerimento generico
