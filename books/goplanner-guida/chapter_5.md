# 5. Pianificazione e giri

*In questo capitolo si impara quale pagina del menu Interventi usare per assegnare gli interventi agli operatori e ai giorni, che cosa fanno davvero i pulsanti della Pianificazione e come si controlla il giro di un operatore senza cambiare nulla. L'ultima sezione dice che cosa fare quando i numeri non tornano e quando chiedere allo staff tecnico. È scritto per il back office; i riquadri per lo staff tecnico e per gli sviluppatori si possono saltare.*

## Quale pagina per quale lavoro: il menu Interventi

*Per il back office.*

Il 10 novembre 2026, in una commessa, c'erano 9.530 utenze. Di queste, 7.589 non avevano ancora un intervento: 7.585 nello stato «importato» e 4 in «validato». Chi apriva la mappa della Pianificazione ne vedeva 5.376. Le altre 2.213, quasi tre su dieci, non comparivano da nessuna parte sulla mappa, eppure erano lì, nella lista, in attesa. La mappa non è la lista. Ogni pagina di pianificazione mostra una parte precisa del lavoro, e chi pianifica deve sapere quale parte sta guardando prima di decidere che una lista è finita.

Due definizioni reggono tutto il capitolo. Pianificare vuol dire creare un intervento per un'utenza, con un operatore e una data: l'intervento nasce nello stato Assegnato (codice 3) e l'utenza passa da importato ad assegnato (il capitolo 3, *Utenze, liste, pratiche, lotti e carichi*, spiega come lo stato dell'utenza segue l'ultimo intervento). Il giro è l'insieme degli interventi di un operatore in un giorno, nell'ordine in cui li visita. Gli interventi assegnati arrivano poi all'app dell'operatore, come spiega il capitolo 8.

Il menu Interventi elenca le voci in quest'ordine: «Lista», «Mappa», «Pianificazione», «Calendario», «Pianificazione operatori», «Giornata», «Settimana», «Mappa del giorno», «Da assegnare». Otto di queste parlano di pianificazione. Solo alcune creano interventi.

