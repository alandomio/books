# Capitolo 9 — Struttura: «L'Umano e la Macchina: Verso una Co-Intelligenza Consapevole»

**Core question (PRD.md § 4):** Quale relazione tra pensiero umano e artificiale rifiuta sia la sostituzione sia la svalutazione?
**Audience tag capitolo (PRD.md § 4):** [ALL]

## PRE-FLIGHT CHECKS

- **Repertorio metaforico (PRD.md § 6):** nessuna analogia canonica è assegnata al Capitolo 9. Non introdurre una nuova metafora dominante. La *frontiera seghettata* può comparire soltanto come termine tecnico attribuito allo studio di Dell'Acqua e coautori, con il suo significato empirico; non deve diventare un'immagine universale dell'intelligenza. Non riaprire Galassia, Faro, Escursionista, Brutta Copia o Cassetta degli Attrezzi: la sintesi finale deve richiamare i meccanismi, non sfilare di nuovo le immagini dei capitoli precedenti.
- **Continuity check:** `chapter_index.md` non esiste; manca quindi il registro autorevole dei PASS. Al momento del design non esistono neppure `chapter_8.md` o `chapter_8_struttura.md`. Sono disponibili i capitoli approvati 1, 3, 4, 5, 6 e 7. Il raccordo certo da preservare è quello fissato nel finale del Capitolo 7: collegare un modello a strumenti e permessi non elimina i suoi limiti statistici, ma permette a quei limiti di produrre effetti. Il Capitolo 9 non deve ripetere la matrice operativa del Capitolo 7 — permessi, reversibilità, sandbox, approvazione, rollback — bensì affrontare un'altra domanda: come distribuire **lavoro cognitivo, verifica, apprendimento e responsabilità** fra persona e sistema. Prima del Writer Stage 1 è obbligatorio rieseguire il controllo contro il Capitolo 8, se nel frattempo esiste: importare soltanto i claim canonici già approvati, evitare una seconda apertura consecutiva sull'errore dell'IA e confrontare il finale del Capitolo 9 con l'ultimo paragrafo del Capitolo 8 per escludere eco d'immagine, struttura o frase.
- **Glossary check:** `NARRATIVE_GLOSSARY.md` non esiste. Candidati che il Writer Stage 2 dovrà valutare: *co-intelligenza*, *augmentazione umana*, *sinergia umano–IA*, *frontiera tecnologica seghettata*, *prestazione assistita*, *competenza non assistita*, *sovraffidamento/automation bias*, *funzione di forzatura cognitiva*, *verifica indipendente*, *responsabilità decisionale*.
- **Tesi strutturale:** “umano + IA” non è automaticamente superiore né costituisce l'incontro fra due menti equivalenti. È una configurazione di lavoro che va giudicata per compito, baseline, ordine d'interazione, verificabilità, effetto sull'apprendimento e attribuzione della responsabilità. La posizione del libro non è che l'umano debba sempre prevalere, ma che nessuna media globale autorizza una delega locale.
- **Confine di scope:** niente classifica di prodotti, profezia sul numero di lavori sostituiti, catalogo di professioni “al sicuro”, manifesto sulla coscienza, decalogo di prompt o ripasso enciclopedico dei primi otto capitoli. Non trasformare differenze di prestazione in graduatorie del valore umano. Medicina, scuola e lavoro sono casi per isolare meccanismi diversi, non settori sui quali emettere verdetti complessivi.
- **Guardia epistemica:** “collabora”, “consiglia”, “trasferisce conoscenza”, “corregge” e “fa squadra” sono abbreviazioni ammesse solo se lo stesso paragrafo specifica il meccanismo osservabile: output generato da pattern appresi, presentazione dell'output a una persona, modifica della decisione o della prestazione, confronto con una baseline. *Co-intelligenza* denomina il sistema composto e il disegno del flusso di lavoro; non prova comprensione, esperienza soggettiva o responsabilità morale della macchina.
- **Disciplina delle scene:** dopo i problemi fattuali emersi nel Capitolo 7, nessun dettaglio sensoriale può essere ricostruito da una descrizione aggregata. Ogni apertura deve poggiare su un artefatto primario identificabile — pagina, figura, interfaccia, trascrizione, caso sperimentale o riga di protocollo — e il dossier deve registrare pagina/figura/tabella e versione. Se la fonte non mostra una persona concreta, il Writer non inventa mani, stanze, esitazioni o reazioni: mette in scena l'artefatto.
- **Gate di versione:** per gli studi nati come working paper e poi pubblicati, il Researcher deve scegliere la versione finale come base numerica e costruire una tabella di concordanza con le versioni precedenti. Vietato combinare in una stessa frase campione, percentuali o task provenienti da edizioni diverse.
- **Narrative ADR:** non richiesto. La distinzione fra augmentazione, sinergia e competenza non assistita governa questo capitolo ma non obbliga a riscrivere almeno due capitoli precedenti; il gate a tre condizioni di INSTRUCTION.md § 5 non è soddisfatto.

## NUFs (Goal Scoring)

Dieci utility, un punto ciascuna. Obiettivo di progetto: almeno 8,5/10, senza azzerare nessuna delle tre categorie `reader`, `emotional`, `factual`.

