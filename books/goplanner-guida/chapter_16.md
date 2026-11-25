# 16. Operazioni, qualità e rilasci

*In questo capitolo si segue una modifica dal ticket Jira che la chiede fino al servizio che la esegue in produzione, e per ogni tappa si dice quale strumento la governa e quale prova lascia. È scritto per gli sviluppatori, per gli agenti di codice e per lo staff tecnico che rilascia. Chi legge per l'ufficio trova nella sezione 4 che cosa arriva alla pagina Novità e può saltare il resto.*

## Il percorso di una modifica, e le prove che lascia

*Per gli sviluppatori e per lo staff tecnico che rilascia.*

Fra il 16 e il 31 ottobre 2025 il canale dei registri mobili si è spento per quasi tutte le commesse. Il 9 settembre 2026, quando qualcuno ha contato, risultavano ferme 28 commesse su 29 fra quelle con il canale web attivo negli ultimi 30 giorni. Per dieci mesi nessuno se n'era accorto. Poi la prima diagnosi, plausibile e sbagliata, ha dato la colpa a servizi rimasti su un'immagine vecchia; la causa vera è stata confermata solo il 29 settembre 2026, quando dopo la correzione i registri sono tornati ad arrivare. La storia insegna la stessa regola due volte, prima sul sistema e poi su chi lo indagava: una tappa è finita quando la sua prova lo dice, non quando il comando è terminato senza errori o la spiegazione suona giusta. Il rischio dell'immagine vecchia è nella sezione 5; la causa, e il controllo che avrebbe visto il silenzio il giorno dopo, nella sezione 6.

Una modifica attraversa tappe distinte, e ognuna ha uno strumento e un segno che resta. Nessuna di queste prove si deduce dalla precedente. Si legge.

| Tappa | Strumento | Prova che resta | Sezione |
|---|---|---|---|
| Ticket | Jira, progetto GOP | la chiave `GOP-NNN`, la descrizione con «Criteri di accettazione» e «Verifica», i commenti con lo SHA del commit e l'output reale | 2 |
| Copia di lavoro e stack locale | git worktree, Docker Compose, `scripts/run-tests-worktree.sh` | container che appartengono solo a quella copia | 3 |
| Test | PHPUnit, `scripts/with-throwaway-mysql.sh`, script headless, target browser | l'output incollato nel commento Jira | 4 |
| Merge request | pipeline GitLab (solo test), cartella `changeset/` | la pipeline verde e un file di changeset, oppure l'etichetta «nessun changeset» | 4 |
| Unione | ramo `php8`, cherry-pick su `master` per la linea più vecchia | lo SHA del commit | 5 |
| Pubblicazione | `make publish_app` | due tag: il canale e lo SHA del commit | 5 |
| Rilascio | `make deploy_app` per l'immagine principale, `make release_api COMMIT=<sha>` per la cartella dell'API | l'immagine che il servizio esegue, oppure `.rilascio/COMMIT` con il manifesto | 5 |
| Migrazioni | `php scripts/migrate.php` | le righe in `schema_migrations`, con il checksum | 5 |
| Osservazione | `make app_image_digests`, CloudWatch, `scripts/check_canale_log.php` | impronte che coincidono, canali che continuano a scrivere | 6 |
| Chiusura | stato del ticket Jira «Completata» | il commento di chiusura con la verifica eseguita | 2 |

### Due linee, quattro vie

Il repository ha due linee di rilascio. `php8` è il ramo di integrazione e gira su PHP 8.3 dal passaggio del 30 luglio 2026; `master` è la linea più vecchia, su PHP 7.3, e riceve le modifiche con un cherry-pick. La cartella `migrations/` è identica sulle due linee, e un changeset viaggia insieme al suo cherry-pick. In produzione il servizio della linea `php8` serve il back office nuovo, mentre i servizi storici, che seguono il tag `latest`, servono ancora il traffico dell'app 1.x. Al 25 novembre 2026 la divisione passa anche per le commesse: alcune sono ancora servite dalla linea `master`, altre passano a `php8` una alla volta, insieme a GOPlanner 3, ciascuna con un suo ticket Jira (per esempio GOP-810). Per questo la parte tecnica di un changeset può avvertire che la modifica diventerà visibile in una commessa solo con il suo passaggio a `php8` (GOP-777).

Le vie di rilascio sono quattro: l'immagine principale dell'applicazione; la cartella che serve l'API del call center e il server di sviluppo, che non ha un'immagine sua; l'immagine del servizio di Gea; il manifesto firmato dell'app GOPlanner 3. La sezione 5 le descrive una per una.

«La pipeline è verde e la merge request è unita: la modifica è in produzione?» No. Per una decisione del 14 ottobre 2026 la pipeline esegue solo test e controlli, senza segreti, e i rilasci restano fuori dalla CI; la prima riga di `.gitlab-ci.yml` lo dice, «CI di GOPlannerWeb: solo test». L'unione mette il commit su `php8`, e basta. La produzione cambia dopo la pubblicazione e il ri-aggancio, e la prova è l'immagine che il servizio esegue davvero.

Il repository non contiene tutta l'infrastruttura. Il file dello stack Swarm vive solo sul server e non viene mai rilasciato; il proxy davanti ai servizi è dichiarato «non visibile da questo repo» in `tasks/php84-rollout.md`; gli allarmi CloudWatch sul canale mobile sono descritti come da costruire «fuori da questo repository». Anche `make deploy_app` esegue un comando fornito da chi rilascia, che il `Makefile` di proposito non scrive. Questo capitolo descrive ciò che il repository prova; il resto spetta allo staff tecnico, e dove compare viene nominato come tale.

Ogni tappa lascia una prova; «in produzione» si legge nell'ultima, non si deduce dalla prima.

> **Per gli sviluppatori:** `Makefile` (l'intestazione elenca i target e l'avviso «READ THIS BEFORE PUBLISHING»), `.gitlab-ci.yml`, `docs/03-cookbooks/07-deployment-guide.md` § «Percorso canonico», `AGENTS.md` come indice dei cookbook. Le sezioni del cookbook 07 sopra il «Percorso canonico» descrivono ECS e un workflow GitHub Actions che non sono in uso: `.github/workflows/` non esiste su `php8`.

## Jira come registro dei task

*Per gli sviluppatori, gli agenti di codice e lo staff tecnico.*

L'epic GOP-103 aveva diciassette task, descritti due volte: in Jira e in un `plan.md` locale. I due racconti non coincidevano. Il file mostrava un ramo indipendente dove Jira aveva GOP-120 bloccato anche da GOP-110, e metteva un task sotto un altro dove Jira aveva GOP-117 bloccato da GOP-112. Un agente che avesse ordinato il lavoro leggendo il file avrebbe avviato un task con il suo bloccante ancora aperto. Da quella deriva nasce la decisione registrata nel documento 26 dei pattern: Jira è l'unica fonte autorevole, sia della specifica sia dello stato di esecuzione.

### Il contratto del ticket

Ogni parte del ticket Jira ha un ruolo e un autore.

| Elemento | Ruolo | Chi scrive |
|---|---|---|
| «Descrizione» (Contesto, Passi, Fuori scope, Criteri di accettazione, Verifica) | la specifica, immutabile | solo una persona |
| Link «is blocked by» e «blocks» | il grafo delle dipendenze, cioè l'ordine di esecuzione | una persona, o una skill di pianificazione |
| «Stato» | lo stato di esecuzione | chi esegue |
| «Commenti» (SHA del commit, file toccati, output reale della verifica, dubbi aperti) | registro che si allunga e non si corregge | chi esegue |
| `tasks/{EPIC}/todo.md` | specchio rigenerato da Jira, mai autorevole | generato |
| `tasks/{EPIC}/plan.md` | ragionamento di progetto, non input di esecuzione | chi progetta |

