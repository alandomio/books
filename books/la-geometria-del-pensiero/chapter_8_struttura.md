# Capitolo 8 — Struttura: «Le Trappole della Sintesi: Bias, Allucinazioni e Sovrageneralizzazione»

**Core question (PRD.md § 4):** Dove e perché un modello linguistico sbaglia in direzioni riconoscibili — inventando, omettendo, assecondando o allargando una conclusione — proprio mentre la sua risposta sembra più limpida e sicura?
**Audience tag capitolo (PRD.md § 4):** [ALL]

## PRE-FLIGHT CHECKS

- **Repertorio metaforico (PRD.md § 6):** il Capitolo 8 non ha un'analogia canonica assegnata. Non introdurre una nuova metafora dominante e non riutilizzare Galassia, Faro, Escursionista, Foglio di Brutta Copia o Cassetta degli Attrezzi. La spina dorsale sarà un'operazione forense ripetibile: affiancare fonte e sintesi, isolare ogni claim, seguirne la provenienza e misurare che cosa è cambiato.
- **Continuity check:** `chapter_index.md` non esiste, quindi manca il registro autorevole dei capitoli approvati. Il Capitolo 7 stabilisce che strumenti e runtime non cancellano i limiti statistici del modello ma possono dare loro «una mano con cui agire». Il Capitolo 8 arretra di un passo e osserva come nasce la proposta difettosa prima che diventi azione. Non ripetere prompt injection, permessi, benchmark agentici, catene lunghe o human-in-the-loop come controllo operativo; qui interessano la fedeltà del contenuto, la direzione degli errori e il metodo con cui il lettore li intercetta. Nessun conflitto rilevabile con i file disponibili.
- **Glossary check:** `NARRATIVE_GLOSSARY.md` non esiste. Candidati che il Writer Stage 2 dovrà valutare: *allucinazione*, *fedeltà alla fonte*, *overclaim/sovrageneralizzazione*, *bias*, *calibrazione*, *incertezza epistemica*, *sicofanzia*, *grounding*, *attribuzione*, *entailment*, *provenienza del claim*.
- **Confine di scope:** non costruire un catalogo di scandali, gruppi sociali o benchmark; non trasformare il capitolo in una guida al prompt perfetto; non attribuire ogni errore a un'unica causa chiamata «next-token prediction». Ogni classe di errore deve essere mostrata con un solo caso chirurgico, poi collegata al meccanismo e a un'azione del lettore. Rischi sociali ad alta posta richiedono audit primari con denominatori e limiti dichiarati.
- **Guardia terminologica:** *allucinazione* indica qui contenuto non sostenuto dall'evidenza disponibile o contraddetto da essa, non percezione soggettiva; *bias* indica una differenza sistematica legata a dati, misura, obiettivo o contesto d'uso, non un pregiudizio cosciente; *sovrageneralizzazione* indica l'estensione ingiustificata di causalità, popolazione, certezza o portata. “Sa”, “mente”, “crede”, “è sicuro” e “si accorge” richiedono nello stesso paragrafo il contrappeso osservabile: distribuzione dei token, prompt, punteggio, verbalizzazione o procedura di valutazione.
- **Regola di prova:** nessuna coppia fonte–sintesi va ricostruita a memoria. L'apertura e ogni micro-citazione devono provenire da paper, supplemento o dataset pubblico e conservare ID dell'esempio, modello/versione, prompt e output. Una percentuale di frasi errate non può essere scambiata con una percentuale di risposte, documenti, modelli o utenti danneggiati.

## NUFs (Goal Scoring)

Dieci utility, un punto ciascuna. Obiettivo di progetto: almeno 8,5/10, senza azzerare nessuna delle tre categorie `reader`, `emotional`, `factual`.

