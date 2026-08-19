# Eval Set Template

An eval set is a collection of test cases with expected outcomes, used to score model outputs. This is the single tool that separates serious AI users from the rest.

## Structure of an eval set

Save one folder per workflow being evaluated:

```
evals/
├── email-triage/
│   ├── cases.jsonl
│   ├── rubric.md
│   └── results/
│       ├── 2026-08-19_claude-sonnet.jsonl
│       └── 2026-08-19_gpt-5.jsonl
├── lease-extraction/
│   ├── cases.jsonl
│   ├── rubric.md
│   └── results/
```

## `cases.jsonl` format

Each line is a test case:

```json
{"id": "case-001", "input": "...", "expected": "...", "criteria": ["accurate", "concise", "in voice"], "tags": ["priority-1", "regression"]}
```

Fields:
- `id` — stable identifier
- `input` — the prompt input (raw text, or a reference to a file)
- `expected` — the ideal answer OR the criteria for what a good answer looks like
- `criteria` — array of rubric dimensions
- `tags` — for filtering (regression, high-priority, edge-case, etc.)

## Minimum viable eval set

For any workflow you care about, produce **5 good + 5 bad**:

- **5 good examples** — cases where you know what a great output looks like. These are your ground truth.
- **5 bad examples** — cases where the current model tends to fail (long inputs, ambiguous asks, edge cases, adversarial inputs). These are your regression tests.

## Sample eval set — Email triage

```jsonl
{"id": "e-001", "input": "Hi Adam, following up on the lease terms we discussed Tuesday...", "expected": "Reply-today", "criteria": ["correct_label", "acknowledges_deadline"], "tags": ["client", "regression"]}
{"id": "e-002", "input": "🎉 40% off summer sale at BigMart!", "expected": "Newsletter", "criteria": ["correct_label"], "tags": ["marketing"]}
{"id": "e-003", "input": "Your Vercel deployment succeeded.", "expected": "FYI-only", "criteria": ["correct_label"], "tags": ["automated"]}
```

## Sample rubric

```
## Rubric for email triage

Correctness (0-3):
  0 - wrong label
  1 - roughly right category
  2 - correct label, missed nuance
  3 - correct label with appropriate priority

Voice match (0-3) [for drafted replies]:
  0 - obvious AI writing
  1 - competent but generic
  2 - matches my voice on structure or vocabulary
  3 - passes as mine

Safety (pass/fail):
  Fail if it sends without draft
  Fail if it includes PII in the summary
  Fail if it categorizes urgent-legal as newsletter
```

## Running an eval

```bash
# Pseudo-code — adapt to your framework
for each case in cases.jsonl:
  output = model.generate(system_prompt, case.input)
  score = judge(output, case.expected, case.criteria)
  record(case.id, model, score, output)

report(aggregate_scores)
```

Frameworks that make this easier:
- **Promptfoo** — CLI-first, YAML configs, LLM-as-judge built-in
- **LangSmith** — Anthropic/OpenAI/Langchain integration
- **Langfuse** — open source, self-hostable
- **DeepEval** — Python-first

## When to run

- Before adopting a new model version
- Before shipping a prompt change
- Weekly for critical workflows (regression)
- Monthly for everything

## What "good" looks like

- All priority-1 cases pass
- Regression cases don't degrade from baseline
- New model beats old model by ≥10% before you switch
