# Capitolo 5 — Pianificazione e giri — STRUTTURA (Architect)

- **Titolo finale (H1):** `# 5. Pianificazione e giri`
- **Parte:** II — Il lavoro quotidiano
- **Tag del capitolo (PRD § 4):** BACKOFFICE. Tag delle sezioni: [UFFICIO], [STAFF], [DEV], [TUTTI].
- **Domanda centrale (PRD § 4):** come si assegnano gli interventi agli operatori e ai giorni: Interventi › Pianificazione, Area e Lazo, Calendario, Pianificazione operatori, Giornata/Settimana/Mappa del giorno, modalità di pianificazione, fasce e slot, zone, giro giornaliero.
- **Lettore che la sezione deve servire (prova del Reviewer):** un collega nuovo del back office che deve far partire domattina tre operatori su una lista appena importata, senza chiedere a nessuno.
- **Controllo di continuità:** al momento della progettazione `chapter_index.md` e `NARRATIVE_GLOSSARY.md` non esistono ancora. Writer e Reviewer li rileggono al momento della scrittura: se esistono, nessuna affermazione di questo capitolo può contraddire quelle già fissate (in particolare la definizione di lotto, lista e stato di un'utenza del capitolo 3, e quella di importazione del capitolo 4).

---

## 0. CONFINI (che cosa questo capitolo NON spiega)

Per ciascuna voce, una frase sola e il rimando, mai la spiegazione.

| Argomento | Capitolo proprietario | Che cosa resta qui |
|---|---|---|
| Utenza, lista, pratica, lotto, carico (l'importazione); stato dell'utenza derivato dall'ultimo intervento | 3 | Una frase: «pianificare un'utenza crea un intervento e l'utenza passa da importato ad assegnato» |
| Importazione, mappature, scarti | 4 | Solo il fatto che dopo un'importazione alcune utenze possono restare senza coordinate |
| Stati dell'intervento, riaffidare, ripianificare un non fattibile, eliminare il precedente, Verifica interventi | 6 | Una frase e il rimando; qui si cancella e si rifà una pianificazione, non si gestisce un esito |
| Come l'operatore riceve gli interventi sul telefono, l'ordine nell'app | 8 | Una frase: «gli interventi assegnati arrivano all'app dell'operatore (capitolo 8)» |
| Gea e i suoi runbook | 10 | Una frase per sezione di diagnosi: «Gea fa gli stessi controlli con i numeri della lista» |
| Lotti di competenza, quali operatori vede un utente | 11 | Una frase: «la tendina Operatore mostra solo gli operatori visibili al tuo utente» |
| **Admin › Giro e Stato commesse** (il «giro» dei job, GOP-656) | 12 | **Riquadro di disambiguazione obbligatorio**: in Admin «Giro» è il ciclo delle attività automatiche, non il giro di un operatore |
| Tabelle `interventi`, `carichi_righe`, `utenti` | 14 | Solo nomi di colonna dentro un riquadro «Per gli sviluppatori» (per esempio `interventi.ordine`) |
| API di Sara / call center (`/slots/available`, `/appointments/book`) | 15 | Una frase: «gli interventi prenotati possono arrivare dall'assistente vocale (capitolo 15)» |

---

## 1. NUF (Narrative Utility Functions)

Dieci funzioni da un punto ciascuna: il punteggio dell'Editor è la somma, su 10. Soglia: 8,5.

### utility(reader): che cosa il lettore sa fare

- **NUF-R1.** utility(reader): Reader can scegliere la voce giusta del menu Interventi per il lavoro che deve fare: assegnare utenze libere (**Pianificazione**), fissare un intervento a un'ora per un'utenza (**Calendario**), spostare il lavoro della settimana tra operatori e fasce (**Pianificazione operatori**), dare un operatore a un intervento prenotato (**Da assegnare**), controllare senza modificare (**Giornata**, **Settimana**, **Mappa del giorno**). Prova: la tabella della sezione 1 lo dice in una riga per voce, con la colonna «crea / sposta / solo lettura» → score += 1
- **NUF-R2.** utility(reader): Reader can assegnare un gruppo di utenze a un operatore per una data da Interventi › Pianificazione, scegliendo tra **Seleziona**, **Area** e **Lazo** quello adatto (Lazo prende le N utenze più vicine al punto cliccato, N nel campo «N. int.»; Area inverte la selezione delle utenze nel rettangolo) e leggere il riepilogo dopo **Assegna** (pianificati, già pianificati, saltati) → score += 1
- **NUF-R3.** utility(reader): Reader can leggere il carico di un operatore in **Giornata** e **Settimana** sapendo con quale metro è calcolato («Carico della giornata» in tempo oppure «Carico (conteggio)» contro un tetto) e sapendo da dove viene l'ordine di visita del giro (ordine salvato, altrimenti ora e indirizzo), e trovare il giorno libero di un operatore → score += 1
- **NUF-R4.** utility(reader): Reader can diagnosticare e risolvere da solo i tre «non torna» più frequenti: utenze che non compaiono sulla mappa (coordinate mancanti → Clienti › Geocodifica, «Riprova le non trovate», oppure assegnazione da Clienti); lista assente dalla tendina **Lista** (quattro condizioni e copia salvata valida un'ora); pianificazione sbagliata da rifare (non esiste «spianifica»: si cancellano gli interventi e si riassegna) → score += 1

### utility(emotional): che cosa il lettore sente

- **NUF-E1.** utility(emotional): Reader feels sicuro che una lista scomparsa dalla tendina o una mappa con meno punti del previsto non significa dati persi, e sa misurare la differenza (utenze libere contro utenze in mappa) invece di reimportare o chiedere a voce → score += 1
- **NUF-E2.** utility(emotional): Reader knows where to stop: che cosa fa da solo (geocodifica, cancellare e riassegnare, aspettare la scadenza della copia della tendina, impostare l'orario di lavoro se è amministratore) e che cosa chiede allo staff tecnico (fasce e slot per lotto, squadre e zone delle commesse che le usano, una lista ancora assente dopo un'ora con le condizioni vere, il servizio di localizzazione che non rispondeva durante l'importazione) → score += 1

### utility(factual): affermazioni esatte con fonte

- **NUF-F1.** utility(factual): Il campo «N. int.» della Pianificazione vale 10 di partenza; per Lazo accetta da 1 a 1000 (da verificare nel codice); la mappa mostra solo utenze con `precisione` maggiore di 0 (1 = trovata, 0 = da localizzare, -1 = indirizzo non trovato). Fonte: `Smarty_templates/it/interventi.html`, `js/code/core_functions.js`, `js/code/interventi_piano.js`, `json.php` (`mappautenze`), `wiki/assistenza-clienti/selezione-mappa-pianificazione.md` → score += 1
- **NUF-F2.** utility(factual): La tendina **Lista** della Pianificazione mostra una lista solo se è aperta, ha un cliente, è in un lotto dell'utente e ha almeno un'utenza senza intervento; legge una copia salvata valida 3600 secondi. Fonte: `lib/VistaTendinaListe.php` (`DURATA_CACHE`), `docs/03-cookbooks/28-tendina-liste-perche-una-lista-non-compare.md`, `wiki/assistenza-clienti/runbook-lista-assente-tendina-piano.md` → score += 1
- **NUF-F3.** utility(factual): Il carico della giornata stima il viaggio in linea d'aria a 20 km/h con coefficiente 1,3 per la strada; senza orario di lavoro o tempo sul posto conta gli interventi contro un tetto (massimo appuntamenti al giorno del calendario, altrimenti 12); legenda Settimana: «Sotto l'80%», «80–100%», «Oltre il limite», «Libero». Fonte: `lib/PianificazioneGiorno.php` (`CAPIENZA_PREDEFINITA`, `TORTUOSITA`), `docs/02-patterns/52-pianificazione-giornata-settimana-mappa.md`, `wiki/assistenza-clienti/pagina-controllo-giornata.md`, Jira GOP-778/779/780 → score += 1
- **NUF-F4.** utility(factual): Nelle commesse con il calendario a fasce, i posti di una fascia sono la parte intera di durata della fascia / durata dello slot, un intervento per slot; al cliente si promette la fascia, lo slot resta interno; la squadra è un segnaposto settimanale e l'operatore effettivo si lega per giorno e fascia. Il capitolo dice esplicitamente su quali commesse è attivo. Fonte: `lib/CalendarSlotsConfig.php`, `lib/SquadraOutbound.php` (`posti()`), `docs/02-patterns/40-smat-squadra-segnaposto-fascia-promessa.md`, `wiki/pianificazione/modello-pianificazione-appuntamenti.md`, Jira GOP-610/611/612 → score += 1

---

## 2. BEAT LIST (sei sezioni `##`)

Totale previsto: circa 5.300 parole di corpo + «In questo capitolo» + «Fonti». Ogni sezione tra 800 e 1.000 parole (tetto rigido 1.000: sei sezioni da 1.200 sforerebbero le 6.000 parole del PRD). Ogni sezione ha almeno: un'etichetta o un percorso esatto, un numero con fonte, un paragrafo «Limite». Al massimo 5 paragrafi di prosa di fila senza tabella, procedura o riquadro.

### Sezione 1 — «Quale pagina per quale lavoro: il menu Interventi»

- **Domanda centrale:** il menu Interventi ha otto voci che parlano di pianificazione: quale crea interventi, quale li sposta, quale si limita a mostrarli?
- **Tag:** [UFFICIO]
- **Parole:** 800–950
- **Funzioni di paragrafo:** Aggancio (il caso reale della commessa con 7.589 utenze da pianificare e 5.376 in mappa: la mappa non è la lista) → Spiegazione (pianificare = creare un intervento per un'utenza, con operatore e data; il giro = gli interventi di un operatore in un giorno nell'ordine di visita; definizioni dal glossario) → Dimostrazione (tabella) → Limite (menu che cambia per commessa e permessi) → riquadro di disambiguazione «Giro» in Admin.
- **Contenuto richiesto:**
  - Tabella con colonne: Voce | A che cosa serve | Crea interventi | Sposta interventi | Solo lettura. Righe: Pianificazione, Calendario, Pianificazione operatori, Giornata, Settimana, Mappa del giorno, Da assegnare (e Mappa, solo per il pulsante «Elimina», con rimando alla sezione 6).
  - Le modalità che esistono solo in alcune commesse, ciascuna con la sua condizione: «Pianificazione giri» al posto di «Pianificazione» (commesse di tipo security), la pianificazione per zone (una sola commessa), «Pianificazione allacci» e «Pianificazione letture» (una sola commessa). La pianificazione per via esiste nel codice ma nessuna voce di menu la apre: non va presentata come disponibile.
  - Riquadro `> **Attenzione:**` sulla parola «giro»: in **Admin › Giro e Stato commesse** «Giro» indica il ciclo delle attività automatiche del sistema (capitolo 12), non il giro di un operatore.
- **Fatti che il Researcher deve trovare:**
  1. Ordine esatto e etichette italiane delle voci (`lib/MenuInterventi.php`, `lib/dict/lang_it.php`): traduzione italiana di `Planning`, `Planning Zones`, `Calendar`, `Map`, `List`.
  2. Le condizioni per commessa: `dbtype == 'security'`, `db == 'smat'`, `db == 'easyacea'`, `$custom['centralino']` (Centralino: una riga, rimando al capitolo 15). Il Writer non riporta `dbtype` e `db` nel testo per l'ufficio: dice «alcune commesse» e, al massimo, il nome visibile della commessa.
  3. Voci condizionate da permessi: `Rbac::gate('canViewCarichi')`, `Rbac::gate('canViewLotti')`.
  4. Che `piano_intervento_vie` non ha voce di menu (grep `piano_intervento_vie` in `pages/`, `lib/`, `custom/*/`).
  5. Il caso dei numeri: `wiki/assistenza-clienti/runbook-utenze-da-pianificare.md` § Fonti (9.530 utenze, 7.589 senza intervento, 5.376 in mappa, 2.213 no; 10 novembre 2026). Il Writer lo cita senza nome della commessa.
  6. Che cosa fa il «Giro» di Admin, in una frase (`lib/GiroJob.php` docblock, GOP-656), solo per la disambiguazione.

### Sezione 2 — «Assegnare le utenze dalla mappa: Interventi › Pianificazione»

- **Domanda centrale:** come si passa da una lista di utenze libere a interventi assegnati a un operatore per un giorno, e che cosa fanno davvero Area, Lazo e Pianifica?
- **Tag:** [UFFICIO]
- **Parole:** 900–1.000
- **Funzioni di paragrafo:** Spiegazione (struttura della pagina: filtri, strumenti, riga di assegnazione, mappa) → Procedura numerata (assegnare un gruppo di utenze) → Dimostrazione (Lazo: N utenze più vicine, nessun cerchio) → contro-obiezione n. 1 → Limite → Sintesi.
- **Contenuto richiesto:**
  - Procedura numerata, una azione per passo: filtri **Cliente**, **Distretto**, **Tipo**, **Lista** → **Mostra clienti** → selezione → **Operatore**, **Data** (gg/mm/aaaa), **Durata**, eventuali **Fascia** e **Tipo intervento** → facoltativo **Calcola distanza** → **Assegna** → lettura del riepilogo.
  - Sottosezione `###` sugli strumenti di selezione: **Seleziona** (una alla volta), **Area** (rettangolo; un secondo rettangolo sulle stesse utenze le deseleziona; scorciatoia Maiusc + trascinamento), **Lazo** (non disegna nulla: un clic seleziona le N utenze più vicine; due clic sullo stesso punto contano due volte le stesse utenze; **Riavvia** per ripartire).
  - **Pianifica** raggruppa per vicinanza in gruppi da «N. int.» utenze: non calcola un ordine di visita. GOPlanner, nel flusso standard, non ha un calcolo del percorso più breve su strada.
  - Il messaggio esatto «Attenzione! Devi inserire la data!».
  - Le utenze assegnate spariscono dalla mappa; un'utenza già assegnata viene saltata, non riassegnata (per cambiare operatore: capitolo 6, *Riaffidare*).
  - Contro-obiezione n. 1, nella forma del dubbio reale: «Ma Lazo non dovrebbe prendere le utenze dentro un cerchio?» → risposta dalla fonte.
  - Limite: solo utenze con coordinate valide (rimando alla sezione 6); con una commessa molto grande caricare tutto rallenta il browser, quindi prima lista e zoom, poi **Mostra clienti** (nessuna soglia numerica: non è stata misurata, il Writer non ne inventa una).
- **Fatti che il Researcher deve trovare:**
  1. Etichette esatte dei pulsanti e dei campi in `Smarty_templates/it/interventi.html` (vista `piano_intervento`): «Mostra clienti», «Seleziona», «Area», «Lazo», «Pianifica», «Colonne», «Centra», «Riavvia», «N. int.» (valore 10), «Durata», «Fascia» (opzioni «Fascia 1»…«Fascia 4»: per quali commesse compaiono), «Tipo intervento», «Calcola distanza», «Assegna»; suggerimenti «Selezione circolare», «Selezione rettangolare».
  2. Il pulsante «Zone outbound» («Zone della settimana per le chiamate in uscita") nella stessa vista: in quali commesse compare (serve alla sezione 4).
  3. Il campo di Lazo: limiti 1–1000 e default 10 in `js/code/core_functions.js` (`selezioneCircolare`, `onCircularSelectClick`) e `lib/JSONController.php` (`nearest`).
  4. **[CONFLITTO DA RISOLVERE]** il raggruppamento: `wiki/assistenza-clienti/pagina-pianificazione.md` lo attribuisce al pulsante «Pianifica», `wiki/assistenza-clienti/pianificazione-percorsi.md` a una funzione «Percorsi» con campo «N. interventi». Leggere il template e `json.php` (`set_clusters`): quale etichetta compare oggi a schermo. Verificare anche se il pulsante «Calcola percorso più breve» è ancora visibile; se non lo è, il Writer non lo nomina.
  5. Il testo esatto del riepilogo dopo **Assegna** (interventi pianificati, annullati, già pianificati, saltati perché già assegnate): azione chiamata da `confInterventi` in `js/code/core_functions.js` e suo gestore in `json.php` o `lib/JSONController.php`.
  6. Che cosa calcola **Calcola distanza** (km totali e durata) e con quale servizio (`calcolaDistanza`): se usa un servizio esterno, nominare solo il tipo di servizio, mai l'host.
  7. Che la mappa è Leaflet con tasselli OpenStreetMap e che senza internet non si vede (`docs/MAPS_ARCHITECTURE.md`).

### Sezione 3 — «Interventi con un orario: Calendario, Pianificazione operatori e Da assegnare»

- **Domanda centrale:** quando l'intervento ha un'ora concordata con l'utenza, quale pagina la fissa, quale la sposta e quale assegna quelli arrivati senza operatore?
- **Tag:** [UFFICIO]
- **Parole:** 900–1.000
- **Funzioni di paragrafo:** Spiegazione (nelle tre pagine l'interfaccia chiama «appuntamento» l'intervento con un orario fissato: il Writer lo dice una volta) → Procedura (fissare un intervento dal Calendario) → Procedura (trascinare in Pianificazione operatori) → Procedura (Da assegnare) → Dimostrazione (avviso di viaggio con i suoi numeri) → Limite.
- **Contenuto richiesto:**
  - Tabella di confronto delle tre pagine: Pagina | Unità di tempo | Che cosa si vede | Come si assegna. Calendario: un operatore, viste Giorno/Settimana/Mese, righe da 30 minuti, blocco di un'ora. Pianificazione operatori: tutti gli operatori visibili, settimana, colonne «Mattina» e «Pomeriggio». Da assegnare: elenco degli interventi in stato prenotato, nessun filtro.
  - Procedura Calendario: **Cerca cliente (Matricola/Codice)** (dal terzo carattere, al massimo 20 risultati) → **Operatore** (non «APPUNTAMENTI da assegnare») → clic sull'orario → finestra **Conferma pianificazione** → **Pianifica**. Messaggi «Seleziona prima un'utenza dalla ricerca.» e «Seleziona un operatore.». Clic su un blocco grigio con un operatore scelto: assegnazione immediata, senza conferma.
  - Avviso di viaggio: guarda l'ultimo intervento dello stesso operatore nelle due ore precedenti, stima 30 minuti di lavoro più il viaggio; testo «Attenzione: l'operatore potrebbe non arrivare in tempo (Arrivo stimato: HH:MM)»; non blocca.
  - Pianificazione operatori: trascinare dalla riga «Da assegnare»; regole dell'ora (stesso giorno e fascia, cambio solo di operatore: ora invariata; cambio di giorno o fascia: ora = inizio della fascia, salvo che l'ora cada già nella nuova fascia); non si trascina verso «Da assegnare»; gli interventi chiusi non si spostano; errore «Assegnazione non salvata: (motivo)» con gli esempi «Fascia non prevista dalla configurazione del calendario» e «Operatore non valido».
  - Da assegnare: titolo «Appuntamenti in attesa di assegnazione», colonne, un operatore alla volta, la data non cambia, messaggi «Seleziona un tecnico» e «Intervento non trovato o non prenotato» (il Writer cita le etichette «tecnico» tra virgolette basse come sono a schermo; nella prosa scrive «operatore»).
  - «[VERIFICARE UTENZA]»: intervento preso dall'assistente vocale riconoscendo l'utenza dal nominativo; va controllata l'utenza prima di assegnarlo (rimando al capitolo 15 per l'assistente vocale).
  - Contro-obiezione n. 2: «Ho spostato l'intervento in Pianificazione operatori: perché l'ora è cambiata?» → regola dell'inizio fascia.
  - Limite: la durata non si modifica da Pianificazione operatori; le fasce di Pianificazione operatori vengono da **Impostazioni › Calendario**, mentre la griglia del Calendario è sempre a righe da 30 minuti; la tendina Operatore mostra solo gli operatori visibili al proprio utente (capitolo 11).
- **Fatti che il Researcher deve trovare:**
  1. `js/code/calendario_interventi.js`, `lib/CalendarioController.php`, `calendario_json.php`: le due ore, i 30 minuti, il testo dell'avviso, la ricerca dal terzo carattere e il tetto di 20 risultati, il blocco di un'ora.
  2. `js/code/calendario_risorse.js`: regole dell'ora al trascinamento; testi d'errore; il suggerimento «Trascina un appuntamento su un operatore e una fascia per assegnarlo.»; filtro **UT** e quando ha valori.
  3. `lib/JSONController.php` (`assegna_prenotato`) e la vista `prenotati` del template: colonne e messaggi della pagina Da assegnare.
  4. **[DA CHIARIRE]** da dove nascono gli interventi in stato prenotato (la wiki dice «non risulta»; `lib/CallCenterController.php` e il modello a fasce indicano le prenotazioni dell'assistente vocale). Codice numerico dello stato «Prenotato» in `lib/InterventoBase.php`.
  5. **[DA CHIARIRE]** se **Pianifica** nel Calendario aggiorna anche lo stato dell'utenza (la wiki lo dà come non verificato; il clic sul blocco grigio sì).
  6. Stato in cui va un intervento fissato o spostato (Assegnato) e collegamento al carico più recente dell'utenza.
  7. Jira GOP-459 (Pianificazione operatori): titolo e data di rilascio.

### Sezione 4 — «Fasce, slot, squadre e zone: il calendario della commessa»

- **Domanda centrale:** che cosa si promette all'utenza (una fascia, non un'ora), come si contano i posti di un giorno, e perché in alcune commesse l'operatore vero si sceglie solo il giorno prima?
- **Tag:** [UFFICIO] per le regole; riquadro `> **Per lo staff tecnico:**` [STAFF] per configurazione per lotto e migrazioni.
- **Parole:** 850–1.000
- **Funzioni di paragrafo:** Aggancio (il problema reale: le settimane si prenotano con almeno una settimana di anticipo, ma l'operatore vero spesso non si sa una settimana prima) → Spiegazione (fascia, slot, squadra, operatore effettivo, zona) → Dimostrazione (un conto con numeri dichiarati come esempio: due fasce 9–13 e 14–18 con slot di 60 minuti = 8 posti, dichiarando che sono valori di partenza di una commessa ancora da confermare) → contro-obiezione → Limite (attivo solo dove la commessa ha il calendario a fasce e le zone outbound) → Sintesi.
- **Contenuto richiesto:**
  - Prima la configurazione che vale per tutte le commesse: **Impostazioni › Calendario** (giorni attivi, mattina e pomeriggio, durata dello slot proposta, tempo sul posto, massimo appuntamenti al giorno) e **Impostazioni › Generale** («Orario inizio», «Orario fine»), con chi può modificarle.
  - Poi il modello a fasce, dichiarato come attivo solo in alcune commesse: fascia = finestra oraria per giorno e lotto, è ciò che si promette; slot = tempo di intervento più spostamento, interno, un intervento per slot; posti = parte intera di (durata fascia / durata slot), i minuti che avanzano restano liberi; squadra = segnaposto settimanale di un lotto, non un operatore; operatore effettivo legato per giorno e fascia, facoltativo fino al giorno prima; legarlo porta i prenotati della fascia ad Assegnato, toglierlo li riporta a Prenotato, gli eseguiti non si toccano; lo stesso operatore non sta in due squadre nella stessa fascia dello stesso giorno.
  - Squadra soppressa: i suoi interventi non si cancellano, vanno nell'elenco «Da ricollocare».
  - Zona: gruppo di pratiche della settimana per una squadra; avviso «zona troppo estesa per lo slot» quando il tempo stradale tra le due utenze più lontane supera lo spostamento massimo; è un avviso, non blocca mai la conferma.
  - Contro-obiezione n. 3: «Perché non si comunica all'utenza l'ora esatta?» → l'ordine dentro la fascia lo decide il calcolo del giro; lo slot serve a contare i posti.
  - Limite e confine: cosa del modello è nel codice e cosa no (niente costo di ritardo né priorità 9-1; la mail di avviso per squadre senza operatore esiste nel codice ma non è attiva); i valori di slot e spostamento massimo sono ancora da confermare con la commessa; le prenotazioni dell'assistente vocale sono nel capitolo 15.
- **Fatti che il Researcher deve trovare:**
  1. `lib/CalendarSlotsConfig.php`: chiavi `modalita` («fasce»), `fasce`, `slot_duration`, `spostamento_massimo`, `preavviso_minimo_giorni` (default 0), `max_app_giorno`, configurazione per lotto `calendar_slots_config_lotto_N` con la generale come riserva; capienza per slot fissa a 1 nei lotti a fasce.
  2. `pages/impostazioni.php` e il suo template: etichette esatte della scheda Calendario e della scheda Generale («Orario inizio», «Orario fine»), e il permesso che serve per aprirle.
  3. `lib/SquadraOutbound.php` (`posti()`), `lib/ZonaOutbound.php`, `lib/ZoneOutboundController.php`: formula dei posti, regola dell'operatore unico per fascia, «Da ricollocare», tabelle `zone_outbound_squadre`, `zone_outbound_squadre_giornate`, `zone_outbound_squadre_fasce`, `zone_outbound_squadre_operatori`, `zone_outbound_prenotazioni` (solo per il riquadro staff).
  4. `lib/ClusterStradale.php`: testo esatto dell'avviso di zona estesa e velocità di ripiego 30 km/h; `lib/GiroZona.php`: velocità di ripiego 20 km/h e regola del tempo aggiuntivo per ordinare le fasce. Registrare in [CONFLICT] le due velocità.
  5. `lib/AvvisoSquadreScoperte.php` e `cron_worker.php`: perché la mail non parte (destinatari vuoti, worker fermo su php8), senza riportare indirizzi.
  6. `docs/02-patterns/40-smat-squadra-segnaposto-fascia-promessa.md` e `custom/sg_smat/README.md`: su quali commesse è attivo, valori di partenza (slot 60 minuti, spostamento massimo 20 minuti, preavviso 7 giorni) e il fatto che sono da confermare (`custom/sg_smat/DUBBI.md`). Nessun nome di persona e nessun dettaglio contrattuale nel dossier.
  7. La griglia delle squadre dentro Pianificazione operatori: pulsanti «Griglia squadre», «Fine», «Sopprimi», «Cerca operatore», riga «n appuntamenti su N posti» (`js/code/calendario_squadre.js`).
  8. Jira GOP-610, GOP-611, GOP-612, GOP-613, GOP-615, GOP-684, GOP-685: titolo breve e stato di ciascuno.

### Sezione 5 — «Il giro del giorno: Giornata, Settimana e Mappa del giorno»

- **Domanda centrale:** come si controlla che la pianificazione regga (chi ha troppo, chi è libero, in che ordine visita) senza cambiare nulla?
- **Tag:** [UFFICIO]; un riquadro `> **Per gli sviluppatori:**` [DEV] di 2-3 righe su `interventi.ordine` e `PianificazioneGiorno`.
- **Parole:** 900–1.000
- **Funzioni di paragrafo:** Spiegazione (tre pagine di sola lettura che condividono giorno, operatore e lotto nell'indirizzo) → Dimostrazione (come si calcola il carico, con i numeri) → Procedura («trovare il giorno libero di un operatore» oppure «vedere il giro di domani di un operatore») → contro-obiezione → Limite → Sintesi.
- **Contenuto richiesto:**
  - Giornata: barra (**Precedente**, **Oggi**, **Successivo**, **Vai al**, **Lotto**, **Operatore** con «Tutti» e «Da assegnare»); i sette riquadri della settimana; le schede degli operatori (chiusi su pianificati, zona = comune più frequente, «ordine pianificato», carico, avvisi «Oltre l'orario di lavoro di circa N min» e «N interventi oltre il tetto di N»); la griglia con colonne **Operatore**, **Ord.**, **Ora**, **Utenza**, **Indirizzo**, **Comune**, **Matricola**, **Stato**; 50 righe per pagina di default.
  - Settimana: tabella «Carico della settimana», legenda «Sotto l'80%», «80–100%», «Oltre il limite», «Libero»; dettaglio della cella con minuti di strada e «partenza da casa» / «partenza dalla sede»; pulsanti **Vedi sulla mappa** e **Apri la giornata**.
  - Mappa del giorno: pannello «Operatori del giorno», **Mostra** («Tutte le tappe» / «Solo da fare»), legenda, partenza dal domicilio dell'operatore se ha coordinate, altrimenti dalla sede del lotto, altrimenti dalla prima tappa; i tre messaggi sopra la mappa.
  - Il carico, come tabella a due righe: «Carico della giornata» (in tempo: minuti sul posto + viaggio, diviso per i minuti di lavoro) e «Carico (conteggio)» (interventi contro il tetto). Perché la spiegazione dice sempre quale metro usa.
  - L'ordine di visita: quello salvato se tutti gli interventi del giorno ce l'hanno, altrimenti ora e poi indirizzo; mai misto, perché un giro ordinato a metà sarebbe peggio di nessun ordine (regola del docblock di `PianificazioneGiorno`).
  - Contro-obiezione n. 4: «La Settimana dice 100% ma l'operatore finisce a metà pomeriggio» → il viaggio è stimato in linea d'aria, non su strada; o il carico è a conteggio.
  - Limite: sola lettura; mancano gli annullati e gli interventi senza data; una tappa senza coordinate non è sulla mappa e sottostima il viaggio; interventi senza operatore non hanno giro; la settimana va da lunedì a domenica; il filtro **Lotto** usa il lotto dell'ultimo carico dell'utenza.
- **Fatti che il Researcher deve trovare:**
  1. `lib/PianificazioneGiorno.php`: `CAPIENZA_PREDEFINITA = 12`, `TORTUOSITA = 1.3`, velocità di stima del viaggio (20 km/h: verificare la costante usata), `STATI_ESEGUITI = [4, 6, 7]`, `STATO_NON_FATTIBILE = 5`, `STATO_ANNULLATO = 9` e il significato di ciascun codice in `lib/InterventoBase.php`.
  2. Soglie dei colori della Settimana (80% e 100%) in `js/code/pianificazione_settimana.js` o `js/code/pianificazione_comune.js`.
  3. Fonte del tetto alternativo: `$custom['pianificazione_capienza_giorno']` (il Writer dice «un valore della commessa, se configurato»).
  4. Chi scrive `interventi.ordine`: `lib/GiroPrenotati.php` (ordina per giornata-operatore-fascia e lascia la scrittura alla conferma), `lib/ZonaOutbound.php`, `lib/OsrmRouting.php`. Domanda precisa: nelle commesse senza zone outbound, `ordine` è mai valorizzato? Se no, il Writer dice che lì l'ordine è sempre «per ora e indirizzo».
  5. Testi esatti dei messaggi della Mappa del giorno e del filtro data («Data non valida: usa gg/mm/aaaa») nei template `Smarty_templates/it/interventi_giornata.html`, `interventi_settimana.html`, `interventi_mappa_giorno.html`.
  6. `docs/02-patterns/52-pianificazione-giornata-settimana-mappa.md` e Jira GOP-778, GOP-779, GOP-780: data e perimetro.

### Sezione 6 — «Quando la pianificazione non torna»

- **Domanda centrale:** la lista non compare, le utenze non sono sulla mappa, la pianificazione è sbagliata: quale controllo fare prima, quale rimedio è sicuro, quando chiamare lo staff tecnico?
- **Tag:** [UFFICIO]; riquadro `> **Quando chiedere allo staff tecnico:**` [STAFF].
- **Parole:** 900–1.000
- **Funzioni di paragrafo:** Aggancio (caso reale: utenze con coordinate a zero dopo un'importazione durante la quale il servizio di localizzazione non rispondeva) → Dimostrazione (tabella sintomo → causa → dove si controlla → rimedio) → Procedura (rifare una pianificazione: cancellare, verificare che la lista ricompaia, riassegnare) → Limite (cancellare è definitivo per l'intervento, non per l'utenza) → riquadro staff → Sintesi (la regola di chiusura del capitolo).
- **Contenuto richiesto:**
  - Tabella con almeno cinque righe:
    1. Utenze che non compaiono sulla mappa → coordinate mancanti (`precisione` 0 o -1, latitudine e longitudine a zero) → Clienti, filtro **Stato** «importato» → **Geocodifica**, «Riprova le non trovate», oppure assegnazione da Clienti, che funziona anche senza coordinate.
    2. Lista assente dalla tendina **Lista** → una delle quattro condizioni manca, oppure la copia salvata della tendina è più vecchia di un'ora → controllare le condizioni → aspettare la scadenza o, se la lista ha 0 utenze libere, è nascosta correttamente.
    3. «Assegna» non fa nulla → data mancante («Attenzione! Devi inserire la data!»), utenze già assegnate (saltate), lista chiusa, operatore non valido per il lotto.
    4. Pianificazione da rifare → non esiste un comando «spianifica»: si cancellano gli interventi (uno alla volta dall'elenco Interventi, o tutti quelli dell'operatore) e si riassegna.
    5. Interventi di un operatore spariti tutti insieme → il pulsante **Elimina** di Interventi › Mappa cancella tutti gli interventi pianificati dell'operatore scelto, di qualsiasi giorno («Tutti gli interventi pianificati sono stati cancellati!»).
  - Procedura numerata «rifare una pianificazione» (dal cookbook 29).
  - Una frase su Gea: fa gli stessi controlli e risponde con i numeri della lista (capitolo 10).
  - Riquadro staff: lista ancora assente dopo la scadenza della copia con le condizioni vere; utenze con `precisione` -1 in massa dopo un'importazione; fasce o squadre da configurare. Che cosa portare nella segnalazione: numero della lista, ora, utente, testo dell'errore.
  - Ultimo paragrafo (Sintesi = chiusura del capitolo): la regola, vedi § 5 TARGET.
- **Fatti che il Researcher deve trovare:**
  1. `lib/UtenzaBase.php` (`geocodifica`, significato di `precisione`), azione `reset_geocode` (pulsante «Riprova le non trovate»), `docs/02-patterns/48-precisione-utenti-geocodifica-anomalie.md`.
  2. `lib/VistaTendinaListe.php`: le quattro condizioni e `DURATA_CACHE = 3600`.
  3. `json.php` (`del_interventi`), `js/code/core_functions.js` (`eliminaInterventi`): che **Elimina** non filtra per data e non cancella gli interventi chiusi; testo esatto dei due messaggi finali. `lib/JSONController.php` (`elimina_intervento`): la cancellazione singola e il ritorno dell'utenza tra le libere.
  4. Che un intervento preso dal call center non si cancella ma viene annullato e resta nello storico (`docs/03-cookbooks/29-pianificazione-confermare-cancellare-ripianificare.md`; confermare nel codice).
  5. Che le eliminazioni dall'elenco interventi restano tra le attività dell'utente (glossario: «attività»), senza l'id della lista: serve a spiegare perché Gea guarda l'intero giorno (`chatbot-service/src/web-activity.ts`, solo per il fatto, nessun nome di funzione nel testo per l'ufficio).
  6. Le due storie reali, senza dati personali né nomi di lista reali: 28 ottobre 2026, servizio di localizzazione non raggiungibile durante l'importazione → latitudine e longitudine a 0 e `precisione` -1 (`wiki/assistenza-clienti/runbook-assegna-utenze.md` § Fonti); 15 ottobre 2026, lista sparita dalla tendina dopo eliminazioni e ripianificazione (`wiki/assistenza-clienti/runbook-lista-assente-tendina-piano.md` § Fonti). Il Writer usa nomi di lista inventati e dichiarati come tali.

---

## 3. REVIEWER READINESS NOTES

### Punti di tensione (dove il capitolo crea una posta in gioco reale)

1. **La mappa non è la lista** (sezioni 1, 2, 6). In una commessa reale, il 10 novembre 2026, su 7.589 utenze ancora da pianificare solo 5.376 erano sulla mappa: 2.213 utenze, quasi tre su dieci, non si vedevano. Posta in gioco: una lista sembra pianificata e invece un terzo delle utenze non ha intervento, e la scadenza della lista passa. Il capitolo deve far misurare la differenza, non farla temere.
2. **La lista che sparisce** (sezione 6). Si assegnano tutte le utenze, la lista esce dalla tendina (corretto: non ha più utenze libere); si cancellano gli interventi per rifare, e la lista per un'ora ancora non torna. Posta in gioco: chi non conosce la copia salvata pensa a dati persi e chiede a voce o rifà il lavoro. La risposta è una regola con un numero (3600 secondi).
3. **La promessa all'utenza** (sezione 4). Le settimane si prenotano almeno una settimana prima, ma l'operatore vero spesso si conosce solo il giorno prima. Posta in gioco: promettere un'ora precisa con un operatore preciso obbliga a rifare le promesse a ogni cambio di turno. È la ragione di fasce, slot e squadre, e il capitolo la deve dire prima delle definizioni.
4. **Un pulsante che cancella tutto** (sezione 6). **Elimina** in Interventi › Mappa cancella tutti gli interventi pianificati dell'operatore, di qualsiasi giorno, e non si annulla.

### Catene da rendere esplicite (causa → conseguenza → azione del lettore)

- Indirizzo non localizzato o servizio di localizzazione fermo all'importazione → `precisione` 0 o -1 → utenza assente dalla mappa di Pianificazione → non assegnabile da lì → Clienti › Geocodifica, «Riprova le non trovate», oppure assegnazione da Clienti.
- Tutte le utenze di una lista assegnate → 0 utenze libere → la lista esce dalla tendina **Lista** (comportamento corretto) → per rifare si cancellano gli interventi → la lista ricompare entro un'ora (scadenza della copia salvata) → si riassegna.
- Orario di lavoro non impostato in Impostazioni › Generale → il carico passa «a conteggio» contro un tetto (12 se nessuno è configurato) → la percentuale misura un'altra cosa → l'amministratore imposta «Orario inizio» e «Orario fine» e il tempo sul posto.
- Spostamento in Pianificazione operatori su un altro giorno o fascia → l'ora diventa l'inizio della nuova fascia → l'utenza aspetta a un'ora diversa da quella concordata → il lettore controlla l'ora dopo ogni trascinamento.
- (Commesse a fasce) Fascia promessa → posti contati in slot → la squadra riserva i posti → l'operatore effettivo si lega il giorno prima → i prenotati della fascia diventano Assegnato; togliendo il legame tornano Prenotato.
- **Pianifica** raggruppa e non ordina → l'ordine di visita resta «per ora e indirizzo» se non c'è un ordine salvato → chi pianifica controlla il giro in Mappa del giorno.

### Guardie di proporzione del rischio (ogni rischio con il suo contesto)

- **Elimina (Mappa):** cancella solo gli interventi pianificati non chiusi; quelli con un esito restano; le utenze restano nella lista e tornano libere; si ripianificano. Il Writer lo scrive nello stesso paragrafo dell'avvertimento, non in un altro.
- **Cancellare per ripianificare:** «nessun dato perso» vale quando gli interventi sono solo stati cancellati e le utenze restano; non vale per un intervento con esito (che non si cancella comunque).
- **Avviso di viaggio** e **«zona troppo estesa per lo slot»:** sono avvisi, non bloccano. Non presentarli come errori.
- **Carico oltre il limite:** è una stima in linea d'aria; non è una misura su strada né un divieto di assegnare.
- **Utenze senza coordinate:** non sono perse e si assegnano da Clienti anche senza coordinate.
- **Browser lento con commesse grandi:** succede, ma la soglia non è stata misurata; nessun numero inventato; il rimedio (filtrare per lista e zoomare) è sufficiente.
- **Funzioni residue o non attive** («Calcola percorso più breve» se ancora visibile, pianificazione per via, mail di avviso delle squadre senza operatore): dirlo in una frase neutra, senza tono di denuncia, e dire che cosa usare al suo posto.
- **Modello a fasce e zone:** attivo solo nelle commesse che lo usano; valori di partenza ancora da confermare. Il Writer non lo presenta come generale (Anti-AI checklist n. 8) e non riporta valori della commessa come regole del prodotto.

### Guardie di vocabolario (glossario `CONTEXT.md`)

- **«appuntamento»** è tra le parole da evitare per «intervento», ma è l'etichetta delle pagine Calendario, Pianificazione operatori e Da assegnare. Regola: nella prosa «intervento» (o «intervento con un orario fissato»); «appuntamento» solo dentro un'etichetta tra «…», dopo averlo spiegato una volta nella sezione 3.
- **«tecnico»** è da evitare per «operatore», ma compare in Da assegnare («Assegna tecnico», «Seleziona un tecnico»): solo tra «…».
- **«cliente» / «Clienti»:** il menu si chiama «Clienti» e i pulsanti «Mostra clienti», «Cerca cliente (Matricola/Codice)»; nella prosa si dice «utenza». La prima volta: «il menu Clienti, dove stanno le utenze».
- **«carico»** ha due sensi nel capitolo: la lista importata (glossario: dire «lista», capitolo 3) e il «Carico della giornata», cioè quanto è piena la giornata di un operatore (etichetta dell'interfaccia). Il Writer usa «carico» solo nel secondo senso e lo definisce alla prima occorrenza.
- **«percorso»** è da evitare per «giro»: ammesso solo nelle etichette («Calcola percorso più breve», «Percorsi») se la ricerca conferma che sono a schermo.
- **«zona»:** nel capitolo è la zona del modello a fasce (gruppo di pratiche della settimana per una squadra), diversa dal **distretto** del glossario e dalla «zona» delle schede di Giornata (il comune più frequente). Definirla alla prima occorrenza nella sezione 4.
- **«tenant», `dbtype`, `db`:** mai nel testo per l'ufficio; solo nel riquadro staff o sviluppatori.

### Guardie di sicurezza (bloccanti per l'Editor)

- Le fonti del modello a fasce contengono il nome di una persona del committente, il nome di un'azienda committente con dettagli di progetto e l'host di un server di calcolo dei percorsi: niente di questo nel dossier né nel testo.
- I runbook citano il nome reale di una lista che contiene un nome di comune: sostituirlo con un nome inventato e dichiarato.
- Nomi di commessa come esempi solo se necessari e già visibili nel prodotto; per il caso dei numeri basta «una commessa».

---

## 4. RESEARCHER BRIEF

### Web search terms

Nessuno. Il web non è una fonte per questo libro (`INSTRUCTION.md` § Researcher, SOURCE OVERRIDE). Leaflet e OpenStreetMap si citano da `docs/MAPS_ARCHITECTURE.md`, non dal web.

### Ordine delle fonti

Codice sul ramo `php8` (in sola lettura) → wiki e `docs/` → Portolano → Jira GOP. Dove wiki e codice non coincidono vale il codice; il conflitto va in [CONFLICT].

### Wiki (`/home/alan/firstmate/projects/GOPlanner/wiki/`), da leggere tutte

- `assistenza-clienti/pagina-interventi-menu.md`
- `assistenza-clienti/pagina-pianificazione.md`
- `assistenza-clienti/selezione-mappa-pianificazione.md`
- `assistenza-clienti/pianificazione-intervento.md`
- `assistenza-clienti/modalita-pianificazione.md`
- `assistenza-clienti/pianificazione-percorsi.md`
- `assistenza-clienti/pagina-calendario.md`
- `assistenza-clienti/pagina-griglia-operatori.md`
- `assistenza-clienti/pagina-da-assegnare.md`
- `assistenza-clienti/pagina-controllo-giornata.md`
- `assistenza-clienti/pagina-mappa-interventi.md` (solo **Elimina**)
- `assistenza-clienti/runbook-utenze-da-pianificare.md`
- `assistenza-clienti/runbook-assegna-utenze.md`
- `assistenza-clienti/runbook-lista-assente-tendina-piano.md`
- `assistenza-clienti/runbook-lista-tutta-da-pianificare.md`
- `assistenza-clienti/pagina-admin-giro-stato-commesse.md` (solo per la disambiguazione di «Giro»)
- `pianificazione/modello-pianificazione-appuntamenti.md` (filtrare nomi di persone, committenti e host)

### Docs (`/home/alan/firstmate/projects/GOPlanner/docs/`)

- `03-cookbooks/29-pianificazione-confermare-cancellare-ripianificare.md`
- `03-cookbooks/28-tendina-liste-perche-una-lista-non-compare.md`
- `02-patterns/52-pianificazione-giornata-settimana-mappa.md`
- `02-patterns/40-smat-squadra-segnaposto-fascia-promessa.md`
- `02-patterns/45-matrice-distanze-zone-outbound.md`
- `02-patterns/48-precisione-utenti-geocodifica-anomalie.md`
- `02-patterns/34-stato-utenza-derivato-ultimo-intervento.md` (solo per la frase di rimando al capitolo 3)
- `MAPS_ARCHITECTURE.md`
- `00-concept-index.md` (cercare altre voci su pianificazione non elencate qui)
- `custom/sg_smat/README.md` e `custom/sg_smat/DUBBI.md` (fuori da `docs/`: su quale commessa è attivo il modello a fasce e quali valori sono da confermare)

### Codice: file da leggere e pattern di grep

| Che cosa | Dove | Pattern |
|---|---|---|
| Voci e condizioni del menu | `lib/MenuInterventi.php`, `pages/interventi.php` | `action=`, `dbtype`, `Rbac::gate` |
| Etichette italiane | `lib/dict/lang_it.php` | `'Planning'`, `'Planning Zones'`, `'Calendar'`, `'Assign'`, `'Confirm jobs'`, `'Intervention nr.'` |
| Vista Pianificazione | `Smarty_templates/it/interventi.html` | `N. int.`, `Mostra clienti`, `Lazo`, `Area`, `Pianifica`, `Zone outbound`, `Fascia`, `Calcola distanza`, `Percorsi`, `percorso più breve` |
| Selezione e assegnazione | `js/code/core_functions.js`, `js/code/interventi_piano.js` | `selezioneCircolare`, `selezioneRettangolare`, `onCircularSelectClick`, `confInterventi`, `calcolaDistanza`, `Devi inserire la data`, `precisione` |
| Server della Pianificazione | `json.php`, `lib/JSONController.php` | `mappautenze`, `set_clusters`, `nearest`, `del_interventi`, `elimina_intervento`, `assegna_prenotato` |
| Tendina delle liste | `lib/VistaTendinaListe.php` | `DURATA_CACHE`, condizioni della query |
| Calendario | `js/code/calendario_interventi.js`, `lib/CalendarioController.php`, `calendario_json.php` | `arrivare in tempo`, `Conferma pianificazione`, `Seleziona prima`, `APPUNTAMENTI da assegnare` |
| Pianificazione operatori e squadre | `js/code/calendario_risorse.js`, `js/code/calendario_squadre.js` | `Assegnazione non salvata`, `Fascia non prevista`, `Da ricollocare`, `Sopprimi`, `posti` |
| Configurazione del calendario | `lib/CalendarSlotsConfig.php`, `lib/CostiLotto.php`, `pages/impostazioni.php` | `modalita`, `slot_duration`, `spostamento_massimo`, `preavviso_minimo_giorni`, `max_app_giorno`, `calendar_slots_config_lotto_` |
| Squadre e zone | `lib/SquadraOutbound.php`, `lib/ZonaOutbound.php`, `lib/ZoneOutboundController.php`, `lib/ClusterStradale.php`, `lib/GiroZona.php`, `lib/GiroPrenotati.php`, `lib/AvvisoSquadreScoperte.php` | `posti(`, `VELOCITA_RIPIEGO_KMH`, `troppo estesa`, `ordine` |
| Giornata, Settimana, Mappa del giorno | `lib/PianificazioneGiorno.php`, `lib/PianificazioneController.php`, `js/code/pianificazione_*.js`, `Smarty_templates/it/interventi_giornata.html`, `interventi_settimana.html`, `interventi_mappa_giorno.html` | `CAPIENZA_PREDEFINITA`, `TORTUOSITA`, `80`, `Oltre il limite`, `partenza da casa`, `Nessun giro da mostrare` |
| Stati | `lib/InterventoBase.php` | costanti degli stati (Importato, Validato, Assegnato, Eseguito, Non fattibile, Controllato, Inviato, Ripianificabile, Annullato, Prenotato) con il loro numero |
| Geocodifica | `lib/UtenzaBase.php` | `function geocodifica`, `reset_geocode`, `precisione` |
| Admin «Giro» (disambiguazione) | `lib/GiroJob.php` | docblock della classe |

Comandi ammessi: Read, Grep, Glob, `git log`, `git show`, `git grep` sul ramo `php8`. Per la data di arrivo di una funzione: `git log --oneline -S 'calendario_risorse' -- lib/MenuInterventi.php` e simili. Nessun `checkout`, `pull`, `stash`, composer o npm. Non aprire file `.env` né file di credenziali.

### Portolano (`mcp__rag_qdrant_server__query_rag_hybrid`, `user_roles: "goplanner"`; se il risultato è povero, `query_rag`)

1. `pianificazione interventi mappa Assegna operatore data`
2. `Lazo selezione circolare N. int. utenze più vicine`
3. `Area selezione rettangolare Maiusc deseleziona`
4. `lista non compare nella tendina della pianificazione copia salvata`
5. `utenze senza coordinate geocodifica Riprova le non trovate precisione`
6. `calendario avviso di viaggio arrivo stimato`
7. `Pianificazione operatori trascinare fascia mattina pomeriggio ora`
8. `Da assegnare appuntamenti prenotati assegnare tecnico`
9. `carico della giornata orario di lavoro tetto interventi`
10. `ordine di visita giro operatore Mappa del giorno partenza`
11. `fascia slot squadra segnaposto operatore effettivo`
12. `zona troppo estesa per lo slot spostamento massimo`
13. `cancellare pianificazione ripianificare spianifica`
14. `Elimina interventi pianificati operatore Mappa`
15. `Pianifica raggruppamento cluster percorso più breve`

Citare ogni risultato con il suo `slug`.

### Jira GOP (sola lettura; cloudId `21873985-2e5d-4a8a-bb45-e6d453128985`)

- Chiavi da leggere (titolo, stato, data di chiusura, una frase sul perimetro): GOP-459, GOP-610, GOP-611, GOP-612, GOP-613, GOP-614, GOP-615, GOP-684, GOP-685, GOP-748, GOP-778, GOP-779, GOP-780, GOP-656 (solo disambiguazione).
- JQL per storie reali (problema → causa → rimedio, senza dati personali):
  - `project = GOP AND text ~ "pianificazione" AND type = Bug ORDER BY created DESC`
  - `project = GOP AND (text ~ "tendina" OR text ~ "Lazo" OR text ~ "geocodifica") ORDER BY created DESC`
  - `project = GOP AND (summary ~ "calendario" OR summary ~ "fasce" OR summary ~ "squadre") ORDER BY created DESC`

### Fatti, numeri e nomi da cacciare (Loop 3, Shadow)

| # | Fatto | Valore atteso da confermare |
|---|---|---|
| 1 | «N. int.» di partenza e limiti | 10; 1–1000 |
| 2 | Copia salvata della tendina Lista | 3600 secondi |
| 3 | Precisione delle coordinate | 1 / 0 / -1; mappa solo se > 0 |
| 4 | Ricerca del Calendario | dal 3° carattere, massimo 20 risultati |
| 5 | Griglia del Calendario | righe da 30 minuti; blocco di un'ora |
| 6 | Avviso di viaggio | finestra di 2 ore; 30 minuti di lavoro stimati |
| 7 | Carico | 20 km/h, coefficiente 1,3, tetto 12 |
| 8 | Legenda della Settimana | soglie 80% e 100% |
| 9 | Righe della griglia di Giornata | 50 di default; 25/50/100/250/500 |
| 10 | Posti di una fascia | parte intera (durata fascia / durata slot), 1 intervento per slot |
| 11 | Valori di partenza di una commessa a fasce | slot 60 minuti, spostamento massimo 20 minuti, preavviso 7 giorni (default 0): da confermare |
| 12 | Velocità di ripiego | 20 km/h (`GiroZona`) contro 30 km/h (`ClusterStradale`) → [CONFLICT] |
| 13 | Codici degli stati | 4, 6, 7 chiusi bene; 5 non fattibile; 9 annullato; numero di Prenotato e di Assegnato |
| 14 | Caso «la mappa non è la lista» | 9.530 / 7.589 / 5.376 / 2.213, 10 novembre 2026 |
| 15 | Caso coordinate a zero | 28 ottobre 2026 |
| 16 | Caso lista sparita | 15 ottobre 2026 |

### Conflitti già noti da risolvere nel dossier

1. Raggruppamento: pulsante «Pianifica» (wiki, pagina Pianificazione) contro funzione «Percorsi» con campo «N. interventi» (wiki, strumenti per i percorsi). A schermo il template mostra «N. int.».
2. Visibilità attuale di «Calcola percorso più breve».
3. Velocità di ripiego 20 km/h contro 30 km/h; il README della commessa dice 30 km/h per tutto.
4. Origine degli interventi prenotati (wiki: non risulta; modello a fasce: prenotazioni dell'assistente vocale).
5. Se **Pianifica** nel Calendario aggiorna lo stato dell'utenza.
6. Etichetta italiana di `Planning Zones` e opzioni «Fascia 1»…«Fascia 4»: in quali commesse compaiono.

---

## 5. TARGET

- **Lunghezza:** 5.000–6.000 parole in tutto (PRD § 4: 4.000–6.000 per capitolo); sei sezioni da 800–1.000 parole, più «In questo capitolo» (2-3 frasi) e «Fonti».
- **Contro-obiezioni:** quattro previste (sezioni 2, 3, 4, 5); ne servono almeno due.
- **Strategia dell'attacco:** subito dopo «In questo capitolo», aprire sul caso reale di una commessa con 7.589 utenze da pianificare di cui solo 5.376 sulla mappa, per fissare dalla prima riga che ogni pagina di pianificazione mostra una parte precisa del lavoro e che il capitolo insegna quale.
- **Promessa della chiusura:** l'ultimo paragrafo della sezione 6 lascia una regola da usare, non un annuncio: pianificare crea interventi e non esiste il comando inverso, quindi ogni correzione è una cancellazione seguita da una nuova assegnazione, e prima di farla si contano utenze libere, utenze in mappa e operatori del lotto.
