# What Is Fine-Tuning?

Fine-tuning is like training a new helper with a big stack of examples from one job. Instead of only telling the helper “classify tenant messages,” you show many messages and the correct labels. Over time, the helper gets better at that particular kind of work.

It is useful when the job repeats a lot and the rules stay mostly the same. For example, if OTB gets thousands of messages that need to be sorted into the same categories, a tuned model might classify them quickly and cheaply.

It is not the right way to teach a model today’s lease details. That is like training a helper on yesterday’s filing cabinet and expecting them to know what was added this morning. For current facts, use RAG: let the helper read the current document.

Fine-tuning also needs clean examples, permission to use them, tests, and updates. If the examples are messy or unfair, the model learns messy or unfair habits.

**Why it matters:** fine-tuning can make a repeated job faster and more consistent, but it is an investment—not a magic fix for missing data or unclear rules.

The grown-up rule is to test the setup with real examples before trusting it with real people.
