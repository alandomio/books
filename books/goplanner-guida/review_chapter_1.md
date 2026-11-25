# Review — Capitolo 1: Che cos'è GOPlanner

Reviewer, 25 novembre 2026. Ho letto `PRD.md`, `STYLE_BIBLE.md`, `chapter_1_struttura.md` e `chapter_1.md`. Ogni fatto segnalato è controllato contro `dossier_chapter_1.md`. Quattro punti li ho verificati anche sul codice del ramo `php8` (HEAD `21e974921`): `lib/MobileV3/Domain/EsitoCatalog.php`, `lib/UtenzaBase.php`, `lib/CalendarioController.php`, `docs/mobile-v3/comandi-remoti.md`, `wiki/assistenza-clienti/approvazione-comandi-remoti.md`, `wiki/assistenza-clienti/pagina-geocodifica-clienti.md` e `wiki/assistenza-clienti/stato-utenza-assegnato-dopo-chiusura.md`. Per Gea ho usato `dossier_chapter_2.md`, per non contraddire il capitolo 2.

## 1. Executive Summary

**Verdetto: 45/60 → REVIEWER_CORRECTIONS. 24 blocchi riscritti direttamente in `chapter_1.md`.**

È un capitolo 1 raro: non è una brochure ma un metodo (dieci parole, sei passi, una traccia per passo). Il caso iniziale dell'utenza «assegnato» trova la sua risposta nella sezione 4. Il dossier copre quasi ogni riga. Sei difetti lo tenevano sotto la soglia:
- la risposta al caso iniziale era incompleta. Nel codice il rapportino («Da finire») lascia l'intervento in stato 3, ed è la causa più semplice dello stesso sintomo; il capitolo non la diceva;
- tre funzioni erano presentate come generali, e valgono solo in alcune commesse: i comandi remoti, Clienti › Geocodifica, Gea;
- il capitolo che fissa il glossario usava parole vietate: «modello» per Gea, «database» per commessa, «personale GOPlanner» per staff tecnico;
- c'erano due contraddizioni interne: «il ciclo è lo stesso per tutti» contro «il ciclo non è uguale in tutte le commesse», e «gli stati di un intervento» contro lo stato 1 «non ha ancora un intervento»;
- la voce scivolava nel quaderno del ricercatore: sette volte «le fonti», più note di lavoro rimaste nel testo;
- codice non segnalato nelle sezioni per tutti, e «dieci parole» promesse ma mai elencate.

## 2. Score: 45/60 → REVIEWER_CORRECTIONS

| Dimensione | Voto | Motivo in una riga |
|---|---|---|
| 1. Narrativa e struttura | 8/10 | Il caso iniziale è aperto e chiuso dove la struttura chiede, ogni sezione finisce con una regola e la chiusura è una regola d'uso; contro: due contraddizioni interne e obiezioni numerate male («prima», poi «seconda» e «terza», ma erano cinque) |
| 2. Lingua, stile e voce | 7/10 | Calma e precisa quasi ovunque; contro: sette «le fonti», note del ricercatore nel testo, tre parole vietate dal glossario, rafforzativi («sempre la stessa, ed è la più costosa», «la più frequente») |
| 3. Accuratezza fattuale | 7/10 | Tracciabilità ottima; contro: risposta al caso iniziale incompleta (rapportino), tre funzioni per commessa date come generali, una citazione della wiki attribuita alle «pagine del gestionale», «che paga il lavoro» senza fonte, Fonti incomplete |
| 4. Allineamento al pubblico | 7/10 | Tabelle e procedura servono all'ufficio; contro: codice nelle sezioni per tutti senza avviso (`DURATA = 3600`, `custom/{nome_cliente}/ > lib/`, colonna `esito` 1/0), «va cercato nelle sue note» per un file che l'ufficio non vede, «mappatura» mai definita |
| 5. Coinvolgimento | 7/10 | Vivono il caso iniziale, le due conte (utenze e pratiche) e la storia di GOP-264; contro: la procedura annuncia «120 righe» e poi non usa il numero, il controllo prima del ticket era sepolto nella prosa |
| 6. Originalità e angolo | 9/10 | Fa di «che cos'è» un metodo di diagnosi; trappole vere e utili: «Lista» non è la pagina delle liste, `utenti` ≠ `users`, «Ripeti» sposta il periodo, due conte entrambe giuste |
| **Totale** | **45/60** | |

## 3. Detailed Findings by section

### Apertura e «Il lavoro che GOPlanner organizza»

