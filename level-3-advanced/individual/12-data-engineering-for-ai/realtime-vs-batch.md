# Real-Time vs Batch AI Data

Use real-time paths for operational state such as an active maintenance ticket; use batch for analytics, backfills, and durable indexing. Make freshness visible so the assistant never presents old status as current fact.

Treat this as an operating document, not a reading assignment. For Belle Realty or a property-management assistant, define the unit of work, owner, allowed failure modes, and the customer-visible consequence before choosing a model or framework. A system that gives plausible answers but cannot be measured, contained, or recovered is not production-ready.

## Design stance

Start with a narrow contract. State what enters the boundary, what the component may read or change, what it must return, and when it must stop. Put the contract in version control alongside representative tenant, listing, maintenance, and leasing cases. Prefer a deterministic rule when one exists; use model judgment only where language or ambiguity genuinely adds value.

## Operating loop

Instrument every request with a correlation ID, model and prompt version, retrieval version, tool calls, latency, token usage, policy decisions, and final outcome. Review a small, stratified sample of real traffic weekly. Track failures by property, workflow, language, channel, and tenant impact; aggregate averages hide the exact bad experience that produces churn.

## Controls

Set an explicit threshold that changes behavior: block, require approval, degrade to search-only, route to a cheaper model, or page an owner. Test the threshold with synthetic failures and recent production examples. Do not make a dashboard metric a promise unless a named person can act on it within a defined window.

## Production exercise

Apply this to a maintenance triage request: a resident reports a gas smell at 2 a.m. Document the safe path, the tool permissions, the human escalation, the message shown to the resident, and the evidence retained for review. Ship only after the behavior is repeatable in a rehearsal.

## Exit criteria

The implementation has a written contract, measurable outcomes, a failure path, an accountable owner, and a rollback or containment action. If any is missing, it is still a prototype.
