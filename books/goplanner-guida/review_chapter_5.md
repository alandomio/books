# Revisione — Capitolo 5, «Pianificazione e giri»

Reviewer, 25 novembre 2026. Letti: `PRD.md`, `STYLE_BIBLE.md`, `chapter_5_struttura.md`, `chapter_5.md`, `dossier_chapter_5.md`. Tre fatti nuovi sono stati verificati sul codice `php8` (`lib/JSONController.php`, `put_incarichi`; `Smarty_templates/it/interventi.html`, vista `piano_intervento`) prima di entrare nel testo. `chapter_index.md` e `NARRATIVE_GLOSSARY.md` non esistono ancora, quindi il controllo di continuità con i capitoli 3 e 4 resta da fare.

## 1. Executive Summary

È un buon capitolo, e nelle sezioni 2, 3 e 6 è il migliore della Parte II per concretezza: etichette esatte, regole con il loro perché, e tranelli che il lettore non troverebbe da solo («Calcola distanza» che toglie le utenze dalla mappa, Lazo che conta due volte, «Elimina» che cancella tutti i giorni). Le correzioni servono per quattro difetti veri, non di stile:
1. una **contraddizione sui valori di precisione** nella sezione 6, che ha portato a un segnale diagnostico sbagliato nel riquadro per lo staff;
2. un **problema di una sola commessa scritto come regola generale** in apertura della sezione 4 (Anti-AI checklist n. 8);
3. **tre tranelli presenti nel dossier o nel codice e assenti dal testo**: la data in formato sbagliato che diventa «oggi», la riga «interventi annullati» del riepilogo non spiegata, il campo «Tempo sul posto» che la scheda suggerisce ma che nelle commesse a «Mattina e pomeriggio» non esiste;
4. la conseguenza pratica dell'ordine di visita, che il testo descrive senza dirla: dopo «Assegna», in pratica il giro è in ordine alfabetico.

Prova del lettore: per le sezioni 2, 3 e 6 la risposta è «l'ho vissuto», per le sezioni 4 e 5 prima delle correzioni era «me l'hanno detto».

## 2. Score: 47/60 → REVIEWER_CORRECTIONS

| Dimensione | Voto | Motivo in una riga |
|---|---|---|
| 1. Narrativa e struttura | 8/10 | Parte da un caso con numeri e chiude sulla regola richiesta; la sezione 5 elenca etichette invece di rispondere a domande |
| 2. Lingua, stile e voce | 8/10 | Voce tenuta quasi ovunque; qualche frase confusa («cerchio di raggio fisso») e tre affermazioni di frequenza senza fonte |
| 3. Accuratezza | 7/10 | Quasi tutto trova riscontro nel dossier; una contraddizione interna (-1/0), una generalizzazione da una commessa, date di commit presentate come date di arrivo |
| 4. Allineamento al lettore | 8/10 | Le procedure ci sono; mancano il «dove si legge il conto», l'acronimo UT, il senso della riga «annullati» |
| 5. Concretezza ed effetto | 8/10 | «L'utenza aspetta alle 11:30» e «il silenzio non vuol dire che l'operatore arrivi in tempo» funzionano; la sezione 5 è un catalogo |
| 6. Originalità e punto di vista | 8/10 | «La mappa non è la lista» regge tutto il capitolo; mostra comportamenti nascosti che nessun'altra fonte mette insieme |
| **Totale** | **47/60** | |

## 3. Detailed Findings by section

### Sezione 1 — «Quale pagina per quale lavoro: il menu Interventi»

- **Bene.** L'attacco con 9.530 / 7.589 / 5.376 / 2.213 risponde alla strategia del § 5 TARGET, e «La mappa non è la lista» è una frase che il lettore si porta via.
- **Date di commit presentate come date di arrivo.** «la prima è arrivata il 19 ottobre 2026 (GOP-459) […] Sul ramo di sviluppo ci sono tutte». Il 19 ottobre è la data del commit su `php8` (dossier: «commit `820e9cd09` del 2026-10-19»), non quella in cui la pagina arriva a chi lavora; e «ramo di sviluppo» non dice niente a chi lavora in ufficio. Al lettore serve sapere che cosa fare se la voce non c'è. → **Riscritto** (Riscrittura 1).
- **Ambiguità.** «si raggiunge solo scrivendo l'indirizzo a mano»: in un capitolo che parla di indirizzi delle utenze, «indirizzo» si legge come indirizzo stradale. → corretto in «l'indirizzo della pagina nel browser».
- **Verbo sbagliato.** «i prenotati senza operatore si chiudono in Da assegnare»: in GOPlanner un intervento «chiuso» è un intervento con esito (tabella del capitolo, sezione 3 e 6). Assegnare un operatore non chiude nulla. → corretto in «ricevono un operatore».
- **Minore, non corretto.** La riga «Mappa» della tabella ha «no» in tutte e tre le colonne, ma «Elimina» cancella: chi guarda solo la tabella può pensare che sia una pagina innocua. Il rimando c'è; una colonna «Cancella» sarebbe più onesta (vedi Optional).

