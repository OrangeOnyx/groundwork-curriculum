# Evaluation: Build a Test Suite Before You Build Trust

An agent without evals is a demo. It may look competent until a lease addendum, angry tenant message, or incomplete data room exposes the exact behavior that matters. Evaluation turns “it seems good” into a measurable contract: these inputs, these outputs, these safety rules, this acceptable regression rate.

Use three layers. Offline evals test curated examples before deployment. Online evals watch production traces, outcomes, and sampled reviews. Human evals cover nuanced correctness, policy, and usefulness that automated checks cannot decide. All three need versioned datasets, prompt and model identifiers, and a baseline to compare against.

For Adam’s projects, create task-specific evals. Lease extraction needs field accuracy and citation support. Tenant triage needs emergency recall and unsafe-action recall. Deal diligence needs blocker recall and false-complete rate. Generic “helpfulness” scores hide the failure modes that cost money or trust.

The supporting guides show how to run a harness, where an LLM judge is valid, and how to prevent a prompt or model change from quietly damaging a working workflow. Evals are not a final QA phase; they are the specification that drives architecture.

Before adding complexity, run this design through a small representative eval and inspect the trace with the operator who will own failures. Make the boundary, escalation, and rollback visible in the product. That discipline will expose more useful work than another round of prompt cleverness.
