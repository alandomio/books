# 13. Architettura di GOPlanner su PHP 8

*In questo capitolo si vede da quale file entra ogni richiesta che arriva a GOPlanner e che cosa fa ogni richiesta prima di qualsiasi logica: apre la commessa, carica la configurazione, passa la mano a un controller per nome. Poi si seguono nel codice una pagina, una chiamata JSON e un lavoro in coda, fino al browser. È un capitolo per gli sviluppatori e per gli agenti di codice che lavorano sul ramo `php8`; chi lavora in ufficio può saltarlo, perché tutto quello che serve al back office è nei capitoli da 1 a 12.*

## Molte porte, un solo codice: i punti d'ingresso

*Per gli sviluppatori e lo staff tecnico.*

Un clic su «Esporta», in File › Esportazione, attraversa cinque file e tre processi PHP. Lo script della pagina, `js/code/esportazione.js`, manda il modulo a `json.php` con `action=export`. `json.php` passa la richiesta a `JSONController`, che ha un metodo pubblico chiamato proprio `export()`: risolve la mappatura, controlla che la classe dei dati della commessa sia usabile e, se il modello gira in coda, chiama un suo metodo privato, `enqueueStandardExport()`. Quel metodo apre il registro dell'esportazione, avvia l'avanzamento con il messaggio «In coda», mette in Redis un `ExportInterventiJob` con `Queue::add()` e risponde subito `{"queued": true, "id": …}`. La pagina riceve l'id e comincia a chiedere a `json.php?action=job_stato` a che punto è il lavoro. Nel frattempo, in un altro processo che l'utente non vede, `worker.php` estrae il lavoro da Redis e lo fa eseguire a un processo figlio nuovo, `worker_job.php`. La risposta alla pagina è immediata. Il file arriva dopo, a volte minuti dopo.

Per il modello standard la coda è una regola scritta nel docblock di `enqueueStandardExport()`: «GOP-238: export sempre in coda per il modello standard». Il motivo si legge poche righe sotto, nel commento che GOP-647 ha lasciato sull'esportazione delle foto, quella che produce uno ZIP: «Lo ZIP richiede minuti: un POST sincrono lasciava la pagina ferma su "In attesa" e ogni clic ripetuto produceva un altro ZIP da 13 MB.» Il clic su «Esporta» contiene già la mappa del capitolo: le porte (questa sezione), le pagine (la seconda), le chiamate JSON (la terza), la commessa nel codice (la quarta), la coda (la quinta), il browser (la sesta).

GOPlanner è un solo codice con molte porte, e ogni porta, prima di qualunque logica, fa le stesse tre cose. La prima: trova la commessa e apre il suo database. La commessa, che nel codice si chiama tenant (e che nella tabella master `clienti` e nella cartella `custom/` è chiamata anche «cliente»), si legge dalla sessione in `config.inc.php`, che costruisce il nome del database a partire da `$_SESSION['user']['db']`; la regola dei database per commessa è nel capitolo 2. Un lavoro in coda ricostruisce la stessa situazione con `GOPlanner::bootstrapJobContext()`, che secondo il suo commento «rebuilds the account runtime for a queued job before it is executed». Le richieste di GOPlanner 3 lo fanno con `lib/MobileV3/TenantBootstrap.php`, che dichiara di seguire «la stessa sequenza di json_android.php». La seconda: caricare la configurazione a livelli e registrare l'autoloader, `goplannerAutoload`, che delega a `ClassiCustom::carica()` e preferisce la classe della commessa a quella comune (ordine e livelli: capitolo 2). La terza: passare la richiesta a un controller per nome. Il parametro `page` diventa `pages/<page>.php`; il parametro `action` diventa il metodo pubblico di un `*Controller`; una rotta `/v3/…` va al `Router` di `lib/MobileV3/`; una classe di lavoro arriva al suo `run()`.

| File | Chi lo chiama | Come riconosce chi chiama | Dove continua | Capitolo |
|---|---|---|---|---|
| `index.php` | il browser del gestionale | sessione dopo l'accesso | `pages/<page>.php` e Smarty | 13 |
| `json.php` (anche `/json/<action>` per una regola di `.htaccess`) | gli script delle pagine | sessione | `JSONController`, poi la catena storica | 13 |
| `json_admin.php` | le pagine Admin | sessione (401 senza utente), poi solo staff tecnico (403 per amministratori e operatori della commessa) | `ADMINController` | 12, 13 |
| `api.php` (anche `/api/…`) | l'app GOPlanner 1.x e alcune integrazioni | il valore `key` dichiarato dal client (`MobileRequestGuard`: 401 JSON se manca o è vuoto) | `ApiController` | 15 |
| `json_android.php` | l'app GOPlanner 1.x | `sim_id`, senza sessione; parametri validati ramo per ramo con `AndroidRequestGuard` | `AndroidController` | 15 |
| `mobile_v3.php` (`/v3/…`) | l'app GOPlanner 3 | richieste firmate | `lib/MobileV3/` (`Router`, `Kernel`) | 15 |
| `api_v2.php`, `mcp.php`, `console.php` | integrazioni e agenti | OAuth del motore delle operazioni; riga di comando per la console | `OperazioniController`, `ConsoleController` | 15 |
| `api_cc.php` (`/api/cc/v1/…`) | call center | — | `CallCenterController` | 15 |
| `worker.php` → `worker_job.php` | servizio Docker, solo riga di comando | dal web risponde 403 | `Queue`, `lib/jobs/` | 13 |
| `scheduler_giro.php` | servizio Docker con `--ciclo`, solo riga di comando | dal web risponde 403 | accoda su `job_giro` | 12, 13 |
| `cron.php` → `cron_worker.php --tenant=…` | cron di sistema | riga di comando | fermo su `php8` (vedi la quinta sezione) | 13, 16 |
| `ws_server/index.js` | Node e Socket.io | — | si abbona a Redis | 13 |
| altri file di utilità (`export.php`, `getconfig.php`, `acra-report.php`, `importa_json.php`, `mappature_json.php` e simili) | pagine e app | dipende dal file | quelli nominati includono `config.inc.php`; alcuni hanno un controller proprio (terza sezione) | 7, 15, 16 |

Due righe della tabella chiedono una parola in più. `json_admin.php` ha due cancelli. Il primo, `AdminRequestGuard::denyUnlessAuthenticated()`, sta in cima al file, prima di `config.inc.php`, e risponde 401 con `{"success":false,"message":"User not allowed"}` se in sessione non c'è un utente. Il commento di GOP-275 spiega perché sta in cima e non nei rami: «una catena di elseif di migliaia di righe non si mette in sicurezza un ramo alla volta». Il secondo, `denyUnlessCanUseJsonAdmin()` (GOP-294), viene subito dopo `config.inc.php`, perché per riconoscere l'identità serve il database, e risponde 403 con lo stesso messaggio a chiunque non sia staff tecnico, cioè non abbia `users.tipo === 0` e non sia il super-admin globale. La seconda riga è quella del root `admin.php`. Non è una pagina: è uno script da riga di comando (opzioni `--action`, `--utenza`, `--intervento`). Via HTTP, la riga 92 di `.htaccess` riscrive `/admin.php` in `index.php?page=admin`, ed è questa la pagina Admin del capitolo 12.

Gli script nati per la riga di comando si riconoscono dalla prima riga. `worker.php`, `worker_job.php` e `scheduler_giro.php` cominciano tutti con `if (PHP_SAPI !== 'cli') { http_response_code(403); exit; }`; `cron_worker.php` fa lo stesso con `die("Access denied")` e pretende `--tenant=`. Anche le voci del menu in alto, che puntano a indirizzi come `utenze.php` o `interventi.php`, non sono file: l'ultima regola di `.htaccess` trasforma ogni `<nome>.php` inesistente in `index.php?page=<nome>`. Così `file.php`, la pagina File › Importazione ed Esportazione, è in realtà `index.php?page=file`.

