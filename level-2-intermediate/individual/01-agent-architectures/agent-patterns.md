# Four Agent Patterns That Matter

## ReAct: reason, act, observe
ReAct alternates a short decision with a tool call and an observation. It fits tasks where the next action depends on evidence: locate the current lease, retrieve a clause, compare it to a property rule, then request clarification if the dates conflict. Keep the action vocabulary tiny. The model should choose `search_leases`, `get_clause`, `create_review_task`, or `stop`, not arbitrary SQL. Log each turn as a trace. Cap turns at 4–8; more turns usually mean the tool contract is weak.

## Plan–Execute
The planner produces a bounded checklist, and workers execute each item without rewriting the plan on every turn. Use it for Deal Leverage diligence: inventory documents, extract borrower terms, verify insurance, score missing items, draft the checklist. Persist the plan so a failed document can be retried independently. Plans are useful when completeness matters more than conversational agility. Validate the plan schema before execution and allow only approved task types.

## Reflection
A worker drafts an answer; a critic checks it against requirements; a repair pass fixes concrete defects. Reflection works for high-value writing and structured extraction where an answer can be inspected. For example, require the critic to identify unsupported lease fields, impossible dates, and missing citations. Do not ask it “is this good?” Give it a rubric and source IDs. One review pass is usually enough; endless self-review burns tokens and can amplify an initial mistake.

## Router
A router classifies the request and sends it to a specialized path. OTB tenant communication should route maintenance emergencies, payment questions, lease requests, complaints, and general inquiries differently. Use deterministic rules for obvious signals (fire, gas, lockout) before an LLM router. The router returns a label, confidence, and reason—not prose. Low-confidence or high-risk labels go to a human queue.

These patterns compose, but composition is not maturity. Start with one pattern, measure it, then add complexity only when an eval exposes a real gap.
