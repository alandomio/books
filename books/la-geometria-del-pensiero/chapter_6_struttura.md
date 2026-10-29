# Capitolo 6 — Struttura: «L'Elogio della Lentezza: Il Ragionamento nell'IA»

**Core question (PRD.md § 4):** Cosa cambia quando una macchina “pensa” più a lungo prima di rispondere, cioè quando riceve più calcolo al momento dell'uso?
**Audience tag capitolo (PRD.md § 4):** [GENERAL]

## PRE-FLIGHT CHECKS

- **Repertorio metaforico (PRD.md § 6):** il **Foglio di Brutta Copia** è l'analogia canonica obbligatoria del Capitolo 6. Va introdotto nel Beat 2, tradotto subito nei meccanismi reali — token intermedi, più traiettorie, ricerca e verifica — e chiuso nel Beat 7 chiarendo dove l'analogia cessa di valere: non è introspezione, coscienza o esperienza soggettiva.
- **Continuity check:** `chapter_index.md` non esiste, quindi manca il registro autorevole dei capitoli approvati. Restano vincolanti il PRD, il Capitolo 1 (`fluidità ≠ comprensione`) e il ponte fissato in `chapter_5_struttura.md`: l'addestramento deposita repertorio e preferenze nei pesi; questo capitolo isola ciò che può cambiare quando i pesi restano fermi e aumenta il calcolo durante la risposta. Nessun conflitto rilevabile con i file disponibili.
- **Glossary check:** `NARRATIVE_GLOSSARY.md` non esiste. Candidati che il Writer Stage 2 dovrà valutare: *calcolo in inferenza / test-time compute*, *chain of thought*, *traccia di ragionamento*, *self-consistency*, *best-of-N*, *verificatore*, *supervisione di processo*, *budget di calcolo*, *latenza*, *compute-optimal*.
- **Confine di scope:** non trasformare il capitolo in un catalogo di prompt, in una classifica di prodotti o in un'anticipazione degli agenti. Il Capitolo 6 riguarda come il calcolo aggiuntivo modifica la costruzione e la selezione di una risposta; pianificazione, strumenti e azione nell'ambiente restano al Capitolo 7. Non nominare la «Cassetta degli Attrezzi», metafora canonica del capitolo successivo.
- **Guardia epistemica:** “pensa”, “riflette”, “si accorge” e “corregge” sono scorciatoie narrative ammesse solo con contrappeso meccanicistico nello stesso paragrafo o nel successivo. Più token, più campioni o più ricerca possono migliorare alcuni risultati; non dimostrano comprensione e non garantiscono verità.
- **Dato da non presupporre:** il PRD chiede di preservare il guadagno associato a «20 secondi di riflessione», ma nei file di progetto non compare la fonte primaria. Il Researcher deve risalire all'esperimento originale e verificare modello, hardware, benchmark, baseline e metrica. Se trova soltanto un'infografica o un confronto fra modelli diversi, il numero va marcato `[CONFLICT]` o `[BLOCKED]` e sostituito nell'hook con un budget sourced in token, campioni o FLOP.

## NUFs (Goal Scoring)

Dieci utility, un punto ciascuna. Obiettivo di progetto: almeno 8,5/10, senza azzerare nessuna delle tre categorie `reader`, `emotional`, `factual`.

