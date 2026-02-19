# Chapter 8 Briefing: Design Patterns for AI Agents

## Theme
**Architecting Intelligence.**
This chapter moves beyond the "what" (Chapter 7) to the "how." It is a cookbook of architectural patterns for building robust agents. Just as the "Gang of Four" defined patterns for OOP (Singleton, Factory, Observer), we define patterns for Agentic Engineering.

## Plot Points (The Narrative Arc)

### Scene A: The Tool User
*   **Concept:** The "Hands" of the agent.
*   **Focus:** How Function Calling works (JSON schemas). The difference between "Hallucinating a result" and "Computing a result."
*   **Key Example:** A "Database Agent" that doesn't guess SQL but runs it.

### Scene B: The Planner
*   **Concept:** The "Frontal Cortex."
*   **Focus:** Separating *Thinking* from *Doing*. The "Plan -> Execute" pattern.
*   **Key Example:** The "10x Developer" pattern (Plan first, then code).

### Scene C: The Critic (Reflection)
*   **Concept:** The "Conscience."
*   **Focus:** Self-Correction. The Loop is not just linear; it must be recursive.
*   **Key Example:** The "Linting Loop" (Generate -> Lint -> Fix -> Return).

### Scene D: The Swarm
*   **Concept:** The "Team."
*   **Focus:** Handoffs. Agent A passes context to Agent B.
*   **Key Example:** The "Triage Pattern" (Router Agent -> Specialist Agent).

## Tone & Style
*   **Pattern Language:** Use standard software engineering terminology (Inputs, Outputs, Constraints).
*   **Code-Heavy:** This chapter needs to show *code* (Python/Pseudo-code) for the patterns.
*   **Pragmatic:** Acknowledge that simple patterns are often better than complex ones.
