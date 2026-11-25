# Chapter 9 — Struttura (Architect spec)

**Chapter title (H1 for the Writer):** `# 9. Il magazzino`
**PRD row:** «Come si gestiscono contatori e materiali: Giacenze, Movimenti, Anomalie, carico in centrale e da Excel, QR di scatola e pedana, il Magazziniere (postazione con lettore e app), DDT, inventario del furgone» — audience **BACKOFFICE**.
**Core question of the chapter:** where is each piece with a codice right now, how did it get there, and who can move it?
**Chapter thesis (the rule the whole chapter proves):** in the magazzino every piece with a codice is in exactly one place: in centrale, in the furgone of one operatore, installed at an utenza, smontato, or gone to the committente. It changes place only through a movimento written in the registro: «Carico in centrale», «Assegnazione», «Ritiro (app)», «Rientro in centrale», «Installazione», «Uscita al committente». Giacenze says where the piece is, Movimenti how it got there, Anomalie where the field and the registro disagreed. Nothing corrects itself: an anomalia, «Segna come vista» and the inventario del furgone record what happened and move nothing. Only a movimento registered by someone moves a piece.

### Continuity and glossary check (done by the Architect, 25 novembre 2026)
- `chapter_index.md`: not present yet. `NARRATIVE_GLOSSARY.md`: not present yet. Canonical vocabulary = `/home/alan/firstmate/projects/GOPlanner/CONTEXT.md`.
- **Claims already made in other chapters that this chapter must not contradict:**
  - `chapter_2.md` § on override priority: the Magazzino entry appears in the top menu when the new magazzino is on for the commessa «anche se custom/<tipo> la spegne» (GOP-767), and the menu personalizzato of the utente stays the last word. The Magazziniere sees only the Magazzino (GOP-855). Ch.9 may repeat each fact in one sentence with «vedi il capitolo 2». It must not explain the override mechanism again.
  - `chapter_3.md` (table of homonyms): «carichi» and «lotti» in the permesso «Vedere il magazzino» have another meaning, the magazzino one (capitolo 9). Ch.9 must deliver that meaning (trap 3 below).
  - `chapter_4.md`: the Importazione page opens with «Cosa importi», with choices «Pratiche» and «Magazzino». «Magazzino» appears only where the magazzino is active for the commessa and the profilo has access, and ch.4 sends the reader to ch.9 for it. Ch.9 must describe only what is specific to the Magazzino destination and point back to ch.4 for the shared mechanics (mappatura, modelli, lavoro in coda).
- **Glossary traps specific to this chapter (the Writer and the Editor must check all of them):**
  1. **«Codice», not «matricola».** Every label of the magazzino says **Codice** (decision of 11/11/2026, `docs/02-patterns/50-sezione-magazzino-back-office.md` § «Codice» e `matricola`). «Matricola» is allowed only for a contatore installed on an utenza (the matricola registered on the utenza, the «matricola nuova» field of the closure) and inside DEV boxes (`magazzino.matricola`).
  2. **«Lotto» has two meanings.** The magazzino column «Lotto» is the lotto di provenienza of a piece (an invented example such as «L2026-014»). The glossary lotto is the part of a commessa that a lista belongs to. Say it once, plainly, the first time the column appears.
  3. **«Carico», «Carica in centrale», «Carico in centrale».** In this chapter these words mean only putting pieces into a deposito. A lista is never a «carico» (glossary: «carico» is *da evitare* for lista; the Interventi › Carichi grid is the lists, ch.3). Quote the permission description «Consulta carichi, giacenze e lotti.» as a label, with one sentence on the meaning.
  4. **«Anomalia» means only Magazzino › Anomalie.** It is not the app crashes and errors (Admin › Errori app e Log, ch.12; `docs/mobile-v3/anomalie.md`), not the geocoding anomalies (GOP-756), not the anomalie of an intervento. Say it once in § 6.
  5. **Operatore**, never «tecnico» or «utente» for the field worker. «Tecnico» appears only as the label of a profilo that does not see the magazzino. The **Magazziniere** is an *utente* of the gestionale with a profilo. On the phone, the operatore is linked to such an utente.
  6. **Committente**, never «cliente»: «Uscita al committente», «Consegna al committente…», «Consegnato al committente».
  7. **«Tenant»** only inside `> **Per gli sviluppatori:**` boxes, with the correspondence stated the first time. The name of a commessa (for example ARETI SOSTITUZIONI for the DDT) appears at most once, as an example of a commessa visible in the product, never with contractual details.
  8. **Back-office labels win over app wording.** Giacenze says «Assegnata, da ritirare»; the app wiki writes «Assegnato da ritirare». In office text quote the back-office label.
  9. **DDT** is spelled out once: «documento di trasporto (DDT)».
  10. **Deposito**: in this version there are exactly two kinds, the deposito centrale («Centrale») and the furgone of each operatore. No depositi periferici (`docs/mobile-v3/magazzino.md` § Magazzino base: out of scope).

### Chapter boundaries (one-line pointers only, per PRD § 4 «Confini tra capitoli»)
| Topic touched here | Owned by | What ch.9 may say |
|---|---|---|
| File › Importazione: mappatura modes, modelli salvati, file grandi, lavoro in coda, «Ultime importazioni» | ch.4 | Only what is specific to «Cosa importi: Magazzino» (columns, «già presenti», no «Annulla importazione», resoconto), then «vedi il capitolo 4» |
| What the operatore does on the phone (Carica, Installa, the scorta screen, the app warning when a codice is not in the scorta) | ch.8 | One sentence each: what reaches the office. Here only the effect on Giacenze, Movimenti and Anomalie |
| Closure of the intervento, esito, scheda of Rapporti › Verifica interventi | ch.6 | The magazzino effects of a closure (stato 4, eseguito) and the «Storia nel magazzino» button of the scheda, with one pointer |
| Profili, RBAC, Admin › Utenti, inviti, the link between operatore and utente | ch.11 | One sentence on who assigns the Magazziniere profilo and where, plus «vedi il capitolo 11» |
| Override priority, the menu entry switched on by common code | ch.2 | One sentence + pointer (see Continuity) |
| Admin pages, Errori app e Log, «dove si è fermato il dato» | ch.12 | One sentence, only in the § 6 diagnosis |
| Export to the committente (Esportazione) | ch.7 | Say once that the «Excel» button of the grids is not the export to the committente |
| Tables `magazzino`, `magazzino_movimenti`, `magazzino_anomalie`, `ddt` | ch.14 | DEV boxes only, max 4 lines each |
| Routes `/v3/magazzino/...` of the app API | ch.15 | DEV boxes only, route names at most |
| Moving a commessa to the new magazzino (migrations, cold switch, runbooks) | ch.16 / staff tecnico | One sentence: it is a job for the staff tecnico |
| Gea answering magazzino questions | ch.10 | One sentence, only if the dossier confirms Gea has magazzino knowledge (chatbot eval fixtures exist) |

---

## NUFs (Goal Scoring)

Ten NUFs, so the Editor can score each one point against the 8.5/10 gate. Format per INSTRUCTION.md § Architect.

