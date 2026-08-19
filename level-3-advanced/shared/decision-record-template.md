# AI Decision Record Template

**Decision title:**  
**Status:** proposed / accepted / superseded / retired  
**Date / owner / approvers:**  
**Decision expiry or review date:**  

## Context

Describe the customer problem, production constraints, and decision boundary. Include the affected workflows, properties or tenants, data classes, dependencies, security and safety considerations, expected volume, latency target, and unit-cost target. Link the relevant system card, evaluations, incident history, and vendor terms.

## Options considered

| Option | Benefits | Risks / constraints | Evidence | Estimated cost | Reversibility |
|---|---|---|---|---|---|
| | | | | | |

Do not compare only model quality. Include operational ownership, data residency, permission model, observability, failure modes, migration effort, and customer impact. For example, an open-weight deployment may lower marginal cost while increasing on-call and security burden.

## Decision

State exactly what will be used, by whom, for which cohort, and under which controls. Record the acceptance criteria: offline evaluation threshold, staged rollout plan, SLOs, guardrails, cost cap, and rollback condition. Name the person authorized to stop or reverse the decision.

## Consequences and follow-up

List accepted tradeoffs, unresolved risks, documentation updates, migrations, training, and time-bound follow-up actions. Link implementation pull requests, dashboards, feature flags, and launch evidence. A decision record should let a future operator understand why a configuration exists and when it must be reconsidered.
