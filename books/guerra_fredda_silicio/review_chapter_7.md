# Review — Capitolo 7: La Frammentazione della Catena: Il Progetto Silicon Saxony

## 1. Executive Summary

Il capitolo con la tesi più difficile del libro — dimostrare che una fab reale, con cemento vero e gru vere, può aumentare la resilienza senza produrre sovranità — e la esegue quasi tutta. L'architettura ad audit di polizza regge dal cronometro sotto il tendone fino alla franchigia finale; il paradosso «per decentralizzare da Taiwan bisogna concentrarsi a Dresda» è l'idea originale che giustifica il capitolo; il paragrafo sull'OSAT (nessun ministro taglierà mai il nastro di un impianto di back-end) è la cosa migliore scritta finora sul reshoring europeo. La traduzione tecnica per il lettore generale è la più pulita del libro: airbag in tre millisecondi, matrimonio contro venticinquesimo anniversario, WSPM smontato in una riga.
Poi c'è il problema, ed è grave perché colpisce esattamente il muscolo che questo capitolo dichiara di allenare. Un capitolo il cui metodo è «ricalcolate voi la percentuale» conteneva **tre errori di verifica**: un'aritmetica sbagliata di un fattore due copiata dal dossier senza rifare la divisione (480.000 su 15 milioni non fa «meno dell'1,5%», fa 3,2%); un benchmark internazionale costruito su milestone disomogenee — 22 mesi *da terra a taglio del nastro* di Kumamoto contro 38 mesi *da terra a primo wafer* di Dresda — cioè precisamente l'errore che il beat 1 insegna a non fare; e un'attribuzione causale («la burocrazia europea allunga i tempi del 70%») che nessuna fonte scompone. In più la chiusura, l'immagine su cui si congeda il lettore, era tecnicamente impossibile: l'HTOL AEC-Q100 si esegue su componenti incapsulati, non su un wafer da 300 millimetri — e il capitolo stesso, quattro pagine prima, aveva spiegato che l'incapsulamento in Europa non c'è.
Tutto corretto in questa review. La quarta obiezione prevista dalla struttura (beneficio marginale rispetto alle fab europee già esistenti) mancava del tutto ed è stata scritta.

## 2. Score: 44/60 → REVIEWER_CORRECTIONS

| Dimensione | Punteggio |
|---|---|
| Narrativa & Struttura | 8/10 |
| Lingua, Stile & Voce | 7/10 |
| Accuratezza Fattuale | 5/10 |
| Allineamento al Pubblico | 9/10 |
| Coinvolgimento Sensoriale & Emotivo | 7/10 |
| Originalità & Angolazione | 8/10 |
| **Totale** | **44/60** |

---

## 3. Detailed Findings by Section

### 3.1 L'aritmetica sbagliata dentro il capitolo sull'aritmetica — **CRITICO (corretto)**

Testo consegnato:

> «480.000 wafer l'anno rappresentano, per stessa ammissione delle specifiche tecniche del progetto, meno dell'1,5% della capacità globale di fonderia di TSMC, che supera i 15 milioni di wafer equivalenti da 300 millimetri l'anno.»

480.000 ÷ 15.000.000 = 3,2%. La frase contiene i due numeri che la smentiscono, a nove parole di distanza l'uno dall'altro. L'errore è ereditato dal dossier (`dossier_chapter_7.md` §42, fonte dichiarata «ESMC Technical Specification & Industry Output Ratio», che non è una fonte ma un'etichetta), e il Writer l'ha trascritto senza rifare la divisione.

Il danno non è la percentuale in sé: è che questo è il capitolo che chiede al lettore di ricalcolare i 43 miliardi, di separare autorizzato da erogato, di diffidare dei denominatori. Un lettore con una calcolatrice — cioè il lettore che il PRD descrive — trova l'errore in dieci secondi e smette di fidarsi di tutto il resto.

Corretto trasformando il difetto in prova a carico: la scheda tecnica sbaglia *nella direzione che rende ESMC più piccola e meno discutibile*, ed è esattamente il tipo di refuso che nessuno ha interesse a correggere.

### 3.2 Il benchmark Kumamoto: due orologi diversi — **CRITICO (corretto)**

Testo consegnato:

> «Kumamoto: cantiere avviato ad aprile 2022, inaugurazione il 24 febbraio 2024, produzione di massa entro fine 2024 — 22 mesi da terra a taglio del nastro […]. Dresda: cantiere avviato ad agosto 2024, produzione pilota non prima di fine 2027 — oltre 38 mesi, quasi il doppio.»

Il capitolo si apre con questo insegnamento:

> «groundbreaking non è "costruzione completata"; costruzione completata non è "tool move-in" […] Chiamarle tutte "l'apertura della fab" è come chiamare matrimonio sia il primo appuntamento sia il venticinquesimo anniversario di nozze.»

E poi confronta il taglio del nastro di Kumamoto con il primo wafer di Dresda. È lo stesso errore, commesso dal capitolo che lo condanna, nel paragrafo che dovrebbe essere il suo climax analitico. Sul traguardo omogeneo — da terra a produzione — Kumamoto sta a 32 mesi (aprile 2022 → fine 2024) e Dresda a circa 40 (agosto 2024 → pilota fine 2027). Il divario resta reale e va detto; «quasi il doppio» no.

Secondo difetto nello stesso paragrafo:

> «In Sassonia, permessi ambientali europei, ricorsi amministrativi, tutela del riposo dei lavoratori e complessità degli appalti pubblici dell'Unione allungano i tempi industriali di circa il 70% rispetto al benchmark giapponese.»

Quel «70%» non è una misura: è la differenza tra due date disomogenee, riattribuita per intero a una causa scelta in anticipo. Il dossier lo presenta come «Risoluzione forense» (riga 99) senza alcuna fonte che scomponga i mesi per causa. È il tipo di numero che circola perché fa comodo a chi ha già deciso di deregolamentare — e questa persona, di mestiere, quel tipo di numero lo smonta, non lo cita.

