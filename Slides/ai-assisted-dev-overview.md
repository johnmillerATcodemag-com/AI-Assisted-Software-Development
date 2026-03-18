---
ai_generated: true
model: "anthropic/claude-sonnet-4.5@2026-03-18"
operator: "johnmillerATcodemag-com"
chat_id: "merge-marp-decks-20260318"
prompt: |
  Follow instructions in merge-marp-decks.prompt.md — merge all individual Marp slide
  decks from Slides/individual-slides/ into a single combined presentation
started: "2026-03-18T22:41:07Z"
ended: "2026-03-18T23:15:00Z"
task_durations:
  - task: "read individual decks"
    duration: "00:05:00"
  - task: "assemble combined deck"
    duration: "00:20:00"
  - task: "add section dividers and speaker notes"
    duration: "00:08:00"
total_duration: "00:33:00"
ai_log: "ai-logs/2026/03/18/merge-marp-decks-20260318/conversation.md"
source: ".github/copilot/Promptfiles/merge-marp-decks.prompt.md"
marp: true
theme: default
paginate: true
---

# AI-Assisted Software Development

## Complete Training Course

*GitHub Copilot · CQRS · Dependency Management · GitHub CLI*

::: notes
Welcome to the AI-Assisted Software Development complete training course. This is the combined presentation covering all modules: AI output standards, CQRS architecture, dependency management policy, GitHub CLI workflows, and creating custom GitHub Copilot agents.

**Timing**: 1 minute

**Course Overview**:
This deck merges five individual module presentations into a single comprehensive course. Each module is separated by a section divider slide so you can navigate or present individual sections.

**Modules in This Deck**:
1. AI-Assisted Output — provenance, logging, and quality standards
2. CQRS Architecture — command query responsibility segregation
3. Dependency Management Policy — secure and compliant dependencies
4. GitHub CLI — terminal-based GitHub workflows
5. Creating Custom Agents — specialized GitHub Copilot agents

**Delivery Options**:
- Present all modules end-to-end as a full-day training
- Present individual sections standalone using the section dividers as entry points
- Use as a reference deck for self-paced learning

**Transition**: "Let's begin with the first module: AI-Assisted Output standards."
:::

---

<!-- ============================================================ -->
<!-- MODULE 1: AI-ASSISTED OUTPUT -->
<!-- ============================================================ -->

# Module 1

## AI-Assisted Output

*Provenance, Logging & Quality Standards*

::: notes
This section divider marks the start of Module 1: AI-Assisted Output.

**Module Duration**: Approximately 20–25 minutes

**Module Objectives**:
- Understand why AI provenance metadata is required
- Learn the required fields and where to place them
- Understand the ai-logs folder structure and logging workflow
- Know the quality gates and CI enforcement mechanisms
- Complete the post-creation checklist after every AI artifact

**Prerequisites**: Basic familiarity with Markdown and YAML front matter.

**Transition**: "Let's start with why provenance matters."
:::

---

# AI-Assisted Output

## Provenance, Logging & Quality Standards

*AI-Assisted Software Development*

::: notes
Welcome to this module on AI-Assisted Output standards. This session covers the policies and practices for ensuring all AI-generated artifacts in a development repository include proper provenance metadata, audit logs, and quality checks.

**Timing**: 1 minute for title slide

**Key Points**:
- All AI-assisted artifacts must carry metadata documenting how they were produced
- Proper logging enables audits and team understanding of AI contributions
- These standards apply to code, docs, diagrams, tests, and data

**Delivery**: Start by asking how many in the audience have worked with AI-generated code. Establish why tracking AI provenance matters for team trust and code quality.

**Transition**: "Let's start with why provenance matters and what we mean by AI-assisted output."
:::

---

## Why AI Provenance Matters

- **Auditability** — know exactly how each artifact was produced
- **Trust** — teams can review and verify AI contributions
- **Reproducibility** — recreate outputs when needed
- **Accountability** — track who triggered which AI task
- **Quality gates** — block non-compliant artifacts in CI

::: notes
AI provenance is the practice of recording the origin of AI-generated artifacts — who requested them, which model produced them, and from which conversation.

**Timing**: 2 minutes

**Key Points**:
- Without provenance, AI contributions become a black box
- Audits become impossible when metadata is missing
- CI enforcement ensures standards are followed consistently
- Trust is built when the team understands AI's role in each artifact

**Example**: Imagine a bug in production traced back to AI-generated code with no record of the prompt or model version — debugging becomes much harder.

**Audience Interaction**: "How many of you have received AI-generated code where you couldn't tell what prompt produced it?"

**Transition**: "So what metadata do we actually need to capture?"
:::

---

## Required Provenance Metadata

Every AI-assisted artifact must embed:

```yaml
ai_generated: true
model: "provider/model-name@version"
operator: "github-username"
chat_id: "unique-chat-identifier"
prompt: |
  Exact prompt text
started: "ISO8601-timestamp"
ended: "ISO8601-timestamp"
task_durations:
  - task: "task name"
    duration: "HH:MM:SS"
total_duration: "HH:MM:SS"
ai_log: "ai-logs/yyyy/mm/dd/chat-id/conversation.md"
source: "creator-identifier"
```

