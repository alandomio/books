# 14. Il modello dei dati

*In questo capitolo si vede dove sta ogni tabella di GOPlanner, che cosa tiene legate le tabelle quando il database non lo fa, e quali regole seguire per leggere lo schema, scrivere una query e cambiare una colonna. È scritto per gli sviluppatori e per gli agenti di codice; lo staff tecnico trova utili la prima e l'ultima sezione. Chi legge per l'ufficio può fermarsi qui: i capitoli 3 e 6 raccontano gli stessi oggetti dal lato dell'ufficio.*

## Dove si legge lo schema e dove sta ogni tabella

*Per gli sviluppatori, gli agenti di codice e lo staff tecnico.*

Il primo file della cartella `docs/` è `docs/00-concept-index.md`. Si presenta come «Concept Index - Zero Cognitive Load Reference» e dichiara lo scopo: «Instant concept-to-file mapping for LLM agents». Nella parte delle query per caso d'uso offre, per leggere gli interventi di un operatore, questa riga: `JOIN utenze u ON i.id_utenza = u.id_utenza`. Contro lo schema di riferimento, la riga non regge. La tabella `utenze` non ha una colonna `id_utenza`: la sua chiave è `id`. La query si ferma con un errore di colonna sconosciuta, e chi la «ripara» scrivendo `u.id` ottiene una query che gira e legge la tabella sbagliata.

Lo stesso indice propone, per salvare una posizione GPS, `INSERT INTO posizione (operatore, lat, lng, quando, precisione)`. La tabella `posizione` non ha `lat`, `lng` né `quando`: ha `latitudine`, `longitudine`, `ora` e `oratelefono`, e altre colonne obbligatorie senza valore predefinito. Anche questa riga fallisce. La terza query dell'indice, `INSERT INTO interventi_eseguiti (id_utenza, operatore, data, lat, lng, lettura1, note)`, nomina sette colonne che esistono tutte, e sbaglia per quelle che omette. Senza `id_carico`, che è obbligatoria e non ha un valore predefinito, l'inserimento fallisce. Senza `id`, anche con `id_carico` aggiunta, l'esecuzione riceve un numero automatico che non è quello del suo intervento (il perché è nella sezione successiva). Le tre query sono più vecchie del riferimento verificato dello schema, e nessuno le ha ancora allineate.

Quel riferimento oggi c'è, e da lì si parte. L'ordine di lettura è fisso:

1. Le migrazioni. Il file `migrations/tenant/0000_baseline.sql`, chiamato v0, e le migrazioni numerate della stessa cartella (più `modules/` e `custom/<tenant>/`) dicono che cosa esiste nel database di una commessa, che nel codice si chiama tenant.
2. I modelli. La proprietà `$table` di ogni classe dice il nome vero della tabella: `UtenzaBase` dichiara `$table = 'utenti'`; `CaricoBase` punta a `carichi`, `CaricoRigaBase` a `carichi_righe`, `InterventoBase` a `interventi`, `InterventoEseguitoBase` a `interventi_eseguiti`, `FotoBase` a `foto`, `Posizione` a `posizione`, `OperatoreLocaleBase` a `operatori`.
3. I documenti, per ultimi. `docs/01-foundations/07-database-schema.md` e le query di `docs/00-concept-index.md` precedono v0 e lo contraddicono su nomi di tabella, colonne e tipi; le schede di `docs/02-patterns/` restano il posto delle regole.

L'intestazione di v0 dice che cosa contiene. È uno snapshot di produzione del 30 settembre 2026: le tabelle presenti in almeno il 90% delle commesse attive, ventisei, più `magazzino` e `mag_coll`, con la definizione della famiglia di commesse più numerosa, diciannove database identici. In tutto 28 tabelle, tutte `ENGINE=InnoDB`. Per `carichi_righe` e per la tabella `utenti`, che contiene le utenze, v0 riporta solo le colonne comuni: le altre sono colonne di import, che `mappature.php` genera per ogni commessa.

GOPlanner usa due database. Il database principale si chiama `goplanner` e nel libro è il master. Ogni commessa ha poi il suo database, `goplanner_` seguito dal valore di `clienti.db`. La mappa che segue elenca le tabelle che il libro usa.

| Tabella | Database | Che cosa contiene | Capitolo |
|---|---|---|---|
| `clienti` | master | una riga per commessa | 2 |
| `users`, `identita`, `identita_users`, `ruoli`, `ruoli_permessi`, `identita_users_ruoli`, `identita_users_lotti` | master | persone, accessi e profili | 11 |
| `lotti` | master | il nome di ogni lotto (`id_cliente`, `valore`, `nome`, `attivo`) | 3 |
| `operatori` | master | gli operatori, con la commessa a cui appartiene il telefono | 14 (operatori e telefoni) |
| `mobile_v3_dispositivi` e le altre `mobile_v3_*` | master | i telefoni di GOPlanner 3, le segnalazioni, i comandi | 8, 12 |
| `stato_commesse_giorno`, `annunci_letti`, `novita_uscite`, `novita_utenti`, `operazioni_registro`, `ticket_*` | master | dati delle pagine di amministrazione | 12 |
| `utenti` | commessa | le utenze | 3 |
| `carichi`, `carichi_righe` | commessa | liste e pratiche | 3, 4 |
| `interventi`, `interventi_eseguiti`, `foto`, `stati`, `interventi_servizi` | commessa | il lavoro e le sue esecuzioni | 6 |
| `operatori`, `posizione` | commessa | gli operatori e la loro traccia | 8 |
| `impostazioni`, `flexigrid` | commessa | impostazioni e layout delle griglie | 14 (campi e griglie) |
| `importazioni`, `mappature_import`, `esportazioni_registro`, `esportazioni_link`, `mappature_export` | commessa | registri e modelli salvati | 4, 7 |
| `magazzino`, `magazzino_movimenti`, `magazzino_anomalie`, `ddt` | commessa | il magazzino (`magazzino` in v0; le altre dalle migrazioni 0008, 0032 e 0042) | 9 |
| `campi_nuovi` | commessa | il registro dei campi nuovi | 3 |
| `schema_migrations` | commessa | l'elenco delle migrazioni applicate | 14 (migrazioni) |

Non tutte le tabelle della commessa nascono in v0: `mappature_import` arriva con la migrazione 0012, `importazioni` con la 0013, `campi_nuovi` con la 0034, `mappature_export` con la 0039. `schema_migrations` non sta in nessun file: la crea l'esecutore delle migrazioni.

La regola di accesso discende dalla mappa. Una tabella del master si legge sempre con `MainOrm`, una tabella della commessa sempre con `SimpleOrm`; la connessione della commessa si sceglie all'inizio della sessione, e il meccanismo è nel capitolo 2. Che una tabella stia da una parte o dall'altra ha un motivo, e `lotti` lo mostra bene. I lotti visibili a un utente sono in `identita_users.lotti`, nel master. Lo script che crea `lotti` (GOP-227) lo dice: metterla nello stesso schema permette di referenziarla «senza join cross-database». Lo stesso script avverte che `carichi.lotto`, un `tinyint` del database della commessa, resta la chiave operativa. `lotti.valore` è quel numero, `lotti.id` è solo la chiave tecnica della riga, e l'uno non si sostituisce all'altro.

