# DOSSIER — Capitolo 5: L'Assedio Logistico di Pechino

**Nota metodologica:** NotebookLM non è stato interrogabile in questa sessione — i file della skill `notebooklm-skill` risultano cancellati dall'ambiente (`git status` mostra l'intera directory `.agents/skills/notebooklm-skill/` come eliminata), coerentemente con il blocco già segnalato per i capp. 1-4 in `oracle_questions.md`. L'intero dossier si basa quindi su web search, in linea con la procedura di fallback prevista da `INSTRUCTION.md`. Da segnalare all'umano come nuovo item in `oracle_questions.md`.

---

## [PUBLIC]

**Source:** Wikipedia, "Huawei Mate 60"; Washington Post (2/9/2023); VOA News | **Fact:** Il Huawei Mate 60 Pro è stato messo in prevendita silenziosa, senza conferenza stampa, sul sito ufficiale Huawei il 29 agosto 2023 — la stessa finestra della visita in Cina della Segretaria al Commercio USA Gina Raimondo. Il lancio era originariamente previsto per il 12 settembre 2023, ma è stato anticipato.

**Source:** VOA News, "China's Propaganda Victory Over US Sanctions"; Quora (aggregazione fonti) | **Fact:** Il momento della prevendita — durante la visita di Raimondo — è stato ampiamente letto come una dichiarazione politica deliberata da parte di Huawei/Pechino.

**Source:** Fortune Asia (6/10/2023) | **Fact:** Raimondo ha definito il chip Huawei "incredibly disturbing" in una testimonianza al Senato USA (ottobre 2023).

**Source:** Washington Post (2/9/2023) | **Fact:** Il lancio del Mate 60 Pro ha alimentato preoccupazioni pubbliche che le sanzioni USA contro Huawei/SMIC non avessero funzionato come previsto.

**Source:** TechInsights, "HiSilicon Kirin 9000s Hi36A0 GFCV120 SMIC 7 nm N+2 FinFET Process" (report DFR-2309-801, ACE-2309-801) | **Fact:** Il teardown TechInsights, completato il 30 ottobre 2023, ha identificato il System-on-Chip Kirin 9000s come fabbricato da SMIC con processo di seconda generazione "N+2", classificato come 7nm-class. Il report include foto del die, X-ray del package, e micrografie SEM (fin/STI, gate, contatti, metal pitch minimo).

**Source:** TechInsights, blog "Huawei Strikes Back" | **Fact:** Il processo SMIC N+2 rappresenta, secondo TechInsights, il primo caso commerciale identificato di un nodo logico avanzato prodotto senza litografia EUV da una fonderia cinese, con piena funzionalità SoC (SRAM embedded, elementi passivi, ecc.).

**Source:** TechInsights, "HiSilicon Kirin 9010 Powers the Huawei Pura 70 Ultra"; The Register (29/4/2024); Taipei Times (27/4/2024) | **Fact:** Il Kirin 9010, nel Pura 70 (aprile 2024), è prodotto sullo stesso processo SMIC 7nm N+2 usato per il Kirin 9000s — confermando che la produzione è proseguita oltre il prototipo iniziale.

**Source:** iFixit, "Huawei's Kirin 9010 Is a Reality Check for China's Semiconductor Ambitions" | **Fact:** iFixit descrive il Kirin 9010 come un "reality check" — un'evoluzione incrementale, non un salto di nodo, rispetto al Kirin 9000s.

**Source:** Reuters/Jefferies (via wccftech, Register) | **Fact:** La serie Pura 70 è andata sold-out entro due giorni dal lancio (fine aprile 2024), secondo controlli di mercato di analisti Jefferies.

**Source:** wccftech, Tom's Hardware (analisi aggregata mercato) | **Fact:** I ritardi/backlog di ordini per Pura 70 e Mate 60 indicano che il processo N+2 non produce rese sufficienti a soddisfare la domanda — un vincolo di capacità, non solo di prototipo.

**Source:** China National Integrated Circuit Industry Investment Fund — copertura aggregata Gizmochina, Caixin Global, Nikkei Asia, Taipei Times (28-30/5/2024) | **Fact:** Big Fund Fase III è stato costituito il 24 maggio 2024, con capitale registrato di 344 miliardi di yuan (~47,5 miliardi di dollari) — il più grande investimento statale mai stanziato per il settore semiconduttori cinese.

