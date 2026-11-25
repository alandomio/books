# Review — Capitolo 2: Commesse e tenant

Reviewer, 25 novembre 2026. Letti: `PRD.md`, `STYLE_BIBLE.md`, `chapter_2_struttura.md`, `chapter_2.md`. Ogni fatto segnalato è stato controllato contro `dossier_chapter_2.md` e, per il punto sugli operatori, contro `CONTEXT.md` e `.claude/skills/create-new-tenant/SKILL.md` sul ramo `php8`.

## 1. Executive Summary

Capitolo solido, tracciabile quasi riga per riga nel dossier, con un arco chiaro: il caso dei due colleghi, poi dove stanno i dati, la cartella, chi vince, come nasce una commessa, e infine che cosa fare quando non torna. I punti più forti sono la trappola `utenti`/`users`, la storia di GOP-687 (una classe che non si scarica e un'esportazione che fallisce in 9 secondi) e la distinzione onesta fra «Gea accesa per default» nel repository e in produzione.
Non passa con correzioni minime per quattro errori di sostanza:
- un errore di dominio: gli operatori li creerebbe il committente;
- un passo dell'ufficio che presenta Gea come sempre disponibile;
- due rimandi interni sbagliati («sezione precedente»);
- un'affermazione imprecisa sul JavaScript («i livelli tornano tre»).

Ci sono poi tre affermazioni di frequenza senza fonte e una procedura scritta in prosa. Tutto si corregge riscrivendo i singoli paragrafi, senza rifare la struttura. Le correzioni sono già applicate in `chapter_2.md`.

## 2. Score: 47/60 → REVIEWER_CORRECTIONS

| Dimensione | Voto | Motivo in una riga |
|---|---|---|
| 1. Narrativa e struttura | 8/10 | Segue i sei beat, la svolta di «Chi vince» funziona, la chiusura mantiene la promessa; due rimandi sbagliati e un paragrafo (Gea) che afferma e poi ritratta |
| 2. Lingua, stile e voce | 8/10 | Voce Engineer + Scholar quasi ovunque; qualche riempitivo («ed è giusto dirlo», «conviene saperlo») e cornici di frequenza («il dubbio più frequente», «obiezione tipica») |
| 3. Accuratezza fattuale | 7/10 | Tracciabilità eccellente, ma un errore di dominio (committente/operatori), un fatto impreciso (JS), una cifra attribuita male (132/88 righe), due affermazioni senza fonte |
| 4. Allineamento al pubblico | 8/10 | Tag di sezione corretti, procedure per l'ufficio, file e righe per lo staff; la sezione 2, per tutti, era carica di numeri da staff |
| 5. Coinvolgimento | 7/10 | Apertura, caso PDR e GOP-687 fanno «vivere» il problema; la sezione 5 restava un elenco più detto che mostrato |
| 6. Originalità e angolo | 9/10 | Il capitolo sorprende davvero: `templates/` che inganna, classi che non ereditano dal tipo nonostante il diagramma, GOP-266 come override scavalcato al contrario |
| **Totale** | **47/60** | |

## 3. Detailed Findings by section

### «Una commessa, i suoi dati e le sue regole»

- **Forte.** L'aggancio fa quello che la struttura chiede: «I due hanno aperta una commessa diversa, e l'utenza esiste soltanto in una delle due.» La procedura del selettore usa le etichette esatte di `lang_it.php`. «Non subito, quindi. Al prossimo accesso.» è il ritmo giusto della Voice rule 1.
- **Vago.** «un percorso di cambio controllava poco e poteva caricare la configurazione di un tipo sbagliato». «Controllava poco» allude a un problema di sicurezza senza dire niente di utile. La struttura chiede «solo il comportamento visibile». Il dossier lo dà: il cambio aggiornava `db` ma non `dbtype`.
- **Citazione non fedele.** «mai dati personali». Il commento del codice dice «mai dati sensibili».
- **Tabella incoerente.** A sinistra «Il selettore delle commesse e l'intestazione», a destra «il logo»: il logo sta nell'intestazione, quindi l'intestazione non è uguale ovunque. «Il selettore delle commesse e l'intestazione» e «Il modo di cambiare commessa» dicono quasi la stessa cosa, e restano due celle vuote. Inoltre la frase prima della tabella dice che la colonna di destra è «l'elenco delle impostazioni», ma il dossier dice «almeno»: l'elenco non è completo.
- **Cornice di frequenza senza fonte.** «Il dubbio più frequente, a questo punto, è un altro.»

### «Dove stanno i dati: il DB master e un database per commessa»

- **Forte.** La tabella «Che cosa / Dove sta / Tabella» e il riquadro sulla trappola `utenti`/`users` sono il cuore utile del capitolo per lo staff.
- **Regola «tenant» violata in una sezione per tutti.** La citazione «`operatori.id_user` risiede dentro ciascun DB tenant: […] lo scoping degli operatori in produzione» porta «tenant» e «scoping» nella prosa di una sezione [TUTTI]. La regola vincolante 2 della struttura lo vieta.
- **Troppe riserve sullo stesso dato.** Il paragrafo sullo schema canonico mette tre avvertenze sullo stesso rapporto: «citato, non verificato qui», «non viene dalla produzione», «il solo numero confermato anche in Jira». È l'opposto di «one surgical example». Il numero che regge (40 esclusi, GOP-697/702) deve venire prima, il resto dopo, con una sola avvertenza. GOP-697 e GOP-702 mancavano nelle Fonti.
- **Cornice.** «Ed ecco la seconda obiezione tipica.»

### «La cartella della commessa: `custom/{tenant}`»

- **Forte.** La tabella con la colonna «Presente in» è un'idea originale, e tutti i conteggi del 25 novembre 2026 corrispondono al dossier. «Anche il nome `templates/` inganna» è il genere di frase che sostituisce il passaparola.
- **Cifra attribuita male.** «un solo commit su 44 file `flexifields.php`, con 132 righe aggiunte e 88 tolte». Secondo il dossier, 132/88 è il totale del commit su 45 file. Il dato comunque non serve al lettore: va tolto.
- **Affermazione senza fonte.** «Nessun avviso, nessuna riga nel log». La fonte dice «nessun errore SQL, nessun crash», e la riga nel log è una deduzione.
- **Impreciso.** «In molte commesse», quando il numero esatto (44) è nel dossier.

### «Chi vince: l'ordine degli override»

- **Forte.** L'aggancio («in tre commesse il problema è sparito. In una quarta resta identico.») mette in scena il tension point 1 della struttura. Il riquadro su GOP-687 è il passaggio migliore del capitolo.
- **Fatto impreciso.** «Per il JavaScript i livelli tornano tre.» Non ci sono tre livelli di override: `custom.js` è la concatenazione di due file, prima quello del tipo e poi quello della commessa, e nessuno dei due vince sull'altro perché arrivano entrambi. Il comune non ha un `custom.js`.
- **Paragrafo che afferma e poi ritratta.** «L'esempio più istruttivo è Gea.» Il paragrafo costruisce «accesa per default» e poi lo smonta. Il contenuto è giusto; mancava il motivo per cui l'esempio è lì: mostra la regola e il suo limite. «Più istruttivo» è un rafforzativo.
- **Salto logico.** «Il caso è successo anche al contrario. […] Prima di chiudere un ticket, quindi, si cerca l'override». GOP-266 insegna una cosa diversa (il codice comune che scavalca l'override), e il «quindi» non segue. In più, NUF 6 chiede un'abitudine concreta, e il testo non dava al lettore un modo per trovare gli override.

