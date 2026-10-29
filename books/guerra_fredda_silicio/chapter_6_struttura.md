# STRUTTURA — Capitolo 6: L'Asse Segreto: Vilnius-Taipei

**Core question (da PRD.md):** Cosa significa, in pratica, il trasferimento tecnologico Taiwan→Lituania — ingegneri, capitali, laser — e quanto regge sotto pressione politica?
**Audience del capitolo (da PRD.md):** [ALL]
**Corpus coverage:** STRONG — per il capitolo 6 NotebookLM è fonte primaria; fonti web primarie e documenti societari servono a triangolare e ad aggiornare lo stato dei progetti fino al 3 settembre 2026.
**Architettura narrativa:** reverse audit — partire dall'oggetto industriale che avrebbe dovuto provare l'asse (la fab Teltonika) e risalire, canale per canale, da ciò che esiste sul terreno a ciò che era stato annunciato.

---

## CONTINUITY CHECK

**Debiti narrativi contratti nel capitolo 3:**
- Il nome dell'Ufficio di Rappresentanza Taiwanese nel 2021 ha innescato la **ritorsione economica grigia** cinese; il capitolo 6 non deve riassumere di nuovo l'intera crisi, ma partire dal conto già pagato e verificare il ritorno industriale ottenuto.
- Il capitolo 3 ha stabilito la parziale marcia indietro politica lituana del 2026, senza equiparare una dichiarazione favorevole alla rinominazione dell'ufficio a una rinominazione già avvenuta.
- Il capitolo 3 ha promesso esplicitamente di verificare qui quattro claim: accordo ITRI–Teltonika da 14 milioni di euro; Laboratorio Laser Lituano aperto nel settembre 2023; secondo laboratorio per semiconduttori annunciato per il 2026 con costo indicato di 100 milioni di euro; quota fino all'80% per uno specifico segmento dei laser lituani. Sono tesi da sottoporre ad audit, non fatti da ricopiare.
- Posizione canonica da mantenere: nessuna favola di **Davide contro Golia**; la scelta lituana va valutata con costi, leve e risultati, non premiata o condannata per intenzione.

**Continuità col capitolo 5:**
- Il capitolo 5 ha fissato il metodo: distinguere etichette di marketing, capacità tecnica, yield e produzione in volume; il capitolo 6 applica lo stesso metodo alla parola «trasferimento», separando annuncio, contratto, competenza trasferita, impianto costruito e produzione qualificata.
- Il capitolo 5 chiude sul parco DUV cinese tenuto in vita mentre cambiano le regole. Il capitolo 6 deve quindi aprire con un taglio netto su un vincolo fisico lituano, senza fingere una continuità causale e senza ripetere l'immagine di macchine che continuano a correre.

**Glossary check:**
- `NARRATIVE_GLOSSARY.md` contiene già **Taiwania Capital / National Development Fund**, **Eximbank-INVEGA**, **Ekspla / Light Conversion** e **High-Tech Hill / fabbrica di chip Teltonika**. Non emergono contraddizioni semantiche, ma queste voci non valgono come fonti indipendenti: ogni cifra deve tornare al documento originario.
- Il «70% del mercato scientifico mondiale dei laser a femtosecondi» attribuito a Light Conversion nel glossario e l'«80%» richiamato nel capitolo 3 potrebbero riferirsi a denominatori, prodotti o anni diversi. Il Ricercatore deve riconciliare categoria, anno e fonte; il Writer non può fonderli in una quota unica.
- Il glossario colloca le applicazioni lituane nel back-end (dicing, singolazione, marcatura), non nella sorgente EUV/DUV. Ogni eventuale nesso diverso richiede una fonte industriale diretta; la comunanza della parola «laser» non è una catena di fornitura.

---

## NUFs (Goal Scoring — 10 punti atomici)

utility(reader): Il lettore può valutare qualunque promessa di «trasferimento tecnologico» con quattro verifiche operative — capitale erogato, know-how consegnato, infrastruttura disponibile, produzione qualificata — invece di scambiare un MoU per una fab funzionante. → score += 1

utility(reader): Il lettore può distinguere il fondo d'investimento da 200 milioni di dollari dalla linea di credito da 1 miliardo, spiegando chi ne sopporta il rischio, quale area geografica coprono e perché né l'uno né l'altra equivalgono automaticamente a denaro versato alla Lituania. → score += 1

