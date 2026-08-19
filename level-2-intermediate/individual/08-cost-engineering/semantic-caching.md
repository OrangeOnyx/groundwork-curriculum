# Semantic Caching

Semantic caching answers a new request from a previous, meaningfully similar result instead of calling a model again. It is valuable for repetitive low-risk questions: “What is the office number?”, “How do I submit a maintenance request?”, or standardized lease policy explanations. It is dangerous when the answer depends on tenant, date, lease version, account state, or live work-order status.

A cache key must include the organization, authorization scope, workflow version, model/prompt version, policy version, source version, and normalized intent—not just the text embedding. Store the final answer, cited sources, confidence, creation time, and expiration. Never share entries across tenants or properties unless the content is deliberately public and identical.

Use a two-stage lookup: exact cache first, then semantic similarity above a conservative threshold. Require a matching intent and metadata scope. For Belle Realty, cached answers about a property’s office hours can be safe; a cached answer about late fees must include the exact lease/template version and may still require retrieval. Invalidate on policy, document, or prompt change. Time-bound live-data answers aggressively.

Measure hit rate, false-hit rate, cache cost, latency saved, and downstream correction rate. Review sampled hits before expanding scope. A wrong cached answer is worse than a slow fresh one because it appears confident and repeats at scale. Start with pre-approved FAQ answers and retrieval snippets, not open-ended agent outputs.

The rule: cache stable meaning, never cached assumptions about a person’s current situation.
