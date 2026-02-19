

## ADVANCED CONTEXT STRATEGIES

Naive RAG (taking the top 3 vectors and dumping them into the prompt) is the "Hello World" of Context Engineering. It works 60% of the time. In production software, 60% is a failing grade.

To reach 99% accuracy—the level required for automated refactoring or security auditing—we must deploy **Advanced Context Strategies**. We need to move from being a "Librarian" (who points to a shelf) to a "Curator" (who selects the exact pages you need).

### Strategy 1: Hybrid Search (The Best of Both Worlds)

As discussed in Chapter 4, Embeddings have a "Semantic Gap." They are great at concepts, bad at specifics.

-   **Vector Search:** Finds "Authentication Logic." (Good).
-   **Keyword Search:** Finds `ERR_AUTH_001`. (Bad).

The solution is **Hybrid Search**. We run two parallel queries for every user request.
1.  **Dense Retrieval:** We scan the Vector DB for semantic matches.
2.  **Sparse Retrieval:** We scan a BM25 (Best Matching 25) index or an Inverted Index for exact keyword matches.

If the user asks: *"Fix the bug in the `processTransaction` function where it throws `InsufficientFunds`."*
-   The Vector Search finds `TransactionManager.ts` (Concept match).
-   The Keyword Search finds `ErrorDefinitions.ts` (Exact match for the error string).

We then fuse these results using **RRF (Reciprocal Rank Fusion)**. This algorithm normalizes the scores from both lists and merges them. If a file appears in *both* lists, its score skyrockets. This ensures we get both the high-level logic and the low-level constants required to solve the problem.

