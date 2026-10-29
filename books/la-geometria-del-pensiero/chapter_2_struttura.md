# Capitolo 2 — Struttura: "La Mappa Invisibile del Linguaggio"

**Core question (PRD.md § 4):** Come le parole sono diventate coordinate in uno spazio geometrico attraverso Word2Vec?
**Audience tag capitolo (PRD.md § 4):** [ALL]

## PRE-FLIGHT CHECKS

- **Repertorio metaforico (PRD.md § 6):** analogia canonica obbligatoria: **La Galassia di Parole / la Biblioteca invisibile**. Corrispondenze da mantenere per l'intero capitolo: stella/libro → parola o token; coordinate → componenti apprese del vettore; vicinanza → somiglianza dei contesti d'uso; direzione → relazione distribuzionale ricorrente; forma complessiva della galassia/biblioteca → regolarità e distorsioni del corpus. Guardia: non ridurre uno spazio di centinaia di dimensioni a un cielo letteralmente tridimensionale e non chiamare “significato” ciò che misura soltanto la distribuzione degli usi.
- **Continuity check:** `chapter_index.md` non esiste. Dal finale di `chapter_1.md` restano vincolanti due posizioni: fluidità linguistica ≠ comprensione e manipolazione efficace di simboli ≠ accesso umano al significato. Il Capitolo 2 deve rispondere alla domanda “che cosa accade meccanicamente?” mostrando rappresentazioni numeriche e regolarità distribuzionali, senza riaprire o dichiarare risolto il dibattito sulla coscienza.
- **Glossary check:** `NARRATIVE_GLOSSARY.md` non esiste. Candidati che il Writer Stage 2 dovrà valutare: *embedding*, *vettore*, *dimensione*, *Word2Vec*, *CBOW*, *skip-gram*, *ipotesi distribuzionale*, *similarità del coseno*, *spazio vettoriale*.
- **Guardia di continuità estetica:** il Capitolo 1 termina in una stanza e con una domanda esplicita. Il Capitolo 2 non deve riaprire con un'altra stanza, né ripetere la formula “non capisce, calcola”; apre invece su un artefatto verificabile — una sottrazione tra parole stampata in un paper o in un output reale — e trasforma l'enigma in una mappa.

## NUFs (Goal Scoring)

Dieci utility, un punto ciascuna. Obiettivo di progetto: almeno 8,5/10, senza azzerare nessuna delle tre categorie `reader`, `emotional`, `factual`.

```text
utility(reader): Il lettore può spiegare che cos'è un embedding senza formule, usando correttamente la Galassia di Parole: ogni parola è una posizione numerica appresa dai contesti, non una definizione scritta da un umano → score += 1

utility(reader): Il lettore può distinguere una rappresentazione one-hot, in cui le parole restano isolate ed equidistanti, da un vettore denso, in cui vicinanze e direzioni conservano regolarità d'uso → score += 1

utility(reader): Il lettore può ricostruire la catena corpus → finestre di contesto → compito di previsione → correzioni numeriche → coordinate apprese, senza attribuire intenzione o comprensione alla macchina → score += 1

utility(reader): Il lettore può spiegare, senza calcolare una formula, che la similarità del coseno confronta l'orientamento dei vettori e che l'analogia “re − uomo + donna ≈ regina” cerca il vicino più prossimo a una direzione risultante, non risolve un'equazione esatta → score += 1

utility(reader): Il lettore può valutare criticamente una frase come “il modello sa che re e regina sono collegati” chiedendo almeno: da quale corpus proviene la mappa, quale obiettivo l'ha modellata e se la rappresentazione è statica o dipendente dal contesto → score += 1

utility(emotional): Il lettore prova meraviglia precisa davanti all'emergere di una geometria linguistica non programmata a mano, ma chiude con padronanza critica — non con la sensazione che i numeri abbiano acquisito coscienza o verità → score += 1

utility(factual): Word2Vec viene collocato nel 2013 con autori, paper e rilascio verificati, distinguendo il suo contributo di efficienza e scala dai precedenti della semantica distribuzionale e dei modelli neurali del linguaggio → score += 1

utility(factual): L'ipotesi distribuzionale viene presentata con attribuzioni e fonti storiche controllate — Harris (1954) e/o Firth (1957) — senza trasformare la formula “conoscere una parola dalla compagnia che frequenta” in una legge priva di limiti → score += 1

utility(factual): CBOW e skip-gram vengono descritti correttamente e citati alle fonti primarie: il primo predice una parola dal contesto, il secondo predice parole di contesto dalla parola centrale; negative sampling e hierarchical softmax sono nominati solo con funzione e provenienza verificate → score += 1

utility(factual): L'esempio “re − uomo + donna ≈ regina” è ricondotto alla sua fonte e configurazione verificabili, presentato come risultato di nearest-neighbor dipendente da modello, corpus e metrica, e bilanciato da almeno uno studio documentato sui limiti o sulle distorsioni delle analogie vettoriali → score += 1
```

