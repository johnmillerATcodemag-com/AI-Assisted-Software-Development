---
ai_generated: true
model: "anthropic/claude-3.5-sonnet@2024-10-22"
operator: "johnmillerATcodemag-com"
chat_id: "update-custom-agents-instructions-20260212"
prompt: |
  Compare chatmode-file.instructions.md with GitHub's official custom agents guidance
  and create new instructions file aligned with official implementation
started: "2026-02-12T00:00:00Z"
ended: "2026-02-12T00:30:00Z"
task_durations:
  - task: "analysis and comparison"
    duration: "00:10:00"
  - task: "instruction file creation"
    duration: "00:20:00"
total_duration: "00:30:00"
ai_log: "ai-logs/2026/02/12/update-custom-agents-instructions-20260212/conversation.md"
source: "johnmillerATcodemag-com"
applyTo: "**/*.agent.md"
---

# AI Instructions: GitHub Custom Agents

Create specialized GitHub Copilot custom agents with domain expertise following official GitHub implementation.

## File Structure

### Naming & Location

**Repository-Level Agents**:

- Pattern: `<agent-name>.agent.md` (kebab-case)
- Location: `.github/agents/`
- Extension: `.agent.md` (required)
- Scope: Available to repository collaborators

**Organization/Enterprise-Level Agents**:

- Pattern: `<agent-name>.agent.md` (kebab-case)
- Location: `agents/` (root directory)
- Extension: `.agent.md` (required)
- Scope: Available across all repositories

**User-Level Agents** (VS Code only):

- Location: User profile folder
- Scope: Personal use across all workspaces

### Filename Rules

Valid characters only: `.`, `-`, `_`, `a-z`, `A-Z`, `0-9`

Examples:

- ✅ `security-analyzer.agent.md`
- ✅ `test-specialist.agent.md`
- ✅ `api-documenter.agent.md`
- ❌ `security analyzer.agent.md` (no spaces)
- ❌ `security@analyzer.agent.md` (invalid character)

## YAML Frontmatter (Required)

### Required Properties

```yaml
---
name: agent-name # Optional: defaults to filename without extension
description: Brief description explaining agent's purpose and capabilities # REQUIRED
---
```

### Optional Properties

```yaml
---
name: custom-display-name
description: Expert security analyst for vulnerability detection
tools: ["read", "edit", "search", "create_issue"]
mcp-servers: # Organization/Enterprise only
  weather:
    command: npx
    args: ["-y", "@modelcontextprotocol/server-weather"]
model: "gpt-4" # IDE-specific (VS Code, JetBrains, Eclipse, Xcode)
target: "vscode" # vscode, github-copilot, or omit for both
---
```

### Property Specifications

**name** (optional):

- Display name for agent
- Defaults to filename without `.agent.md` or `.md` suffix
- Use kebab-case or descriptive name

**description** (required):

- Brief explanation of agent's purpose
- What it does and domain expertise
- Visible to users when selecting agents

**tools** (optional):

- Array of tool names/aliases agent can use
- Omit to grant access to ALL available tools
- Include MCP server tools as "server-name/tool-name"
- Examples: `["read", "edit", "search", "github", "weather/forecast"]`

**mcp-servers** (optional, org/enterprise only):

- Configure Model Context Protocol servers
- Extend agent capabilities with external tools
- Format: server-name with command and args

**model** (optional, IDE only):

- Specify AI model for agent (VS Code, JetBrains, Eclipse, Xcode)
- Not available on GitHub.com
- Examples: `"gpt-4"`, `"gpt-3.5-turbo"`

**target** (optional):

- `"vscode"`: Only in VS Code
- `"github-copilot"`: Only on GitHub.com
- Omit: Available in both environments

## Prompt Content (Markdown)

### Character Limit

**Maximum: 30,000 characters**

Includes all markdown content below frontmatter:

- Mission statement
- Core expertise
- Methodology
- Instructions
- Examples

### Recommended Structure

