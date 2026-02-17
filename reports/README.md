# Reports Directory

This directory contains generated reports and analyses from various promptfiles and AI tools.

## Contents

### VTT Analysis Reports

Reports generated from WebVTT transcript files using the `summarize-vti-content.prompt.md` promptfile.

- **sample-vtt-analysis.md** - Example output showing structured analysis of a GitHub Copilot training session transcript
  - Demonstrates section detection and duration calculations
  - Includes key topics, quotes, and Q&A extraction
  - Shows terminology glossary and key takeaways

## Generating Reports

### VTT/Transcript Analysis

To analyze a WebVTT transcript file:

```
@summarize-vti-content vti_file="path/to/transcript.vtt"
```

Or:

```
/run summarize-vti-content.prompt.md vti_file="path/to/transcript.vtt"
```

The promptfile will generate a structured Markdown report with:
- Overview and table of contents
- Section-by-section breakdown with timestamps and durations
- Key topics and notable quotes
- Terminology glossary
- Q&A extraction
- Key takeaways

## Output Format

All reports use Markdown format with consistent structure:
- Clear headings and sections
- Timestamp references
- Percentage breakdowns
- Quoted content with timestamps
- Generated metadata (date, source file, version)

## Usage

Reports can be:
- Used for study guides and reference materials
- Shared with team members who missed sessions
- Incorporated into documentation
- Analyzed for content improvement
- Referenced for future training sessions
