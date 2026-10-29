# STRUTTURA — Capitolo 7: La Frammentazione della Catena: Il Progetto Silicon Saxony

**Core question (da PRD.md):** Perché l'Europa, nel tentativo di riconquistare sovranità tecnologica con il Chips Act e la fab TSMC a Dresda, sta scoprendo che decentralizzare l'indecentralizzabile ha un costo enorme?
**Audience del capitolo (da PRD.md):** [EXPERT/GENERAL]
**Cutoff fattuale:** 3 settembre 2026; ogni stato di cantiere, autorizzazione, erogazione, incarico o calendario deve portare una data.
**Corpus coverage:** DEBOLE — NotebookLM può fornire soltanto il quadro generale sulle difficoltà di espansione TSMC. Tutti i beat dipendono in prevalenza da **[WEB-PRIMARY]**, con priorità a atti UE/tedeschi/sassoni, documenti societari, permessi, report tecnici e fonti indipendenti; il corpus va interrogato una volta per recuperare continuità e possibili piste, non trattato come fonte sufficiente su Dresda.
**Architettura narrativa:** audit di una polizza industriale — partire dal cronometro aperto durante il cantiere ESMC, scomporre il prezzo pagato e la capacità acquistata, quindi sottoporre quella capacità a un test di copertura: quali guasti della filiera assorbe Dresda, quali dipendenze sposta e quali lascia intatte.
**Tesi da dimostrare, non da presupporre:** la fab di Dresda può aumentare davvero la resilienza europea senza rendere l'Europa autonoma; il suo valore sta nella riduzione di uno specifico rischio geografico, mentre proprietà, processi, tool, materiali, competenze e tempi di qualifica restano transnazionali.

---

## CONTINUITY CHECK

**Vincoli canonici ereditati:**
- Il capitolo 2 ha già definito il reshoring occidentale come una costosa polizza assicurativa incapace di replicare nel breve periodo l'ecosistema di Hsinchu. Il capitolo 7 deve quantificare premio, copertura e franchigia senza trasformare quella posizione in un verdetto precotto contro ESMC.
- Il capitolo 4 ha stabilito che la sovranità formale europea resta limitata dalla dipendenza da tecnologie e regole statunitensi. La presenza fisica di una fab in Sassonia non autorizza a dichiarare risolta la dipendenza da EDA, tool o export control: ogni residuo va mappato per componente e giurisdizione.
- Il capitolo 5 ha fissato la distinzione tra etichetta del nodo, capacità tecnica, yield e produzione in volume. Per Dresda, «capacità nominale» deve significare wafer start dichiarati; non equivale a wafer avviati, die funzionanti, prodotto qualificato o consegna al cliente.
- Il capitolo 6 chiude chiedendo quanti euro annunciati diventino wafer qualificati e chi abbia firmato per le utility. Il capitolo 7 raccoglie quella domanda, ma non deve ripetere l'apertura sul lotto vuoto o sulla sottostazione incompleta di Liepkalnis: qui il contrasto iniziale è tra cantiere reale, calendario dichiarato e produzione ancora da qualificare.
- `chapter_index.md` contiene voci canoniche soltanto fino al capitolo 4; per i capitoli 5–6 la continuità è stata verificata direttamente su `chapter_6.md` e `NARRATIVE_GLOSSARY.md`. Non emergono conflitti che blocchino la struttura.

**Glossary check:**
- Conservare le definizioni canoniche di **fab**, **wafer**, **yield**, **TSMC**, **pure-play foundry**, **EUV/DUV**, **JASM**, **de-risking** e **FDPR**; nessuna voce del glossario autorizza a chiamare ESMC una replica dei siti taiwanesi di frontiera.
- Concetti nuovi da definire in prosa e poi aggiungere al glossario in Stage 2: **ESMC**, **Silicon Saxony**, **European Chips Act**, **state aid**, **wafer starts per month**, **ramp produttivo**, **qualifica automotive**.
- «Nodo maturo» non significa tecnologia obsoleta: il Writer dovrà tradurlo come classe di processo adeguata a funzioni specifiche e verificare quali prodotti finali ESMC possa effettivamente coprire.

---

## NUFs (Goal Scoring — 10 punti atomici)

utility(reader): Il lettore può distinguere **resilienza**, **sovranità** e **autarchia** applicandole a Dresda: una fab europea può ridurre un rischio geografico senza rendere europea la proprietà, la tecnologia o l'intera filiera. → score += 1

utility(reader): Il lettore può sottoporre un progetto sovvenzionato a un audit in cinque passaggi — aiuto autorizzato, denaro impegnato, denaro erogato, capacità installata, produzione qualificata — senza scambiare il massimo approvato per capacità già consegnata. → score += 1

