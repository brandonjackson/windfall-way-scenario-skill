---
name: scenario-stress-testing
description: >
  Pressure-test a draft workshop scenario before it goes in front of a
  room: structured stress-test questions, four adversarial judges
  (Economist, Citizen, Policymaker, Storyteller), and a simulation of how
  the workshop conversation will actually go. Produces a severity-ranked
  findings file with a concrete fix for each finding. Use when the user
  asks to stress test, pressure-test, critique, red-team, or sanity-check
  a scenario, wants to know where a scenario will get attacked, or asks
  how a workshop will react to a draft. Also invoked by scenario-drafting
  as its revision loop. For writing or revising the scenario itself, use
  scenario-drafting.
---

# Scenario Stress Testing

Stage 6a and 6b of the pipeline. Takes a draft scenario and finds what
will break in the room — before the room finds it.

This skill **diagnoses; it does not rewrite.** It proposes fixes but
leaves them for `scenario-drafting` (or the user) to apply. Keeping
diagnosis separate from revision is the point: a critic who is also the
author grades gently.

## Bundled resources

This skill carries its own copy of everything it reads, inside this skill
directory, beside this file. Nothing it needs lives outside that
directory.

Read before starting:

- `references/stress-tests.md` — the full question set and the four judges
- `BRIEF.md` from the project, if one exists — most findings are only
  judgeable against the intended audience and workshop format

Resolve every path in this section against **this file's own directory**,
not the user's working directory — the two are different places. If you
do not already know this file's directory, find it: locate the path
ending in `skills/scenario-stress-testing/SKILL.md` and work from there.

**A missing resource is a hard stop.** Never reconstruct a framework,
template, house style or corpus from memory and carry on — the output
would quietly diverge from the library, and the user would have no way
to see it. Say which file is missing and where you looked, and ask how
to proceed. This holds in one-shot mode as well: a missing library is
exactly the genuine blocker that mode allows you to come back on.

Project artifacts go in the user's working directory. Never write project
files into the skill directory.

## When invoked in one-shot mode

`scenario-drafting` or `scenario-generation` will tell you the full
pipeline is running. Then: skip the discussion and carry on. Don't ask
what to focus on, don't present findings for approval, don't ask whether
to continue to the conversation simulation. Run both parts, write the
findings file, and hand back a short summary — the caller iterates on it.

## Inputs

- The draft scenario (usually `SCENARIO-RAW.md`, or the current revision)
- `BRIEF.md` for audience, format, horizon, and desired outcome
- The round number, if the caller is iterating

If no brief exists, infer the audience from the scenario and say
explicitly in the findings file that you did — findings about audience
resonance are weaker without it.

---

## Part 1: Stress testing (6a)

Work `references/stress-tests.md` in full. Two passes, in this order —
they overlap deliberately, because the same flaw looks different depending
on who it bothers.

### Pass 1 — the categories

Work through each in turn: **Internal Consistency**, **Audience
Resonance**, **Plausibility**, **Productive Tension**, **Emotional
Register**, **Coverage and Gaps**, **Workshop Dynamics**.

Quote the scenario. A finding that doesn't cite the line it's about isn't
a finding, it's an impression.

### Pass 2 — the judges

Then run each of the four judges against the draft, one at a time, in
character: **The Economist** (internal consistency of the economic logic),
**The Citizen** (living standards and the social contract), **The
Policymaker** (is this serious enough to take into a meeting), **The
Storyteller** (does the narrative compel).

Give each judge its own section. Let them disagree with each other and
with Pass 1 — a tension between the Economist's demand for rigour and the
Storyteller's demand for compression is real information about the draft,
not a contradiction to resolve.

---

## Part 2: Conversation simulation (6b)

Now imagine actually running the workshop in `BRIEF.md` with this
scenario, with these participants, in this format.

Be concrete. Name the objection in the words a participant would use, not
the category it belongs to.

- **The fixation risk**: what will the room seize on unproductively? The
  arguable number, the contested institution, the word that means
  something specific to this audience?
- **The "that would never happen" moment**: which sentence draws it, who
  says it, and does the conversation recover?
- **The foreclosed conversation**: which productive discussion does the
  scenario accidentally shut down by over-specifying? What did the
  scenario answer that it should have left open?
- **The first ten minutes**: what does the room actually talk about
  first? If that isn't the central dilemma, the scenario has a framing
  problem.
- **The quiet participant**: which people in the room have nothing to say
  to this scenario, and is that acceptable for this format?

Write at least five named, quotable objections. "Participants may question
the timeline" is not one; "the OBR person will say no fiscal forecast
moves 4% of GDP in eighteen months" is.

---

## Severity

Classify every finding. This is what lets the caller iterate without
rewriting the whole scenario each round.

| Severity | Meaning | Treatment |
|---|---|---|
| **Blocking** | Derails the workshop or discredits the scenario. A broken causal link, a wrong institutional fact, a resolved tension, a fatal implausibility. | Must be fixed before use. |
| **Material** | Costs the scenario a chunk of its effect: a weak landing, a flat emotional register, a foreseeable fixation, an audience mismatch. | Fix unless there's a reason not to. |
| **Minor** | Wording, texture, a small imprecision. | Fix if it's free. |
| **Keep** | A flaw that earns its place — a deliberate ambiguity, a simplification that buys a better conversation, a provocation that should stay provocative. | Do not fix. Record the reasoning; it belongs in the scenario's tuning notes. |

Be willing to use **Keep**. A scenario tuned until nothing is objectionable
is a scenario nobody argues about, and argument is the deliverable. Flag
the opposite risk too: if a round returns no Blocking and no Material
findings, say so plainly rather than manufacturing findings to look
thorough.

---

## Output contract

Write `STRESS-TEST-<n>.md`, where `<n>` is the round (`STRESS-TEST-1.md`
for a first pass). Never overwrite a previous round — the sequence is the
record of how the scenario improved.

Structure:

```markdown
# Stress Test — Round <n>

**Draft tested:** <filename, and what changed since the last round>
**Audience:** <from BRIEF.md>
**Verdict:** <workshop-ready | needs revision | needs rework>

## Findings

| # | Severity | Category | Finding | Suggested fix |
|---|----------|----------|---------|---------------|

## Category pass
### Internal Consistency
… (one subsection per category, each citing the text)

## Judges
### The Economist
### The Citizen
### The Policymaker
### The Storyteller

## Conversation simulation
### Likely objections, in participants' words
### The first ten minutes
### Foreclosed conversations

## Keep list
<flaws that should survive tuning, and why>
```

Rules:

- Every finding gets a **number, a severity, a quoted location, and a
  concrete suggested fix.** A finding with no proposed fix is unfinished
  work; "consider revisiting this" is not a fix.
- The findings table is the summary; the sections below are the evidence.
  They must agree — anything in a section that matters is in the table.
- **Verdict** is one of three: *workshop-ready* (no Blocking, no
  Material), *needs revision* (Material findings only), *needs rework*
  (any Blocking finding).
- Findings are about the scenario, not the writing process. Don't grade
  effort.

Hand back to the caller: the verdict, the count by severity, and the
single most important finding. The caller decides what to do about it.
