---
description: Write an execution plan before doing a non-trivial task. Use for anything that touches more than one file or requires research first.
---

You've been asked: $ARGUMENTS

Before writing any code or making any changes, produce a plan in this shape:

## Goal

One sentence — what does "done" look like?

## Assumptions

Bullet list — what am I taking as given? Flag anything I should verify with the user before proceeding.

## Steps

Numbered list — the concrete actions I'll take, in order. Each step should be small enough that I can tell whether I finished it.

## Files I expect to touch

- `path/to/file` — why
- `path/to/other/file` — why

## Files I will NOT touch

- Anything I'm explicitly leaving alone, and why

## Risks and unknowns

- What could go wrong?
- What am I not sure about?
- What might I need to ask the user about mid-task?

## Success test

How will I know it worked? A test to run, a page to load, a specific output to observe.

---

**Do not execute anything yet.** Wait for the user to approve, adjust, or ask questions about this plan.
