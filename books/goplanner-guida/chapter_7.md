# 7. Esportazione e consegna al committente

*In questo capitolo si impara che cosa legge un'esportazione e che cosa non cambia, come si lancia da File › Esportazione, come si segue in background, come si consegna con un link e come si ritira, e come si prepara un modello con una colonna in più senza toccare quello della commessa. L'ultima parte dice che cosa fare quando il file esce vuoto, fallisce o è scaduto. Il capitolo è per l'ufficio; i riquadri per gli sviluppatori si possono saltare.*

## Che cosa legge un'esportazione

Un caso inventato, per fissare le idee. Il 1° dicembre l'ufficio apre File › Esportazione, sceglie il modello del committente e lascia il periodo proposto all'apertura, «Mese precedente». Il pulsante dice «Esporta 412 interventi», il file ha 412 righe e parte. Il committente risponde che ne aspettava 415. I tre interventi mancanti sono stati eseguiti il 30 novembre, ma il telefono dell'operatore li ha mandati al server il 2 dicembre. Nessun errore: il file ha risposto alla domanda posta al momento del lancio, e in quel momento quelle tre esecuzioni non esistevano ancora in GOPlanner. Rilanciata il 3 dicembre sullo stesso periodo, la stessa esportazione le contiene: con «Filtra per» su «Esecuzione», la scelta proposta, il file legge la data registrata sul telefono, il 30 novembre, e non quella di arrivo.

Il caso dice già da dove vengono le righe. Una riga del file è una esecuzione: una riga della tabella `interventi_eseguiti`, unita al suo intervento, alla lista e all'utenza. Un intervento senza esecuzione non entra nel file, per la ragione spiegata nel capitolo 6, *Interventi, esiti e verifica*. Che cosa entra lo decidono tre cose:

- **il modello**, che decide le colonne, il loro ordine e il formato: è la mappatura di esportazione della commessa, la stessa specie di configurazione che il capitolo 4, *Importazione: dal file del committente alla lista*, descrive dal lato dell'importazione;
- **i filtri**, che decidono quali esecuzioni;
- **il momento del lancio**, che decide quali esecuzioni esistono.

Quando l'esportazione va in coda, i filtri vengono fotografati al lancio e il lavoro in background usa esattamente quelli.

Il numero sul pulsante e il file nascono dalla stessa interrogazione, per costruzione. Per i modelli che lo consentono, «Esporta 412 interventi» e un file di 412 righe sono la stessa selezione; solo gli scartati, di cui si parla più avanti, possono separarli. Per altri modelli la pagina non conta in anticipo e lo scrive: «Conteggio non disponibile per questo modello.»

Un'esportazione standard legge e non scrive. Nessun file del percorso comune di esportazione modifica lo stato di un intervento, lo stato o l'esito di una esecuzione, o un contrassegno di *già esportato*: le sole scritture vanno nel registro delle esportazioni, nei link e nel contatore d'uso dei modelli salvati. Ne seguono due cose. Rilanciare un'esportazione standard non tocca i dati. E un intervento esportato non diventa Inviato.

Ma se l'ho esportato ieri, perché l'intervento risulta ancora Controllato e non Inviato? Perché l'esportazione standard non scrive lo stato. Lo stato Inviato (7) arriva per altre strade: l'importazione di un file di inviati, una procedura di riparazione dell'amministratore e due modelli scritti per singoli committenti (vedi il capitolo 6). La colonna dello stato, quindi, non dice se un esito è già partito. Lo si ricostruisce dal pannello «Ultime esportazioni»: per ciascuna delle ultime 15 esportazioni dice chi ha lanciato quale modello, quando e su quale periodo. Il pannello non elenca gli interventi; dice quale domanda è partita, e da quella si risale all'esito.

> **Attenzione:** il file contiene solo interventi verificati? Dipende dalla commessa, e non si vede dalla pagina. L'interrogazione standard non ha alcuna condizione sullo stato: se i filtri la selezionano, un'esecuzione non ancora verificata va nel file. Al 25 novembre 2026, 61 delle 74 cartelle delle commesse (comprese quelle di prova) hanno una propria interrogazione di esportazione, e in 36 di queste la condizione prende solo le esecuzioni Controllato (6). Lo stesso pulsante porta quindi due rischi opposti: con un modello standard le esecuzioni non verificate partono, con un modello che filtra restano fuori finché qualcuno non le verifica. La scheda del modello non mostra questa condizione, perché sta nel codice della commessa e non nella mappatura. Chi non sa di quale tipo è il proprio modello lo chiede allo staff tecnico prima di spedire.

Non è un difetto, ma va saputo prima: su un modello standard la verifica serve a correggere gli esiti prima che partano, e il filtro dell'esito decide se partono i positivi, i negativi o tutti.

Ma se 61 cartelle su 74 hanno un'interrogazione propria, a che cosa servono le regole del modello standard? Servono per tutto ciò che sta intorno alla selezione. La pagina, la coda, il registro, il link, «Ripeti», le durate, l'esclusione delle firme dalle foto e le cause dei fallimenti sono gli stessi su ogni commessa aggiornata, e il conteggio sul pulsante, quando c'è, usa la stessa interrogazione del file. Cambia solo quali esecuzioni entrano: quale data conta, se serve lo stato Controllato, quali filtri della pagina vengono letti. Questo si chiede allo staff tecnico una volta per ogni modello che si usa, e poi vale per tutti i suoi file.

### I formati

Il campo «Formato» propone quattro voci, e non tutte fanno ciò che il nome promette.

