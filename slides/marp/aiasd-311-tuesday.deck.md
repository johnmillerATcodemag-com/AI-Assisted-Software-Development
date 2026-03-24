---
ai_generated: true
model: "anthropic/claude-sonnet-4.5@2026-03-20"
operator: "johnmillerATcodemag-com"
chat_id: "aiasd-311-tuesday-20260320"
prompt: |
  Manifest: slides/aiasd-311-tuesday.yaml
  run the prompt #file:merge-marp-decks.prompt.md
started: "2026-03-20T04:52:05Z"
ended: "2026-03-20T05:15:00Z"
task_durations:
  - task: "read manifest and source files"
    duration: "00:05:00"
  - task: "convert instruction files to Marp slides"
    duration: "00:12:00"
  - task: "assemble combined deck with section dividers"
    duration: "00:06:00"
total_duration: "00:23:00"
ai_log: "ai-logs/2026/03/20/aiasd-311-tuesday-20260320/conversation.md"
source: ".github/prompts/merge-marp-decks.prompt.md"
marp: true
theme: default
paginate: true
---

# AI-Assisted Software Development

## Class 311 — Tuesday Session

*AI Output Standards · CQRS · GitHub CLI · Business Rules to Slices · Custom Agents*

::: notes
Welcome to the AIASD Class 311 Tuesday session. This combined presentation covers five modules drawn from the repository instruction files.

**Timing**: 1–2 minutes

**Modules in This Deck**:
1. **AI-Assisted Output Standards** — Required provenance metadata, logging workflow, and post-creation checklist
2. **CQRS Architecture** — When to use, core principles, components, consistency, and anti-patterns
3. **GitHub CLI** — Issue and PR management, Actions workflows, and CI/CD integration
4. **Business Rules to Vertical Slices** — Extracting rules, identifying use cases, defining features, designing slices
5. **Creating Custom GitHub Copilot Agents** — File structure, frontmatter, tools, templates, and best practices

**Delivery Options**:
- Present all five modules end-to-end as a half-day training session
- Navigate directly to individual section dividers for standalone delivery
- Use as a reference deck for self-paced learning

**Transition**: "Let's start with Module 1 — AI-Assisted Output Standards."
:::

---

<!-- ============================================================ -->
<!-- MODULE 1: AI-ASSISTED OUTPUT STANDARDS -->
<!-- ============================================================ -->

# Module 1

## AI-Assisted Output Standards

*Provenance · Logging · Quality Gates*

::: notes
This section divider marks the start of Module 1: AI-Assisted Output Standards.

**Module Duration**: Approximately 20 minutes

**Module Description**: Covers the mandatory metadata every AI-generated artifact must carry, the chat-logging workflow, and post-creation quality requirements.

**Transition**: "Let's dive in."
:::

---

## Why AI Provenance Matters

- **Code quality**: Know which model generated what and when
- **Auditing**: Trace any artifact back to its originating conversation
- **Accountability**: Identify the human operator behind every AI output
- **Reproducibility**: Re-run or debug with the exact model and prompt

> *"If you don't record how it was made, you can't trust that it was made correctly."*

::: notes
AI-generated code and documentation can be excellent — or subtly wrong. Provenance metadata gives teams the ability to audit, review, and reproduce any AI output.

**Key messages**:
- Without provenance, an AI artifact is a black box
- With provenance, you can answer: who asked, which model, what prompt, and when
- This is especially important for security-sensitive or compliance-relevant outputs

**Timing**: ~2 minutes

**Audience interaction**: Ask — "Has anyone been unable to track down where a piece of AI-generated code came from?"
:::

---

## Required Metadata Fields

```yaml
---
ai_generated: true
model: "anthropic/claude-3.5-sonnet@2024-10-22"
operator: "johndoe"
chat_id: "create-user-auth-20260120"
prompt: |
  Create an authentication handler for the user login feature
started: "2026-01-20T16:45:00Z"
ended: "2026-01-20T17:00:00Z"
task_durations:
  - task: "implementation"
    duration: "00:15:00"
total_duration: "00:15:00"
ai_log: "ai-logs/2026/01/20/create-user-auth-20260120/conversation.md"
source: "johndoe"
---
```

::: notes
These 11 fields are **mandatory** for every AI-generated artifact that supports embedded front matter (Markdown, YAML files, etc.).

**Walk through each field**:
- `ai_generated: true` — boolean flag, never the string "Yes"
- `model` — always `"provider/model@version"` — the underlying model, not the tool (e.g., Copilot)
- `operator` — the GitHub username of the human who triggered the generation
- `chat_id` — a unique slug identifying the conversation; becomes the log folder name
- `prompt` — the exact user prompt, verbatim
- `started` / `ended` — ISO8601 timestamps
- `task_durations` — breakdown of time spent per sub-task
- `total_duration` — sum of task durations in HH:MM:SS
- `ai_log` — path to the conversation log (must exist)
- `source` — who or what created the file (username or prompt file path)

