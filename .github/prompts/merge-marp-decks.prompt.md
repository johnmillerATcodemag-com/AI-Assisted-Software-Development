---
name: merge-marp-decks
description: "Merge individual Marp slide decks from Slides/individual-slides/ into a single combined presentation"
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
version: "1.0.0"
owner: "johnmillerATcodemag-com"
---

# Merge Marp Slide Decks

Merge all individual Marp slide decks from `Slides/individual-slides/` into a single combined presentation.

## Inputs

- Source files: all `*.md` files in `Slides/individual-slides/`
- Instructions: `.github/instructions/marp-slides.instructions.md`
- Provenance policy: `.github/instructions/ai-assisted-output.instructions.md`

## Steps

1. **Discover** all Marp slide files in `Slides/individual-slides/` (files with `marp: true` in front matter).
2. **Strip** the YAML front matter from each individual deck (keep the slides content only).
3. **Assemble** the combined deck:
   - Add a new combined YAML front matter block with `marp: true`, `theme: default`, and `paginate: true`.
   - Add a title slide identifying this as the combined presentation.
   - Insert a `---` section divider slide between each deck with the deck's topic as a header.
   - Append each deck's slide content (without its own front matter).
4. **Add** required AI provenance YAML front matter fields to the combined file.
5. **Write** the merged output to `Slides/ai-assisted-dev-overview.md`.
6. **Create** `ai-logs/<yyyy>/<mm>/<dd>/<chat-id>/conversation.md` and `summary.md`.
7. **Update** `README.md` with an entry for the new combined slide deck.

## Output

- Combined Marp deck: `Slides/ai-assisted-dev-overview.md`
- Every slide must have speaker notes using pandoc `:::notes` syntax.
- File must include complete AI provenance YAML front matter.

## Acceptance Criteria

- [ ] All individual decks from `Slides/individual-slides/` are represented in the merged output.
- [ ] Section divider slides separate each source deck.
- [ ] Every slide has speaker notes.
- [ ] Combined file has valid Marp front matter.
- [ ] AI provenance metadata is complete.
- [ ] README updated with new entry.
