# Agent Architectures

An agent is not a chatbot with a tool list. It is a controlled loop: observe state, choose an action, use a tool, inspect the result, and stop under explicit rules. Level 2 starts by choosing that loop deliberately. The wrong architecture creates expensive, flaky behavior that no prompt rewrite will fix.

Use the smallest loop that can complete the job. A lease clause extractor is mostly a structured extraction workflow with narrow tools; it does not need autonomous planning. A Deal Leverage diligence assistant may need a plan because a data room contains uneven documents and missing evidence. Tenant triage needs a router first, then deterministic policy checks, then a drafting model. Treat architecture as risk allocation: where can the model decide, where must software decide, and where must Adam approve?

Every agent in this program has five boundaries: an input contract, an allowed tool set, a state model, stop conditions, and an audit trace. Put business rules in code or query constraints; reserve the model for ambiguity, language, and prioritization. A good agent can explain which documents it read, which tools it called, what it believes, and why it escalated.

Read the pattern notes, then use the decision guide before building. Your default should be a router plus one narrow worker, not a committee of agents talking to each other.

**Build standard:** typed inputs and outputs, idempotent tools, explicit retries, a small eval set before production, and a kill path for every side effect.
