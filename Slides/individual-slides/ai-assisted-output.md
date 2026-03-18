---
ai_generated: true
model: "anthropic/claude-sonnet-4.5@2026-03-18"
operator: "johnmillerATcodemag-com"
chat_id: "merge-marp-decks-20260318"
prompt: |
  Follow instructions in merge-marp-decks.prompt.md — create individual Marp slide deck
  from .github/instructions/ai-assisted-output.instructions.md
started: "2026-03-18T22:41:07Z"
ended: "2026-03-18T22:55:00Z"
task_durations:
  - task: "content analysis"
    duration: "00:03:00"
  - task: "slide creation"
    duration: "00:08:00"
  - task: "speaker notes"
    duration: "00:03:00"
total_duration: "00:14:00"
ai_log: "ai-logs/2026/03/18/merge-marp-decks-20260318/conversation.md"
source: ".github/prompts/merge-marp-decks.prompt.md"
marp: true
theme: default
paginate: true
---

# AI-Assisted Output

## Provenance, Logging & Quality Standards

*AI-Assisted Software Development*

::: notes
Welcome to this module on AI-Assisted Output standards. This session covers the policies and practices for ensuring all AI-generated artifacts in a development repository include proper provenance metadata, audit logs, and quality checks.

**Timing**: 1 minute for title slide

**Key Points**:
- All AI-assisted artifacts must carry metadata documenting how they were produced
- Proper logging enables audits and team understanding of AI contributions
- These standards apply to code, docs, diagrams, tests, and data

**Delivery**: Start by asking how many in the audience have worked with AI-generated code. Establish why tracking AI provenance matters for team trust and code quality.

**Transition**: "Let's start with why provenance matters and what we mean by AI-assisted output."
:::

---

## Why AI Provenance Matters

- **Auditability** — know exactly how each artifact was produced
- **Trust** — teams can review and verify AI contributions
- **Reproducibility** — recreate outputs when needed
- **Accountability** — track who triggered which AI task
- **Quality gates** — block non-compliant artifacts in CI

::: notes
AI provenance is the practice of recording the origin of AI-generated artifacts — who requested them, which model produced them, and from which conversation.

**Timing**: 2 minutes

**Key Points**:
- Without provenance, AI contributions become a black box
- Audits become impossible when metadata is missing
- CI enforcement ensures standards are followed consistently
- Trust is built when the team understands AI's role in each artifact

**Example**: Imagine a bug in production traced back to AI-generated code with no record of the prompt or model version — debugging becomes much harder.

**Audience Interaction**: "How many of you have received AI-generated code where you couldn't tell what prompt produced it?"

**Transition**: "So what metadata do we actually need to capture?"
:::

---

## Required Provenance Metadata

Every AI-assisted artifact must embed:

```yaml
ai_generated: true
model: "provider/model-name@version"
operator: "github-username"
chat_id: "unique-chat-identifier"
prompt: |
  Exact prompt text
started: "ISO8601-timestamp"
ended: "ISO8601-timestamp"
task_durations:
  - task: "task name"
    duration: "HH:MM:SS"
total_duration: "HH:MM:SS"
ai_log: "ai-logs/yyyy/mm/dd/chat-id/conversation.md"
source: "creator-identifier"
```

::: notes
These 10 fields form the canonical provenance block for every AI-generated file.

**Timing**: 3 minutes

**Key Points**:
- `model` must use the `provider/model@version` format — not "github/copilot" or "Auto"
- `chat_id` links back to the full conversation log
- `prompt` should be the exact text that triggered creation
- `task_durations` breaks down where time was spent
- `ai_log` path must exist in the repository

**Common Mistakes**:
- Using vague model names like "Claude" instead of "anthropic/claude-3.5-sonnet@2024-10-22"
- Omitting the `prompt` field or using a summary instead of exact text
- Forgetting to create the ai-log file after generating the artifact

**Transition**: "Where exactly do these fields go in a file?"
:::

---

## Metadata Placement Policy

| File Type | Where to Put Metadata |
|-----------|----------------------|
| Markdown (`.md`) | YAML front matter at top of file |
| Code files | Header comment block |
| Binary/Image | Sidecar `<filename>.meta.md` |
| JSON/YAML | Top-level `_ai_provenance` key |

> **Rule**: Sidecar files are prohibited for Markdown — always embed.

::: notes
The placement policy ensures metadata is co-located with the artifact it describes.

**Timing**: 2 minutes

**Key Points**:
- Markdown files use YAML front matter — the `---` delimited block at the top
- Sidecars are only for formats that cannot embed metadata (images, binaries)
- Never create a sidecar for a Markdown file — this is explicitly prohibited

**Practical Example**:
Show a Markdown file with embedded front matter vs. a sidecar for a PNG diagram.

**Transition**: "Now let's talk about the logging workflow — what goes in the ai-logs folder."
:::

---

## AI Chat Logging Workflow

