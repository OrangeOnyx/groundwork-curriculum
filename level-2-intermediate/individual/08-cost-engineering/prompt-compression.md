# Prompt Compression Without Degrading the Work

Prompt compression means removing tokens that do not change a correct outcome. It does not mean stripping the evidence, policy, or schema that makes the outcome safe. Most waste comes from repeating product lore, full conversation histories, entire documents, and verbose examples on every call.

Separate stable instructions from dynamic context. Put stable system rules in a versioned template and use provider context caching when it is safe. Replace prose policy with compact decision tables. Retrieve the 3–6 relevant lease chunks instead of inserting a whole lease. Summarize old conversation turns into a structured state: open issue, prior commitments, unresolved question, sentiment, and last staff action. Preserve source links for anything that will be relied on.

Use structured outputs to eliminate “explain your reasoning” text when the application needs only a label or object. Cap output tokens. Ask the model to return a concise draft plus required fields, not an essay followed by JSON. Remove duplicate instructions and contradictory examples; they cost money and make behavior less predictable.

Test compression on the eval harness. Compare quality, citation support, token count, latency, and cost by slice. If a shorter prompt fails on addenda or ambiguous notices, restore the missing context only for that route. Do not compress away adversarial instructions, escalation rules, or human-approval requirements.

Good compression changes the shape of context. It makes relevant facts denser, not merely shorter.
