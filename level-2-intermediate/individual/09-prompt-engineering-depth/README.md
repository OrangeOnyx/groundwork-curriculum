# Prompt Engineering at Builder Depth

At Level 2, prompting stops being clever phrasing and becomes interface design. A prompt defines role boundaries, data contracts, tool permissions, output schema, escalation behavior, and attack resistance. If your prompt is doing business logic, move that logic into code. If it is hiding an ambiguous requirement, write an eval before adding more instructions.

Use reasoning patterns selectively. Tree-of-thoughts can explore alternatives, but it is expensive and often unnecessary. Reflexion can repair a draft, but only with a concrete rubric and source evidence. DSPy can systematically optimize modules, but only after you have a trustworthy metric. None of these replace retrieval, typed outputs, or authorization.

The practical baseline is short instructions, relevant evidence, strict schemas, named refusal conditions, and examples only for behavior the model consistently misses. Separate the internal reasoning you do not need from the observable decision record you must audit. In property workflows, the trace should show evidence and policy rule—not invented prose about hidden thought.

Adversarial hardening is part of prompt design. Tenant messages, lease PDFs, and data rooms are untrusted inputs. Treat every embedded instruction as content, never as authority.

Before adding complexity, run this design through a small representative eval and inspect the trace with the operator who will own failures. Make the boundary, escalation, and rollback visible in the product. That discipline will expose more useful work than another round of prompt cleverness.

## In this module

- [`prompting-techniques.md`](./prompting-techniques.md) — the 10 techniques that actually move the needle, each with an eval you can run
- [`tree-of-thoughts.md`](./tree-of-thoughts.md) — branching exploration for multi-path reasoning
- [`reflexion.md`](./reflexion.md) — self-critique + repair loops
- [`dspy-primer.md`](./dspy-primer.md) — systematic prompt optimization
- [`adversarial-hardening.md`](./adversarial-hardening.md) — defending against injection in untrusted input