::: notes
These 10 fields form the canonical provenance block for every AI-generated file.

**Timing**: 3 minutes

**Key Points**:
- `model` must use the `provider/model@version` format — not "github/copilot" or "Auto"
- `chat_id` links back to the full conversation log
- `prompt` should be the exact text that triggered creation
- `task_durations` breaks down where time was spent
- `ai_log` path must exist in the repository

**Common Mistakes**:
- Using vague model names like "Claude" instead of "anthropic/claude-3.5-sonnet@2024-10-22"
- Omitting the `prompt` field or using a summary instead of exact text
- Forgetting to create the ai-log file after generating the artifact

**Transition**: "Where exactly do these fields go in a file?"
:::

---

## Metadata Placement Policy

| File Type | Where to Put Metadata |
|-----------|----------------------|
| Markdown (`.md`) | YAML front matter at top of file |
| Code files | Header comment block |
| Binary/Image | Sidecar `<filename>.meta.md` |
| JSON/YAML | Top-level `_ai_provenance` key |

> **Rule**: Sidecar files are prohibited for Markdown — always embed.

::: notes
The placement policy ensures metadata is co-located with the artifact it describes.

**Timing**: 2 minutes

**Key Points**:
- Markdown files use YAML front matter — the `---` delimited block at the top
- Sidecars are only for formats that cannot embed metadata (images, binaries)
- Never create a sidecar for a Markdown file — this is explicitly prohibited

**Practical Example**:
Show a Markdown file with embedded front matter vs. a sidecar for a PNG diagram.

**Transition**: "Now let's talk about the logging workflow — what goes in the ai-logs folder."
:::

---

## AI Chat Logging Workflow

```
ai-logs/
└── <yyyy>/
    └── <mm>/
        └── <dd>/
            └── <chat-id>/
                ├── conversation.md  ← Full exchange log
                └── summary.md       ← Resumability context
```

**Before starting**: Create log directory and files  
**During work**: Record each exchange  
**After completion**: Write summary with next steps

::: notes
The ai-logs folder is the audit trail for all AI-assisted work. It must be created before generating any artifacts.

**Timing**: 2 minutes

**Key Points**:
- Chat ID must be unique — use descriptive names like `create-user-auth-20260318`
- `conversation.md` records each prompt-response exchange
- `summary.md` captures what was produced and what comes next
- Logs must exist before committing the artifact — don't create them retroactively

**Workflow Order**:
1. Create the ai-logs directory structure first
2. Record the initial prompt
3. Create the artifact
4. Record the exchange in conversation.md
5. Write summary.md

**Transition**: "What should the conversation.md contain?"
:::

---

## Quality Gates & CI Enforcement

**PR Checklist** (required before merge):
- [ ] All AI artifacts have complete provenance front matter
- [ ] `ai_log` path exists in the repository
- [ ] Model uses `provider/model@version` format
- [ ] Conversation log has at least one exchange recorded
- [ ] README updated with artifact entry and log link

**CI Checks**:
- Lint YAML front matter structure
- Verify ai-log path exists
- Block merge if required fields are missing

::: notes
CI enforcement turns the policy into hard requirements — not suggestions.

**Timing**: 2 minutes

**Key Points**:
- The PR checklist should be in the PR template so it's visible during review
- CI can use a simple script to check for required YAML fields
- Blocking merge is intentional — it creates a forcing function for compliance
- The README update requirement ensures discoverability of AI artifacts

**Implementation Tip**: Use a GitHub Actions workflow that checks for `ai_generated: true` in all changed Markdown files and validates required fields.

**Transition**: "Let's cover the post-creation requirements that complete the workflow."
:::

---

## Post-Creation Requirements

After every AI-assisted artifact:

1. ✅ **Conversation log** — `ai-logs/.../conversation.md` created
2. ✅ **Summary** — `ai-logs/.../summary.md` with resumability context  
3. ✅ **README update** — entry with description and log link
4. ✅ **Metadata verified** — all required provenance fields present
5. ✅ **Links validated** — all internal references work

> These steps are **canonical** — referenced by all other instruction files.

::: notes
The post-creation checklist is the final gate before committing AI-generated work.

**Timing**: 2 minutes

**Key Points**:
- All 5 steps must be completed — they are not optional
- "Resumability context" in the summary means future AI sessions can pick up where this one left off
- The README update makes artifacts discoverable to the team
- Link validation prevents broken references in documentation

**Common Failure Mode**: Teams often skip the summary.md because they're in a hurry. Emphasize that this is the most valuable artifact for future sessions.

**Transition**: "Module 1 complete. Next: CQRS Architecture."
:::

---

<!-- ============================================================ -->
<!-- MODULE 2: CQRS ARCHITECTURE -->
<!-- ============================================================ -->

# Module 2

