# 15. Integrazioni e API

*In questo capitolo si vede chi parla con GOPlanner da fuori: il gestionale stesso, le due generazioni dell'app, il call center con il suo assistente vocale, gli agenti e le integrazioni sul motore unico delle operazioni, il servizio di Gea, e i servizi esterni che GOPlanner chiama a sua volta. Ogni porta risponde a tre domande prima di toccare un dato: chi chiama, su quale commessa, con quale contratto. Il capitolo è scritto per gli sviluppatori e per lo staff tecnico; chi lavora in ufficio può fermarsi dopo la tabella della prima sezione.*

## Le porte di GOPlanner: chi chiama, su quale commessa, con quale contratto

*Per lo staff tecnico e gli sviluppatori.*

Il 10 settembre 2026 l'API del call center proponeva, per una pratica, slot da 120 minuti su due finestre, 08:30-12:30 e 14:30-18:30. Nessuna configurazione della commessa produceva quegli orari: il lotto della pratica era configurato a slot da 20 minuti. La causa stava in una riga. Il file `api_cc.php` passava alla commessa giusta ripuntando soltanto la connessione master, mentre le letture andavano sulla connessione slave, rimasta sullo schema centrale `goplanner`; una `SELECT` su `impostazioni` senza il nome del database leggeva così la riga dello schema centrale, e la restituiva senza alcun errore (GOP-274). Lo stesso giorno, cercando la stessa causa in altri punti, è emerso un caso peggiore: `OperatoreLocale::getAll()` restituiva gli operatori di tutte le commesse, 2404 operatori attivi nello schema centrale contro i 50 della commessa interessata, e la prenotazione poteva scrivere nella commessa un operatore di un'altra (GOP-276). Entrambi sono corretti nel codice dal 10 settembre 2026, entrambi con un test di regressione. La domanda «su quale commessa?» la risolve la porta. Se la porta la risolve a metà, più a valle nessuno se ne accorge.

La commessa, che nel codice si chiama tenant, è il confine che conta più di ogni altro. Per questo il capitolo legge ogni porta con le stesse tre domande, sempre nello stesso ordine. La prima è chi chiama: una sessione del gestionale, la firma di un telefono abbinato, un `sim_id`, un token Bearer, un gettone OAuth legato all'identità («gettone» è il nome che il codice del motore dà al token), il token breve del servizio di Gea. La seconda è su quale commessa: dalla sessione, dall'abbinamento del telefono, dal `sim_id`, dal token o da un `customer_id`, da un parametro `commessa` controllato a ogni chiamata, dai claim verificati di un token. La terza è con quale contratto: HTML e JSON del gestionale, la busta `contract 3.0` dell'app GOPlanner 3, il JSON del call center, il formato TOON (o JSON) del motore unico.

### La mappa

La tabella è quella del ramo `php8` al 25 novembre 2026, ricostruita dalle regole di riscrittura e dai file d'ingresso.

| Chi chiama | Porta | Credenziale | Da dove viene la commessa | Contratto | Capitolo |
|---|---|---|---|---|---|
| Gestionale nel browser | `index.php`, `json.php?action=` | sessione | commessa scelta nella sessione | HTML e JSON | 13 |
| App GOPlanner 3 | `/v3/` → `mobile_v3.php` | firma `GOP-Sig-1` del telefono abbinato | abbinamento del telefono | busta `contract 3.0` | 8, 15 |
| App GOPlanner 1.x | `json_android.php` → `AndroidController` | `sim_id` | riga di `operatori` del database principale | JSON legacy senza busta | 8, 15 |
| Timbratori | `json_timbratori.php` | `sim_id` | il `sim_id` | JSON legacy | 15 |
| API legacy | `/api/get` → `api.php` | parametro `key` confrontato con `clienti.apikey` | la chiave | non documentato | 15 |
| Call center e assistente vocale | `/api/cc/v1/` → `api_cc.php`, `CallCenterController` | token Bearer | `customer_id`, token o numero chiamato | JSON del call center | 5, 15 |
| Agenti e integrazioni | `/api/v2/` (`api_v2.php`), `/mcp` (`mcp.php`) | gettone OAuth legato all'identità | parametro `commessa`, controllato a ogni chiamata | TOON o JSON | 15 |
| Servizio di Gea | `json.php?action=chatbot_*` | token di 15 minuti più intestazione di servizio | solo i claim verificati del token | JSON | 10, 15 |
| Staff GOPlanner | `json_admin.php`; Admin › «Console JSON», che chiama `json_android.php` | sessione del personale GOPlanner (`users.tipo = 0` o super-admin globale); la pagina Admin chiede `users.admin = 1` | nella Console, il `sim_id` dell'operatore scelto | JSON; nella Console, quello dell'app 1.x | 12, 15 |
| Moduli pubblici | `/telelettura/{chiave}`, `/autolettura/{chiave}` → `telelettura.php` | chiave nella tabella principale `form` | la chiave | modulo pubblico | 15 |

I timbratori sono i dispositivi registrati nella tabella `timbratori` che inviano le timbrature. Il modulo di `telelettura.php`, secondo i README delle 22 commesse che ne hanno uno, è un modulo pubblico di autolettura del contatore. Il flusso interno delle richieste del gestionale è nel capitolo 13.

Le porte in uscita vanno nel verso opposto: lì il chiamante è GOPlanner. Chiama il gateway AI per le foto e per Gea, un server AI locale per gli indirizzi, Nominatim e Google per la geocodifica, OSRM per le distanze, FCM per i comandi remoti e, dal servizio di Gea, il Portolano e i log cloud. Le ultime due sezioni del capitolo entrano nel dettaglio.

### Perché `/api/` ha regole sue

Un dettaglio delle regole di riscrittura spiega perché una porta sta dove sta. Nella radice ci sono tre regole:

```apache
RewriteRule ^v3/(.*)$ mobile_v3.php?route=$1 [QSA,L]
RewriteRule ^mcp/?$ mcp.php [QSA,L]
RewriteRule ^oauth/(authorize|token|register|revoke)$ mcp_oauth.php [QSA,L]
```

La cartella `api/`, invece, ha un `RewriteEngine` proprio, e le regole della radice non la raggiungono. Il commento nel file lo dice con le sue parole: «L'API REST v2 e' in api/.htaccess: quella cartella ha un RewriteEngine proprio e le regole di qui non vi arrivano». Le regole efficaci per `/api/…` sono quindi tre, in `api/.htaccess`: `^v2/` verso `/api_v2.php`, `^cc/v1/(.*)$` verso `/api_cc.php/v1/$1`, `^get$` verso `/api.php`. Le regole della radice `^api/(.*)` e `^api/cc/v1/` restano scritte ma, per gli URL che iniziano con `/api/`, non vengono raggiunte.

Ma `/api/v2/` è la versione 2 dell'API del call center? No. È la porta REST del motore unico delle operazioni (GOP-629); il call center è `/api/cc/v1/`. Le due porte hanno in comune soltanto il prefisso `/api/`. Anche il piano del libro le nomina insieme, «API v2 e Call Center»: il capitolo segue il codice, che le tiene separate in tutto, credenziali comprese.

