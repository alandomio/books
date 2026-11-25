# 6. Interventi, esiti e verifica

*In questo capitolo si impara che un intervento ha due registrazioni: quella pianificata dall'ufficio e quella che l'operatore restituisce dal telefono. Si vede che cosa può fare l'ufficio dopo che l'app ha restituito un esito (riaffidare, annullare, eliminare, ripianificare, verificare, far guardare le foto all'AI) e che cosa ogni pulsante conserva o cancella. È scritto per il back office; i riquadri per gli sviluppatori si possono saltare.*

## Gli stati di un intervento

*Per il back office.*

Un caso inventato, ma possibile. Su una commessa senza interventi multipli un operatore registra un non fattibile con tre foto e il motivo. Il giorno dopo l'ufficio apre la scheda, preme «Ripianifica», sceglie un collega e una data, conferma. Il collega trova il nuovo intervento nell'app. Il vecchio, con il suo esito e le sue tre foto, non esiste più: né nel gestionale né sul disco. Nessuno ha sbagliato procedura. Il pulsante ha fatto quello che fa su quella commessa, e chi lo ha premuto non lo sapeva.

Questo capitolo serve a sapere, prima di premere, che cosa resta. Lo decidono due cose: lo stato dell'intervento, che dice quali pulsanti agiscono, e le impostazioni della commessa, che dicono che cosa ogni pulsante conserva. Il primo dato da leggere è lo stato.

Lo stato dice dove si trova l'intervento nel suo percorso; l'esito dice che cosa ha dichiarato l'operatore con l'app. Sono due cose diverse e il capitolo le tiene separate. Il percorso di un intervento normale è breve. L'importazione lo crea come Importato (1). La pianificazione lo porta ad Assegnato (3), con un operatore e una data (vedi il capitolo 5, *Pianificazione*). Dal telefono torna Eseguito (4), Non fattibile (5), Ripianificabile (8) o Utente assente (99). In ufficio, il pulsante «Verificato» lo porta a Controllato (6). Infine, su alcune commesse, l'esecuzione passa a Inviato (7), lo stato del dato consegnato al committente. Tre stati stanno fuori da questa linea: Validato (2), Annullato (9) e Prenotato (10).

Lo stato si legge in Interventi › Lista, nella colonna «Stato». È un'etichetta colorata che riporta il nome dello stato in minuscolo: «assegnato», «non fattibile», «controllato». Controllato ha un'icona con la doppia spunta. Annullato è barrato. Il filtro «Stato» della stessa pagina offre le voci che la commessa ha nella sua tabella degli stati, nell'ordine del codice.

| Codice | Stato | Chi lo scrive | «Modifica» cambia operatore e data? |
|---|---|---|---|
| 1 | Importato | l'importazione | no |
| 2 | Validato | il gestionale, sull'utenza rimasta senza intervento | no |
| 3 | Assegnato | la pianificazione; il call center quando c'è un operatore | sì |
| 4 | Eseguito | l'app | no |
| 5 | Non fattibile | l'app | no |
| 6 | Controllato | l'ufficio, con «Verificato» | no |
| 7 | Inviato | l'importazione di un file di inviati; alcune esportazioni | no |
| 8 | Ripianificabile | l'app | no |
| 9 | Annullato | l'ufficio con «Annulla»; il call center | sì, resta Annullato |
| 10 | Prenotato | il call center, quando l'appuntamento non ha operatore | no |
| 99 | Utente assente | l'app | no |

Tre righe chiedono una spiegazione. Annullato (9) e Ripianificabile (8) sembrano parenti, e non lo sono. Annullato è la cancellazione amministrativa: è uno stato finale, e il resto dell'applicazione lo esclude dalle liste attive. Ripianificabile vuol dire che il lavoro non è stato completato sul campo ed è da rifissare. Tenerli separati serve a non perdere di vista quello che va ancora fatto. Prenotato (10) è l'appuntamento fissato ma ancora senza operatore: lo si trova in Interventi › Da assegnare, dove «Assegna» lo porta ad Assegnato (vedi il capitolo 5).

Validato (2) merita una nota a parte. Nel codice attuale non viene scritto su nessun intervento: lo riceve l'utenza quando le viene tolto o cancellato l'ultimo intervento aperto. Lo stato dell'utenza è un altro discorso, che deriva dall'ultimo intervento toccato: vedi il capitolo 3, *Utenze e liste*.

> **Attenzione:** Inviato (7) non è la prova che il dato sia arrivato al committente. Le fonti trovano lo stato 7 scritto dall'importazione di un file di inviati, da un'esportazione storica delle letture e da una procedura di riparazione dell'area Admin, non da ogni esportazione. Un intervento già consegnato può quindi essere ancora Controllato (6): per sapere se un esito è uscito verso il committente, la colonna «Stato» non basta.

Per i Ripianificabili (8) non esiste una pagina dedicata. Compaiono come colonna «Ripianificabili» nella griglia dei carichi in Admin, come segmento della barra di avanzamento del carico e come voce del filtro «Stato» della Lista. Per rifissarli si usa «Ripianifica», descritto più avanti.

Una commessa ha uno stato in più, che in realtà è un esito. Si chiama «Da finire»: l'operatore ha salvato a metà con il pulsante «Salva e torna all'elenco» e l'intervento resta Assegnato, con l'etichetta «DA FINIRE» nell'elenco dell'app. Finché è Da finire è in mano all'operatore, e la Verifica non lo chiude. Il messaggio è questo: «L'intervento è “Da finire”: è in mano all'operatore, che deve chiuderlo dall'app. Dalla Verifica si potrà chiudere dopo.» La regola serve a fare in modo che un solo responsabile alla volta tenga l'intervento.

**Limite.** La tabella vale per l'impostazione predefinita. Le etichette e l'insieme degli stati mostrati possono cambiare da commessa a commessa. Le commesse più vecchie hanno le righe 9 e 10 solo se il loro aggiornamento del 18 settembre 2026 è stato eseguito a mano. Senza quelle righe la Lista mostra gli appuntamenti annullati o prenotati con lo stato vuoto, e il filtro non li seleziona. Lo stato 99 non ha una riga nella tabella degli stati, e le fonti non dicono che cosa mostri la colonna «Stato» per un Utente assente. C'è infine la finestra temporale. Senza filtri, Interventi › Lista mostra solo gli interventi con «Data pianificata» negli ultimi sei mesi. Non manca niente: basta scegliere una «Lista» o un intervallo di date.

> **Per gli sviluppatori:** `interventi.stato_id` e `interventi_eseguiti.stato_id` puntano alla tabella `stati`. Le costanti sono in `lib/InterventoBase.php`, `lib/InterventoEseguitoBase.php` (con `STATO_UTENTEASSENTE = 99`) e `lib/UtenzaBase.php`. Inviato (7) viene scritto solo su `interventi_eseguiti`: `interventi.stato_id` resta a 4 o 6, quindi 6 e 7 si leggono dall'esecuzione. Le etichette della Verifica sono in `VerificaInterventi::configPredefinita()`, chiave `stati`, che la commessa (nel codice si chiama tenant) può ridefinire.

La regola da ricordare: prima di qualunque azione si guarda la colonna «Stato». Decide quale pulsante può funzionare.

## Intervento ed esecuzione: che cosa torna dal telefono

*Per tutti.*

All'assistenza arriva spesso una domanda con la stessa forma: l'operatore dice di aver chiuso l'intervento, ma in ufficio l'esito non c'è. La prima risposta da cercare sta nella differenza fra due registrazioni che lo schermo tende a confondere.

L'intervento è il lavoro da fare: un'utenza, una lista, un operatore, una data. Vive nella tabella `interventi` e lo crea l'ufficio, con l'importazione e la pianificazione. L'esecuzione è quello che è tornato dal campo. Vive in un'altra tabella, `interventi_eseguiti`, e la scrive il telefono quando l'operatore chiude. Le due righe hanno lo stesso numero: a ogni intervento corrisponde al massimo un'esecuzione.

Un'esecuzione contiene parecchio. C'è la data, con l'ora di inizio e di fine. C'è la posizione: latitudine, longitudine, precisione e distanza dall'utenza. Ci sono fino a nove letture, le note (fino a 2.000 caratteri), lo stato, il motivo e l'esito, che vale 1 se positivo e 0 se negativo. I campi personalizzati compilati alla chiusura finiscono tutti insieme in un unico campo, `servizi`. Le foto stanno in una tabella propria e sono legate all'intervento con lo stesso numero dell'esecuzione.

Gli esiti che l'operatore può scegliere in GOPlanner 3, e lo stato che ciascuno scrive, sono questi:

| Esito nell'app | Stato scritto | Chiude l'intervento |
|---|---|---|
| Eseguito | 4 Eseguito | sì |
| Non fattibile | 5 Non fattibile | sì |
| Ripianificabile | 8 Ripianificabile | sì |
| Utente assente | 99 Utente assente | sì |
| Da finire (solo dove la commessa lo prevede) | resta 3 Assegnato | no |

Solo «Eseguito» è un esito positivo. Come l'operatore registra esito, foto e firma dal telefono è il tema del capitolo 8, *L'app*; qui interessa ciò che arriva in ufficio.

Da questa separazione discendono tre conseguenze pratiche. La prima: l'esportazione parte dalle esecuzioni, quindi un intervento senza esecuzione non entra nel file (vedi il capitolo 7, *Esportazione*). La seconda: le foto appartengono all'intervento eseguito, e se l'ufficio apre un altro intervento della stessa utenza vede «Nessuna foto per questo intervento» senza che nulla sia andato perso. La terza: su una commessa con interventi multipli l'utenza può leggere ancora «assegnato» dopo una chiusura, perché il suo stato copia quello dell'ultimo intervento toccato. Il lavoro non è andato perso (vedi il capitolo 3).

> **Contro-obiezione.** «L'operatore dice di aver chiuso l'intervento, ma in ufficio non vedo l'esito.»
>
> Si controlla in quest'ordine. Primo: è l'intervento giusto? Un'utenza può averne più d'uno, e l'esito sta solo su quello chiuso. Secondo: in Interventi › Lista si filtra per operatore e per data, ricordando la finestra di sei mesi. Terzo: se l'esecuzione manca davvero, il dato si è fermato tra il telefono e il server. Le cause possibili sono tre: non è mai partito dal telefono, si è perso per strada, oppure è arrivato al server e non è stato salvato. Il caso tipico del «non è mai partito» è un tablet che tace da più di 48 ore. La ricerca segue il runbook «dove si è fermato il dato» (vedi il capitolo 12, *Strumenti di amministrazione e diagnostica*).

Un caso reale mostra perché conviene seguire quest'ordine prima di pensare a una perdita. Su una commessa la Verifica non mostrava né eseguiti né foto, e l'operatore diceva di aver inviato tutto. La causa era tecnica: un campo `servizi` vuoto faceva fallire la lettura dell'intera griglia, e una scheda pensata per un'altra commessa cercava una colonna che lì non esisteva. Dopo la correzione, i campi vuoti vengono trattati come assenti e la colonna viene letta solo se c'è. I dati non erano mai andati persi.

**Limite.** L'ufficio corregge un'esecuzione solo dalla pagina di Verifica (vedi più avanti in questo capitolo). Le foto non si modificano dal back office: sono firmate dal telefono. E un nuovo invio dall'app può, in un caso preciso, sovrascrivere una correzione dell'ufficio. Il caso è stretto. Dopo «Verificato» nessun invio sovrascrive più niente, su nessuna commessa. GOPlanner 3 rifiuta anche di riscrivere un intervento già Eseguito o Non fattibile. Il rischio resta solo con l'app precedente, prima della verifica, sulle commesse che non segnano le correzioni dell'ufficio come protette. Quattro commesse le segnano a ogni salvataggio nella Verifica. Su questo punto la regola dipende dalla commessa.

> **Per gli sviluppatori:** il collegamento è `interventi_eseguiti.id = interventi.id_intervento`; `interventi_eseguiti` non ha una colonna `id_intervento`. `InterventoBase::getInterventoEseguito()` non restituisce mai null: senza riga restituisce un oggetto nuovo non salvato, quindi il controllo corretto è `!$ie->isNew()`. Il flag di protezione è la colonna `backoffice`, scritta a 1 dove la commessa imposta `backoffice_su_modifica`.

## Cambiare operatore o data: Modifica, Annulla, Elimina

*Per il back office.*

Un operatore si ammala e domani ha venti interventi in agenda. Vanno passati a un collega. La procedura è breve, ma ha un tranello: se l'intervento non è nello stato giusto, la pagina non dice niente e non fa niente.

### Riaffidare o spostare

1. Apri Interventi › Lista.
2. Scegli la «Lista» nella barra, poi filtra o cerca gli interventi da spostare.
3. Seleziona le righe.
4. Premi «Modifica». Si apre la finestra «Modifica intervento», con la sezione «Dati intervento» e il numero di «Interventi selezionati».
5. Scegli il nuovo «Operatore», la nuova «Data» (gg/mm/aaaa), o entrambi. Lascia vuoto quello che non deve cambiare.
6. Premi «Modifica intervento».
7. Nella riga ricaricata, controlla operatore e data.

Il settimo passo non è una formalità. «Modifica» agisce solo sugli interventi Assegnato (3) e Annullato (9); tutti gli altri vengono scartati già nella ricerca sul server. Un Prenotato, un Non fattibile, un Ripianificabile, un Utente assente restano come sono, con l'operatore e la data di prima. Nessun messaggio lo segnala: la pagina si ricarica come se tutto fosse andato bene. Se nella selezione c'era un Prenotato da dare al collega, o un non fattibile da rifare, il collega non lo riceve e nessuno passa da quell'utenza.

Il rischio ha una misura precisa. Non si rompe niente: l'intervento saltato è identico a prima, e il rimedio è un'occhiata alla colonna «Stato». Per un non fattibile la strada giusta è «Ripianifica», nella sezione seguente. E un Annullato spostato resta Annullato: cambiano solo operatore e data, mai lo stato.

Perché non usare «Assegna»? Perché crea l'intervento per le utenze che non ne hanno uno; su un'utenza già assegnata risponde che è già pianificata e non riaffida niente (vedi il capitolo 5). Anche Gea può preparare un cambio di operatore o di data, se le si dà il numero dell'intervento. Vale la stessa regola sugli stati, con una differenza: quando l'intervento non è Assegnato né Annullato, Gea rifiuta e lo dice, invece di saltarlo in silenzio. Non succede nulla finché qualcuno non preme «Autorizza» (vedi il capitolo 10, *Gea*).

Una nota sulla selezione. «Tutti» seleziona solo le righe visibili nella pagina corrente, non l'intera lista filtrata. Le dimensioni di pagina disponibili sono 10, 25, 50, 100, 250 e 1.000 righe. «Modifica», «Annulla» ed «Elimina» lavorano tutti sulle righe selezionate.

### Annullare

«Annulla» porta gli interventi selezionati ad Annullato (9). La conferma si intitola «Annulla interventi» e dice: «Sei sicuro di voler annullare gli interventi selezionati? L'operazione non è reversibile.» Il testo va preso alla lettera. Le fonti non indicano un modo per riportare un intervento annullato allo stato precedente dal back office; l'unica riattivazione documentata passa dal call center, che riusa lo stesso appuntamento. «Annulla» non controlla lo stato di partenza, non tocca l'esecuzione e non aggiorna l'utenza: cambia solo lo stato dell'intervento. Un'utenza il cui intervento è stato annullato può quindi leggere ancora «assegnato» (vedi il capitolo 3).

### Eliminare

«Elimina» chiede conferma con una finestra intitolata «Elimina interventi»: «Sei sicuro di voler eliminare gli interventi selezionati? L'operazione non è reversibile.» Poi applica due protezioni.

La prima riguarda gli interventi chiusi. Se esiste un'esecuzione, l'intervento non viene cancellato. Il riepilogo, intitolato «Interventi non cancellati», elenca ogni numero rifiutato con il testo «Intervento non cancellato perché già chiuso (intervento eseguito associato).» Un doppio clic non fa danni: un intervento già cancellato risulta cancellato con successo. Se dopo la cancellazione l'utenza non ha più interventi aperti, torna Validata.

La seconda riguarda gli appuntamenti del call center. Non vengono cancellati: passano ad Annullato, e in testa alle note compare «[Annullato da back-office: …]», con chi lo ha fatto, la data e l'ora. Il riepilogo dice «Appuntamenti del call center annullati invece che eliminati (restano nello storico come Annullato)». La protezione nasce da un problema concreto: prima della correzione «Elimina» cancellava davvero quegli appuntamenti, e il call center, quando provava a spostarli, riceveva un errore 404 (risorsa non trovata).

> **Per gli sviluppatori — un caso reale.** Problema: su una commessa alcune esecuzioni sparivano dall'esportazione. Causa: diversi percorsi di cancellazione toglievano interventi senza guardare `interventi_eseguiti`; le tabelle sono MyISAM, senza chiavi esterne, e le esecuzioni orfane cadevano fuori dalle esportazioni costruite con `LEFT JOIN interventi` e un filtro su colonne di `interventi`. Rimedio: un controllo in `Intervento::delete()`, ripetuto in `elimina_intervento` per le commesse che hanno un proprio `php/Intervento.php`; `del_intervento` e `del_interventi` passano da `elimina_interventi_non_chiusi()` in `lib/json_functions.php`, che salta le righe con un'esecuzione e restituisce quante ne ha bloccate.

**Limite.** I pulsanti della barra della Lista sono definiti commessa per commessa: «Annulla», per esempio, non c'è dappertutto. Anche la finestra «Modifica intervento» varia, e alcune commesse aggiungono il «Tipo intervento». Interventi › Mappa ha un suo «Elimina», che riguarda tutti gli interventi non chiusi dell'operatore e non solo quelli del giorno: vedi il capitolo 5 prima di usarlo.

La regola: se la riga non cambia, guarda lo «Stato». «Modifica» sposta, «Annulla» chiude amministrativamente, «Elimina» cancella solo ciò che non ha un esito.

## Il non fattibile: Ripianifica e il destino del precedente

*Per il back office.*

Un non fattibile chiuso non si riapre e non si modifica. Per rifare il lavoro si crea un intervento nuovo. Il punto delicato non è il nuovo intervento: è che cosa succede al vecchio.

### Ripianificare

1. Apri Rapporti › Verifica interventi.
2. Trova l'intervento con i filtri e apri la sua scheda.
3. Premi «Ripianifica», nella barra in basso a sinistra di «Verificato».
4. Nella finestra «Ripianifica» seguita dal codice, scegli l'«Operatore» e la «Data» (gg/mm/aaaa). Sono entrambi obbligatori.
5. Dove la commessa lo prevede, compila «Cancella precedente».
6. Premi «Assegna incarico».
7. Leggi il messaggio: «E' stato creato un nuovo intervento di …» seguito dal tipo di intervento e dal numero.

Se manca l'operatore compare «Seleziona l'operatore a cui assegnare l'intervento»; se la data non è valida, «Data di ripianificazione non valida». In entrambi i casi non cambia nulla, né sul vecchio né sul nuovo. La finestra non si apre mentre un «Verificato» è in corso («Verificato in corso: ripianifica non aperta») o se la scheda non è in vista.

«Ripianifica» crea sempre un intervento nuovo per la stessa utenza e la stessa lista, in stato Assegnato, con l'operatore e la data scelti. L'utenza torna Assegnata e l'operatore la vede nell'app. Fin qui niente si perde.

### Che fine fa il precedente

Il destino del vecchio intervento dipende da un'impostazione della commessa: gli interventi multipli, cioè la possibilità che un'utenza abbia più interventi nella stessa lista.

| Commessa | Che cosa succede al precedente |
|---|---|
| senza interventi multipli | viene sempre cancellato, con esito e foto, file compresi |
| con interventi multipli | resta, con esito e foto, accanto al nuovo; viene cancellato solo con «Cancella precedente: Sì» |

«Cancella precedente» è un menu a tendina con tre voci: vuoto, «Sì» e «No». Solo «Sì» cancella; lasciarlo vuoto equivale a «No». Quante commesse abbiano gli interventi multipli dipende dalla configurazione di ciascuna: nel codice le configurazioni con gli interventi multipli sono più di quelle senza, ma le fonti non dicono quante siano commesse attive. Conta la propria commessa, e per orientarsi basta la finestra. Se mostra «Cancella precedente», la commessa ha gli interventi multipli e il vecchio resta, salvo «Sì». Se non lo mostra, si dà per certo il caso peggiore: il vecchio sparirà con esito e foto. Quando quelle foto contano, ci si ferma prima di «Assegna incarico» e si chiede allo staff tecnico.

Quando il precedente viene cancellato si perde questo:

- l'esito e il suo stato;
- le foto, con i file sul disco;
- la presenza nelle esportazioni, che partono dalle esecuzioni;
- la presenza nella storia dell'utenza.

Sulle commesse senza interventi multipli la cancellazione è automatica. Le fonti la descrivono come il comportamento attuale, in attesa di una decisione su come trattarlo, non come una scelta di progetto. Finché la decisione non c'è, chi ripianifica su quelle commesse deve sapere che il vecchio esito sparirà.

> **Contro-obiezione.** «Ma se tengo il vecchio non fattibile, il carico non mi conta un non fattibile in più?»
>
> No. Nell'avanzamento dei carichi un non fattibile conta solo finché è l'ultimo intervento non annullato dell'utenza. Appena si ripianifica, l'ultimo diventa il nuovo, e il vecchio esce dal conteggio pur restando nello storico. Tenerlo non gonfia i numeri, e cancellarlo non li corregge: i conti del carico sono gli stessi nei due casi.

La scelta si fa una volta sola. «Elimina» rifiuta qualunque intervento chiuso, quindi un non fattibile conservato non si potrà togliere più tardi dal gestionale. L'unico momento in cui il precedente si può cancellare è la ripianificazione, con «Cancella precedente: Sì». Per quel momento c'è un'indicazione di prudenza, che la documentazione stessa presenta come tale e non come una decisione registrata:

- tienilo se è stato verificato, inviato o esportato al committente, o se le foto e le motivazioni contano;
- cancellalo solo se è stato registrato per errore o è un doppione inutile;
- nel dubbio, tienilo.

**Limite.** «Ripianifica» non controlla lo stato: funziona su qualunque intervento aperto nella Verifica, non solo sui non fattibili. Le commesse ancora sulla Verifica precedente hanno una propria scheda, con «Ripianifica» in un'altra posizione. Un esito cancellato non si recupera dal gestionale: è una domanda per lo staff tecnico, senza promessa di recupero.

## Rapporti › Verifica interventi: controllare e chiudere

*Per il back office.*

Un intervento eseguito sul campo non è ancora un intervento consegnato. Fra le due cose c'è la Verifica: l'ufficio guarda le foto, corregge quello che serve e preme «Verificato». Su alcune commesse, senza quel passaggio, il lavoro non arriva al committente.

La pagina descritta qui è la Verifica unica: una sola pagina, adattata commessa per commessa, scritta per sostituire le varianti che esistevano prima, una per tipo di commessa. La sostituzione è in corso. La pagina si apre da Rapporti › Verifica interventi, la prima voce del menu Rapporti, solo sulle commesse già passate: al 24 novembre 2026 le configurazioni attivate sono undici, una delle quali di prova. Le altre commesse usano ancora la pagina precedente.

### Trovare l'intervento

La barra in alto ha quattro filtri: «Lista», «Operatore», «Periodo» (da/a) e «Codice». Accanto ci sono tre spunte. «Solo da verificare» è attiva quando la pagina si apre. «Interventi mancanti» mostra gli interventi senza esecuzione. La terza è «No tipo». Ci sono poi i pulsanti «Carica dati dai terminali» e «Analisi AI».

Dove la commessa ha la ricerca per utenza, «Codice» propone dei suggerimenti («Codice, matricola o ragione sociale»). Scegliendone uno si vedono tutti gli interventi di quell'utenza, ignorando il «Periodo» e la spunta «Solo da verificare». Scrivendo senza scegliere, il campo filtra per codice o matricola.

La tastiera accelera il lavoro. Le frecce su e giù cambiano intervento, le frecce a sinistra e a destra cambiano foto, Invio preme «Verificato» e passa al successivo da verificare. Alla fine compare «Nessun altro intervento da verificare in questa pagina». Per dare un ordine di grandezza: una commessa ha registrato 3.644 interventi eseguiti in 90 giorni.

### La scheda

A sinistra c'è l'elenco; a destra le foto e la scheda. Sopra c'è la striscia delle foto, ciascuna con il suo tipo. Per cambiare il tipo si fa clic sull'etichetta del tipo stesso: «la foto non viene modificata», dice il suggerimento. L'etichetta corretta mostra «· corretto», e il gestionale conserva sia il tipo originale sia quello corretto, con chi l'ha cambiato e quando.

Sotto la striscia ci sono i blocchi della scheda. «Dati rilevati», in sola lettura: «Operatore», «Esito», «Distanza», «Matricola attuale», «Prevista sostituzione», «Posizione». Poi «Verifica», che si salva da solo campo per campo: «Data e ora» ed «Esito intervento». Poi i campi personalizzati della commessa, sotto l'intestazione «Campi del cliente». In fondo, sempre ultimo, «Note».

Due etichette si somigliano e vanno tenute distinte. «Esito», nei «Dati rilevati», è quello che ha dichiarato il telefono: «Positivo» o «Negativo», e non si modifica. «Esito intervento», nel blocco «Verifica», imposta lo stato: le scelte predefinite sono «Eseguito» e «Non fattibile». Il primo è un fatto registrato dall'operatore; il secondo è la decisione di chi verifica.

Ogni campo segnala il suo stato: «In modifica» (rosso mentre si scrive), «Salvataggio…», «Salvato» (verde), oppure «Errore». Salvare un campo non chiude la verifica. La chiude solo «Verificato», che viene rifiutato finché un campo è in errore: «correggi prima il campo in errore».

### I pulsanti in basso

- «Verbale», il PDF dell'intervento, ed eventuali altri PDF della commessa;
- «Anagrafica», la scheda dell'utenza;
- «Carica foto», solo dove la commessa lo ha attivato;
- «Ripianifica», descritto nella sezione precedente;
- «Verificato», il pulsante principale.

«Verificato» porta l'esecuzione a Controllato (6). Nella pagina di Verifica l'etichetta di quello stato si legge «Verificato»; nella Lista si legge «controllato». È lo stesso stato. Su un intervento già Inviato il tasto Invio non funziona («Intervento già inviato: Invio non lo riporta a Verificato»); il clic del mouse invece lo riporta a Controllato. Su un Inviato, quindi, «Verificato» si preme solo di proposito. Per salvare i campi e premere «Verificato» serve il permesso di modificare gli interventi; senza, compare «Non hai il permesso di modificare gli interventi».

Perché «Verificato» conta oltre la pagina? Su una commessa il file di ritorno al committente prende solo gli interventi Controllato, con esito positivo e con la «Data validazione» nel periodo scelto. La catena è corta. Un intervento non verificato non ha lo stato Controllato. Senza Controllato non entra nel file. L'ufficio quindi verifica prima di esportare (vedi il capitolo 7). Anche l'avanzamento del carico, nell'impostazione predefinita, conta come completati gli stati 6 e 7: un intervento eseguito ma non verificato non fa avanzare il carico.

Le correzioni fatte qui sono al sicuro dopo «Verificato»: da quel momento nessun invio dall'app le sovrascrive (vedi la sezione *Intervento ed esecuzione*). La stessa regola ha un rovescio. Su un intervento fra gli «Interventi mancanti», senza esecuzione, «Verificato» crea la riga dell'esecuzione in quel momento, già Controllata, ma vuota di tutto quello che il telefono non ha ancora mandato. Se poi l'invio dell'operatore arriva, trova un intervento già chiuso e non viene scritto: GOPlanner 3 lo rifiuta, l'app precedente lo ignora senza avvisare. Prima di verificare un intervento mancante si esclude quindi che il dato sia fermo sul telefono (vedi il capitolo 12).

> **Contro-obiezione.** «Ho verificato un intervento e ora non lo trovo più.»
>
> È la spunta «Solo da verificare», attiva all'apertura: nasconde gli stati 6 (Controllato) e 7 (Inviato). Togli la spunta e controlla il «Periodo».

**Limite.** I campi della scheda, i tipi di foto, i pulsanti PDF e il pulsante dell'AI cambiano da commessa a commessa. L'esempio della «Data validazione» vale per una sola commessa. Le commesse non ancora passate alla pagina unica usano la loro Verifica precedente, che questo capitolo non descrive campo per campo. Se una commessa dovrebbe avere la nuova pagina e non ce l'ha, è una domanda per lo staff tecnico.

> **Per gli sviluppatori:** la pagina è `rapporti.php?action=verifica_unica`; `action=verifica` viene reindirizzata lì quando la commessa, cioè il tenant, imposta `$custom['verifica_unica']`. Logica in `lib/VerificaInterventi.php` (`STATO_VERIFICATO = 6`, `STATI_CHIUSI = '6, 7'`), interfaccia in `js/code/verifica_unica.js`, endpoint `verifica_*` in `lib/JSONController.php`. Sulla commessa con la «Data validazione» è attivo `verificato_via_orm`: un UPDATE diretto avrebbe fatto sparire gli interventi verificati dal file. Le estensioni per commessa sono in `docs/03-cookbooks/34-verifica-interventi-estensioni-tenant.md`, senza copiare il JS nella cartella della commessa.

La regola: eseguito non vuol dire consegnato. Prima di esportare, «Verificato».

## L'analisi AI delle foto: l'AI propone, l'ufficio decide

*Per il back office.*

Il principio viene prima di ogni pulsante, ed è scritto nella pagina stessa: «L'AI propone, il back office decide: nessun esito viene scritto sull'intervento senza la conferma del revisore.» L'analisi non scrive nulla sull'intervento, sull'esecuzione, sulle foto o sui campi personalizzati. Scrive solo nelle proprie tabelle. L'«Esito AI» è informativo: indica quali foto guardare, non invalida l'intervento e non ne cambia lo stato.

### Lanciare l'analisi

In Rapporti › Verifica interventi il pulsante «Analisi AI» (o «Analisi AI (n)», con n interventi selezionati) apre un pannello con tre modi:

- «Sugli interventi selezionati»: si spuntano prima gli interventi nell'elenco, poi «Avvia l'analisi»;
- «Su tutto il carico»;
- «In background, con avanzamento»: parte su tutto il carico con «Avvia in background», e la finestra si può chiudere mentre la colonna «Esito AI» si riempie.

Gli ultimi due richiedono una lista: «Scegli prima una lista nei filtri.» Il pannello mostra «N di M interventi analizzati». Un secondo lancio sugli stessi interventi risponde «Questi interventi sono già in coda o in corso.»

La colonna «Esito AI» ha questi valori:

| Esito AI | Che cosa dice all'ufficio |
|---|---|
| Conforme | le foto confermano quanto registrato |
| Da verificare | c'è qualcosa da guardare a occhio |
| Non conforme | un controllo è fallito: le foto vanno guardate |
| Non analizzato | l'analisi non è stata fatta |
| In coda / In corso | l'analisi sta lavorando |
| Non riuscita | l'analisi si è interrotta: si riprova |

I controlli si chiamano «Tipo di foto», «Matricola», «Nuova matricola», «Lettura», «Sigillo presente», «Modello e calibro», «Targhetta metrica», «Piombatura dopo la verifica», «Qualità della foto» e «Posizione dello scatto». Le regole principali sono poche:

- la matricola si confronta ignorando spazi, trattini e maiuscole; un solo carattere diverso dà Da verificare, e un valore illeggibile non è mai Conforme;
- la lettura ha una tolleranza predefinita di 2, la posizione dello scatto di 200 metri: entro la tolleranza è Conforme, entro il doppio Da verificare, oltre Non conforme;
- i controlli sul sigillo e sulla piombatura non bocciano mai: un «non conforme» diventa Da verificare;
- con più foto, per i valori vince la foto migliore; per il tipo di foto e la qualità, se solo alcune foto non vanno l'esito è Da verificare, e Non conforme solo se non va nessuna.

C'è anche una garanzia di metodo. I valori registrati (matricola, nuova matricola, lettura, calibro) non vengono mai mostrati all'AI. L'AI legge la foto; il confronto lo fa il gestionale.

Le ultime due regole hanno una storia. In una prova su una commessa, 4 interventi e 24 foto, il controllo sul tipo bocciava tutti e quattro gli interventi, perché bastava una foto di avviso o di anomalia per respingere l'intervento; il sigillo, a sua volta, non risultava mai conforme. Da lì sono nate le due regole sul sigillo e sulle foto multiple.

### Rivedere un intervento

Il pulsante «Rivedi» sulla riga apre la finestra «Analisi AI delle foto», con «Intervento» e il numero, e «‹ Precedente» / «Successivo ›». La tabella ha le colonne «Controllo», «Atteso», «Letto dall'AI», «Esito» e «Decisione del revisore». Un riquadro giallo sulla foto indica dove l'AI ha letto il valore.

Per ogni controllo il revisore sceglie «Confermo» oppure «Correggo». «Correggo» esiste solo per i controlli di valore (matricola, nuova matricola, lettura, modello): si scrive il valore giusto e si preme «Salva». La correzione diventa anche un caso del banco di riferimento, su cui si provano le istruzioni dell'AI. Non tocca però l'intervento, a meno che la commessa non abbia collegato quel controllo a un suo campo.

Alcuni controlli sono impostati su «Blocca l'approvazione». Nella finestra portano l'etichetta «Blocca» finché nessuno decide; nell'impostazione predefinita sono matricola e nuova matricola. La finestra si chiude in due modi, con una «Nota per l'operatore (facoltativa)»:

- «Approva l'intervento», che segue la stessa strada di «Verificato» e porta l'intervento a Controllato (6). È rifiutato mentre l'analisi è in coda o in corso («L'analisi AI è ancora in corso: aspetta che finisca.») e finché un controllo bloccante non ha una decisione;
- «Rimanda all'operatore», che riporta l'intervento ad Assegnato, oppure a «Da finire» sulla commessa che lo prevede.

