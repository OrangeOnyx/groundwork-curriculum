# Organization-Level Eval Strategy

Establish common minimums: schema validity, authorization safety, traceability, version capture, cost/latency measurement, and human escalation tests. Then require task metrics: emergency recall for triage, citation precision for RAG, false-complete rate for diligence, and exactness for extraction. Aggregate quality cannot replace critical-slice gates.

Maintain development, locked regression, adversarial, and production-sampled sets. Run smoke tests in change review, full tests nightly, and human calibration periodically. Treat vendor/model changes as releases. Store baselines and make deltas visible.

Assign owners for datasets, judges, and release decisions. Measure coverage of live intents and rate of newly discovered failures. An eval program without fresh examples becomes a benchmark game.

## Operating standard
Make this practice operational, not aspirational. Assign one directly responsible owner and name the decision they can make without another meeting. Put the key measure, threshold, and review cadence in the owning team’s regular operating rhythm. A change to model, prompt, data scope, retrieval index, tool permission, or policy should be recorded with its expected impact and a rollback path. Preserve enough trace information to explain an individual bad outcome without exposing more tenant or deal data than necessary. Review a small sample of real runs with the people doing the work; dashboards reveal trends, but operators reveal missing context. When the rule is violated, capture the incident, contain impact, add an eval or control, and update this document if the standard itself was unclear. The point is repeatable judgment under real workload, not a one-time compliance exercise.
