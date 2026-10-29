# Capitolo 4 — Struttura: "Il Veto di Washington"

**Core question:** Come gli Stati Uniti usano sanzioni extraterritoriali per bloccare l'avanzata tecnologica cinese, fino a dettare le licenze di esportazione di un'azienda olandese?

**Audience tag (capitolo):** [GENERAL/EXPERT]

**Continuity check:** `chapter_index.md` e `NARRATIVE_GLOSSARY.md` non esistono ancora come file materiali nella directory (debito di pipeline già segnalato da `review_chapter_3.md` §6 — non risolvibile da questo step, solo documentabile). Nessun conflitto rilevabile da quelle fonti, quindi il controllo di continuità è stato fatto leggendo direttamente `chapter_1.md`, `chapter_2.md` e `chapter_3.md`. Tre vincoli derivano da testo già scritto e NON vanno sovrascritti silenziosamente:
1. `chapter_1.md` (righe ~103-107) ha già stabilito, come fatto acclarato: da settembre 2024 il governo olandese ha assunto il controllo pieno dell'export control sulle tecnologie ASML più avanzate; a inizio 2024 ha parzialmente revocato le licenze per due sistemi DUV (NXT:2050i, NXT:2100i) destinati alla Cina, dopo l'inasprimento delle restrizioni USA dell'ottobre 2023; ASML non possiede azioni proprie — struttura a Fondazione — e la leva statale reale passa dalla licenza di esportazione, non dalla proprietà azionaria. **Questo capitolo non deve ri-narrare questi fatti come se fossero nuovi**: deve raccoglierli come antecedente e spiegare il meccanismo che li ha resi possibili — cioè COME Washington arriva a condizionare una firma olandese, non ripetere COSA è stato firmato.
2. `chapter_2.md` (riga ~81) ha stabilito il tema dei tagli ai fondi CHIPS Act (Samsung, Intel) come prova che "sussidio" è negoziabile, non garantito. È un filo tematico adiacente (strumenti di politica industriale USA verso la propria filiera) ma NON è l'oggetto di questo capitolo, che riguarda lo strumento opposto — il controllo delle esportazioni verso la Cina, non il sussidio interno. Va citato al massimo come contrasto in una frase, non sviluppato.
3. `chapter_3.md` ha stabilito come termini canonici "de-risking" (ridurre la dipendenza critica senza tagliare i rapporti) vs. "decoupling" (tagliarli del tutto), e il pattern della "ritorsione economica grigia" cinese (sanzione mai dichiarata ufficialmente, applicata attraverso un meccanismo tecnico-burocratico). **Questo capitolo deve riusare questi termini, non ridefinirli** — e deve notare esplicitamente, nel Beat 5, che gli Stati Uniti dispongono di un proprio strumento di "ritorsione grigia" concettualmente simile (l'azione amministrativa che non si presenta come sanzione politica ma come atto tecnico-regolatorio) applicato in direzione opposta.

**Glossary note:** Questo capitolo introdurrà almeno questi termini da glossare in `NARRATIVE_GLOSSARY.md` (quando il file verrà materialmente creato): "Foreign Direct Product Rule (FDPR)" — la norma che estende la giurisdizione USA a qualunque prodotto, ovunque fabbricato, se realizzato con tecnologia, software o strumenti di progettazione di origine statunitense; "Entity List" — l'elenco del Bureau of Industry and Security che vieta a specifiche aziende estere l'accesso a tecnologia USA senza licenza; "Wassenaar Arrangement" — il regime multilaterale di controllo delle esportazioni a consenso unanime tra 42 stati, di cui la Cina non è membro; "extraterritorialità delle sanzioni USA" — il principio per cui la giurisdizione statunitense segue la tecnologia, non il territorio o la nazionalità dell'azienda. Da riconciliare esplicitamente con "de-risking/decoupling" (cap. 3) — non ridefinirlo, mostrare che l'FDPR è lo strumento tecnico che rende operativo il "decoupling" americano, mentre l'UE parla ancora di "de-risking".

**Corpus coverage:** STRONG (da PRD.md) per il nucleo storico-legale del capitolo (Wassenaar, FDPR, trilaterale NL-Giappone-USA gennaio 2023, Entity List, impatto su ASML). Il Ricercatore deve però aspettarsi un gap del corpus su un evento che è probabilmente troppo recente per le ~75 fonti raccolte: la crisi Nexperia (settembre-novembre 2025) va verificata prioritariamente via web search e triangolata su almeno due fonti indipendenti, non assunta come coperta da NotebookLM solo perché il capitolo nel complesso è STRONG. Stessa cautela per eventuali sviluppi 2025-2026 sull'applicazione dell'FDPR e per cifre aggiornate su quota export ASML verso la Cina.

**ADR flag (segnalazione, non azione eseguita in questo file):** Questo capitolo introduce una scelta di framing potenzialmente da formalizzare come Narrative ADR: trattare il rapporto USA-Paesi Bassi non come cooperazione alleata paritaria ma come **relazione asimmetrica in cui la sovranità olandese sull'export control è reale sulla carta e vincolata nella sostanza** — la stessa logica di "assenza di leva" già usata in `docs/adr/0001-asse-fragile-non-stabile.md` per la Lituania (cap. 3), qui applicata non a un piccolo stato baltico ma a un alleato G7 ricco e tecnologicamente centrale. Le tre condizioni del gate sembrano soddisfatte: (1) hard-to-reverse — vincola il framing dei capp. 5 (risposta cinese all'embargo) e 7 (sovranità tecnologica europea, Chips Act); (2) sorprendente — un lettore che segue la retorica di "alleanza occidentale unita sui chip" non si aspetta che il copione sia lo stesso già visto con la Lituania, solo su scala diversa; (3) vero trade-off — narrare i Paesi Bassi come partner cooperativo è più comodo diplomaticamente ma meno fedele ai fatti (licenze revocate su pressione esterna, sequestro Nexperia). **Azione per il prossimo step:** valutare la creazione di `docs/adr/0002-sovranita-vincolata-non-alleanza-paritaria.md` durante o dopo la stesura di questo capitolo.

