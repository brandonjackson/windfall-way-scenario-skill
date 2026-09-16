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

Stages 5 and 6 of the pipeline: write the scenario, then tune it until it
does its job in the room.

Drafting is not a single pass. The shape is **draft → stress test →
revise → re-test → finesse → document**, and the loop in the middle is
where most of the quality comes from.

## Shared resources

All four scenario skills share one library, at the plugin root — the
directory containing `references/`, `templates/`, and `scenarios/`. From
this skill's own directory that is two levels up
(`../../references/house-style.md`); in a plugin install it is
`${CLAUDE_PLUGIN_ROOT}/references/house-style.md`.

Read before drafting, every time — not from memory:

- `references/house-style.md` — voice, structure, specificity, openings,
  closings, anti-patterns
- `templates/SCENARIO.md` — the output shape
- **At least two scenarios from `scenarios/`**, chosen to match this
  brief's horizon and audience. Calibration comes from the corpus, not
  from the style guide alone.

Project artifacts go in the user's working directory, in a single flat
folder. Never write project files into the skill or plugin directory.

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

## Stage 5: Drafting

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

---

## Stage 6: Tuning

### 6a/6b — Stress testing

Invoke **scenario-stress-testing** on `SCENARIO-RAW.md`, passing the
brief and the round number, in one-shot mode. It runs the category
questions, the four judges, and the conversation simulation, and writes
`STRESS-TEST-<n>.md` with severity-ranked findings, each with a concrete
suggested fix.

Do not stress-test your own draft inline instead of calling the skill.
The separation is deliberate — it is what stops an author grading their
own work gently.

### 6c — Revise against the findings

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

### 6d — Finessing

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

### 6e — Documenting the choices

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
