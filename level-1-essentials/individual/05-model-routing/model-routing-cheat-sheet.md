# Model Routing Cheat Sheet

Print this. Tape it above your monitor.

## Route by task

| Task | First choice | Second choice | Notes |
|---|---|---|---|
| Long-doc reasoning (contracts, deep analysis) | Claude Opus | Gemini 2.x Pro | Claude wins at nuance; Gemini wins on context length |
| Coding — small changes | Claude Sonnet in Cursor | GPT-5 in Cursor | Sonnet is the daily driver |
| Coding — large refactor | Claude Code (agent) | Cursor Composer | Agent mode for multi-file |
| Web research with citations | Perplexity Sonar/Pro | Perplexity Deep Research | Search-grounded by default |
| Real-time facts (news, prices, sports) | Perplexity | Grok (X data) | Never trust a non-grounded model on live facts |
| Google Workspace tasks | Gemini in Workspace | Copilot 365 (Microsoft) | Native integration wins |
| Microsoft Office tasks | Copilot 365 | Gemini in Workspace | Native integration wins |
| Image generation — realistic | GPT (Sora/Images), Midjourney | Ideogram | Midjourney for hero art |
| Image generation — with text in image | Ideogram | GPT Images | Ideogram nails typography |
| Video generation | Sora, Veo 3 | Higgsfield, Runway | Model-specific look; test both |
| Voice / TTS | ElevenLabs | OpenAI TTS | ElevenLabs for characters |
| Transcription | Whisper (OpenAI API) | AssemblyAI, Otter | Whisper is baseline; Otter for meetings |
| Structured extraction (JSON) | GPT-5 JSON mode | Claude with structured output | Both strong |
| Quick chat / drafting | ChatGPT (any) | Claude Sonnet | Whichever tab is open |
| Cheap batch inference | Groq (LLaMA, Mixtral) | OpenRouter with cheap models | Groq for speed |
| Uncensored generation | Grok, local models | — | For legit adult / edgy use cases |
| Agent orchestration | Perplexity Computer, Claude Code | Custom (LangGraph) | This product; Claude Code for local |
| Deep research (multi-source) | Perplexity Deep Research | Gemini Deep Research | Both are strong; different styles |
| Long context (>200k tokens) | Gemini 2.x Pro (2M), Claude (1M) | GPT-5 (400k) | Gemini has the longest |
| Reasoning-heavy math/logic | o-series (OpenAI), Claude thinking | DeepSeek | Turn on extended thinking |
| Multimodal (image + text in) | GPT-5, Gemini | Claude | Gemini strong on video input |

## Route by data class

| Data class | Consumer tools OK? | API OK? | Notes |
|---|---|---|---|
| Public / already-shipped | ✅ any | ✅ any | Anything goes |
| Personal notes / drafts | ✅ any | ✅ any | |
| Internal work docs (redacted) | ⚠️ enterprise only | ✅ with DPA | Not free tiers |
| Client PII | ❌ | ✅ enterprise API + DPA | Zero-retention required |
| Legal-privileged | ❌ | ❌ except with counsel | Consider local models |
| Passwords / keys / SSN | ❌ | ❌ | Never |

## Fallback flow

If your first-choice model is rate-limited, down, or the output is bad:

1. Try the second-choice model with the same prompt
2. If both fail, simplify the prompt (fewer variables, smaller scope)
3. If it's a research question, try Perplexity for the base facts, then hand to Claude for synthesis
4. If it's a code question, add the exact error message to the prompt and try Claude Opus

## Cost mental model

Approximate cost per million tokens output (as of August 2026 — verify current pricing):

| Tier | Models | Cost / MTok output |
|---|---|---|
| Frontier | Claude Opus, GPT-5, Gemini 2.x Pro | $30–$75 |
| Workhorse | Claude Sonnet, GPT-5 mini, Gemini Flash | $3–$15 |
| Cheap | Claude Haiku, GPT nano, Gemini Nano | $0.5–$2 |
| Open-weight on Groq | LLaMA, Mixtral, Qwen | $0.2–$1 |

Rule: Start with workhorse. Escalate to frontier only when workhorse can't do it.
