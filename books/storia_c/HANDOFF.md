# HANDOFF — CHRONOS: Ai Confini dell'Impero (storia_c)

Riepilogo di sessione, per riprendere il lavoro senza perdere contesto.

## Stato del progetto

Libro bilingue (IT/SL) per seconda media, terzo volume della serie CHRONOS (secondo "missione", dopo `storia`/`storia_b` che sono due versioni dello stesso primo anno). Pipeline Ralph V5.1 in `ralph.sh`, config in `PRD.md` / `INSTRUCTION.md` / `STYLE_BIBLE.md` / `writing_plan.md`. Capitoli 0-6 generati; 7-12 non ancora scritti.

## Cosa è stato fatto in questa sessione (in ordine)

1. **Redesign della dinamica Alex-Maja** (da isolamento a collaborazione autonoma): riscritta `STYLE_BIBLE.md § Dinamica Alex-Maja` con regola fondamentale nuova, errori asimmetrici obbligatori tra i due personaggi, tre meccanismi connettivi opzionali (mai tutti insieme, mai obbligatori) — passaggio di consegne, interferenza breve sul campo (solo su salti sincronizzati da Mission Control, max 3 messaggi/scena), checkpoint condiviso (fuso nel box `::: checkpoint` esistente) — più i "4 nodi" (Cap. 6/10/11/12) e un arco relazionale lungo (attrito → complementarità → fiducia → inversione → eco finale).
2. **Rimosso il tetto massimo di lunghezza capitolo** (era 3.500-4.800 parole): ora soglia minima 4.000 parole (Cap. 0: 2.000), nessun tetto. Propagato in `PRD.md`, `INSTRUCTION.md`, `STYLE_BIBLE.md § Pacing Rules`.
3. **Aggiunto l'agente Repair** in `ralph.sh` (`run_repair()`): fix mirati con Edit tool invece di riscrittura completa dal Writer, attivato quando l'Editor classifica un FAIL come `REPAIR_MODE: TARGETED` (vs `STRUCTURAL`, che va ancora al Writer). Legge `${DOSSIER}` come unica fonte di fatti — regola "no invented facts, ever", con meccanismo di escalation esplicito (`ESCALATE: needs Researcher`) se manca un dato.
4. **Fork whole-book per continuità narrativa**: ha aggiornato `writing_plan.md` con una nota "Connessione Alex-Maja" per tutti i 13 capitoli (0-12), e ha prodotto `RETROFIT_PLAN.md` — verdetti per i Capitoli 1-6 già scritti su dove applicare retroattivamente i nuovi meccanismi connettivi. Verdetti: **Cap. 1 e Cap. 5 RETROFIT CONSIGLIATO**; Cap. 2 opzionale; Cap. 3/4/6 nessun retrofit necessario (verificato contro il testo reale, non solo il blueprint).
5. **Fix diretto: decoder-key ROT13 mancante in Capitolo 0** (bug bloccante, Gate 9 dell'Editor — il Cap. 1 falliva perché il suo Easter Egg presume che il lettore abbia già imparato a decifrare ROT13 nel Cap. 0, ma il box `MEMO: COME SI LEGGE UN CODICE ROT13` non esisteva mai nel file). Aggiunto direttamente in `chapter_0_it.md` e `chapter_0_sl.md`, formato secondo `STYLE_BIBLE.md § Formatting`.
6. **Repair Capitolo 1 — COMPLETATO** (`./ralph.sh 1 repair`, esito `REPAIR DONE ✓`, 2 fix):
   - SL Beat 4 "Cena Enega Kristala": rimosso un dettaglio sensoriale inventato (silenzio, cinquanta lavoratori, gabbiano) non presente nel dossier; riscritto usando solo bagliore/odore già in `dossier_chapter_1.md § Beat 4 [SHADOW]`.
   - Retrofit "passaggio di consegne": aggiunto un breve scambio MEMO a fine scena di Alex (saline di Zaule) e un beat di riconoscimento a inizio scena di Maja (banco del Breg, Lubiana) — stesso carico di sale, nessun dato nuovo inventato.
7. **Repair Capitolo 5 — NON eseguito**: l'utente ha chiesto di bloccare i repair prima che partisse. `feedback_loop_5.md` è già pronto (contiene solo l'istruzione per il checkpoint condiviso sul tema "l'assenza di documentazione è prova" tra Scena 3/Alex e Scena 4/Maja — il problema anti-calco precedente del Beat 4 risultava già risolto nel testo attuale, verificato riga per riga).

## File modificati in questa sessione

- `STYLE_BIBLE.md` — § Dinamica Alex-Maja riscritta, § Pacing Rules aggiornato (no tetto), § Contro la Ripetitività aggiunta.
- `PRD.md`, `INSTRUCTION.md`, `writing_plan.md` — propagazione policy di lunghezza dinamica; `writing_plan.md` anche con le note "Connessione Alex-Maja" (dal fork).
- `ralph.sh` — nuova fase `repair` (funzione `run_repair()`, dispatcher, `PIPELINE_PHASES`), `run_editor()` ora richiede classificazione `REPAIR_MODE`.
- `RETROFIT_PLAN.md` — nuovo file (dal fork), verdetti Cap. 1-6.
- `chapter_0_it.md`, `chapter_0_sl.md` — aggiunto memo-box decoder-key ROT13.
- `chapter_1_it.md`, `chapter_1_sl.md` — repair applicato (vedi punto 6 sopra).
- `feedback_loop_1.md` — riscritto per il repair appena eseguito (ora storico/consumato).
- `feedback_loop_5.md` — riscritto, pronto ma **non ancora eseguito**.

## Prossimi passi (non ancora fatti)

1. **Decidere se/quando eseguire `./ralph.sh 5 repair`** (checkpoint condiviso Cap. 5) — bloccato su richiesta esplicita dell'utente, in attesa di via libera.
2. Ri-passare l'Editor sul Capitolo 1 (`./ralph.sh 1 editor`) per confermare che il repair applicato soddisfi tutti i gate.
3. Ri-verificare il Capitolo 6: `feedback_loop_6.md` documentava un FAIL dovuto solo al vecchio tetto di lunghezza (ormai rimosso) — va ri-eseguito l'Editor per sbloccarlo formalmente.
4. **Capitolo 0 richiede ancora una rigenerazione completa del Writer** (Stage 1+2): contiene ancora "terza missione"/"tretja naloga"/un dettaglio di continuità sloveno legato al "tretjič" (vomit counter) da correggere, oltre al restyling già fatto altrove (4 competenze trasversali, nomi "Europa e mondo/Alto Adriatico/terre slovene", scambio "Accordo operativo" Alex-Maja del Cap. 0 da verificare se già incorporato dal fork). Non va patchato a mano — richiede rigenerazione.
5. Cap. 2 — retrofit opzionale/non prioritario, da valutare se applicare.
6. Questione aperta e mai risposta dall'utente: "cronoriporter" (non standard) vs "cronoreporter" — quale tenere.
