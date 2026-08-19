# Judge Model Governance

Treat an LLM judge as a production dependency. Register its model, prompt, rubric, output schema, calibration set, known biases, thresholds, and human agreement metrics. Pin or monitor versions and re-calibrate after provider changes.

Use judges for bounded subjective criteria; pair them with deterministic validators for schemas, citations, permissions, dates, and policy flags. Blind judges to candidate model identity. Audit position, verbosity, and style bias. For high-stakes decisions, require human adjudication of a sample and all disputed cases.

When judge-human agreement drifts, pause automated release gating or raise review requirements. A judge that grades incorrectly at scale can hide the very regression the eval program exists to catch.

## Operating standard
Make this practice operational, not aspirational. Assign one directly responsible owner and name the decision they can make without another meeting. Put the key measure, threshold, and review cadence in the owning team’s regular operating rhythm. A change to model, prompt, data scope, retrieval index, tool permission, or policy should be recorded with its expected impact and a rollback path. Preserve enough trace information to explain an individual bad outcome without exposing more tenant or deal data than necessary. Review a small sample of real runs with the people doing the work; dashboards reveal trends, but operators reveal missing context. When the rule is violated, capture the incident, contain impact, add an eval or control, and update this document if the standard itself was unclear. The point is repeatable judgment under real workload, not a one-time compliance exercise.
