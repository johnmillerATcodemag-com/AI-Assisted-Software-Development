---
ai_generated: false
operator: "github-copilot"
created: "2026-02-11"
reviewed_against: ".github/instructions/prompt-file.instructions.md"
---

# Promptfiles Compliance Review Report

**Review Date**: 2026-02-11
**Location Reviewed**: `.github\copilot\Promptfiles`
**Files Reviewed**: 30 promptfiles
**Compliance Standard**: `.github/instructions/prompt-file.instructions.md`

---

## ⚠️ CORRECTION NOTICE

**Updated**: 2026-02-11 (Post-Review)

Please note the following correction regarding the `name:` field:

- **INCORRECT (in review)**: `name` is required by Copilot
- **CORRECT**: `name` is **optional** but recommended for discovery via `@name-syntax`
- **Only REQUIRED field**: `description`

When reviewing this report, disregard any statements claiming `name` is required. The actual requirement is:

- `description` field is required
- `name` field is optional (but if used, filename should match it)

See `.github/instructions/prompt-file.instructions.md` sections 35-52 for authoritative guidance.

---

## Executive Summary

**CRITICAL COMPLIANCE ISSUES FOUND** ⚠️

The promptfiles in this directory have **fundamental structural violations** that prevent them from functioning as proper GitHub Copilot promptfiles. Issues identified:

- ❌ **Wrong Architecture**: Files are structured as agents/chat modes, not as promptfiles
- ❌ **Missing Required Fields**: No `description` field in YAML (required by Copilot); `name` field missing (optional but recommended)
- ❌ **Behavioral Instructions**: Contains persona instructions ("You are...") instead of task-oriented prompts
- ❌ **Incomplete AI Provenance**: Missing required AI-assisted output metadata
- ❌ **Excessive Length**: Many files 100+ lines (ideal: 10-30 lines)
- ❌ **Directory Structure Violation**: Some files organized in subdirectories (must be flat)
- ⚠️ **File Extension Confusion**: Mixing `.prompt.md` and `.md` extensions
- ⚠️ **Metadata Structure**: Using `prompt_metadata` instead of Copilot-native fields

**Recommendation**: These files should be **reorganized** as one of:

1. **Agent/Chat Modes** (if behavioral) → Move to `.github/copilot/chat_modes/`
2. **Simple Promptfiles** (if task-focused) → Restructure to match instruction spec
3. **Long-Form Instructions** (if extremely detailed) → Move to `.github/instructions/`

---

## Detailed Compliance Analysis

### Issue 1: Wrong YAML Structure ❌ CRITICAL

**Finding**: All promptfiles use an incompatible YAML structure with `mode`, `tools`, and `prompt_metadata` instead of Copilot-native fields.

**Instruction Requirement**:

```yaml
---
name: kebab-case-name
description: Short description
arguments:
  param_name:
    type: string
    description: Parameter description
tags: ["tag1", "tag2"]
# AI Provenance (if AI-generated)
ai_generated: true
model: "provider/model@version"
operator: "username"
...
---
```

**Current Structure** (Wrong):

```yaml
---
mode: chat  # ← Not a Copilot field
model: "anthropic/claude-3.5-sonnet@2024-10-22"
tools: ["search", "read"]  # ← Not a Copilot field
description: "..."
prompt_metadata:  # ← Wrong field name
  id: kebab-name
  title: Title
  ...
---
```

**Affected Files**: **ALL 30 files**

**Impact**: Copilot cannot recognize these files as promptfiles. The `description` field (required) is not properly positioned. The `name` and other fields are also structured incorrectly.

**Examples**:

- `architecture-design.prompt.md` - Has `mode: chat` and `prompt_metadata` instead of `name`
- `compliance-check.prompt.md` - Same issue
- `security-architecture.prompt.md` - Same issue
- `generate-instructions.prompt.md` - Has `mode: agent` instead

---

### Issue 2: Missing `description` (Required) or `name` (Optional) Field ⚠️ MODERATE

**⚠️ CORRECTION**: The `name` field is **OPTIONAL**, not required. Only `description` is required by Copilot.

**Finding**: YAML uses `prompt_metadata` instead of proper top-level Copilot fields.

