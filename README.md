# AI-Assisted Software Development

This repo was created for the 2025 Next Gen AI Conference Leveraging AI for Legacy Code Refactoring session

## Prompts

[x] #file:check-context.prompt.md apply this prompt to files in the .github/instructions folder

[x] Update the readme.md file with current state of the application. Include mermaid C4 diagrams.

[x] #codebase analyze the code and report any deviations from the instructions in the .github/instructions folder

[x] Looking at the current #codebase, what tests are need and missing?

[x] Looking at the current #codebase, what tests are need and missing in order to verify a successful migration to Vue 3.4?

[x] Looking at the current #codebase, what needs refactoring?

[x] Looking at the current #codebase, what are security concerns? Create issues from your findings.

[x] Analyze the #codebase and create github issues for any dead code you find

[x] Analyze the files in the .github/instructions folder and report where they no longer represent best practices

[ ] #codebase analyze the code and report any deviations from the instructions in the .github/instructions folder

[ ] Create tests for #file:validatorsCustom.js

[ ] Look at the current #codebase and find the bugs?

[ ] Add comprehensive error logging architecture

[ ] The two branches sonnet4 and gpt5 contain implementations of the comprehensive error logging architecture. The gpt5 implementation is in commit aafed869e3c243b758d7a89cf29f19fa70c41f8a. The sonnet4 implementation is in commit fed7e9e927e458fa95f30ef91a3bbfcb201e20ea. Review each implementation and report the pros and cons of each.

## AI-Assisted Artifacts & Provenance

This repository enforces provenance and logging for any AI-assisted outputs (code, docs, diagrams, tests, data).

### Guidance & Instructions

- [`.github/instructions/ai-assisted-output.instructions.md`](.github/instructions/ai-assisted-output.instructions.md) — How to generate AI-assisted outputs with required metadata, logging, and CI enforcement
- [`.github/instructions/business-rules-to-slices.instructions.md`](.github/instructions/business-rules-to-slices.instructions.md) — **AI Assistants**: Explicit procedures for analyzing business rules, extracting use cases, and designing vertical slices ([chat log](ai-logs/2025/10/22/business-rules-vertical-slices-20251022/conversation.md))
- [`.github/instructions/vertical-slice.instructions.md`](.github/instructions/vertical-slice.instructions.md) — **AI Assistants**: Comprehensive guide for generating vertical slice code with rules, templates, and validation checklists ([chat log](ai-logs/2025/10/22/ai-vertical-slice-implementation-20251022/conversation.md))
- [`.github/instructions/business-rules-to-vertical-slices.instructions.md`](.github/instructions/business-rules-to-vertical-slices.instructions.md) — **Developers**: Guide for analyzing business requirements, extracting rules, and designing implementable vertical slices ([chat log](ai-logs/2025/10/22/business-rules-vertical-slices-20251022/conversation.md))
- [`.github/instructions/copilot-instructions.md`](.github/instructions/copilot-instructions.md) — **GitHub Copilot Users Start Here** - Comprehensive Copilot-specific guidance for model format, conversation logging, and quality standards ([chat log](ai-logs/2025/10/15/prompt-file.instructions-2025-10-15/conversation.md))
- [`.github/instructions/github-cli.instructions.md`](.github/instructions/github-cli.instructions.md) — Comprehensive guidance for using GitHub CLI effectively in development workflows, including authentication, repository operations, PR management, and automation ([chat log](ai-logs/2026/02/06/github-cli-instructions-20260206/conversation.md))
- [`.github/instructions/chatmode-file.instructions.md`](.github/instructions/chatmode-file.instructions.md) — Comprehensive authoring guidelines for creating custom GitHub Copilot chat modes ([chat log](ai-logs/2025/10/21/create-chatmode-instructions-20251021/conversation.md))
- [`.github/instructions/create-prompt.instructions.md`](.github/instructions/create-prompt.instructions.md) — Comprehensive guidelines for authoring effective repository prompts ([chat log](ai-logs/2025/10/15/prompt-file.instructions-2025-10-15/conversation.md))
- [`.github/instructions/instruction-prompt-files.instructions.md`](.github/instructions/instruction-prompt-files.instructions.md) — Requirements for creating prompts that generate instruction files ([chat log](ai-logs/2025/10/15/prompt-file.instructions-2025-10-15/conversation.md))
- [`.github/instructions/vertical-slice-architecture.instructions.md`](.github/instructions/vertical-slice-architecture.instructions.md) — Comprehensive guide for implementing vertical slice architecture with feature-centric code organization ([chat log](ai-logs/2025/10/22/vertical-slice-instructions-20251022/conversation.md))

