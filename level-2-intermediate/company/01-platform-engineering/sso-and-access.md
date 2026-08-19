# SSO and access: who can use, deploy, and stop your agents

**Read this if:** You are about to give the third engineer on your team access to a production agent, or the AI vendor you signed up for is asking about SAML, or you can't answer "which employees can talk to our RAG?" in under 30 seconds.

**Stand-alone.** No prerequisites in this program.

## The three access questions every AI system has to answer

1. **Who can use it?** (Runtime access — sending prompts, calling tools)
2. **Who can change it?** (Build access — modifying prompts, tools, retrieval indexes, model choice)
3. **Who can stop it?** (Kill switch access — pausing, disabling, or retiring the agent)

If those three groups are the same group, you have a governance problem. If any of them is "everyone," you have a bigger one.

## The minimum bar for any production agent

- [ ] Authentication is SSO-backed (SAML or OIDC through your identity provider)
- [ ] Authorization uses groups, not individual users
- [ ] Group membership is auditable (who added, when, why)
- [ ] Deprovisioning is automatic when someone leaves (via SCIM or an equivalent)
- [ ] The kill-switch is reachable by at least two named humans who are always on shift or reachable

An agent with hardcoded API keys or shared logins is not production-ready. It's a demo.

## Recommended group layout

Copy this into your identity provider. Adjust naming to your org's conventions.

| Group | Purpose | Typical members |
|---|---|---|
| `ai-users-<agent-name>` | Runtime access — send prompts, receive drafts | End users of that specific agent |
| `ai-reviewers-<agent-name>` | Review drafts before send (Category 2 approval) | People with the authority to send on the company's behalf |
| `ai-owners-<agent-name>` | Build access — deploy, change config | The named owner and their delegates |
| `ai-admins` | Cross-cutting kill switch, cost caps, credential rotation | Platform team, security team |
| `ai-auditors` | Read-only access to traces, logs, eval history | Compliance, legal, third-party auditors |

Every agent gets its own `ai-users-` and `ai-reviewers-` group. Owners groups can be shared across small related agents. Admins and auditors are org-wide.

## Vendor-side SSO checklist

Every AI vendor you use should support the below. If they don't, know what you're accepting.

- [ ] **SAML or OIDC**, not password + 2FA
- [ ] **SCIM provisioning** so deprovisioning happens without a support ticket
- [ ] **Audit log export** so you can see who accessed what, when
- [ ] **IP allowlist** for API tokens (defense in depth)
- [ ] **Least-privilege service accounts** — no personal accounts running production
- [ ] **Session timeout** appropriate to the sensitivity (short for anything that acts, longer for read-only)
- [ ] **MFA required** for the underlying identity provider (SSO is only as strong as the IDP)

If your vendor doesn't support SCIM, you need a manual quarterly access review, and you should assume someone will keep access longer than they should.

## Service accounts and API keys: the actual dangerous surface

SSO covers humans. Service accounts and API keys are where breaches happen. Rules:

1. **One key per agent per environment.** Not "the shared prod key."
2. **Named owner on every key.** Rotate when they leave.
3. **Short-lived where possible.** OAuth client credentials with 1-hour token expiry beats a static bearer token.
4. **Scoped, not root.** The agent's key can access exactly the tools it needs, nothing else.
5. **Stored in a secrets manager.** Never in git, never in `.env` files committed to shared drives, never in Slack.
6. **Rotated on a schedule** — quarterly minimum, immediately on any incident, immediately on team departure.

If you have keys older than a year and haven't rotated because "it might break something," you already know it will break at the worst possible time. Rotate now during business hours.

## Multi-tenant SaaS twist

If your AI system serves multiple customers, add:

- **Tenant isolation at the retrieval layer.** No shared vector index across tenants without a hard partition. See [../03-rag-at-scale/multi-tenant-rag.md](../03-rag-at-scale/multi-tenant-rag.md).
- **Tenant-scoped API keys.** Customer A's key cannot call Customer B's tools even in principle.
- **Per-tenant audit trail.** You must be able to answer "everything Customer A's system touched" without joining across tenants.
- **Per-tenant kill switch.** You can disable one customer's agent without disabling everyone.

## Deprovisioning: the drill nobody runs

Run this quarterly. It's the drill that finds the actual gaps.

1. Pick a "recently departed" employee (real or simulated).
2. Time yourself: how long until every one of their accesses is gone?
   - SSO group removal (should be automatic on employment termination)
   - API keys under their name (rotated or revoked)
   - Anything they built as owner (transferred to a new owner)
   - Kill-switch reachability confirmed after their removal
3. If any step took more than one business day, you have a gap. Fix it before the next drill.

## What good looks like

You can answer these four questions from your desk in under five minutes:

- Which employees can talk to production agent X right now?
- When was the last time each API key was rotated?
- If the person who built agent X quits tomorrow, who owns it?
- If agent X starts misbehaving, which two people can kill it, and are they reachable?

If any of those takes more than five minutes, you have work to do.

## Related

- [oncall-runbook.md](oncall-runbook.md) — the incident view, where access is either an enabler or the bug
- [secrets-and-config.md](secrets-and-config.md) — the mechanics for where keys actually live
- [../02-agent-governance/kill-switch-playbook.md](../02-agent-governance/kill-switch-playbook.md) — how the kill works once you have access to trigger it
- [../02-agent-governance/agent-lifecycle.md](../02-agent-governance/agent-lifecycle.md) — when accounts get provisioned and deprovisioned across an agent's life
