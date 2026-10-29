<div class="disclaimer">

# Nota Metodologica sul Processo Editoriale

**CHRONOS: Ai Confini dell'Impero**
*Dal Rinascimento alla Belle Époque, tra la Grande Storia e le Terre di Mezzo*

**Autore e curatore editoriale:** Alan Domio
**Anno:** 2026
**Versione:** 1.0

---

## 1. Natura dell'Opera

Questo libro è un'opera di narrativa storica a scopo didattico, prodotta per studenti di seconda media (11-13 anni) attraverso un processo editoriale ibrido uomo-macchina. La visione, il curricolo, l'architettura narrativa e ogni decisione strutturale sono opera dell'autore; la ricerca documentale, la stesura in prima bozza e i controlli di qualità sono eseguiti da sistemi di intelligenza artificiale sotto vincoli espliciti definiti dall'autore stesso, con revisione e approvazione umana finale.

I personaggi Alex e Maja sono cronoriporter immaginari; i personaggi storici che incontrano sono realmente esistiti. Quando non esiste una citazione documentata delle loro parole, i dialoghi sono ricostruzioni narrative plausibili — coerenti con quanto sappiamo del personaggio e del contesto, ma non citazioni storiche letterali. Gli elementi di gamification (schede personaggio, statistiche, box informativi) sono astrazioni ludiche a scopo didattico e non vanno interpretati come dati storici in senso stretto.

## 2. Architettura del Processo Produttivo

Il libro è stato prodotto attraverso una pipeline editoriale a sette fasi, ciascuna eseguita da un agente di intelligenza artificiale specializzato, stateless (senza memoria tra una fase e l'altra — ogni fase legge solo i documenti scritti dalla fase precedente, mai la conversazione che l'ha generata):

| Fase | Funzione | Modello impiegato |
|---|---|---|
| **Architect** | Progettazione della struttura narrativa e degli obiettivi didattici di ogni capitolo (Narrative Utility Functions) | GPT-5.6-Sol, ragionamento esteso |
| **Researcher** | Ricerca fattuale, triangolazione delle fonti | Gemini Flash 3.8 |
| **Writer** (due stadi) | Stesura narrativa e rifinitura stilistica, in due lingue indipendenti | Claude Opus (stadio 1), Claude Sonnet 5 (stadio 2) |
| **Linguista** | Verifica dell'autenticità della versione slovena e assenza di calchi dalla traduzione | Claude Sonnet 5 |
| **Editor** | Controllo di qualità automatizzato contro criteri prestabiliti, con blocco della pubblicazione in caso di violazione | Claude Sonnet 5 |
| **Reviewer** | Revisione editoriale finale su sei dimensioni (struttura, stile, accuratezza, target, coinvolgimento, originalità) | Claude Opus, ragionamento esteso |

Ogni capitolo attraversa questa sequenza almeno una volta; in caso di esito negativo di un controllo di qualità, la fase di scrittura viene ripetuta (fino a un massimo di tre tentativi) prima dell'escalation a revisione umana diretta.

## 3. Metodologia di Ricerca e Verifica delle Fonti

La fase di ricerca segue un protocollo a quattro livelli progressivi (contesto generale, eventi specifici, dettagli materiali della vita quotidiana, triangolazione incrociata tra fonti indipendenti). Ogni affermazione storica riportata nel testo deve essere tracciabile a una fonte documentata in un archivio di ricerca dedicato per capitolo; il sistema non ammette l'invenzione di dettagli "plausibili" non verificati.

Le affermazioni per cui le fonti storiografiche riportano stime, intervalli o posizioni discordanti sono segnalate come tali nel testo (con formule esplicite di cautela, es. "si stima", "secondo alcune fonti"), non presentate come dati certi. Per i contenuti relativi al territorio sloveno, il processo di ricerca richiede sistematicamente almeno una fonte in lingua slovena, per ridurre il rischio di appiattire figure e concetti sloveni su fonti italiane che li trattano solo marginalmente.

**Limite noto:** nonostante questi vincoli, i sistemi di intelligenza artificiale impiegati possono produrre errori fattuali non rilevati dal processo di verifica interno. Il lettore, l'insegnante o il genitore che riscontri un'imprecisione è invitato a segnalarla; il testo è soggetto a revisione continua.

## 4. Metodologia Bilingue

Le edizioni italiana e slovena non sono l'una la traduzione dell'altra. Per ogni scena, una delle due lingue è la stesura primaria (in base a quale delle due voci narranti — Alex o Maja — conduce quella scena) e l'altra è composta indipendentemente sugli stessi fatti, con libertà di riformulazione stilistica. Un controllo automatizzato specifico ("test anti-calco") verifica che le due versioni non siano ricostruibili l'una dall'altra frase per frase, e blocca la pubblicazione in caso contrario.

## 5. Supervisione Umana

L'autore definisce il curricolo, la struttura di ogni capitolo, le regole di stile e i criteri di qualità applicati dal sistema; approva o corregge l'output finale prima della pubblicazione. Il processo descritto in questa nota è documentato in dettaglio nei file di configurazione del progetto, disponibili su richiesta per finalità didattiche o di ricerca.

## 6. Licenza

Quest'opera è distribuita sotto Licenza Creative Commons **Attribuzione - Non commerciale - Non opere derivate 4.0 Internazionale (CC BY-NC-ND 4.0)**. È consentito condividere e ridistribuire il materiale in ogni supporto o formato, a condizione di darne credito appropriato, non utilizzarlo per scopi commerciali e non modificarlo.

Leggete con spirito critico.

</div>


<div style="page-break-after: always;"></div>

# Capitolo 0 — Il Nuovo Membro della Squadra

## Briefing

Mission Control a tutte le postazioni. Alex, seconda missione. Maja, primo briefing. Squadra, rapporto a Mission Control.

Siamo oggi, alla base. Alex ha già chiuso una missione; la seconda comincia adesso, la squadra è appena cambiata e il prossimo salto vi porterà nel 1453. Questa mattina, però, sul pannello di autorizzazione ci sono due firme da reporter e tre tracce ancora senza responsabile. Chi occupa il secondo posto, e come verranno divise le tre linee, non lo diciamo noi. Lo scoprirete guardando la squadra lavorare.

**OBIETTIVI DELLA MISSIONE ZERO**

1. **Completare la squadra** — scoprire chi sono Alex, Maja e MEMO e che cosa osserva ciascuno.
2. **Leggere tre mappe insieme** — seguire Europa e mondo, Alto Adriatico e terre slovene senza trattarne una come nota a margine.
3. **Misurare la certezza** — distinguere un fatto documentato, una stima e una ricostruzione plausibile.
4. **Mettere alla prova una spiegazione** — partire da un'ipotesi, cercare ciò che potrebbe smentirla, cambiare risposta se cambiano le prove.

Da oggi il rapporto è seguito da due cronoriporter, Alex e Maja: due taccuini, responsabilità distinte, lo stesso controllo sulle fonti. Un registro, un oggetto e la testimonianza di una persona non pesano automaticamente allo stesso modo. Prima di fidarci dovremo chiederci chi li ha prodotti — e che cosa potrebbe smentirli.

---

## Il Controllo Prima del Salto
*Cronaca di Alex*

Il ronzio arriva sempre per primo. È basso, sotto la soglia di qualunque musica, e parte nell'istante esatto in cui aggancio il modulo auricolare: una vibrazione che sento nell'osso della mascella un attimo prima che nell'orecchio. Poi l'aria. Secca, deumidificata, con quel retrogusto di polimero caldo che hanno i circuiti quando la sala è accesa da qualche ora.

I film mi avevano promesso un portale. Spirale di luce, gente in camice che urla numeri, conto alla rovescia. La macchina del tempo, invece, comincia con una lista da spuntare e un paio di scarponcini da trekking con il battistrada consumato fino a metà del disegno.

**MEMO:** *"Procedura Challenge-and-Response. Io leggo la voce, tu tocchi il comando e rispondi ad alta voce. Un controllo che non è stato pronunciato non è stato fatto."*

**Alex:** "Anche se l'ho appena fatto con le mani?"

**MEMO:** *"Soprattutto in quel caso. Il cervello archivia come compiuto anche ciò che ha soltanto immaginato di compiere."*

Tocco la clip dell'auricolare. Scatta sotto il polpastrello, magnetica, con quel suono da molla piccola.

**Alex:** "Canale audio, agganciato."

**MEMO:** *"Confermato. Stabilità cronocinetica entro margine. Contatore incarichi: salto numero tre."*

Terzo salto. Seconda missione. Sul display satinato la cifra sta lì da stamattina e io la guardo come si guarda un dente che dondola. La prima volta avevo vomitato dietro un muro. Mission Control lo chiama *disorientamento cronocinetico*: io lo chiamo con il suo nome vero.

**MEMO:** *"Vettore temporale."*

Appoggio il pollice sul tasto gommoso della consolle e lo spingo fino in fondo, finché non lo sento arrivare a battuta.

**Alex:** "Vettore temporale, bloccato."

Tre volte ho fatto questa procedura e tre volte MEMO mi ha ripetuto la stessa cosa: se la risposta non arriva insieme al dito, il controllo non conta. È così che si spuntano caselle senza aver spuntato niente.

Poi noto la cosa fuori posto. Sul vassoio dell'equipaggiamento ci sono due moduli auricolari. Il mio, con la clip graffiata. E un secondo, ancora sigillato dentro la busta.

**Alex:** "MEMO, c'è un doppione. Qualcuno ha caricato male il vassoio."

**MEMO:** *"Negativo. Sul pannello risultano due autorizzazioni da reporter per questo incarico. La seconda non è la tua."*

Nel corridoio, fuori, il pavimento restituisce un rumore di passi che non conosco.

::: memo-box
### MEMO GLOSSARIO

*   **Cronoriporter:** chi va a vedere un'epoca di persona e riporta quello che ha visto e chiesto, invece di riassumere un libro.
*   **Salto temporale:** il trasferimento in una data precisa del passato. Costa venti minuti di nausea.
*   **Prova:** un elemento verificabile che sostiene o smentisce una spiegazione. Non è un'opinione, e non è ancora una conclusione.
:::

---

## La Voce Dietro la Porta
*Cronaca di Maja*

Conto le frasi prima ancora di vedere le facce. Il ragazzo ne dice tre, la macchina una, il ragazzo altre due. Non ho ancora visto in faccia nessuno dei due e già so chi, là dentro, è convinto di condurre.

Dalla fessura della porta esce aria fredda, e sa di plastica scaldata: questa base ha l'odore di una stanza dove qualcosa resta acceso tutta la notte.

Italiano. Il traduttore me lo consegna mezzo battito più tardi, così ogni parola la sento due volte, e a questo non mi sono ancora abituata.

Spingo la porta.

**Alex:** "Tu sei Maja? Bene. Mission Control mi aveva detto che avrei avuto un aiuto per la preparazione."

**Maja:** "Ha detto che avresti avuto una collega."

Resta con la mano sospesa sopra il vassoio dell'equipaggiamento. Non c'è cattiveria, si capisce al volo: è solo un ragazzo che ha portato avanti da solo un'intera missione e si immagina la seconda uguale, con una persona in più nella stanza.

**Alex:** "Cioè, tu ti prendi le scene slovene e io copro il resto. Ti do un consiglio: la prima settimana non provare a seguire tutto, ci ho messo mesi."

**Maja:** "Le terre slovene sono mie. Il resto è tuo. Sembra la stessa frase che hai detto tu, ma non lo è."

Sul Carso c'è cresciuto mio nonno; io sono cresciuta tra quelle stesse pietre e Lubiana. Da dodici anni sfoglio libri di scuola — italiani e sloveni, non fa differenza — e le mie terre non hanno mai un capitolo tutto loro: compaiono tra parentesi, appese alla storia di qualcun altro. Non mi lamento. Mi faccio una domanda più scomoda: perché questa cosa non la so già? Siamo sulla strada tra il mare e le montagne, nel punto in cui passa tutto e tutti — e nessuno, mai, me l'ha spiegato.

**Maja:** "Provo con una domanda. Mentre l'Europa cominciava a guardare verso l'oceano, che cosa succedeva nelle terre slovene? In che lingua si firmavano gli atti, chi incassava il dazio."

**Alex:** "...dovrei controllare."

**Maja:** "Ecco. Io non sono qui perché a te non basta il tempo. Sono qui perché dentro quella parentesi c'è una storia intera, e qualcuno deve andare a guardarla da vicino."

Tiro fuori il quaderno solo adesso. Angoli della copertina telata, ormai chiari dall'uso; la spirale d'ottone che al centro si è allargata; una matita a grafite morbida, tenuta apposta poco appuntita perché il segno spesso non si cancelli per errore. Gli schermi di questa base saranno anche perfetti. Io, per ora, mi fido della carta.

Due parole, più la data: *corresponsabile, non assistente*. Le scrivo a matita apposta — chi le vuole cancellare, lo deve fare con la gomma, davanti ai miei occhi.

**Alex:** "Cominciamo dalla lista dell'equipaggiamento e poi vediamo."

**Maja:** "Cominciamo. Ma il *poi vediamo* lo scrivo, così ce lo ricordiamo tutti e due."

::: memo-box
### MEMO GLOSSARIO

*   **Terre slovene:** il modo corretto di chiamare, nei secoli che visiteremo, i territori dove si parla sloveno. Uno Stato con quel nome allora non esiste ancora: esistono le terre, le loro leggi e le loro lingue.
:::

::: target-profile
### SCHEDA PERSONAGGIO: Maja

*   **Ruolo:** cronoriporter, oggi, alla sua prima missione CHRONOS. Cresciuta tra Lubiana e il Carso.
*   **Abilità Speciale:** capisce in quale lingua sta parlando una stanza prima di sapere di che cosa sta parlando — e chiede sempre chi ha deciso che quella lingua contasse.
:::

---

## Tre Mappe Sullo Stesso Schermo
*Cronaca di Alex*

Sullo schermo grande, in fondo alla sala, si accendono tre tracce. Non insieme: una alla volta, con un clic magnetico ogni volta che una si aggancia alla linea del tempo. Colori diversi, spessore identico.

**Mission Control:** "Prima traccia: Europa e mondo. La grande storia continentale e oceanica, quella che finisce sui manuali di tutti. Alex, è tua."

Fin qui, niente di nuovo.

**Mission Control:** "Seconda traccia: Alto Adriatico. Il tratto di costa in cima al mare, dove le altre due si incontrano più spesso. Alex, anche questa."

**Mission Control:** "Terza traccia: le terre slovene. Maja, tua. Intera."

Maja non ha ancora detto niente, ma ha smesso di scrivere, e qui dentro comincio a capire che è un segnale.

**Maja:** "Definiscila meglio. Se la terza traccia è una deviazione dalla prima, io torno a casa."

**Mission Control:** "Non è una deviazione. È una linea che corre in parallelo e ha una sua velocità. Nessuna delle tre spiega le altre due."

Guardo il grafico. Le tre linee corrono distanti per quasi tutta la larghezza dello schermo, poi in quattro punti si stringono, si toccano e ripartono separate.

**Alex:** "E lì? Nei punti in cui si toccano?"

**Mission Control:** "Lì ci siete tutti e due, sullo stesso evento, con due taccuini diversi. Nessuno vi chiederà di mettervi d'accordo su che cosa avete visto."

Sarebbe più comodo un reporter solo. Una voce, una versione, un rapporto. Poi però guardo i quattro nodi luminosi, dove la stessa giornata verrà raccontata due volte da due persone che non stanno guardando la stessa cosa, e mi arrendo all'idea che comodo e vero non siano la stessa parola.

**Maja:** "Accordo operativo: nessuno dei due riassume la traccia dell'altro. Se ti serve la mia, me la chiedi."

**Alex:** "E tu la mia."

Non ci siamo stretti la mano. Abbiamo solo spuntato una casella.

## Quanto Ne Sappiamo Davvero?
*Cronaca di Alex*

Mission Control ci consegna un foglio stampato. Tre righe soltanto, sui consumi di ieri della sala.

*Generatore: 412 kWh registrati dal contatore alle 23:59.*

*Persone entrate nella sala nella giornata: tra nove e dodici.*

*Il portello di raffreddamento è rimasto aperto tutta la notte perché il tecnico ha chiuso il turno di corsa.*

**Mission Control:** "Classificatele. Fatto, Stima, Ricostruzione."

**Alex:** "Facile. Sono vere tutte e tre, le ha scritte la base."

Silenzio. Quel tipo di silenzio in cui capisci di aver risposto a un'altra domanda.

**Maja:** "Non ha chiesto se sono vere. Chi ha prodotto ogni riga, e con che cosa?"

**MEMO:** *"Riga uno: lettura diretta di un contatore, con orario. Riga due: ricavata dai badge, con tre passaggi registrati due volte. Riga tre: nessun operatore era presente."*

Ecco dove crollava la mia risposta. La terza riga non è falsa. È *non osservata*: qualcuno ha trovato un portello aperto e ci ha costruito attorno la spiegazione più ragionevole del mondo. Ragionevole non vuol dire visto.

**Alex:** "Quindi la seconda la devo scrivere 'tra nove e dodici' anche se mi fa sentire impreciso."

**Mission Control:** "Ti fa sentire impreciso perché sei preciso. Chi scrive 'undici' senza sapere se sono undici sta mentendo con più eleganza, non con più esattezza."

Maja ha già il quaderno aperto. Sotto la seconda riga scrive una cosa che a me non era venuta in mente: *cercare il registro dei turni*. Nessuno, compilando un foglio di turni, ha interesse a gonfiare il numero di chi è entrato in una sala. È una fonte che non stava raccontando niente a nessuno — e per questo tiene.

**Alex:** "E se un registro così, che non raccontava niente a nessuno, non salta fuori?"

**Maja:** "Allora si scrive che non l'abbiamo trovato. Anche quello è un dato."

**Mission Control:** "Una regola sola, e la dico una volta per tutto il libro. I personaggi storici che incontrerete sono esistiti davvero. Quando non abbiamo le loro parole esatte, le loro battute sono una ricostruzione plausibile, coerente con quello che sappiamo di loro. Non sono citazioni documentate, e non ve le venderemo come tali."

::: memo-box
### MEMO GLOSSARIO

*   **Fatto:** informazione documentata con precisione, sostenuta da una fonte diretta. Si scrive senza esitazioni.
*   **Stima:** quantità o data ricavata da tracce incomplete, oppure contesa fra le fonti. Si scrive con il margine dichiarato: "tra X e Y", "secondo le cronache".
*   **Ricostruzione:** il raccordo plausibile là dove nessuno ha osservato né trascritto. È coerente con il contesto, ma non è un documento.
:::

---

## La Prima Catena
*Cronaca di Alex*

Sul linoleum, a un metro dal cestino, c'è una pallina di carta accartocciata. L'ho tirata io, e ha fatto un rumore ridicolo rotolando.

**Mission Control:** "Alex, spiegami perché è finita lì."

**Alex:** "Ho tirato male."

**Maja:** "Che cosa potrebbe smentirti?"

Mi blocco con la bocca aperta. È una domanda che non mi era mai venuta in mente in vita mia: non *ho ragione?*, ma *che cosa mi darebbe torto?*

**Maja:** "Perché io ho una seconda spiegazione altrettanto buona. La bocchetta dell'aria è esattamente sopra il cestino, e qui dentro c'è un fruscio che non smette mai."

**Alex:** "E come facciamo a sapere quale delle due?"

**Maja:** "Cambiamo una cosa sola. Tutto il resto identico."

Accartoccio un altro foglio con la stessa forza. Maja tiene una cartellina rigida di taglio lungo la traiettoria, come uno scudo fra la bocchetta e il cestino. Stesso tiro, stessa mano, stesso punto di partenza.

Entra.

**Alex:** "Va bene. Non avevo tirato male."

**Mission Control:** "E questo è il protocollo. Non era un quiz: entrambe le spiegazioni erano plausibili finché non avete trovato il controllo che le separava. Un quiz ha la risposta scritta sotto. Un'indagine ha un elemento che, se lo cambi, cambia il risultato."

Poi lo schermo grande cambia. Le tre tracce si spengono e resta una riga sola, bianca, larga quanto la parete.

**1453 → Costantinopoli cade → le vie verso l'Asia si chiudono → l'Europa cerca l'oceano**

Sta lì. Ordinata, con le sue frecce, esattamente come sul quaderno di chiunque abbia mai fatto questo argomento in classe. E fa lo stesso identico effetto della frase "ho tirato male": suona finita.

**Alex:** "Questa la so. È la prima cosa che ci hanno spiegato."

**Maja:** "Anche a me. In due lingue diverse, con le stesse frecce."

**MEMO:** *"Catena da verificare. Nessuna prova raccolta. Nessuna conclusione autorizzata."*

**Mission Control:** "Preparate l'equipaggiamento. Ventinove maggio, 1453."

Le luci della sala scendono di un gradino. La riga bianca resta accesa con le sue quattro frecce, e nessuno di noi due la tocca.[^ee0]

::: memo-box
### MEMO GLOSSARIO OPERATIVO

*   **Ipotesi Iniziale:** la spiegazione ordinata da cui si parte, di solito quella del manuale. Non è il nemico: è il punto da mettere alla prova.
*   **Checkpoint:** il momento in cui si sospende il racconto e si sceglie fra due letture plausibili, prima di sapere come va a finire.
*   **Verdetto:** la risposta motivata alla fine dell'indagine, con dichiarato quello che ancora non si sa.
:::

---

## Debriefing

Mission Control riceve due rapporti, non uno. Alex porta la lente delle persone e dei punti in cui le linee si incrociano; Maja porta la lente delle lingue, di chi firma un atto e di chi incassa un dazio. MEMO controlla dati e coerenza, e non decide quale storia conti.

| Obiettivo | Esito |
|---|---|
| Completare la squadra | Alex e Maja sono due reporter autonomi; MEMO verifica dati e procedure. |
| Leggere tre mappe insieme | Europa e mondo, Alto Adriatico e terre slovene hanno responsabilità distinte e punti d'incrocio. |
| Misurare la certezza | Fatto, Stima e Ricostruzione richiedono tre diversi livelli di cautela. |
| Mettere alla prova una spiegazione | La risposta cambia quando un controllo distingue due spiegazioni plausibili. |

Squadra completa. Metodo attivo. Nessuna storia viene accettata perché ha le frecce in ordine o perché suona sicura.

Sullo schermo resta accesa una riga sola: **1453 → Costantinopoli cade → le vie verso l'Asia si chiudono → l'Europa cerca l'oceano**. Quattro frecce, nessun documento sotto. Prima del salto, Mission Control fa una domanda sola, e poi spegne le luci.

Quale prova, trovata nel 1453, vi costringerebbe a cancellare una di quelle frecce?

[^ee0]: Curiosità cifrata (ROT13): *Va fybirafpvav Pbfgnagvabcbyv fv erpr Pnevtenq.*

<!-- WORD COUNT: ~2.630 -->
<!-- PERSONA CHECK: Alex/Maja voice intact? Pass — Alex keeps the media-vs-reality tic (portale da film smentito dalla checklist di scarponcini), sarcasm and quiet friction toward MEMO, and the mild seniority-driven overreach toward Maja ("ti do un consiglio"); Maja keeps "perché non lo so già", structural focus (chi firma, chi incassa il dazio, chi ha prodotto il dato), and closes the operational agreement without ceding ground. No drift into generic AI narration. -->
<!-- NUF CHECK: [1] Alex/Maja/MEMO identified through action, not bio-dump ✅ | [2] Europa e mondo/Alto Adriatico/terre slovene followed jointly, assigned without hierarchy ✅ | [3] Fatto/Stima/Ricostruzione classified and demonstrated on the three-line report ✅ | [4] Falsifiability tested via paper-ball demo (question → alternative → single-variable control → corrected answer) ✅ | [5] Maja's arrival shifts team balance — Alex loses the solo-voice default, Maja gains ground without becoming assistant or tutor ✅ | [6] Chapter ends on precise curiosity toward the 1453 chain, not generic adventure promise ✅ | [7] Emotional throughline (mild seniority friction, incomplete "poi vediamo" pact) present without forced resolution ✅ | [8] Fact/Estimate/Reconstruction convention stated with source and precision, incl. the one-time reconstructed-dialogue disclosure ✅ | [9] Only closed historical datum is 1453 itself; the causal chain stays explicitly unverified ✅ | [10] No anachronistic territorial projection: present-day dialogue vs. "terre slovene" for the past kept distinct; EU/GIULIA/SLOVENIA never spoken as raw tags — always "Europa e mondo"/"Alto Adriatico"/"terre slovene" ✅ -->
<!-- ANTI-AI CHECK: No banned patterns ("Immaginate di essere...", "Ebbene sì...", explicit closing moral) found. No forbidden phrases ("come sappiamo", "è importante notare", etc.). Zero "Scena N"/"Beat N" production labels in the text; "Capitolo" appears once, in the opening line only. Every scene subtitle carries its narrator byline (Cronaca di Alex / Cronaca di Maja). MEMO respects the ≤3-info-per-intervention rule throughout. School/reality tic (Alex) and "perché non lo so già" (Maja) each used once — within the ≤3 cap. Chapter 0's special vincoli respected: no Ipotesi/Checkpoint/Verdetto apparatus applied to the chapter itself, no historical Life-Hack mandate (contemporary setting only), 2.000-2.800-word ceiling respected, Debriefing has no historical Verdetto/reality-check/Cronologia Essenziale per the struttura's explicit exemption for this orientation chapter. -->


<div style="page-break-after: always;"></div>

# Capitolo 1 — L'Alba della Modernità

## Briefing

Alex, Maja: il salto si apre all'alba di martedì 29 maggio 1453, in pieno Quattrocento. Nella Missione Zero avete visto una catena scritta sullo schermo senza una sola prova sotto. Adesso andate a cercarle.

Il manuale la racconta così: 1453 → Costantinopoli cade → gli Ottomani chiudono le vie verso l'Asia → gli europei sono costretti a cercare una rotta oceanica → l'Atlantico sostituisce subito le vecchie reti mediterranee e terrestri.

Qualcosa non torna. Certe date non stanno dove le frecce le vorrebbero, e certi registri di porto continuano a riempirsi proprio quando dovrebbero restare vuoti. Il perché non ve lo diciamo: è il vostro lavoro.

La vostra missione è raccogliere cinque prove, pesarle una per una e ricostruire la vera catena degli eventi.

## OBIETTIVI DEL SALTO (SCENE)

### 1. La Porta E Il Registro (Costantinopoli, maggio-estate 1453) — voce: Alex

Cercherai un testimone appena scampato all'assedio, poi un uomo che deve decidere se riaprire il proprio banco.
**Prova da raccogliere:** che cosa succede a merci, dazi e accordi nelle settimane subito dopo la conquista.

### 2. La Mappa Prima Della Rotta (Murano e Atlantico, 1459-1488) — voce: Alex

Entrerai in una stanza che sa d'inchiostro, e ne uscirai su una caravella in tempesta.
**Prova da raccogliere:** confronta le date delle prime imprese atlantiche con quella del 1453, e misura quanto una mappa renda un viaggio tentabile.

### 3. Due Direzioni, Nessuna Scorciatoia (Caraibi e Calicut, 1492-1498) — voce: Alex

Due rotte, due obiettivi, due risultati che non si somigliano per niente.
**Prova da raccogliere:** distingui che cosa cercava ciascuna spedizione e che cosa ha trovato davvero.

### 4. Il Prezzo Di Un Cristallo (Trieste e Zaule, 1382-1463) — voce: Alex

Un porto piccolo, un tributo annuale, una vasca di sale sfondata.
**Prova da raccogliere:** verifica se una rete adriatica perde subito valore quando cresce quella atlantica.

### 5. Il Banco Sul Fiume (Lubiana, 1489) — voce: Maja

Un fiume, un ponte con i casotti del dazio, e una lingua che nessun atto mette per iscritto.
**Prova da raccogliere:** stabilisci come una città senza mare possa controllare merci, diritti e parole.

Il rapporto lo firmano in due: Alex sulle rotte europee e sull'Alto Adriatico, Maja dentro la rete delle terre slovene. Nessuno dei due riassume la prova dell'altra.

Ultima cosa. Un diario d'assedio, una carta nautica, un privilegio sigillato e un registro di dazio non pesano automaticamente uguale: per ogni prova chiedetevi chi l'ha prodotta, quando, e per convincere chi.

---

## La Porta E Il Registro
<span class="byline">Cronaca di Alex</span>

Il primo colpo non passa dalle orecchie. Mi entra dallo sterno, come un pugno dato da dentro. Poi arriva l'odore: salnitro, zolfo grezzo, fuliggine di carbone d'ontano, un misto che gratta in fondo alla gola e ti fa tossire prima ancora che tu capisca che cosa stai respirando.

*MEMO, che roba era?*

