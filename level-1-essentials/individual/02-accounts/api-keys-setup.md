# API Keys Setup

## Universal rules

1. **One key per project.** Never share a key across projects; you lose cost attribution.
2. **Set a hard spending cap** on every key at the provider dashboard.
3. **Set a soft email alert** at 50% and 80% of cap.
4. **Store in a password manager**, not in Notes.app or a text file.
5. **Never commit** a key to git. Use `.env.local` (git-ignored) or a secret manager.
6. **Rotate every 90 days**, or immediately after a suspected leak.
7. **Prefer service-specific project keys** over root keys wherever the provider supports them.

## Per-provider setup

### OpenAI
1. platform.openai.com → Settings → Billing → add card, set hard limit ($20 to start)
2. API Keys → Create new secret key → name it after the project
3. Enable usage tracking → set alert at 50% and 80%
4. Turn on "Usage limits" per project if you use multiple projects

### Anthropic
1. console.anthropic.com → Plans & Billing → add card, set monthly budget
2. API Keys → Create key → tag it
3. Enable Workspace-scoped keys if you want isolation between projects
4. Note: Anthropic bills per model; Opus is expensive, Sonnet is the workhorse, Haiku is cheap

### Google AI Studio
1. aistudio.google.com → Get API key → tied to a Google Cloud project
2. In Google Cloud Console → Billing → set budget alert
3. Enable Generative Language API on that project
4. Note: Gemini has a free tier — use it for experimentation

### Perplexity
1. perplexity.ai/settings/api → Generate key
2. Purchase credits (pay-as-you-go)
3. Note: sonar / sonar-pro are search-grounded (unique to Perplexity)

### Groq
1. console.groq.com → API Keys → Create
2. Free tier is generous; upgrade to pay-as-you-go for higher rate limits
3. Use for: fastest inference of open-weight models (LLaMA 3.x, Mixtral, Qwen)

### OpenRouter
1. openrouter.ai → Keys → Create
2. Add credits (one-time)
3. This becomes your "try any model" playground — one key routes to 300+ models
4. Great for experimentation and fallback

## `.env.local` template

```bash
# AI provider keys — never commit this file
OPENAI_API_KEY=sk-proj-...
ANTHROPIC_API_KEY=sk-ant-...
GOOGLE_API_KEY=AIza...
PERPLEXITY_API_KEY=pplx-...
GROQ_API_KEY=gsk_...
OPENROUTER_API_KEY=sk-or-v1-...

# Optional
COHERE_API_KEY=
TOGETHER_API_KEY=
FIREWORKS_API_KEY=
REPLICATE_API_TOKEN=
HUGGINGFACE_TOKEN=
```

Add `.env.local` to your global `.gitignore`:
```bash
echo ".env.local" >> ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global
```

## Spending sanity floor

Start with these caps and adjust up as you learn your consumption:

| Provider | Starting cap |
|---|---|
| OpenAI | $20/mo |
| Anthropic | $20/mo |
| Google | $10/mo |
| Perplexity | $10/mo |
| Groq | $10/mo |
| OpenRouter | $20/mo |

Total starter API budget: **$90/mo**. Most individuals never exceed this while learning.
