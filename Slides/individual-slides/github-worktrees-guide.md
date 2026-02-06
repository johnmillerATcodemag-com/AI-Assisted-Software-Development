---
ai_generated: true
model: "anthropic/claude-3.5-sonnet@2024-10-22"
operator: "johnmillerATcodemag-com"
chat_id: "github-worktrees-slides-20260206"
prompt: |
  create a marp slide deck how to use github worktrees
started: "2026-02-06T18:50:00Z"
ended: "2026-02-06T19:10:00Z"
task_durations:
  - task: "content planning and structure design"
    duration: "00:05:00"
  - task: "slide creation with comprehensive content"
    duration: "00:12:00"
  - task: "speaker notes and delivery guidance"
    duration: "00:03:00"
total_duration: "00:20:00"
ai_log: "ai-logs/2026/02/06/github-worktrees-slides-20260206/conversation.md"
source: "johnmillerATcodemag-com"
---

# GitHub Worktrees Mastery

### Parallel Development Made Simple

::: notes
Welcome to this comprehensive guide on GitHub worktrees! This presentation will teach you how to work with multiple branches simultaneously without the overhead of cloning repositories multiple times.

**Key delivery points:**

- This is a game-changer for developers who frequently switch between branches
- We'll cover practical use cases that will immediately improve your workflow
- Time allocation: 2-3 minutes for introduction

**Audience engagement:** "How many of you have ever wished you could test two branches side-by-side without committing or stashing changes?"

**Transition:** "Today, I'll show you how worktrees solve this exact problem elegantly..."
:::

---

## What Are Git Worktrees?

**Multiple working directories from the same repository**

- 🌳 **One repository, many checkouts**
- 📂 **Separate directories** for different branches
- ⚡ **No cloning overhead** - shared object database
- 🔄 **Independent working states** per branch
- 💾 **Shared Git metadata** (.git directory)

```bash
# Traditional approach:
git clone repo.git feature-branch-copy
cd feature-branch-copy
git checkout feature-branch

# Worktree approach:
git worktree add ../feature-branch feature-branch
```

::: notes
Git worktrees allow you to have multiple working directories attached to the same repository. This means you can have different branches checked out in different folders simultaneously.

**Key teaching points:**

- Emphasize the efficiency gain - no need for multiple repository clones
- Explain that all worktrees share the same .git database
- Show the command comparison to highlight simplicity

**Examples to mention:**

- Working on a feature while keeping main ready for hotfixes
- Comparing implementations across branches
- Running tests on one branch while developing on another

**Timing:** 4-5 minutes

**Transition:** "Let's explore why this is so powerful for development workflows..."
:::

---

## Why Use Worktrees?

### Solve Common Development Pain Points

**🚀 Parallel Development**

- Work on multiple features simultaneously
- Compare implementations side-by-side
- Test different approaches without switching

**⚡ Context Switching**

- No more `git stash` and `git checkout` dance
- Keep development environment intact
- Maintain running processes (servers, debuggers)

**🔧 Testing & CI**

- Run tests on different branches simultaneously
- Local integration testing
- Branch comparison and validation

::: notes
This slide addresses the fundamental "why" that will resonate with your audience's daily frustrations.

**Real-world scenarios to emphasize:**

1. **Parallel Development:** You're working on feature A, but urgent bug fix needed on main
2. **Context Switching:** No more losing your place when switching branches
3. **Testing:** Run tests on feature branch while continuing development
4. **Code Review:** Check out PR locally while keeping your work intact

**Interactive element:** Ask the audience, "Which of these scenarios happens to you most often?"

**Timing:** 3-4 minutes

**Personal anecdotes work well here** - share a specific situation where worktrees would have saved time.

**Transition:** "Now let's see how easy it is to get started with the essential commands..."
:::

---

## Essential Worktree Commands

### Core Operations You'll Use Daily

**Creating Worktrees:**

```bash
# Create new branch and worktree
git worktree add ../feature-login feature-login

# Use existing branch
git worktree add ../bugfix-auth origin/bugfix-auth

# Specify different branch name
git worktree add ../hotfix main
```

**Managing Worktrees:**

```bash
# List all worktrees
git worktree list

# Remove worktree
git worktree remove ../feature-login

# Cleanup stale references
git worktree prune
```

::: notes
These are the commands your audience will use 90% of the time. Focus on practical usage patterns.

**Demo approach:**

- Show `git worktree add` in action
- Demonstrate `git worktree list` output
- Explain the directory structure that gets created

**Key teaching points:**

- Explain the path convention (typically using `../` for parallel directories)
- Show both creating new branches and using existing ones
- Emphasize that the branch name and directory name can be different

**Common mistakes to address:**

- Don't create worktrees inside the main repository directory
- Use absolute or relative paths consistently

**Timing:** 5-6 minutes with live demonstration

**Transition:** "Let's see these commands in action with a real workflow example..."
:::

---

## Practical Workflow Example