---

## NUFs (Narrative Utility Functions)

```
utility(reader): Il lettore può ricostruire la sequenza causale completa che porta dal regime multilaterale Wassenaar (1996, consenso unanime, la Cina non è membro) alla decisione unilaterale olandese di settembre 2024 di assumere il controllo pieno dell'export control su ASML — passando per l'accordo trilaterale Paesi Bassi-Giappone-USA di gennaio 2023, l'inasprimento delle regole USA sulla Foreign Direct Product Rule dell'ottobre 2022 e ottobre 2023, e la revoca parziale delle licenze NXT:2050i/2100i a inizio 2024 (fatto già stabilito nel cap. 1) — nominando almeno quattro tappe con data precisa → score += 1

utility(reader-2): Il lettore può spiegare, con il meccanismo tecnico esatto, perché la Foreign Direct Product Rule dà a Washington un potere di veto su una macchina costruita a Veldhoven anche se il governo olandese non deve rispondere formalmente a nessuna legge USA — cioè può nominare almeno un componente di origine americana realmente presente dentro un sistema ASML (es. la sorgente di luce prodotta dalla filiale Cymer, San Diego) e spiegare perché quella presenza fisica trasforma un vincolo diplomatico in un vincolo legale azionabile → score += 1

utility(emotional): Il lettore sente il disagio specifico di scoprire che uno dei paesi più ricchi, stabili e tecnologicamente centrali del pianeta — non un piccolo stato periferico come la Lituania del cap. 3 — ha una sovranità sulla propria industria di punta che è reale sulla carta e sottilmente vincolata nella sostanza, capendo che "sovranità tecnologica" europea non è un interruttore che l'UE può accendere per decreto → score += 1

utility(emotional-2): Il lettore sente la vertigine dell'escalation rapida nel caso Nexperia — un'azienda con sede legale nei Paesi Bassi ma proprietà cinese, sequestrata dal proprio stato ospitante nel settembre 2025 e colpita da ritorsione cinese nel giro di settimane, con l'industria automobilistica globale che si scopre esposta a una carenza di chip per un conflitto amministrativo di cui la maggior parte dei consumatori non sospettava l'esistenza → score += 1

utility(factual): Il lettore conosce almeno tre cifre sourced sull'impatto economico reale delle restrizioni USA/UE su ASML (es. quota di fatturato verso la Cina prima e dopo le restrizioni, numero di sistemi con licenza revocata o bloccata, valore in euro dei contratti coinvolti) e almeno un caso di enforcement extraterritoriale contro un'azienda non statunitense (es. la sanzione Seagate 2023) che dimostra che l'FDPR non è solo teoria giuridica ma viene applicata con conseguenze finanziarie misurabili → score += 1

utility(factual-2): Il lettore conosce la sequenza datata e verificata (o esplicitamente segnalata come non verificabile) della crisi Nexperia — inserimento di Wingtech nell'Entity List, intervento del governo olandese via Goods Availability Act, ritorsione cinese sulle esportazioni dallo stabilimento di Dongguan, ed esito/stato a oggi — con almeno una cifra sulla quota di mercato globale Nexperia in componenti automotive discreti → score += 1
```

