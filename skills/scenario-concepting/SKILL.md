---
name: scenario-concepting
description: >
  The front half of the scenario pipeline: intake, goal definition, and
  concept generation for policy workshops on AI and economic change.
  Produces a scenario brief and five fully worked, ranked concepts —
  candidate worlds with their causal models — ready for drafting. Use when
  the user wants to write a scenario brief, define a workshop's goals,
  explore possible worlds, generate or rank scenario concepts, or work out
  what a scenario should be about before any prose is written. Also use
  when mapping a possibility space with a framework such as Dator's Four
  Futures or the AI diffusion/distribution quadrant. For turning a chosen
  concept into narrative prose, use scenario-drafting; for the whole
  pipeline in one pass, use scenario-generation.
---

# Scenario Concepting

Stages 1–3 of the scenario pipeline: work out what the scenario is *for*,
then find the world that serves it. The creative core of the process.

The failure mode this skill exists to prevent is five concepts that are
secretly the same concept. Explore wide before you narrow, and prove the
spread rather than asserting it.

## Bundled resources

This skill carries its own copy of everything it reads, inside this skill
directory, beside this file. Nothing it needs lives outside that
directory.

Read before starting:

- `references/scenario-frameworks.md` — structural frameworks and
  recurring scenario patterns
- `references/workshop-types.md` — workshop formats
- `templates/BRIEF.md` and `templates/CONCEPT.md` — the output shapes

Resolve every path in this section against **this file's own directory**,
not the user's working directory — the two are different places. If you
do not already know this file's directory, find it: locate the path
ending in `skills/scenario-concepting/SKILL.md` and work from there.

**A missing resource is a hard stop.** Never reconstruct a framework,
template, house style or corpus from memory and carry on — the output
would quietly diverge from the library, and the user would have no way
to see it. Say which file is missing and where you looked, and ask how
to proceed. This holds in one-shot mode as well: a missing library is
exactly the genuine blocker that mode allows you to come back on.

Project artifacts go in the user's working directory, in a single flat
folder. Never write project files into the skill directory.

## When invoked in one-shot mode

`scenario-generation` will tell you it is running the full pipeline. Then:
skip the discussion and carry on. No clarifying questions, no presenting
the brief for approval, no pausing between 2 and 3. Where you would have
asked, choose the defensible option and record it under **Assumptions** in
`BRIEF.md`. Explore no less widely and produce every artifact in full —
one-shot mode compresses the conversation, never the output.

---

## Stage 1: Inputs

Gather context through structured questions. Don't assume — ask. (In
one-shot mode the orchestrator has already done this; take its answers and
go straight to Stage 2.)

### Goals of the gathering

- **Audience**: who will be in the room? Roles, seniority, sector,
  expertise.
- **Commissioning context**: who asked for this? What's the broader
  programme?
- **Workshop format**: what kind of session is this? (see
  `workshop-types.md`)
- **Desired outcome**: what should participants walk away with?

### Scenario assumptions

- **Horizon**: H1 (continuation), H2 (emerging change), or H3
  (transformative)? This shapes the register of the entire piece.
- **AI capability assumptions**: what can AI do in this world? Use
  augmentation / substitution / full automation as scaffolding, but
  capture specifics in free text.
- **Scenario framework**: is a framework structuring the possibility
  space? See `scenario-frameworks.md`.
- **Geographic and political setting**: where and when is this set?
- **Thematic focus**: which economic, technological, or social dynamics
  matter most?
- **Constraints**: anything off-limits, already decided, or politically
  sensitive?
- **Existing materials**: prior scenarios, briefs, or research to build on?

Move on once you have enough to write a brief. You don't need perfect
answers — flag gaps and make reasonable assumptions, noting them
explicitly.

---

## Stage 2: Goal Definition

Produce `BRIEF.md` from `templates/BRIEF.md`.

### 2a. Defining the gathering

Who are the participants and what do we hope they achieve? Be specific
about the conversation we want to provoke — not "discuss AI" but the
particular tensions, trade-offs, or decisions we want them to grapple
with.

### 2b. Key parameters

These shape everything downstream, so set them explicitly:

- **Horizon** (H1/H2/H3)
- **AI capability assumptions** (free text, scaffolded by augmentation /
  substitution / full automation)
- **Scenario framework** (name it, and state which position(s) are in play)
- **Timeline** (when the scenario is set, and the range of events covered)