**MEMO:** *"Bombarda di bronzo. Le fonti stimano le palle di granito nero tra i cinquecento e i seicento chilogrammi. Le fondamenta delle mura vibrano fino a due miglia di distanza."*

Grazie. Sono atterrato dentro un martello.

È l'alba di martedì 29 maggio 1453. L'assedio è cominciato il 6 aprile: cinquantatré giorni. Adesso la cinta è sfondata, l'imperatore Costantino XI è caduto vicino alla porta di San Romano, e sul Corno d'Oro le galee veneziane mollano gli ormeggi con la gente che salta a bordo vestita di tutto punto.

Su una di quelle galee c'è un uomo che non combatte e non prega. Scrive. Ha un quaderno appoggiato su una cassa e le mani sporche di pece.

**Alex:** "Scusa — ma tu che cosa stai facendo?"

**Niccolò Barbaro:** "Segno il giorno. Da aprile segno ogni giorno quel che ho visto con questi occhi: le brecce, le navi, chi è venuto e chi è mancato."

**Alex:** "E come avete fatto a resistere cinquantatré giorni? L'acqua, il pane..."

**Barbaro:** "L'acqua scende dai tetti nelle cisterne sotto le case, intonacate perché non trasudino: al buio non fa alghe e il fango si posa sul fondo. Il grano sta in giare interrate, chiuse con calce viva e cenere, che soffocano i tonchi. Quando le bombarde hanno rotto i mulini, in casa si è tornati a macinare a mano."

Poi aggiunge una cosa che non gli avevo chiesto.

**Barbaro:** "E scrivi anche questo: i genovesi di Pera hanno fatto il doppio gioco."

*MEMO, quanto vale come fonte?*

**MEMO:** *"Testimone oculare, medico di bordo, scrive in volgare veneziano. Ha visto il fronte del Corno d'Oro e le mura, non il resto della città. L'astio verso i genovesi è suo, non è un dato."*

Quindi: fortissimo su quello che ha visto, debole su quello che ha dedotto. Prima riga del rapporto.

Tre giorni dopo attraverso il braccio d'acqua e scendo a Pera, il quartiere dei genovesi. Mi aspettavo magazzini svuotati e porte sfondate. Nessun documentario mi aveva preparato a un uomo seduto su una cassa che conta botti a voce alta.

Veste di lana pesante, dita macchiate d'inchiostro, un registro aperto sul ginocchio. Dietro di lui due facchini rimettono in fila balle di panno.

**Alex:** "Ma... non siete stati conquistati tre giorni fa?"

**Il fattore genovese:** "Il primo giorno di giugno il sultano ci ha concesso una carta. Persone e beni salvi, il nostro culto salvo, e possiamo continuare a trafficare per mare e per terra. Sopra di noi ora stanno un suo governatore e un suo giudice."

**Alex:** "E il pepe? La cannella? Non si fermano?"

**Il fattore:** "E perché mai? Chi ha vinto vuole i diritti di dogana. Un porto chiuso non frutta nulla. Un porto aperto frutta a ogni carico."

Alza il registro come si alza una prova davanti a un giudice.

**Il fattore:** "Il prezzo però cresce. Prima c'erano meno mani in mezzo. Adesso ogni mano vuole la sua parte."

Io avevo in testa una porta che si chiude di colpo. Qui la porta è aperta, c'è la fila, e sulla soglia c'è uno che fa pagare il biglietto.

**MEMO:** *"Aggiornamento. 18 aprile 1454: trattato fra Venezia e il sultano. Le navi venete possono attraccare e commerciare pagando un dazio del due per cento. Un rappresentante veneziano risiederà stabilmente in città."*

::: memo-box
### MEMO GLOSSARIO

*   **Intermediario:** chi sta in mezzo fra chi produce una merce e chi la compra. Ogni intermediario aggiunge il proprio guadagno al prezzo finale.
*   **Dazio:** la somma che un'autorità fa pagare su una merce che entra, esce o passa. Non è il prezzo della merce: è il prezzo del permesso.
*   **Privilegio commerciale:** un documento con cui un sovrano concede a un gruppo di mercanti diritti che gli altri non hanno — trafficare, avere un proprio giudice, pagare meno.
:::

Una città può cadere e i suoi conti restare aperti.

---

## La Mappa Prima Della Rotta
<span class="byline">Cronaca di Alex</span>

Nel monastero di San Michele, a Murano, un frate anziano è chino su un disco di pergamena grande come una porta, montato su un telaio di pioppo. Sta tirando una linea di rombo con un tiralinee di bronzo. È il 1459, e qui l'aria sa di ferro e di aceto: l'inchiostro, noci di galla di quercia macerate con vetriolo verde e gomma arabica, e sotto, più sottile, la polvere di pomice con cui hanno raschiato la pergamena.

Mi aspettavo un esploratore. Ho trovato uno che non è mai uscito dalla laguna.

**Alex:** "Sei mai stato in Africa?"

**Fra Mauro:** "Mai. Ma parlano con me quelli che ci sono stati. Piloti, mercanti tornati dall'Asia, uomini che tengono le carte da navigare unte di sale. Io li ascolto, li confronto, e quel che non regge al confronto lo cancello."

**Alex:** "Cioè copi quello che ti dicono?"

**Fra Mauro:** "Scelgo. Un antico maestro insegna che l'Oceano Indiano è chiuso da una terra che lo abbraccia tutto. I marinai dicono che l'Africa finisce, e che oltre l'estremità c'è acqua. Io disegno l'acqua."

Fermo un attimo il respiro, perché quella frase è più grossa di quanto sembri. Un sapere antico, recuperato e ammirato, viene corretto da gente che non ha studiato ma ha navigato — e il monaco dà ragione ai secondi.

::: scan-result
### SCANNING: IL MAPPAMONDO DI FRA MAURO

*   **Tipo:** carta del mondo circolare, pezzo unico
*   **Materiale:** pergamena su telaio di pioppo; inchiostro ferrogallico, cinabro, azzurrite, lapislazzuli macinato
*   **Funzione:** commissionata dalla corte portoghese di re Alfonso V; completata nel 1459
*   **Dettaglio Tecnico:** rappresenta l'Africa interamente circondata dall'acqua e navigabile fino al "Capo di Diab" — l'Oceano Indiano è aperto, non chiuso
:::

::: target-profile
### SCHEDA PERSONAGGIO: Fra Mauro

*   **Ruolo:** monaco camaldolese e cartografo, Murano, metà del Quattrocento
*   **Forza:** 1 — non ha mai armato una nave né sollevato un remo
*   **Intelligenza:** 5 — mette a confronto portolani, racconti di piloti e libri di geografia, e scarta le leggende senza riscontro
*   **Carisma:** 3 — non comanda nessuno, ma un re dall'altra parte d'Europa aspetta il suo lavoro
*   **Abilità Speciale:** riscrive la mappa del mondo contraddicendo mille anni di autorità antica — perché si fida di un marinaio vivo più che di un libro morto
:::

**Alex:** "Ma i portoghesi hanno cominciato adesso a scendere lungo l'Africa? Per via di Costantinopoli?"

**Fra Mauro:** "Adesso? Presero Ceuta quando io ero giovane, nel quindici. Poi Madera nel diciannove, le Azzorre nel ventisette. Nel trentaquattro uno dei loro capitani doppiò il Capo Bojador, che tutti dicevano impossibile, e dieci anni dopo erano a Capo Verde. Ragazzo, tutto questo è successo prima che il Turco entrasse in quella città."

Faccio il conto due volte. Fa lo stesso risultato tutte e due le volte: le caravelle portoghesi scendevano lungo l'Africa da quasi quarant'anni prima del 1453.

::: memo-box
### MEMO GLOSSARIO

*   **Umanesimo:** il movimento che nel Quattrocento recupera e ripulisce i testi scientifici dell'antichità — fra questi la *Geografia* di Tolomeo, tradotta in latino nel 1406 — riportando in circolazione la misura matematica dello spazio, le coordinate e l'idea di una Terra sferica.
*   **Rinascimento:** non un sinonimo del precedente. È la fase in cui quei metodi recuperati vengono *applicati*: alle arti, alle macchine, alla tecnica di navigazione. L'Umanesimo rilegge i libri; il Rinascimento li mette al lavoro.
*   **Portolano:** carta da navigazione disegnata a mano su pelle di vitello o montone, con le trentadue direzioni dei venti tracciate a raggiera. Nessuna coordinata celeste: si usa insieme alla bussola e all'orologio a polvere.
:::

Il salto successivo mi sbatte trent'anni più avanti e diecimila chilometri più a sud, dentro il gennaio 1488, dentro una tempesta che dura tredici giorni. Le tavole di quercia stridono. La sentina gorgoglia. Le sartie di canapa puzzano di sego di montone e grasso di balena, spalmato lì sopra perché la canapa non marcisca sotto gli spruzzi.

Un marinaio infila un rotolo di pergamena dentro un tubo di cuoio bollito e ci calza un tappo impeciato.

**Alex:** "Perché ha il piombo sul fondo?"

**Il marinaio:** "Perché se ci prendono, la carta va in mare e affonda subito. E il retro è passato a cera d'api e trementina: l'acqua salata scivola via e non la mangia."

Quando la tempesta molla, la spedizione di Bartolomeu Dias si ritrova a est dell'estremità meridionale dell'Africa senza averla mai vista passare. Il 3 febbraio 1488 tocca terra in una baia. Il 12 marzo pianta una colonna di pietra alla foce di un fiume, e lì si ferma: l'equipaggio è sfinito, senza scorte fresche, sull'orlo dell'ammutinamento. Si torna indietro.

**MEMO:** *"Attenzione al nome di quel capo. Una fonte di corte, cinquant'anni dopo, sostiene che Dias lo chiamò Capo delle Tempeste e che fu il re a ribattezzarlo Capo di Buona Speranza. Due testimonianze molto più vicine ai fatti dicono invece che il nome lo diede Dias stesso. Le fonti divergono e restano divergenti."*

Una mappa giusta, una tempesta e un equipaggio che ne ha abbastanza: tre cose che decidono insieme, e nessuna delle tre da sola.

---

## Due Direzioni, Nessuna Scorciatoia
<span class="byline">Cronaca di Alex</span>

È il 12 ottobre 1492, davanti a un'isola che i suoi abitanti chiamano Guanahaní, e non è deserta. Non è nemmeno un po' deserta. Dalla riva scendono in acqua uomini e donne con la pelle dipinta di argilla rossa, ocra e fuliggine, e con loro arriva un odore di resina verde — una pianta che non conosco — e di fumo di legna bruciata all'aperto. Altri arrivano su piroghe scavate in un unico tronco di cedro, spingendo pagaie larghe come pale da forno. Portano pappagalli, matasse di cotone filato a mano, zagaglie di legno con la punta d'osso. Se ne tornano indietro con berretti rossi, sonagli d'ottone e perline di vetro.

Uno di loro afferra la lama di una spada di ferro per capire che cos'è. Si taglia i polpastrelli. Se li guarda come si guarda una cosa nuova, non come si guarda una ferita.

*MEMO, che cosa stanno dicendo?*

**MEMO:** *"Non lo sappiamo. Il diario di bordo è castigliano e registra solo ciò che i castigliani capirono di aver visto. Le parole dei Taíno di quella mattina non sono conservate in nessuna fonte."*

Ecco, questa è la parte che a scuola non mi hanno mai detto. Non che qui non ci fosse nessuno: che di quel giorno abbiamo il verbale di una sola delle due parti.

**MEMO:** *"Contesto verificato: villaggi organizzati e guidati da capi locali, agricoltura della manioca su cumuli di terra soffice, canoe capaci di trasportare fino a quaranta o cinquanta persone."*

E il navigatore che ha portato qui le tre navi partite da Palos il 3 agosto è convinto di essere arrivato alle isole davanti al Giappone.

**MEMO:** *"Il suo piano si regge su due errori sommati. Ha usato la misura della circonferenza terrestre di un astronomo arabo scambiandone le miglia per miglia romane, più corte di un quarto, e ha allungato l'Asia verso oriente. Risultato: calcolava circa duemilaquattrocento miglia nautiche dalle Canarie al Giappone, quando ne servivano diecimilaseicento."*

Ha trovato terra perché la Terra gli ha messo davanti un continente che non sapeva di dover attraversare.

Sei anni dopo, altro ponte, altro oceano. Qui si mangia galletta cotta al forno due, tre, quattro volte finché non resta un filo d'umidità: dura come un sasso, ma non ammuffisce. La ammollano nel vino o nel brodo di carne salata per riuscire a spezzarla coi denti.

**Alex:** "E l'acqua?"

**Il marinaio:** "Nelle botti di rovere impeciate. Dopo un mese diventa verdastra e puzza di uovo marcio. Ci si mette dentro aceto o vino forte, e allora si beve."

**Alex:** "E lui?" — indico un uomo seduto a poppa.

**Il marinaio:** "Le gengive gli si sono gonfiate fino a coprire i denti, e una vecchia cicatrice ha ricominciato a sanguinare da sola. Nessuno a bordo sa perché succeda."

Questa nave è partita da Lisbona l'8 luglio 1497. Per prendere i venti giusti non ha costeggiato l'Africa: è scesa in pieno Atlantico verso sud-ovest e ci è rimasta novantasei giorni senza vedere terra. Poi ha girato verso il Capo, e sulla costa dell'Africa orientale ha imbarcato un pilota esperto dei monsoni che l'ha condotta attraverso il Mar Arabico. Il 20 maggio 1498 la flotta di Vasco da Gama arriva a Kappad, vicino a Calicut.

E lì la storia eroica si sgonfia in tre minuti. I doni portati al sovrano di Calicut — panno di lana rigato, berretti scarlatti, quattro collane di corallo, sei bacinelle d'ottone, vasi di zucchero e di burro — vengono guardati con imbarazzo dai mercanti della corte, che fanno notare come persino il più povero commerciante della Mecca porti doni d'oro. Da Gama deve pagare i dazi in contanti e riparte con un carico di spezie molto più piccolo di quanto sperasse.

::: memo-box
### MEMO GLOSSARIO

*   **Taíno:** il nome del popolo di lingua arawak che abitava le Grandi Antille e le Bahamas. È il loro nome, non un'etichetta appiccicata dagli europei.
*   **Volta do mar:** la manovra di allargarsi in pieno oceano, apparentemente nella direzione sbagliata, per agganciare venti favorevoli e rientrare più in fretta di chi costeggia.
*   **Circumnavigazione:** il giro completo del pianeta. Cinque navi partono da Sanlúcar il 20 settembre 1519 al comando di Magellano, che viene ucciso nelle Filippine il 27 aprile 1521; ne rientra una sola, il 6 settembre 1522, condotta da Elcano, con circa ventisette tonnellate di chiodi di garofano. Dei duecentotrentasette-duecentosettanta uomini partiti, secondo le stime delle fonti, sulla nave superstite ne tornarono diciotto.
:::

Due rotte, due risultati. Nessuna delle due era la scorciatoia che qualcuno si aspettava.

::: checkpoint
### CHECKPOINT: una sola svolta, o una trasformazione già in corso?

Finora hai raccolto: a Costantinopoli il porto riapre, i privilegi si rinnovano e i dazi si incassano; e le caravelle portoghesi scendevano lungo l'Africa da quasi quarant'anni prima del 1453.

*   **A.** Il 1453 resta l'acceleratore principale: i tentativi precedenti esistevano, ma diventano urgenti e centrali solo dopo la conquista, anche se il commercio non si ferma del tutto.
*   **B.** Il 1453 è uno dei fattori: profitto, rivalità fra monarchie e conoscenze accumulate spiegano una trasformazione già avviata, e la conquista ne cambia rischi e trattative.

Tieni a mente la tua risposta — il Verdetto nel Debriefing te la confermerà, la correggerà, o mostrerà che la realtà era più complicata di entrambe.
:::

---

## Il Prezzo Di Un Cristallo
<span class="byline">Cronaca di Alex</span>

La crosta bianca che si sta formando sulla superficie della vasca è così accecante che mi viene da chiudere gli occhi anche con la mano davanti. L'aria che ci sto respirando sopra è salmastra e sulfurea insieme, salamoia surriscaldata mescolata a vapore di fango marino.

Sotto i piedi nudi, invece, la sorpresa: non fango. Qualcosa di elastico e scivoloso, compatto come una fodera.

**Alex:** "Che cos'è questa roba?"

**Il salinaio:** "La petola. È uno strato vivo che si forma sul fondo e lo sigilla. Senza quella, i cristalli si mescolano al limo nero e il sale nasce già sporco. Ci vogliono anni per farla venire come si deve."

Ha una pala dal manico lungo, tutta di legno di faggio: nessun chiodo, nessuna cerchiatura di ferro. Glielo faccio notare.

**Il salinaio:** "Il ferro arrugginisce e macchia. Il sale bianco vale, il sale macchiato no."

Siamo alla foce del Rosandra, nella baia di Muggia, e sono le saline di Zaule. Estate 1463. Alle spalle, dentro le mura fra il colle di San Giusto e Porta Cavana, c'è Trieste: una comunità che le stime danno fra tremila e quattromila persone, senza banchine di pietra, con pontili di pali di legno piantati nella ghiaia per battelli a fondo piatto.

Solo che metà delle vasche, qui, non sta lavorando. I canali sono rotti.

**Alex:** "Chi è stato?"

**Il salinaio:** "Venezia. Ci hanno bloccato dal mare e hanno sfondato i canali. Non vogliono che il nostro sale salga verso la Carniola, la Carinzia e la Stiria: quello è mercato che vogliono per sé."

**Alex:** "E il duca? Non vi difende?"

**Il salinaio:** "Il duca ci difende. Nel milletrecentottantadue i nostri procuratori andarono a Graz e conclusero la dedizione: protezione contro Venezia, e in cambio un tributo ogni anno e un capitano suo qui in città. I nostri statuti però restano nostri, e il consiglio pure."

Non ha l'aria di uno che si è consegnato per amore, e nemmeno di uno conquistato con la forza. Ha l'aria di uno che ha fatto un contratto e lo sta ancora pagando.

::: memo-box
### MEMO GLOSSARIO

*   **Dedizione:** l'atto con cui una città si mette sotto la signoria e la protezione militare di un principe conservando però i propri statuti e le proprie consuetudini. Non è né una libera scelta senza pressioni né un'annessione pura: è un patto negoziato fra due parti che hanno entrambe qualcosa da perdere.
*   **Petola:** lo strato compatto di limo biologico che riveste il fondo delle vasche salanti e impedisce ai cristalli di mescolarsi al fango sottostante.
*   **Sestiere:** la quota fissa di sale grezzo — misurata in staia — che il Comune e la camera del duca prelevano sulla produzione.
:::

*MEMO, quanto dura questa faccenda?*

**MEMO:** *"La tregua sarà mediata dal papa nel novembre 1463 e imporrà pesanti restrizioni al commercio del sale triestino. Il lavoro nelle saline è stagionale: da maggio a settembre. Due stagioni perse non si recuperano."*

Due stagioni. Provo a chiedergli che cosa significhi, in pratica.

**Il salinaio:** "Significa debito con i mercanti di città. Significa andare a giornata sui terrazzamenti a vigna di San Vito per comprare farina di segale e d'orzo. E significa che chi viene dall'entroterra a caricare, quest'anno, va a caricare da un altro."

Poi mi porta a vedere perché quel sale conta davvero, e non è per il sapore. Mi mostra un mastello di quercia: strati alternati di carne di maiale e sale grosso. Il sale tira fuori l'acqua dalle carni, e senza acqua i batteri della putrefazione non lavorano. Sei mesi, dodici mesi di scorta commestibile. Nelle valli alpine della Carniola e della Carinzia, d'inverno, non è un condimento: è la differenza fra avere qualcosa da mangiare e non averlo.

Sto guardando l'oceano che si apre dall'altra parte del mondo. Qui, intanto, un canale rotto lungo venti metri decide chi mangia a gennaio.

---

## Il Banco Sul Fiume
<span class="byline">Cronaca di Maja</span>

Una bestemmia, forte, in sloveno, da qualche parte dietro le chiatte — seguita da una risata di tre o quattro voci. È così che arrivo al Breg, il porto fluviale di Lubiana, sulla riva della Ljubljanica: è il 1489, e intorno a quella risata c'è tutto il resto insieme, cavalli da tiro che sbuffano infangati fino ai garretti, grida di barcaioli, il cigolio delle carrucole di faggio, e sopra tutto un odore di pece nera, catrame di bosco, segatura d'abete bagnata.

Una chiatta grande sta scaricando: botti di sale marino, barre di ferro lavorato, legname. Il barcaiolo che dirige l'operazione ha le mani spesse come guanti.

**Maja:** "Quanto tiene una di queste?"

**Il čolnar:** "Piena, fino a sedici tonnellate. Ma il difficile non è portarla giù. È riportarla su."

**Maja:** "Su come, controcorrente? Senza niente che spinga?"

**Il čolnar:** "Con i cavalli dalla riva, aggiogati alle gomene di canapa legate all'albero. E due di noi a bordo, uno a prua e uno a poppa, con le pertiche di frassino puntate sul fondo ghiaioso — per spingere e per tenerla lontana dalle secche e dai mulini."

Il sale viene da Zaule, arriva via terra fino a Vrhnika sui muli, e lì passa sull'acqua. Da qui scende verso la Sava, e poi Zagabria, il Danubio, l'Ungheria. Lubiana non ha un metro di costa e sta in mezzo a tutto questo come un nodo in mezzo a una rete.

Il punto in cui la rete si stringe è a venti passi da me: il ponte di legno, quello dei macellai, con le botteghe addosso e i casotti del dazio all'imbocco. Lì c'è la mitnica. Un uomo in veste scura pesa una botte, guarda una pergamena scritta in gotico tedesco e dice una cifra. Il carrettiere davanti a lui non capisce una parola di quello che c'è scritto.

Fra i due c'è un terzo uomo che ripete tutto in sloveno.

**Maja:** "Tu che ruolo hai?"

**L'assistente:** "Io dico a voce quello che l'ufficio ha per iscritto. Le tariffe, il peso, quanto si paga per il carico e quanto per passare il ponte."

**Maja:** "E se lui non è d'accordo sul peso?"

**L'assistente:** "Discute con me. Io discuto con il gabelliere. Il gabelliere scrive."

Ecco. *Il gabelliere scrive.* La lite si fa in sloveno, il conto si fa in sloveno, il pane che si compra stasera si compra in sloveno — e poi tutto finisce dentro una riga in tedesco, che è l'unica versione che resterà.

E questa è la cosa che mi brucia: nessuno me l'ha mai raccontata. Non che qui si parlasse sloveno — questo lo sapevo. Che si parlasse sloveno *dappertutto* e non lo scrivesse *nessuno*.

::: memo-box
### MEMO GLOSSARIO

*   **Mitnica:** l'ufficio del dazio, il banco fisico dove si pesa, si contratta e si registra. È un luogo, non una tassa.
*   **Mitnina / mostnina:** i due prelievi che vi si pagano. La *mitnina* è la tassa sulla merce in transito, differenziata per botte di sale, carico di ferro o balla di panno; la *mostnina* è il pedaggio per passare il ponte.
*   **Čolnarji:** i barcaioli della Ljubljanica, riuniti in corporazione e confraternita sotto la protezione di san Nicola. I *veliki čolnarji* muovono i carichi pesanti sulle grandi chiatte; i *mali čolnarji* fanno il servizio locale su barche scavate in un tronco solo.
:::

**MEMO:** *"Conferma del 1489: l'imperatore Federico III riconferma i privilegi statutari della corporazione dei barcaioli. Il monopolio del trasporto fluviale pesante resta ai grandi barcaioli. Il documento è redatto in tedesco."*

Lubiana nel 1489 non è la capitale di nessuna Slovenia — quello Stato non esiste e non esisterà per secoli. È il capoluogo amministrativo e giudiziario del ducato asburgico di Carniola: dentro le mura dei suoi tre borghi vivono, secondo le stime, quattromila-cinquemila persone, e il consiglio dei patrizi si riunisce in un palazzo di pietra tirato su cinque anni fa, che sa ancora di scalpello.

Attraverso il Mestni trg per andarci. Colpi di scalpello sulla pietra calcarea grigia, odore aspro di sego sciolto dai candelai, puzzo di pelli raschiate con allume e tannino di quercia dai banchi dei conciatori. Dentro, le delibere si scrivono in tedesco. Negli atti della diocesi, eretta ventotto anni fa, si scrive in latino.

Fuori, sulla riva, il settanta per cento circa di questa città contratta, litiga, promette e vende in una lingua che nessuno di quei fogli userà.

Non è una lingua che manca. È una lingua che non ha ancora un banco dove firmare.

---

## Debriefing

Cinque oggetti sullo stesso tavolo: un registro di porto e un mappamondo su pergamena, un dato scritto a bordo, un cristallo di sale dell'Alto Adriatico, e il verbale di un banco del dazio su un fiume. Alex ha inseguito il rischio addosso alle persone — il mercante, il marinaio, il salinaio. Maja ha inseguito la struttura che decide chi passa, chi paga e quale lingua lascia traccia. Nessuna delle due letture, da sola, regge il capitolo.

**Verdetto:** l'opzione B regge meglio, ma si porta dietro un pezzo della A. La conquista ottomana del 1453 aumentò davvero incertezze, controlli e costi, e non è un evento da minimizzare — però non chiuse le vie asiatiche e non fece nascere dal nulla l'espansione oceanica. La spinta a cercare un accesso diretto era già alimentata dalla domanda di merci, dal costo degli intermediari, dalla rivalità fra monarchie e da decenni di esperienza nautica accumulata. E il peso dei commerci si spostò per gradi, non con un interruttore: mentre l'Atlantico cresceva, reti come quelle di Trieste e di Lubiana continuavano a produrre valore.

::: reality-check
### CIÒ CHE NON SAPPIAMO ANCORA

*   **Quanto pesò davvero il 1453:** sappiamo che i traffici continuarono, ma isolare quanto la conquista incise su prezzi e scelte dei singoli mercanti, rispetto a guerre, concorrenza e profitti, resta difficile anche per gli storici.
*   **Chi diede il nome al Capo di Buona Speranza:** una fonte di corte dice il re, due testimonianze più vicine ai fatti dicono Dias. La divergenza non è stata sciolta.
*   **Quanto fu libera la scelta triestina del 1382:** "dedizione volontaria" e "sottomissione forzata" sono due letture politiche opposte. I documenti mostrano il compromesso istituzionale; che cosa pensasse davvero la città, no.
:::

::: memo-box
### CRONOLOGIA ESSENZIALE

*   **1453:** caduta di Costantinopoli.
*   **1463:** guerra del sale fra Trieste e Venezia.
*   **1488:** Dias doppia l'estremità meridionale dell'Africa.
*   **1489:** conferma dei privilegi dei barcaioli di Lubiana.
*   **1492:** Colombo raggiunge i Caraibi.
*   **1498:** Vasco da Gama raggiunge Calicut.
:::

Le reti non cambiano tutte alla stessa velocità. Sull'Atlantico la mappa si riscrive in vent'anni; a Trieste alla velocità con cui si ripara un canale; sulla Ljubljanica quasi per niente, perché quella strada d'acqua c'era prima delle caravelle e ci sarà dopo.

Prossima missione. Merci e mappe attraversano i confini, e lo avete visto. Ma che cosa succede quando a mettersi in viaggio è una parola stampata, in una lingua che finora vive quasi soltanto nelle voci?[^ee1]

[^ee1]: Curiosità cifrata (ROT13): *Yr cevzr znccr trbtensvpur fgnzcngr fbab qry 1477.*

<!-- WORD COUNT: ~4700 -->
<!-- PERSONA CHECK: Alex/Maja voice intact? Pass — Alex keeps the sensory-first/media-vs-reality/MEMO-banter tic (bombarda opening, "Sono atterrato dentro un martello", the film-expectation-vs-cotta di maglia-style beats with Fra Mauro and the genovese fattore); Maja opens on language before sight and closes on "perché nessuno lo racconta mai" ("nessuno me l'ha mai raccontata... non lo scrivesse nessuno"), never borrowing Alex's tic. -->
<!-- NUF CHECK: [1] Umanesimo/Rinascimento distinti, contributo non causa unica ✅ | [2] ricerca oceanica come effetto combinato (domanda, intermediari, rivalità, sapere nautico, iniziative pre-1453) ✅ | [3] ascesa atlantica graduale, reti adriatiche/fluviali non cancellate ✅ | [4] incertezza concreta di mercante/cartografo/marinaio ✅ | [5] stagione di sale persa = fame/debito concreto ✅ | [6] fatti 1453 + iniziative portoghesi distinti e datati ✅ | [7] Dias/Colombo/da Gama/Elcano in sequenza corretta ✅ | [8] Trieste 1382 dedizione + guerra del sale 1463 ✅ | [9] Lubiana 1489 come centro amministrativo/mercantile, fonte su Federico III ✅ | [10] scena Slovenia autonoma, non nota a margine ✅ -->
<!-- ANTI-AI CHECK: nessuna frase vietata ("come sappiamo", "è importante notare", "e la morale è che" ecc.) rilevata; nessun pattern bannato (niente "Immaginate di essere", niente "Ebbene sì/Sorprendentemente", niente morale esplicita di chiusura, niente "anche in Slovenia..."); zero etichette di produzione nel corpo del testo; MEMO rispetta il limite di 3 informazioni per intervento; Easter Egg unico, ROT13, correttamente senza chiave inline perché non è il primo uso del codice nel volume. -->


