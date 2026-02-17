# Using the VTT Content Summarizer

This guide shows how to use the `summarize-vti-content.prompt.md` promptfile to analyze WebVTT transcript files.

## Quick Start

### In GitHub Copilot Chat

```
@summarize-vti-content vti_file="past-class-recordings/2026-02/AI-Assisted Software Development with GitHub Copilot (Tue Morning).vtt"
```

### Alternative Invocation

```
/run summarize-vti-content.prompt.md vti_file="past-class-recordings/2026-02/AI-Assisted Software Development with GitHub Copilot (Tue Morning).vtt"
```

## What It Does

The promptfile:
1. **Reads** the WebVTT transcript file
2. **Parses** timestamps and text content
3. **Detects** section boundaries using content analysis
4. **Calculates** durations for each section
5. **Generates** a structured Markdown outline

## Example Input

WebVTT file format:
```
WEBVTT

00:00:00.000 --> 00:00:05.000
Welcome everyone to today's session...

00:00:05.000 --> 00:00:12.500
Today we'll be covering several key topics...
```

## Example Output

See `reports/sample-vtt-analysis.md` for a complete example. The output includes:

- **Overview**: 2-3 sentence summary of entire content
- **Table of Contents**: All sections with durations
- **Detailed Sections**: 
  - Time ranges and durations
  - Percentage of total content
  - Key topics covered
  - Summary paragraphs
  - Notable quotes with timestamps
- **Key Takeaways**: Main points from the session
- **Terminology**: Important terms and definitions
- **Q&A**: Questions and answers extracted from transcript

## Sample Output Structure

```markdown
# Transcript Summary: [Title]

**Total Duration**: HH:MM:SS
**Generated**: [timestamp]

## Overview
[Brief summary]

## Section 1: [Title]
**Time**: 00:00:00 - 00:05:30 (05:30)
**Percentage**: 15%

### Key Topics
- Topic 1
- Topic 2

### Summary
[Detailed description]

### Notable Quotes
> "[Quote]" (00:02:15)
```

## Use Cases

1. **Study Guides**: Create reference materials from recorded lectures
2. **Meeting Minutes**: Extract structured notes from recorded meetings
3. **Content Review**: Quickly assess recorded training content
4. **Accessibility**: Provide searchable text versions of video content
5. **Documentation**: Generate documentation from recorded demos

## Tips for Best Results

1. **Clear VTT Files**: Ensure transcript quality is good
2. **Topic Markers**: Include phrases like "Now let's..." or "Moving on to..." for better section detection
3. **Q&A Indicators**: Use "Question:" or "Q:" markers for better Q&A extraction
4. **File Paths**: Use relative paths from repository root

## Troubleshooting

### File Not Found
- Verify the file path is correct
- Use forward slashes or escape backslashes
- Ensure the file has `.vtt` extension

### Poor Section Detection
- Add explicit topic transition markers in transcript
- Ensure transcript has clear topic boundaries
- Consider manual section markers in VTT file

### Missing Content
- Verify VTT file format is valid
- Check that timestamps are sequential
- Ensure no empty cue blocks

## Related Files

- **Promptfile**: `.github/copilot/Promptfiles/summarize-vti-content.prompt.md`
- **Test Data**: `past-class-recordings/2026-02/AI-Assisted Software Development with GitHub Copilot (Tue Morning).vtt`
- **Sample Output**: `reports/sample-vtt-analysis.md`
- **Instructions**: `.github/instructions/prompt-file.instructions.md`