### 2c. Boundary setting

This determines the degrees of freedom for concepting, so be precise:

- **Fixed**: decided by the author or commissioner
- **Open**: what the scenario should explore and vary across concepts
- **Out of scope**: what we're deliberately not touching

The **Open** list is the raw material for Stage 3. If it has fewer than
three entries, the concepting space is too narrow — push back, or widen
it and say you have.

### 2d. Scene setting

What's interesting about this setting and this group?

- Key issues that motivate the audience
- How the social contract works in this domain
- Bottlenecks that already stymie progress
- Political and institutional dynamics that shape what's possible

### Assumptions

Every gap you filled rather than asked about goes in `BRIEF.md` under its
own **Assumptions** heading, as a list, each one a single sentence the
user could overturn at a glance.

### Output

`BRIEF.md`, complete. In interactive mode, present it for review before
Stage 3 — with the visual summary described under **Presenting with
visualisations** below. In one-shot mode, carry straight on.

---

## Stage 3: Concepting

### 3a. Diverge first — build a wide pool

**Do not start by writing five concepts.** Start by generating a pool of
**at least fifteen** one-line premises. They are cheap; write them fast
and badly. The pool is working material, not an artifact.

Each premise is one sentence: what changes, and what that breaks.

Work the pool deliberately through these generative moves — at least two
premises from each, so the pool can't collapse into one house style:

1. **Framework positions**: take each position in the chosen framework and
   ask what its most vivid instance looks like for *this* audience.
2. **Recurring patterns**: run the patterns in `scenario-frameworks.md`
   (Crossing the Threshold, The Great Repricing, The Enclosure, The
   Commons, The Compact, …) against the brief's setting.
3. **Inversion**: take the audience's central assumption from the brief's
   scene setting and assume the opposite holds.
4. **Break a bottleneck**: take a bottleneck listed in the brief and
   assume AI dissolves it. What was that bottleneck quietly holding up?
5. **Second-order**: pick an obvious first-order effect everyone already
   expects, grant it, and write about what it causes two steps later.
6. **Shift the protagonist**: same world, but the pressure lands on a
   different institution, sector, region, or generation.
7. **Wildcard**: one premise that would make the commissioner
   uncomfortable, and one where the drama is slow, dull, and cumulative
   rather than a shock. Both earn their place in the pool.

Then check the pool for spread before culling:

- Plot it against the framework's axes or positions. Which cells are
  empty? Fill them.
- Group premises by their **central mechanism** (what actually does the
  causal work). If more than three premises share a mechanism, you have
  one idea wearing several hats — generate against the gaps.
- Check the pool contains at least one world where things go *well* for
  someone, and at least one where the change is institutional rather than
  technological.

Show the user the pool with a coverage visual (see below) before culling,
unless you're in one-shot mode.

### 3b. Converge — cull to five

Cull to **exactly five** candidates that:

- Are relevant to the audience defined in the brief
- Explore the open dimensions from boundary setting
- Span the possibility space rather than clustering

Apply these anti-clustering rules, and state in `BRIEF.md` how the final
five satisfy them:

- **No two concepts may share a central mechanism.** If two do, cut the
  weaker and promote from the pool.
- **At least three distinct framework positions** must be represented,
  where a framework is in use.
- **At least one concept must be uncomfortable** for the commissioner or
  the audience's self-image.
- **At least one must be undramatic** — no shock, no threshold, just
  compounding pressure. Workshops overreact to catastrophe.
- **Not all five may end in the same kind of bind** (fiscal, political,
  distributional, geopolitical). Vary what the room is handed.

### 3c. Write the top halves

For each of the five, draft the **top half** of a `CONCEPT.md` using the
template: a punchy summary covering timeline, economic world, and key
dynamics. Short, vivid, self-contained — a reader grasps the world in
under sixty seconds.

Save as `CONCEPT-A.md` through `CONCEPT-E.md`.

### 3d. World building

For each concept, expand the **bottom half**: the assumptions and causal
models underpinning it. Show your working — what has to be true for this
world to exist? What are the key causal chains, feedback loops, and
tipping points? Where is it most vulnerable to a "that would never
happen" objection, and is that vulnerability fatal or acceptable?

### 3e. Refinement

Iterate on each concept until:

- The top half is compelling and self-contained
- The bottom half is internally consistent and aligned with the top half
- The causal logic holds up to scrutiny
- The concept is still distinct from its four siblings after the
  detail went in — worlds converge as they get specific, so re-check
  the anti-clustering rules here, not just at 3b

### 3f. Ranking

Once the concepts have stabilised, add the ranked table to `BRIEF.md`.
All five are ranked, each with a one-sentence justification. Criteria:

- **Relevance** to the audience and the decisions they actually face
- **Productive tension** — does this world force interesting trade-offs?
- **Plausibility** — is the causal logic credible?
- **Distinctiveness** — does it explore genuinely different territory?

---

## Output contract

Concepting is finished when all of the following are true. This is a
contract, not a guideline: the same run on the same brief must produce the
same set of files in the same shape every time.

**Files, named exactly:**

- `BRIEF.md`
- `CONCEPT-A.md`, `CONCEPT-B.md`, `CONCEPT-C.md`, `CONCEPT-D.md`,
  `CONCEPT-E.md` — exactly five, no more, no fewer

**Every concept file:**

- Uses every heading from `templates/CONCEPT.md`, in the template's order,
  with nothing renamed, nothing dropped, nothing added
- Has a real concept name as its title, never "Concept A"
- Fills every section with substance — no placeholders, no "TBD", no
  leftover template comments, no empty headings
- Top half (Summary, Timeline, Economic World, Key Dynamics): **150–300
  words total**
- Bottom half (Assumptions, Causal Chains, Weaknesses): **250–500 words
  total**, with Assumptions as a list of at least five, and Weaknesses
  naming at least two with a fatal/acceptable judgement on each

**`BRIEF.md`:**

- Uses every heading from `templates/BRIEF.md`
- Carries an **Assumptions** section listing every gap you filled
- Carries the ranked table with all five concepts, each with a
  one-sentence justification
- Carries a short **Spread check** note under the table: the central
  mechanism of each of the five, and a line confirming the
  anti-clustering rules hold

**Before you finish, run this checklist explicitly:**

1. Five concept files exist, all fully populated?
2. Any template comments or placeholder text left anywhere?
3. Five distinct central mechanisms?
4. Three or more framework positions represented?
5. One uncomfortable concept, one undramatic concept?
6. Word counts inside the ranges?
7. Ranked table complete, with justifications and the spread check?

Fix anything that fails before presenting. Don't report concepting as done
with an item outstanding.

---

## Presenting with visualisations

Concepts are spatial — they live in a possibility space — and a wall of
prose hides whether you actually covered it. Every presentation of
concepting work carries at least one visual.

**Visuals are rendered charts, not text.** Draw them as real graphics — an
HTML artifact with inline SVG or a charting library, or a plotted image
file — never as ASCII art, box-drawing characters, arrow chains made of
dashes, or any other picture built out of monospaced text. If the surface
can't render a chart, say so in one line and give the content as prose or
a plain markdown table instead of falling back to drawn-in-text diagrams.
Markdown tables are fine as tables; they are not a substitute for the map.
Read the `dataviz` skill before writing any chart code, and follow its
palette and labelling rules. Never let a visual replace the prose; it sits
above it as the map.

**When presenting the brief (Stage 2):** a parameters-at-a-glance
table — horizon, framework and position, timeline, audience, and the three
boundary lists side by side.

**When presenting the pool (Stage 3a):** a coverage map as a scatter or
binned-grid chart — the framework's two axes, each premise a plotted mark,
counts per cell shown — so empty space is visible at a glance. Annotate
over-fished and thin cells on the chart itself.

**When presenting the five concepts (Stage 3f):** all three of —

1. **The map**: the same plotted chart, with the five labelled by name.
2. **The comparison table**: concepts as columns, dimensions as rows —
   central mechanism, who wins, who loses, the bind it lands on, the
   likeliest objection. This is the visual that exposes clustering. A
   markdown table is the right form here.
3. **The causal spine** of each concept as a node-and-edge diagram of
   three to five links, drawn in SVG — each step a labelled node, each
   link a drawn arrow. For example: *audit automation → compliance costs
   collapse → mid-tier firms undercut incumbents → professional bodies
   lose licensing leverage → the state loses its enforcement proxy.*

Where a concept turns on timing, add a timeline chart: a drawn axis with
the milestone years marked and each event labelled against its point.

Label every axis, title every chart, make it legible at the width it will
be viewed at and in both light and dark themes, and put the caveat in the
prose rather than the picture.
