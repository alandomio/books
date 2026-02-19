# Chapter 11: Case Study - DevOps Copilot Agent

## Overview
In this chapter, we step out of the "read-only" world of RAG and into the "dangerous" world of Agents that can modify reality. We will build a **DevOps Copilot** capable of writing and applying Infrastructure as Code (Terraform).

## Key Concepts
- **High-Stakes Agents**: Moving from "chat" to "execution".
- **Structured Output**: Generating valid HCL (HashiCorp Configuration Language) instead of Markdown.
- **Human-in-the-loop**: The absolute necessity of "Plan" before "Apply".
- **Error Recovery**: How an agent handles `terraform apply` failures.

## Scene Breakdown

### Scene A: The Infrastructure Agent
**Goal**: Define the agent's architecture and distinct tools.
**Topics**:
- The "Two-Brain" System: One High-Level Planner (Claude 3.5 Sonnet) + One Low-Level Executor.
- Tool Definitions: `list_resources`, `read_file`, `write_file`, `run_command`.
- Security Sandboxing: Why we run this in Docker, not on bare metal.

### Scene B: The Terraform Tool
**Goal**: Teaching the agent to speak Terraform.
**Topics**:
- Prompting for HCL: "Don't explain, just output the `.tf` file."
- State Awareness: Reading the `terraform.tfstate` to know what exists.
- Code Example: A Python tool wrapper around the `terraform` binary.

### Scene C: The Safety Layer
**Goal**: Implementing the "Nuclear Launch Keys".
**Topics**:
- The "Plan Review" Workflow: Agent generates -> Human approves -> Agent applies.
- Interactive mode implementation (Python `input()` loop interruption).
- Read-Only vs. RW/Execute mode flags.

### Scene D: The "Fix It" Loop
**Goal**: Autonomous debugging of infrastructure errors.
**Topics**:
- Parsing `stderr` from Terraform.
- Strategies for fixing:
    - Syntax Errors (easy).
    - Provider Errors (medium).
    - Cloud Permission Errors (hard).
- Code Example: A recursive loop that tries to fix `apply` failures up to N times.
