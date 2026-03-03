# ApplyTo Glob Pattern Review

**Review Date**: March 3, 2026
**Reviewer**: GitHub Copilot (Claude Sonnet 4.5)
**Purpose**: Evaluate the specificity and correctness of `applyTo` glob patterns in instruction files

## Executive Summary

**Total Files Reviewed**: 13 instruction files
**Correctly Scoped**: 6 files (46%)
**Too Broad**: 5 files (38%)
**Naming Inconsistency**: 1 file (8%)
**Requires Discussion**: 1 file (8%)

## Detailed Analysis

### ✅ Correctly Scoped (Specific and Appropriate)

#### 1. chatmode-file.instructions.md

- **Current**: `applyTo: "**/*.chatmode.md"`
- **Status**: ✅ CORRECT
- **Rationale**: Applies only to chatmode files, which is exactly what this instruction is about
- **Action**: None needed

#### 2. custom-agents.instructions.md

- **Current**: `applyTo: "**/*.agent.md"`
- **Status**: ✅ CORRECT
- **Rationale**: Applies only to custom agent files, which is exactly what this instruction is about
- **Action**: None needed

#### 3. instruction-prompt-files.instructions.md

- **Current**: `applyTo: "**/*.instructions.prompt.md"`
- **Status**: ✅ CORRECT
- **Rationale**: Applies only to instruction prompt files, which is exactly what this instruction is about
- **Action**: None needed

#### 4. marp-slides.instructions.md

- **Current**: `applyTo: "Slides/individual-slides/**"`
- **Status**: ✅ CORRECT
- **Rationale**: Applies only to files in the specific slides directory, which is exactly where Marp slides are created
- **Action**: None needed

#### 5. prompt-file.instructions.md

- **Current**: `applyTo: "**/*.prompt.md"`
- **Status**: ✅ CORRECT
- **Rationale**: Applies only to prompt files, which is exactly what this instruction is about
- **Action**: None needed

#### 6. vertical-slice.instructions.md

- **Current**: `applyTo: "**/*.{cs,ts,js,py,java,go,rb}"`
- **Status**: ✅ CORRECT
- **Rationale**: Applies only to code files in languages where vertical slice architecture is implemented
- **Action**: None needed

### ⚠️ Too Broad (Needs More Specificity)

#### 7. business-rules-to-slices.instructions.md

- **Current**: `applyTo: "**/*.{md,txt}"`
- **Status**: ⚠️ TOO BROAD
- **Issue**: Applies to ALL markdown and text files, including slides, docs, logs, READMEs, etc.
- **Purpose**: Guidance for analyzing business requirements and designing vertical slices
- **Recommended**:
  ```yaml
  applyTo: "**/requirements/**/*.{md,txt}|**/specs/**/*.{md,txt}|**/docs/requirements/**/*.{md,txt}"
  ```
  Or if applicable to all business/requirements documents:
  ```yaml
  applyTo: "**/{requirements,specs,use-cases,business-rules}/**/*.{md,txt}"
  ```
- **Alternative**: If this should apply during feature design conversations rather than specific files:
  ```yaml
  applyTo: "**/*.{feature,spec,requirements}.md"
  ```

#### 8. cqrs-architecture.instructions.md

- **Current**: `applyTo: "**/*"`
- **Status**: ⚠️ TOO BROAD
- **Issue**: Applies to ALL files including docs, configs, slides, etc.
- **Purpose**: CQRS architecture guidance for implementation
- **Recommended**:
  ```yaml
  applyTo: "**/*.{cs,ts,js,py,java,go,rb,kt,swift}"
  ```
  This targets code files where CQRS would actually be implemented

#### 9. github-cli.instructions.md

- **Current**: `applyTo: "**/*"`
- **Status**: ⚠️ TOO BROAD
- **Issue**: Applies to ALL files, but GitHub CLI is primarily for workflow automation
- **Purpose**: Guidelines for using GitHub CLI
- **Recommended**:
  ```yaml
  applyTo: "**/*.{sh,ps1,bash,yml,yaml}|**/.github/**/*"
  ```
  This targets scripts, workflows, and GitHub-specific directories

#### 10. dependency-management-policy.instructions.md

- **Current**: `applyTo: "**/*"`
- **Status**: ⚠️ POSSIBLY TOO BROAD
- **Issue**: Applies to ALL files, but this is a policy document
- **Purpose**: Dependency management policy across projects
- **Recommended Option 1** (If truly cross-cutting):

  ```yaml
  applyTo: "**/*"
  ```

  Keep as-is since dependency management affects all aspects of development