Ma perché tante porte e non un unico punto d'ingresso? L'obiezione è giusta, e la documentazione del progetto le dà ragione: `docs/01-foundations/02-project-structure-map.md` classifica `api/`, `json.php`, `json_admin.php` e `json_android.php` come «DEBITO TECNICO» e dice che la loro logica «deve essere migrata nei `*Controller.php` appropriati». Le porte sono il risultato della storia. Ogni famiglia di chiamate nuova ha avuto una porta sua con il suo cancello: le richieste firmate di GOPlanner 3 vivono in `mobile_v3.php` accanto a `json_android.php`, che «non viene toccato»; il motore delle operazioni (GOP-629) ha la sua porta MCP con OAuth. L'unico piano esplicito in Jira è GOP-628: `OperazioniController` è «estratto dal codice esistente (JSONController, ADMINController, json.php), non riscritto», e i metodi vecchi diventano adattatori sottili. Nessun ticket chiede di eliminare la catena di `json.php`. La regola per chi scrive codice, quindi, non è aggiungere una porta. È aggiungere un metodo dietro una porta che esiste già.

La tabella ha confini precisi. Descrive le porte presenti su `php8` alla data di ricerca, 25 novembre 2026, e non elenca le rotte di GOPlanner 3 né le operazioni del motore unico, che sono del capitolo 15; il servizio di Gea è un'applicazione separata con un suo ingresso, descritta anch'essa nel capitolo 15. Quali porte siano davvero raggiungibili in produzione dipende dal server web e dalle sue regole: è materia dello staff tecnico e del capitolo 16, non di un ramo di sviluppo.

Ogni porta fa per prima cosa le stesse tre cose: apre la commessa, carica la configurazione, passa la richiesta a un controller per nome.

## Una pagina, dal clic all'HTML: index.php, pages/ e Smarty

*Per gli sviluppatori.*

Fra l'indirizzo `index.php?page=interventi` e l'HTML che arriva al browser ci sono 427 righe di `index.php`, e l'ordine conta. Un passo saltato produce un messaggio preciso. Un passo fuori posto produce una pagina che sembra giusta e non lo è. Questi sono i passi, con il file e la riga dove vivono:

1. `session_start()` (riga 3), poi `require_once 'config.inc.php'` (riga 9): commessa, database, configurazione `$custom` a livelli e autoloader (capitolo 2).
2. `smarty.inc.php` (riga 17): crea l'oggetto Smarty con `template_dir` = `Smarty_templates`, `caching = FALSE`, i compilati in `_compiled`, i delimitatori `{{` e `}}`; registra `AssetUrl::registraInSmarty()` (GOP-624) e imposta i valori predefiniti, fra cui `jquery_ui` = true (GOP-496).
3. `lib/common.inc.php` (riga 20), `lib/class.MyWrapper.php` (riga 23) e la connessione `$db = new MyWrapper(...)` (riga 31).
4. `$page` dalla richiesta (riga 35).
5. Accesso con `token` o `key` e cambio di commessa: il solo punto che scrive la commessa in sessione è `SessioneTenant::switchTenant()` (GOP-107), che aggiorna insieme `db`, `dbtype` e `cliente`.
6. Menu: la voce Magazzino in alto per la commessa con il magazzino di GOPlanner 3 acceso (GOP-767), il menu personalizzato da `$custom['menu']`, il menu ridotto del Magazziniere (GOP-855).
7. `page=index` diventa `login`; la lingua viene dalla richiesta, poi dalla sessione, altrimenti `it`.
8. Registrazione del filtro di uscita `i18n_substitute_text` e `template_dir .= '/'.$lang` (righe 253-259): i modelli si cercano in `Smarty_templates/it/`.
9. Senza `$_SESSION['user_id']` si carica `pages/login.php`, si mostra il suo modello e la richiesta finisce (righe 261-268). Con la sessione e senza `page`, si apre `utenze` (righe 270-271).
10. Controllo dei permessi di visualizzazione, `Rbac::gate(Permessi::permessoVista($page), …)`, in sola registrazione (righe 279-289).
11. Il controller: `pages/<page>.php` (righe 291-296), che deve impostare `$template`.
12. Dopo il controller: campanella (GOP-712), conteggio della voce «Ticket» (GOP-758), voce Admin (GOP-601), logo, assegnazioni a Smarty.
13. `header('Cache-Control: no-store')` e `$smarty->display($template)` (righe 348-359).
14. Il filtro di uscita sostituisce ogni `@@etichetta@@` con il testo di `lib/dict/lang_<lingua>.php`.

Il passo 4 nasconde una piccola sorpresa per chi legge le istruzioni vecchie. La riga 35 cerca un `$DEFAULT_PAGE` che nessun file del codice definisce: la pagina predefinita, dopo l'accesso, la decide la riga 270, `if(empty($page)) $page = 'utenze';`. Il passo 10 è il cancello dei profili. Il commento nel codice lo dice in chiaro: è «log-only finche' rbac_enforce non e' attivo», e un'identità senza il permesso «NON blocca l'accesso alla pagina in questa modalita': e' esattamente il comportamento atteso, non un bug» (GOP-112). Le eccezioni sono `novita` e `ticket`. Profili, permessi e significato di quel flag stanno nel capitolo 11.

Il passaggio al controller si regge su due `die()`:

```php
// carico il controller obbligatorio, deve settare il template
if(is_readable("pages/".$page.".php")) require_once "pages/".$page.".php";
else die("<h2>missing {$page} controller</h2>");
// …
die("<h2>missing template {$smarty->template_dir}/{$template}</h2>");
```

«missing *pagina* controller» vuol dire una cosa sola: non esiste un `pages/<page>.php` leggibile. «missing template …» vuol dire che il controller non ha impostato `$template`, oppure che il file non c'è nella cartella della lingua. Il secondo messaggio è più utile di quanto sembri: stampa il percorso completo che ha cercato, quindi dice anche in quale cartella di lingua manca il modello. I modelli sono file `.html`, 59 in `Smarty_templates/it/`; non `.tpl`, come scrivono `02-project-structure-map.md` e `08-ui-ux-architecture.md`.

Un controller serve molte azioni. In `pages/` ci sono 32 file PHP, molti meno delle voci di menu. `pages/interventi.php` ne è l'esempio più chiaro: alle righe 34-64 uno `switch($_REQUEST['action'] ?? null)` sceglie fra `visualizza_intervento`, `piano_intervento`, `piano_intervento_zone`, `piano_allacci`, `calendario_risorse`, `giornata`, `settimana` e altri casi. Il modello lo sceglie la riga che assegna `$template`: `pages/admin.php:271` scrive `$template = 'admin.html';`, `pages/carichi.php:9` scrive `$template = 'Carichi.html';`. Nel controller i dati arrivano dal database attraverso tre classi: `MyWrapper` per le query, `SimpleOrm` per le tabelle della commessa, `MainOrm` per il database master (la differenza è nei capitoli 2 e 14). Un nome trae in inganno chiunque arrivi nuovo: nel codice le utenze sono la tabella `utenti`, mentre le persone che usano il gestionale sono `users`. Lo schema è nel capitolo 14.

