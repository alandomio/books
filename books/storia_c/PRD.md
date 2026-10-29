# Book PRD: CHRONOS — Ai Confini dell'Impero

## 1. Vision
- **Title:** CHRONOS: Ai Confini dell'Impero
- **Subtitle:** Dal Rinascimento alla Belle Époque, tra la Grande Storia e le Terre di Mezzo
- **One-line pitch:** Dodici missioni nel tempo, dall'Umanesimo alla Belle Époque, viste con gli occhi di due cronoriporter — uno che segue la grande storia europea, una che segue la storia, spesso dimenticata, delle terre slovene — con un occhio ricorrente sul Litorale giuliano dove le due si incrociano.
- **Enemy (what the book destroys):** L'idea che la "vera" storia sia solo quella dei grandi centri (Parigi, Vienna, Londra) e che le periferie di confine — il Litorale, la Carniola, il Carso — siano solo comparse mute, quando invece producono i primi libri sloveni, le prime università, i primi scienziati riconosciuti a Londra.
- **Promise (what the reader gains):** Capire i 12 grandi passaggi del programma ministeriale di Storia (Rinascimento → Rivoluzione industriale) e, insieme, imparare che ogni grande evento europeo ha un'eco locale — e che quell'eco, a volte, ha una voce propria che non passa mai per Roma, Parigi o Vienna.

## 2. Target Reader
- **Primary:** Studenti di seconda media (11-13 anni), programma di Storia. Devono uscire dal libro con i nuclei ministeriali chiari e con almeno un aggancio concreto e memorabile per ciascuno.
- **Secondary:** Insegnanti che cercano materiale didattico integrativo/laboratoriale su fonti, territorio, convivenza interculturale; famiglie della fascia transfrontaliera italo-slovena.
- **Anti-target (who this book is NOT for):** Lettori che cercano un saggio storico denso di apparato critico e note a piè di pagina; chi cerca un libro esclusivamente su Trieste (il Litorale è un riferimento ricorrente, non il soggetto del libro).

## 3. Tone & Voice
- **Tone target:** Avventuroso, documentaristico, partecipativo — stile "reportage nel tempo". Accessibile ma mai infantilizzante; il dettaglio sensoriale ed emotivo veicola l'informazione storica, non la sostituisce.
- **Anti-tone:** Manualistico/enciclopedico; tono da bignami con elenco di date; retorica nazionalista da nessuna delle due parti (né italocentrica né sloveno-centrica); morale didascalica esplicita a fine capitolo ("e la morale è...").
- **Style references:** Continuità di serie con il volume precedente CHRONOS — il primo anno (prima media): `storia_b` ne è la versione canonica/finale, `storia` una bozza precedente non canonica dello stesso anno, non un volume separato. Questo è il **secondo** volume/missione della serie (secondo anno, seconda media), non il terzo. Persona "Cronoriporter" mantenuta, con l'aggiunta della seconda voce narrante (vedi §4 e `STYLE_BIBLE.md`).
- **Language:** Italiano e Sloveno. **Non è una traduzione**: le due edizioni sono due stesure autoriali parallele, coordinate sugli stessi fatti e la stessa scaletta di beat, ma libere nella formulazione — vedi `STYLE_BIBLE.md § Persona` e `INSTRUCTION.md § Team → Linguista`.

## 4. Structure

Ogni capitolo ha un numero di scene variabile — deciso dall'Architect sul peso reale dei contenuti, senza un range predefinito — ciascuna taggata per voce narrante. Soglia minima 4.000 parole totali per capitolo, nessun tetto massimo. **Vincolo strutturale non negoziabile: ogni capitolo contiene almeno 1 scena Slovenia**, anche quando il nucleo ministeriale non offre un aggancio ovvio (in quel caso l'Architect costruisce l'aggancio: reazione popolare, eco intellettuale, percezione a distanza — mai una scena di riempimento).

