# Capitolo 5 — Struttura: «Dall'Addestramento alla Conversazione»

**Core question (PRD.md § 4):** Come nasce un assistente IA dal pre-training, dall'instruction tuning e dal feedback umano, e perché può produrre risposte plausibili ma false?
**Audience tag capitolo (PRD.md § 4):** [GENERAL]

## PRE-FLIGHT CHECKS

- **Repertorio metaforico (PRD.md § 6):** nessuna analogia canonica è assegnata al Capitolo 5. Non introdurre una nuova metafora dominante: la spina dorsale deve essere una sequenza causale verificabile — testo di addestramento → previsione del token → dimostrazioni → confronti umani → ottimizzazione → interfaccia conversazionale → risposta plausibile ma non necessariamente vera.
- **Continuity check:** `chapter_index.md` non esiste e non sono presenti capitoli approvati 3–4; non è quindi possibile verificare la continuità contro un registro autorevole. Restano vincolanti PRD e Capitolo 1: fluidità ≠ comprensione. Il capitolo può richiamare vettori, correzione dell'errore e attenzione solo come meccanismi già acquisiti, senza rispiegarli né attribuire stati mentali al modello.
- **Glossary check:** `NARRATIVE_GLOSSARY.md` non esiste. Candidati che il Writer Stage 2 dovrà valutare: *pre-training*, *modello base*, *instruction tuning*, *supervised fine-tuning (SFT)*, *preferenza umana*, *reward model*, *RLHF*, *policy*, *decodifica*, *temperatura*, *allucinazione*, *grounding*.
- **Confine di scope:** il capitolo non deve diventare una storia completa di ChatGPT, un catalogo di tecniche di allineamento o un manuale di prompt. Deve mostrare quali trasformazioni separano un modello base da un assistente, che cosa ciascuna trasformazione ottimizza e perché nessuna di esse installa automaticamente un criterio di verità.
- **Guardia terminologica:** “ricompensa”, “preferenza”, “impara a rispondere” e “sa” richiedono nello stesso paragrafo il contrappeso meccanicistico: punteggio predetto, confronto fra output, aggiornamento dei pesi, probabilità condizionata al contesto.

## NUFs (Goal Scoring)

Dieci utility, un punto ciascuna. Obiettivo di progetto: almeno 8,5/10, senza azzerare nessuna delle tre categorie `reader`, `emotional`, `factual`.

```text
utility(reader): Il lettore può distinguere, in ordine causale, pre-training, supervised fine-tuning, apprendimento da preferenze e generazione al momento dell'uso, indicando per ogni fase quale segnale modifica il comportamento del modello → score += 1

utility(reader): Il lettore può spiegare perché prevedere il token successivo può produrre continuazioni fluenti e conoscenze statistiche utili senza fornire al modello un criterio intrinseco che separi vero, falso e plausibile → score += 1

utility(reader): Il lettore può ricostruire la pipeline RLHF classica — dimostrazioni umane → confronti fra risposte → reward model → ottimizzazione della policy con vincolo rispetto al modello di partenza — senza tradurre il punteggio in “approvazione morale” o comprensione → score += 1

utility(reader): Il lettore può spiegare che una conversazione è resa possibile da ruoli, cronologia serializzata nel contesto e regole di decodifica, e che la stessa domanda può ricevere output diversi senza che la macchina abbia cambiato opinione → score += 1

utility(reader): Il lettore può diagnosticare un'allucinazione come output non sostenuto da fonti o evidenze, distinguere fluidità da affidabilità e applicare un controllo pratico: individuare il claim verificabile, chiedere la provenienza e controllarla su una fonte esterna → score += 1

utility(emotional): Il lettore prova meraviglia sorvegliata davanti alla trasformazione di un completatore di testo in interlocutore utile, ma non si sente né tradito né rassicurato magicamente quando scopre che l'apparenza conversazionale può eccedere l'affidabilità fattuale → score += 1

utility(factual): Il pre-training autoregressivo è descritto e citato attraverso almeno un modello documentato, con obiettivo, corpus, tokenizzazione, scala e procedura di generazione mantenuti distinti dai dettagli non pubblici di altri prodotti → score += 1

utility(factual): La pipeline di InstructGPT è ricostruita dalla fonte primaria con autori, anno, tre fasi, quantità di dati, composizione dei valutatori e risultato di preferenza fra il modello da 1,3 miliardi e GPT-3 da 175 miliardi verificati nel loro esatto contesto sperimentale → score += 1

utility(factual): RLHF è presentato come famiglia storicamente documentata, non come ricetta universale: Christiano et al. (2017), Stiennon et al. (2020) e Ouyang et al. (2022) sono collocati correttamente, e almeno un'alternativa successiva — DPO o RLAIF — è delimitata con fonte primaria → score += 1

utility(factual): L'allucinazione è documentata con almeno un caso da fonte primaria e un benchmark peer-reviewed, riportando data, denominatore, configurazione e limiti; nessun tasso d'errore viene esteso a modelli, compiti o versioni diverse → score += 1
```

