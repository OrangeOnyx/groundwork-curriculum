# Agent Brief Template

Before you build an autonomous agent, fill this out.

## The one-sentence purpose
What problem does this agent solve? If you can't say it in one sentence, refactor.

## The user journey

Describe the trigger, the agent's actions, and the outcome.

- **Trigger:** what starts the agent? (schedule, event, human request)
- **Actions:** what tools does it call, in what order?
- **Outcome:** what changes in the world when it's done?

## Tools required

| Tool | Purpose | Auth needed | Read-only? |
|---|---|---|---|
| | | | |

## Autonomy level

Pick one:
- **Suggest** — Agent produces drafts, human executes
- **Confirm** — Agent produces actions, human approves each
- **Execute** — Agent runs autonomously, human reviews after
- **Full auto** — Agent runs, human reviews only exceptions

Rule: Start at Suggest. Earn each promotion.

## Guardrails (things it will never do)

- [ ] Send external communications without approval
- [ ] Modify shared data without approval
- [ ] Spend money above $X
- [ ] Contact people outside a whitelist
- [ ] Access data outside its scope

## Escalation triggers

When the agent hits these, it stops and asks a human:
- [ ] Ambiguous input
- [ ] Missing required data
- [ ] Repeated tool failures
- [ ] Ethical / sensitive judgment call
- [ ] Cost cap approached

## Observability

- [ ] Every tool call logged with inputs, outputs, timing
- [ ] Every LLM call logged with prompt version, model, tokens, cost
- [ ] Errors alerted to owner
- [ ] Daily summary of runs

## Eval set

Before shipping, produce 5 good + 5 bad + 3 adversarial test cases. Run through the agent. Score per rubric.

## Rollback

If the agent starts misbehaving:
- Kill switch: how to stop it immediately
- Revert plan: how to undo actions taken
