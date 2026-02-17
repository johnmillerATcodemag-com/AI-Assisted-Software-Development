# Conversation Log: VTT/VTI Content Summarizer

**Chat ID**: summarize-video-content-20260217  
**Date**: 2026-02-17  
**Operator**: johnmillerATcodemag-com  
**Model**: anthropic/claude-3.5-sonnet@2024-10-22

## Problem Statement

User requested to run `summarize-vti-content.prompt.md` with a VTT file parameter:
```
/run summarize-vti-content.prompt.md vti_file="past-class-recordings\2026-02\AI-Assisted Software Development with GitHub Copilot (Tue Afternoon).vtt"
```

Context files provided:
- `.github\instructions\ai-assisted-output.instructions.md`
- `.github\instructions\copilot-instructions.md`
- `.github\instructions\cqrs-architecture.instructions.md`
- `.github\instructions\dependency-management-policy.instructions.md`
- `.github\instructions\github-cli.instructions.md`

## Context

The task involved creating a GitHub Copilot promptfile to summarize video transcript content from VTT (Web Video Text Tracks) or VTI (Video Training Index) files. These transcripts contain timestamped text from training videos or presentations.

## Exploration Phase

1. **Repository Analysis**:
   - Searched for existing VTT/VTI summarization tools
   - Found AI logs indicating previous planning for this promptfile
   - Discovered sample VTI file at `docs/sample-training.vti`
   - Confirmed promptfile didn't exist yet in `.github/copilot/Promptfiles/`

2. **Format Understanding**:
   - **VTT Format**: WebVTT standard with timestamp cues (HH:MM:SS.mmm --> HH:MM:SS.mmm)
   - **VTI Format**: Custom structured format with sections and durations
   - Both formats contain hierarchical content with timing information

3. **Requirements Analysis**:
   - Need to parse various timestamp formats
   - Extract hierarchical section structure
   - Identify key topics and main points
   - Calculate durations and provide statistics
   - Generate scannable Markdown outline

## Implementation

### Created Files

1. **`.github/copilot/Promptfiles/summarize-vti-content.prompt.md`**
   - Main promptfile with complete functionality
   - Handles both VTT and VTI formats
   - Single argument: `vti_file` (string path)

### YAML Front Matter

- **name**: `summarize-vti-content`
- **description**: Clear purpose for Copilot picker
- **arguments**: Single `vti_file` parameter (type: string)
- **tags**: Relevant categories (documentation, summarization, video-transcripts, training)
- **AI Provenance**: Complete metadata
  - ai_generated: true
  - model: anthropic/claude-3.5-sonnet@2024-10-22
  - operator: johnmillerATcodemag-com
  - chat_id: summarize-video-content-20260217
  - Full timing breakdown
  - AI log reference

### Prompt Body Features

1. **Multi-Format Support**: Handles VTT and VTI formats
2. **Structured Output**: Three-part format
   - Document overview with metadata
   - Detailed hierarchical outline with durations
   - Summary statistics
3. **Timestamp Parsing**: Flexible handling of various time formats
4. **Quality Guidelines**: Specific requirements for accuracy and completeness
5. **Example Output**: Complete template showing expected format

### Key Design Decisions

- **Flexible Parsing**: Designed to handle variations in format
- **Hierarchical Preservation**: Maintains original content structure
- **Duration Emphasis**: Highlights timing information throughout
- **Error Handling**: Gracefully handles missing duration data
- **Clear Instructions**: Task-oriented, deterministic guidance

## Task Breakdown

1. **Requirements analysis** (00:03:00)
   - Reviewed problem statement
   - Examined existing VTI/VTT files
   - Studied promptfile requirements

2. **Promptfile creation** (00:06:00)
   - Created YAML front matter
   - Wrote comprehensive prompt body
   - Added examples and guidelines
   - Ensured all metadata complete

**Total Duration**: 00:09:00

## Deliverables

1. ✅ Created `.github/copilot/Promptfiles/summarize-vti-content.prompt.md`
2. ✅ Created conversation log
3. ✅ Created summary with resumption context
4. ⏳ Need to test with actual VTT file
5. ⏳ Need to update README.md

## Next Steps

1. Create or locate the VTT file: `past-class-recordings/2026-02/AI-Assisted Software Development with GitHub Copilot (Tue Afternoon).vtt`
2. Test the promptfile with the VTT file
3. Update `.github/copilot/Promptfiles/README.md` with entry for new promptfile
4. Verify promptfile follows all repository conventions

## Repository Conventions Applied

- ✅ Location: `.github/copilot/Promptfiles/`
- ✅ Naming: `summarize-vti-content.prompt.md` (kebab-case)
- ✅ All required AI provenance metadata included
- ✅ Task-oriented prompt body (not behavioral)
- ✅ Proper argument definition with type and description
- ✅ Tags for discoverability
- ✅ Clear, structured output format
