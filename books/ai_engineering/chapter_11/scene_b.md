# Scene B: The Terraform Tool

The heart of a DevOps agent is its ability to generate valid **Infrastructure as Code (IaC)**. If it hallucinates a resource type that doesn't exist (e.g., `aws_super_server` instead of `aws_instance`), the `terraform plan` will fail.

We need to teach the Agent to "Speak Terraform".

## The System Prompt for HCL

We don't just ask for code; we strictly define the output format.

```python
TERRAFORM_AGENT_PROMPT = """
You are a Senior DevOps Engineer. Your goal is to write Terraform HCL code to satisfy user requirements.

# Guidelines
1. **Providers**: Assume 'hashicorp/aws' ~> 5.0.
2. **Best Practices**: Use 'resource' blocks with snake_case names.
3. **No Hardcoding**: Use variables for regions, instance types, and especially SECRETS.
4. **Output**: When asked to write code, use the 'write_file' tool to create 'main.tf', 'variables.tf', or 'outputs.tf'.

# Context
Current Directory: {cwd}
Existing Files: {files}

# Task
{user_objective}
"""
```

Notice the context injection: `{files}`. Before the agent writes anything, it must know *what handles already exist*. If `main.tf` is full of S3 buckets, it shouldn't overwrite it with EC2 instances unless instructed. It should append or create `ec2.tf`.

## Reading the "World State"

The most powerful command in our agent's arsenal isn't `apply`—it's `terraform show -json`.

This command returns the **state** of the infrastructure as a JSON object. We can give this (or a summarized version) to the LLM so it knows *exactly* what is deployed.

```python
import json

@tool
def get_current_state():
    """Returns a summary of currently deployed resources."""
    # 1. Ensure state exists
    if not os.path.exists("terraform.tfstate"):
        return "No state file found. Infrastructure is empty."
        
    # 2. Run terraform show
    result = subprocess.run(
        "terraform show -json", 
        shell=True, capture_output=True, text=True
    )
    
    # 3. Parse and Summarize
    # (Raw state is too big for context window, so we compress it)
    try:
        state_data = json.loads(result.stdout)
        resources = []
        for res in state_data.get('values', {}).get('root_module', {}).get('resources', []):
            resources.append(f"{res['type']}.{res['name']} (ID: {res.get('values', {}).get('id')})")
        
        return "\n".join(resources)
    except json.JSONDecodeError:
        return "Error parsing state JSON."
```

By adding `get_current_state` to the agent's toolbox, we enable **Delta-Based Reasoning**:
*   **User**: "Add a load balancer."
*   **Agent**: *Calls get_current_state* -> Sees `aws_instance.web`.
*   **Agent**: "I see existing web instances. I will create an `aws_lb` target group attached to `aws_instance.web`."

Without this tool, the agent is flying blind, guessing at resource names.

## Handling Secrets and Variables

A Junior Engineer hardcodes API keys. A Senior Engineer uses environment variables. An AI Agent... tends to act like a Junior Engineer unless trained otherwise.

 We enforce the **"TF_VAR Pattern"**:
1.  The Agent writes `variable "db_password" {}` in `variables.tf`.
2.  The Agent *does not* write the value.
3.  The Agent instructs the user: "Please set the `TF_VAR_db_password` environment variable before running apply."

This is a critical **Safety Guardrail**. The Agent should *never* handle the actual secret string; it should only handle the *pointer* to the secret.

## The Workflow So Far

1.  **User**: "Deploy an RDS Postgres database."
2.  **Agent**: *Reads State* (Empty).
3.  **Agent**: *Writes `rds.tf`* (Resource definitions).
4.  **Agent**: *Writes `variables.tf`* (Declares `db_password`).
5.  **Agent**: "I have written the configuration. Please export `TF_VAR_db_password` and run the plan."

But wait—who runs the plan? The Agent? Or the User?

In the next scene, we build the **Safety Layer** that prevents the robot from accidentally deleting production.
