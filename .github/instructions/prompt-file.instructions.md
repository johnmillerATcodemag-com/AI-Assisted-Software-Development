---
ai_generated: true
model: "anthropic/claude-3.5-sonnet@2024-10-22"
operator: "johnmillerATcodemag-com"
chat_id: "optimize-instructions-20251023"
prompt: |
  Create AI-optimized version of prompt-file.instructions.md with minimal tokens
started: "2025-10-23T04:39:00Z"
ended: "2025-10-23T04:39:00Z"
task_durations:
  - task: "optimization"
    duration: "00:01:00"
total_duration: "00:01:00"
ai_log: "ai-logs/2025/10/23/optimize-instructions-20251023/conversation.md"
source: "optimization-task"
applyTo: "**/*.prompt.md"
---

# AI Instructions: GitHub Copilot Promptfile Creation

Create task-oriented promptfiles for GitHub Copilot's promptfile system.

**Purpose**: Promptfiles define reusable tasks that can be invoked via `@promptfile-name` in Copilot.
**Not for**: Behavioral instructions (use agents), repo-wide rules (use `.github/instructions/`), one-off chats.

## Promptfile Structure

A promptfile has two parts:

1. **YAML front-matter** - Defines metadata, arguments, and AI provenance
2. **Markdown body** - Defines the task instructions

