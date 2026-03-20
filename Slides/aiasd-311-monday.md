---
ai_generated: true
model: "anthropic/claude-sonnet-4.5@2026-03-20"
operator: "johnmillerATcodemag-com"
chat_id: "merge-marp-decks-monday-20260320"
prompt: |
  Use manifest Slides/aiasd-311-monday.yaml
  Follow instructions in merge-marp-decks.prompt.md
started: "2026-03-20T06:21:02Z"
ended: "2026-03-20T06:50:00Z"
task_durations:
  - task: "read manifest and source files"
    duration: "00:05:00"
  - task: "assemble combined deck"
    duration: "00:20:00"
  - task: "add section dividers and speaker notes"
    duration: "00:04:00"
total_duration: "00:29:00"
ai_log: "ai-logs/2026/03/20/merge-marp-decks-monday-20260320/conversation.md"
source: ".github/prompts/merge-marp-decks.prompt.md"
marp: true
theme: default
paginate: true
---

# AI-Assisted Software Development

## Class 311 — Monday Session

*AI Output Standards · Vertical Slices · Dependency Management · Prompt Files · Custom Chat Modes*

::: notes
Welcome to Class 311 — Monday session of AI-Assisted Software Development. Today's deck covers five modules: AI-Assisted Output Standards (provenance and logging), Vertical Slice Implementation (feature-centric architecture), Dependency Management Policy (security and compliance), GitHub Copilot Prompt Files (reusable task prompts), and Custom GitHub Copilot Chat Modes (domain-specific AI assistants).

**Timing**: 1 minute

**Day Overview**:
- Module 1 (45 min): AI-Assisted Output Standards — why provenance matters, required fields, logging workflow
- Module 2 (60 min): Vertical Slice Implementation — feature boundaries, code generation rules, anti-patterns
- Module 3 (45 min): Dependency Management — risk classification, approval workflow, vulnerability response
- Module 4 (45 min): Prompt Files — structure, field requirements, validation, best practices
- Module 5 (45 min): Custom Chat Modes — creating specialized Copilot assistants for domain expertise

**Total**: ~4 hours of instruction with hands-on exercises embedded in each module
:::

---

<!-- Module 1 divider -->

# AI-Assisted Output Standards

*Provenance · Logging · Quality Gates · CI Enforcement*

::: notes
This section covers the mandatory policy for all AI-assisted artifacts in this repository. Every file that an AI model generates or significantly modifies must include embedded provenance metadata and a corresponding chat log.

**Key message**: Provenance is not optional bookkeeping — it enables audits, helps teammates understand decisions, and lets you replay or reproduce any output.

**Transition**: Let's start with what provenance means and why it exists.
:::

---

## Why Provenance?

- **Auditability**: Know who generated what, when, with which model
- **Reproducibility**: Re-run the same prompt to verify or update output
- **Code quality**: Traceability links artifacts to the conversation that created them
- **Trust**: Teams and reviewers can validate AI-generated code with confidence

> *"Every AI-assisted artifact must record who made it, how, and from which conversation."*

::: notes
Provenance answers three questions for every artifact: **Who** (the operator and model), **How** (the exact prompt and task durations), and **Where** (the conversation log path). Without it, reviewing or debugging AI-generated code is difficult because you can't reproduce the generation context.

**Timing**: 3 minutes

**Ask the class**: Has anyone ever received AI-generated code and had no idea which prompt produced it? That's the problem we're solving here.
:::

---

## Metadata Placement Policy

- **Formats with front matter** (Markdown, YAML): embed provenance as YAML front matter at the top
- **Formats without front matter** (images, binaries): use a sidecar file `<artifact>.meta.md`
- **Sidecars for Markdown are prohibited** — always embed directly

```yaml
---
ai_generated: true
model: "anthropic/claude-sonnet-4.5@2026-03-20"
operator: "johnmillerATcodemag-com"
chat_id: "my-task-20260320"
# ...
---
```

