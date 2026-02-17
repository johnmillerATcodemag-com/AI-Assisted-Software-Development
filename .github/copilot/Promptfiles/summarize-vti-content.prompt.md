---
name: summarize-vti-content
description: Analyze VTI or VTT transcript files and generate a structured outline with section durations and content summary
arguments:
  vti_file:
    type: string
    description: Path to the VTI (Video Training Index) or VTT (WebVTT) transcript file to analyze
tags: ["documentation", "analysis", "transcript", "summary"]
ai_generated: true
model: "anthropic/claude-3.5-sonnet@2024-10-22"
operator: "johnmillerATcodemag-com"
chat_id: "create-vti-summarizer-20260217"
prompt: |
  Create a prompt that takes a VTI filename as a parameter that creates an outline that summarizes the content presented. Include the duration of each section.
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
---

# Summarize VTI/VTT Content

Read and analyze the file at `{{vti_file}}` and generate a comprehensive structured outline.

## Your Task

1. **Read the file** from the provided path
2. **Identify the format**:
   - **VTT (WebVTT)**: Video caption format with timestamps (e.g., `00:00:12.340 --> 00:00:15.430`)
   - **VTI (Video Training Index)**: Structured training content with section markers and durations
3. **Extract structure**:
   - Document title/overview
   - Main sections and subsections (hierarchical)
   - Duration information for each section
   - Key points and topics covered
4. **Generate output** in the format specified below

## Output Format

Produce a well-structured Markdown outline:

```markdown
# [Document Title]

## Overview
- **Total Duration**: [HH:MM:SS or MM:SS]
- **Sections**: [count]
- **Format**: [VTT/VTI]

---

## Section 1: [Section Name] (Duration: [HH:MM:SS])

### Key Topics
- [Topic 1]
- [Topic 2]
- [Topic 3]

### Subsections (if present)

#### Subsection 1.1: [Name] (Duration: [MM:SS])
- [Key point 1]
- [Key point 2]

#### Subsection 1.2: [Name] (Duration: [MM:SS])
- [Key point 1]
- [Key point 2]

---

## Section 2: [Section Name] (Duration: [HH:MM:SS])

[... continue for all sections ...]

---

## Summary Statistics
- **Total sections**: [count]
- **Average section length**: [MM:SS]
- **Longest section**: [Section name] - [duration]
- **Shortest section**: [Section name] - [duration]
```

## Processing Guidelines

### For VTT Files (WebVTT format)
- Parse timestamps to identify time spans
- Group content by logical topics based on content similarity
- Calculate durations from timestamp differences
- Extract speaker names if present (after timestamps)
- Preserve hierarchical relationships based on content patterns

### For VTI Files (Training Index format)
- Identify section markers (##, headers, or explicit section labels)
- Extract explicit duration information (e.g., "Duration: 8:30", "(12:15)", "45:00")
- Maintain document hierarchy as specified
- Extract topic lists and bullet points

### Duration Format Handling
Support multiple duration formats:
- **HH:MM:SS** (e.g., 01:23:45)
- **MM:SS** (e.g., 12:30)
- **Minutes** (e.g., "45 minutes", "8:30")
- **Seconds** (e.g., "90 seconds")

If duration is missing or cannot be determined:
- Note as `Duration: Not specified`
- Calculate from timestamps if VTT format
- Do not fabricate duration data

## Quality Requirements

- ✅ Preserve all hierarchical structure from source
- ✅ Include all major topics and subtopics
- ✅ Calculate accurate durations where possible
- ✅ Use consistent formatting throughout
- ✅ Provide complete summary statistics
- ✅ Handle missing duration data gracefully
- ✅ Identify and handle both VTT and VTI formats correctly

## Example Recognition Patterns

### VTT Format Recognition
```
WEBVTT

00:00:12.340 --> 00:00:15.430
Hello and welcome to this training session.

00:00:15.430 --> 00:00:20.120
Today we'll cover GitHub Copilot features.
```

### VTI Format Recognition
```
## Section 1: Introduction (8:30)

### What are Custom Agents?
- Custom agents extend GitHub Copilot
- Available across multiple environments
```

Parse the file and generate the structured outline following these guidelines.