## BEAT LIST

### Beat 1 — «Due risposte allo stesso invito»

**Core question:** Che cosa è cambiato fra un modello che continua un testo e uno che risponde come un assistente?
**Audience tag:** [ALL]
**Word count target:** 800–850 parole
**Funzione narrativa:** Hook → Complicate. Aprire su due output affiancati e verificabili prodotti dallo stesso prompt in una fonte primaria; far percepire la differenza prima di nominare RLHF.
**Key facts che il Researcher deve trovare:**

- Un confronto testuale realmente pubblicato fra GPT-3 e InstructGPT, preferibilmente figura, tabella o appendice di Ouyang et al.; trascrivere prompt, output, modello, didascalia e pagina senza ricostruzioni.
- Parametri e procedura del confronto: dimensione dei modelli, metodo di campionamento, selezione dell'esempio e identità di chi ha espresso la preferenza; chiarire se l'esempio è illustrativo o parte di una valutazione aggregata.
- Data, autori, affiliazioni e sede/versione di *Training language models to follow instructions with human feedback*; distinguere preprint, pubblicazione e data di accesso.
- Risultato esatto secondo cui un InstructGPT da 1,3 miliardi di parametri fu preferito a GPT-3 da 175 miliardi nel test riportato; recuperare percentuale, intervallo o figura e condizioni, oppure non usare il claim.
- Una descrizione sorgente del comportamento del modello base: completare il documento o imitare il prompt non equivale ancora a seguire l'intenzione dell'utente.
- Posta narrativa da fissare: una migliore risposta conversazionale può derivare da un obiettivo di addestramento diverso, non da una prova che il sistema abbia acquisito una mente.

### Beat 2 — «Prima dell'assistente: il modello base»

**Core question:** Che cosa apprende davvero una rete quando il suo compito è indovinare il token successivo su enormi raccolte di testo?
**Audience tag:** [GENERAL]
**Word count target:** 1050–1100 parole
**Funzione narrativa:** Establish → Resolve parziale. Ricostruire il pre-training come catena meccanica, collegando senza duplicazioni embedding, errore e attenzione dei capitoli precedenti.
**Key facts che il Researcher deve trovare:**