utility(reader): Il lettore può spiegare perché Dresda è stata scelta usando i vincoli di un cluster industriale — fab esistenti, fornitori, università, rete, acqua, personale e tempi di intervento — e cogliere il paradosso per cui decentralizzare da Taiwan richiede concentrare ancora di più in Sassonia. → score += 1

utility(reader): Il lettore può collocare i processi e la capacità nominale di ESMC nei mercati finali corretti, distinguendo chip automotive/industriali da processori di frontiera e wafer start da chip funzionanti e qualificati. → score += 1

utility(reader): Il lettore può tracciare almeno cinque dipendenze che restano esterne o concentrate dopo l'apertura della fab — integrazione di processo, tool, software EDA, materiali/ricambi e competenze — indicando per ciascuna il possibile punto di rottura. → score += 1

utility(reader): Il lettore può formulare il controfattuale corretto: dire quale interruzione a Taiwan ESMC attenuerebbe, per quali clienti e dopo quale ramp, e quale interruzione continuerebbe invece a raggiungere l'Europa attraverso la filiera. → score += 1

utility(emotional): Il lettore sente la tensione tra il tempo politico del taglio del nastro e il tempo industriale della qualifica, perché vede un calendario fatto di cantiere, installazione, training, wafer di prova e yield anziché una generica accusa di lentezza. → score += 1

utility(emotional): Il lettore prova un'inquietudine sobria davanti alla scala del denaro pubblico e del lavoro umano necessario per comprare ridondanza, senza che contribuenti, tecnici o comunità locali vengano ridotti a comparse di una polemica sui sussidi. → score += 1

utility(factual): Proprietà ESMC, investimento previsto, aiuto pubblico massimo/autorizzato/erogato, tecnologie di processo, capacità nominale, occupazione, milestone e stato del cantiere al cutoff sono citati da fonti primarie e triangolati, con promesse e risultati mantenuti in colonne separate. → score += 1

utility(factual): I «43 miliardi» dello European Chips Act e l'obiettivo europeo per il 2030 sono ricostruiti per base giuridica, metrica, quota pubblica/privata, baseline e rischio di doppio conteggio; nessun numero politico viene presentato come un unico fondo spendibile. → score += 1

---

## BEAT LIST

### Beat 1 — Il cronometro sotto il cantiere
**Core question:** Tra la cerimonia di avvio e il primo wafer qualificato, a che punto si trova davvero la fab ESMC di Dresda?
**Audience tag:** [BOTH]
**Word count target:** 850–900 parole
**Funzione:** Hook / Establish / Open loop
**Research dependence:** [WEB-PRIMARY]
**Key facts che il Ricercatore deve trovare:**
- Data, luogo, protagonisti e formula giuridica dell'avvio del progetto e della cerimonia di groundbreaking; separare annuncio, inizio lavori preparatori, costruzione, installazione tool e avvio produzione.
- Stato fisico verificabile al 3 settembre 2026: struttura, cleanroom, utility, tool move-in, assunzioni, training e permessi completati o pendenti; cercare foto/video datati e cronoprogrammi aggiornati.
- Calendario originario e revisioni per costruzione, wafer di prova, ramp e produzione in volume; attribuire ogni data a chi l'ha dichiarata e segnalare slittamenti senza chiamarli fallimento prima della scadenza.
- Definizione operativa di «primo wafer», «start of production» e «volume production» usata dalle fonti: non trattarle come milestone equivalenti.
- Dettaglio [SHADOW] iniziale verificabile — suono di una trivella, dimensione di una fondazione, indumento di cantiere, componente della futura cleanroom o conto alla rovescia su un documento — che renda fisico il divario tra pala e yield.
- Una fonte primaria ESMC/TSMC e una verifica indipendente locale o industriale per ogni affermazione sullo stato dei lavori.

### Beat 2 — Quarantatré miliardi, ma non in un solo conto
**Core question:** Quanto denaro pubblico sta comprando l'Europa, chi lo eroga e che cosa viene pagato davvero nel progetto di Dresda?
**Audience tag:** [GENERAL]
**Word count target:** 850–900 parole
**Funzione:** Rewind / Establish / Complicate
**Research dependence:** [WEB-PRIMARY; NOTEBOOKLM-PARTIAL per il quadro generale]
**Key facts che il Ricercatore deve trovare:**
- Testo e meccanismi del Regolamento (UE) 2023/1781: Chips for Europe Initiative, impianti first-of-a-kind, coordinamento/crisis response e condizioni collegate agli aiuti.
- Composizione verificabile della cifra politica da 43 miliardi di euro: fondi UE nuovi o riallocati, aiuti nazionali attesi, capitale privato «mobilitato», periodo temporale e possibili doppi conteggi.
- Obiettivo europeo al 2030: quota di che cosa — valore, ricavi, capacità, produzione o altro — baseline usata, fonte metodologica e aggiornamento più recente.
- ESMC: costo totale annunciato, equity/debito, aiuto di Stato tedesco massimo approvato dalla Commissione, spesa sassone per infrastrutture e qualsiasi altro incentivo; distinguere autorizzato, impegnato, contrattualizzato, pagato e condizionato a milestone.
- Proprietà e governance della joint venture, diritti di voto, responsabilità operative e impegni dei partner; non equiparare ubicazione europea e controllo europeo.
- Condizioni, clawback, obblighi di accesso prioritario in crisi, monitoraggio e durata dell'aiuto se pubblici.
- Dettaglio [SHADOW]: una pagina della decisione, una cifra su un cartello di cantiere o un documento di bilancio da usare contro la formula astratta «sovranità».

