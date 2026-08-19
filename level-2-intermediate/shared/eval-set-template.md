# Intermediate Eval Set Template

## Case record
`case_id`, task, version, owner, data classification, source provenance, input, authorized context, expected output or rubric, expected evidence IDs, expected abstention/escalation, tags, risk tier, and notes. Keep immutable versions and split into development, locked regression, adversarial, and production-sampled sets.

## Intermediate rubric
Score deterministic requirements first: valid schema; correct organization and entity scope; required fields; source citation presence; tool policy compliance; no prohibited side effect. Then score task behavior: factual correctness, evidence support/faithfulness, groundedness, completeness, calibrated confidence, correct abstention, escalation correctness, and usable tone. Record latency, tokens, model route, cache status, tool calls, and cost.

## Required slices
Include normal cases, messy OCR, missing evidence, conflicting addenda, stale documents, ambiguous requests, irrelevant retrieved content, prompt injection, cross-tenant requests, malformed tool results, and low-confidence cases. For tenant triage include emergencies, fair-housing concerns, payment disputes, threats, attachments, and multilingual messages.

## Release gates
Define critical failures as zero-tolerance: cross-tenant data, unsupported legal claim, unsafe write proposal, failed emergency escalation, or leaked canary. Compare candidate against baseline by slice, not only average. Use LLM judges only with documented calibration against human labels; require human adjudication for high-risk disagreements. Add every verified production failure to a candidate queue, then curate it before it becomes a regression case.
