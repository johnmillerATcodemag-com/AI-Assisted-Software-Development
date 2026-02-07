---
ai_generated: true
model: "anthropic/claude-3.5-sonnet@2024-10-22"
operator: "johnmillerATcodemag-com"
chat_id: "github-cli-instructions-20260206"
prompt: |
  create github.instruction file that provides guidance for using the github cli
started: "2026-02-06T23:50:00Z"
ended: "2026-02-06T23:55:00Z"
task_durations:
  - task: "requirements analysis and structure planning"
    duration: "00:01:00"
  - task: "comprehensive github cli guide creation"
    duration: "00:04:00"
total_duration: "00:05:00"
ai_log: "ai-logs/2026/02/06/github-cli-instructions-20260206/conversation.md"
source: "johnmillerATcodemag-com"
applyTo: "**/*"
---

# GitHub CLI Instructions

## Overview

This document provides comprehensive guidance for using the GitHub CLI (`gh`) tool effectively in development workflows. The GitHub CLI is a powerful command-line interface that allows you to interact with GitHub repositories, issues, pull requests, and other GitHub features directly from your terminal.

**Target Audience**: Developers, DevOps engineers, and repository maintainers
**Scope**: GitHub CLI installation, authentication, common workflows, and best practices

**Related Documentation**:

- [AI-Assisted Output Instructions](ai-assisted-output.instructions.md)
- [Dependency Management Policy](dependency-management-policy.instructions.md)
- [Code Review Guidelines](code-review.instructions.md)

## Table of Contents