```text
utility(reader): Il lettore può definire la co-intelligenza senza antropomorfismo come una configurazione di lavoro in cui una persona stabilisce scopo e criteri, un sistema genera o ordina possibilità a partire da pattern appresi, e il flusso assegna esplicitamente verifica e responsabilità → score += 1

utility(reader): Il lettore può distinguere augmentazione e sinergia confrontando tre baseline — persona sola, IA sola, coppia persona–IA — e può smontare il claim “insieme sono migliori” quando manca anche una sola di esse → score += 1

utility(reader): Il lettore può separare prestazione assistita e competenza non assistita, riconoscendo quando l'obiettivo è finire bene un compito e quando è conservare o sviluppare la capacità di svolgerlo senza aiuto → score += 1

utility(reader): Prima di affidare un compito cognitivo all'IA, il lettore può scegliere consapevolmente fra IA-prima, umano-prima, due passaggi indipendenti o pratica senza IA valutando baseline, tipo di compito, possibilità di verifica, rischio di ancoraggio, obiettivo di apprendimento e responsabilità finale → score += 1

utility(emotional): Il lettore prova un senso di agency sobria: non ha bisogno di dichiararsi superiore alla macchina per non sottomettersi alla sua fluidità, né di svalutare uno strumento utile per conservare giudizio e responsabilità → score += 1

utility(factual): L'esperimento personale di J. C. R. Licklider del 1957 e “Man-Computer Symbiosis” del 1960 sono ricostruiti da fonte primaria con il dato dell'85%, l'esempio delle sei misure rese comparabili e il limite decisivo di un campione composto da una sola persona → score += 1

utility(factual): La meta-analisi preregistrata di Vaccaro, Almaatouq e Malone è presentata con periodo di ricerca, criteri di inclusione, numero di esperimenti ed effect size, baseline di augmentazione e sinergia, risultati distinti per decisione e creazione e limiti dichiarati dagli autori → score += 1

utility(factual): L'esperimento sui consulenti BCG di Dell'Acqua e coautori è ricostruito usando una sola versione coerente con campione, randomizzazione, task dentro e fuori la frontiera, modello/interfaccia, metriche, risultati e limiti; le differenze fra working paper 2023 e pubblicazione finale 2026 sono esplicitamente disambiguate → score += 1

utility(factual): “Generative AI at Work” è documentato dalla versione finale con impresa e rollout, numero di operatori, metrica di produttività, effetto medio ed eterogeneità per esperienza/abilità, distinguendo risultati causali, evidenza suggestiva sul trasferimento di conoscenza e ciò che lo studio non misura sull'occupazione → score += 1

utility(factual): Il doppio bordo dell'assistenza è documentato con due esperimenti primari: uno che separa rendimento durante la pratica e prova successiva senza IA, e uno in cui consigli corretti e scorretti modificano le decisioni umane; campioni, condizioni, denominatori, effetti, setting controllato e mitigazioni sono riportati senza generalizzare a tutta la scuola o alla pratica clinica → score += 1
```

## BEAT LIST

### Beat 1 — «Ottantacinque per cento prima di pensare»

**Core question:** Perché il sogno della collaborazione fra persona e computer nasce da un uomo che scopre di passare quasi tutto il proprio tempo a prepararsi a pensare?
**Audience tag:** [ALL]
**Word count target:** 900 parole
**Funzione narrativa:** Hook → Establish → Complicate. Aprire nella primavera–estate del 1957 sul registro con cui Licklider prova a misurare il proprio lavoro e finisce intrappolato nel registrare la registrazione. Rendere fisici il grafico, le sei misure incompatibili e le ore di calcolo; soltanto dopo nominare il suo progetto del 1960. Chiudere sulla tensione del capitolo: il computer può liberare tempo per il giudizio, ma il confine “macchina prepara, uomo decide” non può essere assunto immutabile sessant'anni dopo.
**Key facts che il Researcher deve trovare:**

- Testo primario completo di J. C. R. Licklider, “Man-Computer Symbiosis”, *IRE Transactions on Human Factors in Electronics*, volume, numero, pagine e mese del 1960; identificare edizione o trascrizione usata.
- Cronologia esatta dell'auto-osservazione nella primavera e nell'estate 1957, metodo, durata se dichiarata, attività registrate e avvertenze dello stesso Licklider sulla non rappresentatività del campione.
- Formulazione e contesto del “circa 85 per cento”: che cosa includeva il suo “thinking time”, quali attività dominavano e perché non equivale a “l'85% del lavoro umano è automatizzabile”.
- Il micro-episodio delle sei determinazioni sperimentali del rapporto intelligibilità del parlato/segnale-rumore: che cosa non era comparabile, quante ore richiese la conversione e quanto durò la lettura finale del risultato; riportare solo durate presenti nella fonte.
- Divisione del lavoro proposta nel 1960 — obiettivi, ipotesi, criteri, valutazione versus lavoro routinizzabile — e previsioni tecniche datate del paper, così che il Writer possa mostrare insieme lungimiranza e distanza storica.
- Un dettaglio d'apertura verificabile preso dalla pagina primaria: frase del registro, tipo di grafico, numero delle misure o formulazione dell'infinito regresso. Niente ufficio, abiti o suoni non attestati.
- Contesto biografico minimo indispensabile nel 1957–1960: istituzione e ruolo esatti di Licklider, verificati da archivio MIT/biografia accademica; non anticipare ARPA/ARPANET se non serve alla scena.
- Obiezione forte da incorporare: l'auto-esperimento è n=1 e le categorie di lavoro sono definite dall'autore stesso. Risposta corretta: vale come genesi documentata di una domanda, non come misura della popolazione.

### Beat 2 — «La coppia non vince per definizione»

**Core question:** Quando “umano più IA” significa davvero un risultato migliore, e rispetto a quale concorrente?
**Audience tag:** [GENERAL]
**Word count target:** 900 parole
**Funzione narrativa:** Establish → Complicate → Resolve concettuale. Aprire sulla Figura 1 della meta-analisi: due forest plot, due baseline, due conclusioni apparentemente opposte. Insegnare la distinzione portante del capitolo: **augmentazione** = meglio della persona sola; **sinergia** = meglio sia della persona sia dell'IA prese separatamente. La prima può esistere senza la seconda.
**Key facts che il Researcher deve trovare:**

- Vaccaro, Almaatouq e Malone, titolo, DOI, rivista, data di pubblicazione, preregistrazione, repository OSF, date coperte dalla ricerca bibliografica e database interrogati.
- Flusso di selezione: record iniziali, studi inclusi, esperimenti, effect size e criterio che impone la presenza delle tre condizioni umano solo, IA sola e combinazione.
- Definizioni matematiche e narrative delle due baseline; Hedges' g aggregato, intervalli di confidenza, p-value e I² per sinergia e augmentazione, verificati nel testo e nelle supplementari.
- Moderazione per tipo di task: decisione a opzioni finite versus creazione a risposta aperta; numerosità, effect size, incertezza e significatività della differenza. Non trasformare un risultato medio in regola per ogni task creativo o decisionale.
- Moderazione per capacità relativa: che cosa accade quando l'umano solo supera l'IA e quando l'IA sola supera l'umano; distinguere l'effetto medio dalla causalità del meccanismo.
- Risultati nulli o inconcludenti su spiegazioni, confidence score, divisione del lavoro e tipo di partecipante; riportarli se necessari a contrastare la scorciatoia “basta mostrare una spiegazione”.
- Limiti dichiarati: letteratura gennaio 2020–giugno 2023, eterogeneità elevata, differenze di disegno, possibile publication bias, rapida obsolescenza dei sistemi e scarsità di studi sulla scomposizione preventiva dei sottocompiti.
- Dettaglio visivo verificabile della Figura 1 — assi, linee a zero, pannelli e intervalli — da tradurre senza inventare colori o impaginazione.
- Guardia narrativa: non dire che la coppia “fallisce” in assoluto. La stessa meta-analisi trova augmentazione media rispetto agli umani soli; la tensione sta nella baseline più esigente.