### Sezione 2 — «Assegnare le utenze dalla mappa»

- **Bene.** La procedura in nove passi, «Il passo 3 carica solo le utenze dentro l'area della mappa visibile […] È per questo che il passo 2 viene prima», il riquadro su «Calcola distanza», e «Nessuno ha misurato una soglia […] e questa guida non ne inventa una»: è la voce del persona.
- **Tranello mancante (dal codice).** Il testo dice «Senza data, «Assegna» si ferma» ma non dice che il controllo è solo sul campo vuoto. In `put_incarichi` la data si legge con `DateTime::createFromFormat('d/m/Y', …)` e, se il formato non torna, `$data = new DateTime()`: gli interventi finiscono a oggi. È proprio il modo in cui la cosa si rompe, che il persona deve notare per primo. → **Aggiunto** nel paragrafo del riepilogo e come riga della tabella della sezione 6.
- **Etichetta citata e non spiegata.** «N interventi annullati» compare nel riepilogo senza spiegazione. Un lettore che assegna 40 utenze e legge «3 interventi annullati» pensa di aver rotto qualcosa. Dal codice: sono interventi delle stesse utenze ancora Assegnati su liste precedenti, annullati con la nota «Annullato per pianificazione nuovo carico». → **Aggiunto** (Riscrittura 2).
- **Frase confusa.** «Un cerchio di raggio fisso esiste solo come effetto visivo di N utenze vicine»: il dossier dice «Nessun cerchio disegnato», e il raggio è proprio la cosa che non è fissa. La frase contraddice sé stessa. → **Riscritto** (Riscrittura 3).
- **Frequenze senza fonte.** «Lazo è lo strumento che si fraintende più spesso», «Un dubbio torna spesso»: il persona vieta «in genere» senza fonte, e queste sono la stessa mossa. → corretti.
- **Imprecisione.** «senza un intervento già assegnato o prenotato»: il dossier dice stati 3, 4 o 10, quindi anche eseguito. → corretto.
- **Procedura incompleta.** Il passo 4 elenca «Seleziona», «Area» o «Lazo», ma «Pianifica» è il quarto modo di selezionare (clic sul centro del gruppo). → corretto.

### Sezione 3 — «Interventi con un orario»

- **Bene.** È la sezione più riuscita. «un intervento concordato per le 11:30 e spostato sul pomeriggio di un altro giorno […] va alle 14:00. L'utenza aspetta alle 11:30.» è una dimostrazione in quattro righe. «il silenzio non vuol dire che l'operatore arrivi in tempo» trasforma un dettaglio del codice (`success: false` ignorato dal browser) in una regola utile.
- **Acronimo mai spiegato.** «Se la commessa usa le UT»: il lettore non sa che cosa sia una UT, e il dossier dice solo «colonna `carichi_righe.ut`, presente solo in alcune commesse». → reso esplicito che è una colonna delle liste di alcune commesse e che una tendina vuota non è un guasto; il significato di UT resta un vuoto di ricerca.
- **Conseguenza non tratta.** «Lo stato dell'utenza, però, da qui non cambia»: è un fatto vero (dossier, `saveIntervento` senza `cambiaStato`), ma al lettore non viene detto che cosa vedrà dopo (per esempio un'utenza ancora «importato» in Clienti con un intervento già fissato). Non l'ho aggiunto perché il dossier non lo verifica: resta un vuoto di ricerca.
- **Formula da burocrazia.** «un operatore fuori dalla propria visibilità» → «un operatore che il vostro utente non vede».

### Sezione 4 — «Fasce, slot, squadre e zone»

