---
ai_generated: true
model: "claude-sonnet-4.5@2026-03-20"
operator: "johnmillerATcodemag-com"
chat_id: "merge-marp-decks-aiasd-311-tuesday-20260320"
prompt: |
  Use manifest Slides/aiasd-311-tuesday.yaml
  run #file:merge-marp-decks.prompt.md
started: "2026-03-20T06:21:14Z"
ended: "2026-03-20T06:55:00Z"
task_durations:
  - task: "read manifest and source files"
    duration: "00:05:00"
  - task: "convert instruction files to Marp slides"
    duration: "00:25:00"
  - task: "assemble combined deck with section dividers"
    duration: "00:04:00"
total_duration: "00:34:00"
ai_log: "ai-logs/2026/03/20/merge-marp-decks-aiasd-311-tuesday-20260320/conversation.md"
source: ".github/prompts/merge-marp-decks.prompt.md"
marp: true
theme: default
paginate: true
---

# AI-Assisted Software Development

## Class 311 — Tuesday Session

*AI Output Standards · CQRS · GitHub CLI · Vertical Slices · Custom Agents*

::: notes
Welcome to AI-Assisted Software Development, Class 311 — Tuesday Session. This combined presentation covers five modules drawn from the repository's canonical instruction files.

**Timing**: 1 minute for title slide

**Modules in This Deck**:
1. **AI-Assisted Output Standards** — Provenance metadata, logging workflow, and CI enforcement for every AI-generated artifact
2. **CQRS Architecture** — Decision criteria, components, consistency strategies, and anti-patterns
3. **GitHub CLI** — Issue and PR management, Actions monitoring, and CI/CD integration
4. **Business Rules to Vertical Slices** — Extracting rules, identifying use cases, and designing slices
5. **Creating Custom GitHub Copilot Agents** — File structure, tool configuration, and deployment across environments

**Delivery Options**:
- Present all modules end-to-end as a full-day class
- Present individual sections standalone using the section dividers as entry points
- Use as a reference deck for self-paced learning

**Transition**: "Let's begin with Module 1 — AI-Assisted Output standards."
:::

---

<!-- ============================================================ -->
<!-- MODULE 1: AI-ASSISTED OUTPUT STANDARDS -->
<!-- ============================================================ -->

# Module 1

## AI-Assisted Output Standards

*Provenance, Logging & Quality for Every AI Artifact*

::: notes
This section divider marks the start of Module 1: AI-Assisted Output Standards.

**Module Duration**: Approximately 20–25 minutes

**Module Description**: This module establishes the mandatory metadata, logging workflow, and CI enforcement requirements for all AI-assisted artifacts in the repository. Every piece of AI-generated content — code, docs, diagrams, tests, data — must carry provenance.

**Transition**: "Let's dive into why provenance matters and what we require."
:::

---

## AI-Assisted Output: Why Provenance Matters

- AI-generated artifacts must carry **who**, **what model**, and **which conversation** produced them
- Provenance protects code quality, enables audits, and builds team trust
- Applies to: code, docs, diagrams, tests, configuration, data
- All artifacts targeted primarily at **AI agents** for consumption
- Optimize for **minimal token consumption** while maintaining completeness

::: notes
Provenance is not optional — it is a first-class quality requirement alongside correctness and security.

**Key Points to Emphasize**:
- "Who made this?" — the operator (GitHub username)
- "What tool?" — exact model in provider/model@version format
- "What conversation?" — chat ID linking to the full log
- Without this, teams cannot audit, reproduce, or trust AI outputs

**Timing**: 2 minutes

**Audience Interaction**: Ask "How many of you have received AI-generated code without knowing which model or prompt produced it?" — use this to motivate the policy.

**Transition**: "Let's look at what metadata fields are required."
:::

---

## Required Provenance Metadata

Every AI-assisted artifact must embed these fields as YAML front matter:

| Field | Description |
|-------|-------------|
| `ai_generated` | Always `true` |
| `model` | `provider/model@version` (e.g., `anthropic/claude-3.5-sonnet@2024-10-22`) |
| `operator` | GitHub username of the person who ran the AI |
| `chat_id` | Unique identifier for the conversation |
| `prompt` | Exact prompt text that initiated creation |
| `started` / `ended` | ISO8601 timestamps |
| `task_durations` | Array of task breakdowns |
| `total_duration` | Sum of all task durations (HH:MM:SS) |
| `ai_log` | `ai-logs/<yyyy>/<mm>/<dd>/<chat-id>/conversation.md` |
| `source` | What/who created the file |

