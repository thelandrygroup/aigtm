# Customizing ClearCo AI GTM Skills

This repo is already tailored for ClearCo. Customize only the context that changes by rep, manager, segment, territory, approved proof, current competitors, and operating cadence.

The goal is not to make Claude sound clever. The goal is to make it safer, sharper, and more useful for ClearCo revenue execution.

---

## 1. Understand the Context Layers

ClearCo context is now layered in four places:

| Layer | File | Purpose |
|------|------|---------|
| Repo-wide context | `CLEARCO.md` | Shared ClearCo positioning, personas, proof guardrails, and public-safe rules |
| Runtime context | `CLAUDE.md` | Tells Claude Code to apply ClearCo context before every skill |
| Skill overlay | `skills/<skill>/CLEARCO.md` | Skill-specific ClearCo use cases and guardrails |
| Personal context | `~/.claude/CLAUDE.md` | Your role, territory, quota, current accounts, competitors, tools, and preferences |

Do not store customer-private or deal-private details in committed repo files. Put those into a live session or a private local profile only when appropriate.

---

## 2. Customize Your Personal ClearCo Profile

Open `~/.claude/CLAUDE.md` or ask Claude Code to update it.

Use this structure:

```markdown
# Claude Code — ClearCo GTM Configuration

## About Me

[Name], [Title] at ClearCo. I cover [segment/territory] and focus on [new business / AM / partner / leadership / ops].

## My Current Focus

- **Quarterly target:** [quota or team goal]
- **Top priorities:** [pipeline creation, late-stage deal execution, renewals, expansion, enablement, forecast hygiene]
- **Must-win accounts:** [optional; keep private if sensitive]

## My ICP / Territory

- **Best-fit industries:** [your verticals]
- **Company size:** [employee count / revenue / locations]
- **Buying triggers:** [new HR leadership, hiring growth, retention pressure, ATS renewal, HCM consolidation, multi-location expansion, compliance pressure]
- **Disqualification signals:** [too small, no HR owner, no active talent priority, bad timing, locked into incumbent]

## Approved ClearCo Proof

- [Approved public customer example or internal-approved reference]
- [Metric with source and caveat]
- [Security/privacy proof allowed in sales cycles]

## Competitors / Incumbents

| Competitor or category | How to position fairly |
|------------------------|------------------------|
| ATS point solution | Recruiting workflow may be covered, but lifecycle data and employee growth may remain disconnected |
| Enterprise HCM suite | Broad system of record, but often heavier workflows and slower talent-team agility |
| Performance / engagement point tool | Useful in one workflow, but weaker if hiring, performance, development, and retention are disconnected |

## Tools and Formats

- **CRM:** [Salesforce / HubSpot / other]
- **Call recorder:** [Gong / Zoom / other]
- **Forecast format:** [team format]
- **Follow-up tone:** [direct / executive / conversational]
```

---

## 3. Add Approved Proof Without Creating Risk

Proof is where AI outputs become dangerous if not constrained.

Use this rule:

> If the proof is not public, user-provided in-session, or internally approved for that specific use, do not use it.

Good proof entries include:

```markdown
## Approved Proof Library

### Public proof
- ClearCo is trusted by [approved public stat + source].
- [Customer] achieved [specific outcome] according to [public source].

### Internal-approved proof
- [Reference/customer] may be used in [segment/use case] when approved by [team/process].

### Security proof
- SOC 2 Type II: allowed in security/procurement conversations.
- Encryption, access controls, SSO, and AWS hosting: use only with approved wording.

### Forbidden unless explicitly provided
- Unapproved ROI percentages
- Guaranteed implementation timelines
- AI accuracy claims
- Compliance guarantees
- Non-public customer outcomes
- Pricing concessions
```

---

## 4. Customize ICP and Buying Signals

Add segment-specific signals to your local profile.

```markdown
## ICP Detail

**Best-fit companies:**
- Industry: [specific verticals]
- Size: [employee count, locations, hiring volume]
- Workforce complexity: [hourly, distributed, healthcare, services, franchise, manufacturing, etc.]
- Talent triggers: [ATS renewal, high-volume hiring, onboarding gaps, performance cycle pain, learning/compliance pressure]
- Systems trigger: [multiple HR tools, manual spreadsheets, HCM suite dissatisfaction, integration pressure]

**Persona priority:**
1. [Persona] — cares about [business problem]
2. [Persona] — cares about [business problem]
3. [Persona] — cares about [business problem]

**Disqualification signals:**
- [Signal]
- [Signal]
- [Signal]
```