- **Problema di una commessa scritto come regola generale (Anti-AI n. 8).** L'apertura originale: «Le settimane si prenotano con almeno una settimana di anticipo. L'operatore vero, spesso, una settimana prima non si sa ancora.» Detto così vale per tutte le commesse, mentre è il problema di una sola (ADR 40). La frase finale, «prima delle definizioni va detto per chi valgono», promette di dirlo ma non lo dice: arriva solo tre paragrafi dopo («oggi una sola commessa lo usa»). → **Riscritto** (Riscrittura 4).
- **Termini interni senza contesto.** «non ci sono un costo di ritardo né una priorità da 9 a 1»: il lettore dell'ufficio non ha mai sentito parlare di queste due cose, quindi la frase smentisce qualcosa che lui non sa. Viene dalla specifica interna. Del limite «mail che non parte», poi, non si dice la conseguenza per chi pianifica. → **Riscritto** (Riscrittura 5).
- **Bene.** Il conto «4 + 4 = 8 posti» con i valori dichiarati «da confermare. Non sono regole del prodotto.» è la guardia di proporzione fatta bene. Il riquadro per lo staff è esatto e completo.
- **Lunghezza.** Circa 1.060 parole: sopra il tetto di 1.000 della struttura, dentro i 600-1.200 della Style Bible. Accettato, perché le aggiunte sono guardie che la struttura chiedeva.

### Sezione 5 — «Il giro del giorno»

- **Un trabocchetto nascosto in un'osservazione corretta.** «Il «Tempo sul posto» si imposta solo nei lotti a fasce: nelle commesse a «Mattina e pomeriggio» il carico è sempre a conteggio.» È giusto, ma è scritto come curiosità. Dal dossier (`PianificazioneGiorno`, motivi del conteggio) la scheda può scrivere «il tempo sul posto non è impostato per il lotto (Impostazioni › Calendario)», e il lettore va a cercare un campo che lì non c'è, perché compare solo con «A fasce orarie», che cambia il modo di prenotare del lotto. → **Riscritto** (Riscrittura 6).
- **Conclusione non tratta.** «In pratica l'ordine che si vede è quasi sempre «per ora e indirizzo»» è vero, ma il testo si ferma lì. Nel template la riga di assegnazione non ha un campo ora, e `put_incarichi` salva `data_pianificata` come `Y-m-d`: dopo «Assegna» tutti gli interventi hanno la stessa ora e il giro va in fila per comune, indirizzo e civico, cioè in ordine alfabetico. Per chi ha appena usato «Pianifica» proprio per avere gruppi vicini su strada è la scoperta più importante del capitolo. → **Riscritto** (Riscrittura 7).
- **Catalogo.** I due paragrafi che cominciano con «Giornata ha una barra con…» e «Settimana è la tabella…» sono un inventario di etichette senza domanda. Non li ho riscritti per non perdere le etichette richieste da NUF-R3, ma è il punto più piatto del capitolo (vedi Optional).
- **Lunghezza.** Circa 1.090 parole dopo le correzioni (compensate in parte tagliando due frasi ridondanti): dentro la Style Bible, sopra la struttura.

### Sezione 6 — «Quando la pianificazione non torna»

- **Contraddizione interna (critica).** L'apertura racconta il 28 ottobre: servizio fermo → «la precisione a -1, «non trovata»». Il paragrafo dopo dice: «0 quando la localizzazione è ancora da fare (anche dopo un errore tecnico del servizio)». Il riquadro per lo staff conclude: «molte utenze con precisione -1 dopo un'importazione, segno che il servizio di localizzazione non rispondeva». Con il codice attuale (dossier, `UtenzaBase::geocodifica`: «Un errore tecnico del servizio lascia `precisione = 0` […], non -1») il segnale è sbagliato: -1 in massa vuol dire indirizzi non trovati (per esempio abbreviazioni, GOP-772), non servizio fermo. → **Riscritto** il paragrafo e corretto il riquadro (Riscrittura 8).
- **Un conto senza il posto dove leggerlo.** «Il primo controllo è un conto: utenze libere della lista contro utenze sulla mappa.» NUF-E1 chiede che il lettore *sappia misurare*. Il testo non diceva dove si leggono i due numeri. → aggiunto: Clienti, filtro «Stato» e filtro «Geocodifica».
- **Bene.** La storia della tendina con la correzione GOP-442 raccontata come precedente alla correzione; «Cancellare è definitivo per l'intervento, non per l'utenza»; il riquadro su «Elimina» con rischio e rimedio nello stesso paragrafo, come chiedono le guardie di proporzione. La chiusura è la regola del § 5 TARGET, senza annunci.
- **Minore, non corretto.** Nella riga «Assegna non fa nulla», la causa «operatore non valido per il lotto» non ha riscontro in `put_incarichi` nel dossier: va verificata.

### Formato e sicurezza

