---
marp: true
ai_generated: true
model: "anthropic/claude-sonnet-4.5@2026-03-20"
operator: "johnmillerATcodemag-com"
chat_id: "merge-marp-decks-aiasd-311-monday-20260320"
prompt: |
  Create individual Marp slide deck for VS Code Copilot Agents Overview as part of AIASD 311 Monday session
started: "2026-03-20T03:10:00Z"
ended: "2026-03-20T03:40:00Z"
task_durations:
  - task: "slide deck creation"
    duration: "00:30:00"
total_duration: "00:30:00"
ai_log: "ai-logs/2026/03/20/merge-marp-decks-aiasd-311-monday-20260320/conversation.md"
source: ".github/prompts/merge-marp-decks.prompt.md"
theme: default
paginate: true
---

# VS Code Copilot Agents Overview

## Intelligent Assistants for Every Development Task

*AI-Assisted Software Development*

::: notes
Welcome to the VS Code Copilot Agents Overview. In this session we explore the full landscape of GitHub Copilot agents available inside VS Code — what they are, how they differ, and how to choose the right agent for each task.

**Timing**: 1 minute for title slide

**Key Points**:
- Copilot agents extend beyond the default chat experience with specialized capabilities
- Different agent types serve different purposes: local tools, background automation, cloud services, and third-party integrations
- Understanding the agent taxonomy helps developers build more effective AI-assisted workflows

**Delivery**: Ask the audience how many are already using Copilot Chat in VS Code. Then ask if anyone has explored the agent dropdown — this primes the conversation for what comes next.

**Transition**: "Let's start by defining what a Copilot agent actually is inside VS Code."
:::

---

## What Are VS Code Copilot Agents?

Copilot agents are **specialized AI assistants** embedded in VS Code that go beyond general chat:

- **Scoped expertise**: Each agent focuses on a specific domain or task
- **Tool access**: Agents can read files, search code, run commands, call APIs
- **Configurable behavior**: Instructions, tools, and models can be tailored
- **Composable**: Multiple agents can collaborate in a single workflow

```
Default Chat ──► General-purpose assistant
Agent ──────────► Specialized assistant with tools and instructions
```

::: notes
**Timing**: 2–3 minutes

**Core Concept**:
The key distinction is that agents are *configured* assistants, not just conversations. They have a defined purpose, access to specific tools, and optionally a custom AI model.

**Analogy**: Think of default Copilot Chat as a generalist consultant. Agents are specialist consultants — a security auditor, a test writer, a documentation expert — each with their own toolkit.

**Tool Access Examples**:
- `read` — read file contents
- `edit` — modify files
- `search` — semantic code search
- `terminal` — run shell commands
- `github` — GitHub API operations
- MCP tool calls — external service integrations

**Why This Matters**:
Without agents, developers must context-switch between asking Copilot and doing work. Agents collapse the gap by giving Copilot the tools to act, not just advise.

**Transition**: "There are several distinct types of agents — let's look at each one."
:::

---

## Agent Types: Local (MCP) Agents

**Model Context Protocol (MCP)** agents connect Copilot to local tools and services:

```yaml
# .github/agents/db-explorer.agent.md
---
name: db-explorer
description: Query and explore local databases
mcp-servers:
  sqlite:
    command: npx
    args: ["-y", "@modelcontextprotocol/server-sqlite", "db.sqlite"]
tools: ["sqlite/query", "sqlite/schema", "read"]
---
```

**Use Cases**:
- Query local databases
- Read file system structures
- Inspect Docker containers
- Call local REST services

::: notes
**Timing**: 3 minutes

**What Is MCP?**
Model Context Protocol is an open standard that lets AI assistants communicate with external tools via a defined interface. Think of it as a plugin system for AI tool access.

**How It Works**:
1. You define an MCP server in the agent's front matter
2. VS Code launches that server when the agent is activated
3. The agent can call the server's tools as part of its reasoning
4. Results are fed back into the conversation

**Local MCP Servers Available Today**:
- `@modelcontextprotocol/server-filesystem` — read/write local files
- `@modelcontextprotocol/server-sqlite` — query SQLite databases
- `@modelcontextprotocol/server-github` — GitHub API access
- `@modelcontextprotocol/server-postgres` — PostgreSQL queries
- `@modelcontextprotocol/server-weather` — weather data