## BEAT LIST

### Beat 1 — “La sottrazione impossibile”

**Core question:** Che genere di oggetto permette di sottrarre “uomo” da “re”, aggiungere “donna” e arrivare vicino a “regina”?
**Audience tag:** [ALL]
**Word count target:** 850–1000 parole
**Funzione narrativa:** Hook → Complicate. Aprire sull'artefatto originale che mostra l'analogia — riga di paper, tabella o output reale — con data, supporto fisico e valori verificati; nessuna scena d'ufficio ricostruita senza fonte.
**Key facts che il Researcher deve trovare:**

- Prima fonte primaria in cui compare l'esempio esatto `king - man + woman ≈ queen`, ordine dei termini incluso; verificare se il risultato è “queen” come nearest neighbor e non come uguaglianza numerica.
- Tomas Mikolov e coautori: nomi completi, affiliazione Google nel 2013, titolo, data e sede dei paper pertinenti; cronologia fra paper, codice e demo pubblica.
- Quale modello, corpus, dimensionalità e metrica produssero l'esempio iconico; se la fonte non li specifica, marcare il vuoto invece di fonderlo con i parametri del modello Google News scaricabile.
- Un dettaglio sensoriale verificabile dell'artefatto: numero di pagina/tabella, aspetto dell'output, comando o riga stampata; non inventare gesti, stanze o reazioni dei ricercatori.
- Contrappeso dal Capitolo 1: la regolarità è sorprendente proprio perché emerge senza una definizione di “re”, “donna” o “regina” fornita al sistema.

### Beat 2 — “Il dizionario senza strade”

**Core question:** Perché assegnare un numero distinto a ogni parola non basta a rappresentare ciò che le parole hanno in comune?
**Audience tag:** [ALL]
**Word count target:** 800–950 parole
**Funzione narrativa:** Establish → Complicate. Mostrare due righe reali di una matrice one-hot come oggetti visivi: identità perfettamente conservata, relazione completamente assente.
**Key facts che il Researcher deve trovare:**

- Definizione rigorosa ma accessibile di one-hot encoding: vocabolario di ampiezza `V`, un solo 1 e `V−1` zeri; ortogonalità e uguale distanza fra qualunque coppia distinta.
- Differenza tra identificare una parola e rappresentarne relazioni d'uso; chiarire che l'ordine arbitrario degli indici non deve introdurre una falsa prossimità.
- Predecessori essenziali da citare per evitare il mito “Word2Vec ha inventato gli embedding”: semantica distribuzionale, Latent Semantic Analysis e modelli neurali del linguaggio; data, autori e contributo preciso di ciascun precedente effettivamente usato.
- Contributo specifico di Word2Vec: architetture leggere e strategie di addestramento che resero l'apprendimento di vettori su grandi corpora più efficiente; evitare il claim assoluto “per la prima volta le parole divennero numeri”.
- Un esempio chirurgico, non una lista, in cui one-hot fallisce: due parole legate quanto due parole estranee finché non si osservano i loro contesti.

### Beat 3 — “La compagnia che una parola frequenta”

**Core question:** Come può un corpus insegnare relazioni linguistiche senza contenere un dizionario di definizioni?
**Audience tag:** [ALL]
**Word count target:** 850–1000 parole
**Funzione narrativa:** Establish → Resolve parziale. Aprire su una concordanza o su una pagina storica verificabile; la Biblioteca invisibile prende forma attraverso scaffali di contesti ricorrenti, non attraverso definizioni.
**Key facts che il Researcher deve trovare:**

