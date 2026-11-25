# 11. Utenti, ruoli e permessi

*In questo capitolo si vede che cosa decide ciò che una persona vede in GOPlanner: quattro livelli, sempre nello stesso ordine — la commessa aperta, il menu di quella commessa, il profilo, l'ambito dei dati. Si impara a invitare una persona, ad assegnarle profili e lotti, e a capire dove finisce il potere dell'amministratore e comincia quello dello staff tecnico. È scritto per gli amministratori e lo staff tecnico; i riquadri per gli sviluppatori si possono saltare.*

## Persona, accesso, commessa: chi entra in GOPlanner

Un caso inventato, per cominciare. Un nuovo Pianificatore entra per la prima volta un lunedì mattina e segnala tre mancanze: non vede il menu «Utenti», nella tendina «Operatore» mancano due operatori che i colleghi vedono, e nell'elenco delle liste mancano quelle del lotto Sud. Nessuna delle tre è un guasto, e nessuna si risolve allo stesso modo. Il menu «Utenti» manca perché il profilo «Pianificatore» non comprende la gestione degli utenti. I due operatori sono stati nascosti dalla pagina Operatori, e un operatore nascosto non compare nemmeno nella tendina di un «Amministratore cliente». Le liste del lotto Sud mancano perché il suo accesso è limitato ad altri lotti. Un profilo più alto non riporterebbe i due operatori, e gli darebbe molto più di quello che gli manca. GOPlanner decide che cosa mostrare su quattro livelli, sempre nello stesso ordine: la commessa aperta nella sessione, il menu di quella commessa, il profilo che la persona ha su quella commessa, l'ambito dei dati. La prima mancanza sta nel terzo livello, le altre due nel quarto; il capitolo li percorre tutti, in quell'ordine.

GOPlanner conosce una persona su tre livelli. Il primo è la **persona**: un'identità unica, conservata sul DB master e riconosciuta dall'email (per il DB master e per la ragione per cui le vecchie righe non sono state fuse, vedi il capitolo 2). Il secondo è l'**accesso**: il legame fra quella persona e una commessa, uno per ogni commessa, ciascuno con il suo profilo e i suoi lotti. Il terzo è l'**organizzazione**, cioè l'azienda che raggruppa più commesse e le persone che ci lavorano. Il potere di un amministratore si ferma al confine della sua organizzazione, e l'interfaccia lo dice in chiaro quando lo si supera: «Puoi accedere solo come persone i cui accessi sono tutti nella tua organizzazione.»

Si entra in due modi, che convivono senza scadenza. La pagina di accesso, intitolata «Accedi», ha i campi «Nome utente» e «Password», il pulsante «Accedi» e il collegamento «Password dimenticata?»; se la commessa ha l'accesso Google configurato, compare anche il pulsante «Accedi con Google». Gli operatori usano l'app (vedi il capitolo 8). Dopo l'accesso non c'è una schermata di scelta della commessa. GOPlanner apre l'ultima commessa scelta, ricordata per 30 giorni, se la persona può ancora entrarci; altrimenti apre la prima commessa accessibile. La commessa si cambia solo dalla tendina in alto, «Cambia commessa». La pagina di arrivo dipende dal livello della persona su quella commessa: una pagina predefinita, se impostata; altrimenti Clienti per i livelli più alti e Operatori per gli altri.

Tutto questo si legge in Utenti › «Elenco utenti», che mostra una riga per persona, non una per accesso. Le colonne:

- «Nome», «Cognome», «Email».
- «Commessa e profilo»: la commessa in cui si trova chi guarda (se la persona ci ha un accesso, altrimenti la prima in ordine di nome), il profilo su quella commessa e «+N» per le altre; passando sopra al segno compare l'elenco completo «commessa: profilo; …».
- «Tipo di accesso»: «Google», «Password», «App» («App» quando l'accesso è quello di un operatore o c'è un telefono registrato).
- «Ultimo accesso»: aggiornato a ogni ingresso riuscito, mai su un tentativo fallito; «Mai» se la persona non è ancora entrata.
- «Stato»: «Attivo», «Invitato», «Disattivato», «Da collegare».

Lo stato «Da collegare» merita una riga a sé. Indica un accesso più vecchio, creato prima delle identità e non ancora collegato a una persona; nella colonna del profilo compare «Senza identità». Continua a funzionare sulla sua commessa: quello che gli manca sono le funzioni a più commesse, non l'ingresso.

*Contro-obiezione.* «Lavoro su due commesse: mi servono due accessi diversi?» Servono due accessi, ma una sola persona e un solo ingresso. Ogni commessa è un accesso separato, con il suo profilo e i suoi lotti: la stessa persona può essere «Amministratore commessa» su una commessa e «Consultazione» sull'altra. La colonna «Commessa e profilo» le mostra tutte; prima di cambiare qualcosa, conviene guardarla per sapere su quale accesso si sta lavorando.

*Limite.* Collegare una riga «Da collegare» a una persona non si fa dall'interfaccia. I messaggi della pagina lo annunciano — «Questo utente non ha un'identità: non ha una scheda. Va prima collegato a una persona.» — ma nessuna pagina, pulsante o azione lo esegue: oggi lo fa lo staff tecnico. L'email di una persona non si corregge dall'Elenco: nella scheda è in sola lettura. E l'Elenco mostra solo le persone delle commesse che chi guarda amministra. Un collega di un'altra organizzazione non compare, per costruzione.

La persona è una; gli accessi sono uno per commessa, e ognuno ha il suo profilo.

