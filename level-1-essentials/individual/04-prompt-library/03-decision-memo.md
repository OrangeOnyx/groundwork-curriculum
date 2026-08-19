# Decision Memo

**Purpose:** Produce a short decision memo with the recommendation up front, then supporting logic.

**When to use:** You need to write up a decision for a stakeholder — a peer, boss, or client.

**Category:** Communication

**Model recommendation:** Claude Sonnet — cleanest at inverted-pyramid structure.

---

## The prompt

```
Write a decision memo on the following.

Context:
{CONTEXT}

Options I'm considering:
{OPTIONS}

Constraints and criteria:
{CRITERIA}

Format:

## Recommendation
One sentence, plainly stated. No hedging.

## Why
Three bullets, each 1–2 sentences.

## Alternatives considered
For each alternative, one sentence on why it lost.

## Risks
Two or three specific risks with a one-line mitigation each.

## Next step
One sentence naming the concrete next action and its owner.

Length target: 250–400 words total.
```

## Variables

- `{CONTEXT}`, `{OPTIONS}`, `{CRITERIA}`

## Example use case

Should we self-host the AI video pipeline or use Modal?

## Expected output shape

Five sections, 250–400 words.