```
utility(reader): Reader can name every place a piece can be (stati «In centrale», «Assegnata, da ritirare», «In furgone», «Installata», «Smontato», plus gone to the committente) and say which view answers which question: Giacenze (where it is now), Movimenti (how it got there), Anomalie (where field and registro disagreed), Storia del pezzo (everything about one codice) → score += 1

utility(reader): Reader can load new contatori into the deposito centrale both ways: a few with Magazzino › Giacenze › «Carica in centrale…» (reader, QR, pasted list, anteprima, riepilogo, confirmation), many with «Importa da Excel» → File › Importazione › «Cosa importi: Magazzino» (Codice required; Modello, Calibro, Lotto, Scatola, Pedana optional). Reader can also read the resoconto («Caricate in centrale», «Già presenti», «Non caricate») and the motivo of each rejected row → score += 1

utility(reader): Reader can assign pieces to an operatore with «Assegna a operatore…», knows the piece is «Assegnata, da ritirare» until the operatore reads it with Carica in the app (movimento «Ritiro (app)», stato «In furgone»), can register a «Rientro in centrale…», and acts on the rejected rows: they stay in the window with their motivo, and every other row is already recorded → score += 1

utility(reader): Reader can explain what the closure of an intervento writes in the magazzino («Installazione» with origine «Chiusura intervento»; «Installazione forzata» when the codice was not in that operatore's furgone; where the commessa has it, «Contatore smontato» and «Consumo (chiusura)»). Reader knows why the closure is never blocked by the magazzino → score += 1

utility(reader): An amministratore can give an utente the profilo Magazziniere, knowing what the profilo sees (only Magazzino) and lacks (no «Importa da Excel»; on a commessa without the new magazzino only the message «Il magazzino di questa commessa non è attivo per il Magazziniere.»). A Magazziniere can run the banco with a USB reader: field always ready, Invio a campo vuoto shows the riepilogo, a second Invio confirms → score += 1

utility(reader): On a commessa with the DDT on, the reader can produce an affido, a reso and an uscita al committente. Reader knows the life of a DDT (bozza → confermato with number n/anno → annullato, which keeps its number while its movimenti stay), records the signature (scanned copy attached or «firmato»; on the app a drawn firma or a one-click conferma), and knows that a confirmed uscita cannot be cancelled → score += 1

utility(reader): Reader can answer «dov'è il contatore X e come ci è arrivato?» by codice, scatola, pedana or utenza (Giacenze «Cerca» and «Qualsiasi, anche installati», Storia del pezzo, «Storia nel magazzino» from the scheda of the intervento). Reader can read an anomalia (type + «Dettaglio») and register the movimento that makes the giacenza true again → score += 1

utility(emotional): Reader feels safe loading and re-loading because a codice enters the magazzino only once (re-importing the same file adds nothing twice and completes an import stopped halfway), an anomalia never stops the field work, and nothing changes behind the office's back: the inventario del furgone and «Segna come vista» change no giacenza → score += 1

utility(emotional): Reader knows where to stop and ask the staff tecnico: pieces loaded by mistake (no undo for a carico), the Magazzino entry missing, «Parti del QR non riconosciute» or the QR of a new scatola shown as one «Nuovo» codice, the yellow notice about the Lotto not saved, imports «momentaneamente sospese», the magazzino not answering, a confirmed DDT di uscita that should not have been issued → score += 1

utility(factual): The chapter states, each with its source: the labels of stati, movimenti, origini and anomalie (`lib/MagazzinoGriglie.php` constants STATI, EVENTI, ORIGINI, TIPI_ANOMALIA); the codice rules (max 20 caratteri, letters, digits and `.` `_` `/`); Calibro from 0 to 100000; 5 contatori per scatola; up to 5000 codici per reading sent in blocks of 500 (500 in the Rientro); the first 100 rejected rows in the resoconto; 10–200 righe per pagina; DDT attachments up to 8 MB; DDT number «n/anno»; permessi «Vedere il magazzino» / «Gestire il magazzino» (`lib/CatalogoPermessi.php`) → score += 1
```

---

## BEAT LIST

Six sections (`##` in the final chapter; INSTRUCTION.md and PRD § 4 allow 5–6). Each section needs: the italic audience line at the top when it is not for everyone (STYLE_BIBLE § Voice rule 6); at least one exact concrete detail; at least one **Limite** paragraph; no more than 5 prose paragraphs in a row without a table, list, box or subheading.

Before § 1 the Writer puts the mandatory `*In questo capitolo…*` paragraph, 2–3 sentences: where a piece with a codice can be and how it moves; how the office loads, assigns and checks; for back office, with boxes for developers; DDT and Magazziniere only on the commesse that have them.

