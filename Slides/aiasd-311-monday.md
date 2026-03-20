---
ai_generated: true
model: "anthropic/claude-sonnet-4.5@2026-03-20"
operator: "johnmillerATcodemag-com"
chat_id: "merge-marp-decks-monday-20260320"
prompt: |
  Manifest: Slides/aiasd-311-monday.yaml
  run this prompt #file:merge-marp-decks.prompt.md
started: "2026-03-20T04:51:06Z"
ended: "2026-03-20T05:20:00Z"
task_durations:
  - task: "read manifest and sources"
    duration: "00:05:00"
  - task: "assemble combined deck"
    duration: "00:18:00"
  - task: "add section dividers and speaker notes"
    duration: "00:06:00"
total_duration: "00:29:00"
ai_log: "ai-logs/2026/03/20/merge-marp-decks-monday-20260320/conversation.md"
source: ".github/prompts/merge-marp-decks.prompt.md"
marp: true
theme: default
paginate: true
---

# AI-Assisted Software Development

## Class 311 — Monday Session

*AI Output Standards · Vertical Slices · Prompt Files · Dependency Management · Custom Chat Modes*

::: notes
Welcome to the AI-Assisted Software Development Class 311 Monday session. This combined presentation covers five modules: AI output standards, vertical slice architecture, creating prompt files, dependency management policy, and creating custom chat modes.

**Timing**: 1 minute

**Course Overview**:
This deck merges five individual module presentations into a single comprehensive course. Each module is separated by a section divider slide so you can navigate or present individual sections.

**Modules in This Deck**:
1. **AI-Assisted Output** — Mandatory metadata, logging workflow, and CI enforcement for all AI-generated artifacts
2. **Vertical Slice Architecture** — When to apply, code generation rules, naming conventions, and anti-patterns
3. **Creating Prompt Files** — Structure, field requirements, templates, anti-patterns, and validation checklist
4. **Dependency Management Policy** — Risk classification, selection criteria, vulnerability monitoring, and supply chain security
5. **Creating Custom Chat Modes** — File structure, header fields, content sections, templates, and quality rules

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

**Prerequisites**: No prerequisites required for this foundational module.

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

## Key Takeaways — AI-Assisted Output

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
<!-- MODULE 2: VERTICAL SLICE ARCHITECTURE -->
<!-- ============================================================ -->

# Module 2

## Vertical Slice Architecture

*Feature-Centric Code Organization*

::: notes
This section divider marks the start of Module 2: Vertical Slice Architecture.

**Module Duration**: Approximately 20–25 minutes

**Module Description**: When to apply vertical slices, code generation rules, naming conventions, file structure, and anti-patterns.

**Prerequisites**: Basic familiarity with layered/three-tier architecture is helpful.

**Transition**: "Let's dive into Vertical Slice Architecture."
:::

# Vertical Slice Architecture

## Feature-Centric Code Organization

*AI-Assisted Software Development*

::: notes
Welcome to this module on Vertical Slice Architecture. Instead of organizing code by technical layer (controllers, services, repositories), vertical slices organize code by feature or user capability — each slice contains everything it needs from the database all the way to the API endpoint.

**Timing**: 1 minute for title slide

**Key Points**:
- Each feature lives in its own folder with all its components
- Features are independent — changing one does not break another
- The handler is the heart of each slice, containing the business logic
- This pattern pairs naturally with CQRS and MediatR

**Delivery**: Start by asking what frustrations the audience has with traditional layered code — huge service classes, cross-cutting concerns, difficulty finding where logic lives. Vertical slices solve all of these.

**Transition**: "Let's start with when to apply vertical slice architecture."
:::

---

## When to Apply Vertical Slices

**✅ Apply when**:
- User explicitly requests "vertical slices" or "feature slices"
- Adding a complete new feature end-to-end
- Existing codebase has `/Features` folder structure
- CQRS, Commands/Queries, or MediatR are mentioned
- Refactoring from layered to feature-centric organization

**❌ Do NOT apply when**:
- User requests layered or traditional MVC architecture
- Working on simple scripts or utilities
- Adding to an existing non-slice codebase without permission

::: notes
The key trigger is intent — user vocabulary and existing codebase structure.

**Timing**: 2 minutes

**Key Points**:
- "Vertical slice" and "feature slice" are common terms users will use
- If the codebase already has `/Features` folder, always follow that pattern
- MediatR and CQRS are strong signals that the team uses vertical slices
- Never introduce vertical slices into a layered codebase without explicit permission — it creates confusion

**Example Triggers**:
- "Add a password reset feature using vertical slices" → apply
- "Add a password reset method to the UserService" → do NOT apply

**Transition**: "Before writing a single line of code, do pre-implementation analysis."
:::

---

## Pre-Implementation Analysis

