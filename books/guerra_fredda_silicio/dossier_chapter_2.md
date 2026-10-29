# Dossier — Capitolo 2: "Lo Scudo di Silicio"

**Nota metodologica preliminare:** La skill `notebooklm` non risulta installata in questo ambiente (verificato con ricerca filesystem completa — nessun file o script `notebooklm*` trovato, coerente con quanto già segnalato in `oracle_questions.md` per il cap. 1). Le 5 query NotebookLM previste dal RESEARCHER BRIEF non sono state eseguibili. Per istruzione esplicita del brief ("passare a web search appena una query NotebookLM torna vuota o generica, senza ripeterla"), si è passati direttamente a web search come fonte primaria per l'intero capitolo. Questo va segnalato all'Architect/Editor come deviazione dal protocollo standard cap. 1-6 (corpus MEDIA comunque non sarebbe stato sufficiente da solo).

---

## [PUBLIC]

**Source:** Focus Taiwan, "TSMC pure-play foundry market share set to hit 66% in 2025" (IDC data), 14 dic 2024 | **Fact:** Quota di mercato TSMC nelle pure-play foundry globali stimata al 64% nel 2024, prevista in crescita al 66% nel 2025.

**Source:** Focus Taiwan, "TSMC's global market share hits new high of 70.2% in Q2", 6 set 2025 (dati TrendForce) | **Fact:** Nel secondo trimestre 2025 la quota di mercato pure-play foundry di TSMC ha raggiunto un massimo record del 70,2%. Samsung secondo classificato al 7,3%, SMIC (Cina) terzo al 5,1%.

**Source:** Design-Reuse / TrendForce, "Global foundry revenue surged to $41.7 billion in Q2 2025...", 2025 | **Fact:** Il fatturato globale delle foundry nel Q2 2025 ha toccato 41,7 miliardi di dollari; TSMC ne ha catturato circa il 70%.

**Source:** The Conversation, "How Taiwan came to dominate the global chip industry", 2025 | **Fact:** Taiwan nel suo complesso (non solo TSMC) rappresenta il 92% della capacità produttiva mondiale di logic chip più avanzati.

**Source:** Semiwiki, "No! TSMC does not Make 90% of Advanced Silicon" | **Fact:** La cifra "TSMC produce oltre il 90% dei chip avanzati mondiali", ricorrente in fonti secondarie (Vision of Humanity e derivati), è contestata come oversemplificazione metodologica da analisti di settore. Da citare con cautela esplicita sul metodo, non come cifra-shock isolata (vincolo da STYLE_BIBLE/struttura).

**Source:** TechSoda, "Explainer: TSMC's 2024 Annual Report Highlights" (dati da TSMC Annual Report 2024) | **Fact:** Le Advanced Technologies (nodi ≤7nm) generano il 60% del fatturato totale TSMC nel 2025 — cifra di fatturato, non di quota di wafer prodotti, da non confondere con le percentuali di capacità.

**Source:** Wikipedia, "Hsinchu Science Park" (cross-referenziato con Grokipedia e CT Semiconductor) | **Fact:** Hsinchu Science Park fondato il 15 dicembre 1980 dal governo taiwanese; Irving Tze Ho nominato nel 1979 pianificatore e primo direttore.

**Source:** Wikipedia / Fortune, "How Hsinchu Science Park became the center of the global chip industry", 11 feb 2024 | **Fact:** Il campus originario di Hsinchu copriva 686 ettari (~6,5 km²) alla fondazione. Il complesso completo oggi si estende su sei campus (Hsinchu, Zhunan, Tongluo, Longtan, Yilan, Hsinchu Biomedical Science Park) per un'area di sviluppo totale di 1.471 ettari. Più di 530 aziende insediate, oltre 152.000 dipendenti.

**Source:** Patrick Moorhead (analista, Moor Insights & Strategy), post X, 2025 — fonte secondaria/social, non filing primario TSMC | **Fact:** A Hsinchu sono concentrate le fab TSMC 12A/12B/20/3/5/8/2, più l'Advanced Backend Fab 1, oltre alla sede globale TSMC e al Global R&D Center.