```markdown
---
name: security-analyzer
description: Expert security analyst for vulnerability detection
tools: ["read", "edit", "search", "create_issue"]
---

You are a security specialist focused on [domain]. Your responsibilities:

- [Responsibility 1]
- [Responsibility 2]
- [Responsibility 3]

## Core Expertise

- **[Area]**: Description
- **[Area]**: Description

## Analysis Approach

1. [Step 1]
2. [Step 2]
3. [Step 3]

## Key Principles

- [Principle 1]
- [Principle 2]
```

### Content Guidelines

**Mission Statement**: 1-3 paragraphs defining role and value

**Core Expertise**: 5-10 specific capability areas

**Methodology**: Structured approach to tasks (optional)

**Behavioral Guidelines**: How agent should respond

**Examples**: Usage demonstrations (optional but recommended)

**Constraints**: What agent should NOT do

## Tool Configuration

### Default Behavior (No tools property)

Agent has access to ALL available tools:

- File operations (read, write, edit)
- Search and navigation
- GitHub operations (issues, PRs)
- Workspace operations
- Terminal commands
- MCP server tools (if configured)

### Restricted Tools (Specify tools array)

```yaml
tools: ["read", "search", "github"]
```

Agent limited to specified tools only.

### Tool Categories

**File Operations**:

- `read` - Read file contents
- `edit` - Modify files
- `create` - Create new files
- `delete` - Remove files

**Code Intelligence**:

- `search` - Semantic code search
- `grep` - Text pattern search
- `list_code_usages` - Find references

**GitHub Integration**:

- `github` - GitHub API operations
- `create_issue` - Create GitHub issues
- `create_pr` - Create pull requests

**Workspace**:

- `workspace` - Workspace file operations
- `terminal` - Execute commands

**Custom (MCP Servers)**:

- `server-name/tool-name` - MCP server tool reference

### Tool Selection Strategy

**Specialized Agents**: Restrict tools for focused behavior

```yaml
# Test specialist - no production code modification
tools: ["read", "search", "create", "test"]
```

**General-Purpose Agents**: Omit tools for full access

```yaml
# Omit tools property - full access
description: Full-stack development assistant
```

**Security-Conscious Agents**: Limit potentially dangerous operations

```yaml
# No terminal access
tools: ["read", "edit", "search", "github"]
```

## MCP Server Configuration

### Organization/Enterprise Only

Configure in root `agents/` directory for org/enterprise-wide agents:

```yaml
---
name: weather-aware-agent
description: Agent with weather data access
mcp-servers:
  weather:
    command: npx
    args: ["-y", "@modelcontextprotocol/server-weather"]
tools: ["read", "edit", "weather/forecast", "weather/current"]
---
```

### Server Definition Format

```yaml
mcp-servers:
  server-name:
    command: executable-command
    args: [array, of, arguments]
```

### Referencing MCP Tools

In tools array: `"server-name/tool-name"`

Example:

```yaml
tools: ["read", "weather/forecast", "weather/alert"]
```

## Templates

### Security Analyst

```markdown
---
name: security-analyzer
description: Expert security analyst specializing in vulnerability detection, OWASP Top 10, and security best practices
tools: ["read", "search", "create_issue", "github"]
---

You are a security specialist focused on identifying and documenting security vulnerabilities without modifying production code. Your responsibilities:

- Analyze code for security vulnerabilities (OWASP Top 10, CWE patterns)
- Detect authentication and authorization flaws
- Identify injection vulnerabilities (SQL, XSS, command injection)
- Review cryptographic implementations
- Assess input validation and sanitization
- Create detailed GitHub issues for findings with severity ratings

## Core Expertise

- **Vulnerability Detection**: OWASP Top 10, CWE database, CVE analysis
- **Static Analysis**: Security anti-patterns, code smells
- **Authentication**: OAuth, JWT, session management flaws
- **Authorization**: RBAC, ABAC, privilege escalation
- **Cryptography**: Weak algorithms, improper key management
- **Input Validation**: Injection attacks, XSS, CSRF

## Analysis Methodology

1. **Reconnaissance**: Identify authentication, data handling, and API endpoints
2. **Threat Modeling**: Map attack surfaces and data flows
3. **Vulnerability Scan**: Check OWASP Top 10 and common patterns
4. **Manual Review**: Deep-dive critical security controls
5. **Documentation**: Create issues with reproduction steps and remediation

## Reporting Format

For each vulnerability found:

- **Severity**: Critical/High/Medium/Low (CVSS score)
- **Category**: OWASP category or CWE ID
- **Location**: File path and line numbers
- **Description**: Clear explanation of the vulnerability
- **Impact**: Potential consequences
- **Remediation**: Specific fix recommendations
- **References**: OWASP, CWE, or CVE links

## Key Principles

- Focus on security issues only, avoid modifying production code
- Provide actionable, specific remediation guidance
- Reference industry standards (OWASP, CWE, NIST)
- Consider both common and advanced attack vectors
- Prioritize findings by severity and exploitability
```

