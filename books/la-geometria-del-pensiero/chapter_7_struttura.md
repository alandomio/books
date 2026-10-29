# Capitolo 7 — Struttura: «Oltre la Chat: L'Avvento degli Agenti Autonomi»

**Core question (PRD.md § 4):** Cosa distingue un chatbot che produce una risposta da un sistema agente che conserva uno stato, sceglie strumenti, compie azioni, osserva gli esiti e modifica il passo successivo?
**Audience tag capitolo (PRD.md § 4):** [EXPERT]

## PRE-FLIGHT CHECKS

- **Repertorio metaforico (PRD.md § 6):** l'**Assistente con la Cassetta degli Attrezzi** è l'analogia canonica obbligatoria del Capitolo 7. Il capitolo deve aprire sul risultato visibile di un'azione, introdurre la cassetta nel Beat 2, mapparne ogni elemento sull'architettura reale — incarico, catalogo degli strumenti, runtime, credenziali, ambiente, ricevute degli esiti e arresto — e chiuderla nel Beat 7. Limite da dichiarare: l'“assistente” è l'intero sistema orchestrato; il modello, isolato, non impugna utensili, non possiede credenziali e non coltiva un'intenzione.
- **Continuity check:** `chapter_index.md` non esiste, quindi manca il registro autorevole dei capitoli approvati. Restano vincolanti il PRD e il ponte finale del Capitolo 6: il test-time compute può costruire e selezionare un piano dentro il testo, mentre il salto del Capitolo 7 avviene quando un runtime esegue un'azione e restituisce al modello un'osservazione non già contenuta nel prompt. Non ripetere il Capitolo 6 su chain of thought, self-consistency o verificatori; usarli soltanto per marcare il confine fra deliberazione testuale e ciclo azione–feedback. Nessun conflitto rilevabile con i file disponibili.
- **Glossary check:** `NARRATIVE_GLOSSARY.md` non esiste. Candidati che il Writer Stage 2 dovrà valutare: *agente IA*, *runtime/orchestratore*, *tool call/chiamata a strumento*, *schema dello strumento*, *osservazione*, *stato*, *memoria esterna*, *ciclo agente*, *condizione di arresto*, *confine di autorizzazione*, *minimo privilegio*, *prompt injection indiretta*, *human-in-the-loop*.
- **Confine di scope:** non fare una classifica di prodotti, un manuale per programmatori, una profezia sul lavoro o una scorciatoia verso l'AGI. Non anticipare il catalogo generale di bias, allucinazioni e sovrageneralizzazione del Capitolo 8: qui interessano solo gli errori che cambiano natura quando una frase può diventare azione. Swarm e sistemi multi-agente sono fuori scope salvo una riga di delimitazione.
- **Guardia epistemica:** “decide”, “pianifica”, “ricorda”, “vede”, “si corregge” e “persegue un obiettivo” sono abbreviazioni consentite solo se il testo esplicita nello stesso paragrafo o nel successivo il meccanismo: generazione di una richiesta strutturata, stato serializzato, selezione probabilistica, feedback dell'ambiente e regola di arresto. “Autonomo” non è una proprietà binaria né una prova di volontà: va scomposto in ampiezza dei permessi, durata del ciclo e necessità di approvazione umana.
- **Scena, non demo promozionale:** l'apertura richiede una traiettoria pubblica e riproducibile con task ID o artefatto identificabile, tool call, osservazione, modifica dello stato ed esito verificabile. Un video aziendale montato o una trascrizione senza log può offrire contesto, non reggere la catena fattuale.

## NUFs (Goal Scoring)

Dieci utility, un punto ciascuna. Obiettivo di progetto: almeno 8,5/10, senza azzerare nessuna delle tre categorie `reader`, `emotional`, `factual`.

