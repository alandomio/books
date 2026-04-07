# 🚀 GUIDA AL KICKSTART: PROGETTO EDITORIALE FRATTALE

Questa memoria definisce il modo standard per avviare un progetto di scrittura o di saggistica usando il **Fractal Writing Framework** e il loop **Ralph**.

## 1. FASE PRELIMINARE: IL BRIEFING
Prima di creare file o script, chiarisci il perimetro del progetto.

Le domande minime sono:
1. **Titolo e audience.** Chi deve leggere questo testo?
2. **Nemico.** Quale problema, mito o meccanismo stiamo smontando?
3. **Vibe.** Tre aggettivi che definiscono la voce.
4. **Lunghezza e forma.** Pamphlet breve, saggio lungo, manuale tecnico, narrazione ibrida.

Se il progetto è ambiguo, chiedi un chiarimento invece di riempire i buchi con tono o retorica.

## 2. FASE DI PROGETTAZIONE
Una volta chiarito il brief, proponi una persona di scrittura o costruzione coerente con il tema.

Per i testi d'inchiesta o di potere:
- **Analista / Investigatore:** quando servono densità informativa, precisione e controllo dei dati.
- **Gonzo analitico:** quando serve una voce più tagliente, ma sempre vincolata alle prove.
- **Bardo o Narratore:** quando il testo è storico o immersivo e richiede scena e atmosfera.

Non scegliere la persona in base al gusto. Sceglila in base al tipo di evidenza e al ritmo del testo.

## 3. FASE DI CONFIGURAZIONE
Dopo l'approvazione, genera i file essenziali del progetto.

### `INSTRUCTIONS.md`
Contiene:
- definizione del progetto;
- team con ruoli chiari;
- contratto delle prove;
- palette stilistica;
- workflow di validazione;
- meccanismo di evoluzione dinamica delle specifiche.

### `PROMPT.md`
Contiene il sistema operativo del writer o dell'agent.
- Deve imporre il vincolo di **un solo task per loop**.
- Deve vietare il riempimento con filler, astrazioni e auto-commento.
- Deve dire all'agente quali file leggere prima di agire.
- Non deve chiedere di esporre il ragionamento interno nel testo finale.

### `OUTLINE.md`
Contiene la struttura del libro o del progetto.
- Ogni capitolo deve essere spezzato in scene o sezioni piccole.
- Ogni scena deve avere una funzione narrativa e una funzione informativa.

### `PLAN.md`
Contiene la roadmap operativa.
- Ogni task deve corrispondere a una sola scena.
- La ricerca va completata prima della stesura.
- La revisione finale va trattata come task separato.

### `activity.md`
Contiene il log della sessione.
- Va aggiornato quando un task passa la validazione.

### `progress.md`
Contiene colli di bottiglia, lacune di fonti e cambi di specifica.
- Va aggiornato quando un problema si ripete o quando una regola va stretta.

### Dossier
Per i progetti di saggistica, usa dossier per capitolo o per blocco di scene.
- Struttura consigliata: `Data Snapshot`, `Fatti salienti`, `Casi studio`, `Fonti analitiche`.
- Il dossier deve separare fatti, interpretazioni e zone ancora da verificare.

## 4. FASE TECNICA
Se servono script di automazione:
- `ralph.sh` deve avere limiti espliciti su iterazioni, costo e condizioni di stop.
- Lo script deve trattare i file come memoria persistente.
- La validazione deve essere separata dalla stesura.
- I comandi distruttivi o ad alto impatto vanno limitati e tracciati.

## 5. REGOLE DI AVVIO
1. Crea la cartella del progetto.
2. Inizializza git.
3. Scrivi i file fondamentali.
4. Rendi eseguibili gli script.
5. Fai il primo commit.
6. Avvia il loop con guardrail chiari.

## NOTE DI QUALITÀ
- Non inventare dati.
- Non usare il dossier come ornamento: usalo come vincolo.
- Non correggere con più prosa quando serve più informazione.
- Se un punto non converge, annotalo in `progress.md` e cambia la specifica, non solo la frase.
