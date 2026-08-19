# 03 — System Prompts

The single highest-leverage move in this entire kit.

## What a system prompt does

A system prompt is standing instructions that every conversation with a model starts from. It's the difference between:
- "Write a summary" → generic McKinsey-style bullet soup
- "Write a summary" → a summary in *your* voice, at *your* length, with *your* formatting

## Files in this folder

1. `master-system-prompt.md` — the paste-anywhere personal prompt
2. `personal-style-guide.md` — the voice and formatting rulebook
3. `about-me-block.md` — a compact identity block for models that limit system prompt size

## Where to install these

| Model | Where to paste |
|---|---|
| ChatGPT | Settings → Personalization → Custom Instructions (system + preferences) OR a Custom GPT |
| Claude | Projects → Custom Instructions, or per-conversation system prompt via API |
| Perplexity | Settings → AI Profile, or per-Space instructions |
| Gemini | Gems (custom Gems) or "About you" in settings |
| Copilot | Copilot Pages → per-workspace instructions |
| Grok | Personalize → Custom instructions |
| Cursor | Settings → Rules for AI |
| Claude Code | `CLAUDE.md` in the project root |

## The three-layer approach

- **Layer 1: Master System Prompt** — installed everywhere. Sets voice, tone, defaults.
- **Layer 2: Personal Style Guide** — a longer document you reference in the master prompt and include as knowledge in Projects/Spaces.
- **Layer 3: Per-project prompt** — overrides for a specific piece of work (e.g., "This project is about Belle Realty — always assume commercial real estate context").

## Time budget

- Master prompt: 60 minutes (worth doing once, right)
- Style guide: 45 minutes
- About-me block: 15 minutes

## Definition of done

- Master prompt installed in at least ChatGPT, Claude, and Perplexity
- Style guide saved as a `.md` file in your `~/ai-inputs/` folder
- You've tested the prompt with 5 real requests and it produces the tone you want