| Voce | A che cosa serve | Crea interventi | Sposta interventi | Solo lettura |
|---|---|---|---|---|
| Pianificazione | assegnare a un operatore, per una data, un gruppo di utenze ancora libere scelte sulla mappa | sì | no | no |
| Calendario | fissare a un'ora precisa un intervento per una singola utenza, cercata per matricola o codice | sì | sì | no |
| Pianificazione operatori | spostare gli interventi della settimana tra operatori, giorni e fasce trascinandoli | no | sì | no |
| Da assegnare | dare un operatore agli interventi prenotati che sono arrivati senza | no | no (cambia l'operatore, non la data) | no |
| Giornata | controllare i giri di un giorno, operatore per operatore | no | no | sì |
| Settimana | controllare il carico di ogni operatore giorno per giorno | no | no | sì |
| Mappa del giorno | vedere sulla mappa il giro di ciascun operatore, con le tappe numerate | no | no | sì |
| Mappa | consultare gli interventi; contiene il pulsante «Elimina» (vedi l'ultima sezione) | no | no | no |

Quattro di queste pagine sono recenti. Pianificazione operatori è entrata nel codice il 19 ottobre 2026 (GOP-459); Giornata, Settimana e Mappa del giorno il 12 novembre 2026 (GOP-778, GOP-779, GOP-780), e i ticket di tre di loro risultano ancora aperti. Nessuna delle quattro dipende da un permesso: se una manca dal vostro menu, la vostra installazione non l'ha ancora ricevuta.

Il menu non è uguale per tutti. Cambia con la commessa e con i permessi dell'utente: le differenze sono condizioni, non difetti. In alcune commesse, quelle di tipo security, la voce «Pianificazione giri» prende il posto di «Pianificazione». Una sola commessa ha in più «Pianificazione zone». Un'altra sola commessa ha «Pianificazione allacci» e «Pianificazione letture». «Centralino» compare solo dove la commessa ha il centralino attivo (capitolo 15); «Carichi» e «Lotti» compaiono solo a chi ha il permesso di vederli. In coda, ogni commessa può aggiungere voci sue. Esiste poi nel codice una pianificazione per via, con la sua pagina, ma nessuna voce di menu la apre: si raggiunge solo scrivendo a mano l'indirizzo della pagina nel browser. Non va proposta come modalità disponibile.

> **Attenzione:** la parola «giro» compare anche in Admin › Giro e Stato commesse. Lì «Giro» è il registro delle attività automatiche che il sistema esegue a intervalli, una per commessa e per periodo (GOP-656, capitolo 12). È una pagina di sola lettura per il personale di GOPlanner e non ha nulla a che vedere con il giro di un operatore.

La regola della sezione: prima di cercare un'utenza in una pagina, si sceglie la pagina in base al lavoro. Le utenze libere si assegnano in Pianificazione; un'ora concordata si fissa nel Calendario; il lavoro della settimana si sposta in Pianificazione operatori; i prenotati senza operatore ricevono un operatore in Da assegnare; tutto il resto si controlla e basta.

## Assegnare le utenze dalla mappa: Interventi › Pianificazione

*Per il back office.*

La pagina Interventi › Pianificazione ha quattro strati, dall'alto in basso. In cima i filtri «Cliente», «Distretto», «Tipo» e «Lista», dove ogni voce della tendina «Lista» riporta il «Cliente» e la data di importazione. Sotto, la barra degli strumenti della mappa. Poi la riga di assegnazione: «Operatore», «Data», «N. int.», «Durata», e solo in alcune commesse «Fascia» e «Tipo intervento», seguiti da «Calcola distanza» e «Assegna». Infine la mappa, a tutta larghezza, costruita su Leaflet con le mappe di OpenStreetMap scaricate da un server pubblico: senza connessione a internet lo sfondo non si carica.

Due campi della riga di assegnazione hanno un valore già scritto. «N. int.» parte da 10. «Durata» propone la durata dello slot del calendario della commessa e, se il calendario manca, il valore personale dell'utente (GOP-638). Le opzioni «Fascia 1»…«Fascia 4» esistono in una sola commessa; «Tipo intervento» in molte.

### Assegnare un gruppo di utenze

1. Scegliete la lista nel filtro «Lista»; se serve restringete con «Cliente», «Distretto» e «Tipo».
2. Spostate e ingrandite la mappa sulla zona da pianificare.
3. Premete «Mostra clienti». Compare «Caricamento utenze» finché il caricamento non finisce.
4. Selezionate le utenze con «Seleziona», «Area», «Lazo» o con i gruppi di «Pianifica» (vedi sotto).
5. Scegliete l'operatore nella tendina «Operatore».
6. Scrivete la data nel campo «Data», nel formato gg/mm/aaaa.
7. Controllate «Durata» e, se la commessa li prevede, «Fascia» e «Tipo intervento».
8. Premete «Assegna».
9. Leggete il riepilogo.

Il passo 3 carica solo le utenze dentro l'area della mappa visibile in quel momento, senza intervento, di liste non chiuse, con i filtri scelti. È per questo che il passo 2 viene prima. Con una commessa molto grande, caricare tutto in una volta rallenta il browser: si sceglie prima la lista, si ingrandisce, poi si preme «Mostra clienti». Nessuno ha misurato una soglia oltre la quale il rallentamento comincia, e questa guida non ne inventa una.

Senza data, «Assegna» si ferma con «Attenzione! Devi inserire la data!» e non invia nulla. Il controllo guarda solo che il campo non sia vuoto: una data scritta in un altro formato, per esempio 25-11-2026, passa, il server non la riconosce e assegna gli interventi alla data di oggi. Con la data, il riepilogo arriva una riga per voce: «N interventi pianificati», «N interventi annullati», «N interventi già pianificati» e, solo quando sono più di zero, «N utenze saltate perché già con un incarico assegnato» e le righe sui misuratori sostituiti o illeggibili. La riga degli annullati non riguarda gli interventi appena creati: conta gli interventi delle stesse utenze ancora assegnati su liste precedenti, che «Assegna» annulla con la nota «Annullato per pianificazione nuovo carico», perché vale la lista nuova. Le utenze assegnate spariscono dalla mappa. Un'utenza che ha già un intervento non viene riassegnata a un altro operatore: conta tra i «già pianificati», o tra le «saltate» nelle commesse che lo prevedono. Per cambiare operatore a un intervento esistente si usa la procedura del capitolo 6, *Interventi, esiti e verifica*. Se la lista dell'utenza è chiusa non si crea nulla.

### Seleziona, Area, Lazo e Pianifica

«Seleziona» prende un'utenza alla volta. «Area», o il tasto Maiusc tenuto premuto mentre si trascina, disegna un rettangolo; al rilascio ogni utenza nel rettangolo inverte il suo stato. Un secondo rettangolo sulle stesse utenze, quindi, le deseleziona invece di confermarle. «Riavvia» toglie dalla mappa tutti i punti caricati e la selezione, e interrompe un caricamento in corso.

Lazo è lo strumento che il suo nome descrive peggio. Accende un cursore a croce, e ogni clic chiede al server le N utenze più vicine al punto cliccato, in linea d'aria, dove N è il numero scritto in «N. int.»: 10 di partenza, da 1 a 1000. Prende solo utenze importate o validate della lista scelta, con coordinate diverse da zero. Ogni clic aggiunge utenze al conteggio senza guardare quelle già prese: due clic sullo stesso punto contano due volte le stesse utenze. All'assegnazione il server non crea doppioni per la stessa utenza, ma il numero sullo schermo è gonfiato. Quando il conteggio non convince, «Riavvia» e si ricomincia.

«Ma Lazo non dovrebbe prendere le utenze dentro un cerchio?» Il dubbio è legittimo: il suggerimento del pulsante dice «Selezione circolare», e il nome fa pensare a un tratto a mano libera. Lazo non fa né l'una né l'altra cosa, e la wiki dell'assistenza lo scrive negli stessi termini. Seleziona per numero, non per area: nessun cerchio viene disegnato, e le N utenze prese formano sulla mappa una macchia più o meno tonda il cui raggio dipende da quante utenze ci sono intorno. In un quartiere denso dieci utenze stanno in pochi isolati; in campagna le stesse dieci possono essere a chilometri l'una dall'altra. Chi vuole un'area precisa usa «Area».

«Pianifica» (suggerimento «Percorsi») prende tutte le utenze filtrate dentro l'area visibile della mappa, con coordinate e senza un intervento assegnato, eseguito o prenotato, e le raggruppa per vicinanza in gruppi da «N. int.» utenze, usando i tempi di guida su strada di un server di calcolo dei percorsi. Ogni gruppo mostra un suggerimento come «10 interventi - 42 min su strada, 182 min in totale» (numeri dell'esempio inventati); se il server non risponde, i gruppi restano in linea d'aria e il suggerimento dice «stima in linea d'aria». Un clic sul centro del gruppo ne seleziona o deseleziona tutte le utenze. Oltre 3.000 utenze «Pianifica» non raggruppa e scrive: «Troppe pratiche da pianificare (N, massimo 3000): restringi i filtri o la zona della mappa». La sequenza interna con cui costruisce i gruppi non viene salvata, e «Assegna» non scrive alcun ordine di visita: nel flusso standard GOPlanner non calcola il percorso più breve di un giro.

> **Attenzione:** «Calcola distanza» misura la distanza su strada e il tempo di guida solo fra le prime due utenze selezionate («Distanza: X km», «Durata percorso: N minuti e S secondi»). Dopo il messaggio toglie le utenze selezionate dalla mappa senza assegnarle. Per riaverle si preme di nuovo «Mostra clienti».

Il limite della pagina sta tutto in una condizione. Pianificazione vede solo utenze con coordinate: un'utenza senza coordinate non compare sulla mappa, non entra in un gruppo e non si prende con Lazo. Le 2.213 utenze del caso di apertura erano questo. L'ultima sezione dice come ritrovarle e come assegnarle lo stesso.

## Interventi con un orario: Calendario, Pianificazione operatori e Da assegnare

*Per il back office.*

Quando un intervento ha un'ora concordata con l'utenza, le pagine giuste sono tre. Tutte e tre, nell'interfaccia, chiamano «appuntamento» l'intervento con un orario fissato: la parola compare nelle etichette («APPUNTAMENTI da assegnare», «Appuntamenti in attesa di assegnazione»), ma l'oggetto è sempre un intervento. Nella prosa di questa guida resta «intervento».

| Pagina | Unità di tempo | Che cosa si vede | Come si assegna |
|---|---|---|---|
| Calendario | giorno, settimana o mese; righe da 30 minuti | gli interventi di un operatore, ciascuno come blocco di un'ora | clic su un orario, poi «Pianifica» nella finestra di conferma |
| Pianificazione operatori | settimana, colonne «Mattina» e «Pomeriggio» | tutti gli operatori visibili al proprio utente, più la riga «Da assegnare» | trascinando un intervento su un operatore e una fascia |
| Da assegnare | nessuna: un elenco | gli interventi in stato Prenotato, per data, senza filtri | una tendina per riga e il pulsante «Assegna» |

### Fissare un intervento dal Calendario

1. Scrivete almeno tre caratteri della matricola o del codice nel campo «Cerca cliente (Matricola/Codice)»; i risultati sono al massimo 20.
2. Scegliete l'utenza: compare in «Cliente selezionato».
3. Scegliete l'operatore nella tendina (non «APPUNTAMENTI da assegnare»).
4. Fate clic sull'orario nella griglia.
5. Nella finestra «Conferma pianificazione» leggete l'eventuale «Avviso di viaggio».
6. Premete «Pianifica».

Saltare un passo produce un messaggio preciso. Senza utenza: «Seleziona prima un'utenza dalla ricerca.». Senza operatore: «Seleziona un operatore.». C'è anche una scorciatoia, e conviene conoscerla per non usarla per sbaglio: con un operatore scelto, un clic su un blocco grigio, cioè su un intervento senza operatore, lo assegna subito a quell'operatore, senza finestra di conferma.

L'avviso di viaggio fa un conto piccolo e dichiarato. Cerca l'ultimo intervento dello stesso operatore nelle due ore prima dell'orario scelto, aggiunge 30 minuti di lavoro stimato e il tempo di guida su strada. Se l'arrivo cade dopo l'orario scelto, la finestra scrive: «Attenzione: l'operatore potrebbe non arrivare in tempo (Arrivo stimato: HH:MM)». È un avviso. «Pianifica» resta disponibile, e la decisione resta a chi pianifica. Se l'utenza non ha coordinate l'avviso non compare affatto, e il silenzio non vuol dire che l'operatore arrivi in tempo.

L'intervento salvato dalla finestra va ad Assegnato ed è collegato alla lista più recente dell'utenza. Lo stato dell'utenza, però, da qui non cambia: lo aggiornano il clic sul blocco grigio, il trascinamento in Pianificazione operatori e la pagina Da assegnare, non la finestra «Conferma pianificazione».

### Spostare il lavoro in Pianificazione operatori

1. Scegliete la settimana con «Settimana precedente», «Settimana successiva» o «Questa settimana».
2. Se le liste della commessa hanno la colonna UT (solo alcune commesse), restringete con il filtro «Tutte le UT»; altrimenti la tendina resta vuota e il passo si salta.
3. Trascinate un intervento dalla riga «Da assegnare» o da un operatore sulla cella dell'operatore e della fascia voluti.
4. Controllate l'ora dell'intervento dopo il trascinamento.

Il passo 4 risponde a un dubbio preciso: «Ho spostato l'intervento in Pianificazione operatori: perché l'ora è cambiata?» La regola è nel codice. Se l'intervento resta nello stesso giorno e nella stessa fascia e cambia solo l'operatore, l'ora non cambia. Se cambia giorno o fascia, l'ora resta solo se cade già dentro la nuova fascia; altrimenti diventa l'ora di inizio della fascia. Per esempio, un intervento concordato per le 11:30 e spostato sul pomeriggio di un altro giorno, con il calendario predefinito, va alle 14:00. L'utenza aspetta alle 11:30.

Alcuni trascinamenti sono rifiutati. Non si trascina verso la riga «Da assegnare». Gli interventi chiusi e quelli annullati non si spostano. Un giorno non attivo o una fascia non configurata danno «Assegnazione non salvata: Fascia non prevista dalla configurazione del calendario»; un operatore che il vostro utente non vede dà «Assegnazione non salvata: Operatore non valido».

### Dare un operatore ai prenotati: Da assegnare

La pagina ha il titolo «Appuntamenti in attesa di assegnazione» e le colonne «Codice», «Cliente», «Indirizzo», «Data pianificata», «Note», «Assegna tecnico». Gli interventi elencati sono nello stato Prenotato (codice 10), e nascono dall'assistente vocale del call center quando prenota senza indicare un operatore (capitolo 15). Per ogni riga si sceglie l'operatore nella tendina e si preme «Assegna»: l'intervento e l'utenza passano ad Assegnato, la data resta quella prenotata. Senza scelta compare «Seleziona un tecnico»; se nel frattempo un collega ha già assegnato quell'intervento, «Errore: Intervento non trovato o non prenotato». Un intervento il cui titolo nel Calendario comincia con «[VERIFICARE UTENZA]» è stato preso dall'assistente vocale riconoscendo l'utenza dal nominativo: prima di assegnarlo si controlla che l'utenza sia quella giusta.

I limiti di queste tre pagine sono di confine. La durata non si modifica da Pianificazione operatori. Le colonne «Mattina» e «Pomeriggio» vengono da Impostazioni › Calendario, mentre la griglia del Calendario resta a righe da 30 minuti qualunque sia la configurazione. La tendina «Operatore» mostra solo gli operatori visibili al proprio utente (capitolo 11). La regola da portarsi via: un'ora concordata si fissa nel Calendario, e dopo ogni trascinamento in Pianificazione operatori si rilegge l'ora.

## Fasce, slot, squadre e zone: il calendario della commessa

*Per il back office; il riquadro finale è per lo staff tecnico.*

Questa sezione nasce dal problema di una commessa precisa. Lì le settimane si prenotano con almeno una settimana di anticipo, ma l'operatore vero, spesso, una settimana prima non si sa ancora: promettere all'utenza un'ora precisa con un operatore preciso vorrebbe dire rifare le promesse a ogni cambio di turno. Fasce, slot e squadre sono la risposta, e oggi sono attive solo in quella commessa. La configurazione del calendario che viene subito dopo, invece, vale per tutte.

La configurazione che vale per tutte le commesse sta in due pagine. Impostazioni › Calendario stabilisce i giorni attivi, la mattina e il pomeriggio, la «Durata di uno slot», il «Max appuntamenti al giorno» per operatore (0 vuol dire nessun limite) e il «Preavviso minimo» in giorni. Senza configurazione valgono lunedì–venerdì, mattina 09:00–13:00, pomeriggio 14:00–18:00, slot di 120 minuti, nessun limite e nessun preavviso. La voce Calendario di Impostazioni si apre solo a chi ha il permesso di modificare le impostazioni. Impostazioni › Generale, visibile a tutti, contiene invece voci personali dell'utente connesso, tra cui «Orario inizio» e «Orario fine»: ognuno imposta il proprio.

### Il modello a fasce

Il modello a fasce è attivo solo nei lotti configurati «A fasce orarie» nella scelta «Come si prenota»; oggi una sola commessa lo usa. Gli altri lotti restano a «Mattina e pomeriggio» e si comportano come prima.

Una fascia è una finestra oraria di un giorno, per un lotto. È ciò che si promette all'utenza. Lo slot è il tempo di un intervento più lo spostamento dall'utenza precedente: è un'unità interna, non si comunica mai, e in un lotto a fasce ogni slot contiene un intervento. I posti di una fascia sono la parte intera della durata della fascia divisa per la durata dello slot; i minuti che avanzano restano liberi, e Impostazioni lo dice con un messaggio del tipo «N posti da M minuti, avanzano X minuti che restano liberi.». L'aiuto della pagina fa il conto più semplice: «Una fascia da 4 ore con slot da 30 min offre 8 posti.»

### La squadra e l'operatore effettivo

La squadra è un segnaposto. Riserva una risorsa per una settimana su un lotto, di solito un operatore, ma non è un operatore e non compare tra gli Operatori. I posti di una squadra in una fascia sono quelli della fascia meno gli interventi che li occupano. L'operatore effettivo si lega dopo, per una fascia, per un giorno o per tutta la settimana, nella griglia delle squadre dentro Pianificazione operatori («Griglia squadre», «Cerca operatore», poi un clic sulle celle). Legarlo porta subito ad Assegnato gli interventi prenotati di quella fascia; togliere il legame li riporta a Prenotato; gli eseguiti non si toccano. Lo stesso operatore non può stare in due squadre nella stessa fascia dello stesso giorno: l'errore è «Lo stesso tecnico non può essere in due squadre». Ogni cella mostra «occupati/posti», e la riga di sintesi dice «N appuntamenti su M posti · K liberi».

Il conto, con i valori di partenza della commessa che usa le fasce: due fasce, 9–13 e 14–18, con slot da 60 minuti, danno 4 + 4 = 8 posti al giorno. Il valore di 60 minuti viene da un mese della commessa precedente, circa 6,5 interventi al giorno per operatore. Questi numeri, insieme allo spostamento massimo di 20 minuti e al preavviso di 7 giorni, sono valori di partenza ancora da confermare con la commessa. Non sono regole del prodotto.

Sopprimere una squadra non cancella nulla. La conferma lo scrive per esteso: «Gli appuntamenti non si cancellano: quelli di questa squadra finiscono nell'elenco «Da ricollocare». La squadra sparisce dalla griglia e non si può ripristinare da qui.». Gli interventi in Assegnato e Prenotato finiscono nell'elenco «Da ricollocare (N)» e vanno ricollocati a mano.

### Le zone e la promessa all'utenza

La zona, in questo capitolo, è il gruppo di pratiche della settimana assegnato a una squadra. Non è il distretto, e non è la «zona» delle schede di Giornata. Si costruisce dal pannello «Zone outbound» della Pianificazione, che compare solo dove la commessa ha le zone attive e avverte: «Nulla è salvato finché non premi Conferma.». Una zona occupa di norma 3 giorni, mai meno di 2, salvo un valore diverso nel campo «Giorni per zona» (da 1 a 7). Quando il tempo su strada tra le due utenze più lontane di una zona supera lo spostamento massimo, la zona riceve l'etichetta «zona troppo estesa per lo slot», con il dettaglio «N min fra le utenze più lontane, massimo M min». È un avviso. Non blocca mai la conferma.

Resta il dubbio dell'utenza, che l'ufficio riceve al telefono: «Perché non mi dite l'ora esatta?». Perché l'ora esatta non esiste ancora quando si prenota. L'ordine degli interventi dentro la fascia lo decide il calcolo del giro, e il giro cambia a ogni nuova prenotazione. Lo slot serve a contare i posti, non a fissare un orario: promettere lo slot sarebbe promettere qualcosa che la prenotazione successiva sposta.

Il limite di questa sezione riguarda che cosa del modello esiste davvero. Dei costi, il codice fa solo il confronto tra il costo di un giro e la penale per una pratica non gestita (GOP-685), e lo segnala senza escludere nulla da solo. La mail del giorno prima per le fasce con interventi senza operatore esiste nel codice ma non parte: la commessa non ha destinatari configurati e il processo che dovrebbe chiamarla è fermo. Finché non parte nessuno riceve un avviso, e il controllo delle fasce senza operatore resta a chi pianifica. Le prenotazioni dell'assistente vocale sono descritte nel capitolo 15. La regola: all'utenza si promette la fascia; i posti si contano in slot; l'operatore vero si lega quando si conosce.

> **Per lo staff tecnico:** la configurazione del calendario si cerca prima per lotto (`calendar_slots_config_lotto_N`), poi nella generale (`calendar_slots_config`), poi nei valori fissi. Nella commessa a fasce le pratiche hanno lotto 0, quindi vale la riga generale. Il JSON di un lotto a fasce supera 255 caratteri e richiede la colonna `impostazioni.valore` di tipo TEXT (migrazione `0002_impostazioni_chiave_valore_larghi`). Senza server dei percorsi il calcolo delle zone stima il tempo in linea d'aria a 30 km/h; la proposta delle fasce (GOP-684) e il carico di Giornata e Settimana usano 20 km/h. Squadre e zone stanno nelle tabelle `zone_outbound_squadre`, `zone_outbound_squadre_giornate`, `zone_outbound_squadre_fasce`, `zone_outbound_squadre_operatori`, `zone_outbound_prenotazioni`.

## Il giro del giorno: Giornata, Settimana e Mappa del giorno

*Per il back office; un riquadro per gli sviluppatori.*

Giornata, Settimana e Mappa del giorno non cambiano nulla. Servono a controllare che la pianificazione regga: chi ha troppo, chi è libero, in che ordine visita. Le tre pagine condividono nell'indirizzo il giorno, l'operatore e il lotto, così si passa dall'una all'altra senza riscegliere. Mostrano gli interventi con data pianificata nel periodo, tranne gli annullati, degli operatori visibili al proprio utente più quelli senza operatore. Richiedono lo stesso permesso della pagina Interventi.

Giornata ha una barra con «Precedente», «Oggi», «Successivo», «Vai al» (una data gg/mm/aaaa; altrimenti «Data non valida: usa gg/mm/aaaa»), «Lotto» e «Operatore», che offre «Tutti» e «Da assegnare». Sotto, i sette giorni della settimana e una scheda per operatore: interventi chiusi su pianificati, la zona come comune più frequente, il carico, e due avvisi possibili, «Oltre l'orario di lavoro di circa N min» e «N interventi oltre il tetto di M». In fondo una griglia con le colonne «Operatore», «Ord.», «Ora», «Utenza», «Indirizzo», «Comune», «Matricola», «Stato», 50 righe per pagina (25, 50, 100, 250 o 500), e «Esporta Excel».

Settimana è la tabella «Carico della settimana», un operatore per riga e un giorno per colonna, con la legenda «Sotto l'80%», «80–100%», «Oltre il limite», «Libero». Un clic su una cella apre le visite di quel giorno, i minuti di strada stimati e da dove parte il giro, «partenza da casa» o «partenza dalla sede»; i pulsanti «Vedi sulla mappa» e «Apri la giornata» portano alle altre due pagine. Mappa del giorno mostra il pannello «Operatori del giorno»: un clic su un operatore mostra o nasconde il suo giro, e il numero sulla tappa è l'ordine di visita. Con «Mostra» si sceglie «Tutte le tappe» o «Solo da fare». La tappa piena è eseguita, la vuota è da fare, la tratteggiata non fattibile, il quadrato è la partenza. La partenza è il domicilio dell'operatore se ha coordinate, altrimenti la «Sede del lotto» impostata in Impostazioni › Calendario, altrimenti la prima tappa.

### Due modi di misurare il carico

Il carico, qui, è quanto è piena la giornata di un operatore; non ha niente a che fare con la lista importata. GOPlanner lo misura in due modi, e la scheda dice sempre quale ha usato.

| Etichetta | Quando si usa | Come si calcola |
|---|---|---|
| «Carico della giornata» | sono noti l'orario di lavoro e il tempo sul posto di ogni lotto toccato | minuti sul posto più minuti di viaggio, diviso per i minuti di lavoro |
| «Carico (conteggio)» | manca l'orario di lavoro o il tempo sul posto | numero di interventi contro un tetto |

Il viaggio va dalla partenza alla prima tappa e poi di tappa in tappa, in linea d'aria a 20 km/h. La spiegazione a schermo lo dichiara: «Stima di X su Y di lavoro (HH:MM–HH:MM): A sul posto + B di viaggio (stima in linea d'aria).». Il tetto del conteggio è il «Max appuntamenti al giorno» del calendario generale, se è più di zero; altrimenti un valore della commessa, se configurato; altrimenti 12. Anche qui la scheda spiega il perché: «Carico contato sugli interventi: N su un tetto di M al giorno, perché l'orario di lavoro non è impostato (Impostazioni › Generale › Orario inizio e fine)».

