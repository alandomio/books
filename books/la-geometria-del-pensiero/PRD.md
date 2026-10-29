# Book PRD: La Geometria del Pensiero

## 1. Vision
- **Title:** La Geometria del Pensiero
- **Subtitle:** Come le macchine hanno imparato a maneggiare il linguaggio, senza mai comprenderlo
- **One-line pitch:** Un viaggio in stile documentario dentro i meccanismi reali dell'intelligenza artificiale — dai simboli discreti agli spazi vettoriali, dall'attenzione al ragionamento lento — per chi vuole capire come funziona davvero, non quanto dovremmo temerla o venerarla.
- **Enemy (what the book destroys):** L'idea che la fluidità del linguaggio prodotto da una macchina sia indizio di comprensione o coscienza. Il libro è nemico sia del sensazionalismo apocalittico/messianico sia del manuale tecnico impenetrabile — e in particolare dell'antropomorfismo ingenuo ("la macchina capisce", "il modello sa", "l'algoritmo ha deciso") e della sovrageneralizzazione acritica.
- **Promise (what the reader gains):** Uno schema mentale solido e verificabile — geometrico, meccanicistico — per interpretare ogni nuova notizia sull'IA senza subire né il terrore né l'incanto ingenuo.

## 2. Target Reader
- **Primary:** Lettore colto ma non tecnico, curioso di scienza, il tipo di pubblico che legge Harari, Melanie Mitchell, Ethan Mollick — vuole capire il "come" senza dover studiare matematica.
- **Secondary:** Professionisti di altri campi (giornalisti, educatori, decisori) che devono parlare di IA con competenza senza background ingegneristico.
- **Anti-target (who this book is NOT for):** Ingegneri o ricercatori ML che cercano formalismo matematico rigoroso; lettori che cercano scenari fantascientifici o rassicurazioni ideologiche in un senso o nell'altro.

## 3. Tone & Voice
- **Tone target:** Meraviglia guidata da rigore — narrazione immersiva in stile documentario scientifico (Alberto Angela), che apre ogni capitolo con una scena o un'immagine concreta e ne fa emergere il meccanismo.
- **Anti-tone:** Allarmismo, tono da manuale accademico, gergo ingegneristico non tradotto, entusiasmo acritico da comunicato stampa tech.
- **Style references:** Alberto Angela (narrazione documentaristica), Walter Isaacson (persona-first storytelling), Malcolm Gladwell (spina dorsale esplicativa), Melanie Mitchell (rigore concettuale accessibile).

## 4. Structure

| # | Chapter Title | Core Question | Audience Tag |
|---|--------------|---------------|--------------|
| 1 | L'Enigma della Macchina Parlante | Perché la fluidità del linguaggio non implica comprensione? | [ALL] |
| 2 | La Mappa Invisibile del Linguaggio | Come le parole sono diventate coordinate in uno spazio geometrico (Word2Vec)? | [ALL] |
| 3 | L'Arte di Imparare dagli Errori | Come impara una rete neurale senza essere "programmata" (loss, gradiente, backprop)? | [ALL] |
| 4 | Il Faro del Contesto e l'Architettura Transformer | Come l'auto-attenzione ha eliminato la sequenzialità e liberato il significato dal contesto fisso? | [GENERAL] |
| 5 | Dall'Addestramento alla Conversazione | Come nasce un assistente IA: pre-training, RLHF, e perché "allucina"? | [GENERAL] |
| 6 | L'Elogio della Lentezza: Il Ragionamento nell'IA | Cosa cambia quando una macchina "pensa" più a lungo prima di rispondere (test-time compute)? | [GENERAL] |
| 7 | Oltre la Chat: L'Avvento degli Agenti Autonomi | Cosa distingue un chatbot passivo da un agente che pianifica e usa strumenti? | [EXPERT] |
| 8 | Le Trappole della Sintesi: Bias, Allucinazioni e Sovrageneralizzazione | Dove e perché l'IA sbaglia sistematicamente, anche quando sembra sicura di sé? | [ALL] |
| 9 | L'Umano e la Macchina: Verso una Co-Intelligenza Consapevole | Quale relazione tra pensiero umano e artificiale rifiuta sia la sostituzione sia la svalutazione? | [ALL] |

## 5. Success Criteria
- A reader who finishes this book can: spiegare a un'altra persona, senza formule, perché un LLM genera testo coerente, cos'è un embedding, come funziona l'attenzione, e perché "pensare più a lungo" migliora le risposte.
- A reader who finishes this book feels: l'incanto della scoperta scientifica, non la soggezione magica né la paura — la stessa sensazione di un documentario ben fatto che smonta un mistero pezzo per pezzo.
- A reviewer would describe it as: una divulgazione rigorosa, mai condiscendente né terroristica, che tratta il lettore come intelligente e capace di seguire un ragionamento tecnico se ben tradotto in immagini.

## 6. Repertorio Metaforico (vincolante per Writer e Architect)
Le seguenti analogie sono **canoniche** e devono ricorrere sistematicamente nei capitoli pertinenti (vedi STYLE_BIBLE.md per il vincolo di coerenza):
- **La Galassia di Parole / la Biblioteca invisibile** → embedding vettoriale (Cap. 2)
- **Il Faro nella Sala da Ballo** → self-attention (Cap. 4)
- **L'Escursionista nella Nebbia** → loss function, gradiente, backpropagation (Cap. 3)
- **Il Foglio di Brutta Copia** → test-time compute, chain-of-thought (Cap. 6)
- **L'Assistente con la Cassetta degli Attrezzi** → agenti IA, tool use (Cap. 7)

## 7. Note di Grounding
- **Genesi:** costruita a partire da un report editoriale fornito dall'utente (non da un notebook NotebookLM) — il report stesso è il corpus di partenza per Architect e Researcher.
- **Dati empirici da preservare nei capitoli pertinenti:** algebra vettoriale di Word2Vec (re − uomo + donna ≈ regina), Transformer/self-attention (Vaswani et al. 2017 — nota: il report cita "Cheng e colleghi" per il meccanismo di self-attention, va verificato/disambiguato in fase di ricerca), guadagno prestazionale del test-time compute, studio Royal Society sulla sovrageneralizzazione (10.000 sintesi, 10 modelli, overclaim 26%-73%, odds ratio 4,85).