**Source:** Cleanroom Connect / BlackRidge Research, "Complete List of TSMC Semiconductor Fabs" | **Fact:** La Fab 12 (Fasi 4 e 5, nodi 22nm e più avanzati) occupa un sito di 7,83 ettari con un'area cleanroom di 22.700 m² — descritta come equivalente a 3 campi da calcio. Fab 12A è entrata in produzione a inizio 2002. Nota: la Fab 15 (28-40nm) si trova a Taichung, non a Hsinchu — da non confondere nella prosa.

**Source:** Britannica, "Morris Chang"; Wikipedia, "TSMC"; IEEE Spectrum, "Morris Chang: Foundry Father" | **Fact:** TSMC fondata nel 1987 a Hsinchu come joint venture tra il governo taiwanese e Philips (Philips ottenne il 27,6% delle quote in cambio del trasferimento tecnologico/licenza IP); il National Development Fund di Taiwan deteneva il 48,3%. Morris Chang (nato il 10 luglio 1931 a Ningbo, Cina) fondò l'azienda con l'innovazione esplicita del modello "pure-play foundry" — produrre chip per altre aziende senza mai progettare/vendere prodotti propri a marchio.

**Source:** Henry Law, "IP & Business Needs of 3 Types of Semiconductor Companies" | **Fact:** Gli IDM (Integrated Device Manufacturer — Intel, Samsung, Texas Instruments) progettano E producono i propri chip. Le foundry pure-play (TSMC, GlobalFoundries, UMC) producono solo per clienti esterni e non competono mai con essi sul piano del design.

**Source:** Techsoda, intervista all'ex General Counsel di TSMC | **Fact:** Citazione attribuita (caratterizzazione analitica, non virgolettato diretto confermato): "TSMC's neutrality is its competitive moat—it won't compromise it."

**Source:** Medium/The Research Nest, "Intel Vs Samsung: The Foundry Scenario" | **Fact:** Samsung ha operato come puro IDM fino al 2017, quando ha costituito una divisione foundry separata esplicitamente per mitigare il "conflitto di interessi" con i clienti fabless che competono con le sue stesse linee di prodotto (es. chip mobile).

**Source:** Medium/Research Nest (aggregato, da riscontrare su stampa di settore) | **Fact:** Intel ha lanciato la strategia "IDM 2.0" per esternalizzare parte della produzione e aprire le proprie fab a clienti fabless terzi; i risultati sono stati riportati come "più lenti del previsto".

**Source:** Guru3D, "TSMC N2 Hits 65% Yield, Intel and Samsung Lag", 2025 | **Fact:** A metà 2025 il rendimento (yield) di TSMC sul nodo N2 (2nm) è circa 65%, con obiettivo dichiarato del 75% entro il 2026.

**Source:** Guru3D (stessa fonte aggregata) / TechPowerUp, "Intel's 18A Node Outperforms TSMC N2 and Samsung SF2..." | **Fact:** Intel 18A: yield al 55% (in crescita dal 50% nel trimestre precedente), obiettivo 65-70% entro il Q4 2025. Samsung SF2 (2nm): yield ~40%, con piano di doppia esposizione EUV nel Q4 2025 per arrivare al 50%.

**Source:** TrendForce, "Samsung's 3nm Yield Reportedly Stuck at 50%, Far Behind TSMC's 90%", 29 mag 2025 | **Fact:** TSMC riporta un yield superiore al 90% sul nodo N3 (3nm, nodo maturo); il yield di Samsung sul 3nm risulterebbe fermo al 50%. Nota: nessuna delle tre aziende (TSMC, Samsung, Intel) pubblica ufficialmente cifre di yield — sono tutte stime di settore (trade press/analisti), non dati confermati dalle aziende.

**Source:** TechSoda, "Explainer: TSMC's 2024 Annual Report Highlights" (da TSMC Annual Report 2024) | **Fact:** Nel 2024 il cliente più grande di TSMC ha generato NT$624,3 miliardi, pari al 22% del fatturato totale — "ampiamente ritenuto essere Apple" (attribuzione non ufficialmente nominata da TSMC).