Due conseguenze non si vedono a prima vista. La prima: il «Tempo sul posto» si imposta solo nei lotti a fasce, quindi nelle commesse a «Mattina e pomeriggio», cioè tutte tranne una, il carico è sempre a conteggio. La scheda può allora indicare «il tempo sul posto non è impostato per il lotto (Impostazioni › Calendario)», ma lì il campo non c'è: compare solo scegliendo «A fasce orarie» in «Come si prenota», che cambia il modo in cui il lotto si prenota. Non è una scorciatoia per avere il carico in tempo. La seconda: l'orario di lavoro è quello dell'utente connesso, perché sta tra le sue impostazioni personali, e due colleghi con orari diversi vedono percentuali diverse sulla stessa giornata.

### Vedere il giro di domani di un operatore

1. Aprite Interventi › Giornata.
2. Premete «Successivo».
3. Scegliete l'operatore nella tendina «Operatore».
4. Leggete la scheda: se accanto al conteggio compare « · ordine pianificato», l'ordine è quello salvato.
5. Aprite «Mappa del giorno» per vedere le tappe numerate sul territorio.

Il giorno libero di un operatore si trova invece in Settimana: è la cella «Libero» sulla sua riga.

L'ordine di visita segue una regola sola. Se ogni intervento della giornata dell'operatore ha un ordine salvato, vale quello. Altrimenti si ordina per ora, poi per comune, indirizzo e civico. I due criteri non si mescolano mai: un giro ordinato a metà sarebbe peggio di nessun ordine. Nel codice attuale, però, quell'ordine lo scrivono solo funzioni vecchie, legate al calcolo del percorso più breve; né «Assegna» né il calcolo delle zone lo fanno, e l'ordine che si vede è quasi sempre «per ora e indirizzo». La riga di assegnazione della Pianificazione, poi, non ha un campo per l'ora: gli interventi creati con «Assegna» hanno la data e nessun orario, quindi si mettono in fila per comune, indirizzo e civico. È un ordine alfabetico, non un ordine di strada. In Mappa del giorno i numeri sulle tappe di un gruppo nato da «Pianifica» seguono l'elenco delle vie, non la sequenza usata per formarlo.