Riscritto su tre paragrafi: milestone omogenee, confronto sulla quota di sussidio (METI ~40% del capex a Kumamoto contro il *fino a* ~50% tedesco — l'Europa non paga di meno, paga più tardi), e rifiuto esplicito dell'attribuzione causale non misurata.

### 3.3 La terza casella dell'audit, asserita per inferenza — **IMPORTANTE (corretto)**

> «Il metodo di verifica, allora, sta in cinque caselle […]. **A oggi Dresda ha riempito le prime due.**»

Nessuna fonte del dossier dice quanto sia stato erogato al 3 settembre 2026. La struttura elencava `aiuto fino a 5 miliardi autorizzato` vs `tranche realmente erogate` tra i conflitti da **preservare**, non da risolvere per deduzione. E l'inferenza è per giunta implausibile: con fondazioni, Richtfest di gennaio 2026 e tetto stagno, un sussidio a tranche legate a stati di avanzamento collaudati ha quasi certamente liquidato qualcosa.

La casella tre è la sola che permetta a un contribuente di giudicare, ed è l'unica che nessuno pubblica. Quella è la notizia. Riscritto per dirla.

### 3.4 La chiusura tecnicamente impossibile — **CRITICO (corretto)**

> «Nella cleanroom di prova di ESMC, quando arriverà, un wafer da 300 millimetri entrerà nella camera di test climatico e dovrà resistere a 125 gradi Celsius per 1.000 ore filate senza un solo guasto.»

Un wafer non si qualifica. L'HTOL AEC-Q100 si esegue su componenti incapsulati e montati su supporto — il dossier stesso (§SHADOW 6) dice «i chip automotive di prova», ed è il Writer ad averlo convertito in wafer. Per un ingegnere elettronico narrante, chiudere il capitolo su un test che non esiste è il difetto peggiore possibile: incrina retroattivamente ogni pagina tecnica precedente.

Peggio: l'errore *spreca* la migliore ironia disponibile. Quel wafer, per diventare la prova che i cinque miliardi funzionavano, deve prima farsi incapsulare dove l'Europa ha meno del 5% della capacità mondiale — cioè in Asia. La cerimonia vera di questo progetto si tiene in una camera climatica che non sta in Sassonia. La chiusura riscritta usa questo, e salda l'anello OSAT invece di contraddirlo.

### 3.5 L'obiezione mancante — **IMPORTANTE (aggiunta)**

La struttura ne chiedeva cinque nella forma più forte. Presenti: la 1 (fab taiwanese pagata dai tedeschi), la 2 (12–28 nm non danno sovranità), la 4 (con Dresda l'Europa fa a meno di Taiwan), la 5 (costo sproporzionato, via Gropp e Fuest). **Assente la 3**: quale beneficio marginale ESMC porti rispetto alle fab europee che già esistono.

È l'assenza più costosa, perché il capitolo aveva già in mano tutti i dati per rispondere e non li ha usati: GlobalFoundries Fab 1 lavora oltre 400.000 wafer l'anno su 28/40/55 nm a tre chilometri di distanza, Bosch e Infineon fanno automotive nello stesso codice postale. Un lettore attento arriva a fine capitolo chiedendosi: e allora perché cinque miliardi? La risposta esiste ed è nel dossier — la Commissione classifica ESMC come primo impianto *first-of-a-kind* a tecnologia FinFET su fonderia pura dell'Unione: quella classe di processo, in Europa, non è disponibile in nessuna fonderia aperta a terzi. Paragrafo aggiunto.

### 3.6 Ripetizione verbatim nel beat 6 — **IMPORTANTE (corretto)**

> «Sul fronte delle infrastrutture, il conto è già scritto, **e vale la pena ripeterlo** in chiave umana e non tecnica: 300 milioni di euro per un nuovo impianto idrico, 100 dei quali dal bilancio del Land e 50 dal bilancio della città di Dresda; una linea elettrica da 380 kV su 92 chilometri di tralicci.»

Gli stessi identici numeri comparivano tre sezioni prima. La STYLE_BIBLE è categorica: «Nessun paragrafo può limitarsi a ripetere un punto già fatto». Che il testo dichiari di star ripetendo non è un'attenuante, è la confessione.

Sostituito con il calcolo che il capitolo doveva a chi paga: 5 miliardi ÷ 2.000 posti = 2,5 milioni a posto di lavoro (ottima per un titolo indignato, sbagliata come misura — una fab si compra per la capacità, non per assumere), quindi il denominatore onesto, 5 miliardi ÷ 480.000 wafer/anno ≈ 10.400 euro pubblici per wafer di capacità annua, 21.000 sull'investimento complessivo. La struttura autorizzava esplicitamente il rapporto «se il rapporto viene usato, dichiararne il limite».

### 3.7 Difetti tecnici minori — **corretti**

- «Bastano scanner DUV, a immersione da 193 nanometri o *dry* da 248 **e 365**.» I 365 nm sono la i-line, lampada a vapori di mercurio: ultravioletto profondo non è. Un errore che nessun lettore generale nota e ogni ingegnere sì — cioè il peggior tipo di errore per una persona che si presenta come ingegnere. Riscritto e trasformato in battuta sulla vecchia guardia che incide senza fare notizia.
- «il Bureau of Industry and Security continua a decidere a chi quei wafer possono essere venduti». Sovraestensione: le FDPR governano le vendite verso soggetti in Entity List, non l'intera lista clienti di ESMC — e la struttura avvertiva «senza dichiarare automaticamente bloccata una fab europea». La versione precisa è anche più tagliente: Washington non approva i contratti, decide unilateralmente e può cambiare domani mattina l'elenco di chi è fuori.
- Target 20%: «quadruplicare il fatturato dell'industria continentale a 200 miliardi l'anno» — valuta assente in un capitolo che alterna euro e dollari. Esplicitata.
- ASML: rimossa la precisione «22,0 gradi con tolleranza di cinque centesimi», la cui unica fonte dossier è un «ASML DUV Immersion System Manual» non pubblico. Le 35 tonnellate bastano e sono verificabili.

### 3.8 Fonti [SHADOW] a rischio — **segnalato, non correggibile in review**

Quattro dei dettagli sensoriali più cinematografici poggiano su attribuzioni di una riga che non sono documenti citabili: «Cronaca Cantiere ESMC Dresden, Estate 2026 (oiger.de)» per le autogru; «Bürgerinformation Welcome Center ESMC, 2 settembre 2026» per il tabellone e la vetrina; «Rapporto Geotecnico e Vibrazionale Airportpark Dresden-Rähnitz»; «TU Dresden Leonardo Office / Testimonianze STIPT Taichung» per la bunny suit. La struttura chiedeva «una fonte primaria ESMC/TSMC **e** una verifica indipendente locale o industriale per ogni affermazione sullo stato dei lavori»: per lo stato del cantiere estivo 2026 quella doppia verifica non c'è. I dettagli restano nel testo perché plausibili e non decisivi per la tesi, ma vanno verificati prima della pubblicazione o sostituiti con dettagli documentati. **Da girare al Ricercatore.**

### 3.9 Quello che funziona e non va toccato

- L'apertura: il cronometro che parte sotto il tendone, e le quattro pale d'argento che non possono accelerare un ciclo di qualifica. Hook corretto, promessa mantenuta a 6.000 parole di distanza.
- Il paradosso della concentrazione (§3): è la tesi originale del capitolo e regge da sola il confronto con Chris Miller.
- L'onestà sul cantiere reale: «il cantiere di Dresda non è il lotto vuoto di Klaipėda». La struttura chiedeva di non riciclare il contrasto del cap. 6 e di non emettere un verdetto precotto: entrambe rispettate.
- Il paragrafo OSAT: «Nessun ministro taglierà mai il nastro di un impianto di *back-end*: non ha cleanroom fotogeniche […] Indovinate quale dei due la politica industriale europea ha finanziato per primo.» Persona perfetta.
- La distinzione resilienza / sovranità / autarchia: il lascito trasferibile del capitolo, il pezzo che il lettore può usare a cena il giorno dopo.
- Il trattamento della carenza 2021 (210 miliardi di dollari, 7,7 milioni di veicoli) come prova che i nodi maturi fermano le fabbriche: risponde all'obiezione 2 nella sua forma forte senza fare il tifo.

---

## 4. Persona Audit

**Verdetto: la persona regge, la sua andatura no.**

Il registro è quello giusto e in diversi punti è il migliore del libro. «Ah, saperlo prima di stampare lo slogan sul comunicato»; «non per coincidenza astrale: le cerimonie politiche amano sovrapporre gli annunci»; «i sopravvissuti burocratici non fanno notizia quanto i tagli del nastro»; «dietro la retorica della sovranità c'è un conto fatto al centesimo da un ufficio legale di Hsinchu». Il sarcasmo colpisce slogan e contabilità creativa, mai operai, studenti o residenti — il guardrail della struttura è rispettato con scrupolo.

Due drift.

**Il metronomo.** Nella versione consegnata **28 paragrafi su 46** chiudevano con la stessa figura: esposizione lunga, poi frustata corta e correttiva. «È lavoro vero, misurabile in tonnellate.» «Ha scelto la coda di una fila già formata.» «Sta mentendo sull'operatore aritmetico che li tiene insieme.» Prese una per una sono buone. Prese in fila diventano un tic, e un tic prevedibile smette di sorprendere entro pagina quattro. Le review dei capitoli 5 e 6 avevano già penalizzato la forma stretta «Non X. È Y.»: qui quella specifica costruzione è scesa a quattro occorrenze (progresso reale), ma la *funzione* si è semplicemente ridistribuita su tutte le altre chiuse. Il Writer ha curato il sintomo. Quattro chiuse de-snappate in questa review; il resto è materiale per il cap. 8.

**Il Phastidioso che non fa la divisione.** Il difetto §3.1 non è un errore di battitura, è un cedimento di postura. Questa persona è definita dall'atto di rifare i conti che gli altri copiano. Aver copiato dal dossier una percentuale sbagliata di un fattore due, in un capitolo costruito per insegnare a non farlo, è l'unico modo in cui questo personaggio può davvero perdere credibilità. Vale come regola permanente per il resto del libro: **ogni percentuale che compare in prosa va ricalcolata a mano dai suoi due numeri, anche — soprattutto — quando arriva dal dossier con una fonte accanto.**

---

## 5. Counter-Objection Check

Quattro obiezioni su cinque presenti, tutte in forma non addomesticata. La quinta aggiunta in review.

| # (da struttura) | Presente | Forma forte? | Risposta basata su prove? |
|---|---|---|---|
| 1. «Fab taiwanese pagata dai contribuenti tedeschi» | ✅ | Sì, citata verbatim | Sì — obblighi Open Foundry, accesso PMI, 2.000 posti; distingue controllo azionario da localizzazione del rischio |
| 2. «I nodi 12–28 nm non danno sovranità» | ✅ | Sì, e affrontata «di petto» | Sì — carenza 2021, 210 mld $, 7,7 mln di veicoli; concede esplicitamente che Dresda non è un baluardo di sovranità |
| 3. «Senza Dresda l'Europa resta ostaggio di Taiwan» (beneficio marginale) | ❌ → ✅ **aggiunta** | — | Ora sì — GF Fab 1 >400.000 wafer/anno a confronto, e classificazione first-of-a-kind FinFET come unico delta reale |
| 4. «Con Dresda l'Europa fa a meno di Taiwan» | ✅ | Sì, speculare alla 1 | Sì — PDK, direzione tecnica, tool, EDA, OSAT |
| 5. «Il costo è sproporzionato» | ✅ | Sì — Gropp e Fuest, non straw man | Parzialmente → ora sì, con il costo unitario per wafer di capacità e il limite del rapporto per posto di lavoro dichiarato |

Da segnalare in positivo: Gropp e Fuest sono presentati come critici *da rispettare* («vengono da economisti, non da concorrenti industriali»), non come rumore da neutralizzare. È la gestione delle obiezioni più matura del libro.

---

## 6. Priority Improvements

### Critical (fatti in questa review)
1. Aritmetica 480.000 / 15 milioni → 3,2%, con la scheda tecnica trasformata in imputata.
2. Benchmark Kumamoto su milestone omogenee; rimozione del «+70% da burocrazia europea».
3. Chiusura riscritta: l'HTOL si esegue su componenti incapsulati, e l'incapsulamento non è in Europa.
4. Casella «erogato» dichiarata non pubblicata anziché dedotta.

### Important (fatti in questa review)
5. Obiezione 3 della struttura scritta ex novo (beneficio marginale = FinFET first-of-a-kind).
6. Ripetizione verbatim delle infrastrutture sostituita dal costo unitario del sussidio.
7. i-line a 365 nm; portata FDPR/BIS; valuta del target 20%; precisione ASML non verificabile rimossa.
8. Densità delle chiuse ad antitesi ridotta.

### Optional (per il Ricercatore e per il cap. 8)
9. **Verificare o sostituire le quattro fonti [SHADOW] di §3.8** prima della pubblicazione. Il cantiere estivo 2026 e il Welcome Center reggono l'intera credibilità del cutoff: se una sola di quelle attribuzioni non è un documento reale, il capitolo perde la sua ancora temporale.
10. Cercare se BMWK o Bundesrechnungshof pubblichino l'erogato per tranche: sarebbe il numero più prezioso del capitolo, e nessun altro libro su questo tema ce l'ha.
11. Il cap. 8 eredita la clausola di ordini prioritari del Pilastro III, già impiantata qui. Va usata: è l'unico meccanismo giuridico che collega Dresda a uno scenario di blocco.

---

## 7. Rewritten Paragraphs

### Rewrite 1 — L'errore aritmetico

**Original:**
> 480.000 wafer l'anno rappresentano, per stessa ammissione delle specifiche tecniche del progetto, meno dell'1,5% della capacità globale di fonderia di TSMC, che supera i 15 milioni di wafer equivalenti da 300 millimetri l'anno.

**Rewritten:**
> Le schede tecniche circolate nel 2024 sostengono che 480.000 wafer l'anno valgano «meno dell'1,5%» della capacità di fonderia globale di TSMC, che supera i 15 milioni di wafer equivalenti da 300 millimetri l'anno. Chiunque abbia una calcolatrice ottiene il 3,2%: il doppio. Un refuso, probabilmente — ma un refuso che sbaglia nella direzione che rende ESMC più piccola, più innocua, meno discutibile, e che quindi nessuno ha interesse a correggere.

**Why:** L'errore era già dentro il testo, in forma verificabile dal lettore. Correggerlo in silenzio avrebbe salvato il numero e sprecato l'occasione; ammetterlo come reperto trasforma il difetto nella dimostrazione del metodo che il capitolo predica, e mette il lettore in condizione di rifare la divisione da solo. È anche l'unico modo di restare fedeli alla persona: Il Phastidioso non copia percentuali, le ricalcola.

### Rewrite 2 — Il benchmark Kumamoto

**Original:**
> Kumamoto: cantiere avviato ad aprile 2022, inaugurazione il 24 febbraio 2024, produzione di massa entro fine 2024 — 22 mesi da terra a taglio del nastro […]. Dresda: cantiere avviato ad agosto 2024, produzione pilota non prima di fine 2027 — oltre 38 mesi, quasi il doppio. […] In Sassonia, permessi ambientali europei, ricorsi amministrativi, tutela del riposo dei lavoratori e complessità degli appalti pubblici dell'Unione allungano i tempi industriali di circa il 70% rispetto al benchmark giapponese.

**Rewritten (estratto):**
> Va però fatto tra le stesse pietre miliari, ed è precisamente l'errore della versione da conferenza stampa: allineare i 22 mesi che a Kumamoto separano il cantiere di aprile 2022 dall'inaugurazione del 24 febbraio 2024 ai 38 che a Dresda separano l'agosto 2024 dalla produzione pilota di fine 2027 significa cronometrare un taglio del nastro contro un primo wafer. Due orologi diversi. Chi li confronta ha appena rifatto l'errore che queste pagine passano il tempo a smontare.
>
> Rifacciamolo bene, da terra a produzione: Kumamoto circa 32 mesi, da aprile 2022 alla fine del 2024; Dresda circa 40 mesi alla pilota di fine 2027, una sessantina alla piena capacità del 2029. Il divario resta ed è serio, ma è tra 32 e 40 mesi sul primo traguardo omogeneo, non «quasi il doppio». E non è avarizia: il METI ha coperto Kumamoto con 476 miliardi di yen, circa il 40% del capex, mentre la Germania autorizza fino a 5 miliardi su oltre 10 dichiarati, cioè fino a circa la metà. L'Europa non paga di meno. Paga più tardi.
>
> Su quegli otto mesi, però, conviene fermarsi prima della frase comoda. […] Prendere la differenza tra due date e imputarla per intero alla burocrazia europea è comodissimo per chi ha già deciso di deregolamentare. È anche un'attribuzione di causa senza misura, e la misura qui non ce l'ha nessuno.

**Why:** Tre difetti in un colpo. Le milestone diventano omogenee, quindi il confronto è finalmente valido. «L'Europa non paga di meno, paga più tardi» sostituisce un luogo comune (l'Europa è avara) con il dato di sussidio effettivo, che dice l'opposto ed è più interessante. E il rifiuto di attribuire gli otto mesi alla burocrazia senza scomposizione è ciò che distingue questa persona da un editorialista: la disciplina si dimostra rinunciando alla battuta facile quando il numero non c'è, non quando c'è.

### Rewrite 3 — La chiusura

**Original:**
> Nella cleanroom di prova di ESMC, quando arriverà, un wafer da 300 millimetri entrerà nella camera di test climatico e dovrà resistere a 125 gradi Celsius per 1.000 ore filate senza un solo guasto. Quel wafer, non il tendone bianco del 20 agosto 2024, sarà la vera cerimonia di questo progetto […].

**Rewritten:**
> Il primo wafer inciso di Klotzsche, quando uscirà dalla cleanroom, non potrà essere messo in una camera di prova a 125 gradi per mille ore. Un wafer non si qualifica: si qualifica un componente, e per avere un componente quel disco va tagliato in centinaia di die, ciascuno collegato, incapsulato e saldato su un supporto. In Europa quella capacità sta sotto il 5%. Quindi il wafer che l'Europa ha comprato con cinque miliardi di euro, per diventare la prova che i cinque miliardi funzionavano, dovrà salire su un aereo, farsi impacchettare a settemila chilometri di distanza e tornare indietro sotto forma di chip prima che qualcuno possa infilarlo in un forno e vedere se sopravvive.
>
> È lì, in una camera climatica che non sta in Sassonia, che si terrà la vera cerimonia di questo progetto — senza tendone, senza pale d'argento e senza nessuno dei cinque che erano sul palco il 20 agosto 2024.

**Why:** L'originale era falso e sprecava il proprio miglior materiale. La versione nuova è corretta (l'HTOL è un test su componente), chiude l'anello OSAT aperto due sezioni prima, richiama il tendone e le pale del primo paragrafo — e ottiene un'ironia che l'immagine sbagliata non poteva dare: la prova che i cinque miliardi europei hanno funzionato verrà eseguita in Asia. Struttura del finale volutamente diversa dal cap. 6: là due oggetti affiancati, qui una traiettoria — un oggetto che parte, si trasforma altrove e torna.