**Organization-Level Note**:
MCP server configuration is only available for organization and enterprise-level agents (in the root `agents/` directory), not individual repository agents.

**Security Reminder**: MCP servers run locally and can access your file system. Only use trusted MCP server packages.

**Transition**: "Background agents work differently — they operate asynchronously."
:::

---

## Agent Types: Background Agents

**Background agents** work autonomously on long-running tasks:

- Run in isolated cloud environments (not your local machine)
- Work on tasks while you focus on other things
- Create branches, commits, and pull requests automatically
- Triggered from GitHub.com issues or Copilot Chat

```
You: "Fix all the failing tests in the authentication module"
Background Agent: [works asynchronously]
Result: Opens PR with fixes 30 minutes later
```

**When to Use**:
- Refactoring tasks spanning many files
- Automated test generation across a module
- Documentation generation across a codebase

::: notes
**Timing**: 3 minutes

**Key Characteristics**:
Background agents are fundamentally different from interactive agents. The user doesn't wait for responses — they get a notification (PR, comment, etc.) when work is done.

**How Background Agents Work**:
1. User assigns a task (via issue, chat, or CLI)
2. Copilot provisions an isolated cloud VM with your repo
3. Agent works in the VM: reads files, runs tests, makes changes
4. When done, agent creates a PR or posts a summary
5. Developer reviews and merges

**What Background Agents Can Do**:
- Run the full test suite
- Install dependencies
- Run linters and formatters
- Search the entire codebase
- Create commits with meaningful messages

**What They Cannot Do**:
- Access external systems not in the repo
- Make production deployments
- Access secrets not provided via secure channels

**Practical Use Cases**:
- "Update all instances of deprecated API X to API Y across the codebase"
- "Add JSDoc comments to all exported functions in src/"
- "Fix the 12 TypeScript errors in the CI build"

**Important**: Background agents create PRs for review — they never directly push to main.

**Transition**: "Cloud agents extend this further with persistent, hosted capabilities."
:::

---

## Agent Types: Cloud / Remote Agents

**Cloud agents** are hosted externally and integrate into VS Code via extensions:

| Agent | Provider | Specialty |
|-------|----------|-----------|
| GitHub Copilot Coding Agent | GitHub | Code generation & PRs |
| GitHub Models | GitHub | Model playground |
| Azure AI | Microsoft | Enterprise AI services |
| Perplexity | Third-party | Real-time web search |

**Integration Pattern**:
```
VS Code Extension ──► Remote Agent API ──► Specialized AI Service
```

**Advantages**:
- No local compute required
- Provider manages updates and scaling
- Access to specialized models and data

::: notes
**Timing**: 3 minutes

**Why Cloud Agents?**
Some AI capabilities need infrastructure that a local agent simply can't provide — real-time web search, access to large proprietary datasets, or GPU-accelerated inference.

**GitHub Copilot Coding Agent (Background)**:
This is GitHub's own hosted background agent. It runs in GitHub's infrastructure, has access to your repo, and creates PRs. It's activated by assigning Copilot to an issue.

**Azure AI Integration**:
For enterprises already using Azure OpenAI or Azure AI services, the Azure AI extension lets you use those models directly in VS Code Copilot Chat.

**GitHub Models**:
The GitHub Models tab in VS Code lets you experiment with different LLMs (GPT-4o, Claude, Mistral, etc.) side-by-side in a playground environment.

**Third-Party Cloud Agents**:
The MCP ecosystem is growing rapidly. Cloud-hosted MCP servers can provide access to:
- Real-time web search (Perplexity, Brave Search)
- Jira and Linear issues
- Confluence and Notion pages
- Salesforce and HubSpot data

**Important Consideration**: Cloud agents send your code/context to external services. Check your organization's data policies before using third-party agents.

**Transition**: "Third-party agents form the largest and most diverse category."
:::

---

## Agent Types: Third-Party Agents

**Third-party agents** are community and vendor-contributed extensions:

**Discovery**: VS Code Extension Marketplace → search "Copilot Agent"

**Popular Categories**:
- **Code Quality**: SonarQube, Checkmarx security scanning
- **Documentation**: Mintlify doc writer, Swimm diagrams
- **Project Management**: Linear, Jira, GitHub Issues
- **Monitoring**: Datadog, Grafana log analysis
- **Databases**: MongoDB, Supabase, PlanetScale

**Installation**:
```bash
# Via VS Code extensions
code --install-extension <extension-id>

# Then activate in Copilot Chat dropdown
```

::: notes
**Timing**: 2 minutes

**The Third-Party Ecosystem**:
The real power multiplier for Copilot agents is the extension ecosystem. Vendors are actively building Copilot integrations that turn their tools into AI-accessible services.

**Evaluation Criteria for Third-Party Agents**:
1. **Publisher verification** — is the publisher verified (blue checkmark)?
2. **Install count** — community trust signal
3. **Data handling** — what data leaves VS Code?
4. **Permissions** — what tools/scopes does it request?
5. **Update cadence** — is the extension maintained?

**Enterprise Considerations**:
Many enterprises lock down VS Code extensions via policy. Check with your security team before installing third-party agents. Look for SOC 2-compliant vendors with documented data handling.

**Building Third-Party Agents**:
Any developer can publish an agent to the VS Code Marketplace using the Language Model API. This is a growing area for tool vendors.

**Transition**: "Now that we understand the types, let's look at how to create and configure your own agents."
:::

---

## Creating and Configuring Agents in VS Code

**Two creation paths**:

**Option 1: GitHub.com UI**
1. Navigate to `github.com/copilot/agents`
2. Select repository
3. Click Copilot icon → **Create an agent**
4. Merge `.agent.md` file to default branch

**Option 2: Directly in VS Code**
1. Open Copilot Chat
2. Agents dropdown → **Configure Custom Agents...**
3. Click **+ Create new custom agent**
4. Choose **Workspace** (repo) or **User profile** (personal)
5. Edit the `.agent.md` file

**File locations**:
- Repo-level: `.github/agents/<name>.agent.md`
- Org-level: `agents/<name>.agent.md` (in `.github-private`)
- User-level: VS Code user profile folder

::: notes
**Timing**: 3–4 minutes

**Workspace vs User Profile**:
- **Workspace agents** live in the repo — version-controlled, shareable, team-visible
- **User profile agents** are personal — not in source control, only for your VS Code

**Recommendation**: Start with user profile agents for experimentation. Promote to workspace agents when you want the team to benefit.

**GitHub.com Path Detail**:
The GitHub.com creation flow is handy for organization-wide agents. It handles the file scaffolding and immediately makes the agent available to all repo collaborators.

**VS Code Path Detail**:
Creating via VS Code is faster for iteration. The Configure Tools button gives you a GUI to select tools without editing YAML manually.

**Naming Rules** (important to get right):
- Use only: letters, numbers, dots, dashes, underscores
- Must end with `.agent.md`
- Filename becomes default agent name
- ✅ `test-specialist.agent.md`
- ❌ `test specialist.agent.md` (spaces not allowed)

**Immediate Availability**:
After saving a workspace agent file, it appears in the Copilot dropdown without any build step or restart. Changes take effect immediately.

**Transition**: "The .agent.md format is simple but has important properties to understand."
:::

---

## The `.agent.md` Format

```yaml
---
name: test-specialist          # Optional: display name
description: |                 # REQUIRED: purpose and capabilities
  Expert at writing comprehensive unit and integration tests.
  Focuses on test files only. Never modifies production code.
tools:                         # Optional: restrict available tools
  - read
  - edit
  - search
model: gpt-4o                  # Optional: override default model (IDE only)
target: vscode                 # Optional: vscode | github-copilot
---

You are a testing specialist. Your responsibilities:
- Analyze existing test coverage and identify gaps
- Write unit tests following AAA (Arrange-Act-Assert) pattern
- Write integration tests for service boundaries
- Focus only on **test** and **spec** directories
- Never modify files in src/ or app/ unless asked
```

**Character limit**: 30,000 characters (front matter + body)

