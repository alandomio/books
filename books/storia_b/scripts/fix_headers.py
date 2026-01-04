import os
import re

BOOK_DIR = "chapters"

def title_case(text):
    # Simple title case that keeps existing casing for some words if needed, 
    # but for names usually .title() is fine.
    # However, "ODOACRE" -> "Odoacre". "CARLO MAGNO" -> "Carlo Magno".
    return text.title()

def fix_file(filepath):
    with open(filepath, "r", encoding="utf-8") as f:
        content = f.read()

    # 1. Lore Boxes (IT & SL)
    # ### LORE: -> #### LORE:
    content = re.sub(r"^### LORE:", "#### LORE:", content, flags=re.MULTILINE)

    # 2. TL;DR Boxes (IT)
    # ### CHE COSA ABBIAMO IMPARATO? -> #### CHE COSA ABBIAMO IMPARATO?
    content = re.sub(r"^### CHE COSA ABBIAMO IMPARATO\?", "#### CHE COSA ABBIAMO IMPARATO?", content, flags=re.MULTILINE)

    # 3. TL;DR Boxes (SL)
    # ### KAJ SMO SE NAUČILI? -> #### KAJ SMO SE NAUČILI?
    content = re.sub(r"^### KAJ SMO SE NAUČILI\?", "#### KAJ SMO SE NAUČILI?", content, flags=re.MULTILINE)

    # 4. Character Sheets (IT)
    # ### SCHEDA PERSONAGGIO: NAME -> ### Scheda Personaggio: Name
    def replace_char_sheet_it(match):
        name = match.group(1)
        return f"### Scheda Personaggio: {title_case(name)}"
    
    content = re.sub(r"^### SCHEDA PERSONAGGIO: (.*)", replace_char_sheet_it, content, flags=re.MULTILINE)

    # 5. Character Sheets (SL)
    # ### LIST ZNAČAJA: NAME -> ### List Značaja: Name
    def replace_char_sheet_sl(match):
        name = match.group(1)
        return f"### List Značaja: {title_case(name)}"

    content = re.sub(r"^### LIST ZNAČAJA: (.*)", replace_char_sheet_sl, content, flags=re.MULTILINE)

    with open(filepath, "w", encoding="utf-8") as f:
        f.write(content)
    print(f"Fixed {filepath}")

def main():
    for filename in os.listdir(BOOK_DIR):
        if filename.endswith(".md"):
            fix_file(os.path.join(BOOK_DIR, filename))

if __name__ == "__main__":
    main()