- Un solo H1, «In questo capitolo» in corsivo, sezioni `##`, `## Fonti` presente: conforme. Aggiunto in Fonti GOP-685, che ora è citato nel testo.
- Nessun nome di persona, committente, host o valore di `.env`. I nomi di commessa restano «una commessa». Conforme.
- I commenti `<!-- WORD COUNT … -->` ecc. in coda sono HTML grezzo: li chiede `ralph.sh` (riga 925), quindi restano, ma `publish.sh` non li toglie. Vanno tolti prima della pubblicazione HTML dentro GOPlanner (vedi Optional).

## 4. Persona Audit

**Verdetto: il persona tiene, con tre scivolate corrette.**

- *«Spiego come funziona davvero, con il nome esatto di ogni cosa»*: sì. Ogni pulsante tra «…», ogni percorso con ›, ogni messaggio d'errore citato alla lettera.
- *«Ogni regola ha il suo perché e la sua fonte»*: sì per le regole dell'ora e della tendina; prima delle correzioni no per il carico (il perché del «sempre a conteggio» c'era, la conseguenza no).
- *«Se una cosa vale solo per alcune commesse, lo dico»*: violato una volta, nell'apertura della sezione 4; corretto. Altrove è fatto bene («Fascia 1…4 esistono in una sola commessa»).
- *«Se non lo so, non lo scrivo»*: rispettato in modo esemplare (soglia del browser, ordine `[UNVERIFIED]` non spacciato per certo). Le scivolate sono tre frasi sulla frequenza («si fraintende più spesso», «torna spesso», «arriva puntuale»), cioè l'«in genere» senza fonte che il persona vieta. Corrette.
- *«I do not intensify — I specify»*: quasi sempre. «a una velocità prudente di 20 km/h» resta come unico aggettivo di giudizio; tollerabile, perché GOP-684 ha davvero abbassato la velocità per prudenza.
- *«My ending cannot echo any previous chapter»*: la chiusura è una regola con tre conteggi, non un'eco. Conforme.
- Voce: seconda plurale nelle procedure, impersonale nella prosa, nessun «noi»/«io». Conforme.

**Prova del lettore: «l'ho vissuto» o «me l'hanno detto»?** Nelle sezioni 2, 3 e 6 il lettore ha vissuto la situazione: vede l'11:30 diventare 14:00, vede il conteggio di Lazo gonfiarsi, vede la lista sparire e tornare. Nella sezione 5 gli è stato detto, prima delle correzioni: tre pagine descritte etichetta per etichetta. Dopo le correzioni la sezione 5 ha due momenti vissuti («ma lì il campo non c'è»; «È un ordine alfabetico, non un ordine di strada»), mentre i due paragrafi-catalogo restano detti.

## 5. Counter-Objection Check

Richieste: ≥ 2. Presenti: **4**, tutte nella forma del dubbio reale e con risposta dalle fonti.

| # | Sezione | Obiezione | Forma più forte? | Risposta da fonte? |
|---|---|---|---|---|
| 1 | 2 | «Ma Lazo non dovrebbe prendere le utenze dentro un cerchio?» | Sì, e ora il testo dà ragione al dubbio («Il dubbio è legittimo») prima di smontarlo | Sì: `nearest`, wiki `selezione-mappa-pianificazione.md`. La risposta originale conteneva una frase contraddittoria, corretta |
| 2 | 3 | «Ho spostato l'intervento in Pianificazione operatori: perché l'ora è cambiata?» | Sì, con il caso 11:30 → 14:00 | Sì: `pianificaRisorsa`, `orarioInFascia` |
| 3 | 4 | «Perché non mi dite l'ora esatta?» (l'utenza al telefono) | Quasi: la forma più forte sarebbe quella dell'ufficio, «Lo slot è già un orario: perché non prometterlo?». Il testo risponde anche a questa («promettere lo slot sarebbe promettere qualcosa che la prenotazione successiva sposta») | Sì: ADR 40, alternative scartate |
| 4 | 5 | «La Settimana dice 100% ma l'operatore finisce a metà pomeriggio.» | Sì | Sì: `VELOCITA_KMH`, carico a conteggio |

**Obiezione forte ancora mancante (Optional):** «Pianifica ha calcolato i gruppi su strada: perché il giro in Mappa del giorno non segue quella sequenza?» Ora il testo risponde nella sezione 5 (Riscrittura 7), ma non lo formula come dubbio del lettore.

## 6. Priority Improvements