- **Forte.** La frase del glossario usata come definizione e il metodo «Dieci parole… sei passi… una pagina» sono la spina del capitolo.
- **Promessa non mantenuta.** «Bastano dieci parole e sei passi.» Le dieci parole non erano mai elencate: le tabelle ne mostrano una ventina. Un lettore che conta non trova le dieci. *Corretto:* il paragrafo del metodo ora le nomina, insieme ai sei passi, e dice a che cosa servono le altre.
- **Rafforzativi e meta-voce.** «La prima domanda che viene in mente è sempre la stessa, ed è la più costosa» è un rafforzativo senza fonte. «Le fonti di GOPlanner descrivono questo caso con precisione» commenta la ricerca invece del prodotto. *Corretto.*
- **Dettaglio inventato.** «si apre la scheda di un'utenza»: il dossier dà la colonna e il filtro «Stato» in «Clienti», non una «scheda». *Corretto* con il posto vero.
- **Codice nella sezione per tutti.** «nel codice esistono sei moduli di esportazione delle letture, `lib/export_letture_*.inc.php`»: è la prova del ricercatore, non il lavoro. *Corretto* in «sei commesse hanno un'esportazione delle letture costruita apposta»; il percorso resta nelle Fonti.
- **Fonte interna citata al lettore.** «è la domanda da cui parte la guida del magazzino»: quale guida? Il lettore pensa al capitolo 9. *Corretto.*
- **Contraddizione.** «Il ciclo che questo capitolo descrive è lo stesso per tutti» contro la sezione 5, «Il ciclo non è uguale in tutte le commesse». *Corretto* in entrambi i punti: la sequenza è la stessa, gli strumenti di un passo no.
- **Pubblico sbagliato.** «la regola scritta nelle fonti è «`custom/{nome_cliente}/` > `lib/`»» e «va cercato nelle sue note»: l'ufficio non vede il `README.md` della commessa. *Corretto:* le note le consulta lo staff tecnico, e il capitolo 2 spiega la precedenza.

### «Chi lavora in GOPlanner, e dove»

- **Forte.** La tabella con «Parole da non usare» e l'eccezione dell'operatore collegato a un Magazziniere.
- **Nota di lavoro rimasta nel testo.** «Ho capito» è un pulsante degli annunci, non del pannello di Gea. È una nota del dossier per lo scrittore. *Corretto* in un'informazione utile: la campanella sta in alto a destra, il pannello di Gea in basso a sinistra.
- **Funzione per commessa presentata come generale (Anti-AI n. 8).** I comandi remoti non erano mai definiti, e non si diceva che l'approvazione esiste solo «sulle commesse che hanno i comandi remoti attivi» (`approvazione-comandi-remoti.md`). C'era anche codice per l'ufficio: «nel codice la durata è `DURATA = 3600` secondi». *Corretto:* tre esempi di comando da `docs/mobile-v3/comandi-remoti.md` (messaggio, riscarica, aggiornamento) e la condizione «nelle commesse che hanno i comandi remoti attivi».
- **Citazione attribuita male.** «Le pagine del gestionale lo dicono in chiaro: «quali compaiono dipende…»». La frase è della wiki (`pagina-interventi-menu.md`), non dell'interfaccia. *Corretto.*
- **Parola vietata.** «riservato al personale GOPlanner»: la parola del glossario è staff tecnico. *Corretto.*
- **Frequenza senza fonte.** «Un dubbio ricorrente». *Corretto.*

### «Le parole del lavoro: dal committente alla pratica»