**Timing**: ~3 minutes
:::

---

## Model Format Requirements

| ✅ Correct | ❌ Wrong |
|-----------|---------|
| `anthropic/claude-3.5-sonnet@2024-10-22` | `claude` |
| `openai/gpt-4o@2024-11-20` | `github/copilot` |
| `openai/o1@2024-12-17` | `gpt-4` |
| `google/gemini-1.5-pro@2024-02` | `Auto (copilot)` |

**Format**: `"<provider>/<model-name>@<version>"`

- Use the **underlying model**, not the interface
- Copilot, Cursor, and other tools are wrappers — identify what's inside

::: notes
The most common provenance mistake is writing "github/copilot" or "Auto" as the model name. This destroys reproducibility because it doesn't identify which underlying model (GPT-4, Claude, Gemini) was used.

**Key point**: GitHub Copilot is an interface, not a model. The model is whatever OpenAI or Anthropic model Copilot is currently routing to. Check your editor settings or ask Copilot directly.

**Timing**: ~2 minutes

**Example**: Show how to find the active model in VS Code Copilot settings (click the model selector dropdown).
:::

---

## Metadata Placement Policy

| Artifact Type | Where to Put Metadata |
|--------------|----------------------|
| Markdown files | Embedded YAML front matter (**required**) |
| Code files with header comments | YAML-style comment block at top |
| Images, binaries | Sidecar `<artifact>.meta.md` |
| Markdown with sidecar | ❌ **Prohibited** — embed only |

> Always prefer embedding. Sidecars are only for formats that cannot accept embedded front matter.

::: notes
The rule is simple: if the file format supports embedded YAML (Markdown does), the provenance must be embedded. Separate sidecar `.meta.md` files alongside Markdown are explicitly prohibited because they can become separated from the artifact.

**Timing**: ~2 minutes

**Common mistake**: Creating a `readme.md.meta.md` sidecar for a README. Don't — embed the front matter directly.
:::

---

## AI Chat Logging Workflow

**Folder structure**:
```
ai-logs/
└── yyyy/
    └── mm/
        └── dd/
            └── <chat-id>/
                ├── conversation.md   ← full transcript (REQUIRED)
                └── summary.md        ← objectives & outcomes (REQUIRED)
```

**Rules**:
- Each new chat → new folder
- Never reuse or append to an existing conversation file
- Auto-scaffold the folder when the first artifact is created

::: notes
Every AI-assisted work session must produce two log files: `conversation.md` (the full prompt/response transcript) and `summary.md` (a concise record of objectives, decisions, and artifacts produced).

**Why "never reuse"?**: If you append a second conversation to an existing `conversation.md`, you lose the ability to tie specific artifacts back to specific exchanges. Each chat gets its own folder.

**Timing**: ~3 minutes

**Note for Copilot users**: Copilot can auto-scaffold this structure when it generates the first artifact — the chat ID becomes the folder name.
:::

---

## Post-Creation Requirements

After creating any AI-assisted artifact:

1. ✅ **Conversation log** — `ai-logs/<yyyy>/<mm>/<dd>/<chat-id>/conversation.md`
2. ✅ **Summary** — `ai-logs/<yyyy>/<mm>/<dd>/<chat-id>/summary.md`
3. ✅ **README update** — Add entry with description and chat log link
4. ✅ **Metadata verification** — All 11 provenance fields present and correct
5. ✅ **Link validation** — All internal links resolve correctly

::: notes
These five post-creation steps are the canonical checklist from `ai-assisted-output.instructions.md`. They apply to every AI-generated artifact — slides, code, documentation, diagrams, everything.

**Timing**: ~2 minutes

**Audience interaction**: "Which of these steps do you think teams most commonly skip?" (Answer: usually README updates and link validation.)

**Transition**: "Now that we have the standards for AI output, let's look at a major architectural pattern — CQRS."
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

**Module Duration**: Approximately 20 minutes

**Module Description**: Covers the CQRS pattern — when to apply it, the core principles, the seven minimum components, command and query model design, consistency strategies, and common anti-patterns.

**Prerequisites**: Familiarity with basic application layering (controllers, services, databases) is helpful.

**Transition**: "Let's start with when to use CQRS."
:::

---

## What is CQRS?

**Command Query Responsibility Segregation** separates the write model from the read model.

| Concept | Responsibility |
|---------|---------------|
| **Command** | Changes state — create, update, delete |
| **Query** | Reads state — never mutates |