```text
utility(reader): Il lettore può distinguere addestramento e post-training dal calcolo in inferenza, spiegando che nel secondo caso i pesi possono restare fermi mentre cambiano il numero di token intermedi, i tentativi esplorati o il lavoro di selezione prima della risposta finale → score += 1

utility(reader): Il lettore può portare a termine l'analogia del Foglio di Brutta Copia traducendo ogni suo elemento in un meccanismo reale — passaggi intermedi, alternative, cancellazioni o selezione — e indicando il limite decisivo dell'analogia: nessuna esperienza interiore è implicata → score += 1

utility(reader): Il lettore può distinguere tre modi di spendere più calcolo al momento dell'uso — allungare una singola traiettoria, generare più traiettorie, cercare e verificare fra candidati — senza chiamarli tutti genericamente “chain of thought” → score += 1

utility(reader): Il lettore può valutare una notizia su un modello “che ragiona” chiedendo quale budget è aumentato, su quale benchmark, con quale selettore, rispetto a quale baseline e a quale costo di latenza o calcolo → score += 1

utility(reader): Il lettore può scegliere una pratica proporzionata alla posta in gioco: usare più calcolo per problemi scomponibili e verificabili, pretendere un prodotto intermedio controllabile e ricorrere a verifica esterna quando una risposta errata avrebbe conseguenze reali → score += 1

utility(emotional): Il lettore prova una meraviglia disciplinata davanti al fatto che una risposta possa migliorare senza riaddestrare il modello, insieme a una salutare resistenza a scambiare l'attesa, la lunghezza o una spiegazione fluida per prova di pensiero cosciente → score += 1

utility(factual): Chain-of-thought prompting è ricostruito da fonti primarie con autori, anno, modelli, benchmark, protocollo e limiti, distinguendo il metodo di prompting del 2022 dai reasoning model addestrati successivamente a produrre lavoro intermedio → score += 1

utility(factual): Self-consistency, best-of-N e ricerca con verificatore sono documentati con almeno un esperimento primario ciascuno, conservando numero di campioni, criterio di selezione, budget, benchmark, risultato e confronto equo → score += 1

utility(factual): La relazione fra budget in inferenza e prestazione è mostrata con almeno una curva primaria — inclusa la dipendenza dalla difficoltà del problema e i rendimenti decrescenti — senza convertire secondi, token, campioni e FLOP in unità equivalenti → score += 1

utility(factual): Almeno una fonte primaria sull'infedeltà delle tracce di ragionamento o sull'overthinking dimostra il limite del metodo con modello, compito, denominatore ed effetto esatti; il capitolo non generalizza quel risultato a ogni modello o dominio → score += 1
```

## BEAT LIST

### Beat 1 — «Venti secondi prima della risposta»

**Core question:** Se prompt e pesi restano gli stessi, che cosa può cambiare davvero mentre il cursore rimane fermo?
**Audience tag:** [ALL]
**Word count target:** 900–950 parole
**Funzione narrativa:** Hook → Complicate. Aprire su una singola domanda di benchmark e due esecuzioni controllate dello stesso modello con budget diversi; il lettore deve vedere prima l'attesa, i due esiti e il costo, poi ricevere il termine *test-time compute*.
**Key facts che il Researcher deve trovare:**

- Fonte primaria del claim «20 secondi di riflessione» richiamato dal PRD: formulazione originale, autore, data, modello/versione, hardware o servizio, domanda o benchmark, numero di run, baseline e guadagno misurato.
- Se i “20 secondi” provengono da un confronto GPT-4o/o1 o da altra coppia di modelli con addestramento diverso, documentare il confondente: non è una prova isolata dell'effetto del solo tempo di inferenza.
- Un esperimento primario alternativo in cui gli stessi pesi affrontano lo stesso insieme di problemi con budget diversi; recuperare un esempio individuale non selezionato a posteriori e il risultato aggregato a cui appartiene.
- Definizione operativa di *test-time compute* o *inference-time compute*: calcolo consumato dopo l'arrivo dell'input per produrre o selezionare l'output, distinto da pre-training e post-training.
- Unità effettiva usata nello studio: token di ragionamento, numero di campioni, nodi di ricerca, chiamate al verificatore, FLOP o tempo parete. Vietato trattare i secondi come misura portabile fra hardware e servizi diversi.
- Data e contesto del primo annuncio pubblico scelto come scena, se usato; ogni dettaglio fisico dell'apertura deve provenire dalla figura, dal log, dal paper o dalla pagina ufficiale, non da una ricostruzione immaginaria.

