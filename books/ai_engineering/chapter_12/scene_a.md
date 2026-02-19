# Scene A: The Reviewer Agent

The first step in "AI improving AI" is **Observation**. Before we can fix code, we must judge it.

Every engineer knows the pain of waiting for a Code Review. What if your first reviewer was an AI that never sleeps, knows the entire codebase, and has zero tolerance for security vulnerabilities?

In this scene, we build **The Reviewer**: an agent that plugs into your CI/CD pipeline to critique Pull Requests.

## The Problem with LLM Reviews

If you just copy-paste a diff into ChatGPT and ask "Review this," you get garbage:
1.  **Hallucinated Standards**: "You should use `x` style" (when the team uses `y`).
2.  **Nitpicking**: "Add a docstring here" (on a private helper function).
3.  **Praise**: "Good job!" (We don't pay for praise; we pay for bugs).

To build a **Vibe Coded** Reviewer, we need to constrain it to be a **High-Signal Critic**.

## The Architecture

Our Reviewer Agent runs as a GitHub Action (or Git Hook).

1.  **Input**: `git diff main...HEAD`.
2.  **Context**: The `README.md` and `CONTRIBUTING.md` (to learn the standards).
3.  **Output**: A list of structured comments (File, Line, Severity, Message).

```python
import sys
import openai

REVIEWER_SYSTEM_PROMPT = """
You are a Principal Security Engineer.
Your goal is to review the following git diff for CRITICAL issues.

# Rules
1. **Silence is Golden**: If a chunk looks good, say NOTHING. Do not praise.
2. **Focus Areas**:
   - Security Vulnerabilities (Injection, Secrets).
   - Performance (N+1 queries, heavy loops).
   - Logic Errors (Off-by-one, null pointer risks).
3. **Format**: return a JSON list of objects: {file, line, severity, message}.
4. **Severity**: "Critical", "Warning", or "Nitpick". ONLY return "Critical" or "Warning". Ignore Nitpicks.

# Context
The codebase is Python 3.11 using FastAPI and SQLAlchemy.
"""

def review_diff(diff_content):
    response = openai.chat.completions.create(
        model="gpt-4-turbo",  # Use a smart model for reviewing!
        messages=[
            {"role": "system", "content": REVIEWER_SYSTEM_PROMPT},
            {"role": "user", "content": f"Diff to review:\n{diff_content}"}
        ],
        response_format={"type": "json_object"}
    )
    return response.choices[0].message.content
```

## The "Context-Aware" Review

A diff is often not enough.
If I change `process_data(user)` to `process_data(user, strict=True)`, the diff looks fine. But what if `process_data` is defined in another file and doesn't accept `strict`? The review fails.

To fix this, our agent needs **Repo Awareness**.
Instead of just sending the diff, we use a **Tree-Sitter** tool (from Chapter 5) to grab the definitions of modified functions.

1.  Identify changed functions in `diff`.
2.  Retrieve full function bodies from disk.
3.  Send `(Diff + Full Function Body)` to the LLM.

## The Nitpick Filter

Even with instructions, AI loves to nitpick. We can solve this with a **Two-Pass Architecture**:

1.  **Pass 1 (The Intern)**: The LLM generates *all* possible comments.
2.  **Pass 2 (The Senior)**: A second call filters the list. "Review these proposed comments. Discard any that are subjective styling preferences or minor non-blocking issues. Keep only logical bugs and security risks."

This "Refining Loop" drastically increases the signal-to-noise ratio, making the bot useful rather than annoying.

## Conclusion

We now have an agent that can say "This code is broken."
The next logical step is: "Okay, smart guy. **Fix it.**"

In the next scene, we will explore **Test Generation**: the art of proving code is broken before fixing it.