- **Recommended Option 2** (If focused on dependency files):
  ```yaml
  applyTo: "**/package*.json|**/requirements*.txt|**/*proj|**/pom.xml|**/build.gradle|**/Gemfile|**/go.mod|**/Cargo.toml"
  ```
  This targets actual dependency manifest files

**Recommendation**: Discuss with team whether this should be a universal policy or targeted at dependency files

### 🔄 Universal/Policy Files (Potentially Appropriate as Broad)

#### 11. ai-assisted-output.instructions.md

- **Current**: `applyTo: "**/*"`
- **Status**: ✅ APPROPRIATE (Universal Policy)
- **Rationale**: AI provenance policy applies to any AI-generated content regardless of file type
- **Action**: None needed - this is a cross-cutting policy

### ❌ Naming Inconsistency

#### 12. instruction-files.instructions.md

- **Current**: `appliesTo: "**/*.instructions.md"` (Note: "appliesTo" not "applyTo")
- **Status**: ❌ INCONSISTENT NAMING
- **Issue**: Uses "appliesTo" instead of "applyTo" like all other files
- **Pattern**: Otherwise correct and specific
- **Recommended Fix**:
  ```yaml
  applyTo: "**/*.instructions.md"
  ```

## Recommendations Summary

### High Priority (Fix These)

1. **instruction-files.instructions.md**: Change `appliesTo` → `applyTo` for consistency
2. **cqrs-architecture.instructions.md**: Change `**/*` → `**/*.{cs,ts,js,py,java,go,rb,kt,swift}`
3. **github-cli.instructions.md**: Change `**/*` → `**/*.{sh,ps1,bash,yml,yaml}|**/.github/**/*`

### Medium Priority (Discuss and Decide)

4. **business-rules-to-slices.instructions.md**: Refine `**/*.{md,txt}` to target specific requirements/specs directories
5. **dependency-management-policy.instructions.md**: Decide if this should remain universal or target specific dependency files

## Implementation Plan

### Phase 1: Critical Fixes

- [ ] Fix naming inconsistency in instruction-files.instructions.md
- [ ] Narrow scope of cqrs-architecture.instructions.md
- [ ] Narrow scope of github-cli.instructions.md

### Phase 2: Team Discussion

- [ ] Review business-rules-to-slices.instructions.md scope with team
- [ ] Review dependency-management-policy.instructions.md scope with team

### Phase 3: Documentation

- [ ] Update README.md with guidance on choosing appropriate applyTo patterns
- [ ] Create a decision matrix for applyTo scope selection

## ApplyTo Pattern Guidelines

### When to Use Broad Patterns (`**/*`)

**Appropriate for**:

- Universal policies (security, AI provenance)
- Cross-cutting concerns affecting all file types
- Repository-wide standards

**Examples**:

- AI provenance requirements
- Security/compliance policies
- General coding standards

### When to Use Specific Patterns

**Appropriate for**:

- File-type specific instructions
- Domain-specific guidelines (architecture patterns)
- Tool-specific workflows

**Examples**:

- Code architecture patterns → code files only
- Slide creation → slide directories only
- Prompt authoring → prompt files only

### Pattern Examples by Use Case

| Use Case                | Pattern                   | Example                       |
| ----------------------- | ------------------------- | ----------------------------- |
| Specific file extension | `**/*.ext`                | `**/*.prompt.md`              |
| Multiple extensions     | `**/*.{ext1,ext2}`        | `**/*.{ts,js}`                |
| Specific directory      | `path/to/dir/**`          | `Slides/individual-slides/**` |
| Multiple directories    | `**/{dir1,dir2}/**`       | `**/{src,lib}/**`             |
| Complex conditions      | Multiple patterns with \| | `**/*.sh\|**/.github/**/*`    |

## Conclusion

The current instruction files show a mix of appropriately scoped and overly broad `applyTo` patterns. The primary issues are:

1. **Over-application**: Several domain-specific instructions use `**/*` when they should target specific file types
2. **Naming inconsistency**: One file uses `appliesTo` instead of `applyTo`
3. **Lack of guidance**: No documented standards for choosing appropriate scope

Implementing the recommended changes will:

- Improve AI assistant context relevance
- Reduce token usage by loading only applicable instructions
- Make the instruction system more maintainable
- Provide clearer intent for each instruction file

---

**Review Completed**: March 3, 2026
**Next Review**: When new instruction files are added or existing ones modified
**Maintained By**: Development Team
