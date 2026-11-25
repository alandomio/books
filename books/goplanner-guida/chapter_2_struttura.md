# Capitolo 2 — Struttura (Architect)

**Titolo finale:** `# 2. Commesse e tenant`
**Parte:** I — Il dominio
**Audience del capitolo:** ALL (sezioni con tag più fini: [TUTTI], [STAFF], [DEV])
**Domanda centrale (PRD § 4):** che cosa significa che ogni commessa ha i suoi dati e le sue regole: un database per commessa, il DB master, la cartella `custom/{tenant}`, la priorità degli override, come nasce una commessa nuova.
**Nemico locale:** «in GOPlanner funziona così» detto senza dire *in quale commessa*. Il passaparola tratta GOPlanner come un prodotto unico; il capitolo mostra che ogni comportamento visibile ha due origini possibili (il codice comune o la commessa) e insegna a distinguerle.

**Continuità.** `chapter_index.md` e `NARRATIVE_GLOSSARY.md` non esistono ancora (capitoli in parallelo): nessuna affermazione da verificare contro capitoli già approvati. Il capitolo 1 definisce il glossario di base (utente, operatore, committente, commessa, utenza, lista, pratica, intervento, esito, stato): qui non si ridefinisce, si usa. Le parole sono quelle di `/home/alan/firstmate/projects/GOPlanner/CONTEXT.md`.

**Regola della parola «tenant» (vincolante per Writer ed Editor).** «Tenant» è una parola *da evitare* del glossario (voce Commessa) ed è vietata nel testo per l'ufficio (STYLE_BIBLE § Banned patterns 12), ma è nel titolo fissato dal PRD. Soluzione:
1. Il paragrafo «*In questo capitolo*» o la prima sezione dice una volta sola la corrispondenza: «la commessa, che nel codice si chiama tenant».
2. Nelle sezioni [TUTTI] la parola compare solo dentro `codice` (`custom/{tenant}`, `GOPlanner::$account`) o come etichetta esatta dell'interfaccia.
3. Nelle sezioni [STAFF] e [DEV] si può scrivere «tenant» solo quando si nomina il codice (la cartella, la variabile, il ticket che lo usa); altrimenti «commessa».
4. Stesso trattamento per «cliente»: è il nome della tabella `clienti` e del filtro «Cliente» di Admin, mai un sinonimo di committente o di commessa nella prosa. E per «database»: si usa per il database vero, mai come sinonimo di commessa.

---

## NUFs (Goal Scoring)

Dieci NUF, uno per punto: l'Editor assegna +1 per ciascuno pienamente soddisfatto dal capitolo. Soglia 8,5/10 → servono almeno 9 NUF pieni.