### Beat 3 — «Il confine che cambia da un compito all'altro»

**Core question:** Perché la stessa persona, con lo stesso strumento, può essere aiutata in un incarico e portata fuori strada in quello accanto?
**Audience tag:** [GENERAL]
**Word count target:** 1000 parole
**Funzione narrativa:** Hook → Complicate → Resolve. Entrare nella piattaforma sperimentale usata dai consulenti BCG e seguire due task percepiti come professionali e plausibili ma posti su lati diversi della frontiera. Rendere visibile che la competenza dell'IA non forma un confine liscio leggibile a occhio. Chiudere con l'unità corretta di giudizio: non “la professione”, non “il modello”, ma il task nella sua configurazione e metrica.
**Key facts che il Researcher deve trovare:**

- Versione finale di Dell'Acqua, McFowland, Mollick, Lifshitz-Assaf, Kellogg, Rajendran, Krayer, Candelon e Lakhani: rivista, anno 2026, DOI, pagine, appendici online e rapporto preciso con SSRN 2023.
- Tabella di concordanza obbligatoria fra working paper e articolo finale: titolo, N, condizioni, task, metriche, evaluator e valori. Numeri divulgativi ricorrenti — 12,2% di task in più, 25,1% più velocemente, oltre 40% di qualità, −19 punti fuori frontiera — possono entrare nel dossier solo se ricondotti alla tabella/versione che li contiene; non vanno importati per memoria.
- Campione e reclutamento: 758 consulenti, quota della forza lavoro se dichiarata, anzianità, sedi/paesi, incentivi, esclusioni, baseline e randomizzazione nelle condizioni senza IA, GPT soltanto, GPT più overview.
- Modello e interfaccia: versione/data di GPT-4, piattaforma aziendale custom, contenuti dell'overview, accesso consentito, logging, tempo e qualsiasi limite del contesto sperimentale.
- Task dentro la frontiera: impresa/prodotto fittizio, numero di sottocompiti, materiali forniti, output richiesti, valutatori, rubriche e tempi. Scegliere un solo sottocompito chirurgico per la scena.
- Task fuori la frontiera: problema, dato o struttura che rendeva necessaria la guida umana; costruzione dell'errore, risposta di GPT-4 da solo, modo in cui i consulenti potevano riconoscerla e misura dell'overreliance. Non chiamarlo “più difficile” se per gli umani appariva simile.
- Risultati esatti per qualità, quantità, velocità e correttezza con intervalli/p-value, tenendo separate scale umane ed eventuali valutazioni di GPT-4.
- Analisi di workflow *centaur* e *cyborg*, se mantenuta nell'articolo finale: definizioni operative, metodo di codifica, prevalenza e associazione con la performance. Non convertire una tassonomia osservativa in prescrizione causale.
- Limiti: primi anni di carriera, una società, task fittizi, incentivo sperimentale, modello datato, contaminazione possibile, misura della qualità e validità esterna. Bilanciare il fallimento fuori frontiera con i guadagni consistenti dentro frontiera.
- Dettaglio sensoriale: acquisire screenshot, testo del prompt o oggetto del caso dalle appendici. Se l'interfaccia non è pubblicata, aprire sull'artefatto del task e non inventare un consulente individuale.

### Beat 4 — «La conoscenza che cambia scrivania»

**Core question:** In quali condizioni l'IA non sostituisce l'esperienza, ma rende disponibili ai meno esperti alcune tracce del lavoro dei più esperti?
**Audience tag:** [ALL]
**Word count target:** 900 parole
**Funzione narrativa:** Establish → Resolve → Complicate. Entrare in una conversazione di assistenza clienti attraverso un artefatto pubblicato dello studio: suggerimento in tempo reale, metrica o schermata, mai un dialogo ricostruito. Mostrare il guadagno medio e soprattutto la sua distribuzione diseguale. Poi aprire il costo organizzativo: ciò che il sistema diffonde proviene anche dal lavoro accumulato delle persone, e un aumento di produttività non decide da solo come vadano distribuiti benefici, credito o potere.
**Key facts che il Researcher deve trovare:**

- Brynjolfsson, Li e Raymond, “Generative AI at Work”: versione finale in *Quarterly Journal of Economics* 140(2), anno, pagine, DOI, date del rollout e differenze rispetto a NBER Working Paper 31161 e arXiv.
- Impresa e contesto resi pubblici: tipo di servizio, canale chat, caratteristiche degli operatori, paesi/sedi se dichiarati, turni, politiche e periodo osservato. Conservare l'anonimato imposto dallo studio.
- Sistema assistivo: dati di addestramento o corpus aziendale dichiarati, modello/vendor, modalità con cui suggeriva risposte o link, libertà dell'operatore di accettare/modificare/ignorare e log effettivamente osservati.
- Disegno di identificazione: rollout scaglionato, 5.179 operatori nella versione pertinente, definizione di treatment, gruppi di confronto, controlli, pre-trend ed eventuali attrition/missing data.
- Metrica primaria “issues resolved per hour” scomposta nei suoi fattori — tempo medio, conversazioni simultanee, risoluzione — per evitare che “produttività” sembri una qualità generale.
- Effetto medio e intervallo; eterogeneità per anzianità, abilità o quintile con definizioni esatte. Verificare nella pubblicazione finale i numeri spesso riassunti come +14% medio e +34% per novizi/low-skilled invece di ereditarli dal working paper.
- Evidenze su sentiment del cliente, escalation al manager, retention, adozione/stile linguistico e curva di esperienza; distinguere outcome robusti, eterogeneità e interpretazioni suggestive.
- Claim sul trasferimento di conoscenza tacita: quali pattern testano gli autori, quali alternative restano e perché “l'IA ha imparato dai migliori” sarebbe una personificazione eccessiva.
- Limiti: una organizzazione, un tipo di lavoro, assegnazione/rollout non equivalente a esperimento individuale puro, metriche aziendali, orizzonte temporale e assenza di una stima completa su occupazione, salari, sorveglianza o distribuzione dei guadagni.
- Bilanciamento obbligatorio: il maggiore beneficio ai novizi può ridurre disparità di performance; non dimostra che l'esperienza sia inutile né che l'impresa possa rimuovere gli esperti senza impoverire i dati, l'escalation e il controllo di qualità.

