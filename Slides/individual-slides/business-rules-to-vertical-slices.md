---
ai_generated: true
model: "anthropic/claude-sonnet-4.5@2026-03-18"
operator: "johnmillerATcodemag-com"
chat_id: "extract-individual-slides-20260320"
prompt: |
  Extract module 5 (Business Rules to Vertical Slices) from Slides/ai-assisted-dev-overview.md
  into individual slide file Slides/individual-slides/business-rules-to-vertical-slices.md
started: "2026-03-20T03:58:52Z"
ended: "2026-03-20T04:05:00Z"
task_durations:
  - task: "extract module slides"
    duration: "00:06:00"
total_duration: "00:06:00"
ai_log: "ai-logs/2026/03/20/extract-individual-slides-20260320/conversation.md"
source: ".github/prompts/merge-marp-decks.prompt.md"
marp: true
theme: default
paginate: true
---

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

