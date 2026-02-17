---
ai_generated: true
model: "anthropic/claude-3.5-sonnet@2024-10-22"
operator: "github-copilot-agent"
chat_id: "summarize-vti-content-20260217"
prompt: |
  Create a promptfile to summarize VTT (Video Text Tracks) and VTI (training content) files.
  The promptfile should extract key topics, generate structured summaries, and identify main sections.
started: "2026-02-17T19:47:00Z"
ended: "2026-02-17T19:50:00Z"
task_durations:
  - task: "promptfile design and creation"
    duration: "00:03:00"
total_duration: "00:03:00"
ai_log: "ai-logs/2026/02/17/summarize-vti-content-20260217/conversation.md"
source: "github-copilot-agent"

# Core Promptfile Fields
name: summarize-vti-content
description: Summarize VTT/VTI training content files and extract key topics with timestamps

# Arguments
arguments:
  vti_file:
    type: string
    description: Path to the VTT or VTI file to summarize

# Tags
tags: ["training", "summarization", "content-analysis", "documentation"]

# Metadata
owner: "Training Team"
version: "1.0.0"
created: "2026-02-17"
---

# Summarize VTT/VTI Training Content

Analyze the VTT (Video Text Tracks) or VTI (training content) file at {{vti_file}} and create a comprehensive structured summary.

## Your Task

1. **Read the file** at {{vti_file}}
2. **Identify the format**:
   - VTT files have WEBVTT header and timestamp format: `HH:MM:SS.mmm --> HH:MM:SS.mmm`
   - VTI files have markdown structure with sections, timestamps in parentheses, and topic hierarchies
3. **Extract and organize content**

## Output Format

Create a structured summary following this format:

### Overview
- **Duration**: [Total duration from timestamps]
- **File Format**: [VTT or VTI]
- **Main Topic**: [Primary subject matter]
- **Number of Sections**: [Count of major sections]

---

### Content Summary

For each major section or topic:

#### Section N: [Section Title] ([Duration or Timestamp])

**Key Points**:
- [Bullet point 1]
- [Bullet point 2]
- [Bullet point 3]

**Subtopics**:
- [Subtopic 1]: [Brief description]
- [Subtopic 2]: [Brief description]

**Important Timestamps**:
- `[HH:MM:SS]`: [What happens at this time]
- `[HH:MM:SS]`: [What happens at this time]

---

### Key Takeaways

List 3-5 main takeaways from the entire content:

1. [Major concept or lesson 1]
2. [Major concept or lesson 2]
3. [Major concept or lesson 3]

---

### Topics Covered

Categorized list of all topics discussed:

**Core Topics**:
- [Topic 1]
- [Topic 2]

**Advanced Topics**:
- [Topic 1]
- [Topic 2]

**Tools/Technologies Mentioned**:
- [Tool 1]
- [Tool 2]

---

### Suggested Use Cases

Based on the content, suggest how this material could be used:

- [Use case 1]
- [Use case 2]
- [Use case 3]

## Guidelines

- **Be comprehensive**: Capture all major topics and subtopics
- **Preserve structure**: Maintain the logical flow of the original content
- **Include timestamps**: Reference important moments with their timestamps
- **Be concise**: Summarize without losing essential details
- **Identify patterns**: Look for recurring themes or concepts
- **Note expertise level**: Indicate if content is beginner, intermediate, or advanced
- **Extract examples**: Include any code examples or demonstrations mentioned
- **Highlight resources**: Note any referenced documentation, tools, or external resources

## Special Handling

**For VTT files**:
- Parse WebVTT format with timestamp ranges
- Group related caption entries into logical topics
- Identify natural breaks or topic transitions
- Estimate section durations from timestamps

**For VTI files**:
- Follow the markdown section hierarchy
- Extract duration information from section headers
- Preserve the numbered section structure
- Extract subsection details with their timestamps

## Quality Checks

Before completing the summary, ensure:

- [ ] All major sections are covered
- [ ] Timestamps are accurate and formatted consistently
- [ ] Key concepts are clearly identified
- [ ] Summary is well-organized and easy to navigate
- [ ] Technical terms are properly captured
- [ ] Duration calculations are correct
- [ ] Topic categorization makes sense
