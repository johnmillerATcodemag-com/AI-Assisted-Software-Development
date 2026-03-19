---
ai_generated: true
model: "anthropic/claude-sonnet-4.5@2026-03-18"
operator: "johnmillerATcodemag-com"
chat_id: "merge-marp-decks-20260318"
prompt: |
  Follow instructions in merge-marp-decks.prompt.md — merge all individual Marp slide
  decks from Slides/individual-slides/ into a single combined presentation
started: "2026-03-18T23:25:18Z"
ended: "2026-03-18T23:55:00Z"
task_durations:
  - task: "read individual decks"
    duration: "00:05:00"
  - task: "assemble combined deck"
    duration: "00:20:00"
  - task: "add section dividers and speaker notes"
    duration: "00:08:00"
total_duration: "00:33:00"
ai_log: "ai-logs/2026/03/18/merge-marp-decks-20260318/conversation.md"
source: ".github/prompts/merge-marp-decks.prompt.md"
marp: true
theme: default
paginate: true
---

# AI-Assisted Software Development

## Complete Training Course

*GitHub Copilot · CQRS · Dependency Management · GitHub CLI · Vertical Slices · Custom Agents*

::: notes
Welcome to the AI-Assisted Software Development complete training course. This combined presentation covers six modules: AI output standards, CQRS architecture, dependency management policy, GitHub CLI workflows, business rules to vertical slices, and creating custom GitHub Copilot agents.

**Timing**: 1 minute

**Course Overview**:
This deck merges six individual module presentations into a single comprehensive course. Each module is separated by a section divider slide so you can navigate or present individual sections.

**Modules in This Deck**:
1. **AI-Assisted Output** — Mandatory metadata, logging workflow, and CI enforcement for all AI-generated artifacts
2. **CQRS Architecture** — When to use CQRS, core principles, components, consistency strategies, and anti-patterns
3. **Dependency Management Policy** — Risk classification, selection criteria, vulnerability monitoring, and supply chain security
4. **GitHub CLI** — Issue and PR management, Actions monitoring, code review, and CI/CD integration
5. **Business Rules to Vertical Slices** — Extracting rules, identifying use cases, defining feature boundaries, and designing slices
6. **Creating Custom Agents** — Creating, configuring, and deploying custom GitHub Copilot agents across environments

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

**Module Description**: Mandatory metadata, logging workflow, and CI enforcement for all AI-generated artifacts.

**Prerequisites**: Familiarity with previous modules is helpful but not required for this module.

**Transition**: "Let's dive into AI-Assisted Output."
:::

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

## Conversation Log Template

```markdown
# AI Conversation Log

- Chat ID: <chat-id>
- Operator: <github-username>
- Model: <provider/model@version>
- Started: <ISO8601>
- Ended: <ISO8601>

## Context
- Inputs: [files referenced]
- Targets: [files to create]
- Constraints: [applicable policies]

## Exchanges

### Exchange 1
[timestamp] User
> [exact prompt text]

[timestamp] Model
> [summary of response and artifacts created]
```

::: notes
The conversation.md template ensures all key information is captured consistently.

**Timing**: 2 minutes

**Key Points**:
- The header captures who, what model, and when
- Context section identifies inputs, outputs, and constraints
- Each exchange is timestamped and includes both sides of the conversation
- The "exact prompt text" requirement means copy-paste — no paraphrasing

**Audience Question**: "Why do we require the exact prompt text rather than a summary?"
Answer: Exact prompts allow reproduction of the output and help identify prompt injection risks.

**Transition**: "Let's look at quality gates — how do we enforce these standards automatically?"
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

**Transition**: "Let's wrap up with key takeaways."
:::

---

## Key Takeaways

- **Every AI artifact** needs complete provenance metadata
- **ai-logs** must be created **before** generating artifacts
- **Exact prompts** — not summaries — go in the conversation log
- **CI enforces** the policy — blocking non-compliant merges
- **README entries** make AI contributions discoverable

### Next Steps

1. Review `.github/instructions/ai-assisted-output.instructions.md`
2. Add the PR checklist to your team's PR template
3. Set up CI lint check for provenance metadata

::: notes
Wrap up with the essential points and clear next steps.

**Timing**: 2 minutes

**Summary**:
- Provenance metadata is mandatory for every AI-generated file
- The 10-field YAML block goes in the front matter of Markdown files
- ai-logs create an auditable trail of AI-assisted work
- CI enforcement makes the policy a hard requirement
- README updates make AI contributions visible to the whole team

**Call to Action**: Ask participants to review the ai-assisted-output.instructions.md file this week and identify any gaps in their current workflow.

**Q&A**: Open the floor for questions about specific metadata fields or enforcement patterns.
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

**Module Description**: When to use CQRS, core principles, components, consistency strategies, and anti-patterns.

**Prerequisites**: Familiarity with previous modules is helpful but not required for this module.

**Transition**: "Let's dive into CQRS Architecture."
:::

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

**Audience Question**: "Has anyone implemented something like CQRS without knowing it had a name?"

**Transition**: "Let's look at the core principles that underpin CQRS."
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

**Common Misconception**: CQRS does not require separate databases. You can start with a single database and separate logical models before introducing physical separation.

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

**Key Components**:
- **Command API**: Validates input, routes to appropriate handler
- **Command Handler**: Enforces invariants, orchestrates domain operations
- **Write Store**: OLTP database for aggregates and consistency
- **Event Publisher**: Reliable event emission (use outbox pattern)
- **Projection Updater**: Maintains read models from events
- **Query API**: Serves denormalized, query-optimized data
- **Read Store**: OLAP or document store optimized for reads

**Transition**: "Let's look at command model design in more detail."
:::

---

## Command Model Design

**Commands** — task-based, intention-revealing names:
- `CreateOrder` / `ApproveOrder` / `CancelOrder`
- `RegisterUser` / `UpdateShippingAddress`

**Rules**:
1. Validate at the command boundary — reject early
2. Use aggregates to enforce invariants and consistency
3. Keep handlers deterministic and side-effect controlled
4. Write to a single source of truth
5. One command targets one aggregate root

::: notes
Good command design is the foundation of a maintainable CQRS system.

**Timing**: 3 minutes

**Key Points**:
- Task-based command names reveal business intent — much better than `UpdateOrder`
- Aggregates are the consistency boundary — they decide if a command is valid
- Early validation prevents unnecessary database round-trips
- A single aggregate per command keeps transactions simple
- Side effects (email, events) should happen after the transaction commits

**Code Example**:
```csharp
public record ApproveOrderCommand(Guid OrderId, string ApprovedBy);

public class ApproveOrderHandler : ICommandHandler<ApproveOrderCommand>
{
    public async Task Handle(ApproveOrderCommand cmd)
    {
        var order = await _repo.GetAsync(cmd.OrderId);
        order.Approve(cmd.ApprovedBy);  // Aggregate enforces rules
        await _repo.SaveAsync(order);
        await _publisher.PublishAsync(new OrderApprovedEvent(order.Id));
    }
}
```

**Transition**: "Now for query model design."
:::

---

## Query Model Design

**Queries** — shaped for the consumer use case:
- Avoid joins and complex calculations at query time
- Use projections updated from events or change feeds
- Keep models versioned and rebuildable
- Optimize for latency and throughput

**Types**:
| Query Type | Example | Store |
|-----------|---------|-------|
| List/Search | Product catalog | Elasticsearch |
| Detail | Order details | Relational DB |
| Analytics | Revenue dashboards | OLAP / Data Warehouse |

::: notes
The query model is designed entirely around how data will be consumed.

**Timing**: 2 minutes

**Key Points**:
- Query models are "read-only databases" shaped for specific views
- Different query types may use different storage technologies
- Projections are pre-computed at write time, not at query time
- Rebuilding a projection means replaying events through the updater

**Design Tip**: Start by designing the query response first, then work backward to what the projection needs to store.

**Practical Consideration**: Version your projections. When you change a query model, you'll need to rebuild it from the event history.

**Transition**: "Let's talk about consistency — one of the most challenging aspects of CQRS."
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

**The Outbox Pattern**:
1. Within the same database transaction: write the domain change AND an outbox event record
2. A background process reads unprocessed outbox events and publishes them to the message broker
3. Mark events as processed after successful publication
4. Consumers handle duplicates idempotently

**Transition**: "What common mistakes should we avoid?"
:::

---

## Anti-Patterns to Avoid

| Anti-Pattern | Problem | Solution |
|-------------|---------|----------|
| Mixed query in command handler | Breaks separation of concerns | Query read model separately |
| Shared ORM model for reads/writes | Couples both models | Use separate query DTOs |
| CQRS on simple CRUD | Unnecessary complexity | Use simple repository pattern |
| Dual writes without outbox | Risk of lost events | Implement outbox pattern |

