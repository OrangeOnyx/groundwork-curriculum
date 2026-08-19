# Build Your Third Agent: Diligence Checklist

> **Live code:** [`OrangeOnyx/diligence-agent`](https://github.com/OrangeOnyx/diligence-agent) — clone, run locally, then follow the walkthrough. See the [repos overview](../../repos/README.md) for how the four Level 2 repos fit together.

Deal Leverage needs an agent that creates a defensible diligence view from a messy data room. This is not a chat-with-PDFs feature. It is a controlled evidence workflow that inventories documents, maps them to a checklist, extracts required facts, scores completeness, and makes uncertainty obvious.

A buyer should be able to open a checklist line—“trailing 12-month operating statement,” “title commitment,” “insurance certificate,” “environmental report,” “tenant estoppel”—and see the exact file, page, finding, date, and reason for its score. The agent cannot say a deal is safe or approve a transaction. It can organize evidence and surface exceptions faster than a human opening every folder.

Use Plan–Execute. The plan is the checklist taxonomy and required evidence, not model-generated improvisation. Workers identify document type, extract relevant facts, compare them to the criteria, and return a score with citations. Missing evidence remains missing; do not reward a confident guess.

The walkthrough is deliberately opinionated: a smaller explicit checklist beats a magical “analyze this data room” prompt. You earn autonomy only after the evidence path is reliable.

Before adding complexity, run this design through a small representative eval and inspect the trace with the operator who will own failures. Make the boundary, escalation, and rollback visible in the product. That discipline will expose more useful work than another round of prompt cleverness.
