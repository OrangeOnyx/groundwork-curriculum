# On-call runbook: when the AI stack breaks

**Read this if:** You are on call and an agent, RAG pipeline, or LLM gateway is misbehaving. You need the shortest path to "safe" — not a full incident write-up.

**Stand-alone.** You don't need the rest of this program to use it.

## Severity, in one paragraph

- **SEV-1**: The agent is actively doing harm right now — sending wrong emails, leaking data, spending money. **Kill it. Then read the rest of this doc.**
- **SEV-2**: The agent is producing bad output but not acting on it (drafts a human is reviewing). Contain, do not necessarily kill.
- **SEV-3**: Cost, latency, or eval regression. Fix during business hours.
- **SEV-4**: A single user complaint. File a ticket. Do not page anyone.

If you're reading this at 2 AM, the question is: is anything reaching external humans or systems right now? If yes, SEV-1.

## SEV-1: kill first, investigate second

1. **Flip the kill switch.** Every production agent must have one. If you don't know where it is, that's your first bug and it's serious.
   - Prefer a config flag (`enabled: false`) over deleting the deployment. You want to preserve state for post-mortem.
   - If the flag doesn't exist, revoke the agent's credentials at the source (IAM, API keys). Slower to recover, but effective.
2. **Announce.** Post in your incident channel: what agent, what symptom, what you just did.
3. **Freeze inputs.** If the agent is fed by a queue or webhook, pause the source too. You don't want a backlog to replay through a fixed agent that hasn't earned trust yet.
4. **Snapshot state.** Grab the last 100 traces, the current config, the eval history. Store in the incident folder before anything gets rotated.
5. **Assign an owner** if you're not it. The named owner of the agent is on point. If they're unreachable, their manager is.

## SEV-2: contain, don't kill

The agent is drafting, not acting. You have time.

1. **Flip auto-send to false** on every tool the agent has, if it isn't already.
2. **Increase the sampling rate** on the human review — every draft gets reviewed, not one in ten.
3. **Enable verbose logging** so you can see what changed.
4. **Do not roll back yet.** You don't know what to roll back to. Diagnose first.

## The diagnostic checklist

Work through these in order. Stop at the first one that explains the symptom.

1. **Did anything deploy in the last 24 hours?** Model, prompt, retrieval index, tool permissions, config. Check the change log. Rollback beats debug.
2. **Is the underlying model behaving?** Hit the model directly (no agent, no RAG) with a known-good prompt. If the raw model is bad, you have an upstream problem — check provider status page.
3. **Is retrieval returning garbage?** Log the top-K chunks for a failing query. If the chunks are irrelevant, the index is stale, poisoned, or the embedding model changed. See [../03-rag-at-scale/refresh-orchestration.md](../03-rag-at-scale/refresh-orchestration.md).
4. **Did the tool interface change?** External APIs the agent calls sometimes silently change response shape. Check the tool call logs for HTTP 200 with unexpected payload shape.
5. **Is a specific user or tenant triggering it?** Filter traces by user_id. If it's one tenant, you have a data problem in their scope — see [../03-rag-at-scale/multi-tenant-rag.md](../03-rag-at-scale/multi-tenant-rag.md).
6. **Is it prompt injection?** If the failing inputs contain instructions targeting the agent ("ignore previous instructions", "forget your rules"), you're being attacked. Escalate to security.
7. **Cost spike?** If the symptom is bill, not behavior, check for infinite tool-use loops. See [../06-cost-management/spend-alerting.md](../06-cost-management/spend-alerting.md).

## The rollback rules

You may roll back without a full post-mortem when:

- The change was less than 24 hours ago
- You have the previous config in version control
- The rollback path is documented and tested
- No data model migration happened in the same window

You must **not** roll back without a plan when:

- The change touched a data schema
- Multiple systems changed at once
- The current state has already caused data changes that a rollback can't undo (e.g., you already sent emails)

If any of those apply, treat the current state as the new baseline and fix forward. Add "roll forward is now the only option" to the incident record.

## The 24-hour post-incident checklist

- [ ] Timeline written (what happened, when, in UTC)
- [ ] Root cause identified (not the trigger — the underlying reason a trigger caused this)
- [ ] Eval case added that would have caught it before ship
- [ ] Kill-switch verified still works after the fix
- [ ] Approval category re-checked (did we have this in the wrong category?)
- [ ] Any customer-facing damage identified and communicated
- [ ] Doc updated: this runbook, if it was unclear during the incident

## What this doc explicitly does not cover

- **Model outages.** Follow your provider's status page and your fallback strategy from [llm-gateway-buildout.md](llm-gateway-buildout.md).
- **Full post-mortem writeup.** See your existing incident template.
- **Legal or PR response.** Escalate to those functions immediately for any SEV-1 with external impact.

## Related

- [../02-agent-governance/kill-switch-playbook.md](../02-agent-governance/kill-switch-playbook.md) — where the kill switch actually is
- [../02-agent-governance/approval-flows.md](../02-agent-governance/approval-flows.md) — the categories you are enforcing
- [observability-stack.md](observability-stack.md) — the traces you need for step 4 above
- [sso-and-access.md](sso-and-access.md) — how to revoke access at the source in step 1 of SEV-1