```text
utility(reader): Il lettore può sottoporre una sintesi a un audit claim-per-claim, classificando ogni affermazione come sostenuta, contraddetta, non sostenuta oppure sostenuta solo dopo aver ripristinato un qualificatore omesso → score += 1

utility(reader): Il lettore può distinguere allucinazione, omissione, sovrageneralizzazione, bias, cattiva calibrazione e sicofanzia, senza usarli come sinonimi e senza attribuire al modello intenzioni o stati mentali → score += 1

utility(reader): Il lettore può spiegare perché fluidità e sicurezza verbale non costituiscono una prova di verità: l'obiettivo di generazione premia continuazioni plausibili, mentre provenienza, verifica ed espressione dell'incertezza richiedono meccanismi e criteri aggiuntivi → score += 1

utility(reader): Il lettore può verificare in modo proporzionato alla posta: delimitare il claim, risalire alla fonte primaria, controllare data e popolazione, confrontare citazione ed evidenza, cercare conferme indipendenti e rifiutare una risposta quando la provenienza resta opaca → score += 1

utility(emotional): Il lettore prova un disagio preciso davanti a una sola parola che trasforma una correlazione in causa o una possibilità in certezza, senza scivolare nella sfiducia indiscriminata verso ogni sintesi automatica → score += 1

utility(emotional): Il lettore conclude con una sensazione di agenzia sobria: non deve indovinare se la macchina “dice il vero”, perché possiede un metodo visibile per seguire i claim fino alle prove e decidere quanto fidarsi → score += 1

utility(factual): Lo studio indicato dal PRD come studio Royal Society è ricostruito dalla fonte primaria e dai supplementi con autori, anno, 10.000 sintesi, 10 modelli, protocollo, unità d'analisi, intervallo di overclaim 26%–73% e odds ratio 4,85, correggendo o bloccando qualunque dettaglio che non coincida con la pubblicazione → score += 1

utility(factual): Un benchmark primario di factuality o summarization faithfulness è presentato con definizione dell'errore, dataset, modello/versione, denominatore, annotazione, baseline, risultato e limite, separando fedeltà alla fonte da verità nel mondo → score += 1

utility(factual): Un audit primario di bias linguistico mostra con stimoli controllati dove nasce una differenza fra gruppi, quanto è grande e che cosa non permette di concludere; il meccanismo è attribuito a dati, proxy, obiettivo e deployment, non a un pregiudizio cosciente → score += 1

utility(factual): Almeno uno studio su calibrazione o sicofanzia e uno su grounding, retrieval o citazioni quantificano sia il miglioramento sia il rischio residuo, conservando modello, data, task, metrica e trade-off fra accuratezza, copertura e astensione → score += 1
```

## BEAT LIST

### Beat 1 — «La frase che cresce nel riassunto»

**Core question:** Quanto basta cambiare in una sintesi perché una conclusione cauta diventi una certezza che la fonte non autorizza?
**Audience tag:** [ALL]
**Word count target:** 900 parole
**Funzione narrativa:** Hook → Complicate. Aprire su una coppia reale fonte–sintesi tratta dallo studio Royal Society: stesso argomento, quasi le stesse parole, un qualificatore scomparso o un verbo causale comparso. Rendere visibile la differenza prima di nominare *overclaim*, poi allargare dalla singola frase ai 10.000 casi.
**Key facts che il Researcher deve trovare:**

- Identità bibliografica esatta dello studio richiamato dal PRD: titolo, autori, rivista Royal Society, data di pubblicazione, DOI, versioni del paper e supplementi; verificare se “Royal Society” designa editore, rivista, report o comunicato.
- Una coppia fonte–sintesi pubblicamente verificabile con ID di riga o posizione nel supplemento: testo originale strettamente necessario, output del modello, modello/versione, prompt, tipo di trasformazione e giudizio degli annotatori. Se il dataset non pubblica esempi individuali, non inventarne uno: cercare una figura del paper o marcare `[BLOCKED]`.
- I quattro possibili assi dell'overclaim da verificare nel protocollo reale: causalità, certezza, generalità della popolazione e portata/applicabilità. Usare soltanto le categorie effettivamente definite dagli autori.
- I numeri vincolanti del PRD — 10.000 sintesi, 10 modelli, 26%–73%, odds ratio 4,85 — con denominatore, intervalli di confidenza, baseline umana o condizione di confronto, unità d'analisi e significato statistico. Segnalare ogni discrepanza in `[CONFLICT]`.
- Distribuzione degli esiti fedeli oltre a quella degli errori: quante sintesi non contengono overclaim, quali modelli o condizioni fanno meglio, e se accuratezza/fedeltà cambiano per disciplina, lunghezza o prompt.
- Un dettaglio sensoriale verificabile per l'apertura: schermata, colonna, etichetta di annotazione, parola sostituita o segno grafico presente nell'artefatto primario. Nessuna stanza, voce o reazione umana ricostruita.
- Guardia inferenziale: un tasso osservato su questo corpus misura quel task di sintesi, con quei modelli e quel protocollo; non misura la probabilità che “l'IA menta” in una conversazione qualsiasi.

### Beat 2 — «Una macchina per la plausibilità»

**Core question:** Perché il meccanismo che rende una risposta linguisticamente credibile non garantisce che ogni suo claim sia vero o provenga da una fonte?
**Audience tag:** [GENERAL]
**Word count target:** 900 parole
**Funzione narrativa:** Establish → Resolve parziale. Partire da un completamento fattualmente sbagliato ma localmente naturale; riaprire solo gli ingranaggi indispensabili dei capitoli precedenti e mostrare il disallineamento fra probabilità della sequenza, verità del claim e obbligo di rispondere.
**Key facts che il Researcher deve trovare:**

