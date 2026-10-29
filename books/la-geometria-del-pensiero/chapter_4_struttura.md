# Capitolo 4 — Struttura: "Il Faro del Contesto e l'Architettura Transformer"

**Core question (PRD.md § 4):** Come l'auto-attenzione ha eliminato la sequenzialità e liberato il significato dal contesto fisso?
**Audience tag capitolo (PRD.md § 4):** [GENERAL]

## Pre-flight checks (Architect)

- **Repertorio metaforico:** il Capitolo 4 deve costruirsi attorno al **Faro nella Sala da Ballo**. Il contratto dell'analogia è vincolante: i ballerini sono i token; ogni token proietta una richiesta (*query*), offre un segnale di riconoscimento (*key*) e porta informazione trasferibile (*value*); l'intensità del fascio corrisponde al peso di attenzione; più fari corrispondono alle teste multiple. Ogni elemento figurativo deve ricevere il contrappeso meccanicistico nello stesso paragrafo o nel successivo. Non esiste un unico faro centrale né un osservatore cosciente.
- **Continuity check:** `chapter_index.md` non esiste, quindi non è disponibile il registro autorevole dei capitoli approvati; `NARRATIVE_GLOSSARY.md` non esiste. La struttura evita di attribuire ai Capitoli 2 e 3 claim non registrati e usa soltanto i ponti fissati dal PRD: vettori contestuali dopo Word2Vec, calcolo dei pesi dopo gradiente/backpropagation.
- **Guardia terminologica:** usare **auto-attenzione** per il meccanismo in cui gli elementi della stessa sequenza si confrontano fra loro; usare **attenzione** come famiglia più ampia. Non tradurre *query*, *key* e *value* come intenzioni mentali: sono proiezioni numeriche apprese.
- **Assunzione di lunghezza:** il PRD non assegna un conteggio esplicito al capitolo; il target è calibrato sul Capitolo 1 e sulla somma di sette beat entro il vincolo di 800–1200 parole.
- **Narrative ADR:** non necessario. La metafora, il pubblico e il ponte fra capitoli sono già decisioni vincolate dal PRD e non introducono un nuovo trade-off architetturale.

## NUFs (Goal Scoring)

```text
utility(reader): Il lettore può spiegare senza formule perché una rete ricorrente elabora una sequenza passo dopo passo e perché il Transformer può confrontare in parallelo tutti i token di uno stesso strato → score += 1

utility(reader): Il lettore può ricostruire la catena meccanica dell'auto-attenzione — query confrontata con key, punteggi normalizzati, somma pesata dei value — senza attribuire intenzioni alla macchina → score += 1

utility(reader): Il lettore può usare il Faro nella Sala da Ballo per spiegare l'auto-attenzione e poi tradurre ogni elemento della metafora nel suo referente numerico reale → score += 1

utility(reader): Il lettore può distinguere un embedding statico alla Word2Vec da una rappresentazione contestuale in cui la stessa parola assume vettori diversi in frasi diverse → score += 1

utility(reader): Il lettore può spiegare perché l'ordine non scompare dal Transformer: viene reintrodotto attraverso informazione posizionale e, nei modelli causali, regolato da una maschera → score += 1

utility(reader): Il lettore può distinguere il parallelismo durante l'elaborazione/addestramento di una sequenza dalla generazione autoregressiva, che produce ancora un token dopo l'altro → score += 1

utility(factual): La genealogia da attenzione neurale precedente al Transformer fino a Vaswani et al. (2017) è ricostruita con autori, date, contributi e fonti primarie, senza attribuire l'invenzione dell'intera famiglia di meccanismi a un solo paper → score += 1

utility(factual): Le prestazioni, i tempi di addestramento, l'hardware e i benchmark dichiarati in “Attention Is All You Need” sono riportati con i valori esatti e collegati alla configurazione corretta → score += 1

utility(factual): Il limite quadratico dell'auto-attenzione standard rispetto alla lunghezza della sequenza, la finitezza della finestra di contesto e il ruolo di residual connection, normalizzazione e rete feed-forward sono descritti con fonti, impedendo l'equazione “Transformer = sola attenzione” → score += 1

utility(emotional): Il lettore prova meraviglia controllata davanti a parole che cambiano configurazione reciproca a ogni frase, ma chiude il capitolo con meno magia e più precisione di quanto ne avesse all'inizio → score += 1
```

