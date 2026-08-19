# Freshness vs. Cost

Freshness is not universally good. A signed lease should be indexed immediately because the system may answer contractual questions from it. A static property brochure can refresh weekly. A live maintenance status may be queried from the operational database at answer time rather than embedded at all. Choose a freshness objective per data class.

Define freshness as source-change-to-serving latency, then set targets: access revocations near real time; lease uploads within minutes; financial statements after validation; broad reference content nightly. Measure actual lag and use it in answers when relevant: “Lease index updated at…” is better than pretending data is current.

Avoid embedding volatile facts that can be fetched safely from the source of truth. An embedding index is a discovery layer, not a transaction system. For frequently edited material, use event-driven partial updates, debounce bursts, and TTLs for caches. Reserve full rebuilds for representation changes, not ordinary edits.

Balance cost using priority queues: high-risk or user-requested documents first, bulk backfills later. Coalesce repeated changes, skip unchanged checksums, cache embeddings by exact text and model version, and backpressure uploads when providers are constrained. Never defer deletion or permission revocation to save money.

Freshness decisions are product promises. Document them, expose them to operators, and test the ugly case: a lease addendum uploaded after a tenant asks a question.
