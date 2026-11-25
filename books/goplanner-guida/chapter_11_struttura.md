# Chapter 11 — Struttura (Architect spec)

**Chapter title (H1 for the Writer):** `# 11. Utenti, ruoli e permessi`
**PRD row:** «Chi vede che cosa: identità centralizzata sul DB master, RBAC e profili, inviti, lotti di competenza, amministratore e staff tecnico, ambito dei dati, diagnostica della visibilità» — audience **ADMIN** (amministratori and staff tecnico; the back office reads § 1, § 4 and § 6 too).
**Core question of the chapter:** when a person opens GOPlanner, what decides what they see and what they can do, and who can change it?
**Chapter thesis (the rule the whole chapter proves):** what a person sees is decided by four layers, always in the same order: **(1) the commessa** open in their session (their accesses, on the DB master), **(2) the menu of that commessa** (configuration, not a permission), **(3) the profilo** they have on that commessa (permessi), **(4) the ambito dei dati** (lotti di competenza, operatori visibili, stati thresholds). An amministratore can change layers 3 and 4 within a ceiling; layers 1-2 beyond their organization, and everything in Admin, belong to the staff tecnico. One fact cuts across all four, and the chapter must state it once, plainly and in proportion: on 25 novembre 2026 the new profile checks are **in sola registrazione** for every organization (`rbac_enforce` = false), so what actually blocks today is the old `tipo` that the profile writes when it is saved, plus the server-side rules of invites, profiles and impersonation.

### Continuity and glossary check (done by the Architect, 25 novembre 2026)
- `chapter_index.md`: not present. `NARRATIVE_GLOSSARY.md`: not present. Canonical vocabulary = `/home/alan/firstmate/projects/GOPlanner/CONTEXT.md`.
- **Promises made by earlier chapters that ch.11 must keep** (the Writer must cover each; the Reviewer checks):
  1. ch.2: «La stessa persona può avere accesso a più commesse, con permessi e lotti diversi in ciascuna; … trattato nel capitolo 11» → § 1.
  2. ch.2: organizzazione (`clienti.codice_org`) «se ne parla nel capitolo 11» → § 1 and § 5.
  3. ch.2: rows «Senza identità» — «Collegarli è un lavoro dell'amministratore, descritto nel capitolo 11» → § 1. **Flag:** the Architect found no page or button that links a legacy access to an identity (`git grep` on `lib/`, `js/code/utenti_*.js`, `pages/utenti.php`). If the Researcher confirms there is none, the chapter says plainly that today the staff tecnico does it, and the Reviewer records the ch.2 inconsistency. Do not invent a procedure.
  4. ch.2 table: «Una voce di menu c'è in una commessa e manca in un'altra» → `$custom['menu']` della commessa, o permesso del profilo, «capitolo 11» → § 2 (two conditions) and § 6.
  5. ch.2: «Il profilo amministratore: uno solo, uguale per tutte le commesse» → § 2 must reconcile: one *definition* (profilo generale, GOP-626) valid on every commessa; and two different administrator profiles exist (Amministratore cliente vs Amministratore commessa). Do not contradict ch.2; explain what «uno solo» means.
  6. ch.3: «Gli utenti di competenza sono nel capitolo 11»; «assegnare il lotto all'utente … lo fa un amministratore (capitolo 11)» → § 4.
  7. ch.4: permesso «Importare interventi» and the profiles that have it, «nel capitolo 11» → § 2 table; ch.4: «Il nome di chi ha importato lo vedono solo gli amministratori: vedi il capitolo 11» → § 4 or § 5, one sentence with the exact rule from code.
  8. ch.5: «La tendina «Operatore» mostra solo gli operatori visibili al proprio utente (capitolo 11)» → § 4 with the exact rule from `User::getOperatori()`.
