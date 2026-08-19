# Claude Code starter pack

For [Claude Code](https://docs.anthropic.com/en/docs/claude-code) — Anthropic's terminal coding agent. Configuration lives in your repo as plain files, which is the whole point.

## What Claude Code reads

At the start of every session, Claude Code auto-loads (in order):
1. Global config at `~/.claude/CLAUDE.md`
2. Repo config at `<repo>/.claude/CLAUDE.md` (or `<repo>/CLAUDE.md`)
3. Any subfolder `CLAUDE.md` it navigates into

It also discovers, on demand:
- **Subagents** in `.claude/agents/*.md` — invoked by description match
- **Slash commands** in `.claude/commands/*.md` — invoked by name
- **Skills** in `.claude/skills/<name>/SKILL.md` — invoked by description match

The pattern that works: **CLAUDE.md is short. Skills, subagents, and commands hold the detail.**

## Files in this pack

- [`CLAUDE.md`](./CLAUDE.md) — starter root config
- [`agents/code-reviewer.md`](./agents/code-reviewer.md) — a subagent that reviews changes
- [`agents/writer.md`](./agents/writer.md) — a subagent for prose writing
- [`commands/plan.md`](./commands/plan.md) — a slash command for planning before doing
- [`commands/eval.md`](./commands/eval.md) — a slash command for running eval suites

## How to install

```bash
# In your repo root:
mkdir -p .claude/agents .claude/commands
cp path/to/this/pack/CLAUDE.md ./CLAUDE.md
cp path/to/this/pack/agents/*.md .claude/agents/
cp path/to/this/pack/commands/*.md .claude/commands/

# Edit CLAUDE.md and replace the placeholders
```

For a global config (applies to every repo you open):
```bash
mkdir -p ~/.claude
cp CLAUDE.md ~/.claude/CLAUDE.md
```

## Gotchas

- **Subagents match by description, not filename.** Write descriptions that describe when to use the agent, not what the agent is.
- **Slash commands take arguments.** Use `$ARGUMENTS` in the command body to reference them.
- **Nested CLAUDE.md files are additive.** A `src/CLAUDE.md` layers on top of the root one when Claude is working in `src/`.
- **Auto-invocation can surprise you.** If your description is too broad ("use for coding tasks"), the agent will fire on things you didn't intend.