### «Come nasce una commessa nuova»

- **Errore di dominio (critico).** «La procedura di creazione chiede di domandare al committente […]» e «il numero e i nomi degli operatori, che il committente crea da sé». La procedura (`SKILL.md`) scrive «Domande al **cliente**» e «operatori/letturisti li crea il **cliente**». Lì «cliente» è l'azienda che usa GOPlanner, non il committente: secondo `CONTEXT.md` il committente è «il gestore dell'acqua o del gas», mentre gli operatori sono le persone sul campo dell'azienda, seguite dai suoi utenti. Il Writer ha tradotto «cliente» con «committente» in modo automatico, e così ha messo gli operatori nelle mani del gestore del gas.
- **Rimandi sbagliati (due volte).** «il caso PDR della sezione precedente» e il passo 9, «come nella sezione precedente». Il caso PDR è nella sezione «La cartella della commessa», due sezioni prima.
- **Rafforzativo.** «era arrivato in 44 cartelle esattamente così»: la fonte dice solo «per copia-incolla».
- **Frequenza senza fonte, anche nel titolo.** «### I due passi che si dimenticano» / «Due passi della lista vengono dimenticati più degli altri». Nessuna fonte misura quanto si dimentichino. La proprietà verificabile è un'altra: quando mancano, il danno si vede dopo, all'esportazione o alla sincronizzazione.
- **Procedura scritta in prosa.** «Si apre `json_admin.php?action=mappaturaInput` […], si controlla l'elenco, si fa clic su «Esegui» e si legge «Eseguita query!». Riaprendo la pagina […]» va contro § Formato (procedure come elenco numerato). Manca anche la qualifica della fonte: la frase su «Unknown column» è un «rilievo della revisione di GOP-418, dedotto dal codice».
- **Due azioni in un passo.** «11. Rivedi le coordinate testuali e `custom.js`.»
- **Ordine dichiarato e ordine reale non coincidono.** Il testo dice che «La procedura […] dà quest'ordine», ma il passo 13 (`mappaturaInput` dopo il rilascio) viene dal cookbook e da GOP-418, non dalla procedura.
- **Rinvio circolare.** «Quale dei due percorsi usare oggi per una commessa nuova va confermato con lo staff tecnico.» La sezione è scritta per lo staff tecnico.

