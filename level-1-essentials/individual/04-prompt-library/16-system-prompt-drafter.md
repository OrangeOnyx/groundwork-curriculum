# System Prompt Drafter

**Purpose:** Draft a system prompt for a new Custom GPT / Project / agent.

**When to use:** When you're building a new assistant for a specific role or domain.

**Category:** Meta

**Model recommendation:** Claude Opus.

---

## The prompt

```
Draft a system prompt for a new AI assistant.

Purpose: {PURPOSE}
Audience: {WHO_USES_IT}
Domain: {DOMAIN}
Voice: {VOICE — inherit mine or specific}
Key knowledge it should have: {KNOWLEDGE}
Behaviors that matter most: {BEHAVIORS}
Things it must never do: {NEVERS}

Format:

## System prompt
```
[the drafted system prompt, 400–800 words]
```

## Design notes
Bulleted — key choices you made and why.

## Test prompts
5 prompts to run against the assistant to validate its behavior.

## Suggested knowledge files to attach
Bulleted list of documents to upload as reference.

Rules:
- Structure: Identity → Behavior → Format → Voice → Constraints → Meta.
- No filler ("You are a helpful assistant" is banned).
- Include specific "do not" rules where drift is most likely.
```

## Variables

- All fields above

## Example use case

A legal-triage assistant for NDAs.

## Expected output shape

System prompt + notes + tests + knowledge list.
