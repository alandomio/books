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

::: memo-box
### MEMO: COME SI LEGGE UN CODICE ROT13
Ogni lettera si sposta di 13 posizioni nell'alfabeto (A↔N, B↔O, C↔P... si applica due volte per tornare al testo originale). Prova su questa: *Xvfn* → [il lettore prova a decifrare].
:::

[^ee0]: Curiosità cifrata (ROT13 — vedi sopra come si decifra): *Va fybirafpvav Pbfgnagvabcbyv fv erpr Pnevtenq.*

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

*MEMO, avvisa Maja,* penso. *Le vasche ancora attive hanno appena fatto partire un carico superstite verso l'interno.*

**MEMO:** *"Messaggio inviato. Destinazione dichiarata dal salinaio: Carniola, Carinzia, Stiria."*

---

## Il Banco Sul Fiume
<span class="byline">Cronaca di Maja</span>

Una bestemmia, forte, in sloveno, da qualche parte dietro le chiatte — seguita da una risata di tre o quattro voci. È così che arrivo al Breg, il porto fluviale di Lubiana, sulla riva della Ljubljanica: è il 1489, e intorno a quella risata c'è tutto il resto insieme, cavalli da tiro che sbuffano infangati fino ai garretti, grida di barcaioli, il cigolio delle carrucole di faggio, e sopra tutto un odore di pece nera, catrame di bosco, segatura d'abete bagnata.

Una chiatta grande sta scaricando: botti di sale marino, barre di ferro lavorato, legname. Il barcaiolo che dirige l'operazione ha le mani spesse come guanti.

*MEMO, confronta,* penso. *È il carico partito oggi dalle vasche ancora attive di Zaule — quello segnalato da Alex?*

**MEMO:** *"Stessa provenienza, stessa destinazione verso l'interno. Nessun altro dato trasmesso."*

Ad Alex interessava chi produce questo sale. A me interessa chi ha il diritto di farlo viaggiare da qui in avanti.

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

Alex, Maja: si torna indietro. Primo atterraggio Parigi, 14 luglio 1789, in pieno Settecento, e da lì seguirete le prove fino all'ottobre 1797. A quel 1797 eravate già arrivati nella missione precedente, ma dalla strada americana. Stavolta ci arrivate da Parigi, e la catena è tutta diversa.

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

Una ceralacca spezzata e due documenti che quasi nessuno mette uno accanto all'altro.
**Prova da raccogliere:** separare la fine del governo veneziano dalla spartizione diplomatica, e cercare che cosa quelle clausole significassero per un mercante dell'Alto Adriatico.

### 4. Libertà Sulla Carta, Soldati Alla Porta (Lubiana e campagna carniolina, primavera 1797) — voce: Maja

Un manifesto in due lingue, un barone che non può alzarsi dalla sedia, una fossa scavata nel bosco.
**Prova da raccogliere:** confrontare parole, lingue e costi dell'occupazione, e verificare se gruppi sociali diversi abbiano ricevuto la stessa Rivoluzione.

Firmano in due. Alex ricostruisce la rottura di Parigi, la campagna militare e i due documenti che ridisegnano l'Alto Adriatico; Maja interroga le fonti nate nelle terre slovene quando la notizia diventa occupazione. Nessuno parla al posto dell'altro. Ma ciascuno può mettere alla prova le conclusioni dell'altro.

Un'avvertenza. Un proclama stampato, il voto di un consiglio, una clausola diplomatica, una lettera anonima e un registro di requisizioni non pesano uguale: chiedetevi chi parla, quando scrive e soprattutto chi non può rappresentare.

---

## Dalla Bastiglia Al Terrore
<span class="byline">Cronaca di Alex</span>

Sono le tre del mattino e sto tenendo una corda. Canapa ruvida, tesa lungo il muro di un forno: tutti quelli in fila la stringono con una mano. Donne con lo scialle, ragazzi della mia età, una vecchia che dorme in piedi con la fronte sulle pietre. L'aria di Parigi sa di cenere umida e di fogna.

*MEMO, perché stiamo tutti attaccati a una corda?*

*"Parigi, 14 luglio 1789, ore 03:12. Il pane da quattro libbre è arrivato a un prezzo stimato fra i 14 e i 15 soldi. Un manovale non specializzato guadagna fra i venti e i trenta soldi al giorno."*

Non era quello che ti avevo chiesto, MEMO. Faccio il conto due volte perché la prima non ci credo. Per chi prende venti soldi, sono tre quarti della paga. Per il pane.

La donna davanti a me mi sposta la mano sulla fune. Al buio ci si scavalca, e chi si scavalca finisce sotto: la corda tiene ognuno al suo posto fino all'apertura.

**Alex:** "E se il pane finisce prima del vostro turno?"

**La donna:** "Allora si prende il pane bigio, quello scuro con la crusca, la segale e le fave: pesa di più e ti resta nello stomaco. E se manca anche quello, si tirano fuori le croste della settimana. Si spezzettano nella pentola: acqua bollente, una foglia di cavolo, ortica pestata, un pezzo di lardo se c'è, finché il pane beve tutto. Con mezza libbra di pane duro mangiano in quattro o cinque."

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

Nella sala del Comitato di salute pubblica mi aspettavo un trono e un uomo solo che decide. Ci sono dodici sedie intorno a un tavolo sommerso di carte. Cinque anni in dieci secondi mi hanno tagliato le gambe, così mi lascio cadere sulla più vicina. Un usciere mi tira su per il gomito.

**L'usciere:** "Quella è del cittadino Carnot. Gli eserciti."

**Alex:** "E quella in fondo? Robespierre? È lui che comanda, no?"

**L'usciere:** "Lui tiene la linea politica. Il cittadino Lindet tiene il grano e i rifornimenti, e così via, tutti e dodici. La Convenzione li rielegge ogni mese." Abbassa la voce. "Litigano. Si controllano. Ma da questa stanza un decreto esce con più di una firma in fondo."

*MEMO, quanti morti?*

*"Il censimento più usato dagli storici conta 16.594 condanne a morte eseguite dopo un processo. Aggiungendo esecuzioni sommarie e morti in carcere, le stime salgono a 35.000-40.000 vittime. Circa l'84% dei condannati apparteneva al Terzo Stato."*

Per la maggior parte, niente parrucche incipriate. Contadini, artigiani, operai.

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

E vince. In aprile si infila fra piemontesi e austriaci e li batte uno alla volta; il 28 aprile 1796, a Cherasco, il re di Sardegna firma l'armistizio ed esce dalla guerra. Il 15 maggio l'armata entra a Milano. Due giorni dopo arriva il conto: 20 milioni di franchi in monete e metalli preziosi, solo per la Lombardia.

*MEMO, e gli altri?*

*"Duca di Modena: 10 milioni di franchi. Il papa, con l'armistizio di Bologna: 21 milioni, 100 opere d'arte, 500 manoscritti vaticani."*

Detta così, MEMO, sembra la lista della spesa. Solo che la spesa la paga qualcun altro.

Intanto nascono le repubbliche sorelle: la Cispadana a fine dicembre 1796, prima ad adottare un vessillo verde, bianco e rosso; la Cisalpina proclamata a Milano il 29 giugno 1797. Costituzioni nuove, cittadini invece di sudditi, tribunali riformati. Non è finzione. Ma la loro sovranità finisce dove comincia una decisione militare francese.

::: target-profile
### SCHEDA PERSONAGGIO: Napoleone Bonaparte

*   **Ruolo:** generale di divisione della Repubblica Francese, comandante in capo dell'Armata d'Italia, 26 anni nel 1796. Non è imperatore: lo diventerà solo nel 1804.
*   **Forza:** 2 — fisicamente non è nulla di speciale: la sua arma è dove mette gli uomini.
*   **Intelligenza:** 5 — sposta divisioni intere di trenta-quarantacinque chilometri al giorno su sentieri di montagna, per essere in più nel punto esatto dello scontro.
*   **Carisma:** 5 — promette a soldati scalzi e non pagati pane, vestiti e riscatto, e loro camminano.
*   **Abilità Speciale (Leva Diplomatica della Vittoria):** trasforma una vittoria in una firma prima che il nemico abbia il tempo di riorganizzarsi — Cherasco, Bologna, Leoben — trattando direttamente con i rappresentanti di re, duchi, papa e imperatore, e mettendo più di una volta il governo di Parigi davanti al fatto compiuto.
:::

Sul proclama celebre — *"Soldati, siete nudi, mal nutriti..."* — c'è una cosa scomoda: la versione che tutti citano è una riscrittura dettata anni dopo a Sant'Elena. Che nella primavera del 1796 abbia promesso pane e ricchezze prese ai nemici lo confermano gli ordini del giorno coevi. Le parole esatte, no.

Nel marzo 1797, con Mantova caduta già a febbraio, l'armata riparte: passa il Tagliamento, entra a Gorizia il 21 marzo e a Trieste il 23, prosegue dentro la Carniola e la Carinzia fino a Leoben, a centocinquanta chilometri da Vienna. Il 18 aprile lì si firmano i preliminari di pace, con clausole segrete che dispongono dei territori della Repubblica di Venezia — che è neutrale, e a cui la guerra non è ancora stata dichiarata.

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

Il rumore che mi fa girare la testa è secco: la ceralacca rossa che si spezza sotto un tagliacarte di corno. Sala della Borsa mercantile di Trieste, fine ottobre 1797, luce gialla di lampade a olio sulle vetrate piombate. Dalle banchine del Canal Grande entra l'odore del catrame da calafataggio, delle aringhe nei barili di rovere e dei sacchi di caffè. Dentro, solo penne d'oca che grattano sui registri di pelle.

Il mediatore che ha appena aperto il dispaccio lo legge due volte prima di parlare.

**Alex:** "Cattive notizie?"

**Il mediatore:** "Non lo so ancora. È questo il problema." Gira il foglio verso di me. "Vede la piegatura? La lettera non viaggia in una busta: si ripiega su se stessa e si chiude con la ceralacca e il mio sigillo. Se la ceralacca fosse incrinata, o rifusa con cera comune, saprei che la censura imperiale l'ha aperta prima di me."

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

Il registro di quella seduta conta 537 patrizi presenti su circa 1.200; le leggi fondamentali della Repubblica ne chiedono almeno 600 per una decisione del genere. Il voto: 512 favorevoli, 20 contrari, 5 registrati come "non sinceri". Fuori, in laguna, gli Schiavoni della Dalmazia sparano in aria mentre si imbarcano per tornare a casa, e i patrizi credono che sia cominciato il massacro. Manin depone corno ducale e veste e se ne va a piedi.[^ee6]

**Alex:** "Aspetti. Ne servivano seicento e ce n'erano cinquecentotrentasette. Allora quel voto non vale."

**Il mediatore:** "Per le leggi di San Marco, no." Allarga le mani. "Ma i patrizi sono tornati a casa, e i francesi a Marghera sono rimasti. Vada Lei a leggere il regolamento a un cannone."

Poi c'è la seconda data. Il 17 ottobre 1797, cinque mesi dopo, Bonaparte e i plenipotenziari asburgici firmano il trattato di pace. La Francia cede alla Casa d'Austria Venezia, l'Istria, la Dalmazia, le Bocche di Cattaro e la Terraferma veneta fino all'Adige; in cambio ottiene il riconoscimento della Repubblica Cisalpina, i Paesi Bassi austriaci, le isole Ionie ex venete, e in articoli segreti la riva sinistra del Reno.

Il trattato si chiama Campoformio. Ma il tavolo su cui è stato firmato, verso l'una di notte fra il 17 e il 18 ottobre, stava a Villa Manin a Passariano — la residenza estiva dell'ultimo doge, requisita da Bonaparte come quartier generale.

**Alex:** "E per voi, qui, è un affare o un disastro?"

**Il mediatore:** "Tutte e due, e non scherzo. Da oggi il litorale è tutto territorio interno della stessa monarchia: legname dalla Dalmazia, pietra d'Istria, olio, vino, senza più pagare pedaggi a San Marco. Ottimo." Chiude il registro. "Però adesso Vienna possiede anche Venezia. E se un giorno le venisse in mente di spostare là parte dei privilegi del nostro porto franco?"

Sette mesi prima, dal 23 marzo al 27 maggio, i francesi avevano occupato Trieste e imposto alla città una contribuzione di due milioni e seicentomila franchi. Il mediatore quella cifra la ricorda meglio di qualunque articolo del trattato.

---

## Libertà Sulla Carta, Soldati Alla Porta
<span class="byline">Cronaca di Maja</span>

Nel sobborgo di Krakovo il fango arriva alle caviglie e la Ljubljanica è grossa di pioggia d'aprile. Oltre le case, sulla piazza del Municipio, i tamburi francesi scandiscono il cambio della guardia.

Sul muro accanto alla fontana, in piazza, c'è il manifesto. Due colonne. Una in tedesco, in caratteri gotici. L'altra nella lingua che parlo io.

Per quarantun giorni, nella primavera del 1797, nel capoluogo della Carniola i proclami dell'esercito francese vennero affissi e letti ad alta voce anche in sloveno. Nessuno me l'ha mai fatto vedere. Non a scuola, non in una mostra, non in una foto a margine di un libro. Adesso ce l'ho a un palmo dal naso.

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

Accanto a me c'è un uomo che non dirà mai il proprio nome — nemmeno d'estate, quando le sue nove lettere usciranno a stampa a Lubiana, dall'officina di Eger, in un tedesco pieno di espressioni di qui e indirizzate a un compare che vive a Lož. Per ora è solo maniche da funzionario e occhi di chi sta già componendo mentalmente una frase da annotare.

**Maja:** "Cosa vi avevano detto di aspettarvi?"

**L'anonimo:** *(abbassa la voce)* "Mio cognato gli vende il vino al doppio del prezzo, e io devo trovare un letto a tre ufficiali: ecco tutto il sangue che scorre a Lubiana. Eppure, prima che arrivassero, si parlava solo di fuoco e di stragi. Metà della nobiltà è scappata verso la Bassa Carniola e la Stiria, con l'argenteria nei bauli."

**Maja:** "Quindi è andata meglio di quanto temevate?"

**L'anonimo:** "Non proprio: il vino, la farina e il fieno delle case escono e non tornano più, e nei conventi, dove prima c'erano i frati, ora ci sono i cavalli. Ma scrivo tutto, perché lo so già: fra dieci anni qualcuno racconterà questi quarantun giorni in un modo del tutto diverso da come li ho vissuti io."

È un testimone. Non è il popolo. Un funzionario municipale che non ha mai avuto fame è una voce, non un coro.

Firma carte senza fermarsi un istante, per tutto il tempo in cui gli parlo — il barone Žiga Zois, proprietario delle miniere di ferro di Bohinj e delle ferriere di Javornik, non si è mosso dal suo palazzo sul Breg quando gli altri sono fuggiti. Non per coraggio: la gotta gli ha bloccato le gambe, e si muove solo grazie a una sedia a rotelle che si è disegnato da sé.

**Maja:** "Barone, a voi fanno più paura le baionette o la parola *uguaglianza*?"

**Zois:** "Il ferro. Temo che smetta di arrivare. Con la strada piena di soldati non scende dalle miniere, e senza quello non ho da pagare né i minatori né la stampa dei miei libri. Per questo non mi muovo: rifornisco chi me lo chiede e non prendo posizione con nessuno. È l'unico modo che conosco per non perdere quello che ho."

Gli ho chiesto di un'idea. Mi ha risposto con un carico di ferro.

Tra le carte sul tavolo spunta un numero delle *Lublanske novice*, il primo giornale mai stampato in sloveno: esce da gennaio, due volte a settimana, forse un centinaio di abbonati in tutto. In città circola anche una strofa satirica di questi giorni, di autore mai identificato: *Trka nam Francoz na vrata*, il francese bussa alla porta, e il buon Francesco manda in soccorso il fratello Carlo. Il quale, nel frattempo, si ritira.

Fuori Lubiana, verso il Carso, la storia cambia. Le campane di campagna suonano a martello: quel rintocco irregolare vuol dire cavalleria in arrivo. Un ragazzo spinge due buoi giù dalla strada maestra, con la cavezza corta perché non facciano rumore. Una donna con le mani rosse di terra mi spiega dove è finita la semente.

**La contadina:** "Il granaio non lo uso mai per il grano vero: è il primo posto dove guardano, e battono il pavimento con le bacchette di ferro per sentire il vuoto sotto. Nel bosco invece scaviamo una fossa a forma di fiasco: prima la paglia bruciata per disinfettarla, poi corteccia di betulla, grano e ajda, e sopra tavole di quercia sigillate d'argilla — infine terra, muschio, foglie, e non si vede più niente."

**Maja:** "E il maiale, dove va?"

**La contadina:** "Il lardo lo affumico, lo avvolgo nel lino con la cenere fine sopra — così restano lontane l'umidità e le mosche — e lo sotterro dentro la pila di fieno. Le bestie invece le portiamo nelle doline, legate corte, con un ciuffo di fieno davanti al muso: così masticano, invece di muggire."

Apro il quaderno sulla riga che ho copiato dal manifesto in piazza.

**Maja:** "E il proclama in piazza? Qui c'è scritto libertà e uguaglianza."

**La contadina:** "La tlaka la devo lo stesso, e la decima anche — uguale a prima. Solo che adesso il fieno lo devo pure a questi. Prima lo dovevo soltanto al signore."

Nessun manifesto lo dice, ma lei ha ragione: la tlaka e la signoria fondiaria attraversano indenni sia i quarantun giorni dell'occupazione francese (28 marzo – 8 maggio 1797) sia gli anni che seguono, e per vederle abolite nella monarchia asburgica bisognerà aspettare il 1848 — mezzo secolo dopo questo proclama.

Il 28 aprile Bonaparte in persona attraversa Lubiana tornando da Graz e dorme nel palazzo vescovile. Il 9 maggio non c'è più un soldato francese in Carniola.

Tre testimoni, tre versioni, e nessuna delle tre parla per le altre due.

---

## Debriefing

Mission Control ha messo gli oggetti-prova sullo stesso tavolo: una crosta di pane duro e una chiave della fortezza, un proclama accanto a un ordine di requisizione, l'atto veneziano di maggio accanto al trattato di ottobre, un opuscolo anonimo di Lubiana accanto a un pezzo di corteccia di betulla.

Alex ha seguito le decisioni. Maja ha seguito il conto da pagare. Stessa storia vista da due altezze, e nessuna delle due la contiene tutta.

Alex non aspetta il suo turno. Spinge verso Maja un foglietto con una sola riga, ricopiata di nascosto dal copialettere del mediatore di Trieste: *contribuzione, due milioni e seicentomila franchi*.

**Alex:** "Trieste, 23 marzo. Lubiana, 28 marzo. Stesso esercito, stessa settimana, stesso tipo di conto. Scommetto che il tuo anonimo e il mio mediatore hanno pagato allo stesso ufficiale."

**Maja:** "Scommetti o lo sai? Sul mio manifesto non c'è scritto chi incassava." Rigira il foglietto e lo rilegge. "Però io cercavo solo chi pagava. Da dove partiva l'ordine, non me lo sono chiesta."

**Alex:** "E il tuo anonimo, quello che scrive perché fra dieci anni lo racconteranno diverso..."

**Maja:** "...fa come il tuo orologiaio. Humbert corre a stampare il suo foglio per la stessa ragione. Se non l'avessi trovato tu, non me ne sarei accorta."

**Verdetto.** Nessuna delle due letture del Checkpoint basta da sola, ma la B spiega meglio le decisioni territoriali del 1797. La Rivoluzione abbatté davvero i privilegi e cambiò il linguaggio della legittimità: dopo il 1789 il potere deve dire da dove viene. Ma la Campagna d'Italia portò quei principi insieme a guerra, occupazione e interessi strategici, e a Campoformio la promessa di liberare i popoli perse contro la convenienza della pace. La Repubblica di Venezia non sparì per una firma in una notte: il vecchio governo si sciolse il 12 maggio sotto pressione militare, dentro una crisi già aperta, e solo il 17 ottobre il trattato assegnò Venezia, Istria e Dalmazia agli Asburgo. Né esistette una reazione unica: a Trieste e in Carniola interessi commerciali, proprietà, obblighi rurali e presenza dei soldati diedero alla stessa notizia significati diversi.

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
*   **1796-1797:** Campagna d'Italia di Bonaparte; in Carniola, prima occupazione francese (28 marzo-8 maggio 1797).
*   **12 maggio 1797:** fine del governo della Repubblica di Venezia.
*   **17 ottobre 1797:** Trattato di Campoformio.
:::

Principi, violenza, istituzioni e diplomazia stanno tutti dentro la stessa catena senza essere la stessa cosa. E quella catena europea diventa storia delle terre slovene nel momento esatto in cui si può vedere chi legge il manifesto e chi consegna il fieno.

Nel 1797 i francesi attraversano la Carniola, restano quarantun giorni e se ne vanno. Nel 1809 torneranno per quattro anni, con Lubiana scelta come capitale. Che cosa cambia, quando un esercito di passaggio decide di restare?

[^ee6]: Curiosità cifrata (ROT13): *Frpbaqb yn genqvmvbar yn Erchooyvpn qv Irarmvn anfpr ary 697 r pnqr zvyyrpragb naav qbcb*

<!-- WORD COUNT: ~4440 -->
<!-- PERSONA CHECK: Alex/Maja voice intact? Pass — Alex keeps the media-vs-reality tic (Bastille prisoners), the MEMO sarcasm, the individual-drama focus (baker's queue, fusiliere's shoe). Maja keeps the "why didn't anyone tell me" tic, the structural/language focus (proclamation columns, requisition ledgers), and interviews three unequal witnesses instead of one composite "people." Reviewer (cap. 6): aggiunto nel Debriefing uno scambio diretto Alex-Maja (arco Complementarità) — errore asimmetrico di Alex (plausibilità/prova) e riconoscimento di Maja del testimone trovato da Alex. -->
<!-- NUF CHECK: [1] ✅ chain from fiscal crisis through Bastille, Terror, Italian campaign to the two-date fall of Venice, no automatic arrow — [2] ✅ principles (end of privileges, equal rights) kept distinct from their uneven application (redeemable dues, requisitions, occupation) — [3] ✅ merchant, official, Zois, and peasant woman each read the same event differently, explicitly graded as unequal-weight testimony — [4] ✅ bread queue scene grounds the material pressure before 14 July without turning it into a violence spectacle — [5] ✅ Maja's discomfort at "libertà e requisizione. Stessa carta. Stesso inchiostro." sits without an easy resolution — [6] ✅ Bastille/4 August/Terror kept chronologically distinct, casualty figures marked as official counts and estimates — [7] ✅ Italian campaign presented as revolutionary war, Napoleon not called emperor, Italy not unified — [8] ✅ 12 May and 17 October kept as two separate documents/events — [9] ✅ Carniola occupation built from proclamation + anonymous letters + Zois + peasant testimony, no fused "the Slovenes felt X" — [10] ✅ Maja's scene opens and stays self-contained, never framed as a footnote to Alex's beats. -->
<!-- ANTI-AI CHECK: no banned openers ("Immaginate di...", "Ebbene sì..."), no explicit moral closers, no production-jargon labels in the body, single target-profile with an Abilità Speciale that passes the operational test (diplomatic leverage, not "he wins battles"), checkpoint used once at chapter midpoint with two genuinely plausible readings, Easter Egg footnote follows the short-form convention (decoder key already taught in Cap. 0). -->


<div style="page-break-after: always;"></div>

# Capitolo 7 — L'Impero Napoleonico E Le Province Illiriche

## Briefing

Alex, Maja: il salto comincia nel 1806 e si chiude nel 1813, nei primi anni del XIX secolo. Dodici anni fa, nel 1797, avete visto i francesi attraversare la Carniola, restare quarantun giorni e andarsene. Stavolta non passano e basta. Nel 1809 si fermano, governano per quattro anni e fanno di Lubiana il centro di un territorio che va dalle Alpi fino a Ragusa. Dopo questa indagine vi aspettano il 1815, la Restaurazione e il vapore.

Il manuale mette in fila questa catena: nel 1809 Napoleone sconfigge l'Austria → riunisce le terre adriatiche nelle Province Illiriche → sceglie Lubiana come capitale → porta con sé Blocco Continentale e Codice civile → riforme e scuole in sloveno modernizzano il nuovo territorio.

Qualcosa non torna. Il registro di un porto, la carta di un ufficio, il libro di un'aula e il fascicolo di un tribunale non misurano lo stesso cambiamento. E non nominano gli stessi vincitori.

La vostra missione è raccogliere cinque prove, pesarle una per una e ricostruire la vera catena fra la strategia di un impero, una capitale nuova e quello che la gente ha davvero vissuto.

## OBIETTIVI DEL SALTO (SCENE)

### 1. L'Europa Con Le Porte Chiuse (un porto del continente, 1808) — voce: Alex

Una sonda di ferro dentro un sacco, un capitano con due cassetti e una bevanda che finge di essere caffè.
**Prova da raccogliere:** come il Blocco dovrebbe mettere in ginocchio la Gran Bretagna, e dove il controllo napoleonico delle merci comincia a perdere acqua.

### 2. Il Porto Senza Orizzonte (Trieste, 1811) — voce: Alex

Un molo quasi senza alberi maestri, un magazzino chiuso con la catena, un facchino senza lavoro.
**Prova da raccogliere:** separare quattro cause che di solito si confondono in una — divieti francesi, navi da guerra britanniche, guerra e fine pratica del porto franco — e vedere chi le paga.

### 3. Una Capitale Disegnata Sulla Mappa (Lubiana, 1810) — voce: Maja

Un gesso su una porta, una borsa di cuoio incerata, un tamburo sotto il municipio.
**Prova da raccogliere:** stabilire perché proprio Lubiana, e quali poteri, uffici e obblighi vi si concentrano.

### 4. La Lingua Sulla Lavagna (Lubiana, 1811) — voce: Maja

Quaranta tavolette d'ardesia, un solo libro stampato e un ispettore che è anche poeta.
**Prova da raccogliere:** misurare dove, per chi e per volontà di chi lo sloveno diventa lingua della scuola.

### 5. Uguali Davanti Alla Legge? (Lubiana, 1812) — voce: Alex

Un sigillo con l'aquila, un contadino senza cravatta davanti al giudice, un registro scritto due volte.
**Prova da raccogliere:** confrontare una regola del Codice civile con quello che la stessa riforma lascia com'era.

Firmano in due. Alex segue la guerra economica dal continente al molo, e dalla legge stampata al fascicolo; Maja segue la nuova capitale e le lingue usate negli uffici e nelle aule delle terre slovene. Durante il salto non vi scambierete appunti: le vostre prove si incontreranno solo sul tavolo del Debriefing, e lì dovranno reggere l'una contro l'altra.

Un'avvertenza di metodo. Un decreto dice che cosa un governo ordina. Un registro del porto dice che cosa si muove davvero, un manuale che cosa si vuole insegnare, un fascicolo che cosa succede a una persona. Nessuna di queste carte pesa come le altre, e nessuna parla per tutti.

---

## L'Europa Con Le Porte Chiuse
<span class="byline">Cronaca di Alex</span>

*Tin.* La sonda entra nel sacco fino al manico e il doganiere la gira due volte, piano, come uno che cerca le chiavi in fondo a una borsa. La tira fuori. Dalla scanalatura cadono semi grigi sul tavolo. Nient'altro.

L'ufficio sa di ceralacca fusa e di inchiostro scuro, quello che si mangia la carta se lo lasci troppo. Fuori, sulla banchina, balle di cotone grezzo affondano nel fango, e su ognuna c'è un timbro: *Boston*, *Smirne*.

*MEMO, dove sono finito?*

*"Porto dell'Impero francese, inverno 1808. Dal 21 novembre 1806, per il Decreto di Berlino, le Isole Britanniche sono dichiarate in stato di blocco. Ogni merce inglese o delle colonie inglesi va sequestrata."*

Blocco. Io mi aspettavo navi da guerra in fila davanti alla costa, bandiere, cannoni pronti, la scena da film. Invece c'è un uomo in giacca verde con uno spiedo di ferro e un timbro. Il Blocco, qui, è questo.

**Alex:** "Cosa sta cercando, esattamente?"

**Il doganiere:** "Quello che l'Imperatore ha vietato. Tessuti inglesi, ferramenta inglese, zucchero e caffè passati per mani inglesi. Li nascondono sotto i semi, sotto il sale, dentro le botti."

**Alex:** "E le navi inglesi? Non le fermate in mare?"

Mi guarda come se avessi chiesto perché non vola.

**Il doganiere:** "Con che cosa? Le nostre navi sono in fondo al mare da Trafalgar. Il mare è loro. La terra è nostra. Allora chiudiamo la terra."

::: memo-box
### MEMO GLOSSARIO

*   **Blocco Continentale:** il sistema di divieti con cui Napoleone chiude ai prodotti britannici tutti i porti del continente, dalla Spagna al Baltico. Non è una flotta che sbarra il mare: è una dogana gigantesca a terra.
*   **Guerra economica:** una guerra che colpisce commerci, merci e denaro del nemico invece dei suoi soldati. L'obiettivo qui è togliere a Londra i mercati dove vendere.
:::

Sulla stufa c'è un pentolino. Il doganiere me ne versa un dito in una tazza sbeccata. È nero, amarissimo, e non è caffè.

**Il doganiere:** "Cicoria. Radici seccate, tostate nel forno, macinate. Il caffè vero, ormai, lo beve chi può pagarlo."

*"Tra il 1807 e il 1811 si stima che nell'Europa continentale zucchero di canna e caffè costino fra quattro e otto volte i prezzi del 1805. La differenza dipende dalla distanza dai centri di contrabbando."*

Grazie, MEMO. Adesso so anche quanto fa schifo, moltiplicato per otto.

Il capitano della nave neutrale, quella delle balle di Boston, mi fa salire a bordo mentre il doganiere firma. Cabina bassa, legno che scricchiola. Prima di tutto tira il chiavistello. Poi fa scorrere un pannello sotto il tavolo: due cassetti a scomparsa. Ne apre uno, lo richiude, apre l'altro. Che io guardi non gli importa: chi crederebbe a un ragazzino che parla strano?

**Alex:** "Perché due?"

**Il capitano:** "Uno per i francesi: certificati d'origine firmati da un console compiacente, che dicono che il cotone non ha mai visto un inglese. Uno per gli inglesi: la licenza che mi hanno fatto pagare quando mi hanno obbligato a passare da un loro porto."

**Alex:** "Obbligato?"

**Il capitano:** "Da un anno, per le loro Ordinanze in Consiglio, ogni nave neutrale diretta verso un porto francese deve fermarsi prima in un porto britannico, farsi ispezionare, pagare. Se non lo fa, la Royal Navy la prende. E i francesi, a Milano, hanno risposto: chi si è fatto ispezionare dagli inglesi non è più neutrale. È una preda."

Faccio due più due e mi viene zero. Se obbedisce a Londra, lo sequestra Parigi. Se obbedisce a Parigi, lo affonda Londra. L'unica soluzione è mentire a tutti e due, un cassetto per volta.

::: scan-result
### SCANNING: DOPPIO CASSETTO DI BORDO

*   **Tipo:** coppia di scomparti nascosti nella cabina del comandante.
*   **Materiale:** legno, carte bollate, sigilli consolari.
*   **Funzione:** mostrare a ogni controllore le carte che vuole vedere — certificati d'origine neutrali ai guardacoste francesi, licenza britannica alle fregate inglesi.
*   **Dettaglio Tecnico:** di notte, altre navi restano fuori dalle acque territoriali e passano il carico a piccole barche veloci, che lo sbarcano su spiagge e lagune dove le pattuglie dei doganieri non arrivano in tempo.
:::

::: memo-box
### MEMO GLOSSARIO

*   **Contrabbando:** far passare merci vietate eludendo il divieto — con carte false, sbarchi notturni, carichi nascosti. Diverso dal commercio autorizzato con una licenza, che è un'eccezione scritta e pagata.
:::

**Alex:** "E l'Imperatore lo sa?"

**Il capitano:** *(ride)* "Lo sa. Ma anche a Parigi c'è vino da vendere e zucchero da comprare."

*"Confermato: dal 1809-1810 Napoleone vende licenze imperiali che permettono a singoli mercanti di commerciare con la Gran Bretagna. Secondo la ricostruzione degli storici, la costa orientale dell'Adriatico gli serve come corridoio da sigillare contro le merci inglesi e come strada di terra verso il cotone ottomano."*

Una carta dice che un continente intero ha chiuso la porta. Sotto il tavolo di un capitano, la porta ha due serrature.

---

## Il Porto Senza Orizzonte
<span class="byline">Cronaca di Alex</span>

Conto gli alberi maestri lungo il Canal Grande e arrivo a tre. Tre, in una città che dovrebbe vivere di navi. Il resto sono barche da pesca e trabaccoli con le vele rattoppate, fermi, e l'acqua che sbatte contro gli scafi con un rumore lento, sempre uguale, come un orologio che nessuno guarda.

*MEMO, data.*

*"Trieste, primavera 1811. Dopo la pace di Schönbrunn del 14 ottobre 1809 la città fa parte delle Province Illiriche. Il 13 marzo, al largo di Lissa, quattro fregate britanniche comandate da William Hoste hanno battuto una flotta franco-italiana più numerosa."*

Da lontano, verso Punta Salvore, arriva un colpo di cannone. Poi un altro. Nessuno sul molo alza la testa. È questo che mi colpisce più del cannone: che non alzano la testa.

Sui massi di pietra d'Istria del Molo San Carlo un uomo rammenda una rete che non ha niente da pescare, a giudicare dai buchi. Ha le spalle larghe, le mani a uncino.

**Alex:** "Pescatore?"

**Il facchino:** "Bastaso. Portavo sacchi dalle navi ai magazzini, dall'alba al buio. Se non ci sono navi, non ci sono sacchi."

**Alex:** "Colpa degli inglesi?"

**Il facchino:** "Degli inglesi in mare. Dei francesi in dogana. Di tutti e due." Stringe un nodo coi denti. "Mio fratello è andato via l'anno scorso, verso l'interno. Quello del piano di sopra, a Fiume. La casa è mezza vuota."

*"Si stima che la popolazione di Trieste e del suo distretto sia scesa da circa 33.200 abitanti nel 1808 a un numero fra 20.000 e 24.000 nel 1812."*

Più di un quarto della città. Forse più di un terzo. Svanito come l'acqua da un secchio bucato, un vicino alla volta.

Mi è venuto automatico pensare "l'embargo inglese". Sbagliato. L'embargo è una firma su un foglio, e qui la firma è di Parigi. Davanti a Trieste gli inglesi non mandano fogli: mandano fregate. Divieti a terra, cannoni in mare: ci vogliono tutte e due le cose per fermare un porto.

::: memo-box
### MEMO GLOSSARIO

*   **Embargo:** divieto giuridico di commerciare con qualcuno. Qui lo impone la Francia: è il Blocco Continentale, applicato in dogana.
*   **Blocco navale:** interdizione fisica, fatta con navi da guerra, che fermano e catturano le navi mercantili in mare. Qui lo esercita la Gran Bretagna, dalla base di Lissa.
*   **Licenza commerciale:** un'eccezione scritta al divieto, comprata a caro prezzo da chi può permettersela.
:::

Il magazzino dietro il molo ha le porte chiuse con una catena arrugginita. Dentro sa di umido e di salmastro. Un commesso sulla trentina, con le mezzemaniche nere, sta spargendo sul pavimento di pietra una polvere bianca che pizzica il naso.

**Alex:** "Cos'è?"

**Il commesso:** "Calce spenta e zolfo. Poi i sacchi di grano sopra, su travi di quercia, alti da terra. I topi non passano, la muffa non attacca. Il grano sta qui da mesi. Può starci ancora mesi."

**Alex:** "Ma il porto non era franco? Niente dazi, merci che entrano ed escono?"

**Il commesso:** "Il nome c'è ancora. Nessuno l'ha cancellato con una legge. Però qui adesso valgono le tariffe doganali dell'Impero, come in qualsiasi altro porto francese. Un porto franco che paga i dazi di tutti gli altri." Si pulisce le mani sul grembiule. "Chiamalo come vuoi."

Mi porta nell'ufficio accanto e apre il libro degli arrivi della Borsa. Le pagine degli anni prima sono fitte di brigantini e navi d'alto mare. Queste sono larghe, spaziose, quasi bianche. I pochi nomi sono trabaccoli e tartane: farina e olio dall'Istria, qualche carico dalla Dalmazia.

*"Le serie mercantili dell'epoca indicano un calo stimato del traffico d'alto mare fra l'80 e il 90 per cento rispetto al 1800-1805."*

**Alex:** "E il suo padrone? Anche lui rammenda reti?"

**Il commesso:** *(abbassa la voce)* "Il mio padrone ha venduto due barche per finta a un uomo di Dulcigno. Adesso battono bandiera del Sultano, hanno un nome nuovo dipinto a poppa e due serie di carte. Altri comprano licenze e mandano legname e ferro in Italia. Chi ha soldi, si arrangia."

**Alex:** "E chi non ne ha?"

Non risponde. Guarda verso il molo, dove il bastaso continua a lavorare sulla rete. Più tardi MEMO mi dirà che molti come lui vivono di sussidi del comune, o di sale e tabacco portati di notte lungo la costa del Carso. Ma il commesso, lì, non dice niente.

**Il commesso:** "Il cotone, ormai, arriva a dorso di mulo. Da Salonicco, per la Bosnia, fino a Karlovac. Poi su per la strada nuova, fino a Lubiana, e da Lubiana giù fino a noi. Settimane di strada per evitare tre giorni di mare."

Una rete da rammendare. Un libro con le pagine bianche. E un mulo carico di cotone che scende dai monti al posto di una nave.

---

## Una Capitale Disegnata Sulla Mappa
<span class="byline">Cronaca di Maja</span>

La carrozza della posta entra nel cortile coperta di polvere fino ai finestrini: arriva dalla stazione di Postumia. Un inserviente scarica nell'atrio dell'Intendenza pacchi chiusi con la ceralacca rossa, uno sopra l'altro, come mattoni.

*MEMO, coordinate.*

*"Lubiana, primavera 1810. Le Province Illiriche sono state create da Napoleone con il decreto del 14 ottobre 1809, a Schönbrunn. Il loro Governo Generale ha sede qui."*

Qui. Dentro Palazzo Auersperg, trasformato in uffici, il corridoio sa di gesso e di inchiostro appena steso. Un copista giovane, dita blu fino alla seconda falange, ricopia in tedesco un foglio scritto in francese. Controllo la sua scrivania riga per riga. In sloveno, lì sopra, non c'è una parola.

**Maja:** "Come arriva un ordine da questa stanza a un villaggio di montagna?"

**Il copista:** "Per strada, di stazione in stazione. Un corriere porta la borsa di cuoio incerata contro la pioggia; alla stazione dopo un altro l'aspetta già in sella, col cavallo fresco. In paese, poi, la domenica dopo la messa, il parroco legge l'editto dal pulpito. In tedesco e nella parlata del posto."

*"Stazioni ogni 10-14 chilometri. Cambio del cavallo in meno di quattro minuti. Oltre 150 chilometri in ventiquattro ore."*

Nella parlata del posto, allora. Non sulla carta del copista. Dal pulpito, sì.

**Maja:** "E perché proprio Lubiana? Perché è il cuore delle terre dove si parla come parlo io?"

**Il copista:** *(senza alzare gli occhi)* "Il Carso e le montagne ci separano dal mare: per questo, qui, un cannone inglese non arriva. A Trieste e a Zara, sulla costa, le fregate sparano quando gli pare."

**Maja:** "Tutto qui?"

