---
name: scenario-writing
description: >
  End-to-end co-authoring of narrative scenarios for policy workshops on AI and
  economic change. Use whenever the user wants to create a scenario for a
  workshop, write a scenario brief, generate scenario concepts, draft scenario
  text, or tune a scenario for better workshop conversation. Also trigger when
  the user mentions scenario planning, scenario workshops, Windfall, or refers
  to scenario frameworks like Dator's Four Futures, the diffusion/distribution
  quadrant, or named scenarios like "Hollow Boom", "Crossing the Threshold",
  or similar. This skill walks through a structured pipeline: intake → goal
  definition → concepting → selection → drafting → tuning, producing file
  artifacts at each stage.
---

# Scenario Writing

A structured co-authoring process for creating narrative scenarios designed
to provoke productive conversation in policy workshops. The pipeline moves
through six stages, each producing file artifacts that feed the next.

All project files live in a single flat directory.

## Before you begin

Read the relevant reference files and templates before starting work:

- `references/scenario-frameworks.md` — maintained library of structural frameworks
- `references/workshop-types.md` — maintained list of workshop formats
- `references/house-style.md` — voice, structure, and principles for scenario prose
- `references/stress-tests.md` — structured questions for testing draft scenarios
- `templates/BRIEF.md` — template for the scenario brief
- `templates/CONCEPT.md` — template for concept documents
- `templates/SCENARIO.md` — template for the final scenario

If example scenarios exist in the `scenarios/` folder, read at least two
before drafting to calibrate tone and level of detail.

---

## Stage 1: Inputs

Gather context from the user through structured questions. The goal is to
collect enough information to write a clear brief. Don't assume — ask.

Key questions to cover:

- **Audience**: Who will be in the room? Roles, seniority, sector, expertise.
- **Commissioning context**: Who asked for this? What's the broader programme?
- **Workshop format**: What kind of session is this? (Reference `workshop-types.md`)
- **Desired outcome**: What should participants walk away with?
- **Horizon**: Is this an H1 (continuation), H2 (emerging change), or H3
  (transformative) scenario? This shapes the register of the entire piece.
- **AI capability assumptions**: What can AI do in this world? Use the three
  reference levels as scaffolding — augmentation, substitution, or full
  automation — but capture specifics in free text.
- **Scenario framework**: Is a framework structuring the possibility space?
  Reference `scenario-frameworks.md` for options.
- **Geographic/political setting**: Where and when is the scenario set?
- **Thematic focus**: What economic, technological, or social dynamics matter most?
- **Constraints**: Anything off-limits, already decided, or politically sensitive?
- **Existing materials**: Any prior scenarios, briefs, or research to build on?

Move to Stage 2 once you have enough to write a brief. You don't need perfect
answers to every question — flag gaps and make reasonable assumptions, noting
them explicitly.

---

## Stage 2: Goal Definition

Produce a BRIEF.md that captures three things plus the key parameters.

### 2a. Defining the Gathering

Who are the participants and what do we hope they achieve? Be specific about
the type of conversation we want to provoke — not just "discuss AI" but the
particular tensions, trade-offs, or decisions we want them to grapple with.

### 2b. Key Parameters

Set these upfront in the brief — they shape everything downstream:

- **Horizon** (H1/H2/H3)
- **AI capability assumptions** (free text, scaffolded by augmentation /
  substitution / full automation)
- **Scenario framework** (if any — name it and state which position(s) are
  being explored)
- **Timeline** (when is the scenario set, what range of events)

### 2c. Boundary Setting

Map what is and isn't specified upfront. This determines the degrees of
freedom for concepting:

- **Fixed**: things the author/commissioner has decided
- **Open**: things the scenario should explore and vary across concepts
- **Out of scope**: things we're deliberately not touching

### 2d. Scene Setting

What's interesting about this setting and this group? Cover:

- Key issues that motivate the audience
- How the social contract works in this domain
- Key bottlenecks that already stymie progress
- Political or institutional dynamics that shape what's possible

### Output

Draft `BRIEF.md` using `templates/BRIEF.md`. Present it to the user for
review before proceeding.

---

## Stage 3: Concepting

The creative core. Generate and refine possible worlds the workshop
participants could inhabit.

### 3a. Concept Generation

Generate 5 candidate scenarios that:

- Are relevant to the audience defined in the brief
- Explore the open dimensions identified in boundary setting
- Reference `scenario-frameworks.md` for structural scaffolding — use the
  selected framework's positions as starting points, but don't be limited
  to them
- Span the possibility space rather than clustering around one future

For each concept, draft the **top half** of a CONCEPT.md (using the template):
a punchy summary covering timelines, economic world, and key sociopolitical
dynamics. This should be short, vivid, and capture the essence of why this
world is interesting for this group.

Save each as `CONCEPT-A.md`, `CONCEPT-B.md`, etc.

### 3b. World Building

For each concept, expand the **bottom half** of the CONCEPT.md: the
assumptions and causal models underpinning the concept. This is where you
show your working — what has to be true for this world to exist? What are
the key causal chains?

### 3c. Refinement

Iterate on each concept until:

- The top half is compelling and self-contained
- The bottom half is internally consistent and aligned with the top half
- The causal logic holds up to scrutiny

### 3d. Ranking

Once concepts have stabilised, add a ranked summary to BRIEF.md with a
one-sentence justification for the ranking. Ranking criteria:

- Relevance to the audience and their real decisions
- Productive tension — does this world force interesting trade-offs?
- Plausibility — is the causal logic credible?
- Distinctiveness — does it explore genuinely different territory?

### Output

5 CONCEPT.md files (CONCEPT-A through CONCEPT-E) and an updated BRIEF.md
with ranked summaries.

---

## Stage 4: Selection

Present the ranked concepts to the user. Either:

- The user picks one
- You make a recommendation with reasoning
- The user asks to combine elements from multiple concepts

If combining, create a new CONCEPT.md that synthesises the chosen elements
and verify the causal logic still holds.

---

## Stage 5: Drafting

Write the scenario narrative.

### Process

1. Read `references/house-style.md` and at least one example from `scenarios/`
2. Read the winning CONCEPT.md and the BRIEF.md
3. Draft the scenario using `templates/SCENARIO.md`
4. Follow the house style in voice, structure, and texture
5. Match the register to the horizon: H2 scenarios are grounded in today's
   institutions under strain; H3 scenarios can reimagine institutional
   structures entirely

### Output

`SCENARIO-RAW.md` — a complete first draft of the scenario narrative.

---

## Stage 6: Tuning

Refine the scenario to provoke excellent workshop conversation.

### 6a. Stress Testing

Apply the questions in `references/stress-tests.md` to the draft. Work
through internal consistency, audience resonance, plausibility, productive
tension, emotional register, coverage, and workshop dynamics. Document
findings.

### 6b. Conversation Simulation

Imagine running the workshop described in the brief with this scenario.
Focus on the obvious failure modes:

- What will participants fixate on unproductively?
- Where will the "that would never happen" objections land?
- What productive conversations might be accidentally foreclosed?

Keep this concrete — name the likely objections rather than generalising.

### 6c. Finessing

Make targeted changes to wording that:

- Reduce the likelihood of unproductive conversations
- Sharpen the productive tensions
- Leave deliberate ambiguities where they serve the workshop goals

These should be subtle adjustments, not rewrites. The scenario should feel
like the same story, just better calibrated.

### 6d. Documenting Changes

At the bottom of the final scenario document, include a section listing:

- Assumptions made for the sake of better conversation
- Deliberate ambiguities and why they're there
- Known weak points in the causal logic that were kept for pedagogical value

### Output

`SCENARIO-FINAL.md` — the tuned scenario, ready for workshop use.
