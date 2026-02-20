# Past Class Recordings

This directory contains VTT (Video Text Track) files from past class sessions.

## Directory Structure

```
past-class-recordings/
├── YYYY-MM/
│   ├── [Class Name] ([Day] [Time Period]).vtt
│   └── [Class Name] ([Day] [Time Period])-summary.md
└── README.md
```

## VTT File Format

VTT (WebVTT - Web Video Text Tracks) files contain timed text data, typically transcriptions of video content. These files can be analyzed using the `summarize-vti-content` promptfile.

## Usage

To generate a summary of a VTT file:

1. Place your VTT file in the appropriate year-month subdirectory
2. Use the summarize-vti-content promptfile:
   ```
   /run summarize-vti-content vti_file="past-class-recordings/YYYY-MM/[filename].vtt"
   ```
3. The analysis will be saved as `[filename]-summary.md` in the same directory

## File Naming Convention

- Format: `[Course Name] ([Day] [Time Period]).vtt`
- Examples:
  - `AI-Assisted Software Development with GitHub Copilot (Mon Afternoon).vtt`
  - `Advanced Python Programming (Wed Evening).vtt`

## Privacy Note

VTT files may contain transcriptions of class discussions. Ensure you have appropriate permissions before storing or sharing these files.

## Supported Operations

- **Analysis**: Use `summarize-vti-content.prompt.md` to generate structured outlines
- **Search**: VTT files are plain text and can be searched with standard tools
- **Conversion**: VTT can be converted to SRT or other subtitle formats if needed