La mappa ha un limite preciso. È la fotografia del ramo `php8` al 25 novembre 2026, e una porta presente nel codice può essere chiusa in un ambiente: il motore unico risponde 503 (servizio non disponibile) se manca la sua configurazione. Alcune porte legacy hanno poca documentazione o nessuna. Di `api.php` non risulta chi la chiami oggi, e GOP-279 chiede proprio di valutare se `api.php` e `json_timbratori.php` servano ancora; il codice, dal 12 settembre 2026, valida la credenziale di entrambe una sola volta, prima di qualunque dispatch, anche se il ticket in Jira risulta ancora da completare. Per queste porte il capitolo dice con che cosa autenticano e si ferma lì.

La regola: quando un chiamante si comporta male, si parte dalla sua riga della tabella. La colonna «Porta» dice quale file aprire per primo; la colonna «Da dove viene la commessa» dice dove guardare se i dati sono di un'altra commessa.

## L'API dell'app: la busta di GOPlanner 3 e la sincronizzazione di GOPlanner 1.x

*Per gli sviluppatori.*

Il capitolo 8 ha raccontato che cosa vede l'operatore: la coda, il pulsante «Riprova», l'abbinamento. Qui c'è il lato del server dello stesso scambio. Le due app parlano due lingue diverse, e la differenza si vede soprattutto quando una conferma va persa.

### La busta e l'ordine dei controlli

Ogni risposta di `/v3/` ha la stessa forma. Un successo e un errore si scrivono così:

```json
{"contract":"3.0","request_id":"…","data":{…},"meta":{…}}
{"contract":"3.0","request_id":"…","error":{"code","message","retryable","details"}}
```

`data` è sempre un oggetto. Una collezione si scrive `{"items": [...]}`, e una collezione vuota è `{"items": []}` con 200. Il messaggio d'errore non porta mai testo di PHP o di MySQL; la classe `ApiError` lo dice così: «Il messaggio e' scritto da noi, mai preso da un'eccezione PHP o MySQL. I dettagli tecnici di un 500 restano nel log del server, sotto lo stesso request_id.» Il campo `retryable` decide se l'app ritenta da sola. Dei 23 codici di `ApiError::CODES` sono ritentabili solo cinque: `request_in_progress` (409), `rate_limited` (429), `internal_error` (500), `unavailable` e `maintenance` (503). Due codici stanno fuori dall'elenco, che è in un file congelato, e nascono da sottoclassi locali di `ApiError`: `dependency_pending` (409, ritentabile) e `unsupported_media_type` (415). Quando c'è, `Retry-After` è sempre un numero intero di secondi, mai una data.

L'ordine dei controlli, nel codice di `Kernel::handle` e di `Request::fromGlobals`, è fisso:

| Passo | Che cosa si controlla | Risposta se fallisce |
|---|---|---|
| 1 | `X-Request-Id`: vale solo se rispetta `^[A-Za-z0-9_-]{8,64}$` | nessun rifiuto: il server ne genera uno di 26 caratteri esadecimali |
| 2 | dimensione del corpo | 413 `payload_too_large`, già con il suo `request_id` |
| 3 | `X-GOP-Client` | 400 `missing_client_header`; 426 `client_too_old` se il contratto non è il 3 o il `versionCode` è sotto il minimo |
| 4 | rotte pubbliche `/v3/pairing` e `/v3/app/update` | servite qui, senza autenticazione |
| 5 | firma | 401 `unauthenticated` o `invalid_key`; 403 `device_pending` o `device_revoked` |
| 6 | rotta | 404 `not_found`; 405 `method_not_allowed` con l'intestazione `Allow` |
| 7 | bootstrap della commessa | 403 `tenant_disabled` |
| 8 | `Idempotency-Key`, solo sulle scritture | 400 `missing_idempotency_key` |
| 9 | controller | risposta della risorsa |

Il valore di `X-Request-Id` ricevuto dal client, se non valido, non viene mai riflesso. `X-GOP-Client` ha il formato che l'app manda, `eu.smartforge.goplanner/<versionName> (<versionCode>) contract=<major>.<minor>`. Una conseguenza pratica dell'ordine: `X-GOP-Client` si controlla prima dell'autenticazione, quindi un telefono troppo vecchio riceve 426 anche senza una chiave valida. L'eccezione è `/v3/app/update`, che deve restare raggiungibile perché il telefono scarichi l'aggiornamento obbligatorio.

La firma il capitolo 8 l'ha già descritta dal lato del telefono. Sul server contano l'intestazione `Authorization: GOP-Sig-1 device=…,ts=…,nonce=…,sig=…` e il fatto che l'autenticatore riceve l'intera richiesta: metodo, percorso, query, intestazioni e SHA-256 del corpo. Su `/v3/` il `sim_id` non si legge mai. Esiste una chiave di sviluppo, attiva solo se `MOBILE_V3_DEV_AUTH` vale esattamente `1`; in produzione la variabile non è impostata, e un `Bearer` riceve 401.

Le rotte seguono una regola corta: «aggiungere una risorsa = aggiungere un file». Ogni classe `lib/MobileV3/Resource/<Nome>Controller.php` dichiara le proprie rotte con `routes()`, e il percorso non sceglie mai una classe. Su `php8` le rotte sono 45 in 25 controller, 42 autenticate e 3 pubbliche: interventi, utenze, telefono, segnalazioni, e 16 del magazzino. Quelle del magazzino (`scorte`, `collocazioni`, `articoli/{matricola}`, `movimenti`, `ddt`, `inventario`, `gestione`, `qr/risolvi`, tutte sotto `/v3/magazzino/`) sono descritte in `docs/mobile-v3/magazzino.md` e, per il magazziniere, in `docs/mobile-v3/magazziniere.md`; che cosa ci fanno l'operatore e il magazziniere è nel capitolo 9.

### Idempotenza: lo stesso invio non scrive due volte

Su POST, PUT, PATCH e DELETE l'app manda una `Idempotency-Key`. Il registro è la tabella `mobile_v3_richieste`, nel database della commessa, con chiave `(device_id, idem_key)`. Il server la legge così:

- stessa chiave, stessa rotta, stesso corpo (confrontato con SHA-256): rimanda la risposta salvata con `Idempotent-Replay: true`;
- stessa chiave con un corpo diverso: 409 `idempotency_conflict`, che è un difetto del client, non un tentativo da ripetere;
- richiesta ancora in corso: 409 `request_in_progress` con `Retry-After: 2`; una riga «in corso» più vecchia di 120 secondi viene ripresa da chi arriva dopo.

Che cosa si salva lo decide `Response::isStorable`: i 2xx e i 4xx definitivi. Restano fuori i 5xx, i 429, i 4xx ritentabili come `dependency_pending` e due rifiuti che pure non sono ritentabili, `intervento_locked` e `already_closed` (`ApiError::STATE_DEPENDENT`): dipendono dallo stato del momento, e se l'ufficio cambia l'intervento lo stesso «Riprova» deve essere giudicato di nuovo. Una risposta che non si salva libera la chiave. `not_found`, invece, si salva. Dopo una riassegnazione, la stessa chiave con lo stesso corpo rimanda il 404 salvato, come il capitolo 8 ha già detto.