---

## BEAT LIST

### Beat 1 — "La firma che non è di Amsterdam"
- **Core question:** Come si arriva, storicamente e legalmente, dal Wassenaar Arrangement del 1996 alla decisione olandese di settembre 2024 di assumere il controllo pieno delle licenze ASML — un fatto già raccontato nel cap. 1, qui va spiegato il COME, non ripetuto il COSA?
- **Audience tag:** [GENERAL]
- **Word target:** 900–1100
- **Key facts da cercare (Researcher):**
  - Data e meccanismo esatti con cui, nel 2018-2019, l'amministrazione USA ha esercitato pressione diretta sui Paesi Bassi per bloccare la vendita di un sistema EUV ASML a SMIC (Cina) — canale bilaterale, non voto Wassenaar formale, perché la Cina non è membro del regime e non può essere colpita da una sua delibera
  - Struttura del Wassenaar Arrangement: 42 stati membri, decisioni a consenso unanime, nessun membro cinese — perché questo rende il regime multilaterale troppo lento/permeabile per gli obiettivi USA verso la Cina specificamente
  - Aggancio esplicito e non ripetitivo ai fatti già stabiliti in `chapter_1.md` (governo olandese assume controllo pieno da settembre 2024, revoca parziale licenze NXT:2050i/2100i a inizio 2024, struttura a Fondazione di ASML) — citarli come dato di partenza, non come scoperta nuova

