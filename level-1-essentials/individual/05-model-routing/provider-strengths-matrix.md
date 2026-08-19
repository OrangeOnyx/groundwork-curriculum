# Provider Strengths Matrix

The deep version. Read once, refer back quarterly.

## OpenAI (ChatGPT + API)

**Signature strengths**
- Widest ecosystem: Custom GPTs, marketplace, integrations
- Best multimodal breadth: image gen (DALL·E / Sora Images), video (Sora), voice (advanced voice mode), Whisper
- Structured output: JSON mode is the most reliable
- o-series (o1, o3, o4, o5-preview) for reasoning-heavy tasks
- Sora for video generation
- Massive third-party integration surface

**Signature weaknesses**
- Less nuanced than Claude for long, subtle prose
- Custom GPT memory is opaque compared to Claude Projects
- Rate limits on peak models can bite

**Best for**
- Multimodal work (image + text)
- Custom GPTs shared with others
- Batch structured extraction (JSON mode)
- Voice interactions
- When you need "just works" across every modality

## Anthropic Claude

**Signature strengths**
- Best long-form reasoning and prose
- Longest sustained coherence over 100k+ token inputs
- Artifacts (inline runnable code / documents)
- Projects (persistent knowledge + custom instructions)
- Claude Code (best agentic coding tool)
- Skills (reusable capability packages)
- Extended thinking mode surfaces reasoning

**Signature weaknesses**
- No native image generation (as of Aug 2026)
- Smaller integration ecosystem than OpenAI
- Fewer built-in tools

**Best for**
- Long documents (contracts, reports, research)
- Complex coding (via Claude Code)
- Writing that needs voice preservation
- Anything requiring subtle judgment
- Skills-based workflows

## Google Gemini

**Signature strengths**
- Longest context (2M tokens on Pro tiers)
- Native Google Workspace integration (Docs, Sheets, Gmail, Meet)
- Deep Research mode
- Veo 3 for video
- Multimodal — best at video *input*
- Free tier is generous

**Signature weaknesses**
- Product surface changes often (feature churn)
- Consumer UX inconsistent
- Voice mode less polished than OpenAI's

**Best for**
- Workspace-native workflows (Google users)
- Very long context needs (2M tokens)
- Video understanding (feed a video, ask questions)
- Research via Deep Research

## Perplexity

**Signature strengths**
- Search-grounded by default — every answer cites sources
- Real-time facts
- Comet browser + Computer (this product) — agentic web workflows
- Spaces (persistent contexts with connectors)
- Deep Research
- API returns citations natively

**Signature weaknesses**
- Less "raw" LLM power — it's a search-tuned system
- Long-doc reasoning is not its strength
- Some models better for pure generation tasks

**Best for**
- Any question about current events, prices, people
- Research briefs with citations
- Agent workflows requiring web browsing
- Fact-checking

## Microsoft Copilot

**Signature strengths**
- Native in Word, Excel, Outlook, Teams, Windows
- Best-in-class for Office-native workflows
- SharePoint / OneDrive grounding
- Enterprise controls and compliance

**Signature weaknesses**
- Feels bolted-on outside Office
- Less flexible for creative or open-ended work
- Locked to Microsoft's model choices

**Best for**
- Excel formulas, PowerPoint decks, Word docs, Outlook triage
- Enterprises already on M365
- Compliance-sensitive environments

## xAI Grok

**Signature strengths**
- Real-time X (Twitter) data
- More permissive on edgy topics
- Aurora image gen without heavy filters

**Signature weaknesses**
- Smaller ecosystem
- Fewer integrations
- Less careful reasoning than Claude/GPT

**Best for**
- Real-time X monitoring
- Uncensored image gen (with judgment)
- Contrarian second opinion

## Groq (inference provider)

**Signature strengths**
- Fastest inference on the market
- Open-weight models (LLaMA, Mixtral, Qwen)
- Cheap
- Great free tier

**Signature weaknesses**
- Only serves open models — no Claude, GPT, Gemini
- Model catalog rotates

**Best for**
- Batch processing where speed matters
- Cost-sensitive workloads
- When latency is critical (real-time apps)

## OpenRouter

**Signature strengths**
- One API key → 300+ models across all providers
- Easy A/B testing
- Automatic fallback across providers
- Great for experimentation

**Signature weaknesses**
- Adds a small margin over provider prices
- Rate limits inherited from underlying provider

**Best for**
- Experimentation
- Multi-model apps
- Fallback resilience

## Local models (via Ollama, LM Studio, MLX)

**Signature strengths**
- Zero data leakage
- No per-token cost
- Works offline
- Available: Llama 3.x, Qwen 3, Mistral, DeepSeek, Phi

**Signature weaknesses**
- Much weaker than frontier models
- Requires decent hardware (M-series Mac or good GPU)
- No multimodal parity

**Best for**
- Highly sensitive data
- Offline scenarios
- Learning how models work under the hood
