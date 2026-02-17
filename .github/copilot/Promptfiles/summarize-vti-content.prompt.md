---
name: summarize-vti-content
description: "Analyze WebVTT transcript files and generate structured outline with section durations and key topics"

arguments:
  vti_file:
    type: string
    description: Path to the WebVTT (.vtt) transcript file to analyze

tags: ["analysis", "transcripts", "documentation", "vtt"]

ai_generated: true
model: "anthropic/claude-3.5-sonnet@2024-10-22"
operator: "johnmillerATcodemag-com"
chat_id: "summarize-vti-content-20260217"
prompt: |
  /run summarize-vti-content.prompt.md vti_file="past-class-recordings\2026-02\AI-Assisted Software Development with GitHub Copilot (Tue Morning).vtt"
  
  Create a promptfile that analyzes WebVTT transcript files and generates structured outlines with section durations and key topics.
started: "2026-02-17T19:36:00Z"
ended: "2026-02-17T19:45:00Z"
task_durations:
  - task: "promptfile design and structure"
    duration: "00:05:00"
  - task: "VTT parsing logic implementation"
    duration: "00:04:00"
total_duration: "00:09:00"
ai_log: "ai-logs/2026/02/17/summarize-vti-content-20260217/conversation.md"
source: "johnmillerATcodemag-com"

prompt_metadata:
  id: summarize-vti-content
  title: VTI/VTT Content Summarizer
  owner: johnmillerATcodemag-com
  version: "1.0.0"
  created: "2026-02-17"
  updated: "2026-02-17"
  output_path: reports/
  category: analysis
  output_format: markdown
---

# Summarize VTI/VTT Content

Analyze WebVTT (.vtt) transcript files and generate a structured outline with timestamps, section durations, and key topics.

## Input

**VTT File**: `{{vti_file}}`

WebVTT (Web Video Text Tracks) is a text-based format for displaying timed text tracks. Each cue contains:
- Timestamp range (start --> end)
- Text content (what was said during that time)

## Analysis Process

### 1. Read and Parse VTT File

Read the file at `{{vti_file}}` and parse the WebVTT format:

```
WEBVTT

00:00:00.000 --> 00:00:05.120
[Opening content]

00:00:05.120 --> 00:00:10.500
[Next segment]
```

### 2. Content Analysis

Analyze the transcript text to:
- Identify topic transitions and section boundaries
- Detect key concepts, terminology, and themes
- Group related content into logical sections
- Calculate duration for each section

**Topic Detection Heuristics**:
- Look for explicit topic markers ("Let's talk about...", "Moving on to...", "Next topic...")
- Detect shifts in terminology and vocabulary
- Identify questions and answers
- Find demonstration or example markers
- Recognize summary or conclusion indicators

### 3. Time Calculations

For each identified section:
- Start time (timestamp of first cue)
- End time (timestamp of last cue)
- Duration (end - start, formatted as HH:MM:SS or MM:SS)
- Percentage of total content

### 4. Generate Structured Outline

Create a hierarchical outline with:
- Section number and title
- Time range (start - end)
- Duration
- Key topics covered
- Notable quotes or highlights
- Subsections if applicable

## Output Format

Generate a Markdown document with this structure:

```markdown
# Transcript Summary: [Filename]

**Total Duration**: HH:MM:SS
**Date**: [extracted from filename or metadata]
**Generated**: [current date/time]

## Overview

[2-3 sentence summary of the entire content]

## Table of Contents

1. [Section 1 Title] (MM:SS)
2. [Section 2 Title] (MM:SS)
3. [Section 3 Title] (MM:SS)
...

---

## Section 1: [Title]

**Time**: 00:00:00 - 00:15:30 (15:30)
**Percentage**: 25%

### Key Topics
- Topic 1
- Topic 2
- Topic 3

### Summary
[2-4 sentences describing what was covered]

### Notable Quotes
> "[Significant quote from transcript]" (00:05:15)

---

## Section 2: [Title]

[Same structure as Section 1]

---

## Key Takeaways

1. [Main takeaway 1]
2. [Main takeaway 2]
3. [Main takeaway 3]

## Terminology

- **Term 1**: Definition or context
- **Term 2**: Definition or context

## Questions & Answers

**Q**: [Question from transcript]
**A**: [Answer from transcript]
**Time**: 00:45:20

---

**Analysis Generated**: [timestamp]
**Source File**: {{vti_file}}
```

## Quality Standards

- ✅ All timestamps must be accurate and verifiable
- ✅ Section boundaries must be logical and content-driven
- ✅ Durations must add up to total (within rounding tolerance)
- ✅ Key topics must be specific and descriptive
- ✅ Summary must be concise but informative
- ✅ Quotes must be exact and properly timestamped

## Error Handling

If the file doesn't exist or can't be read:
- Report the error clearly
- Suggest checking the file path
- Verify the file extension is `.vtt`

If the VTT format is invalid:
- Report parsing errors with line numbers
- Suggest format corrections
- Continue with partial analysis if possible

## Example Section Detection

**Good section boundaries**:
- Introduction/welcome (first 2-5 minutes)
- Topic transitions ("Now let's discuss...")
- Q&A sessions (questions from audience)
- Demonstrations or examples
- Summary/conclusion (final 2-5 minutes)

**Poor section boundaries**:
- Mid-sentence breaks
- Arbitrary time intervals
- Split examples or demonstrations

## Notes

- Focus on content structure and flow
- Preserve technical accuracy of terminology
- Highlight practical examples and demonstrations
- Note any questions or interactive elements
- Capture action items or next steps if mentioned
