---
name: summarize-vti-content
description: Create an outline that summarizes the content of a VTI (Video Training Index) file with section durations

arguments:
  vti_file:
    type: string
    description: Path to the VTI file to summarize

tags: ["documentation", "analysis", "video", "training", "outline"]

# AI Provenance Metadata
ai_generated: true
model: "anthropic/claude-3.5-sonnet@2024-10-22"
operator: "johnmillerATcodemag-com"
chat_id: "create-vti-summarizer-20260217"
prompt: |
  create a prompt that takes a vti filename as a parameter that creates an outline that summerizes the content presented. Include the duration of each section.
started: "2026-02-17T18:36:14Z"
ended: "2026-02-17T18:50:00Z"
task_durations:
  - task: "repository exploration"
    duration: "00:08:00"
  - task: "prompt design and creation"
    duration: "00:06:00"
total_duration: "00:14:00"
ai_log: "ai-logs/2026/02/17/create-vti-summarizer-20260217/conversation.md"
source: "johnmillerATcodemag-com"
owner: "Documentation Team"
version: "1.0.0"
---

# Summarize VTI Content

Analyze the VTI (Video Training Index) file at **{{vti_file}}** and create a comprehensive outline that summarizes the content with timing information.

## Analysis Requirements

1. **Read the File**: Load and parse the content from {{vti_file}}
2. **Identify Structure**: Detect sections, topics, and subsections
3. **Extract Timing**: Find duration or timestamp information for each section
4. **Organize Content**: Create a hierarchical outline

## Output Format

Your output must be a structured outline in Markdown format:

### Document Overview
- **Title**: [Document/Video Title]
- **Total Duration**: [HH:MM:SS or minutes]
- **Main Topics**: [Count]

### Detailed Outline

```
## Section 1: [Title] (Duration: MM:SS)
   ### Key Points
   - [Point 1]
   - [Point 2]
   
   ### Subsection 1.1: [Title] (Duration: MM:SS)
   - [Detail 1]
   - [Detail 2]

## Section 2: [Title] (Duration: MM:SS)
   ### Key Points
   - [Point 1]
   - [Point 2]
```

### Summary Statistics
- Total sections: [count]
- Average section length: [MM:SS]
- Longest section: [title] ([duration])
- Shortest section: [title] ([duration])

## Processing Guidelines

- **Timing Formats**: Handle various formats (HH:MM:SS, MM:SS, minutes, timestamps)
- **Missing Durations**: If timing info is not explicit, estimate based on content or note as "Duration not specified"
- **Hierarchical Structure**: Preserve the document's organizational hierarchy
- **Key Concepts**: Extract and highlight the main learning objectives or topics
- **Context**: Include brief descriptions that convey what each section covers

## Quality Checks

- Ensure all sections have duration information (or note when unavailable)
- Verify the outline is logically organized and easy to scan
- Include timestamps or time markers if present in the source
- Total duration should sum correctly if calculable
