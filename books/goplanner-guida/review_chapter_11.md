# Review — Capitolo 11. Utenti, ruoli e permessi

Reviewer run: 25 novembre 2026. Read fresh: `PRD.md`, `STYLE_BIBLE.md`, `INSTRUCTION.md` § Reviewer, `chapter_11_struttura.md`, `chapter_11.md`, `dossier_chapter_11.md` (all [PUBLIC], [SHADOW] and [CONFLICT] rows), `oracle_questions.md` § Capitolo 11. For the ending check: the last paragraph of chapters 1–10. For continuity: `chapter_2.md:31,66`, `chapter_3.md:135`, `chapter_4.md:15`. Spot-checks on the GOPlanner code, branch `php8` at `21e974921`, read only: `pages/utenti.php:56`, `lib/AdminAreaUtenti.php`, `lib/MenuAdmin.php`, `lib/Rbac.php` (`can`, `valuta`, `permessiEffettivi`), `lib/CatalogoTask.php`, `lib/CatalogoPermessi.php`, `lib/AmbitoDati.php` (`PER_PROFILO`), `lib/User.php::init`, `Smarty_templates/it/_header.html:139-178`, commit `6c1aafc1a`.

## 1. Executive Summary

The chapter holds the dossier's facts tightly, and the thesis is right: four layers in order, with profiles in sola registrazione and the old level doing the blocking. Its best passages replace real tribal knowledge. The Accessi window saves lotti without the confirmation the Lotti page asks for. A task removed from a variante does not stop the action. The invite escalation story shows why the ceiling exists. Below the pass line because of:
- **Factual slips:** «I task sono 36» (37 on `php8` since GOP-873, 24 novembre 2026). The hook's «Tre sintomi, tre livelli diversi» is false by the chapter's own taxonomy (two of the three are ambito). A Limite cites «la tabella dice» for a row the table does not have. One [UNVERIFIED] negative is stated as fact (importer's name «non compare in nessuna pagina»). The § 6 re-save rule was mis-stated.
- **A BLOCKED finding buried in researcher-speak.** The main procedure («Accessi») may be invisible to the amministratori it addresses. The draft says so only in a Limite, ending with «il comportamento nel browser non è stato verificato». The parallel risk for the «Amministratore commessa» (Elenco utenti, Invita utente) is missing.
- **Meta leaks and undefined jargon:** «Le due affermazioni … sono vere tutte e due», «La ragione è scritta nelle note di progetto», and two different «contrassegni» that are never defined.
- **A closing with the same shape as chapters 1 and 2:** «quando … non torna → ordine → staff tecnico».

All fixes are local. **22 passages rewritten**, one box added.

## 2. Score: 45/60 → REVIEWER_CORRECTIONS

| Dimension | Score | One-line reason |
|---|---|---|
| Narrative & Structure | 8/10 | The build runs from identity to profiles, invites, ambito, powers and diagnosis, and § 6 pays off the four-layer thesis. Against it: the hook mis-maps its own symptoms, two catalogue paragraphs (blocking rules, scheda) ran 8–10 sentences without orientation, and the closing echoed chapters 1 and 2. |
| Language, Style & Voice | 7/10 | Mostly on persona: verbatim labels, short rule sentences, no «noi». Drift: researcher meta, two undefined «contrassegni», and «tenant» quoted in § 2 before the gloss that only arrives in § 3. |
| Factual Accuracy | 7/10 | About 180 checkable claims, nearly all traced. Errors: the task count, the hook's «tre livelli», «la tabella dice», the unverified negative, the § 6 re-save rule, a non-sequitur in § 4 («quindi … perché lì ha un profilo diverso»), and the omitted `canViewUtenti` dependency (oracle q. 2). |
| Audience Alignment | 7/10 | The procedures and tables are what an ADMIN reader needs. But the chapter sent amministratori to «Accessi» five times and gave no fallback if the button is missing. Code reading suggests it often is: `users.admin = 1` is the same flag that titles the menu «Admin» and opens the staff tools. |
| Concreteness (replaces Sensory, INSTRUCTION § Reviewer) | 8/10 | Very dense in exact detail: 72 ore, 30 giorni, 10 minuti, 200 righe, five verbatim refusals, the first/last lotto messages, three real cases. Some sections read as label catalogues rather than consequences. |
| Originality & Angle | 8/10 | «Il permesso dice quali azioni; l'ambito dice su quali righe», the profile-vs-level gap, and «la finestra «Accessi» salva le spunte senza chiedere niente» are knowledge nobody had written down. The original ending gave back some of that originality. |
| **Total** | **45/60** | |

## 3. Detailed Findings by section

### «In questo capitolo» and § 1 — Persona, accesso, commessa

- **Hook logic error.** «Il menu «Utenti» dipende dal profilo; i due operatori sono stati nascosti; le liste del lotto Sud non rientrano nei lotti di competenza … Tre sintomi, tre livelli diversi.» The chapter's own § 4 and § 6 table file both «operatore nascosto» and «lotti» under **ambito**, so the hook shows two layers, not three, and never touches layers 1–2. Rewritten (R1) so the hook states which layer each symptom belongs to. It also adds the chapter's real lesson: a higher profilo would not bring back a nascosto operatore (`User::getOperatori()`: «Amministratore cliente» compreso → `attivo=1 AND nascosto=0`).
- Strong: the three levels persona / accesso / organizzazione are defined in one paragraph each, with the UI message as the definition of organizzazione. The «Da collegare» Limite correctly says «nessuna pagina, pulsante o azione lo esegue: oggi lo fa lo staff tecnico» (dossier [CONFLICT] 4).
- Login and landing are exact («Accedi», «Nome utente», «Password dimenticata?», «Accedi con Google» conditional, 30 giorni, no choice screen).
- **Continuity:** `chapter_2.md:66` still says «Collegarli è un lavoro dell'amministratore, descritto nel capitolo 11». Chapter 11 now (correctly) says the opposite. **Chapter 2 needs correcting.**

### § 2 — Profili, task e permessi

- **«I task sono 36.»** `lib/CatalogoTask.php` on `php8` has 37 entries; `operatori_confronta` («Confronto operatori») came with GOP-873 on 24 novembre 2026. The dossier's 36 is stale. Fixed. (39 permessi and 15 «Sensibile» confirmed.)
- **The best demonstration was buried.** «il menu File, per esempio, propone l'importazione solo ai primi quattro livelli» is ambiguous: the two Amministratori share one level, so which four? It also hides the point. `_header.html:173` opens `file.php?action=importa` for `can_tipo('interventi.importare', 4)`, so a «Call center» and a «Consultazione» land on the import even though the table four lines above says «no» for both. That is the whole thesis of the subsection in one menu. Rewritten (R2), with the four blocking items as a list.
- «Il task «Accedere come un altro utente» esiste nel catalogo ma non viene controllato: darlo in una variante non abilita nulla.» Excellent; exactly the kind of fact the enemy (tribal knowledge) hides.
- GOP-626 paragraph: it quotes «… valido su tutti i tenant …» in § 2, but the gloss «è la parola del codice per commessa» only arrives in § 3. Gloss added at first occurrence. Optional: pattern 42 says migration 0023 may not have run in production. The code refuses new copies either way, but «una sola definizione valida su tutte le commesse» assumes the migration. Left as written; see Optional.
- The «Ho tolto un task dalla variante» counter-objection is the strongest in the chapter, and its answer comes from the code (`VariantiProfilo` keeps the base `tipo`).

### § 3 — Invitare una persona e darle gli accessi

- The invite procedure, the 72 ore, «Reinvia invito» (no confirmation, old link dies) and the second commessa (no duplicate, notice after 10 minuti) are all exact and well sequenced.
- **BLOCKED item handled as a footnote with meta.** «… un accesso creato con un invito nasce senza quel contrassegno, e il comportamento nel browser non è stato verificato.» The reader is not the researcher; «non è stato verificato» is process, not guidance. The point is also too important for a Limite at the end. I spot-checked `pages/utenti.php:56` (`$_SESSION['user']['admin'] === 1 && can('profili.assegnare')`) and `AdminAreaUtenti::titoloAdmin()` / `MenuAdmin.php:10` (the same `admin == 1` flag titles the menu «Admin» and opens Console JSON, Log, etc.). On the code, an amministratore of a committente most likely has `admin = 0` and does not see «Accessi». Moved into an `> **Attenzione:**` box right after the procedure (R3). The box gives the two routes that still work, which the dossier supports: re-invite adds a commessa via `aggiungiTenantAIdentita`, and Interventi › Lotti assigns lotti with `profili.assegnare`. The rest goes to the staff tecnico.
- The scheda paragraph packed 10 sentences of labels into one block. Split into a three-item list plus prose (R4).
- Real case (escalation before 26 settembre 2026): commit `6c1aafc1a` confirmed at 2026-09-26. Strong story, told problem → cause → fix with no names. Small fix: «ha anche lui» → «ha già» (avoids a gendered pronoun for «chi invita»).

### § 4 — Lotti di competenza e ambito dei dati

- The trap is written down for the first time: «La pagina Lotti chiede conferma ai due bordi … La finestra «Accessi», invece, salva le spunte senza chiedere niente.» This is the best paragraph of the chapter.
- «Dalla persona:» was glued to the previous sentence about English labels. It is now its own line, and it carries the «Accessi» condition, since this procedure uses the same button.
- **Non-sequitur:** «Due commesse usano per la Verifica una soglia diversa … La stessa persona può quindi vedere righe diverse su due commesse, perché lì ha un profilo diverso.» The «quindi» follows from the threshold, but the clause gives a different cause. Fixed: two causes, both named.
- **False self-reference in the Limite:** «la tabella dice che la «Consultazione esterno» non vede la tendina degli operatori». The chapter's table has no such row. The source is the scheda panel («Operatori nelle tendine» → «Non li vede», `SchedaUtente.php:216-223`). Fixed (R5).
- **Unverified negative as fact:** «Il nome di chi ha fatto un'importazione, infine, non compare in nessuna pagina del back office». The dossier marks this [UNVERIFIED]. The sentence also sat, with «infine», at the end of a paragraph about the «Operatore» dropdown. It is now a positive rule next to the other Gea sentence: Gea says «un collega», and gives the name only to amministratori and staff who ask (`chatbotPuoNominare`, `tipo <= 1`). This keeps the chapter 4 promise without claiming what nobody checked.
- Ambito table checked against `AmbitoDati::PER_PROFILO`: correct, including «Magazziniere» (Verifica > 3, Foto > 5) and the translation «oltre il 3» = from Eseguito.

### § 5 — Amministratori e staff tecnico

- The table is clear and the five impersonation refusals are verbatim (`Impersonazione.php:21-25`). The guard paragraph («Serve almeno un Amministratore cliente attivo per l'azienda.», invited-but-pending counts as active) is exactly what an admin needs to trust the system.
- **Researcher meta:** «Le due affermazioni «il menu Admin è riservato al personale GOPlanner» e «l'amministratore vede le voci Utenti» sono vere tutte e due, a livelli diversi.» The reader never saw the first «affermazione»: it is the wiki line from [CONFLICT] 5. Replaced with the fact itself (R6).
- **«La ragione è scritta nelle note di progetto»** cites a source in body text; sources belong in «Fonti». Cut to the reason.
- **Two undefined «contrassegni».** § 3 uses «contrassegno di amministratore» (`users.admin`); § 5 uses «contrassegno di organizzazione» (`admin_org`) twice, never defined. They are different flags, and an admin reader cannot tell them apart. § 5 now says «nomina ad amministratore dell'organizzazione», which is what `admin_org` means to the reader (R7).
- **Missing risk:** an «Amministratore commessa» needs `canViewUtenti` (a legacy role key, `Rbac::can`, independent of the switch) to see «Elenco utenti» and «Invita utente». `Rbac::permessiEffettivi()` returns «all» only for the super-admin and an admin_org; platform profiles contain no legacy keys (verified). The table says «Assegnare profili: sì, entro il proprio tetto» for the «Amministratore commessa» without this caveat. Added to the Limite and to the «Quando chiedere» box (oracle q. 2 still open).
- Trimmed «alta 44 pixel» (true in `_header.html`, but useless to the reader).

### § 6 — Quando un utente non vede qualcosa

- The checklist with step 0 («La persona») is the chapter's payoff and works. The origin tags («Dal profilo», «Tolto dalla variante») turn the scheda into a diagnostic tool.
- **Rule mis-stated in step 3:** «Oggi a bloccare è il livello scritto al salvataggio: se il profilo è stato cambiato, va risalvato da «Accessi».» A profilo changed from «Accessi» *was* saved, so its level is already current. The accesso at risk is the one **never** saved from «Accessi» (`AccessoCommessa::dopoCommit`, «no backfill»). Fixed, with the staff fallback for the missing button.
- Limite repeated § 4's «pannello vs livello» point in full; now a one-line pointer.
- **Closing echo.** «Quando qualcuno non vede qualcosa, prima di dare un accesso si cerca il primo livello … si lascia allo staff tecnico» has the shape of `chapter_1.md` («Quando qualcosa non torna, l'ordine è questo … dopo Gea lo staff tecnico») and `chapter_2.md` («ogni volta che qualcosa non torna. Si chiede, in quest'ordine, quale commessa è aperta …»). Chapters 9 and 10 also end on «staff tecnico». STYLE_BIBLE § Persona: «My ending cannot echo any previous chapter.» The original's best idea («l'accesso più piccolo che risolve») is now the lead. The ending lands on the chapter's own rule: while controls are in registrazione, rely on the base profilo, not on a variante's removed task (R8).

### Format and pipeline

- One H1, italic «In questo capitolo», `## Fonti` last, no raw HTML in the body. Every Jira key has a title. Added `pages/utenti.php` and `lib/JSONController.php` to «Fonti» (the new box and several § 4 rules rest on them).
- The footer `<!-- … -->` comments are raw HTML (PRD § 6). As in the reviews of chapters 2, 3 and 5, this is a pipeline issue (`ralph.sh` asks for them, `publish.sh` does not strip them). Left in place; the word count line is updated.
- Length: about 6.120 words in the body, slightly above «circa 4.000–6.000». Acceptable; two trims offset part of the added box.
- Security: no logins, names, emails, hosts or company display names. Tenant codes appear only in DEV boxes. Pass.

### Cross-chapter corrections to schedule (not applied here)

1. `chapter_2.md:66` — «Collegarli è un lavoro dell'amministratore, descritto nel capitolo 11» → today only the staff tecnico can link a «Da collegare» row.
2. `chapter_3.md:135` — «il server rifiuta» on «Modifica carico» / «Chiudi carico»: `Rbac::gate('canUpdateCarico')` is log-only today (dossier [CONFLICT] 6b).
3. `chapter_4.md:15` — «Chi ha il permesso «Importare interventi» vede …»: today the File menu follows the level (`can_tipo(…, 4)`), so «Call center» and «Consultazione» also land on the import. Verify the wording against the File page's own gate before changing.
4. When oracle questions 1 and 2 of chapter 11 are answered, update the § 3 «Attenzione» box and the § 5 Limite.

## 4. Persona Audit

**Verdict: on persona, with local drift, now corrected.** The Engineer + Scholar voice dominates. Each rule carries its reason and source, every label is verbatim, and the chapter states things it would have been easier to omit. «Il task … esiste nel catalogo ma non viene controllato: darlo in una variante non abilita nulla» and «Le scritte in inglese sono note e non indicano un errore» are the persona at its best: specify, don't intensify.

Where it drifted:
- **Into the researcher's voice:** «il comportamento nel browser non è stato verificato», «Le due affermazioni … sono vere tutte e due, a livelli diversi», «La ragione è scritta nelle note di progetto», «Alcune pagine di documentazione più vecchie ne contano ancora sette». The persona's rule is «Se non lo so, non lo scrivo». When it does write about a gap, it writes the reader's next step, not the research log.
- **Into the code's vocabulary without translation:** «contrassegno di organizzazione» is `admin_org` with an Italian veneer. The persona notices «il nome esatto» first, and here the exact name for the reader is the nomina ad «Amministratore cliente».
- **Into catalogue mode:** the scheda paragraph and the four-blocking-things paragraph. Both are now lists. A list of labels is fine; ten labels in one sentence chain is not prose.
- No banned patterns found (checked all 14). «gestire» appears only inside verbatim labels. No «noi»/«io». No marketing adjectives («L'azione più potente» was already fixed by the Editor).

## 5. Counter-Objection Check

Five present (STYLE_BIBLE requires ≥2), all in the reader's voice, all answered from the sources:

| § | Objection | Strongest form? | Evidence-based answer? |
|---|---|---|---|
| 1 | «Lavoro su due commesse: mi servono due accessi diversi?» | Medium: chapter 2 already asked a close variant; here the angle (profilo per commessa) is new | Yes (`identita_users`, «Commessa e profilo») |
| 2 | «Ho tolto un task dalla variante, ma il collega riesce ancora a farlo.» | **Strong**: this is the objection an amministratore will actually raise next week | Yes (`VariantiProfilo` keeps the base `tipo`; `Rbac::gate` log-only) |
| 3 | «L'invito è scaduto, oppure la mail non è arrivata.» | Weak-medium: practical, low stakes; the strong part («un indirizzo sbagliato non si corregge reinviando») is good | Yes (`reinvia()`, wiki) |
| 4 | «Ho dato al collega il lotto Nord e adesso non vede più le liste di prima.» | **Strong**: the first-lotto trap | Yes (`LottiCompetenza`, UI message) |
| 6 | «Al collega ho dato lo stesso profilo che ho io, ma vede meno cose.» | Strong | Yes (lotti and ambito per commessa) |

**Missing, and the strongest objection a skeptical amministratore has:** «Se i controlli dei profili non bloccano niente, a che cosa serve assegnare i profili?» The chapter answers it in substance («Questo non vuol dire che oggi tutti possano fare tutto»: the profilo writes the level that blocks, and the deny record prepares the switch-on). It never phrases it as the reader's doubt. Optional addition (see § 6 Optional).

## 6. Priority Improvements

### Critical (applied)
1. «I task sono 36» → 37 (`CatalogoTask.php`, GOP-873).
2. Hook: «Tre sintomi, tre livelli diversi» corrected to the chapter's own taxonomy.
3. The «Accessi» visibility condition moved from a meta-worded Limite to an `Attenzione` box next to the procedure, with the routes that still work.
4. § 4 Limite «la tabella dice …» → the scheda panel that actually says it.
5. § 6 step 3: re-save rule corrected (the accesso never saved from «Accessi», not «il profilo cambiato»).
6. Unverified negative about the importer's name replaced by the verified Gea rule.

### Important (applied)
7. «Oggi: che cosa blocca davvero»: blocking items as a list; File-menu demonstration made explicit (Call center and Consultazione see the import).
8. § 5: «Amministratore commessa» and `canViewUtenti` added to the Limite and to the «Quando chiedere» box.
9. Researcher meta removed (§ 3 Limite, § 5 Admin menu, § 5 «note di progetto», § 2 docs-count sentence).
10. «contrassegno di organizzazione» → «nomina ad amministratore dell'organizzazione» (§ 5, twice).
11. Closing rewritten so it does not echo chapters 1, 2, 9 and 10.
12. § 4 non-sequitur on the Verifica threshold; scheda paragraph split into a list; «tenant» glossed at first use.

### Optional (not applied)
13. Add the missing counter-objection «Se i controlli non bloccano, a che serve il profilo?» as a two-sentence *Contro-obiezione* at the end of «Oggi: che cosa blocca davvero».
14. GOP-626 paragraph: say «le copie nuove vengono rifiutate» until the staff confirms migration 0023 has run (oracle q. 6).
15. «Users of competence» / «Remove» / «Invite email sent»: open the translation ticket (oracle q. 8), then drop the English-label sentence.
16. Pipeline: strip `<!-- … -->` comments in `publish.sh`.
17. `chapter_index.md` does not exist; INSTRUCTION asks for it on PASS. Create it when the pipeline adds the file, with: canonical terms *persona / accesso / organizzazione*, *livello* (for `tipo`), *nomina ad amministratore dell'organizzazione*, *ambito dei dati*; central claim «what blocks today is the level the profilo writes on save».

## 7. Rewritten Paragraphs

### R1 — § 1, hook

**Original:**
> Nessuna delle tre è un guasto. Il menu «Utenti» dipende dal profilo; i due operatori sono stati nascosti; le liste del lotto Sud non rientrano nei lotti di competenza che gli sono stati assegnati. Tre sintomi, tre livelli diversi. Il capitolo li percorre nell'ordine in cui GOPlanner li applica: prima la commessa aperta nella sessione, poi il menu di quella commessa, poi il profilo che la persona ha su quella commessa, infine l'ambito dei dati.

**Rewritten:**
> Nessuna delle tre è un guasto, e nessuna si risolve allo stesso modo. Il menu «Utenti» manca perché il profilo «Pianificatore» non comprende la gestione degli utenti. I due operatori sono stati nascosti dalla pagina Operatori, e un operatore nascosto non compare nemmeno nella tendina di un «Amministratore cliente». Le liste del lotto Sud mancano perché il suo accesso è limitato ad altri lotti. Un profilo più alto non riporterebbe i due operatori, e gli darebbe molto più di quello che gli manca. GOPlanner decide che cosa mostrare su quattro livelli, sempre nello stesso ordine: la commessa aperta nella sessione, il menu di quella commessa, il profilo che la persona ha su quella commessa, l'ambito dei dati. La prima mancanza sta nel terzo livello, le altre due nel quarto; il capitolo li percorre tutti, in quell'ordine.

**Why:** «tre livelli diversi» contradicted § 4 and the § 6 table, where operatori nascosti and lotti are both ambito. The rewrite maps each symptom to its layer. It also plants the lesson the closing pays off: a higher profilo is the wrong reflex. Source for «nemmeno … «Amministratore cliente»»: `User::getOperatori()`, third branch.

### R2 — § 2, «Oggi: che cosa blocca davvero»

**Original:**
> Questo non vuol dire che oggi tutti possano fare tutto. Bloccano, già oggi, quattro cose. Il menu della commessa. Il **livello** dell'accesso, … Molte voci del menu e molte azioni confrontano questo livello: il menu File, per esempio, propone l'importazione solo ai primi quattro livelli, e il messaggio «Non hai il permesso di modificare gli interventi» del capitolo 6 viene da un controllo di livello, che respinge «Magazziniere», «Consultazione esterno» e «Tecnico». Poi le regole del server … Infine le azioni di manutenzione riservate allo staff tecnico, chiuse a tutti gli altri.

**Rewritten:**
> Questo non vuol dire che oggi tutti possano fare tutto. Già oggi bloccano quattro cose:
>
> - il menu della commessa;
> - il **livello** dell'accesso, … In ordine, dal più alto: «Amministratore cliente» e «Amministratore commessa» (lo stesso livello), «Pianificatore», «Call center», «Consultazione», «Magazziniere», «Consultazione esterno», «Tecnico»;
> - le regole del server su inviti, profili, accessi e accesso come un'altra persona (sezioni 3 e 5), che non dipendono dall'interruttore;
> - le azioni di manutenzione riservate allo staff tecnico, chiuse a tutti gli altri.
>
> Molte voci del menu e molte azioni confrontano il livello, non il profilo, e la differenza si vede. Il menu File apre direttamente l'importazione a chi ha il livello della «Consultazione» o uno più alto: quindi anche a un «Call center» e a una «Consultazione», che nella tabella sopra hanno «no». Il messaggio «Non hai il permesso di modificare gli interventi» del capitolo 6 viene anch'esso da un controllo di livello: respinge «Magazziniere», «Consultazione esterno» e «Tecnico», e lascia passare gli altri anche se il loro profilo non comprende il permesso.

**Why:** four items buried in one paragraph, with a 70-word item in the middle, now form a list. «Primi quattro livelli» was ambiguous because two profiles share level 1. The real demonstration, that the table says «no» and the menu says yes, was implicit. Now the reader sees the gap instead of being told about it. Source: `_header.html:173` (`can_tipo('interventi.importare', 4)`), dossier [CONFLICT] 6a.

### R3 — § 3, the «Accessi» condition (Limite → Attenzione box)

**Original (in the Limite):**
> Il pulsante «Accessi», e nella scheda «Modifica» e «+ Aggiungi commessa», compaiono solo se l'accesso di chi guarda ha il contrassegno di amministratore oltre al permesso di assegnare i profili; un accesso creato con un invito nasce senza quel contrassegno, e il comportamento nel browser non è stato verificato. Se i pulsanti non compaiono, è una domanda per lo staff tecnico.

**Rewritten (box right after «Cambiare gli accessi»):**
> **Attenzione:** il pulsante «Accessi», e nella scheda «Modifica» e «+ Aggiungi commessa», compaiono solo se l'accesso di chi guarda porta il contrassegno di amministratore, oltre al permesso di assegnare i profili. Gli accessi creati con un invito nascono senza quel contrassegno. Se i pulsanti non compaiono, restano due strade: un nuovo invito alla stessa email aggiunge una commessa con il suo profilo, e la pagina Interventi › Lotti assegna i lotti (sezione 4). Per cambiare il profilo di un accesso esistente, ci si rivolge allo staff tecnico.

**Why:** the condition can make the section's main procedure unusable for its own reader. It belongs next to the procedure, not at the end. «Il comportamento nel browser non è stato verificato» is research status, not guidance. The box replaces it with what the reader can still do (`InvitoUtente::aggiungiTenantAIdentita`; `LottiCompetenza::modifica`, which needs `profili.assegnare` and not `users.admin`). Spot-checked: `pages/utenti.php:56`.

### R4 — § 4 Limite, the false self-reference

**Original:**
> Infine, la tabella dice che la «Consultazione esterno» non vede la tendina degli operatori; il codice di oggi gliela mostra lo stesso, con gli operatori attivi e non nascosti.

**Rewritten:**
> Infine, per la «Consultazione esterno» il pannello «Ambito dei dati» scrive «Non li vede» alla riga «Operatori nelle tendine»; oggi però la tendina le compare lo stesso, con gli operatori attivi e non nascosti.

**Why:** the chapter's ambito table has no operatori row for «Consultazione esterno»; the reader would look for it and not find it. The screen that does say it is the scheda panel (`SchedaUtente.php:216-223`). The rewrite also drops «il codice di oggi», since the office reader sees a dropdown, not code.

### R5 — § 4, importer's name (moved and corrected)

**Original (end of the operatori paragraph):**
> Il nome di chi ha fatto un'importazione, infine, non compare in nessuna pagina del back office: lo dice Gea, e solo agli amministratori e allo staff tecnico che lo chiedono esplicitamente; per gli altri, chi ha importato è «un collega».

**Rewritten (after «Gea rispetta gli stessi lotti …»):**
> Quando parla di importazioni ed esportazioni, Gea chiama «un collega» chi le ha fatte; il nome lo dice solo agli amministratori e allo staff tecnico, e solo se lo chiedono esplicitamente.

**Why:** «non compare in nessuna pagina» is dossier [UNVERIFIED]: a negative nobody proved. The verified rule (`chatbotPuoNominare`, `tipo <= 1` plus an explicit request) keeps chapter 4's promise. The sentence also moves next to the other Gea rule; at the end of a paragraph about the «Operatore» dropdown, «infine» was carrying an unrelated fact.

### R6 — § 5, the Admin menu

**Original:**
> Le due affermazioni «il menu Admin è riservato al personale GOPlanner» e «l'amministratore vede le voci Utenti» sono vere tutte e due, a livelli diversi.

**Rewritten:**
> È la stessa voce del menu: gli strumenti restano dello staff, l'amministratore ne vede solo la parte sulle persone.

**Why:** the draft quoted two claims from the dossier's [CONFLICT] table, one of them from a wiki page the reader never sees. The rewrite gives the resolution as a fact about the screen.

### R7 — § 5, the downgraded administrator (real case)

**Original:**
> La causa: il suo accesso su quella commessa era più vecchio del contrassegno di organizzazione, e il livello veniva impostato solo all'ingresso, senza che nessuno lo riallineasse quando il contrassegno era stato acceso. Il rimedio: il contrassegno di organizzazione ora impone il livello di amministratore nei quattro punti …

**Rewritten:**
> La causa: il suo accesso a quella commessa era più vecchio della sua nomina ad amministratore dell'organizzazione. Il livello veniva impostato solo all'ingresso, e nessuno lo aveva riallineato quando la nomina era arrivata. Il rimedio: oggi la nomina impone il livello di amministratore nei quattro punti in cui GOPlanner risolve la persona, cioè l'ingresso, il cambio di commessa, la creazione automatica dell'accesso e l'aggiunta di una commessa con l'invito.

**Why:** «contrassegno di organizzazione» is `admin_org` with an Italian veneer. It is never defined, and § 3 uses «contrassegno di amministratore» for a different flag (`users.admin`). The reader knows the event («è stato nominato Amministratore cliente»), not the flag. The 50-word sentence is also split.

### R8 — § 6, closing

**Original:**
> Quando qualcuno non vede qualcosa, prima di dare un accesso si cerca il primo livello che lo nasconde; poi si dà l'accesso più piccolo che risolve, un lotto in più prima di un profilo più alto. Quello che non si può dare da sé — più di quanto si ha, un'altra organizzazione, il menu di una commessa, gli strumenti Admin — si lascia allo staff tecnico, con il nome della persona, la commessa e la domanda dei quattro livelli dove ci si è fermati.

**Rewritten:**
> Davanti a un «non vedo» la mossa più rapida è un profilo più alto, e spesso è quella sbagliata. A volte non basta: un operatore nascosto resta nascosto anche all'«Amministratore cliente». Altre volte dà al collega molto più di quello che gli mancava, su tutta la commessa. L'accesso giusto è il più piccolo che toglie il primo «no» trovato: un lotto in più prima di un profilo nuovo, un operatore riattivato prima di un permesso. E finché i controlli dei profili restano in sola registrazione, quello che una persona non deve fare si affida al profilo di base, cioè al livello che il salvataggio scrive, e non a un task tolto da una variante.

**Why:** the original repeated the shape of chapters 1 and 2 (when something is off → check in order → staff tecnico) and the «staff tecnico» last beat of chapters 9 and 10. The staff hand-off is already in the § 5 box. The rewrite leads with the chapter's own idea, least privilege against the higher-profile reflex, which R1 sets up. It ends on the one rule only this chapter can give: rely on the base profile while controls are in registrazione.

### R9 — § 6, step 3 of the checklist

**Original:**
> Oggi a bloccare è il livello scritto al salvataggio: se il profilo è stato cambiato, va risalvato da «Accessi».

**Rewritten:**
> Oggi però a bloccare è il livello, che il profilo scrive quando l'accesso viene salvato: un accesso mai salvato da «Accessi» può avere ancora il livello di prima, e va risalvato (dallo staff tecnico, se il pulsante non compare).

**Why:** a profilo changed from «Accessi» has been saved, so its level is current. The draft pointed the reader at the wrong accessi. The risk is the accesso **never** saved there (`AccessoCommessa::dopoCommit` rewrites `tipo` on save; no backfill). The fallback covers the R3 condition.

## 8. Verdict

**REVIEWER_CORRECTIONS (45/60)**: an accurate, useful chapter with a sharp thesis. It needed six factual fixes, the BLOCKED «Accessi» condition moved next to the procedure, the researcher meta removed and a closing of its own. All applied in `chapter_11.md` (22 passages); chapters 2, 3 and 4 need the follow-up corrections listed in § 3.
