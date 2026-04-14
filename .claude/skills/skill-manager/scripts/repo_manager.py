#!/usr/bin/env python3
"""
Skill Repository Manager
Handles: list, install, upload, recommend
All operations clone the repo to a temp directory, do their work, then clean up.
"""

import argparse
import hashlib
import json
import os
import re
import shutil
import subprocess
import sys
import tempfile
import urllib.error
import urllib.parse
import urllib.request
from datetime import datetime, timezone
from pathlib import Path
from typing import Optional

# ── Config ────────────────────────────────────────────────────────────────────

REPO_URL = "git@gitlab.com:peter-park/developer-experience/ai-skills.git"
SKILLS_INSTALL_DIR = Path(".claude/skills")
README_START = "<!-- SKILLS_START -->"
README_END = "<!-- SKILLS_END -->"
UPLOAD_EXCLUDE = {".venv", "venv", "env", "data", "__pycache__", ".git", "node_modules"}
SKILL_META_FILE = ".skill-meta.json"

# ── Helpers ───────────────────────────────────────────────────────────────────


def parse_frontmatter(skill_md: Path) -> dict:
    """Extract key-value pairs from YAML frontmatter in a SKILL.md file."""
    result = {}
    if not skill_md.exists():
        return result
    try:
        content = skill_md.read_text(encoding="utf-8")
        if not content.startswith("---"):
            return result
        end = content.index("---", 3)
        for line in content[3:end].splitlines():
            m = re.match(r"^([\w-]+):\s*(.+)", line)
            if m:
                result[m.group(1)] = m.group(2).strip().strip('"\'')
    except Exception:
        pass
    return result


def clone(dest: Path, depth: Optional[int] = None) -> None:
    """Clone REPO_URL into dest. Exits on failure with a helpful message."""
    args = ["git", "clone"]
    if depth:
        args += ["--depth", str(depth)]
    args += [REPO_URL, str(dest)]
    result = subprocess.run(args, capture_output=True, text=True)
    if result.returncode != 0:
        print(f"❌ Clone failed:\n{result.stderr.strip()}")
        print("\nCheck that git can authenticate with the repository.")
        print("Options: SSH key, HTTPS token, or macOS Keychain.")
        sys.exit(1)


def git(args: list, cwd: Path, capture: bool = False) -> subprocess.CompletedProcess:
    """Run a git command in cwd. Raises CalledProcessError on failure."""
    kwargs: dict = {"cwd": str(cwd), "check": True}
    if capture:
        kwargs.update({"capture_output": True, "text": True})
    return subprocess.run(["git"] + args, **kwargs)


def _compute_skill_hash(skill_dir: Path) -> str:
    """Stable SHA-256 of all skill files (sorted by relative path, excludes meta + ignored dirs)."""
    h = hashlib.sha256()
    for fpath in sorted(skill_dir.rglob("*")):
        if not fpath.is_file():
            continue
        parts = fpath.relative_to(skill_dir).parts
        if any(p in UPLOAD_EXCLUDE for p in parts) or fpath.name == SKILL_META_FILE:
            continue
        h.update(str(fpath.relative_to(skill_dir)).encode())
        h.update(fpath.read_bytes())
    return h.hexdigest()[:16]


def _read_skill_meta(skill_name: str) -> dict:
    meta_path = SKILLS_INSTALL_DIR / skill_name / SKILL_META_FILE
    if meta_path.exists():
        try:
            return json.loads(meta_path.read_text(encoding="utf-8"))
        except Exception:
            pass
    return {}


def _write_skill_meta(skill_name: str, skill_dir: Path) -> None:
    fm = parse_frontmatter(skill_dir / "SKILL.md")
    meta = {
        "installed_at": datetime.now(timezone.utc).isoformat(),
        "version": fm.get("version"),
        "content_hash": _compute_skill_hash(skill_dir),
    }
    (skill_dir / SKILL_META_FILE).write_text(json.dumps(meta, indent=2), encoding="utf-8")