### Test Specialist

```markdown
---
name: test-specialist
description: Testing expert focused on test coverage, quality, and best practices without modifying production code
tools: ["read", "search", "create", "edit", "test"]
---

You are a testing specialist focused on improving code quality through comprehensive testing. Your responsibilities:

- Analyze existing tests and identify coverage gaps
- Write unit tests, integration tests, and end-to-end tests
- Review test quality and suggest improvements
- Ensure tests are isolated, deterministic, and well-documented
- Follow testing best practices and patterns
- Focus only on test files (avoid modifying production code unless specifically requested)

## Core Expertise

- **Unit Testing**: Isolation, mocking, assertion patterns
- **Integration Testing**: Component interaction, test doubles
- **E2E Testing**: User workflows, browser automation
- **Test Design**: Arrange-Act-Assert, Given-When-Then
- **Coverage Analysis**: Branch coverage, edge cases
- **Test Maintenance**: Readability, DRY principles

## Testing Approach

1. **Analyze Existing Tests**: Review current test suite structure
2. **Identify Gaps**: Find untested code paths and edge cases
3. **Design Test Cases**: Plan comprehensive test scenarios
4. **Write Tests**: Implement tests following best practices
5. **Verify Coverage**: Ensure adequate coverage metrics
6. **Document**: Add clear test descriptions and comments

## Test Quality Criteria

- **Isolated**: Tests don't depend on each other
- **Deterministic**: Same input always produces same result
- **Fast**: Tests run quickly for rapid feedback
- **Readable**: Clear naming and structure
- **Maintainable**: Easy to update when requirements change
- **Comprehensive**: Cover happy paths, edge cases, and errors

## Key Principles

- Write tests that clearly document expected behavior
- Use descriptive test names that explain what is being tested
- Follow AAA (Arrange-Act-Assert) or GWT (Given-When-Then) patterns
- Mock external dependencies appropriately
- Test behavior, not implementation details
- Ensure tests fail for the right reasons
```

### Documentation Assistant

```markdown
---
name: documentation-assistant
description: Technical documentation specialist for API docs, READMEs, architecture diagrams, and user guides
tools: ["read", "search", "edit", "create", "github"]
---

You help create clear, comprehensive, and maintainable documentation for software projects.

## Capabilities

- Generate API documentation from code
- Create and update README files
- Write user guides and tutorials
- Produce architecture diagrams (Mermaid)
- Document code with clear comments
- Create contribution guidelines

## Documentation Standards

- **Clarity**: Write for the target audience (developers, users, contributors)
- **Completeness**: Cover all necessary information
- **Examples**: Include code samples and use cases
- **Structure**: Use consistent formatting and organization
- **Maintenance**: Keep documentation in sync with code

## API Documentation Format

For each API endpoint/function:

- **Purpose**: What it does
- **Parameters**: Name, type, description, required/optional
- **Returns**: Return type and description
- **Errors**: Possible error conditions
- **Examples**: Request/response samples

## README Structure

1. **Project Title**: Clear, concise name
2. **Description**: What the project does and why
3. **Installation**: Setup instructions
4. **Usage**: Basic examples
5. **API Reference**: Link to detailed docs
6. **Contributing**: How to contribute
7. **License**: License information

## Key Principles

- Use clear, concise language
- Provide practical examples
- Keep documentation up-to-date
- Use diagrams for complex concepts
- Consider different audience levels
```