::: notes
These anti-patterns are the most common mistakes in CQRS implementations.

**Timing**: 2 minutes

**Key Points**:
- The most common mistake is reading from the write store in a query context
- Sharing a single ORM model defeats the purpose of model separation
- Over-engineering is real — CQRS adds complexity that's only worth it in the right domains
- Dual writes (write to database AND directly to message broker) will eventually lose events

**Red Flag**: If your CQRS system has more infrastructure than business logic, you've likely over-applied the pattern.

**Transition**: "Let's look at how to migrate an existing system to CQRS incrementally."
:::

---

## Migration Strategy

**Start small, migrate incrementally:**

1. **Identify** one bounded context or high-value feature
2. **Split read model** first — keep write model intact
3. **Add projections** and read store incrementally  
4. **Introduce event publishing** after stable write flow
5. **Expand** to additional contexts over time

**Quality Checklist:**
- [ ] Command and query models are clearly separated
- [ ] Write model enforces all invariants
- [ ] Event publication is reliable (outbox or equivalent)
- [ ] Projection updates are idempotent and monitored

::: notes
Incremental migration reduces risk and allows the team to learn the pattern gradually.

**Timing**: 2 minutes

**Key Points**:
- Big-bang migrations almost always fail — start with one context
- Splitting the read model first gives immediate query performance wins without disrupting writes
- Monitoring projection lag is essential once you go to production
- The checklist should be part of every CQRS code review

**Success Story Pattern**: Start with the reporting/analytics use case — these almost always benefit from a separate read model and the risk is lower than transactional paths.

**Transition**: "Let's look at a concrete flow example to tie it all together."
:::

---

## Example: Order Approval Flow

**Command flow (write)**:
1. API receives `ApproveOrder` command
2. Command handler loads `Order` aggregate
3. Aggregate validates approval rules
4. Transaction commits to write store
5. `OrderApproved` event published via outbox

**Query flow (read)**:
1. UI requests order summary dashboard
2. Query API reads `OrderSummary` projection
3. Read store returns denormalized view
4. Response includes `lastUpdatedUtc` for freshness indicator

::: notes
Tying the concepts together with a concrete example makes the pattern tangible.

**Timing**: 2 minutes

**Key Points**:
- The command and query flows are completely independent paths
- The event bridges the write and read sides asynchronously
- `lastUpdatedUtc` in the query response lets the UI show freshness information
- The UI can display a "processing" indicator while the projection catches up after a command

**Discussion Question**: "What are the tradeoffs of showing the read model data vs. the command result directly after an approval?"

**Key Takeaway**: CQRS is not magic — it's a deliberate architectural choice that pays off when reads and writes truly have different requirements.
:::

---

## Key Takeaways

- **Separate** commands (writes) from queries (reads) at the architectural level
- **Use CQRS** when read/write workloads differ significantly
- **Outbox pattern** ensures reliable event publication
- **Eventual consistency** is the default — design for it intentionally  
- **Start small** — migrate one context at a time

### Further Reading
- Martin Fowler's CQRS article: `martinfowler.com/bliki/CQRS.html`
- Outbox Pattern: `microservices.io/patterns/data/transactional-outbox.html`
- Greg Young's CQRS Documents

::: notes
Summarize the key points and provide resources for deeper learning.

**Timing**: 2 minutes

**Summary**:
- CQRS separates write models (commands) from read models (queries)
- Use it when the complexity pays off — don't over-apply
- Reliable event publication requires the outbox pattern
- Eventual consistency is the norm — manage client expectations
- Incremental migration is the safe approach

**Call to Action**: Review the `cqrs-architecture.instructions.md` file in the repository for implementation checklists and code examples.

**Q&A**: Open the floor for architecture questions and real-world implementation challenges.
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

**Module Duration**: Approximately 20–25 minutes

**Module Description**: Risk classification, selection criteria, vulnerability monitoring, and supply chain security.

**Prerequisites**: Familiarity with previous modules is helpful but not required for this module.

**Transition**: "Let's dive into Dependency Management Policy."
:::

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

**Real-World Context**: The Log4Shell vulnerability in 2021 affected millions of applications. Most teams didn't know they had it because it was a transitive dependency. Risk classification helps identify which transitive dependencies need the most scrutiny.

**Transition**: "How do we actually decide whether to adopt a new dependency?"
:::

---

## Selection Criteria

**Must requirements** (all must pass):
- ✅ Active maintenance (commits within 6 months)
- ✅ Responsive issues (avg response < 2 weeks)
- ✅ Compatible license
- ✅ No known critical vulnerabilities
- ✅ Supports current target platforms

**Should requirements** (weighted scoring):
- Large community or corporate backing (weight: 3)
- Regular release cadence (weight: 2)
- Test coverage > 80% (weight: 2)
- Backward compatibility guarantees (weight: 1)

::: notes
Selection criteria create a consistent, objective evaluation process for new dependencies.

**Timing**: 3 minutes

**Key Points**:
- All "must" requirements are binary gates — failing any one disqualifies the package
- "Should" requirements create a weighted score that guides decisions
- Corporate backing (e.g., Meta, Google, Microsoft) provides support longevity signal
- License compatibility is often overlooked — GPL code in a commercial product is a legal issue

**Red Flags**: No commits in 12+ months, open critical security issues, unclear ownership, recent ownership transfer (common in supply chain attacks).

**Practical Tip**: Use tools like `deps.dev` or `socket.dev` to automate the initial evaluation.

**Transition**: "What does the approval workflow look like?"
:::

---

## Approval Workflow

```
New Dependency Request
         │
         ▼
  Automated Pre-checks
         │
    ┌────┴────┐
    │         │
   Low      Medium/High/Critical
    │         │
  Auto      Technical Review
 Approve         │
                 ▼
          Security Scan
                 │
                 ▼
          License Review
                 │
                 ▼
            Approve / Reject
                 │
                 ▼
      Update Dependency Registry
```

::: notes
The approval workflow scales review effort to the risk level of the dependency.

**Timing**: 2 minutes

**Walk Through the Flow**:
1. Developer submits a dependency request (via PR or ticket)
2. Automated pre-checks run immediately (vulnerability scan, license detection)
3. Risk level is assessed (Low = auto-approve; Medium+ = human review)
4. Technical review evaluates integration complexity and alternatives
5. Security scan checks for CVEs and supply chain risks
6. License review confirms compatibility with the project's license
7. Approved dependencies are added to the registry

**Key Point**: Low-risk development dependencies (like a test utility) can be auto-approved to avoid slowing down teams. Critical production dependencies always need human review.

**Transition**: "How do we manage versions and updates?"
:::

---

## Version Management

| Update Type | Auto-Update | Review Required | Approval |
|------------|-------------|-----------------|----------|
| Patch (Security) | ✅ Yes | Post-deployment | Automated |
| Patch (Bug Fix) | ✅ Yes | Pre-deployment | Tech Lead |
| Minor (Feature) | ❌ No | Pre-deployment | Tech Lead + QA |
| Major (Breaking) | ❌ No | Architecture Review | Architecture Board |

**Pinning Strategy**:
```yaml
production: "exact"        # react: 18.2.0
development: "patch"       # eslint: ^8.45.0
ai_ml: "minor-locked"      # tensorflow: ~2.13.0
```

::: notes
Version management policy defines when updates happen automatically vs. when they require review.

**Timing**: 2 minutes

**Key Points**:
- Security patches should auto-deploy after testing — the risk of not patching exceeds the risk of the update
- Major version updates nearly always have breaking changes and require architecture review
- Pinning exact versions for production dependencies ensures reproducible builds
- AI/ML packages need minor-locked pinning because model compatibility often requires specific framework versions

**Tool**: Configure Dependabot or Renovate to implement these rules automatically.

**Emergency Rule**: Critical security patches (CVSS 9.0+) must be deployed within 24 hours regardless of the normal schedule.

**Transition**: "How do we monitor for new vulnerabilities?"
:::

---

## Security Vulnerability Monitoring

**Monitoring Stack**:
- GitHub Dependabot alerts (real-time)
- Snyk or OWASP Dependency-Check (CI/CD)
- National Vulnerability Database (NVD) feeds

**Response Time SLAs**:

| Severity | CVSS Score | Response Time | Patch Time |
|----------|-----------|---------------|------------|
| Critical | 9.0–10.0 | 4 hours | 24 hours |
| High | 7.0–8.9 | 24 hours | 72 hours |
| Medium | 4.0–6.9 | 72 hours | 1 week |
| Low | 0.1–3.9 | 1 week | Next release |