**Use CQRS when**:
- Read and write workloads scale differently
- Read models need denormalization or caching
- Write model needs strong invariants
- Auditing or event sourcing is required
- Query complexity is slowing transactional throughput

::: notes
CQRS was coined by Greg Young, building on Bertrand Meyer's Command-Query Separation (CQS) principle. Where CQS operates at the method level ("a method should either return a value or change state, not both"), CQRS applies this separation at the architectural level.

**Key insight**: Most applications read data far more than they write. If you use the same model for both, you end up with complex joins and indexes that compromise write performance, or a write model so normalized it's slow to query.

**Timing**: ~3 minutes

**When NOT to use CQRS**:
- Small domains where reads/writes are balanced and simple
- No clear boundary between commands and queries
- Operational overhead is not justified by the complexity
:::

---

## CQRS Core Principles

1. **Commands change state** — queries never do
2. **Write model enforces invariants** — read model optimizes retrieval
3. **Models evolve independently** — can use different stores
4. **Eventual consistency** is acceptable for the read model

```
[Client] → Command → [Write Model] → [Write Store]
                           ↓ (events/change feed)
[Client] ← Query  ← [Read Model]  ← [Read Store]
```

::: notes
The diagram shows the fundamental data flow. A command goes through the write model, which validates business rules and persists to a write store (typically a relational DB). Change events then flow to a projection process that updates the read store (often a document DB or search index optimized for queries).

**Key principle to emphasize**: The read model is a projection — a denormalized, query-optimized copy of the data. It can be rebuilt at any time by replaying the event history.

**Timing**: ~2 minutes

**Real-world analogy**: The write side is like an accounting ledger (every entry recorded once, in order). The read side is like the financial reports generated from that ledger (formatted for consumption, potentially aggregated).
:::

---

## Architecture Components (Minimum 7)

| Component | Responsibility |
|-----------|---------------|
| **Command API** | Accept, validate, route commands |
| **Command Handler** | Orchestrate domain operations |
| **Write Store** | Transactional DB for aggregates |
| **Event/Change Publisher** | Emit domain or integration events |
| **Projection/Read Updater** | Build and maintain read models |
| **Query API** | Serve read models with filtering & pagination |
| **Read Store** | Query-optimized DB (document, search, etc.) |

::: notes
These seven components form the minimum viable CQRS implementation. Each has a clear, single responsibility.

**Walk through the flow**:
1. Client sends a command to the Command API
2. Command Handler loads the aggregate from the Write Store
3. Aggregate validates invariants and applies the change
4. Write Store persists the change (transaction)
5. Event/Change Publisher emits an event
6. Projection/Read Updater subscribes to events and updates the Read Store
7. Client queries the Query API, which reads from the Read Store

**Timing**: ~3 minutes

**Common shortcut to avoid**: Skipping the Event Publisher and having the Command Handler directly update the Read Store ("dual write"). This creates consistency risks — if the Read Store update fails, your read model is stale with no way to detect or recover.
:::

---

## Command Model Design

**Rules for commands**:
- Use **task-based names**: `CreateOrder`, `ApproveOrder`, `CancelShipment`
- Validate at the boundary — reject invalid commands fast
- Use **aggregates** to enforce invariants
- One command → one aggregate root
- Handlers are **deterministic** and side-effect controlled

```csharp
// Command
public record ApproveOrderCommand(Guid OrderId, Guid ApproverId)
    : IRequest<Result<ApprovalResult>>;

// Handler
public class ApproveOrderHandler
    : IRequestHandler<ApproveOrderCommand, Result<ApprovalResult>>
{
    public async Task<Result<ApprovalResult>> Handle(
        ApproveOrderCommand cmd, CancellationToken ct) { ... }
}
```

::: notes
Task-based command names reflect business intent rather than CRUD operations. "ApproveOrder" is far more descriptive than "UpdateOrder" — it captures the domain action and makes event history readable.

**Key design rules**:
- Commands can fail; include a Result pattern or throw domain exceptions
- An aggregate root owns all invariants for a consistency boundary
- Never let a command handler query the read store — use the write store only
- Validation at the command boundary (FluentValidation, annotations, etc.) prevents invalid state from ever reaching the aggregate

**Timing**: ~3 minutes

**Example**: In an e-commerce system, `ApproveOrder` might check: is the order in `Pending` state? Has inventory been reserved? Does the approver have the right role? All of these are invariants the aggregate enforces.
:::

---

## Query Model Design

**Rules for queries**:
- Shape the query **for the consumer** (UI, API client) — not for the domain
- Avoid joins and complex calculations at query time
- Use **projections** updated from events or change feeds
- Keep read models **versioned** and **rebuildable**

