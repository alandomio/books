# STRUTTURA — Capitolo 9: L'Era Post-Silicio e il Nuovo Ordine Tecnologico

**Core question (da PRD.md):** Quali tecnologie emergenti — calcolo quantistico, grafene/materiali alternativi e ottica/fotonica — potrebbero rompere i monopoli descritti nel libro, e chi sta vincendo la corsa?
**Audience del capitolo (da PRD.md):** [GENERAL/EXPERT]
**Cutoff fattuale:** 3 settembre 2026; roadmap, record di laboratorio, capacità produttive, finanziamenti, restrizioni all'export e posizioni competitive devono essere datati. Nessuna milestone annunciata dopo il cutoff e nessuna roadmap aziendale vanno narrate come risultato conseguito.
**Corpus coverage:** ASSENTE — tutti i beat sono **[WEB-PRIMARY]**. NotebookLM va interrogato una sola volta per confermare il gap e recuperare soltanto eventuali richiami ai capitoli precedenti; non va usato per inferire la maturità delle tecnologie post-silicio.
**Architettura narrativa:** audit di sostituzione in cinque cancelli — vantaggio fisico, funzione sostituita, fabbricabilità/yield, ecosistema necessario, leva geopolitica. Aprire su un dispositivo presentato come «post-silicio» e smontarne fisicamente la distinta base; applicare poi lo stesso test a materiali, fotonica, quantistico e integrazione avanzata; chiudere con una mappa dei colli di bottiglia che migrano invece di scomparire.
**Tesi da dimostrare, non da presupporre:** «post-silicio» non indica una singola tecnologia né una successione già decisa. Grafene e semiconduttori bidimensionali, fotonica, calcolo quantistico, chiplet e materiali wide-bandgap sostituiscono funzioni differenti e si trovano a maturità incomparabili; molti dipendono ancora da CMOS, litografia, foundry e packaging. La corsa non ha quindi un vincitore unico: ricerca, proprietà intellettuale, tool, materiali, produzione in volume, integrazione e controllo degli standard possono assegnare la leadership a soggetti diversi. Il capitolo deve verificare se il potere di Veldhoven, Taiwan e degli altri nodi viene spezzato, rafforzato o soltanto trasferito.

---

## CONTINUITY CHECK

**Vincoli canonici ereditati:**
- Il capitolo 8 chiude chiedendo se cambiare materiale o paradigma di calcolo cambi davvero la geografia del potere. Il capitolo 9 deve rispondere a quella domanda con una distinta base e una mappa industriale, non con una rassegna di tecnologie promettenti.
- Il capitolo 1 ha definito ASML come monopolista dell'EUV e ha mostrato che il collo di bottiglia è una rete di sorgente, ottica, metrologia e fornitori. Ogni tecnologia «oltre il silicio» va quindi controllata per l'eventuale dipendenza da litografia EUV/DUV, deposizione, etch, metrologia e software EDA; cambiare il materiale attivo non prova di aver eliminato Veldhoven.
- I capitoli 2 e 8 hanno definito TSMC come ecosistema di processo, persone, utility, packaging, clienti e fornitori, non come edificio. Un prototipo fabbricato su una linea CMOS o integrato da una foundry taiwanese non costituisce una filiera alternativa a Taiwan solo perché il dispositivo attivo non è un transistor di silicio convenzionale.
- Il capitolo 5 ha stabilito che un workaround tecnico può funzionare pagando in yield, tempo, energia e costo. Lo stesso criterio deve governare grafene, materiali 2D, fotonica e quantistico: una dimostrazione funzionale non equivale a produzione economica e ripetibile.
- Il capitolo 6 ha collocato i laser lituani nel back-end, nel micromachining e nella ricerca, escludendo un nesso documentato con la sorgente EUV. Il capitolo 9 può attribuire alla Lituania una nuova leva nella fotonica o nei materiali soltanto se il Ricercatore trova prodotti, clienti, capacità produttiva e integrazione verificabili; la mera presenza della parola «laser» non basta.
- Il capitolo 7 ha trattato fab, pilot line, edificio e capacità qualificata come stati distinti. I record post-silicio devono attraversare la stessa scala: paper → dispositivo → wafer/pilot line → yield ripetibile → qualifica → volume → adozione commerciale.
- Il capitolo 8 chiude con uno strumento operativo di cinque domande. Il finale del capitolo 9 non deve replicare una checklist interrogativa: deve consegnare una **mappa-passaporto delle dipendenze** applicata all'oggetto dell'apertura e chiudere il libro con un verdetto, non con un nuovo open loop.
- `chapter_index.md` registra soltanto i capitoli 1–4 e `NARRATIVE_GLOSSARY.md` non recepisce ancora i termini dei capitoli 7–8. È un gap di manutenzione, non un'autorizzazione a ridefinire i concetti: in caso di divergenza prevalgono i capitoli finali approvati e le definizioni canoniche già presenti; nessun conflitto fattuale specifico è emerso per i beat qui pianificati.

**Glossary check:**
- Conservare le definizioni canoniche di **ASML**, **EUV/DUV**, **TSMC**, **fab**, **wafer**, **yield**, **pure-play foundry**, **SAQP**, **de-risking** e **decoupling**.
- Non usare «post-silicio» come sinonimo di «senza silicio»: nel capitolo è un'etichetta da sottoporre a verifica per materiale attivo, funzione, processo di fabbricazione, elettronica di controllo e packaging.
- Non chiamare «chip quantistico» un computer autonomo: distinguere QPU, elettronica classica di controllo, criogenia/laser, rete e calcolo classico di supporto.
- Non confondere **silicon photonics**, **optical interconnect**, **co-packaged optics** e **photonic computing**; ciascun termine deve indicare una funzione e un perimetro industriale diversi.
- Concetti nuovi da definire in prosa e aggiungere al glossario in Stage 2: **materiale wide-bandgap**, **materiale bidimensionale (2D/TMD)**, **bandgap**, **silicon photonics**, **co-packaged optics**, **qubit fisico**, **qubit logico**, **correzione quantistica degli errori**, **chiplet**, **integrazione 2.5D/3D**, **HBM**, **muro della memoria**, **technology readiness level/pilot line**.

---

## NUFs (Goal Scoring — 10 punti atomici)

utility(reader): Il lettore può separare cinque livelli spesso compressi nell'etichetta «post-silicio» — materiale, dispositivo, interconnessione, architettura e paradigma di calcolo — e indicare quale livello ciascuna tecnologia del capitolo sostituisce davvero. → score += 1

