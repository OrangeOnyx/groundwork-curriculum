# Meeting Summarizer

**Purpose:** Turn a meeting transcript or notes into a summary with decisions, action items, and open questions.

**When to use:** You have a transcript, Otter recording, or messy meeting notes to convert into a shareable summary.

**Category:** Communication

**Model recommendation:** Claude Opus or GPT-5 — best at extracting structure from long transcripts.

---

## The prompt

```
Summarize the meeting below.

Transcript / notes:
---
{TRANSCRIPT}
---

Return exactly four sections, in this order:

## Decisions
- Bullet list of decisions made. If none, write "No decisions made."

## Action items
- Owner — action — due date (if mentioned). One per line.

## Open questions
- Questions raised but not resolved. Bullet list.

## Summary
Three sentences covering: what was discussed, what was decided, what happens next.

Rules:
- Do not include a "Next steps" section — those go in Action items.
- Do not include attendee list unless I ask.
- Preserve owner names exactly as spoken.
```

## Variables

- `{TRANSCRIPT}` — the raw meeting text

## Example use case

Paste a Fireflies transcript.

## Expected output shape

Four sections in the exact order specified.
