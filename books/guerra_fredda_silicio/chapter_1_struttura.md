# Capitolo 1 — Struttura: "La Cattedrale di Veldhoven"

**Core question:** Come una sola azienda in una cittadina olandese di 30.000 abitanti è diventata l'unico guardiano della litografia EUV — il collo di bottiglia che decide chi, nel mondo, può fabbricare i chip più avanzati?

**Audience tag (capitolo):** [ALL]

---

## NUFs (Narrative Utility Functions)

```
utility(reader): Il lettore può spiegare a qualcun altro perché nessuna azienda al mondo, oltre ad ASML, sa costruire una macchina EUV — e perché questo non è un caso di superiorità tecnica generica ma di un monopolio costruito su decenni di scelte specifiche (Zeiss per l'ottica, Cymer per la fonte di plasma, decenni di R&D che nessun concorrente può comprimere in tempo utile) → score += 1

utility(emotional): Il lettore sente lo spaesamento concreto di scoprire che l'intera economia digitale globale passa attraverso un singolo edificio in una città che non conosceva — e l'inquietudine che ne consegue, non come paura abstratta ma come la sensazione fisica di un punto di strozzatura reale → score += 1

utility(factual): Il lettore conosce almeno tre cifre verificate e sourced (es. costo di una singola macchina EUV, numero di componenti che la compongono, tempo di consegna/installazione) che rendono tangibile la scala del monopolio — non "milioni" generico ma la cifra esatta dal dossier → score += 1

utility(reader-2): Il lettore può collocare ASML nella catena causale completa — dalla sabbia di silicio al chip finito — capendo esattamente in quale anello la macchina EUV interviene e perché saltare quell'anello non è un'opzione per nessun produttore di chip avanzati (TSMC, Samsung, Intel) → score += 1
```

---

## BEAT LIST

### Beat 1 — "L'edificio senza insegne"
- **Core question:** Cos'è, fisicamente, lo stabilimento ASML di Veldhoven, e perché un visitatore casuale non capirebbe mai cosa contiene?
- **Audience tag:** [GENERAL]
- **Word target:** 900–1100
- **Key facts da cercare (Researcher):**
  - Dimensioni reali del campus ASML a Veldhoven (m², numero edifici, numero dipendenti in sito)
  - Livello di sicurezza fisica e accesso (badge, zone clean room, NDA)
  - Anno di fondazione di ASML e contesto (spin-off Philips + Advanced Semiconductor Materials, 1984)
  - Una citazione o aneddoto pubblico (intervista, articolo) che descriva l'atmosfera del sito

### Beat 2 — "Cosa fa, davvero, una macchina EUV"
- **Core question:** Come funziona, in termini comprensibili, la litografia ultravioletta estrema — e perché è un salto fisico, non solo ingegneristico, rispetto alla litografia precedente?
- **Audience tag:** [BOTH] (spiegazione tecnica accessibile, poi traduzione per il lettore generale)
- **Word target:** 1000–1200
- **Key facts da cercare (Researcher):**
  - Lunghezza d'onda EUV (13,5 nm) vs litografia DUV precedente (193 nm) — perché il salto conta
  - Come si genera la luce EUV (plasma di stagno colpito da laser CO2, tecnologia Cymer/ASML)
  - Numero di specchi Zeiss nel sistema ottico e tolleranza di precisione (es. ordine di grandezza in nanometri/picometri)
  - Quanti wafer/ore può processare una macchina EUV (throughput)

### Beat 3 — "Il prezzo di un monopolio"
- **Core question:** Quanto costa, letteralmente, una macchina EUV — e cosa significa quel prezzo per chi può (o non può) permettersela?
- **Audience tag:** [GENERAL]
- **Word target:** 800–1000
- **Key facts da cercare (Researcher):**
  - Prezzo esatto di una macchina EUV (e della variante High-NA più recente) in euro/dollari, con fonte (report finanziario ASML, articolo specializzato)
  - Numero di componenti che compongono una macchina EUV (cifra spesso citata: >100.000 parti)
  - Numero di camion/container necessari per il trasporto e tempo di installazione in sito (settimane/mesi)
  - Lista (anche solo parziale, citata) dei clienti che possono comprarne una: TSMC, Samsung, Intel — e chi NON può (export control verso Cina, da approfondire in cap. 4)

