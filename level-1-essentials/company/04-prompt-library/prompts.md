# The 15 Company-Wide Prompts

## 01 — Company-voice email polisher

```
Polish this email to match our company voice.

Draft:
---
{DRAFT}
---

Rules:
- Preserve every fact and commitment exactly
- Apply brand voice (see attached brand style guide)
- Cut jargon (leverage, synergy, circle back, deep dive)
- Cut AI tells
- Under {LENGTH} words unless the content requires more
- Add appropriate disclaimer if triggered (see legal-disclaimer-library)

Return the polished email in a code block, then a 2-line note on what changed.
```

## 02 — Meeting notes → structured

```
Structure these meeting notes.

Raw notes:
---
{NOTES}
---

Return four sections in this exact order:

## Decisions
Bullet list. If none, write "No decisions."

## Action items
- Owner — action — due date

## Open questions
Bulleted questions raised but not resolved.

## Summary
3 sentences: what was discussed, what was decided, what happens next.

Do not include attendee list unless asked.
```

## 03 — Weekly team update

```
Write this week's team update for {TEAM}.

Inputs:
- Team's active projects and status: {STATUS}
- Wins this week: {WINS}
- Blockers: {BLOCKERS}
- Next week's priorities: {PRIORITIES}

Format:

**Headline:** one sentence.
**Shipped:** bulleted, max 5.
**In flight:** bulleted with % complete, max 5.
**Blockers:** bulleted or "None."
**Next week:** one sentence.

Under 200 words. No filler adjectives.
```

## 04 — Quarterly OKR draft

```
Draft OKRs for {TEAM} for {QUARTER}.

Team's mission: {MISSION}
Company priorities this quarter: {COMPANY_PRIORITIES}
Team's constraints: {CONSTRAINTS}

Format:

For each of 3 Objectives:

**O{N}:** Objective in aspirational language.
- KR{N}.1: measurable, time-bound, quantitative
- KR{N}.2: measurable, time-bound, quantitative
- KR{N}.3: measurable, time-bound, quantitative

Rules:
- Objectives are qualitative aspirations
- Key results are quantitative and measurable
- Aim for 3 objectives, 3 KRs each
- Every KR names a metric and a target value
- Notes on cross-team dependencies at the bottom
```

## 05 — Vendor evaluation

```
Evaluate this vendor.

Vendor: {VENDOR}
Purpose: {PURPOSE}
Alternatives considered: {ALTERNATIVES}

Format:

## Snapshot
Company, product, pricing model, deployment.

## Fit for our need
Bulleted — how well they meet our must-haves.

## Security posture
- Certifications
- Data residency
- DPA + zero-retention availability
- Sub-processors reviewed
- SOC 2 report available

## Total cost of ownership
- Year 1 estimate
- Year 3 estimate
- Hidden costs (integration, training, migration)

## Recommendation
Sign / Explore further / Reject — with reasoning.

## Alternatives comparison
Table across top options.
```

## 06 — Incident post-mortem

```
Draft an incident post-mortem.

Incident: {INCIDENT}
When: {START} to {END}
Impact: {IMPACT}

Format:

## Summary
Two sentences.

## Timeline
| Time (UTC) | Event | Owner |

## Root cause
Plain language + technical.

## Contributing factors
Bulleted.

## What went well
Bulleted.

## What we're changing
Numbered action items with owner and due date.

## Detection and response metrics
- Time to detect
- Time to mitigate
- Time to resolve

Blameless language throughout. Focus on systems, not individuals.
```

## 07 — Customer feedback synthesis

```
Synthesize this batch of customer feedback.

Feedback:
---
{FEEDBACK}
---

Format:

## Top themes
Ranked by frequency. For each: theme, count, 2 representative verbatim quotes, sentiment.

## Positive signals
Bulleted.

## Complaints
Bulleted by category.

## Feature requests
Bulleted, deduped, with count.

## Bug reports
Bulleted with severity guess.

## Recommendations
3 bullet actions ranked by impact.
```

## 08 — RFP response drafter

