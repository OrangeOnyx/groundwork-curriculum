# Fact-Checker with Citations

**Purpose:** Verify each factual claim in a document against public sources.

**When to use:** Before publishing anything with numbers, dates, or attributed statements.

**Category:** Research

**Model recommendation:** Perplexity — search-grounded, best for verification.

---

## The prompt

```
Fact-check the document below. For every factual claim, verify against public sources.

Document:
---
{DOCUMENT}
---

Format:

For each claim, produce a row:

| # | Claim (as written) | Verdict | Correct fact (if different) | Source |
|---|---|---|---|---|

Verdicts:
- ✅ Correct
- ⚠️ Correct but misleading (explain why)
- ❌ Incorrect
- ❓ Unverifiable in public sources

At the end, a summary section:
## Summary
- Total claims checked: N
- Correct: N
- Misleading: N
- Incorrect: N
- Unverifiable: N

## Recommendations
Bulleted fixes, most critical first.
```

## Variables

- `{DOCUMENT}`

## Example use case

A marketing landing page.

## Expected output shape

Table + summary.
