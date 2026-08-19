# Email Reply Drafter

**Purpose:** Draft a reply to an email in my voice, matching the tone and length of the incoming message.

**When to use:** You've received an email and need a response drafted before you hit reply.

**Category:** Communication

**Model recommendation:** Claude Sonnet — best at matching voice and tone from examples.

---

## The prompt

```
Draft a reply to the email below.

Incoming email:
---
{EMAIL_BODY}
---

Context you should know: {CONTEXT}

Constraints:
- Match the length of the incoming email (±25%).
- Match the formality level of the sender.
- Do not open with "Thanks for your email" or "I appreciate you reaching out".
- End with a concrete next step, not "Let me know your thoughts".
- If a decision is needed from me before replying, list the missing info as bullets after the draft.

Return the draft in a code block, then a two-line note on what tone I picked and why.
```

## Variables

- `{EMAIL_BODY}` — the full incoming email
- `{CONTEXT}` — anything the model needs to know (relationship, prior thread, deadline)

## Example use case

Client asked: 'Can you push our lease signing to next Friday?'

## Expected output shape

Draft reply → two-line note explaining tone choice.
