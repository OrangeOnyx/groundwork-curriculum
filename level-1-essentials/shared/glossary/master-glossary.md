# AI Master Glossary

200+ terms, organized in 11 clusters. Read one cluster per day for two weeks and you'll be fluent.

Each term has: definition, why it matters, and where it appears.

---

## Cluster 1 — Model Mechanics

**Token** — The unit an LLM consumes. Roughly ¾ of an English word. Prices, context windows, and rate limits are all counted in tokens. *Why it matters: cost and length constraints are token-denominated.*

**Context window** — The maximum number of tokens a model can attend to in one call (input + output). Gemini 2.x Pro: 2M. Claude: 1M. GPT-5: 400k. *Why it matters: longer window = more knowledge in-context = less RAG needed.*

**System message / system prompt** — Standing instructions given before the conversation starts. Higher priority than user messages. *Why it matters: this is your leverage point.*

**User message** — What the user says. Second priority.

**Assistant message** — What the model says. Referenced back in multi-turn conversations.

**Tool message / function result** — The output of a tool call, sent back to the model.

**Temperature** — Randomness knob (0–2). 0 = deterministic. 1 = default. 2 = wild. *Use 0 for extraction, 0.7 for writing, 1.0+ for brainstorming.*

**Top-p (nucleus sampling)** — Alternative to temperature. Selects from the smallest set of tokens whose cumulative probability exceeds p. Usually set to 0.9 or 1.0.

**Top-k** — Select from the top k most likely tokens. Rarely tuned directly.

**Frequency penalty / presence penalty** — Discourage repetition. Frequency penalizes based on count; presence based on whether the token has appeared at all.

**Max tokens** — Cap on output length. Different from context window.

**Streaming** — Model returns tokens as they're generated, rather than waiting for the full response. Reduces perceived latency.

**Stop sequences** — Strings that cause the model to halt generation. Useful for structured output.

**Seed** — For deterministic sampling. Same seed + same input + same params = same output. Not guaranteed across model versions.

**Log probs / logprobs** — Probability the model assigned to each generated token. Used for confidence estimation and evals.

**Function calling / tool use** — Model outputs a structured request to call an external function, then receives the result and continues. The foundation of agents.

**JSON mode / structured output** — Constraint that forces the model to return valid JSON matching a schema. Reliable extraction.

**Grammar-constrained decoding** — Force output to match a formal grammar (JSON schema, regex, custom BNF). Even stricter than JSON mode.

**Token pricing** — Cost per million input tokens vs cost per million output tokens (output is usually 3–5× more expensive).

**Rate limit** — Per-minute or per-day cap on requests or tokens. Enforced per API key or organization.

---

## Cluster 2 — Reasoning

**Chain-of-Thought (CoT)** — Prompting technique: "think step by step" before answering. Improves accuracy on multi-step problems.

**Zero-shot** — Prompting with no examples. "Translate this to French."

**Few-shot** — Prompting with 2–10 examples. Improves format compliance and task performance.

**In-context learning (ICL)** — The ability of LLMs to learn a task from examples within the prompt, without weight updates.

**ReAct** — "Reason + Act." Pattern where model alternates reasoning steps and tool calls.

**Tree-of-Thought (ToT)** — Explores multiple reasoning branches before committing to an answer.

**Self-consistency** — Sample multiple reasoning paths and pick the majority answer.

**Reflection / self-critique** — Model reviews its own output and revises. Also called "critic-actor" loop.

**Extended thinking / thinking mode** — Native product feature (Claude, o-series) where the model spends "reasoning tokens" before responding. Higher accuracy, higher cost.

**Reasoning tokens** — Tokens the model uses internally for thinking that aren't shown to the user (or shown selectively). You pay for them.

**Test-time compute** — Additional compute spent at inference to improve output quality (e.g., extended thinking, self-consistency, tree-of-thought). The 2024–2026 scaling story.

**Scratchpad** — Explicit reasoning space in the prompt where the model writes intermediate work.

**Plan-and-solve** — Prompt pattern: first produce a plan, then execute each step.

**Persona / role prompting** — Assigning the model a role ("You are a senior editor..."). Modest effect; do not overrate.

