# AutoGen: The Conversation

Microsoft's **AutoGen** takes a radically different approach. If CrewAI creates an "Org Chart" and LangGraph creates a "Circuit Board," AutoGen creates a "Chat Room."

The core philosophy of AutoGen is that **Computation is a Conversation**. You solve problems by letting multiple agents (including the human) talk to each other.

This framework shines in scenarios that are **Exploratory** or **Code-Heavy**. It was one of the first frameworks to popularize the idea of "Agents writing and executing code locally."

## Core Concepts: Two-Way Radios

AutoGen simplifies the world into two main types of agents:

### 1. The Assistant Agent (The Brain)
This is the LLM. It can generate plans, write Python code, and debug errors. But it cannot *run* the code. It has no hands.

### 2. The User Proxy Agent (The Body)
This represents *you* (or a runtime environment). It can:
*   prompt the user for input.
*   **Execute code** detected in the Assistant's message.
*   Feed the execution result (stdout/stderr) back to the Assistant.

## The Loop: Validated Execution

The magic happens when you put them together.

```python
from autogen import UserProxyAgent, AssistantAgent

# 1. Define the Assistant (The LLM)
assistant = AssistantAgent(
    name="coder",
    llm_config={"model": "gpt-4", "api_key": "..."},
    system_message="You are a Python Expert. Write code to solve the user's problem. Reply TERMINATE when done."
)

# 2. Define the User Proxy (The Executor)
user_proxy = UserProxyAgent(
    name="user",
    human_input_mode="NEVER", # Fully autonomous
    code_execution_config={"work_dir": "coding_task", "use_docker": False}
)

# 3. Start the Chat
user_proxy.initiate_chat(
    assistant,
    message="Plot a chart of NVDA and AMD stock prices YTD and save it to stock_plot.png."
)
```

**What happens next?**

1.  **User Proxy:** Sends the message.
2.  **Assistant:** "I will use `yfinance` and `matplotlib`. Here is the code: ..." (Blocks of Python).
3.  **User Proxy:** (Intercepts the code block). Runs it locally.
    *   *Scenario A (Success):* Sends "Reference to stock_plot.png created."
    *   *Scenario B (Failure):* Sends "ModuleNotFoundError: No module named 'yfinance'."
4.  **Assistant:** (Reads error). "Ah, I need to install it. Here is the code: `pip install yfinance`."
5.  **User Proxy:** Runs the pip install.
6.  **Assistant:** "Now running the plot script again."

This is the **Self-Healing Loop** (Chapter 8, Scene C) automated entirely by the conversation structure.

## Group Chats: The Swarm

AutoGen allows for more than just 1-on-1 dialogues. You can create a `GroupChat` with many agents and a `GroupChatManager` that decides who speaks next.

```python
user_proxy = UserProxyAgent(name="Admin")
coder = AssistantAgent(name="Coder")
designer = AssistantAgent(name="Product_Designer")
critic = AssistantAgent(name="Critic")

groupchat = autogen.GroupChat(
    agents=[user_proxy, coder, designer, critic], 
    messages=[], 
    max_round=12
)

manager = autogen.GroupChatManager(groupchat=groupchat, llm_config=llm_config)

user_proxy.initiate_chat(
    manager, 
    message="Build a snake game in Python."
)
```

The dynamic selection of the next speaker allows for **Emergent Behavior**.
*   The Designer might jump in: "Make the snake green."
*   The Coder writes it.
*   The Critic interrupts: "There is a bug in the collision logic."

This feels less like a pipeline and more like a Hackathon.

## Human-in-the-Loop

AutoGen has the best support for "Lazy Human Interaction."
By setting `human_input_mode="ALWAYS"`, the User Proxy pauses after *every* assistant message.

*   **Assistant:** "I will delete all files in the directory."
*   **User Proxy:** (Prompts you).
*   **You (Typing):** "NO! Only delete the .tmp files."
*   **Assistant:** "Understood. Updating code to filter for .tmp."

This allows you to steer the swarm without writing code yourself. You are the Captain; they are the crew.

## Best Practices for AutoGen

1.  **Docker is Mandatory:** AutoGen executes code. If an agent writes `os.system("rm -rf /")`, it will run it. Always use the Docker execution mode in production or testing.
2.  **Termination Strings:** Agents love to chat. They will say "Thank you" and "You're welcome" forever. You must train them to use a strict keyword (like `TERMINATE`) to signal the end of a task so the loop stops.
3.  **System Prompts:** Just like CrewAI, the persona matters. A specific "Critic" prompt ("You are a nitpicker") works better than a generic one.

## The RAG Agent: RetrieveChat

AutoGen has a specialized agent capability called `RetrieveUserProxyAgent`. This is designed for "Chat with Data" scenarios (Chapter 5, Scene B).

It handles the complexity of:
1.  Chunking documents.
2.  Embedding them into a vector db (ChromaDB default).
3.  Injecting the relevant chunks into the Assistant's context.

```python
from autogen.agentchat.contrib.retrieve_user_proxy_agent import RetrieveUserProxyAgent

rag_proxy = RetrieveUserProxyAgent(
    name="rag_proxy",
    human_input_mode="NEVER",
    retrieve_config={
        "task": "qa",
        "docs_path": "./pdf_files",
    }
)

rag_proxy.initiate_chat(assistant, problem="Summarize the PDFs.")
```

This eliminates the boilerplate of setting up a RAG pipeline manually.

## Function Mapping: The Tool Glue

While `UserProxyAgent` can execute code, sometimes you want it to execute *defined functions* (like in LangGraph).
AutoGen supports `register_function`.

```python
def get_weather(city: str):
    return "Sunny"

autogen.register_function(
    get_weather,
    caller=assistant,  # The LLM who calls it
    executor=user_proxy, # The runtime that executes it
    description="Get weather"
)
```

This hybrid approach allows you to mix "Wild Python Execution" with "Safe API Calls" in the same chat.

## Conclusion

AutoGen is the most "Agentic" of the frameworks because it grants the most autonomy. It assumes that if you give smart models a terminal and a chat window, they can figure it out.

But this chaos comes at a price. It is hard to debug. It is hard to constrain.
In the final scene of this chapter, we will line up LangGraph, CrewAI, and AutoGen side-by-side and decide which one deserves your API credits.
