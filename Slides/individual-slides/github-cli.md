---
ai_generated: true
model: "anthropic/claude-opus-4.5@2026-03-20"
operator: "johnmillerATcodemag-com"
chat_id: "extract-individual-slides-20260320"
prompt: |
  Extract GitHub CLI slides from Slides/ai-assisted-dev-overview.md
  into Slides/individual-slides/github-cli.md
started: "2026-03-20T04:00:00Z"
ended: "2026-03-20T04:10:00Z"
task_durations:
  - task: "extraction"
    duration: "00:02:00"
total_duration: "00:02:00"
ai_log: "ai-logs/2026/03/20/extract-individual-slides-20260320/conversation.md"
source: "Slides/ai-assisted-dev-overview.md"
marp: true
theme: default
paginate: true
---

# GitHub CLI

## Supercharge Your GitHub Workflow from the Terminal

*AI-Assisted Software Development*

::: notes
Welcome to the GitHub CLI module. This session covers the `gh` command-line tool and how it can dramatically speed up your GitHub workflows without ever leaving the terminal.

**Timing**: 1 minute for title slide

**Key Points**:
- The GitHub CLI (`gh`) lets you manage issues, PRs, workflows, and more from the terminal
- Eliminates context-switching between the browser and terminal
- Enables scripting and automation of GitHub workflows

**Delivery**: Ask how many people still open the browser to check PR status or create issues. The `gh` tool eliminates most of that context-switching.

**Transition**: "Let's start with managing issues — one of the most common daily tasks."
:::

---

## Issue Management

**Create Issues**:
```bash
# Interactive
gh issue create

# With options
gh issue create \
  --title "Bug: App crashes on startup" \
  --body "Description here" \
  --label "bug,high-priority" \
  --assignee @me
```

**View & List**:
```bash
gh issue list --state open --assignee @me
gh issue view 123 --comments
```

**Operations**:
```bash
gh issue close 123 --comment "Fixed in PR #456"
gh issue edit 123 --add-label "enhancement"
```

::: notes
Issue management is often the first thing developers do with the GitHub CLI.

**Timing**: 3 minutes

**Key Points**:
- `gh issue create` without flags launches an interactive editor — great for complex issues
- `--assignee @me` auto-assigns to the current user without needing your username
- `--body-file issue-description.md` lets you write issue content in your preferred editor
- JSON output with `--json` + `--jq` enables custom formatting and scripting

**Demo Tip**: Run `gh issue list` live to show the current repository's issues. The output is clean and readable without needing to open GitHub.

**Productivity Tip**: Combine with shell aliases: `alias myissues='gh issue list --assignee @me --state open'`

**Transition**: "Pull requests are where `gh` really shines."
:::

---

## Pull Request Essentials

**Create a PR**:
```bash
gh pr create \
  --title "feat: add new feature" \
  --body "Description of changes" \
  --reviewer username1,@org/team-name \
  --draft
```

**Daily PR Commands**:
```bash
gh pr list --author @me          # My open PRs
gh pr checks 456                 # CI status
gh pr diff 456                   # View changes
gh pr checkout 456               # Check out locally
gh pr view 456 --web             # Open in browser
```

**Merging**:
```bash
gh pr merge 456 --squash         # Squash and merge
gh pr merge 456 --auto --squash  # Auto-merge when checks pass
```

::: notes
Pull request management is arguably where the GitHub CLI saves the most time.

**Timing**: 3 minutes

**Key Points**:
- `gh pr create` uses the current branch and detects the base branch automatically
- `--draft` creates a draft PR — useful for early feedback
- `gh pr checks` gives a real-time view of CI status without opening the browser
- `gh pr checkout` is a game-changer — check out any PR for local testing with one command
- `--auto --squash` enables auto-merge once all CI checks pass

**Common Workflow**: Create branch → commit changes → `gh pr create` → `gh pr checks 456` → `gh pr merge 456 --auto`

**Transition**: "Let's look at managing GitHub Actions from the CLI."
:::

---

## GitHub Actions Management

**Workflow Operations**:
```bash
gh run list --status=failure     # Find failed runs
gh run view 123456 --log         # View logs
gh run rerun 123456 --failed-jobs # Rerun failed jobs
gh run watch 123456              # Follow live output
```

**Workflow Control**:
```bash
gh workflow list                 # List all workflows
gh workflow run ci.yml           # Trigger manually
gh workflow run deploy.yml \
  --ref main \
  -f environment=production      # With inputs
```

**Downloads**:
```bash
gh run download 123456 --name artifact-name
```

::: notes
Managing GitHub Actions from the CLI is invaluable during debugging and deployment workflows.

**Timing**: 3 minutes

**Key Points**:
- `gh run list --status=failure` is the fastest way to identify broken builds
- `gh run view --log` streams the full log — no more clicking through the Actions UI
- `gh run rerun --failed-jobs` only reruns the failed jobs, not the entire workflow
- `gh run watch` follows live output — great for monitoring deployments in real-time
- `gh workflow run` with `-f` flags passes workflow dispatch inputs

**CI/CD Integration**: Use `gh run watch` in deployment scripts to wait for a workflow to complete and capture the exit code.

