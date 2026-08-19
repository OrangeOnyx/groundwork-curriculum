# Build RAG Over Belle Realty Leases

## Ingest and normalize
Create a document record with tenant, property, lease, document type, version, effective date, checksum, access scope, and extraction status. Extract page text; retain source PDF and page offsets. For scanned files, store OCR confidence per page. Do not embed a lease until its identity and scope are known. Addenda must link to the base lease and carry a precedence field.

## Chunk with legal structure
Chunk by section heading, numbered clause, page, and paragraph—not fixed token windows alone. Aim for 250–500 tokens with 40–80 token overlap only where a clause crosses a boundary. Each chunk stores `document_id`, `lease_id`, page range, heading path, effective date, and text. A clause such as “Notice” should remain intact. A generic vector match for the word “notice” is not enough without the correct lease filter.

## Retrieve, rerank, answer
Filter first by organization and caller authorization, then tenant/lease when the question is contextual. Retrieve 20 candidates with vector plus keyword search. Rerank the top candidates using a cross-encoder or small judge tuned for query–passage relevance, then pass the best 3–6 to the answer model. The answer contract: cite every factual claim, quote when stakes are high, state document version, and say “I can’t find that” when evidence is weak.

## Guardrails and evaluation
Require a minimum retrieval score and a source from an active, signed document before answering policy questions. Never silently use a superseded lease. Build a test set of real questions with expected source sections, including misleading and unanswerable questions. Measure recall@k for the gold chunk, citation correctness, grounded answer rate, abstention correctness, latency, and cost. Diagnose retrieval before changing prompts. Most RAG failures are bad metadata, chunks, or filters—not a lack of clever instructions.
