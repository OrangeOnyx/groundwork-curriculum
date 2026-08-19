# Vendor DPA Checklist

A **Data Processing Agreement (DPA)** must be signed with every AI vendor that processes company data. Do this before rollout, not after.

## What to require in every AI DPA

- [ ] **Zero-retention clause** — vendor will not retain inputs beyond the request lifetime, or will retain only for a defined short period (e.g., 30 days for abuse prevention) and only in encrypted form
- [ ] **No-training clause** — vendor will not train models on our inputs or outputs
- [ ] **Sub-processor list** — vendor identifies all sub-processors and notifies of changes
- [ ] **Data location** — where processing occurs; EU customers require EU residency options
- [ ] **Breach notification** — vendor notifies within 72 hours of a security incident
- [ ] **Audit rights** — right to request evidence of controls (SOC 2 Type II report at minimum)
- [ ] **Deletion on termination** — vendor deletes all data within defined period after contract ends
- [ ] **Data portability** — right to export data before termination
- [ ] **Liability caps** — appropriate to volume and sensitivity of data
- [ ] **BAA addendum** — if PHI is involved (HIPAA)
- [ ] **DPA appendix compliant with GDPR** — if EU personal data
- [ ] **Standard Contractual Clauses (SCCs)** — for cross-border EU-US transfers

## Provider-specific notes

### OpenAI (Enterprise / Team)
- API zero-retention available (`x-openai-organization` header + request); Enterprise ChatGPT no-training default
- Sign OpenAI DPA + BAA (if applicable)
- Verify: SOC 2 Type II, CSA STAR

### Anthropic (Claude for Enterprise)
- No training on API traffic by default; verify in contract
- Zero-retention for API available under Enterprise contract
- Sign Anthropic DPA
- Verify: SOC 2 Type II

### Google (Gemini for Workspace / Vertex AI)
- Existing Google Workspace DPA typically covers Gemini
- Vertex AI has separate terms
- Verify: SOC 2, ISO 27001

### Microsoft (Copilot for M365 / Azure OpenAI)
- Existing M365 DPA covers Copilot for Microsoft 365
- Azure OpenAI has its own commitments (no data used for training)
- Verify: HITRUST, SOC 2, ISO 27001

### Perplexity (Enterprise Pro)
- Zero-retention available under Enterprise agreement
- Sign Perplexity DPA
- Verify enterprise controls

### xAI / Grok
- Read current terms carefully — training defaults have changed multiple times
- Confirm no-training in writing

### Groq / OpenRouter / Together / Fireworks
- Read their terms; they route to underlying open-weight models
- Fewer certifications typically; use only for public/internal data unless verified

## DPA request template

Send to vendor:

> Subject: DPA request for [COMPANY] AI deployment
>
> Hello [VENDOR],
>
> We are preparing to deploy [PRODUCT] across [COMPANY]. Before rollout, we need:
> 1. Your current Data Processing Agreement (executable form)
> 2. Confirmation of zero-retention on [SERVICE TIER]
> 3. SOC 2 Type II report (under NDA)
> 4. BAA if we process PHI [yes/no]
> 5. Sub-processor list
> 6. Data residency options
>
> Please share these and route to our legal team at [EMAIL].
>
> Thank you.

## Tracking

Maintain a register:

| Vendor | Product / tier | DPA signed date | Zero-retention? | Sub-processors reviewed? | Renewal date | Owner |
|---|---|---|---|---|---|---|
| OpenAI | Enterprise | | | | | |
| Anthropic | Claude Enterprise | | | | | |
| Google | Gemini Workspace | | | | | |
| Microsoft | Copilot 365 | | | | | |
| Perplexity | Enterprise Pro | | | | | |

Owned by: Legal or Vendor Management. Reviewed quarterly by Steering Committee.