## CQRS Architecture

*Command Query Responsibility Segregation*

::: notes
This section divider marks the start of Module 2: CQRS Architecture.

**Module Duration**: Approximately 25–30 minutes

**Module Objectives**:
- Understand when to use and when to avoid CQRS
- Learn the core principles and architectural components
- Design effective command and query models
- Understand consistency strategies and the outbox pattern
- Recognize common anti-patterns and migration strategies

**Prerequisites**: Familiarity with REST APIs, basic database concepts, and event-driven architecture concepts is helpful.

**Transition**: "Let's start with when CQRS makes sense — and when it doesn't."
:::

---

# CQRS Architecture

## Command Query Responsibility Segregation

*AI-Assisted Software Development*

::: notes
Welcome to the CQRS Architecture module. This session covers Command Query Responsibility Segregation — a pattern that separates read and write operations into distinct models to improve scalability and maintainability.

**Timing**: 1 minute for title slide

**Key Points**:
- CQRS separates write (command) operations from read (query) operations
- Enables independent scaling and optimization of each model
- Useful when read and write workloads have very different characteristics

**Delivery**: Begin by asking the audience about pain points with traditional CRUD APIs — high query complexity, slow writes due to query-optimized schemas, or contention between reads and writes.

**Transition**: "Let's start with when CQRS makes sense — and when it doesn't."
:::

---

## When to Use CQRS

**✅ Use CQRS when:**
- Read and write workloads scale differently
- Read models need denormalization, caching, or projections
- Write model needs strong invariants and task-focused workflows
- Auditing or event sourcing is required
- Query complexity slows transactional throughput

**❌ Avoid CQRS when:**
- Domain is small and reads/writes are balanced
- No clear boundary between commands and queries
- Operational overhead is not justified

::: notes
CQRS is a powerful pattern but it adds operational complexity. Use it only when the benefits outweigh the costs.

**Timing**: 3 minutes

**Key Points**:
- The classic CRUD pattern couples reads and writes to the same model — fine for simple domains
- CQRS shines when the query model needs to be radically different from the write model
- Event sourcing almost always pairs with CQRS
- Small teams or simple domains should avoid CQRS due to added complexity

**Real-World Example**: An e-commerce order system where writes go through strict business validation but reads need highly denormalized views for catalog search, order history dashboards, and analytics.

**Transition**: "Let's look at the core principles."
:::

---

## Core Principles

| Principle | Detail |
|-----------|--------|
| **Separation** | Commands change state; queries never change state |
| **Invariants** | Write model enforces all business rules |
| **Optimization** | Read model is shaped for query use cases |
| **Independence** | Models can evolve separately |
| **Consistency** | Eventual consistency between write and read |

> Commands can fail. Queries should not.

::: notes
These five principles guide every CQRS implementation decision.

**Timing**: 2 minutes

**Key Points**:
- The read/write separation is absolute — queries must be side-effect free
- Write model is where business logic lives — all invariants enforced here
- Read models are projections built from the write model's events
- Independence is key — you can evolve the read schema without touching write logic
- Eventual consistency is usually acceptable; design for it intentionally

**Transition**: "What are the actual architectural components we need to build?"
:::

---

## Architecture Components

```
┌─────────────┐    ┌──────────────────┐    ┌────────────┐
│  Command    │───▶│  Command Handler  │───▶│ Write Store│
│    API      │    │  (Domain Logic)   │    │  (OLTP)    │
└─────────────┘    └──────────────────┘    └─────┬──────┘
                                                 │ Events
                   ┌──────────────────┐          ▼
┌─────────────┐    │    Projection    │    ┌────────────┐
│  Query API  │◀───│    Updater       │◀───│  Publisher │
└─────────────┘    └──────────────────┘    └────────────┘
        │                                  ┌────────────┐
        └─────────────────────────────────▶│ Read Store │
                                           │  (OLAP)    │
                                           └────────────┘
```

::: notes
This diagram shows the minimum components for a CQRS implementation.

**Timing**: 3 minutes

**Walk Through the Diagram**:
1. Command API receives write requests and routes to handlers
2. Command Handler orchestrates domain logic and writes to the Write Store
3. Events are published after successful writes
4. Projection Updater subscribes to events and updates the Read Store
5. Query API serves the Read Store with fast, optimized queries

**Transition**: "Let's look at command model design in more detail."
:::

---

## Consistency Strategy

**Strong Consistency** — needed for:
- Payments and financial transactions
- Inventory management
- Security and access control

**Eventual Consistency** — acceptable for:
- Activity feeds and notifications
- Analytics dashboards
- Search indexes and recommendations

**Reliable Event Publication** — use the Outbox Pattern:
> Write event to database table atomically with domain change → background process publishes → idempotent consumers

::: notes
Consistency is often the most debated aspect of CQRS implementations.

**Timing**: 3 minutes

**Key Points**:
- Not all data requires strong consistency — choosing the right model reduces complexity
- The Outbox Pattern is the industry standard for reliable event publishing
- "Dual writes" (write to DB and publish in the same transaction) are dangerous — use the outbox
- Idempotent consumers handle duplicate event delivery gracefully

