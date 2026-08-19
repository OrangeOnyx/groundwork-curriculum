# MCP Authentication and Rate Limiting

Use short-lived user or service tokens with audience, organization ID, role, scopes, and expiration. The server verifies the token itself; it does not trust a client-provided tenant, property, or organization identifier. Map scopes to tools: a leasing coordinator may read assigned properties; a maintenance vendor may see only assigned work orders; an internal evaluator may use a sandbox organization only.

Authorize twice. First, the MCP server checks whether the caller may invoke the tool. Second, Supabase row-level security or a security-definer RPC checks which rows it may read. The second check matters because an authorization bug in application code should not become a cross-tenant data breach. Avoid service-role keys in the MCP process whenever possible.

Rate-limit by actor, organization, tool, and response volume. A sensible starting shape is a small burst allowance, a per-minute call cap, and a daily budget for expensive retrieval tools. Reject oversized arguments and return predictable errors: `invalid_input`, `unauthorized`, `forbidden`, `not_found`, `rate_limited`, `conflict`, and `internal_error`. Do not reveal whether an inaccessible tenant exists.

Protect against tool abuse as well as traffic. Cap search results, statement time, response bytes, and concurrent requests. Cache safe, organization-scoped reads briefly. Emit metrics for denied calls, rate-limit events, tool latency, row counts, and unusual ID enumeration. Provide a server-wide kill switch and per-tool feature flags. When a tool is disabled, return a clear unavailable error rather than silently substituting stale data.

The rule is simple: authentication identifies; authorization constrains; rate limiting contains; auditing proves what happened.
