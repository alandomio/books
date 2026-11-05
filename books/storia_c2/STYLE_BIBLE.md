# STYLE BIBLE: CHRONOS — Ai Confini dell'Impero (storia_c2)

> Riscritta da `storia_c/STYLE_BIBLE.md` per storia_c2 (5 novembre 2026). Tiene le voci di Alex, Maja, MEMO e Mission Control, le tre tracce, il metodo d'indagine, le regole su fatti, anacronismi e tipografia. Cambia lo schema del capitolo (circa 3.000 parole, tre scene), la leggibilità, le lingue, il filo del mistero, le immagini. Le decisioni D1-D9 sono quelle del `PRD.md`. Dove questa Style Bible e quella di storia_c divergono, vale questa.

## § 0. Che libro stiamo scrivendo

Un racconto da leggere **accanto al manuale**, non al suo posto (D1). Il manuale dà i nuclei; ogni capitolo di CHRONOS dà una storia, un documento vero e una domanda su cui ragionare. Il capitano: "Il libro non vuole essere un manuale di storia, ma un racconto che aiuta a comprendere e amare la storia." La lettrice di prova è sua figlia, 11-13 anni: ogni regola qui sotto serve a farle leggere un capitolo da sola, capire che cosa è successo e perché, e volere il seguito.

---

## § 1. Lo schema del capitolo (D3)

Circa **3.000 parole** (2.800-3.300). Sei parti, in quest'ordine.

### 1. Apertura (una pagina)

Mission Control parla ad Alex e Maja (e così al lettore). La pagina contiene:
- **la mappa** e **la linea del tempo** del capitolo (disegnate dai dati di `IMAGES.md`: nel testo bastano il segnaposto e la didascalia);
- **l'anno o il secolo detto in chiaro**, e dove siamo rispetto al capitolo precedente;
- **la domanda guida**, in una riga;
- **l'aggancio al manuale**: "Sul tuo libro di storia è il capitolo su [nucleo]. Qui lo guardiamo da vicino.";
- **l'ipotesi iniziale**: la spiegazione semplice, come la darebbe un manuale, in una catena di causa ed effetto, seguita da una sola frase che dice che qualcosa non torna, senza spiegare che cosa.

Niente elenco degli obiettivi scena per scena (in storia_c occupava mezza pagina): bastano i tre titoli delle scene con luogo, anno e voce narrante.

**Gold Sample (dal volume del primo anno, `storia_b`, per ritmo e registro, non per contenuto):**
> Ciao Alex. Allaccia le cinture, perché il tuo primo salto temporale è un classico: il 476 d.C.
> Tutti i libri di storia dicono che qui finisce il mondo antico. Boom. Fine dell'Impero Romano. Medioevo. Buio.
> Ma la storia non funziona a interruttori. Non è che la gente è andata a dormire romana e si è svegliata medievale.

**Gold Sample 2 (versione "indagine", da storia_c):**
> MISSIONE 01 — CHI HA APERTO L'OCEANO?
>
> Il manuale propone questa catena: 1453 → Costantinopoli cade → le vie dell'Asia si chiudono → gli europei cercano una rotta oceanica.
>
> Qualcosa non torna. Le prime spedizioni portoghesi sono cominciate decenni prima.

### 2. Tre scene (600-700 parole ciascuna)

- **Almeno una di Maja su un fatto europeo**, non solo sloveno: Maja non è "quella della parte slovena".
- **Almeno una con Alex e Maja sullo stesso evento**, da prospettive diverse (vedi § 4).
- In almeno una delle tre scene il capitolo tocca il Litorale o le terre slovene.
- **Equilibrio nel libro:** Alex e Maja narrano, sull'intero volume, un numero di scene simile. Chi scrive la struttura di un capitolo tiene il conto dei capitoli precedenti.
- Ogni scena segue l'Arco di Scena (§ 6) in forma compatta: in 600-700 parole non c'è spazio per due interviste e tre riquadri.

### 3. Riquadro "Cosa devi ricordare"

