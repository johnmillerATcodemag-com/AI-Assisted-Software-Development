---
ai_generated: true
model: "anthropic/claude-3.5-sonnet@2024-10-22"
operator: "johnmillerATcodemag-com"
chat_id: "submit-create-instruction-files-20260211"
prompt: |
  Create comprehensive Markdown guide for creating new `.instructions.md` files in the repository.
  Include complete structure, YAML front matter requirements, content guidelines, creation process,
  quality standards, common patterns, AI-specific considerations, integration requirements,
  validation checklists, common mistakes, and working examples with full metadata.
started: "2026-02-11T18:30:00Z"
ended: "2026-02-11T18:45:00Z"
task_durations:
  - task: "front matter and overview"
    duration: "00:03:00"
  - task: "content structure and guidelines"
    duration: "00:05:00"
  - task: "examples and checklists"
    duration: "00:04:00"
  - task: "validation and refinement"
    duration: "00:03:00"
total_duration: "00:15:00"
ai_log: "ai-logs/2026/02/11/submit-create-instruction-files-20260211/conversation.md"
source: ".github/copilot/promptfiles/meta/create-instruction-files-instructions.prompt.md"
name: instruction-files
description: Comprehensive guide for creating new instruction files
appliesTo: "**/*.instructions.md"
version: "2.0.0"
author: "johnmillerATcodemag-com"
tags: ["instructions", "documentation", "authoring-guide", "ai-optimization"]
owner: "Development Team"
reviewedDate: "2026-02-11"
nextReview: "2026-05-11"
---

# Creating New Instruction Files

## Overview

Instruction files (`.instructions.md`) define rules, workflows, and best practices that AI assistants and developers should follow when working in specific domains or on specific tasks. These canonical reference documents provide clear, actionable guidance optimized for AI consumption while remaining useful to human readers.

**Target Audience**: AI assistants (primary), developers, documentation maintainers
**Scope**: Complete guide for authoring, structuring, validating, and maintaining `.instructions.md` files
**Related Documentation**:

- [AI-Assisted Output Instructions](ai-assisted-output.instructions.md) - Canonical post-creation requirements
- [GitHub CLI Instructions](github-cli.instructions.md) - Example instruction file
- [Business Rules to Vertical Slices](business-rules-to-slices.instructions.md) - Example instruction file

## Table of Contents

