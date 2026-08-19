# Kill-Switch Playbook

Provide three controls: global AI disable, per-agent disable, and per-tool/write disable. They must be server-side, fast, auditable, and tested. A disabled agent returns a clear fallback experience; it must not quietly call a different unreviewed model.

Trigger the switch for suspected data exposure, unsafe external action, emergency-routing regression, unauthorized tool activity, runaway spend, provider compromise, or material policy violation. First contain: disable writes and external sends, preserve traces, notify the agent owner and operations lead, and assess affected organizations. Do not erase logs during an incident.

Then investigate scope, revoke credentials if needed, communicate factually, fix the root cause, add regression cases, and require re-approval before re-enable. Run a quarterly drill. A kill switch that has never been exercised is only a diagram.

## Operating standard
Make this practice operational, not aspirational. Assign one directly responsible owner and name the decision they can make without another meeting. Put the key measure, threshold, and review cadence in the owning team’s regular operating rhythm. A change to model, prompt, data scope, retrieval index, tool permission, or policy should be recorded with its expected impact and a rollback path. Preserve enough trace information to explain an individual bad outcome without exposing more tenant or deal data than necessary. Review a small sample of real runs with the people doing the work; dashboards reveal trends, but operators reveal missing context. When the rule is violated, capture the incident, contain impact, add an eval or control, and update this document if the standard itself was unclear. The point is repeatable judgment under real workload, not a one-time compliance exercise.