**Consistency matrix**:

| Need Strong Consistency | Need Eventual Consistency |
|------------------------|--------------------------|
| Payments | Dashboards |
| Inventory checks | Activity feeds |
| Security/auth | Analytics |

::: notes
The read model should look exactly like what the consumer needs. If your UI shows an "order summary" card, create an `OrderSummaryView` projection that has exactly those fields — don't force the UI to join Order + Customer + LineItems at query time.

**Rebuildability is critical**: Because the read model is derived from events, it can always be rebuilt from scratch. This means you can add a new projection (e.g., a search index) without migrating data — just replay the event stream.

**Consistency matrix explanation**:
- Payments must reflect the current truth immediately — use the write store or enforce strong consistency
- A dashboard showing "total orders this week" can be a few seconds stale — eventual consistency is fine

**Timing**: ~3 minutes
:::

---

## CQRS Anti-Patterns

| ❌ Anti-Pattern | ✅ Correct Approach |
|----------------|-------------------|
| Query logic in command handlers | Separate Query API reads from Write Store |
| Same ORM model for reads and writes | Distinct read and write model classes |
| Over-applying CQRS to simple CRUD | Use CQRS only where complexity justifies it |
| Dual writes without an outbox | Use the Outbox pattern for reliable event publication |

**Migration strategy**: Start with one bounded context → split read model first → add event publishing incrementally.

::: notes
**The most dangerous anti-pattern: dual writes without an outbox.**
If your command handler writes to the database AND directly updates the read store, you have two separate write operations with no atomic guarantee. If the second write fails, your read model is permanently stale.

**The Outbox Pattern**:
1. Write the domain change + an outbound event to the database in one transaction
2. A background process reads the outbox and publishes events to the message broker
3. The projection consumer receives the event and updates the read store

**Migration tip**: You don't have to refactor your entire application at once. Pick one feature (e.g., order history), create a read model projection for it, and leave everything else unchanged. Prove the pattern works before expanding.

**Timing**: ~3 minutes

**Transition**: "With CQRS covered, let's move to a practical tool you'll use every day — the GitHub CLI."
:::

---

<!-- ============================================================ -->
<!-- MODULE 3: GITHUB CLI -->
<!-- ============================================================ -->

# Module 3

## GitHub CLI

*`gh` — GitHub on the Command Line*

::: notes
This section divider marks the start of Module 3: GitHub CLI.

**Module Duration**: Approximately 20 minutes

**Module Description**: Covers using the `gh` CLI for issue management, pull request workflows, GitHub Actions monitoring, and CI/CD integration.

**Prerequisites**: Basic familiarity with GitHub (issues, PRs) and a terminal.

**Transition**: "Let's start with issue management."
:::

---

## Why Use the GitHub CLI?

- Work in your terminal without switching to the browser
- Scriptable — automate repetitive GitHub workflows
- Available on macOS, Windows, Linux
- First-class integration with GitHub Actions and CI/CD

```bash
# Install
brew install gh         # macOS
winget install gh       # Windows
sudo apt install gh     # Ubuntu/Debian

# Authenticate
gh auth login
```

::: notes
The GitHub CLI (`gh`) was released in 2020 and has become the standard way to interact with GitHub from scripts and terminal workflows. It uses the GitHub REST and GraphQL APIs under the hood but provides a human-friendly interface.

**Key advantages over the REST API directly**:
- Authentication handled automatically (no token management in scripts)
- Output formatting with `--json` and `--jq` for scripting
- Native support for GitHub Actions workflows

**First run after install**:
```bash
gh auth login
# Follow the browser-based OAuth flow
gh auth status
# Verify authentication succeeded
```

**Timing**: ~2 minutes
:::

---

## Issue Management

```bash
# Create an issue with full metadata
gh issue create \
  --title "Bug: Login fails for SSO users" \
  --body "Detailed reproduction steps..." \
  --assignee @me \
  --label "bug,high-priority" \
  --milestone "v2.1.0"

# List open issues assigned to me
gh issue list --assignee @me --state open

# View issue with comments
gh issue view 123 --comments

# Close with a comment
gh issue close 123 --comment "Fixed in PR #456"
```

::: notes
The `gh issue` command group covers the full issue lifecycle: create, list, view, edit, close, reopen, pin, unpin, and transfer.

**Flags to know**:
- `--json` + `--jq` — extract specific fields for scripting
- `--template` — use an issue template from `.github/ISSUE_TEMPLATE/`
- `--body-file` — read the body from a file (great for long descriptions)

**Custom query example**:
```bash
gh issue list \
  --json number,title,state,assignees \
  --jq '.[] | select(.assignees | length > 0) | "\(.number): \(.title)"'
```

