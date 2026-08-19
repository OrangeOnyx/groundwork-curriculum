# RAG at Scale

Scaling RAG means preserving access boundaries and retrieval quality while documents, tenants, versions, and workloads grow. It does not mean adding more vectors. Multi-tenant isolation, refresh orchestration, and retrieval SLOs are the operating foundation.

Belle Realty’s primary rule is scoped retrieval: authorization and organization filters happen before search, and every result preserves document version and citation. Deal rooms need equivalent deal-level isolation. Shared knowledge requires explicit publication and ownership—not accidental visibility through embeddings.

The supporting documents cover tenancy, refreshes, and service objectives. Treat relevance and groundedness as reliability metrics, not UX decoration.

## Operating standard
Make this practice operational, not aspirational. Assign one directly responsible owner and name the decision they can make without another meeting. Put the key measure, threshold, and review cadence in the owning team’s regular operating rhythm. A change to model, prompt, data scope, retrieval index, tool permission, or policy should be recorded with its expected impact and a rollback path. Preserve enough trace information to explain an individual bad outcome without exposing more tenant or deal data than necessary. Review a small sample of real runs with the people doing the work; dashboards reveal trends, but operators reveal missing context. When the rule is violated, capture the incident, contain impact, add an eval or control, and update this document if the standard itself was unclear. The point is repeatable judgment under real workload, not a one-time compliance exercise.
