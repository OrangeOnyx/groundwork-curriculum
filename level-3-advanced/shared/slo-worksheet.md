# AI SLO Worksheet

Use one worksheet per customer-facing journey. An SLO is an internal target for reliable, valuable behavior. It should be strict enough to protect trust and practical enough that the team can measure and improve it.

**Journey:**  
**Users / properties / risk tier:**  
**Owner:**  
**Dependencies:** model, retrieval, tools, identity, queues, provider, region.  
**Review date:**  

## Service-level indicators

| Indicator | Exact event definition | Good event | Bad event | Data source | Owner |
|---|---|---|---|---|---|
| Availability | | | | | |
| Latency | | | | | |
| Quality / groundedness | | | | | |
| Safety / escalation | | | | | |
| Action completion | | | | | |

## Objective and budget

| Indicator | Objective | Window | Error budget | Exclusions | Alert / burn threshold |
|---|---|---|---|---|---|
| | | | | | |

Avoid a vague “accuracy SLO.” For a leasing assistant, define whether the answer was based on an authorized source, whether it disclosed uncertainty, whether it avoided protected or sensitive inference, and whether the next action was correct. Quality often needs sampled human labels, so state sampling rate, reviewer rubric, lag, and the operational response to a bad result.

## Operational plan

- Containment action when fast burn occurs:
- Owner and escalation path:
- Feature flag or rollback control:
- Customer communication path:
- Manual fallback:
- Dependencies whose failures count toward the SLO:
- Dependencies whose failures are excluded, with reason:
- Dashboard and trace links:

Review monthly and after every material incident. If a target cannot drive a decision, it is a report, not an SLO.
