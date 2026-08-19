# Parallel vs. Serial Agent Calls

Run calls in parallel only when they are independent and their combined outputs can be validated together. Examples: classify a tenant message while retrieving open tickets; retrieve lexical and vector candidates simultaneously; extract financial, legal, and insurance checklist sections from separate documents. Parallelism lowers wall-clock latency but raises burst cost and can complicate cancellation.

Use serial calls when later work depends on verified evidence from earlier work. A lease answer should identify the authorized active lease before retrieving clauses. A write proposal should pass policy validation before any draft is generated. A verifier should inspect the actual extractor output, not a competing guess. Serial steps preserve causality and reduce wasted requests.

Design a join contract for parallel work: each branch has a deadline, schema, confidence, and failure state. The joiner knows how to proceed if a noncritical branch times out and when to fail closed. Cancel remaining work after an emergency rule fires or a human gate is required. Do not wait for decorative enrichments while a tenant needs an escalation.

Measure p50/p95 latency, duplicate work, cancellation success, cost, and quality. Parallel calls are not free just because they are faster. Prefer a simple dependency graph you can trace over a swarm of agents that all read the same context.