### Rewrite 4 — La casella dell'erogato

**Original:**
> Il metodo di verifica, allora, sta in cinque caselle da tenere rigorosamente separate: aiuto autorizzato, denaro impegnato per contratto, denaro effettivamente erogato, capacità fisicamente installata, produzione qualificata e venduta. A oggi Dresda ha riempito le prime due.

**Rewritten:**
> […] Al 3 settembre 2026 le prime due sono piene: decisione SA.107553 e contratto BMWK del 13 dicembre 2024. Le ultime due sono vuote per definizione — nessun tool installato, nessun wafer qualificato. La terza, quanti euro siano davvero usciti dal KTF, è la sola che permetta a un contribuente di giudicare, ed è l'unica che nessuno pubblica: né il ministero né la società rendono noto l'erogato per tranche. Con fondazioni e tetto completati è ragionevole che almeno una milestone sia stata liquidata, ma «ragionevole» non è un numero, e un numero che non esiste non si stima: si segnala.

**Why:** «Ha riempito le prime due» era una deduzione travestita da rilevazione, e per giunta probabilmente falsa dato lo stato del cantiere. La riscrittura fa tre cose che l'originale non faceva: dice cosa è verificato e con quale atto, dice cosa manca, e dice *perché* proprio quella casella mancante è quella che conta. L'opacità diventa il reperto invece dell'ostacolo — mossa più utile al lettore-contribuente di qualunque stima.