Before generating code, determine:

1. **Feature Boundary** — what is the complete user capability?
2. **Existing Structure** — does `/Features` already exist?
3. **Required Components**:
   - [ ] Command/Query object (always)
   - [ ] Handler (always)
   - [ ] Validator (if input validation needed)
   - [ ] Result DTO (if response differs from domain model)
   - [ ] Repository (if complex data access)
   - [ ] API endpoint (if external entry point)
   - [ ] Tests (always)

::: notes
This checklist prevents incomplete slices and avoids building the wrong thing.

**Timing**: 3 minutes

**Key Points**:
- Command/Query and Handler are mandatory — every slice has these two
- If the codebase already has `/Features`, scan it before creating anything new
- Tests are always listed — they are part of the slice specification
- Result DTOs avoid exposing domain models directly to the API layer

**Feature Boundary Questions**:
- What is the complete user capability being implemented?
- What is the smallest slice that delivers value?
- Does this feature naturally group with an existing feature?

**Example**:
"Add password reset" → Feature = `PasswordReset` → Includes: request reset + validate token + update password

**Transition**: "Let's look at the four core code generation rules."
:::

---

## Code Generation Rules

**Rule 1**: Features must NOT directly reference other features

```csharp
// ❌ NEVER — direct feature dependency
using Features.UserManagement;
public class OrderHandler { private readonly UserService _userService; }

// ✅ ALWAYS — shared interface
using Common.Interfaces;
public class OrderHandler { private readonly IUserProvider _userProvider; }
```

**Rule 2**: Each feature slice contains everything it needs  
**Rule 3**: Controllers are thin — route to mediator only  
**Rule 4**: Handlers contain all business logic

::: notes
These four rules, when followed, keep slices truly independent and maintainable.

**Timing**: 4 minutes

**Rule 1 Enforcement**:
- After generating code, scan all `using` statements in new feature files
- Flag any `using Features.[OtherFeature]` as a violation
- The fix is always to extract a shared interface in `Common/Interfaces/`

**Rule 2 Example**:
```
/Features/UserRegistration
  ✅ RegisterUserCommand.cs     - Request
  ✅ RegisterUserHandler.cs     - Business logic
  ✅ RegisterUserValidator.cs   - Validation
  ✅ RegistrationResult.cs      - Response DTO
  ✅ UserRegistrationRepository - Data access
  ❌ ../../Repositories/UserRepo - NO shared repo
```

**Rule 3 — Thin Controller**:
```csharp
[HttpPost("register")]
public async Task<IActionResult> Register(RegisterUserCommand command, CancellationToken ct)
{
    var result = await _mediator.Send(command, ct);
    return result.IsSuccess ? Ok(result.Value) : BadRequest(result.Error);
}
```
That's it — no validation, no DB access, no business logic in the controller.

**Rule 4** — Handlers orchestrate: validate preconditions, enforce business rules, persist, trigger side effects, return a Result<T>.

**Transition**: "How do we name and organize these files?"
:::

---

## File Structure & Naming

```
/src
  /Features
    /[FeatureName]
      - [Action]Command.cs         (or [Action]Query.cs)
      - [Action]Handler.cs
      - [Action]Validator.cs
      - [Action]Result.cs
      - [Feature]Repository.cs     (optional)
  /Common
    /Interfaces
    /Behaviors
  /Api
    /Controllers
  /Tests
    /Features/[FeatureName]
      - [Action]HandlerTests.cs
```

**Naming checklist**:
- Feature folder — PascalCase singular: `UserRegistration`
- Command/Query — `[Verb][Entity]Command` / `[Verb][Entity]Query`
- Handler — `[Verb][Entity]Handler`
- Tests — handler name + `Tests`

::: notes
Consistent naming makes features discoverable and reduces cognitive load.

**Timing**: 3 minutes

**Key Points**:
- Feature folder names are PascalCase singular nouns: `UserRegistration`, `PasswordReset`, `OrderCheckout`
- Command names reveal intent: `RegisterUserCommand`, NOT `CreateUserCommand` (too CRUD-like)
- Query names include the return concept: `GetUserProfileQuery`, `SearchProductsQuery`
- Test files mirror the handler they test — one handler, one test file

**Language Examples**:
- C#: `RegisterUserCommand : IRequest<Result<RegistrationResult>>`
- TypeScript: `class RegisterUserCommand implements IRequest<Result<RegistrationResult>>`
- Python: `@dataclass class RegisterUserCommand(Request):`
- Java: `public record RegisterUserCommand(...) implements Command<Result<RegistrationResult>> {}`

**Transition**: "What order do we generate the files in?"
:::

---

## Implementation Order

Generate files in this sequence:

1. **Command/Query** — defines the contract
2. **Result DTO** — defines what the handler returns
3. **Validator** — defines validation rules
4. **Handler** — business logic (now knows inputs, outputs, validation)
5. **Controller/Endpoint** — entry point after core logic exists
6. **Tests** — validate the completed implementation

> Never start with the controller or database schema — start with the contract.

::: notes
This order prevents rework and ensures each file is complete before depending on it.

**Timing**: 2 minutes

**Why This Order**:
1. Command defines inputs — everything else depends on this
2. Result defines outputs — handler needs to know what to return
3. Validator defines business rules for inputs — handler can delegate to it
4. Handler now has complete picture — inputs, outputs, validation rules
5. Controller is trivial once handler exists
6. Tests are most valuable last — you test real behavior, not assumptions

**Anti-Pattern**: Starting with the database schema or controller leads to bottom-up or top-down design. Vertical slices are middle-out — start with the intent (Command) and build outward.

**Transition**: "Let's look at the anti-patterns to avoid."
:::

---

## Anti-Patterns to Avoid

| Anti-Pattern | Problem | Solution |
|-------------|---------|----------|
| God Handler (300+ lines) | Does too much | Break into focused services |
| Shared Generic Repository | Couples all features | Feature-specific repository |
| Feature → Feature dependency | Breaks independence | Shared interface or domain event |
| Anemic Handler (< 10 lines) | Just pass-through, no value | Access data directly or add logic |
| Business logic in controller | Untestable, violates separation | Move all logic to handler |

::: notes
These five anti-patterns are the most common mistakes in vertical slice implementations.

**Timing**: 3 minutes

**God Handler**:
If a handler exceeds ~100 lines, consider extracting a domain service or breaking the feature into smaller slices.

**Shared Generic Repository**:
```csharp
// ❌ AVOID — generic repository used everywhere
IRepository<User> _userRepo;

// ✅ BETTER — feature-specific data access
public class OrderCreationRepository
{
    public async Task<Order> CreateOrderAsync(Order order) { ... }
    public async Task<bool> IsInventoryAvailableAsync(List<OrderItem> items) { ... }
}
```

**Anemic Handler** — if the handler just calls a service method and returns, it adds no value. Either put the logic directly in the handler or eliminate the service layer.

**Transition**: "Let's close with integration scenarios."
:::

---

## Integration with Existing Code

| Scenario | Strategy |
|----------|----------|
| Adding to existing slice codebase | Follow existing patterns exactly |
| Adding slice to layered codebase | Create `/Features` folder, keep old code intact |
| Migrating layered code | One feature at a time; move, refactor, test, delete old |

**Quality Checklist**:
- [ ] No `using Features.[OtherFeature]` statements
- [ ] Handler has meaningful business logic
- [ ] Validator exists and is comprehensive
- [ ] Tests cover happy path and error cases
- [ ] Naming follows conventions

::: notes
Incremental integration is safer than big-bang migrations.

**Timing**: 2 minutes

**Adding to Existing Slice Codebase**:
- Scan existing features to understand naming patterns
- Match exactly — don't introduce new conventions
- Use existing shared interfaces

**Adding Slice to Layered Codebase**:
1. Create `/Features` folder
2. Add new feature as a vertical slice
3. Keep ALL existing layered code unchanged
4. Document the coexistence in the README

**Migration Strategy**:
1. Identify one feature to migrate
2. Create the feature folder
3. Move/refactor code into feature
4. Update DI registrations
5. Run all tests
6. Delete old code only after tests pass

**Q&A**: Open for questions about specific naming decisions or migration challenges.
:::

---

<!-- ============================================================ -->
<!-- MODULE 3: CREATING PROMPT FILES -->
<!-- ============================================================ -->

# Module 3

## Creating Prompt Files

*Reusable Task Definitions for GitHub Copilot*

::: notes
This section divider marks the start of Module 3: Creating Prompt Files.

**Module Duration**: Approximately 20–25 minutes

**Module Description**: Promptfile structure, field requirements, argument definitions, templates, anti-patterns, and the validation checklist.

**Prerequisites**: Familiarity with GitHub Copilot chat is helpful.

**Transition**: "Let's dive into Creating Prompt Files."
:::

# Creating Prompt Files

## Reusable Task Definitions for GitHub Copilot

*AI-Assisted Software Development*

::: notes
Welcome to this module on Creating Prompt Files. Promptfiles let you define reusable tasks that can be invoked with `@promptfile-name` in GitHub Copilot chat. Instead of typing the same long instructions repeatedly, you write them once as a promptfile and reuse them.

**Timing**: 1 minute for title slide

**Key Points**:
- Promptfiles are NOT behavioral instructions (those are agents)
- They are NOT repo-wide rules (those are `.github/instructions/` files)
- They are task definitions — specific, reusable things Copilot can do