**Soglia progettuale:** 10 utility atomiche; il capitolo deve ottenerne almeno 8,5/10 e non può compensare la mancata utility sul parallelismo vs. generazione sequenziale o la mancata utility sul contratto della metafora con punti ottenuti altrove.

## BEAT LIST

### Beat 1 — “Il titolo che tolse le ricorrenze”

**Core question:** Quale collo di bottiglia spinse otto ricercatori a proporre un'architettura fondata sull'attenzione invece che sulla ricorrenza?
**Audience tag:** [ALL]
**Word count target:** 850–950 parole
**Funzione narrativa:** Hook → Complicate. Aprire su un artefatto verificabile del 2017 — prima pagina, poster o presentazione del paper — e far emergere il problema prima del nome della soluzione.
**Key facts che il Researcher deve trovare:**

- Data della prima versione, sede di presentazione, titolo esatto, ordine degli autori e affiliazioni di “Attention Is All You Need”; verificare la forma storica del nome della conferenza nel 2017.
- Una scena documentabile legata al paper: luogo e data della presentazione, fotografia del poster, pagina del manoscritto o ricordo diretto di un autore; se non esiste una fonte scenica, usare la materialità del PDF senza inventare stanze, dialoghi o reazioni.
- Come RNN, LSTM e GRU elaborano le posizioni lungo una catena di stati e perché questa dipendenza limita la parallelizzazione durante l'addestramento.
- Distinguere il problema computazionale della sequenzialità dal problema informativo delle dipendenze lontane; trovare fonti primarie per entrambi senza affermare che LSTM e attenzione precedente “non funzionavano”.
- Claim esatto del paper sul rinunciare a ricorrenza e convoluzioni; non trasformarlo nel claim più ampio e falso che ogni operazione del Transformer sia simultanea.

### Beat 2 — “Una parola, più di un posto”

**Core question:** Perché una coordinata fissa non basta quando il significato di una parola dipende dalle altre parole presenti?
**Audience tag:** [ALL]
**Word count target:** 900–1000 parole
**Funzione narrativa:** Establish → Complicate. Riprendere con misura la mappa del Capitolo 2 e mostrare il suo limite su una sola ambiguità lessicale documentata.
**Key facts che il Researcher deve trovare:**

- Un esempio chirurgico e linguisticamente solido di polisemia o disambiguazione in italiano, oppure una coppia inglese traducibile senza perdere il contrasto, in cui la stessa forma richieda interpretazioni diverse.
- Evidenza primaria che i word embedding statici assegnano normalmente un solo vettore per tipo lessicale e quindi fondono usi distinti; evitare la caricatura secondo cui Word2Vec “ignora il contesto”, dato che il contesto serve al suo addestramento.
- Come una rappresentazione contestuale viene aggiornata in funzione degli altri token della sequenza; separare l'input embedding iniziale dalla rappresentazione prodotta dopo gli strati.
- Precursori contestuali pertinenti, se necessari alla correttezza storica, per non suggerire che il Transformer abbia inventato da zero l'idea di rappresentare una parola tramite il contesto.
- Limite concettuale: “contesto” qui significa informazione disponibile nella sequenza e nel modello, non comprensione situata del mondo o esperienza soggettiva.

### Beat 3 — “Il primo faro nella sala”

**Core question:** Come decide ogni parola quali altre parole pesare di più senza che nessuno le assegni regole grammaticali a mano?
**Audience tag:** [GENERAL]
**Word count target:** 1000–1100 parole
**Funzione narrativa:** Complicate → Resolve. È il centro meccanico del capitolo e il primo dispiegamento completo dell'analogia canonica.
**Key facts che il Researcher deve trovare:**