La descrizione non si riscrive mai, per un motivo solo: se chi esegue riscrivesse la specifica che sta implementando, nessuno potrebbe più verificare che ha fatto ciò che era stato chiesto.

Gli stati del ticket Jira sono «Da completare», «In corso» e «Completata», più «Bloccato». Quest'ultimo è stato aggiunto perché i tre stati originali non sapevano dire «iniziato, non finito, serve una decisione umana». Sta nella categoria «In corso» di proposito: un ticket bloccato deve restare visibile come lavoro aperto, non ricadere fra quelli non iniziati. Al 25 novembre 2026 nessun ticket del progetto è in quello stato, ma lo stato esiste.

Poi ci sono i checkpoint. Un ticket il cui titolo comincia con `CP-` è un controllo umano dentro il grafo: blocca come gli altri, ma nessun agente lo implementa e nessun agente lo chiude. Prima la convenzione stava scritta solo in `todo.md`, e un'esecuzione automatica avrebbe attraversato CP-1 di GOP-103 senza accorgersene, saltando proprio la verifica di sicurezza sul perimetro delle commesse. Oggi la convenzione è in uso su sette ticket.

### Il ciclo di un ticket

1. Leggere la descrizione e i suoi link «is blocked by»: il ticket è pronto solo se ogni bloccante è «Completata».
2. Se mancano «Criteri di accettazione» o «Verifica», rifiutare il ticket invece di interpretarlo.
3. Portare il ticket a «In corso».
4. Lavorare in una copia di lavoro; la chiave entra nel nome del file di changeset (`…-gop-NNN-…`) e nel suo campo `ticket`, dove è obbligatoria.
5. Commentare con SHA del commit, file toccati e output reale della «Verifica».
6. Se manca una decisione umana, portare il ticket a «Bloccato» con un commento che nomina la decisione.
7. Portare il ticket a «Completata» solo dopo aver eseguito la «Verifica» e allegato il suo output.

La chiave è obbligatoria in un posto solo, il changeset. Il 25 novembre 2026 tutti i 140 changeset della cartella `changeset/` portano `gop-` nel nome; fra gli ultimi 300 commit di `php8` la chiave compare nel titolo di 95. Chi cerca il ticket di una modifica parte quindi dal changeset, non dal messaggio di commit.

La regola scritta è quella del passo 7. Nella pratica il commento di chiusura dice spesso anche da quando la modifica è in produzione: 48 ticket hanno un commento con «in produzione dal», con uno schema ricorrente: prima un commento che annuncia la merge request unita su `php8` e il rilascio in corso, poi uno di chiusura come «in produzione dal 18/11. Chiuso.». Le due cose non si escludono. La verifica dice che la modifica fa ciò che deve; la data dice che sta girando.

### Ticket Jira, sezione Ticket e Portolano

GOPlanner non chiama mai Jira. Un ticket della sezione Ticket porta la chiave `GOP-NNN` nella sua colonna `ticket`, e più ticket della sezione possono puntare allo stesso GOP. La libreria `TicketGop` traduce tre eventi in tre stati del ticket della sezione Ticket: l'inizio del lavoro in «In correzione», la merge request unita in «Nella prossima versione», il rilascio in «Risolta», con il messaggio «Risolta nella versione X». La libreria esiste ed è raggiungibile da un'operazione; chi decide l'evento sta fuori da GOPlanner. Un'assistenza che non tocca il codice non passa da Jira. La sezione Ticket è descritta nel capitolo 12.

Alla chiusura il ticket Jira «Completata» entra nel Portolano, nella raccolta di sviluppo, con descrizione, commento di chiusura e grafo dei link, dopo un controllo obbligatorio che non contenga segreti: chi arriva dopo trova il perché senza chiedere. Il Portolano è descritto nel capitolo 15.

«Il piano in `tasks/` dice un ordine diverso da quello di Jira: chi ha ragione?» Jira. `todo.md` si rigenera da Jira e le modifiche fatte a mano si perdono alla rigenerazione; `plan.md` spiega il ragionamento e va letto come tale. Una dipendenza nuova si aggiunge creando un link in Jira, non aggiornando un diagramma nel file.

Jira fa rispettare gli stati, non il contratto. Un ticket creato senza link «is blocked by» diventa eseguibile subito, anche a torto, e la qualità del risultato non supera quella della descrizione. La regola di chiusura non è sempre rispettata: GOP-828 è passato a «Completata» il 20 novembre 2026 senza nessun commento. Jira poi sta fuori da GOPlanner: l'ufficio non lo vede, vede la sezione Ticket. In questo libro i ticket Jira si citano per chiave, con un titolo breve riscritto, e del loro testo si riportano solo frasi senza nomi di persone o di committenti: i titoli originali a volte li contengono.

La descrizione del ticket Jira è la specifica e non si riscrive; lo stato e i commenti sono il registro di chi esegue.

> **Per gli sviluppatori:** `docs/02-patterns/26-jira-come-state-storage-dei-task.md`, `docs/02-patterns/30-ingestione-ticket-completati-in-rag.md`, `.agents/skills/implement-ticket/`, `docs/02-patterns/48-ticketing-base.md` § Decisione punto 8, `lib/MobileV3/Feedback/TicketGop.php`.

## L'ambiente locale: Docker, il database condiviso e le versioni di PHP

*Per gli sviluppatori e gli agenti di codice.*

Lo stack locale non ha un database suo. Lo sviluppo, gli stack locali, gli stack di test e la produzione puntano allo stesso cluster del database: lo scrive l'intestazione di `scripts/migrate.php`, lo ripete quella di `scripts/with-throwaway-mysql.sh`, il cookbook 21 lo chiama «DB unico condiviso». I file compose locali lo raggiungono attraverso un tunnel aperto da `scripts/ssm-tunnel.sh`. La conseguenza sta in una frase: quello che uno script lanciato in locale scrive, lo scrive sul database vero della commessa a cui lo stack punta. Per questo i test che scrivono girano su un MySQL usa e getta (sezione 4).

### I servizi dello stack

`docker-compose-linux.yml` è lo stack di riferimento per i test headless.

| Servizio | Che cosa fa |
|---|---|
| `app` | il web, Apache con PHP |
| `queue-worker` | i lavori in coda |
| `redis` | cache e coda dei lavori |
| `ws-server` | Node 18, il websocket dell'avanzamento |
| `app-php84`, `queue-worker-php84` | il runtime parallelo PHP 8.4 |
| `phpmyadmin` | ispezione del database |
| `chatbot` | il servizio di Gea, costruito da `chatbot-service/Dockerfile` |

`docker-compose-local.yml` (avviato da `make start_local`) ha `app`, `redis`, `phpmyadmin` e `queue-worker`, e nessun MySQL. `docker-compose.yml` (avviato da `make start_dev`) ha anche `mailpit` per la posta di prova e un secondo worker, e usa le immagini con il tag `php8`. Come questi pezzi lavorano insieme è nel capitolo 13. Dentro l'immagine `config.inc.php` è sostituito da `config-docker.inc.php`, come già detto nel capitolo 2.

Ogni script PHP, ogni ispezione di Redis, ogni test gira dentro i container, mai con il PHP della macchina. Il cookbook 18 lo scrive in grassetto, «sempre» dentro il container: fuori mancano le estensioni, e il database e Redis sono altri.

### Avviare lo stack da una copia di lavoro nuova

