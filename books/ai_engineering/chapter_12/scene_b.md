# Scene B: The Test Generator

"A bug is only a bug if a test fails."

If we want autonomous agents to write code, we must also have autonomous agents that *verify* code. We cannot rely on the human to run `pytest` every 30 seconds.

In this scene, we build **The Quality Assurance (QA) Agent**: an agent whose sole job is to break the code written by other agents.

## The TDD Agent

Test-Driven Development (TDD) is annoying for humans but perfect for AI.
1.  **Input**: "Create a function `calculate_mortgage(principal, rate, years)`".
2.  **QA Agent**: Writes `test_mortgage.py` with 5 edge cases (0% interest, negative years, floating point precision).
3.  **Dev Agent**: Writes `mortgage.py`.
4.  **System**: Runs `pytest`. Fails.
5.  **Dev Agent**: Reads error, fixes code.
6.  **System**: Runs `pytest`. Passes.

### Generating "Vibe Checks" (Tests)

Writing tests is a distinct skill from writing code. A good QA Agent needs a **Skeptical Persona**.

```python
QA_SYSTEM_PROMPT = """
You are a QA Engineer obsessed with edge cases.
Your goal is to write a Pytest file for the functionality described by the user.

# Guidelines
1. **Diverse Inputs**: Test happy path, null values, boundaries (0, -1, MAX_INT), and type errors.
2. **Mocking**: If the code calls an API, use `unittest.mock`. Do NOT make real network calls.
3. **No Implementation**: Do not write the actual function. Only import it and test it.
"""
```

### The Hallucinated Test Problem

One major risk: The QA Agent might import `calculate_mortgage` from `utils.py`, but the Dev Agent decides to put it in `finance.py`. Or the QA Agent assumes the function returns a `float`, but the Dev Agent returns a `Decimal`.

We solve this with **Contract-First Design**.
1.  **Step 1**: Agents agree on the **Function Signature** (Interface).
2.  **Step 2**: Both write their parts against that signature.

```python
signature = "def calculate_mortgage(principal: float, annual_rate: float, years: int) -> float:"
```

## Property-Based Testing (Hypothesis)

LLMs are bad at random numbers. Python is good at them.
We can ask the LLM to write a **Hypothesis** strategy.

"Write a property-based test that asserts: *The remaining balance should never increase if the interest rate is 0*."

```python
from hypothesis import given, strategies as st

@given(st.floats(min_value=0, max_value=1e6), st.integers(min_value=1, max_value=30))
def test_zero_interest_balance_reduction(principal, years):
    payment = calculate_mortgage(principal, 0, years)
    # Total paid should be exactly equal to principal
    assert abs((payment * years * 12) - principal) < 0.01
```

By generating these high-leverage tests, the AI multiplies its reasoning power. It doesn't need to check 100 cases manually; it just needs to write the logic that checks 100 cases.

## The Loop: Red, Green, Refactor

In a full Agentic Workflow, the QA Agent is the gatekeeper.
- **Planner**: "I want a mortgage calculator."
- **QA Agent**: *Writes tests.*
- **Dev Agent**: *Writes code.*
- **Orchestrator**: *Runs tests.*
    - **If Pass**: Merge.
    - **If Fail**: Send stderr back to Dev Agent. "Your code failed checks. Fix it."

This **Self-Correcting Loop** is the engine of recursion. The code improves until it satisfies the rigorous constraints set by the QA Agent.

But who improves the QA Agent? Who improves the Prompt?
In the next scene, we automate the Prompt Engineering itself.
