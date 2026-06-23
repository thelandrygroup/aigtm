# Using ClearCo AI GTM Skills in Claude Cowork

No terminal? Use Claude Desktop / Claude web / Cowork with this repo as a ClearCo GTM skill library.

> First-time user? Read the "Start Here" section in [`README.md`](README.md) first. The same five ClearCo starter skills work in Cowork and Claude Code.

---

## Path A — Connect the Repo as a Knowledge Source

If Cowork has an **Add folder / Connect a knowledge source / GitHub repo** option:

1. Add a new knowledge source.
2. Paste the repo URL:
   ```text
   https://github.com/thelandrygroup/aigtm
   ```
3. Tell Cowork to use this as your ClearCo AI GTM skill library.
4. Use the trigger phrases below.

Cowork should read the matching `SKILL.md`, the top-level `CLEARCO.md`, and the skill-specific `CLEARCO.md` overlay where present.

---

## Path B — Paste the Master Prompt

If Cowork cannot connect to the repo directly, paste this message into a new conversation:

```text
Treat https://github.com/thelandrygroup/aigtm as my ClearCo AI GTM skill library for this conversation.

Before running any skill:
1. Apply the top-level CLEARCO.md context.
2. If the selected skill folder contains a CLEARCO.md overlay, apply that too.
3. Use public-safe ClearCo guardrails: do not invent ROI, implementation timelines, AI accuracy claims, compliance guarantees, customer outcomes, pricing, or private competitive intel.
4. Separate facts, hypotheses, and recommended actions.
5. Keep customer, prospect, pipeline, pricing, and transcript data private inside this conversation.

Core ClearCo revenue triggers:

• "prep me for my call with [company]"               → meeting-prep
• "research [company]" / "research these prospects" → prospect-research
• "summarize my call" / "draft a follow-up"          → post-call-summary
• "deal strategy for [account]" / "MEDDIC this deal" → deal-strategy
• "audit my pipeline" / "pipeline review"            → pipeline-health

Additional revenue triggers:

• "write a cold email"                               → cold-email
• "build a sequence"                                 → sequence
• "ABM plan for [account]"                           → abm
• "battlecard for [competitor]"                      → battlecard
• "find a referral path"                             → referral
• "this deal is stuck" / "handle this objection"     → objection-handler
• "build my forecast"                                → forecast-narrative
• "territory analysis" / "rep performance"           → territory-analyzer
• "competitive intel on [company]"                   → competitive-intel
• "win/loss analysis"                                → win-loss-analyzer
• "build a QBR"                                      → qbr-builder
• "churn risk" / "at-risk accounts"                  → churn-early-warning
• "write a board update"                             → board-update
• "hiring brief" / "scope this role"                 → hiring-brief
• "plan my week"                                     → weekly-planner
• "triage my inbox"                                  → inbox-triage

For any other request, browse the repo's skills folder and select the skill whose description best matches the job.

Confirm by responding: "ClearCo toolkit loaded — what should I run first?"
```

---

## ClearCo Context Block for Cowork

Paste this once at the start of a Cowork conversation if the repo is not connected or you want to override local context:

```text
CLEARCO CONTEXT — APPLY TO EVERY SKILL

Company: ClearCo
Positioning: ClearCo is the unified talent platform for hiring, growth, and retention. Position it as an intelligent, connected operating layer across the talent lifecycle, not as a generic ATS or isolated HR point solution.

Lifecycle model:
- Hire: candidate attraction, recruiting experience, background checks, onboarding
- Succeed: performance management, employee engagement
- Grow: learning management, compensation management
- Platform: Talent AI, People Analytics, Integrations, Security & Privacy

Target personas:
- CHRO / Chief People Officer: workforce strategy, retention, manager effectiveness, executive visibility
- VP Talent Acquisition: hiring velocity, pipeline quality, recruiter capacity, candidate experience
- VP / Director HR or People Ops: process consistency, onboarding, performance cycles, engagement, reporting
- HRIS / HR Ops / IT: integrations, data quality, permissions, security, implementation risk
- CFO / CEO: cost of fragmentation, productivity, retention, operating leverage, measurable outcomes

Sales style:
- Discovery-led, not demo-led
- Lead with business pain and impact
- Map pain to lifecycle only when supported
- Use public or user-provided proof only
- Label hypotheses as hypotheses
- Do not invent ROI, timelines, compliance guarantees, AI claims, or customer outcomes
```

---

## Full Skill Library

The repo includes ClearCo overlays for revenue, marketing, competitive intel, customer success, leadership, daily operations, file utilities, and business operations workflows.

Ask Cowork: *"Find the skill that best matches [the job I'm trying to do] and apply the ClearCo overlay."*

---

## Notes for Public-Safe Use

Do not paste confidential customer data into shared or externally visible docs. In Cowork conversations, use private context only for the current task unless you have approval to save it somewhere else.

This repo should remain free of internal-only Drive links, customer-specific pricing, pipeline exports, Gong transcripts, security questionnaires, and private competitive intel.
