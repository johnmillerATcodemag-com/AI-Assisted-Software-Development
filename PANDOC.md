# Pandoc Configuration Files

This directory contains pandoc defaults files for standardized document conversion.

## Files

- **`pandoc-defaults.yaml`** - Comprehensive defaults with configurations for multiple output formats
- **`slides-to-pptx.yaml`** - Optimized for converting Marp slides to PowerPoint presentations
- **`to-pdf.yaml`** - Optimized for converting slides and documentation to PDF

## Usage Examples

### Convert Marp slides to PowerPoint

```bash
pandoc --defaults=slides-to-pptx Slides/individual-slides/github-worktrees-guide.md -o github-worktrees-guide.pptx
```

### Convert documentation to PDF

```bash
pandoc --defaults=to-pdf README.md -o project-overview.pdf
```

### Using the comprehensive defaults (specify output format)

```bash
pandoc --defaults=pandoc-defaults.yaml --to=pptx input.md -o output.pptx
pandoc --defaults=pandoc-defaults.yaml --to=pdf input.md -o output.pdf
```

## Configuration Details

### slides-to-pptx.yaml

- Optimized for Marp slide deck conversion
- Handles speaker notes (`::: notes` syntax)
- Professional styling with Calibri fonts
- GitHub-style code highlighting
- Slide numbering and controls enabled

### to-pdf.yaml

- Uses XeLaTeX engine for better Unicode support
- Letter size with 0.75in margins
- Calibri/Arial font stack
- Code syntax highlighting
- LaTeX packages for better formatting

### pandoc-defaults.yaml

- Multi-format configuration file
- Separate sections for PowerPoint, PDF, HTML, Word, and slides
- Comprehensive typography and styling options
- Bootstrap CSS for HTML output
- Reveal.js configuration for web slides

## PowerPoint Template Limitation

**Important**: Pandoc's PowerPoint output has limited direct styling capabilities. Font, color, and background settings in YAML files are largely ignored.

**Better Approach**: Use a reference template:

1. Create a PowerPoint template file with your desired styling
2. Save it in the `templates/` directory
3. Reference it in the conversion:

```bash
# Method 1: Update slides-to-pptx.yaml
# Uncomment and set: reference-doc: "templates/your-template.pptx"
pandoc --defaults=slides-to-pptx input.md -o output.pptx

# Method 2: Direct reference
pandoc --reference-doc=templates/your-template.pptx input.md -o output.pptx
```

See [`templates/README.md`](templates/README.md) for detailed instructions on creating PowerPoint templates.

## Requirements

- **pandoc** (version 2.11+)
- **XeLaTeX** (for PDF output)
- **Fonts**: Calibri, Arial, Consolas (typically available on Windows)

## Customization

Edit the YAML files to:

- Change fonts and font sizes
- Modify page layouts and margins
- Add custom CSS styles
- Configure slide themes and transitions
- Add or remove pandoc extensions
