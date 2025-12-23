import os
import re

def is_list_item(line):
    # Matches * item, - item, 1. item, with optional indentation
    return re.match(r'^\s*([\*\-]|\d+\.)\s+', line) is not None

def fix_file(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    new_lines = []
    for i, line in enumerate(lines):
        # If this line is a list item
        if is_list_item(line):
            # Check previous line (if it exists)
            if i > 0:
                prev_line = lines[i-1]
                # If previous line is not empty and not a list item
                if prev_line.strip() != "" and not is_list_item(prev_line):
                    # Check if it's a header (optional, but good for readability)
                    # Actually, we ALWAYS want a blank line before a list in standard markdown
                    # unless it's inside a blockquote or something, but even then.
                    # The only exception is if it's a tight list, but that's between list items.
                    # We are checking if PREV line is NOT a list item.
                    
                    # We will insert a blank line
                    new_lines.append("\n")
        
        new_lines.append(line)

    with open(filepath, 'w', encoding='utf-8') as f:
        f.writelines(new_lines)
    print(f"Fixed {filepath}")

def main():
    content_dir = "book_content"
    files = sorted([f for f in os.listdir(content_dir) if f.endswith(".md")])
    
    for filename in files:
        filepath = os.path.join(content_dir, filename)
        fix_file(filepath)

if __name__ == "__main__":
    main()
