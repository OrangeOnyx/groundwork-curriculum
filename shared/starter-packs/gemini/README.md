# Gemini starter pack

For [Gemini](https://gemini.google.com) — Google's assistant. Gemini's persistent configuration lives in **Gems** (custom persistent instructions) and in Google Workspace integration.

## What Gemini gives you to configure

1. **Gems** — named custom instruction sets you can pin to your Gemini sidebar
2. **Workspace context** — Gemini can pull from Drive, Gmail, Calendar when you're signed into your Google account
3. **Extensions** — third-party connectors (varies by tier)

## Files in this pack

- [`gem-writing-assistant.md`](./gem-writing-assistant.md) — a Gem for writing tasks
- [`gem-code-helper.md`](./gem-code-helper.md) — a Gem for coding help
- [`gem-research-analyst.md`](./gem-research-analyst.md) — a Gem for research and synthesis
- [`gem-generic.md`](./gem-generic.md) — a Gem-generic starter you can adapt

## How to install

1. Go to [gemini.google.com](https://gemini.google.com)
2. Sidebar → Gems → Create new Gem
3. Paste one of the templates (edit the placeholders first)
4. Name and description matter — Gemini uses them to help you pick

## Gotchas

- **Gems apply only when you invoke the Gem.** They don't apply to plain Gemini chats. This is the opposite of ChatGPT's Custom Instructions.
- **Gemini's tier matters.** Pro/Advanced tiers have longer instruction limits and more powerful reasoning. Free tier truncates.
- **Workspace integration is invisible.** Gemini may or may not pull from your Drive on a given query. Don't assume; if you want it consulted, name the file.
- **Voice mode strips formatting.** Your Gem instructions apply, but markdown output becomes spoken prose. Design accordingly if you use voice.

## Related

- [Level 1 — Essentials](../../../level-1-essentials/)
- Other packs in this directory