```text
utility(reader): Il lettore può distinguere un chatbot da un agente tracciando il ciclo completo obiettivo → stato → scelta dell'azione → esecuzione esterna → osservazione → aggiornamento → arresto, e può indicare quale passaggio manca in una normale risposta in chat → score += 1

utility(reader): Il lettore può spiegare la Cassetta degli Attrezzi senza antropomorfismo: il modello genera il nome di uno strumento e i suoi argomenti, mentre un runtime autorizzato valida la richiesta, usa le credenziali, esegue l'azione e reinserisce l'esito nel contesto → score += 1

utility(reader): Il lettore può distinguere piano, azione, osservazione, stato e memoria, riconoscendo che una lunga catena di pensiero non è ancora un agente e che una cronologia persistente non è memoria autobiografica → score += 1

utility(reader): Il lettore può valutare un claim di “autonomia” chiedendo quali strumenti sono disponibili, quali permessi hanno, per quanto tempo il ciclo può continuare, che cosa è reversibile, chi verifica il risultato e quale condizione lo ferma → score += 1

utility(reader): Il lettore può delegare in modo proporzionato: delimitare il compito, concedere il minimo privilegio, separare lettura e scrittura, pretendere evidenze degli effetti e imporre approvazione umana prima delle azioni irreversibili o ad alta posta → score += 1

utility(emotional): Il lettore prova meraviglia concreta davanti a una risposta che diventa azione, ma anche la sobria consapevolezza che il potere nuovo risiede nel collegamento fra modello, strumenti e permessi — non nella comparsa improvvisa di una volontà dentro la macchina → score += 1

utility(factual): Un'architettura agente fondamentale — preferibilmente ReAct o un'alternativa primaria meglio documentata — è ricostruita con autori, date, modello, ambiente, task, traiettoria azione–osservazione, baseline, risultato e limite dichiarato → score += 1

utility(factual): Il tool use è documentato con almeno uno studio o artefatto primario che mostri catalogo/schema, selezione dello strumento, costruzione degli argomenti, esecuzione esterna e trattamento dell'errore, senza attribuire al modello l'azione compiuta dal runtime → score += 1

utility(factual): La fragilità sui compiti lunghi è mostrata con almeno un benchmark agente versionato e una traiettoria fallita: numero di task, criterio di successo, modello/checkpoint, budget o numero di passi, baseline, costo o latenza disponibile e principali limiti del valutatore → score += 1

utility(factual): Il rischio di prompt injection indiretta o uso improprio degli strumenti è ricostruito da una fonte primaria con assetto di fiducia, capacità concesse, azione tentata, tasso o denominatore dell'attacco e controlli difensivi, bilanciando sicurezza e utilità → score += 1
```

## BEAT LIST

### Beat 1 — «La risposta che lascia lo schermo»

**Core question:** Qual è il primo istante osservabile in cui una risposta smette di essere soltanto testo e diventa un'azione con conseguenze verificabili?
**Audience tag:** [ALL]
**Word count target:** 900 parole
**Funzione narrativa:** Hook → Complicate. Aprire su una traiettoria reale in un terminale, browser o ambiente simulato: il sistema riceve un incarico, emette una richiesta d'azione, qualcosa fuori dal modello cambia e torna un esito inatteso. Solo dopo mostrare che il soggetto della scena non è “un LLM che agisce”, ma un insieme di componenti.
**Key facts che il Researcher deve trovare:**

- Una traiettoria end-to-end pubblica, identificabile e non ricostruita: data, luogo o ambiente digitale, task ID/issue/episodio, modello e versione, strumenti esposti, prima azione, prima osservazione, numero di passi, esito e artefatto finale. Preferire un log di ReAct, WebArena, SWE-bench, Voyager o un sistema comparabile con repository e transcript accessibili.
- Un singolo dettaglio fisico verificabile per la scena — stringa del comando, codice d'uscita, nome del file, messaggio d'errore, pulsante, URL o oggetto dell'ambiente — proveniente dal log originale; vietati mani sulla tastiera, luci della stanza o reazioni umane non documentate.
- Il confine controllabile fra output passivo e azione: nel primo caso il modello propone testo; nel secondo un programma interpreta un output come richiesta autorizzata e produce un effetto esterno.
- Una definizione operativa di *agente* ricavata da almeno due fonti autorevoli e non identiche; registrare il disaccordo terminologico e conservare solo il minimo comune: obiettivo o task, stato, azione, osservazione/feedback e iterazione.
- Il modello esatto non deve essere presentato come l'intero agente: identificare orchestratore/runtime, ambiente, strumenti, memoria o log, regole di permesso e condizione di arresto nella scena scelta.
- Se si confrontano modalità chat e agente, usare lo stesso modello e lo stesso task oppure dichiarare il confondente; non dedurre l'effetto dell'architettura confrontando prodotti o checkpoint diversi.

### Beat 2 — «La Cassetta degli Attrezzi»

**Core question:** Che cosa accade davvero fra la frase “userò questo strumento” e l'effetto prodotto nel mondo?
**Audience tag:** [EXPERT]
**Word count target:** 950 parole
**Funzione narrativa:** Establish → Resolve. Aprire la metafora canonica pezzo per pezzo e tradurla integralmente nell'architettura: etichetta, schema, argomenti, validazione, credenziali, esecuzione, ricevuta. Chiudere subito il primo limite dell'immagine: la cassetta appartiene al runtime, non ai pesi del modello.
**Key facts che il Researcher deve trovare:**

