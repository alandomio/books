<div class="disclaimer">

# Nota Metodologica sul Processo Editoriale

**CHRONOS: Ai Confini dell'Impero**
*Dal Rinascimento alla Belle Époque, tra la Grande Storia e le Terre di Mezzo*

**Autore e curatore editoriale:** Alan Domio
**Anno:** 2026
**Versione:** 2.0

---

## 1. Natura dell'Opera

Questo libro è un'opera di narrativa storica a scopo didattico, prodotta per studenti di seconda media (11-13 anni) attraverso un processo editoriale ibrido uomo-macchina. La visione, il curricolo, l'architettura narrativa e ogni decisione strutturale sono opera dell'autore; la ricerca documentale, la stesura in prima bozza e i controlli di qualità sono eseguiti da sistemi di intelligenza artificiale sotto vincoli espliciti definiti dall'autore stesso, con revisione e approvazione umana finale.

I personaggi Alex e Maja sono cronoriporter immaginari; i personaggi storici che incontrano sono realmente esistiti. Quando non esiste una citazione documentata delle loro parole, i dialoghi sono ricostruzioni narrative plausibili — coerenti con quanto sappiamo del personaggio e del contesto, ma non citazioni storiche letterali. Anche la famiglia del filo narrativo che attraversa i capitoli è immaginaria; la storia in cui si muove è documentata. Gli elementi di gioco (schede personaggio, box informativi, checkpoint) sono strumenti didattici e non vanno interpretati come dati storici in senso stretto.

Questa seconda versione è pensata come lettura da affiancare al manuale scolastico, non come suo sostituto: capitoli più brevi, un documento vero per capitolo, fonti precise raccolte nell'appendice per l'insegnante.

## 2. Architettura del Processo Produttivo

Il libro è prodotto da una pipeline editoriale a fasi, ciascuna eseguita da un agente di intelligenza artificiale specializzato, stateless (senza memoria tra una fase e l'altra — ogni fase legge solo i documenti scritti dalla fase precedente, mai la conversazione che l'ha generata):

| Fase | Funzione | Modello impiegato |
|---|---|---|
| **Architect** | Progettazione di ogni capitolo: domanda guida, tre scene, documento, checkpoint | GPT-5.6-Sol, ragionamento esteso |
| **Researcher** | Ricerca fattuale e triangolazione delle fonti, solo per i fatti mancanti nei dossier | Gemini Flash 3.8 |
| **Ricerca immagini** | Individuazione di documenti e immagini autentici di pubblico dominio | Gemini Flash 3.8 |
| **Writer** (due stadi) | Stesura narrativa in italiano e rifinitura, con l'appendice per l'insegnante | Claude Opus (stadio 1), Claude Sonnet 5 (stadio 2) |
| **Editor** | Controllo di qualità: misure automatiche di lunghezza e leggibilità (indice Gulpease) e verifica delle fonti, con blocco del capitolo in caso di violazione | Claude Sonnet 5 |
| **Reviewer** | Revisione editoriale finale su sei dimensioni | Claude Opus, ragionamento esteso |
| **Linguista** | Adattamento sloveno del capitolo italiano approvato | Claude Sonnet 5 |

Ogni capitolo attraversa questa sequenza almeno una volta; in caso di esito negativo di un controllo di qualità, la fase di scrittura viene ripetuta (fino a un massimo di tre tentativi) prima dell'escalation a revisione umana diretta.

## 3. Metodologia di Ricerca e Verifica delle Fonti

La fase di ricerca segue un protocollo a quattro livelli progressivi (contesto generale, eventi specifici, dettagli materiali della vita quotidiana, triangolazione incrociata tra fonti indipendenti). Ogni affermazione storica riportata nel testo deve essere tracciabile a una fonte documentata in un archivio di ricerca dedicato per capitolo; il sistema non ammette l'invenzione di dettagli "plausibili" non verificati.

Le affermazioni per cui le fonti storiografiche riportano stime, intervalli o posizioni discordanti sono segnalate come tali nel testo (con formule esplicite di cautela, es. "si stima", "secondo alcune fonti"), non presentate come dati certi. Per i contenuti relativi al territorio sloveno, il processo di ricerca richiede sistematicamente almeno una fonte in lingua slovena, per ridurre il rischio di appiattire figure e concetti sloveni su fonti italiane che li trattano solo marginalmente.

**Limite noto:** nonostante questi vincoli, i sistemi di intelligenza artificiale impiegati possono produrre errori fattuali non rilevati dal processo di verifica interno. Il lettore, l'insegnante o il genitore che riscontri un'imprecisione è invitato a segnalarla; il testo è soggetto a revisione continua.

## 4. Immagini e Metodologia Bilingue

Le immagini del libro sono documenti autentici di pubblico dominio (mappe, stampe, fotografie, frontespizi), con fonte e segnatura nell'appendice per l'insegnante; mappe e linee del tempo sono disegnate dai dati dei dossier. Il libro non contiene illustrazioni storiche inventate: l'intelligenza artificiale può solo pulire o adattare un'immagine vera, senza aggiungere nulla.

L'edizione italiana viene scritta per prima. L'edizione slovena è un adattamento leggero di ogni capitolo italiano già approvato: stessi fatti, stesse scene e stessi documenti, con frasi riscritte in modo naturale, non una traduzione letterale.

## 5. Supervisione Umana

L'autore definisce il curricolo, la struttura di ogni capitolo, le regole di stile e i criteri di qualità applicati dal sistema; approva o corregge l'output finale prima della pubblicazione. Ogni capitolo italiano viene letto da una lettrice della fascia d'età del libro prima di procedere con il capitolo successivo e con l'adattamento sloveno. Il processo descritto in questa nota è documentato in dettaglio nei file di configurazione del progetto, disponibili su richiesta per finalità didattiche o di ricerca.

## 6. Licenza

Quest'opera è distribuita sotto Licenza Creative Commons **Attribuzione - Non commerciale - Non opere derivate 4.0 Internazionale (CC BY-NC-ND 4.0)**. È consentito condividere e ridistribuire il materiale in ogni supporto o formato, a condizione di darne credito appropriato, non utilizzarlo per scopi commerciali e non modificarlo.

Leggete con spirito critico.

</div>