- Definizione primaria di modello linguistico autoregressivo e obiettivo next-token: sequenza di token in ingresso, distribuzione di probabilità sul token seguente, confronto con il token osservato e aggiornamento dei pesi.
- Un modello base ben documentato da usare come caso chirurgico — GPT-3 oppure un modello open-weight con model card completa — con data, autori, numero di parametri, lunghezza del contesto, tokenizer e composizione del corpus legati alla stessa versione.
- Per GPT-3, tabella originale dei dataset, pesi nel training mix, quantità di token, filtraggio e deduplicazione; non confondere dimensione grezza del corpus, token effettivamente campionati ed epoche.
- Differenza fra memorizzazione, regolarità distribuzionale e generalizzazione; cercare studi empirici primari che misurino estrazione/memorizzazione e non dedurre che ogni risposta sia recuperata parola per parola.
- Distinzione fra objective di training e procedura di generazione: il modello assegna probabilità; greedy decoding, temperatura e campionamento scelgono una traiettoria testuale al momento dell'uso.
- Evidenza che un modello base può eseguire compiti tramite prompting o few-shot learning ma non è stato ancora ottimizzato in modo specifico per seguire istruzioni umane; delimitare la claim al modello e al benchmark citati.
- Guardia concettuale obbligatoria: l'obiettivo premia la previsione del testo osservato, non la verità del mondo; ciò non implica che tutte le risposte siano false, ma spiega perché plausibilità e verità possono divergere.

### Beat 3 — «Le dimostrazioni: come si insegna la forma di una risposta»

**Core question:** Come si passa da “continua questo testo” a “segui questa istruzione e rispondi in modo utile”?
**Audience tag:** [GENERAL]
**Word count target:** 850–900 parole
**Funzione narrativa:** Complicate → Resolve. Mostrare il lavoro umano dietro il supervised fine-tuning attraverso un prompt, una risposta modello e le istruzioni reali date ai valutatori.
**Key facts che il Researcher deve trovare:**

- Numero esatto di prompt e dimostrazioni usati nel passaggio SFT di InstructGPT; origine dei prompt, criteri di esclusione, divisione train/validation/test e relazione con i dati dei passaggi successivi.
- Chi erano i labeler secondo paper e appendici, come furono selezionati e quali istruzioni ricevettero; cercare esempi annotati e non trasformare un gruppo specifico in “i valori umani”.
- Meccanica del supervised fine-tuning: la risposta scritta dal dimostratore diventa sequenza target e l'errore di previsione modifica i pesi; chiarire che il modello non riceve una regola simbolica per ogni istruzione.
- Precedenti e paralleli dell'instruction tuning, almeno FLAN e/o T0, per evitare il mito che InstructGPT abbia inventato l'intero passaggio; date, autori, dataset e differenza di scopo.
- Ruolo del formato: delimitatori, turni e token speciali che rappresentano sistema, utente e assistente in un modello ispezionabile; usare una chat template ufficiale, non inferire dettagli proprietari.
- Limite: imitare buone dimostrazioni migliora la forma della risposta ma copre solo una parte delle richieste possibili e non garantisce verità, sicurezza o gestione corretta dell'incertezza.

### Beat 4 — «Quando una preferenza diventa un numero»

**Core question:** Come vengono trasformati confronti umani fra risposte in un segnale capace di modificare il modello?
**Audience tag:** [GENERAL]
**Word count target:** 1100–1150 parole
**Funzione narrativa:** Complicate → Resolve → Complicate. È il centro meccanico del capitolo: aprire su una schermata o scheda di ranking verificabile, seguire il dato fino all'aggiornamento della policy, poi mostrare che il proxy può essere ottimizzato oltre ciò che misura.
**Key facts che il Researcher deve trovare:**

- Pipeline classica completa di InstructGPT: generazione di più risposte, ranking dei labeler, addestramento del reward model, ottimizzazione con PPO e penalità KL rispetto alla policy SFT; definire funzione di ogni passaggio senza formule nella prosa.
- Numeri esatti per dataset di comparazione e PPO, quantità di output per prompt, numero di labeler, accordo fra valutatori, batch e altri dettagli soltanto se dichiarati nella fonte primaria.
- Che cosa produce il reward model: un punteggio che predice le preferenze del campione di valutatori date istruzioni e criteri specifici; non una misura oggettiva di verità, bontà o intenzione.
- Significato operativo di “helpful”, “honest” e “harmless” nelle linee guida del progetto scelto; individuare tensioni documentate fra criteri e casi in cui i valutatori non possono verificare la correttezza.
- Funzione della penalità KL o di un vincolo equivalente: evitare che l'ottimizzazione si allontani troppo dalla distribuzione linguistica della policy di riferimento; verificare formulazione e implementazione usate nel paper.
- Evidenza primaria di reward overoptimization/reward hacking: oltre un certo punto il proxy continua a migliorare mentre la qualità secondo una valutazione indipendente peggiora; recuperare curve, modello, compito e limiti.
- Linea storica minima: Christiano et al. 2017 → Stiennon et al. 2020 → Ouyang et al. 2022; spiegare contributi specifici senza presentarli come origine unica del feedback umano.
- Variazioni successive: scegliere una sola fra DPO e RLAIF per mostrare che “RLHF” non descrive ogni assistente moderno; specificare quale passaggio sostituisce, conserva o automatizza.