- Formulazioni originali e contesto bibliografico della distribuzione linguistica in Zellig Harris (1954) e della frase attribuita a J. R. Firth (1957); pagina e testo esatto prima di usare una citazione diretta.
- Definizione operativa di finestra di contesto: quali parole vicine vengono trattate come segnale e quali scelte — ampiezza della finestra, frequenza, ordine — cambiano il risultato.
- Perché parole usate in contesti simili possono ottenere vettori vicini; specificare che vicinanza distribuzionale non equivale sempre a sinonimia e può avvicinare contrari o termini dello stesso dominio.
- Un mini-caso sourced con poche occorrenze visibili che permetta al lettore di inferire la somiglianza dei contesti prima che venga spiegata.
- Ruolo del corpus: lingua, genere testuale, periodo storico e frequenze determinano quali “compagnie” sono osservabili e quali restano assenti.

### Beat 4 — “Come si disegna una galassia senza cartografo”

**Core question:** Quale compito meccanico sposta le parole fino a trasformare una nuvola di numeri in una mappa?
**Audience tag:** [GENERAL]
**Word count target:** 1050–1200 parole
**Funzione narrativa:** Complicate → Resolve. È il centro meccanico e metaforico del capitolo: completare la Galassia di Parole senza anticipare la matematica di gradiente e backpropagation riservata al Capitolo 3.
**Key facts che il Researcher deve trovare:**

- Definizione primaria e simmetria esatta dei due obiettivi: CBOW predice la parola centrale dal contesto; skip-gram predice il contesto dalla parola centrale.
- Che cosa viene inizializzato, confrontato e aggiornato durante l'addestramento; distinguere vettori di input e output e verificare quale matrice viene normalmente conservata come embedding.
- Funzione di hierarchical softmax, negative sampling e subsampling delle parole frequenti; introdurre solo ciò che serve a spiegare efficienza e scala, senza duplicare la spiegazione del Capitolo 3.
- Parametri reali degli esperimenti scelti: dimensione dei vettori, ampiezza massima della finestra, corpus, numero di parole/token, vocabolario e hardware/tempo di addestramento, ciascuno legato alla fonte corretta.
- Contratto della metafora: ogni “attrazione” nella galassia deve essere tradotta subito in co-occorrenze, previsione e modifica di pesi; nessuna forza fisica letterale, nessun cartografo cosciente.
- Punto di arresto verso il Capitolo 3: dire che l'errore modifica le coordinate, ma rinviare la spiegazione di come venga calcolata la direzione della modifica.

### Beat 5 — “Distanze che non sono chilometri”

**Core question:** Che cosa significa essere “vicini” in uno spazio di centinaia di dimensioni che nessuno può vedere direttamente?
**Audience tag:** [GENERAL]
**Word count target:** 900–1050 parole
**Funzione narrativa:** Establish → Resolve. Passare dalla metafora alla meccanica reale e chiudere ogni corrispondenza aperta dalla Galassia di Parole.
**Key facts che il Researcher deve trovare:**

- Che cosa rappresentano componenti e dimensionalità di un vettore; verificare che i singoli assi di Word2Vec non portino normalmente etichette semantiche leggibili dall'uomo.
- Similarità del coseno: che cosa misura, intervallo applicabile nel caso usato e perché l'orientamento può essere più informativo della sola lunghezza; fornire la formula al dossier, non imporla alla prosa.
- Nearest-neighbor search e differenza fra vicinanza geometrica, somiglianza distribuzionale, sinonimia e verità fattuale.
- Valori documentati per modelli concreti, distinguendo gli esperimenti nei paper dal pacchetto pre-addestrato Google News: dimensioni, parole/frasi nel vocabolario e dimensione del corpus non vanno mescolati.
- Limiti delle visualizzazioni 2D/3D ottenute con PCA, t-SNE o metodi affini: la proiezione può alterare distanze e quartieri; cercare una fonte metodologica autorevole se una visualizzazione viene usata.
- Un solo quartiere lessicale tratto da output riproducibile, con modello/versione indicati, che mostri insieme il potere e l'ambiguità della prossimità.

### Beat 6 — “La freccia tra re e regina”

