# Capitolo 3 — Struttura (ARCHITECT)

**Titolo finale (H1 del capitolo):** `# 3. Utenze, liste, pratiche, lotti e carichi`
**Parte:** I — Il dominio · **Tag del capitolo:** ALL (PRD § 4)
**Domanda centrale (PRD § 4):** come è fatto il lavoro in GOPlanner: la differenza tra utenza, lista, pratica, lotto, distretto e carico; lo stato di un'utenza derivato dall'ultimo intervento; i campi personalizzati.
**Nemico specifico del capitolo:** la confusione di nomi. Lo stesso oggetto si chiama «lista» in una pagina e «carico» in un'altra; la voce di menu «Lista» non è una lista; la colonna «Cliente» di una lista non è il committente; lo stato di un'utenza sembra un riassunto e invece è una copia. Chi impara GOPlanner a voce eredita queste confusioni. Il capitolo le scioglie una per una, con il nome del glossario, l'etichetta esatta dell'interfaccia e la regola che spiega il comportamento.

**Continuity check:** `chapter_index.md` e `NARRATIVE_GLOSSARY.md` non esistono al momento della stesura (25 novembre 2026): nessuna affermazione da confrontare. I capitoli 1 e 2 sono in lavorazione in parallelo: il capitolo 1 dà il glossario di base (utenza, lista, pratica, stato), quindi qui le definizioni devono coincidere parola per parola con `CONTEXT.md` e non ridefinirle in modo diverso. Il capitolo 2 spiega commessa e personalizzazioni per commessa: qui basta il rimando.

**Glossary check (`/home/alan/firstmate/projects/GOPlanner/CONTEXT.md`) — regole vincolanti per Writer ed Editor:**
- «carico» è una parola **da evitare** per la lista. Nel testo compare solo (a) dentro un'etichetta esatta dell'interfaccia tra «…» («Carichi», «Chiudi carico», «Modifica carico», «Tipo carico», «Valore nel carico»), (b) in `codice` (`carichi`, `carichi_righe`), (c) nella frase che spiega la corrispondenza. Il narratore dice sempre «lista».
- «Clienti» solo come etichetta del menu; il narratore dice «utenza» (mai «cliente», «anagrafica», «record»). La colonna «Cliente» di una lista si nomina solo come etichetta.
- «riga» solo per la riga del file del committente; la pratica non è una riga.
- «stato» ≠ «esito»: lo stato è il punto del lavoro, l'esito è ciò che l'operatore registra (dettaglio nel capitolo 6).
- «campo personalizzato» nel testo; «campo custom», «flexifield», «colonna» solo dentro i riquadri per sviluppatori e in `codice`.
- «commessa», mai «tenant», nel testo per l'ufficio; nei riquadri DEV: «la commessa, che nel codice si chiama tenant».
- «operatore» per chi lavora sul campo, «utente» per chi entra nel gestionale.

**Confini (INSTRUCTION § 2, PRD «Confini tra capitoli») — una riga e il rimando, niente di più:**
- Come si importa un file, mappature, scarti, «+ Nuovo campo» come passo dell'importazione → capitolo 4.
- Pagina Interventi › Pianificazione, zone, giri → capitolo 5 (qui solo le condizioni che dipendono dalla lista).
- Ciclo di vita dell'intervento, esecuzioni, verifica, ripianificazione → capitolo 6 (qui solo i codici di stato come chiave di lettura dello stato dell'utenza).
- Esportazione e stato «inviato» come conseguenza dell'esportazione → capitolo 7.
- «Carica in centrale» e il carico del magazzino (altro significato della parola) → capitolo 9.
- Utenti di competenza e lotti come regola di permesso → capitolo 11; diagnostica della visibilità → capitolo 12.
- Tabelle, relazioni, schema canonico, flexigrid → capitolo 14 (qui solo riquadri brevi «Per gli sviluppatori»).

---

## NUFs (Goal Scoring)

Undici funzioni di utilità. L'Editor assegna 1 punto a ciascuna soddisfatta e riporta il punteggio su 10 (soglia 8,5 = almeno 10 su 11). Ogni NUF indica dove deve essere soddisfatta e che cosa l'Editor controlla.

### Reader (che cosa il lettore sa fare)

1. **utility(reader):** Reader can say, davanti a un'etichetta dell'interfaccia, a quale oggetto si riferisce: «Carichi», «Chiudi carico», il filtro «Lista» di «Clienti», la voce «Lista» del menu Interventi, «lista nuova / lista esistente» di File › Importazione, la colonna «Cliente» di una lista → score += 1
   *Verifica:* nella sezione 3 c'è una tabella «etichetta → oggetto del glossario» con almeno 6 righe, tutte presenti nel dossier.
2. **utility(reader):** Reader can aprire Interventi › Carichi, leggere l'avanzamento di una lista (Assegnati a operatore, Eseguiti, Completati, Completamento) e dire che l'unità di conto è la pratica, non la riga del file → score += 1
   *Verifica:* procedura numerata con le etichette esatte; una frase sul fatto che «Completati» dipende da un'impostazione della commessa (Impostazioni › Generale, sezione «Carichi»).
3. **utility(reader):** Reader can trovare perché una lista non compare nella tendina di Interventi › Pianificazione controllando, nell'ordine, le condizioni che dipendono dalla lista (non chiusa, campo «Cliente» valorizzato, lotto dell'utente, almeno una pratica senza intervento) e la copia salvata che dura un'ora → score += 1
   *Verifica:* elenco ordinato dei controlli nella sezione 4, con il rimedio di ciascuno.
4. **utility(reader):** Reader can spiegare perché un'utenza mostra «assegnato» dopo che l'operatore ha chiuso un intervento, e controllare dalla scheda dell'utenza (scheda «Interventi») se esiste già un intervento eseguito → score += 1
   *Verifica:* sezione 5 con il caso (problema → causa → controllo → rimedio) e la regola «per far leggere eseguito bisogna chiudere o annullare tutti gli interventi aperti dell'utenza».
