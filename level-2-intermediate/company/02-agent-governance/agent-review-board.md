# Agent Review Board

Use a small review board for medium- and high-risk agents: product owner, technical owner, security/privacy reviewer, and operations representative. Review the agent brief, intended users, data scope, tools, write proposals, human gates, eval evidence, cost ceiling, and rollback plan. Low-risk internal drafts can use an asynchronous checklist; do not turn every experiment into a meeting.

Classify risk by impact and reversibility. Any agent touching tenant records, money, legal terms, fair-housing matters, external communication, or cross-team knowledge needs a documented decision. Require a demo against adversarial cases, not only happy paths. Approval expires when core data scope, side effects, model family, or tool permissions materially change.

The board should reject vague products: “an assistant for operations” has no testable boundary. It should also provide an approved pattern library so teams can move faster next time. Governance earns trust by making safe deployment quicker than inventing controls from scratch.

## Operating standard
Make this practice operational, not aspirational. Assign one directly responsible owner and name the decision they can make without another meeting. Put the key measure, threshold, and review cadence in the owning team’s regular operating rhythm. A change to model, prompt, data scope, retrieval index, tool permission, or policy should be recorded with its expected impact and a rollback path. Preserve enough trace information to explain an individual bad outcome without exposing more tenant or deal data than necessary. Review a small sample of real runs with the people doing the work; dashboards reveal trends, but operators reveal missing context. When the rule is violated, capture the incident, contain impact, add an eval or control, and update this document if the standard itself was unclear. The point is repeatable judgment under real workload, not a one-time compliance exercise.
