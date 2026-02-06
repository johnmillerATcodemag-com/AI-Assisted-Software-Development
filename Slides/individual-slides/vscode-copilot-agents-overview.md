---
ai_generated: true
model: "anthropic/claude-3.5-sonnet@2024-10-22"
operator: "johnmillerATcodemag-com"
chat_id: "vscode-agents-slides-20260206"
prompt: |
  create marp slides for the content on this page: https://code.visualstudio.com/docs/copilot/agents/overview
started: "2026-02-06T18:35:00Z"
ended: "2026-02-06T18:45:00Z"
task_durations:
  - task: "content analysis"
    duration: "00:03:00"
  - task: "slide structure design"
    duration: "00:02:00"
  - task: "slide creation with speaker notes"
    duration: "00:05:00"
total_duration: "00:10:00"
ai_log: "ai-logs/2026/02/06/vscode-agents-slides-20260206/conversation.md"
source: "johnmillerATcodemag-com"
---

# VS Code Copilot Agents Overview

### Autonomous AI-Powered Coding Assistance

::: notes
Welcome to this presentation on VS Code Copilot Agents. This session will introduce you to the revolutionary concept of autonomous AI agents that can handle complete coding tasks end-to-end.

**Key delivery points:**

- Emphasize this goes beyond simple code suggestions
- Set expectations for a comprehensive overview
- Time allocation: 2-3 minutes introduction
- Engage audience with question: "Who has used basic GitHub Copilot suggestions?"

**Transition:** "Let's start by understanding what makes agents different from traditional AI assistance..."
:::

---

## What Are Agents?

**Agents handle complete coding tasks end-to-end, not just suggestions**

- 🔍 **Understand** your project context
- ✏️ **Make changes** across multiple files
- ⚡ **Execute commands** and run tests
- 🔄 **Adapt** based on results and feedback
- 🎯 **Self-correct** when errors occur

::: notes
This slide establishes the fundamental difference between agents and traditional AI assistance.

**Key talking points:**

- Traditional Copilot gives you code suggestions; agents perform complete workflows
- Example: Instead of suggesting a fix for a failing test, an agent will read the error, identify the root cause across files, update code, re-run tests, and commit changes
- Agents break down high-level tasks into actionable steps
- They use various tools autonomously to achieve objectives

**Audience engagement:** Ask "What's the most time-consuming coding task you do repeatedly?" to connect with real pain points.

**Timing:** 3-4 minutes with examples

**Transition:** "Now let's look at the different types of agents available..."
:::

---

## Four Types of Agents

| Type            | Environment           | Mode        | Collaboration |
| --------------- | --------------------- | ----------- | ------------- |
| **Local**       | Your machine          | Interactive | No            |
| **Background**  | Your machine (CLI)    | Autonomous  | No            |
| **Cloud**       | Remote infrastructure | Autonomous  | Yes (PRs)     |
| **Third-party** | Local or Cloud        | Varies      | Depends       |

::: notes
This comparison table helps audience understand when to use each agent type.

**Key decision factors to explain:**

- **Interactive vs. Autonomous**: Do you need real-time feedback or can the agent work independently?
- **Collaboration**: Do team members need to be involved through PRs and issues?
- **Isolation**: How important is it to keep changes separate from your main workspace?
- **Task definition**: Is the task exploratory/ambiguous or well-defined?

**Visual aid reference:** Mention that VS Code documentation includes a helpful diagram showing these relationships.

**Timing:** 4-5 minutes
**Transition:** "Let's dive deeper into each type, starting with local agents..."
:::

---

## Local Agents: Interactive & Immediate

**Best for:** Real-time collaboration and exploratory tasks

✅ **Strengths:**

- Interactive chat interface
- Full workspace access
- All VS Code tools and extensions
- Custom agent personas (reviewer, tester, etc.)
- BYOK model support

❌ **Limitations:**

- No team collaboration
- Direct workspace modification
- Requires active interaction

::: notes
Local agents are perfect for brainstorming and tasks requiring immediate feedback.

**Use case examples to share:**

- Planning new features with back-and-forth discussion
- Debugging complex issues with stack traces
- Code reviews with immediate explanations
- Exploring architectural decisions

**Technical details:**

- Operates within VS Code's chat interface
- Sessions remain active even when chat is closed
- Can access MCP servers and extension-provided tools
- Works with all models available in VS Code

**Best practices:**

- Use for tasks that are not fully defined
- Great for learning and exploration
- Ideal when you need VS Code context (linting errors, test results)

**Timing:** 3-4 minutes
:::

---

## Background Agents: Autonomous Execution

**Best for:** Well-defined tasks without interruption

✅ **Strengths:**