Ogni azione finisce nel registro «Azioni del revisore», che mostra le ultime 30 con chi e quando.

> **Contro-obiezione.** «L'AI ha segnato Non conforme: devo rifare l'intervento?»
>
> Non per questo. «Non conforme» indica quali foto guardare. La decisione è dell'ufficio: confermare, correggere, approvare o rimandare all'operatore. L'AI può sbagliare una matricola o un sigillo, e per questo non cambia mai l'intervento da sola. Resta un margine che nessuna regola elimina: l'AI non legge dati che non sono nelle foto.

### Le istruzioni dell'AI

*Per gli amministratori, cioè per chi può modificare le Impostazioni.*

Che cosa controlla l'AI si decide in Impostazioni › Analisi AI delle foto, commessa per commessa. La pagina ha tre colonne. «1 · Che lavoro fa questa commessa» propone il tipo di lavoro (lettura, verifica metrica, sostituzione contatore, sopralluogo) riconosciuto dai tipi di intervento e segnato «Rilevato»; si può cambiare. «2 · Controlli» elenca i controlli accesi, i tipi di foto su cui lavorano (lista vuota vuol dire tutte le foto), la scelta fra «Segnala» e «Blocca l'approvazione» e, dove serve, la tolleranza. «3 · Istruzioni per l'AI» mostra il testo che arriva all'AI, con «Modifica a mano» e «Regole in più (una per riga)».

