# Build Your Second Agent: Tenant Triage

> **Live code:** [`OrangeOnyx/support-triage-agent`](https://github.com/OrangeOnyx/support-triage-agent) — clone, run locally, then follow the walkthrough. See the [repos overview](../../repos/README.md) for how the four Level 2 repos fit together.

OTB tenant communications are a routing problem before they are a writing problem. A polished wrong reply is worse than no reply if a message describes a gas smell, water intrusion, a fair-housing issue, or a payment dispute. Build the triage layer first; only then let a model draft a response.

The agent receives an inbound message, property and unit context, recent maintenance tickets, payment state when authorized, and office-hours policy. It returns a typed disposition: intent, urgency, confidence, required human role, permitted next action, and a draft only when policy allows it. Emergency detection uses rules plus a conservative classifier. Anything with safety, habitability, legal, discrimination, lockout, threat, or low confidence becomes a human task.

This project teaches a crucial builder habit: separate classification, retrieval, action selection, and drafting. Your response writer should never decide whether to waive a fee or dispatch a vendor. Those are policy decisions exposed as constrained actions.

The walkthrough gives a concrete contract, gates, and eval approach. Ship in shadow mode first: compare its dispositions with what staff actually did, then improve the label definitions before sending any automated reply.

Before adding complexity, run this design through a small representative eval and inspect the trace with the operator who will own failures. Make the boundary, escalation, and rollback visible in the product. That discipline will expose more useful work than another round of prompt cleverness.