**Source:** Nikkei Asia, Caixin Global | **Fact:** Big Fund III è finanziato da 19 investitori statali guidati dal Ministero delle Finanze; cinque grandi banche cinesi (ICBC, China Construction Bank, Agricultural Bank of China, Bank of China, Bank of Communications) contribuiscono ciascuna circa il 6% del capitale totale.

**Source:** Copertura aggregata (Gizmochina et al.) | **Fact:** Fase I del Big Fund: 2014, capitale registrato 138,7 miliardi di yuan. Fase II: 2019, capitale registrato 204 miliardi di yuan. Fase III: 2024, 344 miliardi di yuan.

**Source:** SCMP, "China taps new Big Fund president in wake of corruption scandals"; TechNode (29/7/2022, 1/8/2022); Caixin Global (29/7/2022); MIT Technology Review (5/8/2022) | **Fact:** Ding Wenwu, presidente/CEO del Big Fund (China Integrated Circuit Industry Investment Fund), è stato posto sotto indagine anticorruzione il 30 luglio 2022 dalla Commissione Centrale per l'Ispezione Disciplinare cinese, con l'accusa di "gravi violazioni di legge sospette".

**Source:** SCMP, "China's state-run semiconductor fund engulfed in scandal" | **Fact:** Oltre a Ding Wenwu, anche Wang Wenzhong (ex partner del Big Fund con base a Shenzhen) è stato arrestato; l'indagine ha coinvolto almeno tre dirigenti senior del fondo.

**Source:** TechNode, "After a year of corruption scandals, China's national chip fund forges ahead" (4/1/2023) | **Fact:** Tra fine marzo e agosto 2022, il Big Fund non ha effettuato alcun nuovo investimento. Nel 2022 il fondo ha realizzato un totale di 8 investimenti, contro i 14 del 2021 — un calo attribuito direttamente allo scandalo.

**Source:** TechInsights, "TrendForce"/wccftech (aggregato analisti) | **Fact:** Le stime di yield per il processo SMIC 7nm-class sono divergenti e non ufficiali: a maggio 2024 gli analisti di mercato stimavano un tasso inferiore al 50%; report più recenti (2025-2026) parlano di un miglioramento al 60-70%, contro un tasso iniziale sotto il 40% al lancio (H2 2023). **Nessuna cifra è dato ufficiale SMIC.**

**Source:** TrendForce (11/2/2026), "SMIC Posts Record $9.3B in 2025 Sales; 7nm Yields Reportedly Weigh on Margins" | **Fact:** Rese basse al nodo 7nm-class sono citate come fattore di compressione dei margini, insieme a maggiori costi di ammortamento, nei risultati SMIC 2025.

**Source:** SemiWiki, "SMIC BEOL photolithography process analysis / N+3 yield issues" | **Fact:** SMIC ha avviato un processo di terza generazione (N+3), analizzato da TechInsights nel Kirin 9030 (Huawei Mate 70 Pro+), con progressi ulteriori verso una densità paragonabile al 5nm ma sempre senza EUV.

**Source:** Wikipedia "SiCarrier"; SCMP; TechNode (Semicon China 2025) | **Fact:** SiCarrier Technology, con sede a Shenzhen, è stata fondata nell'agosto 2021, con il sostegno del governo municipale di Shenzhen. La società ha legami riportati (ma mai confermati ufficialmente da nessuna delle due parti) con Huawei.

**Source:** SCMP, "Huawei-related chip tool maker SiCarrier steals the show at Shanghai trade fair" | **Fact:** Nel 2023 SiCarrier ha ottenuto un brevetto per un processo che produce chip a nodo 5nm usando strumenti DUV esistenti — tecnologia vista come possibile base di quella usata da Huawei/SMIC per il chip 7nm del Mate 60 Pro (collegamento riportato, non confermato ufficialmente da nessuna delle parti).

**Source:** Digitimes (14/5/2025) | **Fact:** SiCarrier cerca di raccogliere 2,8 miliardi di dollari nel suo primo round di finanziamento, con una valutazione target di circa 11 miliardi di dollari.

