# Scene A: Building the Knowledge Index

The "Hello World" of AI Engineering is a chat bot. The "Enterprise Hello World" is a RAG (Retrieval-Augmented Generation) system over a proprietary knowledge base.

In this case study, we are building **The Oracle**: an assistant that answers questions about a fictional company's engineering playbooks, architecture decision records (ADRs), and post-mortem reports.

We will focus on the most critical part of the stack: the **Storage Layer**. While it's easy to start with a local vector store, production systems demand robustness. We will implement and compare two industry standards: **Redis** (for high-performance, real-time ingestion) and **PostgreSQL with pgvector** (for ACID compliance and relational data mixing).

We are using **Anthropic's Claude** as our reasoning engine. Since Anthropic does not provide its own embedding models (at the time of writing), we will pair it with **Voyage AI**, a provider specializing in high-quality retrieval embeddings that pair exceptionally well with Claude.

## The Ingestion Pipeline

Before we store anything, we must transform our raw text into vectors. The pipeline is standard but sensitive to details:
1.  **Load**: Read the raw Markdown/PDF files.
2.  **Split**: Chunk the text into manageable pieces.
3.  **Embed**: Convert text chunks into floating-point vectors.

### Step 1: The Loader and Splitter

We aren't just splitting by character count. That breaks code blocks and semantic meaning. We use a syntax-aware splitter.

```python
import os
from langchain_community.document_loaders import DirectoryLoader, TextLoader
from langchain_text_splitters import RecursiveCharacterTextSplitter

def load_and_split_documents(directory: str):
    loader = DirectoryLoader(directory, glob="**/*.md", loader_cls=TextLoader)
    docs = loader.load()
    
    # "Vibe Check": Why 1000/200? 
    # 1000 chars is roughly a paragraph or a small function.
    # 200 chars overlap ensures context flows across boundaries.
    splitter = RecursiveCharacterTextSplitter(
        chunk_size=1000, 
        chunk_overlap=200,
        separators=["\n## ", "\n### ", "\n", " ", ""] # Respect markdown headers
    )
    chunks = splitter.split_documents(docs)
    print(f"Loaded {len(docs)} documents, created {len(chunks)} chunks.")
    return chunks
```

### Step 2: The Embedder (Voyage AI)

Voyage AI offers models (`voyage-3`, `voyage-code-2`) optimized for retrieval. They typically outperform generic models on technical domains.

```python
# pip install voyageai langchain-voyageai
from langchain_voyageai import VoyageAIEmbeddings

embeddings = VoyageAIEmbeddings(
    voyage_api_key=os.getenv("VOYAGE_API_KEY"),
    model="voyage-3" 
)
```

## Option A: The Speed Demon (Redis)

Redis is an in-memory data store. With the `RediSearch` module (included in Redis Stack), it becomes a high-performance vector database.

**Why Redis?**
- **Latency**: Sub-millisecond retrieval.
- **Throughput**: Handles thousands of QPS (Queries Per Second).
- **Expiration**: Built-in TTL (Time To Live) is perfect for ephemeral knowledge (e.g., user session context).

**The Setup**:
You need a generic Redis instance with vector modules enabled (or utilize Docker).

```bash
docker run -d --name redis-stack -p 6379:6379 -p 8001:8001 redis/redis-stack:latest
```

**The Code**:

```python
from langchain_community.vectorstores.redis import Redis

def ingest_to_redis(chunks, embeddings, index_name="oracle_kb"):
    # Redis schema definition is implicit in LangChain but can be explicit for control
    rds = Redis.from_documents(
        chunks,
        embeddings,
        redis_url="redis://localhost:6379",
        index_name=index_name
    )
    # Persist logic is automatic in Redis Stack RDB/AOF configuration
    return rds

# Usage
# index = ingest_to_redis(chunks, embeddings)
```

Redis shines when your "Knowledge Base" is hot data—like recent Slack threads or active support tickets.

## Option B: The Reliable Default (pgvector)

PostgreSQL is likely already in your stack. With the `pgvector` extension, it becomes a competent vector store.

**Why pgvector?**
- **Simplicity**: No new infrastructure to manage.
- **ACID**: Transactional integrity (if the row update fails, the vector update fails).
- **Hybrid Search**: Trivially join vector results with SQL `WHERE` clauses (e.g., `SELECT * FROM docs WHERE embedding <=> query_vec < 0.2 AND author_id = 5`).

**The Setup**:
Enable the extension in your Postgres DB.

```sql
CREATE EXTENSION IF NOT EXISTS vector;
```

**The Code**:

```python
from langchain_postgres import PGVector

def ingest_to_postgres(chunks, embeddings, collection_name="oracle_kb"):
    connection_string = "postgresql+psycopg://user:pass@localhost:5432/db"
    
    vector_store = PGVector(
        embeddings=embeddings,
        collection_name=collection_name,
        connection=connection_string,
        use_jsonb=True,
    )
    
    vector_store.add_documents(chunks)
    return vector_store
```

`pgvector` is ideal for long-term storage, "cold" knowledge (wikis, PDFs), and when you need strict relational filtering.

## Comparative Analysis: Choose Your Weapon

| Feature | Redis (In-Memory) | pgvector (Relational) |
| :--- | :--- | :--- |
| **Latency** | Extremely Low (<1ms) | Low to Medium (depending on index) |
| **Scale** | Limited by RAM (expensive) | Limited by Disk (cheap) |
| **Persistence** | Configurable (RDB/AOF) | Strong (WAL, Point-in-time recovery) |
| **Filtering** | RediSearch Query Syntax | Full SQL Power |
| **Operational Complexity** | Medium (Need Redis Stack) | Low (It's just Postgres) |
| **Best For** | Real-time agents, Caching, Session Memory | Knowledge Bases, Document Archives, Metadata-heavy apps |

## The "Hybrid" Approach (Best of Both)

In a mature AI Engineering architecture, we often use **both**:
1.  **pgvector** as the "Source of Truth" (the deep archive).
2.  **Redis** as the "Semantic Cache".

Before hitting the LLM or the Postgres DB, we check Redis: "Have we answered a similar question recently?" If the user asks "How do I reset my password?", and we answered that 10 seconds ago for someone else, the semantic similarity match in Redis returns the cached answer instantly.

This creates a system that is both **durable** and **fast**.

## Next Steps

We have our vectors indexed. Whether they live in RAM (Redis) or on Disk (Postgres), they are just numbers sitting in the dark.

In the next scene, we will build the **Retrieval Tool** that gives our Agent the flashlight to find them.