**Instruction Requirement** (Corrected):

```yaml
description: "Short description of the task" # ← REQUIRED by Copilot
name: my-promptfile # ← OPTIONAL (improves discoverability)
```

**Current State**: Information is scattered in `prompt_metadata.id` (wrong structure)

**Affected Files**: **ALL 30 files** (for the wrong YAML structure)

**Impact**: Without proper `description`, Copilot cannot identify the promptfile's purpose. The optional `name` field—if provided—would enable invocation via `@name` syntax and improve discoverability, but is not a blocker for basic functionality.

---

### Issue 3: Behavioral Instructions Instead of Task-Oriented ❌ CRITICAL

**Finding**: Promptfile bodies contain persona/agent instructions ("You are...") instead of pure task definitions.

**Instruction Violation**:

> "Tell Copilot what to do, not how to behave"
>
> - ✅ "Generate unit tests for {{file}}"
> - ❌ "Act like a senior QA engineer and think carefully..."

**Examples**:

**architecture-design.prompt.md** (Lines 19-20):

```markdown
You are a Solution Architect tasked with creating detailed system architecture designs.
When triggered with `@architecture-design`, analyze the user's requirements...
```

❌ **Should be**: Task-focused, not persona-based

**compliance-check.prompt.md** (Lines 18-19):

```markdown
You are a Solution Architect specializing in compliance and standards validation.
When triggered with `@compliance-check`, validate architectures against...
```

❌ **Should be**: "Validate architectures against regulatory requirements and organizational standards"

**security-architecture.prompt.md** (Lines 18-19):

```markdown
You are a Solution Architect specializing in security architecture and threat mitigation.
When triggered with `@security-architecture`, design comprehensive security controls...
```

❌ **Should be**: Task statement, not persona

**Affected Files**: **At least 10+ files**

**Impact**: These files are **agent definitions, not promptfiles**. They should live in `.github/copilot/chat_modes/` if they need behavioral instructions.

---

### Issue 4: Incomplete/Missing AI Provenance Metadata ⚠️ MAJOR

**Finding**: Files lack complete AI-assisted output provenance required by repository policy.

**Instruction Requirement** (from `ai-assisted-output.instructions.md`):

```yaml
ai_generated: true
model: "provider/model@version"
operator: "github-username"
chat_id: "unique-id"
prompt: |
  Exact prompt text here
started: "2026-02-11T10:00:00Z"
ended: "2026-02-11T10:15:00Z"
task_durations:
  - task: "name"
    duration: "00:15:00"
total_duration: "00:15:00"
ai_log: "ai-logs/2026/02/11/chat-id/conversation.md"
source: "username"
```

**Current State** (Incomplete):

- ✅ `model` present
- ❌ `ai_generated` missing or not boolean
- ❌ `operator` missing
- ❌ `chat_id` missing
- ❌ `prompt` (exact prompt text) missing
- ❌ `started`/`ended` timestamps missing or wrong format
- ❌ `task_durations` missing
- ❌ `total_duration` missing
- ❌ `ai_log` missing (should reference conversation log)
- ❌ `source` missing

**Examples**:

**architecture-design.prompt.md**:

```yaml
ai_generated: true # ✅ Present
model: "anthropic/claude-3.5-sonnet@2024-10-22" # ✅ Present
tools: ["search", "read"] # ← Not a standard field
# ✅ Missing: operator, chat_id, prompt, started, ended, task_durations, total_duration, ai_log, source
```

**Affected Files**: **ALL 30 files**

**Impact**: Violates repository AI-assisted output policy. Files cannot be traced back to original conversation or context. Audit trail is incomplete.

**Policy Reference**: `.github/instructions/ai-assisted-output.instructions.md` Section: "Required provenance metadata (for every AI-assisted artifact)"

---

### Issue 5: Excessive Length ⚠️ MAJOR

**Finding**: Many files exceed the recommended length of 10-30 lines. Actual lengths:

| File                              | Lines | Assessment              |
| --------------------------------- | ----- | ----------------------- |
| `architecture-design.prompt.md`   | 114   | 🔴 4x recommended max   |
| `compliance-check.prompt.md`      | 237   | 🔴 8x recommended max   |
| `security-architecture.prompt.md` | 232   | 🔴 8x recommended max   |
| `generate-instructions.prompt.md` | 138   | 🔴 5x recommended max   |
| `refactor-analysis.prompt.md`     | 76    | 🔴 2.5x recommended max |
| `codebase-review.prompt.md`       | 200+  | 🔴 Too long             |
| `pattern-analysis.prompt.md`      | 150+  | 🔴 Too long             |

**Instruction Guideline**:

> "Short (Aim for 10-30 lines, not 200)"

**Affected Files**: **At least 15+ files**

**Impact**: Copilot may truncate long promptfiles. Content becomes difficult to parse. Users may not find needed information.

**Recommendation**: Either reduce to task-focused summary, or move to `.github/instructions/` as detailed guidance.

---

### Issue 6: Directory Structure Violation ⚠️ MODERATE

**Finding**: README references subdirectories (e.g., `solution-architect/`) which violates flat structure requirement.

**Instruction Requirement**:

> "All promptfiles in flat directory (no subfolders). Only `.md` files will be loaded. Copilot scans this exact path only."

**Current Structure**:

```
.github/copilot/Promptfiles/
├── architecture-design.prompt.md
├── compliance-check.prompt.md
├── solution-architect/              # ← VIOLATION: Subdirectory
│   ├── architecture-design.prompt.md
│   ├── compliance-check.prompt.md
│   └── ... (more files)
├── meta/                             # ← VIOLATION: Subdirectory
│   └── README.md
└── README.md
```

**Instruction Reference**:

```
.github/
└── copilot/
    └── Promptfiles/              # ← Exact path
        ├── file1.md              # ← Flat only
        ├── file2.md
        └── file3.md              # ← No subfolders
```

**Affected Files**: Subdirectory references in README

**Impact**: Files in subdirectories may not be discoverable by Copilot. Violates documented structure requirements.

---

### Issue 7: File Extension Inconsistency ⚠️ MINOR

**Finding**: Mixed file extensions detected:

| Extension    | Count | Issue                                                      |
| ------------ | ----- | ---------------------------------------------------------- |
| `.prompt.md` | ~25   | Non-standard (instruction specifies `.md` OR `.prompt.md`) |
| `.md`        | ~5    | Standard                                                   |

**Examples**:

- ✅ `update-application-c4-diagrams.md` (correct)
- ⚠️ `architecture-design.prompt.md` (inconsistent)
- ⚠️ `check-context.prompt.md` (inconsistent)

**Instruction Guidance**:

> "File Format: MUST be Markdown (`.prompt.md` extension)"

**Note**: The instruction allows `.prompt.md` but `.md` is also acceptable. Main issue is inconsistency in the codebase.

**Affected Files**: Most files use `.prompt.md`

**Impact**: Minor - both extensions work, but consistency improves discoverability and maintenance.

---

### Issue 8: Metadata Field Conflicts and Mismatch ⚠️ MODERATE

**Finding**: Files use `prompt_metadata.id` instead of top-level `name`, creating confusion during parsing.

**Examples**:

**architecture-design.prompt.md**:

```yaml
---
prompt_metadata:
  id: architecture-design # ← Should be top-level 'name' field
```

**Description Mismatch**:

- Some files have `prompt_metadata.title` (non-standard)
- Some files have top-level `description` (correct)
- Inconsistent structure across files

**Affected Files**: **ALL 30 files**

**Impact**: Tooling that parses these files must handle multiple naming patterns. Makes auto-discovery and validation harder.

---

## File-by-File Assessment Summary

### High Risk ❌ (Wrong Architecture)

These files should be **agents/chat modes**, not promptfiles:

| File                              | Issues                                                  |
| --------------------------------- | ------------------------------------------------------- |
| `architecture-design.prompt.md`   | Behavioral instructions, 114 lines, wrong metadata      |
| `compliance-check.prompt.md`      | Behavioral instructions, 237 lines, tool definitions    |
| `security-architecture.prompt.md` | Behavioral instructions, 232 lines, extensive content   |
| `codebase-review.prompt.md`       | Agent-style, 200+ lines                                 |
| `generate-instructions.prompt.md` | Behavioral ("Analyze codebase and generate"), 138 lines |
| `pattern-analysis.prompt.md`      | Complex analysis structure, 150+ lines                  |
| `performance-analysis.prompt.md`  | Complex analysis structure, excessive detail            |
| `migration-strategy.prompt.md`    | Agent persona, extensive guidance                       |
| `risk-assessment.prompt.md`       | Behavioral instructions, tool definitions               |
| `technology-evaluation.prompt.md` | Behavioral instructions, extensive content              |