::: notes
The placement rule is simple: if the format allows embedded YAML front matter, use it. This keeps provenance co-located with the artifact — no separate files to lose track of. The only exception is binary formats where you create a `.meta.md` sidecar.

**Timing**: 4 minutes

**Common mistake**: creating a sidecar `.meta.md` for a Markdown file. Markdown supports embedded YAML — always embed.
:::

---

## Required Provenance Fields

| Field | Example |
|---|---|
| `ai_generated` | `true` |
| `model` | `"anthropic/claude-3.5-sonnet@2024-10-22"` |
| `operator` | `"johnmillerATcodemag-com"` |
| `chat_id` | `"create-feature-20260320"` |
| `prompt` | exact user prompt text |
| `started` / `ended` | ISO 8601 timestamps |
| `task_durations` | per-task breakdown |
| `total_duration` | sum in HH:MM:SS |
| `ai_log` | `"ai-logs/yyyy/mm/dd/<chat-id>/conversation.md"` |
| `source` | username or prompt path |

::: notes
Walk through each field. Emphasize:
- **model**: must be the underlying model (`provider/name@version`), not just "GitHub Copilot"
- **prompt**: exact text — copy-paste from the chat, don't paraphrase
- **task_durations**: break the work into phases; helps estimate future similar tasks
- **ai_log**: this path must actually exist as a file in the repo

**Timing**: 5 minutes

**Hands-on**: Ask students to open an existing file in the repo and locate its front matter. Confirm all fields are present.
:::

---

## AI Chat Logging Workflow

```
ai-logs/
└── yyyy/mm/dd/
    └── <chat-id>/
        ├── conversation.md   ← full prompt/response transcript
        └── summary.md        ← objectives, decisions, artifacts, next steps
```

Rules:
- Each **new chat** creates a **new** `conversation.md` — never append to old ones
- Log the **full transcript** including all prompts and responses
- Create logs **automatically** when the first artifact is generated

::: notes
The logging structure mirrors a date-organized archive. The chat ID in the folder name ties the folder to every artifact that references it. Never reuse or append to an existing conversation log — a new chat means a new file.

**Timing**: 4 minutes

**Demonstrate**: Show an existing `ai-logs/` entry in the repo so students see the structure in practice.

**Transition**: Now let's look at the quality checklist that enforces these requirements at PR time.
:::

---

## Quality Checklist & CI Enforcement

**Before every PR:**
- [ ] All AI-generated files have complete front matter
- [ ] `ai_log` path exists and contains `conversation.md`
- [ ] `model` uses format `provider/name@version`
- [ ] `chat_id` matches the log folder name
- [ ] README updated with new artifact entry

**CI blocks PRs when:**
- Required fields are missing or malformed
- `ai_log` path does not exist
- Model name does not follow the format spec

::: notes
The quality checklist doubles as the CI validation contract. The pipeline checks the same items. Students who complete the checklist before pushing will pass CI on the first try.

**Timing**: 3 minutes

**Key point**: The ci-enforce step is not punitive — it's a last safety net. The goal is for developers to complete the checklist themselves and never need the block.

**Transition**: That wraps AI-Assisted Output Standards. Questions before we move on?
:::

---

<!-- Module 2 divider -->

# Vertical Slice Implementation

*Feature Boundaries · Code Generation Rules · Anti-Patterns · Testing*

::: notes
This section covers implementing vertical slice architecture. Vertical slices organise code by feature — each slice spans all layers (database, domain, API, tests) and delivers a complete user capability.

**Key message**: Stop organising by layer (`Controllers/`, `Services/`, `Repositories/`). Organise by feature (`Features/UserRegistration/`).

**Timing**: 1 minute transition
:::

---

## When to Apply Vertical Slices

✅ **Apply when:**
- User explicitly requests it ("use vertical slices")
- Adding a complete new feature
- Codebase already has a `/Features` folder
- CQRS / MediatR / handler patterns are in use
- Refactoring layered code to feature-centric

