# What Is a Model Card?

A model card is the instruction sheet and warning label for an AI model. It explains what the model is, how it was trained or adapted, what it is meant to do, how it was tested, and where it may fail.

Imagine buying a power tool. You would want to know what it can cut, which safety gear to use, where it should not be used, and what happens if it jams. A model card serves the same purpose. It should name intended uses, prohibited uses, known weaknesses, data and privacy considerations, performance numbers, and a contact for problems.

The card does not make a model safe by itself. It makes important facts visible so people can make better decisions. A vague card full of “state-of-the-art” claims is marketing. A useful card tells you, for example, that a model performs well on English summarization but has not been tested for legal advice, may make confident factual mistakes, and should not decide eligibility or prices without human review.

If your team fine-tunes a model, write a model card before sharing it. It forces hard questions: What changed? Which examples did we test? Who could be harmed? What should a user never assume? Clear documentation is part of building something trustworthy.

This lesson belongs in a practitioner’s operating system, not a collection of facts to recite. The point is to make a better decision under uncertainty: define the claim, identify the evidence that could change it, name the failure mode, and record the consequence of being wrong. Read it with a live initiative in mind—an internal workflow, customer-facing product, training run, or research bet—and turn the ideas into an explicit test.

Start from the outcome rather than the technology. Specify the user or stakeholder, the task boundary, the data and permissions involved, the success measure, and the unacceptable result. Establish a baseline before changing anything. Then make the smallest reversible move that can distinguish competing explanations. A plausible demo is evidence of possibility, not evidence of reliability, value, or safety.

Keep an evidence log. Separate observations from interpretations, measured performance from anecdotes, and known risks from assumptions. Review representative failures by hand; aggregate metrics can hide the one pattern that matters. For high-impact work, assign a clear owner, predefine an escalation path, and decide what will cause a pause or rollback. Do not outsource accountability to a model, vendor, benchmark, or committee.

The professional standard is legibility. Another capable person should be able to understand why this approach was chosen, rerun the evaluation, find its limits, and improve it without guessing. Build reusable artifacts—datasets, decision records, checklists, incident notes, and release criteria—so each project leaves the next one stronger.

## Working exercise

Write a one-page decision memo for a current initiative. State the hypothesis, baseline, evaluation, threshold, owner, risks, and next action. If any of these cannot be stated plainly, the work is not ready to scale.
