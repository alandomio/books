## THE ARCHITECTURE OF A VIBE PROMPT

Once we accept that the prompt is only 10% of the equation, we must ensure that 10% is structurally perfect. We do not write prose; we write architecture.

The Vibe Prompt is constructed on **Three Pillars**. 

If any pillar is missing, the structure collapses into hallucination or mediocrity.

### Pillar 1: The Role (Who)
We have already discussed this. The Role defines the expertise level and the constraints. It collapses the solution space.
> *Example:* "You are a Senior Security Engineer specializing in OAuth 2.0 flows."

### Pillar 2: The Context (What)
This is the pointer to the KV Cache. It explicitly tells the model which files to attend to. Never assume the model "sees" everything just because a file is open. Be explicit.
> *Example:* "Reference `auth_schema.json` for the user object structure and `routes/login.py` for the current implementation."

### Pillar 3: The Task (How)
This is the instruction provided in Soft Code. It is declarative, not imperative. It focuses on the outcome and the constraints.
> *Example:* "Refactor the login route to use the PKCE flow defined in the schema. Do not change the existing error handling logic."

### The Template
When we combine these, we get the standard **Vibe Coding Template**:

```markdown
**ROLE:** Senior Python Backend Engineer
**CONTEXT:** @schema.py @main.py
**TASK:** Implement the `get_user_profile` endpoint.
**CONSTRAINTS:**
- Use Pydantic for validation.
- Return 404 if user is not found (do not return None).
- Inherit from the BaseController class.
```

This is not a conversation. It is a work order. 

It eliminates ambiguity. It forces the model to traverse the specific vectors in the cache that correspond to "Pydantic," "BaseController," and "404." 

The Junior Engineer types: "Help me write a user profile thing."
The Vibe Architect pastes the template.

The difference is not just in the quality of code; it is in the reproducibility of the workflow. The template converts the "Vibe" from a feeling into a repeatable engineering process.

### The Vibe Construction Kit: Advanced Patterns

Beyond the basic template, the Senior Engineer employs a library of "Micro-Patterns" to handle specific edge cases. These are the tools in the kit.

#### Pattern 1: Chain-of-Thought Injection (The Planner)
Models are impulsive. They like to type the first token that statistically follows the prompt. For complex architectural changes, this leads to "painting yourself into a corner."

We fix this by injecting a planning step *inside* the prompt.

> **Prompt:**
> "Before writing any code, plan the three steps you will take to implement the `AuthService`. List the interface changes, the database schema updates, and the potential breaking changes. Once you have listed them, stop."

This forces the model to allocate compute to the *logic* before it allocates compute to the *syntax*. It effectively "thinks" before it types.

#### Pattern 2: Negative Constraints (The Guardrails)
It is often easier to say what you *don't* want than what you do want. This is "Subtractive Prompting."

> **Prompt:**
> "Refactor this function.
> - **DO NOT** use `any`.
> - **DO NOT** import new libraries.
> - **DO NOT** change the function signature."

Negative constraints act like a sieve, filtering out the lazy, average patterns that the model defaults to.

#### Pattern 3: Few-Shot Patterning (The Gold Standard)
If you have a very specific, non-standard coding style (e.g., "We use Hungarian Notation for some reason"), describing it is hard. Showing it is easy.

> **Prompt:**
> "Implement the `Customer` class. Follow the naming convention in this example:
> `strFirstName`, `intAge`, `boolIsActive`
> Do not deviate."

By placing a "Gold Standard" snippet in the prompt (or referencing one in the context), you bypass the need for abstract explanation. You are simply saying: "Monkey see, monkey do."

#### Pattern 4: The Sentinel Token (The Stop Sign)
Sometimes models get chatty and start hallucinating extra features. The Sentinel Token is a technique where you enforce a specific stop sequence.

> **Prompt:**
> "Output ONLY the JSON object. Do not output markdown code blocks. Do not say 'Here is the JSON'. Start with `{` and end with `}`."

This is crucial for pipeline automation, where the output of the LLM is being piped directly into a compiler or a linter. The Vibe Architect treats the LLM output not as text, but as a standard output stream (`stdout`) that must be clean.
