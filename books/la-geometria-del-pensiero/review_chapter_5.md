# Review — Capitolo 5: «Dall'Addestramento alla Conversazione»

## 1. Executive Summary

Capitolo solido, con la miglior spina dorsale fattuale vista finora nel progetto: ogni numero è tracciabile al dossier, i denominatori sono protetti, le fonti confuse dalla letteratura secondaria (1,3B vs 85 ± 3%) sono esplicitamente separate. La sequenza causale richiesta dalla struttura è integra e i sette beat ci sono tutti.
Tre difetti reali, tutti correggibili senza riscrittura: **(a)** il template ChatML era duplicato verbatim fra Beat 3 e Beat 5, bruciando la rivelazione del Beat 5; **(b)** due gruppi di ricerca diversi erano entrambi introdotti come «Gao e colleghi … 2023»; **(c)** il Beat 7 apriva un frame — «mettiamo la risposta sulla Luna sotto esame: da dove viene?» — e non lo eseguiva mai.
Il problema di voce è quantificabile e diffuso: 11 auto-riferimenti a «questo capitolo» e 20 costruzioni deontiche impersonali («Va detto», «Si noti», «Bisogna essere espliciti»). Ogni transizione era fatta annunciando una mossa editoriale invece di compierla. È il registro di una sezione metodi, non di Alberto Angela.
Le contro-obiezioni sono due, forti e sostenute da evidenza: passa.
Il lettore finisce pensando «l'ho visto» nel Beat 1 e nel Beat 6, e «me l'hanno spiegato bene» nei Beat 2 e 4.

## 2. Score

| # | Dimensione | Punteggio |
|---|---|---|
| 1 | Narrative & Structure | 7/10 |
| 2 | Language, Style & Voice | 6/10 |
| 3 | Factual Accuracy | 9/10 |
| 4 | Audience Alignment | 8/10 |
| 5 | Sensory & Emotional Engagement | 7/10 |
| 6 | Originality & Angle | 8/10 |
| | **TOTALE** | **45/60** |

**→ REVIEWER_CORRECTIONS** (soglia 36–47). Paragrafi identificati riscritti direttamente in `chapter_5.md`.

## 3. Detailed Findings by Section

### Beat 1 — «Due risposte allo stesso invito»

Il miglior beat del capitolo. Apre su un oggetto fisico datato e ispezionabile (pagina due, arXiv 4 marzo 2022, codice 2203.02155), mostra prima di nominare, e la gestione dei numeri è esemplare: *«Sono due risultati distinti, ottenuti in condizioni distinte, e questo capitolo non li fonderà in un'unica cifra a effetto.»*

Un solo difetto, ma è il tipo di difetto che il PRD prende di mira: **«Nessuna parola più lunga di quattro sillabe.»** La frase citata è *"People went to the moon, and they took pictures of what they saw, and sent them back to the earth so we could all see them."* La parola più lunga ha **due** sillabe. L'osservazione ha la forma della precisione e il contenuto di zero: nessuna parola in quella frase si avvicina alle quattro sillabe. La persona impone «Non intensifico — specifico»; questa è una specificità finta. **Corretto.**

### Beat 2 — «Prima dell'assistente: il modello base»

Il paletto concettuale — *«L'obiettivo di addestramento premia la previsione del testo osservato. Non premia la verità di ciò che viene affermato»* — è perfettamente collocato e rende il capitolo.

Due problemi. Il primo, di registro: **«Si noti una cosa che quasi tutti i resoconti divulgativi sbagliano»** è letteralmente la costruzione che la STYLE_BIBLE vieta al § Persona («registro accademico distaccato: "si osserva che…"»). **Corretto.**

Il secondo, di dosaggio: *«175 miliardi di parametri distribuiti su 96 strati di attenzione, 96 teste per strato, una dimensione di embedding di 12.288, un vocabolario Byte-Pair Encoding di 50.257 token e … una finestra di contesto di 2.048 token»* — cinque specifiche in un respiro, di cui una sola (2.048) viene poi usata narrativamente. Il PRD nomina «il manuale tecnico impenetrabile» come nemico; questa riga ci si avvicina. **Alleggerito.**

### Beat 3 — «Le dimostrazioni»

