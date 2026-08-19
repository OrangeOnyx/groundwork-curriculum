# Perplexity starter pack

For [Perplexity](https://perplexity.ai) — search-native AI. This pack covers **Perplexity Computer** (the agentic surface with custom skills, memory, and connectors), not just the Q&A search product.

## What Perplexity Computer gives you to configure

1. **Memory** — durable facts about you that get injected into every conversation
2. **Custom Skills** — reusable instruction files that activate when their description matches your request
3. **Projects** (formerly Spaces) — grouped sessions with shared context
4. **Connectors** — third-party integrations (Gmail, Slack, Notion, etc.)

## Files in this pack

- [`memory-seed.md`](./memory-seed.md) — durable facts to add to your Memory
- [`custom-skill-starter.md`](./custom-skill-starter.md) — a starter custom skill you can adapt
- [`project-context-template.md`](./project-context-template.md) — starter context file for a Project

## How to install

**For memory:**
Open Perplexity and paste each fact from `memory-seed.md` as a separate message that starts "Remember that...". Perplexity's memory system will save them.

Alternatively, when you're in a Perplexity Computer session, you can just say "add to memory: <fact>" and it will use its memory tools.

**For custom skills:**
Use the `save_custom_skill` tool via chat: "Save this as a custom skill named `<name>`" and paste `custom-skill-starter.md` (edited).

**For Projects:**
Create a Project, then paste `project-context-template.md` as the project description or first message so it gets included in context.

## Gotchas

- **Perplexity Computer skills are Markdown with frontmatter** — very similar to Claude Skills. If you already have Claude Skills, they port with minor changes (see `custom-skill-starter.md`).
- **Memory is opt-in and can be disabled.** If you want continuity, keep it on.
- **Search happens automatically** for questions with a factual answer. You can't easily turn this off — write your prompt as an actual task if you don't want it to search.
- **Connectors extend what skills can do.** A skill that references Gmail assumes your Gmail connector is connected.

## Related program modules

- [Level 1 — Essentials](../../../level-1-essentials/) — the base fluency track
- [`level-2-intermediate/individual/01-agent-architectures/agents-are-folders.md`](../../../level-2-intermediate/individual/01-agent-architectures/agents-are-folders.md) — why the skill file IS the agent
