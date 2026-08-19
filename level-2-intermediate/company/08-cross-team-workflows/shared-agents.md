# Shared Agents

A shared agent should provide a narrow capability with a stable contract: lease clause retrieval, document classification, policy-safe drafting, or contact normalization. It exposes typed inputs/outputs, scopes access by caller, publishes an eval baseline, and has an owner. It does not become a universal assistant with hidden privileges.

Version the contract and support consumers through a gateway or MCP layer. Require teams to pass their organization context and receive only authorized results. Track each consuming workflow’s cost, errors, and model policy separately. Changes that alter semantics need compatibility review.

Create a catalog with purpose, owner, risk tier, data scope, examples, SLOs, and integration path. Shared agents save work only when callers can trust their boundaries.

## Operating standard
Make this practice operational, not aspirational. Assign one directly responsible owner and name the decision they can make without another meeting. Put the key measure, threshold, and review cadence in the owning team’s regular operating rhythm. A change to model, prompt, data scope, retrieval index, tool permission, or policy should be recorded with its expected impact and a rollback path. Preserve enough trace information to explain an individual bad outcome without exposing more tenant or deal data than necessary. Review a small sample of real runs with the people doing the work; dashboards reveal trends, but operators reveal missing context. When the rule is violated, capture the incident, contain impact, add an eval or control, and update this document if the standard itself was unclear. The point is repeatable judgment under real workload, not a one-time compliance exercise.
