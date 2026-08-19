# Company Platform Account Order

Procure in this order. Skip to your relevant stack — you don't need everything.

## Tier 1 — The core stack (get these first)

### 1. Enterprise chat platform (pick one primary + one backup)
- **ChatGPT Enterprise** — broadest ecosystem, best for mixed workforce
- **Claude for Enterprise** — best for reasoning-heavy work, engineering, legal
- **Gemini for Workspace** — best if you're on Google Workspace
- **Copilot for Microsoft 365** — best if you're on M365

Recommendation: License one primary for all employees; a second smaller license for a power-user group.

### 2. Perplexity Enterprise Pro
- Real-time research grounding — no other tool substitutes
- Give to all knowledge workers

### 3. Coding assistant
- **GitHub Copilot Business/Enterprise** — best breadth
- **Cursor Business** — best for developer preference
- **Claude Code** — best for agentic multi-file work

Give to every engineer. Pick two of these three; do not skimp.

## Tier 2 — Domain-specific

### 4. Image / video / voice (procure as needed)
- **Midjourney Team** — brand-grade image
- **Ideogram Enterprise** — text-in-image
- **Runway Enterprise or Higgsfield** — video
- **ElevenLabs Business** — voice
- **Sora / Veo** — via primary chat platform enterprise tiers

### 5. Specialized vertical AI
- **Harvey / Spellbook** — legal
- **Hebbia / Glean** — enterprise search
- **Fireflies / Otter** — meeting transcription (enterprise plans)

## Tier 3 — Infrastructure

### 6. LLM Gateway (see `llm-gateway-selection.md`)
- Portkey, LiteLLM (self-hosted), or Vercel AI Gateway
- Centralizes: routing, logging, cost attribution, PII redaction, rate limits

### 7. Vector database (see `vector-db-selection.md`)
- Pinecone, Weaviate, Qdrant, or pgvector on existing Postgres
- Sized per RAG requirements

### 8. Observability
- Langfuse (open source), Helicone, Arize, LangSmith
- Or roll your own with warehouse (Snowflake / Databricks / BigQuery)

### 9. Eval framework
- Promptfoo (CLI, easy), Braintrust, or in-house on your observability stack

## Tier 4 — Optional accelerators

- **Zapier / Make / n8n Enterprise** — no-code automation
- **Replit Teams** — quick internal AI apps
- **v0 / Bolt / Lovable** — AI-generated internal tools
- **Notion AI** or **Coda AI** — embedded in existing knowledge base

## Not on the approved list yet?

- Consumer free-tier AI (default ChatGPT, personal Claude, personal Gemini, Grok free)
- Any tool without a signed DPA
- Any tool that trains on user data by default without disable option
- Any tool from a jurisdiction incompatible with our data policies

## Procurement steps per tool

1. Request Steering Committee approval
2. Legal reviews DPA and terms
3. Security reviews SOC 2 report, sub-processor list, deployment model
4. IT reviews SSO/SCIM, integration surface, admin console
5. Finance approves budget
6. Contract signed
7. Tenant configured with zero-retention, no-training, SSO, appropriate default settings
8. Added to approved-tool list
9. Communicated to org via steering committee update

## Approved-tool register (fill in)

| Tool | Tier | Owner | DPA signed | Deployed to | Users | Cost / month |
|---|---|---|---|---|---|---|
| | | | | | | |