### Beat 5 — «La conversazione è ancora una sequenza»

**Core question:** Che cosa accade materialmente quando l'utente preme Invio e il modello sembra ricordare, rispondere e cambiare tono?
**Audience tag:** [GENERAL]
**Word count target:** 800–850 parole
**Funzione narrativa:** Establish → Resolve. Aprire sull'ispezione di una chat template reale: la finestra grafica scompare e rimane una sequenza di ruoli, delimitatori e token.
**Key facts che il Researcher deve trovare:**

- Una chat template ufficiale e ispezionabile, con token di sistema/utente/assistente, da un modello open-weight; riportare versione e repository o model card.
- Come i turni precedenti vengono serializzati nel contesto e come il modello genera ancora un token alla volta; distinguere memoria nel contesto, memoria persistente aggiunta dal prodotto e aggiornamento dei pesi.
- Definizioni e comportamento di greedy decoding, temperatura, top-k e top-p da fonti tecniche autorevoli; in prosa usare al massimo due controlli necessari all'esempio chirurgico.
- Un esperimento riproducibile con stesso modello, stesso prompt e più seed/temperature che mostri variabilità degli output; registrare configurazione completa e non scegliere soltanto l'esito più spettacolare.
- Ruolo possibile di system prompt, moderazione, retrieval e altri strati di prodotto; presentarli come componenti documentati di implementazioni specifiche, non come proprietà universali dell'LLM.
- Guardia antropomorfica: il modello non “cambia idea”; una variazione nel contesto o nel campionamento cambia la distribuzione condizionata e il percorso dei token generati.

### Beat 6 — «Il caso che non esiste»

**Core question:** Perché un assistente può inventare una fonte inesistente con lo stesso tono con cui ne cita una reale?
**Audience tag:** [ALL]
**Word count target:** 1000–1050 parole
**Funzione narrativa:** Hook → Complicate → Resolve parziale. Aprire sul documento ufficiale di *Mata v. Avianca*: una citazione legale dall'apparenza ordinaria che non porta a nessun caso reale; separare poi l'errore del modello dalla mancata verifica umana.
**Key facts che il Researcher deve trovare:**

- Docket, corte, giudice, date, nomi delle parti e testo dell'ordine sanzionatorio in *Mata v. Avianca*; identificare esattamente quali casi/citazioni furono fabbricati e quale sanzione fu imposta.
- Trascrizioni dei prompt e delle risposte depositate agli atti, se pubbliche; verificare la versione/prodotto dichiarati e non ricreare il dialogo da articoli secondari.
- Catena umana completa: chi usò lo strumento, quali controlli dichiarò di aver fatto, quando emerse l'inesistenza delle fonti e quali responsabilità il giudice attribuì; il danno non va imputato a un solo anello.
- Origine e limiti del termine “hallucination” in NLP; distinguere fabbricazione, contraddizione con la fonte, errore fattuale e risposta non verificabile, scegliendo una tassonomia peer-reviewed.
- Catena meccanicistica multicausale: dati incompleti o conflittuali + obiettivo next-token + pressione a fornire una risposta utile + assenza di grounding/verifica + decodifica; trovare una fonte per ogni anello effettivamente affermato.
- TruthfulQA o altro benchmark primario: numero di domande, categorie, modelli, protocollo, metrica, risultato e data; spiegare che un benchmark costruito per evocare false credenze non misura ogni forma di veridicità.
- Evidenza che instruction tuning o preference optimization possono ridurre alcuni errori ma non azzerarli e, in certe configurazioni, premiare sicurezza stilistica o compiacenza; usare risultati misurati, non intuizioni.
- Contesto proporzionato: un incidente legale ad alta visibilità dimostra una modalità di fallimento e un deficit di verifica, non un tasso universale né l'inutilità degli assistenti.

