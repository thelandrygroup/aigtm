# ClearCo AI GTM Skills for Claude

**62 AI agent skills tailored for ClearCo go-to-market work.** Sales execution, marketing, competitive intel, customer success, leadership workflows, daily operations, file utilities, and owner-operator style business utilities — all running locally in Claude Code with ClearCo context.

This fork is tailored for ClearCo revenue teams. It preserves the original AI GTM skill mechanics, but adds a ClearCo positioning layer, public-safe guardrails, and skill-level overlays so outputs reflect ClearCo's talent platform motion.

---

## What This Repo Is For

Use this repo when you want Claude Code to behave like a ClearCo GTM partner instead of a generic assistant.

The skills are tuned around:

- ClearCo as the unified talent platform for hiring, growth, and retention.
- The Hire / Succeed / Grow / Platform lifecycle model.
- ClearCo buyer personas: CHRO/CPO, VP Talent Acquisition, HR/People Ops, HRIS/IT, L&D/Talent, CFO/CEO, managers, and employees.
- Discovery-led selling, business impact, stakeholder mapping, quantified pain, and mutual next steps.
- Public-safe proof standards: no invented ROI, implementation timelines, compliance guarantees, AI claims, or private customer outcomes.

Start with [`CLEARCO.md`](CLEARCO.md). It is the master context layer every skill should inherit.

---

## Public-Safe Rule

This repository is public. Do **not** commit internal-only customer notes, pricing, Gong transcripts, pipeline data, security questionnaires, Drive links, customer-specific proposals, or non-public competitive intel here.

Use internal context in a live Claude session when needed, but keep the repo itself safe for public viewing.

---

## Start Here — Five Core ClearCo Revenue Skills

These five cover the core sales motion and should be the first skills ClearCo reps and managers learn.

| Skill | Trigger phrase | ClearCo use case |
|---|---|---|
| [Meeting Prep](skills/meeting-prep/) | *"prep me for my call with [company]"* | Account, persona, pain, landmine, and discovery plan |
| [Prospect Research](skills/prospect-research/) | *"research [company]"* | Buyer targeting, signal research, and first-touch outreach |
| [Deal Strategy](skills/deal-strategy/) | *"deal strategy for [account]"* | MEDDIC gaps, lifecycle pain, stakeholders, risks, and next moves |
| [Pipeline Health](skills/pipeline-health/) | *"audit my pipeline"* | Coverage, risk flags, commit/best-case/upside, and focus list |
| [Post-Call Summary](skills/post-call-summary/) | *"summarize my call"* | Pain map, action items, follow-up email, and CRM-ready notes |

The other skills extend this motion into forecasting, marketing, proposals, customer success, leadership reporting, documents, and operational workflows.

---

## See It in Action

| Example | What to ask | Output |
|---------|-------------|--------|
| Meeting Prep | "Prep me for my call with [company/person]." | Snapshot, persona brief, ClearCo fit hypothesis, discovery questions, landmines |
| Deal Strategy | "Deal strategy for [account]. Here are the notes..." | MEDDIC assessment, stakeholder map, lifecycle fit, risks, weekly action plan |
| Pipeline Health | "Audit my pipeline. My quota is [$X]." | Coverage, weighted pipeline, risk flags, commit vs. upside, priorities |
| Prospect Research | "Research these accounts and draft outreach." | Company brief, likely buyer, personalization hook, ClearCo angle, email |
| Post-Call Summary | "Summarize this call and draft follow-up." | Debrief, pain-to-ClearCo map, actions, CRM notes, follow-up email |

---

## Quick Start