utility(reader): Il lettore può spiegare la differenza tra licenza/trasferimento di processo ITRI–Teltonika e capacità di fabbricare chip in volume, includendo i passaggi mancanti: impianto, utility, attrezzature, personale, qualifica e yield. → score += 1

utility(reader): Il lettore può collocare correttamente Ekspla, Light Conversion, Litilit e i laboratori lituani nella filiera dei semiconduttori, distinguendo fotonica, lavorazioni di back-end e ricerca sui materiali dalla litografia EUV di ASML/Cymer. → score += 1

utility(emotional): Il lettore sente lo scarto irritante ma non sensazionalistico tra la posta diplomatica pagata nel 2021 e la scala industriale verificabile nel 2026, perché lo scarto è mostrato con oggetti, date e rapporti numerici anziché con aggettivi. → score += 1

utility(emotional): Il lettore prova una speranza cauta davanti a ciò che sopravvive alle oscillazioni politiche — competenze, studenti, laboratori e relazioni tra istituti — senza che questi risultati piccoli vengano gonfiati fino a diventare una «alleanza dei chip». → score += 1

utility(factual): La catena 2021–2026 — ufficio taiwanese → ritorsione cinese → fondo e credito taiwanesi → investimenti nominati → accordo ITRI–Teltonika → sospensione/rinvio della fab → dibattito sulla rinominazione — è datata e citata con almeno due fonti indipendenti per ogni snodo contestabile. → score += 1

utility(factual): Fondo, credito, garanzie, investimenti azionari, sovvenzioni e spesa privata sono riportati in categorie separate, con valuta, data, beneficiario ed esito; nessun totale somma impegni incompatibili o conta due volte la stessa operazione. → score += 1

utility(factual): Lo stato della componente semiconduttori di High-Tech Hill al 3 settembre 2026 è riportato con fonte e data, distinguendo la fab di chip dalle quattro fabbriche elettroniche generiche e separando «sospeso», «rinviato» e «cancellato». → score += 1

utility(factual): Le quote di mercato dei laser, le applicazioni nei semiconduttori, il numero di studenti/ingegneri formati e lo stato dei laboratori congiunti sono citati con fonte originaria e denominatore esplicito, non con formule promozionali riprese di seconda mano. → score += 1

---

## BEAT LIST

### Beat 1 — La fab fermata prima del primo wafer
**Core question:** Se il trasferimento Taiwan→Lituania doveva materializzarsi in una fabbrica di chip, che cosa esiste davvero oggi a High-Tech Hill?
**Audience tag:** [BOTH]
**Word count target:** 800–900 parole
**Funzione:** Hook / Establish / Open loop
**Key facts che il Ricercatore deve trovare:**
- Stato verificabile al 3 settembre 2026 della fab di chip Teltonika a Liepkalnis/High-Tech Hill: sospesa, rinviata, riprogettata o cancellata; data e testo della decisione più recente.
- Cronologia delle milestone originarie: laboratori e data center, assemblaggio/test, fabbricazione da zero; anno promesso per ciascuna e versione aggiornata del calendario.
- Vincoli fisici dichiarati nel novembre 2024: potenza elettrica richiesta e disponibile, data prevista per la connessione, stato della sottostazione, iter per il cambio di destinazione d'uso del terreno.
- Distinzione documentata tra la componente chip e le fabbriche elettroniche generiche aperte successivamente: investimento, superficie, addetti e prodotti di ciascuna.
- Dettaglio [SHADOW] per la scena iniziale: un elemento fisico verificato del sito — sottostazione, lotto, recinzione, edificio, rumore o assenza di macchinari — senza inventare meteo, odori o dialoghi.
- Fonti in conflitto sul verbo «sospeso»/«collassato»: datare ogni fonte e non scegliere il termine più drammatico.