def skills_in_repo(repo_dir: Path) -> list:
    """Return a list of dicts for all skills found in repo_dir, including update status."""
    skills = []
    for item in sorted(repo_dir.iterdir()):
        if not item.is_dir() or item.name.startswith("."):
            continue
        fm = parse_frontmatter(item / "SKILL.md")
        if not fm:
            continue
        installed_meta = _read_skill_meta(item.name)
        remote_hash = _compute_skill_hash(item)
        remote_version = fm.get("version")
        has_update = False
        if installed_meta:
            if remote_version and installed_meta.get("version"):
                has_update = remote_version != installed_meta["version"]
            else:
                has_update = remote_hash != installed_meta.get("content_hash")
        skills.append({
            "name": item.name,
            "description": fm.get("description", ""),
            "installed": (SKILLS_INSTALL_DIR / item.name).exists(),
            "installed_meta": installed_meta,
            "remote_version": remote_version,
            "remote_hash": remote_hash,
            "has_update": has_update,
        })
    return skills


def upload_ignore(src, names):
    """shutil.copytree ignore function — skip generated, private, and local-only files."""
    return [n for n in names if n in UPLOAD_EXCLUDE or n.endswith(".pyc") or n == SKILL_META_FILE]


def _gitlab_project_path() -> str:
    """Extract the GitLab project path from REPO_URL (SSH or HTTPS)."""
    url = REPO_URL
    if url.startswith("git@gitlab.com:"):
        path = url[len("git@gitlab.com:"):]
    else:
        path = "/".join(url.split("/")[3:])
    return path.removesuffix(".git")


def _gitlab_web_url() -> str:
    """Return a browsable HTTPS URL for the repository."""
    url = REPO_URL
    if url.startswith("git@gitlab.com:"):
        url = "https://gitlab.com/" + url[len("git@gitlab.com:"):]
    return url.removesuffix(".git")


def _create_gitlab_mr(token: str, branch: str, skill_name: str, is_update: bool) -> Optional[str]:
    """Create a GitLab MR and return its web URL, or None on failure."""
    project_path = urllib.parse.quote(_gitlab_project_path(), safe="")
    api_url = f"https://gitlab.com/api/v4/projects/{project_path}/merge_requests"
    verb = "Update" if is_update else "Add"
    payload = json.dumps({
        "source_branch": branch,
        "target_branch": "main",
        "title": f"skill-manager: {verb} {skill_name}",
        "description": f"Published by skill-manager via Claude Code.\n\nSkill: `{skill_name}`",
        "remove_source_branch": True,
    }).encode()
    req = urllib.request.Request(
        api_url,
        data=payload,
        headers={"PRIVATE-TOKEN": token, "Content-Type": "application/json"},
        method="POST",
    )
    try:
        with urllib.request.urlopen(req) as resp:
            return json.loads(resp.read()).get("web_url")
    except urllib.error.HTTPError as e:
        body = e.read().decode(errors="replace")
        print(f"⚠️  GitLab MR creation failed ({e.code}): {body[:300]}")
        return None
    except Exception as e:
        print(f"⚠️  GitLab MR creation failed: {e}")
        return None


# ── Commands ──────────────────────────────────────────────────────────────────


def cmd_list():
    print("📡 Fetching skill catalog…")
    with tempfile.TemporaryDirectory(prefix="skill-mgr-") as tmp:
        repo = Path(tmp) / "repo"
        clone(repo, depth=1)
        skills = skills_in_repo(repo)

    if not skills:
        print("No skills found in repository.")
        return

    w_name, w_desc, w_inst, w_latest = 22, 52, 12, 12
    header = (f"{'Skill':<{w_name}}  {'Description':<{w_desc}}"
              f"  {'Installed':<{w_inst}}  {'Latest':<{w_latest}}  Status")
    print(f"\n{header}")
    print("─" * len(header))
    for s in skills:
        meta = s["installed_meta"]
        inst_ver = (meta.get("version") or (meta.get("content_hash") or "")[:8]) if meta else "─"
        latest_ver = s["remote_version"] or s["remote_hash"][:8]
        if not s["installed"]:
            status = "─"
            inst_ver = "─"
        elif s["has_update"]:
            status = "⬆️  update available"
        else:
            status = "✅ up to date"
        desc = s["description"][:w_desc]
        print(f"{s['name']:<{w_name}}  {desc:<{w_desc}}"
              f"  {inst_ver:<{w_inst}}  {latest_ver:<{w_latest}}  {status}")

    not_installed = [s["name"] for s in skills if not s["installed"]]
    updates = [s["name"] for s in skills if s["installed"] and s["has_update"]]
    print(f"\n{len(skills)} skill(s) in catalog.")
    if updates:
        print(f"Updates available: {', '.join(updates)}")
        print("Use `/skill-manager update` to update all, or `/skill-manager update <name>` for one.")
    if not_installed:
        print(f"Not yet installed: {', '.join(not_installed)}")
        print("Use `/skill-manager install <name>` to install.")