### «Quando una commessa si comporta diversamente»

- **Forte.** La tabella «Sintomo / Causa probabile / Dove si guarda / Chi interviene» è lo strumento di consultazione che la struttura voleva. La chiusura in tre domande non riprende il capitolo 1 e non annuncia il 3.
- **Funzione presentata come generale (Anti-AI checklist n. 8).** «2. Chiedi a Gea la configurazione della commessa». La sezione 4 dello stesso capitolo spiega che in produzione Gea dipende da un interruttore del servizio e che una commessa la può spegnere.
- **Frase ambigua.** «L'ultima riga merita un esempio, perché il messaggio è sempre lo stesso e la causa no.» Poi gli esempi mostrano la stessa causa (colonna mancante nello schema). Quello che serve al lettore è il criterio che distingue la riga 5 (`mappaturaInput`) dalla riga 7 (struttura del database).
- **Rimando incoerente.** Il riquadro chiude con «I dettagli sono nel capitolo 12», ma `make schema_check` e `migrate.php` sono materia del capitolo 16, come dice la sezione 2 dello stesso capitolo.
- **Lettura incompleta.** «se cambia, sta nella commessa»: dimentica i permessi, che cambiano per commessa (capitolo 11).

### Formato e sicurezza

- Un solo H1, «*In questo capitolo*» presente, rigo di pubblico in ogni sezione, `## Fonti` presente. Nessun segreto, nessun nome di committente, nessun dato personale.
- Tutte le sezioni stanno fra 600 e 1.200 parole: 5.720 parole di corpo dopo le correzioni, nel target 5.000-5.800.
- I commenti HTML in coda sono il contratto del pipeline (`ralph.sh`, riga 925), non un errore del Writer. Vedi però il punto Optional 4.

## 4. Persona Audit

**Verdetto: sul personaggio per circa il 90% del testo; la deriva è puntuale, non strutturale.**

Il personaggio regge dove conta: «il nome esatto (menu, pulsante, tabella, file, permesso)» è rispettato in modo quasi maniacale (righe di codice, messaggi alla lettera, etichette di `lang_it.php`), e «il modo in cui la cosa si rompe e come si rimedia» struttura le sezioni 3, 4 e 5. Ha anche l'onestà dello Scholar: «Se questo produca differenze visibili nelle pagine Admin, le fonti non lo dicono.»

Dove scivola:
1. **Frequenza senza fonte**, la cosa che la persona «never does» («in genere» senza fonte): «Il dubbio più frequente», «obiezione tipica», «vengono dimenticati più degli altri».
2. **Intensificare invece di specificare** (activation phrase 2): «L'esempio più istruttivo», «esattamente così», «controllava poco», «In molte commesse» quando il numero era 44.
3. **Riempitivi da assistente**: «ed è giusto dirlo», «e conviene saperlo».
4. **Il glossario tradito una volta, e nel punto peggiore**: «cliente» del sorgente reso con «committente» nel paragrafo scritto per l'ufficio.
5. **«Se non lo so, non lo scrivo» rovesciato**: «va confermato con lo staff tecnico», scritto allo staff tecnico, sposta il dubbio invece di dichiararlo.

