# Memory Audit Template

Run this monthly. 10 minutes.

## Step 1 — Enumerate what each model remembers

In each model, ask:
> "List everything you remember about me, verbatim."

Copy the output into this file, one section per model.

### ChatGPT memory dump — [DATE]

```
[paste]
```

### Claude Project instructions — [DATE]

```
[paste]
```

### Perplexity AI profile — [DATE]

```
[paste]
```

### Gemini personal context — [DATE]

```
[paste]
```

## Step 2 — Score each memory item

For every stored fact, decide:
- ✅ Keep — still true and useful
- ✏️ Update — needs revision
- 🗑️ Delete — outdated, ephemeral, or shouldn't have been stored

## Step 3 — Common corruption patterns to look for

- [ ] Ephemeral task remembered as permanent ("The user is preparing for their meeting on Tuesday")
- [ ] Duplicate memories with slight variations
- [ ] Sensitive info that leaked in (client names, financial details, health)
- [ ] Preferences that are no longer accurate
- [ ] Projects that ended still listed as active
- [ ] People no longer in your life still in memory
- [ ] Contradictions between what different models remember

## Step 4 — Prune and update

- ChatGPT: Settings → Personalization → Manage Memories → delete stale entries
- Claude: edit the Project's Custom Instructions directly
- Perplexity: Settings → AI Profile → rewrite
- Gemini: Settings → Personal context → prune

## Step 5 — Log the audit

Record in this file:

| Date | Model | Entries reviewed | Deleted | Updated | Notes |
|---|---|---|---|---|---|
| | | | | | |

## Step 6 — Re-run the calibration test

Same test as initial setup:
> "Given what you know about me, draft a 3-sentence Slack message declining a lunch invitation from a client."

If any model's output drifted, memory needs more pruning.
