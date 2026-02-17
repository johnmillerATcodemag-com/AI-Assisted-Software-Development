# VTI/VTT Summarizer Usage Guide

## Overview

The `summarize-vti-content` promptfile analyzes video transcript files (VTI or VTT format) and generates structured outlines with section durations and content summaries.

## Usage

### Basic Invocation

In GitHub Copilot Chat, use the `@` syntax to invoke the prompt:

```
@summarize-vti-content vti_file="past-class-recordings/2026-02/AI-Assisted Software Development with GitHub Copilot (Mon Afternoon).vtt"
```

Or simply:

```
@summarize-vti-content
```

Then provide the file path when prompted.

## Supported Formats

### VTT (WebVTT) Format
Standard web video text track format used for video captions and subtitles.

**Example:**
```
WEBVTT

00:00:12.340 --> 00:00:15.430
Hello and welcome to this training session.

00:00:15.430 --> 00:00:20.120
Today we'll cover GitHub Copilot features.
```

### VTI (Video Training Index) Format
Structured training content with explicit section markers and durations.

**Example:**
```
# GitHub Copilot Custom Agents Training

## Section 1: Introduction (8:30)

### What are Custom Agents?
- Custom agents extend GitHub Copilot
- Available across multiple environments
```

## Output Format

The prompt generates a comprehensive Markdown outline:

- **Document Overview**: Title, total duration, section count
- **Detailed Sections**: Hierarchical structure with durations
- **Key Topics**: Extracted main points for each section
- **Summary Statistics**: Average lengths, longest/shortest sections

See `docs/vtt-summary-example.md` for a complete example output.

## Sample Files

### Test with VTI Format
```
@summarize-vti-content vti_file="docs/sample-training.vti"
```

### Test with VTT Format
```
@summarize-vti-content vti_file="past-class-recordings/2026-02/AI-Assisted Software Development with GitHub Copilot (Mon Afternoon).vtt"
```

## Features

- ✅ **Automatic Format Detection**: Identifies VTT vs VTI format
- ✅ **Timestamp Parsing**: Extracts durations from timestamps
- ✅ **Hierarchical Structure**: Preserves section/subsection relationships
- ✅ **Duration Calculation**: Computes accurate section lengths
- ✅ **Summary Statistics**: Generates overview metrics
- ✅ **Markdown Output**: Well-formatted, readable outlines

## Use Cases

1. **Training Material Review**: Quickly understand course content structure
2. **Video Documentation**: Generate searchable outlines from video transcripts
3. **Content Planning**: Analyze time allocation across topics
4. **Meeting Notes**: Structure recorded meeting transcripts
5. **Learning Resources**: Create study guides from video lectures

## Notes

- The prompt handles missing duration data gracefully
- Supports multiple time formats (HH:MM:SS, MM:SS, minutes)
- Maintains all hierarchical structure from source files
- Generates consistent Markdown formatting

## Related Files

- **Promptfile**: `.github/copilot/Promptfiles/summarize-vti-content.prompt.md`
- **Example Output**: `docs/vtt-summary-example.md`
- **Example Input (VTI)**: `docs/sample-training.vti`
- **Example Input (VTT)**: `past-class-recordings/2026-02/AI-Assisted Software Development with GitHub Copilot (Mon Afternoon).vtt`
- **AI Logs**: `ai-logs/2026/02/17/create-vti-summarizer-20260217/`
