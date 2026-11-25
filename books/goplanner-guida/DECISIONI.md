# Decisioni prese senza il capitano — GOPlanner, Guida tecnica (GOP-885, parte 1)

Il capitano ha chiesto il libro la notte del 25 novembre 2026 e ha detto di scegliere l'opzione più plausibile in caso di dubbio e di annotarla. Il genesis grill interattivo della skill new-book (Fase 1b) non si è potuto fare: le nove dimensioni sono state decise qui, sulla base delle fonti di GOPlanner (glossario `CONTEXT.md`, `wiki/index.md`, `docs/00-concept-index.md`, struttura del repository sul ramo `php8`). Ogni scelta si può cambiare: è indicato il costo di cambiarla.

## Genesi (le nove dimensioni della skill new-book)

| # | Dimensione | Scelta | Perché | Costo per cambiarla |
|---|---|---|---|---|
| D1 | Argomento e angolo | Guida tecnica di GOPlanner dal dominio al codice, in quattro parti: dominio, lavoro quotidiano, assistenza e amministrazione, sotto il cofano | Il pubblico è misto (ufficio e sviluppatori); il dominio serve a entrambi, il codice solo ai secondi. Così le prime tre parti si possono pubblicare in GOPlanner per l'ufficio e la quarta resta per lo staff | Riordinare i capitoli; nessun testo da riscrivere |
| D2 | Lettore | Primario: amministratori e back office dei committenti/appaltatori e staff tecnico. Secondario: sviluppatori e agenti nuovi sul repository | Indicato nel brief; i runbook della wiki mostrano che le domande ricorrenti vengono dall'ufficio | Riscrittura del registro di più capitoli |
| D3 | Tono e voce | Calmo, tecnico, italiano semplice; parole del glossario `CONTEXT.md` | Il glossario esiste già ed è quello che usa Gea: la guida parla come il prodotto | Basso |
| D4 | Formato | Guida tecnica di consultazione: capitoli autonomi, procedure numerate, tabelle, riquadri, sezione «Fonti» per capitolo | Deve diventare HTML dentro GOPlanner (parte 2): capitoli autonomi = pagine autonome | Alto (impatta la parte 2) |
| D5 | Nemico | Il sapere tribale: GOPlanner imparato chiedendo a chi c'era | È il problema che i runbook e Gea già cercano di risolvere | Basso |
| D6 | Lunghezza | 16 capitoli, 5-6 sezioni ciascuno, ~4.000-6.000 parole a capitolo | Il brief chiede 12-18 capitoli; 16 copre gli argomenti elencati senza sovrapposizioni | Medio |
| D7 | Lingua | Italiano | Prodotto, glossario, wiki e utenti sono italiani | Alto |
| D8 | Persona dello scrittore | The Engineer + The Scholar Who Can Write | Precisione e fonti (Scholar), sistemi e modi di guasto (Engineer); nessuna persona narrativa ha senso in una guida | Medio |
| D9 | Incognita principale | Che il lettore dell'ufficio legga anche i capitoli sul codice. Mitigazione: ogni sezione dichiara per chi è; i capitoli 13-16 sono marcati DEV | Se l'ufficio non li legge, la guida resta utile: le parti sono separabili | Basso |

## Scelte operative

