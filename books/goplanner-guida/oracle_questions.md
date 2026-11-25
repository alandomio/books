# Oracle questions

Domande a cui le fonti (codice php8, wiki, docs, Portolano, Jira) non rispondono. Append-only.

## Capitolo 5 — Pianificazione e giri (Researcher, 2026-11-25)

1. **Tendina Lista dopo GOP-442.** Dopo la correzione del 31/10/2026 la copia salvata si rinnova a ogni cancellazione o creazione di interventi. Esiste ancora un caso reale in cui una lista resta assente per un'ora con tutte le condizioni vere? Se no, il capitolo deve togliere la regola «aspetta un'ora» e raccontare la storia del 15/10 come precedente alla correzione.
2. **«Elimina» in Interventi › Mappa** cancella tutti gli interventi senza esito dell'operatore, di qualsiasi giorno e stato, senza conferma e senza la protezione degli appuntamenti del call center (che invece vale per la cancellazione singola). È voluto o è un difetto da segnalare in Jira?
3. **«Pianifica» del Calendario** (`CalendarioController::saveIntervento`) non porta l'utenza ad Assegnato e non verifica che l'operatore sia visibile all'utente. È voluto o è un difetto?
4. **«Calcola distanza»** misura solo fra le prime due utenze selezionate e poi toglie la selezione dalla mappa senza assegnare. È il comportamento atteso?
5. **Tempo sul posto nelle commesse «Mattina e pomeriggio».** Il campo è visibile solo nei lotti a fasce, quindi lì il carico di Giornata/Settimana è sempre «a conteggio». È voluto?
6. **Orario di lavoro per utente.** «Orario inizio» e «Orario fine» sono personali di chi guarda: due utenti vedono percentuali di carico diverse. È voluto?
7. **`interventi.ordine` in produzione.** Ci sono commesse con giri salvati (`ordine > 0`) da flussi legacy? Il codice php8 non lo scrive più dal back office web.
8. **GOP-459, GOP-779, GOP-780** risultano aperti in Jira ma le pagine sono su php8 dal 19/10 e 12/11/2026: sono già in produzione?
9. **Portolano.** Con `user_roles: "goplanner"` le query restituiscono solo due schede non pertinenti. È un problema di indicizzazione o di ruoli? Il Researcher ha usato `goplanner,admin,public`.
10. **Etichetta «Elenco» o «Lista».** `lang_it.php` definisce `List` due volte; a schermo dovrebbe valere «Lista». Da verificare nel browser.
11. **Decisione del 24/11/2026** (Zone per tutte le commesse): quando arriva su php8? Cambierebbe la sezione 4 («solo alcune commesse»).

## Capitolo 1 — Che cos'è GOPlanner (Researcher, 2026-11-25)