### Beat 2 — «Il Foglio di Brutta Copia»

**Core question:** Che cosa corrisponde, dentro un modello linguistico, ai passaggi provvisori che un essere umano scrive prima della risposta pulita?
**Audience tag:** [GENERAL]
**Word count target:** 950–1000 parole
**Funzione narrativa:** Establish → Resolve. Introdurre l'analogia canonica con un problema chirurgico; seguire un passaggio intermedio fino alla generazione del token successivo e chiudere esplicitamente il cerchio meccanicistico.
**Key facts che il Researcher deve trovare:**

- *Chain-of-Thought Prompting Elicits Reasoning in Large Language Models*: autori, data di preprint e pubblicazione, modelli, otto esempi nel caso GSM8K, protocollo e risultato esatto da usare; distinguere esempio illustrativo da valutazione aggregata.
- Eventuali antecedenti diretti citati dal paper — scratchpad/intermediate computation e lavori affini — per evitare di presentare Wei et al. come origine assoluta dell'idea se le fonti non lo sostengono.
- Meccanica autoregressiva della “brutta copia”: gli step scritti sono token generati; quando restano nel contesto, condizionano i token successivi. Verificare cache, conteggio e trattamento dei reasoning token soltanto per un'implementazione documentata.
- Differenza fra chain-of-thought elicited da esempi o istruzioni, traccia prodotta da un modello addestrato al ragionamento e sintesi mostrata all'utente da un prodotto; non inferire una traccia nascosta da un'interfaccia.
- Un singolo problema aritmetico o simbolico pubblicato nella fonte primaria in cui la risposta diretta fallisce e la sequenza intermedia riesce; trascrivere prompt, output, modello e parametri senza ricrearlo.
- Limite dell'analogia: il foglio umano è legato a intenzione, memoria ed esperienza; la versione meccanica è una sequenza o struttura computazionale che modifica la distribuzione dei token successivi.

### Beat 3 — «Una risposta, molti sentieri»

**Core question:** Perché spendere il budget su più tentativi può funzionare meglio che rendere più lunga una sola risposta?
**Audience tag:** [GENERAL]
**Word count target:** 1000–1050 parole
**Funzione narrativa:** Complicate → Resolve. Far biforcare la brutta copia: una traiettoria diventa un insieme di candidati, poi una procedura deve aggregarli o sceglierne uno.
**Key facts che il Researcher deve trovare:**

- *Self-Consistency Improves Chain of Thought Reasoning in Language Models*: autori, anno, numero di campioni, temperatura/decodifica, regola di aggregazione e guadagni esatti sui benchmark; usare un solo benchmark nel corpo e relegare gli altri al dossier.
- Differenza operativa fra voto/aggregazione sulla risposta finale, best-of-N con un punteggio, beam o tree search ed espansione adattiva; una fonte primaria per ogni strategia effettivamente narrata.
- *Tree of Thoughts* o un'alternativa primaria: modello, compito, numero di rami/nodi, euristica o valutatore, baseline, risultato e costo; verificare quanto del guadagno dipenda dal generatore e quanto dal selettore.
- Un confronto a budget pareggiato fra singola traiettoria lunga e molte traiettorie più brevi, se disponibile; se i budget non sono equivalenti, dichiararlo e non trasformare il risultato in una gerarchia generale.
- Meccanismo del fallimento condiviso: molte traiettorie correlate possono convergere sulla stessa risposta sbagliata; cercare misure di diversità e casi in cui il voto peggiora o non aiuta.
- Costo completo della strategia: token generati, chiamate al modello, lavoro del verificatore, latenza seriale o parallelizzata. La parallelizzazione può ridurre il tempo parete senza ridurre il calcolo totale.

### Beat 4 — «Chi corregge la brutta copia?»