### Beat 2 — Un miliardo e duecento milioni, ma di che cosa?
**Core question:** Quale architettura finanziaria Taiwan annunciò nel gennaio 2022, e quanto di quella cifra poteva davvero arrivare a un'impresa lituana?
**Audience tag:** [GENERAL]
**Word count target:** 900–1000 parole
**Funzione:** Rewind / Establish / Complicate
**Key facts che il Ricercatore deve trovare:**
- Date, formato e protagonisti dei due annunci: fondo da 200 milioni di dollari e linea di credito da 1 miliardo; verificare se furono eventi virtuali, conferenze stampa o firme fisiche.
- Ente proprietario e gestore del fondo (National Development Fund, Taiwania Capital o altra struttura), mandato, durata, criteri d'investimento e area geografica: sola Lituania oppure Europa centro-orientale.
- Architettura della linea di credito: ente deliberante, banche erogatrici, beneficiari ammessi, tasso/durata se pubblici; distinguere plafond disponibile, prestito approvato, garanzia ed esborso.
- Accordo Eximbank–INVEGA/ente successore: data, garanzia fino al 70%, flusso del denaro e volume di prestiti effettivamente attivato.
- Tutti i beneficiari nominati (inclusi Litilit, Oxipit, Teltonika, SoliTek, TransferGo se confermati) con importo, strumento, data e stato dell'operazione.
- Riconciliazione tra eventuali totali aggregati divergenti: esplicitare metodologia e perimetro; vietato sommare equity, credito, garanzie e piano privato Teltonika come se fossero un unico investimento taiwanese.
- Dettaglio [SHADOW]: schermata, stanza o formula materiale dell'annuncio, oppure un documento/assegno/contratto fisicamente descritto da una fonte.

### Beat 3 — Quattordici milioni non fanno una foundry
**Core question:** Che cosa ha trasferito davvero ITRI a Teltonika, e quali passaggi separano quel contratto da una linea produttiva qualificata?
**Audience tag:** [BOTH]
**Word count target:** 900–1000 parole
**Funzione:** Establish tecnico / Complicate
**Key facts che il Ricercatore deve trovare:**
- Contratto ITRI–Teltonika: data, valore totale, quota taiwanese e lituana, durata, tecnologia/processo coperto, deliverable, proprietà intellettuale e condizioni d'uso.
- Origine e riconciliazione delle cifre 6,5 milioni e 14 milioni di euro già apparse nella documentazione del progetto; verificare se indicano fase iniziale, valore rivisto o voci diverse.
- Numero, ruolo e luogo di lavoro degli specialisti ITRI e Teltonika coinvolti; formazione erogata, macchinari o documentazione trasferiti, milestone accettate.
- Nodo/processo o classe di chip prevista, diametro wafer, capacità nominale, mercati finali e requisiti di qualifica; se non pubblici, marcarli `[BLOCKED]` anziché colmarli per inferenza.
- Piano High-Tech Hill da 3,7 miliardi di euro e 14 progetti: fonte primaria, quota già spesa, autorizzata e costruita; separare capitale privato lituano da sostegno taiwanese.
- Catena tecnica da esplicitare: know-how/licenza → progetto di processo → fab + utility → installazione tool → qualifica → yield → volume; identificare il punto effettivamente raggiunto.
- Dettaglio [SHADOW]: un manuale, tool, wafer dimostrativo, aula tecnica o protocollo di accettazione menzionato da una fonte; nessun «trasferimento» lasciato astratto.

### Beat 4 — Il laser giusto, nella fase giusta
**Core question:** Dove entrano davvero i laser lituani nella manifattura dei semiconduttori, e dove la somiglianza lessicale con l'EUV diventa propaganda?
**Audience tag:** [EXPERT]
**Word count target:** 1000–1100 parole
**Funzione:** Establish tecnico / Corrective reveal
**Key facts che il Ricercatore deve trovare:**
- Prodotti, lunghezze d'onda, durata degli impulsi e applicazioni documentate di Ekspla, Light Conversion e Litilit; distinguere ricerca, micromachining, dicing/singolazione, marcatura, packaging e patterning sperimentale.
- Differenza fisica e di fase produttiva rispetto alla sorgente CO2/Cymer che genera luce EUV a 13,5 nm: front-end contro back-end, con conseguenza industriale comprensibile al lettore generale.
- Quote del 70% e fino all'80%: azienda o settore, prodotto esatto, mercato scientifico o industriale, area geografica, anno e fonte originaria; nessun «leader mondiale» senza denominatore.
- Laboratorio Laser Lituano annunciato/aperto nel settembre 2023: sede, 14 aziende partecipanti, struttura del cofinanziamento taiwanese, attrezzature, personale, commesse o output misurabili.
- Secondo stadio/laboratorio per semiconduttori da 100 milioni di euro promesso entro il 2026: promotore, finanziamento, autorizzazioni, stato al cutoff e differenza dal progetto Teltonika.
- Partnership FTMC–NSYSU/Taiwan-Lithuania Center for Semiconductors and Materials Science: data, programmi, paper, brevetti, studenti e attrezzature condivise.
- Dettaglio [SHADOW]: suono, scala, temperatura, peso, frequenza o durata d'impulso di un apparato reale, usato per chiarire la funzione e non come decorazione.