- Non-interactive autonomous operation
- Git worktree isolation
- No workspace conflicts
- Custom agent personas

❌ **Limitations:**

- No real-time VS Code context
- Limited to CLI-provided models
- No MCP or extension tools
- No team collaboration

::: notes
Background agents excel at implementing well-defined plans without interrupting your workflow.

**Ideal scenarios:**

- Implementing a detailed feature specification
- Refactoring code based on clear requirements
- Batch processing multiple similar changes
- Proof-of-concept development

**Technical implementation:**

- Uses Git worktrees for isolation
- CLI-based execution (Copilot CLI)
- Can reuse workspace custom agents for personas
- Runs on local machine but separated

**Workflow tips:**

- Start with local agent for planning
- Hand off to background agent for implementation
- Use isolation to experiment safely

**Common pitfall:** Don't use for tasks requiring VS Code runtime context unless manually provided.

**Timing:** 3-4 minutes
:::

---

## Cloud Agents: Team Collaboration

**Best for:** Team workflows and pull request integration

✅ **Strengths:**

- GitHub integration
- Pull request collaboration
- Remote infrastructure scaling
- Partner agent options (Claude, Codex)
- MCP server access in cloud

❌ **Limitations:**

- No VS Code built-in tools
- No local runtime context
- Asynchronous only

::: notes
Cloud agents bridge the gap between AI assistance and team collaboration workflows.

**Key collaboration features:**

- Copilot coding agent integrates with GitHub
- Can be assigned GitHub issues directly
- Creates pull requests for team review
- Supports @copilot mentions in issues/PRs

**Partner agents:**

- Alternative AI providers beyond GitHub Copilot
- Claude Agent with specialized commands
- OpenAI Codex integration
- Each brings unique capabilities

**Team workflow example:**

1. Local agent creates implementation plan
2. Background agent creates proof of concept
3. Cloud agent implements final version in PR
4. Team reviews and collaborates on the PR

**Timing:** 4-5 minutes
**Transition:** "Let's see how these agents work together in practice..."
:::

---

## Agent Sessions Management

**Unified Chat View for all agent types**

- 📊 **Sessions List:** Recent activity, status, file changes
- 🔄 **Hand-off Support:** Delegate between agent types
- 📂 **Organized View:** Compact or side-by-side modes
- 🎯 **Status Indicators:** Unread messages, in-progress work
- 🗂️ **Archive/Delete:** Keep workspace organized

::: notes
The sessions management is what makes the multi-agent workflow practical and organized.

**Key management features:**

- All sessions visible regardless of where they run
- Status indicators show unread messages and active work
- Can filter by status, type, or time period
- Archive completed sessions to reduce clutter

**Workflow demonstration:**

- Show how sessions persist when you close chat
- Explain filtering and search capabilities
- Mention workspace-scoped session lists

**Hand-off capabilities:**

- Critical feature for multi-stage workflows
- Full conversation history carries over
- Original session gets archived automatically
- Example: Local planning → Background implementation → Cloud team review

**UI modes:**

- Compact: Embedded in Chat view
- Side-by-side: Dedicated sessions panel
- Automatically adapts based on Chat view width

**Timing:** 4 minutes
:::

---

## Creating Agent Sessions

**Multiple ways to start working with agents**

1. **New Session Dropdown** in Chat view
2. **Command Palette** commands (Ctrl+Shift+P)
3. **Welcome Page** quick access
4. **Direct Assignment** from TODO comments
5. **GitHub Integration** via issues and mentions

**Pro Tip:** Multiple sessions can run in parallel! 🚀

::: notes
This slide covers the practical aspects of getting started with agents.

**Step-by-step flow:**

1. Open Chat view
2. Select "New Session" dropdown (+)
3. Choose agent type from dropdown
4. Start your task description

**Command Palette options to mention:**

- "Chat: New Chat Editor/Window" for local agents
- "Chat: New Background Agent" for CLI agents
- "Chat: New Cloud Agent" for GitHub integration
- Each creates session in chat editor

**Advanced features:**

- TODO comment assignment requires GitHub PR extension
- Can mention @copilot in GitHub issues
- Welcome page provides quick access to recent sessions

**Parallel sessions workflow:**

- Each agent session focused on different task
- Previous sessions remain active
- Switch between tasks via sessions list
- Great for multitasking developers

**Timing:** 3-4 minutes
:::

---

## Review and Apply Changes

**Track and validate agent work**

- 📈 **File Change Statistics** in session details
- 🔍 **Diff Editor** for individual files
- 👀 **Multi-file Diff** for complete review
- ✅ **Apply to Workspace** options
- 🌿 **Branch Checkout** for cloud agents

::: notes
This slide addresses a critical concern: how to safely review and integrate agent changes.

