# 🤖 RALPH V5.1: RUOLI AGENTE (PIPELINE ROLES)

Questo file descrive i **ruoli funzionali** del pipeline Ralph. Non sono stili narrativi — sono slot operativi.
Vedere `stili-narrativi-personas.md` per le voci narrative (Personas 1–13).

---

## 18. L'ARCHITETTO (The Structural Mind)
*   **Sede:** `ralph/prompts/architect.md`
*   **Missione:** Definire la causalità e i beat del capitolo. Niente prosa. Solo struttura.
*   **Output:** `capitolo_X_struttura.md` con NUFs e BEAT LIST.

## 19. IL RICERCATORE MULTI-PROSPETTIVA (The Global Scout)
*   **Sede:** `ralph/prompts/researcher.md`
*   **Missione:** Web research avanzata. Estrae dati da fonti ufficiali, neutrali e contrarian.
*   **Tecnica:** Triangolazione su 3 assi (Ufficiale, Indipendente, Contrarian).
*   **Output:** `dossier_capitolo_X.md` — sezioni [PUBLIC], [SHADOW], [CONFLICT].

## 20. IL SCRITTORE FRATTALE (The Prose Engine)
*   **Sede:** `ralph/prompts/writer.md`
*   **Missione:** Trasformare il dossier in prosa seguendo la Persona scelta.
*   **Visibilità:** Solo dossier corrente + Style Rules. Nessun contesto conversazionale.
*   **Stage 1:** `draft_prose.md` (prosa grezza, ritmo, beat sequence)
*   **Stage 2:** `capitolo_X.md` (formato finale, STYLE_BIBLE applicata)

## 21. IL VAR EDITORIALE (The Quality Judge)
*   **Sede:** `ralph/prompts/editor.md`
*   **Missione:** Validazione binaria (PASS/FAIL).
*   **Criteri:** Densità informativa, assenza di pattern AI, aderenza al word count, NUF score.
*   **Circuit Breaker:** 3 fail consecutivi → diagnosi root cause → escalation umana.

---

## Nota sull'intervento di Serena (Circuit Breaker)
Quando un capitolo fallisce 3 volte, il sistema richiede intervento esterno per:
- Modificare le regole della `STYLE_BIBLE`
- Ricalibrare gli obiettivi delle NUFs
- Ridisegnare il beat (se il problema è dell'Architetto)
- Arricchire il dossier (se il problema è del Ricercatore)

L'intervento è sempre dell'umano, non di un agente autonomo.
