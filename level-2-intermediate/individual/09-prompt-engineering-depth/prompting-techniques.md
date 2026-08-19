# Prompting techniques: what actually moves the needle

Most "prompt engineering" content online is folklore. This document is the opposite: a small set of prompting techniques that measurably change model behavior, each paired with an eval you can run to see the effect for yourself.

The rule for this document — and for how you should think about prompting in production — is:

> **A prompting technique that you cannot measure is a superstition.**

If adding "you are a world-class expert" to your prompt doesn't change your eval score, it doesn't do anything. It just makes you feel better.

## The techniques (ranked by ROI)

1. **Structured output enforcement** — highest ROI, boring, essential
2. **Few-shot with worked examples** — very high ROI, especially for stable output shapes
3. **Chain-of-thought (for hard reasoning)** — high ROI on math/logic; can hurt on classification
4. **Role and persona (targeted)** — moderate ROI, easy to misuse
5. **Discipline/domain prefixes** — moderate ROI, best combined with few-shot
6. **Quality-forcing (critique-then-improve)** — moderate ROI, doubles cost
7. **Adversarial self-check** — moderate ROI on safety-critical work
8. **Meta-cognitive uncertainty gating** — low-moderate ROI, high value on HITL
9. **Output-shape scaffolds** — moderate ROI, overlaps with #1
10. **"Power words" (neuro-symbolic, etc.)** — low ROI in isolation, sometimes real inside a system

Everything below the fold has an eval. Run it against your own model + task before you commit to it in a prompt.

## 1. Structured output enforcement

**What it is:** Force the model's output through a JSON schema, either via tool-use, response_format json_schema, or Zod-validated re-prompt on failure.

**Why it works:** The model can no longer wander. Every field is either present or absent, every enum is either valid or invalid. Downstream code doesn't need to parse. Debugging is trivial.

**Eval:**
```
Task: Classify 100 support tickets by priority (P1, P2, P3).

A) Ask for prose "please respond with the priority": 100 responses.
B) Ask for JSON with a schema {priority: enum, reason: string}: 100 responses.

Measure:
- Parse-error rate (A: usually 3-15%. B: 0-1%.)
- Time-to-consume-in-downstream-code (A: needs regex/parsing. B: JSON.parse.)
- Consistency across identical inputs (B is dramatically more consistent.)
```

**Example:**
```typescript
const response = await client.messages.create({
  model: 'claude-sonnet-4',
  tools: [{
    name: 'classify_ticket',
    description: 'Return the classification.',
    input_schema: {
      type: 'object',
      properties: {
        priority: { type: 'string', enum: ['P1', 'P2', 'P3'] },
        reason: { type: 'string', maxLength: 200 },
      },
      required: ['priority', 'reason'],
    },
  }],
  tool_choice: { type: 'tool', name: 'classify_ticket' },
  messages: [{ role: 'user', content: ticket }],
});
```

