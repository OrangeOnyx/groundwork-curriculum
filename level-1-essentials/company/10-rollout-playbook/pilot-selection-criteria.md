# Pilot Selection Criteria

How to pick which workflows and departments go first.

## The scoring model

Score each candidate on 1-5:

| Dimension | 1 | 3 | 5 |
|---|---|---|---|
| **Time saved / week** | < 30 min | 2-4 hours | > 8 hours |
| **Volume** | Rare | Weekly | Daily |
| **Repeatability** | Unique | Similar-ish | Nearly identical |
| **Sponsor enthusiasm** | Neutral | Interested | Champion-level |
| **Data availability** | Fragmented | Some accessible | Fully in one system |
| **Risk of harm** | High blast radius | Bounded | Read-only |
| **Measurable ROI** | Vague | Estimable | Directly measurable |
| **Time to value** | > 90 days | 30-90 days | < 30 days |

Total 40. Pick candidates scoring ≥ 30.

## The archetypes of good first pilots

### Archetype 1 — High-volume drafting
- Sales follow-ups, support responses, marketing content
- Well-defined output format
- Human always reviews before send
- Easy to measure time-per-task

### Archetype 2 — Research and synthesis
- Weekly reports, competitive research, meeting briefs
- Reads a lot, writes a summary
- Low-risk (informational)
- Individual productivity gain

### Archetype 3 — Data extraction
- Contracts, receipts, resumes, forms
- Structured output
- Ground-truth easy to check
- Bounded blast radius

### Archetype 4 — Q&A over docs (RAG)
- Employee handbook Q&A, policy Q&A, product-doc Q&A
- Frequency: many small asks per day
- Reduces load on subject-matter experts
- Confidence-scored answers

## Archetypes to AVOID first

- **Autonomous external communication** — sending emails, posting to social
- **High-stakes irreversible decisions** — approvals, denials, pricing
- **Regulated workflows without human review** — HIPAA, GLBA, GDPR-restricted
- **Anything requiring long-horizon planning** — plans over 5-10 steps are still fragile
- **Novel domains without eval data** — no way to know if it works

## Department readiness scoring

Before picking a department for pilot:

| Signal | Score |
|---|---|
| Has an internal champion | +5 |
| Manager committed to sponsor | +5 |
| Backlog of well-defined workflows | +5 |
| Comfortable with iteration | +5 |
| History of adopting new tools | +3 |
| Data lives in modern systems | +3 |
| Team is not in a crunch | +2 |
| High turnover / instability | -5 |
| Prior AI experiment failed | -3 |
| Regulatory constraints unusual | -3 |

Departments scoring ≥ 20 are ready. Below 15, wait or invest in readiness first.

## The recommended first-pilot mix

Two departments, chosen to demonstrate range:

- **One customer-facing** (Sales or Support) — validates external-quality workflow
- **One internal-facing** (Ops, Finance, or HR) — validates safer internal workflow

Total 4-6 workflows across those two departments in the first pilot.

## Success bar for the pilot

At the end of 60 days:
- ≥ 60% of pilot department using ≥ 1 workflow weekly
- Quality metrics ≥ baseline
- No critical incidents
- Champion recommends expansion
- Sponsor recommends expansion
- Steering Committee approves expansion

If any of these fail, do not expand. Iterate first.
