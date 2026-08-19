# Evaluate Tuned Models

Compare a tuned model against the current baseline on a locked, task-representative set. Report quality by critical slice, schema validity, citation/groundedness where applicable, safety behavior, latency, cost, and calibration. Do not accept a single average score or vendor training metric.

Test distribution shift: new property templates, scans, slang, incomplete records, prompts that ask for prohibited actions, and inputs outside the training taxonomy. Verify that the tuned model abstains or routes correctly instead of forcing a familiar-looking answer. Test for memorization and data leakage with canaries and held-out entities.

Launch in shadow mode, log disagreements with the baseline and staff, and keep an immediate fallback. Re-evaluate after policy changes and periodically as inputs drift. Fine-tuning is successful only if it improves the actual workflow enough to pay for ongoing data and governance work.

## Operating standard
Make this practice operational, not aspirational. Assign one directly responsible owner and name the decision they can make without another meeting. Put the key measure, threshold, and review cadence in the owning team’s regular operating rhythm. A change to model, prompt, data scope, retrieval index, tool permission, or policy should be recorded with its expected impact and a rollback path. Preserve enough trace information to explain an individual bad outcome without exposing more tenant or deal data than necessary. Review a small sample of real runs with the people doing the work; dashboards reveal trends, but operators reveal missing context. When the rule is violated, capture the incident, contain impact, add an eval or control, and update this document if the standard itself was unclear. The point is repeatable judgment under real workload, not a one-time compliance exercise.
