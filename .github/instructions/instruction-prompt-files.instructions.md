---
ai_generated: true
model: "anthropic/claude-3.5-sonnet@2024-10-22"
operator: "johnmillerATcodemag-com"
chat_id: "optimize-instructions-20251023"
prompt: |
<<<<<<<< HEAD:.github/instructions/instruction-prompt-files.instructions.md
  Create AI-optimized version of instruction-prompt-files.instructions.md with minimal tokens
========
  Create AI-optimized version of create-instruction-prompts.instructions.md with minimal tokens
>>>>>>>> e206ad3781af81d922968edf8fb8c0f073d70e2b:.github/instructions/create-instruction-prompts.instructions.md
started: "2025-10-23T04:38:00Z"
ended: "2025-10-23T04:38:00Z"
task_durations:
  - task: "optimization"
    duration: "00:01:00"
total_duration: "00:01:00"
ai_log: "ai-logs/2025/10/23/optimize-instructions-20251023/conversation.md"
source: "optimization-task"
applyTo: "**/*.instructions.prompt.md"
---

# AI Instructions: Creating Instruction-Generating Prompts

## Purpose

This file provides requirements for creating prompts that generate `*.instructions.md` files. These are **meta-prompts** - prompts whose purpose is to create instruction files for developers and AI assistants.

## Why This Exists

Instruction files (`*.instructions.md`) require strict AI provenance compliance and standardized structure. This file ensures that prompts generating such files automatically include all required metadata and compliance elements, preventing non-compliant instruction files.

## Scope & Application

- **Applies To**: Prompts matching pattern `**/*.instructions.prompt.md`
- **Purpose**: Generate compliant `*.instructions.md` files with full AI provenance
- **Distinction**: This is NOT for general prompt creation (see `prompt-file.instructions.md` for that)

## Target Audience

- Developers creating instruction-generating prompts
- AI assistants tasked with generating instruction files
- Anyone building meta-prompts for documentation generation

## Mandatory Requirements

### 1. Context Section

Must include AI policy reference:

```markdown
## Context

<domain-specific context>

**CRITICAL**: All AI-generated artifacts MUST comply with
`.github/instructions/ai-assisted-output.instructions.md`. Generated
instruction file MUST include full AI provenance metadata.
```

### 2. Deliverable Section

Must include AI provenance template:

`````markdown
## Deliverable

Generate `.github/instructions/<domain>.instructions.md` with:

### Required AI Provenance Metadata (YAML Front Matter)

````yaml
ai_generated: true
model: "<model-name-and-version>"
operator: "<operator-username>"
chat_id: "<chat-identifier>"
prompt: |
  <exact-prompt-text>
started: "<ISO8601-timestamp>"
ended: "<ISO8601-timestamp>"
task_durations:
  - task: "<task-name>"
    duration: "<hh:mm:ss>"
total_duration: "<hh:mm:ss>"
ai_log: "ai-logs/<yyyy>/<mm>/<dd>/<chat-id>/conversation.md"
applyTo: "<pattern>" # Optional
---
\```

### Content Requirements
<specific requirements>
\```

### 3. Required Front Matter

```yaml
prompt_metadata:
  id: create-<domain>-instructions
  output_path: .github/instructions/<domain>.instructions.md
  category: documentation
  output_format: markdown
````
`````

````

## Complete Template

```markdown
---
mode: agent
model: Auto (copilot)
tools: ["create"]
description: Generates <domain> authoring guidelines
prompt_metadata:
  id: create-<domain>-instructions
  title: Generate <Domain> Instructions
  owner: <author-username>
  version: 1.0.0
  output_path: .github/instructions/<domain>.instructions.md
  category: documentation
  output_format: markdown
---

# Generate <Domain> Instructions

## Context

<domain-context>

**CRITICAL**: All AI-generated artifacts MUST comply with
`.github/instructions/ai-assisted-output.instructions.md`.

## Deliverable

[Include provenance template from above]
```

## Validation Checklist

- [ ] Context references AI policy
- [ ] Deliverable includes provenance template with all 10 fields
- [ ] Output path points to `.github/instructions/<name>.instructions.md`
- [ ] Category is 'documentation'
- [ ] Output format is 'markdown'
- [ ] ID follows `create-<domain>-instructions` pattern

## Common Mistakes

❌ Missing AI provenance section → Add complete YAML template
❌ Not referencing AI policy → Add CRITICAL statement
❌ Vague deliverable → Be explicit about metadata fields
❌ Forgetting applyTo field → Include when applicable

## Creation Options

**Option 1**: Use meta-prompt

```
Submit .github/prompts/meta/create-instruction-files-prompt-file.prompt.md
```

**Option 2**: Manual

1. Copy existing instruction prompt
2. Update domain-specific content
3. Ensure Context references AI policy
4. Ensure Deliverable includes provenance template
5. Validate against checklist

## Reference

See `.github/instructions/ai-assisted-output.instructions.md` for complete provenance requirements.
````
