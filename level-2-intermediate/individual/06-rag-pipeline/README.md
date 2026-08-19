# RAG Pipeline: Lease Knowledge That Can Prove Its Work

Retrieval-augmented generation (RAG) is the system behind answers grounded in your documents. It is not “put PDFs in a vector database.” A usable Belle Realty lease RAG system must ingest documents correctly, preserve versions and page citations, retrieve the right chunks, reject weak evidence, and show the answer’s support.

Start with leases because they are high-value, repetitive, and version-sensitive. A tenant or operator question should retrieve the current signed lease and governing addenda for that tenant—not a semantically similar lease from another property. Metadata filters and authorization are as important as embeddings.

The pipeline has six stages: ingest, normalize, chunk, embed, retrieve, rerank, then answer with citations. Store source version and extraction status at every stage. If you cannot reproduce an answer from the document version that existed at the time, you do not have an operational RAG system.

Use the build guide first. Contextual retrieval and hybrid search are upgrades after you establish a baseline and a retrieval eval set. Retrieval quality, not model eloquence, determines whether this is useful.

Before adding complexity, run this design through a small representative eval and inspect the trace with the operator who will own failures. Make the boundary, escalation, and rollback visible in the product. That discipline will expose more useful work than another round of prompt cleverness.
