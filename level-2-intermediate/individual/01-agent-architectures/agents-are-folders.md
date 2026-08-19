# Agents are folders

> Credit: this framing comes from **Jake Van Clief** and **David McDermott**, whose 2026 paper [Interpretable Context Methodology (ICM): Folder Structure as Agentic Architecture](https://arxiv.org/abs/2603.16021) formalizes what a lot of practitioners had converged on independently. Van Clief's video series and Substack ([Clief Notes](https://substack.com/@jakevanclief)) walk through it in accessible terms. The community has largely picked this up as **"agents are folders"** — a compressed slogan for a real idea.

An AI agent is not a running process. It's a folder of markdown files that a model reads when you point it at them. The model is interchangeable. The folder is the asset.

Everything else — frameworks, orchestration code, agent SDKs, multi-agent choreography — is optional plumbing built on top of that primitive.

## Why this framing matters

If you believe "an agent is a running LangChain graph," then:
- You lock yourself into one framework
- You have to redeploy to change behavior
- The agent dies when the process dies
- Non-programmers can't touch it
- Version control means Git-diffing Python
- Handoff between agents means serializing state through code

If you believe "an agent is a folder," then:
- The agent is a plain-text asset in Git
- Behavior changes are pull requests against markdown
- The runtime (Claude, GPT, Gemini, Grok, a local model) is interchangeable — pick per task
- Non-programmers can read, review, and propose changes
- Handoff between agents is: this folder's output directory is that folder's input directory
- The whole thing is portable, forkable, and inspectable

The 4 repos in this program are structured this way on purpose. Each has a small amount of TypeScript that hosts a tool surface, and the actual **agent** — the identity, the rules, the workflow — lives in markdown inside the repo.

## The same agent, four ways

Here's a maintenance-triage agent expressed in four different runtimes. Same folder, same content, different host.

### 1. As a Claude Skill (this program's repo)

```
support-triage-agent/
├── skills/
│   └── triage/
│       ├── SKILL.md         ← frontmatter + instructions
│       ├── priority-rules.md
│       └── examples/
│           ├── p1.md
│           ├── p2.md
│           └── p3.md
├── src/
│   └── tools.ts             ← draft_response, search_kb (no send)
└── README.md
```

**`skills/triage/SKILL.md`:**
```markdown
---
name: triage
description: Classify support tickets and draft responses. Use when a new ticket arrives.
---

You are a support triage agent for a property-management company.

## Priority rules
See `priority-rules.md`. P1 always includes: no heat, no water, gas leak, fire, security.

## Workflow
1. Read the incoming ticket
2. Classify priority (P1/P2/P3) using `priority-rules.md`
3. Draft a response using tone from `examples/`
4. Call `draft_response({ticket_id, priority, message})`
5. Never call a send tool — you don't have one

## Non-goals
- Never contact a tenant directly
- Never promise repair timelines you can't verify
```

The Claude Skills runtime loads `SKILL.md` on demand. `priority-rules.md` and `examples/` are pulled in when referenced.

### 2. As a Claude Code subagent

```
your-project/
├── .claude/
│   ├── CLAUDE.md              ← project-wide identity
│   ├── agents/
│   │   └── triage.md          ← the agent
│   └── commands/
│       └── triage-inbox.md    ← slash command that invokes it
├── docs/priority-rules.md
└── src/
```

**`.claude/agents/triage.md`:**
```markdown
---
name: triage
description: Support-ticket triage. Auto-invoke when I ask about tickets.
tools: [Read, Grep, Write]
model: claude-sonnet-4
---

You are a support triage agent...

(same body as the Claude Skill above — the content moves, the frontmatter changes)
```

Claude Code discovers the file via the `.claude/agents/` convention. Same content, wrapped in Claude-Code-specific frontmatter.

### 3. As an OpenAI Assistant

```
support-triage-agent/
├── agent-config/
│   ├── system-prompt.md       ← same content, without frontmatter
│   ├── tools.json             ← OpenAI function schemas
│   └── deploy.ts              ← creates or updates the Assistant
└── src/
    └── tools.ts               ← same tool implementations
```

**`agent-config/deploy.ts`:**
```typescript
import OpenAI from 'openai';
import { readFile } from 'node:fs/promises';

const client = new OpenAI();
const instructions = await readFile('./agent-config/system-prompt.md', 'utf8');
const tools = JSON.parse(await readFile('./agent-config/tools.json', 'utf8'));

await client.beta.assistants.create({
  name: 'triage',
  instructions,
  tools,
  model: 'gpt-4o-2024-11',
});
```

Same markdown, different runtime, wrapped in an SDK call. The `system-prompt.md` is the agent. `deploy.ts` is deployment plumbing you write once.

### 4. As a Perplexity Computer custom skill

```
~/perplexity-skills/triage/
├── SKILL.md
├── priority-rules.md
└── examples/
```

**`SKILL.md`:**
```markdown
---
name: triage
description: Support triage for property-management tickets. Use when asked to triage a support inbox or classify a ticket.
---

You are a support triage agent...

(same body again)
```

Uploaded via `save_custom_skill`. Same content once more.

## What actually changes between the four?

| Field | Claude Skills | Claude Code | OpenAI Assistant | Perplexity Skill |
|---|---|---|---|---|
| **Body of the instructions** | Identical | Identical | Identical | Identical |
| **Frontmatter format** | `name` + `description` | `name` + `description` + `tools` + `model` | none — sent as JSON to API | `name` + `description` |
| **How the runtime finds it** | User invokes via slash / natural language | Auto-invoked from `.claude/agents/` | Fetched from OpenAI dashboard | Auto-invoked when description matches |
| **Where tools are defined** | Host codebase (MCP or in-repo) | `tools:` list references built-ins | `tools.json` | Host codebase or connectors |
| **How you edit it** | Edit markdown, restart | Edit markdown, next turn | Edit markdown, redeploy | Edit markdown, upload |

Everything that matters is the same. The persistent asset — the thing that captures the agent's actual behavior — is the markdown body. Everything else is runtime tax.

## Consequences

**1. Don't overinvest in one runtime.** If your agent is a folder, migrating from Assistants API to Claude Skills to Perplexity is a ~30-minute exercise per agent. If your agent is a LangGraph, migration is a rewrite.

**2. Version control your agents in Git, not in a vendor dashboard.** The dashboard is a cache. Git is the source of truth. If the vendor deletes your agent tomorrow, you clone your repo and redeploy.

**3. Design for composition, not for cleverness.** The most interesting agents in this program are the ones that hand off structured data to each other (see [module 13 — combine two agents](../13-combine-two-agents)). That composition works because each agent is a folder with an input contract and an output contract, not because there's a fancy multi-agent framework wiring them together.

**4. Read a stranger's agent by reading their folder.** No debugger, no dashboard, no framework knowledge required. `cd` in, `cat` the markdown, understand the agent. This is a form of literacy the whole industry underweights.

## Where this framing gets tested

Van Clief and McDermott's paper explicitly notes that ICM is **best for sequential workflows where a human reviews between stages**. When you need parallel agents coordinating in real time with shared mutable state, filesystem-as-orchestrator gets awkward and you probably do want a framework.

But most real-world agent workflows — the ones this program teaches — are sequential with human review. That's the sweet spot. Ninety percent of the professional AI systems being deployed today are shaped like: input → agent stage 1 → human review → agent stage 2 → human review → output. For that shape, the folder IS the framework.

## Read more

- [ICM paper — Van Clief & McDermott, 2026](https://arxiv.org/abs/2603.16021)
- [Clief Notes on Substack](https://substack.com/@jakevanclief)
- [ICM Folder Structure — LLM Wiki](https://blog.imfsoftware.com/llm-wiki/docs/sources/icm-folder-structure/)
- [Interpretable Context Methodology — AP0110 Wiki](https://ap0110.org/wiki/interpretable-context-methodology/)
- Related in this program: [`../13-combine-two-agents`](../13-combine-two-agents) (composition through folders)
- Related in this program: [starter-packs](../../../shared/starter-packs/) (folder templates for 8 platforms)
