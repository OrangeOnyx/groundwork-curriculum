# Optimization Playbook

Optimize in this order: remove unnecessary model calls; use deterministic code for rules; reduce retrieved context; cache stable, authorized answers; batch offline work; route easy tasks to cheaper models; cap outputs; then consider fine-tuning or provider changes. Measure every change on quality, safety, latency, and unit economics.

Typical fixes: deduplicate document embeddings by checksum; retrieve six clauses instead of whole leases; use classifier confidence to avoid expensive synthesis; cancel parallel calls after a human gate; replace repeated policy prose with cached context. Never cut authorization, citations, audit traces, or emergency escalation to save money.

Keep an experiment log with hypothesis, baseline, eval result, rollout, and rollback. Cost work without quality gates becomes slow degradation. The best optimization is often deleting an agent step that never improved an outcome.

## Operating standard
Make this practice operational, not aspirational. Assign one directly responsible owner and name the decision they can make without another meeting. Put the key measure, threshold, and review cadence in the owning team’s regular operating rhythm. A change to model, prompt, data scope, retrieval index, tool permission, or policy should be recorded with its expected impact and a rollback path. Preserve enough trace information to explain an individual bad outcome without exposing more tenant or deal data than necessary. Review a small sample of real runs with the people doing the work; dashboards reveal trends, but operators reveal missing context. When the rule is violated, capture the incident, contain impact, add an eval or control, and update this document if the standard itself was unclear. The point is repeatable judgment under real workload, not a one-time compliance exercise.