**Core question:** Perché una stessa direzione geometrica sembra ripetersi fra coppie di parole, e quanto possiamo fidarci di quell'effetto?
**Audience tag:** [ALL]
**Word count target:** 900–1050 parole
**Funzione narrativa:** Payoff → Complicate. Consegnare la meraviglia promessa dal cold open, poi sostituire l'uguaglianza magica con il suo meccanismo di offset e ricerca del vicino.
**Key facts che il Researcher deve trovare:**

- Procedura esatta dell'analogia vettoriale, inclusa l'esclusione o meno dei termini di query dai candidati e la metrica usata; origine e definizione di 3CosAdd se pertinente.
- Esempi semantici e sintattici presenti nei paper Word2Vec originali; sceglierne uno solo oltre a re/regina per mostrare una relazione ripetuta senza creare un catalogo.
- Numero esatto di domande nel dataset di analogie, suddivisione semantica/sintattica, risultati e baseline del paper scelto; non usare percentuali staccate da corpus e configurazione.
- Studi di replica o critica che mostrino sensibilità a frequenza, preprocessing, formulazione del test, random seed o corpus; distinguere instabilità empirica da invalidità totale del metodo.
- Formulazione meccanicistica obbligatoria: nessuna regola “royalty” o “genere” è scritta nel modello; la freccia riassume regolarità statistiche distribuite nella configurazione dei vettori.
- Guardia concettuale: l'esempio storico uomo/donna non è una teoria del genere e non prova che ogni relazione linguistica formi una direzione pulita.

### Beat 7 — “La mappa porta le impronte del territorio”

**Core question:** Che cosa rivela una mappa costruita dai testi umani — e che cosa eredita, confonde o rende invisibile?
**Audience tag:** [ALL]
**Word count target:** 950–1100 parole
**Funzione narrativa:** Complicate → Land → Pivot. Trasformare lo stupore in uno strumento di lettura critica e aprire il Capitolo 3 con un debito causale preciso.
**Key facts che il Researcher deve trovare:**

- Un caso empirico primario di associazione stereotipata negli embedding — preferibilmente Bolukbasi et al. (2016) o Caliskan, Bryson e Narayanan (2017) — con esempio, dataset, metrica e limite dichiarato dagli autori.
- Contesto proporzionato: un'associazione appresa documenta regolarità del corpus e delle scelte di modellazione; non equivale a intenzione, convinzione cosciente o destino inevitabile dell'output.
- Evidenza e limiti dei metodi di debiasing: che cosa possono attenuare, che cosa può restare nascosto e quali trade-off sono documentati; evitare sia “il bias si cancella” sia “non si può fare nulla”.
- Limite della polisemia nei vettori statici: verificare come una sola rappresentazione per forma lessicale fonde usi diversi; un esempio sourced basta.
- Differenza storica e tecnica fra Word2Vec e le rappresentazioni contestuali dei modelli successivi: Word2Vec è una lente fondativa, non una descrizione completa dell'interno di ogni LLM moderno.
- Azione finale del lettore: davanti a una prossimità o analogia, chiedere corpus, obiettivo e tipo di rappresentazione prima di tradurla in “conoscenza”.
- Ponte al Capitolo 3: nessuno ha collocato a mano le parole; resta da aprire il meccanismo che, a ogni previsione sbagliata, determina in quale direzione e di quanto spostare i numeri.

## REVIEWER READINESS NOTES

### Tension points

1. **Una sottrazione semanticamente assurda produce un risultato linguisticamente plausibile.** La posta in gioco è il confine tracciato nel Capitolo 1: se non c'è comprensione, il lettore deve vedere quale meccanismo alternativo può generare struttura senza magia.
2. **La mappa si organizza senza un cartografo che assegni definizioni.** Ogni successo della previsione aumenta la tentazione antropomorfica; ogni beat deve convertire subito “impara/riconosce” in corpus, obiettivo, confronto numerico e aggiornamento di pesi.
3. **Lo stesso meccanismo che rende visibili regolarità utili rende visibili anche stereotipi e confusioni del corpus.** Il payoff re/regina non è il trionfo finale: diventa il punto da cui chiedere chi ha prodotto il territorio e con quali assenze.

### Key chains da rendere esplicite

