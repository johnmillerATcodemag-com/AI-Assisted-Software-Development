# VTT Content Summarizer - Live Demo

This document demonstrates the `summarize-vti-content` promptfile in action.

## Demo Scenario

We have a recording from "AI-Assisted Software Development with GitHub Copilot (Mon Afternoon)" that needs to be analyzed and summarized for quick reference.

## Step 1: Input File

**Location**: `past-class-recordings/2026-02/AI-Assisted Software Development with GitHub Copilot (Mon Afternoon).vtt`

**File Type**: WebVTT (Video Text Track)

**Content Sample**:
```vtt
WEBVTT

00:00:00.000 --> 00:00:05.000
Welcome everyone to AI-Assisted Software Development with GitHub Copilot.

00:00:05.001 --> 00:00:12.000
Today we'll explore how AI can enhance your development workflow
and increase productivity.

00:00:12.001 --> 00:00:18.000
Let's start with the basics. GitHub Copilot is an AI pair programmer
that helps you write code faster.
...
```

**Total Duration**: 5 minutes 50 seconds
**Total Cues**: 160 lines

## Step 2: Running the Promptfile

### Command

```
/run summarize-vti-content vti_file="past-class-recordings/2026-02/AI-Assisted Software Development with GitHub Copilot (Mon Afternoon).vtt"
```

### What Happens

The promptfile:
1. ✅ Reads the VTT file
2. ✅ Parses timestamps and content
3. ✅ Identifies topic transitions
4. ✅ Groups content into logical sections
5. ✅ Calculates section durations
6. ✅ Extracts key points and quotes
7. ✅ Generates structured markdown output

## Step 3: Generated Output

**Output File**: `AI-Assisted Software Development with GitHub Copilot (Mon Afternoon)-summary.md`

### Executive Summary Generated

```markdown
**Session**: Monday Afternoon
**Duration**: 5 minutes 50 seconds
**Format**: Lecture with live demonstrations

This introductory session covered the fundamentals of AI-assisted 
development using GitHub Copilot. The instructor demonstrated 
installation, basic features, and best practices, with a focus on 
context understanding and security considerations.

**Key Takeaways:**
- GitHub Copilot is an AI pair programmer powered by OpenAI Codex
- Context is crucial for getting relevant suggestions
- Clear comments and meaningful names improve AI assistance quality
- Always review AI suggestions for security vulnerabilities
- Testing can be significantly accelerated with AI assistance
```

### Section Breakdown Generated

```markdown
### Section 1: Introduction and Setup (00:00 - 00:55, Duration: 00:55)

**Key Points:**
- Course introduction and objectives
- GitHub Copilot overview and capabilities
- Installation requirements: VS Code or JetBrains IDE + subscription
- Live demonstration of extension installation

**Notable Quotes:**
- "GitHub Copilot is an AI pair programmer that helps you write code faster"
- "It's trained on billions of lines of public code"
```

### Timeline Reference Generated

```
00:00 - 00:55 | Introduction, Setup, and Installation Demo
00:55 - 01:42 | Basic Features and Inline Suggestions
01:42 - 02:45 | Context Understanding and Best Practices
02:45 - 03:33 | Advanced Features - Copilot Chat Demo
03:38 - 04:26 | Automated Testing with Copilot
04:26 - 05:50 | Security Considerations and Wrap-up
```

### Content Analysis Generated

```markdown
**Difficulty Level**: Beginner to Intermediate

**Primary Topics**:
- GitHub Copilot installation and setup
- Inline code suggestions and shortcuts
- Context awareness in AI assistance
- Best practices for AI-assisted development
- Copilot Chat for code review
- Automated test generation
- Security considerations in AI-generated code

**Prerequisites Mentioned**:
- Basic programming knowledge
- Familiarity with VS Code or JetBrains IDEs
- Understanding of basic software development concepts
```

## Step 4: Benefits Demonstrated

### Time Savings
- **Manual Review**: 5:50 video → ~30 minutes to watch and take notes
- **With Summarizer**: 5:50 video → ~2 minutes to review summary
- **Time Saved**: ~28 minutes (93% reduction)

### Content Navigation
- Quick reference timeline for jumping to specific topics
- Section-by-section breakdown for focused review
- Key quotes extracted for easy reference

### Learning Enhancement
- Difficulty level assessment helps set expectations
- Prerequisites identified upfront
- Action items clearly listed

### Documentation Quality
- Consistent structure across all recordings
- Machine-readable metadata (YAML front matter)
- Easy to search and index

## Step 5: Use Cases

### For Students
- Quick review before exams
- Finding specific topics without rewatching
- Creating study guides

### For Instructors
- Quality assurance of content coverage
- Identifying pacing issues
- Creating course summaries

### For Content Teams
- Creating video descriptions
- Generating chapter markers
- Building search indices

## Demonstration Files

All files for this demo are available in this repository:

1. **Input**: `past-class-recordings/2026-02/AI-Assisted Software Development with GitHub Copilot (Mon Afternoon).vtt`
2. **Output**: `past-class-recordings/2026-02/AI-Assisted Software Development with GitHub Copilot (Mon Afternoon)-summary.md`
3. **Promptfile**: `.github/copilot/Promptfiles/summarize-vti-content.prompt.md`

## Try It Yourself

1. Place your own VTT file in `past-class-recordings/YYYY-MM/`
2. Run: `/run summarize-vti-content vti_file="path/to/your/file.vtt"`
3. Review the generated summary

## Expected Results

For any VTT file, you should get:
- ✅ Executive summary (2-3 paragraphs)
- ✅ 3-5 key takeaways
- ✅ Detailed section breakdowns (5-15 minute chunks)
- ✅ Quick-reference timeline
- ✅ Content difficulty assessment
- ✅ List of topics, prerequisites, and resources
- ✅ Action items or homework

## Notes

- The promptfile works best with clear, well-formatted VTT files
- Longer videos are automatically segmented into manageable sections
- The analysis adapts to the content type (lecture, discussion, demo, etc.)
- Generated summaries follow a consistent markdown format

## Next Steps

See [USAGE.md](USAGE.md) for:
- Detailed usage instructions
- Troubleshooting tips
- Advanced features
- Best practices
