

## ITERATIVE REFINEMENT (THE FEEDBACK LOOP)

There is a dangerous myth in Vibe Coding: **The Zero-Shot Myth.**
The idea that if you write the *perfect* prompt, the AI will spit out the *perfect* code in one go.

This is false.
Even humans don't write perfect code in one go. We write a draft, we run it, we see a syntax error, we fix it, we refactor it.
Why do we expect the AI to be different?

The Senior Vibe Architect treats the initial output not as the "Solution," but as the **"Prototype."**
True quality comes from **Iterative Refinement Loops**.

### The Draft-Critique-Refine Cycle

Instead of a linear process (Prompt -> Code), we design a circular process.

**Step 1: The Vomit Draft (High Temperature)**
We ask the AI to generate a solution. We encourage creativity.
*Prompt:* "Draft a React component for a Data Grid. It needs sorting and filtering. Don't worry about types yet, just get the structure."
*Result:* A messy but functional component. It might have `any` types. It might lack error handling. But the *logic* is there.

**Step 2: The Critic (The Auditor Persona)**
This is the magic step. We do not ask the *same* agent to fix it. We spin up a *new* agent (or reset the persona) to be the **Critic**.
*Prompt:* "Act as a Senior Code Reviewer. Review the code above. Look for:
1. Security vulnerabilities (XSS).
2. Performance bottlenecks (re-renders).
3. Accessibility issues (ARIA labels).
List your findings. Do not rewrite the code yet."

**Why a separate step?**
LLMs are bad at critiquing their own output in the same generation pass. They suffer from "Confirmation Bias." If they wrote a bug, they tend to justify it.
By forcing a "stop," swapping the persona to "Critic," and asking for a critique *before* the fix, we trigger a different mode of reasoning. We force the model to look at the code "objectively."

**The Critic Protocol (System Prompt):**
```text
Role: You are the Chief Security Officer.
Task: Ruthlessly audit the code provided.
Bias: Assume the code is broken and insecure.
Output: A Markdown list of "Severity: High/Medium/Low" issues.
Do not be nice. Be accurate.
```

**The Refinement Protocol (System Prompt):**
```text
Role: You are the Lead Engineer.
Task: Fix the code based on the Critic's feedback.
Constraint: Do not revert any functional logic, only fix the issues.
```

This "Good Cop / Bad Cop" dynamic is the engine of high-quality agentic code.

### The Feedback Loop Visualization
Imagine a loop:
1.  **Generator:** Produces `v1.ts`.
2.  **Critic:** Scans `v1.ts`. Finds 3 bugs. Pass/Fail = Fail.
3.  **Generator:** Reads critique. Produces `v2.ts`.
4.  **Critic:** Scans `v2.ts`. Finds 0 bugs. Pass/Fail = Pass.
5.  **Output:** `v2.ts`.

In a traditional workflow, the human plays the role of the Critic. In a Vibe Workflow, we automate the Critic. The human only reviews the final "Pass."

### Chain of Thought (Thinking Out Loud)

Another form of refinement happens *during* the generation: **Chain of Thought (CoT)**.
If you ask an LLM: "Write a complex SQL query to calculate retention."
It might jump straight to `SELECT *...` and make a logic error.

If you prompt: "Explain your reasoning step-by-step, then write the query."
The model forces itself to "think."
1.  "First, I need to define what 'retention' means..."
2.  "I need to join the users table with the login_events table..."
3.  "I need to filter for the last 30 days..."

By outputting these tokens, the model effectively "writes code to its own scratchpad." It builds up intermediate context that guides the final SQL generation.
**Vibe Rule:** For any logic more complex than a loop, always demand Chain of Thought. "Think before you code."

### Self-Correction loops (The Compiler Agent)

In Agentic Workflows (which we will cover more in Chapter 7), we automate this loop.
We give the agent a tool: `run_compiler`.

1.  **Agent:** Writes code.
2.  **Tool:** Runs `tsc` (TypeScript Compiler).
3.  **Result:** `Error: Property 'id' does not exist on type 'User'.`
4.  **Agent:** Reads error. "Ah, I missed the interface definition." Rewrites code.
5.  **Tool:** Runs `tsc`. Success.

This is **Self-Correction**.
The model is not just guessing; it is verifying.
A Senior Engineer doesn't trust the AI to write code. They trust the AI to *fix* its own code until the compiler stops complaining.

```python
# The Self-Healing Loop (Conceptual Pattern)
def generate_code_with_retry(prompt, max_retries=3):
    code = llm.generate(prompt)
    
    for attempt in range(max_retries):
        error = run_compiler(code)
        if not error:
            return code # Success!
            
        # The Vibe Repair Step
        print(f"Attempt {attempt} failed: {error}")
        code = llm.generate(f"""
        Your previous code failed to compile.
        Error: {error}
        
        Fix the code. Do not apologize. Just output the corrected block.
        """)
        
    raise Exception("Model failed to converge on working code.")
```

### The "Rubber Duck" Effect

Iterative Refinement also works on the Human.
When you are forced to critique the AI's output ("That's wrong, you missed the edge case"), you clarify the requirements in your own head.
"Oh wait, *I* missed the edge case. I didn't tell it about the leap year rule."

The conversation becomes a mirror. By guiding the AI, you guide yourself. You become a better architect because the AI forces you to be explicit about your vibes.
You cannot just wave your hands; you must articulate the constraint.
And in articulating it, you solve it.

### The Refinement Latency Trade-off

One critique of iterative refinement is speed.
"If I have to run the loop 3 times, isn't that slow?"
Yes.
But we must distinguish between **Latency** and **Throughput**.
-   **Zero-Shot Coding:** Low Latency (5s), Low Reliability (60%). Time to Debug: 30 minutes.
-   **Iterative Coding:** High Latency (30s), High Reliability (95%). Time to Debug: 0 minutes.

The "Slow" AI is actually faster for the Engineer because it eliminates the "Cleanup Phase."
As Vibe Architects, we gladly pay the token tax and the time tax to buy Reliability. We are not optimizing for "Words per Minute"; we are optimizing for "Working Features per Hour." 
In the long run, the cheapest code is the code you don't have to debug at 3 AM. The Critic Agent ensures you sleep.