- Fine Capitolo 1 (“se non è comprensione, che cosa accade dentro?”) → parole convertite in vettori → contesti trasformati in segnali di previsione → geometria come risposta meccanica, non mentale.
- One-hot conserva identità ma non relazione → il compito predittivo premia parole utili negli stessi contesti → i pesi convergono verso quartieri e direzioni → il lettore può leggere una regolarità senza scambiarla per una definizione.
- Corpus selezionato → distribuzione dei contesti → forma dello spazio → nearest neighbor/analogia → conseguenza pratica: ogni claim di “conoscenza” va ricondotto a corpus, obiettivo e metrica.
- Previsione sbagliata → errore numerico → coordinate da spostare → domanda ancora aperta: chi stabilisce direzione e ampiezza dello spostamento? → promessa causale del Capitolo 3.

### Risk proportionality guards

- **Priorità storica:** Word2Vec non ha inventato né i vettori né la semantica distribuzionale; specificare il salto di efficienza, scala e qualità delle regolarità osservate, con precedenti essenziali e senza falsa genealogia lineare.
- **Portata tecnica:** Word2Vec non è un generatore conversazionale e non coincide con le rappresentazioni contestuali interne agli LLM contemporanei; presentarlo come passaggio fondativo e lente didattica, non come fotografia completa di ChatGPT.
- **Algebra:** il simbolo `≈` significa “il vettore risultante ha come vicino una parola attesa” in una configurazione concreta; non uguaglianza esatta, fatto universale o dimostrazione di ragionamento astratto.
- **Metafora:** stelle, attrazioni e galassie devono ricevere un contrappeso meccanicistico nello stesso paragrafo o nel successivo; lo spazio reale è ad alta dimensionalità e non possiede assi umanamente nominati per default.
- **Bias:** un'associazione stereotipata è evidenza di pattern appresi dal corpus e dalla pipeline, non di volontà della macchina; bilanciare il rischio con usi legittimi, dipendenza dalla configurazione e risultati/limiti delle mitigazioni.
- **Esempio di genere:** contestualizzare re/uomo/donna/regina come dimostrazione storica circoscritta; non naturalizzare un binarismo, non generalizzare l'offset a identità o ruoli sociali complessi.
- **Scene e numeri:** se non esiste una fonte per luogo, gesto o reazione personale nel 2013, aprire sull'artefatto documentato. Ogni numero deve restare legato al modello e al paper che lo hanno prodotto.
- **Contro-obiezione:** affrontare esplicitamente “se il sistema non comprende, perché la geometria funziona?” La risposta deve essere operativa: una regolarità distribuzionale può sostenere previsioni utili senza stabilire esperienza soggettiva o verità sul mondo.

## RESEARCHER BRIEF

### Web search terms — query esatte

1. `site:arxiv.org/abs/1301.3781 "Efficient Estimation of Word Representations in Vector Space"`
2. `Mikolov Chen Corrado Dean 2013 word2vec paper CBOW skip-gram PDF`
3. `Mikolov Yih Zweig 2013 "Linguistic Regularities in Continuous Space Word Representations" PDF`
4. `"king" "man" "woman" "queen" word2vec original paper`
5. `Google word2vec code release 2013 archive demo word analogy`
6. `word2vec original experiments corpus size dimensions window size training time table`
7. `GoogleNews-vectors-negative300 100 billion words 3 million 300 dimensions official`
8. `Mikolov "Distributed Representations of Words and Phrases and their Compositionality" negative sampling subsampling PDF`
9. `CBOW predicts current word context skip-gram predicts surrounding words original definition`
10. `word2vec input output embedding matrix which vectors retained negative sampling`
11. `Zellig Harris 1954 "Distributional Structure" Word exact quote PDF`
12. `J R Firth 1957 "You shall know a word by the company it keeps" page source PDF`
13. `Deerwester Dumais Furnas Landauer Harshman 1990 latent semantic analysis PDF`
14. `Bengio Ducharme Vincent Jauvin 2003 neural probabilistic language model word representation PDF`
15. `word2vec analogy dataset 19544 semantic syntactic questions accuracy table`
16. `3CosAdd word analogy method origin definition nearest neighbor exclude input words`
17. `Linzen 2016 "Issues in evaluating semantic spaces using word analogies" PDF`
18. `Levy Goldberg 2014 linguistic regularities sparse explicit word representations analogy PDF`
19. `Bolukbasi 2016 "Man is to Computer Programmer as Woman is to Homemaker" PDF`
20. `Caliskan Bryson Narayanan 2017 "Semantics derived automatically from language corpora contain human-like biases" Science PDF`
21. `word embedding debiasing residual hidden bias Gonen Goldberg 2019 PDF`
22. `static word embeddings polysemy one vector per word limitation contextual embeddings primary source`
23. `cosine similarity word embeddings angle magnitude nearest neighbors primary source`
24. `PCA t-SNE word embedding visualization distances distortion methodological warning`

