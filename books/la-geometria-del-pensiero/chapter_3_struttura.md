# Capitolo 3 — Struttura: "L'Arte di Imparare dagli Errori"

**Core question (PRD.md § 4):** Come impara una rete neurale senza essere "programmata" peso per peso — e che cosa fanno, distintamente, loss, gradiente e backpropagation?
**Audience tag capitolo (PRD.md § 4):** [ALL]

## PRE-FLIGHT CHECKS

- **Repertorio metaforico (PRD.md § 6):** analogia canonica obbligatoria: **L'Escursionista nella Nebbia**. Corrispondenze da mantenere: escursionista → insieme dei parametri della rete durante l'ottimizzazione; quota → valore della loss; terreno → superficie della loss; pendenza locale → gradiente; direzione opposta alla salita → gradiente negativo; lunghezza del passo → learning rate; nebbia → assenza di una vista globale della superficie; successione dei passi → iterazioni su esempi o mini-batch. **Backpropagation non è l'escursionista né la discesa:** è il calcolo efficiente, a ritroso lungo le dipendenze della rete, delle pendenze locali che compongono il gradiente. Ogni elemento metaforico deve ricevere il contrappeso meccanicistico nello stesso paragrafo o nel successivo.
- **Continuity check:** `chapter_index.md` non esiste e non è disponibile un `chapter_2.md` approvato; non esiste quindi un registro canonico del PASS del Capitolo 2. Restano vincolanti `chapter_1.md` e la promessa causale di `chapter_2_struttura.md`: parole e coordinate non sono collocate a mano; una previsione sbagliata produce un errore numerico, e il Capitolo 3 deve mostrare come quell'errore determini direzione e ampiezza della modifica. Il capitolo non deve riaprire il dibattito coscienza/comprensione né ripetere il finale interrogativo del Capitolo 1.
- **Glossary check:** `NARRATIVE_GLOSSARY.md` non esiste. Candidati che il Writer Stage 2 dovrà valutare: *funzione di perdita/loss*, *parametro/peso*, *forward pass*, *gradiente*, *discesa del gradiente*, *learning rate*, *backpropagation*, *regola della catena*, *mini-batch*, *epoca*, *generalizzazione*, *overfitting*.
- **Guardia di continuità tecnica:** non usare come sinonimi `errore`, `loss`, `gradiente`, `backpropagation` e `gradient descent`. La loss quantifica lo scarto secondo un criterio scelto; il gradiente descrive la sensibilità locale della loss ai parametri; backpropagation calcola quel gradiente; l'ottimizzatore usa il gradiente per aggiornare i parametri.
- **Guardia di continuità estetica:** il Capitolo 2 è progettato per chiudere su una domanda tecnica. Il Capitolo 3 deve aprire con un suono documentato — la voce di NETtalk che cambia durante l'addestramento — e non con un'altra equazione, mappa o stanza.

## NUFs (Goal Scoring)

Dieci utility, un punto ciascuna. Obiettivo: almeno 8,5/10, senza azzerare nessuna delle tre categorie `reader`, `emotional`, `factual`.

```text
utility(reader): Il lettore può ricostruire senza formule l'intero ciclo input → previsione → confronto con il bersaglio → loss → gradienti calcolati con backpropagation → aggiornamento dei pesi → nuova previsione → score += 1

utility(reader): Il lettore può distinguere con parole proprie loss, gradiente, backpropagation e discesa del gradiente, senza trattarli come quattro nomi dello stesso processo → score += 1

utility(reader): Il lettore può usare correttamente l'Escursionista nella Nebbia per spiegare gradiente e learning rate, precisando che la rete non vede una montagna, non sceglie una meta e non possiede intenzione → score += 1

utility(reader): Il lettore può spiegare che "non programmata peso per peso" non significa "priva di scelte umane": persone e istituzioni scelgono dati, architettura, bersaglio, loss, ottimizzatore e criteri di valutazione → score += 1

utility(reader): Davanti alla frase "la rete ha imparato", il lettore può porre almeno tre domande diagnostiche: quale errore è stato minimizzato, su quali dati e con quale prova fuori dall'addestramento → score += 1

utility(emotional): Il lettore prova meraviglia sobria nel sentire una prestazione emergere da molte correzioni minuscole, insieme al sollievo critico di vedere un meccanismo locale e ripetibile al posto di un risveglio della macchina → score += 1

utility(factual): NETtalk viene presentato con fonte primaria, autori, anno, configurazione e progressione sonora verificati, separando ciò che la registrazione dimostra da ciò che non dimostra su linguaggio e comprensione → score += 1

utility(factual): La storia di backpropagation distingue contributi e date documentati — reverse-mode automatic differentiation, applicazione alle reti e diffusione del 1986 — senza attribuire l'invenzione a un solo autore o a un solo paper → score += 1

utility(factual): Backpropagation viene descritta correttamente come applicazione efficiente della regola della catena su un grafo di calcolo per ottenere derivate della loss rispetto ai parametri; l'aggiornamento dei pesi resta compito distinto dell'ottimizzatore → score += 1

utility(factual): Limiti e condizioni della discesa del gradiente — dipendenza da learning rate e inizializzazione, plateaux/selle, overfitting e differenza fra training e generalizzazione — sono sostenuti da fonti e bilanciati dai metodi che li rendono gestibili in pratica → score += 1
```