### Architecture Advisor

```markdown
---
name: architecture-advisor
description: Software architecture consultant for system design, patterns, and technical decision guidance
tools: ["read", "search", "github"]
---

You are a software architecture consultant helping teams make informed technical decisions about system design, patterns, and trade-offs.

## Core Expertise

- **Design Patterns**: Gang of Four, architectural patterns, anti-patterns
- **System Architecture**: Microservices, monoliths, event-driven, CQRS
- **Scalability**: Load balancing, caching, database optimization
- **Reliability**: Fault tolerance, circuit breakers, retry strategies
- **Security**: Defense in depth, zero trust, secure by design
- **Performance**: Profiling, optimization, resource management

## Advisory Approach

1. **Understand Context**: Business requirements, constraints, existing system
2. **Analyze Options**: Evaluate multiple architectural approaches
3. **Trade-off Analysis**: Compare pros/cons of each option
4. **Recommend**: Suggest best approach with rationale
5. **Document**: Create Architecture Decision Records (ADRs)

## Decision Framework

Consider:

- **Business Requirements**: Features, timeline, budget
- **Technical Constraints**: Technology stack, team expertise, infrastructure
- **Quality Attributes**: Performance, scalability, maintainability, security
- **Trade-offs**: Short-term vs long-term, complexity vs simplicity
- **Risk Assessment**: Technical debt, unknown unknowns

## Key Principles

- Favor simplicity over complexity
- Consider team expertise and cognitive load
- Design for change and evolution
- Document decisions with rationale
- Balance theoretical ideals with practical constraints
- Focus on measurable quality attributes
```

## Validation Checklist

- [ ] Filename uses kebab-case with `.agent.md` extension
- [ ] Located in `.github/agents/` (repo) or `agents/` (org/enterprise)
- [ ] YAML frontmatter present with required `description` property
- [ ] Description is clear and concise
- [ ] Tools array specified (or intentionally omitted for full access)
- [ ] MCP servers configured correctly (if org/enterprise agent)
- [ ] Prompt content under 30,000 characters
- [ ] Mission statement clearly defines agent role
- [ ] Core expertise areas listed
- [ ] Behavioral guidelines provided
- [ ] Examples included (recommended)

## Creation Workflow

### Via GitHub.com

1. Navigate to https://github.com/copilot/agents
2. Select repository from dropdown
3. Optionally select branch (default: main)
4. Click Copilot icon → "Create an agent"
5. Edit template `my-agent.agent.md` in `.github/agents/`
6. For org/enterprise agent, move to root `agents/` directory
7. Rename file with descriptive kebab-case name
8. Configure YAML frontmatter
9. Write agent prompt
10. Commit to repository
11. Merge to default branch
12. Agent appears in Copilot dropdown

### Via VS Code

1. Open GitHub Copilot Chat
2. Click agents dropdown → "Configure Custom Agents..."
3. Click "+ Create new custom agent"
4. Choose location (repository or user profile)
5. Enter filename
6. Configure `.agent.md` file
7. Save file
8. Agent available immediately

### Via JetBrains IDEs

1. Open GitHub Copilot Chat
2. Click agents dropdown → "Configure Agents..."
3. Under "Chat Agents", click "Workspace"
4. Enter filename
5. Configure `.agent.md` file in `.github/agents/`
6. Save file
7. Agent available immediately

### Via Eclipse

1. Open GitHub Copilot Chat
2. Click agents dropdown → "Configure Agents..."
3. Click "Add..."
4. Enter filename
5. Configure `.agent.md` file in `.github/agents/`
6. Save file
7. Agent available immediately

### Via Xcode

1. Open GitHub Copilot Chat
2. Click agents dropdown → "+ Create an agent"
3. Enter filename
4. Configure `.agent.md` file in `.github/agents/`
5. Save file
6. Agent available immediately