Poche scritture sono ripetibili per natura e non usano la chiave: l'heartbeat (che risponde 204), la conferma dei comandi, i permessi del dispositivo, la risoluzione dei QR del magazzino e le azioni sulle segnalazioni della commessa. I limiti di dimensione sono 1 MiB per un corpo JSON e 21 MiB per un multipart, cioè una foto da 20 MB più 1 MiB di margine.

Un esito può citare foto e firma che devono già essere arrivate (GOP-449). Se ne manca una, il server risponde 409 `dependency_pending` con `Retry-After: 5` e l'elenco `missing_keys`, non scrive nulla e non registra la chiave della chiusura. L'app manda le foto, ritenta, e la chiusura avviene una volta sola, mai a metà.

### GOPlanner 1.x: la sincronizzazione in ingresso

Il canale vecchio funziona in un altro modo. `json_android.php?action=put_intervento` passa ad `AndroidController::put_intervento`, con il lotto di esiti come stringa JSON in `$_REQUEST['json']`. Le colonne fisse passano da `setFromAndroid()`; i campi personalizzati finiscono grezzi nella colonna `servizi` (capitolo 14). Il lotto si valida tutto prima di scrivere: un campo intero non numerico lo rifiuta intero (GOP-242). La scrittura, invece, non arriva in fondo: tutti e due i rami dell'esito fanno `return` dentro il `foreach`, quindi, a leggere il codice, di un lotto si scrive la prima riga e la risposta riguarda solo quella. Se l'ufficio ha portato l'intervento a Controllato (6) o oltre, il pattern 16 promette che i dati dell'app vengano «ignorati silenziosamente» e chiama la regola «Stato Master Override». Il codice protegge meno: la riga dell'esito non si sovrascrive, ma lo stato dell'utenza si aggiorna lo stesso, sul percorso generico parte anche un aggiornamento di `interventi`, e il telefono riceve `success: true`. Le foto arrivano con `upload_foto`, deduplicate per MD5: un duplicato risponde con la dimensione del file già archiviato, e il telefono cancella la sua copia. Alcune commesse storiche passano da un ramo con `REPLACE INTO` diretto.

> **Attenzione:** la pagina Admin › «Console JSON» manda una chiamata dell'app 1.x a `json_android.php` come se fosse l'operatore scelto. La pagina stessa avverte: «Attenzione: le chiamate vengono eseguite davvero sul database del cliente. I metodi che scrivono (inserimenti, timbrature, chiusure) modificano i dati.» La pagina Admin si apre solo con `users.admin = 1`; per la diagnosi si usano i metodi di lettura, oppure una commessa di prova.

E se il telefono rimanda lo stesso esito, il server lo scrive due volte? Con GOPlanner 3 no. Stessa chiave significa risposta salvata; e se la chiave è andata persa dopo un commit riuscito, un esito identico a quello già scritto viene riconosciuto e risponde `already_applied`, senza scrivere. Con 1.x non c'è un registro: un nuovo tentativo dopo una conferma persa può duplicare, come il capitolo 8 ha già detto. L'unica deduplicazione del canale vecchio riguarda le foto.

Restano alcuni limiti. Il contratto di `/v3/`, scritto nell'ottobre 2026, impone la sintassi di PHP 7.3 a tutto `lib/MobileV3` (niente proprietà tipizzate, `match`, enum), e un test lo verifica; al 25 novembre 2026 la produzione è mista, con commesse spostate una alla volta sull'immagine `php8`, e il capitolo 16 segue il rilascio. I file del nucleo congelati con S00, come `mobile_v3.php` e le classi del kernel, si cambiano solo con un ticket dedicato. Il registro richiede la migrazione tenant `0007`, applicata commessa per commessa. Dove manca, ogni scrittura risponde 500 `internal_error` e non viene eseguita. Non è un caso di scuola: a novembre 2026 due commesse in passaggio a GOPlanner 3 ne erano prive, e la nota di rilascio annota che senza quella tabella «le chiusure e le foto dell'app 3 vanno in errore» (GOP-806, GOP-809). La pulizia dopo 30 giorni è scritta nel contratto ma, su `php8`, non è ancora schedulata: `IdempotencyStore::purge()` non ha chiamanti. Il canale 1.x, infine, non ha né busta né idempotenza, e il lavoro su `/v3/` non lo tocca.

## Il call center e l'assistente vocale: l'API /api/cc/v1

*Per gli sviluppatori e lo staff tecnico.*

Questa è la porta del caso di apertura. La usano le commesse che lavorano con il call center: l'assistente vocale «Sara», in ingresso quando un'utenza chiama e in uscita per le campagne. La pagina Interventi › Centralino (GOP-710) riusa le stesse letture e la stessa prenotazione per una persona al telefono, dentro la sessione del gestionale: `CentralinoController` estende `CallCenterController` e non riseleziona il database, perché la sessione lo ha già fatto. La pagina per l'ufficio è nel capitolo 5.

Le credenziali sono due. Il token master viene solo dall'ambiente del server, `CALL_CENTER_API_TOKEN`, e non ha un valore predefinito: se la variabile manca o è vuota, l'accesso master è spento, nessun token lo soddisfa e il server scrive nel log un errore che non contiene il valore. Con il token master serve un `customer_id` esplicito. Il token della commessa in `clienti.apikey` sceglie la commessa da solo. Una chiave scritta solo nella configurazione della commessa (`$custom['call_center_api_key']`) vale invece soltanto insieme a un `customer_id`, e si confronta dopo aver letto quella configurazione. Solo dopo l'autenticazione `api_cc.php` apre la connessione al database della commessa e chiama `setTenantContext()`. Le risposte portano `Cache-Control: no-store` (GOP-624).

### Le parole dell'API e quelle del glossario

L'API parla inglese, e i suoi nomi si scontrano con il glossario:

| Nome nell'API | Parola del glossario | Rotte |
|---|---|---|
| `customer` | commessa | `GET /customer/lookup`, con il numero chiamato in `clienti.callcenter_id` |
| `users` | utenze, non utenti | `/users/lookup`, `/users/address`, `/users/search`, `/users/streets` |
| `technicians` | operatori | `/technicians/verify` |
| `campaigns` | liste | `GET /campaigns` |
| `leads` | pratiche di una lista | `/campaigns/{id}/leads`, `/leads/{id}/feedback`, `/leads/{id}/appointments` |
| `appointments` | interventi prenotati | `POST /appointments/book`, `PUT` e `DELETE /appointments/{id}` |
| `slots` | posti liberi calcolati | `POST /slots/available` |

I metodi sono imposti rotta per rotta: un metodo sbagliato riceve 405 `METHOD_NOT_ALLOWED` con `Allow`. Il dispatch segue la convenzione `v1_{resource}_{action}`.

Ogni chiamata di prenotazione scrive uno stato preciso. `book` con un operatore porta l'intervento ad Assegnato (3); senza operatore lo porta a Prenotato (10) sotto l'operatore `0`, ed è questo che riempie «Appuntamenti in attesa di assegnazione» nella pagina «Da assegnare» (capitolo 5), dove l'ufficio assegna. `PUT` cambia data, ora e note: l'intervento va ad Assegnato (3) solo se ha davvero un operatore, altrimenti resta Prenotato (10) (GOP-318); su un intervento annullato risponde 409. `DELETE` porta ad Annullato (9), libera il posto e scrive l'annullamento nelle note. Perché 9 e non Ripianificabile (8)? Nel resto di GOPlanner 8 significa che l'operatore non ha potuto completare la visita, un fatto diverso; 9 è lo stato che ogni altro canale esclude già con `stato_id<>9`. Una pratica si riprenota dopo l'uno come dopo l'altro.

