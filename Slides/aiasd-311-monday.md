---
ai_generated: true
model: "anthropic/claude-sonnet-4.5@2026-03-20"
operator: "johnmillerATcodemag-com"
chat_id: "merge-marp-decks-aiasd-311-monday-20260320"
prompt: |
  $MANIFEST = Slides/aiasd-311-monday.yaml
  Follow instructions in merge-marp-decks.prompt.md to merge individual Marp slide decks
  into a combined Monday session presentation for AIASD 311.
started: "2026-03-20T03:10:00Z"
ended: "2026-03-20T03:50:00Z"
task_durations:
  - task: "read manifest and individual decks"
    duration: "00:10:00"
  - task: "assemble combined deck with section dividers"
    duration: "00:25:00"
  - task: "verify speaker notes and provenance"
    duration: "00:05:00"
total_duration: "00:40:00"
ai_log: "ai-logs/2026/03/20/merge-marp-decks-aiasd-311-monday-20260320/conversation.md"
source: ".github/prompts/merge-marp-decks.prompt.md"
marp: true
theme: default
paginate: true
---

# AI-Assisted Software Development 311 — Monday

## Complete Monday Session

*VS Code Copilot Agents · Code Explanation & Analysis · Creating Custom Agents · GitHub CLI*

::: notes
Welcome to the AI-Assisted Software Development 311 Monday session. This combined presentation covers four modules: VS Code Copilot Agents Overview, Code Explanation and Analysis, Creating Custom Agents, and GitHub CLI workflows.

**Timing**: 1 minute

**Session Overview**:
This deck merges four individual module presentations into a single cohesive Monday session. Each module is separated by a section divider slide for easy navigation.

**Modules in This Session**:
1. **VS Code Copilot Agents Overview** — Agent types, configuration, hand-off workflows, and best practices
2. **Code Explanation and Analysis** — Inline chat, coverage gap analysis, and test implementation planning
3. **Creating Custom Agents** — Building, configuring, and deploying custom GitHub Copilot agents
4. **GitHub CLI** — Issue/PR management, Actions monitoring, and CI/CD integration

**Delivery Options**:
- Present all modules end-to-end as a full Monday session
- Present individual sections standalone using the section dividers as entry points

**Total Duration**: Approximately 2–3 hours with exercises and Q&A
:::

---

<!-- ============================================================ -->
<!-- SECTION: VS CODE COPILOT AGENTS OVERVIEW -->
<!-- ============================================================ -->

# VS Code Copilot Agents Overview

::: notes
This section divider marks the start of: VS Code Copilot Agents Overview.

**Transition**: "Let's dive into VS Code Copilot Agents Overview."
:::


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


---

<!-- ============================================================ -->
<!-- SECTION: CODE EXPLANATION AND ANALYSIS -->
<!-- ============================================================ -->

# Code Explanation and Analysis

::: notes
This section divider marks the start of: Code Explanation and Analysis.

**Transition**: "Let's dive into Code Explanation and Analysis."
:::


---


# Code Explanation and Analysis

## Section 10 — AI-Assisted Software Development

*Using GitHub Copilot to Understand and Improve Your Code*

::: notes
Welcome to Section 10: Code Explanation and Analysis. In this module we explore how GitHub Copilot helps developers understand unfamiliar code, identify gaps in test coverage, generate coverage reports, and build out a recommended test implementation plan.

**Timing**: 1 minute for title slide

**Key Points**:
- Code explanation tools reduce the time to understand legacy or complex code
- Coverage analysis gives you data-driven guidance on where tests are missing
- Copilot can turn a coverage report into a concrete, prioritized test plan

**Delivery**: Ask how many people have inherited a codebase with no documentation. This section's tools are especially valuable in those scenarios.

**Transition**: "Let's start with the fastest way to get an explanation of unfamiliar code — inline chat."
:::

---

## Ctrl+I: Inline Chat for Code Explanation

**Fastest path to understanding code**:

1. Select a block of code
2. Press **Ctrl+I** (or **Cmd+I** on macOS)
3. Type `/explain` or ask a natural language question

```typescript
// Select this function, then Ctrl+I → "What does this do?"
async function refreshTokenIfNeeded(
  token: string,
  thresholdMs: number = 300_000
): Promise<string> {
  const payload = decodeJwt(token);
  const expiresAt = payload.exp * 1000;
  if (Date.now() + thresholdMs >= expiresAt) {
    return await fetchNewToken(payload.sub);
  }
  return token;
}
```

**Copilot explains**: decoding, expiry calculation, proactive refresh strategy

::: notes
**Timing**: 3 minutes

**Why Inline Chat?**
Inline chat is faster than switching context to the sidebar. For quick "what does this do?" questions, Ctrl+I keeps you focused on the code itself.

**Useful Inline Prompts**:
- `/explain` — full English explanation
- "What edge cases does this handle?"
- "Why would this throw an exception?"
- "Explain the algorithm complexity"
- "What happens if `token` is expired by more than `thresholdMs`?"

**Demo Tip**:
Select a 5–10 line function from the audience's codebase (or a prepared example) and use /explain live. The output quality is immediately visible and tends to impress.

**Output Format**:
Inline chat explanations appear in a chat panel next to the code. They include:
- Purpose of the function
- Parameter descriptions
- Return value
- Side effects and dependencies
- Potential edge cases

**When to Use Inline vs Sidebar**:
- Inline (Ctrl+I): Quick explanation of selected code
- Sidebar (/explain): Longer conversation about a module or concept

**Transition**: "There's also a right-click option for code explanation — let's see how that compares."
:::

---

## Right-Click "Explain" Option

**Context menu integration** — no keyboard shortcut needed:

```
Right-click on any code
  └── Copilot
        ├── Explain This          ← opens sidebar explanation
        ├── Fix This
        ├── Generate Tests
        └── Generate Docs
```