**Chain-of-Verification (CoVe)** — Model drafts an answer, generates verification questions, answers them, and revises. Reduces hallucinations.

---

## Cluster 3 — Retrieval (RAG)

**RAG — Retrieval-Augmented Generation** — Pattern where you retrieve relevant documents from a knowledge base and inject them into the prompt before generation.

**Embedding** — A vector (list of numbers, usually 768–3072 dimensions) that represents the meaning of a text. Similar texts have similar embeddings.

**Embedding model** — A model that produces embeddings. Popular: OpenAI text-embedding-3-large, Voyage AI, Cohere embed, BGE, E5.

**Vector database / vector store** — A DB optimized for storing embeddings and finding nearest neighbors. Pinecone, Weaviate, Qdrant, Milvus, pgvector.

**Chunking** — Splitting documents into pieces before embedding. Common strategies: fixed-size (500 tokens), sentence, paragraph, semantic, sliding-window.

**Chunk overlap** — Overlap between adjacent chunks (usually 10–20%) to preserve context that spans boundaries.

**Semantic search** — Finding results by meaning (embedding similarity) rather than keyword match.

**Lexical search** — Keyword-based search (BM25, TF-IDF).

**Hybrid search** — Combines semantic and lexical. Usually reranked.

**Reranker / cross-encoder** — A second-pass model that re-scores retrieved chunks by their relevance to the query. Popular: Cohere Rerank, BGE reranker.

**k / top-k retrieval** — Number of chunks to fetch. Usually 5–20.

**Retrieval query** — The version of the user's question used for the DB search. Often rewritten for better retrieval.

**Query rewriting / query expansion** — Transforming the user's question into a better retrieval query. HyDE is one method.

**HyDE — Hypothetical Document Embeddings** — Generate a fake ideal answer, embed it, use that for retrieval.

**Metadata filtering** — Restrict retrieval to chunks with matching metadata (e.g., permissions, date range, doc type).

**Ground truth** — The correct answer, known independently. Used to score retrieval and generation.

**Retrieval@k** — Metric: does the correct chunk appear in the top k results?

**Faithfulness / groundedness** — Does the generated answer only make claims supported by the retrieved context?

**Context stuffing** — Just pasting a huge document into the prompt (no vector search). Feasible with 1M+ context windows for smaller corpora.

**Agentic RAG** — Agent decides when and what to retrieve, may issue multiple queries, may use tools beyond vector search.

**GraphRAG** — Retrieval over a knowledge graph rather than vector chunks. Better for entity-heavy corpora.

---

## Cluster 4 — Agents

**Agent** — A model that operates in a loop: observe → decide → act (tool call) → observe → ... until the goal is met.

**Tool** — A function an agent can call. Formalized by JSON schemas the model can understand.

**Tool call** — A structured request from the model to invoke a tool with arguments.

**Function calling** — The lower-level API primitive. Some providers use this term instead of "tool."

**Agent loop / control loop** — The outer software loop that dispatches tool calls and feeds results back.

**Subagent** — An agent spawned by another agent to handle a bounded sub-task with its own context.

**Orchestrator** — The parent agent that plans and dispatches subagents.

**Planner** — A component (or a model call) that produces a step-by-step plan before execution.

**Executor** — The component that actually runs the plan's steps.

**MCP — Model Context Protocol** — Anthropic-originated open standard for connecting AI models to tools and data sources. Now widely adopted.

**MCP server** — A process that exposes tools/resources over the MCP protocol.

**MCP client** — An AI model / product that consumes MCP servers.

**Skill** — A reusable capability package (a set of instructions and tools) that a model can load on demand. Claude's "Skills" and Perplexity's skill system are examples.

**Memory (agent memory)** — Persistent state carried across sessions. Types: short-term (conversation), long-term (facts), episodic (event history).

**HITL — Human in the Loop** — Design pattern where humans approve or correct agent decisions at defined checkpoints.

**Guardrails** — Rules that constrain agent behavior (e.g., "never send emails," "always ask before making purchases").

**ReAct agent** — Agent following the ReAct pattern.

