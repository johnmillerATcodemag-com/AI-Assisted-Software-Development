---
ai_generated: true
model: "anthropic/claude-3.5-sonnet@2024-10-22"
operator: "johnmillerATcodemag-com"
chat_id: "optimize-instructions-20251023"
prompt: |
  Create AI-optimized version of chatmode-file.instructions.md with minimal tokens
started: "2025-10-23T04:40:00Z"
ended: "2025-10-23T04:40:00Z"
task_durations:
  - task: "optimization"
    duration: "00:01:00"
total_duration: "00:01:00"
ai_log: "ai-logs/2025/10/23/optimize-instructions-20251023/conversation.md"
source: "optimization-task"
applyTo: "**/*.chatmode.md"
---

# AI Instructions: GitHub Copilot Agent Creation

Create specialized GitHub Copilot agents (chat modes) with domain expertise.

## File Structure

### Naming & Location

- Pattern: `<agent-name>.yaml` (kebab-case)
- Location: `.github/copilot/chat_modes/` (exact casing required)
- Extension: `.yaml` (required)
- Format: YAML

### Required YAML Fields

```yaml
name: "agent-name" # Must match filename (minus .yaml extension)
description: "Short description shown in Copilot UI"
instructions: |
  # All behavioral guidance goes here as multiline string
  # This is where you define the agent's behavior
promptfiles: # Promptfiles this agent can invoke (required)
  - prompt-name-1
  - prompt-name-2
```

### Optional YAML Fields

```yaml
capabilities: [] # Reserved for future Copilot features
metadata: # AI provenance + custom fields (see metadata field specification)
  # AI Provenance Metadata (required if this file is AI-generated)
  ai_generated: true
  model: "anthropic/claude-3.5-sonnet@2024-10-22"
  operator: "username"
  chat_id: "chat-uuid"
  started: "2025-10-23T04:40:00Z"
  ended: "2025-10-23T04:45:00Z"
  ai_log: "ai-logs/2025/10/23/chat-uuid/conversation.md"
  # Custom behavioral metadata
  temperature: 0.3
  style: "thorough, action-oriented"
  owner: "team-name"
  domain: "domain-name"
  lastReviewed: "2026-02-11"
```

### Content Structure (Inside `instructions:` field)

1. Mission Statement (required)
2. Core Expertise (required)
3. Analysis Methodology (optional)
4. Interactive Commands (optional)
5. Response Format (recommended)
6. Communication Principles (recommended)
7. Example Interactions (recommended)

## Required Field Specifications

### name (Required)

- Must match filename (minus `.yaml` extension)
- Lowercase, hyphenated recommended
- Example: `name: "security-analyzer"`

### instructions (Required)

- Multiline YAML block (use `|` or `>` syntax)
- Contains ALL behavioral guidance
- Can include Markdown formatting
- Example:
  ```yaml
  instructions: |
    You are a security analyst...
  ```

### description (Required)

- Short text shown in Copilot UI
- Example: `description: "Code security analysis and vulnerability detection"`

## Optional Field Specifications

### promptfiles (Optional)

- Array of promptfile names this agent can invoke
- Example:
  ```yaml
  promptfiles:
    - generate-tests
    - summarize-file
  ```

### metadata (Field Specification)