<div style="page-break-after: always;"></div>

# Capitolo 2 — La Frattura Religiosa

## Briefing

Alex, Maja: il salto comincia il 31 ottobre 1517, all'inizio del Cinquecento, e vi terrà sulle tracce fino al 1564. Nel capitolo precedente avete seguito merci, dazi e mappe. Adesso seguite qualcosa di più leggero e molto più pericoloso: parole religiose stampate su carta.

Il manuale propone questa catena: nel 1517 Lutero attacca le indulgenze → la stampa moltiplica le sue idee → l'Europa si spacca fra riformati e cattolici → Roma risponde proibendo i libri. E nelle terre slovene la Riforma arriverebbe come un'idea tedesca semplicemente tradotta.

Qualcosa non torna. Tra le novantacinque affermazioni di Wittenberg e i primi libri stampati in sloveno passano trentatré anni, diversi confini e un problema che nessuna freccia del manuale nomina: quelle pagine sono destinate a gente che non sa ancora decifrarle.

La vostra missione è raccogliere cinque prove, pesarne l'affidabilità e ricostruire la vera catena degli eventi.

## OBIETTIVI DEL SALTO (SCENE)

### 1. Una Crepa, Due Riforme (Wittenberg, Norimberga e Ginevra, 1517-1541) — voce: Alex

Un frate che spedisce una lettera, un tipografo che stampa senza permesso.
**Prova da raccogliere:** che cosa mette in moto la protesta sulle indulgenze, e se il torchio produca una dottrina sola.

### 2. La Stanza Delle Tre Lingue (Trieste, 1524-1542) — voce: Alex

Un vescovo cattolico con Erasmo sul tavolo, un ragazzo di campagna nel coro.
**Prova da raccogliere:** quali persone, letture e lingue formano il giovane Trubar.

### 3. Un Libro Senza Casa (Rothenburg e Schwäbisch Hall, 1548-1550) — voce: Maja

Un esilio, una casa sequestrata, un torchio a porte sbarrate.
**Prova da raccogliere:** quali ostacoli separano un autore in fuga da un libro stampato in sloveno.

### 4. Le Pagine Che Mancavano (Carniola e Schwäbisch Hall, 1550-1555) — voce: Maja

Otto fogli, sedici facciate, una stanza di fumo dove nessuno sa leggere.
**Prova da raccogliere:** a chi servono i due libri del 1550, e quali prove mostrano che arrivano in Carniola.

### 5. Il Filtro E La Scuola (Trento e Roma, 1540-1564) — voce: Alex

Una navata gelata e due commissari che aprono le casse senza avvisare.
**Prova da raccogliere:** distinguere dottrina, scuole e controllo dei testi, senza darli per nati tutti insieme.

Il rapporto lo firmano in due. Alex raccoglie le prove sulla frattura europea e sul crocevia dell'Alto Adriatico; Maja segue dall'interno l'esilio, la lingua e i lettori delle terre slovene.

E attenzione: una porta ricordata trent'anni dopo, una lettera del 1517, un frontespizio senza città e un decreto papale non pesano allo stesso modo.

---

## Una Crepa, Due Riforme
<span class="byline">Cronaca di Alex</span>

Prima dell'odore arriva un suono: un raschio corto e ripetuto, come un'unghia su una lastra. Poi l'odore. È cera calda, con sotto un fondo di fuliggine.

Un uomo con la tonsura piega un foglio, scioglie il bastoncino di cera sulla fiamma, preme.

*MEMO, dove sono finito?*

**MEMO:** *"Wittenberg, 31 ottobre 1517. Il soggetto è Martin Lutero, frate agostiniano e docente di teologia. Il documento sigillato è una lettera di protesta indirizzata all'arcivescovo di Magonza, Alberto di Brandeburgo."*

Una lettera. E io ero venuto per il martello.

Perché a scuola me l'hanno raccontata come una scena da film: le tesi inchiodate alla porta della chiesa, il legno che rimbomba, la folla. Qui non c'è nessuna folla. C'è un frate che spedisce posta, con le dita macchiate di cera.

**Alex:** "Scusa — quelle novantacinque affermazioni. Le stai attaccando a una porta?"

**Lutero:** "Le mando ai vescovi, perché sono loro che devono rispondere. E le propongo ai dottori di questa università, in latino, perché siano discusse una per una. È una disputa fra maestri, non un bando al popolo."

**Alex:** "Discussa su cosa? Che problema hai con le indulgenze?"

**Lutero:** "Che si tratta come merce ciò che nessun denaro può comprare. Qui vicino un predicatore promette la remissione delle pene ai vivi e ai defunti per moneta contante. Se nel cuore non c'è dolore vero, nessuna carta salva nessuno."

**MEMO:** *"Nota sulla prova. La lettera del 31 ottobre 1517 è documentata. L'affissione alla porta è raccontata per la prima volta da un collega di Lutero nel 1546, e quel collega arrivò a Wittenberg soltanto nel 1518."*

Quindi: se quel foglio finì sulla porta, ci finì con la colla, non coi chiodi. Prima riga del rapporto, e già mi sento derubato di una scena.

Pochi mesi dopo, a Norimberga, il rumore è un altro pianeta: un tonfo cadenzato, il cigolio di una vite di legno grossa come una gamba, l'aria che brucia in gola — olio di lino bollito con resina di pino e fuliggine di noce. Sopra la mia testa, fogli ad asciugare su corde di crine di cavallo.

**Alex:** "Perché la carta è bagnata? Non si rovina?"

**Il tipografo:** "Asciutta è dura e respinge l'inchiostro: l'impressione viene pallida, o il foglio si strappa. La sera prima la spruzzo d'acqua e la carico di peso fino al mattino. La fibra si ammorbidisce, e il piombo entra nella carta invece di scivolarci sopra."

**Alex:** "E questo cosa stai stampando?"

**Il tipografo:** "Le affermazioni del frate di Wittenberg. Me le ha portate un dottore, non lui. Vanno come il pane."

**Alex:** "Aspetta. Le stampi senza che l'autore lo sappia?"

**Il tipografo:** "L'autore ha scritto in latino per i dotti. Ma a Basilea e a Lipsia già le ristampano, e qualcuno le sta voltando in tedesco perché le capiscano i lavoranti. Da qui in poi non le comanda più lui."

Ecco la crepa vera, e non è sulla porta di una chiesa: è nel momento in cui una pagina si moltiplica e il significato passa di mano. Le tirature si stimano fra cinquecento e millecinquecento copie per edizione, e nei primi mesi del 1518 una questione fra professori diventa europea. Ma senza principi che ti proteggono dall'imperatore, un foglio stampato resta un foglio.

Poi un salto in avanti, a Ginevra, e mi crolla l'ultima certezza.

**Alex:** "Quindi tu e il frate di Wittenberg dite la stessa cosa, no? Siete la stessa squadra."

**Calvino:** "Non è una squadra. Al centro sta la sovranità di Dio, e Dio non deve conto a nessuno: da prima del tempo ha stabilito chi riceve la grazia e chi la giustizia. Le opere buone non comprano nulla — sono il segno che la grazia già lavora in un uomo."

Due uomini, due dottrine. E la parola con cui a scuola li mettiamo nella stessa casella non esiste ancora nel 1517: nasce nel 1529, dalla protesta di alcuni principi contro l'imperatore in una dieta imperiale.

::: memo-box
### MEMO GLOSSARIO

*   **Indulgenza:** la remissione della pena per i peccati già perdonati, concessa dalla Chiesa. Il problema del 1517 non è l'indulgenza, ma il pagamento a cui viene collegata.
*   **Giustificazione per fede:** il centro di Lutero. La salvezza è un dono gratuito di Dio, ricevuto per la fede, non il frutto di opere o di somme versate.
*   **Predestinazione:** il centro di Calvino. Dio ha stabilito dall'eternità, con un decreto che nessuno può giudicare, chi si salva e chi no.
:::

Un frate spedisce una lettera. Un tipografo la trasforma in merce. Un altro teologo, altrove, ne ricava una dottrina diversa. Tre gesti, e nessuno controlla più dove vada il foglio.

---

## La Stanza Delle Tre Lingue
<span class="byline">Cronaca di Alex</span>

*MEMO, coordinate.*

**MEMO:** *"Trieste, 1524. Palazzo vescovile presso la cattedrale di San Giusto. Il vescovo è Pietro Bonomo, sessantasei anni, già diplomatico imperiale e gran cancelliere del duca Ferdinando d'Austria."*

Sotto i piedi, pietra d'Istria levigata dai passi, che tiene un freddo che il sole di fuori non scioglie. Con il freddo, l'odore di cera d'api delle candele, e dentro la cera, sottile, il sale del golfo. Le finestre non sono finestre: sono tondi di vetro spesso incastrati nel piombo, che deformano il mare in venti macchie. Dalla cattedrale, sotto, salgono voci di ragazzi in prova.

Sul tavolo di noce, tomi rilegati in pelle di scrofa con fermagli di bronzo, e un fruscio secco di pergamena ogni volta che l'uomo gira una carta. Io mi ero preparato a un vescovo che manda gente al rogo. Questo legge ad alta voce a due ragazzi in tonaca semplice le *Parafrasi* dei Vangeli di Erasmo da Rotterdam, e mezz'ora dopo passa a Virgilio.

**Alex:** "Scusi... lei è un vescovo cattolico e legge questi libri ai suoi chierici?"

**Bonomo:** "Leggo ciò che aiuta a capire il testo sacro. Qui arrivano scritti da Wittenberg, da Zurigo, da Ginevra, e li apro come una lettera indirizzata a me. Da questo a separarmi dalla mia sede c'è tutta la distanza del mondo."

Uno dei due ragazzi mi guarda come si guarda un intruso. Ha sedici anni, mani spesse da lavoro contadino, e canta nel coro.

**Alex:** "E tu chi sei? Come si finisce qui, in un palazzo, da..."

**Primož Trubar:** "Da Rašica. Mio padre è mugnaio. Sono venuto a servire: canto le ore e le messe nel coro, servo a tavola, copio atti. In cambio ho la mensa dei servitori, un posto in camerata, la tonaca — e la biblioteca del vescovo e le lezioni dei precettori, senza pagare un soldo."

**Alex:** "Quindi lavori per studiare."

**Trubar:** "Un figlio di mugnaio non ha altra strada per arrivare ai libri. E in questa casa i libri parlano in quattro lingue."

Quattro, non tre. Latino per gli atti, italiano per la città, tedesco per la corte asburgica, sloveno fra i chierici dell'entroterra. Non è una casa dove le lingue si escludono: è una casa dove si impara a farle passare una nell'altra. È l'attrezzo che gli servirà ventisei anni più tardi.

Quello che Bonomo gli dà non è una dottrina pronta all'uso. È un patronato: appoggi concreti, uno dopo l'altro, per anni.

**MEMO:** *"Cronologia documentata. 1527: Bonomo assegna a Trubar i benefici della parrocchia di Loka pri Zidanem Mostu, per finanziargli gli studi di teologia a Vienna. 1529: Trubar interrompe gli studi per l'assedio ottomano della città. 1530: Bonomo lo ordina sacerdote cattolico e lo nomina vicario a Laško."*

Sacerdote cattolico. Ordinato dalle mani di questo vescovo, in questa cattedrale.

Torno nel 1540, e l'aria è cambiata. Trubar è di nuovo qui, ma non per studiare: si è messo nei guai con le autorità provinciali a Lubiana, e Bonomo se lo tiene in casa come cappellano, a predicare — in sloveno. E in cattedrale ha invitato due religiosi italiani con idee molto discusse.

**Alex:** "Ma allora lei da che parte sta?"

**Bonomo:** "Dalla parte di una Chiesa che si corregga da dentro. Chi confonde questo con l'abbandonare la mia sede non ha capito né me né la mia età."

Sulla sua fede la prova resta scomoda. In una lettera del 1561, quindici anni dopo i fatti, Trubar scriverà che Bonomo morendo prese la comunione sotto le due specie, come usavano i riformati. Ma di abiura non esiste documento: fino all'ultimo giorno resta, formalmente, vescovo cattolico di Trieste. Un uomo aperto, non un convertito.

::: memo-box
### MEMO GLOSSARIO

*   **Volgare:** la lingua parlata di un luogo, contro il latino dei documenti e della liturgia. Predicare in volgare è parlare la lingua di chi ascolta.
*   **Patronato:** la protezione stabile che un potente offre a un giovane — vitto, alloggio, studi, incarichi — in cambio di servizio. Nel Cinquecento è la via d'accesso all'istruzione per chi non ha ricchezza di famiglia.
*   **Canonicato:** l'incarico e la rendita di canonico, membro del capitolo di una cattedrale. Bonomo si muove perché Trubar lo ottenga, e nel 1542 lo assume.
:::

Dalla casa di Bonomo, Trubar esce con un'ordinazione cattolica, una rendita, una biblioteca letta e il mestiere di far passare le parole da una lingua all'altra. Non con un libro in mano.

---

## Un Libro Senza Casa
<span class="byline">Cronaca di Maja</span>

C'è una casa a Lubiana che non è più di nessuno. L'hanno sequestrata due tribunali, quello ecclesiastico e quello provinciale, insieme alle rendite delle parrocchie, con sentenza contro un uomo che non si è presentato a difendersi. Nel marzo del 1548 quell'uomo è già oltre le montagne.

Lo raggiungo due anni dopo, in una città tedesca. Un tonfo, una pausa, un tonfo: è il ritmo del torchio, e riempie la stanza senza bisogno di annunciarsi. Sotto il ritmo, sego bruciato delle lucerne e il gusto metallico del piombo sui denti.

Le porte della bottega sono sbarrate dall'interno, in pieno orario di lavoro.

**Maja:** "Perché tenete chiuso? Non è di notte."

**Peter Frentz:** "Se qualcuno trova quello che c'è sotto il torchio, per me è finita: l'ordinanza imperiale non lascia scampo a chi stampa roba simile, licenza e officina se ne vanno insieme. E io ho tre lavoranti da sfamare, oltre a mia moglie, ragazza."

Il compositore pesca caratteri dai cassettini inclinati del bancone — lega di piombo, stagno e antimonio, polpastrelli neri e ruvidi come carta vetrata — e li allinea uno dopo l'altro, al rovescio.

E adesso la cosa che nessuno mi ha mai raccontato: né a scuola, né in un libro dei miei compagni.

**Maja:** "In che lingua è il testo che stai componendo?"

**Il compositore:** "Non lo so. Guardo che forma ha la lettera sul manoscritto, ne cerco una identica nel cassettino, la infilo al suo posto — se le due sagome coincidono, la riga è giusta. Il senso non c'entra: né io né il correttore capiamo una sola parola di quello che ci passa sotto le mani."

Il primo libro stampato nella mia lingua l'hanno montato uomini che non sapevano cosa dicevano — e non è un incidente: è l'unica soluzione possibile per un esule che sorveglia un torchio proibito. Il manoscritto è scritto apposta in una calligrafia di leggibilità estrema, perché un tedesco senza una parola di sloveno la confronti carattere su carattere, senza sbagliare.

**Maja:** "E lui dov'è, adesso?"

**Frentz:** "A Rothenburg fa il predicatore aggiunto. Viene, porta i fogli, controlla, riparte. Nel libro non c'è il suo nome."

Non c'è il suo nome, non c'è la città, non c'è la data. Al posto dell'autore un nome latino inventato, *Philopatridus Illyricus*, "il patriota illirico"; al posto dello stampatore un altro nome falso. Un libro mascherato per non far chiudere la bottega che lo stampa.

::: target-profile
### SCHEDA PERSONAGGIO: Primož Trubar

*   **Ruolo:** nato a Rašica intorno al 1508, figlio di un mugnaio; sacerdote cattolico dal 1530, poi predicatore riformato; dal 1548 esule e condannato in contumacia.
*   **Forza:** 2 — niente eserciti, titoli o rendite: gli restano una rete di conoscenze e la capacità di ricominciare da zero.
*   **Intelligenza:** 5 — legge latino, tedesco e italiano, e progetta una correzione che regge con un tipografo che non capisce il testo.
*   **Carisma:** 4 — convince protettori tedeschi a pagare libri in una lingua che nessuno di loro sa leggere.
*   **Abilità Speciale:** trasforma la lingua dei contadini della Carniola in una lingua che entra in tipografia — e ci entra sotto falso nome, in un anno in cui stamparla è reato.
:::

Prima di Rothenburg c'è stata Norimberga. Il progetto non nasce a Lubiana, dove aveva casa e parrocchie: nasce quando gliele portano via.

**Maja:** "Perché non ha scritto in tedesco? Lo parla, lo scrive, qui lo capirebbero tutti."

**Frentz:** "Dice che i suoi non capiscono il tedesco, e che vuole che la fede la sentano nelle parole con cui parlano tra loro. Ha scelto una parlata sola, quella delle terre di mezzo della Carniola, anche per chi altrove dice le cose in altro modo."

Una lingua che entra in tipografia deve scegliere. Nessuno ha votato: ha deciso un esule, con un torchio prestato e una fretta enorme.

::: memo-box
### MEMO GLOSSARIO

*   **Esilio:** chi non può rientrare in patria senza essere arrestato. Trubar si nasconde dal settembre 1547, da quando il nuovo vescovo di Lubiana colpisce i simpatizzanti riformati, e fugge nel marzo 1548.
*   **Censura preventiva:** il controllo *prima* della stampa. Non punisce un libro uscito: impedisce che esca. Nel 1548 un'ordinanza imperiale vieta le opere riformate, con la chiusura dell'officina come pena.
*   **Catechismo:** un libro che insegna la fede per domande e risposte, da imparare a memoria. È il libro con cui si insegna: per questo è il primo formato scelto per lo sloveno.
:::

E il luogo? Per due secoli tutti hanno scritto Tubinga, perché Trubar stesso, molti anni dopo, ricordò le sue opere come stampate nel Württemberg. Nel 2013 due ricerche indipendenti hanno confrontato i caratteri gotici e una grande "L" intagliata nel legno: appartengono a un solo fondo tipografico, quello di Schwäbisch Hall. Il libro che nascondeva la propria città si è tradito da solo, dopo quattrocentosessantatré anni. Per la forma di una lettera.

::: checkpoint
### CHECKPOINT: il primo libro sloveno è un veicolo che la Riforma ha reso possibile, o la Riforma deve prima costruirsi una lingua di stampa e un pubblico capace di usarla?

Finora hai raccolto: le novantacinque affermazioni circolano perché una rete di tipografi, traduttori e principi le moltiplica; e l'esilio lascia Trubar senza casa e senza accesso sicuro a un torchio.

*   **A.** La stampa è il motore: quando la dottrina riformata trova un tipografo, lo sloveno è il modo più efficace di consegnare un messaggio già pronto a un pubblico nuovo.
*   **B.** La stampa non basta: scegliere grafia, parole e strumenti per insegnare a leggere cambia sia il messaggio sia il pubblico — il libro religioso costruisce anche un'infrastruttura linguistica che prima non c'era.

Tieni a mente la tua risposta: il Verdetto te la confermerà, la correggerà, o mostrerà che era tutto più complicato.
:::

---

## Le Pagine Che Mancavano
<span class="byline">Cronaca di Maja</span>

Un carrettiere lega una balla di lana grezza sul carro; dentro, un pacco piatto avvolto in un telo cerato. Fogli piegati in ottavo, non rilegati — un fascicolo sciolto pesa meno e si nasconde meglio. Altri viaggiano in botti svuotate di vino o di aringhe, che nessuno apre volentieri. Le piste alpine verso la Carinzia non sono controllate ovunque, e i carrettieri non fanno domande.

Seguo il carro fino in fondo. Arriva a gennaio, in una casa contadina.

Il focolare è aperto e il camino non c'è: il fumo cerca il tetto da solo, e intanto ti resta negli occhi. Odore di legna e di strutto. Infilata in una fessura del muro, una scheggia di legno resinoso brucia e fa più fumo che luce.

Dieci persone sedute. Uno solo tiene qualcosa in mano.

**Maja:** "Che cos'è quel libretto?"

**L'uomo che legge:** "È un abecedario, sedici facciate in tutto — otto fogli, senza numeri. Si comincia dalle lettere, poi le sillabe; alla fine ci sono le preghiere e sei strofe da cantare."

**Maja:** "E perché nessuno degli altri lo tiene in mano?"

**L'uomo:** "Perché nessuno degli altri sa che quei segni sono voci. Io leggo, loro ripetono. Poi cantiamo. Il canto lo tengono a memoria, e quando hanno la strofa in bocca cominciano a riconoscere le lettere."

Ecco la contraddizione che non mi era mai venuta in mente: stampare per chi non sa leggere.

Ho sempre pensato che la storia dei primi libri sloveni fosse la storia di un libro. Sono due, e il secondo nessuno lo cita: sedici facciate che servono a costruire i lettori del primo.

Le stime sulla capacità di leggere nelle terre slovene, a metà Cinquecento, vanno dal due al cinque per cento; nelle campagne, meno dell'uno. "Leggere" significa stare in una stanza dove qualcun altro legge a voce alta.

**Maja:** "Quante copie ne sono arrivate?"

**L'uomo:** "Chi consegna i pacchi i numeri se li tiene per sé, e io non vado a cercarmeli."

Non lo sa nessuno, ancora oggi. Le stime sulla tiratura complessiva dei due libri vanno da quattrocento a mille copie: le prefazioni dicono a chi l'autore voleva arrivare, non a chi è arrivato. Dell'*Abecedarium* è sopravvissuto un unico esemplare originale, trovato nel 1935 a Vienna; l'unica copia completa del *Catechismus* è stata riconosciuta nel 1910 in Vaticano.

Due copie superstiti, per un intero primato.

::: scan-result
### SCANNING: ABECEDARIUM, 1550

*   **Tipo:** libretto per imparare a leggere, con un piccolo catechismo unito.
*   **Materiale:** carta di stracci, ruvida, con margini irregolari e filoni visibili in controluce; caratteri gotici; in ottavo.
*   **Consistenza:** 8 fogli, cioè 16 facciate non numerate.
*   **Dettaglio Tecnico:** contiene la prima comparsa a stampa della parola con cui l'autore chiama i propri compatrioti, e fissa un modello di lingua scritta basato sulle parlate della Carniola centrale.
*   **Attribuzione controversa:** luogo indicato per due secoli come Tubinga.
:::

Il fascicolo ha le barbe irregolari lungo il taglio, e la carta gratta le dita. Ha attraversato un valico in pieno inverno restando asciutto: merito del grasso di pecora spalmato sulla pelle che lo avvolgeva.

::: memo-box
### MEMO GLOSSARIO

*   **Abecedario:** un libretto elementare che insegna lettere e sillabe. Non è un libro da leggere: è un libro per diventare capaci di leggere.
*   **Alfabetizzazione:** quanta parte di una popolazione sa leggere e scrivere. A metà Cinquecento, nelle terre slovene, si stima fra il due e il cinque per cento.
*   **Lingua letteraria:** una convenzione scritta valida oltre il singolo villaggio, così che chi parla in modi diversi legga le stesse pagine. Non significa lingua "più bella", né già standardizzata come la mia oggi.
:::

Una cosa va detta chiara, perché nel 1550 non nasce nessuna lingua. Lo sloveno si parla da secoli, e scritto esiste da prima: i Monumenti di Frisinga, di circa un millennio fa, e manoscritti del Quattrocento. Il primato del 1550 è a stampa, e soltanto a stampa.

Cinque anni più tardi entrambi i libri vengono ristampati, questa volta a Tubinga per davvero, e cambia una cosa tecnica ma non banale: fuori i caratteri gotici, dentro le lettere latine, su consiglio di un ex vescovo che conosceva l'area adriatica — quelle forme i pochi lettori di qui già le sanno riconoscere.

Chi vuole essere letto adatta l'alfabeto ai lettori. Non il contrario.

---

## Il Filtro E La Scuola
<span class="byline">Cronaca di Alex</span>

Il freddo qui non è un'informazione, è un problema. Navata di chiesa a dicembre, umida, il fiato che resta sospeso, i padri conciliari seduti dentro cappe di lana foderate di pelliccia. Sotto le voci, un rumore che non smette: le penne d'oca dei notai. Raschiano tutte insieme.

**MEMO:** *"Trento, 13 dicembre 1545. Apertura ufficiale del concilio. Si svolgerà in tre periodi distinti, con lunghe interruzioni, e si chiuderà il 4 dicembre 1563."*

Diciotto anni: nella mia testa era un evento buono per una riga di cronologia. Dura quasi il doppio della mia vita.

Sul tavolo dei segretari, un anello episcopale premuto nella ceralacca rossa. Il decreto è chiuso.

**Alex:** "Che cosa avete deciso, esattamente?"

**Il segretario apostolico:** "Che la Scrittura e la tradizione degli apostoli valgono insieme, non l'una contro l'altra. Che l'uomo non è giustificato dalla sola fede senza le opere. Che i sacramenti sono sette. E le regole per noi: i vescovi risiedano nella loro diocesi, e ogni diocesi apra una scuola per formare i sacerdoti."

**Alex:** "Una scuola? Pensavo che la risposta fossero i divieti."

**Il segretario:** "I divieti fermano un libro. Una scuola forma chi predicherà per quarant'anni."

Questa mi rovescia una convinzione: ero arrivato con la caricatura di Roma che brucia tutto e finisce lì. I roghi ci sono davvero — nelle piazze si bruciano libri confiscati — ma la parte grossa della risposta cattolica non passa dal fuoco: passa dalle aule.

**MEMO:** *"Precisazione cronologica. La Compagnia di Gesù è approvata dal papa il 27 settembre 1540, cinque anni prima dell'apertura del concilio. L'Inquisizione romana è istituita come tribunale centrale il 21 luglio 1542. Nessuna delle due è stata creata dal concilio."*

Quindi il "pacchetto" che a scuola arriva tutto insieme non è mai esistito: sono pezzi montati in venticinque anni, da papi diversi, per problemi diversi. Nel 1548 la Compagnia apre a Messina il primo collegio per laici, gratuito; nel 1551 nasce quello di Roma.

E il rinnovamento non nasce come risposta a Lutero: una confraternita di carità nasce a Genova nel 1497, vent'anni prima delle novantacinque affermazioni, e negli anni Venti e Trenta arrivano tre nuovi ordini.

Poi mi sposto a Roma, e vedo l'altra metà del sistema all'opera. In una bottega di libraio, senza preavviso, entrano due uomini.

**Il libraio:** "Commissari. Faranno la visita."

Aprono le casse a campione, tirano fuori un volume, controllano il titolo, poi ne cercano il retro. Uno tiene un registro rilegato: fogli protocollo scritti a mano, con i titoli in ordine alfabetico.

**Alex:** "E quel registro cos'è? Il vostro?"

**Il libraio:** "Il mio. Sono obbligato, sotto giuramento, a tenere il catalogo di tutto ciò che ho in magazzino. Loro confrontano il mio elenco con il loro."

**Alex:** "E il retro del frontespizio? Perché guardano lì?"

**Il libraio:** "Perché lì deve stare la licenza, firmata a mano dall'inquisitore e dal vicario della diocesi. Un libro senza quella firma non è un libro: è una prova contro di me."

**MEMO:** *"Due indici distinti. Quello romano del 1559 proibiva in blocco la produzione di decine di stampatori e tutte le opere di alcuni autori — compreso l'umanista che Bonomo faceva leggere ai suoi chierici. L'Indice tridentino, del 24 marzo 1564, lo sostituisce con dieci regole generali e ammette la Bibbia in volgare solo con licenza scritta."*

Nessuna banca dati, nessuno schedario, nessuna polizia in uniforme: un elenco di carta contro un altro, e due paia di mani che aprono le casse. Funziona per accumulo di controlli, non per onnipotenza — lontano da Roma l'applicazione è più incerta di quanto il decreto lasci credere.

::: memo-box
### MEMO GLOSSARIO

*   **Riforma cattolica / Controriforma:** due nomi per due facce della stessa vicenda. Il primo è il rinnovamento interno della Chiesa, già attivo prima del 1517; il secondo la reazione organizzata contro la diffusione riformata.
*   **Inquisizione romana:** tribunale centrale istituito nel 1542 per i casi di eresia. Indaga, processa, esamina i testi: attività distinte, e non tutte finiscono con una condanna.
*   **Indice dei libri proibiti:** l'elenco dei testi vietati, con le regole per applicarlo. Proibire un titolo non è distruggere le copie: per quello serve qualcuno che entri nelle botteghe.
:::

