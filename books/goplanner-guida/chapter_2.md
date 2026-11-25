# 2. Commesse e tenant

*In questo capitolo si vede che cosa vuol dire, in pratica, che ogni commessa ha i suoi dati e le sue regole: dove stanno i dati, quale cartella governa ciò che si vede sullo schermo, quale versione di un comportamento vince quando il codice comune e la commessa dicono cose diverse, come nasce una commessa nuova. Le prime due sezioni e l'ultima sono per tutti; le altre sono per lo staff tecnico e gli sviluppatori, e lo dicono in apertura.*

## Una commessa, i suoi dati e le sue regole

*Per tutti.*

Un caso inventato, ma che in ufficio succede. Due colleghi cercano la stessa utenza, per esempio il codice *UT-000123*, nella griglia Clienti. Il primo la trova al primo colpo. Il secondo riceve una griglia vuota e pensa che l'utenza sia stata cancellata, o che l'importazione di ieri sia andata storta. Nessuna delle due cose è vera. I due hanno aperta una commessa diversa, e l'utenza esiste soltanto in una delle due.

La commessa è il lavoro svolto per un committente, con i suoi dati e le sue regole. Nel codice di GOPlanner la stessa cosa si chiama tenant: in questa guida la parola compare solo quando nomina il codice, come la cartella `custom/{tenant}`. La regola che conta per chi lavora in ufficio è una. Si lavora dentro **una** commessa alla volta. Le ricerche, le griglie, le liste, le esportazioni e perfino le risposte di Gea valgono per la commessa aperta, e per nessun'altra.

Quale commessa è aperta lo dice l'intestazione della pagina: a destra c'è un pulsante con il suo nome. Se la persona ha accesso a più di una commessa, quel pulsante apre il selettore delle commesse. Se ne ha una sola, il pulsante mostra il nome e porta alle impostazioni, senza menu. Per passare a un'altra commessa:

1. Fai clic sul pulsante con il nome della commessa, in alto a destra.
2. Nel menu che si apre, sotto il titolo «Cambia commessa», scrivi una parte del nome nel campo «Cerca commessa...».
3. Se compare «Nessuna commessa trovata», controlla quello che hai scritto: l'elenco contiene solo le commesse a cui hai accesso.
4. Fai clic sulla commessa che ti serve. La pagina si ricarica e la commessa nuova è quella aperta.

Nell'elenco ogni commessa ha l'icona di un database; quella aperta ha in più un segno di spunta. Dopo il cambio GOPlanner ricorda la scelta in un cookie, `cliente`, che dura 7 giorni. Quando un amministratore aggiunge una commessa all'accesso di una persona, il messaggio di conferma lo dice in chiaro: «la nuova commessa compare nel selettore delle commesse al prossimo accesso». Non subito, quindi. Al prossimo accesso.

Il cambio può essere rifiutato. In quel caso compare un avviso e si resta sulla commessa di prima. I messaggi dicono «cliente» e non «commessa»: «Il cliente «X» è disattivato.», «Non sei autorizzato ad accedere al cliente «X».», «Il cliente «X» non esiste più.», oppure «Non è stato possibile creare il tuo accesso al cliente «X». Contatta l'amministratore.». Ogni rifiuto lascia una riga nel log del server con il solo codice del motivo e gli identificativi, mai dati sensibili. Fino a luglio 2026 non era così: uno dei percorsi di cambio aggiornava la commessa ma non il suo tipo, e la pagina caricava la configurazione di un tipo sbagliato. Con GOP-107, chiuso il 30 luglio 2026, tutti i percorsi passano dallo stesso controllo, che aggiorna commessa e tipo insieme.

Che cosa resta uguale e che cosa cambia da una commessa all'altra? La tabella che segue separa le due cose. La colonna di destra non è un elenco completo: raccoglie le impostazioni che le commesse cambiano davvero, verificate nei file `config.inc.php` delle commesse e nel documento sulla priorità della configurazione.

| Uguale in tutte le commesse | Può cambiare da commessa a commessa |
|---|---|
| Il ciclo: importazione → pianificazione → app → esito → verifica → esportazione | Le voci di menu (`$custom['menu']`, anche menu personalizzati per utente) |
| Le parole del glossario | I tipi di intervento e gli stati (`$custom['tipo_intervento']`, `$custom['stati']`) |
| Il selettore delle commesse e il modo di cambiare commessa | Le impostazioni dell'app, compresi i tipi di foto (`$custom['mobile']['tipi_foto']`) |
| Il profilo amministratore: uno solo, uguale per tutte le commesse | I campi dell'intervento, il logo, le scadenze, i lotti |
| Le regole del codice comune, dove la commessa non le sostituisce (sezione «Chi vince») | Le mappature di importazione ed esportazione e le griglie (file separati: `php/mappature.php`, `php/flexifields.php`) |

Il limite va detto subito. I dati di una commessa non compaiono in un'altra, in nessuna pagina. Anche Gea si apre sulla commessa aperta in sessione e, quando le si chiede la configurazione, risponde per quella sola: la documentazione dell'assistenza dice che la risposta descrive «esclusivamente la configurazione effettiva» della commessa aperta. Gea può mostrare i campi personalizzati dell'intervento, le colonne delle viste principali e le mappature, ma non le cambia: «le modifiche richiedono il normale processo di configurazione amministrativa». La stessa persona può avere accesso a più commesse, con permessi e lotti diversi in ciascuna; è un tema a sé, trattato nel capitolo 11.

