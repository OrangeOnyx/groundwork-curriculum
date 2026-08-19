# Anthropic Console starter pack

For [console.anthropic.com](https://console.anthropic.com/) — direct API access to Claude via the SDK. This pack is system-prompt patterns for when you're calling the API from your own code, not the Claude.ai product.

## Files in this pack

- [`system-prompt-base.md`](./system-prompt-base.md) — a generic base system prompt for a task-focused assistant
- [`system-prompt-classifier.md`](./system-prompt-classifier.md) — for classification tasks (returns structured output)
- [`system-prompt-extractor.md`](./system-prompt-extractor.md) — for data extraction from documents
- [`system-prompt-agent.md`](./system-prompt-agent.md) — for tool-using agents

## How to use

These are meant to be read into your code and passed as the `system` field:

```typescript
import Anthropic from '@anthropic-ai/sdk';
import { readFile } from 'node:fs/promises';

const client = new Anthropic();
const systemPrompt = await readFile('./prompts/system-prompt-base.md', 'utf8');

const response = await client.messages.create({
  model: 'claude-sonnet-4',
  max_tokens: 4096,
  system: systemPrompt,
  messages: [{ role: 'user', content: userInput }],
});
```

## The prompt-caching gotcha

Anthropic supports prompt caching for system prompts >1024 tokens. If your system prompt is stable across calls, wrap it in a cache_control breakpoint:

```typescript
system: [
  {
    type: 'text',
    text: systemPrompt,
    cache_control: { type: 'ephemeral' },
  },
],
```

You'll pay 25% more on the first call and 90% less on subsequent calls within 5 minutes. For any workload calling the same system prompt more than 2× per 5 minutes, this pays for itself immediately.

## Model-name gotcha

Model names shift. Check the [current models list](https://docs.anthropic.com/en/docs/about-claude/models) rather than hardcoding an old version. Aliases like `claude-sonnet-4` track the current generation.

## Related program modules

- [`level-2-intermediate/individual/02-build-first-agent`](../../../level-2-intermediate/individual/02-build-first-agent) — end-to-end example that uses the API
- [`level-2-intermediate/individual/08-cost-engineering`](../../../level-2-intermediate/individual/08-cost-engineering) — prompt caching and token math