def cmd_install(name: str, confirm: bool):
    with tempfile.TemporaryDirectory(prefix="skill-mgr-") as tmp:
        repo = Path(tmp) / "repo"
        print("📡 Cloning repository…")
        clone(repo, depth=1)

        skill_src = repo / name
        if not skill_src.exists():
            print(f"❌ Skill '{name}' not found.")
            available = [
                d.name for d in repo.iterdir()
                if d.is_dir() and not d.name.startswith(".")
                and (d / "SKILL.md").exists()
            ]
            print(f"   Available: {', '.join(available)}")
            sys.exit(1)

        if not confirm:
            # Preview mode: show skill content for human review before installing
            print(f"\n{'=' * 60}")
            print(f"  PREVIEW: {name}")
            print(f"{'=' * 60}")
            for fname in ("README.md", "SKILL.md"):
                fpath = skill_src / fname
                if fpath.exists():
                    print(f"\n── {fname} {'─' * (56 - len(fname))}")
                    print(fpath.read_text(encoding="utf-8"))
            print(f"\n{'=' * 60}")
            print(f"\n⚠️  REVIEW REQUIRED")
            print(f"   Review the skill above, then confirm installation:")
            print(f"   python3 scripts/run.py repo_manager.py install {name} --confirm")
            return

        # Install
        dest = SKILLS_INSTALL_DIR / name
        if dest.exists():
            print(f"⚠️  '{name}' already installed at {dest}. Overwriting…")
            shutil.rmtree(dest)
        SKILLS_INSTALL_DIR.mkdir(parents=True, exist_ok=True)
        shutil.copytree(str(skill_src), str(dest), ignore=upload_ignore)
        _write_skill_meta(name, dest)
        print(f"✅ Installed '{name}' → {dest}")

        # Add skill folder to .gitignore
        gitignore_entry = f".claude/skills/{name}/"
        gitignore_path = Path(".gitignore")
        existing = gitignore_path.read_text(encoding="utf-8") if gitignore_path.exists() else ""
        if gitignore_entry not in existing.splitlines():
            with gitignore_path.open("a", encoding="utf-8") as f:
                if existing and not existing.endswith("\n"):
                    f.write("\n")
                f.write(f"{gitignore_entry}\n")
            print(f"📝 Added '{gitignore_entry}' to .gitignore")

        # Show Setup section from README if present
        readme = dest / "README.md"
        if readme.exists():
            content = readme.read_text(encoding="utf-8")
            m = re.search(r"## (?:Setup|Installation)(.*?)(?=\n##|\Z)", content, re.DOTALL)
            if m:
                notes = m.group(1).strip()[:600]
                print(f"\n📋 Setup notes:\n{notes}")