utility(reader): Il lettore può applicare a una promessa tecnologica il test dei cinque cancelli — vantaggio fisico misurato, funzione sostituita, fabbricabilità/yield, ecosistema necessario e leva geopolitica — senza scambiare un record di laboratorio per capacità industriale. → score += 1

utility(reader): Il lettore può spiegare perché il grafene è promettente per alcune funzioni ma problematico come transistor logico digitale, distinguendolo dai semiconduttori 2D con bandgap e dai materiali wide-bandgap già commerciali in applicazioni di potenza. → score += 1

utility(reader): Il lettore può distinguere il trasporto ottico dei dati dal calcolo fotonico, seguendo il segnale attraverso laser, guida d'onda, modulatore, rivelatore, conversione elettronica e packaging fino al vincolo che limita il vantaggio di sistema. → score += 1

utility(reader): Il lettore può confrontare piattaforme quantistiche senza usare il solo numero di qubit fisici, passando da fedeltà ed errori a qubit logici, profondità del circuito, workload utile e dipendenze classiche della macchina. → score += 1

utility(reader): Il lettore può costruire una scorecard geopolitica separando leadership nella ricerca, IP, tool/materiali, fabbricazione, packaging, sistemi, standard e domanda, e può quindi rispondere «chi sta vincendo?» per strato e orizzonte invece che con un podio nazionale unico. → score += 1

utility(emotional): Il lettore prova meraviglia per progressi ingegneristici reali e, subito dopo, una sobria inquietudine quando la distinta base rivela che ogni libertà da un vecchio collo di bottiglia ne introduce o rafforza almeno un altro. → score += 1

utility(emotional): Il lettore termina il libro con agency analitica, non con fatalismo: sa riconoscere la distanza fra annuncio e produzione e sa localizzare il potere materiale nascosto dentro una tecnologia presentata come inevitabile. → score += 1

utility(factual): Per almeno una milestone di materiali 2D, una di fotonica e una quantistica, data, dispositivo, metrica, condizioni di misura, stato di peer review/validazione indipendente e distanza dalla produzione sono citati da fonte primaria e triangolati. → score += 1

utility(factual): Finanziamenti, brevetti, paper, pilot line, capacità produttiva, prodotti e restrizioni all'export di Stati Uniti, Cina, UE, Taiwan, Giappone e Corea del Sud sono confrontati con denominatori e anni omogenei; input e risultato conseguito restano colonne separate. → score += 1

---

## BEAT LIST

### Beat 1 — La macchina post-silicio è piena di silicio
**Core question:** Che cosa resta della promessa «oltre il silicio» quando si apre fisicamente un dispositivo dimostrativo e si segue ogni componente che gli permette di funzionare?
**Audience tag:** [BOTH]
**Word count target:** 850–900 parole
**Funzione:** Hook / Establish / Method
**Research dependence:** [WEB-PRIMARY]
**NUF coverage primaria:** NUF 1, 2, 7, 9
**Key facts che il Ricercatore deve trovare:**
- Selezionare un solo oggetto o evento datato e osservabile entro il cutoff — processore quantistico in funzione, wafer 300 mm con dispositivo 2D, modulo fotonico co-packaged o acceleratore ottico — con accesso a paper, scheda tecnica, immagini e almeno una validazione indipendente. Evitare un rendering o un annuncio privo di hardware verificabile.
- Ricostruire la distinta base funzionale dell'oggetto: materiale attivo, substrato, processo litografico, foundry/pilot line, elettronica CMOS di controllo, memoria, laser/criogenia se presenti, package, alimentazione, software e rete.
- Individuare una scena pubblicamente documentata con persona nominata e azione concreta — ricercatore che legge una misura, tecnico che connette il package, operatore che porta il sistema alla temperatura di lavoro — senza inventare dialoghi o accesso al laboratorio.
- Trovare un dettaglio `[SHADOW]` misurabile che smentisca o qualifichi l'etichetta: temperatura, dimensione del wafer, numero di cavi, potenza, tempo di calibrazione, perdita ottica, peso del criostato o costo del sistema.
- Definire i cinque cancelli che governeranno il capitolo: (1) vantaggio fisico rispetto al baseline; (2) funzione realmente sostituita; (3) yield/ripetibilità/scala; (4) dipendenze di filiera; (5) soggetto che controlla il nuovo collo di bottiglia.
- Separare «prima mondiale», «record», «prototipo», «pilot line», «sample a clienti», «produzione in volume» e «vantaggio economico» usando definizioni industriali o TRL dichiarati; nessuna etichetta dell'ufficio stampa va accettata senza criterio.
- Aprire il contrasto centrale: il nucleo può usare una fisica nuova mentre tutto ciò che lo alimenta, controlla, impacchetta e rende vendibile resta nella filiera dei semiconduttori convenzionali.

### Beat 2 — Il grafene non trova l'interruttore
**Core question:** Quali limiti del silicio risolvono davvero grafene, semiconduttori bidimensionali, carburo di silicio e nitruro di gallio — e perché non sono quattro candidati allo stesso trono?
**Audience tag:** [EXPERT]
**Word count target:** 900–950 parole
**Funzione:** Technical reveal / Classification / Reality check
**Research dependence:** [WEB-PRIMARY]
**NUF coverage primaria:** NUF 1, 2, 3, 9
**Key facts che il Ricercatore deve trovare:**
- Spiegare con una sola misura leggibile che cosa il silicio sta faticando a fare: leakage/controllo elettrostatico alle scale avanzate, densità di potenza, resistenza delle interconnessioni oppure efficienza nella conversione di potenza. Scegliere il vincolo meglio documentato, senza dichiarare genericamente «fine della legge di Moore».
- Per il grafene: mobilità, conducibilità termica e assenza/difficoltà di apertura di un bandgap utile alla logica digitale; distinguere prestazioni intrinseche, transistor dimostrativi e possibili ruoli in sensori, RF, interconnessioni o gestione termica.
- Per un TMD 2D scelto — MoS₂, WS₂ o altro solo se la fonte lo giustifica — trovare dimensione del wafer, lunghezza di gate, corrente on/off, resistenza di contatto, uniformità, temperatura di processo, numero di dispositivi misurati e resa; un dispositivo campione non rappresenta il wafer intero.
- Verificare quali passaggi del dimostratore usano tool e infrastrutture CMOS esistenti: crescita/trasferimento del materiale, deposizione, litografia, etch, metrologia, contaminazione e integrazione BEOL/front-end. Indicare se l'esperimento è avvenuto su linea universitaria, pilot line imec/CEA-Leti o foundry commerciale.
- Usare SiC oppure GaN come controesempio commerciale chirurgico: applicazione specifica, tensione/temperatura/efficienza, wafer diameter, difetti/yield, capacità e costo. Mostrare che «sostituire il silicio» in un inverter non equivale a sostituirlo in una CPU.
- Cercare roadmap IRDS/imec/IEEE e paper peer-reviewed che definiscano il ruolo possibile dei canali 2D oltre GAA/CFET; riportare finestre temporali come scenari condizionati, non date di arrivo.
- Mappare i potenziali nuovi choke point: cristalli/substrati, precursori, epitassia, brevetti, metrologia atomica, foundry e qualifica automotive/industriale; verificare concentrazione geografica e capacità effettiva, non soltanto sedi societarie.
- Dettaglio `[SHADOW]`: spessore in strati atomici, wafer visibile, difetto misurato al microscopio, temperatura di crescita o scarto di resa; deve tradurre il passaggio dal foglio di laboratorio alla fab.

