# Platform Engineering for AI

Company AI should run on a shared platform, not dozens of hidden API keys and copy-pasted prompts. The platform owns model access, identity, routing, observability, configuration, budgets, and incident controls. Product teams own workflow behavior and evals.

For Adam’s portfolio, start small: one LLM gateway, one tracing convention, one secrets boundary, and one approved configuration path. Every request gets an organization, workflow, prompt version, model route, trace ID, cost record, and policy outcome. This is enough to compare Belle Realty lease extraction with Deal Leverage diligence without conflating data or spend.

The goal is not a grand internal platform. It is a paved road that makes the safe option the easy option: typed schemas, tenant-scoped tools, versioned prompts, auditable retrieval, and reversible rollouts.

## Operating standard
Make this practice operational, not aspirational. Assign one directly responsible owner and name the decision they can make without another meeting. Put the key measure, threshold, and review cadence in the owning team’s regular operating rhythm. A change to model, prompt, data scope, retrieval index, tool permission, or policy should be recorded with its expected impact and a rollback path. Preserve enough trace information to explain an individual bad outcome without exposing more tenant or deal data than necessary. Review a small sample of real runs with the people doing the work; dashboards reveal trends, but operators reveal missing context. When the rule is violated, capture the incident, contain impact, add an eval or control, and update this document if the standard itself was unclear. The point is repeatable judgment under real workload, not a one-time compliance exercise.
