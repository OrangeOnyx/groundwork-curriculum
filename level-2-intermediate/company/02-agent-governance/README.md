# Agent Governance

Governance is how you decide which agents may exist, what they may do, and how they are stopped. It is not a committee that reviews every prompt change. Apply more control as impact rises: a lease search assistant needs evidence and access controls; an agent proposing payment changes needs formal approval, audit, and a kill switch.

Every agent has an owner, user, purpose, risk tier, data classification, tool list, eval gates, cost budget, launch status, and retirement plan. Record these in a registry. If nobody owns an agent, it should not be running.

The three supporting documents define a lightweight review board, a lifecycle, and an incident-ready kill switch. The principle is fast experimentation inside firm boundaries.

## Operating standard
Make this practice operational, not aspirational. Assign one directly responsible owner and name the decision they can make without another meeting. Put the key measure, threshold, and review cadence in the owning team’s regular operating rhythm. A change to model, prompt, data scope, retrieval index, tool permission, or policy should be recorded with its expected impact and a rollback path. Preserve enough trace information to explain an individual bad outcome without exposing more tenant or deal data than necessary. Review a small sample of real runs with the people doing the work; dashboards reveal trends, but operators reveal missing context. When the rule is violated, capture the incident, contain impact, add an eval or control, and update this document if the standard itself was unclear. The point is repeatable judgment under real workload, not a one-time compliance exercise.