1. Copiare `chatbot-service/.env.example` in `chatbot-service/.env`: senza, ogni `docker-compose … exec` si ferma con «env file … not found».
2. Esportare nella shell la password del database, presa dal gestore segreti: i file compose la esigono (IN-70), e non si scrive mai in un file versionato.
3. Avviare lo stack con `scripts/run-tests-worktree.sh`, non con `./run_tests.sh`.
4. Eseguire `composer install` dentro il container dell'applicazione: l'immagine non contiene `vendor/`, e senza compare `vendor/bin/phpunit: no such file`.
5. Creare le cartelle di runtime di Smarty, che git ignora.
6. Controllare che i container appartengano a questa copia, leggendo l'etichetta Compose `com.docker.compose.project.working_dir`.

Il passo 5 è quello che inganna. Senza le cartelle di Smarty ogni pagina risponde HTTP 200 (richiesta riuscita) con il corpo vuoto, e `AGENTS.md` aggiunge: «There is no error in any log». Sembra un difetto del codice. È una cartella mancante.

Il passo 6 nasce da GOP-205. Docker Compose prende il nome del progetto dall'ultimo nome della cartella, non dal percorso completo. Una copia di lavoro la cui cartella si chiama come quella della copia principale si aggancia ai container che girano già: la suite parte, passa o fallisce, ma gira nello stack di un altro. `scripts/run-tests-worktree.sh` risolve con un file generato: `scripts/generate-test-compose.sh` scrive `docker-compose.test.yaml` (ignorato da git) partendo da `docker-compose.test.yaml.template`, con un nome di progetto ricavato dal percorso assoluto e una porta libera scelta al momento. Più copie in parallelo, ciascuna con i suoi container, la sua rete e la sua porta. GOP-205 è stato chiuso il 31 agosto 2026.

### Quale PHP gira dove

| Runtime | File | Dove gira | Stato |
|---|---|---|---|
| PHP 7.3 | `Dockerfile` della linea `master`, vincolo `^7.3` in `composer.json` | linea `master` | in produzione |
| PHP 8.3 | `Dockerfile` di `php8` (`FROM php:8.3-apache-bookworm`), vincolo `^8.3`, immagini CI `php:8.3-cli` | linea `php8` | in produzione dal 30 luglio 2026 |
| PHP 8.4 | `Dockerfile-8.4` (PHP 8.4.23), servizi `app-php84` e `queue-worker-php84` | solo in locale | non in produzione |

La build di `php8` si ferma se l'immagine di base è più vecchia di 8.3.36, la prima versione con la correzione della vulnerabilità trattata in GOP-482; il tag di base resta flottante per prendere le patch successive. Più di un documento dice ancora che «il runtime di produzione resta PHP 7.3»: GOP-226, chiuso il 3 settembre 2026, ha messo d'accordo `composer.json`, `Dockerfile` e CI su PHP 8.3 e ha segnato quelle frasi come superate. Vince il codice.

Il cookbook 22 separa ciò che sul runtime 8.4 è stato provato da ciò che non lo è stato.

- Provato: il login web e 16 pagine principali; il ciclo mobile completo, dall'autorizzazione al caricamento delle foto; scritture reali con l'ORM; il worker Redis con un lavoro vero; un PDF reale; un'importazione Excel `.xlsx` e un'esportazione `.xls`.
- Non provato: PDF ed Excel sulle altre commesse, circa cinquanta (le prove ne hanno toccate una o due); le firme reali sui rapportini PDF; `ws_server/` e il worker sotto carico vero.

Delle cause del primo HTTP 500 (errore del server) su PHP 8 ne basta una. I costruttori scritti come un metodo con il nome della classe non vengono più chiamati. Nel livello del database, in `lib/class.MyWrapper.php` e `lib/class.mysqlWrapper.php`, la connessione restava sempre `null`, e ogni query falliva, login compreso. Le altre cause sono nel cookbook.

L'audit statico si ripete con due strumenti: `scripts/php84_lint.sh` per la sintassi e PHPCompatibility con `phpcs.xml`. Entrambi escludono `vendor/`, `Smarty_old/`, `lib/phpexcel/`, `lib/fpdf/` e `archived/`. Le librerie `lib/phpexcel/` e `lib/fpdf/` sono state rese compatibili a livello di sintassi, non migrate; la decisione è in `tasks/excel-migration-design.md`. Per il passaggio in produzione esiste un piano, `tasks/php84-rollout.md`, che il cookbook 22 chiama «bozza di riferimento»: il piano definitivo è del team. Il suo principio guida è non sovrascrivere mai `latest` come primo passo, ma introdurre prima tag immutabili, così che un ritorno indietro esista. È il principio di una bozza, non una procedura in vigore.

«Ho cancellato dati di prova dal mio stack locale: ho toccato la produzione?» Lo stack punta allo stesso cluster della produzione. Le commesse di prova però sono database separati su quel cluster, quindi i dati cancellati sono quelli della commessa a cui lo stack puntava: se era una commessa di prova, il danno resta lì. Prima di scrivere si controlla quale commessa e quale database lo stack sta leggendo, e si scrive solo su una commessa di prova o su un MySQL usa e getta. In proporzione al rischio, gli script che scrivono sul database partono in anteprima e vogliono un bersaglio esplicito (sezione 5).

Lo stack locale non riproduce la topologia della produzione: niente repliche, niente proxy, niente allarmi. Il PHP del container locale può non essere quello della linea su cui si lavora: `docker-compose-linux.yml` e `docker-compose-local.yml` usano l'immagine principale senza tag esplicito, cioè `latest`, e il cookbook 18 aveva misurato PHP 7.3.33 nel container `app`, una misura di quel momento. Quale linea costruisca oggi il tag `latest` non risulta dalle fonti lette; per lavorare su `php8` in locale, `docker-compose.yml` usa il tag `php8`. Infine Smarty 2 compila un commento di template `{{* … *}}` con `each()`, rimossa in PHP 8: un solo commento così rende fatale tutta la pagina. Lo protegge `tests/CreaInvitoTemplate_Test.php`.

Lo stack locale appartiene alla copia di lavoro, il database no: prima di scrivere si guarda a quale commessa punta.

> **Per gli sviluppatori:** `docker-compose-linux.yml`, `docker-compose.test.yaml.template`, `scripts/generate-test-compose.sh`, `scripts/run-tests-worktree.sh`, `Dockerfile`, `Dockerfile-8.4`. L'overlay `docker-data/`, copiato tardi in ogni immagine, è il posto dove si cambia la configurazione di Apache e PHP (`AGENTS.md` § Container config overlay). Target `make start_dev`, `start_local`, `stop_dev`; cookbook 11, 22, 25.

## I test, la pipeline e il changeset: che cosa si prova prima di unire

*Per gli sviluppatori e gli agenti di codice; il riquadro sulle Novità è anche per l'ufficio.*

Un test costa tempo, e alcuni costano un telefono. Il cookbook 18 mette una scala con una regola sopra: si sceglie sempre il livello più alto che basta, cioè il più leggero che prova la modifica.

1. Richiesta HTTP pura, con curl o con cURL di PHP: login, API web, API mobile. È il modo più veloce e deterministico. Un dettaglio esatto evita un'ora persa: il login web è un POST a `index.php`, servito da `pages/login.php`, con risposta attesa 302 (redirezione) e cookie di sessione; la rotta `POST /utente/login` citata altrove non esiste.
2. Script ORM dentro il container, per preparare dati di prova e ispezionare il database (cookbook 19).
3. Browser, con Chrome DevTools MCP, solo quando servono JavaScript o mappe vere: Leaflet, selezione a trascinamento, modali (cookbook 15).

### PHPUnit e il MySQL usa e getta

`phpunit.xml` dichiara due suite, `default` sulla cartella `tests` e `db_canonico`, e limita la copertura a `lib`. Al 25 novembre 2026 la radice di `tests/` contiene 450 file `*_Test.php`, più le sottocartelle. PHPUnit gira dentro il container: `./run_tests.sh` nella copia principale, `scripts/run-tests-worktree.sh` in una copia di lavoro.

