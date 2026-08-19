# When to Use Which Architecture

Choose from the failure mode, not from what looks impressive in a demo.

| Situation | Default architecture | Why | Do not use |
|---|---|---|---|
| Extract named lease fields from known documents | Deterministic pipeline plus Reflection | Schema and citations are inspectable | Open-ended ReAct |
| Answer a lease question with document evidence | ReAct with retrieval | Each result determines the next lookup | Multi-agent debate |
| Build a diligence checklist from an uneven data room | Plan–Execute | Completeness and resumability matter | A single massive prompt |
| Triage incoming tenant messages | Router plus policy rules | Classification and escalation are the real job | An autonomous agent with write access |
| Produce a human-reviewed owner update | Draft plus Reflection | Tone and completeness benefit from a critic | Tool-heavy agent loop |

Use a workflow, not an agent, when the path is known: nightly lease ingestion, embedding generation, invoice reminders, and scheduled reindexing should be queues and functions. The model can classify or extract inside the workflow, but it should not invent the sequence.

Use ReAct when the agent must discover which evidence is relevant. Make every tool narrow and read-only by default. If a tool can change property, money, tenant records, or a deal stage, make it return a proposal first. A separate approval action carries the side effect.

Use Plan–Execute when work has a finite checklist and can survive partial completion. Require each task to declare its inputs, expected artifact, and dependency. Do not let execution create new task classes.

Use Reflection only when the review can reference a concrete rubric. “Review yourself” is theater. “Flag every claim lacking a lease page citation; validate currency and date formats; return `pass` or a repair list” is useful.

The operating rule: deterministic software owns policy; models own interpretation; humans own irreversible judgment.