| # | Chapter Title | Core Question | Voce Dominante |
|---|--------------|---------------|-----------------|
| 0 | Il Nuovo Membro della Squadra | Chi sono Alex, Maja e MEMO, e perché questo volume segue tre voci? (Orientamento — non un nucleo ministeriale, non usa la meccanica d'indagine dei capitoli 1-12) | — |
| 1 | L'Alba della Modernità | Come l'apertura delle rotte atlantiche ridisegna il valore delle periferie europee — comprese due piccole città di frontiera, una sul mare e una nell'entroterra? | EU |
| 2 | La Frattura Religiosa | Come la Riforma protestante, nata a Wittenberg, produce — quasi per caso — il primo libro mai stampato in lingua slovena? | SLOVENIA |
| 3 | Assolutismo e Rivoluzione Scientifica | Cosa lega l'assolutismo di Luigi XIV al metodo scientifico di un nobile carniolino che misura un lago che scompare? | EU/SLOVENIA |
| 4 | Il Secolo dei Lumi | Come lo stesso dispotismo illuminato produce, nello stesso decennio, una città-porto multietnica e un salotto intellettuale nell'entroterra? | GIULIA/SLOVENIA |
| 5 | Rivoluzione Americana e Rotte Atlantiche | Quanto tempo impiega l'idea di sovranità popolare a viaggiare da Filadelfia fino a un salotto di provincia asburgico? | EU |
| 6 | La Rivoluzione Francese | Come la stessa notizia — il crollo di un impero millenario — viene ricevuta in modo opposto da un mercante di porto e da un contadino di campagna? | GIULIA/SLOVENIA |
| 7 | Le Province Illiriche | Cosa succede quando, per quattro anni, la capitale non è più la città sul mare ma quella dell'entroterra? | SLOVENIA |
| 8 | Restaurazione e Vapore | Da dove viene davvero l'idea che cambierà la navigazione mondiale — dal mare o dai boschi? | GIULIA/SLOVENIA |
| 9 | Società Industriale e Vita di Confine | Chi nutre davvero una città industriale che non si accorge di chi la nutre? | SLOVENIA |
| 10 | Il 1848 e la Primavera dei Popoli | Perché nello stesso anno rivoluzionario due popoli vicini scrivono due programmi politici radicalmente diversi? | SLOVENIA |
| 11 | Il Risorgimento e la Questione Adriatica | Come si vive la stessa battaglia navale da tre punti di vista — italiano, asburgico-giuliano, sloveno? | GIULIA |
| 12 | La Porta d'Oriente | Perché un canale scavato in Egitto rende improvvisamente strategica una ferrovia che attraversa la Carniola? | GIULIA/SLOVENIA |

**Blueprint dettagliato:** `writing_plan.md` contiene, per ciascuno dei 12 capitoli, il concept didattico/narrativo e la scaletta di scena-per-scena (numero di scene dinamico, deciso capitolo per capitolo sul peso reale dei contenuti — non un range fisso; tag EU/Giulia/Slovenia, voce narrante Alex o Maja). L'**Architect legge questo blueprint prima di generare `chapter_X_struttura.md`**: può affinare i beat e i NUF, ma non può alterare il numero di scene Slovenia sotto il minimo di 1, né spostare una scena Slovenia dalla voce di Maja a quella di Alex (o viceversa) senza segnalarlo esplicitamente come conflitto.

## 5. Success Criteria
- Uno studente che finisce il libro sa collocare i 12 nuclei ministeriali sulla linea del tempo e può spiegare, per ciascuno, almeno un aggancio territoriale concreto (giuliano o sloveno).
- Uno studente sloveno o di area transfrontaliera riconosce nel libro una storia della propria terra raccontata con la stessa dignità narrativa della grande storia europea — non una nota a margine.
- Un insegnante lo giudicherebbe utilizzabile in classe: accurato, verificabile, privo di anacronismi, capace di generare domande (non solo di fornire risposte).

## Genesis Notes
- **Fonte primaria del programma:** curricolo fornito dall'utente (12 nuclei ministeriali + casi di studio sul Litorale giuliano-sloveno), poi rinegoziato in sessione di grill: il libro è stato deliberatamente ribilanciato per non essere Trieste-centrico e per dare voce narrativa autonoma alla storia slovena (vedi `writing_plan.md § Visione Generale`).
- **Nessun corpus NotebookLM dedicato** (a differenza di `guerra_fredda_silicio`): il Researcher lavora primariamente con web search + fonti storiografiche standard (manuali di storia, Wikipedia IT/SL/EN incrociate, monografie citate nel curricolo originale). Se in futuro viene creato un notebook NotebookLM dedicato a questo progetto, va aggiunto qui e in `INSTRUCTION.md`.
- **Known unknown:** l'accuratezza storica delle scene Slovenia (Trubar, Valvasor, Vodnik, Zois, Zedinjena Slovenija) richiede verifica incrociata IT/SL/EN più stringente della media — il rischio maggiore è appiattire figure e concetti sloveni su fonti italiane che li trattano solo di striscio. Vedi regola Linguista/Storico in `STYLE_BIBLE.md`.
