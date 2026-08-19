# Slack Message Polisher

**Purpose:** Rewrite a rough Slack draft into a clean, punchy message.

**When to use:** You've typed a Slack message but it feels too long, too formal, or too passive.

**Category:** Communication

**Model recommendation:** Any model — this is fast and cheap. Use Groq or Haiku.

---

## The prompt

```
Polish this Slack message. Preserve the meaning exactly.

Draft:
---
{DRAFT}
---

Rules:
- Cut greeting fluff.
- Move the ask to sentence 1 if there is one.
- Kill hedging ("just", "maybe we could", "if that's ok").
- Cap at 3 sentences unless there's a real reason.
- Match the channel tone: {CHANNEL_TONE}

Return only the polished message. No commentary.
```

## Variables

- `{DRAFT}` — your rough draft
- `{CHANNEL_TONE}` — casual / professional / exec

## Example use case

Casual DM about missing a deadline.

## Expected output shape

Single polished message, no commentary.
