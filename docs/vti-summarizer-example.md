# Example Usage: VTI Content Summarizer Prompt

## Invocation

To use the VTI content summarizer prompt in GitHub Copilot:

```
@summarize-vti-content vti_file="docs/sample-training.vti"
```

Or via parameter:

```
@summarize-vti-content
```

Then provide the file path when prompted: `docs/sample-training.vti`

## Expected Output Example

Based on the sample VTI file (`docs/sample-training.vti`), the prompt would generate:

---

### Document Overview
- **Title**: GitHub Copilot Custom Agents Training
- **Total Duration**: 45:00
- **Main Topics**: 5

### Detailed Outline

## Section 1: Introduction to Custom Agents (Duration: 8:30)
   ### Key Points
   - Custom agents extend GitHub Copilot with specialized behaviors
   - Agents can have specific tools and instructions
   - Available across multiple development environments
   - Task-specific optimization
   - Consistent behavior for specialized workflows
   
   ### What are Custom Agents?
   - Definition and purpose
   - Tool and instruction customization
   - Multi-environment support

## Section 2: Creating Your First Agent (Duration: 12:15)
   ### Key Points
   - File structure using .agent.md extension
   - YAML front matter configuration
   - Required fields: name, description, tools, model
   - Clear instructions and behavioral guidelines
   
   ### Subsection 2.1: File Structure (Duration: 4:00)
   - Extension requirements
   - Configuration format
   
   ### Subsection 2.2: Required Fields (Duration: 3:30)
   - Field specifications
   - Purpose of each field
   
   ### Subsection 2.3: Agent Body Content (Duration: 4:45)
   - Writing effective instructions
   - Defining roles and expertise

## Section 3: Configuring Agent Tools (Duration: 9:20)
   ### Key Points
   - Built-in tools: read, edit, search, github, terminal
   - Custom tool selection for security
   - Minimal permission principle
   
   ### Subsection 3.1: Built-in Tools (Duration: 4:10)
   - Available tool categories
   - Tool capabilities
   
   ### Subsection 3.2: Custom Tool Selection (Duration: 5:10)
   - Security considerations
   - Permission management

## Section 4: Advanced Features (Duration: 10:45)
   ### Key Points
   - Handoffs enable workflow transitions
   - Model Context Protocol (MCP) for external tools
   - Organization-level capabilities
   
   ### Subsection 4.1: Handoffs Between Agents (Duration: 5:25)
   - Workflow design
   - Multi-step processes
   
   ### Subsection 4.2: Model Context Protocol (Duration: 5:20)
   - MCP configuration
   - External integrations

## Section 5: Best Practices and Deployment (Duration: 4:10)
   ### Key Points
   - Design principles: single responsibility, clarity
   - Distribution options: repository, organization, user profile
   
   ### Subsection 5.1: Design Principles (Duration: 2:00)
   - Focus and clarity
   - Testing requirements
   
   ### Subsection 5.2: Distribution Options (Duration: 2:10)
   - Scope selection
   - Location choices

### Summary Statistics
- Total sections: 5
- Average section length: 9:00
- Longest section: Section 4 (Advanced Features) - 10:45
- Shortest section: Section 5 (Best Practices and Deployment) - 4:10

---

## Notes

The prompt is designed to:
1. Parse various VTI/transcript formats
2. Extract hierarchical section structure
3. Identify and preserve duration information
4. Generate a scannable outline format
5. Provide statistical summary

This makes it easy to quickly understand the content and time allocation of training materials or video transcripts.
