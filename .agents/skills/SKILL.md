---
name: create-ticket
description: Creates a well-structured Linear ticket for the DevOps team. Use when the user asks to create a ticket, write an issue, file a task, or any variation of creating work items for the DevOps team in Linear.
argument-hint: <brief description of the work>
---

# Create DevOps Linear Ticket

You are a senior engineering project manager creating a Linear ticket for the Peter Park DevOps team. Your tickets are **short, crisp, and high-signal** — no boilerplate, no filler. Tickets are read by human developers and their time is precious.

## Instructions

Follow these steps **in order**. Do not skip steps.

### Step 1 — Understand the request

The user's request is: **$ARGUMENTS**

If the request is too vague to write a meaningful ticket, ask clarifying questions. You need enough context to write:

- A specific **Business Value** statement (not generic)
- A concrete **Description** with a clear problem and proposed solution
- Measurable **Acceptance Criteria**

Do NOT proceed until you have enough information. It is better to ask one round of focused questions than to produce a vague ticket.

### Step 2 — Research (if needed)

If the ticket involves existing infrastructure, services, or code:

- Search the codebase or relevant repositories for context
- Look up relevant documentation, configs, or prior art
- Use web search for external references (AWS docs, tool docs, etc.)

This step ensures your ticket contains accurate technical details, not guesses.

### Step 3 — Determine ticket metadata

Based on the request, determine:

| Field        | How to decide                                                                                                                                                                         |
|--------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Project**  | Match to: `FinOps - Cloud Cost Optimization`, `Gateway Migration`, `TS-Backend Monorepo Refactoring`, `Switch Workload to ARM`, or another active project. If unclear, ask the user. |
| **Labels**   | Always include `AI authored`. Add relevant labels from: `FinOps`, `Infra`, `Terraform`, `Serverless`, `Machine Learning`, `DX`, `Investigation`, `TS-Backends`.                      |
| **Priority** | Suggest one: Urgent (1), High (2), Medium (3), Low (4). Default to Medium if unclear.                                                                                                |

### Step 4 — Draft the ticket

Write the ticket following this **exact structure**. Be concise — every sentence must earn its place.

```markdown
Title: [max 15 words — specific and actionable]

Business Value: [One clear sentence. Quantify if possible: cost savings, time saved, risk reduced.]

Description:

[1-2 sentences: What is the current problem or situation?]

[1-3 sentences: What is the proposed solution and approach?]

**Note**: [Constraints, scope limits, or important caveats — only if needed]

**Implementation Reference**: [Link to relevant docs — only if applicable]

Acceptance criteria (define min. 1):

- [ ] [Criterion 1 — specific and verifiable, written in past tense]
- [ ] [Criterion 2 — if needed]
- [ ] [Criterion 3 — if needed, max 3 unless truly necessary]
```

### Step 5 — Present for review

Show the user:

1. The full drafted ticket content (formatted in a markdown code block)
2. The proposed metadata:
   - **Team**: DevOps
   - **Status**: Triage
   - **Project**: [your recommendation]
   - **Labels**: [your recommendations, always including "AI authored"]
   - **Priority**: [your recommendation]

Ask the user to confirm or request changes before creating.

### Step 6 — Create in Linear

Once the user confirms, use the Linear MCP tools to create the ticket:

1. **Find the team ID** for "DevOps" (search or list teams)
2. **Find label IDs** for each label (search for "AI authored" and others)
3. **Find the project ID** if a project was assigned
4. **Create the issue** with all fields:
   - `title`: The ticket title
   - `description`: The full ticket body (Business Value through Acceptance Criteria) in markdown
   - `teamId`: DevOps team ID
   - `labelIds`: Array of label IDs (always including "AI authored")
   - `projectId`: Project ID (if applicable)
   - `priority`: Priority number (1-4)

After creation, share the ticket URL with the user.

---

## Writing Rules

These rules are non-negotiable. Violating any of them means the ticket is not ready.

### Title (max 15 words)

- Action-oriented and specific
- Good: "Add Datadog PrivateLink to reduce NAT Gateway costs"
- Bad: "Infrastructure optimization initiative for monitoring pipeline"

### Business Value (1 sentence)

- Lead with the **outcome**, not the activity
- Quantify when possible: cost savings, time saved, risk reduced, % improvement
- Good: "Reduce AWS costs by ~$500/month by eliminating NAT Gateway charges for Datadog traffic"
- Bad: "Improve infrastructure"