«La Settimana dice 100% ma l'operatore finisce a metà pomeriggio.» Le spiegazioni sono due. La prima: il viaggio è stimato in linea d'aria, non su strada, e a una velocità prudente di 20 km/h. La seconda, più frequente: il carico era a conteggio, e il 100% voleva dire «12 interventi su un tetto di 12», non «otto ore piene». La riga del dettaglio lo dice, con «(conteggio)» accanto alla percentuale. «Oltre il limite» è una stima, non un divieto di assegnare.

Il limite delle tre pagine va detto per intero. Sono di sola lettura. Non mostrano gli annullati né gli interventi senza data. Una tappa senza coordinate non compare sulla mappa e rende il viaggio sottostimato, e la scheda lo segnala con «N tratte senza coordinate: il viaggio è sottostimato.». Gli interventi senza operatore non hanno un giro. La settimana va da lunedì a domenica. Il filtro «Lotto» usa il lotto dell'ultima lista in cui l'utenza è stata importata.

> **Per gli sviluppatori:** le tre pagine sono le azioni `giornata`, `settimana` e `mappa_giorno` di `interventi.php` (ADR-52); i calcoli stanno in `lib/PianificazioneGiorno.php` (`CAPIENZA_PREDEFINITA = 12`, `VELOCITA_KMH = 20`, `TORTUOSITA = 1.3`, che moltiplica solo i chilometri mostrati, non i minuti). L'ordine salvato è `interventi.ordine > 0`; `lib/GiroPrenotati.php` lo calcolerebbe per giornata, operatore e fascia, ma oggi lo usano solo i test.