```
ai-logs/
└── <yyyy>/
    └── <mm>/
        └── <dd>/
            └── <chat-id>/
                ├── conversation.md  ← Full exchange log
                └── summary.md       ← Resumability context
```

**Before starting**: Create log directory and files  
**During work**: Record each exchange  
**After completion**: Write summary with next steps

::: notes
The ai-logs folder is the audit trail for all AI-assisted work. It must be created before generating any artifacts.

**Timing**: 2 minutes

**Key Points**:
- Chat ID must be unique — use descriptive names like `create-user-auth-20260318`
- `conversation.md` records each prompt-response exchange
- `summary.md` captures what was produced and what comes next
- Logs must exist before committing the artifact — don't create them retroactively

**Workflow Order**:
1. Create the ai-logs directory structure first
2. Record the initial prompt
3. Create the artifact
4. Record the exchange in conversation.md
5. Write summary.md

**Transition**: "What should the conversation.md contain?"
:::

---

## Conversation Log Template

```markdown
# AI Conversation Log

- Chat ID: <chat-id>
- Operator: <github-username>
- Model: <provider/model@version>
- Started: <ISO8601>
- Ended: <ISO8601>

## Context
- Inputs: [files referenced]
- Targets: [files to create]
- Constraints: [applicable policies]

## Exchanges

### Exchange 1
[timestamp] User
> [exact prompt text]

[timestamp] Model
> [summary of response and artifacts created]
```

::: notes
The conversation.md template ensures all key information is captured consistently.

**Timing**: 2 minutes

**Key Points**:
- The header captures who, what model, and when
- Context section identifies inputs, outputs, and constraints
- Each exchange is timestamped and includes both sides of the conversation
- The "exact prompt text" requirement means copy-paste — no paraphrasing

**Audience Question**: "Why do we require the exact prompt text rather than a summary?"
Answer: Exact prompts allow reproduction of the output and help identify prompt injection risks.

**Transition**: "Let's look at quality gates — how do we enforce these standards automatically?"
:::

---

## Quality Gates & CI Enforcement

**PR Checklist** (required before merge):
- [ ] All AI artifacts have complete provenance front matter
- [ ] `ai_log` path exists in the repository
- [ ] Model uses `provider/model@version` format
- [ ] Conversation log has at least one exchange recorded
- [ ] README updated with artifact entry and log link

**CI Checks**:
- Lint YAML front matter structure
- Verify ai-log path exists
- Block merge if required fields are missing

::: notes
CI enforcement turns the policy into hard requirements — not suggestions.

**Timing**: 2 minutes

**Key Points**:
- The PR checklist should be in the PR template so it's visible during review
- CI can use a simple script to check for required YAML fields
- Blocking merge is intentional — it creates a forcing function for compliance
- The README update requirement ensures discoverability of AI artifacts

**Implementation Tip**: Use a GitHub Actions workflow that checks for `ai_generated: true` in all changed Markdown files and validates required fields.

**Transition**: "Let's cover the post-creation requirements that complete the workflow."
:::

---

## Post-Creation Requirements

After every AI-assisted artifact:

1. ✅ **Conversation log** — `ai-logs/.../conversation.md` created
2. ✅ **Summary** — `ai-logs/.../summary.md` with resumability context  
3. ✅ **README update** — entry with description and log link
4. ✅ **Metadata verified** — all required provenance fields present
5. ✅ **Links validated** — all internal references work

> These steps are **canonical** — referenced by all other instruction files.

::: notes
The post-creation checklist is the final gate before committing AI-generated work.

**Timing**: 2 minutes

**Key Points**:
- All 5 steps must be completed — they are not optional
- "Resumability context" in the summary means future AI sessions can pick up where this one left off
- The README update makes artifacts discoverable to the team
- Link validation prevents broken references in documentation

**Common Failure Mode**: Teams often skip the summary.md because they're in a hurry. Emphasize that this is the most valuable artifact for future sessions.

**Transition**: "Let's wrap up with key takeaways."
:::

---

## Key Takeaways

- **Every AI artifact** needs complete provenance metadata
- **ai-logs** must be created **before** generating artifacts
- **Exact prompts** — not summaries — go in the conversation log
- **CI enforces** the policy — blocking non-compliant merges
- **README entries** make AI contributions discoverable

### Next Steps

1. Review `.github/instructions/ai-assisted-output.instructions.md`
2. Add the PR checklist to your team's PR template
3. Set up CI lint check for provenance metadata

::: notes
Wrap up with the essential points and clear next steps.

**Timing**: 2 minutes

**Summary**:
- Provenance metadata is mandatory for every AI-generated file
- The 10-field YAML block goes in the front matter of Markdown files
- ai-logs create an auditable trail of AI-assisted work
- CI enforcement makes the policy a hard requirement
- README updates make AI contributions visible to the whole team

**Call to Action**: Ask participants to review the ai-assisted-output.instructions.md file this week and identify any gaps in their current workflow.

**Q&A**: Open the floor for questions about specific metadata fields or enforcement patterns.
:::