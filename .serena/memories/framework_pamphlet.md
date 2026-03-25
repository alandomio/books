# Framework per Pamphlet Politico/Economico-Storico

Questo documento descrive il framework generale per la generazione iterativa di pamphlet saggistici, politici o storici (come i progetti "Brexit" e "Trump"), basati su un'alta densità informativa, prosa d'autore e totale esclusione di pattern narrativi tipici dell'AI.

## 1. Il Sistema Multi-Agente ("The Brain")
La creazione del pamphlet non avviene tramite un singolo passaggio generativo, ma attraverso un loop di 5 agenti distinti. L'ordine cronologico (Sistema 2 / Logica -> Sistema 1 / Prosa) è tassativo.

1. **L'Architetto:** Pianifica la struttura del capitolo. Fissa i punti chiave dell'esposizione basandosi sull'Outline generale del progetto e traccia il percorso logico dell'argomentazione.
2. **Il Ricercatore:** Responsabile dei "Dati Duri" macroeconomici, legislativi e storici. Cerca documenti concreti (IMF, Fed, report reali, leggi) ed estrae numeri e proiezioni esatte. Compila un Dossier.
3. **Il Segugio (degli Aneddoti):** Cerca storie di cronaca, casi studio e aneddoti specifici. Le storie umane servono ESCLUSIVAMENTE a supportare e "mettere a terra" le tesi macroscopiche trovate dal Ricercatore.
4. **Lo Scrittore (La Voce):** L'Agente Creativo. Fonde il dossier numerico e gli aneddoti in un flusso narrativo unico usando un prompt di iniezione di personalità (es. "Analista Conservatore", "Intellettuale Britannico").
5. **L'Editor:** Il Guardiano. Esegue check spietati anti-AI e verifica la completezza. Se mancano densità o tono, ordina una revisione o richiama le fasi di ricerca.

## 2. Lo Stile e la Variazione Tono
Lo stile generale del pamphlet è un'estetica "Show, Don't Tell", in formato saggio breve o inchiesta compatta. Il tono cambia a seconda della *tecnicità* dell'argomento trattato:

- **Argomenti ad alta viscerabilità politica/populismo (es. Brexit):**
  Stile Gonzo-Accademico, molto ironico. Taglio elegante ma chirurgico e spietato verso la cialtroneria. Ampio uso di aneddoti di strada (il pescatore, il barista) per illuminare le dinamiche globali. Tono "Piero Angela arrabbiato".
- **Argomenti ad alta tecnicità istituzionale/finanziaria (es. Trump/Dazi, Corte Suprema):**
  Stile Analitico, Accademico, Spaccacapelli. Tono severo, zero sentimentalismi, divieto assoluto di narrazioni romanzate (es. introspezioni, tramonti). Concentrazione totale su teoria macroeconomica (es. Adam Smith), sentenze costituzionali e PIL.

### Regole Universali di Formattazione e Stile
- **Nessun Bullet Point nella narrativa:** Il testo finale deve fluire come prosa saggistica organica.
- **Divieto di Auto-presentazione:** Vietate espressioni come "Come analista vedo...", "Il ricercatore in me...". L'autorità deriva dalla ferocia dei fatti, non dai titoli auto-attibuiti.
- **Aperture Conrete:** Iniziare i capitoli con un fatto netto (una firma, una dichiarazione clamorosa, un crollo di mercato). Mai con astrazioni metafisiche ("Da tempo immemore l'uomo sceglie...").
- **Finali Chirurgici:** Il capitolo termina con un colpo logico spietato, una domanda o un dato, evitando riassunti didascalici prolissi.
- **Densità vs Allungamento:** Se un capitolo è "troppo corto", lo Scrittore **NON** deve inserire aggettivi o filler (fluff), ma l'intero sistema deve cercare *più dati* o *nuovi aneddoti* per renderlo più denso.

## 3. Le Check-list Anti-AI (L'ossessione dell'Editor)
Per garantire genuinità autoriale, l'Editor fa rispettare questi vincoli:
1. **Dati Riciclati:** Mai utilizzare lo stesso dato chiave (es. i "$350M sul bus della Brexit") con la stessa funzione narrativa in più di un capitolo. Ogni capitolo deve portare nuovi fatti.
2. **Finali Clonati:** Vietate strutture retoriche identiche a chiusura dei vari capitoli (es. terminare sempre con la metafora della tempesta in arrivo).
3. **Analogie e Metafore:** Massimo 1 o 2 similitudini ("è come...") per capitolo. Devono essere appropriate all'argomento (es. metafore fisiche/amministrative per argomenti tecnici; divieto assoluto di metafore mediche e anatomiche).
4. **Regola dei Tre Esempi:** Rottura costante dello schema standard in cui l'AI inserisce tre item in serie (A, B e C). Alternare con singoli casi ultra-specifici.
5. **Intensificatori e Negazioni Vane:** Repressione di cliché come "inevitabilmente", "semplicemente", "fondamentalmente", così come le inutili circonlocuzioni "Non si tratta di X, ma di Y" (usare forma diretta).

## 4. Architettura Documentale (Il Loop)
Ogni progetto richiede questo scaffolding su disco:
- `INSTRUCTIONS.md`: Sancisce Audience, Vibe, Target e il Prompt di Identità dello Scrittore.
- `PROMPT.md`: La manualistica comportamentale esatta per ciascun Agente.
- `OUTLINE.md`: Scheletro generale dell'opera.
- `PLAN.md`: La Kanban board in cui si spuntano le task riga per riga per ogni capitolo `[ARCHITECT, RESEARCHER, SEGUGIO, WRITER, EDITOR]`.
- I vari `dossier_capitolo_X.md`, che fungono da repository dati per separare il lavoro algido di ricerca dalla stesura creativa finale.