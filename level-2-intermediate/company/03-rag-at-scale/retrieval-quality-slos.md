# Retrieval Quality SLOs

Set SLOs that describe the retrieval system users depend on: active-document freshness, authorized-result correctness, gold-chunk recall@k, citation precision, answer groundedness, p95 retrieval latency, and index availability. Define an error budget and owner for each.

For example, legal lease answers may require 100% citation support, no cross-tenant results, and a strict freshness target after an approved document upload. A less critical marketing knowledge base can accept slower refresh. Track score slices by document type, scan quality, property, query intent, and language.

When an SLO fails, diagnose source data, metadata filters, chunking, lexical/vector retrieval, reranking, or answer policy in that order. Do not solve low recall by sending more irrelevant chunks to the model. Publish a simple status view for operators and tie material breaches to incident response.

## Operating standard
Make this practice operational, not aspirational. Assign one directly responsible owner and name the decision they can make without another meeting. Put the key measure, threshold, and review cadence in the owning team’s regular operating rhythm. A change to model, prompt, data scope, retrieval index, tool permission, or policy should be recorded with its expected impact and a rollback path. Preserve enough trace information to explain an individual bad outcome without exposing more tenant or deal data than necessary. Review a small sample of real runs with the people doing the work; dashboards reveal trends, but operators reveal missing context. When the rule is violated, capture the incident, contain impact, add an eval or control, and update this document if the standard itself was unclear. The point is repeatable judgment under real workload, not a one-time compliance exercise.