Resta il caso contrario. «Ma il collega vede l'utenza e io no, nella stessa commessa?» Se la commessa è davvero la stessa (basta guardare il pulsante in alto a destra di tutti e due), la commessa non è la causa. La causa probabile sono i lotti di competenza. Il messaggio dell'interfaccia lo dice con esattezza: «Gli utenti senza lotti assegnati vedono tutti i lotti della commessa». Chi ha dei lotti assegnati vede solo quelli; nel codice, un elenco di lotti vuoto significa «nessuna limitazione». Lotti e visibilità sono nei capitoli 3 e 11.

Davanti a un comportamento strano, quindi, la prima domanda non è «che cosa si è rotto?». È «in quale commessa?».

## Dove stanno i dati: il DB master e un database per commessa

*Per tutti. I nomi delle tabelle servono allo staff tecnico; chi lavora in ufficio può saltarli, la regola resta.*

Un solo accesso può aprire più commesse. Un'utenza, invece, non passa mai da una commessa all'altra. Le due cose sembrano in contrasto e non lo sono: le persone e il lavoro stanno in due posti diversi.

I database sono due livelli. Il primo si chiama fisicamente `goplanner` ed è il DB master: contiene i dati globali, condivisi da tutte le commesse. Lì c'è l'anagrafica delle commesse (la tabella `clienti`), ci sono gli accessi delle persone (`users`) e, sopra gli accessi, l'identità della persona (`identita` e `identita_users`), i ruoli, il log centrale degli errori e l'anagrafica dei lotti. Il secondo livello è il database della commessa, uno per ciascuna. Il suo nome è `goplanner_` seguito dal valore del campo `db` della riga della commessa in `clienti`: una commessa con codice, per esempio, `nuova_commessa` ha il database `goplanner_nuova_commessa`. Lì sta il lavoro: le utenze, le liste e le righe importate, gli interventi, le esecuzioni, le foto, le impostazioni.

| Che cosa | Dove sta | Tabella |
|---|---|---|
| Anagrafica delle commesse | DB master `goplanner` | `clienti` |
| Accessi delle persone | DB master `goplanner` | `users` |
| Identità e collegamento alle commesse | DB master `goplanner` | `identita`, `identita_users` |
| Anagrafica dei lotti | DB master `goplanner` | `lotti` |
| Log centrale degli errori | DB master `goplanner` | `error_log` |
| Utenze (menu «Clienti») | Database della commessa | `utenti` |
| Liste e righe importate | Database della commessa | `carichi`, `carichi_righe` |
| Interventi ed esecuzioni | Database della commessa | `interventi`, `interventi_eseguiti` |
| Foto | Database della commessa | `foto` |

> **Attenzione:** i nomi delle tabelle sono una trappola. Nel database della commessa la tabella `utenti` contiene le **utenze**, cioè le anagrafiche delle utenze finali che nell'interfaccia compaiono sotto il menu «Clienti». Gli **utenti** del gestionale, le persone che fanno l'accesso, stanno invece in `goplanner.users`, nel master. Chi legge un messaggio d'errore con il nome `utenti` deve pensare alle utenze, non alle persone.

> **Per gli sviluppatori:** la regola d'accesso è netta. Il DB master si legge e si scrive **sempre** con `MainOrm`; il database della commessa **sempre** con `SimpleOrm`. All'avvio della pagina `config.inc.php` compone il nome del database con `'goplanner_' . $_SESSION['user']['db']`, lo passa a `SimpleOrm::useConnection()` e scrive la commessa corrente in `GOPlanner::$account`. I job fanno lo stesso in `lib/GOPlanner.php`. La riga della commessa in `clienti` porta cinque campi essenziali: `db` (il codice: suffisso del database e nome della cartella in `custom/`), `nome` (il nome che si vede nel selettore), `apikey` (una chiave API univoca), `tipo` (la cartella base in `custom/`, per esempio `default`) e `attivo` (1 o 0). Al cambio di commessa la sessione copia `clienti.db` in `db` e `clienti.tipo` in `dbtype`: per questo `clienti.tipo`, `dbtype` e cartella base sono tre nomi della stessa cosa. Il modello dei dati nel dettaglio è nel capitolo 14.

Perché le persone non sono state fuse in un'unica anagrafica, con un solo login per tutte le commesse? Prima dell'identità ogni login era legato a una sola commessa, e la stessa persona su tre commesse aveva tre righe in `users`, con tre parole d'ordine. La decisione documentata è stata di **non fondere** quelle righe, ma di mettere sopra un livello nuovo, l'identità, collegato alle righe esistenti. La ragione è scritta nel documento sull'identità (`docs/02-patterns/25-identita-centralizzata-e-rbac.md`). Il collegamento fra un operatore e il suo utente, la colonna `operatori.id_user`, sta dentro il database di ogni commessa: rinumerare gli utenti voleva dire toccarli tutti insieme, cosa che non si può fare in una sola transazione, e un errore a metà avrebbe rotto senza avvisi, in produzione, il legame fra gli operatori e gli utenti che li seguono. Sopra le commesse c'è anche un livello di organizzazione, indicato in `clienti.codice_org`; se ne parla nel capitolo 11.

La domanda che segue è pratica. «Lavoro per due committenti: mi servono due accessi?» No, se l'accesso è collegato a un'identità. In quel caso le commesse disponibili compaiono tutte in «Cambia commessa» e si passa dall'una all'altra senza uscire. Nell'Elenco utenti c'è una riga per persona, non per login, e la colonna «Commessa e profilo» mostra la commessa corrente con un «+N» per le altre. Fanno eccezione le righe **Senza identità**: sono «login più vecchi non ancora collegati a una persona», e restano legati alla sola commessa corrente. Collegarli è un lavoro dell'amministratore, descritto nel capitolo 11.

