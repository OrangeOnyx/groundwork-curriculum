# LLM Gateway Selection

An LLM gateway is middleware between your apps and AI providers. It handles:
- Routing (which provider / model for which request)
- Logging (every prompt + response, redacted)
- Cost attribution (per team / project / user)
- Rate limiting (protect from runaway spend)
- PII redaction (before hitting provider)
- Fallback (auto-retry with alternate provider on failure)
- Caching (semantic + prompt caching)

## Why you need one

Without a gateway:
- No cost attribution per team
- No unified logs for audits or evals
- No PII scrubbing
- No fallback when a provider is down
- Each team manages their own keys

With a gateway:
- Central point of control, observability, and policy

## Options

### Portkey (SaaS)
- **Best for:** Mid-market to enterprise wanting a managed solution
- **Pros:** Fast setup, deep observability, good fallback logic, virtual keys per team
- **Cons:** SaaS (data crosses their systems — get DPA), cost scales with volume
- **Pricing:** Free tier; paid starts ~$99/mo

### LiteLLM (open source, self-hosted)
- **Best for:** Engineering-forward teams that want full control
- **Pros:** Self-hosted (data stays with you), free, active community, wide provider support
- **Cons:** You operate it (uptime, upgrades, scaling)
- **Pricing:** Free; hosting cost

### Vercel AI Gateway
- **Best for:** Teams already on Vercel
- **Pros:** Zero setup, integrated with Vercel apps, good observability
- **Cons:** Vercel platform lock-in
- **Pricing:** Usage-based

### Cloudflare AI Gateway
- **Best for:** Cost-sensitive routing at edge
- **Pros:** Cheap, edge caching, easy setup
- **Cons:** Lighter feature set than Portkey / LiteLLM
- **Pricing:** Free tier generous

### OpenRouter (as a gateway)
- **Best for:** Small teams experimenting
- **Pros:** One API key, 300+ models, dead simple
- **Cons:** Not a full gateway (limited redaction, weaker auth model for enterprise)
- **Pricing:** Small margin over provider prices

### Roll your own
- **Best for:** Large orgs with unique requirements or existing infra
- **Pros:** Perfect fit
- **Cons:** Non-trivial build; ongoing maintenance

## Decision matrix

| Requirement | Portkey | LiteLLM | Vercel | Cloudflare | OpenRouter | Roll-your-own |
|---|---|---|---|---|---|---|
| Managed (no ops) | ✅ | ❌ | ✅ | ✅ | ✅ | ❌ |
| Self-hosted option | ⚠️ | ✅ | ❌ | ❌ | ❌ | ✅ |
| Cost attribution per team | ✅ | ✅ | ⚠️ | ⚠️ | ⚠️ | ✅ |
| PII redaction | ✅ | ✅ | ⚠️ | ⚠️ | ❌ | ✅ |
| Semantic caching | ✅ | ✅ | ✅ | ✅ | ❌ | ✅ |
| Multi-provider routing | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| Enterprise SSO | ✅ | Config | ✅ | ✅ | ⚠️ | ✅ |
| DPA + zero-retention | Ask | You control | Yes (Vercel) | Yes (CF) | Ask | You control |

## Recommended defaults

- **Startup / < 50 employees:** Cloudflare AI Gateway or Portkey Free
- **Mid-market / 50–500:** Portkey Paid or self-hosted LiteLLM
- **Enterprise:** Self-hosted LiteLLM or roll-your-own on Azure/AWS with existing security tooling

## Setup checklist

Regardless of choice:
- [ ] Gateway sits between all apps and all providers
- [ ] Every request tagged with team, user, purpose
- [ ] Costs report daily to owners
- [ ] Rate limits per team
- [ ] PII redaction before send (regex + optional model-based)
- [ ] Full request/response logging (encrypted, with retention policy)
- [ ] Fallback rules per model
- [ ] Alerting on cost spikes, error rate, 5xx
