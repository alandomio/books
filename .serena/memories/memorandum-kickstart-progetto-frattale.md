# 🚀 GUIDA AL KICKSTART: PROGETTO EDITORIALE FRATTALE (RALPH WIGGUM METHOD)

Questa memoria descrive la procedura standard per avviare un nuovo progetto di scrittura (libro/saggistica) utilizzando il **Fractal Writing Framework** e la metodologia **Ralph Wiggum**.

## 1. FASE PRELIMINARE: L'INTERVISTA (The Briefing)
Prima di scrivere qualsiasi codice o file, devi assumere il ruolo di **The Fractal Architect** e interrogare l'utente per definire l'anima del progetto.

**Regola d'oro:** Non procedere alla configurazione tecnica finché non hai queste 3 risposte.

### Le 3 Domande Sacre:
1.  **Titolo e Target Audience:** Chi deve leggere questo libro? (Es. "Esperti di finanza", "Mamme stressate", "Sviluppatori Junior").
2.  **Il Nemico (The Enemy):** Contro cosa combattiamo? (Es. "La noia", "I guru fuffa", "La complessità inutile").
3.  **Il Vibe (Tono): 3 aggettivi per descrivere lo stile. (Es. "Sarcastico, Chirurgico, Veloce").
4.  **Lunghezza e Complessità:** Quanto deve essere lungo il libro? (Es. "Un pamphet di 50 pagine", "Un manuale tecnico di 300 pagine", "Una serie di 10 saggi brevi"). Questo determina la struttura del Piano Editoriale.

Una volta ottenute le risposte, proponi una **Writer Persona** dal "Lo Zoo" (Gonzo, Bardo, Mentore, Analista, Camaleonte).

---

## 2. FASE DI CONFIGURAZIONE (Files Generatori)
Una volta approvata la Persona, devi generare i seguenti file nella cartella del progetto (creala se non esiste).

### A. `INSTRUCTIONS.md` (Il DNA del Progetto)
Contiene le definizioni di alto livello.
- **Project Definition:** Titolo, Audience, Nemico, Vibe.
- **The Team:**
    - **System 2 (Logic):** L'Architetto (struttura), Il Ricercatore (fatti), L'Intervistatore (briefing).
    - **System 1 (Voice):** La Writer Persona scelta (con il suo Prompt Injection specifico).
- **Tone Palette:** Keywords (SI) vs Anti-Keywords (NO).
- **Workflow:** I passaggi del loop (Ricerca -> Dossier -> Scrittura -> Review).

### B. `PROMPT.md` (Il Cervello dell'Agente)
Il System Prompt che l'agente (Ralph) leggerà a ogni iterazione.
- Deve includere il **Role Play** della Writer Persona.
- Deve imporre il vincolo **"Single Agent per Loop"**.
- Deve vietare i bullet points nella prosa.
- Deve comandare di leggere `INSTRUCTIONS.md`, `PLAN.md` e `activity.md`.

### C. `PLAN.md` (La Roadmap)
La lista dei task. Inizia sempre con:
- [ ] Setup Iniziale (fatto)
- [ ] Fase 1: Outline & Struttura
- [ ] Fase 2: Ricerca (Dossier Template)
- [ ] Fase 3: Scrittura Capitoli

---

## 3. FASE TECNICA (L'Infrastruttura Ralph)
Installa gli script necessari per l'automazione.

### A. Script di Controllo
- `ralph.sh`: Il loop principale (esegue Claude/LLM in ciclo).
- `ralph-control.sh`: Per status, review e validazione.
- `ralph-monitor.sh`: Dashboard real-time.

### B. File di Stato
- `activity.md`: Log vuoto (o con header iniziale).
- `.gitignore`: Ignora `.env`, cartelle temp, ecc.

---

## 4. CHECKLIST DI AVVIO (Esecuzione)
1.  **Crea la cartella:** `mkdir nome-progetto && cd nome-progetto`.
2.  **Git Init:** `git init`.
3.  **Scrivi i file:** Genera `INSTRUCTIONS.md`, `PROMPT.md`, `PLAN.md`, `activity.md` e gli script `ralph*.sh`.
4.  **Permessi:** `chmod +x *.sh`.
5.  **Primo Commit:** `git add . && git commit -m "feat: initial project structure"`.
6.  **Lancio:** Avvia il loop con `./ralph.sh 50`.

## NOTE IMPORTANTI PER L'AGENTE
- **Non inventare:** I dati devono provenire dal *Ricercatore* (Dossier).
- **Show, Don't Tell:** Regola suprema per la scrittura.
- **Fail Forward:** Se un capitolo non va, Ralph deve correggerlo nel loop successivo, non l'utente manuale.
