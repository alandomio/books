import os
import re

def fix_file(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    new_lines = []
    # Regex for dialogue start: **Name:**
    # We assume names start with Uppercase.
    # Also handle Slovenian names if needed, but [A-Z] covers most.
    # Added unicode support for accents just in case, though usually names are simple.
    dialogue_pattern = re.compile(r'^\*\*[A-ZŠČŽ].*:\*\*')

    for i, line in enumerate(lines):
        # Strip newline for checking, but keep it for writing
        content = line.strip()
        
        if dialogue_pattern.match(content):
            # Check if previous line was empty
            # If it's the first line, no need for newline before
            if i > 0:
                # We need to check the last added line in new_lines
                if new_lines:
                    last_line = new_lines[-1].strip()
                    if last_line != "":
                        # Previous line was not empty, add a blank line
                        new_lines.append("\n")
        
        new_lines.append(line)

    with open(filepath, 'w', encoding='utf-8') as f:
        f.writelines(new_lines)
    print(f"Processed: {filepath}")

def main():
    chapters_dir = "chapters"
    files = [f for f in os.listdir(chapters_dir) if f.endswith(".md")]
    
    for filename in files:
        if "scena" in filename or "intro" in filename or "conclusione" in filename:
            fix_file(os.path.join(chapters_dir, filename))

if __name__ == "__main__":
    main()
