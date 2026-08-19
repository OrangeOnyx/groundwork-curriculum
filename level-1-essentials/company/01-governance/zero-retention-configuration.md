# Zero-Retention Configuration Guide

For each approved provider, this is how you configure "no training, no retention beyond request lifetime."

Verify after configuring; screenshot the settings for the audit file.

## OpenAI

### ChatGPT Enterprise / Team
- Default: no training on your prompts, no retention beyond 30 days for abuse monitoring (encrypted)
- Verify: Admin Console → Data Controls
- Contract: OpenAI Enterprise Agreement + DPA + BAA if applicable

### ChatGPT Business (SMB tier)
- Default: no training; same 30-day abuse window
- Verify: Admin Console

### OpenAI API
- Default: no training on API traffic (since March 2023)
- **Zero-retention**: enterprise customers can request `x-openai-zdr` header behavior or contractual zero-retention
- Verify: contract + `openai.com/policies/api-data-usage-policies`

## Anthropic

### Claude for Enterprise / Team
- Default: no training on Team/Enterprise conversations
- Zero-retention: configurable under Enterprise contract
- Verify: Admin Settings → Data & Privacy
- Contract: Anthropic MSA + DPA

### Anthropic API
- Default: no training on API traffic
- Zero-retention available in Enterprise contract
- Verify: contract terms + Anthropic Trust Center

## Google

### Gemini for Google Workspace
- Default: no training on Workspace data
- Verify: Admin Console → Gemini App settings
- Contract: existing Workspace DPA (Gemini is covered)

### Google AI Studio / Vertex AI (paid tier)
- Vertex AI paid tier: no training on your data
- AI Studio free tier: data may be used to improve models — DO NOT use for company data on free tier
- Verify: Vertex AI console → project settings
- Contract: Google Cloud DPA

## Microsoft

### Copilot for Microsoft 365
- Default: no training on your prompts / responses
- Data stays in Microsoft 365 service boundary
- Verify: Admin Center → Copilot governance settings
- Contract: existing M365 DPA covers this

### Azure OpenAI Service
- Default: no training on customer data (contractually committed)
- Data stays in your Azure tenant / region
- Verify: Azure portal → OpenAI resource → Networking + Content filtering
- Contract: Azure Enterprise Agreement + AI Services Product Terms

## Perplexity

### Perplexity Enterprise Pro
- Default: no training on Enterprise Pro conversations
- Verify: Admin settings → Data & Privacy
- Contract: Perplexity Enterprise Agreement + DPA

### Perplexity API
- Configure per contract — request zero-retention explicitly

## xAI Grok

- Read current terms — default has changed multiple times
- If used: only for Public data unless zero-retention is contractually confirmed
- Verify quarterly

## Groq / Together / Fireworks / OpenRouter

- These providers route to open-weight models
- Read each provider's data policy — most claim no training, but certifications vary
- Suitable for Public / Internal data by default; Confidential only with contract review

## Local / self-hosted (Ollama, vLLM, TensorRT-LLM)

- Zero data leaves your infrastructure by definition
- Suitable for all classes, subject to local security controls

## Verification checklist per provider

After configuring, save these to the audit file `governance/audits/YYYY-MM/`:

- [ ] Screenshot of the "no training" toggle set to off
- [ ] Screenshot of the retention setting
- [ ] Copy of signed DPA
- [ ] Date of last verification
- [ ] Owner (person responsible for re-verifying quarterly)

## Quarterly re-verification

The Steering Committee's quarterly agenda includes:
- Walk through this document
- Confirm every provider still configured correctly
- Note any changes to vendor defaults (which happen)

If a vendor changes defaults in a way that increases retention or training, they must renotify per DPA; escalate immediately.
