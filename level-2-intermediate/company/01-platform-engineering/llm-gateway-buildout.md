# LLM Gateway Buildout

Put all provider calls behind a gateway. The gateway accepts a normalized request: authenticated actor, organization, workflow, model policy, messages or structured inputs, schema, budget, and trace context. It chooses an allowed provider/model, applies retries and timeouts, records tokens and cost, and returns a normalized response. Applications never hold broad provider credentials.

Use policies, not arbitrary model names. `tenant_triage_classifier` can use a fast approved model with a cost cap; `lease_verifier` can use a higher-accuracy model; sandbox experiments require an explicit flag. Enforce maximum context, output, requests, and concurrent calls. Support fallback only where schemas and evals prove compatibility.

The gateway must preserve provider response IDs, model version, cache status, latency, stop reason, and error class. Redact sensitive content in logs by default. Add per-workflow kill switches and organization budgets. Test provider outage, malformed schema, throttling, runaway retry, and model alias drift.

A gateway is where model choice becomes governable infrastructure instead of an application secret.

## Operating standard
Make this practice operational, not aspirational. Assign one directly responsible owner and name the decision they can make without another meeting. Put the key measure, threshold, and review cadence in the owning team’s regular operating rhythm. A change to model, prompt, data scope, retrieval index, tool permission, or policy should be recorded with its expected impact and a rollback path. Preserve enough trace information to explain an individual bad outcome without exposing more tenant or deal data than necessary. Review a small sample of real runs with the people doing the work; dashboards reveal trends, but operators reveal missing context. When the rule is violated, capture the incident, contain impact, add an eval or control, and update this document if the standard itself was unclear. The point is repeatable judgment under real workload, not a one-time compliance exercise.