**Source:** Federal Register, Vol. 89, No. 234 (5/12/2024), doc. 2024-28267 | **Fact:** NAURA (con molteplici sussidiarie: Wuhan, Wuxi, Xi'an, Shenzhen Naura Microelectronics Equipment), Kingsemi (incl. Kingsemi Japan K.K.), Piotech e Skyverse (incl. Zhuhai Skyverse Technology, Shenzhen Qianhai Skyverse Semiconductor Technology, Skyverse Pte. Ltd. Singapore) sono state aggiunte all'Entity List del BIS il 5 dicembre 2024, motivazione ufficiale: supporto allo sviluppo/produzione di circuiti integrati per uso finale militare.

**Source:** SemiMedia, iSTART-TEK | **Fact:** La "terza ondata" di controlli export di dicembre 2024 ha aggiunto complessivamente 140 aziende cinesi all'Entity List.

**Source:** Piotech (dichiarazione pubblica, dicembre 2024, via copertura aggregata) | **Fact:** Piotech ha dichiarato che l'inclusione nell'Entity List non avrebbe avuto un impatto sostanziale sulle operazioni quotidiane.

**Source:** Wedbush/tokenring (21/1/2026); TrendForce (14/2/2025); SCMP, "The great chip leap" | **Fact:** Il tasso di autosufficienza cinese nella componentistica per semiconduttori: 13,6% nel 2024 → 35% a gennaio 2026, superando l'obiettivo di Pechino del 30% fissato a inizio 2025. TrendForce (febbraio 2025) riportava proiezioni al 50% entro il 2025 — cifra non confermata dai dati successivi (35% a inizio 2026), quindi da trattare come stima previsionale non realizzata nei tempi.

**Source:** Wedbush/tokenring | **Fact:** Nei mercati di etching, cleaning, photoresist stripping e CMP, il tasso di autosufficienza cinese ha superato la doppia cifra percentuale. Risultati specifici citati: validazione dell'impiantatore ionico Power-750H e scaling dei sistemi DUV di SMEE.

**Source:** Electronics Weekly (marzo 2026) | **Fact:** La Cina ha fissato un nuovo obiettivo di autosufficienza semiconduttori dell'80% entro un orizzonte più lungo (riportato marzo 2026) — obiettivo dichiarato, non ancora raggiunto.

**Source:** Wedbush/tokenring | **Fact:** Nel 2025, entità statali cinesi hanno piazzato un numero record di 421 ordini per macchine di litografia domestiche e componenti, per un valore di circa 850 milioni di yuan.

**Source:** CSET (Georgetown), "Pushing the Limits: Huawei's AI Chip Tests U.S. Export Controls" | **Fact:** Huawei ha progettato un chip AI (serie Ascend 910) a prestazioni più elevate del previsto, prodotto internamente da SMIC, per soddisfare parte della domanda cinese di calcolo AI nonostante le restrizioni export dal 2019.

**Source:** CSET | **Fact:** Solo il 75% dell'incremento teorico di prestazioni tra Ascend 910 e 910B è attribuibile a un reale aumento delle prestazioni hardware; Huawei ha inoltre ridotto il numero di core AI attivi tra le due generazioni — probabile indicatore di rese basse o capacità limitata sul processo 7nm SMIC.

**Source:** CSIS, "DeepSeek, Huawei, Export Controls, and the Future of the U.S.-China AI Race" | **Fact:** Funzionari governativi hanno riferito a CSIS che TSMC ha fabbricato oltre 2 milioni di die logici Ascend 910B per conto di società di comodo Huawei, in violazione dei controlli export USA — tutti i die risultano ora in possesso di Huawei.

**Source:** CSIS | **Fact:** DeepSeek ha valutato i chip Ascend e li ha giudicati poco attraenti per l'addestramento di modelli AI, ma ciascun Ascend 910C fornirebbe circa il 60% delle prestazioni di un Nvidia H100 per l'inferenza.

**Source:** CSIS, "Balancing the Ledger"; "Did U.S. Semiconductor Export Controls Harm Innovation?"; CRS Report R48642 | **Fact:** Una valutazione iniziale degli effetti dei controlli export USA sulla Cina mostra un quadro misto: i controlli hanno limitato l'accesso cinese ad attrezzature essenziali per la produzione di prossima generazione, ma la Cina ha intensificato gli investimenti domestici in chip avanzati, riducendo al contempo la quota di mercato delle aziende USA (e quindi i loro ricavi da reinvestire in R&D).

**Source:** CSIS, "Did U.S. Semiconductor Export Controls Harm Innovation?" | **Fact:** Uno studio su 30 aziende leader nel settore semiconduttori conclude che i recenti controlli export USA mirati alla Cina non hanno ostacolato l'innovazione (delle aziende USA/alleate studiate).

**Source:** ITIF, "How Innovative Is China in Semiconductors?" (19/8/2024) | **Fact:** Nonostante gli obiettivi dichiarati, la Cina rischia di raggiungere solo il 30% di autosufficienza semiconduttori entro fine 2025 — sotto i target originari.

**Source:** Merics, "Huawei is quietly dominating China's semiconductor supply chain" | **Fact:** Huawei ha assunto un ruolo di coordinamento crescente nell'ecosistema cinese di componentistica per semiconduttori, oltre al proprio design di chip.

**Source:** TechWireAsia (aprile 2026); Tom's Hardware; TrendForce (17/4/2026) | **Fact:** Il MATCH Act (Multilateral Alignment of Technology Controls on Hardware Act) è stato introdotto alla Camera USA il 2 aprile 2026, con parallela versione al Senato. Mira a chiudere la "scappatoia" DUV: le regole esistenti impediscono già ad ASML di fornire i sistemi EUV più avanzati alla Cina, ma la società ha continuato a vendere sistemi DUV più vecchi — è proprio questa vendita che il MATCH Act vuole bloccare.

**Source:** TechWireAsia | **Fact:** Il MATCH Act imporrebbe un divieto nazionale sull'export di sistemi di litografia DUV verso la Cina, designerebbe per legge cinque aziende cinesi di semiconduttori come entità soggette a restrizione, e darebbe agli alleati USA 150 giorni per adottare controlli equivalenti prima che Washington espanda unilateralmente la Foreign Direct Product Rule.

**Source:** Tom's Hardware (aggiornamento successivo) | **Fact:** Una versione rivista del MATCH Act ha ammorbidito alcune disposizioni (rimosso il divieto nazionale sulla vendita di strumenti di cryogenic etching) ma mantiene le restrizioni sull'export delle macchine DUV.

**Source:** Tom's Hardware | **Fact:** Le vendite di sistemi ASML alla Cina rappresentavano il 19% del fatturato totale nel primo trimestre (di un anno non specificato con precisione nella fonte aggregata), in calo dal 36% del trimestre di dicembre — indicatore indiretto dell'impatto delle restrizioni già in vigore prima ancora dell'approvazione del MATCH Act.

**Source:** Digitimes (marzo 2023) | **Fact:** I controlli export USA sono stati implementati "a tappe", con la possibilità — secondo analisi Digitimes Research — di arrivare a coprire tutti i sistemi DUV a immersione.

**Source:** Digitimes | **Fact:** I controlli export olandesi, in vigore dalla fine del 2023, hanno richiesto licenze per i sistemi DUV a immersione più avanzati (NXT:2000i e successivi); entro settembre 2024 le restrizioni si sono estese a includere anche NXT:1970i e NXT:1980i.

**Source:** AEI, "The Lithography Loophole: How China Is Printing Its Way to Chip Self-Sufficiency" | **Fact:** La Cina ha acquisito circa 90 macchine ArFi (immersione DUV, principalmente serie ASML NXT:1980Fi di generazione più vecchia) nel 2024, per un valore di 5-7 miliardi di dollari — acquisizioni avvenute prima di qualunque restrizione specifica sugli strumenti DUVi.

**Source:** Tom's Hardware, "Chinese fabs are reportedly upgrading older ASML DUV lithography chipmaking machines" | **Fact:** Fabbriche cinesi (tra cui SMIC e altri produttori sostenuti dallo stato) stanno aggiornando ed estendendo la vita utile di sistemi DUV esistenti tramite canali secondari e ingegneri indipendenti, per "spremere" ulteriore capacità dalle Twinscan NXT già in loro possesso.

**Source:** SemiEngineering, "Single Vs. Multi-Patterning Advancements For EUV"; EDN, "Multi-patterning strategies for navigating the sub-5 nm frontier" | **Fact:** Il Self-Aligned Quadruple Patterning (SAQP) è una tecnica di litografia che usa cicli aggiuntivi di deposizione e etching di "spacer" per quadruplicare la densità del pattern rispetto a una singola esposizione litografica — considerata un'estensione del Double Patterning Litography (DPL), rilevante oltre il nodo 16/14nm.

**Source:** ADS/SPIE abstract, "Exploring EUV and SAQP patterning schemes at 5nm technology node" | **Fact:** Il patterning critico BEOL al nodo 7nm richiede pitch sub-36 nanometri, ottenibili o con litografia EUV o con processi SAQP basati su litografia a immersione 193nm — le due strade sono tecnicamente alternative per lo stesso risultato dimensionale, con costi/complessità molto diversi.

**Source:** Tom's Hardware, "SMIC's third-gen 7nm node shows smaller metal pitch than Intel 18A" | **Fact:** Il nodo di terza generazione SMIC (N+3), analizzato nel Kirin 9030, mostra un metal pitch più piccolo di Intel 18A e una densità di transistor superiore a TSMC N6 — pur restando un processo senza EUV.

**Source:** Tom's Hardware/aggregato tecnico | **Fact:** SMIC N+2 raggiunge una densità di 127 milioni di transistor per mm², contro i 117 milioni di TSMC N7+; SMIC N+1 (generazione precedente) raggiunge 89 milioni di transistor per mm², paragonabile a TSMC N7/Intel 10nm.

**Source:** SemiconductorX, "Process Nodes: N3, N2, 18A, SF3" (analisi aggregata) | **Fact:** Il numero "nm" nei nomi dei nodi di processo non corrisponde ad alcuna dimensione fisica reale del transistor da circa il 2009 — è una convenzione di marketing/continuità di roadmap, non una misura diretta comparabile tra fonderie diverse.

---

## [SHADOW]

**Source:** Lowyat.NET, "Huawei Launches Mate 60 Pro; Retails At 6,999 Yuan" | **Detail:** Prezzo di lancio del Mate 60 Pro: 6.999 yuan (circa 960 dollari USA) al primo giorno di vendita.

**Source:** TechNode, "Huawei saw a sellout launch of Mate 60 Pro model on September 3" | **Detail:** Le vendite complete (non solo prevendita) sono partite il 3 settembre 2023 su Huawei VMall, Taobao e JD.com, ed è andato sold-out lo stesso giorno.

**Source:** Yicai Global, "Huawei's First Satellite Phone Mate 60 Pro Gets Sold Out in Two Days" | **Detail:** Il Mate 60 Pro (descritto anche come "primo telefono satellitare" di Huawei per la funzione di chiamata satellitare) è andato esaurito in due giorni.

**Source:** Global Times (copertura di stato, da trattare con cautela) | **Detail:** Sono state riportate code fisiche fuori dai negozi Huawei nelle principali città cinesi nel weekend successivo al lancio (2-3 settembre 2023).

**Source:** Aggregato media (via ricerca) | **Detail:** Presso il negozio flagship Huawei di Nanjing East Road a Shanghai, lo staff ha dichiarato ai media, il secondo giorno di vendita, di essere già esaurito, con nuovi clienti costretti ad attendere da una a due settimane per ricevere il dispositivo.

**Source:** Gizmochina, "Huawei Mate 60 Scores Big in China, With 1 Million Units Sold in Just 5 Days" | **Detail:** Circa 1 milione di unità vendute nei primi 5 giorni.

**Source:** Copertura aggregata (al 1° settembre 2023) | **Detail:** Quasi 800.000 unità vendute o preordinate tramite Huawei VMall, JD.com e negozi fisici Huawei a Shenzhen entro il 1° settembre 2023.

**Source:** Jefferies (analista Edison Lee, via copertura aggregata) | **Detail:** Secondo l'analista Edison Lee di Jefferies, Huawei avrebbe venduto oltre 2 milioni di unità a partire dal 31 agosto 2023.

**Source:** Huawei Central, Gizguide | **Detail:** Le proiezioni di spedizione per l'intera serie Mate 60 sono state stimate tra 15 e 20 milioni di unità, condizionate alla tenuta della fornitura (cioè della resa produttiva SMIC).

**Source:** TechInsights (report tecnico, ottobre 2023) | **Detail:** Il report di teardown include micrografie SEM plan-view a diversi livelli del die: fin/shallow trench isolation (STI), gate, contatti, e metal pitch minimo — dettaglio fisico diretto della struttura del chip.

**Source:** wccftech, "Huawei's Pura 70 Ultra Teardown Reveals The Kirin 9010 Is Mass Produced On SMIC's 7nm Process" | **Detail:** Il Pura 70 Ultra, lanciato aprile 2024, è andato sold-out entro due giorni secondo controlli di mercato Jefferies — ripetendo il pattern del Mate 60 Pro.

**Source:** CSIS ("Balancing the Ledger" e correlati) | **Detail:** Oltre 2 milioni di die logici Ascend 910B fabbricati da TSMC per conto di società di comodo Huawei — cifra citata da funzionari governativi come dato quantitativo preciso, non stima aggregata.

**Source:** DeepSeek (via CSIS) | **Detail:** Cifra di performance comparativa precisa: Ascend 910C ≈ 60% delle prestazioni di un Nvidia H100 in inferenza — numero specifico da valutazione indipendente (DeepSeek), non da comunicato Huawei.

**Source:** Wedbush/tokenring | **Detail:** 421 ordini piazzati nel 2025 per macchine di litografia domestica e componenti, valore aggregato di circa 850 milioni di yuan — cifra puntuale e datata.

**Source:** Digitimes/AEI | **Detail:** ~90 macchine ArFi acquisite dalla Cina nel 2024, valore 5-7 miliardi di dollari — intervallo di costo per un lotto di macchinari specifico, con anno preciso.

**Source:** Tom's Hardware (dato finanziario ASML) | **Detail:** Quota export ASML verso Cina: 19% del fatturato totale nel trimestre più recente citato, contro 36% nel trimestre di dicembre precedente — calo quantificato in punti percentuali in due trimestri consecutivi.

**Source:** TechNode (1/8/2022) | **Detail:** Il Big Fund non ha effettuato nuovi investimenti da fine marzo ad agosto 2022 (circa 5 mesi di blocco operativo) durante l'indagine anticorruzione; totale investimenti 2022 sceso a 8 (da 14 nel 2021) — un calo del 43% anno su anno riconducibile allo scandalo.

---

## [CONFLICT]

| Claim | Source A | Source B | Resolution |
|---|---|---|---|
| Yield rate del processo SMIC 7nm-class (N+1/N+2) | Stime di mercato (maggio 2024, via copertura aggregata): yield <50% | wccftech (2025-2026, tipster/rumor): yield 60-70%, in miglioramento da <40% al lancio (H2 2023) | Nessuna cifra è dato ufficiale SMIC — l'azienda non pubblica tassi di resa. Il dossier riporta il range completo (<40% al lancio → 50-70% stimato successivamente) e segnala esplicitamente che si tratta di stime di terze parti/rumor, non di dati confermati. Il capitolo deve trattarlo come range, non come cifra secca. |
| Traiettoria dell'autosufficienza cinese nella componentistica per semiconduttori | TrendForce (14/2/2025): proiezione al 50% entro fine 2025 | Wedbush/tokenring (21/1/2026): dato osservato di 35% a gennaio 2026, comunque sopra il target ufficiale del 30% | La proiezione TrendForce di inizio 2025 non si è realizzata nei tempi previsti — il dato osservato successivo (35%) è più basso della proiezione ma comunque superiore all'obiettivo governativo dichiarato. Il capitolo deve usare il dato osservato più recente (35%, gennaio 2026) e segnalare la proiezione TrendForce come stima non confermata, non come fatto. |
| Costo per wafer SMIC vs TSMC comparabile | Nessuna fonte primaria trovata con confronto diretto SMIC-TSMC in percentuale di sovracosto | Fonti secondarie (Silicon Analysts, aggregatori) forniscono solo prezzi TSMC per nodo (es. N3 ~19.500-21.000 USD/wafer), senza equivalente SMIC pubblicato | **[BLOCKED: needs human input]** — nessuna fonte accessibile in questa sessione fornisce una cifra di sovracosto SMIC vs TSMC con provenienza analista nominata (Bernstein Research citato nel brief dell'Architect non è stato reperito con una cifra specifica in questo loop di ricerca). Il capitolo deve segnalare esplicitamente l'assenza di dato pubblico comparativo, oppure servirà una sessione di ricerca aggiuntiva mirata su report Bernstein/SemiAnalysis a pagamento. |
| Nesso causale SiCarrier–Huawei/Mate 60 Pro | SCMP, TechNode: legame "riportato" tra il brevetto SiCarrier 2023 (5nm su strumenti DUV) e la tecnologia usata nel Kirin 9000s | Nessuna delle due aziende (SiCarrier, Huawei) ha mai confermato pubblicamente il collegamento | Il capitolo deve trattare il nesso come ipotesi giornalistica plausibile ma non confermata da fonte primaria aziendale — mai come fatto accertato. |
| Efficacia dei controlli export USA verso la Cina | CSIS/CRS: quadro "misto" — i controlli limitano l'accesso a strumenti essenziali ma la Cina ha accelerato gli investimenti domestici; uno studio su 30 aziende leader trova che i controlli non hanno danneggiato l'innovazione (delle aziende studiate) | Altre fonti aggregate (via ricerca): il "chokepoint strategy" viene descritto come "sempre più una fallacia" perché ha inavvertitamente accelerato la spinta cinese all'innovazione domestica in settori high-tech | Nessuna risoluzione netta possibile: il dibattito accademico/think tank resta aperto. Il capitolo deve riportare entrambe le posizioni esplicitamente in tensione, senza sciogliere l'ambiguità per comodità narrativa — coerente con la tesi centrale del capitolo ("rallentata, non fermata"). |
| Percentuale di autosufficienza semiconduttori — obiettivo dichiarato dal governo cinese | ITIF (19/8/2024): la Cina rischia di raggiungere solo il 30% entro fine 2025, sotto i target originari | Electronics Weekly (marzo 2026): nuovo obiettivo dichiarato dell'80% entro un orizzonte più lungo (non specificato con data precisa nella fonte) | I due dati si riferiscono a target diversi in momenti diversi (target 2025 vs. nuovo target più lungo annunciato nel 2026) — non sono direttamente comparabili. Il capitolo deve datare con precisione ciascun target citato e non fonderli in un'unica cifra. |

---

## Note per oracle_questions.md (da aggiungere)

1. **[BLOCKED]** La skill `notebooklm-skill` risulta interamente cancellata dal filesystem dell'ambiente (non solo symlink rotto come nei capp. 1-4, ma directory intera assente secondo `git status`). Il corpus NotebookLM dichiarato STRONG per questo capitolo (cap. 5) non è stato interrogabile. Domanda per l'umano: la skill va reinstallata da zero, o il progetto deve assumere definitivamente web-search-only anche per i capitoli a coverage STRONG?
2. **[UNVERIFIED]** Cifra specifica di sovracosto per wafer SMIC vs TSMC da fonte analista nominata (Bernstein Research, come indicato nel brief dell'Architect) — non reperita in questo loop di ricerca web pubblica. Probabilmente dietro paywall di report a pagamento (Bernstein, SemiAnalysis). Serve accesso diretto a un report o una citazione stampa che isoli la cifra con fonte primaria nominata.
3. **[UNVERIFIED]** Nessuna fonte identificata in questa sessione riporta una dichiarazione ufficiale diretta e citabile di MOFCOM o Xinhua che affermi esplicitamente "autosufficienza raggiunta" in relazione specifica al Mate 60 Pro/Kirin 9000s — solo copertura Global Times (editoriale, fonte di stato) sulla reazione di Raimondo. Se il Writer necessita di una citazione diretta cinese per il Beat 7, serve una ricerca mirata su Xinhua/MOFCOM in cinese o su traduzioni ufficiali.
