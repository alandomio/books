# FEEDBACK LOOP — Capitolo 6

## Verdetto Editor

EDITOR FAIL ✗ Score IT: 10.0/10 | Score SL: 10.0/10

Il punteggio NUF è pieno in entrambe le lingue — la catena causale, la distinzione principi/mezzi, le reazioni sociali differenziate, la pressione emotiva pre-Bastiglia, il disagio di Maja, le due date di Venezia, la Campagna d'Italia senza anacronismi napoleonici e l'autonomia della scena slovena sono tutti realizzati. **Il capitolo fallisce comunque per violazione di un hard gate**, che ha priorità assoluta sul punteggio NUF.

---

## Missing NUFs (per lingua)

Nessuna. Tutte e 10 le NUF sono verificate a 1/1 sia in IT sia in SL:
1. Catena crisi→1789→Terrore→Campagna→due date venete ricostruita senza freccia automatica: verificato (Checkpoint A/B + Verdetto "nessuna delle due basta da sola").
2. Principi distinti dai mezzi: verificato (privilegi aboliti a rate; "Sovranità finisce dove comincia una decisione militare francese" / "suverenost pa se konča natanko tam...").
3. Reazioni differenziate per posizione sociale: verificato (mediatore di Trieste, funzionario anonimo di Lubiana, Zois, contadina — quattro letture distinte dello stesso evento).
4. Pressione materiale pre-14 luglio: verificato (fila al forno, prezzo del pane, senza spettacolarizzare la violenza).
5. Disagio di Maja fra proclami e requisizioni: verificato ("Svoboda in rekvizicija. Isti papir. Isto črnilo." / "La stessa pagina promette la libertà e pretende il grano").
6. Bastiglia/4 agosto/Terrore distinti con stime cautelate: verificato.
7. Campagna d'Italia senza Napoleone imperatore né Italia unitaria: verificato esplicitamente in entrambe le lingue.
8. 12 maggio vs 17 ottobre separati: verificato con doppio richiamo MEMO
9. Occupazione Carniola 1797 triangolata (fonte anonima lubianese + Zois + contadina, nessuna reazione collettiva finta): verificato.
10. Scena slovena autonoma: verificato ("Tre testimoni, tre versioni, e nessuna delle tre parla per le altre due." / "Tri priče, tri različice...").

---

## Hard Gate Violations

### Length gate — VIOLATO (IT)

Il capitolo IT supera il tetto rigido di 4.800 parole fissato da `STYLE_BIBLE.md` § Pacing Rules e ribadito in `chapter_6_struttura.md` § TARGET (target 4.150-4.310, hard ceiling 4.800, **nessun SPLIT CANDIDATE dichiarato**: "Nessun `SPLIT CANDIDATE`: i quattro nuclei del blueprint entrano nel tetto senza compressione indebita").

**Conteggio parole effettivo (tre metodologie indipendenti, box e Briefing/Debriefing inclusi, commenti HTML di produzione esclusi):**
- IT: **4.812 / 4.907 / 4.958** parole a seconda del metodo di conteggio — in ogni caso **oltre il hard ceiling di 4.800**, e ben oltre il target di 4.150-4.310.
- SL: **4.154 / 4.266 / 4.319** parole — **entro il target** del capitolo, nessuna violazione.

Il commento di produzione interno al file IT dichiara "~4600 parole", che è già sopra target ma sottostima il conteggio reale di 200-350 parole.

**Ripartizione per sezione (IT vs SL, target fra parentesi):**
| Sezione | IT | SL | Target |
|---|---|---|---|
| Briefing + Obiettivi del Salto | 486 | 424 | 360-420 |
| Beat 1 (Bastiglia) | 1018 | 932 | 820 |
| Beat 2 (Scarponi, incl. checkpoint) | 992 | 919 | 820 + 120-150 |
| Beat 3 (Due Date) | 761 | 654 | 780 |
| Beat 4 (Libertà Sulla Carta) | **1117** | 868 | 820 |
| Debriefing | 515 | 452 | 430-500 |

L'eccesso IT non è distribuito uniformemente: il Beat 4 (+297 parole sul target) e il Beat 1 (+198) sono i principali responsabili, seguiti da Briefing/Obiettivi (+66-126) e Debriefing (+15-85). Il Beat 3 è sotto target e non va toccato.

Questo è un hard gate: **FAIL automatico indipendentemente dal punteggio NUF**, per la sola lingua IT.

