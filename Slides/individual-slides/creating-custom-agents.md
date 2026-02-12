---
ai_generated: true
model: "anthropic/claude-3.5-sonnet@2024-10-22"
operator: "johnmillerATcodemag-com"
chat_id: "create-custom-agents-marp-20260212"
prompt: |
  #file:create-custom-agents create a marp deck from this info in this file
started: "2026-02-12T00:00:00Z"
ended: "2026-02-12T00:15:00Z"
task_durations:
  - task: "content structuring"
    duration: "00:05:00"
  - task: "slide creation"
    duration: "00:08:00"
  - task: "speaker notes"
    duration: "00:02:00"
total_duration: "00:15:00"
ai_log: "ai-logs/2026/02/12/create-custom-agents-marp-20260212/conversation.md"
source: "johnmillerATcodemag-com"
marp: true
theme: default
paginate: true
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
