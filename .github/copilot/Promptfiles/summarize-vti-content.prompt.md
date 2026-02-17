---
name: summarize-vti-content
description: Analyze VTT (Video Text Track) files and generate structured outlines with section durations and key topics

# Arguments
arguments:
  vti_file:
    type: string
    description: Path to the VTT file to analyze (e.g., "past-class-recordings/2026-02/recording.vtt")

# Tags
tags: ["analysis", "video", "transcription", "documentation"]

# AI Provenance Metadata
ai_generated: true
model: "anthropic/claude-3.5-sonnet@2024-10-22"
operator: "github-copilot-assistant"
chat_id: "create-vtt-summarizer-20260217"
prompt: |
  Create a promptfile that can summarize VTT (Video Text Track) content files.
  The prompt should accept a vti_file argument and generate an outline with section durations.
started: "2026-02-17T20:20:00Z"
ended: "2026-02-17T20:25:00Z"
task_durations:
  - task: "design and implementation"
    duration: "00:05:00"
total_duration: "00:05:00"
ai_log: "ai-logs/2026/02/17/create-vtt-summarizer-20260217/conversation.md"
source: "github-copilot-assistant"
owner: "Documentation Team"
version: "1.0.0"
created: "2026-02-17"
updated: "2026-02-17"
---

# VTT Content Summarizer

Analyze the VTT (Video Text Track) file at `{{vti_file}}` and generate a comprehensive outline with timing information.

## Analysis Requirements

1. **Parse VTT Structure**
   - Read the VTT file format (WebVTT)
   - Extract timestamps and associated text
   - Identify speaker changes (if indicated)
   - Note any cue identifiers or metadata

2. **Content Segmentation**
   - Group related content into logical sections
   - Identify topic transitions
   - Detect major themes or discussion points
   - Note any Q&A segments or breaks

3. **Timing Analysis**
   - Calculate duration of each section
   - Identify the total video length
   - Note significant pauses or gaps
   - Track pacing patterns

## Output Format

Generate a structured outline with the following sections:

### Executive Summary
- Total video duration
- Number of major topics covered
- Overall content type (lecture, discussion, demo, etc.)
- Key takeaways (3-5 bullet points)

### Detailed Outline

For each section, provide:

```
## Section N: [Topic Title] (MM:SS - MM:SS, Duration: MM:SS)

**Key Points:**
- Main point 1
- Main point 2
- Main point 3

**Notable Quotes or Examples:**
- Relevant excerpts

**Transitions:**
- How this section connects to the next
```

### Timeline Reference

Provide a quick-reference timeline:

```
00:00 - 05:30 | Introduction and Setup
05:31 - 15:45 | Topic 1: [Name]
15:46 - 28:20 | Topic 2: [Name]
...
```

### Content Analysis

- **Difficulty Level**: Beginner/Intermediate/Advanced
- **Primary Topics**: List of main subjects covered
- **Prerequisites Mentioned**: Any assumed knowledge
- **Resources Referenced**: URLs, books, tools mentioned
- **Action Items**: Any homework or follow-up activities suggested

## Processing Instructions

1. Read the entire VTT file first to understand overall structure
2. Identify natural breaks and topic shifts
3. Group timestamps into logical sections (typically 5-15 minutes each)
4. Extract key vocabulary and technical terms
5. Note any visual demonstrations mentioned in the transcript
6. Flag any audio quality issues noted in the text
7. Identify questions from participants (if present)

## Quality Checks

- Ensure all sections have accurate timestamps
- Verify total duration matches file length
- Check that no content gaps exist
- Confirm logical flow between sections
- Validate that key points accurately represent the content

## Output File

Save the analysis as a markdown file following this naming convention:
- Original file: `[name].vtt`
- Output file: `[name]-summary.md`
- Location: Same directory as source VTT file

Include metadata at the top:
```yaml
---
source_file: {{vti_file}}
analyzed_date: [Current Date]
total_duration: [HH:MM:SS]
section_count: [Number]
---
```
