# Contextual Retrieval: Make Chunks Understandable Alone

A chunk often loses the facts that make it meaningful. “Tenant shall provide notice within 30 days” is useless if the retrieved text omits the property, lease version, clause heading, and whether it concerns renewal or move-out. Contextual retrieval solves that by attaching compact, document-specific context before embedding and storing it with the chunk.

For Belle Realty, generate or deterministically build a context prefix such as: “Belle Realty | Oak Ridge Unit 204 | Lease executed 2026-02-01 | Addendum A | Section 18: Renewal and Non-Renewal.” Embed `prefix + chunk`; display the original chunk plus human-readable source metadata. This makes semantic retrieval distinguish a renewal notice from a maintenance notice without filling every answer prompt with repeated boilerplate.

Use deterministic metadata wherever possible. An LLM-generated context can enrich messy documents, but validate it and keep it separate from the source text. Do not let generated context introduce legal facts or replace citations. Record the context-generation version so you can reindex safely.

Context helps recall, not authorization. Still filter by organization, active lease, and caller scope before similarity search. It also does not fix overly broad chunks or poor OCR. Test it with queries that are ambiguous without headers: “How much notice?”, “Are pets allowed?”, “Who handles the filter?” Compare gold-chunk recall before and after.

The goal is not longer chunks. It is chunks that retain enough identity and purpose to be retrieved for the right reason.
