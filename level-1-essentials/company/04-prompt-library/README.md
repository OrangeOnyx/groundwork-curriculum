# 04 — Company Prompt Library

The company-wide prompt library. Versioned, reviewed, deployed across department copilots.

## Structure

Prompts are tagged by function and role. The individual prompt library (`individual/04-prompt-library/`) is the base — this folder adds the 15 role-agnostic company prompts every team should have.

## The 15 company-wide prompts

| # | Prompt | Primary users |
|---|---|---|
| 01 | Company-voice email polisher | All |
| 02 | Meeting notes → decisions, actions, questions | All |
| 03 | Weekly team update | Managers |
| 04 | Quarterly OKR draft | Team leads |
| 05 | Vendor evaluation | Ops, IT |
| 06 | Incident post-mortem | Eng, Ops |
| 07 | Customer feedback synthesis | Product, CX |
| 08 | RFP response drafter | Sales |
| 09 | Job description drafter | HR, hiring managers |
| 10 | Policy Q&A | All |
| 11 | Data classification checker | All |
| 12 | External communication reviewer | All |
| 13 | Presentation outliner | All |
| 14 | Meeting agenda + pre-read | All |
| 15 | Escalation summary | All |

## Governance

- Every prompt has: purpose, when to use, model recommendation, variables, example, owner
- Prompts versioned like code — commits, PRs, review
- Owner reviews quarterly
- Retirements go into `retired/` folder with reason

## How to deploy

- All 15 uploaded as knowledge to every department copilot
- Also available as slash commands in Slack via the AI bot (if deployed)
- Also available as text-expander snippets for individuals