**Core question:** Come può un sistema riconoscere un passaggio promettente o scartare un errore prima della risposta finale?
**Audience tag:** [GENERAL]
**Word count target:** 1000–1050 parole
**Funzione narrativa:** Complicate → Resolve → Complicate. Aprire su due soluzioni con lo stesso risultato finale ma un errore nascosto in una delle due; mostrare il verificatore, poi spostare la tensione sul suo criterio.
**Key facts che il Researcher deve trovare:**

- Distinzione fra outcome supervision e process supervision da una fonte primaria: feedback sul risultato conclusivo contro feedback sui singoli passaggi.
- *Let's Verify Step by Step*: autori, 2023, MATH, subset usato, risultato del 78% nel contesto esatto e composizione di PRM800K; verificare che cosa indicano realmente le 800.000 etichette e come furono raccolte.
- Come un process reward model assegna punteggi ai passaggi e come quei punteggi possono guidare best-of-N o ricerca al test time; separare nettamente addestramento del verificatore e suo uso in inferenza.
- Evidenza primaria sui limiti dei verificatori: errori condivisi col generatore, distribuzione fuori dominio, preferenza per forma plausibile, reward hacking o difficoltà nel discriminare soluzioni; conservare modello, task e denominatore.
- Un caso con verifica deterministica possibile — per esempio esecuzione di codice o controllo di un risultato matematico — per distinguere un test esterno da un giudice neurale fallibile, senza anticipare l'architettura degli agenti del Capitolo 7.
- Catena di responsabilità terminologica: “si corregge” significa generare una nuova sequenza condizionata da feedback o punteggi, non accorgersi soggettivamente di avere sbagliato.

### Beat 5 — «La curva della pazienza»

**Core question:** Più calcolo migliora sempre la risposta, e quando conviene spenderlo invece di usare un modello più grande?
**Audience tag:** [GENERAL]
**Word count target:** 950–1000 parole
**Funzione narrativa:** Establish → Resolve parziale. Portare il lettore davanti a una curva misurata: il beneficio cresce, rallenta, cambia con la difficoltà e talvolta scompare.
**Key facts che il Researcher deve trovare:**

- Snell, Lee, Xu e Kumar, *Scaling LLM Test-Time Compute Optimally can be More Effective than Scaling Model Parameters* (2024): modelli, dataset, due famiglie di strategie, definizione del budget e protocollo FLOP-matched.
- Condizioni esatte dei claim “oltre 4× più efficiente di best-of-N” e “supera un modello 14× più grande”: difficoltà dei prompt, baseline, metrica, intervalli e casi esclusi. Vietato usarli come slogan universali.
- Curva o tabella che mostri dipendenza dalla difficoltà: problemi troppo facili, fascia con successo di base non nullo e problemi oltre la portata del modello; ricavare cosa accade in ciascuna zona senza estrapolare.
- Una seconda fonte primaria indipendente o una replica che confronti strategie di test-time scaling a budget controllato; registrare eventuali conflitti con Snell et al.
- Risultati ufficiali di un reasoning model, se inclusi: checkpoint/versione, pass@1 contro majority vote o pass@k, numero di campioni, livello di test-time compute e benchmark contamination controls. Non confrontare barre con protocolli diversi.
- Latenza, throughput, costo monetario ed energia, solo se misurati nella fonte scelta; distinguere costo marginale per richiesta dal costo già sostenuto per addestrare il modello.
- Strategia compute-optimal o allocazione adattiva: quale segnale stima la difficoltà, come decide il budget e quale overhead introduce. Non presentarla come soluzione perfetta se la stima può sbagliare.

### Beat 6 — «Quando la brutta copia sbaglia»

**Core question:** Perché una traccia più lunga e convincente può ancora condurre con maggiore sicurezza alla risposta sbagliata?
**Audience tag:** [ALL]
**Word count target:** 950–1000 parole
**Funzione narrativa:** Hook → Complicate. Mostrare un errore preciso che sopravvive a molti passaggi o nasce durante una revisione; separare qualità della risposta, fedeltà della traccia e quantità di calcolo.
**Key facts che il Researcher deve trovare:**