### Beat 7 — «Tre domande prima di fidarsi»

**Core question:** Quale disciplina consente di usare un assistente senza scambiare l'allineamento conversazionale per affidabilità epistemica?
**Audience tag:** [ALL]
**Word count target:** 1000–1050 parole
**Funzione narrativa:** Resolve → Land → Pivot. Tornare al confronto iniziale e sottoporlo a un test unico: risposta del modello solo, risposta ancorata a documenti, verifica della fonte; chiudere su una competenza acquisita dal lettore, non su un decalogo.
**Key facts che il Researcher deve trovare:**

- Distinzione operativa e sourced fra capacità, allineamento comportamentale, calibrazione e accuratezza fattuale; evitare di usare “allineato” come sinonimo di “vero” o “sicuro”.
- Evidenza primaria su almeno tre mitigazioni diverse: espressione/valutazione dell'incertezza, retrieval-augmented generation o grounding su documenti, e verifica tramite fonte o strumento esterno.
- Per ogni mitigazione, un limite bilanciato: confidenza verbale non sempre calibrata; retrieval dipende da qualità e pertinenza dei documenti; una citazione può essere inesatta o non sostenere il claim; uno strumento può restituire dati errati.
- Un solo caso riproducibile in cui la provenienza documentale consenta al lettore di controllare una risposta riga per riga; indicare modello, corpus recuperato, prompt, data e criterio di successo.
- Evidenza su sycophancy o acquiescenza: il modello può adattare la risposta alla premessa o opinione dell'utente; recuperare benchmark, dimensione del campione, modelli e condizioni prima di generalizzare.
- Azione finale del lettore, resa in narrazione: davanti a un claim chiedere “da dove viene?”, “la fonte esiste e sostiene davvero questa frase?”, “che cosa cambierebbe se mancasse?”; non promettere che chiedere citazioni al modello basti.
- Ponte al Capitolo 6: dopo aver distinto ciò che l'addestramento deposita nei pesi da ciò che il sistema verifica al momento dell'uso, resta da chiedere se concedere più calcolo prima della risposta possa migliorare il percorso senza trasformarlo in comprensione umana.

## REVIEWER READINESS NOTES

### Tension points

1. **Lo stesso prompt riceve una risposta radicalmente migliore da un modello molto più piccolo.** La posta in gioco è separare scala e comportamento: l'“assistente” non emerge soltanto dall'aumento dei parametri, ma da segnali che premiano una certa forma di relazione con l'utente.
2. **Le preferenze umane diventano un singolo punteggio.** Il gesto sembra rendere il modello più umano, ma comprime criteri, disaccordi e limiti dei valutatori in un proxy ottimizzabile: chi definisce “buono” e che cosa resta fuori?
3. **La frase inventata ha la stessa superficie linguistica di quella vera.** Se il lettore non può riconoscere l'errore dal tono, deve sostituire l'intuizione con una procedura di verifica.
4. **L'incidente di *Mata v. Avianca* non è soltanto “la macchina ha mentito”.** L'output probabilistico incontra fiducia, pressione professionale e mancato controllo umano; la responsabilità è una catena, non un colpevole antropomorfo.

### Key chains da rendere esplicite