- Un protocollo documentato di tool/function calling con il messaggio grezzo o la struttura dati esatta: nome della funzione, schema dei parametri, argomenti generati, validazione, risultato restituito e prosecuzione della conversazione.
- Meccanica del passaggio: il modello produce token che codificano una scelta e degli argomenti; il runtime esegue codice o una chiamata API; l'output dello strumento viene serializzato come nuova osservazione nel contesto. Verificare dove avvengono parsing, coercizione dei tipi, retry e gestione dell'errore nell'implementazione scelta.
- Mappatura obbligatoria della metafora: incarico = obiettivo/task; inventario ed etichette = descrizioni/schema; utensile = funzione/API; mano con la chiave = runtime più credenziali; banco di lavoro = ambiente o sandbox; ricevuta = output/log; caporeparto o proprietario = politica di autorizzazione e approvazione umana.
- Almeno un esperimento primario sul tool use — per esempio Toolformer o un'alternativa meglio replicata — con autori, anno, modelli, API, procedura, baseline, risultati e ablation; separare l'apprendimento di *quando* chiamare uno strumento dall'esecuzione dello strumento.
- Fallimenti distinti e documentati: strumento inesistente, scelta dello strumento sbagliato, argomento malformato, autorizzazione negata, timeout, output ambiguo o successo tecnico con effetto semanticamente errato.
- Differenza fra strumento di sola lettura e strumento con effetti; individuare dove sono custodite le credenziali e dimostrare che descrivere una funzione al modello non equivale ad autorizzarne l'esecuzione.
- Un caso in cui uno strumento migliora verificabilmente il risultato e un caso in cui aggiunge un nuovo punto di rottura; mantenere uguali modello, task e metrica quando la fonte lo consente.

### Beat 3 — «Agire, guardare, correggere la rotta»

**Core question:** Perché un agente non è un piano lungo, ma un ciclo che lascia cambiare il passo successivo a ciò che è appena accaduto?
**Audience tag:** [EXPERT]
**Word count target:** 1000 parole
**Funzione narrativa:** Complicate → Resolve. Seguire una sola traiettoria in cui la prima azione non basta o fallisce; far vedere l'osservazione che modifica il secondo passo, quindi isolare il ciclo agente e la sua regola di arresto.
**Key facts che il Researcher deve trovare:**

- ReAct, *Synergizing Reasoning and Acting in Language Models*: autori, cronologia preprint/pubblicazione, modelli, ambienti e benchmark, formato Thought/Action/Observation, baseline e risultati esatti; distinguere una traiettoria illustrativa dai dati aggregati.
- Una traiettoria primaria con errore o informazione mancante che produca replanning: trascrivere soltanto i passaggi necessari, conservando azione, osservazione e stato prima/dopo. Non inventare un monologo interno fra due tool call.
- Differenza fra piano iniziale completo, plan-and-execute e scelta interleaved del prossimo passo; verificare con fonti quali sistemi usano davvero una rappresentazione esplicita del piano e quali generano soltanto l'azione successiva.
- Formalizzazione accessibile del ciclo: stato corrente + obiettivo + osservazione → proposta di azione; validazione/esecuzione esterna → nuovo stato. Specificare quali campi persistono e quali vengono ricostruiti nel sistema scelto.
- Condizioni di arresto reali: successo verificato, risposta finale, limite di passi/token/tempo/costo, errore non recuperabile o richiesta di intervento umano. Cercare almeno un loop fallito per assenza o cattiva progettazione dello stop.
- Ponte netto dal Capitolo 6: i token intermedi riorganizzano informazione già nel contesto; una tool call può introdurre un'osservazione nuova. Bilanciamento: nuova non significa vera, completa o affidabile.
- Distinzione fra feedback deterministico — test, exit code, vincolo formale — e feedback semantico giudicato da un altro modello; documentare il diverso potere probatorio senza ripetere l'intero capitolo sui verificatori.

### Beat 4 — «Che cosa resta fra un passo e l'altro?»

**Core question:** Come può il sistema riprendere un incarico, ricordare un esito e non perdere il punto senza possedere una biografia?
**Audience tag:** [EXPERT]
**Word count target:** 900 parole
**Funzione narrativa:** Establish → Complicate → Resolve parziale. Partire da un'interruzione concreta — processo riavviato, finestra di contesto piena o task ripreso — e separare stato operativo, cronologia, memoria esterna e identità narrativa.
**Key facts che il Researcher deve trovare:**

- Tassonomia meccanica con implementazioni documentate: contesto corrente, scratchpad o log del task, stato strutturato dell'ambiente, memoria esterna recuperabile, archivio di artefatti/skill e checkpoint. Per ciascuno: dove vive, come viene scritto, come viene recuperato, quando scade.
- Un sistema primario che usa memoria o una libreria persistente — Voyager, Generative Agents o un'alternativa con codice e ablation — con autori, data, ambiente, meccanismo di retrieval, criterio di scrittura, baseline ed effetto misurato.
- Un esempio preciso in cui la persistenza permette di completare un task più lungo e un esempio in cui un ricordo irrilevante, obsoleto o contaminato devia l'azione; cercare metriche di retrieval e non affidarsi a una demo qualitativa.
- Differenza fra stato del mondo e testo che lo descrive: un file può essere stato modificato anche se il riassunto dice il contrario; serve una nuova lettura o un controllo esterno per riconciliare i due.
- Costi e rischi della memoria: consumo della finestra di contesto, compressione che perde dettagli, recupero errato, dati personali, retention, cancellazione e propagazione di istruzioni ostili.
- Guardia antropomorfica: “ricorda il proprio obiettivo” deve essere tradotto in un record persistente reinserito nel prompt o consultato dal runtime; nessuna continuità soggettiva va inferita dal fatto che un identificatore di sessione sopravviva.

