# Chapter 4 — Struttura (Architect)

**Titolo del capitolo (H1 finale):** `# 4. Importazione: dal file del committente alla lista`
**Parte:** II — Il lavoro quotidiano
**Audience tag del capitolo (PRD § 4):** BACKOFFICE — sezioni [UFFICIO], una sezione [TUTTI], un riquadro «Per gli sviluppatori» [DEV] e un riquadro «Quando chiedere allo staff tecnico» [STAFF].
**Domanda centrale (PRD § 4):** come si importa un file (File › Importazione, Importazione classica), che cosa sono le mappature, gli scarti e i loro motivi, che cosa fare quando il tracciato cambia (anche con Gea), dove si vede l'esito.
**Litmus test del Reviewer:** un collega nuovo del back office riceve il file mensile del committente, lo importa, spiega a chi glielo chiede perché la lista ha meno pratiche del file, e sa quando fermarsi e scrivere allo staff tecnico, senza chiedere a nessuno.

---

## 0. Continuità, confini e glossario (da leggere prima di tutto)

**Continuity check.** Al momento della stesura non esistono `chapter_index.md` né `NARRATIVE_GLOSSARY.md` nella cartella del libro (i capitoli girano in parallelo, DECISIONI O4). Prima di scrivere, Writer e Reviewer li rileggono se nel frattempo sono comparsi e controllano in particolare:
- le definizioni di *lista*, *pratica*, *utenza*, *lotto* del capitolo 3: il capitolo 4 le usa, non le rispiega (una frase e il rimando);
- che cosa il capitolo 10 dice di «Autorizza» e delle proposte di Gea: il capitolo 4 descrive solo il caso della mappatura e rimanda;
- che cosa il capitolo 7 dice delle mappature di esportazione: il capitolo 4 parla solo di quelle di importazione.

**Confini (una riga di rimando, niente di più):**

| Argomento | Dove sta | Nel capitolo 4 |
|---|---|---|
| Lista, pratica, utenza, lotto, distretto come concetti | cap. 3 | una frase + «vedi il capitolo 3» |
| Destinazione «Magazzino» della stessa pagina | cap. 9 | una frase: esiste, solo dove il magazzino è attivo |
| Geocodifica e mappa dopo l'importazione, utenze da pianificare | cap. 5 | una frase: a fine importazione parte la geocodifica |
| Gea in generale, proposte, «Autorizza», consigli all'apertura | cap. 10 | solo il caso «Gea verifica il file e corregge la mappatura» |
| Permesso «Importare interventi» come regola, profili | cap. 11 | si nomina il permesso, non si spiega RBAC |
| Pagine Admin, log, «dove si è fermato il dato» | cap. 12 | rimando nel riquadro staff |
| `mappature.php` come codice, flusso MVC, job asincroni | cap. 13 | riquadro DEV con mappa dei file, nessuna spiegazione del codice |
| Tabelle `carichi`, `carichi_righe`, `utenze` | cap. 14 | solo i nomi nel riquadro DEV |
| Call center, VoiceAI («Sara») | cap. 15 | solo come limite: vale per le commesse che lo usano |
| Mappature di esportazione | cap. 7 | nessuna |

**Glossario (`CONTEXT.md`) — vincoli specifici di questo capitolo.**
- Si dice *importazione*, mai «import», «upload», «caricamento dati». Si dice *lista*, mai «carico» (la parola compare solo come nome di tabella `carichi` nel riquadro DEV, con la corrispondenza «la lista, che nel codice si chiama carico»). Si dice *scarto*, mai «errore», «riga rifiutata», «riga persa». Si dice *commessa*, mai «tenant» nel testo per l'ufficio. Si dice *committente*, mai «cliente».
- *Riga* va bene per la riga del file; una pratica non si chiama mai «riga» né «record».
- *Tracciato* si usa solo nel senso di «disposizione delle colonne del file del committente» (come nel PRD e nei runbook), mai per dire esportazione.
- Etichette dell'interfaccia che contengono parole da evitare («Clienti», «cliente» nelle opzioni dell'Importazione classica, «errore nel salvataggio» come motivo di scarto) si citano tra «» esattamente come appaiono: sono etichette, non scelte lessicali della guida.

---

## NUFs (Goal Scoring)

Dieci NUF, un punto ciascuno: l'Editor assegna 1 se il capitolo finale soddisfa la condizione con una fonte del dossier, 0 altrimenti. Soglia di PASS 8,5/10 (INSTRUCTION § Editor).

### Utility (reader) — che cosa sa fare il lettore

```
utility(reader): Reader can scegliere tra File › Importazione e File › Importazione classica per un file dato, e dire perché (modello di sistema marcato «classica», limite di 10 MB, scarti non salvati nella classica) → score += 1
utility(reader): Reader can importare un file in una lista nuova o in una lista esistente seguendo una procedura numerata con le etichette esatte (scelta della mappatura, «Scheda 1 · Mappatura», «Scheda 2 · Dati da importare», duplicati «ignora»/«sovrascrivi», «Importa») e sa che nulla entra in GOPlanner prima di «Importa» → score += 1
utility(reader): Reader can spiegare la differenza tra le righe del file e le pratiche della lista leggendo il resoconto (righe lette, importate, nuove, già presenti, invariate, ignorate, scartate con il motivo; avvisi = valori non riconosciuti, che non sono scarti) → score += 1
utility(reader): Reader can prevedere che cosa fa una reimportazione a una pratica già presente nei sei casi (nuova, aperta, con appuntamento, conclusa, annullata nel file, ripetuta nel file) e decidere se e quando un'importazione si può annullare entro 24 ore → score += 1
utility(reader): Reader can diagnosticare un file il cui tracciato è cambiato (colonna mancante, intestazione cambiata, colonne scalate, zeri iniziali persi, notazione scientifica, data come numero di cinque cifre, foglio sbagliato) e scegliere il rimedio: correggere il file, scegliere un altro modello, aggiornare la mappatura a mano o con la proposta di Gea → score += 1
```

### Utility (emotional) — come si sente il lettore

