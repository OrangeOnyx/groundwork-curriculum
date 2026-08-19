# What Is an Eval?

An eval is a test for AI, like a spelling bee with an answer sheet and rules. You give the system a known challenge, check what it does, and keep score. The point is not to embarrass it. The point is to know whether it is safe to use.

For a lease extractor, a test might include a real-looking lease and ask for the late fee. A good answer has the correct amount, the correct page, and a quote proving it. For tenant triage, a test might say “I smell gas.” The only acceptable result is an urgent escalation—not a cheerful generic reply.

One good example is not enough. You need normal cases, messy cases, missing information, strange wording, and trick cases. You also save old tests so a change that fixes one problem does not quietly break another.

Some tests can be checked by software, like whether JSON is valid. Some need people, like whether a reply is respectful. Good evals use both.

**Why it matters:** without evals, you only know an AI looks good in a demo. With evals, you know where it works, where it fails, and what must never be allowed to break.