**Feature-status rule for the whole chapter (hard, STYLE_BIBLE § Persona «What I never do»):** the new magazzino is active only on some commesse. On 22 novembre 2026 the DDT, Smontati, Articoli, QR scatola/pedana and Storia nel magazzino were switched on for one commessa only. The app screens for the Magazziniere and for the inventario del furgone were not yet released on 24 novembre 2026 (the server side is ready, tested with automatic tests). The real QR format of the committente is not yet known (GOP-862). Every sentence describing these features must carry its condition («dove la commessa ha i DDT accesi», «quando l'app avrà le schermate», «con il formato del QR da verificare»), with the date as the dossier gives it.

---

### § 1 — `## Dove sta un pezzo: depositi, stati e le voci del menu`
**Tag:** [TUTTI] (one `> **Per gli sviluppatori:**` box)
**Core question:** What does the GOPlanner magazzino keep track of, in which places can a piece be, and where in the menu is each answer?
**Word target:** 900 (range 800–1.000)
**Paragraph functions:** Aggancio (an invented, declared-as-invented installazione forzata; see TARGET) → Spiegazione (one codice, one place, the registro) → Dimostrazione (two tables) → Spiegazione (who sees, who manages) → Limite → Sintesi.

**Content plan**
- What is tracked: pieces with a **Codice** (for contatori, the matricola), one row per piece. Where the commessa has the catalogue, also **articoli a quantità** without a codice per piece (basette, accessori), counted per deposito (pointer to § 5).
- Depositi: «Centrale» (one per commessa) and the furgone of each operatore. The furgone is created at the first movimento that needs it.
- **Table 1, stati of a piece** (columns: Stato as shown | what it means | where it counts): «In centrale»; «Assegnata, da ritirare»; «In furgone»; «Installata» (out of the giacenze, still in the movimenti); «Smontato» (a removed contatore in a furgone or in centrale, not stock and never to be installed; only where the commessa has it); gone to the committente (only with the DDT di uscita).
- **Table 2, menu entries** (Voce | the question it answers | who sees it): Giacenze (opening entry), Movimenti, Anomalie (with the count of those «Da vedere» next to the entry), Storia del pezzo. Where the commessa has them: Articoli, DDT, Smontati. A commessa can add its own entries at the bottom (not described).
- The registro: every change of place is one row in Movimenti, with Data, Codice, Movimento, Da, A, Operatore, Origine, Intervento. Sintesi sentence: *a piece changes place only when a movimento is written.*
- Who sees and who writes: permesso «Vedere il magazzino» (description «Consulta carichi, giacenze e lotti.») for the views; «Gestire il magazzino» («Registra carichi e movimenti e modifica i lotti.») for every button that writes. Without the second, the buttons are not there. Call center and Consultazione see; Consultazione esterno and Tecnico do not see the section (quote profile names as labels). Profiles as rules → ch.11.
- Glossary paragraph (short): «Codice» vs matricola; the column «Lotto» is not the glossary lotto; «carichi» in the permission label means pieces loaded, not liste (closes the ch.3 pointer).
- The «Excel» button of every grid exports the filtered rows as a lavoro in coda; it is not the export to the committente (one sentence + «vedi il capitolo 7»).

**Limite (mandatory):** only commesse with the new magazzino switched on see Giacenze/Movimenti/Anomalie. The others still have the previous page («Articoli», «Collocazioni»), which this chapter does not describe. If the system part is missing, the page says the magazzino is not active and shows no grid. If the Magazzino entry is missing: the commessa does not use it, or the profilo does not include it → amministratore or staff tecnico (one sentence on the GOP-767 menu story, pointer to ch.2).

**DEV box:** `pages/magazzino.php` chooses between new and old page with `MagazzinoPagina::attiva()` (flag `$custom['mobile']['features']['magazzino']`); base tables from migration `0032_magazzino_base.sql` (`magazzino_assegnazioni`, `magazzino_anomalie`, columns `evento`, `origine`, `id_utente` on `magazzino_movimenti`); giacenza in `magazzino`, registro in `magazzino_movimenti`; labels in `lib/MagazzinoGriglie.php`. Schema → ch.14.

**Key facts the Researcher must find**
- The exact stato labels and their meaning (`lib/MagazzinoGriglie.php` `STATI`; `docs/mobile-v3/magazzino.md` § Stati del pezzo). Is there a stato label for a piece gone to the committente in Giacenze, or are such pieces simply excluded? (Pattern 50: «Giacenze non elenca i pezzi consegnati al committente»; app wiki: «Consegnato al committente».) Record the exact label or `[UNVERIFIED]`.
- Which commesse have the new magazzino on 25 novembre 2026. **Mandatory [CONFLICT]** (see the list below): three sources give three different lists. The chapter text will say «alcune commesse»; the dossier needs the truth.
- `lib/MenuMagazzino.php` `VISTE_BASE`, `VISTE_DDT`, `Articoli`: exact entry labels and order.
- `lib/CatalogoPermessi.php` lines for `magazzino.vedere` / `magazzino.gestire`; `lib/ProfiliPiattaforma.php` for which profiles carry `magazzino_consulta` / `magazzino_gestisci` (profile names exactly as shown).
- The exact text of the «magazzino non attivo» message on the page (`pages/magazzino.php`, `Smarty_templates/it/magazzino_base.html`).
- Righe per pagina 10–200; Excel as lavoro in coda (GOP-747).

---

### § 2 — `## Far entrare il materiale: Carica in centrale e Importa da Excel`
**Tag:** [UFFICIO] (italic line: *Per chi ha il permesso «Gestire il magazzino».*)
**Core question:** How do new contatori enter the deposito centrale, by hand, with the reader, from the QR of a scatola or a pedana, or from the supplier's Excel file, and what happens to a codice that is already there?
**Word target:** 1.000 (range 900–1.100)
**Paragraph functions:** Aggancio (contatori nuovi have arrived) → Procedura (Carica in centrale) → Spiegazione (QR of scatola and pedana) → Procedura (Importa da Excel) → Dimostrazione (columns table; rejection reasons) → contro-obiezione → Limite → Sintesi.

**Content plan**
- `### Pochi pezzi: «Carica in centrale…»` — numbered procedure: 1. Magazzino › Giacenze; 2. «Carica in centrale…»; 3. in the field «Codice o QR» read with the reader (Invio after each reading; the field stays selected), or paste a list; 4. read the **anteprima**: each codice with its state («Nuovo», «In centrale», «Nel furgone di …», «Assegnati», «Già installati»); only the «Nuovo» ones are loaded; the «×» removes a codice; 5. Invio a campo vuoto or the blue button shows the riepilogo; 6. second Invio or click confirms; 7. the pieces show as «In centrale» and in Movimenti as «Carico in centrale» with origine «Back office».
- `### Il QR della scatola e della pedana` — a scatola holds 5 contatori, a pedana holds scatole. Reading the QR of a scatola loads its 5 contatori at once, with one movimento per contatore. The codice of the scatola and of the pedana is saved on each piece and can be searched later. An opened scatola is no problem: read the pieces one by one. Up to 5000 codici per reading, sent in blocks of 500. The real QR format of the committente is still to be verified (GOP-862), so the condition sentence is mandatory (see Limite).
- `### Molti pezzi: «Importa da Excel»` — the button opens File › Importazione already on «Cosa importi: Magazzino» («Articoli con codice da caricare nel deposito centrale»). Shared steps (choose the file, mappatura «Riconosci dal file» / «Usa un modello» / «Automatica (regole e AI)» / «Manuale», lavoro in coda, «Annulla lavoro») → one sentence + «vedi il capitolo 4». What is specific here:
  - **Table of columns** (Campo | Obbligatorio | Che cosa contiene): Codice (yes; max 20 caratteri, letters, digits, `.` `_` `/`; spaces and hyphens removed before comparing, so `A-1000004` and `A1000004` are the same codice, invented examples); Modello; Calibro (a number 0–100000; text discards the row); Lotto (provenance, trap 2); Pedana, Scatola (optional).
  - Read-only checks on the whole file before «Importa»: how many rows are «da caricare», «già presenti», «non valide», «ripetute nel file».
  - Resoconto: «Caricate in centrale», «Già presenti», «Non caricate», with the first 100 rejected rows and their motivo. In Movimenti: «Carico in centrale», origine «Importazione», with the file name.
- **Rejection reasons** (bulleted, exact texts from the dossier): codice vuoto; caratteri non ammessi; troppo lungo; lunghezza o formato non validi per la commessa; calibro non valido; «Già in magazzino, nel deposito centrale» / «…nel furgone di un operatore»; «Già installato»; «Stesso codice di una riga più in alto nel file». A rejected row does not stop the others.
- **The rule (Sintesi):** a codice enters the magazzino once. It is not reloaded and not updated: Modello, Calibro and Lotto already saved stay as they are, and there is no «sovrascrivi» as in the import of pratiche.
- **Contro-obiezione 1:** «Ho importato due volte lo stesso file: adesso ho i contatori doppi?» → No: the second time they are «Già presenti». Re-importing is also how an import stopped halfway is completed.

**Limite (mandatory):** there is no «Annulla importazione entro 24 ore»: a carico is a movimento and stays in the registro; pieces loaded by mistake → staff tecnico. The rules on the codice format belong to the commessa (the dialog shows the motivo, it does not apply the rules itself). If the commessa cannot save the Lotto yet, a yellow notice appears: the pieces load and the lotto is lost → staff tecnico. The Magazziniere does not have «Importa da Excel» (§ 4). The QR of a new scatola that carries only its own code shows in the anteprima as one «Nuovo» codice until the commessa's QR format is set: do not confirm, report it. «Parti del QR non riconosciute» → staff tecnico with a photo of the QR.

**Key facts the Researcher must find**
- Exact labels of the dialog (`js/code/magazzino.js` `dialogoLettura()`, `MOTIVI`): field label, anteprima states, button texts, riepilogo text.
- **[CONFLICT] on the paste limit:** `wiki/assistenza-clienti/magazzino.md` says «al massimo 500 codici alla volta» for Carica in centrale; `magazziniere-postazione-lettore.md` and pattern 50 say 5000 in Carica and Assegna (blocks of 500), 500 in the Rientro. Resolve from `js/code/magazzino.js`.
- Exact motivo texts as shown (`MOTIVI` in `magazzino.js`; `lib/ImportazioneMagazzino.php`).
- Import labels: «Cosa importi», the description of «Magazzino», resoconto labels (`Smarty_templates/it/importazione.html`, `js/code/importazione.js`, `lib/ImportazioneMagazzinoEsecuzione.php`).
- The yellow Lotto notice text, and the «momentaneamente sospese» text.
- Columns Pedana and Scatola in the import (`lib/ImportazioneMagazzino.php`, GOP-853).
- QR parsing rules (`lib/MobileV3/Domain/MagazzinoQr.php`, `$custom['mobile']['magazzino']['qr']`, `SCATOLA:` / `PEDANA:` prefixes): only for a DEV box and for the Limite.

---

### § 3 — `## Dal centrale al furgone, dal furgone all'utenza: assegnare, ritirare, rientrare, installare`
**Tag:** [UFFICIO] (one `> **Per gli sviluppatori:**` box)
**Core question:** How does a piece go from the deposito centrale to an operatore and to the utenza where it is installed, or come back, and what does each step leave in Movimenti?
**Word target:** 1.000 (range 900–1.100)
**Paragraph functions:** Aggancio → Procedura (Assegna) → Spiegazione (da ritirare → in furgone) → Procedura (Rientro) → Dimostrazione (movimenti table) → Spiegazione (closure of the intervento) → contro-obiezione → Limite.

**Content plan**
- `### Assegnare a un operatore` — numbered procedure: 1. Magazzino › Giacenze; 2. «Assegna a operatore…»; 3. choose the operatore (the list has the active and visible operatori, plus anyone who still has pieces in the furgone); 4. read or paste the codici, or the QR of a scatola or pedana; 5. anteprima: only pieces «In centrale» are assigned (a «Nuovo» codice must first be loaded; one «Nel furgone di …» already belongs to an operatore); 6. riepilogo and confirmation as in § 2.
- The two steps of a handover: after the assignment the piece is already in the operatore's furgone as «Assegnata, da ritirare». It becomes «In furgone» when the operatore reads it with Carica in the app (movimento «Ritiro (app)»), counted once. App side → one sentence + «vedi il capitolo 8».
- `### Far rientrare in centrale` — «Rientro in centrale…»: choose the operatore, read or paste the codici (max 500, no anteprima, each reading is one codice; QR of scatola/pedana is read only in Carica and Assegna). A rientro or a scarica before the ritiro also cancels the assignment.
- **Row-by-row answer (the chain, said explicitly):** every operation answers per codice. The rejected codici stay in the window with their motivo («È nel furgone di un altro operatore», «Non è in magazzino: caricalo prima in centrale», «Già installato»). All the others are **already recorded**. Correct and confirm again only the rejected ones.
- **Table «movimenti» (Movimento as shown | Da → A | Chi lo registra / Origine):** «Carico in centrale», «Assegnazione», «Ritiro (app)», «Ritiro non previsto», «Cambio collocazione», «Rientro in centrale», «Installazione», «Installazione forzata». Point to § 5 for «Contatore smontato», «Consumo (chiusura)», «Uscita al committente». Origini: «Back office», «App», «Importazione», «Chiusura intervento». Movimenti filters: Movimento, Origine, Operatore, Dal/Al.
- `### Che cosa scrive la chiusura dell'intervento` — when an intervento is closed as eseguito with a matricola nuova, the server records «Installazione» with origine «Chiusura intervento». The piece leaves the furgone and becomes «Installata» on that utenza and intervento. If the operatore also pressed Installa in the app, it still counts once. If the codice was not in that operatore's furgone, the installation is recorded anyway, from wherever the piece was, and an anomalia «Installazione forzata» is created («Il pezzo era in centrale», «…nel furgone di un altro operatore» — that operatore's assignment drops —, «Codice mai caricato», «Codice già installato»: in the last case the piece does not move). **The magazzino never makes the closure fail.** Esito and closure → «vedi il capitolo 6».
- **Contro-obiezione 2:** «Ho assegnato i contatori ma l'operatore dice che non li ha nel furgone.» → In Giacenze filter by Deposito (the operatore's furgone): «Assegnata, da ritirare» means assigned and not yet read with Carica. Then check whether the codici are among the rejected rows of the assignment. An assigned piece that has not been picked up is never counted as «mancante» in the inventario (§ 6).