### Beat 5 — «Il compito riuscito, la competenza mancata»

**Core question:** Che cosa perdiamo quando confondiamo una prestazione migliore con la capacità di ripeterla senza l'aiuto che l'ha resa possibile?
**Audience tag:** [ALL]
**Word count target:** 1000 parole
**Funzione narrativa:** Hook → Complicate → Resolve parziale. Aprire su un singolo scambio reale pubblicato fra studente e GPT Base o GPT Tutor durante un esercizio di matematica. Far vedere il sollievo del compito che procede, poi chiudere la finestra dell'assistente e misurare ciò che resta nella prova non assistita. Il punto non è “vietare l'IA”, ma separare l'obiettivo **output adesso** dall'obiettivo **competenza domani** e mostrare che il design dell'aiuto cambia l'esito.
**Key facts che il Researcher deve trovare:**

- Bastani, Bastani, Sungu, Ge, Kabakcı e Mariman, titolo finale, *PNAS* 122(26), e2422633122, DOI, date di ricezione/accettazione/pubblicazione e correzione successiva; supplementi, codice e dati ufficiali.
- Luogo e popolazione: paese, scuola/e, classi, età o livello, numero esatto di studenti assegnati e analizzati, insegnanti, opt-out/consenso, sessioni e calendario.
- Randomizzazione e condizioni: controllo, GPT Base e GPT Tutor; modello sottostante, prompt, disponibilità delle soluzioni, guardrail, common mistakes/hints, interfaccia e possibilità di chiedere la risposta completa.
- Separazione temporale e metrica fra esercizi assistiti e prova/esame senza accesso: punteggi, standardizzazione, outcome primario, intervalli, p-value, attrition e unità di randomizzazione.
- Effetti esatti di GPT Base e GPT Tutor durante la pratica e nella prova non assistita; interazioni per sottogruppi solo se preregistrate o chiaramente esplorative.
- Analisi delle conversazioni: tipi di messaggio, richieste di aiuto, tentativi, risposte copiate o uso come “crutch”; distinguere comportamento osservato e interpretazione degli autori.
- Un estratto breve e lecito da figura o appendice che mostri la differenza fra dare una soluzione e guidare un tentativo; non ricostruire un dialogo medio e non rendere identificabile uno studente.
- Limiti: un contesto scolastico e disciplinare, un particolare disegno dei tutor, durata limitata, possibile spillover, outcome d'esame specifico. Non dedurre che ogni tutor IA danneggi l'apprendimento.
- Evidenza positiva da preservare: l'assistenza può migliorare la pratica e un tutor con guardrail può attenuare o cambiare il costo; il disegno dell'interazione, non la sola presenza del modello, è la variabile narrativa.
- Ponte al lettore adulto: presentare la distinzione “prestazione assistita/competenza non assistita” come inferenza limitata e strumento diagnostico, non come trasferimento automatico dei coefficienti dagli studenti a ogni professione.

### Beat 6 — «Quando la seconda opinione arriva per prima»

**Core question:** Perché lasciare “l'ultima parola all'umano” può essere un controllo vuoto se l'IA ha già fissato il punto da cui l'umano comincia a giudicare?
**Audience tag:** [GENERAL]
**Word count target:** 950 parole
**Funzione narrativa:** Hook → Complicate → Resolve. Aprire nel viewer DICOM dell'esperimento di Gaube e coautori: un'immagine toracica, otto casi, un consiglio attribuito a CHEST-AI o a un radiologo esperto. Mostrare nello stesso disegno l'utilità di un consiglio corretto e il trascinamento di uno scorretto. Passare poi a Buçinca e coautori: prima produrre un giudizio proprio, rendere il consiglio disponibile su richiesta o costringere a un confronto riduce alcuni errori, ma introduce fatica e non funziona allo stesso modo per tutti.
**Key facts che il Researcher deve trovare:**

- Gaube e coautori, “Do as AI say: susceptibility in deployment of clinical decision-aids”, *npj Digital Medicine* 2021, DOI, preregistrazione se presente, supplementi e materiali.
- Partecipanti: N esatto, specialità, paesi, criteri di inclusione/esclusione e potenza; otto casi, provenienza delle radiografie, ground truth e natura simulata/online del compito.
- Interfaccia DICOM e procedura: zoom/window/level/annotazioni consentiti, storia clinica, fonte dichiarata del consiglio, randomizzazione di correttezza e fonte AI/umana, ordine dei casi e domande finali.
- Effetti del consiglio corretto e scorretto su accuratezza e valutazione della qualità, con denominatori e intervalli; differenze fra radiologi e altre specialità se sostenute. Evitare il claim generico “i medici obbediscono all'IA”.
- Stabilire se il consiglio era realmente generato da un sistema o manipolato dai ricercatori; non attribuire capacità diagnostica a CHEST-AI oltre il testo sperimentale.
- Buçinca, Malaya e Gajos, “To Trust or to Think”, DOI 10.1145/3449287, *PACM HCI/CSCW* 2021, N=199 da verificare, task, modello, sei condizioni e definizione operativa di overreliance.
- Meccanica delle funzioni di forzatura cognitiva: consiglio on demand, decisione o spiegazione propria prima di vedere l'IA, scelta fra spiegazioni; quale intervento riduce quale metrica e con quale costo in tempo, valutazione soggettiva o adozione.
- Moderazione per *Need for Cognition* e rischio distributivo: una frizione utile ad alcuni può pesare di più su altri. Non prescrivere un rituale universale da un singolo esperimento.
- Meta-analisi o replica che confronti human-first, AI-first e presentazione simultanea; usarla per triangolare il meccanismo dell'ancoraggio, non per aggiungere un terzo esempio narrativo.
- Bilanciamento medico obbligatorio: il consiglio accurato può migliorare la decisione; il rischio nasce dall'impossibilità di sapere in anticipo quali suggerimenti siano corretti e dall'ordine dell'interazione. Dichiarare che nessun paziente reale ricevette quella diagnosi nello studio, se confermato.
- Land fattuale, non slogan: “supervisione umana” descrive una posizione nel diagramma; diventa controllo solo se la persona ha informazione indipendente, tempo, competenza e potere di dissentire.