### Beat 2 — "La regola che segue la tecnologia, non la bandiera"
- **Core question:** Come funziona esattamente la Foreign Direct Product Rule, e perché permette a Washington di rivendicare giurisdizione su una macchina fabbricata interamente fuori dagli Stati Uniti?
- **Audience tag:** [EXPERT/GENERAL]
- **Word target:** 1000–1200
- **Key facts da cercare (Researcher):**
  - Testo/sintesi della norma FDPR e delle sue estensioni dell'8 ottobre 2022 (advanced computing e semiconductor manufacturing equipment) e del 17 ottobre 2023 (chiusura delle scappatoie sulla soglia di contenuto USA)
  - Meccanismo esatto: qualunque prodotto, ovunque fabbricato, da qualunque azienda, che utilizzi anche una minima componente di tecnologia, software o strumenti di progettazione (design tools) di origine statunitense ricade sotto la giurisdizione di esportazione USA
  - Caso concreto e verificabile: Cymer, sussidiaria ASML con sede a San Diego (acquisita nel 2013), fornitore delle sorgenti di luce per i sistemi litografici ASML — dettaglio fisico/sensoriale che rende tangibile "quanta America" è dentro una macchina "olandese"
  - Differenza tra Entity List (elenco di aziende specifiche a cui è vietato l'accesso) e controlli su categorie di prodotto (regole FDPR) — i due strumenti si sommano, non si sostituiscono

### Beat 3 — "Il trilaterale di gennaio 2023: comprare alleati più in fretta del consenso"
- **Core question:** Perché gli Stati Uniti hanno scelto un accordo informale a tre (USA, Paesi Bassi, Giappone) invece di portare la battaglia dentro il Wassenaar Arrangement?
- **Audience tag:** [EXPERT/GENERAL]
- **Word target:** 900–1100
- **Key facts da cercare (Researcher):**
  - Data e contenuto dell'accordo trilaterale USA-Paesi Bassi-Giappone di gennaio 2023 sull'allineamento dei controlli su litografia e apparecchiature per semiconduttori
  - Ruolo di Tokyo Electron e Nikon come controparti giapponesi equivalenti ad ASML, e in che misura i controlli giapponesi sono stati effettivamente allineati a quelli USA/olandesi
  - Perché un accordo a tre stati, fuori dal quadro Wassenaar, è più rapido da negoziare e più difficile da bloccare rispetto a una delibera che richiederebbe il consenso di tutti i 42 membri (alcuni dei quali con interessi commerciali in Cina meno alienabili)
  - Reazione o commento ufficiale dei Paesi Bassi e del Giappone sul grado di autonomia reale avuto in quella trattativa (dichiarazioni pubbliche di funzionari, se reperibili)

### Beat 4 — "Il conto per ASML: chi paga il veto"
- **Core question:** Quanto è costato ad ASML, in euro e in quota di mercato, il regime di controllo sulle esportazioni verso la Cina — e l'enforcement extraterritoriale ha già colpito aziende non statunitensi con conseguenze finanziarie reali?
- **Audience tag:** [GENERAL/EXPERT]
- **Word target:** 1000–1200
- **Key facts da cercare (Researcher):**
  - Quota percentuale del fatturato ASML proveniente dalla Cina, anno per anno (2022-2025), incluso l'eventuale picco anomalo dovuto a stoccaggio anticipato di sistemi DUV prima dell'entrata in vigore delle restrizioni, e il calo successivo
  - Numero e tipologia di sistemi con licenza revocata, negata o bloccata, con valore in euro se disponibile
  - Espansione dell'Entity List cinese nel comparto semiconduttori — inclusione di Huawei (2019), SMIC (dicembre 2020), YMTC (2022), e l'ondata di aggiunte di dicembre 2024 (~140 aziende cinesi) — come strumento parallelo e cumulativo rispetto al controllo sulle attrezzature
  - Caso Seagate: sanzione da 300 milioni di dollari nel 2023 per violazione del divieto di export verso Huawei — esempio concreto di enforcement extraterritoriale con conseguenze finanziarie misurabili contro un'azienda che non è ASML, per dimostrare che la FDPR non è solo teoria giuridica

### Beat 5 — "Nexperia: il veto arriva a casa"
- **Core question:** Come una crisi amministrativa attorno a un'azienda con sede legale nei Paesi Bassi ma proprietà cinese si è trasformata, nell'autunno 2025, in una minaccia concreta alla produzione automobilistica mondiale?
- **Audience tag:** [ALL]
- **Word target:** 1100–1300
- **Key facts da cercare (Researcher):**
  - Data esatta e motivazione dell'inserimento di Wingtech Technology (proprietaria cinese di Nexperia) nell'Entity List USA (dicembre 2024)
  - Data esatta e base legale dell'intervento del governo olandese — invocazione della legge del 1952 sulla disponibilità dei beni (Goods Availability Act) il 30 settembre 2025, con congelamento dei poteri decisionali del CEO Zhang Xuezheng
  - Ritorsione cinese: blocco delle esportazioni di chip finiti dallo stabilimento di packaging/testing di Nexperia a Dongguan (Cina) — data di inizio, durata, prodotti coinvolti
  - Impatto quantificato sulla filiera automobilistica globale: quota di mercato Nexperia in chip discreti/logici per il settore automotive, nomi di case automobilistiche che hanno segnalato rischio di stop produttivo, eventuale stima di giorni/settimane di scorte residue
  - Stato della crisi a oggi (dato che il capitolo si scrive nel 2026): risolta, de-escalata, o ancora in corso — verificare con fonte primaria datata, non assumere risoluzione per inerzia narrativa
  - [NOTA RESEARCHER: dichiarazioni ufficiali olandesi hanno negato pressione diretta USA dietro la decisione — riportarla come dichiarazione, non come fatto accertato, esattamente con lo stesso rigore metodologico già usato nel cap. 3 per le dichiarazioni Ruginienė]

### Beat 6 — "I denti della legge: quando l'extraterritorialità si presenta con una multa"
- **Core question:** Al di là del caso ASML/Nexperia, quali altri casi dimostrano che l'enforcement extraterritoriale USA colpisce davvero aziende non americane, e con quale frequenza?
- **Audience tag:** [EXPERT/GENERAL]
- **Word target:** 800–1000
- **Key facts da cercare (Researcher):**
  - Ulteriori casi di enforcement FDPR/Entity List contro aziende non statunitensi (oltre a Seagate), con importi delle sanzioni e anno
  - Meccanismo di enforcement: chi indaga (Bureau of Industry and Security, Department of Commerce), quali poteri ha per sanzionare un'azienda che non ha sede negli USA
  - Eventuale contestazione legale o diplomatica di questi casi da parte dei governi dei paesi coinvolti — per bilanciare la narrazione e non presentare l'extraterritorialità come incontestata

### Beat 7 — "Sovranità, con permesso di Washington"
- **Core question:** Che cosa dice, sommando tutti i casi di questo capitolo, il confronto tra la sovranità legale dei Paesi Bassi sulla propria industria e la sovranità reale — e come si collega questo al destino della Cina, che il libro affronta nel prossimo capitolo?
- **Audience tag:** [ALL]
- **Word target:** 900–1000
- **Key facts da cercare (Researcher):**
  - Sintesi comparativa esplicita con il cap. 3: la Lituania non aveva leva economica e ha subito una ritorsione fulminea per una scelta di principio; i Paesi Bassi hanno leva tecnologica enorme (ASML è insostituibile) ma restano comunque vincolati, perché la loro stessa tecnologia contiene componenti la cui origine è americana — è un vincolo di natura diversa (dipendenza da input, non assenza di potere) che produce lo stesso risultato pratico: la sovranità dichiarata è più ampia della sovranità esercitabile
  - Aggancio di chiusura che apra (senza risolvere) il filo del cap. 5: la Cina, sottoposta a questo regime di veto, ha reagito accelerando l'autosufficienza tecnologica — raggiungendo nodi a 5nm senza EUV — la domanda che il cap. 5 riprenderà è se l'embargo abbia effettivamente frenato la Cina o l'abbia solo costretta a un percorso più costoso ma comunque praticabile
  - NIENTE chiusura che ricalchi la struttura dei finali dei capp. 1-3 (passaggio di testimone esplicito, domanda "lo scudo regge?", "quanto si è disposti a pagare sapendo di non avere leva") — questo capitolo deve chiudere su un registro diverso: non "chi ha vinto" ma "quanto vale davvero un permesso che si può firmare solo se un altro governo non dice di no"

---

## REVIEWER READINESS NOTES

**Tension points (≥2):**
1. **Tensione della sovranità apparente:** i Paesi Bassi sono un paese ricco, un alleato G7, non un piccolo stato periferico come la Lituania del cap. 3 — eppure la loro autorità legale sulle esportazioni ASML, per quanto reale sulla carta (Fondazione proprietaria indipendente, legge nazionale propria dal 2024), è vincolata nella sostanza da un dato fisico ineliminabile: componenti di origine americana dentro le macchine olandesi. Il capitolo deve costruire questa tensione mostrando il meccanismo esatto (FDPR, caso Cymer) senza scivolare nell'affermazione facile "i Paesi Bassi sono un fantoccio USA" — la sovranità è reale E vincolata, non finta.
2. **Tensione Nexperia:** un'azienda di proprietà cinese ma incorporata in territorio olandese viene sequestrata dal proprio stato ospitante, che dichiara di agire per motivi di sicurezza nazionale propri e nega pressione USA diretta — mentre la cronologia (Entity List di Wingtech a dicembre 2024, intervento olandese nove mesi dopo) suggerisce una correlazione che il capitolo deve mostrare senza affermarla come causalità provata. La ritorsione cinese immediata sulle esportazioni dallo stabilimento di Dongguan è la prova che il "meccanismo grigio" descritto nel cap. 3 (sanzione mai dichiarata come tale) funziona anche in direzione Cina→Occidente, non solo Cina→piccoli stati.

**Key chains da rendere esplicite:**
- Catena giuridico-tecnica: Wassenaar (troppo lento/permeabile) → pressione bilaterale USA sui Paesi Bassi (2018-2019) → FDPR ottobre 2022/2023 (giurisdizione extraterritoriale via componenti USA) → trilaterale gennaio 2023 → licenze olandesi rivedute/revocate 2024 → controllo pieno olandese da settembre 2024. Questa catena chiude nel Beat 1-3, con ogni anello datato.
- Catena di conseguenza economica: restrizioni equipaggiamento + Entity List cumulativi → calo quota fatturato ASML Cina → enforcement con sanzioni reali (Seagate) → escalation al caso limite Nexperia (sequestro di un'azienda intera, non solo blocco di una licenza) → ritorsione cinese immediata → rischio concreto per la filiera automotive globale. Questa catena chiude nel Beat 4-6, esplicitamente non moralizzata (il capitolo non deve concludere se il regime USA sia "giusto", solo mostrarne il funzionamento e il costo).

**Risk proportionality guards:**
- Se si presenta l'FDPR come strumento di dominio unilaterale USA, va bilanciato ricordando che nasce da una limitazione reale del regime multilaterale Wassenaar (consenso unanime, nessun potere su un non-membro come la Cina) — non è arbitrio, è la scelta di uno strumento più efficace rispetto a uno inefficace per l'obiettivo dichiarato.
- Se si cita il calo di fatturato ASML verso la Cina, va confrontato esplicitamente con il fatturato totale e con l'eventuale picco di stoccaggio anticipato, per evitare sia la minimizzazione ("ASML non ha perso nulla") sia il sensazionalismo ("ASML è stata distrutta dal embargo") — nessuna delle due è supportata finché non si guarda la serie temporale completa.
- Se si presenta il sequestro Nexperia come prova di subordinazione olandese a Washington, va bilanciato riportando esplicitamente la posizione ufficiale olandese (motivazione di sicurezza nazionale propria, non ordine americano) come dichiarazione verificabile, con lo stesso rigore metodologico già usato nel cap. 3 per le dichiarazioni Ruginienė — riportata, non promossa a fatto accertato per comodità narrativa.
- Se si menziona la ritorsione cinese su Nexperia come prova di debolezza occidentale, va bilanciata con i dati reali sulla durata e sull'esito della crisi (de-escalazione, tempi), per evitare di presentare un evento amministrativo risolto come un collasso della filiera che non si è verificato.

---

## RESEARCHER BRIEF

**Priorità fonti:** Corpus NotebookLM è STRONG per il nucleo storico-legale (Wassenaar, FDPR, trilaterale, impatto ASML, Entity List) — interrogarlo per primo. Aspettarsi invece gap sul caso Nexperia (settembre-novembre 2025, probabilmente troppo recente per le fonti raccolte) e su eventuali cifre 2025-2026: per questi due ambiti passare direttamente a web search senza perdere tempo a insistere su NotebookLM.

**Query NotebookLM (in ordine):**
1. "Come ha usato Washington il Foreign Direct Product Rule per bloccare le esportazioni di attrezzature per semiconduttori verso la Cina?"
2. "Cosa prevede l'accordo trilaterale tra Stati Uniti, Paesi Bassi e Giappone di gennaio 2023 sui controlli all'export di apparecchiature per semiconduttori?"
3. "Perché il governo olandese ha revocato le licenze di esportazione ASML per la Cina nel 2023-2024?"
4. "Qual è la struttura del Wassenaar Arrangement e perché non può bloccare direttamente le esportazioni verso la Cina?"
5. "Quale impatto hanno avuto le restrizioni all'export sul fatturato di ASML in Cina?"
6. "Quali aziende sono state sanzionate per violazione delle regole di export control USA verso la Cina nel settore dei semiconduttori?"

**Web search terms (obbligatori per i fatti 2024-2026, in particolare Nexperia):**
- "Foreign Direct Product Rule October 2022 October 2023 semiconductor rule text explanation"
- "Netherlands ASML export control law September 2024 full authority"
- "Cymer ASML San Diego light source subsidiary export control implications"
- "US Netherlands Japan trilateral agreement January 2023 semiconductor equipment export"
- "ASML China revenue share percentage 2022 2023 2024 2025 quarterly"
- "Entity List China semiconductor companies December 2024 addition number"
- "Seagate $300 million fine Huawei export violation 2023"
- "Nexperia Wingtech Entity List December 2024"
- "Nexperia Netherlands government Goods Availability Act September 30 2025 seizure Zhang Xuezheng"
- "Nexperia China export ban Dongguan chips October November 2025 automotive shortage"
- "Nexperia crisis resolution status 2026"

**Document types da prioritizzare:**
- Testi normativi/comunicati ufficiali: Bureau of Industry and Security (BIS), Department of Commerce (per FDPR e Entity List), governo olandese (Ministerie van Buitenlandse Zaken / Ministerie van Economische Zaken) per la legge di settembre 2024 e il Goods Availability Act
- Report finanziari ASML (trimestrali, per la quota di fatturato Cina) e comunicati stampa aziendali Nexperia
- Giornalismo economico specializzato (Reuters, Bloomberg, Financial Times, Politico Europe, NRC/Het Financieele Dagblad per la prospettiva olandese) per la cronologia Nexperia 2025
- Think tank su export control e geopolitica dei chip (CSIS, Center for a New American Security, Rhodium Group) già eventualmente citati nei dossier dei capp. 1-3, da riusare per coerenza di fonte
- Documenti WTO o dichiarazioni diplomatiche olandesi/cinesi ufficiali su Nexperia, se disponibili

**Fatti specifici da cacciare (priorità [SHADOW] per dettaglio sensoriale e [PUBLIC] per cifre):**
- Data esatta e testo/sintesi ufficiale delle due estensioni FDPR (8 ottobre 2022, 17 ottobre 2023)
- Anno di acquisizione di Cymer da parte di ASML (2013) e sede esatta (San Diego) — dettaglio fisico concreto per il Sensory Mandate
- Cifra precisa (o range) della quota di fatturato ASML dalla Cina, anno per anno, con fonte (bilanci ASML)
- Numero esatto di aziende cinesi aggiunte all'Entity List nell'ondata di dicembre 2024
- Importo esatto della sanzione Seagate (300 milioni di dollari, 2023) e motivazione ufficiale BIS
- Data esatta di inserimento di Wingtech nell'Entity List (dicembre 2024) e testo della motivazione ufficiale
- Data esatta dell'intervento del governo olandese su Nexperia (30 settembre 2025), base legale citata (Goods Availability Act, 1952), nome e ruolo del CEO coinvolto (Zhang Xuezheng)
- Data di inizio del blocco export cinese dallo stabilimento di Dongguan, prodotti coinvolti, quota di mercato globale Nexperia in chip automotive discreti
- Eventuale dichiarazione testuale di un funzionario olandese, cinese o di un dirigente automobilistico sulla crisi Nexperia, con fonte primaria e data
- Se un fatto non è triangolabile su almeno due fonti indipendenti dopo aver esaurito NotebookLM e web search, segnalare `[BLOCKED: needs human input]` esplicitamente nel dossier — non indovinare la cronologia Nexperia, che è l'area a più alto rischio di imprecisione in questo capitolo

---

## TARGET

**Word count:** 6200–7300 parole (7 beat, in linea con l'estensione di cap. 1-3 ma leggermente superiore per la maggiore densità tecnica dei Beat 2-3-6; deve eguagliare o superare la soglia NUF dell'Editor — baseline 8.5/10 — e la copertura NUF del cap. 1)

**Opening hook strategy:** Aprire non con una domanda retorica generica ("Cosa succederebbe se...", esplicitamente vietata) ma con un dato fisico concreto e spiazzante — la sorgente di luce dentro una macchina litografica "olandese" che in realtà porta la targa di un'azienda di San Diego — per rovesciare subito l'assunto implicito del titolo del capitolo: il permesso non è mai stato del tutto olandese, nemmeno prima che qualcuno lo dichiarasse ad alta voce.

**Closing beat promise:** Il capitolo chiude non con un verdetto su chi controlla davvero ASML, ma mostrando che la stessa domanda — quanto vale una sovranità che dipende da un permesso altrui — si applica su scala completamente diversa (un G7 ricco e tecnologicamente insostituibile, non un piccolo stato baltico) con lo stesso risultato pratico del cap. 3, aprendo senza risolvere il filo che il cap. 5 svilupperà per intero: cosa ha fatto davvero la Cina, dall'altra parte di questo veto, per non restare bloccata.