**Timing**: ~3 minutes

**Live demo tip**: Create a test issue with `gh issue create --title "Test" --body "Demo" --label "test"` and immediately close it.
:::

---

## Pull Request Workflows

```bash
# Create a PR from the current branch
gh pr create \
  --title "feat: add SSO support" \
  --body "Implements SAML 2.0 SSO..." \
  --reviewer security-team \
  --draft

# Review status
gh pr checks 456
gh pr view 456 --comments

# Merge strategies
gh pr merge 456 --squash --subject "feat: SSO support"
gh pr merge 456 --auto --squash   # merge when all checks pass
```

::: notes
The `gh pr` command group mirrors the full GitHub PR UI from the terminal.

**Workflow patterns**:
1. **Draft PRs**: Create with `--draft`, remove draft status with `gh pr ready 456` when the work is done
2. **Auto-merge**: `gh pr merge --auto --squash` is ideal for dependency update PRs — they merge automatically when CI passes
3. **Review requests**: `--reviewer` accepts usernames and team slugs (`@org/team-name`)

**Useful shortcut**:
```bash
# Open the current branch's PR in the browser
gh pr view --web
```

**Timing**: ~3 minutes

**Best practice**: Always use `--squash` for feature branches to keep the main branch history clean. Use `--merge` only for release branches where you want to preserve commit history.
:::

---

## GitHub Actions via `gh`

```bash
# List recent workflow runs
gh run list --workflow=ci.yml --limit 10

# Watch a running workflow in real time
gh run watch 123456

# View logs for a failed job
gh run view 123456 --log

# Re-run only failed jobs
gh run rerun 123456 --failed-jobs

# Trigger a workflow manually
gh workflow run deploy.yml \
  --ref main \
  -f environment=staging
```

::: notes
The `gh run` and `gh workflow` command groups are indispensable for CI/CD debugging.

**Debugging workflow**:
1. `gh run list --status=failure` — find recent failures
2. `gh run view <id> --log` — read the full log
3. `gh run rerun <id> --failed-jobs` — re-run only what failed (saves CI minutes)

**Workflow inputs**:
The `-f key=value` flag passes `workflow_dispatch` inputs. Multiple `-f` flags are supported.

**Enabling/disabling workflows**:
```bash
gh workflow disable dependabot-auto-merge.yml
gh workflow enable dependabot-auto-merge.yml
```

**Timing**: ~3 minutes

**Audience interaction**: "Who has used `gh run view --log` to debug a failing pipeline?" This is one of the most time-saving features of the CLI.
:::

---

## CI/CD Scripting with `gh`

```yaml
# .github/workflows/ci.yml — comment on PR after tests pass
- name: Comment on PR
  if: github.event_name == 'pull_request'
  run: |
    gh pr comment ${{ github.event.number }} \
      --body "✅ All tests passed — ready for review."
  env:
    GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

```bash
# Deployment gate script
if gh pr checks $PR_NUMBER --json state \
    -q '.[] | select(.state != "completed")' | grep -q .; then
  echo "Checks still running — aborting deploy"
  exit 1