I limiti sono precisi: 2.000 caratteri di testo e 50 regole in più. «Aiutami a scriverle» accetta una descrizione fino a 1.000 caratteri e propone una regola fino a 600; niente si applica senza un clic.

Ogni salvataggio crea una versione. Nello «Storico», «Rimetti questa» riporta una versione vecchia, che diventa attiva solo con «Salva», come versione nuova. Prima di salvare conviene «Prova sul banco di riferimento»: al massimo 20 casi, con il risultato per controllo nella forma «giuste N · sbagliate N · illeggibili N», le colonne «Prima» e «Dopo» e le etichette «Peggiora», «Migliora», «Uguale». Fra una prova e l'altra passano almeno 10 secondi, e una prova costa al massimo 2 × 20 chiamate all'AI. Se il risultato peggiora, la pagina chiede «Attiva comunque» o «Non attivare»; se non si è provato, «Salva senza provare» o «Non salvare». Anche Gea può proporre una regola da questa pagina: la salva solo dopo «Autorizza» (vedi il capitolo 10).

**Limite.** Non tutte le commesse hanno l'AI. Delle undici configurazioni sulla Verifica unica, sei la tengono spenta. Su una commessa che non ha ancora le tabelle necessarie la pagina risponde «Analisi AI non ancora disponibile su questa commessa.»: è una domanda per lo staff tecnico. Un'analisi ferma «in corso» da più di 30 minuti viene trattata come errore («Analisi interrotta. Riprova.»). I costi e il lancio massivo, in Admin › Cruscotto Analisi AI e Admin › Manutenzione, sono strumenti dello staff tecnico (vedi il capitolo 12).

