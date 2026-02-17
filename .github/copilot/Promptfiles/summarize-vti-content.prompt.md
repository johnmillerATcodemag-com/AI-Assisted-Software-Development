---
name: summarize-vti-content
description: Generate hierarchical outline with durations from VTI or VTT transcript files

arguments:
  vti_file:
    type: string
    description: Path to the VTI or VTT file to summarize

tags: ["documentation", "analysis", "training", "transcript"]

ai_generated: true
model: "anthropic/claude-3.5-sonnet@2024-10-22"
operator: "johnmillerATcodemag-com"
chat_id: "summarize-vti-content-20260217"
prompt: |
  /run summarize-vti-content.prompt.md vti_file="past-class-recordings\2026-02\AI-Assisted Software Development with GitHub Copilot (Wed Morning).vtt"
started: "2026-02-17T19:36:00Z"
ended: "2026-02-17T19:50:00Z"
task_durations:
  - task: "repository exploration and format analysis"
    duration: "00:05:00"
  - task: "promptfile design and creation"
    duration: "00:09:00"
total_duration: "00:14:00"
ai_log: "ai-logs/2026/02/17/summarize-vti-content-20260217/conversation.md"
source: "johnmillerATcodemag-com"
---

# Summarize VTI/VTT Content

Read the file at `{{vti_file}}` and generate a hierarchical outline that summarizes the content with section durations.

## Task

1. **Read the file**: Load content from the provided file path
2. **Identify format**: Detect if file is VTI (custom training format) or VTT (WebVTT caption format)
3. **Extract structure**: Parse sections, topics, and timing information
4. **Generate outline**: Create a scannable hierarchical outline

## Format Handling

### VTI Format
- Custom training/documentation format
- Sections marked with `##` headings
- Duration in parentheses: `Section Title (MM:SS)` or `Section Title (HH:MM:SS)`
- Subsections with `###` headings
- Bullet points for key content

### VTT (WebVTT) Format
- Standard caption/subtitle format
- Timestamps: `HH:MM:SS.mmm --> HH:MM:SS.mmm`
- Text content after timestamps
- Cue identifiers and metadata
- Group content by logical sections based on timing and content patterns

## Output Format

Generate a structured outline in Markdown:

```markdown
### Document Overview
- **Source**: [filename]
- **Format**: [VTI/VTT]
- **Total Duration**: [HH:MM:SS or MM:SS]
- **Main Sections**: [count]

### Detailed Outline

## Section 1: [Title] (Duration: HH:MM:SS)
   ### Key Points
   - [Point 1]
   - [Point 2]
   
   ### Subsection 1.1: [Title] (Duration: MM:SS)
   - [Content summary]
   
   ### Subsection 1.2: [Title] (Duration: MM:SS)
   - [Content summary]

## Section 2: [Title] (Duration: HH:MM:SS)
   [Continue pattern...]

### Summary Statistics
- Total sections: [count]
- Average section length: [duration]
- Longest section: [title] - [duration]
- Shortest section: [title] - [duration]
```

## Quality Guidelines

- **Preserve hierarchy**: Maintain the original document structure
- **Extract durations**: Include all available timing information
- **Summarize clearly**: Use concise bullet points for key content
- **Calculate totals**: Provide aggregate duration statistics
- **Handle missing data**: If durations are not available, note "Duration: Not specified"
- **Be consistent**: Use uniform formatting throughout

## Special Instructions for VTT Files

When processing VTT files:
1. Group consecutive captions into logical sections based on content breaks
2. Calculate section durations from timestamp ranges
3. Identify topic changes by analyzing content patterns
4. Extract speaker names if present (e.g., "John: " prefix)
5. Merge related captions into cohesive summaries
6. Note: VTT files may require more interpretation than structured VTI files

## Processing Steps

1. Read the file content
2. Detect format (VTI vs VTT)
3. Parse sections and extract timing
4. Build hierarchical structure
5. Calculate statistics
6. Generate formatted outline
7. Include overview and summary
