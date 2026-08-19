# MCP Server: Give Agents Safe Access to Real Data

> **Live code:** [`OrangeOnyx/belle-mcp-server`](https://github.com/OrangeOnyx/belle-mcp-server) — clone, run locally, then follow the walkthrough. See the [repos overview](../../repos/README.md) for how the four Level 2 repos fit together.

Model Context Protocol (MCP) is a standard way to expose tools and resources to an AI client. For Belle Realty, the first MCP server should be intentionally boring: read-only, tenant-scoped, rate-limited queries that return typed facts. Boring is a feature. It lets an agent answer “What is the late-fee policy for Unit 204?” without handing it a Supabase service key or unrestricted SQL.

Build a thin policy layer over Supabase, not a database proxy. Each tool has a clear purpose, input schema, authorization check, row limit, response schema, audit event, and redaction behavior. Examples: look up a property, fetch a lease clause, list open maintenance tickets, and retrieve a tenant’s permitted communications context. Tools return facts and stable IDs; the LLM decides how to explain them.

Writes are proposals. An MCP call may construct `propose_create_maintenance_ticket`, but the actual commit happens through a separate application approval endpoint with an actor, review record, and idempotency key. This boundary keeps a conversational model from becoming an unreviewed operator.

Read the build guide, then implement authentication and rate limits before connecting any client. The server is production infrastructure, not prompt plumbing.

Before adding complexity, run this design through a small representative eval and inspect the trace with the operator who will own failures. Make the boundary, escalation, and rollback visible in the product. That discipline will expose more useful work than another round of prompt cleverness.