- Definizione operativa delle proiezioni query, key e value e delle matrici apprese che le producono a partire dalle rappresentazioni dei token.
- Ordine esatto delle operazioni nella scaled dot-product attention: prodotti query–key, divisione per la radice della dimensione delle key, softmax, somma pesata dei value.
- Perché è presente il fattore di scala e che cosa accade ai gradienti della softmax quando i prodotti scalari diventano grandi; fonte primaria o manuale tecnico autorevole.
- Un'unica frase breve da usare come laboratorio per seguire una query attraverso punteggi e pesi; se si usano numeri, devono provenire da un esempio riproducibile o essere chiaramente marcati nel dossier come esempio didattico calcolato.
- Contratto del **Faro nella Sala da Ballo**: ogni ballerino/token possiede il proprio fascio/query; i cartellini/key rendono possibile il confronto; ciò che viene raccolto sono i value; la luminosità relativa è il peso dopo softmax; l'esito è una nuova combinazione numerica, non una decisione cosciente su chi “conta”.
- Distinguere un peso di attenzione da una spiegazione causale completa del comportamento del modello; cercare studi primari sul dibattito “attention is/is not explanation” per una cautela breve e proporzionata.

### Beat 4 — “Più fasci, relazioni diverse”

**Core question:** Perché un solo modo di guardare la frase non basta, e che cosa aggiungono le teste multiple?
**Audience tag:** [GENERAL]
**Word count target:** 900–1000 parole
**Funzione narrativa:** Establish → Resolve → Complicate. Ampliare la metafora senza trasformare le teste in specialisti grammaticali deterministici.
**Key facts che il Researcher deve trovare:**

- Meccanismo della multi-head attention: proiezioni separate, attenzione calcolata in sottospazi, concatenazione e proiezione finale; dimensioni usate nei modelli base e big del paper originale.
- Motivazione dichiarata dagli autori per permettere al modello di considerare informazioni provenienti da differenti posizioni e sottospazi di rappresentazione.
- Una visualizzazione o analisi primaria di teste che mostrino pattern interpretabili, con numero di strato/testa, frase e modello esatti.
- Studi che mostrino teste ridondanti, diffuse o non stabilmente interpretabili; bilanciare l'esempio riuscito per evitare il mito “ogni testa scopre una regola linguistica”.
- Mappatura metaforica: più fasci o colori indicano confronti appresi diversi, ma nessun colore possiede per definizione il ruolo “soggetto”, “verbo” o “coreferenza”.
- Chiarire che l'attenzione è solo un sottoblocco: residual connection, layer normalization e rete feed-forward trasformano ulteriormente ogni posizione.

### Beat 5 — “Tutti insieme, ma non senza ordine”

**Core question:** Se le parole vengono confrontate in parallelo, come fa il Transformer a distinguere chi viene prima, chi viene dopo e chi non deve ancora essere visto?
**Audience tag:** [GENERAL]
**Word count target:** 950–1050 parole
**Funzione narrativa:** Complicate → Resolve. Smontare l'equivoco più pericoloso contenuto nella formula “ha eliminato la sequenzialità”.
**Key facts che il Researcher deve trovare:**

- Perché l'auto-attenzione priva di informazioni posizionali è insensibile all'ordine e come il Transformer originale aggiunge positional encoding sinusoidali agli embedding.
- Formule e intuizione delle codifiche sinusoidali, da conservare nel dossier e tradurre in prosa solo quanto serve; parametri e lunghezze effettivamente dichiarati nel paper.
- Differenza fra encoder self-attention non mascherata, decoder masked self-attention ed encoder–decoder attention nel Transformer originale.
- Funzione della maschera causale: impedire a una posizione di usare token futuri durante l'addestramento autoregressivo.
- Catena esplicita da verificare: calcoli fra posizioni parallelizzabili durante un passaggio di addestramento → previsione del prossimo token condizionata sui precedenti → generazione in uso ancora token-per-token.
- Evoluzioni delle codifiche di posizione soltanto se utili a evitare un'affermazione universale sui Transformer moderni; non trasformare il beat in un catalogo di varianti.

### Beat 6 — “Che cosa cambiò davvero nel 2017”

**Core question:** Quale vantaggio misurabile rese il Transformer un cambio di architettura, e quali slogan vanno ridimensionati?
**Audience tag:** [GENERAL]
**Word count target:** 900–1000 parole
**Funzione narrativa:** Payoff fattuale → Complicate. Portare il lettore dai meccanismi ai risultati senza convertire un benchmark in mito d'origine inevitabile.
**Key facts che il Researcher deve trovare:**

