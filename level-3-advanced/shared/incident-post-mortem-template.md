# AI Incident Post-Mortem Template

**Title:**  
**Incident ID:**  
**Severity / start / end:**  
**Incident lead / communications lead / technical lead:**  
**Affected feature, properties, tenants, and channels:**  

## Executive summary

Describe what users experienced, how many were affected, the worst plausible harm, and the final state. Use concrete language: “The maintenance assistant showed one tenant another tenant’s ticket summary for 17 minutes,” not “there was an issue with retrieval.” State whether any unsafe tool action, legal obligation, or data notification process was triggered.

## Timeline

| Time | Event | Evidence / decision |
|---|---|---|
| | Detection | |
| | Containment | |
| | Customer communication | |
| | Recovery | |

## Impact and scope

List confirmed impact, uncertain impact, and population checked. Segment by property, tenant boundary, model/prompt/retrieval version, provider, region, and release cohort. Include customer contacts, financial effect, support load, and safety or privacy implications.

## Technical and control analysis

What changed? What condition allowed the failure? Which controls detected it, failed to detect it, or limited blast radius? Link traces, logs, deployment records, policy decisions, eval evidence, and the exact configuration. Do not attribute root cause to “the model hallucinated”; name the missing validation, ambiguous contract, bad data, unsafe permission, or untested dependency.

## Corrective actions

| Action | Type: containment / corrective / preventive | Owner | Due date | Verification evidence |
|---|---|---|---|---|
| | | | | |

## Lessons and follow-up

Record what should change in the runbook, eval suite, dashboard, release gate, vendor strategy, or training. The incident is closed only after actions are verified, affected users receive required follow-up, and the learning is shared with the relevant team.
