# Escalation Across Teams

An agent escalation must create an accountable handoff, not an orphaned notification. Define trigger, severity, destination role, required context, SLA, and acknowledgement behavior for each category: maintenance emergency, lease/legal question, payment dispute, fair-housing concern, diligence blocker, security incident, and platform failure.

Pass a compact packet: source message or document link, classification, confidence, citations, prior actions, requested decision, tenant/property/deal IDs, and trace ID. Do not rely on the receiving team to reconstruct context from a chat log. The agent must stop acting after escalation unless policy explicitly allows a safe acknowledgement.

Measure time to acknowledgement, time to resolution, routing correctness, reassignment rate, and repeated escalations. Review missed or bounced handoffs as incidents. Cross-team automation succeeds when it reduces coordination loss without blurring who owns the decision.

## Operating standard
Make this practice operational, not aspirational. Assign one directly responsible owner and name the decision they can make without another meeting. Put the key measure, threshold, and review cadence in the owning team’s regular operating rhythm. A change to model, prompt, data scope, retrieval index, tool permission, or policy should be recorded with its expected impact and a rollback path. Preserve enough trace information to explain an individual bad outcome without exposing more tenant or deal data than necessary. Review a small sample of real runs with the people doing the work; dashboards reveal trends, but operators reveal missing context. When the rule is violated, capture the incident, contain impact, add an eval or control, and update this document if the standard itself was unclear. The point is repeatable judgment under real workload, not a one-time compliance exercise.
