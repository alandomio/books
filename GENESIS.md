🌐 FRAMEWORK G.E.N.E.S.I.S. v1.0
(Generative Engine for Narrative & Editorial Systems via Iterative Structure)

1. IL FILE SYSTEM COGNITIVO (La Verità su Disco)
In un sistema agentico robusto, la memoria della chat è volatile. L'unica verità risiede nei file. Questa struttura funziona per qualsiasi genere.

BLUEPRINT.md: Il piano maestro. Contiene la struttura frattalica (Libro -> Parti -> Capitoli -> Unità Minime).

STYLE_BIBLE.md: Il DNA del libro. Contiene tono di voce, regole grammaticali, divieti (es. "niente avverbi" o "niente gergo tecnico").

CONTEXT/: Cartella dinamica.

world_bible.md (per Fiction: personaggi, lore, regole magiche).

research_data.md (per Non-Fiction: fonti, dati, interviste).

ACTIVITY.log: Il registro di "Build & Crash" (cosa ha funzionato, cosa è stato scartato).

DRAFTS/: Dove vivono le bozze prima dell'approvazione.

2. CONFIGURAZIONE DEI RUOLI (Le Personas Astratte)
Dimentica "Il Segugio" o "Il Chirurgo". Ecco i ruoli universali che puoi istanziare.

🏛️ L'ARCHITETTO (Strategy Agent)
Responsabilità: Mantiene la coerenza macroscopica. Gestisce il BLUEPRINT.md.

Logica Frattalica: Se il libro è un romanzo, verifica l'arco di trasformazione del protagonista. Se è un saggio, verifica la progressione logica dell'argomentazione.

Task: Non scrive prosa. Crea i "Ticket di Lavoro" per gli altri agenti.

🔭 IL RICERCATORE / WORLD-BUILDER (Context Agent)
Per Non-Fiction: È un data-miner. Cerca fatti, statistiche, giurisprudenza.

Per Fiction: È il custode della Lore. Verifica se "Mario" ha gli occhi azzurri nel cap. 1 e verdi nel cap. 10. Genera dettagli sensoriali sull'ambientazione.

Output: Non scrive il capitolo. Produce il PACK_CONTESTO.md necessario per scriverlo.

✍️ L'ARTIGIANO (Drafting Agent)
Responsabilità: Scrittura pura (Ghostwriting).

Input: Riceve un PACK_CONTESTO e le regole della STYLE_BIBLE.

Modalità Ralph: È "Stateless". Non sa cosa ha scritto due capitoli fa, si fida solo del pacchetto di contesto che riceve ora. Questo lo rende focalizzato e privo di allucinazioni di memoria.

⚖️ IL CRITICO (Validation Agent / Linter)
Responsabilità: Il "Compilatore". Blocca il processo se la qualità non è raggiunta.

Strumenti: Una lista di controllo (Checklist) rigida basata sulla STYLE_BIBLE.

Potere: Ha diritto di veto (Exit Code 1). Se il testo non passa, l'Artigiano deve riscrivere.

3. IL FLUSSO DI LAVORO UNIVERSALE (The Loop)
Questo è il processo ciclico da ripetere per ogni "Unità Minima" (Scena, Paragrafo o Sottocapitolo).

FASE 1: INIZIALIZZAZIONE (Setup)
L'utente definisce le variabili nel file CONFIG.md:

GENRE: [es. Thriller Cyberpunk / Manuale di Giardinaggio]

TONE: [es. Noir e cinico / Empatico e pratico]

LENGTH_CONSTRAINT: [es. 1500 parole per unità]

FORBIDDEN: [es. "Niente deus ex machina" / "Niente bullet points"]

FASE 2: ESPANSIONE FRATTALICA (Zoom In)
L'Architetto prende il Capitolo X e lo esplode in 4-6 "Beat" o "Sezioni".

Esempio Fiction: "L'eroe entra nella caverna" -> 1. L'odore di zolfo. 2. Il primo passo nel buio. 3. L'incontro con il mostro.

Esempio Saggio: "Come potare le rose" -> 1. Gli strumenti necessari. 2. Il taglio a 45 gradi. 3. La cura post-taglio.

FASE 3: IL CICLO DI PRODUZIONE (Ralph Loop)
Per ogni "Beat" definito sopra:

Context Fetching (Il Ricercatore):

Carica i dati necessari (scheda personaggio o dati botanici).

Crea context_current_beat.md.

Drafting (L'Artigiano):

Legge context_current_beat.md + STYLE_BIBLE.

Scrive draft_v1.md.

Validation (Il Critico):

Esegue i test:

Test Coerenza: Il nome del protagonista è corretto? I dati botanici sono veri?

Test Stile: Ci sono avverbi vietati? Il tono è giusto?

Test Volume: Rispetta la lunghezza?

FAIL: Restituisce l'errore specifico nel ACTIVITY.log. L'Artigiano riprova.

PASS: Il testo viene appeso al MASTER_DRAFT.md.

4. ESEMPI DI ADATTAMENTO (Use Cases)
Ecco come configurare il Critico (il Linter) per due progetti opposti.

CASO A: ROMANZO FANTASY ("Il Trono di Cristallo")
Istruzioni per il Critico:

Check 1 (Show Don't Tell): Se trovi frasi come "Luigi era triste", blocca e richiedi descrizione fisica (lacrime, spalle curve).

Check 2 (Lore Consistency): Controlla nel world_bible.md. Se la magia costa energia vitale, il protagonista è stanco dopo l'incantesimo? Se no -> REJECT.

Check 3 (Dialogue): Il dialogo supera il 40% del testo? -> WARNING.

CASO B: MANUALE TECNICO ("Python per Principianti")
Istruzioni per il Critico:

Check 1 (Clarity): Ci sono frasi lunghe più di 3 righe? -> REJECT (Semplificare).

Check 2 (Formatting): Il codice è formattato nei blocchi corretti? -> REJECT.

Check 3 (Accuracy): (Richiede plugin code interpreter) Il codice d'esempio funziona? -> REJECT se errore.

Check 4 (Tone): Ci sono metafore inutili? -> REJECT (Mantenere secco e diretto).

5. SYSTEM PROMPT DI ATTIVAZIONE (Generico)
Copia questo prompt per avviare G.E.N.E.S.I.S. su qualsiasi progetto:

"Attiva protocollo G.E.N.E.S.I.S.

1. DEFINIZIONE PROGETTO: Chiedimi di compilare i seguenti campi:

TITOLO:

GENERE:

OBIETTIVO (Tone/Voice):

STRUTTURA MACRO (Quanti capitoli/sezioni?):

VINCOLI DI STILE (Cosa è vietato?):

2. ISTANZIAZIONE AGENTI: Una volta ricevuti i dati, configura le Personas:

L'ARCHITETTO per gestire la struttura frattalica.

IL RICERCATORE (adatta il suo focus in base al genere: Ricerca Dati o Coerenza Narrativa).

L'ARTIGIANO per la scrittura.

IL CRITICO con le regole di validazione specifiche per il genere dichiarato.

3. START: Attendi il mio input 'START' per generare il BLUEPRINT.md iniziale.

Modalità operativa: Ralph Wiggum (Stateless + Validation Loops). Nessuna allucinazione, solo ciò che è scritto nei file di contesto."