**When to Create a Promptfile**:
- You repeat the same multi-step task in Copilot chat
- You want consistent output across team members
- You want to parameterize a task with arguments

**Transition**: "Let's understand the structure of a promptfile."
:::

---

## Promptfile Structure

A promptfile has two parts:

1. **YAML front matter** — metadata, arguments, AI provenance
2. **Markdown body** — task instructions

**Location**: `.github/prompts/` (flat — no subfolders)  
**Extension**: `.prompt.md`  
**Naming**: kebab-case matching the `name:` field

```
.github/
└── prompts/
    ├── generate-tests.prompt.md
    ├── merge-marp-decks.prompt.md
    └── summarize-file.prompt.md
```

::: notes
Strict location and naming rules determine whether Copilot discovers the file.

**Timing**: 2 minutes

**Critical Rules**:
- Must be in `.github/prompts/` — NOT `.github/copilot/Promptfiles/` (deprecated path)
- Must be a flat directory — no subfolders
- If the `name:` field is set, the filename (minus extension) must match it exactly
- Extension must be `.prompt.md` or `.md`

**Discovery**: Copilot scans `.github/prompts/` automatically. No registration needed — just commit the file.

**Transition**: "Let's look at the required front matter fields."
:::

---

## Required Front Matter Fields

```yaml
---
name: generate-tests          # Optional but recommended
description: "Generate unit tests for a given file"  # REQUIRED

# AI Provenance (required by repository policy)
ai_generated: true
model: "provider/model@version"
operator: "github-username"
chat_id: "unique-identifier"
prompt: |
  Exact prompt that created this file
started: "ISO8601"
ended: "ISO8601"
task_durations:
  - task: "creation"
    duration: "HH:MM:SS"
total_duration: "HH:MM:SS"
ai_log: "ai-logs/yyyy/mm/dd/chat-id/conversation.md"
source: "creator-identifier"
---
```

::: notes
The `description` field is the only Copilot-required field beyond the file location.

**Timing**: 3 minutes

**Field Notes**:
- `name` — shown in the `@` picker; defaults to filename without extension if omitted
- `description` — required; shown in the picker alongside the name
- AI provenance fields — required by repository policy; Copilot ignores them but auditors need them
- `model` must use `provider/model@version` format — never "Auto" or "github/copilot"

**Optional Fields** (Copilot ignores, safe for governance):
- `owner`, `version`, `team`, `riskLevel`, `reviewedBy`, `tags`

**Transition**: "Arguments make promptfiles reusable without editing them each time."
:::

---

## Defining Arguments

```yaml
arguments:
  file:
    type: string
    description: "Path to the file to test"
  framework:
    type: enum
    values: ["jest", "mocha", "pytest", "junit"]
    description: "Testing framework to use"
  coverage:
    type: number
    description: "Target coverage percentage"
    default: 80
```

**Reference in body**: `{{file}}`, `{{framework}}`, `{{coverage}}`

**Supported types**: `string`, `number`, `boolean`, `enum`, `object`

::: notes
Arguments are the key to making promptfiles general-purpose rather than single-use.

**Timing**: 3 minutes

**When to Use Arguments**:
- When the same task applies to different files, languages, or targets
- When you want to avoid editing the promptfile for each use
- When you want to enforce consistent structure (e.g., always pick from enum values)

**Invocation Examples**:
```
@generate-tests file=src/auth/UserService.ts framework=jest
@generate-tests file=api/handlers/order.py framework=pytest coverage=90
```

**Rules for Arguments**:
- Every argument must have `type` and `description`
- All arguments referenced in the body must be declared
- Arguments not used in the body are dead code — remove them
- Enum values define the allowed choices; Copilot may prompt the user to select one

**Transition**: "Let's look at how to write the markdown body effectively."
:::

---

## Writing the Promptfile Body

**✅ Task-oriented** — tell Copilot what to do:
- ✅ "Generate unit tests for `{{file}}`"
- ❌ "Act like a senior QA engineer..."

**✅ Deterministic** — use explicit numbered steps  
**✅ Short** — aim for 10–30 lines, not 200  
**✅ Structured** — use headings and bullet lists  
**✅ Context-aware** — use `{{arguments}}` not hardcoded values  
**❌ No personas** — promptfiles are tasks, not agents

::: notes
The body is the task definition — it should read like a precise instruction manual, not a conversation.

**Timing**: 3 minutes

**The Biggest Mistake**: Writing behavioral instructions ("Act like a helpful expert..."). These belong in custom agents (`.github/agents/`), not promptfiles. Promptfiles are deterministic tasks.

