# Grok starter pack

For [Grok](https://grok.com) — xAI's assistant, available on x.com and grok.com. Grok's configuration is lighter than Claude's or ChatGPT's: it exposes "Custom Instructions" and personality modes.

## What Grok gives you to configure

1. **Custom Instructions** — a single free-form field applied to every conversation
2. **Personality modes** — Regular / Fun / Genius modes (via prompt selection or explicit toggles depending on client version)

## Files in this pack

- [`custom-instructions.md`](./custom-instructions.md) — paste into Grok's settings

## How to install

1. Open Grok (grok.com or x.com's Grok surface)
2. Settings → Custom Instructions (exact path shifts with UI updates)
3. Paste `custom-instructions.md` — edit the placeholders first
4. Save

## Gotchas

- **Grok defaults to a chatty, opinionated voice.** If you want restrained output, your Custom Instructions have to fight the default. Be explicit.
- **Grok has web access and citations.** Encourage it to use them for facts.
- **Grok's context window is generous** but its ability to follow long custom instructions varies. Keep to 2000 characters if you want reliability.
- **X.com's Grok tab and grok.com may not share instructions** in every client. Test each surface.

## Related program modules

- [Level 1 — Essentials](../../../level-1-essentials/) — model-agnostic AI fluency
- [`level-2-intermediate/individual/09-prompt-engineering-depth/prompting-techniques.md`](../../../level-2-intermediate/individual/09-prompt-engineering-depth/prompting-techniques.md) — which techniques transfer across models