Apriva con **«Immaginiamo il gesto più umile dell'intera industria: una persona seduta davanti a un modulo»**. Il Mandato Sensoriale è esplicito: «Nessuna scena "generica" ambientata in un non-luogo senza tempo». *Immaginiamo* + *una persona* + *un modulo* è esattamente il non-luogo. E il materiale per ancorarla c'era già nel dossier, due paragrafi più sotto (Upwork, Scale AI). **Corretto.**

Materiale eccellente sprecato: *«Quaranta persone»* e il dato sull'accordo (72,6 ± 1,5%) sono il momento emotivamente più forte del beat, e arrivano dopo una scena inventata invece che dentro una scena reale.

### Beat 4 — «Quando una preferenza diventa un numero»

Il cuore analitico, e regge. Due mosse originali che nessun'altra divulgazione fa: la penalità KL letta come *«una confessione tecnica travestita da dettaglio implementativo»*, e la curva di Gao come *«la legge di Goodhart, misurata su una curva»*.

Tre rilievi:

1. **Apertura in un non-luogo**, come il Beat 3: «Sullo schermo del valutatore compaiono…». **Corretto** ancorandola agli stessi contractor già presentati e a K fra 4 e 9.
2. **Antropomorfismo senza contrappeso**: *«il modello trova il modo di far salire il punteggio — anche a costo di smettere di parlare come parlava prima»*. «Trova il modo» è agentivo e il seguito non è meccanicistico. La regola è «entro lo stesso paragrafo o il successivo». **Corretto.**
3. **«è il cuore meccanico del capitolo»** e **«Il capitolo può ora porre la domanda che tiene insieme il resto»**: il testo esce dalla scena per commentare la propria architettura. **Corretto.**

### Beat 5 — «La conversazione è ancora una sequenza»

**Il difetto strutturale più grave del capitolo.** Il beat è costruito su una rivelazione: l'interfaccia sparisce e sotto resta una stringa. Ma la stringa — `<|im_start|>system…<|im_end|>…` — era già stata mostrata per intero, con la stessa fonte e quasi le stesse parole, in chiusura del Beat 3, quaranta righe prima. Il lettore arriva alla rivelazione avendola già vista. Due volte lo stesso oggetto, e la seconda è quella che doveva colpire. **Corretto**: il Beat 3 conserva solo la *funzione* dei delimitatori, la stringa resta unica nel Beat 5.

Secondo rilievo: la struttura chiedeva «un esperimento riproducibile con stesso modello, stesso prompt e più seed/temperature». Il capitolo *asseriva* la variabilità (*«Si può fare la stessa domanda due volte… e ricevere due risposte diverse»*) senza renderla controllabile. **Corretto**: ora la variabilità è derivata dal meccanismo (p = 0,9, divergenza che si amplifica) e resa falsificabile (seed diversi vs temperatura zero).

### Beat 6 — «Il caso che non esiste»

Il beat più riuscito sul piano emotivo, e la scelta di aprire con la sola riga di citazione — *Varghese v. China Southern Airlines Co., Ltd.*, 925 F.3d 1339 (11th Cir. 2019) — isolata sulla pagina è la mossa più efficace del capitolo.

La lettura di *«Upon double-checking»* — **«L'avvocato ha chiesto una verifica. Ha ricevuto la descrizione linguistica di una verifica»** — è la frase migliore del capitolo e da sola giustifica il beat.

Nessun difetto sostanziale. La proporzione è tenuta: la sanzione colpisce persone, il denominatore di TruthfulQA è protetto esplicitamente (*«TruthfulQA non misura quanto spesso un modello sbaglia: misura quanto spesso sbaglia su domande costruite per farlo sbagliare»*).

### Beat 7 — «Tre domande prima di fidarsi»

**Frame aperto e abbandonato.** Il beat apriva così: *«Torniamo… ai due riquadri, e mettiamo la risposta giusta — quella sulla Luna — sotto un tipo di esame che nessuna delle valutazioni descritte finora ha applicato. … Una domanda sola: da dove viene?»* — e poi passava immediatamente a quattro definizioni e tre strumenti, senza mai applicare la domanda alla frase sulla Luna. La STYLE_BIBLE è esplicita: «Lasciare un'analogia a metà» è tra i «What I never do». Il capitolo promette un esame e non lo esegue. **Corretto**: il test viene ora eseguito, e restituisce il risultato più utile possibile — la frase sulla Luna è *vera*, la citazione di *Varghese* è *falsa*, e dall'interno del meccanismo sono lo stesso evento.

