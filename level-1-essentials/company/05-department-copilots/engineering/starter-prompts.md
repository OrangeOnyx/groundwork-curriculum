# Engineering Copilot — Starter Prompts

Copy-paste-ready prompts for the department. Deploy alongside the system prompt.

## 1. Code review

```
Review this PR like a staff engineer. Flag issues by severity (blocking, non-blocking, nit). Include file:line references.

Diff:
{DIFF}
```

## 2. Bug diagnosis

```
Diagnose this bug. Give 3 hypotheses ranked by likelihood with confirmation path.

Symptom: {SYMPTOM}
Error:
```
{ERROR}
```
Relevant code:
{CODE}
```

## 3. Architecture proposal

```
Propose an architecture for {FEATURE}. Constraints: {CONSTRAINTS}. Return: chosen design, alternatives considered, tradeoffs, failure modes, rollout plan.
```

## 4. Doc from code

```
Write developer docs for this module. Audience: new hire. Include: what it does, public API table, key concepts, gotchas, runnable example.

Code:
{CODE}
```

## 5. Test plan

```
Generate a test plan for {FUNCTION}. Include happy path, edge cases, error cases. Use {FRAMEWORK}. Return runnable stubs.
```

## 6. Migration script

```
Write a migration script from {CURRENT_STATE} to {DESIRED_STATE}. Include: pre-flight checks, migration steps, rollback, verification queries.
```

## 7. Perf investigation

```
This endpoint is slow: {ENDPOINT}. Metrics: {METRICS}. Suggest top 5 places to look, with expected impact estimate.
```

## 8. Runbook

```
Draft an incident runbook for {SCENARIO}. Include: detection, immediate actions, diagnostic steps, mitigation, verification, communications.
```

