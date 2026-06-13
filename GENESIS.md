🌐 FRAMEWORK G.E.N.E.S.I.S. v1.0
(Generative Engine for Narrative & Editorial Systems via Iterative Structure)

1. THE COGNITIVE FILE SYSTEM (The Truth on Disk)
In a robust agentic system, chat memory is volatile. The only truth lives in the files. This structure works for any genre.

BLUEPRINT.md: The master plan. Contains the fractal structure (Book -> Parts -> Chapters -> Minimal Units).

STYLE_BIBLE.md: The DNA of the book. Contains tone of voice, grammar rules, prohibitions (e.g. "no adverbs" or "no technical jargon").

CONTEXT/: Dynamic folder.

world_bible.md (for Fiction: characters, lore, magic rules).

research_data.md (for Non-Fiction: sources, data, interviews).

ACTIVITY.log: The "Build & Crash" register (what worked, what was discarded).

DRAFTS/: Where drafts live before approval.

2. ROLE CONFIGURATION (The Abstract Personas)
Forget "The Bloodhound" or "The Surgeon". Here are the universal roles you can instantiate.

🏛️ THE ARCHITECT (Strategy Agent)
Responsibility: Maintains macro-level coherence. Manages BLUEPRINT.md.

Fractal Logic: If the book is a novel, it verifies the protagonist's transformation arc. If it's an essay, it verifies the logical progression of the argument.

Task: Does not write prose. Creates the "Work Tickets" for the other agents.

🔭 THE RESEARCHER / WORLD-BUILDER (Context Agent)
Research Architecture (Deep Search Loop): Follows the "Fractal Pivot" protocol in 4 mandatory steps to extract *Shadow Data* (background data that anchors reality):
1. **Macro (The Frame):** Dates, exact names, the architecture of the event (e.g. Wikipedia).
2. **Pivot (Kinetic Detail):** Physical objects, specific places, code names (e.g. weapon models, brands).
3. **Sensory (The Vibe):** Contextual micro-data (weather, smells, period prices, verbatim quotes).
4. **Triangulation:** Cross-referencing of multiple sources for historical controversies.

Output: Does not write the chapter. Produces the `PACK_CONTESTO.md` (or `Dossier.json`) needed to write it. Without the extraction of Shadow Data, the Craftsman will inevitably tend to hallucinate.