3-4 conoscenze essenziali, una riga ciascuna: quello che serve anche per l'interrogazione. Va dopo la terza scena o dopo il checkpoint, mai a metà di una scena.
```markdown
::: reality-check
### COSA DEVI RICORDARE

1.  [Fatto essenziale in una frase]
2.  [Fatto essenziale in una frase]
3.  [Fatto essenziale in una frase]
:::
```

### 4. Un documento vero

Un'immagine o un breve estratto di una fonte reale, con **una domanda** per il lettore ("Guarda il frontespizio: perché l'autore non mette il suo nome?"). Il documento viene da `IMAGES.md` o dal dossier, con fonte e segnatura nell'appendice per l'insegnante. Prende il posto della maggior parte dei riquadri SCANNING di storia_c (al massimo un riquadro SCANNING per capitolo, solo se l'oggetto è al centro di una scena).
```markdown
::: documento
### DOCUMENTO: [Titolo breve]

![Didascalia: che cosa è, chi l'ha fatto, quando.](immagini/capN_documento.jpg)

**Guarda bene:** [la domanda, in una riga]
:::
```

### 5. Checkpoint

Il lettore sceglie **e motiva** la sua scelta **prima** del verdetto.
```markdown
::: checkpoint
### CHECKPOINT: [la domanda in una riga]

Finora hai visto: [due prove già mostrate, in una riga].

*   **A.** [prima lettura plausibile]
*   **B.** [seconda lettura plausibile]

Scegli e scrivi perché, in una frase, prima di andare avanti.
:::
```
**Esiti variati (obbligatorio).** Il verdetto può dare ragione ad A, a B, a nessuna delle due, oppure lasciare una domanda aperta. Nell'intero libro compaiono tutti e quattro gli esiti, e lo stesso esito non compare in più di due capitoli di fila. Le due letture sono entrambe plausibili sulle prove mostrate: mai un tranello ovvio. Chi struttura un capitolo annota l'esito nel file di struttura e controlla quelli dei capitoli precedenti.

### 6. Debriefing breve

Mission Control chiude in poche righe:
- **verdetto** in 2-4 frasi, una risposta che uno studente potrebbe scrivere sul quaderno, con l'esito del checkpoint;
- se serve, **una cosa che non sappiamo ancora** (una sola, non un elenco);
- **l'aggancio al capitolo successivo**, sotto forma di domanda, senza anticipare la risposta.

La Cronologia Essenziale di storia_c non serve più: la linea del tempo è nella pagina d'apertura.

### Il capitolo 0