::: notes
Proactive monitoring with defined SLAs ensures vulnerabilities are addressed before they become incidents.

**Timing**: 2 minutes

**Key Points**:
- Multiple monitoring tools provide defense in depth — no single tool catches everything
- SLAs create accountability and predictability for security response
- Critical vulnerabilities (CVSS 9+) need immediate escalation — page the on-call if needed
- "Response time" means acknowledging and assessing the issue; "patch time" means deploying the fix

**Operational Note**: Set up Slack/Teams alerts for new critical/high CVEs affecting your dependency tree. Waiting for a weekly email is too slow.

**Transition**: "Let's talk about license compliance — often overlooked but legally important."
:::

---

## License Compliance

**Approved Licenses** (auto-accept):
- MIT, Apache 2.0, BSD 2/3-Clause, ISC, Unlicense

**Requires Review**:
- GNU LGPL 2.1/3.0, Mozilla Public License 2.0

**Prohibited** (without legal approval):
- GNU GPL 2.0/3.0 in proprietary software
- GNU AGPL 3.0 (network copyleft)
- Custom/modified licenses

**Compatibility Matrix** (MIT project):
| Target License | Compatible? | Notes |
|---------------|-------------|-------|
| MIT | ✅ Yes | Perfect |
| Apache 2.0 | ✅ Yes | Can combine |
| GPL 3.0 | ❌ No | Would require GPL |

::: notes
License compliance protects the organization from legal liability.

**Timing**: 2 minutes

**Key Points**:
- Copyleft licenses (GPL, AGPL) require derivative works to be released under the same license — a problem for proprietary software
- AGPL extends GPL to cover network use — especially dangerous for SaaS products
- Apache 2.0 provides explicit patent protection that MIT does not
- Always check transitive dependencies for license changes

**Real-World Risk**: In 2022, several companies received legal notices for embedding GPL-licensed libraries in commercial products without proper compliance. Automated license scanning in CI prevents this.

**Tool Recommendation**: FOSSA or WhiteSource (Mend) for automated license compliance in CI/CD.

**Transition**: "What about supply chain security — protecting against malicious packages?"
:::

---

## Supply Chain Security

**Verification Practices**:
- ✅ Checksum verification for all packages
- ✅ Digital signature validation (where available)
- ✅ Official registry sources only (npm, PyPI, Maven Central)
- ✅ Maintainer reputation and 2FA requirements

**SLSA Framework** (Supply-chain Levels for Software Artifacts):
```
Level 1: Build process documented
Level 2: Tamper-evident build artifacts  ← Target minimum
Level 3: Source verified, build isolated
Level 4: Two-party review, hermetic build
```

**Internal Registry**: Scan all packages before ingestion, quarantine suspicious packages

::: notes
Supply chain attacks are now one of the top threat vectors — SolarWinds, XZ Utils, and dozens of npm package attacks have shown this is real.

**Timing**: 2 minutes

**Key Points**:
- Never install packages from unofficial registries or direct git URLs
- The SLSA framework (from Google) provides a security maturity model for build systems
- An internal registry proxy adds a layer of scanning before packages reach developers
- Package name typosquatting (e.g., `coloers` instead of `colors`) is a common attack vector

**Alarming Statistic**: The XZ Utils backdoor was nearly undetected despite being committed to a widely-used open source library by a sophisticated attacker who spent two years building trust.

**Practical Action**: Enable npm audit / pip audit in your CI pipeline as a basic first step.

**Transition**: "Let's look at automation for dependency updates."
:::

---

## Automated Dependency Updates

**Dependabot Configuration**:
```yaml
# .github/dependabot.yml
version: 2
updates:
  - package-ecosystem: "npm"
    directory: "/"
    schedule:
      interval: "weekly"
      day: "monday"
    open-pull-requests-limit: 5
    reviewers: ["tech-leads"]
    assignees: ["security-team"]
    commit-message:
      prefix: "deps"
```

**Testing Before Auto-merge**:
- Unit tests must pass
- Security scan must pass
- No new license violations

::: notes
Automation removes the burden of manually tracking dependency updates.

**Timing**: 2 minutes

**Key Points**:
- Dependabot creates PRs automatically — your CI pipeline validates them
- Batching updates (weekly rather than immediate) reduces PR noise
- Auto-merge for patch updates with clean test suites is a productivity win
- Set `open-pull-requests-limit` to prevent overwhelming the team with update PRs

**Advanced Setup**: Use Renovate Bot for more sophisticated grouping rules (e.g., group all `@types/*` packages into one PR).

**Transition**: "What's the process when emergencies happen?"
:::

---

## Emergency Patching

**Critical Vulnerability Response (0–4 hours)**:
1. Verify vulnerability and assess impact
2. Notify security incident response team
3. Evaluate available patches or workarounds
4. Deploy to staging, run accelerated test suite
5. Deploy to production with monitoring
6. Document and schedule post-incident review

**Emergency Approval**:
- Critical (CVSS 9.0+): CISO or Security Lead approval sufficient
- High (CVSS 7.0–8.9): Security Lead + Engineering Manager

::: notes
Emergency patching bypasses normal approval gates — but must be documented.

**Timing**: 2 minutes

**Key Points**:
- Speed matters in critical vulnerabilities — reduce approval friction without eliminating oversight
- A CISO-level approval is sufficient for emergency patches — don't require full board review
- Always create a post-incident ticket to follow up with proper testing
- The rollback plan must be prepared before deploying the emergency patch

**Preparation Tip**: Pre-define your emergency escalation contacts and document them in a runbook. Don't figure out who to call when a critical CVE drops at 11pm on a Friday.

**Transition**: "Let's close with key takeaways."
:::

---

## Key Takeaways

- **Classify** dependencies by risk — apply proportional review
- **Automate** vulnerability scanning in CI/CD pipeline
- **Pin** production versions, allow patch auto-updates
- **Monitor** with SLAs — critical CVEs need 24-hour response
- **License** check every dependency, including transitive ones
- **Supply chain** — use official registries and verify checksums

### Quick Wins
1. Enable Dependabot alerts (free, 5 minutes to set up)
2. Add `npm audit --audit-level=high` to CI
3. Run FOSSA or similar for license scanning

::: notes
Close with actionable steps the audience can take immediately.

**Timing**: 2 minutes

**Summary**:
- Risk-based classification prevents over-engineering low-risk decisions
- Automation handles routine updates — humans focus on high-risk changes
- License compliance protects the organization legally
- Supply chain security requires verifying the entire dependency tree
- Emergency procedures must be pre-defined and practiced

**Call to Action**: This week — enable Dependabot alerts on your repository and review the existing open alerts. Most teams have dozens of unaddressed vulnerability alerts.

**Q&A**: Open the floor for questions about specific tooling, policy exceptions, or governance challenges.
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

**Module Description**: Issue and PR management, Actions monitoring, code review, and CI/CD integration.

**Prerequisites**: Familiarity with previous modules is helpful but not required for this module.

**Transition**: "Let's dive into GitHub CLI."
:::

# GitHub CLI

## Supercharge Your GitHub Workflow from the Terminal

*AI-Assisted Software Development*

::: notes
Welcome to the GitHub CLI module. This session covers the `gh` command-line tool and how it can dramatically speed up your GitHub workflows without ever leaving the terminal.

**Timing**: 1 minute for title slide

**Key Points**:
- The GitHub CLI (`gh`) lets you manage issues, PRs, workflows, and more from the terminal
- Eliminates context-switching between the browser and terminal
- Enables scripting and automation of GitHub workflows

**Delivery**: Ask how many people still open the browser to check PR status or create issues. The `gh` tool eliminates most of that context-switching.

**Transition**: "Let's start with managing issues — one of the most common daily tasks."
:::

---

## Issue Management

**Create Issues**:
```bash
# Interactive
gh issue create

# With options
gh issue create \
  --title "Bug: App crashes on startup" \
  --body "Description here" \
  --label "bug,high-priority" \
  --assignee @me
```

**View & List**:
```bash
gh issue list --state open --assignee @me
gh issue view 123 --comments
```

**Operations**:
```bash
gh issue close 123 --comment "Fixed in PR #456"
gh issue edit 123 --add-label "enhancement"
```

::: notes
Issue management is often the first thing developers do with the GitHub CLI.

**Timing**: 3 minutes

**Key Points**:
- `gh issue create` without flags launches an interactive editor — great for complex issues
- `--assignee @me` auto-assigns to the current user without needing your username
- `--body-file issue-description.md` lets you write issue content in your preferred editor
- JSON output with `--json` + `--jq` enables custom formatting and scripting

