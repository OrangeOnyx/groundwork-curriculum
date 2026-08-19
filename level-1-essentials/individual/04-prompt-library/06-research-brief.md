# Research Brief Generator

**Purpose:** Produce a research brief on a topic — background, key facts, sources, open questions.

**When to use:** You need a fast primer on an unfamiliar topic before a meeting or decision.

**Category:** Research

**Model recommendation:** Perplexity Sonar Pro — search-grounded. Or Perplexity Computer with research subagent for depth.

---

## The prompt

```
Produce a research brief on: {TOPIC}

Purpose I need it for: {PURPOSE}

Depth: {DEPTH — quick / standard / deep}

Format:

## TL;DR
Three sentences, direct.

## Key facts
5–10 bulleted facts, each cited inline with the source name as anchor text.

## Timeline (if relevant)
Bulleted dates, most recent first.

## Players
Table: Entity | Role | Why they matter | Source.

## Open questions
Things that couldn't be answered from public sources. Bulleted.

## Sources
Numbered list of primary sources with URLs.

Rules:
- Every claim gets a citation.
- Flag stale sources (>18 months old) with (dated).
- No speculation unless labeled "Analysis:".
```

## Variables

- `{TOPIC}`, `{PURPOSE}`, `{DEPTH}`

## Example use case

GEO/AEO optimization landscape for a website audit.

## Expected output shape

Six sections with inline citations.
