# Model Council: Independent Views, One Accountable Decision

A model council asks several independent models or prompts to analyze the same bounded question, then has a judge compare their outputs against evidence. Use it sparingly for high-value ambiguity: conflicting lease addenda, a complicated diligence exception, or a draft where legal/policy risk requires multiple structured perspectives. Do not use it for tenant message routing or routine extraction.

Make each member produce a compact structured claim set with citations, uncertainty, and recommended disposition. Independence matters: do not feed one member’s answer to another before the first vote. The judge receives the original evidence and blind member outputs, then selects, merges only supported claims, or escalates. A human owns the final decision for material risk.

Councils fail when they become majority-vote theater. Three models repeating the same hallucination are not evidence. Weight source support above agreement. If no member cites an authoritative document, the correct outcome may be abstention. Limit the council to two or three members and a single judge; otherwise cost and latency rise faster than quality.

Evaluate against a single-model baseline on the narrow slice it targets. Track consensus rate, judge agreement with humans, improved accuracy, unsupported-claim rate, cost, and latency. Keep the council behind a feature flag. The best council outcome is often a clearly documented “needs review,” not a forced answer.