### Beat 3 — Per decentralizzare bisogna concentrarsi a Dresda
**Core question:** Perché una strategia europea di diversificazione finisce per addensare fab, fornitori e talenti nello stesso distretto sassone?
**Audience tag:** [BOTH]
**Word count target:** 900–950 parole
**Funzione:** Establish sistemico / Reveal
**Research dependence:** [WEB-PRIMARY]
**Key facts che il Ricercatore deve trovare:**
- Mappa industriale di Silicon Saxony prima di ESMC: GlobalFoundries, Infineon, Bosch e un solo campione chirurgico della rete fornitori; capacità, specializzazioni e anni di presenza con denominatori coerenti.
- Dati verificabili sul cluster: addetti diretti, imprese aderenti vs imprese realmente operative nei semiconduttori, università/istituti, quota della produzione europea; evitare i totali promozionali senza metodologia.
- Criteri dichiarati da TSMC/ESMC per scegliere Dresda anziché altre località: clienti automotive, competenze, infrastrutture, fornitori, aiuti, stabilità e tempi autorizzativi.
- Utility del sito: potenza elettrica richiesta e contratto di connessione, acqua industriale/ultrapura, trattamento reflui, gas, trasporti e controllo delle vibrazioni; indicare capacità disponibile, lavori aggiuntivi e chi li finanzia.
- Tempi di risposta e prossimità richiesti ai fornitori di tool, ricambi, chimica e gas; distinguere un ufficio commerciale da una capacità locale di manutenzione/produzione.
- Effetto di concentrazione regionale: quali rischi si riducono spostando capacità da Taiwan e quali nuovi rischi comuni nascono a Dresda — rete, bacino del lavoro, acqua, incendio, sabotaggio o shock regionale — solo se documentabili.
- Dettaglio [SHADOW]: un percorso fisico breve e verificabile tra due nodi del cluster, oppure il peso/volume di una utility, per mostrare perché l'ecosistema non si distribuisce per decreto.