**Transition**: "What common mistakes should we avoid?"
:::

---

## Anti-Patterns & Migration

**Anti-Patterns to Avoid**:
| Anti-Pattern | Problem |
|-------------|---------|
| Mixed query in command handler | Breaks separation of concerns |
| Shared ORM model for reads/writes | Couples both models |
| CQRS on simple CRUD | Unnecessary complexity |
| Dual writes without outbox | Risk of lost events |

**Migration Strategy**:
1. Identify one bounded context
2. Split read model first
3. Add projections incrementally
4. Introduce event publishing after stable write flow

::: notes
These anti-patterns are the most common mistakes. The migration strategy makes adoption safer.

**Timing**: 2 minutes

**Key Points**:
- Over-engineering is real — CQRS adds complexity worth it only in the right domains
- Incremental migration reduces risk — don't migrate everything at once
- Start with reporting use cases — lower risk than transactional paths

**Transition**: "Module 2 complete. Next: Dependency Management Policy."
:::

---

<!-- ============================================================ -->
<!-- MODULE 3: DEPENDENCY MANAGEMENT POLICY -->
<!-- ============================================================ -->

# Module 3

## Dependency Management Policy

*Secure, Compliant, and Maintainable Dependencies*

::: notes
This section divider marks the start of Module 3: Dependency Management Policy.

**Module Duration**: Approximately 25–30 minutes

**Module Objectives**:
- Understand dependency risk classification
- Learn the selection criteria and approval workflow
- Implement version management and auto-update policies
- Set up security vulnerability monitoring with SLAs
- Understand license compliance requirements
- Know the emergency patching process

**Prerequisites**: Basic familiarity with package managers (npm, pip, Maven) and CI/CD pipelines.

**Transition**: "Let's start with how we classify dependencies by risk level."
:::

---

# Dependency Management Policy

## Secure, Compliant, and Maintainable Dependencies

*AI-Assisted Software Development*

::: notes
Welcome to the Dependency Management Policy module. This session covers how to select, approve, monitor, and maintain software dependencies in a secure and compliant way.

**Timing**: 1 minute for title slide

**Key Points**:
- Dependencies are a major attack surface — supply chain attacks are increasing
- Policy-driven dependency management balances velocity with security
- The right tooling automates most compliance checks

**Delivery**: Start with a question: "How many of you have shipped a dependency vulnerability to production?" This grounds the conversation in real risk.

**Transition**: "Let's look at how we classify dependencies by risk level."
:::

---

## Dependency Classification

| Category | Risk | Examples |
|----------|------|----------|
| **Production** | Highest | Runtime libs, frameworks, DB drivers |
| **Development** | Medium | Build tools, test frameworks, linters |
| **AI/ML** | Special | Model packages, inference engines |
| **Infrastructure** | System Critical | Container images, cloud SDKs |

**Risk Matrix**:
- **Critical** → Architecture + Security + Legal review
- **High** → Technical + Security scan + License check
- **Medium** → Technical review + Automated scanning
- **Low** → Automated approval with post-review

::: notes
Not all dependencies are equal — risk-based classification drives the right level of review.

**Timing**: 3 minutes

**Key Points**:
- Production dependencies have the highest impact if compromised
- AI/ML dependencies are a special category with unique considerations (model files, GPU compatibility)
- Infrastructure dependencies affect the entire system lifecycle
- The risk matrix determines how much review a dependency needs before adoption

**Transition**: "How do we actually decide whether to adopt a new dependency?"
:::

---

## Selection & Version Management

**Must Requirements**:
- ✅ Active maintenance (commits within 6 months)
- ✅ Compatible license
- ✅ No known critical vulnerabilities
- ✅ Supports current target platforms

**Version Pinning Strategy**:
```yaml
production: "exact"        # react: 18.2.0
development: "patch"       # eslint: ^8.45.0
ai_ml: "minor-locked"      # tensorflow: ~2.13.0
```

**Auto-Update Rules**:
- Security patches → auto-merge after tests pass
- Minor versions → Tech Lead approval required
- Major versions → Architecture Board review

::: notes
Selection criteria and versioning policies create predictable, safe dependency management.

**Timing**: 3 minutes

**Key Points**:
- All "must" requirements are binary gates — failing any disqualifies the package
- Pinning production versions ensures reproducible builds
- Security patches should auto-deploy — the risk of not patching exceeds the update risk
- AI/ML packages need minor-locked pinning because model compatibility often requires specific framework versions

**Transition**: "How do we monitor for new vulnerabilities?"
:::

---

## Security Monitoring & License Compliance

**Vulnerability Response SLAs**:

| Severity | CVSS | Response | Patch |
|----------|------|----------|-------|
| Critical | 9.0–10.0 | 4 hours | 24 hours |
| High | 7.0–8.9 | 24 hours | 72 hours |
| Medium | 4.0–6.9 | 72 hours | 1 week |