Rilievo minore: la sezione «tre strumenti» è la parte più convenzionale del capitolo — struttura da survey (strumento / limite, ×3). È anche l'unica parte che potrebbe comparire in qualunque altro libro sull'IA.

### Trasversale — collisione di omonimi

**«Gao e colleghi»** introduce due gruppi di ricerca completamente diversi, entrambi nel 2023: Leo Gao (OpenAI, *Scaling Laws for Reward Model Overoptimization*, ICML) e Tianyu Gao (Princeton, ALCE, EMNLP). Nessun lettore può accorgersene, e ogni lettore attento concluderà che si tratta dello stesso team che torna. È un errore di attribuzione a tutti gli effetti. **Corretto** con nome proprio e nota esplicita.

## 4. Persona Audit

**Verdetto: deriva reale e misurabile, su prosa di base buona.**

La persona è «in piedi accanto a una persona, in un momento preciso». Nel capitolo consegnato, la voce è invece seduta a un tavolo di redazione e commenta le proprie scelte ad alta voce:

- **11 occorrenze** di auto-riferimento al capitolo come oggetto: *«questo capitolo non li fonderà»*, *«la posta in gioco… regge l'intero capitolo»*, *«il cuore meccanico del capitolo»*, *«il paletto concettuale più importante del capitolo»*, *«Il capitolo può ora porre la domanda»*, *«una distinzione che questo capitolo ha costruito pezzo per pezzo»*.
- **20 costruzioni deontiche impersonali**: *Va detto*, *Va concesso*, *Va aggiunta*, *Va affrontata*, *Va sollevata*, *Bisogna essere espliciti*, *Bisogna essere brutali*, *Conviene separare*, *Si noti*, *Ne segue*.

Circa tre annunci di regia per beat. L'effetto è che quasi ogni transizione avviene per dichiarazione («adesso sollevo l'obiezione») invece che per movimento narrativo. Alberto Angela non dice «questo documentario».

**Ciò che invece funziona e va difeso:** la variazione di lunghezza prescritta è reale e ben eseguita — *«Preferito lo stesso.»*, *«Quaranta persone.»*, *«Duemila token.»*, *«Metà.»*, *«Nient'altro.»* Questi colpi brevi sono voce autentica, non maniera. Nessuna delle 10 frasi vietate compare. Nessuna metafora canonica di altri capitoli viene rubata — vincolo rispettato, come prescriveva il pre-flight («nessuna analogia canonica assegnata al Capitolo 5»).

**Dopo correzioni:** auto-riferimenti da 11 a 4 (i residui sono onesti — delimitano la portata probatoria del testo davanti al lettore), regia accademica rimossa nei punti di giuntura.

## 5. Counter-Objection Check

**Requisito: ≥2, in forma forte, con risposta basata su evidenza. → PASSA, con margine.**

**Obiezione 1 (Beat 4) — RLHF come vernice cosmetica.**
Forma: *«Se il feedback umano è un proxy rumoroso, ottimizzabile fino a rompersi, prodotto da quaranta persone che non sono d'accordo fra loro un quarto delle volte — allora non è tutto questo apparato una vernice cosmetica, che rende le risposte più gradevoli senza renderle migliori?»*
È la versione forte, non una caricatura, e il capitolo lo riconosce: *«Chi sostiene questo ha dalla sua l'intera curva di Gao.»* Risposta basata su misure (85 ± 3%, 134× più piccolo) e — decisivo — **delimitata**: *«nessuno di quei numeri dice quanto spesso InstructGPT avesse ragione.»* Questa è la risposta di un divulgatore onesto, non di un avvocato.