**Limite (mandatory):** on some commesse the closure moves the magazzino only for some types of intervento (for example only sostituzioni: `tipi_intervento`), and the field of the matricola nuova changes by commessa. The operatore is chosen from the list, not by reading a code of theirs. Pieces moved only with the previous app version have no movimenti in the new registro (pointer § 6, «la storia è vuota»).

**DEV box:** `MagazzinoChiusura` hooks the closure in two places (v3 `InterventiEsitoController` after the commit of `EsitoWriter`; 1.x `AndroidController::put_intervento` after `afterPutFromAndroid`), never on commesse without the flag and migration 0032, and never makes the closure fail (errors go to the log). Natural key against double counting: `(intervento_id, matricola, tipo_movimento = installazione)`. Source: `docs/mobile-v3/magazzino.md` § Installazione alla chiusura dell'intervento.

**Key facts the Researcher must find**
- Operatori list rule (`magazzino_json.php?action=operatori`, `MagazzinoGestioneController`).
- Exact rejection texts for Assegna and Rientro (`js/code/magazzino.js` `MOTIVI`).
- Whether the app shows «Assegnata, da ritirare» pieces to the operatore (`GET /v3/magazzino/scorte`, `da_ritirare`) — one sentence only.
- Order of the matricola-nuova fields and the `campi_matricola_nuova` override, only to support the Limite («cambia per commessa»).
- `tipi_intervento` behaviour (GOP-858 changeset: applies to installazione too).
- Exact «Dettaglio» texts of «Installazione forzata».
- A real ticket story (problem → cause → fix, without personal data) about a closure and the magazzino, if Jira or the changesets have one. If none, the DEV box stands without a case.

---

### § 4 — `## Il Magazziniere: il banco con il lettore e il telefono`
**Tag:** [UFFICIO] (italic line: *Per gli amministratori che assegnano il profilo e per chi lavora al banco del magazzino.*)
**Core question:** Who is the Magazziniere, what can that profilo see and do, and how do you work at the banco with a USB reader, or from the phone, without touching the mouse for every piece?
**Word target:** 850 (range 800–1.000)
**Paragraph functions:** Aggancio (decine di letture senza mouse) → Spiegazione (the profilo) → Procedura (the banco) → Spiegazione (the phone) → contro-obiezione → Limite.

**Content plan**
- The profilo: **Magazziniere**, common to all commesse with the new magazzino. Permessi «Vedere il magazzino» and «Gestire il magazzino» and nothing else. After login it lands on Magazzino › Giacenze. The top menu shows only Magazzino (plus notifiche and Esci). Any other address leads back to the Magazzino. Buttons: «Assegna a operatore…», «Rientro in centrale…», «Carica in centrale…», «Excel»; no «Importa da Excel» (file imports stay with whoever opens File › Importazione).
- Who assigns it: whoever manages the utenti of the commessa, in Admin › Utenti, when creating or inviting an utente or changing their access. The profilo is offered only if the commessa **you entered** has the new magazzino, so enter that commessa first. One sentence + «vedi il capitolo 11».
- `### Al banco con il lettore` — numbered procedure (same in Carica, Assegna, Rientro): 1. open the dialog (in Assegna and Rientro choose the operatore first); 2. the field «Codice» is ready and stays selected; 3. read one scatola after another: the reader types the codice and Invio by itself, and each reading is added to the list; the counter shows how many and the last one; a double reading is not repeated («era già letto»); 4. Invio a campo vuoto (or the blue button) → riepilogo, in the form «Assegni 50 codici a …» (**do not reproduce the placeholder name in the source; use an invented name declared as such, or omit it**); 5. a second Invio confirms. Codici read while the confirmation is running are not lost: they stay «da confermare» and need another double Invio.
- The reader requirement: it must work «come una tastiera» (USB HID mode, Invio after each reading).
- `### Dal telefono` — conditional section (see the feature-status rule). A phone is a Magazziniere's when its operatore is linked to an utente of the commessa with «Gestire il magazzino». GOPlanner decides this, not the app. The same three operations, reading QR with the camera; the same movimenti and the same DDT as the banco; the QR reading works only with network; more than 500 contatori → several sends, each with its own DDT (where DDT are on); a repeated send registers nothing twice and creates no second DDT. Movimenti show the name of the utente linked to the phone.
- **Contro-obiezione 3:** «Il magazziniere dice che non vede i clienti e gli interventi: è un guasto?» → No. The profilo reads only giacenze, movimenti, anomalie, its own Excel exports and its own ticket; everything else answers «non permesso» by design.

**Limite (mandatory):** on a commessa without the new magazzino the Magazziniere sees only «Il magazzino di questa commessa non è attivo per il Magazziniere.». This is expected, not a fault. The physical reader was tested by simulating 50 keyboard readings in the browser, not with a real device (wiki, 22 novembre 2026). The app screens for the Magazziniere were not yet released on 24 novembre 2026: the chapter describes what the server does when the app asks. If the operatore is not linked to any utente, the phone stays an operatore's phone.

**DEV box (optional, max 3 lines):** `lib/Magazziniere.php` (`TIPO = 7`, `paginaAmmessa()`, `azioneAmmessa()`, `MAGAZZINO_NON_ATTIVO`), `lib/ProfiliPiattaforma.php` profile `magazziniere`; app routes in `docs/mobile-v3/magazziniere.md` (pointer ch.15).