L'AI indica dove guardare; chi firma la verifica resta una persona.

> **Quando chiedere allo staff tecnico:** un esito che l'operatore dice di aver inviato e che manca anche dopo i controlli della sezione *Intervento ed esecuzione*; un esito cancellato da recuperare; una commessa che dovrebbe avere la nuova Verifica, o l'analisi AI, e non le ha; una ripianificazione dove la finestra non mostra «Cancella precedente» e le foto del vecchio intervento contano.

Prima di qualunque azione su un intervento servono due risposte: in che stato si trova, e se il suo esito è già stato verificato, inviato o esportato. La prima si legge nella colonna «Stato» e dice quale pulsante può agire. La seconda dice se il vecchio esito va conservato, e non sempre si legge sullo schermo: un intervento già esportato può essere ancora Controllato. Quando la seconda risposta manca, l'esito si conserva.

## Fonti

- codice: `lib/InterventoBase.php`, `lib/InterventoEseguitoBase.php`, `lib/UtenzaBase.php`
- codice: `js/code/industry.js`, `json.php` (`stato_select`, `del_interventi`), `lib/db/2026-09-18-gop319-stati-annullato-prenotato.sql`
- codice: `pages/file.php` (`importazione_inviati`), `lib/export_letture_aceaA4.inc.php`, `lib/ADMINController.php`
- codice: `lib/VerificaInterventi.php`, `js/code/verifica_unica.js`, `lib/JSONController.php`
- codice: `lib/MobileV3/Domain/EsitoCatalog.php`, `lib/MobileV3/Domain/EsitoWriter.php`, `lib/AndroidController.php`
- codice: `js/code/interventi_elenco.js`, `js/code/core_functions.js`, `lib/json_functions.php`, `lib/Intervento.php`
- codice: `lib/ChatbotStrumentoRiaffidaIntervento.php`, `lib/ChatbotStrumentoCambiaDataIntervento.php`
- codice: `lib/AvanzamentoCarichi.php`, `lib/ExportInterventiQuery.php`, `custom/easy_iren/php/InterventoEseguito.php`
- codice: `js/code/analisi_ai.js`, `js/code/impostazioni_analisi_ai.js`, `lib/AnalisiAiCatalogo.php`, `lib/AnalisiAiEsito.php`, `lib/AnalisiAiMotore.php`, `lib/AnalisiAiPrompt.php`, `lib/AnalisiAiRevisione.php`, `lib/AnalisiAiIstruzioni.php`, `lib/AnalisiAiBanco.php`
- docs: `docs/02-patterns/21-guard-cancellazione-intervento-eseguito.md`
- docs: `docs/02-patterns/23-cc-cancellazione-stato-annullato.md`
- docs: `docs/02-patterns/34-stato-utenza-derivato-ultimo-intervento.md`
- docs: `docs/02-patterns/43-avanzamento-carichi-fonte-stati.md`
- docs: `docs/02-patterns/16-mobile-inbound-sync.md`
- docs: `docs/03-cookbooks/34-verifica-interventi-estensioni-tenant.md`
- docs: `docs/analisi-ai/contratto.md`, `docs/analisi-ai/impostazioni.md`
- wiki: `wiki/assistenza-clienti/riaffida-intervento.md`, `wiki/assistenza-clienti/ripianifica-non-fattibile.md`, `wiki/assistenza-clienti/elimina-precedente.md`
- wiki: `wiki/assistenza-clienti/pagina-lista-interventi.md`, `wiki/assistenza-clienti/pagina-da-assegnare.md`, `wiki/assistenza-clienti/runbook-dove-si-e-fermato-il-dato.md`
- Jira: GOP-630 — Verifica interventi unica
- Jira: GOP-462 — Elimina sugli appuntamenti del call center
- Jira: GOP-688 — Verifica senza eseguiti né foto
- Jira: GOP-674 — Analisi AI delle foto (epic)
- Jira: GOP-718 — impostazioni dell'analisi AI per commessa
- Jira: GOP-721 — regole dell'AI proposte da Gea
- Jira: GOP-738 — controlli sul sigillo e regola delle foto multiple
- Jira: GOP-782 — esito «Da finire»
- Jira: GOP-319 — stati Annullato e Prenotato
- Jira: GOP-807 — volumi di verifica di una commessa

