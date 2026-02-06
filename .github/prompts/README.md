# AI Prompts Collection

This directory contains standardized AI prompts for various development and analysis tasks. All prompts follow the structure defined in [`.github/instructions/prompt-file.instructions.md`](../instructions/prompt-file.instructions.md).

## Categories

### Analysis & Audit Prompts

| File                                                                               | Purpose                                 | Output                                           |
| ---------------------------------------------------------------------------------- | --------------------------------------- | ------------------------------------------------ |
| [`check-context.prompt.md`](check-context.prompt.md)                               | Context Analysis and Conflict Detection | Analysis report of conflicts and inconsistencies |
| [`codebase-review.prompt.md`](codebase-review.prompt.md)                           | Codebase vs Instructions Audit          | Compliance audit report                          |
| [`create-issues-for-dead-code.prompt.md`](create-issues-for-dead-code.prompt.md)   | Dead Code Analysis to GitHub Issues     | Dead code analysis with GitHub issue drafts      |
| [`create-issues-for-found-bugs.prompt.md`](create-issues-for-found-bugs.prompt.md) | Bug Analysis to GitHub Issues           | Bug analysis with GitHub issue drafts            |
| [`refactor-analysis.prompt.md`](refactor-analysis.prompt.md)                       | Code Refactoring Analysis               | Refactoring recommendations and analysis         |
| [`security-audit-issues.prompt.md`](security-audit-issues.prompt.md)               | Security Audit Analysis                 | Security vulnerabilities and GitHub issues       |
| [`tests-gap-analysis.prompt.md`](tests-gap-analysis.prompt.md)                     | Test Coverage Gap Analysis              | Testing recommendations and gap analysis         |

### Documentation & Instruction Generation

| File                                                                                                   | Purpose                         | Output                                   |
| ------------------------------------------------------------------------------------------------------ | ------------------------------- | ---------------------------------------- |
| [`create-ai-assisted-output-instructions.prompt.md`](create-ai-assisted-output-instructions.prompt.md) | AI Output Policy Generator      | AI provenance and logging instructions   |
| [`create-chatmode-instructions-file.prompt.md`](create-chatmode-instructions-file.prompt.md)           | Chat Mode Guidelines Generator  | Chat mode authoring guidelines           |
| [`create-codebase-explorer.prompt.md`](create-codebase-explorer.prompt.md)                             | Codebase Explorer Chat Mode     | GitHub Copilot chat mode definition      |
| [`create-prompt-file-instructions-file.prompt.md`](create-prompt-file-instructions-file.prompt.md)     | Prompt Authoring Guidelines     | Instructions for creating prompts        |
| [`create-use-case-instructions.prompt.md`](create-use-case-instructions.prompt.md)                     | Use Case Instructions Generator | Guidelines for use case documentation    |
| [`derive-use-cases-from-conceptual-model.prompt.md`](derive-use-cases-from-conceptual-model.prompt.md) | Use Case Derivation             | Extract use cases from conceptual models |
| [`generate-instructions.prompt.md`](generate-instructions.prompt.md)                                   | Instruction File Generator      | Comprehensive instruction files          |

### Quality & Compliance

| File                                                                                         | Purpose                    | Output                                           |
| -------------------------------------------------------------------------------------------- | -------------------------- | ------------------------------------------------ |
| [`instructions-bestpractices-issues.prompt.md`](instructions-bestpractices-issues.prompt.md) | Instruction Best Practices | Analysis of instruction quality and improvements |

### Architecture & Design

| File                                                                     | Purpose                  | Output                                     |
| ------------------------------------------------------------------------ | ------------------------ | ------------------------------------------ |
| [`update-application-c4-diagrams.md`](update-application-c4-diagrams.md) | C4 Architecture Diagrams | Updated C4 model diagrams for applications |

## Meta Prompts

The [`meta/`](meta/) subdirectory contains prompts that generate other prompts or instruction files. See [meta/README.md](meta/README.md) for details.

## Prompt Structure

All prompts follow this standardized structure:

```yaml
---
mode: agent|chat
model: "provider/model-name@version"
tools: ["array", "of", "tools"]
description: "Clear description of prompt purpose"
prompt_metadata:
  id: kebab-case-identifier
  title: Human Readable Title
  owner: author-name
  version: "1.0.0"
  created: "YYYY-MM-DD"
  updated: "YYYY-MM-DD"
  output_path: path/to/output
  category: category-name
  tags: ["tag1", "tag2", "tag3"]
  output_format: markdown
---
```

## Usage

These prompts are designed to be used with AI assistants that support:

- File operations (create, edit, search)
- Repository analysis
- Structured output generation

## Quality Standards

All prompts in this directory:

- ✅ Follow the standard structure from prompt-file.instructions.md
- ✅ Include complete metadata sections
- ✅ Use explicit model specifications
- ✅ Have clear, actionable descriptions
- ✅ Include appropriate tool selections

## Contributing

When adding new prompts:

1. Follow the structure defined in [prompt-file.instructions.md](../instructions/prompt-file.instructions.md)
2. Use descriptive kebab-case file names
3. Include complete metadata
4. Test the prompt before committing
5. Update this README with the new prompt entry