**Transition**: "How do `gh` and PR reviews work together?"
:::

---

## Code Review Workflow

**Requesting & Submitting Reviews**:
```bash
gh pr edit 456 --add-reviewer username1,username2

gh pr review 456 --approve
gh pr review 456 --request-changes \
  --body "Please fix these issues"
gh pr review 456 --comment \
  --body "Looks good, minor suggestions"
```

**Review Status**:
```bash
gh pr status                     # Your assigned reviews
gh pr checks 456                 # CI check results
```

**PR Comments**:
```bash
gh pr comment 456 \
  --body "CI is now passing — ready for review"
```

::: notes
The review workflow in `gh` keeps you in the terminal while managing the full review cycle.

**Timing**: 2 minutes

**Key Points**:
- `gh pr edit --add-reviewer` triggers the review request notification automatically
- You can approve, request changes, or comment — all three standard review actions are supported
- `gh pr status` shows all PRs where you're a reviewer — great for morning standup
- `gh pr comment` is useful in CI scripts to post automated status updates on PRs

**Automation Example**: Post a comment when a deployment succeeds:
```bash
gh pr comment $PR_NUMBER --body "✅ Deployed to staging: $STAGING_URL"
```

**Transition**: "Let's look at integrating `gh` with your development tools."
:::

---

## IDE & CI/CD Integration

**VS Code Integration**:
```bash
# Clone and open in VS Code in one step
gh repo clone owner/repo && cd repo && code .

# Create PR from the VS Code terminal
gh pr create --web
```

**GitHub Actions Integration**:
```yaml
- name: Comment on PR after tests
  if: github.event_name == 'pull_request'
  run: |
    gh pr comment ${{ github.event.number }} \
      --body "✅ All tests passed!"
  env:
    GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

**Shell Completions**:
```bash
eval "$(gh completion -s bash)"   # bash
eval "$(gh completion -s zsh)"    # zsh
```

::: notes
The GitHub CLI integrates cleanly with IDEs, CI pipelines, and shell environments.

**Timing**: 2 minutes

**Key Points**:
- In GitHub Actions, `gh` is available by default — just set GITHUB_TOKEN
- Shell completions are a huge quality-of-life improvement — install them immediately
- The `--web` flag on most commands opens the browser for anything that needs the UI
- VS Code's integrated terminal makes `gh` feel native to the IDE workflow

**CI/CD Power Move**: Use `gh run download` in deployment pipelines to retrieve build artifacts from a previous workflow.

**Important**: The `GITHUB_TOKEN` in Actions has limited permissions by default — you may need to request additional permissions via `permissions:` in your workflow.

**Transition**: "Let's wrap up with essential commands to remember."
:::

---

## Essential Commands Reference

| Task | Command |
|------|---------|
| Create issue | `gh issue create` |
| Create PR | `gh pr create` |
| Check out PR | `gh pr checkout 456` |
| View CI status | `gh pr checks 456` |
| Merge PR | `gh pr merge 456 --squash` |
| View run logs | `gh run view 123456 --log` |
| Rerun failures | `gh run rerun 123456 --failed-jobs` |
| Trigger workflow | `gh workflow run ci.yml` |
| Approve PR | `gh pr review 456 --approve` |
| Auto-merge | `gh pr merge 456 --auto` |

::: notes
This quick reference slide covers the commands developers use daily.

**Timing**: 2 minutes

**Key Points**:
- These 10 commands cover 90% of daily GitHub workflows
- Bookmark this slide or put it in your team wiki
- `gh pr checkout` is the most underused but most time-saving command
- All commands support `--help` for full option reference

**Installation Reminder**: 
- macOS: `brew install gh`
- Windows: `winget install GitHub.cli`
- Linux: See `cli.github.com` for package manager instructions

Then authenticate: `gh auth login`

**Transition**: "Let's close with key takeaways."
:::

---

## Key Takeaways

- **Replace browser workflows** with terminal commands for issues, PRs, and Actions
- **`gh pr checkout`** — check out any PR locally in seconds  
- **`gh run watch`** — follow live CI output during deployments
- **`gh pr merge --auto`** — queue auto-merge once checks pass
- **Automate** GitHub operations in CI scripts with `GITHUB_TOKEN`

### Getting Started
1. Install: `brew install gh` or `winget install GitHub.cli`
2. Authenticate: `gh auth login`
3. Install completions: `eval "$(gh completion -s bash)"`
4. Try: `gh issue list --assignee @me`

::: notes
Close with the minimal set of things to remember and immediate next steps.

**Timing**: 2 minutes

**Summary**:
- The GitHub CLI eliminates most browser-based GitHub workflows
- Issue and PR management, code review, and Actions monitoring all work from the terminal
- CI/CD integration lets workflows post PR comments and manage checks programmatically
- Shell completions dramatically improve discoverability and speed

**Call to Action**: Install `gh` right now and run `gh issue list --assignee @me` to see your current issues. It takes less than 5 minutes to set up.

**Q&A**: Open the floor for questions about specific commands, scripting use cases, or CI/CD integration patterns.
:::