**The Math of RRF:**
**Score(d) = Σ (1 / (k + rank(d, r)))**
Where $k$ is a constant (usually 60).
This formulas dampens the impact of "outliers" (files ranked #1 in one list but #1000 in the other) and boosts the signal of files that are "consistently good" across both search methods. It is the "Consensus Engine" of retrieval.

```python
# The Reciprocal Rank Fusion Algorithm
def reciprocal_rank_fusion(results_dict, k=60):
    fused_scores = {}
    for system_name, doc_list in results_dict.items():
        for rank, doc_id in enumerate(doc_list):
            if doc_id not in fused_scores:
                fused_scores[doc_id] = 0
            # The boost is higher if the rank is lower (0-indexed)
            fused_scores[doc_id] += 1 / (rank + k)
            
    # Sort docs by highest fused score
    reranked = sorted(fused_scores.items(), key=lambda x: x[1], reverse=True)
    return reranked
```

### Strategy 2: Re-ranking (The Second Opinion)

Retrieval is fast but "blurry." Vector databases optimize for speed (Approximate Nearest Neighbors), not perfect accuracy. They might return 50 "potential" chunks.
We cannot feed 50 chunks (20k tokens) to the LLM; it would trigger the "Lost in the Middle" effect.

We need a filter. We need a **Re-ranker**.
A Re-ranker (like Cohere Rerank or BGE-Reranker) is a specialized model that takes a pairs of (Query, Document) and outputs a precise Relevance Score (0.0 to 1.0).
It is much slower than a Vector DB, but much smarter.

**Bi-Encoders vs. Cross-Encoders**


-   **Vector DB (Bi-Encoder):** Computes the vector for the Document *once* (offline). Computes the vector for the Query *once*. Compares them via Dot Product. Fast.
-   **Re-ranker (Cross-Encoder):** Takes the Query and the Document and feeds them *both* into the model simultaneously. The Attention mechanism compares every token of the Query to every token of the Document.
    -   *Result:* Massive accuracy gain.
    -   *Cost:* 100x slower.
This is why we only re-rank the top 50 results, not the whole database. This architecture is called **Retrieval-Refinement**.

**ColBERT (Late Interaction):**
A middle ground is ColBERT (Contextualized Late Interaction over BERT). It approximates Cross-Encoder accuracy with Bi-Encoder speed by delaying the interaction step until the very end. Tools like RAGatouille make this accessible for Python engineers.

**The Advanced Pipeline:**
1.  **Retrieve (Wide Net):** Get the top 50 chunks from the Vector DB. (Milliseconds).
2.  **Re-rank (Filter):** Pass those 50 chunks through the Re-ranker. (Seconds).
3.  **Select (Precision):** Take the top 5 re-ranked chunks.
4.  **Generate:** Feed only those 5 into the LLM.

This architecture—**Retrieve-Rerank-Generate**—is the gold standard for high-accuracy coding agents. It ensures that the context window contains only High-Signal data.

### Strategy 3: Dynamic Context Curation

Context is not static. It should adapt to the *intent* of the query.
Most RAG systems use a "One Size Fits All" approach.
The Vibe Architect builds **Context Routers**.

**The Router Pattern:**
We use a small, fast LLM (like GPT-3.5 or Claude Haiku) to classify the user's intent *before* we do any retrieval.

**System Prompt (The Switchboard):**
```text
Role: You are the Context Router for a Payment Gateway codebase.
Task: Classify the user query into one of the following ROUTING_KEYS.

KEYS:
- DATABASE (Schema, SQL, Migrations)
- FRONTEND (React, Tailwind, CSS)
- PAYMENTS (Stripe, PayPal, processing logic)
- DEVOPS (Terraform, Docker, CI/CD)

Input: "Why is the table layout broken on mobile?"
Output: FRONTEND

Input: "Add a column for transaction_id."
Output: DATABASE
```

**User Query:** *"Why is the database migration failing?"*
**Router:** "Intent: Database / SQL."
**Action:**
-   **Inject:** `schema.sql` (hard-coded rule).
-   **Retrieve:** Search only the `/db` folder.
-   **Ignore:** `/frontend` folder.

**User Query:** *"Center this div."*
**Router:** "Intent: CSS / UI."
**Action:**
-   **Inject:** `tailwind.config.js` (hard-coded rule).
-   **Retrieve:** Search only `.css` and `.tsx` files.

By pre-filtering the search space based on intent, we eliminate noise before it even enters the pipeline. We show the model exactly what it needs to see to be an expert in that specific domain.

### Strategy 4: Context Stuffing vs. Compression

Sometimes, you *do* need the whole file.
If you are asking for a "Refactor of `UserService.ts`," RAG is dangerous. If RAG only retrieves chunks 1, 3, and 5 of the file, the LLM will hallucinate the missing lines (2 and 4). It might delete methods it didn't see.

**Vibe Rule:**
-   **For Q&A:** Use RAG (Chunks).
-   **For Refactoring/Editing:** Use Context Stuffing (Whole Files).

When editing, **Completeness > Efficiency.**
You must provide the *entire* file content to ensure the LLM maintains the integrity of the code structure.
However, you can still compress.
-   **Remove Comments:** Strip dense JSDoc comments to save tokens.
-   **Tree-Shaking:** If the file imports a massive library, do not include the library source—just the import statement.

Advanced tools (like Mentat or Aider) build a "Context Map" of the repository structure (file names and signatures) and only "expand" the full content of the files actively being edited. This allows them to "see" the whole project map while focusing their "eyes" (tokens) on the surgical site.

### Strategy 5: HyDE (Hypothetical Document Embeddings)
Sometimes, the user's query is too short for semantic search.
*Query:* "Login bug."
*Vector:* A vague vector that matches everything related to "Login" or "Bugs."

**The HyDE Hack:**
We ask an LLM to *hallucinate* a fake answer first.
*Prompt:* "Write a hypothetical code snippet that fixes a login bug in a TypeScript React app."
*Hypothetical Document:* `function handleLogin() { try { await auth.signIn() } catch (e) { console.error(e) } }`

We vectorise this *fake code*.
Then we search the Vector DB for real code that looks like the fake code.
*Result:* We find the actual retrieval logic because the "Vibe" of the solution matches the "Vibe" of the real code better than the "Vibe" of the question did.

### Strategy 6: Context Compression (LLMLingua)
If you *must* include a massive file, and you are running out of tokens, use **Context Compression**.
Tools like Microsoft's **LLMLingua** use a small, cheap model (e.g., GPT-2 or Llama-7B) to calculate the "Perplexity" (Surprise) of every token in your context.
-   Common tokens ("the", "function", "import") have low perplexity. We delete them.
-   Rare tokens ("user_id", "0x5f3e", "CriticalErr") have high perplexity. We keep them.

You can compress a 10,000-token prompt into 2,000 tokens while retaining 95% of the reasoning performance. The output looks like broken English ("Func user_id auth..."), but the LLM understands it perfectly. It is "Zip" for prompts.
