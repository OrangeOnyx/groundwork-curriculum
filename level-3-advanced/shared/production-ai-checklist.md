# Production AI Checklist

Use this checklist as a release gate. Mark each item **yes**, **not applicable**, or **blocked**, with evidence and an owner. A launch is not complete because every box is checked; it is complete when the remaining risk is understood and explicitly accepted.

## Product and scope

- [ ] User problem is written in one sentence.
- [ ] Target user and excluded users are named.
- [ ] High-impact decisions are identified.
- [ ] Non-AI alternative is documented.
- [ ] Success metric is measurable.
- [ ] Harm metric is measurable.
- [ ] Customer-facing limitations are defined.
- [ ] Human escalation path exists.
- [ ] Feature owner is named.
- [ ] Domain approver is named.

## Data and privacy

- [ ] Data-flow diagram is current.
- [ ] Every source has an owner.
- [ ] Tenant isolation is tested.
- [ ] Authorization is enforced before retrieval.
- [ ] PII inventory is complete.
- [ ] Minimum-necessary fields are used.
- [ ] Sensitive fields are redacted from logs.
- [ ] Retention periods are defined.
- [ ] Deletion path is tested.
- [ ] Consent requirements are documented.
- [ ] Vendor data terms are reviewed.
- [ ] Regional residency is enforced.
- [ ] Backups follow retention policy.
- [ ] Dataset provenance is recorded.
- [ ] Data freshness is visible.

## Model and prompting

- [ ] Model version is pinned.
- [ ] Provider fallback is defined.
- [ ] Prompt version is pinned.
- [ ] System instructions state scope.
- [ ] Untrusted content is labeled.
- [ ] Context budget is bounded.
- [ ] Structured output schema is validated.
- [ ] Temperature and limits are intentional.
- [ ] Model card is reviewed.
- [ ] Known limitations are recorded.
- [ ] Fine-tuning data is approved.
- [ ] Retrieval index version is recorded.
- [ ] Citation behavior is specified.
- [ ] Refusal behavior is specified.
- [ ] Model change procedure exists.

## Retrieval and tools

- [ ] Chunking strategy is documented.
- [ ] Retrieval access is tenant-scoped.
- [ ] Metadata filters are tested.
- [ ] Stale documents have expiry rules.
- [ ] Reindex plan is reversible.
- [ ] Tool list is allowlisted.
- [ ] Tools use least privilege.
- [ ] Tool parameters are typed.
- [ ] Irreversible actions require confirmation.
- [ ] Idempotency keys protect writes.
- [ ] Rate limits are set.
- [ ] Tool retries are bounded.
- [ ] Tool results are sanitized.
- [ ] Audit events exist for writes.
- [ ] Manual fallback works.

## Safety and security

- [ ] Threat model is approved.
- [ ] Prompt injection tests pass.
- [ ] Jailbreak tests pass.
- [ ] Exfiltration tests pass.
- [ ] Cross-tenant tests pass.
- [ ] Identity spoofing tests pass.
- [ ] Retrieval poisoning tests pass.
- [ ] Abuse rate limits are tested.
- [ ] Policy decisions have reason codes.
- [ ] Guardrail bypass is monitored.
- [ ] Secrets are not in prompts or logs.
- [ ] Credentials are short-lived.
- [ ] Vulnerability owner is named.
- [ ] Red-team findings are tracked.
- [ ] Security incident path is rehearsed.

## Evaluation and release

- [ ] Offline eval set is versioned.
- [ ] Eval set is representative.
- [ ] Hard negatives are included.
- [ ] Safety evals are included.
- [ ] Quality threshold is predeclared.
- [ ] Cost threshold is predeclared.
- [ ] Latency threshold is predeclared.
- [ ] Results are segmented.
- [ ] Human review rubric exists.
- [ ] Statistical uncertainty is considered.
- [ ] Shadow run is completed.
- [ ] Canary cohort is defined.
- [ ] Feature flag exists.
- [ ] Dark-launch behavior is safe.
- [ ] Rollback has been rehearsed.

## Reliability and operations

- [ ] SLOs are documented.
- [ ] Error budget policy exists.
- [ ] Availability is measured at the user edge.
- [ ] Time to first useful response is measured.
- [ ] Quality outcome is sampled.
- [ ] Traces propagate across services.
- [ ] Logs are structured.
- [ ] Dashboard links to traces.
- [ ] Alerts have runbooks.
- [ ] Alert owner is named.
- [ ] On-call rotation is staffed.
- [ ] Incident severity model exists.
- [ ] Status communication is prepared.
- [ ] Queues have backpressure limits.
- [ ] Provider outage behavior is tested.
- [ ] Regional failover is tested.
- [ ] Capacity is measured.
- [ ] Cost per outcome is tracked.
- [ ] Drift baseline exists.
- [ ] Drift alerts have response actions.

## UX, governance, and follow-through

- [ ] Loading state is honest.
- [ ] Cancellation works.
- [ ] Error message offers a next step.
- [ ] User corrections are captured.
- [ ] Confidence language matches evidence.
- [ ] Citations appear where decisions happen.
- [ ] Accessible interaction is tested.
- [ ] Admin controls are documented.
- [ ] Change approval is recorded.
- [ ] Decision record is stored.
- [ ] Training is provided to operators.
- [ ] Support team has a playbook.
- [ ] Post-launch review is scheduled.
- [ ] Success and harm metrics are reviewed.
- [ ] Unused data is removed.

A failed item is useful information. Do not paper over it with an exception; convert it into a conscious launch decision, a compensating control, a named owner, and an expiry date.