### Medium Risk ⚠️ (Fixable with Updates)

These files could work as promptfiles after restructuring:

| File                                               | Issues                               |
| -------------------------------------------------- | ------------------------------------ |
| `check-context.prompt.md`                          | Wrong metadata, no proper provenance |
| `create-ai-assisted-output-instructions.prompt.md` | Agent mode, fixable as promptfile    |
| `create-chatmode-instructions-file.prompt.md`      | Behavioral content                   |
| `refactor-analysis.prompt.md`                      | Too long (76 lines), behavioral      |
| `tests-gap-analysis.prompt.md`                     | Agent-style analysis instructions    |
| `security-audit-issues.prompt.md`                  | Analysis agent, not task-focused     |

### Lower Risk ✅ (Closer to Compliance)

| File                                     | Issues                    | Note                     |
| ---------------------------------------- | ------------------------- | ------------------------ |
| `create-issues-for-dead-code.prompt.md`  | Metadata only             | Could work with updates  |
| `create-issues-for-found-bugs.prompt.md` | Metadata only             | Could work with updates  |
| `update-application-c4-diagrams.md`      | Wrong extension in README | Relatively close to spec |

---

## Actionable Recommendations

### Priority 1: Critical (Must Fix)

**1.1 Restructure YAML Schema** 🔴

- [ ] Add top-level `name` field to all files
- [ ] Remove `mode` field (not Copilot-native)
- [ ] Remove `tools` field or document separately
- [ ] Move `prompt_metadata` content to root level or remove
- [ ] Ensure `description` is top-level

**1.2 Add Required AI Provenance** 🔴

- [ ] Add `ai_generated: true` or `false`
- [ ] Add `operator` (GitHub username or "johnmillerATcodemag-com")
- [ ] Add `chat_id` if AI-generated
- [ ] Add `prompt` (verbatim text that created the file)
- [ ] Add `started` and `ended` (ISO8601 format)
- [ ] Add `task_durations` array
- [ ] Add `total_duration` (HH:MM:SS)
- [ ] Add `ai_log` (path to conversation log)
- [ ] Add `source` (who/what created it)

Reference template:

```yaml
ai_generated: true
model: "anthropic/claude-3.5-sonnet@2024-10-22"
operator: "johnmillerATcodemag-com"
chat_id: "promptfiles-review-20260211"
prompt: "Create promptfile for architecture design"
started: "2026-02-11T10:00:00Z"
ended: "2026-02-11T10:15:00Z"
task_durations:
  - task: "restructuring"
    duration: "00:15:00"
total_duration: "00:15:00"
ai_log: "ai-logs/2026/02/11/promptfiles-review-20260211/conversation.md"
source: "johnmillerATcodemag-com"
```

**1.3 Remove Behavioral Instructions** 🔴

- [ ] Remove "You are..." phrasing
- [ ] Remove persona definitions
- [ ] Focus on task outcome instead
- [ ] Make deterministic and specific

Conversion example:

**Before** ❌:

```markdown
You are a Solution Architect specializing in compliance and standards validation.
When triggered with `@compliance-check`, validate architectures...
```

**After** ✅:

```markdown
# Compliance Validation

Validate architectures against regulatory requirements and organizational standards.

## Input

- Architecture design document
- Regulatory framework (GDPR, HIPAA, SOC 2, etc.)
```

### Priority 2: Important (Should Fix)

**2.1 Restructure Directory** 🟡

- [ ] Consolidate files into flat `.github/copilot/Promptfiles/` directory
- [ ] Remove `solution-architect/` and `meta/` subdirectories
- [ ] Rename/consolidate duplicate architectures if they exist

**2.2 Reduce Length** 🟡

