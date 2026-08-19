# Multi-Tenant RAG

Store tenant and organization identity as mandatory metadata on every source, chunk, embedding, cache entry, and trace. Enforce it in the serving path before lexical/vector search, reranking, and context assembly. Do not depend on a prompt that says “only use this tenant.” The database/vector layer must reject unauthorized content.

Use a shared index with hard metadata filters only if the store can prove filter enforcement and you test it. For higher isolation needs, use per-organization namespaces or collections. Access revocation must remove serving eligibility immediately, even when asynchronous cleanup follows. Preserve source version, document status, and visibility role.

Test with adversarial queries, guessed IDs, broad semantic searches, cached answers, and reranker inputs. Add canary chunks that should never cross a boundary. Log denial decisions without leaking existence. Multi-tenant RAG is an authorization system that happens to use retrieval.

## Operating standard
Make this practice operational, not aspirational. Assign one directly responsible owner and name the decision they can make without another meeting. Put the key measure, threshold, and review cadence in the owning team’s regular operating rhythm. A change to model, prompt, data scope, retrieval index, tool permission, or policy should be recorded with its expected impact and a rollback path. Preserve enough trace information to explain an individual bad outcome without exposing more tenant or deal data than necessary. Review a small sample of real runs with the people doing the work; dashboards reveal trends, but operators reveal missing context. When the rule is violated, capture the incident, contain impact, add an eval or control, and update this document if the standard itself was unclear. The point is repeatable judgment under real workload, not a one-time compliance exercise.
