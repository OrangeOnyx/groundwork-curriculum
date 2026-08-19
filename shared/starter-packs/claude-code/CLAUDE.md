# <YOUR PROJECT NAME>

<One paragraph. What is this repo? What does it do? Who does it serve?>

## Stack

- **Language:** <TypeScript / Python / Go>
- **Framework:** <Next.js / FastAPI / etc.>
- **Database:** <Postgres via Supabase / etc.>
- **Deploy target:** <Vercel / Railway / Cloudflare / etc.>
- **Test runner:** <Vitest / pytest>
- **Package manager:** <npm / pnpm / uv>

## Layout

```
src/
  lib/          reusable libraries and helpers
  routes/       HTTP entrypoints (or app/ for Next.js)
  jobs/         scheduled or one-off scripts
tests/          test files, mirroring src/ layout
docs/           architecture, decisions, runbooks
.claude/        Claude Code config
  agents/       subagents (see below)
  commands/     slash commands
```

## Conventions

- **TypeScript strict.** No `any`. Use `unknown` and narrow.
- **Zod validates every external input.** HTTP bodies, env vars, LLM outputs.
- **Errors bubble typed.** Custom `AppError` class with a discriminated `code`.
- **Tests live with code.** `foo.ts` → `foo.test.ts` alongside.
- **Migrations are numbered and forward-only.** No editing shipped migrations.

## How to help me

- **Read a nearby file before writing new code.** Match the style you see.
- **Ask before installing a new dependency.** Suggest, don't add.
- **Small diffs.** If I asked for one function, don't refactor three others.
- **Real tests.** Not `expect(true).toBe(true)`. Test the actual behavior.
- **When you're unsure about a decision, check `docs/decisions/`.**

## Non-goals

- <e.g., "This isn't a general-purpose CRM. Don't propose CRM features.">
- <e.g., "No client-side state management library. Server state via React Query is enough.">

## Available subagents

- `code-reviewer` — invoke by asking for a review of recent changes
- `writer` — invoke for docs, READMEs, changelogs

## Available slash commands

- `/plan` — write a plan before executing a task
- `/eval` — run the eval suite against a change

## Where things live

- Deploy commands: `docs/runbooks/deploy.md`
- Onboarding: `docs/runbooks/onboarding.md`
- Decisions: `docs/decisions/` (one file per ADR)
- Open questions: `docs/open-questions.md`

## Credentials

Never commit credentials. `.env.local` is gitignored. Production secrets live in <Vercel / Railway / etc.>.
