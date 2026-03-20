---
name: merge-marp-decks
description: "Merge individual Marp slide decks into a single combined presentation, optionally driven by a YAML manifest"
tags: ["marp", "slides", "presentation", "merge"]
ai_generated: true
model: "anthropic/claude-opus-4.5@2026-03-20"
operator: "johnmillerATcodemag-com"
chat_id: "merge-aiasd-311-monday-20260320"
prompt: |
  $MANIFEST = Slides/aiasd-311-monday.yaml
  Follow instructions in merge-marp-decks.prompt.md.
started: "2026-03-20T04:00:00Z"
ended: "2026-03-20T04:15:00Z"
task_durations:
  - task: "add manifest support"
    duration: "00:10:00"
  - task: "update acceptance criteria"
    duration: "00:05:00"
total_duration: "00:15:00"
ai_log: "ai-logs/2026/03/20/merge-aiasd-311-monday-20260320/conversation.md"
source: "johnmillerATcodemag-com"
output_path: "Slides/ai-assisted-dev-overview.md"
version: "2.0.0"
owner: "johnmillerATcodemag-com"
---

# Merge Marp Slide Decks

Merge individual Marp slide decks into a single combined presentation.
Supports two modes: **manifest-driven** (recommended) and **directory-scan** (default).

## Manifest-Driven Mode (Recommended)

When a `$MANIFEST` variable is set, read the manifest YAML to determine inputs and output:

```
$MANIFEST = Slides/<session-name>.yaml
```

The manifest specifies:
- `output` — path to write the merged deck (e.g., `Slides/aiasd-311-monday.md`)
- `title` / `subtitle` — deck title and subtitle
- `slides` — ordered list of individual slide files to include, each with `path`, `module`, `title`, and `description`
- `marp` — Marp front matter settings (`theme`, `paginate`)
- `metadata` — session metadata (course, day, audience, etc.)

## Directory-Scan Mode (Default)

When no manifest is provided, merge all `*.md` files in `Slides/individual-slides/` and write to `Slides/ai-assisted-dev-overview.md`.

## Inputs

- **Manifest** (if `$MANIFEST` set): the manifest YAML file
- **Source files**: `*.md` files listed in the manifest `slides` array, or all files in `Slides/individual-slides/`
- **Instructions**: `.github/instructions/marp-slides.instructions.md`
- **Provenance policy**: `.github/instructions/ai-assisted-output.instructions.md`

## Steps

1. **Resolve inputs**: If `$MANIFEST` is set, read the manifest; otherwise discover all Marp files in `Slides/individual-slides/`.
2. **Strip** the YAML front matter from each individual deck (keep only the slide content).
3. **Assemble** the combined deck:
   - Add a new YAML front matter block with provenance metadata, `marp: true`, `theme`, and `paginate` (from manifest or defaults).
   - Add a title slide using the manifest `title`/`subtitle` or a generic title.
   - For each slide deck in order:
     - Insert an HTML comment `<!-- MODULE N: TITLE -->` separator.
     - Insert a `---` section divider slide with the module number and topic as a header (include speaker notes explaining the module).
     - Append the deck's slide content.
4. **Add** required AI provenance YAML front matter fields to the combined file.
5. **Write** the merged output to the path specified in the manifest `output` field, or `Slides/ai-assisted-dev-overview.md` if no manifest.
6. **Create** `ai-logs/<yyyy>/<mm>/<dd>/<chat-id>/conversation.md` and `summary.md`.
7. **Update** `README.md` with an entry for the new combined slide deck.

## Output

- Combined Marp deck at the manifest `output` path (or `Slides/ai-assisted-dev-overview.md`)
- Every slide must have speaker notes using pandoc `:::notes` syntax
- File must include complete AI provenance YAML front matter

## Acceptance Criteria

- [ ] Manifest is read (if `$MANIFEST` is set) and its `slides` list determines input order and selection.
- [ ] All listed slide decks are represented in the merged output.
- [ ] Section divider slides (with module numbers) separate each source deck.
- [ ] Every slide has speaker notes.
- [ ] Combined file has valid Marp front matter.
- [ ] Output is written to the manifest `output` path.
- [ ] AI provenance metadata is complete.
- [ ] README updated with new entry.