**For AI-Assisted Chat Modes**: The `metadata:` field is where ALL metadata goes—both AI provenance metadata (required by [#file:ai-assisted-output.instructions.md](ai-assisted-output.instructions.md)) and custom behavioral metadata.

**AI Provenance Metadata** (required if this chat mode file is AI-generated):

These fields come directly from [#file:ai-assisted-output.instructions.md](ai-assisted-output.instructions.md#standard-metadata-front-matter) and MUST be nested under `metadata:`:

- **ai_generated**: `true` (boolean)
- **model**: `"provider/model-name@version"` (e.g., `"anthropic/claude-3.5-sonnet@2024-10-22"`)
- **operator**: Username or full name of the person/agent
- **chat_id**: Unique identifier for the AI chat/session
- **started**: ISO8601 timestamp of generation start
- **ended**: ISO8601 timestamp of generation completion
- **ai_log**: Relative path to the conversation log (e.g., `"ai-logs/2025/10/23/<chat-id>/conversation.md"`)

**Custom Behavioral Metadata** (extend as needed):

Store additional custom fields here. Common patterns:

- **temperature**: 0.0-1.0 scale for behavioral guidance
  - 0.0-0.3: Deterministic (security, compliance)
  - 0.4-0.5: Balanced (documentation, analysis)
  - 0.6-0.7: Creative (brainstorming, architecture)
  - 0.8-1.0: Highly creative (rarely used)
- **style**: Communication style (e.g., "thorough, action-oriented")
- **owner**: Team or person responsible
- **domain**: Domain classification
- **lastReviewed**: ISO date of last review
- **riskLevel**: Risk classification
- **jiraProject**: Associated project

**Example with both AI provenance and custom metadata**:

```yaml
metadata:
  # AI Provenance (from ai-assisted-output.instructions.md)
  ai_generated: true
  model: "anthropic/claude-3.5-sonnet@2024-10-22"
  operator: "john-doe"
  chat_id: "a1b2c3d4-e5f6-7890-abcd-ef1234567890"
  started: "2025-10-23T04:40:00Z"
  ended: "2025-10-23T04:45:00Z"
  ai_log: "ai-logs/2025/10/23/a1b2c3d4-e5f6-7890-abcd-ef1234567890/conversation.md"
  # Custom Behavioral Metadata
  temperature: 0.3
  style: "thorough, security-focused"
  owner: "security-team"
  domain: "security"
  lastReviewed: "2026-02-11"
```

**Reference**: See [AI-Assisted Output Instructions](ai-assisted-output.instructions.md#standard-metadata-front-matter) for complete provenance requirements.

## Selecting Appropriate Promptfiles

### Selection Criteria

When populating `promptfiles`, choose prompts that align with the agent's mission and domain expertise. Consider:

1. **Domain Alignment**: Promptfiles should support the agent's core expertise areas
2. **Workflow Support**: Include prompts that enable the agent's methodology phases
3. **Common Tasks**: Add prompts for frequently needed operations in this domain
4. **User Experience**: Include prompts that reduce repetitive work for this agent type

### Selection Process

1. **Identify Core Tasks**: List the top 5-10 tasks users perform with this agent
2. **Map to Existing Prompts**: Find promptfiles that support these tasks
3. **Prioritize by Frequency**: Include most-used promptfiles first
4. **Limit Scope**: Keep list focused (5-15 promptfiles) to avoid overwhelming users
5. **Document in Instructions**: Reference promptfiles in agent's `instructions` field

### Example: Security Analyzer Agent

```yaml
name: "security-analyzer"
description: "Code security analysis and vulnerability detection"
instructions: |
  You are an expert security analyst. Your mission is to identify
  security risks and provide actionable remediation.

  ## Your Core Expertise
  - Vulnerability Detection
  - Dependency Security
  - OWASP Top 10

  ## Available Promptfiles
  Use these specialized prompts for thorough analysis:
  - `@security-scan` - Comprehensive security assessment
  - `@owasp-check` - OWASP Top 10 focused analysis
  - `@dependency-audit` - Check dependencies for vulnerabilities
  - `@threat-model` - Generate threat models
promptfiles:
  - security-scan
  - owasp-check
  - dependency-audit
  - threat-model
metadata:
  domain: "security"
  owner: "security-team"
```

### Best Practices

**DO**:

- ✅ Match promptfiles to agent's stated expertise
- ✅ Reference promptfiles in `instructions` field with usage guidance
- ✅ Keep list focused (5-15 items)
- ✅ Order by usage frequency (most common first)
- ✅ Use consistent naming conventions
- ✅ Document what each promptfile does in comments

**DON'T**:

- ❌ Include unrelated promptfiles
- ❌ Add every available promptfile
- ❌ List promptfiles without documenting them in `instructions`
- ❌ Use promptfiles that conflict with agent's mission
- ❌ Include deprecated or experimental promptfiles

### Validation Questions

Before finalizing your `promptfiles` list, ask:

1. Does each promptfile support a core expertise area?
2. Would a user of this agent expect these capabilities?
3. Are the promptfiles documented in the `instructions` field?
4. Is the list manageable (not overwhelming)?
5. Are the most common tasks covered?

### Creating Missing Promptfiles

**IMPORTANT**: When you identify a needed promptfile that doesn't exist in `.github/copilot/promptfiles/`, you must create it before referencing it in the chat mode.

#### Verification Process

1. **Check Existence**: Search for the promptfile in `.github/copilot/promptfiles/`

   ```bash
   # Check if prompt exists
   ls .github/copilot/promptfiles/*<prompt-name>.prompt.md
   ```

2. **Create if Missing**: If the promptfile doesn't exist, create it following the guidance in `#file:prompt-file.instructions.md`

3. **Update Chat Mode**: Only reference existing or newly-created promptfiles in your chat mode's `promptfiles` list

#### Creation Workflow

```yaml
# Step 1: Identify needed promptfiles
needed_prompts:
  - security-scan          # ✅ Exists
  - owasp-check            # ✅ Exists
  - custom-threat-model    # ❌ Missing - needs creation

# Step 2: Create missing promptfiles
New file: .github/copilot/promptfiles/custom-threat-model.prompt.md
Following: #file:prompt-file.instructions.md

# Step 3: Verify promptfile works
Test the promptfile independently before adding to chat mode

# Step 4: Add to chat mode
promptfiles:
  - security-scan
  - owasp-check
  - custom-threat-model    # ✅ Now exists
```

#### Integration Checklist

Before adding promptfiles to your chat mode:

- [ ] Verify each promptfile exists in `.github/copilot/promptfiles/`
- [ ] Test each promptfile independently to confirm functionality
- [ ] Ensure promptfile descriptions match chat mode's domain
- [ ] Document promptfile purpose in chat mode's `instructions` field
- [ ] Follow naming conventions (kebab-case, descriptive)
- [ ] Add proper metadata to new promptfiles
- [ ] Link promptfiles to chat mode's core expertise areas

#### Example: Complete Workflow

```yaml
# Chat mode identifies needed capabilities
agent_needs:
  - security_scanning
  - vulnerability_detection
  - compliance_checking

# Map to promptfiles
existing:
  - security-scan (exists)
  - dependency-audit (exists)

missing:
  - compliance-check (needs creation)

# Create missing promptfile
# File: .github/copilot/promptfiles/compliance-check.prompt.md
# Content: Follow prompt-file.instructions.md

# Final chat mode with all promptfiles available
name: "security-analyzer"
promptfiles:
  - security-scan # Existing
  - dependency-audit # Existing
  - compliance-check # Newly created
```

#### Common Mistakes to Avoid

❌ **DON'T**:

- Reference non-existent promptfiles in chat mode
- Create promptfiles without proper metadata
- Skip testing promptfiles before integration
- Use inconsistent naming between file and ID
- Create duplicate promptfiles with different names

✅ **DO**:

- Verify promptfile existence before referencing
- Follow prompt-file.instructions.md for creation
- Test promptfiles independently
- Use consistent, descriptive naming
- Document promptfile purpose in chat mode instructions

#### Promptfile Creation

If you need to create a new promptfile, follow the guidance in `#file:prompt-file.instructions.md` for proper structure and location requirements.

## Content Structure (Inside `instructions:` field)

### Mission Statement

1-2 sentences defining role and value (place at start of `instructions:`):

```yaml
instructions: |
  You are [role] specializing in [domain]. Your mission is to [value]
  through [approach].
```

### Core Expertise

5-10 specific areas (inside `instructions:`):

```yaml
instructions: |
  ## Your Core Expertise

  - **[Area]**: Description
  - **[Area]**: Description
```

### Methodology (Optional)

Multi-phase workflow (inside `instructions:`):

```yaml
instructions: |
  ## Analysis Methodology

  ### Phase 1: [Name]

  1. **[Step]**: Description
  2. **[Step]**: Description
```

### Available Commands (Optional)

Document commands users can invoke when using this agent. Commands fall into two categories:

#### 1. Promptfile Invocations

Commands that call external `.prompt.md` files (must be listed in `promptfiles:` array):

```yaml
instructions: |
  ## Available Promptfiles
  Use these specialized prompts:
  - `@security-scan` - Runs comprehensive security assessment
  - `@owasp-check` - Runs OWASP Top 10 focused analysis

promptfiles:
  - security-scan # .github/copilot/promptfiles/security-scan.prompt.md
  - owasp-check # .github/copilot/promptfiles/owasp-check.prompt.md
```

**How it works**: When user types `@security-scan`, Copilot executes the external promptfile.

#### 2. Behavioral Shortcuts

Commands defined purely as behavioral guidance (no external file, no `promptfiles:` entry):

```yaml
instructions: |
  ## Quick Commands
  - **`@quick-scan`** - Provide rapid security overview of current file
  - **`@explain-vuln`** - Explain detected vulnerability in detail
  - **`@fix-hint`** - Suggest fix for identified issue

# Note: No promptfiles array needed for pure behavioral commands
```

**How it works**: When user types `@quick-scan`, agent responds based on behavioral instructions (no external file called).

**Best Practice**: Use promptfiles for complex, reusable workflows. Use behavioral shortcuts for simple, agent-specific responses.

### Response Format

Output structure (inside `instructions:`):

```yaml
instructions: |
  ## Response Format

  1. **[Icon] Section** (guidance)
  2. **[Icon] Section** (guidance)
```

### Communication Principles

Behavioral guidelines (inside `instructions:`):

```yaml
instructions: |
  ## Communication Guidelines

  - **Be [Attribute]**: Description
  - **Be [Attribute]**: Description
```

### Example Interactions

Usage demonstrations (inside `instructions:`):

```yaml
instructions: |
  ## Example Interactions

  **User**: "[request]"
  **Response**: [action/response]
```

## Templates

### Security Analysis Agent

```yaml
name: "security-analyzer"
description: "Code security analysis and vulnerability detection"
instructions: |
  # Behavioral Definition

  You are an expert security analyst specializing in code security
  and vulnerability detection. Your mission is to identify security
  risks and provide actionable remediation through systematic analysis.

  ## Reasoning Style
  - Temperature: 0.3 (deterministic, precise)
  - Style: Thorough, security-focused, action-oriented

  ## Your Core Expertise

  - **Vulnerability Detection**: OWASP Top 10, CWE classifications
  - **Static Analysis**: Security anti-patterns and code scanning

  ## Available Promptfiles
  Use these specialized prompts for deep analysis:
  - `@security-scan` - Runs comprehensive security assessment
  - `@owasp-check` - Runs OWASP Top 10 analysis
  - `@dependency-audit` - Checks dependency vulnerabilities
  - `@threat-model` - Generates threat model

  ## Quick Commands
  Behavioral shortcuts for rapid responses:
  - `@quick-scan` - Rapid security overview of current file
  - `@explain-risk` - Explain security risk in plain language

  ## Response Format

  Present findings with severity levels and remediation steps.
promptfiles:
  - security-scan
  - owasp-check
  - dependency-audit
  - threat-model
metadata:
  # AI Provenance Metadata (from ai-assisted-output.instructions.md)
  ai_generated: true
  model: "anthropic/claude-3.5-sonnet@2024-10-22"
  operator: "security-team-lead"
  chat_id: "security-analyzer-design-20260211"
  started: "2026-02-11T14:30:00Z"
  ended: "2026-02-11T14:45:00Z"
  ai_log: "ai-logs/2026/02/11/security-analyzer-design-20260211/conversation.md"
  # Custom Behavioral Metadata
  temperature: 0.3
  style: "thorough, security-focused, action-oriented"
  domain: "security"
  owner: "security-team"
```

## Validation Checklist

- [ ] kebab-case filename with `.yaml` extension
- [ ] Located in `.github/copilot/chat_modes/` (exact casing)
- [ ] YAML or JSON format (NOT Markdown)
- [ ] No YAML metadata at top (only `name:`, `instructions:`, etc.)
- [ ] No top-level arbitrary fields
- [ ] `name` field matches filename (minus extension)
- [ ] `name` field is lowercase, hyphenated
- [ ] `instructions` field contains behavioral definition
- [ ] All behavioral content inside `instructions:` block
- [ ] Mission statement clear (in `instructions:`)
- [ ] Core expertise listed (5-10 items, in `instructions:`)
- [ ] Commands use `@kebab-case` format (in `instructions:`)
- [ ] If AI-generated: All provenance fields from [ai-assisted-output.instructions.md](ai-assisted-output.instructions.md) present in `metadata:` field
- [ ] If AI-generated: `ai_log` field points to valid conversation log file
- [ ] Temperature in `metadata` (if used) appropriate for use case
- [ ] Style in `metadata` (if used) aligns with domain
- [ ] No `.chatmode.md` files (they're UI-only, non-functional)

## Anti-Patterns

❌ Using `.chatmode.md` files (UI-only, non-functional)
❌ Wrong directory (not `.github/copilot/chat_modes/`)
❌ Markdown format instead of YAML
❌ YAML metadata at top of file
❌ Top-level arbitrary fields (use `metadata:` instead)
❌ Behavioral content outside `instructions:` field
❌ `name` doesn't match filename
❌ Overly broad focus
❌ Unclear commands
❌ Missing examples
❌ Vague mission
❌ Inconsistent formatting

## Quality Rules (For `instructions:` content)

**Be Specific**:

- ❌ "Validate input"
- ✅ "Validate email format (RFC 5322) and uniqueness"

**Be Testable**:

- ❌ "System works correctly"
- ✅ "Given valid input, returns 201 with user ID"

**Flag Ambiguities** (in `instructions:`):

```yaml
instructions: |
  ⚠️ **NEEDS CLARIFICATION**
  **Current**: "Password must be secure"
  **Issue**: Definition unclear
  **Suggested**: "8-20 chars, uppercase, lowercase, digit, special"
```

## Command Naming

Pattern: `@verb-noun` or `@domain-action`

- Use kebab-case
- 2-3 words max
- Group with common prefixes
- Examples:
  - `@security-scan`
  - `@doc-api`
  - `@overview`

## Integration

**Activate Agent**: `@<agent-name>` (e.g., `@security-analyzer`)
**Use Promptfiles**: `@security-scan` invokes external `.prompt.md` file (if listed in `promptfiles:`)
**Use Behavioral Commands**: `@quick-scan` triggers behavioral response (defined in `instructions:` only)
**Switch Agents**: Activate different agent with `@<other-agent>`
**Context**: Agent accesses open files and workspace

**Command Resolution**:

- If command name matches entry in `promptfiles:` array → Invokes external promptfile
- If command defined only in `instructions:` → Behavioral response
- If both exist → Promptfile takes precedence

## File Location Summary

```
.github/
└── copilot/
    └── chat_modes/
        ├── security-analyzer.yaml
        ├── documentation-assistant.yaml
        └── codebase-explorer.yaml
```

## Reference

See human guide for comprehensive examples and patterns.