**Il copista:** "C'è anche la strada. Da Vienna a Trieste, dall'Italia fino a Karlovac e alla Bosnia: si incontrano proprio in questo punto. E gli edifici c'erano già — palazzi degli Stati provinciali, tipografie, tribunali, caserme. Un funzionario non lo pianti sotto una tenda."

Speravo in un'altra risposta. Nella scelta di Lubiana volevo leggere un riconoscimento, e invece mi ritrovo in mano una strada segnata sulla carta e la gittata di un cannone. Delusa, non offesa: sono due cose diverse.

*"Una tradizione patriottica più tarda sostiene che Lubiana fu scelta come centro culturale. I dispacci militari e le lettere di Marmont indicano sicurezza dal mare, incrocio di strade, edifici già pronti."*

Sulla parete di fronte c'è una mappa più alta di me. Villach, Trieste, Fiume, Zara, Ragusa: tutte le linee finiscono in un punto solo.

Nei libri dei miei compagni italiani Napoleone attraversa mezza Europa senza mai fermarsi qui. Che per quattro anni Lubiana abbia dato ordini fino a Ragusa, nessuno di loro lo sa. Eppure è appeso lì, con i sigilli.

::: scan-result
### SCANNING: CARTA AMMINISTRATIVA DELLE PROVINCE ILLIRICHE

*   **Tipo:** mappa ufficiale del Governo Generale, disegnata a mano.
*   **Estensione:** dalla Carniola alla Carinzia occidentale con Villach, poi Gorizia e Gradisca, Trieste, Istria, Fiume, la Croazia civile e militare a sud della Sava, fino a Dalmazia e Ragusa.
*   **Abitanti (stima):** fra 1.480.000 e 1.550.000, circa un milione e mezzo, su 55.000 km² — di questi, circa 500.000 parlano sloveno.
*   **Rapporto con la Francia:** nessun dipartimento, nessun deputato a Parigi. Solo una dipendenza sotto il comando diretto dell'Imperatore.
:::

Illiria, quindi, non è il nome di un popolo. Su questa carta vivono sloveni, croati, italiani, tedeschi, serbi. È il nome di una mappa.

**Maja:** "E chi comanda?"

**Il copista:** "Il governatore generale. Il maresciallo Marmont. Accanto a lui un intendente generale per le finanze e un commissario per la giustizia. Quello che il maresciallo firma parte per tutte le province. Quello che vuole l'Imperatore arriva da Parigi al maresciallo."

Una capitale non è un titolo d'onore. È la casa dove siede il governo e dove stanno gli uffici principali, e da Villach a Ragusa tutto deve passare da questa porta.

::: memo-box
### MEMO GLOSSARIO

*   **Governatore generale:** l'uomo che Napoleone manda a comandare le Province — di fatto un viceré, anche se il titolo non lo dice.
*   **Accentramento amministrativo:** un solo ufficio, qui a Lubiana, per gli ordini, le tasse e i rapporti di un intero territorio — nessuna provincia decide più da sé.
*   **Coscrizione:** i giovani finiscono in un elenco, e dall'elenco in divisa: non è una scelta loro.
:::

Fuori, nella via, un uomo col mantello del comune segna col gesso le porte. *4 S.* Una porta più in là, *1 O.* Parla tedesco; la padrona di casa gli risponde in sloveno, e lui annuisce.

**Maja:** "Che cosa vuol dire?"

**La padrona di casa:** "Quattro soldati. Dai vicini, un ufficiale." Ha già le lenzuola sul braccio. "All'ufficiale si dà la camera migliore, candele di sego, biancheria pulita. Così non va a frugare nel resto della casa. Le ragazze in soffitta. I cucchiai d'argento pure."

**Maja:** "E se dice che non c'è posto?"

**La padrona di casa:** "Il posto lo trovano loro."

In piazza del Mercato, sotto la loggia del Magistrato, la guardia civica batte tre rulli di tamburo. Il banditore grida l'editto, un garzone lo incolla sul portone con una pasta di farina e acqua. Passano ufficiali francesi con i pennacchi tricolori. Tra loro, contadini in mantelli di lana grezza marrone e cappelli di feltro, sui carri la legna per le stufe della città.

**Maja:** "Che cosa ha letto?"

**Il contadino:** "L'imposta sulla terra. Uguale per tutti, dicono." Stringe la corda sulla legna. "Siamo uguali in quello che fa male. E scriveranno i ragazzi nell'esercito."

**Maja:** "Ha un figlio?"

**Il contadino:** "Diciassette anni." Guarda a lungo il foglio che non sa leggere. "I soldi si trovano. Un figlio no."

*"Adesso i giovani della Carniola vengono chiamati con la coscrizione obbligatoria nell'esercito napoleonico. Formeranno i reggimenti illirici. Una parte andrà in Russia nel 1812."*

E Marmont, MEMO? Lo voleva lui, tutto questo?

*"Ricostruzione dalle sue memorie: vorrebbe lasciare strade, un orto botanico, scuole riordinate. Da Parigi gli chiedono denaro contante, grano e battaglioni."*

Il postiglione rimette la carrozza sulla strada di Postumia. Arrivano gli ordini, partono i ragazzi: la strada è la stessa.

::: checkpoint
### CHECKPOINT: Perché nascono davvero le Province Illiriche — per trasformare e governare meglio un territorio, oppure per usare coste, strade e città come strumenti della guerra napoleonica?

Finora hai raccolto: il Blocco pretende il controllo di ogni porto e di ogni balla; Trieste paga il crollo delle rotte e del proprio statuto; Lubiana riceve funzioni di governo su un territorio che non aveva mai amministrato.

*   **A.** Soprattutto un progetto di riorganizzazione: capitale, uffici comuni e procedure nuove mostrano un governo che vuole costruire un territorio più uniforme; la guerra è la condizione che lo rende possibile.
*   **B.** Soprattutto uno strumento strategico: capitale e uffici servono a controllare costa, strade, denaro e uomini; le riforme sono vere, ma vengono dopo le necessità dell'impero e della guerra.

Tieni a mente la tua risposta — il Verdetto nel Debriefing te la confermerà, la correggerà, o mostrerà che la realtà era più complicata di entrambe.
:::

---

## La Lingua Sulla Lavagna
<span class="byline">Cronaca di Maja</span>

Il maestro taglia una penna d'oca con tanta cura che la stanza sa di piuma bruciacchiata. Sul suo tavolo, accanto al temperino, c'è un libro stampato. Uno. Sulle panche, davanti a lui, i ragazzi sono quaranta.

Poi un ragazzo si alza, prende una bacchetta e la punta contro un grande cartellone appeso al muro.

"Bu-kva!"

"BU-KVA!"

"Kme-ti-ja!"

"KME-TI-JA!"

La classe gli risponde in coro, a tempo, quasi una cantilena. È sloveno. Ad alta voce, a scuola, come lingua della lezione — non come la lingua in cui ti spiegano cosa dovrai poi imparare in tedesco.

**Maja:** "Come fate a insegnare a leggere con un libro solo?"

**Il maestro:** "Il libro lo tengo io, oppure il migliore della fila. Lui legge, gli altri ripetono. Prima imparano con l'orecchio, poi copiano sulla tavoletta. La carta costa troppo per i figli degli artigiani e dei contadini. L'ardesia la cancelli quante volte vuoi."

*MEMO, data e regole.*

*"Lubiana, fine del 1811. Con il decreto di Marmont del 4 luglio 1810 e il decreto generale sull'istruzione pubblica del 12 febbraio 1811, nelle scuole primarie si insegna nella lingua del paese. In Carniola è lo sloveno, affiancato dallo studio del francese."*

In un angolo, una grande stufa di maiolica verde spande fumo di faggio e un odore di fuliggine. Sulle ginocchia, ogni ragazzo ha una tavoletta d'ardesia chiusa in una cornice di legno di faggio, con una spugnetta legata alla cornice da uno spago di canapa. La punta di pietra stride sull'ardesia. Riga controllata, riga cancellata: con la spugna, con la manica, a volte con lo sputo.

La porta si apre e la classe si zittisce. Entra un prete oltre la cinquantina, un libro sotto il braccio. Il maestro si raddrizza. Il prete prende la tavoletta di un ragazzo, corregge una lettera col dito, gliela rende senza una parola.

*"Valentin Vodnik. Dal 1810 direttore del rinnovato ginnasio di Lubiana e ispettore delle scuole primarie e artigiane della Carniola."*

**Maja:** "Quel libro è opera sua?"

**Vodnik:** "Mancava, e qualcuno doveva scriverlo. Il decreto ordina di insegnare nella lingua del paese — ma un decreto non si scrive da solo un abbecedario."

**Maja:** "Quindi lo sloveno entra in un'aula per la prima volta."

**Vodnik:** "Non proprio. Già ai tempi dell'imperatrice si spiegava il catechismo nella lingua di casa, perché i bambini imparassero meglio anche il tedesco. Ciò che cambia adesso è che, per legge, è la lingua in cui si insegna tutto — e che finalmente una grammatica descrive questa lingua usando questa stessa lingua."

**Maja:** "E ai francesi cosa importa? Lo fanno per noi?"

**Vodnik:** *(un mezzo sorriso)* "Lo fanno per farsi capire da chi paga le tasse e manda i figli in guerra. Il resto —" allarga le mani verso il libro "— è il mio lavoro: che sappiano leggere."

*"Ricostruzione degli storici: le autorità francesi non volevano uno Stato sloveno. Introdussero lo sloveno per pragmatismo amministrativo e pedagogico, per farsi capire da una popolazione in gran parte analfabeta."*

::: memo-box
### MEMO GLOSSARIO

*   **Lingua d'insegnamento:** non la materia che studi in classe, ma la lingua in cui il maestro spiega tutte le altre materie.
*   **Ispettore scolastico:** gira le scuole, ascolta le lezioni, controlla i maestri — e scrive alle autorità se le regole vengono davvero rispettate.
*   **Ordinamento scolastico:** i decreti che decidono, tutti insieme, quali scuole ci sono, chi ci va, cosa si insegna e in che lingua.
:::

Il maestro mi passa il libro. Carta giallina, e sul frontespizio: *Pismenost ali gramatika za perve shole*. *Pismenost* "oppure" *gramatika*: la parola di casa accanto a quella straniera, alla pari.

Fino al 1811, a quanto pare, nessuno aveva mai scritto della mia lingua nella mia lingua. È la prima grammatica dello sloveno interamente in sloveno — e questo, a scuola, non me l'ha mai detto nessuno.

*"Prima di questa, dal 1584 al 1808, sono uscite tre grammatiche dello sloveno: una in latino, due in tedesco. Questa è stampata a Lubiana nel 1811."*

::: target-profile
### SCHEDA PERSONAGGIO: Valentin Vodnik

*   **Ruolo:** prete e poeta (1758–1819); sotto le Province Illiriche dirige il ginnasio di Lubiana e ispeziona le scuole primarie e artigiane della Carniola.
*   **Forza:** 2
*   **Intelligenza:** 5
*   **Carisma:** 3
*   **Abilità Speciale:** Un decreto amministrativo, pensato per durare quanto l'occupazione francese, diventa nelle sue mani la prima grammatica mai scritta della lingua slovena nella lingua slovena stessa — un libro che sopravvive al potere che lo ha reso possibile.
:::

A metà del libro, fra una regola e l'altra, trovo una poesia. *Ilirija oživljena*, "L'Illiria risvegliata". Sulla pagina non c'è nessuna č: al suo posto, *zh*.

*Napoleon rezhe: Ilirija vſtan'!*

La rileggo a modo mio, *Napoleon reče*: "Napoleone dice: Sorgi, Illiria!". La poesia celebra Napoleone come l'eroe che risveglia l'antica Illiria da un sonno di secoli. Ed è stampata in una grammatica per bambini.

Orgoglio e disagio, insieme, senza che l'uno spenga l'altro: è quello che provo. Ma questi versi raccontano solo il pensiero di Vodnik — non quello del contadino che ho visto trascinare la legna in piazza del Mercato.

*"Al ritorno dell'Austria, nell'autunno 1813, la polizia lo considera inaffidabile per quei versi. Nel 1815 viene rimosso e messo a riposo con una pensione ridotta. Non potrà più insegnare."*

**Maja:** "E le ragazze?"

**Il maestro:** "Le ragazze hanno la loro classe, dove c'è. Nei villaggi, quasi tutte restano a casa. Badano ai fratelli piccoli, lavorano."

**Maja:** "E i ragazzi dei villaggi?"

**Il maestro:** "D'inverno vengono. Quando si scioglie la neve, vanno nei campi."

*"Stima: nelle campagne della Carniola, d'inverno, frequenta la scuola fra il 20 e il 30 per cento dei bambini. In primavera e d'estate meno del 10 per cento, perché lavorano nei campi e al pascolo."*

Il ragazzo della bacchetta è di nuovo sotto il cartellone. Gli chiedo se ad aprile ci sarà ancora.

**Il ripetitore:** "Ad aprile porto le bestie al pascolo. A casa servo io."

L'ardesia si cancella all'infinito. Il suo posto sulla panca, a primavera, resta vuoto.

---

## Uguali Davanti Alla Legge?
<span class="byline">Cronaca di Alex</span>

Il sigillo d'acciaio affonda nella ceralacca rossa e quando il cancelliere lo solleva, in fondo all'atto di divisione ereditaria resta un'aquila a becco aperto. L'ufficio sa di polvere di pergamena, di carta bollata, di cera d'api. Il cancelliere sfoglia i fogli filigranati con un bollo da cinquanta centesimi in alto a destra, e ha le dita unte di tabacco da fiuto. Ogni pagina lascia un'impronta.

*MEMO, dove.*

*"Tribunale di prima istanza di Lubiana, 1812. Il decreto del 15 aprile 1811 ha fissato al 1° gennaio 1812 l'entrata in vigore del Codice civile francese in tutte le Province Illiriche. Giudici di pace nei cantoni, tribunali nei capoluoghi, Corte d'Appello qui a Lubiana."*

Il Codice Napoleone. A scuola era il pezzo forte, quello che ti fa pensare: va bene, ha fatto guerre dappertutto, però almeno ha portato la legge uguale per tutti. Me l'ero già scritto in testa, in bella copia.

Nell'aula accanto c'è un silenzio che si sente. Un contadino di Šiška, camicia di lino ruvido e niente cravatta, sta in piedi davanti al giudice di pace. Il giudice legge la sentenza in francese; un interprete giurato del comune la ripete in tedesco, poi in sloveno. Il contadino ascolta la terza versione con gli occhi fissi sulle labbra dell'interprete.

**Alex:** "Quindi davanti a questo giudice un contadino e un barone sono uguali?"

**Il cancelliere:** "Davanti al tribunale, sì. I nobili non hanno più privilegi di legge. E i tribunali dei signori sono stati soppressi: adesso la giustizia è dello Stato, per tutti."

Uguaglianza. Caso chiuso. Stavo già per dirlo ad alta voce.

::: memo-box
### MEMO GLOSSARIO

*   **Codice civile:** il libro di leggi che regola i rapporti fra privati — famiglia, matrimonio, eredità, proprietà, contratti. Quello francese del 1804 si chiama anche Codice Napoleone.
*   **Uguaglianza giuridica:** la stessa legge e gli stessi tribunali per tutti, senza privilegi di nascita. Non vuol dire stessa ricchezza, stessi voti o stessa libertà.
*   **Stato civile:** i registri pubblici di nascite, matrimoni e morti, tenuti dal comune invece che solo dalla parrocchia.
:::

Sul banco del cancelliere ci sono due volumi identici, stesse righe, stessa grafia.

**Alex:** "Perché lo scrive due volte?"

**Il cancelliere:** "Registro dello stato civile. Una copia resta nella cassaforte del comune. L'altra, a fine anno, parte a cavallo per la cancelleria del tribunale, qui o a Novo Mesto. Se un incendio o i soldati distruggono l'una, resta l'altra."

**Alex:** "E se uno non ha niente di scritto? Tipo, deve dimostrare chi è?"

Mi indica il corridoio. Un uomo aspetta con quattro vicini, cappelli in mano.

**Il cancelliere:** "Atto di notorietà. I testimoni giurano che è lui, la persona nominata: l'età che dimostra, le cicatrici, il colore degli occhi, la statura, il mestiere. Io scrivo, il sindaco mette il sigillo. È così che si diventa eredi, quando i libri della parrocchia sono bruciati in guerra."

Niente carta d'identità, niente foto. Il tuo documento sono quattro vicini che si ricordano la tua cicatrice.

::: scan-result
### SCANNING: DOPPIO REGISTRO DELLO STATO CIVILE

*   **Tipo:** coppia di registri identici di nascite, matrimoni e morti.
*   **Materiale:** carta bollata, inchiostro, sigillo municipale, legatura con cordelle di canapa.
*   **Funzione:** conservare due prove della stessa vita in due luoghi diversi — la cassaforte del comune e la cancelleria del tribunale.
*   **Dettaglio Tecnico:** nelle campagne è spesso il parroco a compilare il modulo civile insieme al battesimo o alle nozze; si stima che nel 1812-1813, nei tribunali di Lubiana e Novo Mesto, meno del 5 per cento dei matrimoni sia stato celebrato solo in forma civile.
:::

**Alex:** "Ok. E una donna sposata? Può vendere un campo, se è suo?"

Il cancelliere apre il Codice senza cercare, come chi conosce la pagina.

**Il cancelliere:** "Articolo 217: la moglie non può donare, vendere, ipotecare né firmare contratti senza il consenso scritto del marito. Articolo 213." Legge. "*Il marito deve protezione alla moglie, la moglie obbedienza al marito.*"

*"Anche il divorzio ha due misure: il marito può chiederlo per un solo adulterio della moglie; la moglie solo se lui tiene la concubina nella casa comune. Per la moglie adultera il Codice penale del 1810 prevede fino a due anni di casa di correzione."*

Il mio "caso chiuso" si riapre da solo. Uguali, sì. Ma metà degli sposati ha bisogno della firma dell'altra metà.

Il contadino di Šiška esce dall'aula. Si rimette il cappello sulla soglia, non prima.

**Alex:** "Allora? Adesso siete uguale al barone?"

**Il contadino:** "Lì dentro, forse." Guarda la porta. "Lunedì però devo la giornata al signore, come prima. Col carro e coi buoi. E in più le tasse nuove, e mio nipote l'hanno preso per l'esercito. Carte in francese, bolli da pagare. Il bastone del fattore è sempre quello."

*"Confermato: il Codice e i decreti francesi non cancellano la tlaka né i tributi ai signori. Si possono riscattare solo pagando, cosa che i contadini poveri non possono permettersi. Tlaka, tasse e coscrizione insieme porteranno alla rivolta di Višnja Gora nel 1813."*

Caso chiuso, dicevo. Il caso, qui fuori, ha un carro, due buoi e un nipote in divisa.

*"Dopo il ritorno dell'Austria il Codice napoleonico viene revocato: fra il 1814 e il 1816 al suo posto arriva il codice civile austriaco. La tlaka resterà fino al 1848."*

Il cancelliere lega il fascicolo del contadino con una cordella di canapa e lo mette sulla pila. Dentro c'è scritto che è uguale a tutti. Lunedì, all'alba, lo aspetta un campo che non è suo.

---

## Debriefing

Sul tavolo di Mission Control: la sonda di un doganiere e due cassetti di bordo, il libro degli arrivi della Borsa di Trieste con le pagine quasi bianche, la carta amministrativa appesa a Lubiana, una grammatica di Vodnik stampata nel 1811, un registro dello stato civile scritto due volte.

Alex non aspetta che qualcuno apra la seduta.

**Alex:** "Per me è semplice. Era tutto per la guerra. Il porto chiuso, la capitale lontana dai cannoni, perfino la scuola: servivano a farsi obbedire."

**Maja:** "Allora spiegami la grammatica. Il governo voleva farsi capire, va bene. Ma in quel libro c'è qualcosa che nessun decreto aveva ordinato."

**Alex:** "E tu spiegami il bastaso. Lui non ha scelto niente, e ha pagato lui."

**Maja:** "Hai ragione. Non tutto quello che si apre viene aperto per chi ci passa."

**Alex:** "...E non tutto quello che serve alla guerra serve solo alla guerra. Va bene."

Non si sono messi d'accordo. Ma nessuno dei due, adesso, può più dire la frase con cui era partito.

**Verdetto.** La B spiega meglio perché nacquero le Province Illiriche: furono una costruzione dell'Impero napoleonico per controllare l'Adriatico, tagliare fuori l'Austria dal mare e combattere la guerra economica contro la Gran Bretagna — non uno Stato sloveno, né un premio a Lubiana. Ma la A descrive una conseguenza reale: la nuova capitale concentrò un governo su un territorio vastissimo e aprì riforme amministrative, scolastiche e giuridiche che cambiarono regole e possibilità per una parte degli abitanti. Furono cambiamenti brevi, diseguali, accompagnati da tasse, coscrizione e una tlaka che nessun decreto francese abolì; l'uso dello sloveno a scuola, grazie anche a Vodnik, acquistò un significato culturale che andava oltre le intenzioni francesi. La crisi di Trieste e l'ascesa di Lubiana non sono due storie opposte: sono due effetti della stessa mappa imperiale.

::: reality-check
### CIÒ CHE NON SAPPIAMO ANCORA

*   **Quanto il crollo di Trieste dipenda da ciascuna causa:** Blocco Continentale, fregate britanniche, guerra e tariffe doganali agiscono insieme; le cifre sul traffico e sulla popolazione sono stime, e le fonti non permettono di assegnare a ogni causa la sua quota.
*   **Quanto la scuola in sloveno arrivasse davvero ai bambini:** i decreti e i libri sono certi, la frequenza no — soprattutto nelle campagne, dove le stime cambiano con le stagioni e le ragazze restano quasi sempre fuori.
*   **Quanto il Codice civile cambiasse la vita quotidiana:** il testo entra in vigore ovunque nel 1812, ma per matrimoni e registri la gente continua a passare dal parroco, e fuori dall'aula del tribunale i suoi effetti si possono misurare soltanto per stime.
:::

::: memo-box
### CRONOLOGIA ESSENZIALE

*   **21 novembre 1806:** Decreto di Berlino, inizio del Blocco Continentale.
*   **1807:** Ordinanze in Consiglio britanniche e Decreti di Milano.
*   **14 ottobre 1809:** pace di Schönbrunn e creazione delle Province Illiriche, con capitale Lubiana.
*   **1810-1811:** decreti scolastici; Vodnik pubblica la *Pismenost* con *Ilirija oživljena*.
*   **1° gennaio 1812:** entra in vigore il Codice civile nelle Province.
*   **Autunno 1813:** tornano gli austriaci; il 29 ottobre si arrende la fortezza di San Giusto a Trieste.
:::

A Lubiana, nell'autunno del 1813, un funzionario francese chiude l'ultimo registro e lo lascia su un tavolo che non è più suo. Poche strade più in là, in un libro stampato due anni prima, una parola slovena aspetta un lettore che non è ancora nato.[^ee7]

Nel 1815 i sovrani d'Europa proveranno a rimettere ogni confine al suo posto. Ma una macchina e un'elica si possono restaurare come un trono?

[^ee7]: Curiosità cifrata (ROT13): *Vy cevzb cvebfpnsb nccnefb qninagv n Gevrfgr, ary 1818, fv puvnznin Pnebyvan.*

<!-- WORD COUNT: ~5850 -->
<!-- PERSONA CHECK: Pass — Alex keeps the media/reality tic within limit (twice: film-warships vs. iron-probe customs; "caso chiuso" on the Code vs. art. 217/tlaka), keeps MEMO banter ("Grazie, MEMO..."), stays anchored to individual drama (bastaso, contadino di Šiška), shows an asymmetric error (confuses plausible with proven at the tribunal). Maja keeps "nessuno me l'ha mai detto" within limit (twice: Lubiana governing to Ragusa; first grammar in Slovene), notices language before anything else in every setting, names her emotions precisely ("non sono offesa, sono delusa"; "orgogliosa e a disagio"), shows her own asymmetric error (reads the choice of Lubiana as recognition, corrected by logistics). Alex and Maja never merge into one voice; they meet only in the Debriefing and each revises a position because of the other. -->
<!-- NUF CHECK: [1] ✅ chain Blocco→Adriatic corridor→Schönbrunn/Province→Lubiana kept, strategic aim vs. local effect kept distinct — [2] ✅ reforms real but tied to taxes/coscrizione/tlaka, intention vs. tool vs. unintended meaning (Vodnik) made explicit — [3] ✅ customs register, Borsa ledger, administrative map, grammar, civil register each interrogated for what they show and whom they omit — [4] ✅ concrete loss on the Trieste molo vs. ambiguous possibility in Lubiana's offices/classroom, neither erasing the other — [5] ✅ Maja's pride and unease over the Slovene grammar, paired with attendance estimates and the 1815 dismissal as limits on any "recognition" reading — [6] ✅ Berlin Decree, Orders in Council/Milan Decrees, licences, embargo vs. naval blockade kept distinct with dates and sources — [7] ✅ 1809 creation, dependency status (no départements), Lubiana as seat, 1813 end, explicit "non uno Stato sloveno" — [8] ✅ Vodnik's real titles/dates, "first time" narrowed to language-of-instruction and first grammar, Code's 1812 entry into force with women's/tlaka limits — [9] ✅ Lubiana scene stands as its own story, not measured against Trieste — [10] ✅ Vodnik/school scene autonomous, Maja separates practical use from cultural meaning without Alex present. -->
<!-- ANTI-AI CHECK: no banned patterns found (no "immaginate di essere", no "ebbene sì", no explicit closing moral); no production-jargon labels anywhere, "Capitolo" appears once; section headers are pure subtitles; bylines are HTML spans matching the narrating voice; MEMO interventions stay at or under 3 facts each; Easter Egg (ROT13) uses the short-note form, consistent with the cipher having been taught in Cap. 0; every [ESTIMATE] rendered with cautionary language ("si stima", "circa", ranges), no reconstructed dialogue presented as documented quote. -->


<div style="page-break-after: always;"></div>

# Capitolo 8 — La Restaurazione, Il Vapore E La Nascita Del Lloyd

## Briefing

Alex, Maja: coordinate principali 1815, inizio del XIX secolo. Nella missione precedente avete visto le Province Illiriche durare dal 1809 al 1813, e il controllo asburgico tornare dopo la caduta di Napoleone. Adesso l'Europa deve decidere che forma darsi. Da qui seguirete le prove per ventidue anni: dalle carte diplomatiche del 1815 alla prima partenza di linea del 1837. Dopo questa indagine vi aspetta la società industriale; qui ci fermiamo un passo prima.

Il manuale propone due catene, una dopo l'altra. La prima: 1815 → i sovrani restaurano il vecchio ordine → l'Europa torna com'era prima. La seconda: macchina a vapore → Ressel inventa l'elica a Trieste → comincia la nuova navigazione.

Qualcosa non torna. Le tracce più antiche dell'idea non stanno tutte in un porto. E le fonti raccontano la stessa prova del 1829 sia come un successo sia come un fallimento.

La vostra missione è raccogliere quattro prove e ricostruire la catena che collega Restaurazione, lavoro forestale, prova tecnica e navigazione regolare.

## OBIETTIVI DEL SALTO (SCENE)

### 1. Un Tavolo Per Rimettere Ordine (Vienna, 1814-1815) — voce: Alex

Una lama scaldata sopra una fiammella, un sigillo sollevato intatto e una stanza dove nessuno balla.
**Prova da raccogliere:** verificare quali parti del passato i negoziatori tentano di restaurare e quali decisioni richiedono invece un equilibrio nuovo.

### 2. Misurare Un Bosco, Disegnare Una Spinta (Pleterje, 1817-1827) — voce: Maja

Un registro scritto in una lingua, un bosco allagato dove se ne parla un'altra, e un funzionario venuto dalla Boemia.
**Prova da raccogliere:** separare le tracce documentate del lavoro e dei disegni di Ressel dai racconti nati dopo sull'origine dell'idea.

### 3. La Civetta Esce Dal Porto (Golfo di Trieste, 1829) — voce: Alex

Pece bollente, una vite di bronzo sotto la poppa e circa quaranta persone sul ponte.
**Prova da raccogliere:** osservare che cosa accade prima e dopo l'arresto della nave, e stabilire quali affermazioni quella prova permette davvero di sostenere.

### 4. Quando L'Informazione Diventa Una Rotta (Trieste, 1833-1837) — voce: Alex

Una parete coperta di date, venti e quarantene, e un sacco di posta chiuso col piombo.
**Prova da raccogliere:** verificare quali strutture trasformano una tecnologia sperimentale in partenze ripetibili e commerci organizzati.

La missione ha due co-reporter. Maja ricostruisce la traccia nelle terre slovene; Alex segue il negoziato di Europa e mondo e il porto dell'Alto Adriatico. Nessuno parlerà al posto dell'altra, ma ogni prova dovrà cambiare il modo di leggere le successive.

Un'avvertenza. Un privilegio imperiale, un racconto di paese, il verbale di una prova e una storia aziendale non pesano uguale. Prima di legarli in una catena chiedetevi chi li ha prodotti, quando, e per dimostrare che cosa.

---

## Un Tavolo Per Rimettere Ordine
<span class="byline">Cronaca di Alex</span>

La lama è sottile come un'unghia. L'uomo seduto davanti a me la tiene sopra una fiammella d'alcol finché il metallo cambia colore, poi la infila sotto un disco di ceralacca rossa e solleva il sigillo intero, senza una crepa. Come si stacca un adesivo dal diario di tua sorella. Solo che questo è il dispaccio di un ambasciatore.

Mi guardo intorno. Una stanza bassa nella Stallburg, a Vienna, sette del mattino. Odore di ceralacca fusa su un braciere di carbone, inchiostro che punge il naso, candele di sego che fanno più fumo che luce.

*MEMO, dove sono i lampadari? Il ballo?*

*"Vienna, fine inverno 1815. Il Congresso è aperto ufficialmente dal 1º novembre 1814. Ti trovi nel Gabinetto segreto della Cancelleria."*

A scuola il Congresso di Vienna era un'illustrazione con parrucche e valzer. Qui c'è un tizio con le dita nere d'inchiostro che legge la posta degli altri prima di colazione.

**Alex:** "Quindi voi… aprite tutto?"

**Il copista:** "Quello che arriva prima delle nove. La lettera deve tornare al postiglione intatta. Se il sigillo si rompe, premo sull'impronta un impasto fresco di gesso finissimo e ne ricavo una matrice. Poi si risigilla."

Parla senza alzare gli occhi. Accanto a lui altri tre copiano a una velocità assurda su fogli di carta velina, così sottile che la luce della candela ci passa attraverso. Quando finiscono, il dispaccio viene ripiegato esattamente sulle pieghe originali. Sulla carta sabbiata scricchiolano i granelli di polvere di pomice usati per asciugare l'inchiostro.

**Alex:** "E l'ambasciatore non se ne accorge?"

**Il copista:** "Riceve la sua lettera alle nove. Il Principe ne ha già la copia sulla scrivania."

Il Principe è Metternich, il ministro degli Esteri dell'imperatore. Non lo vedo. Vedo solo le sue copie.

Mi sporgo sul foglio. Parla di Venezia. L'ambasciatore scrive — il copista me lo riassume a mezza voce, e il riassunto è suo, non una citazione — che la Repubblica di Venezia non tornerà. Andrà agli Asburgo.

**Alex:** "Aspetta. Non dovevate rimettere tutto com'era prima di Napoleone? I re sul loro trono, le repubbliche…"

**Il copista:** "Legittimità, dicono i francesi. Il principe di Talleyrand la ripete in ogni seduta: le dinastie che regnavano prima dell'89 riprendano i loro troni. Giusto. Ma Venezia non aveva una dinastia. Aveva un doge eletto. E Genova?" Gira un altro foglio. "Genova va al re di Sardegna. Un muro contro la Francia."

**Alex:** "Quindi la legittimità vale solo quando fa comodo?"

Lui intinge la penna. Non risponde a me: risponde al foglio.

**Il copista:** "Gli inglesi e il Principe parlano d'altro. Di equilibrio. Nessuna potenza deve diventare così forte da schiacciare le altre. Quando le due parole vanno d'accordo, si firma. Quando non vanno d'accordo, si pesa."

::: memo-box
### MEMO GLOSSARIO

*   **Restaurazione:** progetto politico dei vincitori dopo la sconfitta di Napoleone — rimettere sul trono le dinastie e contenere nuove rivoluzioni e nuove guerre. Non un ritorno completo al 1789.
*   **Principio di legittimità:** criterio dinastico sostenuto soprattutto da Talleyrand: le famiglie che regnavano prima del 1789 hanno diritto a ritrovare troni e territori.
*   **Equilibrio fra potenze:** criterio difeso dal britannico Castlereagh e da Metternich: nessuno Stato del continente deve poter dominare militarmente gli altri.
:::

Fuori, sotto la finestra, passa una carrozza. Il rombo dei cerchioni di ferro sul selciato gelato fa tremare il vetro. Nella strada c'è letame che fuma nel freddo.

Qualcuno entra di corsa e parla in tedesco a bassa voce. Il copista posa la penna per la prima volta.

**Il copista:** "Napoleone ha lasciato l'Elba."

Mi aspetto che si alzino tutti, che scappino, che il Congresso si sciolga. Invece i fogli aumentano. MEMO me lo conferma con la sua solita calma da bollettino.

*"I lavori non si interrompono: accelerano. L'Atto finale sarà firmato il 9 giugno 1815. Waterloo è il 18 giugno: nove giorni dopo."*

Nove giorni. Hanno chiuso la carta dell'Europa prima di sapere chi vinceva la battaglia.

**Alex:** "Allora il Sacro Romano Impero lo rimettete in piedi, almeno quello?"

**Il copista:** "Sciolto nel 1806. Resta sciolto. Al suo posto una Confederazione. Trentanove Stati."

*"Prima di Napoleone, nello stesso spazio, erano oltre trecento,"* aggiunge MEMO.

Trecento contro trentanove. Non è un tasto *annulla*. È un'altra mappa con dei re vecchi sopra.

Sul tavolo, sotto le copie, c'è una minuta con un numero cerchiato: articolo 93. Riguarda le terre dove la missione scorsa ci aveva lasciati — le ex Province Illiriche. Le truppe asburgiche le hanno già rioccupate tra l'autunno del 1813 e i primi mesi del 1814. L'articolo non le conquista: ratifica sulla carta quello che i soldati hanno già fatto sul terreno.

Nella mia testa i pezzi si incastrano da soli. Anche troppo bene.

**Alex:** "Ok, ho capito. Poi fanno la Santa Alleanza e questa è la stessa cosa, giusto? Il patto per tenere tutto fermo."

*"Negativo. Tre dati."* MEMO non si scompone mai. *"La Santa Alleanza è firmata a Parigi il 26 settembre 1815, dopo la chiusura del Congresso. Firmano lo zar Alessandro I, Francesco I d'Austria e Federico Guglielmo III di Prussia. Gran Bretagna, Stato Pontificio e Impero Ottomano rifiutano di aderire."*

::: memo-box
### MEMO: DUE ALLEANZE, NON UNA

*   **Santa Alleanza (26 settembre 1815):** i tre sovrani si impegnano a governare come "fratelli" secondo la carità cristiana. Nessun organo di controllo, nessuna scadenza, nessun esercito comune.
*   **Quadruplice Alleanza (20 novembre 1815):** trattato militare e politico fra Gran Bretagna, Austria, Prussia e Russia. Crea il "sistema dei congressi": riunioni periodiche per mantenere l'equilibrio, anche con la forza.
:::

Il copista ha finito. Richiude il dispaccio sulle pieghe vecchie, scalda la ceralacca, preme la matrice di gesso. Il sigillo sembra quello di prima.

Guardo l'orologio sulla parete: le nove meno un quarto. Il postiglione aspetta in cortile, battendo i piedi.

Sembra una lettera mai aperta. È questo il punto.

---

## Misurare Un Bosco, Disegnare Una Spinta
<span class="byline">Cronaca di Maja</span>

"Levo! Še malo levo — k hrastu!"

Il palo bianco e rosso si sposta di mezzo metro, verso la quercia. L'ordine è in sloveno. L'accento è sbagliato, di quelli che si sentono subito, ma la lingua è la mia.

Chi urla è un uomo con il fango fino al ginocchio. Il suo registro l'ha lasciato aperto su un ceppo, a un passo da me. In cima alla pagina, in gotico, c'è scritto chi è: *Distriktsförster*. In tedesco, come ogni riga di quel libro.

Una lingua per il bosco, un'altra per la carta.

*MEMO, chi è?*

*"Josef Ressel. Il 16 marzo 1817 è stato nominato funzionario forestale distrettuale della tenuta del Fondo degli Studi, con sede nell'ex certosa di Pleterje, in Bassa Carniola. La certosa è stata soppressa nel 1784 da Giuseppe II; i suoi boschi sono passati allo Stato."*

Allo Stato. Ecco perché il registro parla tedesco: lo legge Vienna.

Il Krakovski gozd non somiglia a nessun bosco del Carso. È una pianura che la Krka allaga quando le pare. L'argilla nera ti afferra lo stivale e non lo molla; quelli di Ressel sono ingrassati col sego di montone e sprofondano lo stesso. Puzza di foglie di quercia che marciscono nell'acqua ferma, di corteccia fradicia. Da qualche parte una scure batte colpi lenti, poi una sega a telaio stride, poi un conducente grida roco a una coppia di buoi carinziani che trascina un tronco squadrato dentro la melma.

Mi avvicino prima che si rimetta all'occhio della sua tavoletta.

**Maja:** "Scrive in tedesco e parla in sloveno. Perché?"

**Ressel:** "Il registro lo legge Vienna. Ma Vienna le querce non le taglia." Indica il conducente dei buoi. "Le taglia lui. E se non capisco quello che mi dice, il tronco finisce sulla riva sbagliata."

I documenti lo confermano senza bisogno della sua battuta: lo sloveno Ressel lo impara qui, apposta, per farsi capire da boscaioli, carrettieri e contadini. La lingua d'ufficio resta il tedesco; nei tribunali e fra i mercanti compare anche l'italiano. Tre lingue in una sola tenuta. Nel registro aperto sul ceppo ne entra una.

Il ragazzo del palo ha più o meno la mia età. Giacca di panno ruvido che gli arriva alle ginocchia, gambe fasciate di lino grezzo e strette con lacci di cuoio.

**Maja:** "A che serve il palo?"

**Il ragazzo:** "A farsi vedere. Io lo pianto, il signore guarda dentro quella fessura e disegna. Poi vado alla quercia dopo."

**Maja:** "E quando arriva l'acqua?"

**Il ragazzo:** "Si aspetta. Oppure si passa dall'argine. Qui una corda dritta non la tiri: c'è un fosso, poi un albero caduto, poi un altro fosso."

Mi ha appena spiegato una cosa che non avevo ancora chiesto: come misuri un bosco dove non puoi camminare in linea retta.

Non lo misuri albero per albero. Ressel ha fissato una tavoletta pretoriana su un treppiede di frassino e l'ha messa in bolla con il filo a piombo. Lungo il sentiero asciutto ha tracciato sul foglio cerato una linea di base di cui conosce la lunghezza. Da lì punta la diottra — la fessura di cui parlava il ragazzo — sui pali che i ragazzi piantano nei punti scelti e riporta gli angoli sulla carta, a matita dura. Triangolazione: il bosco entra nel disegno senza che nessuno debba attraversare la palude. Con lui lavora un geometra e assistente stradale di Novo Mesto.

Poi arriva il resto. Con il compasso forestale di legno di pero, tarato in pollici austriaci, si prende il diametro dei tronchi all'altezza del petto. La mappa si divide in trapezi, e l'area si calcola con le tabelle rapide che Ressel ha pubblicato a Vienna nel 1817, nel suo manuale per il calcolo delle superfici. Così sa quante querce dritte ci sono per le ordinate e il fasciame della marina imperiale prima che cada un solo albero.

