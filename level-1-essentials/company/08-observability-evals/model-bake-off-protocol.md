# Model Bake-Off Protocol

Run this every quarter. Determines whether to switch a workflow's default model.

## Why

Providers release new models constantly. A model that was best last quarter may not be this quarter. A quarterly bake-off keeps you honest.

## The protocol

### Step 1 — Pick workflows to bake off
Pick the top 3 workflows by cost or by strategic importance. Not every workflow needs a quarterly bake-off.

### Step 2 — Identify candidate models
For each workflow:
- **Baseline:** current production model
- **Candidates:** 2–4 alternatives (usually 1 same-provider newer + 1 competitor + 1 open-weight cheaper option)

Example for a summarization workflow:
- Baseline: Claude Sonnet 4
- Candidate 1: Claude Sonnet 4.5 (newer version)
- Candidate 2: GPT-5 (competitor)
- Candidate 3: Llama 4 70B on Groq (open-weight cheap)

### Step 3 — Freeze the eval set
Use the workflow's current eval set. Do not add cases mid-bakeoff.

### Step 4 — Run each candidate
- Same system prompt
- Same eval inputs
- Fresh, not cached
- Multiple runs to average out variance (3 runs minimum)

### Step 5 — Score everything
For each candidate:

| Dimension | Baseline | Cand 1 | Cand 2 | Cand 3 |
|---|---|---|---|---|
| Correctness | 2.5 | 2.7 | 2.4 | 2.1 |
| Format | 3.0 | 3.0 | 3.0 | 2.7 |
| Voice | 2.4 | 2.5 | 2.3 | 1.9 |
| Safety fails | 0 | 0 | 0 | 1 |
| Latency (p50) | 2.1s | 1.8s | 2.4s | 0.9s |
| Cost / 1k requests | $8.20 | $8.20 | $12.00 | $0.80 |

### Step 6 — Decide

Ship the candidate if:
- Zero safety regressions
- No Priority-1 correctness regressions
- Aggregate quality ≥ baseline
- Cost within budget
- Latency within SLO

Reasonable trade-offs:
- Small quality bump for material cost savings — often yes
- Material quality bump for equal cost — yes
- Large cost cut for small quality drop — case by case (only for low-stakes workflows)

Do NOT switch if:
- Any safety fail
- Voice degrades on brand-critical workflows
- Latency spike breaks user experience

### Step 7 — Roll out safely
- Canary: 5% of traffic for 3 days
- If clean, expand to 50% for a week
- If clean, full rollout
- Keep baseline available for rollback for 30 days

### Step 8 — Document
Publish a bake-off report to Steering Committee:
- Workflows evaluated
- Candidates
- Scores
- Decision + reasoning
- Rollout plan
- Rollback plan

## Automation

The bake-off should be scripted. A typical script:

```python
for candidate in candidates:
    for case in eval_set:
        for run in range(3):
            output = model.generate(system_prompt, case.input, model=candidate.id)
            score = judge(output, case.expected, rubric)
            record(candidate.id, case.id, run, score, latency, cost)

report = aggregate(records)
publish(report, to="steering-committee-slack")
```

## Anti-patterns
- Baking off with a tiny eval set (< 25 cases) — noisy signal
- Baking off only on benchmark data — not your real workflow
- Judging with the same model family that's being tested — biased
- Ignoring cost or latency — they're real user impact
- Making the decision by vibes — write it down
