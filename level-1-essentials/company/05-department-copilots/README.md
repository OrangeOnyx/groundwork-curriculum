# 05 — Department Copilots

Each department gets a copilot: a scoped chat/agent surface with its own system prompt, prompt library, and knowledge base.

## Design principle

**Every copilot is a stack:**

```
Company System Prompt (base)
  └── Department System Prompt (specialization)
        └── Prompt Library (task-specific)
              └── Knowledge Base (retrieval)
```

## The nine copilots

| Copilot | Owner | Primary users |
|---|---|---|
| Sales | VP Sales | AEs, SDRs, sales ops |
| Support | Head of Support | Support agents, escalation team |
| Legal | GC | Legal team, contract reviewers, compliance |
| Finance | CFO / Controller | Finance, accounting, FP&A |
| Engineering | CTO / VP Eng | Engineers, EMs, staff eng |
| Marketing | CMO | Marketing team, content, brand |
| HR | CHRO | HR, People Ops, recruiters |
| Executive | CEO or COS | C-suite, chief of staff |
| Operations | COO / Head of Ops | Ops, IT, facilities, program mgmt |

## Folder structure per copilot

```
<department>/
├── system-prompt.md          — the department's specialized system prompt
├── starter-prompts.md        — 8 starter prompts to load
└── knowledge-base-manifest.md — what KB content this copilot has access to
```

## How to deploy

Each department copilot is deployed as one of:

- ChatGPT Enterprise Custom GPT (loaded with system prompt + KB via file upload)
- Claude Project (system prompt + attached knowledge)
- A Perplexity Space with system prompt + selected sources
- A custom agent behind the LLM gateway with RAG pipeline

Choose the surface based on:
- Where the department already works
- What tools it needs (grounded search? code? images?)
- What data classification it handles (higher-class = tighter tools)

## Ownership

- **Copilot owner** = department head or their designee
- **Content owner** = department AI Champion
- **Platform owner** = AI Program Manager

## Update cadence

- Prompts reviewed quarterly
- KB refreshed monthly (or event-driven)
- Eval set updated with new failure cases as they arise
- Retire copilots that fall below adoption/quality thresholds
