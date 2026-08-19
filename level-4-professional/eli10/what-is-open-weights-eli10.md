# What Are Open Weights?

Open weights are like a published recipe. A company or research group gives people the trained numbers—the “weights”—that make a model behave the way it does. Other people can download them, run the model on their own computers, study it, fine-tune it, and build products without sending every request to the original maker.

That is different from an AI website where you can only use a remote service. With open weights, you have more control over privacy, cost, speed, customization, and how long the system remains available. A company handling sensitive records may prefer to run an open-weight model in its own environment.

The recipe analogy has limits. Getting the recipe does not mean everyone can cook the meal. Large models still need capable hardware, security work, evaluation, and skilled operators. The license may restrict commercial use or redistribution. And publishing weights can make powerful capabilities easier for both good and bad actors to use.

Before choosing open weights, ask: Can we operate this securely? Who patches it? What does its license permit? Does it perform on our tasks? What happens if an employee exposes the model or its data? Openness creates freedom and responsibility together.

This lesson belongs in a practitioner’s operating system, not a collection of facts to recite. The point is to make a better decision under uncertainty: define the claim, identify the evidence that could change it, name the failure mode, and record the consequence of being wrong. Read it with a live initiative in mind—an internal workflow, customer-facing product, training run, or research bet—and turn the ideas into an explicit test.

Start from the outcome rather than the technology. Specify the user or stakeholder, the task boundary, the data and permissions involved, the success measure, and the unacceptable result. Establish a baseline before changing anything. Then make the smallest reversible move that can distinguish competing explanations. A plausible demo is evidence of possibility, not evidence of reliability, value, or safety.

Keep an evidence log. Separate observations from interpretations, measured performance from anecdotes, and known risks from assumptions. Review representative failures by hand; aggregate metrics can hide the one pattern that matters. For high-impact work, assign a clear owner, predefine an escalation path, and decide what will cause a pause or rollback. Do not outsource accountability to a model, vendor, benchmark, or committee.

The professional standard is legibility. Another capable person should be able to understand why this approach was chosen, rerun the evaluation, find its limits, and improve it without guessing. Build reusable artifacts—datasets, decision records, checklists, incident notes, and release criteria—so each project leaves the next one stronger.

## Working exercise

Write a one-page decision memo for a current initiative. State the hypothesis, baseline, evaluation, threshold, owner, risks, and next action. If any of these cannot be stated plainly, the work is not ready to scale.