## BEAT LIST

### Beat 1 — “La voce che cambia”

**Core question:** Che cosa è cambiato, materialmente, tra il primo suono esitante di NETtalk e una pronuncia più riconoscibile, se nessuno ha scritto una regola per ogni parola?
**Audience tag:** [ALL]
**Word count target:** 850–950 parole
**Funzione narrativa:** Hook → Complicate. Far ascoltare o descrivere una sequenza audio primaria verificabile prima di nominare backpropagation; la trasformazione sonora pone il mistero meccanico del capitolo.
**Key facts che il Researcher deve trovare:**

- Registrazione primaria o copia archivistica affidabile della progressione di NETtalk durante l'addestramento: provenienza, data, etichette temporali/epoche e parole effettivamente udibili; trascrivere solo dettagli confermabili.
- Terry Sejnowski e Charles Rosenberg: nomi, affiliazioni, titolo e dati bibliografici esatti del paper di NETtalk; cronologia fra dimostrazione, technical report e pubblicazione.
- Architettura reale del sistema: finestra di caratteri, unità di input/nascoste/output, numero di connessioni o pesi, rappresentazione dell'uscita fonetica e hardware impiegato; non fondere configurazioni appartenenti a esperimenti diversi.
- Corpus e curriculum di addestramento: numero di parole o esempi, loro provenienza, ordine di presentazione, numero di passaggi e criterio usato per misurare il miglioramento.
- Quale algoritmo aggiornava i pesi e quale loss/bersaglio usava NETtalk; stabilire se la registrazione confronta checkpoint equivalenti a epoche, numero di parole viste o tempo di calcolo.
- Limite da rendere subito esplicito: migliorare la pronuncia su quel compito non equivale a comprendere le parole lette; trovare errori, casi fuori campione e valutazioni dichiarate dagli autori.
- Dettaglio sensoriale obbligatorio per l'apertura: supporto originale della registrazione, timbro/suono descrivibile senza interpretazioni e intervallo esatto fra due checkpoint; se non sourceable, aprire sull'artefatto pubblicato nel paper e marcare l'audio `[BLOCKED]`.

### Beat 2 — “Dare un numero allo sbaglio”

**Core question:** Come si trasforma una previsione sbagliata in una quantità abbastanza precisa da guidare una correzione?
**Audience tag:** [ALL]
**Word count target:** 850–1000 parole
**Funzione narrativa:** Establish → Resolve parziale. Dal suono al confronto misurabile: bersaglio e uscita diventano una loss scalare, non un giudizio morale né una comprensione del proprio errore.
**Key facts che il Researcher deve trovare:**

- Definizioni primarie o da manuale autorevole di target, prediction, loss per esempio, loss aggregata su mini-batch e funzione obiettivo; fissare le differenze terminologiche che le fonti talvolta appiattiscono.
- Un solo esempio chirurgico e riproducibile, preferibilmente ricavato da NETtalk o da una fonte didattica ufficiale, in cui uscita attesa, uscita prodotta e loss siano visibili con valori esatti.
- Mean squared error e cross-entropy: che cosa penalizzano, in quali compiti sono tipicamente usate e perché loss diverse attribuiscono costi diversi allo stesso tipo di previsione; la formula va nel dossier, non è obbligatoria nella prosa.
- Ruolo umano e progettuale nella scelta della loss: la rete non decide da sola che cosa conti come errore; distinguere il segnale numerico da concetti come verità, utilità sociale o gravità morale.
- Differenza fra funzione differenziabile usata per addestrare e metrica usata per valutare; trovare un caso sourced in cui loss e metrica non coincidano, senza aprire una digressione applicativa.
- Dettaglio fisico di apertura del beat: una riga, tabella o traccia di addestramento con target, output e valore della loss, indicando fonte, pagina/figura e configurazione.