- Studio primario sull'infedeltà della chain of thought: modello/versione, perturbazione o bias inserito, campione, metrica e quota di spiegazioni che non rivelano il fattore causale; cercare replica o critica indipendente.
- Evidenza primaria di overthinking o self-correction fallita: compiti, budget, punto in cui accuratezza o calibrazione peggiorano e condizioni in cui il fenomeno non compare.
- Se viene usato *The Illusion of Thinking* o uno studio analogo su puzzle a complessità crescente, recuperare codice, definizione dei livelli, modelli, numero di istanze, token budget, risultato e principali critiche metodologiche; vietato tradurre un collasso su quei puzzle in “i modelli non ragionano”.
- Distinzione fra traccia interna, chain of thought verbalizzata, riassunto mostrato dal prodotto e spiegazione finale; trovare documentazione ufficiale per il sistema narrato.
- Un esempio in cui più campioni non riparano un errore sistematico perché generatore e valutatore condividono lo stesso punto cieco.
- Bilanciamento obbligatorio: accanto a ogni limite, conservare il beneficio misurato sullo stesso modello o regime; accanto a ogni beneficio, indicare dominio e failure mode. Il capitolo non deve oscillare fra “prova di intelligenza” e “teatro inutile”.

### Beat 7 — «Sapere quando aspettare»

**Core question:** Quale disciplina pratica consente al lettore di comprare più calcolo senza comprare un'illusione di certezza?
**Audience tag:** [ALL]
**Word count target:** 950–1000 parole
**Funzione narrativa:** Resolve → Land → Pivot. Tornare alla domanda e ai due budget dell'apertura; valutare guadagno, costo e verificabilità con una griglia incorporata nella scena, quindi chiudere la metafora della brutta copia e aprire il confine verso l'azione.
**Key facts che il Researcher deve trovare:**

- Evidenza comparativa per almeno tre classi di compito: uno scomponibile e verificabile che beneficia del budget, uno semplice che non ne beneficia in modo utile e uno fuori distribuzione o non verificabile in cui più calcolo non risolve il problema.
- Una fonte su allocazione adattiva o routing fra risposta rapida e deliberativa, con tasso di errore del router, risparmio di compute e perdita o guadagno di accuratezza.
- Definizione operativa di “prodotto intermedio controllabile”: calcolo, prova, test, citazione o assunzione che un umano possa verificare senza dover credere alla chain of thought come resoconto fedele.
- Limiti della richiesta “spiega passo per passo”: può migliorare alcuni task ma anche produrre razionalizzazioni; cercare evidenza su quando conviene chiedere risultato + controlli invece di una lunga spiegazione.
- Azione finale del lettore da rendere in scena, non in decalogo: classificare la posta, scegliere il budget, chiedere un controllo indipendente e interrompere l'escalation di compute quando manca un verificatore affidabile.
- Ponte al Capitolo 7: più calcolo può produrre e selezionare un piano dentro la risposta; il salto successivo avviene quando il sistema conserva obiettivi, riceve osservazioni e compie azioni. Non introdurre ancora strumenti specifici né la metafora canonica del capitolo seguente.

## REVIEWER READINESS NOTES

### Tension points

1. **L'attesa sembra una prova di profondità.** Il cursore fermo e la risposta migliore invitano il lettore ad attribuire interiorità; la posta in gioco è mostrare un guadagno reale senza trasformare latenza e token in coscienza.
2. **Lo stesso modello può migliorare senza imparare nulla di nuovo nei pesi.** Questo sposta il centro della capacità dall'oggetto addestrato al processo eseguito per ogni domanda e costringe a distinguere memoria, calcolo e selezione.
3. **Ogni brutta copia ha bisogno di un criterio di correzione.** Generare cento candidati non basta: se il verificatore condivide l'errore del generatore, il budget amplifica una falsa sicurezza invece di ridurla.
4. **Il tempo ha un prezzo e un rendimento irregolare.** Sui problemi giusti, più inferenza può competere con un modello più grande; sui problemi troppo facili, troppo difficili o non verificabili, può comprare soltanto latenza, costo e una spiegazione più lunga.

