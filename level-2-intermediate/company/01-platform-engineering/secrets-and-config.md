# Secrets and Configuration

Keep secrets in a managed secret store, injected at runtime with least privilege and rotation support. Never place provider keys, Supabase service keys, webhook secrets, or tenant credentials in prompts, client bundles, logs, eval fixtures, or source control. Give each environment separate credentials and make production writes impossible from local development by default.

Configuration is different from secrets. Store model routes, prompt versions, thresholds, feature flags, budgets, and tool allowlists in versioned, reviewed configuration. Validate config schemas at deploy time. Every request should record the effective config version so behavior can be reproduced.

Scope keys by service and purpose. An ingestion worker should not be able to send tenant messages; an MCP read server should not have service-role write authority. Rotate after exposure, revoke on offboarding, and audit secret access. Use canary credentials to detect accidental disclosure.

The operational test is simple: if a trace, screenshot, or support export leaks, does it expose something an attacker can use? Design for no.

## Operating standard
Make this practice operational, not aspirational. Assign one directly responsible owner and name the decision they can make without another meeting. Put the key measure, threshold, and review cadence in the owning team’s regular operating rhythm. A change to model, prompt, data scope, retrieval index, tool permission, or policy should be recorded with its expected impact and a rollback path. Preserve enough trace information to explain an individual bad outcome without exposing more tenant or deal data than necessary. Review a small sample of real runs with the people doing the work; dashboards reveal trends, but operators reveal missing context. When the rule is violated, capture the incident, contain impact, add an eval or control, and update this document if the standard itself was unclear. The point is repeatable judgment under real workload, not a one-time compliance exercise.
