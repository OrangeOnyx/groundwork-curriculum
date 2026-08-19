# Novel Architectures

Most architecture ideas should die early. That is not failure; it is allocation discipline. Invent a new architecture only when a specific bottleneck resists better data, training, decoding, retrieval, tooling, or systems engineering. “Transformers are popular” is not a hypothesis. “Quadratic attention makes a 500k-token evidence task economically impossible at a defined quality target” is.

Start with a mechanism claim. For example: a memory module should preserve information over long horizons better than a fixed context; a routing mechanism should reduce active compute without hurting rare-domain performance; a new objective should improve causal planning rather than merely change a benchmark. Then define the minimal setting in which that mechanism can be disproved.

Use a research ladder:

- toy task that isolates the desired behavior;
- ablation against the simplest credible baseline;
- compute-matched comparison;
- scaling probe;
- failure analysis and robustness checks;
- only then, a large run.

Architecture search can generate candidates, but it cannot supply taste, a meaningful objective, or a trustworthy evaluation. Beware benchmark overfitting disguised as invention. A design is interesting if it teaches you something even when it loses.

The frontier is not reached by declaring a new block of code. It is reached by finding a property current systems cannot achieve, proposing a mechanism, and accumulating evidence that the mechanism—not accidental confounds—caused the improvement.
