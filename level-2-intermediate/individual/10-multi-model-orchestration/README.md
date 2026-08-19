# Multi-Model Orchestration

Different models are good at different jobs, but adding models is not the same as adding reliability. Orchestration should make a workflow cheaper, safer, or measurably more accurate. If it only makes the architecture more impressive, delete it.

A practical Belle Realty stack has a fast structured classifier, an embedding/reranking path, a stronger evidence synthesizer, and deterministic policy services. Route by task and risk. Use a council only for bounded, high-value ambiguity where independent viewpoints can be judged against evidence. Run calls in parallel when they do not depend on one another; keep dependent evidence steps serial.

Every route needs an observable reason, fallback, timeout, budget, and eval. Model names are configuration, not product logic. Pin versions where possible and route through a gateway so you can change providers without rewriting agents.

The next documents cover router design, councils, and concurrency decisions. The default remains one capable model with a good retrieval and policy layer. Add another only when the eval tells you what it fixes.

Before adding complexity, run this design through a small representative eval and inspect the trace with the operator who will own failures. Make the boundary, escalation, and rollback visible in the product. That discipline will expose more useful work than another round of prompt cleverness.
