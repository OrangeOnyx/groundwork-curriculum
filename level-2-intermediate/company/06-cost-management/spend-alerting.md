# Spend Alerting

Alert on rate of change, not only monthly totals: cost per minute, cost per successful task, tokens per request, retry loops, cache miss spikes, unexpected model-route changes, and budget burn rate. Add thresholds by workflow and severity. A runaway tenant-triage retry should page quickly; a slow monthly drift can create a ticket.

Include trace links, top callers, model versions, error classes, and comparison with baseline in the alert. Automatically contain only proven failure modes, such as disabling an experimental route after a hard budget cap. Human review remains necessary when an alert might reflect legitimate volume.

Test alerts with controlled simulations. If operators cannot identify the likely cause in minutes, enrich the telemetry. Alert fatigue is a cost-control failure.

## Operating standard
Make this practice operational, not aspirational. Assign one directly responsible owner and name the decision they can make without another meeting. Put the key measure, threshold, and review cadence in the owning team’s regular operating rhythm. A change to model, prompt, data scope, retrieval index, tool permission, or policy should be recorded with its expected impact and a rollback path. Preserve enough trace information to explain an individual bad outcome without exposing more tenant or deal data than necessary. Review a small sample of real runs with the people doing the work; dashboards reveal trends, but operators reveal missing context. When the rule is violated, capture the incident, contain impact, add an eval or control, and update this document if the standard itself was unclear. The point is repeatable judgment under real workload, not a one-time compliance exercise.