### Critical (tutte applicate)
1. ✅ Contraddizione -1/0 sulla precisione e segnale diagnostico sbagliato nel riquadro per lo staff (sezione 6).
2. ✅ Problema di una sola commessa scritto come regola generale in apertura della sezione 4.
3. ✅ Data in formato non valido → interventi assegnati a oggi: aggiunta nel paragrafo del riepilogo e come riga della tabella dei sintomi.

### Important (applicate salvo dove indicato)
4. ✅ Riga «interventi annullati» del riepilogo spiegata.
5. ✅ Trabocchetto del «Tempo sul posto» suggerito dalla scheda ma assente nei lotti «Mattina e pomeriggio».
6. ✅ Ordine di visita dopo «Assegna» = ordine alfabetico per comune, indirizzo e civico (verificato su `put_incarichi` e sul template).
7. ✅ Dove si leggono i due numeri del «primo controllo» (Clienti, filtri «Stato» e «Geocodifica»).
8. ✅ Frase contraddittoria sul cerchio di Lazo; frequenze senza fonte; «si chiudono»; «indirizzo a mano»; «fuori dalla propria visibilità».
9. ✅ Date di commit di GOP-459/778-780 trasformate in un'indicazione utile al lettore.
10. ⏳ **Vuoti di ricerca per il prossimo giro** (non applicabili senza nuove fonti):
    - che cosa vuol dire «UT» (`carichi_righe.ut`) e in quali commesse c'è;
    - conseguenza visibile del fatto che «Pianifica» nel Calendario non aggiorna lo stato dell'utenza (che cosa mostra Clienti, se l'utenza riappare altrove);
    - in quale pagina sta «Riprova le non trovate» (il testo nomina il pulsante, ma non dice dove trovarlo);
    - se «operatore non valido per il lotto» è davvero una causa di «Assegna» senza effetto;
    - etichetta della tendina «Lista»: il dossier dà due versioni («cliente + data importazione» alla riga 27, «nome file, tipo, (numero di utenze)» alla riga 133); il testo usa la prima;
    - se la tabella «Carico della settimana» mostra sabato e domenica come «Libero» quando il calendario li spegne (rischio di un falso «giorno libero»).

### Optional
11. Sezione 5: riscrivere i due paragrafi-catalogo intorno alle domande a cui ogni pagina risponde («che cosa fa ciascuno oggi?» → Giornata; «chi ha troppo, chi è libero?» → Settimana; «dove e in che ordine?» → Mappa del giorno), mantenendo le etichette.
12. Tabella della sezione 1: una colonna «Cancella interventi» (sì per «Mappa», con il rimando a «Elimina»).
13. Riquadro «Elimina»: far notare che il messaggio «Tutti gli interventi pianificati sono stati cancellati!» dice «pianificati» ma la cancellazione vale per tutti gli stati senza esito.
14. Togliere in `publish.sh` i commenti HTML di servizio (`<!-- … -->`) prima della pubblicazione: la Style Bible vieta l'HTML grezzo.
15. Chiusura: «gli operatori del lotto» compare come terzo numero senza essere mai stato motivato nel capitolo; basterebbe «gli operatori che la tendina «Operatore» vi mostra».

## 7. Rewritten Paragraphs

### Riscrittura 1 — Sezione 1, pagine recenti

**Original:**
> Le pagine Pianificazione operatori, Giornata, Settimana e Mappa del giorno sono recenti: la prima è arrivata il 19 ottobre 2026 (GOP-459), le altre tre il 12 novembre 2026 (GOP-778, GOP-779, GOP-780). Sul ramo di sviluppo ci sono tutte; i ticket di Pianificazione operatori, Settimana e Mappa del giorno risultano ancora aperti.

**Rewritten:**
> Quattro di queste pagine sono recenti. Pianificazione operatori è entrata nel codice il 19 ottobre 2026 (GOP-459); Giornata, Settimana e Mappa del giorno il 12 novembre 2026 (GOP-778, GOP-779, GOP-780), e i ticket di tre di loro risultano ancora aperti. Nessuna delle quattro dipende da un permesso: se una manca dal vostro menu, la vostra installazione non l'ha ancora ricevuta.

**Why:** «arrivata» presentava una data di commit come data di rilascio, e il dossier segna la messa in produzione come `[UNVERIFIED]`. «Ramo di sviluppo» è gergo da sviluppatori in una sezione [UFFICIO]. Il lettore ha bisogno di una cosa sola: sapere che se la voce manca non è un problema di permessi. `MenuInterventi::voci` mette condizioni di permesso solo su «Carichi» e «Lotti», quindi la conclusione viene dal codice.

### Riscrittura 2 — Sezione 2, riepilogo dopo «Assegna»