### Beat 3 — “L'escursionista posa il piede”

**Core question:** Se l'escursionista non vede l'intera montagna, come può scegliere un passo che porti verso una quota più bassa?
**Audience tag:** [ALL]
**Word count target:** 950–1100 parole
**Funzione narrativa:** Complicate → Resolve. Costruire e completare l'analogia canonica del capitolo; passare subito da ogni elemento della montagna alla sua controparte numerica.
**Key facts che il Researcher deve trovare:**

- Definizione accessibile ma esatta di derivata, derivata parziale e gradiente; verificare la proprietà per cui il gradiente indica localmente la direzione di massima crescita e il suo opposto quella di massima diminuzione, con condizioni e caveat.
- Corrispondenza completa dell'analogia: posizione = valori correnti dei parametri; quota = loss; pendenza sotto i piedi = derivate locali; passo = aggiornamento; nebbia = nessuna conoscenza globale della superficie.
- Learning rate: ruolo nell'equazione di aggiornamento; evidenza o figure sourceable per mostrare un passo troppo grande che oscilla/diverge e uno troppo piccolo che rallenta, evitando soglie universali inventate.
- Differenza fra una superficie visualizzabile in due dimensioni e uno spazio con migliaia o milioni di parametri; ogni visualizzazione 2D va dichiarata come sezione/proiezione didattica, non fotografia letterale della rete.
- Origine storica della discesa più ripida/gradient descent: verificare il ruolo e la data di Augustin-Louis Cauchy e separare la genealogia matematica dall'uso moderno nelle reti neurali.
- Limite locale: il gradiente descrive il pendio nel punto corrente, non offre una mappa completa né garantisce per ogni problema il minimo globale.
- Dettaglio sensoriale di apertura: una figura primaria o autorevole con curve di livello e una traiettoria di aggiornamento; registrare numero di figura, assi e cosa è reale rispetto a cosa è illustrativo.

### Beat 4 — “Un passo non è imparare”

**Core question:** Perché una rete ha bisogno di migliaia di correzioni, e come si distingue una discesa riuscita da una memoria degli esempi già visti?
**Audience tag:** [GENERAL]
**Word count target:** 900–1050 parole
**Funzione narrativa:** Establish → Complicate. Animare il ciclo iterativo senza montaggio magico: esempi, mini-batch, aggiornamenti ed epoche; poi introdurre il divario fra loss di training e prestazione fuori campione.
**Key facts che il Researcher deve trovare:**

- Definizioni operative e fonti per batch, mini-batch, stochastic/mini-batch gradient descent, iterazione ed epoca; indicare le varianti terminologiche fra fonti.
- Perché il gradiente di un mini-batch è una stima del gradiente dell'intero insieme e quale trade-off introduce fra costo, rumore e frequenza degli aggiornamenti.
- Una curva di addestramento primaria con assi e valori leggibili: loss di training che scende e misura di validazione/test che consente di giudicare la generalizzazione.
- Differenza fra training, validation e test set; che cosa significa overfitting e perché una loss di training bassa non basta a dimostrare che il sistema ha appreso una regolarità trasferibile.
- Metodi di bilanciamento da citare in proporzione al rischio: early stopping, regolarizzazione e dati aggiuntivi/augmentation, ciascuno soltanto se sostenuto da una fonte e senza trasformare il beat in un catalogo.
- Ruolo dell'inizializzazione e dell'ordine dei mini-batch nella traiettoria; evitare il determinismo narrativo “ogni rete trova la stessa valle”.
- Dettaglio fisico di apertura: una curva di learning documentata, con il punto preciso in cui le traiettorie training/validation smettono di muoversi insieme.

### Beat 5 — “L'errore prende la strada all'indietro”

