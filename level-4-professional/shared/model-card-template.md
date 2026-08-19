# Model Card Template

## Model identity

- **Name/version/date:**  
- **Base model and license:**  
- **Owner/contact:**  
- **Weights or endpoint identifier:**  

## Intended use

Describe target users, supported tasks, operating languages, input limits, and expected environment. State prohibited or unsupported uses plainly.

## Training and adaptation

- Training objective and method  
- Data sources, rights, dates, filtering, and known gaps  
- Fine-tuning/preference data description  
- Hyperparameters, tokenizer, compute, and run identifier  

## Evaluation

| Evaluation | Dataset/slices | Metric | Result | Limitations |
|---|---|---|---|---|
| | | | | |

Include comparison baseline, contamination controls, human-evaluation protocol, calibration, safety/refusal tests, and representative failures.

## Risks and mitigations

Describe hallucination, bias, privacy, harmful-content, security, misuse, and distribution-shift risks. Pair every mitigation with its scope and remaining limitation.

## Deployment notes

Specify supported quantizations, context limits, inference hardware, expected latency/cost, monitoring, change control, and incident contact.

## Version history

Record changed data, weights, behavior, evaluations, and known regressions for every release.

This lesson belongs in a practitioner’s operating system, not a collection of facts to recite. The point is to make a better decision under uncertainty: define the claim, identify the evidence that could change it, name the failure mode, and record the consequence of being wrong. Read it with a live initiative in mind—an internal workflow, customer-facing product, training run, or research bet—and turn the ideas into an explicit test.

Start from the outcome rather than the technology. Specify the user or stakeholder, the task boundary, the data and permissions involved, the success measure, and the unacceptable result. Establish a baseline before changing anything. Then make the smallest reversible move that can distinguish competing explanations. A plausible demo is evidence of possibility, not evidence of reliability, value, or safety.

Keep an evidence log. Separate observations from interpretations, measured performance from anecdotes, and known risks from assumptions. Review representative failures by hand; aggregate metrics can hide the one pattern that matters. For high-impact work, assign a clear owner, predefine an escalation path, and decide what will cause a pause or rollback. Do not outsource accountability to a model, vendor, benchmark, or committee.

The professional standard is legibility. Another capable person should be able to understand why this approach was chosen, rerun the evaluation, find its limits, and improve it without guessing. Build reusable artifacts—datasets, decision records, checklists, incident notes, and release criteria—so each project leaves the next one stronger.

## Working exercise

Write a one-page decision memo for a current initiative. State the hypothesis, baseline, evaluation, threshold, owner, risks, and next action. If any of these cannot be stated plainly, the work is not ready to scale.
