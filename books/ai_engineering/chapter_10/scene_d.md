# Scene D: The Conversational Loop

A single Q&A turn is easy. A conversation is hard.

The moment a user asks "What about the other one?", our naive RAG pipeline breaks. "The other one" is semantically meaningless without history.

In this final scene, we build the state machine that powers the conversation.

## The "Condense Question" Chain

Before we search, we must rewrite the user's latest query to be standalone.

**Input**:
> History:
> User: How do I configure Redis?
> Assistant: You use the redis.conf file...
> User: **Where is it located?**

**Rewritten Query**:
> "Where is the redis.conf file located?"

We can use a small, fast model (like Claude 3 Haiku) for this transformation.

```python
REWRITE_PROMPT = """
Given the following conversation and a follow-up question, rephrase the follow-up question to be a standalone question.
History: {chat_history}
Follow-up: {question}
Standalone Question:
"""

def condense_question(chat_history, question):
    # Call generic LLM with REWRITE_PROMPT
    return llm.predict(REWRITE_PROMPT.format(chat_history=chat_history, question=question))
```

## The Context Budget

As the conversation grows, `chat_history` explodes. We can't keep feeding the entire history into the prompt, or we'll run out of context (or money).

**Strategy: The Sliding Window**
We only keep the last K turns of conversation.

```python
from collections import deque

class ChatSession:
    def __init__(self, max_history=5):
        self.history = deque(maxlen=max_history)
        
    def add(self, user_msg, ai_msg):
        self.history.append(f"User: {user_msg}")
        self.history.append(f"Assistant: {ai_msg}")
        
    def get_string(self):
        return "\n".join(self.history)
```

## The Main Loop

Now we assemble the full application logic:

```python
def main_loop():
    print("🔮 The Oracle is listening... (Type 'exit' to quit)")
    session = ChatSession()
    
    while True:
        user_input = input("User: ")
        if user_input.lower() == 'exit': break
        
        # 1. Reformulate
        if len(session.history) > 0:
            search_query = condense_question(session.get_string(), user_input)
            print(f"   (Rewrote query to: '{search_query}')")
        else:
            search_query = user_input
            
        # 2. Retrieve (Scene B)
        # Using our tool from Scene B
        docs_str = search_knowledge_base(search_query) 
        
        # 3. Synthesize (Scene C)
        # We pass the ORIGINAL user input to the answerer, but the RETRIEVED docs 
        # from the reformulated query.
        answer = synthesize_answer(user_input, docs_str)
        
        # 4. Update Memory
        session.add(user_input, answer)
        
        print(f"Oracle: {answer}\n")

if __name__ == "__main__":
    main_loop()
```

## Case Study Conclusion

We have built a system that:
1.  **Ingests** knowledge into **Redis** or **pgvector**.
2.  **Retrieves** it using a semantic tool.
3.  **Synthesizes** an answer with strict citations using **Claude**.
4.  **Manages** conversational context with a rewrite loop.

This is the blueprint for 90% of "Enterprise AI" applications in 2025. It is robust, audit-friendly (thanks to citations), and capable of handling complex queries.

In the next chapter, we will leave the safe confines of read-only databases and build an agent that can *change the world*: **The DevOps Copilot**.
