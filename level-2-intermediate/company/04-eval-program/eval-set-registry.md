# Eval Set Registry

Register every eval set with ID, owner, task, data classification, source provenance, license/consent status, version, split, rubric, metrics, and retention rule. Cases carry tags, risk tier, expected evidence, and whether human review is required. Access to tenant-derived cases follows the same controls as production data.

Do not edit a released set in place. Version it, describe what changed, and preserve prior scores. Separate development examples from locked regression examples. Track leakage: a case copied into prompts, demos, or fine-tuning data can no longer serve as an unbiased test.

A registry makes datasets discoverable and accountable. It should answer who can change a case, why a gold answer exists, and which workflows rely on it.

## Operating standard
Make this practice operational, not aspirational. Assign one directly responsible owner and name the decision they can make without another meeting. Put the key measure, threshold, and review cadence in the owning team’s regular operating rhythm. A change to model, prompt, data scope, retrieval index, tool permission, or policy should be recorded with its expected impact and a rollback path. Preserve enough trace information to explain an individual bad outcome without exposing more tenant or deal data than necessary. Review a small sample of real runs with the people doing the work; dashboards reveal trends, but operators reveal missing context. When the rule is violated, capture the incident, contain impact, add an eval or control, and update this document if the standard itself was unclear. The point is repeatable judgment under real workload, not a one-time compliance exercise.
