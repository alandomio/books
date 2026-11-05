#!/usr/bin/env bash
# checks.sh — controlli automatici di un capitolo di storia_c2 (regola D8 del PRD).
#
# Uso:   ./checks.sh chapter_1_it.md [altro_capitolo.md ...]
# Esce con codice 1 se almeno un controllo vincolante fallisce, 2 per un errore d'uso.
#
# Controlli vincolanti:
#   parole            2.800-3.300 (testo del capitolo, riquadri compresi, senza sintassi Markdown)
#   Gulpease          >= 65, formula 89 + (300*frasi - 10*lettere) / parole
#   frase media       < 14 parole per frase
#   glossario         <= 5 termini nei riquadri ::: memo-box il cui titolo contiene "GLOSSARIO"
#                     o "SLOVAR"
#   scene             3 firme di scena (<span class="byline">...</span>), almeno una di Maja
#   "Cosa devi ricordare"  è presente un riquadro ::: reality-check con questo titolo
# Capitolo 0 (file il cui nome inizia con chapter_0): solo Gulpease e frase media.
# Gulpease e il riquadro "Cosa devi ricordare" valgono per i capitoli in italiano; l'adattamento
# sloveno è fuori da questa fase e lo script non ha una formula di leggibilità slovena.
# Restano manuali (vedi PRD § Verifica): verdetti non ripetitivi tra capitoli, nessuna cifra
# senza fonte nel dossier, nessuna scena smentita dal testo.
#
# Conteggio: una parola è una sequenza di lettere o cifre (l'elisione "l'acqua" conta una
# parola sola, scelta prudente che non alza l'indice); una frase finisce solo con . ! ? o …
# seguiti da spazio, virgolette o fine riga (titoli e voci d'elenco senza punto non contano);
# il punto dopo una lettera maiuscola sola (A., B., S.) o dopo un'abbreviazione (a.C., d.C.,
# sec., ecc., es., cfr., p., pp., n.) non chiude la frase.
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Uso: $0 <capitolo.md> [altro_capitolo.md ...]" >&2
  exit 2
fi

for f in "$@"; do
  if [[ ! -f "$f" ]]; then
    echo "Errore: file non trovato: $f" >&2
    exit 2
  fi
done

exec python3 -I - "$@" <<'PYEOF'
import os
import re
import sys

WORDS_MIN, WORDS_MAX = 2800, 3300
GULPEASE_MIN = 65.0
SENTENCE_MAX = 14.0
GLOSSARY_MAX = 5
SCENES = 3

WORD_RE = re.compile(r"[^\W_]+(?:['’][^\W_]+)*")
BYLINE_RE = re.compile(r'<span class="byline">([^<]*)</span>')
END_RE = re.compile(r"(?:[.!?]+|…)(?=[\s\"”»’')\]*_]|$)")
ABBREVIATIONS = {"a.c", "d.c", "sec", "ecc", "es", "cfr", "p", "pp", "n"}


def strip_markdown(text):
    """Return the reader-visible text, one block per line."""
    out = []
    in_fence = False
    for line in text.splitlines():
        if line.strip().startswith("```"):
            in_fence = not in_fence
            continue
        if in_fence or line.strip().startswith(":::"):
            continue
        line = re.sub(r"<[^>]+>", " ", line)                 # tag HTML (firme)
        line = re.sub(r"\[\^[^\]]*\]:?", " ", line)          # note a piè di pagina
        line = re.sub(r"!\[([^\]]*)\]\([^)]*\)", r"\1", line)  # immagini
        line = re.sub(r"\[([^\]]*)\]\([^)]*\)", r"\1", line)   # link
        line = re.sub(r"^\s{0,3}#{1,6}\s*", "", line)         # titoli
        line = re.sub(r"^\s*(?:[*+-]|\d+\.)\s+", "", line)    # voci d'elenco
        line = re.sub(r"^\s*>\s?", "", line)                  # citazioni
        line = line.replace("**", "").replace("__", "")
        line = re.sub(r"(?<!\w)[*_](?=\S)|(?<=\S)[*_](?!\w)", "", line)
        line = line.replace("|", " ")
        if re.fullmatch(r"[\s:-]*", line):
            continue
        out.append(line.strip())
    return out


