# Reflexion: Repair Against Evidence

Reflexion is an improvement loop: generate an answer, inspect failures, produce targeted feedback, then revise. It is useful when a response can be checked against explicit evidence or criteria. It is weak when the “reflection” is just another model saying its own writing is good.

For lease extraction, the first pass produces fields and source quotes. A verifier checks schema, quote containment, page accuracy, normalization, and conflict with addenda. It returns a repair list such as “late fee quote does not state amount” or “notice period is from base lease but addendum supersedes it.” The repair pass receives only the evidence and the defects. It may correct, abstain, or create a review task.

Limit reflexion to one repair cycle unless a deterministic condition calls for another source retrieval. Repeated self-revision adds cost and can turn an abstention into confident fiction. Keep generator and critic prompts separate; ideally use distinct models or at least contexts. Do not expose hidden chain-of-thought to staff. Store concise, inspectable failure tags instead.

Measure first-pass accuracy, repair uplift, false-repair rate, extra latency, and cost. A critic that improves style but harms citation precision is not useful. Reflexion earns its place when it fixes observable defects more often than it introduces new ones.
