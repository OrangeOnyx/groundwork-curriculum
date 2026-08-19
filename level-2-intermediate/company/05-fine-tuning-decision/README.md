# Fine-Tuning Decision

Fine-tuning changes model behavior through training. It is not the default fix for weak retrieval, vague policy, bad tool design, or missing evals. For most Belle Realty and Deal Leverage workflows, prompt discipline, structured outputs, RAG, and routing produce more value with less operational burden.

Fine-tune only when a stable, high-volume task has a large, lawful, high-quality labeled dataset; prompting has plateaued; and the gain is measurable on a locked eval set. You then own dataset provenance, privacy, training version, safety regressions, deployment, and rollback.

Use the decision guide, dataset prep rules, and tuned-model evaluation before approving a training run. A smaller tuned model can be a strong cost move, but only after you prove it preserves the behavior that matters.

## Operating standard
Make this practice operational, not aspirational. Assign one directly responsible owner and name the decision they can make without another meeting. Put the key measure, threshold, and review cadence in the owning team’s regular operating rhythm. A change to model, prompt, data scope, retrieval index, tool permission, or policy should be recorded with its expected impact and a rollback path. Preserve enough trace information to explain an individual bad outcome without exposing more tenant or deal data than necessary. Review a small sample of real runs with the people doing the work; dashboards reveal trends, but operators reveal missing context. When the rule is violated, capture the incident, contain impact, add an eval or control, and update this document if the standard itself was unclear. The point is repeatable judgment under real workload, not a one-time compliance exercise.