### Beat 4 — "Perché nessuno può copiarla"
- **Core question:** Perché, con tutto il denaro e l'ambizione del mondo, nessun concorrente — cinese, americano, giapponese — è riuscito a costruire una macchina EUV concorrente in vent'anni?
- **Audience tag:** [BOTH]
- **Word target:** 1000–1200
- **Key facts da cercare (Researcher):**
  - Storia del consorzio di R&D che ha prodotto EUV (EUV LLC, contributo Intel/Samsung/TSMC come investitori, anni '90-2000)
  - Ruolo esclusivo di Carl Zeiss SMT per l'ottica — perché è un fornitore unico e non sostituibile
  - Ruolo di Cymer (acquisita da ASML nel 2013) per la fonte di luce
  - Tentativi noti di altri paesi/aziende di replicare la tecnologia e perché sono falliti o sono indietro di anni (es. iniziative cinesi, SMEE)
  - Anni di R&D cumulativi investiti prima della prima macchina EUV vendibile commercialmente (~2018)

### Beat 5 — "La sabbia, il chip, la posta in gioco"
- **Core question:** Dove si colloca ASML nella catena causale completa che porta dalla sabbia di silicio al chip nello smartphone del lettore — e perché saltare l'anello EUV non è un'opzione?
- **Audience tag:** [GENERAL]
- **Word target:** 900–1100
- **Key facts da cercare (Researcher):**
  - Catena semplificata: silicio grezzo → wafer → litografia → fab avanzata → packaging → dispositivo finale
  - Quali nodi di processo (es. 5nm, 3nm) richiedono EUV obbligatoriamente, quali ancora no (per dare concretezza tecnica senza eccesso di gergo)
  - Esempio concreto di prodotto finale che dipende da chip fabbricati con EUV (es. processore di uno smartphone specifico, GPU per AI)
  - Cifra di mercato/fatturato che dipende, anche indirettamente, da questi chip (con fonte)

### Beat 6 — "Il guardiano non è neutrale"
- **Core question:** Perché definire ASML "solo un'azienda che vende macchine" è il primo mito che il libro deve demolire — e come si lega al tema generale dell'Enemy del libro?
- **Audience tag:** [GENERAL]
- **Word target:** 800–1000
- **Key facts da cercare (Researcher):**
  - Esempio concreto e già pubblico (non anticipare troppo cap. 4) di un caso in cui ASML ha dovuto negare o limitare una vendita per ragioni geopolitiche/export control (cenno, non sviluppo — quello è cap. 4)
  - Composizione azionaria/influenza statale olandese e americana su ASML (per stabilire che non è un attore puramente privato)
  - Una dichiarazione pubblica di un dirigente ASML o funzionario governativo che riconosce il peso geopolitico dell'azienda

---

## REVIEWER READINESS NOTES

**Tension points (≥2):**
1. **Tensione tecnica-umana:** la precisione quasi assurda richiesta dalla macchina EUV (tolleranze nell'ordine del picometro, specchi più piatti di qualsiasi oggetto mai fabbricato) contro la fragilità della catena che dipende da quella precisione — un singolo errore di fabbricazione a Veldhoven o a Oberkochen (Zeiss) si propaga a livello globale. Questa tensione va costruita nel Beat 2 e 4, non solo affermata.
2. **Tensione del monopolio involontario:** ASML non ha "vinto" un mercato competitivo nel senso classico — ha eliminato la competizione attraverso decenni di R&D che nessuno può più recuperare. Questo crea una domanda implicita per il lettore: è sano che l'economia globale dipenda da un'azienda che non ha veri concorrenti? Va sollevata nel Beat 4 e lasciata aperta (non risolta) per alimentare il resto del libro.

**Key chains da rendere esplicite:**
- Catena causale: decisione di investimento R&D (anni '80-2000, consorzio EUV LLC) → barriera all'ingresso diventata insormontabile → dipendenza globale odierna da un singolo fornitore → vulnerabilità geopolitica (sviluppata nei capitoli successivi). Il capitolo 1 deve chiudere il primo anello di questa catena, non tutti.
- Catena fisica: silicio → wafer → litografia EUV → fab avanzata → chip → dispositivo che il lettore ha in tasca. Questa catena deve essere visivamente/concretamente tracciabile entro la fine del Beat 5.

**Risk proportionality guards:**
- Se si menziona il costo di una macchina EUV (centinaia di milioni di euro), va bilanciato con il contesto di chi può assorbire quel costo (fatturato annuo dei clienti TSMC/Samsung/Intel) — altrimenti la cifra resta sensazionalistica senza scala di paragone.
- Se si menziona la vulnerabilità del monopolio ASML, va bilanciato esplicitamente con il fatto che questa stessa concentrazione ha permesso i progressi tecnologici degli ultimi 15 anni — non solo costo, anche beneficio storico. Il capitolo non deve già pre-giudicare il monopolio come "cattivo": deve descriverlo come strutturalmente fragile, lasciando il giudizio politico ai capitoli successivi (coerente con ADR pianificato per cap. 3 sul framing "fragile/contestato" piuttosto che stabile).

---

## RESEARCHER BRIEF

**Priorità fonti:** NotebookLM (corpus STRONG per questo capitolo) come fonte primaria; web search solo per confermare/aggiornare cifre recenti (es. ultimo prezzo High-NA, dati 2024-2025).

**Query NotebookLM (in ordine):**
1. "Quali sono le caratteristiche fisiche del campus ASML a Veldhoven — dimensioni, numero di dipendenti, livello di sicurezza?"
2. "Come funziona tecnicamente la litografia EUV — lunghezza d'onda, generazione del plasma di stagno, ruolo degli specchi Zeiss?"
3. "Qual è il prezzo esatto di una macchina EUV ASML e quante componenti la costituiscono?"
4. "Qual è la storia del consorzio EUV LLC e il ruolo di Intel, Samsung, TSMC come investitori iniziali nella tecnologia EUV?"
5. "Perché Carl Zeiss SMT è l'unico fornitore di ottica per le macchine EUV di ASML — esiste un'alternativa?"
6. "Quali tentativi sono stati fatti da Cina, Giappone, o altri paesi per replicare la tecnologia EUV, e con quale risultato?"
7. "Qual è la struttura azionaria di ASML e quale influenza ha lo stato olandese o americano sulle sue decisioni commerciali?"
8. "Quali nodi di processo dei semiconduttori (7nm, 5nm, 3nm) richiedono obbligatoriamente la litografia EUV?"

**Web search terms (solo per verifica/aggiornamento, dopo NotebookLM):**
- "ASML EUV machine price 2024 2025 million euro"
- "ASML High-NA EUV cost specifications"
- "ASML Veldhoven campus employees site size"
- "EUV LLC consortium history Intel Samsung TSMC investment"
- "Carl Zeiss SMT EUV optics monopoly supplier"
- "ASML number of components EUV machine parts count"
- "China SMEE EUV lithography attempt progress 2024"
- "ASML shareholder structure Dutch government export control influence"

**Document types da prioritizzare:**
- Report annuali/finanziari ASML (per cifre di prezzo, fatturato, numero dipendenti)
- Articoli tecnici specializzati (IEEE Spectrum, semiconductor industry press) per la spiegazione EUV
- Le due sintesi italiane preesistenti nel corpus NotebookLM (verificare se contengono dettagli sensoriali/aneddotici già tradotti in italiano, utili per [SHADOW])
- Interviste a dirigenti ASML/Zeiss/Cymer per citazioni dirette

**Fatti specifici da cacciare (con priorità [SHADOW] per dettaglio sensoriale):**
- Cifra esatta del prezzo di una macchina EUV standard e della variante High-NA
- Numero esatto di componenti (la cifra ">100.000 parti" è citata spesso — verificare fonte primaria esatta)
- Lunghezza d'onda EUV (13,5 nm) e DUV (193 nm) — numeri precisi
- Tempo di trasporto/installazione di una macchina EUV (numero di container/camion, settimane di setup)
- Anno di fondazione ASML (1984) e contesto Philips/ASM
- Anno di prima vendita commerciale EUV (~2018-2019) e cliente
- Tolleranza di precisione degli specchi Zeiss (ordine di grandezza in picometri, se disponibile)
- Eventuale citazione diretta di un dirigente ASML o funzionario governativo olandese sul peso geopolitico dell'azienda
- Qualsiasi dato già presente nelle due sintesi italiane del corpus che descriva atmosfera, suoni, temperatura della clean room, o dettagli fisici del sito di Veldhoven

---

## TARGET

**Word count:** 5500–6500 parole (somma beat 800–1200 cad. su 6 beat, in linea con la lunghezza capitolo da PRD per un'inchiesta narrativa stile Chris Miller)

**Opening hook strategy:** Aprire non con la domanda retorica generica ("Cosa succederebbe se...") ma con un dettaglio fisico concreto e spiazzante dell'edificio di Veldhoven — qualcosa che il lettore può visualizzare prima ancora di sapere perché conta.

**Closing beat promise:** Il capitolo chiude stabilendo che ASML non è un fornitore neutrale ma il primo di tre guardiani fragili che il libro esplorerà — passando il testimone, senza anticiparlo, al prossimo nodo della catena: Taiwan.
