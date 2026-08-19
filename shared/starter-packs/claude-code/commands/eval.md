---
description: Run the project's eval suite against the current state of the code and summarize results. Use before merging any change that touches prompts, models, or LLM-adjacent code.
---

Target: $ARGUMENTS (default: run the full suite)

## Step 1: Identify the eval suite

Look for one of these, in order:
- `eval/` directory with a `README.md` describing how to run it
- `evals/` directory (same)
- A `test:eval` script in `package.json`
- A `pytest tests/eval/` pattern
- A `Makefile` target starting with `eval`

If none exists, tell the user and stop — don't invent one.

## Step 2: Run it

Execute the eval command. Capture the output. Do not modify code to make evals pass.

## Step 3: Summarize

Return:

### Summary
- Total cases: N
- Passed: N (X%)
- Failed: N (X%)
- Regressed since last run (if tracked): +/- N

### Failures
For each failure:
- Test name
- Expected vs actual (truncated to key diff)
- Best guess at root cause (from reading the test and the code)

### Recommendation
- If pass rate is above the project's threshold (check `eval/README.md` for the number): safe to merge.
- If below threshold: block merge; investigate failures.

## Step 4: What NOT to do

- **Do not modify the eval expectations to make failures go away.** That's cheating.
- **Do not modify prompts inside the code to make failures go away without user approval.** Ask first.
- **Do not skip failing tests.** Report them all.
