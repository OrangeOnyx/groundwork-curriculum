# Decision Journal Entry

**Purpose:** Log a decision with the reasoning at the moment you make it, for later review.

**When to use:** Every time you make a decision that's larger than trivial but smaller than a memo.

**Category:** Personal ops

**Model recommendation:** Any model — this is short.

---

## The prompt

```
Log this decision in my decision journal.

Decision: {DECISION}
Context: {CONTEXT}
Options considered: {OPTIONS}
Chosen option: {CHOICE}
Reasoning: {REASONING}
Emotional state (0-10, honest): {EMOTIONAL_STATE}
Confidence (0-100%): {CONFIDENCE}
When to review: {REVIEW_DATE}

Format:

## Decision
Restated in one sentence.

## Reasoning at the time
2–3 bullets summarizing why I made this choice.

## What I expect to happen
The concrete outcome I'm betting on.

## What would tell me I was wrong
Specific signals — metrics, events, feedback — that would falsify this decision.

## Review checklist
- Date to revisit: {REVIEW_DATE}
- What to look at first when reviewing

Rules:
- Do not add analysis I didn't provide.
- Preserve my exact wording where possible.
- Keep under 200 words.
```

## Variables

- All fields above

## Example use case

Deciding to self-host video vs use a SaaS.

## Expected output shape

Five sections, under 200 words.