**Core question:** Come arriva l'informazione sull'errore finale a ogni peso nascosto che ha contribuito al risultato?
**Audience tag:** [GENERAL]
**Word count target:** 1050–1200 parole
**Funzione narrativa:** Complicate → Resolve. È il nucleo meccanico: forward pass, loss, backward pass e aggiornamento devono apparire come operazioni distinte e concatenate.
**Key facts che il Researcher deve trovare:**

- Un grafo di calcolo minimo, tratto da fonte autorevole o riprodotto fedelmente nel dossier, con valori numerici che consentano di seguire una singola previsione in avanti e le derivate all'indietro.
- Regola della catena: formulazione matematica esatta per il dossier e traduzione concettuale in “come cambia la loss se cambia questo valore, dato tutto ciò che dipende da esso”; evitare il lessico morale di colpa o responsabilità.
- Backpropagation come reverse-mode differentiation: quali quantità intermedie vengono conservate, in quale ordine vengono riusate e perché il calcolo è efficiente rispetto a perturbare ogni peso separatamente.
- Distinzione obbligatoria: backpropagation calcola gradienti; SGD o un altro ottimizzatore applica aggiornamenti; il learning rate determina la scala del passo. Trovare fonti che separino esplicitamente questi ruoli.
- Genealogia verificata e non eroica: contributo di Seppo Linnainmaa (1970) alla reverse-mode automatic differentiation, tesi di Paul Werbos (1974) e lavoro di David Rumelhart, Geoffrey Hinton e Ronald Williams (1986); controllare precedenti, formulazioni e dispute attributive prima di fissare il racconto.
- Dati bibliografici completi di “Learning representations by back-propagating errors”: data del fascicolo, volume, pagine, DOI, figure ed esperimenti effettivamente presenti nel paper di *Nature*.
- Limiti numerici rilevanti: gradienti che si attenuano o crescono attraversando molte operazioni; fonti primarie e contesto storico, senza anticipare come se fossero già risolti dall'attenzione del Capitolo 4.
- Dettaglio fisico di apertura: una pagina o figura del paper del 1986 con frecce/connessioni leggibili; nessuna scena d'ufficio o dialogo fra autori senza fonte biografica primaria.

### Beat 6 — “Una regola che nessuno aveva scritto”

**Core question:** Dopo tutte quelle correzioni locali, quale regolarità è comparsa nella rete — e come possiamo separarla dalla semplice memorizzazione?
**Audience tag:** [ALL]
**Word count target:** 850–950 parole
**Funzione narrativa:** Payoff → Complicate. Ritornare al suono di NETtalk e mostrare che una catena di aggiornamenti può produrre prestazioni nuove, senza trasformare l'emergere di una rappresentazione in comprensione.
**Key facts che il Researcher deve trovare:**

- Risultati quantitativi esatti di NETtalk su training e parole non viste, con metrica, dimensione del campione e configurazione; distinguere accuratezza di fonemi, parole e qualunque valutazione umana dell'intelligibilità.
- Analisi degli autori sulle unità nascoste e sulle regolarità ortografia-pronuncia: quali pattern furono effettivamente osservati e quali interpretazioni vennero proposte, senza retroproiettare concetti moderni.
- Errori tipici e casi irregolari del sistema; almeno un controesempio sourced che impedisca di presentare la curva sonora come progresso uniforme o padronanza generale della lettura.
- Confronto appropriato con un sistema a regole dell'epoca, solo se il paper definisce compito, baseline e metrica comparabili; altrimenti dichiarare il confronto non disponibile.
- Che cosa dimostra il caso: pesi non specificati uno per uno possono acquisire regolarità utili attraverso l'errore. Che cosa non dimostra: comprensione semantica, apprendimento senza dati o eliminazione delle decisioni umane.
- Una contro-obiezione sostanziale: “forse ha soltanto memorizzato”. Rispondere con la prova fuori campione disponibile, poi limitarne la portata in base al dataset reale.
- Dettaglio sensoriale di apertura: riprendere un secondo checkpoint della stessa registrazione del Beat 1, non introdurre una nuova metafora né un secondo caso ridondante.

### Beat 7 — “La meta è scritta nella funzione”

**Core question:** Se una rete riduce perfettamente l'errore che le abbiamo assegnato, che cosa ha davvero imparato — e che cosa resta fuori da quella misura?
**Audience tag:** [ALL]
**Word count target:** 850–1000 parole
**Funzione narrativa:** Complicate → Land → Pivot. Trasformare il meccanismo appena acquisito in uno strumento critico: apprendere significa migliorare rispetto a un obiettivo e a dati determinati, non avvicinarsi automaticamente a verità o comprensione.
**Key facts che il Researcher deve trovare:**

