# Level 3 Systems Glossary

Use these terms precisely. They describe different layers of a production AI system: how a model computes, how it is served, how it is aligned, how it is evaluated, and how operators observe it. A technical founder should be able to ask which metric moved, which layer owns the risk, and what evidence supports a change.

| Term | Working definition |
|---|---|
| MoE | Mixture of Experts; routes tokens to a subset of specialist parameter blocks. |
| Sparse attention | Attention that considers selected token relationships rather than every pair. |
| FlashAttention | Memory-efficient exact attention algorithm that reduces I/O overhead. |
| PagedAttention | KV-cache layout that pages memory to improve serving utilization. |
| vLLM | Open-source inference engine known for PagedAttention and continuous batching. |
| TGI | Text Generation Inference, a model-serving stack from Hugging Face. |
| TensorRT-LLM | NVIDIA optimization and serving toolkit for LLM inference. |
| Triton | GPU programming language/compiler often used for custom inference kernels. |
| KV cache management | Allocation, reuse, eviction, and sharing of attention key/value state. |
| Prefix caching | Reusing computation for identical prompt prefixes, such as system policy. |
| Speculative decoding | A small draft model proposes tokens a larger model verifies. |
| Batched inference | Processing multiple requests together to use hardware efficiently. |
| Continuous batching | Adding and removing requests from a live inference batch. |
| Chunked prefill | Splitting long prompt processing so decode traffic remains responsive. |
| Tensor parallelism | Splitting model tensors across devices for one model invocation. |
| Pipeline parallelism | Splitting model layers into stages across devices. |
| ZeRO | Optimizer-state and gradient sharding approach from DeepSpeed. |
| DeepSpeed | Microsoft training/inference system with distributed optimization tools. |
| FSDP | Fully Sharded Data Parallel; shards model state across workers. |
| RLHF | Reinforcement learning from human feedback. |
| RLAIF | Reinforcement learning from AI feedback. |
| DPO | Direct Preference Optimization; learns preferences without a separate reward loop. |
| IPO | Identity Preference Optimization; a preference-learning variant. |
| KTO | Kahneman-Tversky Optimization; uses desirable/undesirable labels. |
| GRPO | Group Relative Policy Optimization; compares sampled responses within groups. |
| ORPO | Odds Ratio Preference Optimization; combines likelihood and preference learning. |
| Constitutional AI | Alignment approach using written principles to guide critique and revision. |
| Self-play | Training through competition or interaction with copies of a policy. |
| Tool-use RL | Reinforcement learning that rewards correct external-tool behavior. |
| Agent RL | Reinforcement learning over multi-step agent trajectories. |
| PPO | Proximal Policy Optimization, a clipped policy-gradient method. |
| TRPO | Trust Region Policy Optimization, constraining policy update size. |
| Reward model | Model that predicts preference or quality for a response. |
| Reward hacking | Optimizing the score while missing the intended outcome. |
| Sycophancy | Agreeing with a user’s premise rather than correcting it. |
| Mode collapse | Reduced diversity in generated outputs or learned behavior. |
| Capability elicitation | Prompting or scaffolding to reveal a model’s latent ability. |
| Red team | Authorized adversarial testers seeking harmful or bypass behavior. |
| Blue team | Defenders operating controls, detection, and response. |
| Purple team | Collaborative red/blue work that validates defenses. |
| Model card | Documentation of a model’s intended use, limits, data, and risks. |
| System card | Documentation of a deployed system, including integrations and controls. |
| Eval card | Documentation of an evaluation’s scope, dataset, metrics, and limits. |
| MMLU | Broad multiple-choice benchmark across academic subjects. |
| HellaSwag | Benchmark for commonsense sentence completion. |
| HumanEval | Python coding benchmark scored by tests. |
| MBPP | Mostly Basic Python Problems coding benchmark. |
| GSM8K | Grade-school math word-problem benchmark. |
| MATH | Competition-style mathematics benchmark. |
| BIG-Bench | Community benchmark suite spanning many tasks. |
| HELM | Holistic Evaluation of Language Models framework. |
| TruthfulQA | Benchmark probing false-but-plausible answers. |
| Arena Elo | Relative ranking from pairwise user preferences. |
| LMSYS | Organization associated with Chatbot Arena and model evaluation. |
| Offline eval | Evaluation on a fixed dataset before release. |
| Online eval | Evaluation using live or live-like traffic after release. |
| A/B test | Randomized comparison of variants across user cohorts. |
| Interleaved test | Presents blended ranking results to compare systems efficiently. |
| Canary metrics | Health metrics for a limited-release cohort. |
| Guardrail metrics | Rates and outcomes of safety-policy decisions. |
| Drift metrics | Measures showing input, output, or outcome distribution change. |
| Telemetry | Operational signals emitted by a system. |
| Span | Timed, attributed unit of work inside a trace. |
| Trace | Linked record of work for one request or transaction. |
| Event | Discrete business or system occurrence. |
| Log | Timestamped diagnostic record. |
| Structured logging | Logs encoded as queryable fields rather than free text. |
| PII redaction | Detecting and removing or masking personal information. |
| Tokenization | Converting text into model-readable token IDs. |
| BPE | Byte Pair Encoding tokenization based on merged frequent pairs. |
| SentencePiece | Tokenizer framework that treats text as a raw byte sequence. |
| Unigram | Tokenization model selecting likely subword pieces from a vocabulary. |
| Vocabulary | Set of token units a tokenizer can emit. |
| Context window | Maximum tokens a model can consider in one invocation. |
| Sliding window attention | Limits attention to nearby tokens to support long sequences. |
| RoPE | Rotary Positional Embeddings encoding relative token position. |
| ALiBi | Attention with Linear Biases, a positional-bias technique. |
| Positional encoding | Signal that gives a transformer token-order information. |

The point is not memorization. Use the vocabulary to connect a lease-renewal assistant’s user-visible latency to queueing, KV cache behavior, model routing, safety decisions, and business outcomes. That is systems design.