### Beat 7 — «Il posto che resta occupato»

**Core question:** Quale procedura concreta permette di usare l'IA senza trasformare né il suo output in verdetto né la dignità umana in una gara di benchmark?
**Audience tag:** [ALL]
**Word count target:** 1150 parole
**Funzione narrativa:** Resolve → Land. Aprire su una pagina identificabile del NIST AI RMF 1.0: benefici e costi nello stesso riquadro, uso previsto delimitato, benchmark, competenza dell'operatore e sorveglianza documentata. Tradurre il principio organizzativo in quattro verifiche per il singolo lettore, applicandole a **un solo task già visto nel capitolo**. Tornare infine alla divisione di Licklider e correggerla: non serve tracciare una frontiera eterna fra facoltà umane e facoltà artificiali; serve lasciare occupato, e nominato, il posto da cui si definiscono scopo, prova accettabile, apprendimento da preservare e conseguenza da assumere.
**Key facts che il Researcher deve trovare:**

- NIST AI RMF 1.0, NIST AI 100-1, autrice, data 26 gennaio 2023, DOI, carattere volontario, destinatari e stato di eventuale revisione alla data della ricerca. Distinguere Framework, Playbook e Generative AI Profile.
- Testo e pagina esatti di MAP 3.1–3.5: benefici, costi monetari e non monetari, scopo d'uso, benchmark, competenza dell'operatore e processi di human oversight; verificare anche Appendix C sulla configurazione umano–IA.
- Non attribuire a NIST l'efficacia empirica delle quattro verifiche del capitolo: il framework offre risultati attesi e pratiche di gestione, non un RCT sul lettore individuale.
- Le quattro verifiche da incorporare in una sequenza, non in un elenco nella prosa finale:
  1. **Baseline:** umano solo, IA sola e coppia sono stati confrontati sul compito reale, o si sta chiamando “sinergia” un miglioramento rispetto a una sola base?
  2. **Ordine e prova:** chi produce la prima ipotesi, quale evidenza indipendente può smentirla e il verificatore vede la fonte prima del suggerimento?
  3. **Prestazione o apprendimento:** l'obiettivo è consegnare l'output oppure conservare la capacità non assistita, e quando viene misurata senza IA?
  4. **Responsabilità:** quale persona o istituzione stabilisce il criterio, può rifiutare l'output, registra il motivo e risponde della conseguenza?
- Quattro modalità come esiti, non come marche assolute: **IA-prima** per generazione esplorativa con verifica economica; **umano-prima** quando l'ancoraggio minaccia il giudizio; **passaggi indipendenti** quando il disaccordo è informativo; **pratica senza IA** quando la competenza stessa è l'output. Il dossier deve cercare supporto empirico per ciascuna o marcarla come euristica editoriale.
- Applicazione narrativa a un solo caso precedente — preferenza: il task fuori frontiera dei consulenti, se le appendici consentono di ricostruire una verifica indipendente. Non inventare che una procedura avrebbe migliorato il risultato; presentare l'applicazione come audit controfattuale esplicitamente marcato.
- Un controesempio per impedire il culto dell'umano: errore umano, rifiuto ingiustificato di un consiglio corretto o underreliance misurata nello stesso corpus di studi. La responsabilità non implica infallibilità.
- Se viene citato l'AI Act europeo, usare soltanto EUR-Lex e delimitare l'Articolo 14 ai sistemi ad alto rischio e alle relative date/applicabilità; non presentarlo come regola universale per ogni chatbot. Preferibile ometterlo se non aggiunge una distinzione essenziale.
- Sintesi meccanicistica dell'intero libro in massimo un paragrafo: pattern appresi e contesto producono continuazioni utili; allineamento e tempo di inferenza cambiano comportamento; strumenti trasformano testo in azione; bias e sovrageneralizzazione restano possibili. Nessuno di questi passaggi trasferisce al modello la responsabilità sociale di una decisione.
- Ultima obiezione nella forma più forte: in alcuni task l'IA sola può già superare la persona e la supervisione può peggiorarne il risultato. Concederlo. La risposta non è imporre sempre un umano nel micro-loop, ma nominare chi sceglie la configurazione, con quale prova e chi risponde dell'esito.
- Finale vietato: domanda retorica, previsione sul “futuro dell'IA”, elenco dei capitoli, slogan “l'IA non sostituirà chi la usa”, ritorno alla Cassetta degli Attrezzi o formula “davanti al prossimo annuncio”. Finale richiesto: un fatto o gesto di attribuzione — criterio scritto, baseline conservata, firma o decisione motivata — che renda visibile la responsabilità senza dichiarare una superiorità metafisica.

## REVIEWER READINESS NOTES

### Tension points

