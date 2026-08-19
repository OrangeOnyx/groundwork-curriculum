# Cursor starter pack

For [Cursor](https://cursor.com) — the AI-first IDE. Configuration lives in your repo as `.cursorrules` (legacy) or `.cursor/rules/` (newer, per-context rule files).

## What Cursor gives you to configure

1. **`.cursorrules`** at repo root — global rules for the whole repo (older format, still supported)
2. **`.cursor/rules/*.mdc`** — newer per-scope rules with globs and metadata
3. **`.cursorignore`** — files Cursor's AI never reads
4. **Composer commands and shortcuts** — configured in Cursor Settings, not in the repo

## Files in this pack

- [`.cursorrules`](./.cursorrules) — general rules for any project
- [`rules-typescript.mdc`](./rules-typescript.mdc) — TypeScript-specific, scoped to `*.ts`/`*.tsx`
- [`rules-python.mdc`](./rules-python.mdc) — Python-specific, scoped to `*.py`
- [`rules-react.mdc`](./rules-react.mdc) — React/JSX rules, scoped to `*.tsx`/`*.jsx`
- [`.cursorignore`](./.cursorignore) — starter ignore list

## How to install

```bash
# In your repo root:
cp path/to/this/pack/.cursorrules ./.cursorrules
cp path/to/this/pack/.cursorignore ./.cursorignore

mkdir -p .cursor/rules
cp path/to/this/pack/rules-*.mdc .cursor/rules/
```

Rename or delete the language-specific ones you don't need.

## `.mdc` file structure

Cursor's newer rules use MDX-like frontmatter:

```mdc
---
description: TypeScript conventions
globs: ["**/*.ts", "**/*.tsx"]
alwaysApply: false
---

Your rule content here in markdown.
```

`alwaysApply: false` + a glob = Cursor applies these rules only when working on matching files. This keeps your general rules light and language-specific rules focused.

## Gotchas

- **Rules are advisory, not enforcing.** Cursor's model tries to follow them; it doesn't guarantee. Keep the important ones short.
- **`.cursorrules` vs `.cursor/rules/`** — Cursor reads both, but if you have both, the `.mdc` files take priority for their scoped globs. Pick one system and stick with it.
- **`.cursorignore` is not `.gitignore`.** It only prevents Cursor from reading files. Use it for large generated files, vendor code, and sensitive configs.
- **Composer's "codebase" mode indexes everything.** If your rules say "match existing style," Cursor CAN see the codebase and will actually follow this.
