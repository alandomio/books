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
#   glossario         <= 5 termini nei riquadri il cui titolo contiene "GLOSSARIO"
#   scene             3 firme di scena (<span class="byline">...</span>), almeno una di Maja
#   "Cosa devi ricordare"  il riquadro è presente
# Restano manuali (vedi PRD § Verifica): verdetti non ripetitivi tra capitoli, nessuna cifra
# senza fonte nel dossier, nessuna scena smentita dal testo.
#
# Conteggio: una parola è una sequenza di lettere o cifre (l'elisione "l'acqua" conta una
# parola sola, scelta prudente che non alza l'indice); una frase finisce solo con . ! ? o …
# seguiti da spazio, virgolette o fine riga (titoli e voci d'elenco senza punto non contano).
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
    total = len(END_RE.findall(text))
    if text and not text.rstrip(" \"”»’')*_").endswith((".", "!", "?", "…")):
        total += 1
    return total


def glossary_terms(text):
    terms = []
    in_box = False
    is_glossary = False
    for line in text.splitlines():
        s = line.strip()
        if s.startswith(":::"):
            in_box = not in_box if s == ":::" else True
            is_glossary = False
            continue
        if in_box and s.startswith("#"):
            is_glossary = "GLOSSARIO" in s.upper()
            continue
        if in_box and is_glossary:
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
    has_box = "cosa devi ricordare" in text.lower()

    results = [
        ("parole", f"{n_words}", WORDS_MIN <= n_words <= WORDS_MAX, f"{WORDS_MIN}-{WORDS_MAX}"),
        ("Gulpease", f"{gulpease:.1f}", gulpease >= GULPEASE_MIN, f">= {GULPEASE_MIN:.0f}"),
        ("frase media", f"{mean_len:.1f} parole", mean_len < SENTENCE_MAX, f"< {SENTENCE_MAX:.0f}"),
        ("glossario", f"{len(terms)} termini", len(terms) <= GLOSSARY_MAX, f"<= {GLOSSARY_MAX}"),
        ("scene", f"{len(bylines)} firme, {len(maja)} di Maja",
         len(bylines) == SCENES and len(maja) >= 1, f"{SCENES}, almeno 1 di Maja"),
        ("Cosa devi ricordare", "presente" if has_box else "assente", has_box, "presente"),
    ]
    print(f"== {path}")
    print(f"   frasi {n_sentences}, lettere {n_letters}")
    ok = True
    for name, value, passed, target in results:
        ok &= passed
        print(f"   {'OK  ' if passed else 'FAIL'} {name:<20} {value:<26} (atteso {target})")
    if terms:
        print(f"   termini di glossario: {', '.join(terms)}")
    return ok


all_ok = True
for p in sys.argv[1:]:
    all_ok &= check(p)
sys.exit(0 if all_ok else 1)
PYEOF
