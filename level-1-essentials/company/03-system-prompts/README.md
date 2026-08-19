# 03 — Company System Prompts

Every AI tool at the company gets the same system-prompt foundation. This is how you enforce voice, guardrails, and legal disclaimers across every surface.

## The company system prompt

The single source of truth for company-wide AI behavior:

- Voice and tone
- What the AI can and can't do
- Escalation rules
- Attribution and citation rules
- Disclaimer triggers

See `company-system-prompt.md`.

## Deployment surfaces

The company system prompt is loaded into:

- Every department copilot (as base, extended by department-specific prompt)
- Every enterprise chat workspace (as default system message)
- Every deployed agent (as base, extended by agent-specific brief)
- Every RAG pipeline (as base)

## Legal disclaimers

Some outputs require legal disclaimers. The library covers when and what.

See `legal-disclaimer-library.md`. Disclaimers are keyed D-01 through D-08.

## Ownership

- Marketing owns voice
- Legal owns disclaimers
- Steering Committee approves changes
- Version controlled — changes require PR + review

## Change management

Any change to the company system prompt goes through:
1. Draft PR
2. Legal + Marketing review
3. Steering Committee approval
4. Announce in AI newsletter
5. Update deployment surfaces within 5 business days
6. Log the change with rationale