### Rewrite 5 — Il beneficio marginale (obiezione 3, aggiunta)

**Original:** assente.

**Rewritten:**
> Resta la domanda che quasi nessuno pone, e che è l'unica capace di dire se cinque miliardi comprino qualcosa che l'Europa non aveva già: che cosa aggiunge ESMC alle fab europee esistenti? In volume, poco. La Fab 1 di GlobalFoundries, a pochi chilometri, ne lavora già oltre 400.000 l'anno, e Bosch e Infineon fanno chip automotive nello stesso codice postale da un pezzo. La differenza sta nel processo: la Commissione ha classificato ESMC come primo impianto *first-of-a-kind* a tecnologia FinFET su fonderia pura dell'Unione. FinFET vuol dire transistor a pinna verticale anziché piatta, la geometria che sotto i 22 nanometri tiene sotto controllo le dispersioni di corrente, ed è la classe di processo dei controllori di dominio delle auto software-defined — quelle dove un chip solo fa il lavoro di dieci centraline del 2015. In Europa, oggi, nessuna fonderia aperta a clienti terzi lo offre. Il beneficio marginale di Dresda sta lì, e solo lì: non nei wafer in più, nell'anello di processo che mancava.

**Why:** Era il buco logico più grave. Il capitolo elencava con cura le fab già presenti a Dresda per spiegare *perché TSMC ha scelto Dresda*, e poi non usava mai quegli stessi numeri per la domanda inversa — cioè quella che si pone il contribuente. Senza questo paragrafo la tesi «polizza a copertura limitata» resta indimostrata sul lato del beneficio: si sa cosa Dresda non compra, non cosa compra. La risposta era nel dossier (classificazione first-of-a-kind FinFET) ed era rimasta inutilizzata.