**Key facts the Researcher must find**
- Exact text of the riepilogo template and of «era già letto» (`js/code/magazzino.js` `testoRiepilogo`, `statoLettura`).
- Profile description as shown in the invite form (`lib/ProfiliPiattaforma.php` line «Solo la sezione Magazzino: …»).
- Status of the app release for GOP-856 / GOP-861 on 25 novembre 2026 (Jira status; any release note). If not released: `[UNVERIFIED: schermate dell'app non rilasciate]` and the Writer keeps the conditional.
- Where the operatore–utente link is set (Admin › Operatori per the wiki): exact label.

---

### § 5 — `## Sostituzioni con i DDT: materiali a quantità, contatori smontati e uscita al committente`
**Tag:** [UFFICIO] (italic line: *Solo per le commesse che hanno i DDT accesi; oggi una.* — the number comes from the dossier)
**Core question:** On a commessa that replaces contatori with documenti di trasporto, how do the affido, the reso and the uscita work, what happens to the removed contatore and to the materials used, and what can no longer be undone?
**Word target:** 1.100 (range 1.000–1.200)
**Paragraph functions:** Aggancio (the life of a sostituzione: new contatore in, old one out, basette used) → Spiegazione (what the closure writes) → Dimostrazione (DDT types table) → Procedura (create and sign) → Spiegazione (ciclo di vita) → Limite → Sintesi.

**Content plan**
- `### Che cosa scrive la chiusura di una sostituzione` — where the commessa has it configured: the removed contatore (the matricola registered on the utenza) enters the operatore's furgone as «Smontato» (movimento «Contatore smontato», origine «Chiusura intervento»). It is never stock and never a piece to install. The basette and accessori used are discharged from the furgone («Consumo (chiusura)»), once per intervento. If the furgone did not have enough, the discharge happens anyway, the saldo goes below zero, and the anomalia «Scarico oltre il saldo del furgone» is created. A codice not in the catalogue gives «Articolo non in catalogo». None of this ever blocks the closure.
- `### Materiali senza codice: la vista Articoli` (short, 2–3 sentences + bullet of buttons): catalogue and saldo per deposito (columns In centrale, Sui furgoni, Nel deposito scelto); buttons «Nuovo articolo…», «Modifica…», «Carica in centrale…», «Affida a operatore…», «Rientro in centrale…», «Importa catalogo…». Rejected motivi such as saldo insufficiente. Movimenti show them as «codice × quantità».
- **Table «tipi di DDT»** (Tipo | Movimento | Da → A | Destinatario): affido (Assegnazione; centrale → furgone; the operatore); reso (Rientro in centrale; furgone → centrale; the deposito centrale, for contatori smontati and unused material); uscita (Uscita al committente; centrale → out; the committente, the piece becomes returned or disposed of).
- `### Creare e firmare un DDT` — numbered procedure from Magazzino › DDT: «Nuovo affido…» / «Nuovo reso…» / «Nuova uscita…»; operatore or destination; codici read or pasted; note; the DDT is born confirmed and numbered and opens for printing; rejected codici stay with the motivo. Also: Assegna and Rientro of Giacenze create the DDT themselves and show «Stampa il DDT n. …». Signatures: in the back office print, then attach the signed scan (PDF, JPEG or PNG, max 8 MB) or tick «firmato»; from the app (when released) each party signs its own part, or confirms with one click → «Confermato da …» in the PDF. A signature once given does not change. The reprint is identical (sender, recipient and causale are copied onto the DDT when it is created).
- **Ciclo di vita (short table or 3 bullets):** bozza (rows, no movimenti, no number) → confermato (movimenti done, number «n/anno», progressive per year) → annullato (keeps the number; **the movimenti stay**: the goods are put back with the inverse movimento and its own DDT). If no codice succeeds, the DDT stays a bozza and the number is not used.
- `### Smontati e uscita al committente` — Magazzino › Smontati: the contatori smontati still in the magazzino, per deposito, with days in giacenza (counts for all; the list shows the 5000 oldest). «Consegna al committente…» opens the DDT di uscita with the selected pieces in centrale; with a furgone chosen, «Reso in centrale con DDT…». Only contatori smontati can leave («Non è un contatore smontato» otherwise); a piece still in a furgone must first come back with a reso.
- **Sintesi (the rule):** a confirmed uscita has no «Annulla DDT…»: the pieces are already at the committente and the uscita cannot be undone. Check the list before confirming; a bozza di uscita can still be cancelled.

**Limite (mandatory):** DDT, Smontati and Articoli exist only where the commessa has them switched on (configuration + system part); elsewhere Assegna and Rientro work without DDT. The causale of the affido for external operatori is still to be confirmed (GOP-862). Signing on screen is done only from the app, not from the back office. Whether the switch of the commessa to DDT is live in production is a dossier fact (see [CONFLICT] 3): the Writer states it with its date.

**DEV box:** `lib/MobileV3/Domain/MagazzinoDdt.php` (the DDT has no movimenti of its own: it drives the usual ones, each writing `magazzino_movimenti.ddt_id`), migration `0042_magazzino_ddt.sql`, config `$custom['ddt']['attivo']` (not `$custom['magazzino']`, a boolean on many commesse), PDF `lib/MagazzinoDdtPdf.php`, API `magazzino_ddt_json.php`. Closure: `MagazzinoLedger::smontaggioDaChiusura`, `MagazzinoArticoli::consumaDaChiusura` (one transaction, once per intervento).

**Key facts the Researcher must find**
- Exact labels in `js/code/magazzino_ddt.js` and `Smarty_templates/it/magazzino_ddt.html`: buttons, filters (tipo, stato, firma, numero o codice), «Annulla DDT…» confirmation text, «Stampa il DDT n. …».
- DDT stati as shown (bozza / confermato / annullato / firmato?).
- Default causale of the affido (doc: «Affidamento materiale in conto lavorazione»): confirm in code, mark as to be confirmed (GOP-862).
- Attachment limit 8 MB and accepted types; app firma limits (1 MB, 4 milioni di pixel) only if needed.
- Smontati view columns and the 5000 cap message.
- Articoli view labels (`js/code/magazzino_articoli.js`, `MagazzinoGriglie` `ARTICOLI`).
- Which commesse have `$custom['ddt']['attivo'] = true` (code: only one) and whether its switch (GOP-852) and DDT (GOP-857) are in production (Jira status).

---

### § 6 — `## Quando il magazzino non torna: Anomalie, inventario del furgone e Storia del pezzo`
**Tag:** [UFFICIO] (one `> **Quando chiedere allo staff tecnico:**` box)
**Core question:** How does the office find a piece, read an anomalia, use the inventario del furgone, and put the registro back in line with what is physically there?
**Word target:** 1.000 (range 900–1.100)
**Paragraph functions:** Aggancio (the registro is right until the field says otherwise) → Procedura (find a piece) → Dimostrazione (anomalie table) → Spiegazione (inventario) → contro-obiezione ×2 → Limite → Sintesi (the rule) → staff box.