1. **Dove sono le liste nel menu.** CONTEXT.md dice «Nel menu è «Lista»», ma nel codice «Lista» è la prima voce dei menu a sinistra (Interventi › Lista = elenco degli interventi; Clienti › Lista = elenco delle utenze) e le liste stanno nella griglia Interventi › Carichi. Quale percorso deve indicare la guida per «vedere le liste»? Va corretto CONTEXT.md?
2. **Stato 7 «inviato».** Nessuna esportazione generica lo imposta su php8 (solo un'importazione di ritorno per alcune commesse e il codice di una commessa). In una commessa tipica, chi o che cosa porta un intervento a «inviato»? GOP-641 (in corso) cambierà questa risposta?
3. **Stato 10 «prenotato».** Da quale azione nasce un intervento prenotato (call center, Centralino, altro)? Il wiki dice che non risulta dal codice letto.
4. **Limite di dimensione della nuova File › Importazione.** Il controllo «max 10MB» è nei moduli di `file.html` (Importazione classica); per la nuova Importazione (caricamento via JS) non è stato trovato un limite esplicito. Esiste un limite, e quale?
5. **Posizione di Gea.** Il codice e CONTEXT.md dicono in basso a sinistra; `annunci-novita-campanella.md:31` dice «in basso a destra». Va corretto l'articolo del wiki?
6. **Portolano.** Anche con le query del capitolo 1 (`user_roles: "goplanner"`, hybrid e non) tornano solo due schede del 25/11/2026: stesso problema della domanda 9 del capitolo 5.
7. **`docs/01-foundations/07-database-schema.md`** riporta valori di `stati` sbagliati («1=Programmato…»). Va aperto un ticket di correzione della documentazione?

## Capitolo 7 — Esportazione e consegna al committente (Researcher, 2026-11-25)

1. **«Filtra per: Validazione» sul modello standard.** Legge `interventi_eseguiti.data_m`, che su php8 scrive solo l'azione admin `dati_originali` di `json_admin.php` (niente Verifica, niente app). In produzione `data_m` è valorizzato? Se è quasi sempre vuoto, l'opzione restituisce 0 righe: va tolta, rinominata o collegata a una vera data di validazione?
2. **«Filtra per» sulle commesse con query propria.** 61 cartelle `custom/` hanno un `getForExport()` proprio e nessuno legge `filtra_per`: la pagina mostra una scelta che non cambia il file. È voluto?
3. **Formato scelto sulla pagina nuova.** Per un modello senza `formato` e senza `model`, `JSONController::export()` chiama `Export::exportData($mappatura)` con un solo argomento e non usa il formato scelto in «Del modello». Esistono modelli così in produzione, e l'esportazione funziona?
4. **Solo interventi Controllati.** 36 cartelle `custom/` esportano solo `stato_id=6`, ma la scheda del modello non lo dice. Si vuole un'indicazione sulla scheda (per esempio «solo verificati»)?
5. **Modelli salvati senza proprietario.** Chiunque possa esportare modifica o elimina il modello salvato di un collega e non c'è storico (`mappature_export` tiene solo l'ultima modifica). È voluto?
6. **Rilancio dei modelli che inviano.** Il modello mail di una commessa (`exportMail`) non filtra gli già inviati: rilanciarlo rimanda tutto. Serve un avviso sulla pagina?
7. **Runbook e cookbook da correggere.** `runbook-export-foto-png.md` e `docs/03-cookbooks/35` chiamano «foto degli avvisi (tipo 99)» le firme PNG; i runbook dicono «codice di 8 cifre» (sono 8 caratteri esadecimali) e citano «Lo ZIP non è stato creato» (il codice scrive «Il file non è stato creato»); `export-dati.md` descrive ancora il comportamento senza registro di prima di GOP-647. Aprire un ticket di correzione?
8. **Scadenza del link.** `esportazioni_link_giorni` attende la scelta del capitano (consigliati 30 giorni). La scelta è stata fatta?

## Capitolo 9 — Il magazzino (Researcher, 2026-11-25)

1. **Migrazione 0032 su `sg_italgas`.** Il flag `features.magazzino` è acceso in `sg_italgas` e `sg_italgas_test` dal 19/10/2026, quindi la pagina nuova vale anche lì. La 0032 è applicata? Se no, gli utenti vedono «Il magazzino base non è ancora attivo su questo cliente…». La guida deve contare `sg_italgas` fra le commesse con il magazzino nuovo?
2. **Pezzi caricati per errore.** Il resoconto dell'importazione dice «Un articolo caricato per errore si corregge con un movimento di magazzino», ma nel back office non esiste un movimento che tolga un pezzo dal centrale (niente scarico né rettifica; l'uscita accetta solo smontati). Quale movimento intende? O va cambiato il testo e la regola è «chiedi allo staff tecnico»?
3. **Codice della scatola (GOP-862 vs GOP-853).** Il 23/11 GOP-862 dice «Deciso di non usare un codice scatola: si cerca per matricola», ma il codice php8 salva e cerca ancora i codici scatola. La colonna Scatola resta? La guida deve presentarla come funzione o come campo che oggi resta vuoto?
4. **Formato del QR della pedana.** Ancora aperto (GOP-862). Quando arriva l'esempio, cambiano `pattern_pedana` e la frase condizionale del capitolo.
5. **Causale dell'affido per gli operatori esterni.** Il default è «Affidamento materiale in conto lavorazione», da confermare (GOP-862).
6. **Etichetta del collegamento operatore–utente.** Il wiki dice «si controlla in Admin › Operatori»: qual è il nome esatto del campo a schermo?

## Capitolo 8 — Gli operatori e l'app GOPlanner 3 (Researcher, 2026-11-25)