1. **Il sogno della coppia contro il dato della coppia.** Licklider immagina una simbiosi più efficace; la meta-analisi mostra che, in media, la combinazione può migliorare l'umano senza superare il migliore fra umano e IA. La posta narrativa è salvare l'idea di collaborazione dopo averle tolto l'automatismo.
2. **La stessa fluidità, due lati della frontiera.** Nei task BCG il lettore deve sentire l'instabilità: non cambia il tono sicuro dell'output, cambia la posizione del task rispetto alle capacità del sistema. Se il confine non è visibile dallo stile, serve una prova esterna.
3. **Produrre di più o diventare più capaci.** Il call center mostra possibile accelerazione della curva di esperienza; lo studio scolastico mostra che un risultato migliore durante l'aiuto può non sopravvivere alla sua rimozione. La tensione non va risolta scegliendo un caso: va risolta chiedendo quale outcome si sta misurando e quando.
4. **L'ultima parola può arrivare troppo tardi.** Un umano formalmente responsabile può essere già ancorato dalla prima risposta che vede. La posta è trasformare la supervisione da firma rituale a processo con giudizio indipendente e possibilità reale di dissentire.
5. **Responsabilità senza superiorità.** Il capitolo deve assegnare all'umano scopo e responsabilità senza rifugiarsi nel claim non falsificabile “l'uomo avrà sempre qualcosa in più”. Alcuni task possono essere svolti meglio dall'IA sola; la configurazione resta una scelta umana e istituzionale con conseguenze umane.
6. **Il capitolo finale può diventare sermone.** Ogni posizione normativa deve emergere da baseline, esperimento e gesto operativo. L'emozione finale richiesta è agency, non consolazione identitaria.

### Key chains da rendere esplicite

- Tempo umano assorbito dalla preparazione → automazione di ricerca/calcolo promette spazio per il giudizio → il sistema inizia anche a proporre giudizi → la divisione fissa del 1960 non basta → servono baseline e responsabilità per task.
- Umano solo + IA sola + coppia → scelta della baseline → augmentazione oppure sinergia → claim più preciso → niente slogan “insieme è sempre meglio”.
- Task percepiti come simili → capacità dell'IA distribuite in modo irregolare → output ugualmente persuasivo su entrambi → overreliance fuori frontiera → scomposizione e prova indipendente diventano azioni del lettore.
- Tracce delle interazioni dei più esperti → sistema genera suggerimenti per i novizi → produttività e alcuni outcome migliorano → vantaggio eterogeneo → il risultato riguarda quel workflow, non il valore o la sostituibilità dell'intera professione.
- Aiuto disponibile durante la pratica → prestazione immediata sale → strategie possono essere esternalizzate al sistema → l'aiuto viene rimosso → prova non assistita misura apprendimento diverso dall'output → alternare uso e pratica senza IA in base allo scopo.
- Consiglio mostrato prima → prima ipotesi umana si ancora → consiglio scorretto trascina la decisione → “ultima parola all'umano” resta formale → giudizio umano precedente o passaggio indipendente crea un confronto reale → la frizione ha però costi di tempo e accettabilità.
- Meccanismi dei capitoli precedenti → testo plausibile e utile senza comprensione soggettiva → tool e workflow ne aumentano l'effetto → i limiti non spariscono nella coppia → co-intelligenza descrive un'architettura di lavoro, non la fusione di due coscienze.
- Baseline → ordine dell'interazione → obiettivo prestazione/apprendimento → responsabilità nominata → scelta fra IA-prima, umano-prima, passaggi indipendenti o pratica senza IA → collaborazione proporzionata e verificabile.

### Risk proportionality guards

- **Licklider e l'85%:** è un'auto-osservazione esplorativa del 1957, non una stima rappresentativa del lavoro cognitivo. Bilanciamento: la sua forza è mostrare l'origine concreta della domanda, non misurare l'automazione possibile oggi.
- **Meta-analisi:** “peggio del migliore dei due” non significa “peggio dell'umano”; la stessa analisi trova augmentazione media. I dati coprono studi fino a giugno 2023, con sistemi e disegni eterogenei: non usarli come classifica immutabile nel 2026.
- **Frontiera seghettata:** non è una proprietà metafisica né una mappa stabile. Modello, prompt, tool, dati e tempo cambiano il confine; dichiarare la configurazione e la data. Bilanciamento: dentro la frontiera gli incrementi possono essere sostanziali e coerenti.
- **BCG:** un esperimento su consulenti e task fittizi non prova la trasformazione di un'intera professione. Bilanciamento: è raro perché confronta compiti realistici, condizioni randomizzate e due lati della stessa frontiera.
- **Produttività:** più ticket/ora non equivale automaticamente a benessere, qualità totale, salario o occupazione; una singola impresa non rappresenta il mercato. Bilanciamento: includere customer sentiment, escalation, retention e outcome di qualità effettivamente misurati.
- **Conoscenza tacita:** il modello non “possiede l'esperienza” dei lavoratori. Genera suggerimenti da pattern nelle interazioni su cui è stato costruito. Bilanciamento: la diffusione di pratiche può accorciare la curva dei novizi; credito, consenso, compensazione e governance restano domande organizzative da non fingere risolte dallo studio.
- **Apprendimento:** un trial di matematica in un contesto scolastico non autorizza il claim che l'IA “rende stupidi”. Bilanciamento: il tutor con guardrail e il miglioramento durante la pratica mostrano che il design e il momento della misura contano.
- **Automazione e medicina:** uno studio online con casi radiologici e consigli manipolati non misura danni clinici reali. Bilanciamento: consigli corretti possono migliorare l'accuratezza; il risultato isola il rischio di affidamento quando il consiglio è scorretto.
- **Forzatura cognitiva:** chiedere un giudizio indipendente può ridurre overreliance ma costa tempo, aumenta fatica o peggiora l'esperienza; gli effetti possono variare con motivazione e competenza. Non prescriverla per ogni task a bassa posta.
- **Human-in-the-loop:** la persona non è garanzia di correttezza e può ignorare un consiglio valido. Proporzionare indipendenza e doppio passaggio a impatto, costo dell'errore e difficoltà di verifica; per task banali e reversibili un controllo pesante può essere inefficiente.
- **Responsabilità:** dire che una persona o istituzione risponde dell'esito è una posizione sociale e di governance, non la prova che possieda sempre prestazioni superiori. Separare capacità comparata, autorità decisionale e responsabilità.
- **Lavoro e sostituzione:** gli studi di prestazione su task non bastano a prevedere occupazione, salari o redistribuzione. Se si menzionano effetti sul lavoro, accompagnare sempre livello di analisi, periodo, settore e outcome; nessun numero macroeconomico entra senza fonte primaria dedicata.
- **Costi e privacy:** se il Writer menziona dati dei lavoratori/studenti, sorveglianza, proprietà intellettuale, energia o costo monetario, il dossier deve offrire una fonte specifica e il relativo beneficio/contesto. Altrimenti omettere: il capitolo non è un catalogo laterale di rischi.
- **Norme e standard:** NIST AI RMF è volontario; l'AI Act ha ambito e calendario propri. Non trasformare raccomandazioni in obblighi né obblighi settoriali in regole universali.
- **Claim correnti:** modello, interfaccia, benchmark e norme sono temporalmente instabili. Congelare versione e data; evitare “oggi l'IA sa/non sa” senza configurazione e test.