**Content plan**
- One-sentence glossary trap: in this chapter «anomalia» means only Magazzino › Anomalie (trap 4).
- `### Trovare un pezzo` — ordered steps: 1. Giacenze, field «Cerca» (codice, codice scatola, codice pedana, utenza; several codici separated by spaces, commas or semicolons), with Stato «Qualsiasi, anche installati» to include installed pieces; 2. click the Codice → **Storia del pezzo**: «Dati del pezzo», «Al suo posto» (for an installed contatore, the one removed by the same intervento, and vice versa), intervento and utenza, the storia (every movimento with origine, DDT or file name), its anomalie; 3. the Storia del pezzo search also accepts the POD, name or address of an utenza (in the book: never a real one). From the scheda of an intervento, where the commessa has it, the button «Storia nel magazzino» opens the pieces installed or removed by that intervento (pointer ch.6). Clicking the Modello shows how many pieces of that model are in centrale, in the furgoni and installed. A filtro avanzato that is not valid leaves the grid **empty**, never the whole table.
- **Table «anomalie»** (Anomalia as shown | che cosa è successo | che cosa fa l'ufficio): «Entrata non prevista»; «Installazione forzata»; «Scarico oltre il saldo del furgone»; «Articolo non in catalogo»; «Inventario: pezzo mancante dal furgone»; «Inventario: pezzo non previsto nel furgone»; «Inventario: quantità diversa dal saldo». Columns of the page: Rilevata il, Anomalia, Codice, Operatore, Intervento, Dettaglio, Stato; filters Stato («Da vedere», «Viste», «Tutte») and Anomalia.
- What is **not** an anomalia: a piece already in centrale, not assigned, that the operatore picks up with Carica — a normal ritiro.
- `### L'inventario del furgone` — conditional (feature-status rule). The operatore (or the Magazziniere, for any operatore) checks the furgone. The app shows what should be there, including the contatori smontati and the articoli a quantità, and the operatore confirms, scans or marks «non trovato». The differences become the three «Inventario: …» anomalie. To the operatore the app only says «Non risulta nel tuo furgone»; where the piece really is, the office sees in the anomalia. The same piece reported twice before the office sees it stays one row.
- **The chain to make explicit:** anomalia → «Segna come vista» moves it to «Viste» with who and when and deletes nothing → the giacenza is still what it was → the office registers the movimento that matches reality (carico, assegnazione, rientro). The inventario changes neither movimenti nor giacenze; there is no office «rettifica» in this version.
- **Contro-obiezione 4:** «Ho segnato l'anomalia come vista: ora il pezzo è a posto?» → No: it only says someone looked. The place changes with a movimento.
- **Contro-obiezione 5:** «L'inventario dice che un pezzo manca: lo tolgo dalle giacenze?» → There is no button to remove it in this version. Find where it is (Storia del pezzo, the operatore, the colleague's furgone) and register the movimento. A piece that is truly lost is a question for the staff tecnico.

**Limite (mandatory):** a piece moved only with the previous version has a Storia del pezzo that shows where it is today with an empty history (the page says so). Anomalie never block the field work, so a high «Da vedere» count is work for the office, not an outage. The inventario cannot be launched «on request» by the Magazziniere for an operatore's phone; the operatore does it on their own furgone.

**`> **Quando chiedere allo staff tecnico:**` box (3–5 bullets):** pieces loaded by mistake; a codice that the magazzino «non conosce» but is physically there and cannot be loaded; «Parti del QR non riconosciute»; the page says the magazzino does not answer for more than a short while; a confirmed DDT di uscita issued by mistake.

**Key facts the Researcher must find**
- Exact «Dettaglio» texts for each anomalia type (`lib/MagazzinoGriglie.php`, `MagazzinoGestione`); the «Scarico oltre il saldo del furgone» detail format («nel furgone N, scaricati M»).
- Storia del pezzo labels (`js/code/magazzino_storia.js`): «Dati del pezzo», «Al suo posto», «Storia», «Nessun pezzo trovato», the empty-history message.
- «Storia nel magazzino» button: which commesse have it in the scheda (`getCampiSchedaVerifica`); the chapter says «dove la commessa lo ha».
- Inventario: `lib/MobileV3/Domain/MagazzinoInventario.php`, `docs/mobile-v3/magazziniere.md` § 7: types, «non trovato», dedup rule, «Non risulta nel tuo furgone» exact text.
- Gea: does the chatbot answer magazzino questions (`chatbot-service/eval/fixtures/W-2026-11-*-magazzino*.json`, `W-2026-11-24-inventario-furgone-differenze.json`)? If yes, one sentence + «vedi il capitolo 10».

---

### Closing (no separate `##`: the last paragraph of § 6, after the staff box and before `## Fonti`)
A rule the reader can use at the desk. It must not echo another chapter and must not announce chapter 10. See TARGET.

### `## Fonti`
Built by the Writer from the dossier entries actually used, in the STYLE_BIBLE format (`codice: …`, `wiki: …`, `docs: …`, `Portolano: …`, `Jira: GOP-NNN — titolo breve`).

---

## REVIEWER READINESS NOTES

### Tension points (where the chapter must create real stakes)
1. **The row-by-row answer (§§ 2–3).** Stakes: the office sees rejected rows and thinks nothing happened, so it confirms everything again, or closes the window and believes everything went through. In the first case nothing doubles, because a codice loads once. In the second case an operatore leaves without the contatori the office thinks it assigned. Build-up: procedure → the window that does not close → the rule «i rifiutati restano, gli altri sono già registrati». It resolves into a reading habit, not into fear.
2. **The installazione forzata (§ 1 hook, § 3).** Stakes: the field is never stopped, so a contatore can be installed from a colleague's furgone. That colleague's stock silently drops by one and their assignment falls. The only trace is a row in Anomalie with a count next to the menu entry. Done in the field ≠ true in the registro.
3. **What cannot be undone (§§ 2, 5).** Stakes: a carico has no «Annulla»; an annulled DDT keeps its number and its movimenti; a confirmed DDT di uscita cannot be cancelled because the pieces are physically at the committente. These are documents of transport, not drafts. Resolution: the anteprima and the bozza exist to be read before confirming.
4. **The registro does not heal itself (§ 6).** Stakes: the office believes the inventario or «Segna come vista» fixed a giacenza. The next assignment is then rejected, or a piece is «lost» in the registro while it sits in a furgone. Resolution: anomalie record, movimenti correct.
5. **Features that are not yet everywhere (§§ 4–6).** Stakes: a reader tries the app screens of the Magazziniere, the inventario or the DDT on a commessa that does not have them, and concludes GOPlanner is broken. Resolution: every such paragraph carries its condition and date.

### Key chains to make explicit (cause → consequence → reader action)
- Codice already in centrale, in a furgone or installed → not reloaded, not updated → read «Già presenti» in the resoconto; re-importing is safe; a wrong Modello/Calibro/Lotto already saved is not fixed by re-importing → staff tecnico.
- Codice «Nuovo» in the Assegna anteprima → not assigned → load it first with «Carica in centrale…», then assign.
- Assegnazione → «Assegnata, da ritirare» → operatore's Carica in the app → «In furgone» (movimento «Ritiro (app)») → if the operatore says «non li ho», check Stato and Deposito in Giacenze before anything else.
- Closure with a matricola nuova not in the operatore's furgone → «Installazione forzata» with «Dettaglio» → the piece moved from where it was (or did not move, if already installed) → the office checks the colleague's furgone and registers what is needed.
- Sostituzione closed → «Smontato» in the furgone → «Reso in centrale con DDT…» → «Consegna al committente…» (uscita) → the piece leaves Giacenze for good.
- DDT confirmed by mistake (affido/reso) → «Annulla DDT…» keeps the number and the movimenti → register the inverse movimento with its own DDT. DDT di uscita confirmed → cannot be cancelled → stop and ask.
- Inventario difference → «Inventario: …» anomalia → no giacenza changes → find the piece (Storia del pezzo) → register the movimento → «Segna come vista».
- Profilo Magazziniere offered only if the commessa you entered has the new magazzino → enter that commessa before inviting.

### Risk proportionality guards (each risk paired with its balancing context)
- **No undo for a carico** → balance in the same paragraph: a codice loads once; the whole file is checked read-only before «Importa»; the anteprima shows each codice's state before confirming; re-importing never doubles.
- **Installazione forzata moves a piece out of a colleague's furgone** → balance: the closure is never blocked, so the field work goes on; the anomalia records exactly where the piece was; an already installed piece is not moved; the count «Da vedere» sits next to the menu entry.
- **Negative saldo after «Consumo (chiusura)»** → balance: it never blocks the closure; it is visible as «Scarico oltre il saldo del furgone»; it is discharged once per intervento even if the closure is resent.
- **Irreversible uscita and annulled DDT keeping its number** → balance: the bozza; if no codice succeeds the DDT stays bozza and the number is not used; the reprint is identical; a repeated send from the app creates no second DDT.
- **The Magazziniere cannot see clienti and interventi** → balance: by design (least privilege), not a fault; the profilo has exactly the two magazzino permessi.
- **The inventario does not correct giacenze** → balance: this is a protection (no silent corrections of the registro), not a missing feature to fear; differences are kept as anomalie with who and when.
- **Old page on other commesse** → balance: nothing is lost; it is a different page; moving a commessa is a job for the staff tecnico.
- **QR format not yet verified** → balance: the anteprima shows what will be loaded before any confirmation; reading single codici always works.