> **Per gli sviluppatori:** `identita` e `identita_users` stanno sul DB master, in relazione N:N con `users` (una riga per commessa, che nel codice si chiama tenant). L'organizzazione è `clienti.codice_org` (codici `sg`, `easy`, `ener`). Il login passa da `LoginIdentita::avvia()` a `SessioneTenant::switchTenant()`; il cookie `cliente` dura `86400 * 30` secondi. Al primo ingresso su una commessa senza riga `users`, `SessioneTenant::creaUtenteOnDemand()` la crea (`tipo` 1 se `admin_org`, altrimenti 9). Gli stati vengono da `ElencoUtenti::stato()`.

## Profili, task e permessi: che cosa può fare un utente

*Per gli amministratori; il riquadro finale è per gli sviluppatori.*

Il profilo è la risposta alla domanda «che cosa può fare questa persona su questa commessa». Il codice lo chiama ancora «ruolo», che è il nome più vecchio e resta nel titolo del capitolo; le pagine dicono «profilo», e da qui in avanti si usa solo questa parola.

Il profilo si costruisce su tre livelli. In basso c'è il **permesso**: un'azione in un'area, con un'etichetta in italiano corrente. Il catalogo ne conta 39, raggruppati in aree come «Utenti», «Interventi», «Utenze», «Operatori», «Magazzino»; 15 sono marcati «Sensibile», per esempio «Eliminare le utenze», descritto come «Cancella definitivamente una o più utenze.» Sopra c'è il **task**, un gruppo di permessi con un nome: «Importare gli interventi», «Pianificare gli interventi», «Gestire gli appuntamenti». I task sono 37. In cima c'è il **profilo**, un insieme fisso di task. Una persona ha un solo profilo per commessa.

I profili di piattaforma sono otto, stanno nel codice e non si modificano. La tabella li elenca dal più ampio al più ristretto.

| Profilo | Che cosa può fare | Importare interventi |
|---|---|---|
| «Amministratore cliente» | Tutta l'organizzazione: tutte le commesse, gli utenti e i profili, compresa la nomina di altri Amministratori cliente | sì |
| «Amministratore commessa» | Una commessa: qualsiasi operazione e la sua configurazione, utenti e operatori compresi; non l'organizzazione, non i profili, non l'accesso come un'altra persona | sì |
| «Pianificatore» | Importa, pianifica, assegna e modifica gli interventi; abbina i telefoni a operatori esistenti, senza crearli; carica e assegna il magazzino; confronta gli operatori con la squadra | sì |
| «Call center» | Fissa gli appuntamenti e modifica le utenze, non pianifica; vede il magazzino | no |
| «Consultazione» | Solo visualizzazione di utenze, interventi, Rapporti › Verifica interventi, riepilogo e magazzino | no |
| «Consultazione esterno» | Riepilogo, verifica degli interventi eseguiti (li conferma o li respinge) e foto; per gli utenti delle committenti | no |
| «Magazziniere» | Solo la sezione Magazzino, sulle commesse con il magazzino v3 (vedi il capitolo 9) | no |
| «Tecnico» | Solo l'app: è il profilo dell'operatore | no |

Il «Magazziniere» è l'ottavo, dal 22 novembre 2026: la documentazione più vecchia ne conta ancora sette.

Quando un profilo di piattaforma non basta, l'organizzazione costruisce una **variante**. La pagina è Utenti › «Profili e varianti». Per ogni profilo mostra l'intestazione «Profilo di piattaforma · non modificabile» oppure «Variante di *profilo di base*», quante persone lo hanno e su quante commesse, e una tabella per area con le colonne «Vede», «Crea», «Modifica», «Elimina». I pulsanti sono «Crea variante», «Modifica» ed «Elimina» (solo sulle varianti) e «Confronta», che apre «Confronta profili». Una variante parte da un profilo di base («A partire da») e aggiunge o toglie task. La crea solo un «Amministratore cliente» di quell'organizzazione, oppure lo staff tecnico. Finché nessuno la ha, si può cambiare liberamente. Quando ha dei titolari si può restringere, rinominare o descrivere in un altro modo, ma non allargare: «La variante e gia assegnata: non si possono aggiungere permessi ne passare a un profilo di base piu potente senza il super-admin. Crea una nuova variante e assegnala.» Una variante assegnata non si elimina. Accanto alla variante esistono i **task aggiuntivi**, validi su un solo accesso, cioè su una sola commessa.

Il capitolo 2 parlava di un profilo amministratore «uno solo, uguale per tutte le commesse». È vero, in due sensi. I profili di piattaforma, «Amministratore cliente» compreso, sono definiti una volta sola nel codice. E il vecchio ruolo dell'amministratore, che stava in una tabella, aveva una copia per ogni commessa: le copie potevano divergere, e su una commessa se ne trovarono due vuote. Il rimedio, deciso il 29 ottobre 2026 (GOP-626), è stato una sola definizione valida su tutte le commesse; le copie vengono rifiutate con «Questo e un profilo generale, valido su tutti i tenant: assegna quello invece di crearne una copia.» («tenant» è la parola del codice per commessa). Un profilo generale lo cambia solo lo staff tecnico, e la modifica vale ovunque nello stesso momento.

Una voce di menu compare se valgono due condizioni insieme. La commessa deve avere quella pagina nel suo menu, che è configurazione della commessa decisa con lo staff tecnico; e la persona deve avere il livello o il permesso che la voce richiede. Un permesso non fa comparire una pagina che la commessa non ha. Il controllo completo è nell'ultima sezione.

### Oggi: che cosa blocca davvero