**Approved Licenses** (auto-accept):
- MIT, Apache 2.0, BSD 2/3-Clause, ISC

**Prohibited** (without legal approval):
- GNU GPL/AGPL in proprietary software

::: notes
Security monitoring and license compliance are complementary concerns — both need automated tooling.

**Timing**: 3 minutes

**Key Points**:
- SLAs create accountability for security response
- Critical CVEs (9+) need immediate escalation — page on-call if needed
- License violations can result in legal liability — automate checking in CI
- AGPL is especially dangerous for SaaS — network use triggers copyleft requirements

**Tool Stack**: GitHub Dependabot + Snyk for security; FOSSA or WhiteSource for license compliance.

**Transition**: "What about protecting against supply chain attacks?"
:::

---

## Supply Chain Security & Automation

**Verification Practices**:
- ✅ Official registries only (npm, PyPI, Maven Central)
- ✅ Checksum verification for all packages
- ✅ Digital signature validation where available
- ✅ Maintainer 2FA requirement

**Dependabot Configuration**:
```yaml
version: 2
updates:
  - package-ecosystem: "npm"
    schedule:
      interval: "weekly"
    open-pull-requests-limit: 5
    reviewers: ["tech-leads"]
```

**Emergency Patching**: Critical (CVSS 9+) → deploy within 24 hours, CISO approval sufficient

::: notes
Supply chain security and automated updates work together to keep the dependency tree safe.

**Timing**: 2 minutes

**Key Points**:
- Supply chain attacks are now top-tier threats — SolarWinds, XZ Utils, npm package attacks
- Dependabot automation removes manual tracking burden
- Emergency patching bypasses normal approval gates — but must be documented
- Always have a rollback plan before deploying emergency patches

**Quick Win**: Enable Dependabot alerts today — free, 5 minutes to configure, immediate value.

**Transition**: "Module 3 complete. Next: GitHub CLI."
:::

---

<!-- ============================================================ -->
<!-- MODULE 4: GITHUB CLI -->
<!-- ============================================================ -->

# Module 4

## GitHub CLI

*Supercharge Your GitHub Workflow from the Terminal*

::: notes
This section divider marks the start of Module 4: GitHub CLI.

**Module Duration**: Approximately 20–25 minutes

**Module Objectives**:
- Manage issues and pull requests from the terminal
- Monitor and control GitHub Actions workflows
- Integrate `gh` with CI/CD pipelines and IDEs
- Know the essential daily commands

**Prerequisites**: Basic command-line familiarity and a GitHub account.

**Setup**: If participants don't have `gh` installed, now is a good time: `brew install gh` then `gh auth login`.

**Transition**: "Let's start with issue management — one of the most common daily tasks."
:::

---

# GitHub CLI

## Supercharge Your GitHub Workflow from the Terminal

*AI-Assisted Software Development*

::: notes
Welcome to the GitHub CLI module. This session covers the `gh` command-line tool and how it can dramatically speed up your GitHub workflows without ever leaving the terminal.

**Timing**: 1 minute for title slide

**Delivery**: Ask how many people still open the browser to check PR status or create issues. The `gh` tool eliminates most of that context-switching.

**Transition**: "Let's start with managing issues."
:::

---

## Issue & PR Management

**Issue Commands**:
```bash
gh issue create --title "Bug" --label "bug" --assignee @me
gh issue list --state open --assignee @me
gh issue close 123 --comment "Fixed in PR #456"
```

**PR Commands**:
```bash
gh pr create --title "feat: new feature" --draft
gh pr list --author @me
gh pr checkout 456        # Check out locally
gh pr checks 456          # View CI status
gh pr merge 456 --squash  # Merge
gh pr merge 456 --auto    # Auto-merge when checks pass
```

::: notes
Issue and PR management are the most common daily uses of the GitHub CLI.

**Timing**: 3 minutes

**Key Points**:
- `gh issue create` without flags launches an interactive editor
- `--assignee @me` auto-assigns to the current user
- `gh pr checkout` is the most underused but most time-saving command
- `--auto` queues auto-merge once all CI checks pass

**Productivity Tip**: `alias myissues='gh issue list --assignee @me --state open'`

**Transition**: "Now let's look at managing GitHub Actions."
:::

---

## GitHub Actions Management

**Monitor Workflows**:
```bash
gh run list --status=failure      # Find failures
gh run view 123456 --log          # View logs
gh run watch 123456               # Follow live output
gh run rerun 123456 --failed-jobs # Rerun failures only
```

**Control Workflows**:
```bash
gh workflow list
gh workflow run ci.yml
gh workflow run deploy.yml -f environment=production
```