### Beat 5 — «L'istruzione nascosta nel cassetto»

**Core question:** Che cosa succede quando una delle osservazioni raccolte dall'agente contiene un comando travestito da dato?
**Audience tag:** [GENERAL]
**Word count target:** 1000 parole
**Funzione narrativa:** Hook → Complicate → Resolve parziale. Mettere l'assistente davanti a una pagina, email o documento che contiene un'istruzione ostile; mostrare perché la stessa frase diventa più pericolosa quando il sistema possiede strumenti e permessi, poi passare dai timori ai confini tecnici.
**Key facts che il Researcher deve trovare:**

- Una dimostrazione primaria di *indirect prompt injection* contro un'applicazione LLM con tool access: autori, anno, modello/versione, contenuto controllato dall'attaccante, canale d'ingresso, strumenti e permessi disponibili, azione richiesta, numero di prove e successo misurato.
- Ricostruzione del confine di fiducia: istruzioni dello sviluppatore/utente, dati non fidati provenienti dallo strumento, decisione generata dal modello e azione del runtime. Mostrare il punto esatto in cui dati e comandi diventano indistinguibili per il modello scelto.
- Differenza di impatto fra chatbot passivo e agente: un testo manipolato può già produrre una risposta falsa, ma l'accesso a email, file, browser, shell o pagamenti può trasformare l'errore in lettura, scrittura, invio o spesa. Non dire che ogni tool-enabled system sia automaticamente compromesso.
- Controlli da fonti primarie o standard autorevoli: minimo privilegio, strumenti separati per lettura/scrittura, allowlist di destinazioni e argomenti, sandbox, isolamento dei segreti, provenance/taint dell'input, validazione deterministica, conferma umana e log immutabile.
- Misure di sicurezza con trade-off di utilità: attack success rate insieme a task success/utility, falsi positivi e casi non coperti. Una difesa che blocca ogni azione non è una soluzione utile; una conferma che l'utente approva meccanicamente non è controllo sostanziale.
- Un caso documentato di *excessive agency* o permesso sovradimensionato nel quale il danno dipende dall'architettura di autorizzazione, non da una presunta malizia del modello.
- Bilanciamento obbligatorio: distinguere proof of concept, benchmark controllato e incidente reale verificato; non convertire una possibilità tecnica in una frequenza osservata senza dati.

### Beat 6 — «La lunga catena dei piccoli errori»

**Core question:** Perché un sistema competente in ogni singolo passo può fallire proprio quando l'incarico diventa lungo?
**Audience tag:** [EXPERT]
**Word count target:** 1000 parole
**Funzione narrativa:** Establish → Complicate. Rendere visibile una traiettoria fallita per accumulo: un'osservazione letta male, una scelta plausibile, uno stato non aggiornato e un controllo finale assente. Portare poi il lettore davanti ai denominatori dei benchmark, non alle demo migliori.
**Key facts che il Researcher deve trovare:**

- Un benchmark agente principale scelto fra WebArena, GAIA, SWE-bench, τ-bench, OSWorld o alternativa più adatta: paper e versione, data di congelamento, numero e provenienza dei task, ambienti, modelli, budget, metriche, baseline e risultato esatto.
- Una traiettoria fallita completa dello stesso benchmark: numero di passi, primo errore osservabile, recovery tentata o mancata, stato finale e criterio con cui il valutatore assegna il fallimento.
- Tasso di successo end-to-end separato da accuratezza di tool selection, validità sintattica della chiamata e successo dei sottopassi; cercare ablation che identifichino dove si perde prestazione.
- Se viene usata l'intuizione `p^n`, dichiarare l'ipotesi forte di passi indipendenti e probabilità costante; preferire dati empirici per lunghezza/difficoltà e ricordare che nella realtà gli errori sono correlati e alcuni sono recuperabili.
- Costo completo per task quando disponibile: chiamate al modello, token, chiamate agli strumenti, wall-clock, retry, costo monetario, interventi umani e variabilità tra run. Parallelismo e cache non devono essere confusi con minore lavoro totale.
- Stabilità: risultati su più seed o run, *pass^k* o altra misura di consistenza, varianza, task non deterministici e dipendenza da siti/API cambiati. Un singolo successo filmato non misura affidabilità.
- Limiti del benchmark: contaminazione, evaluator imperfetto, task sintetici, credenziali privilegiate, ambiente semplificato, esclusione dei casi ambigui, data leakage o vantaggi derivanti da scaffolding non conteggiato.
- Un risultato positivo sostanziale da preservare accanto al fallimento, con stesso dominio e protocollo: lo scopo è mostrare il guadagno reale dell'azione iterata e il motivo per cui non equivale ad affidabilità generale.

