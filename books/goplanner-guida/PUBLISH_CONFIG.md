# PUBLISH_CONFIG.md — GOPlanner — Guida tecnica

This file feeds `generate_cover.sh` and `publish.sh`. `Title` and `Language` are
read from `INSTRUCTION.md` § METADATA.

---

## Metadata (used by publish.sh)

- **Author:** GOPlanner
- **Description:** La guida tecnica di GOPlanner per amministratori, back office, staff tecnico e sviluppatori: commesse, importazione, pianificazione, app GOPlanner 3, verifica, esportazione, magazzino, Gea, permessi, architettura PHP 8, modello dei dati, integrazioni e rilasci.

## Cover Brief (used by generate_cover.sh)

No cover in this edition (decision D9 in `DECISIONI.md`): `publish.sh` builds without
`cover.png`. If a cover is wanted later:

- **Visual style:** flat technical illustration, clean vector lines, no photography.
- **Mood & palette:** deep blue (#0b3d5c) and green (#1f8a70) on off-white; calm, orderly.
- **Key symbolic elements:** a city map with a few numbered stops joined by one route line (the giro of an operator); a water meter dial; a stack of three sheets turning into a single table (importazione → esportazione).
- **What to avoid:** no robots, no glowing AI brains, no stock photos of people with tablets, no generic circuit-board textures.
- **Aspect ratio:** portrait, 1600x2560.