### Beat 3 — Il fotone arriva al muro della memoria
**Core question:** La fotonica elimina il collo di bottiglia del transistor oppure sposta il costo nel laser, nelle conversioni e nel package?
**Audience tag:** [BOTH]
**Word count target:** 900–950 parole
**Funzione:** System trace / Complicate / Payoff
**Research dependence:** [WEB-PRIMARY]
**NUF coverage primaria:** NUF 1, 2, 4, 7, 9
**Key facts che il Ricercatore deve trovare:**
- Separare tre categorie con prodotti o dimostratori reali: silicon photonics per comunicazioni, optical/co-packaged interconnect per collegare chip e sistemi, photonic computing per eseguire operazioni. Non trasferire automaticamente la maturità della prima alle altre due.
- Seguire un solo segnale end-to-end: laser → accoppiamento → guida d'onda → modulatore → propagazione → rivelatore → ADC/DAC o circuito elettronico → memoria/package; per ogni passaggio cercare perdita, energia per bit/MAC, banda, latenza e tolleranza termica con perimetro di misura esplicito.
- Verificare il vincolo che motiva l'adozione — crescita del traffico die-to-die/rack-to-rack, energia del data movement o memory wall — usando dati di sistema e non la sola efficienza del core fotonico.
- Confrontare almeno un prodotto in spedizione o sampling con un prototipo accademico: nodo/processo, foundry, volume, cliente/partner, standard di interfaccia, data promessa e stato conseguito al cutoff.
- Mappare chi controlla laser III-V, wafer silicon-on-insulator, modulatori, fibre/connettori, packaging di precisione, foundry fotonica, test e software; verificare se l'integrazione eterogenea riduce o aumenta la dipendenza da TSMC e dall'advanced packaging.
- Verificare, senza presupporlo, il ruolo di TSMC COUPE, Intel, GlobalFoundries, Broadcom, Nvidia, imec, CEA-Leti, Ayar Labs, Lightmatter e di operatori cinesi comparabili emersi entro il cutoff; presenza in una roadmap non equivale a quota di mercato.
- Per la continuità lituana, cercare un solo nesso industriale documentato fra Ekspla/Light Conversion/FTMC/Brolis o altri soggetti lituani e silicon photonics, optical computing o packaging; in assenza di cliente, processo e prodotto, dichiarare che il primato laser del capitolo 6 non crea automaticamente una leva in questo mercato.
- Dettaglio `[SHADOW]`: fibra agganciata al package, tolleranza di allineamento, potenza del laser, temperatura di stabilizzazione o perdita in dB; il numero deve spiegare dove il vantaggio ottico viene consumato.

### Beat 4 — Un qubit non sostituisce una CPU
**Core question:** Quale prova trasforma un processore quantistico da esperimento controllato in capacità strategica, e come si confrontano macchine costruite con fisiche diverse?
**Audience tag:** [GENERAL]
**Word count target:** 950–1000 parole
**Funzione:** Demystify / Stakes / Comparative test
**Research dependence:** [WEB-PRIMARY]
**NUF coverage primaria:** NUF 1, 2, 5, 7, 9
**Key facts che il Ricercatore deve trovare:**
- Definire QPU e calcolo ibrido classico-quantistico; mostrare quali compiti restano a CPU/GPU, elettronica di controllo, compilatore, rete e data center. Vietata la formula «il computer quantistico sostituirà il computer».
- Confrontare piattaforme superconduttive, ioni intrappolati, atomi neutri, fotonica e spin nel silicio con metriche adatte alla rispettiva architettura: fedeltà a uno/due qubit, connettività, coerenza, velocità di gate, perdita, errori di lettura, circuit depth e overhead operativo. Non costruire una classifica sommando metriche incompatibili.
- Ricostruire almeno una milestone verificata di correzione degli errori: numero di qubit fisici e logici, codice usato, tasso di errore logico rispetto al fisico, durata/profondità dell'esperimento, condizioni e replica indipendente. Separare «below threshold», «break-even» e calcolo fault-tolerant utile.
- Verificare una rivendicazione di quantum advantage/supremacy e il miglior controargomento classico successivo: workload, tempo, consumo/risorse, utilità economica e accessibilità dei dati. Un benchmark costruito per la macchina non prova vantaggio generale.
- Cercare applicazioni candidate — chimica/materiali, ottimizzazione, simulazione, crittografia — e per una sola stabilire requisito stimato di qubit logici, errore, runtime e confronto con baseline classica; distinguere stima teorica, demo e uso produttivo.
- Mappare la distinta base geopolitica di una piattaforma: fab del chip, giunzioni/materiali, criostato o laser, elettronica RF, amplificatori, fotonica/rivelatori, software, cloud e manutenzione. Individuare i fornitori unici solo con dati verificabili.
- Confrontare Stati Uniti, Cina ed Europa usando milestone validate, accesso ai sistemi, filiera e programmi pubblici; conteggi di brevetti, paper o qubit entrano solo con qualità, famiglia brevettuale, modalità e anno comparabili.
- Trattare il rischio crittografico con proporzionalità: capacità di rompere algoritmi oggi, requisiti stimati per Shor, incertezza temporale e stato della migrazione post-quantum devono comparire nello stesso blocco.
- Dettaglio `[SHADOW]`: temperatura operativa, cablaggio, tasso di errore, tempo di calibrazione, dimensione della trappola o consumo dell'infrastruttura; usarlo per mostrare il costo del qubit logico, non per estetizzare il criostato.

