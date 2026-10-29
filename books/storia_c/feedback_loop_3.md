# FEEDBACK LOOP — Capitolo 3 — EDITOR FAIL

**Score IT: 10/10 (NUF) — overridden by hard gate**
**Score SL: 10/10 (NUF) — overridden by hard gate**

The chapter clears every NUF on both languages independently (chain of causation, court/science entanglement, emotional tension, dated facts, Louis XIV tools+limits, Galileo without sole-inventor myth, Uskok nuance, Valvasor observation/model split, both Maja beats autonomous). It also clears the anachronism, anti-calco, voice-balance, length, byline, estimate-hedging, and investigation-structure gates. **It fails on the Production-jargon gate**, which is an automatic-fail condition regardless of NUF score.

---

## Missing NUFs (per language)

None. All 10 NUFs score 1/1 in both IT and SL.

---

## Hard Gate Violations (exact quotes)

### Production-jargon gate — "Capitolo"/"Poglavje" appears more than once — BOTH LANGUAGES

STYLE_BIBLE.md § Formatting, "struttura vs. testo finale": *"L'unica occorrenza ammessa della parola 'Capitolo' nel file è nel titolo di apertura (`# Capitolo N — Titolo del Capitolo`) — mai ripetuta nel corpo del testo."* The Briefing's own temporal-anchor instruction (§ Regista, point 2) demonstrates the compliant alternative explicitly: reference the previous/next installment through its *content* ("dopo la caduta di Costantinopoli che avete appena visto...") never through the literal word "capitolo."

**IT — `chapter_3_it.md`, Briefing (line 5):**
> "Nel **capitolo** precedente avete visto le autorità litigare per controllare libri, parole e lettori. Adesso il conflitto si allarga... Il **capitolo** successivo vi porterà nel Settecento, quando alcuni sovrani proveranno a usare le idee nuove per riformare i propri domini dall'alto."

"Capitolo" appears 3 times total in the file: once (legitimate) in the opening title `# Capitolo 3 — Il Trono, La Frontiera E La Prova`, and twice more in the Briefing body quoted above. The gate allows exactly one occurrence, in the title only.

**SL — `chapter_3_sl.md`, Briefing (line 5):**
> "(V naslednjem **poglavju** vaju že čaka osemnajsto stoletje, ko bodo vladarji z novimi idejami poskusili od zgoraj preurediti lastne dežele.)"

Same violation: "Poglavje"/"poglavju" appears twice — once in the title `# Poglavje 3 — Prestol, Meja In Dokaz` (legitimate) and once more here in the Briefing body.

This is the exact production-metadata leak the gate exists to catch, on both language tracks, in the same paragraph position — meaning it is a single planning/drafting slip carried consistently into both drafts rather than two independent errors.

---

## Aesthetic Violations (per language, borderline — not gate-triggering, note for cleanup)

1. **MEMO 3-info cap, borderline overflow — IT Beat 3 / SL Beat 3 (Vestfalia precisazione):**
   IT: *"Gli accordi estesero la tolleranza ai calvinisti, fissarono il 1° gennaio 1624 come anno di riferimento per la confessione e i beni ecclesiastici di ogni territorio, e riconobbero ai circa trecentocinquanta stati dell'Impero il diritto di governarsi e di allearsi con l'estero, purché non contro l'imperatore."*
   This packs four distinct facts (Calvinist tolerance; the 1624 *annus normalis*; the right to self-govern; the right to foreign alliances with a caveat) into one MEMO line against the STYLE_BIBLE's "massimo 3 informazioni" rule. SL mirrors the same density in the equivalent line.

2. **MEMO 3-info cap, borderline overflow — IT/SL Beat 3 (death-toll MEMO):**
   IT: *"Le stime storiche variano tra quattro milioni e mezzo e otto milioni. Il calo di popolazione dell'Impero è valutato fra il venti e il quaranta per cento, con differenze enormi: alcune regioni perdono fino a due terzi degli abitanti, altre restano sotto il quindici."*
   Four data points in one intervention (death-toll range; population-decline range; high-loss region example; low-loss region example). Same density issue in SL's parallel line.

These are not hard-gate violations and do not by themselves block a PASS, but should be trimmed on the next pass — move the second data point in each (the regional split, or the alliance caveat) into the beat's existing `memo-box` rather than reciting it through MEMO

---

## Repair Instructions

1. **[IT + SL — required, blocks PASS]** In the Briefing, rewrite both temporal-anchor sentences to drop the literal word "capitolo"/"poglavje" and instead anchor via content, per STYLE_BIBLE's own model phrasing ("dopo la caduta di Costantinopoli che avete appena visto...", "prima del Rinascimento che state per scoprire..."):
   - IT: replace "Nel capitolo precedente avete visto le autorità litigare per controllare libri, parole e lettori... Il capitolo successivo vi porterà nel Settecento..." with a version that names what happened/will happen without the word "capitolo" (e.g., referencing the fight over books and readers just witnessed, and the Enlightenment-era reforms to come, without the meta-label).
   - SL: replace "V naslednjem poglavju vaju že čaka osemnajsto stoletje..." with the equivalent content-anchored phrasing, dropping "poglavju."
   - After the fix, re-grep both files for `[Cc]apitolo` / `poglav` to confirm exactly one match each (the title line only).

2. **[IT + SL — optional, aesthetic]** In Beat 3, split the two dense MEMO interventions flagged above: keep the headline fact (tolerance extended to Calvinists; death-toll range) in MEMO's spoken line, and move the secondary data point (self-government/alliance right; regional loss split) into the beat's existing `memo-box` on Vestfalia/assolutismo, which already exists in both files and has room for one more bullet.

No other repairs needed — NUF coverage, anachronism watch, anti-calco, voice balance, bylines, estimate hedging, checkpoint/debriefing structure, and the Easter Egg gate all pass as written.
