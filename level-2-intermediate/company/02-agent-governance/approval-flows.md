# Approval flows: the three-tier framework, operationalized for teams

**Read this if:** You are about to let an agent send email, edit a database, spend money, or make any change that a customer, employee, or regulator will see. You need a rule set your team can actually apply under pressure.

**You do not need to have read anything else in this program to use this doc.** It stands alone.

## The one idea

Every agent action falls into exactly one of three categories. The categories are not descriptive — they are prescriptive. The category decides whether a human is in the loop.

| Category | Rule | Human in loop? | Typical latency |
|---|---|---|---|
| **1. Auto-Execute** | Low-risk, reversible, internal-only, cheap to correct | No | Seconds |
| **2. Draft and Wait** | Anything that reaches another person or leaves your systems | Yes, before send | Minutes to hours |
| **3. Never Automate** | Money, legal commitments, personnel decisions, sensitive comms | Yes, and the human takes the action, not the agent | As long as it takes |

If you are unsure which category, the answer is Category 2. Demoting an agent from Category 1 after a bad send costs more than promoting it from Category 2 after it earns trust.

## The four escalation rules

The categories cover the known cases. These four rules cover everything else:

1. **If the agent is uncertain about classification, default to Category 2.**
2. **If the agent encounters information marked private or restricted, stop and ask.**
3. **If the task involves money, legal, or personnel, Category 3. No exceptions.**
4. **If the output will be seen outside the organization, Category 2 at minimum.**

Print these four rules on the wall next to whoever runs the AI program. They do more work than any policy document you could write.

## Where the rules live in code

Your agents should treat these categories as first-class configuration, not hidden behavior. In the reference companion repos (`belle-mcp-server`, `lease-abstractor`, `support-triage-agent`, `diligence-agent`), every write-capable tool has an `auto_send: false` flag that defaults off. That is Category 2 by construction. To move a tool to Category 1, an owner has to change the flag deliberately, sign off, and add a monitoring gate.

Recommended pattern for any agent you build:

```yaml
# agent-manifest.yaml
name: support-triage
owner: cx-team@example.com
category: 2  # Draft and Wait
tools:
  - name: draft_reply
    category: 2
    auto_send: false
  - name: tag_conversation
    category: 1  # Auto-Execute — internal, reversible
    auto_send: true
  - name: issue_refund
    category: 3  # Never Automate
    auto_send: false
    human_action_required: true
```

The manifest is the contract. If it says Category 3, no code path in the agent may take that action, even with approval. Approval means a human uses their own credentials to act.

## The seed rule list (start here)

Copy this into your first agent registry. It's short on purpose.

| Task | Category |
|---|---|
| File incoming documents into folders | 1 |
| Tag support tickets by topic | 1 |
| Update internal status logs | 1 |
| Generate a meeting summary | 1 |
| Draft an email response to a customer | 2 |
| Draft a marketing post | 2 |
| Reply to a Slack message on someone's behalf | 2 |
| Update a CRM record with a customer-facing note | 2 |
| Send a payment | 3 |
| Sign a contract | 3 |
| Terminate an employee's access | 3 |
| Post publicly on the company account | 3 |

Extend as your team encounters new cases. Every added row goes to the review board (see [agent-review-board.md](agent-review-board.md)) before it ships.

## Who owns each category

- **Category 1:** The team that owns the underlying process. If Finance owns invoicing, Finance owns any Category 1 agent that touches invoicing.
- **Category 2:** The person who would have done the task themselves. If a support rep would draft the reply, the support rep is the reviewer.
- **Category 3:** The named human with legal authority to act. This is not an inbox. It is a person with credentials.

## Promotion path

An agent tool can be promoted from Category 2 to Category 1 only after:

1. **Volume:** at least 200 draft-and-approved outputs across at least 30 days
2. **Approval rate:** ≥ 95% of drafts approved without material edit
3. **Zero incidents:** no false-positive send, no data leak, no policy violation
4. **Reviewer sign-off:** the human who has been reviewing signs off in writing
5. **Owner sign-off:** the process owner signs off in writing
6. **Rollback path:** flipping the `auto_send` flag back to `false` requires no code change

Anything short of all six leaves the tool in Category 2. Ambiguity does not promote.

## Common failure modes

- **The "harmless" auto-send trap.** Someone argues that a draft with a footer of "sent by AI" is safe to auto-send. It is not. Customers do not read the footer. They read the message.
- **The blanket exception.** A team says "everything we do is Category 1, we're moving fast." Six weeks later a bulk email goes to the wrong list. The blanket is what failed, not the specific message.
- **The Category 3 sneak-around.** An agent "prepares" a wire transfer file that a human "just clicks send" on. If the click is the only human step, the human is not really in the loop. Category 3 means the human takes the action from scratch, with their own credentials, using the same tools they'd use without the agent.

## What this doc replaces

- Vague "AI usage policies" that don't tell anyone what to do
- Committee approval for every prompt change
- Ad-hoc Slack decisions that vary by who's on shift

If you already have a policy document, keep it, but put this three-tier table on page 1.

## Related

- [agent-lifecycle.md](agent-lifecycle.md) — what happens between build and retirement
- [agent-review-board.md](agent-review-board.md) — who decides category assignments
- [kill-switch-playbook.md](kill-switch-playbook.md) — how to stop an agent that broke its category rules
- [../06-cost-management/README.md](../06-cost-management/README.md) — budget rules that intersect with approval rules
- [GROUNDWORK-AND-FLUENCY.md](../../../GROUNDWORK-AND-FLUENCY.md) — the individual analogue of this framework
