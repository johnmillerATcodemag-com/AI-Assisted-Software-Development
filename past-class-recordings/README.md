# Past Class Recordings

This directory contains video transcript files (VTT format) from past training sessions.

## Directory Structure

- `2026-02/` - Recordings from February 2026
  - `AI-Assisted Software Development with GitHub Copilot (Wed Morning).vtt` - WebVTT transcript from the Wednesday morning session covering custom agents, promptfiles, and best practices

## File Formats

### VTT (WebVTT)

WebVTT files contain timestamped captions/transcripts with the following structure:

```
WEBVTT
Kind: captions
Language: en

HH:MM:SS.mmm --> HH:MM:SS.mmm
Caption text line 1
Caption text line 2

HH:MM:SS.mmm --> HH:MM:SS.mmm
Next caption text
```

## Processing Transcripts

Use the `summarize-vti-content` promptfile to generate hierarchical outlines:

```
@summarize-vti-content vti_file="past-class-recordings/2026-02/AI-Assisted Software Development with GitHub Copilot (Wed Morning).vtt"
```

This will create a structured outline with:
- Section headings
- Duration information
- Key points summary
- Statistics (total duration, section counts)

## Related Resources

- `.github/copilot/Promptfiles/summarize-vti-content.prompt.md` - Promptfile for processing transcripts
- `docs/sample-training.vti` - Sample VTI format file
- `docs/vti-summarizer-example.md` - Example output from the summarizer
