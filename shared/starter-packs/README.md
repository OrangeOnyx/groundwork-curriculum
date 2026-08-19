# Starter packs

Generic, ready-to-copy custom instructions and starter files for the AI platforms most professionals use daily. Each folder is standalone. Copy what you need, replace `<YOUR NAME>`, `<YOUR ROLE>`, and other placeholders, and paste it into the platform.

The philosophy: **give the AI enough context to act like it already knows you, without pretending it does.**

Every pack starts from the same base assumptions:
- You want the AI to be direct, not sycophantic
- You want structured output when it's a task
- You want the AI to say "I don't know" instead of guessing
- You want to keep the persistent asset (your instructions) portable across vendors

The eight packs:

| Platform | What it configures | Where it lives |
|---|---|---|
| [claude-ai](./claude-ai) | Claude.ai Projects — user profile + project instructions | Web UI settings & project sidebar |
| [claude-code](./claude-code) | `.claude/CLAUDE.md`, `.claude/agents/`, `.claude/commands/` | Your repo |
| [anthropic-console](./anthropic-console) | System-prompt patterns for API/SDK usage | Your code |
| [chatgpt](./chatgpt) | ChatGPT Custom Instructions + Projects | Web UI settings |
| [perplexity](./perplexity) | Perplexity Computer memory + custom skill starter | Your account |
| [cursor](./cursor) | `.cursorrules` and `.cursor/rules/` | Your repo |
| [grok](./grok) | Grok custom instructions | Web UI settings |
| [gemini](./gemini) | Gemini Gems | Web UI |

## Fastest path: bootstrap.sh

For Cursor and Claude Code (the two IDE/CLI targets), one command installs the right files in the right places:

```bash
# from your project root, using a checkout of this repo:
bash /path/to/ai-fluency-program/shared/starter-packs/bootstrap.sh

# or without a checkout:
bash <(curl -sL https://raw.githubusercontent.com/OrangeOnyx/ai-fluency-program/master/shared/starter-packs/bootstrap.sh)
```

It auto-detects Cursor (via `.cursor/` or `.cursorrules`) and Claude Code (via `.claude/` or `CLAUDE.md`). For web-based tools (Claude.ai, ChatGPT, Perplexity, Grok, Gemini, Anthropic Console) it prints paste-ready contents to stdout. Any existing files are backed up with a `.bak.<timestamp>` suffix before being overwritten — the script is idempotent and never deletes.

See `bash bootstrap.sh --help` for flags (`--target`, `--print`, `--dry-run`, `--list`).

## Manual: how to actually use these

**Step 1 — Pick one platform to start.** Don't try to configure all 8 at once. Start with the one you use most, get value from it, then port the pattern.

**Step 2 — Read the platform's README.** Each pack explains the platform's specific quirks (e.g., ChatGPT truncates custom instructions at 1500 chars; Claude Code auto-invokes agents by description match).

**Step 3 — Copy the base template.** Replace placeholders. Don't add complexity you don't need yet.

**Step 4 — Iterate.** Every 2 weeks, ask yourself: "What did the AI do this week that made me correct it?" Add a line to your instructions that would have prevented that correction. That's how the instructions become genuinely yours.

## Portability

The base template — the actual instructions that describe you and how you want the AI to behave — is roughly the same across platforms. Only the wrapper changes. Keep your master version in one place (a notes app, your Git dotfiles, wherever) and treat each platform's config as a rendering of that master.

When a new platform arrives, you'll spend 10 minutes wrapping it, not 4 hours writing it.

## What NOT to put in custom instructions

- Sensitive credentials or API keys (custom instructions get logged by the vendor)
- Very long lists of "always do X, never do Y" (models satisfice — pick your top 5)
- Contradictions (e.g., "be brief" and "always explain in detail")
- Anything you'd be embarrassed to have appear in a support ticket screenshot

## The AI fluency program

These starter packs support the [AI Fluency Program](../..) — a Level 1 → Level 2 curriculum for going from novice to governed power user. If you haven't gone through Level 1 yet, start there.
