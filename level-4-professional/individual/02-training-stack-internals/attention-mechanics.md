# Attention Mechanics

Attention is the mechanism that lets a transformer decide which parts of its context matter for the next prediction. Each token creates a query, a key, and a value. A query compares itself with keys from other tokens; the resulting weights mix their values into a context-aware representation. In practical terms, every token can look at other relevant tokens rather than passing information only through a fixed-size hidden state.

This is why transformers can connect a clause at the beginning of a lease to an exception near the end. It is also why long context is not free. Standard attention compares positions broadly, so both compute and memory pressure rise sharply with sequence length. A 200-page document may fit in a window while still being expensive, slow, and easy for a model to use poorly.

Important operating implications:

- More context can dilute salience; it is not the same as better retrieval.
- Position matters. Models may attend unevenly to information buried in the middle.
- Attention heads specialize imperfectly and cannot be assumed to represent human-readable concepts.
- Caches store prior keys and values so generation does not recompute the entire prefix each token.

For a production workflow, retrieve a compact, attributable evidence set, put instructions near the relevant material, and evaluate with realistic document lengths. Do not call “it has a large context window” an architecture plan. The question is whether the system reliably selects the evidence needed for the user’s decision.