- Un solo caso tecnico documentato in cui migliorare la loss di training non migliori nella stessa misura la validazione o la metrica rilevante; privilegiare una curva sperimentale, non un aneddoto sociale.
- Distinzione fra obiettivo di addestramento, metrica di valutazione e scopo umano dell'applicazione; fonti su surrogate loss o objective–metric mismatch.
- Catena di decisioni umane da attribuire con precisione: selezione e preparazione dei dati, definizione dei target, architettura, loss, ottimizzatore, criteri di arresto e test.
- Contesto proporzionato: una loss è una semplificazione necessaria e verificabile, non un difetto in sé; la sua adeguatezza dipende dalla relazione fra obiettivo misurato e compito reale.
- Ponte ai modelli linguistici: verificare come la previsione del token successivo produca target dal testo stesso e perché questo venga detto auto-supervisionato; introdurre solo il principio indispensabile, riservando pre-training e allineamento al Capitolo 5.
- Ponte al Capitolo 4: backpropagation spiega come cambiano i pesi, non quale architettura permetta alle parole di usare il contesto reciproco; chiudere su questa distinzione senza nominare o anticipare il Faro nella Sala da Ballo.
- Azione finale del lettore: davanti a “ha imparato”, chiedere quale loss, quali dati e quale test esterno; la risposta deve trasformare un verbo antropomorfo in una catena meccanica verificabile.
- Dettaglio fisico di apertura: la curva training/validation del caso scelto, con assi e punto di divergenza esatti; non aprire con una massima astratta.

## REVIEWER READINESS NOTES

### Tension points

1. **Una voce migliora, ma nessuno le ha insegnato una regola alla volta.** L'ascolto di NETtalk crea meraviglia e sospetto: se non ci sono istruzioni parola per parola, il lettore deve vedere che cosa le sostituisce, senza accettare “ha imparato” come spiegazione.
2. **Un solo numero deve raggiungere ogni connessione nascosta.** La loss nasce all'uscita, mentre i parametri che l'hanno influenzata sono distribuiti nella rete: il problema del credito causale rende backpropagation una necessità narrativa, non una definizione appesa al capitolo.
3. **Scendere non significa arrivare alla meta giusta.** Una rete può ridurre con successo la quantità scelta e fallire fuori campione o sullo scopo umano; la posta in gioco è chi definisce l'errore e come verifica ciò che il numero lascia fuori.
4. **La parola “imparare” resta utile ma pericolosa.** Il capitolo deve consentirne l'uso controllato: miglioramento misurato prodotto da aggiornamenti dei parametri, sempre seguito dal contrappeso su obiettivo, dati e test.

### Key chains da rendere esplicite

- Esempio con target → forward pass → previsione → loss scalare → backpropagation delle derivate → gradiente per ogni parametro → aggiornamento dell'ottimizzatore → nuova previsione: nessun anello può essere saltato o fuso con il successivo.
- Loss scelta → definizione operativa di “sbaglio” → segnali prodotti dal gradiente → traiettoria dei pesi → comportamento appreso: cambiare il criterio può cambiare ciò che il sistema diventa bravo a fare.
- Pendenza locale → gradiente negativo → passo regolato dal learning rate → ripetizione su mini-batch → diminuzione della loss di training; poi validation/test → evidenza, oppure assenza di evidenza, di generalizzazione.
- Derivate locali concatenate all'indietro → contributo quantitativo di ogni parametro alla loss → aggiornamenti coordinati di strati nascosti → emergere di una regolarità non codificata peso per peso.
- Fine Capitolo 2 (coordinate mosse dall'errore) → Capitolo 3 (meccanismo dell'aggiornamento) → Capitolo 4 (architettura che determina quali relazioni contestuali possono essere apprese).

### Risk proportionality guards

