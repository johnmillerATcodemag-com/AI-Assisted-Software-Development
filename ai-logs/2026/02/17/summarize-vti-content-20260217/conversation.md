# AI Conversation Log: Create VTI Content Summarization Promptfile

**Chat ID**: summarize-vti-content-20260217  
**Operator**: johnmillerATcodemag-com  
**Model**: anthropic/claude-3.5-sonnet@2024-10-22  
**Started**: 2026-02-17T19:44:24Z  
**Ended**: 2026-02-17T19:50:00Z  
**Total Duration**: 00:06:00

## Objective

Create a GitHub Copilot promptfile (`summarize-vti-content.prompt.md`) that can be used to summarize training content from VTI (Video Training Index) or VTT (Video Text Track) transcript files.

## Context

The user requested:
```
/run summarize-vti-content.prompt.md vti_file="past-class-recordings\2026-02\AI-Assisted Software Development with GitHub Copilot (Wed Afternoon).vtt"
```

The repository has:
- An existing VTI sample file at `docs/sample-training.vti` demonstrating the format
- Multiple existing promptfiles in `.github/copilot/Promptfiles/`
- Instructions for promptfile creation in `.github/instructions/prompt-file.instructions.md`
- AI provenance requirements in `.github/instructions/ai-assisted-output.instructions.md`

## Implementation Steps

### 1. Repository Exploration (00:02:00)

- Explored existing promptfile structure and patterns
- Examined the sample VTI file format to understand content structure
- Reviewed promptfile creation instructions and requirements
- Analyzed existing promptfiles for formatting patterns

Key findings:
- VTI files contain timestamped training sections with hierarchical content
- Promptfiles require YAML front matter with specific fields
- AI provenance metadata is required for all AI-generated files
- Arguments can be defined to make promptfiles reusable

### 2. Promptfile Creation (00:03:00)

Created `.github/copilot/Promptfiles/summarize-vti-content.prompt.md` with:

**Required Elements**:
- `name`: summarize-vti-content
- `description`: Clear description of the promptfile's purpose
- `arguments`: Defined `vti_file` parameter for specifying the file to summarize
- `tags`: Added relevant tags for discoverability

**AI Provenance Metadata**:
- `ai_generated`: true
- `model`: anthropic/claude-3.5-sonnet@2024-10-22
- `operator`: johnmillerATcodemag-com
- `chat_id`: summarize-vti-content-20260217
- `prompt`: Original user request
- Timestamps in ISO8601 format
- Task duration breakdowns
- `ai_log`: Path to this conversation file
- `source`: Branch name

**Content Structure**:
1. Clear instructions for analyzing VTI/VTT files
2. Structured output format with sections for:
   - Overview with basic statistics
   - Section-by-section summaries
   - Key insights and takeaways
   - Quick reference table
3. Guidelines for generating useful summaries

### 3. Documentation and AI Logs (00:01:00)

Created supporting documentation:
- AI log directory structure: `ai-logs/2026/02/17/summarize-vti-content-20260217/`
- This conversation log documenting the implementation process
- Prepared README update with promptfile entry

## Artifacts Created

1. **`.github/copilot/Promptfiles/summarize-vti-content.prompt.md`**
   - Main promptfile for VTI/VTT content summarization
   - Includes argument for file path
   - Provides structured output format
   - Follows repository patterns and conventions

2. **`ai-logs/2026/02/17/summarize-vti-content-20260217/conversation.md`**
   - This conversation log
   - Documents implementation decisions and process
   - Provides resumability context

## Key Decisions

1. **File Format Support**: Named for VTI but explicitly supports both VTI and VTT formats
2. **Output Structure**: Designed output to be scannable with clear sections and time-indexed reference
3. **Flexibility**: Used argument to allow any VTI/VTT file to be summarized
4. **Practical Focus**: Emphasized actionable summaries and key takeaways over verbose transcription

## Usage

The promptfile can be invoked in GitHub Copilot with:

```
@summarize-vti-content vti_file="path/to/file.vti"
```

Or:

```
@summarize-vti-content vti_file="path/to/file.vtt"
```

The argument will be interpolated into the instructions, and Copilot will read and summarize the specified file.

## Validation

Checklist completed:
- ✅ File in correct location (`.github/copilot/Promptfiles/`)
- ✅ Valid YAML front matter
- ✅ Required `description` field
- ✅ `name` field matches filename (minus extension)
- ✅ All AI provenance fields present
- ✅ Arguments properly defined with type and description
- ✅ Clear, task-oriented instructions (not behavioral)
- ✅ Structured output format specified
- ✅ AI log path exists and is documented
- ✅ Follows repository conventions

## Next Steps

1. Update README.md with entry for the new promptfile
2. Test the promptfile with actual VTI/VTT files
3. Iterate based on usage feedback

## Summary

Successfully created a reusable GitHub Copilot promptfile for summarizing VTI/VTT training content. The promptfile follows all repository requirements, includes proper AI provenance metadata, and provides clear instructions for generating structured, actionable summaries of training materials.
