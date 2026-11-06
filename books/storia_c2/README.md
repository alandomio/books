# storia_c2 — CHRONOS, nuova versione (fase 1)

Cartella della nuova versione di CHRONOS per la seconda media. `storia_c` resta com'è, come archivio. Le regole del libro sono in `PRD.md` e `STYLE_BIBLE.md`.

| File | Che cosa contiene |
|---|---|
| `PRD.md` | Il progetto del libro con le decisioni D1-D9 del 5 novembre 2026 |
| `STYLE_BIBLE.md` | Voci, schema del capitolo, regole di scrittura e checklist |
| `dossier_chapter_0..12.md` | I dossier di ricerca di storia_c, corretti (vedi sotto) |
| `IMAGES.md` | Mappe, linee del tempo e documenti veri di pubblico dominio, capitolo per capitolo |
| `MYSTERY.md` | Tre opzioni per il mistero di famiglia di Alex e Maja, con quella raccomandata |
| `checks.sh` | Controlli automatici di un capitolo (regola D8) |
| `ralph.sh` | La pipeline di scrittura capitolo per capitolo (vedi sotto) |
| `INSTRUCTION.md` | Chi fa che cosa nella pipeline e quali file produce; titolo e versione per `publish.sh` |
| `NARRATIVE_GLOSSARY.md` | Glossario bilingue di storia_c, base di partenza **da sfoltire**: ogni capitolo usa al massimo 5 termini nuovi (D3) |
| `publish.sh` | Costruisce ePub e PDF: edizione italiana con l'appendice per l'insegnante; edizione slovena solo con i capitoli già adattati |
| `generate_cover.sh` | Copertina da un'immagine vera di pubblico dominio più titolo e autore; nessun modello, salvo `--ai` (D5) |
| `PUBLISH_CONFIG.md` | Autore, titolo sloveno, descrizione, immagine di base della copertina e suo credito |
| `style.css`, `epub_style.css` | Stile di stampa ed ePub dei riquadri, con il nuovo riquadro `documento` |
| `00_disclaimer_it.md`, `00_disclaimer_sl.md` | Nota metodologica in apertura del libro, versione 2.0 |
| `dist/metadata_it.yaml`, `dist/metadata_sl.yaml` | Metadati delle due edizioni (titolo, versione, identificativo); `publish.sh` li rigenera |

Copiati da storia_c e adattati; **non** sono stati copiati capitoli, manoscritti, `feedback_loop_*`, `linguista_note_*`, `HANDOFF.md`, `RETROFIT_PLAN.md` e `writing_plan.md` (che `ralph.sh` legge da `../storia_c/` solo come riferimento di contenuto). La traduzione slovena della nota metodologica va fatta rivedere da un madrelingua.

## Controlli automatici

`./checks.sh chapter_1_it.md` misura parole (2.800-3.300), indice Gulpease (≥ 65, formula 89 + (300 × frasi − 10 × lettere) / parole), frase media (< 14 parole), termini di glossario (≤ 5, nei riquadri `::: memo-box` con titolo "GLOSSARIO" o "SLOVAR"), firme di scena (3, almeno una di Maja) e presenza del riquadro `::: reality-check` "Cosa devi ricordare"; esce con codice 1 se un controllo fallisce. Serve solo `python3`.

