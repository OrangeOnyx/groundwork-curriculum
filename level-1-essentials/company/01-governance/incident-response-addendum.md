# Incident Response Addendum — AI

This addendum extends the company's existing IR plan for AI-specific incidents.

## Incident classes

| Class | Definition | Example |
|---|---|---|
| **A1 — Data exposure** | Sensitive data pasted into unapproved tool | Client PII into ChatGPT free tier |
| **A2 — Model output leak** | AI output published containing sensitive data | Hallucinated PII appears in customer email |
| **A3 — Prompt injection** | Adversarial input hijacked an AI agent | Malicious doc caused agent to exfiltrate |
| **A4 — Agent action error** | AI took a wrong action (sent, deleted, purchased) | Agent sent draft as final |
| **A5 — Model misuse** | Employee used AI to violate policy | Deceptive AI-generated content sent externally |
| **A6 — Vendor incident** | Vendor breach affecting our data | Provider notifies us of security event |
| **A7 — Bias / harm** | AI output caused discriminatory or harmful outcome | Screening tool produced biased scores |

## Response by class

### A1 — Data exposure
1. Reporter contacts Security via [SECURITY EMAIL] within 24 hours
2. Security confirms: what data, what tool, when, who else has access
3. Security requests deletion from vendor (if enterprise) or notes as unrecoverable (if consumer)
4. Legal assesses regulatory notification duty (GDPR: 72 hours to DPA; HIPAA: 60 days for large; state laws vary)
5. Affected parties notified per legal guidance
6. Employee coaching (not punitive on first report)

### A2 — Model output leak
1. Recall or retract the leaked output where possible
2. Investigate: was it a hallucination, or actual data in the model context?
3. If context-sourced, treat as A1
4. If hallucinated, note as a quality issue; add to eval set

### A3 — Prompt injection
1. Isolate the affected agent immediately (kill switch)
2. Determine blast radius: what tools did the agent have access to?
3. Preserve logs
4. Rotate any credentials the agent could have touched
5. Root cause: what input carried the injection? How did it evade defenses?
6. Publish an incident report to the Steering Committee within 5 business days

### A4 — Agent action error
1. Stop the agent
2. Undo the action if reversible (recall email, restore deleted data)
3. Notify the affected party if action reached outside the org
4. Investigate the decision path
5. Add a HITL checkpoint or guardrail before re-enabling

### A5 — Model misuse
1. Preserve evidence
2. Follow HR/legal escalation
3. Steering Committee reviews for policy gap

### A6 — Vendor incident
1. Acknowledge vendor notification
2. Assess: is our data affected? What data?
3. Legal reviews vendor's breach report against contract commitments
4. Follow through on any downstream customer notifications required

### A7 — Bias / harm
1. Suspend the affected workflow
2. Convene bias review (Steering Committee + Legal + Ethics if applicable)
3. Assess root cause: model, prompt, eval gap, data drift
4. Remediate before restart

## Communication tree

- **Reporter → Security** (within 24 hours of discovery)
- **Security → Legal, IT, Steering Committee** (within 24 hours of confirmation)
- **Steering Committee → CEO / GC** (within 48 hours if A1–A3 with material impact)
- **Company → Affected parties** (per legal guidance)
- **Company → Regulators** (per statutory deadlines)

## Tabletop exercise

Run a tabletop at least annually:

1. Choose an incident class
2. Announce the scenario to Security, Legal, IT, an AI Champion, and an executive
3. Time the response
4. Document gaps

## Post-incident

Every material incident produces:
- **Incident report** — timeline, root cause, blast radius, remediation
- **AUP update** if a policy gap contributed
- **Eval set update** — the incident scenario added as a regression test
- **Training update** — the case incorporated into next quarterly refresh

## Reporter protection

Reporters are protected from retaliation. First-time honest reports do not trigger discipline. Cover-ups do.
