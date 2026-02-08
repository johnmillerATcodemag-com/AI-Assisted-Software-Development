# GitHub Copilot Chat Modes

This directory contains custom chat mode definitions for specialized AI assistants in GitHub Copilot.

## Available Chat Modes

| File                                                                           | Mode Name                | Focus Area        | Description                                                                                                   |
| ------------------------------------------------------------------------------ | ------------------------ | ----------------- | ------------------------------------------------------------------------------------------------------------- |
| [`codebase-explorer.chatmode.md`](codebase-explorer.chatmode.md)               | Codebase Explorer        | Code Analysis     | Navigate and understand large codebases with guided exploration                                               |
| [`documentation-visualizer.chatmode.md`](documentation-visualizer.chatmode.md) | Documentation Visualizer | Documentation     | Create visual diagrams and documentation from code and specs                                                  |
| [`git-expert.chatmode.md`](git-expert.chatmode.md)                             | Git Expert               | Version Control   | Git workflow guidance, branching strategies, and repository management                                        |
| [`security-expert.chatmode.md`](security-expert.chatmode.md)                   | Security Expert          | Security Analysis | Comprehensive security analysis, vulnerability detection, compliance validation, and automated issue creation |
| [`technical-writer.chatmode.md`](technical-writer.chatmode.md)                 | Technical Writer         | Documentation     | Professional documentation creation and content strategy                                                      |

## Usage

To activate a chat mode in GitHub Copilot:

```
@mode-name your question or request
```

For example:

- `@security-expert Review this authentication function for vulnerabilities`
- `@codebase-explorer Help me understand the data flow in this application`
- `@git-expert What's the best branching strategy for this project?`

## Chat Mode Features

Each chat mode provides:

- **Specialized expertise** in their domain area
- **Custom commands** for domain-specific tasks
- **Structured responses** following established patterns
- **Context-aware guidance** based on the mode's focus

## Creating New Chat Modes

To create a new chat mode, follow the guidelines in [`.github/instructions/chatmode-file.instructions.md`](../instructions/chatmode-file.instructions.md).

## File Structure

All chat mode files follow the pattern:

- **Filename**: `{mode-name}.chatmode.md` (kebab-case)
- **Header**: Name, Focus, Temperature, Style
- **Sections**: Mission, Core Expertise, Methodology, Commands, Response Format, Principles, Examples

## Contributing

When adding or modifying chat modes:

1. Follow the established naming conventions
2. Include all required sections and metadata
3. Test the mode thoroughly before committing
4. Update this README with the new mode entry
