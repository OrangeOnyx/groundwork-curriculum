# SQL Query Builder

**Purpose:** Write a SQL query for a given question, targeting a specific schema.

**When to use:** You have a schema and a business question and need SQL.

**Category:** Engineering

**Model recommendation:** GPT-5 or Claude — both strong at SQL if given the schema.

---

## The prompt

```
Write a SQL query.

Database: {DIALECT — Postgres / MySQL / BigQuery / Snowflake / SQLite}

Schema:
```sql
{SCHEMA_DDL}
```

Question in business terms:
{QUESTION}

Format:

## Query
```sql
[the query]
```

## What it does
One paragraph plain-language explanation, mapping business terms to columns.

## Assumptions
Bulleted — any assumption you made that could be wrong.

## Performance notes
Which indexes it uses. Estimated cost for a large dataset.

## Alternative formulation
A one-liner note if there's a materially different way to write it.
```

## Variables

- `{DIALECT}`, `{SCHEMA_DDL}`, `{QUESTION}`

## Example use case

How many active leases per property, month-over-month, last 12 months?

## Expected output shape

SQL + explanation + assumptions.
