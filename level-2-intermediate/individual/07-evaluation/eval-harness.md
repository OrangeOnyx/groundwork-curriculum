# Eval Harness

An eval harness is a repeatable runner that feeds versioned cases to a workflow and scores the outputs. Each case includes input, permitted context, gold answer or rubric, tags, risk tier, and expected abstention behavior. The runner records model, prompt version, tool versions, latency, tokens, trace, output, and scores. Without this metadata you cannot explain a regression.

Start with deterministic checks. Validate JSON Schema, required citations, valid clause types, no cross-tenant IDs, and policy gates. Then add task metrics: field-level exact match for lease clauses; routing accuracy and emergency recall for OTB messages; checklist-status accuracy and blocker recall for Deal Leverage. Normalize formats before comparing dates and money, but never normalize away substantive differences.

Partition cases into smoke (fast, must-pass), core (representative), edge (messy), and adversarial (hostile). Keep a locked regression set that builders cannot tune against casually, plus a development set for iteration. Tag slices such as scans, addenda, Spanish messages, emergency keywords, missing documents, and ambiguous requests. Aggregate scores are useful; slice failures decide whether you ship.

Run the harness on every model, prompt, retrieval, tool, or schema change. Define gates in advance: zero cross-tenant leaks, 100% citation support for legal facts, no decline in emergency recall, and no more than a defined cost increase. Store failing cases as first-class work items. An eval that merely produces a dashboard is not finished; it must block unsafe changes.