### Beat 7 — «Consegnare le chiavi senza cedere il controllo»

**Core question:** Quale disciplina permette di beneficiare di un agente senza confondere delega, autonomia e abdicazione?
**Audience tag:** [ALL]
**Word count target:** 1050 parole
**Funzione narrativa:** Resolve → Land → Pivot. Tornare all'azione dell'apertura e ridisegnarla con permessi graduati, evidenze, budget e punti di conferma; chiudere la Cassetta degli Attrezzi mostrando chi possiede le chiavi e aprire il passaggio al Capitolo 8.
**Key facts che il Researcher deve trovare:**

- Un caso o protocollo documentato in cui lo stesso task viene eseguito con permessi diversi — sola lettura, scrittura reversibile, azione esterna irreversibile — e in cui l'approvazione umana è collocata prima dell'effetto, non dopo.
- Evidenza sui limiti dell'human-in-the-loop: automation bias, confirmation fatigue, approvazioni senza contesto o impossibilità di verificare centinaia di azioni; cercare studio con popolazione, task, denominatore ed effetto, non soltanto raccomandazioni.
- Fonti autorevoli per minimo privilegio, sandbox, log/audit, reversibilità, separazione dei ruoli, limiti di spesa e stop automatici; distinguere requisiti normativi, standard volontari e buone pratiche ingegneristiche.
- Una matrice operativa da incorporare nella scena, non da rendere elenco nella prosa: **posta in gioco**, **ampiezza dei permessi**, **reversibilità**, **verificabilità**, **durata/budget**, **punto di approvazione**, **piano di recupero**.
- Tre classi da documentare con un esempio ciascuna: task di sola lettura e facilmente verificabile; task di scrittura reversibile in sandbox; task esterno o ad alta posta che richiede conferma e controllo indipendente. Evitare esempi medici, legali o finanziari non sostenuti da fonti specifiche.
- Azione finale del lettore: chiedere non “quanto è intelligente l'agente?”, ma “che cosa può toccare, quale prova lascia, chi può fermarlo e come si annulla l'ultima azione?”. Presentarla attraverso la revisione della scena iniziale, non come decalogo.
- Chiusura esplicita dell'analogia: il modello suggerisce quale utensile usare; l'infrastruttura apre il cassetto; i permessi stabiliscono la forza dell'utensile; l'ambiente restituisce la ricevuta; una regola o una persona decide quando il lavoro è finito.
- Ponte al Capitolo 8: collegare l'osservazione non affidabile o il riassunto troppo sicuro all'effetto che produce a valle. Non svolgere ancora il catalogo dei bias; fissare soltanto il nuovo stakes: un agente non perde i limiti statistici del modello quando riceve strumenti, ma può trasformarli in una sequenza di azioni.

## REVIEWER READINESS NOTES

### Tension points

1. **Il primo effetto esterno cambia la posta.** Finché il modello produce testo, l'errore chiede a un umano di credergli; quando un runtime interpreta quel testo come azione, lo stesso errore può modificare un file, inviare un messaggio o consumare denaro prima di essere letto.
2. **L'azione sembra intenzione.** Una sequenza coerente di tool call, correzioni e riprese invita a vedere volontà e perseveranza; il capitolo deve conservare la meraviglia dell'adattamento mostrando, nello stesso gesto, task state, policy, feedback e stop condition.
3. **Più strumenti significano capacità e superficie di guasto.** La ricerca web può correggere una data assente dai pesi; la stessa pagina può introdurre un'istruzione ostile. Ogni utensile è insieme una verifica possibile e un nuovo confine di fiducia.
4. **Il successo locale non garantisce il compito lungo.** Un agente può scegliere correttamente nove azioni e fallire alla decima; la demo memorabile nasconde il denominatore, i retry e i run in cui il ciclo non si ferma.
5. **Il controllo umano può essere reale o decorativo.** Un pulsante “Approva” posto davanti a un'azione incomprensibile sposta formalmente la responsabilità senza restituire controllo; la posta è collocare l'umano dove dispone di evidenze e tempo per decidere.

### Key chains da rendere esplicite

