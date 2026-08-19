# Data Pipelines: The Work Before AI Looks Smart

Agents and RAG are downstream of data operations. If Belle Realty leases are duplicated, incorrectly scoped, stale, or missing page text, no model choice will produce trustworthy answers. The data pipeline owns ingestion, normalization, identity, versioning, enrichment, indexing, retries, and freshness.

Treat every source file and record as an event with a stable ID, checksum, source timestamp, owner, access scope, and processing state. Make work idempotent: a retry should not create duplicate lease chunks, embeddings, or diligence rows. Separate the raw source, normalized representation, derived artifacts, and user-facing answer index. This makes reprocessing safe when OCR, chunking, embeddings, or policies change.

Use queues for slow or bursty work, dead-letter failures that need inspection, and explicit backoff for provider limits. Reindexing must be selective and versioned. A new chunker should not force you to lose the prior index before the replacement is validated.

The guides describe proven ingestion patterns, reindex strategies, and the actual tradeoff between fresh information and compute spend. Your pipeline should make “what changed and what answered from it?” easy to answer.

Before adding complexity, run this design through a small representative eval and inspect the trace with the operator who will own failures. Make the boundary, escalation, and rollback visible in the product. That discipline will expose more useful work than another round of prompt cleverness.
