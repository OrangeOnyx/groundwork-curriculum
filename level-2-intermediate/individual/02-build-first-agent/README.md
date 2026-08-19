# Build Your First Agent: Lease Clause Extractor

Build something narrow enough to trust: an agent that turns a Belle Realty lease PDF into cited, typed clause records. The output is not a summary. It is a machine-usable object such as `late_fee`, `pet_policy`, `notice_period`, `renewal`, and `maintenance_responsibility`, each with source page, exact quote, confidence, and review status.

This is a better first agent than a general lease assistant because it forces the real engineering decisions: document ingestion, tool boundaries, schema validation, incomplete scans, contradictory language, evaluation, and cost. It also creates durable assets. The extracted clauses feed tenant triage, lease search, portfolio reporting, and future RAG.

The walkthrough uses a simple architecture: deterministic PDF/OCR ingestion; a clause locator with page chunks; an LLM extractor constrained by JSON Schema; a verifier pass that checks every field against quoted evidence; and a human review queue for low confidence or missing evidence. Do not give the model database write access. Let it return a proposed record; your application validates and persists it.

Success is measured at the field level, not by whether the output “sounds right.” Start with 30 representative leases: clean digital PDFs, scans, old templates, addenda, and ugly edge cases. If the agent cannot cite a clause, it did not extract it.
