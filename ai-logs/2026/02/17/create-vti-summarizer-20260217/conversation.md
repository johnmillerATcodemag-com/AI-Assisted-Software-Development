# Conversation Log: Create VTI Summarizer Prompt

**Chat ID**: create-vti-summarizer-20260217  
**Date**: 2026-02-17  
**Operator**: johnmillerATcodemag-com  
**Model**: anthropic/claude-3.5-sonnet@2024-10-22

## Problem Statement

Create a prompt that takes a VTI filename as a parameter that creates an outline that summarizes the content presented. Include the duration of each section.

## Context Files Referenced

- `.github/instructions/ai-assisted-output.instructions.md`
- `.github/instructions/copilot-instructions.md`
- `.github/instructions/cqrs-architecture.instructions.md`
- `.github/instructions/dependency-management-policy.instructions.md`
- `.github/instructions/github-cli.instructions.md`

## Exploration Phase

1. **Repository Structure**: Explored the repository to understand:
   - Promptfile location: `.github/copilot/Promptfiles/`
   - Existing promptfile patterns and conventions
   - AI provenance requirements from instruction files
   - No existing VTI files found in repository

2. **VTI Format Understanding**:
   - VTI likely stands for "Video Training Index" or similar transcript/instruction format
   - Designed the prompt to be flexible enough to handle various text-based formats with timing information
   - Focused on extracting hierarchical structure and duration information

3. **Instruction Review**: 
   - Reviewed `.github/instructions/prompt-file.instructions.md` for promptfile structure requirements
   - Confirmed required YAML front matter fields (name, description, arguments, AI provenance)
   - Verified output format and conventions

## Implementation

Created `summarize-vti-content.prompt.md` with:

### YAML Front Matter
- **name**: `summarize-vti-content`
- **description**: Clear purpose statement
- **arguments**: Single `vti_file` parameter (type: string)
- **tags**: Relevant categories for discoverability
- **AI Provenance**: All required metadata fields
  - ai_generated: true
  - model: anthropic/claude-3.5-sonnet@2024-10-22
  - operator: johnmillerATcodemag-com
  - chat_id: create-vti-summarizer-20260217
  - Full timing breakdown
  - AI log path reference

### Prompt Body
- **Task-oriented**: Clear instructions for what to do with the VTI file
- **Structured output**: Defined Markdown outline format with timing info
- **Flexible parsing**: Handles various duration formats
- **Quality guidelines**: Ensures complete and accurate summaries
- **Hierarchical structure**: Preserves document organization

### Key Features
1. Reads VTI file from provided path
2. Extracts section structure and timing
3. Creates hierarchical outline
4. Includes summary statistics
5. Handles missing duration information gracefully

## Task Breakdown

1. **Repository exploration** (00:08:00)
   - Explored directory structure
   - Searched for VTI files and related formats
   - Reviewed instruction files
   - Examined existing promptfile examples

2. **Prompt design and creation** (00:06:00)
   - Designed prompt structure
   - Created YAML front matter with all required fields
   - Wrote comprehensive prompt body
   - Added quality checks and processing guidelines

**Total Duration**: 00:14:00

## Deliverables

1. ✅ Created `.github/copilot/Promptfiles/summarize-vti-content.prompt.md`
2. ✅ Created conversation log in `ai-logs/2026/02/17/create-vti-summarizer-20260217/`
3. ⏳ Update README.md with prompt entry (next step)

## Next Steps

1. Create summary.md for session resumability
2. Update README.md with new prompt entry
3. Validate prompt follows all repository conventions