See **[Template Examples](#template-examples)** below for complete working examples.

## Field Requirements

### Core Promptfile Fields (Required by Copilot)

#### description (Required)

- Short, clear description of the task
- Shown in Copilot promptfile picker
- 1-2 sentences max
- Example: `"Generate unit tests for a given file"`

#### name (Optional)

- Used for Copilot discovery and invocation
- If provided, should match filename (minus `.md` or `.prompt.md` extension)
- Use kebab-case
- Example: `generate-tests.md` → `name: generate-tests`
- **Note**: Copilot can function without this field, but including it improves discoverability

### Arguments (Optional - for Copilot)

Define parameters for reusability:

```yaml
arguments:
  file:
    type: string
    description: Path to the file to test
  severity:
    type: enum
    values: ["low", "medium", "high"]
    description: Risk level for the analysis
```

**Supported types:**

- `string`
- `number`
- `boolean`
- `enum` (with `values` array)
- `object` (rare)

**Use arguments when:**

- Task depends on user input
- Want to avoid rewriting promptfiles
- Want to enforce consistent structure

**Reference arguments in body:** `{{file}}`, `{{severity}}`

### tags (Optional - for Copilot)

- Array of strings
- Example: `["testing", "automation", "security"]`
- Helps with discoverability

### AI Provenance Metadata (Required by Repository Policy)

All AI-generated promptfiles must include complete provenance:

- **ai_generated**: Always `true` for AI-created files
- **model**: Use `"<provider>/<model-name>@<version>"` format
  - Example: `"anthropic/claude-3.5-sonnet@2024-10-22"`
  - Prohibited: `"Auto (copilot)"` (loses provenance)
- **operator**: GitHub username (e.g., `"johnmillerATcodemag-com"`)
- **chat_id**: Unique identifier for the conversation
- **prompt**: Exact prompt text that initiated creation (multiline string)
- **started**: ISO8601 timestamp when work began
- **ended**: ISO8601 timestamp when work completed
- **task_durations**: Array of task breakdowns with durations
- **total_duration**: Sum of all task durations (HH:MM:SS format)
- **ai_log**: Path to conversation log
- **source**: What created this file (username or prompt file path)

### User-Defined Fields (Optional - Copilot Ignores)

Copilot ignores unknown fields, safe to add for governance:

- **owner** - Team or person responsible
- **version** - Version number
- **team** - Owning team name
- **jiraProject** - Associated project
- **riskLevel** - Risk classification
- **reviewedBy** - Reviewer name
- **documentationUrl** - Link to docs
- **created** - Creation date
- **updated** - Last update date

Example:

```yaml
owner: "Security Team"
version: "2.1"
riskLevel: "high"
reviewedBy: "security-lead"
created: "2026-01-15"
updated: "2026-02-12"
```

## Template Examples

### Complete Example (All Fields)

Here is a fully-formed promptfile with all core and optional fields included:

```yaml
---
# Core Promptfile Fields
# - description: Required by Copilot
# - name: Optional (improves discoverability via @name syntax)
name: generate-tests
description: Generate unit tests for a given file

# Arguments (Optional - for Copilot)
arguments:
  file:
    type: string
    description: Path to the file to test
  coverage:
    type: number
    description: Target coverage percentage
    default: 80

# Tags (Optional - for Copilot)
tags: ["testing", "automation"]

# AI Provenance Metadata (Required by Repository Policy - Copilot ignores these)
ai_generated: true
model: "anthropic/claude-3.5-sonnet@2024-10-22"
operator: "johnmillerATcodemag-com"
chat_id: "unique-chat-identifier"
prompt: |
  Create promptfile for generating unit tests
started: "2026-02-12T03:30:00Z"
ended: "2026-02-12T03:35:00Z"
task_durations:
  - task: "promptfile creation"
    duration: "00:05:00"
total_duration: "00:05:00"
ai_log: "ai-logs/2026/02/12/unique-chat-identifier/conversation.md"
source: "johnmillerATcodemag-com"
owner: "QA Team"
version: "1.2"
reviewedBy: "tech-lead"
documentationUrl: "https://wiki.example.com/testing"
---

# Generate Tests

Write comprehensive unit tests for the file at {{file}}.
Target {{coverage}}% code coverage.

Follow these rules:
- Cover all branches
- Use descriptive test names
- Avoid mocking unless necessary
```

### Minimal Promptfile

```yaml
---
name: summarize-file
description: Summarize the contents of the selected file

# AI Provenance (if AI-generated)
ai_generated: true
model: "anthropic/claude-3.5-sonnet@2024-10-22"
operator: "username"
chat_id: "chat-20260212"
prompt: "Create promptfile to summarize files"
started: "2026-02-12T03:30:00Z"
ended: "2026-02-12T03:32:00Z"
task_durations:
  - task: "creation"
    duration: "00:02:00"
total_duration: "00:02:00"
ai_log: "ai-logs/2026/02/12/chat-20260212/conversation.md"
source: "username"
---
# Summarize File

Summarize the contents of the selected file in 3–5 bullet points.
```

### With Arguments

```yaml
---
name: generate-tests
description: Generate unit tests for a given file

arguments:
  file:
    type: string
    description: Path to the file to test
  framework:
    type: enum
    values: ["jest", "mocha", "pytest", "junit"]
    description: Testing framework to use

tags: ["testing", "automation"]

# AI Provenance
ai_generated: true
model: "anthropic/claude-3.5-sonnet@2024-10-22"
operator: "username"
chat_id: "chat-20260212"
prompt: "Create test generation promptfile"
started: "2026-02-12T03:30:00Z"
ended: "2026-02-12T03:35:00Z"
task_durations:
  - task: "creation"
    duration: "00:05:00"
total_duration: "00:05:00"
ai_log: "ai-logs/2026/02/12/chat-20260212/conversation.md"
source: "username"
---

# Generate Tests

Write comprehensive unit tests for {{file}} using {{framework}}.

Follow these rules:
- Cover all branches
- Use descriptive test names
- Avoid mocking unless necessary
```

### Architecture Analysis

```yaml
---
name: summarize-service-boundaries
description: Summarize the service boundaries in a codebase

arguments:
  root:
    type: string
    description: Path to the root folder to analyze

tags: ["architecture", "analysis"]
owner: "architecture-guild"
version: "1.3"

# AI Provenance
ai_generated: true
model: "anthropic/claude-3.5-sonnet@2024-10-22"
operator: "username"
chat_id: "chat-20260212"
prompt: "Create service boundary analysis promptfile"
started: "2026-02-12T03:30:00Z"
ended: "2026-02-12T03:40:00Z"
task_durations:
  - task: "creation"
    duration: "00:10:00"
total_duration: "00:10:00"
ai_log: "ai-logs/2026/02/12/chat-20260212/conversation.md"
source: "username"
---

# Summarize Service Boundaries

Analyze the folder at {{root}} and produce a structured summary.

Your output must include:

## Services
List each service and its purpose.

## Dependencies
List internal and external dependencies for each service.

## Coupling Risks
Identify areas where coupling may cause maintenance issues.

## Recommendations
Provide actionable improvements.
```

## Promptfile Body (Markdown Content)

### Writing Guidelines

**Task-Oriented**
Tell Copilot what to do, not how to behave:

- ✅ "Generate unit tests for {{file}}"
- ❌ "Act like a senior QA engineer and think carefully about testing"

**Deterministic**
Avoid ambiguity, use explicit steps:

- ✅ "1. Analyze all public methods\n2. Generate test for each\n3. Include edge cases"
- ❌ "Write some tests"

**Structured**
Use headings, lists, sections:

```markdown
# Generate Tests

Your output must include:

## Test File

Create test file with proper naming convention.

## Test Cases

- Happy path scenarios
- Error handling
- Edge cases

## Assertions

Use specific assertion methods appropriate to the framework.
```

**Short**
Aim for 10-30 lines, not 200:

- ✅ Concise task definition
- ❌ Multi-page documentation

**Context-Aware**
Use arguments to avoid hard-coding:

- ✅ `{{file}}`, `{{severity}}`, `{{framework}}`
- ❌ `src/main.js`, hardcoded values

**Non-Behavioral**
Do not define personas or tone:

- ✅ "Generate tests with descriptive names"
- ❌ "You are a friendly testing expert who loves clean code"

## Location Requirements

### Directory

**MUST** be in:

```
.github/copilot/promptfiles/
```

**NOT**:

- `.github/prompts/` ❌
- `.github/copilot/promptfiles/subfolder/` ❌
- Anywhere else ❌

Copilot only scans the exact directory above.

### File Format

**MUST** be:

- Markdown (`.prompt.md` extension)
- UTF-8 encoded
- Flat structure (no nesting in subfolders)

**NOT**:

- YAML or JSON files ❌
- `.MD` or uppercase extensions ❌

### File Naming

- Use kebab-case
- Descriptive, no abbreviations
- If `name:` field is used, filename should match its value (minus `.md` or `.prompt.md`)

**Examples:**

```
generate-tests.md → name: generate-tests ✅ (name field matches filename)
generate-tests.md (no name field) ✅ (name field is optional)
genTests.md → name: generate-tests ❌ (filename doesn't match name field)
generate_tests.md → name: generate-tests ❌ (use kebab-case)
```

## Validation Checklist

### Structure

- [ ] File is Markdown (`.md`)
- [ ] File is in `.github/copilot/promptfiles/`
- [ ] Front-matter is valid YAML
- [ ] No nested folders
- [ ] If `name:` field is used, filename matches it (minus extension)

### Required Fields

- [ ] `description` field present (required)
- [ ] `name` field present (optional, but recommended for discoverability)

### AI Provenance (if AI-generated)

- [ ] `ai_generated: true` present
- [ ] `model` uses format `"provider/model@version"`
- [ ] `operator` is GitHub username
- [ ] `chat_id` is unique identifier
- [ ] `prompt` contains exact prompt text
- [ ] `started` and `ended` are ISO8601 timestamps
- [ ] `task_durations` array present with at least one entry
- [ ] `total_duration` in HH:MM:SS format
- [ ] `ai_log` path exists
- [ ] `source` identifies creator

### Arguments (if used)

- [ ] All arguments have `type`
- [ ] All arguments have `description`
- [ ] No unused arguments in body
- [ ] Arguments referenced correctly: `{{argumentName}}`

### Instructions (Body Content)

- [ ] Task-oriented (not behavioral)
- [ ] Deterministic (explicit steps)
- [ ] Structured (headings, lists)
- [ ] Short (10-30 lines ideal)
- [ ] No persona content ("Act like...", "You are...")

### Metadata (Optional Fields)

- [ ] User-defined fields don't conflict with core schema
- [ ] Values are appropriate types

### Testing

- [ ] File appears in Copilot promptfile picker
- [ ] Can be invoked by name
- [ ] Arguments are prompted correctly
- [ ] Output is consistent across runs

## Anti-Patterns (Avoid These)

### ❌ Behavioral Instructions

```yaml
---
name: review-code
description: Review code for quality
---
# Code Review

Act like a senior engineer with 20 years of experience.
Use a friendly, encouraging tone.
```

**Why wrong:** Promptfiles are tasks, not personas. Use agents for behavior.

### ❌ Repo-Wide Rules

```yaml
---
name: write-code
---
Always follow our security guidelines.
Never use deprecated APIs.
Always write tests.
```

**Why wrong:** Use `.github/instructions/` for repo-wide rules.

### ❌ Overly Long Instructions

```yaml
---
name: generate-tests
---
[200 lines of detailed test methodology]
```

**Why wrong:** Copilot truncates long promptfiles. Keep to 10-30 lines.

### ❌ Embedding Code in Arguments

````yaml
arguments:
  example:
    type: string
    description: |
      ```python
      def example():
          pass
      ```
````

**Why wrong:** Arguments must be plain YAML values.

### ❌ Using Promptfiles as Agents

```yaml
---
name: be-helpful-assistant
description: Be a helpful coding assistant
---
You are a helpful assistant who helps with coding.
```

**Why wrong:** This is an agent persona, not a task. Use `.github/copilot/chat_modes/` for agents.

### ❌ Wrong File Location

```
.github/prompts/generate-tests.md ❌
.github/copilot/agents/generate-tests.md ❌
.github/copilot/promptfiles/tools/generate-tests.md ❌ (lowercase p)
```

**Correct:**

```
.github/copilot/promptfiles/generate-tests.md ✅
```

## File Naming Rules

**Pattern:** `{action}-{target}.md`

**Requirements:**

- Use kebab-case
- Use `.md` or `.prompt.md` extension
- Be descriptive and specific
- No abbreviations
- If `name:` field is present, filename should match it exactly (minus extension)

**Examples:**

- ✅ `generate-tests.md` (name: generate-tests)
- ✅ `generate-tests.prompt.md` (name: generate-tests)
- ✅ `summarize-file.md` (name: summarize-file)
- ✅ `analyze-security-risks.md` (name: analyze-security-risks)
- ❌ `generateTests.md` (not kebab-case)
- ❌ `test.md` (too vague)

## Directory Structure

**Correct structure:**

```
.github/
└── copilot/
    └── Promptfiles/
        ├── generate-tests.md
        ├── summarize-file.md
        ├── analyze-security-risks.md
        └── refactor-code.md
```

**Rules:**

- All promptfiles in flat directory (no subfolders)
- Only `.md` files will be loaded
- Copilot scans this exact path only

## Testing Your Promptfile

After creating a promptfile, verify:

### 1. Discoverability

- Open GitHub Copilot in VS Code
- Type `@` in chat
- Your promptfile name appears in the picker
- If not visible, check file location and name

### 2. Invocation

- Type `@{your-promptfile-name}` in Copilot chat
- Copilot recognizes and loads it
- Instructions are executed

### 3. Arguments

- If you defined arguments, Copilot prompts for values
- Values are interpolated correctly in body (`{{argumentName}}`)
- Can invoke with inline args: `@generate-tests file=src/app.js`

### 4. Consistency

- Run multiple times with same inputs
- Output is predictable and consistent
- No behavioral drift

### 5. Agent Independence

- Works the same regardless of active agent
- Doesn't inherit agent behavior
- Executes as pure task

### Troubleshooting

- **Not visible in picker** → Check location (must be `.github/copilot/promptfiles/`)
- **Name doesn't match** → If `name:` field is used, ensure filename matches it
- **Arguments not prompted** → Check YAML syntax in `arguments:` section
- **Behaves inconsistently** → Remove behavioral instructions, make deterministic

### 6. Post-Creation Requirements

After creating a promptfile, complete these steps:

1. **Create Conversation Log**: `ai-logs/<yyyy>/<mm>/<dd>/<chat-id>/conversation.md`
2. **Create Summary**: Session summary with resumability context
3. **Update README**: Add entry to appropriate README.md section with description and chat log link
4. **Verify Metadata**: Ensure all required AI provenance fields are present
5. **Test Links**: Verify all internal links work correctly

See [Post-Creation Requirements (CANONICAL)](ai-assisted-output.instructions.md#post-creation-requirements-canonical) for complete details.

## Related Documentation

- `.github/copilot/chat_modes/` - For agent/persona definitions (behavioral instructions)
- `.github/instructions/` - For repo-wide rules and policies
- [GitHub Copilot Promptfiles Documentation](https://docs.github.com/copilot/customizing-copilot/promptfiles) - Official docs
- `.github/instructions/ai-assisted-output.instructions.md` - AI provenance requirements
- `.github/instructions/copilot-instructions.md` - Copilot-specific guidance

## When to Use Each System

| Need               | Use                                         |
| ------------------ | ------------------------------------------- |
| Reusable task      | Promptfile (`.github/copilot/promptfiles/`) |
| Behavioral persona | Agent (`.github/copilot/chat_modes/`)       |
| Repo-wide rule     | Instruction (`.github/instructions/`)       |
| One-off task       | Just type it in chat                        |

## Quick Reference

**Minimal working promptfile:**

```yaml
---
description: Does something useful

# AI Provenance (if AI-generated)
ai_generated: true
model: "anthropic/claude-3.5-sonnet@2024-10-22"
operator: "username"
chat_id: "chat-id"
prompt: "Create promptfile for task"
started: "2026-02-12T03:30:00Z"
ended: "2026-02-12T03:32:00Z"
task_durations:
  - task: "creation"
    duration: "00:02:00"
total_duration: "00:02:00"
ai_log: "ai-logs/2026/02/12/chat-id/conversation.md"
source: "username"
---
# My Task

Do the thing.
```

**With arguments and name:**

```yaml
---
name: my-task
description: Does something useful

arguments:
  input:
    type: string
    description: The input value

# AI Provenance (if AI-generated)
ai_generated: true
model: "anthropic/claude-3.5-sonnet@2024-10-22"
operator: "username"
chat_id: "chat-id"
prompt: "Create promptfile with arguments"
started: "2026-02-12T03:30:00Z"
ended: "2026-02-12T03:35:00Z"
task_durations:
  - task: "creation"
    duration: "00:05:00"
total_duration: "00:05:00"
ai_log: "ai-logs/2026/02/12/chat-id/conversation.md"
source: "username"
---
# My Task

Do the thing with {{input}}.
```

**Invocation:**

```
@my-task
@my-task input="hello"
```
