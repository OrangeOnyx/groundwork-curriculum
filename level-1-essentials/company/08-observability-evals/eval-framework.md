# Eval Framework

The framework the company uses to score AI workflows. Extends the individual framework in `shared/eval-templates/`.

## What we eval

For every deployed AI workflow, we track:

1. **Correctness** — does it produce the right output?
2. **Format compliance** — does it match the expected output shape?
3. **Voice / brand** — does it sound like us?
4. **Safety** — does it violate policy or reveal sensitive data?
5. **Cost** — dollars per resolved item
6. **Latency** — user-perceived speed
7. **Adoption** — % of eligible users using it
8. **ROI** — measured value against measured cost

## Eval cadence

| Workflow tier | Frequency |
|---|---|
| Customer-facing (support agent, sales outreach draft, marketing copy) | Weekly regression |
| High-volume internal (email triage, weekly review) | Bi-weekly |
| Low-volume internal | Monthly |
| Every workflow | Full quarterly review |

## Ownership

- **Workflow owner** — the department lead that uses it. Owns the eval set content.
- **AI Champion** — technical partner that maintains the eval runner.
- **Steering Committee** — reviews quarterly aggregate; approves model changes.

## Eval set structure

Per workflow:

```
evals/
└── <workflow-name>/
    ├── cases.jsonl
    ├── rubric.md
    ├── owner.md
    ├── history/
    │   ├── 2026-08-01_baseline.json
    │   └── 2026-08-15_v2.json
    └── results/
        └── [per-run scoreboards]
```

## Minimum eval set

Per workflow, minimum:
- **10 core cases** — cover the workflow's main scenarios
- **5 edge cases** — inputs that reveal drift
- **5 adversarial cases** — prompt injection, boundary inputs, permission tests
- **5 regression cases** — historical failures now fixed

Total: 25 cases minimum. Some workflows have 200+.

## Rubric mapping

Every case scored on 0-3 across dimensions:

- Correctness
- Format
- Voice
- Length
- Faithfulness (for grounded workflows)

Plus safety pass/fail:
- No PII leak
- No policy violation
- No unauthorized action
- Correct escalation

## Judging

- **Human judges** for calibration (initial 3 rounds)
- **LLM-as-judge** with human spot-check (10% sample) for ongoing
- **Automated checks** for format compliance and safety (regex/structural)
- **A/B test** for anything user-facing, using real user feedback

## Judge quality control

- Judges score their inter-rater agreement quarterly
- Judge prompt is versioned like any other prompt
- Judge model is one tier below production model (avoid conflict of interest)
- Judge output is auditable

## Regression protocol

When model or prompt changes:
1. Run current eval set against baseline
2. Run against candidate
3. Compare per-dimension deltas
4. Ship only if: zero safety regressions, no Priority-1 correctness regressions, aggregate delta ≥ 0

## Metric definitions

**Correctness** — output matches ground truth (exact for structured, judged for open-ended)
**Aggregate score** — mean 0-3 across dimensions, safety-fail excluded
**Pass rate** — % of cases where aggregate score ≥ 80% of max
**Cost per resolved item** — total tokens × price + amortized platform cost / resolved items
**Adoption rate** — % of eligible users making ≥ 1 call per week
**Deflection rate** — % of tasks completed without human hand-off (for agentic workflows)

## Publishing eval results

Every workflow has a public (within-company) dashboard:

- Current pass rate
- Trend over 8 weeks
- Latest model + prompt version
- Baseline pass rate
- Cost / resolved
- Adoption

Steering Committee reviews these monthly. Any workflow below its threshold is put on remediation.