```
utility(emotional): Reader feels sicuro a usare la mappatura «Automatica (regole e AI)» e la correzione proposta da Gea, perché conosce le reti di sicurezza: nulla prima di «Importa» o «Autorizza», controlli sul file intero che bloccano, «Annulla lavoro», annullamento entro 24 ore, «Ripristina», modello di sistema mai toccato → score += 1
utility(emotional): Reader knows dove fermarsi e chiedere allo staff tecnico: importazione «fallita», scarto «errore nel salvataggio», file Excel o CSV valido che risulta non leggibile, importazioni «momentaneamente sospese» che restano tali, un modello di sistema da cambiare → score += 1
```

### Utility (factual) — affermazioni verificabili con fonte

```
utility(factual): I limiti numerici del capitolo, ciascuno con fonte di codice o wiki: 10 MB (Importazione classica), 2.000 righe (sopra arriva anche una mail a fine lavoro), 24 ore (annullamento), 90 giorni (conservazione del file archiviato, valore predefinito modificabile per commessa), 100 scarti conservati per esteso, 30 minuti (segnalibro rosso se il lavoro è fermo), dieci minuti (tempo per premere «Autorizza») cited with source → score += 1
utility(factual): Dove stanno i modelli: modelli salvati dalla pagina nella tabella `mappature_import` del database della commessa; modelli di sistema in `custom/{tenant}/php/mappature.php`, in sola lettura e duplicabili; storico delle correzioni in `mappature_import_storico` cited with source → score += 1
utility(factual): Il permesso «Importare interventi» (`interventi.importare`) serve sia alla pagina Importazione sia alla correzione della mappatura con Gea; i file che governano l'importazione (`lib/ImportazioneController.php`, `lib/ImportazioneEsecuzione.php`, `lib/ImportazioneReimportazione.php`, `lib/MappaturaImport.php`, `pages/file.php` per la classica) cited with source → score += 1
```

---

## BEAT LIST

Sei sezioni `##` (INSTRUCTION: 5–6). Ogni sezione apre con il rigo in corsivo «per chi è» quando non è per tutti (STYLE_BIBLE § Voice rules 6), contiene almeno un dettaglio esatto (§ Concreteness mandate) e almeno un paragrafo **Limite** (§ Paragraph functions). Le due contro-obiezioni obbligatorie sono assegnate alle sezioni 3 e 5 (più due di riserva nelle sezioni 2 e 4).

Dopo l'H1: paragrafo in corsivo «*In questo capitolo* …» (2–3 frasi: che cosa si impara, per chi è, che i riquadri DEV si possono saltare).

---

### Beat 1 — `## Che cosa fa un'importazione`