### Custom GitHub Copilot Chat Modes

Custom chat modes are specialized AI assistants that extend GitHub Copilot's capabilities for specific domains and workflows. Activate with `@<modename>` in GitHub Copilot chat.

#### Role-Based Chat Modes (Generated from Personas)

- [`.github/chatmodes/ProductManager.chatmode.md`](.github/chatmodes/ProductManager.chatmode.md) — Requirements translation, stakeholder communication, and business alignment for product management workflows
- [`.github/chatmodes/SolutionArchitect.chatmode.md`](.github/chatmodes/SolutionArchitect.chatmode.md) — System design, architecture patterns, and technology evaluation for enterprise solutions
- [`.github/chatmodes/SeniorDeveloper.chatmode.md`](.github/chatmodes/SeniorDeveloper.chatmode.md) — Advanced code generation, debugging expertise, performance optimization, and technical mentorship
- [`.github/chatmodes/TechnicalWriter.chatmode.md`](.github/chatmodes/TechnicalWriter.chatmode.md) — Documentation creation, content organization, and multi-format publishing for user-focused technical content
- [`.github/chatmodes/SecurityReviewer.chatmode.md`](.github/chatmodes/SecurityReviewer.chatmode.md) — Comprehensive security analysis, vulnerability detection, and compliance validation for secure systems
- [`.github/chatmodes/DevOpsEngineer.chatmode.md`](.github/chatmodes/DevOpsEngineer.chatmode.md) — Infrastructure automation, CI/CD pipeline optimization, and cloud resource management
- [`.github/chatmodes/DevTestEngineer.chatmode.md`](.github/chatmodes/DevTestEngineer.chatmode.md) — Test automation, quality assurance, and comprehensive performance testing strategies
- [`.github/chatmodes/SRE.chatmode.md`](.github/chatmodes/SRE.chatmode.md) — System reliability, incident response, performance monitoring, and service level management

#### Utility Chat Modes

- [`.github/chatmodes/technical-writer.chatmode.md`](.github/chatmodes/technical-writer.chatmode.md) — Documentation maintenance, accuracy verification, and continuous improvement ([chat log](ai-logs/2025/10/22/create-documentation-updater-chatmode-20251022/conversation.md))
- [`.github/chatmodes/documentation-visualizer.chatmode.md`](.github/chatmodes/documentation-visualizer.chatmode.md) — Technical documentation, diagramming with Mermaid, and readability improvements
- [`.github/chatmodes/security-expert.chatmode.md`](.github/chatmodes/security-expert.chatmode.md) — Code security analysis, vulnerability detection, and automated issue creation
- [`.github/chatmodes/codebase-explorer.chatmode.md`](.github/chatmodes/codebase-explorer.chatmode.md) — Rapid codebase understanding and evaluation
- [`.github/chatmodes/git-expert.chatmode.md`](.github/chatmodes/git-expert.chatmode.md) — Branching policies, merge style enforcement, and CI/CD hygiene

### Meta-Prompts (Prompt Generators)

- [`.github/prompts/meta/create-instruction-files-prompt-file.prompt.md`](.github/prompts/meta/create-instruction-files-prompt-file.prompt.md) — Generates new instruction-generating prompts with AI provenance built-in ([chat log](ai-logs/2025/10/15/prompt-file.instructions-2025-10-15/conversation.md))

### Instruction-Generating Prompts

- [`.github/prompts/create-chatmode-instructions-file.prompt.md`](.github/prompts/create-chatmode-instructions-file.prompt.md) — Generates comprehensive authoring guidelines for creating custom GitHub Copilot chat modes

### Notable Artifacts

- **VS Code Copilot Agents Overview Slides** ([`Slides/individual-slides/vscode-copilot-agents-overview.md`](Slides/individual-slides/vscode-copilot-agents-overview.md))
  - Comprehensive Marp slide deck covering VS Code Copilot Agents ecosystem with interactive workflows
  - 12 slides with detailed speaker notes covering local, background, cloud, and third-party agents
  - Includes decision matrices, hand-off workflows, and practical implementation guidance
  - Provenance: [Chat log](ai-logs/2026/02/06/vscode-agents-slides-20260206/conversation.md) | [Summary](ai-logs/2026/02/06/vscode-agents-slides-20260206/summary.md)