::: notes
These 10 fields are required for every AI-assisted artifact. They form the provenance fingerprint.

**Timing**: 3 minutes

**Key Points**:
- The model field must be specific — never use "github/copilot" or "Auto". Always record the actual model with version.
- `chat_id` links the artifact back to the conversation log for full context
- `prompt` captures the exact text that triggered the creation — this is crucial for reproducibility

**Common Mistake**: Teams often forget `task_durations`. This field breaks down how long each phase of the AI work took — useful for estimating future similar work.

**Transition**: "Now let's look at where to put this metadata."
:::

---

## Metadata Placement Policy

**Markdown and text files** — embed as YAML front matter at the top:

```yaml
---
ai_generated: true
model: "anthropic/claude-3.5-sonnet@2024-10-22"
operator: "username"
chat_id: "my-feature-20260320"
...
---
```

**Binaries, images, non-text formats** — create a sidecar `<artifact>.meta.md`

**Prohibited**: sidecars for Markdown files — always use embedded front matter

::: notes
The placement rule is simple: if the format supports front matter, use it. If not, use a sidecar.

**Timing**: 2 minutes

**Why No Sidecars for Markdown?** Sidecars can get separated from their artifact when files are moved or renamed. Embedded front matter travels with the file.

**Demonstration**: Show a correct vs incorrect metadata placement side by side.

**Transition**: "Let's see what you must do before you start any AI-assisted work."
:::

---

## Before You Start (Mandatory)

Before generating any AI-assisted artifact:

1. **Open a new chat conversation** — gives you a unique chat ID
2. **Note the model name** — record the exact provider/model@version
3. **Record the start timestamp** — ISO8601 format (e.g., `2026-03-20T06:21:14Z`)
4. **Define the chat ID** — typically `<purpose>-<YYYYMMDD>` (e.g., `add-login-20260320`)
5. **Create the ai-log folder** — `ai-logs/<yyyy>/<mm>/<dd>/<chat-id>/`

**Never**: start generating files without an active, identified chat context.

::: notes
This "before you start" checklist prevents the most common compliance failure: retroactively trying to reconstruct provenance.

**Timing**: 2 minutes

**Analogy**: This is like signing in before entering a secure lab. The sign-in creates the paper trail that makes everything else auditable.

**Key Point**: If you don't know the model name, check the IDE or API settings before proceeding. Generic names like "Auto" are not acceptable.

**Transition**: "After creating artifacts, here's what must happen."
:::

---

## Post-Creation Requirements

After every AI-assisted artifact is created:

1. **Create conversation log**: `ai-logs/<yyyy>/<mm>/<dd>/<chat-id>/conversation.md`
2. **Create summary**: Session summary with resumability context in `summary.md`
3. **Update README**: Add entry with description and link to ai-log
4. **Verify metadata**: All 10 required fields present and correct
5. **Validate links**: All internal links in the artifact work correctly

::: notes
These five steps close the loop on provenance — the artifact is created, logged, and documented.

**Timing**: 2 minutes

**Why a Summary?** The summary.md enables future AI agents (or developers) to resume work in a new conversation with full context. It answers: "What was done? What decisions were made? What's next?"

**README Update**: The README entry is the human-readable index of all AI-assisted artifacts. It makes the repository's AI activity transparent at a glance.

**Transition**: "Let's talk about quality gates and CI enforcement."
:::

---

## Quality Checklist & CI Enforcement

**Quality Checklist (per artifact)**:
- [ ] All 10 provenance fields present
- [ ] Model name in `provider/model@version` format
- [ ] `ai_log` path exists with `conversation.md`
- [ ] `operator` is a real GitHub username
- [ ] Timestamps in ISO8601 format
- [ ] README entry added or updated

**CI Enforcement**:
- PRs blocked if `ai_log` path is missing or unreachable
- Automated scan validates required front matter fields
- Security scanning integrated for AI-generated code

::: notes
Quality gates are enforced at the PR level — you cannot merge without compliance.

**Timing**: 2 minutes

**Key Point**: The CI check is not punitive — it is a safety net. It catches the honest mistakes of forgetting a field or using the wrong model name format.

**Demonstration**: Show a failing CI check and what the error message looks like.

**Transition**: "That concludes AI-Assisted Output Standards. Let's move to CQRS Architecture."
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

**Module Duration**: Approximately 20–25 minutes