**CI/CD Integration**:
```yaml
- name: Comment on PR
  run: gh pr comment ${{ github.event.number }} \
         --body "✅ Tests passed!"
  env:
    GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

::: notes
Managing GitHub Actions from the CLI is invaluable during debugging and deployments.

**Timing**: 3 minutes

**Key Points**:
- `gh run list --status=failure` is the fastest way to find broken builds
- `gh run watch` follows live output — great for monitoring deployments
- `gh run rerun --failed-jobs` only reruns failed jobs, not the whole workflow
- In Actions, `gh` is pre-installed — just set `GITHUB_TOKEN`

**Transition**: "Here's the essential commands reference."
:::

---

## Essential Commands Reference

| Task | Command |
|------|---------|
| Create issue | `gh issue create` |
| Create PR | `gh pr create` |
| Check out PR | `gh pr checkout 456` |
| View CI status | `gh pr checks 456` |
| Merge PR | `gh pr merge 456 --squash` |
| View run logs | `gh run view 123456 --log` |
| Rerun failures | `gh run rerun 123456 --failed-jobs` |
| Trigger workflow | `gh workflow run ci.yml` |
| Approve PR | `gh pr review 456 --approve` |
| Auto-merge | `gh pr merge 456 --auto` |

**Setup**: `brew install gh` → `gh auth login` → `eval "$(gh completion -s bash)"`

::: notes
This quick reference covers the commands used 90% of the time.

**Timing**: 2 minutes

**Key Points**:
- These 10 commands replace most browser-based GitHub workflows
- Shell completions dramatically improve discoverability — install immediately
- `gh pr checkout` is the most underused but most time-saving command
- All commands support `--help` for full option reference

**Call to Action**: Install `gh` right now and run `gh issue list --assignee @me` to see your current issues. Takes less than 5 minutes to set up.

**Transition**: "Module 4 complete. Next: Creating Custom Agents."
:::

---

<!-- ============================================================ -->
<!-- MODULE 5: CREATING CUSTOM AGENTS -->
<!-- ============================================================ -->

# Module 5

## Creating Custom Agents

*Specialized AI Assistants for Your Workflow*

::: notes
This section divider marks the start of Module 5: Creating Custom Agents.

**Module Duration**: Approximately 30–35 minutes

**Module Objectives**:
- Understand what GitHub Copilot custom agents are
- Learn how to create agents on GitHub.com and in IDEs
- Understand the agent file structure and configuration
- See practical examples of specialized agents
- Learn best practices for agent design

**Prerequisites**: Basic familiarity with GitHub Copilot and Markdown.

**Transition**: "Let's start by understanding what custom agents are."
:::

---

# Creating Custom Agents

## Specialized AI Assistants for Your Workflow

GitHub Copilot Custom Agents

::: notes
Welcome to this presentation on creating custom agents for GitHub Copilot. This session will teach you how to create specialized AI assistants tailored to specific development tasks and workflows.

**Timing**: 1 minute for title slide

**Key Points**:

- Custom agents extend GitHub Copilot's capabilities
- Allow specialization for specific tasks and domains
- Available across multiple development environments

**Delivery**: Start with a brief overview of what custom agents are and why they're valuable. Gauge audience familiarity with GitHub Copilot before diving into details.

**Transition**: "Let's start by understanding what custom agents are and how they can enhance your development workflow."
:::

---

## What Are Custom Agents?

**Custom agents** are specialized AI assistants that extend GitHub Copilot with domain-specific expertise, tools, and behaviors.

**Key Characteristics:**
- Defined in `.github/agents/` as `.agent.md` files
- Have specific personas, tools access, and instructions
- Available across GitHub.com and multiple IDEs
- Can be scoped to repository or organization level

**Why Create Custom Agents?**
- Standardize AI assistance for specific workflows
- Encode team knowledge and best practices
- Restrict tool access for safety-critical tasks
- Improve consistency across team members

::: notes
Custom agents transform GitHub Copilot from a general-purpose assistant into specialized tools for specific workflows.

**Timing**: 3 minutes

**Key Points**:

- Agents are defined in Markdown files with YAML front matter
- Each agent has a specific persona, tool set, and set of instructions
- Organizations can share agents across repositories
- Agents can have restricted tool access for security-sensitive domains

**Real-World Value**: A security-reviewer agent that can only read files and create issues is much safer than giving full access to an AI that's performing security analysis.

**Transition**: "Let's look at how to create agents on GitHub.com."
:::

---

## Where to Create Custom Agents

### GitHub.com
Navigate to `github.com/copilot/agents`:
1. Select repository
2. Click Copilot icon → "Create an agent"
3. Edit template `my-agent.agent.md` in `.github/agents/`

### IDEs
Available in VS Code, JetBrains, Eclipse, and Xcode:
1. Open GitHub Copilot Chat
2. Click agents dropdown → "Configure Custom Agents..."
3. Click "+ Create new custom agent"
4. Choose repository or user profile location

::: notes
Agents can be created through GitHub.com's interface or directly in your IDE.

**Timing**: 2 minutes

**Key Points**:
- The GitHub.com interface provides a template to get started quickly
- IDE creation is useful for personal agents or immediate testing
- Repository-level agents (in `.github/agents/`) are shared with all collaborators
- Organization-level agents go in the `agents/` root directory

**Delivery Note**: If possible, demonstrate the creation flow in VS Code. The UI is intuitive once you've seen it once.

**Transition**: "Now let's look at the step-by-step process for creating on GitHub."
:::

---

## Creating on GitHub: Step-by-Step

1. Navigate to `github.com/copilot/agents`
2. Select your repository from the dropdown
3. Optionally select a branch (default: main)
4. Click the Copilot icon → **"Create an agent"**
5. Edit the template `my-agent.agent.md`
6. Move file to `.github/agents/` directory
7. Rename with descriptive kebab-case name
8. Configure YAML frontmatter and write prompt
9. Commit to repository, merge to default branch
10. Agent appears in Copilot dropdown ✓

::: notes
The GitHub.com creation process is straightforward but requires understanding the file structure.

**Timing**: 3 minutes

**Step-by-Step Commentary**:
- Step 4: The Copilot icon is in the repository header area
- Step 6: Agents MUST be in `.github/agents/` for repository scope
- Step 7: Filenames must use kebab-case with `.agent.md` extension
- Step 9: Changes take effect after merging to the default branch

**Common Mistake**: Creating the agent file in the wrong directory. It must be exactly `.github/agents/` for repository-level scope.

**Transition**: "What about creating agents directly in VS Code?"
:::

---

## Creating in VS Code

1. Open GitHub Copilot Chat
2. Click agents dropdown (bottom of chat)
3. Select **"Configure Custom Agents..."**
4. Click **"+ Create new custom agent"**
5. Choose location:
   - **Repository** → `.github/agents/`
   - **User Profile** → personal workspace agents
6. Enter filename (e.g., `security-analyzer.agent.md`)
7. Configure `.agent.md` file
8. **Save** → Agent available immediately

::: notes
VS Code provides a convenient UI for creating and managing agents with immediate feedback.

**Timing**: 2 minutes

**Unique Advantage of VS Code**:
- User profile agents are personal and available across all workspaces
- Repository agents take effect immediately for testing (before merging)
- The IDE shows the agent in the dropdown as soon as the file is saved

**Troubleshooting**: If the agent doesn't appear in VS Code, check that the file uses the `.agent.md` extension and is in the correct directory.

**Transition**: "Let's look at the structure of an agent profile file."
:::

---

## Agent Profile Structure

```markdown
---
name: security-analyzer
description: Expert security analyst for vulnerability detection
tools: ["read", "search", "create_issue", "github"]
---