def cmd_upload(skill_path_str: Optional[str]):
    skill_path = Path(skill_path_str).resolve() if skill_path_str else Path.cwd().resolve()
    skill_name = skill_path.name

    if not (skill_path / "SKILL.md").exists():
        print(f"❌ No SKILL.md found at {skill_path}.")
        print("   Run this command from inside a skill directory, or pass the path as an argument.")
        sys.exit(1)

    print(f"📦 Uploading '{skill_name}' from {skill_path}…")

    gitlab_token = os.environ.get("GITLAB_TOKEN")
    branch = f"skill-manager/{skill_name}"

    with tempfile.TemporaryDirectory(prefix="skill-mgr-") as tmp:
        repo = Path(tmp) / "repo"
        print("📡 Cloning repository (full clone for push)…")
        clone(repo)

        is_update = (repo / skill_name).exists()
        dest = repo / skill_name
        if dest.exists():
            print(f"   '{skill_name}' already exists — updating.")
            shutil.rmtree(dest)
        shutil.copytree(str(skill_path), str(dest), ignore=upload_ignore)
        print("   Copied skill files.")

        # Regenerate README.md skills table
        readme_path = repo / "README.md"
        if readme_path.exists():
            skills = skills_in_repo(repo)
            rows = "\n".join(
                f"| [{s['name']}]({s['name']}/) | {s['description']} |"
                for s in skills
            )
            table = f"| Skill | Description |\n|-------|-------------|\n{rows}"
            content = readme_path.read_text(encoding="utf-8")
            new_content = re.sub(
                r"(<!-- SKILLS_START -->).*?(<!-- SKILLS_END -->)",
                rf"\1\n{table}\n\2",
                content,
                flags=re.DOTALL,
            )
            readme_path.write_text(new_content, encoding="utf-8")
            print("   Updated README.md skills table.")

        # Create branch, commit, push
        git(["checkout", "-b", branch], cwd=repo)
        git(["config", "user.email", "skill-manager@claude"], cwd=repo)
        git(["config", "user.name", "Skill Manager"], cwd=repo)
        git(["add", "."], cwd=repo)
        verb = "update" if is_update else "add"
        git(["commit", "-m", f"skill-manager: {verb} {skill_name}"], cwd=repo)

        print(f"🚀 Pushing branch '{branch}'…")
        result = subprocess.run(
            ["git", "push", "origin", branch], cwd=str(repo), capture_output=True, text=True
        )
        if result.returncode != 0:
            print(f"❌ Push failed:\n{result.stderr.strip()}")
            print("\nMake sure you have Developer/Maintainer access to the repository.")
            sys.exit(1)

    print(f"\n✅ '{skill_name}' pushed to branch '{branch}'")

    if gitlab_token:
        print("🔀 Creating Merge Request…")
        mr_url = _create_gitlab_mr(gitlab_token, branch, skill_name, is_update)
        if mr_url:
            print(f"✅ MR created: {mr_url}")
        else:
            branch_encoded = urllib.parse.quote(branch, safe="")
            print(f"   Create it manually: {_gitlab_web_url()}/-/merge_requests/new"
                  f"?merge_request[source_branch]={branch_encoded}")
    else:
        branch_encoded = urllib.parse.quote(branch, safe="")
        print("ℹ️  Set GITLAB_TOKEN to create MRs automatically.")
        print(f"   Or create it manually: {_gitlab_web_url()}/-/merge_requests/new"
              f"?merge_request[source_branch]={branch_encoded}")


def cmd_update(name: Optional[str]):
    print("📡 Fetching skill catalog…")
    with tempfile.TemporaryDirectory(prefix="skill-mgr-") as tmp:
        repo = Path(tmp) / "repo"
        clone(repo, depth=1)
        skills = skills_in_repo(repo)

        if name:
            target = next((s for s in skills if s["name"] == name), None)
            if not target:
                print(f"❌ Skill '{name}' not found in repository.")
                sys.exit(1)
            if not target["installed"]:
                print(f"❌ '{name}' is not installed. Use `/skill-manager install {name}` first.")
                sys.exit(1)
            to_update = [target] if target["has_update"] else []
            if not to_update:
                ver = target["remote_version"] or target["remote_hash"][:8]
                print(f"✅ '{name}' is already up to date ({ver}).")
                return
        else:
            to_update = [s for s in skills if s["installed"] and s["has_update"]]
            if not to_update:
                print("✅ All installed skills are up to date.")
                return

        print(f"\nUpdating: {', '.join(s['name'] for s in to_update)}\n")
        for s in to_update:
            skill_src = repo / s["name"]
            dest = SKILLS_INSTALL_DIR / s["name"]
            shutil.rmtree(dest)
            SKILLS_INSTALL_DIR.mkdir(parents=True, exist_ok=True)
            shutil.copytree(str(skill_src), str(dest), ignore=upload_ignore)
            _write_skill_meta(s["name"], dest)
            latest = s["remote_version"] or s["remote_hash"][:8]
            inst = (s["installed_meta"].get("version")
                    or (s["installed_meta"].get("content_hash") or "")[:8]
                    or "?")
            print(f"✅ Updated '{s['name']}': {inst} → {latest}")