### Beat 5 — Il futuro immediato è impacchettato, non post-silicio
**Core question:** Se il transistor non viene sostituito presto, quanta crescita di prestazione può arrivare da chiplet, memoria e integrazione 2.5D/3D — e chi controlla quella scorciatoia?
**Audience tag:** [EXPERT]
**Word count target:** 900–950 parole
**Funzione:** Near-term reversal / Industrial reality / Reframe
**Research dependence:** [WEB-PRIMARY]
**NUF coverage primaria:** NUF 1, 2, 6, 10
**Key facts che il Ricercatore deve trovare:**
- Spiegare perché chiplet e integrazione eterogenea consentono di combinare die su nodi diversi, aumentare yield economico o banda e riusare IP; confrontare il beneficio con interposer, bridge, micro-bump/hybrid bonding, test known-good-die, calore e complessità di progetto.
- Seguire un solo sistema commerciale — acceleratore AI, CPU server o package HBM — dalla fab dei die alla memoria, al substrate/interposer, all'assemblaggio e test; nominare aziende, siti, nodi, capacità e qualifica senza inferire fornitori non divulgati.
- Quantificare un vincolo del memory wall con metrica e boundary chiari, quindi mostrare cosa HBM e packaging migliorano e cosa lasciano irrisolto: potenza, raffreddamento, latenza, capacità o costo.
- Verificare standard e interoperabilità — UCIe o alternativa pertinente — distinguendo specifica pubblicata, IP disponibile, tape-out interoperabile e prodotto multi-vendor realmente venduto.
- Confrontare TSMC CoWoS/SoIC, Intel EMIB/Foveros, Samsung I-Cube/X-Cube e capacità OSAT soltanto su processi, volumi, clienti e date comparabili; la roadmap non vale come capacità installata.
- Mappare HBM e materiali di packaging: SK hynix, Samsung, Micron, substrate ABF, vetro, bonding/tool, test e metrologia. Verificare dove la concentrazione si restringe rispetto alla foundry front-end.
- Cercare in che misura High-NA EUV, GAA/CFET, backside power delivery e scaling CMOS continuino a sostenere questi sistemi; il «post-silicio» commerciale può rafforzare ASML e TSMC invece di aggirarli.
- Se si include analog in-memory o neuromorfico, usare un solo confronto workload-specific con accuratezza, endurance, rumore, software e baseline digitale; nessuna sottosezione-catalogo.
- Dettaglio `[SHADOW]`: stack HBM, distanza die-to-die, bump pitch, temperatura del package, wafer di bonding o lead time; collegarlo al nuovo punto di strozzatura.

### Beat 6 — Sei potenze, sette classifiche, nessun podio
**Core question:** Chi sta vincendo quando la stessa corsa assegna medaglie diverse a chi pubblica, brevetta, fabbrica, integra, standardizza e compra?
**Audience tag:** [BOTH]
**Word count target:** 900–950 parole
**Funzione:** Geopolitical synthesis / Compare / Pressure test
**Research dependence:** [WEB-PRIMARY]
**NUF coverage primaria:** NUF 6, 8, 10
**Key facts che il Ricercatore deve trovare:**
- Costruire una matrice per Stati Uniti, Cina, UE — con Paesi Bassi e Lituania visibili —, Taiwan, Giappone e Corea del Sud: ricerca validata, famiglie brevettuali di qualità, tool/materiali, pilot line, volume produttivo, packaging, sistemi/cloud, standard e domanda pubblica/privata.
- Per ciascuna delle tre famiglie PRD — materiali, fotonica, quantistico — scegliere non più di due metriche di leadership realmente comparabili; dichiarare ciò che resta non confrontabile invece di forzare un indice composito.
- Separare paese della sede, proprietà, luogo di R&D, luogo di fabbricazione, nazionalità del tool/IP e mercato finale. Un'azienda «americana» fabbricata a Taiwan con tool olandesi e materiali giapponesi non assegna l'intera capacità a una sola bandiera.
- Verificare finanziamenti pubblici annunciati, impegnati, erogati e convertiti in strutture/personale/output per programmi USA, cinesi ed europei; nessun totale pluriennale va confrontato con una spesa annuale o con venture capital privato.
- Cercare export control e screening degli investimenti applicabili a quantum computing, equipment per semiconduttori avanzati, fotonica e materiali; indicare soglia tecnica, giurisdizione, data, alleati aderenti e workaround osservati.
- Confrontare l'argomento «i controlli preservano il vantaggio» con il costo di frammentazione: duplicazione di supply chain, mercati persi, accelerazione dell'autosufficienza, standard incompatibili e ricerca meno aperta; nessun effetto causale senza evidenza.
- Identificare i nuovi choke point meglio documentati — criogenia, laser, materiali III-V/2D, HBM, bonding, EDA, foundry fotonica, standard o energia — e misurare concentrazione, sostituibilità, tempo di qualifica e capacità, non notorietà mediatica.
- Produrre un verdetto condizionato per orizzonte: leadership scientifica, industriale e sistemica possono divergere; «chi vince» deve includere metrica, data e funzione.
- Dettaglio `[SHADOW]`: una pilot line, un impianto di packaging, un criostato consegnato o un wafer compound semiconductor; scegliere un solo luogo dove il finanziamento si è trasformato — oppure non si è trasformato — in capacità fisica.

