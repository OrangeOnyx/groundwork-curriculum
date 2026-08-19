# Team Budgets and Showback

Assign cost centers by product and workflow: Belle Realty ingestion, lease RAG, tenant triage, Deal Leverage diligence, shared platform, and experiments. Record model, embedding, OCR, storage, reranker, cache, and human-review costs. Showback reports usage to owners even before formal chargeback.

Define monthly envelopes plus per-request ceilings for expensive paths. Separate production, staging, and experimentation. Budget alerts should identify the route and version causing change, not merely say “AI spend rose.” Review cost per successful workflow alongside raw spend; adoption can legitimately raise total cost while reducing unit cost.

Avoid incentives that encourage teams to hide usage or disable safety checks. Give owners an optimization checklist and escalation path for justified overages. Budgets are a planning instrument, not a substitute for observability.

## Operating standard
Make this practice operational, not aspirational. Assign one directly responsible owner and name the decision they can make without another meeting. Put the key measure, threshold, and review cadence in the owning team’s regular operating rhythm. A change to model, prompt, data scope, retrieval index, tool permission, or policy should be recorded with its expected impact and a rollback path. Preserve enough trace information to explain an individual bad outcome without exposing more tenant or deal data than necessary. Review a small sample of real runs with the people doing the work; dashboards reveal trends, but operators reveal missing context. When the rule is violated, capture the incident, contain impact, add an eval or control, and update this document if the standard itself was unclear. The point is repeatable judgment under real workload, not a one-time compliance exercise.
