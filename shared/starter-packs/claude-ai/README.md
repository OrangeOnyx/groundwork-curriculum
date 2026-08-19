# Claude.ai starter pack

For [claude.ai](https://claude.ai) — Anthropic's consumer product with Projects, Custom Instructions, and Artifacts.

## What Claude.ai gives you to configure

1. **Profile-level custom instructions** — apply to every conversation. Set once per account.
2. **Project instructions** — apply only to chats inside a Project. Layer over the profile.
3. **Project knowledge files** — up to 200MB of reference material Claude reads when relevant.

The pattern that works: **profile stays generic; each project's instructions are specific.**

## Files in this pack

- [`profile-custom-instructions.md`](./profile-custom-instructions.md) — paste into Settings → Personalization
- [`project-instructions-generic.md`](./project-instructions-generic.md) — paste into any new Project's sidebar
- [`project-instructions-code.md`](./project-instructions-code.md) — specialized version for coding projects
- [`project-instructions-writing.md`](./project-instructions-writing.md) — specialized version for writing projects

## How to install

1. Go to [claude.ai/settings](https://claude.ai/settings) → Personalization
2. Paste `profile-custom-instructions.md` (edit the placeholders first)
3. Create or open a Project
4. Paste one of the `project-instructions-*.md` files into the project's Custom Instructions
5. Upload reference materials to the Project's knowledge base

## Character limits (as of 2026)

Profile custom instructions: no hard cap but effective cap ~4000 chars.
Project instructions: no hard cap but effective cap ~5000 chars.

Keep them under 3000 to leave headroom.

## Gotchas

- **Custom instructions apply to Artifacts too.** If your instructions say "always cite sources," artifact code will include comment citations.
- **Projects don't share memory with plain chats.** Your profile instructions are the only continuity.
- **Uploaded files in a Project are re-read on demand, not held in context always.** Reference them by name in your project instructions if you always want them consulted.