- [Issue Management](#issue-management)
- [Pull Request Workflows](#pull-request-workflows)
- [GitHub Actions and Workflows](#github-actions-and-workflows)
- [Integration with Development Tools](#integration-with-development-tools)

## Issue Management

### 1. Creating Issues

```bash
# Create issue interactively
gh issue create

# Create issue with options
gh issue create \
  --title "Bug: Application crashes on startup" \
  --body "Detailed description of the issue" \
  --assignee @me \
  --label "bug,high-priority" \
  --milestone "v1.2.0"

# Create issue from template
gh issue create --template bug_report.md

# Create issue from file
gh issue create --body-file issue-description.md
```

### 2. Listing and Viewing Issues

```bash
# List issues
gh issue list
gh issue list --state open
gh issue list --state closed
gh issue list --assignee @me
gh issue list --author username
gh issue list --label bug
gh issue list --milestone "v1.0.0"

# View specific issue
gh issue view 123
gh issue view 123 --comments

# List with custom formatting
gh issue list --json number,title,state,author --jq '.[] | "\(.number): \(.title) (\(.state))"'
```

### 3. Issue Operations

```bash
# Edit issue
gh issue edit 123 --title "New title"
gh issue edit 123 --body "Updated description"
gh issue edit 123 --add-assignee username
gh issue edit 123 --add-label "enhancement"

# Close issue
gh issue close 123
gh issue close 123 --comment "Fixed in PR #456"

# Reopen issue
gh issue reopen 123

# Pin/unpin issue
gh issue pin 123
gh issue unpin 123

# Transfer issue to another repository
gh issue transfer 123 owner/other-repo
```

### 4. Issue Comments

```bash
# Add comment to issue
gh issue comment 123 --body "This is a comment"

# Edit comment
gh issue comment 123 --edit

# Delete comment
gh issue comment 123 --delete
```

## Pull Request Workflows

### 1. Creating Pull Requests

```bash
# Create pull request for current branch
gh pr create

# Create with options
gh pr create \
  --title "feat: add new feature" \
  --body "Detailed description of changes" \
  --assignee @me \
  --reviewer username1,@org/team-name \
  --label "enhancement" \
  --milestone "v1.2.0" \
  --draft

# Create from specific branch
gh pr create --head feature-branch --base main

# Create with template
gh pr create --template pull_request_template.md
```

### 2. Listing and Viewing Pull Requests

```bash
# List pull requests
gh pr list
gh pr list --state open
gh pr list --author @me
gh pr list --assignee username
gh pr list --label "bug"

# View pull request
gh pr view 456
gh pr view 456 --comments

# View diff
gh pr diff 456

# View pull request in browser
gh pr view 456 --web
```

### 3. Pull Request Operations

```bash
# Checkout pull request locally
gh pr checkout 456

# Edit pull request
gh pr edit 456 --title "New title"
gh pr edit 456 --body "Updated description"
gh pr edit 456 --add-reviewer username

# Ready pull request (remove draft status)
gh pr ready 456

# Mark as draft
gh pr draft 456

# Close pull request
gh pr close 456

# Reopen pull request
gh pr reopen 456
```

### 4. Pull Request Reviews

```bash
# Request reviews
gh pr edit 456 --add-reviewer username1,username2

# Submit review
gh pr review 456 --approve
gh pr review 456 --request-changes --body "Please fix these issues"
gh pr review 456 --comment --body "Looks good, minor suggestions"

# View review status
gh pr status
gh pr checks 456
```

### 5. Pull Request Merging

```bash
# Merge pull request
gh pr merge 456
gh pr merge 456 --merge    # Create merge commit
gh pr merge 456 --squash   # Squash and merge
gh pr merge 456 --rebase   # Rebase and merge

# Merge with custom commit message
gh pr merge 456 --squash --subject "feat: implement new feature" --body "Detailed commit description"

# Auto-merge when checks pass
gh pr merge 456 --auto --squash
```

## GitHub Actions and Workflows

### 1. Workflow Operations

```bash
# List workflow runs
gh run list
gh run list --workflow=ci.yml
gh run list --status=failure

# View workflow run details
gh run view 123456
gh run view 123456 --log

# Download artifacts
gh run download 123456
gh run download 123456 --name artifact-name

# Cancel workflow run
gh run cancel 123456

# Rerun workflow
gh run rerun 123456
gh run rerun 123456 --failed-jobs
```

### 2. Workflow Management

```bash
# List workflows
gh workflow list

# View workflow details
gh workflow view ci.yml

# Enable/disable workflow
gh workflow enable ci.yml
gh workflow disable ci.yml

# Trigger workflow
gh workflow run ci.yml
gh workflow run ci.yml --ref branch-name
gh workflow run manual.yml -f input1=value1 -f input2=value2
```

### 3. Workflow Logs and Debugging

```bash
# View logs for latest run
gh run view --log

# View logs for specific job
gh run view 123456 --job=job-name --log

# Follow logs in real-time
gh run watch 123456

# Download logs
gh run download 123456 --name logs
```

## Integration with Development Tools

### 1. VS Code Integration

**Extensions**:

- GitHub Pull Requests and Issues extension
- GitHub Copilot integration with `gh` commands

**Usage in VS Code**:

```bash
# Open repository in VS Code
gh repo clone owner/repo && cd repo && code .

# Create PR from VS Code terminal
gh pr create --web
```

### 2. CI/CD Integration

**GitHub Actions Integration**:

```yaml
# .github/workflows/ci.yml
name: CI
on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Run tests
        run: npm test
      - name: Comment on PR
        if: github.event_name == 'pull_request'
        run: |
          gh pr comment ${{ github.event.number }} --body "Tests completed successfully!"
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

**Script Integration**:

```bash
# Automated deployment script
#!/bin/bash
if gh pr checks $1 --json state -q '.[] | select(.state != "completed")' | grep -q .; then
    echo "Checks not completed, cannot deploy"
    exit 1
fi

gh pr merge $1 --squash
```

### 3. Shell Integration

**Bash/Zsh Completions**:

```bash
# Enable tab completion
eval "$(gh completion -s bash)"  # For bash
eval "$(gh completion -s zsh)"   # For zsh
```

**PowerShell Integration**:

```powershell
# Add to PowerShell profile
Register-ArgumentCompleter -Native -CommandName gh -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)
    gh completion -s powershell | Out-String | Invoke-Expression
}
```

---

**Document Version**: 1.0.0
**Last Updated**: 2026-02-06
**Next Review**: 2026-05-06
**Owner**: Development Team
**Scope**: All GitHub CLI interactions in the AI-Assisted-Software-Development ecosystem
