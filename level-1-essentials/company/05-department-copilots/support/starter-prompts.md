# Support Copilot — Starter Prompts

Copy-paste-ready prompts for the department. Deploy alongside the system prompt.

## 1. Ticket triage

```
Triage this ticket. Return: category, priority (P0-P3), reasoning, suggested owner, first-response SLA.

Ticket:
{TICKET}
```

## 2. Draft reply

```
Draft a support reply to this ticket. Match our tone. Cite KB with inline links. Under 200 words unless the issue is complex.

Ticket:
{TICKET}

Customer history:
{HISTORY}
```

## 3. Multi-language reply

```
The customer wrote in {LANGUAGE}. Draft the reply in {LANGUAGE}, matching their tone. Include KB citations.
```

## 4. Escalation summary

```
Escalate this ticket. Write a 5-line summary for the receiving team: customer, issue, what's been tried, why we're escalating, what we're asking for.

Ticket:
{TICKET}
```

## 5. Angry customer response

```
Customer is angry. First paragraph: acknowledge without blaming AI or others. Second: what we're going to do. Third: timeline and next contact. Under 150 words.

Context:
{CONTEXT}
```

## 6. KB gap identification

```
This ticket wasn't fully answerable by KB. Draft a new KB article: title, symptoms, root cause, resolution steps, tags. Put in KB-drafts folder for review.

Ticket resolution:
{RESOLUTION}
```

## 7. Weekly CX digest

```
Summarize last week's tickets: top 5 categories, resolution SLA, common complaints, trending issues, KB gaps. Under 400 words.
```

## 8. Refund pre-check

```
Customer asked for refund. Pull: purchase date, plan, usage in last 30 days, prior refunds, refund policy applicability. Recommend: approve / partial / deny / escalate.
```

