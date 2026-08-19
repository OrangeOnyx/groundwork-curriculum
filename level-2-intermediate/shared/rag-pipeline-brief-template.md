# RAG Pipeline Brief Template

**Question and user:** [who asks what decision-support question].  
**Corpus:** source types, owner, authority, access labels, refresh target, retention.  
**Non-goals:** [what RAG must not answer or decide].  
**Ingestion:** source ID, checksum, extraction/OCR, normalized metadata, raw storage.  
**Chunking:** structural rule, size/overlap, required metadata, version.  
**Indexing:** embedding model, lexical index, namespace/filter strategy, active version.  
**Retrieval:** authorization filters, query rewrite policy, top-k, hybrid method, reranker.  
**Answer contract:** source citations, abstention threshold, freshness display, forbidden claims.  
**Evaluation:** gold queries, recall@k, citation precision, groundedness, latency, cost.  
**Operations:** reindex trigger, deletion/revocation path, SLOs, owner, rollback.

## Example: Belle lease Q&A
Users: authorized staff answering lease-policy questions. Corpus: signed leases and governing addenda, with tenant/property scope and effective dates. Chunk by numbered clause and heading, preserve pages and precedence. Filter by organization and active lease before hybrid retrieval; rerank top 20 and answer from 3–6 passages. Every claim cites document/page; if no active evidence exists, return an abstention and review path. Targets: 100% authorized-result correctness and citation support; measure gold-clause recall@5, p95 latency, and cost per grounded answer. An addendum upload triggers selective reindex; permission revocation immediately removes serving eligibility.

**Completion check:** include one unanswerable query and one cross-tenant request in the launch set; both must fail safely with an observable trace.