**Good Body Structure**:
```markdown
# Generate Tests

1. Read `{{file}}` and identify all public methods
2. For each method, generate a test case using `{{framework}}`
3. Include happy path, error conditions, and edge cases
4. Name tests descriptively: `describe → context → expected behavior`
5. Target `{{coverage}}%` code coverage
```

**Short but Complete**: 10-30 lines is the sweet spot. Too short = vague. Too long = Copilot truncates.

**Transition**: "Let's look at the anti-patterns that break promptfiles."
:::

---

## Promptfile Anti-Patterns

| Anti-Pattern | Why Wrong | Fix |
|-------------|-----------|-----|
| Behavioral instructions ("Act like...") | Promptfiles are tasks, not personas | Use agents in `.github/agents/` |
| Repo-wide rules ("Always write tests") | Rules go in `.github/instructions/` | Create an instructions file instead |
| 200+ line body | Copilot truncates long prompts | Trim to 10–30 lines |
| Embedding code in arguments | Arguments are plain YAML values | Put examples in the body |
| Wrong file location | Copilot won't discover it | Must be in `.github/prompts/` flat |

::: notes
These anti-patterns account for most cases where promptfiles don't work as expected.

**Timing**: 2 minutes

**Behavioral vs Task**:
- Behavioral: "You are a helpful assistant. Be friendly. Think carefully before responding." → Agent
- Task: "1. Analyze the file. 2. Generate tests. 3. Return test file path." → Promptfile

**Location Is Critical**:
- `.github/copilot/Promptfiles/` → Copilot does NOT scan this (legacy path)
- `.github/prompts/subfolder/` → Copilot does NOT scan subfolders
- `.github/prompts/` → ✅ Correct

**Transition**: "Use this validation checklist before committing."
:::

---

## Validation Checklist

**Structure**:
- [ ] File in `.github/prompts/` (flat — no subfolders)
- [ ] Extension is `.prompt.md` or `.md`
- [ ] If `name:` field used, filename matches it

**Required Fields**:
- [ ] `description` present (Copilot-required)
- [ ] All AI provenance fields present

**Arguments** (if used):
- [ ] Each argument has `type` and `description`
- [ ] All arguments referenced with `{{argName}}`
- [ ] No unused arguments in body

**Body**:
- [ ] Task-oriented, not behavioral
- [ ] 10–30 lines, structured with headings/lists
- [ ] No persona content ("Act like...", "You are...")

::: notes
Run through this checklist before every promptfile commit.

**Timing**: 2 minutes

**Post-Creation Requirements** (same as all AI artifacts):
1. Create `ai-logs/.../conversation.md`
2. Create `ai-logs/.../summary.md`
3. Update README.md with entry and log link
4. Verify metadata
5. Test the promptfile in Copilot chat

**Testing After Creation**:
1. Open Copilot chat, type `@` — your promptfile should appear in the picker
2. Invoke it: `@generate-tests file=src/app.ts`
3. Verify Copilot prompts for missing argument values
4. Verify output matches expectations
5. Run a second time — output should be consistent

**Transition**: "Let's close with the decision guide — when to use each Copilot customization."
:::

---

## When to Use Each System

| Need | Use | Location |
|------|-----|----------|
| Reusable task | Promptfile | `.github/prompts/` |
| Behavioral persona | Custom agent | `.github/agents/` |
| Repo-wide rule | Instruction file | `.github/instructions/` |
| One-off task | Type it in chat | — |

> **Promptfiles = tasks. Agents = personas. Instructions = rules.**

::: notes
This decision guide prevents creating the wrong artifact type.

**Timing**: 2 minutes

**The Confusion**:
Many developers try to put behavioral instructions in promptfiles because they're familiar with chat-based interactions. The key distinction:
- **Promptfile**: "Here is what to do — step 1, step 2, step 3"
- **Agent**: "Here is how to think and behave in all situations"
- **Instruction**: "Here is a rule that applies across the whole codebase"

**Real Examples**:
- "Generate tests for this file" → Promptfile
- "Be a security-focused code reviewer for every conversation" → Agent
- "Always use TypeScript strict mode" → Instructions file
- "What does this function do?" → Type it in chat

**Q&A**: Open the floor for questions about promptfile creation and Copilot customization.
:::

---

<!-- ============================================================ -->
<!-- MODULE 4: DEPENDENCY MANAGEMENT POLICY -->
<!-- ============================================================ -->

# Module 4

## Dependency Management Policy

*Secure, Compliant, and Maintainable Dependencies*

::: notes
This section divider marks the start of Module 4: Dependency Management Policy.

**Module Duration**: Approximately 20–25 minutes

**Module Description**: Risk classification, selection criteria, vulnerability monitoring, license compliance, supply chain security, and automated updates.

**Prerequisites**: Familiarity with package managers (npm, pip, Maven, etc.) is helpful.

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
Supply chain attacks are now one of the top threat vectors.

