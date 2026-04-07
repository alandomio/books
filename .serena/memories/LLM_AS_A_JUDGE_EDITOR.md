# ⚖️ The Validator: LLM-as-a-Judge Editor Guidelines

Questa memoria definisce il funzionamento del **Validation Gate** all'interno del Ralph Wiggum Loop (Fase di Validazione) per progetti di scrittura generativa.
Invece di affidare la correzione all'umano o a script euristici ciechi, l'intera bozza viene "giudicata" da un agente LLM separato (tipicamente un modello *reasoner* come Sonnet 3.5 o Gemini 1.5 Pro).

## DUAL-STAGE REFINEMENT (DSR) E SCORING (0-10)
Il Validation Gate non è più un singolo blocco, ma è suddiviso in due passaggi sequenziali (Dual-Stage Refinement) per separare il carico cognitivo:

### STAGE 1: Coerenza Strutturale e Logica (Il Critico Incorruttibile)
L'agente Critico analizza solo la logica, l'aderenza al piano narrativo, e verifica che le direttive del Dossier JSON siano state rispettate al 100%. Solo quando lo *Stage 1* passa con esito positivo, la bozza procede allo strato stilistico.

### STAGE 2: Raffinamento Stilistico (Anti-AI Spaccacapelli)
Ricevuta la bozza dallo Stage 1, l'agente applica uno **scoring base di 10**, decurtando punti tramite tre penali severe. Se il punteggio finale scende sotto **8.5/10**, la validazione stilistica fallisce.

#### 1. Penalità Formattazione e Pattern AI (-3 punti)
- **Liste Nascoste:** Uso della "Regola del 3" (Es: "Era stanco, affamato e solo.").
- **Simmetria Strutturale:** Conclusioni con ramanzine morali ("Alla fine, abbiamo imparato che...").
- **Fluff / Filler:** Aggettivi o avverbi ridondanti.
*Azione:* Sottrai punti e richiedi lo smontaggio della frase.

#### 2. Penalità Vocabolario Astratto (-3 punti)
- Burocratese AI: "Sfaccettato", "Olistico", "Viaggio (metaforico)".
- La prosa appare come un report invece di narrazione sensoriale.
*Azione:* Sottrai punti, imponi l'uso esclusivo di verbi attivi e lessico fisico.

#### 3. Penalità Varianza Ritmica (Gary Provost) (-4 punti)
- Uniformità sillabica o "Ninna Nanna" (eccessiva ipotassi).
*Azione:* Pretendi sequenze "staccato" fuse a frasi lunghe.

### EVOLUZIONE DINAMICA (Safe-Fail Mechanism)
**Importantissimo:** Se il Judge boccia l'elaborato per più iterazioni (es. 3 volte consecutive) sullo stesso esatto problema senza alcun progresso, deve annotare il vicolo cieco in un file esterno (`progress.md`), indicando una "Evoluzione Dinamica delle Specifiche" consigliata. L'obiettivo è prevenire i loop infiniti dove uno schema narrativo utopistico causa iterazioni perpetue e spreco di budget.

## ESEMPIO DI PROMPT PER IL JUDGE
Da inserire nello script di validazione (es. `ralph_validate.py`):

```markdown
Sei il Revisore Estetico (Stage 2: Anti-AI Spaccacapelli).
La bozza che ricevi è già strutturalmente corretta. Il tuo unico obiettivo è decostruire e distruggere la prosa generica dell'AI.
Valuta applicando le penalità per Pattern AI, Vocabolario Astratto e Varianza Ritmica.
Fornisci il punteggio usando il formato `<score>X.X</score>`. 
In caso di fallimento (`< 8.5`), indica le correzioni nel blocco `<feedback>`. 
**Sicurezza Antiloop:** Se noti che un feedback estetico specifico è stato ignorato per 3 iterazioni consecutive, registra un avviso o una "suggestion" in `progress.md` per abilitare l'evoluzione dinamica delle regole.
```
