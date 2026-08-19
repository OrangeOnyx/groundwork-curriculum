# Tree of Thoughts: Use Search, Not Decorative Reasoning

Tree of Thoughts (ToT) asks a model to generate several candidate approaches, score them, and continue from the strongest branch. It can help when there are genuinely different plans: decide which diligence documents could resolve a discrepancy, or construct a constrained sequence of investigation steps. It is not useful for deterministic extraction, tenant routing, or simple RAG answers.

Implement it as bounded search. Define a state object, allowed next steps, scoring rubric, branch factor, depth, and stop rule. For a data-room conflict, a state might contain documents checked, unresolved claims, candidate evidence, and next retrieval query. Generate at most three branches, score against evidence coverage and cost, then execute the best one. Persist the state and trace.

Never let ToT manufacture facts by treating a plausible branch as evidence. Branches are hypotheses or plans; tool output is evidence. Score candidate plans with deterministic constraints first: document accessible, authorized, not already checked, likely to resolve the checklist row. Use a model only for relevance among valid choices.

Evaluate whether ToT beats a single plan on completeness, error rate, latency, and cost. If its benefits appear only in contrived examples, remove it. A builder should prefer a fixed checklist or retrieval query when that solves the problem. ToT is a search algorithm with token costs, not a badge of sophistication.