Due casi minori completano il quadro. Se Sara identifica l'utenza solo dal nominativo, la prenotazione è consentita ma l'intervento porta in testa alle note `[CC: identificato_per_nominativo, verificare utenza]`, e a calendario il titolo inizia con «[VERIFICARE UTENZA]», perché l'ufficio verifichi l'utenza in assegnazione. Un esito `do_not_call` segna l'utenza con `utenti.non_chiamare` e l'origine «Sara, chiamata del …»; il segno vale per la persona, in tutte le campagne. Una commessa può anche limitare le prenotazioni ad alcune unità territoriali con `$custom['call_center_ut_ammessi']` (GOP-325): la UT si legge dalla riga più recente della pratica, e una UT non ammessa riceve 403 `ut_non_prenotabile`.

### L'invariante dello schema

La regola è scritta in `docs/cc/architettura-api-cc.md`. `setTenantContext()` chiama solo `SimpleOrm::useConnection()`, che ripunta la connessione master; la slave resta sullo schema centrale `goplanner`, e `SimpleOrm::sql()` manda le letture sulla slave. Ne segue l'invariante: ogni lettura raggiungibile da `CallCenterController` va qualificata con lo schema della commessa, attraverso `SimpleOrm::getDatabaseName()` oppure con `:database.:table`. Senza, una `SELECT` «legge dallo schema centrale invece che da quello del tenant, senza errore e con un risultato plausibile ma sbagliato, o con i dati di tutti i tenant». Una lettura qualificata nel controller ha questa forma:

```php
$db = Intervento::getDatabaseName();
// … FROM $db.interventi i LEFT JOIN $db.utenti u ON u.id = i.id_utenza
```

I due casi della prima sezione sono la prova. Per GOP-274 la correzione è stata di una riga: `FROM impostazioni` è diventato `FROM $db.impostazioni`. Per GOP-276 `SELECT * FROM operatori WHERE attivo=1 AND nascosto=0` è diventato `SELECT * FROM :database.:table WHERE attivo=1 AND nascosto=0`. I test di regressione simulano entrambi gli schemi: `tests/CallCenterController_SlotsConfig_Test.php` fissa la catena pratica, lotto, configurazione; `tests/OperatoreLocale_getAll_TenantSchema_Test.php` esegue il vero `SimpleOrm` con due connessioni finte, master sulla commessa e slave su `goplanner`. Il rischio è circoscritto a questa porta: la sessione web e `json_android.php` ripuntano entrambe le connessioni, e le porte nuove risolvono la commessa una volta sola.

### La prenotazione sotto chiave

`/slots/available` non riserva nulla. Calcola gli slot e ordina gli operatori per vicinanza al centroide dei loro interventi già pianificati nel periodo, con un punteggio `round(1 / (1 + distKm/10), 2)`. La conferma è solo `book`, che è una sezione critica:

1. prende `GET_LOCK` per la pratica, poi per l'operatore e il giorno, poi per la zona e il giorno se la pratica è in una zona outbound confermata, sempre in quest'ordine;
2. aspetta al massimo 5 secondi: oltre, risponde 503 `BOOKING_BUSY`;
3. dentro il lock legge sul master (`SimpleOrm::sqlMaster()`), perché il controllo e la scrittura devono stare sulla stessa connessione;
4. verifica che l'operatore sia libero a quell'ora (stati 3, 4 e 10), il tetto `max_app_giorno` e i posti della giornata di zona;
5. in caso di conflitto risponde 409 `SLOT_TAKEN` con un massimo di 3 `alternatives`, e non scrive nulla.

La stessa pratica sullo stesso slot riceve 200 con lo stesso id, come un tentativo di rete ripetuto. Il nome del lock include il database della commessa, così due commesse sullo stesso server non si bloccano a vicenda.

Se due chiamate prenotano lo stesso posto nello stesso istante? La seconda aspetta il lock; quando lo ottiene trova lo slot occupato e riceve 409 `SLOT_TAKEN` con le alternative, senza scrivere. Lo script `scripts/test-book-concorrenza.php` lo prova su un MySQL usa e getta con due processi PHP che chiamano nello stesso momento. La copertura ha però due buchi dichiarati: lo spostamento con `PUT` fuori dai lotti a fasce non prende lock, e su `interventi` non c'è un vincolo UNIQUE. Nei lotti a fasce, invece, anche `PUT` passa da `prenotaFascia()`, con i suoi lock.

Il limite di questa porta è doppio. Vale solo per le commesse che usano il call center, e lo stato del collaudo, dopo il 25 settembre 2026, non è documentato. E la protezione costa: senza l'indice `idx_op_dp` della migrazione tenant `0015`, le verifiche sotto lock diventano scansioni complete di `interventi`, e sotto carico le chiamate si accodano fino a `BOOKING_BUSY`. La migrazione è scritta come «preparata, non applicata», e non c'è prova di dove sia stata eseguita.

La regola, per chi scrive codice raggiungibile da `CallCenterController`: ogni lettura porta lo schema, e ogni nuova lettura arriva con un test che simula i due schemi.

## Il motore unico delle operazioni: una logica, tre porte (console, API REST, MCP)

*Per gli sviluppatori.*

Il 30 ottobre 2026 è stato deciso questo: «Ogni operazione della console deve potersi fare anche da un'API REST e da un server MCP, per far lavorare agenti e integrazioni con gli stessi permessi e le stesse regole della console» (GOP-628). Il motore che ne è nato è `OperazioniController`, estratto dal codice esistente, non riscritto. Ogni metodo riceve chi agisce, un `ContestoOperazione` con identità, commessa, tipo, permessi e lotti, insieme ai parametri, e restituisce dati strutturati. Dentro non ci sono `$_POST`, `$_SESSION` né JSON, e le query usano solo statement preparati. La console raggiunge il motore attraverso adattatori costruiti con `perConsole()`; REST e MCP lo raggiungono attraverso `esegui()`, che dall'adattatore della console non è raggiungibile. La porta MCP chiama il motore direttamente, non l'API REST via HTTP. Che la console non sia cambiata lo prova `tests/e2e-mcp/console.php`, che confronta le risposte delle griglie con quelle del codice di partenza.

A ogni chiamata `esegui()` fa le stesse cose, nell'ordine: controlla, per le operazioni riservate, il vincolo `solo_team`; valida i parametri contro lo schema, dove un parametro fuori schema è un errore; controlla il permesso o il tipo minimo; verifica, come ultima difesa, che la connessione sia davvero sul database della commessa; applica campi e cursore; scrive il registro.