I test che hanno bisogno di MySQL passano da `scripts/with-throwaway-mysql.sh`, che avvia un MySQL 8.0 per il test, solo sull'indirizzo locale e su una porta casuale, esegue il comando e lo rimuove alla fine. Lo script esiste perché sviluppo, stack locali e stack di test condividono il cluster della produzione: i test che scrivono devono girare solo lì. Da GOP-698, chiuso l'8 novembre 2026, questi test costruiscono le tabelle della commessa dallo schema canonico, con `tests/support/SchemaCanonico.php`: un test che usa una colonna non canonica fallisce in sviluppo, non in produzione. Li lancia `make test_db_canonico`; `make test_migrate` prova l'esecutore delle migrazioni sullo stesso tipo di MySQL.

Un errore che compare in un'esecuzione e sparisce nella successiva può non essere del codice. Con l'ordine di esecuzione configurato in `phpunit.xml`, una `.phpunit.cache` lasciata da un'esecuzione precedente riordina i test (la nota è in GOP-270): prima di cercare il difetto si ripete la suite con la cache pulita.

### Il telefono senza telefono

`scripts/test_mobile_android_live.php` fa senza telefono il ciclo dell'app 1.x: autorizzazione, scaricamento degli interventi, chiusura di un intervento, caricamento di una foto. L'app 1.x si autentica con un identificativo, non con utente e password. La build di debug manda sempre lo stesso identificativo, e quell'identificativo punta all'ultima commessa che l'ha preso, che può essere una commessa di produzione. Con `--tenant=<commessa>` (la commessa, che nel codice si chiama tenant) lo script risolve la commessa reale dal database principale e si ferma se è diversa; senza, procede sulla commessa risolta stampando un avviso ben visibile.

Per GOPlanner 3 ci sono due smoke: `make smoke_v3_pairing` abbina un telefono di prova su un'API rilasciata e poi rimuove le sue righe, `make smoke_v3_pairing_test` fa lo stesso su un MySQL usa e getta e non tocca nessun database reale.

Il cookbook 21 descrive il ciclo E2E completo in sei passi: preparazione dei dati, pianificazione, scaricamento sul telefono, chiusura con i campi, foto con salvataggio e sincronizzazione, verifica sul server. La parte server è headless, la parte telefono gira su un dispositivo vero o su un emulatore; un solo database, due front end. L'app coperta è la 1.x: per GOPlanner 3 esistono gli smoke di abbinamento, non un ciclo E2E documentato.

### La pipeline di GitLab

La pipeline di `.gitlab-ci.yml` ha dieci job, tutti nello stage `test`.

| Job | Che cosa controlla |
|---|---|
| `php_lint` | `php -l` su `lib/`: l'unione di due merge request può lasciare un metodo dichiarato due volte, «Cannot redeclare», che nessun test dei singoli file vede e che il rilascio rifiuta |
| `chatbot_test`, `chatbot_php_test` | i due lati del contratto di Gea, Node e PHP |
| `tokens_check` | `dist/tokens.css` coincide con quello rigenerato da `tokens.json` |
| `openapi_check` | il contratto dell'API del call center resta YAML valido (GOP-709) |
| `vendor_fa_check` | `vendor/fa` coincide con il suo manifesto |
| `css_lint` | solo le righe CSS cambiate: il debito esistente non blocca, ma nessun nuovo colore esadecimale o `rgb()` entra con la merge request |
| `industry2_check` | il contrasto dei token |
| `job_segnalibri_test` | il test dei lavori sui segnalibri |
| `changeset_check` | il file di changeset, descritto sotto |

La pipeline parte su ogni ramo e ogni merge request, senza pipeline doppie, sui runner condivisi di GitLab, piano gratuito con 400 minuti di calcolo al mese; per tornare al runner della workstation basta cambiare una variabile di progetto, senza toccare il codice. Nessun job esegue la suite PHPUnit generale di `tests/` né i test su MySQL usa e getta: `chatbot_php_test` lancia PHPUnit solo sui file del contratto di Gea.

### Il changeset: che cosa cambia per chi lavora nella commessa

Ogni modifica visibile alle commesse porta un file, `changeset/AAAA-MM-GG-gop-NNN-slug.md`, nella stessa merge request del codice, scritto da chi fa la modifica. La decisione è del 5 novembre 2026, registrata nel documento 46 dei pattern e realizzata con GOP-711, e il motivo è scritto lì: il testo nasce quando si sa che cosa è cambiato, e viaggia con il cherry-pick.

Il front matter ha quattro campi, più uno di servizio:

- `tipo`: `novita`, `miglioramento` o `correzione`;
- `tenant`: `tutti` oppure un elenco di cartelle di `custom/`;
- `modulo`, facoltativo: una cartella di `migrations/tenant/modules/`;
- `ticket`: deve coincidere con il numero nel nome del file;
- `pubblicato`: serve solo ai changeset ricostruiti.

Il corpo ha due sezioni con queste intestazioni esatte: «## Per il cliente», obbligatoria e non vuota, che è il testo letto da chi lavora nella commessa, e «## Tecnica», solo per lo staff. Il filtro sta nei dati e non nel template: la sezione tecnica esce solo da `Novita::perAmministratore()`, mai da `perCliente()`.

Un changeset non valido fa fallire la merge request: tipo non ammesso, cartelle che non esistono in `custom/`, modulo inesistente, sezione «Per il cliente» vuota o mancante, ticket diverso dal nome del file. Una merge request che tocca codice senza changeset produce invece un avviso arancione, che non blocca: lo script esce con 2 e il job ammette quel codice. Per una modifica invisibile alle commesse si mette sulla merge request l'etichetta «nessun changeset», e l'avviso sparisce. In locale si controlla con `make changeset_check` e si vede il changelog di una commessa con `make changeset_anteprima TENANT=<commessa>`.

Il changelog è una funzione dei changeset presenti nel commit che gira. Non esiste un file generato né un registro dei rilasci; `php8` e `master` hanno ciascuna i propri changeset, e quindi il proprio changelog. L'ora di uscita di una voce è la prima volta che l'applicazione legge quel changeset, per linea e per ambiente. Unire non basta: la voce compare dopo il rilascio.

> **Per l'ufficio:** la pagina Novità mostra solo il testo «Per il cliente» delle modifiche che riguardano la commessa in cui si lavora. Una voce compare quando il codice che la contiene è in esecuzione, non quando qualcuno la scrive. Dove stanno la campanella e la pagina Novità è nel capitolo 12.

«La pipeline è verde: i test sono passati?» Sono passati i job della pipeline: lint, contratti, token, stili, changeset, le suite di Gea. I test che hanno bisogno di un database, di un browser o di un telefono si lanciano a mano, e il loro output reale va nel commento del ticket Jira. Senza quel commento il ticket non si chiude (sezione 2).

L'E2E vuole un telefono vero e il database condiviso. I target browser richiedono Docker e un'immagine dell'applicazione, e il `Makefile` li marca «non in CI». I minuti gratuiti della CI sono finiti, e per questo i job sono leggeri, con timeout di 5 minuti, 15 per i due di Gea. Un changeset scritto per le commesse sbagliate passa la pipeline, che controlla che le cartelle esistano, non che la scelta sia giusta. E nessun changeset si cancella: il changelog di una commessa cresce con la storia del ramo.

Si sceglie il test più leggero che prova la modifica; quello che la pipeline non esegue si esegue a mano e si incolla nel ticket Jira.

> **Per gli sviluppatori:** `phpunit.xml`, `scripts/with-throwaway-mysql.sh`, `tests/support/SchemaCanonico.php`; cookbook 15 (`15-guida-test-ui.md`), 18, 19, 20, 21; skill del repository `goplanner-headless-tests`, `goplanner-e2e-test`, `goplanner-browser-mcp-tests`; `scripts/changeset_check.mjs`, `changeset/README.md`, `lib/Novita.php`, `lib/NovitaArchivio.php`.

