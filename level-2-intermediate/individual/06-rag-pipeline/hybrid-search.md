# Hybrid Search: Keywords and Meaning Together

Vector search understands paraphrases. Keyword search is excellent at exact tokens: unit numbers, clause names, “Section 14,” dollar amounts, vendor IDs, and unusual legal terms. Belle Realty needs both. A tenant asking “Can I have a dog?” should find a pet clause even if the lease says “domestic animals.” An operator asking for “$75 late fee” should find the exact amount.

Run lexical and vector retrieval over the same authorized corpus. Normalize each result score independently, then combine them with a weighted method such as reciprocal rank fusion. Start with equal influence; tune only against an eval set. Apply metadata filters before both searches, not after. If a request concerns a specific lease, a perfect semantic match in another tenant’s lease is still an invalid result.

Rerank the merged top 20 with a relevance model that sees query, passage, and selected metadata. Preserve the originating search signals for debugging: lexical rank, vector rank, final rank, filter set, and document version. This tells you whether failures come from vocabulary, embedding, or reranking.

Use hybrid search when exact identifiers and natural-language questions coexist. Do not use it as an excuse to dump 50 chunks into a model context. Retrieval should be ruthless: return a small, diverse, cited evidence set. Evaluate gold-chunk recall@5 and recall@10, plus answer groundedness. If keyword search consistently wins for clause lookup, keep it. Architecture should follow corpus behavior, not fashion.