Il perimetro si decide a ogni chiamata, perché la porta è senza stato. `commessa` è un parametro, con il codice di `clienti.db`; se manca si usa la commessa predefinita dell'identità, sempre riportata nella risposta. Una commessa inesistente, fuori perimetro o disattivata riceve lo stesso errore, `commessa_non_accessibile`, così la porta non rivela quali commesse esistono. Il confine di riservatezza è l'azienda, `clienti.codice_org`. Per i permessi, con `rbac_enforce` acceso decide il permesso (`interventi.vedere`, `utenze.vedere`); con `rbac_enforce` spento, ed è spento in tutte le organizzazioni al 25 novembre 2026, decide `users.tipo` contro il tipo minimo dell'operazione. `carichi`, `pratiche` e `interventi` partono dal tipo 2, quindi i profili Consultazione e Tecnico non le usano. Il documento di decisione lo dice così: «si parte stretti, allargare è una riga del catalogo». Il significato di identità, profili e permessi è nel capitolo 11.

### I numeri del motore

I numeri sono pochi, e tutti nel codice:

| Che cosa | Valore | Dove |
|---|---|---|
| Codice OAuth (PKCE `S256`, uso singolo) | 60 secondi | `McpOAuth` |
| Gettone di accesso | 1 ora | `McpOAuth` |
| Gettone di rinnovo (ruota a ogni uso) | 30 giorni | `McpOAuth` |
| Righe di un elenco | 20 di default, `limite` massimo 200, `cursore` per la pagina successiva | `OperazioniController` |
| Frequenza per identità | 120 chiamate al minuto, poi 429 `troppe_richieste` con `Retry-After` | `OperazioniPorta` |
| Codice di conferma di una scrittura | 5 minuti, uso singolo | `OperazioniConferma` |
| Modifica in blocco | oltre 50 record serve `conferma_blocco=true` | `OperazioniController` |
| Conservazione del registro | 12 mesi, poi cancellazione da `cron_worker.php` | `OperazioniRegistro` |

GOPlanner fa da server di autorizzazione (`mcp_oauth.php`, `McpOAuth`) e delega il login all'accesso Google già esistente; il clic sul pulsante è il consenso, mai un accesso automatico. Il gettone è legato all'identità, e `clienti.apikey` non viene mai letta da queste porte. Di codici e gettoni si salva solo l'hash SHA-256 (migrazione main `0021_mcp_oauth.sql`). Un codice o un gettone di rinnovo riusato revoca l'intera famiglia, perché, dice il codice, «un gettone gia' usato che ritorna vuol dire che qualcuno ne ha una copia». Gli indirizzi di ritorno sono di loopback, o https solo se l'host è in `MCP_OAUTH_REDIRECT_HOSTS`. L'identità si ricontrolla a ogni chiamata: disattivarla toglie l'accesso dalla chiamata successiva. Lo stesso gettone vale su `/mcp` e su `/api/v2/`.

Il trasporto MCP è HTTP senza stato: JSON-RPC su POST, un messaggio per richiesta, nessun flusso SSE; un `Origin` diverso dall'indirizzo pubblico riceve 403. Le risposte sono in TOON (sul REST, JSON con `Accept: application/json`). I campi sono i minimi di default, `campi` li sceglie, `*` li dà tutti; un campo fuori catalogo è un errore, quindi una colonna nuova non esce da sola. Un errore è una riga sola, con un codice stabile e un suggerimento, per esempio: `ERRORE commessa_non_accessibile: La commessa x non è accessibile. Suggerimento: Usa l’operazione commesse per vedere quelle a cui hai accesso.`

### Aggiungere un'operazione di lettura

Il documento di decisione (pattern 42, § Conseguenze) dà i primi due passi; gli altri due vengono dalla sua sezione delle prove.

1. Scrivere il metodo in `OperazioniController`, con contesto e parametri in ingresso, dati strutturati in uscita e solo statement preparati. Una lettura può anche stare in un'altra classe, come callable con la stessa firma.
2. Aggiungere la voce in `OperazioniCatalogo`: nome, descrizione, schema, effetto `lettura`, tipo minimo, permesso, campi minimi e catalogo dei campi, più `griglia` se deve portare le colonne della griglia della commessa.
3. Scrivere il test accanto a `tests/OperazioniController_Test.php`.
4. Se l'operazione rispecchia una griglia della console, aggiungerla al confronto end-to-end `tests/e2e-mcp/run.sh`, che gira solo in locale con un MySQL usa e getta.

`tools/list` si costruisce dal catalogo: non c'è altro da registrare, e i controlli di `esegui()` valgono da subito.

### Le scritture: anteprima, codice, rilettura

Una scrittura estende `OperazioneScrittura` e chiama la stessa funzione del back office; è lo stesso modello delle proposte di Gea (capitolo 10). Senza `codice_conferma` il motore fa un'anteprima: mostra prima e dopo dei soli campi che cambiano, e non scrive nulla. Il codice è firmato con HMAC da `OperazioniConferma` e lega operazione, commessa, identità, impronta dei parametri e impronta del record; scade in 5 minuti. Non è salvato da nessuna parte: si verifica la firma, e l'uso singolo lo garantisce una colonna unica del registro. All'esecuzione il record viene riletto. Se è cambiato, la risposta è `record_cambiato`, «Il record è cambiato dopo l’anteprima: non ho modificato nulla.», e serve una nuova anteprima. Lo stesso codice usato due volte riceve `codice_gia_usato`.

Sul ramo `php8` il catalogo conta 46 operazioni, 15 letture e 31 modifiche, in quattro famiglie di scritture:

- **Documenti** (GOP-716): modificano modelli e temi; `documenti_attiva` è l'unica che cambia che cosa l'app e il server stampano.
- **Triage dei ticket** (GOP-757): riservato al team; passa `solo_team` soltanto il super-admin globale, e l'approvazione delle bozze resta nel back office.
- **Comandi remoti all'app GOPlanner 3** (GOP-784): solo sulle commesse abilitate, con un tetto di 10 comandi per telefono ogni 600 secondi. Su ogni commessa abilitata che non è di prova, il codice di conferma non invia nulla ma mette la richiesta in attesa, e la approva un amministratore della commessa dalla pagina «Telefoni GOPlanner 3» del back office (GOP-787).
- **Dati di prova** (GOP-705): si creano e si cancellano solo sulle commesse di prova; le righe create sono elencate nella tabella `dati_prova`, e `elimina_dati_di_prova` cancella solo quelle.

`elimina_dati_di_prova` è l'unica cancellazione del catalogo, che dichiara soltanto gli effetti `lettura` e `modifica`: modelli e temi, per esempio, non si eliminano dall'MCP ma dalla pagina.

> **Attenzione:** il documento di decisione lo scrive in grassetto: «dev usa il database di produzione: ogni scrittura MCP sarà una scrittura in produzione.» Le protezioni stanno nel motore, non nell'ambiente: l'anteprima non scrive; il codice firmato vale 5 minuti, una volta, ed è legato a identità e record; il record si rilegge prima di scrivere; ogni chiamata entra nel registro; i dati di prova vengono rifiutati fuori dalle commesse di prova; i comandi remoti partono solo sulle commesse abilitate e, fuori dalla prova, dopo l'approvazione dal back office.

Un agente collegato all'MCP può fare più dell'utente che l'ha collegato? No. Il gettone è dell'identità: stesso perimetro, stessi permessi o tipo minimo, stessi lotti della console. Le scritture richiedono anteprima e codice. Ogni chiamata, letture e rifiuti compresi, finisce nel registro con identità, origine (`MCP` o `REST`), client ed esito. Restano fuori dal registro solo le richieste che non arrivano al motore: un gettone non valido, un limite di frequenza superato, un'operazione inesistente, un metodo HTTP sbagliato, una richiesta malformata.

