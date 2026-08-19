# Expansion Decision Framework

When and how to expand from pilot to broader rollout.

## The decision moments

Three natural checkpoints:

1. **Pilot → Department:** After 30 days, expand to the full pilot department?
2. **Department → Adjacent Departments:** After 60 days, roll to more departments?
3. **Adjacent → Company-wide:** After 90 days, roll to everyone?

Do not skip stages. Each stage teaches you something you can't learn from the previous.

## Gate criteria — Pilot → Department

Must have all:

- [ ] Quality: aggregate eval score ≥ 80% of maximum
- [ ] Safety: zero P1 incidents in pilot period
- [ ] Adoption: ≥ 70% of pilot users active weekly
- [ ] User NPS: ≥ 40 among pilot users
- [ ] Cost: within budget
- [ ] Owner ready: department Champion recommends expansion
- [ ] Docs ready: SOP, prompts, training material updated

Should have most:

- [ ] Time-saved estimate confirmed (rough ROI)
- [ ] At least 3 case studies from real users
- [ ] Retrospective completed with lessons captured

## Gate criteria — Department → Adjacent

Same as above, plus:

- [ ] Champion identified in target department
- [ ] Adjacent department's data and permissions ready
- [ ] Playbook adjusted for new department's context
- [ ] Steering Committee approval

## Gate criteria — Adjacent → Company-wide

All previous gates, plus:

- [ ] Cross-department feedback synthesized
- [ ] Training scaled (recording available, self-serve)
- [ ] Support model defined (help channel, escalations, office hours)
- [ ] Enterprise licensing at scale
- [ ] Formal exec sponsor for full rollout
- [ ] Comms plan for company-wide announcement

## Warning signs — Do NOT expand

Any of these = pause:

- Any P1 safety incident
- Adoption < 50% at expected marker
- Quality trending down
- Cost trending above 130% of forecast
- Employee sentiment negative
- Champion resigns or is deprioritized
- Change in exec sponsor commitment

## The rollback playbook

If a workflow fails after expansion:

1. **Contain** — pause the workflow immediately if quality/safety broken
2. **Diagnose** — analyze eval regression, user complaints, incident logs
3. **Fix** — revert to last known good version, or re-do the workflow
4. **Communicate** — tell affected users honestly what happened
5. **Post-mortem** — blameless, structural fixes
6. **Re-launch** — after fixes, run pilot-scale again

## Communication cadence during expansion

- **Weekly:** operational update to Steering Committee
- **Bi-weekly:** all-hands mention of AI wins
- **Monthly:** exec dashboard review
- **Quarterly:** full program review with board or leadership

## Expansion staffing

Successful expansion needs staffing. Typical model:

- **1 AI Champion per department** (partial FTE — usually 20%)
- **1 AI Program Manager** central (full FTE)
- **1 AI Platform Engineer** central (full FTE, more as scale grows)
- **1 Security/Legal partner** central (partial FTE)
- **1 L&D partner** central (partial FTE)

Do not attempt company-wide rollout without this staffing.

## Long-term ambition setting

After 90 days, the Steering Committee sets 12-month and 24-month ambition:

- **Coverage goal:** % of workforce using AI weekly (target: 90% in year 1)
- **Depth goal:** average workflows per user (target: 3 in year 1)
- **Cost goal:** cost per user per month (target: within enterprise SaaS band)
- **Value goal:** measured productivity or revenue impact (target: 10-20% team-relative)

## Sunset criteria

Retire workflows that:
- Fall below quality threshold and can't be fixed
- Have adoption < 20% after 6 months
- Are superseded by better tools
- Violate updated policies
- No longer have an owner

Sunset formally: announce retirement, provide alternatives, archive assets, remove from launchers.
