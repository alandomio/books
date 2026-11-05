# PUBLISH_CONFIG.md — CHRONOS: Ai Confini dell'Impero (storia_c2)

This file feeds `generate_cover.sh` and `publish.sh`. It is the one place to
edit when customizing the cover or the ebook/PDF metadata for THIS book —
never edit the scripts themselves for a per-book change.

`Title` and `Version` are read from `INSTRUCTION.md` § METADATA so
there is a single source of truth. Only fields that don't live elsewhere go here.

**Editions:** Italian first (D7). `publish.sh` builds the Slovenian edition only
from the chapters that already have `chapter_N_sl.md`, which exist only after
the Italian chapter has been approved. The teacher appendix
(`appendice_chapter_N.md`) closes the Italian edition.

---

## Metadata (used by publish.sh)

- **Author:** Alan Domio
- **Title SL:** CHRONOS: Na Robovih Cesarstva — Od renesanse do belle époque, med veliko zgodovino in vmesnimi deželami
- **Description:** Dodici missioni nel tempo, dall'Umanesimo alla Belle Époque, da leggere accanto al manuale di seconda media. Alex segue la grande storia europea, Maja la storia delle terre slovene: ogni capitolo porta una storia, un documento vero e una domanda su cui ragionare.
- **Description SL:** <da scrivere in sloveno quando esiste il primo capitolo sloveno; finché manca, publish.sh usa la descrizione italiana>

## Metadata (not yet read by publish.sh)

`publish.sh` does not read these fields yet: filling them in does not change
the EPUB/PDF metadata.

- **Publisher:** <opzionale — lascia la riga fuori se autopubblicato senza marchio editoriale>
- **ISBN:** <opzionale — lascia la riga fuori finché non assegnato>

## Cover (used by generate_cover.sh)

Decision D5: no invented illustrations. The cover starts from a **real
public-domain image** chosen from `IMAGES.md` (for example the Fra Mauro world
map, the Valvasor engraving of Lake Cerknica, or the 1812 map of the Illyrian
Provinces), downloaded by a person into this folder.

- **Base image:** <nome del file dell'immagine scaricata in questa cartella, es. cover_base.jpg>
- **Base image credit:** <titolo, autore, data, istituzione, segnatura, licenza — copiati da IMAGES.md>

## Cover Brief (used only by `generate_cover.sh --ai`)

The AI may only clean, crop, extend with plain background and recolour the base
image; it never adds anything the image does not show.

- **Mood & palette:** Blu notte e ottone/oro antico (l'estetica "cronoriporter/HUD" della serie CHRONOS), con un accento verde Carso/Carniola; nessun colore bandiera nazionale in primo piano.
- **Composition:** spazio libero nel terzo superiore (titolo) e nel terzo inferiore (autore).
- **What to avoid:** aggiungere oggetti, figure, simboli o testo; bandiere nazionali come simbolo dominante; stile fumetto.
- **Aspect ratio:** portrait ebook cover, 1600x2560 (1:1.6) — override via `COVER_WIDTH`/`COVER_HEIGHT` env vars.

---

## Notes for the human customizing this file

- `Description` doubles as the EPUB metadata description and a first draft of the store listing.
- After changing the base image or the brief, run `./generate_cover.sh --force` (the script skips if `cover.png` exists).
- `--ai` calls a real model and costs tokens: use it once, on purpose.