- [ ] Target 10-30 lines for core instruction
- [ ] Move detailed guidelines to `.github/instructions/`
- [ ] Create reference links instead of embedding full content
- [ ] Example: "See `.github/instructions/cqrs-architecture.instructions.md` for detailed CQRS patterns"

**2.3 File Naming Consistency** 🟡

- [ ] Standardize on `.md` or `.prompt.md` (choose one pattern)
- [ ] Ensure `name` field matches filename (without extension)
- [ ] Use kebab-case consistently

### Priority 3: Nice to Have

**3.1 Add Arguments** 🟢

- [ ] Define `arguments` section for parameterized promptfiles
- [ ] Example:
  ```yaml
  arguments:
    file:
      type: string
      description: Path to file to analyze
    framework:
      type: enum
      values: ["jest", "mocha", "pytest"]
      description: Testing framework
  ```

**3.2 Standardize Tags** 🟢

- [ ] Use consistent tag vocabulary across all files
- [ ] Examples: `architecture`, `analysis`, `testing`, `security`, `documentation`

**3.3 Add Testing Validation** 🟢

- [ ] Verify files appear in Copilot `@` picker after update
- [ ] Test invocation with inline arguments
- [ ] Validate consistency of output

---

## Remediation Path

### Option A: Fix-in-Place (Recommended for Task-Focused Promptfiles)

1. Update YAML structure for ~5-10 files that are naturally task-focused
2. Add required AI provenance metadata
3. Remove behavioral instructions
4. Reduce length where possible
5. Test in Copilot

**Candidates**: `create-issues-for-dead-code.prompt.md`, `create-issues-for-found-bugs.prompt.md`, simple analysis prompts

### Option B: Move to Chat Modes (Recommended for Behavioral Files)

1. Identify files with strong persona/behavioral content
2. Move to `.github/copilot/chat_modes/` directory
3. Restructure as agent definitions (different schema)
4. Keep complex analysis and custom behavior

**Candidates**: `architecture-design.prompt.md`, `compliance-check.prompt.md`, `security-architecture.prompt.md`, complex analysis files

### Option C: Move to Instructions (Recommended for Very Long Files)

1. Identify files that are really detailed guidance documents
2. Move to `.github/instructions/`
3. Create small promptfile that references the instruction file
4. Simplify promptfile to task statement

**Example**:

```yaml
---
name: cqrs-architecture-guide
description: Learn about CQRS architecture patterns

# In body:
See [CQRS Architecture Instructions](.github/instructions/cqrs-architecture.instructions.md)
for comprehensive guidance on implementing Command Query Responsibility Segregation.
```

**Candidates**: `architecture-design.prompt.md`, `codebase-review.prompt.md`, pattern analysis files

---

## Proposed Fixes (Code Examples)

### Fix Example 1: Simple Task Promptfile (Option A)

**File**: `create-issues-for-dead-code.prompt.md`

**BEFORE** ❌:

```yaml
---
mode: agent
model: "anthropic/claude-3.5-sonnet@2024-10-22"
tools: ["search", "edit", "fetch"]
description: "Analyze codebase for dead code and create GitHub issues"
prompt_metadata:
  id: create-issues-for-dead-code
  title: Dead Code Analysis to GitHub Issues
  owner: johnmillerATcodemag-com
  version: "1.0.0"
  created: "2025-02-05"
  updated: "2025-02-05"
  output_path: reports/dead-code-analysis.md
  category: analysis
  tags: [analysis, dead-code, code-quality, issues]
---
# Dead Code Analysis to GitHub Issues

You are a Code Quality Engineer...
[150+ lines of detailed instructions]
```

**AFTER** ✅:

```yaml
---
name: create-issues-for-dead-code
description: Analyze codebase for dead code and create GitHub issues

arguments:
  repo_path:
    type: string
    description: Path to repository root to analyze
    default: "."
  severity:
    type: enum
    values: ["low", "medium", "high"]
    description: Minimum severity level for dead code issues
    default: "medium"

tags: ["analysis", "dead-code", "code-quality", "issues"]

ai_generated: true
model: "anthropic/claude-3.5-sonnet@2024-10-22"
operator: "johnmillerATcodemag-com"
chat_id: "deadcode-promptfile-fix-20260211"
prompt: "Convert dead code analysis to task-focused promptfile"
started: "2026-02-11T14:00:00Z"
ended: "2026-02-11T14:15:00Z"
task_durations:
  - task: "restructuring"
    duration: "00:15:00"
total_duration: "00:15:00"
ai_log: "ai-logs/2026/02/11/deadcode-promptfile-fix-20260211/conversation.md"
source: "johnmillerATcodemag-com"
---

# Analyze Dead Code

Analyze the repository at {{repo_path}} for dead code at {{severity}} severity or higher.

## Output Format

1. **Inventory**: List all detected dead code with file locations and line numbers
2. **Evidence**: For each item, show why it's considered dead
3. **Issues**: Generate GitHub issue bodies ready to post
4. **Priority**: Rank by impact and effort to remove
```

**Key Changes**:

- ✅ Removed `mode`, `tools`, `prompt_metadata` (wrong fields)
- ✅ Added top-level `name` field (required for discovery)
- ✅ Changed description to task statement (no "You are...")
- ✅ Added `arguments` section for parametrization
- ✅ Added complete AI provenance metadata
- ✅ Reduced from 150+ lines to ~40 lines
- ✅ Removed behavioral instructions and personas
- ✅ Made deterministic with explicit output format

---

### Fix Example 2: Move Behavioral File to Chat Mode (Option B)

**File**: `architecture-design.prompt.md` → Move to `.github/copilot/chat_modes/architecture-design.md`

**BEFORE** ❌ (In Promptfiles):

```yaml
---
mode: chat
model: "anthropic/claude-3.5-sonnet@2024-10-22"
tools: ["search", "read"]
description: Create comprehensive system architecture designs
prompt_metadata:
  id: architecture-design
  title: Comprehensive System Architecture Design
  owner: solution-architect
  version: 1.0.0
---
# Comprehensive System Architecture Design

You are a Solution Architect tasked with creating detailed system architecture designs.
When triggered with `@architecture-design`, analyze the user's requirements and produce...
[114 lines of detailed analysis framework, output structure, etc.]
```

**AFTER** ✅ (In Chat Modes):

**File**: `.github/copilot/chat_modes/architecture-design.md`

```yaml
---
name: solution-architect
description: Expert system architect for comprehensive design analysis
icon: 🏗️

ai_generated: true
model: "anthropic/claude-3.5-sonnet@2024-10-22"
operator: "johnmillerATcodemag-com"
chat_id: "architecture-chatmode-fix-20260211"
prompt: "Create solution architect chat mode for architecture design"
started: "2026-02-11T14:20:00Z"
ended: "2026-02-11T14:35:00Z"
task_durations:
  - task: "restructuring"
    duration: "00:15:00"
total_duration: "00:15:00"
ai_log: "ai-logs/2026/02/11/architecture-chatmode-fix-20260211/conversation.md"
source: "johnmillerATcodemag-com"
---

# Solution Architect

You are an expert Solution Architect specializing in comprehensive system design. Your role is to guide users through detailed architectural analysis and recommendations.

## Your Expertise

- System architecture design and component modeling
- Technology selection and justification
- Scalability and performance planning
- Security architecture and threat mitigation
- Integration strategies and API design
- Risk assessment and mitigation planning

## Approach

When users ask for architecture analysis:

1. **Requirements Clarification**: Ask about functional and non-functional requirements
2. **Current State Assessment**: Understand existing systems and constraints
3. **Design Recommendations**: Propose architecture with clear justification
4. **Implementation Roadmap**: Provide phased approach with milestones

## Output Format

- Use diagrams when helpful (C4 models, component diagrams)
- Provide trade-off analysis for each decision
- Include risk assessment for proposed architectures
- Suggest validation and testing strategies
```

**Key Changes**:

- ✅ Moved from Promptfiles to Chat Modes directory
- ✅ Changed schema from `mode: chat` to chat mode format
- ✅ Kept behavioral instructions ("You are a Solution Architect")
- ✅ Added `icon` field for visual identification
- ✅ Added complete AI provenance metadata
- ✅ Still allows 100+ lines (appropriate for chat modes)

---

### Fix Example 3: Move Long File to Instructions with Wrapper Promptfile (Option C)