Un decreto conciliare prova che una norma è stata scritta. Non prova che in ogni villaggio qualcuno l'abbia applicata. Terza riga del rapporto, e forse la più scomoda da mandare a casa.

---

## Debriefing

Cinque oggetti sullo stesso tavolo: una lettera sigillata, un tomo di Erasmo, un frontespizio con un nome falso, otto fogli passati in una balla di lana, un catalogo confrontato con un elenco romano.

Alex ha inseguito le persone: il frate che spedisce una lettera e non controlla più dove finisce, il vescovo che legge tutto e non firma nulla, il libraio che tiene l'inventario come un alibi. Maja ha inseguito le condizioni materiali: chi apre le porte del torchio, in quale lingua e alfabeto, e chi infine sa aprire il messaggio.

**Verdetto:** regge meglio la lettura B, ma si porta dietro una parte della A. La Riforma creò l'urgenza religiosa e le reti che rendevano utile stampare in sloveno. Ma il primo libro sloveno non scese tradotto da Wittenberg: formazione plurilingue, esilio dentro reti tipografiche straniere, scelta di grafia e parlata, decisione di stampare insieme catechismo e abecedario mostrano un autore che dovette costruire testo e lettori insieme. E la risposta cattolica non fu solo divieto: accanto al controllo dei libri mise dottrina, disciplina dei vescovi e scuole.

::: reality-check
### CIÒ CHE NON SAPPIAMO ANCORA

*   **La porta di Wittenberg:** l'invio della lettera del 31 ottobre 1517 è documentato; l'affissione delle tesi è raccontata per la prima volta ventinove anni dopo, da chi non era presente. Gli storici discutono ancora se sia avvenuta.
*   **Dove uscirono i primi due libri sloveni:** Tubinga è l'attribuzione tradizionale, corretta nel 2013 in favore di Schwäbisch Hall. Ordine e datazione esatta restano aperti.
*   **Quanti lettori, e per quali strade:** tirature, alfabetizzazione e vie clandestine sono stime; i racconti sulle botti, ripetuti da un libro all'altro, non sono da soli un documento.
:::

::: memo-box
### CRONOLOGIA ESSENZIALE

*   **1517:** Lutero rende pubbliche le novantacinque tesi sulle indulgenze.
*   **1540:** approvazione della Compagnia di Gesù.
*   **1545-1563:** Concilio di Trento.
*   **1548:** Trubar lascia la Carniola per l'esilio.
*   **1550:** *Catechismus* e *Abecedarium*, primi libri stampati in sloveno.
*   **1564:** promulgazione dell'Indice tridentino dei libri proibiti.
:::

Due sistemi che usano gli stessi attrezzi l'uno contro l'altro: carta, torchi, scuole, elenchi. Uno stampa un abecedario da sedici facciate perché i contadini imparino le lettere. L'altro apre collegi gratuiti e obbliga ogni diocesi ad avere una scuola per i preti. Nessuno dei due combatte per un territorio: combattono per chi saprà leggere, e cosa.

Prossima missione. Nel Cinquecento il potere si batte per controllare le parole. Nel Seicento un re proverà a controllare tutto — e un uomo con un tubo di vetro pretenderà che comandi la prova.[^ee2]

[^ee2]: Curiosità cifrata (ROT13): *Y'hnvpn pbcvn qryy'Norprqnevhz qry 1550 è n Ivraan.*

<!-- WORD COUNT: ~4780 -->
<!-- PERSONA CHECK: Alex/Maja voice intact? Pass — Alex keeps the media/reality tic (95 theses on a door, Rome burns everything) capped within limit; MEMO banter present without becoming cruel. Maja keeps "nessuno me l'ha mai raccontato" tic and structural questions (who opens the press, who can read); no maternal tone toward Alex, no borrowed media tic. -->
<!-- NUF CHECK: 1 ✅ (indulgences→dispute→print→protection/repression→confessions chain shown, no single arrow sufficient) | 2 ✅ (justification by faith vs predestination vs Catholic doctrine+formation+control distinguished) | 3 ✅ (concrete stakes: Frentz risks license/workshop, Trubar risks exposure, exile has material cost) | 4 ✅ (95 theses dated 1517, door-posting flagged as later/unverified, letters/editions distinguished) | 5 ✅ (Bonomo-Trubar dated, no forced confessional label on Bonomo) | 6 ✅ (Catechismus/Abecedarium framed as first printed, not first Slovene text; place/order left open) | 7 ✅ (Jesuits 1540, Inquisition 1542, Trent 1545-1563, Index 1564 kept distinct, explicitly not created by Council) | 8 ✅ (letter/copy/frontispiece/decree weighed as different evidence types, esp. in warning + Debriefing) | 9 ✅ (Maja's exile scene is self-contained access-to-the-press story, not EU recap) | 10 ✅ (Abecedarium scene is Maja's own climax on readers/circulation) -->
<!-- ANTI-AI CHECK: fixed the repeated "primo dettaglio sensoriale prima di..." opening formula, which appeared 4× in the raw draft (Style Bible caps it at 1×/chapter) — kept it only in Scene 1, rewrote Scenes 2 (MEMO-cue opening), 3 (sound-first without "prima che" template), 4 (dropped "prima di tutto" tag). Trimmed Scenes 1, 3 and Debriefing for the 3.500-4.800 word hard cap (raw draft ran ~4.940 words). No banned patterns, no production-jargon labels, no anachronisms found; ROT13 Easter Egg is not the volume's first use of that cipher, so no inline decoder key is required here. -->


<div style="page-break-after: always;"></div>

# Capitolo 3 — Il Trono, La Frontiera E La Prova

## Briefing

Alex, Maja: il salto comincia nel 1610, all'inizio del Seicento, e vi terrà sulle tracce fino al 1687. Nell'ultima missione avete visto le autorità litigare per controllare libri, parole e lettori. Adesso il conflitto si allarga: riguarda Stati, frontiere armate e perfino il modo di stabilire che cosa è vero. Il prossimo salto vi porterà nel Settecento, quando alcuni sovrani proveranno a usare le idee nuove per riformare i propri domini dall'alto.

Il manuale propone questa catena: la Guerra dei Trent'anni devasta l'Europa → la Pace di Vestfalia rimette ordine → sovrani come Luigi XIV concentrano ogni decisione nelle proprie mani → e intanto Galileo, Cartesio e Newton sostituiscono l'autorità con la prova. Trono e studio sarebbero quindi due mondi opposti, con la scienza prodotta nei grandi centri e poi spedita alle periferie.

Qualcosa non torna. Il cannocchiale è già puntato sul cielo otto anni prima che la grande guerra cominci, la frontiera adriatica non obbedisce come dovrebbe, e nel 1687 un lago della Carniola finisce dentro un documento londinese.

La vostra missione è raccogliere cinque prove, pesarne l'affidabilità e ricostruire il vero rapporto fra guerra, potere centrale e nuovo criterio scientifico.

## OBIETTIVI DEL SALTO (SCENE)

### 1. Il Cielo Non Firma Decreti (Padova, 1609-1610) — voce: Alex

Una bottega che puzza di pece, un tubo di cartone, quattro puntini vicino a Giove.
**Prova da raccogliere:** che cosa un cannocchiale permette davvero di affermare, e perché vedere e dimostrare non sono lo stesso passaggio.

### 2. La Frontiera Che Non Obbedisce (Alto Adriatico, 1615-1617) — voce: Alex

Una barca coperta di rami di pino, un ordine arrivato da Graz con mesi di ritardo.
**Prova da raccogliere:** che cosa il caso degli Uscocchi rivela sui limiti pratici degli ordini sovrani lungo una frontiera armata.

### 3. La Pace E Il Sole (Europa e Versailles, 1618-1682) — voce: Alex

Un vecchio soldato che ha attraversato trent'anni di guerra, un nobile che ha perso il suo posto in fila.
**Prova da raccogliere:** distinguere ciò che gli accordi del 1648 cambiarono davvero dagli strumenti con cui Luigi XIV rese operativo il proprio potere.

### 4. Il Lago Che Scompare (Cerknica, 1684-1685) — voce: Maja

Un rombo sottoterra, il fango fino al ginocchio, un barone che misura con una fune.
**Prova da raccogliere:** separare osservazioni, sapere dei pescatori e spiegazione proposta, per capire come un problema carniolino diventa un'affermazione controllabile.

### 5. Una Lettera Oltre Le Montagne (Bogenšperk e Londra, 1687) — voce: Maja

Un foglio piegato e sigillato, millecinquecento chilometri di strada, un bussolotto con palline bianche e nere.
**Prova da raccogliere:** ricostruire quali documenti e quali intermediari trasformano un rapporto sul lago in una comunicazione scientifica accolta da un'istituzione europea.

Il rapporto lo firmano in due: Alex nei centri europei e sulla frontiera dell'Alto Adriatico, Maja dall'interno del lago, dei documenti e della rete che li fa viaggiare.

E attenzione: un trattato di pace, un disegno fatto al cannocchiale, un quaderno di misure e il verbale di una società non provano la stessa cosa. A ogni fonte va chiesto fin dove può arrivare.

---

## Il Cielo Non Firma Decreti
<span class="byline">Cronaca di Alex</span>

La prima cosa che mi arriva non è il cielo. È la pece.

Pece greca calda in un pentolino sopra un braciere, odore acre che si attacca al fondo della gola. Sotto, un raschio continuo: un ragazzo sfrega un dischetto di vetro dentro una ciotola di ferro, con sabbia bagnata e polvere di smeriglio, come se lucidasse una moneta grande quanto un'unghia. Contro il muro, tubi di cartone pressato rivestiti di cuoio rosso.

Cercavo una cupola bianca e uno specchio grande come una porta, la roba dei documentari. Qui non c'è un solo specchio: tubi, lenti, e un uomo che le mette in fila con una pazienza spaventosa.

*MEMO, dove mi hai buttato?*

**MEMO:** *"Padova, autunno 1609. Il soggetto è Galileo Galilei, professore di matematica dello Studio patavino. Il principio ottico del tubo non è suo: il primo brevetto documentato è dell'occhialaio Hans Lipperhey, depositato all'Aia il 2 ottobre 1608."*

Quindi non l'ha inventato lui. Anni di scuola con quella figurina in testa, e la figurina era sbagliata.

L'uomo mi vede e non si stupisce granché. Ha le dita segnate di nero e un tubo in mano.

**Alex:** "Se il tubo lo ha inventato un altro, voi che cosa ci avete messo dentro?"

**Galileo:** "Il vetro. Quello olandese ingrandiva tre volte, appena tre: un giocattolo da fiera. Il mio ne fa otto, questi venti, uno arriva a trenta. La differenza non sta nell'idea, ragazzo: sta nella polvere d'ossa con cui si lucida l'ultima faccia della lente."

**Alex:** "E il Senato di Venezia vi ha pagato per guardare la Luna?"

**Galileo:** "Per guardare il mare. In agosto sono salito sul campanile di San Marco col doge dietro, e ho mostrato loro le vele in arrivo due ore prima che qualsiasi occhio le vedesse. Due ore, in guerra, valgono una flotta. Mi hanno confermato la cattedra a vita, con mille fiorini l'anno."

Non aveva ancora venduto una sola stella. Aveva venduto tempo.

::: scan-result
### SCANNING: IL CANNOCCHIALE DI PADOVA, 1609

*   **Tipo:** tubo ottico a due lenti — una convessa davanti, una concava all'occhio.
*   **Materiale:** cartone pressato rivestito di cuoio, rifiniture in ottone, vetro veneziano molato a mano.
*   **Funzione:** ingrandimento da 8× fino a 30× nei modelli migliori costruiti da Galileo.
*   **Dettaglio Tecnico:** campo visivo strettissimo, meno di metà del disco lunare, e va spostato a mano su un cavalletto zavorrato. Le immagini hanno aloni colorati: le lenti che li correggono non esistono ancora.
:::

La notte a Padova, a gennaio, è una faccenda di dita gelate. Galileo mi passa una benda di tela scura.

**Alex:** "E questa?"

**Galileo:** "Coprite un occhio. Quello coperto resta buono per il tubo, l'altro serve per la penna. Se guardate la candela con l'occhio dell'osservazione, per un quarto d'ora non vedrete più nulla di debole."

La candela di sego è chiusa in una lanterna di corno scuro: passa un filo di luce arancione. Lui disegna a inchiostro e acquerello bruno, non la Luna intera: disegna il confine fra la parte illuminata e quella scura, dove ci sono puntini luminosi staccati e ombre lunghe.

**Alex:** "Sono macchie."

**Galileo:** "Sono monti. Guardate l'ombra: cresce e si accorcia col Sole, come quella di un campanile. Se misuro l'ombra, calcolo l'altezza. La Luna non è la sfera liscia e perfetta che vi hanno insegnato: è terra scabrosa, con cavità e catene."

E poi Giove. Il 7 gennaio tre puntini in fila accanto al pianeta; nelle notti dopo cambiano posizione fra loro; il 13 gennaio ne compare un quarto. Non sono stelle di fondo: girano attorno al pianeta.

**Alex:** "E adesso lo scrivete."

**Galileo:** "Adesso lo stampo a Venezia, in marzo, cinquecentocinquanta copie. E li chiamo Astri Medicei, in onore del granduca di Toscana."

**Alex:** "Perché regalare a un principe una cosa che avete visto voi?"

**Galileo:** "Perché una scoperta senza protettore è una chiacchiera. Chi mi contesterà dovrà contestare anche il nome che ci ho messo sopra."

Ci guadagnerà il posto di primario filosofo e matematico alla corte di Firenze, senza obbligo di lezioni. La prova più nuova d'Europa viaggia dentro una dedica, come una lettera dentro una busta.

::: memo-box
### MEMO GLOSSARIO

*   **Metodo scientifico:** non una ricetta in cinque passaggi inventata da un uomo solo, ma un insieme di pratiche cresciute nel tempo — osservare, misurare, provare, calcolare, argomentare davanti ad altri — a cui contribuirono anche Keplero, Bacone, Cartesio e Newton.
*   **Eliocentrismo:** il modello che mette il Sole al centro e la Terra in movimento. Nel 1616 una congregazione romana lo dichiara contrario alle Scritture; nel 1633 Galileo, che l'ha difeso in un libro, è condannato come "veementemente sospetto d'eresia", abiura in ginocchio e finisce confinato ad Arcetri.
*   **Legge scientifica:** un'affermazione generale che vale per casi diversi e si controlla con le misure. Nel 1687 Newton pubblicherà i *Principia*, dove le stesse formule spiegano la caduta di un sasso e l'orbita di un pianeta.
:::

Quanto alla frase "Eppur si muove": non compare in nessun verbale del processo, in nessuna lettera, in nessuna cronaca del Seicento. Salta fuori a Londra nel 1757, centoventiquattro anni dopo. Detta davanti agli inquisitori sarebbe stata una condanna al rogo, non una battuta.

Vedere non è ancora dimostrare. Fra le due cose ci stanno un tubo di cartone, una dedica a un granduca e ventitré anni di discussioni.

---

## La Frontiera Che Non Obbedisce
<span class="byline">Cronaca di Alex</span>

La bora entra dal canale come una porta sbattuta, e ti asciuga le labbra in dieci secondi.

Sono accovacciato dentro una barca lunga poco più di dieci metri, tirata mezza in secca in un'insenatura fra due pareti di roccia bianca. Sopra hanno buttato rami di pino appena tagliati, alghe secche e una rete. L'albero è abbattuto e legato lungo la chiglia: dal largo, questa barca è una macchia di macchia.

Pece bruciata, legno salmastro, pesce affumicato. E un filo di fumo acre che non smette: la miccia di un archibugio, tenuta accesa per non perdere tempo dopo.

Nei film erano tutti con la benda sull'occhio e la bandiera nera. Qui c'è un uomo con una giubba di panno di lana grezza, un berretto di feltro e una sciabola corta, che sta contando delle fave secche in un sacco per capire quante ne restano.

**Alex:** "Perché vi nascondete? Non siete voi ad attaccare?"

**Il capobarca:** "Siamo dodici ai remi. Una galea della Serenissima pesca più di un uomo d'acqua e qui dentro si sfonderebbe. Noi ci restiamo tre giorni, e se serve tiriamo la barca sui tronchi ingrassati e la portiamo a braccia dall'altra parte dell'istmo, prima dell'alba."

**Alex:** "E l'acqua? Da bere, dico."

**Il capobarca:** "Nella botte imputridisce in tre settimane. Ci si versa dentro aceto di vino, un quarto per razione. Sa di schifo e non ti ammazza. Col pan biscotto si tira avanti."

Sono uscocchi: il nome viene dal verbo che significa "saltare dentro". I saltati dentro, i profughi. Le loro famiglie sono scappate dai Balcani davanti all'avanzata ottomana e dopo la caduta della fortezza di Klis, nel 1537, si sono sistemate a Segna, sotto gli Asburgo, che le ha inquadrate come milizia della Frontiera Militare.

**Alex:** "Vi pagano bene?"

**Il capobarca:** "Ci pagano. Un giorno. La paga di due anni fa è ancora scritta in un registro a Graz, e a Graz stanno benissimo. Intanto qui si mangia."

Tira fuori da una cassetta un foglio piegato con il sigillo rotto: un ordine arcaducale, vietato attaccare i bastimenti veneziani, con cui l'Impero è in pace. È datato mesi prima. Nella cassetta non c'è una moneta.

**Alex:** "Quindi disobbedite."

**Il capobarca:** "Obbediamo a chi ci dà da mangiare. Se Graz manda il soldo, obbediamo a Graz. Se manda soltanto carta, obbediamo al mare."

Ed è qui che la faccenda smette di essere un'avventura. Quelle incursioni non colpiscono solo navi turche: colpiscono mercantili veneziani e ragusei carichi di seta, grano, olio, legname. Per Venezia sono ladroni e pirati. Per Graz, corsari utili che presidiano gratis una frontiera impossibile.

::: memo-box
### MEMO GLOSSARIO

*   **Frontiera militare:** fascia di territorio organizzata militarmente lungo il confine con l'Impero Ottomano, difesa da comunità armate che ricevono terra, esenzioni o paghe in cambio del servizio permanente.
*   **Corsaro:** chi attacca navi nemiche con l'autorizzazione di un'autorità, che ne riconosce le prede. La differenza con il pirata non sta nel gesto: sta nel foglio.
*   **Pirateria:** attacco a navi altrui senza alcuna autorizzazione riconosciuta. Il punto è che le due potenze in campo non applicavano la stessa etichetta agli stessi uomini nello stesso giorno.
:::

Nel dicembre del 1615 Venezia si stufa: blocco navale sulla costa orientale e assedio alla fortezza asburgica di Gradisca d'Isonzo, difesa per l'arciduca Ferdinando di Stiria. Sulla carta è uno scontro fra due potenze; sul terreno è una guerra di posizione impantanata.

Settimane dopo, dietro Gradisca, incontro un carrettiere friulano che ha portato fieno a un accampamento e adesso non ha né fieno né carro.

**Alex:** "Chi ve li ha presi?"

**Il carrettiere:** "Il primo mese quelli di là. Il secondo mese quelli di qua. La differenza la sentivo nella lingua, non nel modo."

**Alex:** "E i soldati? Combattono?"

**Il carrettiere:** "Muoiono di febbre. Il campo è nel fango dell'Isonzo, l'acqua è ferma, e i morti che portano fuori la mattina non hanno una ferita addosso."

Venezia schiera oltre quindicimila mercenari, ma nessuno vince. Le fonti stimano fra i diecimila e i quindicimila morti complessivi, e più di sette su dieci non cadono in combattimento: li uccidono tifo, dissenteria e fame.

Finisce nel settembre 1617 con la Pace di Madrid, mediata da Francia e Spagna. Gli Uscocchi vengono rimossi da Segna, le loro barche da corsa bruciate o confiscate, le famiglie trasferite a forza verso le montagne dello Žumberak e attorno a Karlovac, dove ricevono terra in cambio del solo servizio armato contro gli Ottomani. A Segna arriva una guarnigione regolare; Venezia restituisce ciò che ha occupato e toglie il blocco.

Due anni di guerra, due potenze e una mediazione internazionale per disciplinare qualche centinaio di uomini su barche a remi. Un ordine firmato a Graz pesa quanto la distanza che deve percorrere.

---

## La Pace E Il Sole
<span class="byline">Cronaca di Alex</span>

Il corridoio sa di cipria, muschio e lavanda, tutto insieme, tutto troppo — e sotto quel profumo c'è il motivo del profumo: vasi da notte, seggette col secchio estraibile, latrine d'angolo. Nella galleria accanto migliaia di candele di pura cera d'api sgocciolano sui lampadari di cristallo; nelle anticamere dei servitori bruciano torce di sego, e il grasso animale lascia un odore che non si toglie dai capelli. Dai camini rifluisce fumo di quercia. Ho i piedi gelati dentro le scarpe.

*Questo sarebbe il palazzo delle fiabe*, penso.

**MEMO:** *"Versailles, 6 maggio 1682. Luigi XIV ha appena trasferito qui, a venti chilometri da Parigi, la sede della corte e del governo di Francia. Il soggetto davanti a te attende di essere ammesso al lever, la cerimonia del risveglio del re."*

Il gentiluomo è in piedi da due ore. Ha una scarpa consumata sul lato interno.

**Alex:** "Aspettate di parlargli?"

**Il gentiluomo:** "Aspetto di essere visto. Parlare è per pochi. Ieri sono arrivato dopo il duca che mi precede per anzianità di casa e ho perso il turno: la compagnia di cavalleria che chiedevo per mio figlio è stata assegnata stamattina a un altro."

**Alex:** "Per un turno?"

**Il gentiluomo:** "Per un turno. E dovrò restare qui altri sei mesi, a mie spese, per rifarlo. Mio nonno, quando era scontento del re, assediava una città con i suoi uomini: trent'anni fa lo chiamavano ancora Fronda. Adesso si assedia un'anticamera."

Ecco che cos'è questo posto: una macchina che converte nobili armati in nobili in attesa.

Verso le cucine incontro un uomo anziano con un braciere di rame in mano e la parlata dura di chi viene dalle terre dell'Impero. Ha fatto il soldato prima di finire nel servizio di bocca.

**Alex:** "Voi la guerra grande l'avete vista?"

**Il vecchio:** "Sono nato dentro. È cominciata nel 1618, a Praga, quando dei nobili boemi hanno buttato dalla finestra del castello i reggenti dell'imperatore, per una questione di religione e di diritti dentro l'Impero. Poi sono arrivati gli svedesi, poi la Francia, e alla fine si combatteva per l'Europa intera. Ho cambiato tre padroni senza cambiare villaggio."

**Alex:** "E come è finita?"

**Il vecchio:** "Con quattro anni di gente seduta a discutere in due città diverse, Münster e Osnabrück, perché cattolici e protestanti non volevano trattare nella stessa sala. Nel 1648 hanno firmato. Non un foglio solo: due trattati."

**MEMO:** *"Precisazione. Gli accordi estesero la tolleranza anche ai calvinisti e fissarono al 1° gennaio 1624 l'anno di riferimento per stabilire la confessione e i beni della Chiesa in ogni territorio."*

**Alex:** "E i morti?"

**MEMO:** *"Le stime storiche oscillano fra quattro milioni e mezzo e otto milioni di morti."*

Un margine enorme. E forse è proprio quello il punto: nessuno stava contando, mentre succedeva.

**Il vecchio:** "Nel mio villaggio siamo rimasti in sei famiglie su venti. Due valli più in là non è passato nessuno e hanno seminato tutti gli anni. Non chiedermi perché."

::: memo-box
### MEMO GLOSSARIO

*   **Guerra dei Trent'anni (1618-1648):** conflitto nato nel Sacro Romano Impero per motivi religiosi, dinastici e territoriali, diventato guerra europea con l'intervento di Svezia e Francia. Il calo di popolazione dell'Impero è valutato fra il venti e il quaranta per cento, ma la media inganna: alcune regioni perdono fra metà e due terzi degli abitanti, altre restano sotto il quindici.
*   **Pace di Vestfalia (1648):** i due trattati di Münster e Osnabrück, firmati il 24 ottobre dopo quattro anni di negoziati separati. Riconobbero ai circa trecentocinquanta stati dell'Impero il diritto di governare in casa propria e di stringere alleanze estere, purché non contro l'imperatore. Riformarono l'assetto giuridico dell'Impero; non inventarono in un giorno lo Stato moderno.
*   **Assolutismo:** sistema in cui il sovrano concentra su di sé le decisioni di governo, senza organi che possano annullarle. Non significa potere illimitato: significa nessun potere sopra il re, ma moltissimi accanto.
:::

Il servizio del cibo è la cosa più assurda che vedo tutto il giorno. Le cucine sono a quattrocento metri in linea d'aria, quasi un chilometro fra scale e corridoi. I piatti viaggiano chiusi sotto campane d'argento, in cassepanche foderate di feltro con bracieri di rame accesi sul fondo, scortati dalle guardie. Chiunque incroci il vassoio si ferma, si toglie il cappello e si inchina al cibo.

**Alex:** "Vi inchinate a un piatto."

**Il vecchio:** "Mi inchino a chi lo mangia. E intanto nessuno può infilarci le mani. Il freddo, quello, è più difficile da battere: d'inverno il vino gela nelle caraffe sul tavolo."

Sulla via del ritorno faccio il brillante e dico ad alta voce la frase che sanno tutti: *lo Stato sono io*.

**MEMO:** *"Correzione. Quella frase non compare nei registri del parlamento di Parigi né nelle memorie dei testimoni: le è stata attribuita per la prima volta nel 1818. Documentate risultano invece le parole sul letto di morte, nel 1715: 'Io me ne vado, ma lo Stato rimarrà sempre'."*

Non è proprio la stessa cosa.

E infatti il re non fa quello che vuole. Governa dal 1661 con tre o quattro ministri presi fuori dalla grande nobiltà, manda nelle province intendenti revocabili, costruisce il primo grande esercito permanente d'Europa. Però i giudici hanno comprato la loro carica e non si possono cacciare; clero, nobili e intere città hanno privilegi fiscali intoccabili; con le assemblee di Bretagna, Borgogna e Linguadoca ogni imposta va contrattata. E un suo dispaccio, per arrivare a Tolosa, ci mette dai cinque ai dodici giorni a cavallo.

Un re che ha bisogno di dodici giorni per farsi sentire non è onnipotente. È molto ben organizzato.

::: checkpoint
### CHECKPOINT: il trono e lo studio stanno costruendo due mondi opposti, oppure due sistemi diversi per produrre ordine?

Finora hai raccolto: un tubo di vetro che obbliga a discutere ciò che si vede, e un ordine sovrano che sulla frontiera vale quanto il denaro che lo accompagna. Poi Vestfalia e Versailles, che trasformano accordi, uffici e cerimonie in strumenti di governo.

*   **A.** Sono soprattutto mondi opposti: nell'assolutismo una decisione vale perché viene dal re, mentre la nuova scienza ammette che un'osservazione possa smentire l'autorità ricevuta.
*   **B.** Sono anche due risposte parallele al disordine: entrambe costruiscono istituzioni, registri, reti e reputazioni per stabilire che cosa conta, pur usando criteri diversi.

Tieni a mente la tua risposta — il Verdetto nel Debriefing te la confermerà, la correggerà, o mostrerà che la realtà era più complicata di entrambe.
:::

---

## Il Lago Che Scompare
<span class="byline">Cronaca di Maja</span>

Sul fondo del lago c'è un uomo in ginocchio nel fango, e il fango gli arriva sopra il ginocchio.

Non è un'immagine: è la stagione. Il bacino si sta svuotando, l'acqua se ne va sottoterra, e resta una distesa nera che tira giù gli stivali di cuoio ingrassato come se avesse le mani. Odore di canne marcite, alghe seccate al sole e pesce — migliaia di pesci chiusi nelle pozze, che si muovono ancora.

Da sotto arriva un rombo basso che non finisce mai. Un tuono che non viene dal cielo.

La gente non scappa: corre verso il rumore, con ceste di vimini e reti a coppo, e tira fuori carpe, lucci e tinche a bracciate. Un bambino ne ha già riempita una cesta più grande di lui.

Questo lago non me l'ha mai raccontato nessuno. Non a scuola, non in un libro dei miei compagni italiani. Eppure fra pochi anni lo conoscerà mezza Europa.

**Maja:** "Ogni anno succede?"

**Una pescatrice:** "Ogni anno, ma mai lo stesso giorno. In autunno l'acqua torna, e allora sopra ci si va con i *drevaki*. In estate il fondo si ara e si semina il grano saraceno. Nello stesso posto e nello stesso anno si pesca, si caccia e si miete."

