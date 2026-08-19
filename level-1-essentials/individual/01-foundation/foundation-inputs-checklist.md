# Foundation Inputs Checklist

Collect these into one folder on your machine (call it `~/ai-inputs/`).

## Identity
- [ ] Full name, preferred name, pronouns
- [ ] Location and timezone
- [ ] Current role and company
- [ ] Government ID scan (for KYC on paid tiers)
- [ ] Payment method for subscriptions + API billing

## Professional background
- [ ] Resume (`.docx` and `.pdf`)
- [ ] LinkedIn profile export (`.pdf` or `.zip`)
- [ ] Bios: 50 words, 150 words, 400 words
- [ ] List of expertise areas (top 10)
- [ ] List of things you are NOT expert in but are learning

## Voice and style
- [ ] 5 writing samples across tones (formal email, Slack message, blog post, technical doc, casual note)
- [ ] Your top 10 banned words/phrases (e.g., "leverage", "synergy", "at the end of the day")
- [ ] Formatting preferences: bullets vs prose, header depth, table use, code fence style
- [ ] Length defaults for common outputs (email reply length, memo length, summary length)

## Work context
- [ ] Org chart or list of key people you interact with (name, role, one-line context)
- [ ] Active projects (5–10), each with a one-line description and current status
- [ ] Quarterly goals
- [ ] Weekly rhythms (standups, reviews, planning cycles)

## Prompt history
- [ ] 10–20 real past prompts you've used, with the ideal answer you wish you'd gotten
- [ ] 5 prompts that produced bad output — save the bad output too (these become your eval set later)

## Personal glossary
- [ ] Names and one-line context for your people, teams, clients, vendors
- [ ] Project codenames and their real meanings
- [ ] Acronyms you use daily (industry-specific)

## Privacy line
- [ ] List of data types you'll never paste into a consumer model
  - Suggested: SSN, medical records, client PII, unreleased IP, legal-privileged, source code with secrets, credentials
- [ ] List of tools cleared for each data class (fill in during step 05)

## Goals
- [ ] 1-year goal (one sentence)
- [ ] 90-day goal (one sentence)
- [ ] This week's top 3 priorities (updated weekly)

---

## Where these files feed into the kit

| Input | Feeds into |
|---|---|
| Bios + expertise | `03-system-prompts/master-system-prompt.md` |
| Writing samples + banned words | `03-system-prompts/personal-style-guide.md` |
| Projects + goals + glossary | `03-system-prompts/about-me-block.md` and model memories (`06-memory-hygiene/`) |
| Past prompts | `04-prompt-library/` and eval templates |
| Privacy line | `05-model-routing/` (constrains which model handles which data class) |
