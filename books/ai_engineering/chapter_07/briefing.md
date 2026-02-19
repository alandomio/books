# Chapter 7 Briefing: Agentic Workflows

## Theme
**From Single Assistant to AI Teams.**
This chapter marks the transition from "power prompting" (single-turn interactions) to "agentic engineering" (multi-step, tool-using loops). The core argument is that complex software engineering tasks cannot be solved by a single prompt, no matter how good the context is. They require a loop of reasoning, acting, and observing.

## Plot Points (The Narrative Arc)

### Scene A: The Agentic Shift
*   **The Problem:** Single-turn prompts hit a ceiling. They lack "state" and "correction."
*   **The Solution:** The Agent Loop (ReAct: Reason, Act, Observe).
*   **Key Concept:** "The Loop." An agent isn't just an LLM; it's an LLM wrapped in a runtime that executes tools and feeds the output back.
*   **Visual/Mental Model:** A flowchart showing `LLM -> Decide Tool -> Execute Tool -> Read Output -> Decide Next Step`.

### Scene B: The Orchestration Landscape (Framework Wars)
*   **The Conflict:** How do we organize multiple agents?
*   **The Contenders:**
    *   **CrewAI:** The "Corporate" Model. Role-based, hierarchical (Manager, Researcher, Writer). Best for linear, defined processes.
    *   **LangGraph:** The "State Machine" Model. Explicit control flow, cycles, branching. Best for complex, reliable, production-grade applications.
    *   **AutoGen:** The "Conversational" Model. Agents chatting to solve problems. Best for open-ended exploration and research.
*   **Guidance:** Choose the framework based on the "Control vs. Creativity" spectrum.

### Scene C: The Rise of Coding Agents
*   **The Application:** How this applies specifically to writing code.
*   **The Tools:** Cursor, Windsurf, Devin (mentioning the concept, focused on available tools).
*   **Key Concept:** "The IDE as an Agent." It's not just suggesting text; it's reading the terminal, seeing the file tree, and running builds.
*   **The Shift:** From "Copilot" (Autocomplete) to "Autopilot" (Agentic Loop).

## Tone & Style
*   **Technical but Strategic:** Explain *how* they work, but focus on *why* to choose one over the other.
*   **Opinionated:** Don't just list features. Contrast them.
*   **Forward-Looking:** This is the bleeding edge. Acknowledge that frameworks change fast, but the *patterns* (explored in Ch 8) remain.