**Original:**
> Senza data, «Assegna» si ferma con «Attenzione! Devi inserire la data!» e non invia nulla. Con la data, il riepilogo arriva una riga per voce: «N interventi pianificati», «N interventi annullati», «N interventi già pianificati» e, solo quando sono più di zero, «N utenze saltate perché già con un incarico assegnato» e le righe sui misuratori sostituiti o illeggibili. Le utenze assegnate spariscono dalla mappa. […]

**Rewritten:**
> Senza data, «Assegna» si ferma con «Attenzione! Devi inserire la data!» e non invia nulla. Il controllo guarda solo che il campo non sia vuoto: una data scritta in un altro formato, per esempio 25-11-2026, passa, il server non la riconosce e assegna gli interventi alla data di oggi. Con la data, il riepilogo arriva una riga per voce: […]. La riga degli annullati non riguarda gli interventi appena creati: conta gli interventi delle stesse utenze ancora assegnati su liste precedenti, che «Assegna» annulla con la nota «Annullato per pianificazione nuovo carico», perché vale la lista nuova. Le utenze assegnate spariscono dalla mappa. […]

**Why:** Il persona nota per primo «il modo in cui la cosa si rompe». Qui si rompe in silenzio: il riepilogo dice «pianificati» e la data è sbagliata. Fonte: `put_incarichi`, `DateTime::createFromFormat('d/m/Y', …)` con ripiego `new DateTime()` (dossier riga 42, verificato sul codice). La riga «annullati» era un'etichetta citata e non spiegata, cioè detta e non mostrata. Fonte: `put_incarichi`, `$annullati++` dopo la nota «Annullato per pianificazione nuovo carico».

### Riscrittura 3 — Sezione 2, contro-obiezione su Lazo

**Original:**
> Un dubbio torna spesso: «Ma Lazo non dovrebbe prendere le utenze dentro un cerchio?». Il suggerimento del pulsante dice «Selezione circolare», e il nome fa pensare a un tratto a mano libera. La risposta, scritta anche nella wiki dell'assistenza, è che Lazo non disegna un cerchio e non è un lazo a mano libera. Seleziona per numero, non per area. Un cerchio di raggio fisso esiste solo come effetto visivo di N utenze vicine: in una zona densa resta piccolo, in campagna si allarga di chilometri. Chi vuole un'area precisa usa «Area».

**Rewritten:**
> «Ma Lazo non dovrebbe prendere le utenze dentro un cerchio?» Il dubbio è legittimo: il suggerimento del pulsante dice «Selezione circolare», e il nome fa pensare a un tratto a mano libera. Lazo non fa né l'una né l'altra cosa, e la wiki dell'assistenza lo scrive negli stessi termini. Seleziona per numero, non per area: nessun cerchio viene disegnato, e le N utenze prese formano sulla mappa una macchia più o meno tonda il cui raggio dipende da quante utenze ci sono intorno. In un quartiere denso dieci utenze stanno in pochi isolati; in campagna le stesse dieci possono essere a chilometri l'una dall'altra. Chi vuole un'area precisa usa «Area».

**Why:** «Un cerchio di raggio fisso esiste solo come effetto visivo» contraddiceva il dossier («Nessun cerchio disegnato») e anche sé stessa: il raggio è proprio quello che cambia. «Torna spesso» era una frequenza senza fonte. La versione nuova presenta l'obiezione nella forma più forte, cioè dà ragione al lettore prima di rispondere, e sostituisce l'immagine sbagliata con un esempio concreto di N = 10, il valore di partenza.

### Riscrittura 4 — Sezione 4, apertura

**Original:**
> Le settimane si prenotano con almeno una settimana di anticipo. L'operatore vero, spesso, una settimana prima non si sa ancora. Promettere all'utenza un'ora precisa con un operatore preciso vorrebbe dire rifare le promesse a ogni cambio di turno. Fasce, slot e squadre nascono da questo problema, e prima delle definizioni va detto per chi valgono.

**Rewritten:**
> Questa sezione nasce dal problema di una commessa precisa. Lì le settimane si prenotano con almeno una settimana di anticipo, ma l'operatore vero, spesso, una settimana prima non si sa ancora: promettere all'utenza un'ora precisa con un operatore preciso vorrebbe dire rifare le promesse a ogni cambio di turno. Fasce, slot e squadre sono la risposta, e oggi sono attive solo in quella commessa. La configurazione del calendario che viene subito dopo, invece, vale per tutte.

