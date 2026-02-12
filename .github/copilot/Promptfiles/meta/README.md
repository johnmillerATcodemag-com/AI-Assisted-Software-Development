# Meta Prompts - Prompt and Instruction Generators

This directory contains meta-prompts that generate other prompts and instruction files. These are specialized prompts designed to create standardized documentation and guidelines.

## Meta Prompt Files

| File                                                                                                                 | Purpose                        | Generates                                  | Output Location         |
| -------------------------------------------------------------------------------------------------------------------- | ------------------------------ | ------------------------------------------ | ----------------------- |
| [`create-instruction-files-instructions.prompt.md`](create-instruction-files-instructions.prompt.md)                 | Instruction File Generator     | Guidelines for creating instruction files  | `.github/instructions/` |
| [`create-instruction-files-prompt-file.prompt.md`](create-instruction-files-prompt-file.prompt.md)                   | Instruction Prompt Generator   | Prompts that create instruction files      | `.github/prompts/`      |
| [`create-use-case-instructions-file-prompt-file.prompt.md`](create-use-case-instructions-file-prompt-file.prompt.md) | Use Case Instruction Generator | Use case documentation guidelines          | `.github/instructions/` |
| [`validate-and-improve-instructions.prompt.md`](validate-and-improve-instructions.prompt.md)                         | Instruction Validator          | Improved versions of existing instructions | Various locations       |

## What Are Meta Prompts?

Meta prompts are prompts whose purpose is to generate other prompts or instruction files. They serve as:

- **Standardization Tools**: Ensure consistency across generated documentation
- **Template Generators**: Create structured starting points for new content
- **Quality Enforcers**: Apply best practices and compliance requirements automatically
- **Workflow Accelerators**: Speed up the creation of repetitive documentation types

## Key Features

### Compliance Integration

All meta prompts automatically include:

- ✅ AI provenance requirements from [ai-assisted-output.instructions.md](../../instructions/ai-assisted-output.instructions.md)
- ✅ Proper metadata structure and YAML front matter
- ✅ Required fields and formatting standards
- ✅ Quality checklists and validation steps

### Template-Driven Output

Meta prompts generate files that include:

- Standardized structure and sections
- Required metadata fields
- Compliance with instruction standards
- Copy-paste ready templates and examples

### Self-Referential Design

These prompts follow the same standards they generate:

- Complete `prompt_metadata` sections
- Proper tool selection and descriptions
- Explicit model specifications
- Comprehensive documentation

## Usage Pattern

Meta prompts typically follow this workflow:

1. **Context Gathering**: Read existing instruction files and standards
2. **Structure Definition**: Define output file structure and required sections
3. **Content Generation**: Create comprehensive content following templates
4. **Compliance Integration**: Embed all required AI provenance metadata
5. **Quality Assurance**: Include validation steps and checklists

## Relationship to Main Prompts

Meta prompts in this directory generate some of the prompts in the parent [`../`](../) directory:

```
meta/create-instruction-files-prompt-file.prompt.md
  ↓ generates
../create-prompt-file-instructions-file.prompt.md
  ↓ which generates
../../instructions/prompt-file.instructions.md
```

This creates a hierarchy of documentation generation that ensures consistency and compliance across the repository.

## When to Create Meta Prompts

Consider creating a meta prompt when you need to:

- **Generate multiple similar files** with consistent structure
- **Enforce compliance** across generated documentation
- **Standardize creation** of specific file types
- **Reduce manual work** in documentation workflows
- **Ensure quality** through automated best practices

## Contributing

When adding meta prompts:

1. Follow the naming pattern: `create-{target-type}-{purpose}.prompt.md`
2. Include comprehensive context sections referencing relevant instruction files
3. Define clear output structure and requirements
4. Include quality checklists and validation steps
5. Test the generated output for compliance
6. Update this README with the new meta prompt entry