### Six-dimension coverage plan

- **Narrativa & Struttura:** arco in sette mosse — nascita del sogno, test della baseline, irregolarità per task, guadagno reale, costo nascosto, supervisione vulnerabile, procedura — con una sola domanda causale per beat.
- **Linguaggio, Stile & Voce:** ogni beat parte da un artefatto verificato prima della spiegazione; nessuna apertura definitoria, nessuna lista nel corpo narrativo, antropomorfismi compensati nello stesso respiro.
- **Accuratezza Fattuale:** version lock, tabella di concordanza per studi revisionati, pagina/figura per i dettagli sensoriali, separazione obbligatoria fra risultato, interpretazione e inferenza editoriale.
- **Allineamento all'Audience:** nessuna formula necessaria per capire effect size; le tre baseline e le quattro verifiche devono essere spiegabili a un collega in linguaggio comune.
- **Coinvolgimento Sensoriale & Emotivo:** registro di Licklider, forest plot, piattaforma BCG, chat di supporto, scambio del tutor, viewer DICOM e pagina NIST forniscono sette oggetti diversi senza scene inventate.
- **Originalità & Angolo:** rifiuto simmetrico dei due slogan “la macchina sostituisce” e “la coppia vince”; centro del capitolo sulla differenza fra output, competenza e responsabilità, non sulla gara ontologica uomo/macchina.

## RESEARCHER BRIEF

### Web search terms — query esatte

- `"J. C. R. Licklider" "Man-Computer Symbiosis" "spring and summer of 1957" "85 per cent"`
- `site:groups.csail.mit.edu/medg/people/psz/Licklider "six experimental determinations"`
- `"Man-Computer Symbiosis" IRE Transactions HFE-1 March 1960 pages 4 11 PDF`
- `site:mit.edu J.C.R. Licklider biography 1957 1960 BBN MIT official archive`
- `"When combinations of humans and AI are useful" 106 experiments 370 effect sizes supplementary information`
- `site:nature.com/articles/s41562-024-02024-1 human AI synergy augmentation Hedges g decision creation`
- `site:osf.io "When combinations of humans and AI are useful" preregistration data code`
- `"Navigating the Jagged Technological Frontier" 2026 Organization Science final article 758 consultants`
- `site:hbs.edu/ris "Navigating the Jagged Technological Frontier" online appendix GPT-4 footwear task`
- `site:pubsonline.informs.org "Jagged Technological Frontier" Dell'Acqua McFowland Mollick 2026`
- `"Navigating the Jagged Technological Frontier" 2023 SSRN 12.2% 25.1% 40% 19 percentage points`
- `"Navigating the Jagged Technological Frontier" centaur cyborg workflow coding appendix`
- `"Generative AI at Work" Quarterly Journal of Economics 140 2 889 942 5179`
- `site:academic.oup.com/qje "Generative AI at Work" Brynjolfsson Li Raymond supplementary appendix`
- `site:nber.org/papers/w31161 "34%" novice low-skilled "14%"`
- `"Generative AI at Work" staggered rollout pre-trends issues resolved per hour customer sentiment retention`
- `"Generative AI without guardrails can harm learning" PNAS 122 26 e2422633122 supplementary`
- `site:pnas.org/doi/10.1073/pnas.2422633122 GPT Base GPT Tutor unaided exam practice`
- `site:github.com/obastani/GenAICanHarmLearning anonymized conversations figure prompt`
- `"Do as AI say" susceptibility deployment clinical decision aids eight cases physicians CHEST-AI`
- `site:nature.com/articles/s41746-021-00385-9 supplementary DICOM eight patient cases advice accuracy`
- `"To Trust or to Think" 10.1145/3449287 N=199 cognitive forcing functions on demand`
- `site:scholar.harvard.edu/files/zbucinca Bucinca 2021 trust think PDF overreliance subjective ratings`
- `human first AI first independent judgment overreliance randomized experiment advice order`
- `site:nist.gov/publications "Artificial Intelligence Risk Management Framework" AI 100-1 January 26 2023`
- `site:nvlpubs.nist.gov NIST.AI.100-1 "MAP 3.1" "MAP 3.5" human oversight`
- `site:airc.nist.gov "Appendix C" "Human-AI Interaction" AI RMF`
- `site:eur-lex.europa.eu/eli/reg/2024/1689/oj/ita "Articolo 14" "sorveglianza umana"`
- `human AI underreliance correct advice rejection experimental study systematic review`
- `human AI collaboration assisted performance unassisted skill retention field experiment`

### Document types da prioritizzare

1. **Versioni finali peer-reviewed e supplementi ufficiali:** PDF dell'articolo, online appendix, protocollo, preregistrazione, codebook, dataset e repository collegato dal publisher.
2. **Fonti primarie storiche:** scansione o trascrizione istituzionale del paper di Licklider e archivi MIT/BBN; biografie secondarie solo per triangolare ruolo e luogo.
3. **Version history:** SSRN/NBER/arXiv e working paper archiviati esclusivamente per costruire concordanze con la pubblicazione finale. Annotare data, versione, tabella e motivo di ogni variazione.
4. **Materiali sperimentali:** prompt, screenshot, viewer, figure, vignette, rubriche, transcript anonimizzati e strumenti di valutazione. Sono la fonte obbligatoria dei dettagli d'apertura.
5. **Revisioni sistematiche e meta-analisi preregistrate:** includere criteri di selezione, effect size, eterogeneità, publication bias e repository riproducibile; non usare review narrative come sostituto degli studi portanti.
6. **Standard e fonti normative ufficiali:** NIST/DOI NIST per framework volontari; EUR-Lex per eventuali obblighi UE. Blog di studi legali o vendor servono solo a trovare il testo, non a sostenerlo.
7. **Repliche e critiche metodologiche:** commenti accademici, registered reports, reanalysis e corrigenda per ogni studio centrale; registrare divergenze in `[CONFLICT]`.
8. **Giornalismo autorevole e pagine universitarie:** ammessi per contesto, interviste e dettagli biografici soltanto dopo la fonte primaria; comunicati stampa e post degli autori non reggono numeri se il paper è disponibile.
9. **Da de-prioritizzare:** classifiche correnti di modelli, demo aziendali, newsletter, thread social, aneddoti di professionisti e citazioni motivazionali senza fonte. Nessuno di questi può sostenere una NUF factual.