::: notes
**Timing**: 3–4 minutes

**Field Details**:

**name** (optional):
- Display name shown in Copilot dropdown
- Defaults to filename without `.agent.md` extension
- Can be different from filename

**description** (required):
- Critical for discoverability and usability
- Users see this when choosing an agent
- Be specific about capabilities AND limitations
- Include what the agent does NOT do

**tools** (optional):
- Omitting grants ALL available tools
- Specifying limits to exactly those tools
- Less is more — restrict to enforce role boundaries
- Common tools: read, edit, search, create, github, terminal

**model** (optional, IDE only):
- Only works in VS Code, JetBrains, Eclipse, Xcode
- Not available on GitHub.com
- Useful when a specific task benefits from a specific model

**target** (optional):
- `vscode`: Only visible in VS Code
- `github-copilot`: Only visible on GitHub.com
- Omit: Visible in both environments

**Body Content Best Practices**:
- Start with role definition: "You are a..."
- Define specific responsibilities as bullet points
- Explicitly state what the agent SHOULD NOT do
- Include examples for clarity
- Keep under 30,000 characters total

**Transition**: "Choosing the right agent type for each task is a key skill — here's a decision matrix."
:::

---

## Decision Matrix: Which Agent Type to Use?

| Scenario | Recommended Agent Type |
|----------|----------------------|
| Writing tests for current file | Custom workspace agent (test-specialist) |
| Refactoring 50+ files | Background agent |
| Querying local database | MCP agent (server-sqlite) |
| Searching GitHub Issues for context | Cloud agent (GitHub Models) |
| Security vulnerability scan | Third-party agent (Checkmarx/SonarQube) |
| Generating API docs from code | Custom workspace agent (doc-writer) |
| Finding code patterns across repo | Custom agent with `search` tool |
| Running full test suite and fixing failures | Background agent |

::: notes
**Timing**: 3 minutes

**Decision Factors**:

**Duration of Task**:
- Interactive (seconds to minutes) → Custom or third-party agent
- Long-running (minutes to hours) → Background agent

**Data Location**:
- Everything is local → MCP agent
- Need GitHub API → Cloud agent or `github` tool
- Need external SaaS → Third-party agent

**Team vs Personal**:
- Just for you → User profile agent
- Whole team → Workspace or org-level agent

**Existing Tools**:
- Already have SonarQube? → Check for Copilot extension
- Using Jira? → Look for Jira MCP server

**Common Decision Mistakes**:
1. Using a generic agent when a specialized one exists
2. Using interactive chat for a task that would take 45 minutes (use background agent)
3. Building a custom agent when a third-party agent already exists
4. Enabling all tools when only read/search is needed

**Optimization Tip**: Profile your top 5 repetitive development tasks. For each, identify whether a custom, background, MCP, cloud, or third-party agent would save the most time.

**Transition**: "When tasks are complex, you can chain agents together in hand-off workflows."
:::

---

## Hand-off Workflows Between Agents

Combine agents for multi-phase development tasks:

```
Phase 1: Planning
─────────────────
Agent: implementation-planner
Task: "Design the user authentication system"
Output: ARCHITECTURE.md with tasks and specs

Phase 2: Implementation
────────────────────────
Agent: (default coding)
Task: "Implement Task 1 from ARCHITECTURE.md"
Output: Source code files

Phase 3: Testing
─────────────────
Agent: test-specialist
Task: "Add comprehensive tests for auth module"
Output: Test files with 85%+ coverage

Phase 4: Documentation
───────────────────────
Agent: doc-writer
Task: "Generate API docs for auth endpoints"
Output: Updated API documentation
```

::: notes
**Timing**: 3 minutes

**Why Hand-off Workflows Work**:
Each agent excels in its domain. By chaining agents, you apply the right specialist to each phase of development rather than asking a generalist to do everything.

**How to Execute a Hand-off**:
1. Complete phase 1 with the first agent (output to a file or PR)
2. Switch agent in the dropdown
3. Reference the previous output as context
4. Continue with next phase

