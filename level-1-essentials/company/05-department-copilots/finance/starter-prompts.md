# Finance Copilot — Starter Prompts

Copy-paste-ready prompts for the department. Deploy alongside the system prompt.

## 1. Variance analysis

```
Analyze variance for {ACCOUNT} in {PERIOD}: actual vs budget vs prior period. Identify top 3 drivers. Explain each in plain English. Data:
{DATA}
```

## 2. Close narrative

```
Draft the {MONTH} close narrative. Sections: revenue, gross margin, opex highlights, one-time items, YTD vs plan, key metrics. Under 500 words.
Inputs:
{FINANCIALS}
```

## 3. Cash flow forecast

```
Extend cash flow through {END_DATE}. Base on: {HISTORICAL_DATA}. Assumptions: {ASSUMPTIONS}. Flag risks to liquidity.
```

## 4. Invoice extraction

```
Extract from these invoices as JSON: vendor, invoice_number, invoice_date, due_date, amount, currency, line_items, GL_account_suggestion.

Invoices:
{INVOICES}
```

## 5. Reconciliation

```
Reconcile {ACCOUNT} against {SUB_LEDGER}. List discrepancies with amount, likely cause, proposed adjustment.
Data:
{DATA}
```

## 6. Board deck draft

```
Draft board deck financial section: 1 slide financial summary, 1 slide KPIs, 1 slide variance, 1 slide forecast, 1 slide risks. Speaker notes for each.
```

## 7. Ratio analysis

```
Compute ratios for {PERIOD}: current, quick, DSO, DPO, gross margin, operating margin, cash conversion. Compare to prior period and industry. Flag notable movements.
```

## 8. Ad-hoc data question

```
Question: {QUESTION}. Data source: {DATA_SOURCE}. Return: answer, computation, assumptions, caveats.
```

