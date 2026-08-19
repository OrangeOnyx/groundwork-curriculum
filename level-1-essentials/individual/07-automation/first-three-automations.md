# The First Three Automations

Build in this order. Each takes 30–60 minutes.

## Automation 1 — Daily brief

**What it does:** Every morning at 7am, you get a summary of:
- Calendar for the day
- Overnight email requiring reply
- Overnight Slack DMs / mentions
- Top 3 priorities from your goals doc
- Weather + one thing to know from the news

**Build it with:**
- **Easiest:** Perplexity Computer → Schedule a cron task at 7am America/Chicago, connect Gmail + Google Calendar + Slack
- **Alternative:** Claude Code with a scheduled shell script
- **Alternative:** Zapier / Make with a scheduled trigger + email step

**Prompt for the scheduled task:**
```
Every weekday at 7am America/Chicago:

1. Fetch today's calendar events (Google Calendar)
2. Fetch overnight unread emails (Gmail, marked important)
3. Fetch Slack DMs and mentions since 6pm yesterday
4. Read my goals doc at /path/to/goals.md
5. Summarize:

## Today
- Calendar: bullet each event with time + location + prep note
- Priorities (from goals): top 3
- Weather: 1 line
- News: 1 headline that matters

## Overnight
- Emails needing reply (max 5): sender + one-line + urgency
- Slack: mentions + DMs (max 10)

Email the summary to me. Total under 250 words.
```

## Automation 2 — End-of-week review

**What it does:** Every Friday at 4pm, generates your weekly review using the prompt from `04-prompt-library/19-weekly-review.md`, pulling from Calendar, Slack, GitHub, and your notes.

**Build it with:** Perplexity Computer scheduled task

**Prompt:**
```
Every Friday at 4pm America/Chicago:

1. Pull my calendar events from Mon–Fri this week
2. Pull my commits and PRs from GitHub this week
3. Pull the Slack messages I sent this week (mine only)
4. Pull notes I've added this week to [notes location]

Then run the weekly-review prompt from my prompt library:
[paste the prompt from 04-prompt-library/19-weekly-review.md]

Send the output to me by email and Slack DM.
```

## Automation 3 — Inbox triage

**What it does:** Every 2 hours during working hours, scans unread email and:
- Labels: `Reply-today`, `Reply-this-week`, `FYI-only`, `Newsletter`, `Trash`
- Drafts replies for the `Reply-today` items

**Build it with:** Zapier + OpenAI, or Perplexity Computer with Gmail connector

**Rules to give it:**
```
For each unread email:

1. Classify:
   - Reply-today: needs response within 24h, from a real person, not a bulk sender
   - Reply-this-week: from a real person, not urgent
   - FYI-only: informational, no action needed
   - Newsletter: bulk sender, marketing, updates
   - Trash: spam-like, expired promo, notifications with no info value

2. For Reply-today items, draft a reply in my voice using the email-reply-drafter prompt from my library.

3. Never send. Only draft. Save drafts to Gmail's drafts folder.

4. Slack DM me a summary: "3 replies ready to review, 5 FYIs, 12 newsletters archived."
```

## Progression: what to automate next

Once these three are running smoothly, look for the next three:

- Meeting-notes-to-CRM (Fireflies → Notion / HubSpot with AI extraction)
- Weekly research digest on a topic you follow
- Auto-tag new expenses (Plaid → sheet with AI category)
- Voice memo → structured notes (Whisper + Claude → notes app)
- Overnight news brief on your industry
- Auto-file receipts / invoices from email

## Anti-patterns

Do NOT automate these on day one:
- Anything that sends messages to other people (too risky)
- Financial transactions
- Anything that modifies external systems without a review step
- Anything with a false-positive cost you can't tolerate

Rule: Automations should default to *drafting* and *summarizing*, not *sending* or *acting*.