### Beat 4 — La fab che non deve fare i 3 nanometri
**Core question:** Che cosa produrrà ESMC, per chi, e perché giudicarla soltanto dalla distanza dal nodo di frontiera sarebbe un errore tecnico?
**Audience tag:** [EXPERT]
**Word count target:** 950–1000 parole
**Funzione:** Establish tecnico / Corrective reveal
**Research dependence:** [WEB-PRIMARY; NOTEBOOKLM-PARTIAL sulle difficoltà generiche TSMC all'estero]
**Key facts che il Ricercatore deve trovare:**
- Tecnologie di processo annunciate, diametro wafer, capacità nominale in wafer starts per month, mix previsto e calendario di ramp; verificare se le specifiche sono cambiate dal primo annuncio.
- Prodotti e clienti finali plausibili soltanto quando nominati o tecnicamente documentati: automotive, industriale, power management, microcontrollori o altri segmenti; nessuna lista di clienti ricavata per associazione.
- Traduzione per il lettore generale della differenza tra 28/22 nm planar CMOS, 16/12 nm FinFET e nodi di frontiera; spiegare la funzione economica senza usare il nanometro come classifica morale.
- Differenza tra wafer start nominali, wafer processati, die buoni, yield, packaging, qualifica e consegna; cercare eventuali target pubblici, ma marcare il yield `[BLOCKED]` se non divulgato.
- Requisiti e tempi della qualifica automotive/industriale: standard applicabili, audit cliente, affidabilità e change control; evitare di assegnare una durata universale se varia per prodotto.
- Quota della domanda europea che la capacità nominale potrebbe coprire per i segmenti pertinenti, solo con un denominatore comparabile; vietato confrontare wafer di nodi o diametri diversi come unità omogenee.
- Controargomento più forte: ESMC non produce le GPU più avanzate, ma i chip «maturi» possono fermare automobili e macchinari; dimostrare entrambi i lati con un solo caso industriale sourced.
- Dettaglio [SHADOW]: wafer da 300 mm, ciclo di qualifica, camera di test o altro oggetto/processo reale che traduca la parola «capacità» in prodotto accettabile dal cliente.

### Beat 5 — Il processo non arriva in un container
**Core question:** Quali elementi TSMC può trasferire a Dresda e quali parti dell'ecosistema restano legate a Taiwan o ad altri monopolisti?
**Audience tag:** [EXPERT]
**Word count target:** 950–1000 parole
**Funzione:** Complicate / Failure-mode map
**Research dependence:** [WEB-PRIMARY]
**Key facts che il Ricercatore deve trovare:**
- Fonte, licenza e titolarità delle ricette di processo ESMC; ruolo operativo di TSMC e contributo tecnico di Bosch, Infineon e NXP senza inferire trasferimenti IP non pubblici.
- Piano persone: dirigenti e ingegneri inviati da Taiwan, assunti europei, training in siti TSMC, durata dei distacchi, lingua di lavoro e ritorno delle coorti; cercare almeno una testimonianza diretta nominata.
- Tool critici e giurisdizione dei fornitori: litografia, deposizione, etch, metrologia, impiantazione, automazione; scegliere cinque dipendenze rappresentative e verificare presenza locale, ricambi e service-level, non compilare una lista enciclopedica.
- Software EDA, maschere, wafer, gas, chimica, packaging/test e logistica necessari ai prodotti previsti; distinguere fonte primaria, seconda fonte e inferenza.
- Quali attività restano in Europa, quali a Taiwan e quali in paesi terzi dalla tape-out alla consegna; produrre una catena completa per un solo chip-tipo se le fonti lo consentono.
- Piani di business continuity, scorte, dual sourcing e obblighi in caso di crisi pubblicamente disponibili; l'assenza di disclosure non va trasformata in assenza di piano.
- Dipendenza dalle regole USA già canonica nel capitolo 4: verificare quali tool/software della fab sarebbero soggetti a export control e in quale scenario, senza dichiarare automaticamente bloccata una fab europea.
- Dettaglio [SHADOW]: procedura di tool move-in, cassa di trasporto, training in cleanroom o intervento di manutenzione documentato, usato per rendere visibile una dipendenza.

### Beat 6 — Le persone e le utility non accettano il sussidio
**Core question:** Quale costo materiale e umano impone l'espansione di Silicon Saxony a una regione che deve alimentare, formare e ospitare più fab contemporaneamente?
**Audience tag:** [GENERAL]
**Word count target:** 850–900 parole
**Funzione:** Humanize / Pressure test
**Research dependence:** [WEB-PRIMARY]
**Key facts che il Ricercatore deve trovare:**
- Posti diretti promessi da ESMC, profili richiesti, assunzioni effettive al cutoff, vacancy, salari o range se pubblici; separare occupazione di cantiere, diretta, fornitori e stime indotte.
- Fabbisogno di ingegneri e tecnici dell'intero cluster dopo le espansioni concorrenti; rischio di trasferire personale tra fab anziché creare nuova capacità e prove effettive di wage competition o carenze.
- Programmi di TU Dresden, scuole tecniche, ESMC/TSMC, governo federale e Sassonia: posti, coorti, durata, completion e placement, non soltanto protocolli firmati.
- Almeno una persona nominata — apprendista, ingegnere in formazione, responsabile utility o residente — con una decisione concreta e verificabile; il capitolo non può umanizzare il progetto con un personaggio composito.
- Consumi e carichi incrementali di elettricità, acqua, reflui, trasporto e alloggi; distinguere capacità tecnica disponibile, investimento necessario, impatto previsto ed effetto già osservato.
- Costo opportunità: che cosa potrebbe finanziare lo stesso denaro pubblico — packaging, ricerca, formazione, scorte o infrastrutture — presentando una valutazione esperta seria, non un controbilancio inventato.
- Benefici locali da bilanciare: salari, base fornitori, gettito, formazione e spillover; richiedere risultati osservati da impianti comparabili e non accreditarli in anticipo a ESMC.
- Dettaglio [SHADOW]: temperatura/rumore di un'aula tecnica, tragitto di un lavoratore, cantiere di una linea elettrica o cifra di un affitto, soltanto se documentato e collegato a una scelta.

### Beat 7 — La polizza con franchigia Taiwan
**Core question:** Dopo aver contato denaro, wafer, dipendenze e anni, quale rischio copre davvero Dresda e quale resta scoperto?
**Audience tag:** [BOTH]
**Word count target:** 850–900 parole
**Funzione:** Resolve / Land / Ponte al capitolo 8
**Research dependence:** [WEB-PRIMARY]
**Key facts che il Ricercatore deve trovare:**
- Matrice finale verificabile per ogni promessa: annunciato, autorizzato, pagato, costruito, installato, qualificato, operativo; stato al cutoff e fonte per ciascuna colonna.
- Test di copertura su tre scenari distinti: interruzione logistica breve da Taiwan, indisponibilità prolungata di capacità taiwanese, blocco di tool/materiali/know-how; definire quali prodotti ESMC potrebbe continuare a fornire e da quando, senza anticipare la simulazione macroeconomica del capitolo 8.
- Quota e tipologia della domanda europea potenzialmente coperta a pieno ramp, confrontata con capacità attuale e con dipendenze residue; se il denominatore non è omogeneo, rinunciare alla percentuale.
- Una valutazione terza favorevole e una critica, entrambe nella forma più forte: assicurazione industriale sensata contro sussidio costoso/protezionismo/overcapacity.
- Un solo benchmark estero omogeneo — preferibilmente JASM Kumamoto perché già canonico — per confrontare costo, sussidio, calendario, training e ramp; il Writer deve sceglierne uno, non accumulare Arizona, Giappone e Corea.
- Verdetto a matrice, non binario: rischio geografico, sovranità proprietaria, autonomia tecnologica, capacità utile, prontezza temporale e costo pubblico.
- Oggetto [SHADOW] conclusivo diverso dal capitolo 6: un wafer di qualifica, un badge di tecnico o una voce di contratto che rappresenti la copertura acquistata; nessun ritorno a terreno, tralicci o cavi incompleti.

---

## REVIEWER READINESS NOTES

### Tension points
1. **Cantiere reale vs capacità futura:** a Dresda non c'è il vuoto di Liepkalnis, ma nemmeno una produzione qualificata; il capitolo deve mantenere aperta la distanza senza trasformarla in assoluzione o condanna.
2. **Resilienza concreta vs sovranità retorica:** una fab sul territorio europeo può assorbire una parte dello shock taiwanese pur restando controllata e alimentata da una filiera globale.
3. **Denaro pubblico enorme vs controfattuale invisibile:** il costo è osservabile oggi; il beneficio principale è una fermata produttiva che forse non avverrà. Il capitolo deve valutare un'assicurazione senza fingere di conoscere il sinistro.
4. **Nodo non di frontiera vs funzione critica:** ESMC non risolve la dipendenza europea dai chip più avanzati, ma questo non rende irrilevanti i processi destinati ad auto e industria.
5. **Decentramento globale vs concentrazione locale:** la riduzione della dipendenza da Hsinchu richiede un secondo ecosistema denso, creando in Sassonia nuovi vincoli comuni di personale, utility e fornitori.
6. **Calendario politico vs calendario di processo:** approvare un aiuto e posare una prima pietra richiede mesi; stabilizzare yield e qualificare prodotti richiede anni e non rispetta una scadenza elettorale.

### Key chains da rendere esplicite
- Vulnerabilità taiwanese già stabilita → European Chips Act e aiuti nazionali → attrazione di TSMC a Dresda → nuova capacità geografica → riduzione di uno specifico single point of failure, non eliminazione della filiera globale.
- «43 miliardi» aggregati → scomposizione tra fondi UE, aiuti nazionali e capitale privato atteso → quota davvero impegnata/pagata → output industriale misurabile → giudizio sul costo soltanto a grandezze omogenee.
- Cluster preesistente → tempi/costi più bassi rispetto a un sito greenfield isolato → scelta di Dresda → maggiore concentrazione regionale → nuovo portafoglio di rischi comuni.
- Nodo dichiarato + wafer starts nominali → tool installati → processo stabile → yield → qualifica cliente → consegne → resilienza effettiva; saltare un anello produce capacità da comunicato, non capacità disponibile.
- Processo TSMC trasferito → training e gestione → tool/materiali/software multinazionali → fab europea operativa ma non autonoma → il lettore distingue ubicazione da controllo della catena.
- Domanda di lavoro e utility di più fab → investimenti in rete/formazione/alloggi → costi e spillover locali → soggetti reali che pagano o beneficiano, non «l'Europa» come attore astratto.
- Pieno ramp ESMC → portafoglio limitato di prodotti coperti → scenario di interruzione taiwanese → franchigia residua → il capitolo 8 può misurare cosa accade quando il rischio supera la copertura.

### Risk proportionality guards
- **Aiuto pubblico:** riportare l'importo massimo autorizzato come tetto, non come denaro già versato; cercare tranche, milestone, clawback e infrastrutture fuori perimetro.
- **43 miliardi:** non descriverli come un fondo unico dell'UE; dichiarare composizione, leva privata attesa, periodo e doppio conteggio possibile.
- **Costo per posto di lavoro:** non dividere automaticamente capex o sussidio per soli addetti diretti: una fab acquista capacità e resilienza oltre all'occupazione; se il rapporto viene usato, dichiararne il limite e confrontarlo con una metrica omogenea.
- **Proprietà:** maggioranza TSMC non significa assenza di beneficio europeo; localizzazione europea non significa controllo europeo della tecnologia.
- **Nodo maturo:** non chiamarlo arretrato; spiegare prestazioni, affidabilità, costo e mercati. Non usarlo però come prova che l'Europa abbia ottenuto capacità per GPU o logica di frontiera.
- **Capacità nominale:** wafer starts per month non sono die buoni né produzione disponibile; diametro, mix di nodo, yield e qualifica impediscono conversioni semplicistiche.
- **Tempistica:** una data futura dichiarata è una milestone, non un fatto; uno slittamento è tale solo rispetto a una baseline documentata e non prova da solo inefficienza.
- **Utility e ambiente:** consumo elevato non equivale automaticamente a insostenibilità; bilanciare domanda, capacità locale, riciclo, energia contrattualizzata, mitigazioni e confronto industriale omogeneo.
- **Lavoro:** posti promessi non sono posti occupati; carenze stimate non sono vacancy. Bilanciare competizione salariale e sottrazione di personale con formazione, migrazione qualificata e nuovi ingressi misurati.
- **Sussidio e overcapacity:** presentare il rischio di eccesso di capacità insieme al valore assicurativo e alle esigenze di sicurezza dell'offerta; non trattare una previsione di mercato come esito già avvenuto.
- **Dipendenza da Taiwan:** personale, IP o leadership taiwanesi non rendono ESMC automaticamente inutilizzabile durante una crisi; servono piani di continuità, presenza locale, scorte e precise modalità di rottura.
- **Confronti esteri:** confrontare un solo impianto con valuta, anno, nodo, capacità, perimetro di costo e stato di ramp compatibili; niente classifica promozionale tra Dresda, Arizona e Kumamoto.
- **Scenari di conflitto:** il capitolo 7 misura copertura industriale, non probabilità di guerra né perdite macroeconomiche; cifre su blocco/invasione appartengono al capitolo 8 e richiedono fonti dedicate.
- **Cutoff:** nessun presente eterno; aggiornare al 3 settembre 2026 consiglio di amministrazione, cantiere, aiuti, assunzioni, training e calendario.

### Obiezioni da presentare nella loro forma più forte
1. **«ESMC è una fab taiwanese pagata dai contribuenti tedeschi.»** Risposta richiesta: ricostruire governance, aiuto, obblighi, capacità localizzata e benefici verificabili senza confondere nazionalità del controllo e località del rischio.
2. **«I nodi 12–28 nm non danno alcuna sovranità tecnologica.»** Risposta richiesta: mostrare cosa non coprono e quali strozzature automotive/industriali possono invece attenuare.
3. **«Senza Dresda l'Europa resta ostaggio di Taiwan.»** Risposta richiesta: quantificare il beneficio marginale rispetto alle fab europee esistenti e alle dipendenze che ESMC non rimuove.
4. **«Con Dresda l'Europa può fare a meno di Taiwan.»** Risposta richiesta: sottoporre proprietà, processi, portafoglio prodotti, capacità e supply chain al test controfattuale.
5. **«Il costo è sproporzionato.»** Risposta richiesta: confrontare costo e alternative con il valore della capacità, il rischio assicurato e condizioni di aiuto, non con indignazione aritmetica.

### Guardrail per i sei punteggi del Reviewer
- **Narrativa & Struttura:** mantenere il verdetto sospeso fino al Beat 7; ogni beat deve trasformare una cifra politica in una variabile industriale e aprire il successivo anello della catena.
- **Lingua, Stile & Voce:** sarcasmo contro slogan, contabilità creativa e scorciatoie decisionali; mai contro operai, ingegneri, studenti o residenti. Evitare la serialità «Non X. È Y.» e non replicare il finale per contrapposizione di due luoghi del capitolo 6.
- **Accuratezza Fattuale:** fonte primaria più triangolazione indipendente per importi, calendario, capacità e stato; conflitti su date e perimetri restano visibili nel dossier e in prosa.
- **Allineamento al Pubblico:** ogni termine tecnico — wafer start, ramp, FinFET, state aid, qualifica — deve essere tradotto immediatamente in chi può produrre cosa, quando e con quale rischio.
- **Coinvolgimento Sensoriale & Emotivo:** almeno un dettaglio [SHADOW] sourced per beat e almeno una persona nominata nel capitolo; il dettaglio deve incidere sull'argomento, non decorare il paesaggio industriale.
- **Originalità & Angolo:** giudicare ESMC come polizza a copertura limitata, usando una matrice di failure modes; evitare sia la brochure «sovranità europea» sia il riflesso «sussidio sprecato».

---

## RESEARCHER BRIEF

**Protocollo per il gap di corpus:** eseguire una sola tornata NotebookLM sulle quattro query sotto per recuperare il quadro generico e i rimandi già presenti; non iterare nel notebook alla ricerca di dettagli che il PRD dichiara assenti. Per ogni beat passare poi a web/document scraper, RAG locale e fonti primarie. Triangolare ogni claim contestabile su almeno due fonti indipendenti; se un dato resta inaccessibile dopo le cinque fonti previste da `INSTRUCTION.md`, segnalarlo `[BLOCKED: needs human input — …]`.

### Query NotebookLM esatte
1. `TSMC expansion Europe Dresden Silicon Saxony obstacles cost talent utilities qualification`
2. `European Chips Act sovereignty resilience 43 billion 20 percent 2030 semiconductor target`
3. `TSMC overseas fabs Dresden Arizona Kumamoto cost delays yield ecosystem comparison`
4. `Europe semiconductor supply chain dependencies ASML EDA materials packaging Taiwan`

### Query web esatte
1. `site:commission.europa.eu European Chips Act Regulation 2023/1781 43 billion 20% 2030 methodology`
2. `site:eur-lex.europa.eu 32023R1781 first-of-a-kind integrated production facility open EU foundry crisis priority orders`
3. `site:competition-policy.ec.europa.eu ESMC Dresden Germany state aid 5 billion decision conditions clawback`
4. `European Commission ESMC state aid decision full text case number eligible costs Dresden pdf`
5. `site:tsmc.com ESMC Dresden groundbreaking August 2024 40,000 wafers 28/22 16/12 production 2027`
6. `site:esmc.eu construction update Dresden 2025 2026 tool move-in hiring production schedule`
7. `ESMC Dresden annual report 2024 2025 ownership capital expenditure subsidy paid commercial register`
8. `ESMC GmbH Gesellschafter 70% TSMC 10% Bosch Infineon NXP governance annual accounts`
9. `site:bundeswirtschaftsministerium.de ESMC Dresden Förderung 5 Milliarden Auszahlung Meilensteine`
10. `site:sachsen.de ESMC Dresden Genehmigung Baufortschritt Strom Wasser Infrastruktur Kosten 2026`
11. `site:dresden.de ESMC Bebauungsplan Wasser Abwasser Verkehr Strom semiconductor fab`
12. `ESMC Dresden environmental permit water consumption electricity demand wastewater pdf`
13. `Silicon Saxony semiconductor employment companies methodology 2025 2026 Dresden cluster`
14. `site:silicon-saxony.de ESMC supplier ecosystem skills shortage 2030 jobs report`
15. `GlobalFoundries Bosch Infineon Dresden wafer capacity employees official 2025`
16. `Why TSMC chose Dresden customers suppliers talent infrastructure official interview`
17. `ESMC Dresden 2000 jobs recruitment hired training Taiwan engineers 2025 2026`
18. `ESMC talent academy Taiwan TU Dresden students training program numbers 2025 2026`
19. `Dresden semiconductor skilled worker shortage housing wages ESMC Infineon study 2025`
20. `ESMC 28/22nm planar CMOS 16/12nm FinFET automotive industrial applications qualification official`
21. `automotive semiconductor fab process qualification timeline AEC-Q100 IATF 16949 change notification primary source`
22. `ESMC customers capacity allocation priority orders European Chips Act crisis commitments`
23. `ESMC supply chain ASML Applied Materials Lam Research Tokyo Electron chemicals gases masks EDA Dresden`
24. `TSMC Dresden business continuity Taiwan crisis process IP spare parts staffing analysis`
25. `Europe semiconductor market share 2030 target baseline value capacity wafer SEMI ESIA 2025`
26. `European Court of Auditors Chips Act 20% target 2030 investment gap report`
27. `ESMC subsidy criticism overcapacity automotive chips Europe 2025 2026 economist industry`
28. `ESMC Dresden economic impact cost benefit spillover study Saxony taxpayer subsidy`
29. `site:tsmc.com JASM Kumamoto subsidy cost capacity ramp yield training official comparison`
30. `Dresden ESMC construction site photos video dated 2026 cleanroom tool installation`

### Tipi di documento da prioritizzare
1. Regolamento (UE) 2023/1781, allegati, atti di esecuzione, documenti di bilancio UE e report della Corte dei conti europea sulla metrica 20%/2030.
2. Decisione integrale della Commissione sull'aiuto di Stato ESMC, contratto/lettera di concessione tedesca se pubblici, notifiche BMWK e bilanci federali/sassoni.
3. Bilanci, verbali societari, comunicati tecnici, presentazioni investitori e registro imprese di TSMC ed ESMC; documenti Bosch, Infineon e NXP solo per i rispettivi impegni.
4. Permessi edilizi e ambientali, VIA, connessioni di rete, autorizzazioni acqua/reflui, piani urbanistici e appalti infrastrutturali di Sassonia e Dresda.
5. Dati SEMI/ESIA/Eurostat e documentazione metodologica per quote di mercato, capacità e domanda; nessuna percentuale senza metrica e anno.
6. Standard e documenti tecnici AEC, IATF, JEDEC o clienti automotive per qualifica/affidabilità; paper e manuali industriali per ramp e yield, senza trasferire una durata da un prodotto a tutti.
7. Pagine programma e report di TU Dresden, università/istituti sassoni, ESMC e TSMC sui percorsi di formazione, con iscritti, completamenti e placement.
8. Report locali su mercato del lavoro, rete, acqua, trasporti e alloggi; testimonianze dirette e nominative, foto/video datati per [SHADOW].
9. Reuters, Financial Times, Handelsblatt, Nikkei Asia, Bloomberg e stampa sassone affidabile per triangolazione e conflitti; think tank e associazioni industriali per interpretazioni, non come fonte unica di numeri.
10. Documenti ufficiali JASM/ministeri giapponesi per l'unico benchmark estero; evitare confronti basati su aggregati mediatici incompatibili.

### Fatti, date, nomi e numeri da cacciare
- 8 agosto 2023 e 20 agosto 2024: annuncio della joint venture e groundbreaking; verificare date, firme, luogo e calendario dichiarato in ciascun momento.
- ESMC: 70% TSMC e 10% ciascuno Bosch/Infineon/NXP; verificare capitale versato, governance, diritti, opzioni e responsabilità operative.
- Investimento «oltre 10 miliardi di euro» e aiuto tedesco «fino a 5 miliardi»: perimetro, costo eleggibile, tranche erogate al cutoff, condizioni, clawback e infrastrutture escluse.
- Processo 28/22 nm planar CMOS e 16/12 nm FinFET; 300 mm; capacità nominale 40.000 wafer start/mese; confermare mix, pieno ramp e qualsiasi revisione.
- Produzione attesa «fine 2027»: definizione della milestone, stato al 3 settembre 2026, tool move-in, wafer di prova e data di volume production.
- Circa 2.000 posti diretti annunciati: assunzioni effettive, profili, training in Taiwan, personale distaccato e metodologia per posti indiretti/indotti.
- I 43 miliardi del Chips Act: quanti fondi UE addizionali, quanti riallocati, quanto state aid nazionale e quanto investimento privato atteso; periodo e rischio di doppio conteggio.
- Obiettivo 20% al 2030: denominatore, baseline 2020/2022/più recente, quota attuale comparabile e investimento stimato necessario.
- Stato di fab/espansioni GlobalFoundries, Bosch e Infineon nel distretto: scegliere soltanto i dati indispensabili a dimostrare il vantaggio del cluster.
- MW elettrici, m³ d'acqua, quota riciclata, capacità reflui, lavori stradali/ferroviari e costo pubblico locale; cercare dato progettuale e dato effettivo separati.
- Numero di aziende e addetti di Silicon Saxony con definizione del perimetro; distinguere soci dell'associazione, ICT complessivo e manifattura semiconduttori.
- Numero di studenti/tecnici per coorte, durata dei programmi, completion e placement; ottenere una testimonianza nominata sull'addestramento.
- Tempi e standard di qualifica per almeno una famiglia automotive/industriale compatibile con ESMC; non pubblicare stime di yield non ufficiali come fatti.
- Origine e presenza locale di cinque dipendenze critiche: tool litografico, un tool di processo, EDA/maschere, materiale o gas, service/ricambi; per ciascuna indicare failure mode e mitigazione.
- Aiuti, costo, capacità, calendario e ramp JASM Kumamoto con gli stessi perimetri usati per Dresda, come unico confronto internazionale.
- Eventuali prenotazioni di capacità, clienti, ordini o obblighi di priorità in crisi; se riservati, registrare l'assenza di disclosure, non inventare domanda garantita.

### Conflitti attesi da preservare nel dossier
- `43 miliardi di investimenti` vs `fondi pubblici UE effettivamente stanziati`;
- `aiuto fino a 5 miliardi autorizzato` vs `tranche realmente erogate`;
- `inizio produzione nel 2027` vs differenze tra wafer di prova, ramp e volume qualificato;
- `40.000 wafer/mese` vs mix di nodo, yield e output vendibile;
- `2.000 posti diretti` vs stime di occupazione totale/indotta;
- `Silicon Saxony produce un terzo dei chip europei` o formule simili vs denominatore effettivo;
- `sovranità europea` vs maggioranza e processo TSMC, tool/materiali/software multinazionali;
- `nodi maturi poco strategici` vs criticità automotive/industriale documentata;
- `consumi insostenibili` vs capacità, riciclo e mitigazioni autorizzate;
- `overcapacity europea` vs valore assicurativo della ridondanza e mix specifico di domanda.

---

## TARGET

**Word count:** 6.200–6.550 parole — il PRD non assegna una lunghezza autonoma al capitolo 7; l'intervallo coincide con la somma dei sette beat e resta vicino alla baseline 6.100–6.600 adottata nel capitolo 6.

**Opening hook strategy:** Aprire il 20 agosto 2024 sul terreno ESMC con un unico dettaglio fisico verificato del cantiere e far partire nello stesso istante il cronometro che separa la cerimonia dal primo wafer qualificato.

**Closing beat promise:** Chiudere su una mappa di copertura che segni l'unico guasto assorbito da Dresda e quello che attraversa ancora la franchigia, così il capitolo 8 possa mettere quella polizza alla prova davanti a un blocco di Taiwan.