### Key chains da rendere esplicite

- Pesi addestrati invariati → più token intermedi o traiettorie → contesto computazionale più ricco → maggiore probabilità di trovare una soluzione su alcuni task → nessuna nuova comprensione soggettiva implicata.
- Prompt con passaggi intermedi → token provvisori rientrano nel contesto → i token successivi sono condizionati dal percorso → risposta talvolta migliore → traccia non necessariamente fedele alla causa interna dell'output.
- Più campioni → maggiore diversità di candidati → aggregazione o verificatore → possibilità di selezionare un esito migliore → beneficio limitato dalla correlazione degli errori e dalla qualità del selettore.
- Feedback sui passaggi → addestramento di un process reward model → punteggio usato nella ricerca al test time → scarto di alcune traiettorie → nuovo failure mode se il proxy premia passaggi plausibili ma errati.
- Difficoltà stimata → budget adattivo → meno compute sui casi facili e più sui casi intermedi → migliore efficienza media → rischio di sotto-allocare proprio i casi mal classificati.
- Claim “ha pensato più a lungo” → domanda del lettore su unità, baseline, benchmark, selezione e costo → verifica del confronto → giudizio proporzionato invece di antropomorfismo.
- Deliberazione confinata alla risposta → piano testuale → limite dell'assenza di azione e feedback ambientale → domanda del Capitolo 7 su che cosa cambia quando il sistema può eseguire e osservare.

### Risk proportionality guards

- **“20 secondi”:** non usarli come unità scientifica universale. Bilanciare l'immediatezza narrativa con hardware, carico, parallelizzazione e implementazione; se la fonte primaria non isola il compute, dichiarare il limite o rimuovere il numero.
- **Chain of thought:** non equivale a ragionamento umano osservabile né a introspezione fedele. Bilanciare questa cautela con i guadagni sperimentali misurati, senza ridurre il metodo a “solo teatro”.
- **Reasoning model proprietari:** risultati e dichiarazioni del produttore sono fonti primarie sul proprio sistema, non verifiche indipendenti. Affiancare almeno una valutazione o replica esterna e conservare versione e data.
- **Benchmark:** un aumento su GSM8K, MATH, AIME, GPQA o puzzle sintetici non prova un miglioramento generale. Riportare dataset, split, pass@1/pass@k, numero di campioni, contaminazione e possibilità di verifica.
- **Più compute:** può aumentare accuratezza media, ma anche costo, latenza, energia e superficie d'errore. Non quantificare questi costi senza misure della configurazione narrata.
- **Modello piccolo contro modello grande:** un risultato FLOP-matched vale nelle condizioni dello studio; non implica che l'inference scaling sostituisca sempre pre-training, dati o parametri.
- **Verificatori:** un giudice neurale non certifica la verità. Distinguere test deterministici, confronto con answer key, majority vote e reward model appreso; indicare per ciascuno che cosa può e non può controllare.
- **Overthinking e collasso:** presentare fallimenti con dominio e soglia specifici e affiancare i regimi in cui il budget aiuta. Nessuna conclusione ontologica sulla capacità di “ragionare” da un singolo benchmark.
- **Tracce nascoste:** non dedurre intenzioni, inganno o stati mentali da sommari di prodotto. Se una fonte parla di monitoraggio o deception, conservare il setup costruito per elicitarla e la sua non rappresentatività dichiarata.
- **Consiglio al lettore:** più tempo non rende sicure decisioni mediche, legali o finanziarie. La verifica umana e documentale deve crescere con la posta in gioco, anche quando il modello usa un budget elevato.