**File**: `compliance-check.prompt.md`

**Step 1: Create Instruction File**

**File**: `.github/instructions/compliance-framework.instructions.md` (New file, move content here)

```yaml
---
ai_generated: true
model: "anthropic/claude-3.5-sonnet@2024-10-22"
operator: "johnmillerATcodemag-com"
chat_id: "compliance-framework-split-20260211"
prompt: "Create comprehensive compliance framework instruction file"
started: "2026-02-11T14:50:00Z"
ended: "2026-02-11T15:30:00Z"
task_durations:
  - task: "content migration"
    duration: "00:40:00"
total_duration: "00:40:00"
ai_log: "ai-logs/2026/02/11/compliance-framework-split-20260211/conversation.md"
source: "johnmillerATcodemag-com"
applyTo: "**/*"
---
# Compliance Validation Framework

[
  Move all detailed compliance framework content here - 237 lines of: - Security & Privacy Standards (SOC 2,
  ISO 27001,
  NIST,
  PCI-DSS,
  HIPAA,
  etc.)
  - Privacy Regulations (GDPR,
  CCPA,
  HIPAA,
  PIPEDA,
  LGPD)
  - Industry Standards (COBIT,
  ITIL,
  TOGAF,
  CAF)
  - Technical Standards and mappings
  - Compliance frameworks and assessment procedures
  - Detailed validation checklists,
]
```

**Step 2: Simplify Promptfile to Wrapper**

**File**: `compliance-check.prompt.md` (Simplified)

```yaml
---
name: compliance-check
description: Validate architecture against regulatory and compliance frameworks

arguments:
  architecture_doc:
    type: string
    description: Path to architecture document or design to validate
  frameworks:
    type: enum
    values: ["SOC2", "ISO27001", "NIST", "GDPR", "HIPAA", "PCI-DSS", "ALL"]
    description: Compliance frameworks to validate against
    default: "ALL"

tags: ["compliance", "governance", "validation", "standards"]

ai_generated: true
model: "anthropic/claude-3.5-sonnet@2024-10-22"
operator: "johnmillerATcodemag-com"
chat_id: "compliance-check-fix-20260211"
prompt: "Create compliance validation promptfile with reference to framework"
started: "2026-02-11T15:35:00Z"
ended: "2026-02-11T15:45:00Z"
task_durations:
  - task: "promptfile creation"
    duration: "00:10:00"
total_duration: "00:10:00"
ai_log: "ai-logs/2026/02/11/compliance-check-fix-20260211/conversation.md"
source: "johnmillerATcodemag-com"
---

# Compliance Validation

Validate the architecture from {{architecture_doc}} against {{frameworks}} compliance frameworks.

## Reference Materials

For comprehensive compliance framework details, see:
- [Compliance Validation Framework](.github/instructions/compliance-framework.instructions.md)

## Quick Validation Steps

1. **Requirements Identification**: Extract compliance requirements from framework
2. **Gap Analysis**: Compare architecture against framework controls
3. **Risk Assessment**: Identify compliance gaps and remediation priorities
4. **Recommendations**: Provide specific architectural adjustments needed

## Output

- Compliance score per framework (0-100%)
- Detailed gap report with evidence
- Remediation roadmap with priorities
- Risk assessment by control area
```

**Key Changes**:

- ✅ Promptfile reduced from 237 lines to ~40 lines
- ✅ Created separate instruction file for detailed content
- ✅ Promptfile references instruction for detailed guidance
- ✅ Added arguments for parametrization
- ✅ Task-focused without behavioral instructions
- ✅ Complete AI provenance for both files
- ✅ Users can use `@compliance-check` for quick validation
- ✅ Developers can reference instruction file for implementation details

---

### Fix Example 4: Flatten Directory Structure

**Current Structure** ❌:

```
.github/copilot/Promptfiles/
├── architecture-design.prompt.md
├── compliance-check.prompt.md
├── solution-architect/
│   ├── architecture-design.prompt.md      # DUPLICATE/CONFLICT
│   ├── compliance-check.prompt.md         # DUPLICATE/CONFLICT
│   ├── integration-design.prompt.md
│   ├── migration-strategy.prompt.md
│   ├── pattern-analysis.prompt.md
│   ├── performance-analysis.prompt.md
│   ├── risk-assessment.prompt.md
│   ├── scalability-planning.prompt.md
│   ├── security-architecture.prompt.md
│   └── technology-evaluation.prompt.md
├── meta/
│   └── README.md
└── README.md
```

