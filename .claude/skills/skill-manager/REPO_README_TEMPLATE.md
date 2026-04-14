# Claude Code Skills Repository

A shared catalog of Claude Code skills for the team. Each folder is a self-contained skill you can install into any project.

## Installing the Skill Manager

To get started, install `skill-manager` into your project once:

```bash
# One-time: configure the repo URL
mkdir -p ~/.config/claude-skills
echo '{ "repo_url": "git@gitlab.com:peter-park/developer-experience/ai-skills.git" }' \
  > ~/.config/claude-skills/config.json

# Install the skill-manager skill manually (first time only)
git clone --depth 1 git@gitlab.com:peter-park/developer-experience/ai-skills.git /tmp/skills-repo
mkdir -p .claude/skills
cp -r /tmp/skills-repo/skill-manager .claude/skills/
rm -rf /tmp/skills-repo
```

After that, you can use `/skill-manager install <skill>` to install any other skill.

## Available Skills

<!-- SKILLS_START -->
| Skill | Description |
|-------|-------------|
| [skill-manager](skill-manager/) | Browse, install, and publish Claude Code skills from this repository |
<!-- SKILLS_END -->

---

## Contributing a Skill

### Structure

Every skill is a top-level directory with at minimum:

```
your-skill/
├── SKILL.md          ← Required. Instructions for Claude + frontmatter with name/description
└── README.md         ← Recommended. User-facing docs
```

### SKILL.md frontmatter

```yaml
---
name: your-skill
description: One sentence explaining what this skill does and when to use it.
argument-hint: <optional hint about expected arguments>
---
```

The `description` line is parsed to build the table above — keep it concise and clear.

### Publishing

From inside your skill directory, with skill-manager installed:

```
/skill-manager upload
```

Or manually:

```bash
git clone git@gitlab.com:peter-park/developer-experience/ai-skills.git /tmp/skills-repo
cp -r my-skill/ /tmp/skills-repo/my-skill/
cd /tmp/skills-repo
git add .
git commit -m "Add my-skill"
git push
rm -rf /tmp/skills-repo
```

### Guidelines

- Never commit secrets, `data/`, or `.venv/` directories — add them to `.gitignore`
- Keep skills focused: one skill = one integration or workflow
- Write a clear `description:` — it's what shows up in the catalog and powers recommendations
- Test locally before publishing: copy to `.claude/skills/` and try the skill with Claude