5. **utility(reader):** Reader can dire a quale famiglia appartiene un dato in più (campo dell'intervento compilato dall'operatore, campo in sola lettura, campo nuovo creato con l'importazione) e dove lo ritrova (app, griglia «Clienti», Ricerca Avanzata, file Excel) → score += 1
   *Verifica:* tabella delle tre famiglie nella sezione 6, con colonne «chi lo scrive», «dove si vede», «che cosa non si può fare».
6. **utility(reader):** Reader can scegliere tra disattivare ed eliminare un lotto e prevedere che cosa succede alle liste già importate se cambia il «Valore nel carico» → score += 1
   *Verifica:* sezione 4, riquadro `> **Attenzione:**` su «Elimina» (nessuna conferma, non si annulla) e frase sulle liste importate che conservano il vecchio numero.

### Emotional (che cosa il lettore sente)

7. **utility(emotional):** Reader feels sicuro che «assegnato» su un'utenza non significa lavoro perso, e sa quando fermarsi e chiedere allo staff tecnico (nessun intervento eseguito trovato, oppure la lista ancora assente dopo un'ora) → score += 1
   *Verifica:* frase esplicita «il lavoro non è andato perso» con la sua condizione, e almeno due riquadri `> **Quando chiedere allo staff tecnico:**` nel capitolo.
8. **utility(emotional):** Reader feels padrone dei pulsanti che non si annullano: prima di «Chiudi carico», «Elimina» (lotto), «Elimina» (utenza) e «+ Nuovo campo» sa che cosa si perde, che cosa resta e quale alternativa esiste → score += 1
   *Verifica:* per ognuno dei quattro pulsanti c'è conseguenza + ciò che resta + alternativa (vedi «Risk proportionality guards»).

### Factual (affermazioni con fonte)

9. **utility(factual):** I codici di stato da 1 a 10 con il loro nome (1 importato, 2 validato, 3 assegnato, 4 eseguito, 5 non fattibile, 6 controllato, 7 inviato, 8 ripianificabile, 9 annullato, 10 prenotato), con la fonte (`lib/db/db.sql`, tabella `stati`; costanti di `lib/InterventoBase.php`) → score += 1
10. **utility(factual):** La corrispondenza tra parole e dati: lista = una riga di `carichi`; pratica = una riga di `carichi_righe` (`id_carico`, `id_utenza`); utenza = una riga di `utenti` (non `utenze`); lotto = il numero `carichi.lotto` (da −128 a 127, unico nella commessa) con il nome nell'anagrafica `lotti` del DB master; distretto = `carichi.distretto` (al massimo 30 caratteri), citata con fonte di codice → score += 1
11. **utility(factual):** I limiti dei campi nuovi dell'importazione: al massimo 30 per commessa, tipo testo, numero o data, visibili in coda alla griglia «Clienti», non rinominabili né eliminabili dall'utente; citati con fonte (`docs/02-patterns/51-campo-nuovo-colonna-di-carichi-righe.md`, `lib/ImportazioneCampoNuovo.php`, GOP-770) → score += 1

---

## BEAT LIST

Sei sezioni (INSTRUCTION § 2: 5–6; PRD § 4). Ogni sezione è un `##` del capitolo finale, apre con il rigo in corsivo del pubblico quando non è per tutti (STYLE_BIBLE Voice rule 6), contiene almeno un dettaglio esatto (Concreteness mandate), almeno un paragrafo **Limite** e non più di 5 paragrafi di prosa consecutivi senza un elemento di orientamento.

Apertura obbligatoria prima della sezione 1: paragrafo in corsivo «*In questo capitolo* …» (2–3 frasi): che cosa diventa un file del committente dentro GOPlanner, perché lo stesso oggetto ha due nomi, da dove viene lo stato di un'utenza, quali dati in più può avere una commessa. Per chi: tutti; i riquadri «Per gli sviluppatori» si possono saltare.

---

### Beat 1 — `## Dal file del committente all'intervento: sei oggetti, uno dentro l'altro`

- **Core question:** quando arriva un file del committente, quali oggetti nascono in GOPlanner e come stanno l'uno dentro l'altro?
- **Audience tag:** [TUTTI]
- **Word count target:** 800 parole
- **Funzioni dei paragrafi:** Aggancio (il file inventato e che cosa diventa) → Spiegazione (la catena committente → lista → pratica → utenza → intervento, con lotto e distretto come etichette della lista) → Dimostrazione (tabella) → riquadro DEV → Limite → Sintesi.
- **Contenuto richiesto:**
  - Esempio con dati inventati e dichiarati: un file di letture di 1.200 righe (dato inventato) importato in una lista chiamata *Letture marzo* (nome inventato). Che cosa diventa: una lista, una pratica per ogni riga accettata, le utenze corrispondenti, nessun intervento finché non si pianifica. La frase su «quante utenze» va scritta secondo ciò che il Researcher accerta sul riuso delle utenze (vedi Researcher brief, punto A3): non affermare «1.200 utenze nuove» se l'importazione riusa le utenze già presenti.
  - Tabella orientativa per l'ufficio (senza nomi di tabelle): Oggetto | Che cos'è (parole di `CONTEXT.md`) | Dove si vede nell'interfaccia. Righe: utenza («Clienti»), lista («Carichi» nel menu Interventi; filtro «Lista» in «Clienti»; «Lista» in File › Importazione), pratica (dentro la lista: è l'unità di conto di «Carichi»), lotto (Interventi › Lotti), distretto (campo della lista), intervento (menu Interventi; capitolo 6).
  - Regola che regge tutto il capitolo: un intervento appartiene a una pratica, cioè a un'utenza **dentro una lista** (`interventi.id_carico` + `interventi.id_utenza`). Per questo la stessa utenza in due liste può avere due interventi.
  - Riquadro `> **Per gli sviluppatori:**` con la corrispondenza parola → tabella (NUF 10) e l'avviso che alcuni documenti in `docs/` chiamano `utenze` la tabella delle utenze, mentre il codice su `php8` usa `utenti` (vedi [CONFLICT] nel brief). Rimando al capitolo 14.
  - **Limite:** la catena è codice comune; le pagine e le voci di menu che la mostrano cambiano per commessa (voci in più o in meno). Rimando al capitolo 2.
- **Key facts for the Researcher:** composizione della catena e chiavi (`carichi_righe.id_carico`, `carichi_righe.id_utenza`, `interventi.id_carico`, `interventi.id_utenza`); `UtenzaBase::$table = 'utenti'`; `CaricoBase::$table = 'carichi'`; glossario di `docs/01-foundations/03-database-facts.md` § «Glossario: lista, lotto, pratica, distretto»; se l'importazione crea una nuova utenza per ogni pratica o ritrova quella esistente (`Utenza::getId` per codice, `lib/ImportazioneEsecuzione.php`).

---

### Beat 2 — `## L'utenza: il punto in cui si lavora`

