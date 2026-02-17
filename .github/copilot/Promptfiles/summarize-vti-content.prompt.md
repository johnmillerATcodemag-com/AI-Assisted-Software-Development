---
name: summarize-vti-content
description: Summarize video training transcript (VTI/VTT) files into structured learning content

arguments:
  vti_file:
    type: string
    description: Path to the VTI or VTT file to summarize

tags: ["documentation", "training", "summarization", "video-transcripts"]
owner: "johnmillerATcodemag-com"
version: "1.0.0"

# AI Provenance
ai_generated: true
model: "anthropic/claude-3.5-sonnet@2024-10-22"
operator: "johnmillerATcodemag-com"
chat_id: "summarize-vti-content-20260217"
prompt: |
  /run summarize-vti-content.prompt.md vti_file="past-class-recordings\2026-02\AI-Assisted Software Development with GitHub Copilot (Fri Afternoon).vtt"
  
  Create a promptfile that can summarize VTI/VTT content files (video training transcripts).
started: "2026-02-17T19:42:33Z"
ended: "2026-02-17T19:50:00Z"
task_durations:
  - task: "requirements analysis"
    duration: "00:02:00"
  - task: "promptfile creation"
    duration: "00:05:00"
  - task: "validation and testing"
    duration: "00:01:00"
total_duration: "00:08:00"
ai_log: "ai-logs/2026/02/17/summarize-vti-content-20260217/conversation.md"
source: "problem-statement"
---

# Summarize VTI/VTT Content

Read and analyze the video training transcript file at {{vti_file}} and generate a structured summary of the training content.

## Analysis Requirements

1. **Read the File**: Load the complete content from {{vti_file}}
2. **Extract Structure**: Identify sections, topics, and key points
3. **Analyze Timing**: Note duration of major sections if available
4. **Capture Details**: Extract important concepts, techniques, and examples

## Output Structure

Your summary must include:

### Overview
- **Title**: Training session name
- **Total Duration**: If available from timestamps
- **Number of Topics**: Count of main sections

### Section Summaries
For each major section/topic:
- **Section Title**: Clear descriptive name
- **Duration**: Time allocation (if available)
- **Key Points**: 3-5 bullet points covering:
  - Main concepts taught
  - Techniques or methods explained
  - Examples or demonstrations shown
  - Important terminology introduced

### Key Takeaways
- List 5-7 most important lessons or concepts
- Highlight practical skills or knowledge gained
- Note any prerequisites or follow-up topics mentioned

### Technical Details (if applicable)
- Tools or technologies covered
- Commands or code examples demonstrated
- Configuration or setup instructions
- Best practices mentioned

## Formatting Guidelines

- Use clear headings and subheadings
- Use bullet points for lists
- Include duration indicators: `(MM:SS)` or `(HH:MM:SS)`
- Use **bold** for important terms
- Use `code formatting` for technical terms, commands, or file names
- Keep summaries concise but comprehensive

## Example Output Structure

```markdown
# [Training Title]

## Overview
- Duration: XX:XX
- Topics: X

---

## Section 1: [Topic Name] (XX:XX)

### [Subsection]
- Key point 1
- Key point 2
- Key point 3

---

## Section 2: [Topic Name] (XX:XX)

### [Subsection]
- Key point 1
- Key point 2

---

## Key Takeaways
1. Main concept or skill
2. Important technique
3. Critical best practice

## Technical Details
- Tool: Description
- Command: `example-command`
```

## Quality Criteria

- Accurate representation of content
- Logical organization matching original structure
- Complete coverage of all major topics
- Actionable and useful for learners
- Proper technical terminology
- Clear and concise language