You are a security specialist focused on [domain].

## Core Expertise
- Vulnerability Detection: OWASP Top 10, CWE
- Static Analysis: Security anti-patterns

## Analysis Approach
1. Reconnaissance: Identify attack surfaces
2. Threat Modeling: Map data flows
3. Vulnerability Scan: Check OWASP Top 10

## Key Principles
- Focus on security issues only
- Provide actionable remediation guidance
```

::: notes
The agent file structure defines both the agent's identity and its capabilities.

**Timing**: 3 minutes

**Front Matter Fields**:
- `name`: Display name in the agents dropdown (defaults to filename)
- `description`: Shown when selecting agents — make it specific!
- `tools`: Array of tool names the agent can use (omit for all tools)

**Content Sections**:
- Mission statement: 1-3 paragraphs defining role and value
- Core expertise: 5-10 specific capability areas
- Approach/methodology: How the agent works
- Key principles: What it should and shouldn't do

**Character Limit**: Agent prompts are limited to 30,000 characters.

**Transition**: "Let's look at some practical examples."
:::

---

## Example 1: Testing Specialist

```markdown
---
name: test-specialist
description: Testing expert focused on test coverage without
             modifying production code
tools: ["read", "search", "create", "edit", "test"]
---
You are a testing specialist. Focus ONLY on test files.
Never modify production code unless specifically requested.

## Core Expertise
- Unit Testing: Isolation, mocking, assertion patterns
- Integration Testing: Component interactions
- Test Design: AAA pattern, Given-When-Then

## Approach
1. Analyze existing tests
2. Identify coverage gaps
3. Write tests following best practices
4. Verify coverage metrics

## Constraints
- Test files only
- No production code changes
- Always use AAA pattern
```

::: notes
The testing specialist demonstrates scope restriction — a key safety feature of custom agents.

**Timing**: 2 minutes

**Why Restrict Tools**:
- The testing specialist only has `test` tools — no terminal access
- This prevents accidental production code changes
- Scope restriction builds trust with the team
- Principle of least privilege for AI agents

**Design Principle**: Define what the agent CANNOT do as clearly as what it can. The "Constraints" section is as important as "Core Expertise."

**Transition**: "Let's look at a second example — the Implementation Planner."
:::

---

## Example 2: Implementation Planner

```markdown
---
name: implementation-planner
description: Plans feature implementation without writing code
tools: ["read", "search", "github"]
---
You create detailed implementation plans for new features.
You NEVER write code — only analyze and plan.