- Obiettivo espresso in linguaggio → modello genera una proposta d'azione strutturata → runtime valida e autorizza → strumento modifica o interroga l'ambiente → output torna come osservazione → lo stato condiziona il passo successivo → regola di arresto chiude il ciclo.
- Descrizione dello strumento + schema → distribuzione dei token favorisce nome e argomenti → parsing riuscito non implica correttezza semantica → controllo pre-esecuzione determina se la richiesta diventa effetto.
- Piano testuale del Capitolo 6 → nessun dato nuovo finché resta nel contesto → tool call → osservazione esterna → replanning → capacità nuova del sistema senza nuova interiorità del modello.
- Persistenza del task → log/memoria salvati fuori dai pesi → retrieval al passo successivo → continuità operativa → rischio di recuperare stato obsoleto, privato o manipolato.
- Contenuto non fidato nello strumento → istruzione ostile entra come osservazione → modello la confonde con il task → propone un'azione autorizzata → ampiezza dei permessi determina l'impatto → isolamento e approvazione spezzano la catena in punti diversi.
- Molti sottopassi → più opportunità di errore e costo → feedback può correggere alcuni errori ma propagarne altri → successo end-to-end cala o diventa variabile → benchmark deve misurare traiettorie complete e run ripetuti.
- Claim “agente autonomo” → domande su strumenti, permessi, durata, reversibilità, verificatore e stop → autonomia scomposta in proprietà osservabili → decisione di delega proporzionata.
- Posta in gioco alta + azione irreversibile → minimo privilegio + evidenza leggibile + conferma prima dell'effetto + log e rollback → controllo umano sostanziale, non rituale.
- Limite statistico del modello → scelta o sintesi plausibile ma errata → ciclo agente amplifica l'errore in più azioni → necessità del Capitolo 8 di capire quali distorsioni sopravvivono agli strumenti.

### Risk proportionality guards

- **“Autonomo”:** usarlo come descrizione graduata di permessi, persistenza e supervisione, non come sinonimo di indipendenza psicologica. Un loop senza intervento per dieci passi non prova volontà, coscienza o obiettivi propri.
- **Agente vs modello:** attribuire risultati e fallimenti al sistema completo quando includono prompt, orchestratore, memoria, strumenti, retry e verificatori. Non accreditare al checkpoint nudo una capacità ottenuta dallo scaffolding.
- **Tool use:** uno strumento può ridurre l'errore su dati aggiornati o calcoli verificabili, ma aggiunge disponibilità, autenticazione, parsing e sicurezza come failure mode. Bilanciare ogni rischio con il beneficio misurato nello stesso contesto quando possibile.
- **Prompt injection:** separare possibilità, attack success in laboratorio e prevalenza nel mondo reale. Non descrivere una proof of concept come epidemia; non descrivere una difesa parziale come soluzione definitiva.
- **Permessi:** il danno dipende dall'incrocio fra errore e capacità concessa. Una lettura sbagliata in sandbox e un bonifico sono classi di rischio diverse; esempi ad alta posta richiedono fonti e controlli specifici.
- **Human-in-the-loop:** la presenza nominale di una persona non garantisce supervisione. Specificare informazione disponibile, tempo, posizione della conferma e possibilità concreta di rifiutare o annullare.
- **Memoria:** persistenza e retrieval migliorano continuità, ma non equivalgono a identità o memoria umana. Affiancare a ogni guadagno retention, privacy, obsolescenza e recupero errato.
- **Benchmark:** congelare nome, versione, data, modello, scaffolding e budget. Web, software e prodotti cambiano; evitare leaderboard correnti senza timestamp e non confrontare percentuali ottenute con evaluator o task set diversi.
- **Catene lunghe:** non usare `p^n` come dato empirico se i passi non sono indipendenti. Dichiararla come intuizione condizionata e privilegiare curve osservate per lunghezza del task, retry e consistenza fra run.
- **Costi:** più autonomia può ridurre lavoro umano diretto ma aumentare token, chiamate API, latenza, monitoraggio e recovery. Quantificare solo costi misurati nella configurazione narrata e distinguere costo marginale, wall-clock e lavoro totale.
- **Demo di successo:** una traiettoria scelta a posteriori serve a mostrare il meccanismo, non l'affidabilità. Ogni scena positiva deve essere ancorata al risultato aggregato e al denominatore del benchmark.
- **Consiglio al lettore:** la verifica e il livello di autorizzazione devono crescere con irreversibilità e impatto. Nessun agente generalista va presentato come sostituto di responsabilità medica, legale, finanziaria o di sicurezza.

## RESEARCHER BRIEF

### Web search terms — query esatte