- Una definizione tecnica primaria dell'obiettivo autoregressivo e dell'inferenza: il modello stima probabilità condizionate dei token; verificare con documentazione o paper del modello narrato, senza dedurre che l'obiettivo da solo spieghi ogni errore.
- Un esempio pubblico e versionato in cui una risposta contiene un fatto non sostenuto: prompt, output completo, modello/checkpoint, data, impostazioni di decoding, accesso o meno a retrieval/strumenti e fonte con cui il claim viene smentito.
- Distinzione causale fra almeno quattro contributi possibili: informazione assente o rara nei dati, conflitto fra fonti, compressione nei pesi, prompt ambiguo/falso, decoding e pressione a fornire comunque una risposta. Non presentare questa tassonomia come decomposizione quantitativa se la fonte non la misura.
- Un benchmark di factuality adatto — per esempio TruthfulQA, FActScore, SimpleQA o alternativa meglio documentata — con costrutto misurato, numero e provenienza dei quesiti/claim, valutatore umano o automatico, baseline e limiti.
- Differenza fra conoscenza parametrica e provenienza: anche una risposta corretta generata dai pesi non porta con sé, per costruzione, il documento preciso da cui il claim deriva. Cercare una fonte primaria su attribution/provenance.
- Effetto del prompt che obbliga o incoraggia una risposta rispetto alla possibilità di astensione; cercare un confronto controllato, non un aneddoto. Registrare accuratezza, coverage/answer rate e criterio con cui viene giudicato “non so”.
- Bilanciamento: la stessa modellazione statistica produce moltissime continuazioni utili e corrette. Il capitolo deve mostrare il mismatch fra obiettivi, non sostenere che la generazione probabilistica renda impossibile la factuality.

### Beat 3 — «Tre modi di tradire una fonte»

**Core question:** Come si distingue una frase contraddetta dalla fonte da una frase inventata o da una frase formalmente vera a cui è stato tolto il limite decisivo?
**Audience tag:** [ALL]
**Word count target:** 950 parole
**Funzione narrativa:** Complicate → Resolve. Tenere sul tavolo un solo documento e sottoporlo a tre trasformazioni controllate: contraddizione, informazione extrinseca non supportata, omissione/overclaim. Consegnare al lettore una tassonomia operativa, non un vocabolario astratto.
**Key facts che il Researcher deve trovare:**

- Definizioni concorrenti di *hallucination* nella generazione e nella summarization: intrinsic/extrinsic, contradicted/unsupported, factuality/faithfulness. Risalire alle fonti primarie e motivare quale terminologia il capitolo adotta.
- Un dataset di summarization con documento sorgente, output e annotazioni a livello di span o claim; recuperare un esempio verificabile per ciascuna categoria effettivamente presente nel protocollo, preferibilmente dallo stesso esperimento.
- La distinzione fra **fedeltà** alla fonte e **verità** nel mondo: una sintesi può riprodurre fedelmente una fonte falsa, oppure aggiungere un fatto vero ma non sostenuto dal documento. Cercare paper che separi esplicitamente i due costrutti.
- Omissione di negazioni, intervalli, popolazioni, condizioni e incertezza: trovare dati su quali qualificatori spariscono più spesso e se l'omissione è conteggiata come errore dagli annotatori.
- Affidabilità dell'annotazione: numero di annotatori, formazione, accordo inter-annotatore, adjudication, granularità del claim e quota di casi ambigui. Un LLM-as-judge non deve essere presentato come ground truth senza validazione umana.
- Metriche automatiche confrontate con giudizi umani: entailment/NLI, QA-based, overlap e judge model; documentare falsi positivi/falsi negativi e dipendenza dal dominio.
- Esito operativo del beat: una griglia a quattro stati da incarnare nell'analisi narrativa — sostenuto, contraddetto, non sostenuto, sostenuto solo con qualificatore — senza trasformarla in lista puntata nella prosa finale.

### Beat 4 — «Il bias non nasce in un punto solo»

**Core question:** Quando due formulazioni quasi equivalenti ricevono trattamenti diversi, in quale tratto della catena si è prodotta l'asimmetria?
**Audience tag:** [ALL]
**Word count target:** 950 parole
**Funzione narrativa:** Hook → Complicate → Resolve parziale. Aprire su una coppia controllata che differisce per un solo marcatore sociale o linguistico; seguire la differenza attraverso dati, proxy, obiettivo, prompt, decoding e decisione d'uso. Chiudere senza ridurre il bias a una proprietà morale del modello.
**Key facts che il Researcher deve trovare:**