- [When to Create Instruction Files](#when-to-create-instruction-files)
- [File Structure Requirements](#file-structure-requirements)
- [YAML Front Matter Fields](#yaml-front-matter-fields)
- [Content Guidelines](#content-guidelines)
- [Creation Process](#creation-process)
- [Quality Standards](#quality-standards)
- [Common Patterns](#common-patterns)
- [AI-Specific Considerations](#ai-specific-considerations)
- [Security and Compliance](#security-and-compliance)
- [Integration Requirements](#integration-requirements)
- [Validation Checklist](#validation-checklist)
- [Common Mistakes to Avoid](#common-mistakes-to-avoid)
- [Complete Examples](#complete-examples)
- [Maintenance and Updates](#maintenance-and-updates)

## When to Create Instruction Files

**Create instruction files when**:

- You need to define canonical rules for a domain or process
- Multiple developers need consistent guidance (NOT just a README)
- Rules affect code generation, architecture, or security
- You want AI assistants to apply specific policies or patterns
- Documentation must be enforced and validated

**Examples of good instruction files**:

- Code review guidelines
- Architecture patterns (CQRS, vertical slices)
- API documentation standards
- Dependency management policies
- Security requirements and hardening practices
- Domain-specific workflows and processes

**Do NOT create instruction files for**:

- One-off guidance or temporary workflows
- Project-specific README content
- Configuration files or tool settings
- Personal preferences or style guides
- Content better suited to promptfiles or agents

## File Structure Requirements

### Location and Naming

**MUST**: Place files in `.github/instructions/` directory

```
.github/instructions/
├── instruction-files.instructions.md
├── ai-assisted-output.instructions.md
├── business-rules-to-slices.instructions.md
├── cqrs-architecture.instructions.md
├── dependency-management-policy.instructions.md
├── github-cli.instructions.md
└── vertical-slice.instructions.md
```

**File naming pattern**:

- Use kebab-case
- Describe the domain: `{domain}-{aspect}.instructions.md`
- Examples: `dependency-management-policy.instructions.md`, `cqrs-architecture.instructions.md`

**NOT acceptable**:

- ❌ `.github/docs/instructions/`
- ❌ `instructions.md` (no domain identifier)
- ❌ `style_guide.instructions.md` (use snake_case)
- ❌ `MyInstructions.instructions.md` (use lowercase)

### Required Structure

Every instruction file MUST follow this structure:

```markdown
---
[YAML Front Matter - See section below]
---

# [Title]

## Overview

[Purpose, target audience, scope, related documentation]

## Table of Contents

[Full navigation]

## Main Content Sections

[Domain-specific sections]

## Validation Checklist

[Quality verification]

## Summary

[Key requirements recap]

---

**Document Version**: X.Y.Z
**Last Updated**: YYYY-MM-DD
**Maintainer**: [Name/Team]
**Related Instructions**: [Links to related files]
```

## YAML Front Matter Fields

### AI Provenance (Required - All Fields Mandatory)

**CRITICAL**: These 12 fields are REQUIRED for all AI-generated instruction files:

```yaml
ai_generated: true
model: "<provider>/<model-name>@<version>"
operator: "<github-username>"
chat_id: "<unique-identifier>"
prompt: |
  [Exact user prompt that initiated creation]
started: "<ISO8601-timestamp>"
ended: "<ISO8601-timestamp>"
task_durations:
  - task: "[task name]"
    duration: "[HH:MM:SS]"
total_duration: "[HH:MM:SS]"
ai_log: "ai-logs/<yyyy>/<mm>/<dd>/<chat-id>/conversation.md"
source: "<creator-identifier>"
```

**Field Details**:

- **ai_generated**: Always `true` for AI-created files
- **model**: Format `"provider/model@version"` (e.g., `"anthropic/claude-3.5-sonnet@2024-10-22"`)
- **operator**: GitHub username (e.g., `"johnmillerATcodemag-com"`)
- **chat_id**: Unique chat identifier (e.g., `"create-api-docs-20260211"`)
- **prompt**: Exact prompt text that initiated creation (preserve formatting)
- **started/ended**: ISO8601 timestamps (e.g., `"2026-02-11T18:30:00Z"`)
- **task_durations**: Array of task breakdowns with HH:MM:SS durations
- **total_duration**: Sum of all task durations in HH:MM:SS format
- **ai_log**: Path to conversation log (must exist)
- **source**: What/who created file (prompt file path or username)

### Domain and Governance Metadata

**Required**:

```yaml
name: "[kebab-case-name]"
description: "[One-line purpose, shown in tooling]"
appliesTo: "[glob pattern - e.g., '**/*.instructions.md']"
version: "[semantic version]"
author: "[creator name or team]"
tags: ["[tag1]", "[tag2]"]
owner: "[responsible team/person]"
reviewedDate: "[YYYY-MM-DD]"
nextReview: "[YYYY-MM-DD - 3 months from review]"
```

**Example**:

```yaml
name: api-documentation-standards
description: Guidelines for documenting REST APIs
appliesTo: "**/*.md"
version: "1.2.0"
author: "api-team"
tags: ["api", "documentation", "standards"]
owner: "Architecture Team"
reviewedDate: "2026-02-11"
nextReview: "2026-05-11"
```

## Content Guidelines

### Writing Principles

**MUST Use Imperative Language**:

- ✅ "Create instruction files in `.github/instructions/`"
- ❌ "Instruction files should go in `.github/instructions/`"

**MUST Be Specific**:

- ✅ "Validate email format using RFC 5322 standard"
- ❌ "Validate email format properly"

**MUST Include Examples**:

- ✅ "`name: api-documentation-standards` (correct)"
- ❌ "Use descriptive names"

**MUST Avoid Tentative Language**:

- ✅ "All instruction files MUST include front matter"
- ❌ "Please try to include front matter if possible"

### Structure and Organization

**Use Standard Sections**:

```markdown
## [Domain Section]

### Rule Category

**Rule 1: [Specific requirement]**

- **Requirement**: What must be true
- **Validation**: How to check it
- **Examples**: ✅ Good / ❌ Bad
- **Rationale**: Why this matters

### Example

[Complete working example]

### Quality Checklist

- [ ] Specific requirement 1
- [ ] Specific requirement 2
```

### AI Optimization

**Token Efficiency Strategies**:

1. **Use Schema Over Prose**:

   ```yaml
   # NOT: Write a YAML field for the model with provider, name, and version
   # YES:
   model: "<provider>/<model-name>@<version>"
   ```

2. **Use Lists Instead of Paragraphs**:

   ```markdown
   # NOT: "The following are required fields that must be present..."

   # YES:

   **Required Fields**:

   - `name`
   - `description`
   - `version`
   ```

3. **Structured Examples Over Explanations**:

   ```markdown
   # NOT: "Create filenames using kebab-case, such as..."

   # YES:

   | Pattern    | Example                    | Result       |
   | ---------- | -------------------------- | ------------ |
   | ✅ Correct | `api-docs.instructions.md` | Discoverable |
   | ❌ Wrong   | `apiDocs.instructions.md`  | Not found    |
   ```

4. **Keep Under 500 Lines**: If exceeding this, split into multiple files

### Target Audience: AI Agents

Instruction files are **primarily for AI consumption**:

- Use declarative rules (MUST, NEVER, ALWAYS)
- Structure content for efficient parsing
- Minimize prose; maximize actionable content
- Include validation checklists
- Provide complete working examples
- Format: rules → examples → validation

## Creation Process

### Step 1: Plan the Content

Define:

- **Domain**: What aspect does this cover?
- **Scope**: What's included? What's excluded?
- **Audience**: AI agents, developers, both?
- **Related Files**: What existing docs are related?

### Step 2: Use Meta-Prompt

Use `.github/copilot/promptfiles/meta/create-instruction-files-instructions.prompt.md` in GitHub Copilot chat.

### Step 3: Execute in Copilot

Copilot will:

1. Generate the instruction file with complete metadata
2. Create conversation log (if not auto-generated)
3. Output to specified location

### Step 4: Complete Post-Creation Requirements

See [Integration Requirements](#integration-requirements) below.

## Quality Standards

### Content Quality Checklist

- [ ] Clear purpose statement in overview
- [ ] Actionable guidance (specific, testable)
- [ ] Complete coverage (no gaps or ambiguities)
- [ ] Consistent structure throughout
- [ ] Concrete examples (✅ Good / ❌ Bad pairs)
- [ ] Quality criteria defined and measurable
- [ ] Scope clearly defined (what's included/excluded)

### Technical Quality Checklist

- [ ] All 12 AI provenance fields present and correct
- [ ] Correct file location (`.github/instructions/`)
- [ ] Valid YAML front matter
- [ ] Correct file naming (kebab-case)
- [ ] All links functional and relative-pathed
- [ ] References to other files use markdown links
- [ ] No secrets, credentials, or sensitive data

### Process Quality Checklist

- [ ] Conversation log created and linked (`ai_log` field)
- [ ] Summary created with complete context
- [ ] README.md updated with new entry
- [ ] Git commit with semantic message
- [ ] All required post-creation steps completed
- [ ] File reviewed by appropriate team member

## Common Patterns

### Pattern 1: Rules-Based (Most Common)

For defining requirements and validation:

```markdown
## Rules

### Rule 1: [Category]

**Statement**: [What must be true]

- **Type**: [Structural/Operative/Derivation/Action Enabler]
- **Priority**: [Critical/High/Medium/Low]
- **Validation**: [How to verify this rule]
- **Examples**:
  - ✅ Good: [Example]
  - ❌ Bad: [Example]
- **Rationale**: [Why this matters]
```

### Pattern 2: Process-Based

For workflows and procedures:

```markdown
## Process

### Step 1: [Phase Name]

**Objective**: [What to accomplish]

1. **Action**: [First step]
   - Requirement A
   - Requirement B

2. **Action**: [Second step]
   - Acceptance criteria
```

### Pattern 3: Template-Based

For format definitions:

````markdown
## Template

**Required Fields**:

- `field1`: [Type] - [Description]
- `field2`: [Type] - [Description]

```yaml
field1: "value"
field2: "value"
```
````

````

## AI-Specific Considerations

### Critical Safety Rule

**WHEN UNCERTAIN, ASK**:

When an instruction file is ambiguous or conflicts with other guidance:

1. **Do NOT guess** the intended behavior
2. **Do NOT extrapolate** from examples
3. **Ask the user** for clarification
4. **Document the ambiguity** in the instruction file

### Rules Format for AI Consumption

**Optimal Format**:

```yaml
rules:
  rule_1:
    statement: "[Clear, testable requirement]"
    priority: "[Critical|High|Medium|Low]"
    validation: "[How to verify]"
    examples:
      good: "[Example that meets rule]"
      bad: "[Example that violates rule]"
````

### Validation Checklists

Include specific, measurable items:

```markdown
### Validation Checklist

- [ ] All rules have unique IDs (BR-001, BR-002, etc.)
- [ ] All rules have type classification
- [ ] All rules reference examples
- [ ] Examples follow ✅ Good / ❌ Bad format
- [ ] All unclear rules flagged as ⚠️ NEEDS CLARIFICATION
```

### Token Efficiency Techniques

1. **Use Bullet Lists**: More efficient than prose paragraphs
2. **Use Tables**: Dense information presentation
3. **Reference Other Files**: Link to canonical sources instead of duplicating
4. **Use Schema Format**: YAML/JSON over narrative text
5. **Minimize Prose**: Move explanations to comments section
6. **Use Abbreviations**: Within guidance section (define once)

## Security and Compliance

### Non-Negotiable Security Rules

**ALL instruction files involving code generation MUST include security requirements**:

```markdown
## Security and Compliance (NON-NEGOTIABLE)

### Rule: Never Generate Credentials

- **Requirement**: Generated code MUST NEVER include:
  - API keys, tokens, or secrets
  - Database passwords
  - Private encryption keys
  - Hardcoded credentials of any kind
- **Compliance**: Violations block pull requests
- **Audit**: All generated artifacts scanned for secrets

### Rule: Validate User Input

- **Requirement**: All user-provided input MUST be validated
- **Scope**: Commands, file paths, configuration values
- **Method**: Whitelist known-good values; reject unknown
- **Compliance**: Non-compliance fails security gate

### Rule: Log Security Events

- **Requirement**: All security-sensitive operations MUST be logged
- **What**: Successful and failed authentication, authorization changes
- **Where**: Centralized audit log
- **When**: Real-time
```

## Integration Requirements

### Post-Creation Requirements (Canonical)

After creating any instruction file, complete these steps:

1. **Create Conversation Log**: `ai-logs/<yyyy>/<mm>/<dd>/<chat-id>/conversation.md`
2. **Create Summary**: `ai-logs/<yyyy>/<mm>/<dd>/<chat-id>/summary.md`
3. **Update README**: Add brief entry to appropriate README section with link to chat log
4. **Verify Metadata**: Ensure all 12 AI provenance fields present and correct
5. **Test Links**: Verify all internal links function correctly

See [AI-Assisted Output Instructions - Post-Creation Requirements](ai-assisted-output.instructions.md#post-creation-requirements-canonical) for complete procedures.

## Validation Checklist

### Before Publishing

**Process Validation**:

- [ ] Conversation log created and exists
- [ ] Summary created with complete context
- [ ] README updated with new entry
- [ ] Related files linked and verified
- [ ] File committed to main branch

**Content Validation**:

- [ ] Clear purpose and scope
- [ ] All concepts explained with examples
- [ ] Complete coverage of domain
- [ ] Consistent terminology throughout
- [ ] Quality criteria defined and measurable

**Technical Validation**:

- [ ] Correct file location (`.github/instructions/`)
- [ ] Valid YAML front matter (all 12 fields)
- [ ] Correct file naming (kebab-case)
- [ ] All markdown links format correctly
- [ ] No sensitive data included

**Compliance Validation**:

- [ ] All security rules included (if code generation)
- [ ] AI provenance complete and accurate
- [ ] Review date set (next review 3 months out)
- [ ] Owner assigned to responsible team
- [ ] Related documentation linked

## Common Mistakes to Avoid

| Mistake                    | Problem               | Fix                                                       |
| -------------------------- | --------------------- | --------------------------------------------------------- |
| ❌ Vague: "Use good names" | Not enforceable       | ✅ "Use PascalCase for class names (e.g., `UserAccount`)" |
| ❌ Missing examples        | Ambiguous intent      | ✅ Include ✅ Good / ❌ Bad examples                      |
| ❌ Incomplete rules        | Gaps and edge cases   | ✅ Document all variations and exceptions                 |
| ❌ Inconsistent structure  | Confusing navigation  | ✅ Use consistent sections throughout                     |
| ❌ Wrong location          | File not found        | ✅ Use `.github/instructions/`                            |
| ❌ Missing AI metadata     | Violates policy       | ✅ Include all 12 provenance fields                       |
| ❌ No README update        | File not discoverable | ✅ Add entry to README with link                          |

## Complete Examples

### Example 1: Code Review Standards

```yaml
---
ai_generated: true
model: "anthropic/claude-3.5-sonnet@2024-10-22"
operator: "johnmillerATcodemag-com"
chat_id: "code-review-standards-20260211"
prompt: "Create code review standards instruction"
started: "2026-02-11T14:00:00Z"
ended: "2026-02-11T14:30:00Z"
task_durations:
  - task: "standards creation"
    duration: "00:30:00"
total_duration: "00:30:00"
ai_log: "ai-logs/2026/02/11/code-review-standards-20260211/conversation.md"
source: "johnmillerATcodemag-com"
name: code-review-standards
description: Standards and procedures for code review
appliesTo: "**/*.md"
version: "1.0.0"
author: "engineering-team"
tags: ["code-review", "quality"]
owner: "QA Team"
reviewedDate: "2026-02-11"
nextReview: "2026-05-11"
---

# Code Review Standards

All pull requests MUST receive review before merging.

## Review Criteria

**Functional Review**: Code MUST implement all requirements from linked issues
**Security Review**: Code MUST NEVER include credentials or secrets
**Quality Review**: All code changes MUST include corresponding tests

## Security and Compliance (NON-NEGOTIABLE)

- Generated code must NEVER include API keys, tokens, or secrets
- All generated artifacts MUST pass security scanning
```

### Example 2: API Documentation Standards

```yaml
---
ai_generated: true
model: "anthropic/claude-3.5-sonnet@2024-10-22"
operator: "johnmillerATcodemag-com"
chat_id: "api-documentation-standards-20260211"
prompt: "Create API documentation standards"
started: "2026-02-11T15:00:00Z"
ended: "2026-02-11T15:20:00Z"
task_durations:
  - task: "documentation standards"
    duration: "00:20:00"
total_duration: "00:20:00"
ai_log: "ai-logs/2026/02/11/api-documentation-standards-20260211/conversation.md"
source: "johnmillerATcodemag-com"
name: api-documentation-standards
description: Standards for documenting REST API endpoints
appliesTo: "**/*.md"
version: "1.0.0"
author: "api-team"
tags: ["api", "documentation", "rest"]
owner: "API Team"
reviewedDate: "2026-02-11"
nextReview: "2026-05-11"
---

# API Documentation Standards

All REST API endpoints MUST be documented with consistent format.

## Required Fields

Every endpoint MUST include:
- Method and path
- Description
- Parameters
- Responses (success and error codes)
- Authentication requirements
- Examples

## Security and Compliance (NON-NEGOTIABLE)

- NEVER include actual credentials in examples
- ALWAYS document authentication requirements
- ALWAYS document rate limiting
```

## Maintenance and Updates

### When to Update

Update instruction files when:

- Domain knowledge changes significantly
- New rules or patterns emerge
- Existing rules prove ineffective
- Process improvements identified
- Dependencies or related systems change

### Update Process

1. **Create new chat**: Start new conversation (new chat ID)
2. **Update file**: Modify content with complete new metadata
3. **Update version**: Increment semantic version number
4. **Update dates**: Set new `reviewedDate` and `nextReview`
5. **Create log**: Document update in conversation log
6. **Communicate**: Notify relevant teams of changes

### Review Cadence

- **Active files**: Review every 3 months
- **Critical files**: Review every 30 days
- **Stable files**: Review every 6 months

---

**Document Version**: 2.0.0
**Last Updated**: 2026-02-11
**Maintainer**: Development Team
**Next Review**: 2026-05-11
**Related Instructions**:

- [AI-Assisted Output Instructions](ai-assisted-output.instructions.md)
- [Business Rules to Vertical Slices](business-rules-to-slices.instructions.md)
- [GitHub CLI Instructions](github-cli.instructions.md)