**Source:** NotebookCheck / PC Guide, citando dichiarazioni del CEO Nvidia Jensen Huang e dati finanziari TSMC, 2025 | **Fact:** Nel 2025 Nvidia ha superato Apple come primo cliente TSMC per fatturato: Nvidia al 19% (NT$726,97 miliardi / US$23,4 miliardi, più del doppio dell'anno precedente) contro Apple al 17% (NT$645,17 miliardi, crescita <5% anno su anno). [CONFLICT — vedi sezione dedicata]

**Source:** SEC EDGAR, TSMC Q4 2024 Form 6-K | **Fact:** Fonte primaria disponibile per verifica diretta della concentrazione clienti — non ancora estratta in dettaglio in questo loop di ricerca; raccomandata lettura diretta prima della stesura finale se si vuole citare una cifra clienti come fonte primaria invece che secondaria.

**Source:** Craig Addison, *Silicon Shield: Taiwan's Protection Against Chinese Attack* (libro, 2000); VOA News, "Can Taiwan's Silicon Shield Protect It against China's Aggression?"; Wikipedia, "Silicon shield" | **Fact:** Il termine "Silicon Shield" è stato coniato dal giornalista australiano Craig Addison nel suo libro del 2000, che argomentava che la centralità di Taiwan nell'economia digitale globale (catena dei chip) avrebbe scoraggiato un'aggressione cinese.

**Source:** Tsai Ing-wen, "Taiwan and the Fight for Democracy", Foreign Affairs, numero nov/dic 2021; Office of the President, Taiwan, comunicato ufficiale | **Fact:** L'allora Presidente taiwanese Tsai Ing-wen ha ripreso e diffuso pubblicamente il concetto in un articolo su Foreign Affairs (nov/dic 2021), inquadrando l'industria dei semiconduttori taiwanese come uno "scudo di silicio" a protezione di Taiwan e di altri paesi da interruzioni autoritarie delle catene di fornitura globali.

**Source:** CSIS, "Taiwan's Semiconductor Dominance: Implications for Cross-Strait Relations" | **Fact:** Il CSIS descrive lo scudo come composto da due elementi: deterrenza (la Cina danneggerebbe se stessa attaccando Taiwan) e indispensabilità (altri paesi, USA in primis, hanno un interesse diretto a proteggere l'accesso ai chip taiwanesi).

**Source:** CFR (Council on Foreign Relations), "Will China's Reliance on Taiwanese Chips Prevent a War?" | **Fact:** Analisi CFR: l'integrazione delle catene tecnologiche cinesi con l'industria dei chip taiwanese crea un disincentivo economico per Pechino ad attaccare.

**Source:** RAND, commento/analisi (titolo preciso non isolato in questo loop — raccomandata verifica diretta su rand.org prima della pubblicazione) | **Fact:** Argomento citato contro la tenuta dello scudo: l'asimmetria di "resolve" (determinazione strategica) tra USA e Cina renderebbe lo scudo di silicio un deterrente debole; Pechino potrebbe accettare costi economici enormi se l'obiettivo della "riunificazione nazionale" fosse altrimenti a rischio. Argomento collegato: la Cina non potrebbe assorbire/far funzionare l'industria dei chip taiwanese dopo una conquista, per l'impossibilità di sostituire input upstream controllati da USA e alleati — rendendo la conquista un "premio vuoto".

**Source:** Defense Priorities, "Semiconductors are not a reason to defend Taiwan" | **Fact:** Think tank USA di orientamento realista/non-interventista pubblica un'analisi che contesta la logica della deterrenza-da-scudo-di-silicio dal punto di vista dell'interesse strategico statunitense.

**Source:** MIT Technology Review, "Taiwan's 'silicon shield' could be weakening", 15 ago 2025 | **Fact:** L'articolo discute l'erosione dello scudo man mano che TSMC diversifica la produzione all'estero (Arizona, Giappone), riducendo la leva economica esclusiva della Cina legata alla produzione concentrata a Taiwan.

**Source:** Asia Times, "The limits of Taiwan's 'silicon shield'", ott 2025 | **Fact:** Analisi scettica pubblicata sui limiti reali dello scudo di silicio.

**Source:** Stimson Center, "Why Taiwan Fears 'America First' Risks Eroding Its 'Silicon Shield'", 2025 | **Fact:** Argomenta che la pressione USA al reshoring (CHIPS Act, fab in Arizona) mina essa stessa la logica dello scudo riducendo l'indispensabilità di Taiwan.

**Source:** ISDP (Institute for Security and Development Policy), "The Silicon Shield Erosion: Fortifying Taiwan Against Geopolitical Shocks" | **Fact:** Ulteriore analisi sull'erosione dello scudo di silicio e sulle contromisure di rafforzamento di Taiwan.

**Source:** CNN, "TSMC delays its $40 billion chip project in Arizona", 19 gen 2024 | **Fact:** Investimento Arizona raddoppiato a 40 miliardi di dollari (annuncio dic 2022). A gennaio 2024 i piani per la seconda fab risultavano fermi in attesa di revisione dei termini degli incentivi del governo USA; la prima fab restava sui binari per la produzione a 4nm a partire dal H1 2025.

**Source:** Aggregato da reportistica CHIPS Act (vedi sotto) | **Fact:** Visione complessiva del "gigafab cluster" in Arizona: investimento totale fino a 165 miliardi di dollari, sei fab di wafer, due impianti di packaging avanzato, un centro R&D.

**Source:** WSWS, "Trump announces TSMC to invest $100 billion in US manufacturing", 9 mar 2025 | **Fact:** Marzo 2025: Trump annuncia un impegno TSMC per 100 miliardi di dollari di investimento manifatturiero USA. [Da riconciliare con la cifra di 165 miliardi — possibile annuncio sovrapposto o sequenziale, non chiarito nelle fonti secondarie disponibili.]

**Source:** Fortune, "TSMC delays Arizona fab to 2025, blames labor shortage", 21 lug 2023 | **Fact:** Causa dichiarata del ritardo (produzione spostata dal 2024 al 2025): carenza di tecnici qualificati con competenze specialistiche di installazione di macchinari per semiconduttori. TSMC ha fatto volare temporaneamente tecnici esperti da Taiwan per formare il personale locale. Dichiarazione attribuita all'allora presidente Mark Liu.

**Source:** Manufacturing Dive, "TSMC delays second Arizona chip plant to 2027 or 2028" | **Fact:** La seconda fab in Arizona è stata ulteriormente posticipata al 2027-2028.

**Source:** Data Center Dynamics, "TSMC announces further delays at its $40bn Arizona fabs" | **Fact:** Fattori aggiuntivi citati per i ritardi: picchi legati al COVID-19, problemi di licenze.

**Source:** SiliconANGLE, 4 lug 2025 | **Fact:** A metà 2025 TSMC avrebbe accelerato l'investimento nel complesso Arizona, mentre nello stesso periodo Samsung ritardava la sua fab concorrente in Texas.

**Source:** Wikipedia, "Japan Advanced Semiconductor Manufacturing" | **Fact:** La fab giapponese opera tramite la joint venture JASM (Japan Advanced Semiconductor Manufacturing), a maggioranza TSMC, con quote minoritarie di Sony Semiconductor Solutions, Denso e Toyota.

**Source:** Envisioning, "JASM (TSMC Kumamoto Fabs)"; TSMC, comunicato ufficiale (pr.tsmc.com) | **Fact:** Fab 1 (Fase 1) entrata in produzione nel dicembre 2024; capacità mensile 55.000 wafer (12 pollici); nodi di processo 12/16nm e 22/28nm FinFET — generazioni di processo ben più arretrate rispetto ai nodi avanzati di Hsinchu.

**Source:** TSMC, comunicato ufficiale, "JASM Set to Expand in Kumamoto Japan" (pr.tsmc.com) | **Fact:** Fab 2 (Fase 2): piano rivisto ora punta al nodo 3nm (originariamente previsto 6-12nm); capacità mensile pianificata 15.000 wafer (12 pollici); installazione macchinari/produzione di massa puntata al 2028.

**Source:** Aggregato (Semiwiki, AI CERTs) | **Fact:** Capacità combinata target: oltre 100.000 wafer (12 pollici)/mese tra le due fab giapponesi una volta completate, su nodi 40nm, 22/28nm, 12/16nm e 6/7nm — al servizio di settori automotive, industriale, consumer e HPC.

**Source:** Aggregato da ricerca (raccomandata verifica diretta METI) | **Fact:** Sussidio del governo giapponese: fino a 4,62 miliardi di dollari approvati nel 2024 per la seconda struttura JASM.

**Source:** AIP.org, "Huge CHIPS Grants Awarded to TSMC, Samsung, and Micron" | **Fact:** TSMC ha ricevuto fino a 6,6 miliardi di dollari di finanziamento diretto dal CHIPS Incentives Program USA, annunciato il 15 novembre 2024, a supporto della costruzione di tre fab a Phoenix, Arizona — due per la produzione a 4nm/3nm, una per il 2nm.

**Source:** Data Center Dynamics, "Samsung, Texas Instruments, and Amkor finalize CHIPS Act funding agreements" | **Fact:** Samsung ha ricevuto fino a 4,745 miliardi di dollari (annunciato il 20 dicembre 2024) — un taglio del 26% rispetto all'annuncio preliminare di aprile 2024 (fino a 6,4 miliardi). I fondi supportano due nuove fab logiche e una fab R&D a Taylor, Texas, più l'espansione della struttura esistente ad Austin.

**Source:** Mark Lapedus/Semiecosystem, "Who Has Officially Obtained CHIPS Funding?" | **Fact:** Intel ha ottenuto 7,86 miliardi di dollari di finanziamento diretto (fine novembre 2024), in calo dagli 8,5 miliardi precedentemente annunciati.

**Source:** TrendForce, 20 ago 2025 | **Fact:** Nel 2025 si è discusso che il governo USA stesse considerando di acquisire quote azionarie nei beneficiari del CHIPS Act (seguendo il precedente Intel), aumentando l'incertezza sui termini di finanziamento per TSMC e Samsung.

**Source:** CNBC, "Trump says Taiwan should pay the U.S. for defense; shares of chip giant TSMC fall", 17 lug 2024 | **Fact:** Dichiarazione diretta e datata di Donald Trump (allora candidato), in un'intervista a Bloomberg Businessweek: "You know, we're no different than an insurance company. Taiwan doesn't give us anything." Ha inoltre dichiarato che Taiwan dovrebbe pagare gli USA per la propria difesa. Le azioni TSMC quotate a Taiwan sono scese del 2,4% dopo la dichiarazione.

**Source:** RAND, "From Strategic Ambiguity to Strategic Anxiety: Taiwan's Trump Challenge", mar 2025 | **Fact:** Analisi RAND su come la retorica di Trump modifichi il calcolo della deterrenza per Taiwan.

**Source:** Brookings, "A strategy for staying out: Recalibrating US support to Taiwan" | **Fact:** Riferimento a una valutazione secondo cui le capacità militari USA da sole non basterebbero a garantire la deterrenza lungo la prima catena di isole senza il supporto degli alleati (citazione da verificare contro il documento NSS USA originale prima di un uso diretto).

**Source:** Bloomberg Economics, "If China Invades Taiwan, It Would Cost World Economy $10 Trillion", 9 gen 2024; "The $10 Trillion Fight: Modeling a US-China War Over Taiwan" | **Fact:** Modello a 5 scenari attraverso lo Stretto di Taiwan. Scenario di blocco navale: PIL Taiwan -12,5% nel primo anno; PIL Cina -8,9%; PIL USA -3,2%; PIL mondiale -5,3%. Scenario di guerra totale: perdita stimata di 10.000 miliardi di dollari di PIL globale (~10% del PIL mondiale) — descritto da Bloomberg come superiore alla somma degli shock della crisi finanziaria 2008, della pandemia COVID-19 e della guerra in Ucraina. Metodologia: il modello assume che un blocco navale interrompa sia l'export di semiconduttori da Taiwan sia gli input in entrata; le scorte di chip si esauriscono "nell'arco di settimane"; il 5,6% del valore aggiunto globale (quasi 6.000 miliardi di dollari) deriva da settori che usano chip come input diretto.

**Source:** Bloomberg New Economy newsletter, "China 'Blockade Simulation' Raises $5 Trillion Risk", 25 mag 2024 | **Fact:** Stima specifica per lo scenario di blocco navale (distinto dallo scenario di guerra totale): 5.000 miliardi di dollari di rischio economico globale nel primo anno.

**Source:** Rhodium Group, "The Global Economic Disruptions from a Taiwan Conflict", dic 2022 | **Fact:** Stima "ben oltre i 2.000 miliardi di dollari" di attività economica a rischio di interruzione da un conflitto su Taiwan — esplicitamente escludendo sanzioni internazionali, costi di risposta militare o effetti di secondo ordine (stima conservativa dichiarata). Circa 565 miliardi di dollari di commercio di valore aggiunto taiwanese identificati come "ad alto rischio" in uno scenario di blocco. Metodologia: focus esplicito su effetti diretti e di breve periodo su commercio e catena di fornitura.

**Source:** HCSS (Hague Centre for Strategic Studies), Joris Teer, Davis Ellison, Abe de Ruijter, "The Cost of Conflict", mar 2024 (PDF) | **Fact:** Report dedicato alla modellazione dei costi di un conflitto su Taiwan — contenuto non estratto in dettaglio in questo loop; raccomandata lettura diretta del PDF prima di citare cifre specifiche.

**Source:** CNBC, "U.S. Commerce head Lutnick wants Taiwan to help America make 50% of its chips locally", 30 set 2025 (intervista a NewsNation) | **Fact:** Il Segretario al Commercio USA Howard Lutnick ha dichiarato pubblicamente di aver proposto a Taiwan una ripartizione "50-50" della produzione di chip avanzati tra Stati Uniti e Taiwan: "The idea that I pitched [Taiwan] was, let's get to 50-50. We're producing half, and you're producing half." Citato anche da Taipei Times e SemiWiki nello stesso ciclo di notizie (30 set–9 ott 2025).

**Source:** CNBC, "Taiwan rejects U.S. proposal for '50-50' chip production, says trade talks focused on tariffs", 2 ott 2025; CNN Business, "Taiwan says it will resist pressure from Washington to move half of chip production to US", 1 ott 2025; Data Center Dynamics, "Taiwan's vice premier denies 50-50 semiconductor production split with US" | **Fact:** La Vice Premier taiwanese Cheng Li-chiun ha respinto pubblicamente la proposta: "Our negotiating team has never made any commitment to a 50-50 split on chips … nor would we agree to such conditions." Taiwan ha dichiarato che i colloqui commerciali con Washington riguardavano le tariffe doganali, non una ripartizione produttiva.

**Source:** Taipei Times, "'Silicon shield' might shift to shared resilience with the US", 30 set 2025 | **Fact:** Analisi che inquadra la proposta Lutnick come un possibile spostamento del concetto di "scudo di silicio" verso una logica di "resilienza condivisa" USA-Taiwan, anziché di deterrenza esclusivamente taiwanese.

**Source:** Wikipedia, "Taiwanese Representative Office in Lithuania"; Foreign Policy Research Institute, "Is Taiwan Fever Breaking in Lithuania?", feb 2025; Global Taiwan Institute, "Patience and Perseverance: Lessons from Lithuania's Engagement with Taiwan", mar 2025 | **Fact:** A maggio 2024 il Presidente lituano Gitanas Nausėda ha dichiarato che, nel contesto di una normalizzazione delle relazioni con la Cina, sarebbe stato necessario cambiare il nome dell'ufficio di rappresentanza taiwanese a Vilnius (apertura nel 2021 sotto il nome "Taiwanese Representative Office"). Il Ministro degli Esteri taiwanese Joseph Wu ha risposto che il nome era stato concordato nel 2021 da entrambi i governi e che Taiwan non aveva ricevuto alcuna richiesta ufficiale di cambio nome, né l'avrebbe accettata.

**Source:** Aggregato (notizie di stampa lituana/baltica, data esplicitamente nel 2026 — da verificare contro fonte primaria al momento della stesura, poiché ricade oltre il cutoff di conoscenza diretta) | **Fact:** Il 3 febbraio 2026 la Prima Ministra lituana Inga Ruginienė ha dichiarato che permettere a Taiwan di aprire un ufficio di rappresentanza sotto il nome "Taiwanese" è stato un "errore strategico" — segnale di un possibile arretramento lituano sotto pressione cinese, esattamente il filo che il cap. 3 dovrà sviluppare. **[NOTA: data 2026 supera il cutoff di addestramento del modello — verificare con fonte primaria/agenzia di stampa diretta prima della stesura finale, non usare come fatto acclarato senza doppio controllo.]**

---

## [SHADOW]

**Source:** Cleanroom Connect / BlackRidge Research | **Detail:** L'area cleanroom della Fab 12 di TSMC a Hsinchu (Fasi 4-5) misura 22.700 m², descritta come equivalente a tre campi da calcio — il sito complessivo occupa 7,83 ettari.

**Source:** Wikipedia / Fortune (Hsinchu Science Park) | **Detail:** Il campus originario di Hsinchu Science Park: 686 ettari, circa 6,5 km² — area su cui si concentra una quota maggioritaria della capacità produttiva avanzata mondiale.

**Source:** Fortune, "How Hsinchu Science Park became the center of the global chip industry", 11 feb 2024 | **Detail:** Più di 530 aziende tenant e oltre 152.000 dipendenti operano nel complesso di sei campus di Hsinchu Science Park (1.471 ettari totali).

**Source:** TechSoda, TSMC Annual Report 2024 | **Detail:** Cifra esatta in valuta locale: NT$624,3 miliardi generati dal cliente più grande di TSMC nel 2024 (22% del fatturato totale).

**Source:** NotebookCheck / PC Guide, 2025 | **Detail:** Nvidia: NT$726,97 miliardi (US$23,4 miliardi) — più del doppio dell'anno precedente. Apple: NT$645,17 miliardi, crescita inferiore al 5% anno su anno.

**Source:** CNBC, 17 lug 2024 | **Detail:** Citazione diretta e datata di Donald Trump: "You know, we're no different than an insurance company. Taiwan doesn't give us anything." Reazione di mercato immediata e quantificata: azioni TSMC a Taiwan -2,4% nelle ore successive alla dichiarazione.

**Source:** Bloomberg Economics, 9 gen 2024 | **Detail:** Cifra di esaurimento delle scorte globali di chip in caso di blocco navale: "nell'arco di settimane" — dettaglio temporale specifico usato per rendere tangibile la velocità della crisi a valle.

**Source:** Fortune, 21 lug 2023 | **Detail:** TSMC ha fatto volare temporaneamente tecnici specializzati da Taiwan all'Arizona per formare la forza lavoro locale — dettaglio concreto della carenza di competenze citata come causa del ritardo.

**Source:** Guru3D / TrendForce, 2025 | **Detail:** Cifre di yield esatte e comparate fianco a fianco: TSMC N2 65% (target 75% nel 2026); Intel 18A 55% (target 65-70% Q4 2025); Samsung SF2 ~40% (target 50% con doppia esposizione EUV nel Q4 2025); TSMC N3 oltre il 90%, Samsung 3nm fermo al 50%.

**Source:** TSMC, comunicato ufficiale Kumamoto | **Detail:** Capacità mensile esatta della Fab 1 di Kumamoto: 55.000 wafer da 12 pollici; Fab 2 pianificata per 15.000 wafer/mese aggiuntivi.

**Source:** CNBC, 30 set 2025 | **Detail:** Citazione diretta e datata di Howard Lutnick: "The idea that I pitched [Taiwan] was, let's get to 50-50. We're producing half, and you're producing half." — controcitazione diretta della Vice Premier Cheng Li-chiun: "Our negotiating team has never made any commitment to a 50-50 split on chips … nor would we agree to such conditions."

---

## [CONFLICT]

| Claim | Fonte A | Fonte B | Risoluzione |
|---|---|---|---|
| Quota di mercato TSMC nelle pure-play foundry | IDC/Focus Taiwan: 64% (2024), previsto 66% nel 2025 | TrendForce/Focus Taiwan: 70,2% record nel Q2 2025; Counterpoint/igor'sLAB: 71% (2025, data non specificata) | Non necessariamente contraddittorio — le cifre si riferiscono a periodi diversi (media annuale 2024 vs. singolo trimestre 2025) e possibilmente a metodologie diverse. Nella prosa, datare sempre la cifra con precisione (es. "nel secondo trimestre del 2025") invece di usare una percentuale generica senza periodo di riferimento. |
| Percentuale di chip avanzati prodotti a Taiwan/da TSMC | Ricorrente in fonti secondarie: "TSMC produce oltre il 90%" dei chip avanzati mondiali | Semiwiki: critica diretta, "No! TSMC does not Make 90% of Advanced Silicon" — la cifra è oversemplificata/mal attribuita | Disputa metodologica documentata. Usare con cautela esplicita: la cifra più solida e meno contestata è "Taiwan rappresenta il 92% della capacità produttiva mondiale di logic chip avanzati" (The Conversation), distinguendo capacità produttiva (Taiwan come paese) da quota TSMC specifica (azienda) — e segnalare nella prosa che il dato "90%" circolante è impreciso, non riprodurlo come fatto acclarato. |
| Maggior cliente TSMC per fatturato | Proiezioni analisti pre-2025 (Wccftech/SmBom): Apple ~25%, Nvidia ~11% | Dati reali 2025 riportati (NotebookCheck/PC Guide, basati su dichiarazioni Jensen Huang e bilanci TSMC): Nvidia 19% (sorpassa Apple), Apple 17% | Usare le cifre reali post-fatto (NotebookCheck/PC Guide) come autoritative, non le proiezioni pre-2025. Se si cita la proiezione precedente, va esplicitamente datata e marcata come previsione superata dai fatti. |
| Investimento totale TSMC in Arizona | "Gigafab cluster": fino a 165 miliardi di dollari (sei fab, due impianti packaging, R&D) | WSWS: Trump annuncia (mar 2025) impegno TSMC per 100 miliardi di dollari di investimento USA | Le due cifre non sono necessariamente in conflitto (potrebbero riferirsi a impegni sequenziali o sovrapposti annunciati in momenti diversi) ma nessuna fonte secondaria disponibile le riconcilia esplicitamente. **[BLOCKED: needs human input — verificare se i 100 miliardi di Trump (mar 2025) sono un sottoinsieme, un'estensione o un doppio conteggio dei 165 miliardi del "gigafab cluster"; serve comunicato ufficiale TSMC o fonte finanziaria primaria per chiarire.]** |
| Investimento totale JASM Kumamoto | "$23 miliardi" (costo prima struttura, joint venture totale) | "Oltre $20 miliardi" (investimento complessivo su entrambe le fab, fonte più recente) | Le due cifre coprono probabilmente scope diversi (singola fab vs. complesso a due fab) ma non sono riconciliate nelle fonti secondarie disponibili. Raccomandata verifica diretta su comunicati ufficiali TSMC/JASM prima di citare una cifra specifica nella prosa. |

---

## Note per l'Architect/Editor

1. **[BLOCKED]** Skill `notebooklm` non installata — l'intero capitolo si basa su web search, non su corpus NotebookLM nonostante coverage dichiarata MEDIA in PRD.md. Va segnalato come deviazione di processo, non come gap di contenuto (la ricerca web ha comunque prodotto una dossier triangolata e sufficientemente densa).
2. **[BLOCKED]** Riconciliazione tra i 100 miliardi di dollari annunciati da Trump (marzo 2025) e i 165 miliardi del "gigafab cluster" Arizona — serve fonte primaria TSMC.
3. **[UNVERIFIED]** Titolo esatto del paper RAND che argomenta contro la tenuta del Silicon Shield (citato solo per caratterizzazione aggregata, non per URL diretto) — raccomandata ricerca diretta su rand.org prima di attribuire la citazione a un autore/paper specifico nella prosa.
4. **[UNVERIFIED]** Citazione "TSMC's neutrality is its competitive moat—it won't compromise it" — attribuita all'ex General Counsel TSMC via Techsoda, ma non confermata come virgolettato letterale verificabile su fonte primaria (intervista registrata, trascrizione ufficiale). Usare con cautela o paraphrasare invece di citare come discorso diretto.
5. **[UNVERIFIED]** Dichiarazione attribuita alla Premier lituana Inga Ruginienė (3 feb 2026, "errore strategico" sull'ufficio di rappresentanza taiwanese) — data successiva al cutoff di addestramento del modello; va riverificata su fonte primaria/agenzia di stampa al momento della stesura, non usata acriticamente come fatto consolidato.
6. Aggiunte a `oracle_questions.md`: vedi sotto.