Tutti e cinque i punti sono corretti nel testo.

## 5. Counter-Objection Check

| # | Obiezione nel testo | Forma forte? | Risposta con prove? |
|---|---|---|---|
| 1 | «Ma il collega vede l'utenza e io no, nella stessa commessa?» | Sì: è il dubbio reale che resta dopo l'aggancio | Sì: stringa esatta di `lang_it.php` più la regola del codice («elenco vuoto = nessuna limitazione») |
| 2 | «Lavoro per due committenti: mi servono due accessi?» | Sì | Sì: Elenco utenti, colonna «Commessa e profilo», righe «Senza identità» (wiki) |
| 3 | «Ho corretto il bug in `lib/` e per una commessa non cambia niente» | Sì, ed è la più forte del capitolo | Sì, dopo la correzione: due versi del rischio (override non raggiunto; override scavalcato, GOP-266) e un comando per trovare gli override |

Tre obiezioni, sopra il minimo di due. **Obiezione forte mancante (Optional 1):** lo sviluppatore che ha appena letto «per la configurazione, commessa > tipo > comune» penserà: «allora metto la classe in `custom/{tipo}/php/` e la ereditano tutte le commesse di quel tipo». Il testo risponde già («Non esiste un passo per la cartella del tipo»), ma non in forma di obiezione. Dirlo come dubbio del lettore renderebbe esplicita la trappola che il diagramma della documentazione apre.

## 6. Priority Improvements

### Critical (applicati)
1. **Committente / operatori.** Le domande e la creazione degli operatori riguardano l'azienda, non il committente.
2. **Gea nella procedura dell'ufficio.** Ora c'è la condizione «Se Gea è attiva nella commessa».
3. **Rimandi interni.** «sezione precedente» (due volte) diventa «la sezione «La cartella della commessa»».
4. **JavaScript.** Non ci sono tre livelli: due file in fila, arrivano entrambi, prima quello del tipo.

### Important (applicati)
5. Titolo e attacco «I due passi che si dimenticano» sostituiti da una proprietà verificabile: «I due passi che non danno errore subito».
6. `mappaturaInput` come procedura numerata in 5 passi, con la qualifica della fonte («dedotto dal codice»).
7. GOP-266: salto logico chiuso e abitudine concreta (`git grep -l "function exportData" -- 'custom/*/php/'`).
8. Primo amministratore: tolto il rinvio circolare allo staff tecnico; ora c'è lo stato delle fonti (invito canonico, cookbook e procedura non aggiornati).
9. «Unknown column»: un criterio esplicito per distinguere la riga 5 dalla riga 7 della tabella.
10. Citazione con «tenant» e «scoping» nella sezione per tutti, riscritta in italiano del glossario.
11. Tabella «Uguale / Può cambiare»: tolta l'incoerenza intestazione/logo, nessuna cella vuota, aggiunto il profilo amministratore unico (docs 42), dichiarato che l'elenco non è completo.
12. Caso PDR: «44 cartelle» al posto di «molte», via le cifre 132/88 attribuite male, via la riga nel log senza fonte.
13. Schema canonico: prima il numero confermato, una sola avvertenza; GOP-697/702 aggiunti alle Fonti.

### Optional (da valutare)
1. Aggiungere la contro-obiezione «metto la classe nella cartella del tipo» nella sezione 4, sottosezione «Le classi: due livelli».
2. **Da decidere con il capitano.** Il dossier segna [BLOCKED] il percorso del primo amministratore (`INSERT` diretto o `InvitoUtente::crea()`). Il testo ora dice lo stato delle fonti senza decidere. Quando il capitano decide, va scritta la regola e va aperto un ticket per allineare cookbook e skill. Conviene aggiungerlo a `oracle_questions.md`.
3. Passo 11, «coordinate testuali»: il lettore non sa che cosa siano. Il dossier dice solo che `update_centromappa.php` «geocodifica i valori testuali clonati». Una mezza frase dal sorgente della skill chiarirebbe il passo.
4. I commenti HTML del footer (`<!-- WORD COUNT … -->`) violano alla lettera «niente HTML grezzo» del PRD, anche se sono invisibili. `publish.sh` non li toglie: conviene un filtro in pubblicazione, non una modifica del capitolo.
5. La chiusura in tre domande chiede all'ufficio «che cosa dice la sua cartella in `custom/`», una cartella che l'ufficio non vede. Si potrebbe aggiungere «(o Gea, o lo staff tecnico)», a patto di non appesantire la frase finale.

