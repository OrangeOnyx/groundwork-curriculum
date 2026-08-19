# AI Observability Stack

Trace every agent run from user request through retrieval, tool calls, model calls, validation, human review, and final outcome. Use one trace ID and standard span names: `ingest`, `retrieve`, `rerank`, `model`, `tool`, `validate`, `approve`, `send`. Record versions, timing, token/cost data, policy decisions, and safe metadata.

Do not default to storing raw tenant messages, leases, or hidden reasoning. Store references, hashes, redacted excerpts, and access-controlled samples. Give operators a trace viewer that answers: what evidence was used, which tool was called, why was this escalated, what did it cost, and which version produced it?

Create dashboards for success rate, safety-gate rate, retrieval quality, schema failures, latency, cost per successful task, human overrides, and error classes. Alert on cross-tenant denials, emergency false negatives, cost spikes, retrieval freshness lag, and unusual tool enumeration. Observability without an owner and response playbook is a museum.

## Operating standard
Make this practice operational, not aspirational. Assign one directly responsible owner and name the decision they can make without another meeting. Put the key measure, threshold, and review cadence in the owning team’s regular operating rhythm. A change to model, prompt, data scope, retrieval index, tool permission, or policy should be recorded with its expected impact and a rollback path. Preserve enough trace information to explain an individual bad outcome without exposing more tenant or deal data than necessary. Review a small sample of real runs with the people doing the work; dashboards reveal trends, but operators reveal missing context. When the rule is violated, capture the incident, contain impact, add an eval or control, and update this document if the standard itself was unclear. The point is repeatable judgment under real workload, not a one-time compliance exercise.