## Quando la pianificazione non torna

*Per il back office; il riquadro finale è per lo staff tecnico.*

Il 28 ottobre 2026 un'importazione è andata a buon fine mentre il servizio di localizzazione degli indirizzi non rispondeva. Le utenze sono entrate nella lista con latitudine e longitudine a zero e la precisione a -1, «non trovata». Nessun errore a schermo. Il giorno dopo la lista c'era, le utenze anche, la mappa della Pianificazione no. Il caso dice da dove partire: quando la pianificazione non torna, quasi sempre i dati ci sono, ed è la pagina a mostrarne una parte.

Il primo controllo è un conto: utenze libere della lista contro utenze sulla mappa. Le une e le altre si trovano nel menu Clienti, dove stanno le utenze: il filtro «Stato» dà le libere, la colonna e il filtro «Geocodifica» quelle senza coordinate. Se i due numeri differiscono, la differenza ha un nome: la precisione delle coordinate. Vale -1 quando l'indirizzo non è stato trovato, 0 quando la localizzazione è ancora da fare, e un valore positivo quando l'utenza ha le coordinate; i valori 3 e 4, approssimata e fuori comune, sono anomalie da guardare e sulla mappa hanno un anello colorato. Con il codice attuale un errore tecnico del servizio lascia la precisione a 0, non a -1 come nel caso del 28 ottobre. Per chi pianifica l'effetto è lo stesso: senza coordinate, nessuna delle due compare sulla mappa.

