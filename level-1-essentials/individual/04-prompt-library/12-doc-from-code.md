# Doc-from-Code Writer

**Purpose:** Read source code and produce clean developer documentation.

**When to use:** When someone asks 'how does X work' and there are no docs.

**Category:** Engineering

**Model recommendation:** Claude Sonnet — long context handles multi-file reads.

---

## The prompt

```
Read the code and produce documentation.

Codebase / module:
---
{CODE}
---

Audience: {AUDIENCE — new hire / external dev / self in 6 months}

Format:

## What this module does
One paragraph.

## Public API
Table: Function/class | Signature | Purpose | Example call

## Key concepts
Bulleted definitions of the 3–5 domain terms that matter here.

## How it fits into the system
One paragraph.

## Gotchas
Non-obvious behavior, edge cases, foot-guns. Bulleted.

## Example: end-to-end usage
One realistic example in a code block, fully runnable.

Rules:
- Do not document private methods.
- Preserve existing naming exactly.
- No filler like "This module is a great way to...".
```

## Variables

- `{CODE}`, `{AUDIENCE}`

## Example use case

The Belle Realty lease-assembly module.

## Expected output shape

Six sections + runnable example.