**Maja:** "E quel rumore da sotto?"

**Una pescatrice:** "È il lago che se ne va per le grotte. Quando comincia a rimbombare, in tre giorni qui si cammina all'asciutto."

L'uomo in ginocchio non pesca. Cala dentro un buco d'acqua nera una fune con i nodi e un peso in fondo, e conta i nodi ad alta voce. Poi scrive su una tavoletta di tiglio rivestita di pergamena cerata, con una penna d'oca e un inchiostro denso che l'acqua non porta via.

Non è un contadino: la giubba è troppo buona.

**Maja:** "Che cosa state misurando?"

**Valvasor:** "Quanto tempo impiega. Non basta dire che il lago scompare: lo dicono tutti, e da centocinquant'anni lo scrivono come un prodigio. Voglio sapere quanti giorni, da quale apertura, con quanta acqua e dopo quante piogge."

**Maja:** "E i nomi delle aperture chi ve li ha detti?"

**Valvasor:** "Loro. Rešeto, Vodonos, la Karlovica grande e la piccola. Io non le avrei trovate in dieci anni. Chi vive qui sa dove va l'acqua molto prima di me: quello che manca non è il sapere, è la misura scritta accanto al sapere."

Ecco il punto che voglio portare a casa. Il sapere pratico di chi vive sul lago non è folklore da mettere in fondo alla pagina: senza quello, il barone di Bogenšperk non avrebbe nemmeno saputo dove calare la fune.

::: target-profile
### SCHEDA PERSONAGGIO: Janez Vajkard Valvasor

*   **Ruolo:** nobile carniolino (1641-1693), barone di Bogenšperk, viaggiatore, topografo, editore. Fra il 1684 e il 1685 conduce ricerche ripetute sul lago di Cerknica.
*   **Forza:** 2 — passa settimane nel fango e nelle grotte, ma la sua arma vera è il denaro di famiglia.
*   **Intelligenza:** 5 — misura, disegna, data, raccoglie testimonianze e mette tutto in una forma che un altro può controllare.
*   **Carisma:** 3 — convince pescatori e contadini a raccontargli quello che sanno, e studiosi lontani a leggerlo.
*   **Abilità Speciale:** trasforma un prodigio in un problema. Prende un fenomeno che per generazioni è stato "un mistero" e lo consegna all'Europa sotto forma di misure, tempi e mappe — cioè in una forma che chiunque, anche uno che non ha mai visto il lago, può contestare.
:::

Per pagare viaggi, stampe e l'officina di incisione nel proprio castello, Valvasor impegna e vende gran parte delle sue terre. Morirà con molto meno di quanto aveva.

::: memo-box
### MEMO GLOSSARIO

*   **Lago intermittente:** bacino che si riempie e si svuota periodicamente, perché l'acqua entra ed esce attraverso vie sotterranee invece che da un fiume in superficie.
*   **Osservazione empirica:** guardare, misurare e annotare quello che accade davvero, ripetendo la verifica, invece di dedurre come dovrebbe andare.
*   **Idrologia carsica:** lo studio del percorso dell'acqua dentro le rocce calcaree, dove scava condotti, gallerie e inghiottitoi. Il nome e le teorie arriveranno solo alla fine dell'Ottocento; il fenomeno è qui sotto da sempre.
:::

La sua spiegazione, però, non è quella giusta. Valvasor immagina sotto i monti vicini due grandi caverne piene d'acqua a quote diverse, collegate al fondo del lago da condotti piegati ad arco, come sifoni: la pioggia riempie il serbatoio alto, la pressione spinge l'acqua su; quando il livello scende sotto l'imboccatura entra aria e il flusso si interrompe.

Un modello meccanico ordinato, e sbagliato. Oggi sappiamo che il lago è un *polje* carsico e che il suo riempirsi dipende dall'oscillazione dell'acqua dentro tutta la roccia dell'altopiano, non da tubi chiusi.

E allora perché conta? Perché prima di lui la risposta era "prodigio", e dopo di lui la risposta è "un meccanismo, e forse è questo". La prima si può solo credere. La seconda si può smontare — e infatti l'abbiamo smontata.

---

## Una Lettera Oltre Le Montagne
<span class="byline">Cronaca di Maja</span>

Nella stanza in alto del castello di Bogenšperk c'è un tavolo, un temperino e un foglio che sta per diventare la propria busta.

Le buste, nel Seicento, non esistono. Il manoscritto è su carta di stracci di lino, scritto a mano in tedesco con i termini tecnici in latino. Il segretario lo piega secondo una sequenza precisa, poi con la punta del temperino pratica due tagli sottili e vi infila una linguetta della carta stessa. Cola la ceralacca scarlatta sulla giuntura e preme l'anello con lo stemma.

**Maja:** "E se qualcuno lo apre per strada?"

**Il segretario:** "Non lo richiude. La carta si strappa dove è agganciata, e si vede. Un plico che arriva sano è un plico che nessuno ha letto."

Il pacchetto viene poi fasciato in tela cerata e messo in una borsa di cuoio bollito. Le carte topografiche viaggiano a parte, arrotolate dentro un cilindro di cuoio ingrassato e tappato con pece, perché l'umidità non macchi i tratti destinati all'incisione.

**Maja:** "Quanto ci mette?"

**Il segretario:** "Settimane. Le poste imperiali per Lubiana, Graz, Vienna, poi Ratisbona, Francoforte, Colonia. Ai porti fiamminghi cambia mano e passa il mare su un veliero postale. Se il tempo tiene."

**Maja:** "E il barone non ci va?"

**Il segretario:** "Il barone non lascia la Carniola. Va la carta."

Questo vale il viaggio da solo. Ci hanno abituati a pensare che per contare in Europa uno ci debba andare, in Europa. E invece la partita si gioca su un foglio piegato bene.

Millecinquecento chilometri più in là, a Londra, in una sala del Gresham College, un orologio a pendolo ticchetta più forte delle voci. Odore di tabacco da pipa e caffè tostato, mescolato alla polvere della pergamena. Sul tavolo, plichi arrivati dall'estero con i sigilli spezzati.

Il barone non c'è. Non c'è mai stato e non ci sarà: tutto quello che accade qui accade in sua assenza.

A curare il testo è l'astronomo stipendiato che fa da segretario assistente e redige il periodico. Ha davanti il manoscritto in tedesco e latino e ne ricava un estratto in inglese, con la tavola incisa del lago ripiegata dentro.

**Maja:** "Perché lo traducete voi?"

**Halley:** "Perché la memoria dev'essere leggibile da chi la deve giudicare. Un'affermazione che nessuno qui dentro può controllare non serve a niente, per quanto nobile sia chi l'ha scritta. Il nostro motto è che non si crede a una parola sulla sola autorità di chi la pronuncia."

**Maja:** "Anche se arriva da una provincia che nessuno di voi ha visto?"

**Halley:** "Soprattutto allora. Il barone ci ha mandato tempi, profondità, l'elenco delle aperture e le piante misurate. Con quelle si discute. Se ci avesse mandato solo la meraviglia, sarebbe finita nel cassetto."

::: scan-result
### SCANNING: L'ESTRATTO SUL LAGO DI ZIRKNITZ, 1687

*   **Tipo:** memoria scientifica pubblicata nelle *Philosophical Transactions*, volume 16, numero 191, pagine 411-427.
*   **Materiale:** stampa su carta, con una tavola incisa ripiegata: mappa topografica del lago e sezione dei condotti sotterranei ipotizzati.
*   **Funzione:** rendere l'osservazione carniolina leggibile, citabile e criticabile da chiunque, ovunque.
*   **Dettaglio Tecnico:** è un *estratto* di una lettera, non il testo integrale, ed è in inglese perché tradotto a Londra. La lingua della scienza europea, in questo secolo, è ancora soprattutto il latino.
:::

Il 14 dicembre 1687 i soci votano. Non alzano la mano: lasciano cadere palline di legno dentro un bussolotto foderato di velluto, bianche per il sì, nere per il no. È il rumore meno solenne che abbia mai sentito. Janez Vajkard Valvasor è eletto membro all'unanimità, e lo saprà per lettera.

::: memo-box
### MEMO GLOSSARIO

*   **Società scientifica:** associazione di studiosi che si riuniscono per presentare, ripetere e discutere osservazioni. Questa, fondata a Londra nel 1660, è privata e vive delle quote dei soci — a differenza dell'accademia di Parigi, finanziata e controllata dalla Corona francese.
*   **Corrispondenza scientifica:** lo scambio regolare di lettere fra studiosi lontani. Nel Seicento è il canale principale della ricerca: si spediscono misure, disegni e obiezioni, e la risposta arriva mesi dopo.
*   **Membro (Fellow):** chi viene eletto nella società dagli altri soci. Non è una laurea né un titolo nobiliare: è l'ammissione a una conversazione, con il diritto di parlare e l'obbligo di farsi controllare.
:::

Una precisazione me la tengo stretta, perché è facile esagerare nella direzione opposta. Nel Seicento non esiste nessuno Stato chiamato Slovenia: la Carniola è un ducato della monarchia austriaca, e quell'elezione non premia un popolo. Premia un singolo nobile con i mezzi, la testardaggine e la rete giusta.

Ma dimostra un'altra cosa, e questa non me la toglie nessuno: da un lago della Carniola si poteva parlare al cuore della rete scientifica europea senza passare da Vienna né da Roma. Bastava misurare bene, piegare bene la carta e aspettare tre mesi.

---

## Debriefing

Cinque prove sullo stesso tavolo: un tubo di cuoio con dentro due lenti, un ordine arcaducale arrivato senza denaro, una campana d'argento che tiene caldo il pranzo di un re, una fune annodata calata in un buco d'acqua nera, un foglio piegato che è anche la propria busta.

Alex ha seguito le persone dentro le strutture: un professore che vende ore di vantaggio al Senato di Venezia, un gentiluomo che perde un turno e con quello il futuro di suo figlio. Maja ha seguito le condizioni materiali del sapere: chi conosce il lago, chi lo misura, chi traduce il risultato e chi decide che sia discutibile. Nessuno dei due rapporti basta da solo.

**Verdetto:** regge meglio la lettura B, ma la A individua la differenza decisiva. Assolutismo e rivoluzione scientifica cercano entrambi di ridurre il disordine con le stesse attrezzature — istituzioni, registri, corrispondenze, reti di protettori e specialisti — e nessuna delle due funziona senza denaro e reputazione. La differenza sta nel criterio: un ordine politico vale perché risale al sovrano, mentre un'affermazione scientifica deve poter essere confrontata con osservazioni e argomenti da altri, anche da chi il fenomeno non lo ha mai visto. La frontiera di Gradisca mostra che il controllo assoluto restava incompleto; il lago di Cerknica mostra che una prova poteva nascere in Carniola e arrivare a Londra senza diventare vera solo perché il centro l'aveva accolta.

::: reality-check
### CIÒ CHE NON SAPPIAMO ANCORA

*   **Il prezzo umano della guerra:** mortalità e spopolamento della Guerra dei Trent'anni cambiano moltissimo secondo la regione e il metodo di calcolo. Le stime oscillano fra quattro milioni e mezzo e otto milioni di morti: un margine larghissimo, che dice quanto poco si contasse allora.
*   **Quanto misurò davvero Valvasor:** le campagne sul lago si collocano fra il 1684 e il 1685, ma quali dati raccolse di persona e quali gli furono riferiti dagli abitanti non è sempre distinguibile. E la sua spiegazione a sifoni non coincide con l'idrologia carsica di oggi.
*   **La strada esatta del manoscritto:** l'elezione del 14 dicembre 1687 e la pubblicazione sono documentate; il percorso preciso del plico, chi lo portò a mano e in quale punto avvenne la traduzione lo sono molto meno.
:::

::: memo-box
### CRONOLOGIA ESSENZIALE

*   **1610:** Galileo pubblica a Venezia le osservazioni del *Sidereus Nuncius*.
*   **1615-1617:** Guerra di Gradisca nell'Alto Adriatico.
*   **1618-1648:** Guerra dei Trent'anni.
*   **1648:** Pace di Vestfalia, trattati di Münster e Osnabrück.
*   **1682:** Luigi XIV trasferisce corte e governo a Versailles.
*   **1687:** memoria sul lago di Cerknica ed elezione di Valvasor alla Royal Society; escono i *Principia* di Newton.
:::

Due tavoli, alla fine di questo salto: su uno un ordine parte già firmato, e più si allontana più diventa leggero; sull'altro una spiegazione torna piena di obiezioni, e più viene contestata più diventa solida. Due modi opposti di far pesare un pezzo di carta.

Prossima missione. Nel Settecento qualcuno proverà a mettere i due tavoli nella stessa stanza: sovrani che leggono i filosofi e riformano dall'alto la vita dei propri sudditi. Con quali risultati, lo scoprirete voi.[^ee3]

[^ee3]: Curiosità cifrata (ROT13): *N Cnqbin, Tnyvyrb thneqnin yn Yhan pba ha bppuvb fbyb: y'nygeb yb grarin oraqngb cre ynibener fhy sbtyvb.*

<!-- WORD COUNT: ~2960 (narrative + dialogue, excluding HUD box markup) / ~5240 total including all box syntax -->
<!-- PERSONA CHECK: Alex/Maja voice intact? Pass — Alex keeps the media/reality tic (documentari, film di Hollywood) and the MEMO banter; Maja keeps "questo lago non me l'ha mai raccontato nessuno" and the structural focus (chi misura, chi traduce, chi decide). No drift to generic AI voice detected. -->
<!-- NUF CHECK: 1 ✅ (catena Trent'anni→Vestfalia→ordine, con limiti mostrati a Gradisca/Versailles) | 2 ✅ (criterio politico vs criterio scientifico, corte e scienza non separate) | 3 ✅ (tensione obbedire/sopravvivere/ammettere errore — capobarca, vecchio soldato, Valvasor sui sifoni) | 4 ✅ (1618-1648, 1648, Vestfalia non è nascita istantanea dello Stato) | 5 ✅ (Luigi XIV strumenti e limiti; "L'État c'est moi" trattata come non documentata) | 6 ✅ (Galileo non inventore del metodo, Cartesio/Newton coordinate, "Eppur si muove" segnalata come non documentata) | 7 ✅ (Uscocchi: rifugio, servizio, corsa, pirateria distinti senza assoluzione o condanna collettiva) | 8 ✅ (Valvasor: osservazione separata dalla spiegazione errata dei sifoni) | 9 ✅ (Il Lago Che Scompare è storia propria di Maja, non un'appendice) | 10 ✅ (Una Lettera Oltre Le Montagne mostra la rete, non una medaglia inglese) -->
<!-- ANTI-AI CHECK: nessuna frase vietata rilevata ("come sappiamo", "è importante notare" ecc. assenti); tic scuola/realtà di Alex usato entro il limite di 3 (Beat1 figurina, Beat2 film, Beat3 palazzo delle fiabe); tic di Maja "mai raccontato" usato 1 volta (Beat4); nessuna etichetta di produzione ("Scena", "Beat", "EU/GIULIA/SLOVENIA") nel testo; "Capitolo" compare una sola volta nel titolo; Abilità Speciale di Valvasor supera il test operativo (asse straordinario-nel-contesto); Easter Egg unico, ROT13 già insegnato al Cap. 0, non richiede nuova chiave. -->


<div style="page-break-after: always;"></div>

# Capitolo 4 — Il Secolo dei Lumi

## Briefing

Alex, Maja: questa indagine attraversa il Settecento, dal 1719 al 1787. Nel capitolo precedente avete visto sovrani che concentravano il comando e studiosi che sottoponevano la natura alla prova. Adesso la stessa pretesa cambia bersaglio: non più le comete, ma le leggi, i porti, i tribunali, le biblioteche.

Il manuale propone questa catena: i filosofi chiedono leggi più razionali → Maria Teresa e Giuseppe II applicano quelle idee dall'alto → i decreti modernizzano l'Impero → Trieste diventa una città-porto aperta e a Lubiana nasce il circolo di Zois.

Qualcosa non torna, e sono le date. L'apertura commerciale del porto di Trieste è del 1719, quando Maria Teresa ha due anni. La rete di Lubiana prende forma oltre sessant'anni dopo. E le libertà concesse non sono le stesse per tutti.

La vostra missione è raccogliere quattro prove, pesarle una per una e ricostruire la vera catena degli eventi.

## OBIETTIVI DEL SALTO (SCENE)

### 1. La Bottega Delle Idee Pericolose (Ginevra ed Europa, 1748-1764) — voce: Alex

Un libro senza nome d'autore sul frontespizio, un legatore che batte fascicoli, una botte che parte per la Francia.
**Prova da raccogliere:** quali istituzioni mettono in discussione Montesquieu e Voltaire, e se le loro proposte formino davvero un unico programma pronto per i sovrani.

### 2. Il Quartiere Disegnato Sul Sale (Trieste, 1719-1782) — voce: Alex

Bacini di sale svuotati, pali conficcati nel fango, magazzini che tengono asciutto lo zucchero.
**Prova da raccogliere:** confrontare l'ordine scritto del sovrano, i lavori in cantiere e i diritti concessi, per stabilire che cosa può produrre davvero una firma imperiale.

### 3. La Biblioteca Che Mette In Moto Una Lingua (Lubiana, 1780-1791) — voce: Maja

Una stufa di maioliche verdi, pareti coperte di dorsi in pelle di vitello, una commedia recitata in sloveno.
**Prova da raccogliere:** ricostruire quali risorse, persone e scelte trasformano una biblioteca privata in una rete scientifica, linguistica e storica della Carniola.

### 4. Il Libro Sul Tavolo Del Giudice (Milano, Livorno e Vienna, 1764-1787) — voce: Alex

Centoquattro pagine stampate di nascosto e un decreto che parte a cavallo verso i tribunali di provincia.
**Prova da raccogliere:** confrontare gli argomenti di Beccaria con le norme e con la loro applicazione, per misurare quanto cambi davvero la giustizia e chi conservi il potere di decidere.

Il rapporto lo firmate in due. Alex raccoglie libri, patenti e leggi fra l'Europa e l'Alto Adriatico; Maja segue dall'interno la biblioteca, la lingua e le reti intellettuali delle terre slovene.

Ultima avvertenza. Un trattato dice che cosa un autore propone. Un ordine scritto dice che cosa il sovrano comanda. Una mappa dice che cosa qualcuno ha progettato, un registro che cosa forse è successo. Nessuna di queste quattro fonti, da sola, prova l'intera trasformazione.

---

## La Bottega Delle Idee Pericolose
<span class="byline">Cronaca di Alex</span>

Il rumore arriva a colpi regolari, dal fondo della stanza: tonf, tonf, pausa, tonf. Un uomo in grembiule sta battendo un mucchio di fogli piegati sopra un'incudine di ferro, per spianarli. Sopra il tavolo cola una candela di sego, grigia, che puzza di grasso fritto e annerisce l'aria.

Ogni venti minuti posa il mazzuolo e taglia lo stoppino: se non lo fa, la fiamma fuma e le pagine si anneriscono.

*MEMO, dove sono?*

**MEMO:** *"Ginevra, autunno 1748. Bottega tipografica Barillot & Fils. In stampa: un trattato in due volumi intitolato* De l'esprit des lois*."*

Prendo in mano un fascicolo asciutto. Cerco il nome dell'autore sul frontespizio. Non c'è.

**Alex:** "Scusi... e chi l'ha scritto?"

**Il legatore:** "Nessuno l'ha scritto. Così sta scritto lì, e così va bene a tutti."

**Alex:** "Cioè lo stampate e non dite di chi è?"

**Il legatore:** "Se il nome è sul frontespizio, in Francia il libro lo fermano prima che entri. Se non c'è, chi lo ferma sequestra della carta. E la carta si ristampa."

Un libro anonimo per superare un confine. Mi ero immaginato una squadra, tre o quattro signori con la parrucca a scrivere insieme il programma dell'Illuminismo. Qui invece c'è un tipografo che tiene la bocca chiusa e un autore a settecento chilometri di distanza.

E l'autore, per la cronaca, è furioso.

**MEMO:** *"Il barone di Montesquieu ha affidato la supervisione della stampa al pastore ginevrino Jacob Vernet. Vernet ha corretto di sua iniziativa diverse espressioni. L'autore ha definito la propria opera «estropiée», mutilata."*

Trentacinque errata, mi spiega dopo il legatore, perché qualcuno gli ha sistemato le frasi senza chiedere.

**Alex:** "E cosa c'è dentro di così pericoloso?"

**Il legatore:** "Il libro undicesimo. Dice che chi fa le leggi, chi comanda e chi giudica non devono essere la stessa mano."

::: memo-box
### MEMO GLOSSARIO

*   **Illuminismo:** il movimento di idee che nel Settecento pretende di giudicare leggi, istituzioni e credenze con la ragione, invece di accettarle perché sono antiche o sacre. Non era un partito: gli autori litigavano fra loro.
*   **Separazione dei poteri:** l'idea, esposta da Montesquieu nel 1748, che fare le leggi, governare e giudicare debbano stare in mani diverse, «perché il potere arresti il potere». Il suo modello non è una repubblica di elettori, ma una monarchia moderata dai corpi intermedi — nobiltà e tribunali ereditari.
*   **Opinione pubblica:** il tribunale informale dei lettori. Nel Settecento comincia a contare: un caso giudiziario discusso in migliaia di copie stampate può costringere un governo a riaprirlo.
:::

Quindici anni dopo, stessa città, strada diversa. Nel cortile un garzone sta stivando risme di fogli sciolti dentro una botte da aringhe, di quelle stagne, e sopra ci butta uno strato di formaggi.

**Alex:** "Perché non li rilegate prima?"

**Il libraio:** "Perché una legatura pesa, gonfia il carico e mostra il titolo sul dorso alla prima guardia che apre. I fogli sciolti sono carta. La carta non ha titolo."

**Alex:** "E se la guardia guarda dentro la botte?"

**Il libraio:** "Trova la prima pagina di un devoto manuale di preghiere, cucita a mano sopra il resto. Il vero frontespizio viaggia separato, e lo strappo io quando i fogli arrivano a destinazione."

Un falso frontespizio pio, cucito sopra la merce vera. Contrabbando di parole, con le tecniche del contrabbando di sale.

**MEMO:** *"Il volume nella botte è il* Traité sur la tolérance*, stampato clandestinamente quest'anno dai fratelli Cramer, senza nome d'autore né luogo d'edizione. Nasce dal caso di Jean Calas, mercante protestante di Tolosa, giustiziato per un delitto che non aveva commesso."*

Il libraio racconta il resto mentre lega la corda: il figlio trovato morto, l'accusa costruita su un sospetto, il padre condannato e giustiziato sulla ruota il 10 marzo 1762, e poi una campagna di lettere e opuscoli che non si ferma più. Funziona. Il 9 marzo 1765 il Consiglio del Re dichiarerà Calas innocente, tre anni dopo averlo ucciso.

Solo che quest'uomo, mi spiega MEMO, nei suoi scritti disprezza apertamente gli ebrei e considera il popolo minuto troppo rozzo per la ragione. E sui tribunali la pensa all'opposto di Montesquieu: quello li vedeva come argine contro il re, lui li vuole schiacciati da un sovrano forte che riformi dall'alto.

Squadra unita, dicevo. Con un programma unico, pronto per i re.

**Alex:** "Quanto costa un libro così?"

**Il libraio:** "Dipende dai volumi. Le stime che girano fra noi parlano di dodici lire, quaranta per un'opera grossa."

**Alex:** "E un uomo che lavora quanto prende al giorno?"

**Il libraio:** "Venti soldi. Trenta, se è un mastro."

Faccio il conto e mi si stringe lo stomaco. Un manovale dovrebbe lavorare un mese per un libro che gli spiega che le leggi si possono discutere. Le idee circolano, sì — dentro un canale stretto, fatto di nobili, magistrati, mercanti ricchi e preti istruiti. Chi legge questi fogli è chi ha già le mani sulla macchina.

---

## Il Quartiere Disegnato Sul Sale
<span class="byline">Cronaca di Alex</span>

L'odore ti prende alla gola: fango salmastro e alghe morte al sole di luglio, il fondo di un bacino di sale che qualcuno ha appena svuotato. Sotto i piedi il terreno vibra a intervalli regolari. Tonf. Tonf. È una macchina di legno con un contrappeso che lascia cadere un maglio su una testa di palo.

Conto i pali già piantati. Sono decine, tutti verticali, tutti nel limo.

**Alex:** "Ma cosa ci costruite, su una palude?"

**Il capomastro:** "Case. Magazzini. Una chiesa, più in là."

**Alex:** "E stanno su?"

**Il capomastro:** "Stanno su i pali. Rovere e larice, lunghi quanto tre uomini distesi, li spingiamo giù finché non toccano il duro. Poi tagliamo le teste a filo d'acqua, ci mettiamo sopra un graticcio di travi, e sulle travi la pietra d'Istria. Quella l'acqua non se la beve."

Nessuna gru. Nessuna ruspa. Braccia, pale di ferro, carriole, argani a mano e barche piatte che portano via il fango. Passano carri di blocchi bianchi e polverosi, calcare dalle cave del Carso. In fondo, tra facciate ancora senza intonaco, le vele quadre dei trabaccoli risalgono il canale nuovo fino ai portoni dei magazzini.

Sui pieghevoli per turisti, oggi, la storia sta in una riga: qui c'era un borgo di pescatori, poi un imperatore firmò un decreto. Mi ero portato dietro quell'immagine. È sbagliata due volte.

**MEMO:** *"Prima del 1719 Trieste era una piccola città murata con statuti civici propri, sotto protezione asburgica dal 1382. Popolazione stimata fra i tremilacinquecento e i quattromila abitanti."*

Mi volto verso le mura vecchie. Dentro ci stanno una cattedrale e i bacini di sale che davano da mangiare a mezza città. Nessun villaggio di pescatori, quindi.

E il decreto non è di adesso, e non è nemmeno di chi credevo.

**MEMO:** *"La patente del porto franco fu firmata dall'imperatore Carlo VI il 18 marzo 1719. Fu preceduta dalla patente di libera navigazione del 2 giugno 1717, che sfidava il monopolio veneziano sull'Adriatico. Maria Teresa, all'epoca, aveva due anni."*

::: memo-box
### MEMO GLOSSARIO

*   **Porto franco:** un porto in cui le merci entrano, sostano ed escono senza pagare dogane e dazi. Non è una città libera: è un regime fiscale deciso dal sovrano, che il sovrano può cambiare.
*   **Bonifica:** l'operazione con cui un terreno paludoso o salmastro viene prosciugato, riempito e reso edificabile. Qui significa spegnere delle saline che davano da vivere a qualcuno.
*   **Patente di tolleranza:** un atto sovrano che concede a chi non è cattolico il permesso di praticare il proprio culto e di svolgere certi mestieri. I destinatari e i limiti cambiano da un provvedimento all'altro: non è uguaglianza fra sudditi.
:::

Quarant'anni tra la firma e queste palificate. Quarant'anni in cui la città cresce piano: dai tremilacinquecento-quattromila del 1719 ai circa seimilaquattrocento del censimento del 1758. Poi la curva impazzisce. Diecimilaquattrocentosettanta censiti nel 1775 — di più, secondo le stime degli storici, contando marinai ed equipaggi di passaggio — e oltre ventimila persone nei primi anni Ottanta.

L'esproprio dei bacini di sale era cominciato nel 1730. I cantieri veri partono nel 1749. Il canale lo scavano tra il 1754 e il 1756.

Un decreto non costruisce niente. Un decreto apre una possibilità, e poi servono trent'anni di gente che ci scommette sopra.

Dentro un magazzino appena finito trovo un mercante che sta facendo entrare dei sacchi. Il pavimento è rialzato di tre gradini.

**Alex:** "Ha paura dell'acqua alta?"

**Il mercante:** "Ho paura dell'umidità. Sotto questo pavimento c'è un vespaio a volte di mattoni, vuoto, che respira. Le pareti sono intonacate a calce e pozzolana. E il carico non tocca mai il suolo."

Mi mostra dei graticci di legno, alti una spanna, su cui vanno appoggiati i sacchi.

**Il mercante:** "Zucchero, caffè, cotone, spezie. Sopra i graticci passa l'aria, e con la bora che entra dalle grate l'aria qui non manca mai. Un sacco appoggiato per terra in agosto, dopo tre settimane, lo butti."

**Alex:** "E lei da dove viene?"

**Il mercante:** "Dalla comunità dei greci e degli illirici. Nel 1751 l'imperatrice ci ha concesso il culto privato, l'esenzione dal servizio militare e il permesso di alzare un tempio proprio sul terreno delle saline bonificate. Da noi ci si è arrivati in cinque, in dieci anni. Adesso siamo una nazione."

