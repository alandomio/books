# STRUTTURA — Capitolo 5: L'Assedio Logistico di Pechino

**Core question (da PRD.md):** Come la Cina ha trasformato l'embargo in un acceleratore di autosufficienza tecnologica, raggiungendo i 5nm senza EUV?
**Audience tag capitolo (da PRD.md):** [EXPERT/GENERAL]
**Corpus coverage (da PRD.md/INSTRUCTION.md):** STRONG — NotebookLM è fonte primaria. Nessun corpus-gap protocol richiesto per questo capitolo (a differenza di cap. 7, 8, 9).

---

## CONTINUITY CHECK (obbligatorio, letto chapter_index.md + chapter_4.md)

**Aggancio diretto dal cap. 4 (non è una scelta dell'Architect, è un debito narrativo già contratto):** l'ultimo paragrafo di `chapter_4.md` chiude esplicitamente rimandando a questo capitolo: *"la Cina sottoposta a tutte le restrizioni descritte in questo capitolo non è rimasta ferma: ha accelerato la propria corsa all'autosufficienza tecnologica, rivendicando traguardi di processo — nodi a 5 nanometri raggiunti, si dice, senza litografia EUV — che il prossimo capitolo dovrà verificare fatto per fatto [...]. Se quella corsa abbia davvero rallentato la Cina, o l'abbia solo costretta su un percorso più costoso ma comunque praticabile, è la domanda che il prossimo capitolo dovrà affrontare per intero."* Questo capitolo DEVE rispondere a quella domanda con fatti verificati, non darla per acquisita.

**Verifica contro `chapter_index.md` — Capitolo 1, Affermazioni centrali:** *"L'autosufficienza tecnologica cinese nella fabbricazione dei chip avanzati è fortemente rallentata dall'impossibilità di replicare a breve termine l'intera filiera globale di fornitura che rende possibile la litografia EUV."*
Non è una contraddizione da segnalare come conflitto — è la tesi che questo capitolo deve **mettere alla prova con i numeri**, non ribaltare né confermare per pigrizia. Il Mate 60 Pro/Kirin 9000s dimostra che "rallentata" non significa "fermata": la Cina ha raggiunto un nodo equivalente al 7nm (non ai 5nm veri, vedi Beat 2) senza EUV, ma a un costo per wafer e con un yield che il capitolo deve quantificare. **Verdetto narrativo che il capitolo deve guadagnarsi coi fatti, non annunciare in apertura:** rallentata e resa più costosa, non fermata — coerente con l'affermazione del cap. 1, la aggiorna con i dati del 2023-2026 senza smentirla.

**Glossary check (`NARRATIVE_GLOSSARY.md`):** Nessuna contraddizione. Il capitolo eredita ed estende termini già presenti — **EUV**, **DUV**, **yield**, **wafer**, **Entity List**, **FDPR** — e introduce nodi nuovi (SMIC, N+2, multi-patterning DUV/SAQP, Big Fund, SiCarrier) che il Writer Stage 2 dovrà aggiungere al glossario. Nota per il Writer: il glossario definisce già "multi-patterning" nel cap. 4 come tecnica per spingere DUV oltre i suoi limiti nativi (macchine Twinscan NXT:2050i/2100i) — questo capitolo non introduce il concetto da zero, lo *intensifica* (SAQP, quadruple patterning) per un nodo ancora più avanzato. Va scritto come continuazione esplicita, non come scoperta nuova.

---

## NUF — NARRATIVE UTILITY FUNCTIONS

utility(reader): Il lettore può spiegare a qualcun altro perché un chip SMIC "equivalente al 7nm" non equivale affatto a un chip TSMC N7, nonostante titoli di giornale e propaganda di Pechino li trattino come intercambiabili — capendo la differenza tra un'esposizione singola EUV e un multi-patterning DUV forzato a colpi di passaggi ripetuti. → score += 1

utility(reader-2): Il lettore può ricostruire, con le date esatte, la catena causale completa: blocco EUV 2019 (cap. 4) → Entity List SMIC 2020 → FDPR estesa 2022-2023 (cap. 4) → Huawei Mate 60 Pro agosto 2023 → Big Fund III e SiCarrier 2024 — collegandola esplicitamente, senza salti logici, al capitolo precedente. → score += 1

utility(emotional): Il lettore sente lo spiazzamento di scoprire che l'embargo americano, presentato come un blocco netto, ha prodotto un esito ambiguo — né fallimento americano né vittoria cinese piena — che smentisce sia la narrazione trionfalistica di Pechino sia quella consolatoria di Washington. → score += 1

utility(emotional-2): Il lettore percepisce l'ipocrisia strutturale di una retorica cinese di "autosufficienza tecnologica" che convive con un'inchiesta di corruzione interna sui fondi statali destinati proprio a quella autosufficienza — lo stesso disagio già provato nei capp. precedenti per la "sovranità tecnologica" occidentale, questa volta rivolto verso Pechino, non verso L'Aia o Bruxelles. → score += 1

utility(factual): la sequenza datata e sourced del caso Huawei Mate 60 Pro / Kirin 9000s — data di lancio, coincidenza con la visita in Cina della Segretaria al Commercio USA, esito del teardown tecnico che ha identificato il nodo di processo — citata con fonte primaria verificabile. → score += 1

utility(factual-2): le cifre esatte del Big Fund cinese (fase I, II, III — importi in yuan e in dollari, anni) e del caso di corruzione 2022 (nomi, ruoli, esito giudiziario) confrontate con il risultato reale in resa produttiva e capacità installata, non riportate come fatto isolato — applicando la stessa Number Rule (promesso vs. consegnato) già usata nei capp. precedenti per i sussidi occidentali. → score += 1

---

## BEAT LIST

### Beat 1 — "Il telefono che non doveva esistere"
**Core question:** Cosa è successo, esattamente, il 29 agosto 2023?
**Audience:** [BOTH]
**Word target:** 900-1000
**Funzione paragrafo dominante:** Hook / Establish
**Key facts per il Ricercatore:**
- Data esatta di lancio/vendita del Huawei Mate 60 Pro (29 agosto 2023) e sovrapposizione con la visita in Cina della Segretaria al Commercio USA Gina Raimondo (27-30 agosto 2023) — verificare se il lancio è avvenuto *durante* la visita o a ridosso, con fonte primaria.
- Reazione ufficiale del Dipartimento del Commercio USA e di Raimondo alla notizia del teardown.
- Dettagli del lancio: modalità silenziosa/senza conferenza stampa, vendite immediate, code fuori dai negozi Huawei — con numeri se disponibili.

### Beat 2 — "Cosa c'è dentro: il teardown TechInsights"
**Core question:** Che chip è davvero il Kirin 9000s, e cosa significa "nodo equivalente al 7nm" fabbricato senza EUV?
**Audience:** [EXPERT/GENERAL]
**Word target:** 1000-1200
**Funzione paragrafo dominante:** Establish / Complicate
**Key facts per il Ricercatore:**
- Report TechInsights (ottobre 2023): identificazione del System-on-Chip Kirin 9000s, processo SMIC N+2, classificazione tecnica esatta (7nm-class, non 5nm nonostante alcune coperture stampa abbiano parlato di "5nm").
- Denominazione dei nodi SMIC (N+1, N+2) e perché non è direttamente comparabile alla nomenclatura TSMC/Samsung (numero nanometrico ormai è marketing, non misura fisica diretta — va spiegato senza gergo per il lettore generale).
- Spiegazione tecnica del multi-patterning DUV/SAQP (self-aligned quadruple patterning): quanti passaggi di esposizione servono per simulare la risoluzione EUV, e con quale penalità di tempo macchina.
- Collegamento esplicito alle macchine Twinscan NXT:2050i/2100i già descritte nel cap. 4 — SMIC ha comprato sistemi DUV a immersione ASML prima delle restrizioni più dure: verificare le date di consegna a SMIC di questi sistemi rispetto alle finestre di export control del 2019-2023.

### Beat 3 — "Il conto: yield e costo per wafer"
**Core question:** A che prezzo — in soldi e in scarti di produzione — SMIC ottiene questo nodo senza EUV?
**Audience:** [EXPERT]
**Word target:** 900-1100
**Funzione paragrafo dominante:** Complicate
**Key facts per il Ricercatore:**
- Stime di yield del processo SMIC N+1/N+2 da fonti analista (Bernstein Research, TrendForce, TechInsights) — riportare il range, non un singolo numero (Number Rules dello STYLE_BIBLE), e segnalare esplicitamente in [CONFLICT] che SMIC non pubblica dati ufficiali di yield.
- Stime di costo per wafer del processo SMIC avanzato rispetto al nodo comparabile TSMC (premio percentuale riportato da analisti/Bloomberg) — anche qui range, non cifra secca, e distinguere chiaramente stima analista da dato confermato.
- Eventuali dati su volumi di produzione reali del Kirin 9000s/9010 (Huawei Pura 70, 2024) come prova che la produzione, pur costosa, è scalata oltre il prototipo.

### Beat 4 — "I soldi dietro il miracolo: il Big Fund"
**Core question:** Chi ha pagato la rincorsa cinese, e con quanta efficienza?
**Audience:** [GENERAL/EXPERT]
**Word target:** 1000-1100
**Funzione paragrafo dominante:** Complicate / Pivot
**Key facts per il Ricercatore:**
- Cifre esatte, in yuan e in dollari, delle tre fasi del National Integrated Circuit Industry Investment Fund ("Big Fund"): Fase I (2014), Fase II (2019), Fase III (2024) — importi, data di lancio, azionisti/enti coinvolti.
- Indagine di corruzione 2022: nomi (incluso l'ex presidente del Big Fund, ministri/funzionari MIIT coinvolti), data di apertura dell'indagine, esito giudiziario se disponibile, importi contestati.
- Confronto esplicito tra capitale stanziato e risultato produttivo reale ottenuto (capacità installata, nodi effettivamente raggiunti) — applicando la stessa logica "promesso vs. consegnato" già usata per i sussidi CHIPS Act/EU nei capp. 2 e 4.

### Beat 5 — "L'ecosistema di scorta: chi costruisce le macchine adesso"
**Core question:** Chi sta cercando di sostituire ASML, Applied Materials, Tokyo Electron dentro la Cina?
**Audience:** [EXPERT/GENERAL]
**Word target:** 900-1000
**Funzione paragrafo dominante:** Establish / Complicate
**Key facts per il Ricercatore:**
- Profilo aggiornato delle aziende cinesi di apparecchiature già nominate nel cap. 4 come inserite nella "terza ondata" Entity List dicembre 2024 (NAURA, Kingsemi, Piotech, Skyverse) — quota di mercato interna, categoria di macchinari prodotti, distanza tecnologica reale dal DUV/EUV occidentale.
- SiCarrier Technology (Shenzhen): anno di emersione pubblica, legami riportati con Huawei, tipo di apparecchiature sviluppate, eventuale brevetto o prototipo relativo a litografia o processi adiacenti.
- Tasso di autosufficienza cinese nella componentistica di fabbricazione dei semiconduttori (percentuale, fonte, per categoria di macchinario — non un numero unico aggregato che nasconda le differenze tra tool maturi e tool di frontiera).

### Beat 6 — "Cosa significa davvero per la deterrenza"
**Core question:** Un chip 7nm-class prodotto in Cina cambia i calcoli sullo Scudo di Silicio e sulla proiezione militare cinese?
**Audience:** [BOTH]
**Word target:** 900-1000
**Funzione paragrafo dominante:** Pivot
**Key facts per il Ricercatore:**
- Uso del processo SMIC avanzato per chip AI (Huawei Ascend 910B e successori) — capacità dichiarata, eventuali limiti di produzione in volume per applicazioni AI/militari, fonti che confrontano le prestazioni con Nvidia H100/A100.
- Collegamento esplicito al cap. 2 (Silicon Shield): la teoria dello scudo taiwanese si basa sulla presunta insostituibilità dei nodi avanzati di TSMC — verificare se analisti di settore ritengono che un 7nm-class cinese, per quanto costoso, eroda quella tesi per usi militari/AI anche senza eguagliare i nodi civili di punta.

### Beat 7 — "Rallentata, non fermata: il verdetto"
**Core question:** L'embargo ha funzionato o no?
**Audience:** [BOTH]
**Word target:** 900-1000
**Funzione paragrafo dominante:** Resolve
**Key facts per il Ricercatore:**
- Analisi terze parti sull'efficacia dei controlli export USA verso la Cina (Georgetown CSET, RAND, Peterson Institute for International Economics, o equivalenti con pubblicazioni datate e citabili) — posizioni divergenti da riportare in [CONFLICT] se contrastanti.
- Dichiarazioni ufficiali cinesi (MOFCOM, media di stato) sulla narrativa di "autosufficienza raggiunta" da confrontare puntualmente con i dati di yield/costo del Beat 3 — stesso trattamento riservato nel cap. 4 alle dichiarazioni ufficiali olandesi (riportate come dichiarazione verificabile, non fatto accertato).

### Beat 8 — "Chi paga il conto, adesso"
**Core question:** Il costo di questa autosufficienza forzata, chi lo sta pagando davvero — e cosa apre per il prossimo capitolo?
**Audience:** [BOTH]
**Word target:** 700-900
**Funzione paragrafo dominante:** Land / Pivot verso cap. 6
**Key facts per il Ricercatore:**
- Eventuali dati su prezzo al consumo dei device Huawei con questi chip rispetto ai concorrenti (indicatore indiretto del sussidio implicito trasferito al consumatore/contribuente cinese).
- Verificare se esistono fonti (2025-2026) su ulteriori round di restrizioni USA specificamente mirate a chiudere la scappatoia DUV multi-patterning (in continuità con il MATCH Act 2026 già citato nel cap. 4) — per costruire il ponte narrativo verso il cap. 6 (asse Vilnius-Taipei) senza anticiparne i contenuti.
**Nota di chiusura per l'Architect/Writer:** questo beat NON deve ricalcare la chiusa del cap. 4 (STYLE_BIBLE, vincolo anti-AI universale: "Il mio finale non può eco di nessun capitolo precedente"). Il cap. 4 chiudeva con un'immagine statica (una firma su un permesso). Questo capitolo deve chiudere su un movimento — la corsa cinese continua, a un costo che qualcuno paga ogni giorno — senza intensificare toni da "bomba a orologeria" (pattern bannato #4 dello STYLE_BIBLE).

---

## REVIEWER READINESS NOTES

**Tension points (≥2 richiesti):**
1. **Tensione centrale:** un embargo che non ha impedito il risultato tecnico (chip 7nm-class prodotto e venduto) ma lo ha reso strutturalmente più costoso e meno efficiente (yield basso, costo per wafer maggiorato) — nessuna delle due narrazioni ufficiali (Washington: "l'embargo funziona"; Pechino: "siamo autosufficienti") regge da sola. Il capitolo deve vivere in questa ambiguità, non risolverla in una delle due direzioni per comodità narrativa.
2. **Tensione secondaria:** la retorica di sovranità/autosufficienza tecnologica cinese convive con un'inchiesta di corruzione interna sui fondi pubblici stanziati proprio per quell'autosufficienza (Big Fund, 2022) — stessa dinamica di ipocrisia già smontata in Occidente nei capp. 2 e 4, qui applicata a Pechino per simmetria, non per faziosità.
3. **Tensione terza (militare):** un chip che non eguaglia i nodi civili più avanzati di TSMC potrebbe comunque essere sufficiente per applicazioni AI/militari — il che significa che la metrica rilevante per la deterrenza (Scudo di Silicio, cap. 2) non è la stessa metrica rilevante per il mercato consumer, e il capitolo deve tenerle esplicitamente separate.

**Key chains da rendere esplicite (causa → conseguenza → azione/insight del lettore):**
- Blocco EUV 2019 (cap. 4) → SMIC costretta al multi-patterning DUV → nodo 7nm-class raggiunto ma a costo/yield penalizzati → il lettore capisce perché "5nm senza EUV" è un titolo giornalistico impreciso, non un fatto tecnico.
- Entity List/FDPR estesa 2022-2023 (cap. 4) → risposta di Pechino in sussidi di stato (Big Fund III, 2024) → corruzione interna emersa (2022) → il lettore vede che la risposta cinese alla pressione americana ha gli stessi difetti strutturali (spreco, opacità) che il libro ha già mostrato lato occidentale.
- Yield basso + costo alto (Beat 3) → produzione comunque scalata a device reali venduti in volume (Beat 1-2) → il lettore arriva al verdetto corretto: "rallentata, non fermata" — coerente con l'affermazione del cap. 1, non una sua smentita.

**Risk proportionality guards (ogni volta che si cita un costo/rischio, va bilanciato):**
- Ogni cifra di sussidio cinese (Big Fund I/II/III) va confrontata col risultato produttivo reale ottenuto, non lasciata come fatto isolato — stessa Number Rule già applicata ai sussidi CHIPS Act nei capp. 2 e 4.
- Ogni stima di yield o costo per wafer va presentata come range di fonte analista, con esplicita segnalazione che SMIC non pubblica dati ufficiali — mai una cifra secca spacciata per dato confermato.
- Le dichiarazioni ufficiali cinesi di "autosufficienza raggiunta" vanno riportate come dichiarazioni verificabili, non fatti accertati — stesso standard metodologico già applicato alle dichiarazioni della premier lituana (cap. 3) e del Ministro Karremans (cap. 4).
- L'affermazione "un chip 7nm-class può bastare per applicazioni militari/AI" va accompagnata dal limite reale (volumi di produzione, costo, eventuali colli di bottiglia residui) — non lasciata come claim allarmistico non pesato.

---

## RESEARCHER BRIEF

**Priorità fonti (da INSTRUCTION.md):** NotebookLM prima (copertura STRONG su questo capitolo), poi web search/document scraper per triangolare e per eventi 2024-2026 successivi alla chiusura del corpus.

**Query NotebookLM (usare `python scripts/run.py ask_question.py --notebook-url "https://notebooklm.google.com/notebook/b14fa876-39db-4487-818d-3f8e89d9b786" --question "..."`):**
1. "Huawei Mate 60 Pro Kirin 9000s SMIC teardown TechInsights nodo di processo"
2. "SMIC N+1 N+2 multi-patterning DUV litografia senza EUV"
3. "Big Fund China National Integrated Circuit Industry Investment Fund fasi importi"
4. "corruzione 2022 Big Fund Cina funzionari indagine semiconduttori"
5. "SiCarrier NAURA Piotech Kingsemi apparecchiature semiconduttori Cina Entity List"
6. "Huawei Ascend 910B SMIC processo avanzato AI chip"
7. "export control efficacia Cina rallentamento tecnologico analisi"

**Query Web Search (in ordine di priorità, per eventi/dati che il corpus NotebookLM potrebbe non coprire per intero, specialmente 2024-2026):**
1. "Huawei Mate 60 Pro launch date August 29 2023 Raimondo China visit"
2. "TechInsights Kirin 9000s teardown SMIC N+2 7nm process October 2023"
3. "SMIC yield rate 7nm N+1 N+2 estimate Bernstein Research TrendForce"
4. "SMIC advanced node cost per wafer premium versus TSMC analyst estimate"
5. "China Big Fund phase III 2024 344 billion yuan semiconductor investment"
6. "Ding Wenwu Big Fund corruption investigation 2022 China semiconductor"
7. "SiCarrier Technology Shenzhen Huawei semiconductor equipment 2024"
8. "China semiconductor equipment self-sufficiency rate domestic tools 2025 2026"
9. "Huawei Ascend 910B SMIC chip AI military implications export control"
10. "US export control China semiconductor effectiveness analysis CSET RAND Peterson Institute"
11. "Huawei Pura 70 Kirin 9010 2024 SMIC chip volume production"
12. "MATCH Act 2026 DUV loophole China semiconductor restriction update"

**Tipi di documento da prioritizzare:**
- Report tecnici di teardown (TechInsights) — fonte primaria per l'identificazione del chip.
- Analisi di settore da case di ricerca semiconduttori (TrendForce, Bernstein Research, SemiAnalysis) — per yield e costi, sempre citate come stime, non fatti.
- Comunicati ufficiali BIS/Dipartimento del Commercio USA — per la cronologia delle restrizioni.
- Fonti giornalistiche economiche di alto standing (Bloomberg, Reuters, Financial Times, Nikkei Asia) — per la cronologia degli eventi e le cifre finanziarie del Big Fund.
- Report accademici/think tank (Georgetown CSET, RAND, Peterson Institute) — per il dibattito sull'efficacia dei controlli export.
- Comunicati ufficiali cinesi (MOFCOM, Xinhua, media di stato) — da riportare sempre come posizione dichiarata, mai come fatto verificato indipendentemente.

**Fatti specifici, date, nomi, numeri da cercare esplicitamente:**
- Data esatta lancio Mate 60 Pro e date esatte visita Raimondo in Cina (agosto 2023).
- Data pubblicazione report TechInsights sul teardown Kirin 9000s.
- Nomenclatura tecnica precisa: SMIC N+1 vs N+2, differenza rispetto a TSMC N7/N5.
- Anno e importo esatto (yuan e USD) di Big Fund Fase I (2014), Fase II (2019), Fase III (2024).
- Nome/i esatto/i e ruolo dei funzionari coinvolti nell'indagine di corruzione 2022, data di apertura e stato dell'indagine/esito.
- Percentuali di yield stimate (range, con fonte) per il processo SMIC avanzato.
- Stima di costo per wafer SMIC vs TSMC (percentuale di sovracosto, con fonte).
- Anno di fondazione/emersione pubblica di SiCarrier e legami riportati con Huawei.
- Data e dettagli della "terza ondata" Entity List dicembre 2024 già citata nel cap. 4 (NAURA, Kingsemi, Piotech, Skyverse) — verificarne il ruolo specifico nell'ecosistema di apparecchiature.
- Eventuali aggiornamenti 2025-2026 su restrizioni mirate alla scappatoia del multi-patterning DUV (per il ponte narrativo di chiusura verso cap. 6).

**[CONFLICT] atteso, da segnalare esplicitamente nel dossier:** yield rate e costo per wafer del processo SMIC non sono dati pubblici ufficiali — ogni fonte darà stime divergenti. Il dossier deve riportare il range completo e le fonti in disaccordo, non scegliere il numero più drammatico.

---

## TARGET

**Word count:** ~6.500-7.500 parole (in linea con il cap. 4, ~6505 parole — nessuna preferenza di lunghezza diversa specificata in PRD.md, si mantiene la baseline già stabilita dalla pipeline).

**Opening hook strategy:** Aprire in scena, non in tesi — il lancio silenzioso del Mate 60 Pro il 29 agosto 2023, con il dettaglio concreto della sovrapposizione temporale con la visita di Raimondo, prima di nominare qualunque concetto astratto ("autosufficienza", "embargo").

**Closing beat promise:** Chiudere non su chi ha vinto l'embargo, ma su chi sta pagando — ogni giorno, in resa di produzione e denaro pubblico — il costo di una corsa che non è né fallita né conclusa, aprendo silenziosamente la porta al capitolo 6 senza anticiparne i contenuti.