| Voce nel campo «Formato» | Che cosa esce |
|---|---|
| «Tracciato testuale» | un file `.txt` |
| «CSV» | un file `.csv` |
| «Excel 2007» | un `.xls` del formato precedente (scrittore `Excel5`), non un `.xlsx` |
| «XML» | nessun file: in coda il lavoro si ferma con «Formato '…' non supportato per l'export in coda.» |

Tra le opzioni non c'è una voce che dia `.xlsx`, e «XML» si può scegliere ma non è mai stato implementato. Un modello che dichiara un formato proprio ha la precedenza sulla scelta fatta in pagina: il modello di una commessa, per esempio, esporta sempre in `.xlsx`, anche in coda. Per questo «Formato» compare nella riga «Del modello» solo quando il modello non ne fissa uno. La tabella dice che cosa scrive il motore per ciascun formato; per un modello senza formato proprio, lanciato dalla pagina nuova, non è stato provato che la scelta arrivi fino al file. Se il file esce in un formato diverso da quello scelto, o non esce, lo si segnala allo staff tecnico con il nome del modello.

Colonne, formati e condizioni cambiano da commessa a commessa, e alcuni modelli hanno una logica scritta per un solo committente: file di testo a posizioni fisse, file costruiti dentro un file del committente, modelli che invece di produrre un file inviano i dati per posta, via SOAP o via FTP. Per questi la regola *legge, non scrive* copre i dati di GOPlanner solo in parte: i due modelli che scrivono Inviato sono di questo tipo, un invio via SOAP che segna ogni esecuzione accettata dal committente e una vecchia esportazione di letture. Che cosa succede quando si rilancia un modello che invia non ha una regola generale. Dalla lettura del codice, il modello SOAP non rimanda ciò che è già stato accettato, mentre un modello che invia per posta manda di nuovo. Prima di rilanciare un modello che invia, si chiede allo staff tecnico.

Un file dice ciò che il modello e i filtri hanno selezionato quando è stato lanciato. Niente di più, niente di dopo.

> **Per gli sviluppatori:** `lib/ExportInterventiQuery.php` costruisce `select()` e `count()` con gli stessi `joins()` e lo stesso `where()`: `FROM interventi_eseguiti LEFT JOIN interventi … LEFT JOIN carichi … LEFT JOIN utenti`; la tabella delle utenze nel codice si chiama `utenti`. La commessa, che nel codice si chiama tenant, può ridichiarare `getForExport()` nella propria classe e non passare da questa interrogazione. I modelli di sistema sono le chiavi del `mappature.php` della commessa (codice: capitolo 13).

## File › Esportazione: modello, filtri, riepilogo

*Per l'ufficio.*

La pagina si apre dal menu File: nella colonna di sinistra ci sono «Esportazione» e, sotto, «Esportazione classica», la pagina precedente, che resta disponibile; c'è anche un pulsante «Esportazione classica» in alto a destra. Chi ha il permesso di importare vede sempre queste due voci. Gli altri profili le vedono solo se la commessa ha abilitato per loro l'esportazione; i profili e i permessi sono nel capitolo 11, *Utenti, ruoli e permessi*.

La pagina va dall'alto in basso, nell'ordine in cui si decide: prima che cosa esportare, poi quali esecuzioni, infine il controllo. All'apertura il periodo è già impostato su «Mese precedente» e l'esito su «Positivi». Lasciate così, danno il mese scorso e solo gli esiti positivi: chi aspettava anche i non eseguiti, o il mese in corso, riceve un file più corto senza che nulla sia andato storto.

1. Aprire File › Esportazione.
2. Nel riquadro «Cosa esporti» scegliere il modello: in cima, sotto «Ultime usate», ci sono al massimo 3 modelli, prima quelli usati da chi è collegato; sotto, «Tutti i modelli». Con più di 8 modelli compare il campo «Cerca un modello». Le mappature che servono solo a importare stanno nel blocco chiuso «Altre mappature della commessa (importazione)».
3. Leggere la scheda: nome, etichetta «sistema» o «salvato», eventuale etichetta «classica», formato, numero di colonne, file modello del committente e riga di partenza, «in background» o «download diretto», quante esportazioni sono state fatte e l'ultima data.
4. Premere «Usa».
5. Nella riga «Periodo» scegliere «Filtra per», poi «Dal» e «Al» (nel formato gg/mm/aaaa), oppure uno dei pulsanti rapidi: «Oggi», «Ieri», «Settimana precedente», «Mese precedente», «Anno corrente».
6. Nella riga «Esito» scegliere «Positivi», «Negativi» o «Tutti». L'elenco «Causali» si attiva solo con «Negativi».
7. Compilare la riga «Del modello», se il modello ne ha una.
8. Se serve, aprire «Altri filtri»: «Lista», «Operatore», «Cliente», «Lotto», «Codici · uno per riga». Il blocco chiuso dice quanti filtri sono attivi.
9. Leggere il riepilogo in basso.
10. Premere «Esporta N interventi».

Tre precisazioni sui filtri. Il filtro dell'esito lavora sull'esito dell'esecuzione, non sullo stato dell'intervento: «Positivi» non vuol dire verificati. E l'etichetta «Cliente» filtra un campo della lista, non l'utenza. L'«Operatore» è chi ha eseguito in campo; la colonna «Utente» del registro è chi ha lanciato l'esportazione.

### «Filtra per»: quale data

Nel modello standard, «Filtra per» decide quale data cade nel periodo. Sulle commesse con un'interrogazione propria la scelta compare, ma la data la decide quell'interrogazione (fine sezione).