**Module Description**: This module covers when and how to apply Command Query Responsibility Segregation (CQRS) — separating the write model (commands) from the read model (queries) to improve scalability, performance, and domain clarity.

**Transition**: "Let's start with when CQRS makes sense and when it doesn't."
:::

---

## CQRS: When to Use It

**Use CQRS when**:
- Read and write workloads **scale differently**
- Read models require denormalization, caching, or projections
- Write model needs **strong invariants** and task-focused workflows
- Auditing, event sourcing, or integration events are required
- Query complexity is slowing transactional throughput

**Avoid CQRS when**:
- The domain is small and reads/writes are balanced
- There is no clear boundary between commands and queries
- Operational overhead is not justified

::: notes
CQRS is not a default architecture — it is a tool for specific scaling and modeling problems.

**Timing**: 3 minutes

**Key Point**: The most common mistake is applying CQRS to simple CRUD systems. If your read and write shapes are the same, a single model is simpler.

**Example**: An e-commerce order system is a good CQRS candidate — writes need strong consistency (inventory checks, payment validation) while reads serve dashboards and order history with different performance requirements.

**Audience Question**: "Has anyone been on a project where CQRS was used? Was it the right choice?"

**Transition**: "Let's look at the core principles that govern CQRS."
:::

---

## CQRS: Core Principles

1. **Commands change state** — queries never change state
2. **Write model enforces invariants** — read model optimizes retrieval
3. **Models can be stored separately** and evolve independently
4. **Eventual consistency** is acceptable for read model synchronization

**The fundamental separation**:

| Command Side | Query Side |
|---|---|
| Validates business rules | Returns data fast |
| Can fail | Should not fail |
| Targets one aggregate root | Shaped for UI/consumer |

::: notes
These four principles are the foundation of CQRS. They are simple but have deep implications for how you design, test, and operate the system.

**Timing**: 3 minutes

**Key Point**: "Commands can fail, queries should not" is a crucial asymmetry. It drives different error-handling strategies on each side.

**Analogy**: Think of a bank ledger. Adding a transaction (command) requires verification and can be rejected. Reading your balance (query) just returns the current state — it never rejects.

**Transition**: "Now let's look at the minimum architecture components you need."
:::

---

## CQRS: Architecture Components

Minimum components for a CQRS system:

- **Command API** — Accepts commands, validates, enforces invariants
- **Command Handler** — Orchestrates domain operations
- **Write Store** — Transactional database for aggregates
- **Event/Change Publisher** — Emits domain or integration events
- **Projection/Read Updater** — Builds and updates read models
- **Query API** — Serves read models with filtering and pagination
- **Read Store** — Query-optimized database (relational, document, or search)

::: notes
Seven components form the minimum viable CQRS architecture. Each has a single, clear responsibility.

**Timing**: 3 minutes

**Key Point**: The Write Store and Read Store can be the same physical database initially — separation is logical before it is physical. Start simple and scale the physical infrastructure when needed.

**Diagram Tip**: Draw the data flow: Command API → Handler → Write Store → Event Publisher → Projection Updater → Read Store → Query API. This makes the pipeline visible.

**Transition**: "Let's go deeper on command model design."
:::

---

## CQRS: Command Model Design

**Command naming** — task-based, intention-revealing:
- `CreateOrder`, `ApproveOrder`, `CancelShipment`

**Command rules**:
- Validate at the boundary — reject invalid commands fast
- Use aggregates to enforce invariants and consistency
- Keep handlers deterministic and side-effect controlled
- One command targets **one aggregate root**
- Write to a single source of truth (write store)

```csharp
// ✅ Task-based command
public record ApproveOrderCommand(Guid OrderId, string ApproverId);

// ❌ Anemic pass-through (no invariant enforcement)
public record UpdateOrderCommand(Order Order);
```

::: notes
Command design is where domain modeling happens. Good command names reveal intent; bad names hide it.

**Timing**: 3 minutes

**Key Point**: "One command, one aggregate root" is the consistency boundary. If you need to update two aggregates in one command, that's a sign the command is too broad — consider a saga or process manager.

**Code Discussion**: Walk through the code example. Notice how `ApproveOrderCommand` carries only the identifier and approver — not the entire order state. This prevents the caller from dictating internal structure.

**Transition**: "Now let's look at the query side."
:::

---

## CQRS: Query Model Design & Consistency

**Query model rules**:
- Shape queries for the UI or consumer — not for domain logic
- Avoid joins and complex calculations in the read model
- Use projections updated from events or change feeds
- Keep read models **versioned and rebuildable**
- Queries are idempotent and side-effect free