**Obiezione 2 (Beat 6) — è colpa dell'avvocato.**
Forma: *«non è colpa dell'avvocato? Ha usato uno strumento senza sapere cosa fosse e non ha controllato le fonti, cosa che si insegna dal primo anno di giurisprudenza.»*
Concessa in gran parte (*«L'obiezione è forte e in gran parte fondata»*), con la prova a sostegno: la sanzione colpisce persone, non software. Poi ricomposta in catena senza scaricare la responsabilità su un anello solo. Esattamente ciò che il tension point #4 della struttura chiedeva.

**Bonus — due auto-limitazioni non richieste ma di alto valore:** la cautela sul Beat 1 (*«Chi ricorda solo la scena e dimentica il denominatore ha ricordato la parte meno solida»*) e il rovescio della medaglia nel Beat 7, che impedisce all'elenco di limiti di diventare disinformativo quanto l'entusiasmo che corregge.

**Unica lacuna:** manca l'obiezione simmetrica sui labeler — «quaranta contractor non sono l'umanità» è sollevata, ma nessuno chiede *quale alternativa scalabile esista*. Il capitolo lascia intendere che il campione sia un difetto senza riconoscere che non è noto un modo migliore. Opzionale.

## 6. Priority Improvements

### Critical — *applicati*
1. **Duplicazione verbatim del template ChatML** (Beat 3 / Beat 5). La rivelazione del Beat 5 arrivava già consumata.
2. **Frame del Beat 7 aperto e mai eseguito.** Il capitolo prometteva un test e passava ad altro.
3. **Due «Gao e colleghi» diversi** presentati in modo indistinguibile.

### Important — *applicati*
4. **Due beat su sette aprivano in un non-luogo** («Immaginiamo…», «Sullo schermo del valutatore…») in violazione del Mandato Sensoriale.
5. **Impalcatura saggistica pervasiva**: 11 auto-riferimenti + 20 costruzioni deontiche.
6. **Antropomorfismo senza contrappeso** in «il modello trova il modo di far salire il punteggio».
7. **Precisione finta**: «nessuna parola più lunga di quattro sillabe» (la più lunga ne ha due).
8. **Variabilità di decodifica asserita, non resa verificabile** (Beat 5).

### Optional — *non applicati, per il prossimo passaggio*
9. **Word count**: 7.046 parole contro il target 6.600–6.900 della struttura. Il draft ricevuto era già a 6.940; dopo la chiusura del frame del Beat 7 e i tagli compensativi il residuo è +146. Recuperabile alleggerendo la sezione «tre strumenti» del Beat 7, che è la più convenzionale.
10. **Beat 7, sezione mitigazioni**: struttura da survey (strumento/limite ×3). È l'unica parte del capitolo che non suona come questo libro.
11. **Obiezione mancante sui labeler**: sollevare «e quale sarebbe l'alternativa scalabile?» rafforzerebbe la sezione invece di indebolirla.
12. **Terza ripetizione del dato 85 ± 3%** ridotta a due; la seconda (Beat 4) resta legittima come callback.

## 7. Rewritten Paragraphs

### Rewrite 1 — Beat 5 / Beat 3: la duplicazione del template

**Original** (chiusura Beat 3):
> C'è un dettaglio materiale che rende tangibile tutto questo, e sta nei delimitatori. Perché un modello possa distinguere chi sta parlando, i turni vengono marcati da token speciali dentro un'unica sequenza di testo. La documentazione ufficiale di Hugging Face sui chat template mostra il formato ChatML nella sua nudità: `<|im_start|>system\n...<|im_end|>\n<|im_start|>user\n...<|im_end|>\n<|im_start|>assistant\n...<|im_end|>`. Sistema, utente, assistente. Tre ruoli che a schermo diventano tre colori di bolla, e nel modello sono tre stringhe di controllo in mezzo al testo.

**Rewritten:**
> C'è un dettaglio materiale che rende tangibile tutto questo, e sta nei delimitatori. Perché un modello distingua chi sta parlando, chi ha scritto il dataset deve marcare i turni: un segno prima del messaggio di sistema, uno prima di quello dell'utente, uno prima della risposta dell'assistente. Sono token come tutti gli altri, estratti dallo stesso vocabolario, e al modello arrivano dentro un'unica sequenza piatta. La distinzione fra chi chiede e chi risponde, nel materiale di addestramento, non è una struttura: è punteggiatura.

**Why:** Il Beat 5 è costruito su una rivelazione — l'interfaccia sparisce, sotto resta una stringa — e quella rivelazione richiede che il lettore veda la stringa *lì*. Mostrandola già in chiusura di Beat 3, con la stessa fonte e quasi le stesse parole, il capitolo spendeva due volte lo stesso effetto e disinnescava il secondo. Il Beat 3 aveva bisogno solo della *funzione* dei delimitatori (che è ciò che la struttura gli assegnava: «ruolo del formato»); la stringa letterale appartiene al Beat 5. La chiusa «non è una struttura: è punteggiatura» sostituisce l'oggetto con un colpo breve, coerente con la cadenza della persona.

### Rewrite 2 — Beat 7: il frame aperto e abbandonato

**Original:**
> Torniamo per un momento alla pagina due del paper del 2022, ai due riquadri, e mettiamo la risposta giusta — quella sulla Luna — sotto un tipo di esame che nessuna delle valutazioni descritte finora ha applicato. Non "ti piace di più?". Non "è più utile?". Una domanda sola: da dove viene?
>
> Prima però servono quattro termini tenuti separati, perché vengono continuamente scambiati l'uno per l'altro. […]

**Rewritten:**
> Torniamo alla pagina due del paper del 2022, ai due riquadri, e sottoponiamo la risposta giusta — quella sulla Luna — a un esame che nessuna delle valutazioni descritte finora ha applicato. Non "ti piace di più?". Non "è più utile?". Una domanda sola: da dove viene?
>
> Eseguiamola davvero, perché è l'unico modo di vedere che cosa restituisce. Le persone sono andate sulla Luna e hanno scattato fotografie: il claim è vero e verificabile — ma non è il modello a renderlo tale. Di quei ventisei token si può risalire al riquadro, alla didascalia, al documento archiviato sotto il codice 2203.02155. Non si può risalire a nient'altro: nessun archivio consultato, nessuna fonte registrata, nessuna catena. La frase sulla Luna è vera e la citazione di *Varghese* è falsa, e dall'interno del meccanismo che le ha prodotte sono lo stesso evento — una traiettoria ad alta probabilità in uno spazio di token. La differenza sta fuori, e va cercata fuori.
>
> Per cercarla servono quattro termini tenuti separati, perché vengono continuamente scambiati l'uno per l'altro. […]

**Why:** Un capitolo che ha appena passato mille parole a dimostrare che il riconoscimento a vista non è disponibile non può poi annunciare un test e non eseguirlo — è la stessa scorciatoia che il capitolo rimprovera all'avvocato Schwartz. Eseguito, il test restituisce anche il risultato più prezioso possibile: la frase *vera* e la citazione *falsa* sono indistinguibili dall'interno del meccanismo. Questo trasforma una transizione verso un elenco di strumenti nella conclusione dimostrata che rende necessari quegli strumenti, e riaggancia il Beat 6 al Beat 1 chiudendo l'arco.

### Rewrite 3 — Beat 3: l'apertura nel non-luogo

**Original:**
> Immaginiamo il gesto più umile dell'intera industria: una persona seduta davanti a un modulo, che legge un prompt inviato da uno sconosciuto all'API di OpenAI e poi scrive, a mano, la risposta che secondo lei quel prompt meritava. Non corregge un modello. Non assegna un voto. Scrive la risposta da zero, come si scriverebbe un tema. Questo gesto, ripetuto su un dataset di 12.725 prompt di addestramento — le "circa 13k dimostrazioni" citate nel testo del paper — è il primo dei tre passaggi che separano il riquadro sbagliato dal riquadro giusto.

**Rewritten:**
> Il gesto più umile dell'intera industria è stato comprato su Upwork e Scale AI. Una persona reclutata lì apre un modulo, legge un prompt che uno sconosciuto ha inviato all'API di OpenAI — una richiesta di traduzione, una domanda su un farmaco, una lettera da riscrivere — e nel campo sotto scrive a mano la risposta che secondo lei quel prompt meritava. Non corregge un modello. Non assegna un voto. Scrive da zero, come si scriverebbe un tema. Quel campo di testo, riempito 12.725 volte — le "circa 13k dimostrazioni" citate nel testo del paper — è il primo dei tre passaggi che separano il riquadro sbagliato dal riquadro giusto.

**Why:** Il Mandato Sensoriale vieta la scena generica in un non-luogo senza tempo, e «Immaginiamo… una persona… un modulo» è la definizione del non-luogo. Il materiale per ancorarla era già nel capitolo, due paragrafi più sotto: Upwork e Scale AI sono piattaforme reali e nominabili, e nominarle in apertura fa un secondo lavoro — carica in anticipo il colpo di «Quaranta persone» che arriva poco dopo, perché il lettore sa già che quel lavoro è stato *comprato*. «Quel campo di testo, riempito 12.725 volte» sostituisce l'astratto «questo gesto, ripetuto su un dataset» con l'oggetto fisico che la persona nota per primo.

### Rewrite 4 — Beat 1: la precisione finta

**Original:**
> Frase piana, concreta, adatta a un bambino. Nessuna parola più lunga di quattro sillabe.

**Rewritten:**
> Frase piana, concreta, adatta a un bambino: ventisei parole, nessuna più lunga di due sillabe. Tre azioni in fila — andare, fotografare, rimandare indietro — e un destinatario finale, "noi", che chiude il gesto.

**Why:** La frase originale sembra un dato e non lo è: nella citazione inglese la parola più lunga è *pictures*, due sillabe, e nulla si avvicina a quattro. Una soglia che nessun elemento si avvicina a toccare non descrive niente — è un numero messo lì per suonare preciso, cioè il contrario di ciò che la persona prescrive («Non intensifico — specifico»). In un capitolo che chiede al lettore di controllare i numeri altrui, un numero decorativo costa credibilità. La versione riscritta misura ciò che si può misurare e aggiunge la struttura che rende davvero la frase adatta a un bambino: tre azioni coordinate e un destinatario.

### Rewrite 5 — Beat 4: l'antropomorfismo scoperto

**Original:**
> E qui nasce il problema che gli autori hanno dovuto affrontare con una toppa esplicita. Se si ottimizza un modello contro qualunque punteggio, il modello trova il modo di far salire il punteggio — anche a costo di smettere di parlare come parlava prima.

**Rewritten:**
> E qui nasce il problema che gli autori hanno dovuto affrontare con una toppa esplicita. Se si ottimizza un modello contro qualunque punteggio, il modello trova il modo di far salire il punteggio — «trova», cioè: l'aggiornamento dei pesi rende più probabili le sequenze che il reward model valuta meglio, comprese quelle che lo valutano meglio per ragioni che con la qualità non c'entrano nulla. Anche a costo di smettere di parlare come parlava prima.

**Why:** «Trova il modo» attribuisce ricerca deliberata, ed è esattamente il tipo di espressione che la STYLE_BIBLE permette *a patto* che il contrappeso meccanicistico arrivi nello stesso respiro. Qui il seguito («anche a costo di…») è ancora agentivo, quindi il contrappeso mancava del tutto — e mancava nel punto peggiore, perché è il paragrafo che introduce il reward hacking, il fenomeno che più di ogni altro viene raccontato in chiave di astuzia dell'algoritmo. L'inciso fa anche un lavoro esplicativo: chiarisce che «per ragioni che con la qualità non c'entrano nulla» è il meccanismo, non una malizia.

### Rewrite 6 — Beat 4: la regia dichiarata

**Original:**
> Questo gesto, ripetuto su 33.207 prompt — le "circa 33k comparazioni" del paper — è il cuore meccanico del capitolo. Perché quell'ordinamento non resta un ordinamento. Diventa un numero.

**Rewritten:**
> Quel trascinamento, ripetuto su 33.207 prompt — le "circa 33k comparazioni" del paper — è il passaggio in cui il giudizio umano esce dalle mani umane. Perché l'ordinamento non resta un ordinamento. Diventa un numero.

**Why:** «È il cuore meccanico del capitolo» è il narratore che valuta la propria costruzione davanti al lettore: informazione editoriale, non narrativa, e uno degli 11 punti in cui il testo si nomina. Sostituirla con ciò che il passaggio *fa* («il giudizio umano esce dalle mani umane») conserva la funzione di segnalazione — il lettore capisce comunque che questo è il momento decisivo — ma la ottiene per contenuto invece che per annuncio. «Quel trascinamento» aggancia inoltre il gesto fisico introdotto nell'apertura riscritta del beat.

### Rewrite 7 — Beat 5: la variabilità asserita

**Original:**
> Ne segue una conseguenza che vale la pena fissare con precisione, perché è quella che genera più fraintendimenti nell'uso quotidiano. Si può fare la stessa domanda due volte, allo stesso modello, con gli stessi pesi, e ricevere due risposte diverse — anche contraddittorie. Non è un ripensamento. […]

**Rewritten:**
> Da queste due manopole segue il fraintendimento più comune nell'uso quotidiano, e conviene ricavarlo passo per passo. Con *p* a 0,9 il sistema, a ogni posizione, pesca dentro un insieme che può contenere decine di token; basta che ne esca uno diverso al terzo passo perché ogni passo successivo venga calcolato su un contesto che non è più lo stesso, e la divergenza si amplifichi fino in fondo. Chiunque abbia un modello open-weight lo verifica in due minuti: stesso prompt, stessi pesi, due seed diversi, due risposte diverse — a volte contraddittorie. Non è un ripensamento. Non è un'oscillazione d'umore, né una revisione di opinione: fissare il seed e portare la temperatura a zero riporta lo stesso identico testo, ogni volta. […]

**Why:** La struttura chiedeva un esperimento riproducibile; il testo consegnava un'asserzione. La differenza conta perché è proprio il beat in cui il capitolo insegna a non fidarsi delle impressioni: affermare la variabilità senza mostrare da dove nasce ripete l'errore che il capitolo denuncia. La versione riscritta la *deriva* dal parametro già introdotto (p = 0,9) mostrando l'effetto valanga, e aggiunge il controfattuale — seed fisso e temperatura zero restituiscono testo identico — che è ciò che rende la spiegazione falsificabile e chiude definitivamente l'ipotesi «ha cambiato idea».

### Rewrite 8 — trasversale: la collisione di omonimi

**Original:**
> Il terzo strumento è pretendere le citazioni e controllarle. Gao e colleghi, con il benchmark ALCE presentato a EMNLP nel 2023, hanno valutato modelli allo stato dell'arte…

**Rewritten:**
> Il terzo strumento è pretendere le citazioni e controllarle. Tianyu Gao e colleghi — un gruppo diverso, nonostante il cognome coincida con quello della curva di poco fa — con il benchmark ALCE presentato a EMNLP nel 2023, hanno valutato modelli allo stato dell'arte…

(e, a monte: «**Leo** Gao e colleghi, in *Scaling Laws for Reward Model Overoptimization*…»)

**Why:** Due gruppi di ricerca distinti — OpenAI e Princeton — venivano introdotti con formula identica, stesso cognome, stesso anno. Il lettore attento, che è il lettore di questo libro, concluderà che è lo stesso team che torna a metà capitolo, e attribuirà a un gruppo un lavoro che non ha fatto. È un errore di attribuzione, non un'ambiguità stilistica: in un capitolo il cui argomento centrale è che le citazioni vanno verificate, una citazione che induce in errore sull'identità dell'autore è un danno sproporzionato rispetto al costo di due nomi di battesimo.

## 8. Litmus Test

> *«Il lettore finirebbe pensando "l'ho vissuto" o "me l'hanno raccontato"?»*

**Entrambi, a seconda del beat — ed è questo il limite residuo del capitolo.**

**«L'ho vissuto»:** il Beat 1 e il Beat 6. La pagina due del paper con i tre riquadri, e la riga di citazione di *Varghese* lasciata sola sulla pagina prima di rivelare che non esiste, sono esperienze, non spiegazioni. La trascrizione di Schwartz — quattro domande e quattro risposte, depositate agli atti — mette il lettore nella sedia dell'avvocato nel momento esatto in cui la verifica fallisce. Dopo *«Ha ricevuto la descrizione linguistica di una verifica»*, il lettore non ha imparato una nozione: ha visto una cosa accadere.

**«Me l'hanno raccontato»:** il Beat 2 e il Beat 4. Sono ben scritti e rigorosi, ma restano esposizione — il lettore segue un ragionamento invece di assistere a un evento. Il Beat 4 lo risolve a metà con la curva di Gao, che ha un momento drammatico reale (*«Il proxy diceva: sto migliorando. La verità di riferimento diceva: sto peggiorando»*).

Le correzioni applicate spostano il Beat 3, il Beat 4 e il Beat 7 verso il primo gruppo — ancorando due aperture a luoghi reali e trasformando la promessa finale in un'azione eseguita. Il Beat 2 resta il beat più «raccontato» del capitolo, ed è un costo accettabile: è il beat che deve trasmettere i numeri.

**Il capitolo passa il test, senza pieno merito.** Un lettore che lo chiude sa fare qualcosa che prima non sapeva fare — davanti a un'affermazione, chiedere da dove viene, controllare se la fonte esiste, e verificare se sostiene davvero la frase. Il PRD promette «uno schema mentale solido e verificabile»: consegnato.

## 9. Verdict

**REVIEWER_CORRECTIONS — 45/60.** Impianto fattuale eccellente e due contro-obiezioni di qualità reale, compromessi da tre difetti strutturali (template duplicato, frame del Beat 7 mai eseguito, omonimia non disambiguata) e da un'impalcatura saggistica pervasiva che copriva la voce della persona; tutti corretti in loco, senza riscrittura.
