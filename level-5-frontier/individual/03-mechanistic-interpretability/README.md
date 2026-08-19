# Mechanistic Interpretability

Mechanistic interpretability asks how a trained neural network implements a behavior, not merely whether it exhibits that behavior. The ambition is closer to reverse engineering than to feature attribution: identify components, representations, and causal paths that produce a result.

The field matters because behavior-only testing has limits. A system can pass a benchmark while relying on a fragile shortcut, conceal a capability in ordinary prompts, or fail only in rare conditions. Internal evidence may eventually let us detect, understand, and alter such mechanisms earlier. It is not there yet. Treat compelling visualizations as hypotheses, not x-rays.

The basic workflow is:

1. Select a narrow, reproducible behavior.
2. Find internal features or components correlated with it.
3. Intervene—patch, ablate, or steer activations.
4. Measure whether the predicted behavior changes.
5. Test whether the explanation generalizes beyond one curated example.

Sparse autoencoders, activation patching, causal tracing, and circuit discovery are tools in this workflow. Each can mislead when features are entangled, interventions are distribution-shifting, or interpretations are selected after looking at the answer.

For Level 5, the target is not to memorize tool names. It is to develop causal taste. A useful interpretation makes a risky behavior more predictable, makes an intervention safer, or rules out a tempting but false explanation. Anything less may still be scientifically interesting; it is not yet an operational safety control.