- Risultati esatti su WMT 2014 inglese–tedesco e inglese–francese per Transformer base/big, metrica BLEU, preprocessing e baseline confrontate; distinguere ogni riga della tabella.
- Tempi di addestramento, numero e modello delle GPU, costo computazionale dichiarato e differenza fra configurazioni base e big; non combinare numeri provenienti da esperimenti diversi.
- Complessità per strato riportata nella tabella del paper per self-attention, ricorrenza e convoluzione, incluse le condizioni sotto cui una è vantaggiosa.
- Cronologia essenziale dell'attenzione prima del 2017: Bahdanau, Cho e Bengio; eventuali lavori di self-attention precedenti; verificare il riferimento “Cheng et al.” segnalato dal PRD e spiegare quale contributo riguardi.
- Adozione successiva del Transformer soltanto attraverso due o tre pietre miliari indispensabili e primarie, senza attribuire al paper del 2017 capacità che appartengono a modelli addestrati dopo.
- Formula proporzionata: il Transformer rimosse la ricorrenza dall'architettura proposta e migliorò la parallelizzazione dell'addestramento; non abolì tempo, ordine, latenza né costo computazionale.

### Beat 7 — “Quando il fascio incontra il muro”

**Core question:** Che cosa ha liberato davvero l'auto-attenzione, e quali confini restano quando una macchina sembra seguire il senso di una frase?
**Audience tag:** [ALL]
**Word count target:** 900–1000 parole
**Funzione narrativa:** Complicate → Land → Pivot. Richiudere la sala da ballo traducendo l'intera metafora in meccanica, poi consegnare al lettore un test pratico contro l'antropomorfismo.
**Key facts che il Researcher deve trovare:**

- Complessità temporale e di memoria dell'auto-attenzione standard rispetto alla lunghezza della sequenza, con notazione, assunzioni e fonte; evitare di farne un limite identico per ogni variante moderna.
- Definizione operativa di finestra di contesto e differenza fra contesto disponibile, informazione effettivamente usata e memoria persistente; un modello non “ricorda tutto” perché può pesare token in una finestra.
- Evidenza sperimentale sui limiti nell'uso di contesti lunghi, cercando studi primari che distinguano capacità nominale e recupero effettivo dell'informazione.
- Riepilogo meccanicistico obbligatorio: input embedding + posizione → attenzione contestuale → trasformazioni per strato → rappresentazioni dipendenti dalla frase; nessun passaggio prova comprensione o coscienza.
- Checklist finale del lettore davanti a un claim su un modello: qual è la finestra, quale schema di attenzione, quale maschera, quale costo con sequenze più lunghe, quale benchmark dimostra l'uso del contesto?
- Ponte al Capitolo 5: il Transformer spiega l'architettura che organizza il contesto, non ancora come il pre-training predittivo e l'allineamento trasformino quell'architettura in un assistente conversazionale.

## REVIEWER READINESS NOTES

### Tension points

1. **La stessa parola cambia senza che il dizionario cambi.** Il lettore arriva dal modello mentale delle coordinate stabili: la posta in gioco è mostrare come una rappresentazione venga riscritta dalle relazioni presenti nella frase senza suggerire che il sistema “colga il senso” come una persona.
2. **Il titolo promette l'abolizione della sequenza, ma la sequenza ritorna.** La tensione deve culminare nella distinzione fra parallelismo dentro uno strato, ordine reinserito tramite posizione e generazione autoregressiva ancora seriale; se questa distinzione resta implicita, il capitolo fallisce il suo obiettivo centrale.
3. **Il faro illumina relazioni utili ma incontra pareti fisiche.** All'aumentare del contesto crescono connessioni e costo dell'attenzione standard; la meraviglia geometrica deve acquistare peso proprio quando se ne vede il confine, non quando viene proclamata senza limite.

### Key chains da rendere esplicite

- Embedding statico → stessa coordinata per usi diversi → ambiguità compressa → rappresentazione aggiornata dagli altri token → significato operativo dipendente dalla frase.
- Stato ricorrente passo dopo passo → dipendenza seriale durante l'addestramento → auto-attenzione fra tutte le posizioni dello strato → maggiore parallelizzazione → addestramento più efficiente nelle condizioni documentate.
- Query–key → prodotto scalare e scala → softmax → pesi relativi → somma dei value → nuova rappresentazione contestuale → azione del lettore: tradurre “la parola guarda” in questa catena numerica.
- Assenza di ricorrenza → nessun ordine intrinseco nell'attenzione → positional encoding → maschera causale → ordine preservato senza reintrodurre una RNN.
- Parallelismo del passaggio di addestramento → modello causale del prossimo token → generazione autoregressiva → conseguenza: “Transformer non sequenziale” non significa “risposta intera prodotta in un solo istante”.
- Finestra finita + costo crescente → contesto nominalmente disponibile ma non necessariamente utilizzato → domanda critica del lettore: quale prova mostra che l'informazione lontana ha davvero influenzato l'output?

