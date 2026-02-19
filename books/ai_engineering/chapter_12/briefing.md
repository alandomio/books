# Chapter 12: AI on AI - Recursive Self-Improvement

## Overview
We have built agents that code, agents that deploy, and agents that fix errors.
Now we reach the meta-layer: **Agents that improve Agents**.
This chapter explores the concept of "Recursive Self-Improvement" – using AI to critique, test, and optimize its own outputs.

## Key Concepts
- **The "Reviewer" Pattern**: An agent dedicated solely to finding bugs in another agent's code.
- **Test-Driven Generation**: Using AI to write the tests *before* (or alongside) the code.
- **DSPy & Prompt Optimization**: Moving from hand-written prompts to compiled prompts.
- **Constitutional AI**: Imbuing agents with a "constitution" to guide self-correction (RLAIF).

## Scene Breakdown

### Scene A: The Reviewer Agent
**Goal**: Build a "Linter on Steroids".
**Topics**:
- The "Critic" persona (from Chapter 8) applied to Pull Requests.
- Checklist-based reviewing (Security, Performance, Style).
- Code Example: A Python script that reviews a Git diff using an LLM.

### Scene B: The Test Generator
**Goal**: Trust but Verify.
**Topics**:
- "Unit Tests as Spec": Generating `test_utils.py` before `utils.py`.
- Property-Based Testing: Asking AI to generate Hypothesis strategies.
- The "Red/Green/Refactor" loop with agents.

### Scene C: The Optimization Loop
**Goal**: Tuning the Prompts.
**Topics**:
- Introduction to **DSPy** concepts (briefly).
- The concept of "Prompt Compilation": using an optimizer to find the best few-shot examples.
- Code Example: A simple "Prompt Optimizer" that re-writes a system prompt based on failure cases.

### Scene D: RLAIF & The Future
**Goal**: Scaling Oversight.
**Topics**:
- Reinforcement Learning from AI Feedback (RLAIF).
- How companies use "Teacher Models" to train "Student Models".
- The limit of recursive improvement (Efficiency vs. Intelligence Explosion).
