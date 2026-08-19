# Weekly Review Generator

**Purpose:** Turn a week's calendar, notes, and Slack activity into a personal weekly review.

**When to use:** Every Friday, to close the week.

**Category:** Personal ops

**Model recommendation:** Perplexity Computer or Claude Projects — needs to read multiple sources.

---

## The prompt

```
Generate my weekly review.

Inputs (paste or link):
- Calendar this week: {CALENDAR}
- Slack messages I sent: {SLACK_ACTIVITY}
- Notes taken: {NOTES}
- Commits / PRs / tickets closed: {WORK_ARTIFACTS}
- Goals I set last Friday: {LAST_WEEK_GOALS}

Format:

## What went well
3 bullets, specific. Not "made progress" — say what shipped.

## What didn't
2–3 bullets, honest. Include one lesson per item.

## Wins to celebrate
Bulleted. Include size-appropriate ones — small wins count.

## Goal progress
Table: Last week's goal | Status | Notes

## People to follow up with
Bulleted — name, one-line context, target day.

## Next week's top 3
Ranked, with a one-sentence rationale for each.

## One thing to say no to
Bulleted — commitments I should decline or drop.

Rules:
- Be honest about misses. No "opportunities to improve" — say what didn't happen.
- Under 500 words.
```

## Variables

- `{CALENDAR}`, `{SLACK_ACTIVITY}`, `{NOTES}`, `{WORK_ARTIFACTS}`, `{LAST_WEEK_GOALS}`

## Example use case

A real Friday afternoon.

## Expected output shape

Seven labeled sections, under 500 words.
