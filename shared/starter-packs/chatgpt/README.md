# ChatGPT starter pack

For [chatgpt.com](https://chatgpt.com) — OpenAI's consumer product with Custom Instructions, Projects (formerly GPTs), and Memory.

## What ChatGPT gives you to configure

1. **Custom Instructions** — apply to every conversation. Two fields:
   - "What would you like ChatGPT to know about you?"
   - "How would you like ChatGPT to respond?"
2. **Projects** — per-project instructions + uploaded files
3. **Custom GPTs** — full system prompt + tools + knowledge files (public or private)
4. **Memory** — automatic long-term memory (can be turned off)

## Files in this pack

- [`custom-instructions-about-you.md`](./custom-instructions-about-you.md) — paste into field 1
- [`custom-instructions-how-to-respond.md`](./custom-instructions-how-to-respond.md) — paste into field 2
- [`project-instructions.md`](./project-instructions.md) — paste into a Project's custom instructions
- [`custom-gpt-system-prompt.md`](./custom-gpt-system-prompt.md) — starter system prompt for building a Custom GPT

## How to install

1. Go to [chatgpt.com](https://chatgpt.com) → your profile picture → Customize ChatGPT
2. Paste `custom-instructions-about-you.md` in the "About you" field (edit placeholders first)
3. Paste `custom-instructions-how-to-respond.md` in the "Response style" field
4. Save

For Projects: open the project, click the sidebar settings, paste `project-instructions.md`.

## Character limits (as of 2026)

Each Custom Instructions field: **1500 characters**. This is a real hard cap.

The templates in this pack are already tuned to fit under it. If you extend them, count characters.

## Gotchas

- **Memory is separate from Custom Instructions.** Memory is what ChatGPT saves during conversations. Custom Instructions are what you set once. Both are in play.
- **ChatGPT ignores instructions more aggressively than Claude.** Repeat the important ones. Put "always" and "never" rules in both fields.
- **Long custom instructions get truncated silently.** Test with a query that exercises the rules.
- **Projects can share Memory or not** — toggle in project settings.
