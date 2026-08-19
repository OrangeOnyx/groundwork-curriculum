# Copy Rewriter (voice-preserving)

**Purpose:** Rewrite marketing or product copy while preserving the author's voice.

**When to use:** Editing your own copy, or rewriting AI-generated copy that missed your voice.

**Category:** Writing

**Model recommendation:** Claude Sonnet with your style guide attached.

---

## The prompt

```
Rewrite the copy below.

Original:
---
{COPY}
---

Voice reference (my writing samples):
---
{VOICE_SAMPLES}
---

Constraints:
- Preserve the meaning exactly.
- Match the voice reference above — sentence length, vocabulary, rhythm, energy.
- Cut AI tells: "delve", "in the ever-evolving", "it's important to note", "certainly".
- Cut hedging: "may help", "can potentially", "one of the".
- Preserve any specific claims, numbers, and CTAs.

Format:

## Rewrite
The rewritten copy, no commentary.

## Changes I made
Bulleted — what I cut, tightened, or reworded, and why.

## Alt headlines (if applicable)
3 alternate headlines/opens I considered.
```

## Variables

- `{COPY}`, `{VOICE_SAMPLES}`

## Example use case

AI-generated homepage hero.

## Expected output shape

Rewrite + change log + alt headlines.
