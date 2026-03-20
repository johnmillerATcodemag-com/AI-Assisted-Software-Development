---
ai_generated: true
model: "anthropic/claude-sonnet-4.5@2026-03-20"
operator: "johnmillerATcodemag-com"
chat_id: "merge-marp-aiasd-311-tuesday-20260320"
prompt: |
  Follow instructions in merge-marp-decks.prompt.md — merge slide decks listed
  in Slides/aiasd-311-tuesday.yaml into a combined Tuesday session presentation
started: "2026-03-20T04:00:00Z"
ended: "2026-03-20T04:15:00Z"
task_durations:
  - task: "read manifest and individual decks"
    duration: "00:03:00"
  - task: "assemble combined deck"
    duration: "00:08:00"
  - task: "add section dividers and verify speaker notes"
    duration: "00:04:00"
total_duration: "00:15:00"
ai_log: "ai-logs/2026/03/20/merge-marp-aiasd-311-tuesday-20260320/conversation.md"
source: ".github/prompts/merge-marp-decks.prompt.md"
manifest: "Slides/aiasd-311-tuesday.yaml"
marp: true
theme: default
paginate: true
---

# AI-Assisted Software Development

## Session 311 — Tuesday

*CQRS · Dependency Management · GitHub CLI*

::: notes
Welcome to the AI-Assisted Software Development Tuesday session (311). This combined presentation covers three modules: CQRS architecture patterns, dependency management policy, and GitHub CLI workflows.

**Timing**: 1 minute

**Session Overview**:
This deck merges three individual module presentations into a coherent Tuesday session. Each module is separated by a section divider slide so you can navigate or present individual sections.

**Modules in This Deck**:
1. **CQRS Architecture** — Command Query Responsibility Segregation
2. **Dependency Management Policy** — Secure, Compliant, and Maintainable Dependencies
3. **GitHub CLI** — Supercharge Your GitHub Workflow from the Terminal

**Delivery Options**:
- Present all three modules end-to-end as a half-day or full-day session
- Present individual sections standalone using the section dividers as entry points
- Use as a reference deck for self-paced learning

**Transition**: "Let's begin with Module 1: CQRS Architecture."
:::

<!-- ============================================================ -->
<!-- MODULE 1: CQRS ARCHITECTURE -->
<!-- ============================================================ -->

# Module 1

## CQRS Architecture

*Command Query Responsibility Segregation*

::: notes
This section divider marks the start of Module 1: CQRS Architecture.

**Module Duration**: Approximately 20–25 minutes

**Module Description**: Command Query Responsibility Segregation.

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


<!-- ============================================================ -->
<!-- MODULE 2: DEPENDENCY MANAGEMENT POLICY -->
<!-- ============================================================ -->

# Module 2

## Dependency Management Policy

*Secure, Compliant, and Maintainable Dependencies*

::: notes
This section divider marks the start of Module 2: Dependency Management Policy.

**Module Duration**: Approximately 20–25 minutes

**Module Description**: Secure, Compliant, and Maintainable Dependencies.

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


<!-- ============================================================ -->
<!-- MODULE 3: GITHUB CLI -->
<!-- ============================================================ -->

# Module 3

## GitHub CLI

*Supercharge Your GitHub Workflow from the Terminal*

::: notes
This section divider marks the start of Module 3: GitHub CLI.

**Module Duration**: Approximately 20–25 minutes

**Module Description**: Supercharge Your GitHub Workflow from the Terminal.

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


