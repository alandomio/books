# Scene C: The Safety Layer

Giving an AI the nuclear codes is bad.
Giving an AI the nuclear codes without a "Do you really want to launch?" button is catastrophic.

In **Vibe Coding**, we trust the "Vibes" for generation, but we trust **Verification** for execution. This scene builds the Human-in-the-Loop (HITL) safety layer.

## The Principle of "Separate Generate and Apply"

Most Agent frameworks allow you to pause execution. In LangGraph, this is called `interrupt_before`. In a simple Python loop, it's just `input()`.

We must architect our workflow into two distinct phases:
1.  **Drafting Phase**: The Agent generates files (`.tf`) and runs `terraform plan`.
2.  **Execution Phase**: The *User* reviews the plan and explicitly authorizes `terraform apply`.

## Implementing the Guardrail

Let's modify our main agent loop from Chapter 7/8 to include this gate.

```python
def run_infrastructure_agent(goal: str):
    # Phase 1: Drafting
    print("🏗️  Agent is drafting configuration...")
    agent_output = run_planner_agent(goal) 
    # (Agent writes files here)
    
    # Phase 2: Planning
    print("🔎 Running Terraform Plan...")
    plan_result = subprocess.run(
        "terraform plan -out=tfplan", 
        shell=True, capture_output=True, text=True
    )
    
    if plan_result.returncode != 0:
        print("❌ Plan Failed!")
        print(plan_result.stderr)
        return
        
    print("✅ Plan Successful. Here is the summary:")
    # We strip the noisy output and show the important part
    # "Plan: 3 to add, 0 to change, 0 to destroy."
    summary = extract_plan_summary(plan_result.stdout)
    print(summary)
    
    # Phase 3: The Gate
    confirmation = input("⚠️  Do you want to APPLY these changes? (yes/no): ")
    
    if confirmation.lower() == "yes":
        print("🚀 Applying...")
        subprocess.run("terraform apply tfplan", shell=True)
    else:
        print("🛑 Aborted by user.")
```

### Why `-out=tfplan` matters

Notice we used `terraform plan -out=tfplan`. This saves the *exact* plan to a binary file.
When we run `terraform apply tfplan`, Terraform guarantees it will execute *exactly* what was shown.
If we just ran `terraform apply` (which runs a fresh plan), the cloud state might have drifted in the 5 seconds between review and click, leading to a race condition.
**Vibe Coding Rule**: Always serialize the promise before executing it.

## The "Read-Only" Flag

Sometimes, you want the agent to just look around.
We can implement a global "Safety Mode" in our tool definitions.

```python
SAFETY_MODE = True # Env var: AGENT_SAFETY_MODE

@tool
def write_file(path, content):
    if SAFETY_MODE:
        return f"[DRY RUN] Would have written {len(content)} bytes to {path}"
    # ... actual write ...
```

This is the **"Dry Run" Pattern**. It allows the agent to hallucinate that it succeeded ("I have updated the config!") so it can continue its reasoning chain, without actually touching the disk. This is incredibly useful for testing agent logic without spinning up real EC2 instances.

## Interactive Refinement

What if the User says "No"?
The loop shouldn't just end. The "No" should be feedback.

**User**: "No, you are deleting the production database! Don't do that."

This feedback goes back into the context window.
**Agent**: "I apologize. I will modify the `main.tf` to prevent the destruction of `aws_db_instance.prod`."

This transforms the Safety Layer from a simple gate into a **Collaboration Interface**. The Human becomes the Senior Engineer reviewing the Junior AI's Pull Request.

In the final scene of this chapter, we handle the messiest part of DevOps: when the `apply` crashes halfway through.