### Real-World Development Scenario

```bash
# Current situation: Working on feature-auth branch
cd my-project/
git status  # Shows changes in progress

# Urgent: Bug report needs hotfix
git worktree add ../hotfix main
cd ../hotfix
git checkout -b hotfix-security-bug

# Fix the bug, test, commit
git add .
git commit -m "Fix: Security vulnerability in auth"
git push origin hotfix-security-bug

# Create PR, continue original work
cd ../my-project/
# Your feature-auth work is exactly as you left it!
```

**Result:** Two active development streams, zero context loss

::: notes
This is the "aha moment" slide where the value becomes crystal clear through a concrete example.

**Storytelling approach:**

- Set up a relatable scenario (feature work interrupted by urgent bug)
- Walk through each command with explanation
- Highlight the key benefit at the end

**If doing live demo:**

- Prepare the initial state beforehand
- Show the file contents remaining unchanged when switching directories
- Demonstrate that both directories are fully functional Git repositories

**Key points to emphasize:**

- No stashing or committing unfinished work
- No losing your place or mental context
- Full Git functionality in each worktree

**Audience interaction:** "How would you typically handle this situation without worktrees?"

**Timing:** 6-7 minutes

**Transition:** "This workflow can be optimized even further with some best practices..."
:::

---

## Best Practices & Directory Organization

### Set Yourself Up for Success

**📁 Directory Structure:**

```
my-projects/
├── main-repo/           # Main worktree
├── feature-auth/        # Feature worktree
├── hotfix-security/     # Hotfix worktree
└── experimental/        # Experimental worktree
```

**🎯 Naming Conventions:**

- Use descriptive directory names
- Match directory name to branch purpose
- Consider team conventions

**⚡ Pro Tips:**

- Keep worktrees at the same directory level
- Use shell aliases for common operations
- Set up IDE workspace configurations per worktree

::: notes
Best practices prevent common pitfalls and make worktrees a smooth part of daily workflow.

**Directory organization rationale:**

- Keeping worktrees at same level makes navigation easier
- Prevents nested worktree confusion
- Makes it easy to see all active work at a glance

**Naming convention benefits:**

- Quick recognition of what each worktree is for
- Easier navigation in terminal/file explorer
- Better organization when you have many worktrees

**Shell alias examples to mention:**

```bash
alias gwa='git worktree add'
alias gwl='git worktree list'
alias gwr='git worktree remove'
```

**IDE integration tips:**

- Most IDEs can have different project configurations per directory
- VS Code workspaces work great with worktrees
- Each worktree can have its own extensions/settings

**Timing:** 4-5 minutes

**Transition:** "Let's explore some specific use cases where worktrees really shine..."
:::

---

## Common Use Cases

### When Worktrees Shine Brightest

**🔄 Code Reviews & Testing**

```bash
# Check out PR for review while keeping your work
git worktree add ../review-pr-123 origin/pull/123/head
```

**🚧 Experimental Development**

```bash
# Try risky refactoring without affecting main work
git worktree add ../experiment-refactor main
```

**📊 Performance Comparison**

```bash
# Compare performance between implementations
git worktree add ../baseline main
git worktree add ../optimized feature-optimization
```

**🏗️ Multiple Release Preparations**

```bash
# Support multiple versions simultaneously
git worktree add ../v2-release release/v2.0
git worktree add ../v3-dev develop
```

::: notes
This slide provides specific, actionable use cases that developers can immediately apply.

**Use case deep-dive:**

**Code Reviews:**

- Pull down any PR branch for local testing
- Don't interrupt your current work
- Can run both implementations side-by-side

**Experimental Development:**

- Safe space for trying radical changes
- Easy to discard if experiment fails
- Can cherry-pick successful pieces back

**Performance Comparison:**

- Run benchmarks on different implementations
- A/B testing with real data
- Visual comparison of outputs

**Multiple Releases:**

- Support multiple product versions
- Backport fixes to older releases
- Different deployment pipelines per version

**Audience engagement:** "Which of these scenarios would be most valuable in your current projects?"

**Timing:** 5-6 minutes

**Transition:** "Let's do a quick hands-on exercise to cement these concepts..."
:::

---

## Hands-On Exercise

### Try It Yourself (5 minutes)

**🎯 Goal:** Create and manage multiple worktrees

**Step 1:** Create feature worktree

```bash
git worktree add ../my-feature feature-branch
cd ../my-feature
```

**Step 2:** Make some changes and commit

```bash
echo "Feature work" > feature.txt
git add . && git commit -m "Add feature work"
```

**Step 3:** Create review worktree without leaving

```bash
git worktree add ../code-review main
cd ../code-review
```

**Step 4:** See all your worktrees

```bash
git worktree list
```

::: notes
Hands-on practice is crucial for retention. This exercise covers the basic workflow.

**Facilitation approach:**

- Give people 5 minutes to work through this
- Walk around and help individuals if needed
- Ask people to raise hands when they complete each step