- **Possible contradictions to resolve, not to copy** (Researcher records them in [CONFLICT]; the Writer states the code's version; the Reviewer decides whether earlier chapters need a correction):
  - ch.2 describes `operatori.id_user` as «il legame fra gli operatori e gli utenti che li seguono». In `lib/User.php::getOperatori()` the Tecnico profile sees `operatori WHERE id_user = <its own users.id>`, i.e. the operatore's **own** access, and `wiki/assistenza-clienti/diagnostica-visibilita-operatore.md` calls it «utente collegato … account associato». Verify the meaning.
  - ch.3 («Chi non ha quello di modifica può premere «Salva» … il server rifiuta») and ch.6 («senza, compare «Non hai il permesso di modificare gli interventi»») describe blocks. With `rbac_enforce` off, `can()` returns true for everyone (`lib/Rbac.php` gate: `return $consentito || !$enforceAttivo`; legacy users always true). Check the gate type behind each of these two messages (`can()` vs `can_tipo()`/`can_legacy()`/`SimpleOrm`), and record the result. Ch.11 must not quote them as examples unless the check confirms they block today.
- **Glossary traps specific to this chapter (Writer and Editor must check all seven):**
  1. **Utente ≠ operatore.** Utente = whoever enters the gestionale; operatore = the field worker with the app. An operatore *also* has an access (profile label «Tecnico», `tipo` 9, «Tipo di accesso» «App»). The profile label «Tecnico» is quoted as a label only; in prose always «operatore». Never «tecnico» or «utente» for the field worker.
  2. **Amministratore** is the glossary word. The UI labels «Amministratore cliente» and «Amministratore commessa» are quoted with «…» and explained once each. Never «admin» or «superuser» in prose; «Admin» only as the menu label. «Super-admin» only inside `> **Per gli sviluppatori:**` boxes; in UFFICIO text it is «lo staff tecnico».
  3. **«Cliente»** appears only inside labels («Amministratore cliente», menu «Clienti»). In prose: committente (who sends the work), commessa (the work), **organizzazione** (the company that groups several commesse and their people; define it once, from the UI message «Puoi accedere solo come persone i cui accessi sono tutti nella tua organizzazione.»).
  4. **Profilo vs ruolo.** The UI says «profilo» («Profili e varianti», «Commessa e profilo», filter «Profilo»). «Ruolo» is the older name, still in the code (`ruoli`, `identita_users_ruoli`) and in the chapter title. Explain the correspondence once in § 2 («ruolo» is the older name; today the pages say «profilo»), then use «profilo».
  5. **«Accesso»** = the link of one person to one commessa (one `users` row per commessa). «Account», «login», «user» are «da evitare» for utente; «Login» and «Password» appear only as UI labels (search field, «Reimposta password», «Tipo di accesso»).
  6. **«Tenant»** only inside DEV boxes, with the correspondence stated the first time («la commessa, che nel codice si chiama tenant»).
  7. **«Attività»** in the glossary = what a user or operatore did (log-like). The «Storico» of the scheda is the history of changes to accessi and profili: call it «storico», not «attività» and not «log».
- **Security (blocking, chapter-specific):** `docs/01-foundations/06-user-profiles-and-permissions.md` contains a real login and a real person's name in a `$custom['users']` example: never copy them. `config.inc.php` `$ORGANIZZAZIONI` contains company display names: in the chapter use at most the codes `sg`, `easy`, `ener` inside a DEV box, never the names. Do not open or quote `docs/03-cookbooks/06-credenziali-e-login.md` or headless-login cookbooks for anything but the existence of a page. No production counts of users or roles (pattern 25 and pattern 42 contain some): they are dated internal figures, not rules.

### Chapter boundaries (one-line pointers only, per PRD § 4 «Confini tra capitoli»)
| Topic touched here | Owned by | What ch.11 may say |
|---|---|---|
| DB master vs database of the commessa; why identities were not merged | ch.2 | One sentence + «vedi il capitolo 2». Do not re-explain the non-merge rationale |
| The lotto as an object (`carichi.lotto`, «Valore nel carico», creating/renaming lotti) | ch.3 | One sentence; ch.11 owns only the «utenti di competenza» and the visibility rule |
| The dropdown of liste and its one-hour cache | ch.3 | One sentence + «vedi il capitolo 3», only inside § 6 |
| Permesso «Importare interventi» in the File menu | ch.4 | Name the permesso and the profiles that have it; no File-menu walkthrough |
| Operatori › Confronto, abbinamento del telefono | ch.8 | One sentence each (the permessi exist; the work is in ch.8) |
| Profilo «Magazziniere» and the postazione | ch.9 | One row of the profile table + «vedi il capitolo 9» |
| Gea answering with the user's permissions; Gea's tool that explains the dropdown | ch.10 | One sentence each |
| Admin pages, runbooks, logs, the `rbac_deny` report as a tool, visibility of tickets | ch.12 | «I permessi come regole sono nel cap. 11; come si diagnosticano nel cap. 12»: § 6 gives the rules as an ordered checklist from the amministratore's own pages, then «vedi il capitolo 12» |
| `index.php` routing, `SimpleOrm` gate | ch.13 | DEV box only, one line |
| Tables `identita`, `identita_users`, `users`, `ruoli*`, `lotti` | ch.14 | DEV boxes only, max 4 lines each |
| CloudWatch | ch.16 | Not named outside a DEV box |

---

## NUFs (Goal Scoring)

Ten NUFs, so the Editor can score them one point each against the 8.5/10 gate. Format per INSTRUCTION.md § Architect.

```
utility(reader): Reader can explain the three levels persona (identità) → accesso (one per commessa) → organizzazione, say why the same person can have a different profilo and different lotti on two commesse, and read the Elenco utenti columns «Commessa e profilo» (with «+N»), «Tipo di accesso» (Google, password, App), «Ultimo accesso» («Mai») and «Stato» (Attivo, Invitato, Disattivato, Da collegare) → score += 1

utility(reader): Reader can choose the right profilo for a new colleague from the table of the eight platform profiles («Amministratore cliente», «Amministratore commessa», «Pianificatore», «Call center», «Consultazione», «Consultazione esterno», «Magazziniere», «Tecnico»), saying what each can and cannot do, and can tell «Amministratore cliente» (the whole organizzazione, nominates other Amministratori cliente) from «Amministratore commessa» (one commessa, no profili management, no impersonation) → score += 1

utility(reader): Reader can invite a person (Utenti › Elenco utenti › «Invita utente»), knows the link lasts 72 ore (3 giorni), resends it from «Inviti inviati» › «Reinvia invito» (new link, old one stops working), and knows that inviting an existing person on a second commessa adds that commessa to the same person instead of creating a duplicate → score += 1

utility(reader): Reader can change what a person can do on a commessa with «Accessi» («Accessi per commessa», «Applica a più commesse», «Salva»), and from the scheda can add a commessa («Aggiungi commessa»), «Disattiva persona» / «Riattiva persona», «Reimposta password», and read in «Storico» who changed accessi and profili and when → score += 1

utility(reader): Reader can limit a utente to certain lotti (Interventi › Lotti › «Edit» › utenti di competenza, or the «Lotti» of the scheda: «Tutti i lotti» / «Limitato») and applies the rule: no lotti = all lotti of the commessa; the first lotto restricts to that one only; removing the last opens everything again; deleting a lotto deletes its assignments without confirmation → score += 1

utility(reader): Reader can say which rows a profilo sees beyond its permessi (ambito dei dati): the «Operatore» dropdowns show operatori attivi and not nascosti; «Tecnico» sees only its own operatore; «Consultazione esterno» sees only its own utenze; «Call center», «Consultazione», «Consultazione esterno» and «Tecnico» see in the Verifica only interventi past a stato threshold — and that the same person can see different rows on two commesse → score += 1

utility(reader): Reader can run the ordered check «perché non vede…» — commessa aperta → menu della commessa → profilo e permessi effettivi (scheda della persona) → ambito (lotti, operatore attivo/nascosto, stato) → stato della persona (Invitato, Disattivato, Da collegare) — and knows which answers they fix themselves and which go to the staff tecnico (vedi il capitolo 12 for the Admin tools) → score += 1

utility(emotional): Reader feels safe giving access because the limits are written in the code: nobody can give more than they have («non oltre il proprio»), nobody can give a more privileged `tipo` than their own, the last active «Amministratore cliente» of an organizzazione cannot be removed, impersonation is reserved and recorded, and every change of accesso or profilo stays in the «Storico» → score += 1

utility(emotional): Reader knows where to stop and ask the staff tecnico: a wrong email on a pending invite, a «Da collegare» (Senza identità) row, a page missing from the commessa menu, anything in the Admin menu or in `json_admin.php`, a change to a profilo generale, a commessa or organizzazione outside their own, and the question «quando si accendono i controlli dei profili per la mia organizzazione» → score += 1

utility(factual): The chapter states, each with its source: the eight profiles, their labels, descriptions and `tipo` (`lib/ProfiliPiattaforma.php` PROFILI, TIPO_LEGACY); invite validity 72 ore (`lib/TokenUtente.php`, 259200 s; `wiki/assistenza-clienti/reinvia-invito-utente.md`); `rbac_enforce` false for every organization on 25 novembre 2026 (`config.inc.php` `$ORGANIZZAZIONI`) and `can()` not blocking while it is off (`lib/Rbac.php`, `lib/can.php`; `docs/03-cookbooks/30-rapporto-negazioni-rbac.md`); the ambito table (`lib/AmbitoDati.php`; `docs/03-cookbooks/31-ambito-dati-rbac.md`); the operatori rule (`lib/User.php::getOperatori()`); the impersonation refusals verbatim (`lib/Impersonazione.php` MSG_*); «Accessi alle commesse» removed from the menu on 20 novembre 2026 (GOP-847) → score += 1
```

---

## BEAT LIST

Six sections (`##` in the final chapter). Each needs: italic audience line at the top when not for everyone (STYLE_BIBLE § Voice rule 6), at least one exact concrete detail, at least one **Limite** paragraph, max 5 prose paragraphs in a row without a table/list/box/subheading, 600–1.200 words.

Before § 1 the Writer puts the mandatory `*In questo capitolo…*` paragraph (2–3 sentences: the four layers that decide what a person sees; how an amministratore invites, assigns profili and lotti; where the amministratore's power ends and the staff tecnico's begins; for amministratori and staff tecnico, with boxes for developers).

---

### § 1 — `## Persona, accesso, commessa: chi entra in GOPlanner`
**Tag:** [TUTTI] (one `> **Per gli sviluppatori:**` box)
**Core question:** What does GOPlanner know about a person who logs in, and why can the same person be an amministratore on one commessa and read-only on another?
**Word target:** 850 (range 800–1.000)
**Paragraph functions:** Aggancio (the opening case, see TARGET) → Spiegazione (three levels) → Dimostrazione (Elenco utenti columns) → contro-obiezione → Limite → Sintesi.

**Content plan**
- The opening case (invented, said once as invented without quoting the style rule — the ch.6 review flagged «Un esempio inventato, dichiarato come tale» as a leaked instruction): a new back-office colleague's first morning; three things «missing», three different layers. End the hook by naming the four layers in order; the chapter follows them.
- Three levels, each in one or two sentences: **persona** (one identità, on the DB master, recognised by email); **accesso** (one per commessa: the person × commessa pair, with its own profilo and lotti); **organizzazione** (the company that groups commesse and people; an amministratore's power stops at its border). One sentence + «vedi il capitolo 2» for the DB master.
- How a person gets in: with password or with «Accedi con Google» (exact button label from `Smarty_templates/it/login_new.html`/`pages/login.php`; verify); the two ways coexist. Operatori use the app (pointer ch.8).
- Which commessa opens: no choice screen; the last commessa chosen is remembered (cookie, 30 giorni) if still accessible, otherwise the first accessible one; the commessa is changed from the selector at the top (exact label as in ch.2: «Cambia commessa»; verify). The landing page depends on the profilo.
- **Dimostrazione — bulleted list** of the Elenco utenti columns with one line each: «Nome», «Cognome», «Email», «Commessa e profilo» (current commessa + «+N», full list on hover), «Tipo di accesso» (Google, password, App), «Ultimo accesso» («Mai»), «Stato» with its four values. One line on «Senza identità» / «Da collegare»: older accesses not yet linked to a person; they stay tied to their one commessa.
- **Contro-obiezione 1:** «Lavoro su due commesse: devo avere due accessi diversi?» → One person, one entry; each commessa is a separate accesso with its own profilo and lotti, all visible in «Commessa e profilo». (Different angle from ch.2: there the question was about the selector; here it is about the profilo being per commessa. Keep it short and do not repeat ch.2's answer.)

**Limite (mandatory):** linking a «Da collegare» row to a person: only what the Researcher finds (expected: no page does it → staff tecnico). The person's email cannot be corrected from the Elenco (it can be corrected only with the assistenza GOPlanner, per the invite wiki). The «Elenco utenti» shows only the commesse the viewer administers: a colleague of another organizzazione is invisible by design.

**Sintesi:** «La persona è una; gli accessi sono uno per commessa, e ognuno ha il suo profilo.»

**DEV box (max 5 lines):** `identita` and `identita_users` on the DB master (N:N over `users`, one `users` row per tenant, `users.cliente`); organizzazione = `clienti.codice_org` (codes `sg`, `easy`, `ener`); login flow `LoginIdentita::avvia()` → `SessioneTenant::switchTenant()` (the only entry point to change tenant); `ElencoUtenti::STATO_*`; first-entry technical `users` row created on demand for an organization admin (`SessioneTenant::creaUtenteOnDemand()`).

**Key facts the Researcher must find**
- Exact login labels: Google button text, password field, password-recovery link if any (`Smarty_templates/it/login_new.html` vs `login.html`: which one is live).
- Cookie duration and fallback rule (`json.php` `set_cliente`, `LoginIdentita::avvia()`); landing per profilo (`default_page`, Clienti if `tipo < 4`, else Operatori: verify on `php8`).
- `ElencoUtenti::TIPI_ACCESSO` exact labels; how «App» is derived (commit 93add3320: from `users.GCMID`).
- Whether any page, button or JSON action links a legacy access to an identity (grep `identita_users` INSERT paths outside `InvitoUtente`; `docs/02-patterns/32-creazione-utenti-percorsi-e-metodo-canonico.md` § legacy paths). If none: `[UNVERIFIED: nessun percorso nell'interfaccia]` and [CONFLICT] with ch.2.
- Meaning of `operatori.id_user` (see Continuity flag).

---

### § 2 — `## Profili, task e permessi: che cosa può fare un utente`
**Tag:** [UFFICIO] for amministratori (italic line: *Per gli amministratori; il riquadro finale è per gli sviluppatori.*)
**Core question:** What is a profilo, which ones exist, how is one narrowed for a single organizzazione or commessa — and what actually blocks an action today?
**Word target:** 1.100 (range 900–1.200)
**Paragraph functions:** Aggancio → Spiegazione (three levels: permesso, task, profilo) → Dimostrazione (profile table) → Spiegazione (varianti, task aggiuntivi, profilo generale) → `###` subsection on today's enforcement → contro-obiezione → Limite → Sintesi.

**Content plan**
- One sentence on «ruolo» vs «profilo» (glossary trap 4).
- Three levels, bottom-up: **permesso** elementare (an action in an area, with a plain-language label, some marked «Sensibile» — e.g. the permesso to delete utenze, already named in ch.3); **task** (a named group of permessi, e.g. «Pianificare gli interventi» — exact label from `lib/CatalogoTask.php`); **profilo** (a fixed set of task). A person has **one profilo per commessa**.
- **Table** — one row per platform profile: label as shown | what it can do (from the description in `ProfiliPiattaforma::PROFILI`, rephrased in glossary words) | typical person. Eight rows: «Amministratore cliente», «Amministratore commessa», «Pianificatore», «Call center», «Consultazione», «Consultazione esterno» (utenti delle committenti), «Magazziniere» (only Magazzino, commesse with the magazzino v3; «vedi il capitolo 9»), «Tecnico» (only the app: the operatore). Add a column «Importare interventi» (sì/no) to keep ch.4's promise. Optional column `tipo` only if the Writer puts it in the DEV box instead (better: DEV box).
- **Varianti and task aggiuntivi:** page Utenti › «Profili e varianti» (buttons «Crea variante», «Modifica variante», «Elimina variante», «Confronta profili»): a variante is a profilo of the organizzazione built on a platform profile, adding or removing task; only the «Amministratore cliente» of that organizzazione (or the staff tecnico) creates it; a variante with holders can be narrowed or renamed at any time but widened only by the staff tecnico (to widen: a new variante). Task aggiuntivi valid on one commessa only. Exact labels verified in `js/code/profili.js`, `Smarty_templates/it/profili.html`.
- **Profilo generale (keeps ch.2's promise):** «Amministratore cliente» has one single definition valid on every commessa (GOP-626); a change by the staff tecnico applies everywhere at once. Real case (problem → cause → fix, no commessa name): copies of the administrator role per commessa had drifted, one commessa had two empty copies; fix: one global definition, copies refused (`RuoloService::ERRORE_COPIA_GENERALE`).
- **Two conditions for a menu item:** the commessa must have the page in its menu (configuration of the commessa, decided with the staff tecnico) **and** the profilo must have the permesso. A permesso cannot show a page the commessa does not have. One sentence + pointer to § 6.
- `### Oggi: che cosa blocca davvero` — short, calm, exact:
  - On 25 novembre 2026 the profile checks run **in sola registrazione** for every organizzazione: when a profilo lacks a permesso, GOPlanner records what it *would* have refused, and does not refuse.
  - What blocks today: the menu of the commessa; the older level (`tipo`) that the profilo writes on the accesso every time it is saved from «Accessi» (Amministratore cliente/commessa → 1, Pianificatore → 2, Call center → 3, Consultazione → 4, Magazziniere → 7, Consultazione esterno → 8, Tecnico → 9 — table in the DEV box, prose in words); the server rules of invites, profili, accessi and impersonation (§ 3, § 5), which never depend on the switch; `json_admin.php`, already closed to everyone except the staff tecnico.
  - Consequence for the amministratore: a variante has the same `tipo` as its base profile, so removing a task from a variante may not yet stop the action. The controls are switched on one organizzazione at a time, after a week of records without unexpected refusals (decision of the staff tecnico, not of the amministratore).
- **Contro-obiezione 2:** «Ho tolto un task dalla variante, ma il collega riesce ancora a farlo.» → Expected while the controls are in registrazione; what blocks is the `tipo` of the base profile; if the action must be stopped now, choose a lower base profile or ask the staff tecnico.

**Limite (mandatory):** the catalogue has known gaps (no separate permesso to create or remove telefoni, to create a commessa, to disattivare utenti — from pattern 25 «Lacune del catalogo»: verify still true); some menus still follow `tipo` only (per-commessa menus for `tipo` 5/6/8); the «Profili e varianti» voice appears only to who may see profili; «Task e operazioni» has no page yet.

**Sintesi:** «Il profilo dice che cosa una persona può fare su una commessa; oggi lo fa valere attraverso il livello che scrive quando viene salvato.»

**DEV box (max 6 lines):** `can('area.azione')` (`lib/can.php`) → `Rbac::gate()`: with `rbac_enforce` off returns `$consentito || !$enforceAttivo` (always true) and queues an `rbac_deny` event; `can_tipo()` / `can_legacy()` return the legacy result while off; switch per organization in `config.inc.php` `$ORGANIZZAZIONI`; catalogue `lib/CatalogoPermessi.php`, `lib/CatalogoTask.php`, `lib/ProfiliPiattaforma.php`; effective permissions `AccessoCommessa::permessiEffettivi()`; the deny report is a staff tool («vedi il capitolo 12»).

**Key facts the Researcher must find**
- `lib/ProfiliPiattaforma.php` full PROFILI (labels, descriptions, task) and TIPO_LEGACY — eight profiles (pattern 25 says seven: [CONFLICT], code wins; Magazziniere from GOP-855).
- `lib/CatalogoTask.php` task labels (at least the one that contains `interventi.importare`, to support ch.4's «Importare interventi»); `lib/CatalogoPermessi.php` labels and which are `sensibile`.
- `AccessoCommessa::assegna()`: confirm it rewrites `users.tipo` on every save (pattern 25) vs the docblock in `ProfiliPiattaforma` «Non ancora applicata: la userà GOP-573» ([CONFLICT], code wins).
- `lib/Rbac.php` `gate()`, `gateConTipo()`, `enforceAttivo()`; `config.inc.php` `$ORGANIZZAZIONI` values on `php8` at the date of research.
- Which visible menu gates use `can()` vs `can_tipo()` (grep `can(` and `can_tipo(` in `lib/Menu*.php`, `lib/AdminAreaUtenti.php`, `index.php`): at least File (ch.4), Clienti (ch.3), Interventi › Lotti, Utenti, Impostazioni. This decides how the Writer phrases «che cosa blocca davvero».
- `pages/profili.php`, `js/code/profili.js`, `lib/VariantiProfilo.php`, `lib/GestioneProfili.php`: exact labels, who sees the page, widening rule.
- Whether the legacy page `index.php?page=ruoli` is still reachable/linked (pattern 25 mentions a «Ruoli» voice; `AdminAreaUtenti::voci()` shows only «Elenco utenti» and «Profili e varianti»).

---

### § 3 — `## Invitare una persona e darle gli accessi`
**Tag:** [UFFICIO] for amministratori (italic line: *Per gli amministratori e per chi ha il permesso di gestire gli utenti.*)
**Core question:** How does a new person get into GOPlanner, and how does an amministratore change, extend or close their accesses?
**Word target:** 1.100 (range 950–1.200)
**Paragraph functions:** Aggancio → Procedura (invite) → Spiegazione (what the invite creates; second commessa) → Procedura (Accessi, scheda) → Dimostrazione (real case: the ceiling) → contro-obiezione → Limite → Sintesi.

**Content plan**
- Where: menu «Utenti» (or «Admin» for the staff tecnico — the title of the menu changes: verify `AdminAreaUtenti::titoloAdmin()`) › «Elenco utenti». The voice «Accessi alle commesse» was removed on 20 novembre 2026 (GOP-847): accesses are given with the «Accessi» button and from the scheda.
- `### Invitare` — numbered procedure: 1. «Elenco utenti» › «Invita utente»; 2. fill the form (exact fields from `Smarty_templates/it/crea_invito.html`: email, nome, cognome, commessa, profilo — verify); 3. send; 4. the person receives an email with a link valid **72 ore**; 5. the invite appears in «Inviti inviati» until accepted. If the email fails, the page says the invite was created but the email did not leave: the invite stays and can be resent.
- «Reinvia invito»: new link, new 72-hour window; the previous link stops working; nothing else changes; no confirmation message (page reloads). Who sees which pending invites (staff tecnico all; Amministratore cliente its organizzazione; amministratore of a commessa the invites on that commessa; others an empty list).
- Second commessa: inviting the email of a person who already exists **adds** the commessa to the same person (no duplicate); if the person is already active, no email leaves and the new commessa appears in the selector at the next login. Refusals, in words: same commessa again; a commessa of another organizzazione (the message does not say which); a disattivata person; an older access with that email not linked to a person (→ staff tecnico). Exact error texts from `InvitoUtente` constants.
- `### Cambiare gli accessi` — numbered procedure: select the row → «Accessi» → window «Accessi per commessa» (one line per commessa: «Accesso alla commessa», profilo) → «Applica a più commesse» if needed → «Salva». Saving rewrites the person's level on that commessa (link to § 2). «Assegna in blocco» is not available yet: one person at a time.
- `### La scheda della persona` — opened from name/surname or «Scheda»: commesse and profili, «Aggiungi commessa», «Lotti» (link to § 4), effective permissions (GOP-668: verify label), «Disattiva persona» / «Riattiva persona», «Reimposta password» («Invia mail»: verify flow), «Storico» («Storico delle modifiche»: who changed accessi and profili, when).
- **Real case (box or short paragraph, problem → cause → fix, no personal data):** before the ceiling rule, a person with read-only rights could invite themselves as amministratore on every active commessa of their organizzazione; the fix: the invite trusts no page gate, checks on the server that the inviter has the permesso to manage utenti on *that* commessa and grants only profili whose permessi they have, never a more privileged level (`ERRORE_RUOLI_OLTRE_I_PROPRI`). Source: pattern 25 «Chi può invitare, e con quali ruoli».
- The ceiling «non oltre il proprio» stated as a rule in one bulleted list: cannot give permessi you do not have; cannot give a more privileged level than yours; cannot touch a person with a more privileged level; «Amministratore cliente» and staff tecnico have no ceiling within their scope.
- **Contro-obiezione 3:** «L'invito è scaduto / la mail non è arrivata.» → spam folder, check the address in «Inviti inviati», «Reinvia invito»; a wrong address is not fixed by resending.

**Limite (mandatory):** the email address of a pending invite cannot be changed from the page → assistenza GOPlanner; «Assegna in blocco» not available; the matrix utenti × commesse does not exist yet (GOP-669); older ways of creating accesses still exist in the code (five legacy paths) and produce accesses without a person («Da collegare»): the canonical way is the invite.

**Sintesi:** «Una persona entra con un invito; le commesse e i profili si cambiano da «Accessi»; nessuno può dare più di quanto ha.»

**DEV box (max 4 lines):** `InvitoUtente::crea()` is the canonical creation path (transactional, RBAC); `InvitoUtente::reinvia()`, `invitiVisibili()`, `tenantInvitabili()`; token lifetime `TokenUtente` SCOPO_INVITO 259200 s; scope check `AssegnazioneRuoliUtenteService::ruoliAssegnabiliPerTenant()`; never insert directly into `goplanner.users` (accesses without identity are invisible to RBAC: «vedi il capitolo 2»).

**Key facts the Researcher must find**
- Exact labels of the invite form and of the success/failure messages (`Smarty_templates/it/crea_invito.html`, `pages/utenti.php` `crea_invito`, `lib/dict/lang_it.php`).
- `InvitoUtente` error constants and their user-visible texts (`ERRORE_RUOLI_OLTRE_I_PROPRI`, `ERRORE_RUOLI_FUORI_SCOPE`, other organization, disattivata, legacy email).
- Labels of the «Accessi» window (`js/code/utenti_accessi.js`) and of the scheda (`js/code/utenti_scheda.js`, `Smarty_templates/it/utenti_scheda.html`): «Aggiungi commessa», «Disattiva persona», «Riattiva persona», «Reimposta password», «Invia mail», «Lotti», «Tutti i lotti», «Limitato», «Sensibile», effective permissions section title.
- What «Disattiva persona» does (all commesse? only those in scope? GOP-668 commit 5e216afb9 «Disattiva rispetta il tetto»); what «Reimposta password» sends.
- «Storico»: table and what it records (`accesso_log`? grep), who sees it.
- Who sees «Invita utente» (`AdminAreaUtenti::puoVedereUtenti()` = `can_tipo('utenti.vedere', 4) && Rbac::can('canViewUtenti')`: confirm meaning in words).

---

### § 4 — `## Lotti di competenza e ambito dei dati: quali righe vede un utente`
**Tag:** [UFFICIO] (one DEV box)
**Core question:** Two people with the same profilo on the same commessa see different liste, operatori or interventi: which rules decide the rows?
**Word target:** 950 (range 850–1.100)
**Paragraph functions:** Aggancio (permesso = what you can do; ambito = which rows) → Procedura (assign lotti) → Spiegazione (the rule and its two edges) → Dimostrazione (ambito table) → contro-obiezione → Limite → Sintesi.

**Content plan**
- One-sentence distinction: the permesso says which actions; the ambito dei dati says which rows. Lotto as object: one sentence + «vedi il capitolo 3».
- `### Limitare un utente a certi lotti` — two ways, both numbered:
  - From Interventi › Lotti: select the lotto → «Edit» → section utenti di competenza → choose the utente → «Aggiungi»; remove with the link next to the name.
  - From the scheda of the person: «Lotti» → «Tutti i lotti» or «Limitato» with the chosen lotti (verify labels and flow in `js/code/utenti_scheda.js`).
- The rule, as a three-line bulleted list (exact UI message «Gli utenti senza lotti assegnati vedono tutti i lotti della commessa», already quoted in ch.2 — quote it, don't re-explain): no lotti → all; the first lotto → only that one; removing the last → all again. The page asks confirmation in the two edge cases. You can assign only lotti you see yourself, and only with the permesso to assign profili.
- Where the lotti filter applies: the lists and dropdowns built on carichi (liste in Interventi, the liste dropdown — one sentence + «vedi il capitolo 3» for the dropdown and its cache). Verify the list of pages that apply `carichi.lotto IN (...)`.
- **Ambito table** (from `lib/AmbitoDati.php`, translated into office words; profile labels in «…»): rows = «Consultazione esterno» (only its own utenze; no operatori dropdown), «Tecnico» (only its own operatore), «Call center» / «Consultazione» / «Consultazione esterno» / «Tecnico» in Verifica (only interventi beyond Assegnato), «Consultazione esterno» / «Tecnico» on foto (only interventi beyond Non fattibile — confirm the meaning of `stato_id > 5` with ch.6's stato table and state it in stato names, not only numbers). Note that one commessa-specific Verifica threshold exists (state it as «una commessa», no tenant code in UFFICIO text).
- **Operatori visibili (keeps ch.5's promise):** the «Operatore» dropdowns show operatori **attivi** and **not nascosti**; the «Tecnico» profile sees only its own operatore; the staff tecnico sees all. Where to change «attivo» / «nascosto»: Operatori page (pointer ch.8 for the scheda operatore).
- One sentence keeping ch.4's promise: who sees the name of who imported a lista (exact rule from code).
- **Contro-obiezione 4:** «Ho dato al collega il lotto Nord e adesso non vede più le liste di prima.» → That is the rule: the first lotto restricts; add the other lotti or remove the last to open everything.

**Limite (mandatory):** deleting a lotto deletes its assignments, without confirmation and without undo → disattivare instead; older lotti configured in the commessa files (per-login lists) still apply to accesses without a person or without lotti saved on the DB master (fallback); while the controls are in registrazione the ambito still follows the older level (`tipo`), so a person whose level was never re-saved from «Accessi» keeps the old behaviour; lotti do not limit what Gea can read beyond what the user can see (verify, or drop).

**Sintesi:** «Il permesso dice che cosa puoi fare; i lotti e l'ambito dicono su quali righe. Il primo lotto restringe, l'ultimo tolto riapre tutto.»

**DEV box (max 5 lines):** `identita_users.lotti` (CSV of `carichi.lotto` values, on the DB master) takes precedence over `$custom['users'][login]['lotti']`; `User::getLotti()` (empty = no limit); `lib/LottiCompetenza.php`; `ambito_dati()` / `Rbac::ambito()` with `AmbitoDati::daTipo()` while enforcement is off; event `rbac_ambito_divergenza` («vedi il capitolo 12»).

**Key facts the Researcher must find**
- `lib/AmbitoDati.php` `PER_PROFILO` and thresholds; translate `stato_id > 3` and `> 5` into stato names using ch.6's codes (3 Assegnato, 5 Non fattibile).
- `lib/User.php::getOperatori()` and `JSONController::operatori_select()` / `json.php` `operatore_select`: the exact visibility rule (attivo=1, nascosto=0; Tecnico `id_user`; super-admin all).
- `lib/LottiCompetenza.php`: confirmation texts for first/last lotto; who may assign.
- Scheda «Lotti» flow and labels.
- Pages/queries applying the lotti filter (`git grep -n "getLotti()" -- lib pages`).
- The import-registry user-name rule (`lib/ImportazioneRegistro.php` or its page: grep `tipo`, `admin`, `can(`).

---

### § 5 — `## Amministratori e staff tecnico: dove finisce il potere di ciascuno`
**Tag:** [STAFF] + amministratori (italic line: *Per gli amministratori e lo staff tecnico.*)
**Core question:** What can an «Amministratore commessa», an «Amministratore cliente» and the staff tecnico each do, and what can none of them do alone?
**Word target:** 900 (range 800–1.100)
**Paragraph functions:** Aggancio → Dimostrazione (three-column table) → Spiegazione (impersonation) → Spiegazione (guards) → Limite → riquadro «Quando chiedere allo staff tecnico».

**Content plan**
- **Table** — rows = actions; columns = «Amministratore commessa» | «Amministratore cliente» | staff tecnico. Rows (only those the dossier confirms): invite and manage persone on the commessa; assign profili (with/without ceiling); nominate another «Amministratore cliente»; create/modify varianti; modify a profilo generale; «Impersona» (accedere come un'altra persona); see all commesse of the organizzazione; open Admin menu pages; use `json_admin.php` maintenance actions; change the menu of a commessa; switch on the controls for an organizzazione.
- **Impersonation** («Impersona», label to verify in `js/code/utenti_elenco.js`): reserved to the staff tecnico and to «Amministratori cliente»; the five refusals verbatim, as a bulleted list: «L'accesso come un'altra persona è riservato agli Amministratori cliente.»; «Non è possibile accedere come un super-admin.» (quote as UI text even though «super-admin» is a code word — it is a label); «Puoi accedere solo come persone i cui accessi sono tutti nella tua organizzazione.»; «Stai già operando con il tuo accesso.»; «Stai già operando come un'altra persona: torna prima al tuo accesso.». While impersonating, GOPlanner applies the other person's commesse and permessi, not yours; start and end are recorded with both identities. How to return to one's own access (exact label: Researcher).
- **Guards**, each in one sentence: the last active «Amministratore cliente» of an organizzazione cannot be removed or disattivato (GOP-597: exact message); an «Amministratore commessa» has no profili management and no impersonation; profili are created and changed only by the «Amministratore cliente» of the same organizzazione or by the staff tecnico (GOP-330) — because whoever holds a profile could otherwise rewrite it and grant it to themselves.
- Admin menu: reserved to the staff tecnico; the voices of the «Utenti» group are the only ones an amministratore may see (one sentence + «vedi il capitolo 12» for the other voices). `json_admin.php` answers «User not allowed» to anyone else, and no profilo unlocks it (consistent with ch.2: quote the same message, do not re-explain).
- Real case (problem → cause → fix): an «Amministratore cliente» whose access on one commessa was older than the organization flag landed as operatore on that commessa; fix: the organization flag sets the administrator level in the four places that resolve the person (pattern 25 «`tipo`/`admin` in sessione seguono il tenant di destinazione»). No names.
- `> **Quando chiedere allo staff tecnico:**` box (collects NUF emotional 2): wrong email on an invite; «Da collegare» rows; page missing from the commessa menu; widening a variante that has holders; profilo generale; another organizzazione; Admin tools and `json_admin.php`; switching on the controls.

**Limite (mandatory):** the staff tecnico is outside the profile model (a code exception, not a profilo): it cannot be described with the profile table; per-commessa menus for older levels (5, 6, 8) are commessa configuration; impersonation is not linked from any menu for the staff tecnico's legacy screen (DEV detail — keep out of UFFICIO text unless needed).

**DEV box (max 4 lines):** super-admin globale = `users.id = 1`, `tipo` 0, outside `ruoli_permessi`, bypass in `Rbac::valuta()`; `identita.admin_org = 1` implies `tipo = 1` (never 0); `AdminRequestGuard::denyUnlessCanUseJsonAdmin()` (`tipo === 0` or global super-admin, else 403 JSON); `RuoloService::puoModificare()` / `puoCreare()`; `Impersonazione::puoImpersonare()`, events `impersonation_start` / `impersonation_end`.

**Key facts the Researcher must find**
- `lib/Impersonazione.php` MSG_* (verbatim) and the return-to-own-access label/path; who sees «Impersona» in the Elenco.
- GOP-597 guard: exact message and where it fires (`git grep -n "ultimo" -- lib/AccessoCommessa.php lib/*Amministrator*`; commit 3ebfb0fd1).
- `lib/MenuAdmin.php`, `lib/AdminAreaUtenti.php::titoloAdmin()`: what an amministratore of a committente sees as the menu title («Utenti» vs «Admin»); wiki says the Admin menu is reserved to staff while the Utenti voices are visible to clients with the permesso ([CONFLICT] to resolve in words).
- `AdminRequestGuard` message text and code (403 + «User not allowed»: same as ch.2).
- Confirm which actions in the table each tier can do, from `ProfiliPiattaforma` task lists (`profili_gestisci`, `utenti_impersona`, `accessi_assegna`) and service rules.

---

### § 6 — `## Quando un utente non vede qualcosa: le quattro domande`
**Tag:** [UFFICIO] (one DEV box)
**Core question:** A colleague says «non vedo il menu / la lista / l'operatore / l'intervento»: in which order does the amministratore check, and where does the check stop and become the staff tecnico's?
**Word target:** 950 (range 850–1.100)
**Paragraph functions:** Aggancio → Procedura (ordered checklist) → Dimostrazione (symptom table) → contro-obiezione → Limite → Sintesi.

**Content plan**
- Rule first: the four layers are checked in order because each hides everything below it; the first «no» is the cause.
- **Numbered checklist**, one action per step, with where to look:
  1. **La commessa.** Is the colleague on the commessa they think? (selector at the top; «Commessa e profilo» in the Elenco).
  2. **Il menu della commessa.** Does this commessa have the page at all? Compare with a colleague who has more rights on the same commessa; if nobody sees it, it is configuration → staff tecnico.
  3. **Il profilo.** Which profilo does the person have on this commessa, and does it include the permesso? (scheda della persona, effective permissions; «Profili e varianti» › «Confronta profili»). Remember § 2: today the block comes from the level written on save — if the profilo was changed, re-save it from «Accessi».
  4. **L'ambito.** Lotti di competenza (scheda «Lotti»), operatore attivo/nascosto, stato threshold of the profilo (§ 4).
  - Before all four: **la persona** — «Stato» in the Elenco: Invitato (has not accepted: «Reinvia invito»), Disattivato («Riattiva persona»), Da collegare (staff tecnico).
- **Symptom table** (Sintomo | Prima domanda | Dove si guarda | Chi interviene), 6–7 rows, e.g.: menu «Utenti» missing; a lista missing from Interventi (lotti → ch.3 for the dropdown and cache); an operatore missing from the dropdown (attivo/nascosto); the Verifica empty for a «Consultazione» user (stato threshold); a colleague invisible in the Elenco (other organizzazione or commessa you do not administer); «Invita utente» missing (permesso to manage utenti); a whole page missing on one commessa (menu of the commessa → staff tecnico). Rows must not duplicate ch.2's diagnosis table: here every row ends at a person-level cause.
- Gea: one sentence — Gea can explain why a lista is missing from the dropdown and check an operatore's visibility, and it answers with the permessi of who asks (pointer ch.10).
- **Contro-obiezione 5:** «Al collega ho dato lo stesso profilo che ho io, ma vede meno cose.» → Same profilo, different ambito (lotti) or different commessa; profilo and lotti are per commessa.
- Hand-off: the Admin pages, the error logs and the record of refused permessi are staff tools: «vedi il capitolo 12».

**Limite (mandatory):** the amministratore sees only the commesse they administer, so the check stops at their organizzazione's border; the record of what the controls would have refused is not visible to the amministratore; a cache can delay a lista reappearing after a lotto change (one sentence, ch.3).

**Sintesi = chapter closing (see TARGET).** No separate `##` for the closing; last paragraph of § 6, then `## Fonti`.

**DEV box (max 4 lines):** effective permissions computed by `AccessoCommessa::permessiEffettivi()` / `Identita::getPermessi()`; perimetro of the Elenco `ElencoUtenti::commesseInAmbito()`; refused checks logged as `rbac_deny` with `esito: loggato` (report `scripts/rbac_report_negazioni.php`, classes `sospetto` / `da_verificare` / `atteso` / `gia_applicato`) — «vedi il capitolo 12»; `docs/03-cookbooks/28-tendina-liste-perche-una-lista-non-compare.md` for the dropdown rule.

**Key facts the Researcher must find**
- Effective-permissions section of the scheda (GOP-668 commit c5d4cccae «scheda utente con accessi alle commesse e permessi effettivi»): title and what it lists.
- «Confronta profili» behaviour (`js/code/profili.js`).
- The Gea tools for the dropdown and for operatore visibility: names as shown to the user (wiki `diagnostica-visibilita-operatore.md`, cookbook 28) — one sentence only.
- Which commessa-level menu switch hides a page (`$MENU` / `$custom['menu']` in `custom/{tenant}/config.inc.php`): enough to say «configurazione della commessa», no tenant codes.

---

### `## Fonti`
Built by the Writer from the dossier entries actually used, in the STYLE_BIBLE format (`codice: …`, `wiki: …`, `docs: …`, `Portolano: …`, `Jira: GOP-NNN — titolo breve`). Every Jira key with its short title (the ch.6 review flagged bare keys).

---

## REVIEWER READINESS NOTES

### Tension points (where the chapter must create real stakes)
1. **Profiles that do not block yet (§ 2, § 6).** Stakes: an amministratore narrows a variante, believes an action is now forbidden, and a colleague keeps doing it; or diagnoses «missing permesso» when the real block is the level written on save. Build-up: the three levels → the profile table → «Oggi: che cosa blocca davvero» → the counter-objection. The tension resolves into a rule (choose the base profilo for what must be blocked now; re-save from «Accessi»), not into distrust of the system.
2. **The first and the last lotto (§ 4).** Stakes: one click on a «small» restriction makes every other lista disappear for a colleague; removing the last lotto silently opens the whole commessa; deleting a lotto drops all its assignments with no confirmation. Resolution: the edge rule stated as three lines, confirmations on first/last, «disattiva invece di elimina».
3. **The ceiling and the escalation story (§ 3, § 5).** Stakes: without the server rule a read-only person could make themselves amministratore; without the last-administrator guard an organizzazione could lock itself out. The real case shows the hole and the fix; the reader leaves trusting the limits because they know them.
4. **Impersonation (§ 5).** Stakes: acting as another person is the most powerful action an amministratore has; the chapter shows who may, the exact refusals, and that start and end are recorded.
5. **Invites that expire (§ 3).** Low stakes, high frequency: a new colleague cannot start on Monday because the link sent on Thursday expired. Resolution: 72 ore, «Reinvia invito».

### Key chains to make explicit (cause → consequence → reader action)
- Person has accesses on two commesse → profilo and lotti are per commessa → check «Commessa e profilo» before changing anything.
- Profilo saved from «Accessi» → level (`tipo`) rewritten on that commessa → today that level is what blocks → to change what blocks, change the profilo (or its base), not only a task of the variante.
- Controls in sola registrazione → refused actions are recorded, not refused → the staff tecnico reads the record and switches on one organizzazione at a time → the amministratore asks the staff before relying on a variante's narrowing.
- First lotto assigned → only that lotto visible → other liste disappear → add the lotti needed or remove the last to open all.
- Lotto deleted → its assignments deleted, no confirmation → disattivare instead.
- Operatore not attivo or nascosto → missing from the «Operatore» dropdowns → reactivate/unhide it (ch.8) before suspecting a permesso.
- Invite older than 72 ore → link dead → «Reinvia invito» (new link; the old one stops working).
- Profilo generale changed by the staff → valid on every commessa at once → ask the staff for a narrower variante instead of a copy.
- «Da collegare» row → no person behind it → no second commessa, no profilo from «Accessi» → staff tecnico links it (if the Researcher confirms).

### Risk proportionality guards (each risk paired with its balancing context)
- **«Profiles don't block yet»** → balance in the same paragraph: the older level still blocks, and it is written by the profilo on every save; the menu of the commessa blocks; invites, profili, accessi, impersonation and `json_admin.php` are enforced on the server regardless of the switch; the record lets the staff find wrong profili before switching on. Never write «oggi tutti possono fare tutto».
- **Lotto deletion without confirmation** → balance: «Attivo» exists for exactly this; the first/last lotto changes ask confirmation; the lotto of past carichi is a number that stays on the carichi.
- **Impersonation** → balance: reserved to staff and «Amministratori cliente», never as a super-admin, only within the organizzazione, never nested, start/end recorded with both identities.
- **Escalation story** → balance: it is fixed, with the rule that replaced it; say when if the dossier has the date, otherwise «prima di questa regola».
- **Last-administrator lockout** → balance: the guard exists (GOP-597).
- **Older accesses «Da collegare»** → balance: they keep working on their commessa; what they lack is the multi-commessa features, not access.
- **Consultazione esterno sees committente data** → balance: only its own utenze and stati beyond the threshold; no operatori dropdown.

### Counter-objections planned (STYLE_BIBLE requires ≥ 2; five are planned)
1. § 1 — «Lavoro su due commesse: devo avere due accessi diversi?»
2. § 2 — «Ho tolto un task dalla variante, ma il collega riesce ancora a farlo.»
3. § 3 — «L'invito è scaduto / la mail non è arrivata.»
4. § 4 — «Ho dato al collega il lotto Nord e adesso non vede più le liste di prima.»
5. § 6 — «Al collega ho dato lo stesso profilo che ho io, ma vede meno cose.»

### Litmus test for this chapter
A new amministratore, with only this chapter, can: invite a new Pianificatore limited to two lotti on one commessa and give them read-only access on a second; tell a colleague why an operatore is missing from their dropdown; explain why removing a task from a variante did not stop the action yet; and know, before calling, that a wrong email on a pending invite or a «Da collegare» row is the staff tecnico's job.

---

## RESEARCHER BRIEF

**Web search terms:** none. INSTRUCTION.md § Researcher, SOURCE OVERRIDE: the web is not a source for this book. Use only the sources below, in priority order. The GOPlanner repository (`/home/alan/firstmate/projects/GOPlanner`, branch `php8`) is READ ONLY: Read/Grep/`git grep`/`git log`/`git show` only; no checkout, pull, stash, composer, npm.

### Documents to prioritize (in order)
1. Code on `php8` (authority when sources disagree). Many docs below describe intermediate states of the epic GOP-570; the code decides.
2. `docs/02-patterns/25-identita-centralizzata-e-rbac.md` (main decision record; long: read §§ «Conseguenze», «Catalogo dei permessi», «Task e profili», «Schema di varianti e accessi», «Chiarimenti confermati»), `docs/03-cookbooks/31-ambito-dati-rbac.md`, `docs/03-cookbooks/30-rapporto-negazioni-rbac.md`, `docs/02-patterns/42-profili-generali-unica-definizione.md`, `docs/02-patterns/32-creazione-utenti-percorsi-e-metodo-canonico.md`, `docs/02-patterns/35-lotti-entita-e-etichette-legacy.md`.
3. Wiki articles under `wiki/assistenza-clienti/` dated 2026-11-16 or later (listed below); `diagnostica-visibilita-operatore.md` (2026-08-14) is older: use only for the operatore visibility signals.
4. `changeset/2026-11-20-gop-847-accessi-voce-menu.md` and git log of GOP-574..GOP-597, GOP-664..GOP-669.
5. Portolano, then Jira.
6. `docs/01-foundations/06-user-profiles-and-permissions.md` describes the **legacy** `tipo` model: use only for the legacy level table and the lotti fallback; contains personal data in an example — do not copy.

### Wiki paths
- `wiki/assistenza-clienti/pagina-utenti-elenco.md`
- `wiki/assistenza-clienti/reinvia-invito-utente.md`
- `wiki/assistenza-clienti/pagina-lotti.md`
- `wiki/assistenza-clienti/pagina-admin-menu.md`
- `wiki/assistenza-clienti/diagnostica-visibilita-operatore.md`
- `wiki/assistenza-clienti/pagina-interventi-menu.md` (only for who sees «Lotti» and «Carichi»)
- `wiki/assistenza-clienti/magazziniere-postazione-lettore.md` (profilo «Magazziniere»: one row only)
- `wiki/assistenza-clienti/runbook-attivita-utente.md` (only: Gea names colleagues as «un collega»)
- `wiki/identita-rbac/creazione-utenti.md` (pointer to pattern 32)

### Docs paths
- `docs/02-patterns/25-identita-centralizzata-e-rbac.md`
- `docs/02-patterns/32-creazione-utenti-percorsi-e-metodo-canonico.md`
- `docs/02-patterns/35-lotti-entita-e-etichette-legacy.md`
- `docs/02-patterns/42-profili-generali-unica-definizione.md`
- `docs/02-patterns/15-web-auth-acl-pattern.md`, `docs/02-patterns/19-web-authentication-acl.md` (only for the DEV box; check they are not stale)
- `docs/03-cookbooks/31-ambito-dati-rbac.md`, `docs/03-cookbooks/30-rapporto-negazioni-rbac.md`, `docs/03-cookbooks/17-censimento-permessi.md` (DEV box only), `docs/03-cookbooks/28-tendina-liste-perche-una-lista-non-compare.md` (one sentence)
- `docs/03-cookbooks/04-create-new-user.md` (check whether it still shows direct inserts: [CONFLICT] with pattern 32, as ch.2 found for the first amministratore)
- `docs/plan_identita_centralizzata_rbac.md` (history; code wins)
- `docs/01-foundations/06-user-profiles-and-permissions.md` (legacy only; security warning above)
- **Do not open:** `docs/03-cookbooks/06-credenziali-e-login.md`, `docs/03-cookbooks/18-testing-headless-master.md` beyond confirming they exist.

### Code paths and grep patterns (read-only)
- Identity and session: `lib/Identita.php`, `lib/IdentitaSessione.php`, `lib/LoginIdentita.php` (`avvia`), `lib/SessioneTenant.php` (`switchTenant`, `creaUtenteOnDemand`), `lib/GoogleSsoLogin.php`, `pages/login.php`, `Smarty_templates/it/login_new.html`, `json.php` (`set_cliente`), `lib/Organizzazione.php`, `config.inc.php` (`$ORGANIZZAZIONI`, codes only).
- Profiles and permissions: `lib/ProfiliPiattaforma.php` (PROFILI, TIPO_LEGACY), `lib/CatalogoTask.php`, `lib/CatalogoPermessi.php` (labels, `sensibile`), `lib/AccessoCommessa.php` (`assegna`, `permessiEffettivi`, ceiling), `lib/VariantiProfilo.php`, `lib/GestioneProfili.php`, `lib/RuoliGenerali.php`, `lib/RuoloService.php` (`puoModificare`, `puoCreare`, `ERRORE_COPIA_GENERALE`), `lib/AssegnazioneRuoliUtenteService.php`, `pages/profili.php`, `Smarty_templates/it/profili.html`, `js/code/profili.js`.
- Gates: `lib/can.php` (`can`, `can_tipo`, `can_legacy`, `ambito_dati`), `lib/Rbac.php` (`gate`, `gateConTipo`, `ambito`, `enforceAttivo`, `valuta`), `lib/AmbitoDati.php` (`PER_PROFILO`, `daTipo`), `lib/AdminRequestGuard.php`.
  - `git grep -n "can_tipo(\|can(" -- 'lib/Menu*.php' lib/AdminAreaUtenti.php index.php` (which menus block today).
  - `git grep -n "Non hai il permesso di modificare gli interventi"` and `git grep -n "verifica_salva\|verificaImpostaStato" -- lib/JSONController.php lib/VerificaInterventi.php` (continuity check for ch.6).
- Users pages: `pages/utenti.php` (`elenco`, `scheda`, `crea_invito`, `reinvia_invito`, `ruoli`), `lib/ElencoUtenti.php` (STATI, TIPI_ACCESSO, `commesseInAmbito`), `lib/AdminAreaUtenti.php` (`voci`, `titoloAdmin`, `puoVedereUtenti`), `lib/MenuAdmin.php`, `Smarty_templates/it/utenti_elenco.html`, `utenti_scheda.html`, `crea_invito.html`, `js/code/utenti_elenco.js`, `utenti_scheda.js`, `utenti_accessi.js`, `utenti_comune.js`.
- Invites: `lib/InvitoUtente.php` (`crea`, `reinvia`, `invitiVisibili`, `tenantInvitabili`, `aggiungiTenantAIdentita`, `ERRORE_*`, `PERMESSI_AMMINISTRATIVI`), `lib/TokenUtente.php` (SCOPO_INVITO).
- Impersonation: `lib/Impersonazione.php` (MSG_*, `puoImpersonare`, `verifica`), `JSONController::impersona_utente()`.
- Lotti and ambito: `lib/User.php` (`getOperatori`, `getLotti`, TIPO_*), `lib/LottiCompetenza.php`, `lib/LottoService.php`, `pages/lotti.php`, `Smarty_templates/it/lotti.html`; `git grep -n "getLotti()" -- lib pages`; `git grep -n "operatori_select\|operatore_select" -- lib/JSONController.php json.php`.
- Guards and history: `git show 3ebfb0fd1 --stat` (GOP-597 last Amministratore cliente), `git show c5d4cccae --stat` (GOP-668 scheda, permessi effettivi), `git show 5e216afb9 --stat` (Disattiva and ceiling), `git show 24cf111af` (GOP-847); `git grep -n "accesso_log" -- lib` (Storico).
- Legacy linking: `git grep -n "INSERT INTO identita_users\|identita_users.*insert" -- lib scripts` (is there any path, UI or script, that links a «Da collegare» access?).
- Import registry name rule (ch.4 promise): `git grep -n "tipo\|can(" -- lib/ImportazioneRegistro.php` and the page that shows it.
- Strings: `lib/dict/lang_it.php` grep `lotti assegnati`, `invito`, `Accesso negato`, `permesso`, `organizzazione`.

### Portolano queries (`mcp__rag_qdrant_server__query_rag_hybrid` with `user_roles: ""` — the EMPTY string, per INSTRUCTION.md; `user_roles: "goplanner"` filters everything out. Fall back to `query_rag`.)
- «identità centralizzata organizzazione codice_org accessi commesse»
- «profili di piattaforma Amministratore cliente Amministratore commessa Pianificatore Consultazione Tecnico»
- «varianti dei profili task aggiuntivi Profili e varianti»
- «rbac_enforce sola registrazione rbac_deny accensione organizzazione»
- «invito utente scadenza 72 ore Reinvia invito Inviti inviati»
- «lotti di competenza utenti senza lotti vedono tutto»
- «ambito dei dati Consultazione esterno righe proprie operatori visibili»
- «impersona accedere come un'altra persona Amministratori cliente»
- «ultimo Amministratore cliente attivo guardia»
- «Elenco utenti Commessa e profilo Da collegare Senza identità»
- «json_admin solo staff User not allowed»

### JQL fragments (cloudId `21873985-2e5d-4a8a-bb45-e6d453128985`, project GOP, READ ONLY)
- `project = GOP AND key in (GOP-103, GOP-105, GOP-108, GOP-112, GOP-209, GOP-212, GOP-227, GOP-229, GOP-290, GOP-294, GOP-330, GOP-570, GOP-571, GOP-572, GOP-573, GOP-574, GOP-575, GOP-577, GOP-581, GOP-582, GOP-595, GOP-596, GOP-597, GOP-626, GOP-664, GOP-667, GOP-668, GOP-669, GOP-847, GOP-855)`
- `project = GOP AND text ~ "rbac_enforce" ORDER BY updated DESC`
- `project = GOP AND text ~ "invito" ORDER BY updated DESC`
- `project = GOP AND text ~ "lotti di competenza" ORDER BY updated DESC`
- `project = GOP AND text ~ "impersona" ORDER BY updated DESC`
- `project = GOP AND parent = GOP-570 AND status != Done` (what is still planned: the chapter must not present it as live)
- Purpose: titles for `## Fonti`; one real story (problem → cause → fix) for § 3 (escalation via invite) and § 5 (administrator downgraded); the planned date or condition, if any, for switching on the controls — no promises the tickets do not make.

### Specific facts, numbers and labels to hunt
- Eight profile labels and descriptions; `tipo` map 1/1/2/3/4/8/7/9.
- Invite: 72 ore (259200 s); email-failure message; «Reinvia invito» behaviour.
- Cookie of the last commessa: 30 giorni.
- Lotti: «Valore nel carico» −128..127 (only if needed); confirmation texts for first/last lotto; deletion without confirmation.
- Ambito thresholds: Verifica `stato_id > 3`, foto `stato_id > 5`, in stato names.
- `rbac_enforce` values for `sg`, `easy`, `ener` on the research date.
- Impersonation messages (five, verbatim).
- GOP-847 date: 20 novembre 2026.
- Labels: «Invita utente», «Inviti inviati», «Reinvia invito», «Accessi», «Accessi per commessa», «Accesso alla commessa», «Applica a più commesse», «Scheda», «Storico», «Storico delle modifiche», «Aggiungi commessa», «Disattiva persona», «Riattiva persona», «Reimposta password», «Invia mail», «Lotti», «Tutti i lotti», «Limitato», «Sensibile», «Assegna in blocco», «Azzera filtri», «Esporta», «Profili e varianti», «Crea variante», «Modifica variante», «Elimina variante», «Confronta profili», «Impersona» (verify), stato values «Attivo», «Invitato», «Disattivato», «Da collegare».

### Mandatory [CONFLICT] items to record
1. Seven profiles (pattern 25) vs eight in code (Magazziniere, GOP-855).
2. `ProfiliPiattaforma::TIPO_LEGACY` docblock «Non ancora applicata» vs pattern 25 «`AccessoCommessa::assegna()` lo riscrive a ogni salvataggio».
3. Meaning of `operatori.id_user`: ch.2 («utenti che li seguono») vs `User::getOperatori()` and the visibility wiki (the operatore's own access).
4. Linking «Da collegare» accesses: ch.2 says the amministratore does it; the Architect found no UI path.
5. Admin menu «riservato al personale GOPlanner» (wiki) vs «Utenti» voices visible to amministratori with the permesso, and the menu title «Admin»/«Utenti» (`AdminAreaUtenti::titoloAdmin()`).
6. ch.3 and ch.6 permission-refusal messages vs `can()` returning true while `rbac_enforce` is off: record the gate type of each.
7. Legacy level table in `docs/01-foundations/06-…` (2–4 backoffice, 5–6 speciali, 8 cliente finale) vs the profile map in code (2 Pianificatore, 3 Call center, 4 Consultazione, 7 Magazziniere, 8 Consultazione esterno).
8. `docs/03-cookbooks/04-create-new-user.md` direct insert vs `InvitoUtente::crea()` canonical (pattern 32).
9. Pattern 25 mentions a «Ruoli» menu voice (`index.php?page=ruoli`); `AdminAreaUtenti::voci()` lists only «Elenco utenti» and «Profili e varianti».

### Security filter reminder
No logins, names, emails of real persons (the `$custom['users']` example in `docs/01-foundations/06-…` is real data), no company display names from `$ORGANIZZAZIONI`, no production counts of users or roles, no IPs, hosts, keys, tokens, cookie values, `.env` values, password hashes or hashing details beyond «parola d'ordine», no contents of credentials cookbooks. Committente names: at most one as an example of a commessa, sparingly; tenant codes only inside DEV boxes.

---

## TARGET

- **Word count:** 5.400–5.800 words in total (PRD § 4: 4.000–6.000). Breakdown: «In questo capitolo» ~80; § 1 850; § 2 1.100; § 3 1.100; § 4 950; § 5 900; § 6 950; `## Fonti` ~150.
- **Opening hook strategy:** open § 1 on one invented case, said once as invented — a new Pianificatore's first morning, when the menu «Utenti», two operatori and the liste of one lotto are «missing» for three different reasons, none of them a fault — so that in four sentences the reader sees the four layers (commessa, menu della commessa, profilo, ambito) the chapter then walks one by one.
- **Closing beat promise:** end § 6 on a desk rule that is not an echo of chapter 6 — when someone does not see something, find the first layer that hides it before giving anything, give the smallest access that solves it, and leave to the staff tecnico what you cannot give yourself: more than you have, another organizzazione, the menu of a commessa, the Admin tools.