fi
gh pr merge $PR_NUMBER --squash
```

::: notes
The `gh` CLI shines in automation scripts. The `GITHUB_TOKEN` environment variable is automatically available in GitHub Actions, so no extra setup is needed.

**Common automation patterns**:
1. **Post-test PR comments** — notify reviewers when CI passes
2. **Deployment gates** — block deploys until PR checks are green
3. **Auto-labeling** — add labels based on file changes
4. **Stale issue management** — close or comment on issues with no activity

**Shell completion**:
```bash
eval "$(gh completion -s bash)"   # bash
eval "$(gh completion -s zsh)"    # zsh
```

**Timing**: ~2 minutes

**Transition**: "Now let's look at a structured approach for turning business requirements into implementable vertical slices."
:::

---

<!-- ============================================================ -->
<!-- MODULE 4: BUSINESS RULES TO VERTICAL SLICES -->
<!-- ============================================================ -->

# Module 4

## Business Rules to Vertical Slices

*Extract · Identify · Define · Design*

::: notes
This section divider marks the start of Module 4: Business Rules to Vertical Slices.

**Module Duration**: Approximately 20 minutes

**Module Description**: Covers the structured process of analyzing business requirements, extracting business rules, identifying use cases, defining feature boundaries, and designing vertical slices for implementation.

**Prerequisites**: Basic familiarity with agile user stories is helpful.

**Transition**: "Let's walk through the analysis workflow."
:::

---

## The Analysis Workflow

**6-step process** for any requirement document:

1. **Acknowledge & Clarify** — confirm scope and assumptions
2. **Extract Business Rules** — scan for must/cannot/when patterns
3. **Identify Use Cases** — find actor-action-goal pairs
4. **Define Features** — group use cases by cohesion
5. **Design Vertical Slices** — break features into independent, shippable slices
6. **Present Analysis** — structured output with IDs and links

::: notes
This workflow is the canonical process from `business-rules-to-slices.instructions.md`. AI assistants should follow these six steps whenever a user asks to analyze requirements or design features.

**Why this order?**
- You can't design slices without knowing the features
- You can't define features without knowing the use cases
- You can't identify use cases without first extracting the underlying rules

**Key output**: A numbered catalog of business rules (BR-###), use cases (UC-###), features (F-###), and vertical slices (S-###-###) — all cross-linked.

**Timing**: ~2 minutes

**Audience interaction**: Ask — "What's the difference between a business rule and a use case?" (A rule is a constraint or fact; a use case is a goal-directed interaction.)
:::

---

## Business Rule Extraction — 4 Types

| Type | Pattern | Example |
|------|---------|---------|
| **Structural** | "A [entity] has/is/contains..." | "A customer must have an email" |
| **Operative** | "Must/cannot/should [action]" | "Emails must be unique" |
| **Derivation** | "Calculated as / equals..." | "Total = subtotal + tax − discounts" |
| **Action Enabler** | "When [event], [action]..." | "When registered, send welcome email" |

**Triggers to scan for**: `must`, `should`, `cannot`, `shall`, `when`, `automatically`, `calculated as`

::: notes
These four categories cover the full range of business rules found in requirements documents, contracts, and policy documents.

**ID assignment rule**: Number rules sequentially — BR-001, BR-002, etc. This makes it easy to cross-reference rules in use cases and acceptance criteria.

**Ambiguity flag**: When a rule is vague, flag it:
```
⚠️ BR-050: NEEDS CLARIFICATION
Statement: "Passwords must be strong"
Suggested: "Passwords must be 8–20 chars with uppercase, lowercase, and digit"
```

**Timing**: ~3 minutes

**Live exercise**: Show a short requirement paragraph and ask the class to identify the rule types before revealing the answer.
:::

---

## Use Case Identification

**Pattern**: `[Actor] [verb] [object]` → Use Case Name

```markdown
**UC-010**: Request Password Reset

- **Actor**: User (forgot password)
- **Goal**: Initiate password reset process
- **Preconditions**: User has a registered account
- **Main Flow**:
  1. User enters email address
  2. System validates email exists
  3. System generates reset token (1-hour expiry)
  4. System sends reset email with link
- **Alternative Flows**:
  - 3a. Email not found → generic message (security)
- **Business Rules**: BR-020, BR-021
```

::: notes
Use cases describe *what* the system does for an actor, not *how* it does it. They should be technology-agnostic.

**Finding use cases in requirements**:
- Look for actor + verb + object: "User resets their forgotten password"
- Look for user stories: "As a user, I want to reset my password so that I can regain access"
- Look for workflow descriptions: "First the user..., then the system..., finally..."

**Template fields**:
- Main flow = happy path only
- Alternative flows = error cases, edge cases, variations
- Preconditions = what must be true before the use case starts
- Postconditions = what is true after successful completion

**Timing**: ~3 minutes
:::

---

## Feature Boundary Definition

**4 tests every feature must pass**:

| Test | Question | Failure Sign |
|------|----------|-------------|
| **Cohesion** | Do all parts naturally belong together? | "User Management" (too broad) |
| **Independence** | Can it be implemented without other features? | Tightly coupled to 3 other features |
| **Value** | Does it deliver complete user value? | "Validate Credit Card" (partial) |
| **Size** | Can it be done in 1–5 days? | "Full E-commerce Platform" |

::: notes
Feature boundaries are the hardest part of vertical slice design. The four tests give you objective criteria to validate your boundaries.

**Cohesion test in practice**: If you find yourself saying "...and also..." while describing a feature, it probably needs to be split.

**Independence test in practice**: Draw a dependency graph. If a feature has edges going to more than 1–2 other features, reconsider the boundary.

**Value test in practice**: Ask "can a user *do something meaningful* with just this feature?" If the answer is no, combine it with a related feature.

**Size test in practice**: 1–5 days is a rough guide for a small team. The key is that the feature should be completable, releasable, and testable within a single sprint.

**Timing**: ~3 minutes
:::

---

## Vertical Slice Design

**Each slice must be**:
- **Complete** — spans all layers (DB → handler → API → test)
- **Valuable** — user can do something meaningful
- **Independent** — can be deployed separately
- **Testable** — has clear acceptance criteria

```markdown
**Slice S-001-1**: Basic User Registration