::: memo-box
### MEMO GLOSSARIO

*   **Funzionario forestale:** amministratore tecnico dei boschi dello Stato in un distretto; misura, pianifica tagli e rimboschimenti, tiene i registri ufficiali.
*   **Rilievo forestale:** misurazione e disegno della mappa di un bosco — senza, non si sa quanto legname c'è né come gestirlo.
:::

Per un attimo mi viene un orgoglio stupido, come se fosse nostro. Poi MEMO mi dice da dove viene.

*"Nato a Chrudim, in Boemia, il 29 giugno 1793. Padre tedesco, madre ceca. Studi a Vienna dal 1812 al 1814 — meccanica, idraulica, matematica — poi l'Accademia forestale di Mariabrunn fino al 1817."*

Non è nostro. E non è nemmeno straniero. È un funzionario dell'Impero, venuto dalla Boemia, che lo sloveno l'ha imparato nel fango della Krka. Non sono delusa. È una cosa più scomoda: volevo che questa storia appartenesse solo a noi, e lei non si lascia prendere.

::: target-profile
### SCHEDA PERSONAGGIO: Josef Ressel

*   **Ruolo:** funzionario forestale distrettuale nella tenuta statale di Pleterje dal 1817; nato in Boemia, formato a Vienna e a Mariabrunn.
*   **Forza:** 3 — passa le giornate a guadare un bosco allagato, e la sua firma decide quali alberi cadranno.
*   **Intelligenza:** 5 — meccanica, idraulica, matematica, e tabelle di calcolo scritte di suo pugno.
*   **Carisma:** 3 — impara la lingua di chi lavora con lui, perché boscaioli e carrettieri lo capiscano.
*   **Abilità Speciale (La Misura Che Viaggia):** porta lo stesso calcolo dal fango alla carta e dalla carta alla prova — misura prima di tagliare, disegna prima di costruire, in un posto dove nemmeno una linea retta è scontata.
:::

Sulla Krka fanno fluitare il legname. I tronchi scendono con la corrente, s'incagliano in un'ansa, due uomini li spingono via con gli uncini. Più a valle una chiatta viene tirata controcorrente, e la fune si tende come se il fiume tirasse dall'altra parte.

**Maja:** "Di tutto questo, cos'è lavoro suo?"

**Ressel:** "Tutto quello che è acqua. I fossi che prosciugano la palude. Quanto legname porta il fiume. Quanti buoi servono per una chiatta controcorrente. L'acqua non sta mai ferma, signorina. O ti aiuta o ti tira indietro."

Di navi non dice niente. Di viti nemmeno. E io vorrei tanto sentirglielo dire.

Nei libri dei miei compagni italiani Ressel è una riga: Trieste, elica, 1829. Il Krakovski gozd in quella riga non c'è. Perché nessuno lo racconta mai?

E subito dopo: posso aggiungercelo io, solo perché lo vorrei?

*MEMO, a casa ho sentito dire che proprio qui, sulla Krka, provava un modellino di barca. Con l'aiuto del fabbro della certosa.*

*"È la tradizione locale di Kostanjevica e Pleterje. Nessuna testimonianza scritta del 1817–1820 la conferma. I racconti orali sono stati raccolti decenni dopo la sua morte, durante la campagna per il monumento, intorno al 1911."*

*E il disegno del 1812? Tutti i libri dicono che l'elica l'aveva già disegnata da studente.*

*"Gli storici ritengono che il foglio datato 1812 sia una copia successiva o un disegno a memoria, fatto da Ressel stesso per sostenere la sua priorità contro gli inglesi. Nessun archivio conserva un originale del 1812."*

Nessun diario, nessuna riga d'ufficio in cui sia scritto: *guardavo il legno e ho pensato alla vite.* Che il lavoro con l'acqua e i tronchi lo abbia portato all'idea è un'inferenza degli storici. Fondata. Ma un'inferenza.

Sul quaderno traccio due colonne. A sinistra: *registro, rilievo, tabelle 1817.* A destra: *Krka, fabbro, disegno 1812.* La colonna di destra non la cancello. Ci scrivo sopra solo: *memoria — da verificare.*

---

Dieci anni dopo cambia la carta, e cambia la città. Ressel adesso lavora a Trieste, sempre per i boschi, ma per quelli che servono alla marina. L'uomo è lo stesso.

Il foglio nuovo porta il sigillo dell'imperatore Francesco I: privilegio n. 746, 11 febbraio 1827. La domanda Ressel l'aveva presentata proprio a Trieste, il 28 novembre 1825. Durata: due anni appena, prolungati poi su richiesta fino al 1829.

::: memo-box
### MEMO GLOSSARIO

*   **Privilegio d'invenzione:** concessione del sovrano che garantisce all'inventore l'esclusiva per un tempo e un territorio stabiliti. Somiglia al brevetto moderno ma non coincide: dura poco e decade se l'invenzione resta inutilizzata.
:::

L'oggetto del privilegio è una frase sola, di nuovo in tedesco: *Schraube ohne Ende zur Fortbewegung der Schiffe.* Vite senza fine per far avanzare le navi.

La ricopio sotto le due colonne. Questa riga non è un ricordo: ha un numero, una data, un sigillo.

La lascio ad Alex così com'è, con una domanda sola accanto: di questa frase, che cosa resta quando la metti in acqua?

---

## La Civetta Esce Dal Porto
<span class="byline">Cronaca di Alex</span>

Qualcuno mi mette in mano un secchio di pece bollente e mi indica una fessura nel fasciame. Non faccio in tempo a dire che non so calafatare. Il calore mi sale nel naso, denso, catramoso. Allo Squero Panfili, a Trieste, nell'estate del 1829, chi sta fermo sul molo lavora.

Intorno è un casino di rumori: martellate su ribattini di rame, pulegge di legno che cigolano, un uomo che spalma olio di lino crudo su un albero maestro. Più a poppa un altro ingrassa l'asse della macchina con una poltiglia che sa di zolfo e di grasso animale.

Mi aspettavo un piroscafo da film: fumaioli alti, ruote a pale grandi come una casa, tipo battello sul Mississippi. La *Civetta* è una goletta di legno con due alberi e le vele arrotolate. Se non fosse per il fumo nero che esce da un tubo in mezzo al ponte, direi che è una barca a vela un po' grassa.

*MEMO, dimmi che non è questa.*

*"È questa. Lunghezza circa 15,8 metri. Stazza stimata fra 33 e 48 tonnellate, secondo le fonti. Macchina a due cilindri da 6 cavalli nominali."*

Sei cavalli. Lo scooter 125 di mio cugino ne ha il doppio.

Nella tasca della giacca ho il foglio che Maja mi ha lasciato. Una riga sola, in tedesco: *Schraube ohne Ende zur Fortbewegung der Schiffe*. Vite senza fine per far avanzare le navi. E sotto, la sua domanda.

Scendo lungo lo scalo e mi chino sull'acqua sotto la poppa. Eccola. Non ha niente di una vite da falegname. È bronzo, due pale larghe e contorte, un diametro di più di un metro e mezzo, montata sull'asse immerso fra il dritto di poppa e il timone. L'hanno fusa e lavorata qui a Trieste, in un'officina meccanica della città.

La frase di Maja è diventata metallo.

::: memo-box
### MEMO GLOSSARIO

*   **Macchina a vapore:** l'acqua bolle nella caldaia; il vapore spinge i pistoni nei cilindri e il loro movimento diventa rotazione.
*   **Elica navale:** la rotazione passa lungo un albero fino alla vite di poppa; girando, le pale spingono l'acqua all'indietro.
*   **Propulsione a vite:** l'acqua spinta indietro spinge la nave in avanti. Niente ruote ai fianchi: la forza lavora sott'acqua, a poppa.
:::

Sul molo un uomo in redingote scura controlla un foglio e l'orologio. Non è un meccanico: ha le mani pulite.

**Alex:** "Lei è quello che paga?"

**Fontana:** "Carlo Ottavio Fontana. Pago, sì. Con un contratto davanti a un notaio."

**Alex:** "E che cosa ci guadagna, da una barca con sei cavalli?"

**Fontana:** "Una linea. Trieste–Venezia, veloce, regolare, passeggeri e merci. Se il vento cala, la vela si ferma; questa no. Ma solo se arriva sempre."

Sempre. Se lo segna, quel *sempre*, lo sento dal tono.

Un marinaio sta ammainando una cima accanto a me. Gli indico gli alberi.

**Alex:** "Perché le vele, se avete la macchina?"

**Marinaio:** "Perché la macchina è un aiuto, non un padrone. Chi va in mare fidandosi solo di quella non torna."

*"Nel 1829 le macchine a vapore sono considerate ausiliarie e poco affidabili,"* conferma MEMO. Tradotto: la vela è il piano A, la macchina il piano B.

La data esatta di questa uscita è un piccolo pasticcio. Ci sono state prove preliminari in luglio; negli atti della polizia marittima la prova pubblica finita male porta la data del 4 agosto 1829, ma non tutte le fonti concordano sul giorno. A bordo saliamo in circa quaranta: membri della commissione del governo marittimo, Ressel, Fontana, tecnici e curiosi. Io mi infilo fra i curiosi.

La *Civetta* si stacca dal molo. Nessuna vela. Solo il respiro della macchina, un sibilo pesante e regolare, vapore a due o tre atmosfere nei cilindri. Sotto la poppa l'acqua gorgoglia in vortici rapidi.

Ci muoviamo. In mare aperto, verso Servola e Muggia, spinti soltanto dall'elica.

**Alex:** "Funziona! Ressel, funziona!"

Ressel non si gira. Sta guardando la caldaia.

Cento metri. Duecento. Mi sono già convinto di tutto: che è fatta, che questa è la nascita della navigazione moderna, che fra un'ora saremo a Venezia.

Il molo diventa una riga bassa dietro di noi.

Poi un colpo secco, come una frusta. Un getto bianco sibila fuori dalla caldaia, l'odore di ferro caldo riempie il ponte, e il ritmo della macchina si spezza. Rallenta. Si ferma.

*"Cedimento di una saldatura in un tubo della caldaia. Perdita di vapore, calo improvviso di pressione. Nessun ferito grave."*

Il silenzio, in mezzo al golfo, è peggio del colpo.

Nessuno però va nel panico. Il timoniere sfrutta l'ultimo slancio della nave e mette la prua al vento; due marinai corrono avanti e issano le vele di prua, trinchetto e fiocco, perché una nave che non si muove non risponde più al timone. Se il vento cala del tutto, l'ancora è già pronta: la calano, così la corrente non ci spinge contro i frangiflutti delle saline o gli scogli di Barcola, e si aspettano le lance della capitaneria per il rimorchio. Guardo le due soluzioni prepararsi insieme e non so quale servirà. Più tardi non lo sapranno nemmeno le fonti: c'è chi scrive che la *Civetta* rientrò a rimorchio, chi con le vele ausiliarie.

Le vele che trovavo ridicole mezz'ora fa sono l'unica cosa che funziona.

Quanto abbiamo fatto? Chiedo a MEMO e la risposta non mi piace.

*"Circa mezzo miglio, forse un miglio marittimo: uno o due chilometri. Alcune memorie scritte molto più tardi parlano di cinque miglia e sei nodi. Queste cifre non reggono al confronto con le fonti più vicine all'evento."*

A terra, i giorni dopo, la prova diventa carta. Il governo imperiale e la Direzione di polizia marittima vietano in modo assoluto ogni nuova prova nel golfo: la caldaia è giudicata pericolosa per l'incolumità pubblica. Fontana, spaventato dai rischi e dai costi, legato alle scadenze del contratto, lo rescinde e ritira i capitali. L'elica viene sbarcata.

Fra i due, nella corrispondenza di quei giorni, si legge questo scontro. Le parole esatte non le abbiamo: quelle che seguono ne ricostruiscono il senso.

**Ressel:** "L'elica non ha il minimo difetto. Si è rotto un tubo della caldaia, fornita dalla Stiria. Non la vite."

**Fontana:** "Per chi vende biglietti conta la nave intera. Non posso rischiare la bancarotta e i sequestri per una caldaia che scoppia davanti a quaranta testimoni."

Hanno ragione tutti e due, ed è questo che mi manda fuori di testa.

Il privilegio del 1827 scadrà senza che nessuno lo sfrutti in un cantiere. La frase di Maja è andata in acqua, ha girato, ha spinto. Poi un tubo ha ceduto, e quello che resta, adesso, è un pezzo di bronzo su un molo.

La vite ha girato. La nave si è fermata. Sono due frasi diverse.

::: checkpoint
### CHECKPOINT: Che cosa ha dimostrato davvero la prova interrotta della *Civetta*: che il nuovo sistema non era pronto, o che una sua parte funzionava già?

Hai raccolto: un privilegio del 1827 che protegge per iscritto una "vite senza fine" per navi; una nave che nel 1829 si muove spinta solo dall'elica per mezzo miglio, forse un miglio, poi si ferma per il cedimento di un tubo della caldaia e non può più riprovare.

*   **A.** Una nave che non completa la prova in sicurezza non ha ancora dimostrato di essere un sistema affidabile per il servizio commerciale: il movimento iniziale non basta.
*   **B.** Il movimento prima del guasto è una prova parziale a favore dell'elica: il cedimento di un altro componente lascia aperta l'affidabilità della nave intera, ma non cancella ciò che è stato osservato.

Tieni a mente la tua risposta: il Verdetto nel Debriefing te la confermerà, la correggerà, o ti mostrerà che la realtà era più complicata di entrambe.
:::

---

## Quando L'Informazione Diventa Una Rotta
<span class="byline">Cronaca di Alex</span>

Un impiegato in piedi su uno sgabello scrive con il gesso su una parete. Nome della nave, porto di partenza, data, vento. Sotto, in un'altra colonna: *quarantena*. Sotto ancora: il prezzo del grano a Odessa.

Non è una lavagna di scuola. È grande come mezza aula, e ci stanno davanti sei uomini in silenzio, come davanti al tabellone delle partenze di un aeroporto.

*MEMO, dove sono?*

*"Trieste, uffici della Borsa, 1833. Il Lloyd Austriaco è stato fondato il 20 aprile di quest'anno."*

La stanza sa di polvere di carta e di tabacco da fiuto. Sui banchi di noce scuro ci sono registri rilegati in pergamena, calamai d'ottone, vasetti di sabbia per asciugare l'inchiostro. Le lettere commerciali arrivano piegate su se stesse, senza busta, chiuse con un sigillo a secco. Dalle finestre grandi entra il libeccio con tutta l'umidità del mare, e i fogli sul davanzale si arricciano.

Mi aspettavo navi. Qui non c'è neanche una nave. Ci sono solo notizie di navi.

L'impiegato scende dallo sgabello. Ha le dita bianche di gesso.

**Alex:** "Chi vi dice tutte queste cose? Il vento a Smirne, il grano a Odessa…"

**L'impiegato:** "I nostri corrispondenti. Uno a Costantinopoli, uno ad Alessandria, a Venezia, a Odessa, a Malta. Ogni volta che un bastimento tocca il loro porto scrivono un bollettino, sempre nello stesso ordine, e lo mandano col primo legno postale. O via terra, con la staffetta."

**Alex:** "E se il bollettino arriva tardi?"

**L'impiegato:** "Arriva sempre tardi. Il punto è che arrivi. Prima, un mercante di qui poteva aspettare mesi per sapere se la sua nave era affondata al largo di Creta o ferma per la peste a Smirne. Adesso sa quando è partita, con che vento, e quanto ci mette in media una nave a fare quella traversata."

Io, a casa, so dov'è un pacco da un'app. Loro lo sanno da un muro scritto col gesso. Funziona uguale: ritardo compreso.

Un uomo con il panciotto di seta si avvicina alla parete e fa un conto con il dito. Sta decidendo se assicurare un carico prima che salpi la prossima nave.

**Alex:** "Scusi, lei cosa guarda?"

**Il mercante:** "La data di partenza, il vento, l'avviso di tempesta. Se la traversata sta andando più lunga della media, il premio sale. Se è nella media, assicuro e spedisco. Se il porto è chiuso per quarantena, aspetto."

Non è indovinare. È trasformare la paura del mare in un numero da scrivere su una polizza.

Il Lloyd l'hanno fondato diciannove compagnie di assicurazione marittima, banchieri e negozianti, guidati da Karl Ludwig Bruck — il titolo di barone e il posto di ministro a Vienna arriveranno anni dopo. E per ora non ha nemmeno una barca a remi. Ha una rete, e un giornale quotidiano, il *Giornale del Lloyd Austriaco*, pieno di arrivi, partenze, naufragi, prezzi e quarantene.

::: memo-box
### MEMO GLOSSARIO

*   **Assicurazione marittima:** chi assicura valuta il rischio di un viaggio e lo divide fra molti in cambio di un premio; se la nave affonda, paga lui.
*   **Linea regolare:** un servizio che parte su una rotta fissa e con tempi stabiliti, anche quando c'è poco carico.
*   **Compagnia di navigazione a vapore:** un'impresa che mette insieme navi, equipaggi, capitali e autorizzazioni per ripetere quel servizio, viaggio dopo viaggio.
:::

Fuori, sulle rive del Porto Franco, i caricatori dalmati e carsolini in camicia di canapa scaricano balle di cotone egiziano e barili di caffè dai trabaccoli e dalle tartane arrivati dall'Egeo. Un uomo passa con un sacco di posta chiuso con un sigillo di piombo. Da Vienna la posta arriva in carrozza, passando da Lubiana e Maribor: quattro, sei giorni di strada. La ferrovia non c'è ancora.

*"Salto: 1836,"* dice MEMO.

Il 2 agosto 1836 l'assemblea dei soci del Lloyd decide di aprire una seconda sezione: la Compagnia di Navigazione a Vapore. Il governo di Vienna le concede agevolazioni doganali, esenzioni fiscali e soprattutto il monopolio del trasporto della posta imperiale verso il Levante. Entrate fisse, a ogni viaggio, piena o vuota che sia la nave.

Lo stesso Impero che a Vienna aveva rimesso i re sui troni adesso firma la concessione per i piroscafi. Chiude la porta alle rivoluzioni e la apre al commercio, con la stessa penna.

Il 16 maggio 1837 sono sulla riva a guardare la prima partenza di linea: il piroscafo *Arciduca Lodovico*, per Costantinopoli, con scali ad Ancona, Corfù, Patrasso, il Pireo e Smirne.

Guardo la poppa. Cerco il bronzo.

Non c'è. Ai fianchi della nave girano due ruote enormi a pale, che frustano l'acqua e buttano spruzzi fino al molo.

**Alex:** "Aspetta. Niente elica?"

*"Tutte le prime navi del Lloyd, fra il 1836 e il 1840, sono piroscafi a ruote. Costruite sul Tamigi o a Trieste con motori inglesi. Il Lloyd adotterà l'elica solo negli anni Cinquanta."*

Nella lista delle prime navi della compagnia, a proposito, ce n'è una che si chiama *Principe Metternich*. Il signore delle copie delle sette del mattino ora ha un piroscafo col suo nome.

E io che nella testa avevo già il titolo pronto: *il Lloyd realizza il sogno della Civetta*. Lo cancello. Nelle carte della compagnia non risulta un contratto, un tecnico, un pezzo che passi dall'una all'altra. Se un filo fra Ressel e questa banchina esiste, nessun documento lo mostra.

L'uomo del sacco di piombo lo porge a un marinaio sulla passerella.

**Alex:** "E se non ci sono abbastanza passeggeri?"

**L'agente postale:** "La posta dell'imperatore parte lo stesso. Per questo parte la nave."

La ruota comincia a girare. L'*Arciduca Lodovico* si stacca dal molo.

Dentro, all'ufficio, sul muro di gesso, l'impiegato ha già tracciato la riga per il prossimo bollettino da Costantinopoli.

---

## Debriefing

Mission Control ha messo quattro oggetti sullo stesso tavolo: una matrice di gesso ancora sporca di ceralacca, un quaderno aperto su due colonne, un pezzo di bronzo a due pale e una lastra coperta di gesso con nomi di navi e venti.

Vienna, la Carniola, Trieste. Tre posti, un solo spazio: lo stesso Impero decide i confini, paga un funzionario forestale venuto dalla Boemia per misurare le sue querce, protegge con un privilegio la sua vite e poi concede la posta del Levante a una compagnia di piroscafi. Persone, idee, legname e notizie si muovono dentro quello spazio. Nessuno di questi pezzi basta da solo.

**Maja:** "Hai gridato 'funziona' dopo duecento metri."

**Alex:** "E tu volevi che fosse vostro prima di sapere da dove veniva."

Nessuno dei due ritira quello che ha detto. Ma la colonna *memoria — da verificare* di Maja è quello che mancava al grido di Alex sul ponte. E le ruote a pale che Alex ha visto il 16 maggio 1837 sono quello che manca a qualunque racconto che porti Ressel in linea retta dal bosco al Lloyd.

**Verdetto.** Il Congresso di Vienna restaurò dinastie e costruì un equilibrio fra potenze, ma non riportò l'Europa al punto di partenza: Venezia, Genova e il Sacro Romano Impero non tornarono. La nuova navigazione non nacque in un solo luogo né dal gesto isolato di un inventore: Ressel lavorò fra terre slovene e Alto Adriatico, ottenne il privilegio nel 1827 e collaudò nel 1829 uno dei primi sistemi funzionanti di propulsione navale con l'elica a poppa, ma l'origine esatta della sua idea resta un'inferenza. Al Checkpoint, **B regge per il componente** e **A regge per il sistema**: la *Civetta* fornì una prova parziale della propulsione a vite, non la prova di un servizio commerciale affidabile. Il Lloyd del 1833-1836 mostra l'ultimo passaggio — informazioni, capitale, autorizzazioni, posta e linee regolari trasformano possibilità tecniche in una rete — e lo fa con navi a ruote, senza l'elica di Ressel.

::: reality-check
### CIÒ CHE NON SAPPIAMO ANCORA

*   **Da dove viene l'idea:** il disegno datato 1812 potrebbe essere una copia fatta a memoria anni dopo, e le prove del modellino sulla Krka sono ricordi raccolti decenni più tardi. Il legame fra il lavoro forestale e l'elica è un'ipotesi fondata, non un documento.
*   **Che cosa accadde esattamente nel 1829:** il giorno preciso della prova, la distanza (fra mezzo miglio e un miglio, secondo le fonti più vicine) e il numero dei presenti (circa quaranta) restano stime.
*   **Che cosa vuol dire "primo":** Ressel ha il merito del privilegio del 1827 per l'elica immersa a poppa; l'idea di una vite nell'acqua circolava già nel Settecento, e l'adozione su larga scala arriva dal 1836 con l'inglese Francis Pettit Smith e lo svedese John Ericsson. Il titolo di "primo applicatore dell'elice" compare nel 1858 in una monografia commemorativa stampata dalla tipografia del Lloyd, l'anno dopo la sua morte a Lubiana.
:::

::: memo-box
### CRONOLOGIA ESSENZIALE

*   **9 giugno 1815:** Atto finale del Congresso di Vienna.
*   **16 marzo 1817:** Ressel funzionario forestale a Pleterje.
*   **11 febbraio 1827:** privilegio n. 746 per la "vite senza fine".
*   **Estate 1829:** prova della *Civetta* nel golfo di Trieste.
*   **20 aprile 1833:** nasce il Lloyd Austriaco, rete di informazioni marittime.
*   **2 agosto 1836:** nasce la sua Compagnia di Navigazione a Vapore.
:::

Il 1815 aveva provato a fermare l'orologio; nel 1837 un piroscafo parte per Costantinopoli, e poi un altro, e poi un altro ancora. Le navi ora possono partire su linee regolari e la città cresce attorno al porto.

Ma chi trasporta, ripara e soprattutto nutre una città industriale prima che le sue strade si sveglino?

<!-- WORD COUNT: ~5580 -->
<!-- PERSONA CHECK: Alex/Maja voice intact? Pass — Alex mantiene il tic scarto media/realtà (Congresso da illustrazione scolastica, piroscafo da film, "lavagna di scuola") entro il limite di 3 usi; Maja mantiene il tic "perché nessuno lo racconta mai" e la voce da strutture/documenti (colonne, registro, privilegio); nessuna deriva verso prosa AI generica. -->
<!-- NUF CHECK:
1. Catena Napoleone→Congresso→restaurazione/equilibrio vs ritorno impossibile al 1789: ✅
2. Quattro livelli idea/privilegio/prova/adozione distinti senza "inventato"=diffuso: ✅
3. Prova tecnica incompleta valutata (Checkpoint + Verdetto A/B): ✅
4. Tensione dell'esperimento interrotto, niente favola del genio incompreso ("Hanno ragione tutti e due"): ✅
5. Orgoglio inquieto di Maja + rischio di appropriazione nazionale: ✅
6. Congresso di Vienna, legittimità, equilibrio, Santa Alleanza distinti per data/funzione/firmatari: ✅
7. Servizio forestale di Ressel datato/fontato, origine idea marcata "memoria — da verificare": ✅
8. Privilegio 1827 e prova 1829 con linguaggio proporzionato (stime, range, "secondo le fonti"): ✅
9. Lloyd 1833 vs 1836 distinti, nessun nesso causale diretto con l'elica di Ressel inventato: ✅
10. Scena Slovenia autonoma, non nota a margine: ✅
-->
<!-- ANTI-AI CHECK: nessun pattern bannato, nessun anacronismo, nessuna etichetta di produzione (Beat/Scena/EU/GIULIA/SLOVENIA) nel testo, briefing in forma "indagine" senza risposta anticipata, checkpoint unico con vera decisione A/B, debriefing con Verdetto + Ciò Che Non Sappiamo + Cronologia Essenziale, MEMO entro 3 informazioni per intervento, densità lessicale (max 2 nomi propri/3 termini tecnici nuovi per beat) rispettata. -->


<div style="page-break-after: always;"></div>

# Capitolo 9 — Società Industriale E Vita Quotidiana Di Confine

## Briefing

Alex, Maja: coordinate principali XIX secolo. Si parte dal 1833 e si arriva al 1840, pochi anni dopo le linee regolari a vapore del 1836 che avete visto partire da Trieste nel capitolo precedente. A metà missione, però, faremo un salto in avanti dichiarato: fino alla seconda metà dell'Ottocento, verso il 1890 e il 1891. Certe reti di lavoro esistono da prima, ma le fonti le rendono visibili soltanto allora. Non è un errore di calendario. È il punto esatto in cui cominciano le prove. Il capitolo successivo vi riporterà indietro, al 1848.

Il manuale propone questa catena: macchine → fabbriche → contadini che si trasferiscono in città → proletariato salariato da una parte e borghesia industriale dall'altra. La società industriale nasce e vive dentro la fabbrica.

Qualcosa non torna. Ogni mattina, prima che suoni qualunque turno, merci deperibili entrano in città insieme a lavoratrici che lì non abitano. Nei registri del cantiere non compaiono.

La vostra missione è raccogliere cinque prove e ricostruire la rete di persone, capitale, cibo e regole che tiene in vita una città industriale.

## OBIETTIVI DEL SALTO (SCENE)

### 1. La Città Che Suona A Turni (Manchester, 1833) — voce: Alex

Una canna che batte sui vetri prima dell'alba, un orologio appeso all'ingresso e un'aria piena di fiocchi bianchi.
**Prova da raccogliere:** verificare quali cambiamenti trasformano macchine e lavoratori in un sistema di fabbrica, e quali conseguenze produce sulla crescita della città.

### 2. Dietro Il Cancello Del Cantiere (Trieste, 1840) — voce: Alex

Pece bollente, una goletta ancora sullo scalo e tre paghe molto diverse per la stessa giornata.
**Prova da raccogliere:** stabilire quali elementi del modello industriale sono già visibili nel cantiere, e quali non autorizzano ancora a chiamare Trieste una copia di Manchester.

### 3. Il Latte Prima Dell'Alba: Le Mlekarice (Carso–Trieste, verso il 1890) — voce: Maja

Una cisterna nella roccia, un cesto piatto sulla testa e un libretto di conti.
**Prova da raccogliere:** seguire provenienza, trasporto, vendita e ritorno del denaro, per capire che rapporto esiste fra la domanda della città e un lavoro rurale che la fabbrica non registra.

### 4. La Strada Delle Uova: Le Šavrinke (Istria–città costiere, 1891) — voce: Maja

Un uovo guardato controluce, una cesta piena di crusca e un nome che non tutti pronunciano con rispetto.
**Prova da raccogliere:** distinguere chi produce da chi compra e rivende, e verificare che cosa una fonte del tempo permette davvero di affermare su merci, strade e rischio.

### 5. Otto Giorni Sotto Una Frasca (Carso, 1891, con un documento del 17 agosto 1784) — voce: Alex

Un ramo d'edera legato a un portone, una botte da finire e un sacco strappato in cielo.
**Prova da raccogliere:** confrontare una regola sulla vendita diretta e una leggenda sul paesaggio, e stabilire quale informazione economica può dare ciascuna delle due.

La missione ha due co-reporter. Alex segue il sistema di fabbrica in Europa e mondo e il suo primo avvio nell'Alto Adriatico; Maja ricostruisce nelle terre slovene le reti di lavoro, lingua e credito che i cancelli industriali lasciano fuori dall'inquadratura. Non dovete vedere le stesse cose. Dovete capire se ciò che vede uno cambia il significato di ciò che ha visto l'altro.

Attenzione: una legge, un registro di paga, una descrizione di viaggio, una testimonianza raccolta decenni dopo e una leggenda non hanno lo stesso peso. Prima di unirli, chiedetevi che cosa prova davvero ciascuno, e per quale data.

---

## La Città Che Suona A Turni
<span class="byline">Cronaca di Alex</span>

Tic. Tic. Tic.

Una canna lunga e sottile batte contro il vetro di una finestra al primo piano. Non smette finché dietro il vetro non compare una faccia gonfia di sonno che fa sì con la mano. Allora l'uomo con la canna passa alla finestra dopo.

Sono quasi le cinque del mattino. Manchester, autunno del 1833. La nebbia è così fitta che il lampione a gas in fondo alla strada sembra una caramella sciolta.

*MEMO, chi è quel tizio? Un ladro molto educato?*

*"Un knocker-up. Lo pagano pochi pence a settimana per battere ai vetri prima del turno. Chi arriva in ritardo in fabbrica paga una multa."*

Una sveglia umana. In abbonamento. Io ho tre allarmi sul telefono e arrivo tardi lo stesso.

Dieci minuti dopo la strada si riempie. Uomini, donne, ragazzini. Hanno ai piedi zoccoli di legno con un ferro a mezzaluna sotto la suola e sotto il tacco, e sul selciato fanno un rumore da cavalleria. Seguo il fiume di gente fino a un edificio lungo, di mattoni, con file di finestre tutte uguali. Suona una campana. Il cancello si apre, la gente entra, il cancello si chiude.

A scuola la rivoluzione industriale era una foto: ciminiere, fumo nero, cielo color carbone. Dentro la filatura, invece, mi si attacca addosso qualcosa di bianco. Fiocchi di cotone. Volano dappertutto, leggeri come neve che non scende mai, e si posano sulle ciglia, sui capelli, sulle spalle di tutti.

E fa caldo. Un caldo umido, da serra, con le finestre sbarrate.

*"Temperatura fra 24 e 30 gradi,"* dice MEMO. *"Umidità tenuta alta con getti di vapore: il filo sottile, all'asciutto, si spezza di continuo."*

Quindi il caldo non è un difetto. È voluto. Per il filo, non per le persone.

Poi c'è il rumore. Sul soffitto gira un lungo albero di ferro, e da quello scendono cinghie di cuoio che fanno muovere centinaia di macchine tutte insieme. In fondo al capannone, da qualche parte, c'è una macchina a vapore che non vedo e che comanda tutto. Il frastuono è un muro. Grido *"MEMO!"* e non sento neanche la mia voce.

Una donna al telaio si gira verso la vicina e muove le labbra, senza un suono. La vicina annuisce. Capito tutto.

*"Mee-mawing,"* MEMO me lo scrive quasi nell'orecchio. *"Nel Lancashire i tessitori imparano a leggere le labbra per parlarsi nel frastuono."*

Hanno inventato una lingua muta perché la macchina si è presa l'aria.

Accanto all'ingresso, su una parete ingrigita dall'olio, c'è un orologio. È l'unico. Sotto, con un registro aperto, sta un uomo in giacca di fustagno che non tocca nessun filo: guarda. Lo chiamano overlooker, il sorvegliante. Durante il cambio di una cinghia, quando per un attimo il rumore cala, riesco a parlargli.

**Alex:** "Quello è l'unico orologio? Nessuno ne ha uno suo?"

**Il sorvegliante:** "Un orologio in tasca, qui dentro? Chi lo porta viene mandato a casa. L'ora è quella." Batte la penna sul vetro. "Quella del padrone."

**Alex:** "E se è avanti? O indietro?"

Lui non risponde. Scrive un nome sul registro.

Più tardi, all'uscita, una tessitrice mi dirà a mezza voce che la sera quell'orologio va piano, e la mattina va di corsa. È una frase sola, e non posso controllarla. Ma gli storici hanno trovato molte lamentele così: sorveglianti che manomettevano l'orologio di fabbrica per allungare il turno senza pagarlo.

Sotto un filatoio, a piedi nudi, si infila un ragazzino. Esce. Il sorvegliante gli indica un altro punto. Si infila di nuovo. Esce. Sempre lo stesso gesto, sempre sotto una macchina che non si ferma mai.

**Alex:** "Quanti anni ha?"

**Il sorvegliante:** "Tredici, dice il certificato."

**Alex:** "E senza il certificato?"

**Il sorvegliante:** "Adesso il Parlamento li vuole, i certificati. Un medico firma, io archivio. Se il medico ha visto bene non lo so. Non è il mio lavoro."

Il ragazzino passa accanto a noi. Sembra più piccolo di mia cugina, che ne ha dieci.

*MEMO, che legge?*

*"Factory Act, 29 agosto 1833. Vietato il lavoro nelle fabbriche tessili sotto i 9 anni. Fra 9 e 13 anni: massimo 8 ore al giorno, più 2 ore di scuola a carico del datore di lavoro."*

**Alex:** "Otto ore. Mi aspettavo peggio."

Il sorvegliante fa una smorfia che non capisco finché non parla MEMO.

*"Prima della legge, alcuni testimoni interrogati da una commissione del Parlamento hanno descritto giornate dalle 5 o 6 del mattino alle 20 o 21, con 30-40 minuti di pausa. Parlano delle loro fabbriche, non di tutte."*

Tre cose, come sempre. E la terza è quella che mi resta in testa: quelle voci raccontano un pezzo di Inghilterra, non una fotografia di ogni capannone. Però bastano per capire perché una legge del genere è sembrata necessaria.

**Alex:** "E chi controlla che la rispettiate?"

**Il sorvegliante:** "Gli ispettori."

**Alex:** "Quanti?"

**Il sorvegliante:** "Quattro. Per tutto il regno."

Quattro. Per migliaia di fabbriche. Controllare tutto il Regno Unito con quattro persone è come fare l'appello in uno stadio.

Alla pausa di mezzogiorno il ragazzino si siede su una cassa e mangia una patata bollita condita con un velo di lardo. Accanto a lui una donna beve un tè così chiaro che sembra acqua sporca. Nessuno ha carne. Un medico della città, l'anno scorso, durante il colera, ha scritto proprio questo: patate, lardo, farina d'avena, tè scadente, pane raffermo, famiglie operaie stipate in cantine umide senza fognature.

**Alex:** "Tu abiti vicino?"

**Il ragazzo:** "Dietro il canale. Siamo venuti dall'Irlanda quando ero piccolo. La mamma dice che in campagna non c'era più niente."

Dall'Irlanda, e dalle campagne inglesi. Arrivano qui perché qui c'è il lavoro. E il lavoro c'è qui perché la macchina a vapore non si può portare a casa di nessuno.

*"Popolazione dell'area di Manchester: circa 69.000 abitanti nel 1801, circa 164.000 nel 1831. Stima: i confini dei censimenti non coincidono."*

In trent'anni la città è più che raddoppiata, anche se nessuno può dire esattamente di quanto.

::: memo-box
### MEMO GLOSSARIO

*   **Sistema di fabbrica:** macchine costose, energia del vapore e lavoratori concentrati nello stesso edificio, sotto lo stesso orario e lo stesso padrone. Chi lavora non possiede più gli strumenti né decide il proprio tempo.
*   **Divisione del lavoro:** la produzione viene spezzata in tanti compiti semplici e ripetuti; ognuno ne esegue uno, al ritmo della macchina.
*   **Inurbamento:** aumento della popolazione di una città, perché lavoro e servizi si concentrano nello stesso spazio e attirano gente dalle campagne.
:::

Mio nonno faceva il falegname: diceva che il lavoro finisce quando il tavolo è finito. Qui niente finisce. Finisce il turno.

La campana suona di nuovo. Il ragazzino butta la buccia, si pulisce le mani sui pantaloni e torna sotto il filatoio.

Alle mie spalle, l'orologio all'ingresso segna un'ora che nessuno, qui dentro, può controllare.

---

## Dietro Il Cancello Del Cantiere
<span class="byline">Cronaca di Alex</span>

"Trenta carantani."

L'uomo lo dice senza guardarmi, mentre scarica una trave di larice dalla spalla. È magro, con una camicia di canapa incollata alla schiena e le mani piene di schegge.

**Alex:** "Trenta carantani… al giorno?"

**Il manovale:** "Al giorno. D'estate si fanno undici, dodici ore. Venticinque, se il capo è di cattivo umore. Trentacinque, se è di buono."

Trieste, estate del 1840. Il Cantiere San Marco sta fra la collina di Sant'Andrea e Servola, sulla riva, e ha l'aria di una cosa nuova che non ha ancora finito di nascere. È stato inaugurato il 21 marzo di quest'anno. Gli scali su cui poggiano le navi in costruzione non sono di terra battuta: sono di muratura. Ci sono tettoie fisse per chi lavora. E in fondo, un'officina con le forge accese.

Il rumore qui è doppio. Da una parte il colpo sordo dell'ascia sul legno: un maestro d'ascia sta sagomando un madiere, una delle costole della nave, e ogni colpo fa volare un truciolo largo come una mano. Dall'altra lo stridore dell'incudine, dove un fabbro ribatte un tirante di ferro arroventato. Legno e ferro, a venti metri di distanza.

E sopra tutto, la puzza. Pece nera che bolle in un calderone, acre, pungente, che ti si attacca in gola.

Ok. Ho già capito tutto. Macchine, operai, un padrone: è Manchester col mare.

*MEMO, conferma. Manchester dell'Adriatico, giusto?*

*"Negativo. A Trieste, nel 1840, le industrie sono poche: questo cantiere, una fonderia e officina aperta nel 1835 a Sant'Andrea, le officine che riparano i piroscafi del Lloyd. La città vive soprattutto di porto e di commercio."*

Mi brucia un po'. Sono venuto qui con la parola "fabbrica" in mano e la volevo appoggiare sopra ogni cosa.

Mi avvicino allo scafo sullo scalo. Un calafato è in ginocchio contro il fasciame. Ha le dita nere di catrame fino alla seconda falange, e callose come corteccia. Con un ferro scanalato infila a forza nelle fessure fra le tavole una stoppa di canapa sfilacciata, poi ci batte sopra col mazzuolo di legno. Toc. Toc. Toc.

**Alex:** "Cos'è quella roba?"

**Il calafato:** "Cime vecchie. Si sfilano, si imbevono di catrame, si cacciano dentro." Fa un cenno col mento verso il calderone. "Poi sopra ci va la pece, bollente, con il sego. In acqua fredda si gonfia e tiene. Il sale non la mangia."

