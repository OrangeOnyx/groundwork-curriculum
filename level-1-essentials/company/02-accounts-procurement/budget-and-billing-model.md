# Budget and Billing Model

## The unit of accountability

Cost should be attributable to a **team, project, or user** — never a black hole. Set this up before you scale.

## Attribution model

Every AI call carries three tags:
- **Team** (Sales, Support, Engineering, etc.)
- **Project / workflow** (email-triage, lease-generation, etc.)
- **User** (email of the requester)

The LLM gateway enforces this by rejecting untagged calls.

## Budget tiers

Start with modest per-team monthly caps, review quarterly.

| Team size | Suggested monthly AI budget |
|---|---|
| Individual power user | $50–$200 |
| 5-person team | $500–$1,500 |
| 20-person department | $3,000–$8,000 |
| 100-person org | $10,000–$40,000 |

These are starting points. Actual = seats × usage × tool mix.

## Two budget lines per team

1. **Subscriptions** (seats × per-seat cost)
2. **API usage** (tokens × prices)

Report both. Ratio typically 60–70% subs / 30–40% API for knowledge workers; inverse for engineering teams building AI features.

## Cost controls

- **Hard cap** on API keys (provider dashboards)
- **Soft alerts** at 50% and 80% of hard cap
- **Rate limits** per team via LLM gateway
- **Weekly cost report** to team leads
- **Monthly review** by Steering Committee finance seat

## Chargeback vs shared cost

Two philosophies:

**Chargeback:** each team's spend hits their budget line
- Pros: Motivates efficient use, exposes ROI
- Cons: Discourages experimentation

**Shared:** IT/Finance owns the total budget
- Pros: Encourages adoption
- Cons: Free-rider problem

**Recommendation:** Start with shared during 90-day rollout. Move to chargeback once teams have baselined their usage.

## ROI tracking

For each department pilot, define:
- **Hours saved / week** (self-reported + spot-checked)
- **Quality delta** (eval scores before vs after)
- **Employee NPS** on the AI experience
- **Cost per resolved item** (ticket, deal, deliverable)

Publish a quarterly ROI report. Kill any workflow with poor ROI.

## Cost anti-patterns

- Every engineer with a Claude API key. Use one org account.
- Frontier models used for tasks a workhorse could handle (e.g., Opus for classification)
- Chatting in a UI when batch API would do
- No prompt caching enabled on providers that support it
- Duplicated automations across teams

## Cost optimization playbook

When a budget line is over:
1. Audit top 10 workflows by cost — is model choice appropriate?
2. Turn on prompt caching where supported
3. Cache retrieval results
4. Move batch workloads to batch API tier (50% off on major providers)
5. Swap frontier → workhorse where quality allows
6. Kill low-ROI automations
