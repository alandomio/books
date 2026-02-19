# Scene A: The Infrastructure Agent

In the previous chapter, we built a read-only Oracle. If The Oracle makes a mistake, it just output some bad text.
In this chapter, we build **The Builder**. If The Builder makes a mistake, it could delete the production database.

We are entering the domain of **High-Stakes Agents**.

## The Architecture of Risk

When giving an AI access to `subprocess.run()`, we cannot rely on "Vibe" alone. We need rigorous architecture. We will use a **Two-Brain System** (similar to the Planner/Executor pattern from Chapter 8):

1.  **The Architect (Planner)**: Uses a high-reasoning model (Claude 3.5 Sonnet). It understands abstract goals ("Deploy a scalable VPC") and writes the plan. It *cannot* execute code.
2.  **The Engineer (Executor)**: Uses a fast, capable model (Claude 3.5 Sonnet or Haiku). It has access to the tools. It executes the plan step-by-step.

## The Toolset

Our agent needs to interact with the filesystem and the Terraform binary. We define a primitive toolset:

```python
from langchain.tools import tool
import subprocess

@tool
def write_file(path: str, content: str):
    """Writes content to a file. Overwrites if exists."""
    with open(path, "w") as f:
        f.write(content)
    return f"Successfully wrote {len(content)} bytes to {path}"

@tool
def run_shell_command(command: str):
    """
    Runs a shell command. 
    WARNING: Only allow specific allowed commands (terraform, git, ls).
    """
    allowed_programs = ["terraform", "ls", "pwd", "mkdir"]
    program = command.split()[0]
    
    if program not in allowed_programs:
        return f"Error: Command '{program}' is not allowed."

    result = subprocess.run(
        command, shell=True, capture_output=True, text=True
    )
    if result.returncode != 0:
        return f"STDERR: {result.stderr}"
    return f"STDOUT: {result.stdout}"
```

### The Sandwich of Safety

Notice the `allowed_programs` check. This is **Architecture Rule #1**: never give an agent a raw shell ("bash"). Always wrap it in a function that whitelists binaries. We don't want the agent running `rm -rf /` or `curl malicious-site.com`.

## The Sandbox (Docker)

Running this code on your laptop is brave. Running it in Docker is professional.

For this case study, we assume the Agent is running inside a container with `terraform` pre-installed and AWS credentials injected via environment variables (but *never* hardcoded).

```dockerfile
# Dockerfile for the Agent
FROM hashicorp/terraform:latest
RUN apk add --no-cache python3 py3-pip
RUN pip install langchain anthropic
COPY agent.py /app/agent.py
WORKDIR /workspace
ENTRYPOINT ["python3", "/app/agent.py"]
```

By isolating the execution environment, we limit the blast radius. If the agent goes rogue and deletes files, it deletes them in a disposable container, not your home directory.

## The "State" Problem

Unlike writing Python code, valid Terraform requires knowing the *current* state of the cloud. If you say "Create a bucket named `my-bucket`," and it already exists, Terraform will error.

Our agent needs **State Awareness**. It cannot just "fire and forget" commands; it must:
1.  **Observe**: Run `terraform show` or `terraform plan` to see what exists.
2.  **Orient**: Compare the desired state with reality.
3.  **Decide**: Generate the diff.
4.  **Act**: Apply the diff.

This Loop (OODA Loop) is the heartbeat of our DevOps Copilot. In the next scene, we will build the specific Brain tool that generates the HCL (HashiCorp Configuration Language) to drive this loop.