### Beat 5 — Il trasferimento contato in persone
**Core question:** Quante competenze tacite sono passate davvero da Taiwan alla Lituania, e possono sopravvivere più a lungo di un sussidio?
**Audience tag:** [GENERAL]
**Word count target:** 800–900 parole
**Funzione:** Humanize / Resolve parziale
**Key facts che il Ricercatore deve trovare:**
- Programmi di borsa e formazione per Lituania, Repubblica Ceca, Polonia e Slovacchia: enti finanziatori, cinque università taiwanesi coinvolte, requisiti, durata e numero di partecipanti per paese.
- Verifica dell'iniziativa dei 29 studenti lituani, dieci dei quali da Vilnius University: anno, durata, curriculum, visita a TSMC e stato successivo dei partecipanti.
- Numero di ingegneri, docenti e ricercatori in mobilità nelle due direzioni; distinguere visita di delegazione, corso breve, semestre, laurea e impiego industriale.
- Accordi NSYSU/FTMC/Vilnius University/Kaunas University of Technology: attività ancora operative nel 2026, risultati misurabili e fonti istituzionali.
- Testimonianza diretta di almeno una persona coinvolta, preferibilmente con una scelta o un costo concreto: trasferimento, lingua, cleanroom, ritorno in Lituania, progetto abbandonato o continuato.
- Scala di confronto proporzionata: 29 studenti non sono una workforce da fab, ma possono essere un canale di conoscenza durevole; quantificare entrambi i lati senza sarcasmo contro le persone.
- Dettaglio [SHADOW]: procedura di vestizione, badge, aula, wafer didattico o altro elemento verificato dell'esperienza formativa.

### Beat 6 — Il test di pressione del 2026
**Core question:** Quando Vilnius riapre il calcolo politico con Pechino, quali legami con Taipei si spezzano e quali continuano a funzionare?
**Audience tag:** [BOTH]
**Word count target:** 850–950 parole
**Funzione:** Pressure test / Pivot
**Key facts che il Ricercatore deve trovare:**
- Cronologia aggiornata delle posizioni di Inga Ruginienė, Gitanas Nausėda, Kęstutis Budrys, eventuale nuovo premier e MOFA taiwanese sul nome dell'ufficio e sulla normalizzazione con la Cina.
- Stato giuridico e fisico dell'ufficio al cutoff: nome ufficiale, personale, attività; distinguere proposta, dichiarazione, negoziato e atto compiuto.
- Stato delle relazioni diplomatiche Cina–Lituania: ambasciatori/diplomatici accreditati, canali ripristinati, restrizioni commerciali residue e dati bilaterali 2021–2026.
- Effetto documentato, non presunto, del raffreddamento politico su fondo, credito, investimenti, Teltonika, laboratori e borse: continuati, congelati, ritirati o non dichiarati.
- Dichiarazioni taiwanesi e cinesi trattate come posizioni interessate, non come descrizioni neutrali del risultato.
- Contesto proporzionato della marcia indietro: costo aggregato nazionale limitato ma danno settoriale e sulle catene europee reale, coerente con il capitolo 3.
- Dettaglio [SHADOW]: una traccia fisica dello stato diplomatico — targa, ufficio operativo, scrivanie vacanti o assenza di accreditamento — solo se documentata.