**AutoGPT / BabyAGI** — Early (2023) open-source agent frameworks. Historical, but the terms still come up.

**Agentic** — Adjective for "acting like an agent" — doing multi-step work autonomously.

**Autonomous mode / auto mode** — Product terminology for agents that operate without step-by-step human approval.

**Long-horizon task** — A task requiring many steps, tool calls, or hours of runtime.

**Terminal state / done condition** — When the agent decides it's finished.

**Fan-out / fan-in** — Pattern: spawn N parallel subagents (fan out), collect results (fan in).

---

## Cluster 5 — Training

**Pretraining** — Training a model on massive text (trillions of tokens) to learn language. Base model.

**Base model / foundation model** — The pretrained model before instruction tuning.

**Fine-tuning** — Updating a pretrained model's weights on a smaller, task-specific dataset.

**Instruction tuning** — Fine-tuning with (instruction, response) pairs to make the model follow instructions.

**RLHF — Reinforcement Learning from Human Feedback** — Training method where humans rank outputs and a reward model is trained to score outputs, then the LLM is optimized against that reward.

**DPO — Direct Preference Optimization** — Alternative to RLHF that skips the reward model. Simpler and often competitive.

**Constitutional AI (CAI)** — Anthropic's alignment method: use principles ("a constitution") to have the model critique and revise its own outputs.

**RLAIF — RL from AI Feedback** — Like RLHF but the ranker is another AI, not humans.

**Distillation** — Training a smaller model to mimic a larger one. Produces cheaper, faster models with much of the capability.

**LoRA — Low-Rank Adaptation** — Efficient fine-tuning method: add small trainable matrices to a frozen base model. Small artifacts (~100MB) instead of full model weights.

**QLoRA** — LoRA with quantized base model. Even cheaper.

**Quantization** — Reducing precision of model weights (e.g., FP16 → INT8 → INT4) to shrink size and speed inference. Small accuracy cost.

**Weights** — The parameters of a neural network. "Open-weight" model = weights are downloadable.

**Open-weight model** — Weights released publicly (LLaMA, Mistral, Qwen, DeepSeek). Not necessarily open-source (data + training code not always released).

**Open-source model** — Everything released — weights, training data, code.

**Closed model** — Only accessible via API (GPT-5, Claude, Gemini).

**Alignment** — Making a model behave in accordance with human values / intentions.

**Refusal** — When a model declines a request. Alignment feature; sometimes over-tuned.

**Jailbreak** — A prompt that bypasses safety training.

**Prompt injection** — Adversarial input that hijacks the model's behavior (e.g., a document that says "ignore previous instructions and...").

**Model weights license** — The legal terms under which weights can be used (LLaMA license, Apache 2.0, MIT, custom). Important for commercial use.

**Training compute** — FLOPs used to train the model. Correlated (but not perfectly) with capability.

**Scaling laws** — Empirical laws relating training compute, data, and parameter count to loss.

**Emergent capabilities** — Skills that appear only above a certain model scale (contested empirically but useful shorthand).

---

## Cluster 6 — Multimodal

**Multimodal model** — Handles more than one modality (text + image + audio + video).

**Vision model / VLM** — Vision-Language Model. Handles text + image.

**Audio model** — Handles speech (ASR/TTS) or general audio.

**ASR — Automatic Speech Recognition** — Speech-to-text. Whisper is the reference model.

**TTS — Text-to-Speech** — ElevenLabs, OpenAI TTS, Google WaveNet.

**Voice cloning** — Generating speech in a specific person's voice. ElevenLabs Instant Voice.

**Diffusion model** — The dominant image/video generation architecture (Stable Diffusion, Midjourney, DALL·E, Sora). Starts with noise, iteratively denoises.

**Latent space / latent diffusion** — Diffusion in a compressed latent space (rather than pixel space). Much faster. Stable Diffusion's key trick.

**Sampler / scheduler** — Algorithm that runs the diffusion denoising steps (DDIM, DPM++, Euler, etc.).

**Steps** — Number of denoising steps. More = slower + usually better quality (diminishing returns after ~30–50).

