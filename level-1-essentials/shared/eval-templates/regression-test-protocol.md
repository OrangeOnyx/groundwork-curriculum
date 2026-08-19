# Regression Test Protocol

Before you swap in a new model version, run this.

## The rule

**No model change ships without running the eval set.**

Even if the vendor says the new model is "10% better on benchmarks" — your workflow may be different. Verify on your data.

## Protocol

### Step 1 — Freeze the baseline

- Record current model version (e.g., `claude-opus-4-20260601`)
- Run the eval set against it
- Save results in `evals/<workflow>/results/YYYY-MM-DD_<model>_baseline.jsonl`

### Step 2 — Run candidate

- Run the eval set against the new model version (e.g., `claude-opus-4.5-20260901`)
- Save results with same timestamp convention

### Step 3 — Diff

Produce a comparison table:

| Case | Baseline score | Candidate score | Delta | Notes |
|---|---|---|---|---|
| e-001 | 3/3 | 3/3 | 0 | |
| e-002 | 2/3 | 3/3 | +1 | Improved edge case |
| e-003 | 3/3 | 1/3 | -2 | 🚨 Regression |

### Step 4 — Decide

Ship the new model if:
- ✅ Zero priority-1 regressions
- ✅ Aggregate score ≥ baseline
- ✅ Cost is acceptable
- ✅ Latency is acceptable

Do not ship if:
- ❌ Any priority-1 regression
- ❌ Any safety-fail case
- ❌ >5% degradation in aggregate

### Step 5 — Communicate

If you ship, write a one-paragraph changelog:
- Old model → new model
- Aggregate delta
- Notable improvements
- Any regressions being accepted (and why)
- Rollback plan

## When to re-baseline

- Every quarter (base drifts as your prompts evolve)
- After any major prompt change
- After a workflow change

## Prompt regressions

If a prompt change is the trigger, hold the model constant, vary only the prompt. Same protocol.
