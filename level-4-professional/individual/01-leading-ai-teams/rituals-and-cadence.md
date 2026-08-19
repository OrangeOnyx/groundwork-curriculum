# Rituals and Cadence

AI work needs a cadence that rewards evidence and catches weak signals early. Status meetings are not enough; model behavior changes across data, versions, prompts, and user intent. Establish rituals that make learning visible.

**Daily:** Review production health, blocked users, cost anomalies, and safety alerts. This should take fifteen minutes. A red metric gets an owner and a next observation, not a long debate.

**Weekly:** Run an evaluation review. Compare the latest system against a fixed holdout and a rotating set of fresh failures. Inspect a small sample by hand. Decide whether to ship, investigate, or revert. Also hold a domain review with operators who use the product.

**Biweekly:** Hold an experiment council. Every proposal states a hypothesis, expected upside, downside, required data, evaluation threshold, and kill condition. This prevents roadmap theater and makes negative results useful.

**Monthly:** Conduct a model and safety review. Revisit permissions, data retention, systemic error patterns, provider changes, incident learnings, and open risks. Record decisions in writing.

**Quarterly:** Reconfirm the team charter. Stop projects that no longer earn their complexity. Reassign ownership where interfaces have become unclear.

The rule is simple: meetings must change a decision, a system, or a written belief. If a ritual merely broadcasts activity, remove it. Cadence is the mechanism by which a fast-moving team becomes a learning organization instead of a factory for plausible demos.
