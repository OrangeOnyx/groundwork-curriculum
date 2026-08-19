# Route Models by Task, Risk, and Evidence

A model router chooses an execution path from measurable inputs: task type, language, requested output, document quality, risk tier, estimated context size, prior confidence, latency target, and budget remaining. It returns a route ID and reason. Do not ask a general model to select its own unlimited tools and pricing tier.

Start deterministic. A known JSON classifier can use the low-cost route; scanned leases or conflicting addenda use the high-accuracy extraction route; emergencies skip drafting and go to policy plus human escalation. Add model-based routing only for ambiguity after you label examples. Calibrate thresholds on the eval set, then monitor actual route outcomes.

Implement fallbacks narrowly. If a primary model times out, retry once or use an approved fallback with the same schema. If structured output fails, return a review task rather than parsing free text creatively. Enforce maximum context, output, cost, and latency per route. A router that silently makes three expensive calls is a billing bug.

Evaluate routing accuracy and system outcomes together: quality by route, escalation rate, cost per successful task, tail latency, and safety failures. Review cases that route cheaply but later require human correction. Routing is a policy decision, so version it, feature-flag it, and allow fast rollback.
