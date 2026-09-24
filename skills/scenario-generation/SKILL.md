---
name: scenario-generation
description: >
  Full pipeline in one go: brief, concepts, draft, stress test, final scenario for an AI and economic change workshop. Pick this to start from scratch and get a finished scenario.
---

# Scenario Generation

Runs the whole scenario pipeline in one pass. This skill is the
orchestrator: it gathers inputs once, then drives the three stage skills
back to back without stopping for review between them, and presents the
complete set of artifacts at the end.

**The pipeline:**

```
  intake ──► scenario-concepting ──► selection ──► scenario-drafting ──► deliver
                (brief + concepts)     (top rank)     │         ▲
                                                      ▼         │
                                            scenario-stress-testing
                                                 (iterate ×2–3)
```

Use the stage skills directly when the user wants to work a single stage.
Use this skill when they want the finished scenario.

## Bundled resources

This skill carries its own copy of everything it reads, inside this skill
directory, beside this file. Nothing it needs lives outside that
directory.

Read at the start of a run, when framing intake:

- `references/workshop-types.md` — workshop formats, so intake can offer
  the options rather than ask an open question

The framework library is **scenario-concepting's**, not this skill's. Ask
whether a framework is in play, pass through whatever the user names, and
leave the rest to concepting — it holds
`references/scenario-frameworks.md` and will choose and record an
assumption when intake comes back blank.

Resolve every path in this section against **this file's own directory**,
not the user's working directory — the two are different places. If you
do not already know this file's directory, find it: locate the path
ending in `skills/scenario-generation/SKILL.md` and work from there.

**A missing resource is a hard stop.** Never reconstruct a framework,
template, house style or corpus from memory and carry on — the output
would quietly diverge from the library, and the user would have no way
to see it. Say which file is missing and where you looked, and ask how
to proceed. This holds in one-shot mode as well: a missing library is
exactly the genuine blocker that mode allows you to come back on.

Each stage skill carries its own copy of what *it* reads, so pass it the
brief and the concepts, never file paths into this directory.

Project artifacts go in the user's working directory, in a single flat
folder. Never write project files into the skill directory.

## One-shot mode

Everything after intake runs in **one-shot mode**. Tell each stage skill
so explicitly when you invoke it. One-shot mode means:

- **Skip the discussion.** No clarifying questions, no "shall I proceed?",
  no presenting work for approval mid-pipeline. The user has already asked
  for the finished article.
- **Decide and record.** Where a stage would normally ask, make the
  defensible choice, write it down as an explicit assumption in the
  artifact it belongs to, and carry on.
- **Produce every artifact anyway.** One-shot mode compresses the
  conversation, never the output. Every file the stage owes still gets
  written, in full, to its own output contract.
- **Don't stop on a wobble.** A stage finding a weakness fixes it and
  moves on; only a genuine blocker (a missing input that cannot be
  assumed, a constraint that makes the brief impossible) comes back to
  the user.

Report progress as you go in one short line per stage — enough that the
user can see where the run is, not a narration of each file.

---

## Step 1: Intake

One consolidated round of questions, asked once, before anything else.
This is the only point in the run where you stop for the user.

Cover:

### Goals of the gathering

- **Audience**: who is in the room? Roles, seniority, sector, expertise.
- **Commissioning context**: who asked for this, and what's the broader
  programme?
- **Workshop format**: which kind of session? (see `workshop-types.md`)
- **Desired outcome**: what should participants walk away with?

### Scenario assumptions

- **Horizon**: H1 (continuation), H2 (emerging change), or H3
  (transformative)? This shapes the register of the whole piece.
- **AI capability assumptions**: what can AI do in this world? Use
  augmentation / substitution / full automation as scaffolding, capture
  specifics in free text.
- **Scenario framework**: is one structuring the possibility space? Take
  what the user names — don't offer a menu or pick one here. Concepting
  chooses from its own framework library if this comes back blank.
- **Geographic and political setting**: where and when?
- **Thematic focus**: which economic, technological, or social dynamics
  matter most?
- **Constraints**: anything off-limits, already decided, or politically
  sensitive?
- **Existing materials**: prior scenarios, briefs, or research to build on?

Ask these as one batch, and say plainly that anything left blank will be
assumed and flagged. Do not iterate on the answers — you need enough to
write a brief, not perfect answers. Gaps become stated assumptions in
`BRIEF.md`.

If the user has already supplied a brief or a filled-in intake, skip this
step entirely and go straight to Step 2.

---

## Step 2: Concepting

Invoke **scenario-concepting** in one-shot mode.

It runs intake framing (already supplied — pass the answers through),
goal definition, and concepting. Divergent exploration still happens in
full; what's skipped is the pause for review.

Expect back: `BRIEF.md` and `CONCEPT-A.md` … `CONCEPT-E.md`, with the
ranked table populated in `BRIEF.md`.

---

## Step 3: Selection

In a one-shot run you make the call, without asking:

- If the user named a direction, framework position, or premise during
  intake, pick the concept that serves it.
- Otherwise take the top-ranked concept from `BRIEF.md`.
- Only synthesise two concepts into a new `CONCEPT-F.md` if two ranked
  concepts are close and genuinely complementary — and then re-verify
  the causal logic of the combination before drafting.

Record the choice and its one-sentence justification in `BRIEF.md` under
the ranked table. State the choice to the user in one line as you move
on; do not wait for a response.

---

## Step 4: Drafting and tuning

Invoke **scenario-drafting** in one-shot mode, pointing it at `BRIEF.md`
and the selected concept file.

That skill drafts `SCENARIO-RAW.md`, then calls **scenario-stress-testing**
and iterates against its findings before finessing and producing
`SCENARIO-FINAL.md`. You do not need to call the stress-testing skill
yourself — drafting owns that loop.

Expect back: `SCENARIO-RAW.md`, `STRESS-TEST-1.md` (and `-2`, `-3` if the
loop ran further), and `SCENARIO-FINAL.md`.

---

## Step 5: Deliver

Present the finished run in one message:

1. **The scenario itself**, in full, inline — the user should not have to
   open a file to read it.
2. **The artifact list**, with a one-line description of each file and
   where it sits.
3. **The assumptions you made** on the user's behalf during intake and
   selection, as a short list. This is the point where the user gets to
   push back on them, so make them easy to scan and easy to overturn.
4. **The central tension** the scenario hands the room, in one sentence,
   and the strongest objection stress testing surfaced that was kept
   rather than fixed.

Offer, in one line, to re-run any single stage — most commonly a
different concept from the ranked five, or a re-tune for a different
audience.

## Output contract

A completed run leaves this in the working directory:

| File | From |
|------|------|
| `BRIEF.md` | concepting, with ranked table and selection recorded |
| `CONCEPT-A.md` … `CONCEPT-E.md` | concepting |
| `CONCEPT-F.md` | selection, only if concepts were combined |
| `SCENARIO-RAW.md` | drafting |
| `STRESS-TEST-1.md` … | stress testing, one per round |
| `SCENARIO-FINAL.md` | drafting, with tuning notes |

Nothing in this list is optional. If a stage skipped a file, go back and
produce it before delivering.
