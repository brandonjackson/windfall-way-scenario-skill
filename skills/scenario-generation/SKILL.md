---
name: scenario-generation
description: >
  Full Windfall Scenarios pipeline in one go: brief, concepts, draft, 
  stress test, final scenario for an AI and economic change workshop. 
  Pick this to start from scratch and get a finished scenario.
---

# Scenario Generation

Runs the whole scenario pipeline. This skill is the orchestrator: it asks
how involved the user wants to be, gathers inputs once, then drives the
three stage skills through to a finished scenario, stopping only where
the chosen mode says to, and presents the complete set of artifacts at
the end.

**The pipeline:**

```
  information ──► scenario-concepting ──► selection ──► scenario-drafting ──► deliver
   gathering        (brief + concepts)   (top rank or      │         ▲
                                          user's pick)     ▼         │
                                                 scenario-stress-testing
                                                      (iterate ×2–3)
```

Use the stage skills directly when the user wants to work a single stage.
Use this skill when they want the finished scenario.

## Resources

This skill bundles nothing of its own. Every reference, template and
corpus file belongs to the stage skill that reads it, and each stage
skill carries its own copy. The information-gathering questions, the
workshop formats and the framework library are all
**scenario-concepting's**. Pass the stage skills the brief and the
concepts, never file paths into this directory.

Project artifacts go in the user's working directory, in a single flat
folder. Never write project files into the skill directory.

## How the stage skills are invoked

Concepting and drafting run in this context, so they can see everything
gathered so far and can speak to the user where their instructions allow.
Load each one the way this surface loads a skill — in Claude Code, the
Skill tool, passing the mode ("one-shot mode" or "interactive mode") as
its argument. If there is no such mechanism, read the skill's `SKILL.md`
from beside this skill's directory (`../scenario-concepting/SKILL.md`,
`../scenario-drafting/SKILL.md`, resolved against this file's own
location) and follow it directly.

Stress testing is different: drafting launches it as a subagent with a
fresh context, so the critic never sees the author's reasoning. Drafting
owns that loop; you never call stress testing yourself.

## What one-shot mode means

Two of the three modes below run the stage skills in **one-shot mode**
(pick-the-concept adds a single stop, at selection). Tell each stage
skill explicitly which mode it is in when you invoke it. One-shot mode
means:

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

In every mode, report progress as you go in one short line per stage —
enough that the user can see where the run is, not a narration of each
file.

---

## Step 1: Choose the mode

Unless the user has already asked for one shot in so many words — "one
shot", "in one pass", "don't stop", "no check-ins", "just produce it" —
ask this first, before anything else, as a single question with three
options:

1. **One shot.** Gather what's needed, then produce the finished
   scenario without stopping.
2. **Approve at every stage.** The brief, the five concepts, the raw
   draft and the final scenario each come back for approval before the
   next stage starts.
3. **Pick the concept.** One shot, except that the user chooses from the
   ranked five before drafting.

Don't pre-empt the answer. "Write me a scenario for the DSIT workshop" is
a request for a scenario, not a request for one shot; ask. If the user
did ask for one shot, don't ask — say in one line that you are running
one shot, and go to Step 2.

The mode fixes how each later step behaves:

| | One shot | Approve at every stage | Pick the concept |
|---|---|---|---|
| Step 2, concepting | one-shot mode | interactive mode | one-shot mode |
| Step 3, selection | you decide | user picks | user picks |
| Step 4, drafting | one-shot mode | interactive mode | one-shot mode |

Information gathering is asked once, as a single batch, in every mode.

---

## Step 2: Information gathering and concepting

Invoke **scenario-concepting** once, and tell it two things: which mode
it is running in, and how information gathering stands.

- If the user has already supplied a brief, or answers to the
  information-gathering questions, pass those through and tell
  concepting to skip that section.
- Otherwise tell concepting to run its information gathering first — one
  consolidated batch of questions, asked once — and then carry on in the
  mode chosen at Step 1.

The information-gathering questions live in concepting, not here; do not
ask a version of your own. Anything left blank becomes a stated
assumption in `BRIEF.md`.

In one-shot mode that batch is the only stop: concepting writes the brief
and runs concepting in full, and divergent exploration still happens —
what's skipped is the pause for review. In approve-at-every-stage mode
concepting runs interactively: it presents the brief for approval before
concepting, shows the pool before the cull, and presents the five ranked
concepts with their visuals. Let it stop where its instructions say, and
pass the user's answers straight through.

Expect back: `BRIEF.md` and `CONCEPT-A.md` … `CONCEPT-E.md`, with the
ranked table populated in `BRIEF.md`.

---

## Step 3: Selection

**In one shot**, you make the call, without asking:

- If the user named a direction, framework position, or premise during
  information gathering, pick the concept that serves it.
- Otherwise take the top-ranked concept from `BRIEF.md`.
- Only synthesise two concepts into a new `CONCEPT-F.md` if two ranked
  concepts are close and genuinely complementary — and then re-verify
  the causal logic of the combination before drafting.

State the choice to the user in one line as you move on; do not wait for
a response.

**In approve-at-every-stage and pick-the-concept modes**, the user makes
the call. Present the ranked five from `BRIEF.md` — name, one-line
summary, the ranking justification — with your recommendation and one
sentence of reasoning, and wait. If concepting has just presented the
five interactively, don't repeat them; ask for the pick. Accept a
straight pick, a pick with changes to carry into drafting, or a request
to combine two (then `CONCEPT-F.md`, re-verified as above).

In every mode, record the choice and its one-sentence justification in
`BRIEF.md` under the ranked table.

---

## Step 4: Drafting and tuning

Invoke **scenario-drafting**, pointing it at `BRIEF.md` and the selected
concept file — in one-shot mode for one shot and pick-the-concept, in
interactive mode for approve at every stage.

That skill drafts `SCENARIO-RAW.md`, then runs **scenario-stress-testing**
as a fresh-context subagent and iterates against its findings before
finessing and producing `SCENARIO-FINAL.md`. You do not call the
stress-testing skill yourself — drafting owns that loop.

In interactive mode drafting presents the raw draft before the
stress-test loop and the final scenario after it. Let it stop where its
instructions say, and pass the user's answers straight through.

Expect back: `SCENARIO-RAW.md`, `STRESS-TEST-1.md` (and `-2`, `-3` if the
loop ran further), and `SCENARIO-FINAL.md`.

---

## Step 5: Deliver

Present the finished run in one message:

1. **The scenario itself**, in full, inline — the user should not have to
   open a file to read it.
2. **The artifact list**, with a one-line description of each file and
   where it sits.
3. **The assumptions you made** on the user's behalf during information
   gathering and selection, as a short list. This is the point where the
   user gets to push back on them, so make them easy to scan and easy to
   overturn.
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
