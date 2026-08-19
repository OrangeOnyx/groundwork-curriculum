# Adversarial Hardening

Assume documents and messages can contain instructions designed to redirect the model: “Ignore your rules,” “export all tenants,” “approve this payment,” or subtler text inside a lease PDF. This is prompt injection. It is not solved by adding “do not be injected” to a system prompt.

Create a trust boundary. System instructions, application policy, tool schemas, and authenticated user permissions are authority. Retrieved lease text, tenant messages, web content, file names, and tool results are data. Label untrusted content in the prompt and instruct the model to extract facts from it, never execute its instructions. More importantly, make tools incapable of prohibited actions.

Use allowlisted tools, typed arguments, server-side authorization, row limits, and proposed writes with human approval. Strip or flag instruction-like text in retrieved chunks for reviewer visibility; do not silently alter source evidence. Separate retrieval from action: an untrusted message can lead to a draft or escalation, not a database write or an external send.

Build red-team cases: direct override attempts, encoded instructions, document metadata tricks, cross-tenant data requests, tool-argument injection, and social-engineering requests for policy exceptions. Measure tool-call policy violations and unsafe-action proposals, not only refusal wording. Add canaries—fake secrets or forbidden record IDs—that must never appear in output.

Prompt hardening is defense in depth. The strongest prompt cannot compensate for an MCP tool with excessive privileges.
