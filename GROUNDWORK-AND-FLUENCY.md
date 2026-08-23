# Groundwork and AI Fluency: how these two programs fit together

**TL;DR** — Groundwork is the **readiness** program. AI Fluency is the **capability** program. Groundwork gets your data, identity, and knowledge in order so AI can work on your real information. AI Fluency teaches you to build the agents, tools, and evaluation systems that run on top of that foundation. They are sequential, not competing. Neither is gated. You can start in either program at any layer or level that fits where you already are.

- Groundwork: [groundwork.adamabdalla.com](https://groundwork.adamabdalla.com)
- AI Fluency: this repo — [README.md](README.md)

---

## Two programs, one arc

Groundwork's core thesis is **"do not automate chaos."** You spend the first three layers turning your information into something AI can actually reason over: files scanned and named, a digital identity file that survives platform switches, a Markdown knowledge vault with authority classification. Only then does Groundwork Layer 4 introduce automation, and it does so through an approval framework — Auto-Execute / Draft and Wait / Never Automate.

AI Fluency starts where a serious builder actually needs help: not "how do I organize my life" but "how do I build, evaluate, and run agents without shipping something that embarrasses me." Level 1 assumes you can already talk to an LLM. Level 2 assumes you're ready to build. Level 3+ assumes you're operating them for other people.

The overlap between the two is deliberate and small. Groundwork Layer 4 (Workflow Automation) is the exact bridge — it hands off to AI Fluency Level 2 the moment you want to build automation as software rather than as prompt-and-approval loops.

## Full mapping

| If you are here in Groundwork | This is the equivalent starting point in AI Fluency |
|---|---|
| Layer 1 — Data Readiness (files, OCR, folder taxonomy) | Prerequisite. AI Fluency assumes this exists. |
| Layer 2 — Digital Identity (AI Brand Context File) | Level 1 · Module 03 — Working with context / system prompts |
| Layer 3 — Personal Intelligence Layer (Markdown vault + LLM connection) | Level 1 · Module 05 — Files, RAG basics, and platform independence |
| Layer 4 — Workflow Automation (Opportunity Audit, Approval Framework, First Sprint) | **Level 2** — the whole track. You are ready to build agents. |
| Layer 5 — Operations and Governance (access rules, digital estate, continuity) | Level 2 Company track · [02-agent-governance](level-2-intermediate/company/02-agent-governance/) and Level 3 Advanced |

Groundwork's Readiness Scorecard names your weakest layer. If it says Layer 1 or 2, you should be in Groundwork, not here. If it says Layer 3 with the vault mostly done, AI Fluency Level 1 will feel like a natural next chapter. If it says Layer 4 or 5, you belong in AI Fluency Level 2.

## Where the two programs agree, verbatim

Both programs teach the same **three-tier approval model** because it's the correct one:

| Category | Groundwork calls it | AI Fluency calls it | Rule |
|---|---|---|---|
| 1 | Auto-Execute | `auto_send: false` off — internal only | Low-risk, reversible, high frequency. Runs without a human. |
| 2 | Draft and Wait | HITL propose-write (default) | AI prepares the output. A human reviews before it leaves the system. |
| 3 | Never Automate | Human-only escalation | Money, legal, personnel, sensitive comms. AI can research and prep, never act. |

The AI Fluency companion repos (`belle-mcp-server`, `lease-abstractor`, `support-triage-agent`, `diligence-agent`) all default to category 2 — propose-write with `auto_send` off. That is on purpose. It is the same category Groundwork tells you to default to when in doubt. Nothing in either program teaches you to skip this step. Nothing here or there ships with autonomous send turned on.

## Where the two programs deliberately differ

| Dimension | Groundwork | AI Fluency |
|---|---|---|
| Format | 90-day guided program with a scorecard, 5 layers strictly ordered | Any-order reference. Jump in at any level. Every module stands alone. |
| Audience | Any professional or business owner who wants to be AI-ready | Builders who want to ship agents |
| Deliverable | A personal system: vault, identity file, approval rules | Working code, evals, and companion repos |
| Pedagogy | Foundation-first — you cannot skip Layer 1 | Level-independent — refresher-friendly, no prerequisites enforced |
| Delivery | Free guide plus paid tiers ($299 self-guided; $2,500-$5,000 guided) | Free and open. This repo is the whole thing. |

If you are a technical builder, AI Fluency is almost certainly what you need. If you're a professional who has never systematically organized their files, run Groundwork first — coming to AI Fluency without a knowledge vault and an approval framework in your head means you'll build agents that automate a mess.

## How to enter each program

**Enter Groundwork if any of these are true:**
- Your files live in Downloads, Desktop, and email attachments
- You explain the same preferences to AI every time you open a new chat
- You have no rules for what AI is allowed to do without asking you
- You worry about losing everything if your current AI provider changes terms
- You want a program with a start date, an end date, and a scorecard

**Enter AI Fluency if any of these are true:**
- You already have a Markdown notes system or the equivalent
- You know what a system prompt is and have written one that matters
- You want to build an agent, an MCP server, or a RAG pipeline this month
- You want evals, not vibes
- You are hiring or leading engineers who will build these things

**Enter both, in sequence** if you're building AI capability for a real business: Groundwork gets the foundation right, AI Fluency builds the systems on top of it.

## Cross-links in this repo

- [Level 1 · Essentials README](level-1-essentials/README.md) references Groundwork Layer 3 as the recommended prerequisite for anyone whose knowledge is not yet in Markdown they own
- [Level 2 Company · 02-agent-governance](level-2-intermediate/company/02-agent-governance/README.md) references Groundwork Layer 5 for the personal/estate side of governance (access rules, continuity)
- [Level 2 Company · 08-cross-team-workflows](level-2-intermediate/company/08-cross-team-workflows/README.md) references the Groundwork Approval Framework as the individual analogue of the org-wide approval matrix

No file in this repo requires Groundwork to make sense. You can jump into any Level, any module, and get value. Groundwork is the recommended prerequisite for professionals whose foundation is not yet set — it is not a paywall.

## One-line summary for readers

> Groundwork gets your information into a shape AI can use. AI Fluency teaches you to build systems that use it. Run them in that order and both are cheaper and faster than trying to do this ad-hoc.