### Beat 7 — Il bilancio dell'asse
**Core question:** Dopo aver contato euro, impianti, processi e persone, l'asse Vilnius–Taipei è infrastruttura, assicurazione politica o diplomazia in vetrina?
**Audience tag:** [BOTH]
**Word count target:** 800–900 parole
**Funzione:** Resolve / Land / Ponte al capitolo 7
**Key facts che il Ricercatore deve trovare:**
- Tabella di audit finale per ciascun canale: annunciato, impegnato, erogato, operativo, output prodotto, stato al 3 settembre 2026.
- Totale ricostruibile degli investimenti diretti, separato da credito, garanzie e piani privati; se le fonti divergono, mantenere i perimetri distinti invece di fabbricare una cifra di compromesso.
- Almeno una valutazione terza favorevole e una critica sull'esito della cooperazione, entrambe nella loro forma più forte.
- Benchmark di scala unico e omogeneo — costo di un impianto comparabile, investimento TSMC in altro paese o fabbisogno di personale — soltanto se valuta, anno e categoria sono comparabili.
- Verdetto a matrice: capitale (debole/modesto/forte), capacità produttiva, competenze, resilienza politica; vietato comprimere quattro risultati diversi in «successo» o «fallimento».
- Ponte documentato a Dresda/Silicon Saxony: stessa domanda di conversione promessa→capacità, scala molto maggiore e vincoli di ecosistema che il capitolo 7 dovrà misurare.
- Dettaglio [SHADOW] conclusivo: un singolo output sopravvissuto — persona formata, laboratorio operativo, componente prodotto — contrapposto a una milestone mancata; non riprendere il parco macchine in movimento della chiusa del capitolo 5.

---

## REVIEWER READINESS NOTES

### Tension points
1. **Costo diplomatico pieno vs ritorno industriale parziale:** Vilnius ha subito una ritorsione reale e rapida; il sostegno taiwanese deve essere misurato per esecuzione e tempi, non per solidarietà dichiarata.
2. **Fab sospesa vs capacità che sopravvive:** l'assenza di produzione in volume può coesistere con trasferimenti limitati ma reali di know-how, laboratori e formazione. Il capitolo perde se sceglie una sola metà.
3. **Somiglianza lessicale vs posizione nella filiera:** «laser» e «semiconduttori» rendono seducente una connessione ASML–Lituania che le applicazioni industriali potrebbero non sostenere.
4. **Politica reversibile vs capitale paziente:** il nome di un ufficio può cambiare con un governo; una competenza appresa, un laboratorio installato o un investimento azionario non si disfa alla stessa velocità.
5. **Trasparenza vs numero spettacolare:** il dato narrativamente più grande è 1,2 miliardi di dollari; il dato editorialmente più importante potrebbe essere ciò che nessun ente pubblica sul suo utilizzo.

### Key chains da rendere esplicite
- Ufficio «Taiwanese» nel 2021 → ritorsione economica grigia → necessità taiwanese di rendere credibile la solidarietà → fondo/credito annunciati nel 2022 → conversione parziale in investimenti e accordi → verifica del rendimento politico-industriale nel 2026.
- Fondo/credito/garanzia confusi nel discorso pubblico → cifra nominale gonfiata → confronto errato con capitale erogato → il lettore impara a chiedere strumento, rischio, beneficiario ed esito prima di accettare un totale.
- Contratto ITRI → know-how disponibile → fab e utility non pronte → nessuna produzione qualificata → il lettore capisce che trasferire una ricetta di processo non trasferisce l'ecosistema che la rende producibile.
- Industria fotonica lituana preesistente al 2021 → rietichettatura come «asse dei chip» → verifica delle applicazioni reali → valore autentico nel back-end/materiali senza falso collegamento alla sorgente EUV.
- Studenti e ricercatori formati → conoscenza tacita distribuita → minore visibilità mediatica ma maggiore inerzia istituzionale → il lettore distingue il canale più piccolo da quello potenzialmente più durevole.
- Marcia indietro politica 2026 → test su contratti, laboratori e persone → ciò che continua senza una nuova dichiarazione diplomatica definisce la robustezza reale dell'asse.
- Bilancio Vilnius → stessa griglia applicata a Dresda nel capitolo 7 → il lettore arriva preparato a misurare la «sovranità europea» in capacità consegnata, non in sussidi annunciati.

