# Dataset Preparation

Training data is the product. Start with a written task schema, inclusion/exclusion rules, label guide, and quality bar. Remove secrets, unnecessary personal data, protected characteristics, and unauthorized tenant content. Keep provenance for every example: source, consent/legal basis, annotator, transformations, and version.

Deduplicate near-identical examples, balance common and rare risk cases, and split by source entity or time to prevent leakage. For lease work, do not place versions of the same template in both train and test. Include abstentions, escalation examples, malformed inputs, and adversarial messages—not only perfect completions.

Use double annotation and adjudication for high-impact labels. Validate JSON targets automatically. Version the dataset immutably and document known limitations. If labelers cannot agree on the desired answer, the model will not solve the ambiguity; fix the policy first.

## Operating standard
Make this practice operational, not aspirational. Assign one directly responsible owner and name the decision they can make without another meeting. Put the key measure, threshold, and review cadence in the owning team’s regular operating rhythm. A change to model, prompt, data scope, retrieval index, tool permission, or policy should be recorded with its expected impact and a rollback path. Preserve enough trace information to explain an individual bad outcome without exposing more tenant or deal data than necessary. Review a small sample of real runs with the people doing the work; dashboards reveal trends, but operators reveal missing context. When the rule is violated, capture the incident, contain impact, add an eval or control, and update this document if the standard itself was unclear. The point is repeatable judgment under real workload, not a one-time compliance exercise.
