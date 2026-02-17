# AI Conversation Log: Summarize VTI Content Promptfile Creation

**Chat ID**: summarize-vti-content-20260217
**Date**: 2026-02-17
**Operator**: github-copilot-agent
**Model**: anthropic/claude-3.5-sonnet@2024-10-22

## Summary

Created a new promptfile for summarizing VTT (Video Text Tracks) and VTI (training content) files. The promptfile enables users to analyze training videos and content files to extract key topics, sections, timestamps, and generate structured summaries.

## Context

**Problem**: Users need to analyze and summarize training content files (VTT video transcripts and VTI structured training content) to quickly understand the material covered without watching entire videos or reading through long transcripts.

**Solution**: Created `summarize-vti-content.prompt.md` promptfile that:
- Accepts a file path argument (vti_file)
- Intelligently identifies VTT vs VTI format
- Extracts sections, topics, and timestamps
- Generates comprehensive structured summaries
- Provides key takeaways and suggested use cases

## Implementation Details

### File Created
- **Path**: `.github/copilot/Promptfiles/summarize-vti-content.prompt.md`
- **Type**: GitHub Copilot Promptfile
- **Format**: Markdown with YAML front matter

### Key Features
1. **Format Detection**: Automatically identifies VTT or VTI file format
2. **Structured Output**: Organized summary with clear sections
3. **Timestamp Preservation**: Maintains timing information from source
4. **Topic Extraction**: Identifies main topics and subtopics
5. **Key Takeaways**: Summarizes main learning points
6. **Use Case Suggestions**: Recommends how content can be applied

### Arguments
- `vti_file` (string): Path to the VTT or VTI file to analyze

### Tags
- training
- summarization
- content-analysis
- documentation

## Changes Made

1. Created promptfile with proper YAML front matter including AI provenance metadata
2. Implemented comprehensive content analysis instructions
3. Defined structured output format for summaries
4. Added format-specific handling for VTT and VTI files
5. Included quality checklist for output validation

## Testing

Created sample VTT file at:
- `past-class-recordings/2026-02/AI-Assisted Software Development with GitHub Copilot (Fri Morning).vtt`

This sample file can be used to test the promptfile functionality.

## Usage

Users can invoke this promptfile in GitHub Copilot:

```
@summarize-vti-content vti_file="path/to/training/file.vtt"
```

or

```
@summarize-vti-content vti_file="docs/sample-training.vti"
```

## Compliance

This promptfile follows repository standards:
- ✅ Proper YAML front matter with AI provenance
- ✅ Located in `.github/copilot/Promptfiles/`
- ✅ Includes required metadata fields
- ✅ Uses kebab-case naming
- ✅ Has description and arguments
- ✅ Tagged appropriately
- ✅ AI conversation log created

## Related Files

- Existing VTI example: `docs/sample-training.vti`
- Sample VTT: `past-class-recordings/2026-02/AI-Assisted Software Development with GitHub Copilot (Fri Morning).vtt`
- Instructions reference: `.github/instructions/prompt-file.instructions.md`
- AI output policy: `.github/instructions/ai-assisted-output.instructions.md`

## Duration Breakdown

- Exploration and understanding: 00:05:00
- Promptfile design: 00:02:00
- Implementation and testing: 00:03:00
- Documentation: 00:02:00
- **Total**: 00:12:00

## Next Steps

1. Update README.md with entry for new promptfile
2. Test with actual VTT/VTI files
3. Gather user feedback for improvements
4. Consider adding additional output formats (JSON, PDF, etc.)