Al 25 novembre 2026 i controlli dei profili funzionano **in sola registrazione** per tutte le organizzazioni. Quando un profilo non ha un permesso, GOPlanner registra che cosa *avrebbe* rifiutato, e non rifiuta. La modalità esiste dal luglio 2026; l'accensione è prevista un'organizzazione alla volta, dopo una settimana di registrazioni senza rifiuti inattesi, ed è una decisione dello staff tecnico. Nessun ticket ne fissa la data.

Questo non vuol dire che oggi tutti possano fare tutto. Già oggi bloccano quattro cose:

- il menu della commessa;
- il **livello** dell'accesso, il numero più vecchio che il profilo scrive sull'accesso ogni volta che viene salvato. In ordine, dal più alto: «Amministratore cliente» e «Amministratore commessa» (lo stesso livello), «Pianificatore», «Call center», «Consultazione», «Magazziniere», «Consultazione esterno», «Tecnico»;
- le regole del server su inviti, profili, accessi e accesso come un'altra persona (sezioni 3 e 5), che non dipendono dall'interruttore;
- le azioni di manutenzione riservate allo staff tecnico, chiuse a tutti gli altri.

Molte voci del menu e molte azioni confrontano il livello, non il profilo, e la differenza si vede. Il menu File apre direttamente l'importazione a chi ha il livello della «Consultazione» o uno più alto: quindi anche a un «Call center» e a una «Consultazione», che nella tabella sopra hanno «no». Il messaggio «Non hai il permesso di modificare gli interventi» del capitolo 6 viene anch'esso da un controllo di livello: respinge «Magazziniere», «Consultazione esterno» e «Tecnico», e lascia passare gli altri anche se il loro profilo non comprende il permesso.

Una variante ha lo stesso livello del suo profilo di base. Per questo togliere un task da una variante può non fermare ancora l'azione: il livello è rimasto quello della base.

*Contro-obiezione.* «Ho tolto un task dalla variante, ma il collega riesce ancora a farlo.» È il comportamento atteso finché i controlli sono in registrazione. A bloccare è il livello del profilo di base, non l'elenco dei task. Se l'azione va fermata adesso, si sceglie un profilo di base più basso, oppure si chiede allo staff tecnico; la registrazione intanto mostra allo staff dove il profilo e il livello non coincidono.

*Limite.* Il catalogo ha lacune note: nessun permesso separato per creare o togliere telefoni, per creare una commessa o per creare interventi senza importarli; disattivare una persona sta dentro il permesso di modificarla. Il task «Accedere come un altro utente» esiste nel catalogo ma non viene controllato: darlo in una variante non abilita nulla. La voce «Profili e varianti» si apre solo per gli «Amministratori cliente» e lo staff tecnico: un «Amministratore commessa» riceve «Accesso negato». La pagina «Task e operazioni» non esiste ancora. Alcune commesse hanno menu configurati per livelli più vecchi, che restano configurazione della commessa.

Il profilo dice che cosa una persona può fare su una commessa; oggi lo fa valere attraverso il livello che scrive quando viene salvato.

> **Per gli sviluppatori:** `can('area.azione')` (`lib/can.php`) chiama `Rbac::gate()`, che per un'identità restituisce `$consentito || !$enforceAttivo` — sempre vero con `rbac_enforce` spento — e registra un evento `rbac_deny`. `can_tipo($p, $max)` e `can_legacy()` restituiscono il risultato sul `tipo` finché l'interruttore è spento. L'interruttore è per organizzazione in `config.inc.php` `$ORGANIZZAZIONI` (`false` per `sg`, `easy`, `ener` al 25 novembre 2026). Mappa profilo → `tipo`: 1, 1, 2, 3, 4, 8, 7, 9 (`ProfiliPiattaforma::TIPO_LEGACY`), riscritta da `AccessoCommessa::dopoCommit()` a ogni salvataggio. Catalogo in `lib/CatalogoPermessi.php`, `lib/CatalogoTask.php`, `lib/ProfiliPiattaforma.php`. Il rapporto sui rifiuti è uno strumento dello staff: vedi il capitolo 12.

## Invitare una persona e darle gli accessi

*Per gli amministratori e per chi ha il permesso di invitare e modificare gli utenti.*

Una persona nuova entra in GOPlanner in un solo modo canonico: con un invito. Non esiste l'autoregistrazione. Il lavoro si fa dal menu «Utenti» — lo staff tecnico lo vede intitolato «Admin» — alla voce «Elenco utenti». Fino al 20 novembre 2026 c'era anche la voce «Accessi alle commesse», che apriva la stessa pagina; è stata tolta (GOP-847). Gli accessi si danno dal pulsante «Accessi» e dalla scheda della persona.

### Invitare

1. Aprire Utenti › «Elenco utenti» e premere «Invita utente».
2. Compilare «Nome *», «Cognome *», «Email *».
3. Scegliere la «Commessa *»; il menu propone solo le commesse attive dell'organizzazione su cui si possono invitare e modificare gli utenti.
4. Scegliere il «Profilo *» fra quelli proposti.
5. Premere «Invia invito».

La persona riceve un'email: «Il collegamento funziona una sola volta, fino al *data* alle *ora*.» Il collegamento vale **72 ore**, cioè 3 giorni. Fino all'accettazione l'invito compare in «Inviti inviati», con la colonna «Scadenza». Se l'email non parte, la pagina lo dice: «Attenzione: non è stato possibile inviare l'e-mail di invito, ma l'invito è stato creato e può essere reinviato.»

Il modulo offre solo i profili di piattaforma, non le varianti: la variante si assegna dopo, da «Accessi». «Amministratore cliente» compare solo a chi è già «Amministratore cliente» o allo staff tecnico; «Magazziniere» solo sulle commesse con il magazzino v3. L'invito viene scritto in un'unica transazione: persona, accesso e profilo insieme, o niente.

