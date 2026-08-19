# What to Tell Each Model

Use this script once for each provider that supports memory. Copy the block, paste it as a message with the phrase "Please remember the following about me:"

## The universal memory block

```
Please remember the following about me:

Identity:
- My name is [NAME]. I go by [PREFERRED].
- Based in [CITY], [TIMEZONE].
- I work as [ROLE] at [COMPANY / SOLO].

Projects (active):
- [PROJECT 1] — [one line]
- [PROJECT 2] — [one line]
- [PROJECT 3] — [one line]

People I mention often:
- [NAME] — [role, relationship]
- [NAME] — [role, relationship]

Voice preferences:
- Direct over diplomatic.
- Match my length.
- No AI tells (delve, certainly, in the ever-evolving landscape).
- Give recommendations, not option menus.
- Disagree plainly when I'm wrong.

Formatting defaults:
- Prose over bullets when content flows.
- H2 headers in anything over 300 words.
- No emojis unless I use them first.
- Tables only for comparisons.

Constraints:
- Never process credentials, keys, SSNs.
- Warn if I paste secrets.

When I ask for a decision or recommendation, pick one and justify. Do not list five options with hedged pros and cons.
```

## Per-provider setup

### ChatGPT (Plus/Pro)
1. Settings → Personalization → Memory → toggle ON
2. Open a new chat. Paste the universal memory block prefixed with "Please remember the following about me:"
3. After it acknowledges, ask: "What do you know about me?" — verify accuracy.
4. Also fill Custom Instructions:
   - "What would you like ChatGPT to know about you?" — paste identity + projects
   - "How would you like ChatGPT to respond?" — paste voice + formatting + constraints

### Claude (Pro/Max)
1. Claude does not have global memory like ChatGPT. Instead, use Projects.
2. Create a Project called "Personal — Default"
3. In Custom Instructions, paste the entire universal memory block
4. Upload your `personal-style-guide.md` as a knowledge file
5. Use this project as your default chat home

### Perplexity
1. Settings → Preferences → AI Profile
2. Fill "Introduce yourself" — paste identity + projects
3. Fill "Your interests" — bullet your active projects and expertise areas
4. Enable web memory (opt-in per your privacy line)
5. For projects that need persistent context, create Spaces per project

### Gemini Advanced
1. Settings → Personal context → toggle ON
2. Extensions → connect Google Workspace (Drive, Gmail, Docs, Calendar)
3. Create a Gem called "Adam Default" with the universal memory block as its instructions
4. Set that Gem as your default in Gemini app

### Microsoft Copilot
1. Copilot uses Microsoft Graph for context — no separate memory input required
2. Connect Outlook, OneDrive, SharePoint if using enterprise
3. For consumer Copilot, use the "Personalize" settings

### Grok
1. Personalize → Custom Instructions → paste the compact about-me block (see `03-system-prompts/about-me-block.md`)

## Test it

After setup, in each model, ask:

> "Given what you know about me, draft a 3-sentence Slack message declining a lunch invitation from a client."

If the tone and length feel right in all four models, memory is calibrated.
