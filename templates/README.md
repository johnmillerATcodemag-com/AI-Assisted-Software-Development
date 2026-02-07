# PowerPoint Templates for Pandoc

Pandoc's PowerPoint output has limited direct styling capabilities. For professional formatting, use a **reference document** approach.

## How Reference Templates Work

1. **Create a template PowerPoint file** with your desired:
   - Master slide layouts
   - Fonts and color schemes
   - Logo and branding
   - Background designs

2. **Save as `.pptx`** in this templates directory

3. **Reference in pandoc command:**
   ```bash
   pandoc --reference-doc=templates/your-template.pptx input.md -o output.pptx
   ```

## Creating a Custom Template

### Option 1: Start from Existing Presentation

1. Open an existing PowerPoint presentation with your desired styling
2. Delete all content slides (keep only master layouts)
3. Save as `custom-slide-template.pptx`

### Option 2: Modify Default Template

1. Create a basic presentation with pandoc:
   ```bash
   pandoc Slides/individual-slides/github-worktrees-guide.md -o temp-template.pptx
   ```
2. Open in PowerPoint and modify:
   - Go to View > Slide Master
   - Customize fonts, colors, layouts
   - Add logos or branding elements
3. Save as your template

## Using Templates

### Update slides-to-pptx.yaml

```yaml
# PowerPoint template reference
reference-doc: "templates/custom-slide-template.pptx"
```

### Command Line Usage

```bash
# With defaults file
pandoc --defaults=slides-to-pptx input.md -o output.pptx

# Direct reference
pandoc --reference-doc=templates/custom-slide-template.pptx input.md -o output.pptx
```

## Template Files

- **`reference-template.pptx`** - Working pandoc-compatible PowerPoint template (generated from pandoc defaults)
- `custom-slide-template.pptx` - Main presentation template (create this)
- `simple-template.pptx` - Minimal corporate template (create if needed)

## Important: Template Compatibility

⚠️ **Issue**: `.potx` (PowerPoint template) files don't work as pandoc reference documents and can cause corruption errors.

✅ **Solution**: Use `.pptx` (PowerPoint presentation) files as reference documents.

### Converting .potx to .pptx
If you have a `.potx` file:
1. Open the `.potx` file in PowerPoint
2. Save As > PowerPoint Presentation (.pptx) 
3. Use the .pptx file as your reference document

## Troubleshooting

**PowerPoint Corruption Errors**:
- Ensure reference template is `.pptx`, not `.potx`
- Test template first: `pandoc --reference-doc=templates/test.pptx simple.md -o test.pptx`
- Use pandoc-generated reference as starting point if issues persist

**Template Not Applied**:
- Verify file path is correct
- Check template file permissions
- Ensure template contains slide master layouts

## Note

Your Marp slide content and speaker notes (`::: notes`) will be preserved regardless of the template used. The template only affects visual styling and master layouts.