```
Draft a response to this RFP question.

Question: {QUESTION}
Context: {CUSTOMER_CONTEXT}

Constraints:
- Use only approved product claims
- Cite specific features by name
- Include one relevant approved customer example
- Formal tone
- Under {WORD_LIMIT} words
- Never fabricate certifications or capabilities

Return draft, then a "sources within our docs" list so a reviewer can verify.
```

## 09 — Job description drafter

```
Draft a job description for {ROLE}.

Team: {TEAM}
Reports to: {MANAGER_ROLE}
Level: {LEVEL}
Comp range: {RANGE}
Location: {LOCATION}
Key responsibilities: {RESPONSIBILITIES}
Must-have qualifications: {MUST_HAVE}
Nice-to-have: {NICE_TO_HAVE}

Format:

## About the team
One paragraph.

## What you'll do
Bulleted, action-oriented, max 8.

## What you need
Bulleted, must-haves clearly labeled.

## Nice to have
Bulleted, max 5.

## Comp and benefits
Comp range as stated, benefits summary, EEO statement.

Inclusive language throughout. No "rockstar", "ninja", "10x".
```

## 10 — Policy Q&A

```
Question about our policy: {QUESTION}

Ground your answer in these documents:
- Employee handbook
- Data classification matrix
- Acceptable use policy
- [Any relevant policy]

Format:

## Answer
Direct answer to the question.

## Where this comes from
Cite the specific policy section (name + heading).

## When in doubt
Who to contact for clarification.

If the answer isn't in the policies, say so and route to a human.
```

## 11 — Data classification checker

```
Classify this data.

Data description:
---
{DATA_DESCRIPTION}
---

Format:

## Classification
Public / Internal / Confidential / Restricted (per matrix)

## Reasoning
Why this class.

## Approved tools
Which tools this class may go into, per matrix.

## Prohibited tools
Where this class must NOT go.

## Handling notes
Any specific requirements (redaction, encryption, retention limits).
```

## 12 — External communication reviewer

```
Review this external communication before it's sent.

Draft:
---
{DRAFT}
---

Recipient: {RECIPIENT}
Context: {CONTEXT}

Check for:
- Unapproved product claims
- Forward-looking statements needing disclaimer
- Confidential information not intended for external release
- Regulatory language issues
- Tone appropriate for recipient
- Legal disclaimer needed?

Format:

## Verdict
Ship / Ship with edits / Do not send

## Issues found
Numbered.

## Suggested edits
Inline redlines.

## Disclaimer needed?
Which one, if any.
```

## 13 — Presentation outliner

```
Outline a presentation.

Topic: {TOPIC}
Audience: {AUDIENCE}
Duration: {MINUTES} minutes
Objective: what should the audience do or believe after this?

Format:

## Slide 1 — Title
Compelling title + subtitle.

## Slide 2 — Hook
The story or stat that grabs attention.

## Slides 3-N — Body
For each slide: title, key point, supporting evidence, visual suggestion.

## Slide (N+1) — Ask
The specific action or decision requested.

## Slide (N+2) — Appendix
What to keep in reserve for Q&A.

Rule: pace at ~2 min per body slide.
```

## 14 — Meeting agenda + pre-read

```
Design a meeting.

Meeting: {MEETING_NAME}
Attendees: {ATTENDEES}
Duration: {MINUTES} minutes
Goal: {GOAL} — one specific outcome we want by the end
Context: {CONTEXT}

Format:

## Objective
One sentence.

## Pre-read (send 24h before)
One-page brief covering the essential context. Bullet list.

## Agenda (timed)
| Time | Topic | Owner | Format (discuss/decide/inform) |

## Roles
- Facilitator
- Note-taker
- Decision owner

## Expected outputs
- Decisions
- Actions
- Follow-ups

Rule: default to shorter meetings. If the goal doesn't fit in the time, halve the scope, not the time.
```

## 15 — Escalation summary

```
Summarize this escalation for the receiving team.

Ticket / incident / issue:
---
{SUBJECT}
---

Format:

## What's happening
One sentence.

## Who's affected
Named parties.

## Impact
Concrete: revenue, users, deadline, reputation.

## What we've tried
Bulleted, timeboxed.

## What we're asking for
Specific ask: expertise, decision, resource, approval.

## Deadline / urgency
When we need response by, and why.

Under 200 words. No blame language.
```