### Rewrite 6 — La ripetizione delle infrastrutture

**Original:**
> Sul fronte delle infrastrutture, il conto è già scritto, e vale la pena ripeterlo in chiave umana e non tecnica: 300 milioni di euro per un nuovo impianto idrico, 100 dei quali dal bilancio del Land e 50 dal bilancio della città di Dresda; una linea elettrica da 380 kV su 92 chilometri di tralicci.

**Rewritten:**
> C'è poi la divisione che tutti fanno a mente e nessuno scrive: cinque miliardi diviso duemila posti diretti fa due milioni e mezzo di euro a posto di lavoro. Ottima per un titolo indignato, sbagliata come misura: una fab non si compra per assumere, si compra per avere capacità e ridondanza, e nessuno giudica una centrale elettrica dividendo il costo per i turnisti. Il denominatore onesto è la capacità: cinque miliardi su 480.000 wafer l'anno fanno circa 10.400 euro di denaro pubblico per ogni wafer che la linea potrà avviare ogni anno, 21.000 se al sussidio si sostituiscono i dieci miliardi di investimento complessivo. Quello è il prezzo unitario che il contribuente sassone deve tenere d'occhio, e confrontare fra tre anni con quanti di quei wafer usciranno qualificati davvero.

**Why:** Un paragrafo che annuncia di ripetersi viola la regola sulle funzioni di paragrafo e spreca 130 parole nel beat che dovrebbe essere il più umano del capitolo. Il rapporto costo/posto di lavoro è la prima cosa che il lettore-contribuente calcola da solo appena legge «5 miliardi» e «2.000 posti»: ignorarlo lascia il campo all'indignazione, riportarlo *e smontarlo* dà al lettore lo strumento e insieme il suo limite d'uso. Il prezzo per wafer di capacità è la metrica che il capitolo può poi verificare nel 2029 — apre un conto invece di chiuderlo.

