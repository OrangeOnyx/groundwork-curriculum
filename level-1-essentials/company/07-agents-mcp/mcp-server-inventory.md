# MCP Server Inventory

Model Context Protocol (MCP) servers expose your internal tools to AI assistants under least-privilege scopes. This inventory is what you build first.

## Priority tier 1 — Universal

### MCP-01 — Company Knowledge Base
- **Exposes:** Search + fetch across the KB
- **Reads:** all approved KB docs, permission-filtered
- **Writes:** none (read-only)
- **Auth:** SSO passthrough

### MCP-02 — Calendar
- **Exposes:** Read calendars, propose events, no auto-create
- **Reads:** calendars the user has access to
- **Writes:** draft events only (HITL to confirm)
- **Auth:** OAuth per user

### MCP-03 — Email (read/draft only)
- **Exposes:** Search, read, draft (never send)
- **Reads:** the user's inbox
- **Writes:** drafts only
- **Auth:** OAuth per user

## Priority tier 2 — Business systems

### MCP-04 — CRM
- **Exposes:** Read records, propose updates
- **Reads:** contacts, accounts, opportunities per user's CRM permissions
- **Writes:** propose only; user confirms in CRM UI
- **Auth:** per-user OAuth

### MCP-05 — Ticketing (Jira / Linear / GitHub Issues)
- **Exposes:** Search tickets, read, comment, propose new tickets
- **Writes:** comments and drafts only; new tickets require HITL
- **Auth:** per-user

### MCP-06 — Data Warehouse (read-only)
- **Exposes:** Read from approved views (not raw tables)
- **Writes:** none
- **Auth:** service account with view-only role, user identity forwarded for auditing

### MCP-07 — Documents (Drive / Notion / SharePoint)
- **Exposes:** Search, read, create in scratch folders
- **Reads:** per user's ACL
- **Writes:** only in user's personal or scratch spaces
- **Auth:** per-user

## Priority tier 3 — Advanced

### MCP-08 — Support tickets (Zendesk / Intercom)
- **Exposes:** Read tickets, draft replies, comment
- **Writes:** drafts only
- **Auth:** per-agent

### MCP-09 — Code (GitHub / GitLab)
- **Exposes:** Read repos, comment on PRs, propose PR text
- **Writes:** comments and drafts only; commits require the developer
- **Auth:** per-user token, scoped to their repos

### MCP-10 — Billing / Finance systems
- **Exposes:** Read-only aggregates
- **Writes:** none
- **Auth:** admin only

### MCP-11 — HRIS
- **Exposes:** Org chart, role, tenure (non-sensitive)
- **Writes:** none
- **Auth:** admin only for sensitive fields

## Server design principles

1. **Least privilege by default** — read before write, drafts before send
2. **Explicit tool descriptions** — the LLM must understand exactly what a tool does
3. **Structured inputs/outputs** — JSON schema for every tool
4. **Idempotent where possible** — tools that repeat safely reduce risk
5. **Deterministic error handling** — clear error messages route back through the agent
6. **Audit logging** — every tool call logged with actor, args, outcome
7. **Rate limits per user** — protect from runaway agents

## Deployment topology

- MCP servers run in your VPC / secure network, not on user devices
- User's AI client (Claude Desktop, Cursor, etc.) authenticates and proxies through your identity provider
- Each server exposes only its scoped tools
- Central MCP gateway (optional) aggregates access and adds observability

## Discovery

- Every MCP server publishes a public description of its tools (for developer awareness)
- The AI Steering Committee maintains a registry
- New MCP servers require Steering Committee approval

## Testing

Before deploying an MCP server:
- [ ] Tool descriptions accurate
- [ ] Auth model reviewed by Security
- [ ] Rate limits tested
- [ ] Audit log entries verified
- [ ] Adversarial-input testing (prompt injection via tool responses)
- [ ] Downstream permissions honored
- [ ] Rollback / kill switch confirmed