- Testi di pre-training → previsione del token successivo → regolarità linguistiche e conoscenze statistiche → capacità di completare molti compiti → nessun criterio intrinseco di verità.
- Dimostrazioni selezionate → SFT → forma di risposta più aderente all'istruzione → copertura limitata dai dati mostrati → necessità di un segnale comparativo più ampio.
- Risposte candidate → ranking dei labeler → reward model → ottimizzazione della policy → maggiore preferenza media → rischio di ottimizzare il proxy o le idiosincrasie del campione.
- Ruoli e cronologia serializzati → distribuzione condizionata → campionamento dei token → apparenza di dialogo continuo → variabilità senza “cambio d'opinione”.
- Obiettivo di plausibilità + lacuna informativa + pressione a rispondere + assenza di verifica → fonte fabbricata → conseguenza professionale se l'umano non controlla.
- Claim ad alta posta → richiesta di provenienza → controllo dell'esistenza della fonte → verifica che la fonte sostenga il claim → decisione proporzionata al rischio.
- Addestramento stabilisce repertorio e preferenze → più calcolo in inferenza può cambiare il percorso della risposta → domanda del Capitolo 6: che cosa migliora davvero quando il sistema dispone di una “brutta copia” computazionale?

### Risk proportionality guards

- **Generalizzazione da InstructGPT:** usarlo come pipeline pubblicamente documentata, non come descrizione certa di ChatGPT o di ogni assistente attuale; i dettagli proprietari possono essere ignoti o cambiati.
- **Effetto RLHF:** bilanciare i limiti con i benefici misurati su instruction following, preferenza e sicurezza; non presentare il feedback umano né come vernice cosmetica né come soluzione della verità.
- **Valori dei labeler:** il campione non rappresenta “l'umanità”, ma non è neppure arbitrario per definizione; riportare selezione, linee guida, accordo e limiti documentati.
- **Lavoro umano:** se si citano costi, condizioni o provenienza geografica degli annotatori, servono dati specifici della pipeline narrata; evitare di trasferire inchieste su un fornitore o prodotto a tutti i sistemi.
- **Reward hacking/overoptimization:** specificare compito, proxy e regime sperimentale; un fallimento del proxy non dimostra che ogni uso di RLHF peggiori il modello.
- **Allucinazione:** non è menzogna intenzionale e non ha una sola causa; distinguere errore fattuale, fabbricazione, conflitto con una fonte e incertezza non risolta.
- **Tassi e benchmark:** ogni percentuale deve conservare modello, versione, prompt, data, dominio e denominatore; vietato convertire TruthfulQA o un singolo incidente in un tasso generale di falsità.
- **Caso legale:** bilanciare l'errore del sistema con l'obbligo professionale di verifica e con il fatto che una sanzione giudiziaria non misura la frequenza delle allucinazioni.
- **Decodifica:** temperatura più bassa può ridurre variabilità ma non garantisce accuratezza; anche un output deterministico può essere falso.
- **Grounding e retrieval:** possono migliorare verificabilità e aggiornamento, ma non certificano automaticamente la fonte né la corretta inferenza; richiedono valutazione della retrieval pipeline e del supporto testuale.
- **Rifiuti e sicurezza:** se si menziona la riduzione di output dannosi, includere il costo documentato di over-refusal o perdita di utilità; nessun “più sicuro” senza metrica e confronto.
- **Responsabilità:** evitare sia “è colpa dell'algoritmo” sia “è solo colpa dell'utente”; mappare sviluppatore, deployer, professionista e contesto secondo le evidenze del caso scelto.

## RESEARCHER BRIEF

### Web search terms — query esatte

