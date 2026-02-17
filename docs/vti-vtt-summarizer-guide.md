# VTI/VTT Content Summarizer - Usage Guide

## Overview

The `summarize-vti-content` promptfile processes VTI and VTT transcript files to generate hierarchical outlines with duration information.

## Invocation

### Via GitHub Copilot Chat

```
@summarize-vti-content vti_file="past-class-recordings/2026-02/AI-Assisted Software Development with GitHub Copilot (Wed Morning).vtt"
```

Or with a VTI file:

```
@summarize-vti-content vti_file="docs/sample-training.vti"
```

## Supported Formats

### VTI Format (Custom Training Format)
- Markdown-based structure
- Sections marked with `##` headings
- Duration in parentheses: `(MM:SS)` or `(HH:MM:SS)`
- Example: `## Section 1: Introduction (8:30)`

### VTT Format (WebVTT Standard)
- Video caption/subtitle format
- Timestamps: `HH:MM:SS.mmm --> HH:MM:SS.mmm`
- Content grouped into logical sections
- Duration calculated from timestamp ranges

## Expected Output Format

When you run the promptfile, it generates a structured Markdown outline:

```markdown
### Document Overview
- **Source**: AI-Assisted Software Development with GitHub Copilot (Wed Morning).vtt
- **Format**: VTT
- **Total Duration**: 02:35.700
- **Main Sections**: 3

### Detailed Outline

## Section 1: Introduction to Custom Agents (Duration: 00:49.220)
   ### Key Points
   - Custom agents extend GitHub Copilot capabilities
   - Define specific behaviors and tools
   - Examples: security analyzer, test specialist
   - Provides consistency across team development
   
## Section 2: Creating Promptfiles (Duration: 00:51.140)
   ### Key Points
   - Reusable task definitions with simple invocation
   - Stored in .github/copilot/Promptfiles directory
   - YAML front matter with metadata and arguments
   - Markdown body with instructions
   - Parameterizable for flexibility
   
## Section 3: Best Practices and Tips (Duration: 00:55.340)
   ### Key Points
   - Provide clear, specific instructions
   - Use task-oriented language
   - Test thoroughly before deployment
   - Focus on single responsibility
   - Document for team understanding
   - Version control everything

### Summary Statistics
- Total sections: 3
- Average section length: 00:51.900
- Longest section: Section 3 (Best Practices) - 00:55.340
- Shortest section: Section 1 (Introduction) - 00:49.220
```

## Features

### Automatic Format Detection
The promptfile automatically detects whether the input is VTI or VTT format and processes accordingly.

### Duration Calculation
- **VTI**: Extracts durations directly from section headings
- **VTT**: Calculates durations from timestamp ranges
- Aggregates total duration across all sections

### Hierarchical Structure
Preserves the document's organizational structure:
- Main sections
- Subsections
- Key points
- Content summaries

### Statistics Generation
Provides useful metrics:
- Total section count
- Average section length
- Identification of longest/shortest sections

## Use Cases

1. **Training Material Review**: Quickly understand video content structure
2. **Documentation**: Convert video transcripts to readable outlines
3. **Time Management**: See section durations before watching
4. **Content Planning**: Analyze training material organization
5. **Quick Reference**: Create scannable summaries of lengthy videos

## Implementation Details

The promptfile follows repository conventions:
- Located in `.github/copilot/Promptfiles/`
- Complete YAML front matter with AI provenance
- Task-oriented instructions
- Comprehensive format handling
- Quality guidelines for consistent output

## Related Files

- **Promptfile**: `.github/copilot/Promptfiles/summarize-vti-content.prompt.md`
- **Sample VTI**: `docs/sample-training.vti`
- **Sample VTT**: `past-class-recordings/2026-02/AI-Assisted Software Development with GitHub Copilot (Wed Morning).vtt`
- **Example Output**: `docs/vti-summarizer-example.md`
- **AI Logs**: `ai-logs/2026/02/17/summarize-vti-content-20260217/`

## Troubleshooting

### Promptfile Not Found
Ensure you're in the repository root and the promptfile exists:
```bash
ls -la .github/copilot/Promptfiles/summarize-vti-content.prompt.md
```

### File Path Issues
Use relative paths from repository root:
- ✅ `past-class-recordings/2026-02/file.vtt`
- ❌ `./past-class-recordings/2026-02/file.vtt`
- ❌ Absolute paths

### VTT Parsing Issues
If VTT parsing seems incorrect:
- Verify file has `WEBVTT` header
- Check timestamp format: `HH:MM:SS.mmm --> HH:MM:SS.mmm`
- Ensure blank lines between cues
- Validate with WebVTT validator

## Contributing

To improve the promptfile:
1. Test with various VTI/VTT formats
2. Report issues or edge cases
3. Suggest additional format support
4. Enhance duration calculation logic
5. Improve section detection algorithms

## Version History

- **v1.0.0** (2026-02-17): Initial release with VTI and VTT support
  - Dual format support
  - Hierarchical outline generation
  - Duration extraction and statistics
  - Complete AI provenance metadata
