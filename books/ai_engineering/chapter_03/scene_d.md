## DEBUGGING CONTEXT (WHEN THE VIBE BREAKS)

Even with the perfect architecture, the model will sometimes fail. It will generate a function that references a variable that doesn't exist. It will hallucinate a library import. It will get stuck in a loop.

The amateur reaction is to blame the model: "GPT-4 is stupid today."
The amateur reaction is to change the prompt: "Maybe if I say PLEASE it will work."

The Senior Engineer reaction is to **Debug the Context**.

When the output is wrong, it is almost always because the input was flawed. We treat hallucinations as "Context Leaks." The model leaked reality because the context verified provided was insufficient to hold the truth.

### The Context Debugging Algorithm

**1. Check for Truncation:**
Is the file too big? Did we exceed the token limit? If the `utils.py` file is 30,000 tokens long, the model might have truncated the bottom half—exactly where your function definition lived. 
*Fix:* Split the file or pass only the relevant interface.

**2. Check for Omission:**
Did I assume the model knew about `constants.ts`? If I didn't explicitly include it, the model is guessing the values of those constants.
*Fix:* Add the missing reference.

**3. Check for Poisoning:**
Is there a conflicting file? Do I have `v1_api.ts` and `v2_api.ts` both in the window? The model might be merging the two schemas into a Frankenstein object.
*Fix:* Remove the noise.

**4. Check for Attention Drift:**
Is the context window simply too full of junk? If you have 50 files open, the "needle" of your logic is lost in the "haystack" of your repository. 
*Fix:* Close all tabs. Open only the 3 files that matter. Clear the chat history. Start fresh.

Context Debugging is the skill of realizing that the LLM is a deterministic function of its input. If $f(x) = y$ and $y$ is wrong, then $x$ is wrong. 

Stop yelling at the function. Fix $x$.

The Vibe Architect does not pray for good code. They engineer the environment where bad code is statistically impossible.

### Forensics of a Hallucination: The "Ghost Import"

To illustrate this, let's walk through a real-world debugging session.

**The Symptom:**
Your model keeps generating code that calls `User.get_full_name()`, but the build fails with `AttributeError: 'User' object has no attribute 'get_full_name'`.

**The Amateur Debug:**
> *User:* "You are wrong. User does not have that function. Fix it."
> *Model:* "I apologize. Here is the fix." (Generates `User.get_full_name()` again).
> *User:* "STOP IT."

**The Forensic Debug:**
The Senior Engineer pauses. The model is deterministic. It is not lying to annoy you; it is attending to *something* that tells it `get_full_name` exists.

1.  **The Grep:** The engineer greps the entire specific context window (or the open files).
2.  **The Discovery:** They find an obscure file: `legacy_types.d.ts` buried in a subfolder. It was created three years ago. It contains:
    ```typescript
    interface User {
      get_full_name(): string; // DEPRECATED: Use firstname + lastname
    }
    ```
3.  **The Root Cause:** The main `User` class definition (in `models.ts`) does *not* have the method. But because `legacy_types.d.ts` was open in a tab, the model's attention mechanism weighted the explicit interface definition higher than the implicit absence of the method in the class file. A "Type Definition" is a strong attractor Key in the KV Cache.
4.  **The Fix:** Close the file. Or better, delete the file.

Once the file is removed from the context, the model instantly "forgets" the function ever existed. It correctly generates `user.firstname + " " + user.lastname`.

This is the essence of Context Debugging. You are hunting for the "Attractor Tokens" that are pulling the model into a bad state. It is closer to neurology than programming; you are surgically removing a false memory.
