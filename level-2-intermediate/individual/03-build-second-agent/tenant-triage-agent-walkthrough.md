# OTB Tenant Triage Agent: Real Build Walkthrough

## Input and output
Accept `{message_id, tenant_id, property_id, channel, body, attachments}`. Enrich server-side with unit, open work orders, recent conversation, lease status, and policies the tenant may see. Return `{intent, urgency, confidence, evidence, route, action_proposal, draft, hitl_reason}`. Valid intents include maintenance, emergency, payment, lease question, access, complaint, renewal, document request, and unknown. Do not let the model invent categories.

## Classify, then route
Run deterministic emergency terms first: fire, gas, carbon monoxide, flooding, no heat in cold conditions, threat, and lockout. The rule result can only raise urgency. Then use a low-cost structured classifier with examples from actual OTB traffic. Route `emergency` to the on-call workflow immediately and draft only the approved emergency instruction. Route maintenance to an existing-ticket lookup; create a proposed ticket when none exists. Route payment and lease questions to a human unless an approved answer template applies.

## Drafting contract
The drafter sees the classified intent, permitted policy snippets, and relevant records—not raw database access. It must use a short, property-safe tone, identify any requested next step, and avoid promises, diagnoses, legal advice, fees, or vendor commitments. For example, it may say “We’ve shared this with maintenance and will update you,” not “A plumber will arrive at 2 PM” unless a confirmed appointment record exists.

## HITL gates
Require approval for emergencies, habitability, fair housing, eviction, payment arrangements, rent changes, threats, refunds, lease interpretation, negative sentiment, attachments, low confidence (<0.85), and any proposed write. Staff approve from a view showing source message, classifications, policy, retrieved facts, and final draft. One click should be able to override both label and response.

## Eval and rollout
Build 200 labeled messages, deliberately oversampling emergencies and sensitive cases. Measure intent accuracy, emergency recall, escalation recall, unsafe-draft rate, and staff override rate. Launch in shadow mode, then auto-send only low-risk acknowledgement categories with a verified template. Monitor false negatives weekly; a single missed emergency is a severity-one incident, not a dashboard footnote.