- Files: RegisterUserCommand, RegisterUserHandler,
         RegisterUserValidator, RegistrationResult, tests
- Endpoint: POST /api/users/register
- Acceptance: Given valid inputs → account created, 201 returned
- Business Rules: BR-001, BR-002, BR-003
```

::: notes
Vertical slices are the unit of delivery. Each slice should produce working, tested software that can be reviewed and merged independently.

**Decomposition strategies**:
1. **MVS (Minimal Viable Slice)**: Start with the absolute minimum; add error handling and edge cases in subsequent slices
2. **Happy path first**: Implement the success path completely before handling errors
3. **Core + Extensions**: Deliver essential functionality first, add optional enhancements as separate slices

**The slice template** (from the instructions):
- Slice ID (S-[feature-id]-[number])
- User story
- Business rules referenced
- Acceptance criteria (checkboxes)
- Files to create
- API contract
- Database changes (if any)
- Dependencies
- Test scenarios

**Timing**: ~3 minutes

**Transition**: "In the final module, we'll look at how to create custom GitHub Copilot agents that embody these domain-specific workflows."
:::

---

<!-- ============================================================ -->
<!-- MODULE 5: CREATING CUSTOM GITHUB COPILOT AGENTS -->
<!-- ============================================================ -->

# Module 5

## Creating Custom GitHub Copilot Agents

*Specialized AI Assistants for Your Domain*

::: notes
This section divider marks the start of Module 5: Creating Custom GitHub Copilot Agents.

**Module Duration**: Approximately 20 minutes

**Module Description**: Covers creating, configuring, and deploying custom GitHub Copilot agents — from file naming and YAML frontmatter to tool configuration and best practices.

**Prerequisites**: Access to GitHub Copilot in VS Code or GitHub.com.

**Transition**: "Let's start with what custom agents are and where they live."
:::

---

## What Are Custom Agents?

Custom agents are **specialized Copilot assistants** scoped to a domain or workflow.

- Defined in a single `.agent.md` file
- Activated with `@agent-name` in Copilot Chat
- Can have restricted or full tool access
- Support MCP server integrations (org/enterprise only)

**Repository agent** → `.github/agents/<name>.agent.md`
**Org/Enterprise agent** → `agents/<name>.agent.md` (root)
**User agent** (VS Code only) → user profile folder

::: notes
Custom agents were introduced to give teams a way to create AI assistants with domain-specific expertise embedded in the system prompt — without having to retype instructions in every chat.

**Why custom agents over promptfiles?**
- Agents define *who Copilot is* in a conversation (persona, expertise, constraints)
- Promptfiles define *what task to perform* (reusable task templates)
- An agent persists across the conversation; a promptfile is a one-shot invocation

**Availability**:
- Repository agents: available to all repo collaborators
- Org/Enterprise agents: available across all repositories
- User agents: personal, only in VS Code

**Timing**: ~3 minutes
:::

---

## File Structure & Naming

```
.github/
└── agents/
    ├── security-analyzer.agent.md
    ├── test-specialist.agent.md
    └── documentation-assistant.agent.md
```

**Filename rules**:
- Extension: `.agent.md` (required)
- Characters: `.`, `-`, `_`, `a-z`, `A-Z`, `0-9` only
- Case: kebab-case recommended

✅ `security-analyzer.agent.md`
❌ `security analyzer.agent.md` (no spaces)
❌ `security@analyzer.agent.md` (invalid `@`)

::: notes
The file extension `.agent.md` is required — GitHub uses it to identify agent files in the `.github/agents/` directory. Files with other extensions in that directory are ignored.

**Creating an agent via VS Code**:
1. Open Copilot Chat
2. Click the agent dropdown → "Configure Custom Agents..."
3. Click "+ Create new custom agent"
4. Choose repository location
5. VS Code creates the file in `.github/agents/`

**Creating via GitHub.com**:
1. Go to github.com/copilot/agents
2. Select your repository
3. Click the Copilot icon → "Create an agent"
4. Edit the generated template and commit

**Timing**: ~2 minutes
:::

---

## YAML Frontmatter

```yaml
---
name: security-analyzer          # optional — defaults to filename
description: Expert security analyst for OWASP Top 10 detection  # REQUIRED
tools: ["read", "search", "create_issue"]  # restrict tools
model: "gpt-4"                   # IDE-specific only
target: "vscode"                 # vscode | github-copilot | omit for both
---
```

**Property summary**:
| Property | Required | Notes |
|----------|----------|-------|
| `description` | ✅ Yes | Shown in the agent picker |
| `name` | No | Defaults to filename without extension |
| `tools` | No | Omit for full tool access |
| `mcp-servers` | No | Org/Enterprise only |

::: notes
**`description` is the only required field** — it must clearly state what the agent does.

**Tool restriction best practices**:
- Security agents: restrict to `["read", "search", "create_issue"]` — no production code edits
- Test agents: `["read", "search", "create", "edit", "test"]` — only modify test files
- Documentation agents: `["read", "edit", "create", "github"]` — file operations plus GitHub

**`mcp-servers` (org/enterprise)**:
Enables custom MCP (Model Context Protocol) servers that extend the agent with external tool capabilities — e.g., a weather API, internal knowledge base, or custom code analysis tool.

**Timing**: ~3 minutes
:::

---

## Writing the Agent Prompt

**Structure** (under 30,000 characters):

```markdown
---
description: Expert security analyst for OWASP Top 10 detection
tools: ["read", "search", "create_issue"]
---

