# Privacy Line Worksheet

Answer these five questions before you configure a single model.

## 1. What data types do you touch regularly?

Check all that apply:
- [ ] Personal PII (yours, family's)
- [ ] Client PII (names, contact, financial, health)
- [ ] Payment data (card numbers, bank accounts)
- [ ] Medical / health records
- [ ] Legal-privileged material (attorney-client communications)
- [ ] Employer trade secrets or unreleased IP
- [ ] Source code with API keys, database URLs, or private business logic
- [ ] Personal financial data (bank statements, tax returns)
- [ ] Real estate confidential (deal terms, tenant financials) — relevant for Adam
- [ ] Password/credential material
- [ ] Other: _________________

## 2. For each checked item, which tool tier is it cleared for?

| Data class | Consumer AI (ChatGPT free/Plus, Claude free/Pro) | Paid API with zero-retention | Local model only | Never AI |
|---|---|---|---|---|
| Public / already-shipped work | ✅ | ✅ | ✅ | — |
| Personal notes, drafts | ✅ | ✅ | ✅ | — |
| Client names only (no PII) | ⚠️ redact | ✅ | ✅ | — |
| Client PII | ❌ | ✅ (with DPA) | ✅ | consider |
| Payment / SSN | ❌ | ❌ | ⚠️ | ✅ |
| Legal-privileged | ❌ | ❌ | ✅ | ✅ |
| Source code with secrets | ❌ | ⚠️ scrub keys | ✅ | consider |
| Passwords | ❌ | ❌ | ❌ | ✅ |

Customize this table for your own risk tolerance.

## 3. What's your redaction workflow?

Before pasting anything sensitive:
1. Search-and-replace names → `[CLIENT_A]`, `[PROPERTY_1]`
2. Search-and-replace addresses → `[ADDRESS]`
3. Search-and-replace amounts if they identify a party → `[AMOUNT]`
4. Remove headers/footers, email routing, signature blocks
5. Keep a "redacted → real" mapping in a local, encrypted note

## 4. Which providers have you confirmed no-training settings on?

- [ ] OpenAI — Settings → Data Controls → "Improve the model for everyone" **off**
- [ ] Anthropic Claude — On by default for consumer accounts; confirmed
- [ ] Perplexity — Settings → Privacy → "AI Data Retention" reviewed
- [ ] Google Gemini — Activity → Gemini Apps Activity **off** if desired
- [ ] Microsoft Copilot — Enterprise tier only for sensitive data
- [ ] Grok — Settings → Data sharing **off**

## 5. What's your one-sentence privacy rule?

Write it here. Example: "Never paste anything I couldn't Slack to a coworker outside my company without a DPA."

Yours: __________________________________