**Timing**: 2 minutes

**Key Points**:
- Never install packages from unofficial registries or direct git URLs
- The SLSA framework (from Google) provides a security maturity model for build systems
- An internal registry proxy adds a layer of scanning before packages reach developers
- Package name typosquatting (e.g., `coloers` instead of `colors`) is a common attack vector

**Alarming Statistic**: The XZ Utils backdoor was nearly undetected despite being committed to a widely-used open source library by a sophisticated attacker who spent two years building trust.

**Practical Action**: Enable npm audit / pip audit in your CI pipeline as a basic first step.

**Transition**: "Let's close with key takeaways."
:::

---

## Key Takeaways — Dependency Management

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
<!-- MODULE 5: CREATING CUSTOM CHAT MODES -->
<!-- ============================================================ -->

# Module 5

## Creating Custom Chat Modes

*Specialized AI Assistants for Your Domain*

::: notes
This section divider marks the start of Module 5: Creating Custom Chat Modes.

**Module Duration**: Approximately 20–25 minutes

**Module Description**: File structure, header fields, content sections, templates for security/documentation/exploration, validation checklist, and anti-patterns.

**Prerequisites**: Basic familiarity with GitHub Copilot chat is helpful.

**Transition**: "Let's dive into Creating Custom Chat Modes."
:::

# Creating Custom Chat Modes

## Specialized AI Assistants for Your Domain

*AI-Assisted Software Development*

::: notes
Welcome to this module on Creating Custom Chat Modes. While promptfiles define reusable tasks, chat modes define specialized AI personas — a security analyzer, a documentation assistant, a codebase explorer. Each chat mode gives Copilot a domain-specific focus and communication style.

**Timing**: 1 minute for title slide

**Key Points**:
- Chat modes are behavioral — they define HOW Copilot thinks and communicates
- Promptfiles are task-based — they define WHAT Copilot does
- A chat mode stays active for the whole conversation; a promptfile is a one-time invocation

**Delivery**: Ask the audience about frustrating interactions where Copilot gave generic answers when they needed domain-specific expertise. Custom chat modes solve this by scoping the AI's persona.

**Transition**: "Let's look at the file structure requirements."
:::

---

## File Structure

**Location**: `.github/chatmodes/`  
**Pattern**: `<chat-mode-name>.chatmode.md` (kebab-case)  
**Extension**: `.chatmode.md` (required)

**Required header** (at the top of every chat mode):

```markdown
# Name: Security Analyzer

# Focus: Code security analysis, vulnerability detection

# Temperature: 0.3

# Style: Thorough, security-focused, action-oriented
```

**Core sections** (in order):
1. Mission Statement (required)
2. Core Expertise (required)
3. Analysis Methodology (optional)
4. Interactive Commands (optional)
5. Response Format, Communication Principles, Examples

::: notes
The file structure is straightforward but the header fields are mandatory.

**Timing**: 3 minutes

**Location Note**: `.github/chatmodes/` NOT `.github/copilot/chat_modes/` — the latter is a legacy path. Always use `.github/chatmodes/`.

**Header Field Rules**:
- **Name**: Title Case, 2-4 words, descriptive and memorable
- **Focus**: Specific domain description, key capabilities comma-separated
- **Temperature**: A decimal from 0.0 to 1.0 (see next slide for guidance)
- **Style**: 2-4 adjectives that describe the communication style

**Sections**:
- Mission Statement and Core Expertise are mandatory
- The rest are optional but strongly recommended
- Sections must appear in the order listed

**Transition**: "Let's look at the temperature scale — it guides how creative vs. deterministic the AI should be."
:::

---

## Temperature Guide

| Range | Behavior | Best For |
|-------|----------|----------|
| 0.0–0.3 | Deterministic, consistent | Security, compliance, code review |
| 0.4–0.5 | Balanced | Documentation, analysis |
| 0.6–0.7 | Creative | Architecture, brainstorming |
| 0.8–1.0 | Highly creative | Rarely used — unpredictable |

**Style examples**:
- Security: `Thorough, security-focused, action-oriented`
- Documentation: `Clear, helpful, detail-oriented`
- Architecture: `Analytical, forward-thinking, pragmatic`

::: notes
Temperature is the single most important configuration choice for a chat mode.

**Timing**: 2 minutes

**Why Temperature Matters**:
- Security analysis needs consistent, reproducible findings — high temperature would produce different vulnerability lists each run
- Documentation benefits from some creativity — slight temperature helps with varied sentence structures
- Architecture brainstorming benefits from higher creativity — you want novel approaches

**Common Mistake**: Setting all chat modes to temperature 0.7 "because AI should be creative." This leads to inconsistent, unreliable security analysis.

