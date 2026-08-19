# Legal Copilot — Starter Prompts

Copy-paste-ready prompts for the department. Deploy alongside the system prompt.

## 1. NDA triage

```
Triage this NDA. For each clause, note: our standard position, this NDA's position, deviation severity (Critical/Material/Nit), suggested redline. Return as a table.

NDA:
{NDA}
```

## 2. Contract redline

```
Redline this {CONTRACT_TYPE} against our standard. Flag deviations. Cite paragraph numbers.

Contract:
{CONTRACT}
```

## 3. Contract summary

```
Summarize this contract in one page: parties, effective date, term, financial terms, key obligations, termination rights, dispute resolution, red flags.

Contract:
{CONTRACT}
```

## 4. Extract fields

```
Extract as JSON: parties (with full legal names), effective_date, term_length, renewal, notice_period, governing_law, jurisdiction, indemnity_cap, termination_rights, assignment.

Contract:
{CONTRACT}
```

## 5. Compliance screen

```
Screen this contract for {REGIME — GDPR/CCPA/HIPAA} compliance. List: gaps, high-risk clauses, missing required provisions.

Contract:
{CONTRACT}
```

## 6. Legal Q&A with citations

```
Question: {QUESTION}. Answer with jurisdiction assumed as [JURISDICTION]. Cite statute or case where possible. Mark as GENERAL REFERENCE — not legal advice.
```

## 7. Draft demand letter

```
Draft a demand letter for {SITUATION}. Recipient: {RECIPIENT}. Amount / relief sought: {RELIEF}. Include: recitation of facts, legal basis, demand, deadline, next steps.
```

## 8. Lease-specific review (Belle Realty)

```
Review this commercial lease under Louisiana law. Flag: default provisions, notice requirements, personal guarantees, options to renew, CAM caps, exclusivity clauses, subordination.

Lease:
{LEASE}
```

