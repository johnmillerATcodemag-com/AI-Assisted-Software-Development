# Conversation Log: Create VTI/VTT Content Summarizer

**Chat ID**: summarize-vti-content-20260217  
**Date**: 2026-02-17  
**Operator**: johnmillerATcodemag-com  
**Model**: anthropic/claude-3.5-sonnet@2024-10-22

## Problem Statement

Create a promptfile that summarizes VTI or VTT transcript files with hierarchical outline and duration information. The user wants to process:
- File: `past-class-recordings\2026-02\AI-Assisted Software Development with GitHub Copilot (Wed Morning).vtt`

## Context Files Referenced

- `.github/instructions/ai-assisted-output.instructions.md`
- `.github/instructions/copilot-instructions.md`
- `.github/instructions/cqrs-architecture.instructions.md`
- `.github/instructions/dependency-management-policy.instructions.md`
- `.github/instructions/github-cli.instructions.md`

## Analysis Phase

1. **Repository Exploration**:
   - Located existing promptfiles in `.github/copilot/Promptfiles/`
   - Found sample VTI file at `docs/sample-training.vti`
   - Found reference to promptfile in README.md (line 30)
   - Discovered promptfile was previously created but removed
   - Current branch: `copilot/summarize-vti-content-another-one`

2. **Format Understanding**:
   - **VTI Format**: Custom training format with Markdown structure, sections with durations in parentheses
   - **VTT Format**: WebVTT standard for video captions with timestamps (HH:MM:SS.mmm --> HH:MM:SS.mmm)
   - Need to support both formats in a single promptfile

3. **Instruction Review**:
   - Reviewed `.github/instructions/prompt-file.instructions.md` for structure requirements
   - Confirmed required YAML fields: name, description, arguments, tags, AI provenance
   - Verified output format expectations

## Implementation

### Created Files

1. **`.github/copilot/Promptfiles/summarize-vti-content.prompt.md`**
   - Defined `vti_file` argument (type: string)
   - Comprehensive format handling for both VTI and VTT
   - Clear output format specification
   - Quality guidelines for processing
   - Special instructions for VTT timestamp parsing

### Key Features

1. **Dual Format Support**: Handles both VTI and VTT files
2. **Hierarchical Extraction**: Preserves document structure
3. **Duration Calculation**: Extracts and calculates timing information
4. **VTT Timestamp Parsing**: Converts WebVTT timestamps to section durations
5. **Content Grouping**: Intelligently groups VTT captions into logical sections
6. **Statistics**: Provides summary metrics (total, average, longest, shortest)
7. **Flexible Output**: Structured Markdown outline format

### YAML Front Matter

All required fields included:
- `name`: summarize-vti-content
- `description`: Clear purpose statement
- `arguments`: vti_file parameter with description
- `tags`: Relevant categories for discoverability
- **AI Provenance**: Complete metadata
  - ai_generated: true
  - model: anthropic/claude-3.5-sonnet@2024-10-22
  - operator: johnmillerATcodemag-com
  - chat_id: summarize-vti-content-20260217
  - timestamps and task breakdown
  - ai_log path reference

## Task Breakdown

1. **Repository exploration and format analysis** (00:05:00)
   - Explored directory structure
   - Examined sample VTI file
   - Reviewed existing promptfiles
   - Analyzed VTT format specifications

2. **Promptfile design and creation** (00:09:00)
   - Designed dual-format support
   - Created comprehensive YAML front matter
   - Wrote detailed processing instructions
   - Added quality guidelines and examples
   - Created AI log files

**Total Duration**: 00:14:00

## Deliverables

1. ✅ Created `.github/copilot/Promptfiles/summarize-vti-content.prompt.md`
2. ✅ Created AI log directory and conversation file
3. ⏳ Test with sample VTI file (next step)
4. ⏳ Test with VTT file (next step)

## Usage

Invoke via GitHub Copilot:

```
@summarize-vti-content vti_file="docs/sample-training.vti"
@summarize-vti-content vti_file="past-class-recordings/2026-02/AI-Assisted Software Development with GitHub Copilot (Wed Morning).vtt"
```

## Technical Notes

- VTI files have explicit section markers and durations
- VTT files require parsing timestamps and inferring section boundaries
- The promptfile provides guidelines for handling both formats
- Special attention to VTT timestamp conversion: `HH:MM:SS.mmm` format
- Content grouping logic for VTT based on timing gaps and content patterns