**When it fails:** When the schema is wrong for the task (e.g., you enum'd to 3 categories but the real world has 5). No prompting technique fixes a wrong schema.

## 2. Few-shot with worked examples

**What it is:** Include 2–5 input/output pairs in the prompt showing exactly the transformation you want.

**Why it works:** Models learn the mapping from examples much faster than from descriptions. Especially valuable for edge cases and format quirks.

**Eval:**
```
Task: Extract vendor names from 50 varied invoice PDFs (some have logos, some misspellings, some no vendor line).

A) Zero-shot ("Extract the vendor name")
B) Zero-shot with detailed rules
C) 3-shot with worked examples covering the edge cases

Measure exact-match accuracy against a hand-labeled ground truth.

Typical result: A ~65%, B ~78%, C ~92%.
```

**Rules:**
- Cover edge cases in your examples, not the easy path
- Use examples that were actually confusing before
- Keep examples in the same format as the real task
- 3 examples > 20 examples for most cases (diminishing returns after ~5)

## 3. Chain-of-thought (for hard reasoning only)

**What it is:** Ask the model to reason step-by-step before answering. Either explicit ("Let's think step by step") or via a scratchpad tool.

**Why it works:** Models allocate more compute per token when reasoning is visible. For arithmetic, multi-step logic, and complex classification, this dramatically improves accuracy.

**Why it can hurt:** For simple classification, forcing the model to reason introduces noise. The model rationalizes its way to worse answers.

**Eval:**
```
Task: 100 math word problems from GSM8K.

A) Direct answer only.
B) "Let's think step by step." then the answer.

Measure: correct-answer rate.

Typical: A 40-60%, B 75-92% (on capable models).
```

**Counter-eval:**
```
Task: 100 tickets, is this P1 or not?

A) Direct answer P1/not-P1.
B) "Reason step by step, then answer."

Sometimes A and B are equal. Sometimes A is BETTER because the model doesn't talk itself into upgrades.
```

**Rule:** CoT for arithmetic and multi-step logic. Don't reflexively apply it to simple classification.

## 4. Role and persona (targeted)

**What it is:** "You are a compliance lawyer reviewing this NDA."

**Why it can work:** The model has seen enough training data associated with specific roles that "compliance lawyer" pulls in relevant vocabulary, caution levels, and structure.

**Why it's overused:** "You are a world-class expert in X" is background noise the model has seen millions of times. It doesn't add real signal.

**When it moves the needle:**
- Specific role: "You are a paralegal preparing a redline for a partner's review"
- Combined with a task shape: "Return a redline as a numbered list of proposed changes"
- Where the role implies specific vocabulary: "You are an ophthalmologist"

**When it's noise:**
- "You are a world-class expert."
- "You are an award-winning writer."
- "You are the best in the world at this."

**Eval:**
```
Task: Draft 50 tenant maintenance responses.

A) No persona.
B) "You are a helpful assistant."
C) "You are a property manager with 15 years of experience at a class-B retail center."

Measure with a rubric (clarity, empathy, specificity) scored by a second LLM as judge.

Typical: A ≈ B, C moderately better. Deltas are real but small vs #1 and #2.
```

## 5. Discipline / domain prefixes

**What it is:** Prefixing the request with a domain framing like "This is a real-estate diligence question." or "Approach this as a legal compliance issue."

**Why it works:** Similar to persona, but framing the problem instead of the answerer. Sometimes even more effective because it changes how the model interprets ambiguous terms in the input.

**Eval:**
```
Task: 40 ambiguous questions like "What's the biggest risk here?"

A) No framing.
B) "Approach this as a legal question."
C) "Approach this as a financial question."

Measure how the answers cluster. B pulls answers toward liability, indemnification, notice deadlines. C pulls answers toward cash flow, covenants, DSCR.
```

**Practical use:** When your task has ambiguous domain terms (e.g., "risk", "value", "priority"), a domain prefix disambiguates cheaply.

## 6. Quality-forcing (critique-then-improve)

**What it is:** Have the model produce a first draft, then critique it, then produce a final version. Usually as one prompt with three sections.

**Why it works:** The model catches its own errors on the critique pass. Especially good for writing tasks.

**Cost:** Roughly 2× the tokens. Roughly 2× the latency. Sometimes worth it.

**Eval:**
```
Task: 30 client-facing emails responding to complaints.

A) Direct draft.
B) Draft → self-critique → revise (single prompt with three sections).

Measure with a rubric via LLM-as-judge:
- Clarity, empathy, specific-remedy, professionalism

Typical result: B moderately better. Bigger effect on longer outputs, smaller effect on short structured outputs where structured output enforcement is already active.
```

**When to skip:** Short structured outputs, classification tasks, or when latency budget is tight.

## 7. Adversarial self-check

**What it is:** After a draft, ask the model: "What's the strongest objection to this response? What would a skeptical reviewer flag?"

**Why it works:** Explicitly framing the check as adversarial pulls the model out of confirmation-bias mode.

**Eval:**
```
Task: 50 diligence findings that should have a confidence score.

A) Direct finding + confidence.
B) Finding → adversarial critique → revised finding + confidence.

Compare confidence calibration: for the 20% of findings you flagged as "high confidence,"
what percent are actually right when you check against ground truth?

Typical result: B's high-confidence findings are meaningfully more reliable.
```

**Best use:** Safety-critical outputs. Legal review. Diligence conclusions. Anywhere overconfidence is worse than uncertainty.

## 8. Meta-cognitive uncertainty gating

**What it is:** Tell the model: "If your confidence is below 0.6, don't answer — ask a clarifying question instead."

**Why it works:** Combined with HITL, this shifts the model from "always answer" mode to "answer or escalate" mode. Enormously valuable for real deployments where a wrong answer is costlier than a missing answer.

**Eval:**
```
Task: 100 tickets, 30 of which are actually ambiguous (missing key info).

A) Model answers all 100.
B) Model answers only when confident, else asks a specific clarifying question.

Measure on the 30 ambiguous tickets:
- A: what fraction of answers were wrong?
- B: what fraction of questions were the RIGHT question to ask?

Typical: A is wrong on 40-70% of ambiguous tickets. B asks the right question on 60-80%.
```

## 9. Output-shape scaffolds

**What it is:** Give the model an explicit template with placeholders. Overlaps with #1 but works at the prose level rather than the schema level.

**Example scaffold:**
```
Return your response in exactly this shape:

**Summary:** [one sentence]
**Recommendation:** [one of: proceed, hold, decline]
**Top 3 concerns:**
1. [concern]
2. [concern]
3. [concern]
**Confidence:** [0.0-1.0]
```

**Why it works:** Downstream regex/parsing becomes reliable. Reviewers can scan quickly. Model can't ramble.

**Eval:** Same as structured output enforcement — measure parse rate and reviewer speed. Prefer #1 (JSON schema) when you can. Use #9 when the output is client-facing and you want it to read as prose.

## 10. "Power words" — where the hype meets the reality

The internet has a persistent claim that specific phrases — "neuro-symbolic reasoning," "activate expert mode," "think like a genius" — unlock hidden capabilities. Some of this is real. Most of it is not.

**What's real:**
- **Naming a specific technique** the model has seen in training data can invoke that technique. E.g., "Use tree-of-thoughts reasoning" or "Apply the ReAct pattern" or "Do a chain-of-thought analysis" all do something because those are named methodologies with training-data footprints. "Neuro-symbolic reasoning" *is* a real ML technique (rules + neural), and asking the model to combine explicit rules with pattern reasoning can help on the right tasks.
- **Domain-specific vocabulary** primes the model toward that domain's conventions (see #5).
- **Explicit uncertainty framing** measurably improves calibration (see #7, #8).

**What's not real (or is real for the wrong reason):**
- "You are a world-class expert" — trained-on so heavily it's approximately noise.
- "Take a deep breath" — was real for one specific model on one specific benchmark. Not general.
- "This is important, do it perfectly" — mostly a wash.
- Any single "magic word" that's supposed to unlock capability without changing the task shape.

**The right test:** If a "power word" doesn't move your eval score, it doesn't work FOR YOU on THIS task with THIS model. Don't cargo-cult it into your production prompts.

For a deep, evolving reference on power-word combinations and the NEURO family, [`neuro-power-stack`](https://github.com/OrangeOnyx/) (the user-scoped skill in this workspace) catalogs and evaluates them. That's the right home for the deep dive. This doc's job is to keep you grounded: **techniques not incantations**.

## Combining techniques

The techniques above stack. A production prompt for a real task often uses 4-6 of them:

```
[Discipline prefix]     "Approach this as a legal review."
[Role]                  "You are a paralegal preparing a redline."
[Few-shot]              "Here are 3 examples of a good redline."
[Output scaffold]       "Return a numbered list of proposed changes."
[Structured output]     tool_use with JSON schema
[Uncertainty gating]    "If a clause is ambiguous, flag it with 'CLARIFY' instead of guessing."
```

Every one of those additions should be justified by an eval delta. If your suite passes without one, drop it.

## Eval infrastructure

If you don't have an eval suite for your prompts, you don't have prompt engineering — you have prompt vibes. See [`../07-evaluation`](../07-evaluation) in this program.

Minimum viable eval:
1. 20-100 real inputs
2. A ground-truth answer or a rubric
3. A script that runs the prompt against all inputs
4. A score (accuracy, rubric mean, calibration, whatever the task cares about)

With that in place, every prompting technique above becomes a hypothesis you can test in 5-10 minutes. Without it, you're a person on the internet trading power words.

## Reading list

- Anthropic's [prompt engineering docs](https://docs.anthropic.com/en/docs/build-with-claude/prompt-engineering/overview) — vendor guidance, opinionated but honest
- [Chain-of-Thought Prompting Elicits Reasoning in LLMs](https://arxiv.org/abs/2201.11903) — the original CoT paper
- [ReAct: Synergizing Reasoning and Acting](https://arxiv.org/abs/2210.03629)
- [Constitutional AI](https://arxiv.org/abs/2212.08073) — where the self-critique idea comes from
- Related in this program: [`../07-evaluation`](../07-evaluation), [`../08-cost-engineering`](../08-cost-engineering)
- Deep dive on power-word combinations: your `neuro-power-stack` user skill