**Consistency decision matrix**:

| Consistency Type | Use For |
|---|---|
| **Strong** | Payments, inventory, security |
| **Eventual** | Dashboards, activity feeds, analytics |

**Reliable event publishing** — use the **outbox pattern** to prevent lost events.

::: notes
The query model is optimized for one thing: returning data fast. Everything else — joins, calculations, business logic — belongs on the write side.

**Timing**: 3 minutes

**Outbox Pattern**: Briefly explain — instead of publishing events directly after a write (which can fail), write the event to an outbox table in the same transaction, then have a background process publish it. This guarantees at-least-once delivery.

**Key Point**: Not everything needs eventual consistency. Security-sensitive operations (login, payment) should use strong consistency by reading from the write model directly.

**Transition**: "Let's look at common pitfalls."
:::

---

## CQRS: Anti-Patterns & Migration

**Anti-patterns to avoid**:
- ❌ Mixing query logic in command handlers
- ❌ Sharing the same ORM model for reads and writes
- ❌ Applying CQRS to simple CRUD domains
- ❌ Dual writes without outbox or transaction coordination

**Migration strategy** (incremental):
1. Start with a single bounded context or feature
2. Split read model first — keep write model intact
3. Add projections and read store incrementally
4. Introduce event publishing after stable write flow

::: notes
The anti-patterns section is where experienced developers recognize past mistakes. Each anti-pattern has a specific consequence.

**Timing**: 3 minutes

**Dual-Write Risk**: Without the outbox pattern, a crash between the database write and the event publish leaves the read model out of sync with no recovery path. This is a data consistency bug that is hard to detect and hard to fix.

**Migration Advice**: Don't rewrite the whole system at once. Pick one high-value feature (e.g., order processing) and migrate it as a proof of concept. Validate the operational overhead before committing to full adoption.

**Transition**: "That concludes CQRS Architecture. Let's move to GitHub CLI."
:::

---

<!-- ============================================================ -->
<!-- MODULE 3: GITHUB CLI -->
<!-- ============================================================ -->

# Module 3

## GitHub CLI

*Powerful Repository Operations from the Terminal*

::: notes
This section divider marks the start of Module 3: GitHub CLI.

**Module Duration**: Approximately 20–25 minutes

**Module Description**: The GitHub CLI (`gh`) enables developers to manage issues, pull requests, GitHub Actions workflows, and code reviews directly from the terminal. This module covers the most important workflows.

**Transition**: "Let's start with issue management."
:::

---

## GitHub CLI: Issue Management

**Create issues**:
```bash
gh issue create --title "Bug: crash on startup" \
  --body "Description" --assignee @me --label "bug"
gh issue create --template bug_report.md
```

**List and view issues**:
```bash
gh issue list --state open --assignee @me --label bug
gh issue view 123 --comments
gh issue list --json number,title,state --jq '.[] | "\(.number): \(.title)"'
```

**Manage issues**:
```bash
gh issue edit 123 --add-label "enhancement"
gh issue close 123 --comment "Fixed in PR #456"
gh issue comment 123 --body "See related issue #789"
```

::: notes
Issue management via the CLI is faster than the web UI for bulk operations and automation.

**Timing**: 3 minutes

**Key Points**:
- `--json` + `--jq` combination enables powerful custom output formatting for scripts
- Creating issues from templates (`--template`) enforces consistent issue structure
- `gh issue close --comment` combines two operations into one command

**Live Demo Opportunity**: Show `gh issue list --json number,title,state,author --jq '.[] | "\(.number): \(.title) (\(.state))"'` live in terminal.

**Transition**: "Now let's look at pull request workflows."
:::

---

## GitHub CLI: Pull Request Workflows

**Create PRs**:
```bash
gh pr create --title "feat: add feature" \
  --assignee @me --reviewer team-lead --draft
gh pr create --head feature-branch --base main
```

**Review and manage PRs**:
```bash
gh pr list --state open --author @me
gh pr checkout 456           # check out PR locally
gh pr diff 456               # view diff
gh pr review 456 --approve
gh pr review 456 --request-changes --body "Please fix these issues"
```

**Merge PRs**:
```bash
gh pr merge 456 --squash     # squash and merge
gh pr merge 456 --auto --squash  # auto-merge when checks pass
```

::: notes
The PR workflow commands cover the entire lifecycle from creation to merge.

**Timing**: 3 minutes

