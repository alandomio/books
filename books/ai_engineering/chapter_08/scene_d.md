# The Swarm

We have defined the **Tool User** (Hands), the **Planner** (Brain), and the **Critic** (Conscience). Now we assemble them into an organization.

The **Swarm Pattern** (also known as Multi-Agent Collaboration or Handoffs) addresses the limitations of a single context window. A single agent, no matter how smart, cannot be an expert in everything. It inevitably gets confused if you ask it to "Process 300 PDF files, extract the data, insert it into SQL, and write a frontend dashboard."

The context gets "poisoned" with irrelevant details. The SQL schema bleeds into the Frontend logic.

## The Pattern: The Router and Handoff

The core mechanic of a Swarm is the **Handoff**. It implies that one agent can modify the state and then pass control to another agent with a different system prompt.

### 1. The Triage Pattern (The Router)

This is the front desk. The user talks to a "Router Agent" whose ONLY job is to classify the request and call the right sub-agent.

```text
User Request: "My SQL query is slow."
     |
     v
[Router Agent] --- (Classifies as DATABASE) ---> [DB Specialist Agent]
```

**System Prompt for Router:**
"You are a Triage Officer. You do not answer questions. You only output one of the following words: `[DATABASE, FRONTEND, SALES]`. If unsure, output `GENERAL`."

### 2. The Relay Pattern (The Pipeline)

In a relay, Agent A finishes its work and *outputs* the prompt for Agent B.

*   **Agent A (researcher):** Scrapes the web and summarizes findings into `research.txt`.
*   **Agent B (Writer):** Reads `research.txt` and writes a blog post.
*   **Context Cleansing:** Crucially, Agent B *does not see* the raw search logs of Agent A. It only sees the summary. This keeps the context clean and focused.

## The Protocol: How Agents Talk

If Agents are going to collaborate, they need a standard language. We can't just dump raw text strings back and forth. We need a **Agent Communication Protocol (ACP)**.

A robust protocol includes **Metadata**.

```json
{
  "sender": "ResearchAgent",
  "recipient": "WriterAgent",
  "timestamp": "2025-10-24T12:00:00Z",
  "priority": "HIGH",
  "payload": {
    "summary": "The user wants a blog post about RAG.",
    "key_findings": ["RAG is growing", "Vector DBs are essential"],
    "sources": ["arxiv.org/123", "github.com/langchain"]
  },
  "constraints": {
    "max_words": 500,
    "forbidden_words": ["delve", "tapestry"]
  }
}
```

By wrapping the handoff in this JSON envelope, we ensure that Agent B knows *who* is talking and *what* the constraints are.

**The "Shared Blackboard" Pattern:**
For complex swarms, instead of passing messages directly, all agents write to a shared "Blackboard" (State Object).
*   **Researcher** writes to `state.knowledge_base`.
*   **Critic** writes to `state.validation_errors`.
*   **Manager** reads `state` and decides who moves next.

This decouples the agents. The Researcher doesn't need to know the Writer exists; it just knows it needs to fill the `knowledge_base`.

## The Context Budget Problem

A hidden danger in Swarms is **Context Inflation**.

If Agent A passes its entire conversation history to Agent B, and Agent B adds its own thoughts and passes it to Agent C, the context grows exponentially. By the time it reaches Agent E, the "Signal-to-Noise Ratio" is terrible, and the API bill is astronomical.

**The Solution: Summarization Gates.**
Design the Handoff so that it *compresses* information.

*   **Raw Handoff (Bad):**
    `history = [msg1, msg2, msg3, ... msg100]`

*   **Compressed Handoff (Good):**
    `context = "Agent A researched the topic and found 3 key papers. It recommends focusing on X."`

Every time an agent finishes a task, it should run a final step: **"Summarize your work for the next agent."** This "Exit Summary" becomes the "Entry Prompt" for the next link in the chain.

## Implementation: The Supervisor

A robust Swarm uses a **Supervisor Agent** (a glorified Planner) that maintains the global state and delegates tasks.

Here is a conceptual implementation of a Supervisor loop:

```python
# The "Team"
agents = {
    "RESEARCHER": ResearcherAgent(),
    "CODER": CoderAgent(),
    "TESTER": TesterAgent()
}

def run_swarm(goal):
    history = []
    next_agent = "RESEARCHER" # Start with research
    
    while next_agent != "FINISH":
        print(f"🔄 Handoff to: {next_agent}")
        
        # 1. Provide Context (Filtered)
        current_agent = agents[next_agent]
        response = current_agent.run(goal, history)
        
        history.append(f"[{next_agent}]: {response}")
        
        # 2. Supervisor Decides Next Step
        supervisor_prompt = f"""
        Goal: {goal}
        History: {history}
        
        Who should work next? 
        Options: [RESEARCHER, CODER, TESTER, FINISH]
        """
        next_agent = supervisor_llm.generate(supervisor_prompt).strip()

    return "Mission Accomplished"
```

## Case Study: The "DevOps + Coder" Swarm

Real-world engineering often requires two distinct skill sets:
1.  **DevOps:** Knows Docker, Terraform, AWS.
2.  **Coder:** Knows Python, logic, algorithms.

If you try to combine these into one "Super Engineer" prompt, it often hallucinates. It tries to import boto3 in the Terraform file.

**The Solution:**
Design two separate agents with strictly defined tools.
*   **DevOps Agent:** Has `kubectl`, `terraform`. Cannot write app code.
*   **Coder Agent:** Has `vim`, `python`. Cannot touch infra.

When the Coder needs a database, it asks the Supervisor: "I need a DB connection string."
The Supervisor activates the DevOps agent: "Provision a DB and give the connection string to the Coder."
The DevOps agent runs Terraform, gets the output, and hands it back.

## Complexity vs. Reliability

The Swarm is powerful, but dangerous. Use it only when necessary.

*   **1 Agent:** Reliable, fast, easy to debug. (Use for 80% of tasks).
*   **2 Agents:** manageable. (Good for "Draft + Critic").
*   **3+ Agents:** Chaos. Infinite loops. Agents arguing with each other.

**The Law of Conservation of Complexity:**
Agent swarms do not remove complexity; they move it from the *code* to the *prompts* and the *orchestration*. Debugging a swarm is harder than debugging a monolith.

## Conclusion

We have now assembled the full toolkit of Agentic Design Patterns:
1.  **The Tool User** connects AI to the world.
2.  **The Planner** prevents chaotic execution.
3.  **The Critic** ensures quality and robustness.
4.  **The Swarm** scales intelligence across domains.

In the final chapters of this book, we will look at the tools (Chapter 9) and real-world case studies (Chapter 10 & 11) to see these patterns in production.