Resta un capitolo di orientamento nel presente, più corto (circa 2.000 parole), senza checkpoint né verdetto. Fa quattro cose, una volta per tutto il libro: presenta Alex, Maja e MEMO; insegna il metodo con una prova a bassa posta (la pallina di carta di storia_c, già approvata dall'autore); stabilisce la convenzione Fatto/Stima/Ricostruzione (§ 7); apre il mistero di famiglia (§ 5) e dice, con una riga leggera, che la famiglia è inventata e la storia intorno no.

---

## § 2. Leggibilità (D8)

Le soglie si misurano con `checks.sh` su ogni capitolo:
- **2.800-3.300 parole**;
- **Gulpease ≥ 65** (formula 89 + (300 × frasi − 10 × lettere) / parole);
- **frase media sotto le 14 parole**;
- **al massimo 5 termini nuovi** nel glossario del capitolo.

Come ci si arriva:
- **Un concetto nuovo alla volta.** Dopo una frase con un concetto nuovo, la frase successiva è corta e concreta: un esempio, un oggetto, un gesto.
- **Al massimo 2 nomi propri nuovi per scena** che il lettore deve ricordare. Gli altri restano sullo sfondo, senza spiegazione.
- **Frasi corte, ma non tutte uguali:** dopo una frase lunga e descrittiva, una frase corta che dice la posta in gioco.
- **Parole tecniche:** solo quelle che servono alla domanda del capitolo; ognuna spiegata dentro la frase o nel glossario, alla prima occorrenza.
- **Numeri:** pochi, tondi, con un paragone che un dodicenne capisce ("quanto un camion", "più di tre mesi senza vedere terra").

---

## § 3. Le voci

### Mission Control (Regista)

Apre e chiude ogni capitolo in stile documentaristico-avventuroso, mai infantilizzante, mai con una morale dichiarata. Nel debriefing ricongiunge le tracce comparse nel capitolo: non chiude solo sull'Europa né solo sul locale.

**Gold Sample (`storia_b`, per ritmo):**
> "Il 476 d.C. non è la fine del mondo. È un riavvio. Il sistema è andato in crash, sì, ma il software si sta riscrivendo."

### MEMO

L'intelligenza artificiale di bordo: voce in corsivo, clinica, asciutta, dati senza empatia. **Al massimo 3 informazioni per intervento.** Non sceglie mai al posto dei cronoriporter quale lettura delle prove regga. Con Alex battibecca (lui risponde con un commento sarcastico interiore, breve, mai crudele); con Maja collabora. Quando una scena mostra qualcosa di non documentato, è MEMO a dirlo con una riga leggera (§ 7).

### Alex (voce: Europa e mondo, Alto Adriatico)

Ragazzo moderno, curioso, alla sua seconda missione (continuità con `storia_b`). Legge la storia attraverso le **persone**: un individuo davanti a una scelta. Davanti a qualcosa di duro reagisce con l'ironia, poi la cosa lo colpisce davvero, una riga dopo. Ha una sicurezza da "veterano" che a volte scivola in sufficienza verso Maja, e non se ne accorge finché lei non glielo fa notare. Si convince troppo in fretta: confonde plausibilità e prova. È impaziente, competitivo, a volte fa il broncio quando lei lo corregge, poi lo ammette.
- **Che cosa nota per primo:** spesso l'odore o un dettaglio materiale; il *perché* storico arriva subito dopo.
- **Tic:** arriva con un'aspettativa da film o da libro di scuola e la scena la smentisce con un dettaglio concreto. Al massimo 2 volte per capitolo (con tre scene, 3 sarebbero troppe).
- **Nel presente:** tratti leggeri da ragazzo di oggi, liberi (non pallavolo e k-pop, che sono di Maja, se il capitano non decide diversamente).

**Gold Sample (`storia_b`, per ritmo e meccanismo):**
> La prima cosa che mi colpisce non è la vista. È l'odore.
> È un pugno in faccia. Un mix pungente, denso e quasi solido di aglio stantio, fumo di legna umida, spezie sconosciute e qualcosa di dolciastro e marcio che mi chiude lo stomaco.
> [...] Non indossa l'armatura a piastre luccicante che mi aspettavo, quella dei film di Hollywood.
> Indossa una cotta di maglia arrugginita [...]
> La storia non finisce con un punto esclamativo. Finisce con dei puntini di sospensione.

### Maja (voce: terre slovene, e anche fatti europei)

Coetanea di Alex, cresciuta tra Lubiana e il Carso. Legge la storia attraverso le **strutture**: chi ha scritto la legge, chi controllava il dazio, in che lingua si firmavano gli atti. Davanti a un'ingiustizia la nomina, a voce ferma. Vuole essere presa sul serio come cronoriporter alla pari. Il suo punto cieco: a volte legge come sgarbo una distrazione di Alex, e a volte vede un'intenzione politica dove c'era solo necessità pratica. È più matura emotivamente di Alex, ma mai materna o da maestra con lui: resta sua pari, con le sue incertezze.
- **Che cosa nota per primo:** chi parla, in quale lingua, e chi decide se quella lingua conta.
- **Tic:** "perché nessuno lo racconta mai?", seguito subito da un dettaglio che dimostra l'importanza del fatto. Al massimo 2 volte per capitolo.
- **Nel presente (D9):** ama gli animali e la natura, va in bici, gioca a pallavolo, ascolta k-pop. Questi tratti compaiono a Mission Control, nei messaggi e tra un salto e l'altro, **mai nelle scene storiche**.
- **Nelle scene su fatti europei** non è una turista: porta lo stesso sguardo sulle strutture (chi firma, chi resta fuori dal documento).

**Gold Sample (esempio scritto per la Style Bible di storia_c, inventato, per ritmo e meccanismo):**
> Non sento il fuoco del camino prima di sentire le parole.
> È la prima cosa che noto sempre, ancora prima dell'odore di inchiostro fresco che riempie la stanza: la lingua in cui qualcuno mi sta parlando.
> Per strada, fuori, parlano tedesco. Ma qui dentro un uomo sta scrivendo in una lingua che io conosco benissimo, e che in questo preciso momento della storia non esiste ancora su una sola pagina stampata al mondo.

---

## § 4. Alex e Maja insieme

**Complementarità.** Alex legge le persone, Maja le strutture. Nessuno dei due ha "ragione": il debriefing mostra spesso come le due letture si completano.

**Regola fondamentale.** Nessuno parla al posto dell'altro, ma ciascuno può mettere alla prova le conclusioni dell'altro. Le prove di Maja obbligano Alex a rivedere le sue, e viceversa: mai isolamento.

**La scena condivisa (una per capitolo, D3).** Stesso evento, stesso istante, due sguardi. Una sola voce narrante in prima persona per scena (la firma lo dice); l'altro personaggio parla nei dialoghi. Il disaccordo è materiale narrativo, non un problema da risolvere in scena. Quando i due salti sono sullo stesso istante, è Mission Control ad averli sincronizzati: non esiste comunicazione tra epoche diverse.

**Errori asimmetrici e con conseguenze (D4).** Mai Alex ingenuo e Maja infallibile.
- Alex confonde plausibilità e prova; Maja attribuisce troppo significato politico a una scelta pratica.
- Alex vede una continuità materiale (una merce, un oggetto) che Maja trascura; Maja vede una voce esclusa dalle fonti che Alex non cercava.
- **Un errore ha una conseguenza visibile nella storia** (un indizio perso, un testimone che se ne va, un capitolo in cui uno dei due indaga da solo), non solo una correzione a voce. In `MYSTERY.md` ci sono esempi capitolo per capitolo.

**Arco: dalla rivalità alla fiducia** (traccia, non obbligo rigido):
- **Cap. 0, attrito:** Alex la tratta da assistente, lei rimette subito a posto la gerarchia; la sfida sul mistero comincia.
- **Cap. 6, complementarità:** Alex raccoglie spontaneamente indizi utili alla traccia di Maja; lei riconosce che la sua curiosità fa parlare testimoni che lei non avrebbe avvicinato.
- **Cap. 10, fiducia:** uno dei due ha una prova molto convincente ma aspetta il controllo dell'altro prima del verdetto.
- **Cap. 11, inversione:** Maja si affeziona a una sua interpretazione; è Alex a chiederle "che cosa potrebbe smentirti?".
- **Cap. 12, eco finale:** nessuna scena "siamo diventati amici"; l'arco si vede per accumulo di segnali.

**Frizioni disponibili:** anzianità contro legittimità; ironia contro serietà; persona contro sistema; passo emotivo diverso. Non risolverle sempre a favore dello stesso.

---

## § 5. Il filo del mistero (D4)

- **150-250 parole a capitolo**, in apertura o in chiusura, mai una quarta scena.
- Un mistero di famiglia che attraversa i secoli e si scioglie al capitolo 12. Proposta e indizi capitolo per capitolo in `MYSTERY.md`; la scelta finale spetta al capitano.
- **La famiglia è inventata, la storia intorno no.** Lo si dice una volta, nel capitolo 0.
- **Gli oggetti della famiglia non sono mai il documento vero del capitolo**, e la famiglia non compare mai dentro un documento reale.
- Il filo illumina la domanda storica del capitolo, non la sostituisce.

---

## § 6. La scena

**Arco di scena** (fasi, non paragrafi; in 600-700 parole alcune durano una riga):
1. **Ancoraggio:** un dettaglio fisico concreto (odore, suono, materiale) dal `[SHADOW]` del dossier; mai una data o un nome nudo per primo. La formula "la prima cosa che sento non è X, è Y" al massimo una volta per capitolo.
2. **Incontro:** il personaggio storico entra, descritto per oggetti, vestiti, gesti.
3. **Scarto (Alex) o domanda scomoda (Maja).**
4. **Intervista:** almeno 2 scambi di dialogo; l'informazione storica passa soprattutto da qui.
5. **L'oggetto o il dato** che fissa il concetto.
6. **Chiusura** con una frase breve e concreta, senza morale.

**Vita quotidiana e sopravvivenza.** Ogni capitolo (non ogni scena: con tre scene corte basta così) contiene almeno un "come facevano a...?" concreto, preso dal `[LIFE-HACK]` del dossier: conservare il cibo, scaldarsi, curarsi, spostarsi, proteggersi. Spesso è il modo migliore per spiegare il concetto storico (il sale non è un condimento, è la tecnologia che conserva il cibo).

**Il confronto col presente.** Alex e Maja sono ragazzi di oggi: un dettaglio dato per scontato (acqua corrente, luce, scuola per tutti) può far nascere una battuta di stupore. Mai una frase-lezione ("che fortuna abbiamo oggi!").

**Natura e animali (D9).** Dove il dossier li documenta, cavalli, muli, api, pesci, il fiume, il lago, il Carso entrano nella scena come parte del lavoro e della vita delle persone, non come decorazione.

**Dialoghi.** Nome in grassetto, due punti, battuta tra virgolette, ogni battuta su una riga separata da una riga vuota.
```markdown
**Alex:** "Testo del dialogo."

**Maja:** "Testo del dialogo."

**[Nome Personaggio Storico]:** "Testo del dialogo."
```

**Firma della scena (obbligatoria).** Sotto il titolo della scena, la firma di chi racconta, in HTML (classe `byline`, che `checks.sh` conta):
```markdown
## La Porta e la Mappa
<span class="byline">Cronaca di Alex</span>
```
In sloveno: `<span class="byline">Poroča Alex</span>` / `<span class="byline">Poroča Maja</span>`. L'apertura e il debriefing (Mission Control) non hanno firma.

---

## § 7. Fatti, stime e racconto (D6)

**Tre categorie, mai confuse:**
1. **Fatto documentato:** si scrive senza esitazione, con la cifra o la data del dossier.
2. **Stima o dato conteso** (`[ESTIMATE]` nel dossier): mai una cifra secca; si usa un intervallo o "si stima", "le fonti non sono d'accordo".
3. **Dialogo ricostruito** con un personaggio storico reale (`[RECONSTRUCTED]`): la convenzione si dichiara una volta nel capitolo 0 ("Quando non abbiamo le loro parole esatte, le abbiamo ricostruite in modo plausibile").

**Scene romanzate: sì, con due limiti.**
1. Una scena **non contraddice ciò che il dossier documenta**.
2. Il testo **non si smentisce da solo**. Caso da non ripetere: la scena del console Wagner nel cap. 5 di storia_c (lo studio consolare e il metodo dei dispacci mostrati come veri, poi MEMO che dice "zero dispacci, probabilmente mai esercitato"). O la scena mostra solo ciò che è documentato, o è dichiarata immaginata **all'inizio** con una riga leggera di MEMO. Mai la smentita dopo come colpo di scena.

**Riga leggera di MEMO.** Quando si mostra qualcosa di non documentato basta una riga ("*Questa stanza non la conosciamo: la immaginiamo così.*"), senza lezione di metodo.

**Cifre.**
- Niente cifre precise senza fonte nel dossier: si usano intervalli o parole come "la maggioranza", "più di", "quasi".
- Le voci `[NO SOURCE]` dei dossier dicono quale dicitura usare: si usa quella.
- Un riquadro che riporta un dato stimato lo dice nel riquadro stesso ("stimato", "circa").

**Collegamenti tra scene.** Un elemento passa da una scena all'altra solo se le date lo permettono. Esempio da non ripetere (cap. 1 di storia_c): a Lubiana nel 1489 Maja riconosce "il carico partito oggi da Zaule", ma la scena di Alex a Zaule era nel 1463.

**Contenuti duri** (malattia, violenza, morte): ammessi, ma proporzionati. Meglio l'implicito che il dettaglio clinico.
> Calibrato: "Le gengive sono gonfie e scure, tanto da coprire i denti. Una vecchia cicatrice ha ricominciato a sanguinare. Nessuno a bordo conosce la causa."

---

## § 8. Immagini (D5)

- Ogni capitolo ha mappa e linea del tempo nella pagina d'apertura e un documento vero (§ 1).
- **Solo documenti autentici di pubblico dominio**, con fonte e segnatura nell'appendice per l'insegnante (`IMAGES.md` per la prima ricerca).
- **Mappe e linee del tempo** si disegnano dai dati del dossier: niente luoghi o date che il dossier non contiene.
- **Niente illustrazioni storiche inventate.** La generazione AI è ammessa solo partendo da una foto vera (pulizia, ritaglio, adattamento), senza aggiungere nulla che la foto non mostri.
- La didascalia dice sempre che cosa è, chi l'ha fatto e quando; se un'immagine è stata fatta dopo l'evento (un dipinto di anni dopo), la didascalia lo dice.

---

## § 9. Riquadri (HUD)

Sintassi Pandoc a blocchi `:::`, identica nelle due lingue. Dopo il titolo del riquadro, sempre una riga vuota.

| Riquadro | Quanti per capitolo | Uso |
|---|---|---|
| `checkpoint` | 1 (obbligatorio) | § 1.5 |
| `reality-check` "Cosa devi ricordare" | 1 (obbligatorio) | § 1.3 |
| `documento` | 1 (obbligatorio) | § 1.4 |
| `memo-box` "MEMO GLOSSARIO" | al massimo 1, al massimo 5 termini | solo i termini che servono alla domanda del capitolo |
| `target-profile` (scheda personaggio) | al massimo 1 | il personaggio storico più importante del capitolo |
| `scan-result` | al massimo 1, facoltativo | solo se un oggetto è al centro di una scena |
| Easter egg cifrato | al massimo 1, facoltativo | in nota; il primo del libro (cap. 0) insegna come si decifra |

**Scheda personaggio** (ridotta rispetto a storia_c):
```markdown
::: target-profile
### SCHEDA PERSONAGGIO: [Nome]

*   **Ruolo:** [epoca, luogo, mestiere in una riga]
*   **Abilità Speciale:** [l'unica cosa che lo rende straordinario in quel momento, o il "superpotere rovesciato": banale per lui, sovrumano per noi]
:::
```
Test dell'Abilità Speciale: se la frase descrive chiunque altro nello stesso mestiere, è troppo debole ("Stampa il primo libro sloveno" → "Trasforma la lingua dei contadini in una lingua di libri").

**Glossario:**
```markdown
::: memo-box
### MEMO GLOSSARIO

*   **[Termine]:** Definizione in una frase.
:::
```

---

## § 10. Le due lingue (D7)

- **Prima l'italiano.** Lo sloveno si scrive quando il capitolo italiano è approvato.
- **Lo sloveno è un adattamento leggero:** stessa struttura, stesse scene, stessi documenti, stesso glossario; frasi riscritte in modo naturale, non calcate. Si può spostare un inciso, cambiare un modo di dire, accorciare una frase.
- **Test anti-calco:** se leggendo un paragrafo sloveno si ricostruisce l'ordine delle frasi italiane senza averle lette, è un calco: va riscritto.
- **Vocabolario sloveno:** *Naloga* o *Odprava* (non *Misija*); *Cesarstvo* (non *Imperij* generico); toponimi storici sloveni quando pertinenti (*Ljubljana*, *Kranjska*); nomi di sovrani e personaggi sempre verificati su Wikipedia SL e fonti slovene.
- **Slang:** Alex e Maja parlano come ragazzi veri in entrambe le lingue, con slang autentico e leggibile; lo slang non si traduce parola per parola. Mai in bocca ai personaggi storici.
- **Rese delle tracce** (mai le sigle interne nel testo):

| Tag interno | Italiano | Sloveno |
|---|---|---|
| `EU` | Europa e mondo | Evropa in svet |
| `GIULIA` | Alto Adriatico | Zgornji Jadran |
| `SLOVENIA` | terre slovene | slovenske dežele |

---

## § 11. Anacronismi

- **Oggetti:** niente valigie (bauli, sacche), niente fiammiferi prima del 1826 (acciarino), niente tasche dove non esistevano.
- **Cibo:** niente pomodori, patate, mais, cioccolato prima della loro diffusione in Europa dopo il 1492 (attenzione nei capitoli 1-4).
- **Modi di dire:** niente espressioni moderne ("ok", "stress", "wow") in bocca ai personaggi storici; Alex e Maja possono usarle.
- **Il presente della lettrice** (pallavolo, k-pop, telefono, social) resta nel presente: mai in una scena storica.
- Il `[ANACHRONISM-WATCH]` di ogni dossier è vincolante.

---

## § 12. Tipografia e parole vietate

- **Titolo del capitolo** solo in apertura: `# Capitolo N — Titolo`, maiuscole normali. La parola "Capitolo" non compare altrove nel testo.
- **Titoli delle scene:** solo il sottotitolo (`## Il Sottotitolo Della Scena`); mai "Scena N", "Beat N", mai TUTTO MAIUSCOLO. Le parole di produzione (scena, beat, NUF, gate, EU/GIULIA/SLOVENIA) non compaiono mai nel testo, né in bocca ai personaggi.
- **Frasi vietate:** "come sappiamo", "è importante notare", "non c'è bisogno di dire che", "e la morale è che", "questo ci insegna che", "Immaginate di essere...", "Ebbene sì...", "Sorprendentemente...", "un momento cruciale della storia".
- **Pattern vietati:** personaggio storico che spiega la propria epoca come in una lezione; Alex o Maja che riassumono un fatto già mostrato; la scena slovena aperta con "anche in Slovenia..." o "nel frattempo, nelle terre slovene..."; morale esplicita in chiusura.

---

## § 13. Checklist del capitolo

**Automatica** (`checks.sh`): parole 2.800-3.300; Gulpease ≥ 65; frase media < 14 parole; glossario ≤ 5 termini; tre firme di scena, almeno una di Maja; riquadro "Cosa devi ricordare" presente.

**A mano:**
1. La pagina d'apertura ha mappa, linea del tempo, domanda guida, aggancio al manuale e ipotesi iniziale con la crepa?
2. C'è una scena di Maja su un fatto europeo e una scena condivisa sullo stesso evento?
3. Il documento è vero, con fonte, e ha una domanda per il lettore?
4. Il checkpoint chiede una scelta motivata prima del verdetto? L'esito è diverso da quello dei due capitoli precedenti, o la ripetizione è giustificata?
5. Ogni cifra ha fonte nel dossier, e ogni `[ESTIMATE]` e `[NO SOURCE]` è resa con la dicitura prudente?
6. Nessuna scena è smentita dal testo stesso? Ogni cosa non documentata ha la sua riga leggera di MEMO all'inizio?
7. Il filo del mistero sta in 150-250 parole e rispetta le regole del § 5?
8. Zero anacronismi, zero parole di produzione, zero frasi vietate?
9. Alex e Maja suonano come due ragazzi diversi, e nessuno dei due ha sempre ragione?
10. Una lettrice di 12 anni capirebbe che cosa è successo e perché, e vorrebbe leggere il seguito?
