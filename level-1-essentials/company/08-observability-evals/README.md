# 08 — Observability & Evals

You can't manage what you can't measure. Every LLM call is logged, every workflow has evals.

## Files

- `logging-and-redaction.md` — what to log, what to redact, where it goes, who can see it
- `eval-framework.md` — how the company scores its AI workflows
- `model-bake-off-protocol.md` — quarterly protocol to test whether to switch models

## Non-negotiables

1. Every LLM call flows through the gateway
2. PII/secrets redacted before storage
3. Every production workflow has an eval set
4. No model or prompt change without a regression run
5. Dashboards visible to Steering Committee