## 7. Rewritten Paragraphs

### 7.1 — Sezione 5, «Che cosa prepara l'ufficio» (errore di dominio)

**Original:**
> Può però arrivare con le risposte giuste. La procedura di creazione chiede di domandare al committente solo ciò che cambia la configurazione della commessa, e le domande sono tre:
> […]
> Due cose, invece, non servono: il numero e i nomi degli operatori, che il committente crea da sé, e il periodo di lavoro, che non incide sulla configurazione.

**Rewritten:**
> Può però arrivare con le risposte giuste. La procedura dello staff tecnico prevede solo le domande che cambiano la configurazione della commessa, e sono tre:
> […]
> Due cose, invece, non servono: il numero e i nomi degli operatori, perché gli operatori li crea l'azienda stessa, e il periodo di lavoro, che non incide sulla configurazione.

**Why:** in `SKILL.md`, «cliente» è l'azienda che usa GOPlanner. Il glossario definisce il committente come «il gestore dell'acqua o del gas» e vieta di usare «cliente» per lui. Il gestore del gas non crea operatori in GOPlanner. È l'unico errore del capitolo che insegna al lettore dell'ufficio una cosa falsa sul proprio lavoro.

### 7.2 — Sezione 4, «Il JavaScript e le pagine»

**Original:**
> Per il JavaScript i livelli tornano tre. `custom.js` è un solo file servito al browser, ma è la concatenazione di `custom/{dbtype}/js/custom.js` seguito da `custom/{db}/js/custom.js` (`js/code/js.php`, righe 120-130).

**Rewritten:**
> Per il JavaScript il tipo torna a contare, ma in un altro modo. `custom.js` è un solo file servito al browser, fatto di due pezzi in fila: prima `custom/{dbtype}/js/custom.js`, poi `custom/{db}/js/custom.js` (`js/code/js.php`, righe 120-130). Qui non vince uno dei due: arrivano entrambi, e quello della commessa viene dopo quello del tipo.

**Why:** la sezione si intitola «Chi vince», e «tre livelli» fa pensare a un terzo override che non esiste. La concatenazione non è una precedenza. Uno sviluppatore che toglie una funzione dal `custom.js` della commessa per «tornare al tipo» deve sapere che quella del tipo era già caricata.

### 7.3 — Sezione 4, contro-obiezione «Ho corretto in `lib/`» (GOP-266)

**Original:**
> Il primo sospetto è che la commessa sovrascriva la classe, o il metodo. Il caso è successo anche al contrario. Una commessa ridefinisce `export()` ed `exportData()` […] (GOP-266, settembre 2026). Prima di chiudere un ticket, quindi, si cerca l'override nella commessa coinvolta: la correzione va portata anche lì, oppure l'override va ridotto.