## Rilasciare: pubblicare, ri-agganciare, migrare

*Per lo staff tecnico che rilascia e per gli sviluppatori.*

Tre verbi, tre atti diversi. Pubblicare significa spostare un tag nel registro delle immagini, con `make publish_app`. Ri-agganciare significa far usare al servizio che gira l'immagine nuova, con `make deploy_app`. Rilasciare è l'atto intero, e si chiude solo con il controllo. Il 9 settembre 2026 si è visto che cosa succede quando si confondono.

### Pubblicare non è rilasciare

`docker stack deploy` risolve un tag in un'impronta una volta sola, nel momento in cui viene eseguito, e aggancia il servizio a quell'impronta. Da lì in poi il servizio non segue più il tag. Il 9 settembre 2026 la verifica ha trovato i tre servizi storici, l'applicazione e due worker della coda, agganciati a un'impronta più vecchia di quella a cui puntava il tag `latest`; il servizio della linea `php8` era sulla sua. Il tag era stato spostato, e in esecuzione non era cambiato nulla.

Quella deriva è stata letta come la causa dei dieci mesi di registri mobili persi, e il commento in testa al `Makefile` lo dice ancora. Jira dice altro: il 29 settembre 2026 GOP-270 è stato chiuso come doppione di GOP-195, perché «la diagnosi del rilascio vecchio era errata»; la causa confermata è nella sezione 6. La deriva resta un fatto osservato, e un rischio reale per ogni rilascio. Le regole di oggi nascono da lì.

Per questo i target sono due, di proposito, più uno di sola lettura.

- `make publish_app` costruisce da `Dockerfile` per due architetture, `linux/amd64` e `linux/arm64`, e pubblica due tag: il tag del canale, che si sposta a ogni pubblicazione, e lo SHA del commit, che non si sposta più. Il canale è `php8` per default, così una pubblicazione lanciata a mano da una copia normale non ritagga mai per sbaglio la linea storica; `latest` si pubblica solo scrivendolo. Lo SHA è immutabile e permette di dare un nome a un'impronta anche dopo: nella deriva di settembre nulla era riconducibile a un commit, perché un tag del genere non era mai stato pubblicato. Alla fine il target stampa «Reminder: this moves a tag. It does not restart or re-pin any running service.».
- `make deploy_app` ri-aggancia i servizi. Esegue un comando fornito da chi rilascia, che il `Makefile` non scrive: fra i rimedi possibili la scelta è di una persona dello staff tecnico. Se lo standard input non è un terminale rifiuta con «No terminal attached to stdin - refusing to assume consent»; su terminale chiede «Type 'deploy' to continue: » e senza la parola esatta si ferma con «Aborted - confirmation not received.». Il cookbook 07 lo riassume così: l'assenza di conferma non vale come conferma. Uno script, un cron, un job di CI o un altro `Makefile` che lo chiama vengono rifiutati.
- `make app_image_digests` è in sola lettura: stampa a quale impronta punta ogni tag pubblicato, in ordine di pubblicazione. Confrontata con l'immagine che il servizio esegue, mostra la deriva.

Per rilasciare l'immagine principale:

1. Partire da una copia pulita del commit da rilasciare.
2. Lanciare `make publish_app`.
3. Annotare il tag con lo SHA del commit.
4. Lanciare `make deploy_app` da una shell interattiva e digitare `deploy`.
5. Lanciare `make app_image_digests` e confrontare l'impronta con quella del servizio in esecuzione.

Il servizio di Gea ha la stessa coppia, `make publish_chatbot` e `make deploy_chatbot`, con la stessa conferma.

### La cartella dell'API del call center e del server di sviluppo

Il server che serve l'API del call center e il sito di sviluppo non ha un'immagine sua: il cookbook 27 lo dice in una frase, «la cartella è il rilascio». Fino a GOP-317 la cartella si aggiornava copiandoci sopra file a mano, a volte un'intera copia di lavoro. Il 16 settembre 2026 una di queste copie ha cancellato una correzione già rilasciata, GOP-274, e ha rotto in produzione gli orari del servizio vocale del call center. Dopo, nessuno poteva dire da quale commit venisse ciò che stava nella cartella: una copia a mano non lascia traccia. E una copia completa portava con sé anche file che sul server dovevano restare diversi, fra cui un file di configurazione con chiavi scadute.

Da allora la cartella si rilascia da uno SHA: prima l'anteprima, che legge e stampa il piano senza scrivere, poi il rilascio.

```bash
make release_api_dry_run COMMIT=<sha>
make release_api COMMIT=<sha>
```

Lo SHA esplicito sulla riga di comando è il consenso: lo script non chiede nulla e non vuole un terminale. `COMMIT` e `ALLOW_DRIFT` contano solo se scritti sulla riga di comando di make, mai presi dall'ambiente: una variabile esportata e dimenticata non deve rilasciare niente.

Le protezioni di `scripts/release-api-dev.sh`:

- rifiuta una copia di lavoro sporca, uno SHA non esadecimale, un commit che non sta su `origin/php8`, una copia dello script diversa da quella di `origin/php8`;
- prende il lock `.rilascio/lock` prima di leggere la cartella;
- esegue `php -l` su ogni file `.php` cambiato, con il PHP del container, prima di toccare la cartella;
- sincronizza senza cancellare, con una copia di sicurezza di ogni file sovrascritto in `.rilascio/backup/<timestamp>/`;
- esegue `composer install --no-dev` solo se `composer.lock` è cambiato o manca l'autoload;
- registra `.rilascio/COMMIT`, il manifesto `.rilascio/MANIFEST.sha256` con lo SHA-256 di ogni file e una riga in `.rilascio/history.log`, poi ricontrolla tutta la cartella sul manifesto;
- rifiuta i file cambiati a mano dall'ultimo rilascio, salvo `ALLOW_DRIFT=1` scritto sulla riga di comando;
- non spedisce, non sovrascrive e non rimuove mai i file di configurazione d'ambiente, il compose del server, `deploy/`, le cartelle nascoste, gli upload e le cache;
- controlla dall'esterno che l'API risponda 401 (non autorizzato) senza token e che il sito di sviluppo risponda 200, stampando solo il codice e il tipo di contenuto, mai il corpo; poi lancia lo smoke di abbinamento di GOPlanner 3;
- legge la conformità dello schema delle commesse attive (GOP-699) con `migrate.php --all`, che per default è un'anteprima e non cambia mai un database.

Il codice di uscita dice com'è andata.

| Uscita | Significato |
|---|---|
| 0 | rilasciato, tutto a posto |
| 1 | rifiutato, fallito, o rilasciato con l'API che non risponde come deve: si torna indietro |
| 3 | rilasciato, API a posto, smoke di abbinamento fallito |
| 4 | rilasciato, ma con `SCHEMA_GATE=block` sono state trovate commesse indietro; il rilascio non viene annullato |

L'uscita 3 ha una storia: il 16 ottobre 2026 l'abbinamento rispondeva 503 (servizio non disponibile) perché le migrazioni del database principale non erano state applicate. Tornare indietro vuol dire rilanciare lo script con il commit precedente, che lo script stampa alla fine e conserva in `history.log`; un rilascio interrotto si chiude rilanciando lo stesso commit o il precedente. Lo script non riavvia i container: ogni lavoro in coda gira in un processo figlio che ricarica il codice, e i worker vanno riavviati a mano solo se cambia il loro ciclo (`worker.php`, `lib/Queue.php`, il lotto dei registri) o il Dockerfile.

### Le migrazioni del database

Le regole vengono da `migrations/README.md`:

- solo espansione: tabelle nuove, colonne nullable o con un default, indici; rimozioni e rinomine in un rilascio successivo, quando nessuna delle due linee usa più l'oggetto;
- un file, una modifica di schema, rilanciabile;
- charset, collation ed engine espliciti;
- niente `USE` e niente nomi qualificati di altri database: l'esecutore rifiuta il file prima di eseguirlo;
- niente migrazione all'indietro: si corregge in avanti;
- un file già applicato non si modifica più: il checksum registrato lo fa rifiutare;
- la cartella è la stessa su `master` e su `php8`.

La regola del correggere in avanti ha un caso recente. La migrazione 0032 del database principale creava una colonna `NOT NULL`; l'ORM scrive NULL per le colonne non valorizzate, e ogni nuovo utente falliva con «Column 'attivo' cannot be null». Non si è tornati indietro. È stata scritta la 0033, applicata a mano in produzione il 23 novembre 2026.

Le serie sono due. `migrations/main/` è la serie del database principale: non ha un esecutore e si applica a mano, in ordine, per decisione dello staff tecnico. `migrations/tenant/` è la serie delle commesse: `0000_baseline` (la v0), poi le migrazioni comuni in ordine numerico, poi quelle di `modules/<modulo>/` solo per le commesse che dichiarano il modulo in `custom/<tenant>/moduli.json`, poi quelle di `custom/<tenant>/`, solo per quella commessa (GOP-696). L'id scritto in `schema_migrations` è il percorso del file senza `.sql`, con il checksum, la durata e chi l'ha applicata. Che cosa contiene lo schema canonico è nel capitolo 14.

L'esecutore ha tre forme d'uso:

```bash
php scripts/migrate.php --tenant=<commessa>          # anteprima, il default
php scripts/migrate.php --all                        # anteprima di tutte le commesse attive
php scripts/migrate.php --tenant=<commessa> --apply  # applica
```

Un bersaglio è obbligatorio: senza `--tenant` o `--all` l'esecutore si rifiuta. Con `--apply` su terminale chiede conferma dell'host; senza terminale serve `--yes`. Il lock attende 10 secondi per default. L'uscita è 0 se è tutto a posto, 1 se almeno una commessa è fallita o bloccata, 2 per un uso sbagliato. Una commessa non conforme alla v0 risulta «excluded» e non viene toccata finché non è allineata; il confronto si fa con `make schema_check`, come nel capitolo 2.

> **Attenzione:** sviluppo, stack locali, stack di test e produzione condividono lo stesso cluster del database. Un `--apply` lanciato da uno qualunque di questi posti migra la produzione. L'esecutore si lancia a mano, da un container usa e getta dell'immagine di rilascio.

Le migrazioni si applicano commessa per commessa, e l'ufficio ne vede l'effetto. Una commessa il cui database è indietro rispetto al codice compare in giallo in Stato commesse (capitolo 12), e una funzione che dipende da una migrazione mancante lo dice sulla pagina (capitoli 4 e 8).

### Un rilascio dell'app GOPlanner 3

La procedura è quella di `docs/mobile-v3/aggiornamento.md`; la parte server, GOP-407, al 25 novembre 2026 è ancora «In corso». Il server non firma e non ha nessuna chiave privata. Il manifesto dell'aggiornamento si firma fuori linea, con una chiave diversa da quella che firma l'APK, custodita da persone e mai raggiungibile dagli agenti. Il server riceve il file firmato e la sola chiave pubblica, e verifica la firma prima di servirlo; l'app incorpora la chiave pubblica e verifica di nuovo per conto suo. La verifica del server è una rete di sicurezza per chi pubblica, non una garanzia per il telefono.

I tre script, decisi il 23 ottobre 2026, stanno in `scripts/mobile-v3-update/`:

- `prepara-manifesto.php`, per chiunque prepari il rilascio, senza chiavi;
- `firma-manifesto.sh`, solo per chi custodisce la chiave, sulla sua macchina, con la chiave privata in sola lettura;
- `verifica-manifesto.php`, per chiunque, con la chiave pubblica.

Per pubblicare un aggiornamento:

1. Costruire l'APK e dargli un nome per versione: un APK pubblicato non si sovrascrive mai.
2. Preparare il contenuto con `prepara-manifesto.php`: scadenza a 14 giorni per default, ammessa da 1 a 90; `release_sequence` uno in più del più alto mai pubblicato su qualunque canale; aggiornamento facoltativo per default.
3. Far firmare a chi custodisce la chiave.
4. Verificare con `verifica-manifesto.php`, che usa lo stesso codice del server.
5. Copiare sul server prima l'APK, poi la busta, rinominata in un colpo solo: il server non vede mai un manifesto che punta a un APK non ancora copiato.
6. Controllare dal vivo: 200 con un manifesto non nullo; un 503 significa che il server rifiuta la busta.

I canali sono `stable` e `pilot`, con un solo contatore di sequenza per entrambi: l'app conserva il massimo visto e rifiuta un manifesto più vecchio. Un aggiornamento obbligatorio lo decide una persona dello staff tecnico; se anche il server deve rifiutare i dati delle versioni vecchie, si alza pure la versione minima del client configurata sul server. Prima della scadenza si ripubblica lo stesso APK con la sequenza successiva. Manifesti e APK non entrano mai in un'immagine Docker né nella cartella di rilascio del codice: un rilascio dell'app non chiede di ricostruire nulla.

I rilasci sono manuali per la decisione del 14 ottobre 2026; il runner di rilascio è una fase successiva. Il comando concreto del ri-aggancio non è nel repository. La serie del database principale non ha esecutore, e una migrazione sbagliata si corregge solo in avanti. Il controllo di conformità dello schema esiste nel rilascio della cartella dell'API; quello notturno previsto da GOP-699, ancora «In corso», non è stato trovato. `release_api` non pulisce le copie di sicurezza: `.rilascio/backup/` resta dentro la cartella servita, con versioni vecchie di file PHP anche precedenti a correzioni di sicurezza, e va svuotata a mano. Un cambio delle impostazioni PHP in `docker-data/` viaggia con la cartella ma non arriva al container, che legge quelle cotte nell'immagine.

Pubblicare sposta un'etichetta; rilasciare cambia ciò che gira. Ogni atto ha il suo comando, e il comando che scrive in produzione vuole un consenso esplicito.

> **Per gli sviluppatori:** `Makefile` (`publish_app`, `deploy_app`, `app_image_digests`, `release_api_dry_run`, `release_api`, `release_api_test`, `publish_chatbot`, `deploy_chatbot`, `schema_check`), `scripts/release-api-dev.sh` (intestazione), `docs/03-cookbooks/27-rilascio-api-dev.md`, `migrations/README.md`, `migrations/main/README.md`, `scripts/migrate.php`, `lib/MigrationRunner.php`, `docs/02-patterns/45-schema-canonico-tenant.md`, `docs/mobile-v3/aggiornamento.md`.

## Registri, allarmi e silenzi: osservare GOPlanner in produzione

*Per lo staff tecnico e gli sviluppatori. L'ufficio arriva a questi registri attraverso Gea e la sezione Ticket (capitolo 12).*

Un gruppo di registri che smette di crescere non manda nessun segnale. Il cookbook 26 lo dice così: non fallisce, tace. Per dieci mesi il silenzio dei registri mobili è sembrato normalità. Questa sezione dice dove GOPlanner scrive ciò che succede in produzione, come si arriva dal codice di un errore al suo racconto completo, e come il sistema si accorge di un canale che tace.

### Come si scrive un record

`lib/CloudWatchLogHelper.php` scrive ogni evento due volte: nel gruppo della commessa e del canale, e nel gruppo centrale `/goplanner`. Gruppi e stream si creano una volta per processo e poi si ricordano. È servito dopo GOP-483: il worker è un processo lungo, e senza quella memoria ogni lavoro chiamava la creazione del gruppo, sbatteva contro la quota di 5 operazioni al secondo per account, e la coda cresceva fino a saturare Redis.