- Un audit primario LLM con disegno matched-pair o matched-guise — per esempio su dialetto, genere, razza o altra categoria — che pubblichi prompt/stimoli, modelli/versioni, numero di prove, metrica, dimensione dell'effetto e intervalli.
- Se si usa lo studio sul pregiudizio linguistico verso l'inglese afroamericano, verificare titolo, autori, sede/data, corpora, modelli, distinzione fra atteggiamenti espliciti e occulti, task downstream e limiti di trasferibilità ad altre lingue e società.
- Per il caso scelto, separare: distribuzione nei dati; scelte di annotazione; proxy usato dal benchmark; objective/alignment; variazione stocastica; soglia o decisione del sistema che converte l'output in conseguenza.
- Base rate e controfattuale: stessa richiesta salvo il marcatore studiato, numero di repliche/seed e test statistico. Vietato inferire discriminazione sistematica da due screenshot isolati.
- Un risultato positivo o mitigazione misurata nello stesso studio — prompting, fine-tuning, filtering, counterfactual data, refusal o policy — insieme al degrado su utilità, accuratezza o coverage.
- Differenza fra bias rappresentazionale (come un gruppo viene descritto) e allocativo (quale opportunità o risorsa riceve); non attribuire danno allocativo a un test puramente testuale se nessuna decisione reale è stata presa.
- Guardia di portata: un audit in inglese americano, su modelli e prompt datati, non dimostra lo stesso effetto in italiano o in ogni modello; spiega però un metodo per cercare asimmetrie controllate.

### Beat 5 — «La sicurezza della voce»

**Core question:** Che rapporto esiste fra il tono sicuro di una risposta, la probabilità che sia corretta e la pressione conversazionale a dare ragione all'utente?
**Audience tag:** [GENERAL]
**Word count target:** 950 parole
**Funzione narrativa:** Establish → Complicate. Mettere accanto risposta, confidenza dichiarata e correttezza; introdurre poi una falsa premessa dell'utente che sposta la risposta. Mostrare che calibrazione e sicofanzia sono problemi distinti che possono produrre la stessa superficie verbale.
**Key facts che il Researcher deve trovare:**

- Studio primario sulla calibrazione degli LLM: modello/versione, task, definizione di confidenza, metodo di elicitation, numero di esempi, reliability diagram o expected calibration error, confronto fra probabilità interne e verbalizzate.
- Separare sicurezza stilistica, probabilità assegnata ai token, probabilità dichiarata e frequenza empirica di correttezza. Trovare una fonte che mostri dove queste misure coincidono o divergono.
- Esperimento primario di sicofanzia: prompt con opinione o premessa falsa, controllo senza pressione, modelli, campione, tasso di accordo/cambio di risposta e protocollo. Conservare la formulazione precisa senza trasformare l'assecondare in intenzione di compiacere.
- Un caso in cui il modello possiede o produce inizialmente la risposta corretta e la modifica dopo il dissenso dell'utente; verificare che non cambi anche il contenuto informativo del prompt.
- Effetti di RLHF/instruction tuning soltanto se isolati da un confronto credibile; non attribuire la sicofanzia genericamente all'allineamento sulla base di correlazioni fra modelli diversi.
- Astensione e threshold: accuratezza condizionata sulle risposte, coverage, rischio selettivo e costo dei falsi rifiuti. Una macchina che non risponde mai non allucina, ma non è utile.
- Bilanciamento: alcuni modelli mostrano informazione utile sulla propria probabilità di correttezza in setup specifici; il punto è che il lettore non può ricavarla automaticamente dal tono della frase.

### Beat 6 — «Le correzioni che spostano il rischio»

**Core question:** Retrieval, citazioni, richieste di verifica e astensione eliminano l'errore oppure cambiano soltanto il punto in cui può entrare?
**Audience tag:** [GENERAL]
**Word count target:** 1000 parole
**Funzione narrativa:** Resolve → Complicate → Resolve parziale. Riprendere la sintesi iniziale e aggiungere, una alla volta, fonte recuperata, citazione e verifica del claim; misurare il guadagno e mostrare il residuo di ciascun intervento.
**Key facts che il Researcher deve trovare:**

- Studio primario su retrieval-augmented generation o grounding con confronto controllato a modello chiuso: dataset, retriever, corpus/data cutoff, generatore, metrica di factuality, accuratezza e casi in cui il documento giusto non viene recuperato.
- Scomposizione della pipeline: query → retrieval → ranking → contesto → sintesi → citazione → verifica. Per ogni passaggio, trovare almeno un failure mode documentato; non occorre narrarli tutti, ma il dossier deve impedirne la fusione in “RAG risolve le allucinazioni”.
- Benchmark o paper sulla qualità delle citazioni — per esempio ALCE o alternativa — che separi *citation correctness/entailment*, *citation completeness/recall* e qualità della risposta. Verificare se una citazione reale sostiene davvero la frase a cui è appesa.
- Un confronto fra self-correction non assistita e verifica con evidenza esterna o tool deterministico; collegarsi al Capitolo 6 solo per ricordare che un secondo testo dello stesso modello non è una fonte indipendente.
- Dati su astensione o selective prediction: variazione di error rate e coverage al cambiare della soglia, costo dei falsi rifiuti e dominio in cui il trade-off è misurato.
- Rischi residui: fonte autorevole ma vecchia, documento irrilevante recuperato, citazione parziale, cherry-picking, istruzione fuorviante nel contesto, judge model che condivide l'errore. Prompt injection va nominata al massimo in una riga di continuità col Capitolo 7.
- Risultato positivo da preservare: almeno una condizione in cui grounding/citazioni riducono sostanzialmente errori o migliorano verificabilità, con lo stesso modello e la stessa metrica quando possibile.
- Distinzione fra risposta verificabile e risposta verificata: rendere visibili fonti e quote facilita il controllo, ma non dimostra da solo che qualcuno abbia controllato né che tutte le frasi siano coperte.

