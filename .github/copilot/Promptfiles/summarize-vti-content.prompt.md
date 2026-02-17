---
name: summarize-vti-content
description: Generate a structured outline summary of VTT/VTI video transcript files with section durations and key topics

arguments:
  vti_file:
    type: string
    description: Path to the VTT or VTI transcript file to summarize

tags: ["documentation", "summarization", "video-transcripts", "training"]

ai_generated: true
model: "anthropic/claude-3.5-sonnet@2024-10-22"
operator: "johnmillerATcodemag-com"
chat_id: "summarize-video-content-20260217"
prompt: |
  Create a promptfile to summarize VTT/VTI video transcript content with sections and durations
started: "2026-02-17T19:36:00Z"
ended: "2026-02-17T19:45:00Z"
task_durations:
  - task: "requirements analysis"
    duration: "00:03:00"
  - task: "promptfile creation"
    duration: "00:06:00"
total_duration: "00:09:00"
ai_log: "ai-logs/2026/02/17/summarize-video-content-20260217/conversation.md"
source: "johnmillerATcodemag-com"
---

# Summarize VTT/VTI Content

Read the video transcript file at {{vti_file}} and generate a comprehensive structured outline that captures the content organization, timing, and key topics.

## Input Format Support

Handle these transcript formats:
- **VTT (WebVTT)**: Web Video Text Tracks format with timestamps
- **VTI**: Video Training Index format with sections and durations

## Required Output Structure

Your output MUST include:

### 1. Document Overview
```markdown
- **File**: [filename]
- **Format**: [VTT/VTI]
- **Total Duration**: [HH:MM:SS or MM:SS]
- **Main Sections**: [count]
```

### 2. Detailed Outline

For each major section found:

```markdown
## Section N: [Section Title] (Duration: MM:SS)

### Key Points
- [Main point 1]
- [Main point 2]
- [Main point 3]

### Subsections (if present)
- **Subsection N.1**: [Title] (Duration: MM:SS)
  - [Key content]
- **Subsection N.2**: [Title] (Duration: MM:SS)
  - [Key content]
```

### 3. Summary Statistics

```markdown
### Summary Statistics
- Total sections: [count]
- Average section length: [MM:SS]
- Longest section: [Section name] - [duration]
- Shortest section: [Section name] - [duration]
- Main topics covered: [list]
```

## Processing Guidelines

1. **Parse timestamps**: Extract timing from VTT format (HH:MM:SS.mmm --> HH:MM:SS.mmm) or VTI format
2. **Identify structure**: Recognize section boundaries from content, headers, or timing gaps
3. **Extract key content**: Summarize main points without losing important details
4. **Calculate durations**: Compute section lengths from timestamps
5. **Create hierarchy**: Build nested outline for subsections when present
6. **Handle missing data**: If duration info unavailable, indicate "Duration: Unknown"

## VTT-Specific Parsing

For WebVTT files:
- Look for cue timestamps: `HH:MM:SS.mmm --> HH:MM:SS.mmm`
- Extract text content between timestamps
- Group related content by timing proximity or topic
- Identify section boundaries from content changes or longer gaps

## Quality Requirements

- ✅ Preserve hierarchical structure
- ✅ Include all timing information found
- ✅ Use consistent formatting
- ✅ Keep summaries accurate and concise
- ✅ Maintain topic organization
- ❌ Don't hallucinate missing information
- ❌ Don't omit sections or durations
- ❌ Don't reorganize the original structure

## Example Output Format

```markdown
# Content Summary: GitHub Copilot Training

## Document Overview
- **File**: training-session.vtt
- **Format**: VTT
- **Total Duration**: 45:00
- **Main Sections**: 5

---

## Section 1: Introduction to Custom Agents (8:30)

### Key Points
- Custom agents extend GitHub Copilot with specialized behaviors
- Agents can have specific tools and instructions
- Available across multiple development environments

### Subsections
- **1.1**: What are Custom Agents? (4:00)
  - Definition and capabilities
- **1.2**: Benefits (4:30)
  - Task-specific optimization
  - Consistent workflows

---

## Section 2: Creating Your First Agent (12:15)

### Key Points
- Use .agent.md file extension
- YAML front matter for configuration
- Markdown body for instructions

[... additional sections ...]

---

### Summary Statistics
- Total sections: 5
- Average section length: 9:00
- Longest section: Section 2 (Creating Your First Agent) - 12:15
- Shortest section: Section 5 (Deployment) - 6:10
- Main topics covered: Custom agents, configuration, tools, best practices, deployment
```
