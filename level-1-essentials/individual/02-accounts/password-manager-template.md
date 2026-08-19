# Password Manager Template

Create one entry per provider. Recommended tool: 1Password, Bitwarden, or Dashlane.

## Entry template

```
Title: [Provider] — [Purpose]  (e.g., "OpenAI — Personal Dev")

Username: [account email]
Password: [account password]

Custom fields:
  api_key:          sk-...
  api_key_created:  2026-08-19
  api_key_rotates:  2026-11-17
  spending_cap:     $20/mo
  billing_alert:    50% and 80%
  scope:            [personal | project-x | client-y]
  provider_url:     https://platform.openai.com
  key_management:   https://platform.openai.com/api-keys

Notes:
  - Data class allowed: [public / internal / confidential]
  - Zero-retention: [yes / no / see DPA]
  - Notes on quirks
```

## Rotation calendar

Add these to your calendar as recurring events:

- Every 90 days: "Rotate API keys" — walk through password manager, regenerate each
- Every 30 days: "Review AI spending" — check each provider dashboard
- Every 7 days: "Check billing alerts" — during Friday weekly review

## Sharing model

- **Never share** a personal API key
- For a company, use the LLM gateway pattern (see `company/02-accounts-procurement/llm-gateway-selection.md`) — no one gets raw keys
- For a family, each person gets their own key on the same billing account (where the provider supports this)