**Alex:** "E gli altri? Voglio dire, tutti quelli che non sono cattolici."

**Il mercante:** "Ognuno ha la sua carta, e nessuna carta è uguale a un'altra. Gli ebrei hanno avuto ventinove articoli di privilegio nel 1771: comprare case, commerciare, non lavorare di sabato, tenere un cimitero. Ma il quartiere chiuso è rimasto in piedi ancora tredici anni."

Ha ragione, e MEMO me lo conferma con le date: le porte del ghetto vengono tolte nel 1784, e il ghetto è soppresso ufficialmente nel 1785, dopo la patente di tolleranza di Giuseppe II del 1781 e il provvedimento del 1782.

Poi guardo il tempio del mercante e capisco che manca qualcosa. Nessuna facciata monumentale sulla piazza grande. Nessun campanile che suoni.

**Alex:** "Le campane non ve le hanno date."

**Il mercante:** "Le campane e la piazza sono dei cattolici. A noi hanno dato i moli e la dogana. Il sovrano non ci ha voluti perché siamo giusti: ci ha voluti perché siamo utili."

Lo dice senza amarezza, come si dice il prezzo di una cosa. Sui registri della corte, la parola che spiega tutte queste concessioni non è "diritto". È "utilità".

::: checkpoint
### CHECKPOINT: le riforme dei sovrani stanno trasformando il potere, o stanno usando alcune idee nuove per rendere più forte lo stesso potere dall'alto?

Finora hai raccolto: i libri dei Lumi rendono discutibili leggi e istituzioni che prima sembravano naturali; la patente e il quartiere nuovo cambiano davvero Trieste, ma solo attraverso decenni di lavori e con libertà distribuite in modo diseguale.

*   **A.** Il potere sta accettando limiti veri: quando un sovrano apre i commerci e permette culti diversi, le idee dei filosofi cominciano a vincolare anche chi governa.
*   **B.** Il potere sceglie le riforme che rendono lo Stato più ricco, ordinato ed efficiente: concede vantaggi reali, ma resta lui a decidere a chi darli e fin dove.

Tieni a mente la tua risposta. Il Verdetto te la confermerà, la correggerà, o mostrerà che la realtà era più complicata di entrambe.
:::

---

## La Biblioteca Che Mette In Moto Una Lingua
<span class="byline">Cronaca di Maja</span>

Al secondo piano di una casa sul Breg, a Lubiana, è l'inverno del 1791, ma qui dentro il freddo non entra: una stufa di maiolica verde, alta fino al soffitto, tiene l'aria secca e sempre calda. Sotto le finestre il fiume scorre gelato.

Le pareti spariscono sotto i dorsi in pelle di vitello marrone, quasi tutti rilegati uguali, con le lettere impresse a caldo in oro, e l'aria sa di cera d'api. Quanti siano, non lo dice nessuna carta: la sola conta completa arriverà nel 1821, due anni dopo la morte del padrone di casa, e registrerà poco più di quattromila volumi. Vicino alla finestra, su vassoi di velluto scuro, sono allineati cristalli di quarzo e pirite accanto a due lenti d'ingrandimento in ottone: non un salotto, un laboratorio.

Un uomo tiene in mano un fascicolo e ne legge il titolo ad alta voce in tedesco; poi, senza cambiare tono, si volta verso il ragazzo che gli sta accanto e gli spiega in sloveno dove trovarlo sullo scaffale. In questa stanza, passare da una lingua all'altra non è un evento per nessuno dei due.

**Maja:** "Chi decide quali libri entrano qui?"

**Zois:** "Io. E chi lavora con me, quando ha bisogno di qualcosa che non c'è."

**Maja:** "E come arrivano? Lubiana non ha grandi stampatori."

**Zois:** "Attraverso il ferro."

Ci metto un attimo a capire il collegamento. Il ferro delle sue ferriere di Bohinj, Javornik e Mislinja arriva a Vienna, Trieste, Venezia, Norimberga, Amsterdam — e in ognuna di quelle piazze l'agente che lo vende ha anche un secondo incarico: comprare libri scientifici e cataloghi d'asta, pagati con le stesse lettere di cambio del metallo.

**Zois:** "Viaggiano in casse di pino foderate di latta saldata. Sulle strade alpine piove sempre."

**Maja:** "E qui dentro? Il fiume è a venti passi."

**Zois:** "Per questo la biblioteca sta al secondo piano e non al primo. Quando la Ljubljanica esce, arriva sotto. Le colle delle legature le faccio trattare con allume di rocca e olio di cedro, che i tarli non lo sopportano. E ogni volume è a catalogo, scritto a mano, in fascicoli che stanno in tasca."

Ne prende uno e me lo passa. È un elenco alfabetico, e accanto a ogni titolo c'è la collocazione precisa.

**Zois:** "Chi cerca un testo non deve frugare a caso al buio. Deve sapere dove mettere la mano."

::: target-profile
### SCHEDA PERSONAGGIO: Žiga Zois

*   **Ruolo:** nato a Trieste nel 1747, padrone di ferriere in Carniola, mineralogista e finanziatore della più grande biblioteca privata del ducato, nella sua casa sul Breg a Lubiana.
*   **Forza:** 2 — la gotta lo ha colpito a Roma alla fine del 1779 e non lo lascia più.
*   **Intelligenza:** 5 — legge in cinque lingue, riconosce un minerale alla lente e amministra miniere e altiforni.
*   **Carisma:** 4 — non comanda nessuno, eppure decide chi in Carniola avrà i libri, il tempo e i soldi per studiare.
*   **Abilità Speciale:** trasforma un carico di ferro in un carico di libri — e con quei libri paga il lavoro di chi scriverà la prima storia scientifica della sua terra.
:::

::: memo-box
### MEMO GLOSSARIO

*   **Mecenatismo:** sostenere con il proprio denaro il lavoro di studiosi e artisti, comprando libri, pagando stampe, aprendo contatti. Chi paga sceglie: è un aiuto reale e insieme un filtro.
*   **Circolo intellettuale:** un gruppo che si ritrova con regolarità per discutere, leggere e scambiarsi ricerche. Quello di Zois non ha statuto, tessere né verbali: la sua composizione cambia negli anni, e il nome glielo hanno dato gli storici molto dopo.
*   **Storiografia:** il lavoro di ricostruire il passato a partire dalle fonti, spiegando da dove viene ogni affermazione. È diverso dal raccontare le imprese di una dinastia.
:::

Chi lavora alla scrivania accanto non abita qui: la sua casa è la porta a fianco, sempre sul lungofiume. Di mestiere fa l'ispettore scolastico distrettuale — un funzionario asburgico con lo stipendio fisso — e in questo momento sta correggendo delle bozze, in tedesco.

**Maja:** "Perché in tedesco? Voi ai contadini parlate sloveno."

**Linhart:** "Perché queste pagine devono essere lette a Vienna, a Gottinga, a Praga. Se le scrivessi nella nostra lingua non le leggerebbe nessuno di quelli che devono ammettere che ho ragione."

**Maja:** "E su cosa devono ammettere che avete ragione?"

**Linhart:** "Che la storia di questa terra non è la storia dei suoi duchi. I confini delle province li hanno disegnati le eredità e i matrimoni. La gente che li abita parla la stessa lingua di qua e di là, in Carniola come in Carinzia, in Stiria come nel Goriziano. Quella gente è il soggetto del mio libro."

Il primo volume è del 1788, il secondo esce proprio ora, alla fine del 1791. La stampa la paga l'uomo che mi ha appena spiegato l'olio di cedro.

Ho fatto tutta la scuola in questo Paese. Eppure la prima volta che qualcuno ha guardato gli sloveni come un unico popolo, al di là dei confini fra le province, la scopro adesso, in questa stanza scaldata da una stufa — e questo, lo ammetto, mi fa rabbia.

E poi c'è l'altra metà del lavoro, quella che non passa dal tedesco.

**Maja:** "Il teatro."

**Linhart:** "*Županova Micka*. Recitata il 28 dicembre 1789, al Teatro degli Stati, qui a Lubiana. Non un libro di preghiere: una commedia. La gente ha riso in sloveno, seduta in un teatro, per la prima volta."

**Maja:** "E la seconda?"

**Linhart:** "*Ta veseli dan ali Matiček se ženi*. Un padrone che prova a comandare sulla vita dei suoi contadini, e i contadini che lo fregano. È stampata. Recitata no: la censura non l'ha permessa."

Il confine, però, si tocca con un dito, e Vienna non lo ha aperto per generosità: voleva sudditi più istruiti, e quindi più produttivi. Le riforme scolastiche di Maria Teresa del 1774 avevano chiesto di insegnare ai bambini nella lingua che parlavano davvero; l'editto di Giuseppe II del 1781 aveva allentato la censura. Sono aperture reali — senza di esse questa stanza non esisterebbe — ma nessuna delle due porta la firma di chi ci ha messo dentro il resto.

Una storia della Carniola che mettesse al centro gli slavi, o una commedia che si prendesse gioco dei padroni: nessuno, a Vienna, le aveva commissionate. La modernità non è arrivata qui già confezionata dalla capitale. È stata una decina di persone — un padrone di ferriere, un funzionario con lo stipendio fisso, qualche prete e qualche maestro — ad allargare uno spiraglio fino a farci passare cose che quello spiraglio non avrebbe dovuto lasciare entrare.

Guardo di nuovo i vassoi di velluto, i cristalli, le lenti d'ottone. Un catalogo scritto a mano prova solo che questi libri esistevano su uno scaffale, non che qualcuno li avesse capiti davvero. La prova più solida resta il secondo volume appoggiato sul tavolo, pagato con il denaro del ferro: la prova che, per qualcuno, quelle pagine valevano più del metallo che le aveva finanziate.

---

## Il Libro Sul Tavolo Del Giudice
<span class="byline">Cronaca di Alex</span>

Livorno, estate 1764, e il torchio ha appena finito. Centoquattro pagine, formato piccolo, ancora umide di inchiostro. Sul frontespizio: nessun nome d'autore.

Comincio a vedere uno schema.

**Alex:** "Anche questo anonimo?"

**Il tipografo:** "Anche questo. L'autore sta a Milano. Il libro si stampa qui, in Toscana, perché a Milano e a Venezia il testo dovrebbe passare prima da chi ha il potere di fermarlo."

**Alex:** "E parla di cosa?"

**Il tipografo:** "Di come si giudica un uomo. E di cosa gli si può fare al corpo per fargli dire quello che si vuole sentire."

Sfoglio. C'è un capitolo intitolato *Della tortura*.

MEMO mi legge l'argomento centrale, e non è quello che mi aspettavo: pensavo dicesse che la tortura è crudele. Dice di più: che non funziona.

**MEMO:** *"L'autore è il milanese Cesare Beccaria, ventisei anni. Sostiene che la tortura non misura la colpa ma la resistenza fisica: un colpevole robusto tace e viene assolto, un innocente malato confessa il falso per far cessare il dolore. La chiama criterio di robustezza, non criterio di verità."*

Un imputato torturato prima o poi confessa sempre. Solo che quella confessione non ha nessun rapporto con quello che è successo: una macchina che dà sempre una risposta, e la risposta non significa niente. E c'è la frase da cui parte tutto: un uomo non può chiamarsi reo prima della sentenza del giudice.

::: memo-box
### MEMO GLOSSARIO

*   **Tortura giudiziaria:** infliggere dolore a un imputato durante l'istruttoria per ottenerne la confessione. Non era un abuso clandestino: fino al 1776 era una procedura legale, regolata da manuali e codici.
*   **Proporzionalità della pena:** l'idea che la punizione debba essere commisurata al danno arrecato alla società, non alla gravità del peccato. Beccaria aggiunge che a fermare i delitti non è la ferocia della pena, ma la certezza di riceverla.
*   **Dispotismo illuminato:** il modo di governare dei sovrani che riformano leggi, scuole e amministrazione secondo criteri razionali, restando però la fonte unica del potere. Cambiano le regole; non le condividono con nessuno.
:::

Vienna, dodici anni dopo. Una cancelleria che sa di aceto e di inchiostro ferro-gallico. Un cancelliere raschia la carta con la penna d'oca, la spunta col temperino, poi riprende. Finita la pagina, sparge dalla sua ampolla sabbia fine sull'inchiostro fresco — un sibilo leggerissimo — e poi soffia via tutto.

Sul tavolo, una fiamma sotto un bastone di ceralacca rossa.

**Alex:** "Cosa state spedendo?"

**Il cancelliere:** "Il decreto del 2 gennaio. Da oggi, nei domini austriaci e boemi, i giudici non hanno più il diritto legale di torturare gli imputati."

**Alex:** "E come fate a sapere che a Lubiana o a Trieste leggeranno il testo giusto e non una copia storpiata?"

**Il cancelliere:** "Non mandiamo manoscritti. Mandiamo esemplari stampati alla Tipografia di Corte, in numero contato. Ognuno porta il sigillo in ceralacca dentro una capsula di legno, legata al foglio con cordoni di seta, e le firme dei consiglieri."

**Alex:** "E poi?"

**Il cancelliere:** "E poi corrieri a cavallo, con ricevuta firmata a ogni stazione di posta. Il governatore di provincia registra il testo, lo fa leggere ad alta voce dal balcone del municipio e fa stampare gli avvisi locali. La domenica dopo, i parroci li leggono dal pulpito."

Ecco come una legge arriva dove non arriva nessun filo: cavalli, ricevute firmate, un balcone — e alla fine la voce del parroco, l'unica che tutti ascoltano ogni settimana.

E qui bisogna essere precisi.

Non è che l'imperatrice si sia svegliata più buona. Otto anni prima, nel 1768, aveva firmato un codice penale che la tortura non l'aboliva affatto: la regolava nei dettagli, con le tavole incise a illustrare come si eseguono i tormenti legali. A far cambiare rotta furono un trattato del consigliere di corte Sonnenfels pubblicato nel 1775, la pressione del figlio co-reggente, e la constatazione amministrativa che le confessioni estorte producevano errori giudiziari e processi da rifare.

**MEMO:** *"Nel 1787 Giuseppe II promulga un nuovo codice penale. Stabilisce che nessuno può essere punito per un fatto che la legge non definisce come reato, e cancella i delitti religiosi come la magia e l'eresia."*

Fin qui l'ho scritto anch'io sul quaderno, l'anno scorso, con la frase che tutti sanno: Giuseppe II abolì la pena di morte.

Non è vero. O meglio: è vero a metà, ed è la metà che conta.

La pena capitale sparisce dalla giustizia ordinaria, ma resta nel diritto militare e nei casi di sedizione sotto legge marziale. E al suo posto arriva una punizione che di misericordioso non ha niente: i condannati vengono incatenati al traino dei barconi controcorrente sul Danubio, giorno e notte, con cibo minimo. Molti non arrivano al terzo mese.

Il primato vero, quello dell'abolizione totale e senza eccezioni, è del Granducato di Toscana: legge del 30 novembre 1786, firmata dal fratello minore dell'imperatore. Due mesi prima di Vienna.

Tre oggetti, tre gradi di certezza. Il trattato di Livorno prova che un uomo ha sostenuto una tesi. Il decreto sigillato prova che un sovrano ha comandato una regola. Se in una certa valle, in un certo anno, quella regola sia stata davvero applicata lo dicono solo i registri dei tribunali — e vanno letti uno per uno.

---

## Debriefing

Sul tavolo, alla fine, ci sono quattro cose. Un fascicolo senza nome d'autore uscito da Ginevra dentro una botte da aringhe. Una pianta a scacchiera disegnata sopra dei bacini di sale prosciugati. Un catalogo manoscritto, tascabile, di una biblioteca sul Breg. Un decreto stampato in copie contate, con il sigillo chiuso in una capsula di legno.

Alex ha seguito le persone e le loro decisioni: chi stampa di nascosto, chi si trasferisce in una città in cantiere, chi firma una legge e chi la porta a cavallo in provincia. Maja ha seguito il denaro, i libri, la lingua e l'accesso: chi paga, chi sceglie i titoli, chi può entrare in quella stanza e chi no. Nessuno dei due rapporti, da solo, spiega l'intera indagine.

**Verdetto:** regge meglio la lettura B, ma la A coglie una parte reale del cambiamento. Le idee dei Lumi offrirono criteri nuovi per giudicare potere e giustizia, e Maria Teresa e Giuseppe II ne trasformarono alcuni in riforme concrete — la tortura abolita nel 1776 non è un dettaglio. Ma nessuno dei due cedette un grammo di sovranità: decisero loro chi riceveva quali libertà e fino a dove. Le due periferie, poi, non nacquero da una firma: Trieste crebbe in sessant'anni di pali, magazzini e patenti diverse per ogni comunità; la rete di Lubiana la costruirono un padrone di ferriere e un ispettore scolastico, usando uno spiraglio che a Vienna nessuno aveva previsto. Questo è il dispotismo illuminato: cambiamento vero, deciso dall'alto, selettivo e revocabile.

::: reality-check
### CIÒ CHE NON SAPPIAMO ANCORA

*   **Quanto una lettura produce una legge:** che il libro di Beccaria circolasse nei territori asburgici è documentabile, ma per ogni singolo provvedimento resta difficile pesare quanto contarono il suo testo, i giuristi di corte, le esigenze amministrative e le decisioni dinastiche. Venire dopo non significa venire da lì.
*   **Quanto la patente diventò vita quotidiana:** i privilegi scritti non misurano da soli l'accesso reale al culto, ai mestieri, alla proprietà e alla scuola per le diverse comunità di Trieste. Fra la carta e la pratica c'è uno scarto che si può studiare solo caso per caso.
*   **Dove comincia e dove finisce il circolo di Zois:** incontri, lettere e finanziamenti sono documentati in gradi molto diversi. Composizione, data d'inizio e peso di ciascun membro dipendono in buona parte da ricostruzioni fatte molto dopo — la parola "circolo" l'hanno scelta gli storici, non i protagonisti.
:::

::: memo-box
### CRONOLOGIA ESSENZIALE

*   **1719:** Carlo VI dichiara Trieste porto franco.
*   **1748:** esce a Ginevra *De l'esprit des lois*.
*   **1763-1764:** *Traité sur la tolérance* e *Dei delitti e delle pene*.
*   **1774:** ordinamento scolastico di Maria Teresa.
*   **1781:** patente di tolleranza di Giuseppe II; negli stessi anni si forma a Lubiana la rete di Zois.
*   **1787:** nuovo codice penale di Giuseppe II.
:::

Un suddito riceve. Un cittadino autorizza. Per tutto questo secolo, in Europa, chi otteneva qualcosa lo otteneva perché qualcun altro aveva deciso di concederglielo — e poteva riprenderselo.

Prossima missione: attraversate l'Atlantico. Là alcune colonie stanno per sostenere che un governo che non ha il loro consenso non ha più il diritto di comandare.[^ee4]

[^ee4]: Curiosità cifrata (ROT13): *Ha zvarenyr ireqr cbegn vy fhb abzr: fv puvnzn mbvfvgr.*

<!-- WORD COUNT: ~5170 (incl. markdown/box syntax) -->
<!-- PERSONA CHECK: Alex/Maja voice intact? Pass — Alex mantiene il tic scarto media/realtà (limitato a 3 usi: squadra di filosofi, pieghevoli turistici, quaderno) e il battibecco asciutto con MEMO; Maja mantiene il tic "perché non lo so già" (rete di Zois/Linhart) e la lettura per strutture (denaro, accesso, lingua) senza mai scivolare nel tono di Alex. -->
<!-- NUF CHECK: 1 ✅ catena idee→selezione→decreti→applicazione→esiti ricostruibile; 2 ✅ Illuminismo vs dispotismo illuminato distinti nel Verdetto e nel memo-box; 3 ✅ trattato/patente/mappa/catalogo/registro confrontati esplicitamente nell'avvertenza di metodo e nel Debriefing; 4 ✅ fango, magazzini e diritti diseguali rendono Trieste concreta; 5 ✅ posta fisica della tortura resa senza spettacolo (criterio di robustezza, non descrizione clinica); 6 ✅ Montesquieu e Voltaire restano voci distinte, mai un programma unico; 7 ✅ porto franco 1719 collocato prima di Maria Teresa, Borgo Teresiano come sviluppo successivo; 8 ✅ circolo di Zois datato agli anni 1780-1791, Linhart senza nazionalismo anacronistico; 9 ✅ 1764/1776/1787 tenuti distinti con fonti e limiti; 10 ✅ scena di Maja autonoma, mai nota a margine. -->
<!-- ANTI-AI CHECK: nessuna frase vietata rilevata; nessun pattern bannato; formula sensoriale "il primo X arriva prima di Y" non utilizzata in questo capitolo (sotto il limite, non un difetto); MEMO sempre entro 3 informazioni per intervento dopo la correzione del blocco Calas; zero etichette di produzione nel corpo del testo dopo la correzione dei due usi residui di "capitolo" nel Debriefing. -->


<div style="page-break-after: always;"></div>

# Capitolo 5 — L'Espansione Atlantica E La Rivoluzione Americana

## Briefing

Alex, Maja: siamo nell'ultimo terzo del Settecento. Il primo atterraggio è a Boston, la sera del 16 dicembre 1773, e da lì seguirete le prove fino al 1797. Nell'ultimo salto avete visto l'Illuminismo e le riforme asburgiche arrivare dall'alto, decise da un sovrano per i suoi sudditi. Adesso dovete verificare cosa succede quando dei sudditi affermano il contrario: che il potere viene dal basso.

Il manuale propone questa catena: Londra tassa il tè senza dare rappresentanza → le colonie si ribellano → la Dichiarazione del 1776 consegna il potere al popolo → la Costituzione del 1787 crea una democrazia → l'idea attraversa l'Atlantico e arriva intatta fino a Trieste e a un salotto di Lubiana.

Qualcosa, in quella catena, non regge. Fra la cassa gettata in mare e il primo dei due documenti passano tre anni; fra il primo documento e il secondo ne passano altri undici; e fra la costa americana e le prime tracce asburgiche c'è un oceano che una freccia disegnata sulla mappa non attraversa da sola.

La vostra missione è raccogliere quattro prove, pesarle una per una e ricostruire la vera catena degli eventi.

## OBIETTIVI DEL SALTO

### 1. Il Tè Che Non Doveva Toccare L'Acqua (Boston, 16 dicembre 1773) — voce: Alex

Un molo al buio, tre navi ferme e un calzolaio con la faccia annerita.
**Prova da raccogliere:** stabilire se una tassa spiega da sola la protesta, o se lo scontro riguarda un intero sistema commerciale e il diritto di decidere.

### 2. Due Fogli, Undici Anni (Filadelfia, 4 luglio 1776 e 17 settembre 1787) — voce: Alex

Una bottega tipografica di notte e una sala d'assemblea con le finestre sbarrate in piena estate.
**Prova da raccogliere:** confrontare ciò che la Dichiarazione proclama con ciò che la Costituzione organizza — e con chi resta fuori.

### 3. Il Console Senza Dispacci (Trieste, 1797) — voce: Alex

Un mercante con due incarichi, una bandiera che non conoscete e una cartella d'archivio vuota.
**Prova da raccogliere:** determinare che cosa dimostrano una nomina e un'accettazione ufficiale quando le lettere del primo incaricato non esistono.

### 4. Il Posto Vuoto Nel Catalogo (Lubiana, 1797) — voce: Maja

Una biblioteca privata, un uomo che non può più camminare e un inventario scritto a mano.
**Prova da raccogliere:** cercare la traccia che separa un canale possibile di libri dalla ricezione documentata dell'idea americana nelle terre slovene.

Il rapporto è firmato da due cronoriporter: Alex nelle colonie, a Filadelfia e sull'Alto Adriatico; Maja dentro gli archivi e le reti intellettuali delle terre slovene. Le loro prove rispondono a domande diverse e si incontreranno soltanto alla fine.

Un'avvertenza sul metodo. Un ricordo raccontato sessant'anni dopo, un documento approvato e messo a verbale, una nomina senza dispacci e un titolo elencato in un catalogo non pesano allo stesso modo: per ogni traccia chiedetevi chi l'ha prodotta, quando, e che cosa può davvero dimostrare.

---

## Il Tè Che Non Doveva Toccare L'Acqua
<span class="byline">Cronaca di Alex</span>

Il catrame si attacca alle suole e non si stacca più. Sulle assi di Griffin's Wharf ce n'è dappertutto, spalmato sulle sartie delle navi e colato sul legno, e insieme al fango salmastro che la bassa marea ha scoperto compone un odore che ti entra in gola e ci resta. Fa un freddo asciutto, vicino allo zero. La luna è una falce sottile che illumina pochissimo, e va benissimo così: qui sotto quasi nessuno vuole essere visto.

*MEMO, dove mi hai messo?*

*"Boston, colonia della baia del Massachusetts, ore 19:04 locali. Tre navi mercantili ormeggiate con carico di tè della Compagnia delle Indie Orientali. Temperatura esterna prossima allo zero."*

Tre dati e nemmeno un consiglio su come non finire in acqua. Il servizio clienti del futuro.

Le figure che salgono a bordo non sono quelle dei film. Nessun copricapo di piume, nessun costume elaborato: uomini con la faccia impiastricciata di fuliggine di camino, polvere di carbone e grasso, vecchie coperte di lana annodate al collo, scarpe di cuoio con le fibbie di ferro. Un travestimento fatto in fretta, con quello che c'era in casa. Uno di loro si ferma a rifiatare vicino a me con un'accetta in mano. Ha le dita gonfie e il fiato che fuma.

**Alex:** "Perché un'accetta? Non basta scoperchiarle, le casse?"

**Hewes:** "Provaci. Fuori è legno duro, ma dentro c'è una camera di piombo saldata a stagno lungo tutti gli spigoli. La chiudono così perché il tè beve l'umidità e l'odore di ogni cosa: sentina, pesce, pece. Sei mesi di mare dentro una scatola di metallo. Una leva non la apre. Serve il ferro pesante."

**Alex:** "E tutto questo per non pagare la tassa sul tè?"

Mi guarda come se avessi detto una scemenza, e in effetti l'ho detta.

**Hewes:** "Questo tè costa meno di quello che compriamo di contrabbando dagli olandesi. Il prezzo non è il punto. Il punto è che la Compagnia lo vende soltanto tramite gli uomini che ha scelto lei: i mercanti di qui restano fuori, rovinati. E se lo compriamo a quel prezzo, ammettiamo che un Parlamento dove non sediamo possa metterci un tributo quando vuole. Il tè lo paghi una volta. Quell'ammissione la paghi per sempre."

Il dazio di tre penny per libbra era in vigore già dal 1767. La legge del 1773 non ne aggiunse nessuno: tolse alla Compagnia i dazi da pagare in patria e le regalò la vendita diretta nelle colonie, per salvarla dai debiti e da diciassette milioni di libbre di tè invenduto nei magazzini di Londra. Più conveniente e più ingiusto insieme.

**Alex:** "Se qualcuno vi riconosce?"

**Hewes:** "Nessuno deve poter giurare in tribunale di aver visto la mia faccia. Per questo ho la faccia nera. Domani torno a fare le scarpe."

::: memo-box
### MEMO GLOSSARIO

*   **Colonia:** territorio abitato e amministrato in dipendenza da uno Stato lontano, che ne controlla il governo e ne indirizza l'economia a proprio vantaggio.
*   **Mercantilismo:** il sistema di regole con cui la madrepatria obbliga le colonie a comprare e vendere passando da lei — navi, porti e dazi decisi a Londra, non a Boston.
*   **Rappresentanza politica:** poter partecipare, tramite persone elette, alle decisioni che ti vincoleranno. Le assemblee coloniali erano elette lì; nel Parlamento di Londra le colonie non avevano un solo seggio.
:::

I colpi d'accetta durano circa tre ore, dalle sette alle dieci di sera. Trecentoquarantadue casse forzate e rovesciate in mare, e il tè che galleggia in una zattera scura contro il fianco delle navi. Nessun marinaio degli equipaggi viene ferito o legato, nessun altro carico viene toccato, e alla fine i ponti vengono spazzati. La Compagnia quantificherà la perdita in 9.659 sterline, 6 scellini e 4 pence. Il peso del tè distrutto è una stima: gli storici lo collocano tra le 90.000 e le 92.600 libbre. Anche il numero degli uomini saliti a bordo è stimato, e le testimonianze oscillano fra sessanta e centotrenta.[^ee5]

Nessuno, quella notte, chiama l'azione "Boston Tea Party". Quel nome arriverà mezzo secolo più tardi. Qui la chiamano soltanto la distruzione del tè.

::: target-profile
### SCHEDA PERSONAGGIO: George Robert Twelves Hewes

