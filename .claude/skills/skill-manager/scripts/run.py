#!/usr/bin/env python3
"""
Universal runner for skill-manager scripts.
No virtual environment needed — all dependencies are stdlib only.
"""

import os
import sys
import subprocess
from pathlib import Path


def main():
    if len(sys.argv) < 2:
        print("Usage: python3 scripts/run.py <script> [args...]")
        print("\nAvailable scripts:")
        print("  repo_manager.py  - list | install | upload | recommend")
        sys.exit(1)

    script_name = sys.argv[1]
    script_args = sys.argv[2:]

    # Normalise name
    if script_name.startswith("scripts/"):
        script_name = script_name[8:]
    if not script_name.endswith(".py"):
        script_name += ".py"

    skill_dir = Path(__file__).parent.parent
    script_path = skill_dir / "scripts" / script_name

    if not script_path.exists():
        print(f"❌ Script not found: {script_name}")
        print(f"   Looked in: {skill_dir / 'scripts'}")
        sys.exit(1)

    try:
        result = subprocess.run([sys.executable, str(script_path)] + script_args)
        sys.exit(result.returncode)
    except KeyboardInterrupt:
        print("\n⚠️  Interrupted by user")
        sys.exit(130)


if __name__ == "__main__":
    main()