Il motore ha i suoi limiti. Senza `MCP_HMAC_KEY` e `APP_BASE_URL` la porta è chiusa: l'MCP risponde 503 «Il server MCP non è configurato.» e il REST «L’API non è configurata su questo server.», e il resto del sistema non ne risente. Se il registro non si può scrivere, l'operazione non restituisce dati e non modifica nulla. L'apertura in produzione è un rilascio separato che il documento di decisione dichiara «non coperta qui», e nessuna fonte prova che sia avvenuta: il capitolo dice «dove la porta è aperta», e la configurazione è nel capitolo 16. Restano quattro limiti noti:

- `carichi` della console non filtra per lotto, l'operazione del motore sì;
- sulle commesse dove un join della griglia moltiplica le righe di un intervento, un cursore che cade fra due righe dello stesso intervento salta la seconda;
- `tools/list` non conosce la commessa e mostra solo i campi base;
- i cataloghi sono ancora due, `OperazioniCatalogo` per MCP e REST e `ChatbotRegistro` per Gea, con l'epic GOP-628 ancora aperta.

> **Quando chiedere allo staff tecnico:** applicare una migrazione (main `0021`, `0022`, `0029`, `0031`; tenant `0007`, `0015`, `0028`, `0031`, `0043`): il database principale non ha un esecutore e i file si applicano a mano, solo per decisione dello staff tecnico. Aprire la porta del motore in un ambiente, con chiave e indirizzo pubblico. Abilitare i comandi remoti su una commessa di produzione o allargare l'elenco delle commesse di prova. Una lettura del call center che restituisce dati di un'altra commessa. Un lotto di esiti dell'app 1.x scritto solo in parte, o un intervento controllato che cambia dopo una sincronizzazione 1.x. Un rifiuto dell'idempotenza dopo una riassegnazione (capitolo 8).

## Il servizio di Gea e il Portolano

*Per gli sviluppatori e lo staff tecnico.*

Il capitolo 10 ha rimandato qui l'architettura del servizio di Gea. Il servizio sta in `chatbot-service/`, è scritto in Node.js e TypeScript, vive nello stesso repository ma ha un proprio `Dockerfile` e un proprio rilascio, con target `make` eseguiti a mano (il rilascio è nel capitolo 16). Orchestra la conversazione con il modello linguistico attraverso il gateway AI, OpenRouter, in streaming. Modello e chiave arrivano solo dall'ambiente, con le variabili `OPENROUTER_MODEL` e `OPENROUTER_API_KEY`; senza di esse la chat risponde 503 `chat_not_configured`.

Il servizio di Gea non ha nessuna credenziale di database. Ogni lettura di dati di dominio passa da `json.php?action=chatbot_*`, cioè da `JSONController`, che riusa sessione, identità e RBAC. La ragione è scritta nella decisione (pattern 27): gli schemi di tutte le commesse stanno sullo stesso cluster condiviso, e l'utente MySQL applicativo non è mai stato limitato per commessa, quindi l'isolamento fra commesse è sempre stato una garanzia del codice applicativo. Una credenziale generica in mano al servizio Node potrebbe leggere ogni commessa; il documento, quando è stato scritto, ne contava 106 attive. Di qui la regola per qualunque nuova capacità di Gea: una nuova azione PHP, mai una query diretta. C'è una sola eccezione. Il servizio legge direttamente i log del server, in sola lettura, limitato per commessa dai permessi cloud, e la commessa viene dal token, mai da un parametro.

Il ponte d'identità ha due pezzi, ed entrambi sono obbligatori. Il primo è un token di 15 minuti (`'exp' => time() + (15 * 60)`), emesso da `json.php?action=chatbot_token` solo a chi ha una sessione valida e un tipo ammesso, su una commessa dove Gea è abilitata. I suoi claim sono minimi: `tenant`, `user_id`, `tipo`. Dal lato PHP la commessa si ricostruisce solo da quei claim, e il commento di `json.php` lo dice: «Il contesto tenant viene ricostruito soltanto dai claim gia' verificati, mai da parametri della richiesta.» Il secondo pezzo è un'intestazione di servizio con un segreto che conosce solo il container. Serve perché il token sta nel browser: un utente che lo copiasse dagli strumenti di sviluppo potrebbe chiamare le azioni direttamente, aggirando il limite di frequenza, il tetto giornaliero e l'audit. Se manca uno dei due pezzi, la risposta è 403.

### I file del servizio

Dentro il servizio la mappa è breve:

- `server.ts` tiene il ciclo, con al massimo 12 giri di modello per domanda e 90 secondi per turno;
- `tools.ts` tiene gli strumenti e le chiamate al Portolano;
- `cost-cap.ts` tiene il tetto giornaliero, che è un numero di richieste e non una spesa: 100 turni per commessa per giorno (`CHATBOT_DAILY_REQUEST_LIMIT`), oltre i quali la risposta è 429;
- `audit.ts` registra ogni turno, visibile solo allo staff;
- `technical-leak-guard.ts` controlla la risposta già generata contro percorsi di file e nomi interni, perché un vincolo nel prompt «viene obbedito solo probabilisticamente» (GOP-258).

Gli strumenti di dati sono le 13 classi PHP elencate in `ChatbotRegistro::CLASSI`.

### Il Portolano

Il Portolano, la base di conoscenza interrogabile per significato (RAG), è il server RAG di GOPlanner: un database vettoriale Qdrant con un server MCP davanti, ricerca ibrida vettoriale e lessicale, legami fra documenti. Lo alimentano codice, documenti, wiki e ticket completati. Ha due usi, per due pubblici diversi.

Gea lo interroga solo con il ruolo pubblico, `CHATBOT_RAG_PUBLIC_ROLE` (predefinito `goplanner:public`), insieme al ruolo della commessa della sessione. I risultati sotto `docs/` o `retrospective/` vengono scartati (GOP-795). Il README di una commessa arriva da uno strumento separato e solo per la commessa della sessione. Il servizio chiede al Portolano 25 risultati e ne passa al modello al massimo 10; fa al massimo 2 ricerche per turno, perché una ricerca costa da 4 a 14 secondi, e tiene una cache di 5 minuti. Se il Portolano non è configurato o non risponde, lo strumento restituisce `rag_not_configured` o `rag_unavailable`, e Gea deve dirlo invece di rispondere come se avesse letto.

Lo staff e gli agenti lo usano con gli strumenti `query_rag`, `query_rag_hybrid`, `get_document_by_slug`, `ingest_document` e `rebuild_links`. La collezione di sviluppo, `rag_documents_internal`, con i ruoli `admin`, `dev` e `developer`, non è mai quella che legge Gea. Il codice entra con la skill `code-rag-analyzer`. Ogni ticket Jira chiuso con `/implement-ticket` entra con descrizione e commento finale, dopo un controllo dei segreti obbligatorio, perché i commenti possono contenere password o token incollati (pattern 30); i ticket chiusi prima di quella decisione non sono stati recuperati.

### Quando il Portolano risponde poco