Il limite di questa architettura sta nelle parole «uno per commessa». Nessuno ha mai garantito che i database delle commesse avessero la stessa struttura: lo scrive il documento sullo schema canonico (`docs/02-patterns/45-schema-canonico-tenant.md`). Dal 5 novembre 2026 (GOP-696) esiste uno schema di riferimento, e le sue migrazioni solo aggiungono: non tolgono mai nulla. Quanto la realtà ne sia ancora lontana lo dice un numero confermato in Jira (GOP-697, GOP-702): a quella data 40 database di commessa erano esclusi dallo schema di base perché diversi. Gli altri numeri del rapporto (67 database attivi, 26 registrati, 1 saltato) il documento li dichiara «citato, non verificato qui». Per lo staff tecnico c'è un controllo, `make schema_check`, e il percorso è nei capitoli 14 e 16. Per l'ufficio nessuna azione: solo un sintomo da riconoscere, raccolto nell'ultima sezione.

La regola da portare via è corta. La persona sta nel master; il lavoro sta nella commessa.

## La cartella della commessa: `custom/{tenant}`

*Per lo staff tecnico; chi lavora in ufficio può leggere solo la tabella.*

Questa guida non descrive le personalizzazioni di nessuna commessa. Quelle stanno nel `README.md` della cartella della commessa, e lì vanno cercate e aggiornate. Qui si spiega la forma della cartella: quali file ci sono e che cosa governa ciascuno. Al 25 novembre 2026 le cartelle con un `config.inc.php` sono 73, comprese le cartelle di tipo e quelle di prova; 63 hanno un `README.md`. Il numero delle commesse vere non coincide con il numero delle cartelle, e per questo qui non se ne dà uno.

| File | Che cosa governa | Che cosa vede l'ufficio | Presente in |
|---|---|---|---|
| `config.inc.php` | Menu, tipi di intervento, stati, app e tipi di foto, lotti, logo, campi dell'intervento | Le voci di menu, i tipi e gli stati nelle tendine, le foto richieste dall'app | 73 |
| `php/mappature.php` | Mappature di importazione ed esportazione (capitoli 4 e 7) | Le colonne lette dal file del committente e quelle del file di ritorno | 72 |
| `php/flexifields.php` | Griglie: colonne e voci di ricerca | Le colonne delle griglie e i campi del pannello di ricerca | 71 |
| `js/custom.js` | Codice JavaScript della commessa nel back office | Comportamenti propri della commessa nelle pagine | 71 |
| `php/Utenza.php` | Sostituisce la classe comune `Utenza` | Regole proprie sulle utenze | 65 |
| `README.md` | Documentazione delle personalizzazioni | Nulla: è per chi lavora sul codice | 63 |
| `php/Intervento.php` | Sostituisce la classe comune `Intervento`; contiene i campi dell'app | I campi personalizzati che l'operatore compila | 61 |
| `templates/` | Modelli dei file di esportazione (Excel, PDF, ODG) | La forma dei file esportati | 51 |
| `php/PDF.php` | Logiche dei PDF della commessa | I PDF generati | 38 |
| `DUBBI.md` | Dubbi aperti sulla configurazione | Nulla | 23 |
| `moduli.json` | Moduli condivisi di database dichiarati dalla commessa | Nulla | 2 |

Le cartelle sono di due livelli. C'è la cartella del **tipo**, come `custom/default` o `custom/abc`, e c'è la cartella della commessa. Il tipo è il valore di `clienti.tipo`: più commesse possono condividere lo stesso tipo, e quindi la stessa configurazione di base. `custom/default` è leggera: `config.inc.php`, una cartella `js/` e quattro file in `php/` (`flexifields.php`, `Magazzino.php`, `mappature.php`, `xls.php`), senza `README.md`. `custom/abc` è più ricca, con 13 file in `php/`, tra cui `Intervento.php`, `Utenza.php`, `Export.php` e `Import.php`. Come i due livelli si combinano è il tema della sezione seguente; in breve, il tipo conta per `config.inc.php` e per `custom.js`, non per le classi in `php/`.

La forma più comune di `Intervento.php` è anche un indizio di come si scrive un override. In 58 cartelle la prima riga della classe è `class Intervento extends InterventoBase`; in 3 è `class Intervento extends InterventoGM`. La classe della commessa eredita dal codice comune e ridefinisce solo ciò che le serve.

Un caso reale mostra perché questa cartella va letta voce per voce. In `flexifields.php` una voce di ricerca ha due parti: l'etichetta che si vede (`display`) e la colonna su cui si filtra (`name`). In 44 cartelle la voce con etichetta «PDR» puntava a `'name'=>'codice'` invece che a `'name'=>'pdr'`: un copia-incolla, ripetuto di cartella in cartella. Il risultato è descritto così nella procedura di creazione delle commesse: «la ricerca sembrava funzionare (nessun errore SQL, nessun crash) ma filtrava sulla colonna sbagliata e non trovava mai nulla». Chi cercava un PDR non riceveva nessun messaggio da segnalare, solo una griglia vuota. La correzione è un solo commit del 9 luglio 2026 sui 44 file `flexifields.php`; il giorno dopo, il 10 luglio, la procedura ha ricevuto un passo di controllo in più. Era un difetto della ricerca, non dei dati: le utenze c'erano, il filtro guardava altrove.