**When to use right-click vs Ctrl+I**:

| Right-Click "Explain This" | Ctrl+I Inline |
|---------------------------|---------------|
| Opens full sidebar panel | Stays inline in editor |
| Better for longer explanations | Better for quick questions |
| Includes references and context | Focused on selection |
| Easier for non-keyboard workflows | Faster for keyboard users |

::: notes
**Timing**: 2 minutes

**Right-Click Workflow Details**:
The right-click context menu appears when you select code and right-click anywhere in the selection. "Explain This" sends the selection to the Copilot Chat sidebar.

**Sidebar Explanation Advantages**:
- Preserves the explanation for reference during editing
- Allows follow-up questions in the same thread
- Can explain multi-file context if you add files via `#file:` references
- Searchable conversation history

**Practical Scenario**:
You're reviewing a PR and encounter an unfamiliar algorithm. Right-click → Explain This gives you a sidebar explanation while the diff is still visible in the editor. You can ask follow-up questions without losing the PR context.

**The Full Copilot Context Menu**:
Note the other options: Fix This (for errors), Generate Tests (jumps to Section 10b), Generate Docs (JSDoc/docstring generation). These form a complete code quality toolkit in one menu.

**Accessibility Note**:
The right-click menu is particularly useful for team members who prefer mouse-driven workflows or are new to Copilot keyboard shortcuts.

**Transition**: "Understanding test code is a specific and valuable use case for explanation tools."
:::

---

## Understanding Test Code with Copilot

**Tests are often harder to read than source code.** Copilot explains:

```typescript
// Select this test — what is it actually verifying?
describe('TokenService', () => {
  it('refreshes when within threshold window', async () => {
    const frozenNow = new Date('2026-03-20T10:00:00Z').getTime();
    jest.spyOn(Date, 'now').mockReturnValue(frozenNow);

    const expiringSoon = generateToken({ exp: (frozenNow + 200_000) / 1000 });
    const result = await tokenService.refreshTokenIfNeeded(expiringSoon, 300_000);

    expect(result).not.toBe(expiringSoon);
    expect(fetchNewTokenSpy).toHaveBeenCalledWith(expect.any(String));
  });
});
```

**Copilot explains**: time mocking, threshold logic, spy assertions, what "refreshes when within threshold window" actually means

::: notes
**Timing**: 3 minutes

**Why Test Code Needs Explanation**:
Tests often contain complex setup: mocking, spies, fixtures, factories, and assertion patterns. Junior developers and those unfamiliar with the testing framework can struggle to understand what a test actually validates.

**What Copilot Explains in Tests**:
1. **The test setup** — what state is being prepared (`frozenNow`, mocked `Date.now`)
2. **The action** — what is being tested (`refreshTokenIfNeeded`)
3. **The assertion** — what outcome is expected and why
4. **The test name** — whether it accurately describes the scenario
5. **The mock strategy** — why spies and mocks are used here

**Common Test Explanation Prompts**:
- "What is this test checking?"
- "Why is Date.now being mocked?"
- "What would happen if I removed the spy assertion?"
- "Is this an integration test or a unit test?"
- "What bug would this test catch?"

**The Teaching Value**:
Copilot explanations of tests serve as on-demand training for developers learning testing patterns. Instead of reading documentation, developers get an explanation in the context of real project code.

**Transition**: "From understanding existing tests, let's look at finding the gaps — coverage analysis."
:::

---

## Coverage Gap Analysis

**Identifying what's not tested is as important as writing tests.**

**Step 1**: Run coverage report
```bash
npx jest --coverage --coverageReporters=json-summary
```

**Step 2**: Open the coverage summary, select a low-coverage file, then ask Copilot:
> "This file has 62% branch coverage. Which branches are not covered and what tests should I write?"

**Step 3**: Copilot analyzes the source code and coverage data to identify:
- Uncovered `if/else` branches
- Missing error path tests
- Untested edge cases
- Functions with 0% coverage

::: notes
**Timing**: 3 minutes

**Coverage Metrics Explained**:
- **Statement coverage**: Has each line run at least once?
- **Branch coverage**: Has each if/else taken both paths?
- **Function coverage**: Has each function been called?
- **Line coverage**: Similar to statement but counts physical lines

**Which Metric Matters Most?**
Branch coverage is the most meaningful for finding bugs — it ensures both happy paths and error paths are validated.

**Copilot Coverage Prompts**:
- "Which functions in this file have zero coverage?"
- "What edge cases does this error handler miss?"
- "Generate a test for the case where `userId` is null"
- "What would a test for the 403 response look like?"

**Practical Workflow**:
1. Run coverage in CI and export JSON
2. Sort files by coverage ascending
3. Take the bottom 20% — those are your priority
4. For each file, open source + ask Copilot for gap analysis
5. Generate tests from recommendations

**Istanbul/V8 Coverage**:
Most JS/TS projects use Istanbul (via jest) or V8 coverage. Both produce compatible JSON that you can reference in Copilot Chat by pasting excerpts.

**Transition**: "Let's look at generating a structured coverage report for a real service."
:::

---

## Generating Coverage Reports: Calculator Service

**Example**: The `CalculatorService` has 95% statement coverage but lower branch coverage.

```bash
$ npx jest --coverage calculator.service.spec.ts

 PASS  src/calculator.service.spec.ts
  CalculatorService
    ✓ adds two numbers (2ms)
    ✓ subtracts two numbers (1ms)
    ✓ multiplies two numbers (1ms)
    ✓ divides two numbers (1ms)
    ✗ divide: throws on zero denominator  ← MISSING

----------|---------|----------|---------|---------|
File      | % Stmts | % Branch | % Funcs | % Lines |
----------|---------|----------|---------|---------|
calc.ts   |   95.24 |    75.00 |  100.00 |   95.24 |
```

