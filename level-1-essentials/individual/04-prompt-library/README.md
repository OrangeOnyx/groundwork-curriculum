# 04 — Prompt Library

Twenty reusable prompts. Each one is a proven pattern for a common task.

## How prompts are organized here

Each prompt is its own file: `NN-slug.md`. The file contains:
1. **Purpose** — one sentence
2. **When to use** — trigger conditions
3. **The prompt** — copy-paste-ready
4. **Variables** — what to fill in
5. **Model recommendation** — which model handles this best
6. **Example** — one filled-in example

## The 20 starters

| # | Prompt | Category |
|---|---|---|
| 01 | Email reply drafter | Communication |
| 02 | Meeting summarizer | Communication |
| 03 | Decision memo | Communication |
| 04 | Slack message polisher | Communication |
| 05 | Executive update writer | Communication |
| 06 | Research brief generator | Research |
| 07 | Competitive teardown | Research |
| 08 | Article-to-notes extractor | Research |
| 09 | Fact-checker with citations | Research |
| 10 | Code reviewer | Engineering |
| 11 | Bug diagnostician | Engineering |
| 12 | Doc-from-code writer | Engineering |
| 13 | Test case generator | Engineering |
| 14 | SQL query builder | Engineering |
| 15 | Prompt improver | Meta |
| 16 | System prompt drafter | Meta |
| 17 | Copy rewriter (voice-preserving) | Writing |
| 18 | Structured document extractor | Writing |
| 19 | Weekly review generator | Personal ops |
| 20 | Decision journal entry | Personal ops |

## Extending the library

Every time you write a prompt more than twice, save it. Format:
- Copy `_TEMPLATE.md`
- Fill in the six sections
- Commit to your prompts repo

## How to install the library

Once written, upload the entire folder as knowledge to:
- Your primary Custom GPT
- Your primary Claude Project
- Your primary Perplexity Space

Then any conversation can reference the library by name: "Use the meeting-summarizer prompt."
