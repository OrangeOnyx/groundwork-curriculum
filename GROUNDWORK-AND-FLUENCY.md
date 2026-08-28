# Groundwork and the Curriculum: how the two programs fit together

**TL;DR.** Groundwork is the **readiness** program. The Groundwork Curriculum is the **capability** program: five levels that build AI fluency in you and your team. Groundwork gets your identity, knowledge, and rules into a shape AI can work on. The Curriculum teaches you to use AI well and, at the higher levels, to build the agents, tools, and evaluation systems that run on top of that foundation. They are sequential, not competing. Neither is gated. You can start in either program at any layer or level that fits where you already are.

- Groundwork: [groundwork.adamabdalla.com](https://groundwork.adamabdalla.com)
- The Curriculum: this repo. Start at [README.md](README.md).

One axis note before anything else, because it trips people up: **Groundwork has six LAYERS. The Curriculum has five LEVELS.** Layers are things you build once for your business. Levels are stages of skill you climb as a person or a team. The numbers are not the same axis and never map one-to-one.

---

## Two programs, one arc

Groundwork's core thesis is **"do not automate chaos."** It is six layers built in three phases, producing fifteen plain-text documents, then activating one scoped AI Operator:

- **Phase 1, required first:** Layer 1 Identity (who you are and how you are allowed to behave), Layer 2 Knowledge (what the system is allowed to trust and use, including the Context Vault and Authority Classification), Layer 3 Governance (what the system is allowed to do).
- **Phase 2, activation:** one scoped AI Operator, running under the rules Phase 1 wrote.
- **Phase 3, durability:** Layer 4 Continuity, Layer 5 Measurement, Layer 6 Operating Rhythm.

Automation enters at Phase 2, and only inside the three zones Layer 3 defines: Auto-Execute, Draft & Wait, Never Automate. The default rule: unlisted work falls to Draft & Wait, never to Auto-Execute.

The Curriculum starts where a serious learner actually needs help: not "how do I organize my business" but "how do I get genuinely good at this, and eventually build systems without shipping something that embarrasses me." Level 1 assumes you can already talk to an AI product. Level 2 assumes you are ready to build. Level 3 and up assume you are operating AI systems for other people.

The overlap between the two is deliberate and small. Groundwork Phase 2, the Operator, is the exact bridge: it hands off to Curriculum Level 2 the moment you want to build automation as software rather than as prompt-and-approval loops.

## Full mapping: six layers to five levels

| If you are here in Groundwork | This is the natural starting point in the Curriculum |
|---|---|
| Layer 1, Identity (charter, brand voice, decision principles) | Level 1 · [03-system-prompts](level-1-essentials/individual/03-system-prompts/): your identity documents become the system prompt |
| Layer 2, Knowledge (Context Vault, Authority Classification) | Level 1 memory and context habits, then Level 2 · [06-rag-pipeline](level-2-intermediate/individual/06-rag-pipeline/): the vault becomes the corpus |
| Layer 3, Governance (the three zones, escalation, agent scope) | Level 2 Company · [02-agent-governance](level-2-intermediate/company/02-agent-governance/): the org-wide version of your zone rules |
| Phase 2, the Operator | **Level 2**, the whole track. You are ready to build agents. |
| Layer 4, Continuity (succession, override authority, working memory) | Level 2 Company · [02-agent-governance](level-2-intermediate/company/02-agent-governance/), the access and estate side |
| Layer 5, Measurement (signals, review questions, the correction loop) | Level 2 · [07-evaluation](level-2-intermediate/individual/07-evaluation/) and Level 3: evals, drift, incidents |
| Layer 6, Operating Rhythm (ownership, cadence, update protocol) | Level 3 and up: operating AI systems for other people, over time |

Groundwork's Readiness Scorecard names your weakest layer. If it names Layer 1, 2, or 3, run Groundwork first: the Curriculum assumes that foundation exists. If Phase 1 stands and your vault is real, Level 1 will feel like a natural next chapter. If your Operator is already running, you belong in Level 2.

## Where the two programs agree, verbatim

Both programs teach the same **three-zone approval model** because it is the correct one:

| Zone | Both programs call it | Rule |
|---|---|---|
| 1 | Auto-Execute | Low-risk, reversible, rule-bound. Runs without a human. |
| 2 | Draft & Wait | AI prepares the output. A human reviews before it leaves the system. |
| 3 | Never Automate | Money, legal, personnel, sensitive comms. AI can research and prep, never act. |

In Groundwork these are the three zones of Layer 3, Governance. In the Curriculum the same model appears as HITL propose-write defaults: the companion repos (`belle-mcp-server`, `lease-abstractor`, `support-triage-agent`, `diligence-agent`) all default to Zone 2 behavior, propose-write with `auto_send` off. That is on purpose. It is the same zone Groundwork tells you to default to when in doubt. Nothing in either program ships with autonomous send turned on.

## Where the two programs deliberately differ

| Dimension | Groundwork | The Curriculum |
|---|---|---|
| Format | Six layers in three phases, strictly ordered, with a scorecard | Any-order reference. Jump in at any level. Every module stands alone. |
| Audience | Any owner or operator who wants their business AI-ready | Learners and builders raising their own capability |
| Deliverable | Fifteen plain-text documents and one scoped AI Operator | Skills, working code, evals, and companion repos |
| Pedagogy | Foundation-first: Phase 1 is required before activation | Level-independent: refresher-friendly, no prerequisites enforced |
| Delivery | Free and ungated: the site, the Field Guide PDF, the free audit conversation | Free and open. This repo is the whole thing. |

If you are a technical builder, the Curriculum is almost certainly what you need. If you are an owner who has never systematically organized the business's information, run Groundwork first: coming to the Curriculum without a vault and an approval framework in your head means you will build agents that automate a mess.

## How to enter each program

**Enter Groundwork if any of these are true:**
- Your files live in Downloads, Desktop, and email attachments
- You explain the same preferences to AI every time you open a new chat
- You have no rules for what AI is allowed to do without asking you
- You worry about losing everything if your current AI provider changes terms
- You want a Day One, a scorecard, and a finished system at the end

**Enter the Curriculum if any of these are true:**
- You already have a Markdown notes system or the equivalent
- You know what a system prompt is and have written one that matters
- You want to build an agent, an MCP server, or a RAG pipeline this month
- You want evals, not vibes
- You are hiring or leading people who will build these things

**Enter both, in sequence,** if you are building AI capability for a real business: Groundwork gets the foundation right, the Curriculum builds the skill and the systems on top of it.

## Cross-links in this repo

- [Level 1 · Essentials README](level-1-essentials/README.md) treats a knowledge base you own as the recommended starting condition; Groundwork Layer 2, Knowledge, is where that vault gets built
- [Level 2 Company · 02-agent-governance](level-2-intermediate/company/02-agent-governance/README.md) references Groundwork Layer 3, Governance, for the personal analogue of the org approval matrix, and Layer 4, Continuity, for access and estate rules
- [Level 2 Company · 08-cross-team-workflows](level-2-intermediate/company/08-cross-team-workflows/README.md) references the Groundwork zone model as the individual analogue of the org-wide approval matrix

No file in this repo requires Groundwork to make sense. You can jump into any level, any module, and get value. Groundwork is the recommended prerequisite for owners whose foundation is not yet set. It is not a paywall.

## One-line summary for readers

> Groundwork gets your information into a shape AI can use. The Curriculum teaches you to use it well and build systems on top of it. Run them in that order and both are cheaper and faster than doing this ad-hoc.