### macOS

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/thelandrygroup/aigtm/main/setup/bootstrap.sh)"
```

This installs Homebrew, Node.js, Python, Claude Code, content tools, optional public CLIs, BYOK `.env` scaffolding, and all skills. It then links the skills into `~/.claude/skills/`.

**Already cloned the repo?**

```bash
./setup/bootstrap.sh
```

### Windows PowerShell

```powershell
git clone https://github.com/thelandrygroup/aigtm.git $env:USERPROFILE\claude\aigtm
~\claude\aigtm\setup\bootstrap.ps1
```

Requires `winget`. After setup, close and reopen PowerShell, then run `claude` from the repo directory.

### Claude Desktop / Cowork

No terminal required. See [`COWORK.md`](COWORK.md).

Use the repo URL:

```text
https://github.com/thelandrygroup/aigtm
```

---

## Bring Your Own Keys (BYOK)

Most skills work without API keys because Claude can use its own browsing and file tools. Some workflows get stronger with optional keys such as Apollo, Hunter, Firecrawl, HubSpot, Salesforce, Vercel, Stripe, or Brandfetch.

```bash
cp setup/env.example ~/.claude/.env
chmod 600 ~/.claude/.env
```

Only add keys you actually use. Never commit `.env` files.

---

## All Skills

### Sales Execution

| Skill | ClearCo use case | Optional keys |
|-------|------------------|---------------|
| [Meeting Prep](skills/meeting-prep/) | Pre-call ClearCo briefing | FIRECRAWL, SERPER |
| [Prospect Research](skills/prospect-research/) | Account research, buyer targeting, outreach | APOLLO, HUNTER, FIRECRAWL |
| [Cold Email](skills/cold-email/) | ClearCo outbound emails and follow-up sequences | — |
| [Sequence](skills/sequence/) | Multi-channel ClearCo outbound cadence | SMARTLEAD, INSTANTLY, LEMLIST, HEYREACH |
| [ABM](skills/abm/) | Account plan with buying committee and lifecycle wedge | APOLLO, CLEARBIT |
| [Battlecard](skills/battlecard/) | Competitive or category battlecard | FIRECRAWL, SERPER |
| [Referral](skills/referral/) | Warm-intro path and forwardable intro copy | — |
| [Post-Call Summary](skills/post-call-summary/) | Debrief, follow-up, CRM summary | — |
| [Objection Handler](skills/objection-handler/) | Handle stuck deals and objections | — |
| [Deal Strategy](skills/deal-strategy/) | MEDDIC, stakeholders, risk, next plays | — |
| [Proposal](skills/proposal/) | Customer-facing proposal / SOW skeleton | STRIPE |
| [ROI Calculator](skills/roi-calculator/) | Business case and CFO questions | — |
| [One-Pager](skills/one-pager/) | Champion leave-behind | BRANDFETCH |

### Marketing

| Skill | ClearCo use case | Optional keys |
|-------|------------------|---------------|
| [Launch](skills/launch/) | ClearCo feature or campaign launch plan | — |
| [Campaign](skills/campaign/) | Persona/vertical campaign | — |
| [Messaging](skills/messaging/) | Positioning and value props | — |
| [PMM](skills/pmm/) | Product-marketing artifact suite | — |
| [Programmatic SEO](skills/programmatic-seo/) | Template-based pages at scale | DATAFORSEO |
| [SEO Audit](skills/seo-audit/) | Technical and on-page SEO audit | GA4, DATAFORSEO |
| [Website Audit](skills/website-audit/) | Buyer-eye website audit | — |
| [Competitor Alternatives](skills/competitor-alternatives/) | Alternatives landing page framing | FIRECRAWL |
| [Pricing Strategy](skills/pricing-strategy/) | Packaging and willingness-to-pay analysis | — |
| [Marketing Psychology](skills/marketing-psychology/) | Campaign psychology review | — |
| [Kit](skills/kit/) | Lead magnet or content kit | — |

### Cross-Functional

| Skill | ClearCo use case | Optional keys |
|-------|------------------|---------------|
| [Brainstorm](skills/brainstorm/) | Structured ideation for GTM plays | EXA |
| [Repurpose](skills/repurpose/) | Convert one asset into many formats | — |
| [Microsite](skills/microsite/) | Personalized account microsite | VERCEL, CLOUDFLARE, BRANDFETCH |
| [Changelog](skills/changelog/) | Release notes from git history | — |
| [Decision Log](skills/decision-log/) | Capture GTM/product decisions | — |
| [Roadmap](skills/roadmap/) | Prioritized roadmap with tradeoffs | — |

### Pipeline & Forecasting

| Skill | ClearCo use case | Optional keys |
|-------|------------------|---------------|
| [Pipeline Health](skills/pipeline-health/) | Pipeline risk and focus review | SALESFORCE, HUBSPOT |
| [Forecast Narrative](skills/forecast-narrative/) | Commit/upside/risk narrative | SALESFORCE, HUBSPOT |
| [Territory Analyzer](skills/territory-analyzer/) | Team or territory performance | SALESFORCE, HUBSPOT |

### Competitive & Market Intelligence

| Skill | ClearCo use case | Optional keys |
|-------|------------------|---------------|
| [Competitive Intel](skills/competitive-intel/) | Monitor named competitors and market moves | FIRECRAWL, SERPER |
| [Win/Loss Analyzer](skills/win-loss-analyzer/) | Find win/loss patterns | — |

### Customer Success & Retention

| Skill | ClearCo use case | Optional keys |
|-------|------------------|---------------|
| [QBR Builder](skills/qbr-builder/) | Customer QBR focused on value and next lifecycle step | — |
| [Churn Early Warning](skills/churn-early-warning/) | Risk signals and save plays | SALESFORCE, HUBSPOT |

### Leadership & Strategy

| Skill | ClearCo use case | Optional keys |
|-------|------------------|---------------|
| [Board Update](skills/board-update/) | Executive/investor narrative | — |
| [Hiring Brief](skills/hiring-brief/) | Role scope, JD, scorecard | — |

### Daily Operations

| Skill | ClearCo use case | Optional keys |
|-------|------------------|---------------|
| [Weekly Planner](skills/weekly-planner/) | Weekly revenue execution plan | — |
| [Inbox Triage](skills/inbox-triage/) | Email prioritization and draft replies | — |
| [CRM](skills/crm/) | Daily CRM priorities dashboard | — |
| [Standup](skills/standup/) | Morning priorities and blockers | — |
| [Inbox Zero](skills/inbox-zero/) | Subject/thread triage | — |
| [Focus Time](skills/focus-time/) | Calendar-based focus plan | — |

### File Utilities

| Skill | What it does | Libraries |
|-------|--------------|-----------|
| [xlsx](skills/xlsx/) | Read/edit/create Excel and CSV spreadsheets | openpyxl, pandas |
| [docx](skills/docx/) | Read/edit/create Word documents | python-docx, Pillow |
| [pdf](skills/pdf/) | Extract/merge/split/create/OCR PDFs | pypdf, pdfplumber, weasyprint, ocrmypdf |
| [pptx](skills/pptx/) | Read/edit/create PowerPoint decks | python-pptx |

### Business Operations Utilities

These originated as SMB owner-operator helpers. In this ClearCo fork, use them for public-safe operating workflows, internal planning, customer-facing drafts, and business analysis where relevant.

| Skill | ClearCo use case |
|-------|------------------|
| [Bookkeeping Helper](skills/bookkeeping-helper/) | Categorize pasted transactions for business review |
| [Invoice Generator](skills/invoice-generator/) | Draft professional invoices |
| [Cash Flow Forecast](skills/cash-flow-forecast/) | 13-week cash projection from pasted inputs |
| [Tax Prep Helper](skills/tax-prep-helper/) | CPA-ready prep checklist; not tax advice |
| [Customer Support Triage](skills/customer-support-triage/) | Triage customer messages and escalations |
| [Review Response](skills/review-response/) | Draft public review replies |
| [Local Marketing](skills/local-marketing/) | Local/field marketing checklist |
| [Pricing Services](skills/pricing-services/) | Service pricing and margin thinking |
| [Hiring Kit](skills/hiring-kit/) | JD, screening questions, interview rubric |
| [SOP Writer](skills/sop-writer/) | Process documentation |
| [Contract Review](skills/contract-review/) | Plain-English contract risk summary; not legal advice |
| [Vendor Evaluation](skills/vendor-evaluation/) | Weighted vendor scorecard |
| [Owner Dashboard](skills/owner-dashboard/) | Weekly operator dashboard |

---

## What Gets Installed

| Phase | Tool | What it is |
|:-:|:--|:--|
| 1 | Xcode Command Line Tools / Git | git + compilers / source control |
| 2 | Homebrew / winget | Package manager |
| 3 | Developer tools | mise/fnm, jq, gh, fzf, bat, ripgrep, fd, tree, direnv, httpie |
| 3 | Content tools | pandoc, poppler, imagemagick, ffmpeg, tesseract, yt-dlp |
| 4 | Node.js 24 + Python 3.13 | Runtime dependencies |
| 5 | Claude Code CLI | `@anthropic-ai/claude-code` |
| 6 | Public CLIs | vercel, stripe, supabase, wrangler, netlify, agent-browser |
| 7 | `.env` BYOK setup | Local key scaffold at `~/.claude/.env` |
| 8 | ClearCo AI GTM skills | Linked into `~/.claude/skills/` |
| 9 | GitHub auth | Optional `gh auth login` |
| 10 | Shell configuration | PATH, fzf, aliases, `.env` auto-source |

The scripts are idempotent. Re-running them heals missing pieces without overwriting your local `.env`.

---

## Customize Your Skills

The repo already includes ClearCo context. Customize only what is local to you:

- Your role, territory, segment, quota, and current priorities.
- Your approved proof points and customer references.
- Your current competitors and displacement rules.
- Your team's stage names, CRM fields, and forecast categories.
- Your suppression lists and data-handling rules.

See [`CUSTOMIZATION.md`](CUSTOMIZATION.md).

---

## How Skills Work

Each skill folder can contain:

```text
skills/meeting-prep/
├── SKILL.md            # Claude Code skill definition
├── CLEARCO.md          # ClearCo-specific overlay for that skill, where present
├── COWORK-PROMPT.md    # Copy-paste version for Claude Desktop/Cowork, where present
└── README.md           # Skill-level notes, where present
```

Use `SKILL.md` for the core task logic, `CLEARCO.md` for ClearCo-specific application, and the top-level `CLEARCO.md` for shared context.

---

## Troubleshooting

**`command not found: claude` after install**
Close and reopen your terminal, or run `source ~/.zshrc` on macOS / restart PowerShell on Windows.

**`npm: command not found` during install**
On macOS, run `export PATH="$HOME/.local/share/mise/shims:$PATH"` and rerun the script. On Windows, reopen PowerShell so `fnm` and Node are on PATH.

**Skills not activating in Claude Code**
Check that skills are linked: `ls ~/.claude/skills/`. If empty, rerun `./setup/bootstrap.sh` or `./setup/bootstrap.ps1`.

**Windows symlink permission error**
Enable Developer Mode or run PowerShell as Administrator. The Windows script falls back to copying skills if symlinks fail.

**Env vars not loading**
Rerun the bootstrap script or manually source `~/.claude/.env`.

**Verify setup**

```bash
./setup/bootstrap.sh --check
```

```powershell
.\setup\bootstrap.ps1 -Check
```

---

## About This Fork

This is a ClearCo-tailored fork of the AI GTM skills repo. The purpose is practical revenue execution: better prep, better discovery, better follow-up, better deal strategy, better pipeline hygiene, and stronger public-safe GTM outputs.

Original skill architecture credit remains with the source project. This fork adds ClearCo context and guardrails for internal GTM use.

---

*Fork it, customize it, keep customer data private.*