**CFG — Classifier-Free Guidance scale** — How strongly the image follows the prompt (higher = more faithful, less creative).

**Seed (image)** — Random seed. Same seed + same prompt + same params = same image.

**ControlNet** — Add spatial conditioning (pose, edges, depth) to guide generation.

**LoRA (image)** — Small adapter that adds a specific style, character, or concept to an image model.

**Inpainting** — Fill in a masked region of an image.

**Outpainting** — Extend an image beyond its borders.

**Img2img** — Transform an existing image using a text prompt.

**Text-to-video** — Sora, Veo, Runway Gen-4, Wan, LTX.

**Image-to-video / keyframe-to-video** — Animate a still image, or animate between two keyframes.

**First-frame / last-frame conditioning** — Video generation guided by a specific starting or ending frame.

**Reference image / image conditioning** — Use an image to guide generation (character, style, composition).

**Motion prompt** — Text describing the camera or subject movement in a video generation.

**Frame rate (fps)** — Frames per second of generated video (usually 24 or 30).

**Duration** — Length of generated video (usually 5–10 seconds per clip, then stitched).

**Talking head / lip-sync** — Generate video of a person speaking (SadTalker, HeyGen, D-ID).

**Neural rendering** — General term for AI-generated visual output.

---

## Cluster 7 — Evaluation

**Eval / evaluation** — Structured tests that measure model performance. Automated where possible.

**Eval set** — The collection of test cases with expected answers or scoring criteria.

**Benchmark** — A public, standardized eval (MMLU, HumanEval, SWE-bench, GPQA).

**Golden dataset / golden answers** — Curated correct answers, used as ground truth.

**Human eval** — Human raters score model outputs.

**Pairwise comparison** — Show a human two outputs, ask which is better. Feeds ELO ratings.

**LMSYS Arena / Chatbot Arena** — Public leaderboard from crowd-sourced pairwise comparisons.

**Rubric** — Explicit criteria for scoring outputs (accuracy, tone, format, etc.).

**LLM-as-judge** — Using an LLM to score other LLM outputs. Cheaper than human eval; introduces its own biases.

**Regression test** — Re-running the eval set after a change to catch quality drops.

**A/B test** — Ship two versions to users, measure difference. For product-level evals.

**Hallucination** — Model confidently states something false. The core reliability problem.

**Faithful vs coherent** — Coherent output can still hallucinate. Faithfulness = grounded in provided context.

**Groundedness score** — Metric for how well output is supported by retrieved context.

**Precision / recall** — Classic IR metrics; also used for eval.

**F1** — Harmonic mean of precision and recall.

**BLEU / ROUGE / METEOR** — String-overlap metrics for translation/summarization. Legacy; largely superseded by LLM-as-judge for open-ended tasks.

**Perplexity** — How well a model predicts a text (lower is better). Used for base-model comparison.

**pass@1 / pass@k** — For code eval: does the model pass the tests on the first try / at least once in k tries?

**Red team** — Adversarial testing to find failures, jailbreaks, misuse.

**Prompt injection eval** — Specifically test defenses against prompt injection.

**Bias eval** — Test for demographic, ideological, or systematic biases.

**Toxicity eval** — Test for harmful outputs.

**Safety eval** — Broad category including refusals, harmful content, misuse potential.

---

## Cluster 8 — Deployment

**Inference** — Running a trained model to produce outputs. The step you pay for.

**Latency** — Time from request to first byte (TTFT) and to last byte.

**Throughput** — Requests or tokens per second the system can handle.

**TTFT — Time to First Token** — Latency until streaming begins.

**Batch inference** — Process many requests in one call. Cheaper (per token) but higher latency.

**Streaming** — Send tokens as generated for faster perceived response.

**Caching** — Store and reuse: KV cache (attention state), prompt cache (Anthropic prompt caching), semantic cache (skip repeated queries).

**Prompt caching** — Provider feature: repeated prompt prefixes are cached and re-billed cheaper.

**KV cache** — Internal attention state cached between tokens in a single generation.

**Serverless inference** — Provider hosts models; you pay per token. OpenAI, Anthropic, etc.