- **Attribuzione storica:** non scrivere “Hinton inventò backpropagation” né “backpropagation nacque nel 1986”. Il 1986 è un punto di diffusione decisivo nelle reti neurali; reverse-mode differentiation e applicazioni antecedenti vanno nominate e documentate in misura proporzionata.
- **Metafora:** l'Escursionista nella Nebbia non vede, vuole, teme o sceglie. Il paesaggio è una funzione ad alta dimensionalità e la direzione viene calcolata; chiudere l'analogia entro il Beat 3 e richiamarla dopo solo se aggiunge precisione.
- **Efficacia dell'ottimizzazione:** non suggerire che gradient descent garantisca il minimo globale o che resti inevitabilmente intrappolata nel primo minimo locale. Bilanciare plateaux, selle, sensibilità e instabilità con l'evidenza della sua efficacia empirica e con tecniche di mitigazione documentate.
- **Overfitting:** non presentarlo come prova che “le reti non imparano”. È uno scarto misurabile fra adattamento e generalizzazione; validation, regolarizzazione, early stopping e dati appropriati forniscono contromisure, ciascuna con limiti.
- **Backpropagation e cervello:** non equiparare backpropagation all'apprendimento biologico. Se il confronto compare, riportare lo stato del dibattito sulla plausibilità biologica e chiarire che il capitolo descrive un algoritmo ingegneristico.
- **Tipo di apprendimento:** il percorso usa un caso supervisionato per rendere visibile il meccanismo, ma non deve insinuare che ogni rete richieda etichette umane per ogni esempio. Il target può anche essere ricavato dai dati, come nella previsione del token successivo; obiettivo e pipeline restano progettati.
- **Costo:** se vengono citati tempo, hardware o energia di addestramento, legarli alla configurazione precisa e bilanciarli con scala, epoca tecnologica ed efficienza ottenuta; nessun numero isolato deve diventare una tesi generale sull'impatto dell'IA.
- **Obiettivi e rischio:** una proxy incompleta non rende inutile la loss; rende necessario verificare allineamento fra loss, metrica e scopo. Evitare sia “il numero garantisce il risultato” sia “misurare è sempre riduttivo”.
- **NETtalk:** la progressione sonora è una prova di miglioramento sul compito documentato, non di comprensione o sviluppo infantile. Evitare confronti con un bambino se la fonte non li misura direttamente; se gli autori li usarono retoricamente, attribuirli e contestualizzarli.

## RESEARCHER BRIEF

### Web search terms — query esatte

1. `Sejnowski Rosenberg 1987 NETtalk a parallel network that learns to read aloud PDF`
2. `NETtalk original audio recording learning stages archive Sejnowski`
3. `NETtalk 1987 architecture 203 input 80 hidden 26 output units verify`
4. `NETtalk training corpus 1024 words 20000 words epochs performance primary source`
5. `NETtalk backpropagation loss training algorithm pronunciation generalization results`
6. `site:nature.com/articles/323533a0 "Learning representations by back-propagating errors"`
7. `Rumelhart Hinton Williams 1986 back-propagating errors Nature 323 533 536 PDF`
8. `Rumelhart Hinton Williams 1986 backpropagation figures experiments hidden units exact`
9. `Seppo Linnainmaa 1970 reverse mode automatic differentiation thesis original`
10. `Paul Werbos 1974 Beyond Regression thesis backpropagation neural networks original`
11. `backpropagation history reverse mode automatic differentiation primary sources chronology`
12. `Augustin Louis Cauchy 1847 gradient descent méthode générale équations simultanées history primary source`
13. `backpropagation chain rule computational graph gradient descent weight update authoritative textbook`
14. `site:deeplearningbook.org chapter 6 back-propagation gradient-based learning`
15. `loss function versus objective function versus cost function neural network authoritative textbook`
16. `cross entropy versus mean squared error neural network classification primary source`
17. `mini-batch stochastic gradient descent gradient estimate batch size tradeoff primary paper`
18. `training validation test loss overfitting early stopping neural networks primary source`
19. `vanishing gradients Bengio Simard Frasconi 1994 learning long-term dependencies PDF`
20. `saddle points high dimensional neural network optimization Dauphin Pascanu 2014 PDF`
21. `local minima loss landscape neural networks gradient descent empirical review primary paper`
22. `surrogate loss evaluation metric mismatch machine learning primary paper`
23. `self-supervised language model next token prediction cross entropy objective primary source`
24. `backpropagation biological plausibility review feedback alignment primary sources`

### Document types da prioritizzare