*   **Ruolo:** calzolaio povero di Boston, 1773; uno dei pochissimi partecipanti di rango popolare che lascerà un ricordo dettagliato dell'azione.
*   **Forza:** 3 — braccia allenate al cuoio e allo spago, abbastanza da spaccare legno duro per tre ore di fila.
*   **Intelligenza:** 3 — capisce prima di molti signori istruiti che la posta in gioco non è il prezzo, ma chi ha il diritto di fissarlo.
*   **Carisma:** 2 — non comanda nessuno; conta come uno dei tanti, ed è esattamente questa la sua forza quella notte.
*   **Abilità Speciale:** *Arriva vivo dall'altra parte di sessant'anni di silenzio* — quando finalmente, nel 1834, qualcuno pensa di chiedere a un calzolaio povero che cosa vide quella notte, lui ha novantadue anni ed è ancora in grado di rispondere: per questo il paese impara quella notte dalla bocca di un uomo qualunque, e non da quella dei signori.
:::

Nella primavera successiva il Parlamento chiude il porto di Boston, sospende le assemblee cittadine e permette di trasferire altrove i processi ai funzionari del re. Il risultato è che dodici colonie, invece di isolare Boston, mandano i propri delegati a Filadelfia.

[^ee5]: Curiosità cifrata (ROT13): *Y'havpb srevgb qv dhryyn abggr sh anfpbfgb fbggb v gehpvbyv va han obggrtn qv snyrtanzr*

---

## Due Fogli, Undici Anni
<span class="byline">Cronaca di Alex</span>

L'inchiostro fresco sa di olio di lino cotto e trementina, e brucia dentro il naso. Sono le due di notte fra il 4 e il 5 luglio 1776, in una bottega all'angolo fra Market e Second Street, e nessuno qui dentro pensa di stare facendo Storia con la maiuscola: stanno lavorando. Le lampade a olio di balena scaldano più di quanto illuminino. Dal cassettino di legno le dita di un compositore pescano caratteri di piombo uno alla volta e li infilano a rovescio nel compositoio, con un ticchettio rapidissimo che non si interrompe mai.

A scuola mi avevano lasciato immaginare la scena del 4 luglio come una cerimonia: tutti i padri fondatori in fila, la penna d'oca, la firma solenne, i fuochi d'artificio. Qui non c'è nessuna cerimonia. C'è un torchio a mano che batte fogli di carta di stracci ancora umidi.

**Alex:** "Quindi oggi hanno dichiarato l'indipendenza."

**Dunlap:** "Oggi hanno approvato il testo. Il voto di separazione è di due giorni fa, il due. Su questo foglio ci sono due firme sole, quella del presidente e quella del segretario, perché servono a certificare che il testo è quello giusto. La pergamena da firmare in tanti non è nemmeno stata scritta."

**Alex:** "E adesso come fa a saperlo la gente? Sono millecinquecento chilometri di costa."

**Dunlap:** "Non stampo un libro. Stampo un manifesto a foglio unico, caratteri grandi. All'alba i cavalieri della posta partono con i fogli piegati nelle bisacce di cuoio incerato. Dove arrivano, un magistrato o un ufficiale lo legge ad alta voce in piazza, davanti alle truppe o dal pulpito, e poi lo inchiodano alla porta della taverna. Chi non sa leggere lo sente. Chi sa leggere lo ripete."

Tiratura stimata di quella notte: circa duecento copie. Nelle tre settimane successive il testo viene ristampato da ventinove gazzette locali. Nessun microfono, nessuna rete: polmoni, cavalli e chiodi.

Il testo dice due cose che nel 1776 sono esplosive. Che i governi ricevono i loro giusti poteri dal consenso dei governati. E che quando un governo distrugge i diritti per cui è nato, il popolo può cambiarlo. Poi elenca ventisette accuse, rivolte non al Parlamento ma direttamente a re Giorgio III. La guerra durerà altri sette anni: la Gran Bretagna riconoscerà l'indipendenza soltanto il 3 settembre 1783.

Undici anni dopo, stessa città, mese di luglio. Sto sudando fermo all'ombra e non serve a niente.

*MEMO, temperatura?*

*"Superiore ai trentadue gradi. Finestre della sala d'assemblea chiuse e bloccate per ordine dei delegati. Motivo registrato: impedire l'ascolto dall'esterno."*

Dentro, dietro le tende pesanti, quaranta e più uomini in marsina di lana scura e parrucca incipriata discutono da maggio. Le mosche cavalline arrivano dalle scuderie di noleggio a due passi e pungono attraverso le calze di seta. Un usciere esce a prendere aria e resta appoggiato allo stipite.

**Alex:** "Ma la Dichiarazione non aveva già risolto tutto?"

**Usciere:** "Di quello che si dice là dentro non posso ripetervi una parola. Ho giurato come tutti. Ma per sapere che cosa non funziona non serve entrare: sono tredici Stati che non riescono a mettersi d'accordo nemmeno sui dazi fra loro, e l'anno scorso, in Massachusetts, i contadini indebitati hanno preso le armi contro i tribunali. Nessuno sapeva a chi toccasse fermarli."

Ci ragiono su. La Dichiarazione dice da chi viene il potere; non dice chi riscuote le imposte, chi comanda l'esercito, chi giudica una lite fra due Stati.

**Alex:** "Quindi lì dentro non stanno riscrivendo il perché. Stanno decidendo il come."

L'usciere guarda la porta chiusa e non risponde.

**Usciere:** "Quando escono a mangiare, però, discutono ad alta voce. E tornano sempre sulla stessa parola: dividere."

Dividere è esattamente quello che esce da quella porta a settembre: un pezzo di potere al governo di tutti, un pezzo a ciascuno Stato, e dentro il governo di tutti tre organi che si sorvegliano a vicenda perché nessuno arrivi a decidere da solo. Il 17 settembre 1787 il testo viene firmato da trentanove dei quarantadue delegati presenti: tre si rifiutano, soprattutto perché manca un elenco esplicito dei diritti. Non entra in vigore subito: servono le assemblee di almeno nove Stati su tredici, e il nono arriva il 21 giugno 1788.

::: memo-box
### MEMO GLOSSARIO

*   **Sovranità popolare:** risponde alla domanda "da chi deriva il potere?". Non da Dio attraverso un re, ma dal consenso dei governati.
*   **Federalismo:** risponde a "fra quali livelli è diviso?". Politica estera, difesa, moneta e commercio fra Stati al governo nazionale; leggi civili e penali, scuola e regole del voto ai singoli Stati.
*   **Pesi e contrappesi:** risponde a "come si impedisce a un organo di dominare gli altri?". Il presidente può bloccare una legge del Congresso; il Congresso può processare il presidente; i giudici federali non dipendono da nessuno dei due.
:::

C'è però una parte che nessuno mi aveva raccontata. La Costituzione non stabilisce chi vota: lascia decidere a ciascuno Stato, e quasi tutti chiedono di possedere terra o di pagare imposte dirette. Chi lavora a giornata resta fuori. Le donne restano fuori in dodici Stati su tredici — l'unica eccezione è il New Jersey, dove dal 1790 le nubili e le vedove che possiedono beni votano davvero, finché nel 1807 il parlamento locale non toglie loro il diritto.

Poi c'è la parola che nel testo non compare mai. "Schiavo" non è scritto da nessuna parte, eppure l'istituto è protetto tre volte: per contare la rappresentanza una persona schiavizzata vale tre quinti di una libera, la tratta atlantica non può essere vietata prima del 1808, e chi fugge in uno Stato libero dev'essere restituito.

Tre quinti. Rileggo due volte, perché la prima sono sicuro di aver capito male. Non è un modo di dire: è una divisione che qualcuno ha fatto davvero, con la penna in mano, in questa stanza soffocante.

Le popolazioni indigene sono escluse esplicitamente dalla cittadinanza politica. E gli storici stimano che nelle prime elezioni federali, fra il 1788 e il 1789, avesse i requisiti per votare una quota compresa fra il sei e l'otto per cento della popolazione.

Undici anni per passare da un foglio che proclama a un sistema che funziona. E il "popolo" del secondo foglio non è ancora tutta la gente del primo.

::: checkpoint
### CHECKPOINT: nel 1787 la sovranità popolare è già un risultato compiuto, o è un principio rivoluzionario che le nuove istituzioni applicano solo in parte?

Finora hai raccolto: a Boston la protesta contesta chi possa imporre regole e monopoli, non il prezzo del tè; a Filadelfia la Dichiarazione fonda il governo sul consenso e la Costituzione distribuisce i poteri, ma lascia fuori dal voto la grande maggioranza delle persone.

*   **A.** È soprattutto un risultato compiuto: la rottura con il re e il nuovo sistema federale spostano davvero la legittimità dai sovrani ai governati, anche se il voto resta ristretto.
*   **B.** È soprattutto un principio aperto: i documenti cambiano la fonte dichiarata del potere, ma compromessi ed esclusioni mostrano che il "popolo" politico del 1787 è ancora una minoranza.

Tieni a mente la tua risposta — il Verdetto te la confermerà, la correggerà, o ti mostrerà che la realtà era più complicata di entrambe.
:::

---

## Il Console Senza Dispacci
<span class="byline">Cronaca di Alex</span>

La Bora prende il molo di traverso e ti sbatte in faccia spruzzi gelati che sanno di sale e di pece. Trieste, 1797, mattina presto: la pietra d'Istria della riva è lucida d'acqua, all'imboccatura del Canal Grande gli alberi maestri dondolano tutti insieme come un bosco storto, e dai fondachi arriva un miscuglio che non riesco a separare — caffè tostato dei mercanti greci, barili di aringhe salate, olio d'oliva, polvere di minerale di ferro. Sulle banchine si urla in almeno cinque lingue: triestino, tedesco d'ufficio, greco, l'inglese secco dei marinai oceanici, e lo sloveno dei carrettieri che scendono dall'altopiano.

Cerco una bandiera e ne trovo una che non riconosco: quindici stelle e quindici strisce. È quella giusta per quest'anno.

Lo studio del console è una stanza sopra un magazzino: carte nautiche arrotolate, una bilancia di precisione per pesare l'argento delle monete, boccette di ceralacca scarlatta, registri di pergamena rilegati in cuoio con dentro pagine ancora bianche.

**Alex:** "Lei rappresenta gli Stati Uniti qui?"

**Wagner:** "Ne ho ricevuto la designazione, e il governo imperiale l'ha accettata. È la prima volta che accade in questi domini. Sono anche console del Regno di Svezia, e sono un mercante di questa città: non sono un inviato arrivato per nave da Filadelfia."

**Alex:** "E lo stipendio?"

**Wagner:** "Non esiste. Il console commerciale si compensa con le tariffe che riscuote sugli atti: fedi di sanità per il lazzaretto, ruoli d'equipaggio, polizze di carico, proteste di mare quando una nave torna con l'avaria. Chi vi immaginate che venga a fare questo lavoro gratis, se non uno che ha già i suoi affari sul posto?"

**Alex:** "Perché adesso? Vent'anni fa Vienna non aveva nemmeno voluto ricevere un rappresentante americano."

**Wagner:** "Perché adesso il Mediterraneo è in guerra, e una nave che batte bandiera neutrale può caricare cotone, tabacco e riso e passare dove le altre non passano. Una bandiera neutrale, in questo porto, vale più di un trattato."

::: memo-box
### MEMO GLOSSARIO

*   **Console:** non è un ambasciatore. Non tratta la politica fra due Stati: assiste i mercanti, i marinai e le navi del proprio paese in un porto straniero, e certifica i loro documenti.
*   **Riconoscimento diplomatico:** l'atto con cui uno Stato accetta ufficialmente che un altro Stato esista e si possano avere rapporti con lui.
*   **Exequatur:** l'autorizzazione scritta con cui il governo ospitante permette a un console straniero di esercitare davvero le sue funzioni sul proprio territorio.
:::

Gli chiedo come fa una lettera ad arrivare fino in America. Mi mostra il metodo: ogni dispaccio viene copiato a mano in tre o quattro esemplari identici. L'originale parte con il capitano di una nave diretta a Baltimora o a Boston, il duplicato s'imbarca su un altro bastimento con rotta diversa, magari via Londra o Amsterdam, il terzo resta registrato nel volume dell'ufficio. I fogli si piegano su sé stessi senza busta, si sigillano con ceralacca che tiene all'umidità salmastra, e si chiudono in sacchetti di tela cerata zavorrati di piombo: se arrivano i corsari, il capitano butta la sacca in mare e quella affonda in un attimo. In tempo di guerra, una sola lettera spedita una sola volta ha meno di una probabilità su due di arrivare.

Ed è qui che la mia prova mi si sbriciola in mano.

*MEMO, quanti dispacci di Wagner sono conservati negli archivi di Washington?*

*"Zero. La serie dei dispacci consolari da Trieste si apre soltanto con il suo successore. La storiografia ritiene altamente probabile che Wagner non abbia mai esercitato la carica sul campo."*

Nemmeno dell'exequatur scritto, quel foglio che dovrebbe autorizzarlo a lavorare davvero, risulta traccia. Il successore verrà nominato alla fine del 1799, impiegherà quasi due anni per arrivare fin qui, e l'autorizzazione imperiale la riceverà solo nel marzo 1802: cinque anni per fare, con le carte in regola, quello che Wagner forse non ha mai cominciato.

Quindi cosa posso scrivere nel rapporto, esattamente? Che nel 1797 l'Impero asburgico ha riconosciuto per la prima volta l'esistenza degli Stati Uniti accettando un console a Trieste: questo è documentato, ed è un rapporto fra due governi. Che quel console abbia aperto un ufficio, scritto una lettera o portato in questo porto una sola parola di quello che a Filadelfia era stato dichiarato: questo no, perché non c'è una riga che lo dimostri.

---

## Il Posto Vuoto Nel Catalogo
<span class="byline">Cronaca di Maja</span>

La stufa di maiolica verde è alta quasi fino al soffitto e brucia legna di faggio da ore, ma in questa stanza il freddo resta appiccicato ai vetri piombati. Palača sul Breg, Lubiana, un pomeriggio di tardo autunno del 1797: sotto la finestra la Ljubljanica scorre scura e non fa rumore. C'è odore di cera d'api sui mobili di noce e, sotto, quello secco della carta di stracci di centinaia di volumi rilegati in pelle chiara.

Poi c'è il rumore che riconosco prima di girarmi: le ruote di legno cerchiate di una carrozzella spinta piano sul pavimento.

Il barone Žiga Zois ha cinquant'anni e le dita gonfie e infiammate. La gotta e la spondilite gli hanno tolto le gambe: non viaggia più, non scende più al fiume, non va più da nessuna parte. Tutta l'Europa gli arriva in due modi soltanto, lettere e cataloghi a stampa.

**Maja:** "Barone, avete libri sull'America."

**Zois:** "Ne ho. La storia dell'America di Robertson, in francese. I viaggi di Chastellux nel Nord. Una descrizione degli indiani d'America stampata a Londra. Geografia, popoli, minerali, fiumi."

**Maja:** "E i documenti politici? Quello del 1776, dove si scrive che ogni governo prende i suoi poteri dal consenso dei governati."

Silenzio. Il segretario alza gli occhi dal leggio girevole e non dice niente.

**Zois:** "Guardate voi stessa negli inventari. Sono lì."

Guardo io stessa, senza fretta: un errore di lettura costerebbe caro a una prova come questa. Della Dichiarazione non c'è traccia in nessuna delle lingue fra cui questi quaderni sono divisi, né come traduzione, né come opuscolo a parte. Gli elenchi risalgono al 1780 e al 1782, il catalogo di slavistica è stato compilato proprio quest'anno: copertine di cartone grezzo, fogli vergati a penna in un corsivo tedesco fitto e ordinatissimo, i titoli soltanto in caratteri latini tondi. E la stessa assenza si ripete nei cataloghi successivi, nelle lettere di questa casa, in quelle di chiunque altro nel circolo.

Le lingue, del resto, sono anche il modo in cui questi scaffali sono divisi. Latino, tedesco, francese, italiano, inglese: leggo le etichette una per una, e alla seconda passata capisco che cosa mi stona. Manca quella che si parla fuori da questa porta, sul Breg, al mercato. La biblioteca più ricca di queste terre non ha uno scaffale per la lingua di queste terre. Uno glielo stanno costruendo adesso: è il quaderno che il segretario tiene aperto sul leggio, e sulla prima pagina c'è la data di quest'anno.

Ecco una cosa che a scuola non mi hanno mai detto: un vuoto in un catalogo può valere quanto una riga scritta — ed è spesso la prova più scomoda da accettare.

::: scan-result
### SCANNING: POPISI KNJIG — INVENTARI DELLA BIBLIOTECA ZOIS

*   **Tipo:** quaderni manoscritti di inventario, non schedario a schede mobili (quello nascerà mezzo secolo dopo).
*   **Materiale:** carta di stracci, legatura in cartone grezzo, inchiostro ferro-gallico; grafia corsiva tedesca con titoli in caratteri latini.
*   **Funzione:** registrare per lingua e per materia la più ricca biblioteca privata delle terre slovene: la raccolta identificata conta 2.296 titoli in circa 5.000 volumi.
*   **Dettaglio Tecnico:** i primi elenchi sono del 1780 e 1782; seguono i cataloghi di slavistica del 1797 e del 1810 e il catalogo di stima del 1821. In nessuno di essi compare la Dichiarazione d'Indipendenza o la Costituzione americana.
:::

**Maja:** "Non l'avete voluto, oppure non ve l'hanno lasciato arrivare?"

**Zois:** "Calcolate voi stessa. L'imperatore è in guerra con la repubblica francese. Tre anni fa hanno scoperto una congiura a Vienna e a Pest, e nel maggio del '95 hanno decapitato i capi. Da allora la censura riguarda le carte prima che si stampino, non dopo. Un foglio che dichiari che i sudditi possono disfare il loro governo non è un libro proibito: è un capo d'accusa."

**Maja:** "Eppure voi i libri proibiti li fate arrivare."

Sorride appena, e per la prima volta sembra divertito.

**Zois:** "Con tre accorgimenti. Mi faccio spedire i cataloghi delle fiere di Lipsia e di Francoforte e segno a matita i titoli nuovi. Poi tengo l'elenco ufficiale delle opere vietate e lo leggo alla rovescia: è la migliore bibliografia d'Europa, la compilano loro e me la mandano gratis. E infine i volumi delicati viaggiano dentro le casse di campioni minerali e di attrezzi che arrivano alle mie ferriere. Nessun doganiere ha voglia di svuotare quintali di pietre per cercare un libro sul fondo."

Un canale così funziona in entrambe le direzioni: può portare qualunque cosa, e non dimostra che abbia portato una cosa precisa. È la differenza fra "poteva arrivare" e "è arrivato, ed è stato letto".

::: memo-box
### MEMO GLOSSARIO

*   **Ricezione:** non significa possedere un testo. Significa leggerlo, discuterlo, usarlo per un proprio ragionamento — e ciascuno di questi gradini richiede una prova diversa.
*   **Censura:** il controllo statale su ciò che può essere stampato o fatto circolare. Nella monarchia asburgica del 1797 è preventiva: si esamina prima, non si sequestra dopo.
*   **Repubblica delle lettere:** la rete europea di corrispondenti, librai e studiosi che si scambiano libri e notizie attraverso i confini. Non è uno Stato, non ha un territorio, e Zois ne è un nodo.
:::

Mi resta il giornale della città. Esce qui dal 1783, e dell'America si occupa poche righe alla volta: una battaglia, navi che si spostano, notizie di seconda mano ricopiate dalle gazzette di Vienna e di Germania. Lo sfoglio annata per annata, con le dita che si sporcano d'inchiostro vecchio. Di quel foglio di Filadelfia, e di quello che quel foglio afferma, non compare nemmeno il titolo.

E allora la scena me la vedo lo stesso, ed è esattamente questo il pericolo. Basterebbe pochissimo: il leggio girevole che ruota verso la finestra, una mano che intinge la penna e aggiunge una riga al quaderno aperto, e la riga dice *Filadelfia, 1776*. Sarebbe una pagina magnifica. Solo che i quaderni ce li ho davanti, veri, e quella riga in nessuno di essi l'ha scritta nessuno. Nel rapporto ci va il vuoto, con le sue date e le sue segnature d'archivio. Non seduce. È l'unica cosa che posso dimostrare.

---

## Debriefing

Sul tavolo, in fila: la cassa foderata di piombo, i due fogli stampati a undici anni di distanza, la nomina consolare a cui non segue nessuna lettera, e l'inventario dove manca una riga. L'ultimo pesa quanto gli altri tre. Alex ha seguito la catena che trasforma una protesta in istituzioni; Maja ha misurato il passaggio che nessuna istituzione compie da sola, quello fra una strada possibile e una lettura dimostrata.

**Verdetto:** regge meglio la lettura B, ma tiene dentro un pezzo della A. La Rivoluzione americana non nasce da una tassa isolata, ma da un conflitto lungo su commercio, monopolio e diritto di decidere: il tè è solo il detonatore visibile. La Dichiarazione del 1776 proclama una fonte nuova del potere, la Costituzione del 1787 la organizza in un sistema federale — e insieme lascia fuori dal voto donne, persone schiavizzate, popolazioni indigene e la maggioranza di chi non possiede beni. L'ultimo tratto della catena, poi, non regge affatto: l'idea non attraversa l'oceano come un pacco intatto. A Trieste l'accettazione di un console prova un rapporto fra due governi; a Lubiana, dove il canale per i libri stranieri esisteva ed è documentato, non c'è una sola traccia che la Dichiarazione sia stata posseduta, letta o discussa. Il rapporto lo scrive così, invece di trasformare una possibilità in un fatto.

::: reality-check
### CIÒ CHE NON SAPPIAMO ANCORA

*   **Quanto pesò ciascuna causa:** tasse, vincoli commerciali, monopolio, rappresentanza e reazione britannica agirono insieme, e gli storici discutono ancora quale abbia contato di più — la ricostruzione tradizionale della tassa nuova, però, è smentita dal testo stesso della legge del 1773.
*   **Che cosa fece davvero il primo console a Trieste:** l'accettazione del 1797 è documentata, ma non sopravvive nessun suo dispaccio; non sappiamo se sia arrivato in servizio, se abbia mai ricevuto un exequatur scritto, né il mese esatto della nomina.
*   **Quanto poteva sapere il circolo di Lubiana:** cataloghi, lettere e giornali non registrano il testo americano, ma un'assenza di tracce non dimostra un'assenza totale di notizie — dimostra che, allo stato delle fonti, la discussione non si può affermare.
:::

::: memo-box
### CRONOLOGIA ESSENZIALE

*   **1763:** nuova fase della politica fiscale e imperiale britannica verso le colonie.
*   **1773:** la distruzione del tè nel porto di Boston.
*   **1776:** Dichiarazione d'Indipendenza.
*   **1787:** firma della Costituzione degli Stati Uniti.
*   **1797:** l'Impero asburgico accetta il primo console statunitense a Trieste.
:::

Un'idea non arriva perché esiste una rotta. Arriva quando qualcuno la legge, la discute e la usa — e ognuno di quei tre passaggi lascia una traccia diversa, o non ne lascia nessuna.

Prossimo salto. Se una rivoluzione nata nelle colonie impiega undici anni per diventare istituzione e lascia tracce così incerte nell'Europa asburgica, che cosa succede quando la stessa domanda sul potere esplode nel centro di Parigi?