## RESEARCHER BRIEF

### Web search terms — query esatte

1. `"20 seconds" "test-time compute" language model performance original source`
2. `"20 seconds of thinking" AI model benchmark primary source`
3. `site:openai.com/index/learning-to-reason-with-llms test-time compute curve o1 2024`
4. `site:arxiv.org/abs/2408.03314 "Scaling LLM Test-Time Compute Optimally"`
5. `Snell Lee Xu Kumar 2024 4x efficient best-of-N 14x larger model exact conditions`
6. `site:arxiv.org/abs/2201.11903 "Chain-of-Thought Prompting Elicits Reasoning"`
7. `Wei et al chain of thought eight exemplars GSM8K 540B exact accuracy appendix`
8. `site:arxiv.org scratchpad language models intermediate computation Nye 2021`
9. `site:arxiv.org/abs/2203.11171 "Self-Consistency Improves Chain of Thought Reasoning"`
10. `self-consistency chain of thought number of samples temperature GSM8K appendix`
11. `site:arxiv.org/abs/2305.10601 "Tree of Thoughts" deliberate problem solving`
12. `test-time compute best-of-N process reward model verifier budget matched primary paper`
13. `site:arxiv.org/abs/2305.20050 "Let's Verify Step by Step" PRM800K`
14. `PRM800K 800000 step level labels MATH 78 percent exact subset methodology`
15. `process reward model outcome reward model test-time search verifier failure primary study`
16. `LLM verifier correlated errors generator reward hacking test-time search paper`
17. `adaptive test-time compute prompt difficulty routing reasoning model primary paper`
18. `test-time scaling diminishing returns latency cost FLOPs reasoning language models`
19. `site:arxiv.org chain of thought faithfulness unfaithful explanations bias primary study`
20. `"Language Models Don't Always Say What They Think" chain of thought`
21. `site:arxiv.org reasoning model overthinking self-correction degrades accuracy primary study`
22. `site:machinelearning.apple.com "The Illusion of Thinking" methodology code criticism`
23. `reasoning models complexity collapse puzzle benchmark independent replication`
24. `reasoning tokens hidden chain of thought summary official system card`
25. `same model variable reasoning token budget accuracy benchmark open weights`
26. `serial long chain versus parallel sampling equal inference compute language model`
27. `compute optimal test-time scaling easy medium hard problems curve`
28. `routing fast model reasoning model accuracy compute savings benchmark`
29. `chain of thought prompting does not improve factuality calibration study`
30. `reasoning model benchmark pass@1 majority vote 64 samples protocol`

### Document types da prioritizzare

- Paper primari e appendici per chain-of-thought, self-consistency, Tree of Thoughts o ricerca equivalente, process supervision, verificatori e scaling del compute in inferenza; registrare separatamente preprint, versione revisionata e sede peer-reviewed.
- Codice, repository di valutazione, dataset card e log pubblici necessari a ricostruire budget, prompt, seed, decodifica, numero di campioni e criterio di selezione.
- System card, model card e pagine ufficiali di release per reasoning model proprietari; usarle per descrivere ciò che il produttore dichiara e affiancarle a eval indipendenti per le prestazioni.
- Studi indipendenti di replica, audit o ablation che pareggino il budget e separino modello generatore, verificatore, strategia di ricerca e difficoltà del prompt.
- Paper sulla faithfulness della chain of thought, sulla self-correction e sull'overthinking con protocolli causali o perturbazioni controllate; le survey servono come indice, non come unica prova.
- Documentazione hardware o serving soltanto quando necessaria a interpretare secondi, latenza, parallelismo e throughput; non convertire prezzi API correnti in proprietà stabili del metodo.
- Materiali del benchmark originale — paper, sito, split, answer key, contaminazione nota — prima di blog, leaderboard o comunicati; il giornalismo autorevole può contestualizzare una release, non sostituire il protocollo.

### Fatti, date, nomi e numeri da cacciare