**Key Points**:
- `gh pr checkout 456` — eliminates the need to manually find and checkout the branch. Essential for reviewing PRs locally.
- `--auto --squash` — sets up auto-merge so a PR merges automatically once all checks pass. Great for dependency update PRs.
- `--draft` — create a work-in-progress PR that signals the team it's not ready for review yet.

**Pro Tip**: Use `gh pr create --web` to open the PR creation form in the browser with the branch pre-filled. Good for complex PRs where you want the UI.

**Transition**: "Let's look at GitHub Actions management."
:::

---

## GitHub CLI: GitHub Actions Management

**Monitor workflow runs**:
```bash
gh run list --status failure          # list failed runs
gh run view 123456 --log              # view full logs
gh run watch 123456                   # follow logs in real-time
```

**Control runs**:
```bash
gh run cancel 123456
gh run rerun 123456 --failed-jobs     # re-run only failed jobs
```

**Trigger and manage workflows**:
```bash
gh workflow run manual.yml -f env=staging -f version=1.2.0
gh workflow disable ci.yml            # disable a workflow
gh workflow enable ci.yml             # re-enable
```

**Download artifacts**:
```bash
gh run download 123456 --name test-results
```

::: notes
GitHub Actions CLI commands are essential for CI/CD troubleshooting and automation.

**Timing**: 3 minutes

**Key Points**:
- `gh run watch` is invaluable during active development — follow your CI in real-time without switching to the browser
- `--failed-jobs` on rerun saves time when only a subset of jobs failed (e.g., a flaky test)
- Workflow dispatch with `-f` flags enables programmatic triggering — great for deployment automation

**Live Demo Opportunity**: If CI is running, show `gh run watch` following a live run.

**Transition**: "Now let's look at integration with development tools."
:::

---

## GitHub CLI: Integration & Automation

**VS Code integration**:
```bash
gh repo clone owner/repo && cd repo && code .
gh pr create --web  # open PR form in browser with branch pre-filled
```

**CI/CD script integration**:
```bash
# Auto-merge PR after checks pass
gh pr merge $1 --auto --squash

# Comment on PR from a workflow step
gh pr comment $PR_NUMBER --body "✅ Tests passed on staging"
```

**Shell completions**:
```bash
eval "$(gh completion -s bash)"   # bash
eval "$(gh completion -s zsh)"    # zsh
```

**GitHub Actions integration**:
```yaml
env:
  GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
run: gh pr comment ${{ github.event.number }} --body "Deployed!"
```

::: notes
The real power of the GitHub CLI is in automation — scripting repository operations that would otherwise require manual web UI interactions.

**Timing**: 3 minutes

**Key Point**: The `GITHUB_TOKEN` in GitHub Actions already has the permissions needed for most `gh` commands. You don't need to create a PAT for basic operations.

**Best Practice**: Add shell completions to your dotfiles. Tab-completing `gh` commands dramatically speeds up your workflow.

**Automation Use Cases**: 
- Auto-close stale issues
- Auto-label PRs based on files changed
- Post deployment status comments
- Trigger release workflows based on milestone completion

**Transition**: "That concludes GitHub CLI. Let's move to Business Rules to Vertical Slices."
:::

---

<!-- ============================================================ -->
<!-- MODULE 4: BUSINESS RULES TO VERTICAL SLICES -->
<!-- ============================================================ -->

# Module 4

## Business Rules to Vertical Slices

*From Requirements to Deployable Feature Slices*

::: notes
This section divider marks the start of Module 4: Business Rules to Vertical Slices.

**Module Duration**: Approximately 25–30 minutes

**Module Description**: This module covers the systematic process of analyzing business requirements, extracting business rules, identifying use cases, defining feature boundaries, and designing vertical slices for implementation.

**Transition**: "Let's start with when to apply this approach."
:::

---

## Business Rules to Slices: Overview

Apply this approach when:
- User provides business requirements or describes a workflow
- User asks to design features or break down into vertical slices
- User mentions "business rules," "use cases," or "user stories"

**The 6-step process**:
1. **Extract** business rules from requirements
2. **Identify** use cases (actor, goal, flows)
3. **Define** feature boundaries
4. **Design** vertical slices (complete, testable)
5. **Present** structured analysis using templates
6. **Validate** completeness and quality

::: notes
This process turns natural language requirements into structured implementation plans.

**Timing**: 2 minutes

**Key Point**: Each step builds on the previous. You cannot design good slices without first identifying use cases, and you cannot identify use cases without extracting the business rules that constrain them.