**Rewritten:**
> Il primo sospetto è che la commessa sovrascriva la classe, o il metodo: la correzione va portata anche lì, oppure l'override va ridotto. Il rischio esiste anche nel verso opposto, quando è il codice comune a scavalcare l'override. Una commessa ridefinisce `export()` ed `exportData()` […] (GOP-266, settembre 2026). Nei due versi l'abitudine è la stessa: prima di cambiare un metodo di `lib/`, e di nuovo prima di chiudere il ticket, si cerca chi lo ridichiara, per esempio con `git grep -l "function exportData" -- 'custom/*/php/'`. I file trovati sono le cartelle che la correzione non raggiunge da sola.

**Why:** il «quindi» originale tirava da GOP-266 una conclusione che GOP-266 non sostiene. Il caso dimostra il verso opposto. NUF 6 chiede che lo sviluppatore «knows which ones it will not reach», e solo un comando glielo dà. La regola passa dall'essere detta all'essere eseguibile.

### 7.4 — Sezione 5, `mappaturaInput` (procedura in prosa)

**Original:**
> […] `varchar(500)` per i campi di tipo `array`, `varchar(50)` per gli altri. Si apre `json_admin.php?action=mappaturaInput` dopo essere passati alla commessa nuova, si controlla l'elenco, si fa clic su «Esegui» e si legge «Eseguita query!». Riaprendo la pagina non deve restare nessun `ADD COLUMN`. La prova del cookbook è del 9 ottobre 2026, su una commessa nuova (GOP-418): «12 colonne create, seconda chiamata vuota». Va fatto prima della prima sincronizzazione: senza quelle colonne la sincronizzazione dell'app «può fallire con "Unknown column" e l'importazione può perdere i valori senza avvisare». Il primo giorno di lavoro degli operatori dipende da questo passo.

**Rewritten:**
> […] `varchar(500)` per i campi di tipo `array`, `varchar(50)` per gli altri. Senza quelle colonne, secondo un rilievo della revisione di GOP-418 dedotto dal codice, la sincronizzazione dell'app «può fallire con "Unknown column" e l'importazione può perdere i valori senza avvisare». Il passo si fa dopo il rilascio e prima che un operatore sincronizzi, con un utente dello staff GOPlanner:
>
> 1. Passa alla commessa nuova.
> 2. Apri `json_admin.php?action=mappaturaInput`.
> 3. Controlla l'elenco delle colonne proposte.
> 4. Fai clic su «Esegui» e verifica il messaggio «Eseguita query!».
> 5. Riapri la stessa pagina: non deve restare nessun `ADD COLUMN`.
>
> La prova del cookbook è del 9 ottobre 2026, su una commessa nuova (GOP-418): «12 colonne create, seconda chiamata vuota». Il primo giorno di lavoro degli operatori dipende da questo passo.

**Why:** § Formato chiede le procedure come elenco numerato, una azione per passo. È il passo che la struttura chiama «il primo giorno degli operatori», e deve potersi eseguire a colpo d'occhio. Il cookbook dichiara che il rischio è «dedotto dal codice», e la persona lo dice invece di presentarlo come osservato.

### 7.5 — Sezione 6, «Unknown column»

**Original:**
> L'ultima riga merita un esempio, perché il messaggio è sempre lo stesso e la causa no. Un errore 1054, «Unknown column», vuol dire che una query chiede una colonna che in quel database non c'è. GOP-645, chiuso il 5 novembre 2026, ne conta 333 per la colonna `esito`, che mancava in 13 schemi di commessa. La correzione è stata nel codice: […]

**Rewritten:**
> Due righe della tabella, la quinta e l'ultima, possono avere lo stesso messaggio e cause diverse. Un errore 1054, «Unknown column», vuol dire che una query chiede una colonna che in quel database non c'è. Se la colonna è un campo del file del committente, in `carichi_righe`, è mancato il passo `mappaturaInput`. Se è una colonna del codice comune, la causa è la struttura del database della commessa. GOP-645, chiuso il 5 novembre 2026, conta 333 errori per la colonna `esito`, che mancava in 13 schemi di commessa; la correzione è stata nel codice, […]

**Why:** l'originale annunciava «la causa no» e poi mostrava due esempi con la stessa causa. Chi consulta la tabella ha bisogno del criterio che separa la riga 5 dalla riga 7, e il criterio viene da fatti già nel dossier: le colonne di `mappaturaInput` stanno in `carichi_righe`, mentre `esito` e `data_prevista` sono colonne del codice comune.

### 7.6 — Sezione 5, titolo e attacco di «I due passi»

**Original:**
> ### I due passi che si dimenticano
>
> Due passi della lista vengono dimenticati più degli altri, e hanno una ragione precisa.

**Rewritten:**
> ### I due passi che non danno errore subito
>
> Due passi della lista hanno una cosa in comune: quando mancano, il danno non si vede mentre si crea la commessa, ma dopo, all'esportazione o alla prima sincronizzazione dell'app.

**Why:** nessuna fonte misura quanto spesso i due passi si dimentichino, e la persona non scrive frequenze senza fonte. La proprietà nuova si ricava dalle fonti (cookbook su esportazione e `tipo_intervento`, GOP-418 sulla sincronizzazione) e spiega anche *perché* si dimenticano: nessuno se ne accorge il giorno dell'avvio.

### 7.7 — Sezione 2, perché le persone non sono state fuse

**Original:**
> La ragione è scritta: «`operatori.id_user` risiede dentro ciascun DB tenant: un rimappamento degli id non è eseguibile in una singola transazione e un errore romperebbe silenziosamente lo scoping degli operatori in produzione».

**Rewritten:**
> La ragione è scritta nel documento sull'identità (`docs/02-patterns/25-identita-centralizzata-e-rbac.md`). Il collegamento fra un operatore e il suo utente, la colonna `operatori.id_user`, sta dentro il database di ogni commessa: rinumerare gli utenti voleva dire toccarli tutti insieme, cosa che non si può fare in una sola transazione, e un errore a metà avrebbe rotto senza avvisi, in produzione, il legame fra gli operatori e gli utenti che li seguono.

**Why:** è una sezione [TUTTI]. La citazione portava «tenant» e «scoping» nella prosa, contro la regola vincolante 2 della struttura. La parafrasi tiene il ragionamento e la fonte e usa le parole del glossario (utente, operatore, commessa). «Gli utenti che li seguono» viene dalla definizione di Utente in `CONTEXT.md` («supervisori degli operatori»).

### 7.8 — Sezione 3, il caso PDR

**Original:**
> In molte commesse la voce con etichetta «PDR» puntava a `'name'=>'codice'` invece che a `'name'=>'pdr'`, per un copia-incolla ereditato di cartella in cartella. […] Nessun avviso, nessuna riga nel log: solo zero risultati. La correzione è del 9 luglio 2026, un solo commit su 44 file `flexifields.php`, con 132 righe aggiunte e 88 tolte.

**Rewritten:**
> In 44 cartelle la voce con etichetta «PDR» puntava a `'name'=>'codice'` invece che a `'name'=>'pdr'`: un copia-incolla, ripetuto di cartella in cartella. […] Chi cercava un PDR non riceveva nessun messaggio da segnalare, solo una griglia vuota. La correzione è un solo commit del 9 luglio 2026 sui 44 file `flexifields.php`; […]

**Why:** «molte» dove il dossier dà 44 è intensificare invece di specificare. «132 righe aggiunte e 88 tolte» si riferisce a 45 file, non a 44, e al lettore non serve. «Nessuna riga nel log» non ha fonte. La frase nuova sposta l'attenzione su ciò che l'utente vedeva: una griglia vuota, senza nessun messaggio da riportare in un ticket.

### 7.9 — Sezione 6, procedura dell'ufficio, passo 2

**Original:**
> 2. Chiedi a Gea la configurazione della commessa: campi personalizzati, colonne delle viste, mappature.

**Rewritten:**
> 2. Se Gea è attiva nella commessa, chiedile la configurazione: campi personalizzati, colonne delle viste, mappature.

**Why:** Anti-AI checklist n. 8 e il «never do» della persona («presentare come attiva una funzione che le fonti danno come prevista o limitata ad alcuni tenant»). La sezione 4 dello stesso capitolo spiega che in produzione Gea parte da un interruttore del servizio e che una commessa la può spegnere. Il capitolo non può contraddirsi a due sezioni di distanza.

## 8. Verdict

**REVIEWER_CORRECTIONS:** un capitolo ben costruito e quasi interamente verificabile, che si fermava sotto la soglia per un errore di dominio (committente/operatori), un'istruzione per l'ufficio che dava Gea per sempre attiva, due rimandi sbagliati e alcune frequenze senza fonte. Tutto corretto con 20 paragrafi riscritti, senza toccare la struttura.

**Litmus test.** Dopo le correzioni, il lettore dello staff tecnico finisce pensando «l'ho vissuto»: il ticket chiuso che resta aperto in una commessa, l'esportazione che fallisce in 9 secondi, la ricerca che «funziona» e non trova niente. Il lettore dell'ufficio lo vive nell'apertura e nell'ultima sezione. Le sezioni 2 e 5 restano più «mi è stato detto», ed è inevitabile: sono mappa e procedura, non racconto.