«Reinvia invito» genera un collegamento nuovo con altre 72 ore. Il collegamento precedente smette di funzionare, e l'email lo scrive: «I collegamenti dei messaggi precedenti non sono più validi.» Nient'altro cambia. La pagina si ricarica senza un messaggio di conferma. In «Inviti inviati» ciascuno vede gli inviti che potrebbe fare oggi: lo staff tecnico tutti, l'«Amministratore cliente» quelli della sua organizzazione, gli altri quelli sulle commesse dove hanno il permesso sugli utenti.

Invitare l'email di una persona che esiste già non crea un doppione: aggiunge la commessa alla stessa persona («La commessa è stata aggiunta all'accesso già esistente per questa e-mail.»). Se la persona è già attiva, non riceve un invito ma un avviso, «Nuova commessa su GOPlanner», spedito dopo 10 minuti per raggruppare più aggiunte; la commessa compare nel selettore al prossimo ingresso. L'aggiunta viene rifiutata se la persona ha già quella commessa, se è disattivata («… riattivala prima di assegnarle un altro tenant»), se appartiene a un'altra organizzazione — il messaggio non dice quale — o se esiste un accesso più vecchio, non collegato, con la stessa email. In quest'ultimo caso il messaggio chiede di collegarlo: è il lavoro dello staff tecnico visto nella prima sezione. Alcuni di questi messaggi dicono «tenant»: è la parola del codice per commessa.

*Un caso reale.* Prima del 26 settembre 2026 il server controllava solo che la commessa dell'invito fosse nell'organizzazione di chi invitava. Bastava questo perché una persona con la sola consultazione potesse invitare sé stessa come amministratrice su ogni commessa attiva della sua organizzazione: l'invito aggiungeva la commessa, e il profilo alzava il livello. Il rimedio ha spostato tutto sul server: chi invita deve avere il permesso sugli utenti di *quella* commessa e può concedere solo profili i cui permessi ha già, mai un livello più alto del proprio. La stessa regola vale per la tendina delle commesse, per «Inviti inviati» e per «Reinvia invito», che prima non aveva alcun controllo. L'errore che si vede oggi è «Non puoi assegnare ruoli con permessi che tu non hai su questo tenant.»

Quella regola ha un nome breve, «non oltre il proprio», e vale per ogni assegnazione:

- non si danno permessi che non si hanno su quella commessa;
- non si dà un livello più alto del proprio;
- non si modifica chi ha un livello più alto del proprio;
- l'«Amministratore cliente» e lo staff tecnico non hanno tetto nel loro perimetro.

### Cambiare gli accessi

1. In «Elenco utenti» selezionare una sola riga.
2. Premere «Accessi»: si apre «Accessi per commessa», una riga per commessa.
3. Per ogni commessa scegliere il profilo, i «Permessi aggiuntivi» e i «Lotti di competenza».
4. Se serve, premere «Applica a più commesse», scegliere «Copia da» e «Applica a», poi «Applica».
5. Premere «Salva».

La finestra lo dice in apertura: «Le scelte oltre i tuoi permessi sono disattivate: nessuno assegna più di quello che ha.» «Applica a più commesse» copia profilo e permessi aggiuntivi, non i lotti, e non salva: si controlla il risultato e si preme «Salva». Il salvataggio riscrive il livello della persona su quella commessa (sezione 2). «Assegna in blocco» c'è ma è spento: «Assegnazione in blocco non ancora disponibile: gli accessi si assegnano a una persona alla volta (pulsante Accessi).»

> **Attenzione:** il pulsante «Accessi», e nella scheda «Modifica» e «+ Aggiungi commessa», compaiono solo se l'accesso di chi guarda porta il contrassegno di amministratore, oltre al permesso di assegnare i profili. Gli accessi creati con un invito nascono senza quel contrassegno. Se i pulsanti non compaiono, restano due strade: un nuovo invito alla stessa email aggiunge una commessa con il suo profilo, e la pagina Interventi › Lotti assegna i lotti (sezione 4). Per cambiare il profilo di un accesso esistente, ci si rivolge allo staff tecnico.

### La scheda della persona

La scheda si apre cliccando nome o cognome, oppure con «Scheda». Contiene tre parti:

- In alto, «Email», «Organizzazione», «Tipo di accesso», «Ultimo accesso» e la barra «Azioni sulla persona»: «Reimposta password», «Accedi come», «Disattiva» o «Riattiva». Le azioni non consentite non compaiono.
- Sotto, «Accessi alle commesse», con le colonne «Commessa», «Profilo», «Task aggiuntivi», «Lotti di competenza» e il pulsante «Modifica»; «+ Aggiungi commessa» apre una commessa nuova con le stesse regole dell'invito.
- In fondo, il pannello «Cosa può fare su *commessa*», usato nella sezione 6.

«Disattiva persona» impedisce l'ingresso su tutte le commesse ma conserva accessi e profili: «Riattiva» restituisce la stessa persona. «Reimposta password» (nell'Elenco il pulsante si chiama «Reset password») invia la stessa email di «Password dimenticata?», con un collegamento valido un'ora. Lo storico non è nella scheda. È il pulsante «Storico» dell'Elenco, che apre «Storico delle modifiche» con «Quando», «Chi», «Commessa», «Cosa è cambiato», fino a 200 righe.

*Contro-obiezione.* «L'invito è scaduto, oppure la mail non è arrivata.» Si guarda prima la cartella della posta indesiderata, poi l'indirizzo in «Inviti inviati», poi si preme «Reinvia invito». Un indirizzo sbagliato non si corregge reinviando: l'email ripartirebbe verso lo stesso indirizzo.