Il filtro delle etichette ha un comportamento che sorprende. Se un `@@testo@@` non è nel dizionario, il filtro non lo scarta: lo mostra così com'è e lo aggiunge in coda a `lib/dict/lang_<lingua>.php` con `DizionarioVoce::appendi()`, come riga `$_['testo'] = 'testo'; //new`. Un refuso in un'etichetta, quindi, crea una voce nuova nel dizionario. La scrittura passa da `var_export()` e avviene solo se la riga è PHP valido, per una ragione storica registrata in GOP-689: un'etichetta nuova con un apostrofo, appesa senza escape al dizionario che ogni pagina include, poteva «spegnere tutto il sito». Se il file non è scrivibile non si scrive nulla, e la pagina mostra la chiave. Lo stesso meccanismo vale in `js/code/js.php`.

### Trovare i file di una pagina

1. Leggi nella barra degli indirizzi il valore di `page` e, se c'è, di `action`. Se l'indirizzo è `interventi.php`, la pagina è `interventi`.
2. Apri `pages/<page>.php` e cerca il ramo di quell'`action`.
3. Annota il valore assegnato a `$template`.
4. Apri quel file in `Smarty_templates/it/`.
5. Nel modello, trova gli script caricati con `{{asset path=…}}`: sono in `js/code/`.
6. Nello script, cerca le chiamate a `json.php` e il loro `action` (terza sezione).
7. Prima di modificare una classe di `lib/`, controlla se `custom/{tenant}/php/` ne ha una con lo stesso nome (regola nel capitolo 2).

«Ho aggiunto `pages/nuova.php`, ma la pagina non compare nel menu.» Il controller e il menu sono due cose separate, e il menu si costruisce da un'altra parte. Le voci del menu in alto sono scritte in `Smarty_templates/it/_header.html`, ognuna condizionata da una chiave `$MENU.<voce>` (i valori predefiniti sono in `config.inc.php`, per esempio `$MENU['interventi'] = true` e `$MENU['carichi'] = false`, e la configurazione della commessa li sovrascrive) e spesso da un permesso, come `can_tipo('interventi.vedere', 3)`. Il menu laterale ha classi sue: `lib/MenuAdmin.php`, `MenuInterventi.php`, `MenuLaterale.php`, `MenuMagazzino.php`, `MenuRapporti.php`. Una pagina raggiungibile per indirizzo non è ancora una voce. Finché non si aggiunge la voce, la pagina esiste solo per chi ne conosce l'indirizzo.

