# GOPlanner — Guida tecnica

Guida tecnica di GOPlanner (Jira GOP-885, parte 1), scritta con il Ralph Loop del framework (`.claude/skills/new-book`).

## Il testo

- `chapter_1.md` … `chapter_16.md`: i capitoli, in ordine. Ogni file è autonomo: un solo H1 `# N. Titolo`, un paragrafo «*In questo capitolo*», sezioni `##`/`###`, tabelle Markdown, riquadri come blockquote (`> **Attenzione:**`, `> **Per gli sviluppatori:**`), blocchi di codice con il linguaggio, nessun HTML grezzo, nessuna immagine, sezione finale `## Fonti`. Le regole sono in `STYLE_BIBLE.md` § Formato.
- Parti (PRD.md § 4): I dominio (1-3), II lavoro quotidiano (4-9), III assistenza e amministrazione (10-12), IV sotto il cofano, per sviluppatori (13-16).

## Compilare il PDF

```bash
./publish.sh --pdf-only     # dist/book.pdf (pandoc + weasyprint, stile in style.css)
./publish.sh                # anche dist/book.epub
```

`dist/` non è versionata.

## Rigenerare un capitolo

```bash
./ralph.sh N status
./ralph.sh N --force        # tutte le fasi su Opus; serve l'accesso MCP a Portolano e Jira
```

## Il resto della cartella

- `PRD.md`, `INSTRUCTION.md`, `STYLE_BIBLE.md`: configurazione del libro e degli agenti.
- `DECISIONI.md`: scelte prese senza il capitano ed esito del loop.
- `chapter_N_struttura.md`, `dossier_chapter_N.md`, `review_chapter_N.md`: progetto, fonti e revisione di ogni capitolo.
