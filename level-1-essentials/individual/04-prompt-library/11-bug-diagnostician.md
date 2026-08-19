# Bug Diagnostician

**Purpose:** Given a stack trace or symptom, propose the top three hypotheses ranked by likelihood.

**When to use:** When something's broken and you don't yet have a hypothesis.

**Category:** Engineering

**Model recommendation:** Claude Opus — best at reasoning over unfamiliar code.

---

## The prompt

```
Diagnose this bug.

Symptom:
{SYMPTOM}

Reproduction:
{REPRO_STEPS}

Error / stack trace:
```
{ERROR}
```

Relevant code:
```{LANG}
{CODE}
```

Format:

## Top 3 hypotheses
For each: name it, explain what's happening, give a % likelihood, give the exact next step to confirm or refute.

## Fastest path to answer
One paragraph: what to check first, why, expected result if hypothesis 1 is correct vs incorrect.

## If it's none of these
One line: what to look at next.

Rules:
- No hedging. Rank by likelihood, not comfort.
- Point at file:line when you have enough info.
```

## Variables

- `{SYMPTOM}`, `{REPRO_STEPS}`, `{ERROR}`, `{CODE}`, `{LANG}`

## Example use case

A 500 error on lease-generation POST endpoint.

## Expected output shape

Three hypotheses ranked with confirmation paths.