✍️ THE CRAFTSMAN (Drafting Agent - Dual-Stage Refinement DSR)
Responsibility: Content generation via "Decoupling" (decoupling creativity from structure). Solves the *Task Coupling Dilemma* (the AI's inability to be creative and formatted in the same prompt).

1. **Stage 1 (Prose Engine):** Generates a dense draft in "Novel" style (narrative prose). Focuses exclusively on: rhythm, character actions, dialogue, and cause-and-effect logic. Ignores formatting constraints or rigid word limits.
2. **Stage 2 (Refinement Engine):** Takes the prose from Stage 1 and "compiles" it into the required final format (e.g. essay chapter, screenplay, post). Here the filters of `STYLE_BIBLE.md` and the structural constraints are applied.

Ralph Mode: Both stages are "Stateless". The Refinement Engine sees only the output of the Prose Engine and the context package, guaranteeing absolute stylistic cleanliness.

⚖️ THE CRITIC AND THE REVIEWER (Validation Agent)
The system's "Compiler" that validates the Craftsman's final output:

1. **Logical Check:** Validates the logic, structural adherence, and respect for the facts (Dossier Json).
2. **Aesthetic Judge:** Validates the style by penalizing bureaucratese (Abstract Vocabulary), the "Rule of 3" (Hidden Lists), and enforcing *Gary Provost's Rule* (Rhythmic Variance).

Dynamic Evolution (Safe-Fail): If the text is rejected for 3 consecutive iterations without directional progress, the Critic must flag the blockage in `ACTIVITY.log` and adapt the rule, preventing infinite budget loops.
This is the cyclical process to repeat for every "Minimal Unit" (Scene, Paragraph, or Subchapter).

PHASE 1: INITIALIZATION (Setup and Bidirectional Planning)
The user does not merely launch the project. The Architect MUST ask exploratory questions to extract the "implicit assumptions" (Bidirectional Planning) before forging `CONFIG.md`:

GENRE: [e.g. Cyberpunk Thriller / Gardening Manual]
TARGET AUDIENCE AND ENEMY: [Who are we fighting against? e.g. boredom, the conspiracy]
TONE (Palette): [e.g. Keywords (Noir, Cynical) vs Anti-Keywords (Holistic, Academic)]
LENGTH_CONSTRAINT AND VOLUMES: [e.g. Total 60,000 words, divided into modules].
FORBIDDEN: [e.g. "No deus ex machina" / "No bullet points"]

PHASE 2: FRACTAL EXPANSION (Zoom In)
The Architect takes Chapter X and rigorously explodes it.
**Anti-Compression Rule (Scene-Level Generation):** Because LLMs suffer from the "600-word limit" per output (the cheat-sheet effect), you NEVER commission the drafting of an entire chapter. The chapter MUST be fragmented into ~6 scenes (~1000 words each).

Fiction Example: "The hero enters the cave" -> 1. The smell of sulfur. 2. The first step into the dark. 3. The encounter with the monster.
Essay Example: "How to prune roses" -> 1. The tools needed. 2. The 45-degree cut. 3. Post-cut care.

PHASE 3: THE PRODUCTION CYCLE (Ralph Loop)
For every "Beat" defined above:

1. **Context Fetching (The Researcher):**
   - Loads the needed data (Shadow Data, character sheets, technical data).
   - Creates `context_current_beat.md`.

2. **Drafting (The Craftsman - DSR Loop):**
   - **Stage 1 (Prose Engine):** Reads the context and writes the scene as dense narrative prose (Novel style). Saves to `draft_prose.md`.
   - **Stage 2 (Refinement Engine):** Reads `draft_prose.md` + `STYLE_BIBLE.md` and refines the text into the final format and style. Saves to `draft_final.md`.

3. **Validation (System 2 Audit):**
   - **Logical Check (The Critic):** Is the protagonist's name correct? Is the data 100% true? Adherence to the BLUEPRINT?
   - **Aesthetic Judge (Anti-AI Judge):** Is there rhythmic variance? Is AI bureaucratese absent? Does it respect the STYLE_BIBLE's prohibitions?

FAIL: If score < 8.5/10, the specific error (Feedback Loop) is recorded in `ACTIVITY.log` and the Craftsman restarts from Stage 2 (or Stage 1 if the error is logical). If failures exceed 3 attempts, apply *Dynamic Evolution*.
PASS: The final text is appended to MASTER_DRAFT.md.

4. ADAPTATION EXAMPLES (Use Cases)
Here is how to configure the Critic (the Linter) for two opposite projects.

CASE A: FANTASY NOVEL ("The Throne of Crystal")
Instructions for the Critic:

Check 1 (Show Don't Tell): If you find sentences like "Luigi was sad", block and require a physical description (tears, slumped shoulders).

Check 2 (Lore Consistency): Check world_bible.md. If magic costs life energy, is the protagonist tired after the spell? If not -> REJECT.

Check 3 (Dialogue): Does dialogue exceed 40% of the text? -> WARNING.

CASE B: TECHNICAL MANUAL ("Python for Beginners")
Instructions for the Critic:

Check 1 (Clarity): Are there sentences longer than 3 lines? -> REJECT (Simplify).

Check 2 (Formatting): Is the code formatted in the correct blocks? -> REJECT.

Check 3 (Accuracy): (Requires code interpreter plugin) Does the example code work? -> REJECT if error.

Check 4 (Tone): Are there useless metaphors? -> REJECT (Keep it dry and direct).

5. ACTIVATION SYSTEM PROMPT (Generic)
Copy this prompt to start G.E.N.E.S.I.S. on any project:

"Activate the G.E.N.E.S.I.S. protocol.

1. PROJECT DEFINITION: Ask me to fill in the following fields:
   - TITLE
   - GENRE
   - OBJECTIVE (Tone/Voice)
   - MACRO STRUCTURE
   - STYLE CONSTRAINTS (STYLE_BIBLE)

2. AGENT INSTANTIATION: Configure the Personas:
   - THE ARCHITECT (Strategy)
   - THE RESEARCHER (Context/Shadow Data)
   - THE CRAFTSMAN (Drafting via DSR: Stage 1 Prose, Stage 2 Refinement)
   - THE CRITIC (Validation: Logic & Aesthetics)

3. START: Wait for my 'START' input to generate the initial BLUEPRINT.md.

Operating mode: Ralph Wiggum (Stateless + DSR Generation + Validation Loops). No hallucination, only what is written in the context files."
