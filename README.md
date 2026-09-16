# Windfall Way Scenario Skills

Co-authoring narrative scenarios for policy workshops on AI and economic
change. Four skills that share one library of frameworks, house style,
stress tests, templates, and a corpus of past scenarios.

## The skills

| Skill | Covers | Use when |
|---|---|---|
| **scenario-generation** | The whole pipeline, one pass | "Write me a scenario for the DSIT workshop" |
| **scenario-concepting** | Intake, brief, five ranked concepts | Working out what the scenario should be about |
| **scenario-drafting** | Draft, stress-test loop, tune | Turning a chosen concept into finished prose |
| **scenario-stress-testing** | Judges, categories, workshop simulation | Pressure-testing a draft before it meets a room |

They compose: `scenario-generation` runs concepting, then selection, then
drafting; `scenario-drafting` runs `scenario-stress-testing` as its
revision loop. When the orchestrator invokes them, the stage skills run in
**one-shot mode** — no clarifying questions, no stopping for approval,
every artifact still produced in full.

```
  intake ──► scenario-concepting ──► selection ──► scenario-drafting ──► deliver
                (brief + concepts)     (top rank)     │         ▲
                                                      ▼         │
                                            scenario-stress-testing
                                                 (iterate ×2–3)
```

Each also stands alone: run concepting to explore a possibility space, or
stress testing against a draft written elsewhere.

## Layout

```
skills/
  scenario-generation/SKILL.md     orchestrator
  scenario-concepting/SKILL.md     stages 1–3
  scenario-drafting/SKILL.md       stages 5–6
  scenario-stress-testing/SKILL.md stages 6a–6b
references/                        shared library — edit these as practice develops
  scenario-frameworks.md           frameworks and recurring patterns
  workshop-types.md                workshop formats
  house-style.md                   voice, structure, anti-patterns
  stress-tests.md                  question set and the four judges
templates/                         BRIEF.md, CONCEPT.md, SCENARIO.md
scenarios/                         the corpus, for calibration
scripts/sync-bundled.sh            copies the library into each skill
```

`references/`, `templates/`, and `scenarios/` at the repo root are the
**single source of truth**. Edit those as practice develops — extend them
rather than the skills themselves where the change is about practice
rather than process.

Each skill then carries its own copy of exactly the files it reads, at
`skills/<skill>/references/…`, `…/templates/…`, `…/scenarios/…`. The
duplication is deliberate: a skill only travels reliably with the files
inside its own directory, and a skill that is synced or packaged on its
own leaves anything beside `skills/` behind. A skill that cannot find a
bundled file stops and says so rather than improvising from memory.

After editing anything under `references/`, `templates/`, or `scenarios/`,
run:

```
scripts/sync-bundled.sh
```

and commit the copies it updates. `scripts/sync-bundled.sh --check` fails
if they have drifted; CI runs it on every push. Which files each skill
gets is the manifest at the top of that script — keep it in step with the
**Bundled resources** section of each `SKILL.md`.

## Artifacts a full run produces

`BRIEF.md`, `CONCEPT-A.md` … `CONCEPT-E.md`, `SCENARIO-RAW.md`,
`STRESS-TEST-1.md` (and further rounds), `SCENARIO-FINAL.md` — written to
the working directory in a single flat folder.

## Installing

Add the repository as a plugin marketplace in Claude Code, then install
the `windfall-way-scenario-skill` plugin — all four skills come with it.

```
/plugin marketplace add brandonjackson/windfall-way-scenario-skill
/plugin install windfall-way-scenario-skill
```