You are a security specialist focused on vulnerability detection.

## Core Expertise
- **Vulnerability Detection**: OWASP Top 10, CWE patterns
- **Static Analysis**: Security anti-patterns, injection flaws
- **Reporting**: GitHub issues with CVSS scores and remediation steps

## Key Principles
- Analyze code without modifying production files
- Reference OWASP and CWE standards in every finding
- Provide actionable, specific remediation guidance
```

::: notes
The prompt content is what makes an agent genuinely useful. It defines the agent's mission, expertise, methodology, and behavioral constraints.

**Content guidelines**:
- **Mission statement**: 1–3 paragraphs, specific and domain-focused
- **Core expertise**: 5–10 specific capability areas (not generic)
- **Methodology**: optional step-by-step approach for complex tasks
- **Constraints**: what the agent should NOT do (critical for safety)
- **Examples**: interaction examples help users understand how to invoke the agent

**What NOT to include**:
- Generic statements like "You are a helpful assistant"
- Instructions to use a different model
- Behavioral personas ("You are friendly and enthusiastic")
- Repository-wide rules (those belong in `.github/instructions/`)

**Timing**: ~3 minutes
:::

---

## Agent Best Practices

| ✅ Do | ❌ Don't |
|-------|---------|
| Define a focused, specific domain | Try to do everything |
| Restrict tools to minimum needed | Give terminal access to a security-only agent |
| Include concrete examples | Leave users guessing how to invoke it |
| State what the agent will NOT do | Make promises you can't keep |
| Keep prompts under 30k characters | Write 50+ pages of instructions |

**Test your agent**: Check that `@agent-name` appears in the Copilot picker after committing to the default branch.

::: notes
**The single most important best practice**: Start narrow. A focused agent that does one thing excellently is far more valuable than a broad agent that does many things adequately.

**Iteration cycle**:
1. Write a minimal agent (mission + 3–5 expertise areas)
2. Test with real use cases
3. Identify gaps and refine the prompt
4. Add constraints for anything the agent does incorrectly

**Troubleshooting checklist**:
- Agent not appearing in picker? → Check `.agent.md` extension and location
- Agent not following instructions? → Review prompt for conflicts; tighten constraints
- Tool access errors? → Verify `tools` array has the correct tool names
- Character limit exceeded? → Trim examples; keep methodology sections concise

**Timing**: ~3 minutes

**Final transition**: "That wraps up all five modules. Let me summarize the key takeaways."
:::

---

## Class 311 — Summary

| Module | Key Takeaway |
|--------|-------------|
| **AI Output Standards** | 11 required provenance fields; embed front matter; log every chat |
| **CQRS** | Separate write and read models; use the Outbox pattern; rebuild projections from events |
| **GitHub CLI** | Automate issue, PR, and Actions workflows with `gh`; script CI gates |
| **Business Rules → Slices** | Extract 4 rule types → use cases → feature tests → complete vertical slices |
| **Custom Agents** | `.agent.md` in `.github/agents/`; focus the domain; restrict tools |

::: notes
This final summary slide recaps the core takeaway from each module in one sentence.

**Closing message**:
The common thread across all five modules is **clarity and accountability** — whether it's provenance metadata tracking who created an AI artifact, CQRS separating concerns to make each responsibility clear, CLI automation replacing manual steps, structured analysis turning vague requirements into shippable slices, or focused agents that know exactly what they do and don't do.

**Questions to prompt discussion**:
1. "Which module will have the most immediate impact on your day-to-day work?"
2. "Where do you see the biggest gap between what we covered and your current practices?"
3. "What would you add to the custom agents module for your team's specific domain?"

**Resources**:
- Repository: `johnmillerATcodemag-com/AI-Assisted-Software-Development`
- Instructions folder: `.github/instructions/`
- Prompts folder: `.github/prompts/`

**Timing**: ~5 minutes for Q&A after this slide
:::
