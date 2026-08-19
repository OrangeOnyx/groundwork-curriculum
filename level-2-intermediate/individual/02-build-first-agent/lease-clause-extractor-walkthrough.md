# Belle Realty Lease Clause Extractor: Real Build Walkthrough

## Job and boundary
Input is a lease PDF and `lease_id`. Output is one JSON object per target clause: `{clause_type, value, normalized_value, quote, page, confidence, evidence_chunk_id, status}`. Target fields: rent, term dates, late fee, grace period, deposit, pets, smoking, notice, renewal, utilities, maintenance, subletting, and HOA restrictions. The agent proposes; the app writes only validated proposals.

## Architecture
1. Ingest the file and retain page text plus page images for scans.
2. Split by page, headings, and numbered sections; preserve `lease_id`, page, and character offsets.
3. `find_clause(query, lease_id)` returns at most six cited chunks. `get_page(page)` returns the full page when a boundary crosses chunks.
4. The extractor selects evidence and emits strict JSON. A verifier receives the candidate and the cited text only, then returns `verified`, `repair`, or `needs_human`.
5. A validator rejects malformed dates, money without currency, unsupported quotes, duplicate clause types, and confidence over 0.95 without an exact quote.

## Tool definitions
`find_clause` is read-only, filters by the supplied lease, and cannot search other tenants. `get_page` accepts a page number. `create_review_task` stores evidence and a reason but cannot mark a lease final. The model never calls raw SQL, storage, email, or a write endpoint.

## Error handling
Treat OCR confidence under 0.88, absent page citations, conflicting addenda, handwritten edits, and multi-column corruption as review conditions. Retry transient tool failures once with an idempotency key. Never retry a semantic failure blindly; save the trace and route it to the eval corpus. If an addendum supersedes a base lease, return both citations and `status: conflict` until a reviewer resolves precedence.

## Eval set and score
Create 30 leases with a gold record per clause. Score exact normalized value, correct source page, quote support, and correct abstention. Weight money, dates, pet policy, and notice periods highest. Ship only when critical-field precision is at least 98%, citation support is 100%, and every unsupported answer abstains.

## Cost
Process once, store outputs, and re-run only changed files. Use a cheap model to locate likely clauses and a stronger one only for ambiguous extraction or verification. Track cost per lease, per successful clause, and per human-review avoidance. A $0.15 extraction that prevents a 10-minute manual read is good; a $0.15 extraction that silently changes a notice period is not.