- **Forte.** La nota sulla riga della lista, che risolve il CONFLICT 6 (in Interventi «Lista» è l'elenco degli interventi, le liste stanno in «Carichi»). Poi l'esempio delle due pratiche: «Chi chiede «quante utenze ho?» e chi chiede «quante pratiche ho?» ottengono due numeri diversi, ed entrambi sono giusti.» È il miglior *show* del capitolo.
- **Frase confusa.** «Tre persone, tre significati per due parole.» Menu e codice non sono persone, e le parole in gioco sono tre («cliente», «Clienti», `utenti`). *Corretto.*
- **Fatto senza fonte.** «il committente, che paga il lavoro». Il glossario dice «affida»; il PRD esclude i dettagli economici. *Corretto.*
- **Frequenza senza fonte e numerazione.** «Qui arriva la prima obiezione, la più frequente.» *Corretto.*
- **Cella imprecisa.** Commessa, «È il gestionale stesso in cui si entra»: un utente può cambiare commessa (capitolo 2). *Corretto* in «Il gestionale in cui si entra; vedi il capitolo 2».

### «Intervento, esito e stato»

- **Forte.** «L'esito lo scrive l'operatore. Lo stato lo legge l'ufficio.» La tabella dei dieci stati è fedele a `lib/InterventoBase.php`. Le precisazioni sugli stati 7, 8 e 10 sono oneste.
- **Contraddizione.** «Gli stati di un intervento sono dieci», poi lo stato 1: «non ha ancora un intervento». Il dossier e `lib/UtenzaBase.php` mostrano numeri condivisi fra utenza e intervento. *Corretto.*
- **Commento del codice raccontato all'ufficio.** «il commento accanto dice che la Verifica allinea un intervento solo a partire da questi, mai all'indietro»: per chi lavora in ufficio non vuol dire niente. *Tolto.*
- **Paragrafo da sviluppatori nella sezione per tutti.** «Nel modello dati più vecchio la colonna `esito` vale 1…», poi `segnalazioni` e i 25 caratteri. *Corretto:* il paragrafo resta per l'ufficio, le colonne passano in un riquadro «Per gli sviluppatori», e una tabella esito → stato mostra che cosa lascia ogni esito di GOPlanner 3 (`EsitoCatalog.php`: rapportino → `STATO_ASSEGNATO`, `chiude => false`).
- **Risposta incompleta al caso iniziale (critico).** L'unica causa data era `interventi_multipli`. Il codice ne ha una più semplice e più comune: il rapportino («Da finire» in alcune commesse) salva senza chiudere e lascia l'intervento in stato 3. Il lettore che ha «visto l'operatore registrare l'esito» deve prima escludere questa. *Corretto:* le cause sono due, e il controllo prima del ticket è una procedura numerata di tre passi. Il passo 2 cita Gea, che la wiki indica come capace di questo controllo («Cosa può verificare il chatbot»).
- **Limite vago.** «alcune commesse hanno meno righe nella tabella `stati`, e il codice lo segnala». *Corretto* con il dato esatto: in alcune commesse mancano le righe 9 e 10 (`CalendarioController.php`: «sul tenant possono mancare le righe `stati` 9/10»).

### «Il ciclo di una commessa, dal file all'esportazione»

- **Forte.** La tabella del ciclo a sei colonne, con il «—» onesto per lo stato 7 e per l'esportazione. Anche il paragrafo su «Ripeti», che sposta il periodo, è forte.
- **Attacco a formula.** «Ogni riga ha i suoi dettagli.» La stessa formula torna nella sezione 6 («Ogni riga ha un dettaglio che fa risparmiare tempo»). *Tolto qui.*
- **La procedura non usava il suo esempio.** «120 righe nel file» non tornava più. *Corretto:* 119 righe importate, 1 scartata, 4 utenze da geocodificare che al passo 6 non sono sulla mappa e portano all'obiezione. Il passo 9 aveva due azioni: diviso in due.
- **Funzione per commessa presentata come generale.** Clienti › Geocodifica: «La voce e il pulsante compaiono solo se la commessa li abilita» (`pagina-geocodifica-clienti.md`). *Corretto.*
- **Parola vietata.** «su alcuni database Rapporti apre il Riepilogo»: «database» è tra le parole da evitare per «commessa». *Corretto.*
- **Rimando ambiguo.** «Seconda obiezione, che arriva al passo 2»: il lettore ha appena letto una procedura di 11 passi. *Corretto* in «arriva alla pianificazione».

### «Dove guardare quando qualcosa non torna»

- **Forte.** La tabella sintomo → passo → dove guardare. Il riquadro «Quando chiedere allo staff tecnico» ha cinque motivi, ciascuno con la sua fonte.
- **La storia diceva più delle fonti.** «Il caso che ha reso esplicita questa regola viene da un ticket»: GOP-264 riguarda il dato che parte dal telefono, non la regola generale del ciclo. «Nelle stesse cinque settimane» rimanda a un periodo mai nominato. E il numero 22.173 restava muto: non si diceva perché conta. *Corretto:* la storia è limitata ai dati del telefono, il numero è spiegato come rumore, e c'è la frase che la fa vivere, dal ticket: a scoprire il tablet fermo non fu il sistema ma la segnalazione arrivata per telefono.
- **Gea data per sempre attiva (Anti-AI n. 8, stessa correzione fatta nel capitolo 2).** «Il primo posto dove chiedere è Gea», e la chiusura «Solo dopo Gea». `dossier_chapter_2.md`: in produzione Gea dipende da un interruttore del servizio, solo sulle commesse pilota (GOP-444), e una commessa la può spegnere. *Corretto* nella sezione 6, nella chiusura e nel passo 2 della procedura della sezione 4.
- **Parola vietata.** «Il modello che sta sotto Gea non scrive mai sui dati»: «modello» è nella lista da evitare per Gea, e due righe dopo «modello» indica una mappatura. *Corretto.*
- **Termine mai definito.** «mappatura» compariva quattro volte senza definizione. *Corretto:* è definita al primo uso in prosa, con la stessa formula del capitolo 4.
- **Fonti incomplete.** Mancavano le fonti di affermazioni presenti nel testo: `runbook-pagina-file-non-funziona.md` (pagina bianca), `sezione-ticket.md`, `Smarty_templates/it/file.html` (10 MB), `js/code/esportazione.js` («Ripeti»), `docs/02-patterns/13-import-logic-pattern.md`, GOP-536, GOP-782 e GOP-820. *Aggiunte,* con le fonti delle nuove frasi: `CalendarioController.php`, `ChatbotAuth.php`, `config-docker.inc.php`, GOP-444.

## 4. Persona Audit

La persona è The Engineer + The Scholar Who Can Write. Il capitolo la tiene per circa l'80%. Nomi esatti di menu e pulsanti, numeri con unità e fonte, «in alcune commesse» quasi ovunque serve. Nessun «noi», nessun aggettivo di marketing, nessuna frase della lista vietata.

Le derive sono tre, ricorrenti:

1. **Il quaderno del ricercatore.** Sette volte «le fonti»: «Le fonti di GOPlanner descrivono», «Le fonti ne mostrano», «la regola scritta nelle fonti», «Le fonti conoscono però un'eccezione», «le fonti non dicono», «le fonti non ne mostrano», «le fonti non indicano». A queste si aggiungono «il commento accanto dice» e «il codice lo segnala». La persona dice «Se non lo so, non lo scrivo», non «le fonti non lo dicono». Il lettore dell'ufficio non sa che cosa siano «le fonti» e non gli interessa. Restano due frasi che dichiarano un limite («non è documentato»), perché quel limite è utile al lettore.
2. **Il codice per tutti.** `DURATA = 3600`, `lib/export_letture_*.inc.php`, `custom/{nome_cliente}/ > lib/`, la colonna `esito` 1/0 e `InterventoBase::updateStatoUtenza()` stavano in sezioni [TUTTI] senza riquadro. La persona lo vieta in modo esplicito: «spiegare il codice a chi legge per l'ufficio senza dirgli che può saltare il paragrafo». Ora stanno in un riquadro o nelle Fonti.
3. **Il glossario tradito dal capitolo che lo fissa.** «modello» per Gea, «database» per commessa, «personale GOPlanner» per staff tecnico. Nel capitolo 1 conta doppio, perché il lettore impara le parole da qui.

Dopo le correzioni la voce è uniforme. La frase-tipo del capitolo resta quella della sezione 4: «L'esito lo scrive l'operatore. Lo stato lo legge l'ufficio.»

## 5. Counter-Objection Check

Le obiezioni presenti sono cinque; lo Style Bible ne chiede almeno due.

| # | Obiezione | Sezione | Forma più forte? | Risposta con fonte? |
|---|---|---|---|---|
| 1 | «L'operatore non è anche lui un utente?» | 2 | Media: è un dubbio di parole, non di lavoro | Sì: glossario, `magazziniere-app.md`, Admin › Operatori |
| 2 | «Nel menu c'è scritto Clienti: allora le utenze sono i clienti?» | 3 | Sì: è il tranello che produce ticket sbagliati | Sì: CONTEXT.md, `pagina-clienti.md`, omonimo in Admin |
| 3 | «L'operatore ha registrato l'esito: perché l'utenza risulta ancora «assegnato»?» | 4 | **Prima no, ora sì.** La forma più forte comprende il caso in cui l'operatore ha davvero usato l'app ma con un rapportino; prima la risposta copriva solo `interventi_multipli` | Sì, ora con `EsitoCatalog.php` e la wiki del caso, più la procedura in tre passi |
| 4 | «Ho importato la lista, perché non riesco ad assegnare alcune utenze?» | 5 | Sì, e ora l'esempio inventato (4 utenze senza coordinate) ci porta dentro | Sì: `pagina-pianificazione.md`, `runbook-assegna-utenze.md`, `pagina-geocodifica-clienti.md` |
| 5 | «Posso chiedere a Gea di correggere i dati da sola?» | 6 | Sì: è la paura vera di chi usa un assistente | Sì: «Autorizza», 10 minuti, «Ripristina», operazioni escluse |

La numerazione era incoerente («prima», poi «seconda» e «terza», con due obiezioni senza numero). Ora nessuna obiezione è numerata.

Manca un'obiezione forte, da prevedere se il capitolo viene rigenerato: «Se lo stato può non coincidere con l'esito, perché dovrei fidarmi della colonna «Stato»?» La risposta c'è già in parte nella sintesi della sezione 4: le due cose possono non coincidere, ma c'è una regola che lo spiega. Merita però una frase che dica quale delle due fa fede per l'esportazione, ma solo se il dossier del capitolo 7 lo documenta.

## 6. Priority Improvements

### Critical (tutte applicate)

1. Seconda causa del caso iniziale, il rapportino che lascia lo stato 3, con il controllo trasformato in procedura numerata.
2. Le funzioni per commessa dette come tali: comandi remoti, Geocodifica, Gea.
3. Le parole vietate dal glossario tolte: «modello» per Gea, «database», «personale GOPlanner».
4. Le due contraddizioni interne risolte: il ciclo uguale o diverso, gli stati di intervento e di utenza.

### Important (tutte applicate)

5. Il codice fuori dalle sezioni per tutti: riquadro «Per gli sviluppatori» per le colonne di `interventi_eseguiti`; costanti e percorsi tolti dalla prosa per l'ufficio.
6. Le dieci parole elencate davvero, insieme ai sei passi.
7. La meta-voce «le fonti» tolta dove non dichiarava un limite utile.
8. La citazione della wiki non più attribuita alle «pagine del gestionale».
9. «Mappatura» definita al primo uso in prosa.
10. La storia di GOP-264 limitata a ciò che prova, con la frase della segnalazione telefonica.
11. La procedura dell'esempio collegata all'obiezione sulle coordinate; il passo con due azioni diviso.
12. Le Fonti completate.

### Optional (non applicate)

13. **Commenti HTML in coda al file** (`<!-- WORD COUNT … -->`, `<!-- PERSONA CHECK … -->`…). Violano alla lettera «niente HTML grezzo» dello Style Bible § Formato, e nella pagina Guida dentro GOPlanner finirebbero nel sorgente HTML. Non li tolgo perché `ralph.sh` (righe 925-928) li chiede a ogni scrittore, e gli altri capitoli li hanno. Va deciso a livello di pipeline: o `publish.sh` e il rendering HTML li tolgono, o lo scrittore non li scrive più. Ho aggiornato solo il conteggio delle parole.
14. **Sezione 2, primo paragrafo.** Ripete in prosa le sette definizioni che la tabella subito dopo ripete di nuovo (circa 130 parole doppie). Si può ridurre a due frasi: utente e operatore, più il committente fuori dal sistema.
15. **Riquadro «Quando chiedere allo staff tecnico».** Cinque motivi in un solo paragrafo: un elenco puntato dentro il riquadro si leggerebbe meglio.
16. **«Assegnare da «Clienti»»** è ancora una procedura scritta in prosa nella sezione 5. Si può fare in tre passi numerati, se non appesantisce l'obiezione.
17. **Il glossario stesso.** `CONTEXT.md` dice «Lista… Nel menu è «Lista»», e il capitolo, correttamente, lo smentisce (CONFLICT 6). Va corretto il glossario, non il libro. È già segnato in `oracle_questions.md`.
18. **Vuoti di ricerca per una rigenerazione:**
    - in quale pagina l'ufficio vede tutti gli interventi di una utenza, per il passo 2 della procedura;
    - se in Rapporti › Verifica interventi il rapportino si riconosce come tale;
    - che cosa sia un «allaccio»;
    - che cosa voglia dire «identità personale» per chi lavora in ufficio;
    - se, dove Gea è spenta, un ticket si apre dalla sezione «Ticket».

## 7. Rewritten Paragraphs

### R1 — Il caso iniziale (sezione 1)

**Original:**
> In ufficio si apre la scheda di un'utenza e si legge lo stato «assegnato». L'operatore, però, è passato: ha registrato l'esito con l'app, e chi gli ha parlato sa che il lavoro è fatto. La prima domanda che viene in mente è sempre la stessa, ed è la più costosa: il lavoro è andato perso? […] Le fonti di GOPlanner descrivono questo caso con precisione e dicono che, a certe condizioni, è il comportamento previsto. Per capire perché servono però due parole, esito e stato, che questo capitolo distingue nella sezione *Intervento, esito e stato*. La risposta arriva lì, non prima.

**Rewritten:**
> In ufficio, nella pagina «Clienti», la colonna «Stato» di un'utenza dice «assegnato». L'operatore però è passato: ha registrato l'esito con l'app e conferma che il lavoro è fatto. La domanda che segue è una sola: il lavoro è andato perso? […] Il comportamento ha invece una regola precisa, e in certe commesse è quello previsto. Per leggerla servono due parole che non sono sinonimi, esito e stato. La sezione *Intervento, esito e stato* le distingue e risponde alla domanda.

**Why:** La «scheda» non è nel dossier, mentre la colonna «Stato» in «Clienti» sì: il caso parte da un posto vero. «Sempre la stessa, ed è la più costosa» è un rafforzativo senza fonte («I do not intensify — I specify»). «Le fonti di GOPlanner descrivono» parla della ricerca, non del prodotto. «Chi gli ha parlato» era vago. Il caso resta aperto fino alla sezione 4, come chiede la struttura.

### R2 — I tipi di lavoro (sezione 1)

**Original:**
> Che lavoro, in concreto? Le fonti ne mostrano diversi tipi, e nessuno vale per tutte le commesse. Ci sono le letture dei contatori: nel codice esistono sei moduli di esportazione delle letture, `lib/export_letture_*.inc.php`, ciascuno legato a una sola commessa. C'è la sostituzione dei contatori, che si appoggia al magazzino: «Sono arrivati dei contatori nuovi: come li carico?» è la domanda da cui parte la guida del magazzino, […] Il ciclo che questo capitolo descrive è lo stesso per tutti; cambia il contenuto della lista e i dati che l'operatore raccoglie.

**Rewritten:**
> Che lavoro, in concreto? Dipende dalla commessa, e nessun tipo di lavoro vale per tutte. Ci sono le letture dei contatori: sei commesse hanno un'esportazione delle letture costruita apposta per il proprio committente. C'è la sostituzione dei contatori, che si appoggia al magazzino: i contatori nuovi si caricano nel deposito centrale, e alla chiusura di una sostituzione il contatore smontato entra nel furgone (capitolo 9). […] La sequenza dei passi che questo capitolo descrive è la stessa per tutti. Cambiano il contenuto della lista, i dati che l'operatore raccoglie e, in alcune commesse, gli strumenti di un singolo passo.

**Why:** Il percorso dei moduli è la prova del ricercatore, non un'informazione per chi lavora in ufficio; resta nelle Fonti. «La guida del magazzino» confondeva la wiki con il capitolo 9. L'ultima frase contraddiceva la sezione 5 («Il ciclo non è uguale in tutte le commesse»). Ora le due dicono la stessa cosa: sequenza uguale, strumenti diversi.

### R3 — I comandi remoti (sezione 2)

**Original:**
> Ufficio e campo si incontrano anche senza che l'ufficio tocchi il telefono. Un esempio preciso sono i comandi remoti. Il menu «Impostazioni» ha la voce «Dispositivi mobili»; la pagina ha la sezione «Telefoni GOPlanner 3», e lì un amministratore della propria azienda approva o scarta un comando destinato ai telefoni elencati, con «Approva e invia» oppure «Rifiuta». La richiesta vale 60 minuti: nel codice la durata è `DURATA = 3600` secondi, in `lib/MobileV3/Push/CommandApprovals.php`, e la pagina mostra la colonna «Valido fino». Dopo un'ora la richiesta non si approva più. […]

**Rewritten:**
> Ufficio e campo si incontrano anche senza che l'ufficio tocchi il telefono. Un esempio preciso sono i comandi remoti: un messaggio all'operatore, la richiesta di riscaricare gli interventi, l'invito ad aggiornare l'app, mandati ai telefoni dall'ufficio. Nelle commesse che hanno i comandi remoti attivi, un comando non parte subito: resta in attesa finché un amministratore della propria azienda non lo approva. Il posto è Impostazioni › Dispositivi mobili, sezione «Telefoni GOPlanner 3». Ogni comando in attesa ha la colonna «Valido fino» e due pulsanti: «Approva e invia» lo manda ai telefoni elencati, «Rifiuta» lo scarta. La richiesta vale 60 minuti; scaduta, non si approva più e va rifatta. […]

**Why:** Il paragrafo descriveva l'approvazione di qualcosa che non definiva mai: il lettore non sapeva che cosa stesse approvando. I tre esempi vengono dalla tabella dei comandi in `docs/mobile-v3/comandi-remoti.md`. La condizione «nelle commesse che hanno i comandi remoti attivi» viene da `approvazione-comandi-remoti.md`; senza, la funzione era data come generale (Anti-AI n. 8). La costante `DURATA = 3600` in una sezione per tutti era codice senza avviso. «Vale 60 minuti» e «Dopo un'ora» erano la stessa frase detta due volte.

### R4 — Che cos'è un'esecuzione (sezione 4)

**Original:**
> Dove sta l'esito? In un'esecuzione, cioè una riga della tabella `interventi_eseguiti`. Con l'esito arrivano le letture, le foto, la firma e la posizione del telefono, e i campi personalizzati dove la commessa li raccoglie. Nel modello dati più vecchio la colonna `esito` vale 1 per «eseguito» e 0 per ogni altro risultato; con `esito = 1` la lettura e, se serve, la nuova matricola devono essere presenti. Il risultato vero e proprio sta nello stato. Un «non eseguito» porta il suo motivo: un codice, una segnalazione scelta dalla tabella `segnalazioni` (al massimo 25 caratteri in GOPlanner 3) e le note. In GOPlanner 3 i tipi di esito sono cinque: eseguito, non fattibile, ripianificabile, rapportino e utente assente. In alcune commesse il «rapportino», che salva senza chiudere, si chiama «Da finire».

**Rewritten:**
> Dove sta l'esito? In un'esecuzione: la registrazione di ciò che l'operatore ha fatto su quell'intervento. Con l'esito arrivano le letture, le foto, la firma e la posizione del telefono, e i campi personalizzati dove la commessa li raccoglie. Un «non eseguito» porta il suo motivo: un codice, una segnalazione scelta da un elenco e le note. In GOPlanner 3 i tipi di esito sono cinque, e ciascuno lascia l'intervento in uno stato preciso.
>
> *(seguono una tabella esito → stato: Eseguito → 4; Non fattibile → 5; Ripianificabile → 8; Rapportino («Da finire» in alcune commesse): salva senza chiudere → 3 assegnato, come prima; Utente assente → 99. Poi un riquadro «Per gli sviluppatori» con `interventi_eseguiti`, `esito` 1/0, `stato_id`, `segnalazioni` e `EsitoCatalog.php`.)*

**Why:** Il paragrafo per tutti conteneva tre colonne e una tabella del database, senza avviso: ora stanno nel riquadro per gli sviluppatori. La tabella esito → stato viene da `lib/MobileV3/Domain/EsitoCatalog.php` (`DEFAULTS`, `stato_id` e `chiude`). Mostra invece di dire, e prepara la prima risposta al caso iniziale.

### R5 — La risposta al caso iniziale (sezione 4)

**Original:**
> Torna ora la domanda dell'inizio. «L'operatore ha registrato l'esito: perché l'utenza risulta ancora «assegnato»?» La risposta è nella regola con cui l'utenza riceve il suo stato. Lo stato dell'utenza non è un riassunto dei suoi interventi: è copiato. Il metodo `InterventoBase::updateStatoUtenza()` scrive sull'utenza […] Il lavoro non è andato perso. Le foto e gli esiti restano agganciati all'intervento eseguito, non all'utenza. Prima di aprire un ticket di sincronizzazione, si controlla se un altro intervento della stessa utenza risulta già «eseguito». Per riallineare lo stato, tutti gli interventi ancora aperti di quella utenza vanno chiusi o annullati: chiudere solo il più recente non basta. La regola completa dello stato dell'utenza è nel capitolo 3.

**Rewritten:**
> Torna ora la domanda dell'inizio. «L'operatore ha registrato l'esito: perché l'utenza risulta ancora «assegnato»?» Le risposte sono due: una si legge nella tabella qui sopra, l'altra chiede una regola.
>
> La prima: l'operatore ha registrato un rapportino. Il rapportino salva senza chiudere, quindi l'intervento resta in stato 3 e l'utenza lo mostra. L'esito che chiude deve ancora arrivare.
>
> La seconda sta nella regola con cui l'utenza riceve il suo stato. […] In nessuno dei due casi il lavoro è andato perso: le foto e gli esiti restano agganciati all'intervento su cui l'operatore li ha registrati, non all'utenza.
>
> Prima di aprire un ticket di sincronizzazione:
>
> 1. Guardate come l'operatore ha registrato l'intervento: se è un rapportino, l'intervento è ancora aperto e lo stato è giusto.
> 2. Controllate se un altro intervento della stessa utenza risulta già «eseguito». Dove Gea è attiva, questo controllo lo sa fare lei.
> 3. Se la commessa ammette più interventi aperti e volete che l'utenza mostri «eseguito», chiudete o annullate tutti gli interventi ancora aperti di quella utenza: chiudere solo il più recente non basta.

**Why:** La risposta copriva solo `interventi_multipli`. Il codice mostra un caso più semplice e valido in ogni commessa: rapportino → `STATO_ASSEGNATO`, `chiude => false`. Un lettore che ha «visto l'esito registrato» deve escluderlo per primo, altrimenti apre il ticket lo stesso. Il controllo era sepolto nella prosa; lo Style Bible vuole le procedure in passi numerati. Il nome del metodo è passato nelle Fonti, perché la sezione è per tutti. La frase su Gea viene da `stato-utenza-assegnato-dopo-chiusura.md` («Cosa può verificare il chatbot»).

### R6 — La storia di GOP-264 (sezione 6)

**Original:**
> Il caso che ha reso esplicita questa regola viene da un ticket. Un committente segnalò che mancavano delle foto. […] Il tablet coinvolto era fermo da 51 ore. Nelle stesse cinque settimane si contarono 22.173 errori su 95 dispositivi, tutti invii ripetuti di file già consegnati. Da quel caso ogni richiesta del telefono lascia due segni, l'ingresso e l'esito, con un identificativo comune. Su quei segni si basa oggi la domanda «dove si è fermato il dato».

**Rewritten:**
> Per i dati che partono dal telefono, questa domanda ha una storia, ed è registrata in un ticket. Un committente segnalò che mancavano delle foto. […] Il tablet coinvolto era fermo da 51 ore, e a scoprirlo non fu il sistema ma la segnalazione arrivata per telefono. Nelle cinque settimane esaminate i registri contavano 22.173 errori su 95 dispositivi: tutti invii ripetuti di file già consegnati, rumore che non diceva niente del tablet fermo. Da quel caso ogni richiesta del telefono lascia due segni, l'ingresso e l'esito, con un identificativo comune. Su quei segni si basa oggi la domanda «dove si è fermato il dato» (capitolo 12).

**Why:** GOP-264 non ha reso esplicita la regola generale del ciclo: ha creato la diagnosi del dato del telefono. La storia ora dice solo ciò che prova. «Nelle stesse cinque settimane» rimandava a un periodo mai nominato. Il numero 22.173 non spiegava perché contasse; ora si capisce che è rumore. La frase sulla segnalazione telefonica riprende il ticket («lo abbiamo scoperto perché ha telefonato il cliente», dossier [SHADOW]) senza la parola vietata. È il punto in cui il lettore sente il nemico del libro, il sapere che arriva per passaparola.

### R7 — L'obiezione su Gea (sezione 6)

**Original:**
> Terza obiezione. «Posso chiedere a Gea di correggere i dati da sola?» No: […] Il modello che sta sotto Gea non scrive mai sui dati: propone, e l'utente autorizza nell'interfaccia. Un esempio è la correzione di una mappatura di importazione: serve il permesso «Importare interventi»; un modello di sistema non si tocca mai, […]

**Rewritten:**
> Un'ultima obiezione. «Posso chiedere a Gea di correggere i dati da sola?» No: […] Gea non scrive mai sui dati da sola: propone, e decide l'utente. Un esempio è la correzione di una mappatura di importazione, cioè della regola che dice quale colonna del file va in quale campo di GOPlanner (capitolo 4). Serve il permesso «Importare interventi»; un modello di sistema non si tocca mai, […]

**Why:** «modello» è nella lista delle parole da evitare per Gea (CONTEXT.md), e due frasi dopo la stessa parola indica una mappatura: due sensi in tre righe. «Mappatura» non era mai stata definita nel capitolo; la definizione riprende quella del capitolo 4, per coerenza. «Terza obiezione» era sbagliata: era la quinta.

### R8 — Il limite della sezione 2

**Original:**
> Questo capitolo non spiega profili, ruoli e lotti di competenza. Basta sapere che ciò che una persona vede dipende dalla commessa e dai permessi. Le pagine del gestionale lo dicono in chiaro: «quali compaiono dipende dalla commessa e dai permessi dell'utente», […] Allo stesso modo il menu Admin è riservato al personale GOPlanner e gli utenti delle commesse non lo vedono. […]

**Rewritten:**
> Questo capitolo non spiega profili, ruoli e lotti di competenza: sono nel capitolo 11. Basta sapere che ciò che una persona vede dipende dalla commessa e dai permessi. Le voci di un menu compaiono o no secondo la commessa e i permessi dell'utente, e nella pagina «Clienti» colonne, campi di ricerca, pulsanti e filtri cambiano da commessa a commessa. […] All'estremo opposto c'è il menu Admin, riservato allo staff tecnico: gli utenti delle commesse non lo vedono. […]

**Why:** Le frasi citate vengono dalla wiki (`pagina-interventi-menu.md`, `pagina-clienti.md`), non dall'interfaccia: attribuirle alle «pagine del gestionale» manda il lettore a cercarle a schermo. «Personale GOPlanner» non è la parola del glossario. Mancava il rimando al capitolo 11.

### R9 — Il metodo del capitolo (sezione 1)

**Original:**
> Il metodo del capitolo sta in una riga. Dieci parole per nominare gli oggetti; sei passi per collocarli nel ciclo; per ogni passo, una pagina dove resta la traccia. […]

**Rewritten:**
> Il metodo del capitolo sta in tre righe. Dieci parole per nominare gli oggetti: utente, operatore, committente, commessa, utenza, lista, pratica, intervento, esito, stato. Sei passi per collocarli nel ciclo: importazione, pianificazione, app, esito, verifica, esportazione. Per ogni passo, una pagina dove resta la traccia. Le altre parole delle tabelle che seguono servono a non confondere queste dieci. […]

**Why:** NUF emotional-1 chiede una mappa stabile e ripetibile. L'introduzione promette «dieci parole», ma le tabelle ne mostrano una ventina e le dieci non erano mai elencate. Ora il lettore le ha in una riga e sa perché le altre ci sono.

## 8. Verdict

**REVIEWER_CORRECTIONS (45/60):** un capitolo 1 con un vero angolo e una tracciabilità quasi totale. Lo frenavano una risposta incompleta al suo stesso caso iniziale, tre funzioni per commessa date come generali, parole vietate dal glossario proprio nel capitolo che lo fissa e una voce da quaderno di ricerca. Tutto è corretto in `chapter_1.md` con 24 blocchi riscritti; restano solo voci opzionali di pipeline e di ricerca.