**Real-World Value**: Teams that skip this process end up with slices that are too large, too small, or missing critical business logic. The structured approach prevents this.

**Transition**: "Let's start with business rule extraction."
:::

---

## Business Rule Extraction

**Four rule types**:

| Type | Pattern | Example |
|------|---------|---------|
| **Structural** | "A [entity] has/is/contains..." | "A customer must have an email" |
| **Operative** | "A [entity] must/cannot/should..." | "Emails must be unique" |
| **Derivation** | "[Value] = [formula]" | "Total = subtotal + tax - discounts" |
| **Action Enabler** | "When [event], [action]" | "When registered, send welcome email" |

**Extraction signals**: modal verbs (must, should, cannot), constraints (only, never, always), calculations, triggers

**Format**: `BR-001: Email addresses must be unique across all users`

::: notes
Business rule extraction is a scanning exercise. You read every sentence looking for the four signal types.

**Timing**: 4 minutes

**Exercise**: Read this requirement aloud and ask participants to identify the rules:

"Users must register with a valid email address. Emails must be unique across all users. The system should send a welcome email when registration is complete. Users cannot access premium features until they verify their email."

Expected rules: BR-001 (valid email required), BR-002 (email unique), BR-003 (welcome email trigger), BR-004 (verification gate)

**Key Point**: Flag ambiguous rules immediately. "Passwords must be strong" is not a testable rule. "Passwords must be 8–20 characters with uppercase, lowercase, and digit" is.

**Transition**: "Now let's identify use cases from the requirements."
:::

---

## Use Case Identification

**Use case = Actor + Goal + Flows**

Extract use cases by looking for actor-action pairs:
- "User registers an account" → UC-001: Register User Account
- "Admin approves refund" → UC-002: Approve Refund Request

**Standard format**:
```
UC-010: Request Password Reset
- Actor: User (forgot password)
- Goal: Initiate password reset process
- Main Flow: 1. User enters email → 2. System validates → 3. Token sent → ...
- Alternative Flows: 3a. Email not found → display generic message (security)
- Business Rules: BR-020, BR-021
```

::: notes
Use cases translate business rules into user-facing interactions.

**Timing**: 4 minutes

**Key Point**: "Alternative flows" are where most bugs live. Requirements documents describe the happy path. Good use case analysis explicitly lists what happens when things go wrong.

**Security Note**: In the password reset example, showing a generic "email not found" message (rather than "email does not exist") is a deliberate security choice that prevents user enumeration attacks. This should be captured as a business rule.

**Template**: Every use case needs actor, goal, preconditions, postconditions, main flow, alternative flows, and linked business rule IDs.

**Transition**: "Now let's define feature boundaries."
:::

---

## Feature Boundary Definition

**Four tests for valid feature boundaries**:

| Test | Question | Example: ✅ Pass | Example: ❌ Fail |
|------|----------|---------|---------|
| **Cohesion** | Do all parts naturally belong together? | "Password Reset" | "User Management" |
| **Independence** | Can this be implemented without modifying other features? | "Password Reset" | "Update User Email" |
| **Value** | Does this deliver complete user value? | "Checkout Process" | "Validate Credit Card" |
| **Size** | Can this be done in 1–5 days? | "Basic Search" | "Full E-Commerce Platform" |

::: notes
Feature boundary definition prevents two common problems: features that are too large to estimate reliably, and features that are too small to deliver standalone value.

**Timing**: 3 minutes

**Key Point**: The Independence test is the hardest. A feature that seems independent often has hidden coupling to shared state, authentication, or data. Test this by asking "If I implement this feature first, before anything else, can it be deployed and demonstrated?"

**Size Test Practical Note**: 1–5 days is a guideline for a developer familiar with the codebase. Adjust for team velocity and complexity.

**Transition**: "Now let's design the vertical slices within each feature."
:::

---

## Vertical Slice Design

**Each slice must be**:
- **Complete** — spans all layers (DB, domain, API, tests)
- **Valuable** — user can do something meaningful
- **Independent** — can be implemented and deployed separately
- **Testable** — has clear acceptance criteria

**Decomposition strategies**:
1. **MVS (Minimal Viable Slice)** — simplest path first, enrich later
2. **Happy Path First** — complete success case, then add error handling
3. **Core + Extensions** — essential functionality, then optional enhancements

**Acceptance criteria format**: `Given [valid inputs], [user account is created and returns 201]`