**Why:** Anti-AI checklist n. 8 e persona («Se una cosa vale solo per alcune commesse, lo dico»). L'originale presentava come regola di GOPlanner il problema di una commessa (ADR 40, `custom/sg_smat/README.md`) e annunciava «va detto per chi valgono» senza dirlo. La versione nuova lo dice nella prima frase e avverte che il paragrafo successivo (Impostazioni › Calendario) torna generale, così il lettore sa quando può smettere di pensare «non è la mia commessa».

### Riscrittura 5 — Sezione 4, limite

**Original:**
> Il limite di questa sezione riguarda che cosa del modello esiste davvero. Nel codice c'è il confronto tra costo del giro e penali; non ci sono un costo di ritardo né una priorità da 9 a 1. La mail del giorno prima per le fasce con interventi senza operatore esiste nel codice ma non parte: la commessa non ha destinatari configurati e il processo che dovrebbe chiamarla è fermo. […]

**Rewritten:**
> Il limite di questa sezione riguarda che cosa del modello esiste davvero. Dei costi, il codice fa solo il confronto tra il costo di un giro e la penale per una pratica non gestita (GOP-685), e lo segnala senza escludere nulla da solo. La mail del giorno prima per le fasce con interventi senza operatore esiste nel codice ma non parte: la commessa non ha destinatari configurati e il processo che dovrebbe chiamarla è fermo. Finché non parte nessuno riceve un avviso, e il controllo delle fasce senza operatore resta a chi pianifica. […]

**Why:** «costo di ritardo» e «priorità da 9 a 1» smentivano due idee della specifica interna che il lettore dell'ufficio non ha mai incontrato. Al loro posto ci sono la cosa che esiste (GOP-685) e la sua regola («il sistema segnala, il PMO decide», dossier riga 104). Il limite sulla mail ora ha la sua conseguenza operativa, quindi serve NUF-E2 (che cosa resta a chi pianifica) invece di essere un'informazione da archivio.

### Riscrittura 6 — Sezione 5, le due conseguenze del carico

**Original:**
> Due conseguenze non si vedono a prima vista. Il «Tempo sul posto» si imposta solo nei lotti a fasce: nelle commesse a «Mattina e pomeriggio» il carico è sempre a conteggio. E l'orario di lavoro è quello dell'utente connesso, perché sta tra le sue impostazioni personali: due colleghi con orari diversi vedono percentuali diverse sulla stessa giornata.

**Rewritten:**
> Due conseguenze non si vedono a prima vista. La prima: il «Tempo sul posto» si imposta solo nei lotti a fasce, quindi nelle commesse a «Mattina e pomeriggio», cioè tutte tranne una, il carico è sempre a conteggio. La scheda può allora indicare «il tempo sul posto non è impostato per il lotto (Impostazioni › Calendario)», ma lì il campo non c'è: compare solo scegliendo «A fasce orarie» in «Come si prenota», che cambia il modo in cui il lotto si prenota. Non è una scorciatoia per avere il carico in tempo. La seconda: l'orario di lavoro è quello dell'utente connesso, perché sta tra le sue impostazioni personali, e due colleghi con orari diversi vedono percentuali diverse sulla stessa giornata.

**Why:** L'originale conteneva il fatto ma non il tranello. Sulla stessa schermata la scheda manda il lettore in Impostazioni › Calendario (dossier riga 113, motivi del conteggio) e la pagina nasconde il campo (`impostazioni_calendario.js:297`, `mode: 'fasce'`). Un amministratore con buone intenzioni potrebbe cambiare «Come si prenota» per farlo comparire, e cambiare così il modo di prenotare di un lotto. «Tutte tranne una» rende la portata misurabile ed è coerente con la sezione 4.

### Riscrittura 7 — Sezione 5, ordine di visita

**Original:**
> […] Nel codice attuale, però, né «Assegna» né il calcolo delle zone scrivono quell'ordine; lo scrivono solo funzioni vecchie, legate al calcolo del percorso più breve. In pratica l'ordine che si vede è quasi sempre «per ora e indirizzo», salvo dati rimasti da quelle funzioni. Chi raggruppa con «Pianifica» e poi assegna controlla il giro in Mappa del giorno.

**Rewritten:**
> […] Nel codice attuale, però, quell'ordine lo scrivono solo funzioni vecchie, legate al calcolo del percorso più breve; né «Assegna» né il calcolo delle zone lo fanno, e l'ordine che si vede è quasi sempre «per ora e indirizzo». La riga di assegnazione della Pianificazione, poi, non ha un campo per l'ora: gli interventi creati con «Assegna» hanno la data e nessun orario, quindi si mettono in fila per comune, indirizzo e civico. È un ordine alfabetico, non un ordine di strada. In Mappa del giorno i numeri sulle tappe di un gruppo nato da «Pianifica» seguono l'elenco delle vie, non la sequenza usata per formarlo.