<!-- WORD COUNT: ~5900 -->
<!-- PERSONA CHECK: Pass — voce da Engineer + Scholar: etichette esatte, codici di stato, messaggi verbatim, un caso per punto, Limite in ogni sezione; rimossi i pochi tratti generici («va misurato con onestà», «quasi sempre» senza fonte, la supposizione sulla cella vuota dello stato 99). -->
<!-- NUF CHECK: ✅ stati 1–10 e 99 con chi li scrive | ✅ intervento vs esecuzione + diagnosi «non vedo l'esito» | ✅ Modifica e salto silenzioso | ✅ scelta fra Modifica/Annulla/Elimina/Ripianifica, «Intervento non cancellato perché già chiuso» | ✅ Ripianifica + regola «Cancella precedente» | ✅ Verifica, filtri, «Verificato» = Controllato (6), file di ritorno | ✅ Analisi AI, Esito AI, Approva/Rimanda | ✅ che cosa si conserva e che cosa si perde per ogni pulsante | ✅ quando chiedere allo staff tecnico | ✅ fatti con fonte (costanti, STATI_CHIUSI, contratto AI, limiti impostazioni) -->
<!-- ANTI-AI CHECK: nessuna frase vietata; aggiunte le righe di pubblico in corsivo alle sezioni per il back office; paragrafo «In questo capitolo» interamente in corsivo; «tenant» solo nei riquadri DEV con la corrispondenza dichiarata; chiusura riscritta senza domande in serie; quattro contro-obiezioni; nessun dato personale né nome di modello AI. Nota: il Limite di § 2 non dice che non esiste un modo di ricreare un'esecuzione persa sul telefono (la bozza dice invece che «Verificato» crea la riga per gli «Interventi mancanti»): lasciato com'è, perché la sostanza non va cambiata. -->