### Fatti, date, nomi e numeri da cacciare

- **Licklider:** primavera/estate 1957; “circa 85%”; sei determinazioni; ore di calcolo versus secondi per la decisione; marzo 1960; volume HFE-1; pagine 4–11; istituzione/ruolo; esatta cautela sul proprio campione.
- **Vaccaro–Almaatouq–Malone:** ricerca 1 gennaio 2020–30 giugno 2023; 5.126 record iniziali, 74 paper, 106 esperimenti e 370 effect size da verificare; g, CI, p e I² per sinergia/augmentazione; n e risultati per decisione/creazione; 3 soli esperimenti di divisione preventiva dei sottocompiti, se confermato dalle supplementari.
- **Dell'Acqua et al.:** 758 consulenti; 385/373 nei due bracci se confermato; condizioni e allocazioni; circa 7% della forza lavoro se mantenuto; 18 sottocompiti del task creativo; scale di qualità; risultati di velocità/quantità/qualità/correttezza; modello e snapshot; data del field experiment; differenze puntuali 2023/2026.
- **Brynjolfsson–Li–Raymond:** 5.179 operatori nella versione finale; date e durata rollout; +14% medio e +34% novizi/low-skilled da verificare nel QJE; definizioni di esperienza/abilità; issues/hour; handle time; resolution; simultaneous chats; escalation; sentiment; retention; eventuale convergenza stilistica.
- **Bastani et al.:** N randomizzato e N analizzato; scuole/classi/paese; numero di sessioni e problemi; modello GPT-4/snapshot; prompt GPT Base e GPT Tutor; punteggi pratica ed esame non assistito; effect size/SE/CI/p; attrition; date; dettaglio della correzione PNAS del 18 agosto 2025.
- **Gaube et al.:** N dei medici; specialità; USA/Canada; otto casi; 10–15 minuti se rilevante; accuratezza del consiglio; randomizzazione AI versus radiologo e corretto versus scorretto; effect size; DICOM viewer; origine/ground truth delle immagini; distinzione consiglio simulato/sistema reale.
- **Buçinca et al.:** N=199 da verificare; sei condizioni; task e dataset; tre cognitive forcing functions; definizione di appropriate reliance/overreliance/underreliance; accuratezza; tempo; rating; drop-out; Need for Cognition; DOI e venue corretti.
- **NIST:** NIST AI 100-1; 26 gennaio 2023; Elham Tabassi; MAP 3.1–3.5 e pagine; Appendix C; volontarietà; stato della revisione alla data di consegna; differenza da NIST AI 600-1.
- **Tre baseline:** per ogni studio centrale, estrarre umano solo, IA sola e combinazione quando esistono. Se una manca, dichiarare quale conclusione non è identificabile.
- **Ordine dell'interazione:** human-first, AI-first, simultaneo/on-demand; individuare almeno una prova randomizzata, oltre Buçinca, che misuri effetto su overreliance e underreliance.
- **Dettagli sensoriali:** una fonte primaria e un locator per beat. Formato dossier obbligatorio: `dettaglio | fonte | pagina/figura/tabella | citazione/parafrasi | cosa NON è documentato`.
- **Conflitti:** numeri che cambiano fra abstract, working paper, articolo finale, supplementi o pagine divulgative; nominare la versione scelta e lasciare in `[CONFLICT]` ciò che non si riconcilia.
- **Cronologia normativa:** solo se usata: entrata in vigore e applicabilità pertinente dell'AI Act alla data corrente; ambito dell'Articolo 14. Nessuna data giuridica per memoria.
- **Fatto negativo necessario:** cercare casi di underreliance e di IA sola migliore della combinazione per evitare che “responsabilità umana” venga narrata come “decisione umana sempre più accurata”.
- **Fatto distributivo necessario:** chi beneficia, chi migliora meno, chi sostiene costi e chi produce i dati/pratiche che il sistema redistribuisce; includere solo outcome misurati, non giudizi morali attribuiti agli autori.

### Protocollo di verifica del dossier

- Ogni claim portante deve avere almeno due controlli: fonte primaria finale + supplemento/dataset/replica o seconda fonte indipendente. Due pagine che riassumono lo stesso paper non contano come triangolazione.
- Ogni numero deve conservare denominatore, unità, condizione, versione, tabella e intervallo d'incertezza. Nessuna percentuale orfana.
- Ogni citazione diretta deve essere confrontata con il PDF o la scansione; massimo estratto necessario, con pagina. Le parafrasi devono essere marcate come tali.
- Le scene sperimentali devono distinguere partecipante reale, vignetta standard, esempio illustrativo degli autori e counterfactual dell'Architect. Nessuna fusione fra quattro categorie.
- Claim non risolto dopo il Fractal Search Protocol: `[BLOCKED: needs human input — specificare versione, tabella o artefatto mancante]`. Non colmare con un dettaglio plausibile.

## TARGET

**Word count:** 6800 parole totali (900 + 900 + 1000 + 900 + 1000 + 950 + 1150); il PRD non fissa un numero autonomo, quindi il target resta nella scala 6800–7000 adottata dal progetto e mantiene tutti i beat entro 800–1200 parole.

**Opening hook strategy:** Aprire sul registro del 1957 in cui Licklider scopre che circa l'85% del suo “tempo di pensiero” serve soltanto a mettersi nella condizione di pensare, precisando subito che l'esperimento ha un solo soggetto: lui.

**Closing beat promise:** Chiudere con il lettore capace di progettare una collaborazione per baseline, ordine, apprendimento e responsabilità — non una fusione di menti, ma una divisione del lavoro cognitivo i cui criteri e conseguenze restano visibili e attribuiti.
