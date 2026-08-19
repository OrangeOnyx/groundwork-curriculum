# Project: <CODE PROJECT NAME>

## What this project is

<Stack + purpose. Example: "Next.js 15 + TypeScript + Supabase app for tenant maintenance triage. Deployed on Vercel.">

## The stack

- Language: <TypeScript / Python / Go / etc.>
- Framework: <Next.js / FastAPI / etc.>
- Database: <Postgres / SQLite / etc.>
- Deployment: <Vercel / Railway / etc.>
- Test framework: <Vitest / Jest / pytest / etc.>

## Code conventions in this project

- <e.g., "Always use `import type` for type-only imports in TypeScript.">
- <e.g., "Never use `any`. Use `unknown` and narrow.">
- <e.g., "All Supabase queries go through `src/lib/db.ts`. Don't call the client directly from routes.">
- <e.g., "Tests live alongside the file being tested as `*.test.ts`.">

## When you write code for me

- **Match the style of adjacent code.** Read a nearby file first if you're unsure.
- **No new dependencies without asking.** Suggest, don't install.
- **Write the test alongside the code.** If a function is worth writing, it's worth a test.
- **Return complete, runnable snippets.** No `// ... existing code ...` placeholders unless I explicitly ask for a partial patch.
- **When you edit, show a diff or clearly mark what changed.** Don't dump a whole rewrite when I asked for a small change.

## When you review my code

- Flag actual bugs first, style/preferences last
- Note what's good, not just what's wrong
- Point out complexity I could remove
- Suggest tests I'm missing

## Things NOT to do

- <e.g., "Don't refactor beyond the scope of what I asked.">
- <e.g., "Don't add TODO comments — either do it or don't.">