Copilot identifies: the `divisor === 0` branch has no test.

::: notes
**Timing**: 3 minutes

**Reading the Coverage Table**:
- **% Stmts (95.24%)**: 20 of 21 statements execute during tests
- **% Branch (75.00%)**: 3 of 4 branches taken — one path is never exercised
- **% Funcs (100%)**: Every function is called
- **% Lines (95.24%)**: Corresponds to statements here

**What the Missing 25% Branch Coverage Means**:
The `divide` function has an `if (divisor === 0) throw new Error(...)` guard. The happy-path test calls `divide(10, 2)` — it never exercises the zero-divisor branch.

**Why 95% Statement Coverage is Misleading**:
High statement coverage with low branch coverage creates a false sense of security. The most dangerous bugs often hide in error paths — exactly what branch coverage reveals.

**Copilot Conversation**:
```
User: "Here's my coverage report [paste]. What branch is missing coverage?"
Copilot: "The `divide` method's zero-divisor error branch is not covered.
         Add a test that calls divide(x, 0) and expects an Error to be thrown."
```

**Transition**: "From the report, let's identify all missing coverage areas systematically."
:::

---

## Identifying Missing Coverage Areas

**Systematic gap identification for `CalculatorService`**:

| Function | Missing Scenario | Risk Level |
|----------|-----------------|------------|
| `divide` | `divisor === 0` → throws | 🔴 High |
| `sqrt` | negative input → throws | 🔴 High |
| `power` | `exponent < 0` → decimal result | 🟡 Medium |
| `round` | rounding mode `HALF_EVEN` | 🟡 Medium |
| `parse` | non-numeric string input | 🔴 High |

**Copilot prompt to generate this table**:
> "Analyze `calculator.service.ts` and list every missing test scenario grouped by function, with risk classification"

::: notes
**Timing**: 3 minutes

**Risk Classification Criteria**:
- 🔴 **High**: Error paths, security boundaries, data loss scenarios, financial calculations
- 🟡 **Medium**: Edge cases that affect UX but don't cause data corruption
- 🟢 **Low**: Nice-to-have coverage, happy path variations

**Why Risk-Classify Coverage Gaps?**
With limited time, developers need to prioritize. Not all missing tests are equally important. The divide-by-zero error is more critical than testing `HALF_EVEN` rounding.

**Generating the Gap Table with Copilot**:
Open the source file in the editor, then in Copilot Chat:
```
#file:calculator.service.ts
Analyze this file for missing test scenarios.
Create a table with: function name, missing scenario, and risk level.
```

**Beyond the Calculator**:
This same technique works for any service. The larger and more complex the service, the more value systematic gap analysis provides. For a 2000-line service, this can identify 40-50 missing tests at once.

**Connecting to Coverage Tools**:
The gap table approach works with or without running coverage. Even before any tests exist, Copilot can analyze source code and predict what scenarios need testing.

**Transition**: "Now let's turn this gap table into a structured test implementation plan."
:::

---

## Recommended Test Implementation Plan

**Copilot generates a prioritized plan from the gap table**:

```markdown
## CalculatorService Test Implementation Plan

### Priority 1: Error Handling (🔴 High Risk)
- [ ] divide: throws Error when divisor is 0
- [ ] sqrt: throws Error when input is negative  
- [ ] parse: throws or returns NaN on non-numeric string

### Priority 2: Edge Cases (🟡 Medium Risk)
- [ ] power: returns decimal result for negative exponents
- [ ] round: HALF_EVEN mode rounds .5 toward nearest even

### Priority 3: Boundary Values (🟢 Low Risk)
- [ ] add: handles MAX_SAFE_INTEGER without overflow
- [ ] multiply: handles very small floating-point inputs
```

**Prompt**: "Generate a test plan with prioritized tasks and checkboxes for the identified gaps"

::: notes
**Timing**: 3 minutes

**Why Markdown Checklists?**
The checklist format is immediately actionable — developers can copy it to a GitHub issue, Jira story, or team task tracker. Copilot generates this format reliably when you specify "with checkboxes."

**Using the Plan in Your Workflow**:
1. Copy the plan to a GitHub Issue or PR description
2. Assign individual tasks to team members
3. Work through them in priority order
4. Check items off as tests pass in CI
5. Link the plan to your coverage improvement PR

**Refining the Plan**:
After Copilot generates the initial plan, ask follow-up questions:
- "Add time estimates to each task"
- "Group tests that can share test fixtures"
- "Which tests can be parallelized?"
- "Add the expected assertion for each test case"

**Turning the Plan Into an Issue**:
```bash
gh issue create \
  --title "Improve CalculatorService test coverage from 75% to 95%" \
  --body "$(cat test-plan.md)" \
  --label "testing,tech-debt"
```

**Transition**: "The final step is actually implementing the tests — and Copilot helps there too."
:::

---

## Implementing Tests from Recommendations

**From plan to passing tests — Copilot generates the test code**:

```typescript
// Prompt: "Implement Priority 1 tests from the plan for CalculatorService"

describe('CalculatorService - Error Handling', () => {
  let service: CalculatorService;

  beforeEach(() => { service = new CalculatorService(); });

  describe('divide', () => {
    it('throws Error when divisor is 0', () => {
      expect(() => service.divide(10, 0))
        .toThrow('Division by zero is not allowed');
    });
  });

  describe('sqrt', () => {
    it('throws Error when input is negative', () => {
      expect(() => service.sqrt(-4))
        .toThrow('Cannot calculate square root of a negative number');
    });
  });
});
```

::: notes
**Timing**: 3 minutes

**The Full Implementation Loop**:
1. Copilot generates the test scaffold from the plan
2. Developer reviews and adjusts error messages to match actual code
3. Run tests — they fail (TDD red phase)
4. Fix the implementation (or just the test) to make them pass
5. Green — check off the task in the plan

