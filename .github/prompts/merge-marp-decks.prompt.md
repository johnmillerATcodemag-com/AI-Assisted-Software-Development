---
name: merge-marp-decks
description: "Merge individual Marp slide decks into a single combined presentation. Supports manifest-driven merges via $MANIFEST variable."
tags: ["marp", "slides", "presentation", "merge"]
ai_generated: true
model: "anthropic/claude-sonnet-4.5@2026-03-18"
operator: "johnmillerATcodemag-com"
chat_id: "merge-marp-decks-20260318"
prompt: |
  Follow instructions in merge-marp-decks.prompt.md — create promptfile for merging
  individual Marp slide decks from Slides/individual-slides/ into a combined deck
started: "2026-03-18T23:25:18Z"
ended: "2026-03-18T23:30:00Z"
task_durations:
  - task: "promptfile creation"
    duration: "00:05:00"
total_duration: "00:05:00"
ai_log: "ai-logs/2026/03/18/merge-marp-decks-20260318/conversation.md"
source: "johnmillerATcodemag-com"
output_path: "Slides/ai-assisted-dev-overview.md"
version: "2.0.0"
owner: "johnmillerATcodemag-com"
arguments:
  MANIFEST:
    type: string
    description: >
      Optional path to a YAML manifest file (e.g. Slides/aiasd-311-tuesday.yaml).
      When provided, the manifest controls which slide files are merged and the
      output path. When omitted, all *.md files in Slides/individual-slides/ are
      merged into Slides/ai-assisted-dev-overview.md.
---

# Merge Marp Slide Decks

Merge individual Marp slide decks into a single combined presentation.

Supports two modes:

- **Manifest mode** (`$MANIFEST` provided): merge the specific decks listed in the
  manifest YAML and write to the output path defined there.
- **Default mode** (no `$MANIFEST`): merge all `*.md` files from
  `Slides/individual-slides/` into `Slides/ai-assisted-dev-overview.md`.

## Inputs

### When `$MANIFEST` is provided

- Manifest file: `$MANIFEST` (e.g. `Slides/aiasd-311-tuesday.yaml`)
- The manifest YAML contains:
  - `title` — display title for the combined deck
  - `output` — output file path for the merged deck
  - `theme` / `paginate` — Marp front-matter overrides (optional)
  - `chat_id` / `ai_log` — provenance identifiers for the merged file
  - `slides[]` — ordered list of `{ path, title, subtitle, module }` entries
- Provenance policy: `.github/instructions/ai-assisted-output.instructions.md`

### Default mode (no `$MANIFEST`)

- Source files: all `*.md` files in `Slides/individual-slides/`
- Provenance policy: `.github/instructions/ai-assisted-output.instructions.md`

## Steps

1. **Resolve inputs**:
   - If `$MANIFEST` is set, read the manifest YAML to get the ordered slide list,
     output path, title, `chat_id`, and `ai_log`.
   - Otherwise, discover all Marp slide files (`marp: true` in front matter) in
     `Slides/individual-slides/` and use `Slides/ai-assisted-dev-overview.md` as
     the output path.

2. **Strip** the YAML front matter from each individual deck (keep slides content only).

3. **Assemble** the combined deck:
   - Add a new combined YAML front matter block with `marp: true`, `theme`,
     `paginate`, and all required AI provenance fields.
   - Add a title slide:
     - In manifest mode, use the manifest `title`.
     - In default mode, use `AI-Assisted Software Development – Complete Training Course`.
   - For each deck in the ordered list, insert a `---` section divider slide with
     the deck's topic as a heading (use `title` and `subtitle` from the manifest
     if available, otherwise derive from the file's first `#` heading).
   - Append the deck's slide content (without its own front matter).

4. **Add** required AI provenance YAML front matter fields (`ai_generated`,
   `model`, `operator`, `chat_id`, `prompt`, `started`, `ended`,
   `task_durations`, `total_duration`, `ai_log`, `source`).

5. **Write** the merged output to the resolved output path.

6. **Create** `ai-logs/<yyyy>/<mm>/<dd>/<chat-id>/conversation.md` and `summary.md`.

7. **Update** `README.md` with an entry for the new combined slide deck.

## Output

- Combined Marp deck written to the resolved output path.
- Every slide must have speaker notes using pandoc `:::notes` syntax.
- File must include complete AI provenance YAML front matter.

## Acceptance Criteria

- [ ] All decks from the manifest (or `Slides/individual-slides/`) are in the merged output.
- [ ] Section divider slides separate each source deck.
- [ ] Every slide has speaker notes.
- [ ] Combined file has valid Marp front matter.
- [ ] AI provenance metadata is complete.
- [ ] `ai-logs` conversation and summary files exist.
- [ ] README updated with new entry.