❌ **Do NOT apply when:**
- User requests layered / MVC / three-tier architecture
- Working on simple scripts or utilities
- Adding to existing non-slice codebase without permission

::: notes
The trigger list tells you when to default to slices. The most reliable signal is the codebase structure itself — if there's a `/Features` directory, follow the existing pattern exactly.

**Timing**: 3 minutes

**Discussion prompt**: Ask students what architecture the code they work on daily uses. Does it have a `/Features` folder?
:::

---

## Feature Boundary Tests

Before creating a feature, ask four questions:

| Test | Question |
|---|---|
| **Cohesion** | Do all parts of this feature naturally belong together? |
| **Independence** | Can this be implemented without modifying other features? |
| **Value** | Does this deliver complete value to the user? |
| **Size** | Can this be implemented in 1–5 days? |

✅ Pass all four → create the feature  
❌ Fail "too large" → split into smaller features  
❌ Fail "too small" → merge with related feature

::: notes
These four tests prevent two common mistakes: features that are too big (god features) and features that are too small (partial slices with no user value).

**Timing**: 4 minutes

**Example**: "User Management" fails the cohesion test — it's too broad. Split it into "User Registration", "User Authentication", "Profile Management".
:::

---

## Feature File Structure

```
/Features
  /UserRegistration
    RegisterUserCommand.cs       ← request object
    RegisterUserHandler.cs       ← business logic
    RegisterUserValidator.cs     ← input validation
    RegistrationResult.cs        ← response DTO
    UserRegistrationRepository.cs
/Api/Controllers
  UserRegistrationController.cs  ← thin endpoint
/Tests/Features/UserRegistration
  RegisterUserHandlerTests.cs
```

Everything the feature needs lives **inside** its folder.

::: notes
The key insight is that the handler is the heart of the slice — it contains all the business logic. The controller is intentionally thin (receive request, send to mediator, return HTTP response). Tests live in a mirrored structure under `/Tests`.

**Timing**: 4 minutes

**Anti-pattern alert**: Never import from `Features.OtherFeature`. Use shared interfaces in `Common/` instead.
:::

---

## Code Generation Rules

**Rule 1 — Feature Independence**: No `using Features.OtherFeature;`

**Rule 2 — Complete Encapsulation**: Everything the feature needs lives in its folder

**Rule 3 — Thin Controllers**: Controllers only route → mediator → response

**Rule 4 — Handler Contains Business Logic**: Orchestrate deps, enforce rules, return Result

**Rule 5 — Validation in Separate Validators**: No inline validation in handlers

::: notes
Walk through each rule with examples. Rule 1 is the most critical — direct feature dependencies create tight coupling. If two features need shared behaviour, extract a shared interface or use domain events.

**Timing**: 5 minutes

**Live example**: Show a thin controller vs. a fat controller. Demonstrate how all the logic moves to the handler.
:::

---

## Implementation Order

Generate code in this order every time:

1. **Command / Query** — defines the contract
2. **Result DTO** — defines what handler returns
3. **Validator** — defines validation rules
4. **Handler** — now you know inputs, outputs, and rules
5. **Controller / Endpoint** — creates the entry point
6. **Tests** — validates the completed implementation

::: notes
This order is deliberate. Starting with the command/query forces you to think about the API contract before writing any implementation. Tests last ensures they validate actual behaviour, not implementation details.

**Timing**: 3 minutes

**Hands-on**: Have students scaffold a new feature following this order. Use a simple example like "Create Product" or "Register User".
:::

---

## Anti-Patterns to Avoid

| Anti-Pattern | Problem | Solution |
|---|---|---|
| God Handler (300+ lines) | Too many responsibilities | Extract services, break into smaller handlers |
| Shared Generic Repository | Couples features indirectly | Feature-specific repository |
| Feature → Feature dependency | Tight coupling | Shared interface or domain event |
| Anemic Handler | No value added, just pass-through | Direct data access + business logic in handler |
| Business Logic in Controller | Untestable, violates SRP | Move everything to handler |

