# Chunking Strategy

How to split documents before embedding. Get this wrong and RAG is useless.

## The default recipe

- **Chunk size:** 500 tokens (target)
- **Chunk overlap:** 100 tokens (20%)
- **Split on:** heading boundaries first, then paragraphs, then sentences
- **Preserve:** section titles as prefixes in each chunk
- **Minimum chunk:** 100 tokens (smaller merges into neighbor)
- **Maximum chunk:** 1000 tokens (larger splits at sentence boundary)

## Variant strategies

### Semantic chunking
Group sentences by embedding similarity, split when similarity drops below threshold. Slower to compute but better retrieval quality on prose-heavy corpora.

### Sliding window
Fixed-size windows with heavy overlap (50%). Good for narrow question-answer patterns. Wasteful on storage.

### Recursive splitting
Try to split on `\n\n`, then `\n`, then `. `, then space. Falls back gracefully.

### Document-type-aware
- Code files: split on function/class boundaries
- Markdown: split on H2/H3 boundaries
- PDFs: extract by page, then apply text splitting
- Slides: one slide = one chunk (or a group of related slides)
- Spreadsheets: rows or logical groups; consider text-serialization

## Chunk metadata

Every chunk carries:

```json
{
  "chunk_id": "sales-playbook-v3::obj-pricing::0",
  "doc_id": "sales-playbook-v3",
  "section_path": ["Objections", "Pricing"],
  "chunk_index": 0,
  "chunk_count": 5,
  "prev_chunk_id": null,
  "next_chunk_id": "sales-playbook-v3::obj-pricing::1",
  ... [all doc-level metadata inherited] ...
}
```

## Pre-embedding cleaning

Before embedding, strip / normalize:
- Boilerplate headers/footers
- Watermarks
- Extra whitespace
- Repeated navigational text
- Table of contents entries (dedupe against body)
- Signatures and email routing

## Contextual retrieval

Anthropic-recommended pattern: prepend each chunk with a short LLM-generated context summary (50–100 tokens) that says "This chunk is from [doc] discussing [topic]. Prior context is: [summary]." Improves retrieval by 30-50% but adds cost.

## Multi-representation

Store multiple representations of each chunk:
- Raw text (as-is)
- Cleaned text (whitespace normalized)
- Summary (LLM-generated 1-line summary — searched with a different embedding)
- Entities extracted (for filter-based retrieval)

Retrieve using summary embeddings, return raw text.

## Verification

For any RAG deployment, verify chunking with:

1. **Random inspection** — sample 20 chunks. Are they self-contained? Do they include enough context?
2. **Reconstruction test** — retrieve the top 5 chunks for a real question. Does the LLM produce a correct answer?
3. **Ground-truth eval** — for known answers, does the retrieval find the right chunk in top-5?

If retrieval@5 is below 80%, chunking or embedding needs work.