### Counter-objections planned (STYLE_BIBLE requires ≥ 2; five are planned)
1. § 2 — «Ho importato due volte lo stesso file: adesso ho i contatori doppi?»
2. § 3 — «Ho assegnato i contatori ma l'operatore dice che non li ha nel furgone.»
3. § 4 — «Il magazziniere dice che non vede i clienti e gli interventi: è un guasto?»
4. § 6 — «Ho segnato l'anomalia come vista: ora il pezzo è a posto?»
5. § 6 — «L'inventario dice che un pezzo manca: lo tolgo dalle giacenze?»

### Litmus test for this chapter
A new back-office colleague, with only this chapter, can: load a pedana of contatori from the supplier's Excel and read the rows left out; assign fifty contatori to an operatore and know when they are really in the furgone; read an «Installazione forzata» and decide which movimento to register; on a commessa with the DDT, issue an affido and an uscita al committente and know which one cannot be undone; find a contatore by its codice, its scatola or the utenza where it is installed.

---

## RESEARCHER BRIEF

**Web search terms:** none. INSTRUCTION.md § Researcher, SOURCE OVERRIDE: the web is not a source for this book. Use only the sources below, in this priority order. The GOPlanner repository (`/home/alan/firstmate/projects/GOPlanner`, branch `php8`) is READ ONLY: no checkout, pull, stash, composer, npm; only Read/Grep/Glob and `git log` / `git show` / `git grep`.

### Documents to prioritize (in order)
1. Code on `php8` (authority when sources disagree).
2. `docs/02-patterns/50-sezione-magazzino-back-office.md` (the back-office section, decisions of 11/11 and 22/11/2026), `docs/mobile-v3/magazzino.md` (model, stati, movimenti, closure, DDT), `docs/mobile-v3/magazziniere.md` (Magazziniere from the app, inventario § 7).
3. The wiki articles listed below (dated 2026-11-15 to 2026-11-24). Each has a «Non verificato» section: carry those caveats into the dossier.
4. The changesets `changeset/2026-11-1*-gop-76*-magazzino*.md`, `changeset/2026-11-2*-gop-85*/86*` (tenant and customer text of each novità).
5. Portolano, then Jira.
6. Use `docs/02-patterns/22-magazzino-and-inventory-architecture.md` and `docs/specifiche_funzionali_magazzino_cliente.md` only to record what the original design planned and the code did **not** do (e.g. depositi periferici, rettifiche). Never as a source for a live feature.

### Wiki paths
- `wiki/assistenza-clienti/pagina-magazzino-menu.md`
- `wiki/assistenza-clienti/magazzino.md`
- `wiki/assistenza-clienti/pagina-magazzino-giacenze.md`
- `wiki/assistenza-clienti/importare-articoli-magazzino.md`
- `wiki/assistenza-clienti/magazzino-qr-e-storia-del-pezzo.md`
- `wiki/assistenza-clienti/magazziniere-postazione-lettore.md`
- `wiki/assistenza-clienti/magazziniere-app.md`
- `wiki/assistenza-clienti/pagina-magazzino-anomalie.md`
- `wiki/assistenza-clienti/import-carico.md` (only to confirm the shared «Cosa importi» step, pointer to ch.4)
- `wiki/index.md` rows 61–80 (dates of each article)

### Docs paths
- `docs/02-patterns/50-sezione-magazzino-back-office.md` — all sections («Codice» e `matricola`, Dove sta e chi la vede, Le tre griglie, Pulsanti e dialoghi, Vista Articoli, Storia del pezzo, DDT e Smontati, Moduli per tenant)
- `docs/mobile-v3/magazzino.md` — § Feature flag, § Modello, § Magazzino base (Stati del pezzo; Movimenti: evento e origine; Assegnazione dell'ufficio e Carica dell'app; Entrata non prevista; Installazione alla chiusura; Anomalie; Validazione della matricola), § Importazione del magazzino (GOP-768), § Catalogo articoli, § Chiusura della sostituzione (GOP-858), § QR di scatola e pedana, § Storia del pezzo, § DDT e uscita al committente, § Non in v3.0
- `docs/mobile-v3/magazziniere.md` — §§ 1–3, 5, 7, «Cose da sapere / non fatte»
- `docs/mobile-v3/runbook-magazzino-aretisost.md`, `docs/mobile-v3/runbook-magazzino-sg_smat.md` — only for: is the switch done, and on which date (DEV/[CONFLICT] use; numbers of rows are not chapter material)

### Code paths and grep patterns (read-only)
- `lib/MagazzinoGriglie.php` — `const STATI`, `STATI_FILTRO_EXTRA`, `EVENTI`, `ORIGINI`, `TIPI_ANOMALIA`, `flexifields()` (buttons per griglia, `$puoGestire`, `$puoImportare`), column `display` labels
- `lib/MenuMagazzino.php` — `VISTE_BASE`, `VISTE_DDT`, `Articoli`, `moduli()`
- `lib/MagazzinoPagina.php` — `attiva()`, `voceMenu()`, `vista()`, docblock (which commesse it names)
- `pages/magazzino.php` — new vs old page (`Articoli`, `Collocazioni`), the «non attivo» message
- `js/code/magazzino.js` — `MOTIVI`, `dialogoLettura()`, `dialogoLettore()`, `testoRiepilogo`, `statoLettura`, limits (`5000`, `500`, `150`)
- `js/code/magazzino_storia.js`, `js/code/magazzino_ddt.js`, `js/code/magazzino_articoli.js`, `Smarty_templates/it/magazzino_base.html`, `Smarty_templates/it/magazzino_ddt.html`
- `lib/Magazziniere.php` — `TIPO`, `MAGAZZINO_NON_ATTIVO`, `menu()`, `paginaAmmessa()`, `azioneAmmessa()`
- `lib/ProfiliPiattaforma.php` — profiles with `magazzino_consulta` / `magazzino_gestisci`, `magazziniere` description
- `lib/CatalogoPermessi.php` — `magazzino.vedere`, `magazzino.gestire`
- `lib/ImportazioneMagazzino.php`, `lib/ImportazioneMagazzinoControllo.php`, `lib/ImportazioneMagazzinoEsecuzione.php` — fields, rules, resoconto labels, «prime 100»
- `lib/MobileV3/Domain/MagazzinoGestione.php`, `MagazzinoLedger.php`, `MagazzinoChiusura.php`, `MagazzinoMatricolaRegola.php`, `MagazzinoQr.php`, `MagazzinoStoria.php`, `MagazzinoArticoli.php`, `MagazzinoDdt.php`, `MagazzinoInventario.php`, `MagazzinoRuolo.php`
- `lib/MagazzinoGestioneController.php`, `lib/MagazzinoDdtController.php`, `lib/MagazzinoDdtPdf.php`
- `custom/*/config.inc.php` — `git grep -n "\['features'\]\['magazzino'\]" -- 'custom/*/config.inc.php'`; `git grep -n "\['ddt'\]" -- 'custom/*/config.inc.php'`; `git grep -n "tipi_intervento\|smontato_in_furgone\|campi_articoli\|campi_matricola_nuova" -- custom/`
- `git grep -n "storia_magazzino" -- custom/` (which commesse have «Storia nel magazzino» in the scheda)
- `migrations/tenant/0032_magazzino_base.sql`, `0033_…`, `0040_…`, `0041_…`, `0042_…` — for DEV boxes only
- `git log --oneline --since=2026-11-01 -- lib/Magazzino* lib/MobileV3/Domain/Magazzino* js/code/magazzino*` — dates of each step (for the «stato al» sentences)