### Rewrite 7 — La portata delle regole americane

**Original:**
> **Sovranità** significa decidere da soli cosa produrre, per chi e con quali vincoli legali: Dresda non ne compra affatto, perché il Bureau of Industry and Security continua a decidere a chi quei wafer possono essere venduti.

**Rewritten:**
> **Sovranità** significa decidere da soli cosa produrre, per chi e con quali vincoli legali: qui Dresda non compra nulla. Attenzione a non gonfiare l'accusa — Washington non approva la lista clienti di ESMC né firma i suoi contratti. Fa qualcosa di più economico ed efficace: decide unilateralmente, e può cambiarla domani mattina, la lista dei clienti a cui una fab piena di tool e software americani non può vendere. Il perimetro di ciò che una fabbrica tedesca può fare resta scritto in un registro federale di Washington, e Berlino lo legge insieme a tutti gli altri.

**Why:** L'originale trasformava un vincolo reale in un controllo totale, che è esattamente il tipo di gonfiaggio che il capitolo condanna quando lo fanno gli altri. La versione precisa è più severa, non meno: il potere non sta nell'approvare ogni contratto — sta nel poter cambiare la lista dei divieti senza consultare nessuno. «Berlino lo legge insieme a tutti gli altri» dice la dipendenza meglio dell'iperbole che ha sostituito.

