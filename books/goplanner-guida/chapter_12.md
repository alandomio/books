# 12. Strumenti di amministrazione e diagnostica

*In questo capitolo* si vede quali strumenti ha ciascuno quando qualcosa non funziona: la schermata d'errore con il suo codice, Gea, la sezione Ticket con la campanella, le pagine del menu Admin. Ogni strumento appartiene a un tratto di una staffetta che porta il problema, con le sue prove, da chi lo vede allo staff tecnico. Le sezioni da 1 a 4 sono per gli amministratori e il back office; la 5 e la 6 sono per lo staff tecnico.

## Chi ha quali strumenti: il menu Admin, la barra in alto e Gea

*Per tutti; il riquadro finale è per gli sviluppatori.*

Un lunedì mattina (il caso è inventato) all'ufficio arrivano tre messaggi. Un collega ha davanti una schermata d'errore con la frase «Si è verificato un errore imprevisto» e un codice di 8 caratteri. Un operatore scrive: «ho chiuso 9 interventi e ne risultano meno». Una collega chiede perché nel suo menu in alto c'è «Utenti», mentre il collega dello staff tecnico vede «Admin». Tre problemi diversi. Tre strumenti diversi, e una sola regola: la prova viaggia con il problema.

La diagnosi in GOPlanner è una staffetta in tre tratti. Nel primo, chi vede il problema raccoglie le prove con le proprie pagine e con Gea: il codice dell'errore, l'operatore e il periodo, il numero dell'importazione o dell'esportazione. Nel secondo, il ticket porta quelle prove allo staff tecnico. Nel terzo, lo staff tecnico le legge nelle pagine Admin e nei registri del server, e usa gli strumenti che scrivono solo dopo aver letto i numeri che mostrano. Ogni strumento del capitolo sta in un solo tratto.

La mappa degli strumenti, con le etichette come compaiono nel codice:

| Strumento | Dove si trova | Chi lo vede | A che cosa risponde |
|---|---|---|---|
| «Ticket» | barra in alto, con il numero dei ticket da leggere | chi ha un'identità personale | «a che punto è il mio problema» (sezione 4) |
| Campanella («Notifiche») | barra in alto, in alto a destra | gli utenti del back office | «che cosa è cambiato, che cosa aspetta una mia risposta» (sezione 4) |
| Gea | pannello in basso a sinistra, sulle commesse dove è attiva (capitolo 10) | gli utenti di quelle commesse | «perché ho visto un errore», «dove si è fermato il dato» (sezioni 2 e 3) |
| Admin › «Utenti»: «Elenco utenti», «Profili e varianti» | menu in alto | chi ha il permesso | capitolo 11 |
| Admin › «Diagnostica»: «Errori app», «Log», «Console JSON», «Giro» | menu Admin | staff tecnico | sezione 5 |
| Admin › «Clienti»: «Account», «Carichi», «Stato commesse» | menu Admin | staff tecnico; «Stato commesse» un solo accesso tecnico | sezione 5 |
| Admin › «Strumenti»: «Consolida utenze», «Analisi AI foto per carico», «Svuota cache Redis», «Cruscotto Analisi AI» | menu Admin | staff tecnico | sezione 6 |
| Admin › «Sistema»: «Mappa», «GCM» | menu Admin | staff tecnico | «GCM» invia notifiche e comandi ai telefoni (capitolo 8) |
| Admin › «Report»: «Estrazione mensile» | menu Admin | per permesso, su una sola commessa | l'estrazione del mese di quella commessa |

Due righe vanno lette con attenzione. Il gruppo «Clienti» porta un'etichetta dell'interfaccia: lì «cliente» vuol dire commessa, e «Account» è l'elenco delle commesse, «Carichi» l'elenco dei carichi con il loro avanzamento. «Console JSON» invia una chiamata dell'app come se fosse l'operatore scelto, e la pagina stessa avverte che le chiamate «vengono eseguite davvero sul database del cliente» (vedi il capitolo 15): è l'unica voce di «Diagnostica» che può scrivere sui dati.

### Perché la voce si chiama «Utenti» o «Admin»

Il titolo della voce in alto segue una regola sola. Un gruppo compare solo se chi guarda vede almeno una delle sue voci. I quattro gruppi tecnici non dipendono da un profilo, ma dal contrassegno di amministratore sull'accesso, lo stesso che nel capitolo 11 fa comparire il pulsante «Accessi». Nessun permesso lo concede e nessun invito lo porta: ogni accesso nasce senza. Chi ha il contrassegno vede la voce intitolata «Admin», con i gruppi tecnici. Chi non lo ha e vede solo le voci di «Utenti» la trova intitolata «Utenti»; chi vede solo l'estrazione mensile, «Admin». Le regole dei profili sono nel capitolo 11.

La guardia non sta solo sul menu, ma anche sull'indirizzo. Ogni pagina del menu Admin che non sia di «Utenti» risponde a chiunque altro con il codice 403 (accesso negato) e il testo «Accesso negato: azione riservata agli amministratori di sistema», anche se l'indirizzo viene scritto a mano. «Stato commesse» ha una guardia in più: è riservata a un solo accesso tecnico dello staff, e a tutti gli altri, colleghi dello staff compresi, risponde «Accesso negato: pagina riservata al super-admin globale» prima di leggere qualunque dato. Lo stesso principio vale per `json_admin.php`, che risponde «User not allowed» (capitoli 2 e 11).

*Contro-obiezione.* «Il collega dello staff ha il menu Admin pieno di voci, io ho solo «Utenti»: mi manca un permesso?» No. I gruppi tecnici non stanno in nessun profilo, e nessun invito li porta. Quello che serve da quelle pagine arriva all'ufficio attraverso Gea e il ticket. Se manca anche «Utenti», allora sì, è una domanda di permessi: vedi il capitolo 11.

*Limite.* Le etichette di questo capitolo vengono dai modelli e dagli script delle pagine Admin. Se a schermo una parola è diversa, vale quella a schermo, e la differenza si segnala allo staff tecnico. La sezione Ticket, gli annunci e il contatore delle «Novità» dipendono da tabelle che possono non essere attive su ogni installazione: per questo il capitolo dice «dove la sezione è attiva», e non lo promette.