### Portolano queries (`mcp__rag_qdrant_server__query_rag_hybrid` with `user_roles: ""` — EMPTY string, per INSTRUCTION.md; fall back to `query_rag`)
- «magazzino giacenze movimenti anomalie»
- «carica in centrale contatori nuovi importa da Excel»
- «assegna a operatore assegnata da ritirare in furgone ritiro app»
- «QR scatola pedana contatori codice scatola»
- «Magazziniere profilo postazione lettore USB»
- «inventario del furgone pezzo mancante non previsto»
- «DDT affido reso uscita al committente smontati»
- «installazione forzata entrata non prevista chiusura intervento»
- «storia del pezzo al suo posto contatore smontato»

### JQL fragments (cloudId `21873985-2e5d-4a8a-bb45-e6d453128985`, project GOP, READ ONLY)
- `project = GOP AND key in (GOP-765, GOP-766, GOP-767, GOP-768, GOP-769, GOP-851, GOP-852, GOP-853, GOP-854, GOP-855, GOP-856, GOP-857, GOP-858, GOP-859, GOP-860, GOP-861, GOP-862)` — status and resolution date of each (needed for the feature-status sentences)
- `project = GOP AND "Epic Link" in (GOP-765, GOP-851) ORDER BY updated DESC` (or `parent in (GOP-765, GOP-851)`)
- `project = GOP AND text ~ "magazzino" AND updated >= -60d ORDER BY updated DESC`
- `project = GOP AND text ~ "DDT" ORDER BY updated DESC`
- Purpose: one real story (problem → cause → fix, no personal data, no contractual detail). Candidates: GOP-767 correction of 12/11/2026 (Magazzino entry missing from the menu because the configuration of the tipo switched it off; Stato column too narrow for «Non prevista»); GOP-862 (QR format still unknown: why the anteprima exists).

### Specific facts, numbers and labels to hunt
- **Stati:** «In centrale», «Assegnata, da ritirare», «In furgone», «Smontato», «Installata», filter «Qualsiasi, anche installati».
- **Movimenti:** «Carico in centrale», «Assegnazione», «Ritiro (app)», «Ritiro non previsto», «Cambio collocazione», «Rientro in centrale», «Installazione», «Installazione forzata», «Contatore smontato», «Uscita al committente», «Consumo (chiusura)». **Origini:** «Back office», «App», «Importazione», «Chiusura intervento».
- **Anomalie:** «Entrata non prevista», «Installazione forzata», «Scarico oltre il saldo del furgone», «Articolo non in catalogo», «Inventario: pezzo mancante dal furgone», «Inventario: pezzo non previsto nel furgone», «Inventario: quantità diversa dal saldo»; filter «Da vedere» / «Viste» / «Tutte»; button «Segna come vista».
- **Buttons and fields:** «Carica in centrale…», «Importa da Excel», «Assegna a operatore…», «Rientro in centrale…», «Storia del pezzo», «Storia nel magazzino», «Codice o QR», «Cerca», «Filtro Avanzato», «Excel», «Nuovo affido…», «Nuovo reso…», «Nuova uscita…», «Annulla DDT…», «Consegna al committente…», «Reso in centrale con DDT…», «Stampa il DDT n. …», «Nuovo articolo…», «Affida a operatore…», «Importa catalogo…».
- **Messages:** «era già letto»; «Parti del QR non riconosciute»; «Non è un contatore smontato»; «Nessun pezzo trovato»; «Il magazzino di questa commessa non è attivo per il Magazziniere.»; «Non risulta nel tuo furgone»; «È nel furgone di un altro operatore»; «Non è in magazzino: caricalo prima in centrale»; «Già installato»; «Stesso codice di una riga più in alto nel file»; the yellow Lotto notice; «momentaneamente sospese».
- **Numbers:** 5 contatori per scatola; 5000 codici per reading in blocks of 500; 500 in the Rientro; 150 ms reader pause (DEV only); codice max 20 caratteri, `A-Za-z0-9._/`; Calibro 0–100000; first 100 rejected rows; 10–200 righe per pagina; Excel up to 100000 rows (DEV only); DDT number «n/anno»; attachment max 8 MB (PDF, JPEG, PNG); app DDT list max 50 (DEV only); Smontati list 5000 oldest; Magazziniere `users.tipo` 7 (DEV only).
- **Dates:** the magazzino base (11–12 novembre 2026), Magazziniere (22 novembre 2026), DDT (22–23 novembre 2026), app Magazziniere and inventario (24 novembre 2026, screens not released).

### Mandatory [CONFLICT] items to record
1. **Which commesse have the new magazzino.** `lib/MagazzinoPagina.php` docblock: «oggi sg_smat, e easy_sacofgas quando passera' alla v3». `docs/02-patterns/50-…`: «Oggi `sg_smat` e `aretisost`». `custom/*/config.inc.php`: the flag is true in `aretisost`, `sg_italgas`, `sg_italgas_test`, `sg_smat`, `sg_smat_test`. Does `sg_italgas` see the new section (migration 0032 applied? `baseAttivo()`)? Resolve with code; the chapter says «alcune commesse».
2. **Paste/reading limit in «Carica in centrale…»:** 500 (wiki `magazzino.md`) vs 5000 in blocks of 500 (wiki postazione, pattern 50).
3. **Are the DDT live?** Wiki postazione (22/11): «Quando il DDT sarà attivo…». Changeset 23/11: after the switch DDT and Smontati appear. Runbook aretisost: the switch runs «dopo il merge… parola del capitano». Jira GOP-852 / GOP-857 status decides.
4. **App screens of the Magazziniere and of the inventario:** wiki (24/11): «non ancora rilasciate». Jira GOP-856 / GOP-861 and any app release note decide.
5. **Label of the assigned state:** «Assegnata, da ritirare» (back office, `MagazzinoGriglie::STATI`) vs «Assegnato da ritirare» (app wiki). Record both; the chapter quotes the back-office label.
6. **Permission descriptions use «carichi» and «lotti»** in the magazzino sense (`lib/CatalogoPermessi.php`) against the glossary. Record as a glossary conflict, not a code conflict.
7. **Original design vs code:** doc 22 plans depositi periferici, rettifiche and a per-commessa `depositi` table; the code has only centrale + furgone and no rettifica (`docs/mobile-v3/magazzino.md` § Catalogo: «Nessuna rettifica dell'ufficio in questa versione»). The chapter follows the code.

### Security filter reminder
No logins, no names of operatori, utenti, magazzinieri or intestatari: the placeholder name in the riepilogo example of the sources must not be copied. No addresses, POD codes, real matricole or real scatola/pedana codes (examples must be invented and declared), IPs, hosts, keys, `.env` values. No contractual data of the committente, including the sender/recipient header of the DDT (the changeset says it is incomplete: do not reproduce it). Committente/commessa names: at most one, as an example, sparingly.

---

## TARGET

- **Word count:** 5.600–5.900 words in total (PRD § 4: 4.000–6.000). Breakdown: «In questo capitolo» ~80; § 1 900; § 2 1.000; § 3 1.000; § 4 850; § 5 1.100; § 6 1.000; closing + `## Fonti` ~150.
- **Opening hook strategy:** open § 1 with one invented case, declared as invented: an operatore closes a sostituzione with a contatore that the registro had in a colleague's furgone; the closure goes through, the colleague's furgone has one piece less, and the only trace is a row «Installazione forzata» in Anomalie. In three sentences this shows that the magazzino never stops the field, it records, and the office has to read.
- **Closing beat promise:** end on a rule the reader can apply at the desk: when Giacenze and what is physically on the shelf or in the furgone disagree, do not wait for GOPlanner to fix it, because anomalie and inventario only record. Register the movimento that tells the truth (carico, assegnazione, rientro, uscita with its DDT), and stop to ask the staff tecnico only when that movimento does not exist: a carico made by mistake, a confirmed uscita, a QR not recognised.
