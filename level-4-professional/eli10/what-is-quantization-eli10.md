# What Is Quantization?

Quantization is like turning a studio-quality music file into an MP3. The MP3 is much smaller and easier to send, but it throws away some tiny details. A model’s weights are enormous collections of numbers. Quantization stores those numbers with fewer bits, so the model needs less memory and can often run faster and cheaper.

The original version might use very precise numbers. A quantized version rounds them into a smaller set of choices. If the rounding is careful, the model still performs nearly as well for many tasks. If it is too aggressive, it may become worse at reasoning, languages, coding, or unusual requests.

Why should you care? A model that needs several expensive GPUs in full precision might run on a much smaller machine after quantization. That can make private, local, or low-latency applications possible. It can also make a model look cheaper in a demo than it is on your hardest work.

The right question is not “Is this model quantized?” Ask: *which quantization, on which hardware, and how did it perform on our evaluation set?* Test representative long documents, structured outputs, and safety cases. Quantization is a practical engineering trade: memory and speed on one side; quality and reliability on the other.

This lesson belongs in a practitioner’s operating system, not a collection of facts to recite. The point is to make a better decision under uncertainty: define the claim, identify the evidence that could change it, name the failure mode, and record the consequence of being wrong. Read it with a live initiative in mind—an internal workflow, customer-facing product, training run, or research bet—and turn the ideas into an explicit test.

Start from the outcome rather than the technology. Specify the user or stakeholder, the task boundary, the data and permissions involved, the success measure, and the unacceptable result. Establish a baseline before changing anything. Then make the smallest reversible move that can distinguish competing explanations. A plausible demo is evidence of possibility, not evidence of reliability, value, or safety.

Keep an evidence log. Separate observations from interpretations, measured performance from anecdotes, and known risks from assumptions. Review representative failures by hand; aggregate metrics can hide the one pattern that matters. For high-impact work, assign a clear owner, predefine an escalation path, and decide what will cause a pause or rollback. Do not outsource accountability to a model, vendor, benchmark, or committee.

The professional standard is legibility. Another capable person should be able to understand why this approach was chosen, rerun the evaluation, find its limits, and improve it without guessing. Build reusable artifacts—datasets, decision records, checklists, incident notes, and release criteria—so each project leaves the next one stronger.

## Working exercise

Write a one-page decision memo for a current initiative. State the hypothesis, baseline, evaluation, threshold, owner, risks, and next action. If any of these cannot be stated plainly, the work is not ready to scale.
