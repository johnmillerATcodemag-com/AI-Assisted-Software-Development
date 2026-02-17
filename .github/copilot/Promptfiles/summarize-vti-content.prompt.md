---
name: summarize-vti-content
description: Analyze and summarize VTT (Video Text Track) transcript files from class recordings

arguments:
  vti_file:
    type: string
    description: Path to the VTT transcript file to analyze

tags: ["transcripts", "analysis", "documentation", "education"]

# AI Provenance Metadata
ai_generated: true
model: "anthropic/claude-3.5-sonnet@2024-10-22"
operator: "assistant"
chat_id: "summarize-vti-content-20260217"
prompt: |
  /run summarize-vti-content.prompt.md vti_file="past-class-recordings\2026-02\AI-Assisted Software Development with GitHub Copilot (Thu Morning).vtt"
  
  The user has attached the following file paths as relevant context:
   - .github\instructions\ai-assisted-output.instructions.md
   - .github\instructions\copilot-instructions.md
   - .github\instructions\cqrs-architecture.instructions.md
   - .github\instructions\dependency-management-policy.instructions.md
   - .github\instructions\github-cli.instructions.md
started: "2026-02-17T19:44:40Z"
ended: "2026-02-17T19:45:00Z"
task_durations:
  - task: "promptfile creation"
    duration: "00:00:20"
total_duration: "00:00:20"
ai_log: "ai-logs/2026/02/17/summarize-vti-content-20260217/conversation.md"
source: "assistant"
---

# Summarize VTT Transcript Content

Analyze the VTT (Video Text Track) transcript file at `{{vti_file}}` and produce a comprehensive summary.

## Your Task

1. **Read and Parse**: Load the VTT file and extract the transcript content, ignoring timing codes
2. **Identify Structure**: Detect major topics, sections, and theme transitions
3. **Extract Key Points**: Identify main concepts, decisions, action items, and important discussions
4. **Summarize**: Create a well-structured summary document

## Output Format

Your summary must include:

### Overview
- Brief description of the content (2-3 sentences)
- Date/context of the recording (if mentioned)
- Primary topics covered

### Key Topics
For each major topic discussed:
- **Topic Name**
  - Main points covered
  - Important details or examples
  - Decisions made or conclusions reached

### Technical Concepts
- List of technical terms, tools, or methodologies discussed
- Brief explanation of each in context

### Action Items
- Any tasks, assignments, or follow-ups mentioned
- Recommendations or best practices shared

### Questions & Answers
- Notable questions raised
- Answers or discussions around them

### Resources Mentioned
- Tools, libraries, documentation references
- URLs or specific resources cited

### Summary
- High-level takeaways (3-5 bullet points)
- Next steps or future topics mentioned

## Guidelines

- Focus on content clarity and organization
- Preserve technical accuracy
- Highlight practical applications and examples
- Note any demonstrations or live coding segments
- Identify patterns or recurring themes
- Use clear headings and bullet points
- Maintain educational context
