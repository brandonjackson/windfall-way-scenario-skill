---
name: scenario-drafting
description: >
  The back half of the scenario pipeline: turn a chosen scenario concept
  into finished narrative prose and tune it until it provokes the right
  workshop conversation. Drafts in house style, runs the
  scenario-stress-testing loop, revises against the findings, finesses the
  wording, and documents the deliberate choices. Use when the user has a
  concept, brief, or premise and wants the scenario written; wants an
  existing draft revised, tightened, or tuned for a specific audience; or
  asks to rewrite a scenario in house style. For generating and ranking
  candidate worlds first, use scenario-concepting; for diagnosis only
  without revision, use scenario-stress-testing; for the whole pipeline in
  one pass, use scenario-generation.
---

# Scenario Drafting

The back half of the pipeline — drafting, stress testing, tuning: write
the scenario, then tune it until it does its job in the room.

Drafting is not a single pass. The shape is **draft → stress test →
revise → re-test → finesse → document**, and the loop in the middle is
where most of the quality comes from.

## Bundled resources

This skill carries its own copy of everything it reads, inside this skill
directory, beside this file. Nothing it needs lives outside that
directory, the scenario corpus included.

Read before drafting, every time — not from memory:

- `references/house-style.md` — voice, structure, specificity, openings,
  closings, anti-patterns
- `templates/SCENARIO.md` — the output shape
- **At least two scenarios from `scenarios/`**, chosen to match this
  brief's horizon and audience. Calibration comes from the corpus, not
  from the style guide alone.

Resolve every path in this section against **this file's own directory**,
not the user's working directory — the two are different places. If you
do not already know this file's directory, find it: locate the path
ending in `skills/scenario-drafting/SKILL.md` and work from there.

**A missing resource is a hard stop.** Never reconstruct a framework,
template, house style or corpus from memory and carry on — the output
would quietly diverge from the library, and the user would have no way
to see it. Say which file is missing and where you looked, and ask how
to proceed. This holds in one-shot mode as well: a missing library is
exactly the genuine blocker that mode allows you to come back on.

Project artifacts go in the user's working directory, in a single flat
folder. Never write project files into the skill directory.

## When invoked in one-shot mode

`scenario-generation` will tell you the full pipeline is running. Then:
skip the discussion and carry on. Don't ask which concept unless none is
identifiable, don't present the raw draft for approval, don't ask whether
to run the stress-test loop or whether to apply a finding. Run the loop to
its stopping condition, produce `SCENARIO-FINAL.md`, and hand back.

## Inputs

- `BRIEF.md` — audience, format, horizon, framework, timeline, boundaries
- The selected concept file — `CONCEPT-X.md`

If several concepts exist and none is marked as selected: in interactive
mode, present the ranked five with your recommendation and one sentence
of reasoning, and take the user's pick. In one-shot mode, take the
top-ranked concept and state the choice in one line without waiting.

If there is no concept file at all — the user arrived with a premise, or
an existing draft to revise — write a short concept note first (timeline,
economic world, key dynamics, causal chain) and save it as
`CONCEPT-<name>.md`. Drafting without a stated causal model produces
scenarios that collapse under the Economist judge.

---

## Drafting

1. Read the house style and the corpus examples. Note what the examples
   do that the style guide doesn't say.
2. Read `BRIEF.md` and the selected concept, including the bottom half —
   the causal chain in the concept becomes the spine of the narrative.
3. Draft using `templates/SCENARIO.md`.

Hold to these while drafting:

- **Register follows horizon.** H2 scenarios are grounded in today's
  institutions under strain; H3 scenarios can reimagine institutional
  structures entirely. The horizon sets the register, not the length.
- **Length follows audience and format**, not horizon. The typical UK
  workshop scenario runs 550–750 words; a policy-literate audience can
  take 900; a tight executive briefing may want 300. Pick from
  `BRIEF.md`, and say which you picked.
- **Structure**: sectioned narrative with bold phrase headers is the
  default; continuous prose suits the shortest scenarios. Both carry the
  same skeleton — a cascading causal chain where each beat depends on
  the last.
- **Never break frame.** No "in this scenario", no "imagine if", no
  hedging. Past tense, third person, a historian looking back from inside
  the timeframe.
- **Land the ending on an unresolved bind**, quotable, under twenty
  words, handed to the room.

Write the first draft in one go, then read it once against the house
style's anti-patterns before saving. Save as `SCENARIO-RAW.md`.

In interactive mode, present the raw draft and wait for the user before
starting the stress-test loop; in one-shot mode, carry straight on.

---

## Tuning

### Stress testing

Invoke **scenario-stress-testing** on `SCENARIO-RAW.md`, passing the
brief and the round number, in one-shot mode. It runs the category
questions, the four judges, and the conversation simulation, and writes
`STRESS-TEST-<n>.md` with severity-ranked findings, each with a concrete
suggested fix.

