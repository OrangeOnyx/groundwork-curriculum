# Executive Update Writer

**Purpose:** Convert your week's work into a 5-line update for an executive.

**When to use:** Weekly, when your boss or a stakeholder asks 'what's the status?'

**Category:** Communication

**Model recommendation:** GPT-5 — best at compression.

---

## The prompt

```
Turn my week's work into an executive update.

My work this week:
{RAW_LOG}

Format:

**This week:** one sentence naming the biggest win or milestone.
**Shipped:** bullet list of things that went live. Max 5 items. If more, group them.
**In progress:** bullet list of active work. Max 3. Include % complete.
**Blockers:** bullet list. If none, write "None."
**Next week:** one sentence naming the top priority.

Rules:
- Total length under 150 words.
- No filler adjectives ("great progress", "exciting update").
- Numbers where possible.
```

## Variables

- `{RAW_LOG}` — dump of the week's work

## Example use case

A Friday brain-dump.

## Expected output shape

Five labeled lines, under 150 words.
