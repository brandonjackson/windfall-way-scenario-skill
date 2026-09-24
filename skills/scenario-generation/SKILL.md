---
name: scenario-generation
description: >
  One-shot, end-to-end production of a narrative scenario for a policy
  workshop on AI and economic change: intake, brief, concepting, selection,
  drafting, stress testing, and a tuned final scenario in a single pass.
  Use when the user wants a complete scenario produced from a standing
  start — "write me a scenario for the DSIT workshop", "I need a Windfall
  scenario for Tuesday", "run the whole scenario pipeline" — or mentions
  scenario planning, scenario workshops, Windfall, Dator's Four Futures,
  the diffusion/distribution quadrant, or named scenarios like "Hollow
  Boom" or "Crossing the Threshold" and wants the finished article. For a
  single stage on its own, use scenario-concepting (brief and concepts),
  scenario-drafting (concept to narrative), or scenario-stress-testing
  (pressure-test an existing draft) instead.
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

## Resources

This skill bundles nothing of its own. Every reference, template and
corpus file belongs to the stage skill that reads it, and each stage
skill carries its own copy. Intake questions, the workshop formats and
the framework library are all **scenario-concepting's**. Pass the stage
skills the brief and the concepts, never file paths into this directory.

Project artifacts go in the user's working directory, in a single flat
folder. Never write project files into the skill directory.

## How the stage skills are invoked

Concepting and drafting run in this context, so they can see everything
gathered so far and can speak to the user where their instructions allow.
Load each one the way this surface loads a skill — in Claude Code, the
Skill tool, passing "one-shot mode" as its argument. If there is no such
mechanism, read the skill's `SKILL.md` from beside this skill's directory
(`../scenario-concepting/SKILL.md`, `../scenario-drafting/SKILL.md`,
resolved against this file's own location) and follow it directly.

Stress testing is different: drafting launches it as a subagent with a
fresh context, so the critic never sees the author's reasoning. Drafting
owns that loop; you never call stress testing yourself.

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

## Intake and concepting

Invoke **scenario-concepting** once, and tell it two things: the full
pipeline is running in one-shot mode, and how intake stands.

- If the user has already supplied a brief, or answers to the intake
  questions, pass those through and tell concepting to skip intake.
- Otherwise tell concepting to run its intake first — one consolidated
  batch of questions, asked once — and then carry on in one-shot mode.

The intake questions live in concepting, not here; do not ask a version
of your own. That batch is the only point in the run where you stop for
the user. Anything left blank becomes a stated assumption in `BRIEF.md`.

Concepting then writes the brief and runs concepting in full. Divergent
exploration still happens; what's skipped is the pause for review.

Expect back: `BRIEF.md` and `CONCEPT-A.md` … `CONCEPT-E.md`, with the
ranked table populated in `BRIEF.md`.

---

## Selection

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

## Drafting and tuning

Invoke **scenario-drafting** in one-shot mode, pointing it at `BRIEF.md`
and the selected concept file.

That skill drafts `SCENARIO-RAW.md`, then runs **scenario-stress-testing**
as a fresh-context subagent and iterates against its findings before
finessing and producing `SCENARIO-FINAL.md`. You do not call the
stress-testing skill yourself — drafting owns that loop.

Expect back: `SCENARIO-RAW.md`, `STRESS-TEST-1.md` (and `-2`, `-3` if the
loop ran further), and `SCENARIO-FINAL.md`.

---

## Deliver

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
