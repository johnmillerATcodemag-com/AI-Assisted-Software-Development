---
mode: agent
model: "anthropic/claude-3.5-sonnet@2024-10-22"
tools: ["search", "edit", "fetch"]
description: "Detect dead code and generate GitHub issues with remediation"
prompt_metadata:
  id: create-issues-dead-code
  title: Dead Code Analysis to GitHub Issues
  owner: johnmillerATcodemag-com
  version: "1.0.0"
  created: "2025-02-05"
  updated: "2025-02-05"
  output_path: dead-code-analysis.md
  category: analysis
  tags: [dead-code, github-issues, analysis, cleanup, code-quality]
  output_format: markdown
---

# Dead Code Analysis — Findings to GitHub Issues

Analyze codebase and create GitHub issues for dead code.

## Definitions
- **Dead file**: No inbound refs, not an entry point
- **Dead export/symbol**: Exported but never imported/referenced
- **Dead code path**: Function/branch unreachable given call graph/feature flags

## Exclusions
`.git/`, `node_modules/`, `dist/`, `build/`, `.venv/`, `.env/`, `.cache/`, binaries

## Process
1. **Identify entry points**: Bootstrap, CLI scripts, package.json entries, bundler configs
2. **Build reference map**: Map imports/exports, intra-repo refs (files/functions/classes), consider dynamic imports
3. **Detect candidates**: Files with zero inbound refs not in entries, unreferenced exports/symbols, obsolete flags
4. **Validate**: File paths, symbol names, line ranges, note dynamic resolution caveats
5. **Create issues**: Per finding with title, evidence, remediation, labels
6. **Summarize**: Executive summary + durations

## Output (Markdown)

### Executive summary
2–3 sentences on dead code footprint and cleanup impact

### Findings table
| ID | Type | Target | Evidence | Risk | Action |
|----|------|--------|----------|------|--------|
| DEAD-001 | Unused file | `path/file.ts` | No inbound refs | Low | Remove, verify CI |

### GitHub issue drafts per finding
**[DEAD-001] Unused file: path**
- Type: Unused file
- Evidence: Not imported, not in build entries
- Risk: Low (no runtime use detected)
- Description: Can be removed to reduce maintenance
- Acceptance: File deleted, CI/build passes, no regressions
- Remediation: Remove file, run full build/tests
- Labels: cleanup, tech-debt

### Sources scanned
Key files/dirs consulted

### Durations
Per-step + total

## Constraints
- Heuristic-based, conservative
- Provide evidence and caveats for dynamic loading
- No external calls/edits
