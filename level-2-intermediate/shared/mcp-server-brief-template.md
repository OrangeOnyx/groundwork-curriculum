# MCP Server Brief Template

**Server and owner:** [name], [technical owner], [on-call owner].  
**Purpose:** [specific capabilities], not [explicit exclusions].  
**Callers and auth:** [clients], token audience, scopes, organization binding.  
**Data boundary:** allowed entities/fields; forbidden fields; retention/log redaction.  
**Tools/resources:** for each: name, purpose, strict input schema, output schema, read/propose/write classification, authorization rule, result cap, timeout, audit event.  
**Write policy:** proposal shape, approver, commit endpoint, idempotency, rollback.  
**Rate limits:** actor/org/tool limits, response-byte and query-cost caps.  
**Safety:** prompt-injection assumptions, input validation, error taxonomy, kill switches.  
**Observability:** trace fields, metrics, alerts, sampled review.  
**Eval/launch:** isolation tests, malformed input tests, canaries, shadow plan, rollback.

## Example outline: Belle Read Server
Purpose: provide authorized lease and maintenance facts to internal assistants. Callers use short-lived organization-bound tokens. Tools: `get_lease_clause`, `list_open_maintenance`, and `get_property`; each is read-only, RLS-backed, returns a fixed schema, and logs safe IDs plus row count. `propose_create_ticket` returns a draft only; the Belle app repeats authorization before persistence. Rate limits apply by actor and property. Tests include guessed lease IDs, cross-tenant semantic requests, oversized searches, stale addenda, and repeated proposal approval. Success means zero isolation failures, predictable p95 latency, and complete audit traces.

**Completion check:** the brief is not complete until an unauthorized-ID test, a rate-limit test, a proposed-write approval test, and a server-disable test have recorded expected results.