| Sintomo | Causa | Dove si controlla | Rimedio |
|---|---|---|---|
| Utenze che non compaiono sulla mappa | coordinate mancanti: precisione 0 o -1, latitudine e longitudine a zero | Clienti, filtro «Stato» «importato» e filtro «Geocodifica» | Geocodifica; «Riprova le non trovate»; correggere l'indirizzo o spostare il punto dalla scheda utenza; oppure assegnare da Clienti, che funziona anche senza coordinate |
| Lista assente dalla tendina «Lista» | manca una delle quattro condizioni, o la copia salvata della tendina è vecchia | la lista: è aperta, ha il «Cliente», è in un lotto dell'utente, ha utenze libere? | se ha 0 utenze libere è nascosta correttamente; altrimenti aspettare la scadenza della copia (al massimo un'ora) |
| «Assegna» non fa nulla | data mancante, utenze già assegnate, lista chiusa, operatore non valido per il lotto | il messaggio e il riepilogo | scrivere la data; le utenze già assegnate sono saltate, non perse |
| Interventi assegnati a oggi invece che alla data scritta | data scritta in un formato diverso da gg/mm/aaaa | la data degli interventi in Interventi › Lista | cancellare e riassegnare con la data nel formato giusto |
| Pianificazione da rifare | non esiste un comando «spianifica» | Interventi › Lista | cancellare gli interventi e riassegnare (procedura sotto) |
| Interventi di un operatore spariti tutti insieme | qualcuno ha premuto «Elimina» in Interventi › Mappa | le attività dell'utente | riassegnare le utenze, che sono tornate libere |

