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
Architettura di Ricerca (Deep Search Loop): Segue il protocollo "Pivot Frattale" in 4 step obbligatori per estrarre *Shadow Data* (dati ombra che ancorano la realtà):
1. **Macro (La Cornice):** Date, nomi esatti, architettura dell'evento (es. Wikipedia).
2. **Pivot (Dettaglio Cinetico):** Oggetti fisici, luoghi specifici, nomi in codice (es. modelli di armi, brand).
3. **Sensoriale (Il Vibe):** Micro-dati contestuali (meteo, odori, prezzi dell'epoca, citazioni testuali).
4. **Triangolazione:** Incrocio di fonti multiple per controversie storiche.

Output: Non scrive il capitolo. Produce il `PACK_CONTESTO.md` (o `Dossier.json`) necessario per scriverlo. Senza l'estrazione degli Shadow Data, l'Artigiano tenderà inevitabilmente ad allucinare.

✍️ L'ARTIGIANO (Drafting Agent - Dual-Stage Refinement DSR)
Responsabilità: Generazione del contenuto tramite "Decoupling" (decouplaggio tra creatività e struttura). Risolve il *Task Coupling Dilemma* (l'incapacità dell'IA di essere creativa e formattata nello stesso prompt).

1. **Stage 1 (Prose Engine):** Genera una bozza densa in stile "Novel" (prosa narrativa). Si focalizza esclusivamente su: ritmo, azioni dei personaggi, dialoghi e logica di causa-effetto. Ignora vincoli di formattazione o limiti di parole rigidi.
2. **Stage 2 (Refinement Engine):** Prende la prosa dello Stage 1 e la "compila" nel formato finale richiesto (es. Capitolo di saggio, Sceneggiatura, Post). Qui si applicano i filtri della `STYLE_BIBLE.md` e i vincoli strutturali.

Modalità Ralph: Entrambi gli stage sono "Stateless". Il Refinement Engine vede solo l'output del Prose Engine e il pacchetto di contesto, garantendo una pulizia stilistica assoluta.

⚖️ IL CRITICO E IL REVISORE (Validation Agent)
Il "Compilatore" del sistema che valida l'output finale dell'Artigiano:

1. **Check Logico:** Valida la logica, l'aderenza strutturale e il rispetto dei fatti (Dossier Json).
2. **Judge Estetico:** Valida lo stile penalizzando il burocratese (Vocabolario Astratto), la "Regola del 3" (Liste Nascoste) e imponendo la *Regola di Gary Provost* (Varianza Ritmica).

Evoluzione Dinamica (Safe-Fail): Se il testo viene bocciato per 3 iterazioni consecutive senza progressi direzionali, il Critico deve segnalare il blocco in `ACTIVITY.log` e adattare la regola, prevenendo loop di budget infiniti.
Questo è il processo ciclico da ripetere per ogni "Unità Minima" (Scena, Paragrafo o Sottocapitolo).

FASE 1: INIZIALIZZAZIONE (Setup e Pianificazione Bidirezionale)
L'utente non si limita a lanciare il progetto. L'Architetto DEVE fare domande esplorative per estrarre le "assunzioni implicite" (Bidirectional Planning) prima di forgiare il `CONFIG.md`:

GENRE: [es. Thriller Cyberpunk / Manuale di Giardinaggio]
TARGET AUDIENCE E NEMICO: [Contro chi combattiamo? Es. la noia, il complotto]
TONE (Palette): [es. Keywords (Noir, Cinico) vs Anti-Keywords (Olistico, Accademico)]
LENGTH_CONSTRAINT E VOLUMI: [es. Totale 60.000 parole, diviso in moduli].
FORBIDDEN: [es. "Niente deus ex machina" / "Niente bullet points"]

FASE 2: ESPANSIONE FRATTALICA (Zoom In)
L'Architetto prende il Capitolo X e lo esplode rigorosamente.
**Regola Anti-Compressione (Scene-Level Generation):** Poiché gli LLM soffrono del "limite di 600 parole" per output (effetto bignami), non si incarica MAI la stesura di un intero capitolo. Il capitolo DEVE essere frammentato in ~6 scene (~1000 parole ciascuna).

Esempio Fiction: "L'eroe entra nella caverna" -> 1. L'odore di zolfo. 2. Il primo passo nel buio. 3. L'incontro con il mostro.
Esempio Saggio: "Come potare le rose" -> 1. Gli strumenti necessari. 2. Il taglio a 45 gradi. 3. La cura post-taglio.

FASE 3: IL CICLO DI PRODUZIONE (Ralph Loop)
Per ogni "Beat" definito sopra:

1. **Context Fetching (Il Ricercatore):**
   - Carica i dati necessari (Shadow Data, schede personaggio, dati tecnici).
   - Crea `context_current_beat.md`.

2. **Drafting (L'Artigiano - DSR Loop):**
   - **Stage 1 (Prose Engine):** Legge il contesto e scrive la scena in forma di prosa narrativa densa (Novel style). Salva in `draft_prose.md`.
   - **Stage 2 (Refinement Engine):** Legge `draft_prose.md` + `STYLE_BIBLE.md` e raffina il testo nel formato e stile finale. Salva in `draft_final.md`.

3. **Validation (System 2 Audit):**
   - **Check Logico (Il Critico):** Il nome del protagonista è corretto? I dati sono 100% veri? Aderenza al BLUEPRINT?
   - **Judge Estetico (Anti-AI Judge):** C'è varianza ritmica? Manca il burocratese AI? Rispetta i divieti della STYLE_BIBLE?

FAIL: Se score < 8.5/10, l'errore specifico (Feedback Loop) va annotato nel `ACTIVITY.log` e l'Artigiano riparte dallo Stage 2 (o Stage 1 se l'errore è logico). Se i fallimenti superano i 3 tentativi, applicare *Evoluzione Dinamica*.
PASS: Il testo finale viene appeso al MASTER_DRAFT.md.

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
   - TITOLO
   - GENERE
   - OBIETTIVO (Tone/Voice)
   - STRUTTURA MACRO
   - VINCOLI DI STILE (STYLE_BIBLE)

2. ISTANZIAZIONE AGENTI: Configura le Personas:
   - L'ARCHITETTO (Strategy)
   - IL RICERCATORE (Context/Shadow Data)
   - L'ARTIGIANO (Drafting via DSR: Stage 1 Prose, Stage 2 Refinement)
   - IL CRITICO (Validation: Logic & Aesthetics)

3. START: Attendi il mio input 'START' per generare il BLUEPRINT.md iniziale.

Modalità operativa: Ralph Wiggum (Stateless + DSR Generation + Validation Loops). Nessuna allucinazione, solo ciò che è scritto nei file di contesto."