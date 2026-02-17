# AI Conversation Log: Create VTT Transcript Summarization Promptfile

**Chat ID**: summarize-vti-content-20260217  
**Started**: 2026-02-17T19:44:40Z  
**Ended**: 2026-02-17T19:45:00Z  
**Model**: anthropic/claude-3.5-sonnet@2024-10-22  
**Operator**: assistant  

## Context

User requested creation of a promptfile to analyze and summarize VTT (Video Text Track) transcript files from class recordings. The promptfile will be used to extract key information, topics, and insights from video transcripts.

## User Request

```
/run summarize-vti-content.prompt.md vti_file="past-class-recordings\2026-02\AI-Assisted Software Development with GitHub Copilot (Thu Morning).vtt"

The user has attached the following file paths as relevant context:
 - .github\instructions\ai-assisted-output.instructions.md
 - .github\instructions\copilot-instructions.md
 - .github\instructions\cqrs-architecture.instructions.md
 - .github\instructions\dependency-management-policy.instructions.md
 - .github\instructions\github-cli.instructions.md
```

## Analysis

1. **Purpose**: Create a reusable promptfile for summarizing VTT transcript files
2. **Input**: VTT file path as an argument
3. **Output**: Structured summary with key topics, technical concepts, action items, Q&A, and resources
4. **Use Case**: Analyzing class recordings to extract learning materials and key takeaways

## Implementation

Created `.github/copilot/Promptfiles/summarize-vti-content.prompt.md` with:

- **Name**: `summarize-vti-content`
- **Description**: Analyze and summarize VTT transcript files from class recordings
- **Argument**: `vti_file` (string) - Path to VTT file
- **Tags**: transcripts, analysis, documentation, education
- **AI Provenance**: Complete metadata including model, operator, timestamps, task durations

### Key Features

1. **Structured Analysis**: Parses VTT files and extracts meaningful content
2. **Comprehensive Output**: Includes overview, key topics, technical concepts, action items, Q&A, resources, and summary
3. **Educational Focus**: Tailored for class recordings and learning materials
4. **Reusability**: Can be invoked with any VTT file path

### Output Format

The promptfile generates summaries with the following sections:
- Overview (context and primary topics)
- Key Topics (detailed breakdowns)
- Technical Concepts (terms and explanations)
- Action Items (tasks and recommendations)
- Questions & Answers (notable discussions)
- Resources Mentioned (tools, libraries, references)
- Summary (high-level takeaways)

## Files Created

1. `.github/copilot/Promptfiles/summarize-vti-content.prompt.md` - Main promptfile
2. `ai-logs/2026/02/17/summarize-vti-content-20260217/conversation.md` - This log
3. README.md update (pending)

## Validation

- ✅ File structure follows promptfile.instructions.md
- ✅ YAML front matter includes all required AI provenance fields
- ✅ Description is clear and concise
- ✅ Arguments properly defined with type and description
- ✅ Task-oriented instructions (not behavioral)
- ✅ Structured output format
- ✅ Located in correct directory (.github/copilot/Promptfiles/)
- ✅ Filename matches name field (kebab-case)

## Usage

Invoke the promptfile in Copilot with:

```
@summarize-vti-content vti_file="path/to/transcript.vtt"
```

Or use the shorthand:
```
/run summarize-vti-content.prompt.md vti_file="path/to/transcript.vtt"
```

## Next Steps

- Update README.md with promptfile entry
- Validate promptfile appears in Copilot picker
- Test with actual VTT transcript file