*Limite.* L'indirizzo di un invito in sospeso non si cambia dalla pagina: serve l'assistenza GOPlanner. La matrice persone × commesse e l'invito su più commesse con l'anteprima dei permessi sono previsti, non attivi. Nel codice restano altri cinque modi più vecchi di creare un accesso, e quattro producono righe senza persona, cioè i «Da collegare»: il modo giusto è l'invito.

Una persona entra con un invito; commesse e profili si cambiano da «Accessi»; nessuno può dare più di quanto ha.

> **Per gli sviluppatori:** `InvitoUtente::crea()` è il percorso canonico di creazione (transazionale, con i controlli RBAC); `reinvia()`, `invitiVisibili()`, `tenantInvitabili()`. Durata del token: `TokenUtente` `SCOPO_INVITO` 259200 s. Mai inserire direttamente in `goplanner.users`: un accesso senza identità è invisibile al modello dei profili (vedi il capitolo 2).

## Lotti di competenza e ambito dei dati: quali righe vede un utente

Il permesso dice quali azioni si possono fare. L'ambito dei dati dice su quali righe, e da quale stato in poi. Due persone con lo stesso profilo sulla stessa commessa possono vedere liste diverse perché hanno lotti di competenza diversi. Il lotto come oggetto — che cos'è, come si crea, il «Valore nel carico» — è nel capitolo 3; qui conta solo chi lo vede.

### Limitare un utente a certi lotti

Dalla pagina dei lotti:

1. Aprire Interventi › Lotti.
2. Selezionare il lotto e premere «Edit».
3. Nella sezione degli utenti di competenza, che compare in inglese come «Users of competence», scegliere la persona e premere «Aggiungi».
4. Per togliere una persona, usare il collegamento «Remove» accanto al suo nome.

Le scritte in inglese sono note e non indicano un errore.

Dalla persona, se il pulsante «Accessi» compare (vedi il riquadro della sezione 3):

1. In «Elenco utenti» selezionare la riga e premere «Accessi», oppure nella scheda premere «Modifica» sulla commessa.
2. Nella sezione «Lotti di competenza» spuntare i lotti.
3. Premere «Salva».

La regola sta in tre righe, ed è scritta anche sotto la sezione della pagina Lotti: «Gli utenti senza lotti assegnati vedono tutti i lotti della commessa».

- Nessun lotto: la persona vede tutti i lotti.
- Il primo lotto assegnato: la persona vede solo quello.
- Tolto l'ultimo: la persona torna a vedere tutto.

La pagina Lotti chiede conferma ai due bordi: «Questo utente oggi vede tutti i lotti della commessa: aggiungendolo vedra' solo questo lotto. Confermi?» e «E' l'ultimo lotto dell'utente: senza lotti vedra' tutti i lotti della commessa. Confermi?». La finestra «Accessi», invece, salva le spunte senza chiedere niente. Si assegnano solo lotti che si vedono, e solo con il permesso di assegnare i profili: chi ha un perimetro ristretto non può nemmeno azzerare i lotti di un altro.

Il filtro dei lotti vale per le pagine costruite sui carichi: l'elenco Clienti, Interventi › Lista, la verifica degli interventi, la griglia dei carichi, la pianificazione, il cruscotto operatori, la tendina delle liste (con la sua cache di un'ora: vedi il capitolo 3). Nei registri di importazione ed esportazione restano visibili anche le righe senza lotto. Gea rispetta gli stessi lotti; le sue interrogazioni libere sono riservate a chi vede tutti i lotti. Quando parla di importazioni ed esportazioni, Gea chiama «un collega» chi le ha fatte; il nome lo dice solo agli amministratori e allo staff tecnico, e solo se lo chiedono esplicitamente.

*Contro-obiezione.* «Ho dato al collega il lotto Nord e adesso non vede più le liste di prima.» È la regola: il primo lotto restringe. Si aggiungono gli altri lotti che gli servono, oppure si toglie l'ultimo per riaprire tutto.

Oltre ai lotti, ogni profilo porta un ambito. La scheda della persona lo mostra in fondo al pannello «Cosa può fare su *commessa*», sotto «Ambito dei dati». Le soglie sono espresse con numeri di stato; qui sono tradotte nei nomi del capitolo 6, dove 3 è Assegnato e 5 è Non fattibile.

| Profilo | Che cosa limita l'ambito |
|---|---|
| «Amministratore cliente», «Amministratore commessa», «Pianificatore» | nessun limite |
| «Call center», «Consultazione» | in Verifica interventi solo gli interventi da Eseguito in poi |
| «Consultazione esterno» | solo le proprie utenze; in Verifica da Eseguito in poi; in Verifica foto da Controllato in poi |
| «Magazziniere» | Verifica da Eseguito in poi; Verifica foto da Controllato in poi |
| «Tecnico» | nell'elenco operatori solo il proprio; Verifica da Eseguito in poi; Verifica foto da Controllato in poi |

Due commesse usano per la Verifica una soglia diversa, da Non fattibile in poi. La stessa persona può quindi vedere in Verifica righe diverse su due commesse per due ragioni: la soglia della commessa, oppure il profilo diverso che ha su ciascuna.

Le tendine «Operatore» seguono una regola a tre rami. Lo staff tecnico vede tutti gli operatori. Il profilo «Tecnico» vede solo il proprio operatore. Tutti gli altri, «Amministratore cliente» compreso, vedono gli operatori **attivi** e **non nascosti**. Un operatore che manca dalla tendina, quindi, è spesso disattivato o nascosto, prima ancora che un problema di permessi: lo si sistema dalla pagina Operatori (vedi il capitolo 8). La tendina resta in cache fino a un'ora e si rinnova quando cambia il numero degli operatori.