### Risk proportionality guards
- **1,2 miliardi:** dichiarare sempre che 200 milioni sono un fondo per l'Europa centro-orientale e 1 miliardo è capacità di credito; non presentarli come bonifico alla Lituania.
- **Disbursement:** non sommare equity, sovvenzioni, prestiti, garanzie, piani industriali privati e capitale annunciato; mantenere valuta, anno e perimetro di ogni voce.
- **Rapporto promesso/eseguito:** calcolarlo solo tra grandezze omogenee. Se il denominatore include un plafond regionale e il numeratore soli investimenti lituani, descrivere il rapporto come non confrontabile, non come percentuale di «fallimento».
- **Teltonika:** la sospensione attribuita a elettricità e destinazione d'uso non prova né un sabotaggio cinese né il ritiro taiwanese; verificare ogni eventuale causa politica separatamente.
- **Quattro nuove fabbriche:** non usarle come prova che la fab di chip sia ripartita; non ignorarle quando si valuta l'intero High-Tech Hill.
- **Laser:** assenza di nesso con EUV non significa irrilevanza industriale; back-end, packaging, lavorazione del vetro e ricerca sui materiali devono ricevere il loro peso reale.
- **Quote di mercato:** 70% e 80% richiedono denominatore, prodotto e anno; nessuna quota può diventare «la Lituania controlla l'80% dei laser mondiali».
- **Formazione:** poche decine di studenti non costituiscono una forza lavoro da fab; non sono nemmeno «solo simbolici» se esistono programmi, carriere e output verificabili.
- **Marcia indietro:** una proposta di rinominare l'ufficio non è un cambio di nome; una normalizzazione dichiarata non è una relazione diplomatica ripristinata.
- **Costo della ritorsione:** bilanciare il danno settoriale e sulle supply chain con l'impatto macroeconomico lituano già documentato come limitato nel capitolo 3.
- **Cutoff:** ogni stato di progetto o incarico politico va datato «al 3 settembre 2026»; nessun presente eterno.

### Obiezioni da presentare nella loro forma più forte
1. **«L'asse è fallito: la fab non esiste.»** Risposta richiesta: verificare laboratori, investimenti, programmi e competenze sopravvissuti, senza usarli per mascherare la milestone produttiva mancata.
2. **«L'asse funziona: Taiwan ha mobilitato 1,2 miliardi.»** Risposta richiesta: distinguere disponibilità nominale, perimetro regionale e utilizzo lituano documentato.
3. **«I laser rendono la Lituania indispensabile ai chip.»** Risposta richiesta: mappare con precisione fase, applicazione, sostituibilità e quota di mercato.
4. **«Il ripensamento politico del 2026 cancella tutto.»** Risposta richiesta: separare reversibilità della targa, durata dei contratti, immobilità degli impianti e portabilità delle competenze.

### Guardrail per i sei punteggi del Reviewer
- **Narrativa & Struttura:** ogni beat deve chiudere con una domanda più stretta del precedente; il verdetto resta sospeso fino al Beat 7.
- **Lingua, Stile & Voce:** sarcasmo rivolto a slogan e meccanismi, mai a studenti, lavoratori o tecnici; evitare il tic «Non X. È Y.» e le formule «va detto/va notato» già frequenti nel capitolo 5.
- **Accuratezza Fattuale:** una fonte primaria più una fonte indipendente per date, importi e stato dei progetti; conflitti mantenuti visibili.
- **Allineamento al Pubblico:** ogni termine finanziario o tecnico deve produrre una conseguenza concreta nello stesso paragrafo.
- **Coinvolgimento Sensoriale & Emotivo:** almeno un dettaglio [SHADOW] verificato per beat; scene legate a decisioni e costi, non decorazione industriale.
- **Originalità & Angolo:** giudicare l'asse come efficienza di conversione tra promessa politica e capacità industriale, non come alleanza binaria riuscita/fallita.

---

## RESEARCHER BRIEF

**Protocollo:** interrogare prima NotebookLM per ciascun cluster (copertura STRONG), poi risalire alle fonti primarie nominate dal corpus; usare web/document scraper per aggiornamenti 2025–2026 e triangolare ogni claim contestabile su almeno due fonti indipendenti. Se un dato resta non verificabile, usare `[BLOCKED: needs human input — …]`.