This helps Meeting Prep, Prospect Research, Deal Strategy, Pipeline Health, Territory Analyzer, Forecast Narrative, and Win/Loss Analyzer separate real opportunities from noise.

---

## 5. Customize Competitive Playbooks

Keep competitive positioning fair and evidence-based.

```markdown
## Competitive Playbook

### vs. [Competitor or category]
- **Their likely pitch:** [what they credibly sell]
- **Where they are strong:** [real strength]
- **Where ClearCo is stronger:** [specific lifecycle/platform advantage]
- **Decision criteria to test:** [question]
- **Fair trap question:** [question that exposes lifecycle, data, workflow, analytics, AI, or implementation gap]
- **Proof to use:** [approved proof only]
- **Do not say:** [unapproved or risky claim]
```

The strongest competitive work is not vendor bashing. It helps the buyer clarify what kind of system they actually need.

---

## 6. Customize CRM and Forecast Formats

If your team uses specific CRM fields, stage names, or forecast categories, add them locally.

```markdown
## CRM / Forecast Rules

**Opportunity fields to preserve:**
- Opportunity Name
- Stage
- Forecast Category
- Close Date
- Amount
- Next Step
- Champion
- Economic Buyer
- Competitor
- Mutual Action Plan

**Stage probabilities:**
- Discovery: [x]%
- Evaluation: [x]%
- Proposal: [x]%
- Procurement: [x]%
- Contract: [x]%

**Forecast categories:**
- Commit: [definition]
- Best Case: [definition]
- Pipeline/Upside: [definition]
- Pull/Pushed: [definition]
```

Do not commit official internal stage definitions to this public repo unless they are approved for public use.

---

## 7. Chain ClearCo Skills Together

### Account pursuit flow

1. **Prospect Research** — identify the likely buyer, signal, and ClearCo angle.
2. **Cold Email** or **Sequence** — convert the angle into outreach.
3. **Meeting Prep** — prepare for the first conversation.
4. **Post-Call Summary** — capture pains, next steps, and CRM notes.
5. **Deal Strategy** — build the path to win once there is an active opportunity.
6. **Pipeline Health** — inspect risk and forecast quality.

### Manager forecast flow

1. **Pipeline Health** — identify deal risks and coverage gaps.
2. **Forecast Narrative** — turn the analysis into commit/best-case/upside narrative.
3. **Territory Analyzer** — inspect rep/team coverage and whitespace.
4. **Weekly Planner** — convert findings into weekly priorities.

### Customer expansion / retention flow

1. **QBR Builder** — summarize value and next opportunities.
2. **Churn Early Warning** — identify risk signals.
3. **Objection Handler** — plan save plays.
4. **One-Pager** — create a champion-friendly leave-behind.

---

## 8. Add Data Handling Guardrails

Add this locally when working with sensitive data:

```markdown
## Data Handling Rules

- Do not store customer-private details in repo files.
- Do not paste confidential customer data into public docs.
- Do not use unapproved customer names in external-facing copy.
- Treat pricing, procurement, security questionnaires, pipeline exports, call transcripts, and renewal data as private.
- If a source is missing, ask for it or label the answer as a hypothesis.
- Preserve exact buyer language for pain and objections when summarizing calls.
```

---

## 9. Quick Reference

| What you want to change | Where to change it |
|------------------------|-------------------|
| Public-safe ClearCo positioning | `CLEARCO.md` |
| Repo-wide Claude behavior | `CLAUDE.md` |
| Skill-specific ClearCo guidance | `skills/<skill>/CLEARCO.md` |
| Your private role/territory/quota/account context | `~/.claude/CLAUDE.md` |
| Output format for one skill | `skills/<skill>/SKILL.md` |
| Cowork instructions | `COWORK.md` |
| API key placeholders | `setup/env.example` locally copied to `~/.claude/.env` |

---

## Getting Help

Useful prompts:

- "Update my local CLAUDE.md for my ClearCo Mid-Market territory."
- "Add our current competitors to my local profile, but keep it private."
- "Customize pipeline-health to use our forecast categories."
- "Create an approved-proof block from these public customer examples."
- "Show me which ClearCo overlay applies to the proposal skill."

Keep repo changes public-safe. Keep live deal context private.