| Scelta | Data letta | Domanda a cui risponde |
|---|---|---|
| «Esecuzione» (predefinita) | la data dell'esecuzione registrata sul telefono | che cosa è stato fatto nel periodo |
| «Pianificazione» | la data pianificata dell'intervento | che cosa era previsto nel periodo, comprese le pianificazioni che hanno già un'esecuzione |
| «Validazione» | il campo `data_m` dell'esecuzione | nessuna domanda d'ufficio, nel modello standard (vedi sotto) |

Per lo stesso novembre «Esecuzione» e «Pianificazione» danno righe diverse. La scelta giusta è quella della domanda del committente.

«Validazione» non vuol dire quello che sembra. Nel modello standard legge un campo dell'esecuzione (`data_m`) che nessun flusso ordinario scrive: né la Verifica, né l'app, né l'esportazione. Lo valorizza solo una procedura di riparazione dell'amministratore che ripristina i dati originali del telefono. Su un modello standard, quindi, «Filtra per: Validazione» trova solo le esecuzioni passate da quella procedura, e un mese pieno di lavoro verificato può dare un pulsante spento. Non serve a cercare il lavoro verificato nel periodo. Alcune commesse hanno invece una vera data di validazione nella propria interrogazione (vedi il capitolo 6), ed è quella interrogazione a decidere la data, qualunque cosa dica «Filtra per».

### Il riepilogo e il conteggio

In fondo alla pagina il riepilogo ripete le scelte in parole: «Modello»; «Periodo», con le date, il nome del periodo rapido o «Intervallo», e «per esecuzione», «per pianificazione» o «per validazione»; «Filtri attivi», cioè «Positivi», «Negativi» o «Tutti gli esiti», più le causali e gli altri filtri; e una «Nota (facoltativa)» di al massimo 250 caratteri, che resta nel registro. Il pulsante porta il numero dal vivo: «Esporta 412 interventi», oppure «Esporta» se il numero non si conosce. La parola è sempre «interventi», anche per i modelli che esportano altro. Il blocco «Parametri (amministratori)», con le righe `chiave=valore`, compare solo agli amministratori.

Quando il pulsante è spento, la pagina dice perché, con una di queste frasi:

- «Scegli un modello: poi si vede quanti interventi escono.»
- «Indica sia la data Dal sia la data Al, oppure nessuna delle due.»
- «Le date vanno scritte come gg/mm/aaaa.»
- «Nessun intervento con questi filtri: allarga il periodo o togli un filtro.»

Il pulsante resta spento con «Nessun intervento con questi filtri», ma il lavoro è stato fatto. La risposta è un ordine di controlli. Prima «Filtra per»: «Pianificazione» al posto di «Esecuzione» sposta tutto. Poi il periodo: all'apertura è il mese precedente, non quello in corso. Poi l'esito: con «Positivi» i non eseguiti non ci sono. Poi «Altri filtri», guardando il numero di filtri attivi. Solo dopo ci si chiede se le esecuzioni esistono davvero in GOPlanner: è la domanda del capitolo 6, e il percorso «dove si è fermato il dato» è nel capitolo 12, *Strumenti di amministrazione e diagnostica*.

La pagina non vale allo stesso modo per tutti i modelli. Quindici modelli scritti per singole commesse (tra cui esportazioni di foto e di letture, un modello di verbali PDF e il modello «pianificazione») hanno un ramo proprio: mantengono il comportamento precedente, con la vecchia barra di avanzamento e, alla fine, il collegamento per scaricare il file, senza registro e senza «Copia link». I campi di «Del modello» cambiano da modello a modello: per un committente sono «Settimana» e «Anno». Sulle commesse che hanno una propria interrogazione di esportazione, «Filtra per» compare, ma quella interrogazione usa la sua data e nessuna di esse legge la scelta fatta in pagina. «Codici» fa il percorso inverso: l'interrogazione standard non lo usa, lo leggono solo alcune interrogazioni delle commesse. I modelli segnati «classica» si trovano anche nella nuova pagina e partono da lì; l'etichetta dice solo che non si possono duplicare.

Prima del pulsante si legge il riepilogo: modello, «Filtra per», periodo, esito, numero. Se il numero è sbagliato, il file sarà sbagliato nello stesso modo.

## In coda: avanzamento, «Ultime esportazioni», file e link

*Per l'ufficio.*

Dopo il pulsante, l'esportazione standard non tiene ferma la pagina. Va in coda e gira in background. Nel menu di sinistra compare subito un segnalibro, visibile su ogni pagina, con l'avanzamento e, alla fine, il file. Sulla pagina il titolo diventa «Esportazione in corso»; si può cambiare pagina o preparare una «Nuova esportazione». A fine lavoro compaiono «Esportazione completata», i contatori «Esportati» e «Scartati» e i pulsanti «Scarica il file» e «Copia link». Dal 24 novembre 2026 girano in background anche i modelli classici che producono verbali PDF, foto, invii via SOAP o per posta.

La pagina spiega così gli scartati: «Non sono nel file: le regole del modello li escludono prima della scrittura (per esempio manca un valore obbligatorio).»

Per le esportazioni di foto, di verbali PDF e degli invii vale la regola di una alla volta: per la stessa commessa e lo stesso modello può esserne aperta una sola. Se la rilancia la stessa persona con gli stessi filtri, la pagina riaggancia il lavoro già in corso. Altrimenti risponde con un messaggio che nomina il modello: «C'e' gia' un'esportazione «…» in corso per un altro periodo o altri filtri: attendere che finisca prima di avviarne un'altra.», oppure, se l'ha avviata un collega, «… in corso per questo cliente (avviata da un altro utente): attendere che finisca.» Le esportazioni Excel, csv e txt non hanno questo blocco: due lanci dello stesso modello girano entrambi.