### Query NotebookLM esatte
1. `Taiwan Lithuania 200 million investment fund 1 billion credit line January 2022 entities terms beneficiaries`
2. `Taiwania Capital Lithuania investments Litilit Oxipit Teltonika SoliTek TransferGo amounts dates`
3. `Eximbank Taiwan INVEGA Lithuania 70 percent guarantee loans actual utilization`
4. `ITRI Teltonika semiconductor technology transfer 6.5 million 14 million deliverables engineers process`
5. `Teltonika High-Tech Hill chip factory 3.7 billion 14 projects electricity land suspension 2032`
6. `Lithuanian Laser Laboratory September 2023 Taiwan 14 companies 100 million semiconductor laboratory`
7. `Ekspla Light Conversion Litilit femtosecond laser market share semiconductor dicing back-end EUV`
8. `FTMC NSYSU Taiwan Lithuania Center for Semiconductors and Materials Science results`
9. `29 Lithuanian students Taiwan semiconductor training TSMC Vilnius University year`
10. `Lithuania Taiwan office renaming 2026 investments cooperation frozen withdrawn continued`

### Query web esatte
1. `site:ndf.gov.tw Lithuania 200 million investment fund Taiwania Capital annual report`
2. `site:taiwaniacapital.com Lithuania portfolio Litilit Oxipit investment`
3. `site:ndc.gov.tw Lithuania 1 billion credit line January 2022 terms`
4. `site:eximbank.com.tw Lithuania INVEGA 70% guarantee September 2022`
5. `site:ilte.lt Taiwan Eximbank INVEGA loans Lithuania utilization`
6. `Taiwan Lithuania investment fund disbursement 2025 2026 audit parliamentary question`
7. `Teltonika ITRI semiconductor technology transfer agreement €14 million deliverables`
8. `site:itri.org.tw Teltonika Lithuania semiconductor technology transfer`
9. `site:teltonika-iot-group.com High-Tech Hill semiconductor factory 2031 2032`
10. `Teltonika chip factory suspended November 2024 electricity land zoning Lithuania`
11. `site:enmin.lrv.lt Teltonika High-Tech Hill electricity substation 2026`
12. `High-Tech Hill four factories opened September 2025 €320 million products`
13. `"Lithuanian Laser Laboratory" September 2023 Taiwan 14 companies`
14. `Lithuania semiconductor laboratory €100 million 2026 Taiwan laser laboratory second stage`
15. `site:ekspla.com FemtoLux semiconductor dicing singulation glass`
16. `site:lightcon.com femtosecond laser market share 70% semiconductor applications`
17. `Litilit Taiwania Capital €3.5 million November 2022 ultrafast laser`
18. `site:ftmc.lt Taiwan Lithuania Center for Semiconductors and Materials Science NSYSU`
19. `"29 Lithuanian students" semiconductor Taiwan TSMC Vilnius University`
20. `Taiwan semiconductor scholarship Lithuania NTU NCKU NTHU NYCU NSYSU`
21. `Lithuania Taiwanese Representative Office rename 2026 Ruginiene Nauseda latest`
22. `Taiwan Lithuania semiconductor laser cooperation frozen withdrawn 2026`
23. `Lithuania China diplomatic relations accredited diplomats May 2025 2026`
24. `Lithuania China Taiwan trade statistics 2021 2022 2023 2024 2025`
25. `Taiwan Lithuania technology cooperation assessment success failure think tank 2026`

### Tipi di documento da prioritizzare
1. Delibere, bilanci annuali, portfolio e audit di National Development Fund, Taiwania Capital, National Development Council, Eximbank Taiwan, INVEGA/ILTE.
2. Comunicati e trascrizioni di MOFA/MOEA/NSTC taiwanesi e ministeri lituani; atti parlamentari e risposte a interrogazioni sui fondi.
3. Contratto, comunicati e report tecnici ITRI–Teltonika; permessi urbanistici, richieste di connessione, cronoprogrammi di High-Tech Hill e gestore di rete.
4. Report societari e schede applicative di Ekspla, Light Conversion e Litilit; brevetti e paper peer-reviewed per le applicazioni nella filiera dei semiconduttori.
5. Atti, report, pubblicazioni e pagine programma di FTMC, NSYSU, Vilnius University, KTU e delle università taiwanesi coinvolte.
6. Registri d'investimento e statistiche ufficiali di commercio lituane/taiwanesi, Eurostat e UN Comtrade, con metodologia e valuta dichiarate.
7. Reuters, Bloomberg, Financial Times, Nikkei Asia, LRT e CNA per cronologia e triangolazione; think tank solo per giudizi sintetici, non come fonte unica di importi.
8. Foto datate, video istituzionali, visite in sito e testimonianze dirette per i dettagli [SHADOW].