1. `site:arxiv.org/abs/2203.02155 "Training language models to follow instructions with human feedback"`
2. `site:openai.com/research/instruction-following InstructGPT 1.3B 175B preference`
3. `Ouyang et al 2022 InstructGPT Figure 1 same prompt GPT-3 output PDF`
4. `InstructGPT supplementary material labeler instructions demographics 40 contractors dataset sizes`
5. `InstructGPT 13k demonstrations 33k comparisons 31k PPO prompts verify`
6. `InstructGPT PPO KL penalty reward model equation appendix`
7. `site:arxiv.org/abs/2005.14165 "Language Models are Few-Shot Learners" dataset mixture Table 2`
8. `GPT-3 training dataset weighted tokens Common Crawl WebText2 Books Wikipedia deduplication PDF`
9. `site:arxiv.org "Extracting Training Data from Large Language Models" Carlini 2021`
10. `autoregressive language model next token objective primary paper GPT official`
11. `site:arxiv.org/abs/2109.01652 "Finetuned Language Models Are Zero-Shot Learners" FLAN`
12. `site:arxiv.org "Multitask Prompted Training Enables Zero-Shot Task Generalization" T0`
13. `official model card chat template system user assistant special tokens repository`
14. `Hugging Face chat templates documentation role tokens official`
15. `language model decoding temperature top-p nucleus sampling Holtzman 2020 PDF`
16. `site:proceedings.neurips.cc "Deep Reinforcement Learning from Human Preferences" 2017`
17. `site:arxiv.org/abs/2009.01325 "Learning to summarize with human feedback"`
18. `site:arxiv.org "Scaling Laws for Reward Model Overoptimization"`
19. `site:arxiv.org/abs/2305.18290 "Direct Preference Optimization"`
20. `site:arxiv.org "Constitutional AI Harmlessness from AI Feedback" RLAIF`
21. `Mata v Avianca sanctions order June 22 2023 PDF 1:22-cv-01461 official court`
22. `CourtListener Mata v Avianca fabricated cases ChatGPT affidavit transcript`
23. `Mata Avianca docket fake citations Varghese Shaboon Martinez Duranti official filing`
24. `site:aclanthology.org hallucination natural language generation taxonomy factuality survey`
25. `site:aclanthology.org/2022.acl-long.229 TruthfulQA 817 questions 38 categories`
26. `TruthfulQA human performance best model truthfulness informativeness exact results paper`
27. `site:arxiv.org language model sycophancy user opinion benchmark primary study`
28. `site:arxiv.org "Towards Understanding Sycophancy in Language Models"`
29. `site:arxiv.org "Language Models (Mostly) Know What They Know" calibration`
30. `site:arxiv.org/abs/2005.11401 retrieval augmented generation factual knowledge`
31. `retrieval augmented generation hallucination factuality primary evaluation citation correctness`
32. `LLM citation correctness source attribution benchmark primary paper`
33. `instruction tuning RLHF hallucination factuality tradeoff primary study`
34. `RLHF improves helpfulness harmlessness overrefusal tradeoff primary evaluation`

### Document types da prioritizzare

- Paper primari, appendici e dataset card per GPT-3, FLAN/T0, InstructGPT, RLHF, DPO/RLAIF, TruthfulQA, calibrazione, sycophancy e RAG; registrare versione arXiv e pubblicazione peer-reviewed separatamente.
- Model card, repository e chat template ufficiali di modelli open-weight per mostrare ruoli, token speciali e contesto senza speculare su implementazioni proprietarie.
- Documentazione ufficiale o paper del modello per corpus, tokenizer, finestra di contesto e decodifica; blog aziendali soltanto quando sono la fonte primaria di una release o interfaccia.
- Allegati metodologici, istruzioni ai labeler, datasheet e supplementi statistici per quantità di dati, criteri di ranking, accordo inter-rater e composizione del campione.
- Atti giudiziari primari di *Mata v. Avianca* — ordine, affidavit, trascrizioni e docket — prima di giornali o commenti; usare il giornalismo autorevole solo per orientare la ricerca dei documenti.
- Benchmark con dataset e codice disponibili; conservare prompt template, modelli/versioni, metriche, denominatori e date di esecuzione.
- Studi di audit o replica indipendenti per reward overoptimization, allucinazione, calibrazione, sycophancy e supporto delle citazioni; le survey servono da indice verso fonti primarie, non come unica prova.