::: notes
Vertical slices are the implementation unit of vertical slice architecture. Each slice is a thin end-to-end cut through all layers.

**Timing**: 4 minutes

**Key Point**: "Spans all layers" means the slice includes the database migration (if needed), domain model, business logic handler, API endpoint, and tests. A slice that only creates an API endpoint without the underlying logic is not a slice — it's a stub.

**Example**: For User Registration, the first slice (MVS) is "User can register with email and password and account is created." The second slice adds email verification. The third adds welcome email. Each is independently deployable and testable.

**Transition**: "That concludes Business Rules to Vertical Slices. Let's move to Custom Agents."
:::

---

<!-- ============================================================ -->
<!-- MODULE 5: CREATING CUSTOM GITHUB COPILOT AGENTS -->
<!-- ============================================================ -->

# Module 5

## Creating Custom GitHub Copilot Agents

*Specialized AI Assistants with Domain Expertise*

::: notes
This section divider marks the start of Module 5: Creating Custom GitHub Copilot Agents.

**Module Duration**: Approximately 20–25 minutes

**Module Description**: GitHub Copilot custom agents allow teams to create specialized AI assistants with focused domain expertise. This module covers the file structure, YAML front matter, tool configuration, and deployment workflow.

**Transition**: "Let's start with file structure and naming."
:::

---

## Custom Agents: File Structure & Naming

**Repository-level agents**:
- Location: `.github/agents/`
- Pattern: `<agent-name>.agent.md` (kebab-case)
- Scope: Available to all repository collaborators

**Organization/Enterprise agents**:
- Location: `agents/` (root directory)
- Scope: Available across all repositories in the org

**Valid characters**: `.`, `-`, `_`, `a-z`, `A-Z`, `0-9`
```
✅ security-analyzer.agent.md
✅ test-specialist.agent.md
❌ security analyzer.agent.md   (no spaces)
❌ security@analyzer.agent.md   (invalid character)
```

::: notes
File naming and location are the first things to get right. Copilot only discovers agents in the correct directory with the correct extension.

**Timing**: 2 minutes

**Common Mistake**: Placing agents in `.github/copilot/agents/` instead of `.github/agents/`. The directory must be exactly `.github/agents/`.

**User-Level Agents** (VS Code only): Users can also create personal agents in their VS Code user profile folder — these are not checked into the repository.

**Transition**: "Let's look at the required YAML front matter."
:::

---

## Custom Agents: YAML Front Matter

**Required**:
```yaml
---
description: Expert security analyst for vulnerability detection  # REQUIRED
---
```

**Optional**:
```yaml
---
name: security-analyzer          # display name (defaults to filename)
description: Expert security analyst...
tools: ["read", "search", "create_issue"]  # omit = ALL tools
model: "gpt-4"                   # IDE only (VS Code, JetBrains, Eclipse, Xcode)
target: "vscode"                 # vscode | github-copilot | omit for both
mcp-servers:                     # org/enterprise only
  weather:
    command: npx
    args: ["-y", "@modelcontextprotocol/server-weather"]
---
```

**Character limit**: 30,000 characters total (including all markdown content)

::: notes
The YAML front matter controls how the agent is discovered, displayed, and constrained.

**Timing**: 3 minutes

**Key Points**:
- `description` is the only required field. Without it, the agent won't appear correctly in the picker.
- `tools` is optional but important for security — if you omit it, the agent gets ALL tools including terminal. Restrict this for agents that should only read files.
- `model` is only available in IDEs, not on GitHub.com — keep this in mind for cross-environment agents.

**MCP Servers**: Model Context Protocol servers extend agent capabilities with external tools. Organization-level only — they require server infrastructure.

**Transition**: "Let's look at how to write effective agent prompt content."
:::

---

## Custom Agents: Prompt Content

**Recommended structure** (stays under 30,000 chars):

```markdown
You are a [role] specializing in [domain]. Your responsibilities:
- [Responsibility 1]
- [Responsibility 2]

## Core Expertise
- **[Area]**: Description (5–10 areas)

## Analysis Approach
1. [Step 1]
2. [Step 2]

## Key Principles
- [Principle 1]
- [Principle 2]
```

**Content guidelines**:
- ✅ Task-oriented — "Analyze for OWASP Top 10 vulnerabilities"
- ❌ Behavioral persona — "Act like a friendly senior engineer"
- ✅ Specific constraints — "Do not modify production code"

::: notes
Agent prompt content is the heart of the agent — it defines what the agent does and how it behaves.

