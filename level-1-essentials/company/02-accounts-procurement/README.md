# 02 — Accounts & Procurement

The company's AI stack, in order of purchase.

## The purchasing order

1. **Enterprise chat platform** — ChatGPT Enterprise or Claude Team/Enterprise (usually both)
2. **Grounded search** — Perplexity Enterprise
3. **Code assistant** — GitHub Copilot Business or Cursor site license
4. **Meeting intelligence** — Otter, Fireflies, or Gong
5. **LLM gateway** — Portkey / LiteLLM / OpenRouter (see `llm-gateway-selection.md`)
6. **Vector DB** — pgvector to start; Pinecone/Weaviate/Qdrant at scale (see `vector-db-selection.md`)
7. **Observability** — Langfuse / Helicone / LangSmith
8. **Domain-specific** — CRM AI (Salesforce Einstein), legal AI (Harvey, Ironclad), etc.

## Contract requirements

Every AI vendor contract requires:

- Signed DPA
- Zero-retention configuration available and enabled where policy demands
- SOC 2 Type II report (or equivalent) on file
- Data residency terms clear
- Sub-processor list disclosed and reviewed
- Right-to-audit clause
- Breach notification within 72 hours
- Data deletion upon termination

## Files in this section

- `platform-account-order.md` — Which platforms and in what order
- `llm-gateway-selection.md` — Comparison of gateway options
- `vector-db-selection.md` — Vector DB tradeoffs and recommendation matrix
- `budget-and-billing-model.md` — Budget setup, cost centers, chargeback

## Ownership

- IT / Procurement owns purchasing
- Security owns DPA review
- Steering Committee approves new vendors
- Finance owns billing model
