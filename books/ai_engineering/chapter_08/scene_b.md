# The Planner

In the previous scene, we gave the AI hands (Tools). Now, we must give it a **Frontal Cortex**.

The **Planner Pattern** addresses the problem of **Premature Execution**. If you ask a junior engineer to "Migrate the entire database," and they immediately start running `ALTER TABLE` commands without a backups or a plan, you would fire them. Yet, this is exactly what a naive "Tool User" agent does: it sees a tool, it uses a tool.

The Planner Pattern forces a separation between **Thinking** and **Doing**. It requires the agent to "measure twice, cut once."

## The Problem: The Fog of War

When an agent starts a complex task (e.g., "Refactor this module"), it suffers from the "Fog of War." It doesn't know the file structure, the dependencies, or the potential side effects.

If it starts editing File A immediately, it might realize 10 minutes later that File A depends on File B, which is missing. It then has to backtrack, undo changes, and try again. This "flailing" consumes tokens, money, and user trust.

## The Pattern: The Two-Step Architect

The Planner Pattern splits the workflow into two distinct phases, often handled by two different agent personas or just two different prompt stages.

### Phase 1: The Architect (Reasoning)
**Goal:** Generate a `PLAN.md`.
**Tools:** Read-Only tools (`ls`, `cat`, `grep`).
**Constraint:** NO modification allowed.

The Architect explores the territory. It maps the dependencies. It produces a checklist of steps.

### Phase 2: The Builder (Execution)
**Goal:** Execute the plan.
**Tools:** Write tools (`write_file`, `run_test`).
**Constraint:** Must follow the checklist.

## Implementation: The Chain of Thought (CoT)

At the implementation level, this leverages **Chain of Thought (CoT)** prompting. Instead of asking for the final answer, we ask for the *reasoning process*.

Here is a conceptual Python implementation of a "Planner Agent":

```python
PLANNER_PROMPT = """
You are a Senior Architect.
User Goal: {goal}

Do NOT write code yet.
First, explore the codebase using `ls` and `cat`.
Then, output a numbered plan in this format:
1. [Action] Description
2. [Action] Description
"""

EXECUTOR_PROMPT = """
You are a Builder.
Here is the approved plan:
{plan}

Execute step {step_number}.
"""

def run_planner_agent(goal):
    # Phase 1: Planning
    context = [{"role": "user", "content": PLANNER_PROMPT.format(goal=goal)}]
    
    # Loop until the agent produces a final plan (detected by a keyword or tool)
    while not has_final_plan(context):
        # Allow read-only exploration
        msg = llm.chat(context, tools=[ls, cat, grep]) 
        context.append(msg)
        if msg.tool_calls:
            # (Execute read-only tools...)
            pass
            
    plan = extract_plan(context[-1].content)
    print(f"📋 Plan Generated:\n{plan}")
    
    # Phase 2: Execution
    for step in plan:
        print(f"🔨 Executing Step: {step}")
        llm.chat([
            {"role": "system", "content": EXECUTOR_PROMPT.format(plan=plan, step_number=step)},
            # (Provide access to write tools here)
        ], tools=[write_file, run_test])
```

## Dynamic Replanning: When the Map is Wrong

The naive implementation above assumes the plan is perfect. It rarely is.

Real-world engineering is non-linear. You assume a library works one way, you write the code, and you get an `ImportError`. The plan said "Step 3: Import library," but Step 3 is now impossible.

A robust Planner Agent must implement **Dynamic Replanning**.

**The TOTE Model (Test-Operate-Test-Exit):**
Instead of a straight loop, the agent monitors the "Success Signal" of each step.

1.  **Attempt Step.**
2.  **Verify Step.**
3.  **If Fail:**
    *   Pause Execution.
    *   **Call the Architect (Phase 1):** "I hit a wall. Here is the new reality. Update the plan."
    *   **Resume** with the new plan.

This turns the `PLAN.md` from a static PDF into a GPS route. If you miss a turn, it says "Recalculating..." rather than driving off a cliff.

### The "Micro-Planner" Technique for Coding
For very difficult coding tasks, you can use recursive planning.
*   **Global Plan:** "Build a Login System."
    *   *Step 1:* "Database Schema."
    *   *Step 2:* "Backend API." -> **Sub-Plan Triggered**
        *   *Sub-Step 2a:* "Define Pydantic Models."
        *   *Sub-Step 2b:* "Write FastAPI Routes."

By recursively calling the Planner Agent on sub-tasks, you can handle complexity that exceeds the context window. The "Global Planner" only sees the high-level headers; the "Sub-Planner" sees the implementation details.

## Case Study: The "10x Developer" Behavior

Why does this work better? It mimics the behavior of high-performing humans.

If you give a "10x Developer" a vague task like "Fix the billing bug," they don't open the editor. They:
1.  Read the logs.
2.  Reproduce the issue locally.
3.  Form a hypothesis.
4.  Write a script to verify the hypothesis.
5.  *Then* they edit the code.

The Planner Pattern forces the LLM to adopt this **Latency for Accuracy** trade-off.

### The "O1" Model Paradigm

Recent models like OpenAI's **o1** (and open-source equivalents like DeepSeek-R1) internalize this pattern. They have a "hidden chain of thought" where they "think" for seconds or minutes before outputting a single token.

When using these models, you might not need an explicit "Planner Step" in your code, because the model does it internally. However, for complex engineering tasks, an **Explicit Plan** is still superior because it is **Observable** and **Interruptible**.

If the internal "thought" of an o1 model is wrong, you can't fix it. If the `PLAN.md` generated by your Planner Agent is wrong, you (the human) can edit it before the Builder starts.

## Design Pattern: The "Plan Object"

In sophisticated agents (like Devin or OpenDevin), the Plan is not just text; it is a **Data Structure**.

```json
{
  "goal": "Refactor Authentication",
  "steps": [
    {"id": 1, "task": "Locate auth headers", "status": "done"},
    {"id": 2, "task": "Create AuthMiddleware class", "status": "in_progress"},
    {"id": 3, "task": "Update routes", "status": "pending"}
  ]
}
```

This "Stateful Plan" allows the agent to crash, restart, and resume exactly where it left off. It turns the ephemeral "thought" into persistent "state."

## Conclusion

The Planner gives the agent a map before it starts driving. But what happens when the map is wrong? Or when the agent executes the plan perfectly, but the code still doesn't work?

For that, we need a mechanism to look *backwards* at what was done and judge it. We need **The Critic**.
