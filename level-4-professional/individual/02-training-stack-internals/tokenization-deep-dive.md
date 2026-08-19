# Tokenization Deep Dive

Language models process tokens, not words. A tokenizer maps text into integer units, usually subword pieces. Common words may be one token; rare names, punctuation-heavy addresses, source code, and non-English text may break into many. This mapping affects context limits, latency, price, truncation, and the apparent difficulty of a task.

Never estimate production cost from word count alone. Measure tokens on representative inputs and outputs. Real-estate workflows are especially vulnerable to surprises: parcel identifiers, tables copied from PDFs, legal language, image OCR artifacts, and multilingual inquiries can all inflate token counts or degrade structure.

Tokenization also affects model behavior. Models learn patterns in token space. A string that looks simple to a human may be fragmented into unusual pieces, making exact spelling, arithmetic, or structured extraction less reliable. The same applies to JSON schemas: use constrained decoding or validation rather than trusting that a model’s learned token patterns guarantee valid syntax.

Inspect the tokenizer when diagnosing problems. Compare how it encodes a successful and failed input. Check whether retrieval chunks are cut mid-sentence or mid-table. Count reserved tokens for tools, system instructions, and expected output before setting a context budget.

Treat tokenization as a boundary condition for every design. It is mundane until it is the reason a high-value document was truncated, a system timed out, or a cost model was wrong by ten times.