- Fonti primarie e artefatti: paper NETtalk, technical report, registrazione audio con provenienza archivistica, paper di *Nature* del 1986, tesi e pubblicazioni originali di Linnainmaa e Werbos.
- Testi matematici o storici primari per Cauchy e reverse-mode differentiation; survey storiche peer-reviewed solo per mappare dispute e rintracciare gli originali.
- Manuali ufficiali e aperti di machine learning/deep learning per definizioni stabili di loss, computational graph, chain rule, forward/backward pass e aggiornamento dei parametri.
- Paper sperimentali peer-reviewed per learning rate, mini-batch, superfici di loss, selle/plateaux, gradienti evanescenti/esplosivi e generalizzazione; evitare blog come fonte finale quando esiste il paper.
- Figure e log riproducibili con assi, valori e configurazione dichiarati; archiviare numero di pagina/figura e non ricostruire curve “tipiche” prive di provenienza.
- Fonti primarie sul language modeling per il breve ponte all'auto-supervisione; non anticipare RLHF, instruction tuning o allucinazioni, riservati al Capitolo 5.

### Fatti, date, nomi e numeri da cacciare

- Titolo, anno, volume, pagine, autori e affiliazioni del paper NETtalk; date distinte di report, demo, registrazione e pubblicazione.
- Provenienza e metadati dell'audio di NETtalk; parole pronunciate, checkpoint, epoche o numero di esempi visti e possibilità legale/pratica di citarne una trascrizione breve.
- Per ogni esperimento NETtalk usato: numero esatto di unità e pesi, ampiezza della finestra, codifica di lettere/fonemi, dimensione e composizione dei dataset, hardware, durata, learning rate, numero di epoche e metrica.
- Valori training e test/generalizzazione di NETtalk, baseline, casi irregolari e limiti dichiarati; non combinare risultati di versioni diverse della rete.
- Data del fascicolo, DOI, volume e pagine del paper Rumelhart–Hinton–Williams; esperimenti realmente inclusi e numeri/figure utili alla scena del Beat 5.
- Che cosa dimostrano esattamente Linnainmaa 1970 e Werbos 1974; termini usati negli originali, rapporto con reverse-mode AD e reti neurali, ed eventuali precedenti che rendano controversa la priorità.
- Data, titolo e formulazione del metodo di Cauchy; evitare di chiamarlo “gradient descent” se il termine non compare nell'originale senza spiegazione storica.
- Una micro-rete numerica verificabile: valori di input, target, pesi, output, loss, derivate e pesi dopo un aggiornamento, tutti dalla stessa fonte o calcolati in modo riproducibile dal Researcher.
- Definizioni sourceable di loss per esempio, costo medio, obiettivo, metrica, gradiente, learning rate, batch, mini-batch, iterazione, epoca, training/validation/test e overfitting.
- Una figura documentata per learning rate troppo alto/basso e una per training/validation divergence, con assi, dataset, modello e valori; nessun grafico generico senza fonte.
- Evidenza quantitativa sulle difficoltà di ottimizzazione scelte — selle/plateaux o vanishing/exploding gradients — insieme alle condizioni sperimentali e alle mitigazioni pertinenti.
- Fonte primaria per la previsione del token successivo come obiettivo auto-supervisionato; chiarire il rapporto fra target ricavato dal testo, cross-entropy e aggiornamento dei parametri senza anticipare il Capitolo 5.
- Ogni claim triangolata su almeno due fonti indipendenti. Divergenze di priorità storica, configurazione NETtalk o terminologia vanno in `[CONFLICT]`; dettagli scenici, audio o numerici non verificabili vanno in `[BLOCKED: needs human input]`, mai colmati per plausibilità.

## TARGET

**Word count:** 6600–7000 parole; il PRD non fissa una lunghezza esplicita, quindi il target segue la preferenza già stabilita dal Capitolo 1 (~6750 parole) e dal piano del Capitolo 2 (6600–7000), mantenendo sette beat da 800–1200 parole.

**Opening hook strategy:** Aprire su due checkpoint verificati della registrazione di NETtalk — prima suono incerto, poi pronuncia più riconoscibile — e chiedere che cosa sia cambiato dentro la rete prima di nominare loss o backpropagation.

**Closing beat promise:** Dopo aver visto come l'errore modifica i pesi, il lettore è pronto a scoprire quale architettura permette a ogni parola di pesare le relazioni con le altre e costruire il contesto.
