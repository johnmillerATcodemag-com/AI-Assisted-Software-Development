---
marp: true
ai_generated: true
model: "anthropic/claude-sonnet-4.5@2026-03-20"
operator: "johnmillerATcodemag-com"
chat_id: "merge-marp-decks-aiasd-311-monday-20260320"
prompt: |
  Create individual Marp slide deck for Code Explanation and Analysis as part of AIASD 311 Monday session
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