Il controllo ora previsto ha quattro azioni:

1. Estrai le coppie `display`/`name` di ogni voce `searchitems`.
2. Se due voci con etichette diverse puntano alla stessa colonna, verificale una per una.
3. Controlla che ogni `name` esista nella query della griglia.
4. Se non esiste, correggi la voce, toglila o scrivi il dubbio in `DUBBI.md`.

Non tutto ciò che distingue una commessa sta nella sua cartella, ed è un limite da tenere presente prima di cercare. Le colonne di importazione di `carichi_righe` stanno nel database della commessa, non in `custom/`: le genera la mappatura, ma vanno create a parte (sezione «Come nasce una commessa nuova»). I moduli condivisi di database stanno in `migrations/tenant/modules/` (oggi, tra gli altri, `letture`, `timbrature`, `asterisk`) e si applicano solo alle commesse che li dichiarano in `moduli.json`. E alcune scelte le fa il codice comune sopra la commessa, come si vede nella sezione seguente. Anche il nome `templates/` inganna: contiene i modelli dei file di esportazione, letti da `ExportBase`, non i modelli delle pagine del back office.

Chi vuole sapere perché una commessa si comporta così apre prima il suo `README.md`, poi il suo `config.inc.php`.

## Chi vince: l'ordine degli override

*Per lo staff tecnico e gli sviluppatori.*

Un ticket viene chiuso come risolto. La correzione è in `lib/`, i test sono verdi, in tre commesse il problema è sparito. In una quarta resta identico. Nessuno ha sbagliato la correzione: quella commessa ha una sua versione della classe, e la versione della commessa vince. Per capire quando succede bisogna conoscere l'ordine in cui GOPlanner legge le cose.

### La configurazione: tre livelli

La configurazione si legge in tre livelli. In `config.inc.php`, righe 436-441, il codice comune prima imposta i suoi valori, poi include `custom/{dbtype}/config.inc.php`, il file del tipo, e infine `custom/{db}/config.inc.php`, il file della commessa. Sono file PHP che scrivono nello stesso array `$custom`: l'ultimo che scrive una chiave vince. Quindi la commessa vince sul tipo, e il tipo vince sul comune. Lo stesso ordine si ritrova nei job e nel worker (`lib/GOPlanner.php`, righe 143-158) e nell'app v3 (`lib/MobileV3/TenantBootstrap.php`).

Gea mostra la regola e anche il suo limite. Nel file del repository la riga `$custom['chatbot_enabled'] = true;` sta prima dei due include, con il riferimento a GOP-143: il valore comune è «acceso» e una commessa lo può spegnere nel proprio file. Nell'immagine Docker, però, `config.inc.php` è sostituito da `config-docker.inc.php`, e lì il punto di partenza è un interruttore del servizio. Il commento del codice fissa la regola valida in tutti i percorsi: «Il tenant puo' spegnerlo nel proprio config.inc.php, non accenderlo senza l'interruttore». «Accesa per default», dunque, vale per il file del repository e per i job, non per le pagine web in produzione. Al 25 novembre 2026 nessuna commessa usa questa chiave nel proprio file.

### Le classi: due livelli

Le classi seguono un'altra strada. `config.inc.php` registra `goplannerAutoload`, che chiama `ClassiCustom::carica()`. Quando il codice usa una classe non ancora caricata, il metodo la cerca in quest'ordine: `custom/{commessa}/php/<Classe>.php`, poi `lib/class<Classe>.php`, poi `lib/<Classe>.php`, poi `lib/jobs/<Classe>.php`. Si ferma al primo file che trova. Non esiste un passo per la cartella del tipo: un diagramma della documentazione ne disegna uno, `custom/{dbtype}/php/`, ma nel codice di `php8` nessun punto lo carica. Per le classi i livelli sono due: commessa, poi comune.

### Il JavaScript e le pagine

Per il JavaScript il tipo torna a contare, ma in un altro modo. `custom.js` è un solo file servito al browser, fatto di due pezzi in fila: prima `custom/{dbtype}/js/custom.js`, poi `custom/{db}/js/custom.js` (`js/code/js.php`, righe 120-130). Qui non vince uno dei due: arrivano entrambi, e quello della commessa viene dopo quello del tipo. L'indirizzo porta il codice della commessa e un'impronta dei due file; se la commessa nell'indirizzo non è quella in sessione, la risposta è 403, cioè accesso negato (GOP-624). Il browser lo tiene in cache per 24 ore. Anche gli altri file di `js/code/` si possono sostituire con un file omonimo in `custom/{db}/js/`. I modelli delle pagine, invece, si leggono soltanto da `Smarty_templates/<lingua>/`: nel codice comune non è stato trovato un override per commessa.

### Da dove viene un comportamento

Per risalire all'origine di un comportamento servono quattro passi, in quest'ordine:

1. Leggi `clienti.db` e `clienti.tipo` della commessa coinvolta.
2. Cerca la classe in `custom/{db}/php/`: se c'è, è lei a decidere, non `lib/`.
3. Cerca la chiave di configurazione in `custom/{db}/config.inc.php` e poi in `custom/{tipo}/config.inc.php`.
4. Solo se non trovi nulla nei passi 2 e 3, il comportamento è quello di `lib/` e di `config.inc.php`.

