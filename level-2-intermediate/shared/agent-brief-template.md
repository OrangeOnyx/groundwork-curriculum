# Agent Brief Template

## Template
**Name and owner:** [agent name], [business owner], [technical owner].  
**User and job:** [who uses it] needs to [specific outcome].  
**Non-goals:** [what it must not decide or do].  
**Risk tier and data:** [low/medium/high], [permitted data], [forbidden data].  
**Inputs / outputs:** [typed input] → [typed output schema].  
**Architecture:** [workflow, router, ReAct, plan-execute]; stop rules.  
**Tools:** [name, read/write/propose, authorization, row/result cap].  
**Human gates:** [exact triggers, approver role, fallback].  
**Quality contract:** [critical metrics and thresholds].  
**Cost/latency:** [unit budget, p95 target, model route].  
**Rollout/rollback:** [shadow plan, flag, kill switch].

## Worked example: Belle Lease Clause Extractor
**Owner:** Adam; technical owner: Belle Realty platform. **User/job:** leasing operations turns a signed lease into cited clause records. **Non-goals:** legal interpretation, tenant communication, database writes by the model. **Risk/data:** medium; current authorized leases only; never payment instruments or unrelated tenant data.

**Input/output:** `{lease_id, document_version}` → typed clause proposals with normalized value, exact quote, page, source chunk, confidence, and status. **Architecture:** deterministic ingestion and retrieval, structured extractor, one verifier pass; stop after two retrieval attempts. **Tools:** `find_clause` and `get_page`, read-only and lease-scoped; `create_review_task`, propose-only. **Human gates:** low confidence, OCR below 0.88, conflicts, and all final publication. **Quality:** 98% critical-field precision, 100% citation support, zero wrong-lease sources. **Cost:** target under $0.20 per lease; p95 under 90 seconds. **Rollout:** 30-lease shadow set, then one property; per-agent feature flag and writes disabled by default.
