# Training Run Checklist

Use this before any fine-tune, preference-optimization job, or material retraining. A run that cannot be explained, reproduced, evaluated, and rolled back is not ready.

## Decision and scope

- [ ] State the user outcome, hypothesis, and baseline.
- [ ] Name the model, version, license, and deployment target.
- [ ] Define success metrics, safety metrics, and a ship/no-ship threshold.
- [ ] Identify the accountable owner and the person authorized to stop the run.

## Data

- [ ] Document source, rights, provenance, consent, retention, and access controls.
- [ ] Version the dataset, splits, label guide, and preprocessing code/configuration.
- [ ] Check duplicates, train/evaluation leakage, secrets, personal data, and poisoned examples.
- [ ] Inspect samples from every important slice and rejected-data bucket.

## Configuration and execution

- [ ] Record base checkpoint, tokenizer, hyperparameters, random seeds, hardware, and dependency versions.
- [ ] Estimate compute, cost, duration, storage, and failure recovery.
- [ ] Test the pipeline on a small canary run.
- [ ] Save checkpoints, logs, gradients/loss where appropriate, and immutable run metadata.

## Evaluation and release

- [ ] Run fixed holdouts, fresh adversarial cases, regression tests, and human review.
- [ ] Compare against the actual baseline—not only the prior model.
- [ ] Inspect failure slices, calibration, refusal behavior, and tool-use boundaries.
- [ ] Produce a model-card update and release decision record.
- [ ] Stage deployment with monitoring, rollback, and user escalation paths.

## Afterward

Write what changed, what did not, what surprised you, and which next experiment this result justifies. Negative results are assets when their conditions are preserved.

This lesson belongs in a practitioner’s operating system, not a collection of facts to recite. The point is to make a better decision under uncertainty: define the claim, identify the evidence that could change it, name the failure mode, and record the consequence of being wrong. Read it with a live initiative in mind—an internal workflow, customer-facing product, training run, or research bet—and turn the ideas into an explicit test.

Start from the outcome rather than the technology. Specify the user or stakeholder, the task boundary, the data and permissions involved, the success measure, and the unacceptable result. Establish a baseline before changing anything. Then make the smallest reversible move that can distinguish competing explanations. A plausible demo is evidence of possibility, not evidence of reliability, value, or safety.

Keep an evidence log. Separate observations from interpretations, measured performance from anecdotes, and known risks from assumptions. Review representative failures by hand; aggregate metrics can hide the one pattern that matters. For high-impact work, assign a clear owner, predefine an escalation path, and decide what will cause a pause or rollback. Do not outsource accountability to a model, vendor, benchmark, or committee.

The professional standard is legibility. Another capable person should be able to understand why this approach was chosen, rerun the evaluation, find its limits, and improve it without guessing. Build reusable artifacts—datasets, decision records, checklists, incident notes, and release criteria—so each project leaves the next one stronger.

## Working exercise

Write a one-page decision memo for a current initiative. State the hypothesis, baseline, evaluation, threshold, owner, risks, and next action. If any of these cannot be stated plainly, the work is not ready to scale.
