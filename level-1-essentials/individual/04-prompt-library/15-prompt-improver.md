# Prompt Improver

**Purpose:** Rewrite a prompt to be more effective — clearer, more constrained, better output structure.

**When to use:** When a prompt you're using isn't producing what you want.

**Category:** Meta

**Model recommendation:** Claude Opus — best at prompt engineering reasoning.

---

## The prompt

```
Improve this prompt.

Original prompt:
---
{PROMPT}
---

What the current output does wrong: {PROBLEM}
What I want it to do instead: {DESIRED}

Format:

## Diagnosis
2–3 bullets: what's causing the poor output.

## Improved prompt
```
[the rewritten prompt, fully drop-in ready]
```

## What changed
Bulleted — the specific edits and why each helps.

## Test cases
3 inputs I should run against the new prompt to verify it works.

Rules:
- Preserve the original intent.
- Prefer specificity over cleverness.
- Add explicit output format instructions.
- Add explicit "do not" rules where drift is likely.
```

## Variables

- `{PROMPT}`, `{PROBLEM}`, `{DESIRED}`

## Example use case

Your current summarizer that keeps adding fluff.

## Expected output shape

Diagnosis → improved prompt → change log → test cases.
