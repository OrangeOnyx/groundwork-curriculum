# Mixture of Experts and Sparsity

Dense models activate most parameters for each token. Mixture-of-experts (MoE) models contain many expert subnetworks but use a router to activate only a few for a given token. This sparse activation can increase total capacity without multiplying per-token compute by the same amount.

The headline parameter count therefore needs interpretation. A model advertised with hundreds of billions of parameters may activate a much smaller subset per token. It can be powerful and efficient, but it also introduces routing behavior, communication overhead, load-balancing problems, and potentially uneven capability across domains.

For practitioners, three points matter. First, test the model on your distribution; aggregate leaderboard performance cannot tell you whether router decisions work on property descriptions, legal clauses, or your tool-call format. Second, serving cost depends on active parameters, memory layout, hardware, batching, and context—not just the total number printed on a model card. Third, sparse architectures can fail in ways that look inconsistent: similar prompts may route differently or depend on specialists that are rarely activated.

Sparsity is broader than MoE. It includes pruning, sparse attention, and conditional computation. The common idea is to spend computation where it matters rather than everywhere. It is an engineering tradeoff, not magic: every saving creates a new scheduling, calibration, or debugging burden.
