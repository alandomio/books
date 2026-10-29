# Book PRD: La Guerra Fredda del Silicio

## 1. Vision
- **Title:** La Guerra Fredda del Silicio
- **Subtitle:** L'Asse Taiwan-Lituania-Olanda e la Catena di Approvvigionamento più Fragile del Pianeta
- **One-line pitch:** Tre piccoli nodi — una cittadina olandese, un'isola contesa, uno stato baltico di tre milioni di abitanti — tengono in equilibrio l'intera economia mondiale, e quell'equilibrio sta già scricchiolando.
- **Enemy (what the book destroys):** Il mito che le catene di fornitura tecnologiche siano apolitiche, neutrali rispetto al potere — pura efficienza di mercato, non scacchiere geopolitico.
- **Promise (what the reader gains):** Capire perché una macchina costruita a Veldhoven, un laser fabbricato a Vilnius e una fab a Hsinchu sono, di fatto, le tre leve più importanti della sicurezza nazionale del XXI secolo — e perché nessuna di queste tre leve è stabile.

## 2. Target Reader
- **Primary:** Lettore generale informato — segue le notizie di geopolitica e tecnologia, ha letto di export controls e chip ban, ma non è ingegnere né economista. Vuole capire le cause, non solo gli eventi.
- **Secondary:** Professionisti di settori adiacenti (finanza, consulenza, policy) che cercano una sintesi narrativa accessibile prima di approfondire report tecnici.
- **Anti-target (who this book is NOT for):** Ingegneri di processo che cercano dettagli tecnici di fabbricazione a livello di brevetto; lettori che vogliono un manuale di investimento o previsioni di borsa.

## 3. Tone & Voice
- **Tone target:** Preciso e sistemico, ma narrativo — spiega le catene causa-effetto senza perdere il lettore, con momenti di immediatezza tecnica quando il dettaglio ingegneristico rivela la posta in gioco politica.
- **Anti-tone:** Sensazionalismo da titolo di giornale; tono accademico/distaccato che tratta la geopolitica come teoria astratta senza conseguenze umane ed economiche concrete.
- **Style references:** Chris Miller ("Chip War"), Tracy Kidder, Steven Levy, Michael Lewis (per i momenti di analisi causale leggibile).

## 4. Structure

| # | Chapter Title | Core Question | Audience Tag |
|---|--------------|---------------|--------------|
| 1 | La Cattedrale di Veldhoven | Come una sola azienda in una cittadina olandese è diventata l'unico guardiano della litografia EUV? | [ALL] |
| 2 | Lo Scudo di Silicio | Perché l'Occidente è costretto a difendere Taiwan per non far collassare l'economia globale — e quanto è davvero solido quello scudo? | [ALL] |
| 3 | L'Infiltrato nel Baltico | Come la Lituania, aprendo un ufficio di rappresentanza taiwanese, ha scatenato la ritorsione economica di Pechino — e ha già iniziato a indietreggiare? | [ALL] |
| 4 | Il Veto di Washington | Come gli Stati Uniti usano sanzioni extraterritoriali per bloccare l'avanzata tecnologica cinese, fino a dettare le licenze di esportazione di un'azienda olandese? | [GENERAL/EXPERT] |
| 5 | L'Assedio Logistico di Pechino | Come la Cina ha trasformato l'embargo in un acceleratore di autosufficienza tecnologica, raggiungendo i 5nm senza EUV? | [EXPERT/GENERAL] |
| 6 | L'Asse Segreto: Vilnius-Taipei | Cosa significa, in pratica, il trasferimento tecnologico Taiwan→Lituania — ingegneri, capitali, laser — e quanto regge sotto pressione politica? | [ALL] |
| 7 | La Frammentazione della Catena: Il Progetto Silicon Saxony | Perché l'Europa, nel tentativo di riconquistare sovranità tecnologica con il Chips Act e la fab TSMC a Dresda, sta scoprendo che decentralizzare l'indecentralizzabile ha un costo enorme? | [EXPERT/GENERAL] |
| 8 | L'Opzione Terra Bruciata | Cosa succederebbe — agli ingegneri, alle fab, all'economia mondiale — in caso di blocco navale o invasione di Taiwan? | [ALL] |
| 9 | L'Era Post-Silicio e il Nuovo Ordine Tecnologico | Quali tecnologie emergenti (quantistico, grafene, ottica) potrebbero rompere questi monopoli — e chi sta vincendo la corsa? | [GENERAL/EXPERT] |

## 5. Success Criteria
- A reader who finishes this book can: spiegare a qualcun altro perché ASML, TSMC e la Lituania sono strategicamente inseparabili, e indicare almeno tre punti di rottura concreti della catena.
- A reader who finishes this book feels: l'urgenza disturbante che la stabilità economica globale dipende da equilibri molto più fragili e contesi di quanto creduto.
- A reviewer would describe it as: un'inchiesta narrativa rigorosa, alla Chris Miller, che usa la precisione ingegneristica per rivelare la posta in gioco geopolitica — senza mai perdere il lettore generale.

## Genesis Notes (grounded in NotebookLM corpus)
- **Notebook:** `https://notebooklm.google.com/notebook/b14fa876-39db-4487-818d-3f8e89d9b786` (~75 fonti, 5 cluster tematici, incluse due sintesi italiane preesistenti sullo stesso tema)
- **Coverage:** STRONG per cap. 1, 3, 4, 5, 6. MEDIA per cap. 2. DEBOLE per cap. 7 (nessuna fonte dedicata a Dresda/Silicon Saxony, solo difficoltà generiche di espansione TSMC in Europa). ASSENTE per cap. 8 e 9 (nessuna fonte su scenari "terra bruciata"/kill-switch o tecnologie post-silicio) — il Ricercatore dovrà affidarsi a web search per questi due capitoli.
- **Angle ↔ Corpus resolution:** la cornice originale di "asse" stabile è stata corretta — il corpus stesso documenta le crepe nell'alleanza Taiwan-Lituania (rinominazione dell'ufficio sotto pressione cinese, sospensione dei colloqui). Il libro tratta l'asse come **fragile e contestato**, non come blocco granitico — framing più aderente alle fonti e narrativamente più forte. `[NotebookLM]`
- **Known unknown:** il rischio maggiore è assumere che l'attuale architettura di alleanze regga fino alla pubblicazione. Se si sfalda ulteriormente, il framing "scacchiere fragile" si rafforza piuttosto che incrinarsi. `[my judgment]`