::: notes
These five anti-patterns are the most common mistakes when teams first adopt vertical slices. The god handler is especially prevalent — developers add more and more logic to an existing handler instead of creating a new slice.

**Timing**: 5 minutes

**Exercise**: Show a code sample with one or more anti-patterns and ask students to identify and fix them.

**Transition**: Next, dependency management — how to keep third-party libraries safe and compliant.
:::

---

<!-- Module 3 divider -->

# Dependency Management Policy

*Risk Classification · Approval Workflow · Vulnerability SLAs · License Compliance*

::: notes
This section covers how to select, approve, monitor, and update third-party dependencies responsibly. Every library you add is a potential vulnerability vector, a licensing obligation, and a maintenance commitment.

**Key message**: Dependencies are not free. They have risk, cost, and compliance implications that must be evaluated before adoption.

**Timing**: 1 minute transition
:::

---

## Dependency Risk Classification

| Risk Level | Criteria | Review Required |
|---|---|---|
| **Critical** | Core functionality, security-sensitive, high exposure | Architecture + Security + Legal |
| **High** | Major feature enabler, network access, widely used | Technical + Security scan + License |
| **Medium** | Supporting functionality, limited scope | Technical + Automated scan |
| **Low** | Dev tools, test utilities | Automated approval + post-review |

::: notes
Start by classifying every new dependency before evaluating it. The classification determines the review path. Critical dependencies (auth libraries, crypto, DB drivers) always require the full review board. Low-risk dev tools can be auto-approved with a post-merge review.

**Timing**: 4 minutes

**Ask**: What level would you assign to a new JWT validation library? (Answer: High — security-sensitive, network-adjacent)
:::

---

## Selection Criteria

**Must requirements** (all must be true):
- Active maintenance (commits within last 6 months)
- No known critical vulnerabilities
- Compatible license
- Responsive issues (avg response < 2 weeks)
- 1 000+ downloads/month (for public packages)

**Should requirements** (weighted factors):
- Corporate backing or large community
- Regular release cadence
- Test coverage > 80%
- Backward compatibility guarantees

::: notes
The must requirements are binary gates — failing any one of them disqualifies the package. The should requirements feed into a weighted score that informs the final decision.

**Timing**: 4 minutes

**Practical tip**: Use a scorecard template for the selection assessment. Store the scorecard in the PR that adds the dependency.
:::

---

## Vulnerability Response SLAs

| CVSS Score | Severity | Response Time | Patch Time |
|---|---|---|---|
| 9.0–10.0 | **Critical** | 4 hours | 24 hours |
| 7.0–8.9 | **High** | 24 hours | 72 hours |
| 4.0–6.9 | **Medium** | 72 hours | 1 week |
| 0.1–3.9 | **Low** | 1 week | Next release cycle |

Tools: GitHub Dependabot · Snyk · OWASP Dependency-Check

::: notes
These SLAs set the expectation for how quickly the team must respond to vulnerability alerts. Critical vulnerabilities require near-immediate response — within 4 hours of detection you must have an assessment; within 24 hours the patch must be deployed.

**Timing**: 4 minutes

**War story**: A critical vulnerability discovered on a Friday afternoon at 5pm still requires a 24-hour patch window. Automate where possible to reduce the after-hours burden.
:::

---

## License Compliance

| Category | Licenses | Action |
|---|---|---|
| ✅ Fully Approved | MIT, Apache 2.0, BSD, ISC, Unlicense | Auto-accept |
| ⚠️ Conditional | LGPL 2.1/3.0, MPL 2.0, EPL 2.0 | Review required |
| 🔍 Legal Review | GPL 2.0/3.0, AGPL 3.0, Commercial | Legal team sign-off |
| ❌ Prohibited | Non-commercial, advertising-clause | Reject |