## Planning Approach
1. Understand the feature requirements
2. Analyze the existing codebase
3. Identify affected components
4. Estimate complexity and risks
5. Create step-by-step implementation plan
6. Document in a GitHub issue

## Output Format
- [ ] Step 1: Description (X hours)
- [ ] Step 2: Description (X hours)
- Dependencies: [list]
- Risks: [list]
```

::: notes
The implementation planner shows how to use agents for planning rather than execution.

**Timing**: 2 minutes

**Use Cases**:
- Senior developer reviews before junior implementation
- Sprint planning and estimation
- Architecture decisions before coding begins
- Cross-team collaboration on complex features

**Key Insight**: An agent that can only read and search (no edit/create) is a safe analysis tool. It can provide valuable planning output without the risk of unintended changes.

**Transition**: "How do we use these agents once they're created?"
:::

---

## Using Custom Agents

### On GitHub.com
- Navigate to Copilot chat in your repository
- Click the agents dropdown
- Select your custom agent
- Start chatting with your specialized assistant

### In IDEs
- Open GitHub Copilot Chat
- Click agents dropdown (bottom of view)
- Select agent
- Agent context applies to the conversation

### Agent Switching
- Select different agent at any point
- Previous context is replaced by new agent
- Each agent maintains its specialized focus

::: notes
Using agents is as simple as selecting them from the Copilot chat dropdown.

**Timing**: 2 minutes

**Multi-Agent Workflow**:
1. Use `security-analyzer` to find vulnerabilities
2. Switch to `test-specialist` to write tests for the fix
3. Switch to `implementation-planner` to plan the remediation
4. Each agent stays in its lane

**Context Note**: Switching agents replaces the agent context — the conversation history remains but the agent instructions change.

**Transition**: "Let's cover best practices for agent design."
:::

---

## Best Practices

**Design Principles:**
- ✅ **Start narrow** — focused use case, expand later
- ✅ **Clear boundaries** — define what agent does AND doesn't do
- ✅ **Tool minimalism** — grant minimum necessary tools
- ✅ **Document examples** — show users how to interact

**Naming & Description:**
- Use kebab-case filenames: `security-analyzer.agent.md`
- Write specific descriptions: "Expert security analyst for OWASP Top 10"
- Not vague: "Helps with coding" ❌

**Pitfalls:**
- ❌ Overly broad scope — unfocused output
- ❌ Missing examples — users don't know how to invoke
- ❌ Exceeding 30,000 character limit
- ❌ Wrong file location (must be `.github/agents/`)

::: notes
Good agent design follows the principle of least privilege and clear scope definition.

**Timing**: 2 minutes

**Key Points**:
- Narrow agents produce better results than broad agents
- The description is what users read when choosing an agent — make it count
- Missing examples are the #1 reason agents are underused
- Character limit enforcement is strict — stay under 30,000 chars

**Testing Checklist**:
- Does the agent appear in the dropdown?
- Can it be invoked by name?
- Does it stay within its defined scope?
- Do examples work as expected?

**Transition**: "Let's wrap up with key takeaways."
:::

---

## Next Steps

### Resources
- GitHub Custom Agents docs: `docs.github.com`
- Awesome Copilot Community: `github.com/github/awesome-copilot`
- Repository agents: `.github/agents/`
- Organization agents: `agents/` (root directory)

### Try It Now
1. Navigate to `github.com/copilot/agents`
2. Select your repository
3. Create your first agent using the template
4. Test it in Copilot chat
5. Share with your team!

::: notes
Close with clear next steps and resources to continue learning.

**Timing**: 2 minutes

**Immediate Actions**:
1. Create a simple read-only agent for your most common code review task
2. Add it to your team's repository
3. Document it in the README so teammates can use it
4. Iterate based on feedback

**Key Takeaway**: Start with a simple, narrowly scoped agent. You can always expand it. A focused agent that works well is more valuable than a broad one that's inconsistent.
:::

---

## Thank You

### Questions?

**Resources:**
- `.github/instructions/` — Architecture and workflow guidance
- `ai-logs/` — AI conversation history and provenance
- `Slides/individual-slides/` — Individual module presentations

*Complete course slides merged from individual decks using `merge-marp-decks.prompt.md`*

::: notes
Thank you slide for the complete course.

**Timing**: 2–3 minutes for Q&A

**Summary of Modules**:
1. AI-Assisted Output — every artifact needs provenance metadata and ai-logs
2. CQRS Architecture — separate commands from queries when complexity justifies it
3. Dependency Management — classify by risk, automate scanning, enforce SLAs
4. GitHub CLI — replace browser workflows with terminal commands
5. Creating Custom Agents — specialize Copilot with narrowly scoped agents

**Course Materials**:
- Individual module slides: `Slides/individual-slides/`
- Instruction files: `.github/instructions/`
- Prompt files: `.github/copilot/Promptfiles/`

**Next Steps for Participants**:
- Review the relevant instruction files for your area of focus
- Implement the quick wins from each module
- Share learnings with your team

**Q&A**: Take questions on any module covered in the course.
:::