| Stato | Che cosa vuol dire | Che cosa fa l'ufficio |
|---|---|---|
| «In coda» | il lavoro aspetta il suo turno | aspetta: non è un errore |
| «In corso» | sta scrivendo, con la percentuale | aspetta: non è un errore |
| «Completata» | finito | legge il messaggio, poi scarica |
| «Con scarti» | finito, ma qualche esecuzione è stata scartata | controlla gli scartati |
| «Fallita» | nessun file | legge la causa (ultima sezione) |
| «Annullata» | nessun file | niente: un'esportazione non ha un pulsante per annullarla |
| «File scaduto» | il file è stato cancellato dopo 30 giorni | rifà l'esportazione |

«Completata» non vuol dire *consegnata*, e nemmeno *c'è un file*. Un modello che invia chiude «Completata» con un messaggio al posto di «Scarica»: «Esportazione eseguita: nessun file da scaricare.», oppure il resoconto del modello, per esempio «Inviati 3 di 5». Un periodo senza dati chiude con «Nessun dato da esportare con questi filtri: nessun file creato.» Il codice spiega perché questi casi non sono «non riuscita»: dopo un invio, un fallimento farebbe ripetere l'esportazione e mandare tutto due volte.

### «Ultime esportazioni»

Sotto i filtri, il pannello «Ultime esportazioni» mostra le ultime 15, con le colonne «Data», «Modello», «Periodo», «Esito», «Righe», «Utente» e le azioni. Ogni riga offre, a seconda dei casi, «Scarica» e «Copia link» quando il file si può scaricare, «Revoca link» quando un link è attivo, il messaggio quando il file non c'è, e «Ripeti». Una riga con un lotto è visibile solo a chi vede quel lotto. Senza esportazioni il pannello dice «Nessuna esportazione disponibile».

«Ripeti» non rifà un'esportazione: prepara la successiva. Ricarica il modello e tutti i filtri, e sposta il periodo in avanti. I mesi interi restano mesi interi: ottobre diventa novembre, settembre-ottobre diventa novembre-dicembre. Ogni altro intervallo si sposta della sua lunghezza in giorni: una settimana da lunedì a domenica diventa la settimana dopo, dal 10 al 14 novembre diventa dal 15 al 19 novembre. La pagina lo dice («Periodo spostato in avanti: … Controlla e premi Esporta.») e non lancia nulla da sola. Nel caso di apertura, chi il 3 dicembre preme «Ripeti» sulla riga del 1° dicembre per recuperare le tre esecuzioni mancanti si vede proporre dicembre, non novembre. Per rimandare novembre il periodo si reimposta: con «Mese precedente», o con le date in «Dal» e «Al».

### Il link per il committente

Per consegnare il file senza allegarlo:

1. Premere «Copia link» accanto a «Scarica il file», oppure nella riga di «Ultime esportazioni».
2. Incollare il link nel messaggio al committente.
3. Quando non serve più, premere «Revoca link».
4. Confermare.

Dopo la copia la pagina avvisa: «Link copiato: chiunque lo riceva può scaricare il file, senza accedere. Lo revochi da “Revoca link”.» Il file contiene dati di utenze, e il link lo apre senza entrare in GOPlanner: chi ha il link ha il file, anche se il messaggio è stato inoltrato a qualcun altro. Il rischio ha però confini che si possono misurare. Il link è un codice casuale di 256 bit, non il nome del file; la cartella delle esportazioni non si può sfogliare; ogni apertura del link viene registrata con ora ed esito; il link scade; e solo chi può scaricare il file può crearne il link.

«Revoca link» chiede conferma («Chi ha ricevuto questo link non potrà più scaricare il file. Revocare il link?») e agisce subito. Chi apre poi il link legge «Questo link e' stato revocato. Chiedi un nuovo link a chi ti ha mandato il file.»; il file resta nell'elenco, e un nuovo «Copia link» produce un link diverso. Un link che non serve più si revoca: altrimenti resta valido fino alla scadenza.

Le durate sono tre, e vanno tenute distinte.

| Che cosa | Quanto dura | Dopo |
|---|---|---|
| Il file | 30 giorni dalla chiusura dell'esportazione | la pulizia giornaliera della commessa lo cancella, la riga resta con «File scaduto» |
| Il link | 30 giorni dalla sua creazione, salvo diversa impostazione della commessa | «Questo link e' scaduto, ma il file c'e' ancora. Chiedi un nuovo link a chi ti ha mandato il file.» |
| Il link di un file scaduto | mai oltre il file | «Il file di questo link e' scaduto ed e' stato eliminato. Chiedi di rifare l'esportazione.» |

Al 25 novembre 2026 nessuna commessa ha un'impostazione diversa per la durata del link. Un file scaduto si rifà con una nuova esportazione, che sarà fatta con i dati di quel giorno. Nulla si perde in GOPlanner: le esecuzioni restano dove sono.

L'esportazione è Completata ma non c'è «Scarica». Si legge il messaggio della riga: un invio senza file, o nessun dato (sopra). Se ha più di 30 giorni è «File scaduto», e si rifà. Se la pagina scrive «Esportazione completata, ma il file non risulta scaricabile (non visibile dal server web o scaduto). Contatta l'assistenza.», la domanda va allo staff tecnico.

Non tutto passa dalla coda, e non tutto c'è su ogni commessa:

- **Modelli sincroni.** I modelli con un ramo proprio nella pagina e alcuni modelli scritti per un solo committente (un file di testo a posizioni fisse, un caricamento via FTP, l'esportazione delle anomalie di una commessa) scaricano il file a fine richiesta, senza link. La pagina chiede di restare lì: «Questo modello non gira in background: il browser scarica il file a fine lavoro. Resta su questa pagina fino al download.»
- **Commessa senza il registro.** Il file standard esce comunque come download diretto, ma il pannello resta vuoto e i modelli di foto, PDF e invii non partono: «Registro esportazioni non disponibile: l'esportazione non e' partita. Contattare l'assistenza.»
- **Commessa senza i link.** «Copia link» risponde «Il link non si puo' creare su questo account. Contatta l'assistenza.»
- **«Esporta in Excel» di una griglia.** Finisce nello stesso registro come «Elenco · …», visibile solo a chi l'ha lanciato e senza «Ripeti». Non è un file per il committente.

Nel secondo e nel terzo caso manca un aggiornamento della commessa, e si passa allo staff tecnico.

Un file dura 30 giorni, un link al massimo quanto il suo file. «Ripeti» sposta il periodo in avanti; non lo rifà.

> **Per gli sviluppatori:** un caso reale (GOP-647, 16 novembre 2026). Problema: esportazioni in coda segnate «completate» il cui file non si poteva scaricare. Causa: i lavori in coda scrivevano lo ZIP o l'xlsx nella cartella della commessa dentro l'immagine dell'applicazione, e in produzione il file restava nel container del worker, invisibile al lato web. Rimedio: `GOPlanner::getExportPath()` su un volume condiviso non raggiungibile dal web; `EsportazioneRegistro::percorsoFile()` e il download leggono attraverso `GOPlanner::trovaFileExport()`, con un ripiego per i file precedenti. Le esportazioni perse prima della correzione sono rimaste da rifare.

## Modelli salvati: «Duplica e modifica»

*Per l'ufficio.*

Il committente chiede una colonna in più, o un titolo diverso, o le date nel formato `aaaammgg`. La tentazione è chiedere di cambiare il modello della commessa. Non si fa, e la pagina non lo permette: i modelli di sistema sono in sola lettura. Per cambiarne uno si crea una copia. «Duplica e modifica» crea un modello salvato, condiviso da tutto l'ufficio, e apre l'editor delle colonne.

La copia nasce subito, con il nome del modello d'origine seguito da «(copia)», poi «(copia 2)», «(copia 3)» se il nome è già preso. Porta il nome del modello, non quello di chi l'ha creata. Si cambia nel campo «Nome del modello», al massimo 100 caratteri, e due modelli non possono avere lo stesso nome («Esiste gia' un modello con questo nome»). Una volta salvato, il modello gira con lo stesso motore e la stessa coda del modello d'origine, e compare in «Ultime esportazioni» con il suo nome.

1. Aprire File › Esportazione.
2. Aprire la scheda di un modello di sistema che mostra «Duplica e modifica».
3. Premere «Duplica e modifica».
4. Nell'editor «Modifica il modello», per ogni colonna impostare «Titolo», «Campo di GOPlanner» oppure un valore fisso («Valore uguale per tutte le righe»), e «Formato data» per i campi data.
5. Cambiare la posizione trascinando la riga con «Sposta» o con i pulsanti ▲ ▼.
6. Aggiungere colonne con «Aggiungi colonna» e toglierle con «Togli».
7. Controllare la sezione «Prima riga del file».
8. Premere «Salva il modello».
9. Lanciarlo come ogni altro modello.

L'anteprima mostra la prima riga del file costruita sull'ultima esecuzione della commessa, ed è il controllo più utile prima di salvare: una data nel formato sbagliato si vede lì, non dal committente. I formati data offerti sono sette, tra cui «31/12/2026», «20261231» e «14:30». Quando il modello d'origine scrive dentro un file del committente, per esempio un file che parte dalla riga 11, i titoli sono quelli del file e la pagina lo dice: si cambiano solo campo e ordine. Non tutti i modelli si duplicano. L'etichetta «classica» segna quelli esclusi, e il suggerimento ne dice il motivo: un file di testo a posizioni fisse, un ramo proprio senza i dati standard, un formato che l'editor non modifica (l'editor tratta solo xls, xlsx e csv), colonne non descritte per campo e posizione.

> **Attenzione:** *condiviso* vuol dire che chiunque abbia il permesso di esportare può modificare, rinominare o eliminare qualsiasi modello salvato della commessa, anche quello creato da un collega. Non c'è una cronologia: il sistema conserva solo chi lo ha creato e chi lo ha modificato per ultimo. Una modifica cambia il prossimo file di tutti quelli che usano quel modello, e un'eliminazione chiede solo un secondo clic («Conferma l'eliminazione» resta per 5 secondi). Prima di cambiare una copia che usano anche altri ci si accorda, oppure se ne fa una nuova.

Il contrappeso è netto: un errore in una copia non tocca mai il modello della commessa.

Posso correggere direttamente il modello della commessa? No, ed è voluto: i modelli di sistema sono in sola lettura e «Un modello di sistema non si elimina». Se è il modello di sistema stesso a essere sbagliato per ogni file, per esempio una colonna che il committente non accetta più, la strada è una richiesta allo staff tecnico, non una copia da far usare a tutti. Gea non aiuta qui: il suo strumento propone correzioni alla mappatura di importazione, non ai modelli di esportazione.

«Duplica e modifica» dipende da un aggiornamento della commessa: dove non è stato fatto, la pagina mostra solo i modelli di sistema, e si chiede allo staff tecnico. Un modello con un'interrogazione propria della commessa mostra nell'anteprima solo colonne e titoli, con la frase «Per questo modello non c'è una riga di esempio: l'anteprima mostra le colonne e i titoli.» Lì la data nel formato sbagliato non si vede prima del file: il primo file del modello nuovo si apre e si controlla prima di mandarlo. Duplicare, salvare ed eliminare richiedono il permesso di esportare (vedi il capitolo 11, *Utenti, ruoli e permessi*).

Quello che la commessa ha dato non si cambia: si copia, gli si dà un nome, e si ricorda che la copia è di tutto l'ufficio.

> **Per gli sviluppatori:** i modelli salvati stanno nella tabella `mappature_export` della commessa (migrazione `0039_mappature_export.sql`), con chiave `salvato_<id>`; classi `MappaturaEsportazione`, `MappatureEsportazioneController`, `EsportazioneModelli`; interfaccia `js/code/esportazione-modelli.js`; GOP-818.

## L'esportazione delle foto

*Per l'ufficio.*

Un'esportazione delle foto produce un archivio ZIP con le foto delle esecuzioni selezionate. Salvo i modelli di foto con un ramo proprio (vedi sotto), gira in background, sulla stessa pagina, con gli stessi filtri, lo stesso pannello «Ultime esportazioni» e lo stesso link. Vale la regola di una alla volta della sezione sulla coda, e ha un motivo concreto: prima della coda la pagina restava ferma in attesa, e ogni clic ripetuto produceva un altro ZIP da capo. Durante il lavoro il segnalibro mostra «Creo il file ZIP…» e poi la dimensione raggiunta. Come sono chiamate e raggruppate le foto dentro lo ZIP lo decide ciascuna commessa: non esiste una struttura comune. Se il modello sa contare in anticipo e non trova foto, non parte nulla e la pagina scrive «Nessuna foto trovata per i filtri scelti: nessun file da scaricare.»

La prima regola riguarda le firme. Nel file non entrano mai e non vengono contate, qualunque sia il formato:

- la firma raccolta presso l'utenza, cioè il tipo di foto che la commessa usa per la firma;
- la firma della domiciliazione;
- ogni foto che l'app ha segnato come firma.

Uno ZIP con meno immagini delle foto scattate, quindi, non vuol dire che manchino foto, quando la differenza sono le firme. Come l'operatore scatta foto e firma è nel capitolo 8.

La seconda regola riguarda le foto che non si leggono. Una foto illeggibile viene saltata e non blocca l'esportazione: viene contata, e il messaggio finale dice quante foto non sono nel file. Le foto assenti dal disco sono contate allo stesso modo. Il messaggio esatto è «Esportazione completata: N foto su M non sono nel file: mancavano sul disco o non si sono potute leggere.»; sulla pagina compare come «Attenzione: N foto su M non erano sul disco e non sono nel file.» Una «Completata» con foto in meno non è un errore dell'ufficio. È un'informazione da leggere prima di contare le immagini.

Alcuni modelli di foto di singole commesse hanno un ramo proprio nella pagina e restano sincroni, senza link e senza registro. Le foto che mancano dal disco sono una questione per lo staff tecnico: l'esportazione può solo contarle, e recuperarle non è un'azione dell'ufficio. E un periodo molto lungo può esaurire la memoria del lavoro: la risposta è dividere il periodo (sezione successiva).

### Il caso delle PNG, 13–16 novembre 2026

Le due regole vengono da un caso reale. Dal 13 al 16 novembre 2026 l'esportazione delle foto di una commessa falliva sempre, di solito dopo alcuni minuti. Il codice apriva ogni immagine come JPEG, e bastava una foto PNG nel periodo per far fallire tutta l'esportazione; le PNG di quel periodo erano firme. Un utente l'ha riprovata 5 volte, sempre con lo stesso esito. La causa era scritta solo nel log del servizio che esegue i lavori in coda, e quel log si perde a ogni riavvio, così Gea non poteva spiegarla. La correzione (GOP-824, 16 novembre 2026) ha fatto tre cose: le foto si aprono secondo il loro vero tipo; una foto illeggibile viene saltata e contata; ogni lavoro in coda che fallisce scrive la propria causa nel registro errori della commessa, con il numero dell'esportazione. Lo stesso giorno le firme sono uscite da ogni esportazione delle foto, e le nuove foto PNG hanno cominciato a essere salvate come JPEG; quelle già in archivio non sono state convertite.

La lezione per l'ufficio non riguarda le PNG. Un'esportazione che fallisce sempre sullo stesso periodo ha una causa, e rilanciarla non la toglie; dal 16 novembre 2026 quella causa resta registrata.

Prima di contare le immagini dello ZIP si legge il messaggio finale: le firme non entrano mai, le foto illeggibili sono contate, un fallimento ha una causa registrata.

> **Per gli sviluppatori:** `lib/BaseFotoExport.php` (`apriImmagine()`, esclusione delle firme con `MobileV3\Domain\Firma::tipiFirma()`), `lib/jobs/ExportFotoJob.php`, `lib/BaseErrorHandler.php` (`erroreJob()`), `lib/Queue.php` (`segnalaFallimento()`); la causa sta nella colonna `esportazioni_registro.errore` (migrazione `0037_esportazioni_registro_errore.sql`).

## Quando l'esportazione è vuota, fallita o scaduta

*Per l'ufficio; la parte finale serve anche allo staff tecnico.*

Il primo posto dove guardare è la riga in «Ultime esportazioni»: stato, righe esportate e scartate, periodo, modello, messaggio. Non il log, non la memoria di chi l'ha lanciata. Gea legge lo stesso registro, le ultime 10 esportazioni, e sa spiegare una riga a parole (vedi il capitolo 10, *Gea, l'assistente di GOPlanner*).

| Sintomo | Che cosa vuol dire | Che cosa si fa |
|---|---|---|
| 0 righe attese | i filtri non selezionano nulla | si rifanno i controlli della sezione su File › Esportazione |
| Righe nel file meno di quelle attese | la differenza sono gli scartati | si leggono gli scartati |
| Numero di righe non indicato | un'esportazione Excel fatta subito, senza coda: il numero non è stato registrato | niente: non vuol dire zero |
| «In coda» o «In corso» | il lavoro va avanti | si aspetta: non è un errore |
| «Fallita» con una causa | la causa è registrata | si legge la causa (sotto, le cause note) |
| «Fallita» senza causa | fallimento anteriore al 16 novembre 2026, o commessa senza l'aggiornamento | non si deduce nulla dall'assenza di log; staff tecnico |
| «File scaduto» | sono passati 30 giorni | si rifà l'esportazione |
| «Completata» senza «Scarica» | un modello che invia, o nessun dato | si legge il messaggio (sezione sulla coda) |

### Le cause note

La causa salvata è breve per costruzione: al massimo 255 caratteri, solo il primo paragrafo, i percorsi dei file sostituiti da `[percorso]`. Quelle che si incontrano sono poche.

- «Nessuna delle N foto era leggibile sul disco.», oppure «Il file non e' stato creato: …»: foto assenti o danneggiate sul disco. Staff tecnico.
- «Errore fatale: Allowed memory size …»: il periodo è troppo grande per la memoria del lavoro. Si riprova con un periodo più corto.
- «Il lavoro non dava piu' segni di vita (worker riavviato o fermo).»: il lavoro è rimasto 30 minuti senza aggiornare l'avanzamento, di solito perché il servizio si è riavviato a metà. Si riprova; se si ripete, staff tecnico.
- Un testo tecnico che parla di un'immagine «false given»: è il caso PNG della sezione sulle foto, già corretto. Se ricompare su un'esportazione recente è un difetto nuovo: staff tecnico.

Nei log non c'è nulla: quindi l'esportazione è andata bene? No. Prima del 16 novembre 2026 i lavori in coda non scrivevano nel registro errori, e un log vuoto non prova niente. Anche dopo quella data, la causa si salva solo dove la commessa ha l'aggiornamento della colonna; senza, l'esportazione funziona ma la causa non resta. La formula onesta è *causa non registrata*, e la riga passa allo staff tecnico.

### Che cosa dare allo staff tecnico

1. Il numero dell'esportazione.
2. L'ora del lancio.
3. Il modello e il periodo.
4. La causa registrata, se c'è.
5. Il codice errore trovato nei log, se c'è: 8 caratteri, cifre e lettere da A a F.

Il testo tecnico grezzo e i percorsi dei file non vanno mai in un messaggio al committente. Un caso storico del capitolo 6, le esecuzioni rimaste orfane dopo una cancellazione e quindi uscite dall'esportazione, è già corretto; se ne parla lì.

La causa salvata esiste solo per i fallimenti successivi all'aggiornamento e sulle commesse dove è stato applicato. L'ufficio non legge i log del servizio che esegue i lavori: Admin › Errori app e Log è nel capitolo 12, per chi ha accesso. E un'esportazione fallita per una causa tecnica si rifà dopo la risposta dello staff tecnico, non in un ciclo di tentativi: il caso delle 5 prove sullo stesso periodo lo mostra.

Prima di rilanciare si legge la riga. Si rilancia solo quando la causa dice che serve (filtri, periodo, un riavvio); tutto il resto si passa con numero e ora.

> **Quando chiedere allo staff tecnico:** un'esportazione «Fallita» senza causa registrata; foto che mancano dal disco; «Duplica e modifica» o «Ultime esportazioni» assenti sulla commessa; un modello di sistema sbagliato per ogni file; il dubbio se il modello prenda solo interventi verificati, o quale data legga; un file che esce in un formato diverso da quello scelto; prima di rilanciare un modello che invia; una «Completata» che non si riesce a scaricare.

Nel caso del 1° dicembre il primo file non era sbagliato: è partito prima che le tre esecuzioni arrivassero. La correzione è un secondo file, non una modifica del primo, e da quel momento esistono due versioni di novembre. Se il primo è partito con un link, al committente va il link del secondo e quello del primo si revoca: chi apre il vecchio link legge che è stato revocato, invece di scaricare 412 righe. Finché sono tra le ultime 15, le due esportazioni restano in «Ultime esportazioni», ciascuna con la sua ora, il suo utente e il suo periodo; quando il committente chiede che cosa ha ricevuto e quando, si risponde da quelle due righe.

## Fonti

- codice: `lib/ExportInterventiQuery.php`
- codice: `lib/InterventoEseguitoBase.php`
- codice: `lib/MobileV3/Domain/EsitoWriter.php`
- codice: `lib/ExportBase.php`
- codice: `lib/Export.php`
- codice: `lib/JSONController.php`
- codice: `lib/jobs/ExportInterventiJob.php`
- codice: `lib/jobs/ExportFotoJob.php`
- codice: `lib/BaseFotoExport.php`
- codice: `lib/MobileV3/Domain/Firma.php`
- codice: `lib/EsportazioneRegistro.php`
- codice: `lib/EsportazioneLink.php`
- codice: `scarica_link.php`
- codice: `lib/EsportazioneModelli.php`
- codice: `lib/MappaturaEsportazione.php`
- codice: `lib/MappatureEsportazioneController.php`
- codice: `lib/AvanzamentoJob.php`
- codice: `lib/BaseErrorHandler.php`
- codice: `lib/Queue.php`
- codice: `lib/ChatbotImportExport.php`
- codice: `lib/ChatbotStrumentoProponiMappatura.php`
- codice: `pages/file.php`
- codice: `js/code/esportazione.js`
- codice: `js/code/esportazione-modelli.js`
- codice: `Smarty_templates/it/esportazione.html`
- codice: `lib/dict/lang_it.php`
- codice: `migrations/tenant/0037_esportazioni_registro_errore.sql`
- codice: `migrations/tenant/0039_mappature_export.sql`
- codice: `cron_worker.php`
- wiki: `wiki/assistenza-clienti/export-dati.md`
- wiki: `wiki/assistenza-clienti/esportazione-modelli-salvati.md`
- wiki: `wiki/assistenza-clienti/runbook-export-vuoto-o-fallito.md`
- wiki: `wiki/assistenza-clienti/runbook-export-foto-png.md`
- wiki: `wiki/assistenza-clienti/stato-import-export.md`
- docs: `docs/03-cookbooks/02-create-import-export-map.md`
- docs: `docs/03-cookbooks/33-esportare-in-excel-una-griglia.md`
- docs: `docs/03-cookbooks/35-errori-dei-job-in-background.md`
- changeset: `changeset/2026-11-15-gop-817-esportazione-come-importazione.md`
- changeset: `changeset/2026-11-16-gop-647-export-in-coda-volume-condiviso.md`
- changeset: `changeset/2026-11-24-gop-647-esportazioni-async-link.md`
- changeset: `changeset/2026-11-16-gop-824-export-foto-causa.md`
- changeset: `changeset/2026-11-16-gop-824-errori-lavori-in-coda.md`
- changeset: `changeset/2026-11-16-gop-824-png-in-jpg-esclusione-firme.md`
- changeset: `changeset/2026-11-19-gop-818-modelli-esportazione-salvati.md`
- changeset: `changeset/2026-11-09-gop-739-chatbot-import-export.md`
- Portolano: `goplanner-esportazione-foto-firme-png`
- Jira: GOP-241 — Registro delle esportazioni: tracciare ogni esecuzione, conservare i file 30 giorni, limitarne la visibilità per lotto
- Jira: GOP-647 — Esportazione foto non funzionante; esportazioni in coda e link (changeset 16/11 e 24/11/2026)
- Jira: GOP-739 — Chatbot: accesso immediato a ultime importazioni/esportazioni e ai loro log
- Jira: GOP-743 — Segnalibri dei lavori in background
- Jira: GOP-747 — Estrazioni Excel delle griglie come lavoro asincrono con segnalibro
- Jira: GOP-817 — Pagina Esportazione allineata a Importazione
- Jira: GOP-818 — Modelli di esportazione salvati: Duplica e modifica ed editor delle colonne
- Jira: GOP-824 — Esportazione foto: le PNG bloccano l'export e il motivo non è visibile (Gea)

<!-- WORD COUNT: ~5980 (after Reviewer corrections, 25 novembre 2026) -->
<!-- PERSONA CHECK: Pass — voce The Engineer + The Scholar: etichette esatte tra virgolette basse, numeri con fonte (30 giorni, 15 righe, 256 bit, 255 caratteri, 61/74 e 36 cartelle), casi reali problema → causa → rimedio (GOP-647, GOP-824), ogni regola con il suo limite; nessun aggettivo di marketing, nessun «noi» o «io» autoriale. -->
<!-- NUF CHECK: 1 cosa legge un'esportazione (interventi_eseguiti, perché un intervento non è nel file) ✅; 2 lancio da File › Esportazione con procedura, pulsanti rapidi, esito, «Del modello», «Altri filtri», riepilogo ✅; 3 «Filtra per» (esecuzione, pianificazione, validazione = data_m) ✅; 4 coda, segnalibro, stati, «Ultime esportazioni», «Ripeti» sposta in avanti ✅; 5 «Copia link» / «Revoca link», senza accesso, 30 giorni salvo impostazione della commessa, mai oltre il file ✅; 6 «Duplica e modifica», editor, anteprima, condiviso, «classica» ✅; 7 foto: firme escluse e non contate, foto illeggibili saltate e contate ✅; 8 tabella dei sintomi, cause note, che cosa dare allo staff tecnico ✅; 9 sicurezza del rilancio (il modello standard legge) ed eccezioni dei modelli che inviano ✅; 10 fatti con fonte (30 giorni, link, regola del menu, stessa interrogazione, 15 righe, XML/Excel5, GOP-817/818/647/824) ✅ -->
<!-- ANTI-AI CHECK: Nessuna frase vietata. Correzioni Stage 2: riquadri «Per gli sviluppatori», «Attenzione» e «Quando chiedere allo staff tecnico» resi come blockquote; aggiunte tabelle per formati, «Filtra per», stati dell'esportazione, durate e sintomi; elenco dei tre fattori in § 1 per rispettare il limite di 5 paragrafi di prosa consecutivi; procedure spezzate in azioni singole («Usa», conferma della revoca); «firma del cliente» sostituita con «firma raccolta presso l'utenza» (glossario); «cliente» resta solo dentro etichette e messaggi citati. Cinque contro-obiezioni con risposta. Un solo H1, «In questo capitolo» in corsivo, ## Fonti in chiusura, niente HTML nel testo. Nessun dato personale, credenziale o host. -->
