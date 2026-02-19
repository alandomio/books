## THE ART OF CURATION

In the manual era, we managed dependencies. In the vibe era, we manage context. And just like dependencies, context can be toxic. 

We call this "Context Poisoning."

It occurs when the information available to the model actively degrades its performance. 

Imagine you are asking the model to refactor a class. You include the file in question, but you also lazily include the entire `legacy/` directory because you didn't want to filter the file tree. 

The model sees two ways to solve the problem: the modern pattern you want, and the deprecated pattern from 2019 that exists in fifty other files. 

Because LLMs are probabilistic engines, they gravitate toward the mean. If 80% of your codebase uses the old pattern, the model will hallucinate that pattern into your new feature, even if your prompt explicitly asked for the new one. 

The weight of the legacy tokens crushes the intent of the prompt.

The Vibe Architect fights this entropy through "Context Curation."

This is the art of subtraction. It is the ability to look at the context window and ask: "Does this file *need* to be here?" 

If a file does not contribute to the solution, it contributes to the confusion. 

We are seeing the rise of RAG (Retrieval-Augmented Generation) as the new "Import Statement." Instead of importing a library at the top of a file, we retrieve a slice of knowledge at the top of a prompt. 

But RAG is not magic; it is a mechanism. If your RAG pipeline retrieves outdated documentation or irrelevant test files, you are poisoning your own well.

The Senior Engineer must curate the RAG store as rigorously as they once curated the production database. 

They must ensure that the "Source of Truth" documents—the style guides, the architectural decision records, the API schemas—are pristine. These are the anchors that hold the model steady in the drift of the latent space. 

A poisoned context is worse than no context. 

With no context, the model knows it is hallucinating. With poisoned context, it believes it is referencing facts. This leads to the most dangerous type of bug: the "Confident Hallucination," where the code looks perfectly valid, uses real variable names, and calls real functions, but implements logic that is fundamentally totally wrong for the current architecture.

### Case Study: The "Zombie Config" Incident

Consider a real-world scenario from a fintech startup. The engineering team had migrated from AWS v2 SDK to v3 six months prior. However, the `OLD_README.md` and several deprecated migration scripts were left in the root directory.

A Senior Engineer asked Cursor:
> "Write a script to upload the daily transaction logs to S3 using the standard project pattern."

The Vibe Architect *should* have excluded the legacy files. They didn't. The model scanned the workspace, found the `OLD_README.md` (which contained v2 examples), and generated a script using the deprecated `boto3` client instead of the new modular v3 client.

The code looked perfect. It referenced the correct bucket names (gleaned from `config.json`). It used the correct file paths. 

But when it ran in production, it silently failed to use the new IAM role authentication because the v2 SDK handled credentials differently. The logs were lost for six hours before anyone noticed.

The failure was not in the model; the model correctly followed the instructions implicit in the file structure. The failure was in the curation. The engineer had allowed a "Zombie File" to poison the context window. 

In the manual era, a deprecated file is just clutter. In the vibe era, it is an active threat vector.

You are the gatekeeper of the window. What you let in determines what comes out.
