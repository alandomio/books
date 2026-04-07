# R.A.L.P.H. V5: Writing Specialist Specification

## 1. Architettura del Ciclo (The Stateless Core)
Il ciclo Ralph Wiggum si basa sulla **Statelessness Rigorosa** e sul **Backpressure Deterministico**. Ogni iterazione "uccide" il processo precedente per ripulire il contesto (Dumb Zone avoidance) e rinasce leggendo solo la "Verità su Disco" (File System Memory).

## 2. Definizione dei Ruoli e NUFs (Narrative Utility Functions)

### 🏛️ L'Architetto (`architect.md`)
- **Responsabilità:** Traduce la visione macro in micro-obiettivi quantificabili.
- **Innovazione CoDi:** Definisce le **Narrative Utility Functions (NUFs)** per ogni capitolo.
- **Output:** `capitolo_X_struttura.md` contenente:
    - `## NUFs (Goal Scoring)`: Es. `utility(narrative): Luca scopre il tradimento -> score += 1`.
    - `## BEAT LIST`: Sequenza logica di azioni.

### 🕵️ Il Ricercatore (`researcher.md`)
- **Responsabilità:** Estrazione di **Shadow Data** (dati ombra che ancorano la realtà).
- **Protocollo Pivot:** Triangolazione obbligatoria su 3 assi (Ufficiale, Neutrale, Contrarian).
- **Output:** `dossier_capitolo_X.md` (Database testuale denso).

### ✍️ L'Artigiano (DSR - Dual-Stage Refinement)
Risolve il *Task Coupling Dilemma* separando creatività e struttura in due sotto-fasi stateless:
1.  **Stage 1 (Prose Engine):** Trasforma il Dossier in prosa narrativa densa (Novel style). Focus: ritmo e azioni. Salva in `draft_prose.md`.
2.  **Stage 2 (Refinement Engine):** "Compila" la prosa nel formato finale, applicando la `STYLE_BIBLE.md`. Salva in `capitolo_X.md`.

### ⚖️ L'Editor (`editor.md`)
- **Responsabilità:** Esegue l'**Audit di Sistema 2** e gestisce il **Stop-Hook**.
- **Valutazione NUF:** Assegna un punteggio (0, 0.5, 1) a ogni obiettivo definito dall'Architetto.
- **Soglia di Sbarramento:** Richiede uno score complessivo >= 8.5/10.

## 3. Protocollo di Backpressure e Stop-Hook

### Il Meccanismo Stop-Hook
Se il punteggio NUF è sotto soglia o vengono rilevati errori estetici (AI patterns), l'Editor emette un segnale di blocco:
`FAIL: <promise>BLOCKED: [Motivo Tecnico]</promise>` -> **Exit Code 2**.
Lo script bash intercetta l'uscita, impedisce il commit e reinietta il log di errore nella prossima iterazione "pulita" dell'Artigiano.

### Feedback Artifact
L'Editor genera un file temporaneo `feedback_loop.md` che descrive:
1.  **Missing NUFs:** Quali obiettivi narrativi non sono stati raggiunti.
2.  **Aesthetic Violations:** Pattern AI o violazioni della Style Bible rilevati.
L'Artigiano deve leggere questo file all'inizio del loop successivo per correggere la rotta.

## 4. Evoluzione Dinamica (Circuit Breaker)
Se un Beat fallisce per 3 volte consecutive:
1.  **Analisi di Blocco:** L'Editor scrive in `activity.md` se il problema è logico (Architetto/Ricercatore) o stilistico (Artigiano).
2.  **Safe-Fail:** Il sistema richiede l'intervento di Serena per modificare le regole della `STYLE_BIBLE` o gli obiettivi delle NUFs, prevenendo loop infiniti.

## 5. MANTRA OPERATIVO
"Statelessness is sanity. Context is liability. Backpressure is quality."
