# 06 — RAG Knowledge Base

The retrieval layer. Where department copilots get their grounded facts.

## Files

- `knowledge-base-structure.md` — folder taxonomy, document standards, refresh rules
- `chunking-strategy.md` — how to split documents before embedding
- `permissions-model.md` — how to enforce source-system ACLs through retrieval

## Non-negotiables

1. One canonical source per topic
2. Every doc has an owner and review date
3. Permissions match source system
4. Every chunk has classification metadata
5. Adversarial retrieval tests before ship