**Maintain a `LICENSES.md` inventory** tracking every dependency, its version, license, and attribution requirements.

::: notes
License compliance is a legal obligation, not just a best practice. AGPL in particular is problematic for SaaS — it requires publishing your source if you provide the software as a network service.

**Timing**: 3 minutes

**Tool tip**: Use FOSSA or `license-checker` (npm) to scan all dependencies automatically in CI. Make it a blocking check.
:::

---

## Automated Dependency Updates

**Dependabot configuration example:**

```yaml
version: 2
updates:
  - package-ecosystem: "npm"
    directory: "/"
    schedule:
      interval: "weekly"
      day: "monday"
    open-pull-requests-limit: 5
    reviewers: ["tech-leads"]
```

**Update approval matrix**: patch security → auto-merge · patch bug → tech lead · minor → tech lead + QA · major → architecture board

::: notes
Automating updates reduces the maintenance burden dramatically. Patch-level security updates should auto-merge after passing CI. Major updates require human review because they may contain breaking changes.

**Timing**: 4 minutes

**Hands-on**: Walk through configuring Dependabot in a repository. Show the PR it creates and how to interpret the change summary.

**Transition**: Next, GitHub Copilot Prompt Files — reusable task templates for Copilot.
:::

---

<!-- Module 4 divider -->

# GitHub Copilot Prompt Files

*Structure · Field Requirements · Validation · Best Practices*

::: notes
This section covers creating and using GitHub Copilot prompt files — reusable task definitions stored in `.github/prompts/`. These are different from instructions files (which define global rules) and agents (which define personas).

**Key message**: Prompt files are task definitions, not behavioral instructions. They tell Copilot *what to do*, not *who to be*.

**Timing**: 1 minute transition
:::

---

## What Is a Prompt File?

A **prompt file** is a Markdown file in `.github/prompts/` that defines a reusable task Copilot can invoke.

| Type | Location | Purpose |
|---|---|---|
| **Prompt file** | `.github/prompts/` | Reusable task invocation |
| **Instruction file** | `.github/instructions/` | Repo-wide rules and policies |
| **Chat mode / Agent** | `.github/chatmodes/` or `.github/agents/` | Behavioral persona |

**Invoke with**: `@promptfile-name` or pass as argument

::: notes
The distinction between these three types is important. Instructions are always-on rules. Prompt files are on-demand tasks. Chat modes and agents define how Copilot behaves as a persona. Using the wrong type is a common mistake.

**Timing**: 3 minutes

**Question**: Which type would you use to define "always follow our coding standards"? (Answer: instruction file)
:::

---

## Prompt File Structure

```markdown
---
name: generate-tests           # optional, enables @generate-tests invocation
description: "Generate unit tests for a given file"  # REQUIRED
arguments:
  file:
    type: string
    description: "Path to the file to test"
tags: ["testing", "automation"]
# AI provenance fields (ai_generated, model, operator, etc.)
---

# Generate Tests

Write comprehensive unit tests for {{file}}.

Rules:
- Cover all branches
- Use descriptive test names
- Avoid mocking unless necessary
```

::: notes
Walk through each section:
- Front matter: metadata + arguments definition
- Markdown body: the actual task instruction
- Arguments use `{{argName}}` interpolation

**Timing**: 5 minutes

**Key points**: `description` is required; `name` is optional but enables the `@name` invocation syntax. If `name` is present, the filename should match it (minus extension).
:::

---

## Field Requirements

**Required by Copilot:**
- `description` — shown in the promptfile picker
- `name` — (optional) enables `@name` invocation; filename must match if set

**Argument types:**
- `string`, `number`, `boolean`, `enum` (with `values` array), `object`

**Reference arguments in body:** `{{argName}}`

**File location:** `.github/prompts/` (flat — no subfolders)

**Naming:** kebab-case, `.prompt.md` extension