**Demo Tip**: Run `gh issue list` live to show the current repository's issues. The output is clean and readable without needing to open GitHub.

**Productivity Tip**: Combine with shell aliases: `alias myissues='gh issue list --assignee @me --state open'`

**Transition**: "Pull requests are where `gh` really shines."
:::

---

## Pull Request Essentials

**Create a PR**:
```bash
gh pr create \
  --title "feat: add new feature" \
  --body "Description of changes" \
  --reviewer username1,@org/team-name \
  --draft
```

**Daily PR Commands**:
```bash
gh pr list --author @me          # My open PRs
gh pr checks 456                 # CI status
gh pr diff 456                   # View changes
gh pr checkout 456               # Check out locally
gh pr view 456 --web             # Open in browser
```

**Merging**:
```bash
gh pr merge 456 --squash         # Squash and merge
gh pr merge 456 --auto --squash  # Auto-merge when checks pass
```

::: notes
Pull request management is arguably where the GitHub CLI saves the most time.

**Timing**: 3 minutes

**Key Points**:
- `gh pr create` uses the current branch and detects the base branch automatically
- `--draft` creates a draft PR — useful for early feedback
- `gh pr checks` gives a real-time view of CI status without opening the browser
- `gh pr checkout` is a game-changer — check out any PR for local testing with one command
- `--auto --squash` enables auto-merge once all CI checks pass

**Common Workflow**: Create branch → commit changes → `gh pr create` → `gh pr checks 456` → `gh pr merge 456 --auto`

**Transition**: "Let's look at managing GitHub Actions from the CLI."
:::

---

## GitHub Actions Management

**Workflow Operations**:
```bash
gh run list --status=failure     # Find failed runs
gh run view 123456 --log         # View logs
gh run rerun 123456 --failed-jobs # Rerun failed jobs
gh run watch 123456              # Follow live output
```

**Workflow Control**:
```bash
gh workflow list                 # List all workflows
gh workflow run ci.yml           # Trigger manually
gh workflow run deploy.yml \
  --ref main \
  -f environment=production      # With inputs
```

**Downloads**:
```bash
gh run download 123456 --name artifact-name
```

::: notes
Managing GitHub Actions from the CLI is invaluable during debugging and deployment workflows.

**Timing**: 3 minutes

**Key Points**:
- `gh run list --status=failure` is the fastest way to identify broken builds
- `gh run view --log` streams the full log — no more clicking through the Actions UI
- `gh run rerun --failed-jobs` only reruns the failed jobs, not the entire workflow
- `gh run watch` follows live output — great for monitoring deployments in real-time
- `gh workflow run` with `-f` flags passes workflow dispatch inputs

**CI/CD Integration**: Use `gh run watch` in deployment scripts to wait for a workflow to complete and capture the exit code.

**Transition**: "How do `gh` and PR reviews work together?"
:::

---

## Code Review Workflow

**Requesting & Submitting Reviews**:
```bash
gh pr edit 456 --add-reviewer username1,username2

gh pr review 456 --approve
gh pr review 456 --request-changes \
  --body "Please fix these issues"
gh pr review 456 --comment \
  --body "Looks good, minor suggestions"
```

**Review Status**:
```bash
gh pr status                     # Your assigned reviews
gh pr checks 456                 # CI check results
```

**PR Comments**:
```bash
gh pr comment 456 \
  --body "CI is now passing — ready for review"
```

::: notes
The review workflow in `gh` keeps you in the terminal while managing the full review cycle.

**Timing**: 2 minutes

**Key Points**:
- `gh pr edit --add-reviewer` triggers the review request notification automatically
- You can approve, request changes, or comment — all three standard review actions are supported
- `gh pr status` shows all PRs where you're a reviewer — great for morning standup
- `gh pr comment` is useful in CI scripts to post automated status updates on PRs

**Automation Example**: Post a comment when a deployment succeeds:
```bash
gh pr comment $PR_NUMBER --body "✅ Deployed to staging: $STAGING_URL"
```

**Transition**: "Let's look at integrating `gh` with your development tools."
:::

---

## IDE & CI/CD Integration

**VS Code Integration**:
```bash
# Clone and open in VS Code in one step
gh repo clone owner/repo && cd repo && code .

# Create PR from the VS Code terminal
gh pr create --web
```

