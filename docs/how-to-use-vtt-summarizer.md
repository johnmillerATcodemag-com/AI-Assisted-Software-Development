# How to Use the VTT/VTI Content Summarizer

The `summarize-vti-content` promptfile generates structured outlines from video transcript files (VTT or VTI formats).

## Quick Start

### Using GitHub Copilot Chat

1. Open GitHub Copilot Chat in VS Code or your IDE
2. Type: `@summarize-vti-content vti_file="path/to/your/file.vtt"`
3. Copilot will generate a structured summary with sections, durations, and key topics

### Example Usage

```
@summarize-vti-content vti_file="past-class-recordings/2026-02/AI-Assisted Software Development with GitHub Copilot (Tue Afternoon).vtt"
```

## What You Get

The promptfile generates a comprehensive summary including:

1. **Document Overview**
   - File name and format
   - Total duration
   - Number of main sections

2. **Detailed Outline**
   - Hierarchical section structure
   - Duration for each section
   - Key points and topics
   - Subsections when present

3. **Summary Statistics**
   - Total sections count
   - Average section length
   - Longest and shortest sections
   - Main topics covered

## Example Output

See [`docs/example-vtt-summary.md`](docs/example-vtt-summary.md) for a complete example of what the promptfile generates.

## Supported Formats

### VTT (WebVTT)
Standard Web Video Text Tracks format:
```
WEBVTT

00:00:00.000 --> 00:00:15.000
Transcript text here

00:00:15.000 --> 00:00:30.000
More transcript text
```

### VTI (Video Training Index)
Custom format with explicit sections and durations (see `docs/sample-training.vti` for example).

## Use Cases

- **Training Materials**: Quickly understand course content and time allocation
- **Meeting Recordings**: Extract key topics and discussion points
- **Video Documentation**: Create searchable outlines of video tutorials
- **Content Planning**: Review existing content structure for improvements

## Tips

1. **Large Files**: The promptfile handles long transcripts by organizing content hierarchically
2. **Missing Timestamps**: If duration info is unavailable, the summary will note "Duration: Unknown"
3. **Custom Sections**: The AI identifies section boundaries from content changes and topic shifts
4. **Time Formats**: Supports various formats: HH:MM:SS, MM:SS, or minutes

## Related Files

- **Promptfile**: `.github/copilot/Promptfiles/summarize-vti-content.prompt.md`
- **Example Output**: `docs/example-vtt-summary.md`
- **Sample VTT**: `past-class-recordings/2026-02/AI-Assisted Software Development with GitHub Copilot (Tue Afternoon).vtt`
- **Sample VTI**: `docs/sample-training.vti`
- **AI Logs**: `ai-logs/2026/02/17/summarize-video-content-20260217/`

## Requirements

- GitHub Copilot with chat functionality
- Access to VTT or VTI transcript files
- File path accessible from your workspace

## Need Help?

If the promptfile doesn't work as expected:

1. Check the file path is correct and accessible
2. Verify the file is in VTT or VTI format
3. Review the example output to understand expected format
4. Check the AI logs for implementation details

## Contributing

Found an issue or have a suggestion? Update the promptfile following the guidelines in `.github/instructions/prompt-file.instructions.md`.