**Style Alignment**: The `Style` field should match the temperature. A temperature of 0.3 with style "playful, experimental" is contradictory.

**Transition**: "What goes in the content sections?"
:::

---

## Content Sections

**Mission Statement** — 1-2 sentences:
```markdown
You are a security specialist focusing on [domain].
Your mission is to [value] through [approach].
```

**Core Expertise** — 5-10 specific areas:
```markdown
## Your Core Expertise

- **Vulnerability Detection**: OWASP Top 10, CWE database
- **Static Analysis**: Security anti-patterns
- **Authentication**: OAuth, JWT, session management flaws
```

**Interactive Commands**:
```markdown
## Interactive Commands

- **`@security-scan`** — Comprehensive security assessment
- **`@owasp-check`** — OWASP Top 10 analysis
```

::: notes
The Mission Statement sets the focus; Core Expertise defines the depth; Interactive Commands provide shortcuts.

**Timing**: 3 minutes

**Mission Statement Tips**:
- Be specific about what the chat mode does AND doesn't do
- "You are a security specialist focused on identifying vulnerabilities without modifying production code" — both defines scope and sets boundaries

**Core Expertise**:
- Aim for 5-10 items — fewer is too vague, more dilutes focus
- Each item should be a specific capability, not a generic skill

**Interactive Commands**:
- Pattern: `@verb-noun` or `@domain-action`
- Use kebab-case
- 2-3 words max
- Group with common prefixes: all security commands start with `@security-`, all doc commands with `@doc-`

**Transition**: "Let's look at three complete template examples."
:::

---

## Template: Security Analyzer

```markdown
# Name: Security Analyzer

# Focus: Code security, vulnerability detection

# Temperature: 0.3

# Style: Thorough, security-focused, action-oriented

You are an expert security analyst...

## Your Core Expertise

- **Vulnerability Detection**: OWASP Top 10, CWE
- **Static Analysis**: Security anti-patterns

## Interactive Commands

- **`@security-scan`** — Comprehensive assessment
- **`@owasp-check`** — OWASP Top 10 analysis
```

::: notes
The Security Analyzer is the most common specialized chat mode in development teams.

**Timing**: 2 minutes

**Design Choices**:
- Temperature 0.3 — security findings must be reproducible and consistent
- Style: "action-oriented" means the analyzer doesn't just find problems — it recommends fixes
- No code modification: "identifies vulnerabilities without modifying production code"

**Usage Scenarios**:
- Pre-commit security check on a new feature
- Full codebase OWASP Top 10 audit
- PR review focused on authentication and authorization

**`@security-scan` command** invokes a predefined analysis workflow — the mission statement describes what steps the analyzer follows.

**Transition**: "Here's the Documentation Assistant pattern."
:::

---

## Template: Documentation Assistant

```markdown
# Name: Documentation Assistant

# Focus: Technical documentation, clarity

# Temperature: 0.4

# Style: Clear, helpful, detail-oriented

You help create comprehensive documentation...

## Capabilities

- Generate API docs from code
- Create README files
- Produce architecture diagrams (Mermaid)

## Interactive Commands

- **`@doc-api`** — API documentation
- **`@doc-readme`** — README creation
```

::: notes
The Documentation Assistant automates the most time-consuming part of software development.

**Timing**: 2 minutes

**Design Choices**:
- Temperature 0.4 — slightly creative for readable prose, but consistent in structure
- "Clear, helpful, detail-oriented" — documentation should be understandable to the target audience
- Mermaid diagrams — inline diagram syntax that renders on GitHub

**Usage Scenarios**:
- Sprint cleanup — document all endpoints added this sprint
- Onboarding — create a README for a new developer joining the team
- Architecture documentation — generate C4 diagrams from code structure

**`@doc-api` command** triggers a full API documentation workflow — discovers all endpoints, generates descriptions, adds request/response schemas.

**Transition**: "Here's the third template — Codebase Explorer."
:::

---

## Template: Codebase Explorer

```markdown
# Name: Codebase Explorer

# Focus: Rapid codebase understanding

# Temperature: 0.5

# Style: Systematic, educational, context-aware

You help understand unfamiliar codebases...

## Analysis Methodology

### Phase 1: Discovery

1. **Structure Mapping**: Analyze project organization
2. **Tech Stack**: Identify frameworks and libraries

## Interactive Commands

- **`@overview`** — Project summary
- **`@architecture`** — Design analysis
```

::: notes
The Codebase Explorer is ideal for onboarding new team members or exploring unfamiliar repositories.

**Timing**: 2 minutes

**Design Choices**:
- Temperature 0.5 — balanced; needs some creativity to explain complex concepts clearly
- "Systematic, educational" — the explorer should build understanding progressively
- Multi-phase methodology — it has a structured approach to exploration

