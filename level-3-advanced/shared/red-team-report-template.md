# Red-Team Report Template

**Assessment name / date / owners:**  
**Systems and versions assessed:**  
**Authorization and rules of engagement:**  
**Test data classification and retention:**  

## Objective and scope

State the harm hypotheses: cross-tenant disclosure, prompt injection through listing documents, unsafe maintenance escalation, tool misuse, identity spoofing, policy bypass, or denial of service. Name the in-scope model, retrieval sources, tools, identities, environments, and explicit exclusions. A red-team report without scope cannot be safely reproduced or prioritized.

## Method

Describe attack families, test cases, automation, human review, success criteria, and stop conditions. Preserve exact prompts, documents, identities, configuration, timestamps, and traces in a restricted evidence store. Separate reproducible facts from the tester’s interpretation.

## Findings

| ID | Severity | Attack path | Preconditions | Impact | Reproduction | Evidence | Owner |
|---|---|---|---|---|---|---|---|
| | Critical / high / medium / low | | | | | | |

Score severity using exploitability, blast radius, sensitivity of data or action, likelihood, detection time, and effectiveness of existing controls. Demonstrate impact without accessing real customer data or causing irreversible action.

## Remediation and retest

For each finding, specify immediate containment, durable fix, compensating control, due date, and retest criteria. A model-prompt adjustment alone is rarely sufficient for a permission-boundary problem. Close a finding only after the exact attack fails, regression tests are committed, telemetry can detect recurrence, and risk acceptance is recorded if any residual exposure remains.