### Document types da prioritizzare

- Paper primari e supplementi: atti NeurIPS/NAACL, arXiv con version history, *Transactions of the ACL*, *Science*; registrare versione e data, non citare un mirror quando esiste l'originale.
- Codice, README, archivi e dataset ufficiali Word2Vec/Google per comandi, output, vocabolari e parametri; conservare screenshot o righe testuali utili alle aperture sensoriali.
- Fonti storiche primarie di linguistica distribuzionale e information retrieval per Harris, Firth, LSA e modelli neurali precedenti.
- Studi di valutazione, replica e critica peer-reviewed per analogie, stabilità, polisemia e bias; usare survey solo come mappa verso fonti primarie.
- Interviste o profili autorevoli soltanto se servono a una scena biografica e contengono luogo, data e gesto verificabili; in loro assenza privilegiare l'artefatto tecnico.

### Fatti, date, nomi e numeri da cacciare

- Data di prima submission e pubblicazione dei tre lavori Word2Vec del 2013; nomi e ordine esatti degli autori; data e sede del rilascio del codice.
- Provenienza documentale dell'analogia re/uomo/donna/regina e forma esatta dell'operazione; modello, corpus, metrica e ranking del risultato, se dichiarati.
- Distinzione fra corpus e configurazioni dei paper 2013 e modello pubblico Google News: verificare separatamente i claim “100 miliardi di parole”, “3 milioni di parole e frasi” e “300 dimensioni”.
- Per ciascun esperimento narrato: token nel corpus, ampiezza del vocabolario, dimensione vettoriale, finestra, negative samples, subsampling, hardware e tempo; non combinare numeri provenienti da righe sperimentali diverse.
- Numero esatto e composizione del dataset di analogie; accuracy complessiva, semantica e sintattica; baseline e criteri di esclusione delle domande out-of-vocabulary.
- Pagine e formulazioni originali di Harris (1954) e Firth (1957); verificare paternità e contesto della frase “company it keeps”.
- Data e contributo preciso di almeno due antecedenti, preferibilmente LSA (1990) e Bengio et al. (2003), sufficienti a impedire la claim “Word2Vec inventò gli embedding”.
- Uno o due risultati quantitativi, non solo esempi memorabili, dagli studi critici sulle analogie; annotare condizioni e limiti.
- Per lo studio sul bias scelto: anno, autori, corpus/modello, test, effetto misurato e caveat; per il debiasing, effetto ottenuto e bias residuo documentato.
- Evidenza primaria del limite dei vettori statici sulla polisemia e data del passaggio a rappresentazioni contestuali; restare entro il ponte storico, senza anticipare il Capitolo 4.
- Ogni conflitto tra fonti — soprattutto cronologia del codice, corpus del demo e numeri del Google News model — va in `[CONFLICT]`; ogni dettaglio scenico non verificabile va marcato `[BLOCKED: needs human input]` e rimosso dalla futura prosa.

## TARGET

**Word count:** 6600–7000 parole; il PRD non fissa un numero esplicito, quindi il target è calibrato sulla lunghezza effettiva del Capitolo 1 (~6750 parole) e sulla somma dei sette beat, ciascuno entro 800–1200 parole.

**Opening hook strategy:** Aprire sull'artefatto verificabile di `re − uomo + donna ≈ regina`, trattato come una sottrazione impossibile prima di nominare Word2Vec o definire un embedding.

**Closing beat promise:** Chiudere con la mappa ormai visibile ma con il suo movimento ancora da spiegare: il Capitolo 3 mostrerà come un errore numerico indichi alla rete in quale direzione e di quanto cambiare.