Il passo 4 ha delle eccezioni volute, e sono il limite di questa regola. A volte il codice comune decide sopra la commessa. In `index.php`, righe 115-118, la voce Magazzino compare nel menu in alto se il magazzino v3 della commessa è acceso, «anche se custom/<tipo> la spegne» (GOP-767); il menu personalizzato dell'utente resta però l'ultima parola. Alle righe 145-148, GOP-855: «il Magazziniere vede solo il Magazzino, anche se il tenant o il menu personalizzato dicono altro». Non sono difetti. Sono scelte del codice comune, scritte con il numero del ticket accanto. Un'altra eccezione è meno visibile: le pagine Admin (`admin.php`, `json_admin.php`) includono solo il file della commessa e non quello del tipo. Se questo produca differenze visibili nelle pagine Admin, le fonti non lo dicono.

> **Attenzione:** un override si può rompere in due modi. Il primo riguarda chi scrive codice. Se la classe della commessa non implementa un metodo `abstract` del genitore, o se in PHP 8 ridichiara un metodo con una firma incompatibile, PHP si ferma con un errore fatale al caricamento: la pagina resta vuota. La regola è documentata in `docs/02-patterns/02-customization-pattern.md`: si cercano le `abstract function` del genitore e se ne copia la firma, anche con un corpo vuoto. `ClassiCustom::analizza()`, quando deve sapere che cosa fa una classe della commessa, ne legge il sorgente come testo invece di caricarla, proprio per non far cadere la pagina.
>
> Il secondo modo è più sottile, ed è stato visto davvero. In PHP una classe caricata non si scarica. Un processo che esegue di seguito i lavori di più commesse userebbe quindi l'`Intervento` della prima per tutte le altre. Nel ticket GOP-687, aperto il 4 novembre 2026, l'esportazione di ottobre di una commessa, 23.209 record attesi, fallisce in 9 secondi con «Undefined constant Intervento::codici_note_lettura»: il worker era un solo processo per i job di tutte le commesse. Il rimedio è doppio. Il worker esegue ogni job in un processo figlio, e `ClassiCustom::verifica()` fa fallire il job con un errore esplicito se trova già caricate le classi di un'altra commessa: «Il Job non viene eseguito per non usare la logica di un altro tenant». Il caso è evitato a monte; la guardia esiste per trasformare l'eventuale svista in un errore leggibile.

Torna così il ticket dell'inizio, nella forma dell'obiezione: «Ho corretto il bug in `lib/` e per una commessa non cambia niente». Il primo sospetto è che la commessa sovrascriva la classe, o il metodo: la correzione va portata anche lì, oppure l'override va ridotto. Il rischio esiste anche nel verso opposto, quando è il codice comune a scavalcare l'override. Una commessa ridefinisce `export()` ed `exportData()` nel proprio `Export.php`, per caricare il file via FTP, comprimere le foto e mandare un'e-mail; quando la coda di esportazione è stata allargata, il codice comune la mandava in silenzio sul metodo di `ExportBase`, e la correzione ha dovuto escludere le commesse che ridichiarano quei metodi (GOP-266, settembre 2026). Nei due versi l'abitudine è la stessa: prima di cambiare un metodo di `lib/`, e di nuovo prima di chiudere il ticket, si cerca chi lo ridichiara, per esempio con `git grep -l "function exportData" -- 'custom/*/php/'`. I file trovati sono le cartelle che la correzione non raggiunge da sola.

La regola in una riga: per la configurazione, commessa > tipo > comune; per le classi, commessa > comune.

## Come nasce una commessa nuova

*Per lo staff tecnico, tranne la sottosezione «Che cosa prepara l'ufficio».*

Una commessa nuova nasce quasi sempre come copia di un'altra. Si clona il database di una commessa simile, si copia la sua cartella, si cambia ciò che differisce. È il motivo per cui si fa in fretta, ed è il motivo per cui gli errori della sorgente passano alla copia senza fare rumore: il difetto della ricerca per PDR, raccontato nella sezione «La cartella della commessa», si era ripetuto in 44 cartelle con un copia-incolla.

### Che cosa prepara l'ufficio

L'ufficio non crea la commessa: la chiede allo staff tecnico. Può però arrivare con le risposte giuste. La procedura dello staff tecnico prevede solo le domande che cambiano la configurazione della commessa, e sono tre:

1. Qual è il formato del file di ritorno? Serve un esempio. Se il committente non ne ha uno, la procedura propone queste colonne: gli identificativi del file di carico con data e ora, valore, esito, nota, foto, GPS.
2. I record cessati vanno esclusi o no?
3. Quali foto sono obbligatorie, e in quale momento? Da questa risposta nascono i tipi di foto dell'app.

Due cose, invece, non servono: il numero e i nomi degli operatori, perché gli operatori li crea l'azienda stessa, e il periodo di lavoro, che non incide sulla configurazione.

### I passi dello staff tecnico

Le fonti sono tre: il cookbook `docs/03-cookbooks/01-add-new-client.md`, il modulo di avvio `docs/03-cookbooks/12-tenant-bootstrap-modulo.md` e la procedura `create-new-tenant`. L'ordine che segue è quello della procedura, la più completa, con un solo spostamento preso dal cookbook e da GOP-418: `mappaturaInput` va dopo il rilascio.

