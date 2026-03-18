---
mode: agent
model: "anthropic/claude-3.5-sonnet@2024-10-22"
tools: ["codebase", "edit"]
description: "Create a GitHub Copilot chatmode for reviewing unfamiliar codebases"
prompt_metadata:
  id: create-codebase-explorer
  title: Generate Codebase Explorer Chatmode
  owner: johnmillerATcodemag-com
  version: "1.0.0"
  created: "2025-02-05"
  updated: "2025-02-05"
  output_path: .github/chatmodes/codebase-explorer.chatmode.md
  category: generation
  tags: [chatmode, codebase-exploration, documentation, github-copilot]
  output_format: markdown
---

# Create Codebase Explorer Chatmode

Create a github copilot chatmode for reviewing an unfamiliar codebase.

Place the chatmode file in `.github/chatmodes/` directory.
