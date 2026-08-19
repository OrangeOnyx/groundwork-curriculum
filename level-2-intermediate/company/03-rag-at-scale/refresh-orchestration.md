# Refresh Orchestration

Run document changes through a versioned event pipeline: detect change, validate ownership, normalize, derive chunks, embed, validate counts, publish atomically, then retire old artifacts. A manifest tracks each source checksum and derived version. This prevents half-indexed leases from becoming answerable.

Prioritize revocations and current signed documents. Coalesce rapid edits, skip unchanged content, and queue expensive backfills separately. Use a new index version for corpus-wide embedding or chunking changes, evaluate it, then switch traffic by flag. Keep rollback possible and trace which index answered a request.

Monitor queue age, failed stages, freshness lag, active-versus-source version mismatch, and retrieval regression. Refresh work is a deploy pipeline, not a background mystery.

## Operating standard
Make this practice operational, not aspirational. Assign one directly responsible owner and name the decision they can make without another meeting. Put the key measure, threshold, and review cadence in the owning team’s regular operating rhythm. A change to model, prompt, data scope, retrieval index, tool permission, or policy should be recorded with its expected impact and a rollback path. Preserve enough trace information to explain an individual bad outcome without exposing more tenant or deal data than necessary. Review a small sample of real runs with the people doing the work; dashboards reveal trends, but operators reveal missing context. When the rule is violated, capture the incident, contain impact, add an eval or control, and update this document if the standard itself was unclear. The point is repeatable judgment under real workload, not a one-time compliance exercise.
