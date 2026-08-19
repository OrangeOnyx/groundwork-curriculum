# Level 2 — Working code repositories

Four public GitHub repos back the four core walkthroughs in Level 2. Each is a real, running codebase — not a snippet — meant to be cloned, run, and modified as you work through the level.

They're intentionally scoped:

| Repo | Walkthrough | What it teaches | Domain |
|------|-------------|-----------------|--------|
| [`lease-abstractor`](https://github.com/OrangeOnyx/lease-abstractor) | [02](../individual/02-build-first-agent) | Anthropic tool-use with schema-enforced output, side-by-side citation UI, eval against a gold reference | Real estate |
| [`support-triage-agent`](https://github.com/OrangeOnyx/support-triage-agent) | [03](../individual/03-build-second-agent) | 3-agent pipeline (classify → enrich → draft), HITL approval dashboard, brand-voice config | Domain-agnostic (SaaS / e-commerce / local services / agency) |
| [`diligence-agent`](https://github.com/OrangeOnyx/diligence-agent) | [04](../individual/04-build-third-agent) | RAG over a document folder, structured findings with citations, per-domain playbooks | Domain-agnostic (M&A / vendor eval / CRE / contracts) |
| [`belle-mcp-server`](https://github.com/OrangeOnyx/belle-mcp-server) | [05](../individual/05-mcp-server) | MCP server design, per-tool auth + rate limit + audit, HITL propose-write pattern | Real estate |

## Why this mix

You want to know these patterns, and you should not have to be a real-estate operator to learn them. Only two of four repos are real-estate-specific by design: the ones where a specific domain makes the pattern more concrete (lease documents for schema-enforced extraction, a property portfolio for MCP tool design). The other two are generic playbooks you point at any vertical.

## How to use them

1. **Read the code before the walkthrough.** Skim the README and `src/` tree of the relevant repo. 15 minutes.
2. **Clone and run locally.** Every repo has a `Quick start` section in its README that ends with a working local process. Set the env vars, run the seed, see it work end-to-end.
3. **Follow the walkthrough.** Open the corresponding module — the walkthrough refers to specific files and functions in the repo by path, not by copy-paste of the code.
4. **Modify it on your data.** Replace the fixture with something from your own life or business. That's the exit criterion for the module.

## Personal use vs company use

Every repo README has both a `docs/personal-use.md` and a `docs/company-use.md`. Same code, two ways to deploy — as a solo operator or as a team. That reflects how you'll actually use these; nothing about the code changes based on scale, only the deployment shape and the governance around it.

## Common tech stack across the four

| Concern | Choice |
|---------|--------|
| Language | TypeScript for the three JS repos, Python 3.11 for `diligence-agent` |
| Model | `claude-sonnet-4-20250514` default across all four |
| Data | Supabase (Postgres) primary, local fallbacks (JSON file or ChromaDB) for zero-cloud demos |
| Validation | Zod (TS) / Pydantic v2 (Py) on every agent input and output |
| Deployment | Vercel for Next.js apps, Railway for services |
| Testing | Vitest / pytest, plus per-repo eval harnesses |

If you're building your own version of any of these, start from these choices and only deviate when your constraints demand it.

## What to build next

After you've cloned and modified at least one repo:

- Combine two — e.g., feed `lease-abstractor` output into `diligence-agent` for a lease-portfolio review.
- Add a new tool to `belle-mcp-server` for a domain you actually care about.
- Fork `support-triage-agent`, swap the brand-voice config, and point it at your real inbound support channel.

That's Level 2. When these four repos feel like starting points instead of endpoints, you're ready for Level 3.
