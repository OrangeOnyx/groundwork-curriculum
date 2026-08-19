# System Card Template

A model card describes a model. A system card describes the complete deployed product: model, prompts, retrieval, tools, users, policies, interfaces, and operations.

## System definition

- **Name/version/owner:**  
- **Users and business purpose:**  
- **Model providers and component versions:**  
- **Data flows and trust boundaries:**  
- **High-impact decisions or actions:**  

## Architecture

Describe input handling, identity/authorization, retrieval, model routing, tool calls, output validation, approval steps, logs, and data retention. Include a diagram link where available.

## Behavior and boundaries

List supported tasks, refusal conditions, mandatory escalations, prohibited actions, localization requirements, and user disclosures. Explain what the system must not infer or decide.

## Evidence

| Claim | Evaluation/method | Result | Owner | Expiry |
|---|---|---|---|---|
| | | | | |

Include real-world monitoring and known failure examples, not only offline scores.

## Risk operations

State red-team coverage, policy-engine controls, alert thresholds, incident playbook, rollback method, provider-outage plan, audit trail, and review cadence.

## Change log

Every change to model, prompt, retrieval corpus, tools, permissions, or safety policy should have a linked evaluation and approval record.

This lesson belongs in a practitioner’s operating system, not a collection of facts to recite. The point is to make a better decision under uncertainty: define the claim, identify the evidence that could change it, name the failure mode, and record the consequence of being wrong. Read it with a live initiative in mind—an internal workflow, customer-facing product, training run, or research bet—and turn the ideas into an explicit test.

Start from the outcome rather than the technology. Specify the user or stakeholder, the task boundary, the data and permissions involved, the success measure, and the unacceptable result. Establish a baseline before changing anything. Then make the smallest reversible move that can distinguish competing explanations. A plausible demo is evidence of possibility, not evidence of reliability, value, or safety.

Keep an evidence log. Separate observations from interpretations, measured performance from anecdotes, and known risks from assumptions. Review representative failures by hand; aggregate metrics can hide the one pattern that matters. For high-impact work, assign a clear owner, predefine an escalation path, and decide what will cause a pause or rollback. Do not outsource accountability to a model, vendor, benchmark, or committee.

The professional standard is legibility. Another capable person should be able to understand why this approach was chosen, rerun the evaluation, find its limits, and improve it without guessing. Build reusable artifacts—datasets, decision records, checklists, incident notes, and release criteria—so each project leaves the next one stronger.

## Working exercise

Write a one-page decision memo for a current initiative. State the hypothesis, baseline, evaluation, threshold, owner, risks, and next action. If any of these cannot be stated plainly, the work is not ready to scale.
