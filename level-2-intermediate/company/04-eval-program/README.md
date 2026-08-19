# Organization-Level Evaluation Program

An eval program gives every AI workflow a consistent way to prove quality, safety, cost, and change impact. It provides shared tooling and governance without forcing all teams into one generic score. Each product still defines its critical failures.

Centralize dataset registry, trace format, runner, judge governance, and release gates. Decentralize task rubrics and domain examples to the people who understand leases, tenants, diligence, and operations. Add production failures back into curated data after review.

The program is successful when builders can answer: which version improved what, on which slice, at what cost, and what failures remain unacceptable.

## Operating standard
Make this practice operational, not aspirational. Assign one directly responsible owner and name the decision they can make without another meeting. Put the key measure, threshold, and review cadence in the owning team’s regular operating rhythm. A change to model, prompt, data scope, retrieval index, tool permission, or policy should be recorded with its expected impact and a rollback path. Preserve enough trace information to explain an individual bad outcome without exposing more tenant or deal data than necessary. Review a small sample of real runs with the people doing the work; dashboards reveal trends, but operators reveal missing context. When the rule is violated, capture the incident, contain impact, add an eval or control, and update this document if the standard itself was unclear. The point is repeatable judgment under real workload, not a one-time compliance exercise.
