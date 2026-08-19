# Article-to-Notes Extractor

**Purpose:** Extract the useful signal from an article into structured notes you can review later.

**When to use:** When you read a long article and want to keep only what matters.

**Category:** Research

**Model recommendation:** Claude Sonnet with the article pasted or URL fed.

---

## The prompt

```
Extract structured notes from the article below.

Article:
---
{ARTICLE_OR_URL}
---

Format:

## What it's about
One sentence.

## The claim
The article's core argument in 2–3 bullets.

## Evidence they offer
Bulleted, with the strongest evidence first.

## What's new or non-obvious
2–3 bullets. Skip if the piece is a rehash.

## Quotes worth keeping
Up to 3 direct quotes with page/paragraph reference.

## My open questions
2–3 bullets — things the article raises but doesn't answer.

## Related to
Any of my active projects this connects to.
```

## Variables

- `{ARTICLE_OR_URL}`

## Example use case

A long NYT feature on AI regulation.

## Expected output shape

Six sections plus a project-tie section.