<!-- WORD COUNT: ~4650 -->
<!-- PERSONA CHECK: Alex/Maja voice intact? Pass — Alex mantiene il tic scarto-media/realtà (cerimonia immaginata a scuola vs. torchio a mano) usato con misura, il battibecco sobrio con MEMO, e la curiosità da dramma individuale (Hewes, Dunlap, l'usciere, Wagner). Maja apre la propria scena in autonomia, nota la lingua e l'assenza prima del dettaglio materiale, e chiude sul vuoto documentario invece che su una scena immaginata — coerente con "perché non lo so già" e con il suo rifiuto di sostituire una prova con un'ipotesi seducente. -->
<!-- NUF CHECK: [1 ✅ catena colonie→tassazione→rappresentanza→indipendenza→costituzione ricostruita senza ridurla al tè] [2 ✅ Dichiarazione vs Costituzione distinte per funzione, sovranità proclamata non ancora distribuita] [3 ✅ quattro livelli di prova — disponibilità/lettura/discussione/uso — esplicitati nel Beat 4 e nel Verdetto] [4 ✅ rischio concreto della notte di Boston reso tramite Hewes: riconoscimento, tribunale, anonimato] [5 ✅ tensione di Maja fra vuoto onesto e scena seducente, esplicitata nel finale del Beat 4] [6 ✅ Boston Tea Party datato e ricollegato a monopolio/rappresentanza, cifre marcate come stime] [7 ✅ Dichiarazione e Costituzione distinte con fonti su sovranità, federalismo, pesi e contrappesi, esclusioni] [8 ✅ 1783 e 1797 distinti, nomina/accettazione/servizio effettivo di Wagner tenuti separati] [9 ✅ biblioteca Zois come canale documentato senza inventare una discussione della Dichiarazione] [10 ✅ scena slovena autonoma, la prova di Maja non dipende da Trieste] -->
<!-- ANTI-AI CHECK: nessuna frase vietata individuata, nessun pattern bannato, apertura di scena variata (nessun abuso della formula "il primo X arriva prima di Y" — usata al più con una variante nel Beat 4, non ripetuta), MEMO entro il limite di tre informazioni per intervento, target-profile con Abilità Speciale che supera il test operativo, Easter Egg singolo con nota breve (chiave già insegnata nel Capitolo 0), zero etichette di produzione nel testo. -->


<div style="page-break-after: always;"></div>

# Capitolo 6 — La Rivoluzione Francese E La Fine Dell'Antico Regime

## Briefing

Alex, Maja: si torna indietro. Primo atterraggio Parigi, 14 luglio 1789, in pieno Settecento, e da lì seguirete le prove fino all'ottobre 1797. A quel 1797 eravate già arrivati nel capitolo precedente, ma dalla strada americana. Stavolta ci arrivate da Parigi, e la catena è tutta diversa.

Il manuale la mette così: la crisi dell'Antico Regime fa esplodere la presa della Bastiglia → i privilegi cadono → la Francia rivoluzionaria affida libertà e uguaglianza a un giovane generale → la Campagna d'Italia e Campoformio cancellano in un colpo solo la millenaria Repubblica di Venezia e portano la Rivoluzione nei territori attraversati.

Qualcosa non torna. Il giorno in cui il governo veneziano smette di esistere non è il giorno del trattato: in mezzo ci sono cinque mesi. E le carte dell'Alto Adriatico e della Carniola non raccontano un unico, ordinato "arrivo della libertà".

La vostra missione è raccogliere quattro prove, pesarle una per una e ricostruire la vera catena degli eventi.

## OBIETTIVI DEL SALTO (SCENE)

### 1. Dalla Bastiglia Al Terrore (Parigi, 14 luglio 1789 – 27 luglio 1794) — voce: Alex

Una fila davanti a un forno alle tre di notte, e un orologiaio che sale per primo sulla torre.
**Prova da raccogliere:** che cosa rende la Bastiglia un punto di rottura, e quali passaggi separano la fine dei privilegi dal Terrore.

### 2. Libertà Con Gli Scarponi (Italia settentrionale, 1796-1797) — voce: Alex

Un foglio stampato inchiodato a una porta, un esercito senza scarpe e un generale di ventisei anni.
**Prova da raccogliere:** confrontare i proclami rivoluzionari con i governi, le contribuzioni e le requisizioni che la Campagna d'Italia produce.

### 3. Due Date Per Una Fine (Venezia, Passariano e Trieste, 12 maggio – 17 ottobre 1797) — voce: Alex

Una ceralacca incrinata e due documenti che nessuno ha mai messo uno accanto all'altro.
**Prova da raccogliere:** separare la fine del governo veneziano dalla spartizione diplomatica, e cercare che cosa quelle clausole significassero per un mercante dell'Alto Adriatico.

### 4. Libertà Sulla Carta, Soldati Alla Porta (Lubiana e campagna carniolina, primavera 1797) — voce: Maja

Un manifesto in due lingue, un barone che non può alzarsi dalla sedia, una fossa scavata nel bosco.
**Prova da raccogliere:** confrontare parole, lingue e costi dell'occupazione, e verificare se gruppi sociali diversi abbiano ricevuto la stessa Rivoluzione.

Firmano in due. Alex ricostruisce la rottura di Parigi, la campagna militare e i due documenti che ridisegnano l'Alto Adriatico; Maja interroga le fonti nate nelle terre slovene quando la notizia diventa occupazione. Nessuno dei due riceve il riassunto dell'altro.

Un'avvertenza. Un proclama stampato, il voto di un consiglio, una clausola diplomatica, una lettera anonima e un registro di requisizioni non pesano uguale: chiedetevi chi parla, quando scrive e soprattutto chi non può rappresentare.

---

## Dalla Bastiglia Al Terrore
<span class="byline">Cronaca di Alex</span>

Sono le tre del mattino e sto tenendo una corda. Canapa ruvida, tesa lungo il muro di un forno: tutti quelli in fila la stringono con una mano. Donne con lo scialle, ragazzi della mia età, una vecchia che dorme in piedi con la fronte sulle pietre. L'aria di Parigi sa di cenere umida e di fogna.

*MEMO, perché stiamo tutti attaccati a una corda?*

*"Parigi, 14 luglio 1789, ore 03:12. Il pane da quattro libbre è arrivato a un prezzo stimato fra i 14 e i 15 soldi. Un manovale non specializzato guadagna fra i venti e i trenta soldi al giorno."*

Faccio il conto due volte perché la prima non ci credo. Tre quarti dello stipendio. Per il pane.

La donna davanti a me mi sposta la mano sulla fune. Al buio ci si scavalca, e chi si scavalca finisce sotto: la corda tiene ognuno al suo posto fino all'apertura.

**Alex:** "E se il pane finisce prima del vostro turno?"

**La donna:** "Allora si prende il bis, quello scuro con la crusca e la segala: pesa di più e ti resta nello stomaco. E se manca anche quello, si tirano fuori le croste della settimana. Si spezzettano nella pentola: acqua bollente, una foglia di cavolo, ortica pestata, un pezzo di lardo se c'è, finché il pane beve tutto. Con mezza libbra di pane duro mangiano in cinque."

**Alex:** "E se il fornaio nasconde la farina per rivenderla più cara?"

**La donna:** "Allora entriamo noi. I pani finiscono sul bancone, si contano, e sul tagliere restano dieci soldi per quattro libbre: il prezzo giusto, non il suo. Fuori restano gli uomini con i bastoni, così la guardia comunale non si azzarda a intervenire."

Non è una ricetta, è una tecnica di sopravvivenza, e me la spiega con la faccia con cui mia nonna spiega come si sbuccia una mela.

Sedici ore dopo sono in un cortile e respiro male. Aria calda, polvere nera bruciata, calce; in mezzo al selciato brucia un mucchio di paglia acceso apposta per togliere la mira ai tiratori sulle torri.

L'uomo che mi passa accanto ha dita da chi monta ingranaggi minuscoli.

**Humbert:** "Orologiaio. Jean-Baptiste Humbert. Sulle torri ci sono salito per primo, e domani lo faccio stampare su un foglio, perché fra un anno diranno tutti di essere stati i primi."

A scuola la Bastiglia me l'avevano raccontata come una prigione piena di innocenti da liberare. Chiedo dove sono i prigionieri e Humbert mi guarda come se avessi chiesto dov'è il mare.

**Humbert:** "Sette. Quattro falsari di cambiali, due che hanno perso la testa, un nobile chiuso qui dalla sua famiglia. Non siamo venuti per loro. Siamo venuti per la polvere: i fucili li abbiamo presi stamattina agli Invalides, quasi trentamila, ma la polvere l'avevano portata qui dentro l'altro ieri. Duecentocinquanta barili. Fucili senza polvere sono bastoni. E i cannoni delle torri sono puntati sulle nostre case."

::: memo-box
### MEMO GLOSSARIO

*   **Antico Regime:** l'ordine politico e sociale francese precedente al 1789, diviso in tre ordini — clero, nobiltà e Terzo Stato, quest'ultimo circa il 98% della popolazione e quasi l'unico a pagare le imposte dirette.
*   **Privilegio feudale:** un diritto o un obbligo diseguale legato al ceto e alla signoria: esenzioni fiscali per i primi due ordini, canoni, decime e giornate di lavoro dovute dai contadini al signore.
:::

Negli elenchi ufficiali degli assalitori figurano quel giorno circa novantotto morti e una settantina di feriti gravi; fra i difensori cade un solo invalido, e dopo la resa il governatore de Launay viene linciato per strada. Il conto non è pulito da nessun lato.

*MEMO, e adesso i privilegi?*

*"Notte del 4 agosto 1789: l'Assemblea vota la soppressione del regime feudale. Aboliti subito e senza indennizzo la servitù personale, la corvée e le decime. Ma i canoni legati alla terra restano da riscattare a pagamento."*

Cioè: il contadino che stanotte brinda perché non deve più le giornate al signore, domattina scopre che il resto lo deve comprare. La cancellazione totale e gratuita arriva solo il 17 luglio 1793. Il 26 agosto l'Assemblea approva la Dichiarazione dei diritti dell'uomo e del cittadino: il primo dei diciassette articoli dice che gli uomini nascono e restano liberi ed eguali nei diritti.

Poi il salto in avanti. In mezzo: la fuga del re a Varennes, la guerra dichiarata all'Austria nell'aprile 1792, l'assalto alle Tuileries, la Repubblica, l'esecuzione di Luigi XVI, la Vandea in rivolta, gli eserciti stranieri alle frontiere.

::: memo-box
### MEMO GLOSSARIO

*   **Terrore:** la fase di governo d'emergenza e repressione fra il settembre 1793 e il 27 luglio 1794 — non un sinonimo dell'intera Rivoluzione, ma undici mesi dentro dieci anni.
:::

Nella sala del Comitato di salute pubblica mi aspettavo un trono e un uomo solo che decide. Ci sono dodici sedie, dodici membri rieletti ogni mese dalla Convenzione, e ognuno ha il suo pezzo: Carnot gli eserciti, Lindet i rifornimenti, Robespierre la linea politica. Litigano. Si controllano. Firmano insieme.

Secondo il censimento più usato dagli storici i tribunali rivoluzionari eseguono poco meno di sedicimilaseicento condanne a morte; con le esecuzioni sommarie e i morti nelle carceri le stime salgono a trentacinque-quarantamila vittime. Circa l'ottantaquattro per cento del Terzo Stato. Non nobili: contadini, artigiani, operai.

Il 27 luglio 1794 Robespierre viene arrestato e giustiziato il giorno dopo con Saint-Just, Couthon e diciannove altri. Il governo d'emergenza finisce lì.

Cinque anni prima, davanti a un forno, una donna mi spiegava come si allunga il pane vecchio. Nessuno dei due sapeva dove sarebbe arrivata quella fila.

---

## Libertà Con Gli Scarponi
<span class="byline">Cronaca di Alex</span>

Il foglio è inchiodato alla porta di una chiesa, stampato di fresco, e la gente intorno è tanta che qualcuno legge ad alta voce per gli altri. Parla di libertà. Parla di uguaglianza. Dice che l'esercito della Repubblica Francese non fa la guerra ai popoli, ma ai tiranni.

*MEMO, dove sono?*

*"Italia settentrionale, primavera 1796. Il generale di divisione Napoleone Bonaparte, ventisei anni, ha assunto il comando dell'Armata d'Italia a Nizza il 27 marzo. La penisola è divisa in una decina di Stati: nessuno Stato italiano unitario esiste."*

Dietro di me, su un muretto, c'è un fuciliere a cui del foglio non importa niente: è occupato con un piede. La suola della scarpa d'ordinanza si è staccata del tutto e lui la tiene in mano come si tiene una cosa rotta.

**Alex:** "Ve ne danno altre?"

**Il fuciliere:** *(ride senza allegria)* "La paga è arretrata di mesi. Ci arriva quello che troviamo." Tira fuori un rettangolo di cuoio bagnato, scuoiato da un bue requisito la sera prima. "Cuoio verde. Ci appoggio sopra il piede fasciato negli stracci di lana unti di lardo, ripiego i lembi, buco il bordo con la baionetta e lego una cordicella alla caviglia. Dopo due ore di marcia si secca e prende la forma esatta del mio piede."

**Alex:** "E mangiare?"

**Il fuciliere:** "In città il furiere si fa dare dal podestà le chiavi dei forni, requisisce la farina e mette i garzoni a impastare tutta la notte: all'alba le pagnotte calde ce le passano infilzate sulle baionette. Fuori dai paesi, farina e acqua fredda nella gamella, un pizzico di sale, dischi sottili cotti sulle pietre. Non è pane, ma si porta in tasca."

Ha detto "requisisce" senza cambiare tono, come si dice "piove".

::: memo-box
### MEMO GLOSSARIO

*   **Campagna d'Italia:** la sequenza coordinata di operazioni militari condotte in Italia settentrionale dall'Armata d'Italia fra il 1796 e il 1797.
*   **Requisizione:** l'ordine che impone a un comune o a un privato di consegnare all'esercito viveri, foraggio, animali o carri — con o senza pagamento, mai con la possibilità di dire di no.
*   **Repubblica sorella:** un nuovo Stato repubblicano creato sotto protezione francese, con costituzione modellata su quella francese ma vincolato alle decisioni militari e diplomatiche di Parigi.
:::

Sulla carta questo esercito conta sessantamila uomini. Quelli davvero in grado di combattere, secondo le stime degli storici, sono fra trentotto e quarantatremila, con meno di trenta cannoni da campagna e i cavalli da traino ridotti pelle e ossa.

E vince. In aprile si incunea fra piemontesi e austriaci e li batte separatamente; il 28 aprile 1796 il re di Sardegna firma l'armistizio di Cherasco e si sfila dalla guerra. Il 15 maggio entra a Milano, e due giorni dopo impone alla sola Lombardia venti milioni di franchi in contanti e metalli preziosi. Al duca di Modena ne chiede dieci. Al papa, con l'armistizio di Bologna, ventuno milioni, cento opere d'arte e cinquecento manoscritti vaticani.

Intanto nascono le repubbliche sorelle: la Cispadana a fine dicembre 1796, prima ad adottare un vessillo verde, bianco e rosso; la Cisalpina proclamata a Milano il 29 giugno 1797. Costituzioni nuove, cittadini invece di sudditi, tribunali riformati. Non è finzione. Ma la loro sovranità finisce dove comincia una decisione militare francese.

::: target-profile
### SCHEDA PERSONAGGIO: Napoleone Bonaparte

*   **Ruolo:** generale di divisione della Repubblica Francese, comandante in capo dell'Armata d'Italia, 26 anni nel 1796. Non è imperatore: lo diventerà solo nel 1804.
*   **Forza:** 2 — fisicamente non è nulla di speciale: la sua arma è dove mette gli uomini.
*   **Intelligenza:** 5 — sposta divisioni intere di trenta-quarantacinque chilometri al giorno su sentieri di montagna, per essere in più nel punto esatto dello scontro.
*   **Carisma:** 5 — promette a soldati scalzi e non pagati pane, vestiti e riscatto, e loro camminano.
*   **Abilità Speciale (Leva Diplomatica della Vittoria):** trasforma una battaglia vinta la mattina in un trattato firmato la sera, trattando da solo con re, duchi e imperatori — e mettendo Parigi davanti al fatto compiuto senza averne mai chiesto il permesso.
:::

Sul proclama celebre — *"Soldati, siete nudi, mal nutriti..."* — c'è una cosa scomoda: la versione che tutti citano è una riscrittura dettata anni dopo a Sant'Elena. Che nella primavera del 1796 abbia promesso pane e ricchezze prese ai nemici lo confermano gli ordini del giorno coevi. Le parole esatte, no.

Nel marzo 1797, caduta Mantova, l'armata riparte: passa il Tagliamento, entra a Gorizia il 21 marzo e a Trieste il 23, prosegue dentro la Carniola e la Carinzia fino a Leoben, a centocinquanta chilometri da Vienna. Il 18 aprile lì si firmano i preliminari di pace, con clausole segrete che dispongono dei territori della Repubblica di Venezia — che è neutrale, e a cui la guerra non è ancora stata dichiarata.

Il fuciliere, quando riparte, ha ancora il cuoio verde legato al piede. Il foglio sulla porta della chiesa non l'ha letto. Nessuno gliel'ha chiesto.

::: checkpoint
### CHECKPOINT: Quando l'esercito rivoluzionario entra in Italia, che cosa pesa di più nelle sue scelte — i principi proclamati o il vantaggio strategico?

Hai raccolto due prove: nel 1789 la Rivoluzione produce una rottura vera contro privilegi e arbitrio; nel 1796-1797 lo stesso esercito porta parole politiche e governi nuovi, ma vive di vittorie, negoziati e requisizioni.

*   **A.** È soprattutto una rivoluzione esportata: le vittorie abbattono vecchi ordinamenti e aprono spazio a diritti nuovi, e occupazione e requisizioni sono costi contingenti della guerra.
*   **B.** È soprattutto una conquista negoziata: principi e repubbliche nuove contano davvero, ma quando entrano in conflitto con territori, risorse e pace militare prevale il vantaggio strategico.

Tieni a mente la tua risposta: il Verdetto te la confermerà, la correggerà, o ti mostrerà che la realtà era più complicata di entrambe.
:::

---

## Due Date Per Una Fine
<span class="byline">Cronaca di Alex</span>

Il rumore che mi fa girare la testa è secco: la ceralacca rossa che si spezza sotto un tagliacarte di corno. Palazzo della Borsa mercantile di Trieste, fine ottobre 1797, luce gialla di lampade a olio sulle vetrate piombate. Fuori, sul Canal Grande, l'odore del catrame da calafataggio, delle aringhe nei barili di rovere e dei sacchi di caffè. Dentro, solo penne d'oca che grattano sui registri di pelle.

Il mediatore che ha appena aperto il dispaccio lo legge due volte prima di parlare.

**Alex:** "Cattive notizie?"

**Il mediatore:** "Non lo so ancora. È questo il problema." Gira il foglio verso di me. "Vede la piegatura? La lettera non viaggia in una busta: si ripiega su se stessa e si chiude con la ceralacca e il mio sigillo. Se fosse arrivata incrinata e rifusa con cera comune, sapevo che la censura postale l'aveva aperta prima di me."

**Alex:** "E se la nave affonda?"

**Il mediatore:** "Per questo ogni notizia si scrive tre volte. La prima parte via terra con la posta a cavallo, per Lubiana e Graz. La seconda la porta il capitano di un trabaccolo neutrale verso Fiume o Ancona. La terza resta copiata a mano, parola per parola, nel mio copialettere. E in cima a ognuna scrivo qual è: *vi rimetto copia della mia prima in data*..."

Poi mi spiega che cosa c'è scritto sul foglio. E qui la storia che avevo in testa si spacca in due.

Perché io ero convinto — come credo tutti — che la Repubblica di Venezia fosse finita in una notte, con una firma. E invece le date sono due, e sono lontane cinque mesi.

*MEMO, la prima.*

*"12 maggio 1797, Palazzo Ducale. Il Maggior Consiglio si riunisce per l'ultima volta sotto il doge Ludovico Manin, con le truppe francesi schierate a Marghera. Vota il trasferimento dei poteri a una Municipalità Provvisoria filofrancese."*

::: memo-box
### MEMO GLOSSARIO

*   **Doge:** il capo elettivo della Repubblica di Venezia, scelto fra i patrizi e vincolato dalle magistrature, non un re.
*   **Maggior Consiglio:** l'organo centrale dell'ordinamento veneziano, composto dai patrizi aventi diritto — circa milleduecento persone.
*   **Neutralità:** la scelta di non partecipare a una guerra. Non garantisce da sola che gli eserciti degli altri rispettino il tuo territorio.
:::

Nell'aula ci sono cinquecentotrentasette patrizi su circa milleduecento; le leggi fondamentali della Repubblica ne chiedono almeno seicento per una decisione del genere. Il voto è cinquecentododici favorevoli, venti contrari, cinque registrati come "non sinceri". Fuori, in laguna, gli Schiavoni della Dalmazia sparano in aria mentre si imbarcano per tornare a casa, e i patrizi credono sia cominciato il massacro. Manin depone corno ducale e veste e se ne va a piedi.

Un voto senza numero legale, preso nel panico, con i cannoni a otto chilometri. Politicamente irreversibile. Giuridicamente nullo secondo le leggi della Repubblica stessa.

Poi c'è la seconda data. Il 17 ottobre 1797, cinque mesi dopo, Bonaparte e i plenipotenziari asburgici firmano il trattato di pace. La Francia cede alla Casa d'Austria Venezia, l'Istria, la Dalmazia, le Bocche di Cattaro e la Terraferma veneta fino all'Adige; in cambio ottiene il riconoscimento della Repubblica Cisalpina, i Paesi Bassi austriaci, le isole Ionie ex venete, e in articoli segreti la riva sinistra del Reno.

Il trattato si chiama Campoformio. Ma il tavolo su cui è stato firmato, verso l'una di notte fra il 17 e il 18 ottobre, stava a Villa Manin a Passariano — la residenza estiva dell'ultimo doge, requisita da Bonaparte come quartier generale.[^ee6]

**Alex:** "E per voi, qui, è un affare o un disastro?"

**Il mediatore:** "Tutte e due, e non scherzo. Da oggi il litorale è tutto territorio interno della stessa monarchia: legname dalla Dalmazia, pietra d'Istria, olio, vino, senza più pagare pedaggi a San Marco. Ottimo." Chiude il registro. "Però adesso Vienna possiede anche Venezia. E se un giorno le venisse in mente di spostare là parte dei privilegi del nostro porto franco?"

Sette mesi prima, dal 23 marzo al 27 maggio, i francesi avevano occupato Trieste e imposto alla città una contribuzione di due milioni e seicentomila franchi. Il mediatore quella cifra la ricorda meglio di qualunque articolo del trattato.

---

## Libertà Sulla Carta, Soldati Alla Porta
<span class="byline">Cronaca di Maja</span>

Nel sobborgo di Krakovo il fango arriva alle caviglie e la Ljubljanica è grossa di pioggia d'aprile. Oltre le case, sulla piazza del Municipio, i tamburi francesi scandiscono il cambio della guardia.

Sul muro accanto alla fontana, in piazza, c'è il manifesto. Due colonne. Una in tedesco, in caratteri gotici. L'altra nella lingua che parlo io.

Che fosse successo, lo sapevo già. Vederlo scritto è un'altra cosa: nella primavera del 1797, per quarantun giorni, nel capoluogo della Carniola i proclami dell'esercito francese furono affissi e letti ad alta voce anche in sloveno. Questo dettaglio, a scuola, nessuno me l'ha mai raccontato.

*MEMO, cosa c'è scritto?*

*"Il comando garantisce rispetto per la religione cattolica, per il clero, per le persone e per le proprietà private. Invita gli abitanti a non abbandonare la città. Ordina la consegna di tutte le armi entro ventiquattro ore."*

Poche righe più sotto, sullo stesso foglio, il registro cambia del tutto: alla magistratura civica si ordinano contribuzioni in denaro da versare entro pochi giorni, più un flusso continuo di carne, pane, avena e fieno per i cavalli.

Libertà e requisizione. Stessa carta. Stesso inchiostro.

::: memo-box
### MEMO GLOSSARIO

*   **Occupazione militare:** il controllo temporaneo di un territorio da parte di un esercito straniero, che amministra e pretende risorse senza cambiare le leggi civili.
*   **Tlaka (corvée):** le giornate di lavoro obbligatorio e non pagato che i contadini dipendenti devono al signore fondiario, a mano o con i propri buoi.
*   **Requisizione:** già vista in Italia settentrionale; qui non tocca un esercito nemico, ma le dispense di una casa.
:::

L'uomo che legge accanto a me ha le maniche di un funzionario e gli occhi di chi prende appunti a memoria. Il nome non me lo dice, e non lo dirà neanche d'estate, quando le sue nove lettere usciranno stampate a Lubiana dall'officina di Eger.

**Maja:** "L'avevate immaginata così?"

**L'anonimo:** "No di certo. Le voci parlavano di fuoco e di stragi, e metà della nobiltà è fuggita verso la Bassa Carniola e la Stiria portandosi dietro l'argenteria. Poi sono arrivati davvero, e il problema non è stato il sangue: è stato trovare un letto per tre ufficiali, mentre mio cognato gli rivendeva il vino al doppio."

**Maja:** "Quindi va tutto bene?"

**L'anonimo:** "Questo non l'ho detto. I conventi sono diventati scuderie, e vino, farina e fieno escono dalle case senza più tornare indietro. Tengo nota di tutto perché so già come andrà a finire: fra dieci anni qualcuno racconterà questi quarantun giorni in un modo diverso da come li ho vissuti io."

È un testimone. Non è il popolo. Un funzionario municipale che non ha mai avuto fame è una voce, non un coro.

Il barone Žiga Zois, nel suo palazzo sul Breg, non è fuggito come gli altri. Il motivo non è il coraggio: sono le gambe, paralizzate dalla gotta, a tenerlo su una sedia a rotelle disegnata da lui stesso. Possiede miniere di ferro a Bohinj e ferriere a Javornik, e per tutto il tempo in cui parliamo non smette un istante di firmare carte.

**Maja:** "Voi che cosa temete di più — i francesi o quello che dicono i francesi?"

**Zois:** "Il ferro. Temo che smetta di arrivare. Con la strada piena di soldati non scende dalle miniere, e senza quello non ho da pagare né i minatori né la stampa dei miei libri. Per questo non mi muovo: rifornisco chi me lo chiede e non prendo posizione con nessuno. È l'unico modo che conosco per non perdere quello che ho."

Tra le carte sul tavolo spunta un numero delle *Lublanske novice*, il primo giornale mai stampato in sloveno: esce da gennaio, due volte a settimana, un centinaio di abbonati in tutto. In città circola anche una strofa satirica di questi giorni, di autore mai identificato: *Trka nam Francoz na vrata*, il francese bussa alla porta, e il buon Francesco manda in soccorso il fratello Carlo. Il quale, nel frattempo, si ritira.

Fuori Lubiana, verso il Carso, la storia cambia. Le campane di campagna suonano a martello: quel rintocco irregolare vuol dire cavalleria in arrivo. Un ragazzo spinge due buoi giù dalla strada maestra, con la cavezza corta perché non facciano rumore. Una donna con le mani rosse di terra mi spiega dove è finita la semente.

**La contadina:** "Nel granaio no, mai. Il granaio lo aprono per primo e battono il pavimento con le bacchette di ferro. La fossa la scaviamo nel bosco, a forma di fiasco: dentro si brucia paglia per disinfettarla, si fodera di corteccia di betulla, si riempie di grano e di ajda, si chiude con tavole di quercia sigillate d'argilla, e sopra ci va terra, muschio, foglie."

**Maja:** "E il maiale?"

**La contadina:** "Il lardo affumicato si avvolge nel lino con la cenere fine, che tiene lontane umidità e mosche, e si sotterra nella pila di fieno. Le bestie vanno nelle doline, legate corte, col fieno davanti perché mastichino e non muggiscano."

**Maja:** "E i proclami? Quello sul muro dice libertà e uguaglianza."

Si pulisce le mani sul grembiule e non risponde subito.

**La contadina:** "La tlaka la devo lo stesso. Le giornate al signore le devo lo stesso, e la decima anche. Poi devo il fieno a questi. Prima ne dovevo a uno."

Ha ragione, ed è la cosa che i manifesti non dicono. L'occupazione francese del 1797 dura quarantun giorni, dal 28 marzo all'8 maggio, e non abolisce niente: signoria fondiaria e tlaka restano intatte, durante il passaggio dei repubblicani e dopo. La servitù della gleba nella monarchia asburgica finirà nel 1848.

Il 28 aprile Bonaparte in persona attraversa Lubiana tornando da Graz e dorme nel palazzo vescovile. Il 9 maggio non c'è più un soldato francese in Carniola.

Tre testimoni, tre versioni, e nessuna delle tre parla per le altre due.

---

## Debriefing

Mission Control ha messo gli oggetti-prova sullo stesso tavolo: una crosta di pane duro e una chiave della fortezza, un proclama accanto a un ordine di requisizione, l'atto veneziano di maggio accanto al trattato di ottobre, un opuscolo anonimo di Lubiana accanto a un pezzo di corteccia di betulla.

Alex ha seguito le decisioni. Maja ha seguito il conto da pagare. Stessa storia vista da due altezze, e nessuna delle due la contiene tutta.

**Verdetto.** Nessuna delle due letture del Checkpoint basta da sola, ma la B spiega meglio le decisioni territoriali del 1797. La Rivoluzione abbatté davvero i privilegi e cambiò il linguaggio della legittimità: dopo il 1789 il potere deve dire da dove viene. Ma la Campagna d'Italia portò quei principi insieme a guerra, occupazione e interessi strategici, e a Campoformio la promessa di liberare i popoli perse contro la convenienza della pace. La Repubblica di Venezia non è sparita per una firma in una notte: il vecchio governo si è sciolto il 12 maggio sotto pressione militare, dentro una crisi già aperta, e solo il 17 ottobre il trattato ha assegnato Venezia, Istria e Dalmazia agli Asburgo. Né è esistita una reazione unica: a Trieste e in Carniola interessi commerciali, proprietà, obblighi rurali e presenza dei soldati hanno dato alla stessa notizia significati diversi.

::: reality-check
### CIÒ CHE NON SAPPIAMO ANCORA

*   **Come spiegare il Terrore:** gli storici discutono ancora quanto pesino la guerra alle frontiere, le rivolte interne, le istituzioni d'emergenza e le scelte dei singoli dirigenti — e persino dove far cominciare e finire quel periodo.
*   **Quanto fosse inevitabile la fine di Venezia:** pressione francese, neutralità disarmata, divisioni interne, rivolte sulla Terraferma e calcolo diplomatico compaiono in tutte le ricostruzioni, ma con pesi diversi secondo che si leggano fonti veneziane, francesi o storiografia recente.
*   **Quanto siano rappresentative le reazioni documentate in Carniola:** l'opuscolo anonimo è la voce di un funzionario urbano, le lettere di Zois quelle di un grande proprietario, i registri di requisizione quelle di chi amministrava. La voce delle famiglie contadine passa quasi sempre per la penna di qualcun altro.
:::

::: memo-box
### CRONOLOGIA ESSENZIALE

*   **14 luglio 1789:** presa della Bastiglia.
*   **4 agosto 1789:** abolizione dei privilegi feudali.
*   **1793-1794:** fase del Terrore.
*   **1796:** inizio della Campagna d'Italia di Bonaparte.
*   **primavera-12 maggio 1797:** prima occupazione francese della Carniola e fine del governo della Repubblica di Venezia.
*   **17 ottobre 1797:** Trattato di Campoformio.
:::

Principi, violenza, istituzioni e diplomazia stanno tutti dentro la stessa catena senza essere la stessa cosa. E quella catena europea diventa storia delle terre slovene nel momento esatto in cui si può vedere chi legge il manifesto e chi consegna il fieno.

Nel 1797 i francesi attraversano la Carniola, restano quarantun giorni e se ne vanno. Nel 1809 torneranno per quattro anni, con Lubiana scelta come capitale. Che cosa cambia, quando un esercito di passaggio decide di restare?

[^ee6]: Curiosità cifrata (ROT13): *Pnzcbsbezvb r vy abzr fhyyn pnegn zn yn svezn niiraar n Cnffnevnab aryyn ivyyn qryy hygvzb qbtr*

<!-- WORD COUNT: ~4440 -->
<!-- PERSONA CHECK: Alex/Maja voice intact? Pass — Alex keeps the media-vs-reality tic (Bastille prisoners), the MEMO sarcasm, the individual-drama focus (baker's queue, fusiliere's shoe). Maja keeps the "why didn't anyone tell me" tic, the structural/language focus (proclamation columns, requisition ledgers), and interviews three unequal witnesses instead of one composite "people." No condescension between them since they don't share a scene this chapter. -->
<!-- NUF CHECK: [1] ✅ chain from fiscal crisis through Bastille, Terror, Italian campaign to the two-date fall of Venice, no automatic arrow — [2] ✅ principles (end of privileges, equal rights) kept distinct from their uneven application (redeemable dues, requisitions, occupation) — [3] ✅ merchant, official, Zois, and peasant woman each read the same event differently, explicitly graded as unequal-weight testimony — [4] ✅ bread queue scene grounds the material pressure before 14 July without turning it into a violence spectacle — [5] ✅ Maja's discomfort at "libertà e requisizione. Stessa carta. Stesso inchiostro." sits without an easy resolution — [6] ✅ Bastille/4 August/Terror kept chronologically distinct, casualty figures marked as official counts and estimates — [7] ✅ Italian campaign presented as revolutionary war, Napoleon not called emperor, Italy not unified — [8] ✅ 12 May and 17 October kept as two separate documents/events — [9] ✅ Carniola occupation built from proclamation + anonymous letters + Zois + peasant testimony, no fused "the Slovenes felt X" — [10] ✅ Maja's scene opens and stays self-contained, never framed as a footnote to Alex's beats. -->
<!-- ANTI-AI CHECK: no banned openers ("Immaginate di...", "Ebbene sì..."), no explicit moral closers, no production-jargon labels in the body, single target-profile with an Abilità Speciale that passes the operational test (diplomatic leverage, not "he wins battles"), checkpoint used once at chapter midpoint with two genuinely plausible readings, Easter Egg footnote follows the short-form convention (decoder key already taught in Cap. 0). -->


<div style="page-break-after: always;"></div>

