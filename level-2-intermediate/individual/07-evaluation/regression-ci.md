# Regression CI for AI Workflows

Put evaluation in the change path. A pull request that changes a prompt, model, retrieval setting, tool definition, schema, or policy must run a smoke eval before merge. The result should compare candidate versus baseline by metric and critical slice, with links to representative traces. “Green” means the predefined gates passed; it does not mean the output looked polished.

Use tiers. Fast CI runs 20–50 deterministic and high-risk cases. Nightly runs the full regression set, multiple seeds where relevant, retrieval metrics, and a cost/latency report. Weekly, sample production failures into a candidate set for human review. Keep external-model drift in mind: a model alias can change without a code deploy, so pin versions where possible and schedule baseline re-runs.

Set explicit failure policy. Block immediately for schema violations, data-boundary failures, unsafe action proposals, citation failures on high-stakes answers, or emergency-recall drops. Warn for small noncritical movement, but require an owner and follow-up. Permit intentional behavior changes only with updated requirements, dataset changes, and documented approval.

Save artifacts, not just scores: input snapshot, retrieved chunks, tool outputs, output, trace, prompt, model settings, and normalized score. This makes failed examples debuggable instead of mystical. Do not automatically rewrite the golden answer after every production complaint; investigate whether the complaint identifies a true requirement or a one-off preference.

CI is how you keep the agent you shipped yesterday from becoming a different agent tomorrow.
