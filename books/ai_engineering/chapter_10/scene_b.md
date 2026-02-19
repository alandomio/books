# Scene B: The Retrieval Tool

We have a database full of vectors. Now we need to give our Agent a way to access them.

In a traditional script, you would just call `db.search(query)`. But an Agent is not a script; it's a reasoning engine that *decides* when to search. We must wrap our search logic in a **Tool** with a clear **Schema**.

## The Anatomy of a Tool

For Anthropic's Claude (and most modern LLMs), a tool is defined by:
1.  **Name**: Unique identifier (e.g., `search_knowledge_base`).
2.  **Description**: A natural language prompt explaining *when* and *how* to use the tool.
3.  **Input Schema**: A JSON schema (usually generated from Pydantic) defining the arguments.

### Defining the Input Schema

The single most important part of "Vibe Coding" an agent is writing excellent Pydantic field descriptions.

```python
from langchain.pydantic_v1 import BaseModel, Field

class SearchInput(BaseModel):
    query: str = Field(
        description="The semantic search query. Should be a complete question or statement, not just keywords."
    )
    section_filter: str = Field(
        description="Optional. Filter by document section (e.g., 'API', 'Architecture', 'HR'). Use if the user explicitly mentions a category.",
        default=None
    )
    max_results: int = Field(
        description="Number of results to return. Default to 5.",
        default=5
    )
```

Notice the `description` fields. We are explicitly coaching the model: "Should be a complete question... not just keywords." This prevents the agent from searching for "password" and getting irrelevant noise; instead, it will search for "How do I reset my password?".

## Implementing the Tool Function

Now we connect the schema to our storage (Redis or pgvector).

```python
from langchain.tools import tool

# Assume 'vector_store' is our initialized Redis or PGVector instance from Scene A

@tool(args_schema=SearchInput)
def search_knowledge_base(query: str, section_filter: str = None, max_results: int = 5) -> str:
    """
    Search the engineering knowledge base for relevant docs. 
    Returns relevant chunks with their source file paths.
    """
    print(f"🕵️ Agent is searching for: '{query}' (Filter: {section_filter})")
    
    # 1. Apply Filters (if supported)
    # in Redis/RediSearch this might be a pre-filter
    # in PGVector this is a metadata filter
    filter_dict = {}
    if section_filter:
        filter_dict = {"section": section_filter}
        
    # 2. Perform Similarity Search
    # "similarity_search_with_score" gives us the distance
    docs_and_scores = vector_store.similarity_search_with_score(
        query, 
        k=max_results,
        filter=filter_dict
    )
    
    # 3. Format the Output
    # The agent doesn't need objects, it needs text.
    results = []
    for doc, score in docs_and_scores:
        # Filter out bad matches if necessary (thresholding)
        if score > 0.6: # Distance threshold (adjust based on metric)
            continue
            
        results.append(f"Source: {doc.metadata['source']}\nContent: {doc.page_content}\n-----")
    
    if not results:
        return "No relevant documents found in the Index."
        
    return "\n".join(results)
```

## Security: The Invisible Fence

When giving an Agent access to data, **Row-Level Security (RLS)** is paramount.

If you are using **pgvector**, you can leverage PostgreSQL's native RLS policies.
1.  Add a `user_id` or `group_id` column to your vector table.
2.  Create a Postgres Policy: `CREATE POLICY agent_select ON embeddings FOR SELECT USING (group_id = current_setting('app.current_group_id'));`
3.  In your Python tool, ensure the connection session sets `app.current_group_id` correctly before the query.

If you are using **Redis**, you often need to implement this in the application layer (the Python function above), by passing a mandatory filter that the Agent *cannot* override (i.e., don't expose `user_id` in the Pydantic model; inject it from the backend context).

## Vibe Check: Tool Descriptions

The description of the function itself (`search_knowledge_base.__doc__`) is part of the prompt.
- **Bad**: "Searches the DB."
- **Good**: "Call this tool whenever the user asks technical questions about the codebase, architecture, or company policies. Do not use for general chit-chat. The query should be semantically complete."

By refining this description, you tune the Agent's "trigger discipline"—ensuring it only fires the retrieval when actually needed.

In the next scene, we will look at what happens *after* the tool returns: The Synthesis Layer.