La telemetria web non rallenta la pagina: `json.php` mette in coda un `LogJob` per ogni richiesta, tranne le azioni di un elenco di esclusione, e un worker lo spedisce dopo (l'architettura della coda è nel capitolo 13). Anche gli errori del server passano dalla coda, e se l'accodamento fallisce il ripiego è il registro di PHP. I crash report dell'app Android 1.x vanno in `/goplanner/android/crash-report`, sempre attraverso la coda, dopo un filtro in `lib/CrashReportFilter.php` che lascia passare solo un elenco chiuso di campi, scarta il registro del dispositivo e l'IP e taglia la traccia a 4096 caratteri; in tutto un evento passa da circa 23 KB a circa 2 KB. Gli eventi di audit, per esempio `rbac_deny`, viaggiano sulla stessa strada asincrona (capitoli 11 e 12).

Nei nomi dei gruppi `<tenant>` è la commessa come la chiama il codice.

| Gruppo | Che cosa contiene |
|---|---|
| `/goplanner/<tenant>/web` | le richieste web della commessa |
| `/goplanner/<tenant>/errors` | gli errori del server con il loro codice, e i fallimenti dei lavori in coda |
| `/goplanner/sconosciuto/mobile` | ogni ingresso da un telefono dell'app 1.x, prima di sapere la commessa |
| `/goplanner/<tenant>/mobile` | gli esiti delle richieste mobili e il heartbeat di GOPlanner 3 |
| `/goplanner/v3_non_autenticato/mobile` | le richieste di GOPlanner 3 da un telefono non autenticato o non in archivio |
| `/goplanner/android/crash-report` | i crash dell'app 1.x |
| `/goplanner/giro/scheduler` | il battito dello schedulatore del Giro (capitolo 12) |
| `/goplanner/chatbot` | l'audit di Gea, solo per lo staff |
| `/goplanner` | il gruppo centrale |

I fallimenti dei lavori in coda prima finivano solo nello standard error del container del worker, che si perde a ogni ricreazione. Fra il 13 e il 16 novembre 2026 le esportazioni foto di una commessa sono fallite per giorni, per una foto PNG aperta come JPEG, e il motivo stava solo lì. Ora ogni fallimento va in `/goplanner/<tenant>/errors`, lo stesso gruppo degli errori web.

### Dal codice di 8 caratteri all'errore completo

Il codice che compare sulla schermata d'errore (capitolo 12) è di 8 caratteri esadecimali maiuscoli, coniato in `lib/BaseErrorHandler.php` senza nessun accesso esterno: esiste sempre, anche quando il database non risponde. Il gestore lo scrive come `errorId` in `/goplanner/<tenant>/errors`, insieme all'utente, alla pagina e all'azione della richiesta. Se c'è un utente in sessione, scrive anche una riga nella tabella `error_log` del database principale, con il codice fra parentesi quadre; senza utente, il codice va solo nel registro di PHP.

1. Prendere dal ticket della sezione Ticket il codice, la commessa e l'ora.
2. Interrogare con Logs Insights il gruppo `errors` di quella commessa, con una finestra di tempo attorno all'ora segnalata e un limite di risultati, filtrando su `errorId`.
3. Se lì non c'è nulla, cercare lo stesso codice nella tabella `error_log`.
4. Scrivere nel ticket Jira che cosa si è trovato e dove.

Le regole vengono dalla skill del repository `cloudwatch-log-investigator`: sempre una finestra di tempo e un limite; sempre la commessa, il canale e l'intervallo esatto prima di partire; mai una conclusione da un canale solo quando il problema può toccare web e mobile insieme; per i sintomi lato server, sempre un incrocio con `error_log`.

### Il canale mobile

Per l'app 1.x, `lib/MobileRequestLog.php` accoda due eventi per ogni richiesta con lo stesso `request_id`: l'ingresso, subito, in `/goplanner/sconosciuto/mobile`, e l'esito, a fine richiesta, in `/goplanner/<tenant>/mobile`. Come si leggono insieme per capire dove si è fermato un dato è nel capitolo 12. In questi registri non entrano mai i valori dei parametri, le password, i token, i byte delle foto, il testo delle eccezioni, e nemmeno l'identificativo del telefono in chiaro: al suo posto c'è un'impronta di 12 caratteri.

Il segnale promesso nel capitolo 8 è il heartbeat di GOPlanner 3 (GOP-550). L'app lo manda ogni 5 minuti mentre è in esecuzione e a ogni apertura. Dice la versione dell'app; quanti esiti, foto e posizioni aspettano e da quando aspetta il più vecchio; l'ultimo errore di invio, con codice, stato HTTP, ora e modello della rotta; la rete; facoltativamente batteria, carica, temperatura e risparmio energetico. Il corpo è di 2048 byte al massimo. Il server lo scrive come riga di accesso in `/goplanner/<tenant>/mobile`. Quando il telefono è revocato o non ancora abilitato il server risponde 403 (accesso negato) e l'app ferma il timer del heartbeat.

Per l'app 1.x il dettaglio dei registri si regola per commessa con `log_level`, un intero da 0 a 4 letto da `$custom['mobile']['log_level']`, 1 se assente o non valido. L'app lo applica alla riapertura successiva. Si alza, si legge, si riabbassa.

### I quattro allarmi e il controllo del silenzio

`scripts/check_canale_log.php` (GOP-264, GOP-828) fa quattro controlli per commessa.

| Allarme | Regola | Da dove legge |
|---|---|---|
| Canale di log guasto | un gruppo con un fallimento di scrittura non seguito da un successo | Redis, attraverso `LogChannelHealth`: un record per gruppo, oltre a una riga `LOGCHANNEL_FAIL`; una scrittura riuscita azzera solo il record del suo gruppo |
| Dispositivo silenzioso | ultimo contatto più vecchio di 48 ore, fra i telefoni attivi negli ultimi 30 giorni | l'ultimo contatto dei telefoni |
| Picco di scarti | richieste rifiutate sul totale delle richieste della commessa ≥ 0,2 su 60 minuti, con almeno 30 richieste | contatori in Redis, in secchi di 5 minuti |
| Coda ferma | un telefono con un invio fallito da più di 6 ore e nessun invio riuscito dopo, per la stessa azione | gli esiti degli invii del telefono |

Il controllo è previsto ogni ora, non scrive nulla sul database, ed esce con 1 quando una condizione scatta. Non manda notifiche da solo: il codice di uscita lo legge il cron o un controllo esterno.

`scripts/check_mobile_log_silence.php` guarda le commesse che hanno entrambi i gruppi, `web` e `mobile`, e confronta l'ultimo evento: anomala è la commessa con il web attivo negli ultimi 30 giorni e il mobile fermo da più di 30, oppure con un gruppo mobile mai scritto. Preso da solo, un canale mobile silenzioso non prova niente, perché la commessa può non usare l'app. È l'accostamento con il gruppo web della stessa commessa a trasformare quel silenzio in un'anomalia. L'ora suggerita è le 06:23 di ogni giorno, scelta perché il 31 ottobre 2025 dodici commesse si erano fermate fra le 05:44 e le 08:15.

### Il silenzio dei dieci mesi

La causa lasciata in sospeso nella sezione 1 sta qui. `json_android.php` passava al lavoro di registro l'id dell'operatore come se fosse l'id di un utente; il worker lo cercava fra gli utenti del database principale, non lo trovava e faceva fallire il lavoro prima della scrittura su CloudWatch. La correzione è del 24 settembre 2026, su entrambe le linee, in produzione dal 25; il 29 settembre i registri arrivavano di nuovo. Il guasto stava prima della scrittura, dove il registro dei fallimenti di scrittura non guarda. Il confronto con il gruppo web, invece, lo avrebbe visto.

«Il gruppo mobile di una commessa è vuoto da una settimana: è un guasto?» Da solo, no. Si confronta con il gruppo web della stessa commessa, cioè il controllo del silenzio, e con l'ultimo contatto dei telefoni; un fallimento di scrittura sarebbe registrato per gruppo da `LogChannelHealth`. Senza queste letture nessuno scrive «è rotto» e nessuno scrive «è tutto a posto». Si scrive che cosa si è controllato.

Un telefono che non raggiunge proprio il server non lascia traccia finché non conta come silenzioso, dopo 48 ore. L'idempotenza dell'ingestione è un progetto, non è implementata: un invio si duplica solo se il server salva, la conferma si perde e il telefono ritenta. Le notifiche e gli allarmi CloudWatch su questi controlli sono previsti e vanno definiti fuori dal repository; nessuna fonte dice che oggi esistano, e anche le righe crontab dei due script sono indicate come previste. Una ricognizione del 7 ottobre 2026 contava 46 gruppi mobili, 28 dei quali senza un periodo di conservazione impostato; nel repository non c'è un'impostazione di conservazione. L'ufficio non legge CloudWatch: ci arriva attraverso Gea e la sezione Ticket.

Il controllo del silenzio esiste da settembre 2026 perché un canale si giudica accanto a un fratello che parla: con il gruppo web della stessa commessa che scriveva ogni giorno, quel silenzio sarebbe diventato un'anomalia il giorno dopo, non dieci mesi dopo. Il principio è lo stesso per chi chiude un rilascio: l'assenza di errori non è una prova, una prova è qualcosa che si legge. «In produzione», in un commento Jira, si scrive dopo aver letto il tag con lo SHA del commit, l'impronta dell'immagine che il servizio esegue, la riga in `schema_migrations` e un canale che continua a scrivere. Il messaggio di successo del comando appena lanciato non è fra queste prove.

> **Per gli sviluppatori:** `lib/CloudWatchLogHelper.php`, `lib/LogChannelHealth.php`, `lib/MobileRequestLog.php`, `lib/MobileTassiCanale.php`, `lib/CrashReportFilter.php`, `lib/BaseErrorHandler.php` (`sendToCloudWatch()`, `sendToDB()`), `lib/MobileV3/Resource/HeartbeatController.php`, `scripts/check_canale_log.php`, `scripts/check_mobile_log_silence.php`, `docs/02-patterns/18-cloudwatch-logging-infrastructure.md`, cookbook 05, 26, 35, 36, `docs/mobile-v3/heartbeat.md`.

## Fonti

- codice: `Makefile`, `.gitlab-ci.yml`, `AGENTS.md`, `Dockerfile`, `Dockerfile-8.4`, `composer.json`, `phpunit.xml`, `docker-compose.yml`, `docker-compose-local.yml`, `docker-compose-linux.yml`
- codice: `scripts/release-api-dev.sh`, `scripts/migrate.php`, `lib/MigrationRunner.php`, `scripts/with-throwaway-mysql.sh`, `scripts/changeset_check.mjs`, `scripts/check_canale_log.php`, `scripts/check_mobile_log_silence.php`, `worker_job.php`
- codice: `lib/CloudWatchLogHelper.php`, `lib/LogChannelHealth.php`, `lib/MobileTassiCanale.php`, `lib/CrashReportFilter.php`, `lib/BaseErrorHandler.php`, `lib/ErrorLog.php`, `json.php`, `acra-report.php`, `lib/MobileV3/Resource/HeartbeatController.php`, `lib/MobileV3/AccessLog.php`
- codice: `lib/Novita.php`, `lib/MobileV3/Feedback/TicketGop.php`, `lib/MobileV3/Feedback/TicketModel.php`, `lib/OperazioneTicket.php`, `.agents/skills/implement-ticket/SKILL.md`, `.agents/skills/cloudwatch-log-investigator/SKILL.md`
- codice: `changeset/` (i changeset di GOP-777 e GOP-810, sezione «Tecnica», per le commesse ancora sulla linea `master`)
- docs: `docs/02-patterns/18-cloudwatch-logging-infrastructure.md`, `docs/02-patterns/26-jira-come-state-storage-dei-task.md`, `docs/02-patterns/30-ingestione-ticket-completati-in-rag.md`, `docs/02-patterns/45-schema-canonico-tenant.md`, `docs/02-patterns/46-changeset-changelog-per-tenant.md`, `docs/02-patterns/48-ticketing-base.md`
- docs: `docs/03-cookbooks/05-cloudwatch-logging.md`, `docs/03-cookbooks/07-deployment-guide.md`, `docs/03-cookbooks/11-local-testing-with-docker.md`, `docs/03-cookbooks/15-guida-test-ui.md`, `docs/03-cookbooks/18-testing-headless-master.md`, `docs/03-cookbooks/19-seeding-dati-test-db.md`, `docs/03-cookbooks/20-test-mobile-headless.md`, `docs/03-cookbooks/21-e2e-test-cycle.md`, `docs/03-cookbooks/22-migrazione-php84.md`, `docs/03-cookbooks/25-isolated-worktree-docker-testing.md`, `docs/03-cookbooks/26-controllo-silenzio-log-mobile.md`, `docs/03-cookbooks/27-rilascio-api-dev.md`, `docs/03-cookbooks/35-errori-dei-job-in-background.md`, `docs/03-cookbooks/36-osservabilita-canale-mobile.md`
- docs: `docs/mobile-v3/aggiornamento.md`, `docs/mobile-v3/heartbeat.md`, `migrations/README.md`, `migrations/main/README.md`, `changeset/README.md`, `tasks/php84-rollout.md`
- wiki: `wiki/assistenza-clienti/annunci-novita-campanella.md`
- Portolano: `android-goplanner-log-sorgenti-rumore-errori`
- Jira: GOP-103 — epic con checkpoint umani e grafo delle dipendenze
- Jira: GOP-121 — primo checkpoint umano sul perimetro delle commesse
- Jira: GOP-195 — registri mobili scartati dal worker
- Jira: GOP-205 — copie di lavoro isolate per i test in Docker
- Jira: GOP-226 — allineamento a PHP 8.3 di composer, Dockerfile e CI
- Jira: GOP-264 — controlli sul canale dei registri mobili
- Jira: GOP-270 — registri mobili mancanti e deriva fra tag e immagine in esecuzione
- Jira: GOP-274 — correzione degli orari dell'API del call center, cancellata da una copia a mano
- Jira: GOP-317 — rilascio della cartella dell'API da un commit di `php8`
- Jira: GOP-338 — migrazioni dei database delle commesse e del database principale
- Jira: GOP-407 — parte server dell'aggiornamento firmato di GOPlanner 3
- Jira: GOP-482 — immagine di base PHP con correzione di sicurezza
- Jira: GOP-483 — creazione dei gruppi di registri una volta per processo
- Jira: GOP-550 — heartbeat di GOPlanner 3
- Jira: GOP-696 — migrazioni per modulo e per singola commessa
- Jira: GOP-698 — test su database costruiti dallo schema canonico
- Jira: GOP-699 — controllo di conformità dello schema delle commesse
- Jira: GOP-709 — controllo del contratto OpenAPI dell'API del call center
- Jira: GOP-711 — formato del changeset e controllo nella pipeline
- Jira: GOP-712 — campanella e pagina Novità per commessa
- Jira: GOP-777 — verifica degli interventi su pagina unica, visibile solo dopo il passaggio a `php8`
- Jira: GOP-810 — passaggio di una commessa a `php8` e GOPlanner 3
- Jira: GOP-828 — controllo per gruppo del canale di log guasto