**Timing**: 3 minutes

**Key Point**: Agents are for tasks, not personas. "Be a friendly assistant" belongs in a chat mode. "Analyze security vulnerabilities and create GitHub issues for findings" is an agent.

**Constraints are Critical**: Always define what the agent should NOT do. A security agent that modifies production code while looking for vulnerabilities could inadvertently introduce changes. Add "Do not modify production code" to the Key Principles.

**Character Limit**: 30,000 characters sounds like a lot, but complex templates can hit it quickly. Be concise — good agent prompts are focused, not exhaustive.

**Transition**: "Let's look at tool configuration."
:::

---

## Custom Agents: Tool Configuration

**Tool categories**:
| Category | Tools |
|----------|-------|
| File ops | `read`, `edit`, `create`, `delete` |
| Code intelligence | `search`, `grep`, `list_code_usages` |
| GitHub integration | `github`, `create_issue`, `create_pr` |
| Workspace | `workspace`, `terminal` |

**Tool selection strategy**:
```yaml
# Security agent — no production code modification
tools: ["read", "search", "create_issue", "github"]

# Test specialist — no terminal access
tools: ["read", "search", "create", "edit"]

# Documentation agent — read-only
tools: ["read", "search", "create"]
```

**Omit `tools` entirely** to grant access to ALL available tools.

::: notes
Tool configuration is the security boundary for agents. Use the principle of least privilege.

**Timing**: 3 minutes

**Security Principle**: An agent with `terminal` access can run arbitrary commands on the developer's machine. Only grant `terminal` to agents that explicitly need it (e.g., a build agent).

**Testing Agents**: Test agents should be able to create and edit test files but not modify application code. Restrict to the test file directories via workspace scoping if possible.

**Key Point**: When you omit `tools`, the agent inherits ALL tools — including terminal. Be explicit about which tools you want for production agents.

**Transition**: "Let's look at the creation workflow."
:::

---

## Custom Agents: Creation Workflow

**Via GitHub.com**:
1. Navigate to `github.com/copilot/agents`
2. Select repository from dropdown
3. Click Copilot icon → "Create an agent"
4. Edit the template `.agent.md` file
5. Commit to default branch → agent is live

**Via VS Code**:
1. Copilot Chat → agents dropdown → "Configure Custom Agents..."
2. Click "+ Create new custom agent"
3. Choose location (repository or user profile)
4. Edit file and save → agent is immediately available

**Activating an agent in chat**:
- Click agents dropdown and select the agent
- Or type `@agent-name` to switch context

::: notes
The creation workflow is straightforward — it's just committing a markdown file to the right location.

**Timing**: 3 minutes

**Key Point**: Agents must be merged to the default branch to be available to all collaborators. During development, you can test from a feature branch in VS Code (via the user profile location) before merging.

**Best Practices**:
1. Start narrow — specific use cases, then expand
2. Define both what the agent does AND doesn't do
3. Iterate based on team feedback
4. Track agent changes in version control (they're just files)

**Troubleshooting**:
- Agent not visible? Check `.github/agents/` location and `.agent.md` extension
- Tools not working? Verify tool names in the `tools` array

**Transition**: "That concludes Module 5 and this full training session."
:::

---

## Course Summary

| Module | Key Takeaway |
|--------|-------------|
| **AI-Assisted Output** | Every artifact needs provenance: 10 required fields + ai-log + README entry |
| **CQRS Architecture** | Separate read/write models when workloads scale differently; use outbox for reliable events |
| **GitHub CLI** | `gh` replaces web UI for issues, PRs, Actions — essential for scripting and CI/CD |
| **Business Rules → Slices** | Extract rules → identify use cases → define features → design complete, testable slices |
| **Custom Agents** | `.github/agents/<name>.agent.md` — focused tasks, least-privilege tools, committed to default branch |

::: notes
This summary slide closes the full session and reinforces the key takeaways from all five modules.

**Timing**: 3 minutes

**Delivery**: Read through each row and invite a quick question or comment from participants on each module.

**Action Items for Participants**:
1. Add AI provenance to the next AI-generated artifact they create
2. Identify one workflow in their codebase that might benefit from CQRS
3. Install `gh` and try `gh pr list` in their current project
4. Take one set of requirements and extract the business rules using the BR-001 format
5. Create a simple custom agent for a repetitive task in their project

**Closing**: "Thank you for attending Class 311. The source instruction files for all five modules are in `.github/instructions/` — use them as ongoing references in your development work."
:::