*Limite.* Eliminare un lotto dalla pagina Lotti non chiede conferma e non si annulla: il lotto sparisce con tutte le sue assegnazioni, e chi resta senza lotti torna a vedere tutto. Ogni persona coinvolta riceve una riga nello storico, «Lotto N eliminato o spostato: tolto dai lotti di competenza». Per un lotto che non serve più esiste la colonna «Attivo». I lotti configurati nei file della commessa valgono ancora come ripiego per chi non ha lotti salvati sul DB master. E finché i controlli sono in registrazione l'ambito segue il livello, non il profilo: il pannello «Ambito dei dati» mostra quello del profilo, e per una persona mai risalvata da «Accessi» può non coincidere con quello che si applica. Infine, per la «Consultazione esterno» il pannello «Ambito dei dati» scrive «Non li vede» alla riga «Operatori nelle tendine»; oggi però la tendina le compare lo stesso, con gli operatori attivi e non nascosti.

Il permesso dice che cosa si può fare; i lotti e l'ambito dicono su quali righe. Il primo lotto restringe, l'ultimo tolto riapre tutto.

> **Per gli sviluppatori:** i lotti si risolvono in ordine da `identita_users_lotti`, poi dal CSV `identita_users.lotti`, poi da `$custom['users'][login]['lotti']`; vuoto = nessun limite (`User::getLotti()`, `lib/LottiCompetenza.php`). L'ambito viene da `ambito_dati()` / `Rbac::ambito()`; con l'interruttore spento si applica `AmbitoDati::daTipo()` e le differenze diventano eventi `rbac_ambito_divergenza` (vedi il capitolo 12). Tendina operatori: `User::getOperatori()` e `JSONController::operatori_select()`.

## Amministratori e staff tecnico: dove finisce il potere di ciascuno

*Per gli amministratori e lo staff tecnico.*

Tre figure possono cambiare quello che le persone vedono, e nessuna può tutto. La tabella le confronta sulle azioni che le fonti confermano.

| Azione | «Amministratore commessa» | «Amministratore cliente» | staff tecnico |
|---|---|---|---|
| Assegnare profili | sì, entro il proprio tetto | sì, senza tetto nell'organizzazione | sì |
| Nominare un altro «Amministratore cliente» | no | sì | sì |
| Creare e modificare varianti | no | sì, nella sua organizzazione | sì |
| Allargare una variante che ha titolari | no | no | sì |
| Cambiare un profilo generale | no | no | sì |
| Accedere come un'altra persona | no | sì, nella sua organizzazione | sì |
| Vedere tutte le commesse dell'organizzazione | no | sì | sì |
| Aprire gli strumenti del menu Admin | no | no | sì |
| Azioni di manutenzione riservate | no | no | sì |
| Accendere i controlli per un'organizzazione | no | no | sì (decisione) |

L'azione con più conseguenze è l'accesso come un'altra persona: nell'Elenco il pulsante si chiama «Impersona», nella scheda «Accedi come». La possono usare solo lo staff tecnico e gli «Amministratori cliente». Lo staff tecnico può entrare come chiunque tranne un altro membro dello staff; l'«Amministratore cliente» solo come persone i cui accessi stanno tutti nella sua organizzazione. Mentre si opera come un'altra persona, GOPlanner applica le sue commesse e i suoi permessi, non i propri. Una barra rossa resta in cima a ogni pagina, «Stai operando come *nome cognome*», con il collegamento «Torna al tuo accesso». Inizio e fine vengono registrati con entrambe le identità, e la fine con la durata. I rifiuti sono cinque, e il server li dà testualmente:

- «L'accesso come un'altra persona è riservato agli Amministratori cliente.»
- «Non è possibile accedere come un super-admin.»
- «Puoi accedere solo come persone i cui accessi sono tutti nella tua organizzazione.»
- «Stai già operando con il tuo accesso.»
- «Stai già operando come un'altra persona: torna prima al tuo accesso.»

Il secondo nomina il «super-admin» perché è il testo del messaggio: nella guida quella figura è lo staff tecnico.

Alcune guardie valgono per tutti, staff compreso. Ogni organizzazione conserva almeno un «Amministratore cliente» attivo: se un cambio di profilo, una disattivazione, l'eliminazione di una variante o la revoca della nomina ad amministratore dell'organizzazione lo toglierebbero, il server risponde «Serve almeno un Amministratore cliente attivo per l'azienda.» Un amministratore invitato che non ha ancora accettato conta come attivo. La guardia non dipende dall'interruttore dei controlli, e non ha un'eccezione di piattaforma. I profili, poi, li creano e li cambiano solo l'«Amministratore cliente» della stessa organizzazione o lo staff tecnico. Altrimenti chi detiene un profilo potrebbe riscriverne i permessi e concederseli da solo. L'«Amministratore commessa» non ha né la gestione dei profili né l'accesso come un'altra persona.

Il menu in alto ha un nome diverso per chi lo apre. Lo staff tecnico lo vede come «Admin», con i gruppi Clienti, Diagnostica, Strumenti e Sistema; un amministratore lo vede come «Utenti», con le sole voci «Elenco utenti» e «Profili e varianti». È la stessa voce del menu: gli strumenti restano dello staff, l'amministratore ne vede solo la parte sulle persone. Le azioni di manutenzione dello staff rispondono a chiunque altro «User not allowed», con il codice 403, e nessun profilo le sblocca (vedi il capitolo 12 per gli strumenti).