- **Core question:** che cos'è un'utenza, dove si trova nel gestionale e che cosa la identifica?
- **Audience tag:** [UFFICIO] (con un riquadro [STAFF])
- **Word count target:** 850 parole
- **Funzioni dei paragrafi:** Aggancio (il menu si chiama «Clienti» ma contiene utenze) → Spiegazione (indirizzo, contatore/matricola, codice, coordinate, stato) → Procedura (aprire la scheda di un'utenza) → Dimostrazione (i dati chiave della scheda) → Limite → Sintesi.
- **Contenuto richiesto:**
  - L'utenza secondo `CONTEXT.md`: il punto in cui si va a lavorare, un indirizzo con il contatore e il nominativo dell'intestatario. Nel menu è «Clienti». Mai usare un nominativo reale negli esempi.
  - Procedura numerata «Aprire la scheda di un'utenza»: «Clienti» › «Lista», casella «Cerca» con la tendina del campo, doppio clic sulla riga; la finestra «Riepilogo dati utenza». Una azione per passo.
  - Dati chiave nel riquadro a sinistra della scheda (etichette esatte dal dossier: «PDR», «Matricola», «Lotto», «Carico», «Prossimo intervento») e le schede a destra («Mappa», «Interventi», «Photo», «Reports», «Storico»). Far notare che la scheda dell'utenza mostra «Lotto» e «Carico»: sono la lista della pratica (collegamento alla sezione 3).
  - Il **codice** dell'utenza come chiave che riconosce una pratica già presente quando si reimporta (una frase; il resto nel capitolo 4).
  - La colonna «Geocodifica» con i suoi stati (elenco puntato breve) solo come dato dell'utenza; il lavoro di geocodifica è nei capitoli 4–5.
  - Contro-obiezione possibile: «Lo stesso contatore compare due volte in Clienti: è un errore?» → risposta dal dossier (codici utenza ripetuti; strumento Admin «Consolida utenze», massimo 500 codici per lancio, non si annulla, è uno strumento dello staff tecnico).
  - **Limite:** colonne, campi di ricerca, filtri e pulsanti cambiano per commessa; «Elimina» cancella davvero l'utenza e non si annulla; alcune scritte possono comparire in inglese.
  - Riquadro `> **Quando chiedere allo staff tecnico:**` per utenze doppie (consolidamento).
- **Key facts for the Researcher:** voce di menu e permesso («Vedere le utenze»); etichette della scheda (`js/code/scheda_utenza.js`, `Smarty_templates/it/utenze.html`); testo della conferma di «Elimina»; che cosa fa e che cosa scrive «Consolida utenze» (`lib/jobs/ConsolidaUtenzaJob.php`, colonna `utenti.consolidato`), chi la vede (Admin › Strumenti), tetto 500; stato «Non chiamare» solo dove la commessa ha quel dato.

---

### Beat 3 — `## Lista e pratica: il lavoro che arriva con un file`

- **Core question:** che cos'è una lista, perché in alcune pagine si chiama «carico», e che cosa aggiunge la pratica rispetto all'utenza?
- **Audience tag:** [TUTTI]
- **Word count target:** 1.050 parole
- **Funzioni dei paragrafi:** Aggancio (lo stesso oggetto con due nomi) → Spiegazione (dati della lista; la pratica) → Dimostrazione (tabella etichetta → oggetto) → Procedura (vedere l'avanzamento di una lista) → Limite (Chiudi carico) → Sintesi.
- **Contenuto richiesto:**
  - Definizioni di `CONTEXT.md`: lista = gruppo di utenze arrivato con un'importazione o creato a mano, con nome, lotto e scadenza; pratica = un'utenza dentro una lista; la stessa utenza può stare in più liste.
  - I dati di una lista come appaiono in «Modifica carico» (etichette esatte): «Nome file», «Cliente», «Nome cliente», «Distretto», «Scadenza», «Lotto», «Tipo carico», «Stato» (aperto/chiuso, solo da leggere). Spiegare che cosa contiene davvero il campo «Cliente» di una lista secondo il dossier (vedi [CONFLICT] C2): è la trappola che fa sparire una lista dal Piano nella sezione 4.
  - **Tabella «etichetta → oggetto»** (NUF 1), almeno sei righe: «Carichi» (menu Interventi) → elenco delle liste; «Chiudi carico» → chiude una lista; «Valore nel carico» → il numero del lotto scritto sulla lista; filtro «Lista» di «Clienti» → una lista; voce «Lista» del menu Interventi → elenco degli **interventi**, non una lista; voce «Lista» del menu «Clienti» → elenco delle **utenze**; «lista nuova / lista esistente» di File › Importazione → una lista; «Carica in centrale» del magazzino → altro significato, capitolo 9.
  - La pratica come unità di conto: l'avanzamento di «Carichi» conta le pratiche, non le righe del file; le pratiche con soli interventi annullati escono dal totale.
  - Procedura numerata «Vedere a che punto è una lista»: Interventi › Carichi; filtro «Stato»; doppio clic sulla riga; le schede delle fasi («Assegnati a operatore», «Eseguiti», «Completati», più «Assegnati a zona» solo con il modulo Zone); «Operatori del carico»; «Elenco carichi» per tornare.
  - Una frase su che cosa conta come «Completati»: controllate o inviate (predefinito) oppure solo inviate, secondo l'impostazione della commessa in Impostazioni › Generale, sezione «Carichi». Rimando ai capitoli 6 e 7 per verifica ed esportazione.
  - Contro-obiezione: «Ho chiuso la lista per sbaglio: posso riaprirla?» → no, non c'è un pulsante per riaprirla (dal dossier); che cosa resta (interventi eseguiti) e che cosa si è perso (interventi non ancora eseguiti, cancellati).
  - Riquadro `> **Attenzione:**` su «Chiudi carico»: conferma «Chiudere il carico selezionato?», gli interventi non eseguiti vengono cancellati, gli eseguiti restano, gli operatori coinvolti ricevono la notifica, nessuna riapertura.
  - **Limite:** permessi di lettura e di modifica delle liste (senza permesso di modifica il salvataggio non avviene e non compare un messaggio chiaro); «Tipo carico» ha valori che dipendono dalla commessa (verificare); i dati dell'importazione (data, numero di interventi) non si modificano da qui.
  - Riquadro `> **Per gli sviluppatori:**` (breve): `lib/AvanzamentoCarichi.php` come unica fonte dei numeri; gli stati di chiusura si leggono da `interventi_eseguiti.stato_id`, non da `interventi.stato_id`. Rimando al capitolo 14.
- **Key facts for the Researcher:** colonne e pulsanti di `pages/carichi.php` / `lib/AvanzamentoCarichi.php` (colModel righe ~393–419); effetti di `JSONController::chiudi_carico`; valori di «Tipo carico» e se sono comuni o per commessa; chiave `carichi_completati_da` e valori `verificati`/`inviati`; etichetta del filtro «Stato» (All/Tutti, Aperto, Chiuso) letta da `lib/dict/lang_it.php`; esistenza e percorso dell'elenco «Liste» citato per l'Importazione classica.

---

### Beat 4 — `## Lotto e distretto: come si divide il lavoro, e perché una lista non si vede`

- **Core question:** a che cosa servono lotto e distretto, che differenza c'è tra i due, e quali proprietà della lista decidono se compare nella pianificazione?
- **Audience tag:** [UFFICIO] (anagrafica lotti per amministratori) + [STAFF] nella sottosezione di diagnosi
- **Word count target:** 950 parole
- **Funzioni dei paragrafi:** Aggancio (il lotto decide chi vede che cosa) → Spiegazione (lotto: nome + numero; distretto: zona del committente) → Procedura (creare un lotto) → Limite (eliminare, cambiare valore) → Diagnosi (lista assente dal Piano) → Sintesi.
- **Contenuto richiesto:**
  - Lotto secondo `CONTEXT.md`: la parte di commessa o di contratto a cui appartiene una lista. È un nome legato a un numero, il «Valore nel carico» (da −128 a 127, unico nella commessa). La lista porta il numero, non il nome.
  - Procedura numerata «Creare un lotto» da Interventi › Lotti: «Aggiungi», «Nome» (obbligatorio, massimo 100 caratteri), «Commessa», «Valore nel carico», «Attivo», «Salva».
  - Regola delle tendine: se la commessa ha almeno un lotto nell'anagrafica (anche disattivato) valgono solo i lotti attivi dell'anagrafica; altrimenti i nomi configurati in precedenza per la commessa. Conseguenza: tutti i lotti disattivati = tendina vuota.
  - Una frase sulla regola di visibilità («un utente senza lotti assegnati vede tutti i lotti della commessa; il primo lotto assegnato lo limita a quello») e il rimando al capitolo 11 per gli utenti di competenza.
  - Riquadro `> **Attenzione:**` su «Elimina» del lotto: nessuna conferma, non si annulla, spariscono anche le assegnazioni degli utenti; alternativa: togliere «Attivo». Cambiare il «Valore nel carico»: le liste già importate conservano il vecchio numero.
  - Distretto secondo `CONTEXT.md`: una zona del committente (un comune, un'area) indicata sulla lista; al massimo 30 caratteri; dove la commessa ha i campi della pratica dell'importazione, il distretto può stare anche sulla singola pratica e quello della lista vale per le pratiche che non ne hanno uno (verificare, `lib/ImportazionePratica.php`). Non è la zona della pianificazione (capitolo 5).
  - Sottosezione `### Quando una lista non compare nella pianificazione` — elenco ordinato dei controlli, ciascuno con il rimedio (NUF 3): (1) la lista è chiusa; (2) il campo «Cliente» della lista è vuoto; (3) l'utente ha lotti assegnati e la lista è in un altro lotto; (4) la lista non ha più pratiche senza intervento (es. tutto già pianificato: è corretto che non compaia); (5) la tendina legge una copia salvata valida un'ora: se la copia è stata scritta quando la condizione era falsa, la lista ricompare alla scadenza. Contro-obiezione in forma di dubbio: «Ma se la lista c'è e non compare nel Piano?».
  - Riquadro `> **Quando chiedere allo staff tecnico:**`: dopo un'ora le condizioni risultano vere e la lista manca ancora; oppure il salvataggio del lotto dà «Salvataggio non riuscito: anagrafica lotti non disponibile». Si può anche chiedere a Gea (capitolo 10), che fa gli stessi controlli in sola lettura.
  - **Limite:** il filtro «Distretto» di «Clienti» ha effetto sulla griglia solo per alcune commesse; se non cambia nulla non è un guasto.
- **Key facts for the Researcher:** `lib/LottoService.php` (`opzioniSelect`, precedenza DB → `$custom['lotti']` → `Export::getLotti()`), `lib/db/2026-09-02-gop227-lotti.sql`, intervallo e unicità del valore; `lib/VistaTendinaListe.php` (condizioni `lista_non_chiusa`, `cliente_valorizzato`, `lotto_utente`, utenza libera via `LEFT JOIN interventi` su `id_carico` + `id_utenza`, `DURATA_CACHE = 3600`); `carichi.distretto varchar(30)`, `ImportazionePratica::MAX_DISTRETTO`, modulo `importazione_rev1`; filtro Distretto attivo per quali commesse (descrivere come «alcune commesse» se l'elenco non è stabile).

---

### Beat 5 — `## Lo stato di un'utenza: una copia dell'ultimo intervento toccato`

- **Core question:** da dove viene lo stato che si legge su un'utenza, e perché a volte non corrisponde al lavoro fatto?
- **Audience tag:** [TUTTI] (riquadro [DEV])
- **Word count target:** 900 parole
- **Funzioni dei paragrafi:** Aggancio (il caso: «assegnato» dopo la chiusura) → Spiegazione (lo stato è copiato, non calcolato) → Dimostrazione (tabella dei codici) → Procedura (verificare dalla scheda utenza) → Limite → Sintesi.
- **Contenuto richiesto:**
  - Apertura sul caso reale breve, senza nomi né commessa: l'ufficio vede un'utenza «assegnato» dopo che l'operatore ha chiuso l'intervento e pensa a un problema di sincronizzazione (problema → causa → controllo → rimedio).
  - Tabella dei codici di stato 1–10 (NUF 9), colonne Codice | Nome | Che cosa significa in una frase. Indicare che i passaggi da uno stato all'altro sono nel capitolo 6. Se il dossier conferma il codice 99 («utente assente») solo lato utenza, citarlo in una frase, non in tabella.
  - La regola: lo stato dell'utenza non è un riassunto dei suoi interventi; ogni azione dell'ufficio su un intervento (assegnare, pianificare, chiudere, annullare) copia lo stato di **quell**'intervento sull'utenza.
  - Quando si vede: finché un'utenza ha un intervento aperto alla volta, la copia coincide con la realtà. Le commesse con gli interventi multipli (impostazione della commessa, configurazione voluta e non difetto) permettono più interventi aperti sulla stessa utenza, per esempio su due liste diverse: lì la copia può mostrare lo stato dell'intervento sbagliato.
  - Procedura numerata «Controllare se il lavoro è stato fatto»: aprire la scheda dell'utenza, scheda «Interventi», cercare un intervento eseguito; se c'è, il lavoro è registrato; foto ed esito stanno sull'intervento eseguito, non sull'utenza.
  - Regola da ricordare: per far leggere «eseguito» a un'utenza con più interventi aperti bisogna chiudere o annullare tutti quelli ancora aperti.
  - Contro-obiezione: «Ma l'operatore l'ha chiusa: perché l'utenza è ancora assegnata?».
  - Collegamento alla sezione 3: l'avanzamento di «Carichi» non legge lo stato dell'utenza ma le esecuzioni, quindi i due numeri possono non coincidere, ed è quello di «Carichi» a contare.
  - Riquadro `> **Per gli sviluppatori:**`: `InterventoBase::updateStatoUtenza()` (unico punto che scrive `utenti.stato_id` da un intervento), `GOPlanner::hasInterventiMultipli()`, `UtenzaBase::getUltimoInterventoChiuso()`; un report che deve dire lo stato reale non deve fidarsi di `utenti.stato_id` quando gli interventi multipli sono attivi. Rimando ai capitoli 6 e 14.
  - **Limite:** né l'ufficio né Gea ricalcolano lo stato dell'utenza; Gea legge gli interventi e dice se uno è già eseguito (capitolo 10).
  - Riquadro `> **Quando chiedere allo staff tecnico:**`: nessun intervento della utenza risulta eseguito ma l'operatore dice di averlo chiuso → è il caso del capitolo 12, «dove si è fermato il dato».
- **Key facts for the Researcher:** `lib/InterventoBase.php` (costanti 1–10, `updateStatoUtenza` e righe), `lib/UtenzaBase.php` (costanti, `STATO_UTENTEASSENTE = 99`, `getUltimoInterventoChiuso`), `lib/GOPlanner.php` (`hasInterventiMultipli`), numero indicativo delle commesse con l'impostazione attiva (solo con la sua data e senza nomi, oppure omesso), etichette a schermo degli stati (es. «non fattibile» vs `non_fattibile`) da `lib/dict/lang_it.php`.

---

### Beat 6 — `## I campi personalizzati: i dati in più di ogni commessa`

- **Core question:** quali dati in più può raccogliere una commessa, chi li scrive, dove si vedono e che cosa non si può cambiare dopo?
- **Audience tag:** [TUTTI] (riquadro [DEV])
- **Word count target:** 850 parole
- **Funzioni dei paragrafi:** Aggancio (una commessa vuole una seconda lettura o una data che il file porta e GOPlanner no) → Spiegazione (tre famiglie) → Dimostrazione (tabella) → Limite (30 campi, nessuna rinomina) → Sintesi.
- **Contenuto richiesto:**
  - Definizione di `CONTEXT.md`: un dato in più che una commessa raccoglie oltre a quelli comuni, per esempio una seconda lettura.
  - Tabella delle tre famiglie (NUF 5): (a) campi dell'intervento che l'operatore compila nell'app (il modulo arriva al telefono all'accesso); (b) campi in sola lettura mostrati come informazione; (c) campi nuovi creati da File › Importazione con «+ Nuovo campo» (nome e tipo: testo, numero o data). Colonne: Chi lo scrive | Dove si vede | Che cosa non si può fare. Le etichette e le denominazioni dell'interfaccia vanno prese dal dossier; se l'interfaccia non nomina (a) e (b), descriverle senza inventare un'etichetta.
  - Campi nuovi: compaiono in coda alla griglia «Clienti», si ordinano, si cercano, si filtrano con la «Ricerca Avanzata» (maggiore, minore, tra) ed escono nel file Excel; un valore non del tipo scelto resta vuoto e finisce fra gli avvisi del resoconto, la riga si importa lo stesso. Rimando al capitolo 4 per il passo di importazione.
  - Contro-obiezione: «Ho creato il campo con il nome sbagliato: posso cancellarlo o rinominarlo?» → no dall'interfaccia; è una richiesta allo staff tecnico. Stesso nome già usato con un altro tipo → messaggio «Esiste già un campo «X» di tipo …».
  - **Limite:** al massimo 30 campi nuovi per commessa, con il motivo detto in parole semplici (ogni campo nuovo è un dato vero sulla pratica, e una pratica ha un limite di spazio); la scheda della pratica e l'app non mostrano i campi nuovi, solo la griglia «Clienti» (stato al 25 novembre 2026, dal dossier); le altre griglie, come quella degli interventi, non li hanno.
  - Quali campi personalizzati ha la propria commessa: si possono chiedere a Gea, che descrive la configurazione della commessa aperta (capitolo 10); cambiarli è lavoro dello staff tecnico.
  - Riquadro `> **Per gli sviluppatori:**`: i valori dei campi dell'intervento stanno nella colonna JSON `servizi` di `interventi_eseguiti`; ogni campo nuovo è una colonna `extra_<nome>` di `carichi_righe` creata dal server (mai `campi_extra`), registrata in `campi_nuovi`; le griglie si dichiarano per commessa in `flexifields.php`. Rimando al capitolo 14.
  - Chiusura del capitolo (ultimo paragrafo della sezione, funzione Sintesi, vedi TARGET): la regola generale, non un annuncio del capitolo 4.
- **Key facts for the Researcher:** `docs/02-patterns/17-flexigrid-and-campicustom.md` § 2.1 e 2.2 (campi custom e campi extra: nomi, distribuzione all'app via login, salvataggio in `servizi`), `docs/02-patterns/51-campo-nuovo-colonna-di-carichi-righe.md` (30 campi, 400 colonne, tipi, messaggi all'utente, «Cosa non fa»), `lib/ImportazioneCampoNuovo.php` (costanti e limiti), etichetta esatta «+ Nuovo campo…», messaggi a schermo citati in italiano; `wiki/assistenza-clienti/configurazione-tenant.md` per ciò che Gea mostra.

---

## REVIEWER READINESS NOTES

### Tension points (dove il capitolo deve creare una posta in gioco reale)

1. **Un oggetto, due nomi (sezione 3).** Il lettore cerca «la lista» e trova «Carichi»; preme «Lista» nel menu Interventi e trova interventi. La posta: cercare nel posto sbagliato e concludere che i dati non ci sono. La tabella etichetta → oggetto è la risoluzione.
2. **«Assegnato» dopo la chiusura (sezione 5).** Sembra lavoro perso o un problema di sincronizzazione, e porta a ticket inutili o a far ritornare l'operatore sul posto. La posta: tempo dell'ufficio e dell'operatore. La risoluzione è il controllo dalla scheda «Interventi».
3. **La lista che sparisce dal Piano (sezione 4).** Il giorno della pianificazione la lista non c'è nella tendina. La posta: un giorno di lavoro non assegnato. La risoluzione è l'elenco ordinato dei controlli, con la copia salvata di un'ora come causa più sorprendente.
4. **Pulsanti senza ritorno (sezioni 3, 4, 6).** «Chiudi carico» cancella gli interventi non eseguiti e non si riapre; «Elimina» del lotto non chiede conferma; un campo nuovo non si toglie dall'interfaccia. La posta: dati o configurazione che non si recuperano da soli.

### Key chains to make explicit (causa → conseguenza → azione del lettore)

- Un intervento appartiene a utenza + lista → la stessa utenza in due liste può avere due interventi aperti → lo stato dell'utenza può riflettere quello sbagliato → si controlla la scheda «Interventi» prima di aprire un ticket.
- Lo stato dell'utenza è copiato dall'ultimo intervento toccato → chiudere solo il più recente non basta → si chiudono o si annullano tutti gli interventi aperti di quella utenza.
- La tendina del Piano legge una copia salvata per un'ora → una lista appena liberata resta nascosta → si aspetta la scadenza della copia, poi, se manca ancora, si chiede allo staff tecnico con lista, ora e utente.
- Il campo «Cliente» della lista è vuoto → la lista non entra mai nella tendina del Piano → si compila da «Modifica carico» (se il dossier conferma che il campo è modificabile lì).
- Le liste portano il numero del lotto, non il nome → cambiare il «Valore nel carico» stacca le liste già importate dal lotto → si cambia il valore solo se nessuna lista lo usa; per nascondere un lotto si toglie «Attivo».
- L'avanzamento conta pratiche ed esecuzioni, non lo stato dell'utenza → i numeri di «Carichi» e quelli di «Clienti» possono non coincidere → per sapere a che punto è una lista si guarda «Carichi».
- Ogni campo nuovo è un dato vero sulla pratica → c'è un tetto di 30 e non si rinomina → si sceglie nome e tipo prima di premere, e si riusa un campo esistente quando c'è.

### Risk proportionality guards (ogni rischio con il suo contesto)

- **«Chiudi carico»:** dire che gli interventi già eseguiti, con esiti e foto, restano; che cosa si perde sono gli interventi non ancora eseguiti. Non presentarlo come un pulsante pericoloso da evitare: è il modo previsto per chiudere una lista finita.
- **«Elimina» del lotto:** l'alternativa sicura esiste (togliere «Attivo»); le liste non vengono cancellate insieme al lotto (verificare nel dossier e dirlo solo se confermato).
- **«Elimina» dell'utenza:** irreversibile, ma chiede conferma; è un'azione rara e legata al permesso.
- **Stato «assegnato»:** dire esplicitamente che, se un altro intervento dell'utenza è eseguito, il lavoro non è perso; e che gli interventi multipli sono una scelta voluta per alcune commesse, non un difetto.
- **«Consolida utenze»:** strumento dello staff tecnico, i lavori non si annullano; l'ufficio non lo usa da solo.
- **Tetto di 30 campi nuovi:** è un limite tecnico motivato, non un guasto; oltre il tetto l'utente legge un messaggio che dice a chi rivolgersi.
- **Copia salvata di un'ora:** non è un errore né un dato perso; le utenze della lista restano.
- Nessun numero di rischio senza fonte; nessun nome di commessa usato per illustrare un problema.

### Contro-obiezioni pianificate (STYLE_BIBLE: almeno due)

1. Sezione 4: «Ma se la lista c'è e non compare nel Piano?»
2. Sezione 5: «Ma l'operatore l'ha chiusa: perché l'utenza è ancora assegnata?»
3. Sezione 3: «Ho chiuso la lista per sbaglio: posso riaprirla?»
4. Sezione 6: «Ho creato il campo con il nome sbagliato: posso cancellarlo?»

### Litmus test atteso

Un collega nuovo dell'ufficio, con il solo capitolo, sa: dove trovare una lista (anche se si chiama «carico»), leggerne l'avanzamento, capire perché non è nella tendina del Piano, capire perché un'utenza dice «assegnato», e che cosa può e non può fare con lotti e campi personalizzati. Uno sviluppatore nuovo trova nei riquadri le tabelle giuste (`utenti`, `carichi`, `carichi_righe`) senza cadere nell'errore `utenze`.

---

## RESEARCHER BRIEF

**Il web non è una fonte per questo capitolo** (INSTRUCTION § 2, SOURCE OVERRIDE). Le «search terms» sono query sulle fonti interne, nell'ordine di priorità: codice `php8` (sola lettura), wiki e `docs/`, Portolano, Jira GOP (sola lettura). Repository: `/home/alan/firstmate/projects/GOPlanner`. Filtro di sicurezza obbligatorio prima di scrivere il dossier: niente nomi di persone, nominativi di intestatari, indirizzi, valori di configurazione o credenziali; i nomi delle commesse solo dove una funzione vale per poche commesse.

Le piste indicate con «(pista)» sono state viste dall'Architect sul ramo `php8` il 25 novembre 2026: vanno lette, verificate e triangolate, non copiate.

### 1. Codice — file e pattern di ricerca

```bash
# Tabelle e chiavi
grep -n -A14 "CREATE TABLE \`carichi\`" lib/db/db.sql
grep -n -A6  "CREATE TABLE \`carichi_righe\`" lib/db/db.sql
grep -n -A12 "INSERT INTO \`stati\`" lib/db/db.sql
grep -n "\$table" lib/UtenzaBase.php lib/CaricoBase.php lib/CaricoRigaBase.php lib/InterventoBase.php
# Stati e stato dell'utenza
grep -n "const " lib/InterventoBase.php lib/UtenzaBase.php | head -40
grep -n -A6 "function updateStatoUtenza" lib/InterventoBase.php
grep -n -A10 "function getUltimoInterventoChiuso" lib/UtenzaBase.php
grep -n -A4 "function hasInterventiMultipli" lib/GOPlanner.php
grep -rln "updateStatoUtenza" lib/ | head
# Lista: pagina Carichi, chiusura, impostazione Completati
grep -n "col(" lib/AvanzamentoCarichi.php
grep -n -A30 "function chiudi_carico" lib/JSONController.php
grep -rn "carichi_completati_da" lib/ | head
# Tendina del Piano
sed -n 1,40p lib/VistaTendinaListe.php
# Lotti
grep -n "function opzioniSelect" -A40 lib/LottoService.php
cat lib/db/2026-09-02-gop227-lotti.sql
# Distretto e campi della pratica
sed -n 1,45p lib/ImportazionePratica.php
# Pratica già presente / riuso dell'utenza all'importazione
sed -n 1,30p lib/ImportazioneEsecuzione.php
grep -n "function getId" -A25 lib/Utenza.php lib/UtenzaBase.php
# Consolidamento utenze
sed -n 20,160p lib/jobs/ConsolidaUtenzaJob.php
# Campi nuovi
grep -n "const \|function nomeColonna\|function colonnaValida" lib/ImportazioneCampoNuovo.php
# Etichette a schermo
grep -n -E "'(Carico|Lista|Batch|Chiudi carico|Tipo carico|Load value|Modifica carico|Chiudere il carico selezionato\?)'" lib/dict/lang_it.php
```

File da leggere per intero: `lib/AvanzamentoCarichi.php` (colonne, fasi), `lib/VistaTendinaListe.php`, `lib/LottoService.php`, `pages/carichi.php`, `pages/lotti.php`, `pages/utenze.php`, `js/code/scheda_utenza.js` (etichette della scheda), `Smarty_templates/it/Carichi.html`, `Smarty_templates/it/lotti.html`.

### 2. Wiki e docs (percorsi relativi al repository)

- `wiki/assistenza-clienti/pagina-carichi.md` — colonne, fasi, «Modifica carico», «Chiudi carico» ed effetti, permessi.
- `wiki/assistenza-clienti/pagina-lotti.md` — «Valore nel carico», «Attivo», «Elimina» senza conferma, utenti di competenza, regola delle tendine.
- `wiki/assistenza-clienti/stato-utenza-assegnato-dopo-chiusura.md` — il caso della sezione 5.
- `wiki/assistenza-clienti/pagina-clienti.md` — menu «Clienti», scheda utenza, filtri, «Elimina», colonna «Geocodifica».
- `wiki/assistenza-clienti/pagina-interventi-menu.md` — la voce «Lista» di Interventi è l'elenco degli interventi.
- `wiki/assistenza-clienti/runbook-lista-assente-tendina-piano.md` e `runbook-lista-tutta-da-pianificare.md` — condizioni della tendina, copia salvata, eliminazioni.
- `wiki/assistenza-clienti/import-carico.md` — «lista nuova / lista esistente», Codice, duplicati (solo per i rimandi; il dettaglio è del capitolo 4).
- `wiki/assistenza-clienti/pagina-admin-manutenzione.md` — «Consolida utenze».
- `wiki/assistenza-clienti/configurazione-tenant.md` — campi custom, campi extra, che cosa mostra Gea.
- `docs/01-foundations/03-database-facts.md` — glossario lista/lotto/pratica/distretto e tabelle del DB della commessa.
- `docs/01-foundations/07-database-schema.md` — solo per registrare il conflitto C1.
- `docs/02-patterns/34-stato-utenza-derivato-ultimo-intervento.md`, `35-lotti-entita-e-etichette-legacy.md`, `43-avanzamento-carichi-fonte-stati.md`, `51-campo-nuovo-colonna-di-carichi-righe.md`, `17-flexigrid-and-campicustom.md` (§ 2).
- `CONTEXT.md` — definizioni da riportare alla lettera nel [PUBLIC].

### 3. Portolano (`mcp__rag_qdrant_server__query_rag_hybrid`, `user_roles: "goplanner"`; se scarso, `query_rag`)

Una prova dell'Architect con una query generica ha dato risultati non pertinenti: usare query strette e citare solo gli slug pertinenti.
- «stato utenza assegnato dopo chiusura intervento interventi multipli»
- «chiudi carico interventi non eseguiti cancellati»
- «lotti valore nel carico anagrafica utenti di competenza»
- «lista non compare tendina pianificazione copia salvata»
- «campo nuovo importazione colonna carichi_righe trenta campi»
- «distretto lista pratica importazione Sologas REV.1»
- «consolida utenze codici duplicati»
- «carichi completati verificati inviati impostazione»

### 4. Jira GOP (sola lettura; cloudId `21873985-2e5d-4a8a-bb45-e6d453128985`)

- `project = GOP AND key in (GOP-227, GOP-228, GOP-582, GOP-640, GOP-638, GOP-770, GOP-480, GOP-481)` — lotti, utenti di competenza, avanzamento dei carichi, impostazione «Carichi», campi nuovi, campi della pratica, registro importazioni.
- `project = GOP AND text ~ "stato utenza" ORDER BY created DESC`
- `project = GOP AND text ~ "interventi_multipli"`
- `project = GOP AND text ~ "chiudi carico"`
- `project = GOP AND text ~ "tendina liste" OR text ~ "lista non compare"`
- `project = GOP AND text ~ "consolida"`
Cercare almeno una storia reale (problema → causa → rimedio) per le sezioni 4 e 5, da raccontare senza nomi di persone.

### 5. Fatti specifici da trovare (con lo stato atteso)

- **A1** Le tre tabelle: lista = `carichi`, pratica = `carichi_righe` (`id_carico`, `id_utenza`), utenza = `utenti`. (pista: `CaricoBase.php`, `UtenzaBase.php` `$table = 'utenti'`, `db.sql`)
- **A2** L'intervento porta `id_carico` e `id_utenza`: appartiene a una pratica. (pista: `db.sql`, `VistaTendinaListe::JOIN_INTERVENTI`)
- **A3** Come l'importazione riconosce un'utenza o una pratica già presente: per codice, nella stessa lista o nell'intera commessa? Una pratica nuova in una seconda lista crea una nuova riga di `utenti` o riusa quella esistente? Che cosa sono i «codici utenza duplicati» di «Consolida utenze» e la colonna `utenti.consolidato`? (pista: `ImportazioneEsecuzione.php` riga ~11 «Utenza::getId, per codice»; `ConsolidaUtenzaJob.php`). **Decisivo per la frase d'apertura e per la contro-obiezione della sezione 2.**
- **A4** Che cosa contiene la colonna «Cliente» (`carichi.cliente`) di una lista e la differenza con «Nome cliente» (`nomecliente`) e «Nome file» (`nomefile`). (pista: `AvanzamentoCarichi.php` colModel; `03-database-facts.md` «Ha nome (`cliente`)»)
- **A5** Codici di stato 1–10 con i nomi; codice 99 «utente assente» solo nelle costanti dell'utenza; etichette a schermo in italiano.
- **A6** `updateStatoUtenza()`: che cosa scrive e da quante azioni è chiamato (indicare «decine di azioni dell'ufficio» se il numero esatto non è stabile).
- **A7** Impostazione degli interventi multipli: dove si legge, che cosa permette; numero di commesse che l'hanno attiva solo con la data della misura, senza elenco di nomi.
- **A8** Effetti di «Chiudi carico»: notifica ai tecnici, cancellazione degli interventi non eseguiti, stato «chiuso», nessuna riapertura; testo della conferma.
- **A9** «Completati»: `carichi_completati_da`, valori `verificati` (predefinito) e `inviati`, dove si imposta (Impostazioni › Generale, sezione «Carichi»), chi può modificarla.
- **A10** Lotti: intervallo −128..127, unicità nella commessa, «Nome» massimo 100 caratteri, righe per pagina, precedenza delle tendine (DB → `$custom['lotti']` → valori esistenti), «Elimina» senza conferma, effetto della modifica del valore sulle liste importate, messaggio «anagrafica lotti non disponibile». Le liste di un lotto eliminato restano?
- **A11** Distretto: `carichi.distretto varchar(30)`; distretto per pratica con il modulo `importazione_rev1` (GOP-480) e regola «il valore della lista vale per le pratiche senza»; il filtro «Distretto» di «Clienti» funziona solo per alcune commesse.
- **A12** Tendina del Piano: le quattro condizioni e `DURATA_CACHE = 3600` secondi; dove l'utente vede l'ora di aggiornamento (se la vede).
- **A13** Campi nuovi: 30 per commessa, 400 colonne per la tabella, tipi e formati, prefisso `extra_`, registro `campi_nuovi`, dove si vedono, «Cosa non fa», messaggi all'utente in italiano.
- **A14** Campi dell'intervento (`getCampiCustom()`, invio all'app all'accesso, salvataggio in `interventi_eseguiti.servizi`) e campi in sola lettura (`docs/02-patterns/17` § 2.2): nomi che l'interfaccia usa per mostrarli, se esistono.
- **A15** Scheda utenza: titolo «Riepilogo dati utenza», dati chiave (PDR, Matricola, Lotto, Carico, Prossimo intervento) e schede (Mappa, Interventi, Photo, Reports, Storico).
- **A16** «Tipo carico»: i valori (A4, B3, Cassettinaggio, CRZ, Lettura aperiodica MIS) sono comuni o di alcune commesse?

### 6. Conflitti noti da registrare in [CONFLICT]

- **C1 — `utenze` o `utenti`.** `docs/01-foundations/07-database-schema.md` e `docs/00-concept-index.md` indicano `utenze` (chiave `id_utenza`) come tabella principale delle utenze; il codice su `php8` (`lib/UtenzaBase.php`, `$table = 'utenti'`) e `docs/01-foundations/03-database-facts.md` dicono che «Clienti» è la tabella `utenti`. Esiste anche una tabella `utenze` in `db.sql`. Il codice vince: verificare che cosa contiene oggi `utenze` e se è usata.
- **C2 — campo «Cliente» della lista.** Stabilire se è il nome della lista, un codice del committente o altro; la tendina del Piano richiede che non sia vuoto.
- **C3 — etichetta del filtro «Stato» di «Carichi».** La wiki riporta sia «All» sia «Tutti»: leggere `lib/dict/lang_it.php` e il template.
- **C4 — elenco «Liste» dell'Importazione classica.** La wiki cita un elenco «Liste» con colonne in inglese (Completion, Interventions, Executed…): verificare se è una pagina ancora raggiungibile e da quale menu, o un layout vecchio della griglia `carichi`.
- **C5 — lotto: tre forme.** `docs/02-patterns/35` descrive le etichette di configurazione ancora attive per le commesse senza anagrafica: registrare quale regola vale oggi per le tendine.

### 7. Tipi di documento da privilegiare

1. Codice sul ramo `php8` (classi `lib/`, `pages/`, dizionario `lib/dict/lang_it.php`, `lib/db/*.sql`).
2. Pagine della wiki `assistenza-clienti` verificate su dev (hanno la sezione «Non verificato»: riportarne i limiti).
3. Documenti di decisione `docs/02-patterns/34`, `35`, `43`, `51`.
4. Ticket Jira con descrizione e commenti di chiusura (per le storie reali).
5. Portolano solo se aggiunge un fatto non presente sopra.

---

## TARGET

- **Word count:** 5.400 parole (PRD § 4: 4.000–6.000 per capitolo; sei sezioni da 800–1.050, entro le 600–1.200 di STYLE_BIBLE § Pacing), più il paragrafo «In questo capitolo» e la sezione `## Fonti` fuori conteggio.
- **Opening hook strategy:** aprire, dopo «In questo capitolo», con un file inventato e dichiarato come tale (1.200 righe, lista *Letture marzo*) e dire con i numeri che cosa diventa dentro GOPlanner (una lista, le sue pratiche, le utenze, ancora nessun intervento), formulato secondo quanto il dossier stabilisce sul riuso delle utenze (A3).
- **Closing beat promise:** il capitolo chiude con una regola da usare in ogni pagina, non con un annuncio: prima di fidarsi di un numero o di uno stato, chiedersi di quale oggetto parla (utenza, pratica, lista o intervento) e da dove viene letto.

---

## Note per Writer ed Editor

- Ordine fisso delle sezioni: 1 mappa → 2 utenza → 3 lista e pratica → 4 lotto e distretto → 5 stato → 6 campi personalizzati. Lo stato viene dopo la lista perché si spiega solo sapendo che un intervento appartiene a una pratica.
- Tabelle obbligatorie: oggetti (sez. 1), etichetta → oggetto (sez. 3), codici di stato (sez. 5), tre famiglie di campi (sez. 6).
- Procedure numerate obbligatorie: aprire la scheda di un'utenza (sez. 2), vedere l'avanzamento di una lista (sez. 3), creare un lotto (sez. 4), controllare se il lavoro è stato fatto (sez. 5). Più l'elenco ordinato dei controlli «lista assente dal Piano» (sez. 4).
- Riquadri: almeno due `> **Attenzione:**` (Chiudi carico, Elimina lotto), almeno due `> **Quando chiedere allo staff tecnico:**`, almeno tre `> **Per gli sviluppatori:**` (sez. 1, 3 o 5, 6), ciascuno breve e saltabile.
- Nessun nome di persona, nessun nominativo di intestatario, nessun indirizzo reale; esempi inventati dichiarati come tali. Nomi di commesse solo se una funzione vale per poche commesse, e mai per illustrare un problema.
- `## Fonti` finale: solo fonti effettivamente usate, nel formato di STYLE_BIBLE § Formato.
