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

## Controlli automatici

`./checks.sh chapter_1_it.md` misura parole (2.800-3.300), indice Gulpease (≥ 65, formula 89 + (300 × frasi − 10 × lettere) / parole), frase media (< 14 parole), termini di glossario (≤ 5), firme di scena (3, almeno una di Maja) e presenza del riquadro "Cosa devi ricordare"; esce con codice 1 se un controllo fallisce. Serve solo `python3`.

- Il capitolo 0 è di orientamento (circa 2.000 parole, senza scene d'indagine): per lui valgono solo Gulpease e frase media.
- **Taratura.** Sui capitoli di storia_c lo script dà un Gulpease più alto di 2-5 punti rispetto alle misure del grill del 5 novembre (per esempio cap. 1: 62,3 contro 59; cap. 5: 58,3 contro 56), perché il metodo di conteggio di quelle misure non è registrato. Lo script usa già il conteggio più prudente (una frase finisce solo con . ! ? …; l'elisione "l'acqua" conta una parola). La soglia resta 65 e il confronto tra capitoli si fa sempre con questo script.

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
