---
name: summarize-vti-content
description: Summarize training content from VTI/VTT transcript files with key topics, takeaways, and structured insights

arguments:
  vti_file:
    type: string
    description: Path to the VTI or VTT file to summarize

tags: ["summarization", "training", "documentation", "analysis"]

# AI Provenance Metadata
ai_generated: true
model: "anthropic/claude-3.5-sonnet@2024-10-22"
operator: "johnmillerATcodemag-com"
chat_id: "summarize-vti-content-20260217"
prompt: |
  /run summarize-vti-content.prompt.md vti_file="past-class-recordings\2026-02\AI-Assisted Software Development with GitHub Copilot (Wed Afternoon).vtt"
started: "2026-02-17T19:44:24Z"
ended: "2026-02-17T19:50:00Z"
task_durations:
  - task: "requirements analysis and template review"
    duration: "00:02:00"
  - task: "promptfile creation"
    duration: "00:03:00"
  - task: "documentation and testing"
    duration: "00:01:00"
total_duration: "00:06:00"
ai_log: "ai-logs/2026/02/17/summarize-vti-content-20260217/conversation.md"
source: "copilot/summarize-ai-assisted-session"

prompt_metadata:
  id: summarize-vti-content
  title: VTI/VTT Content Summarization
  owner: johnmillerATcodemag-com
  version: "1.0.0"
  created: "2026-02-17"
  updated: "2026-02-17"
  output_format: markdown
  category: summarization
---

# Summarize VTI/VTT Content

Analyze and summarize training content from VTI (Video Training Index) or VTT (Video Text Track) transcript files.

## Input

Read the content from: **{{vti_file}}**

## Analysis Tasks

1. **Extract Key Information**
   - Total duration and number of topics/sections
   - Main themes and subject areas
   - Important timestamps and sections

2. **Generate Structured Summary**
   - Overview of the training content
   - Key concepts covered per section
   - Important takeaways and learning objectives
   - Notable examples or demonstrations

3. **Identify Key Moments**
   - Critical concepts introduced
   - Best practices highlighted
   - Common pitfalls or anti-patterns discussed
   - Practical tips or recommendations

## Output Format

### 📋 Overview

- **Title**: [Training topic]
- **Duration**: [Total time]
- **Sections**: [Number of sections]
- **Primary Topics**: [List main topics]

### 📚 Section Summaries

For each section, provide:
- **Section Title** (timestamp)
- **Key Concepts**: 3-5 bullet points
- **Main Takeaway**: One-sentence summary

### 💡 Key Insights

- Most important concepts to remember
- Critical best practices
- Common mistakes to avoid
- Practical applications

### 🎯 Quick Reference

- Essential commands/tools mentioned
- Important terminology defined
- Recommended resources or next steps

### ⏱️ Time-Indexed Topics

Quick reference table:
| Timestamp | Topic | Description |
|-----------|-------|-------------|
| [time] | [topic] | [brief description] |

## Instructions

- Keep summaries concise and actionable
- Use clear, technical language appropriate to the content
- Highlight practical applications and examples
- Organize information for easy scanning and reference
- Include relevant code snippets or commands if present in the content