- **GitHub Worktrees Guide Slides** ([`Slides/individual-slides/github-worktrees-guide.md`](Slides/individual-slides/github-worktrees-guide.md))
  - Comprehensive Marp slide deck teaching parallel development with Git worktrees
  - 12 slides covering introduction, essential commands, practical workflows, hands-on exercises, and best practices
  - Includes detailed speaker notes, troubleshooting guidance, and resources for continued learning
  - Provenance: [Chat log](ai-logs/2026/02/06/github-worktrees-slides-20260206/conversation.md) | [Summary](ai-logs/2026/02/06/github-worktrees-slides-20260206/summary.md)

- **Prompt Authoring Instructions** ([`.github/instructions/prompt-file.instructions.md`](.github/instructions/prompt-file.instructions.md))
  - Comprehensive guidelines for creating effective, well-structured repository prompts
  - Generated from: [`.github/prompts/create-prompt-file-instructions-file.prompt.md`](.github/prompts/create-prompt-file-instructions-file.prompt.md)
  - Provenance: [Chat log](ai-logs/2025/10/15/prompt-file.instructions-2025-10-15/conversation.md)

- **Instruction Validation Report** ([`validation-report-20251015-212137.md`](validation-report-20251015-212137.md))
  - Comprehensive analysis of instruction file conflicts and inconsistencies
  - Identifies 7 issues (1 high, 4 medium, 3 low severity) with fixes applied to critical issues
  - Generated from: [`.github/prompts/meta/validate-and-improve-instructions.prompt.md`](.github/prompts/meta/validate-and-improve-instructions.prompt.md)
  - Status: Critical fixes applied (Option C executed - 4 issues resolved, 3 deferred for refactoring)
  - Provenance: [Chat log](ai-logs/2025/10/15/validate-improve-instructions-20251015-212137/conversation.md) | [Summary](ai-logs/2025/10/15/validate-improve-instructions-20251015-212137/summary.md)
  - Verification: [Fixes verified 2025-10-16](validation-fixes-verified-20251016.md) ([chat log](ai-logs/2025/10/16/resume-validation-fixes-20251016/conversation.md))

## Utility Scripts

This repository includes utility scripts for repository management and maintenance:

### Branch Change Tracking

Identify branches with changes that haven't been merged to main:

- **Bash:** [`scripts/check_unmerged_branches.sh`](scripts/check_unmerged_branches.sh) - For Linux/Mac/WSL
- **PowerShell:** [`scripts/check_unmerged_branches.ps1`](scripts/check_unmerged_branches.ps1) - For Windows/PowerShell Core

**Usage:**

```bash
# Bash
./scripts/check_unmerged_branches.sh

# PowerShell
.\scripts\check_unmerged_branches.ps1
```

See [`scripts/README.md`](scripts/README.md) for detailed documentation and configuration options.

### Security Issue Management

Scripts for managing GitHub security issues:

- `close_duplicate_security_issues.ps1` - Close duplicate security issues
- `close_latest_security_issues.ps1` - Close latest security issues
- `close_new_security_issues.ps1` - Close new security issues
- `close_resolved_security_issues.ps1` - Close resolved security issues
- `emergency_security_cleanup.ps1` - Emergency security cleanup

## Document Conversion

### Pandoc Configuration Files

Standardized document conversion configurations for slides, documentation, and presentations:

- **[`slides-to-pptx.yaml`](slides-to-pptx.yaml)** - Optimized for converting Marp slides to PowerPoint presentations
- **[`to-pdf.yaml`](to-pdf.yaml)** - Professional PDF output for slides and documentation
- **[`pandoc-defaults.yaml`](pandoc-defaults.yaml)** - Comprehensive multi-format configuration
- **[`PANDOC.md`](PANDOC.md)** - Complete usage guide with examples and customization options
- **[`templates/`](templates/)** - PowerPoint reference templates for professional formatting

**Quick Examples:**

```bash
# Convert slide deck to PowerPoint with template support
pandoc --defaults=slides-to-pptx Slides/individual-slides/github-worktrees-guide.md -o github-worktrees.pptx

# Convert documentation to PDF
pandoc --defaults=to-pdf README.md -o project-overview.pdf
```

**Note**: For professional PowerPoint formatting, create a reference template in the `templates/` directory. See [`templates/README.md`](templates/README.md) for instructions.