**Run it in a fresh context, not in this one.** Launch it as a subagent
— the Agent tool in Claude Code, or whatever this surface offers for a
task with its own context window — and give it only:

- the path to the stress-testing skill's `SKILL.md`, which sits beside
  this skill's directory at `../scenario-stress-testing/SKILL.md`
  (resolved against this file's own location), with the instruction to
  read it and follow it
- the paths to the draft and to `BRIEF.md`, to read from disk
- the round number, and the words "one-shot mode"

Nothing else: not the concept's working, not your drafting reasoning,
not the findings you expect it to make. The critic judges the text on
the page. The draft's own revision log travels inside the file, and that
is all the history it needs.

The separation is the point. A critic who has watched the author reason
grades the reasoning rather than the draft, and grades it gently. So
never stress-test your own draft inline, and never run the skill in this
context: a stress test whose findings you could predict before it ran is
not a test.

If the surface has no way to run a task in its own context, fall back to
invoking the skill inline, and say so in the handback: that round was
not independent, and the facilitator should weight its verdict
accordingly.

### Revise against the findings

Work the findings table in severity order:

- **Blocking** — fix every one. A blocking finding means the scenario
  isn't usable; a broken causal link or a wrong institutional fact is
  repaired properly, even if that means restructuring a section.
- **Material** — fix unless you have a reason not to, and record the
  reason.
- **Minor** — fix where it costs nothing.
- **Keep** — do not fix. Carry the reasoning straight into the tuning
  notes; this is where deliberate ambiguities and pedagogically useful
  weak points come from.

Revise `SCENARIO-RAW.md` in place, keeping a short revision log at the
bottom of the file: round number, which findings you acted on, which you
declined and why.

### The iteration loop

Then stress-test again, with the incremented round number. Keep going
until **either**:

- the verdict comes back *workshop-ready* (no Blocking, no Material
  findings), **or**
- three rounds have run.

Three rounds is the ceiling. If Blocking findings survive round three,
stop revising and say so plainly: name what's still broken, say whether
it's a flaw in the draft or in the underlying concept, and — if it's the
concept — recommend returning to `scenario-concepting` rather than
polishing a world that doesn't hold up. Do not quietly downgrade a
finding to make the loop terminate.

Watch for the opposite failure too: if successive rounds return only
restatements of the same finding, or findings that contradict earlier
fixes, the scenario is being sanded down. Stop, and say which round you
consider the best version.

### Finessing

Once the loop has settled, a final pass on wording only. Targeted
adjustments that:

- reduce the likelihood of unproductive conversations
- sharpen the productive tensions
- leave deliberate ambiguities where they serve the workshop goals

Subtle adjustments, not rewrites. The scenario should feel like the same
story, just better calibrated. Then check the finished piece against the
house style one last time: frame never broken, closing unresolved and
quotable, every sentence earning its place, length still inside the range
you picked.

### Documenting the choices

At the bottom of the final scenario, under the template's tuning-notes
headings:

- **Assumptions made for conversation** — things assumed not because
  they're most likely but because they make for a better discussion
- **Deliberate ambiguities** — where the scenario is intentionally open,
  and why
- **Known weak points** — causal logic that doesn't fully hold but was
  kept for pedagogical value, drawn from the stress tests' Keep list

Each entry is one or two sentences. This section is for the facilitator,
not the participants, and it is what lets them defend the scenario in the
room when someone pushes on exactly the place you knew they would.

---

## Output contract

Drafting is finished when:

**Files, named exactly:**

- `SCENARIO-RAW.md` — the first draft, with its revision log
- `STRESS-TEST-1.md` … one per round, never overwritten
- `SCENARIO-FINAL.md` — the tuned scenario

**`SCENARIO-FINAL.md`:**

- Follows `templates/SCENARIO.md` — title in the corpus's convention,
  optional preamble only where the scenario is commissioned by or adapted
  from another programme, narrative, then tuning notes
- Is inside the length range you picked, and says which range and why in
  the tuning notes
- Never breaks frame anywhere in the narrative
- Ends on an unresolved bind, under twenty words, that hands the dilemma
  to the room
- Carries all three tuning-notes sections, each with at least one real
  entry

**Before you finish, run this checklist explicitly:**

1. Every Blocking finding from the final round resolved, or named
   as unresolved in the handback?
2. Frame intact — no "in this scenario", no hedging, no moralising?
3. Closing tension unresolved and quotable?
4. Institutional references accurate and current for this audience?
5. Word count inside the chosen range?
6. Tuning notes populated from the stress tests' Keep list, not
   invented?
7. Revision log present in `SCENARIO-RAW.md`?

Hand back: the scenario in full, inline; the final verdict and how many
rounds it took; and the one objection you deliberately left in, so the
facilitator knows it's coming.
