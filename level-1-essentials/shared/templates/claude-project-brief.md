# Claude Project Brief

Template to design a Claude Project.

## Identity
- **Project name:**
- **Purpose (one sentence):**
- **Owner:**

## Custom Instructions

```
[Same structure as Custom GPT — see custom-gpt-brief.md]

Note: Claude's Custom Instructions can be longer than ChatGPT's. Use 500-1500 words.
```

## Knowledge files

Claude Projects hold a persistent knowledge base up to a large size cap. Prioritize:

1. **Master reference doc** — one canonical document (glossary, playbook, or spec)
2. **Style guide** — for voice
3. **Prompt library** — folder of `.md` files
4. **Domain docs** — 5–15 files max at first (add more only if quality holds)

## What NOT to upload
- Anything ephemeral (weekly reports, transient status)
- Anything crossing the privacy line
- Duplicates of already-uploaded content
- More than 30 files at once (dilutes retrieval)

## Test protocol

Ask 5 questions that test the Project's ability to use its knowledge:

1. A question directly answered by uploaded doc X — checks retrieval
2. A question requiring synthesis across two docs — checks reasoning
3. A question NOT in the docs — checks refusal/acknowledgment of limits
4. A question with an ambiguous ask — checks clarification behavior
5. A question that tests voice/tone — checks style guide adherence

## Sharing

- Personal projects — keep private
- Team projects — share within your Anthropic workspace
- Never share a project containing sensitive knowledge without a DPA in place