1. **Migrazioni del database principale in produzione.** Quali tra 0001–0007, 0011–0013, 0019, 0027, 0029 e 0031 sono applicate in produzione al 25/11/2026? `migrations/main/README.md` registra solo la 0033; i docs dicono ancora «preparate, non applicate» per abbinamento, tracciamento e segnalazioni.
2. **Diffusione di GOPlanner 3.** Quali commesse usano GOPlanner 3 e quali ancora GOPlanner 1.x? La pagina Dispositivi mobili compare a ogni amministratore con il permesso, su qualunque commessa (`OfficeDevices::allowed` non guarda la commessa).
3. **Comandi remoti in produzione.** Su quali commesse di produzione sono attivi i comandi remoti (configurazione del server)?
4. **Invio rifiutato per riassegnazione.** Un esito mandato dopo che l'ufficio ha passato l'intervento a un altro operatore riceve `not_found`, che resta registrato sulla chiave per 30 giorni: lo stesso «Riprova» non passa nemmeno se l'intervento torna all'operatore. L'app crea una chiave nuova in quel caso? È voluto, visto che `envelope.md` promette la rivalutazione «dopo che l'ufficio ha riassegnato»?
5. **Testi dell'app.** I testi a schermo dell'app GOPlanner 3 («Telefono abilitato», «Chiedi un nuovo codice», «Questo telefono non è più abilitato», «Riprova», «Segnala un problema», «Le mie segnalazioni», la schermata di aggiornamento obbligatorio) sono quelli dei docs del contratto? Ogni quanto l'app aggiorna l'elenco interventi da sola?
6. **Download della versione precedente.** Dal 22/11/2026 la pagina di login non mostra più il collegamento all'app 1.x («versione precedente») né l'etichetta «beta». Da dove scaricano oggi l'app gli operatori che usano ancora GOPlanner 1.x?
7. **Posizioni della giornata e consenso.** L'app manda le posizioni della giornata solo dopo un invito accettato (`invita_tracciamento`), oppure anche senza? La tabella degli inviti (0005) risulta non applicata.
8. **Motivo della posizione assente in Verifica.** Il campo «Posizione» della scheda di verifica c'è solo nelle commesse che lo dichiarano nella configurazione (circa dieci). Va esteso a tutte le commesse con GOPlanner 3?
9. **Blocco della chiusura (grill del 25/11/2026).** Quando arriva su php8 il blocco della chiusura con ora del telefono modificata o posizione spenta? Cambierebbe la sezione 3 del capitolo («l'esito parte anche senza posizione, con il motivo»).
10. **Campo `segnalazione` dell'esito (max 25 caratteri).** A che cosa serve? Non è spiegato nei docs ed è diverso dalle segnalazioni «Segnala un problema».

## Capitolo 10 — Gea, l'assistente di GOPlanner (Researcher, 2026-11-25)

1. **Registro delle proposte e storico delle mappature in produzione.** `migrations/main/0010_chatbot_azioni.sql` e `migrations/tenant/0044_mappature_import_storico.sql` sono applicate nei database di produzione? Il pattern 38 dice ancora «non applicata». Senza, le proposte di Gea (affidare, riaffidare, cambiare data, correggere una mappatura) non funzionano.
2. **Memoria delle conversazioni (GOP-811).** Il processo giornaliero `scripts/memoria-conversazioni.mjs indicizza` gira in produzione? Senza, la memoria resta vuota.
3. **Lettura delle foto.** `CHATBOT_FOTO_PAGINA` è acceso in qualche ambiente?
4. **GOP-536 (azioni solo da runbook).** È ancora la direzione voluta? Oggi Gea prepara le proposte anche su richiesta diretta; il cap. 6 lo dice e il codice lo conferma.
5. **Richieste di funzione (GOP-874).** Il codice è sul ramo php8 (25/11/2026) ma il ticket è «Da completare»: è già in produzione?
6. **Posizione di Gea nella wiki e nel pattern 27.** `annunci-novita-campanella.md:31` («in basso a destra») e `docs/02-patterns/27…:88` (pulsante nell'header) vanno corretti? Il codice dice in basso a sinistra, in fondo al menu laterale.
7. **Pattern 39, eventi della pagina (GOP-535).** Il pattern descrive «ultimi 20 eventi, al massimo 10 minuti» come regola, ma il widget su php8 raccoglie solo gli errori JavaScript. Va segnato nel pattern che GOP-535 non è fatto?
8. **Caso del 22/11/2026** («I modelli salvati non sono attivi per questo tenant»): esiste una chiave Jira? Nessun ticket trovato con il testo del messaggio.

## Capitolo 11 — Utenti, ruoli e permessi (Researcher, 2026-11-25)

1. **Pulsante «Accessi» per l'Amministratore cliente.** `pages/utenti.php:56` mostra «Accessi» (e nella scheda «Modifica» e «+ Aggiungi commessa») solo con `users.admin = 1` e `can('profili.assegnare')`, ma ogni percorso di creazione scrive `users.admin = 0`. Un Amministratore cliente creato con l'invito vede questi pulsanti? Va verificato nel browser prima che il capitolo dica agli amministratori di usarli.
2. **«Amministratore commessa» ed Elenco utenti.** `AdminAreaUtenti::puoVedereUtenti()` e l'invito richiedono la chiave legacy `canViewUtenti`, che i profili di piattaforma non contengono. Un Amministratore commessa con il solo profilo vede «Elenco utenti» e può invitare? Se no, è un difetto da segnalare in Jira?
3. **Righe «Da collegare».** Nessuna pagina collega un accesso legacy a una persona, eppure i messaggi dicono «Va prima collegato a una persona» e «Collega l'utente esistente…». Chi lo fa oggi, e come? Va corretto il capitolo 2 («lavoro dell'amministratore»)?
4. **Accensione dei controlli.** `rbac_enforce` è spento per tutte e tre le organizzazioni il 25/11/2026; GOP-666 e GOP-122 sono aperti. C'è una data o una condizione decisa per la prima organizzazione?
5. **Tendina «Operatore» per «Consultazione esterno».** Il codice serve `operatore_select` da `JSONController::operatori_select()`, che non applica OPERATORI = `nessuno`: oggi la tendina mostra gli operatori attivi. È voluto?
6. **Migrazione 0023 (profili generali).** Il pattern 42 la dice «non eseguita». È stata eseguita in produzione?
7. **Stati Jira non allineati.** GOP-290 e GOP-330 risultano «Da completare» ma il codice su php8 li implementa. Vanno chiusi?
8. **Testi in inglese.** «Users of competence», «Remove» (Lotti) e «Invite email sent» (Invita utente) non hanno traduzione in `lang_it.php`. Va aperto un ticket?

## Capitolo 12 — Strumenti di amministrazione e diagnostica (Researcher, 2026-11-25)

1. **Tabelle in produzione.** Le migrazioni del database principale 0025 (Novità), 0027 (ticket) e 0030 (`annunci_letti`) sono applicate in produzione al 25/11/2026? Il README registra una data solo per la 0033; ADR 48 e il changeset di GOP-762 dicono la 0027 «mai applicata», la wiki descrive la sezione Ticket come funzionante. Il capitolo dice «dove la sezione è attiva».
2. **«Il nostro team ne è stato avvisato».** Quali allarmi sorvegliano il registro degli errori del tenant e il battito dello schedulatore del Giro, e chi raggiungono? Nel repository non c'è alcun allarme né filtro di metrica; il gestore non manda email e la chiamata Slack è commentata. Decide come il capitolo spiega la frase della schermata d'errore.
3. **Errori nelle chiamate JSON.** Fuori dal debug, le risposte JSON d'errore portano il testo inglese «Sorry, an error has occured. Please contact your system administrator.» (nessun `friendlyMsg` in italiano). È voluto, o serve un testo italiano con il codice?
4. **Admin › Sistema › «Mappa».** `action=mappa` non ha un ramo in `admin.html` né in `pages/admin.php`: che cosa mostra? È un resto della rimozione della mappa delle antenne?
5. **Voce «Ticket» senza tabelle.** `TicketWeb::disponibile()` guarda solo l'identità personale: la voce compare anche dove la 0027 manca (la pagina dice «I ticket non sono ancora disponibili.»). Va corretta la riga di `sezione-ticket.md` che dice che la voce non compare?
6. **Annuncio letto «per persona».** `annunci_letti` è per riga `users` (`id_user`): chi ha accesso a più commesse vede «Ti presentiamo Gea» una volta per commessa. È voluto, visto che la wiki dice «per persona»?
7. **Runbook e cookbook 36.** Vanno aggiornati per dire che ingresso + esito riguardano solo il canale dell'app GOPlanner 1.x (GOPlanner 3 scrive una riga per richiesta) e che la deduplicazione mancante riguarda solo l'app 1.x (GOPlanner 3 risponde `already_applied`)?
8. **Lettura dei crash dai registri centrali.** `GOPLANNER_CRASH_LOGS_READ` è acceso in produzione? Se è spento, Errori app legge ancora la vecchia tabella `crash_report` e il limite 7 giorni / 500 righe non vale. GOP-849 risulta ancora «Da completare» in Jira.
9. **Costo AI · mese.** Le chiamate AI locali dell'analisi delle foto registrano un costo diverso da zero in `analisi_ai_costi`? Decide se la colonna di Stato commesse comprende l'analisi che il Cruscotto dice «senza costo».
10. **Wiki superate dal codice.** `pagina-admin-manutenzione.md` (tetto 50/500 di Consolida utenze, «costo stimato» per carico, entrambi tolti il 19/11/2026) e `pagina-admin-giro-stato-commesse.md` (registro vuoto «dopo Svuota cache», ma le chiavi del Giro sono protette) vanno corrette?
11. **Tetto di Consolida utenze.** Il tetto di 500 codici è stato tolto nella revisione del 19/11/2026 («drop cap»): oggi qualunque numero va nella query. Va rimesso?
12. **Festivi.** La legenda di Stato commesse dice «festivi esclusi», ma `StatoCommesseSalute::giorniLavorativiDopo()` conta lunedì–venerdì senza calendario dei festivi: dopo un festivo il pallino rosso può arrivare un giorno prima. Si escludono i festivi o si cambia la legenda?
13. **GOP-864.** Risulta «In corso» in Jira, ma la wiki descrive Gea che legge gli errori del backend dal 22/11/2026. È in produzione?

## Capitolo 13 — Architettura di GOPlanner su PHP 8 (Researcher, 2026-11-25)

1. **Validazione del parametro `page` in `index.php`.** Nel codice di `index.php` non è stato trovato un filtro esplicito sul nome della pagina prima di costruire `pages/<page>.php`. C'è un controllo altrove (server web, `.htaccess`, configurazione) che il capitolo può citare come regola? Finché non c'è risposta il capitolo non ne parla.
2. **Script da riga di comando senza controllo nel file.** `cron.php`, `cron_daily.php` e `console.php` non hanno il controllo `PHP_SAPI` che hanno `worker.php`, `worker_job.php` e `scheduler_giro.php`. Come sono esclusi dal web in produzione?
3. **`download.php` e `foto_upload.php`** non includono `config.inc.php`. Sono ancora in uso o raggiungibili in produzione?
4. **Servizi in produzione.** Il worker dedicato a `job_giro` (`queue-giro`) e lo schedulatore (`scheduler-giro`) compaiono solo nel compose dev/api; il `ws-server` nei compose di sviluppo. Quali di questi girano oggi in produzione sulla linea `php8`?
5. **`cron.php` → `cron_worker.php`.** GOP-656 è «In corso» e dice che `cron_worker.php` si ferma su `php8`. Il cron di sistema li lancia ancora in qualche ambiente? (Decide se il capitolo li chiama «fermi» o «storici».)
6. **Versione degli asset (GOP-624).** Il ticket e i commenti dicono «hash del contenuto», l'implementazione usa data di modifica e dimensione. È una scelta voluta (da documentare così) o va allineata?
7. **Costo di un processo per lavoro (GOP-687).** Esiste una misura di tempo o memoria per l'avvio del processo figlio? Jira non la riporta.
8. **Admin › «Giro» senza worker di `job_giro`.** Che cosa mostra la pagina quando lo schedulatore accoda ma nessun worker esegue?

## Capitolo 14 — Il modello dei dati (Researcher, 2026-11-25)

1. **Tabella `users` della commessa.** v0 la contiene (5 colonne) e due azioni vecchie di `json.php` (`put_cantiere`, `put_operatore`) la leggono con `operatori.id_user`, mentre il codice nuovo (`MagazzinoRuolo`) legge lo stesso `operatori.id_user` contro `goplanner.users`. In produzione la tabella della commessa ha righe? A quale tabella punta oggi `operatori.id_user`?
2. **`operatori_db` nel database principale.** Compare solo nei dump vecchi; nessun lettore trovato su php8. Esiste ancora in produzione, e a che cosa serve?
3. **Engine di `users` e `operatori` nel master.** I commenti del codice dicono «può essere MyISAM» e il dump docker del 2022 li ha MyISAM. Qual è l'engine reale oggi in produzione?
4. **Scrittori di `utenti.stato_id`.** Il pattern 34 dice che `updateStatoUtenza()` è l'unico punto che lo scrive, ma il codice ne ha almeno dieci altri (importazione, auto-assegnazione, vecchi endpoint dell'app). Va corretto il pattern 34?
5. **`interventi.lat`/`lng` con GOPlanner 3.** Il percorso dell'app 1.x copia la posizione di chiusura anche su `interventi`; il percorso di GOPlanner 3 lo fa? Se no, un report che legge `interventi.lat` vede solo le chiusure 1.x.
6. **`foto.operatore`** è `varchar(15)` (non un `operatori.id`): che cosa scrivono i percorsi attuali in quella colonna?
7. **Documenti dello schema.** `docs/00-concept-index.md` (tre query d'esempio con colonne inesistenti in v0) e `docs/01-foundations/07-database-schema.md` (MyISAM, `utenze` come tabella principale, tipi superati) vanno riscritti da v0? Sono i primi file che un agente legge.
8. **Capitolo 6.** Dice «le tabelle sono MyISAM, senza chiavi esterne»: per le commesse conformi a v0 le tabelle sono InnoDB (senza chiavi esterne sulle tabelle del lavoro). Va corretto il capitolo 6?