Ogni strumento appartiene a un tratto della staffetta: chi vede il problema, il ticket, lo staff tecnico.

> **Per gli sviluppatori:** `lib/MenuAdmin.php::voci()` costruisce i gruppi tecnici solo con `users.admin = 1` (GOP-658, GOP-659); `AdminAreaUtenti::gruppo()` e `titoloAdmin()` danno il gruppo e il titolo «Utenti» (GOP-601). Ogni voce passa da `pages/admin.php?action=…`, protetta da `AdminPaginaGuard::negaSeNonConsentito` (GOP-608) e, per Stato commesse, da `StatoCommessePagina::negaSeNonConsentito()` (GOP-726). «Report» viene da `RiepilogoMese::voceMenu()` (GOP-654). Architettura: vedi il capitolo 13.

## «Perché ho visto un errore»: il codice di 8 caratteri

*Per tutti; il riquadro finale è per lo staff tecnico.*

Una schermata d'errore senza codice costringe a cercare alla cieca. Un ticket che dice «errore in importazione, ieri» obbliga lo staff tecnico a scorrere una giornata intera di errori di tutta una commessa per trovare il suo. Con il codice la ricerca diventa esatta. Per questo la schermata lo mette al centro.

La schermata è una pagina intera intitolata «Errore». Contiene una frase, «Si è verificato un errore imprevisto. Il nostro team ne è stato avvisato.», un riquadro con il codice in caratteri grandi e un pulsante «Torna indietro». Il codice ha 8 caratteri, cifre e lettere da A a F, per esempio *7C04E1D9* (un codice inventato). Nasce per quel singolo errore, nell'istante in cui il server lo intercetta, e viene scritto nei registri del server insieme all'errore. Un clic sul riquadro seleziona tutto il codice.

La schermata è uguale su ogni commessa, in italiano, e non si personalizza. Prima di GOP-249, in produzione, un errore grave lasciava la pagina disegnata a metà, con in fondo la frase inglese «Sorry, an error has occured. Please contact your system administrator.», e il server la consegnava con il codice 200, quello delle risposte riuscite. La sesta decisione di GOP-249 ha fissato la forma di oggi: una frase, il codice in grande e selezionabile, un pulsante per tornare indietro, e nessuna versione per commessa, perché una schermata d'errore ridefinibile è una schermata che si scopre rotta proprio nel momento peggiore.

La frase «Il nostro team ne è stato avvisato» vuol dire che l'errore è stato registrato, con il suo codice, nei registri del server: una riga nella tabella centrale degli errori e una voce nel registro degli errori della commessa, che lo staff tecnico legge. Non vuol dire che qualcuno richiamerà. Il gestore degli errori non manda email e non contatta nessuno da solo. Quando l'errore blocca il lavoro, quello che lo mette davanti a una persona è un ticket con «Sì» alla domanda «Ti impedisce di lavorare?» (sezione 4).

### Che cosa fa chi vede l'errore

1. Copiate il codice: un clic sul riquadro lo seleziona tutto.
2. Annotate la pagina, con il nome della voce di menu come compare a schermo, e l'ora.
3. Dalla stessa pagina chiedete a Gea «perché ho visto questo errore?», dandole il codice.
4. Se la causa è una cosa che potete correggere voi, come un file o un campo obbligatorio, correggetela e ripetete.
5. Altrimenti aprite un ticket per segnalare un difetto, con la pagina, l'ora e il codice (sezione 4).

### Che cosa legge Gea