Due trappole valgono per chi sviluppa. La prima è il filtro dei ruoli. Il cookbook 16 dice di usare sempre `user_roles: "admin"`; il 25 novembre 2026 `""` e `"admin"` hanno restituito gli stessi risultati, mentre `"goplanner"` ha restituito due schede non pertinenti. La seconda è il time-out. `HYBRID_DENSE_FUTURE_TIMEOUT_SEC` vale 0,2 secondi di default, meno della latenza tipica di un embedding più una query; il sintomo è «Dense search failed or timed out» seguito da una connessione chiusa. Il rimedio è impostare quella variabile, `HYBRID_LEXICAL_FUTURE_TIMEOUT_SEC` e `QDRANT_HTTP_TIMEOUT_SEC` a `"10.0"` nella configurazione MCP del client.

Un risultato del Portolano resta un indizio, non una prova. Le query sulla matrice delle distanze non restituiscono il documento che la descrive; quelle sull'analisi AI delle foto restituiscono solo la generazione precedente. Quando il Portolano non concorda con il codice su `php8`, vince il codice.

Ma Gea legge anche i documenti per sviluppatori del Portolano? No. Legge solo con il ruolo pubblico, scarta i percorsi da sviluppatore, riceve il README solo della commessa della sessione; e le è vietato descrivere come funziona (capitolo 10).

Il primo limite di questa parte è uno strumento. Con `interroga_dati` (GOP-531) Gea esegue oggi una SELECT scritta dal modello. Il controllo, `ChatbotQuerySelect`, analizza la query a token e non con un albero sintattico; ammette un'istruzione sola, senza subquery, solo sul database della commessa di sessione, con al massimo 5000 millisecondi e 50 righe, colonne sensibili escluse. Lo strumento è riservato a chi vede tutti i lotti, e ogni query, eseguita o rifiutata, viene registrata. Gli altri limiti sono più brevi. Il tetto giornaliero, se il contatore non risponde entro 200 millisecondi, lascia passare il turno. Il Portolano può restare indietro rispetto al codice. Nessun indirizzo del Portolano o del servizio compare in questa guida, e il rilascio del servizio è nel capitolo 16.

## I servizi esterni che GOPlanner chiama: AI delle foto e mappe

*Per gli sviluppatori.*

Quando GOPlanner è il chiamante, vale una regola: la risposta di un servizio esterno è una proposta che il codice controlla prima di salvare, e quando il servizio non risponde i dati restano come erano.

### L'analisi AI delle foto

Il contratto è `docs/analisi-ai/contratto.md` (epic GOP-674, motore GOP-719). Il primo principio è «L'AI propone, il back office decide»: il motore non scrive mai su `interventi`, `interventi_eseguiti`, `foto` o sui campi personalizzati, ma solo nelle proprie tabelle, create dalla migrazione tenant `0028_analisi_ai.sql`. Dove la migrazione manca, la risposta è «Analisi AI non ancora disponibile su questa commessa.», e nulla viene scritto. Il motore fa una chiamata per foto, con tutti i controlli che valgono per il tipo di quella foto, sempre con un solo modello; un elenco vuoto di tipi di foto significa tutte le foto. La risposta ha un formato fisso che il server convalida controllo per controllo, quindi all'utente non arriva mai testo libero; una risposta fuori formato riceve un solo nuovo tentativo. Ogni esito conserva la versione delle istruzioni che l'ha prodotto.

Nel codice il fornitore è `AnalisiAiProviderOpenRouter`, che passa dal client del backend `lib/OpenAI.php`; nonostante il nome, quel client parla con OpenRouter. Il modello viene da `ANALISI_AI_MODELLO`. Con `ANALISI_AI_BASE_URL` impostata, la stessa classe parla con un qualunque server compatibile OpenAI, per esempio un server locale. Il ragionamento è spento e il tetto di uscita è di 6.000 token, per un caso reale: con 4.000 token e ragionamento acceso il modello consumava tutto nel ragionamento e il JSON tornava tagliato (`finish_reason=length`). C'è anche una regola di vocabolario: nell'interfaccia e in ogni JSON mandato al browser compare solo «AI», mentre fornitore, modello e chiavi stanno solo nei log del server. I costi di ogni chiamata si registrano in `analisi_ai_costi` e si leggono da Admin › «Cruscotto Analisi AI» (capitolo 12).

Nel codice esiste ancora una generazione precedente, descritta dai pattern 18 e 20: un flusso con un modello locale e le colonne `ai_status` e `ai_metadata`. Il flusso attuale della Verifica interventi è quello del contratto; il cookbook 34 chiede a una commessa che abbia ancora l'innesco vecchio di non far girare i due insieme sulle stesse foto.

### Mappe e geocodifica

Nel browser le mappe sono Leaflet con tile OpenStreetMap, dal 10-11 marzo 2026 secondo la storia di git. `js/code/leaflet_compat.js` tiene uno strato che imita la vecchia API `google.maps`, così le pagine non ancora migrate continuano a funzionare.

La geocodifica delle utenze, in `UtenzaBase::geocodifica()`, segue quest'ordine:

1. la cache per indirizzo;
2. Google, ma per primo solo nella geocodifica massiva e dal pulsante della scheda, e solo se la commessa ha una chiave propria;
3. il Nominatim di GOPlanner, con le varianti dell'indirizzo;
4. Google come ripiego, sempre e solo con la chiave della commessa.

Senza quella chiave, Google non entra mai. Il Nominatim di GOPlanner ha un ritmo configurabile, di default 100 millisecondi fra due partenze e 4 ricerche insieme, con un turno condiviso da tutti i worker di tutte le commesse perché il servizio è uno solo. Un indirizzo non trovato diventa precisione −1, senza coordinate: mai il centro del solo comune (GOP-561).

Per gli indirizzi non trovati c'è la correzione AI (GOP-773), che parte solo per un'utenza con precisione −1 e senza un punto precedente. L'AI riscrive fino a 3 candidati, espandendo le abbreviazioni e correggendo i refusi. Ogni candidato si cerca su Nominatim e viene accettato solo se passano tutti i controlli del codice:

- il `place_rank` è almeno 26, cioè una via o meglio;
- il comune è coerente;
- il punto sta entro 30 km dal centro del comune;
- il nome della via è coerente con quello scritto: ogni parola dell'originale deve essere l'inizio di una parola del risultato, quindi «Via Cav.di V.Veneto» non diventa «Via Vittorio Veneto»;
- una seconda domanda all'AI risponde esattamente `{"stessa_via": true}`.

L'esito è precisione 1 se si è arrivati al civico, altrimenti 3. Il caso che ha motivato il lavoro: una commessa del servizio idrico, con un carico di 4100 utenze in cui 93 non si geocodificavano per iniziali, abbreviazioni o refusi. Questa AI parla solo con il server AI locale di GOPlanner, attraverso `ANALISI_AI_BASE_URL`, e non con il gateway; senza quella variabile la correzione non parte. Ogni correzione è una riga di `geocodifica_ai` (migrazione tenant `0043`), e «Annulla correzione AI», con il permesso `utenze.modificare`, rimette l'utenza a non trovata. Il lato dell'ufficio, con la colonna «Geocodifica», l'etichetta «AI» e il filtro «Corrette dall'AI», è nei capitoli 3 e 5.

