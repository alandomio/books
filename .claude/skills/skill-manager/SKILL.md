---
name: skill-manager
description: Browse, install, and publish Claude Code skills from a shared GitLab repository. Use when the user wants to discover available skills, install them into the current project, get skill recommendations based on the project tech stack, or publish a skill to the shared repository.
argument-hint: list | install <skill-name> | update [skill-name] | recommend | upload [skill-path]
disable-model-invocation: true
metadata:
  repository-url: "git@gitlab.com:peter-park/developer-experience/ai-skills.git"
---

# Skill Manager

This skill must be invoked explicitly via `/skill-manager`. It will never trigger automatically.

All operations are handled by `scripts/repo_manager.py`. Always run scripts through the `run.py` wrapper:

```bash
python3 scripts/run.py repo_manager.py <command> [args]
```

The skill base directory is where this SKILL.md lives (inside `.claude/skills/skill-manager/`).

**Global constraints:**
- Never guess skill names, descriptions, or repository state — always fetch from the script first.
- If an unexpected error occurs, report the full error output and ask the user how to proceed. Do not attempt to fix or work around script errors silently.

---

## Command: `list`

Show all skills in the repository with descriptions and installation status.

```bash
python3 scripts/run.py repo_manager.py list
```

Present the output as a table. Offer to install any skill that is not yet installed.

---

## Command: `install <skill-name>`

Install a skill with a mandatory human review step before copying any files.

**Step 1** — Fetch the skill preview (no files are copied yet):

```bash
python3 scripts/run.py repo_manager.py install <skill-name>
```

**Step 2** — Present the preview to the user. Summarize:
- What the skill does (from its description)
- Any setup requirements or dependencies visible in the README
- Where it will be installed (`.claude/skills/<name>/`)

Ask: "Do you want to install this skill?"

**Step 3** — Only if the user confirms, install:

```bash
python3 scripts/run.py repo_manager.py install <skill-name> --confirm
```

Report the installed path and any setup notes printed by the script.

**Constraints:**
- Do not install without explicit user confirmation.
- If the skill name doesn't match exactly, run `list` and ask the user to choose — do not guess.

---

## Command: `recommend`

Analyze the current project and suggest relevant skills. Think carefully about each signal before making recommendations.

**Step 1** — Gather project signals and available skills:

```bash
python3 scripts/run.py repo_manager.py recommend
```

**Step 2** — Reason step-by-step before responding:
1. List every detected signal from the script output (languages, frameworks, config files, packages).
2. For each available skill, check whether at least one detected signal directly supports recommending it.
3. Assign a confidence level:
   - **High** — a detected signal directly matches the skill's purpose (e.g., `package.json` present → skill for Node.js tooling)
   - **Medium** — the signal is plausibly relevant but indirect
   - **Low** — no concrete signal; pure assumption
4. Exclude any skill with Low confidence from the final output.

**Step 3** — Present up to 4 recommendations as a table:

| Skill | Why relevant | Confidence | Supporting signal |
|-------|-------------|------------|-------------------|
| ...   | ...         | High / Medium | e.g., `package.json` detected |

Every "Why relevant" cell must cite a specific signal from the script output. Offer to install any recommended skill.

**Constraints:**
- Do not recommend a skill based on what the project "might" need — only recommend based on detected signals.
- Do not recommend more than 4 skills.
- Do not recommend already-installed skills.
- If fewer than 2 skills have High or Medium confidence, say so explicitly rather than padding with Low-confidence entries.

---

## Command: `update [skill-name]`

Check installed skills for newer versions and apply updates.

```bash
# Update all installed skills that have updates:
python3 scripts/run.py repo_manager.py update

# Update a specific skill:
python3 scripts/run.py repo_manager.py update <skill-name>
```

The script compares installed version/hash against the remote. If updates are found it replaces the skill files and refreshes the `.skill-meta.json`. Report which skills were updated and what version they moved to.

If no `version` field is present in a skill's frontmatter, a content hash is used for comparison instead.

**Constraints:**
- No user confirmation required — updates are local file copies, always reversible via reinstall.
- If a specific skill name is given but not installed, exit with a clear error.

---

## Command: `upload [skill-path]`

Publish a skill to the shared repository via a branch and Merge Request.

**Step 1** — Confirm the target with the user before running:
- If no path is provided, the current directory is used.
- Show the user: skill name, source path, and that this will push a branch and open an MR.
- Ask: "Ready to publish `<skill-name>` to the shared repository?"

**Step 2** — Only if the user confirms, run:

```bash
# From inside the skill directory:
python3 scripts/run.py repo_manager.py upload

# Or specify a path:
python3 scripts/run.py repo_manager.py upload /path/to/my-skill
```

The script:
1. Copies the skill files into a clone of the repo
2. Regenerates the README catalog table
3. Creates and pushes a branch named `skill-manager/<skill-name>`
4. If `GITLAB_TOKEN` is set in the environment, automatically opens an MR to `main` and prints the MR URL
5. If `GITLAB_TOKEN` is not set, prints a URL the user can open to create the MR manually

Report the branch name and MR URL (or manual link) on success.

**Constraints:**
- Do not run upload without explicit user confirmation — this pushes to the remote.
- The MR is created against `main`; the source branch is `skill-manager/<skill-name>`.

---

## Error Handling

Report the full script error output. Do not attempt to silently fix or retry.

| Error | Action |
| ----- | ------ |
| Clone fails (auth) | Git credentials not configured — see skill README for setup |
| Skill not found | Script lists available skills — ask the user to choose from the list |
| Push fails | User needs Developer/Maintainer role on the repository |
| Any other error | Report exact output and ask the user how to proceed |