### Risk proportionality guards

- **Priorità storica:** il paper del 2017 non inventò l'attenzione dal nulla; distinguere attenzione neurale precedente, self-attention precedente e combinazione architetturale specifica di Vaswani et al.
- **“Eliminare la sequenzialità”:** limitare il claim alla rimozione di ricorrenza/convoluzione dal percorso principale e alla parallelizzazione dei calcoli per posizione durante l'addestramento; l'ordine resta codificato e il decoding autoregressivo resta seriale.
- **“Liberare il significato”:** significa rendere la rappresentazione del token dipendente dal contesto disponibile, non ottenere un significato universale, stabile o esperito soggettivamente.
- **Metafora del faro:** ogni uso di “guarda”, “cerca”, “decide”, “illumina” o “si concentra” deve essere seguito dalla traduzione in proiezioni, prodotti scalari, softmax e somme pesate; nessun faro centrale, nessun direttore di sala.
- **Interpretabilità:** un peso alto può offrire un indizio, ma non va presentato come spiegazione causale completa; mostrare almeno una posizione documentata pro e una cautela documentata.
- **Prestazioni:** i risultati di traduzione del 2017 dimostrano prestazioni su benchmark e configurazioni precise, non superiorità universale su ogni compito, lunghezza o budget.
- **Costi:** il limite quadratico dell'attenzione standard va bilanciato con il vantaggio di parallelizzazione e con l'esistenza di varianti più efficienti; non trasformarlo né in catastrofe né in dettaglio trascurabile.
- **Architettura completa:** evitare “l'attenzione fa tutto”; residual connection, normalizzazione, feed-forward, embeddings, obiettivo di addestramento e decoding sono parti causali della prestazione.
- **Scene e numeri:** nessun gesto o dialogo degli autori senza fonte; ogni valore BLEU, durata, GPU, dimensione, numero di teste o lunghezza di contesto resta legato al modello e all'esperimento da cui proviene.

## RESEARCHER BRIEF

### Web search terms — query esatte

1. `site:arxiv.org/abs/1706.03762 "Attention Is All You Need" version history`
2. `site:papers.nips.cc "Attention Is All You Need" 2017 PDF supplementary`
3. `Vaswani Shazeer Parmar Uszkoreit Jones Gomez Kaiser Polosukhin 2017 affiliations`
4. `NeurIPS NIPS 2017 Attention Is All You Need poster schedule Long Beach`
5. `"Attention Is All You Need" author interview origin title transformer history`
6. `Transformer 2017 no recurrence convolution parallelization sequential operations original paper`
7. `RNN sequential computation parallelization long range dependencies primary paper LSTM`
8. `Bahdanau Cho Bengio 2014 2015 neural machine translation jointly learn align translate PDF`
9. `Cheng et al self-attention paper 2016 long short-term memory-networks machine reading PDF`
10. `self-attention before transformer history primary papers 2016`
11. `static word embeddings one vector polysemy limitation contextual representations primary source`
12. `ELMo deep contextualized word representations 2018 same word different context PDF`
13. `Transformer query key value scaled dot-product attention sqrt dk softmax explanation original paper`
14. `scaled dot product attention large dot products softmax small gradients sqrt dk source`
15. `multi-head attention different representation subspaces original Transformer dimensions heads`
16. `Transformer attention heads syntactic relations visualization primary study`
17. `Michel Levy Neubig 2019 are sixteen heads really better than one PDF`
18. `Jain Wallace 2019 Attention is not Explanation PDF`
19. `Wiegreffe Pinter 2019 Attention is not not Explanation PDF`
20. `Transformer sinusoidal positional encoding order permutation equivariance original paper`
21. `Transformer encoder decoder masked multi-head attention causal mask original paper`
22. `Transformer training parallel autoregressive inference sequential token generation official explanation`
23. `Attention Is All You Need WMT 2014 English German French BLEU 28.4 41.8 verify table`
24. `Attention Is All You Need training time 8 P100 GPUs 3.5 days base big verify`
25. `Attention Is All You Need Table 1 complexity per layer self-attention recurrent convolutional`
26. `Transformer residual connection layer normalization position-wise feed-forward original architecture`
27. `vanilla self-attention O(n^2) memory sequence length primary source`
28. `long context language models lost in the middle primary paper effective context retrieval`
29. `Transformer finite context window effective context length primary study`
30. `attention weight causal explanation limitations primary research survey`

