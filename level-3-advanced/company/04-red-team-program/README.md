# Red-Team Program

A red team turns assumptions into evidence. Its mandate is to find how a real attacker, careless user, or confusing document can cause unsafe behavior before customers do.

At company scale, AI is not a side project owned by the person who writes prompts. It is a production capability spanning product, domain operations, platform engineering, security, privacy, finance, and support. Belle Realty should make the operating decision visible: what is authorized, who is accountable, what evidence is required, and how the system is stopped when reality disagrees.

## Operating model

Name one directly responsible individual for the outcome and one executive sponsor for the risk. Define the decision rights for data access, model changes, vendor changes, policy exceptions, and emergency shutdowns. Maintain a registry of deployed features with purpose, customer cohorts, model and retrieval versions, data sources, tool permissions, SLOs, evaluation evidence, and review date.

## Control cadence

Review leading indicators weekly: reliability, safety interventions, access denials, cost, drift, user corrections, and unresolved incidents. Review material changes before launch and at a fixed expiry date after launch. The agenda should end in decisions, owners, and dates—not a dashboard tour.

## Evidence standard

Require representative offline evaluation, staged release evidence, traceable telemetry, and a documented rollback path. Segment results by geography, property type, tenant context, language, and risk level. A global pass rate is insufficient for a system that operates differently for one high-risk cohort.

## Practical scenario

Before allowing an assistant to send maintenance messages across a portfolio, prove authorization boundaries, approved language, escalation behavior, provider fallback, outage handling, audit retention, and per-property cost limits. Have operations rehearse the manual path and the stop path.

## Decision test

The program is mature only when a new engineer can determine what is running, why it is permitted, how it is measured, and who can change or stop it without relying on tribal knowledge.
