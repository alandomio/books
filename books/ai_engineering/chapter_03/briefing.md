# BRIEFING: CHAPTER 3 - PROMPTING VS. CONTEXT ENGINEERING

## 🎯 OBJECTIVE
Differentiate the "Amateur" skill of Prompt Engineering (wordsmithing) from the "Senior" skill of Context Engineering (environment design). Demonstrate that Context is the dominant variable in LLM performance.

## 🧠 FRACTAL BREAKDOWN

### SCENE A: THE 90/10 RULE (CONTEXT > PROMPT)
- **Goal:** Prove that a bad prompt with perfect context beats a perfect prompt with bad context.
- **Key Concept:** "Context Dominance."
- **The Enemy:** The "Prompt Whisperer" myth (thinking magic words unlock the model).
- **Beat:**
    - The breakdown: 90% of the outcome is determined by what is in the window before you type. 10% is the prompt.
    - Case Study: "Fix this bug" (with stack trace + source code) vs. "Write a complex fix" (with zero context).

### SCENE B: SYSTEM PROMPTS & ROLE ENGINEERING
- **Goal:** Define the "Soul" of the assistant.
- **Key Concept:** "The System Prompt."
- **Technique:**
    - Setting the persona: "You are a Principal Engineer at Google."
    - Setting the constraints: "No explanatory text. Code only."
    - How VS Code / Cursor injects hidden system prompts (e.g., "You are an AI programming assistant...").

### SCENE C: THE ARCHITECTURE OF A VIBE PROMPT
- **Goal:** Anatomy of a high-fidelity vibe prompt.
- **Key Concept:** "The Three Pillars."
- **Structure:**
    1.  **Role:** Who are you? (e.g., "Senior React Dev")
    2.  **Context:** What do you know? (e.g., "See `schema.ts`, `utils.py`")
    3.  **Task:** What do I want? (e.g., "Implement `Login.tsx` following the schema")
    - This structure turns "guessing" into "execution."

### SCENE D: DEBUGGING CONTEXT (WHEN THE VIBE BREAKS)
- **Goal:** Troubleshooting hallucinations.
- **Key Concept:** "Context Debugging."
- **Beat:**
    - When the model fails, don't change the prompt; check the window.
    - Is the file too long? (Truncation)
    - Is the relevant info missing? (Omission)
    - Is there conflicting info? (Poisoning)
    - The Senior Engineer treats context bugs like memory leaks.