Se l'AI corregge un indirizzo, cambia l'anagrafica dell'utenza? No. `utenti.indirizzo` e `utenti.civico` non cambiano mai: cambiano solo il punto e la sua precisione. La correzione resta registrata con l'indirizzo scritto e quello usato, e si può annullare.

### Le distanze delle zone

Dopo la conferma di una zona, `lib/DistanzeZona.php` (GOP-683) accoda un lavoro che calcola tempi e metri su strada fra ogni coppia di utenze della zona e dal punto di partenza di ogni operatore, con OSRM `/table`. Una richiesta porta al massimo 100 coordinate, quindi oltre quel numero si lavora a blocchi di 50 × 50. Le tabelle sono `zone_outbound_distanze` e `zone_outbound_partenze`, create dalla migrazione di modulo `migrations/tenant/modules/zone_outbound/0007_distanze.sql`. NULL vuol dire nessun dato, mai 0. Se OSRM non risponde, la forma della matrice è già scritta, un blocco fallito non sovrascrive mai un valore buono, e il lavoro si riaccoda dopo 1, 5 e 15 minuti, poi dopo 1 ora e 3 ore; poi si ferma, e le coppie restano NULL. Il pianificatore vede l'avviso «distanze incomplete (N coppie)» e può usare «Ricalcola distanze» (capitolo 5). Per i comandi remoti, infine, GOPlanner chiama il servizio push dei telefoni, FCM, e registra ogni invio (sezione sul motore unico e capitolo 8).

Ogni servizio esterno ha il suo modo di mancare. Google entra solo dove la commessa ha una chiave propria. Quando Nominatim non risponde l'utenza non viene toccata, e il lavoro massivo si ferma dopo 5 utenze di fila con il servizio fuori uso. Quando OSRM non risponde, dopo l'ultimo tentativo la matrice resta incompleta e l'avviso lo dice. L'analisi delle foto dipende dal gateway, o dal server locale, e dalla migrazione `0028`; la correzione degli indirizzi dipende dal server locale e dalla migrazione `0043`: dove mancano, la funzione dice che non è disponibile e non scrive nulla. Il server che fa girare Nominatim e OSRM è descritto qui solo come «di GOPlanner».

Prima di scrivere o di correggere un'integrazione, si nomina la sua porta e si risponde alle tre domande, in quest'ordine: chi chiama; su quale commessa, e su quale connessione; con quale contratto. Quando è GOPlanner a chiamare, la risposta che torna resta una proposta finché il codice non l'ha controllata. Una capacità nuova entra come operazione del motore o come azione PHP, mai come una credenziale di database consegnata a un servizio esterno.

## Fonti

- codice: `.htaccess`, `api/.htaccess`, `mobile_v3.php`, `lib/MobileV3/Kernel.php`, `lib/MobileV3/ApiError.php`, `lib/MobileV3/IdempotencyStore.php`, `lib/MobileV3/Response.php`, `lib/MobileV3/Request.php`, `lib/MobileV3/Correlation.php`
- codice: `json_android.php`, `lib/AndroidController.php`, `lib/InterventoEseguitoBase.php`, `json_timbratori.php`, `api.php`, `json_admin.php`, `lib/AdminRequestGuard.php`, `telelettura.php`, `Smarty_templates/it/admin.html`
- codice: `api_cc.php`, `lib/CallCenterController.php`, `lib/CallCenterMasterToken.php`, `lib/CentralinoController.php`, `lib/CallCenterUtFilter.php`, `lib/OperatoreLocaleBase.php`, `migrations/tenant/0015_interventi_indice_operatore_data.sql`
- codice: `lib/OperazioniController.php`, `lib/OperazioniCatalogo.php`, `lib/OperazioniPorta.php`, `lib/OperazioniConferma.php`, `lib/OperazioniRegistro.php`, `lib/OperazioniComandi.php`, `lib/McpOAuth.php`, `lib/McpServer.php`, `lib/McpConfig.php`, `lib/PerimetroCommessa.php`
- codice: `json.php`, `lib/JSONController.php`, `lib/ChatbotAuth.php`, `lib/ChatbotRegistro.php`, `lib/ChatbotQuerySelect.php`, `chatbot-service/src/server.ts`, `chatbot-service/src/tools.ts`, `chatbot-service/src/cost-cap.ts`
- codice: `lib/AnalisiAiMotore.php`, `lib/AnalisiAiProviderOpenRouter.php`, `lib/UtenzaBase.php`, `lib/GeocodificaUtenze.php`, `lib/NominatimRitmo.php`, `lib/GeocodificaAi.php`, `lib/DistanzeZona.php`, `lib/OsrmRouting.php`, `lib/jobs/CalcolaDistanzeZonaJob.php`
- docs: `docs/mobile-v3/envelope.md`, `docs/mobile-v3/esito-write.md`, `docs/mobile-v3/abbinamento.md`, `docs/mobile-v3/magazzino.md`, `docs/mobile-v3/magazziniere.md`, `docs/02-patterns/16-mobile-inbound-sync.md`, `migrations/tenant/0007_mobile_v3_richieste.sql`
- docs: `docs/cc/architettura-api-cc.md`, `docs/cc/openapi.yaml`, `docs/02-patterns/23-cc-cancellazione-stato-annullato.md`
- docs: `docs/02-patterns/42-motore-unico-operazioni-console-api-mcp.md`, `docs/02-patterns/27-chatbot-supporto-architettura.md`, `docs/02-patterns/30-ingestione-ticket-completati-in-rag.md`, `docs/03-cookbooks/16-utilizzo-rag-qdrant-mcp.md`, `docs/03-cookbooks/23-chatbot-service-guida-al-codice.md`
- docs: `docs/analisi-ai/contratto.md`, `docs/03-cookbooks/34-verifica-interventi-estensioni-tenant.md`, `docs/MAPS_ARCHITECTURE.md`, `docs/02-patterns/45-matrice-distanze-zone-outbound.md`, `docs/02-patterns/48-precisione-utenti-geocodifica-anomalie.md`, `docs/02-patterns/51-geocodifica-correzione-ai.md`, `migrations/main/README.md`
- wiki: `wiki/voiceai-integration.md`
- Jira: GOP-274 — slot non configurati dall'API del call center; GOP-276 — operatori di tutte le commesse nell'API del call center; GOP-279 — credenziali di `json_timbratori.php` e `api.php`; GOP-294 — `json_admin.php` solo per il personale GOPlanner
- Jira: GOP-628 — motore unico delle operazioni; GOP-629 — telaio, porta MCP e OAuth; GOP-716 — documenti via MCP; GOP-757 — triage dei ticket; GOP-784 — comandi remoti; GOP-787 — approvazione dei comandi; GOP-705 — dati di prova
- Jira: GOP-806, GOP-809 — passaggio di due commesse a GOPlanner 3 (note di rilascio, migrazione `0007` da applicare a mano)
- Jira: GOP-449 — ordine di foto, firma e chiusura; GOP-242 — validazione del lotto 1.x; GOP-318 — stato dopo lo spostamento; GOP-325 — filtro per UT; GOP-710 — Centralino
- Jira: GOP-674 — analisi AI delle foto; GOP-561 — mai il centro del comune; GOP-683 — matrice delle distanze; GOP-773 — correzione AI degli indirizzi