**Dedicated inference** — You reserve capacity (per hour). Better latency, worse economics unless heavily used.

**Provisioned throughput** — Same idea; guaranteed capacity for a fee.

**Self-hosted inference** — You run the model on your own hardware (vLLM, TGI, TensorRT-LLM, llama.cpp).

**vLLM / TGI / TensorRT-LLM / llama.cpp** — Popular inference engines.

**Speculative decoding** — Use a small "draft" model to guess tokens, verify with the big model. Faster.

**Continuous batching** — Batch requests dynamically, not by fixed windows. Higher throughput.

**Context caching / cached input** — Provider-level cache for reused system prompts. Cuts input token cost by 50–90%.

**Cold start** — First-request latency when infrastructure spins up.

**Fine-tuned model deployment** — Serving a custom fine-tuned model. Often more expensive than base.

**Model versioning** — Providers version models (gpt-4o-2024-08-06, claude-opus-4-20260601). Pin to versions in production.

**Model card** — Documentation of a model's capabilities, limits, training, and safety properties.

**System card** — Broader safety/capability doc for a released model (OpenAI, Anthropic conventions).

**Deprecation** — Providers retire old model versions. Read release notes.

---

## Cluster 9 — Governance and Safety

**PII — Personally Identifiable Information** — Any data that identifies a person. Legally defined; treat carefully.

**PHI — Protected Health Information** — Health data under HIPAA (US). Requires BAA.

**BAA — Business Associate Agreement** — HIPAA contract with vendors handling PHI.

**DPA — Data Processing Agreement** — GDPR contract governing processor duties. Sign one with every AI vendor handling personal data.

**Data residency** — Where the data is stored/processed. EU customers often require EU residency.

**Zero-retention / no-training** — Contractual guarantee that provider does not retain or train on your inputs. Ask for it explicitly.

**Data classification** — Public / Internal / Confidential / Restricted. The base of every data policy.

**DLP — Data Loss Prevention** — Systems that block sensitive data from leaving your perimeter.

**CASB — Cloud Access Security Broker** — Enforces policy on cloud tool usage.

**SSO — Single Sign-On** — Federated login. Table-stakes for enterprise tools.

**SCIM — System for Cross-domain Identity Management** — Automated user provisioning/deprovisioning.

**BYOK — Bring Your Own Key** — Provider encrypts data with a key you control.

**Private link / VPC peering** — Traffic to the provider stays on private network.

**SOC 2 / ISO 27001** — Security certifications. Type II is the meaningful one.

**HIPAA / GDPR / CCPA / EU AI Act** — Regulatory frameworks (US health, EU privacy, California, EU AI).

**NIST AI RMF** — National Institute of Standards and Technology AI Risk Management Framework. US governance reference.

**Responsible AI (RAI)** — Vendor programs and internal policies around fair, safe, accountable AI use.

**Model card** — See Deployment cluster.

**Explainability / interpretability** — Ability to understand *why* a model produced its output.

**Prompt injection defense** — Techniques to prevent adversarial content from hijacking model behavior.

**Content filter / moderation** — Layer that blocks harmful outputs.

**Safe harbor** — Legal safe zones for specific AI uses (varies by jurisdiction).

**Provenance / watermarking** — Marking AI-generated content so it can be detected.

**Consent to record / consent to process** — Legal requirement in some jurisdictions before AI can process personal comms.

**Right to explanation** — GDPR concept: individuals can demand explanation of automated decisions affecting them.

---

## Cluster 10 — Product / Ecosystem terms

**LLM — Large Language Model** — The generic term for models like GPT, Claude, Gemini.

**Foundation model** — A large pretrained model adaptable to many tasks.

**Frontier model** — The current top-tier models (GPT-5, Claude Opus, Gemini Pro).

**Small language model (SLM)** — Small enough to run on-device (Phi, Gemma, Llama 3.2 1B/3B).

**On-device inference** — Model runs on the user's phone/laptop (Apple Intelligence, Copilot+ PC).

**Multi-agent system** — Multiple agents collaborating on a task.

**Copilot (product term)** — An AI assistant embedded in another product (Microsoft, GitHub, generic).

