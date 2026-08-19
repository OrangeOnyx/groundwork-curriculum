# Level 4 Jargon: 100 Terms

This is a working vocabulary, not a password. Use a term only when it makes a design decision clearer.

1. **Activation:** intermediate neuron output for a specific input.
2. **AdamW:** common optimizer with decoupled weight decay.
3. **Alignment tax:** capability or cost sacrificed for safer behavior.
4. **Anthropic sampling:** generating diverse adversarial test prompts.
5. **Attention head:** one learned attention subspace.
6. **Backpropagation:** computing gradients through a network.
7. **Batch size:** examples processed per optimizer update.
8. **BF16:** 16-bit floating point with wide exponent range.
9. **Calibration:** match between stated confidence and accuracy.
10. **Chain of thought:** intermediate reasoning text, when elicited.
11. **Checkpoint:** saved model state during training.
12. **Classifier-free guidance:** conditioning technique from generative modeling.
13. **Clipping:** limiting values or gradient magnitude.
14. **Compute-optimal:** data/parameter balance for a compute budget.
15. **Constitution:** written principles used to steer behavior.
16. **Context window:** maximum tokens available to a model pass.
17. **Cross-entropy:** loss measuring next-token prediction error.
18. **Data contamination:** evaluation examples leaking into training data.
19. **Data parallelism:** replicas train on different batches.
20. **Decoding:** converting token probabilities into output text.
21. **DPO:** preference optimization without an explicit reward-model loop.
22. **Distillation:** training a smaller model from a teacher’s outputs.
23. **Distribution shift:** deployment data differs from development data.
24. **Elicitation:** drawing out a latent capability through prompting/tools.
25. **Embedding:** vector representation of an input.
26. **Epoch:** one pass through a training dataset.
27. **Eval harness:** repeatable system for running evaluations.
28. **Feature:** an internal representation direction or pattern.
29. **Fine-tuning:** continuing training on a targeted dataset.
30. **FLOP:** floating-point operation; a compute unit.
31. **FP8:** low-precision format used to accelerate training/inference.
32. **Gradient:** direction used to update parameters.
33. **Gradient accumulation:** simulate a larger batch over multiple passes.
34. **Gradient checkpointing:** trade computation for activation memory.
35. **Guardrail:** control that constrains risky behavior.
36. **Hallucination:** unsupported or fabricated model output.
37. **Human-in-the-loop:** person approves or corrects consequential actions.
38. **Instruction tuning:** fine-tuning on instruction-response examples.
39. **Inter-rater reliability:** agreement level between human evaluators.
40. **Judge model:** model that scores another model’s output.
41. **KV cache:** stored attention keys/values for prior tokens.
42. **Labeler:** person producing training or evaluation annotations.
43. **Latency:** time from request to usable response.
44. **Learning rate:** step size for parameter updates.
45. **LoRA:** low-rank adapters added during efficient fine-tuning.
46. **Loss curve:** training/validation error over time.
47. **Mechanistic interpretability:** reverse engineering learned computation.
48. **Mixture of Experts:** routed experts with sparse activation.
49. **Model card:** structured disclosure about a model and its limits.
50. **Mode collapse:** generator yields narrow, repetitive outputs.
51. **Monte Carlo sampling:** estimate through repeated random samples.
52. **Multimodal model:** model operating across media such as text/image.
53. **Neuron:** a learned nonlinear computational unit.
54. **Nucleus sampling:** sample from smallest set reaching probability \(p\).
55. **ORPO:** odds-ratio preference optimization.
56. **Overfitting:** fitting training data without generalizing.
57. **Parameter:** learned numerical value in a model.
58. **Parameter-efficient fine-tuning:** adaptation without changing all weights.
59. **Perplexity:** exponential of average token loss.
60. **Preference data:** comparisons that express which output is better.
61. **Pretraining:** broad next-token learning before task adaptation.
62. **Prompt injection:** untrusted text tries to override instructions.
63. **Pruning:** removing weights, heads, or structures.
64. **Quantization:** storing/computing weights at lower precision.
65. **RAG:** retrieval-augmented generation using external evidence.
66. **Red team:** deliberate search for harmful or failing behavior.
67. **Reference model:** frozen baseline constraining preference optimization.
68. **Rejection sampling:** keep outputs that pass a selection criterion.
69. **Reward hacking:** optimize a proxy while violating the intent.
70. **Reward model:** predicts human preference or task quality.
71. **RLHF:** reinforcement learning from human feedback.
72. **RLAIF:** reinforcement learning from AI feedback.
73. **Robustness:** stable performance under perturbation or shift.
74. **Router:** MoE module choosing experts.
75. **Safety case:** evidence-backed argument for acceptable risk.
76. **Scaling law:** empirical relation among compute, data, model, loss.
77. **SFT:** supervised fine-tuning on demonstrations.
78. **Sharding:** split model state across devices.
79. **Speculative decoding:** draft tokens verified by a stronger model.
80. **Sparse attention:** attention limited to selected positions.
81. **Steerability:** ability to reliably shape model behavior.
82. **System card:** disclosure about a deployed AI system.
83. **Temperature:** randomness control during sampling.
84. **Tensor parallelism:** split tensor computations across devices.
85. **Throughput:** requests or tokens completed per time unit.
86. **Tokenizer:** maps text to and from token IDs.
87. **Tool use:** model invokes external software or APIs.
88. **Toxicity classifier:** detector for harmful language categories.
89. **Training run:** one configured execution of model optimization.
90. **Transformer:** architecture built around attention and MLP blocks.
91. **Tripwire:** monitored condition that triggers action or escalation.
92. **Unlearning:** reducing a learned behavior or data influence.
93. **Validation set:** data used for model-selection decisions.
94. **vLLM:** serving engine optimized for LLM throughput.
95. **Weight decay:** regularization penalizing large weights.
96. **Weight tying:** reuse parameters across network components.
97. **Win rate:** fraction of pairwise comparisons won.
98. **X-risk:** risk with global catastrophic or existential scale.
99. **Zero-shot:** task performance without task-specific examples.
100. **Z-loss:** stabilization loss used in some routing setups.

## Use it

Pick five terms from a current technical discussion. For each, write the decision it changes. If none changes a decision, strip it from the conversation.