### Beat 7 — Il collo di bottiglia cambia indirizzo
**Core question:** Dopo nove capitoli, le tecnologie emergenti dissolvono l'asse Veldhoven–Taiwan–Lituania oppure ridisegnano una rete ancora più specializzata e politicamente contendibile?
**Audience tag:** [BOTH]
**Word count target:** 900–950 parole
**Funzione:** Resolve / Synthesis / Final land
**Research dependence:** [WEB-PRIMARY]
**NUF coverage primaria:** NUF 2, 6, 7, 8, 10
**Key facts che il Ricercatore deve trovare:**
- Applicare i cinque cancelli a una matrice finale con una riga per: grafene/2D, SiC o GaN, interconnessione fotonica, calcolo fotonico, quantistico e chiplet/3D. Per ciascuna: funzione sostituita, prova migliore, stato industriale, dipendenze ereditate, nuovo choke point e orizzonte condizionato.
- Distinguere tre verdetti possibili e assegnarli soltanto dopo la ricerca: **rottura** di un monopolio esistente, **aggiramento** limitato a un workload/mercato, **migrazione** della dipendenza verso un altro layer.
- Tornare all'oggetto del Beat 1 e trasformarne la distinta base in una **mappa-passaporto**: per ogni componente critico, luogo di R&D, tool/materiale, fab, package, controllo/software, sostituto e tempo di qualifica. Nessuna domanda in elenco nella chiusa.
- Chiudere esplicitamente i tre nodi del titolo: verificare se Veldhoven resta necessaria alla fabbricazione di supporto; se Taiwan guadagna o perde potere tramite foundry e packaging; se la competenza lituana in laser/materiali acquisisce un ruolo industriale dimostrato o resta una capacità adiacente.
- Bilanciare la conclusione: riconoscere una diversificazione reale dove esiste — piattaforme multiple, standard aperti, foundry alternative, applicazioni mature di SiC/GaN — e indicarne costi, scala e limiti senza sostenere che ogni nuova tecnologia ricrei inevitabilmente un monopolio.
- Non assegnare una data all'«era post-silicio». Usare finestre separate — adozione attuale, pilot/qualifica, ricerca di lungo periodo — con condizioni necessarie e indicatori osservabili, non una previsione unica.
- Consegnare il verdetto del libro: l'innovazione può cambiare il materiale e distribuire alcune funzioni, ma il potere geopolitico risiede nella capacità di integrare e ripetere processi complessi in volume; la ricerca deve stabilire chi controlla questa capacità per ogni layer.
- Dettaglio `[SHADOW]` finale: riprendere un elemento fisico dell'apertura e attribuirgli provenienze verificate, finché l'oggetto «post-silicio» appare come una rete geopolitica materializzata, non come il simbolo astratto del futuro.

---

## REVIEWER READINESS NOTES

### Tension points
1. **Promessa contro distinta base:** l'oggetto dell'apertura sembra liberarsi dal transistor convenzionale; ogni componente aggiunto al passaporto rivela quanta parte della vecchia filiera gli serve ancora.
2. **Record contro produzione:** una milestone autentica supera un limite fisico, ma deve attraversare uniformità, yield, qualifica, volume e costo prima di spostare potere industriale; il lettore deve desiderare il salto e temere il conto.
3. **Qubit fisico contro utilità:** il numero pubblico cresce, poi la correzione degli errori mostra quanto hardware serva per ottenere un qubit logico e un workload verificabile; la tensione nasce dalla misura, non dal dileggio della ricerca.
4. **Diversificazione contro nuova concentrazione:** fotonica, chiplet e nuovi materiali aprono fornitori e architetture, mentre laser, HBM, bonding, criogenia e pilot line possono creare strozzature più strette; tenere aperti entrambi gli esiti fino alla matrice finale.
5. **Orgoglio nazionale contro filiera transnazionale:** Stati e aziende rivendicano leadership, ma il luogo della sede, quello della fab, il tool, il materiale e il cliente appartengono a geografie diverse; la bandiera perde nitidezza quando si apre il package.

### Key chains da rendere esplicite
- limite del transistor/interconnessione → tecnologia candidata → funzione effettivamente sostituita → metrica di vantaggio → costo di integrazione → adozione o mancata adozione;
- proprietà del grafene/2D → bandgap e contatti → comportamento on/off → uniformità/yield → compatibilità con fab → leva industriale;
- traffico dati/memory wall → collegamento elettrico costoso → fotone → laser/modulazione/rivelazione → conversione e packaging → energia/throughput di sistema → nuovo choke point;
- qubit fisico → rumore/fedeltà → codice di correzione → qubit logico → circuito profondo → workload utile → domanda e potere strategico;
- chiplet/HBM → riuso di nodi e banda → interposer/bonding/test → calore e capacità di packaging → concentrazione geografica → resilienza o nuova dipendenza;
- finanziamento annunciato → erogazione → laboratorio/pilot line → personale e tool → wafer/dispositivo → yield → qualifica cliente → volume → vantaggio geopolitico;
- export control → accesso negato → ritardo/costo osservato → investimento sostitutivo → workaround o standard separato → effetto netto sulla leadership;
- nuova tecnologia → distinta base → paese/tool/materiale/fab/package/software → tempo di sostituzione → punto di coercizione politica;
- evidenza dei beat 2–5 → scorecard per layer del Beat 6 → passaporto dell'oggetto nel Beat 7 → risposta alla promessa complessiva del libro.

### Risk proportionality guards
- **«Fine del silicio»:** bilanciare limiti di scaling, potenza e interconnessione con GAA/CFET, High-NA EUV, backside power, packaging e specializzazione che prolungano il CMOS; nessuna data di morte del silicio senza definizione della funzione e del mercato.
- **Grafene/2D:** una prestazione eccezionale su un dispositivo non prova uniformità o yield; l'assenza di produzione in volume non annulla il valore in sensori, RF, interconnessioni o ricerca.
- **SiC/GaN:** riconoscere prodotti, capacità e vantaggi già commerciali; bilanciare costi, difetti, applicazioni e cicli di domanda senza usarli come prova di sostituzione della logica CMOS.
- **Fotonica:** confrontare l'energia del core con laser, conversioni, controllo termico, memoria e package; bilanciare limiti del photonic computing con la maturità reale delle comunicazioni ottiche.
- **Quantistico:** nessun allarme crittografico senza requisiti di qubit logici, errore e runtime e senza lo stato della migrazione post-quantum; nessun «quantum winter» dichiarato ignorando correzione degli errori e risultati replicati.
- **Leadership cinese o occidentale:** patent count, paper count, investimento e raw qubit count non sono proxy automatici di capacità; mostrare qualità, output, accesso a tool, indipendenza della fonte e denominatore.
- **Sussidi:** confrontare promesso, impegnato, erogato e prodotto; riconoscere spillover scientifici e opzioni strategiche anche quando la produzione non è ancora commerciale.
- **Export control:** affiancare obiettivo di sicurezza, prova del rallentamento, costo per imprese/ricerca, incentivo all'autosufficienza e capacità di enforcement; non dedurre l'effetto dalla sola esistenza della norma.
- **Nuovi monopoli:** distinguere concentrazione attuale, barriera alla qualifica e monopolio insostituibile; standard aperti, multi-sourcing e piattaforme concorrenti sono contesto obbligatorio quando esistono.
- **Roadmap e date:** ogni previsione deve riportare autore, data, condizioni e track record se disponibile; scenario aziendale, consenso scientifico e capacità installata restano categorie separate.
- **Energia e ambiente:** numeri su efficienza, acqua, refrigerazione o emissioni devono dichiarare confine del sistema e workload; il vantaggio per operazione non prova una riduzione assoluta del consumo.
- **Lituania:** una competenza scientifica o un laser venduto non equivale a controllo della silicon photonics; bilanciare lo scetticismo con eventuali clienti, fab, brevetti e prodotti documentati senza cancellare capacità reali.
- **Dettagli sensoriali:** ogni temperatura, dimensione, rumore, colore, peso o gesto deve provenire dal dossier `[SHADOW]` e provare un vincolo; niente laboratori compositi o estetica da fantascienza.