::: notes
The flat directory rule is important — Copilot only scans `.github/prompts/` exactly. Subfolders are not discovered. Prompt files must be at the root of that directory.

**Timing**: 3 minutes

**Validation tip**: After creating a prompt file, check that it appears in the Copilot chat `@` dropdown. If it doesn't show up, check location and file extension.
:::

---

## Writing Good Prompt Body Content

✅ **Do:**
- Task-oriented: "Generate unit tests for `{{file}}`"
- Deterministic: explicit numbered steps
- Structured: headings and lists
- Short: 10–30 lines ideal
- Context-aware: use `{{arguments}}` not hardcoded values

❌ **Don't:**
- Behavioral instructions: "Act like a senior QA engineer"
- Vague: "Write some tests"
- Persona content: "You are a friendly testing expert"
- Overly long: 200+ lines get truncated

::: notes
The distinction between task-oriented and behavioral is the most important writing principle. A prompt file tells Copilot what to do right now. An agent or chat mode defines how Copilot behaves over a whole conversation.

**Timing**: 4 minutes

**Exercise**: Show a poorly written prompt body and ask students to improve it. Common issues: too vague, persona instructions, hardcoded paths.
:::

---

## Prompt File Validation Checklist

- [ ] File in `.github/prompts/` (flat directory)
- [ ] Extension is `.prompt.md` or `.md`
- [ ] `description` field present
- [ ] If `name` field present, filename matches it (minus extension)
- [ ] All `arguments` have `type` and `description`
- [ ] All arguments referenced correctly as `{{argName}}`
- [ ] Body is task-oriented (not behavioral)
- [ ] Body is under 30 lines (ideal)
- [ ] AI provenance fields complete (if AI-generated)
- [ ] File appears in Copilot `@` dropdown after save

::: notes
This checklist mirrors the validation checks built into the CI pipeline. Completing it before committing prevents broken prompt files from landing on the main branch.

**Timing**: 3 minutes

**Hands-on**: Have students create a simple prompt file (e.g., "summarise this file") and verify it appears in the picker.

**Transition**: Last module — Custom GitHub Copilot Chat Modes.
:::

---

<!-- Module 5 divider -->

# Custom GitHub Copilot Chat Modes

*Creating Domain-Specific AI Assistants*

::: notes
This section covers creating custom GitHub Copilot chat modes — specialized AI assistants that bring domain expertise to your workflow. Unlike prompt files (single tasks), chat modes provide a persistent persona and methodology for an entire conversation.

**Key message**: Chat modes make Copilot an expert in a specific domain rather than a generalist. A Security Analyzer, a Documentation Assistant, a Test Specialist — each has focused expertise and tools.

**Timing**: 1 minute transition
:::

---

## Chat Mode File Structure

```
.github/chatmodes/
  security-analyzer.chatmode.md
  documentation-assistant.chatmode.md
  code-explorer.chatmode.md
```

**Required header fields:**
```markdown
# Name: Security Analyzer
# Focus: Code security, vulnerability detection
# Temperature: 0.3
# Style: Thorough, security-focused, action-oriented
```

::: notes
Chat mode files live in `.github/chatmodes/` and use the `.chatmode.md` extension. The four header fields set the display name, primary domain, determinism level, and communication style.

**Timing**: 3 minutes

**Activate a chat mode**: Type `@security-analyzer` in Copilot chat to switch into that mode.
:::

---

## Temperature Guide

| Range | Best For | Example |
|---|---|---|
| 0.0–0.3 | Deterministic (security, compliance) | Security Analyzer |
| 0.4–0.5 | Balanced (docs, analysis) | Documentation Assistant |
| 0.6–0.7 | Creative (architecture, brainstorming) | Solution Architect |
| 0.8–1.0 | Highly creative (rarely used) | Ideation modes |

