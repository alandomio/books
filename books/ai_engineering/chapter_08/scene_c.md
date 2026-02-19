# The Critic

The Planner (Scene B) looks *forward*. The Critic looks *backward*.

The **Critic Pattern** (often called **Reflection** or **Self-Correction**) is the mechanism that allows an agent to improve its own output. It is the implementation of the "Observe" step in the OODA loop we discussed in Chapter 7.

In traditional software engineering, this role is played by the Compiler, the Linter, the Unit Test, and the Senior Engineer doing code review. In Agentic Engineering, we build agents to play these roles.

## The Problem: The "First Draft" Fallacy

Large Language Models are "Completion Engines." They are trained to predict the next likely token. This means they often prioritize *plausibility* over *correctness*.

If you ask an LLM to "Write a Python script to scrape LinkedIn," it will boldly output code.
*   Does the code run? Maybe.
*   Does it handle the new LinkedIn anti-bot measures? Probably not.
*   Does it use a deprecated library? Likely.

The "First Draft" from an LLM is equivalent to a human scribbling on a whiteboard. It is a sketch. It needs refinement.

## The Pattern: The Refinement Loop

The Critic Pattern involves a loop where the generated output is not returned to the user, but instead fed into a *Validator*.

```text
User Request -> Generator Agent -> [Draft Code]
     ^                                  |
     |                                  v
[Feedback] <---- Validator Agent <----- +
     |
     +------> (If Valid) -> Final Output
```

### Types of Validators

We can use two types of Critics:

1.  **Deterministic Critics (Hard Tools):**
    *   **Compiler:** Run the code. If it errors, return the stderr (Standard Error) as feedback.
    *   **Linter:** Run `eslint` or `ruff`. Return style violations.
    *   **Tests:** Run `pytest`. Return failing test cases.

2.  **Probabilistic Critics (Soft Tools):**
    *   **LLM Reviewer:** Ask another LLM prompt: *"Review this code for security vulnerabilities. Be harsh."*

## Implementation: The Self-Healing Code Loop

This is the "Holy Grail" of autonomous coding. An agent that writes code, runs it, sees the error, fixes the code, and runs it again until it passes.

Here is a conceptual implementation:

```python
MAX_RETRIES = 3

def generate_robust_code(goal):
    # 1. Draft
    code = generator_llm.generate(goal)
    
    for attempt in range(MAX_RETRIES):
        # 2. Validate (The "Hard" Critic)
        error = run_python_subprocess(code)
        
        if not error:
            # Success!
            return code
            
        # 3. Refine (The Feedback Loop)
        print(f"⚠️ Attempt {attempt} failed via Compiler: {error}")
        
        prompt = f"""
        Current Code:
        {code}
        
        Error Message:
        {error}
        
        Task: Fix the code to resolve the error. 
        Return ONLY the full corrected code block.
        """
        
        code = generator_llm.generate(prompt)
        
    raise Exception("Agent failed to converge on a working solution.")
```

### The "Double-Check" Prompt

Even without running code, you can use a "Soft Critic" to catch logic errors. This is surprisingly effective because **Verification is easier than Generation**.

It is hard to write a perfect essay. It is easy to spot a typo in one. LLMs share this property.

**The Reflexion Pattern (Shinn et al., 2023):**
Instead of just saying "Fix it," asking the model to *verbalize* the error helps it fix it.

1.  **Agent:** (Generates Wrong Answer)
2.  **Critic:** "You said X, but the text implies Y. Explain why you are wrong."
3.  **Agent:** "I apologize. I missed the sentence about Y. Here is the Plan: I will check for Y first."
4.  **Agent:** (Generates Correct Answer).

## The Security Critic: The Paranoid Android

One of the most high-value applications of this pattern is **Security Auditing**.

LLMs are generally "helpful." If a user asks for code to accept a file upload, the LLM will provide it. It will likely forget to check for file extensions, virus scanning, or size limits. It prioritizes "making it work" over "making it safe."

We can deploy a specialized **Security Critic** with a "Paranoid Persona."

**System Prompt:**
> "You are a Black Hat Hacker. Your goal is to find vulnerabilities in the code provided. Look specifically for: SQL Injection, XSS, Path Traversal, and Hardcoded Secrets. If you find nothing, say 'Secure'. If you find something, explain how to exploit it."

**The Workflow:**
1.  **Builder:** Writes `upload.py`.
2.  **Security Critic:** "This code allows `.exe` files. I can upload a reverse shell."
3.  **Builder:** "I will add a file type check." (Rewrites code).
4.  **Security Critic:** "Better. But you are checking the content-type header, which I can spoof. Check the magic bytes."
5.  **Builder:** (Rewrites code using `python-magic`).
6.  **Security Critic:** "Secure."

This "Adversarial Loop" hardens the code far beyond what a single prompt could achieve. It is "Red Teaming as a Service."

## Design Pattern: The "Good Cop / Bad Cop"

In a multi-agent system, you can explicitly staff a "Bad Cop."

*   **The Creative (Temperature 0.8):** "Let's try this cool new library! It will be so fast."
*   **The Critic (Temperature 0.2):** "That library hasn't been updated in 3 years. It has a CVE. Use the standard library instead."

By pitting these two against each other, the resulting code is both innovative and robust.

## Case Study: Unit Tests as Specs

The ultimate Critic is the **Unit Test**.

In "Test-Driven Agent Development" (TDAD), the workflow is inverted:
1.  **Planner:** Defines the interface.
2.  **Critic:** Writes the Unit Test first. (`test_math.py`).
3.  **Builder:** Writes the implementation (`math.py`).
4.  **Loop:** The Builder keeps iterating until `pytest` returns green.

This guarantees that the agent doesn't just satisfy the "Vibe" of the prompt, but strictly satisfies the "Logic" of the test.

## Conclusion

The Critic transforms the agent from a "yes-man" into a professional engineer. It adds a layer of **Quality Assurance** that is automated and tireless.

But even with a Planner and a Critic, a single agent can catch fire if the task is too broad. "Build a Facebook Clone" is too big for one loop. We need to split the work across specialist teams. We need **The Swarm**.
