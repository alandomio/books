# Book PRD: GOPlanner — Guida tecnica

## 1. Vision
- **Title:** GOPlanner — Guida tecnica
- **Subtitle:** Commesse, interventi, app di campo, architettura e rilasci, spiegati da chi li deve far funzionare
- **One-line pitch:** Una guida verificabile che porta chi entra in GOPlanner (in ufficio, nel back office o nel codice) dal file del committente fino all'esportazione, e da `index.php` fino al rilascio in produzione.
- **Enemy (what the book destroys):** il sapere tribale. Oggi GOPlanner si impara chiedendo a chi c'era: «perché questa lista non compare nel Piano», «dove si cambia una mappatura», «perché l'utenza risulta ancora assegnata». La guida sostituisce il passaparola con regole scritte, nomi di menu esatti, nomi di file e tabelle reali, e il motivo di ogni comportamento.
- **Promise (what the reader gains):** chi finisce la guida sa nominare ogni oggetto di GOPlanner con la parola giusta del glossario, sa percorrere il ciclo completo di una commessa (importazione → pianificazione → app → esito → verifica → esportazione), sa dove guardare quando qualcosa non torna (pagine Admin, Gea, log), e sa dove sta nel codice ogni pezzo che ha visto nell'interfaccia.

## 2. Target Reader
- **Primary:** amministratori e personale di back office delle aziende che usano GOPlanner (supervisori degli operatori, responsabili di commessa) e lo staff tecnico di GOPlanner che fa assistenza.
- **Secondary:** sviluppatori nuovi e agenti di codice che devono lavorare sul repository GOPlanner (ramo `php8`): i capitoli 13-16 sono scritti per loro, i capitoli 1-12 danno loro il dominio.
- **Anti-target (who this book is NOT for):** l'operatore sul campo che cerca un manuale dell'app passo per passo; il commerciale che cerca argomenti di vendita; chi cerca la documentazione delle singole personalizzazioni di ogni commessa (restano nei README dei tenant).

