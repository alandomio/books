## TRUST BUT VERIFY

The Vibe Architect is not a passive spectator. They are a forensic investigator. 

In the manual era, code review was a spell-check. We looked for typos, syntax errors, and off-by-one bugs. 

In the vibe era, code review is a sanity check. We look for "Vibe Drift."

Vibe Drift is the subtle, often invisible alignment error between your intent and the model's execution. The code compiles. The tests might even pass. But the soul of the implementation is wrong. 

Maybe the model used a heavy-handed inheritance pattern when a simple composition would have sufficed. Maybe it introduced a subtle security vulnerability by hallucinating an input sanitizer that doesn't actually exist. Maybe it simply "felt" too verbose, betraying the minimalist aesthetic of the project.

The Senior Engineer must develop a "Forensic Eye." 

This is the ability to scan a 500-line diff in ten seconds and spot the one line that smells wrong. You are no longer reading every character. You are pattern-matching against your internal model of quality. 

You Trust the model to handle the syntax. You Verify the architecture.

This requires a profound shift in ego. You must be willing to "Accept All" on 90% of the diff, while being ruthlessly pedantic about the remaining 10%. 

The 10% is where the liability lives. 

The Junior engineer accepts 100%, awed by the speed. The Traditionalist accepts 0%, paralyzed by the lack of control. 

The Vibe Architect accepts the 90% that is commodity labor and scrutinizes the 10% that represents strategic risk.

This is the new "Code Review." It is less about "Did you use the right variable name?" and more about "Did you understand the security implications of this state change?" 

It is a higher-order cognitive task. 

We are moving from "Line-Level" review to "Logic-Level" review. The machine can type faster than us, but it cannot care more than us. 

### The Senior Review Checklist (The Vibe Check)

To operationalize "Trust but Verify," the Vibe Architect uses a new mental checklist. This is not about linting errors; it is about architectural integrity.

**1. The "Too Average" Check:** 
> *Does this solution look like the first result on Stack Overflow?*
> LLMs regress to the mean. If the code looks generic, it likely lacks the nuanced performance optimizations or business logic specific to your domain. Challenge it.

**2. The "Security Hallucination" Check:**
> *Did it invent a safety function?*
> Models love to call functions like `sanitizeInput()` or `validateToken()` that sound great but don't exist. Verify that every security call actually resolves to real code.

**3. The "Dependency Creep" Check:**
> *Did it import a new library for a solved problem?*
> If the model imports `lodash` just to debounce a function when you already have a `utils/debounce.ts`, reject it. Enforce the "Use Existing Primitives" constraint.

**4. The "Happy Path" Bias:**
> *Where is the error handling?*
> Models are optimists. They write code for the world where APIs never fail. The Senior Engineer must inject the pessimism: "What happens if this promise rejects? Where is the try/catch logic?"

**5. The "Ghost Logic" Check:**
> *Is there dead code?*
> Models often leave artifacts—variables declared but never used, or helper functions that were relevant in a previous draft but are now orphaned. Scan for the ghosts.

It does not know *why* the user needs this feature. It does not know *why* we chose this specific database. It only knows the probability of the next token. 

You are the "Why." 

The model provides the "How." 

When you sign off on a commit in the Vibe Coding Era, you are not certifying that you wrote it. You are certifying that you *understand* it. You are taking fiduciary responsibility for the logic, regardless of its origin. 

The cursor may have stopped blinking, but the responsibility has never been heavier.