> **Attenzione:** tre nomi ingannano. `utenze` esiste in v0, ha 67 colonne con un vecchio layout (tra queste circa quarantacinque colonne maiuscole come `ACGIRO`) e la leggono solo percorsi vecchi del codice, `grid.php` e alcune azioni di `json.php`; nessuna classe di `lib/` la usa. `users` esiste anche nel database della commessa, con cinque colonne (`id`, `login`, `password`, `admin`, `tipo`), e non contiene gli utenti del gestionale, che sono le righe di `goplanner.users`. `clienti` nel master sono le commesse, mentre `carichi.cliente` è il nome di una lista e la griglia «Clienti» dell'interfaccia mostra utenze.

«Il documento dello schema dice `utenze`, e la tabella c'è: perché non usarla?» Perché l'utenza del codice è la tabella `utenti`: lo dice `UtenzaBase::$table`. La tabella `utenze` conserva un layout precedente e viene letta solo dai percorsi vecchi (il capitolo 3 racconta l'esempio dei conteggi dell'Importazione classica). Una query su `utenze` gira senza errori e restituisce un altro insieme di dati, e nessun messaggio lo segnala.

Il repository non vede la produzione. v0 è la fotografia del layout più comune al 30 settembre 2026, e una commessa esclusa dal confronto può avere colonne diverse (se ne parla nell'ultima sezione). Il master non ha un file unico di schema tenuto da un esecutore: le tabelle recenti vengono da `migrations/main/`, applicate a mano; le tabelle di identità e `lotti` da script in `lib/db/`; `clienti`, `users` e la `operatori` del master compaiono solo in un dump docker del 2022, che contiene anche tabelle con nomi da commessa. La mappa elenca le tabelle che il libro usa, non tutte: `checkpoint`, `rpc`, `log_pc` e `percorsi_gp` esistono in v0 e non sono descritte qui.

Lo schema vero è quello che le migrazioni creano; il nome vero di una tabella è quello scritto in `$table`.

## Le tabelle del lavoro: dalla lista all'esecuzione

*Per gli sviluppatori e gli agenti di codice.*

Il ciclo del capitolo 1, visto dal database, è una catena di righe. Ogni anello ha una parola del glossario e una tabella. Una lista è una riga di `carichi`: il nome sta nella colonna `cliente` (`varchar(50)`), il file importato in `nomefile`, poi `lotto`, `distretto`, `tipo_carico`, `scadenza` e `stato`, che vale `aperto` o `chiuso`. Una pratica è una riga di `carichi_righe`, la tabella più piccola dello schema. Eccola intera, come la dichiara v0:

```sql
-- estratto da migrations/tenant/0000_baseline.sql
CREATE TABLE IF NOT EXISTS `carichi_righe` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_carico` int NOT NULL,
  `id_utenza` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_carico` (`id_carico`),
  UNIQUE KEY `id_carico_2` (`id_carico`, `id_utenza`),
  KEY `id_utenza` (`id_utenza`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
```

La chiave unica `id_carico_2` fissa una regola: un'utenza compare una sola volta in una lista, e può stare in molte liste. Le colonne con i dati del file non ci sono perché sono colonne di import, diverse per ogni commessa (vedi la sezione sui campi personalizzati).

L'utenza è una riga della tabella `utenti`, 24 colonne in v0, tra cui `codice`, `matricola`, `lat`, `lng`, `precisione` e `stato_id`; le colonne con nomi e recapiti sono dati personali e in una query di diagnosi non si selezionano. Un intervento è una riga di `interventi`, 25 colonne: la chiave è `id_intervento`, e due colonne sono entrambe obbligatorie, `id_carico` e `id_utenza`. Accanto stanno `operatore`, `data_pianificata`, `stato_id`, `fascia`, `ordine`. L'esecuzione è una riga di `interventi_eseguiti`, 52 colonne, e qui sta il legame che lo schema non mostra. L'esecuzione porta lo stesso numero del suo intervento: `interventi_eseguiti.id` è uguale a `interventi.id_intervento`.

La tabella non ha una colonna `id_intervento`, e una join scritta su `ie.id_intervento` fallisce. Il codice la scrive così, in `lib/json_functions.php` e in `AvanzamentoCarichi`: `LEFT JOIN interventi_eseguiti ON interventi.id_intervento=interventi_eseguiti.id`. Eppure in v0 `interventi_eseguiti.id` è un `int NOT NULL AUTO_INCREMENT`: nulla nel database impone che coincida con l'intervento. Lo impone chi scrive. Il percorso dell'app 1.x esegue un `REPLACE INTO interventi_eseguiti (id, id_utenza, …)` con l'id dell'intervento passato esplicitamente. `InterventoBase::getInterventoEseguito()` cerca `InterventoEseguito::getById($this->id_intervento)` e, se non trova la riga, costruisce un oggetto nuovo con quello stesso id, più `operatore`, `id_utenza` e `id_carico` copiati dall'intervento, senza salvarlo.

> **Attenzione:** un controllo «esiste l'esecuzione?» non si scrive con `null`. `getInterventoEseguito()` restituisce `null` solo se va in eccezione; quando la riga manca restituisce un oggetto nuovo. Il controllo giusto è `!$ie->isNew()`, e la guardia di `lib/Intervento.php` controlla entrambe le cose: `$ie !== null && !$ie->isNew()`.

Le foto sono righe di `foto`, con `id_intervento` e `id_utenza` entrambi obbligatori; `tipo` vale 99 per la firma del cliente e 98 per la domiciliazione (capitolo 8). Gli interventi e i servizi si legano in `interventi_servizi`, chiave primaria sulla coppia `id_intervento`, `id_servizio`. La tabella `servizi` ha `id`, `nome`, `tipo` e `postazione`, e non va confusa con la colonna `interventi_eseguiti.servizi`. Le colonne che puntano altrove sono queste:

| Colonna | Punta a | Chi la tiene allineata |
|---|---|---|
| `carichi_righe.id_carico` | `carichi.id` | il codice |
| `carichi_righe.id_utenza` | `utenti.id` | il codice |
| `interventi.id_carico` | `carichi.id` | il codice |
| `interventi.id_utenza` | `utenti.id` | il codice |
| `interventi.operatore` | `operatori.id` | il codice |
| `interventi.stato_id` | `stati.id` | il codice |
| `interventi_eseguiti.id` | è `interventi.id_intervento` | il codice |
| `interventi_eseguiti.id_utenza`, `id_carico`, `operatore`, `stato_id` | copie dei valori dell'intervento | il codice |
| `foto.id_intervento` | `interventi.id_intervento` | il codice |
| `foto.id_utenza` | `utenti.id` | il codice |
| `interventi_servizi.id_servizio` | `servizi.id` | il codice |

L'ultima colonna è la stessa in ogni riga, e la sezione successiva spiega perché. Un dettaglio: `foto.operatore` è un `varchar(15)`, mentre `interventi.operatore` è un `int`. Non tutte le colonne che si chiamano `operatore` contengono la stessa cosa. Le fonti di questa guida non dicono che cosa scrivano lì i percorsi delle foto: prima di unire `foto.operatore` a `operatori.id` si legge il codice che la scrive.

### Stati ed esiti

Gli stati sono costanti di codice. `InterventoBase` li definisce da 1 a 10 e raggruppa in `STATI_DA_FARE` i valori 1, 2, 3 e 10. `InterventoEseguitoBase` ripete da 1 a 8 e aggiunge 99; 9 e 10 lì non esistono.

| Codice | Costante | In `InterventoBase` | In `InterventoEseguitoBase` |
|---|---|---|---|
| 1 | `IMPORTATO` | sì (da fare) | sì |
| 2 | `VALIDATO` | sì (da fare) | sì |
| 3 | `ASSEGNATO` | sì (da fare) | sì |
| 4 | `ESEGUITO` | sì | sì |
| 5 | `NON_FATTIBILE` | sì | sì |
| 6 | `CONTROLLATO` | sì | sì |
| 7 | `INVIATO` | sì | sì |
| 8 | `RIPIANIFICABILE` | sì | sì |
| 9 | `ANNULLATO` | sì | no |
| 10 | `PRENOTATO` | sì (da fare) | no |
| 99 | `STATO_UTENTEASSENTE` | no | sì |

La tabella `stati` ha solo `id`, `nome` (`char(15)`) e `colore`: i nomi possono cambiare da commessa a commessa, i numeri no. Lo stato e l'esito sono due colonne diverse. `interventi_eseguiti.stato_id` dice a che punto è il lavoro; `interventi_eseguiti.esito`, un `tinyint`, dice com'è andata. La scheda `docs/01-foundations/03-database-facts.md` annota che con `esito = 1`, successo, `lettura1` e, se serve, `nuova_matricola` devono essere compilati. La colonna `esito` mancava in tredici schemi, e la Verifica foto, la pagina «Carichi» e gli strumenti MCP andavano in errore SQL (GOP-645); oggi è in v0.

«Per sapere se un intervento è chiuso guardo `interventi.stato_id`, no?» Non per 6 e 7. Lo stato 7, Inviato, viene scritto dagli esportatori solo su `interventi_eseguiti.stato_id`, e `interventi.stato_id` resta indietro, a 4 o a 6. `AvanzamentoCarichi` (GOP-640) è la fonte unica dei numeri di una lista e lo scrive nel suo commento: «Gli stati di chiusura si leggono da `interventi_eseguiti.stato_id`, non da `interventi.stato_id`»; per lui un'esecuzione è eseguita con 4, 6 o 7. Una cosa è cambiata. Quando l'ufficio porta un esito a uno stato chiuso o verificato nella Verifica, `InterventoBase::allineaStatoAEsitoVerificato()` aggiorna anche `interventi.stato_id`, ma solo se era ancora tra gli stati da fare. Un intervento già chiuso, inviato o annullato non si tocca. Il significato per l'ufficio è nel capitolo 3.

Anche `utenti.stato_id` è una copia. Il metodo che la scrive di solito è `InterventoBase::updateStatoUtenza()`, chiamato 51 volte in `lib/ADMINController.php`: esegue `UPDATE utenti SET stato_id=… WHERE id=… AND stato_id<>…` con lo stato di quell'unico intervento. La scheda `docs/02-patterns/34-stato-utenza-derivato-ultimo-intervento.md` lo chiama «l'unico punto» che scrive la colonna, ma il codice ne ha altri: `allineaStatoAEsitoVerificato()`, `cambia_stato` in `lib/json_functions.php`, `JSONController`, l'auto-assegnazione di GOPlanner 3, la reimportazione, `pages/file.php` e diversi endpoint vecchi. Con l'impostazione `interventi_multipli` attiva, un'utenza con due interventi aperti mostra lo stato dell'ultimo toccato, e la scheda precisa che è la configurazione voluta, non un difetto. Per un report nuovo lo stato vero si calcola da `interventi` e `interventi_eseguiti` (per esempio con `UtenzaBase::getUltimoInterventoChiuso()`), non da `utenti.stato_id`. La regola per l'ufficio è nel capitolo 3.

Lo schema di v0 ha dei limiti di lettura. Contiene solo le colonne comuni ad almeno il 90% delle commesse: `carichi_righe` e `utenti` ne hanno molte di più in ogni commessa. Delle 52 colonne di `interventi_eseguiti`, molte cambiano significato da una commessa all'altra: `lettura1`…`lettura9` (`varchar(100)`), `flag1`…`flag10`, `esportato`, `modificato`, `backoffice`. Delle colonne con il suffisso `_m` il codice dice una cosa precisa: `lat_m`, `lng_m`, `data_m`, `lettura_m`, `sim_m` e `precisione_m` le scrive solo l'azione di amministrazione `dati_originali`, che rilegge nel `log` le richieste `put_intervento` dell'app 1.x e ne copia i valori originali del telefono. Le etichette degli stati, infine, si ridefiniscono per commessa (`VerificaInterventi::configPredefinita()`, capitolo 6).

> **Per lo staff tecnico:** in una segnalazione bastano tre riferimenti. L'`id_intervento`, che è anche l'id dell'esecuzione; `utenti.codice` per l'utenza, mai nomi; `carichi.id` per la lista.

Una lista, le sue pratiche, l'utenza, l'intervento e la sua esecuzione sono cinque tabelle legate da numeri; l'esecuzione porta lo stesso numero dell'intervento.

## Relazioni senza chiavi esterne: che cosa tiene insieme i dati

*Per gli sviluppatori e gli agenti di codice; lo staff tecnico può leggere la tabella dei percorsi che tengono le relazioni.*

In v0 ci sono 28 tabelle e nessuna `FOREIGN KEY`. Il numero si verifica con un `grep` sul file. Le migrazioni successive aggiungono chiavi esterne solo fuori dalle tabelle del lavoro: la 0008 lega `depositi` e `magazzino_movimenti` a `operatori` e a `depositi`, la 0042 lega le righe e gli allegati dei DDT a `ddt`, e il modulo `zone_outbound` lega le sue tabelle di giornate, squadre e prenotazioni. Su `carichi`, `carichi_righe`, `utenti`, `interventi`, `interventi_eseguiti` e `foto` non c'è nessun vincolo. Nemmeno `migrations/main/` e gli script di `lib/db/` contengono un `REFERENCES`. Le tabelle sono InnoDB, quindi il motore le chiavi esterne le permetterebbe. Lo schema non le dichiara, e nessuna fonte del repository, nessuna scheda e nessun ticket ne spiega la ragione.

Le conseguenze sono meccaniche. MySQL accetta in `interventi.id_utenza` qualunque numero, anche quello di un'utenza che non c'è più. Una `DELETE` su `interventi` non si propaga a `interventi_eseguiti`, a `foto`, a `interventi_servizi`. Nessun vincolo rifiuta una riga orfana. Il codice lo sa, e in un punto lo scrive in chiaro: il pulitore dei dati di prova, `lib/DatiProva.php` (GOP-705), porta il commento «anche i figli degli interventi (non ci sono chiavi esterne)». Prima di cancellare l'intervento, cancella da sé le righe figlie da ogni tabella che ha una colonna `id_intervento`, trovata in `information_schema`.

### Il motore delle tabelle: InnoDB e MyISAM

Sul motore le fonti non dicono tutte la stessa cosa, e la differenza conta. Il capitolo 6 e la scheda `docs/02-patterns/21-guard-cancellazione-intervento-eseguito.md` parlano di tabelle `MyISAM`, e lo schema di `07-database-schema.md` ripete `ENGINE=MyISAM` undici volte. v0, cioè la fotografia del 30 settembre 2026, dichiara InnoDB per tutte le 28 tabelle della commessa.

Nel master il discorso cambia. Il codice che assegna un accesso dice in più punti che `users` «può essere MyISAM», e il dump docker del master ha `users`, `operatori` e `clienti` in MyISAM. Su MyISAM una transazione non vale. Per questo `lib/AccessoCommessa.php` e `lib/InvitoUtente.php` scrivono `users.tipo` fuori dalla transazione dei ruoli, dopo il commit, e la scheda `32-creazione-utenti-percorsi-e-metodo-canonico.md` spiega l'ordine: un fallimento lascia l'accesso nello stato meno privilegiato, mai in quello più privilegiato. La regola che ne segue è stretta. Una transazione aperta sul master non protegge `users`. Per le commesse escluse da v0 il repository non conosce il motore, e il codice ne tiene conto: `MagazzinoColdSwitch` controlla che la tabella `operatori` sia InnoDB e, se non lo è, avverte che «le chiavi esterne di 0008 falliranno».

### I percorsi che tengono le relazioni

Le relazioni, allora, le tengono pochi percorsi del codice. Ciascuno ha un modo di essere aggirato.

| Relazione | Che cosa la protegge | Che cosa la aggira |
|---|---|---|
| esecuzione e suo intervento | `elimina_interventi_non_chiusi()` in `lib/json_functions.php` (azioni `del_intervento` e `del_interventi` di `json.php`) salta gli interventi con una riga in `interventi_eseguiti` e restituisce quanti non ha cancellato | una `DELETE FROM interventi` scritta a mano |
| esecuzione e suo intervento | `JSONController::elimina_intervento()` controlla con `SELECT id FROM interventi_eseguiti WHERE id=…`; un appuntamento del call center lo annulla (stato 9) invece di cancellarlo | una `DELETE FROM interventi` scritta a mano |
| esecuzione e suo intervento | `lib/Intervento.php::delete()` rifiuta un intervento con esecuzione, ma solo dove la commessa usa quella classe | le commesse il cui `php/Intervento.php` estende `InterventoBase` |
| `utenti.stato_id` | soprattutto `updateStatoUtenza()` | qualunque altro `UPDATE utenti SET stato_id` |
| numeri di una lista | `AvanzamentoCarichi` (GOP-640) | un report che riconta su `interventi.stato_id` |
| nome di un lotto | `LottoService::opzioniSelect()`, nell'ordine di GOP-227: anagrafica `lotti`, poi `$custom['lotti']`, poi i valori presenti | leggere `$custom['lotti']` direttamente |
| colonne di una tabella | `SimpleOrm::insert()`/`update()` scartano i campi che la tabella non ha, e oggi lo registrano | un `INSERT` grezzo con una colonna che manca, che fallisce |
| `sim_id` tra master e commessa | `DeviceStore::ensureSimId()` scrive nella `operatori` del master e poi nella `operatori` della commessa, con lo stesso id | nessun vincolo controlla che i due numeri coincidano |

Il punto debole della guardia in `Intervento::delete()` è il numero delle commesse che la saltano. In `custom/` ci sono 74 cartelle; 61 commesse hanno un proprio `php/Intervento.php`, e 58 di queste estendono direttamente `InterventoBase`, quindi non passano da `lib/Intervento.php`. Solo due ridefiniscono `delete()`, ed entrambe ripetono il controllo `getInterventoEseguito`/`isNew`. È il motivo per cui il commento di `elimina_interventi_non_chiusi()` dice: «Il controllo e' fatto qui e non solo in Intervento::delete()». Che cosa succede quando un percorso di cancellazione non controlla lo racconta il capitolo 6: esecuzioni orfane cadute fuori dalle esportazioni.

«Devo pulire degli interventi di prova: una `DELETE` con un `WHERE` preciso non basta?» No. Toglie l'intervento e lascia la sua esecuzione, le sue foto e le sue righe di `interventi_servizi` che puntano a un numero che non c'è più. La pratica resta com'era, perché `carichi_righe` punta alla lista e all'utenza, non all'intervento. Un'esportazione costruita con `LEFT JOIN interventi` e un filtro sulle colonne di `interventi` perde quell'esecuzione senza avvisare. Il percorso giusto passa dalle azioni JSON, che rifiutano le righe con un'esecuzione, o dal pulitore dei dati di prova, che cancella prima i figli. Ripulire dati su una commessa di produzione è una decisione dello staff tecnico, non di chi sviluppa.

Le guardie hanno un perimetro. Coprono i percorsi che passano da `json_functions.php`, da `JSONController::elimina_intervento()` e, dove la commessa la usa, da `Intervento::delete()`. La scheda 21 lo dice in chiaro: le query grezze che cancellano `interventi` restano un «rischio residuo» ovunque non siano ancora state portate sull'ORM. Le due commesse che ridefiniscono `delete()` ripetono il controllo nel loro codice (capitolo 6). Anche il pulitore dei dati di prova ha il suo perimetro: cerca i figli in `information_schema` per nome di colonna, `id_intervento`, e `interventi_eseguiti`, legata all'intervento dal proprio `id`, non è tra le tabelle che trova.

Nessun vincolo del database rifiuta una riga orfana: la rifiuta il codice, se la modifica passa da lì.

## Operatori, telefoni e posizioni

*Per gli sviluppatori e gli agenti di codice.*

In v0 sei tabelle della commessa hanno una latitudine: `posizione`, `interventi_eseguiti`, `utenti`, `interventi`, `operatori` e `timbratura`. Un report che sceglie quella sbagliata disegna una mappa corretta della cosa sbagliata. La differenza si vede anche nei tipi: `interventi.lat` e `interventi.lng` sono `double`, quelle di `posizione`, `interventi_eseguiti`, `utenti` e `operatori` sono `decimal(9,6)`.

L'operatore vive in due posti. Nel database della commessa c'è `operatori`, 15 colonne: `id`, `sim_id` (`varchar(30)`, indicizzato), `id_user`, `attivo`, `nascosto`, `stato`, `tag_id`, `correzione_gps` (predefinito 2), `lat`, `lng`, e le colonne personali `nome`, `cognome`, `telefono`, `email`, `domicilio`, che restano fuori da ogni query di diagnosi. Nel master c'è un'altra tabella `operatori`, letta da `Operatore extends MainOrm`, con la colonna `cliente`. Il cookbook `docs/03-cookbooks/20-test-mobile-headless.md` spiega perché. Il `sim_id` si risolve «globalmente» sulla tabella del master, con una join su `clienti`, per sapere a quale commessa appartiene il telefono; il `sim_id` è unico, e un operatore creato con un `sim_id` già usato azzera quello del precedente; per le scritture, l'operatore viene riletto dalla tabella della commessa. Le due tabelle condividono l'id. `DeviceStore::ensureSimId()` genera un `sim_id` di GOPlanner 3, `G3` seguito da dodici caratteri esadecimali, lo scrive nel master e poi nella commessa, sulla riga con lo stesso `id`.

I telefoni di GOPlanner 3 stanno solo nel master, nella tabella `mobile_v3_dispositivi` (migrazione `main/0001`). Il motivo è scritto nella migrazione: il dispositivo va riconosciuto prima di sapere a quale commessa appartiene. Tra le colonne ci sono `device_id`, `stato` (pending, enabled, disabled), `cliente_id`, `tenant` e `operatore_id`, che punta alla `operatori` del master. Il server conserva solo la chiave pubblica, mai un segreto, e il codice di abbinamento di tre caratteri scade dopo 24 ore. La migrazione `main/0019` aggiunge `permessi`, un JSON scritto solo da `PUT /v3/dispositivo/permessi`. Anche `operatori.id_user` ha due letture: due azioni vecchie di `json.php`, `put_cantiere` e `put_operatore`, lo uniscono alla `users` della commessa; il codice nuovo, per esempio `MagazzinoRuolo`, lo unisce a `goplanner.users`.

### Di chi è una latitudine

Ogni latitudine ha un proprietario.

| Dove | Colonne | Che cosa dice | Chi la scrive |
|---|---|---|---|
| `posizione` | `latitudine`, `longitudine`, `precisione`, `ora`, `oratelefono`, `providergps` (`fused` o `network`), `batteria`, `operatore` | la traccia dell'operatore, punto per punto | l'app |
| `interventi_eseguiti` | `lat`, `lng`, `precisione`, `distanza`, e la chiave `_posizione` di `servizi` | il punto in cui l'esito è stato chiuso, l'età del fix o il motivo per cui manca | `EsitoWriter` con `PosizioneChiusura` (GOP-621) |
| `utenti` | `lat`, `lng`, `precisione` | dove si trova l'utenza, geocodificata, e come è stato ottenuto il punto | la geocodifica (GOP-756, `lib/PrecisioneUtenza.php`) |
| `interventi` | `lat`, `lng`, `precisione`, `distanza` | una copia dei valori di chiusura | il percorso dell'app 1.x, dopo l'esecuzione |
| `operatori` | `lat`, `lng` (più `geocodifica_fonte`, `geocodifica_il`) | il punto di partenza dell'operatore, la sua «casa» per i report di distanza | la geocodifica dell'indirizzo di partenza (GOP-682); la migrazione 0020 aggiunge fonte e data |
| `timbratura` | `lat`, `lng` | il punto di una timbratura, con `operatore`, `orario` e `verso` | il modulo delle timbrature |

Tre righe della tabella chiedono una precisazione. In `interventi_eseguiti`, `distanza` è la distanza in chilometri tra il punto di chiusura e la posizione dell'utenza, calcolata da `InterventoBase::setFromAndroid()`. In `utenti`, `precisione` vale `-1` non trovata, `0` o NULL da fare, `1` civico, `2` validata o a mano, `3` approssimata, `4` fuori comune, `5` e `6` approssimata o fuori comune accettata: ogni valore positivo vuol dire che le coordinate ci sono, e il codice nuovo usa `PrecisioneUtenza::haCoordinate()`, non `= 1`. In `interventi`, la copia dei valori di chiusura la scrive il percorso 1.x; le fonti non dicono se lo faccia anche GOPlanner 3. Una lettura di `json.php` mostra il rischio: con `COALESCE(interventi.lat, utenti.lat)`, dove manca il punto di chiusura prende quello dell'utenza, e sulla mappa i due proprietari si confondono.

### La chiave `_posizione`

La scelta di `_posizione` mostra come si aggiunge un dato senza toccare lo schema. L'età del fix di chiusura e il motivo di una posizione mancante stanno in `interventi_eseguiti.servizi` sotto la chiave riservata `_posizione`. Il docblock di `PosizioneChiusura` lo dice: «nessuna colonna nuova, nessuna migrazione per tenant». La chiave comincia con `_` perché nessun campo di una commessa può avere quel nome: `EsitoWriter` accetta solo nomi che la commessa definisce. Le due forme, con i valori di esempio del docblock:

```json
{"_posizione":{"fix_at":"2026-10-29T08:25:00Z","fix_age_s":300,"fix_source":"ultima_rilevata"}}
{"_posizione":{"posizione_assente":true,"posizione_assente_motivo":"gps_spento"}}
```

`fix_source` vale `attuale` o `ultima_rilevata`. Il motivo vale `permesso_negato` («permesso negato»), `gps_spento` («GPS spento») o `nessun_fix` («nessun fix disponibile»), e quando manca si legge «motivo non indicato». Il racconto delle chiusure senza posizione che hanno portato a questa chiave appartiene al capitolo 8.

La tabella `posizione` ha una chiave unica su (`oratelefono`, `latitudine`, `longitudine`). Lo stesso punto inviato due volte resta una riga sola, ma in due modi diversi secondo la generazione dell'app. GOPlanner 3 scrive con `ON DUPLICATE KEY UPDATE id = id` in `PosizioniWriter`: la riga esistente resta com'era e il fix risulta `duplicate`. Un lotto di al massimo 200 fix si salva in una transazione sola, così un errore del database annulla tutto e il nuovo tentativo ritrova i punti come duplicati. I percorsi 1.x scrivono con `REPLACE INTO posizione`, e il punto nuovo sostituisce il vecchio. Gli indici su `operatore` e `ora` servono alle letture. `ora` è l'orario del server, `oratelefono` quello del telefono, e `Posizione::getKmPeriodo()` ordina la traccia per `oratelefono`: un orologio del telefono sbagliato sposta i punti in un altro giorno.

«Perché la posizione dell'esito non sta in `posizione`?» Perché `posizione` è la traccia, una sequenza di punti dell'operatore che non sa nulla degli interventi. La posizione di chiusura appartiene all'esecuzione, insieme alla sua età o al suo motivo, e così viaggia con l'esito nella Verifica e nell'esportazione (capitoli 6 e 7).

Le fonti non dicono quanto cresce `posizione` né per quanto tempo si conservano i punti: la tabella è per commessa e riceve ogni fix, e la dimensione dei database la registra `stato_commesse_giorno` (capitolo 12). L'app può mandare l'inizio e la fine di un intervento che il server non conserva (capitolo 8): prima di cercarli in `interventi_eseguiti.inizio` e `fine` si controlla chi scrive quelle colonne. Le colonne personali di `operatori` e `utenti` sono dati personali, e una query di diagnosi seleziona id e codici. La tabella `operatori_db` compare solo nei dump vecchi del master: nel codice di `php8` non si trova chi la legga, e il suo ruolo attuale le fonti non lo dicono.

Prima di leggere una latitudine si chiede di chi è: dell'operatore, dell'esito o dell'utenza.

## Campi personalizzati e griglie: dove una commessa aggiunge dati

*Per gli sviluppatori e gli agenti di codice.*

Una commessa chiede un dato che le altre non hanno. I posti in cui può finire sono quattro, e per ogni caso uno solo è giusto.

| Meccanismo | Dove sta il valore | Chi lo crea | Si filtra e si ordina? | Nel canone? |
|---|---|---|---|---|
| colonna di import | una colonna di `carichi_righe` o di `utenti` | `mappature.php`, dalla mappatura (capitolo 4; codice nel capitolo 13) | sì | no: resta fuori per regola, mai dichiarata in una migrazione |
| campo nuovo | una colonna `extra_<nome>` di `carichi_righe`, registrata in `campi_nuovi` | il server, quando l'ufficio usa «+ Nuovo campo…» in File › Importazione (GOP-770) | sì | il registro sì (`0034_campi_nuovi.sql`); le colonne sono della commessa |
| campo dell'intervento | una chiave dentro `interventi_eseguiti.servizi` | `Intervento::getCampiCustom()` della commessa lo dichiara, l'app lo compila | solo estraendolo con `JSON_EXTRACT`, senza indice | la colonna sì; le chiavi sono della commessa |
| Campo Extra | da nessuna parte: un'espressione SQL calcolata in lettura | `Intervento::getCampiExtra()` lo dichiara, `InterventoBase::generaSQLExtra()` lo monta come `mysql AS name` per il web | dipende dall'espressione | no: non è schema |

Le colonne del campo nuovo sono `VARCHAR(255)`, `DECIMAL(18,4)` o `DATE`, tutte NULL, e il nome deve rispettare `^extra_[a-z0-9_]{1,50}$`. I limiti dei campi nuovi, 30 per commessa e 400 colonne per tabella, sono spiegati nel capitolo 3. Il lavoro è recente: GOP-770 è ancora in corso, e all'11 novembre 2026 nessuna commessa di produzione aveva colonne `extra_*`.

La storia del campo nuovo spiega la regola. Prima di GOP-770 il valore finiva in `carichi_righe.campi_extra`, introdotta dalla migrazione 0014, come un JSON `{nome: valore}` in una colonna di testo. La scheda `51-campo-nuovo-colonna-di-carichi-righe.md` riporta la richiesta che ha cambiato le cose: «Vorrei evitare una struttura mista con campi_extra text, perche' e' difficile applicare i filtri avanzati». Nessuna griglia, nessun filtro e nessuna esportazione leggeva quel JSON, e il Filtro Avanzato non può fare `>=`, `BETWEEN` né ordinare su una voce di un JSON di testo. La colonna esisteva in 28 commesse e nessuna riga aveva un valore: zero su 28. La regola: in `campi_extra` non si scrive più nulla, e un valore da filtrare è una colonna vera.

Anche `servizi` è testo. In v0 `interventi_eseguiti.servizi` è una colonna `text NULL` che contiene JSON, non una colonna di tipo `JSON` di MySQL, anche se alcune schede la chiamano così. Si legge con `JSON_EXTRACT(servizi, '$.nome_campo')`. Una query di controllo, con una chiave e delle date inventate per l'esempio:

```sql
-- esempio: la chiave contatore_accessibile e le date sono inventate
SELECT id, JSON_EXTRACT(servizi, '$.contatore_accessibile') AS contatore_accessibile
FROM interventi_eseguiti
WHERE data >= '2026-11-02' AND data < '2026-11-09';
```

Le chiavi che cominciano con `_`, come `_posizione`, sono riservate al codice comune.

### Le griglie: flexifields e la tabella flexigrid

Una griglia del back-office è definita in `custom/<tenant>/php/flexifields.php`, nell'elemento `$flexifields['<griglia>']`. Le sue parti sono tre:

- `colmodel`, le colonne, con le chiavi `display`, `name`, `width`, `align`, `sortable`, `hide`, `format`, `process`, `cls`;
- `searchitems`, i campi di ricerca;
- `buttons`, i pulsanti.

Il file lo carica solo `FlexifieldsTenant::carica()`, in quest'ordine: `lib/flexifields_defaults.php`, che esiste per Carichi, Dispositivi e Magazzino e si carica solo se richiesto; poi `custom/<tipo>/php/flexifields.php`; poi `custom/<tenant>/php/flexifields.php`. È lo stesso ordine di sovrascrittura del capitolo 2.

Il layout di ogni utente sta nella tabella `flexigrid`: `user`, `grid`, `field`, `width`, `ordine`, `visible`, con chiave primaria su `user`, `grid` e `field`, charset latin1. `FlexigridLayout` applica le righe salvate per nome, in ordine di `ordine`; salta un nome che la griglia non ha più; mette in fondo le colonne nuove. Solo un `visible=0` salvato ha effetto, e `hide => true` nel `colmodel` è un pavimento: l'utente non può rendere visibile quella colonna. Il motivo è storico. Prima di GOP-222 la colonna `visible` veniva scritta sempre a 1 e mai riletta, quindi ogni installazione aveva righe con `visible=1` che, lette alla lettera, avrebbero scoperto colonne tecniche come `stato_id` e `id_utenza` al primo rilascio. Il risolutore è uno solo, `FlexigridLayout::colonne()` con `::griglia()`, e serve intestazioni, celle, Excel e Dispositivi: una terza copia della logica non va scritta.

Per aggiungere una colonna a una griglia di una commessa:

1. Aggiungere l'elemento al `colmodel` di `custom/<tenant>/php/flexifields.php`, con un'etichetta SQL unica nella griglia.
2. Se l'espressione legge una tabella che l'azione della griglia non unisce, aggiungere la join dal gancio della griglia dove esiste (per esempio `MagazzinoBase::getJoinGriglia()`, scheda 24), mai con un nuovo `if ($_SESSION['user']['db'] == …)` in `json.php`. Le join di Clienti e Interventi stanno nel motore delle operazioni (capitolo 15).
3. Se la pagina manda un `sortname` iniziale o una colonna che non è in `flexifields`, registrarla tra le colonne extra dell'azione in `GridRequest::endpointDefinitions()`.
4. Eseguire `tests/FlexigridColonneTenant_Test.php`, che controlla ogni griglia di ogni commessa in `custom/*`: intestazioni e celle devono coincidere per nome e numero, e due colonne con la stessa etichetta collassano in una cella sola e fanno fallire il test.

La richiesta di una griglia viene validata prima di ogni query (GOP-416, GOP-691). `sortname` e `qtype` devono stare nell'elenco chiuso dell'azione; `rp` va da 0 a 1.000; la larghezza di una colonna da 1 a 5.000 (predefinita 120); il layout salvato ha da 1 a 127 campi, perché `ordine` è un `tinyint`, ciascuno al massimo di 50 caratteri latin1. Fuori da questi limiti la pagina risponde HTTP 400, richiesta non valida, con `{"error":true,"message":"Invalid grid parameters"}`, e nessuna query parte.

«Ho aggiunto la colonna nel `colmodel` e la griglia risponde 400.» La richiesta nomina una colonna fuori dall'elenco chiuso dell'azione, di solito il `sortname` iniziale della pagina: va registrata in `endpointDefinitions()`, il terzo passo. Se invece la griglia mostra l'intestazione con le celle vuote, il registro contiene una riga `griglia_sfasata tenant=… grid=… utente=… intestazioni=N celle=M missing=…`, e `missing` nomina la colonna rimasta senza cella.

Il campo dell'intervento ha un costo. Una chiave di `servizi` non si indicizza e non si confronta come numero senza estrarla, quindi un filtro su di essa legge tutte le righe. Le colonne di import cambiano da commessa a commessa, e il codice comune non le deve leggere. Circa ventisei azioni di griglia di `json.php` portano ancora join scritte a mano per singole commesse (scheda 24): il lavoro nuovo usa il gancio, le catene vecchie non si migrano in un colpo. L'Excel di una griglia esporta ogni colonna del `colmodel`, anche quelle nascoste, e non è un file per il committente (capitolo 7).

Un dato da filtrare è una colonna vera; un dato che compila l'operatore è una chiave di `servizi`; una griglia si cambia in `flexifields.php`, non in `json.php`.

## Schema canonico, migrazioni e regole di accesso

*Per gli sviluppatori, gli agenti di codice e lo staff tecnico che applica le migrazioni.*

Su alcune commesse la colonna `impostazioni.chiave` era un `VARCHAR(20)`. La pagina Impostazioni › App GOPlanner 3 salvava le chiavi `interventi_giorni_indietro` e `interventi_giorni_avanti`, e MySQL, senza un `sql_mode` rigido, le troncava in silenzio a venti caratteri: `interventi_giorni_in` e `interventi_giorni_av`. `FinestraInterventi` cercava la chiave intera e non trovava mai il valore. La causa era nello schema: la migrazione 0002 allargava quella colonna, ma non era mai arrivata alle commesse senza baseline. Il rimedio ha due parti (GOP-546). La migrazione `0026_impostazioni_chiave_troncata_riparata` allarga la colonna a `VARCHAR(64)` solo dove è più stretta e ripristina la chiave intera; se la chiave intera esiste già vince lei, e la troncata si cancella. Prima di applicarla si è fatta un'anteprima in sola lettura su tutte le commesse. In più, `ImpostazioniGenerale::chiaveEntra()` ora rifiuta e registra una chiave più lunga della colonna, invece di lasciarla troncare. Uno schema che cambia da commessa a commessa sbaglia in silenzio, e solo su alcune.

La risposta è lo schema canonico, deciso il 5 novembre 2026 (GOP-696, scheda `docs/02-patterns/45-schema-canonico-tenant.md`). Lo schema canonico di una commessa è v0, più le migrazioni core, più i moduli che la commessa dichiara in `custom/<tenant>/moduli.json`, più le migrazioni proprie della commessa. Fuori dallo standard, ammessi e mai rimossi, stanno solo due insiemi: le colonne di import di `carichi_righe` e di `utenti`, e le tabelle e i campi della logica propria di una commessa, dichiarati come sua migrazione. Tutto il resto è deriva.

Le migrazioni hanno tre livelli, e si applicano in quest'ordine:

| Livello | Cartella | A chi si applica |
|---|---|---|
| generali | `migrations/tenant/NNNN_slug.sql` | ogni database di commessa |
| moduli | `migrations/tenant/modules/<modulo>/` | solo le commesse che dichiarano il modulo, nell'ordine dichiarato |
| della commessa | `migrations/tenant/custom/<tenant>/` | solo quel database |

I moduli oggi sono sette, tra cui `timbrature`, `letture` e `zone_outbound`. Il master è un'altra storia: `migrations/main/` non ha un esecutore, perché `scripts/migrate.php` lavora solo sui database delle commesse, e i file si applicano a mano, in ordine numerico, per decisione del responsabile tecnico.

Si aggiunge e basta. `master`, il ramo su PHP 7.3, e `php8` girano sugli stessi database: rimuovere o rinominare una colonna romperebbe l'altro ramo. Ogni cambiamento è quindi expand-only, e rimozioni e rinomine arrivano in un rilascio successivo, quando nessuna delle due versioni usa più l'oggetto.

Lo schema canonico ha un cancello. La migrazione `0000_baseline` si registra solo su una commessa già conforme a `0000_baseline.expected.json`; le altre risultano `excluded`, anche in anteprima, e non ricevono nulla, nemmeno le migrazioni generali, finché non vengono riallineate. Il riallineamento è additivo e si fa una commessa alla volta, con uno script e un rapporto generati senza eseguire nulla (`make riallinea_tenant`, GOP-697). Quante commesse erano escluse lo dice il capitolo 2.

### Aggiungere una colonna che il codice comune usa

1. Scrivere `migrations/tenant/NNNN_slug.sql` con una sola modifica: rilanciabile (`IF NOT EXISTS`, oppure un controllo su `information_schema` con `PREPARE` ed `EXECUTE`), additiva, con charset, collation ed engine espliciti, senza `USE`, senza nomi qualificati `goplanner*.tabella`, senza down-migration.
2. Metterla nella stessa MR del codice che legge la colonna.
3. Se la colonna appartiene alla logica di una sola commessa, metterla invece in `migrations/tenant/custom/<tenant>/`: deve girare su v0 da sola, quindi niente `AFTER` una colonna creata da una migrazione core.
4. Provarla su un MySQL usa e getta con `make test_migrate`. I test che usano tabelle di commessa le costruiscono con `SchemaCanonico::installa()` (GOP-698), così una colonna che il canone non ha fa fallire il test già in sviluppo.
5. Generare l'anteprima con `php scripts/migrate.php --tenant=<db>`, che di default è in sola lettura; senza `--tenant` o `--all` l'esecutore rifiuta di partire.
6. Consegnare l'anteprima e l'uscita di `make schema_check` allo staff tecnico. L'`--apply` è suo, e il controllo al rilascio è nel capitolo 16.

Un file già applicato non si modifica più. L'id registrato in `schema_migrations` è il percorso del file senza `.sql`, al massimo 100 caratteri, e accanto c'è il checksum `sha1` del file. Se cambia, l'esecutore si ferma con «il file e' stato modificato dopo l'applicazione (checksum diverso)». Un errore si corregge in avanti, con un file nuovo.

### Le regole di accesso al database

Le regole di accesso sono il solo vincolo che c'è.

| Regola | Perché | Dove |
|---|---|---|
| il master si legge con `MainOrm`, la commessa con `SimpleOrm` | sono due connessioni e due database | `lib/MainOrm.php`, `lib/SimpleOrm.class.php` (capitolo 2) |
| `MyWrapper` solo per la manutenzione minima del codice vecchio | è debito tecnico; le query grezze sono deprecate | `docs/02-patterns/01-database-rules.md` |
| i valori della richiesta si legano, non si concatenano: `SimpleOrm::sqlBind()`, oppure `GridRequest::bind()` con `compile()` | un valore concatenato entra grezzo nella query | `lib/GridRequest.php` (GOP-416) |
| `SimpleOrm::escapeString()` solo per i nomi che non si possono legare | i nomi di colonna delle griglie non si legano | `FlexigridLayout` |
| il codice comune usa solo colonne canoniche | una commessa esclusa può non avere le altre | scheda 45 |
| `SimpleOrm::insert()` e `update()` scartano i campi che la tabella non ha, e da GOP-700 lo registrano | la pagina dice «salvato» e il dato non c'è | `migrations/README.md` |
| `columnExists` e `tableExists` solo con il marcatore `// TEMP schema-drift GOP-700` | nascondono la deriva e vanno tolte quando le commesse sono conformi | 18 marcatori in 8 file al 25 novembre 2026 |
| in `goplanner.users` non si inserisce mai direttamente | un accesso senza identità è invisibile ai profili | capitolo 11 |
| nessuna scrittura e nessuna modifica di struttura da dev, dagli stack locali o da `goplanner-test-*` | puntano tutti allo stesso cluster di database della produzione | `migrations/README.md` |
| Gea non ha credenziali di database | legge attraverso azioni dedicate, con l'identità dell'utente | capitolo 15 |

L'avviso dello scarto ha questa forma: `SimpleOrm::insert campo scartato (colonna assente) tenant=… tabella=… campo=…`. Si registra una volta per processo per ogni campo, al massimo 50 voci per processo, e mai con i valori, perché possono essere dati personali.

«La provo sul mio stack locale, tanto è locale.» `migrations/README.md` risponde in una riga: «Mai da dev, stack locali o `goplanner-test-*`». Lo stack locale e quello di dev puntano allo stesso cluster di database della produzione. Una migrazione «provata» lì è stata applicata a una commessa vera. Il posto per provarla è il MySQL usa e getta di `make test_migrate`.

> **Per lo staff tecnico:** `scripts/migrate.php` accetta `--tenant`, `--all` e `--apply`; con `--apply` su terminale chiede l'host, senza terminale richiede `--yes`. `make schema_check` confronta in sola lettura ogni commessa con v0 più moduli, oppure con v0 più migrazioni quando `0000_baseline` è registrata. `make schema_expected` rigenera il riferimento dopo ogni modifica a `0000_baseline.sql`. Host e credenziali arrivano solo dall'ambiente, senza valori predefiniti.

Il repository non vede la produzione. Il catalogo delle personalizzazioni (`docs/01-foundations/10-catalogo-personalizzazioni-schema-tenant.md`) prova che una voce è in uso per il codice, non che esista nel database, e non elenca i residui che nessun codice nomina. Lo scarto silenzioso dei campi diventerà un errore sulle tabelle canoniche solo a riallineamento finito, con un ticket successivo: oggi è un avviso. Il controllo di conformità al rilascio e ogni notte è in corso (GOP-699), e il riallineamento delle commesse escluse è ancora da completare (GOP-701). Il master non ha un controllo come `schema_check`. E la sorte di una voce non conforme, un restringimento, un tipo incompatibile, dei duplicati che fermano la migrazione 0018, non la decide chi sviluppa: va nel rapporto, con i suoi numeri.

Ogni relazione tra le tabelle del lavoro ha un custode nel codice e nessuno nel database. Prima di toccare una riga si cerca il percorso che la custodisce e si passa da lì. Prima di toccare lo schema si scrive una migrazione che aggiunge soltanto, la si prova su un database usa e getta, e l'`--apply` lo si lascia allo staff tecnico.

## Fonti

- codice: `migrations/tenant/0000_baseline.sql`, `migrations/tenant/0000_baseline.expected.json`, `migrations/tenant/0008_magazzino_movimenti.sql`, `migrations/tenant/0014_mappatura_colonne.sql`, `migrations/tenant/0020_operatori_indirizzo_partenza.sql`, `migrations/tenant/0026_impostazioni_chiave_troncata_riparata.sql`, `migrations/tenant/0032_magazzino_base.sql`, `migrations/tenant/0034_campi_nuovi.sql`, `migrations/tenant/0042_magazzino_ddt.sql`, `migrations/main/`
- codice: `lib/UtenzaBase.php`, `lib/CaricoBase.php`, `lib/CaricoRigaBase.php`, `lib/InterventoBase.php`, `lib/InterventoEseguitoBase.php`, `lib/Intervento.php`, `lib/FotoBase.php`, `lib/Posizione.php`, `lib/OperatoreLocaleBase.php`, `lib/AvanzamentoCarichi.php`, `lib/json_functions.php`, `lib/JSONController.php`, `lib/ADMINController.php`, `lib/DatiProva.php`
- codice: `lib/AccessoCommessa.php`, `lib/InvitoUtente.php`, `lib/LottoService.php`, `lib/db/2026-09-02-gop227-lotti.sql`, `lib/PosizioneChiusura.php`, `lib/PrecisioneUtenza.php`, `lib/ImpostazioniGenerale.php`
- codice: `lib/FlexifieldsTenant.php`, `lib/FlexigridLayout.php`, `lib/GridRequest.php`, `lib/GrigliaRisposta.php`, `lib/ImportazioneCampoNuovo.php`, `lib/SimpleOrm.class.php`, `lib/MainOrm.php`, `lib/MigrationRunner.php`, `lib/MagazzinoColdSwitch.php`, `tests/FlexigridColonneTenant_Test.php`, `tests/support/SchemaCanonico.php`
- codice: `lib/Operatore.php`, `lib/MobileV3/Device/DeviceStore.php`, `lib/MobileV3/Domain/PosizioniWriter.php`, `lib/MobileV3/Domain/EsitoWriter.php`, `lib/MobileV3/Domain/MagazzinoRuolo.php`, `migrations/main/0001_mobile_v3_dispositivi.sql`, `migrations/main/0019_mobile_v3_dispositivi_permessi.sql`, `json.php`, `json_android.php`, `json_admin.php`, `grid.php`
- docs: `migrations/README.md`, `migrations/main/README.md`, `docs/00-concept-index.md`, `docs/01-foundations/03-database-facts.md`, `docs/01-foundations/07-database-schema.md`, `docs/01-foundations/10-catalogo-personalizzazioni-schema-tenant.md`, `docs/03-cookbooks/20-test-mobile-headless.md`, `docs/03-cookbooks/33-esportare-in-excel-una-griglia.md`
- docs: `docs/02-patterns/01-database-rules.md`, `docs/02-patterns/17-flexigrid-and-campicustom.md`, `docs/02-patterns/21-guard-cancellazione-intervento-eseguito.md`, `docs/02-patterns/24-join-dinamico-griglie-tenant.md`, `docs/02-patterns/32-creazione-utenti-percorsi-e-metodo-canonico.md`, `docs/02-patterns/34-stato-utenza-derivato-ultimo-intervento.md`, `docs/02-patterns/35-lotti-entita-e-etichette-legacy.md`, `docs/02-patterns/45-schema-canonico-tenant.md`, `docs/02-patterns/48-precisione-utenti-geocodifica-anomalie.md`, `docs/02-patterns/51-campo-nuovo-colonna-di-carichi-righe.md`
- Portolano: `gop-138-a0ed4e0fecc52414524e4c9a`, `gop-138-c3358d5be0a32f7d0b371670`, `gop-138-041eb675cbf4ccdde7e5ee5a`
- Jira: GOP-222 — FlexiGrid: persistere lo stato mostra/nascondi colonne
- Jira: GOP-227 — Gestione lotti: un'entità reale al posto delle etichette in config
- Jira: GOP-338 — Migrazioni MySQL automatiche per i database delle commesse e del master
- Jira: GOP-339 — Migrazioni 1/6: esecutore, baseline v0 e schema_check
- Jira: GOP-340 — Migrazioni 2/6: riconciliare master e php8 come prime migrazioni numerate
- Jira: GOP-416 — Sicurezza: ricerca e ordinamento delle griglie Clienti e Interventi
- Jira: GOP-546 — impostazioni.chiave varchar(20) tronca le chiavi della finestra interventi dell'app 3
- Jira: GOP-621 — GOPlanner 3: posizione GPS inviata con l'esito della chiusura
- Jira: GOP-640 — Carichi: elenco con stato su quattro fasi e dettaglio della lista
- Jira: GOP-645 — errori SQL su interventi_eseguiti.esito in Verifica foto, Carichi e MCP
- Jira: GOP-682 — Operatori: indirizzo di partenza con geocodifica
- Jira: GOP-691 — Sicurezza: valori della richiesta nelle query di layout delle griglie
- Jira: GOP-696 — Schema canonico (1): ADR 45, migrazioni e catalogo delle personalizzazioni
- Jira: GOP-697 — Schema canonico (2): generatore di riallineamento per le commesse escluse
- Jira: GOP-698 — Schema canonico (3): database dei test costruito dallo schema canonico
- Jira: GOP-699 — Schema canonico (4): controllo di conformità al rilascio e ogni notte
- Jira: GOP-700 — Schema canonico (5): SimpleOrm registra i campi scartati
- Jira: GOP-701 — Schema canonico (6): riallineamento delle commesse escluse
- Jira: GOP-705 — Strumenti MCP per creare dati di prova
- Jira: GOP-756 — Anomalie di geocodifica: non trovata, fuori comune, approssimata
- Jira: GOP-770 — Importazione: un campo nuovo crea una colonna vera in carichi_righe