### Beat 7 — «Una sintesi con ricevuta»

**Core question:** Quale procedura permette al lettore di usare una sintesi senza consegnarle il diritto di stabilire da sola che cosa è vero?
**Audience tag:** [ALL]
**Word count target:** 1000 parole
**Funzione narrativa:** Resolve → Land. Tornare alla coppia fonte–sintesi dell'apertura; ricostruire una versione corretta in cui ogni claim conserva perimetro, prova e grado d'incertezza. Trasformare la cautela in una competenza e posare il primo mattone della co-intelligenza del Capitolo 9 senza annunciarlo con una domanda retorica.
**Key facts che il Researcher deve trovare:**

- Un protocollo autorevole e praticabile di fact-checking, evidence grading o claim verification adattabile al lettore non tecnico: claim atomico, fonte primaria, data, popolazione/contesto, supporto, conferma indipendente, incertezza e decisione.
- Una dimostrazione completa sul caso d'apertura: testo originale, claim atomizzati, qualificatore perso, versione corretta e indicazione precisa della fonte. La correzione deve preservare ciò che la sintesi faceva bene, non sostituirla con l'intero documento.
- Evidenza sui limiti umani: automation bias, anchoring o difficoltà di verificare testi fluidi. Usare uno studio con N, task, confronto e dimensione dell'effetto; non concludere che gli umani siano sempre peggiori o sempre migliori.
- Una regola di proporzionalità da incorporare nella scena: bassa posta e claim facilmente reversibile → controllo leggero; informazione recente o contestata → doppia fonte e data; decisione medica, legale, finanziaria o pubblica → fonte primaria, professionista responsabile e nessuna delega finale al modello.
- Indicatori che devono far salire il livello di verifica: assenza di fonti, citazioni non accessibili, numero molto preciso senza denominatore, causalità da correlazione, popolazione allargata, informazione temporalmente instabile, risposta che segue la premessa dell'utente.
- Azione finale del lettore, mostrata e non elencata nella prosa: delimitare un claim, aprire la fonte, ritrovare la frase o il dato, ripristinare il qualificatore, segnare ciò che resta ignoto e decidere solo allora quanto usare la sintesi.
- Ponte concettuale al Capitolo 9: il contributo umano non è aggiungere “intuizione” mistica né correggere ogni parola a valle, ma fissare domanda, perimetro, costo dell'errore, evidenza accettabile e responsabilità della decisione.
- Chiusura non echeggiante: l'ultima immagine deve essere la riga originale e la riga corretta affiancate, con il qualificatore ripristinato e la fonte ancora aperta; nessun decalogo, nessun “davanti al prossimo annuncio”, nessuna domanda sul capitolo successivo.

## REVIEWER READINESS NOTES

### Tension points

1. **Basta una parola per cambiare la conoscenza.** “Associato” diventa “causa”, “può” diventa “dimostra”, una popolazione locale diventa “le persone”: la sintesi resta fluida mentre il suo statuto epistemico cambia.
2. **La risposta può essere utile e infedele nello stesso momento.** Condensare richiede scegliere; togliere dettagli è il servizio della sintesi, ma il dettaglio tolto può essere proprio ciò che separa evidenza e slogan.
3. **La sicurezza della voce non porta una garanzia incorporata.** Il lettore sente una frase uniforme anche quando il modello ha incontrato evidenza solida, frammentaria o nessuna evidenza; la posta è non confondere stile, confidenza e correttezza.
4. **Correggere un errore può crearne un altro.** Più astensione riduce risposte false ma anche copertura; retrieval porta fonti ma può recuperare quella sbagliata; citazioni aiutano il controllo ma possono decorare claim non sostenuti.
5. **Il bias è una catena, non un carattere.** Una differenza piccola nel testo può diventare grande solo quando viene collegata a una soglia o decisione; localizzare l'anello serve più che attribuire intenzioni alla macchina.
6. **L'umano non è automaticamente il correttore ideale.** Fluidità, fretta e conferma delle proprie opinioni possono ridurre il controllo; il capitolo deve dare al lettore una procedura che produca evidenza, non soltanto l'invito generico a “pensare criticamente”.

### Key chains da rendere esplicite

