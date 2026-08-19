# Ingestion Patterns

Use an event-driven pipeline for documents and operational records. When a lease is uploaded, write a source record first, calculate a checksum, assign organization/property/lease scope, and enqueue processing. Workers extract text, run OCR if needed, classify document type, normalize metadata, create chunks, embed, and mark the index version ready. Each stage writes a status and idempotency key.

Separate raw, normalized, and derived storage. Raw is the immutable original PDF or export. Normalized is page text, tables, metadata, and source offsets. Derived is chunks, embeddings, summaries, clause proposals, and search indexes. Never overwrite raw evidence with model output. Derived artifacts name the source checksum and pipeline version that created them.

Use a queue with bounded concurrency, retryable versus permanent errors, and a dead-letter queue. Network timeout: retry. Password-protected PDF, unreadable scan, missing ownership metadata: mark for review. Do not continually retry semantic failures. Emit events for each transition so the application can show users “uploaded,” “processing,” “needs review,” or “ready.”

For database records, use change-data capture or application outbox events rather than periodic full scans when possible. Debounce rapid edits and coalesce events by entity. Make deletes and access revocations high priority: remove or filter derived content immediately, then clean physical indexes. Ingestion is a security system as much as it is an ETL system.
