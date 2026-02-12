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
source: ".github/copilot/Promptfiles/meta/create-instruction-files-instructions.prompt.md"
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

This document provides comprehensive guidance for creating new instruction files in the repository. Instruction files (`.instructions.md`) provide guidance for specific domains, processes, or tools to ensure consistency and quality.

**Target Audience**: Developers, AI assistants, and contributors creating guidance documentation

**Related Documentation**:

- [AI-Assisted Output Instructions](.github/instructions/ai-assisted-output.instructions.md)
- [Copilot Instructions](.github/instructions/copilot-instructions.md)
- [Instruction Prompt Requirements](.github/instructions/instruction-prompt-files.instructions.md)

## Table of Contents

- [When to Create Instruction Files](#when-to-create-instruction-files)
- [File Structure Requirements](#file-structure-requirements)
- [Content Guidelines](#content-guidelines)
- [Creation Process](#creation-process)
- [Quality Standards](#quality-standards)
- [Common Patterns](#common-patterns)
- [AI-Specific Considerations](#ai-specific-considerations)
- [Integration Requirements](#integration-requirements)
- [Validation Checklist](#validation-checklist)
- [Common Mistakes](#common-mistakes)
- [Examples](#examples)

## When to Create Instruction Files

Create instruction files when you need to:

- **Standardize processes**: Define consistent approaches for common tasks
- **Guide AI behavior**: Provide specific instructions for AI assistants
- **Document best practices**: Capture proven approaches for reuse
- **Ensure compliance**: Define requirements for specific domains
- **Reduce ambiguity**: Clarify expectations for complex activities

### Examples of Good Instruction Files

- `code-review.instructions.md` - Guidelines for conducting code reviews
- `api-documentation.instructions.md` - Standards for documenting APIs
- `vertical-slice-architecture.instructions.md` - Implementing architectural patterns
- `ai-assisted-output.instructions.md` - AI provenance requirements

## File Structure Requirements

### 1. Location and Naming

**Standard Location**: `.github/instructions/`
**AI-Optimized Location**: `.github/instructions/ai/` (for token-optimized versions)

**Naming Convention**: `<domain>.instructions.md`

**Examples**:

- `testing.instructions.md`
- `deployment.instructions.md`
- `code-style.instructions.md`
- `security-review.instructions.md`

### 2. Required YAML Front Matter

All instruction files MUST include complete metadata:

```yaml
---
# AI Provenance (required)
ai_generated: true
model: "anthropic/claude-3.5-sonnet@2024-10-22"
operator: "johnmillerATcodemag-com"
chat_id: "unique-chat-identifier"
prompt: |
  Original prompt text that created this file
started: "2025-10-23T10:00:00Z"
ended: "2025-10-23T10:15:00Z"
task_durations:
  - task: "requirements analysis"
    duration: "00:05:00"
total_duration: "00:15:00"
ai_log: "ai-logs/2025/10/23/chat-id/conversation.md"
source: "johnmillerATcodemag-com"

# Copilot Metadata (required for discoverability)
name: "Domain Instructions"
description: "Brief description shown to users"
appliesTo: ["python", "javascript"]  # Language/file type scoping
version: "1.0.0"
author: "team-name"
tags: ["domain", "category", "purpose"]

# Governance (recommended)
owner: "team-name"
reviewedDate: "2025-10-23"
nextReview: "2026-01-23"
---
```

**Required Fields**:

- `ai_generated`, `model`, `operator`, `chat_id`, `prompt`, `started`, `ended`, `task_durations`, `total_duration`, `ai_log`, `source` (AI provenance)
- `name`: Human-readable instruction name
- `description`: One-sentence purpose (shown to users)
- `appliesTo`: Array of languages/file types or `["all"]`
- `version`: Semantic version
- `author`: Creator/team name
- `tags`: 3-7 discovery tags

### 3. Required Content Structure

```markdown
# [Title]

## Overview

Brief description of what this instruction file covers and its purpose.

**Target Audience**: Who should use these instructions
**Scope**: What domains/activities these instructions apply to

**Related Documentation**:

- [Link to related instruction file](path)
- [Link to another related file](path)

## Table of Contents

- [Section 1](#section-1)
- [Section 2](#section-2)
- [Quality Checklist](#quality-checklist)

## [Main Sections]

### Clear, actionable guidance organized by topic

## Quality Checklist

- [ ] Requirement 1 met
- [ ] Requirement 2 met
- [ ] All standards followed

## Examples

Concrete examples demonstrating the instructions.
```

## Content Guidelines

### 1. Writing Principles

**Use Imperative, Declarative Language** (agents respond best to clear directives):

**ALWAYS use**:
- "Always X"
- "Never Y"
- "When generating X, you MUST Y"
- "X is required"
- "MUST NOT Z"

**NEVER use**:
- "Please try to..."
- "It would be great if..."
- "Consider doing..."
- "You might want to..."
- "When you can..."

**Examples**:
- ✅ "Always use semantic commit messages following conventional commits format"
- ❌ "Try to write good commit messages"
- ✅ "Never commit secrets or credentials"
- ❌ "Please avoid committing secrets when possible"

**Provide Examples** (examples are highly influential):

```markdown
feat(auth): add OAuth2 integration

- Add OAuth2 configuration
- Create authentication middleware
- Update user model with external ID
```

**Structure**:
1. Overview, 2. Rules, 3. Examples, 4. Quality checklist

### 2. Content Organization

**Standard Sections**:

1. **Overview** - Purpose, audience, scope
2. **Requirements** - What must be done
3. **Guidelines** - How to do it well
4. **Examples** - Concrete demonstrations
5. **Quality Checklist** - Validation criteria
6. **Common Mistakes** - What to avoid
7. **References** - Related documentation

### 3. Target Audience: AI Agents (Primary)

**Optimize for Token Efficiency**:
- Use imperative commands
- Provide explicit rules
- Use structured formats (YAML, JSON, checklists)
- Minimize explanatory prose
- Remove redundant text
- Use shorthand where clear

**Keep files under 300-500 lines** (exceeding limits may cause truncation)

## Creation Process

### Method 1: Using Meta-Prompt (Recommended)

1. **Submit Meta-Prompt**: Use `.github/prompts/meta/create-instruction-files-prompt-file.prompt.md`
2. **Specify Domain**: Clearly define the instruction domain
3. **Review Generated Prompt**: Ensure it meets requirements
4. **Execute Prompt**: Run the generated prompt to create instructions
5. **Validate Output**: Check against quality criteria

### Method 2: Manual Creation

1. **Plan Content**: Define scope, audience, and key requirements
2. **Create File**: Use naming convention in correct location
3. **Add Metadata**: Include complete AI provenance front matter
4. **Write Content**: Follow content guidelines and structure
5. **Review**: Validate against quality checklist
6. **Update Documentation**: Add to README.md and related files

### Method 3: Copy and Adapt

1. **Find Similar File**: Locate existing instruction file with similar scope
2. **Copy Structure**: Use as template for new file
3. **Update Metadata**: Change all provenance fields appropriately
4. **Adapt Content**: Modify for new domain while keeping structure
5. **Validate**: Ensure all references and examples are correct

## Quality Standards

### Content Quality

- [ ] **Clear Purpose**: Instructions have well-defined scope and objectives
- [ ] **Actionable Guidance**: Specific, implementable requirements and steps
- [ ] **Complete Coverage**: All important aspects of domain are addressed
- [ ] **Consistent Structure**: Follows standard organization patterns
- [ ] **Concrete Examples**: Real examples demonstrate key concepts
- [ ] **Quality Criteria**: Measurable validation requirements provided

### Technical Quality

- [ ] **Complete Metadata**: All 11 required provenance fields present
- [ ] **Correct Format**: YAML front matter, markdown content
- [ ] **Valid Links**: All internal links work correctly
- [ ] **Proper Location**: File in correct directory with right name
- [ ] **Unique Content**: No duplicate or conflicting instructions

### Process Quality

- [ ] **Conversation Log**: AI log file created and linked
- [ ] **Summary Created**: Session summary with resumability context
- [ ] **README Updated**: New file added to appropriate section
- [ ] **Git Integration**: File committed with semantic commit message

## Common Patterns

### Pattern 1: Process Instructions

For step-by-step processes:

```markdown
## Process Overview

1. **Step 1**: [Action]
   - Requirement A
   - Requirement B

2. **Step 2**: [Action]
   - Requirement C
   - Requirement D

## Quality Gates

- [ ] Step 1 completed successfully
- [ ] Step 2 validation passed
```

### Pattern 2: Standard Templates

For creating standardized artifacts:

````markdown
## Template Structure

### Required Sections

```markdown
# [Title]

## [Section 1]

Content requirements...

## [Section 2]

Content requirements...
```
````

````

### Pattern 3: Validation Rules

For quality and compliance checking:

```markdown
## Validation Rules

### Rule 1: [Category]
- **Requirement**: Specific requirement
- **Validation**: How to check
- **Examples**: ✅ Good / ❌ Bad

### Rule 2: [Category]
- **Requirement**: Another requirement
````

## AI-Specific Considerations

### Critical Safety Rule

**When Uncertain, Ask**:
```
When uncertain about any requirement, constraint, or interpretation,
you MUST ask the user for clarification rather than making assumptions.
```

Prevents hallucinations and incorrect code generation.

### Rules Format

```markdown
## Rules

1. **MUST**: Always include error handling
2. **MUST NOT**: Use deprecated APIs
3. **SHOULD**: Include comprehensive tests
```

### Validation Checklists

```markdown
## Pre-Generation Checklist
- [ ] Requirements understood
- [ ] Dependencies identified
- [ ] Architecture validated

## Post-Generation Checklist
- [ ] Code compiles
- [ ] Tests pass
- [ ] Documentation updated
```

### Token Optimization

- Remove explanatory prose
- Use YAML/JSON schemas over verbose examples
- Combine related rules
- Use shorthand notation
- Keep files under 300-500 lines
- Move lengthy examples to promptfiles

## Known Limitations and Constraints

Document constraints that affect instruction effectiveness:

```markdown
## Known Limitations

- This repository uses internal package `@company/auth-lib` (Copilot cannot access)
- Security scanning requires manual `npm run security-check` execution
- Integration tests require local Docker environment setup
```

**Document**:
- **Private Dependencies**: Packages Copilot cannot access
- **Custom Tooling**: Tools requiring manual setup
- **Environment-Specific**: Configuration varying by environment
- **Context Window**: Large files may be truncated
- **External Resources**: Cannot access private documentation

## Security and Compliance (NON-NEGOTIABLE)

All instruction files involving code generation MUST include:

```markdown
## Security Requirements (NON-NEGOTIABLE)

- **NEVER** hardcode secrets, passwords, API keys, or credentials
- **NEVER** generate code bypassing authentication or authorization
- **ALWAYS** use parameterized queries (never string concatenation for SQL)
- **ALWAYS** validate and sanitize user inputs
- **ALWAYS** use secure random number generation for security operations
```

**Placement**: Security rules MUST appear in repo-level guardrails (`.github/instructions/*.md`), NOT in optional promptfiles.

### Integration Requirements

### 1. README Updates

**See**: [Post-Creation Requirements (CANONICAL)](ai-assisted-output.instructions.md#post-creation-requirements-canonical) for complete requirements.

Add new instruction files to appropriate README section:

```markdown
### Guidance & Instructions

- [Domain Instructions](.github/instructions/domain.instructions.md) — Description ([chat log](ai-logs/path))
```

### 2. Related File Updates

Update any related instruction files that should reference the new file.

### 3. Prompt File Creation

Consider creating a corresponding prompt file:

- `.github/prompts/apply-[domain]-instructions.prompt.md`

### Process Validation

Before finalizing any instruction file:

**Complete Post-Creation Requirements**: See [Post-Creation Requirements (CANONICAL)](ai-assisted-output.instructions.md#post-creation-requirements-canonical)

### Content Validation

- [ ] Clear purpose and scope defined
- [ ] Target audience identified
- [ ] Actionable guidance provided
- [ ] Examples demonstrate key concepts
- [ ] Quality criteria specified
- [ ] Common mistakes addressed

### Technical Validation

- [ ] Complete AI provenance metadata (all 11 fields)
- [ ] Correct file location and naming
- [ ] Valid markdown formatting
- [ ] Working internal links
- [ ] Proper YAML front matter

### Compliance Validation

- [ ] Follows repository standards
- [ ] AI provenance requirements met
- [ ] No sensitive information exposed
- [ ] Consistent with existing instructions

## Common Mistakes to Avoid

### Content Mistakes

❌ **Vague Requirements**: "Write good code"
✅ **Specific Requirements**: "Use semantic variable names, maximum 20 characters"

❌ **Missing Examples**: Only abstract guidance
✅ **Concrete Examples**: Show actual implementations

❌ **No Validation**: No way to verify compliance
✅ **Clear Criteria**: Measurable quality gates

### Technical Mistakes

❌ **Incomplete Metadata**: Missing required provenance fields
✅ **Complete Metadata**: All 11 fields with correct values

❌ **Wrong Location**: Files in root or incorrect directory
✅ **Correct Location**: `.github/instructions/` or `.github/instructions/ai/`

❌ **Interface as Model**: `"github/copilot"`
✅ **Actual Model**: `"anthropic/claude-3.5-sonnet@2024-10-22"`

### Process Mistakes

❌ **No Documentation**: File created without updating README
✅ **Complete Documentation**: See [Post-Creation Requirements (CANONICAL)](ai-assisted-output.instructions.md#post-creation-requirements-canonical)

❌ **Reused Chat Logs**: Appending to existing conversation files
✅ **Unique Chat Logs**: New conversation file for each session

## Examples

### Example 1: Code Review Instructions

```markdown
---
ai_generated: true
model: "anthropic/claude-3.5-sonnet@2024-10-22"
# ... complete AI provenance metadata
name: "Code Review Standards"
description: "Enforces thorough, constructive code review practices"
appliesTo: ["all"]
version: "1.0.0"
author: "Engineering Team"
tags: ["code-review", "quality", "standards"]
---

# Code Review Instructions

## Review Criteria

**Functional Requirements**:
- [ ] Implements stated requirements
- [ ] Handles edge cases
- [ ] Manages error conditions

**Code Quality**:
- [ ] Follows coding standards
- [ ] Clear, semantic names
- [ ] Single responsibility functions

**Testing**:
- [ ] Unit tests cover new functionality
- [ ] Integration tests validate interactions
- [ ] Test names clearly describe scenarios

## Review Process

1. Read linked issues/documentation
2. Verify requirements met
3. Apply quality criteria
4. Ensure adequate testing
5. Provide specific feedback
6. Approve or request changes with rationale

## Security Requirements (NON-NEGOTIABLE)

- **NEVER** approve code with hardcoded secrets
- **ALWAYS** verify input validation present
- **ALWAYS** check for SQL injection vulnerabilities
```

### Example 2: API Documentation Instructions

```markdown
---
ai_generated: true
model: "anthropic/claude-3.5-sonnet@2024-10-22"
# ... complete AI provenance metadata
name: "API Documentation Standards"
description: "Enforces consistent REST API documentation"
appliesTo: ["javascript", "typescript", "python"]
version: "1.0.0"
author: "API Team"
tags: ["api", "documentation", "rest", "standards"]
---

# API Documentation Instructions

## Required Fields

**MUST include for each endpoint**:
- Method and path: `GET /api/users/{id}`
- Description: What endpoint does
- Parameters: Path, query, body (with types)
- Responses: Success and error codes with examples
- Authentication: Required permissions/tokens

## Example Format

```markdown
## GET /api/users/{id}

Retrieves specific user by ID.

**Parameters**:
- `id` (path, UUID, required): User identifier

**Responses**:
- `200`: User found
- `404`: User does not exist
- `401`: Authentication required

**Example**:
GET /api/users/123e4567-e89b-12d3-a456-426614174000
Authorization: Bearer {token}

Response: {"id": "123...", "email": "user@example.com"}
```

## Security Requirements (NON-NEGOTIABLE)

- **NEVER** include actual credentials in examples
- **ALWAYS** document authentication requirements
- **ALWAYS** document rate limiting```

## Maintenance and Updates

### When to Update

Update instruction files when:

- Requirements change
- New best practices emerge
- Feedback identifies gaps
- Related tools or processes change
- Compliance requirements evolve

### Update Process

1. **Identify Changes**: What needs to be updated and why
2. **Update Content**: Modify instructions while preserving structure
3. **Update Metadata**: Change `ended` timestamp, add to `task_durations`
4. **Test Instructions**: Validate updated guidance works
5. **Complete Post-Creation**: Follow [Post-Creation Requirements (CANONICAL)](ai-assisted-output.instructions.md#post-creation-requirements-canonical)

### Version Control

- Use semantic commit messages for updates
- Maintain conversation logs for significant changes
- Consider creating new AI-optimized versions when needed

## File Length Management

**Maximum Recommended**: 300-500 lines per instruction file

**When file exceeds limit**:
1. Split by logical domain boundaries
2. Extract examples to separate promptfiles
3. Create specialized files (e.g., `domain-core.instructions.md`, `domain-advanced.instructions.md`)
4. Link to external detailed documentation

## Summary

**Required for all instruction files**:
1. Complete metadata (AI provenance + Copilot discovery fields)
2. Imperative, declarative language ("Always", "Never", "MUST")
3. Security rules (NON-NEGOTIABLE section if applicable)
4. Known limitations documented
5. "When uncertain, ask" clause
6. Token-optimized (under 500 lines)
7. Concrete examples
8. Version control and governance fields

---

**Document Version**: 1.0.0
**Last Updated**: 2025-10-23
**Maintainer**: AI-Assisted Development Team
**Related Instructions**:

- `.github/instructions/ai-assisted-output.instructions.md`
- `.github/instructions/copilot-instructions.md`
- `.github/instructions/instruction-prompt-files.instructions.md`
````
