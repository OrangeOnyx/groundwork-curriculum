# Cost Per Workflow

Calculate cost per completed, correct workflow—not cost per chat. For each run, record model input/output tokens, cache reads/writes, embeddings, reranking, OCR, tool infrastructure, retries, and human-review minutes. Attribute shared platform costs separately so an individual agent is not falsely cheap because observability and storage are invisible.

Define a successful unit. The lease extractor succeeds when required fields are correct, cited, and accepted without material rework. Tenant triage succeeds when the disposition and escalation are correct, not when a response is merely sent. Deal diligence succeeds when checklist rows are evidence-backed and blockers are surfaced. Then calculate: total variable cost divided by successful units; human minutes per successful unit; and cost of prevented errors where that can be measured.

Build a dashboard by workflow, organization, version, model route, and outcome. Set a budget envelope and trigger investigation when cost per successful unit rises, cache hit rate drops, retry rate increases, or escalations change. Compare against the baseline manual process, including delay and error cost—not a fantasy of zero labor.

Use this data to choose architecture. If a second verifier adds 8% cost but removes 70% of unsupported lease clauses, keep it. If a planner adds tokens without improving checklist completeness, remove it. Cost engineering is product judgment backed by telemetry, not a mandate to choose the smallest model.
