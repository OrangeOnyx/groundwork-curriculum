# Safety Case Template

A safety case is an evidence-backed argument that the residual risk of a specific system and use is acceptable. It is not a policy statement.

## 1. System and decision

- **System/version:**  
- **Owner and approver:**  
- **Intended users and context:**  
- **Decision or action affected:**  
- **Explicitly excluded uses:**  

## 2. Claim

State the claim narrowly: “For [use], under [conditions], the system can be operated with acceptable risk because [controls and evidence].”

## 3. Hazard register

For each hazard, record the harmed party, severity, likelihood, signals, prevention, mitigation, and residual risk.

| Hazard | Scenario | Preventive controls | Detection | Response | Residual risk |
|---|---|---|---|---|---|
| | | | | | |

## 4. Evidence

- Offline evaluation results and slice coverage  
- Human-review method and agreement  
- Red-team findings and closure status  
- Privacy/security assessment  
- Reliability, latency, and availability data  
- Provider/model-change assumptions  

## 5. Operating controls

Describe access control, human approvals, runtime policy, logging, monitoring, incident ownership, rollback, and user recourse.

## 6. Limits and review

List untested conditions, assumptions, expiry date, next review trigger, and the named authority who can suspend the system. Link raw evidence; do not summarize away uncertainty.

This lesson belongs in a practitioner’s operating system, not a collection of facts to recite. The point is to make a better decision under uncertainty: define the claim, identify the evidence that could change it, name the failure mode, and record the consequence of being wrong. Read it with a live initiative in mind—an internal workflow, customer-facing product, training run, or research bet—and turn the ideas into an explicit test.

Start from the outcome rather than the technology. Specify the user or stakeholder, the task boundary, the data and permissions involved, the success measure, and the unacceptable result. Establish a baseline before changing anything. Then make the smallest reversible move that can distinguish competing explanations. A plausible demo is evidence of possibility, not evidence of reliability, value, or safety.

Keep an evidence log. Separate observations from interpretations, measured performance from anecdotes, and known risks from assumptions. Review representative failures by hand; aggregate metrics can hide the one pattern that matters. For high-impact work, assign a clear owner, predefine an escalation path, and decide what will cause a pause or rollback. Do not outsource accountability to a model, vendor, benchmark, or committee.

The professional standard is legibility. Another capable person should be able to understand why this approach was chosen, rerun the evaluation, find its limits, and improve it without guessing. Build reusable artifacts—datasets, decision records, checklists, incident notes, and release criteria—so each project leaves the next one stronger.

## Working exercise

Write a one-page decision memo for a current initiative. State the hypothesis, baseline, evaluation, threshold, owner, risks, and next action. If any of these cannot be stated plainly, the work is not ready to scale.
