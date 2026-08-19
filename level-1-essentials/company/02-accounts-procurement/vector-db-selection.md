# Vector Database Selection

A vector database stores embeddings for RAG. Pick one based on your existing stack.

## Options

### pgvector (Postgres extension)
- **Best for:** Teams already on Postgres (including Supabase, RDS, Neon)
- **Pros:** No new infra, transactional consistency with relational data, cheap
- **Cons:** Slower at 100M+ vectors, requires tuning (HNSW / IVFFlat)
- **Cost:** Marginal on existing Postgres

### Pinecone
- **Best for:** Mid-market to enterprise, managed simplicity
- **Pros:** Fastest to production, excellent DX, serverless option, hybrid search
- **Cons:** SaaS lock-in, cost at scale
- **Cost:** Serverless starts free; enterprise $$$

### Weaviate
- **Best for:** Complex retrieval needs, GraphRAG use cases
- **Pros:** Rich schema, hybrid search built-in, open source + cloud
- **Cons:** Steeper learning curve
- **Cost:** Cloud pricing tiered; self-host free

### Qdrant
- **Best for:** Rust performance, on-prem/self-host
- **Pros:** Very fast, small footprint, open source
- **Cons:** Smaller ecosystem than Pinecone/Weaviate
- **Cost:** Self-host free; cloud tiered

### Milvus / Zilliz
- **Best for:** Massive scale (billions of vectors)
- **Pros:** Battle-tested at hyperscale
- **Cons:** Operational complexity
- **Cost:** Self-host or Zilliz Cloud

### Chroma
- **Best for:** Prototypes, local dev
- **Pros:** Zero-config, Python-native
- **Cons:** Not built for production scale
- **Cost:** Free

### LanceDB
- **Best for:** Data-lake-native workloads
- **Pros:** Works on object storage, no separate server
- **Cons:** Newer ecosystem
- **Cost:** Free / storage cost only

## Decision framework

Ask three questions:

1. **How many vectors?**
   - < 1M: pgvector, Chroma, or anything else — all work
   - 1M–100M: Pinecone, Weaviate, Qdrant
   - 100M+: Milvus, Weaviate, Pinecone Enterprise
   - Continuous growth: managed (Pinecone, Weaviate Cloud)

2. **Where does the data live?**
   - Already in Postgres: pgvector wins
   - Object storage / data lake: LanceDB, Weaviate
   - Standalone: Pinecone, Qdrant, Weaviate

3. **What retrieval patterns?**
   - Simple k-NN: any option
   - Hybrid (semantic + lexical): Weaviate, Qdrant, Pinecone all good
   - Graph-augmented: Weaviate, Neo4j GraphRAG
   - Multi-tenant with strict permissions: Weaviate, Pinecone (namespaces)

## Recommended defaults

- **Small team, Postgres already:** pgvector
- **Mid-market, no existing infra:** Pinecone Serverless
- **Large enterprise, self-host preference:** Weaviate or Qdrant
- **Prototype:** Chroma → migrate later

## Setup checklist

- [ ] Chunking strategy defined (see `company/06-rag-knowledge-base/chunking-strategy.md`)
- [ ] Embedding model selected (start with OpenAI text-embedding-3-large or Voyage AI voyage-3)
- [ ] Namespace / partition strategy per tenant, per doc source, per permission group
- [ ] Metadata schema defined (source, permissions, date, tags)
- [ ] Backups / disaster recovery
- [ ] Access control (who can query, who can write)
- [ ] Cost tracking per namespace
