# Scene C: The Risks

We must address the elephant in the server room.
If AI writes the code, and humans only "vibe check" it, what happens to Deep Knowledge?

## The Hollow Engineer

There is a real risk of creating a generation of "Hollow Engineers"—developers who can build a React app in 10 minutes using Cursor, but who panic when `npm install` fails with a C++ linkage error.

If you skip the struggle, you skip the learning.
- The **Struggle** of debugging a segfault teaches you about memory.
- The **Struggle** of optimizing a SQL query teaches you about B-Trees.

If AI removes the struggle, it might remove the mastery.
As Senior Engineers, we must guard against this. We must mentor juniors not just to "Prompt Iteratively," but to **Dive Deep** when things break. "Don't just ask ChatGPT to fix it. Ask ChatGPT to *explain* why it broke."

## Context Poisoning and Subtle Bugs

AI is probabilistic. It creates code that looks correct.
In 2024, a study found that AI-generated code is often "more secure" on average, but when it *does* introduce a vulnerability, it is often a **hallucinated package** or a subtle **logic flaw** that hides in plain sight.

The risk is not that the AI writes bad code. The risk is that the AI writes code that is *almost* perfect, lulling the reviewer into a false sense of security.
"It looks like standard boilerplate," you say, approving the PR. But deep in line 45, it uses `http` instead of `https` for an internal call.

## The Dependency on The Oracle

We are building our entire profession on top of API calls to 3 companies (OpenAI, Anthropic, Google).
If the API goes down, does development stop?
If the model changes its "Vibe" (due to RLHF alignment updates), does your prompt break?

This creates a fragility in the ecosystem. Real Engineering requires **Resilience**.
This is why we explored Open Source models (Llama 3, Mixtral) in this book. "Vibe Coding" must not become "Vendor Locking."

## The Black Box Problem

Finally, there is the issue of **Explainability**.
When an Agentic Workflow fails, debugging it is different from debugging code. You can't step through it with a debugger. You have to read logs of "Thoughts" and "Reflections."
Debugging an Agent is more like **Psychoanalysis** than Engineering. "Why did the Planner think the database was down?"

We are trading **Control** for **Leverage**. It is a trade worth making, but we must be eyes-wide-open about the cost.

In the final scene, we will make our stand. We will define the principles that guide us through this uncertain future.
