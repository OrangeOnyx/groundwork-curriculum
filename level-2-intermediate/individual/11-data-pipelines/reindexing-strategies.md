# Reindexing Strategies

Reindex when a source changes or a derived representation becomes obsolete: new lease version, corrected OCR, different chunking, new embedding model, metadata bug, access-scope change, or retrieval schema update. Keep source version, chunker version, embedding model, and index version on every artifact so the reason is explicit.

Prefer selective reindexing. A changed lease should rebuild only that document and invalidate its previous active chunks. A revised chunker may require a corpus-wide rebuild, but run it into a new index namespace rather than mutating the live one. Validate retrieval metrics, access filters, cost, and latency, then switch a feature flag or alias. Keep the old index long enough for rollback and trace reproducibility.

Use a manifest to enumerate intended documents and completion state. Compare expected versus produced chunks, embeddings, and active source versions. Rebuild failures go to a queue; do not quietly omit them. Deletions and permission changes require immediate serving-layer enforcement even if physical vector deletion is asynchronous.

Test reindexing with known difficult leases: addenda, scans, duplicate templates, superseded documents, and revoked tenant access. Monitor index freshness lag, failed jobs, chunk count drift, retrieval recall, and storage cost. Reindexing is a deploy; treat it with the same change control as application migrations.