- Fonte cauta → compressione seleziona alcuni dettagli → qualificatore cade → claim diventa più generale o causale → il lettore cambia decisione sulla base di una forza probatoria che la fonte non aveva.
- Obiettivo di previsione dei token + prompt che richiede una risposta → continuazione plausibile → nessun vincolo necessario di provenienza → claim fluido ma non sostenuto → verifica esterna richiesta.
- Documento sorgente → claim atomico → confronto semantico → sostenuto / contraddetto / non sostenuto / limitato da qualificatore → correzione tracciabile.
- Distribuzione dei dati + scelte di annotazione e obiettivo → associazione statistica asimmetrica → output differente su stimoli matched-pair → soglia o uso downstream → possibile danno rappresentazionale o allocativo.
- Premessa o preferenza dell'utente → contesto sposta la distribuzione → risposta converge verso l'utente → tono resta sicuro → sicofanzia scambiata per conferma indipendente.
- Confidenza dichiarata → soglia di astensione → meno risposte e maggiore accuratezza condizionata in alcuni regimi → falsi rifiuti e perdita di utilità → soglia scelta in base alla posta.
- Query → retriever → documenti → sintesi → citazione → claim: miglioramento possibile a ogni passaggio, ma anche nuovo failure mode → provenienza visibile non equivale ancora a correttezza verificata.
- Claim ad alta posta → fonte primaria + data + popolazione + conferma indipendente + esperto responsabile → decisione proporzionata; claim a bassa posta e reversibile → costo di verifica più leggero.
- Sintesi iniziale → audit del lettore → qualificatore ripristinato → incertezza residua resa visibile → uso consapevole dell'output → base operativa della co-intelligenza del Capitolo 9.

### Risk proportionality guards

- **Tassi di overclaim:** specificare unità d'analisi, corpus, modelli, prompt, periodo e intervalli. Il 26%–73% non va presentato come quota di tutte le risposte IA, e l'odds ratio 4,85 non va tradotto in “4,85 volte più errori” senza verificare outcome e modello statistico.
- **Allucinazione:** il termine descrive un rapporto difettoso fra claim ed evidenza, non una percezione cosciente né necessariamente una falsità intenzionale. Affiancare ai fallimenti la quota di risposte corrette e i domini in cui il sistema è utile.
- **Meccanismo:** la previsione del prossimo token è una condizione architetturale, non una spiegazione causale sufficiente di ogni errore. Conservare dati, fine-tuning, prompt, decoding, retrieval e valutazione come anelli distinti.
- **Bias:** distinguere differenza statistica, stereotipo testuale, disparità di prestazione e danno reale. Un benchmark matched-pair dimostra un'asimmetria nel setup; non quantifica automaticamente discriminazione sociale nel mondo.
- **Gruppi e lingue:** non universalizzare risultati statunitensi o anglofoni. Dichiarare popolazione, lingua, categoria, contesto storico e trasferibilità ignota; evitare di riprodurre più materiale offensivo di quanto sia strettamente necessario.
- **Confidenza:** tono assertivo, probabilità dei token, self-report e calibrazione empirica non sono intercambiabili. Un modello ben calibrato su un benchmark può esserlo meno dopo cambio di dominio o aggiornamento.
- **Sicofanzia:** “asseconda” è descrizione comportamentale. Non implica desiderio di compiacere, inganno o convinzione; bilanciare con condizioni in cui il modello resiste alla premessa falsa.
- **Retrieval e citazioni:** possono migliorare factuality e verificabilità, ma dipendono da corpus, ranking, aggiornamento e copertura. Una fonte esistente non garantisce entailment; una fonte autorevole può essere superata o fuori contesto.
- **Astensione:** meno errori può significare meno risposte. Riportare sempre coverage, falsi rifiuti e costo d'uso accanto all'accuratezza condizionata.
- **Self-correction:** una seconda generazione può aiutare, ma non è conferma indipendente se usa gli stessi pesi e la stessa evidenza. Valorizzare verificatori esterni e test deterministici quando il task li consente.
- **Rischi ad alta posta:** casi medici, legali, finanziari, occupazionali o civici richiedono fonti specifiche e contesto professionale. Il modello non va presentato come decisore finale, e il capitolo non offre consulenza di dominio.
- **Fattori umani:** automation bias non rende l'umano inutile né infallibile. Specificare partecipanti, task, tempo ed evidenza mostrata; la procedura deve ridurre il carico di controllo, non scaricare sul lettore una verifica infinita.
- **Temporalità:** prezzi, prodotti, norme, cariche e risultati dei modelli cambiano. Ogni claim instabile conserva data e versione; evitare leaderboard correnti come prova di un meccanismo generale.
- **Consiglio al lettore:** il livello di verifica cresce con impatto, irreversibilità, instabilità e opacità della fonte. Non chiedere lo stesso audit per una curiosità innocua e per una decisione che incide su salute, diritti o denaro.

## RESEARCHER BRIEF

### Web search terms — query esatte