---

## 8. Litmus Test

**«Ho vissuto questo» o «me l'hanno raccontato»?**

Prevale il primo, ma con un margine più stretto di quanto il capitolo meriti. Si vive il tendone bianco con le quattro pale d'argento sulla terra livellata; il wafer dummy specchiato dietro la vetrina, «l'oggetto più onesto di tutto il progetto»; la doccia d'aria a 25 metri al secondo prima degli scanner di addestramento; le travi da 48 tonnellate sollevate contro le piogge autunnali; e ora, in chiusura, il wafer che deve prendere un aereo per diventare la prova di sé stesso.

Si viene invece *informati* — bene, ma informati — su tutto il denaro. I 43 miliardi, i 5 miliardi, il KTF, le tranche: contabilità limpida e nessun corpo dentro. Il capitolo ha un solo personaggio con un nome e una decisione, Florian Dolzmann, che parte per Taichung per un lavoro in una fab che non esiste ancora — ed è una scommessa personale eccellente, tenuta in un paragrafo, senza una parola sua. Gropp e Fuest sono citati e mai fatti parlare. Il cittadino sassone che paga i 150 milioni di Land e città resta un'astrazione grammaticale.

La differenza con il cap. 6 è istruttiva: là il lettore vedeva il traliccio senza trasformatore e capiva tutto in un colpo. Qui vede molti oggetti veri e nessuna faccia che rischi qualcosa. **Per il cap. 8: una voce diretta e citata vale tre dettagli fisici.**

---

## 9. Verdict

**REVIEWER_CORRECTIONS — 44/60.** Architettura, tesi e traduzione tecnica sono all'altezza del libro; l'accuratezza no — un capitolo che insegna a rifare i conti ne aveva sbagliati tre, incluso il confronto internazionale che doveva essere il suo climax e l'immagine finale che il lettore si porta via. Corretti, insieme all'obiezione mancante sul beneficio marginale, alla ripetizione del beat 6 e alla monotonia delle chiuse di paragrafo: 12 paragrafi riscritti in `chapter_7.md`.