### Document types da prioritizzare

- Paper primari e supplementi: arXiv con version history, atti NIPS/NeurIPS, ICLR, ACL/EMNLP e riviste peer-reviewed; usare survey soltanto per individuare le fonti originali.
- Artefatti ufficiali del paper del 2017: PDF, poster, schedule e video della conferenza, pagine istituzionali degli autori, repository o materiale di presentazione conservato in archivi verificabili.
- Paper fondativi su RNN/LSTM, attenzione neurale e self-attention precedente per ricostruire la genealogia senza mito del singolo inventore.
- Studi sperimentali di interpretabilità e pruning delle teste per bilanciare visualizzazioni suggestive e limiti delle letture grammaticali.
- Documentazione tecnica o paper primari per positional encoding, maschere, decoding autoregressivo, complessità e contesti lunghi; privilegiare formule e tabelle originali rispetto a tutorial.
- Dataset card, benchmark report e appendici sperimentali per numeri BLEU, tokenizzazione, hardware, durata e costo; evitare post divulgativi che ricopiano valori senza configurazione.

### Fatti, date, nomi e numeri da cacciare

- Prima submission, revisioni e data/sede della presentazione di “Attention Is All You Need”; titolo, otto autori nell'ordine originale, affiliazioni e denominazione storica della conferenza.
- Identità e contributo preciso dei lavori di Bahdanau, Cho e Bengio e di Cheng et al.; stabilire se il riferimento del report editoriale riguarda attenzione, self-attention o un meccanismo affine.
- Numero di layer, dimensione del modello, dimensione feed-forward, numero di teste, dimensione di key/value, dropout e positional encoding nelle configurazioni base e big.
- Formula completa della scaled dot-product attention e spiegazione documentata del divisore `√d_k`.
- Differenze esatte fra encoder self-attention, decoder masked self-attention e encoder–decoder attention.
- Risultati BLEU esatti sui due task WMT 2014, baseline, ensemble vs. singolo modello, tokenizzazione e criteri di confronto.
- Numero e modello delle GPU, durata di addestramento e training cost dichiarato per base e big; non fondere valori di righe diverse.
- Complessità per strato e lunghezza massima del percorso fra posizioni per attenzione, ricorrenza e convoluzione nella tabella originale, incluse variabili e condizioni.
- Un esempio primario riproducibile di testa con pattern interpretabile e almeno un risultato quantitativo sulla ridondanza o potatura delle teste.
- Costo `O(n²)` dell'attenzione standard con specifica di quale risorsa cresce quadraticamente e delle assunzioni dimensionali; confronto proporzionato con ricorrenza e varianti efficienti.
- Finestra di contesto nominale e prestazione effettiva su informazione posta a diverse distanze in almeno uno studio primario; non generalizzare da un solo modello a tutti i Transformer.
- Ogni conflitto su cronologia, benchmark, configurazioni, autorialità o priorità va in `[CONFLICT]`; ogni scena non documentabile va marcata `[BLOCKED: needs human input]` e non deve passare alla prosa.

## TARGET

**Word count:** 6600–7000 parole totali; sette beat fra 850 e 1100 parole, calibrati sulla lunghezza effettiva del Capitolo 1 perché il PRD non stabilisce un conteggio autonomo.

**Opening hook strategy:** Aprire sulla materialità verificabile del manoscritto del 2017 che dichiara di poter fare a meno di ricorrenza e convoluzioni, lasciando che il lettore avverta il collo di bottiglia prima di incontrare il Transformer.

**Closing beat promise:** Il lettore chiude sapendo come il Transformer organizza il contesto ma non ancora come quell'architettura, addestrata e allineata, diventi l'assistente conversazionale che il Capitolo 5 aprirà.