### Guardrail per i sei punteggi del Reviewer
- **Narrativa & Struttura:** usare lo stesso test dei cinque cancelli in tutti i beat e far avanzare il passaporto dell'oggetto d'apertura; ogni tecnologia deve risolvere una domanda prima che la scorecard le metta in relazione.
- **Lingua, Stile & Voce:** sarcasmo contro slogan, grafici senza denominatore e roadmap vendute come calendario; mai contro ricercatori, lavoratori o difficoltà scientifiche reali. Il capitolo 8 segnala nove occorrenze residue del tic «Non X. È Y.»: il capitolo 9 non deve usarlo come struttura seriale.
- **Accuratezza Fattuale:** milestone primaria più triangolazione; metrica, test, sample size, stato di peer review, data e maturità sempre espliciti. Claims aziendali e nazionali restano attribuiti.
- **Allineamento al Pubblico:** un concetto tecnico nuovo per volta, tradotto subito nella funzione che cambia e nel soggetto che paga/guadagna; massimo tre paragrafi tecnici prima del ritorno alla filiera.
- **Coinvolgimento Sensoriale & Emotivo:** un dettaglio `[SHADOW]` sourced per beat e una persona nominata nell'apertura; meraviglia e tensione devono nascere dalla macchina reale e dalla sua dipendenza, non da futuri immaginati.
- **Originalità & Angolo:** trattare il futuro come teardown geopolitico e audit di fabbricabilità, non come catalogo CES né come derby USA-Cina; la risposta originale è per layer, metrica e orizzonte.

---

## RESEARCHER BRIEF

**Protocollo per il gap di corpus:** interrogare NotebookLM una sola volta con le quattro query sotto. Se conferma l'assenza, annotarlo nel dossier e passare a web/document scraper e RAG locale. Per i claim aggiornabili usare fonti disponibili al 3 settembre 2026; per ogni fatto contestabile cercare una fonte primaria e almeno una fonte indipendente. Salvare nel dossier sia il claim originario sia eventuali correzioni, repliche fallite o slittamenti di roadmap. Se una metrica, una distinta base o un volume non è pubblico dopo l'intero protocollo a cinque fonti, scrivere `[BLOCKED: needs human input — dato non pubblico/verifica impossibile]`.

### Query NotebookLM esatte
1. `post-silicon graphene two-dimensional materials photonic computing quantum computing semiconductor geopolitics`
2. `silicon photonics co-packaged optics optical computing TSMC ASML Lithuania lasers supply chain`
3. `quantum computing physical logical qubits error correction United States China Europe supply chain`
4. `chiplets advanced packaging HBM post Moore scaling Taiwan Netherlands Japan Korea bottlenecks`

