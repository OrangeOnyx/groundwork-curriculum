# When to Fine-Tune

Fine-tune when the task is narrow, repeated, and stable: classify a well-defined OTB message taxonomy, extract a consistent internal document format, or produce a tightly controlled output style. Do not fine-tune to memorize current leases, replace retrieval, solve live factual questions, or bypass human approval.

Before training, prove a baseline using prompt, few-shot examples, retrieval, and a capable model. Identify the persistent error slice and estimate volume. If a prompt/routing change fixes it, do that. If a model repeatedly misses domain conventions despite clear examples and the workflow has thousands of runs, training may be justified.

Require data rights, privacy review, a locked eval set, a rollback route, and a cost model that includes labeling and maintenance. Fine-tuned models can encode stale policy or sensitive patterns. The decision should be an evidence-backed product investment, not an attempt to make a model “know the business.”

## Operating standard
Make this practice operational, not aspirational. Assign one directly responsible owner and name the decision they can make without another meeting. Put the key measure, threshold, and review cadence in the owning team’s regular operating rhythm. A change to model, prompt, data scope, retrieval index, tool permission, or policy should be recorded with its expected impact and a rollback path. Preserve enough trace information to explain an individual bad outcome without exposing more tenant or deal data than necessary. Review a small sample of real runs with the people doing the work; dashboards reveal trends, but operators reveal missing context. When the rule is violated, capture the incident, contain impact, add an eval or control, and update this document if the standard itself was unclear. The point is repeatable judgment under real workload, not a one-time compliance exercise.
