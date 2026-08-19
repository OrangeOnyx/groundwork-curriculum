# Cost Engineering: Spend Like It Is Production Infrastructure

AI spend becomes accidental when requests, retries, prompts, context, and models are invisible. Cost engineering makes each workflow intentional: measure cost per successful outcome, remove unnecessary tokens, route easy work to cheaper paths, and refuse to trade away safety for pennies.

Track costs by application, organization, workflow, model, input tokens, output tokens, cache reads, cache writes, tool calls, retries, and human-review outcome. “Monthly model bill” is not a metric. For Belle Realty, compare cost per correctly extracted lease, per safely triaged message, and per diligence checklist completed. Add avoided staff time only after measuring it.

The cheapest model is not always the low-cost model. A weak classifier that sends half of tenant messages to review can be more expensive than a stronger one. Likewise, a giant prompt may cost little per request but create slow, unsupported answers that staff must correct. Optimize in order: eliminate calls, eliminate context, cache safe results, cascade models, then tune output length.

The guides cover semantic caching, model cascading, prompt compression, and workflow accounting. Cost constraints belong in the product contract and CI gates, not in a cleanup sprint after adoption.

Before adding complexity, run this design through a small representative eval and inspect the trace with the operator who will own failures. Make the boundary, escalation, and rollback visible in the product. That discipline will expose more useful work than another round of prompt cleverness.