*Un caso reale.* Un «Amministratore cliente» entrava su una commessa e ci arrivava come operatore. La causa: il suo accesso a quella commessa era più vecchio della sua nomina ad amministratore dell'organizzazione. Il livello veniva impostato solo all'ingresso, e nessuno lo aveva riallineato quando la nomina era arrivata. Il rimedio: oggi la nomina impone il livello di amministratore nei quattro punti in cui GOPlanner risolve la persona, cioè l'ingresso, il cambio di commessa, la creazione automatica dell'accesso e l'aggiunta di una commessa con l'invito.

*Limite.* La tabella descrive i profili, non tutti i pulsanti. Oltre al riquadro della sezione 3 sul pulsante «Accessi», c'è un secondo caso: la voce «Elenco utenti» e il pulsante «Invita utente» chiedono oggi anche un permesso del vecchio sistema dei ruoli, che l'«Amministratore cliente» ha sempre e i profili di piattaforma non contengono. Un «Amministratore commessa» che non li trova lo chiede allo staff tecnico. Lo staff tecnico sta fuori dal modello dei profili: è un'eccezione nel codice, non un profilo, e non si descrive con la tabella della sezione 2. I menu personalizzati per livello di alcune commesse restano configurazione della commessa. E nessun permesso dato in una variante trasforma un amministratore in staff tecnico.

> **Quando chiedere allo staff tecnico:** un indirizzo sbagliato su un invito in sospeso; una riga «Da collegare»; i pulsanti «Accessi» o la voce «Elenco utenti» che a un amministratore non compaiono; una pagina che manca dal menu della commessa; allargare una variante che ha titolari; cambiare un profilo generale; persone e commesse di un'altra organizzazione; gli strumenti del menu Admin e le azioni di manutenzione; la domanda «quando si accendono i controlli dei profili per la mia organizzazione».

> **Per gli sviluppatori:** il super-admin globale è l'identità collegata a `users.id = 1`, `tipo` 0, fuori da `ruoli_permessi`, con il bypass in `Rbac::valuta()`. `identita.admin_org = 1` implica `tipo = 1`, mai 0. `AdminRequestGuard::denyUnlessCanUseJsonAdmin()` lascia passare `json_admin.php` solo a `tipo === 0` o al super-admin. `RuoloService::puoModificare()` / `puoCreare()`; `Impersonazione::puoImpersonare()`, eventi `impersonation_start` / `impersonation_end`; guardia in `lib/UltimoAmministratoreCliente.php`.

## Quando un utente non vede qualcosa: le quattro domande

Un collega scrive «non vedo il menu», o la lista, o l'operatore, o l'intervento. La regola è controllare i livelli in ordine, perché ognuno nasconde tutto quello che sta sotto: il primo «no» è la causa. Prima ancora dei quattro livelli c'è la persona stessa.

0. **La persona.** In «Elenco utenti», colonna «Stato»: «Invitato» vuol dire che non ha accettato («Reinvia invito»); «Disattivato» si risolve con «Riattiva persona»; «Da collegare» va allo staff tecnico.
1. **La commessa.** Il collega è sulla commessa che crede? Lo dice la tendina in alto e, nell'Elenco, «Commessa e profilo».
2. **Il menu della commessa.** La commessa ha quella pagina? Si confronta con un collega che sulla stessa commessa ha più diritti; se non la vede nessuno, è configurazione, e la cambia lo staff tecnico.
3. **Il profilo.** Che profilo ha la persona su questa commessa, e comprende il permesso? Si guarda la scheda, nel pannello «Cosa può fare su *commessa*», dove ogni task porta l'origine («Dal profilo», «Aggiunto dalla variante», «Aggiunto a questo accesso», «Tolto dalla variante»); per confrontare due profili, «Profili e varianti» › «Confronta». Oggi però a bloccare è il livello, che il profilo scrive quando l'accesso viene salvato: un accesso mai salvato da «Accessi» può avere ancora il livello di prima, e va risalvato (dallo staff tecnico, se il pulsante non compare).
4. **L'ambito.** Lotti di competenza (colonna della scheda), operatore attivo o nascosto, soglia di stato del profilo (sezione 4).

La tabella raccoglie i sintomi più frequenti. Ogni riga finisce su una causa che riguarda la persona; la diagnosi delle commesse è nel capitolo 2.

| Sintomo | Prima domanda | Dove si guarda | Chi interviene |
|---|---|---|---|
| Manca il menu «Utenti» | profilo | scheda, «Cosa può fare su *commessa*» | amministratore o staff tecnico |
| Manca una lista in Interventi | ambito (lotti) | «Lotti di competenza» nella scheda | amministratore |
| Manca un operatore nella tendina | ambito (attivo, nascosto) | pagina Operatori | amministratore (capitolo 8) |
| Verifica vuota per un utente «Consultazione» | ambito (soglia di stato) | «Ambito dei dati» | nessuno: è la regola |
| Un collega non compare nell'Elenco | commessa | altra organizzazione, o commessa che non si amministra | staff tecnico |
| Manca «Invita utente» | profilo | permesso sugli utenti | staff tecnico |
| Manca una pagina intera su una commessa | menu della commessa | confronto con un collega | staff tecnico |

Gea può aiutare su due casi: spiega perché una lista non compare nella tendina e controlla se un operatore è attivo, nascosto e a chi è collegato. Risponde con i permessi di chi chiede (vedi il capitolo 10).