Gea parte dal contesto della pagina, che è un indizio e non una prova. Poi legge gli errori del server delle richieste di chi chiede, nella sua commessa: gli ultimi 30 minuti, o fino a un giorno; con il codice la ricerca è esatta sull'ultimo giorno. Per ogni tipo di errore dice quante volte è capitato, la prima e l'ultima volta in ora italiana, se è un errore o un avviso, da dove è partito (l'apertura di una pagina, una richiesta di dati fatta da una pagina aperta, un lavoro in coda), con il testo ripulito. Il resto del funzionamento di Gea è nel capitolo 10.

Un errore partito da un lavoro in coda, come un'importazione o un'esportazione, porta il numero del registro. Quel numero è la prova da mettere nel ticket, e il registro si legge con le pagine dei capitoli 4 e 7. Un caso reale mostra perché conta: a metà novembre 2026 le esportazioni delle foto di una commessa fallirono per giorni, perché un file PNG veniva aperto come JPEG, e la causa restava solo sullo schermo del servizio che esegue i lavori, dove nessuno poteva leggerla. Oggi ogni lavoro fallito finisce nel registro degli errori della commessa, con il suo codice.

### Quando Gea non trova l'errore

Se Gea non trova nessun errore del server, il messaggio visto può venire da un controllo della pagina sui dati scritti, come un campo obbligatorio vuoto o un formato sbagliato, e non da un guasto. Il rimedio, allora, è rileggere che cosa diceva la pagina.

*Contro-obiezione.* «Un collega mi ha girato il suo codice, ma Gea non lo trova.» È voluto. Gea legge solo gli errori delle richieste di chi le fa la domanda, nella sua commessa: gli errori di un altro non escono mai, nemmeno contati. Il codice di un collega risulta «non trovato». Lo chiede a Gea il collega, oppure il codice va in un ticket per lo staff tecnico.

*Limite.* Gli errori delle richieste registrati prima del 22 novembre 2026 non portano l'utente, e Gea non li trova; i lavori in coda falliti lo portavano già. Un errore arriva nel registro qualche secondo dopo: se è appena comparso e non c'è, si riprova tra un minuto. Il testo che Gea mostra è ripulito: niente percorsi di file, niente elenco delle chiamate, i dati personali delle utenze sostituiti da `[…]`, nessuna email, telefono, codice fiscale, IBAN o chiave di accesso. Gea non dà mai nomi di file, classi, azioni o campi. L'errore completo lo legge solo lo staff tecnico.

Il codice non spiega l'errore: lo rende trovabile. Va copiato, con la pagina e l'ora.

> **Per lo staff tecnico:** il codice è `strtoupper(bin2hex(random_bytes(4)))` in `lib/BaseErrorHandler.php`, coniato all'ingresso di `handleError()` e `handleException()`; `erroreJob()` conia il suo per i lavori in coda falliti. Dal 22 novembre 2026 il gestore scrive con l'errore utente, pagina e azione (`richiestaCorrente`, GOP-864), mai i parametri. I lavori scrivono i loro errori secondo `docs/03-cookbooks/35-errori-dei-job-in-background.md`; Gea li legge con `errori_applicazione` (`chatbot-service/src/backend-errors.ts`). Dove sta l'errore completo e come cercarlo per codice: vedi il capitolo 16.

## «Dove si è fermato il dato»: mai partito, respinto, non salvato

*Per l'ufficio fino alla tabella; il riquadro finale è per lo staff tecnico.*

Il secondo messaggio del lunedì, «ho chiuso 9 interventi e ne risultano meno», porta con sé una tentazione: aprire gli interventi che mancano e premere «Verificato». Se un'ora dopo il telefono dell'operatore manda l'esito, il server lo respinge, perché l'intervento risulta già chiuso, e le foto e le letture di quell'intervento non arrivano più. È il danno che questa sezione evita.

Un dato che dovrebbe arrivare dal telefono (una foto, l'esito di un intervento, una posizione) e che in ufficio non c'è si è fermato in uno di tre punti, e ogni punto ha il suo responsabile:

- **mai partito** dal telefono: telefono, rete o app; se ne occupa l'operatore;
- **respinto** dal server: una regola del server o un difetto di formato dell'app; se ne occupa lo staff tecnico;
- **arrivato e non salvato**: un guasto del server; di nuovo lo staff tecnico.

Il compito è dire quale dei tre, non indovinare. Oggi si può: i segni che servono sono nati dal caso raccontato nel capitolo 1, in cui i tre punti non si distinguevano. Da GOP-264, sull'app precedente ogni richiesta del telefono lascia due segni con un identificativo comune: l'**ingresso**, scritto appena la richiesta raggiunge il server, prima di ogni controllo, e l'**esito**, scritto a fine richiesta, che dice come è finita. GOPlanner 3 lascia una riga per richiesta, con il suo stato e il motivo. La conclusione in tre casi vale per entrambe.

### Prima di chiamarlo perso: i controlli dell'ufficio

1. Controllate che sia l'intervento giusto: un'utenza può averne più d'uno, e l'esito sta solo su quello chiuso (capitolo 6).
2. Guardate quando il telefono dell'operatore ha contattato il server l'ultima volta: è la colonna «Ultimo invio» di Operatori › Dashboard, che si legge «oggi 08:14», «ieri 17:02» o «3 giorni fa» (orari inventati), e «mai» se non c'è. Più di 48 ore di silenzio sono il caso tipico del dato «mai partito»: telefono spento, app non aperta, nessuna rete.
3. Chiedete a Gea di controllare i problemi dell'app per quell'operatore: blocchi dell'app, richieste andate male, anomalie mandate dall'app (capitoli 8 e 10).
4. Se l'intervento non ha esecuzione, non premete «Verificato» finché non avete escluso il telefono. «Verificato» su un intervento mancante crea un'esecuzione vuota, e il successivo invio del telefono viene respinto da GOPlanner 3 o ignorato dall'app precedente (capitolo 6).
5. Se il telefono è muto, l'operatore apre l'app con la rete accesa: la coda dei dati parte da sola (capitolo 8). Se ci sono rifiuti o errori, aprite un ticket con l'operatore, il periodo e che cosa manca (sezione 4).

Le letture possibili sono cinque. La prima colonna la legge lo staff tecnico, e Gea per i controlli sul telefono; all'ufficio arriva la conclusione.

| Che cosa risulta | Che cosa vuol dire | Chi interviene |
|---|---|---|
| nessun ingresso da quel telefono nel periodo | il dato non è mai arrivato al server | l'operatore: telefono, rete, app |
| ingresso senza esito, per un'azione che scrive | il server si è interrotto a metà (tempo scaduto, memoria, riavvio) | lo staff tecnico: infrastruttura |
| esito «rifiutata» con un motivo | il server ha respinto la richiesta e il motivo dice perché; su molti telefoni subito dopo un rilascio è un difetto di formato dell'app; un telefono non riconosciuto riceve «Sim non trovata» | lo staff tecnico (per il lato telefono, capitolo 8) |
| esito «errore» senza un «ok» successivo per lo stesso dato | il dato è arrivato e il salvataggio è fallito | lo staff tecnico: server |
| esito «ok», ma il dato non è nella pagina | il dato è salvato; si guarda il filtro della pagina o la commessa aperta | l'ufficio (capitolo 6) |

Gea dice la conclusione per prima, in una frase fra tre: «il dato non risulta mai arrivato dal telefono», «il dato è arrivato ma il server l'ha respinto», «il dato è arrivato e non è stato salvato, lo passo allo staff». Poi dice il periodo controllato e l'ultimo contatto del telefono, in ora italiana. Non dà mai identificativi di richiesta, impronte del telefono o nomi di registri.

*Contro-obiezione.* «Gea dice che il dato non è mai arrivato, ma l'operatore giura di averlo mandato.» Si fanno tre controlli, in quest'ordine. La coda del telefono: se il dato è ancora in attesa, c'è «Riprova» (capitolo 8). L'orologio del telefono: un orologio sbagliato sposta i dati di giorno, e il dato risulta in un periodo diverso da quello cercato. Infine, solo per lo staff tecnico, il canale dei registri: un registro muto non è un telefono muto, e concludere «il telefono non ha mandato niente» quando era il registro a tacere manda l'operatore a riparare un telefono che funziona. Senza prove nei registri nessuno dice «è tutto arrivato»: si dice che cosa si è controllato.

*Limite.* Questa diagnosi è di sola lettura: né Gea né lo staff tecnico rinviano o correggono dati da qui. Un problema che l'app non ha mai registrato, come un telefono spento o senza rete, non lascia traccia: lo copre il controllo dei telefoni silenziosi, dopo 48 ore. I telefoni ritentano finché non ricevono conferma: sull'app precedente, se la conferma si perde, il nuovo tentativo può duplicare un dato, perché lì la deduplicazione per identificativo non è ancora in produzione. Il doppione si vede, e lo tratta lo staff tecnico. GOPlanner 3 riconosce invece un esito identico già scritto e non lo ripete. Il livello di dettaglio dei registri dell'app è per commessa, e lo staff tecnico lo alza solo per il tempo dell'indagine.

Un dato mancante ha tre cause e tre responsabili: prima di cercarlo, si stabilisce dove si è fermato.

> **Per lo staff tecnico:** si leggono insieme i due gruppi, `/goplanner/sconosciuto/mobile` (ogni ingresso, senza commessa) e `/goplanner/<tenant>/mobile` (gli esiti), filtrando per `dispositivo` o `request_id` (lo stesso dell'intestazione `X-Request-Id` della risposta). Per le foto ritentate dello stesso file l'ingresso si scrive una volta ogni 5 minuti: un esito senza ingresso è un ritentativo. Prima di concludere «non è arrivato niente» si lanciano `php scripts/check_canale_log.php` e `php scripts/check_mobile_log_silence.php` (GOP-195, GOP-270). Per indagare si porta `custom['mobile']['log_level']` (0–4, 1 se assente) a 3 o 4, si fa riaprire l'app, si legge, poi si riabbassa. Canale e strumenti: vedi il capitolo 16.

## Ticket, campanella e annunci: consegnare un problema allo staff

*Per amministratori e back office; il riquadro finale è per gli sviluppatori.*

Il ticket è il secondo tratto della staffetta: porta le prove da chi ha visto il problema allo staff tecnico. La voce «Ticket» sta nella barra in alto, dopo le voci della commessa e prima di «Impostazioni» e «Admin», con accanto in rosso il numero dei ticket da leggere. Lo stesso numero compare nella campanella, sotto «Ticket». La voce c'è solo per chi ha un'identità personale: un accesso «Da collegare» non ce l'ha (capitolo 11). Dove le tabelle dei ticket non sono ancora attive, la voce c'è ma la pagina dice «I ticket non sono ancora disponibili.»

Si entra a mano, da «Nuovo ticket», oppure dalla scheda che Gea prepara in chat, dove il ticket lo apre la persona con «Apri il ticket» (capitolo 10). Le segnalazioni scritte dagli operatori nell'app con «Segnala un problema» arrivano qui anche loro (capitolo 8).

### Aprire un ticket

1. Aprite Ticket e premete «Nuovo ticket».
2. Scrivete «Che cosa succede», obbligatorio, fino a 4.000 caratteri.
3. Scegliete la commessa nel campo «Tenant» (qui «tenant» vuol dire commessa), già impostato su quella aperta, oppure «Nessuno (problema generale)».
4. Rispondete a «Ti impedisce di lavorare?» con «Sì» o «No»: la risposta è obbligatoria.
5. Se serve, aggiungete gli «Allegati (facoltativi)»: fino a 5 file da 10 MB, immagini JPG o PNG, PDF, CSV, TXT, Excel, ZIP.
6. Mentre scrivete, sotto il testo compaiono i «Ticket aperti simili»: se è lo stesso problema, apritelo e premete «Capita anche a me» invece di aprirne un altro.
7. Premete «Apri ticket».

Il campo della commessa decide chi vede il ticket. La pagina lo dice sotto il campo: «Un ticket con tenant lo vedono anche i colleghi di quel tenant, senza il tuo nome. Senza tenant resta visibile solo a te.» Un doppio clic su «Apri ticket» non apre un secondo ticket: il server riconosce lo stesso invio.

Che cosa scrivere perché lo staff tecnico parta subito, senza dover richiedere niente:

| Problema | Che cosa mettere nel ticket | Dove si prende |
|---|---|---|
| Errore a schermo | la pagina (voce di menu), l'ora, il codice di 8 caratteri | la schermata d'errore; Gea (sezione 2) |
| Dato dal telefono mancante | l'operatore, il giorno e l'ora dell'azione sul telefono, il codice dell'utenza o dell'intervento, la conclusione di Gea | sezione 3 |
| Importazione con righe mancanti o fallita | il numero dell'importazione, il nome del file, la mappatura | capitolo 4 |
| Esportazione vuota o fallita | il numero dell'esportazione, l'ora, la causa registrata | capitolo 7 |
| Una persona non vede qualcosa | il profilo della persona sulla commessa, la commessa, che cosa manca, il passo del controllo del capitolo 11 dove ci si è fermati | capitolo 11 |
| Pagina bianca nel menu File | la voce aperta, l'ora, i codici errore e, per importazioni ed esportazioni, la mappatura scelta | capitolo 1 |

Nel testo non vanno mai dati personali di terzi, come nomi di intestatari o numeri di telefono: basta il codice dell'utenza.

Gli stati di un ticket sono nove, e li cambia solo il team: «Ricevuta», «In analisi», «In attesa di risposta», «In correzione», «Nella prossima versione», «Risolta», «Non è un difetto», «Risposto», «Non prevista». Gli ultimi quattro, da «Risolta» in poi, chiudono il ticket. «In attesa di risposta» vuol dire che il team ha chiesto qualcosa: si risponde con «Invia messaggio», e il ticket torna «In analisi». Le richieste di una funzione nuova mostrano gli stessi stati con sei etichette diverse, come «In valutazione», «Pianificata» e «Disponibile».

L'elenco si filtra con «Aperti», «Chiusi», «Tutti». Ogni riga può portare le etichette «Mio», «Urgente», «Attende una risposta», «Da leggere». Nella scheda ci sono tre pulsanti. «Capita anche a me» compare sui ticket aperti degli altri. «Ancora non risolto» riapre un ticket chiuso, e lo vedono solo l'autore e chi aveva confermato. «Invia messaggio» è solo dell'autore, finché il ticket è aperto.

Chi vede che cosa, oltre a quello che la pagina dice sotto il campo:

- l'elenco mostra i propri ticket e quelli dei colleghi della commessa scelta in alto;
- la conversazione e gli allegati restano dell'autore e del team: chi segue un ticket ne vede lo stato, la spiegazione e la versione;
- chi perde l'accesso a una commessa non vede più i suoi ticket, nell'elenco e negli avvisi, finché l'accesso non torna.

Una risposta che non compare non è persa. Le spiegazioni, i «Non è un difetto», i «Non prevista» e ogni impegno su tempi o interventi restano bozze finché il responsabile non le approva con un clic; il team scrive direttamente solo risposte di fatto.

Anche la regola dell'identità ha una storia. La prima versione dei ticket legava il ticket all'accesso, e la stessa persona, entrando in tre commesse, risultava tre accessi diversi: i suoi ticket sparivano appena cambiava commessa. Dal 10 novembre 2026 il ticket appartiene alla persona, e la commessa è facoltativa.

### La campanella e gli annunci

La campanella sta in alto a destra e raccoglie tre fonti, in quest'ordine: gli annunci, una voce per annuncio; «Novità», la pagina delle modifiche (vedi il capitolo 16); «Ticket», solo per l'autore e per chi ha premuto «Capita anche a me». La voce «Ticket» conta i ticket cambiati dall'ultima apertura e quelli che aspettano una risposta della persona, che restano finché non risponde. Una fonte che non risponde vale zero: la campanella non rompe mai una pagina.

Un annuncio si apre da solo, come finestra, al primo accesso dopo il rilascio. «Ho capito» lo segna come letto per quell'utente, e non si riapre più da solo. Chiuderlo con Esc non lo segna come letto: alla sessione successiva ricompare. Si rilegge dalla campanella, dove la voce, dopo la lettura, dice «Novità · letta · clicca per rileggerla». Il primo annuncio è «Ti presentiamo Gea». Gli annunci ci sono solo nel back office, non nell'app.

*Contro-obiezione.* «Ho segnalato ieri, ho risposto «Sì» a «Ti impedisce di lavorare?», e non vedo ancora una risposta.» «Sì» avvisa subito il team, con lo stesso avviso delle segnalazioni bloccanti dall'app, ma non cambia i tempi di risposta, e nessuno li promette. Una risposta che non si vede può essere una bozza in attesa di approvazione; lo stato, intanto, dice dove si trova il ticket.

*Limite.* Un ticket aperto non si modifica e non si cancella, e il suo stato lo decide il team. La sezione non c'è senza un'identità personale, ed è attiva solo dove lo sono le sue tabelle. Si aprono al massimo 50 ticket in 24 ore per persona, in qualunque modo. Ticket, messaggi, allegati, conferme e letture si cancellano insieme dopo 12 mesi. Un amministratore non può scrivere un annuncio: gli annunci arrivano con un rilascio. Gea non vede il contenuto dei ticket altrui.

Un ticket vale quanto le prove che porta: pagina, ora e codice, oppure operatore e periodo, oppure il numero del registro.

> **Per gli sviluppatori:** `pages/ticket.php`, `js/code/ticket.js`, `lib/TicketWeb.php` (disponibilità e conteggio per la campanella), `lib/MobileV3/Feedback/TicketModel.php` (`STATI`, `STATI_CHIUSI`, etichette); azioni JSON `ticket_*` in `docs/03-cookbooks/24-ticket-azioni-json.md`. Il ticket appartiene all'identità, non alla riga `users` (ADR 49, GOP-762). Le fonti della campanella sono in `lib/CentroNotifiche.php`. Un annuncio è `annunci/AAAA-MM-GG-nome.json` con `.html` e `.svg`, mostrato dalla data `pubblicato`, nascosto se manca `annunci_letti` (migrazione 0030): «un annuncio che non si può chiudere per sempre non si mostra».

## Le pagine di sola lettura dello staff: Errori app, Log, Giro, Stato commesse

*Per lo staff tecnico; l'ufficio può leggerla per sapere che cosa lo staff guarda dopo un ticket.*

Dopo il ticket, lo staff tecnico legge. Ognuna delle quattro pagine di questa sezione risponde a una domanda sola, e da nessuna si corregge niente. Un rosso, un vuoto o un «Fallito» hanno ciascuno un significato scritto, ed è quello che la sezione fissa.

### Errori app e Log

In Admin › Diagnostica, «Errori app» mostra i blocchi dell'app, cioè i crash dei telefoni degli operatori della commessa. Da GOP-849, quando la lettura dai registri centrali è accesa, la pagina li prende da lì: gli ultimi 7 giorni, al massimo le 500 righe più recenti, solo della commessa aperta. Le colonne sono «ID», «Data», «Operatore», «Versione», «Stack trace»; i filtri «Operatore» e «Periodo»; «Dettaglio» apre una finestra con data, operatore, versione e build dell'app, versione di Android, telefono, SIM, traccia completa e «Copia testo». Una pagina vuota è normale, e il messaggio dice perché. Con la lettura dai registri centrali accesa, la pagina scrive «Nessun crash dell'app negli ultimi 7 giorni.» Senza, legge ancora la vecchia tabella dei crash, in cui nessuno scrive dal 12 luglio 2025, e rimanda a Gea: «Nessun errore app qui. I crash dell'app ora sono registrati nei log centrali: chiedili a Gea, l'assistente virtuale.» Un crash di un telefono la cui SIM non è legata a un solo operatore della commessa non compare.

«Log» mostra le azioni inviate dall'app degli operatori. Colonne «ID», «Data», «Operatore», «Azione», «Dati inviati»; filtri «Operatore», «Azione», «Periodo»; «Dettaglio». Un blocco dell'app non va confuso con le anomalie che l'app manda da sola (capitolo 8), né con Magazzino › Anomalie (capitolo 9).

### Giro

> **Attenzione:** qui «Giro» non è il giro dell'operatore (capitolo 5). È il registro delle attività automatiche che il sistema esegue a intervalli.

In Admin › Diagnostica, «Giro» mostra l'ultimo passaggio dello schedulatore e il registro delle attività, un record per attività, commessa e periodo. Fra le attività c'è una sonda che non fa nulla: serve a provare che lo schedulatore è vivo. Il filtro «Stato» elenca solo gli stati presenti, con il conteggio: «In coda», «In corso», «Completato», «Non applicabile», «Da ritentare», «Fallito». Il filtro «Cliente» sceglie la commessa; «Azzera» toglie i filtri. Ogni colonna ha una sola data, in ora di Roma, con l'ora UTC al passaggio del mouse. Si vedono 100 righe per pagina, con «Precedente» e «Successiva». I falliti e i lavori non conclusi vengono prima, perché un fallito di ieri non sparisca sotto i completati di oggi.

Le regole sono due. Lo schedulatore passa ogni 5 minuti; se non registra un giro per tre intervalli, cioè 15 minuti, la pagina lo mostra «Fermo». Un'attività fallita si ritenta dopo 5 minuti, 30 minuti e 2 ore; alla quarta esecuzione fallita diventa «Fallito» e manda un allarme nel registro degli errori della commessa. Un registro vuoto ha il suo messaggio: «Il registro e' vuoto: nessun giro e' stato ancora registrato (o Redis e' stato svuotato).» Quello «svuotato» non si riferisce a «Svuota cache Redis», che non tocca mai i record del Giro (sezione 6), ma a uno svuotamento fatto fuori dallo strumento.

### Stato commesse

In Admin › Clienti, «Stato commesse» è riservata a un solo accesso tecnico. Mostra una riga per commessa, con un pallino colorato e i suoi motivi, i numeri del mese e, nel dettaglio, i grafici di 30 giorni. I numeri vengono da una tabella centrale che un'attività del registro del Giro scrive ogni giorno alle 06:30; la pagina non interroga il database di nessuna commessa.

| Colore | Nome a schermo | Quando | Che cosa fare |
|---|---|---|---|
| grigio | «Ferma» | nessun intervento eseguito nel mese: «commessa ferma, nessun allarme»; gli altri motivi non si mostrano | niente |
| rosso | «Da guardare» | nessun invio dagli operatori per più di 2 giorni lavorativi (lunedì–venerdì), con interventi eseguiti nel mese | capire se il campo si è fermato o se i telefoni non mandano |
| giallo | «Attenzione» | il database della commessa è indietro rispetto alle migrazioni del codice, o è «fuori standard» senza la base delle migrazioni; oppure un'esportazione è aperta da più di 60 minuti | migrazioni: capitolo 16; esportazione: capitolo 7 |
| verde | «Regolare» | nessuno dei motivi | niente |

Il colore è il motivo più grave che scatta. Il messaggio rosso stampa il conteggio vero, per esempio «Nessun invio dagli operatori da 3 giorni lavorativi (ultimo: …)»: con la regola «più di 2», 3 è il numero più piccolo che può comparire. È il segnale che nel caso del capitolo 1 il sistema non aveva. Fra le colonne c'è «Costo AI · mese», la somma del costo registrato per ogni chiamata AI della commessa nel mese; il capitolo non ne riporta valori.
### Un permesso che non torna

Il controllo dell'amministratore si ferma ai quattro livelli del capitolo 11, e qui non si ripete. Lo staff tecnico prosegue con tre prove:

- **il rapporto «cosa verrebbe negato».** Finché i controlli dei profili sono in sola registrazione, ogni permesso che mancherebbe a un'identità lascia un evento `rbac_deny`, e il rapporto li classifica: `sospetto` (il vecchio livello lo consentiva, il profilo no: probabile profilo incompleto), `da_verificare` (controllo senza confronto, da vedere a mano), `atteso` (il permesso manca davvero), `gia_applicato` (il divieto blocca già, per esempio `json_admin`). È un comando dello staff, non una pagina;
- **l'evento `rbac_ambito_divergenza`**, che segnala quando l'ambito dei dati dato dal profilo è diverso da quello vecchio;
- **«Impersona»**, per guardare con gli occhi della persona, nei limiti del capitolo 11.

La sola registrazione non vuol dire che oggi tutti possono tutto: il livello precedente, il menu della commessa e le regole del server continuano a bloccare.

*Contro-obiezione.* «Il Giro dice «Fallito» su una commessa: l'ufficio deve fare qualcosa?» No. Quattro esecuzioni sono fallite e un allarme è già arrivato nel registro degli errori; lo staff tecnico legge il record. Se l'ufficio ha notato un effetto, come un numero non aggiornato o un'estrazione mancante, apre un ticket con la commessa e l'ora.

*Limite.* La finestra di 7 giorni e 500 righe di «Errori app» vale quando la lettura dai registri centrali è accesa, e copre solo i crash dei telefoni legati a un operatore. «Stato commesse» mostra solo quello che la tabella centrale registra: gli operatori del mese come picco giornaliero, nessun ritardo di arrivo delle foto; ed è per commessa, non per telefono, quindi un solo telefono muto dentro una commessa attiva si vede con i segnali del capitolo 8. Il rapporto delle negazioni legge eventi esportati e non accende nessun controllo: la decisione di accenderli sta fuori dalla pagina (capitolo 11).

Ogni pagina dello staff risponde a una domanda sola, e nessuna scrive: si legge, poi si decide.

> **Per lo staff tecnico:** `lib/AdminDiagnostica.php`, `lib/CrashLogReader.php` (GOP-833, GOP-834, GOP-849; lettura dai registri centrali dietro `GOPLANNER_CRASH_LOGS_READ`); `lib/GiroPagina.php`, `lib/GiroRegistro.php`, `lib/GiroAllarme.php` (fallimento definitivo → ERROR in `/goplanner/<tenant>/errors`, battito in `/goplanner/giro/scheduler`); `lib/StatoCommessePagina.php`, `lib/StatoCommesseSalute.php` (soglie nelle costanti), tabella `stato_commesse_giorno` (migrazione 0024); `scripts/rbac_report_negazioni.php` e `docs/03-cookbooks/30-rapporto-negazioni-rbac.md` («0 eventi» vuol dire esportazione sbagliata, non assenza di negazioni). Registri e allarmi: vedi il capitolo 16.

## Gli strumenti che scrivono: Manutenzione e Cruscotto Analisi AI

*Per lo staff tecnico. L'ufficio trova qui che cosa chiedere quando servono questi lavori.*

Alcuni di questi lavori non si annullano. Un consolidamento parte in coda e non si ferma; uno svuotamento di cache non torna indietro; un esito «sconosciuto» invita a un secondo clic che esegue due volte. Per questo gli strumenti che scrivono hanno, da GOP-839, GOP-840 e GOP-841, la stessa forma: il titolo della voce, una scheda con un campo etichettato, un pulsante e, prima di scrivere qualunque cosa, una conferma con i numeri. Se non c'è niente da fare, la pagina lo dice con un messaggio suo e non parte nulla; se l'anteprima non si legge, la riga dell'esito chiude con «Nessuna modifica eseguita.» Chi usa lo strumento vede la misura della modifica prima che avvenga.

### Consolida utenze

Riunisce in un'unica utenza le utenze con lo stesso codice. Il campo è «Numero massimo di codici da consolidare», obbligatorio, almeno 1, senza un valore proposto. La conferma dice «Verranno consolidati N codici utenza (su M duplicati ancora da consolidare). I job partono in coda e non si possono annullare.» Ogni lavoro sposta interventi, esecuzioni, righe dei carichi e foto sull'utenza risultante. Se non ci sono duplicati, la pagina risponde «Nessun codice utenza duplicato da consolidare.» e non parte nulla.

### Analisi AI foto per carico

Si scrive l'«ID del carico» e si preme «Avvia analisi AI». La conferma, «Conferma analisi AI», dice quanti interventi, quante foto (jpg, jpeg, png presenti su disco) e quante chiamate AI, una per intervento; con «Avvia analisi» parte. Gli interventi già analizzati sono saltati. Se il carico non ha interventi, o non ha foto analizzabili, non parte nulla. Dal 19 novembre 2026 la conferma non mostra più un costo stimato.

### Svuota cache

La voce di menu è «Svuota cache Redis», il pulsante «Svuota cache». La conferma ha un pulsante rosso, «Svuota», perché l'operazione non torna indietro, e dice quante chiavi verranno eliminate e quante sono protette. Le chiavi protette non si toccano mai: le code dei lavori, i lotti in corso, i record del Giro e lo storico dei lanci AI. Il codice lo motiva così: non sono cache ma stato, e cancellarli perderebbe i lavori in coda e farebbe rieseguire un giro già fatto. L'esito compare sotto il pulsante, «Cache svuotata alle *ora*: N chiavi eliminate.», oppure «La cache Redis è già vuota». Se l'esito è «Esito sconosciuto: risposta del server non leggibile. Riprova l'anteprima prima di ripetere.», si rifà l'anteprima prima di ripetere: lo svuotamento potrebbe essere già avvenuto.

### Cruscotto Analisi AI

1. Aprite Admin › Strumenti › «Cruscotto Analisi AI».
2. Scrivete la «Data di esecuzione» nel formato gg/mm/aaaa: è il giorno in cui gli interventi sono stati eseguiti, non quello pianificato. Un altro formato riceve «Scrivi la data come gg/mm/aaaa.»
3. Scrivete «Interventi per lancio (massimo)», da 1 a 500; il valore proposto è 50.
4. Premete «Avvia elaborazione».
5. Leggete la conferma: interventi, foto, chiamate AI (una per intervento) e quanti interventi restano fuori dal tetto.
6. Premete «Avvia analisi».

Il formato della data ha la sua storia. Prima di GOP-842 il cruscotto leggeva «03/04/2026» all'americana, come 4 marzo; oggi «03/04/2026» è sempre il 3 aprile. Dopo il lancio, la scheda «Stato avanzamento» conta «Analizzati», «Non riusciti», «Saltati», e il lavoro prosegue in coda anche se si chiude la pagina, con un segnalibro nel menu di sinistra. «Ultimi 10 lanci» riporta ogni lancio con l'esito «In corso», «Completato», «Completato con errori» o «Non riuscito». I «Non riusciti» non sono interventi sbagliati: l'analisi non si è conclusa. Un nuovo lancio sulla stessa data prende solo quelli non ancora analizzati. La pagina dice di sé: «L'analisi gira sul modello locale: qui vedi quanti interventi e quante foto verranno analizzati, non un costo.»

> **Quando chiedere allo staff tecnico:** un'analisi AI in blocco di un giorno o di un carico; codici utenza duplicati; il messaggio «Analisi AI non ancora disponibile su questa commessa.» (capitolo 6). Ognuna con un ticket che porta la commessa e la data o l'ID del carico.

*Limite.* Il consolidamento e lo svuotamento non si annullano. Il consolidamento non ha un tetto sul numero di codici: la misura è nel campo, e l'anteprima dice quanti ne restano. Il cruscotto analizza solo le foto presenti su disco, in jpg o png, e salta gli interventi già analizzati.

Rifatto con questi strumenti, il lunedì della sezione 1 si chiude in tre mosse: il codice di 8 caratteri copiato con la pagina e l'ora; l'«Ultimo invio» del telefono letto prima di premere «Verificato»; per il menu «Utenti», nessun permesso da chiedere. Quello che finisce in un ticket porta già le sue prove, e lo staff tecnico parte da lì senza richiedere niente; quando deve scrivere sui dati, legge prima i numeri della conferma. Chi segnala porta le prove; chi agisce legge i numeri prima di confermare.

> **Per gli sviluppatori:** forma comune in `docs/02-patterns/12-admin-maintenance.md` (anteprima, conferma, esito), `lib/AdminManutenzioneAnteprima.php`, `js/code/admin_manutenzione.js`; chiavi protette in `lib/RedisChiaviProtette.php` (`CODE`, `FRAMMENTI`); cruscotto in `js/code/admin_ai_dashboard.js`, `lib/AnalisiAiLanci.php`, `docs/02-patterns/18-ai-photo-analysis-batching.md` (GOP-842). Code e servizio che esegue i lavori: vedi il capitolo 13.

## Fonti

- codice: `lib/MenuAdmin.php`, `lib/AdminAreaUtenti.php`, `lib/AdminPaginaGuard.php`, `lib/RiepilogoMese.php`
- codice: `lib/BaseErrorHandler.php`
- codice: `chatbot-service/src/backend-errors.ts`
- codice: `pages/ticket.php`, `js/code/ticket.js`, `lib/TicketWeb.php`, `lib/MobileV3/Feedback/TicketModel.php`
- codice: `lib/CentroNotifiche.php`
- codice: `lib/AdminDiagnostica.php`, `lib/CrashLogReader.php`
- codice: `lib/GiroPagina.php`, `lib/GiroRegistro.php`, `lib/GiroAllarme.php`
- codice: `lib/StatoCommessePagina.php`, `lib/StatoCommesseSalute.php`
- codice: `scripts/rbac_report_negazioni.php`
- codice: `lib/AdminManutenzioneAnteprima.php`, `lib/AdminBase.php`, `lib/jobs/ConsolidaUtenzaJob.php`, `js/code/admin_manutenzione.js`, `lib/RedisChiaviProtette.php`, `lib/RedisHelper.php`
- codice: `lib/AnalisiAiLanci.php`, `js/code/admin_ai_dashboard.js`, `Smarty_templates/it/admin.html`
- wiki: `wiki/assistenza-clienti/pagina-admin-menu.md`
- wiki: `wiki/assistenza-clienti/runbook-errore-a-schermo.md`
- wiki: `wiki/assistenza-clienti/runbook-dove-si-e-fermato-il-dato.md`
- wiki: `wiki/assistenza-clienti/runbook-problemi-app-operatori.md`
- wiki: `wiki/assistenza-clienti/sezione-ticket.md`
- wiki: `wiki/assistenza-clienti/aprire-un-ticket-da-gea.md`
- wiki: `wiki/assistenza-clienti/annunci-novita-campanella.md`
- wiki: `wiki/assistenza-clienti/pagina-admin-errori-app-e-log.md`
- wiki: `wiki/assistenza-clienti/pagina-admin-giro-stato-commesse.md`
- wiki: `wiki/assistenza-clienti/pagina-admin-manutenzione.md`
- wiki: `wiki/assistenza-clienti/pagina-admin-cruscotto-analisi-ai.md`
- docs: `docs/02-patterns/12-admin-maintenance.md`
- docs: `docs/02-patterns/18-ai-photo-analysis-batching.md`
- docs: `docs/02-patterns/44-giro-giornaliero-a-job.md`
- docs: `docs/02-patterns/48-ticketing-base.md`
- docs: `docs/03-cookbooks/24-ticket-azioni-json.md`
- docs: `docs/03-cookbooks/30-rapporto-negazioni-rbac.md`
- docs: `docs/03-cookbooks/35-errori-dei-job-in-background.md`
- docs: `docs/03-cookbooks/36-osservabilita-canale-mobile.md`
- Portolano: `gop-138-74ee73fe8ee88beaaa338bb9` (menu Admin)
- Portolano: `gop-138-b65ebd4594a2fa1aa2b52afe` (Giro e Stato commesse)
- Portolano: `gop-138-009a945d613febcd23d27228` (Errori app e Log)
- Portolano: `gop-138-5a3f64995b50c0610038858a` (Manutenzione)
- Portolano: `gop-138-e30ac99f4dbbe517b6bc9566` (Cruscotto Analisi AI)
- Portolano: `gop-138-a4cdaad020e1f8fff160b752` (aprire un ticket da Gea)
- Jira: GOP-195 — canale dei log mobili silenzioso
- Jira: GOP-249 — Gestore errori: schermata Industry in produzione, dettaglio PHP solo in locale
- Jira: GOP-264 — Osservabilità del canale mobile: «dove si è fermato il dato»
- Jira: GOP-270 — il canale mobile della commessa non riceve più eventi
- Jira: GOP-581 — RBAC: rapporto «cosa verrebbe negato»
- Jira: GOP-601 — Gestione utenti dentro Admin, mostrata per permesso
- Jira: GOP-608 — guardia delle pagine Admin
- Jira: GOP-654 — voce «Report» per l'estrazione mensile
- Jira: GOP-658 — Menu Admin (1/6): gruppi apribili e gruppo «Utenti»
- Jira: GOP-659 — Menu Admin (2/6): gruppi di sistema Clienti, Diagnostica, Strumenti
- Jira: GOP-712 — Novità: campanella nella barra in alto e pagina Novità
- Jira: GOP-725 — Stato commesse 2/4: tabella centrale dei numeri, job delle 06:30
- Jira: GOP-726 — Stato commesse 3/4: pagina Admin › Clienti › Stato commesse
- Jira: GOP-727 — Stato commesse 4/4: indicatore di salute per commessa
- Jira: GOP-757 — Ticketing 1/4: base dei ticket
- Jira: GOP-758 — Ticketing 2/4: sezione Ticket nel back office
- Jira: GOP-762 — Ticket legati all'identità, commessa facoltativa
- Jira: GOP-833 — Errori app: elenco dei crash in sola lettura
- Jira: GOP-834 — Log: registro delle azioni degli operatori in sola lettura
- Jira: GOP-838 — Giro: registro compatto con filtri e un solo fuso orario per riga
- Jira: GOP-839 — Consolida utenze: campo con etichetta, anteprima e conferma
- Jira: GOP-840 — Analisi AI per carico: titolo, numeri prima di «Avvia»
- Jira: GOP-841 — Cache Redis: conferma prima di svuotare ed esito visibile
- Jira: GOP-842 — Cruscotto Analisi AI: avanzamento, storico dei lanci e data in formato italiano
- Jira: GOP-849 — Errori app: crash letti dai log centrali
- Jira: GOP-864 — Gea: leggere anche gli errori del server