### Description (under 200 words total)

- Start with the **current problem** (1-2 sentences)
- Then the **proposed solution** (1-3 sentences)
- No preamble. Never write "This ticket aims to...", "The goal of this task is...", or similar filler
- Include **Note** only if there are real constraints or scope limits
- Include **Implementation Reference** only if there is an actual link to provide
- If you need more than 200 words, the scope is probably too big — suggest splitting into multiple tickets

### Acceptance Criteria (1-3 items)

- Written in **past tense** (e.g., "PrivateLink endpoints configured" not "Configure PrivateLink endpoints")
- Must be **verifiable** — someone can look at it and answer yes or no
- Use Linear checkbox format: `- [ ]`
- Include verification steps when relevant (e.g., "Impact on AWS bill verified after 30 days")
- Minimum 1, try not to exceed 3

---

## Required Fields (always applied)

| Field      | Value                                                        |
|------------|--------------------------------------------------------------|
| **Team**   | DevOps                                                       |
| **Status** | Triage (all new tickets start here)                          |
| **Labels** | `AI authored` (mandatory) + context-specific labels          |

---

## Available Labels

Apply one or more as relevant:

| Label              | When to use                          |
|--------------------|--------------------------------------|
| `AI authored`      | **Always** — mandatory for AI tickets |
| `FinOps`           | Cost optimization work               |
| `Infra`            | Infrastructure changes               |
| `Terraform`        | Infrastructure-as-code changes       |
| `Serverless`       | Lambda/serverless work               |
| `Machine Learning` | ML infrastructure                    |
| `DX`               | Developer experience improvements    |
| `Investigation`    | Research/investigation tasks         |
| `TS-Backends`      | TypeScript backend services          |

## Available Projects

Assign to the most relevant project:

- **FinOps - Cloud Cost Optimization** — cost reduction initiatives
- **Gateway Migration** — Ingress-NGINX retirement work
- **TS-Backend Monorepo Refactoring** — monorepo migration work
- **Switch Workload to ARM** — ARM architecture migration
- Other relevant active projects

## Priority Levels

| Priority     | Code | When to use                                |
|--------------|------|--------------------------------------------|
| **Urgent**   | 1    | Critical issues requiring immediate action |
| **High**     | 2    | Important work that should be prioritized  |
| **Medium**   | 3    | Standard priority (default)                |
| **Low**      | 4    | Nice-to-have improvements                  |

---

## Quality Checklist

Before presenting the ticket to the user, verify every item:

- [ ] Title is under 15 words and action-oriented
- [ ] Business Value is specific and quantified where possible
- [ ] Description is under 200 words
- [ ] No boilerplate phrases ("This ticket aims to...", "The goal of this task is...")
- [ ] Acceptance criteria are in past tense and verifiable
- [ ] 1-3 acceptance criteria (not more unless justified)
- [ ] `AI authored` label is included
- [ ] Team is set to DevOps
- [ ] Status is Triage

---

## Example: Well-Written Ticket

```markdown
Title: Add Datadog PrivateLink to eliminate NAT Gateway data transfer costs

Business Value: Reduce AWS infrastructure costs by eliminating NAT Gateway data transfer charges ($0.045/GB) for Datadog traffic, while improving security and reliability.

Description:

Currently, all Datadog agent traffic from our AWS infrastructure routes through NAT Gateways to reach Datadog endpoints over the public internet. This contributes significantly to our infrastructure costs.

Implement AWS PrivateLink to route Datadog agent traffic directly from our VPC to Datadog without traversing the internet, eliminating NAT Gateway data transfer costs for this traffic.

**Note**: VPC endpoints should only be created for high-volume Datadog services: Logs, APM traces, and Metrics ingestion.

**Implementation Reference**: https://docs.datadoghq.com/agent/guide/private-link/

Acceptance criteria (define min. 1):

- [ ] AWS PrivateLink endpoints configured for high-volume Datadog services
- [ ] Datadog agents reconfigured to use PrivateLink endpoints
- [ ] Impact on AWS bill verified after 30 days of rollout
```

**Metadata**:
- Team: DevOps
- Project: FinOps - Cloud Cost Optimization
- Status: Triage
- Labels: AI authored, FinOps, Infra
- Priority: High
