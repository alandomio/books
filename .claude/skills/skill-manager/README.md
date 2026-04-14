# skill-manager

A Claude Code skill that lets you browse, install, and publish skills from a shared GitLab repository — your team's private skill catalog.

## Why This Exists

Instead of manually copying skill directories between projects or sharing them over Slack, `skill-manager` gives you a single source of truth. Skills live in a GitLab repo; anyone can install them with one command, and publishing a skill is just as easy.

## Setup

### 1. Install the skill

Copy this directory to `.claude/skills/` in any project where you want to use it:

```bash
cp -r skill-manager/ /path/to/your-project/.claude/skills/skill-manager
```

Or install it through another already-configured skill-manager instance:

```text
/skill-manager install skill-manager
```

### 2. Authentication

The skill uses SSH to connect to the repository. Make sure your SSH key is registered in GitLab:

1. Generate a key if you don't have one: `ssh-keygen -t ed25519`
2. Add `~/.ssh/id_ed25519.pub` to GitLab under **Settings → SSH Keys**
3. Verify: `ssh -T git@gitlab.com`

---

## Usage

### List available skills

```text
/skill-manager list
```

Shows all skills in the repo with their descriptions, and which ones are already installed in the current project.

### Install a skill

```text
/skill-manager install notebooklm
```

Clones the repo, copies the skill to `.claude/skills/notebooklm/`, adds it to `.gitignore`, and reports any first-run setup steps from the skill's README.

### Get recommendations

```text
/skill-manager recommend
```

Analyzes the current project (language, frameworks, dependencies) and suggests which skills from the catalog would be most useful. Useful when joining a new project.

### Publish a skill

```text
/skill-manager upload
```

Run from inside a skill directory to publish it (or updates it) in the shared repo. The repo's README index is updated automatically.

To publish a skill from a different path:

```text
/skill-manager upload ../my-other-skill
```

---

## Skills Repository Structure

The GitLab repo that `skill-manager` reads from should follow this layout:

```text
skills-repo/
├── README.md                  ← auto-maintained index
├── skill-manager/             ← this skill
│   ├── SKILL.md
│   └── README.md
├── notebooklm/                ← each skill is a top-level directory
│   ├── SKILL.md
│   ├── README.md
│   ├── scripts/
│   └── requirements.txt
└── your-skill/
    ├── SKILL.md
    └── README.md
```

**Rules:**

- Each skill is a top-level directory
- Every skill **must** have a `SKILL.md` with a `description:` line in the frontmatter
- `README.md` is recommended for user-facing documentation
- Never commit `data/`, `.venv/`, or secrets — add them to `.gitignore`

The repo-level `README.md` must contain these markers for auto-update to work:

```markdown
<!-- SKILLS_START -->
(auto-generated table goes here)
<!-- SKILLS_END -->
```

---

## How Authentication Works

`skill-manager` connects via SSH. It uses whatever SSH key is configured on the machine.

| Step | Command |
| ---- | ------- |
| Generate key | `ssh-keygen -t ed25519` |
| Add to GitLab | GitLab → Settings → SSH Keys → paste `~/.ssh/id_ed25519.pub` |
| Verify | `ssh -T git@gitlab.com` |

---

## Troubleshooting

**Clone fails with "authentication required"**
→ SSH key not registered — run `ssh -T git@gitlab.com` to verify, then add your key under GitLab → Settings → SSH Keys

**Push fails with "not allowed"**
→ You need `Developer` or `Maintainer` role on the GitLab project

**Skill not found after install**
→ Make sure `.claude/skills/` is in your project root (same level as `CLAUDE.md` or `.claude/`)