### Altri hard gate — nessuna violazione riscontrata
- Anacronismi: nessun oggetto/cibo/espressione della `[ANACHRONISM-WATCH]` rilevato in nessuna delle due lingue (ghigliottina, bandiera tricolore nazionale, Lloyd Austriaco, Slovenia come Stato, ecc. — tutti correttamente assenti o esplicitamente negati nel testo, es. "Non è imperatore: lo diventerà solo nel 1804").
- Anti-calco: Beat 1-3 (IT primaria) e Beat 4 (SL primaria) mostrano attacchi di scena, ordine delle domande e posizione dei blocchi sensoriali sufficientemente diversi fra le due lingue da superare il test operativo (es. Beat 1: IT apre con la fila al pane, SL apre con il cortile della Bastiglia e usa un flashback "Šestnajst ur prej"; Beat 4: IT apre col fango di Krakovo, SL apre coi tamburi in piazza e sposta la scena del fango quasi in fondo).
- Voice balance: il Beat 4/Maja è narrato come inchiesta autonoma, mai come nota a margine; nessun riassunto ricevuto da Alex.
- Production-jargon: nessun tag `EU`/`GIULIA`/`SLOVENIA` bare nel testo finale; nessun "Beat N"/"Scena N" come titolo o riferimento meta. L'intestazione "OBIETTIVI DEL SALTO (SCENE)" riproduce fedelmente il Gold Sample approvato in `STYLE_BIBLE.md` (volume precedente) e non rientra nel pattern vietato "Scena N"/"Beat N".
- Narrator byline: presente e coerente su ogni sottotitolo di scena in entrambe le lingue.
- Estimate-hedging: tutte le voci `[ESTIMATE]` del dossier (vittime Bastiglia, vittime Terrore, effettivi dell'Armata d'Italia, proclama di Bonaparte marcato `[RECONSTRUCTED]`) sono rese con linguaggio di cautela esplicito in entrambe le lingue.
- Investigation-structure: Briefing non risolve l'Ipotesi Iniziale (segnala solo la crepa dei "cinque mesi in mezzo"); Debriefing contiene Verdetto + Ciò Che Non Sappiamo (3 punti) + Cronologia Essenziale (6 date); un solo Checkpoint con vera scelta A/B dopo il Beat 2.
- Easter Egg decoder-key: unico Easter Egg del capitolo (ROT13, nota `[^ee6]`), non è il primo uso assoluto nel volume (già introdotto con chiave di decifrazione al Cap. 0) — la nota breve senza chiave inline è quindi conforme.

---

## Aesthetic Violations (per lingua)

- **IT — possibile fatto non tracciabile al dossier:** il passaggio "Circola per la città, in questi giorni, una strofa messa in giro da un sacerdote — lo stesso che dirige le *Lublanske novice*" attribuisce esplicitamente a Vodnik la messa in circolazione della strofa satirica. Il dossier (Beat 4, voce Vodnik) dice solo che "è di questo periodo la celebre strofa satirico-popolare", senza confermare che sia stato Vodnik a comporla o diffonderla di persona. La versione SL è più prudente ("Njihov urednik... po Ljubljani širi kitico" — stessa attribuzione, in realtà, ma leggermente meno assertiva). Da verificare sul dossier o marcare come `[RECONSTRUCTED]`/con linguaggio di cautela in entrambe le lingue.
- Nessun'altra violazione estetica rilevata: dettaglio sensoriale e Life Hack Storico presenti in ogni beat, densità lessicale rispettata (max 2 nomi propri/3 termini tecnici per beat, ciascuno con memo-box), MEMO entro il limite di 3 informazioni per intervento, tic "a scuola"/"perché non lo so già" entro il limite di 3 occorrenze (1 uso ciascuno), Abilità Speciale di Bonaparte supera il test operativo (non è "vince battaglie" generico), nessuna frase vietata o pattern bannato individuato.

---

## Repair Instructions

1. **[IT] Tagliare il Beat 4 ("Libertà Sulla Carta, Soldati Alla Porta") da 1117 a circa 820-870 parole** — è la sezione più sovradimensionata (+297 sul target). Candidati al taglio: comprimere la sequenza di dialogo con l'anonimo di Lubiana (tre scambi possono diventare due senza perdere la Prova) o accorciare la descrizione sensoriale iniziale del sobborgo di Krakovo, mantenendo intatti Life Hack Storico e le tre testimonianze (funzionario/Zois/contadina) richieste dalla NUF 9-10.
2. **[IT] Tagliare il Beat 1 ("Dalla Bastiglia Al Terrore") da 1018 a circa 820-870 parole** (+198 sul target). Il blocco Comitato di salute pubblica/cifre del Terrore può essere compresso senza perdere la distinzione fattuale richiesta dalla NUF 6.
3. **[IT] Comprimere Briefing + Obiettivi del Salto da 486 a 360-420 parole**, allineandolo più da vicino alla sintesi già ottenuta in SL (424 parole).
4. **[IT] Rivedere leggermente il Debriefing (515 → 430-500 parole)**, mantenendo Verdetto, Ciò Che Non Sappiamo e Cronologia Essenziale integri (sono elementi obbligatori, non tagliabili nel contenuto — solo nella formulazione).
5. **[IT+SL] Verificare sul dossier l'attribuzione della strofa "Trka nam Francoz na vrata" a Vodnik come diffusore attivo**; se non confermabile con una fonte precisa, riformulare con linguaggio di cautela ("una strofa che circola, attribuita a...") invece di un'affermazione secca, in entrambe le lingue.
6. Dopo i tagli, ricontrollare il conteggio totale IT (attualmente 4.812-4.958 a seconda del metodo) per assicurarsi che scenda sotto il hard ceiling di 4.800 e, idealmente, dentro il target di 4.150-4.310 già rispettato da SL — senza però intaccare le NUF, che sono già tutte a punteggio pieno e vanno preservate nei tagli.

FAIL: <promise>BLOCKED: il capitolo IT supera il tetto rigido di 4.800 parole (4.812-4.958 a seconda del conteggio, contro un target di 4.150-4.310) senza SPLIT CANDIDATE dichiarato in struttura, violando l'hard gate di lunghezza nonostante un punteggio NUF pieno in entrambe le lingue.</promise>