«Riprova le non trovate» rimette la precisione a 0 a tutte le utenze che hanno un indirizzo e coordinate mancanti o a zero, così la geocodifica le riprova. Le utenze senza coordinate non sono perse: si assegnano da Clienti anche senza un punto sulla mappa.

La lista che sparisce dalla tendina spaventa più di quanto dovrebbe. Una lista compare nella tendina della Pianificazione se è aperta, ha il campo «Cliente» compilato, ha almeno un'utenza senza intervento e, per chi non vede tutti i lotti, sta in un lotto dell'utente. La tendina legge una copia salvata che vale 3.600 secondi, un'ora. Il 15 ottobre 2026, per esempio, una lista che qui si chiama *Lotto 3 — marzo* (nome inventato) è sparita dopo che erano stati cancellati 200 interventi per ripianificarli: allora la copia restava un'ora intera. Dal 31 ottobre 2026 (GOP-442) la copia si rinnova da sola quando cambia il numero di righe, di interventi o di liste aperte. Oggi, di norma, una lista ricompare appena si cancellano i suoi interventi. L'attesa di un'ora resta solo se cambia qualcosa che quel controllo non vede, per esempio il «Cliente» o il lotto della lista. Gea, l'assistente del back office, fa gli stessi controlli e risponde con i numeri della lista (capitolo 10).

### Rifare una pianificazione

1. Cancellate gli interventi da rifare, uno alla volta dall'elenco Interventi.
2. Riaprite Interventi › Pianificazione: la lista ricompare nella tendina perché ha di nuovo utenze libere.
3. Se non ricompare, controllate le quattro condizioni o chiedete a Gea.
4. Selezionate le utenze e premete «Assegna» con il nuovo operatore o la nuova data.

Cancellare è definitivo per l'intervento, non per l'utenza. L'utenza resta nella lista e, se non ha altri interventi aperti, torna da Assegnato a Validato, libera per una nuova assegnazione. Un intervento con un esito non si cancella: «Intervento non cancellato perché già chiuso (intervento eseguito associato).». Un intervento preso dal call center, cancellato uno alla volta, non sparisce: passa ad Annullato e resta nello storico con una nota in testa. Per riaffidare un intervento o ripianificare un non fattibile si va al capitolo 6.