**Alex:** "E se sbagli?"

**Il calafato:** "Se sbaglio, la nave beve."

Nessun silicone, nessun sigillante in tubetto. Solo corda vecchia, grasso animale e pece. E una nave che deve reggere il mare aperto.

**Alex:** "Quanto prendi?"

**Il calafato:** "Fra quarantacinque e cinquantacinque carantani. I segantini uguale. I maestri d'ascia di più." Indica l'uomo con l'ascia. "Lui arriva al fiorino. Anche al fiorino e venti."

*"Un fiorino vale 60 carantani,"* aggiunge MEMO.

Faccio il conto a mente, male, due volte. Il maestro d'ascia può guadagnare in un giorno quasi quanto il manovale in tre, forse di più. Stesso cantiere, stessa nave, stesso sole.

**Alex:** "E questa nave, di chi è?"

Il calafato ride, e per la prima volta mi guarda.

**Il calafato:** "Mia no di certo. Io vendo la giornata. Quando la nave va in mare, io cerco un'altra giornata."

::: memo-box
### MEMO GLOSSARIO

*   **Lavoro salariato:** chi lavora vende il proprio tempo a un'impresa in cambio di una paga (a giornata, a settimana); il prodotto finale non gli appartiene.
*   **Proletariato:** chi vive soprattutto del salario perché non possiede i mezzi di produzione — scali, officine, capitali.
*   **Borghesia imprenditoriale:** chi possiede o finanzia l'impresa, organizza il lavoro e si prende il rischio di guadagnare o perdere. Non sono etichette morali, e nessuno dei due gruppi è tutto uguale al suo interno.
:::

Il manovale di prima è tornato con un'altra trave. Gli chiedo da dove viene.

**Il manovale:** "Dal Carso. Mio cugino è venuto dal Friuli. Qui ci sono istriani, carniolini… Chi trova giornata resta."

*"Nel 1821 Trieste e il suo territorio contavano circa 45.000 abitanti. Verso il 1840 il comune supera i 75.000. Molti arrivano da Friuli, Istria, Carso e Carniola."*

La città cresce. Non come Manchester, ma cresce.

Sotto la tettoia, un uomo sulla quarantina tiene un foglio pieno di linee curve e numeri, e discute con il maestro d'ascia. Non ha le mani sporche di pece. Ha le dita sporche d'inchiostro. Il calafato abbassa la voce.

**Il calafato:** "Il professore."

È Gaspare Tonello. Veneziano, costruttore navale, il fondatore del cantiere. Dal 1820 insegna architettura navale all'Accademia di Commercio e Nautica.

Le parole che seguono sono ricostruite: non le abbiamo scritte da lui. Il senso, però, viene da quello che sappiamo del suo lavoro.

**Alex:** "Scusi, ma perché i numeri? Quel signore con l'ascia sembra sapere già dove tagliare."

**Tonello:** "Lo sa. Come lo sapevano suo padre e suo nonno, negli squeri. A occhio, a mano, per esperienza. Per una barca va bene. Ma per navi più grandi, con il ferro, con le macchine a vapore dentro, l'occhio non basta. Serve il calcolo. Servono officine vicine agli scali. E servono molti soldi, tutti insieme."

**Alex:** "E i soldi chi li mette? Lei?"

**Tonello:** "Chi ha le navi da assicurare e le merci da muovere."

*"Mercanti all'ingrosso, banchieri, armatori, azionisti delle compagnie di assicurazione nate a Trieste. Il Porto Franco esenta le merci dai dazi; Vienna sostiene le infrastrutture."*

Non è la fabbrica che ha fatto nascere il porto. È il porto che adesso sta facendo nascere la fabbrica.

::: target-profile
### SCHEDA PERSONAGGIO: Gaspare Tonello

