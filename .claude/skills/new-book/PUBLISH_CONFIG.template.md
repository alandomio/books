# PUBLISH_CONFIG.md — <Title>

This file feeds `scripts/generate_cover.sh` and `scripts/publish.sh`. It is the
one place to edit when customizing the cover art or the ebook/PDF metadata for
THIS book — never edit the scripts themselves for a per-book change.

`Title` and `Language` are intentionally NOT duplicated here: they are read
straight from `INSTRUCTION.md` § METADATA so there is a single source of truth.
Only fields that don't already live elsewhere go in this file.

---

## Metadata (used by publish.sh)

- **Author:** <Author name as it should appear on the cover and store listing>
- **Description:** <One-paragraph back-cover / store-listing blurb, 1-3 sentences>
- **Publisher:** <optional — leave the line out if self-published with no imprint>
- **ISBN:** <optional — leave the line out if not yet assigned>

## Cover Brief (used by generate_cover.sh)

This is the actual creative brief for the AI-generated cover artwork. Be
specific — vague briefs produce generic stock-photo-style covers.

- **Visual style:** <e.g. "photorealistic industrial/architectural photography,
  desaturated, high contrast" or "flat vector illustration, bold geometric
  shapes" or "moody documentary photography, grain, available light">
- **Mood & palette:** <e.g. "cold blues and steel greys, clinical and tense"
  or "warm ambers against deep navy, tension between comfort and danger">
- **Key symbolic elements:** <2-4 concrete visual motifs tied to the book's
  actual content — not generic genre iconography. E.g. for this project:
  "a silicon wafer catching cold industrial light; a cleanroom corridor
  receding into darkness; something as small as a laser aperture standing in
  for something as large as a supply chain">
- **What to avoid:** <clichés specific to this genre/topic that the artwork
  should not lean on — e.g. "no generic circuit-board texture, no glowing
  binary code, no stock-photo handshake-over-a-globe imagery">
- **Aspect ratio:** portrait ebook cover, 1600x2560 (1:1.6) — override in
  `generate_cover.sh` via `COVER_WIDTH`/`COVER_HEIGHT` env vars if targeting a
  different platform (e.g. print wraparound cover needs trim size + spine width).

---

## Notes for the human customizing this file

- `Description` doubles as the pandoc EPUB metadata description AND is a
  reasonable draft for the actual store listing — refine before real publication.
- If you regenerate the cover after editing the brief, run
  `./generate_cover.sh --force` (the script skips generation if `cover.png`
  already exists).
- `publish.sh` looks for `cover.png` (the finished, typeset cover) — always
  the *composited* output of `generate_cover.sh`, never `cover_art.png` (the
  raw AI background without title/author, kept only as an intermediate).