**Assistant / agent (product term)** — Overlapping but not identical to "agent" the pattern.

**Autopilot** — Higher-autonomy variant of a copilot. Product buzzword.

**AGI — Artificial General Intelligence** — Contested term for human-level general intelligence.

**ASI — Artificial Super Intelligence** — Above human. Speculative.

**Wrapper / GPT wrapper** — Pejorative for a product that's mostly a thin UI over a base model.

**Prompt engineering** — Craft of writing effective prompts. Real skill; often derided.

**Prompt library** — Curated collection of reusable prompts.

**Custom GPT** — OpenAI's user-built GPT with instructions, knowledge, and actions.

**Claude Project** — Anthropic's equivalent — persistent knowledge + custom instructions.

**Perplexity Space** — Perplexity's equivalent.

**Gem** — Google's equivalent.

**Actions / plugins** — External tools a Custom GPT (or similar) can call.

**Artifact** — Anthropic's UI element for inline runnable code / documents.

**Canvas** — Similar concept in ChatGPT / Gemini.

**Tokens per second (t/s)** — Speed metric.

**Time to first token (TTFT)** — See Deployment.

**Model marketplace** — Aggregators like OpenRouter, Together, Fireworks.

**AI IDE** — IDE with AI integration (Cursor, Zed, Windsurf).

**AI browser** — Browser with agentic capabilities (Comet, Dia, Arc's now-defunct product).

**Voice mode** — Real-time voice conversation with a model.

**Vision mode** — Model can see images/screens.

**Sora / Veo / Runway / Higgsfield** — Text-to-video products.

**Grounding** — Providing external context (usually via retrieval or search) to reduce hallucinations. Also used as verb ("grounded in the docs").

---

## Cluster 11 — Neologisms and Jargon-of-the-moment

**Vibe coding** — Iterative coding with an AI, letting the AI drive with loose specs. Popularized 2024–2025.

**Model soup** — Averaging weights of fine-tuned models.

**Merge / MoE — Mixture of Experts** — Architecture where different parts of the network specialize; only a subset activated per token.

**Sparse / dense (models)** — MoE = sparse activation. Traditional transformers = dense.

**Reasoning model** — A model with native extended thinking (o-series, Claude thinking, DeepSeek R1).

**Verifier model** — A separate model that scores a candidate answer.

**Agentic workflow** — Any multi-step process orchestrated by an AI agent.

**Ambient AI** — AI that runs in the background without explicit invocation (background transcription, always-on assistants).

**Vertical AI / vertical agent** — AI specialized to a domain (legal, medical, real estate).

**Horizontal AI** — General-purpose (ChatGPT, Claude).

**Composable AI** — Building complex systems from smaller AI primitives.

**LLM gateway** — Middleware routing requests across providers (Portkey, LiteLLM, OpenRouter).

**Observability (for LLMs)** — Logging, tracing, cost tracking, prompt versioning across LLM calls (Langfuse, Helicone, Arize, LangSmith).

**Prompt versioning** — Treating prompts like code — version-controlled, tested, deployed.

**Prompt registry** — Central store for reusable, versioned prompts.

**Semantic diff** — Comparing two texts by meaning (embedding distance) rather than string diff.

**Neural retrieval** — Retrieval using neural embeddings (as opposed to BM25).

**Long-tail queries** — Rare, unique queries that don't fit templates.

**Data flywheel** — Feedback loop: usage → logs → training → better model → more usage.

**Small model, big context** — Product pattern: use a cheap model but give it lots of grounded context.

**Cost per resolved (ticket / task / query)** — Ops metric replacing "cost per token" at the product level.

**Deflection rate** — % of user requests handled without human. Support metric.

**Containment** — Similar to deflection; % contained by the bot.

**Autonomy dial** — UX concept: users choose how autonomous the agent is (from suggest to execute).

**HITL rate** — % of agent decisions that require human confirmation.

---

## How to learn this glossary

- Read one cluster per day for 11 days.
- After each cluster, use each term in a sentence out loud.
- Add any term you couldn't define after a week to a personal spaced-repetition deck (Anki, RemNote).
- Review the whole doc quarterly.