1. `"ReAct: Synergizing Reasoning and Acting in Language Models" ICLR 2023 appendix trajectory`
2. `site:arxiv.org/abs/2210.03629 ReAct ALFWorld WebShop HotpotQA exact results`
3. `ReAct public trajectory Action Observation task id transcript repository`
4. `LLM agent operational definition goal state action observation environment primary source`
5. `same language model chatbot versus agent tool use controlled comparison`
6. `function calling model generates arguments runtime executes tool official documentation`
7. `tool calling JSON schema validation error handling credentials runtime architecture`
8. `"Toolformer: Language Models Can Teach Themselves to Use Tools" API exact results ablation`
9. `site:arxiv.org/abs/2302.04761 Toolformer calculator search translation API`
10. `LLM tool selection malformed arguments authorization timeout benchmark primary paper`
11. `plan-and-execute versus interleaved reasoning acting agent ablation primary study`
12. `LLM agent stop condition infinite loop max steps failure trajectory paper`
13. `agent external observation replanning deterministic feedback tool execution study`
14. `"Voyager: An Open-Ended Embodied Agent with Large Language Models" skill library ablation`
15. `site:arxiv.org/abs/2304.03442 "Generative Agents" memory retrieval reflection planning ablation`
16. `LLM agent memory stale retrieval contamination privacy benchmark primary study`
17. `"Not what you've signed up for" indirect prompt injection LLM-integrated applications`
18. `site:arxiv.org indirect prompt injection tool-using agents data exfiltration exact experiment`
19. `AgentDojo prompt injection benchmark attack success rate utility defense`
20. `LLM agent excessive agency least privilege sandbox human approval primary source`
21. `OWASP agentic applications excessive agency prompt injection least privilege`
22. `NIST AI RMF Generative AI Profile human oversight audit logging least privilege`
23. `"WebArena: A Realistic Web Environment for Building Autonomous Agents" exact tasks results`
24. `"GAIA: a benchmark for General AI Assistants" number of questions exact results`
25. `"SWE-bench: Can Language Models Resolve Real-World GitHub Issues?" dataset exact results`
26. `"tau-bench" tool agent user interaction pass^k consistency exact results`
27. `"OSWorld" multimodal agents real computer tasks exact success rate`
28. `"AI Agents That Matter" evaluation cost reproducibility baseline agent paper`
29. `LLM agent task length success rate compounding errors empirical study`
30. `LLM agent benchmark full failed trajectory first error recovery number of steps`
31. `agent benchmark cost per task tokens tool calls wall clock repeated runs`
32. `human in the loop AI agent confirmation fatigue automation bias experiment`
33. `human approval before irreversible tool action agent study rollback audit log`
34. `read only versus write permissions LLM agent controlled experiment`
35. `LLM agent benchmark contamination evaluator reliability scaffolding ablation`
36. `2025 2026 language model agents long horizon task reliability primary paper`

### Document types da prioritizzare

- Paper primari e appendici su ReAct, tool use, pianificazione interleaved, memoria e agent loop; recuperare versione del preprint, sede, data e differenze fra revisioni.
- Repository ufficiali, transcript grezzi, task ID, issue GitHub, patch, screenshot con provenance, log degli strumenti e file di configurazione che rendano verificabile la traiettoria d'apertura e quella fallita.
- Specifiche ufficiali di function/tool calling e SDK soltanto per descrivere il protocollo effettivo; congelare provider, versione e data, e affiancare il documento a un esempio eseguibile o test indipendente.
- Paper e dataset card dei benchmark agenti; includere evaluator, split, esclusioni, budget, policy di retry, ambiente containerizzato o siti ricreati e versione esatta del modello/scaffolding.
- Ablation e repliche che separino contributo del modello base, prompt, memoria, strumenti, pianificatore, verificatore e retry; evitare confronti in cui cambia tutto insieme.
- Studi primari di sicurezza su prompt injection indiretta, tool misuse ed excessive agency con threat model, numero di casi, attack success e utility sotto difesa; standard NIST/OWASP servono per i controlli, non per stimare la prevalenza.
- Studi human-factors peer-reviewed su automation bias, fatigue e qualità dell'approvazione; privilegiare task comparabili all'azione agente rispetto a sondaggi di opinione.
- System card, model card e report del produttore per le caratteristiche dichiarate del proprio sistema; triangolare risultati prestazionali e di sicurezza con audit, repliche o benchmark indipendenti.
- Report d'incidente con timeline, artefatti e root cause quando esistono; distinguere incidente verificato da demo, red-team scenario e vulnerabilità teorica.
- Survey e tassonomie soltanto come mappa per risalire alle fonti primarie. Per ogni claim centrale applicare la triangolazione su almeno due fonti indipendenti; conflitti in `[CONFLICT]`, dettagli non pubblici in `[BLOCKED: needs human input]`.

### Fatti, date, nomi e numeri da cacciare

