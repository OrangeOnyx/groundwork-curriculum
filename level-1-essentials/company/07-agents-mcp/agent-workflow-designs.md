# The Three Starter Agent Workflows

The first three agents to deploy. Each is high-ROI, bounded, and safe to start with HITL.

## Agent 1 — Inbox Triage Agent

### What it does
Every 2 hours during working hours, scans each employee's inbox and:
- Classifies new emails (Reply-today, Reply-this-week, FYI, Newsletter, Trash)
- Drafts responses for the Reply-today items (using the email-reply-drafter prompt)
- Files newsletters and archives obvious noise
- Posts a summary to Slack DM: "3 replies ready, 8 FYIs, 22 archived"

### Autonomy level
**Suggest + partial execute.** Drafts saved, obvious trash archived, but nothing sent.

### Tools required
- MCP-03 Email (read, draft, archive — not send)
- Slack DM to owner

### Guardrails
- Never send email
- Never delete permanently (only archive)
- Never touch flagged / starred / VIP emails without asking

### Eval set
5 good + 5 hard test cases per employee's inbox during pilot.

### Rollout
- Week 1: internal beta with the AI Champion
- Week 2: expand to Steering Committee
- Week 3: pilot with a full department
- Week 4: broader rollout with per-user opt-in

## Agent 2 — Meeting-Notes-to-CRM Agent

### What it does
After every sales call (detected via calendar + transcription integration):
- Retrieves the transcript from Otter / Fireflies / Gong
- Extracts structured fields: attendees, deal stage, next step, close date, budget signals, competitors mentioned
- Proposes CRM updates for the AE to approve
- Drafts a follow-up email

### Autonomy level
**Suggest.** All CRM updates and emails are drafts requiring AE approval.

### Tools required
- Transcription platform integration (Otter, Fireflies, Gong)
- MCP-04 CRM (read + propose)
- MCP-03 Email (draft only)

### Guardrails
- Never modify CRM records without AE approval
- Never send emails
- Store the transcript reference for audit

### Eval set
20 real recorded calls with known ground truth of what should be extracted.

### Rollout
- Week 1: 3-AE beta
- Week 2: full sales team pilot
- Week 3: measure adoption + accuracy
- Week 4: refine based on feedback, promote to standard workflow

## Agent 3 — Weekly Report Generator

### What it does
Every Friday at 3pm, generates a personalized weekly report for each employee:
- Pulls from Calendar, Slack messages sent, tickets/issues closed, docs edited
- Runs the weekly-review prompt (`individual/04-prompt-library/19-weekly-review.md`)
- Sends the report to the employee's DM
- Optionally rolls up to team dashboards

### Autonomy level
**Full auto.** Report is generated and delivered without human intervention. But it's read-only — no external actions.

### Tools required
- MCP-02 Calendar (read)
- Slack (read own messages, DM output)
- Ticketing (read closed tickets)
- Docs (read edit history)

### Guardrails
- Report only to the individual, never shared publicly
- No PII of others in reports
- Employees can opt out anytime

### Eval set
5 employees × 3 weeks of manual weekly reports vs generated. Compare.

### Rollout
- Week 1: opt-in beta with 10 employees
- Week 2: iterate on report format based on feedback
- Week 3: broad opt-in launch

## Common pattern

Notice the shape:

1. **Bounded scope** — one job, well-defined
2. **HITL by default** — earn autonomy
3. **Read before write** — start read-only, add write behind approval
4. **Eval set before ship** — 5+5 minimum, ground truth from real data
5. **Staged rollout** — beta → pilot → department → org
6. **Kill switch** — every agent can be paused per-user or globally

## Anti-patterns

**Don't build first:**
- Anything that sends external communications autonomously
- Anything that modifies shared systems (CRM records, financials) without HITL
- Anything with a false-positive cost the organization can't tolerate
- "Agent that does everything" — narrow beats broad

## Progression: what to build next

After the first three are stable (usually month 3–4):

- Meeting scheduler agent (proposes times, employees confirm)
- Contract clause extractor
- Support-ticket first-draft agent (draft only; agent sends)
- Weekly team update aggregator (opt-in per team)
- Newsletter and press monitor
- Executive briefing preparation

Each new agent goes through the same lifecycle: brief → build → eval → beta → pilot → rollout.