### Query web esatte
1. `site:irds.ieee.org 2024 2025 roadmap beyond CMOS 2D materials logic interconnect pdf`
2. `site:imec-int.com 300mm 2D semiconductor MoS2 WS2 transistor wafer yield contact resistance 2025 2026`
3. `site:leti-cea.com 300 mm 2D materials CMOS integration transistor pilot line 2025 2026`
4. `site:nature.com graphene transistor bandgap digital logic review wafer scale 2024 2025`
5. `site:science.org two-dimensional semiconductor transistor wafer scale yield contact resistance 2024 2025 2026`
6. `site:graphene-flagship.eu graphene electronics roadmap semiconductor manufacturing applications`
7. `site:tsmc.com 2D materials transistor beyond silicon research 2025 2026`
8. `site:ieee.org silicon carbide gallium nitride power semiconductor wafer yield cost capacity review 2025`
9. `SiC GaN power semiconductor production capacity utilization qualification 200mm 300mm 2025 2026 annual report`
10. `site:tsmc.com COUPE silicon photonics co-packaged optics roadmap product 2025 2026`
11. `site:intel.com optical compute interconnect OCI chiplet silicon photonics 2024 2025 status`
12. `site:globalfoundries.com silicon photonics platform volume manufacturing customers 2025 2026`
13. `site:nvidia.com silicon photonics co-packaged optics Spectrum-X Quantum-X shipping 2025 2026`
14. `site:broadcom.com co-packaged optics Bailly Tomahawk silicon photonics production 2025 2026`
15. `site:ayarlabs.com optical I/O chiplet UCIe production sampling customers 2025 2026`
16. `site:lightmatter.co Passage photonic interconnect wafer scale production foundry 2025 2026`
17. `photonic computing accelerator system energy per operation laser ADC DAC memory wall peer reviewed 2025 2026`
18. `site:imec-int.com silicon photonics pilot line foundry heterogeneous integration III-V laser packaging`
19. `Lithuania silicon photonics integrated photonics foundry Brolis FTMC Light Conversion Ekspla customers 2025 2026`
20. `China silicon photonics co-packaged optics optical computing foundry product 2025 2026 primary source`
21. `site:nature.com quantum error correction logical qubit below threshold 2024 2025 2026`
22. `site:quantumai.google Willow surface code below threshold logical error Nature 2024 2025`
23. `site:ibm.com quantum roadmap logical qubits Heron System Two Starling 2025 2026 milestone status`
24. `site:quantinuum.com logical qubit error correction H2 2024 2025 peer reviewed`
25. `site:microsoft.com Majorana 1 topological qubit roadmap evidence 2025 2026 independent critique`
26. `site:nature.com Majorana 1 topological quantum computing evidence critique 2025`
27. `site:ustc.edu.cn Zuchongzhi Jiuzhang quantum advantage error correction 2025 2026 English`
28. `China quantum computing physical logical qubits superconducting photonic neutral atom 2025 2026 peer reviewed`
29. `site:darpa.mil Quantum Benchmarking Initiative QBI verification stage 2025 2026`
30. `site:nist.gov post-quantum cryptography standards migration timeline cryptographically relevant quantum computer`
31. `quantum computing supply chain dilution refrigerator cryogenic amplifier control electronics lasers foundry report 2025`
32. `site:quantumflagship.eu quantum technologies flagship budget results pilot line 2025 2026`
33. `site:eurohpc-ju.europa.eu quantum computers procurement deployment 2025 2026`
34. `site:nsf.gov site:energy.gov quantum computing funding testbeds 2025 2026`
35. `site:quantum.gov US National Quantum Initiative budget report 2025 2026 pdf`
36. `China national quantum funding spending verified facilities 2025 2026 primary documents`
37. `site:bis.gov quantum computing export controls qubits error rates cryogenic equipment 2024 2025 2026`
38. `site:eur-lex.europa.eu quantum technology dual use export control 2025 2026`
39. `site:tsmc.com CoWoS SoIC capacity 2025 2026 annual report advanced packaging`
40. `site:intel.com EMIB Foveros capacity product 2025 2026 advanced packaging`
41. `site:samsung.com I-Cube X-Cube advanced packaging HBM 2025 2026`
42. `site:uciexpress.org specification interoperability chiplet product 2025 2026`
43. `HBM market share production capacity 2025 2026 SK hynix Samsung Micron annual report`
44. `ABF substrate glass core substrate hybrid bonding equipment market concentration qualification 2025 2026`
45. `site:asml.com High NA EUV annual report 2025 2026 customer production status`
46. `GAA CFET backside power delivery production roadmap 2025 2026 TSMC Intel Samsung imec`
47. `US China EU Japan Korea Taiwan semiconductor photonics quantum 2D materials funding announced disbursed 2025 2026`
48. `quantum patents quality patent families US China EU 2025 report methodology`
49. `photonics patents production market share US China Europe Taiwan Japan 2025 methodology`
50. `site:oecd.org quantum technologies semiconductor photonics government support indicators 2025 pdf`
51. `site:ec.europa.eu Chips Joint Undertaking photonics quantum pilot lines funding results 2025 2026`
52. `site:whitehouse.gov semiconductor quantum photonics export controls investment restrictions 2025 2026`
53. `site:gov.cn quantum photonics semiconductor five year plan 2025 2026 official English`
54. `post silicon technology commercial production versus laboratory milestone review 2025 2026`

### Tipi di documento da prioritizzare
1. Paper peer-reviewed con supplementary information, dataset, metodi, numero di dispositivi e condizioni di test; preprint soltanto se etichettato e accompagnato da critica o replica indipendente.
2. Roadmap tecniche IRDS/IEEE, imec, CEA-Leti e organismi metrologici; conservare versione, data, scenario e criteri di maturità.
3. Annual report, SEC filing, investor disclosure e product qualification dei produttori; comunicati stampa utili per localizzare il claim, mai sufficienti da soli per provarlo.
4. Datasheet, process design kit pubblico, foundry platform, standard UCIe/JEDEC/OIF e atti di conferenza tecnica — IEDM, ISSCC, OFC, ECOC, VLSI Symposium — per metriche, interoperabilità e fabbricabilità.
5. Bilanci e documenti di programma di DOE, NSF, DARPA, NIST, National Quantum Initiative, Commissione europea, Chips Joint Undertaking, EuroHPC, Quantum Flagship e agenzie asiatiche; separare stanziato, impegnato ed erogato.
6. Regolamenti e notice ufficiali BIS, Federal Register, EUR-Lex e autorità alleate per export control e investment screening; articoli legali secondari solo per interpretazione triangolata.
7. Documenti primari di TSMC, Intel, Samsung, GlobalFoundries, SK hynix, Micron, ASML e OSAT per nodi, packaging, capacità e date; contare output qualificato, non rendering o metri quadrati costruiti.
8. Fonti universitarie e aziendali originarie per Google, IBM, Quantinuum, Microsoft, USTC e altre piattaforme quantistiche, affiancate da paper/analisi indipendenti che contestino o confermino la metrica.
9. Dati PATSTAT/WIPO/OECD o studi bibliometrici con metodologia per brevetti e paper; vietate classifiche mediatiche prive di famiglie brevettuali, citazioni, qualità o normalizzazione temporale.
10. Report di filiera con fonti dichiarate per laser, wafer SOI/SiC/GaN, materiali III-V, criogenia, HBM, substrate, bonding e test; stime di mercato commerciali vanno triangolate e non sostituiscono capacità nominale/effettiva.
11. Interviste integrali e visite documentate a laboratorio/pilot line per persone e dettagli `[SHADOW]`; nessuna ricostruzione sensoriale da fotografia senza didascalia, data e luogo.
12. Reuters, Bloomberg, Financial Times, Nikkei Asia, IEEE Spectrum, Nature News e media tecnici affidabili per cronologie, slittamenti, clienti e contestazioni; risalire sempre al paper, filing o atto normativo originario.