**GitHub Actions Integration**:
```yaml
- name: Comment on PR after tests
  if: github.event_name == 'pull_request'
  run: |
    gh pr comment ${{ github.event.number }} \
      --body "✅ All tests passed!"
  env:
    GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

**Shell Completions**:
```bash
eval "$(gh completion -s bash)"   # bash
eval "$(gh completion -s zsh)"    # zsh
```

::: notes
The GitHub CLI integrates cleanly with IDEs, CI pipelines, and shell environments.

**Timing**: 2 minutes

**Key Points**:
- In GitHub Actions, `gh` is available by default — just set GITHUB_TOKEN
- Shell completions are a huge quality-of-life improvement — install them immediately
- The `--web` flag on most commands opens the browser for anything that needs the UI
- VS Code's integrated terminal makes `gh` feel native to the IDE workflow

**CI/CD Power Move**: Use `gh run download` in deployment pipelines to retrieve build artifacts from a previous workflow.

**Important**: The `GITHUB_TOKEN` in Actions has limited permissions by default — you may need to request additional permissions via `permissions:` in your workflow.

**Transition**: "Let's wrap up with essential commands to remember."
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

::: notes
This quick reference slide covers the commands developers use daily.

**Timing**: 2 minutes

**Key Points**:
- These 10 commands cover 90% of daily GitHub workflows
- Bookmark this slide or put it in your team wiki
- `gh pr checkout` is the most underused but most time-saving command
- All commands support `--help` for full option reference

**Installation Reminder**: 
- macOS: `brew install gh`
- Windows: `winget install GitHub.cli`
- Linux: See `cli.github.com` for package manager instructions

Then authenticate: `gh auth login`

**Transition**: "Let's close with key takeaways."
:::

---

## Key Takeaways

- **Replace browser workflows** with terminal commands for issues, PRs, and Actions
- **`gh pr checkout`** — check out any PR locally in seconds  
- **`gh run watch`** — follow live CI output during deployments
- **`gh pr merge --auto`** — queue auto-merge once checks pass
- **Automate** GitHub operations in CI scripts with `GITHUB_TOKEN`

### Getting Started
1. Install: `brew install gh` or `winget install GitHub.cli`
2. Authenticate: `gh auth login`
3. Install completions: `eval "$(gh completion -s bash)"`
4. Try: `gh issue list --assignee @me`

::: notes
Close with the minimal set of things to remember and immediate next steps.

**Timing**: 2 minutes

**Summary**:
- The GitHub CLI eliminates most browser-based GitHub workflows
- Issue and PR management, code review, and Actions monitoring all work from the terminal
- CI/CD integration lets workflows post PR comments and manage checks programmatically
- Shell completions dramatically improve discoverability and speed

**Call to Action**: Install `gh` right now and run `gh issue list --assignee @me` to see your current issues. It takes less than 5 minutes to set up.

**Q&A**: Open the floor for questions about specific commands, scripting use cases, or CI/CD integration patterns.
:::

---

<!-- ============================================================ -->
<!-- MODULE 5: BUSINESS RULES TO VERTICAL SLICES -->
<!-- ============================================================ -->

# Module 5

## Business Rules to Vertical Slices

*From Requirements to Implementable Features*

::: notes
This section divider marks the start of Module 5: Business Rules to Vertical Slices.

**Module Duration**: Approximately 20–25 minutes

**Module Description**: Extracting rules, identifying use cases, defining feature boundaries, and designing slices.

**Prerequisites**: Familiarity with previous modules is helpful but not required for this module.

**Transition**: "Let's dive into Business Rules to Vertical Slices."
:::

# Business Rules to Vertical Slices

## From Requirements to Implementable Features

*AI-Assisted Software Development*

::: notes
Welcome to this module on converting business rules into vertical slices. This session covers how AI assistants should analyze business requirements, extract rules, identify use cases, and design features as vertical slices ready for implementation.

**Timing**: 1 minute for title slide

**Key Points**:
- Business rules must be extracted before vertical slices can be designed
- The workflow is: requirements → rules → use cases → features → slices
- Vertical slices deliver complete user value end-to-end

**Delivery**: Start by asking how many attendees have received vague requirements like "the system should be secure." This module is about making that concrete.

**Transition**: "Let's start with when to apply this analysis approach."
:::

---

## When to Apply This Analysis

**Apply when user requests**:
- "Analyze these requirements"
- "Extract business rules"
- "Break this down into vertical slices"
- "What features do I need?"

**Triggers**:
- Business requirements document provided
- Business process or workflow described
- System or feature design requested

**Do NOT apply when**:
- User only asks for code implementation
- User provides complete technical specifications
- User asks about existing code without new requirements

::: notes
The key trigger is the presence of natural-language business requirements — not technical specifications.

**Timing**: 2 minutes

**Key Points**:
- This analysis is for requirements, not code
- If the user already has technical specs, skip extraction and go straight to design
- The presence of words like "user can", "system should", "must not" are strong triggers
- Clarify ambiguities before extraction — it saves rework

**Example Triggers**:
- "We need users to be able to reset their passwords" → apply this analysis
- "Create a POST /auth/reset endpoint" → skip analysis, go to implementation

**Transition**: "Let's walk through the analysis workflow step by step."
:::

---

## Analysis Workflow

**6-step process**:

1. **Acknowledge & Clarify** — ask questions before extracting
2. **Extract Business Rules** — scan for modal verbs and constraints
3. **Identify Use Cases** — find actor-action pairs and goals
4. **Define Feature Boundaries** — group related use cases
5. **Design Vertical Slices** — break features into complete slices
6. **Present Analysis** — structured output with IDs and links

> Every rule, use case, feature, and slice gets a unique ID  
> (BR-###, UC-###, F-###, S-###-###)

::: notes
The workflow is sequential and builds on each step. Do not skip steps.

**Timing**: 2 minutes

**Key Points**:
- Step 1 is critical — ambiguous requirements produce bad slices
- Unique IDs enable traceability from rule to slice
- The structured output (templates) makes the analysis actionable

**Common Mistake**: Jumping straight to Step 5 (slices) without extracting rules first. This produces features that miss business constraints.

**Audience Interaction**: "What's the most common ambiguity you encounter in requirements?"

**Transition**: "Let's look at business rule extraction in detail."
:::

---

## Business Rule Types

| Type | Pattern | Example |
|------|---------|---------|
| **Structural** | Entity has/is/contains attribute | "A customer must have an email" |
| **Operative** | Entity must/cannot/should action | "Emails must be unique" |
| **Derivation** | Value calculated as formula | "Total = subtotal + tax" |
| **Action Enabler** | When event, action happens | "When registered, send welcome email" |

**Extraction signals**: must, should, cannot, shall, when, automatically, calculated as

::: notes
The four rule types map to different implementation concerns.

**Timing**: 3 minutes

**Key Points**:
- Structural rules become data model constraints
- Operative rules become validation logic in handlers
- Derivation rules become calculation functions
- Action enablers become event handlers or side effects

**Rule Format**:
```
BR-001: [statement]
- Type: Operative Rule
- Priority: Critical
- Rationale: why this rule exists
- Scope: which feature applies
```

**Flag ambiguities**: "Passwords must be strong" needs clarification — define strong explicitly before continuing.

**Transition**: "Once we have rules, we identify use cases."
:::

---

## Use Case Identification

**Look for actor-action pairs**:

```
"User registers an account" → UC-001: Register User Account
"Admin approves refund"    → UC-002: Approve Refund Request
```

**Use case format**:
```markdown
UC-001: Request Password Reset
- Actor: User (forgot password)
- Goal: Initiate password reset process
- Preconditions: User has registered account
- Main Flow: 1. Enter email 2. Receive link 3. Click link
- Alternative Flows: Email not found → generic message
- Business Rules: BR-020, BR-021
```

::: notes
Use cases describe what users want to accomplish — not how the system implements it.

**Timing**: 3 minutes

**Key Points**:
- Actor is always a person or external system — not "the database"
- Goal describes the user's intent, not the system's action
- Alternative flows must cover error cases — these become error handling in the handler
- Linking to business rules enables traceability

**Common Mistake**: Writing use cases that describe implementation: "System calls the API to check the database." Use cases describe observable behavior from the user's perspective.

**Example — Password Reset Flow**:
Walk through the UC-010/UC-011 password reset example from the instructions to show how a multi-step workflow becomes two related use cases.

**Transition**: "With use cases identified, we can define feature boundaries."
:::

---

## Feature Boundary Tests

A good feature boundary passes all four tests:

| Test | Question | ✅ Pass | ❌ Fail |
|------|----------|---------|---------|
| **Cohesion** | Do all parts naturally belong together? | "Password Reset" | "User Management" |
| **Independence** | Can it be implemented without changing other features? | "Password Reset" | "Update User Email" |
| **Value** | Does it deliver complete value to users? | "Checkout Process" | "Validate Credit Card" |
| **Size** | Can it be done in 1-5 days? | "Basic Search" | "Full E-Commerce Platform" |

::: notes
Feature boundaries prevent both over-engineering and under-delivering.

**Timing**: 3 minutes

**Key Points**:
- Cohesion failure → feature is too broad, split it
- Independence failure → too coupled, extract shared interface
- Value failure → feature is partial, it's not a feature it's a task
- Size failure → too large, decompose into smaller features

**Feature Format**:
```
F-001: User Registration
- Business Capability: Identity & Access Management
- User Value: Users can create accounts
- Use Cases: UC-001, UC-002, UC-003
- Priority: P0-Critical
- Complexity: Low
```

**Transition**: "With features defined, we design vertical slices."
:::

---

## Vertical Slice Design

**Each slice must be**:
- ✅ **Complete** — spans all layers (DB, domain, API, tests)
- ✅ **Valuable** — user can accomplish something meaningful
- ✅ **Independent** — can be deployed without other slices
- ✅ **Testable** — has clear acceptance criteria

**Slice decomposition strategies**:
1. **MVS** — Minimal Viable Slice: simplest validation, core functionality only
2. **Happy Path First** — complete happy path, then add error handling
3. **Core + Extensions** — essential functionality first, enhancements later

::: notes
Vertical slices are the key to delivering incremental value without big-bang releases.

**Timing**: 3 minutes

**Key Points**:
- "Spans all layers" means DB schema, handler, validator, API endpoint, AND tests
- Each slice should take 1-5 days to implement
- Acceptance criteria must be specific and testable — not "it works"
- Never design a slice that only covers one layer (e.g., "create the database table")

**Slice ID format**: S-{feature-id}-{number} (e.g., S-001-1, S-001-2)

**Example**:
S-001-1: Basic Registration (Slice 1 of User Registration feature)
- Creates account with email, password, first/last name
- Returns 201 with userId on success
- Returns 400 with specific errors on validation failure

**Transition**: "Let's see a complete slice specification."
:::

---

## Complete Slice Specification

```markdown
## Slice S-001-1: Basic User Registration

User Story: As a prospective customer, I want to register so I can access features

Acceptance Criteria:
- [ ] Valid inputs create account, return 201 with userId
- [ ] Duplicate email returns 409 Conflict
- [ ] Invalid email returns 400 with specific message
- [ ] Weak password returns 400 with requirements

Files to Create:
- /Features/UserRegistration/RegisterUserCommand.cs
- /Features/UserRegistration/RegisterUserHandler.cs
- /Features/UserRegistration/RegisterUserValidator.cs
- /Tests/Features/UserRegistration/RegisterUserHandlerTests.cs

