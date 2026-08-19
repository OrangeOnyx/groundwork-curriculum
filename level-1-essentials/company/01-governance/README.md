# 01 — Governance

**Governance before tools. Always.**

A company with an AUP but no AI beats a company with AI but no AUP. Every incident in the past three years has come from an unstructured deployment.

## Files in this folder

1. `acceptable-use-policy.md` — the one-page AUP employees actually read
2. `data-classification-matrix.md` — which data class goes to which tool
3. `vendor-dpa-checklist.md` — DPAs to sign with each vendor
4. `incident-response-addendum.md` — what to do when PII leaks
5. `steering-committee-charter.md` — who sits on it, what they decide
6. `zero-retention-configuration.md` — how to enable no-training on every provider

## The sequence

Do these in strict order. Skipping = incident.

1. Convene the Steering Committee (day 1)
2. Draft and publish AUP (week 1)
3. Publish Data Classification Matrix (week 1)
4. Enable zero-retention on approved providers (week 2)
5. Sign DPAs with each approved provider (week 2)
6. Publish Incident Response Addendum (week 2)
7. Only THEN move to `02-accounts-procurement/`

## Definition of done

- [ ] AUP signed by all employees
- [ ] Every approved AI tool has a signed DPA in place
- [ ] Zero-retention verified on every enterprise tenant
- [ ] Steering Committee meets bi-weekly with published agenda
- [ ] Incident Response Addendum drilled at least once (tabletop exercise)