**Example Conversation Flow**:
```
User: [with implementation-planner active]
"Design the authentication system for our Express API"

Agent: Creates ARCHITECTURE.md with 8 tasks

User: [switches to coding agent]
"Implement Task 1 from ARCHITECTURE.md: Set up JWT middleware"

Agent: Creates middleware files

User: [switches to test-specialist]
"Add unit tests for the JWT middleware we just created"

Agent: Creates comprehensive test suite
```

**Background Agent Integration**:
After the planning phase, you can hand off to a background agent for bulk implementation:
```
"Implement all 8 tasks from ARCHITECTURE.md and open a PR when done"
```
[Background agent takes over — you do other work]

**Team Workflow Tip**:
Document your standard hand-off workflows in a team CONTRIBUTING.md so all developers follow the same agent selection pattern for common tasks.

**Transition**: "Let's close with best practices for getting the most from VS Code Copilot agents."
:::

---

## Best Practices

1. **Match agent to task**: Use specialized agents, not generic chat
2. **Restrict tools**: Give agents only what they need
3. **Be explicit about boundaries**: State what the agent SHOULD NOT do
4. **Start with user profile**: Experiment personally before promoting to team
5. **Version-control workspace agents**: Treat them like code
6. **Document usage patterns**: Add to team README or CONTRIBUTING.md
7. **Iterate based on feedback**: Refine instructions from real sessions
8. **Combine agent types**: MCP for local data + background for bulk tasks

::: notes
**Timing**: 2–3 minutes

**Best Practice Details**:

**Match agent to task**:
If you have a test-specialist agent and ask the generic agent to write tests, you miss the specialized instructions. Build the habit of selecting the right agent first.

**Restrict tools**:
A doc-writer agent doesn't need `terminal` or `github` — restrict to `read` and `edit`. This enforces the agent's role and prevents accidental side effects.

**Be explicit about boundaries**:
The most valuable line in any agent instruction is "Never modify files in X directory." It prevents scope creep that frustrates developers.

**Version control workspace agents**:
Check in your `.github/agents/` files just like you would API configurations. Review changes via PR. Tag stable versions.

**Iterate based on feedback**:
After using an agent for 10 real tasks, review: what worked? what confused it? what did it do that you didn't want? Update the instructions accordingly.

**Combine agent types**:
Power workflows combine local MCP agents (for context gathering) with background agents (for bulk changes). Example: MCP agent reads the database schema, hands context to background agent that updates all DAO files.

**Anti-Patterns**:
- ❌ One mega-agent that does everything
- ❌ Agents without tool restrictions
- ❌ Not updating agents after discovering issues
- ❌ Reinventing an agent that a third-party extension already provides

**Transition**: "Let's summarize the key takeaways from this session."
:::

---

## Key Takeaways

- **Four agent types**: local/MCP, background, cloud/remote, third-party
- **`.agent.md` format** is simple YAML + markdown — version-control it
- **Tool restriction** enforces agent roles and prevents scope creep
- **Hand-off workflows** multiply effectiveness by chaining specialists
- **Background agents** are best for bulk, long-running tasks
- **MCP agents** unlock local tool integration (databases, filesystems)
- **Start small**: one personal agent for your biggest pain point

### Next Steps
1. Identify your most repeated development task
2. Check if a third-party agent already exists
3. If not, create a custom workspace agent
4. Share it with your team

::: notes
**Timing**: 2 minutes for summary, 5 minutes for Q&A

**Summary Reinforcement**:
Summarize by walking through the four agent types one more time and matching each to a real scenario the audience will recognize.

**The One Thing to Remember**:
If the audience forgets everything else, the most important message is: don't use the generic Copilot chat for every task. Specialized agents give dramatically better results for specific work.

**Q&A Prep**:
- "Can agents call each other?" — Not directly yet; use hand-off workflows manually
- "Do agents cost more?" — No, included in Copilot license
- "Can I restrict who on the team can use an agent?" — No per-agent permissions; it's available to everyone with repo access
- "How do I debug a misbehaving agent?" — Review instructions, simplify tools, test with narrow prompts

**Call to Action**:
"Before end of day, open the Copilot Chat dropdown in VS Code and explore what agents are already available. Then identify one task you'll build an agent for this week."
:::
