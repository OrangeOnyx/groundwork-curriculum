# LLM as Judge

An LLM judge is useful when the criterion is linguistic or comparative and a human rubric can be written clearly. It is not an oracle. Use it to rate whether a tenant draft follows tone and policy, whether an answer is supported by supplied evidence, or which of two summaries is more complete. Do not use it as the only judge of financial, legal, safety, or exact extraction facts.

Give the judge a narrow packet: task, rubric, candidate answer, approved evidence, and required JSON verdict. Ask it to identify specific violated criteria and evidence, not to produce vague praise. Example fields: `grounded`, `citation_supported`, `policy_safe`, `missing_requirements`, `severity`, and `rationale`. Blind the judge to model name and experiment hypothesis to reduce bias.

Calibrate it against a human-labeled set. Measure agreement by category, inspect disagreements, and tune the rubric—not the score threshold alone. Use multiple judges or pairwise comparison for consequential subjective work. A small high-quality human panel remains the arbiter for borderline results.

Never let a judge grade its own output in the same context. Keep generation and judgment separate. Watch for verbosity bias, position bias, style bias, and a tendency to reward confident unsupported prose. For RAG, force the judge to mark each claim against the given passages; otherwise it may use its own background knowledge and falsely approve a hallucination.

Treat judge prompts and models as governed dependencies. Version them, evaluate them, and periodically re-calibrate.