- Per la scena iniziale: timestamp/data, sistema e commit, modello/checkpoint, task ID o issue, ambiente, strumenti, chiamata grezza, output, numero di passi, budget, esito, valutatore e link all'artefatto finale; trovare almeno un dettaglio sensoriale digitale verificabile.
- Definizioni concorrenti di agente: formulazione, autore/istituzione e data; identificare quali richiedono obiettivo, ambiente, percezione, azione, memoria, pianificazione o autonomia e motivare il minimo comune adottato dal capitolo.
- ReAct: Shunyu Yao e coautori, data del preprint e ICLR, modelli, HotpotQA/FEVER contro ALFWorld/WebShop, numero di task, baseline, percentuali e formato esatto delle traiettorie; verificare eventuali differenze fra paper e repository.
- Toolformer: Timo Schick e coautori, cronologia, modello/i, cinque famiglie di strumenti o conteggio corretto, metodo self-supervised, soglie di filtraggio, dataset, baseline, guadagni e casi in cui lo strumento non aiuta. Se si sceglie un'altra fonte, raccogliere gli stessi campi.
- Protocollo di tool calling scelto: schema, modalità di selezione, validazione JSON/tipi, gestione di tool call multiple, messaggi di errore, timeout, retry, isolamento delle credenziali e responsabilità esatta dell'host.
- Per il replanning: una traiettoria con azione fallita, testo dell'osservazione, cambiamento del passo seguente, numero di retry e stop; verificare se la correzione proviene dal modello, da codice deterministico o da un pianificatore separato.
- Memoria: sistema scelto, autori, anno, storage, algoritmo di retrieval, criterio di salvataggio, limite del contesto, ablation, metrica e dimensione dell'effetto; cercare anche errore da dato vecchio/irrilevante e politica di cancellazione.
- Prompt injection indiretta: Greshake e coautori o studio successivo più solido, data, modelli, applicazioni, payload, canale, strumenti, permessi, numero di casi, successo e condizioni di difesa; distinguere chiaramente demo e attacco nel mondo reale.
- AgentDojo o benchmark di sicurezza scelto: versione, numero di task utility e casi d'attacco, domini, modelli, attack success rate, utility senza/sotto attacco, difese, falsi positivi e gap residuo.
- WebArena: verificare il numero spesso citato di **812** task invece di assumerlo, i siti, evaluator, modelli, prompting/scaffolding, successo e data dell'ambiente. Se non è il benchmark principale, tenerlo in dossier come controllo.
- GAIA: verificare livelli, numero di domande, split, strumenti permessi, scoring, risultati human/model e versione; non confrontare score fra leaderboard di date diverse.
- SWE-bench: verificare il numero originale spesso citato di **2.294** issue invece di assumerlo, provenienza dei repository, harness, test fail-to-pass/pass-to-pass, leakage, costo e differenza fra dataset originale, Lite e Verified.
- τ-bench: grafia/versione, autori, anno, domini, numero di task, interazione con utente e tool, policy constraints, pass^k/consistenza, numero di run e principali failure mode.
- OSWorld o benchmark computer-use scelto: numero di task, OS/app/versione, percezione screenshot/accessibility tree, azioni, reset, successo umano/modello, evaluator e sensibilità al cambiamento dell'interfaccia.
- Per il benchmark principale: risultato positivo migliore e baseline pertinente, ma anche task falliti, retry, deviazione fra run, chiamate, token, tempo, costo e percentuale di errori attribuiti a pianificazione, tool selection, grounding, stato o stop.
- Per la catena lunga: dati empirici per bucket di numero di passi o durata; se non esistono, non fabbricare una curva. Qualsiasi calcolo `p^n` deve mostrare valori ipotetici, assunzioni e motivo per cui non è una stima del sistema reale.
- Human-in-the-loop: studio, autori, data, N dei partecipanti, task, qualità delle informazioni mostrate, tasso di approvazione, errori intercettati, tempo e segni di automation bias/fatigue; distinguere supervisione sincrona, revisione a campione e audit ex post.
- Controlli operativi: fonte e definizione di read-only, least privilege, allowlist, sandbox, spending cap, immutable log, rollback e two-person rule; per ciascuno indicare quale anello della catena spezza e quale rischio lascia aperto.
- Ogni numero deve conservare versione, data, denominatore e metrica. I risultati instabili o dipendenti da siti/API devono riportare la data di esecuzione; claim non triangolabili vanno marcati `[CONFLICT]` o `[BLOCKED]`, mai colmati per analogia.

## TARGET

**Word count:** 6800 parole; sette beat entro il vincolo di 800–1200 parole e in continuità con il target di 6800–7000 parole stabilito per il Capitolo 6.

**Opening hook strategy:** Aprire sul primo effetto verificabile di una tool call in una traiettoria pubblica — comando, clic, file modificato o errore restituito — e rivelare soltanto dopo che ad agire è un sistema di modello, runtime, permessi e ambiente.

**Closing beat promise:** Chiudere con il lettore capace di consegnare strumenti senza consegnare il controllo, e con la tensione del Capitolo 8 già accesa: quando un errore statistico entra in un ciclo d'azione, non resta più soltanto una frase sbagliata.