*Contro-obiezione.* «Al collega ho dato lo stesso profilo che ho io, ma vede meno cose.» Lo stesso profilo non vuol dire lo stesso ambito. Il collega può avere lotti di competenza che restringono, oppure stare su un'altra commessa, dove profilo e lotti sono diversi: entrambi valgono per commessa, non per persona. Si confronta la riga della commessa nella scheda di tutti e due.

*Limite.* Il controllo si ferma al confine dell'organizzazione: l'amministratore vede solo le commesse che amministra. La registrazione di quello che i controlli avrebbero rifiutato non è visibile all'amministratore; la legge lo staff tecnico, con le pagine Admin e i registri degli errori (vedi il capitolo 12). Il pannello «Ambito dei dati» può non dire l'ambito che si applica oggi (sezione 4). E dopo un cambio di lotti una lista può tardare a ricomparire nella tendina per la cache di un'ora (capitolo 3).

> **Per gli sviluppatori:** permessi effettivi da `AccessoCommessa::permessiEffettivi()` / `Identita::getPermessi()`; perimetro dell'Elenco da `ElencoUtenti::commesseInAmbito()`. I controlli rifiutati diventano `rbac_deny` con `esito: loggato` (rapporto `scripts/rbac_report_negazioni.php`: vedi il capitolo 12). Regola della tendina delle liste: `docs/03-cookbooks/28-tendina-liste-perche-una-lista-non-compare.md`. Le voci del menu in alto: `$MENU['<voce>']` in `custom/<tenant>/config.inc.php` più un `can_tipo()` per voce (`Smarty_templates/it/_header.html`).

Davanti a un «non vedo» la mossa più rapida è un profilo più alto, e spesso è quella sbagliata. A volte non basta: un operatore nascosto resta nascosto anche all'«Amministratore cliente». Altre volte dà al collega molto più di quello che gli mancava, su tutta la commessa. L'accesso giusto è il più piccolo che toglie il primo «no» trovato: un lotto in più prima di un profilo nuovo, un operatore riattivato prima di un permesso. E finché i controlli dei profili restano in sola registrazione, quello che una persona non deve fare si affida al profilo di base, cioè al livello che il salvataggio scrive, e non a un task tolto da una variante.

## Fonti

- codice: `lib/ElencoUtenti.php`, `pages/utenti.php`, `lib/JSONController.php`, `js/code/utenti_elenco.js`, `js/code/utenti_scheda.js`, `js/code/utenti_accessi.js`
- codice: `lib/LoginIdentita.php`, `lib/SessioneTenant.php`, `json.php`, `Smarty_templates/it/login_new.html`, `Smarty_templates/it/_header.html`
- codice: `lib/ProfiliPiattaforma.php`, `lib/CatalogoTask.php`, `lib/CatalogoPermessi.php`, `lib/AccessoCommessa.php`, `lib/VariantiProfilo.php`, `lib/GestioneProfili.php`, `lib/RuoloService.php`, `js/code/profili.js`
- codice: `lib/Rbac.php`, `lib/can.php`, `lib/Organizzazione.php`, `config.inc.php`, `lib/AdminAreaUtenti.php`, `lib/MenuAdmin.php`, `lib/AdminRequestGuard.php`
- codice: `lib/InvitoUtente.php`, `lib/TokenUtente.php`, `lib/NotificaNuovaCommessa.php`, `lib/StatoPersona.php`, `lib/AccessLog.php`, `Smarty_templates/it/crea_invito.html`
- codice: `lib/AmbitoDati.php`, `lib/LottiCompetenza.php`, `lib/LottoService.php`, `lib/User.php`, `lib/SchedaUtente.php`, `Smarty_templates/it/lotti.html`
- codice: `lib/Impersonazione.php`, `lib/UltimoAmministratoreCliente.php`
- docs: `docs/02-patterns/25-identita-centralizzata-e-rbac.md`, `docs/02-patterns/32-creazione-utenti-percorsi-e-metodo-canonico.md`, `docs/02-patterns/42-profili-generali-unica-definizione.md`, `docs/03-cookbooks/30-rapporto-negazioni-rbac.md`, `docs/03-cookbooks/31-ambito-dati-rbac.md`, `docs/03-cookbooks/28-tendina-liste-perche-una-lista-non-compare.md`, `docs/plan_identita_centralizzata_rbac.md`
- wiki: `wiki/assistenza-clienti/pagina-utenti-elenco.md`, `wiki/assistenza-clienti/reinvia-invito-utente.md`, `wiki/assistenza-clienti/pagina-lotti.md`, `wiki/assistenza-clienti/pagina-admin-menu.md`, `wiki/assistenza-clienti/diagnostica-visibilita-operatore.md`, `wiki/assistenza-clienti/runbook-attivita-utente.md`
- Portolano: `gea-guida-reinvia-invito-utente`, `gop-138-afaead30733df0e7adf50ec1`
- Jira: GOP-112 — Rbac::can() e gate in modalità log-only
- Jira: GOP-290 — login senza schermata di scelta della commessa
- Jira: GOP-572 — task e profili di piattaforma definiti nel codice
- Jira: GOP-577 — impersona utente con barra di ritorno e registro
- Jira: GOP-579 — registro modifiche degli accessi e storico
- Jira: GOP-581 — rapporto sulle negazioni e interruttore del controllo
- Jira: GOP-582 — lotti di competenza per utente e commessa
- Jira: GOP-597 — almeno un Amministratore cliente attivo per organizzazione
- Jira: GOP-626 — profili generali con gli stessi permessi su tutte le commesse
- Jira: GOP-668 — scheda utente con accessi e permessi effettivi
- Jira: GOP-847 — voce «Accessi alle commesse» rimossa dal menu
- Jira: GOP-855 — profilo Magazziniere e postazione del back office