**Safety and control emphasis:**

- Agents don't automatically apply changes
- Full visibility into what was modified
- Granular control over which changes to accept
- Can review before applying to main workspace

**Review workflow:**

1. Session completes with change statistics
2. Select session to view details
3. Right-click files for individual diffs
4. Use "View All Changes" for comprehensive review
5. Apply selectively or all at once

**Different agent behaviors:**

- Local agents: Direct workspace integration
- Background agents: Worktree isolation, manual apply
- Cloud agents: Pull request workflow

**Best practices:**

- Always review before applying
- Test changes in isolation first
- Use PR workflow for team visibility
- Document significant changes

**Timing:** 3-4 minutes
:::

---

## Hand-off Workflows

**Leverage each agent type's strengths**

```
📋 Local Agent (Planning)
    ⬇ Hand-off
🤖 Background Agent (Implementation)
    ⬇ Delegate
☁️ Cloud Agent (Team Review)
```

**Example:** Planning → Proof of Concept → Production Implementation

::: notes
This slide demonstrates the power of agent collaboration and specialization.

**Complete workflow example:**

1. **Local agent:** Interactive brainstorming and planning
   - Define requirements
   - Explore architecture options
   - Create detailed implementation plan

2. **Background agent:** Autonomous implementation
   - Create multiple proof-of-concept variants
   - Test different approaches
   - Implement core functionality

3. **Cloud agent:** Team collaboration
   - Create production-ready implementation
   - Submit pull request
   - Enable team review and feedback

**Hand-off mechanics:**

- Full conversation history carries over
- Context preserved across agents
- Original session archived automatically
- New session inherits all context

**Strategic benefits:**

- Play to each agent type's strengths
- Maintain development velocity
- Include team collaboration when needed
- Scale complexity appropriately

**Timing:** 4-5 minutes
**Transition:** "Let's wrap up with key takeaways and next steps..."
:::

---

## Key Takeaways & Next Steps

**🚀 Getting Started:**

- Enable agents in VS Code settings (`chat.agent.enabled`)
- Start with local agents for exploration
- Try background agents for focused tasks
- Use cloud agents for team collaboration

**📚 Resources:**

- [Agents Tutorial](https://code.visualstudio.com/docs/copilot/agents/agents-tutorial)
- [Custom Agents](https://code.visualstudio.com/docs/copilot/customization/custom-agents)
- [Background Agents Guide](https://code.visualstudio.com/docs/copilot/agents/background-agents)

::: notes
This closing slide provides clear next steps and resources for continued learning.

**Immediate action items:**

1. Check VS Code settings to enable agents
2. Try creating a simple local agent session
3. Experiment with a real coding task
4. Explore the sessions management interface

**Learning path recommendations:**

- Start with local agents to understand the interface
- Progress to background agents for autonomous work
- Implement cloud agents for team workflows
- Create custom agents for specialized tasks

**Common setup issues:**

- Organization policies may disable agents
- Need to contact admin if functionality unavailable
- Ensure GitHub Copilot subscription is active
- Check extension requirements for full functionality

**Engagement closing:**

- Ask audience about their biggest coding time-wasters
- Suggest which agent type might help most
- Encourage experimentation and gradual adoption
- Offer to answer questions about specific use cases

**Follow-up suggestions:**

- Share documentation links via chat/email
- Schedule follow-up sessions for advanced topics
- Create team guidelines for agent usage

**Timing:** 3-4 minutes for takeaways, 5-10 minutes for Q&A
:::

---

## Questions & Discussion

**Thank you!**

Want to explore specific agent workflows for your team?

::: notes
**Q&A Session Management:**

**Anticipated questions and responses:**

1. **"How do agents compare to traditional Copilot?"**
   - Traditional Copilot: Suggestions and completions
   - Agents: Complete task execution and multi-step workflows

2. **"What about data privacy and security?"**
   - Local agents: Data stays on your machine
   - Cloud agents: Follow GitHub's privacy policies
   - Enterprise controls available

3. **"Can agents make mistakes?"**
   - Yes, always review agent changes
   - Use diff editors before applying
   - Start with non-critical tasks

4. **"How do I know which agent type to use?"**
   - Refer back to the decision matrix slide
   - Interactive vs autonomous needs
   - Team collaboration requirements

5. **"What if my organization disabled agents?"**
   - Contact your admin
   - May be policy-based restriction
   - Can often be enabled with proper governance

**Session wrap-up:**

- Collect contact information for follow-up questions
- Share additional resources
- Suggest pilot projects for interested teams
- Schedule follow-up sessions if requested

**Time management:** Allow 10-15 minutes for Q&A depending on audience size and engagement.
:::