I modelli di pagina non hanno un override per commessa: Smarty li cerca solo in `Smarty_templates/<lingua>/`, e i diagrammi `docs/diagramma_override_multi_tenant.md` e `docs/diagramma_flusso_web_mvc.md`, che disegnano una cartella `custom/{cliente}/templates/`, sul ramo `php8` sono sbagliati; una pagina che deve cambiare per una sola commessa cambia con la configurazione, con `custom.js` o con una classe della commessa (capitolo 2). Quando un documento di `docs/` contraddice il codice di `php8`, vale il codice: si annota la differenza, non si piega il codice al documento. Il cancello dei permessi di `index.php`, oggi, non blocca nessuno (capitolo 11). E la Smarty caricata è la 2.6.30 (`Smarty/Smarty.class.php`; in `Smarty_old/` c'è una 2.6.10 che nessuno carica): la sintassi della documentazione recente di Smarty può non funzionare, e lo stesso `index.php` avverte, alle righe 193-195, che questa versione «compila {{$cliente.id}} come accesso ad array». Prima di scrivere un modello si guarda come sono scritti quelli che ci sono. Nessun ticket pianifica un aggiornamento di Smarty.

Una pagina è sempre la stessa terna: `pages/<page>.php` decide i dati e il modello, `Smarty_templates/<lingua>/` li disegna, `js/code/` li fa vivere.

## Le chiamate JSON: dall'action al metodo del controller

*Per gli sviluppatori.*

Una chiamata JSON del gestionale passa da due strati, e il secondo non avvisa quando ci si finisce dentro. Il primo è il controller. Alla riga 283 `json.php` costruisce `new JSONController($db, $configurazione, $User)` e chiama `call($_REQUEST['action'])`. Il metodo è corto (`lib/JSONController.php`, righe 31-44, con due righe di commento omesse):

```php
function call($method)  {
    if(!empty($this->configurazione->account))  {
        if(is_callable(array($this, $method)))  {
            return call_user_func(array($this, $method));
        }
        else
            return false;
    }
    return json_encode(array('success' => false, 'message'=>'User not allowed'));
}
```

Tre esiti, quindi. Senza una commessa aperta la risposta è `{"success":false,"message":"User not allowed"}`. Con un metodo chiamabile di quel nome, la risposta è ciò che il metodo restituisce. Altrimenti `false`. Quando il risultato è una stringa non vuota, `json.php` manda gli header di non-cache (`Expires` nel passato, `Cache-Control: no-store`, `Pragma: no-cache`), chiama `ob_clean()`, imposta `Content-type: application/json` e `Content-Length`, stampa il JSON e termina con `die()`.

Il secondo strato entra in gioco quando `call()` restituisce `false`. `json.php` non si ferma: chiude la sessione con `session_write_close()` e scende nella sua catena storica di `if ($_REQUEST['action'] == …) … elseif …`, che comincia alla riga 319 con `listaordinata` e conta 246 rami in un file di 9.570 righe. È il «DEBITO TECNICO» di `02-project-structure-map.md`, e intanto serve la produzione ogni giorno: nessun ticket ne chiede la riscrittura (GOP-628 estrae operazioni, non elimina rami). La regola riguarda soltanto dove va il codice nuovo: nella catena, nulla.

Il contratto di un metodo è scritto in `docs/01-foundations/01-architecture-rules.md` e in `docs/02-patterns/05-controller-pattern.md`. Il metodo restituisce una stringa JSON, `return json_encode($data);`, e non usa mai `echo`: stampa la porta, non il controller. Le dipendenze arrivano solo dal costruttore, `__construct($db, $configurazione, $User)`. Il nome dell'action è il nome del metodo: `JSONController` non ha un elenco di action ammesse, e l'inventario di GOP-664 vi conta «oggi 170 metodi pubblici». Lo stesso clic d'apertura mostra come il codice separa l'action dal lavoro che c'è dietro: l'action è `export()`, pubblica e senza argomenti; il pezzo che apre il registro e accoda sta in un metodo a parte, `private function enqueueStandardExport(array $mappatura, array $request)`, che riceve dall'action la mappatura già risolta.

Gli altri controller seguono lo stesso schema con varianti. In `lib/` ce ne sono 20, ognuno dietro la sua porta:

- `ADMINController` ← `json_admin.php` (che istanzia anche `AndroidController`)
- `AndroidController` ← `json_android.php`
- `ApiController` ← `api.php`
- `ImportazioneController` ← `importa_json.php`, con una firma diversa: `call($method, array $request, array $files)`
- `MagazzinoDdtController` ← `magazzino_ddt_json.php`
- `MappatureImportController` ← `mappature_json.php`; `MappatureEsportazioneController` ← `mappature_esportazione_json.php`
- `PDFController` ← `pdf.php`
- `OperazioniController` dietro `lib/OperazioniPorta.php`, `ConsoleController` ← `console.php` (motore delle operazioni, capitolo 15)

Il capitolo 4 ha promesso di mostrare l'importazione come codice. Eccola, in sei anelli:

1. File › Importazione chiama `importa_json.php`, che costruisce `ImportazioneController`.
2. Il controller apre l'avanzamento con `AvanzamentoJob::avvia(ImportazioneLavoro::TIPO_AVANZAMENTO, …, 'In attesa di partire', $utente)` e poi chiama `Queue::add($job)`; se l'accodamento fallisce, chiama `AvanzamentoAllarme::codaNonDisponibile()`.
3. `ImportazioneJob` gira nel worker: dal GOP-745 «la usa ogni importazione, qualunque sia la dimensione del file».
4. `ImportazioneLavoro` (tipo di avanzamento `importazione`) esegue `ImportazioneEsecuzione::importa`.
5. `ImportazioneEsecuzione` «crea una lista nuova e salva le pratiche una riga alla volta», con codice comune a tutte le commesse.
6. `ImportazioneRegistro` scrive il registro nella tabella `importazioni` della commessa (migrazione `0013_importazioni.sql`). Le tabelle della lista, `carichi` e `carichi_righe`, sono descritte nel capitolo 14.

Con la coda ferma non c'è ripiego sincrono: lo stato resta «In attesa» e dopo 30 minuti diventa «Fermo» (GOP-745).

La forma di `lib/` racconta due stagioni del progetto. Al primo livello ci sono 470 file PHP, quasi tutti classi globali senza namespace: `class.MyWrapper.php`, `SimpleOrm`, `MainOrm`, le classi di dominio, i servizi. Poi le cartelle: `lib/jobs/` per i lavori, `lib/dict/` per le etichette, e `lib/MobileV3/`, 29 voci con namespace `MobileV3` e un autoload proprio (`lib/MobileV3/autoload.php`, caricato da `index.php:117`), dove vivono `Router`, `Kernel` e `TenantBootstrap`. I due stili convivono.

Sopra ogni richiesta, infine, c'è un buffer. `config.inc.php` apre un `ob_start()` globale subito prima di `GOPlanner::init()`, che registra il gestore degli errori (pattern 33, GOP-249): su un errore fatale, `BaseErrorHandler::emitFatalOutcome()` svuota i buffer, imposta HTTP 500 e stampa una sola risposta, cioè una schermata, un JSON valido o niente da riga di comando. Prima, un fatale a metà pagina appendeva il messaggio al frammento già inviato e la risposta usciva con HTTP 200. La schermata d'errore e il suo codice sono del capitolo 12.

«La mia action risponde vuota.» Le cause, in ordine di probabilità, sono tre, e si controllano in quest'ordine, partendo dal nome:

1. Il nome del metodo non coincide con `action`, oppure il metodo non è chiamabile: `call()` restituisce `false`, la richiesta scivola nella catena storica, nessun ramo corrisponde e la risposta è vuota, senza un errore.
2. Il metodo fa `echo` invece di `return`: `call()` non restituisce una stringa, `json.php` non stampa nulla come JSON, e quello che il metodo ha scritto finisce nel buffer invece che in una risposta pulita.
3. In sessione non c'è una commessa: in questo caso la risposta non è vuota, ma dice «User not allowed».

Il limite di questa sezione è di perimetro. `json.php` e le altre porte storiche servono la produzione e non sono guaste; il capitolo non ne pianifica la riscrittura. `json_admin.php` è dello staff tecnico (capitolo 12). Le action dell'assistente Gea, servite da `json.php` prima dello smistamento normale e senza sessione del browser, sono del capitolo 15.

Un'action nuova è un metodo pubblico di un controller, con il nome dell'action, che restituisce una stringa JSON e non stampa nulla.

## La commessa nel codice: quando entra l'override, e mappature.php

*Per gli sviluppatori.*

L'ordine degli override è nel capitolo 2: per la configurazione la commessa vince sul tipo, che vince sul comune; per le classi la commessa vince sul comune, senza livello intermedio; `custom.js` è composto da due pezzi; i modelli di pagina non hanno override. Qui interessa un'altra domanda: in quale momento la classe della commessa prende il posto di quella comune, e per quanto tempo.

La risposta sta in `ClassiCustom::carica()`. L'autoloader risolve una classe la prima volta che viene usata in un processo, guardando la commessa aperta in quel momento, cioè `GOPlanner::$account`. L'ordine è `custom/<tenant>/php/<Classe>.php`, poi `lib/class<Classe>.php`, poi `lib/<Classe>.php`, poi `lib/jobs/<Classe>.php`. Da quel momento, nel processo, il nome `Intervento` indica quel file e nessun altro. Il docblock di `lib/ClassiCustom.php` lo scrive senza attenuanti: «In PHP una classe caricata non si scarica ne' si ridefinisce». Nel web la regola non fa danni: ogni richiesta apre una commessa e muore. Anche `$custom`, l'array globale della configurazione, si riempie all'avvio e da lì in poi non cambia; le chiavi che `index.php` e `config.inc.php` leggono direttamente sono `menu`, `logo`, `forza_intervento` e `chatbot_enabled`. Il pericolo è un processo che serve più commesse.

### Il caso GOP-687: un processo per lavoro

Quel processo esisteva, ed era il worker. Il caso è GOP-687, chiuso il 5 novembre 2026. Il problema: un'esportazione di una commessa falliva con «Undefined constant Intervento::codici_note_lettura». La causa, nelle parole del ticket: «`worker.php` è un unico processo PHP che esegue in fila i Job di tutti i tenant», e «una classe caricata resta per tutta la vita del processo: la prima `Intervento` caricata (di un altro tenant) serve anche i Job» delle commesse successive. L'errore era la parte fortunata. Lo dice lo stesso ticket: «Dove le classi dei due tenant hanno gli stessi nomi, il Job non fallisce ma gira con la logica dell'altro tenant, senza avviso.» Le regole di una commessa applicate ai dati di un'altra, e nessun messaggio.

La correzione, decisa il 4 novembre, è la «Scelta 1» del ticket: un processo figlio per ogni lavoro. Il worker resta acceso con la sua connessione Redis; per ogni lavoro estratto lancia `worker_job.php`, che riceve il lavoro come JSON sullo standard input e scrive l'esito su un canale separato, il descrittore 3. Il figlio nasce con exec (`proc_open`), non con fork, e il docblock di `Queue::processInFiglio` spiega perché: «un fork erediterebbe le classi gia' caricate dal padre e i suoi socket di database e Redis; un exec parte vuoto e apre connessioni sue. Il padre tiene solo la connessione Redis della coda e non carica mai un tenant.» Quando il lavoro finisce il figlio esce, e la memoria e le classi della commessa spariscono con lui. È il comportamento predefinito: `Queue::$sottoprocesso = true`.

La correzione ha avuto un effetto collaterale istruttivo. Il figlio parte vuoto, e `config.inc.php` non carica l'autoloader di composer. Un lavoro che usava una libreria di `vendor/`, il riepilogo mensile in xlsx a flusso di GOP-686, è fallito con «Class OpenSpout\Writer\XLSX\Options not found» finché `worker_job.php` non ha caricato `vendor/autoload.php` da sé. Il commento nel file pone una condizione da non dimenticare: composer registra il suo loader in testa, davanti a `goplannerAutoload`, ed «e' sicuro solo perche' composer non conosce nessuna classe dell'applicazione (niente custom/ ne' lib/ nel suo PSR-4 o nella classmap): se un giorno ne conoscesse una, caricherebbe quella al posto della classe del tenant e la guardia non scatterebbe.»

La guardia è il terzo pezzo. Per ogni processo che non sia il figlio del worker resta `ClassiCustom::verifica()`, chiamata da `Queue::runJob`. Se un processo ha già caricato le classi di un'altra commessa, il lavoro non parte e il messaggio è esplicito: «Classi personalizzate di un altro tenant gia' caricate in questo processo: classe *X* caricata da *A*, Job di *B*. Il Job non viene eseguito per non usare la logica di un altro tenant.» Il commento in `Queue::runJob` chiarisce quando scatta: «Con un figlio per Job non scatta mai; scatta se un processo ha mescolato i tenant». La modalità nel processo corrente, `Queue::$sottoprocesso = false`, è rimasta solo per i test.

«Perché non tenere acceso un solo processo che cambia commessa a ogni lavoro? Sarebbe più veloce.» Forse, ma un autoloader diverso non risolverebbe nulla, e il ticket lo dice in una riga: «Il caricatore da solo non basta». I namespace per commessa sono stati presi in esame e rimandati. Quanto costi un processo per lavoro non è scritto: GOP-686 chiedeva di misurare memoria e tempo, ma i valori non sono registrati in Jira. Il costo è stato accettato senza una cifra, in cambio di una garanzia.

> **Per lo staff tecnico:** il padre, `worker.php`, tiene in memoria il proprio codice. Dopo un rilascio i worker della coda vanno riavviati, come registra la procedura di rilascio nel Portolano.

### Il file mappature.php

Il capitolo 4 e il capitolo 7 hanno rinviato qui la struttura di `mappature.php`. Il file sta in `custom/<db>/php/mappature.php` e, se esiste, anche in `custom/<dbtype>/php/mappature.php`. A leggerlo è il costruttore di `Configurazione` (`lib/Configurazione.php`, righe 34-48), che include prima il file del tipo e poi quello della commessa e assegna `$this->mappature = $mappatura ?? null;`. La variabile si chiama dunque `$mappatura`, non `$custom['mappature']` come scrive `docs/01-foundations/04-configuration-priority.md`. Nel repository ci sono 72 file `mappature.php`; quello di `custom/default/php/` è vuoto, quattro righe.

Ogni chiave di `$mappatura` è una voce. Le chiavi interne più frequenti, contate su tutti i file, sono `model` (321 volte), `formato` (310), `colModel` (281), `separatore` (130), `action` (121), `dataModel` (114), `firstRow` (98) e `template` (70). Una colonna di `colModel` è `array('campo' => …, 'indice' => N, 'etichetta' => …)`; alcune commesse usano `label`, `pos` e `lunghezza`. Queste sono alcune righe reali dal file di una commessa, scelte senza dati del committente (nel file, `colModel` ha 35 colonne):

```php
$mappatura['input'] = [
    'model' => 'Import',
    'formato' => 'xls',
    'separatore' => ';',
    'colModel' => [
        array('campo' => 'installazione', 'indice' => 0, 'etichetta' => 'Installazione'),
        array('campo' => 'pod', 'indice' => 7, 'etichetta' => 'POD'),
        array('campo' => 'codice', 'indice' => 7, 'etichetta' => 'POD'),
    ]
];
$mappatura['output'] = [
    'model' => 'Export', 'action' => 'export', 'dataModel' => 'InterventoEseguito',
    'formato' => 'xls', 'template' => 'Teleriscaldamento.xlsx', 'firstRow' => 2,
    // …
```

Il frammento mostra anche una libertà del formato: due campi, `pod` e `codice`, leggono la stessa colonna, la 7.

Chi decide se una voce è di importazione o di esportazione è `MappaturaImport::isEsportazione()`. Una voce è un'esportazione se `model` vale `Export` o `FotoExport`, oppure se `action` comincia con `export` o `esporta`, oppure se c'è `dataModel`, oppure se la chiave finisce in `_out` o contiene `_OUT_`. Tutte le altre sono importazioni: `MappaturaImport::modelliDiSistema()` le trasforma nei «modelli di sistema» di File › Importazione, con id `sistema:<chiave>` (capitolo 4). Il lato esportazione lo leggono `MappaturaEsportazione` e `EsportazioneModelli`, che ne fanno le schede di File › Esportazione, «una scheda per mappatura di mappature.php» (capitolo 7).

La differenza con i modelli salvati è di natura, non di forma. I modelli salvati dall'ufficio sono righe del database della commessa, nelle tabelle `mappature_import` (migrazione 0012) e `mappature_export` (migrazione 0039), e cambiano senza un rilascio. I modelli di sistema restano in sola lettura dalla pagina, si possono duplicare, e cambiano solo con una modifica al codice e un rilascio (capitolo 16). Per scrivere o correggere un `mappature.php` ci sono due ricette: `docs/03-cookbooks/02-create-import-export-map.md` e `docs/03-cookbooks/14-mappature-file-per-agent-coder.md`.

L'override si risolve per processo, non per chiamata: un test o uno script che apre due commesse nello stesso processo riceve le classi della prima, a meno che `ClassiCustom::verifica()` non lo fermi. I modelli di pagina non hanno override per commessa (capitolo 2). E `mappature.php` è codice: lo cambia uno sviluppatore o lo staff tecnico, con un rilascio; l'ufficio cambia i modelli salvati (capitoli 4 e 7).

Un processo, una commessa: la classe della commessa si sceglie al primo uso e non si cambia più fino alla fine del processo.

## Il lavoro che dura: coda, worker, Giro e avanzamento

*Per gli sviluppatori e lo staff tecnico.*

Un lavoro che dura più di una risposta deve restare visibile anche dopo che la pagina che l'ha avviato si è chiusa. Prima della regola del pattern 47 non era così: chiuso il modale o cambiata pagina, «l'utente perde il lavoro di vista e non sa quando finisce». Questa sezione segue quel lavoro da chi lo accoda a chi lo esegue, fino al momento in cui l'utente lo vede finire.

`lib/Queue.php` si presenta con una riga: «A simple Redis-backed job queue.» `Queue::add(Job $job, $coda = null)` mette in fondo a una lista Redis (`rpush`) un JSON con tre campi, `classe`, `parametri` e `context`. Le liste sono due: `job_queue` (`CODA_PREDEFINITA`) e `job_giro` (`CODA_GIRO`, «letta da un worker dedicato (QUEUE_NAME=job_giro), un Job alla volta»). I lavori ritardati vanno in un insieme ordinato, `job_queue:ritardati`, con `addDelayed(Job, int $secondi)`; li sposta nella coda `promuoviRitardati()`, a ogni giro e solo nel worker di `job_queue`. Nel codice ci sono 34 punti che accodano con `Queue::add(`. `worker.php` legge `QUEUE_NAME` (assente vuol dire `job_queue`) e chiama `Queue::lavora()`: promuove i ritardati, estrae con un'attesa bloccante di 2 secondi (`ATTESA_CODA`) ed esegue, finché non arriva `spegni()`. Ogni lavoro gira in un figlio, come si è visto nella quarta sezione. Prima di eseguire, `Queue::ammettiTenant()` (GOP-703) controlla la commessa: l'account segnaposto `v3_non_autenticato` «Non e' un tenant», e un lavoro per una commessa assente da `goplanner.clienti` viene scartato con un errore esplicito. Il ticket nacque dai lavori di registrazione delle richieste `/v3` non autenticate, che cercavano un database `goplanner_v3_non_autenticato` che non esiste.

Il worker si ferma in modo ordinato, e la strada per arrivarci è il caso GOP-704. A ogni rilascio il lavoro in corso veniva ucciso. Mancava l'estensione `pcntl` nell'immagine, e il segnale che Docker e Swarm mandano davvero è SIGWINCH, lo STOPSIGNAL dell'immagine php:apache, che PHP come PID 1 ignorava fino al SIGKILL. Dall'8 novembre 2026 `pcntl` è nelle immagini e `Queue::installaSpegnimentoOrdinato()` registra `spegni()` su SIGTERM, SIGINT e SIGWINCH: il lavoro in corso finisce, nessun altro viene estratto, e il worker scrive «Queue worker fermato.» Il limite di tempo di un lavoro viene da `QUEUE_JOB_TIMEOUT`, in secondi; superato, il figlio riceve SIGTERM e dopo 10 secondi SIGKILL, e l'esito dice «Job oltre il tempo massimo di {N} secondi, processo figlio terminato».

| Processo | Che cosa fa | Coda o orario | Dove si vede |
|---|---|---|---|
| `worker.php` (predefinito) | esegue i lavori, ciascuno in un figlio | `job_queue` | avanzamento nella pagina e segnalibro |
| `worker.php` con `QUEUE_NAME=job_giro` | esegue i lavori del Giro delle attività automatiche, uno alla volta | `job_giro` | Admin › «Giro» (capitolo 12) |
| `scheduler_giro.php --ciclo` | calcola i lavori dovuti e li accoda; non esegue nulla | ogni 5 minuti | Admin › «Giro» |
| `cron.php` → `cron_worker.php --tenant=<db>` | storico: giro giornaliero per commessa attiva; fermo su `php8` | cron di sistema | — |
| `ws_server/index.js` | inoltra l'avanzamento dei gruppi di lavori `Batch` | canale Redis `batch_progress` | pagina Admin (sesta sezione) |

> **Attenzione:** in questa sezione «Giro» è sempre il Giro delle attività automatiche (Admin › «Giro», GOP-656). `scheduler_giro.php`, la coda `job_giro` e `GiroRegistro` non hanno nulla a che fare con il giro quotidiano dell'operatore.

`cron.php` è ancora nel repository, e il suo commento lo descrive come «Entry point per il cron system»: per ogni commessa attiva lancia `php cron_worker.php --tenant=<codice>` e, alla fine, cancella le anomalie dell'app GOPlanner 3 più vecchie di 12 mesi (GOP-457). Ma su `php8` `cron_worker.php` si ferma con un TypeError su `SimpleOrm::useConnection(MySqlWrapper)`, e non per una svista: le decisioni di GOP-656 del 3 novembre 2026 lo dicono «fermi su php8, da non riparare». Il suo posto lo prende lo schedulatore del Giro, che il pattern 44 definisce così: «Uno schedulatore leggero da riga di comando, ogni 5 minuti, calcola i Job dovuti e li accoda con una chiave di deduplica, senza eseguire nulla». La semantica è «almeno una volta». Per l'avvio manuale c'è `--avvia=<attivita> --tenant=<db> --periodo=<…>`, con «stessa coda, stessa deduplica».

### Avanzamento, modale, segnalibro

La regola di progetto, decisa il 10 novembre 2026 con GOP-743 e scritta nel pattern 47, ha tre parti. Ogni lavoro asincrono ha un avanzamento sul contratto comune `AvanzamentoJob`, con il tipo registrato in `AvanzamentoJob::TIPI` e il suo `titolo`. Ha un modale, proprio o generico (`GopJobProgress` più l'esito). E ha un segnalibro, che si ottiene passando l'id dell'utente ad `avvia()`. Il testo del pattern non lascia margini: «Un nuovo lavoro asincrono non si accetta in revisione senza le tre parti.»

Il contratto (GOP-529) tiene lo stato in Redis, per commessa, tipo e id, senza tabella. Il lavoro scrive con `avvia()` quando il chiamante lo accoda, con `aggiorna()` mentre lavora e con `chiudi()` alla fine; la pagina legge con `json.php?action=job_stato` e chiede di fermarlo con `job_annulla`. I tipi sono sette, e l'elenco è chiuso per una ragione di sicurezza scritta nel codice: «l'endpoint rifiuta tutto il resto, cosi' la chiave Redis non si costruisce mai da un input libero».

| Tipo | Titolo | Annullabile | Permesso |
|---|---|---|---|
| `esportazione` | «Esportazione» | no | nessuno |
| `geocodifica_utenze` | «Geocodifica» | sì | `utenze.modificare` |
| `riepilogo_mese` | «Riepilogo mensile» | no | `rapporti.estrarre_mensile` (una commessa, GOP-654) |
| `importazione` | «Importazione» | sì | `interventi.importare` (con `allarme_fermo`, GOP-745) |
| `campo_nuovo` | «Nuovo campo» | no | `interventi.importare` (GOP-770) |
| `analisi_ai_data` | «Analisi AI foto» | no | nessuno (GOP-842) |
| `chiusura_cassettinaggio` | «Chiusura cassettinaggio» | sì | `interventi.modificare` (una commessa) |

Il segnalibro vive nella chiave `job_segnalibri:{account}:{id_utente}`: un lavoro avviato con l'id dell'utente entra solo nella pila di quell'utente, nel menu laterale. La pila mostra al massimo 4 lavori, poi «+N altri lavori», e ne conserva al massimo 50. I colori sono tre: giallo per un lavoro in corso o «In attesa», verde per uno completato, rosso per uno non riuscito o «Fermo»; un lavoro annullato sparisce subito. La pagina non riceve notifiche, interroga. `js/code/job-progress.js` chiede `job_stato` ogni 2 secondi, ogni 4 dopo un errore di rete («Connessione al server persa: riprovo.»); `js/code/job-segnalibri.js` aggiorna la pila ogni 3 secondi finché c'è un lavoro aperto, ogni 60 secondi se i soli aperti sono fermi, e non fa richieste se non c'è nulla di aperto. Uno stato aperto dura un giorno, rinnovato a ogni `aggiorna()`; uno chiuso, sette giorni. Dopo 30 minuti ancora in coda (`SCADENZA_ATTIVO`) il lavoro diventa «Fermo».

### Aggiungere un lavoro asincrono

I passi vengono da `docs/03-cookbooks/32-agganciare-un-job-alla-barra-di-avanzamento.md`.

1. Scrivi la classe in `lib/jobs/`, estendendo `Job` (`abstract class Job`, con `abstract public function run();`).
2. Registra il tipo in `AvanzamentoJob::TIPI`, con `titolo`, `permesso` e `annullabile` (true solo se il lavoro controlla davvero l'annullamento).
3. Nell'action che accoda, genera l'id (`$id = bin2hex(random_bytes(8))` o un id esistente) e chiama `AvanzamentoJob::avvia('mio_job', $id, null, 'In coda', AvanzamentoJob::utenteCorrente())`.
4. Subito dopo, chiama `Queue::add(new MioJob(['id_job' => $id], JobContext::capture()))` e restituisci `json_encode(['success' => true, 'id' => $id])`. Se ci deve essere un solo lavoro per commessa, usa `idAttivo()` e `registraAttivo()`.
5. Nel `run()`, aggiorna con `aggiorna()` (al massimo una scrittura al secondo), controlla `annullamentoRichiesto()` fra un'unità di lavoro e l'altra e chiudi con `chiudi()` e `COMPLETATO`, `ANNULLATO` o `FALLITO`.
6. Nella pagina, chiama `GopJobProgress.segui({tipo, id, contenitore, etichette, onFine})` e `GopJobProgress.ferma(...)` alla chiusura; per il modale da ogni pagina, `GopSegnalibri.registraModale(tipo, {...})` in `js/code/job-segnalibri.js`.
7. Aggiungi le action interrogate spesso a `$logBlacklist` in `json.php`.
8. Non scrivere gli errori da te: ogni fallimento va al registro centrale degli errori della commessa tramite `BaseErrorHandler::erroreJob()` (`docs/03-cookbooks/35-errori-dei-job-in-background.md`; lettura nei capitoli 12 e 16).
9. Scrivi i test PHPUnit sul modello di `tests/AvanzamentoJob_Test.php` e `tests/AvanzamentoJobSegnalibri_Test.php`; la modalità nel processo corrente, `Queue::$sottoprocesso = false`, si usa solo lì.
10. Controlla il risultato nel browser.

«L'esportazione resta "In attesa" da dieci minuti.» La risposta comincia dal significato della parola: «In attesa» vuol dire che il lavoro è ancora in coda: nessun worker lo ha preso. O il worker di quella coda non gira, o è occupato con un lavoro lungo. Per l'importazione c'è un allarme: se il lavoro è ancora in coda dopo 30 minuti, `AvanzamentoAllarme::inCodaDaTroppo()` manda allo staff un avviso intestato «ALLARME lavoro non parte», una volta per lavoro, ed è «la stessa condizione per cui il segnalibro diventa rosso "Fermo"». Se un worker muore mentre esegue un'esportazione, il registro la chiude con «Esportazione interrotta: il lavoro non dava piu' segni di vita (worker riavviato o fermo). Riprovare.» Da un ramo di sviluppo, però, nulla di tutto questo si ripara.

> **Quando chiedere allo staff tecnico:** lo stato dei servizi dei worker, la lunghezza delle code in Redis, un lavoro che non finisce mai, un allarme «ALLARME lavoro non parte». Il registro del Giro è nel capitolo 12; i servizi nel capitolo 16.

Il codice dichiara da sé i limiti del meccanismo. Non tutti i tipi sono annullabili, e l'annullamento non è istantaneo: il lavoro lo vede solo quando controlla `annullamentoRichiesto()`, fra un'unità e l'altra. Per l'importazione la finestra di annullamento è di 24 ore (`ORE_ANNULLAMENTO`). Il pattern 08 avverte che l'estrazione con `BLPOP` toglie il lavoro dalla coda prima di eseguirlo, quindi «un worker morto lo perde senza ritento». Senza `pcntl` il worker predefinito si ferma subito al SIGTERM, anche se il lavoro in corso, nel suo figlio, «finisce comunque»; il worker dedicato a `job_giro`, invece, senza `pcntl` non parte affatto, «cosi' con restart: always il guasto si vede subito». Per impostazione predefinita non c'è un limite di tempo ai lavori. `AvanzamentoAllarme` stesso ammette che «un controllo periodico indipendente dalle pagine aperte non c'e' ancora». E lo schedulatore accoda e non esegue: senza un worker su `job_giro` i lavori dovuti restano in coda, e che cosa mostri allora Admin › «Giro» è una domanda per lo staff tecnico.

> **Per lo staff tecnico:** per i flussi di questo capitolo devono girare `app` (il web), `redis`, `queue-worker` (coda `job_queue`), il worker del Giro `queue-giro` (`QUEUE_NAME: job_giro`, periodo di grazia 10 minuti) e lo schedulatore `scheduler-giro` (periodo di grazia 2 minuti), più `ws-server`, che serve solo i contatori dei `Batch` nella pagina Admin. `queue-giro` e `scheduler-giro` compaiono solo nel file compose dev/api; quali servizi girino in produzione è del capitolo 16.

Ciò che dura più di una risposta va in coda, gira in un processo suo e si fa vedere all'utente con avanzamento, modale e segnalibro.

## Nel browser: script delle pagine, asset e websocket

*Per gli sviluppatori.*

Nel browser gira poco codice, ma passa tutto dallo stesso imbuto. Gli script delle pagine stanno in `js/code/`, uno per pagina o per funzione. Nessuno di loro è servito direttamente: la riga 12 di `js/code/.htaccess` riscrive ogni `js/code/<nome>.js` in `js.php?source=<nome>`. `js/code/js.php` accetta come `source` solo il nome di un file di `js/code/` o del suo override in `custom/<tenant>/js/`: «niente percorsi, quindi nessun file di un altro tenant raggiungibile con ../». Lo stesso file assembla `custom.js` in due pezzi (capitolo 2). La documentazione `08-ui-ux-architecture.md` parla di un `js/js.php?file=…`, che non esiste.

Le librerie le carica l'intestazione, `Smarty_templates/it/_header.html`, alle righe 72-95. jQuery è la 1.8.3, da una CDN pubblica; per le mappe c'è Leaflet 1.9.4, con markercluster 1.4.1 e heat 0.2.0; poi `library-base.js`, `library-ui.js`, `library.js`, e jQuery UI con `jquery-ui-timepicker-addon.js` solo se `{{if $jquery_ui}}`. Il valore predefinito è true, e le pagine che non usano jQuery UI lo spengono con `{{assign var=jquery_ui value=false}}` (GOP-496). Nella cartella `js/` ci sono copie più vecchie, `jquery-1.4.2` e `jquery-ui-1.8.7`, ma nell'intestazione sono commentate: conta solo ciò che `_header.html` carica.

Gli indirizzi degli asset portano una versione. Fino a GOP-624 i modelli avevano `?v=1.24` scritti a mano; oggi `{{asset path="/css/ui.css"}}` diventa `/css/ui.css?v=1a2b3c4d`, otto caratteri calcolati da `lib/AssetUrl.php`. Il docblock della classe e il titolo del ticket parlano di versione «calcolata dal contenuto del file», ma l'implementazione fa altro: un `md5` della data di modifica e della dimensione del file, «nessuna lettura del contenuto». Un file modificato cambia indirizzo, e il browser non può tenersi la copia vecchia. Per questo gli asset si possono tenere in cache a lungo:

| Che cosa | Cache | Nota |
|---|---|---|
| pagine (`index.php`) | `no-store` | seconda sezione |
| asset con `{{asset path=…}}` | 24 ore (`Cache-Control: max-age=86400`) | `private` per i file di una commessa |
| Leaflet e font | 30 giorni | GOP-624 |
| override `custom/<tenant>/js/<nome>.js` | 24 ore | indirizzo `…?t=<tenant>&v=<versione>` |
| `custom.js` | 24 ore | `/js/code/custom.js?t=<tenant>&v=<versione>`; se `t` non è la commessa della sessione, 403 e mai in cache |

Il websocket ha un compito solo. `ws_server/index.js` è un piccolo server Node con Socket.io (`^4.8.3`) e ioredis. Si abbona al canale Redis `batch_progress`; i browser entrano con l'evento `join` nella stanza di un `batch_id`; per ogni messaggio che porta un `batch_id` il server emette `progress` a quella stanza. A pubblicare sul canale è `lib/Batch.php`, in due punti, quando un `Batch` (un gruppo di lavori lanciato con `Batch::dispatch()`) avanza. I `Batch` si creano in `ADMINController`, in `AdminBase`, in `AnalisiAiServizio` e nelle action di `JSONController` che analizzano più foto insieme (`analyze_batch_photos`, `start_photo_batch`). Il consumatore, nei modelli e negli script, è uno solo: `Smarty_templates/it/admin.html`, che carica il client Socket.io e mostra «@@Completati@@ n / totale (x%)».

L'avanzamento dei lavori dell'utente, quello della quinta sezione, non passa dal websocket: interroga `job_stato`. Eppure `docs/01-foundations/01-architecture-rules.md` scrive di «Monitoraggio dei job asincroni e del batching tramite WebSocket (`ws_server`) e Redis», e il pattern 17 dice che i lavori tracciano l'avanzamento «in real-time via WebSocket» e attribuisce la pubblicazione a `lib/Queue.php`. Sul ramo `php8` non è così. Pubblica `Batch`, e i lavori in coda si seguono a polling. GOP-124 lo conferma da un altro lato: lo streaming della chat «non riusa `ws_server`/socket.io (riservato al progress dei job batch)». Nessun ticket prevede di spostare l'avanzamento sul websocket.

«Ho cambiato un file JavaScript e il browser carica ancora il vecchio.» La prima cosa da controllare è come il modello carica lo script:

- se passa da `{{asset path=…}}`, l'indirizzo cambia con la data di modifica e la dimensione del file, e il browser chiede la versione nuova; oggi nessun modello di `Smarty_templates/` carica uno script di `js/code/` con un indirizzo scritto a mano;
- se il file cambiato è `custom.js`, la sua versione dipende dai file che lo compongono e la sua cache dura 24 ore (capitolo 2);
- se lo script è caricato da un percorso fisso aggiunto da poco, il problema è lì.

Se il ws-server non gira o il client Socket.io non si carica, la console scrive «Unable to load socket.io client for batch tracking.» e la barra del `Batch` nella pagina Admin non si aggiorna: in `admin.html` non c'è un polling di ripiego. I lavori però girano lo stesso, e l'avanzamento dei lavori dell'utente non ne risente. Se il ws-server sia acceso in produzione non risulta dalle fonti: è una domanda per lo staff tecnico e per il capitolo 16.

Nel browser, uno script vive in `js/code/`, arriva da `js.php` e cambia indirizzo quando cambia il file; il websocket serve solo i `Batch` della pagina Admin.

Prima di scrivere la prima riga di codice nuovo si sceglie la porta: una pagina in `pages/`, un'action pubblica di un controller, una rotta di GOPlanner 3 o un lavoro in coda. La porta decide chi può entrare, quale commessa è aperta quando il codice gira, quanto a lungo il lavoro può durare e dove l'utente lo vedrà finire. L'esportazione delle foto è passata da due porte: come action sincrona lasciava la pagina ferma su «In attesa» e produceva uno ZIP in più a ogni clic; come lavoro in coda risponde subito con un id che la pagina può seguire.

## Fonti

- codice: `index.php`, `json.php`, `json_admin.php`, `json_android.php`, `api.php`, `admin.php`, `cron.php`, `cron_worker.php`, `worker.php`, `worker_job.php`, `scheduler_giro.php`, `config.inc.php` (solo autoloader, inclusioni, menu, buffer), `smarty.inc.php`, `.htaccess`, `api/.htaccess`, `js/code/.htaccess`
- codice: `lib/JSONController.php`, `lib/ImportazioneController.php`, `lib/AdminRequestGuard.php`, `lib/MobileRequestGuard.php`, `lib/ClassiCustom.php`, `lib/Queue.php`, `lib/Job.php`, `lib/GOPlanner.php`, `lib/AvanzamentoJob.php`, `lib/AvanzamentoAllarme.php`, `lib/Configurazione.php`, `lib/MappaturaImport.php`, `lib/MappaturaEsportazione.php`, `lib/EsportazioneModelli.php`, `lib/EsportazioneRegistro.php`, `lib/ImportazioneRegistro.php`, `lib/ImportazioneEsecuzione.php`, `lib/ImportazioneLavoro.php`, `lib/jobs/ImportazioneJob.php`, `lib/DizionarioVoce.php`, `lib/AssetUrl.php`, `lib/Batch.php`, `lib/MobileV3/TenantBootstrap.php`, `lib/Permessi.php`
- codice: `pages/interventi.php`, `pages/admin.php`, `pages/carichi.php`, `Smarty_templates/it/_header.html`, `Smarty_templates/it/admin.html`, `Smarty/Smarty.class.php`, `js/code/js.php`, `js/code/esportazione.js`, `js/code/job-progress.js`, `js/code/job-segnalibri.js`, `ws_server/index.js`, `ws_server/package.json`, `docker-compose.yml`, `docker-compose.dev-api.yml`, `Dockerfile-8`
- docs: `docs/01-foundations/01-architecture-rules.md`, `docs/01-foundations/02-project-structure-map.md`, `docs/01-foundations/04-configuration-priority.md`, `docs/01-foundations/08-ui-ux-architecture.md`, `docs/02-patterns/05-controller-pattern.md`, `docs/02-patterns/08-async-job-queue-pattern.md`, `docs/02-patterns/11-admin-routing.md`, `docs/02-patterns/17-job-batching-and-websocket.md`, `docs/02-patterns/33-buffer-output-globale-gestore-errori.md`, `docs/02-patterns/44-giro-giornaliero-a-job.md`, `docs/02-patterns/47-ogni-job-asincrono-avanzamento-modale-segnalibro.md`, `docs/03-cookbooks/02-create-import-export-map.md`, `docs/03-cookbooks/14-mappature-file-per-agent-coder.md`, `docs/03-cookbooks/32-agganciare-un-job-alla-barra-di-avanzamento.md`, `docs/03-cookbooks/35-errori-dei-job-in-background.md`, `docs/diagramma_override_multi_tenant.md`, `docs/diagramma_flusso_web_mvc.md`, `docs/mobile-v3/stato-e-regole-2026-10-12.md`
- Portolano: `goplanner-worker-classi-tenant-processo-figlio`, `goplanner-rilascio-dev-macchinista`
- Jira: GOP-107 — switchTenant() come unico punto che scrive la commessa in sessione
- Jira: GOP-112 — Rbac::can() e gate in modalità log-only
- Jira: GOP-124 — streaming della chat senza ws_server
- Jira: GOP-238 — esportazione sempre in coda per il modello standard
- Jira: GOP-249 — Gestore errori: schermata Industry in produzione, dettaglio PHP solo in locale
- Jira: GOP-275 — cancello in cima a json_admin.php
- Jira: GOP-294 — json_admin.php solo per lo staff tecnico
- Jira: GOP-457 — pulizia delle anomalie dell'app più vecchie di 12 mesi
- Jira: GOP-496 — jQuery UI caricato solo dove serve
- Jira: GOP-529 — barra di progresso dei job asincroni nel back office
- Jira: GOP-601 — Gestione utenti dentro Admin, mostrata per permesso
- Jira: GOP-624 — strategia di cache: pagine no-store, asset versionati, custom.js per commessa
- Jira: GOP-628 — motore unico delle operazioni: API REST e server MCP
- Jira: GOP-629 — telaio del motore delle operazioni e porta MCP con OAuth
- Jira: GOP-647 — esportazioni in coda e link
- Jira: GOP-654 — voce «Report» per l'estrazione mensile
- Jira: GOP-656 — cron_worker.php e Giro giornaliero a lavori
- Jira: GOP-664 — inventario dei punti d'ingresso
- Jira: GOP-686 — riepilogo mensile in coda con scrittura a flusso
- Jira: GOP-687 — classi personalizzate di una commessa caricate per i lavori delle altre
- Jira: GOP-689 — scrittura sicura delle etichette nel dizionario
- Jira: GOP-703 — lavori delle richieste v3 non autenticate senza database
- Jira: GOP-704 — estensione pcntl per lo spegnimento ordinato dei worker
- Jira: GOP-712 — Novità: campanella nella barra in alto e pagina Novità
- Jira: GOP-743 — segnalibri dei lavori in background
- Jira: GOP-745 — importazione sempre asincrona e annullabile
- Jira: GOP-758 — Ticketing 2/4: sezione Ticket nel back office
- Jira: GOP-767 — voce Magazzino con il magazzino v3
- Jira: GOP-770 — Campo nuovo dell'importazione
- Jira: GOP-842 — Cruscotto Analisi AI: avanzamento, storico dei lanci e data in formato italiano
- Jira: GOP-855 — profilo Magazziniere e postazione del back office
