# Knowledge Base Structure

The KB is the foundation of every department copilot. Structure it right and RAG works. Structure it wrong and it hallucinates.

## Organizing principle

**One canonical source per topic.** Every piece of information should live in exactly one authoritative document. Copies decay.

## Folder structure

```
knowledge-base/
├── 01-company-fundamentals/
│   ├── mission-values.md
│   ├── org-chart.md
│   ├── glossary.md
│   ├── brand-voice-guide.md
│   └── policies/
│       ├── acceptable-use-policy.md
│       ├── data-classification-matrix.md
│       ├── code-of-conduct.md
│       └── ...
├── 02-product/
│   ├── product-overview.md
│   ├── feature-catalog.md
│   ├── roadmap-published.md
│   ├── api-reference/
│   └── release-notes/
├── 03-customers/
│   ├── icp-profiles.md
│   ├── personas.md
│   ├── approved-case-studies/
│   └── customer-list-approved-for-reference.md
├── 04-competition/
│   ├── landscape-map.md
│   └── battle-cards/
├── 05-sales/
│   ├── playbook.md
│   ├── pricing-sheet.md
│   ├── objection-handling.md
│   ├── email-templates/
│   └── ...
├── 06-marketing/
│   ├── style-guide.md
│   ├── messaging-house.md
│   ├── content-calendar.md
│   └── ...
├── 07-engineering/
│   ├── architecture-overview.md
│   ├── coding-standards.md
│   ├── runbooks/
│   ├── postmortems/
│   └── ...
├── 08-support/
│   ├── kb-articles/
│   ├── escalation-matrix.md
│   └── ...
├── 09-legal-compliance/
│   ├── standard-nda.md
│   ├── msa-template.md
│   ├── privacy-policy.md
│   └── ...
├── 10-hr/
│   ├── handbook.md
│   ├── benefits.md
│   └── ...
├── 11-finance/
│   ├── chart-of-accounts.md
│   ├── budget-model.xlsx
│   └── ...
└── 99-archived/
    └── [retired docs with dates]
```

## Document standards

Every document has:

```markdown
---
title: [Title]
owner: [Name / Role]
last_reviewed: YYYY-MM-DD
next_review: YYYY-MM-DD
classification: [Public / Internal / Confidential / Restricted]
tags: [array]
version: X.Y
---

# Title

[Content]
```

## Chunking-friendly writing

Write documents so they chunk well for RAG:

- **H2 sections** break at natural knowledge units
- **One idea per section** — don't cover multiple topics in one section
- **Self-contained sections** — a section should stand alone when retrieved out of context
- **Explicit terminology** — spell out acronyms first use per section
- **Concrete examples** included where relevant
- **No inline "see above" or "as mentioned"** — those break when the chunk is retrieved standalone

## Metadata for filtering

Every chunk carries metadata for filtered retrieval:

```json
{
  "doc_id": "sales-playbook-v3",
  "section": "objection-handling-pricing",
  "classification": "internal",
  "department": "sales",
  "last_reviewed": "2026-08-01",
  "tags": ["objection", "pricing"],
  "permissions_group": "all-employees"
}
```

Retrieval filters:
- Copilot only retrieves chunks the user is authorized to see (permissions_group)
- Only current (not archived) unless user asks for history
- Only classification appropriate to the current session tool

## What NOT to put in the KB

- Personal drafts
- Ephemeral status updates
- Duplicates (any information more than once is wrong)
- Anything > 18 months old without explicit re-review
- Unstructured chat logs
- Deprecated processes without archived tag
- Individual PII of employees or customers beyond what's business-critical
- Content that could go stale within a week

## Refresh rules

- Every doc has `next_review` — after that date, either re-approve or archive
- Doc owner gets a monthly digest of docs coming due
- Any change to a policy triggers a KB update within 5 business days
- Retired docs move to `99-archived/` with a redirect stub in the original location if links exist