API: POST /api/users/register
```

::: notes
The slice specification is the bridge between requirements and implementation.

**Timing**: 3 minutes

**Key Points**:
- Acceptance criteria are binary — pass or fail, not partial credit
- File list makes the implementation scope clear before coding starts
- The API contract defines the interface that front-end and back-end agree on
- Tests must be listed — they are part of the slice, not optional

**Practical Tip**: The files-to-create list is the developer's work breakdown structure. If a file isn't listed, it's not in scope for this slice.

**Database Changes**: If the slice needs a schema change, include the migration in the slice spec.

**Transition**: "Let's wrap up with the complete analysis output structure."
:::

---

## Analysis Output Structure

```
1. Business Rules (BR-###)
         ↓
2. Use Cases (UC-###)
         ↓
3. Features (F-###)
         ↓
4. Vertical Slices (S-###-###)
         ↓
5. Implementation Roadmap
```

**Quality checklist before presenting**:
- [ ] All rules have unique IDs and type classification
- [ ] All use cases link to business rules
- [ ] All features pass the four boundary tests
- [ ] All slices span all layers with acceptance criteria
- [ ] Ambiguities flagged and clarification requested

::: notes
The output structure creates traceability from business rule to implementation task.

**Timing**: 2 minutes

**Key Points**:
- Every slice should trace back to at least one use case, which traces to at least one business rule
- The roadmap prioritizes slices: P0 (blocking) → P1 (critical) → P2 (important) → P3 (nice-to-have)
- Flagging ambiguities is not failure — it's professional practice

**Implementation Roadmap Format**:
- Phase 1 (Week 1-2): P0 slices that unblock everything else
- Phase 2 (Week 3-4): P0 slices critical for launch
- Phase 3+: P1 and P2 slices in priority order

**Call to Action**: Start your next feature by extracting business rules first — before writing a single line of code.

**Q&A**: Open for questions about specific rule types, use case formats, or slice decomposition strategies.
:::

---

<!-- ============================================================ -->
<!-- MODULE 6: CREATING CUSTOM AGENTS -->
<!-- ============================================================ -->

# Module 6

## Creating Custom Agents

*Specialized AI Assistants for Your Workflow*

::: notes
This section divider marks the start of Module 6: Creating Custom Agents.

**Module Duration**: Approximately 20–25 minutes

**Module Description**: Creating, configuring, and deploying custom GitHub Copilot agents across environments.

**Prerequisites**: Familiarity with previous modules is helpful but not required for this module.

**Transition**: "Let's dive into Creating Custom Agents."
:::

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

Custom agents are specialized AI assistants with:

- **Tailored expertise** for specific development tasks
- **Configurable tools** and capabilities
- **Custom instructions** defining behavior
- **Reusable profiles** across projects
- **Available in multiple environments** (GitHub.com, VS Code, JetBrains, Eclipse, Xcode)

::: notes
**Timing**: 2-3 minutes

**Key Points to Emphasize**:

1. Custom agents are NOT separate AI models - they're specialized configurations of GitHub Copilot
2. Think of them as "personas" or "roles" for your AI assistant
3. They're defined in simple markdown files with YAML frontmatter

**Examples to Share**:

- Testing specialist that focuses only on test code
- Documentation writer that creates comprehensive docs
- Implementation planner that designs before coding
- Security reviewer that checks for vulnerabilities

**Audience Interaction**: "Has anyone worked with AI assistants that seemed too generic or gave responses outside their intended scope? Custom agents solve this problem."

**Transition**: "Now let's see where and how you can create these custom agents."
:::

---

## Where to Create Custom Agents

### GitHub.com

- Navigate to [github.com/copilot/agents](https://github.com/copilot/agents)
- Available at repository, organization, or enterprise level
- Template-based creation process

### IDEs

- **VS Code**: Configure Custom Agents menu
- **JetBrains**: Configure Agents settings
- **Eclipse**: Add custom agents dialog
- **Xcode**: Create agent from dropdown

::: notes
**Timing**: 3 minutes

**Delivery Instructions**:

- Show the GitHub.com interface if doing a live demo
- Emphasize that agents created on GitHub can be used across all environments
- IDE-based agents are more convenient for quick personal use

**Key Decision Point**: Help audience understand when to use each approach:

- **GitHub**: For team-wide or shared agents
- **Organization/Enterprise**: For standardized agents across multiple repos
- **IDE**: For personal experimentation and workspace-specific agents

**Technical Detail**:

- GitHub agents go in `.github/agents/` directory
- Organization/enterprise agents go in root `agents/` directory of `.github-private` repo
- IDE user profile agents are local to that machine

**Common Question**: "Can I use the same agent in both GitHub and my IDE?"
**Answer**: Yes! Agents created on GitHub are automatically available in supported IDEs.

**Transition**: "Let's walk through creating an agent on GitHub, which is the most common workflow."
:::

---

## Creating on GitHub: Step-by-Step

1. Go to `github.com/copilot/agents`
2. Select repository (or `.github-private` for org/enterprise)
3. Click Copilot icon → **Create an agent**
4. Creates template: `my-agent.agent.md` in `.github/agents/`
5. Rename file with descriptive name (e.g., `test-specialist.agent.md`)
6. Configure agent profile (next slide)
7. Commit to default branch
8. Agent appears in dropdown immediately

::: notes
**Timing**: 4-5 minutes (include live demo if possible)

**Step-by-Step Walkthrough**:

**Step 1-2**: Emphasize the importance of selecting the right repository

- Personal repo = just for you
- Organization repo = for entire org
- `.github-private` = special repository for org/enterprise-wide agents

**Step 3-4**: The template is your starting point

- Don't skip past it - it contains all required sections
- Template includes helpful comments

**Step 5**: Filename guidelines (critical!)

- Use lowercase letters, numbers, dots, dashes, underscores only
- Must end with `.agent.md`
- Filename becomes the default agent name
- Examples: `test-specialist.agent.md`, `security-reviewer.agent.md`, `doc-writer.agent.md`

**Step 6**: We'll cover configuration in detail on next slides

**Step 7-8**: No build process or waiting

- Immediate availability after merge
- Refresh the page if you don't see it

**Common Pitfalls**:

- Forgetting to merge to default branch (agent won't appear)
- Using spaces or special characters in filename
- Not providing a description in the YAML

**Demo Tip**: If showing live, create a simple agent like "hello-world.agent.md" to demonstrate the process.

**Transition**: "Now that we know how to create the file, let's understand what goes inside it."
:::

---

## Creating in VS Code

1. Open GitHub Copilot Chat
2. Agents dropdown → **Configure Custom Agents...**
3. Click **Create new custom agent**
4. Choose location:
   - **Workspace**: `.github/agents/` (project-specific)
   - **User profile**: Personal agents (all workspaces)
5. Enter filename
6. Configure in `.agent.md` file
7. Use **Configure Tools...** button for tool selection
8. Set `model:` property for AI model preference

::: notes
**Timing**: 3-4 minutes

**VS Code Advantages**:

- Integrated tool configuration UI
- Immediate testing in the same environment
- Better for rapid iteration and experimentation
- User profile agents for personal productivity

**Workspace vs User Profile Decision**:

**Workspace** (`.github/agents/`):

- Shared with team when committed
- Project-specific context
- Version controlled
- Recommended for team agents

**User Profile**:

- Available across all your projects
- Not version controlled
- Personal productivity tools
- Examples: personal note-taking agent, time tracker

**Configure Tools Button**:

- Opens visual dialog showing all available tools
- Includes built-in tools (read, edit, search, etc.)
- Shows MCP server tools if configured
- Click OK to add selected tools to YAML

**Model Property**:

- Override default model per agent
- Useful for cost/performance tradeoffs
- Example: Use faster model for simple tasks, advanced model for complex reasoning

**Live Demo Suggestion**: Show the Configure Tools dialog and model dropdown

**Common Questions**:

- "Do I need to restart VS Code?" - No, agents are detected automatically
- "Can I edit the YAML directly?" - Yes, the UI is just a helper

**Transition**: "The process is similar in JetBrains, Eclipse, and Xcode with slight UI variations. Now let's focus on what matters most: the agent configuration itself."
:::

---

## Agent Profile Structure

```yaml
---
name: test-specialist
description: Focuses on test coverage and quality
tools: ["read", "edit", "search"]
model: gpt-4
target: vscode # optional: vscode or github-copilot
---
You are a testing specialist...

[Detailed instructions and behavior]
```

**Key Components**:

- **YAML frontmatter**: Metadata and configuration
- **Markdown content**: Instructions and behavior (max 30,000 chars)

::: notes
**Timing**: 4-5 minutes

**Anatomy of an Agent Profile**:

**YAML Frontmatter** (Required):

1. **name** (optional): Display name in dropdown
   - Defaults to filename without extension
   - Keep concise (2-4 words)
   - Examples: "Test Specialist", "Security Reviewer"

2. **description** (REQUIRED): What the agent does
   - Must be clear and specific
   - Explains capabilities and domain
   - Appears in agent selection UI
   - 1-2 sentence summary

3. **tools** (optional): Which tools agent can use
   - Omit to enable ALL tools
   - List specific tools to restrict access
   - Format: `["tool1", "tool2", "mcp-server/tool3"]`
   - Common tools: read, edit, search, run, debug

4. **model** (IDE only): Which AI model to use
   - Only works in VS Code, JetBrains, Eclipse, Xcode
   - Examples: "gpt-4", "gpt-3.5-turbo", "claude-3-opus"
   - Ignored on GitHub.com

5. **target** (optional): Environment restriction
   - "vscode" = only in IDEs
   - "github-copilot" = only on GitHub.com
   - Omit = works everywhere

6. **mcp-servers** (org/enterprise only): Configure MCP servers for this agent

**Markdown Content** (The Agent's "Brain"):

- Define personality and expertise
- Set boundaries and constraints
- Provide examples of good behavior
- Specify output formats
- Maximum 30,000 characters (plenty of space!)

**Best Practices**:

- Be specific about what the agent should AND shouldn't do
- Include examples of desired behavior
- Mention file patterns or naming conventions
- Specify testing/validation requirements

**Transition**: "Let's see what these instructions look like in real agent examples."
:::

---

## Example 1: Testing Specialist

```markdown
---
name: test-specialist
description: Focuses on test coverage, quality, and testing
  best practices without modifying production code
---

You are a testing specialist focused on improving code
quality through comprehensive testing. Your responsibilities:

- Analyze existing tests and identify coverage gaps
- Write unit tests, integration tests, and end-to-end tests
- Review test quality and suggest improvements
- Ensure tests are isolated, deterministic, and documented
- Focus only on test files - avoid modifying production code

Always include clear test descriptions and use appropriate
testing patterns for the language and framework.
```

::: notes
**Timing**: 3-4 minutes

**Why This Example Works**:

**Clear Scope Definition**:

- "Focuses on test coverage" - tells user what it does
- "Without modifying production code" - tells user what it WON'T do
- Sets clear boundaries to prevent scope creep

**Specific Responsibilities**:

1. "Analyze existing tests" - audit capability
2. "Write unit/integration/e2e tests" - creation capability
3. "Review test quality" - critique capability
4. "Ensure tests are isolated" - quality standards
5. "Focus only on test files" - reinforces boundary

**Behavioral Constraints**:

- "Focus only on test files" - prevents the agent from refactoring production code
- "Avoid modifying production code unless specifically requested" - allows override when needed

**Quality Standards**:

- "Isolated" - no shared state between tests
- "Deterministic" - same input = same output
- "Well-documented" - clear descriptions and comments

**Pattern Recognition**:

- "Use appropriate testing patterns for the language and framework"
- Agent will adapt to Jest, pytest, JUnit, etc.

**Usage Scenarios**:

- Adding tests to legacy code
- Improving test coverage metrics
- Reviewing PR test quality
- Learning testing best practices

**Customization Ideas**:

- Add specific test frameworks to use
- Include code coverage thresholds
- Specify test naming conventions
- Add mutation testing requirements

**Common Question**: "Why not enable all tools?"
**Answer**: Not specified here, so all tools are available. But you might restrict to ["read", "edit"] to prevent running or deploying.

**Transition**: "Here's another example that shows a different use case - planning instead of coding."
:::

---

## Example 2: Implementation Planner

```markdown
---
name: implementation-planner
description: Creates detailed implementation plans and
  technical specifications in markdown format
tools: ["read", "search", "edit"]
---

You are a technical planning specialist. Your responsibilities:

- Analyze requirements and break them into actionable tasks
- Create detailed technical specs and architecture docs
- Generate implementation plans with steps and dependencies
- Document API designs, data models, and system interactions
- Create markdown files that development teams can follow

Always structure plans with clear headings, task breakdowns,
and acceptance criteria. Include considerations for testing,
deployment, and risks. Focus on thorough documentation
rather than implementing code.
```

::: notes
**Timing**: 3-4 minutes

**Strategic Difference from Test Specialist**:

**Tools Restriction**:

- Only `["read", "search", "edit"]` enabled
- NOT "run" or "debug" - this agent doesn't execute code
- NOT "shell" - doesn't deploy or build
- Enforces its role as a planner, not implementer

**Planning-Specific Responsibilities**:

1. "Analyze requirements" - requirements engineering
2. "Break them into actionable tasks" - work breakdown
3. "Technical specs and architecture docs" - documentation focus
4. "Implementation plans with dependencies" - sequencing and scheduling
5. "API designs, data models" - interface definition

**Output Format**:

- "Markdown format" - specified in description
- "Markdown files that development teams can follow" - artifact focus
- "Clear headings, task breakdowns" - structure requirements

**Non-Code Focus**:

- "Focus on thorough documentation rather than implementing code"
- Critical boundary: this agent designs but doesn't build
- Prevents mixing planning and implementation concerns

**When to Use This Agent**:

- Starting new features or projects
- Architectural decision records (ADRs)
- Epic and story breakdown
- Technical RFCs
- Onboarding documentation
- Migration plans

**Output Examples**:

- `IMPLEMENTATION_PLAN.md` with tasks and timeline
- `ARCHITECTURE.md` with system design
- `API_SPEC.md` with endpoint definitions
- `DATA_MODEL.md` with schema definitions

**Team Benefits**:

- Consistent planning documentation format
- Separation of planning from coding
- Better task estimation
- Clear acceptance criteria
- Risk identification upfront

**Customization Ideas**:

- Add specific template sections
- Include estimation guidance
- Specify diagram types (C4, sequence, etc.)
- Add stakeholder communication sections

**Comparison to Test Specialist**:

- Test Specialist: All tools, focused on test files
- Implementation Planner: Limited tools, focused on documentation

**Transition**: "These examples show two very different agent types. Now let's learn how to actually use custom agents once they're created."
:::

---

## Using Custom Agents

### On GitHub.com

- Agents panel/tab dropdown → Select your custom agent
- Assign custom agent to issues
- Noted in PR descriptions when used

### In IDEs

- Chat window dropdown → Select agent
- Switch agents mid-conversation
- Access specialized configurations per task

### GitHub Copilot CLI

- `/agent` command to select agent
- Reference agent in prompts
- Command-line argument support

::: notes
**Timing**: 4-5 minutes

**GitHub.com Usage**:

**Agents Panel Workflow**:

1. Open Copilot agents panel or tab
2. Click dropdown (currently shows "Coding Agent")
3. Select your custom agent from list
4. Enter your prompt or task
5. Agent works within its configured scope

**Issue Assignment**:

- Assign Copilot to an issue
- Choose custom agent from dropdown
- Agent follows its specialized instructions
- Great for repetitive tasks (bug triage, documentation updates)

**PR Tracking**:

- When Copilot creates a PR, it notes which agent was used
- Helps with attribution and understanding the approach
- Example: "This PR was created by @copilot using the test-specialist agent"

**IDE Usage Benefits**:

**Mid-Conversation Switching**:

- Start with planning agent
- Switch to implementation agent
- Switch to review agent
- Maintain conversation context

**Task-Specific Workflows**:

1. Use planning agent for architecture decisions
2. Use coding agent for implementation
3. Use test agent for test coverage
4. Use security agent for vulnerability review
5. Use doc agent for documentation

**Example IDE Workflow**:

```
User: "I need to add user authentication"
[Select implementation-planner agent]
Agent: Creates detailed plan with tasks

User: "Now implement the first task"
[Switch to coding agent]
Agent: Implements based on plan

User: "Add tests for this"
[Switch to test-specialist agent]
Agent: Creates comprehensive test suite
```

**CLI Usage** (Advanced):

**Basic Agent Selection**:

```bash
gh copilot /agent test-specialist "add tests for authentication"
```

**In Prompts**:

```bash
gh copilot "using security-reviewer, check this PR for vulnerabilities"
```

**Via Arguments**:

```bash
gh copilot --agent=doc-writer "document the API endpoints"
```

**Best Practices**:

1. **Choose the Right Agent**:
   - Match agent expertise to task
   - Don't use generic agent when specialized one exists

2. **Provide Context**:
   - Custom agents still need context
   - Reference files, requirements, constraints

3. **Iterate**:
   - Refine agent instructions based on results
   - Agents improve as you tune them

4. **Document Usage**:
   - Tell team which agents to use for which tasks
   - Include in CONTRIBUTING.md or team wiki

**Common Scenarios**:

- **Code Review**: Use review agent on PRs
- **Legacy Refactoring**: Use planning agent first, then coding agent
- **Documentation Sprint**: Use doc agent across multiple files
- **Security Audit**: Use security agent on entire codebase
- **Test Coverage Drive**: Use test agent to fill coverage gaps

**Transition**: "Let's wrap up with some best practices and resources to help you get started."
:::

---

## Best Practices

1. **Start Simple**: Create one agent for a specific pain point
2. **Be Specific**: Define clear boundaries and responsibilities
3. **Restrict Tools**: Only enable tools the agent needs
4. **Iterate**: Refine instructions based on real usage
5. **Share**: Create org/enterprise agents for common tasks
6. **Document**: Include usage examples in agent description
7. **Test**: Validate agent behavior before team rollout

::: notes
**Timing**: 4 minutes

**Detailed Best Practices**:

**1. Start Simple**:

- Don't try to create every agent at once
- Identify ONE repetitive task that's painful
- Create an agent for that specific task
- Validate it works before creating more
- Example: If code reviews always miss test coverage, start with test-specialist

**2. Be Specific**:

- Vague: "Help with coding"
- Specific: "Write unit tests following Jest conventions for React components"
- Include examples of good behavior
- Specify what NOT to do
- Bad example: "Be helpful"
- Good example: "Focus only on test files in **tests** directories. Never modify source files in src/ directory."

**3. Restrict Tools**:

- More tools ≠ better agent
- Restrict to enforce boundaries
- Planning agent doesn't need "run" tool
- Doc agent doesn't need "debug" tool
- Security agent might only need "read" and "search"
- Benefits:
  - Faster execution (fewer options to consider)
  - Clear scope (can't do things outside role)
  - Safer (can't accidentally deploy or delete)

**4. Iterate**:

- Agents aren't "write once and forget"
- Monitor what they produce
- Collect feedback from team
- Refine instructions based on real usage
- Example iteration:
  - V1: "Write tests"
  - V2: "Write tests with descriptive names"
  - V3: "Write tests with descriptive names following pattern: describe-context-behavior"
  - V4: Add specific Jest matchers to prefer

**5. Share**:

- Don't create duplicate agents across repos
- Use organization-level agents for standards
- Examples:
  - Code style checker (enforces org conventions)
  - Security reviewer (org security policies)
  - Doc generator (org documentation standards)
- Benefits:
  - Consistency across projects
  - Single place to maintain
  - Easier onboarding

**6. Document**:

- Good description is crucial
- Include examples in the agent markdown
- Add usage instructions
- Example:

  ```markdown
  ## Usage Examples

  ❌ Bad: "Fix the tests"
  ✅ Good: "Add unit tests for the UserService class covering success and error cases"

  ❌ Bad: "Make it better"
  ✅ Good: "Increase test coverage for auth module to 80%"
  ```

**7. Test**:

- Try agent on sample tasks before team rollout
- Test edge cases
- Verify it respects boundaries
- Check tool usage is appropriate
- Get feedback from 2-3 team members first
- Make it easy to rollback (version control!)

**Anti-Patterns to Avoid**:

- **Too Generic**: "Help with everything" - defeats the purpose
- **Too Narrow**: "Only fix typos in README" - waste of an agent
- **No Constraints**: All tools enabled, no guidelines - unpredictable
- **Copy-Paste**: Duplicating built-in agents - adds confusion
- **Set and Forget**: Never updating based on experience
- **No Testing**: Rolling out to team without validation

**Success Metrics**:

- Time saved on repetitive tasks
- Consistency in output quality
- Reduction in review comments for that area
- Team adoption rate
- Positive feedback from users

**Transition**: "You now have everything you need to create your first custom agent. Here are resources to dive deeper."
:::

---

## Next Steps

### Resources

- 📚 [Your First Custom Agent Tutorial](https://docs.github.com/en/copilot/tutorials/customization-library/custom-agents/your-first-custom-agent)
- 📖 [Custom Agents Configuration Reference](https://docs.github.com/en/copilot/reference/custom-agents-configuration)
- 🎯 [Customization Library Examples](https://docs.github.com/en/copilot/tutorials/customization-library/custom-agents)
- 💡 [Awesome Copilot Community Collection](https://github.com/github/awesome-copilot/tree/main/agents)

### Try It Now

1. Create your first agent for a specific task
2. Test with real scenarios
3. Share with your team
4. Iterate based on feedback

::: notes
**Timing**: 2-3 minutes for closing

**Resource Walkthrough**:

**Your First Custom Agent Tutorial**:

- Step-by-step hands-on guide
- Creates a working agent from scratch
- Best starting point for beginners
- Estimated time: 15-30 minutes

**Custom Agents Configuration Reference**:

- Complete YAML property documentation
- All available tool names
- MCP server configuration
- Target environment specifics
- Use this when fine-tuning existing agents

**Customization Library**:

- Curated examples from GitHub
- Covers common scenarios:
  - Code review specialists
  - Documentation generators
  - Test coverage improvers
  - Security analyzers
- Copy, customize, deploy

**Awesome Copilot Collection**:

- Community-contributed agents
- Wide variety of use cases
- Not officially supported but often high quality
- Great for inspiration
- Can find niche/specialized agents

**Actionable First Steps**:

**Immediate (Next 30 Minutes)**:

1. Go to github.com/copilot/agents
2. Create a simple "hello world" agent
3. Test it with a basic task
4. Verify it appears in dropdown

**Short Term (This Week)**:

1. Identify one repetitive task in your workflow
2. Create a specialized agent for it
3. Use it for 5-10 real tasks
4. Note what works and what doesn't

**Medium Term (This Month)**:

1. Refine your agent based on usage
2. Share with team for feedback
3. Create 2-3 more agents for other tasks
4. Document usage patterns

**Long Term (This Quarter)**:

1. Build agent library for common team tasks
2. Create organization-level agents for standards
3. Train team on agent selection and usage
4. Measure impact on productivity

**Quick Win Ideas**:

For Individual Developers:

- Personal productivity agent (time tracking, TODO management)
- Learning agent (explains unfamiliar code patterns)
- Code quality agent (checks style before commit)

For Teams:

- PR description generator (consistent format)
- Test coverage enforcer (blocks PRs without tests)
- Documentation updater (keeps docs in sync)
- Security baseline checker (org security policies)

**Call to Action**:

"Your homework: Before the end of this week, create one custom agent for a task you do repeatedly. It can be as simple as 'always write doc comments' or as complex as 'generate API documentation from OpenAPI specs'. Start small, iterate, and share your results!"

**Q&A Preparation**:

Common Questions to Expect:

1. "Can agents call other agents?" - Not yet, but on roadmap
2. "How many agents can I create?" - No documented limit
3. "Do agents cost extra?" - No, included in Copilot license
4. "Can I sell/distribute my agents?" - Yes, they're just markdown files
5. "What if my agent breaks?" - Just edit the file, changes are immediate

**Thank You Slide Options**:

- Show your GitHub handle for questions
- Link to your custom agents repo
- Office hours or follow-up session details
- Feedback form or survey
  :::

---

## Thank You

### Questions?

**GitHub**: [@johnmillerATcodemag-com](https://github.com/johnmillerATcodemag-com)
**Repository**: [AI-Assisted-Software-Development](https://github.com/johnmillerATcodemag-com/AI-Assisted-Software-Development)

::: notes
**Timing**: 5-10 minutes for Q&A

**Facilitating the Closing**:
Thank the audience for their time and engagement. Remind them that the GitHub repository contains all the resources covered in this session — agent examples, instruction files, and documentation.

**Encourage Questions**:
Open the floor for questions. Common topics: agent pricing, limits, organization-level deployment, and integration with existing workflows.

**Call to Action**: Ask each participant to identify one repetitive task they'll automate with a custom agent this week. Small wins build momentum.
:::

---

**Start creating your custom agents today!**

::: notes
**Final Slide Notes**:

**Timing**: 5-10 minutes for Q&A

**Q&A Facilitation Tips**:

1. **Repeat Questions**: Ensure entire audience hears
2. **Validate**: "That's a great question..."
3. **Bridge**: Connect to content covered
4. **Offer Follow-Up**: "Let's discuss after session"

**Likely Questions & Answers**:

**Q: Can I version control my agents?**
A: Yes! They're just markdown files in your repo. Use git branches, tags, etc.

**Q: How do I test changes before rolling out to team?**
A: Create in a feature branch, test locally in your IDE, then merge when ready.

**Q: Can I use secrets/API keys in agents?**
A: No, never hardcode secrets. Reference environment variables or use GitHub secrets.

**Q: What's the difference between custom agents and agents?**
A: Agents are the general feature. "Custom agents" are user- or org-defined. "Built-in agents" like coding agent are from GitHub.

**Q: Do agents work offline?**
A: No, they require GitHub Copilot API access.

**Q: Can I charge for my agents?**
A: Agents themselves are free. You could offer consulting/implementation services.

**Q: How do I debug agent behavior?**
A: Check the instructions, verify tools list, test with specific prompts, iterate.

**Q: Can agents access my entire codebase?**
A: They use the tools you enable. "read" tool allows reading files. Restriction through tool selection.

**Follow-Up Actions**:

- Collect email addresses for resource sharing
- Schedule office hours for hands-on help
- Create Slack/Teams channel for ongoing discussion
- Plan follow-up session for advanced topics

**Advanced Topics for Future Sessions**:

- MCP server integration
- Multi-agent workflows
- Organization governance
- Metrics and monitoring
- Agent templates and standards

**Closing**:
"Thank you all for attending! Remember: the best way to learn is by doing. Create your first agent this week, and don't hesitate to reach out if you hit any blockers. Happy coding!"
:::