| # | Scelta | Perché |
|---|---|---|
| O1 | Cartella `books/goplanner-guida/`, file `chapter_N.md` (N = 1..16) | Convenzione del framework; `publish.sh` li ordina per numero |
| O2 | Tutte le fasi del Ralph Loop su Opus (claude CLI), researcher a effort high, architect e reviewer xhigh, gli altri come da default del framework | Il capitano ha chiesto «un agente con Opus»; inoltre solo la CLI claude ha in questa macchina l'accesso MCP al Portolano e a Jira, che il researcher deve interrogare |
| O3 | Copia di `ralph.sh` nella cartella del libro con tre modifiche: default Opus, file di feedback per capitolo (`feedback_loop_N.md`), prompt del researcher rivolto alle fonti interne (codice, wiki, Portolano, Jira) invece che al web, e cartella GOPlanner aggiunta in lettura | Il `ralph.sh` canonico usa un solo `feedback_loop.md`: con capitoli in parallelo due editor si sovrascriverebbero il feedback. Il researcher canonico cerca sul web, che per un prodotto interno non è una fonte |
| O4 | Capitoli eseguiti in parallelo (a gruppi), non in sequenza | 16 capitoli in sequenza su Opus richiederebbero più di una notte. I capitoli sono autonomi per costruzione (PRD § 4, «Confini tra capitoli»); la continuità si regge sul PRD e sul glossario più che sul capitolo precedente |
| O5 | Nessun NotebookLM: il campo «Source corpus» dice `none` | Non esiste un notebook di GOPlanner; le fonti vere sono codice, wiki, Portolano e Jira, elencate in `INSTRUCTION.md` |
| O6 | Nessuna copertina (`generate_cover.sh` copiato ma non eseguito) | È una guida interna; la copertina generata da AI non aggiunge valore e il PDF si compila anche senza |
| O7 | PDF con pandoc + weasyprint tramite `publish.sh` del framework, con un `style.css` per A4, tabelle e codice | Riusa la catena già usata dagli altri libri; nessuno strumento nuovo |
| O8 | Formato Markdown vincolato (`STYLE_BIBLE.md` § Formato): un H1 `# N. Titolo`, sezioni `##`, niente HTML grezzo, niente immagini, sezione `## Fonti` | La parte 2 renderà gli stessi file in HTML dentro GOPlanner: un formato prevedibile rende il rendering banale |
| O9 | Sicurezza: nessun segreto né dato personale; nomi dei committenti solo come esempi di commessa; il researcher filtra prima di scrivere il dossier, l'editor boccia | Il repository GOPlanner contiene file di configurazione e credenziali che non devono finire in una guida pubblicata |
| O10 | Le fonti del libro (dossier, strutture, review) restano nel repository accanto ai capitoli | Servono a verificare ogni affermazione e a rigenerare un capitolo quando GOPlanner cambia |

## Da confermare con il capitano

- Se la Parte IV (capitoli 13-16, per sviluppatori) va pubblicata anche nella pagina Guida dentro GOPlanner o resta solo nel PDF interno (influenza la parte 2).
- Se i nomi dei committenti usati come esempi vanno tolti dalla versione pubblicata in GOPlanner, dove ogni commessa vede la guida.

## Scelte prese durante l'esecuzione

| # | Scelta | Perché |
|---|---|---|
| O11 | Il Portolano si interroga con `user_roles` vuoto, non `goplanner` (corretto in `INSTRUCTION.md` e nel prompt del researcher dopo i primi capitoli) | Verificato il 25/11/2026: con `goplanner` ogni domanda restituisce le stesse due card non pertinenti; con il valore vuoto tornano le card di wiki, docs, codice e ticket. I dossier dei capitoli 1-6 erano già in corso e si reggono su codice, wiki, docs e Jira |
| O12 | Tolte dai capitoli le righe di commento `<!-- … -->` (conteggio parole, controlli NUF e anti-AI) che lo Stage 2 aveva lasciato in coda, e trasformati in corsivo i segnaposto `<nome>` nella prosa | In HTML e in PDF un `<operatore>` fuori dal codice è un tag e sparisce; i commenti sono note di lavoro, non testo della guida (restano nelle review) |
| O13 | `chapter_index.md` e `NARRATIVE_GLOSSARY.md` non sono stati creati | Il `ralph.sh` del framework non chiede a nessun agente di scriverli; il glossario di riferimento della guida è `CONTEXT.md` di GOPlanner |

## Esito del loop (25 novembre 2026, notte)

Tutti i 16 capitoli hanno passato editor (9,0-10/10) e reviewer (45-49/60, correzioni applicate); nessun Circuit Breaker. Il PDF compilato con `./publish.sh --pdf-only` è di 279 pagine.

| Cap. | Editor | Reviewer |
|---|---|---|
| 1 | 9,5 | 45 |
| 2 | 9,5 | 47 |
| 3 | 9,5 | 47 |
| 4 | 10 | 45 |
| 5 | 10 | 47 |
| 6 | 9,5 | 47 |
| 7 | 9,5 | 45 |
| 8 | 9,5 | 46 |
| 9 | 9,5 | 45 |
| 10 | 9,5 | 45 |
| 11 | 10 | 45 |
| 12 | 10 | 49 |
| 13 | 9,0 | 47 |
| 14 | 9,5 | 48 |
| 15 | 9,5 | 47 |
| 16 | 10 | 49 |