### utility(reader)
1. **utility(reader):** Reader can say, for any thing seen on screen (una voce di menu, una colonna della griglia, un campo personalizzato nell'app, un tipo di foto), whether it is common to all commesse or belongs to the commessa aperta, and in which file of `custom/{tenant}` it is defined → score += 1
2. **utility(reader):** Reader (ufficio) can switch commessa with «Cambia commessa» / «Cerca commessa...», and can explain to a collega why the same search gives different results on two commesse (dati in database separati; poi lotti, con rimando al capitolo 11) → score += 1
3. **utility(reader):** Reader (staff tecnico / sviluppatore) can trace where a behaviour comes from by following the override order in at most four numbered steps: configurazione globale → `custom/{tipo}/config.inc.php` → `custom/{db}/config.inc.php`; classe in `custom/{db}/php/` → `lib/` → score += 1
4. **utility(reader):** Reader (staff tecnico) can list in order the steps that create a new commessa, including the two most often forgotten: `$custom['tipo_intervento']` obbligatorio e `mappaturaInput` prima della prima sincronizzazione di un operatore → score += 1

### utility(emotional)
5. **utility(emotional):** Reader (ufficio) feels sure about what they can check alone (quale commessa è aperta, che cosa la commessa ha configurato, anche chiedendolo a Gea) and knows exactly where to stop: ogni modifica a `custom/`, una commessa nuova, una differenza di struttura del database → staff tecnico → score += 1
6. **utility(emotional):** Reader (sviluppatore) feels the safety of one habit: «prima di correggere in `lib/`, guardo se la commessa sovrascrive la classe», and trusts that a fix will reach every commessa or knows which ones it will not reach → score += 1

### utility(factual)
7. **utility(factual):** I due livelli di database nominati con i nomi fisici esatti: DB master `goplanner` (tabelle `clienti`, `users`, più quelle d'identità) e DB della commessa `goplanner_{clienti.db}` (`utenti`, `carichi`, `carichi_righe`, `interventi`, `interventi_eseguiti`, `foto`, `impostazioni`), con la regola d'accesso `MainOrm` / `SimpleOrm` — cited with source (`docs/01-foundations/03-database-facts.md` + codice) → score += 1
8. **utility(factual):** L'ordine reale di caricamento verificato nel codice di `php8`: `config.inc.php` (include di `custom/{dbtype}` e poi `custom/{db}`), `lib/GOPlanner.php` (stesso ordine per job e worker), `lib/ClassiCustom.php::carica()` (cartella della commessa, poi `lib/class<Nome>.php`, `lib/<Nome>.php`, `lib/jobs/<Nome>.php`) — cited with file and ticket (GOP-687) → score += 1
9. **utility(factual):** I campi della riga di `goplanner.clienti` che definiscono una commessa (`db`, `nome`, `apikey`, `tipo`, `attivo`) e il loro significato, **senza alcun valore reale**; la corrispondenza `clienti.tipo` = cartella base in `custom/` = `dbtype` in sessione — cited with source → score += 1
10. **utility(factual):** Almeno un caso reale breve (problema → causa → rimedio) legato alla struttura per commessa, con chiave Jira o documento e data, senza nomi di committenti: per esempio la ricerca per PDR che filtrava sulla colonna sbagliata in 44 commesse (luglio 2026), o le colonne create da `mappaturaInput` (GOP-418, 12 colonne, 9 ottobre 2026) → score += 1

---

## BEAT LIST

Sei sezioni (`##` nel capitolo finale). Totale sezioni ≈ 5.100-5.500 parole, più «In questo capitolo» e «Fonti». Ogni sezione: rigo in corsivo con il pubblico, almeno un dettaglio esatto, almeno un paragrafo **Limite**, al massimo 5 paragrafi di prosa senza un elemento di orientamento.

### Beat 1 — `## Una commessa, i suoi dati e le sue regole`
- **Domanda centrale:** che cosa cambia, per chi lavora in ufficio, il fatto che ogni commessa abbia i suoi dati e le sue regole?
- **Tag:** [TUTTI]
- **Parole:** 800-950
- **Piano dei paragrafi:**
  - *Aggancio:* un caso con dati inventati e dichiarati come tali: due colleghi cercano la stessa utenza (codice di esempio) e uno la trova, l'altro no. La causa non è un errore: hanno aperta una commessa diversa.
  - *Spiegazione:* la definizione di commessa dal glossario (il lavoro svolto per un committente, con i suoi dati e le sue regole); la corrispondenza con la parola del codice detta una volta; un utente lavora dentro **una** commessa alla volta.
  - *Procedura:* passare da una commessa all'altra con il selettore delle commesse (etichette esatte: «Cambia commessa», «Cerca commessa...», «Nessuna commessa trovata»), passi numerati. La commessa nuova compare nel selettore «al prossimo accesso» (stringa di `lib/dict/lang_it.php`).
  - *Dimostrazione:* tabella «Uguale in tutte le commesse / Può cambiare da commessa a commessa». Uguale: il ciclo (importazione → pianificazione → app → esito → verifica → esportazione), le parole del glossario, i menu principali. Può cambiare: voci di menu (`$custom['menu']`), campi personalizzati dell'app, colonne delle griglie, mappature di importazione ed esportazione, tipi di foto, tipi di intervento.
  - *Limite:* i dati di una commessa non compaiono in un'altra; Gea descrive solo la configurazione della commessa aperta (`wiki/assistenza-clienti/configurazione-tenant.md`, sezione «Limiti della risposta»). La stessa persona può avere accesso a più commesse, ma i permessi e i lotti sono un altro tema: una frase e il rimando al capitolo 11.
  - *Contro-obiezione 1:* «Ma il collega vede l'utenza e io no, nella stessa commessa?» → allora la causa non è la commessa: lotti di competenza (utenti senza lotti vedono tutti i lotti della commessa) → rimando ai capitoli 3 e 11.
  - *Sintesi:* la prima domanda davanti a un comportamento strano è «in quale commessa?».
- **Fatti che il Researcher deve trovare:**
  - etichette esatte del selettore e dove compare nell'interfaccia (`lib/dict/lang_it.php` righe ~1965-1975; template dell'intestazione `Smarty_templates/it/_header.html`; `index.php` ~righe 180-210, dove si costruisce l'elenco delle commesse visibili);
  - che cosa succede se il cambio è rifiutato (motivi in `lib/SessioneTenant.php`: commessa inesistente, disattivata, non autorizzata, profilo mancante, cookie non valido) — solo il comportamento visibile, non i dettagli di sicurezza;
  - elenco verificato delle cose configurabili per commessa (`docs/01-foundations/04-configuration-priority.md`, `docs/03-cookbooks/12-tenant-bootstrap-modulo.md`);
  - frase esatta sulla visibilità dei lotti («Gli utenti senza lotti assegnati vedono tutti i lotti della commessa», `lib/dict/lang_it.php`).

### Beat 2 — `## Dove stanno i dati: il DB master e un database per commessa`
- **Domanda centrale:** dove vivono le persone, dove vive il lavoro, e perché questa separazione spiega comportamenti che l'ufficio vede ogni giorno?
- **Tag:** [TUTTI] (con riquadro «Per gli sviluppatori»)
- **Parole:** 850-1.000
- **Piano dei paragrafi:**
  - *Aggancio:* perché un accesso solo può aprire più commesse, mentre un'utenza non passa mai da una commessa all'altra.
  - *Spiegazione:* due livelli. Il DB master `goplanner`: anagrafica delle commesse (`clienti`), accessi delle persone (`users` e, sopra, l'identità con `identita_users`), log centrale degli errori, anagrafica dei lotti. Il database della commessa `goplanner_{clienti.db}`: utenze, liste, pratiche, interventi, esecuzioni, foto, impostazioni.
  - *Dimostrazione:* tabella «Che cosa / Dove sta / Tabella» (6-8 righe, solo tabelle verificate).
  - *Riquadro* `> **Attenzione:**` sulla trappola dei nomi: nel database della commessa la tabella `utenti` contiene le **utenze** (menu «Clienti»), mentre gli **utenti** del gestionale stanno in `goplanner.users`. Un lettore dell'ufficio può saltare i nomi delle tabelle; la regola resta.
  - *Riquadro* `> **Per gli sviluppatori:**` `MainOrm` per il DB master, `SimpleOrm` per il database della commessa; il nome del database si ricava da `clienti.db`; `GOPlanner::$account` dice la commessa corrente. Rimando al capitolo 14 per il modello dei dati.
  - *Spiegazione (perché):* la ragione documentata della scelta di non fondere gli accessi delle persone: `operatori.id_user` sta dentro ogni database di commessa (`docs/02-patterns/25-identita-centralizzata-e-rbac.md`). Solo ragioni presenti nelle fonti; nessuna giustificazione inventata del modello «un database per commessa».
  - *Limite:* i database delle commesse non hanno sempre avuto la stessa struttura; oggi esiste uno schema canonico (GOP-696) con i suoi numeri datati (rapporto del 5 novembre 2026). Una frase sul rimedio (migrazioni che solo aggiungono, `make schema_check`), rimando ai capitoli 14 e 16. Per l'ufficio: nessuna azione, solo il sintomo da riconoscere (vedi Beat 6).
  - *Contro-obiezione 2:* «Lavoro per due committenti: mi servono due accessi?» → no, se l'accesso è collegato a un'identità: le commesse compaiono nel selettore; i login più vecchi «Senza identità» restano legati a una commessa (`wiki/assistenza-clienti/pagina-utenti-elenco.md`). Rimando al capitolo 11.
  - *Sintesi:* la persona sta nel master, il lavoro sta nella commessa.
- **Fatti che il Researcher deve trovare:**
  - elenco verificato delle tabelle del master oggi (`clienti`, `users`, `error_log`, `lotti`, `identita`, `identita_users`, tabelle dei ruoli): confermare nel codice (`lib/MainOrm*.php`, classi che estendono `MainOrm`: `git grep -n "extends MainOrm"`) e in `docs/02-patterns/25-identita-centralizzata-e-rbac.md`;
  - nome fisico del database della commessa e regola `goplanner_{clienti.db}` (`docs/01-foundations/03-database-facts.md`; `config.inc.php` riga ~425-441; `lib/GOPlanner.php`);
  - `clienti.codice_org` e le organizzazioni (es. prefissi `sg`, `easy`, `ener`): solo per una frase con rimando al capitolo 11, se verificato;
  - numeri dello schema canonico con data e fonte (`docs/02-patterns/45-schema-canonico-tenant.md`: 67 database attivi, 26 registrati a v0, 40 esclusi, 1 saltato al 5 novembre 2026); il documento dice che sono «citati, non verificati qui» per la produzione: riportarlo.

### Beat 3 — `## La cartella della commessa: custom/{tenant}`
- **Domanda centrale:** che cosa c'è nella cartella di una commessa, e quale file governa ciò che l'ufficio vede?
- **Tag:** [STAFF] (rigo iniziale: «*Per lo staff tecnico; chi lavora in ufficio può leggere solo la tabella.*»)
- **Parole:** 850-1.000
- **Piano dei paragrafi:**
  - *Aggancio:* la regola delle fonti del PRD: le personalizzazioni di ogni commessa sono documentate nel `README.md` della sua cartella, non in questa guida. Qui si spiega la **forma** della cartella, non il contenuto di una commessa.
  - *Dimostrazione:* tabella «File / Che cosa governa / Che cosa vede l'ufficio»: `config.inc.php` (menu, tipi di intervento, tipi di foto, opzioni come i giorni futuri inviati all'app), `php/Intervento.php` (`getCampiCustom()` → campi personalizzati nell'app; `getCampiExtra()` → dati in sola lettura), `php/mappature.php` (mappature di importazione ed esportazione, rimando ai capitoli 4 e 7), `php/flexifields.php` (colonne, campi di ricerca e pulsanti delle griglie), `php/Utenza.php`, `php/PDF.php`, `js/custom.js` (scheda di verifica nel back office), `templates/`, `README.md`, `DUBBI.md`, `moduli.json`, `tests/`.
  - *Spiegazione:* la cartella base del **tipo** (`custom/default`, `custom/abc`, …) e la cartella della commessa: due livelli di configurazione, il primo condiviso tra commesse dello stesso tipo.
  - *Dimostrazione (caso reale):* la ricerca per PDR che non trovava mai nulla: in `flexifields.php` una voce di ricerca con etichetta «PDR» puntava per copia-incolla alla colonna `codice`; nessun errore, nessun crash, solo zero risultati; trovato in 44 commesse a luglio 2026. Problema → causa → rimedio (controllo di ogni `searchitems`). Nessun nome di commessa.
  - *Limite:* non tutto ciò che differisce tra commesse sta in `custom/`: alcune scelte le fa il codice comune sopra la configurazione della commessa (vedi Beat 4, eccezioni in `index.php`); e le colonne di importazione stanno nel database, non nella cartella.
  - *Sintesi:* chi vuole sapere perché una commessa si comporta così apre prima il suo `README.md`, poi il `config.inc.php`.
- **Fatti che il Researcher deve trovare:**
  - struttura reale di alcune cartelle (`ls custom/<tenant>` su 3-4 commesse diverse; `custom/default`, `custom/abc`) e quali file sono presenti in quasi tutte;
  - numero di cartelle di commessa con data (`ls custom` ha 75 voci al 25 novembre 2026, ma contiene anche voci che non sono commesse: `db.sql`, `graphify-out`, `default`, `abc`, `test`, `cc_test`…): o un conteggio pulito con metodo dichiarato, o nessun numero; `README.md` presenti: 63;
  - chiavi di `config.inc.php` della commessa più comuni (`$custom['menu']`, `$custom['tipo_intervento']`, `$custom['mappature']`, tipi di foto, `$conf['vedi_interventi_futuri']`, `$custom['chatbot_enabled']`): `git grep -h -o "\$custom\['[a-z_]*'\]" custom/*/config.inc.php | sort | uniq -c | sort -rn | head -30`;
  - il caso PDR: fonte in `.claude/skills/create-new-tenant/SKILL.md` passo 7bis (luglio 2026, 44 commesse coinvolte); cercare il ticket Jira collegato (JQL sotto) e una seconda fonte;
  - `moduli.json` e i moduli condivisi (`migrations/tenant/modules/`): una frase.

### Beat 4 — `## Chi vince: l'ordine degli override`
- **Domanda centrale:** quando lo stesso comportamento è definito nel codice comune e nella commessa, quale versione usa GOPlanner, e dove la regola ha eccezioni?
- **Tag:** [DEV] (rigo iniziale: «*Per lo staff tecnico e gli sviluppatori.*»)
- **Parole:** 950-1.150
- **Piano dei paragrafi:**
  - *Aggancio:* il ticket «corretto» che per una commessa non cambia nulla.
  - *Spiegazione — configurazione:* ordine di inclusione verificato nel codice: `config.inc.php` globale, poi `custom/{dbtype}/config.inc.php`, poi `custom/{db}/config.inc.php`; l'ultimo che scrive una chiave vince. Esempio reale: `$custom['chatbot_enabled'] = true` impostato prima degli include (GOP-143), quindi Gea è accesa per default e una commessa la può spegnere nel proprio file.
  - *Spiegazione — classi:* `ClassiCustom::carica()` (registrata come `goplannerAutoload`): prima `custom/{commessa}/php/<Classe>.php`, poi `lib/class<Classe>.php`, `lib/<Classe>.php`, `lib/jobs/<Classe>.php`. Forma reale dell'estensione: `class Intervento extends InterventoBase` (58 cartelle) o `extends InterventoGM` (3), non l'esempio del documento di pattern.
  - *Spiegazione — viste e script:* template Smarty (`custom/{commessa}/templates/` prima di `Smarty_templates/`), `custom.js` della commessa in sessione (`{{custom_js}}`, GOP-624).
  - *Procedura:* «Da dove viene questo comportamento?» in 4 passi numerati: (1) leggere `clienti.db` e `clienti.tipo` della commessa; (2) cercare la classe in `custom/{db}/php/`; (3) cercare la chiave in `custom/{db}/config.inc.php` e poi in `custom/{tipo}/config.inc.php`; (4) solo se assenti, il comportamento è quello di `lib/`.
  - *Limite / eccezioni:* il codice comune a volte decide sopra la commessa: la voce Magazzino compare se il magazzino v3 è acceso anche se `custom/<tipo>` la spegne (GOP-767); il Magazziniere vede solo il Magazzino qualunque cosa dica il menu (GOP-855). Verificare in `index.php`.
  - *Riquadro* `> **Attenzione:**` due modi in cui un override rompe: (a) una classe della commessa che non implementa un metodo astratto del genitore o, in PHP 8, ridichiara un metodo con firma incompatibile → errore fatale al caricamento, pagina vuota; (b) un processo che esegue lavori di più commesse userebbe la classe della prima (PHP non scarica una classe): il worker usa un processo figlio per job e `ClassiCustom::verifica()` fa fallire il job con un errore esplicito invece di usare la classe sbagliata (GOP-687).
  - *Contro-obiezione 3:* «Ho corretto il bug in `lib/` e per una commessa non cambia niente» → la commessa sovrascrive la classe o il metodo: la correzione va portata anche nell'override, o l'override va ridotto.
  - *Sintesi:* la regola in una riga: commessa > tipo > comune, per la configurazione; commessa > comune, per le classi.
- **Fatti che il Researcher deve trovare:** vedi la sezione [CONFLICT] attesa nel Researcher Brief; in particolare righe esatte di `config.inc.php` (~436-441), `lib/GOPlanner.php` (~136-160), `lib/ClassiCustom.php` (righe 32-54 e `verifica()`), `smarty.inc.php` (`{{custom_js}}`), `index.php` (~115 e ~145), `lib/Queue.php` (`process()`), `git grep -c "^class Intervento extends" custom/*/php/Intervento.php`.

### Beat 5 — `## Come nasce una commessa nuova`
- **Domanda centrale:** quali passi, in quale ordine e con quali controlli, portano da un committente nuovo a una commessa in cui gli operatori possono sincronizzare?
- **Tag:** [STAFF] (con sottosezione `### Che cosa prepara l'ufficio` [UFFICIO])
- **Parole:** 1.000-1.200
- **Piano dei paragrafi:**
  - *Aggancio:* una commessa nasce quasi sempre come copia di un'altra; questo è il motivo sia della rapidità sia degli errori ereditati.
  - *Sottosezione [UFFICIO] `### Che cosa prepara l'ufficio`:* le tre domande al committente che cambiano la configurazione (formato del file di ritorno con un esempio; record cessati da escludere o no; foto obbligatorie e in quale momento) e ciò che **non** serve chiedere (numero e nomi degli operatori, periodo di lavoro). L'ufficio non crea la commessa: la chiede allo staff tecnico.
  - *Procedura (staff tecnico), passi numerati, una azione per passo:* (1) compilare il modulo di avvio `docs/03-cookbooks/12-tenant-bootstrap-modulo.md`; (2) clonare il database di una commessa simile con `db_clone.sh` (la parola d'ordine del database viene dal gestore dei segreti, mai scritta); (3) registrare la commessa in `goplanner.clienti`; (4) copiare la cartella `custom/` della stessa commessa sorgente; (5) rivedere e pulire i file copiati; (6) configurare `config.inc.php` con `$custom['tipo_intervento']` obbligatorio; (7) allineare `mappature.php` e `flexifields.php`, controllando ogni voce di ricerca; (8) campi personalizzati e `custom.js`; (9) cartella delle foto sul file system condiviso (descritta senza percorsi interni); (10) primo amministratore; (11) dopo il rilascio, `mappaturaInput` prima che un operatore sincronizzi; (12) centro della mappa.
  - *Dimostrazione:* il perché di due passi: senza `$custom['tipo_intervento']` gli interventi restano con tipo `NULL` e i filtri statici dell'esportazione si rompono; senza `mappaturaInput` la sincronizzazione dell'app può fallire con «Unknown column» e l'importazione può perdere valori senza avvisare (GOP-418: 12 colonne create, seconda chiamata vuota, 9 ottobre 2026).
  - *Limite:* il clone porta con sé **tutti i dati** del database sorgente e tutte le sue personalizzazioni: la scelta della sorgente e la pulizia sono parte della procedura, non un dettaglio. `json_admin.php` (dove sta `mappaturaInput`) è solo per lo staff GOPlanner: un amministratore della commessa riceve 403.
  - *Riquadro* `> **Quando chiedere allo staff tecnico:**` tutto il Beat 5 tranne la sottosezione dell'ufficio.
  - *Sintesi:* una commessa nuova è pronta quando un operatore può sincronizzare senza errori, non quando compare nel selettore.
- **Fatti che il Researcher deve trovare:**
  - ordine e contenuto dei passi in `docs/03-cookbooks/01-add-new-client.md`, `docs/03-cookbooks/12-tenant-bootstrap-modulo.md`, `.claude/skills/create-new-tenant/SKILL.md`; differenze tra le tre fonti;
  - il metodo attuale per creare il primo amministratore: il cookbook mostra un `INSERT` diretto in `goplanner.users`, mentre `wiki/identita-rbac/creazione-utenti.md` e `docs/02-patterns/32-creazione-utenti-percorsi-e-metodo-canonico.md` indicano `InvitoUtente::crea()` come percorso canonico → [CONFLICT]; il codice decide;
  - la modalità «Tenant da template minimale» del modulo di avvio: esiste uno strumento reale o è solo un'opzione del modulo? E il ruolo di `migrations/tenant/0000_baseline.sql` / `scripts/migrate.php` per una commessa nuova;
  - `mappaturaInput`: `ADMINController::mappaturaInput()` in `lib/ADMINController.php`, `CaricoRigaBase::sqlCampiMappatura()` in `lib/CaricoRigaBase.php`; tipi delle colonne create (`varchar(50)`, `varchar(500)` per i campi `array`); GOP-418;
  - centro della mappa: `scripts/update_centromappa.php`, chiave `centromappa` in `impostazioni`, sintomo senza (avviso al primo accesso alla mappa);
  - filtro di sicurezza: **nessun** valore di `apikey`, nessuna parola d'ordine, nessun percorso di mount, nessun host (il cookbook cita un ambiente di sviluppo per nome: non riportarlo).

### Beat 6 — `## Quando una commessa si comporta diversamente`
- **Domanda centrale:** davanti a un comportamento che vale in una commessa e non in un'altra, come si riconosce la causa e chi deve intervenire?
- **Tag:** [TUTTI]
- **Parole:** 750-900
- **Piano dei paragrafi:**
  - *Aggancio:* la sezione «cosa fare quando non torna» del capitolo: raccoglie i sintomi dei Beat 1-5 in un solo posto consultabile.
  - *Dimostrazione:* tabella «Sintomo / Causa probabile / Dove si guarda / Chi interviene» con 6-7 righe, per esempio: voce di menu presente in una commessa e assente in un'altra (`$custom['menu']` o permesso del profilo → capitolo 11); campo assente nell'app (`getCampiCustom()` della commessa); ricerca che dà sempre zero risultati (voce di ricerca su colonna sbagliata); app che non sincronizza con «Unknown column» (colonne di importazione mancanti → `mappaturaInput`); utenza visibile a un collega e non a te (commessa diversa, poi lotti); Gea risponde in modo diverso nelle due commesse (descrive solo la commessa aperta); funzione che manca in una commessa per una differenza di struttura del database (schema canonico, `make schema_check`).
  - *Procedura (ufficio):* 3-4 passi prima di aprire un ticket: controllare la commessa aperta nel selettore; chiedere a Gea la configurazione della commessa (campi personalizzati, colonne, mappature); ripetere su un'altra commessa se se ne ha l'accesso; aprire il ticket indicando la commessa (rimando al capitolo 10 per il ticket da Gea).
  - *Riquadro* `> **Per lo staff tecnico:**` gli strumenti che l'ufficio non vede: pagina Admin › Stato commesse (solo super-admin), `make schema_check`, `scripts/migrate.php` (anteprima per default, `--apply` per applicare). Rimando al capitolo 12.
  - *Limite:* la tabella copre le differenze dovute alla commessa; i problemi di permessi si diagnosticano nel capitolo 12, quelli di importazione nel capitolo 4.
  - *Sintesi / chiusura del capitolo:* la regola operativa in tre domande (quale commessa è aperta; che cosa dice la sua cartella; che cosa resta del codice comune). Nessun annuncio del capitolo 3, nessuna eco del capitolo 1.
- **Fatti che il Researcher deve trovare:**
  - che cosa Gea sa dire della configurazione della commessa (`wiki/assistenza-clienti/configurazione-tenant.md`; strumenti del chatbot in `docs/02-patterns/37-chatbot-registro-strumenti-utente.md`);
  - pagina Stato commesse: chi la vede e che cosa mostra (`wiki/assistenza-clienti/pagina-admin-giro-stato-commesse.md`, `lib/StatoCommessePagina.php`, GOP-836/GOP-838);
  - `make schema_check` e `scripts/migrate.php`: comportamento per default e opzioni (`migrations/README.md`, `Makefile`);
  - il messaggio esatto «Unknown column» e dove compare (GOP-418, `lib/CaricoRigaBase.php`, log del canale mobile se documentato).

---

## REVIEWER READINESS NOTES

### Tension points (dove il capitolo deve creare una posta reale)
1. **La correzione che non arriva a tutti (Beat 4).** L'override è la ragione per cui GOPlanner regge decine di commesse diverse e insieme la ragione per cui una correzione in `lib/` può non arrivare a una commessa che sovrascrive la classe. La posta: un ticket chiuso come risolto che per una commessa resta aperto. Il testo deve mostrare la catena, non dichiararla.
2. **Il clone che porta con sé gli errori (Beat 3 e 5).** Creare una commessa copiando un'altra è rapido e porta con sé dati e personalizzazioni della sorgente. Il caso PDR (44 commesse, nessun errore visibile, solo zero risultati) è la prova che un errore copiato non fa rumore. La posta: una ricerca che «funziona» e non trova mai nulla.
3. **Le colonne che mancano (Beat 5 e 6).** Una mappatura che chiede colonne non ancora create porta a una sincronizzazione che fallisce o a valori persi senza avviso. La posta: il primo giorno di lavoro degli operatori.

### Catene da rendere esplicite (causa → conseguenza → azione del lettore)
- Ogni commessa ha il suo database → i dati di una commessa non compaiono in un'altra → ricerche e risposte di Gea valgono solo per la commessa aperta → **prima di dire «manca», controllare il selettore delle commesse.**
- La persona sta nel DB master, il lavoro nel database della commessa → un accesso collegato a un'identità apre più commesse → **le commesse disponibili si vedono in «Cambia commessa»; i permessi sono per commessa (capitolo 11).**
- Un file in `custom/{db}` vince su `lib/` → una correzione in `lib/` non raggiunge chi sovrascrive → **prima di chiudere un ticket, cercare l'override nella commessa coinvolta.**
- Configurazione: globale → tipo → commessa, l'ultima che scrive vince → una commessa può spegnere ciò che è acceso per default (Gea) → **per capire un comportamento, leggere i tre file in quell'ordine.**
- Mappatura con campi nuovi → colonne assenti in `carichi_righe` → «Unknown column» in sincronizzazione o valori persi → **`mappaturaInput` dopo il rilascio e prima della prima sincronizzazione.**
- Clone della cartella → voci di ricerca copiate → filtro sulla colonna sbagliata senza errore → **controllare ogni voce di ricerca della commessa nuova.**

### Guardie di proporzionalità (ogni rischio con il suo contesto)
- **Override che rompe una pagina:** dire anche il contenimento: la regola dei metodi astratti è documentata (`docs/02-patterns/02-customization-pattern.md`); `ClassiCustom::analizza()` legge il sorgente come testo proprio per non far cadere la pagina; il problema riguarda chi scrive codice, non l'ufficio.
- **Commesse mescolate in un processo:** dire che è un caso evitato a monte (un processo figlio per job) e che la guardia lo trasforma in un errore esplicito; non presentarlo come un rischio quotidiano.
- **Struttura dei database non uniforme (40 esclusi al 5 novembre 2026):** dire che lo schema canonico esiste, che le migrazioni solo aggiungono e non tolgono, che c'è un controllo (`make schema_check`); i numeri sono datati e il documento li dichiara non verificati sulla produzione. Non dire né suggerire perdita di dati in generale.
- **Clone con tutti i dati della sorgente:** dire che la procedura prevede la scelta di una sorgente pulita e la revisione dei file; non suggerire che dati di un committente siano finiti in un altro se le fonti non lo dicono.
- **Caso PDR (44 commesse):** dire che è stato trovato e corretto e che il passo di controllo è ora nella procedura; era un difetto di ricerca, non di dati.
- **Eccezioni alla priorità (GOP-767, GOP-855):** presentarle come scelte volute del codice comune, non come difetti.

### Contro-obiezioni previste (almeno due nel testo finale)
- Beat 1: «Il collega vede l'utenza e io no, nella stessa commessa?»
- Beat 2: «Lavoro per due committenti: mi servono due accessi?»
- Beat 4: «Ho corretto in `lib/` e per una commessa non cambia niente.»

### Confini (Scope rule)
- Tabelle e relazioni nel dettaglio → capitolo 14 (qui solo i due livelli e una tabella «dove sta»).
- Mappature come configurazione → capitoli 4 e 7; `mappature.php` come codice → capitolo 13. Qui solo «quale file governa che cosa».
- Identità, profili, inviti, lotti di competenza → capitolo 11. Qui una frase e il rimando.
- Pagine Admin e diagnostica → capitolo 12. Qui solo Stato commesse nominata nel riquadro staff.
- Migrazioni, rilasci, changelog per commessa (`changeset/`, `docs/02-patterns/46-changeset-changelog-per-tenant.md`) → capitolo 16.
- Gea come strumento → capitolo 10.

---

## RESEARCHER BRIEF

**Niente web** (INSTRUCTION.md § Researcher, SOURCE OVERRIDE). La sezione «web search terms» del modello generico è sostituita da: codice, wiki e docs, Portolano, Jira. Repository in sola lettura: solo Read/Grep/Glob e `git log`, `git show`, `git grep`.

### 1. Codice (ramo `php8`, autorità finale)
- `config.inc.php` — righe ~420-445: include di `custom/{dbtype}` e `custom/{db}`; `$custom['chatbot_enabled']`; righe ~465-475 `goplannerAutoload`. **Non copiare** nulla delle righe con connessioni o parole d'ordine.
- `lib/GOPlanner.php` — righe ~95-160: ordine di inclusione per job/worker, `Cliente::getByDb()`, `$accountType`.
- `lib/ClassiCustom.php` — `carica()`, `analizza()`, `esiste()`, `verifica()`; commento GOP-687.
- `lib/SessioneTenant.php` — `switchTenant()`, `switchTenantDaCookie()`, costanti `MOTIVO_*` (solo comportamento visibile).
- `index.php` — righe ~55-110 (cambio di commessa), ~115 (GOP-767), ~145 (GOP-855), ~180-210 (elenco commesse visibili, `Cliente::getByDb`).
- `smarty.inc.php` — `{{custom_js}}` (GOP-624): quale `custom.js` viene servito (solo della commessa, o tipo + commessa?).
- `lib/Queue.php` — `process()`: un processo figlio per job.
- `lib/dict/lang_it.php` — righe ~1960-1980 e `grep -n -i "commess"` per tutte le etichette con «commessa».
- `lib/Cliente.php` — campi del modello `clienti`.
- `lib/ADMINController.php` (`mappaturaInput`), `lib/CaricoRigaBase.php` (`sqlCampiMappatura`).
- `db_clone.sh` — solo il comportamento (crea, esporta, importa, cancella il file temporaneo); nessuna variabile d'ambiente con valori.
- Grep utili:
  - `git grep -n "custom/' \. " -- '*.php' | grep -v "^custom/"` (tutti i punti che costruiscono un percorso `custom/`)
  - `git grep -h "^class Intervento " -- 'custom/*/php/Intervento.php' | sort | uniq -c`
  - `git grep -h -o "\$custom\['[a-z_]*'\]" -- 'custom/*/config.inc.php' | sort | uniq -c | sort -rn | head -30`
  - `git grep -n "extends MainOrm" -- lib/`
  - `ls custom/` e `ls custom/*/README.md | wc -l` (conteggio con metodo dichiarato)

### 2. Docs e WikiLLM
- `docs/01-foundations/01-architecture-rules.md` (Principio 1 e 3)
- `docs/01-foundations/03-database-facts.md` (doppio database, glossario lista/lotto/pratica/distretto, trappola `utenti` / `users`)
- `docs/01-foundations/04-configuration-priority.md`
- `docs/02-patterns/02-customization-pattern.md` (attenzione al conflitto sull'esempio di classe)
- `docs/diagramma_override_multi_tenant.md` (attenzione al conflitto su `custom/{dbtype}/php`)
- `docs/02-patterns/25-identita-centralizzata-e-rbac.md` (non-fusione degli accessi, `identita_users`, `codice_org`)
- `docs/02-patterns/45-schema-canonico-tenant.md` e `docs/01-foundations/10-catalogo-personalizzazioni-schema-tenant.md` (schema canonico, numeri datati, tre livelli di migrazione)
- `migrations/README.md` (`scripts/migrate.php`, `make schema_check`)
- `docs/03-cookbooks/01-add-new-client.md`, `docs/03-cookbooks/12-tenant-bootstrap-modulo.md`, `.claude/skills/create-new-tenant/SKILL.md`
- `docs/02-patterns/32-creazione-utenti-percorsi-e-metodo-canonico.md`, `wiki/identita-rbac/creazione-utenti.md`
- `docs/02-patterns/42-profili-generali-unica-definizione.md` (profilo amministratore unico per tutte le commesse)
- `wiki/assistenza-clienti/configurazione-tenant.md`, `wiki/assistenza-clienti/pagina-utenti-elenco.md`, `wiki/assistenza-clienti/pagina-admin-giro-stato-commesse.md`, `wiki/assistenza-clienti/pagina-lotti.md`
- `custom/default/`, `custom/abc/README.md` e 2-3 `custom/<commessa>/README.md` scelti per mostrare la forma della cartella (non i contenuti)
- `CONTEXT.md` (voci Commessa, Committente, Lotto, Campo personalizzato)

### 3. Portolano (`mcp__rag_qdrant_server__query_rag_hybrid`, `user_roles: "goplanner"`; se scarso, `query_rag`)
- «multi tenant database per cliente goplanner_ clienti.db»
- «priorità override custom tenant lib autoloader ClassiCustom»
- «config.inc.php custom dbtype tipo cliente ordine include»
- «creare nuovo tenant db_clone clienti apikey tipo attivo»
- «mappaturaInput colonne carichi_righe Unknown column sincronizzazione»
- «searchitems PDR codice copia incolla flexifields ricerca zero risultati»
- «schema canonico tenant baseline v0 esclusi schema_check»
- «Cambia commessa selettore commesse identità più commesse»
- «GOP-687 classi personalizzate tenant worker processo figlio»
- «tipo_intervento obbligatorio getDefaultTipo esportazione NULL»
Citare per `slug`.

### 4. Jira GOP (sola lettura; cloudId `21873985-2e5d-4a8a-bb45-e6d453128985`)
- Chiavi da leggere: GOP-687 (classi per commessa nei job), GOP-696 e GOP-338 (schema canonico), GOP-418 (`mappaturaInput`), GOP-107 (cambio di commessa sicuro), GOP-143 (Gea accesa per default), GOP-624 (`custom_js`), GOP-767 e GOP-855 (eccezioni al menu), GOP-836/GOP-838 (Stato commesse), GOP-846/GOP-847 (Elenco utenti e accessi alle commesse), GOP-294 (`json_admin.php` solo staff), GOP-227 (anagrafica lotti).
- JQL:
  - `project = GOP AND text ~ "searchitems" ORDER BY created ASC` (caso PDR, luglio 2026)
  - `project = GOP AND text ~ "nuovo tenant" ORDER BY created DESC`
  - `project = GOP AND text ~ "override" AND text ~ "custom" ORDER BY created DESC`
  - `project = GOP AND summary ~ "commessa" AND summary ~ "selettore"`
  - `project = GOP AND text ~ "tipo_intervento" ORDER BY created DESC`
  - `project = GOP AND text ~ "Unknown column" ORDER BY created DESC`

### 5. Tipi di documento da privilegiare
Codice su `php8` > `docs/02-patterns/` (decisioni datate con ticket) > `docs/03-cookbooks/` > `wiki/assistenza-clienti/` (etichette dell'interfaccia) > Portolano > Jira (storie problema → causa → rimedio).

### 6. Fatti, nomi e numeri da cacciare (checklist)
- [ ] Etichette esatte: «Cambia commessa», «Cerca commessa...», «Nessuna commessa trovata», «Commessa», frase sul selettore «al prossimo accesso».
- [ ] Nomi fisici: `goplanner`, `goplanner_{clienti.db}`; tabelle del master esistenti oggi.
- [ ] Campi di `clienti`: `db`, `nome`, `apikey`, `tipo`, `attivo` (+ `codice_org` se esiste), significato, **mai valori**.
- [ ] Ordine di inclusione della configurazione con file e numero di riga.
- [ ] Ordine di caricamento delle classi con file e metodo; `extends InterventoBase` (58) / `extends InterventoGM` (3) con data del conteggio.
- [ ] Template e `custom.js`: ordine reale.
- [ ] Eccezioni al menu GOP-767, GOP-855.
- [ ] Conteggio delle cartelle di commessa con metodo, o nessun numero; `README.md` presenti (63 al 25 novembre 2026, da riverificare).
- [ ] Schema canonico: 67 / 26 / 40 / 1 al 5 novembre 2026 (GOP-696), con la nota «non verificato sulla produzione».
- [ ] Caso PDR: luglio 2026, 44 commesse, colonna `codice` invece di `pdr`, ticket se esiste.
- [ ] GOP-418: 12 colonne, 9 ottobre 2026, `varchar(50)` / `varchar(500)`.
- [ ] `$custom['tipo_intervento']`: prima voce = default (`Intervento::getDefaultTipo()`), effetto del `NULL` sull'esportazione.
- [ ] Le tre domande al committente e le due da non fare.
- [ ] 403 di `json_admin.php` per chi non è staff GOPlanner (`lib/AdminRequestGuard.php`).

### 7. Conflitti attesi ([CONFLICT] nel dossier; il codice di `php8` vince)
1. **Classi per tipo:** `docs/diagramma_override_multi_tenant.md` mostra un passo `custom/{dbtype}/php/Classe.php`; `ClassiCustom::carica()` cerca solo `custom/{commessa}/php/`. Verificare se esiste un altro punto che carica le classi del tipo.
2. **Esempio di estensione:** `docs/02-patterns/02-customization-pattern.md` scrive `class Intervento extends Intervento`, che in PHP non è valido; il codice usa `extends InterventoBase`. La guida usa la forma del codice.
3. **`custom.js`:** il diagramma dice tipo + commessa; `smarty.inc.php` dice «custom.js del tenant in sessione». Verificare il comportamento reale.
4. **Primo amministratore:** `INSERT` diretto in `goplanner.users` (cookbook, skill) contro `InvitoUtente::crea()` canonico (wiki, docs 32). Dire qual è il percorso valido oggi.
5. **Numero di commesse:** `ls custom` (voci miste), 67 database attivi (5 novembre 2026), commesse nel selettore: tre numeri diversi per tre cose diverse; nel capitolo solo uno, con la sua definizione e la sua data, oppure nessuno.

### 8. Filtro di sicurezza (prima di scrivere il dossier)
Nessun valore di `apikey`, nessuna parola d'ordine (`DBPASS`, MD5 di esempio), nessuna stringa di connessione, nessun indirizzo IP (il cookbook DB ne cita uno: escluderlo), nessun host interno o di sviluppo, nessun percorso di mount del file system condiviso, nessun contenuto del file JSON di credenziali nella radice del repository, nessun nome di persona. Nomi delle commesse: preferire esempi inventati e dichiarati (`nuova_commessa`); se serve un nome reale per un caso, sostituirlo con «una commessa» (DECISIONI.md, punto da confermare con il capitano).

---

## TARGET

- **Word count:** 5.000-5.800 parole in totale (PRD § 4: 4.000-6.000 per capitolo), di cui sei sezioni da 750-1.200 parole ciascuna (STYLE_BIBLE § Pacing: 600-1.200), più «In questo capitolo» (2-3 frasi) e «Fonti».
- **Opening hook strategy:** dopo il paragrafo «*In questo capitolo*», aprire con un caso breve e dichiarato inventato (due colleghi cercano lo stesso codice di utenza e solo uno lo trova, perché hanno aperta una commessa diversa) e fissare subito la regola: in GOPlanner ogni risposta comincia da «in quale commessa?».
- **Closing beat promise:** chiudere con la regola operativa in tre domande — quale commessa è aperta, che cosa dice la sua cartella, che cosa resta del codice comune — senza annunciare il capitolo 3 e senza riprendere la chiusura del capitolo 1.