### Fatti, date, nomi e numeri da cacciare
- Per l'oggetto d'apertura: data e luogo della demo, persona nominata, materiale/processo, fab/pilot line, temperatura/potenza, package, elettronica classica, software, metrica rivendicata, validazione e stato commerciale.
- Definizioni industriali verificabili di paper, prototype, engineering sample, pilot line, qualification, risk production e high-volume manufacturing; eventuale mappatura TRL con limiti.
- Limite fisico scelto come baseline: unità, nodo, struttura transistor/interconnect, temperatura, leakage/resistenza/potenza e confronto omogeneo.
- Grafene: bandgap, on/off ratio, mobilità nelle condizioni del dispositivo e migliore risultato wafer-scale; separare valore del materiale ideale da quello integrato.
- TMD 2D: materiale, gate length, wafer diameter, numero di dispositivi, uniformità/yield, contatti, processo termico, contaminazione e compatibilità BEOL/CMOS.
- SiC/GaN: wafer da 150/200/300 mm ove applicabile, difetti, yield, costo, capacità nominale ed effettiva, applicazione e qualifica; verificare cancellazioni, ritardi o sovracapacità fino al cutoff.
- Fotonica: energia per bit/MAC, bandwidth density, insertion loss, laser wall-plug efficiency, potenza di tuning termico, accuratezza, ADC/DAC e confine del benchmark.
- Stato al cutoff di TSMC COUPE, Intel OCI, GlobalFoundries silicon photonics e almeno un prodotto co-packaged optics: announced, sampled, shipped, qualified o delayed.
- Per Ayar Labs/Lightmatter o comparabili: foundry, partner, standard, prodotto, data di sampling/spedizione, cliente nominato e volume; nessuna valutazione finanziaria come prova tecnica.
- Mappa della filiera fotonica: sorgenti III-V, SOI, modulatori, rivelatori, fibre, connettori, packaging/test e software; quota/capacità e secondo fornitore dove pubblici.
- Lituania: prodotto e cliente specifici in integrated photonics/optical compute oppure evidenza negativa dopo ricerca; distinguere laser scientifici, micromachining, semiconduttori optoelettronici e foundry fotonica.
- Per ogni piattaforma quantistica: qubit fisici, fedeltà, gate speed, connettività, coerenza, errore di lettura, qubit logici e benchmark; mai confrontare un solo campo.
- Google Willow e lavori successivi: data, paper, surface-code distance, logical error scaling, numero di cicli e critica/replica; verificare aggiornamenti entro il cutoff.
- IBM roadmap e hardware consegnato: Heron/System Two e milestone successive, numero di sistemi accessibili, clienti e differenza fra roadmap e risultato.
- Quantinuum/Microsoft/USTC e altri claim: evidenza peer-reviewed, metrica, ruolo dell'hardware, contestazioni e correzioni; preservare conflitti nel dossier.
- Stima delle risorse per una sola applicazione quantistica utile e per Shor contro crittografia rilevante: logical qubits, physical overhead, error rate, runtime e range fra studi.
- Stato degli standard post-quantum NIST e delle migrazioni istituzionali al cutoff, come contesto obbligatorio del rischio crittografico.
- Distinta base e localizzazione di almeno una QPU: foundry, materiale, criostato/laser, amplificatori, controllo, package, software e cloud; tempo di sostituzione se disponibile.
- Chiplet/HBM: un package commerciale completo, nodi dei die, tipo e generazione HBM, stack, interposer/bridge, fab, assemblaggio/test, capacità e lead time.
- Capacità effettiva e piani datati di CoWoS/SoIC, EMIB/Foveros, I-Cube/X-Cube e OSAT; separare wafer/month, package/month, linee e ricavi.
- HBM: quote con denominatore e trimestre/anno, capacità/bit shipments, qualifica cliente e colli di bottiglia; non confondere DRAM totale e HBM.
- High-NA EUV, GAA/CFET e backside power: primo tool/processo, cliente, stato di qualifica/produzione e funzione; verificare quanto la roadmap post-Moore continui a dipendere da ASML.
- UCIe: versione e data dello standard, membri, dimostrazione multi-vendor, IP e prodotto commerciale; adesione al consorzio non equivale a interoperabilità consegnata.
- Finanziamenti nazionali: valuta, anno-base, periodo, settore incluso, annunciato/impegnato/erogato, strutture costruite, personale e output; convertire valute solo con tasso e data dichiarati.
- Export control quantum/fotonica/materiali: parametro tecnico soglia, data di entrata in vigore, paese, alleati, licenze, casi di enforcement ed effetti osservati.
- Brevetti e paper: database, query, famiglie, fractional counting, citazioni/qualità, ritardo di pubblicazione e anni omogenei; nessun totale grezzo in classifica.
- Per la matrice finale: sostituto, funzione, prova, TRL/stato produttivo, tool/fab/package, choke point, secondo fornitore, tempo di qualifica e orizzonte per ogni tecnologia.

### Conflitti attesi da preservare nel dossier
- `post-silicio` come nuovo materiale vs dispositivo che usa ancora substrato, fab, controllo o package al silicio;
- `record del singolo dispositivo` vs uniformità e yield sul wafer;
- `grafene ad alta mobilità` vs assenza/difficoltà di bandgap per logica digitale;
- `materiale 2D atomically thin` vs contatti, crescita, trasferimento e contaminazione industriale;
- `SiC/GaN già commerciali` vs sostituzione limitata alla potenza/RF e non alla logica generale;
- `silicon photonics in volume` vs photonic computing ancora dimostrativo;
- `efficienza del core ottico` vs energia di laser, ADC/DAC, memoria, tuning e package;
- `raw physical qubits` vs qubit logici e workload utile;
- `quantum advantage` vs miglior algoritmo/hardware classico successivo e utilità economica;
- `roadmap fault-tolerant` vs milestone consegnata al cutoff;
- `patent/paper leadership` vs tool, fabbricazione, accesso e prodotto;
- `finanziamento annunciato` vs denaro erogato e capacità fisica costruita;
- `azienda nazionale` vs filiera e sito produttivo transnazionali;
- `export control come ritardo` vs incentivo all'autosufficienza e costo per il controllore;
- `chiplet come interoperabilità` vs package ancora proprietario e qualifica multi-vendor assente;
- `diversificazione tecnologica` vs concentrazione in HBM, bonding, criogenia, laser o foundry;
- `Lituania potenza laser` vs ruolo non dimostrato nella integrated photonics;
- `nuova tecnologia rompe il monopolio` vs vecchio monopolio rafforzato dal supporto CMOS/packaging.

---

## TARGET

**Word count:** 6.300–6.650 parole — il PRD non assegna una lunghezza autonoma al capitolo 9; l'intervallo coincide con la somma dei sette beat, resta nella fascia lunga stabilita dai capitoli 6–8 e concede spazio alla comparazione senza trasformare il finale in un catalogo tecnologico.

**Opening hook strategy:** Aprire sul funzionamento documentato di un solo oggetto definito «post-silicio», fissarne un dettaglio fisico sorprendente e iniziare subito a compilare la distinta base che rivela quanta filiera convenzionale gli serve.

**Closing beat promise:** Tornare allo stesso oggetto, trasformarne la distinta base in un passaporto geopolitico completo e chiudere il libro mostrando se il nuovo ordine spezza l'asse Veldhoven–Taiwan–Lituania o distribuisce i suoi colli di bottiglia su una rete ancora più contendibile.