::: notes
Temperature controls how deterministic vs. creative the model's responses are. For security analysis you always want low temperature — you want consistent, rigorous outputs. For architecture brainstorming, slightly higher temperature generates more diverse ideas.

**Timing**: 3 minutes

**Common mistake**: Using high temperature for compliance checking. You want the same answer every time for security rules.
:::

---

## Core Chat Mode Sections

1. **Mission Statement** (required) — 1–2 sentences defining role and value
2. **Core Expertise** (required) — 5–10 specific capability areas
3. **Analysis Methodology** (optional) — multi-phase workflow
4. **Interactive Commands** (optional) — `@command-name` shortcuts
5. **Response Format** (recommended) — output structure
6. **Communication Principles** (recommended) — behavioural guidelines
7. **Example Interactions** (recommended) — usage demonstrations

::: notes
Not all sections are required, but including recommended sections dramatically improves the quality and consistency of responses. The example interactions section is particularly valuable — it shows users how to get the best results from the mode.

**Timing**: 4 minutes

**Tip**: Keep the full prompt under 30 000 characters or it will be truncated by Copilot.
:::

---

## Chat Mode Templates

**Security Analyzer:**
```markdown
# Name: Security Analyzer
# Focus: Code security, vulnerability detection
# Temperature: 0.3
# Style: Thorough, security-focused, action-oriented

You are an expert security analyst specializing in OWASP Top 10
and vulnerability detection. You create GitHub issues for findings.

## Interactive Commands
- **`@security-scan`** — Full security assessment
- **`@owasp-check`** — OWASP Top 10 analysis
```

::: notes
This is a minimal but functional security analyzer chat mode. The mission statement is specific (OWASP, GitHub issues). The interactive commands give users quick entry points for common tasks.

**Timing**: 3 minutes

**Demonstration**: Create this chat mode in the repo, commit it, then activate it with `@security-analyzer` and run `@security-scan` on a sample file.
:::

---

## Chat Mode vs. Prompt File vs. Agent

| Feature | Prompt File | Chat Mode | Agent |
|---|---|---|---|
| Location | `.github/prompts/` | `.github/chatmodes/` | `.github/agents/` |
| Purpose | Single reusable task | Persistent domain persona | Full-capability specialist |
| Invocation | `@promptfile-name` | `@mode-name` | `@agent-name` |
| Lifespan | Single task | Whole conversation | Whole conversation |
| Tools | Inherited | Inherited | Configurable |

::: notes
Understanding when to use each type is the key skill. Prompt files are for "do this one thing now." Chat modes and agents are for "become this expert for our whole conversation." Agents (in `.github/agents/`) support richer tool configuration including MCP servers.

**Timing**: 4 minutes

**When to use each**:
- Prompt file: "Generate tests for this file" → single task, always the same
- Chat mode: "Help me review security for the next hour" → persistent expertise
- Agent: "I need a specialist with custom tool access" → advanced configuration

**Transition**: That wraps up today's five modules. Let's review what we covered.
:::

---

## Day Summary

| Module | Key Takeaway |
|---|---|
| AI-Assisted Output | Every AI artifact needs provenance metadata and a chat log |
| Vertical Slices | Organise by feature, not layer; handler = business logic |
| Dependency Management | Classify risk first; SLAs for vulnerability response |
| Prompt Files | Task-oriented `.github/prompts/` files with `description` required |
| Custom Chat Modes | Domain-expert personas in `.github/chatmodes/` |

::: notes
This closing slide recaps the five key takeaways for each module. Use it as a quick review before students leave.

**Timing**: 5 minutes for Q&A

**Homework**: Before Tuesday, complete the following:
1. Add provenance front matter to one AI-generated file you have locally
2. Create a simple prompt file for a task you do repeatedly
3. Try activating one of the existing chat modes in VS Code Copilot

**Tomorrow (Tuesday)**: CQRS Architecture, GitHub CLI, Business Rules to Vertical Slices, and Custom Copilot Agents.
:::
