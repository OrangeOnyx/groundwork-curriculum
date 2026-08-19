# Data Classification Matrix

## The four classes

| Class | Examples | Impact if leaked |
|---|---|---|
| **Public** | Marketing collateral, published blog posts, press releases | None |
| **Internal** | Org chart, internal docs, non-sensitive project plans, general Slack | Embarrassing, minor |
| **Confidential** | Financials, roadmaps, customer names, contracts, unreleased features | Material business harm |
| **Restricted** | Customer PII, PHI, payment data, security credentials, legal-privileged, trade secrets | Regulatory / legal exposure |

## The matrix

Rows = data class. Columns = tool tier. Cells = allowed / not allowed.

| Data class | Consumer AI (free tier) | Consumer AI (paid personal) | Enterprise / Business tier with DPA | Enterprise API with zero-retention + DPA | Self-hosted / local model |
|---|---|---|---|---|---|
| Public | ✅ | ✅ | ✅ | ✅ | ✅ |
| Internal | ⚠️ discouraged | ⚠️ discouraged | ✅ | ✅ | ✅ |
| Confidential | ❌ | ❌ | ✅ | ✅ | ✅ |
| Restricted | ❌ | ❌ | ⚠️ case by case | ✅ w/ BAA if PHI | ✅ |

## Specific data types

| Data | Class | Notes |
|---|---|---|
| Customer name only (no other data) | Internal | |
| Customer name + email | Confidential | PII |
| Customer name + full contact + purchase history | Restricted | PII |
| Employee salary | Restricted | |
| Employee name + role | Internal | |
| Contract terms | Confidential | |
| Signed contract with parties named | Restricted | |
| Product roadmap (draft) | Confidential | |
| Product roadmap (published) | Public | |
| Source code (open source) | Public | |
| Source code (proprietary, no secrets) | Confidential | |
| Source code with credentials | Restricted | Never — scrub first |
| SSN, DOB, tax ID | Restricted | |
| Payment card data | Restricted | PCI applies |
| Medical / health data | Restricted | HIPAA — BAA required |
| Legal-privileged | Restricted | Attorney-client protected |
| Financial statements | Confidential | |
| Financial statements (public co, filed) | Public | |
| Board minutes | Restricted | |
| Slack DMs | Internal / Confidential | Content-dependent |
| Emails to/from customers | Confidential / Restricted | Content-dependent |

## When in doubt

**Treat as more sensitive.** Downgrading later is cheap. Cleaning up an incident is expensive.

## Enforcement

- **Technical:** DLP scans block classified data from egressing to unapproved tools where possible
- **Procedural:** Regular training + spot audits
- **Cultural:** Report-safely policy in the AUP

## Amendments

The Steering Committee reviews this matrix quarterly. Additions to the "restricted" list require CISO approval.