**Usage Scenarios**:
- New team member's first week — `@overview` to understand the codebase
- Code review orientation — understand a PR's context before reviewing
- Legacy system analysis — map what an old system does before migrating it

**`@architecture` command** triggers Phase 2 analysis: design patterns, architectural decisions, entry points, and data flows.

**Transition**: "Let's look at the validation checklist and anti-patterns."
:::

---

## Validation Checklist & Anti-Patterns

**Checklist**:
- [ ] kebab-case filename with `.chatmode.md`
- [ ] Located in `.github/chatmodes/`
- [ ] All four header fields present (Name, Focus, Temperature, Style)
- [ ] Mission statement clear with scope and boundaries
- [ ] Core expertise listed (5-10 items)
- [ ] Commands use `@kebab-case` format
- [ ] Temperature matches the domain's consistency requirements

**Anti-Patterns**:
- ❌ Overly broad focus ("help with everything")
- ❌ Wrong temperature for the domain
- ❌ Missing examples or interaction patterns
- ❌ Vague mission statement with no boundaries
- ❌ Commands that don't follow `@verb-noun` convention

::: notes
The checklist and anti-patterns together give you a complete quality gate for chat modes.

**Timing**: 3 minutes

**Most Common Anti-Pattern**: Overly broad focus. "Help with all coding tasks" is not a chat mode — it's just the default Copilot. A chat mode must have a specific domain.

**Temperature Mismatch Anti-Pattern**:
- Security analyzer at 0.8 → inconsistent vulnerability findings → team loses trust in the tool
- Documentation assistant at 0.1 → robotic, identical-sounding docs → nobody reads them

**Scope Boundary Anti-Pattern**: "You are a security specialist" without specifying what it won't do leads to the analyzer trying to fix code instead of just finding problems. Always state what the mode will NOT do.

**Q&A**: Open the floor for questions about chat mode creation, configuration, and team adoption strategies.
:::

---

## Key Takeaways — Custom Chat Modes

- **Chat modes = behavioral personas** — define how Copilot thinks
- **Temperature** is the most critical config — match to domain consistency needs
- **Four header fields** are mandatory: Name, Focus, Temperature, Style
- **Scope boundaries** prevent drift — define what the mode does AND doesn't do
- **Interactive commands** create repeatable workflows

### Getting Started
1. Identify your team's most repeated Copilot interactions
2. Create a specialized chat mode for the top one
3. Test with 5 real scenarios before sharing with the team
4. Iterate based on team feedback

::: notes
Wrap up with the essential points and clear next steps for chat mode adoption.

**Timing**: 2 minutes

**Summary**:
- Chat modes define AI persona and expertise — fundamentally different from promptfiles
- Temperature drives consistency vs. creativity — security needs low temperature
- The four header fields are non-negotiable — they define the mode's identity
- Start narrow and specialized — broad modes provide little value over default Copilot
- Iterate based on real usage — the first version is never the best version

**Team Adoption Strategy**:
1. Create one mode for a specific pain point
2. Use it yourself for two weeks
3. Share with two colleagues for feedback
4. Refine and document usage examples
5. Roll out to the team with training

**Call to Action**: Before the end of the week, create a security analyzer chat mode for your team's repository. Start with the template on the previous slide and customize the Core Expertise section for your tech stack.

**Final Q&A**: Open the floor for questions about the entire Monday session.
:::

---

**Thank you — Class 311 Monday Session Complete**

*Review the instruction files in `.github/instructions/` for detailed reference material.*

::: notes
**Timing**: 5-10 minutes for Q&A

**Closing**:
Thank the audience for their time and engagement. Remind them that all five instruction files referenced today are available in `.github/instructions/` for deeper reading.

**Monday Session Recap**:
1. **AI-Assisted Output** — Every AI artifact needs provenance metadata and audit logs
2. **Vertical Slice Architecture** — Organize by feature, not layer; handlers contain business logic
3. **Creating Prompt Files** — Task-oriented, short, structured; in `.github/prompts/` flat directory
4. **Dependency Management Policy** — Risk-based classification, SLAs for vulnerabilities, supply chain vigilance
5. **Creating Custom Chat Modes** — Behavioral personas with temperature, scope, and interactive commands

**Next Session (Tuesday)**:
Tomorrow's session covers: AI-Assisted Output (review), CQRS Architecture, GitHub CLI, Business Rules to Vertical Slices, and Creating Custom GitHub Copilot Agents.

**Call to Action**: Each participant should leave today with one concrete action item from each module:
- Module 1: Add AI provenance to the next AI artifact you create
- Module 2: Convert one layered feature to a vertical slice
- Module 3: Create one promptfile for a repeated task
- Module 4: Enable Dependabot alerts on your repository
- Module 5: Create a security analyzer chat mode for your team
:::