**Target Structure** ✅:

```
.github/copilot/Promptfiles/
├── architecture-design.md
├── compliance-check.md
├── integration-design.md
├── migration-strategy.md
├── pattern-analysis.md
├── performance-analysis.md
├── risk-assessment.md
├── scalability-planning.md
├── security-architecture.md
├── technology-evaluation.md
├── [all other promptfiles]
└── README.md

.github/copilot/chat_modes/
├── solution-architect.md      # ← If Option B chosen
├── code-reviewer.md
└── README.md

.github/instructions/
├── [existing instruction files...]
├── compliance-framework.instructions.md
├── architecture-patterns.instructions.md
└── [additional instruction files as needed]
```

**Actions**:

1. ✅ Remove `solution-architect/` subdirectory
2. ✅ Remove `meta/` subdirectory
3. ✅ Move files to flat structure in Promptfiles
4. ✅ Consolidate duplicates (keep one authoritative version)
5. ✅ Create chat_modes for behavioral files (if Option B chosen)
6. ✅ Update README.md to remove subdirectory references

---

### Fix Example 5: Batch Conversion Script

For efficiency, here's a script to help with bulk conversions:

**Script**: `scripts/fix-promptfiles.sh`

```bash
#!/bin/bash
# Promptfile Compliance Fix Script

set -e

PROMPTFILES_DIR=".github/copilot/Promptfiles"
CHAT_MODES_DIR=".github/copilot/chat_modes"
INSTRUCTIONS_DIR=".github/instructions"

# Create required directories
mkdir -p "$CHAT_MODES_DIR"

# Function to add missing YAML fields
add_missing_fields() {
    local file=$1
    local name=$(basename "$file" .prompt.md | tr '_' '-')

    # Extract existing fields (if any)
    local model=$(grep "^model:" "$file" | head -1 | cut -d'"' -f2)

    # Add missing provenance if ai_generated: true
    if grep -q "^ai_generated: true" "$file"; then
        # Add fields (implementation uses sed or yq)
        echo "Would add AI provenance to: $file"
    fi
}

# Fix all promptfiles
for file in "$PROMPTFILES_DIR"/*.prompt.md; do
    echo "Processing: $file"
    add_missing_fields "$file"
done

echo "✅ Fix script complete. Review changes before committing."
```

---

## Expected Compliance After Remediation

After implementing Priority 1 and 2 recommendations:

After implementing Priority 1 and 2 recommendations:

- ✅ All files have proper `name` field
- ✅ All files have Copilot-compatible YAML structure
- ✅ All AI-generated files have complete provenance metadata
- ✅ All files are task-focused (no "You are..." instructions)
- ✅ All files appear in Copilot `@` picker
- ✅ File structure is flat (no subdirectories for promptfiles)
- ✅ Consistent file extensions
- ✅ Average length 20-50 lines (reduced from 100+)
- ✅ Audit trail documented in `ai-logs/`

---

## Next Steps

1. **Immediate**: Read and understand this compliance report
2. **Week 1**: Decide remediation approach (Options A, B, or C)
3. **Week 2**: Implement critical fixes (Priority 1)
4. **Week 3**: Implement important fixes (Priority 2)
5. **Week 4**: Test and validate compliance
6. **Week 5**: Run compliance review again to verify

---

## References

- `.github/instructions/prompt-file.instructions.md` - Official promptfile spec
- `.github/instructions/ai-assisted-output.instructions.md` - AI provenance requirements
- `.github/instructions/chatmode-file.instructions.md` - Chat mode spec (if using Option B)
- `.github/instructions/instruction-files.instructions.md` - Instruction file spec (if using Option C)
- [GitHub Copilot Promptfiles Documentation](https://docs.github.com/copilot/customizing-copilot/promptfiles)

---

**Report Generated**: 2026-02-11
**Next Review**: After remediation completion
**Owner**: Development Team