### Fatti, date, nomi e numeri da cacciare
- 5/6 gennaio e 11 gennaio 2022: data esatta, formato e portavoce dei due annunci; Eric Huang, Kung Ming-hsin e ogni altro funzionario coinvolto.
- 200 milioni USD: proprietario, gestore, area coperta, capitale impegnato e capitale versato; lista completa del portfolio lituano.
- 1 miliardo USD: natura giuridica, banche, durata, tasso, utilizzo approvato ed effettivamente erogato.
- Settembre 2022: accordo Eximbank–INVEGA, copertura del 70%, eventuale volume attivato e attuale ente successore.
- Investimenti/finanziamenti nominati da verificare separatamente: Litilit 3,5 milioni EUR; Oxipit 3,5 milioni EUR; Teltonika 10 milioni EUR; SoliTek 8 milioni EUR; TransferGo 10 milioni USD.
- Eventuale conflitto tra 16,8 milioni EUR di investimenti diretti cumulativi e somma di singole operazioni nell'ordine di 30–35 milioni EUR: ricostruire perimetro, strumenti inclusi e finestra temporale.
- ITRI–Teltonika: 6,5 vs 14 milioni EUR; quota MOFA/Taiwan, quota Teltonika, durata di due anni e mezzo, deliverable e IP.
- High-Tech Hill: 55 ettari, 3,7 miliardi EUR, 14 progetti, 5.000–6.000 posti promessi, tappe 2026/2028/2031, sospensione novembre 2024, nuova data 2032; verificare ogni cifra e aggiornamento.
- Quattro fabbriche elettroniche aperte nel settembre 2025: 320 milioni EUR, prodotti, addetti e rapporto — o assenza di rapporto — con la fab chip.
- Connessione elettrica/sottostazione Kuprioniškės: potenza, avanzamento lavori e data effettiva o prevista di energizzazione.
- Laboratorio Laser Lituano: settembre 2023, 14 aziende, cofinanziamento, attrezzature e output; laboratorio semiconduttori da 100 milioni EUR atteso entro 2026, stato attuale.
- Ekspla (1983), Light Conversion (1994), Litilit: quote 70%/80%, export 90–95%, mercati e applicazioni; trovare denominatori e anni originari.
- FTMC–NSYSU: data di istituzione del centro, Robert Bing-Yu Chen o altri responsabili, paper/brevetti/studenti prodotti.
- 29 studenti lituani e 10 da Vilnius University: anno, programma, durata, visita TSMC, esiti successivi.
- 2025–3 settembre 2026: nome e stato dell'ufficio, successione del premier, posizioni Nausėda/Budrys/MOFA Taiwan, presenza di diplomatici cinesi, eventuali fondi o progetti ritirati.

### Conflitti attesi da preservare nel dossier
- `sospeso/rinviato` vs `collassato/cancellato` per la fab Teltonika;
- 6,5 vs 14 milioni EUR per l'accordo ITRI;
- 16,8 milioni EUR vs somma 30–35 milioni EUR per il capitale taiwanese, probabilmente dovuta a strumenti e perimetri diversi;
- 70% vs 80% per i laser, con denominatori potenzialmente diversi;
- «normalizzazione» politica vs assenza di ripristino diplomatico effettivo;
- laboratorio semiconduttori da 100 milioni EUR promesso entro il 2026 vs stato operativo verificabile.

---

## TARGET

**Word count:** 6.100–6.600 parole — il PRD non assegna un numero autonomo al capitolo 6; questo intervallo mantiene la baseline dei capitoli 3 e 5 e coincide con la somma dei sette beat.

**Opening hook strategy:** Aprire sul sito di High-Tech Hill con il primo ostacolo fisico verificato che ha fermato la fab prima del wafer — corrente, sottostazione o terreno — e soltanto dopo rivelare i miliardi annunciati nel 2022.

**Closing beat promise:** Chiudere su una singola capacità sopravvissuta e una milestone industriale mancata, così che Dresda erediti una domanda misurabile — quanti euro di sovranità diventano davvero wafer qualificati — non un ammonimento generico.