def count_sentences(lines):
    # Solo la punteggiatura finale conta: un titolo o una voce d'elenco senza punto si unisce
    # alla frase successiva. È il conteggio più prudente (meno frasi, indice più basso).
    text = " ".join(line for line in lines if WORD_RE.search(line))
    total = 0
    for m in END_RE.finditer(text):
        if m.group() == "." and is_abbreviation(text[:m.start()]):
            continue
        total += 1
    if text and not text.rstrip(" \"”»’')*_").endswith((".", "!", "?", "…")):
        total += 1
    return total


def is_abbreviation(before):
    m = re.search(r"[^\W_](?:[^\W_.]|\.(?=[^\W_]))*$", before)
    if not m:
        return False
    token = m.group()
    return (len(token) == 1 and token.isupper()) or token.lower() in ABBREVIATIONS


def box_headings(text):
    """Yield (box class, heading, line) for every line inside a ::: box."""
    box = None
    heading = ""
    for line in text.splitlines():
        s = line.strip()
        if s.startswith(":::"):
            box = None if s == ":::" else s[3:].strip()
            heading = ""
            continue
        if box is None:
            continue
        if s.startswith("#") and not heading:
            heading = s.lstrip("#").strip().upper()
            continue
        yield box, heading, s


def has_reminder_box(text):
    return any(box == "reality-check" and "COSA DEVI RICORDARE" in heading
               for box, heading, _ in box_headings(text))


def glossary_terms(text):
    terms = []
    for box, heading, s in box_headings(text):
        is_glossary = box == "memo-box" and ("GLOSSARIO" in heading or "SLOVAR" in heading)
        if is_glossary:
            m = re.match(r"^[*+-]\s+\*\*([^*]+?)\*\*", s)
            if m:
                terms.append(m.group(1).strip().rstrip(":"))
    return terms


def check(path):
    text = open(path, encoding="utf-8").read()
    lines = strip_markdown(text)
    words = [w for line in lines for w in WORD_RE.findall(line)]
    n_words = len(words)
    n_letters = sum(sum(ch.isalnum() for ch in w) for w in words)
    n_sentences = count_sentences(lines)
    if n_words == 0 or n_sentences == 0:
        print(f"{path}: nessun testo da misurare")
        return False

    gulpease = 89 + (300 * n_sentences - 10 * n_letters) / n_words
    mean_len = n_words / n_sentences
    terms = glossary_terms(text)
    bylines = BYLINE_RE.findall(text)
    maja = [b for b in bylines if "maja" in b.lower()]
    has_box = has_reminder_box(text)
    orientation = os.path.basename(path).startswith("chapter_0")

    readability = [
        ("Gulpease", f"{gulpease:.1f}", gulpease >= GULPEASE_MIN, f">= {GULPEASE_MIN:.0f}"),
        ("frase media", f"{mean_len:.1f} parole", mean_len < SENTENCE_MAX, f"< {SENTENCE_MAX:.0f}"),
    ]
    structure = [
        ("parole", f"{n_words}", WORDS_MIN <= n_words <= WORDS_MAX, f"{WORDS_MIN}-{WORDS_MAX}"),
        ("glossario", f"{len(terms)} termini", len(terms) <= GLOSSARY_MAX, f"<= {GLOSSARY_MAX}"),
        ("scene", f"{len(bylines)} firme, {len(maja)} di Maja",
         len(bylines) == SCENES and len(maja) >= 1, f"{SCENES}, almeno 1 di Maja"),
        ("Cosa devi ricordare", "presente" if has_box else "assente", has_box, "presente"),
    ]
    results = readability if orientation else structure[:1] + readability + structure[1:]
    print(f"== {path}")
    if orientation:
        print("   capitolo 0 di orientamento: controllati solo Gulpease e frase media")
    print(f"   frasi {n_sentences}, lettere {n_letters}")
    ok = True
    for name, value, passed, target in results:
        ok &= passed
        print(f"   {'OK  ' if passed else 'FAIL'} {name:<20} {value:<26} (atteso {target})")
    if terms and not orientation:
        print(f"   termini di glossario: {', '.join(terms)}")
    return ok


all_ok = True
for p in sys.argv[1:]:
    all_ok &= check(p)
sys.exit(0 if all_ok else 1)
PYEOF