**Context for Better Generation**:
```
#file:calculator.service.ts
#file:calculator.service.spec.ts
Implement tests for Priority 1 items: divide/0 and sqrt/negative.
Match the existing test style and error message text from the source.
```

**Common Issues and Fixes**:
- **Wrong error message**: Check the actual `throw new Error('...')` text in source
- **Wrong test structure**: Provide the existing spec file as context
- **Missing beforeEach**: Copilot sometimes omits setup — ask "add beforeEach for CalculatorService instantiation"

**Measuring Improvement**:
After implementing all Priority 1 tests, re-run coverage:
```bash
npx jest --coverage calculator.service.spec.ts
```
Branch coverage should jump from 75% to 90%+.

**Transition**: "Let's close with some practice exercises to reinforce these techniques."
:::

---

## Practice Exercises

**Exercise 1: Explain Unfamiliar Code** *(5 minutes)*
- Find a function in your project you don't fully understand
- Select it and press Ctrl+I → `/explain`
- Follow up with: "What would break if I removed the null check?"

**Exercise 2: Coverage Gap Analysis** *(10 minutes)*
- Run `npx jest --coverage` (or language equivalent) on a service
- Find a file under 80% branch coverage
- Ask Copilot: "What branches are not covered in this file?"

**Exercise 3: Build a Test Plan** *(10 minutes)*
- Take the gap table from Exercise 2
- Prompt: "Generate a prioritized test implementation plan with checkboxes"
- Copy the plan to a GitHub Issue

**Exercise 4: Implement One Test** *(10 minutes)*
- Pick one High priority item from your plan
- Use Copilot to generate the test
- Run it and verify it fails for the right reason, then passes

::: notes
**Timing**: 5 minutes to walk through exercises, remaining time for teams to work

**Facilitation Notes**:

**Exercise 1** is the warmup — everyone can find code they don't understand. This builds comfort with Ctrl+I and inline explanation.

**Exercise 2** requires running a test suite. Have a fallback: if the project doesn't have tests or coverage set up, provide the prepared CalculatorService example files.

**Exercise 3** is the planning workflow. Encourage teams to actually create the GitHub Issue — it makes the value concrete and immediately useful.

**Exercise 4** is the implementation. The key learning is that Copilot-generated tests often need small adjustments (error messages, context) — that's expected and educational.

**Debrief Questions**:
- "Did the /explain output match your understanding of the code?"
- "What was the most surprising gap Copilot found?"
- "How long did it take to go from 'I don't know what to test' to a specific test?"

**Common Obstacles**:
- No test framework set up: Use the prepared example or skip to Exercise 1 only
- Low coverage everywhere: Pick the highest-priority business logic file

**Call to Action**:
"Before the next session, implement all the Priority 1 tests from your plan and note the before/after coverage numbers."
:::


---

<!-- ============================================================ -->
<!-- SECTION: CREATING CUSTOM AGENTS -->
<!-- ============================================================ -->

# Creating Custom Agents

::: notes
This section divider marks the start of: Creating Custom Agents.

**Transition**: "Let's dive into Creating Custom Agents."
:::


---


# Creating Custom Agents

## Specialized AI Assistants for Your Workflow

GitHub Copilot Custom Agents

::: notes
Welcome to this presentation on creating custom agents for GitHub Copilot. This session will teach you how to create specialized AI assistants tailored to specific development tasks and workflows.

**Timing**: 1 minute for title slide

**Key Points**:

- Custom agents extend GitHub Copilot's capabilities
- Allow specialization for specific tasks and domains
- Available across multiple development environments

**Delivery**: Start with a brief overview of what custom agents are and why they're valuable. Gauge audience familiarity with GitHub Copilot before diving into details.

**Transition**: "Let's start by understanding what custom agents are and how they can enhance your development workflow."
:::

---

## What Are Custom Agents?

Custom agents are specialized AI assistants with:

- **Tailored expertise** for specific development tasks
- **Configurable tools** and capabilities
- **Custom instructions** defining behavior
- **Reusable profiles** across projects
- **Available in multiple environments** (GitHub.com, VS Code, JetBrains, Eclipse, Xcode)

::: notes
**Timing**: 2-3 minutes

**Key Points to Emphasize**:

1. Custom agents are NOT separate AI models - they're specialized configurations of GitHub Copilot
2. Think of them as "personas" or "roles" for your AI assistant
3. They're defined in simple markdown files with YAML frontmatter

**Examples to Share**:

- Testing specialist that focuses only on test code
- Documentation writer that creates comprehensive docs
- Implementation planner that designs before coding
- Security reviewer that checks for vulnerabilities

**Audience Interaction**: "Has anyone worked with AI assistants that seemed too generic or gave responses outside their intended scope? Custom agents solve this problem."

**Transition**: "Now let's see where and how you can create these custom agents."
:::

---

## Where to Create Custom Agents

### GitHub.com

