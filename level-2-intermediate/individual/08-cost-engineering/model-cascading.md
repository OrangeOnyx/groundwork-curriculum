# Model Cascading

Model cascading sends easy work to a cheap model and escalates only when uncertainty, risk, or complexity demands it. It works when the handoff criteria are measurable. “Use the smart model when the cheap one feels unsure” is not an engineering plan.

For OTB triage, use deterministic emergency rules first, then a low-cost classifier for intent and confidence. Escalate to a stronger model when confidence is below threshold, multiple intents compete, attachments need interpretation, or policy-sensitive labels appear. For lease extraction, use a cheap locator to select candidate clauses and a stronger structured extractor only when text is noisy or the verifier fails. The final safety gate remains policy and human review, not model tier.

Make escalation visible in the trace: stage, model, reason, confidence, result, and cost. Calibrate confidence against labeled examples; raw model probability is not automatically reliable. Use an abstain route for cases where a better model will not create safe certainty.

Evaluate the cascade as one system. Report quality, escalation rate, cost per successful task, tail latency, and performance across risk slices. A cascade that saves 60% but misses emergencies is a failure. Limit tiers to two or three; complex chains are hard to debug and can hide repeated calls.

Default policy: cheap model for classification and formatting; capable model for ambiguity and synthesis; human for irreversible or policy-sensitive outcomes.