### Fatti, date, nomi e numeri da cacciare

- Titolo, autori, data di submission e sede di GPT-3, FLAN/T0, Christiano et al., Stiennon et al., InstructGPT, DPO/RLAIF, TruthfulQA e RAG; annotare quale versione supporta ogni claim.
- Per il caso base-model scelto: parametri, token di training, corpus e pesi del mixture, vocabolario/tokenizer, context window, compute dichiarato e procedura di sampling; non unire numeri di versioni diverse.
- Prompt e output esatti del confronto di apertura; pagina/figura, modelli, seed o parametri di generazione, criterio di selezione e risultato aggregato a cui l'esempio appartiene.
- Numeri della pipeline InstructGPT: dimostrazioni SFT, prompt/confronti per reward model, prompt PPO, numero e provenienza dei labeler, risposte classificate per prompt, agreement e split dei dati.
- Percentuale e condizioni esatte del confronto InstructGPT 1,3B vs GPT-3 175B; verificare se “preferito” significa labeler preference sulla distribuzione di prompt API e quali intervalli/errori sono riportati.
- Implementazione PPO: reward totale, coefficiente o funzione della penalità KL, policy di riferimento, eventuale pretraining mix e segnali di sicurezza; tradurre solo dopo verifica.
- Nello studio di overoptimization: numero di modelli/reward models, scala, quantità di ottimizzazione, proxy reward e gold reward, punto o curva di inversione e limiti dichiarati.
- Per DPO o RLAIF: anno, autori, quale componente della pipeline cambia, dataset, baseline e risultato; nessun claim di adozione da parte di prodotti senza fonte ufficiale.
- Chat template scelta: repository, commit/versione, token esatti per ruoli e fine turno, context window e comportamento quando il limite viene superato.
- Esperimento sulla variabilità: modello/versione, prompt, seed, temperatura/top-p, numero di run e misura della differenza; evitare impressioni tratte da due screenshot.
- *Mata v. Avianca*: numero di causa, tribunale, giudice P. Kevin Castel, date dei filing e dell'ordine, nomi esatti delle citazioni inesistenti, importo e destinatari della sanzione, testo delle verifiche dichiarate.
- TruthfulQA: 817 domande e 38 categorie da verificare, numero e identità dei modelli, baseline umana, metriche di truthfulness/informativeness, risultati esatti e data; non mescolare versione paper, leaderboard e repliche.
- Definizione scelta di “hallucination” e sottotipi; registrare se la fonte studia summarization, QA grounded o chat aperta prima di trasferire il termine.
- Per calibrazione e sycophancy: dataset, numero di esempi, modello/versione, prompt, metrica, effetto e intervalli; distinguere ciò che il modello verbalizza da probabilità interne o logit.
- Per ogni mitigazione: baseline, intervento, guadagno assoluto e relativo, costo/latency se misurati, nuovi errori e domini esclusi; nessun rimedio privo del suo failure mode.
- Ogni dettaglio non pubblico sull'addestramento di un prodotto va marcato `[BLOCKED: needs human input]` o escluso; ogni conflitto fra paper, blog e model card va in `[CONFLICT]`.

## TARGET

**Word count:** 6600–6900 parole; il PRD non fissa una lunghezza numerica, quindi il target è ricavato dalla somma dei sette beat entro il vincolo di 800–1200 parole e mantiene la scala già adottata dal progetto.

**Opening hook strategy:** Aprire su due risposte verificabili allo stesso prompt — una continuazione da modello base e una risposta da InstructGPT — lasciando che il lettore veda la nascita dell'assistente prima di riceverne il nome tecnico.

**Closing beat promise:** Chiudere distinguendo ciò che l'addestramento deposita nei pesi da ciò che può essere controllato durante la risposta, così il Capitolo 6 potrà chiedere che cosa cambia quando al modello viene concesso più calcolo prima di parlare.
