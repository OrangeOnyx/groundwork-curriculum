# Deal Leverage Diligence Checklist Agent

## Define the product
The input is `deal_id` plus a data-room manifest. The output is a versioned checklist: each row has `criterion`, `required_evidence`, `status`, `score`, `finding`, `source_file`, `pages`, `quote`, `confidence`, and `review_required`. Start with 25–40 criteria across financials, property condition, legal/title, leases, insurance, tax, debt, and operations. Make criteria deal-type specific; multifamily and land should not share the same checklist.

## Execution plan
First inventory files with deterministic metadata: filename, path, size, date, type, checksum, OCR status. A classifier labels each file type with confidence. For every checklist row, retrieve only likely documents, then call an extractor constrained to that row’s schema. A scorer compares the extracted evidence to explicit rules: `complete`, `partial`, `missing`, `conflicting`, or `not_applicable`. For example, an insurance item is complete only if the certificate identifies coverage, limits, expiration, and named insured; an old certificate is not “partial complete.”

## Evidence and scoring
Use a 0–100 deal score only as a rollup, never as a substitute for rows. Weight blockers explicitly and cap the total score when a required legal or financial document is missing. Every positive finding needs a quote and page. Every negative finding names what was expected and what was found. Conflicting documents create a review item rather than averaging their claims.

## Human review and eval
Require review for all blockers, scores below 70, low-confidence classification, scanned tables, and any conclusion involving title, environmental, legal, or underwriting judgment. Build gold cases from closed deals and known bad rooms. Score document classification, row status accuracy, citation precision, blocker recall, and false-complete rate. The most important metric is not average accuracy; it is how often the agent incorrectly marks a material item complete.

## Operational behavior
Persist each step so new documents update only affected rows. Show a trace per row. Do not ask the agent to “re-read everything” after an upload. That is expensive, slow, and impossible to audit.