def cmd_recommend():
    cwd = Path.cwd()
    print(f"🔍 Analyzing project at {cwd}…\n")

    # Detect tech stack from well-known files
    signals = []
    stack_files = [
        ("package.json",    "Node.js / TypeScript"),
        ("go.mod",          "Go"),
        ("Cargo.toml",      "Rust"),
        ("requirements.txt","Python"),
        ("pyproject.toml",  "Python"),
        ("pom.xml",         "Java (Maven)"),
        ("build.gradle",    "Java (Gradle)"),
        ("Gemfile",         "Ruby"),
        ("composer.json",   "PHP"),
    ]
    for filename, label in stack_files:
        if (cwd / filename).exists():
            signals.append(label)
    if any(cwd.glob("*.tf")):
        signals.append("Terraform / Infrastructure")
    if (cwd / ".claude").is_dir():
        signals.append("Claude Code project")

    # Read JS/TS dependencies for finer-grained context
    pkg_json = cwd / "package.json"
    if pkg_json.exists():
        try:
            pkg = json.loads(pkg_json.read_text(encoding="utf-8"))
            all_deps = {**pkg.get("dependencies", {}), **pkg.get("devDependencies", {})}
            names = list(all_deps.keys())[:15]
            if names:
                signals.append(f"JS packages: {', '.join(names)}")
        except Exception:
            pass

    installed = []
    if SKILLS_INSTALL_DIR.exists():
        installed = [d.name for d in SKILLS_INSTALL_DIR.iterdir() if d.is_dir()]

    print("PROJECT SIGNALS:")
    for s in signals:
        print(f"  • {s}")
    if installed:
        print(f"\nALREADY INSTALLED: {', '.join(installed)}")
    if not signals:
        print("  (no recognized stack files found)")

    print("\n📡 Fetching available skills…")
    with tempfile.TemporaryDirectory(prefix="skill-mgr-") as tmp:
        repo = Path(tmp) / "repo"
        clone(repo, depth=1)
        skills = skills_in_repo(repo)

    print("\nAVAILABLE SKILLS:")
    for s in skills:
        suffix = " [already installed]" if s["installed"] else ""
        print(f"  {s['name']}{suffix}")
        if s["description"]:
            print(f"    {s['description']}")

    print("\n---")
    print("Based on the project signals and available skills above,")
    print("recommend 2-4 skills that would be genuinely useful and explain why.")
    print("Offer to install any of them.")


# ── Entry point ───────────────────────────────────────────────────────────────


def main():
    parser = argparse.ArgumentParser(
        prog="repo_manager",
        description="Skill repository manager — list, install, update, upload, recommend",
    )
    sub = parser.add_subparsers(dest="command", required=True)

    sub.add_parser("list", help="List skills available in the repository")

    p_install = sub.add_parser("install", help="Install a skill from the repository")
    p_install.add_argument("name", help="Skill name (folder name in the repo)")
    p_install.add_argument(
        "--confirm", action="store_true",
        help="Confirm installation after reviewing the preview"
    )

    p_update = sub.add_parser("update", help="Update installed skills to the latest version")
    p_update.add_argument(
        "name", nargs="?",
        help="Skill name to update (omit to update all installed skills)"
    )

    p_upload = sub.add_parser("upload", help="Publish a skill to the repository")
    p_upload.add_argument(
        "path", nargs="?",
        help="Path to the skill directory (defaults to current directory)"
    )

    sub.add_parser("recommend", help="Recommend skills based on the current project")

    args = parser.parse_args()

    if args.command == "list":
        cmd_list()
    elif args.command == "install":
        cmd_install(args.name, args.confirm)
    elif args.command == "update":
        cmd_update(args.name)
    elif args.command == "upload":
        cmd_upload(args.path)
    elif args.command == "recommend":
        cmd_recommend()


if __name__ == "__main__":
    main()