**Common issues to watch for:**

- People trying to create worktrees inside the current repo
- Forgetting to navigate to the new directory
- Not understanding that each directory is independent

**Extension exercise for fast finishers:**

- Switch between the directories and observe file differences
- Try making conflicting changes in both worktrees
- Experiment with `git worktree remove`

**Debrief questions:**

- "What surprised you about this exercise?"
- "How do you think this will change your workflow?"
- "What challenges or questions came up?"

**Timing:** 5-7 minutes (including debrief)

**Transition:** "Now let's troubleshoot some common issues you might encounter..."
:::

---

## Troubleshooting & Tips

### Common Issues and Solutions

**❌ "Branch is already checked out"**

```bash
# Problem: Branch exists in another worktree
git worktree list  # Find where it's checked out

# Solution: Remove old worktree or use different branch
git worktree remove ../old-location
```

**❌ Orphaned worktree references**

```bash
# Problem: Manually deleted worktree directory
git worktree list  # Shows [missing] worktrees

# Solution: Clean up references
git worktree prune
```

**💡 Performance Tips:**

- Don't create too many worktrees (< 10 typically)
- Clean up unused worktrees regularly
- Use `git worktree prune` in maintenance scripts

::: notes
Troubleshooting information helps prevent frustration and builds confidence.

**Key troubleshooting mindset:**

- Most worktree issues are about references, not the Git objects themselves
- `git worktree list` is your diagnostic tool
- `git worktree prune` fixes most cleanup issues

**Detailed explanations:**

**Branch Already Checked Out:**

- Git prevents the same branch in multiple worktrees (prevents conflicts)
- Always check `git worktree list` first
- Alternative: create new branch from existing one

**Orphaned References:**

- Happens when you manually delete worktree directories
- Git still thinks the worktree exists
- `prune` command cleans up these stale references

**Performance considerations:**

- Each worktree uses disk space (working directory)
- Too many can slow down some Git operations
- Regular cleanup is good practice

**Timing:** 4-5 minutes

**Transition:** "Let's wrap up with key takeaways and next steps..."
:::

---

## Key Takeaways

### Transform Your Git Workflow Today

**🎯 Core Benefits:**

- ✅ Parallel development without cloning
- ✅ Zero context switching overhead
- ✅ Safe experimentation and comparison
- ✅ Improved code review workflow

**🚀 Start Small:**

1. Try one worktree for your next feature branch
2. Use for urgent hotfixes when you have uncommitted work
3. Gradually incorporate into regular workflow

**📚 Next Steps:**

- Practice with your current project
- Set up shell aliases for common commands
- Configure your IDE for multi-worktree workflows

::: notes
This concluding slide reinforces key benefits and provides clear next steps for immediate action.

**Delivery approach:**

- Recap the main value propositions from the beginning
- Give people concrete, actionable first steps
- End with motivation for continued learning

**Reinforcement strategy:**

- Connect back to pain points mentioned at the beginning
- Emphasize that this is learnable and immediately beneficial
- Address that it's a gradual adoption, not all-or-nothing

**Call to action:**

- Encourage people to try worktrees on their very next branch
- Suggest they teach someone else (best way to solidify learning)
- Invite questions and sharing of experiences

**Follow-up suggestions:**

- Provide links to documentation
- Share your contact info for questions
- Suggest internal team adoption strategies

**Timing:** 3-4 minutes

**Questions and discussion:** Reserve 5-10 minutes for Q&A and sharing experiences.

**Closing note:** "Worktrees might seem like a small feature, but they represent a fundamental shift toward more efficient, context-preserving development workflows."
:::

---

## Resources & Questions

### Continue Your Learning Journey

**📖 Official Documentation:**

- [Git Worktree Manual](https://git-scm.com/docs/git-worktree)
- [Pro Git Book Chapter](https://git-scm.com/book)

**🛠️ Tools & Integration:**

- VS Code Multi-root Workspaces
- Shell aliases and scripts
- Team workflow templates

**💬 Questions & Discussion**

**Contact:** [Your contact information]

::: notes
Final slide for resources and Q&A session.

**Resource explanations:**

- Direct people to official documentation for deeper learning
- Mention specific tools that integrate well with worktrees
- Provide your contact for follow-up questions

**Q&A facilitation:**

- Open the floor for any questions about implementation
- Ask for specific use cases people want to discuss
- Share experiences from other teams who adopted worktrees

**Common questions to be prepared for:**

- "How does this work with IDEs?"
- "What about large repositories?"
- "Can this work with Git LFS?"
- "How does this affect CI/CD?"

**Timing:** 5-10 minutes

**Follow-up actions:**

- Consider recording answers to common questions
- Offer to help with initial implementation
- Plan follow-up sessions for advanced topics

**End on a positive note:** "You now have a powerful new tool for more efficient Git workflows. Start small, practice regularly, and you'll wonder how you worked without worktrees!"
:::
