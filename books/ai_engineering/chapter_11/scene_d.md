# Scene D: The "Fix It" Loop

DevOps is 10% writing code and 90% reading error messages.
"Error: CIDR block overlaps." "Error: Instance type not supported in us-east-1."

A truly useful agent doesn't quit when `terraform apply` fails. It reads the error, thinks, fixes the code, and tries again.

## The Reflexion Pattern (Applied to Ops)

We can adapt the "Reflexion" pattern (from Chapter 8) for infrastructure.

1.  **Action**: Run command.
2.  **Observation**: Catch STDERR.
3.  **Reflection**: "Why did this fail? How do I fix it?"
4.  **Correction**: Edit file.
5.  **Retry**: Goto 1.

### The Code

```python
MAX_RETRIES = 3

def run_with_auto_fix(command, objective):
    attempts = 0
    while attempts < MAX_RETRIES:
        print(f"🔄 Attempt {attempts+1}/{MAX_RETRIES}: Running '{command}'...")
        result = subprocess.run(
            command, shell=True, capture_output=True, text=True
        )
        
        if result.returncode == 0:
            print("✅ Success!")
            return result.stdout
            
        print("❌ Command Failed.")
        print(f"Error: {result.stderr}")
        
        # Invoke the "Fixer" Agent
        print("🔧 Asking Agent to fix the code...")
        fix_prompt = f"""
        Objective: {objective}
        Command: {command}
        Error Output:
        {result.stderr}
        
        Task: Analyze the error. Use the 'write_file' tool to fix the Terraform code.
        """
        
        # This call blocks until the agent has used tools to edit the files
        agent.run(fix_prompt)
        
        attempts += 1
        
    print("💀 Maximum retries reached. Human intervention required.")
```

## Case Study: The CIDR Conflict

Let's see this loop in action.

**Scenario**: The User asked for a VPC with `10.0.0.0/16`.
**Attempt 1**:
- Agent writes `vpc.tf` with `10.0.0.0/16`.
- `terraform apply` fails.
- **Error**: `Error: invalid CIDR address: 10.0.0.0/16 overlaps with existing VPC vpc-123456`.

**The Fix Loop**:
1.  **Agent reads error**: "Overlaps with existing VPC."
2.  **Agent thinks**: "I need a non-overlapping range. Let me try `10.1.0.0/16`."
3.  **Agent acts**: Calls `write_file("vpc.tf", content=...)` replacing the CIDR strings.
4.  **Auto-Retry**: The script runs `terraform apply` again.

**Attempt 2**:
- `terraform apply` succeeds.

This "Self-Healing" capability allows the agent to navigate the dusty corners of cloud APIs without bothering the human for every syntax error or quota limit.

## Conclusion: The New Senior Engineer

We have built a **DevOps Copilot** that:
1.  **Plans** architecture using high-level reasoning.
2.  **Generates** valid Terraform HCL using system prompts.
3.  **Inspects** reality using state files.
4.  **Safety Checks** with the human before touching production.
5.  **Fixes Itself** when the cloud provider throws an error.

This is not just a chatbot. It's an **Agentic Workflow**.

In the final chapters of this book, we will turn the lens inward. We have used AI to build software; now we will use AI to *improve itself*.
**Chapter 12: Recursive Self-Improvement**.