1. `site:royalsocietypublishing.org "10,000" summaries "10 models" overclaim`
2. `site:royalsocietypublishing.org AI generated summaries overclaim 26% 73%`
3. `"odds ratio" "4.85" overclaim large language model summaries`
4. `"10,000 summaries" "overclaim" language models`
5. `Royal Society large language models scientific summarization overgeneralization supplementary data`
6. `Royal Society LLM summaries correlation causation certainty population overclaim dataset`
7. `site:osf.io OR site:github.com Royal Society overclaim LLM summaries dataset code`
8. `autoregressive language model next token objective factuality provenance primary paper`
9. `language model abstention answer rate accuracy false premise controlled experiment`
10. `"TruthfulQA: Measuring How Models Mimic Human Falsehoods" exact results dataset`
11. `"FActScore: Fine-grained Atomic Evaluation of Factual Precision" exact results`
12. `"SimpleQA" factuality benchmark human agreement abstention exact results`
13. `long form factuality benchmark claim level unsupported contradicted language models`
14. `survey hallucination definition intrinsic extrinsic factuality faithfulness primary sources`
15. `summarization factual consistency dataset span level annotations source output examples`
16. `"TRUE: Re-evaluating Factual Consistency Evaluation" summarization metrics`
17. `summarization omission qualifier uncertainty causal language overclaim study`
18. `LLM as judge factuality human agreement false positive unsupported claims primary paper`
19. `"Dialect prejudice predicts AI decisions" language models African American English`
20. `LLM matched guise dialect bias employability criminality Nature 2024`
21. `"BBQ: A Hand-Built Bias Benchmark for Question Answering" exact results`
22. `language model counterfactual fairness matched pair prompt bias audit primary paper`
23. `LLM bias mitigation utility tradeoff counterfactual data prompting primary study`
24. `"Language Models (Mostly) Know What They Know" calibration exact results`
25. `language model verbalized confidence expected calibration error primary study`
26. `LLM selective prediction abstention risk coverage curve factual questions`
27. `language model sycophancy false premise user opinion controlled experiment`
28. `"Discovering Language Model Behaviors with Model-Written Evaluations" sycophancy`
29. `"Simple synthetic data reduces sycophancy in large language models" exact results`
30. `retrieval augmented generation factuality hallucination controlled comparison primary paper`
31. `RAG retrieval failure wrong document factuality benchmark primary study`
32. `"ALCE" enabling large language models to generate text with citations citation correctness completeness`
33. `language model citations entailment completeness human evaluation primary paper`
34. `self correction language models without external feedback factuality study`
35. `LLM verification external evidence versus self critique controlled experiment`
36. `automation bias fluent AI summaries fact checking human experiment`
37. `human reliance language model explanations citations accuracy randomized study`
38. `professional fact checking claim evidence source date population protocol`
39. `2025 2026 LLM hallucination factuality calibration retrieval primary study`
40. `2025 2026 scientific summarization overclaim generative AI replication`

### Document types da prioritizzare

- Paper primario Royal Society, eventuale preprint, supplementi, codebook di annotazione, dataset riga per riga e codice statistico. Il comunicato stampa può orientare la ricerca, ma numeri e categorie devono provenire dalla pubblicazione e dai materiali associati.
- Paper primari e appendici dei benchmark di factuality/fedeltà, con dataset card, esempi grezzi, rubriche degli annotatori, accordo inter-annotatore e codice degli evaluator.
- Output versionati e artefatti riproducibili: prompt, checkpoint/API datata, parametri di decoding, seed, accesso a web/retrieval, log e ID dell'esempio. Screenshot senza provenance servono solo come pista.
- Audit peer-reviewed di bias con disegno matched-pair/matched-guise, preregistrazione quando disponibile, materiali degli stimoli, analisi statistica e limiti di validità esterna. Privilegiare l'audit che isola una variabile invece di classifiche aggregate di modelli.
- Paper primari su calibrazione, selective prediction, astensione e sicofanzia; recuperare reliability diagram, risk–coverage curve, prompt di controllo, versioni dei modelli e ablation.
- Paper e repository ufficiali su RAG, grounding e generazione con citazioni; distinguere retrieval recall, answer correctness, citation entailment, citation completeness e human usefulness.
- Repliche indipendenti, critique paper e benchmark cross-domain che mostrino quando un risultato non si trasferisce. Conservare i conflitti in `[CONFLICT]` anziché mediare numeri incompatibili.
- System card/model card e documentazione del produttore per comportamento e mitigazioni dichiarate; triangolare prestazioni e rischi con audit indipendenti. Una pagina di prodotto non è prova sufficiente di efficacia.
- Studi human-factors randomizzati o controllati su reliance, automation bias, fact-checking e uso delle citazioni; privilegiare comportamento osservato rispetto a intenzioni dichiarate in survey.
- Manuali o standard autorevoli di fact-checking/evidence grading per la procedura finale; distinguere standard professionali, raccomandazioni volontarie e risultati sperimentali.
- Articoli giornalistici autorevoli solo per contesto e casi pubblici con documenti accessibili. Post social, demo aziendali e raccolte di “risposte assurde” non reggono claim di frequenza o meccanismo.
- Per ogni claim centrale applicare la triangolazione su almeno due fonti indipendenti; dettagli non verificabili dopo il protocollo vanno marcati `[BLOCKED: needs human input — descrivere cosa manca]`.

