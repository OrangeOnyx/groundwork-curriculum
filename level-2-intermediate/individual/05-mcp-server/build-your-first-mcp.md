# Build a Supabase-Backed Belle Realty MCP Server

## Scope the first server
Expose four read tools: `get_property(property_id)`, `get_lease_clause(lease_id, clause_type)`, `list_open_maintenance(property_id, unit_id?)`, and `get_tenant_context(tenant_id)`. Return only fields needed by the agent. `get_tenant_context` might include preferred contact channel, open issues, and lease status; it should not return SSNs, payment instruments, or unrestricted message history.

Each tool validates input with a strict schema, identifies the authenticated actor and organization, then calls a purpose-built Supabase RPC or view using row-level security. Never accept model-produced SQL, table names, filters, or pagination cursors without server validation. Hard-cap results, sort deterministically, and return a `truncated` flag. A client cannot escape its organization or property assignment by guessing IDs.

## Resources and provenance
Expose lease snippets as resources with stable URIs such as `belle://leases/{lease_id}/clauses/{type}`. Include `updated_at`, extraction version, page, quote, and review status. This lets the client cite a fact and detect stale data. Write an audit event for every call: request ID, actor, tool, safe inputs, row count, latency, policy decision, and result version. Do not log tenant message bodies or raw tokens unless retention policy explicitly permits it.

## Propose writes
A tool such as `propose_create_maintenance_ticket` returns a typed proposal with deduplication candidates and policy checks. It never persists a ticket. The Belle Realty app renders the proposal, lets an authorized person modify it, and calls a separate approved-write endpoint. That endpoint repeats authorization, applies an idempotency key, records the approver, and returns the final ticket ID. An agent cannot turn a draft into a side effect by rephrasing a request.

Test ownership isolation, malformed inputs, prompt-injected tool arguments, stale lease references, and repeated approval submissions before adding more tools.
