# Competitive Teardown

**Purpose:** Analyze a competitor's product, positioning, and go-to-market.

**When to use:** Before a positioning meeting, a pitch, or a product decision.

**Category:** Research

**Model recommendation:** Perplexity Deep Research or Computer's research subagent.

---

## The prompt

```
Do a competitive teardown of: {COMPANY}

My product / positioning: {MY_POSITIONING}

Focus areas: {FOCUS — product / pricing / GTM / all}

Format:

## Snapshot
One paragraph: what they do, who they serve, their size and stage.

## Product
- Core features (bulleted)
- Notable strengths (2–3)
- Notable gaps (2–3)

## Pricing and packaging
Table of tiers, prices, and included features. Note anything unusual.

## Positioning
- Their claimed differentiation (their words)
- Their actual differentiation (your read)

## GTM motion
Sales-led, product-led, community-led, or hybrid. How they acquire.

## Where we win / lose
Two columns. Be specific — no "we have better support".

## Threats to us
Ranked 1–3.

Sources cited inline with anchor-text names.
```

## Variables

- `{COMPANY}`, `{MY_POSITIONING}`, `{FOCUS}`

## Example use case

Teardown of a competing property management platform.

## Expected output shape

Seven sections with inline citations.