- Origine documentale esatta dei «20 secondi»: autore dell'affermazione, grafico o esperimento da cui deriva, data, modelli comparati, stessa o diversa base, hardware, numero di richieste e guadagno assoluto/relativo. Se non risalibile, marcare `[BLOCKED: needs human input]`.
- Wei et al.: cronologia preprint/pubblicazione, identità e scala dei tre modelli, otto dimostrazioni, GSM8K, accuratezza, baseline e configurazione di decoding; verificare gli antecedenti scratchpad citati.
- Wang et al.: numero di sample per benchmark, temperatura, majority vote/marginalizzazione, guadagni esatti — incluso il +17,9 punti su GSM8K soltanto se confermato nella versione usata — e compute moltiplicato.
- Tree/search method scelto: numero di rami, profondità, valutazioni per nodo, prompt del valutatore, success rate, baseline e costo totale; verificare eventuale cherry-picking dei task.
- Lightman et al.: data, autori, subset rappresentativo di MATH, significato del 78%, confronto process/outcome, numero di problemi, annotatori, active learning e composizione delle 800.000 etichette PRM800K.
- Snell et al.: data/versione, PaLM 2 model sizes usati, MATH split, definizione di FLOP, compute-optimal policy, soglie di difficoltà, claim 4× e 14× completi di denominatore e caveat.
- Per almeno una replica successiva: modelli open-weight, dataset, budget in token/FLOP, strategie confrontate, intervalli di confidenza e punti di accordo o conflitto con Snell et al.
- Per il reasoning model di release eventualmente narrato: checkpoint, livello di compute, reasoning token, pass@1, consensus/pass@k, numero di campioni, data di cutoff, contamination controls e differenze fra modello di ricerca e prodotto.
- Per ogni curva: asse x e unità, asse y e metrica, numero di osservazioni, barre d'errore, punto di saturazione o inversione e fascia di difficoltà; non descrivere una curva da una didascalia soltanto.
- Faithfulness: paper, autori, anno, modelli, bias/perturbazione, N, metrica, percentuale e confondenti; distinguere “la traccia non menziona il fattore” da “il modello mente intenzionalmente”.
- Overthinking/self-correction: compiti, modello, prompt, numero di revisioni o token, baseline, variazione di accuratezza e condizioni contrarie in cui correggersi aiuta.
- *The Illusion of Thinking* o caso scelto: famiglie di puzzle, livelli di complessità, numero di istanze, budget, modelli, codice, definizione del collasso, repliche e obiezioni metodologiche; nessun trasferimento automatico a ragionamento generale.
- Costi: tempo al primo token, tempo totale, token di input/output/ragionamento, campioni, parallelismo, GPU/acceleratore, FLOP ed energia se disponibili; mantenere separati costo computazionale e latenza percepita.
- Routing/adaptive compute: segnale di difficoltà, accuratezza del router, distribuzione dei budget, compute risparmiato, regressioni sui casi misclassificati e overhead della decisione.
- Ogni claim deve conservare modello, versione, data, prompt/protocollo, benchmark, denominatore e metrica. Conflitti fra paper, system card e replica vanno in `[CONFLICT]`; dettagli non pubblici vanno in `[BLOCKED: needs human input]`.

## TARGET

**Word count:** 6800–7000 parole; il PRD non fissa una lunghezza numerica, quindi il target mantiene la scala del progetto ed è ricavato da sette beat entro il vincolo di 800–1200 parole.

**Opening hook strategy:** Aprire su un problema verificabile, un cursore immobile e due esecuzioni dello stesso modello a budget diversi, facendo vedere insieme il guadagno e il prezzo prima di nominare il test-time compute.

**Closing beat promise:** Chiudere con il lettore capace di distinguere una brutta copia computazionale da una mente e con la domanda successiva già concreta: che cosa cambia quando il piano non resta testo, ma può guidare un'azione e riceverne il risultato?