- Navigate to [github.com/copilot/agents](https://github.com/copilot/agents)
- Available at repository, organization, or enterprise level
- Template-based creation process

### IDEs

- **VS Code**: Configure Custom Agents menu
- **JetBrains**: Configure Agents settings
- **Eclipse**: Add custom agents dialog
- **Xcode**: Create agent from dropdown

::: notes
**Timing**: 3 minutes

**Delivery Instructions**:

- Show the GitHub.com interface if doing a live demo
- Emphasize that agents created on GitHub can be used across all environments
- IDE-based agents are more convenient for quick personal use

**Key Decision Point**: Help audience understand when to use each approach:

- **GitHub**: For team-wide or shared agents
- **Organization/Enterprise**: For standardized agents across multiple repos
- **IDE**: For personal experimentation and workspace-specific agents

**Technical Detail**:

- GitHub agents go in `.github/agents/` directory
- Organization/enterprise agents go in root `agents/` directory of `.github-private` repo
- IDE user profile agents are local to that machine

**Common Question**: "Can I use the same agent in both GitHub and my IDE?"
**Answer**: Yes! Agents created on GitHub are automatically available in supported IDEs.

**Transition**: "Let's walk through creating an agent on GitHub, which is the most common workflow."
:::

---

## Creating on GitHub: Step-by-Step

1. Go to `github.com/copilot/agents`
2. Select repository (or `.github-private` for org/enterprise)
3. Click Copilot icon → **Create an agent**
4. Creates template: `my-agent.agent.md` in `.github/agents/`
5. Rename file with descriptive name (e.g., `test-specialist.agent.md`)
6. Configure agent profile (next slide)
7. Commit to default branch
8. Agent appears in dropdown immediately

::: notes
**Timing**: 4-5 minutes (include live demo if possible)

**Step-by-Step Walkthrough**:

**Step 1-2**: Emphasize the importance of selecting the right repository

- Personal repo = just for you
- Organization repo = for entire org
- `.github-private` = special repository for org/enterprise-wide agents

**Step 3-4**: The template is your starting point

- Don't skip past it - it contains all required sections
- Template includes helpful comments

**Step 5**: Filename guidelines (critical!)

- Use lowercase letters, numbers, dots, dashes, underscores only
- Must end with `.agent.md`
- Filename becomes the default agent name
- Examples: `test-specialist.agent.md`, `security-reviewer.agent.md`, `doc-writer.agent.md`

**Step 6**: We'll cover configuration in detail on next slides

**Step 7-8**: No build process or waiting

- Immediate availability after merge
- Refresh the page if you don't see it

**Common Pitfalls**:

- Forgetting to merge to default branch (agent won't appear)
- Using spaces or special characters in filename
- Not providing a description in the YAML

**Demo Tip**: If showing live, create a simple agent like "hello-world.agent.md" to demonstrate the process.

**Transition**: "Now that we know how to create the file, let's understand what goes inside it."
:::

---

## Creating in VS Code

1. Open GitHub Copilot Chat
2. Agents dropdown → **Configure Custom Agents...**
3. Click **Create new custom agent**
4. Choose location:
   - **Workspace**: `.github/agents/` (project-specific)
   - **User profile**: Personal agents (all workspaces)
5. Enter filename
6. Configure in `.agent.md` file
7. Use **Configure Tools...** button for tool selection
8. Set `model:` property for AI model preference

::: notes
**Timing**: 3-4 minutes

**VS Code Advantages**:

- Integrated tool configuration UI
- Immediate testing in the same environment
- Better for rapid iteration and experimentation
- User profile agents for personal productivity

**Workspace vs User Profile Decision**:

**Workspace** (`.github/agents/`):

- Shared with team when committed
- Project-specific context
- Version controlled
- Recommended for team agents

**User Profile**:

- Available across all your projects
- Not version controlled
- Personal productivity tools
- Examples: personal note-taking agent, time tracker

**Configure Tools Button**:

- Opens visual dialog showing all available tools
- Includes built-in tools (read, edit, search, etc.)
- Shows MCP server tools if configured
- Click OK to add selected tools to YAML

**Model Property**:

- Override default model per agent
- Useful for cost/performance tradeoffs
- Example: Use faster model for simple tasks, advanced model for complex reasoning

**Live Demo Suggestion**: Show the Configure Tools dialog and model dropdown

**Common Questions**:

- "Do I need to restart VS Code?" - No, agents are detected automatically
- "Can I edit the YAML directly?" - Yes, the UI is just a helper

**Transition**: "The process is similar in JetBrains, Eclipse, and Xcode with slight UI variations. Now let's focus on what matters most: the agent configuration itself."
:::

---

## Agent Profile Structure

```yaml
---
name: test-specialist
description: Focuses on test coverage and quality
tools: ["read", "edit", "search"]
model: gpt-4
target: vscode # optional: vscode or github-copilot
---
You are a testing specialist...

[Detailed instructions and behavior]
```

**Key Components**:

- **YAML frontmatter**: Metadata and configuration
- **Markdown content**: Instructions and behavior (max 30,000 chars)

::: notes
**Timing**: 4-5 minutes

**Anatomy of an Agent Profile**:

**YAML Frontmatter** (Required):

1. **name** (optional): Display name in dropdown
   - Defaults to filename without extension
   - Keep concise (2-4 words)
   - Examples: "Test Specialist", "Security Reviewer"

2. **description** (REQUIRED): What the agent does
   - Must be clear and specific
   - Explains capabilities and domain
   - Appears in agent selection UI
   - 1-2 sentence summary

3. **tools** (optional): Which tools agent can use
   - Omit to enable ALL tools
   - List specific tools to restrict access
   - Format: `["tool1", "tool2", "mcp-server/tool3"]`
   - Common tools: read, edit, search, run, debug

4. **model** (IDE only): Which AI model to use
   - Only works in VS Code, JetBrains, Eclipse, Xcode
   - Examples: "gpt-4", "gpt-3.5-turbo", "claude-3-opus"
   - Ignored on GitHub.com

5. **target** (optional): Environment restriction
   - "vscode" = only in IDEs
   - "github-copilot" = only on GitHub.com
   - Omit = works everywhere

6. **mcp-servers** (org/enterprise only): Configure MCP servers for this agent

**Markdown Content** (The Agent's "Brain"):

- Define personality and expertise
- Set boundaries and constraints
- Provide examples of good behavior
- Specify output formats
- Maximum 30,000 characters (plenty of space!)

**Best Practices**:

- Be specific about what the agent should AND shouldn't do
- Include examples of desired behavior
- Mention file patterns or naming conventions
- Specify testing/validation requirements

**Transition**: "Let's see what these instructions look like in real agent examples."
:::

---

## Example 1: Testing Specialist

```markdown
---
name: test-specialist
description: Focuses on test coverage, quality, and testing
  best practices without modifying production code
---

You are a testing specialist focused on improving code
quality through comprehensive testing. Your responsibilities:

- Analyze existing tests and identify coverage gaps
- Write unit tests, integration tests, and end-to-end tests
- Review test quality and suggest improvements
- Ensure tests are isolated, deterministic, and documented
- Focus only on test files - avoid modifying production code

Always include clear test descriptions and use appropriate
testing patterns for the language and framework.
```

::: notes
**Timing**: 3-4 minutes

**Why This Example Works**:

**Clear Scope Definition**:

- "Focuses on test coverage" - tells user what it does
- "Without modifying production code" - tells user what it WON'T do
- Sets clear boundaries to prevent scope creep

**Specific Responsibilities**:

1. "Analyze existing tests" - audit capability
2. "Write unit/integration/e2e tests" - creation capability
3. "Review test quality" - critique capability
4. "Ensure tests are isolated" - quality standards
5. "Focus only on test files" - reinforces boundary

**Behavioral Constraints**:

- "Focus only on test files" - prevents the agent from refactoring production code
- "Avoid modifying production code unless specifically requested" - allows override when needed

**Quality Standards**:

- "Isolated" - no shared state between tests
- "Deterministic" - same input = same output
- "Well-documented" - clear descriptions and comments

**Pattern Recognition**:

- "Use appropriate testing patterns for the language and framework"
- Agent will adapt to Jest, pytest, JUnit, etc.

**Usage Scenarios**:

- Adding tests to legacy code
- Improving test coverage metrics
- Reviewing PR test quality
- Learning testing best practices

**Customization Ideas**:

- Add specific test frameworks to use
- Include code coverage thresholds
- Specify test naming conventions
- Add mutation testing requirements

**Common Question**: "Why not enable all tools?"
**Answer**: Not specified here, so all tools are available. But you might restrict to ["read", "edit"] to prevent running or deploying.

**Transition**: "Here's another example that shows a different use case - planning instead of coding."
:::

---

## Example 2: Implementation Planner

```markdown
---
name: implementation-planner
description: Creates detailed implementation plans and
  technical specifications in markdown format
tools: ["read", "search", "edit"]
---

You are a technical planning specialist. Your responsibilities:

- Analyze requirements and break them into actionable tasks
- Create detailed technical specs and architecture docs
- Generate implementation plans with steps and dependencies
- Document API designs, data models, and system interactions
- Create markdown files that development teams can follow

Always structure plans with clear headings, task breakdowns,
and acceptance criteria. Include considerations for testing,
deployment, and risks. Focus on thorough documentation
rather than implementing code.
```

::: notes
**Timing**: 3-4 minutes

**Strategic Difference from Test Specialist**:

**Tools Restriction**:

- Only `["read", "search", "edit"]` enabled
- NOT "run" or "debug" - this agent doesn't execute code
- NOT "shell" - doesn't deploy or build
- Enforces its role as a planner, not implementer

**Planning-Specific Responsibilities**:

1. "Analyze requirements" - requirements engineering
2. "Break them into actionable tasks" - work breakdown
3. "Technical specs and architecture docs" - documentation focus
4. "Implementation plans with dependencies" - sequencing and scheduling
5. "API designs, data models" - interface definition

**Output Format**:

- "Markdown format" - specified in description
- "Markdown files that development teams can follow" - artifact focus
- "Clear headings, task breakdowns" - structure requirements

**Non-Code Focus**:

- "Focus on thorough documentation rather than implementing code"
- Critical boundary: this agent designs but doesn't build
- Prevents mixing planning and implementation concerns

**When to Use This Agent**:

- Starting new features or projects
- Architectural decision records (ADRs)
- Epic and story breakdown
- Technical RFCs
- Onboarding documentation
- Migration plans

**Output Examples**:

- `IMPLEMENTATION_PLAN.md` with tasks and timeline
- `ARCHITECTURE.md` with system design
- `API_SPEC.md` with endpoint definitions
- `DATA_MODEL.md` with schema definitions

**Team Benefits**:

- Consistent planning documentation format
- Separation of planning from coding
- Better task estimation
- Clear acceptance criteria
- Risk identification upfront

**Customization Ideas**:

- Add specific template sections
- Include estimation guidance
- Specify diagram types (C4, sequence, etc.)
- Add stakeholder communication sections

**Comparison to Test Specialist**:

- Test Specialist: All tools, focused on test files
- Implementation Planner: Limited tools, focused on documentation

**Transition**: "These examples show two very different agent types. Now let's learn how to actually use custom agents once they're created."
:::

---

## Using Custom Agents

### On GitHub.com

- Agents panel/tab dropdown → Select your custom agent
- Assign custom agent to issues
- Noted in PR descriptions when used

### In IDEs

- Chat window dropdown → Select agent
- Switch agents mid-conversation
- Access specialized configurations per task

### GitHub Copilot CLI

- `/agent` command to select agent
- Reference agent in prompts
- Command-line argument support

::: notes
**Timing**: 4-5 minutes

**GitHub.com Usage**:

**Agents Panel Workflow**:

1. Open Copilot agents panel or tab
2. Click dropdown (currently shows "Coding Agent")
3. Select your custom agent from list
4. Enter your prompt or task
5. Agent works within its configured scope

**Issue Assignment**:

- Assign Copilot to an issue
- Choose custom agent from dropdown
- Agent follows its specialized instructions
- Great for repetitive tasks (bug triage, documentation updates)

**PR Tracking**:

- When Copilot creates a PR, it notes which agent was used
- Helps with attribution and understanding the approach
- Example: "This PR was created by @copilot using the test-specialist agent"

**IDE Usage Benefits**:

**Mid-Conversation Switching**:

- Start with planning agent
- Switch to implementation agent
- Switch to review agent
- Maintain conversation context

**Task-Specific Workflows**:

1. Use planning agent for architecture decisions
2. Use coding agent for implementation
3. Use test agent for test coverage
4. Use security agent for vulnerability review
5. Use doc agent for documentation

**Example IDE Workflow**:

```
User: "I need to add user authentication"
[Select implementation-planner agent]
Agent: Creates detailed plan with tasks

User: "Now implement the first task"
[Switch to coding agent]
Agent: Implements based on plan

User: "Add tests for this"
[Switch to test-specialist agent]
Agent: Creates comprehensive test suite
```

**CLI Usage** (Advanced):

**Basic Agent Selection**:

```bash
gh copilot /agent test-specialist "add tests for authentication"
```

**In Prompts**:

```bash
gh copilot "using security-reviewer, check this PR for vulnerabilities"
```

**Via Arguments**:

```bash
gh copilot --agent=doc-writer "document the API endpoints"
```

**Best Practices**:

1. **Choose the Right Agent**:
   - Match agent expertise to task
   - Don't use generic agent when specialized one exists

2. **Provide Context**:
   - Custom agents still need context
   - Reference files, requirements, constraints

3. **Iterate**:
   - Refine agent instructions based on results
   - Agents improve as you tune them

4. **Document Usage**:
   - Tell team which agents to use for which tasks
   - Include in CONTRIBUTING.md or team wiki

**Common Scenarios**:

- **Code Review**: Use review agent on PRs
- **Legacy Refactoring**: Use planning agent first, then coding agent
- **Documentation Sprint**: Use doc agent across multiple files
- **Security Audit**: Use security agent on entire codebase
- **Test Coverage Drive**: Use test agent to fill coverage gaps

**Transition**: "Let's wrap up with some best practices and resources to help you get started."
:::

---

## Best Practices

1. **Start Simple**: Create one agent for a specific pain point
2. **Be Specific**: Define clear boundaries and responsibilities
3. **Restrict Tools**: Only enable tools the agent needs
4. **Iterate**: Refine instructions based on real usage
5. **Share**: Create org/enterprise agents for common tasks
6. **Document**: Include usage examples in agent description
7. **Test**: Validate agent behavior before team rollout

::: notes
**Timing**: 4 minutes

**Detailed Best Practices**:

**1. Start Simple**:

- Don't try to create every agent at once
- Identify ONE repetitive task that's painful
- Create an agent for that specific task
- Validate it works before creating more
- Example: If code reviews always miss test coverage, start with test-specialist

**2. Be Specific**:

- Vague: "Help with coding"
- Specific: "Write unit tests following Jest conventions for React components"
- Include examples of good behavior
- Specify what NOT to do
- Bad example: "Be helpful"
- Good example: "Focus only on test files in **tests** directories. Never modify source files in src/ directory."

**3. Restrict Tools**:

- More tools ≠ better agent
- Restrict to enforce boundaries
- Planning agent doesn't need "run" tool
- Doc agent doesn't need "debug" tool
- Security agent might only need "read" and "search"
- Benefits:
  - Faster execution (fewer options to consider)
  - Clear scope (can't do things outside role)
  - Safer (can't accidentally deploy or delete)

**4. Iterate**:

- Agents aren't "write once and forget"
- Monitor what they produce
- Collect feedback from team
- Refine instructions based on real usage
- Example iteration:
  - V1: "Write tests"
  - V2: "Write tests with descriptive names"
  - V3: "Write tests with descriptive names following pattern: describe-context-behavior"
  - V4: Add specific Jest matchers to prefer

**5. Share**:

- Don't create duplicate agents across repos
- Use organization-level agents for standards
- Examples:
  - Code style checker (enforces org conventions)
  - Security reviewer (org security policies)
  - Doc generator (org documentation standards)
- Benefits:
  - Consistency across projects
  - Single place to maintain
  - Easier onboarding

**6. Document**:

- Good description is crucial
- Include examples in the agent markdown
- Add usage instructions
- Example:

  ```markdown
  ## Usage Examples

  ❌ Bad: "Fix the tests"
  ✅ Good: "Add unit tests for the UserService class covering success and error cases"

  ❌ Bad: "Make it better"
  ✅ Good: "Increase test coverage for auth module to 80%"
  ```

**7. Test**:

- Try agent on sample tasks before team rollout
- Test edge cases
- Verify it respects boundaries
- Check tool usage is appropriate
- Get feedback from 2-3 team members first
- Make it easy to rollback (version control!)

**Anti-Patterns to Avoid**:

- **Too Generic**: "Help with everything" - defeats the purpose
- **Too Narrow**: "Only fix typos in README" - waste of an agent
- **No Constraints**: All tools enabled, no guidelines - unpredictable
- **Copy-Paste**: Duplicating built-in agents - adds confusion
- **Set and Forget**: Never updating based on experience
- **No Testing**: Rolling out to team without validation

**Success Metrics**:

- Time saved on repetitive tasks
- Consistency in output quality
- Reduction in review comments for that area
- Team adoption rate
- Positive feedback from users

**Transition**: "You now have everything you need to create your first custom agent. Here are resources to dive deeper."
:::

---

## Next Steps

### Resources

- 📚 [Your First Custom Agent Tutorial](https://docs.github.com/en/copilot/tutorials/customization-library/custom-agents/your-first-custom-agent)
- 📖 [Custom Agents Configuration Reference](https://docs.github.com/en/copilot/reference/custom-agents-configuration)
- 🎯 [Customization Library Examples](https://docs.github.com/en/copilot/tutorials/customization-library/custom-agents)
- 💡 [Awesome Copilot Community Collection](https://github.com/github/awesome-copilot/tree/main/agents)

### Try It Now

1. Create your first agent for a specific task
2. Test with real scenarios
3. Share with your team
4. Iterate based on feedback

::: notes
**Timing**: 2-3 minutes for closing

**Resource Walkthrough**:

**Your First Custom Agent Tutorial**:

- Step-by-step hands-on guide
- Creates a working agent from scratch
- Best starting point for beginners
- Estimated time: 15-30 minutes

**Custom Agents Configuration Reference**:

- Complete YAML property documentation
- All available tool names
- MCP server configuration
- Target environment specifics
- Use this when fine-tuning existing agents

**Customization Library**:

- Curated examples from GitHub
- Covers common scenarios:
  - Code review specialists
  - Documentation generators
  - Test coverage improvers
  - Security analyzers
- Copy, customize, deploy

**Awesome Copilot Collection**:

- Community-contributed agents
- Wide variety of use cases
- Not officially supported but often high quality
- Great for inspiration
- Can find niche/specialized agents

**Actionable First Steps**:

**Immediate (Next 30 Minutes)**:

1. Go to github.com/copilot/agents
2. Create a simple "hello world" agent
3. Test it with a basic task
4. Verify it appears in dropdown

**Short Term (This Week)**:

1. Identify one repetitive task in your workflow
2. Create a specialized agent for it
3. Use it for 5-10 real tasks
4. Note what works and what doesn't

**Medium Term (This Month)**:

1. Refine your agent based on usage
2. Share with team for feedback
3. Create 2-3 more agents for other tasks
4. Document usage patterns

**Long Term (This Quarter)**:

1. Build agent library for common team tasks
2. Create organization-level agents for standards
3. Train team on agent selection and usage
4. Measure impact on productivity

**Quick Win Ideas**:

For Individual Developers:

- Personal productivity agent (time tracking, TODO management)
- Learning agent (explains unfamiliar code patterns)
- Code quality agent (checks style before commit)

For Teams:

- PR description generator (consistent format)
- Test coverage enforcer (blocks PRs without tests)
- Documentation updater (keeps docs in sync)
- Security baseline checker (org security policies)

**Call to Action**:

"Your homework: Before the end of this week, create one custom agent for a task you do repeatedly. It can be as simple as 'always write doc comments' or as complex as 'generate API documentation from OpenAPI specs'. Start small, iterate, and share your results!"

**Q&A Preparation**:

Common Questions to Expect:

1. "Can agents call other agents?" - Not yet, but on roadmap
2. "How many agents can I create?" - No documented limit
3. "Do agents cost extra?" - No, included in Copilot license
4. "Can I sell/distribute my agents?" - Yes, they're just markdown files
5. "What if my agent breaks?" - Just edit the file, changes are immediate

**Thank You Slide Options**:

- Show your GitHub handle for questions
- Link to your custom agents repo
- Office hours or follow-up session details
- Feedback form or survey
  :::

---

## Thank You

### Questions?

**GitHub**: [@johnmillerATcodemag-com](https://github.com/johnmillerATcodemag-com)
**Repository**: [AI-Assisted-Software-Development](https://github.com/johnmillerATcodemag-com/AI-Assisted-Software-Development)

::: notes
**Timing**: 5-10 minutes for Q&A

**Facilitating the Closing**:
Thank the audience for their time and engagement. Remind them that the GitHub repository contains all the resources covered in this session — agent examples, instruction files, and documentation.

**Encourage Questions**:
Open the floor for questions. Common topics: agent pricing, limits, organization-level deployment, and integration with existing workflows.

**Call to Action**: Ask each participant to identify one repetitive task they'll automate with a custom agent this week. Small wins build momentum.
:::

---

**Start creating your custom agents today!**

::: notes
**Final Slide Notes**:

**Timing**: 5-10 minutes for Q&A

**Q&A Facilitation Tips**:

1. **Repeat Questions**: Ensure entire audience hears
2. **Validate**: "That's a great question..."
3. **Bridge**: Connect to content covered
4. **Offer Follow-Up**: "Let's discuss after session"

**Likely Questions & Answers**:

**Q: Can I version control my agents?**
A: Yes! They're just markdown files in your repo. Use git branches, tags, etc.

**Q: How do I test changes before rolling out to team?**
A: Create in a feature branch, test locally in your IDE, then merge when ready.

**Q: Can I use secrets/API keys in agents?**
A: No, never hardcode secrets. Reference environment variables or use GitHub secrets.

**Q: What's the difference between custom agents and agents?**
A: Agents are the general feature. "Custom agents" are user- or org-defined. "Built-in agents" like coding agent are from GitHub.

**Q: Do agents work offline?**
A: No, they require GitHub Copilot API access.

**Q: Can I charge for my agents?**
A: Agents themselves are free. You could offer consulting/implementation services.

**Q: How do I debug agent behavior?**
A: Check the instructions, verify tools list, test with specific prompts, iterate.

**Q: Can agents access my entire codebase?**
A: They use the tools you enable. "read" tool allows reading files. Restriction through tool selection.

**Follow-Up Actions**:

- Collect email addresses for resource sharing
- Schedule office hours for hands-on help
- Create Slack/Teams channel for ongoing discussion
- Plan follow-up session for advanced topics

**Advanced Topics for Future Sessions**:

- MCP server integration
- Multi-agent workflows
- Organization governance
- Metrics and monitoring
- Agent templates and standards

**Closing**:
"Thank you all for attending! Remember: the best way to learn is by doing. Create your first agent this week, and don't hesitate to reach out if you hit any blockers. Happy coding!"
:::


---

<!-- ============================================================ -->
<!-- SECTION: GITHUB CLI -->
<!-- ============================================================ -->

# GitHub CLI

::: notes
This section divider marks the start of: GitHub CLI.

**Transition**: "Let's dive into GitHub CLI."
:::


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

