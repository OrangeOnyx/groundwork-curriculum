# Logging and Redaction

Every LLM call is logged. Sensitive fields are redacted before storage. This is non-negotiable.

## What to log

For every LLM request:

```json
{
  "id": "req_abc123",
  "timestamp": "2026-08-19T15:30:00Z",
  "team": "sales",
  "project": "email-triage",
  "user_id_hash": "sha256-of-user-email",
  "tool": "chatgpt-enterprise",
  "model": "gpt-5-2026-06-01",
  "provider": "openai",
  "system_prompt_hash": "sha256-of-system-prompt",
  "input_tokens": 1234,
  "output_tokens": 567,
  "latency_ms": 3420,
  "cost_usd": 0.023,
  "success": true,
  "error_code": null,
  "cache_hit": false,
  "input_redacted": "[redacted prompt with PII scrubbed]",
  "output_redacted": "[redacted response]",
  "tool_calls": [...]
}
```

## Redaction rules

Before any prompt or response is stored, run redaction:

### Regex-based (fast, first pass)
- Email addresses → `<EMAIL>`
- Phone numbers → `<PHONE>`
- SSNs → `<SSN>`
- Credit cards → `<CARD>`
- IBANs → `<IBAN>`
- API keys (common patterns: `sk-`, `ghp_`, `AKIA`) → `<KEY>`
- IP addresses → `<IP>` (optional)

### Model-based (slower, second pass for high-sensitivity)
- Use a small classifier or LLM to redact:
  - Person names in restricted contexts
  - Company names when restricted
  - Sensitive medical/legal terms

### Configurable per team
- Some workflows must retain data to be useful (e.g., a lease-extraction workflow retains names). Configure exceptions per project, not per request.

## Where logs go

- **Hot storage:** LLM gateway's DB or observability platform for 30 days (Langfuse, Helicone, LangSmith, or in-house)
- **Warm storage:** Company data warehouse for 90 days (analytics)
- **Cold storage:** S3 / Glacier for 1 year (audit)
- **Deletion:** After retention window; secure deletion documented

## Who can access

- **Individual user:** their own logs (rolling 30 days)
- **Team lead:** their team's logs (redacted content, full metadata)
- **Steering Committee:** aggregate + drill-down with justification
- **Security:** incident investigation with full access
- **Everyone else:** no access

Access logged and reviewed quarterly.

## Retention conflict with debugging

Engineers sometimes need to see full prompts to debug bugs. Process:

1. Engineer files a debug request with the ticket ID
2. Security team approves
3. Full-fidelity log accessible for the specific request ID, for a bounded time (e.g., 24 hours)
4. Access logged

## What NOT to log

- Passwords, keys, tokens even if user pastes them (redact first)
- Full customer PII in the clear
- HIPAA-protected content in the clear
- Anything the user has explicitly requested to be deleted (Right to be Forgotten under GDPR)

## Compliance touchpoints

- **GDPR:** logs are personal data; retention limited; deletion honored
- **HIPAA:** if PHI is logged, BAA covers it and access controls enforce minimum-necessary
- **SOC 2:** logs demonstrate access control and monitoring
- **CCPA:** users can request their data

## Dashboards

Standard dashboards published to the Steering Committee:

- Total spend per team, per week
- Cost per request per tool
- Model usage mix
- Error rate by provider
- Latency percentiles
- Cache hit rate
- Top workflows by volume
- Anomaly alerts (spend spike, error spike, unusual model use)
