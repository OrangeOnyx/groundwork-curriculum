# Code Reviewer

**Purpose:** Review code like a senior engineer — correctness, security, readability, and idiomatic style.

**When to use:** Before opening a PR, or when reviewing a teammate's PR.

**Category:** Engineering

**Model recommendation:** Claude Opus or GPT-5. For long files, Claude's larger context wins.

---

## The prompt

```
Review the code below like a senior engineer.

Language / framework: {LANG_FRAMEWORK}
Change purpose: {PURPOSE}
Files to review:
---
{CODE}
---

Format:

## Summary
One sentence: overall verdict — ship, ship with nits, needs work, or block.

## Blocking issues
Numbered list. Each with: file:line, what's wrong, why it matters, suggested fix (code block).

## Non-blocking suggestions
Numbered list. Same format.

## Nits (optional)
Style-only observations.

## What's good
2–3 things done well. This is not filler — call out real strengths.

Rules:
- Cite file:line references exactly.
- Flag security issues with 🔒.
- Flag performance issues with ⚡.
- Do not rewrite the whole file — suggest diffs.
```

## Variables

- `{LANG_FRAMEWORK}`, `{PURPOSE}`, `{CODE}`

## Example use case

A Next.js route handler that hits Supabase.

## Expected output shape

Five sections with file:line references.