**Why:** «Controlla il giro in Mappa del giorno» chiedeva al lettore di controllare senza dirgli che cosa avrebbe visto. Il codice permette di dirlo: il template non ha un campo ora (`interventi.html`, riga di assegnazione: «Data», «N. int.», «Durata») e `put_incarichi` salva `data_pianificata` come `Y-m-d`. A parità di ora, `ordinaVisite` usa comune, indirizzo e civico. È la frase del capitolo che più fa dire «l'ho vissuto»: chiunque abbia aperto Mappa del giorno dopo «Pianifica» ha visto le tappe numerate a zig-zag, e ora sa perché.

### Riscrittura 8 — Sezione 6, il primo controllo e la precisione

**Original:**
> Il primo controllo è un conto: utenze libere della lista contro utenze sulla mappa. Se i due numeri differiscono, la differenza ha un nome. La precisione delle coordinate vale -1 quando l'indirizzo non è stato trovato, 0 quando la localizzazione è ancora da fare (anche dopo un errore tecnico del servizio), e un valore positivo quando l'utenza ha le coordinate; i valori 3 e 4, approssimata e fuori comune, sono anomalie da guardare e sulla mappa hanno un anello colorato. Nel menu Clienti, dove stanno le utenze, la colonna e il filtro «Geocodifica» le mostrano.

**Rewritten:**
> Il primo controllo è un conto: utenze libere della lista contro utenze sulla mappa. Le une e le altre si trovano nel menu Clienti, dove stanno le utenze: il filtro «Stato» dà le libere, la colonna e il filtro «Geocodifica» quelle senza coordinate. Se i due numeri differiscono, la differenza ha un nome: la precisione delle coordinate. Vale -1 quando l'indirizzo non è stato trovato, 0 quando la localizzazione è ancora da fare, e un valore positivo quando l'utenza ha le coordinate; i valori 3 e 4, approssimata e fuori comune, sono anomalie da guardare e sulla mappa hanno un anello colorato. Con il codice attuale un errore tecnico del servizio lascia la precisione a 0, non a -1 come nel caso del 28 ottobre. Per chi pianifica l'effetto è lo stesso: senza coordinate, nessuna delle due compare sulla mappa.

**E nel riquadro per lo staff, original:** «molte utenze con precisione -1 dopo un'importazione, segno che il servizio di localizzazione non rispondeva» → **rewritten:** «molte utenze senza coordinate (precisione 0 o -1) subito dopo un'importazione, che può voler dire che il servizio di localizzazione non rispondeva».

**Why:** Nel giro di tre paragrafi il capitolo diceva «servizio fermo → -1» (la storia), «errore tecnico → 0» (la spiegazione) e di nuovo «-1 = servizio fermo» (il riquadro). Il lettore attento se ne accorge e smette di fidarsi della tabella dei sintomi. Il dossier dà ragione al codice (riga 139) e la storia resta vera come fatto del 28 ottobre (riga 144): la versione nuova tiene tutte e due le cose e dice che per chi pianifica non cambia nulla. Il segnale nel riquadro per lo staff era sbagliato, ora è giusto. In più il «conto» ha finalmente un posto dove si legge (NUF-E1: il lettore «sa misurare la differenza»).

### Riscrittura 9 — Sezione 6, nuova riga della tabella dei sintomi

**Original:** (riga assente)

**Rewritten:**
> | Interventi assegnati a oggi invece che alla data scritta | data scritta in un formato diverso da gg/mm/aaaa | la data degli interventi in Interventi › Lista | cancellare e riassegnare con la data nel formato giusto |

**Why:** È il caso «non torna» che si scopre più tardi: l'operatore si trova il lavoro di oggi già pieno. La causa viene dal codice (Riscrittura 2) e il rimedio coincide con la procedura «Rifare una pianificazione» già presente, quindi la riga non aggiunge regole nuove: mette in tabella un sintomo che mancava.

## 8. Verdict

**REVIEWER_CORRECTIONS (47/60)**: un capitolo concreto e con la voce giusta, che aveva una contraddizione diagnostica, una generalizzazione da una sola commessa e tre tranelli documentati ma non scritti. Ho corretto tutto nel testo con fatti verificati sul codice; restano sei vuoti di ricerca per il prossimo giro.
