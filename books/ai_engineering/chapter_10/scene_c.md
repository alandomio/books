# Scene C: The Synthesis Layer

Retrieval is only half the battle. You can bring the horse to water (retrieve the right documents), but you can't make it drink (answer the question) without the right Prompt Engineering.

In this scene, we build the **Synthesis Layer**. This is where we take the messy, chunked output from our Retrieval Tool and turn it into a clean, cited answer.

## The "Context Stuffing" Strategy

When using **Anthropic's Claude**, XML tags are your best friend. Claude has been fine-tuned to pay special attention to content enclosed in tags.

Instead of just dumping text, we structure it:

```python
def format_docs_for_prompt(docs):
    xml_content = ""
    for i, doc in enumerate(docs):
        xml_content += f"""
<document index="{i+1}">
    <source>{doc.metadata['source']}</source>
    <content>
{doc.page_content}
    </content>
</document>
"""
    return xml_content
```

This clear delimitation prevents "context bleeding"—where the model confuses one document's content with another's.

## The System Prompt

This is the "Soul" of The Oracle. We need to be strict about **grounding** (only using the provided info) and **citations**.

```python
SYSTEM_PROMPT = """
You are The Oracle, an expert engineering assistant.
You have access to a knowledge base of technical documents.

Your goal is to answer the user's question using ONLY the provided context.

Rules:
1. **Cite Your Sources**: Every statement must be backed by a reference to the source document. Use the format [source_file].
2. **Be Honest**: If the context does not contain the answer, say "I don't find that information in the knowledge base." Do NOT make up an answer.
3. **Be Concise**: Technical readers value brevity.
4. **Code Blocks**: If the context contains code, preserve the formatting.

Context:
<knowledge_base>
{context_str}
</knowledge_base>
"""
```

## The Generation Code (Anthropic SDK)

Now we stitch it together. We assume `get_retrieved_docs` is the output from our Scene B tool.

```python
import anthropic

client = anthropic.Anthropic()

def synthesize_answer(query, docs):
    context_str = format_docs_for_prompt(docs)
    
    response = client.messages.create(
        model="claude-3-5-sonnet-20241022",
        max_tokens=1000,
        system=SYSTEM_PROMPT.format(context_str=context_str),
        messages=[
            {"role": "user", "content": query}
        ]
    )
    
    return response.content[0].text
```

## The Hallucination Trap

Even with strict prompts, models can hallucinate. A common failure mode is "External Knowledge Leakage"—the model answers from its training data (e.g., "How do I install Redis?") instead of your specific docs (e.g., "How do we install Redis *at Acme Corp*?").

To fix this, we can add a **Negative Constraint**:

> "Answer based ONLY on the provided context. Do not use your prior training data. If the question asks for a general explanation (e.g. 'What is Kubernetes?'), provide a brief definition but prioritize specific Acme Corp configurations found in the docs."

## Evaluating Groundedness

How do you know if the answer is accurate? In a production Vibe Coding workflow, you might use a "Critic" agent (Chapter 8) to verify:

1.  **Input**: The Answer + The Context Chunks.
2.  **Task**: "Verify that every claim in the Answer is supported by the Context. Return a score of 0-1."
3.  **Action**: If score < 0.8, refuse to show the answer.

This "Groundedness Check" is the difference between a demo and a trusted engineering tool.

In the final scene of this chapter, we will handle the most annoying part of chat bots: User Memory.