- **Domanda centrale:** che cosa succede tra il momento in cui il file del committente arriva e il momento in cui le pratiche compaiono in una lista, e da quale voce del menu si parte?
- **Tag:** [TUTTI]
- **Parole:** 800 (±100)
- **Funzioni dei paragrafi:** Aggancio (il caso d'apertura, vedi TARGET) → Spiegazione (la catena file → mappatura → controlli → lista → pratiche → geocodifica) → Dimostrazione (tabella delle due voci del menu) → Limite → Sintesi.
- **Contenuto:**
  - La catena in sei anelli, detta una volta e poi usata come indice del capitolo (ogni sezione successiva è un anello).
  - Le due voci del menu File: «Importazione» (pagina nuova) e «Importazione classica» (percorso precedente, per le mappature che lo usano ancora). Tabella Markdown a due colonne: formati accettati, come si sceglie la mappatura, limite di dimensione, se salva gli scarti, dove si legge l'esito, se si può annullare.
  - Chi vede le voci: profili con il permesso «Importare interventi»; gli altri profili vedono al più «Esportazione». Una frase + «vedi il capitolo 11».
  - La pagina Importazione ha due destinazioni in «Cosa importi»: «Pratiche» e «Magazzino» (solo dove il magazzino è attivo). Il capitolo tratta «Pratiche»; Magazzino → «vedi il capitolo 9».
  - Alcune commesse aggiungono voci proprie al menu File («Conversione», «Analisi»): si nominano come specifiche di alcune commesse, senza dire quali se il dossier non lo sa.
- **Limite obbligatorio:** la scelta tra le due voci non è del lettore: dipende da come è configurata la mappatura della commessa (un modello di sistema può essere marcato come importabile solo dalla classica). Se il modello che serve compare solo nella classica, si usa la classica.
- **Fatti che il Researcher deve trovare:**
  - etichette esatte delle voci del menu File e della scelta «Cosa importi: Pratiche / Magazzino» (`pages/file.php`, `Smarty_templates/it/file.html`, `lib/dict/lang_it.php`);
  - formati accettati dalla pagina nuova (wiki: xls, xlsx, ods, csv; `lib/ImportazioneLettore.php`) e dalla classica (dipende dalla mappatura: Excel, testo a colonne fisse, CSV con `;`);
  - il limite di 10 MB della classica (`Smarty_templates/it/file.html`, messaggio «Il file eccede la dimensione massima consentita (max 10MB)») ed eventuale limite della pagina nuova;
  - la chiave `classica` dei modelli di sistema in `lib/MappaturaImport.php` (docblock iniziale): che cosa significa per l'utente;
  - permesso `interventi.importare` / «Importare interventi» in `lib/CatalogoPermessi.php`.

---

### Beat 2 — `## La mappatura: come GOPlanner legge il file`

- **Domanda centrale:** come fa GOPlanner a sapere che la colonna C del file è la matricola, e che cosa succede quando il committente sposta una colonna?
- **Tag:** [UFFICIO] — con riquadro `> **Per gli sviluppatori:**` [DEV] in coda (max 120 parole, saltabile).
- **Parole:** 950 (±100)
- **Funzioni dei paragrafi:** Aggancio (la mappatura è la regola che dice quale colonna va in quale campo) → Spiegazione (modelli salvati e di sistema; impronta) → Dimostrazione (elenco puntato delle quattro scelte con l'etichetta esatta) → Spiegazione (riconoscimento delle colonne spostate) → Limite → contro-obiezione di riserva → riquadro DEV.
- **Contenuto:**
  - Definizione operativa di *mappatura* / *modello di mappatura*: quale colonna del file va in quale campo di GOPlanner, più foglio, riga d'intestazione, riga di partenza.
  - Due famiglie di modelli: **salvati** dalla pagina (modificabili, con versioni) e **di sistema** (preparati dallo staff tecnico per la commessa, in sola lettura, si possono duplicare con «Duplica e modifica»).
  - Le quattro scelte della pagina, con l'etichetta esatta: «Riconosci dal file», «Usa un modello», «Automatica (regole e AI)», «Manuale». Che cosa fa ognuna in una riga.
  - L'**impronta** del file spiegata senza gergo: numero di colonne, intestazioni, forma dei valori delle prime 50 righe (per esempio «sedici cifre», «data»); nessun valore del file entra nell'impronta. Se l'impronta coincide con un modello, la pagina lo applica.
  - Reimportando con lo stesso modello le colonne vengono ritrovate per nome e per forma dei valori anche se spostate; ogni riga della «Scheda 1 · Mappatura» dice se la colonna è come prima, spostata, nuova o con valori diversi.
  - «+ Nuovo campo»: crea un campo personalizzato vero (testo, numero o data) che poi si trova nella griglia «Clienti», nei filtri avanzati e nell'Excel; se esiste già un campo con lo stesso nome viene riusato. Una frase + rimando al capitolo 3 per i campi personalizzati.
  - La tendina «Codice»: la colonna che riconosce le pratiche già presenti. Prepara la sezione 4.
  - A fine mappatura: aggiornare il modello, usare le scelte solo per questo file, salvarle come nuovo modello (etichette esatte da verificare).
- **Contro-obiezione di riserva:** «Ma la mappatura automatica con l'AI può mettere una colonna nel campo sbagliato?» → risposta dalle fonti: propone un campo per colonna con il motivo e la quota dei valori che hanno la forma attesa; l'utente conferma; nulla entra prima di «Importa»; i controlli sul file intero girano prima.
- **Limite obbligatorio:** i modelli di sistema non conservano la forma dei valori (si controllano solo le date dedotte dal nome del campo) e un modello senza nomi di colonna, o un file senza intestazione, si confronta per posizione: in quei casi il riconoscimento delle colonne spostate non funziona allo stesso modo. Un modello di sistema non si cambia dalla pagina: si duplica, oppure lo cambia lo staff tecnico.
- **Riquadro DEV (contenuto):** modelli salvati nella tabella `mappature_import` (migrazione 0012) del database della commessa; modelli di sistema letti da `custom/{tenant}/php/mappature.php` con id `sistema:<chiave>`; classe `MappaturaImport` (impronta, riconosci, allinea); regole di deduzione in `ImportazioneRegole`. «La struttura di `mappature.php` è nel capitolo 13.»
- **Fatti che il Researcher deve trovare:**
  - costanti di `lib/MappaturaImport.php`: `RIGHE_IMPRONTA` (50), `QUOTA_FORMA` (0.8), `SOGLIA_ALLINEAMENTO` (0.6), `MAX_COLONNE`, `MAX_CAMPI`, `TIPI_NUOVO` (testo, numero, data), `FONTI` (modello, regola, ai, manuale, fisso) — e che cosa significano per l'utente (tradurre, non citare costanti nel testo per l'ufficio);
  - etichette esatte della «Scheda 1 · Mappatura» (stati della colonna: come prima, spostata, nuova, valori diversi), di «Ignora», «+ Nuovo campo», «Duplica e modifica», «Aggiorna il modello», «Aggiungi nuovo modello» (`Smarty_templates/it/`, JS della pagina Importazione: `grep -rn "Duplica e modifica\|Aggiungi nuovo modello\|Riconosci dal file" Smarty_templates js`);
  - GOP-475 (modelli di mappatura) e GOP-768 (riallineamento?) — verificare il titolo;
  - che cosa fa «Automatica (regole e AI)»: regole (`ImportazioneRegole::deduci`) e quando entra l'AI (`lib/OpenAIImporterHelper.php`?); se i dati del file vengono mandati a un servizio esterno, dirlo come lo dice la fonte (o `[UNVERIFIED]`).

---

### Beat 3 — `## Importare una lista, passo per passo`

- **Domanda centrale:** quali sono i passi esatti per portare un file in una lista nuova o esistente, e che cosa succede mentre l'importazione lavora?
- **Tag:** [UFFICIO]
- **Parole:** 1.050 (±100)
- **Funzioni dei paragrafi:** Procedura (elenco numerato, un'azione per passo) → Spiegazione (lista nuova o esistente; duplicati) → Spiegazione (controlli sul file intero che bloccano) → Dimostrazione (segnalibro: tabella colore → significato) → **contro-obiezione obbligatoria n. 1** → sottosezione `### Importazione classica` (procedura breve) → Limite.
- **Contenuto:**
  - Procedura numerata della pagina «Importazione» (target 9–11 passi): File › Importazione → «Scegli il file…» o trascinamento → scelta della mappatura → «Scheda 1 · Mappatura» (controllo colonne, tendina «Codice») → «Scheda 2 · Dati da importare» (foglio, prima riga come intestazione) → lista nuova (nome obbligatorio, lotto obbligatorio se la commessa ha lotti, scadenza facoltativa) oppure lista esistente (una lista aperta; proposta già scelta se il file ha lo stesso nome) → scelta sui duplicati («ignora» predefinito, «sovrascrivi») → «Tipologia chiamata» e «data cardine» per le righe con colonna vuota o non mappata → tabella delle prime righe (colonne ignorate con dati in arancio) → controlli sul file intero → «Importa».
  - Controlli sul file intero, in sola lettura: che cosa **blocca** l'importazione (codici ripetuti nel file, righe senza «Codice», campi obbligatori senza colonna o vuoti) — tabella o elenco.
  - Coda e avanzamento: l'importazione continua sul server anche se si chiude la pagina; il segnalibro nel menu a sinistra (giallo mentre lavora o aspetta, verde a fine lavoro, rosso se non è riuscita o è ferma da più di 30 minuti); sopra le 2.000 righe arriva anche una mail a fine lavoro.
  - «Annulla lavoro» mentre gira: le pratiche già caricate restano; reimportando **lo stesso file** si riparte dalla riga dopo l'ultima salvata, nella stessa lista, senza lista doppia; regola dei duplicati alla ripresa (lista nuova → sempre «ignora»).
  - Messaggio «Le importazioni sono momentaneamente sospese…»: il file non è stato importato, si riprova più tardi.
  - `### Importazione classica`: procedura breve (5–6 passi): «Mappatura» dalla tendina (elenco diverso da commessa a commessa) → numero di righe → file → «Invia» → anteprima con esito della verifica → opzioni sotto l'anteprima → «Continue import». Le etichette sono in parte in inglese nell'interfaccia: il Writer le riporta **esattamente come nel dossier**, senza tradurle.
- **Contro-obiezione obbligatoria n. 1:** «Ma se l'importazione si ferma a metà, o chiudo la pagina, devo ricominciare da capo e ottengo una lista doppia?» → risposta dalle fonti (coda, «Annulla lavoro», ripresa dalla riga dopo l'ultima salvata, GOP-745).
- **Limite obbligatorio:** la ripresa vale solo per lo stesso file (stessa impronta e foglio); l'Importazione classica non ha né coda né ripresa né annullamento (da verificare); le opzioni della classica cambiano con la mappatura della commessa.
- **Fatti che il Researcher deve trovare:**
  - etichette esatte di pulsanti e campi della pagina Importazione (template e JS della pagina; `grep -rn "Scegli il file\|Importa\b\|Annulla lavoro\|Ultime importazioni\|Tipologia chiamata\|data cardine" Smarty_templates js`);
  - controlli bloccanti: `lib/ImportazioneControllo.php` (elenco esatto e messaggi);
  - coda: `lib/ImportazioneRegistro.php` (`SOGLIA_CODA` = 2000, docblock «Dal GOP-745 ogni importazione passa dalla coda»), `lib/ImportazioneController.php` (riga ~360: mail sopra soglia; `MESSAGGIO_SOSPESE`, riga ~608);
  - segnalibro: `lib/AvanzamentoJob.php` (`SCADENZA_ATTIVO` = 1800 s) e i colori (wiki `import-carico.md`; verificare nel JS del segnalibro);
  - ripresa: `ImportazioneController.php` docblock riga ~48 («stessa impronta e foglio»), `ImportazioneEsecuzione::importa` (`$ripresa`, GOP-745);
  - classica: campi e opzioni in `Smarty_templates/it/file.html` e `pages/file.php` (etichette «Ignore header row», «Ignora duplicati», «Reimport data», «Overwrite data», «Continue import», «Invia», messaggi «Verifica con esito positivo» / «Sono state riscontrate incongruenze»: verificare la grafia esatta, senza emoji nel testo finale).

---

### Beat 4 — `## Quando la pratica c'è già: reimportazione, duplicati e annullamento`

- **Domanda centrale:** che cosa succede a una pratica che è già in GOPlanner quando il committente rimanda il file, e quando si può tornare indietro?
- **Tag:** [UFFICIO]
- **Parole:** 950 (±100)
- **Funzioni dei paragrafi:** Aggancio (il committente rimanda lo stesso file aggiornato; la paura di raddoppiare o di cancellare) → Spiegazione (il «Codice» decide se una pratica è già presente) → Dimostrazione (tabella dei sei casi: situazione → che cosa fa GOPlanner) → Spiegazione (valori pieni, cella vuota, campi protetti; «ignora» / «sovrascrivi») → Procedura breve (annullare un'importazione) → Limite → contro-obiezione di riserva.
- **Contenuto:**
  - Tabella dei sei casi della reimportazione (fonte: `ImportazioneReimportazione::CASI`, «tavola 04», regole della REV.1): nuova; già presente aperta senza appuntamento; già presente con appuntamento (prenotata o assegnata); già conclusa (eseguita o non eseguibile); nel file con stato ANNULLATA; ripetuta nello stesso file. Colonna «che cosa fa GOPlanner» presa dalla fonte, riscritta in italiano del glossario.
  - Regole trasversali: si scrivono solo i valori pieni del file; una cella vuota non cancella il dato salvato; alcuni campi non cambiano mai (identificativo, codice, stato).
  - «ignora» e «sovrascrivi» quando si importa in una lista esistente: che cosa cambia rispetto ai sei casi.
  - Annullare un'importazione: entro 24 ore dalla fine, dal resoconto o dal pulsante «Annulla» nell'elenco «Ultime importazioni». Che cosa toglie (la lista, le sue pratiche, le utenze create dall'importazione; le pratiche portate via da una lista vecchia tornano a contare lì) e quando **non** si può (una pratica della lista ha un intervento, un'utenza ha un appuntamento, il file ha annullato pratiche). Che cosa **non** torna indietro (dati aggiornati sulle pratiche già presenti, note, coordinate trovate, dati scritti dalle regole proprie della commessa).
- **Contro-obiezione di riserva:** «Ma se reimporto lo stesso file due volte, raddoppio le pratiche?» → no, per il «Codice»; tranne il caso «conclusa», che crea una pratica nuova lasciando intatto lo storico.
- **Limite obbligatorio:** il caso «annullata nel file» e l'effetto sul call center («Sara non la richiama», «da richiamare dal call center umano») valgono solo per le commesse che lavorano con il call center: dirlo esplicitamente e rimandare al capitolo 15; un appuntamento annullato dal file non si ripristina con «Annulla». L'Importazione classica segue le sue opzioni («Reimport data», «Overwrite data»), non questa tabella, salvo che il dossier provi il contrario.
- **Fatti che il Researcher deve trovare:**
  - `lib/ImportazioneReimportazione.php`: `CASI` (testo esatto), `CAMPI_PROTETTI`, `STATI_CONCLUSI`, `STATI_APPUNTAMENTO`, `DUPLICATI_IGNORA` / `DUPLICATI_SOVRASCRIVI`, `valoriPieni()`;
  - `lib/ImportazioneRegistro.php`: `ORE_ANNULLAMENTO` = 24, docblock di `annulla()` (condizioni e cose che non si toccano), messaggio «Sono passate più di 24 ore dalla fine dell'importazione»;
  - `docs/02-patterns/13-import-logic-pattern.md` e `wiki/pianificazione/modello-pianificazione-appuntamenti.md` (dove compaiono «REV.1» e «tavola 04»): che cosa sono, per quali commesse valgono;
  - Jira GOP-481 (annullamento), GOP-745 (duplicati e ripresa): titolo e data di rilascio;
  - per quali commesse è attivo il caso ANNULLATA / call center (`grep -rn "da_richiamare\|daRichiamare" lib custom`), oppure `[UNVERIFIED]`.

---

### Beat 5 — `## Leggere l'esito: resoconto, scarti e Ultime importazioni`

- **Domanda centrale:** il file aveva N righe e la lista ne ha meno: dove si legge perché, e che cosa significa ogni numero?
- **Tag:** [UFFICIO]
- **Parole:** 950 (±100)
- **Funzioni dei paragrafi:** Aggancio (ritorno al caso d'apertura) → Dimostrazione (tabella delle voci del resoconto: voce → che cosa conta → è uno scarto?) → Spiegazione (i motivi di scarto) → **contro-obiezione obbligatoria n. 2** → Spiegazione (classica: dove si legge l'esito) → Limite → Sintesi (la somma che deve tornare).
- **Contenuto:**
  - Le voci del resoconto e la loro relazione: righe lette, importate, nuove, già presenti, invariate, ignorate, scartate, con coordinate, da geocodificare, avvisi. Messaggio chiave: *invariate*, *ignorate* e *avvisi* non sono scarti; gli avvisi sono valori non riconosciuti (campo lasciato vuoto), non righe perse.
  - Motivi di scarto con la dicitura esatta del codice: «senza codice»; «codice ripetuto nel file (riga N)» (vale la prima riga); «rifiutata dai controlli del tenant» (controlli propri della commessa); «errore nel salvataggio» → staff tecnico. Per ognuno: che cosa correggere nel file.
  - Dove si rilegge: elenco «Ultime importazioni» della pagina (righe, scarti e motivi, stato); il resoconto conserva per esteso i primi 100 scarti, gli altri sono solo contati; il file archiviato si conserva 90 giorni (valore predefinito; la commessa può cambiarlo, 0 = mai cancellato).
  - Importazione classica: non salva righe scartate né motivi; una riga rifiutata dalla validazione della commessa è saltata senza traccia; l'esito si legge nell'elenco delle liste con le colonne di avanzamento (etichette esatte da dossier).
  - Gea come prima domanda: «mancano righe dopo l'importazione» → Gea legge il registro e risponde con numeri e motivi (una frase + rimando al capitolo 10).
- **Contro-obiezione obbligatoria n. 2:** «Ma se uso l'Importazione classica, dove vedo quali righe sono rimaste fuori?» → non si vedono: si conoscono solo le pratiche entrate; per il dettaglio degli scarti serve la pagina «Importazione».
- **Limite obbligatorio:** il registro delle importazioni esiste solo dove è applicata la sua migrazione; per una lista senza registro (classica o precedente) chi ha caricato il file e quando si ricavano dal file archiviato, e nella classica anteprima e importazione non si distinguono. Il nome di chi ha importato lo vedono solo gli amministratori (rimando al capitolo 11).
- **Fatti che il Researcher deve trovare:**
  - `lib/ImportazioneEsecuzione.php`: docblock di `importa()` (voci del resoconto), `MAX_SCARTI` = 100, `scarta()`, motivi alle righe ~275, ~280, ~301, ~309;
  - `pages/file.php` riga ~1318 (classica: riga rifiutata da `validateImportData()` saltata senza traccia);
  - `lib/ImportazioneArchivio.php`: `GIORNI` = 90, `$custom['import_archivio_giorni']`, decisione del 3 novembre 2026;
  - `lib/ChatbotImportExport.php` (che cosa vede Gea), wiki `wiki/assistenza-clienti/stato-import-export.md`, `wiki/assistenza-clienti/runbook-import-righe-mancanti.md`;
  - etichette esatte delle colonne dell'elenco liste per la classica (wiki cita «Completion», «Interventions», «Executed», «Not feasible», «Assigned»: verificare nel template italiano);
  - caso reale del banco `R-2026-11-09-import-scarti` (problema → causa → rimedio, senza dati personali) per il caso d'apertura.

---

### Beat 6 — `## Quando il tracciato cambia: diagnosi, correzione della mappatura e Gea`

- **Domanda centrale:** il file è giusto ma il committente ha cambiato la disposizione delle colonne: come si capisce che cosa è cambiato e come si corregge senza rompere le importazioni successive?
- **Tag:** [UFFICIO] — chiude con il riquadro `> **Quando chiedere allo staff tecnico:**` [STAFF].
- **Parole:** 1.000 (±100)
- **Funzioni dei paragrafi:** Aggancio (il modello che ieri si riconosceva oggi non si applica) → Dimostrazione (tabella sintomo nel file → rimedio) → Spiegazione (tre rimedi: file, altro modello, mappatura) → Procedura (correzione con Gea: chiedere, leggere l'anteprima, «Autorizza» o «Annulla», verifica, «Ripristina») → Limite → riquadro staff → Sintesi del capitolo (vedi TARGET, closing).
- **Contenuto:**
  - Tabella sintomo → rimedio dai runbook (una riga per sintomo, nessuna cella multiriga): colonna mancante; intestazione cambiata; colonne scalate di un posto; zeri iniziali persi o notazione scientifica (1,23E+15) → colonna come testo e codici ricopiati dall'originale; data come testo o numero di cinque cifre → formato data gg/mm/aaaa; separatore delle migliaia / unità o valuta; foglio sbagliato; righe sopra la tabella; nessun modello coincide.
  - Perché i codici rovinati sono il sintomo più pericoloso: il «Codice» decide se la pratica è già presente (collegamento con la sezione 4).
  - Gea in questo caso: verifica il file colonna per colonna (con lettera e intestazione) e propone la nuova mappatura campo per campo («Matricola: colonna A → colonna B»); nulla cambia prima di «Autorizza» (entro dieci minuti); un modello salvato riceve una versione in più; un modello di sistema non si tocca mai, nasce una copia «NOME (aggiornato)»; «Ripristina» rimette il modello com'era se nessuno lo ha cambiato dopo; ogni correzione resta nello storico (chi, quando, prima e dopo). Serve il permesso «Importare interventi».
  - Che cosa Gea **non** risolve con la mappatura: valori di forma diversa, foglio o riga d'intestazione cambiati → si corregge il file.
- **Limite obbligatorio:** dove lo storico non è attivo («storico non disponibile») le correzioni di Gea non ci sono e la mappatura si cambia dalla pagina; un modello di sistema da cambiare davvero (non copiare) resta allo staff tecnico.
- **Riquadro «Quando chiedere allo staff tecnico»** (elenco puntato, ciascuna voce con che cosa mandare: nome del file, giorno e ora, numero dell'importazione se visibile): importazione «fallita»; scarto «errore nel salvataggio»; file Excel o CSV valido che risulta non leggibile; «momentaneamente sospese» che non si sblocca; anteprima vuota o incoerente nella classica (mappatura della commessa da verificare); modello di sistema da modificare. Rimando al capitolo 12 per le pagine di diagnostica.
- **Riquadro «Per gli sviluppatori»** (opzionale qui o nella sezione 2, max 100 parole, solo se il Writer ha spazio): mappa dei file — `lib/ImportazioneController.php` (pagina e coda), `lib/ImportazioneEsecuzione.php` (righe e scarti), `lib/ImportazioneReimportazione.php` (sei casi), `lib/ImportazioneRegistro.php` (registro e annullamento), `lib/ChatbotVerificaImport.php` e `lib/ChatbotStrumentoProponiMappatura.php` (Gea), `lib/MappaturaImportStorico.php` (storico), `pages/file.php` (classica). «Il flusso è spiegato nel capitolo 13.»
- **Fatti che il Researcher deve trovare:**
  - `wiki/assistenza-clienti/runbook-file-import-non-conforme.md` e `lib/ChatbotVerificaImport.php`: elenco esatto dei sintomi e dei rimedi; maschera degli esempi (9 = cifra, x = lettera);
  - `wiki/assistenza-clienti/runbook-correggere-mappatura.md`, `lib/ChatbotStrumentoProponiMappatura.php`, `lib/MappaturaImportStorico.php` (tabella `mappature_import_storico`, migrazione 0044): dieci minuti per «Autorizza», «NOME (aggiornato)», «Ripristina», condizioni;
  - Jira GOP-816 (correzione su conferma e storico): titolo, data;
  - profili che hanno «Importare interventi» per impostazione (wiki: amministratore cliente, amministratore tenant, pianificatore — tradurre in parole del glossario o rimandare al capitolo 11);
  - `wiki/assistenza-clienti/runbook-pagina-file-non-funziona.md` (pagina bianca) per il riquadro staff.

---

## REVIEWER READINESS NOTES

### Tension points (dove il capitolo deve creare una posta reale)

1. **La perdita silenziosa (sezioni 1 e 5).** Nell'Importazione classica una riga rifiutata dalla validazione della commessa viene saltata senza traccia e gli scarti non si salvano. La posta: il committente chiede perché un'utenza non è mai stata visitata e nessuno può dire se era nel file. Il capitolo deve far sentire la differenza tra «la lista ha 1.150 pratiche» e «il file aveva 1.200 righe, 50 sono state scartate per questi motivi». Non drammatizzare: dirlo come regola e dare il rimedio (pagina «Importazione» quando il modello lo consente).
2. **La reimportazione sopra una lista già pianificata (sezione 4).** Rimandare un file su pratiche con appuntamento, o con pratiche marcate ANNULLATA, cambia il lavoro di operatori già assegnati, e un appuntamento annullato dal file non torna con «Annulla». La posta è concreta: il giro di domani di un operatore. Il Writer la mostra con la tabella dei sei casi, non con aggettivi.
3. **I codici rovinati da Excel (sezione 6).** Zeri iniziali persi o notazione scientifica cambiano il «Codice»: la pratica non viene riconosciuta come già presente e diventa una pratica nuova (o uno scarto per codice ripetuto). È l'anello che collega sezione 2 (Codice), 4 (reimportazione) e 6 (tracciato): rendere esplicita la catena.
4. **La finestra di 24 ore (sezione 4).** L'annullamento è una rete di sicurezza con condizioni precise: chi aspetta il giorno dopo, o pianifica subito, la perde.

### Catene causa → conseguenza → azione del lettore (da rendere esplicite nel testo)

- Il committente sposta o aggiunge una colonna → l'impronta non coincide più → «Riconosci dal file» passa all'automatica o il modello non si applica → il lettore controlla la «Scheda 1 · Mappatura» (colonne spostate, nuove) o chiede a Gea la verifica del file → aggiorna il modello (o autorizza la proposta) → le importazioni successive si riconoscono di nuovo.
- Excel trasforma i codici (zeri iniziali, 1,23E+15) → il «Codice» non coincide con quello salvato → la pratica non viene riconosciuta come già presente → il lettore formatta la colonna come testo, ricopia i codici dall'originale e reimporta, invece di cercare il problema in GOPlanner.
- Il file contiene lo stesso codice su due righe → vale la prima, la seconda è scarto «codice ripetuto nel file (riga N)» → la lista ha una pratica in meno → il lettore legge il motivo nel resoconto e chiede al committente quale riga è giusta.
- L'importazione è nella classica → nessuno scarto registrato → la differenza tra file e lista non si spiega dal gestionale → il lettore confronta a mano o, se il modello lo permette, usa la pagina «Importazione».
- Scarto «errore nel salvataggio» o importazione «fallita» → non dipende dal file → il lettore non riprova all'infinito: manda allo staff tecnico nome del file, giorno e ora.
- Importazione sbagliata scoperta subito → entro 24 ore e prima di pianificare → «Annulla» dal resoconto o da «Ultime importazioni»; dopo, o con interventi già creati → correzione con una nuova importazione o con lo staff tecnico.

### Risk proportionality guards (ogni rischio con il suo contesto di bilanciamento)

- **Mappatura «Automatica (regole e AI)».** Se si nomina il rischio di un campo sbagliato, nello stesso paragrafo: la proposta mostra colonna, valori e campo; l'utente conferma; i controlli sul file intero girano prima; nulla entra prima di «Importa»; c'è l'annullamento entro 24 ore. Niente toni di allarme sull'AI, niente entusiasmo.
- **Correzione della mappatura con Gea.** Se si dice che Gea cambia un modello: nulla prima di «Autorizza»; il modello di sistema non si tocca mai; «Ripristina»; storico con chi, quando, prima e dopo; serve il permesso «Importare interventi».
- **Importazione classica.** Non presentarla come «vecchia» o «da abbandonare» se il dossier non lo dice: è il percorso ancora usato dalle mappature che non sono passate alla pagina nuova, e alcune commesse importano solo da lì. Il limite (niente scarti registrati) va detto insieme al motivo per cui esiste ancora.
- **Annullamento.** «Si può annullare entro 24 ore» va sempre con le condizioni (nessun intervento, nessun appuntamento, nessuna pratica annullata dal file) e con ciò che non torna indietro; altrimenti il lettore si fida di una rete che non c'è.
- **Conservazione del file archiviato.** 90 giorni è il valore predefinito, non una regola universale: la commessa può cambiarlo (0 = mai cancellato). Dirlo così.
- **Call center / «Sara».** Il caso «annullata nel file» e le pratiche da richiamare valgono solo per le commesse che lavorano con il call center: dichiararlo come limitato, non come comportamento generale (STYLE_BIBLE § Anti-AI 8).
- **«Momentaneamente sospese».** Va detto che il file non è stato importato (nessuna lista a metà) e che lo staff è avvisato automaticamente; la richiesta allo staff tecnico serve solo se la sospensione resta.

### Controlli formali che il Reviewer verificherà

- Un solo H1 `# 4. Importazione: dal file del committente alla lista`; paragrafo «*In questo capitolo*»; sei `##`; `## Fonti` in fondo.
- Ogni sezione: rigo «per chi è», ≥1 dettaglio esatto, ≥1 paragrafo Limite, ≤5 paragrafi di prosa consecutivi senza elemento di orientamento.
- Due contro-obiezioni obbligatorie (sezioni 3 e 5) presenti nella forma del dubbio del lettore.
- Tabelle previste: due voci del menu (s. 1), sei casi di reimportazione (s. 4), voci del resoconto (s. 5), sintomo → rimedio (s. 6). Procedure numerate: pagina Importazione (s. 3), classica (s. 3), annullamento (s. 4), correzione con Gea (s. 6).
- Nessun nome di persona (il wiki `ener_mms` contiene il cognome di un referente del committente: non deve arrivare nel testo), nessun nome di committente oltre al minimo necessario, nessuna emoji (anche se i messaggi della classica ne contengono: si riporta il testo senza emoji o si descrive il messaggio).

---

## RESEARCHER BRIEF

**Web search:** nessuna. Override di INSTRUCTION § Researcher: il web non è una fonte per questo libro. Ordine delle fonti: codice (`php8`, sola lettura) → wiki e `docs/` → Portolano → Jira GOP.

### 1. Codice (`/home/alan/firstmate/projects/GOPlanner`, ramo `php8`, SOLA LETTURA)

File da leggere per intero (docblock e costanti):
- `lib/ImportazioneController.php` — pagina, coda, sospensione (`MESSAGGIO_SOSPESE`), ripresa, mail sopra soglia
- `lib/ImportazioneEsecuzione.php` — `importa()`, resoconto, `MAX_SCARTI`, motivi di scarto
- `lib/ImportazioneReimportazione.php` — `CASI`, `CAMPI_PROTETTI`, duplicati
- `lib/ImportazioneRegistro.php` — stati (`in_coda`, `in_corso`, `completata`, `fallita`, `annullata`, `interrotta`, `proseguita`), `SOGLIA_CODA`, `ORE_ANNULLAMENTO`, `annulla()`
- `lib/ImportazioneControllo.php` — controlli sul file intero che bloccano
- `lib/MappaturaImport.php` — modelli salvati e di sistema, impronta, costanti
- `lib/ImportazioneRegole.php` — regole di deduzione dell'automatica
- `lib/ImportazioneArchivio.php` — conservazione 90 giorni, `import_archivio_giorni`, nome del file archiviato
- `lib/ImportazioneLettore.php` — formati (xls, xlsx, ods, csv)
- `lib/AvanzamentoJob.php` — `SCADENZA_ATTIVO` (segnalibro rosso)
- `lib/ChatbotVerificaImport.php`, `lib/ChatbotStrumentoProponiMappatura.php`, `lib/MappaturaImportStorico.php` — Gea
- `lib/CatalogoPermessi.php` (riga ~65) — «Importare interventi»
- `pages/file.php` (menu File, Importazione classica, riga ~1318) e `Smarty_templates/it/file.html` (limite 10 MB, etichette della classica)

Grep utili (read-only):
```bash
git grep -n "Riconosci dal file\|Usa un modello\|Automatica (regole e AI)\|Manuale" -- Smarty_templates js lib
git grep -n "Scheda 1\|Scheda 2\|Dati da importare\|Ultime importazioni\|Annulla lavoro" -- Smarty_templates js
git grep -n "Duplica e modifica\|Aggiorna il modello\|Aggiungi nuovo modello\|Nuovo campo" -- Smarty_templates js lib
git grep -n "senza codice\|codice ripetuto nel file\|rifiutata dai controlli\|errore nel salvataggio" -- lib
git grep -n "Ignore header row\|Reimport data\|Overwrite data\|Continue import\|incongruenze" -- Smarty_templates pages
git grep -n "import_archivio_giorni" -- lib custom/default
git log --oneline --grep="GOP-745\|GOP-481\|GOP-816\|GOP-475" -- lib/Importazione* lib/MappaturaImport*
```

### 2. Wiki e docs

- `wiki/assistenza-clienti/import-carico.md` — guida generale (fonte principale per le sezioni 1–4)
- `wiki/assistenza-clienti/pagina-file.md` — voci del menu File, chi le vede, 10 MB
- `wiki/assistenza-clienti/stato-import-export.md` — che cosa si sa e che cosa non si sa di un'importazione
- `wiki/assistenza-clienti/runbook-import-righe-mancanti.md` — motivi di scarto, classica senza scarti
- `wiki/assistenza-clienti/runbook-file-import-non-conforme.md` — sintomi del tracciato cambiato
- `wiki/assistenza-clienti/runbook-correggere-mappatura.md` — Gea, «Autorizza», «Ripristina», permesso
- `wiki/assistenza-clienti/runbook-pagina-file-non-funziona.md` — pagina bianca
- `wiki/assistenza-clienti/configurazione-tenant.md` — mappature della commessa
- `wiki/assistenza-clienti/runbook-attivita-utente.md` — consiglio di Gea dopo un'importazione andata male (solo per un rimando)
- `wiki/pianificazione/modello-pianificazione-appuntamenti.md` — REV.1 / tavola 04
- `docs/00-concept-index.md` (riga «Mappature Import/Export Tenant»)
- `docs/02-patterns/13-import-logic-pattern.md`
- `docs/03-cookbooks/02-create-import-export-map.md`, `docs/03-cookbooks/14-mappature-file-per-agent-coder.md` — solo per il riquadro DEV
- `CONTEXT.md` — glossario (importazione, scarto, lista, pratica, mappatura non è nel glossario: usare la parola come la usa la wiki)

### 3. Portolano (`mcp__rag_qdrant_server__query_rag_hybrid`, `user_roles: "goplanner"`; se scarso, `query_rag`)

- `"pagina Importazione mappatura Riconosci dal file modello"`
- `"importazione scarti motivi codice ripetuto senza codice"`
- `"reimportazione pratica già presente appuntamento REV.1"`
- `"annullare importazione 24 ore"`
- `"importazione classica mappatura anteprima Continue import"`
- `"tracciato cambiato committente mappatura colonne spostate"`
- `"Gea corregge mappatura Autorizza Ripristina storico"`
- `"importazioni momentaneamente sospese coda segnalibro"`
- `"zeri iniziali notazione scientifica file import"`
- `"R-2026-11-09-import-scarti"` (caso del banco)

### 4. Jira GOP (sola lettura; cloudId `21873985-2e5d-4a8a-bb45-e6d453128985`)

- `project = GOP AND key in (GOP-475, GOP-478, GOP-480, GOP-481, GOP-502, GOP-739, GOP-745, GOP-768, GOP-816)` — titolo, stato, data di risoluzione (per dire che cosa è attivo e da quando)
- `project = GOP AND (summary ~ "importazione" OR summary ~ "mappatura" OR summary ~ "scarti") ORDER BY updated DESC` — casi reali problema → causa → rimedio
- `project = GOP AND text ~ "tracciato" AND text ~ "import" ORDER BY created DESC` — un caso di tracciato cambiato (raccontato senza nomi)

### 5. Fatti, numeri ed etichette da cacciare (checklist)

| Fatto | Lead (da verificare, non citare senza dossier) |
|---|---|
| 10 MB limite della classica | `Smarty_templates/it/file.html` r. 12 e 140 |
| Limite di dimensione della pagina nuova (se c'è) | `ImportazioneController.php`, `ImportazioneFileTemporaneo.php` |
| 2.000 righe → mail a fine lavoro | `ImportazioneRegistro::SOGLIA_CODA`, `ImportazioneController.php` r. ~360 |
| 24 ore per annullare, con condizioni | `ImportazioneRegistro::ORE_ANNULLAMENTO`, `annulla()` |
| 90 giorni conservazione file, configurabile | `ImportazioneArchivio::GIORNI`, `import_archivio_giorni` |
| 100 scarti per esteso | `ImportazioneEsecuzione::MAX_SCARTI` |
| 30 minuti → segnalibro rosso | `AvanzamentoJob::SCADENZA_ATTIVO` = 1800 |
| 50 righe per l'impronta | `MappaturaImport::RIGHE_IMPRONTA` |
| dieci minuti per «Autorizza» | `ChatbotStrumentoProponiMappatura.php`, runbook |
| Sei casi di reimportazione, testo esatto | `ImportazioneReimportazione::CASI` |
| Motivi di scarto, testo esatto | `ImportazioneEsecuzione.php` r. ~275–309 |
| Stati del registro delle importazioni | `ImportazioneRegistro` costanti r. 47–55 |
| Messaggio «momentaneamente sospese» | `ImportazioneController::MESSAGGIO_SOSPESE` |
| Tabelle `mappature_import` (migr. 0012), `mappature_import_storico` (migr. 0044) | `MappaturaImport.php`, `MappaturaImportStorico.php` |
| Permesso «Importare interventi» | `CatalogoPermessi.php` r. ~65 |

### 6. Conflitti da risolvere e registrare in [CONFLICT]

- **Coda per tutte le importazioni o solo sopra 2.000 righe?** La wiki dice «ogni importazione va in coda»; il codice ha `MODALITA_SINCRONA` / `MODALITA_CODA` e una costante chiamata `SOGLIA_CODA`, ma il docblock dice «Dal GOP-745 ogni importazione passa dalla coda». Stabilire il comportamento attuale sul codice.
- **Formati:** la wiki elenca xls, xlsx, ods, csv; `MappaturaImport::FORMATI` elenca xls, xlsx, csv (formato del modello). Distinguere «file che la pagina legge» da «formato registrato nel modello».
- **Nome del menu delle liste:** il glossario dice che nel menu è «Lista»; la wiki parla dell'elenco «Liste». Verificare l'etichetta esatta nell'interfaccia.
- **Etichette in inglese della classica** («Ignore header row», «Continue import», colonne «Completion», «Interventions»…): verificare nel template italiano se sono davvero in inglese; il Writer le riporta come sono.
- **Etichetta per salvare un modello:** «Aggiungi nuovo modello» (runbook Gea) vs «salvarle come nuovo modello» (guida): trovare l'etichetta del pulsante.
- **Annullamento e reimportazione nella classica:** verificare se le regole dei sei casi e l'annullamento entro 24 ore valgono anche per la classica (probabile di no).

### 7. Filtro di sicurezza (promemoria)

Nessun nome di persona (attenzione a `wiki/ener_mms/` e ai ticket di commessa), nessuna email, nessun indirizzo, nessun valore di `.env` o di file di credenziali, nessun host interno. I nomi dei committenti si usano solo come nome di commessa visibile nel prodotto e solo se servono (per esempio il modello «senza nomi di colonna» citato nel runbook): preferire «una commessa con un modello senza intestazioni».

---

## TARGET

- **Word count:** 5.700 parole (intervallo accettabile 4.800–6.000, PRD § 4 «Lunghezza»): s. 1 = 800, s. 2 = 950, s. 3 = 1.050, s. 4 = 950, s. 5 = 950, s. 6 = 1.000; «In questo capitolo» e `## Fonti` fuori conteggio.
- **Opening hook strategy:** si apre con un caso breve, reale dal banco `R-2026-11-09-import-scarti` se il dossier lo racconta (altrimenti inventato e dichiarato come tale), in cui il file del committente ha più righe della lista che ne è nata, e si mostra subito che la differenza non è un mistero ma una somma che il resoconto dell'importazione già scrive, motivo per motivo.
- **Closing beat promise:** il capitolo chiude con la regola d'indagine in cinque passi numerati, da usare ogni volta che una lista non torna (resoconto e «Ultime importazioni» → motivi degli scarti → verifica del file colonna per colonna → mappatura da aggiornare o proposta di Gea da autorizzare → staff tecnico con nome del file, giorno e ora), senza annunciare il capitolo 5 e senza riprendere la chiusura di un altro capitolo.