> **Attenzione:** il pulsante «Elimina» di Interventi › Mappa cancella tutti gli interventi dell'operatore scelto, di qualsiasi giorno e di qualsiasi stato, compresi quelli presi dal call center, e non chiede conferma. Salva solo gli interventi che hanno già un esito. Le utenze tornano nella lista a Validato e si ripianificano. Il messaggio finale è «Tutti gli interventi pianificati sono stati cancellati!» oppure «Interventi cancellati. N intervento/i non cancellati perché già chiusi (intervento eseguito associato).».

Le cancellazioni restano tra le attività dell'utente, distinte tra cancellazione di un intervento e cancellazione in blocco degli interventi di un operatore. Il registro non contiene però la lista: per questo, quando si ricostruisce che cosa è successo, si guarda l'intero giorno.

> **Quando chiedere allo staff tecnico:** una lista ancora assente dopo un'ora con le quattro condizioni vere; molte utenze senza coordinate (precisione 0 o -1) subito dopo un'importazione, che può voler dire che il servizio di localizzazione non rispondeva; fasce, slot, squadre o zone da configurare per un lotto. Nella segnalazione portate il nome della lista, l'ora, il vostro utente e il testo esatto del messaggio.

Pianificare crea interventi, e il comando inverso non esiste. Ogni correzione è una cancellazione seguita da una nuova assegnazione. Prima di farla si contano tre numeri: le utenze libere della lista, quelle visibili sulla mappa, gli operatori del lotto.

## Fonti

- codice: `lib/MenuInterventi.php`, `lib/dict/lang_it.php`, `pages/interventi.php`, `Smarty_templates/it/interventi.html`
- codice: `js/code/core_functions.js`, `lib/JSONController.php`, `json.php`, `lib/PianificaPunti.php`, `lib/ClusterStradale.php`, `lib/Geo.php`
- codice: `js/code/calendario_interventi.js`, `js/code/calendario_risorse.js`, `js/code/calendario_squadre.js`, `lib/CalendarioController.php`, `lib/CallCenterController.php`, `lib/InterventoBase.php`
- codice: `lib/CalendarSlotsConfig.php`, `js/code/impostazioni_calendario.js`, `pages/impostazioni.php`, `lib/ImpostazioniGenerale.php`, `lib/SquadraOutbound.php`, `lib/ZoneOutboundController.php`, `js/code/interventi_zone_outbound.js`, `lib/GiroZona.php`, `lib/AvvisoSquadreScoperte.php`
- codice: `lib/PianificazioneGiorno.php`, `lib/PianificazioneController.php`, `lib/GiroPrenotati.php`, `Smarty_templates/it/interventi_giornata.html`, `Smarty_templates/it/interventi_settimana.html`, `Smarty_templates/it/interventi_mappa_giorno.html`, `js/code/pianificazione_giornata.js`, `js/code/pianificazione_settimana.js`, `js/code/pianificazione_mappa.js`
- codice: `lib/UtenzaBase.php`, `lib/VistaTendinaListe.php`, `lib/json_functions.php`, `lib/Intervento.php`, `lib/GiroJob.php`
- docs: `docs/02-patterns/40-smat-squadra-segnaposto-fascia-promessa.md`
- docs: `docs/02-patterns/48-precisione-utenti-geocodifica-anomalie.md`
- docs: `docs/02-patterns/52-pianificazione-giornata-settimana-mappa.md`
- docs: `docs/03-cookbooks/28-tendina-liste-perche-una-lista-non-compare.md`
- docs: `docs/03-cookbooks/29-pianificazione-confermare-cancellare-ripianificare.md`
- docs: `docs/MAPS_ARCHITECTURE.md`
- wiki: `wiki/assistenza-clienti/selezione-mappa-pianificazione.md`
- wiki: `wiki/assistenza-clienti/pagina-pianificazione.md`
- wiki: `wiki/assistenza-clienti/modalita-pianificazione.md`
- wiki: `wiki/assistenza-clienti/pagina-admin-giro-stato-commesse.md`
- wiki: `wiki/assistenza-clienti/runbook-utenze-da-pianificare.md`
- wiki: `wiki/assistenza-clienti/runbook-assegna-utenze.md`
- wiki: `wiki/assistenza-clienti/runbook-lista-assente-tendina-piano.md`
- wiki: `wiki/pianificazione/modello-pianificazione-appuntamenti.md`
- Portolano: `smat-specifica-fasce-slot-squadre-2026-10-28`
- Portolano: `decisioni-grill-zone-tutti-tenant-2026-11-24`
- Jira: GOP-442 — copia della tendina Liste che si rinnova da sola
- Jira: GOP-459 — Calendario, pianificazione per operatore
- Jira: GOP-469 — raggruppamento di «Pianifica» su tutte le pratiche filtrate
- Jira: GOP-610 — lotti a fasce: fascia promessa e slot
- Jira: GOP-611 — squadra come segnaposto settimanale
- Jira: GOP-612 — avviso per le fasce senza operatore
- Jira: GOP-638 — durata proposta dal calendario
- Jira: GOP-656 — giro giornaliero delle attività automatiche
- Jira: GOP-684 — proposta delle fasce
- Jira: GOP-685 — costi del lotto e confronto con la penale
- Jira: GOP-756 — valori della precisione delle coordinate
- Jira: GOP-778 — pagina Giornata
- Jira: GOP-779 — pagina Settimana
- Jira: GOP-780 — pagina Mappa del giorno
