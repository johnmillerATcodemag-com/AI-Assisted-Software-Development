# VTT Content Summarizer - Usage Guide

## Overview

The `summarize-vti-content` promptfile analyzes VTT (Video Text Track) files and generates comprehensive summaries with timing information, section breakdowns, and content analysis.

## Prerequisites

- VTT file from a class recording or video
- GitHub Copilot with promptfile support
- Access to the repository

## Quick Start

### 1. Place Your VTT File

Add your VTT file to the appropriate directory:

```bash
past-class-recordings/YYYY-MM/[Your Recording Name].vtt
```

### 2. Run the Promptfile

In GitHub Copilot, use the following command:

```
/run summarize-vti-content vti_file="past-class-recordings/2026-02/AI-Assisted Software Development with GitHub Copilot (Mon Afternoon).vtt"
```

Or with a different file:

```
/run summarize-vti-content vti_file="past-class-recordings/YYYY-MM/[Your File].vtt"
```

### 3. Review Generated Summary

The promptfile will analyze the VTT content and generate a markdown file with:
- Executive summary
- Detailed section breakdowns
- Timeline reference
- Content analysis
- Action items

## Example Output

For a sample VTT file, see:
- Input: `2026-02/AI-Assisted Software Development with GitHub Copilot (Mon Afternoon).vtt`
- Output: `2026-02/AI-Assisted Software Development with GitHub Copilot (Mon Afternoon)-summary.md`

## What Gets Analyzed

The promptfile extracts and analyzes:

1. **Timing Information**
   - Total video duration
   - Section durations
   - Timestamp ranges

2. **Content Structure**
   - Major topics and sections
   - Topic transitions
   - Logical groupings

3. **Key Information**
   - Main points per section
   - Notable quotes
   - Technical terms
   - Resources mentioned

4. **Metadata**
   - Difficulty level
   - Prerequisites
   - Action items
   - Q&A segments

## VTT File Format

VTT (WebVTT) files follow this format:

```vtt
WEBVTT

00:00:00.000 --> 00:00:05.000
First caption text

00:00:05.001 --> 00:00:10.000
Second caption text
```

## Tips for Best Results

1. **Clean VTT Files**: Ensure your VTT file is well-formatted with clear timestamps
2. **Descriptive Content**: VTT files with clear, descriptive text produce better summaries
3. **Logical Breaks**: Include natural breaks or topic changes in the transcription
4. **Complete Timestamps**: Ensure all cues have start and end times

## Troubleshooting

### Issue: Promptfile not found
**Solution**: Ensure you're in the repository root and using the correct path

### Issue: VTT file not found
**Solution**: Verify the file path is correct and relative to repository root

### Issue: Summary incomplete
**Solution**: Check that the VTT file is properly formatted and complete

## Advanced Usage

### Batch Processing

To analyze multiple files, you can create a script:

```bash
for file in past-class-recordings/2026-02/*.vtt; do
    echo "Processing $file"
    # Use promptfile for each file
done
```

### Custom Analysis

The generated summary can be customized by:
1. Editing the promptfile for different output formats
2. Adding custom sections or analysis criteria
3. Integrating with other documentation tools

## File Management

### Storage Best Practices

- Organize by year and month: `YYYY-MM/`
- Use descriptive filenames: `[Course] ([Day] [Period]).vtt`
- Keep summaries next to source files: `[filename]-summary.md`

### Version Control

- Large VTT files are excluded from git (via .gitignore)
- Sample files are included for demonstration
- Summaries are committed to repository

## Related Documentation

- [Promptfile README](.github/copilot/Promptfiles/README.md)
- [Past Class Recordings README](README.md)
- [AI-Assisted Output Instructions](.github/instructions/ai-assisted-output.instructions.md)

## Support

For issues or questions:
1. Check the promptfile documentation
2. Review sample files in this directory
3. Consult the repository's instruction files