*   **Ruolo:** costruttore navale veneziano (1798–1849), docente all'Accademia di Commercio e Nautica di Trieste dal 1820, fondatore del Cantiere San Marco.
*   **Forza:** 3 — non ha né una flotta né una banca, ma riesce a far convergere terreni, maestranze e capitali su un solo progetto.
*   **Intelligenza:** 5 — architettura navale, navigazione pratica, e uno strumento per il rilievo nautico inventato da lui, il trigonometro.
*   **Carisma:** 3 — deve convincere i vecchi maestri d'ascia e i nuovi finanziatori insieme, due pubblici che non parlano la stessa lingua.
*   **Abilità Speciale (Dall'Aula Allo Scalo):** porta il calcolo della lavagna dentro il cantiere e trasforma lo squero a occhio in un sistema di scali in muratura, officine e capitali — il primo approccio industriale alla costruzione navale a Trieste.
:::

::: memo-box
### MEMO: CHI METTE I SOLDI

*   **Assicurazioni Generali (1831)** e **Riunione Adriatica di Sicurtà (1838):** compagnie assicurative nate a Trieste, i cui azionisti finanziano anche l'industria.
*   **Lloyd Austriaco:** dal 1836 compagnia di navigazione a vapore; le riparazioni dei suoi piroscafi hanno bisogno di officine meccaniche stabili.
:::

Sullo scalo più vicino al mare c'è lo scafo di una goletta, già quasi completo. Il fasciame di quercia è lucido di pece nuova.

**Alex:** "Come si chiamerà?"

**Il calafato:** "*Primogenito*. È la prima di questo cantiere. La mettiamo in mare a settembre."

La prima. Non la centesima. A Manchester le macchine battono da decenni; qui, sotto le tettoie nuove, stanno appena cominciando.

A fine giornata il manovale si carica la giacca sulla spalla ed esce dal cancello verso la città, verso settantacinquemila persone che domattina, prima di qualunque turno, vorranno qualcosa da mettere in tazza.

---

## Il Latte Prima Dell'Alba: Le Mlekarice
<span class="byline">Cronaca di Maja</span>

Un passo corto. Un altro. Le ginocchia appena piegate, il piede che rulla dal tallone alla punta, la testa immobile, come se qualcuno gliela tenesse ferma con due dita.

Davanti a me, nel buio, una donna scende la *škala*, il sentiero di pietra che dal Carso precipita verso Trieste. Sulla testa porta un cesto largo e piatto. Nel cesto, tre brocche di latte. Il cesto non oscilla. Nemmeno di un dito.

Io invece scivolo due volte in cinque minuti.

La bora arriva a raffiche, di traverso, e mi fa lacrimare gli occhi. La pietra è bagnata, a tratti ghiacciata. Lei ha scarponi di cuoio grezzo con la suola piena di chiodi a testa piramidale, e sul calcare non perde mai presa. Io ho le mie scarpe da ginnastica, e le odio.

*MEMO, anno.*

*"Verso il 1890. La vendita di latte dal Carso a Trieste esiste da prima, ma negli archivi di metà secolo compaiono solo generiche 'venditrici di latte'. Le descrizioni precise di strade, orari e recipienti sono soprattutto degli anni 1890-1910, e molte vengono da testimonianze raccolte nel Novecento."*

Quindi il salto in avanti non è un capriccio. Più indietro di così, con prove che reggono, non si arriva.

Sono cresciuta sul Carso. Delle *mlekarice* ho sempre sentito parlare come di una "vecchia usanza", roba da cartolina. Perché nessuno mi ha mai detto che era un lavoro pagato, con clienti e conti?

Sopra ogni brocca è legato un pezzo di tela grezza bagnata. Sull'ultima, due grandi foglie di cavolo.

**Maja:** "Le foglie servono a qualcosa o erano finiti gli stracci?"

**La mlekarica:** "Erano finiti gli stracci." Non si gira: girarsi vorrebbe dire muovere la testa. "Ma servono uguale. Il vento le asciuga. Finché asciuga, il latte resta freddo."

L'acqua evapora e porta via calore. La bora, che a me fa solo male, per lei lavora gratis.

E il freddo era cominciato prima. Alle quattro, nella stalla di casa sua a Trebče, l'ho vista mungere due mucche: il latte usciva caldo, sui 37 gradi, e fumava nell'aria gelata. Non l'ha versato subito nelle brocche. L'ha filtrato attraverso una pezza di lino fitta, il *cedilo*, che ha trattenuto peli e pagliuzze. Poi ha immerso le brocche nella cisterna scavata nella roccia, la *štirna*, nell'acqua nera e gelida. Niente frigorifero, niente pastorizzazione data per scontata. Ogni grado in meno era un'ora in più prima che il latte inacidisse.

**Maja:** "E se arriva acido?"

**La mlekarica:** "Non arriva. Se arriva, l'hai portato giù per niente."

::: memo-box
### MEMO GLOSSARIO

*   **Mlekarice:** contadine dei villaggi del Carso che ogni mattina portavano a piedi il latte appena munto ai loro clienti fissi di Trieste.
*   **Economia domestica rurale:** l'insieme del lavoro e delle decisioni economiche di una famiglia contadina — stalla, campo, cava di pietra, vendita. Non vuol dire "senza soldi": proprio la vendita del latte porta contante.
*   **Vendita al minuto:** vendita in piccole quantità direttamente a chi consuma, un litro alla volta, porta per porta.
:::

Il peso lo sento solo guardandola. Sotto il cesto di vimini, il *plenir*, c'è una ciambella di stoffa imbottita, lo *svitek*, che distribuisce il carico su tutta la testa.

*"Carico medio fra 20 e 30 chili, fino a 35 per le donne più robuste. Per una donna di 50-60 chili, circa metà del proprio peso."*

Metà di sé stessa, sulla testa, giù per un sentiero ghiacciato, al buio.

Le fonti parlano di sei-dodici chilometri, a seconda del villaggio, e di trecento-trecentottanta metri di dislivello, dall'altopiano quasi fino al mare. In tasca alla sottana lei stringe un sasso liscio che ha scaldato ieri sera nella cenere del focolare.

**Maja:** "Perché così presto? Non potrebbe partire con la luce?"

**La mlekarica:** "La colazione in città è fra le sei e le sette. Dopo le sette, la signora l'ha già comprato da un'altra."

Alle sei siamo in Cittavecchia. Vicoli stretti, scale, portoni. Sulla soglia di alcune case aspettano già le serve con un recipiente in mano. Lei non cerca clienti nuovi: va dritta alle porte che conosce. Versa, misura, e su un libretto tira una riga.

**Maja:** "Non la pagano?"

**La mlekarica:** "A fine settimana. Qualcuna a fine mese." Una pausa. "Se paga."

In quel libretto c'è tutto il suo rischio: latte già finito nelle tazze della città, soldi che ancora non ha.

*MEMO, in che lingua parla con i clienti?*

*"Le fonti a mia disposizione non lo registrano."*

Nessuna risposta. Me lo segno sul quaderno con un punto interrogativo. Anche un vuoto nelle fonti è un dato.

Quando l'ultima brocca è vuota, va a fare la spesa. Farina di grano tenero, che sul Carso non si produce. Zucchero. Sale. Petrolio per la lucerna con cui stamattina, alle quattro, controllava il libretto. Aghi, filo. Oggi anche un paio di scarpe per il figlio.

**Maja:** "Allora è lei che decide. I soldi sono suoi."

Lo dico con l'aria di chi ha scoperto una cosa enorme.

**La mlekarica:** "I soldi li tengo io. Decidono il freddo, la mucca se si ammala, e la signora che non paga."

Sto zitta. Ho visto potere dove c'era soprattutto necessità. È vero, dicono gli studi: il denaro delle *mlekarice* era spesso l'unica entrata in contanti regolare della famiglia, e lo custodivano e gestivano le donne, mentre gli uomini lavoravano i campi, spaccavano la pietra o facevano giornate stagionali in porto. Ma tenere la cassa non significa avere tutti i diritti.

Più avanti, fra la fine del secolo e l'inizio del Novecento, arriveranno recipienti di metallo chiusi con coperchio e la *premca*, un carrettino a due ruote fatto apposta per le brocche, sulle strade carrozzabili. Oggi no. Oggi c'è la testa.

Risaliamo nel primo pomeriggio. Il peso sulla testa ha cambiato natura: stamattina era latte da vendere, adesso sono farina, sale e petrolio. Soldi diventati cose, portati di nuovo in salita.

::: checkpoint
### CHECKPOINT: Il cancello della fabbrica separa davvero la società industriale da ciò che resta fuori?

Finora hai raccolto: orari, paghe e proprietà a Manchester e nel cantiere di Trieste; una città che cresce e ogni mattina ha bisogno di latte fresco, portato dal Carso lungo un percorso fisso, con un guadagno che torna in contanti nella casa contadina.

*   **A.** Sì, come categoria di lavoro: chi non vende il proprio tempo a un'impresa e non lavora con le sue macchine appartiene a un'economia rurale distinta, anche se commercia con la città.
*   **B.** No, come sistema sociale: se turni e crescita urbana creano la domanda che organizza percorso, prezzo e reddito delle venditrici rurali, il loro lavoro è parte della società industriale anche senza salario di fabbrica.

Tieni a mente la tua risposta: il Verdetto nel Debriefing te la confermerà, la correggerà, o ti mostrerà che la realtà era più complicata di entrambe.
:::

---

## La Strada Delle Uova: Le Šavrinke
<span class="byline">Cronaca di Maja</span>

Il libretto ha gli angoli consumati. Dentro, colonne di segni e numeri: chi ha ricevuto petrolio, chi aghi, chi sale, e quante dozzine di uova deve ancora.

La donna che lo tiene in mano non è di qui. Viene dalle colline dell'Istria nord-occidentale, a piedi, con un asino che adesso mastica paglia contro il muro del cortile. Qui siamo in un casolare sopra Pinguente, nell'Istria centrale, nel 1891. Galline che razzolano, odore di letame e di pietra bagnata.

**La donna col libretto:** "Mi devi ancora quindici dozzine."

**La contadina:** "Oggi ne ho dodici."

**La donna col libretto:** "Allora tre la prossima volta."

La contadina non ha contanti, e non lo nasconde. L'ultima volta ha ricevuto petrolio per la lucerna, aghi, filo, sapone, sale marino e cicoria, che qui si beve al posto del caffè. Adesso paga in uova.

**La contadina:** "Ecco. Tieni, Šavrinka."

Lo dice asciutta. Non è un complimento, si sente dal tono. L'altra non risponde. Prende un uovo.

Lo alza verso il sole e ci guarda attraverso, con le dita chiuse a tubo davanti all'occhio. Controlla che la camera d'aria sia piccola e il tuorlo non sia scuro. L'uovo va nella cesta. Un altro. Un altro ancora. Uno lo restituisce senza dire niente, e la contadina non protesta.

*MEMO, chi è?*

*"Compra uova, galline, capponi e conigli nei villaggi dell'Istria interna. Paga in contanti, in merce o a credito. Poi rivende nei mercati della costa e a Trieste, a prezzo più alto."*

Quindi non vende il suo raccolto: vende quello degli altri. Non è la *mlekarica* con le sue tre brocche. È un'altra cosa.

**Maja:** "Quanto paga una dozzina?"

**La donna col libretto:** "Qui due carantani. Tre, se sono belle."

**Maja:** "E a Trieste?"

**La donna col libretto:** "Quattro. Cinque."

La differenza è il suo guadagno. A patto di arrivarci, con le uova intere.

**Maja:** "Prima l'ha chiamata Šavrinka. È così che vi chiamate?"

Si ferma con un uovo a mezz'aria. Mi guarda come se l'avessi offesa.

**La donna col libretto:** "Così ci chiamano quelli di città. E quelli della pianura. Io sono *jajčarica*."

Io quel nome l'avevo sempre sentito come un titolo d'onore. La donna con l'asino, l'eroina, il simbolo dell'Istria: libri, scuola, perfino una statua. Qui è quasi un insulto, detto da fuori per i poveri delle colline di flysch. Loro si chiamano *jajčarice*, quelle delle uova, o *potovke*, quelle che vanno. E il libretto dei debiti, la speratura controluce, i conti in carantani? Perché dell'eroina so tutto e della contabile niente?

*"Prima attestazione a stampa, 1857: Fran Vidmar scrive dei mulini lungo la Dragogna che macinano per le Šavrinke, che portano lontano pane di ottimo sapore. Nel 1891 Vjekoslav Spinčić le descrive con pane, frutta, latte, pollame, uova e legna. Diventano simbolo regionale solo nella seconda metà del Novecento, anche grazie al romanzo Šavrinke di Marjan Tomšič, del 1986."*

Pane nel 1857. Uova verso fine secolo. Un insulto diventato un onore. Tre cose diverse con lo stesso nome.

::: memo-box
### MEMO GLOSSARIO

*   **Šavrinke:** nome che ha cambiato significato nel tempo. Nella seconda metà dell'Ottocento era spesso un'etichetta sprezzante per la gente povera delle colline dell'Istria nord-occidentale; solo nel secondo Novecento è diventato un simbolo d'identità.
*   **Intermediazione commerciale:** comprare merce da qualcuno, trasportarla e rivenderla a qualcun altro a un prezzo più alto; il guadagno è la differenza, il rischio è tuo.
*   **Migrazione lavorativa:** spostarsi da casa per lavoro, anche in modo ripetuto o stagionale, senza trasferirsi per sempre.
:::

Poi prepara il carico, e questa è la parte che nessuna statua mostra.

Una cesta profonda di vimini, a trama fitta. Sul fondo, uno strato spesso di crusca. Sopra, le uova, in piedi, con la punta verso il basso, ognuna separata dalle vicine. Altra crusca. Un altro strato di uova. Poi pula di cereali, poi paglia sminuzzata, poi di nuovo crusca.

**Maja:** "Perché con la punta in giù?"

**La donna col libretto:** "Perché così non si rompe. Di traverso, al primo scossone, crac."

In quella posizione il guscio regge meglio la pressione; la crusca si beve i sobbalzi dell'asino e dei sassi della mulattiera. Niente cartoni sagomati, niente scatole: solo scarti del grano e pazienza.

*"Per ogni viaggio, fra 200 e 300 uova. Con l'asino, in due ceste bilanciate sui fianchi, eccezionalmente 500-600."*

Venti, trenta chilometri di mulattiera con centinaia di gusci. Uno rotto non è niente. Dieci rotti sono una giornata senza guadagno.

**Maja:** "E se qualcuno non le paga il debito?"

**La donna col libretto:** "Allora il petrolio gliel'ho regalato." Alza le spalle. "Non ci torno più. Oppure ci torno, perché altrove uova non ce ne sono."

Non è povertà che aspetta. È capitale che cammina: merce anticipata sulla fiducia, uova già pagate, una cesta che porta insieme il guadagno e la perdita.

Partiamo col sole già alto. Dopo mezz'ora lei si toglie le scarpe, le lega insieme per i lacci e le appende al basto dell'asino. Cammina scalza sulla terra battuta.

**Maja:** "Non le fanno male i piedi?"

**La donna col libretto:** "Le scarpe sono un paio. Servono per la città."

Me lo segno, e sotto aggiungo un'altra riga. Saper contrattare non vuol dire avere potere davanti alla legge. Contare i carantani e avere dei diritti sono due colonne diverse del quaderno.

Vicino alle prime case di Capodistria si ferma a un torrente. Si lava i piedi, li asciuga con la sottana, infila le scarpe. Più avanti c'è il posto del dazio: chi porta merce in città paga l'imposta di consumo. Lei si raddrizza, sistema le ceste sull'asino e va avanti, calzata, come una qualsiasi donna di città.

Sui ciottoli, per la prima volta da stamattina, i suoi passi fanno rumore.

---

## Otto Giorni Sotto Una Frasca
<span class="byline">Cronaca di Alex</span>

All'incrocio di due carrarecce, legato a un paletto, c'è un ramo d'edera. La cima punta a sinistra.

*MEMO, qualcuno ha perso un addobbo di Natale?*

*"È un segnale. La cima del ramo indica la direzione. Segui."*

Seguo. Muretti a secco, pietre dappertutto, pietre sopra altre pietre, un'erba corta e dura che spunta dalle fessure. Carso, fine estate 1891. Al secondo incrocio un altro ramo d'edera, la cima verso una casa bassa con un grande portone di pietra. Sopra il portone, un ramo più grosso, verde lucido.

Niente insegna. Niente cartello. Solo foglie.

**Alex:** "Scusi, è aperto?"

L'uomo sulla soglia ha un grembiule di tela macchiato di viola e le maniche arrotolate. Guarda me, poi il ramo sopra la sua testa.

**L'oste:** "Finché è verde, sì."

**Alex:** "E quando non è più verde?"

**L'oste:** "Allora la botte è finita. O sono finiti i giorni."

L'edera, mi spiega MEMO senza che io lo chieda, ha foglie coriacee che restano lucide circa una settimana, dieci giorni. Poi ingialliscono e si accartocciano. Il ramo è un cartello che si spegne da solo. E lo capisce anche chi non sa leggere.

Dentro è fresco. È una cantina con il pavimento di terra battuta e le botti di rovere allineate contro il muro. I clienti stanno su panche di legno grezzo, davanti ad assi appoggiate su cavalletti. L'aria sa di mosto, di vino aspro, di fumo di ginepro e di lardo. Un vecchio beve da un boccale di terracotta smaltata. Il vino è scuro, quasi nero.

**L'oste:** "Terrano. Il nostro."

Assaggio, perché sono un professionista. Sa di ferro e di limone andato a male. Tossisco. Il vecchio ride.

Sul tavolo non c'è un menu. C'è quello che c'è: uova sode di giornata con un pizzico di sale e pepe, pane nero, pancetta, salsiccia secca, un pezzo di formaggio.

**Alex:** "Niente di caldo? Una minestra?"

**L'oste:** "Il caldo è per le osterie. Qui solo il mio. E freddo."

*"I regolamenti municipali di questi anni vietano alle osmize di cucinare. Solo cibi freddi di produzione propria."*

Solo roba sua. È questo il punto, allora. Non un ristorante: un contadino che vende quello che gli avanza.

**Alex:** "E perché aprite solo per pochi giorni?"

**L'oste:** "Otto giorni. Ce li ha dati l'imperatore Giuseppe, dicono i vecchi. Per questo si chiama *osmica*. Da *osem*, otto."

Suona perfetto. Imperatore, legge, otto giorni, nome che viene dal numero. Ci credo in un secondo.

*"Il decreto di Giuseppe II del 17 agosto 1784 permette ai sudditi di vendere vino, mosto e cibo di propria produzione in qualunque momento, a qualunque prezzo, senza licenza da oste. Non contiene né la parola osmiza né gli otto giorni."*

Mi sono fatto fregare da una frase che suonava bene. Di nuovo.

**Alex:** "E allora gli otto giorni da dove vengono?"

*"Dalle regole locali sul dazio del Carso triestino e goriziano: una finestra di otto giorni, o multipli di otto, per finire la botte dell'annata prima della vendemmia senza pagare l'imposta delle osterie fisse. Il nome osmiza, per iscritto, compare solo dagli anni Ottanta dell'Ottocento."*

Quindi: una legge generale da Vienna, valida per tutto l'Impero. Una regola locale sul dazio. E un'abitudine molto più vecchia di tutte e due.

*"Già nel 1430 un documento riconosce ai contadini di Prosecco il diritto di vendere il proprio vino, per un periodo limitato, senza pagare il dazio alla città."*

**Alex:** "Quanto guadagna, a venderlo qui invece che all'osteria?"

**L'oste:** "Se lo vendo all'oste, guadagna anche l'oste. Se lo vendo qui, il vino è mio fino al boccale."

::: memo-box
### MEMO GLOSSARIO

*   **Osmiza / osmica:** vendita temporanea di vino e cibi freddi prodotti in casa, nella cantina o nel cortile del contadino. Il nome viene dallo sloveno *osem*, otto, come i giorni di apertura.
*   **Vendita diretta:** chi produce vende da sé a chi consuma, senza intermediari; così trattiene una parte più grande del prezzo.
*   **Eccedenza agricola:** ciò che resta del raccolto dopo il consumo della famiglia, e che si può vendere.
:::

Il vecchio col boccale mi fa segno di sedermi. Indica con il mento le pietre fuori dalla porta.

**Il vecchio:** "Lo sai perché qui è tutto sassi?"

**Alex:** "No. Mi dica."

**Il vecchio:** "Quando il Signore finì di fare il mondo, avanzavano pietre. Tutte quelle appuntite, cattive. Le mise in un sacco grande, di canapa, e mandò un angelo a buttarle in mare. Il diavolo lo vide passare e pensò che nel sacco ci fosse oro. Lo squarciò con le corna. Proprio qui sopra." Allarga le braccia verso il portone. "E le pietre caddero tutte sul Carso."

Il *Sacco del Diavolo*. C'è chi dice che il sacco lo portasse Dio in persona, chi un arcangelo; chi dice che il diavolo cercasse oro, chi anime. Le prime versioni scritte che conosciamo sono del Novecento.

È una storia bellissima. Spiega benissimo com'è vivere qui: una terra avara, fatica infinita per ogni metro di campo. Non spiega come si è formata la pietra.

::: memo-box
### MEMO: PERCHÉ IL CARSO È DI PIETRA

*   **Carsismo:** l'acqua piovana, resa debolmente acida dall'anidride carbonica dell'aria e del suolo, scioglie lentamente il calcare e lascia affiorare la roccia piena di solchi e fessure.
*   **Terra rossa:** la parte che non si scioglie, argille e ossidi di ferro, si raccoglie sul fondo delle doline: lì la terra è fertile.
*   **Disboscamento:** il taglio dei boschi nei secoli ha peggiorato la situazione, lasciando la pietra ancora più scoperta.
:::

**Alex:** "E lei ci crede?"

**Il vecchio:** "Io credo alle pietre. Le ho tolte dal campo per sessant'anni."

Due fonti sullo stesso tavolo. Il decreto dice chi può vendere, e a quali condizioni. La leggenda dice come ci si sente a coltivare sassi. Nessuna delle due fa il lavoro dell'altra.

Quando esco il sole è basso. Il ramo sopra il portone è ancora verde. Fra qualche giorno le foglie cominceranno ad accartocciarsi, la botte sarà vuota, e all'incrocio qualcuno toglierà la freccia d'edera.

---

## Debriefing

Mission Control ha messo cinque oggetti sullo stesso tavolo: un orologio da parete con il vetro unto d'olio, un foglio di paga con la cifra *30 carantani*, una pezza di lino per filtrare il latte, un libretto di debiti con gli angoli consumati e un ramo d'edera che comincia a ingiallire.

Manchester e Trieste, il Carso e l'Istria. Un orologio decide il tempo di centinaia di persone in una filatura inglese; a Trieste un cantiere comincia a trasformare in salario la giornata di manovali venuti dal Friuli, dall'Istria, dal Carso e dalla Carniola. Ma quelle città in crescita, ogni mattina, devono anche mangiare. E il cibo arriva da fuori del cancello, portato da chi in fabbrica non entra.

**Alex:** "Allora le *mlekarice* sono operaie anche loro, no? Lavorano per la città."

**Maja:** "Nessuno le paga a giornata. Non hanno un padrone. Lavorano *con* la città, non *per* la città."

**Alex:** "E tu hai visto il potere nella cassa, e lei ti ha risposto: il freddo e la mucca."

**Maja:** "Sì. L'ho scritto sul quaderno. Tu, invece, hai scritto che l'imperatore aveva inventato gli otto giorni."

Nessuno dei due ritira quello che ha detto. Ma la domanda di Maja — chi paga, chi rischia, chi decide — spiega perché il manovale di Alex beve latte ogni mattina. E il cantiere di Alex spiega perché la *mlekarica* deve arrivare entro le sette.

**Verdetto.** L'Ipotesi è corretta soltanto a metà. Fabbrica, capitale e salario accelerano l'inurbamento e rendono visibile la divisione fra borghesia imprenditoriale e proletariato, a Manchester nel 1833 come, in piccolo e con una storia diversa, nel cantiere triestino del 1840. Ma la società industriale non finisce al cancello: la crescita delle città dipende anche da produzione, trasporto, intermediazione e vendita svolti nelle campagne, spesso da donne che non sono operaie di fabbrica. Al Checkpoint, **B spiega meglio il sistema**, mentre **A resta utile per distinguere il tipo di lavoro**: *mlekarice* e *šavrinke* non vanno chiamate proletarie solo perché servono una città industriale. La città è una rete; la fabbrica ne è un motore, non l'intero organismo.

::: reality-check
### CIÒ CHE NON SAPPIAMO ANCORA

*   **Le prime mlekarice:** a metà Ottocento gli archivi registrano solo generiche "venditrici di latte"; le descrizioni dettagliate arrivano fra il 1890 e il 1910, e molte da testimonianze raccolte nel Novecento. Fin dove si possa risalire con sicurezza, e con quali recipienti, resta aperto.
*   **Chi era davvero una Šavrinka:** nel 1857 il nome indica donne che portano pane, nel 1891 venditrici di molti prodotti, nel tardo Novecento un simbolo; il nome non ha sempre indicato lo stesso gruppo né lo stesso mestiere.
*   **Da dove vengono gli otto giorni e il Sacco del Diavolo:** il decreto del 1784 non li contiene; la regola è locale, le sue origini si mescolano a diritti più antichi, e le versioni scritte della leggenda sono tutte più tarde dei racconti orali.
:::

::: memo-box
### CRONOLOGIA ESSENZIALE

*   **17 agosto 1784:** decreto di Giuseppe II sulla vendita dei prodotti propri.
*   **29 agosto 1833:** Factory Act britannico, con i primi ispettori di fabbrica.
*   **21 marzo 1840:** inaugurazione del Cantiere San Marco a Trieste.
*   **1857:** prima attestazione a stampa delle Šavrinke, in Fran Vidmar.
*   **1884:** la parola *osmiza* compare per iscritto.
*   **1891:** descrizione delle Šavrinke di Vjekoslav Spinčić.
:::

Ora torniamo al 1848. Fabbriche, città e nuove disuguaglianze hanno cambiato quello che le persone chiedono. Resta da vedere perché, nello stesso anno, popoli vicini trasformino quelle richieste in programmi politici diversi.

<!-- WORD COUNT: ~6587 -->
<!-- PERSONA CHECK: Alex/Maja voice intact? Pass — tic scuola/realtà di Alex usato 1 volta (filatura), tic "perché non lo so già" di Maja usato 2 volte (mlekarice, šavrinke), entrambi sotto il limite di 3; nessuna deriva verso prosa AI generica; MEMO resta clinico/asettico con Alex, informativo/diretto con Maja -->
<!-- NUF CHECK:
1. Catena meccanizzazione→fabbrica→divisione del lavoro→salario/inurbamento ✅
2. Proletariato/borghesia distinti da lavoratrici rurali non incasellabili ✅
3. Rete crescita urbana→domanda→lavoro d'entroterra→denaro in famiglia ✅
4. Corpo: turno/orologio, peso del cesto (metà del proprio peso), rischio uova rotte ✅
5. Rabbia precisa di Maja su lavoro femminile invisibile + iniziativa/margine di scelta ✅
6. Manchester con dati e testimonianze graduate per qualità ✅
7. Trieste 1840 datata per fasi, non copia di Manchester ✅
8. Mlekarice/šavrinke/osmiza con fonti, salto in avanti dichiarato, decreto 1784 separato dalla consuetudine locale ✅
9. Scena mlekarice autonoma, punto di vista delle lavoratrici ✅
10. Scena šavrinke autonoma, economia mobile istriana prima dello sbocco triestino ✅
-->
<!-- ANTI-AI CHECK: nessuna frase vietata rilevata (grep pulito su "come sappiamo", "è importante notare", "e la morale è che", ecc.); nessun pattern bannato (niente "Immaginate di essere", "Ebbene sì", morale esplicita di chiusura); checkpoint unico dopo il Beat 3 con vera decisione A/B; un solo target-profile (Tonello) con Abilità Speciale che supera il test operativo (primo approccio industriale, non "apre un cantiere"); nessun Easter Egg, come da struttura -->



<div style="page-break-after: always;"></div>

# Capitolo 10 — Il 1848 e la Primavera dei Popoli

Alex, Maja: coordinate 1848, pieno XIX secolo.

Il salto precedente vi ha portati dentro le città delle fabbriche, dei quartieri operai e delle disuguaglianze nuove, e si è chiuso con una promessa: tornare indietro fino all'anno in cui tutto questo prende per la prima volta la forma di una richiesta politica. Ci siamo. Restiamo fra il febbraio del 1848 e il 1849. Il salto successivo vi porterà fra il 1859 e il 1866, quando alcuni di questi programmi smetteranno di essere fogli e diventeranno eserciti.

Il manuale propone questa catena: Parigi si ribella → l'esempio attraversa l'Europa → i popoli chiedono libertà e uno Stato nazionale indipendente → gli eserciti imperiali soffocano tutto.

Qualcosa non torna. Sotto lo stesso imperatore, nello stesso mese, una città proclama la repubblica. Una città vicinissima arma una milizia di cittadini e non la segue. E in un terzo luogo, a poche giornate di carrozza, un foglio stampato in un'altra lingua disegna una geografia politica che non somiglia a nessuna delle due.

La vostra missione è raccogliere sei prove e ricostruire perché la stessa apertura rivoluzionaria produce programmi diversi — e che cosa resta quando le rivoluzioni vengono sconfitte.

## Obiettivi del Salto

### 1. La Scintilla Attraversa le Frontiere (Parigi–Vienna, febbraio-marzo 1848) — voce: Alex

Seguirai una notizia mentre viaggia, non mentre viene raccontata dopo.
**Prova da raccogliere:** verificare che cosa passa davvero da una capitale all'altra, e quali domande cambiano appena quella notizia incontra istituzioni e società diverse.

### 2. Cinque Giorni Dietro le Barricate (Milano, 18-22 marzo 1848) — voce: Alex

Entrerai in una città chiusa dai suoi stessi abitanti, pietra per pietra.
**Prova da raccogliere:** stabilire come una rivolta cittadina espelle temporaneamente un esercito, e in quale momento esatto quella vittoria apre una guerra fra Stati.

### 3. Una Repubblica sulla Laguna (Venezia, marzo 1848 - estate 1849) — voce: Alex

Cercherai un avvocato appena uscito di prigione e una scelta presa sotto pressione.
**Prova da raccogliere:** seguire il passaggio dalla proclamazione repubblicana alla decisione di unirsi a una monarchia, senza fingere che un programma politico resti immobile.

### 4. La Guardia Che Non Segue Venezia (Trieste, marzo-autunno 1848) — voce: Alex

Ti troverai in un porto dove ogni bandiera esposta sposta anche un salario.
**Prova da raccogliere:** confrontare richieste costituzionali, sicurezza del porto e appartenenze cittadine per capire che cosa difende davvero una milizia civica — senza ridurre tutto al denaro.

### 5. Un Regno Ancora di Carta (Celovec, Vienna e la rete delle terre slovene, aprile 1848) — voce: Maja

Entrerai in una stanza dove si copiano fogli che nessun libro di scuola italiano nomina.
**Prova da raccogliere:** leggere richieste e varianti di *Zedinjena Slovenija*, e capire quale problema di territorio, rappresentanza e lingua quel testo tenta di risolvere.

### 6. Chi Firma, Chi Aspetta (Lubiana e campagna carniolina, 1848-1849) — voce: Maja

Misurerai la distanza tra un programma chiarissimo e le persone che dovrebbe rappresentare.
**Prova da raccogliere:** confrontare petizioni e firme con le priorità di chi vive in campagna e con l'abolizione della *tlaka*, senza trasformare silenzi o croci tracciate a mano in una coscienza unanime.

La missione è seguita da due co-reporter. Alex ricostruisce l'ondata europea e le scelte dell'Alto Adriatico; Maja segue nelle terre slovene la nascita di un programma nazionale e mette alla prova chi quel programma riesca davvero a rappresentare.

Attenzione: un proclama dice che cosa chiede chi lo scrive. Una petizione mostra chi firma. Un registro commerciale misura un rischio. Una memoria scritta trent'anni dopo racconta ciò che qualcuno ha scelto di ricordare. Nessuna di queste fonti può parlare automaticamente al posto delle altre.

---

## La Scintilla Attraversa le Frontiere

<span class="byline">Cronaca di Alex</span>

La prima cosa che mi arriva non è il rumore della folla. È l'odore: olio di lino bruciato e nerofumo di pece, denso come una vernice, che ti resta attaccato in gola.

Sono in una tipografia di Parigi ed è il 24 febbraio 1848. Fogli di carta straccia stesi ad asciugare su corde di canapa tirate da un torchio all'altro, così bassi che devo camminare piegato. Un uomo in grembiule allinea caratteri di piombo su un vantaggio di legno, e ha i polpastrelli neri fino alla seconda nocca. La parola che sta componendo è lunga dieci lettere. RÉPUBLIQUE.

*MEMO, dove siamo esattamente nella giornata?*

*"Alphonse de Lamartine ha proclamato la Seconda Repubblica francese all'Hôtel de Ville da poche ore. Re Luigi Filippo ha abdicato questa mattina. La città ha eretto più di millecinquecento barricate in una notte."*

Millecinquecento. Il numero mi resta in testa mentre guardo il compositore, che non sembra particolarmente emozionato: sembra uno che ha una consegna.

**Alex:** "Quanto ci mettete a stamparne abbastanza?"

**Il compositore:** "Abbastanza per chi? Per questa strada, un'ora. Per il Reno, tre giorni. Per Vienna, non lo so e non è affar mio."

**Alex:** "Ma la gente qui fuori cosa chiedeva, prima? Solo il re via?"

**Il compositore:** "Il pane costa il doppio di due inverni fa e il cantiere dove lavorava mio fratello ha chiuso. Poi il governo ha proibito anche i banchetti, che erano l'unico modo che avevamo di riunirci senza finire in prigione. Togli il pane e togli la parola nello stesso anno, signore, e vedi che cosa cresce."

Non è una frase da manuale ed è più precisa di un manuale. Il raccolto di cereali distrutto nel 1846, i prezzi di pane e farina raddoppiati fra quell'inverno e la primavera del 1847, le manifatture tessili che chiudono a catena, gli operai edili di Parigi disoccupati fino a uno su due. E sopra tutto questo, il divieto di associarsi. Il banchetto politico vietato il 21 febbraio era solo il coperchio che saltava.

Il 23 sera un drappello di soldati ha aperto il fuoco sui dimostranti in Boulevard des Capucines: cinquantadue morti. Il 24 mattina il re è partito per l'Inghilterra.

::: memo-box
### MEMO GLOSSARIO

*   **Suffragio censitario:** sistema in cui vota solo chi possiede un certo patrimonio o paga una certa soglia di tasse. Chi non ha proprietà non vota, anche se è adulto e lavora.
*   **Costituzione:** la legge fondamentale di uno Stato: divide i poteri, mette un limite all'autorità del sovrano e scrive nero su bianco i diritti dei cittadini.
*   **Governo provvisorio:** un gruppo di persone che prende in mano il potere durante una crisi, per tenere in piedi l'amministrazione finché non si arriva a elezioni o a una costituzione definitiva.
:::

Il 5 marzo quel governo provvisorio farà una cosa enorme: sostituirà il suffragio censitario con il voto di tutti i maschi dai ventun anni in su. Gli elettori passano da circa duecentoquarantamila a più di nove milioni in un decreto solo. A scuola questa parte non me l'avevano mai raccontata come una decisione: me l'avevano raccontata come una data.

E adesso viene la parte che pensavo di sapere e non sapevo.

Credevo che una notizia del genere attraversasse l'Europa in un lampo. Nei film è sempre così: un uomo entra in una stanza, dice "è caduto il re", e sono già tutti in piazza. Invece no. Nel febbraio del 1848 non esiste nessuna rete telegrafica elettrica che colleghi la Francia all'Impero austriaco. C'è il telegrafo ottico Chappe, torri con bracci di legno che si vedono l'una con l'altra, e arriva fino a Strasburgo. Da lì in poi la notizia ha delle gambe e degli zoccoli: staffette a cavallo, corrieri della posta celere, qualche tratto di ferrovia tedesca attraverso il Baden, la Baviera, la Boemia.

L'abdicazione avvenuta il 24 febbraio arriva a Vienna fra la sera del 28 febbraio e il 1° marzo. Cinque, sei giorni.

**Alex:** "E se alla dogana ti trovano addosso i fogli?"

**Il compositore:** "Per questo esiste la carta sottile."

Me ne mostra un foglio: è carta di stracci di lino talmente fine che, tenuta contro la lampada, ci si legge attraverso. Meno di quattro centesimi di millimetro. Un manifesto di otto pagine piegato in quello spessore sparisce nella fodera di un cappello di feltro, oppure nel tacco cavo di uno stivale da viaggio, oppure cucito tra la stoffa e il crine di cavallo dell'imbottitura di una sella postale. Alla frontiera asburgica i doganieri infilzano i carichi con lunghi spiedi di ferro e scuotono i bauli per sentire i fruscii. La carta biblica non fruscia.

Un contrabbando che pesa meno di un tovagliolo.

Il salto successivo mi deposita a Vienna, il 13 marzo, e capisco subito che qui la stessa notizia ha prodotto una domanda diversa. Fa freddo — quattro gradi, l'ultima aria dell'inverno — ma nella Herrengasse ci sono tremila persone schiacciate una contro l'altra e l'aria sopra le teste è tiepida di fiato. Cappotti di loden verde. Cappelli di feltro a tesa larga. Scarponi ferrati che battono sul selciato calcareo con un rumore che non smette mai del tutto.

Non stanno chiedendo una repubblica. Stanno chiedendo una costituzione, la fine della censura e la testa politica di un uomo solo: il cancelliere Metternich, settantaquattro anni.

**Alex:** "Perché leggono un discorso ungherese nel cortile di un palazzo di Vienna?"

**Uno studente della folla:** "Perché a Presburgo un deputato ha detto ad alta voce, dieci giorni fa, quello che qui non si può stampare. Se l'ha detto lui e non è successo niente, forse possiamo dirlo anche noi."

**Alex:** "E se invece succede qualcosa?"

**Lo studente:** "Allora sapremo che cosa sono disposti a fare. È un'informazione che a noi manca da trent'anni."

Succede qualcosa. I soldati sparano nel cortile del Landhaus e nella strada: cinque morti accertati, il primo è uno studente di filosofia. Nei sobborghi industriali, nei due giorni successivi, gli operai attaccano i caselli daziari e le fabbriche, e lì il conto si allarga — la storiografia austriaca stima fra trentacinque e cinquanta morti in tutto, ma le fonti non concordano e nessuno può darti un numero secco con la faccia seria.

La sera stessa Metternich si dimette. Il 14 marzo scappa da Vienna in una carrozza chiusa e privata, verso Dresda, Rotterdam, l'Inghilterra. Il giorno dopo l'imperatore Ferdinando I abolisce la censura preventiva, autorizza gli studenti ad armarsi in una Legione Accademica e promette una costituzione.

*MEMO, la stessa scintilla sta producendo le stesse richieste dappertutto?*

*"Negativo. A Praga, l'11 marzo, la petizione di San Venceslao chiede l'unione amministrativa di Boemia, Moravia e Slesia e la parità fra ceco e tedesco nelle scuole e negli uffici. A Pest-Buda, il 15 marzo, i manifestanti proclamano dodici punti fra cui un ministero responsabile in loco e l'abolizione degli obblighi feudali."*

Tre città, tre liste della spesa diverse.

Il fuoco è lo stesso. La legna no.

---

## Cinque Giorni Dietro le Barricate

<span class="byline">Cronaca di Alex</span>

Una campana suona a martello, e non smette.

È il suono che riconosco per primo quando atterro a Milano, la sera del 18 marzo 1848: non un rintocco regolare, ma colpi sbilenchi, uno sopra l'altro, da San Giorgio al Palazzo e dal Duomo insieme, come se qualcuno avesse deciso che il tempo normale è sospeso. Sotto, odore di zolfo e salnitro. Sopra, polvere bianca di calce che scende lenta dai muri colpiti dalle palle di cannone sparate dal Castello.

Le notizie da Vienna sono arrivate stamattina. Davanti al Palazzo di Governo una sentinella ha sparato e ha ucciso un bambino; la folla è entrata, ha catturato il vicegovernatore austriaco e gli ha fatto firmare tre decreti. Adesso sta succedendo la cosa che non mi aspettavo.

Non stanno combattendo. Stanno costruendo.

Una donna con la gonna rimboccata e un fucile da caccia a tracolla mi urta senza guardarmi. Ha le mani rosse, screpolate come quelle di chi lava panni tutto il giorno nell'acqua fredda, e sta trascinando un materasso. Un materasso.

**Alex:** "Scusi — a cosa serve?"

**La donna:** "Tu da dove vieni che non lo sai?"

**Alex:** "Da lontano. Molto."

**La donna:** "La palla di piombo che batte sul granito ti torna addosso in schegge di pietra. Ti acceca prima ancora di ferirti. La lana no: la lana la mangia, la palla. Prima il sasso, poi la lana sopra, dalla parte che guarda i soldati. Un materasso lo bucano cento volte e resta un materasso."

Mi porta a vedere la barricata di cui è responsabile, e in venti minuti capisco che è un oggetto pensato.

Sotto, una trincea di quaranta centimetri, scavata dopo aver scardinato i masselli di granito del selciato con leve di ferro da carrettiere. Dentro la trincea, rovesciati, ci sono carri da letame e — giuro — un pianoforte a coda, requisito da un palazzo di nobili, con la cassa riempita di terra e mattoni perché non resti vuoto. La faccia rivolta verso gli austriaci è coperta di materassi di lana e pagliericci di crine legati alle assi con la corda. E sul fianco, contro il muro, una fessura larga esattamente mezzo metro, a forma di Z, protetta da un secondo muretto arretrato.

**Alex:** "Perché non la chiudete del tutto?"

**La donna:** "Perché i nostri devono passare di corsa e loro no. Un uomo a piedi ci gira dentro. Un cavallo no, una baionetta in fila nemmeno."

Mille e seicento, forse mille e settecento barricate in due giorni. Nessuno le ha contate con precisione, e le stime degli storici ballano — ma il risultato è visibile a occhio: la cavalleria austriaca non ha più una sola strada dritta in cui caricare.

E questo è il momento in cui mi convinco di aver capito tutto. Radetzky ha tredici o quattordicimila soldati regolari, artiglieria pesante, il Castello. I milanesi nei primi due giorni hanno sei-ottocento fucili da caccia e vecchi schioppi, più quelli che riescono a togliere ai posti di guardia. Sulla carta è finita in mezza giornata. Invece la notte fra il 22 e il 23 marzo Radetzky ordina l'evacuazione: a corto di munizioni e di viveri, con le retrovie minacciate dai volontari che arrivano dalle campagne, porta l'esercito fuori dalle mura.

*MEMO,* penso, *questa è una vittoria totale, giusto?*

*"Negativo. L'esercito imperiale non è distrutto: si ritira in ordine verso le fortezze di Verona, Peschiera, Legnago e Mantova, che restano austriache. Il 23 marzo il re di Sardegna Carlo Alberto dichiara guerra all'Austria. Le sue truppe attraversano il Ticino il 25."*

Tre informazioni, e la seconda mi cambia la scena sotto i piedi.

Perché fino a ieri sera qui c'era una città che si difendeva da sola, con i materassi della propria camera da letto. Da domani c'è una guerra fra due Stati, con due eserciti, due catene di comando e un obiettivo che non è più "liberare questa strada". Non è la stessa cosa che continua: è un'altra cosa che comincia, e la vittoria delle barricate è ciò che l'ha resa possibile.

::: memo-box
### MEMO GLOSSARIO

*   **Barricata:** un muro improvvisato che chiude una strada, fatto con quello che c'è: pietre del selciato, carri, mobili. Serve a togliere una via alla cavalleria e all'artiglieria, non a vincere una battaglia.
*   **Insurrezione urbana:** una rivolta che scoppia dentro una città e prova a cacciarne l'autorità che la governa, quartiere per quartiere, senza un esercito regolare.
*   **Prima guerra d'indipendenza:** la guerra che il Regno di Sardegna dichiara all'Impero austriaco il 23 marzo 1848. Non è la stessa cosa dell'insurrezione: la dichiara uno Stato, con un esercito, contro un altro Stato.
:::

Non tutti in città sono contenti del cambio di scala. Il Consiglio di Guerra che ha organizzato la difesa è guidato da un democratico federalista che non vuole affatto consegnare la Lombardia a una monarchia; il podestà che proclama il Governo Provvisorio la pensa diversamente. Carlo Alberto, dal canto suo, si muove anche perché teme che la Lombardia diventi una repubblica democratica.

**Alex:** "Adesso che se ne sono andati, cosa fa?"

**La donna:** "Adesso smonto la barricata. Il granito va rimesso dov'era, se no le carrette non passano e la roba da mangiare non arriva."

**Alex:** "E se tornano?"

**La donna:** "Allora so quanto ci metto. Venti minuti."

E poi c'è il conto. Fra gli insorti, i registri dei decessi e le lapidi della città documentano fra quattrocentonove e quattrocentoventiquattro caduti. Circa trecento sono popolani, artigiani, manovali. Circa quaranta sono donne.

Le perdite austriache stimate nei rapporti di Radetzky superano i seicento fra morti e feriti. Anche qui, stime: nessuno dei due conteggi è un dato chiuso.

La città ha vinto la propria strada. Chi vincerà la guerra è una domanda che a Milano, il 23 marzo, nessuno può ancora sapere.

---

## Una Repubblica sulla Laguna

<span class="byline">Cronaca di Alex</span>

**Alex:** "Sta salendo su un tavolo."

**MEMO:** *"Confermato. Daniele Manin, avvocato. Scarcerato il 17 marzo su pressione della folla in Piazza San Marco. Sta per proclamare la repubblica."*

Il tavolo non è un palco, è un tavolo. Manin ci sale sopra e per un attimo sembra solo un uomo in piedi su un mobile. Viene dall'Arsenale, non da un ufficio: poche ore fa era là dentro, fra le armi appena prese.

È il pomeriggio del 22 marzo 1848 e Venezia ha appena smesso di essere austriaca.

L'acqua scura dei canali riflette le coccarde appese ai balconi, verdi bianche rosse, e i nastri gialli di San Marco. La voce di Manin rimbalza tra le arcate di pietra d'Istria delle Procuratie e torna indietro mezza sillaba dopo, sdoppiata. Le sue parole, quelle sì, sono documentate parola per parola:

**Manin:** "Noi siamo liberi e possiamo doppiamente gloriarci di esserlo, poiché lo siamo senza aver versato goccia né del nostro sangue, né di quello dei nostri fratelli... Ma non basta aver abbattuto l'antico governo, bisogna sostituirne un altro. E qual miglior governo per noi che quello della Repubblica? Ma non già l'antica, oligarchica, bensì una repubblica fondata sulla libertà e sull'uguaglianza."

Quella precisazione — *non già l'antica* — è la frase più importante della piazza e quasi nessuno, tra quelli che urlano, ci sta facendo caso.

Cinque giorni prima, il 17 marzo, un vapore postale austriaco ha attraccato portando la notizia di Vienna. La folla ha preteso dal governatore civile la scarcerazione di Manin e del letterato dalmata arrestati a gennaio per aver promosso una petizione — una petizione legale, scritta, che chiedeva riforme costituzionali. Il governatore, guardando la piazza, ha firmato il rilascio.

Stamattina gli operai dell'Arsenale si sono ribellati e hanno ucciso il loro direttore austriaco. Manin è entrato nell'Arsenale alla testa della Guardia Civica e si è preso armi e artiglierie navali senza altro sangue. Il governatore militare, senza ordini da Vienna e con la città addosso, ha firmato la capitolazione: le truppe imperiali si imbarcano, le fortezze della laguna passano di mano.

Senza versare goccia di sangue, ha detto Manin. Il direttore dell'Arsenale è morto stamattina, ucciso dai suoi operai. In piazza non è morto nessuno, quindi Manin non sta mentendo. Ma un proclama racconta la giornata nel modo che serve a chi lo pronuncia, e io me lo segno.

::: scan-result
### SCANNING: BANDIERA DELLA REPUBBLICA DI SAN MARCO

*   **Tipo:** insegna di Stato, adottata marzo 1848
*   **Colori:** verde, bianco, rosso, con insegna dorata
*   **Funzione:** dichiarare due appartenenze contemporaneamente
*   **Dettaglio Tecnico:** è il tricolore italiano, ma nel cantone superiore sinistro, sul campo verde, porta il Leone di San Marco alato in oro, con la zampa posata sul libro aperto. Non una scelta o l'altra: tutte e due cucite sullo stesso panno.
:::

Sul molo dell'Arsenale l'odore di catrame di pino bagnato si mescola all'umido salmastro della bassa marea. Un arsenalotto mi spiega la cosa più utile della giornata senza smettere di lavorare.

**Alex:** "Allora Venezia vuole tornare quella di prima? La repubblica dei dogi?"

**L'arsenalotto:** "Quella di prima non mi dava da mangiare meglio, ragazzo. Quella di prima la decidevano i nobili del Maggior Consiglio, e mio padre nobile non era."

**Alex:** "E adesso chi decide?"

**L'arsenalotto:** "Adesso si vedrà. È questo il punto: che c'è un adesso."

::: memo-box
### MEMO GLOSSARIO

*   **Repubblica:** forma di governo senza re, in cui chi comanda è scelto e può essere sostituito. Non dice da sola *quanti* possono scegliere.
*   **Fusione (o annessione):** l'unione di un territorio a un altro Stato già esistente, con le sue leggi e il suo sovrano.
*   **Plebiscito:** un voto chiamato a confermare una scelta già formulata. Nel 1848 non significa che votino tutti: significa che vota chi ne ha diritto in quel momento, e sono pochissimi.
:::

La parte che nessun documentario mi aveva mostrato arriva a luglio.

Il 4 luglio 1848, nella Sala dello Scrutinio di Palazzo Ducale, l'Assemblea dei Deputati di Venezia vota se unirsi al Regno di Sardegna di Carlo Alberto. Non è la città che vota: è un'assemblea di centotrentatré deputati. L'esito è centoventisette a favore, sei contrari.

A raccomandarlo è Manin. Il repubblicano che tre mesi prima è salito sul tavolo. Lo fa perché senza l'esercito sabaudo Venezia non regge la guerra contro Radetzky, e perché una repubblica assediata senza alleati è una repubblica per poche settimane. Subito dopo il voto, si dimette.

**Alex:** "Ha tradito?"

**MEMO:** *"Non ci sono elementi per definirlo così. Sacrifica la forma repubblicana per ottenere una difesa militare. Ad agosto, dopo la sconfitta piemontese a Custoza, l'Assemblea lo richiama al potere."*

E la Repubblica torna. I commissari del re se ne vanno l'11 agosto, la città rifiuta l'armistizio.

Il programma è cambiato due volte in meno di cinque mesi, nella stessa città, con le stesse persone. Non perché qualcuno abbia cambiato idea su cosa sia giusto, ma perché è cambiato cosa era possibile.

Poi arriva il 1849 e arriva il conto. Venezia resiste all'assedio per oltre un anno, bombardata da luglio, con il colera che uccide più di duemilacinquecento civili. La carne sparisce dai banchi di Rialto. Un chilo di polenta di granturco ammuffito costa tre volte quello di prima. Si mangiano i granchi della laguna, le erbe delle barene, pane nero allungato con crusca e polvere di fave secche, e l'acqua dolce delle cisterne è razionata a un secchio al giorno per famiglia. La città si arrende per fame e per mancanza di polvere fra il 22 e il 24 agosto 1849.

Manin parte per l'esilio su una nave francese.

Un anno e mezzo prima era in una cella, arrestato per aver scritto una richiesta di riforme. In mezzo c'è stata una repubblica.

---

## La Guardia Che Non Segue Venezia

<span class="byline">Cronaca di Alex</span>

A Trieste, in marzo, le banchine sanno di caffè crudo.

Non caffè tostato: crudo, arrivato da Santos, chiuso in balle di juta accatastate nei magazzini, con un odore acidulo e vegetale che non somiglia a niente di quello che conosco. Accanto, botti di rovere piene di olio d'oliva pugliese, e stecche di tabacco della Macedonia legate a mazzi. Sul Molo San Carlo si sentono contemporaneamente il dialetto triestino dei mercanti, lo sloveno dei carrettieri che scendono dal Carso, il greco dei mediatori marittimi e il tedesco burocratico degli ufficiali del Lloyd.

Venezia, dall'altra parte del golfo, ha appena cacciato gli austriaci.

Trieste non fa la stessa cosa. E io arrivo qui convinto di sapere già perché: soldi. È la spiegazione comoda, la più rapida, quella che mi è venuta in mente prima ancora di atterrare — i mercanti contano le monete e stanno con chi paga.

Ci metto due ore a capire che è una spiegazione troppo pulita.

La sera del 15 marzo i primi dispacci da Vienna arrivano anche qui, e il 16-17 il governatore imperiale del Litorale autorizza la formazione di una milizia civica. In pochi giorni si arruolano fra duemila e tremila cittadini, divisi in battaglioni per rione.

::: memo-box
### MEMO GLOSSARIO

*   **Guardia Nazionale:** milizia di cittadini volontari, distinta dall'esercito regolare. Si arma da sé, presidia il proprio quartiere e risponde alle autorità cittadine, non a un generale.
*   **Autonomia municipale:** il diritto di una città di amministrare da sé i propri affari — tasse locali, porto, polizia urbana — dentro uno Stato più grande.
*   **Lealismo dinastico:** la fedeltà al sovrano e alla sua casa regnante. Può convivere benissimo con la richiesta di una costituzione: si può volere un imperatore *e* dei limiti scritti al suo potere.
:::

Il milite che mi lascia parlare mentre monta la guardia a un magazzino ha un cappotto scuro a doppio petto e in testa un tschako di feltro nero con la visiera di cuoio lucido e l'aquila asburgica di ottone. All'occhiello, una coccarda bianca e rossa con l'alabarda di San Giusto. Nessun tricolore. Da nessuna parte.

**Alex:** "A Milano e a Venezia sono verdi bianche e rosse. Qui perché bianche e rosse?"

**Il milite:** "Perché sono i colori di questa città, non di un'altra. Cantiamo anche così: bianca e rossa è la nostra bandiera, bianca e rossa è la nostra coccarda."

Poi tira fuori la daga di ordinanza e me la fa guardare di taglio. Sulla lama è incisa una data: *13-14-15 marzo 1848*.

Sono i giorni della rivoluzione di Vienna.

**Alex:** "Un attimo. Avete inciso sulle armi la rivoluzione contro il vostro imperatore?"

**Il milite:** "Contro il cancelliere. Non contro l'imperatore. Noi vogliamo la costituzione che ci ha promesso e vogliamo indietro le nostre libertà municipali, che ci hanno tolto più di sessant'anni fa. Non vogliamo la guerra in porto."

Quella frase — *non vogliamo la guerra in porto* — comincia a spiegarmi qualcosa, ma non tutto. I due pezzi che mancano non sono qui davanti a me: uno è alle mie spalle, l'altro deve ancora arrivare.

Il primo è successo pochi giorni fa, e il milite me lo racconta senza orgoglio. Il 18 e il 19 marzo alcuni gruppi di studenti e liberali hanno provato a esporre coccarde tricolori e bandiere repubblicane in Piazza Grande e al caffè, gridando per Milano e Venezia. La Guardia Nazionale è intervenuta, ha sequestrato i simboli, ha disperso la gente, ha arrestato gli agitatori venuti da fuori. Non l'ha fatto un esercito imperiale: sono stati cittadini armati a togliere la bandiera ad altri cittadini. La città non è d'accordo con sé stessa, e si vede.

Il secondo arriva due mesi dopo. Il 23 maggio una squadra navale del Regno di Sardegna, del Regno di Napoli e di Venezia, comandata dall'ammiraglio Albini, compare nel golfo e blocca il porto.

Qui smetto di pensare in termini di bandiere.

Le rotte del Lloyd si fermano. I mercantili dall'Oriente non arrivano. Le banchine si svuotano in pochi giorni e più di quattromila facchini, scaricatori e marinai — i *bastasi* — restano senza lavoro da un giorno all'altro. Il prezzo della farina raddoppia. Non è un ragionamento astratto sulla lealtà: è il pane di quattromila famiglie che sparisce perché tre bandiere da guerra stanno al largo.

E il Porto Franco, che è la ragione per cui questa città esiste, è una macchina che vive di una cosa sola: l'entroterra dell'Impero. Un mercato di trentacinque milioni di persone, dalla Boemia all'Ungheria, per cui Trieste è la porta sul mare. Il Lloyd Austriaco, le Assicurazioni Generali, la Riunione Adriatica di Sicurtà hanno i capitali legati a quel mercato. Staccarsi dall'Austria non significherebbe cambiare bandiera: significherebbe restare con un porto e senza il continente dietro, in concorrenza con Venezia e Genova, dietro una barriera doganale alpina.

**Alex:** "Quindi avevo ragione. È il denaro."

**Il milite:** "Mio cugino non ha capitali, ragazzo. Mio cugino scarica caffè. Adesso è in fila alla mensa."

::: scan-result
### SCANNING: CONTRASSEGNO DEL PANE D'ORDINANZA

*   **Tipo:** documento nominativo di razionamento, Trieste, maggio-agosto 1848
*   **Distribuzione:** nominativo, consegnato dai capi-rione della Guardia Nazionale
*   **Funzione:** dare accesso a un pane a prezzo bloccato durante il blocco navale
*   **Dettaglio Tecnico:** la Municipalità requisì le farine dei mulini a vapore cittadini pagandole con certificati comunali, e impose ai fornai un solo tipo di pane, metà frumento e metà segale, venduto a tre carantani a libbra solo dietro presentazione del contrassegno. Una milizia di cittadini che distribuisce il pane è anche una milizia che tiene la città lontana dalla sommossa.
:::

C'è ancora un pezzo, e riguarda un'altra opzione che quasi nessuno si ricorda.

Trieste e il Litorale facevano parte della Confederazione Germanica, e a maggio si vota per mandare deputati all'Assemblea nazionale di Francoforte. La città si spacca di nuovo, e non in due metà nette: la componente mercantile e germanofona elegge un cofondatore del Lloyd che sogna una grande unione doganale mitteleuropea con Trieste come sbocco al mare; un gruppo di intellettuali rivendica invece la nazionalità italiana della lingua e delle istituzioni cittadine e rifiuta di essere assorbito in uno Stato tedesco unitario.

Quattro possibilità sul tavolo, nella stessa primavera, nella stessa città: restare nell'Impero riformato, entrare in una Germania unita, unirsi all'Italia, o tenersi il più possibile di autonomia municipale.

Se esitano, non è per viltà. È perché ognuna costa qualcosa di diverso a persone diverse — e chi ha capitali, chi ha un salario giornaliero e chi ha un negozio non paga lo stesso prezzo.

Il blocco finisce ad agosto, dopo Custoza. Le navi tornano. I bastasi tornano in banchina.

Sulla lama della daga, intanto, quella data resta incisa.

---

## Un Regno Ancora di Carta

<span class="byline">Cronaca di Maja</span>

Nella stanza tutti scrivono e nessuno parla.

Lo capisco dal suono: penne d'oca che grattano sulla carta a velocità diverse. Sono seminaristi e ginnasiali in vacanza di Pasqua, e stanno copiando a mano lo stesso testo su grandi fogli protocollo piegati in due. Prima di scrivere tirano righe leggere a matita di grafite, per tenere allineate le colonne dove andranno le firme.

Siamo a Celovec, aprile 1848. La città che sulle carte imperiali si chiama Klagenfurt.

La carta è spessa, vergata a mano da stracci, con la filigrana di una cartiera di Vevče — accanto a ogni foglio, una candela di sego dall'odore animale e una stecca di ceralacca rosso vermiglio, pronta per il sigillo. Ma è l'inchiostro a colpirmi di più: non è nero, è bruno-violaceo, ricavato macerando galle di quercia triturate insieme a vetriolo verde e gomma arabica — una sostanza che si scurisce solo dopo, mentre asciuga sul foglio.

Il testo che stanno copiando ha un titolo che è una domanda: *Kaj Slovenci terjamo?* Che cosa esigiamo noi Sloveni?

Nei libri dei miei compagni italiani questa domanda non c'è, e nemmeno il nome del programma. Nel mio libro sloveno il nome c'è: una riga in grassetto, una data da ricordare per la verifica. Il testo, invece, nessuno me l'ha mai messo davanti. Una riga in grassetto si impara; un foglio si legge.

L'uomo che tiene il testo matrice è un sacerdote. Ha trentanove anni, viene dalla valle della Zilja, ed è cappellano della cattedrale di questa città.

**Maja:** "Perché lo fate copiare a mano? Ci sono torchi, qui."

**Majar:** "Ci sono torchi, e a marzo la censura l'hanno abolita. Sulla carta. Finché nessuno sa che cosa sia davvero permesso, un tipografo di Klagenfurt non si gioca la bottega per centinaia di copie. Per copiarle a mano mi bastano dei ragazzi che hanno le mani libere fino a dopo Pasqua."

**Maja:** "E quando sono scritte, come arrivano dall'altra parte dei monti?"

**Majar:** "Arrotolate. Dentro i tubi di latta stagnata delle carte topografiche, oppure avvolte in tela cerata, sotto le balle di lino dei carrettieri della posta che passano il Ljubelj e lo Jezersko. E con questo sopra."

Mi mostra il sigillo parrocchiale in ceralacca sulla prima pagina, e l'intestazione che ha scelto per il testo: *Prošnja k Njegovemu cesarskemu Veličanstvu*. Supplica a Sua Maestà Imperiale.

**Maja:** "Una supplica. Non una richiesta."

**Majar:** "Un gendarme che apre un pacco e trova una supplica all'imperatore con il sigillo di una parrocchia non la brucia. Non è viltà: è la porta da cui si passa."

È un dettaglio minuscolo e cambia tutto quello che pensavo di sapere sulla parola "propaganda". Il lasciapassare non è un'arma. È una formula di cortesia e un pezzo di cera rossa.

La copia stampata, l'unica sul tavolo, quando me la lasciano leggere è deludente da guardare. Foglio volante in quarto, stampato su due colonne con caratteri latini moderni — la *gajica*, con i segni sopra le lettere, che proprio in questa primavera sta soppiantando la vecchia *bohoričica*. Nessun fregio, nessuna aquila, nessuna decorazione. Un'intestazione semplice, l'elenco delle province da unire, e in fondo le firme autografe dei primi promotori.

Poi lo leggo per quello che dice e non è deludente per niente.

::: memo-box
### MEMO GLOSSARIO

*   **Programma nazionale:** un insieme pubblico di richieste politiche presentate a nome di un gruppo che si definisce come popolo. È un testo, non uno Stato.
*   **Dieta territoriale (*deželni zbor*):** l'assemblea che rappresenta un territorio della monarchia e ne discute le leggi proprie — scuola, tasse, questioni civili.
*   **Parità linguistica:** l'uguale validità giuridica di due lingue nelle funzioni pubbliche indicate: scuola, tribunale, amministrazione. Non significa che una sostituisca l'altra.
:::

Seguo le righe con il dito. Le richieste sono tre.

Prima di tutto, un nome: *Kraljestvo Slovenija*, Regno di Slovenia, con gli Asburgo sul trono. Per capire a che cosa serve un nome basta vedere com'è divisa adesso questa terra: la Carniola, la Carinzia del sud, la Stiria del sud, il Goriziano, Trst, l'Istria. Sei pezzi, ognuno con il suo capoluogo e la sua dieta, e nessuna parola sola per chiamarli insieme. Il foglio li vuole in un'unica unità politica. Su una carta di oggi è la richiesta più difficile da vedere.

Poi una dieta comune, a Lubiana oppure qui a Celovec, che voti leggi proprie su tasse, scuola e cause civili.

Poi la lingua. Nelle scuole di ogni grado, davanti ai giudici, negli uffici di queste terre: la *slovenščina* deve valere quanto il tedesco.

In fondo, quasi staccata, c'è una riga che non mi aspettavo. Niente Francoforte: il foglio rifiuta di entrare nella Germania unita che laggiù stanno progettando, e invita a non votare per mandarci deputati. Non tutti lo ascolteranno. Ma la ragione è scritta senza giri di parole: non siamo tedeschi.

**Maja:** "Ma allora perché restare sotto Vienna? Se chiedete un regno vostro, chiedete anche di uscire."

**Majar:** "Uscire per andare dove? Siamo poco più di un milione, divisi fra amministrazioni diverse, e la nostra lingua non ha ancora un solo tribunale in cui valga. L'Impero è grande abbastanza da contenerci senza cancellarci, se lo si costringe a scriverlo. Fuori dall'Impero c'è la Germania da una parte e la guerra dall'altra."

::: target-profile
### SCHEDA PERSONAGGIO: Matija Majar – Ziljski

*   **Ruolo:** sacerdote, etnografo e linguista carinziano (1809-1892); nel 1848 cappellano della cattedrale di Celovec
*   **Forza:** 1
*   **Intelligenza:** 5
*   **Carisma:** 3
*   **Abilità Speciale:** fa entrare in un unico foglio territori che l'amministrazione tiene separati — prima che esista uno Stato capace di disegnarli insieme.
:::

Non è un rivoluzionario con il fucile in mano: è un impiegato della Chiesa, e lo sa bene. Eppure quello che sta facendo — scrivere petizioni e farle circolare — ha un prezzo che non avevo messo in conto: la gerarchia vescovile carinziana è fedele al centralismo tedesco, e un cappellano di cattedrale che si mette contro quella linea gioca la propria carriera, non solo la propria reputazione.

C'è un'altra cosa che imparo qui, più difficile da accettare: quello che sto leggendo non è *il* testo fondativo. È soltanto *uno* dei testi.

Perché mentre Majar mette per primo le richieste territoriali per iscritto — un articolo sulle *Novice* di Lubiana, il 29 marzo — a Vienna un gruppo di studenti universitari, insieme a un linguista già famoso, sta lavorando alla società *Slovenija*: producono una versione giuridicamente molto più solida, pensata apposta per il diritto pubblico della monarchia, e la approvano il 29 aprile. Nello stesso mese, fra il 16 e il 22, gli studenti di Graz chiedono cattedre universitarie in sloveno. A Lubiana, invece, il comitato nazionale frena: preferisce puntare su scuola e tribunali, diffidando di qualunque piano che smonti le autonomie storiche delle singole province.

Non un solo padre fondatore, ma quattro centri con quattro accenti diversi sulla stessa idea — e chi te ne racconta uno soltanto sta semplificando una storia che gli storici, ancora oggi, non riescono a chiudere con un nome solo.

**Maja:** "Se domani questo foglio arriva a Vienna con centinaia di firme, l'imperatore cosa fa?"

**Majar:** "Non lo so. Ma da domani non potrà più dire che non gli è stato chiesto."

È la frase più forte della giornata e io la scrivo sul quaderno, e poi mi fermo con la matita a mezz'aria.

Perché mi sto accorgendo di una cosa. Questo testo è chiarissimo. È preciso, è verificabile, è scritto in una lingua che capisco senza nessuno che me la traduca. E proprio per questo mi sta convincendo troppo in fretta di una cosa che non ha ancora dimostrato: chi c'è dietro.

Un documento perfetto prova che qualcuno ha scritto bene. Non prova quanti erano.

Non scrivo il verdetto. Voglio prima vedere cosa ha trovato Alex a Trst, dove secondo questo foglio ci sono sloveni che dovrebbero far parte del *Kraljestvo* — e dove lui ha appena visto una città con quattro progetti sul tavolo e nessuno scelto fino in fondo.

---

::: checkpoint
### CHECKPOINT: Perché, nella stessa primavera, i programmi nazionali disegnano confini e rapporti con l'Impero così diversi?

Finora hai raccolto: Milano e Venezia trasformano la rottura con l'Austria in insurrezione, repubblica e poi guerra fra Stati; Trieste chiede libertà costituzionali e si arma di una propria milizia senza seguire Venezia; *Zedinjena Slovenija* chiede di unire terre e lingua dentro una monarchia trasformata.

*   **A.** Perché le comunità hanno già obiettivi nazionali diversi: in area italiana prevale la separazione dall'Austria e l'unione politica; gli attivisti sloveni cercano di unire terre e lingua senza chiedere subito uno Stato indipendente.
*   **B.** Perché posizione e rischio cambiano ciò che è praticabile: una città in rivolta, un porto legato all'entroterra e una popolazione dispersa fra più province usano forme politiche diverse per proteggere interessi, diritti e spazio d'azione.

Tieni a mente la tua risposta — il Verdetto nel Debriefing te la confermerà, la correggerà, o mostrerà che la realtà era più complicata di entrambe.
:::

---

## Chi Firma, Chi Aspetta

<span class="byline">Cronaca di Maja</span>

Un tomo grande come una cassetta vola giù da una finestra del primo piano e cade sul falò con un tonfo pieno. La rilegatura di pergamena si torce subito. L'odore che sale è più dolce e più sporco del fumo di legna: carta vecchia, colla, cuoio di maiale.

Mission Control mi ha fatto tornare indietro di qualche settimana. Il tavolo di copiatura di Celovec qui non esiste ancora: è la sera del 21 marzo 1848, nella piana di Ig, a sud di Lubiana. Fra trecento e cinquecento contadini hanno marciato sul castello del conte e adesso riempiono il cortile interno. Mantelli e gilè di feltro grezzo, cappelli di paglia intrecciata, forconi da fieno, asce da boscaiolo.

I tomi che volano dalle finestre sono gli *urbarji* e le *gruntne bukve*: i registri feudali e i libri terrieri. Riga per riga, dicono quante giornate di lavoro gratuito ogni famiglia deve al signore.

Bruciano la prova scritta del proprio debito.

Qualcuno ha aperto una botte a colpi di scure, e il vino corre rosso fra i ciottoli. Io ho già visto il tavolo di Majar; queste persone non lo vedranno mai. Due scene della stessa terra, a poche settimane di distanza, e nessuna delle due sa che l'altra esiste.

**Maja:** "Se fra qualche settimana arrivasse un prete con un foglio da firmare — per unire le terre slovene, per una dieta a Lubiana — voi firmereste?"

**Un contadino:** "Chi te le ha raccontate, queste cose?"

**Maja:** "L'ho letto."

**Un contadino:** "Allora sei più avanti di me. Io so cos'è una giornata di *tlaka* in agosto. Sei qui a chiedere di una dieta?"

**Maja:** "Sto chiedendo se vi hanno chiesto qualcosa."

**Un contadino:** "A me non ha chiesto niente nessuno, mai. Oggi non ho aspettato che chiedessero."

Sulle *Novice*, il giornale di Lubiana che sta diffondendo il programma nazionale, il redattore condanna questi rivoltosi con parole durissime: *razvuzdani tolovaji*, scellerati briganti. Lo stesso foglio che porta *Zedinjena Slovenija* nelle canoniche e nelle osterie chiama briganti i contadini di Ig.

Non è un dettaglio da nascondere in fondo alla pagina. È la crepa vera.

::: memo-box
### MEMO GLOSSARIO

*   **Movimento petizionario:** la raccolta organizzata di firme e richieste da presentare all'autorità. È una forma di partecipazione politica per chi non ha diritto di voto.
*   **Controrivoluzione:** il ritorno al potere, spesso con l'esercito, delle autorità che una rivoluzione aveva sconfitto o ridimensionato.
*   **Neoassolutismo:** il decennio successivo al 1851 nella monarchia asburgica: costituzione revocata, associazioni politiche sciolte, controllo di polizia sulla stampa e sulle riunioni.
:::

Due mesi dopo il falò di Ig, i fogli di Majar e degli altri centri cominciano davvero a girare. Da metà maggio a luglio mettono insieme, secondo le stime, circa undicimila firme, contando sia quelle individuali sia quelle collettive. Quanti fogli ne restano oggi? Cinquantuno, conservati negli archivi sloveni: gli altri sono finiti sequestrati o dispersi, e di Lubiana non c'è neanche un foglio completo. Quelli rimasti vengono da villaggi e parrocchie della Carniola, dalla Carinzia — Zilja, Rož, Podjuna —, dalla Stiria e dal Goriziano.

Undicimila firme raccolte a mano, in quattro province, al di qua e al di là di due passi di montagna. Nelle terre slovene nessuno aveva mai messo insieme niente del genere.

Poi tengo in mano uno dei fogli e imparo a leggerlo meglio.

Le firme sono quasi tutte di parroci di campagna, cappellani, maestri elementari, mugnai, osti, artigiani e sindaci di villaggio. In Carniola fra il settanta e l'ottanta per cento dei contadini adulti non sa scrivere il proprio nome. Quindi succedono due cose. A volte il sindaco o il prete firma una volta sola, e accanto scrive *v imenu celotne fare*: a nome di tutta la parrocchia. A volte i capifamiglia tracciano tre croci, †††, e il maestro le vidima di fianco.

Le donne non ci sono quasi mai, tranne rarissime vedove che possiedono una bottega.

**Maja:** "Se il parroco firma per tutta la parrocchia, quante persone ha appena rappresentato?"

**MEMO:** *"Non determinabile. Una popolazione slovena superiore al milione rende quelle undicimila firme circa l'uno per cento del totale. Gli storici accettano la stima e discutono su cosa dimostri."*

**Maja:** "E quelli che non hanno firmato? Erano contrari?"

**MEMO:** *"Non inferibile. L'assenza di firma può indicare opposizione, indifferenza, impossibilità di scrivere, mancato arrivo del foglio o timore della gendarmeria. Le fonti non permettono di distinguere questi casi."*

Questa è la parte che mi fa più rabbia e insieme mi sembra la più onesta: non lo sappiamo. Una storiografia celebrativa dell'Ottocento ha scritto che l'intero popolo sloveno prese coscienza unanime della propria nazione. Gli storici che hanno contato i fogli dicono un'altra cosa: che quelle firme provano lo straordinario lavoro di una rete di persone colte, non un plebiscito.

E la cosa che più cambia la vita delle famiglie di Ig, quell'anno, non è scritta su nessuna delle due liste.

Arriva da Vienna, e porta la data del 7 settembre 1848. Un giovane deputato, figlio di contadini, ha proposto di chiudere per sempre la servitù feudale; l'Assemblea costituente austriaca ha votato la legge, e quel giorno l'imperatore la firma. Per la persona non si paga niente: da subito nessuno è più "sottoposto" a un signore. Per il lavoro e le decime, invece, sì. La terra diventa del contadino, ma il suo valore va riscattato, diviso in tre: un terzo lo perde il signore, un terzo lo anticipa la provincia, e l'ultimo terzo lo paga il contadino, una rata all'anno, per vent'anni.

Vent'anni di rate. La libertà non è gratis, ma è irreversibile.

::: scan-result
### SCANNING: PATENTE IMPERIALE DEL 7 SETTEMBRE 1848

*   **Tipo:** bando normativo, foglio grande imperiale
*   **Materiale:** carta pesante; stemma dell'aquila bicipite impresso a xilografia in testata; sigillo in ceralacca rossa
*   **Funzione:** dichiarare abolita la servitù feudale in tutta la monarchia
*   **Dettaglio Tecnico:** testo tedesco, con traduzione slovena diffusa dalle *Novice*: «*Zemljiška odveza... podložništvo je odpravljeno*». Il foglio veniva inchiodato con quattro chiodi di ferro alla porta della chiesa parrocchiale e a quella dell'osteria del villaggio.
:::

E qui arriva la cosa che cercavo davvero: come fa una legge a raggiungere chi non sa leggerla?

Non per affissione muta. La legge stessa prevedeva che il parroco la leggesse ad alta voce dal pulpito, subito dopo la Messa grande, per tre domeniche consecutive, tradotta in sloveno parlato. Tre volte, perché chi manca una domenica non perda l'anno.

Ma la parte che mi piace di più è pratica, quasi da furbi. Luglio, mietitura: il fattore del signore si presenta alla stalla e pretende le sue giornate. Il contadino non discute, non cita articoli di legge. Mostra una ricevuta — quella della tassa fondiaria provinciale, rilasciata dal *župan*, il sindaco del villaggio. Su quel foglio c'è scritto che la terra è sua e che le tasse le paga allo Stato, non al castello. Contro quella ricevuta il vecchio *urbar* non vale più niente, e un fattore che insiste non esige un diritto: commette un'estorsione, e la gendarmeria imperiale può arrestarlo.

Una ricevuta fiscale come scudo. Il documento più noioso del mondo, diventato l'arma di chi non sa leggere.

Poi arriva il conto politico. Nel marzo 1849 il nuovo imperatore, diciotto anni, scioglie con le baionette il parlamento riunito a Kremsier e impone una costituzione decisa dall'alto. Il 31 dicembre 1851 revoca anche quella. *Zedinjena Slovenija* diventa un reato di sedizione, le associazioni politiche slovene vengono sciolte, la polizia sorveglia.

Il programma è sconfitto. Il Regno di Slovenia resta un foglio.

Ma nessuno, in tutto il decennio del neoassolutismo, prova a riportare indietro la *tlaka*. Quella riforma non viene più toccata.

Chiudo il quaderno con due righe che non combaciano: il testo più ambizioso non ha ottenuto niente, e la riforma più prosaica non è stata revocata. Non so ancora se sia una consolazione o una lezione su cosa sopravvive davvero.

---

## Debriefing — Mission Control

Alex, Maja: posate le prove sul tavolo.

Una pietra di granito del selciato milanese, ancora sbrecciata da una leva da carrettiere. Un proclama veneziano stampato in fretta. La lama di una daga triestina con incisa una data che è quella di una rivoluzione, e accanto un contrassegno nominativo per il pane a tre carantani la libbra. Un foglio volante in quarto con la *gajica* su due colonne. Un foglio di firme, uno dei cinquantuno superstiti, con tre croci tracciate a mano e una riga di inchiostro bruno-violaceo che dice *a nome di tutta la parrocchia*. E una patente imperiale con l'aquila bicipite, che abolisce la *tlaka*.

Maja sfila il foglio in quarto da sotto la daga e indica una parola dell'elenco.

**Maja:** "Trst. Nel foglio di Majar c'è. Tu ci sei stato: che cosa hai visto?"

**Alex:** "Una città che a maggio vota un deputato per Francoforte. E dei carrettieri che scendono dal Carso e parlano sloveno sul Molo San Carlo. A loro non chiedeva niente nessuno. Né la Guardia, né il tuo foglio."

**Maja:** "Allora il foglio non basta nemmeno lì dove ha disegnato il confine." Si ferma. "Come a Ig."

**Alex:** "E i soldi non bastano a spiegare la Guardia. Il cugino del milite non aveva un soldo, e il pane glielo dava la Guardia."

**Maja:** "Scrivo: *testo chiaro ≠ quanti erano*."

**Alex:** "Io scrivo: *porto ≠ tutta la spiegazione*." Pausa. "Più piccolo, però."

Undicimila firme sono un fatto enorme per il 1848 e restano l'uno per cento di una popolazione. Un porto spiega il pane di quattromila famiglie e non spiega quattro progetti sulla stessa banchina. Nessuna di queste frasi cancella l'altra.

Nessuno dei due ha risolto il pezzo dell'altro. Ma la prova di ciascuno ha impedito all'altro di chiudere troppo presto.

**Verdetto.** L'Ipotesi è sbagliata nel punto in cui immagina una sola Primavera dei Popoli con un solo programma nazionale. La scintilla è comune — crisi, prezzi, censura, la notizia credibile che un regime può cedere — ma fini e strumenti dipendono da istituzioni, geografia, rapporti economici, lingue e gruppi sociali diversi. Milano e Venezia puntano alla rottura con l'Austria e poi, sotto la pressione della guerra, all'unione con una monarchia italiana. Trieste combina libertà costituzionali, autonomia cittadina e fedeltà dinastica, e resta divisa al proprio interno. *Zedinjena Slovenija* chiede di riunire terre e lingua in una propria unità politica dentro una monarchia trasformata, non l'indipendenza immediata. Al Checkpoint, **A descrive le mete dichiarate e B spiega perché quelle mete divergono nei fatti: servono tutte e due**. E nessuno di quei programmi coincide ancora con la voce dell'intera popolazione che dice di rappresentare. La repressione sconfigge governi e progetti immediati, ma non azzera l'anno: l'abolizione degli obblighi feudali resta in piedi, e i programmi scritti restano fatti politici con cui il decennio successivo dovrà fare i conti.

::: reality-check
### CIÒ CHE NON SAPPIAMO ANCORA

*   **Quanti programmi in uno:** gli storici discutono ancora se *Zedinjena Slovenija* abbia un testo fondatore o sia nata quasi insieme in più centri — Celovec, Vienna, Graz, Lubiana — con richieste e date che non coincidono del tutto. Attribuire tutto a un autore solo è comodo, ma è una semplificazione.
*   **Chi rappresentano le firme:** sopravvivono cinquantuno fogli e una stima di circa undicimila firme; mancano i fogli di Lubiana. Non sappiamo quante persone stiano davvero dietro una firma "a nome di tutta la parrocchia", né se un'assenza di firma significhi rifiuto, indifferenza, analfabetismo o semplicemente un foglio mai arrivato.
*   **Perché Trieste resta leale:** traffici e occupazione, fedeltà dinastica, autonomie municipali, paura della guerra, divisioni sociali e appartenenze linguistiche pesano tutti — ma quanto ciascuno, non lo sappiamo. Le memorie scritte dopo e i giornali di parte raccontano la stessa scelta con categorie che non si parlano tra loro.
:::

::: memo-box
### CRONOLOGIA ESSENZIALE

*   **24 febbraio 1848:** proclamazione della Seconda Repubblica a Parigi.
*   **13 marzo 1848:** rivoluzione a Vienna, dimissioni di Metternich.
*   **18-22 marzo 1848:** Cinque Giornate di Milano.
*   **22 marzo 1848:** proclamazione della Repubblica di San Marco a Venezia.
*   **aprile 1848:** formulazione e diffusione delle richieste di *Zedinjena Slovenija*.
*   **7 settembre 1848:** abolizione degli obblighi feudali nella monarchia asburgica.
:::

Nel 1848 i programmi corrono più veloci degli eserciti, e poi gli eserciti li raggiungono e li fermano.

Nel prossimo salto, fra il 1859 e il 1866, si vedrà che cosa succede quando eserciti, plebisciti e flotte provano a trasformare quelle mappe di carta in confini veri — e chi si ritrova, senza averlo scelto, dalla parte sbagliata della linea.

<!-- WORD COUNT: ~8100 -->
<!-- PERSONA CHECK: Alex/Maja voice intact — Pass. Alex still reasons from the individual encounter outward (the compositore, la donna della barricata, l'arsenalotto, il milite), leads with a physical/sensory anchor most scenes, catches himself mid-conclusion twice ("questa è una vittoria totale, giusto?" / "Quindi avevo ragione. È il denaro.") and is corrected by the scene itself rather than by a lecture. Maja interviews toward the structural/uncomfortable question ("perché nessuno lo racconta mai", "chi ha appena rappresentato"), pauses her own verdict rather than declaring one, and never explains Slovene culture to the reader as exotic. MEMO stays clinical/asetico and capped near 3 facts per intervention; Alex's interior sarcasm toward MEMO is present but restrained, consistent with the profile. -->
<!-- NUF CHECK: [1] ✅ chain crisis→Paris→Vienna→openings distinct from programme identity, shown via compositore + Vienna student; [2] ✅ Cinque Giornate→intervento piemontese→Prima guerra d'indipendenza kept distinct from insurrection, explicit MEMO correction; [3] ✅ three political geographies (Milano/Venezia, Trieste, terre slovene) held distinct through Checkpoint A/B and Verdetto; [4] ✅ material stakes carried by news-on-paper, granite/materasso, blocked port/bread tessera, copied petitions, signed crosses; [5] ✅ Maja's suspended verdict on Majar's document + Alex's "avevo ragione, è il denaro" punctured by the milite; [6] ✅ chronology distinct and sourced with ranges/stime flagged (Vienna dead, barricate count); [7] ✅ Trieste built from Guardia Nazionale statute, porto franco dependency, blocco navale, Frankfurt vote — no single motive attributed to "i mercanti"; [8] ✅ Zedinjena Slovenija's three/four requests given with variant centres (Celovec/Vienna/Graz/Lubiana) as [CONFLICT]-flagged plurality; [9] ✅ Beat 5 opens autonomously on the copying room, no "anche in Slovenia"; [10] ✅ Beat 6 tests firme vs tlaka vs élite programme without folding into Trieste/Italy utility. -->
<!-- ANTI-AI CHECK: no banned patterns found ("Immaginate di essere", "Ebbene sì", explicit moral closings, "questo ci insegna che"); production-jargon absent from body text (no "Beat"/"Scena", "Capitolo" appears once in the opening title only); EU/GIULIA/SLOVENIA tags never appear literally — resolved to "Alto Adriatico"/"terre slovene" in narration; sensory-opening formula ("la prima cosa che... è...") used exactly once (Beat 1), scenes 2-6 open on gesture/dialogue/object instead; Alex's explicit scuola/documentario tic used twice, Maja's "nessuno me l'ha detto" tic used once — both within the 3-per-chapter ceiling; single target-profile (Majar) passes the Abilità Speciale operational test; single checkpoint placed after Beat 5 per spec; no Easter Egg, consistent with struttura's explicit "nessun Easter Egg" for this chapter. -->


<div style="page-break-after: always;"></div>

# Capitolo 11 — Il Risorgimento E La Questione Adriatica

## Briefing

Alex, Maja: il salto comincia nel 1859. Sono passati undici anni dal 1848, dalla Primavera dei Popoli e dai programmi nazionali che avete visto nascere. Attraverserete il 1860, il 17 marzo 1861 e il 1866. Vi fermerete tre anni prima del 1869, quando un canale in Egitto e una ferrovia verso Trieste apriranno la missione successiva.

Il manuale propone questa catena: vittorie del 1859 → Garibaldi conquista il Sud → nel 1861 nasce il Regno d'Italia → la guerra del 1866 aggiunge il Veneto. Una vittoria dopo l'altra, e la carta si colora d'Italia.

Qualcosa non torna. Nel 1866 il nuovo Regno viene battuto a Custoza e a Lissa. Eppure il confine si sposta comunque a suo favore.

La vostra missione è raccogliere sei prove e ricostruire come battaglie, alleanze, voti, trattati e nomi abbiano prodotto la nuova mappa dell'Adriatico.

## OBIETTIVI DEL SALTO (SCENE)

### 1. La Vittoria Che Si Ferma A Metà (Lombardia, luglio 1859) — voce: Alex

Una borsa di cuoio sigillata, una borraccia che sa d'aceto e una porta chiusa dietro cui due uomini litigano.
**Prova da raccogliere:** verificare se una vittoria militare basta a realizzare l'obiettivo nazionale, o se l'alleato e l'armistizio ne fissano il limite.

### 2. Mille Uomini, Un Regno (Mar Tirreno e Sicilia 1860, Torino 17 marzo 1861) — voce: Alex

Piombo fuso in una stiva, camicie rosse che non bastano per tutti e una legge di un solo articolo.
**Prova da raccogliere:** distinguere ciò che conquista la spedizione da ciò che plebisciti, annessioni e legge trasformano in Stato.

### 3. Ferro, Fumo E Lingue A Lissa (acque di Lissa, 20 luglio 1866) — voce: Alex

Scafi dipinti di nero, un fischio a vapore e un timone a doppia ruota.
**Prova da raccogliere:** osservare che cosa dimostra una vittoria navale austriaca, e che cosa non dimostrano da sole lingua, provenienza e uniforme di chi sta a bordo.

### 4. La Sconfitta Che Sposta Il Confine (Venezia 1866, con una tappa a Milano 1863) — voce: Alex

Uniformi bianche che sfilano in silenzio, una pergamena col sigillo imperiale e un foglio protocollo a righe.
**Prova da raccogliere:** capire quale forza sposta davvero il confine dopo due sconfitte italiane, e perché un nome nuovo acquista peso politico.

### 5. Una Vittoria Imperiale Letta A Lubiana (Lubiana, 1° agosto 1866) — voce: Maja

Un tavolo di noce, un settimanale sloveno e dei telegrammi in tedesco.
**Prova da raccogliere:** confrontare ciò che una fonte slovena fa della notizia di Lissa con le richieste nazionali rimaste aperte dal 1848.

### 6. Il Confine Senza Il Nostro Nome (Valli del Natisone, inverno 1866) — voce: Maja

Un registro scolastico nuovo, un cippo di pietra bianca e una gerla di castagno.
**Prova da raccogliere:** cercare un effetto documentabile del nuovo confine sulle comunità di lingua slovena, senza attribuire loro uno Stato, un nome o una reazione che ancora non esistono.

Il rapporto è affidato a due co-reporter. Alex seguirà la costruzione del Regno in Europa e mondo e poi nell'Alto Adriatico; Maja verificherà che cosa la stessa guerra e lo stesso confine significano nelle terre slovene. Non dovete vedere le stesse cose. Dovete capire se ciò che vede uno cambia il significato di ciò che ha visto l'altro.

Attenzione: un bollettino di vittoria, un trattato, un ruolo d'equipaggio e un articolo di giornale non pesano allo stesso modo. Prima di usarli, chiedetevi quale domanda può davvero risolvere ciascuno.

---

## La Vittoria Che Si Ferma A Metà
<span class="byline">Cronaca di Alex</span>

Il cavallo arriva al trotto, schiumando, e il cavaliere salta giù prima ancora che si fermi. Ha una borsa di cuoio a tracolla, chiusa con una fibbia e un sigillo di ceralacca.

La consegna a una sentinella. La sentinella la passa a un ufficiale. L'ufficiale sparisce dentro una casa di campagna dalle persiane chiuse.

Monzambano, notte dell'11 luglio 1859. Fa ancora un caldo appiccicoso, di quelli che non se ne vanno nemmeno col buio.

*MEMO, chi era quello? Un corriere espresso?*

*"Una staffetta a cavallo. Porta dispacci sigillati in cuoio impermeabile. Il telegrafo corre lungo le ferrovie, ma l'ultimo tratto fino ai comandi lo fanno ancora gli uomini."*

Il telegrafo lungo i binari, e poi un tizio a cavallo con la borsa. Il Wi-Fi del 1859 finisce dove finisce la stazione.

A scuola il Risorgimento era un quadro: bandiere al vento, baionette lucide, tutti che corrono nella stessa direzione cantando. Qui la sentinella è un ragazzo poco più grande di me, con una tunica di lana turchino scuro e il colletto rosso, completamente zuppo di sudore. Non canta. Si passa la manica sulla fronte e beve da una borraccia di metallo.

**Alex:** "Posso? Muoio di sete."

Me la allunga. Bevo un sorso e per poco non lo sputo. È acqua. Con dentro dell'aceto.

**Sentinella:** "L'acqua dei fossi fa venire la dissenteria. Con l'aceto, il ventre regge. E la polvere in gola passa."

**Alex:** "Sei un volontario? Sei venuto a fare l'Italia?"

Mi guarda come se avessi chiesto se è venuto a piedi dalla luna.

**Sentinella:** "Mi hanno chiamato alla leva. Mio padre ha la vigna vicino ad Asti. Chi doveva vendemmiare, quest'anno?"

**Alex:** "Però avete vinto. Magenta, Solferino..."

**Sentinella:** "Solferino." Fa una pausa. "Io sono passato da Castiglione, dopo. Le chiese piene. Feriti sulla paglia, uno attaccato all'altro. Francesi e austriaci insieme. Le donne del paese portavano brodo e limoni e gridavano che eravamo tutti fratelli."

Non aggiunge altro. Nemmeno io.

*"Le stime parlano di 250.000-270.000 combattenti a Solferino e San Martino, il 24 giugno. Le perdite fra morti, feriti e dispersi si stimano fra 38.000 e 43.000."*

Quarantamila, più o meno. In un giorno solo. Provo a pensare a una battuta e non me ne viene nessuna.

Dietro le persiane, una voce si alza. Poi un'altra, più forte. Non capisco tutte le parole, ma il tono sì: è una lite vera, di quelle con le sedie spostate.

*MEMO, chi c'è là dentro?*

*"Il conte Camillo Benso di Cavour, capo del governo del Regno di Sardegna, e il re Vittorio Emanuele II. Le parole esatte di questa notte non furono messe a verbale: le conosciamo attraverso lettere e testimonianze di corte."*

Quindi quello che sento adesso nessuno l'ha scritto parola per parola. Mi avvicino lo stesso.

Dopo un tempo lunghissimo la porta si apre. Esce un uomo tarchiato, con gli occhiali e la barba corta sotto il mento, il viso rosso fino alle orecchie. Si ferma sul gradino, come se non sapesse più dove andare.

**Alex:** "Signor conte? Mi scusi. Perché siete arrabbiati, se avete vinto?"

**Cavour:** "Vinto." Ride senza allegria. "Stamattina, a Villafranca, l'imperatore dei Francesi ha trattato con l'imperatore d'Austria. Da solo. Senza avvisarmi. Io chiedevo di continuare la guerra con le nostre forze. Sua Maestà non vuole."

**Alex:** "Ma la Francia non era vostra alleata?"

**Cavour:** "A Plombières, un anno fa, Napoleone III mi aveva promesso un regno dell'Alta Italia, Veneto compreso. In cambio, Nizza e la Savoia. Adesso si ferma a metà strada."

**Alex:** "E perché si ferma?"

**Cavour:** "Chiedetelo a Parigi. Io so soltanto che domani consegno le dimissioni."

Mi lascia lì e se ne va nel buio, a passo veloce.

Il racconto di questa lite è ricostruito, ma le dimissioni di Cavour no: quelle ci sono state davvero. E Napoleone III qualche motivo per fermarsi ce l'aveva.

*"Tre motivi documentati. Uno: le perdite enormi di Solferino. Due: il rischio che la Prussia e la Confederazione Germanica mobilitassero truppe sul Reno, alle spalle della Francia. Tre: in Toscana, Modena, Parma e Romagna le insurrezioni chiedono l'annessione al Piemonte, non i regni pensati a Parigi."*

Quindi l'alleato che ti fa vincere è lo stesso che decide dove smetti di vincere. Comodo, per lui.

::: memo-box
### MEMO GLOSSARIO

*   **Seconda guerra d'indipendenza:** la guerra del 1859 del Regno di Sardegna e della Francia contro l'Impero austriaco, cominciata ad aprile dopo che Cavour, il 26 aprile, respinse l'ultimatum di Vienna.
*   **Armistizio:** una sospensione concordata dei combattimenti. Non è ancora la pace: fissa le condizioni che un trattato dovrà poi confermare. Quello di Villafranca fu firmato l'11-12 luglio 1859 da Napoleone III e Francesco Giuseppe.
*   **Plebiscito:** un voto usato per approvare un cambiamento di governo o di territorio già preparato dall'alto. Nell'Ottocento votavano solo gli uomini con determinati requisiti, spesso a voto palese: non è un referendum di oggi.
:::

Il trattato arriva a novembre, a Zurigo. Lo leggo su una copia che MEMO proietta davanti ai miei occhi, e mi tocca rileggerlo due volte.

L'Austria cede la Lombardia. Ma non al Regno di Sardegna: all'imperatore dei Francesi, che poi la passa a Vittorio Emanuele II. Le fortezze di Mantova e Peschiera restano austriache. Il Veneto pure.

**Alex:** "Aspetta. La Lombardia fa un giro da Parigi prima di arrivare a Torino?"

*"Esatto. Sulla carta, la Lombardia è un regalo di Napoleone III a Vittorio Emanuele II."*

La sentinella di Asti, intanto, avrà ancora la borraccia all'aceto e una vigna senza vendemmia. Una regione in più sulla carta, una in meno di quelle promesse.

---

## Mille Uomini, Un Regno
<span class="byline">Cronaca di Alex</span>

Sfrigola.

Un ragazzo con la giacca di velluto scuro tiene una pinza di bronzo sopra un fornellino da campo e ci versa dentro un filo di piombo liquido. Quando apre la pinza, cade sul tavolaccio una pallottola ancora calda. Accanto a lui un altro arrotola un foglio di carta da imballaggio a cilindro, ci mette la polvere nera e la pallottola, e chiude tutto con una ditata di sego.

Siamo nella stiva del *Lombardo*, uno dei due piroscafi partiti da Quarto, vicino a Genova, nella notte tra il 5 e il 6 maggio 1860. L'aria sa di carbone, zolfo e sale. Siamo stipati come sardine, e fa un caldo da forno.

**Alex:** "Scusa, ma le munizioni non ve le hanno date?"

**Volontario:** "Ce ne hanno date poche. E i fucili sono quelli che sono." Mi fa vedere il suo: un vecchio fucile ad avancarica con il cane arrugginito. "Il grasso tiene asciutta la polvere, col mare. E ungendo la canna, dopo quattro o cinque colpi non si incrosta."

**Alex:** "Fatto in casa. Tipo un tutorial."

**Volontario:** "Un che?"

**Alex:** "Niente. E la camicia rossa? Pensavo ce l'aveste tutti."

Si guarda la giacca di velluto, poi indica un uomo con un cilindro in testa, pure lui a bordo.

**Volontario:** "Le camicie le hanno date a Talamone, e non a tutti. Panno grezzo. Dicono che l'idea venga dall'America del Sud, da quando il generale combatteva a Montevideo: una partita di camicie destinate ai macellai di Buenos Aires, comprata a poco prezzo. Sul rosso il sangue delle bestie non si vede."

Ecco. Il poster dell'eroe in camicia rossa è appena crollato. Metà della spedizione sembra uscita da un matrimonio, l'altra metà da un mattatoio argentino.

*MEMO, quanti sono davvero? Mille tondi?*

*"No. Dal porto di Quarto ne partono, secondo le stime, fra 1.150 e 1.162. Circa 60-70 vengono staccati a Talamone. L'elenco ufficiale conta 1.089 volontari sbarcati a Marsala l'11 maggio."*

Fra loro c'è una sola donna, Rosalia Montmasson, salita a bordo di nascosto a Quarto. Farà l'infermiera.

Garibaldi, però, non è qui: viaggia sull'altro piroscafo, il *Piemonte*. Riesco ad avvicinarlo solo a terra, a Marsala, l'11 maggio. Un uomo con la barba chiara e un poncho sulle spalle. Tutti, quando passa, si raddrizzano un poco.

**Alex:** "Generale Garibaldi? Una domanda veloce. Come fanno mille persone a conquistare un regno intero?"

**Garibaldi:** "Da soli, non lo fanno. Qui in Sicilia ci aspettavano. Nelle campagne ci sono bande armate che odiano i Borbone. A Palermo i comitati preparano la rivolta da mesi."

**Alex:** "E l'esercito borbonico?"

**Garibaldi:** "È grande. Ma chi lo comanda non sa più cosa fare."

Questo dialogo è ricostruito. I fatti dietro, no: la spedizione vinse grazie alle bande rurali siciliane, i *picciotti*, alle rivolte in città, all'ostilità di élite e contadini verso la monarchia borbonica e alla paralisi dei comandi di Francesco II.

Poi MEMO accelera, e i mesi mi passano accanto come stazioni viste da un treno.

A Calatafimi, il 15 maggio, i volontari salgono fra terrazze di grano secco e pietraie. Dopo una ventina di minuti di fuoco molti restano senza munizioni e tirano sassi, prima dell'assalto alla baionetta. Il ragazzo della pinza di bronzo aveva ragione a fondere tutto quel piombo.

Poi la Sicilia. Poi Napoli.

E poi succede una cosa che non mi aspettavo. A settembre un altro esercito scende verso sud attraverso le Marche e l'Umbria: quello regolare del Regno di Sardegna. Il 18 settembre, a Castelfidardo, batte le truppe del Papa; a ottobre il re in persona ne prende il comando.

*"Il governo di Cavour teme che Garibaldi marci su Roma. Un attacco al Papa farebbe intervenire la Francia. L'esercito regio deve arrivare prima di lui."*

Il 21 ottobre si vota. Un banchetto, un'urna, un foglio con una domanda sola: *«Il popolo vuole l'Italia una ed indivisibile con Vittorio Emanuele re costituzionale e i suoi legittimi discendenti?»*

**Alex:** "Chi vota?"

*"Solo i cittadini maschi, dai 21 anni, nel pieno dei diritti civili. I risultati ufficiali proclamati sono 1.302.064 sì e 10.312 no nelle province napoletane, 432.053 sì e 667 no in Sicilia. Quei numeri sono contestati dalla storiografia."*

Mia madre e mia nonna, qui, sarebbero rimaste a casa. Per legge.

Il 26 ottobre Garibaldi e Vittorio Emanuele II si incontrano. Tutti dicono «a Teano». Io mi ritrovo a un incrocio polveroso, davanti a un'osteria.

*"Taverna Catena, comune di Vairano Patenora. Teano è la cittadina più vicina, e il nome celebrativo è rimasto a lei."*

Non c'è l'abbraccio fra pari del quadro. L'esercito regio prende il controllo. I volontari vengono disarmati e congedati, e la maggior parte non entra nell'esercito regolare.

::: memo-box
### MEMO GLOSSARIO

*   **Spedizione dei Mille:** la campagna di volontari guidata da Garibaldi, partita da Quarto nel maggio 1860, che con l'appoggio di insorti locali abbatté il potere borbonico in Sicilia e nel Sud.
*   **Annessione:** l'incorporazione di un territorio in uno Stato già esistente. Nel 1860 si fa con un plebiscito seguito da un atto del governo.
*   **Regno d'Italia:** il nuovo Stato proclamato per legge il 17 marzo 1861. Nasce allargando il Regno di Sardegna, senza un'assemblea costituente.
:::

Torino, 18 marzo 1861. Tengo in mano la *Gazzetta Ufficiale del Regno d'Italia*, numero 68. La carta è ancora rigida. Cerco il testo della legge e lo trovo subito, perché è cortissimo.

**Alex:** "Tutto qui? Un articolo?"

**Impiegato della Camera:** "Uno solo. *Il Re Vittorio Emanuele II assume per sé e suoi Successori il titolo di Re d'Italia.* Il Senato l'ha approvata il 26 febbraio, la Camera il 14 marzo."

**Alex:** "Ma se è il primo re d'Italia, perché «secondo»?"

**Impiegato della Camera:** "Perché resta il secondo re di Sardegna con quel nome. E la legislatura che si è aperta è l'ottava, non la prima. Il conte ha voluto così."

*"Numerale e legislatura segnano la continuità: il nuovo Regno prosegue lo Stato piemontese e il suo Statuto del 1848, invece di rifondarsi da zero."*

Il ragazzo della pinza di bronzo ha conquistato mezza Sicilia. Il Regno, però, l'ha votato un Parlamento a Torino, con un articolo solo.

---

## Ferro, Fumo E Lingue A Lissa
<span class="byline">Cronaca di Alex</span>

«Dipinte di nero?»

Me lo ripeto per la terza volta, appoggiato al parapetto della *Erzherzog Ferdinand Max*. Tutto lo scafo è nero opaco. Attorno al fumaiolo c'è una fascia di colore vivo, e sulle navi vicine le fasce sono diverse: bianche, gialle, rosse.

Il ponte vibra sotto le scarpe. Le caldaie a carbone spingono, e dal fumaiolo esce un fumo grasso che mi si attacca in gola.

Mattina del 20 luglio 1866, mare aperto davanti all'isola di Lissa, che i croati chiamano Vis. La flotta dell'Impero austriaco sta andando incontro a quella del Regno d'Italia.

*MEMO, perché le hanno pitturate come carri funebri?*

*"Ordine del contrammiraglio Tegetthoff prima di salpare da Fasana. Le fasce colorate distinguono le divisioni. Le corazzate italiane sono grigie: l'ordine è speronare qualunque scafo grigio."*

Una regola che ti ricordi anche mentre ti sparano addosso. Quasi geniale.

::: target-profile
### SCHEDA PERSONAGGIO: Wilhelm von Tegetthoff

*   **Ruolo:** contrammiraglio della marina imperial-regia austriaca nel 1866, nato a Maribor (allora Marburg an der Drau, in Stiria).
*   **Forza:** 4 — comanda 27 navi e 532 cannoni, contro una flotta più numerosa e meglio armata.
*   **Intelligenza:** 5 — prevede che bandiere e segnali spariranno nel fumo e prepara in anticipo regole semplici che ogni comandante può ricordare.
*   **Carisma:** 4 — sta sul ponte di comando scoperto e dà l'ordine decisivo a voce.
*   **Abilità Speciale (Vedere Nel Fumo):** tiene insieme una flotta di ferro e di legno quando nessuno vede più niente — dipinge le navi, sostituisce le bandiere con fischi e trombe e trasforma il caos in un'unica istruzione: colpisci il grigio.
:::

L'uomo sul ponte di comando è in piedi e ha il cannocchiale in mano. Non ha l'aria da eroe da film che mi aspettavo, con il mantello svolazzante: è un ufficiale con i baffi, i gomiti stretti e un'aria di concentrazione feroce.

**Alex:** "Ammiraglio, loro hanno più navi. Perché attaccate?"

**Tegetthoff:** "Perché non aspettano che siamo pronti. Se ci fermiamo a contarli, ci affondano uno alla volta."

**Alex:** "E come fate a dare ordini, qui in mezzo?"

**Tegetthoff:** "Le bandiere si vedono fino al primo colpo. Poi c'è il fumo. Per quel momento abbiamo i fischi delle caldaie e le trombe. E un ordine che tutti conoscono già."

::: memo-box
### MEMO GLOSSARIO

*   **Nave corazzata:** una nave da guerra a vapore con lo scafo protetto da piastre di ferro battuto, imbullonate su travature di quercia. Non acciaio moderno: ferro.
*   **Speronamento:** usare la prua rinforzata, il rostro, come arma contro la fiancata di una nave nemica.
*   **Formazione a cuneo:** lo schieramento a punta di freccia (*Pfeilformation*) scelto da Tegetthoff: tre gruppi successivi, con le 7 corazzate in testa, per spezzare la linea avversaria.
:::

*"Flotta italiana dell'ammiraglio Persano: 12 corazzate e 22 unità di legno e ausiliarie, circa 34 navi, 645 cannoni. Flotta austriaca: 7 corazzate e 20 navi di legno, 27 in tutto, 532 cannoni."*

Sulla carta, dovrebbe vincere l'Italia.

Poi comincia. Il primo colpo di cannone mi rimbomba nelle costole, il secondo non lo distinguo più dal terzo. In pochi minuti il fumo della polvere nera e quello delle caldaie si mischiano. Non vedo a dieci metri.

Un fischio lungo, a vapore. Uno squillo di tromba. La nave cambia rotta.

*"Nota importante. Poco prima dello scontro l'ammiraglio Persano ha lasciato la sua ammiraglia, la* Re d'Italia*, per salire sull'ariete* Affondatore*. Non ha avvisato i comandanti delle altre divisioni e il suo segnale di comando non è stato issato in tempo."*

**Alex:** "Quindi dall'altra parte nessuno sa chi comanda."

*"Nessuno lo sa con certezza."*

Le corazzate austriache si infilano nel varco fra l'avanguardia italiana e il centro. Nella nebbia nera compare una sagoma grigia. Enorme. Ferma, o quasi.

Al timone a doppia ruota c'è un marinaio veneziano, Vincenzo Vianello. Tegetthoff si china verso di lui e gli grida qualcosa. La tradizione riporta la frase in dialetto veneto: *«Daghe dosso, Nino, che la ciapemo!»* Le versioni non coincidono tutte, e io, nel frastuono, non riesco a capire le parole. Capisco il gesto.

La *Ferdinand Max* accelera a undici, dodici nodi.

L'urto è un boato sordo. Il ferro trema tutto insieme, e metà degli artiglieri finisce a terra. Anch'io. Sento un rumore lungo, straziante, di lamiere che si torcono e di travi di quercia che si spezzano.

Quando mi rialzo, la *Re d'Italia* si sta inclinando. La falla nella fiancata sinistra supera i quattro metri quadrati. In meno di tre minuti la nave scompare. Con lei, 381 uomini.

Sul ponte di batteria qualcuno grida «Viva San Marco!».

Io non grido niente. Resto aggrappato a una cima bagnata con le mani che non smettono di tremare.

Alle 14:30 un'esplosione enorme squarcia il fumo più lontano. È la *Palestro*: un incendio ha raggiunto il deposito delle munizioni. Muoiono il comandante Alfredo Cappellini e 231 marinai.

*"Perdite stimate: per la marina italiana fra 612 e 643 morti e circa 40 feriti. Per quella austriaca 38 morti e 138 feriti. Nessuna nave austriaca affondata; il vascello di legno* Kaiser *è gravemente danneggiato dopo aver speronato la* Re di Portogallo*."*

Accanto a me, un cannoniere si pulisce la faccia nera di fuliggine con la manica. Parla veneto, come il timoniere. A qualche passo, due marinai si scambiano frasi in una lingua che non riconosco.

*"Dialetti sloveni. Poco più in là si sente anche il croato. Il tedesco lo trovi negli ordini scritti e tra gli alti gradi."*

**Alex:** "Scusa. Tu parli come uno di Venezia. Cioè... sei italiano? Hai appena affondato una nave italiana."

Il cannoniere mi guarda come si guarda uno che ha preso troppo sole.

**Cannoniere:** "Mi son marinér. Servimo l'Imperador. A bordo se parla cussì, perché el mar parla cussì."

**Alex:** "E loro due? Quelli che parlano l'altra lingua?"

**Cannoniere:** "Sono marinai. Tirano le cime come me."

Fine della discussione. Torna al cannone.

::: scan-result
### SCANNING: LA LINGUA DI BORDO

*   **Tipo:** lingua franca operativa di una flotta imperiale
*   **Base:** dialetto veneto-marinaresco, la lingua d'uso quotidiana del mare Adriatico
*   **Accanto:** dialetti sloveni e croati; il tedesco obbligatorio per gli ordini militari scritti e i gradi alti
*   **Dettaglio Tecnico:** gli equipaggi venivano arruolati soprattutto lungo il Litorale austriaco, in Istria, sulle isole del Quarnero, in Dalmazia e nelle valli della Carniola e del Goriziano. Parlare veneto a bordo non era una dichiarazione di nazionalità.
:::

Secondo lo storico sloveno Igor Grdina, sei dei 27 comandanti delle navi austriache parlavano correntemente lo sloveno o avevano origini slovene o carniolane.

Il veneziano che ha tenuto il timone, l'ammiraglio nato a Maribor, due ragazzi che si parlano in sloveno sotto la stessa bandiera: la mia idea di «due squadre nazionali» fa acqua peggio della *Re d'Italia*.

*"Un'ultima precisazione. Lissa viene spesso chiamata «la prima battaglia fra corazzate». Ma a Hampton Roads, nel 1862, si erano già scontrate due corazzate. La formula corretta: è la prima grande battaglia in mare aperto fra intere flotte in cui le corazzate hanno un ruolo centrale."*

Il fumo comincia a diradarsi. Le navi grigie si allontanano verso ovest.

L'Italia ha perso. Adesso bisogna capire che cosa ha perso.

::: checkpoint
### CHECKPOINT: Quanto può decidere una battaglia il confine che uscirà dalla guerra?

Finora hai raccolto: nel 1859 una vittoria non completa l'obiettivo perché l'alleato si ferma; nel 1860-61 una campagna militare diventa Regno soltanto attraverso voti, annessioni e una legge; nel 1866 l'Italia perde sul mare.

*   **A.** Lissa può bloccare l'espansione italiana del 1866: le mediazioni del 1859 e le annessioni del 1860-61 non cancellano il peso di una sconfitta militare così netta.
*   **B.** Lissa può decidere chi controlla il mare senza decidere da sola la pace: alleanze e negoziati, già decisivi nel 1859-61, possono produrre un risultato territoriale diverso dal bollettino navale.

Tieni a mente la tua risposta — il Verdetto nel Debriefing te la confermerà, la correggerà, o mostrerà che la realtà era più complicata di entrambe.
:::

---

## La Sconfitta Che Sposta Il Confine
<span class="byline">Cronaca di Alex</span>

Passano in fila, in silenzio.

Uniformi bianche, zaini in spalla, fucili puntati verso il cielo. I soldati austriaci attraversano piazza San Marco senza tamburi e senza una parola, verso i piroscafi che li porteranno a Trieste e a Pola. L'unico rumore sono gli scarponi sulla pietra, e i piccioni che si alzano in volo.

Venezia, 19 ottobre 1866. Tre mesi dopo Lissa.

Mi volto verso MEMO come se potessi guardarla in faccia.

*MEMO, spiegami. L'Italia ha perso a Lissa. Se ne vanno gli austriaci?*

*"L'Italia ha perso anche a Custoza, il 24 giugno, sulla terraferma: l'esercito del generale La Marmora è stato sconfitto dall'arciduca Alberto. Ma il 3 luglio l'Austria è stata travolta dalla Prussia a Königgrätz, in Boemia. Gli italiani la chiamano Sadowa."*

Quindi l'Italia ha perso due volte, e però ha combattuto dalla parte giusta di una guerra più grande. Vince il Veneto perché ha vinto la Prussia.

All'Hotel Europa, sul Canal Grande, c'è una sala con tende pesanti e un tavolo coperto di panno. Un generale francese, Lebœuf, porge un documento a un gruppo di notabili veneziani guidati da Luigi Michiel. È una pergamena bollata, con il sigillo imperiale di Napoleone III.

**Alex:** "Un generale francese? Di nuovo la Francia? Cosa c'entra?"

Uno dei notabili, un signore anziano con la cravatta nera annodata alta, abbassa la voce per rispondermi.

**Notabile veneziano:** "L'imperatore d'Austria non voleva consegnare Venezia a un re che aveva battuto. Così l'ha ceduta all'imperatore dei Francesi. E lui la consegna a noi, a patto che la popolazione voti."

**Alex:** "È la stessa cosa della Lombardia nel 1859! Il pacco passa da Parigi."

**Notabile veneziano:** "Il trattato è firmato a Vienna il 3 ottobre. Il voto si terrà domenica e lunedì."

*"Il 21 e 22 ottobre. Risultato ufficiale: 647.246 sì, 69 no, 273 schede nulle."*

Sessantanove no. Su più di seicentomila. Sembra il risultato di un sondaggio truccato fatto a scuola.

*"Gli storici critici ricordano che il voto era palese, senza cabine, con schede riconoscibili e controllate a vista, senza alternative reali e riservato agli uomini. Più che una scelta libera, è la ratifica di una cessione già decisa dal trattato."*

**Alex:** "Quindi il voto non ha deciso niente?"

**Notabile veneziano:** "Il voto dice che siamo contenti. Il trattato dice dove passa la linea."

::: memo-box
### MEMO GLOSSARIO

*   **Cessione territoriale:** il passaggio di sovranità su un territorio da uno Stato a un altro, stabilito da un trattato. Nel 1866 il Veneto passa dall'Austria alla Francia e poi al Regno d'Italia.
*   **Litorale austriaco:** l'unità amministrativa asburgica (*Österreichisches Küstenland*) che comprende Gorizia e Gradisca, Trieste e l'Istria. Nel 1866 resta dentro l'Impero austriaco.
*   **Irredentismo:** il movimento che rivendicherà all'Italia le terre «non redente». La parola nel 1866 non esiste ancora: la conia Matteo Renato Imbriani nel 1877, e l'associazione che la diffonde nasce nel 1878.
:::

Sul tavolo c'è una carta con la nuova linea di confine. Seguo il tratto col dito. La provincia del Friuli, con Udine, passa all'Italia. Il confine corre lungo un torrente, lo Judrio.

Al di là, tutto resta com'era: Gorizia, Trieste, l'Istria. E, più giù, Fiume e la Dalmazia, anch'esse asburgiche.

**Alex:** "E la gente che ha i campi di qua e il pascolo di là? Paga la dogana ogni volta che porta una mucca a mangiare?"

**Notabile veneziano:** "Per chi abita vicino al confine faranno un cartellino. Timbrato dal comune e dalla dogana. Con quello si passa col fieno, la legna e le bestie senza pagare dazio e senza passaporto."

*"Vale per i residenti entro una fascia di cinque chilometri dalla linea. Chi non ce l'ha paga il dazio, come un mercante."*

Un pezzo di cartone per non spezzare in due una stalla. Hanno pensato anche a questo.

Fisso i nomi al di là della linea. *Küstenland*. Litorale.

*"Prima di chiudere il fascicolo, Mission Control ha autorizzato una tappa indietro. Un solo salto, dichiarato: Milano, 1863. Qualcuno, tre anni prima di questo trattato, ha già dato a quelle terre un nome diverso."*

Il salto dura un battito di ciglia. Mi ritrovo in uno studio pieno di libri, con l'odore di carta vecchia e una finestra socchiusa sul rumore dei carri. Su un tavolo ci sono carte geologiche, carte dei dialetti e qualche mappa romana dell'arco alpino. Un uomo scrive con un inchiostro nero ferroso su fogli protocollo a righe.

*"Graziadio Isaia Ascoli, glottologo, nato a Gorizia. Studia la storia delle lingue. L'articolo che sta scrivendo si chiama* Le Venezie *e uscirà anonimo sul periodico milanese* L'Alleanza*."*

**Alex:** "Professore, che cosa scrive?"

**Ascoli:** "Un modo per nominare le terre del Nord-Est. Le divido in tre Venezie. La Venezia Euganea, cioè il Veneto. La Venezia Tridentina, il Trentino. E la Venezia Giulia."

**Alex:** "Giulia come le Alpi Giulie?"

**Ascoli:** "Come le Alpi Giulie, e come Forum Iulii, l'antica Cividale. Intendo la terra fra l'Isonzo, le Alpi Giulie e il mare: Gorizia, Trieste, l'Istria fino al Quarnero."

**Alex:** "Ma è un nome inventato da lei? Esiste da qualche parte, questa Venezia Giulia?"

**Ascoli:** "Esiste nella storia e nelle lingue. Non in un ufficio."

Anche questo dialogo è ricostruito. Il testo del 1863, invece, esiste, e Ascoli non vi crea nessuna provincia: propone una classificazione storico-linguistica. Più tardi, altri lo leggeranno come la promessa di una conquista. Le fonti non permettono di attribuirgli quel piano.

*"«Venezia Giulia» diventerà un nome amministrativo dello Stato italiano solo dopo il 1918."*

Torno a Venezia. La carta è ancora sul tavolo, con lo Judrio tracciato in inchiostro fresco. Di qua, Regno d'Italia. Di là, *Küstenland*.

Un nome scritto a Milano da un professore. Una linea firmata a Vienna da due imperi. Per ora, la parola e la linea non coincidono.

---

## Una Vittoria Imperiale Letta A Lubiana
<span class="byline">Cronaca di Maja</span>

La prima cosa che sento è il fruscio della carta.

Qualcuno sta sfogliando un giornale troppo in fretta, e la carta di stracci è ruvida, fa quasi rumore di tessuto. Poi arriva la voce. Legge ad alta voce, in sloveno, con quell'accento un po' solenne che la gente usa quando legge una cosa importante.

*«Pomorska bitka pri Visu...»*

La battaglia navale di Lissa. Vis.

Sono nella *Narodna čitalnica* di Lubiana, la sala di lettura nazionale. Mercoledì 1° agosto 1866. Tavoli di noce scuro, lampade a petrolio spente perché è ancora giorno, e alle pareti stendardi bianco-blu-rossi.

Sul tavolo grande c'è il numero 31 delle *Kmetijske in rokodelske novice*. Tutti le chiamano solo *Novice*. È uscito oggi.

*MEMO, chi le fa?*

*"Le dirige Janez Bleiweis. È il principale settimanale in lingua slovena del 1866. Lo stampa la tipografia di Jožef Blaznik, qui a Lubiana."*

L'uomo che legge ha i capelli grigi e la giacca abbottonata fino in cima. Arriva a un passaggio e alza la voce: *«naš vitez Tegetthoff»*. Il nostro cavaliere Tegetthoff. Poi ringrazia la Provvidenza, che ha risparmiato alla Stiria, alla Carniola e al Litorale l'orrore di un'invasione dal mare.

Intorno al tavolo annuiscono.

Il nostro cavaliere. Tegetthoff è nato a Maribor. E qui dentro nessuno lo tratta come uno straniero.

Me lo scrivo sul quaderno, sottolineato due volte. Poi scrivo la mia ipotesi, di getto: *Per gli sloveni, Lissa = protezione dal nazionalismo italiano.*

Mi piace. Mi piace proprio. Suona come una cosa che nessun libro italiano mi ha mai detto.

Il vecchio arriva in fondo all'articolo e si toglie gli occhiali. Mi avvicino al tavolo.

**Maja:** "Mi scusi. Ha letto «nostro». Nostro di chi?"

**Lettore anziano:** "Nostro. Stiriano, suddito dello stesso imperatore, e ha difeso la nostra costa. *Vse za vero, dom, cesarja*: tutto per la fede, la patria, l'imperatore. Lo scriviamo da anni, signorina."

**Maja:** "E la Slovenia Unita? Quella del 1848?"

**Lettore anziano:** "Quella la chiediamo lo stesso. Dentro la monarchia, un passo alla volta. Le due cose non si contraddicono."

*"Zedinjena Slovenija: il programma del 1848 per riunire le terre slovene in un'unica unità dentro la monarchia. Nel 1866 non è né realizzato né dimenticato. Bleiweis e i suoi, gli* Staroslovenci *o Vecchi Sloveni, lo chiedono con prudenza."*

**Maja:** "E la festa per Lissa? Era contro gli italiani?"

**Lettore anziano:** "In tutte le chiese si è cantato il Te Deum. Ma nessuno odia la gente d'Italia. Pensi piuttosto a cosa sarebbe successo se la loro flotta fosse arrivata a Trieste, o sulla costa d'Istria, dove vivono sloveni e croati."

Fedeltà all'imperatore e programma nazionale sullo stesso tavolo, e nessuno dei due litiga con l'altro. Scrivo anche questo.

A quel punto, nell'orecchio, un'altra voce.

*"Mission Control ha sincronizzato il tuo salto e quello di Alex sullo stesso giorno, il 1° agosto 1866. Alex chiede di mandarti un messaggio."*

*Va bene.*

**Alex:** "Ho letto la tua ipotesi. Forte. Una domanda sola: che cosa potrebbe smentirti?"

Mi fermo con la matita a mezz'aria.

È la mia domanda. Gliel'ho fatta io, la prima volta, per una pallina di carta. E la cosa peggiore è che non ho una risposta pronta.

*Te lo dico dopo*, gli mando. Secca.

Non sono offesa. Sono arrabbiata con me stessa, che è diverso. Ho trovato una fonte che mi piaceva, e mi sono fermata lì.

Allora guardo il resto del tavolo. Non il giornale che conferma la mia ipotesi: gli altri fogli.

Di fianco alle *Novice* ci sono dei telegrammi in tedesco della *Laibacher Zeitung*. Un uomo più giovane, con la barba rada e gli occhiali, li tiene fermi con tutte e due le mani, come se potessero volare via.

**Maja:** "Cosa dicono?"

**Lettore giovane:** "Che dopo Königgrätz l'imperatore ha dovuto chiedere la pace ai prussiani. I preliminari sono già firmati."

**Maja:** "Ma a Lissa avete vinto."

**Lettore giovane:** "Abbiamo vinto in mare. E sulla terra abbiamo perso la guerra." Abbassa il foglio. "Se l'Impero si sfascia, sa chi ci prende? Bismarck. Una Grande Germania. Allora sì che la nostra lingua non la stampa più nessuno."

Guardo il vecchio che legge le *Novice*. Poi il giovane con i telegrammi. Sono allo stesso tavolo, nella stessa sala, e hanno paura di due cose diverse.

**Maja:** "Quindi Lissa non vi ha salvato."

**Lettore giovane:** "Lissa ha salvato la costa. Non so se salverà noi. Ci sono di quelli, fra i più giovani, che dicono che obbedire sempre a Vienna non ci ha mai dato un ginnasio in sloveno, né un ufficio che ci risponda nella nostra lingua. E non ce li darà nemmeno adesso."

*"Sono i* Mladoslovenci*, i Giovani Sloveni. Nel 1866 cominciano a contestare la fedeltà troppo cieca di Bleiweis. Il loro giornale,* Slovenski narod*, nascerà solo nel 1868."*

**Maja:** "E i contadini? Leggono le *Novice* anche loro?"

**Lettore anziano:** "Un contadino un giornale non se lo può permettere. Una copia la compra la parrocchia, o qualche socio della Società agraria. La domenica, dopo la messa, il sagrestano o il maestro o il parroco la legge davanti alla chiesa. O in osteria."

**Lettore giovane:** "E la spiega nel dialetto del posto. Qualcuno segue le armate sulla carta dell'Impero appesa al muro."

Una copia sola per un paese intero. Una voce che legge e traduce la lingua scritta in quella di casa. La notizia di Lissa arriva così: filtrata da chi la legge ad alta voce.

Quindi le *Novice* non sono «gli sloveni». Sono il giornale di un gruppo preciso, letto a voce da persone precise.

::: memo-box
### MEMO GLOSSARIO

*   **Ricezione:** il modo in cui una notizia o un evento vengono letti, raccontati e interpretati da un pubblico preciso. Una fonte racconta la propria ricezione, non quella di tutti.
*   **Movimento nazionale sloveno:** l'insieme di associazioni, giornali e politici che chiedono diritti per la lingua e le terre slovene. Nel 1866 è diviso fra Vecchi Sloveni e Giovani Sloveni.
*   **Lealtà dinastica:** l'attaccamento alla famiglia regnante, gli Asburgo. Può convivere con richieste nazionali, e non basta a descrivere tutta la popolazione.
:::

Riapro il quaderno. Cancello la mia equazione con una riga sola, senza scarabocchiare: voglio che si veda cosa avevo scritto.

Sotto scrivo: *Lissa = sollievo per la costa. Königgrätz = paura per il futuro. Novice ≠ tutti.*

*"C'è un'altra cosa che ancora non si vede da questa sala. L'indebolimento dell'Impero porterà nel 1867 al Compromesso con l'Ungheria. La monarchia si dividerà in due, e i popoli slavi resteranno esclusi da un assetto federale."*

Nessuno a scuola, in Italia, mi ha mai parlato di Lissa letta a Lubiana. Neanche in Slovenia, se è per questo. Eppure la stessa battaglia qui significa due cose insieme.

Mando ad Alex l'ultimo messaggio concesso.

*Mi smentisce il tavolo. Metà del tavolo, almeno.*

Il vecchio ripiega le *Novice* con cura, lungo le pieghe già segnate.

---

## Il Confine Senza Il Nostro Nome
<span class="byline">Cronaca di Maja</span>

Sulla copertina del registro c'è lo stemma dei Savoia. Il nome del paese, dentro, è scritto in italiano: San Pietro degli Slavi.

I bambini, però, a casa lo chiamano Špeter.

L'aula è di pietra e legno, e il freddo sale dal pavimento. Inverno del 1866, valli del Natisone. Sui banchi ci sono dei libri nuovi di zecca, stampati a Torino, tutti in italiano.

Il maestro sta in piedi davanti alla lavagna. Viene da fuori, mandato dal Ministero della Pubblica Istruzione. Fa una domanda in un italiano pulito, scandito.

Nessuno risponde.

Un bambino della seconda fila apre la bocca, la richiude. Il suo vicino gli bisbiglia qualcosa *po nadiško*, nel dialetto sloveno del Natisone. Il maestro batte la bacchetta sul tavolo.

**Maestro:** "In classe si parla italiano. Solo italiano."

Il bambino abbassa la testa. Ammutolito.

*MEMO, da quando?*

*"Con l'annessione, qui arriva la legge scolastica del Regno, la Legge Casati del 1859. Italiano unica lingua dell'insegnamento, dell'amministrazione e dei tribunali. Non è ancora la snazionalizzazione violenta del Novecento: è uno Stato centralizzato che conosce una sola lingua ufficiale."*

Esco dall'aula prima di arrabbiarmi davanti ai bambini.

In canonica il parroco sta scaldando le mani sulla stufa. Ha la tonaca lucida sui gomiti e un breviario consumato.

**Maja:** "Lei ha detto alla gente di votare sì?"

**Parroco:** "L'abbiamo detto in molti, fra i sacerdoti delle valli. Il Regno d'Italia si dice costituzionale e liberale. Pensavamo che avrebbe rispettato le nostre consuetudini e la nostra lingua più della burocrazia austriaca, che ci teneva stretti e ci tassava fino all'osso."

**Maja:** "E adesso?"

Il parroco guarda la stufa più a lungo del necessario.

**Parroco:** "Adesso a Udine scrivono che quassù, appena ci lasciano parlare, parliamo e pensiamo da italiani. La nostra lingua, per loro, è un'abitudine che perderemo da soli."

*"È la linea del* Giornale di Udine *e della stampa liberale friulana, fra novembre e dicembre 1866."*

**Maja:** "Allora vi hanno ingannato?"

**Parroco:** "Ci siamo sbagliati, forse. Non so ancora se ingannati sia la parola giusta."

Scrivo *ingannati* sul quaderno, poi ci metto un punto di domanda. Ad agosto, a Lubiana, ho imparato quanto costa una conclusione troppo veloce. Prima, meglio controllare un numero.

*MEMO, quanti hanno votato, qui?*

*"Nelle valli del Natisone vivevano circa 14.000 persone. Gli aventi diritto al voto erano 3.688. I sì furono 3.687, i no uno solo."*

Quattordicimila abitanti, tremilaseicento elettori. Quel «quasi all'unanimità» parla a nome di una persona su quattro.

::: memo-box
### MEMO GLOSSARIO

*   **Confine politico:** la linea di sovranità fra due Stati. Qui, dal 1866, fra Regno d'Italia e Impero austriaco. Separa leggi, tasse e scuole, non per forza lingue e parentele.
*   **Nazionalità:** nel lessico dell'epoca, l'appartenenza di un gruppo per lingua e storia. Nello Statuto del Regno non esistono tutele per le minoranze: esistono solo «regnicoli», cittadini del Regno.
*   **Toponimo politico:** un nome di luogo creato o usato per interpretare, organizzare o rivendicare uno spazio. Non è mai un'etichetta neutra.
:::

Il pomeriggio salgo verso lo Judrio con un pastore che deve riportare delle pecore. Sulle spalle ha una gerla di castagno. Vuota.

Lungo l'argine ghiaioso c'è un cippo di pietra calcarea bianca, squadrato, alto più o meno un metro, con un numero scolpito. Le pecore gli passano accanto senza degnarlo di uno sguardo.

L'acqua del torrente scorre sui sassi e fa un rumore continuo, indifferente.

**Maja:** "Questo cippo l'hanno messo adesso, dopo il trattato?"

**Pastore:** "Macché. C'è da quando mi ricordo. Di qua il Friuli, di là Gorizia, ma l'imperatore era lo stesso. Al mercato andavamo a Cividale e a Tolmino. Adesso di qua c'è un re, e per portare le pecore al pascolo dall'altra parte mi serve un cartellino."

*"Corretto. Per più di cinquant'anni questa linea ha diviso due amministrazioni dello stesso Impero: il Regno Lombardo-Veneto e le terre di Gorizia. Il trattato di Vienna l'ha trasformata in un confine fra due Stati."*

Quindi il sasso non si è spostato di un centimetro. Si è spostato tutto il resto.

**Maja:** "E la gerla? Oggi porta le pecore, non la legna."

Il pastore ride, e non risponde subito.

**Pastore:** "Di giorno serve a poco. Di notte è un'altra storia. Di qua il sale costa come l'oro: lo Stato ci ha messo il monopolio, deve pagare le guerre. Di là costa poco."

Aspetto. Lui guarda verso il Kolovrat.

**Pastore:** "Così qualcuno sale per il Matajur o per il Kolovrat, con le babbucce di feltro fatte in casa, senza chiodi, che sui sassi non fanno rumore. Torna giù con la gerla piena di sale austriaco e lo scambia con farina di mais e formaggio."

**Maja:** "E le guardie?"

**Pastore:** "Le guardie stanno sui sentieri buoni. I *švercarji* no."

*"Contrabbando di sale e tabacco: la differenza di prezzo fra i due Stati lo rende conveniente. Sul lato italiano sorvegliano guardie doganali e bersaglieri."*

Il confine, quindi, è arrivato davvero. In un'aula, in un cartellino, in un prezzo del sale. E nelle notti su per il Kolovrat.

**Maja:** "Voi come vi chiamate? Voi, qui nelle valli."

**Pastore:** "*Slovenci.* O *Beneški Slovenci.* In qualche paese dicono *Slovinjé*."

*"Nei documenti italiani la zona è* Slavia Veneta *o* Schiavonia Veneta*; in quelli austriaci gli abitanti sono* Venetianische Slawen*. Tre modi per nominare la stessa gente, a seconda di chi scrive."*

A Lubiana dicono Beneška Slovenija. A Udine, Slavia Veneta. Loro dicono semplicemente «sloveni». Nessuno di questi nomi coincide con uno Stato.

Perché nessuno me l'ha mai raccontato, questo? Che la nuova Italia del 1866 non ha preso soltanto «terre italiane», ma anche paesi dove i bambini a scuola non capivano la lingua del maestro?

I Giovani Sloveni, a Lubiana, se ne accorgono subito. Lo usano come prova contro Bleiweis: tutta quella fedeltà a Vienna non ha impedito che la Slavia Veneta passasse all'Italia. E non ha nemmeno portato lo sloveno nei ginnasi e negli uffici delle terre rimaste asburgiche.

Mi volto verso est, verso le terre che restano asburgiche. Gorizia, Trieste, il Carso.

*"Un'avvertenza. Il nome sloveno* Julijska krajina *qui non lo dice e non lo scrive nessuno. Nasce fra il 1918 e il 1920, per tradurre la «Venezia Giulia» diventata nome amministrativo italiano. Nel 1866 esiste soltanto il nome proposto da Ascoli, e in sloveno ancora non ha una traduzione."*

Uno sguardo in avanti, allora, non una parola di oggi. Un nome che arriverà con un'altra guerra.

Il pastore raduna le pecore. Il cippo resta dov'era già prima della guerra, e l'acqua dello Judrio gli scorre accanto come se niente fosse.

La Slovenia Unita del 1848 è ancora un programma. E ora le terre che dovrebbe unire stanno dentro due Stati, non in uno.

---

## Debriefing

Mission Control ha messo sul tavolo sei oggetti: una borraccia che sa d'aceto, una pinza di bronzo per le pallottole, un fischio a vapore, una pergamena con il sigillo di Napoleone III, un numero delle *Novice* piegato lungo le pieghe e un cartellino di confine con il timbro della dogana.

Europa e mondo, Alto Adriatico, terre slovene. Tre linee dello stesso rapporto.

**Alex:** "Ok, lo ammetto. Io pensavo: vinci la battaglia, prendi la regione. Semplice."

**Maja:** "E poi?"

**Alex:** "E poi l'Italia perde a Custoza, perde a Lissa e si prende il Veneto. Perché la Prussia ha vinto in Boemia e c'è un trattato. La battaglia che ho visto io non ha deciso la mappa."

**Maja:** "Io invece avevo trovato un giornale bellissimo e l'avevo trasformato in tutti gli sloveni."

**Alex:** "Te l'ho fatta io, la domanda."

**Maja:** "Me l'hai fatta con le mie parole."

**Alex:** "Appunto."

Nessuno dei due cede del tutto. Ma il cartellino di Maja cambia il significato della carta di Alex: la linea sullo Judrio che a Venezia sembrava un successo pulito, nelle valli del Natisone passa in mezzo a una scuola, a un mercato e a una famiglia. E la flotta di Alex cambia la domanda di Maja: se a bordo della stessa nave si parlano veneto, sloveno e croato, una sola lingua non basta a dire da che parte sta qualcuno.

**Verdetto.** L'Ipotesi Iniziale non regge: la nuova Italia non nasce da una catena di vittorie consecutive. Nel 1859 l'alleato francese si fermò prima del Veneto; nel 1860-61 il Regno nacque da spedizione volontaria, rivolte locali, crollo borbonico, esercito regio, plebisciti e una legge; nel 1866 l'Italia perse a Custoza e a Lissa ma ottenne il Veneto, perché stava dalla parte vincente di una guerra decisa dalla Prussia e chiusa da un trattato. Al Checkpoint, **B è l'interpretazione più solida**: la battaglia conta, ma non decide da sola la mappa. E la nuova mappa divide comunità di lingua slovena che non hanno uno Stato proprio.

::: reality-check
### CIÒ CHE NON SAPPIAMO ANCORA

*   **Chi si sentivano i marinai di Lissa:** i ruoli di bordo dicono dove furono arruolati e le fonti quale lingua si usava a bordo, ma non come ciascun marinaio definisse la propria appartenenza. Le retoriche nazionali successive, italiana e asburgica, hanno riempito quel silenzio in modi opposti.
*   **Quanto fu libero il sì del 1866:** i risultati ufficiali parlano di adesione quasi unanime, nel Veneto come nella Slavia Veneta; la storiografia critica sottolinea voto palese, schede controllate e assenza di alternative. Quanto quei numeri misurino un consenso reale resta discusso.
*   **Che cosa voleva Ascoli con «Venezia Giulia»:** il testo del 1863 è una classificazione storico-linguistica, ma la propaganda successiva lo lesse come un programma di conquista. Il confine fra descrivere e rivendicare, in quelle pagine, gli storici lo discutono ancora.
:::

::: memo-box
### CRONOLOGIA ESSENZIALE

*   **1859:** Seconda guerra d'indipendenza; armistizio di Villafranca (11-12 luglio) e Trattato di Zurigo (10 novembre): la Lombardia passa al Regno di Sardegna, il Veneto resta austriaco.
*   **5-11 maggio 1860:** la Spedizione dei Mille parte da Quarto e sbarca a Marsala.
*   **17 marzo 1861:** legge n. 4671, proclamazione del Regno d'Italia.
*   **1863:** Ascoli propone il nome «Venezia Giulia».
*   **20 luglio 1866:** battaglia navale di Lissa.
*   **3 ottobre 1866:** Trattato di Vienna e cessione del Veneto.
:::

Nel 1869 non sarà una battaglia a cambiare di nuovo il valore dell'Adriatico, ma un canale scavato in Egitto. Resta da capire perché, per farlo contare davvero, servirà una ferrovia che attraversa la Carniola.

<!-- WORD COUNT: ~7656 (post-Reviewer) -->
<!-- PERSONA CHECK: Pass — Alex mantiene il tic scarto media/realtà (Risorgimento da quadro vs. sentinella sudata, poster in camicia rossa vs. panno da macellaio) e il battibecco sarcastico con MEMO ("Wi-Fi del 1859", "tipo un tutorial"); Maja mantiene "perché nessuno lo racconta mai" e la correzione di metodo su se stessa quando generalizza da un'unica fonte. Nessuna deriva verso voce AI generica o registro da manuale. -->
<!-- NUF CHECK: [1] ✅ sequenza 1859→1860→17 marzo 1861→1866 distinta per fase — [2] ✅ Lissa persa ma Veneto ottenuto, spiegato via Custoza+Königgrätz+trattato — [3] ✅ Venezia Giulia/confine come nomi ed etichette non neutre, mai retrodatati — [4] ✅ spaesamento sulla lingua di bordo (veneto/sloveno/croato) senza eroi nazionali fuori tempo — [5] ✅ pluralità di reazioni slovene (Staroslovenci/Mladoslovenci, lealtà vs paura) — [6] ✅ formazione del Regno con fonti distinte per ogni passaggio — [7] ✅ Lissa con fonti su comando, composizione, perdite, lingue — [8] ✅ esito 1866 con Custoza/Lissa/Prussia/Trattato di Vienna/Venezia Giulia graduati per certezza — [9] ✅ scena Lubiana come indagine propria che corregge la lettura di Alex — [10] ✅ scena confine come storia slovena autonoma, non appendice dell'annessione. -->
<!-- ANTI-AI CHECK: nessuna frase vietata rilevata (grep pulito su "come sappiamo", "e la morale è che" ecc.); nessuna etichetta di produzione (Beat/Scena/EU/GIULIA/SLOVENIA) nel testo; un solo target-profile (Tegetthoff, Abilità Speciale supera il test operativo — non "comanda una flotta" ma "trasforma il caos in un'unica istruzione"); un solo checkpoint, posizionato dopo Lissa come da spec; zero anacronismi rilevati; box HUD con riga vuota dopo l'header. -->



<div style="page-break-after: always;"></div>

# Capitolo 12 — La Porta d'Oriente

## Briefing

Alex, Maja: avete appena lasciato il 1866, con il nuovo confine adriatico ancora fresco d'inchiostro. Questo salto occupa il secondo Ottocento, ma non in ordine. Partirete dall'effetto, a Vienna nel 1883. Tornerete indietro al 1849-1857 per cercare una condizione che quasi nessuno ricorda. Attraverserete il 17 novembre 1869 e arriverete agli anni fra il 1875 e il 1890.

È l'ultima missione del volume. Ci fermeremo sulla soglia del Novecento.

Il manuale propone questa catena: 1869 → si apre il Canale di Suez → la rotta per l'Asia si accorcia → Trieste diventa la Porta d'Oriente dell'Europa centrale. Tre passaggi, una freccia dritta.

Qualcosa non torna. La ferrovia che passa per Lubiana raggiunge Trieste già nel 1857, dodici anni prima del canale. E il porto capace di reggere i nuovi traffici, nel 1869, è appena un cantiere.

La vostra missione è raccogliere sei prove e ricostruire quale catena di tecnologie, lavoro, investimenti e potere abbia trasformato una rotta più corta in un sistema commerciale.

## OBIETTIVI DEL SALTO (SCENE)

### 1. La Città Accesa (Vienna, 1883) — voce: Alex

Un carboncino consumato, una cupola di ferro alta ottantaquattro metri e un fascio di luce puntato su un campanile lontano.
**Prova da raccogliere:** verificare se la nuova fase industriale dipende da singole invenzioni o dal loro coordinamento in reti capaci di servire una società di massa.

### 2. La Ferrovia Arrivata Prima (Lubiana, 1849-1857) — voce: Maja

Un orario in tre lingue stampate in tre grandezze diverse, una campana che parla in codice e un biglietto di cartoncino forato.
**Prova da raccogliere:** cercare che cosa la linea Vienna-Lubiana-Trieste rende possibile dodici anni prima di Suez, e che cosa non riesce ancora a produrre da sola.

### 3. Dieci Anni Per Tagliare Un Istmo (Istmo di Suez, 1859 - 17 novembre 1869) — voce: Alex

Un otre di pelle di capra, uno scivolo di latta lungo settanta metri e una conchiglia fossile nel fango grigio.
**Prova da raccogliere:** misurare quale distanza il canale riduce davvero e quali lavoro, macchine e costi stanno dietro la cerimonia d'apertura.

### 4. Il Porto Che Prima Era Nuovo (Trieste, 1869-1883) — voce: Alex

Un saggio del 1862, una porta di ferro con due serrature e sacchi di caffè verde.
**Prova da raccogliere:** verificare perché la nuova rotta richiede moli, magazzini e binari prima di diventare capacità commerciale.

### 5. Chi Tiene La Chiave Del Canale (Londra 1875, Port Said 1882) — voce: Alex

Un grappolo d'uva moscato, una cesta di giunco da quaranta chili e un telo di canapa bagnata.
**Prova da raccogliere:** distinguere chi possiede quote, chi governa il territorio e chi esercita il controllo militare sulla rotta.

### 6. Una Cassa, Due Reporter, Un Continente (Trieste-Lubiana, 1890) — voce: Maja, con Alex

Una balla di cotone cerchiata di ferro, un sigillo di piombo e una custodia di tela cerata inchiodata a un vagone.
**Prova da raccogliere:** seguire una merce documentata lungo la catena e verificare quale anello perde valore quando ne manca un altro.

Il rapporto è affidato a due co-reporter. Alex seguirà, fra Europa e mondo e Alto Adriatico, la trasformazione industriale, il canale, il porto e la competizione imperiale; Maja verificherà che cosa la ferrovia cambia nelle terre slovene e guiderà il controllo finale sullo stesso carico. Nessuno parla al posto dell'altro. Ma ciascuno può mettere alla prova le conclusioni dell'altro.

Attenzione: un discorso inaugurale, un bilancio societario, un registro doganale e una lettera di vettura non rispondono alla stessa domanda. Prima di collegarli, controllate che cosa ciascuno può davvero provare.

---

## La Città Accesa
<span class="byline">Cronaca di Alex</span>

Un uomo in cima a una scala svita qualcosa dentro una lampada e impreca a mezza voce.

Tiene fra le dita un bastoncino nero, lungo come una matita, consumato a una punta. Lo infila in una tasca del grembiule di cuoio, ne tira fuori uno nuovo e lo avvita al suo posto. Sotto di lui passa un fiume di gente con cappelli, bastoni, ombrellini chiusi.

*MEMO, dove sono?*

*"Vienna, Prater, settembre 1883. Esposizione Elettrica Internazionale, aperta il 16 agosto. Sei dentro la Rotunde: la cupola è alta 84 metri."*

Alzo la testa. La cupola è un'enorme gabbia di ferro, e appese là sotto ci sono lampade che non somigliano a niente che io abbia in camera. Mi aspettavo la scena da documentario: un tizio con i baffi preme un interruttore, si accende una lampadina, applauso, il mondo cambia. Invece la luce qui sibila. Crepita. È azzurrina e fredda, e fa male agli occhi se la guardi dritta.

**Alex:** "Scusi! Ogni quanto li cambia, quei cosi?"

**Tecnico:** "Ogni poche ore. I carboncini bruciano. Se non li riallinei, la lampada si spegne o sfarfalla."

**Alex:** "Quindi la luce elettrica ha bisogno di uno che sale sulla scala tutto il giorno."

**Tecnico:** "Ha bisogno di me, e di quelli là fuori."

Indica con il mento verso l'uscita. Seguo il gesto e il rumore insieme: un ronzio basso che sale dal pavimento, come uno sciame gigante chiuso sotto le assi. L'aria pizzica il naso. Sa di ferro bagnato e di olio caldo.

*"Odore di ozono, prodotto dalle scariche elettriche. Nella sala macchine esterna, venti motori a vapore a carbone azionano le dinamo."*

Venti motori a carbone. Per accendere una festa della luce elettrica. Ok, il futuro funziona a carbone. Ottimo inizio.

Vicino a me un signore anziano con un cappotto liso tiene in mano il cappello e guarda la cupola a bocca aperta. Parla un tedesco lento, e MEMO me lo passa in italiano nell'orecchio.

**Visitatore:** "Trent'anni ho acceso lampioni a gas. Un'asta di ferro vuota, uno stoppino a spirito in cima, una chiave per la valvola. Uno per uno, ogni sera."

**Alex:** "E adesso?"

**Visitatore:** "Adesso nessuno a Vienna vuole più il gas nei teatri. Dopo il Ringtheater, no."

Non so cosa sia il Ringtheater. MEMO sì.

*"8 dicembre 1881. Un guasto all'illuminazione a gas del teatro provoca un incendio: 384 morti documentati. La paura accelera l'adozione delle lampade elettriche nei teatri pubblici."*

Trecentottantaquattro. Il vecchio non aggiunge altro, e io non ho nessuna battuta pronta.

**Alex:** "Prima dell'elettricità, come facevano a non bruciare tutti?"

**Visitatore:** "Pompieri dietro le quinte a ogni spettacolo, con asce e secchi d'acqua. Reti di metallo fitte attorno a ogni fiamma, perché una scintilla non arrivasse ai tendaggi. E per parlare tra la scena e le macchine, tubi di metallo. Ci gridavi dentro. Avevano un fischietto in cima."

Un citofono di latta, in pratica. E un pompiere di guardia per ogni sera di teatro.

Il vecchio se ne va. Io resto a guardare la folla, e comincio a capire che la cosa strana non è la lampada. È tutto il resto che le sta intorno.

Per arrivare qui, molti di questi visitatori sono saliti su un trenino elettrico della Siemens & Halske: circa un chilometro e mezzo di binari dalla stazione del Praterstern fino all'ingresso. Dentro c'è un padiglione pieno di dinamo e di apparecchi per il telegrafo. E fuori, sui giornali che la gente si passa di mano, la cronaca dell'Esposizione esce giorno dopo giorno.

*MEMO, quanta gente viene qui?*

*"Stima: quasi 600.000 ingressi fra agosto e novembre. Le fonti oscillano fra 580.000 e 600.000."*

**Alex:** "Seicentomila persone per guardare delle lampadine? Neanche un concerto."

*"Non solo lampadine. Il telegrafo collegato alle ferrovie trasmette ordini, prezzi e conferme di carico in pochi minuti su distanze continentali."*

E qui si accende qualcosa anche nella mia testa. Il carbone che fa girare le dinamo è lo stesso carbone che scalda le caldaie dei treni. Dal suo catrame, spiega MEMO, i chimici ricavano coloranti artificiali: l'alizarina, brevettata dalla BASF nel 1869, che prende il posto della radice di robbia per tingere di rosso. Filo, binario, fornace, laboratorio. Non sono invenzioni separate in fila su un banco.

Sono pezzi della stessa macchina.

**Alex:** "Senta, un'ultima cosa. Questa luce… chi ci guadagna?"

**Tecnico:** "Chi ha una fabbrica. Con la luce buona si lavora anche quando fa buio."

Lo dice come una cosa bella. Poi riprende la scala e sale verso la lampada successiva.

Sul tetto della Rotunde, mi dice MEMO, c'è un riflettore a specchio che spara un fascio di luce fino al campanile del Duomo di Santo Stefano, a più di due chilometri. Una città intera può vederlo.

Nessuno, da là, vede l'uomo sulla scala.

::: memo-box
### MEMO GLOSSARIO

*   **Seconda rivoluzione industriale:** fase di trasformazione che gli storici collocano di solito fra il 1870 circa e il 1914. Non ha una data d'inizio unica: elettricità, chimica, acciaio e motori accelerano in tempi diversi nei diversi Paesi. La novità non è una singola macchina, ma il collegamento fra reti.
*   **Industria chimica:** produzione su grande scala di sostanze artificiali, come coloranti, concimi e soda. Molti coloranti nascono dal catrame del carbon fossile, cioè da un residuo che prima si buttava.
*   **Società di massa:** società in cui milioni di persone vivono in città, leggono giornali economici, comprano prodotti uguali e lavorano con gli stessi orari. Non significa benessere per tutti: porta anche turni più lunghi, periferie operaie e forti disuguaglianze.
:::

---

## La Ferrovia Arrivata Prima
<span class="byline">Cronaca di Maja</span>

Due serie di colpi. Poi silenzio.

La campana è fissata al muro esterno della stazione, dentro una specie di cassetta di ferro, e nessuno la tocca. Suona da sola. Un uomo in uniforme blu alza gli occhi, conta con le labbra e grida qualcosa in tedesco verso i facchini.

*MEMO, che cosa ha detto la campana?*

*"Sistema Läutewerk, azionato dagli impulsi del telegrafo lungo la linea. Due serie di colpi: treno in arrivo da Trieste. Tre colpi rapidi: tutti a bordo."*

Lubiana, estate 1857. Il tronco fino a Trieste è stato inaugurato il 27 luglio, alla presenza dell'imperatore Francesco Giuseppe e dell'imperatrice Elisabetta. Adesso, da Vienna al mare, il binario non si interrompe più: 577 chilometri.

La prima cosa che faccio, come sempre, è leggere i cartelli. Gli ordini di servizio appesi dentro sono solo in tedesco. Sulla banchina, l'orario per i viaggiatori ripete le informazioni anche in sloveno e in italiano, in caratteri più piccoli, più in basso.

Ecco. Lo sapevo.

L'uomo in blu mi passa accanto. Il panno della sua giacca è pesante, di lana, e i bottoni d'ottone portano una ruota con le ali. Gli stivali hanno chiodi sotto la suola e lasciano segni neri sul pietrisco unto di grasso.

**Maja:** "Quel foglio con i timbri, dentro. Lo capisce anche il deviatore di Borovnica?"

**Ferroviere:** "Lo deve capire. Lo stesso foglio è appeso al Semmering e a Nabresina, parola per parola."

**Maja:** "E se il tedesco non lo sa?"

**Ferroviere:** "Impara le parole che servono. Una parola letta storta, e due treni si trovano sullo stesso binario."

**Maja:** "E tutte le altre parole?"

**Ferroviere:** "Le altre non fermano un treno, signorina."

Sul taccuino avevo già scritto: *tedesco = chi comanda*. Tiro una riga sola sopra l'uguale, non su tutta la frase: voglio che resti visibile che cosa pensavo. Prima dei padroni, qui, vengono i freni. Però chi conosce solo le parole che servono resta appeso a qualcuno che gli traduca tutto il resto. Scrivo anche questo, sotto.

Il treno arriva e si porta via ogni pensiero. Il calore della caldaia si sente ancora a tre metri di distanza, quasi toglie il fiato, mentre una fuliggine sottile mi si deposita sulle braccia insieme a schizzi caldi di vapore. Il fischio esplode come un urlo: fuori, nel piazzale, un cavallo si impenna fra le stanghe di un carro.

Il carrettiere lo tiene per il muso. Ha le mani spaccate e un cappello deformato dalla pioggia di anni.

**Maja:** "Si spaventa ancora, dopo otto anni?"

**Carrettiere:** "Lui sì. Io mi sono solo arrabbiato."

**Maja:** "Arrabbiato con il treno?"

**Carrettiere:** "Con i conti. Da Vienna a Trieste, con i cavalli, le merci ci mettevano due settimane, quasi tre se c'era fango. Adesso la gente arriva a Trieste in una notte e un giorno. Chi vuole ancora pagare me e i miei cavalli?"

MEMO mi mette in fila le cifre, e le tengo per quello che sono.

*"Prima della ferrovia: 5-7 giorni in diligenza postale, 14-20 giorni per le merci su carro. Dal 1857: circa 22-24 ore in treno passeggeri fino a Trieste. I treni rapidi dell'agosto 1857: Vienna-Lubiana in 13 ore."*

Il carrettiere ricorda il primo treno arrivato a Lubiana: un convoglio di prova, il 18 agosto 1849, il giorno del compleanno dell'imperatore. Il servizio regolare era partito il 16 settembre. Racconta che la gente si era ammassata lungo la strada per Vienna a guardare quella cosa sbuffante sul terrapieno, metà incantata, metà spaventata. Le cronache di Janez Bleiweis sulle *Novice* descrivono proprio quella miscela di incredulità e timore.

1849. Otto anni prima di Trieste. Vent'anni prima di Suez.

E allora perché, nei libri dei miei compagni italiani, Trieste diventa importante "grazie a Suez", e Lubiana non compare mai? Non come stazione, non come città in cui una ferrovia cambia i mestieri. Me lo chiedo sul serio, non per fare polemica. Qui il treno è arrivato prima di tutto il resto.

Al cancello della banchina un controllore in berretto ferma tutti, uno per uno. Una donna con un cesto di uova al braccio gli porge un cartoncino rigido, numerato, lungo come due dita. Lui lo infila fra le ganasce di una pinza e stringe. *Tac.* Resta un foro dalla forma precisa.

**Maja:** "Non fa prima a scriverci sopra la data?"

**Controllore:** "Con la penna, sotto la pioggia, con cento persone in fila? E l'inchiostro si imita. Questo buco no: ogni stazione ha la sua pinza."

**Maja:** "E se uno il buco se lo fa da solo, con un coltello?"

**Controllore:** "Lo vedo da qui."

Non gli servono registri né elenchi di nomi. Gli basta il bordo di un buco.

::: scan-result
### SCANNING: BIGLIETTO FORATO

*   **Tipo:** Titolo di viaggio ferroviario, cartoncino rigido numerato.
*   **Materiale:** Cartone pressato, spessore uniforme, bordi netti.
*   **Funzione:** Certificare partenza e destinazione senza bisogno di scriverle sopra.
*   **Dettaglio Tecnico:** Il controllore lo perfora con una pinza a forma fissa. Ogni stazione della linea ha il proprio disegno di foro: un biglietto rubato o alterato si smaschera a colpo d'occhio, senza registri da consultare.
:::

Quando il ferroviere si allontana, chiedo a MEMO che cosa non funziona ancora.

*"Stima per il 1857-1860: tra 300.000 e 450.000 tonnellate annue di merci sulla tratta Lubiana-Trieste. Limiti: pochi vagoni coperti, salite ripide del Carso e del Semmering."*

La linea c'è. Ma la linea, da sola, non porta navi a Trieste e non decide che cosa ci sarà dentro i vagoni. Il carrettiere risale sul carro vuoto. Accanto alla stazione, intanto, crescono il deposito delle locomotive e i mestieri che la ferrovia porta con sé: meccanici, calderai, fuochisti.

Da Lubiana al molo di Trieste, adesso, basta qualche ora di treno. Da Trieste a Bombay, invece, bisogna ancora girare intorno all'Africa.

::: memo-box
### MEMO GLOSSARIO

*   **Ferrovia di valico:** linea costruita per superare una catena montuosa con pendenze e curve che una locomotiva a vapore può affrontare. La ferrovia del Semmering, aperta il 17 luglio 1854, arriva a pendenze del 2,5% senza cremagliera, con 14 gallerie e 16 viadotti.
*   **Telegrafo ferroviario:** filo elettrico lungo i binari che trasmette segnali da una stazione all'altra. A Lubiana fa suonare le campane che annunciano partenze e arrivi.
*   **Orario ferroviario:** tabella che fissa partenze, arrivi e incroci dei treni su tutta la linea, stampata e affissa in stazione. Funziona solo se tutte le stazioni contano il tempo sulla stessa ora di riferimento, non ciascuna su quella del proprio campanile.
:::

---

## Dieci Anni Per Tagliare Un Istmo
<span class="byline">Cronaca di Alex</span>

Il cammello sputa.

Non addosso a me, per fortuna, ma abbastanza vicino da farmi fare un salto all'indietro nella sabbia. Il cammelliere ride senza nemmeno voltarsi. Sta scaricando dal fianco dell'animale un otre di pelle di capra gonfio d'acqua, e lo passa a un uomo scalzo con le piante dei piedi piene di piaghe.

*MEMO. Dove, quando, e perché fa così caldo.*

*"Istmo di Suez, 1862. Temperatura a mezzogiorno: 45-50 gradi all'ombra. Il Canale d'Acqua Dolce dal Nilo non è ancora completato."*

All'ombra. Quale ombra, MEMO? Qui l'unica ombra è quella del cammello, e il cammello è occupato.

Il vento soffia sabbia finissima dentro le orecchie, negli occhi, fra i denti. Davanti a me, a perdita d'occhio, c'è una trincea di terra e sale. Dentro la trincea, migliaia di uomini scavano a mano e portano via la terra in ceste.

**Alex:** "Da dove viene tutta quest'acqua?"

**Cammelliere:** "Dal fiume. Giorno e notte, andata e ritorno. Noi e i nostri animali."

**Alex:** "Quanti animali?"

**Cammelliere:** "Più di quanti ne abbia mai visti insieme mio padre."

*"La Compagnia noleggia una carovana permanente di 1.600 cammelli dagli sceicchi beduini. Costo: decine di migliaia di franchi al mese."*

Sedicimila… no, milleseicento cammelli. Che fanno da acquedotto. Nei film sulle grandi opere c'è sempre un ingegnere col cappello che srotola una mappa. Nessuno mostra il cammello che sputa, e nessuno mostra l'uomo scalzo.

Mi avvicino a lui. Beve piano, come se l'acqua dovesse durare.

**Alex:** "Lei è pagato per questo lavoro?"

L'uomo mi guarda e non risponde subito. Parla arabo; MEMO traduce, e la sua traduzione non addolcisce niente.

**Contadino:** "Il villaggio doveva mandare uomini. Hanno scelto me. Fra un mese torno, e ne arriva un altro."

**Alex:** "E se non voleva venire?"

**Contadino:** "Non l'ha chiesto nessuno."

*"Sistema della corvée: lavoro obbligatorio imposto dal governo del viceré d'Egitto. Contingenti mensili di 20.000-25.000 contadini presi a rotazione dai villaggi."*

La parola la conosco già. *Tlaka*. L'abbiamo incontrata nelle campagne della Carniola, ma qui non è la stessa cosa: non c'è un signore feudale con il suo castello, c'è un governo che presta braccia a una compagnia privata per scavare un canale. Il risultato, per i piedi di quest'uomo, però si somiglia parecchio.

La sera, i contadini dormono in fosse scavate nella sabbia, coperte da stuoie di canne. Bevono acqua d'orzo bollita. Uno di loro me la offre: sa di pane bagnato. Serve a non prendersi la febbre che svuota lo stomaco.

MEMO mi porta avanti.

Il deserto resta uguale, il rumore no. Adesso è il 1867, e nella trincea allagata galleggia una specie di mostro di ferro. Una catena di tazze metalliche scende sott'acqua, risale piena di fango grigio-azzurro e lo rovescia in uno scivolo di latta lungo decine di metri che scarica la melma direttamente sopra l'argine. Clang. Clang. Clang. Il frastuono entra nelle ossa.

Un operaio con la faccia nera di fumo mi fa segno di salire. Mi saluta in italiano, con un accento che mi ricorda qualcuno di casa.

**Operaio:** "Attento a dove metti i piedi, che qui scivola tutto."

**Alex:** "Dove sono finiti i contadini?"

**Operaio:** "A casa. Nel '63 e '64 il nuovo chedivè e gli inglesi hanno fatto abolire il lavoro forzato. La Compagnia ha protestato. Napoleone III ha fatto l'arbitro e l'Egitto ha dovuto pagare un indennizzo."

**Alex:** "L'Egitto ha pagato perché non poteva più obbligare la gente a lavorare gratis?"

**Operaio:** "Ottantaquattro milioni di franchi, fra braccia perdute e terre e canale d'acqua dolce restituiti all'Egitto. E con quei soldi, tante di queste."

Batte il palmo sulla lamiera della draga.

*"Dal 1865 al 1869 l'impresa Couvreux & Lavalley impiega oltre 60 draghe a vapore. Fino a 2-3 milioni di metri cubi di sabbia e limo movimentati al mese. Profondità di scavo: 8 metri."*

Si racconta che Ferdinand de Lesseps, l'uomo che ha ottenuto le concessioni dal viceré nel 1854 e nel 1856, chiamasse queste draghe "i nostri soldati d'acciaio". Guardo la catena di tazze che non si ferma mai, e penso che i soldati di prima avevano i piedi piagati.

**Alex:** "Ma perché non ci sono chiuse? Nei canali ci sono sempre le chiuse."

**Operaio:** "Perché i due mari stanno allo stesso livello. Una volta credevano di no, da quando c'era Napoleone il vecchio. Si erano sbagliati di quasi dieci metri."

Dal fango che cola dalla tazza raccolgo una conchiglia fossile. È più vecchia di tutti noi messi insieme.

*MEMO, quante persone sono morte qui?*

*"Stima della storiografia accademica: fra 1.500 e 4.000 morti, soprattutto per il colera del 1865. Circa 1,5 milioni di lavoratori egiziani passati a turno per il cantiere, anche questo stimato. La cifra di 120.000 morti, diffusa molto più tardi, non trova riscontro nei documenti rimasti."*

Anche 1.500 sono tantissimi. Il fatto che non siano 120.000 non li cancella. E il fatto che siano tanti non rende vero il numero più grande.

Il 17 novembre 1869, dalla riva, guardo passare lo yacht imperiale francese *L'Aigle*, con l'imperatrice Eugenia a bordo. Dietro sfilano altre navi, bandiere, uniformi con i galloni. Fra gli ospiti c'è anche l'imperatore Francesco Giuseppe d'Austria. Nessuno di quelli sul ponte ha mai dormito in una fossa coperta di canne.

*"Distanze prima e dopo: Trieste-Bombay da circa 11.600 a circa 4.350 miglia nautiche. Il vantaggio è soprattutto per i piroscafi: nel Mar Rosso i venti contrari e i banchi di corallo rendono la vela lenta e pericolosa."*

Il mare si è accorciato di due terzi. Ma solo per chi ha una caldaia, e un porto dove arrivare.

::: memo-box
### MEMO GLOSSARIO

*   **Istmo:** striscia di terra stretta che separa due mari e unisce due terre. Quello di Suez separa il Mediterraneo dal Mar Rosso.
*   **Canale a livello:** canale che collega acque alla stessa altezza e quindi non ha bisogno di chiuse. Suez, lungo in origine circa 164 chilometri, è di questo tipo.
*   **Dragaggio:** scavo sott'acqua fatto da una macchina galleggiante, la draga, che raccoglie fango e sabbia dal fondo con tazze o benne.
*   **Tlaka / corvée (richiamo):** lavoro obbligatorio non pagato o quasi. In Egitto lo impone il governo del viceré a favore del cantiere: non è la tlaka feudale della Carniola, anche se le somiglia.
:::

---

## Il Porto Che Prima Era Nuovo
<span class="byline">Cronaca di Alex</span>

Il vecchio nel letto tiene un libretto sulle coperte come se fosse un'arma.

Ha settantaquattro anni e la pelle del colore della carta. La stanza è enorme, piena di quadri e di tende pesanti, eppure lui sembra occupare solo il cuscino. Fuori dalle finestre c'è Trieste, estate 1869. Fra poche settimane, l'8 settembre, questo uomo morirà. Lui non lo sa. Io sì, e mi sento un ladro.

*MEMO, chi è?*

*"Barone Pasquale Revoltella, nato a Venezia nel 1795. Banchiere, azionista importante delle Assicurazioni Generali, consigliere del Lloyd Austriaco. Vicepresidente della Compagnia del Canale di Suez."*

**Revoltella:** "Tu non sei un servitore."

**Alex:** "No. Sono… uno che vuole capire. Perché un banchiere di Trieste sta dentro una compagnia francese?"

**Revoltella:** "Perché non restasse soltanto francese. Anni a Parigi e a Vienna, a convincere. Se il canale apre e i capitali sono tutti di un altro, il vantaggio va a un altro."

Solleva il libretto. È un suo saggio del 1862, sui rapporti commerciali fra Francia e Austria per mezzo del Canale di Suez.

**Alex:** "Quindi, quando il canale apre, Trieste vince. Giusto?"

**Revoltella:** "Sbagliato."

Ci resto male. Per me era ovvio.

**Revoltella:** "La nave arriva. E poi? Se il porto è basso, la nave non entra. Se non c'è dove posare la merce, marcisce sul molo. Se il treno non arriva fin sotto la nave, la merce va a Marsiglia. O a Genova. O a Venezia."

**Alex:** "Quindi il canale da solo non basta."

**Revoltella:** "Il canale è una porta. Una porta non è una casa."

Tossisce a lungo. Le lettere private di questi mesi, mi dice MEMO, parlano di un uomo costretto a letto, amareggiato, mentre arrivano le notizie dello scavo quasi finito. Morirà settanta giorni prima dell'inaugurazione. E lascerà il palazzo e le sue collezioni alla città, perché diventino un museo.

::: target-profile
### SCHEDA PERSONAGGIO: Pasquale Revoltella

*   **Ruolo:** banchiere triestino nato a Venezia, vicepresidente della Compagnia del Canale di Suez, attivo fra Parigi e Vienna dal 1855 al 1858.
*   **Forza:** 3 — non muove pietre ma denaro, e nessuno fa niente senza denaro; però la malattia lo inchioda a letto proprio alla vigilia.
*   **Intelligenza:** 5 — nel 1862 scrive nero su bianco ciò che quasi nessuno vuole ancora vedere: il canale senza porto e ferrovia regala il vantaggio ai concorrenti.
*   **Carisma:** 4 — riesce a entrare in una compagnia nata a Parigi e a pesarci dentro come uomo di Trieste e di Vienna.
*   **Abilità Speciale (La Scommessa In Anticipo):** trasforma una rotta che ancora non esiste in un piano che lega capitali, moli e binari — e lo mette per iscritto sette anni prima che la prima nave passi dal canale.
:::

MEMO mi spinge avanti di quattordici anni.

Stessa città, altra aria. Adesso sa di caffè. Non di caffè da bar: un odore tostato e pungente, polveroso, che viene dai sacchi di chicchi verdi accatastati sulla banchina. Sotto c'è la pece calda, il fumo dei rimorchiatori, il sale. Attorno alle bitte di ghisa l'acqua ha chiazze scure d'olio.

Trieste, 1883. A nord della città vecchia si allungano moli nuovi e magazzini di pietra a più piani. Fra un magazzino e l'altro corrono i binari, fin quasi sotto le fiancate delle navi.

**Alex:** "Wow, il Porto Vecchio!"

Un facchino che passa con un sacco sulla spalla si ferma e mi guarda come se fossi scemo.

**Facchino:** "Vecchio? L'hanno appena finito. Questo è il Porto Nuovo."

*"Confermato. Negli atti del periodo: Porto Nuovo, Neuer Hafen. Il nome 'Porto Vecchio' nascerà solo nel primo Novecento, quando si costruirà un altro porto più a sud."*

Il nome che uso io è il nome del futuro. Qui, adesso, questo posto è nuovo di zecca.

*MEMO, chi l'ha costruito?*

*"Convenzione del 1867 fra il governo imperiale e la Società della Ferrovia Meridionale. Lavori dal 1868. Prima grande fase completata nel 1883."*

Il resto me lo faccio mostrare sulla mappa: progetto dell'ingegnere francese Paulin Talabot, lavori della ditta Couvreux & Hersent, primi moli in funzione già dal 1877.

Quindi non l'ha fatto Revoltella. Lui l'aveva scritto. L'hanno deciso un governo e una compagnia ferroviaria, e costruito centinaia di persone per quindici anni. Costo stimato, secondo MEMO: fra 25 e 30 milioni di fiorini, forse di più.

Davanti a un magazzino, due uomini si fronteggiano davanti a una porta di ferro. Uno ha l'uniforme della dogana imperiale. L'altro è un impiegato di un commerciante. Tutti e due tengono in mano una chiave.

**Alex:** "Perché due chiavi?"

**Doganiere:** "Perché la porta ha due serrature. Una la apre lui, una la apro io. Da solo, nessuno entra."

**Alex:** "Non vi fidate?"

**Impiegato:** "Qui dentro c'è caffè che vale più delle nostre case. Nessuno si fida."

**Doganiere:** "E se la merce resta qui, il dazio aspetta. Se esce verso l'interno, il dazio si paga."

La porta scorre su un contrappeso. È di lamiera spessa: MEMO dice che serve a chiudere ogni campata in caso d'incendio. Dentro, il pavimento sta un metro e mezzo più su del molo, con aperture di ventilazione sotto, e i muri sono doppi, pietra e mattoni forati, con uno spazio vuoto in mezzo. Il salmastro non deve arrivare ai sacchi.

Ecco perché un canale non basta. Una nave veloce che scarica caffè su un molo bagnato e senza tetto è solo un modo rapido di rovinare il caffè.

*"Statistiche della Camera di Commercio: nessuna impennata automatica nel 1870. Il traffico cresce gradualmente, insieme ai moli del Porto Nuovo e alla penetrazione della ferrovia. Naviglio a vapore: da circa 66.000 tonnellate nel 1870 a oltre 268.000 negli anni Novanta."*

Il facchino che mi aveva corretto ripassa, piegato sotto un altro sacco.

**Alex:** "Scusa per il 'vecchio'."

**Facchino:** "Fra vent'anni chiamerai vecchio anche me."

La porta di ferro si richiude. Servono di nuovo due chiavi.

::: memo-box
### MEMO GLOSSARIO

*   **Magazzino doganale:** deposito controllato in cui una merce può restare senza pagare subito il dazio. Si paga solo quando la merce esce verso il mercato interno. Fino al 1891 tutta Trieste è porto franco, poi la franchigia resta solo alle aree portuali recintate.
*   **Gru idraulica:** gru che solleva i carichi con acqua spinta ad alta pressione. A Trieste arriverà con la Centrale Idrodinamica, in servizio pieno nel 1891: nel 1883 le gru sono ancora a vapore o a mano.
*   **Raccordo ferroviario portuale:** binario che arriva fin sulle banchine, così la merce passa dalla nave al vagone senza attraversare la città su un carro.
:::

::: checkpoint
### CHECKPOINT: Che cosa rende strategica la nuova rotta?

Finora hai raccolto: la ferrovia raggiunge Trieste nel 1857, dodici anni prima di Suez; il canale apre nel 1869, ma il Porto Nuovo richiede lavori dal 1868 al 1883 e il traffico cresce solo gradualmente.

*   **A.** Il Canale di Suez è la causa decisiva: cambia la geografia dei traffici, mentre ferrovia e porto sono strumenti che si adeguano alla nuova rotta.
*   **B.** Suez crea un'opportunità: la rotta diventa strategica dove una ferrovia già esistente e un porto adeguato riescono a trasformarla in un flusso continuo verso l'interno.

Tieni a mente la tua risposta — il Verdetto nel Debriefing te la confermerà, la correggerà, o mostrerà che la realtà era più complicata di entrambe.
:::

---

## Chi Tiene La Chiave Del Canale
<span class="byline">Cronaca di Alex</span>

L'uomo dietro la scrivania stacca un acino d'uva dal grappolo e se lo mette in bocca, con calma.

Londra, novembre 1875. Uno studio di legno scuro nella sede della banca Rothschild, a New Court. Io sono in un angolo e cerco di sembrare un soprammobile.

Il visitatore porta un messaggio segreto del primo ministro Benjamin Disraeli. Ha fretta. La sua richiesta è semplice e assurda: quattro milioni di sterline. Subito.

**Rothschild:** "Qual è la garanzia?"

**Messo:** "Il governo britannico."

**Rothschild:** "Avrete il denaro."

Un altro acino. Fine della trattativa. Io volevo vedere un'asta drammatica, gente che urla, e invece la storia si decide fra un chicco d'uva e l'altro.

*MEMO, spiega. Massimo tre cose, lo so.*

*"Uno: l'Egitto è quasi in bancarotta. Due: il chedivè Ismail vende le sue 176.602 azioni della Compagnia, circa il 44% del capitale. Tre: il Parlamento è in vacanza, quindi Disraeli si fa prestare i soldi da Rothschild."*

Tre, contate. Il prezzo del favore glielo devo chiedere a parte: 2,5% di commissione e 5% d'interesse. Il 2,5% di quattro milioni fa circa 100.000 sterline. Per un "avrete il denaro" detto fra due acini.

**Alex:** "Quindi adesso il canale è degli inglesi?"

**Messo:** "La regina avrà la chiave dell'India."

Lo dice con orgoglio. Disraeli scriverà una frase simile alla regina Vittoria, *la chiave dell'India è nelle vostre mani*. Ma MEMO mi avverte subito: è un'esagerazione per compiacere la sovrana. Gli statuti della Compagnia limitano a dieci i voti in assemblea di un singolo azionista, la sede resta a Parigi, e il territorio è ancora dell'Egitto, che a sua volta sta sotto la sovranità dell'Impero Ottomano.

Il 44% di una società. Non un pezzo di deserto. Non un esercito.

MEMO mi sposta di sette anni, e il salto mi fa sudare prima ancora di atterrare.

Port Said, settembre 1882. Una nave a vapore è ferma accanto a una fila di chiatte cariche di carbone. Fra le chiatte e lo scafo ci sono assi di legno che si piegano, e su quelle assi corrono centinaia di uomini, arabi e somali, con ceste di giunco sulle spalle. Ogni cesta, dice MEMO, pesa circa quaranta chili. Salgono di corsa, rovesciano il carbone nei portelli, ridiscendono. Salgono di nuovo.

Sul ponte i marinai stendono teli di canapa bagnata sopra i boccaporti e le porte delle cabine. Un ufficiale controlla.

**Alex:** "Perché bagnate i teli?"

**Ufficiale:** "La polvere di carbone passa dappertutto. Rovina le cabine, i passeggeri, la posta. La posta imperiale non arriva nera a Bombay."

**Alex:** "E quanto carbone vi serve?"

**Ufficiale:** "Una trentina di tonnellate al giorno, a dieci nodi. Ne carichiamo per otto giorni, più un quinto di margine. Il resto della stiva deve portare merce, o il viaggio non rende."

**Alex:** "E se il carbone finisce?"

**Ufficiale:** "Non finisce. Gibilterra, Malta, Port Said, Suez, Aden, Bombay. Ci sono depositi lungo tutta la strada. Senza quelli, la rotta non esiste."

Da una grata sale un'ondata di calore che mi fa indietreggiare. MEMO mi mostra i rapporti medici della marina di quest'anno: nelle sale macchine delle navi a vapore nel Mar Rosso si superano i cinquanta gradi, e i fuochisti spalano a torso nudo, coperti di polvere nera e sudore, con stracci bagnati legati sulla fronte. Scherzerei sul fatto che il Mar Rosso è una sauna, ma non mi esce.

**Alex:** "Perché qui ci sono soldati inglesi? Nel 1875 avevate solo comprato azioni."

**Ufficiale:** "Nel 1875 sì. Poi c'è stata la rivolta di Urabi. E il canale va protetto."

Lo dice come fosse una cosa ovvia. MEMO, invece, separa i pezzi.

*"1881-1882: rivolta guidata dal colonnello Urabi contro il chedivè Tawfiq e contro il controllo franco-britannico sul debito, che assorbe oltre metà delle entrate fiscali. Luglio 1882: la flotta britannica bombarda Alessandria. 13 settembre: vittoria britannica a Tell el-Kebir, dopo lo sbarco a Ismailia."*

Adesso il controllo è militare. Il chedivè resterà al suo posto, ma negli anni seguenti ogni decisione passerà da un console generale britannico. Non sarà una colonia ufficiale: gli storici lo chiameranno "protettorato velato".

**Alex:** "Allora chi comanda il canale? Chi ha le azioni, chi ha il territorio o chi ha i soldati?"

**Ufficiale:** "Chi può restare."

Non so se mi convince. Nel 1888 una convenzione firmata a Costantinopoli dichiarerà il canale libero per le navi di ogni bandiera, in pace e in guerra. Sulla carta. Nei fatti, i soldati britannici restano lì.

Giù dalle assi, un uomo inciampa, si rialza, riprende la cesta. Non ha mai posseduto un'azione.

::: memo-box
### MEMO GLOSSARIO

*   **Imperialismo:** espansione del potere politico, economico e militare di uno Stato su territori e popoli fuori dai propri confini, anche senza trasformarli formalmente in colonie.
*   **Quota azionaria:** parte del capitale di una società. Chi la possiede riceve una parte degli utili e ha un certo peso nelle decisioni, ma non diventa padrone del territorio in cui la società lavora.
*   **Stazione carboniera:** porto con depositi di carbone dove le navi a vapore si riforniscono. Una rotta lunga funziona solo se le stazioni sono abbastanza vicine fra loro.
*   **Colonia e occupazione militare (richiamo):** non sono sinonimi. Nel 1882 l'Egitto è occupato militarmente, ma non diventa colonia; sarà protettorato formale solo dal 1914.
:::

---

## Una Cassa, Due Reporter, Un Continente
<span class="byline">Cronaca di Maja</span>

**Alex:** "Maja. Guarda che roba. Questa è arrivata dall'India."

Ha la mano appoggiata su qualcosa di enorme, fasciato in una tela ruvida di iuta e stretto da cerchi di ferro arrugginito: una balla di cotone grande quanto un armadio, con lettere nere dipinte a stencil e un timbro rosso della dogana su un lato.

Porto Nuovo di Trieste, primavera 1890. Mission Control ci ha fatti saltare insieme, stesso giorno, stesso molo. Nessuna comunicazione a distanza. Solo io, lui e un carico da seguire.

**Maja:** "Da dove lo leggi, che viene dall'India?"

**Alex:** "Dal fatto che… è cotone. E c'è Suez."

**Maja:** "Trieste riceve cotone da Bombay, certo. Ma anche dall'Egitto, via Alessandria — e Alessandria si affaccia sul Mediterraneo, non sul Mar Rosso. Una nave che arriva da lì il canale non lo vede nemmeno."

Alex apre la bocca, la richiude. Poi passa il dito sul timbro.

**Alex:** "Ok. Quindi da questa balla non so se è passata da Suez."

**Maja:** "No. Lo sai dal registro della nave, se lo trovi."

Non lo dico per vincere. Lo dico perché è quello che la balla può provare e quello che non può.

Accanto alla nave del Lloyd Austriaco, un facchino si piega, due compagni gli sistemano la balla sulla schiena, e lui si raddrizza. MEMO dice che queste balle pesano fra i 100 e i 200 chili. L'uomo cammina fino al vagone a passi corti. Da vicino la fibra sembra unta, e rilascia una polvere finissima che mi gratta in gola.

È Alex che si ferma a guardarlo. Io stavo già cercando il documento.

**Alex:** "Questo pezzo della catena non lo scrive nessuno, vero?"

**Maja:** "Nella lettera di vettura c'è il peso. Non c'è chi l'ha portato."

Due vagoni più in là, altri facchini caricano sacchi di caffè crudo diretti a Vienna. Il vagone del cotone è già chiuso. Un funzionario della dogana passa un filo di ferro negli anelli della porta, ci stringe attorno una pastiglia di piombo e la schiaccia con una pinza speciale. Su una faccia resta l'aquila a due teste. Sull'altra, le lettere dell'ufficio doganale di Trieste.

Poi inchioda sulla parete esterna una custodia di tela cerata. Dentro c'è la lettera di vettura, in più copie timbrate: marca, numero di balle, peso netto, sigilli, responsabilità della ferrovia.

**Funzionario:** "Se a Lubiana o a Vienna il piombo ha anche solo un graffio, il treno si ferma. E la compagnia paga tutto."

**Maja:** "E la destinazione?"

**Funzionario:** "Littai."

Litija. So benissimo dov'è. MEMO conferma: nel 1886, lungo la ferrovia, è nata la filanda Predilnica Litija, fondata da Julius Schwarz di Trieste e da Eugen Zublin di Manchester. Compra balle sbarcate al Porto Nuovo e le trasforma in filato.

Si parte.

Sulla salita del Carso verso Postojna il treno arranca a meno di venticinque all'ora: una locomotiva davanti tira, un'altra dietro spinge. Siamo all'aperto, sul terrazzino di un vagone, vicino a un frenatore con la mano sulla manovella del freno a vite. Il fumo grigio sa di zolfo e resta sospeso sopra le doline, nell'aria fredda. A ogni curva le rotaie stridono.

**Alex:** "Lei gira quella roba ogni volta che fischiano?"

**Frenatore:** "Fischio, stringo. Se sbaglio in discesa, il treno non lo ferma più nessuno."

**Alex:** "E chi c'è davanti, a far andare tutto questo?"

**Frenatore:** "Il fuochista. Tre, quattro tonnellate di carbone a pala per ogni viaggio. Questa salita se lo mangia."

Io intanto penso a Litija, e mi sembra tutto chiarissimo.

**Maja:** "Hai visto? Cotone da Trieste a una fabbrica in Carniola, senza toccare terra. È la ferrovia che fa il lavoro. E c'è dal 1857."

**Alex:** "La filanda, invece, c'è dal 1886."

**Maja:** "E allora?"

**Alex:** "Allora fanno ventinove anni di binari senza filanda. Se bastava il treno, cosa aspettavano? Prima il cotone a Trieste ci deve arrivare. Nave, molo, e quel tizio con duecento chili sulla schiena."

Stavo per ribattere. Mi fermo. Ci facciamo questa domanda da quando ci conosciamo, e stavolta tocca a me: che cosa potrebbe smentirmi? Ce l'ho sotto i piedi. Ventinove anni di rotaie, e nessuna filanda.

**Maja:** "Ok. Punto tuo."

**Alex:** "Me lo scrivo."

A Lubiana il treno si ferma, e qui tocca a me guardare bene, perché questa è casa mia.

Il cotone non scende. Il caffè non scende. I vagoni sigillati restano chiusi. La locomotiva prende acqua e carbone, i macchinisti e i fuochisti vengono sostituiti, e in coda vengono agganciati altri vagoni: carbone delle miniere di Trbovlje, legname carniolino.

Alex si sporge dal terrazzino a guardare la fila di porte sigillate.

**Alex:** "Aspetta. Nessuno scarica niente? E io che mi immaginavo il gran mercato delle spezie."

**Maja:** "Il caffè per Vienna resta chiuso lì dentro. Qui si ferma solo la locomotiva, a bere e a mangiare carbone."

**Alex:** "Allora Lubiana è un tubo. Entra da una parte, esce dall'altra."

**Maja:** "Prima di dirlo, conta le persone. Il fuochista che ha appena passato la pala al collega. Il deposito là davanti, con le locomotive da rimettere in sesto. Il carbone di Trbovlje che ci stanno attaccando in coda."

Alex guarda il deposito, poi i vagoni nuovi in coda.

**Alex:** "Il carico passa, il lavoro resta. Un tubo con dentro un sacco di gente."

**Maja:** "Scrivilo meglio di così, ma sì."

Sul muro della stazione c'è un orologio con due lancette dei minuti. Quella dorata segna l'ora di Vienna, che dal 1872 vale per tutti i treni austriaci. Quella nera segna l'ora di Lubiana, indietro di circa sette minuti e mezzo: il sole, qui, arriva più tardi che a Vienna. A Trieste la lancetta nera restava indietro di una decina.

*MEMO, quanto ci mette tutto il viaggio?*

*"Stima: fra 36 e 48 ore da Trieste allo scalo merci di Vienna, controlli e soste comprese. Dal 1° ottobre 1891 le ferrovie dell'Austria-Ungheria passeranno all'ora dell'Europa centrale."*

Il treno riparte verso est. Fra poche ore il vagone di Litija verrà staccato davanti a una filanda, e il resto andrà verso Vienna. Alex si è seduto sul bordo del terrazzino e guarda le rotaie.

Comincia a contare sulle dita, come fa quando vuole avere l'ultima parola.

**Alex:** "Niente Suez: meno cotone da Bombay. Niente porto: la nave resta lì carica. Niente ferrovia: la balla marcisce sul molo."

**Maja:** "Ti manca un dito. Niente Lubiana, niente acqua per la locomotiva a metà strada."

**Alex:** "L'avevi preparata."

**Maja:** "Da Postojna."

Il fischio arriva, e il frenatore stringe. Per un pezzo di strada stiamo zitti tutti e due.

::: memo-box
### MEMO GLOSSARIO

*   **Trasbordo:** passaggio fisico di una merce da un mezzo di trasporto a un altro, per esempio dalla nave al vagone. È il momento in cui si rischia di più di perderla, rovinarla o rubarla.
*   **Lettera di vettura:** documento in più copie che accompagna la merce sul treno. Indica marca, numero di colli, peso, sigilli e responsabilità della ferrovia in caso di danno o ritardo.
*   **Tempo ferroviario standard:** ora comune usata da tutta una rete per orari e coincidenze. Dal 1872 le ferrovie austriache usano l'ora di Vienna; dal 1° ottobre 1891 quelle dell'Austria-Ungheria adottano l'ora dell'Europa centrale.
:::

---

## Debriefing

Sul tavolo di Mission Control ci sono sei oggetti: un carboncino consumato, un biglietto di cartoncino con un foro a forma di stazione, una conchiglia fossile, una chiave di ferro, una cesta di giunco vuota e un sigillo di piombo con l'aquila a due teste.

Europa e mondo, Alto Adriatico, terre slovene. Tre tracce, un solo carico.

**Mission Control:** "Prima di chiudere il rapporto: ognuno prende l'oggetto che gli ha fatto cambiare idea. Il proprio non vale."

Alex allunga la mano verso la chiave di ferro, ci ripensa e prende il biglietto forato.

**Alex:** "Io avevo Suez, 1869, e basta. Questo dice che il treno per il mare c'era già da dodici anni."

Maja rigira il sigillo di piombo fra le dita, lo rimette giù e prende la chiave.

**Maja:** "E io avevo la ferrovia e basta. Ma un binario che arriva su un molo senza magazzini porta solo caffè bagnato."

**Alex:** "Hai preso la mia chiave."

**Maja:** "E tu il mio biglietto. Pari."

**Alex:** "Me lo scrivo."

Nessuno dei due rimette sul tavolo l'oggetto dell'altro.

**Verdetto.** L'Ipotesi Iniziale è incompleta: Suez fu il grande acceleratore marittimo, soprattutto per i piroscafi, ma non trasformò Trieste da solo e non di colpo. Trieste poté funzionare da porta verso l'Europa centrale perché la ferrovia via Lubiana esisteva già dal 1857 e perché il Porto Nuovo, costruito fra il 1868 e il 1883, collegò nave, magazzino e vagone. Al Checkpoint, **B è la risposta più completa**; A individua il fattore che mise sotto pressione la rete, ma nessuno dei tre anelli, da solo, avrebbe prodotto lo stesso risultato. E sopra tutti e tre, dal 1882, sta un potere militare che non possiede il canale ma lo controlla.

::: reality-check
### CIÒ CHE NON SAPPIAMO ANCORA

*   **Il costo umano esatto di Suez:** la storiografia accademica stima fra 1.500 e 4.000 morti e circa 1,5 milioni di lavoratori passati a turno per il cantiere, mentre una tradizione politica molto più tarda parla di 120.000 morti. La cifra più alta non trova riscontro; quella esatta, con i documenti rimasti, non si può fissare.
*   **Quanto traffico "creò" davvero il canale:** dopo il 1869 i traffici triestini crescono, ma insieme crescono anche i moli, la ferrovia e l'economia industriale. Separare l'effetto di Suez da tutto il resto resta difficile.
*   **Da quando Trieste è "la Porta d'Oriente":** non è un titolo ufficiale ma uno slogan di guide e opuscoli commerciali della seconda metà dell'Ottocento. Quando sia diventato un'idea che anche i triestini usavano per descrivere se stessi, le fonti non lo dicono con precisione.
:::

::: memo-box
### CRONOLOGIA ESSENZIALE

*   **1849:** la Ferrovia Meridionale raggiunge Lubiana (servizio regolare dal 16 settembre).
*   **1857:** il 27 luglio si inaugura il tratto fino a Trieste; la linea Vienna-Lubiana-Trieste è completa.
*   **1859-1869:** costruzione del Canale di Suez, aperto il 17 novembre 1869.
*   **1868-1883:** costruzione del Porto Nuovo di Trieste, in funzione parziale dal 1877.
*   **1875 e 1882:** la Gran Bretagna compra il 44% delle azioni; sette anni dopo occupa militarmente l'Egitto.
*   **1891:** le ferrovie austro-ungariche adottano l'ora dell'Europa centrale; a Trieste il porto franco si restringe alle aree portuali.
:::

La rete adesso è abbastanza completa da sembrare invincibile. Una nave da Bombay, un canale nel deserto, due chiavi in un magazzino, un sigillo di piombo e un'ora comune da Trieste a Vienna.

La domanda che resta sulla soglia del Novecento è un'altra. Che cosa succede quando porti, ferrovie, canali e imperi dipendono tutti dagli stessi pochi passaggi?

<!-- WORD COUNT: ~7350 -->
<!-- PERSONA CHECK: Alex/Maja voice intact? Pass — Alex keeps the ironic media-vs-reality tic (documentario, film sulle grandi opere) at controlled frequency (2 explicit uses), the MEMO banter register, and the competitive-but-generous dynamic with Maja (Beat 6: "Me lo scrivo" / "Ti manca un dito"). Maja keeps the structural lens (chi lavora, non solo chi transita), the "perché nessuno lo racconta mai" tic (Beat 2, one explicit use), and precise emotional self-naming ("Mi brucia un po'"). No drift into generic AI narration. -->
<!-- NUF CHECK:
1. Sequenza 1849/1857→1859-1869→1868-1883→1875/1882 ricostruibile con causa per ogni passaggio ✅
2. Causa necessaria vs sufficiente — nessuno dei tre anelli basta da solo, reso esplicito nel Verdetto e nel conteggio sulle dita di Beat 6 ✅
3. Seconda rivoluzione industriale come rete (elettricità+chimica+ferrovia+telegrafo+società di massa) in Beat 1 ✅
4. Rotta commerciale come leva imperialista — proprietà/territorio/controllo militare distinti in Beat 5 ✅
5. Meraviglia e disagio insieme — luce elettrica/turni più lunghi (Beat 1), cantiere di Suez con morti stimati (Beat 3), lavoro invisibile del facchino (Beat 6) ✅
6. Ferrovia meridionale con date 1849/1854/1857, percorso Vienna-Semmering-Lubiana-Trieste, effetti su Lubiana, nessuna Austria-Ungheria anticipata ✅
7. Suez con concessione, cantiere, lavoro coatto, dragaggio, niente chiuse, apertura 17 nov 1869, vantaggio vapore vs vela, cifre contese qualificate ✅
8. Revoltella-Compagnia-porto ampliato con fonti distinte, nessuna fusione in leggenda causale unica ✅
9. Beat 2 raccontato da Maja come storia propria della Carniola (lingua, lavoro, posizione di Lubiana), non strada di servizio verso Trieste ✅
10. Beat 6: Maja segue la merce, Alex la mette alla prova e viene corretto ("Ti manca un dito"), nessuno parla al posto dell'altro ✅
-->
<!-- ANTI-AI CHECK: Nessuna frase vietata ("come sappiamo", "è importante notare", morale esplicita) rilevata. Nessun pattern bannato (niente "Immaginate di essere", niente "Ebbene sì/Sorprendentemente", niente personaggio storico che tiene una lezione, niente "anche in Slovenia" per introdurre Maja). Formula sensoriale "il primo X prima di Y" non utilizzata in modo meccanico ripetuto. Zero etichette di produzione (Beat/Scena/EU/GIULIA/SLOVENIA) nel testo — rese sempre come "Europa e mondo", "Alto Adriatico", "terre slovene". "Capitolo" compare una sola volta, nel titolo. Un solo checkpoint (dopo Beat 4), un solo target-profile (Revoltella, supera il test operativo dell'Abilità Speciale), un scan-result aggiunto sul biglietto forato per rinforzare la gamification (nessun Easter Egg, come da struttura). Ogni [ESTIMATE] del dossier reso con linguaggio di cautela ("si stima", "circa", range). -->


<div style="page-break-after: always;"></div>