1. Compila il modulo di avvio.
2. Clona il database di una commessa simile con `./db_clone.sh <db_sorgente> <db_destinazione>`.
3. Registra la commessa nuova in `goplanner.clienti` con `db`, `nome`, `apikey`, `tipo`, `attivo`.
4. Copia la cartella `custom/` della stessa commessa sorgente.
5. Togli i file specifici della sorgente.
6. Prepara la cartella delle foto sul file system condiviso.
7. In `config.inc.php` definisci `$custom['tipo_intervento']`.
8. Allinea `mappature.php` e `flexifields.php`.
9. Controlla ogni voce `searchitems`, come nella sezione «La cartella della commessa».
10. Configura i campi dell'app in `Intervento.php`.
11. Rivedi le coordinate testuali clonate dalla sorgente.
12. Rivedi `custom.js`.
13. Crea il primo amministratore.
14. Dopo il rilascio, esegui `mappaturaInput` prima che un operatore sincronizzi.
15. Imposta il centro della mappa con `php scripts/update_centromappa.php --tenant=<nuovo_tenant> --execute`.

Lo script di clonazione è prudente. Si ferma se il database di destinazione esiste già, mostra «La dimensione del database sorgente '…' è: N MB» e chiede «Procedere con la clonazione? (y/n)». Poi esporta la sorgente in un file temporaneo, crea il database nuovo, importa e cancella il file. La parola d'ordine del database arriva da una variabile d'ambiente o dal gestore dei segreti, mai dalla riga di comando; se manca, lo script si ferma.

### I due passi che non danno errore subito

Due passi della lista hanno una cosa in comune: quando mancano, il danno non si vede mentre si crea la commessa, ma dopo, all'esportazione o alla prima sincronizzazione dell'app. Il primo è `$custom['tipo_intervento']`. Il cookbook lo dice obbligatorio: la prima voce dell'array diventa il tipo predefinito tramite `Intervento::getDefaultTipo()`, e ogni intervento pianificato o importato deve avere un tipo, altrimenti, sempre secondo il cookbook, si spezzano i filtri statici dell'esportazione. Il codice conferma la prima metà: se l'array è vuoto, `getDefaultTipo()` restituisce una stringa vuota, quindi nessun tipo. L'effetto preciso sull'esportazione lo dicono solo cookbook e procedura.

Il secondo è `mappaturaInput`. La mappatura di importazione può chiedere campi che nel database della commessa non sono ancora colonne di `carichi_righe`. `ADMINController::mappaturaInput()` legge la mappatura `input` della commessa e calcola un `ALTER TABLE carichi_righe` con le sole colonne mancanti: `varchar(500)` per i campi di tipo `array`, `varchar(50)` per gli altri. Senza quelle colonne, secondo un rilievo della revisione di GOP-418 dedotto dal codice, la sincronizzazione dell'app «può fallire con "Unknown column" e l'importazione può perdere i valori senza avvisare». Il passo si fa dopo il rilascio e prima che un operatore sincronizzi, con un utente dello staff GOPlanner:

1. Passa alla commessa nuova.
2. Apri `json_admin.php?action=mappaturaInput`.
3. Controlla l'elenco delle colonne proposte.
4. Fai clic su «Esegui» e verifica il messaggio «Eseguita query!».
5. Riapri la stessa pagina: non deve restare nessun `ADD COLUMN`.

La prova del cookbook è del 9 ottobre 2026, su una commessa nuova (GOP-418): «12 colonne create, seconda chiamata vuota». Il primo giorno di lavoro degli operatori dipende da questo passo.

Anche l'ultimo passo ha un sintomo riconoscibile. Senza il centro della mappa, ogni nuovo utente ha `centromappa` vuoto nella tabella `impostazioni` e vede un avviso al primo accesso alla mappa.

Sul primo amministratore le fonti non sono allineate. Il cookbook e la procedura mostrano ancora un inserimento diretto in `goplanner.users` con `tipo=1`. La documentazione di progetto sulla creazione degli utenti indica invece come percorso canonico `InvitoUtente::crea()`, cioè l'invito dalla pagina Utenti, che richiede una sessione di super-admin, e dice perché: gli inserimenti diretti producono utenti senza identità, «invisibili all'RBAC». Cookbook e procedura, su questo passo, non sono ancora stati aggiornati. La procedura aggiunge due avvertenze valide in ogni caso: non creare un ruolo amministratore apposta per la commessa, perché il profilo amministratore è unico per tutte, e non concedere l'accesso a `json_admin.php`.

