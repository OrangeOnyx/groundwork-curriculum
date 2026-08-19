# DSPy Primer: Optimize Programs, Not Magic Prompts

DSPy is a framework style for expressing LLM work as modules with declared input/output signatures and optimizing demonstrations or instructions against a metric. The important idea is transferable even if you do not adopt the library: treat prompts as compiled components with tests, not handwritten incantations.

A Belle Realty extractor signature might accept `clause_type` and `evidence_chunks` and return `normalized_value`, `quote`, `page`, `confidence`, and `status`. Its metric checks exact value, citation support, valid schema, and abstention. You can then compare prompt variants, few-shot examples, model choices, and retrieval settings reproducibly. Optimization must use a development set; keep a locked set to detect overfitting.

Do not optimize a vague “quality” score. Metrics shape behavior. If you reward only exact extraction, the system may guess rather than abstain. Add penalties for unsupported values, wrong-lease citations, and false confidence. If human review matters, include its rate and correction rate in the objective.

DSPy is not a shortcut around data. It amplifies whatever your eval tells it to optimize. Start with a hand-built baseline and clear signature. Use it when manual prompt iteration has become unrepeatable, not before you understand the task.

Before adding complexity, run this design through a small representative eval and inspect the trace with the operator who will own failures. Make the boundary, escalation, and rollback visible in the product. That discipline will expose more useful work than another round of prompt cleverness.
