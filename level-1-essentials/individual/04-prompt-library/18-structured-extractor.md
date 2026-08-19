# Structured Document Extractor

**Purpose:** Pull specific fields from an unstructured document into a JSON or table format.

**When to use:** When you have a lease, contract, invoice, or spec and need specific fields extracted.

**Category:** Writing

**Model recommendation:** GPT-5 with JSON mode, or Claude with structured output.

---

## The prompt

```
Extract structured data from the document below.

Document:
---
{DOCUMENT}
---

Fields to extract:
{FIELD_LIST — e.g., parties, effective_date, term_length, monthly_rent, security_deposit}

Output format: {JSON | Markdown table | CSV}

Rules:
- For each field, return: value, source_snippet (the exact text where you found it), confidence (high/medium/low).
- If a field isn't present, return null and explain why.
- Do not infer values that aren't stated.
- Normalize dates to ISO 8601.
- Normalize amounts to decimal numbers with currency code.

Format:

```json
{
  "extracted": {
    "field_1": {"value": ..., "source": "...", "confidence": "high"}
  },
  "missing_fields": ["field_5", "field_9"],
  "notes": "any observations about the document quality"
}
```
```

## Variables

- `{DOCUMENT}`, `{FIELD_LIST}`

## Example use case

Lease extraction for Belle Realty.

## Expected output shape

JSON with value, source, confidence per field.
