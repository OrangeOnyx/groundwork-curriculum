# Pre-commit checklist for the AI Fluency Program

Run through this before every commit. The CI workflow (`.github/workflows/quality.yml`) runs three checks: **broken links fail the build**, brand names and module coverage emit **warnings only** so the report stays honest without blocking merges. Items marked **[FAIL]** are enforced. Items marked **[WARN]** are advisory but should trend to zero over time. The rest are on you.

## Voice and neutrality

- [ ] **[WARN]** No unapproved brand names in content (`Belle Realty`, `Orange Ocean`, `On The Blvd`, `On The Boulevard`, `OrangeOnyx`, `Deal Leverage`, `OTB`)
  - Exceptions: the OrangeOnyx GitHub URL in cross-links to companion repos is allowed
- [ ] Adam is not referenced by name outside of a small number of hero examples and the shared cover-letter files
- [ ] Every doc reads generically enough that a stranger could apply it to their own work

## Content quality

- [ ] Every new module has a README that a reader can enter without having read anything else
- [ ] Any technique or practice recommended has an eval, a measurement, or a check — not "vibes"
- [ ] Every HITL-shaped example ships with `auto_send: false` or an equivalent default-off flag
- [ ] Every claim about a paper, tool, or vendor has a link

## Links and structure

- [ ] **[FAIL]** No broken relative Markdown links (all `[text](file.md)` targets exist)
- [ ] **[WARN]** New files under a module directory are referenced from that module's README
- [ ] External links to Groundwork use `https://groundwork.adamabdalla.com`

## Any-level entry

- [ ] Someone jumping into your new file cold can act on it — no hidden prerequisites
- [ ] Cross-refs are one-click, not "see section 3.2"

## Attribution

- [ ] Any technique borrowed from a named author cites that author (e.g., Van Clief for "agents are folders")
- [ ] Any paper cited has its arxiv/DOI link inline

## Companion repos

If you touched a file in `level-2-intermediate/repos/*` or a walkthrough that references a companion repo (`belle-mcp-server`, `lease-abstractor`, `support-triage-agent`, `diligence-agent`):

- [ ] The companion repo is still at the URL you're linking to
- [ ] The referenced example (file, function, or scenario) still exists in that repo

## Local run

Before pushing:

```bash
# From repo root
python3 .github/scripts/quality_check.py
```

This runs the same checks CI runs. Fix every FAIL. Track WARN counts down over time.

## Cleanup roadmap (as of this file's creation)

The repo carries legacy Orange-Ocean-specific examples and level-3+ module READMEs that don't index their sibling files. These are the warnings you'll see today. The cleanup path:

1. Sweep brand names by directory, starting with `level-3-advanced/eli10/` — replace named examples with generic ones
2. For each level-3 module README, add the sibling-file index at the top
3. Rerun `python3 .github/scripts/quality_check.py`, expect WARN count to drop
4. When WARN count reaches zero, flip the CI workflow to `--strict` so warnings become failures

New content added from this point on **must ship green** — use the scanner locally before committing new files.