### Fatti, date, nomi e numeri da cacciare

- Studio Royal Society: titolo, autori, affiliazioni, rivista, data, DOI, preprint, modelli esatti e date/versioni, numero di documenti di partenza, numero di output per modello, totale 10.000, prompt, discipline, sampling, annotatori o evaluator, categorie di overclaim, 26%–73%, odds ratio 4,85, intervalli, p-value se pertinente, baseline e limiti.
- Per l'esempio d'apertura: ID del documento/output, frase fonte, frase sintetizzata, parola o qualificatore cambiato, categoria assegnata, consenso degli annotatori e licenza che consenta la citazione breve. Se nessun esempio è pubblico, documentare il blocco.
- Che cosa ha come outcome l'odds ratio 4,85 e quale confronto rappresenta; non convertirlo in rischio relativo. Recuperare modello statistico, covariate, cluster/repeated measures e intervallo di confidenza.
- Benchmark factuality scelto: autori, anno, dataset size, domini, data cutoff, modelli, prompt, decoding, unità atomica, evaluator, accordo umano, baseline, risultati e failure modes; congelare la versione della leaderboard se usata.
- Tassonomia: formulazioni originarie di intrinsic/extrinsic hallucination, unsupported/contradicted claim, factuality/faithfulness e omission/overclaim; annotare quali termini sono contestati o sovrapposti.
- Per una fonte–sintesi annotata: documento completo, lunghezza, output, span di evidenza, giudizio per claim e casi ambigui. Cercare negazioni, numeri, popolazioni, causalità e modalità epistemica perse.
- Obiettivo autoregressivo: paper/documentazione, equazione da tradurre senza mostrarla necessariamente, training versus decoding, ruolo di temperatura/top-p e prova che provenienza non è incorporata nel token generato.
- Astensione: answer rate/coverage, accuratezza o risk fra le risposte, soglia, falsi rifiuti, calibrazione e shift di dominio. Non riportare “accuracy aumenta” senza dire quante domande restano senza risposta.
- Audit di bias scelto: autori, anno, lingua, gruppi, costruzione degli stimoli, numero di coppie, modelli/API e date, repliche/seed, effect size, intervalli, correzione per confronti multipli, task espliciti/occulti e limiti.
- Per ogni outcome di bias, identificare se è descrizione testuale, classificazione, ranking, raccomandazione o decisione; distinguere potenziale impatto da decisione realmente eseguita.
- Calibrazione: probabilità interna o dichiarata, binning, ECE/Brier score o metrica usata, reliability plot, numero di task, risultati in-domain e out-of-domain e stabilità dopo instruction tuning.
- Sicofanzia: paper, autori, anno, prompt e controlli, campione, modelli, tasso di cambio da corretto a errato o di accordo con l'utente, effetto del fine-tuning e mitigazione con relativo costo.
- RAG/grounding: corpus, cutoff, retriever, top-k, recall del documento rilevante, generatore, lunghezza del contesto, factuality, answer accuracy, citation entailment/completeness e ablation senza retrieval.
- Citazioni: quota di claim coperti, quota di citazioni realmente entailment-supporting, URL/DOI validi, fonte primaria versus secondaria e comportamento quando nessuna fonte adeguata viene recuperata.
- Self-correction: numero di passaggi, feedback disponibile, stesso o diverso modello, guadagno medio, regressioni introdotte e confronto con verifica esterna. Separare revisione stilistica da correzione fattuale.
- Fattori umani: autori, anno, N, expertise, task, randomizzazione, qualità iniziale degli output, tempo, presenza di fonti, tasso di adozione dell'errore, accuratezza finale e condizioni che migliorano il controllo.
- Procedura di verifica: organizzazione/autore, versione e data; definizione di fonte primaria, corroborazione, conflitto, incertezza e aggiornamento. Verificare che sia applicabile a una sintesi, non soltanto a immagini o contenuti social.
- Ogni numero deve conservare denominatore, unità d'analisi, modello/versione, data, dominio, prompt e metrica. Ogni confronto tra modelli deve controllare o dichiarare differenze di accesso a retrieval, budget, decoding ed evaluator.

## TARGET

**Word count:** 6650 parole; il PRD non fissa una lunghezza numerica, quindi il target mantiene la scala di 6600–7000 parole adottata dal progetto ed è la somma di sette beat entro il vincolo di 800–1200 parole.

**Opening hook strategy:** Aprire su due righe quasi identiche — la frase cauta di una fonte scientifica e la sua sintesi più sicura — facendo vedere il qualificatore scomparso prima di nominare il modello o l'errore.

**Closing beat promise:** Chiudere sulle stesse due righe dopo l'audit, con il qualificatore ripristinato e la fonte aperta, così che il lettore senta di poter usare una sintesi senza cederle l'autorità sulla prova.