I limiti di questa procedura sono due. Il clone copia «la struttura e i dati» della sorgente, insieme a tutte le sue personalizzazioni: la scelta di una sorgente adatta e la pulizia sono parte della procedura. Il modulo di avvio ha quattro caselle per la pulizia (logiche PDF, mappature, configurazioni dell'app non necessarie, revisione completa della cartella), e la procedura avverte che le righe di `impostazioni` legate alla commessa sorgente restano orfane, senza causare errori. Il modulo offre anche una modalità «Tenant da template minimale», ma nessuno script la realizza: oggi esiste solo il clone. Il secondo limite è di permesso. `json_admin.php`, dove sta `mappaturaInput`, è solo per il personale GOPlanner (`users.tipo` uguale a 0, o super-admin globale). Un amministratore della commessa riceve 403 con `{"success":false,"message":"User not allowed"}`, e «Nessun permesso di ruolo la sblocca».

> **Quando chiedere allo staff tecnico:** per tutto ciò che sta in questa sezione, tranne le tre domande di «Che cosa prepara l'ufficio».

Il modulo di avvio chiude con una definizione di «fatto»: la commessa compare nel login, l'amministratore entra, le pagine `interventi` e `utenze` si aprono senza errori, gli endpoint critici rispondono, la cartella è versionata e documentata nel suo `README.md`. In pratica la prova decisiva è un'altra. Una commessa nuova è pronta quando un operatore sincronizza senza errori, non quando compare nel selettore.

## Quando una commessa si comporta diversamente

*Per tutti.*

Questa sezione raccoglie in un posto solo i sintomi delle sezioni precedenti. Serve quando una cosa funziona in una commessa e non in un'altra, e bisogna capire se è un difetto, una configurazione o solo un'altra commessa aperta. La tabella va letta dalla prima colonna: si cerca il sintomo, non la causa.

| Sintomo | Causa probabile | Dove si guarda | Chi interviene |
|---|---|---|---|
| Un'utenza c'è per un collega e non per te | Commessa diversa aperta; nella stessa commessa, lotti di competenza | Pulsante della commessa in alto a destra; capitolo 11 | Tu; poi l'amministratore |
| Una voce di menu c'è in una commessa e manca in un'altra | `$custom['menu']` della commessa, o permesso del profilo | `config.inc.php` della commessa; capitolo 11 | Staff tecnico |
| Un campo manca nell'app | Campi dell'app della commessa | `php/Intervento.php` della commessa | Staff tecnico |
| Una ricerca dà sempre zero risultati, senza errori | Voce di ricerca che filtra sulla colonna sbagliata | `php/flexifields.php`, voci `searchitems` | Staff tecnico |
| L'app non sincronizza, con «Unknown column» | Colonne di importazione mancanti in `carichi_righe` | `mappaturaInput` | Staff tecnico |
| Gea risponde in modo diverso nelle due commesse | Gea descrive solo la commessa aperta | Pulsante della commessa in alto a destra | Nessuno: è il comportamento previsto |
| Una funzione va in quasi tutte le commesse e in una dà errore | Struttura del database della commessa diversa da quella di riferimento | `make schema_check` | Staff tecnico |

Due righe della tabella, la quinta e l'ultima, possono avere lo stesso messaggio e cause diverse. Un errore 1054, «Unknown column», vuol dire che una query chiede una colonna che in quel database non c'è. Se la colonna è un campo del file del committente, in `carichi_righe`, è mancato il passo `mappaturaInput`. Se è una colonna del codice comune, la causa è la struttura del database della commessa. GOP-645, chiuso il 5 novembre 2026, conta 333 errori per la colonna `esito`, che mancava in 13 schemi di commessa; la correzione è stata nel codice, che ora tratta la colonna mancante come vuota, senza toccare lo schema. Un altro caso, «[1054] Unknown column 'interventi_eseguiti.data_prevista'», è stato risolto allo stesso modo, leggendo la colonna solo se esiste (GOP-688). Il documento sullo schema canonico descrive il fenomeno senza giri di parole: il codice comune dà per scontate colonne che in alcune commesse non ci sono, e quando non si protegge «fallisce a runtime».

Prima di aprire un ticket, chi lavora in ufficio può fare da sé quattro controlli:

1. Guarda il pulsante in alto a destra e verifica quale commessa è aperta.
2. Se Gea è attiva nella commessa, chiedile la configurazione: campi personalizzati, colonne delle viste, mappature.
3. Se hai accesso a un'altra commessa, passa a quella con «Cambia commessa» e ripeti la stessa operazione.
4. Apri il ticket scrivendo il nome della commessa in cui il problema si presenta (il ticket da Gea è nel capitolo 10).

Il terzo passo è il più utile. Se il comportamento è lo stesso in due commesse, la causa sta probabilmente nel codice comune; se cambia, sta nella commessa, oppure nei permessi che hai in quella commessa (capitolo 11). In entrambi i casi chi riceve il ticket parte da un indizio vero.

> **Per lo staff tecnico:** gli strumenti che l'ufficio non vede. La pagina Admin › Stato commesse (`admin.php?action=stato_commesse`) è riservata al super-admin globale e mostra per ogni commessa la salute, con i motivi (per esempio «Nessun invio dagli operatori da 3 giorni lavorativi»), e i numeri del mese, da una tabella centrale riempita da un job alle 06:30. `make schema_check` confronta in sola lettura lo schema di ogni commessa con quello di riferimento, su un MySQL usa e getta. `php scripts/migrate.php --tenant=<commessa>` fa per default un'anteprima; applica solo con `--apply`, e senza `--tenant` o `--all` si rifiuta di partire. La pagina Stato commesse è descritta nel capitolo 12; migrazioni e controllo dello schema nel capitolo 16.

La tabella ha un confine. Copre le differenze che dipendono dalla commessa. Un permesso mancante, un profilo sbagliato, una voce di menu negata a una persona e non a un'altra si diagnosticano nel capitolo 12; un'importazione che scarta righe, nel capitolo 4. E se Gea smette di rispondere con «Limite giornaliero raggiunto, riprova domani o contatta lo staff.», nemmeno quello è un difetto: il limite è separato per commessa, e nell'altra commessa Gea può rispondere ancora.

Resta una regola da usare ogni volta che qualcosa non torna. Si chiede, in quest'ordine, quale commessa è aperta, che cosa dice la sua cartella in `custom/` e che cosa, di quello che si vede, viene invece dal codice comune.

## Fonti

- codice: `config.inc.php`, `config-docker.inc.php`, `index.php`, `admin.php`, `json_admin.php`
- codice: `lib/GOPlanner.php`, `lib/ClassiCustom.php`, `lib/Queue.php`, `lib/MobileV3/TenantBootstrap.php`
- codice: `lib/SessioneTenant.php`, `lib/Cliente.php`, `lib/User.php`, `lib/LottoBase.php`, `lib/dict/lang_it.php`, `Smarty_templates/it/_header.html`, `js/code/tenant_dropdown.js`
- codice: `js/code/js.php`, `smarty.inc.php`, `lib/AssetUrl.php`
- codice: `lib/ADMINController.php`, `lib/CaricoRigaBase.php`, `lib/AdminRequestGuard.php`, `lib/InterventoBase.php`, `lib/ExportBase.php`
- codice: `db_clone.sh`, `Makefile`, `migrations/README.md`, `migrations/tenant/modules/`
- codice: `custom/default/`, `custom/abc/`, `custom/*/config.inc.php`, `custom/*/php/Intervento.php`, `custom/*/php/flexifields.php`
- codice: `.claude/skills/create-new-tenant/SKILL.md`
- codice: commit `1a3626414` (9 luglio 2026, voci di ricerca «PDR» in 44 `flexifields.php`) e `e49e45f36` (10 luglio 2026, controllo `searchitems` nella procedura)
- docs: `docs/01-foundations/03-database-facts.md`
- docs: `docs/01-foundations/04-configuration-priority.md`
- docs: `docs/01-foundations/10-catalogo-personalizzazioni-schema-tenant.md`
- docs: `docs/02-patterns/02-customization-pattern.md`
- docs: `docs/02-patterns/25-identita-centralizzata-e-rbac.md`
- docs: `docs/02-patterns/32-creazione-utenti-percorsi-e-metodo-canonico.md`
- docs: `docs/02-patterns/42-profili-generali-unica-definizione.md`
- docs: `docs/02-patterns/45-schema-canonico-tenant.md`
- docs: `docs/03-cookbooks/01-add-new-client.md`
- docs: `docs/03-cookbooks/12-tenant-bootstrap-modulo.md`
- wiki: `wiki/assistenza-clienti/configurazione-tenant.md`
- wiki: `wiki/assistenza-clienti/pagina-utenti-elenco.md`
- wiki: `wiki/assistenza-clienti/pagina-admin-giro-stato-commesse.md`
- wiki: `wiki/identita-rbac/creazione-utenti.md`
- Jira: GOP-107 — cambio di commessa con un solo controllo
- Jira: GOP-143 — Gea accesa per default
- Jira: GOP-266 — coda di esportazione e override di `export()`
- Jira: GOP-418 — `mappaturaInput` e colonne di `carichi_righe`
- Jira: GOP-624 — `custom.js` della commessa in sessione
- Jira: GOP-645 — colonna `esito` mancante in alcuni schemi
- Jira: GOP-687 — classi della commessa nei job del worker
- Jira: GOP-688 — lettura di `data_prevista` solo se esiste
- Jira: GOP-696 — schema canonico delle commesse
- Jira: GOP-697, GOP-702 — commesse escluse dallo schema di base (40 al 5 novembre 2026)
- Jira: GOP-767 — voce Magazzino con il magazzino v3
- Jira: GOP-855 — il Magazziniere vede solo il Magazzino
- Jira: GOP-726, GOP-836 — pagina Stato commesse

<!-- WORD COUNT: ~5650 -->
<!-- PERSONA CHECK: Pass — voce da Engineer + Scholar: nomi esatti di file, tabelle, righe di codice e ticket; messaggi dell'interfaccia riportati alla lettera; un caso per punto (PDR, GOP-687, GOP-418); limiti dichiarati in ogni sezione. Tolti «curiosamente», «quasi sempre» senza fonte e un rafforzativo («nessuno è un dettaglio»). -->
<!-- NUF CHECK: ✅ 1 tabella uguale/diverso + tabella dei file di custom/ con che cosa vede l'ufficio | ✅ 2 procedura «Cambia commessa» / «Cerca commessa...» + spiegazione utenza visibile e non (commessa, poi lotti) | ✅ 3 procedura in 4 passi e regola commessa > tipo > comune / commessa > comune | ✅ 4 i 15 passi in ordine con tipo_intervento e mappaturaInput spiegati | ✅ 5 quattro controlli dell'ufficio e riquadro «Quando chiedere allo staff tecnico» | ✅ 6 obiezione «ho corretto in lib/» con l'abitudine di cercare l'override (GOP-266) | ✅ 7 goplanner / goplanner_{clienti.db}, tabelle, MainOrm/SimpleOrm | ✅ 8 config.inc.php 436-441, lib/GOPlanner.php 143-158, ClassiCustom::carica(), GOP-687 | ✅ 9 campi db, nome, apikey, tipo, attivo senza valori; tipo = dbtype = cartella base | ✅ 10 casi PDR (9 luglio 2026, 44 file) e GOP-418 (9 ottobre 2026, 12 colonne) -->
<!-- ANTI-AI CHECK: nessuna frase vietata; chiusura riscritta senza domande in serie e senza annuncio del capitolo 3; «tenant» fuori dal codice tolto dalle sezioni per tutti (citazioni di Gea e della procedura parafrasate), resta nel titolo fissato dal PRD, nella corrispondenza dichiarata e nell'etichetta «Tenant da template minimale»; aggiunti i riquadri «Attenzione» e «Per gli sviluppatori» previsti dalla struttura, sottosezioni ### in «Chi vince» e «Come nasce» per il ritmo (max 5 paragrafi di prosa), controllo searchitems come passi numerati; aggiunta la sezione «Fonti» (Portolano senza risultati utili, quindi non citato). Tre contro-obiezioni. Nota: la struttura indicava un ordine di passi diverso (12 passi) e un override per commessa dei template Smarty; il testo segue la procedura e il codice del dossier (15 passi, nessun override dei template), senza cambiare la sostanza della bozza. -->
