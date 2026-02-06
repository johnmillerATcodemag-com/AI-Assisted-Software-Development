# Canonical AI Instructions

**⚠️ SINGLE SOURCE OF TRUTH ⚠️**

This folder contains the canonical versions of all AI-assisted development instructions for the AIASD ecosystem.

## Files in this folder:

| File                                                                                   | Purpose                       | Description                                                             |
| -------------------------------------------------------------------------------------- | ----------------------------- | ----------------------------------------------------------------------- |
| [`ai-assisted-output.instructions.md`](ai-assisted-output.instructions.md)             | AI Provenance Policy          | Main AI provenance and logging policy with chat management requirements |
| [`business-rules-to-slices.instructions.md`](business-rules-to-slices.instructions.md) | Vertical Slice Guidelines     | Convert business rules into vertical slice implementations              |
| [`chatmode-file.instructions.md`](chatmode-file.instructions.md)                       | Chat Mode Authoring           | Guidelines for creating custom GitHub Copilot chat modes                |
| [`instruction-files.instructions.md`](instruction-files.instructions.md)               | Instruction Standards         | Standards for creating and maintaining instruction files                |
| [`instruction-prompt-files.instructions.md`](instruction-prompt-files.instructions.md) | Instruction Prompt Guidelines | Creating prompts that generate instruction files                        |
| [`marp-slides.instructions.md`](marp-slides.instructions.md)                           | Slide Creation                | Guidelines for creating Marp-based presentation slides                  |
| [`prompt-file.instructions.md`](prompt-file.instructions.md)                           | Prompt File Standards         | Structure and requirements for AI prompt files                          |
| [`vertical-slice.instructions.md`](vertical-slice.instructions.md)                     | Vertical Slice Architecture   | Implementation guidelines for vertical slice patterns                   |

## Purpose

These instruction files establish the standards and workflows for AI-assisted development across all related repositories. They define:

- Required metadata and provenance tracking
- AI chat logging workflows
- Quality checklist and compliance requirements
- GitHub Copilot integration specifications
- Enforcement patterns and CI requirements

## Usage

Other repositories should reference or copy these files from here. This ensures consistency across the entire AIASD ecosystem.

## Updating Process

1. **Make changes here FIRST** - All updates should be made to the files in this canonical location
2. **Test locally** - Verify changes work as expected in this repository
3. **Sync to other repositories** - Use the sync script or manual copy to update downstream repositories
4. **Validate** - Test in downstream repositories to ensure compatibility

## Repositories using these instructions:

- **ai-practitioner/ai-practitioner-blog** - Personal blog repository
- **AIASD/AI-Assisted-Software-Development-Course** - Main course repository
- **AIASD/AI-Assisted-Software-Development-Course/Course/course.github** - Course materials
- **AIASD/AI-Assisted-Software-Development-Course/submodules/ai-assisted-dev** - Course submodule
- **Teleflex/AIASD-SOP** - Standard operating procedures repository
- **zeus/zeus.academia.3** - Academic project repository
- **zeus/zeus.academia.3b** - Academic project repository (variant)

## Sync Script

Use this PowerShell script to synchronize changes to all repositories:

```powershell
# Quick sync script - run from any location
$source = "c:\git\AIASD\AI-Assisted-Software-Development\.github\instructions\ai-assisted-output.instructions.md"
$targets = @(
    "c:\git\ai-practitioner\ai-practitioner-blog\.github\instructions\ai-assisted-output.instructions.md",
    "c:\git\zeus\zeus.academia.3\.github\instructions\ai-assisted-output.instructions.md",
    "c:\git\zeus\zeus.academia.3b\.github\instructions\ai-assisted-output.instructions.md",
    "c:\git\AIASD\AI-Assisted-Software-Development-Course\.github\instructions\ai\ai-assisted-output.instructions.md",
    "c:\git\AIASD\AI-Assisted-Software-Development-Course\Course\course.github\instructions\ai-assisted-output.instructions.md",
    "c:\git\AIASD\AI-Assisted-Software-Development-Course\submodules\ai-assisted-dev\.github\instructions\ai\ai-assisted-output.instructions.md",
    "c:\git\Teleflex\AIASD-SOP\.github\instructions\ai-assisted-output.instructions.md"
)

foreach ($target in $targets) {
    if (Test-Path (Split-Path $target)) {
        Copy-Item $source $target -Force
        Write-Host "✅ Synced: $target"
    } else {
        Write-Host "⚠️  Directory not found: $(Split-Path $target)"
    }
}
```

## Maintenance Notes

- **Last synchronized**: February 4, 2026
- **Canonical version size**: 25,805 bytes
- **Canonical version lines**: 664
- **Model used for latest version**: anthropic/claude-3.5-sonnet@2024-10-22
- **Chat ID for latest version**: generate-ai-output-policy-20260120

## Contributing

When making changes to AI instruction files:

1. Update the canonical version here first
2. Test changes thoroughly
3. Run the sync script to propagate changes
4. Update this README if new repositories are added to the ecosystem
5. Document significant changes in the commit message

---

**Repository**: AI-Assisted-Software-Development
**Owner**: johnmillerATcodemag-com
**Canonical Location**: `.github/instructions/`