- Il capitolo 0 è di orientamento (circa 2.000 parole, senza scene d'indagine): per un file il cui nome inizia con `chapter_0` lo script controlla solo Gulpease e frase media, e lo scrive nell'output.
- Gulpease e il controllo del riquadro "Cosa devi ricordare" valgono per i capitoli in italiano. L'adattamento sloveno è fuori da questa fase; lo script non ha una formula di leggibilità slovena.
- **Taratura.** Sui capitoli di storia_c lo script dà un Gulpease più alto di 2-5 punti rispetto alle misure del grill del 5 novembre (per esempio cap. 1: 62,3 contro 59; cap. 5: 58,3 contro 56), perché il metodo di conteggio di quelle misure non è registrato. Lo script usa già il conteggio più prudente (una frase finisce solo con . ! ? …, e non con il punto dopo una lettera maiuscola sola come "A." o dopo abbreviazioni come "a.C.", "sec.", "ecc."; l'elisione "l'acqua" conta una parola). La soglia resta 65 e il confronto tra capitoli si fa sempre con questo script.

## Come sono stati corretti i dossier

I dossier sono copie di quelli di storia_c con fonti e marcatori originali intatti (`[ESTIMATE]`, `[RECONSTRUCTED]`, `[CONFLICT]`, `[LIFE-HACK]`). In cima a ogni dossier un riquadro "Revisione storia_c2" elenca che cosa è cambiato. Nel testo:

- `[CORRETTO storia_c2: ...]` — un errore della verifica corretto, con la versione precedente spiegata e la dicitura da usare.
- `[NO SOURCE: ... Usare: "..."]` — una cifra precisa senza fonte; la cifra originale resta leggibile, e il marcatore dice quale dicitura usare nel capitolo.
- `[CONFLICT tra dossier: ...]` — due dossier si contraddicono; il marcatore dice quale dicitura prudente usare finché non si verifica.

**Correzioni della verifica:** il glossario Umanesimo/Rinascimento e il mito della Terra piatta (dossier 1), il "carico di sale" tra Zaule 1463 e Lubiana 1489 (dossier 1), il "settanta per cento circa" di parlanti sloveni (dossier 1), i popoli nativi e la cittadinanza americana (dossier 5), la scena del console Wagner (dossier 5). L'*Abecedarium* di 8 fogli resta: le fonti di catalogo del dossier lo sostengono.

**Criterio del controllo cifre.** Sono state estratte da tutti i dossier le cifre con unità di misura o percentuali (424 righe) e ognuna è stata confrontata con la fonte citata nella stessa voce. Una cifra è marcata `[NO SOURCE]` quando:
1. la fonte citata non può contenerla (periodo o argomento diversi);
2. è una quantità che nessuno misurò all'epoca (quote di parlanti, pesi corporei, probabilità, temperature, misure di oggetti in un dettaglio sensoriale) scritta come valore preciso, senza un censimento, un registro o un documento indicato;
3. è un calcolo o una conversione senza fonte (valore odierno, consumi);
4. contraddice un altro dato del dossier o un calcolo verificabile (per esempio lo scarto tra ora di Vienna e ora locale, che si ricava dalla longitudine).

Restano senza marcatore le cifre con una base documentaria indicata nella voce (censimenti, trattati, ruoli d'equipaggio, registri, richieste di risarcimento) e le stime già marcate `[ESTIMATE]` con un intervallo.

**Limiti.** Il controllo confronta cifra e fonte citata; non verifica in biblioteca le fonti stesse. Alcune citazioni dei dossier potrebbero non corrispondere a un'opera reale o al suo contenuto (un esempio segnalato nel dossier 1, voce 36). Prima della stampa l'appendice per l'insegnante va costruita controllando ogni fonte usata nel capitolo.

## La pipeline (`ralph.sh`)

`./ralph.sh 1 plan` (oppure `./ralph.sh 1 --dry-run`) stampa le fasi del capitolo 1 senza chiamare alcun modello. `./ralph.sh 1` esegue la parte italiana: Architect (`chapter_1_struttura.md`), Researcher (aggiunge al dossier solo le lacune che la struttura elenca, senza toccare le voci esistenti), ricerca immagini (`images_chapter_1.md`, solo documenti veri), Writer in due passaggi (`chapter_1_it.md` e l'appendice per l'insegnante `appendice_chapter_1.md`), Editor, Reviewer. Nell'Editor `checks.sh` è un vincolo rigido: se fallisce, il capitolo non passa qualunque cosa dica il modello. Lo sloveno (`./ralph.sh 1 linguista`) parte solo quando esiste `chapter_1_it.approved`, che il capitano crea dopo la lettura di prova. `./ralph.sh 1 status` mostra a che punto è il capitolo. Se si rilancia `./ralph.sh 1` (per esempio dopo che l'Editor si è fermato per troppi tentativi falliti), le fasi che hanno già prodotto il loro file vengono saltate, e il Researcher salta se il dossier ha già la sezione `## [AGGIUNTE storia_c2 — capitolo 1]`; `--force` le rifà, e per il Researcher aggiunge una nuova sezione in fondo al dossier invece di modificare quella esistente.