## 3. Tone & Voice
- **Tone target:** calmo, tecnico, preciso. Ogni affermazione è verificabile in una fonte (Portolano, wiki, ticket, codice). Frasi chiare, italiano semplice, nomi dei menu tra virgolette basse «…», nomi di file, tabelle e classi in `codice`.
- **Anti-tone:** marketing («potente», «rivoluzionario», «soluzione all'avanguardia»), burocratese, italiano da assistente («È importante notare che…»), tono da tutorial infantile.
- **Style references:** la documentazione di Stripe e di PostgreSQL per la precisione; Charles Petzold e Tracy Kidder per la capacità di spiegare come funziona davvero una macchina.

## 4. Structure

Sedici capitoli in quattro parti. Ogni capitolo è autonomo (si legge da solo, anche come pagina HTML), comincia con un paragrafo «In questo capitolo» e chiude con una sezione «Fonti».

| # | Chapter Title | Core Question | Audience Tag |
|---|--------------|---------------|--------------|
| | **Parte I — Il dominio** | | |
| 1 | Che cos'è GOPlanner | Quale lavoro organizza GOPlanner, chi lo usa, e qual è il ciclo completo dal file del committente all'esportazione? Glossario di base (utente, operatore, committente, commessa, utenza, lista, pratica, intervento, esito, stato) | ALL |
| 2 | Commesse e tenant | Che cosa significa che ogni commessa ha i suoi dati e le sue regole: un database per commessa, il DB master, la cartella `custom/{tenant}`, la priorità degli override, come nasce una commessa nuova | ALL |
| 3 | Utenze, liste, pratiche, lotti e carichi | Come è fatto il lavoro in GOPlanner: la differenza tra utenza, lista, pratica, lotto, distretto e carico; lo stato di un'utenza derivato dall'ultimo intervento; i campi personalizzati | ALL |
| | **Parte II — Il lavoro quotidiano** | | |
| 4 | Importazione: dal file del committente alla lista | Come si importa un file (File › Importazione, Importazione classica), cosa sono le mappature, gli scarti e i loro motivi, cosa fare quando il tracciato cambia (anche con Gea), dove si vede l'esito | BACKOFFICE |
| 5 | Pianificazione e giri | Come si assegnano gli interventi agli operatori e ai giorni: Interventi › Pianificazione, Area e Lazo, Calendario, Pianificazione operatori, Giornata/Settimana/Mappa del giorno, modalità di pianificazione, fasce e slot, zone, giro giornaliero | BACKOFFICE |
| 6 | Interventi, esiti e verifica | Il ciclo di vita di un intervento: stati, esecuzioni (`interventi_eseguiti`), riaffidare, ripianificare un non fattibile, eliminare il precedente, Verifica interventi e analisi AI delle foto | BACKOFFICE |
| 7 | Esportazione e consegna al committente | Come si produce il file per il committente: menu Esportazione, modelli salvati e duplicati, esportazione in coda, avanzamento, file scaduti, esportazione delle foto, cosa fare se è vuota o fallita | BACKOFFICE |
| 8 | Gli operatori e l'app GOPlanner 3 | Come lavora l'operatore: abbinamento del telefono, scarico degli interventi, esiti, foto, firma, posizione, segnalazioni, comandi remoti approvati dall'ufficio, aggiornamenti; Operatori › Confronto e dashboard | ALL |
| 9 | Il magazzino | Come si gestiscono contatori e materiali: Giacenze, Movimenti, Anomalie, carico in centrale e da Excel, QR di scatola e pedana, il Magazziniere (postazione con lettore e app), DDT, inventario del furgone | BACKOFFICE |
| | **Parte III — Assistenza e amministrazione** | | |
| 10 | Gea, l'assistente di GOPlanner | Che cosa fa Gea e che cosa non fa: domande, runbook di indagine, proposte con «Autorizza», correzione delle mappature, ticket aperti dalla chat, contesto della pagina, limiti | ALL |
| 11 | Utenti, ruoli e permessi | Chi vede che cosa: identità centralizzata sul DB master, RBAC e profili, inviti, lotti di competenza, amministratore e staff tecnico, ambito dei dati, diagnostica della visibilità | ADMIN |
| 12 | Strumenti di amministrazione e diagnostica | Le pagine Admin (Cruscotto Analisi AI, Manutenzione, Errori app e Log, Giro e Stato commesse), la sezione Ticket, i runbook «dove si è fermato il dato» e «perché ho visto un errore», annunci e campanella | ADMIN |
| | **Parte IV — Sotto il cofano** | | |
| 13 | Architettura di GOPlanner su PHP 8 | Come è fatto il gestionale: punti di ingresso, flusso MVC `index.php` → `pages/` → Smarty, `lib/`, controller API, personalizzazioni per tenant, job asincroni e avanzamento, worker, websocket, frontend JS | DEV |
| 14 | Il modello dei dati | Le tabelle centrali (`utenze`, `interventi`, `interventi_eseguiti`, `operatori`, `carichi`, posizioni), le relazioni, il DB master `goplanner`, campi personalizzati e flexigrid, schema canonico dei tenant, regole di accesso al database | DEV |
| 15 | Integrazioni e API | Con chi parla GOPlanner: API per l'app mobile (envelope, sincronizzazione in ingresso), API v2 e Call Center / VoiceAI, motore unico di operazioni console/API/MCP, AI vision, mappe, Portolano (RAG) | DEV |
| 16 | Operazioni, qualità e rilasci | Come si porta una modifica in produzione: ambiente locale Docker, test (headless, E2E, mobile), Jira come registro dei task, rilascio e deploy su AWS, changelog per tenant, log e osservabilità (CloudWatch, canale mobile), migrazione PHP 8.4 | DEV |

Audience tags: **ALL** (tutti), **BACKOFFICE** (amministratori e back office), **ADMIN** (amministratori e staff tecnico), **DEV** (sviluppatori e agenti). Le sezioni dei capitoli possono usare tag più fini: [UFFICIO], [STAFF], [DEV], [TUTTI].

### Confini tra capitoli (per evitare sovrapposizioni)
- La **mappatura** come oggetto di configurazione è nel cap. 4 (import) e nel cap. 7 (export); il file `mappature.php` come codice è nel cap. 13.
- La **posizione GPS** come dato dell'app è nel cap. 8; la tabella è nel cap. 14.
- **Gea** come strumento per l'utente è nel cap. 10; l'architettura del servizio chatbot è nel cap. 15.
- I **permessi** come regole sono nel cap. 11; come si diagnosticano nel cap. 12.
- Il **ciclo dell'intervento** dal lato ufficio è nel cap. 6; dal lato telefono è nel cap. 8.

### Lunghezza
- 5-6 sezioni per capitolo, circa 4.000-6.000 parole per capitolo, ~80.000 parole totali.

## 5. Success Criteria
- A reader who finishes this book can: spiegare a un collega nuovo il ciclo completo di una commessa con le parole del glossario; importare un file e leggere gli scarti; pianificare e riaffidare interventi; produrre e controllare un'esportazione; diagnosticare un problema di visibilità o di import con le pagine Admin o con Gea prima di aprire un ticket; (sviluppatore) trovare nel repository il file che governa una pagina, una tabella o un'API e capire come si rilascia una modifica.
- A reader who finishes this book feels: di avere una mappa affidabile al posto del passaparola; sicuro di dove fermarsi (cosa può fare da solo, cosa chiede allo staff tecnico).
- A reviewer would describe it as: «la documentazione che mancava: precisa, verificabile, scritta per chi lavora».

## 6. Hard constraints (non negoziabili)
- **Nessun segreto:** mai credenziali, password, chiavi API, token, stringhe di connessione, indirizzi IP, nomi di host interni non pubblici, contenuto di file `.env` o di file di credenziali presenti nel repository.
- **Nessun dato personale:** mai nomi di intestatari di utenze, di operatori, di utenti, indirizzi reali, numeri di telefono, email. Gli esempi usano dati inventati e dichiarati come tali.
- **Nomi dei committenti:** solo come esempi di commesse già visibili nel prodotto (nome del tenant o del committente), con parsimonia; mai dettagli contrattuali, economici o di gara.
- **Verificabilità:** ogni affermazione tecnica viene dal dossier del capitolo; ogni capitolo chiude con «Fonti» (slug del Portolano, percorso della wiki o di `docs/`, chiave Jira, percorso di codice sul ramo `php8`).
- **Markdown pulito:** titolo `# N. Titolo` come unico H1, sezioni `##`, sottosezioni `###`; niente HTML grezzo; immagini solo con percorsi relativi; tabelle Markdown standard. I file devono rendersi uguali in PDF (pandoc) e in HTML dentro GOPlanner.
