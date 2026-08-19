# Paper-Writing Checklist

## Before drafting

- [ ] State one falsifiable claim in one sentence.
- [ ] Identify the strongest baseline and fairest comparison budget.
- [ ] Predefine primary metric, secondary metrics, and failure criteria.
- [ ] Preserve code/configuration, seeds, data version, and raw results.

## Argument

- [ ] Abstract states the result and its boundary, not an aspiration.
- [ ] Introduction distinguishes problem, contribution, and evidence.
- [ ] Method contains enough detail for a capable group to reproduce it.
- [ ] Figures answer a question; they are not decorative summaries.
- [ ] Ablations test the causal importance of proposed components.

## Integrity

- [ ] Report negative results that materially constrain the claim.
- [ ] Include variance, confidence intervals, or repeated-seed evidence where relevant.
- [ ] Discuss contamination, selection effects, data rights, and compute budget.
- [ ] Audit citations for what they actually establish.
- [ ] Separate results, interpretation, and speculation.

## Safety and release

- [ ] Name plausible misuse, affected parties, and evaluation gaps.
- [ ] Decide what artifacts can be released responsibly.
- [ ] Add limitations that change a reader’s deployment decision.

## Final review

Ask a skeptical reader to reproduce the central figure and restate the claim. If either task fails, revise before submission.

This lesson belongs in a practitioner’s operating system, not a collection of facts to recite. The point is to make a better decision under uncertainty: define the claim, identify the evidence that could change it, name the failure mode, and record the consequence of being wrong. Read it with a live initiative in mind—an internal workflow, customer-facing product, training run, or research bet—and turn the ideas into an explicit test.

Start from the outcome rather than the technology. Specify the user or stakeholder, the task boundary, the data and permissions involved, the success measure, and the unacceptable result. Establish a baseline before changing anything. Then make the smallest reversible move that can distinguish competing explanations. A plausible demo is evidence of possibility, not evidence of reliability, value, or safety.

Keep an evidence log. Separate observations from interpretations, measured performance from anecdotes, and known risks from assumptions. Review representative failures by hand; aggregate metrics can hide the one pattern that matters. For high-impact work, assign a clear owner, predefine an escalation path, and decide what will cause a pause or rollback. Do not outsource accountability to a model, vendor, benchmark, or committee.

The professional standard is legibility. Another capable person should be able to understand why this approach was chosen, rerun the evaluation, find its limits, and improve it without guessing. Build reusable artifacts—datasets, decision records, checklists, incident notes, and release criteria—so each project leaves the next one stronger.

## Working exercise

Write a one-page decision memo for a current initiative. State the hypothesis, baseline, evaluation, threshold, owner, risks, and next action. If any of these cannot be stated plainly, the work is not ready to scale.