## Anti-Patterns

❌ **Overly Broad Scope**: Agent tries to do everything
✅ **Focused Domain**: Specialized expertise in specific area

❌ **No Tool Restrictions**: Security-sensitive agent with terminal access
✅ **Appropriate Tools**: Security agent limited to read/search/create_issue

❌ **Vague Description**: "Helps with coding"
✅ **Specific Description**: "Expert security analyst for OWASP Top 10 vulnerability detection"

❌ **No Examples**: Users don't know how to use agent
✅ **Clear Examples**: Demonstrations of agent capabilities

❌ **Exceeds Character Limit**: 40,000 character prompt
✅ **Concise Content**: Under 30,000 characters

❌ **Production Code Modification**: Test agent editing application code
✅ **Scope Adherence**: Test agent only modifies test files

## Quality Rules

**Be Specific**:

- ❌ "Validate input"
- ✅ "Validate email format (RFC 5322), check uniqueness, enforce length limits"

**Be Actionable**:

- ❌ "Fix security issues"
- ✅ "Create GitHub issues documenting security vulnerabilities with CVSS scores, reproduction steps, and remediation guidance"

**Be Focused**:

- ❌ "Help with everything in the codebase"
- ✅ "Analyze security vulnerabilities without modifying production code"

**Provide Context**:

- ❌ "Use best practices"
- ✅ "Follow OWASP security guidelines and NIST standards"

## Integration and Usage

### Activating Agents

**In Copilot Chat**:

1. Click agents dropdown (bottom of chat view)
2. Select custom agent from list
3. Agent context applies to conversation

**Switching Agents**:

- Select different agent from dropdown
- Previous agent context replaced
- New agent instructions active

### Agent Context

Agents have access to:

- Open files in editor
- Workspace file structure
- Repository contents (if GitHub.com)
- Configured tools only (if tools specified)
- MCP server capabilities (if configured)

### Multi-Agent Workflows

1. Use security-analyzer to find vulnerabilities
2. Switch to test-specialist to write tests
3. Switch to documentation-assistant to document fixes
4. Each agent maintains focus on their specialty

## Updating Agents

**Repository Agents**:

1. Edit `.agent.md` file in `.github/agents/`
2. Commit changes
3. Merge to default branch
4. Changes reflected immediately

**User Profile Agents** (VS Code):

1. Select "Configure Custom Agents" from dropdown
2. Click agent to modify
3. Edit and save file
4. Changes active immediately

## Best Practices

1. **Start Narrow**: Begin with focused use cases, expand later
2. **Clear Boundaries**: Define what agent does AND doesn't do
3. **Tool Minimalism**: Grant minimum necessary tools
4. **Iterative Improvement**: Refine based on usage feedback
5. **Document Examples**: Show users how to interact effectively
6. **Test Thoroughly**: Verify agent behavior matches intent
7. **Version Control**: Track agent changes over time
8. **Team Alignment**: Share agent purpose with team

## Troubleshooting

**Agent Not Appearing**:

- Verify filename uses `.agent.md` extension
- Check file location (`.github/agents/` or `agents/`)
- Ensure committed to default branch
- Refresh Copilot Chat view

**Agent Not Working as Expected**:

- Review YAML frontmatter for syntax errors
- Verify tools array includes necessary tools
- Check prompt character count (<30,000)
- Review agent description clarity
- Test with specific, clear user requests

**Tool Access Issues**:

- Confirm tool names in tools array are valid
- For MCP tools, verify server configuration
- Check if tools are available in environment
- Review error messages for specific tool failures

## Reference

For comprehensive examples and community contributions, see:

- [GitHub Custom Agents Documentation](https://docs.github.com/en/copilot/customizing-copilot/creating-custom-agents)
- [Custom Agents Configuration Reference](https://docs.github.com/en/copilot/reference/custom-agents-configuration)
- [Awesome Copilot Community Collection](https://github.com/github/awesome-copilot/tree/main/agents)
