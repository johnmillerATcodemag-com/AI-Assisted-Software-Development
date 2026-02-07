# Welcome to the AIASD Toolkit Setup!

Hey there, future AI assisted software developer!

You're about to set up an the tools that will install the tools you'll need for the AI-Assisted Software Development environment. This guide will walk you through installing everything you need.

## What You're Building

By the end of this guide, you'll have a complete AI-assisted software development environment that includes:

**Essential Tools**

- **Git** - The version control system that many developers use to manage code changes and collaborate with others
- **GitHub Account** - Your online code repository and portfolio
- **GitHub CLI** - Command-line for working with GitHub without a browser
- **Visual Studio Code** - A powerful, free code editor with tons of features and extensions
- **GitHub Copilot Extension** - AI pair programmer that helps you write code faster and learn as you go
- **GitHub Copilot CLI** - AI help right in your terminal
- **Mob.sh** - Tool for seamless team coding sessions

**Bonus Tools** (Install these later if you need them):
- **Pandoc** - Converts documents between different formats (Markdown → PDF, etc.)
- **Marp** - Creates presentations from Markdown files

## Your Journey Ahead

**Time Investment**: About 30-45 minutes for the essential tools
**Difficulty**: Beginner
**Dependencies**: Tools are ordered so each one builds on the previous ones

---

## Before We Start: Important Notes

### For Windows Users
You'll see several installation options for most tools. Here's what they mean:
- **Direct Download**: Download and run an installer (easiest for beginners)
- **Chocolatey**: A package manager that lets you install software via commands (super convenient once set up)
- **Winget**: Microsoft's built-in package manager (comes with Windows 10/11)

### For Mac Users
- **Homebrew**: The most popular package manager for Mac (like an app store for developers)
- **Direct Download**: Traditional installer files

### Pro Tips
- Install tools in the exact order listed - they depend on each other!
- Restart your terminal/command prompt after each installation
- When in doubt, choose the "recommended" option for your platform

---

## 1. Git
### Why do you need it?
The primary reason is to share files and collaborate with others. We'll a lot time working together on code and Git is the foundation this collaboration is built on.

### Official Resources
- Download: [https://git-scm.com/downloads](https://git-scm.com/downloads)
- Learn Git: [https://learngitbranching.js.org/](https://learngitbranching.js.org/) (interactive tutorial - highly recommended!)
- Documentation: [https://git-scm.com/doc](https://git-scm.com/doc)

---

### Windows Installation

**Option A — Direct Download** (Recommended for beginners)

1. Go to [https://git-scm.com/download/win](https://git-scm.com/download/win)
2. The download should start automatically (it detects your Windows version)
3. Run the downloaded installer
4. **Important setup choices** (don't just click "Next" everywhere!):
   - ✅ Check "Git Bash Here" - this adds a right-click option to open Git terminal
   - ✅ Check "Git GUI Here" - visual interface if you want it
   - **Default editor**: Choose Visual Studio Code (we'll install it next!)
   - **PATH environment**: Choose "Git from the command line and also from 3rd-party software"
   - **Line ending conversions**: Choose "Checkout Windows-style, commit Unix-style line endings"

**Option B — Using Chocolatey**

First, you need Chocolatey (a package manager):
- What is Chocolatey: [https://chocolatey.org/](https://chocolatey.org/)
- Installation guide: [https://chocolatey.org/install](https://chocolatey.org/install)

```powershell
# Run in PowerShell or CMD as Administrator
choco install git
```

**Option C — Using Winget** (Built into Windows 10/11)

```powershell
# Run in PowerShell or Command Prompt
winget install --id Git.Git
```

### macOS Installation

**Option A — Using Homebrew** (Recommended)

First, install Homebrew if you haven't already:
- What is Homebrew: [https://brew.sh/](https://brew.sh/)
- Installation: [https://docs.brew.sh/Installation](https://docs.brew.sh/Installation)

```bash
# Open Terminal and run:
brew install git
```

**Option B — Direct Download**

1. Visit [https://git-scm.com/download/mac](https://git-scm.com/download/mac)
2. Download the installer for your macOS version
3. Run the installer and follow the prompts

### Test Your Installation

Open a new terminal/command prompt and type:

```bash
git --version
```

You should see something like `git version 2.41.0`. The exact numbers don't matter - you just want to see it's installed!

### Troubleshooting

**"Command not found"**:
- Restart your terminal completely
- On Windows, try Git Bash instead of Command Prompt
- Check if the installation actually completed

**Permission errors on Mac**:
- You might need to install Xcode Command Line Tools: `xcode-select --install`

---

## 2. Create Your GitHub Account

### Why GitHub?
In the course we'll use GitHub for Issues and Pull Requests, in addition to GitHub's Copilot features.

### Official Resources
- Sign up: [https://github.com/signup](https://github.com/signup)
- Learning resources: [https://docs.github.com/en/get-started](https://docs.github.com/en/get-started)
- GitHub Skills: [https://skills.github.com/](https://skills.github.com/) (interactive learning)

---

### Step-by-Step Account Creation

1. **Go to GitHub**: [https://github.com/signup](https://github.com/signup)

2. **Enter your email**: You'll get important notifications here

3. **Create a strong password**:
   - Mix of letters, numbers, and symbols
   - At least 8 characters long

4. **Choose your username**:
   - This becomes part of your developer identity
   - Use your real name or a professional handle (avoid nicknames)

5. **Complete verification**: GitHub will test if you're human (not a robot)

6. **Email preferences**: Choose if you want product updates (you can change this later)

7. **Verify your email**: Check your inbox and click the verification link

8. **You're in!** Sign in at [https://github.com/login](https://github.com/login)

### Next Steps (Optional but recommended)

- **Add a profile picture**: Makes you look more professional
- **Fill out your bio**: Write a sentence about what you're learning
- **Set up two-factor authentication**: Keeps your account secure
- **Star some repositories**: Bookmark projects you find interesting

---

## 3. GitHub CLI - Terminal Superpowers

### Why the GitHub CLI?
The GitHub CLI (Command Line Interface) lets you do GitHub things right from your terminal without opening a web browser. We'll use to to automate the creation of issues and PRs.

### Official Resources
- Download: [https://cli.github.com/](https://cli.github.com/)
- Documentation: [https://cli.github.com/manual/](https://cli.github.com/manual/)
- Quick start: [https://docs.github.com/en/github-cli/github-cli/quickstart](https://docs.github.com/en/github-cli/github-cli/quickstart)

---

### Windows Installation

**Option A — Direct Download** (Recommended for beginners)

1. Visit [https://github.com/cli/cli/releases/latest](https://github.com/cli/cli/releases/latest)
2. Look for the file ending in `.msi` (Windows Installer)
3. Download and run it
4. Follow the setup wizard (default options are fine)

**Option B — Using Chocolatey**

```powershell
# Run in PowerShell as Administrator
choco install gh
```

**Option C — Using Winget**

```powershell
# Run in PowerShell or Command Prompt
winget install --id GitHub.cli
```

### macOS Installation

**Option A — Using Homebrew** (Recommended)

```bash
# Open Terminal and run:
brew install gh
```

**Option B — Direct Download**

1. Visit [https://cli.github.com/](https://cli.github.com/)
2. Download the macOS installer
3. Run the installer and follow prompts

### Test Your Installation

```bash
gh --version
```

You should see version information for GitHub CLI.

### Authenticate with GitHub

After installation, you need to connect it to your GitHub account:

```bash
gh auth login
```

Follow the prompts:
- Choose "GitHub.com"
- Choose "HTTPS" for Git protocol
- Authenticate via web browser (easiest)
- Give it a descriptive name like "My Development Machine"

### Try Your First Command

```bash
# Create a new repository (you'll be prompted for details)
gh repo create my-first-repo --public

# Or view your repositories
gh repo list
```

### Troubleshooting

**Authentication fails**:
- Make sure you're logged into GitHub in your browser
- Try `gh auth logout` then `gh auth login` again

**Command not found**:
- Restart your terminal
- Check that installation completed successfully

---

## 4. Visual Studio Code

### Why Visual Studio Code?
Visual Studio Code is where we will live for most of the course.

### Official Resources
- Download: [https://code.visualstudio.com/](https://code.visualstudio.com/)
- Getting started: [https://code.visualstudio.com/docs](https://code.visualstudio.com/docs)
- Tips and tricks: [https://code.visualstudio.com/docs/getstarted/tips-and-tricks](https://code.visualstudio.com/docs/getstarted/tips-and-tricks)

---

### Windows Installation

**Direct Download** (Recommended)

1. Visit [https://code.visualstudio.com/](https://code.visualstudio.com/)
2. Click "Download for Windows"
3. Run the downloaded installer
4. **Important setup choices**:
   - ✅ Check "Add 'Open with Code' action to Windows Explorer file context menu"
   - ✅ Check "Add 'Open with Code' action to Windows Explorer directory context menu"
   - ✅ Check "Register Code as an editor for supported file types"
   - ✅ Check "Add to PATH" (enables `code` command in terminal)

**Using Package Managers**:

```powershell
# Chocolatey
choco install vscode

# Winget
winget install -e --id Microsoft.VisualStudioCode
```

### macOS Installation

**Direct Download** (Recommended)

1. Visit [https://code.visualstudio.com/](https://code.visualstudio.com/)
2. Click "Download for Mac"
3. Open the downloaded ZIP file
4. Drag "Visual Studio Code.app" to your Applications folder
5. **Enable command line**:
   - Open VS Code
   - Press `Cmd+Shift+P` to open Command Palette
   - Type "Shell Command: Install 'code' command in PATH"
   - Select it and press Enter

**Using Homebrew**:

```bash
brew install --cask visual-studio-code
```

### Verification

1. Open VS Code from your applications
2. Open a terminal and run:
   ```bash
   code --version
   ```
3. You should see version information

### Essential First Steps

Once VS Code is installed:

1. **Install essential extensions** (we'll do this automatically with Copilot next)
2. **Explore the interface**:
   - Activity Bar (left side) - switch between views
   - Side Bar - file explorer, search, etc.
   - Editor Group - where your code goes
   - Panel (bottom) - terminal, problems, output
   - Status Bar (very bottom) - file info, git branch, etc.

3. **Learn key shortcuts**:
   - `Ctrl+Shift+P` (Windows) or `Cmd+Shift+P` (Mac) - Command Palette (your best friend!)
   - `Ctrl+`` (Windows) or `Cmd+`` (Mac) - Toggle integrated terminal
   - `Ctrl+P` (Windows) or `Cmd+P` (Mac) - Quick file open

### Useful Keybinding

This keybinding opens markdown files in a side-by-side preview and copies the editor to a new window for easier review:

```json
  {
    "key": "ctrl+shift+alt+x",
    "command": "extension.multiCommand.execute",
    "args": {
      "sequence": ["markdown.showPreviewToSide", "workbench.action.copyEditorToNewWindow"]
    },
    "when": "editorLangId == mdc"
  }
```
This requires the `multiCommand` extension and is configured to trigger when editing Marp markdown files (`.mdc`).

---

## 5. GitHub Copilot Extension

### Why do you need it?
Copilot is the interface between you and the power of AI in your coding workflow. It helps you write code faster, learn new languages, and get unstuck when you're facing a problem. It's like having an expert programmer sitting next to you, ready to help at any moment.

Copilot helps by:
- **Writing code for you** - describe what you want, and it writes it
- **Completing your thoughts** - start typing and it finishes the code
- **Explaining code** - ask it to explain any code you don't understand
- **Debugging help** - it can spot and fix common errors
- **Learning accelerator** - see how an expert would solve problems

⚠️ **Note**: GitHub Copilot is free for students and open source contributors, but requires a subscription for most users. There's a free trial available!

### 🔗 Official Resources
- Information: [https://github.com/features/copilot](https://github.com/features/copilot)
- Pricing: [https://github.com/features/copilot#pricing](https://github.com/features/copilot#pricing)
- Getting started: [https://docs.github.com/en/copilot/quickstart](https://docs.github.com/en/copilot/quickstart)
- Student benefits: [https://education.github.com/](https://education.github.com/) (free Copilot!)

---

### 💳 Get GitHub Copilot Access

**For Students**:
1. Verify your student status at [https://education.github.com/](https://education.github.com/)
2. Apply for GitHub Student Developer Pack
3. Once approved, Copilot is included free!

**For Everyone Else**:
1. Go to [https://github.com/features/copilot](https://github.com/features/copilot)
2. Click "Start free trial"
3. Enter payment details (won't be charged during trial)
4. You get 30 days free, then it's $10/month

### Windows Installation

1. **Open VS Code** (make sure it's running)

2. **Open Extensions view**:
   - Click the Extensions icon in the Activity Bar (left side)
   - Or press `Ctrl+Shift+X`

3. **Search for GitHub Copilot**:
   - Type "GitHub Copilot" in the search box
   - Look for the official one by "GitHub" (should be the first result)

4. **Install the extension**:
   - Click "Install" button
   - It might install additional recommended extensions (that's good!)

5. **Sign in to GitHub**:
   - You'll see a sign-in prompt
   - Click "Sign in to GitHub"
   - Authorize VS Code to access your GitHub account

### macOS Installation

1. **Open VS Code**

2. **Open Extensions view**:
   - Press `Cmd+Shift+X`
   - Or click the Extensions icon in the Activity Bar

3. **Search and install**:
   - Search for "GitHub Copilot"
   - Click "Install" on the official GitHub Copilot extension

4. **Authenticate**:
   - Follow the prompts to sign in to GitHub
   - Authorize the connection

### Verification

1. **Create a new file**: Make a new file with a programming language extension (like `test.js` or `test.py`)

2. **Try a simple prompt**:
   ```javascript
   // Function to calculate the area of a circle
   ```

3. **Watch the magic**: Copilot should suggest code! Press `Tab` to accept suggestions.

### Learning to Use Copilot

**Best Practices**:
- **Write descriptive comments** - Copilot reads them and generates relevant code
- **Start with function signatures** - define what you want, let Copilot fill it in
- **Use natural language** - describe what you want in plain English
- **Review suggestions** - Copilot is smart but not perfect, always double-check code

**Common Shortcuts**:
- `Tab` - Accept current suggestion
- `Alt+]` (Windows) or `Opt+]` (Mac) - Next suggestion
- `Alt+[` (Windows) or `Opt+[` (Mac) - Previous suggestion
- `Esc` - Dismiss suggestions

### Troubleshooting

**Not seeing suggestions**:
- Check that you're signed into GitHub
- Make sure your Copilot subscription is active
- Try reloading VS Code (`Ctrl+R` or `Cmd+R`)

**Suggestions are poor quality**:
- Write more descriptive comments
- Provide more context in your code
- Try typing a bit more before expecting suggestions

---

## 6. GitHub Copilot CLI

### Why the GitHub Copilot CLI?
In the course we use the GH CLI to automate AI operations.

Copilot CLI helps with:
- **Complex git commands** - no more googling git syntax
- **System administration** - file operations, permissions, etc.
- **Tool usage** - command syntax for any CLI tool
- **Script generation** - create bash/PowerShell scripts with AI help

### Official Resources
- Documentation: [https://docs.github.com/en/copilot/github-copilot-in-the-cli](https://docs.github.com/en/copilot/github-copilot-in-the-cli)
- Installation guide: [https://docs.github.com/en/copilot/github-copilot-in-the-cli/installing-github-copilot-in-the-cli](https://docs.github.com/en/copilot/github-copilot-in-the-cli/installing-github-copilot-in-the-cli)

---

### ⚙️ Installation (All Platforms)

**Prerequisites**:
- GitHub CLI (installed in step 3) ✅
- Active GitHub Copilot subscription ✅

**Install the extension**:

```bash
# This works on Windows, Mac, and Linux
gh extension install github/gh-copilot
```

### Authentication

If you haven't already authenticated GitHub CLI:

```bash
gh auth login
```

### Verification

```bash
# Ask for help with a git command
gh copilot suggest "undo my last commit"

# Ask for explanations
gh copilot explain "git rebase -i HEAD~3"
```

### How to Use Copilot CLI

**Two main commands**:

1. **`gh copilot suggest`** - Get command suggestions
   ```bash,
   gh copilot suggest "create a new git branch"
   gh copilot suggest "find all JavaScript files modified in last week"
   gh copilot suggest "compress a folder into a zip file"
   ```

2. **`gh copilot explain`** - Explain existing commands
   ```bash
   gh copilot explain "git cherry-pick HEAD~2"
   gh copilot explain "docker run -it --rm ubuntu"
   ```

**Pro Tips**:
- Use natural language - describe what you want to accomplish
- Be specific about your operating system if commands differ
- Review suggestions before running them (especially destructive operations!)

---

## 7. Mob.sh - Team Coding Made Simple

### Why Mob.sh?
Mob.sh makes pair programming and team coding sessions incredibly smooth. Instead of awkward screen sharing and "can you type this for me", mob.sh lets team members seamlessly hand off code changes to each other using git. It's perfect for code reviews, pair programming, and team problem-solving.

Mob.sh enables:
- **Smooth handoffs** - pass code back and forth effortlessly
- **Multiple contributors** - whole team can contribute to one session
- **No merge conflicts** - automatically handles the git complexity
- **Natural breaks** - built-in timer and break reminders

### Official Resources
- Website: [https://mob.sh/](https://mob.sh/)
- Documentation: [https://github.com/remotemobprogramming/mob](https://github.com/remotemobprogramming/mob)
- Video introduction: [https://www.youtube.com/watch?v=SHOVVnRB4h0](https://www.youtube.com/watch?v=SHOVVnRB4h0)

---

### Windows Installation

**Prerequisite**: Git (installed in step 1)

Mob.sh needs a POSIX-compatible shell, so you have several options:

**Option A — Using Chocolatey** (Easiest)

```powershell
# Run in PowerShell as Administrator
choco install mob
```

**Option B — Using Git Bash** (Comes with Git)

1. Open **Git Bash** (right-click in a folder and select "Git Bash Here")
2. Install via curl:
   ```bash
   curl -s https://mob.sh/install.sh | sh
   ```
3. Verify it worked:
   ```bash
   mob version
   ```

**Option C — Using WSL** (Windows Subsystem for Linux)

If you want to use Linux tools on Windows:

1. **Install WSL**:
   - Learn more: [https://learn.microsoft.com/en-us/windows/wsl/](https://learn.microsoft.com/en-us/windows/wsl/)
   - Installation guide: [https://learn.microsoft.com/en-us/windows/wsl/install](https://learn.microsoft.com/en-us/windows/wsl/install)

   ```powershell
   # Run in PowerShell as Administrator
   wsl --install
   ```
   (You'll need to restart your computer)

2. **Inside WSL, install mob**:
   ```bash
   curl -s https://mob.sh/install.sh | sh
   ```

### macOS Installation

**Using Homebrew** (Recommended):

```bash
brew install mob
```

**Verify installation**:
```bash
mob version
```

### Verification

```bash
# Check that mob is working
mob version

# Get help (shows available commands)
mob help
```

### How to Use Mob.sh

**Basic workflow** (simplified):

1. **Start a mob session** (one person):
   ```bash
   mob start
   ```

2. **Work on code together**

3. **Hand off to next person**:
   ```bash
   mob next
   ```

4. **Other person takes over**:
   ```bash
   mob start
   ```

5. **When session is complete**:
   ```bash
   mob done
   ```

**Pro Tips**:
- Everyone on the team needs mob.sh installed
- Work in feature branches, not main branch
- Set a timer for regular handoffs (mob.sh can do this automatically)
- Use `mob status` to see current session info

### Troubleshooting

**"Command not found" on Windows**:
- Make sure you're using Git Bash or WSL, not regular Command Prompt
- Try restarting your terminal after installation

**Permission issues**:
- On Mac: You might need to run `chmod +x $(which mob)` after installation
- On Windows: Make sure you're running installation commands as Administrator

---

## Optional Tools

These tools are not used in the course, but were helpful in preparing the course. You might find them useful.

---

## 8. Pandoc (CLI Command) [OPTIONAL]

### What is Pandoc?
Pandoc is a powerful command-line tool that converts documents between different formats. Think of it as a universal translator for text files - it can convert Markdown to PDF, Word to HTML, reStructuredText to LaTeX, and hundreds of other combinations.

**When you might need it**:
- Converting documentation to different formats
- Generating PDF reports from Markdown
- Converting between markup languages
- Academic writing with complex formatting needs

**You probably don't need it if**:
- You're just starting out programming
- You don't work with documentation much
- Your editor already handles your format conversion needs

### Official Resources
- Website: [https://pandoc.org/](https://pandoc.org/)
- Installation guide: [https://pandoc.org/installing.html](https://pandoc.org/installing.html)
- Documentation: [https://pandoc.org/MANUAL.html](https://pandoc.org/MANUAL.html)
- Try it online: [https://pandoc.org/try/](https://pandoc.org/try/)

---

### Windows Installation

**Option A — Direct Download** (Recommended)

1. Visit [https://github.com/jgm/pandoc/releases/latest](https://github.com/jgm/pandoc/releases/latest)
2. Look for the Windows installer (`.msi` file)
3. Download and run it
4. Follow the installation wizard (defaults are fine)

**Option B — Using Chocolatey**

```powershell
choco install pandoc
```

**Option C — Using Winget**

```powershell
winget install --id JohnMacFarlane.Pandoc
```

### macOS Installation

**Option A — Using Homebrew** (Recommended)

```bash
brew install pandoc
```

**Option B — Direct Download**

1. Visit [https://github.com/jgm/pandoc/releases/latest](https://github.com/jgm/pandoc/releases/latest)
2. Download the macOS package (`.pkg` file)
3. Run the installer

### Verification

```bash
pandoc --version
```

### Basic Usage Examples

```bash
# Convert Markdown to HTML
pandoc README.md -o README.html

# Convert Markdown to PDF (requires LaTeX)
pandoc document.md -o document.pdf

# Convert with table of contents
pandoc document.md --toc -o document.html

# Use project-specific settings (if this repository has them)
pandoc --defaults=slides-to-pptx input.md -o output.pptx
```

**Learning Resources**:
- [Pandoc User's Guide](https://pandoc.org/MANUAL.html)
- [Common use cases](https://pandoc.org/demos.html)

---

## 9. Marp CLI (Markdown Variant) [OPTIONAL]

### What is Marp CLI?
Marp CLI is a tool for creating beautiful presentations from Markdown files. Instead of wrestling with PowerPoint or Google Slides, you write your presentation content in simple Markdown and Marp converts it to beautiful HTML, PDF, or PowerPoint slides.

**When you might need it**:
- Creating technical presentations for work
- Academic presentations with code samples
- Quick slide decks from existing documentation
- Presentations that need to be version controlled

**You probably don't need it if**:
- You don't give presentations
- You're happy with traditional presentation tools
- You're just starting your programming journey

### Official Resources
- Main website: [https://marp.app/](https://marp.app/)
- CLI documentation: [https://github.com/marp-team/marp-cli](https://github.com/marp-team/marp-cli)
- Marpit framework: [https://marpit.marp.app/](https://marpit.marp.app/) (the engine behind Marp)
- Live editor: [https://web.marp.app/](https://web.marp.app/) (try before installing)

---

### Prerequisites

**Node.js is required** for Marp CLI:
- Download: [https://nodejs.org/en/download/](https://nodejs.org/en/download/)
- Choose the LTS (Long Term Support) version
- npm (Node Package Manager) comes bundled with Node.js

### Windows Installation

**Step 1: Install Node.js**

**Option A — Direct Download** (Recommended)
1. Go to [https://nodejs.org/en/download/](https://nodejs.org/en/download/)
2. Download the Windows Installer (.msi)
3. Run the installer (defaults are fine)
4. Restart your terminal

**Option B — Using Chocolatey**
```powershell
choco install nodejs
```

**Option C — Using Winget**
```powershell
winget install --id OpenJS.NodeJS
```

**Step 2: Install Marp CLI**

```bash
# Works in Command Prompt, PowerShell, or Git Bash
npm install -g @marp-team/marp-cli
```

### macOS Installation

**Step 1: Install Node.js**

**Option A — Using Homebrew** (Recommended)
```bash
brew install node
```

**Option B — Direct Download**
1. Visit [https://nodejs.org/en/download/](https://nodejs.org/en/download/)
2. Download the macOS installer (.pkg)
3. Run the installer

**Step 2: Install Marp CLI**

```bash
npm install -g @marp-team/marp-cli
```

### Verification

```bash
# Check Marp version
marp --version

# Check Node.js version
node --version

# Check npm version
npm --version
```

### Basic Usage Examples

**Create a simple presentation**:

1. Create a file called `slides.md`:
   ```markdown
   ---
   marp: true
   theme: default
   ---

   # My First Presentation

   Welcome to Marp!

   ---

   # Slide Two

   - Bullet point one
   - Bullet point two
   - Code works too:

   ```python
   print("Hello, World!")
   ```

   ---

   # The End

   Questions?
   ```

2. Convert to HTML:
   ```bash
   marp slides.md
   ```

3. Convert to PDF:
   ```bash
   marp slides.md --pdf
   ```

4. Convert to PowerPoint:
   ```bash
   marp slides.md --pptx
   ```

5. Watch for changes while editing:
   ```bash
   marp slides.md --watch
   ```

**Learning Resources**:
- [Marp for VS Code extension](https://marketplace.visualstudio.com/items?itemName=marp-team.marp-vscode) (live preview)
- [Marpit Markdown syntax](https://marpit.marp.app/markdown)
- [Built-in themes](https://github.com/marp-team/marp-core/tree/main/themes)

### Troubleshooting

**npm command not found**:
- Make sure Node.js installed properly
- Restart your terminal completely
- Check that Node.js is in your PATH

**Permission errors (Mac/Linux)**:
- You might need to use `sudo`: `sudo npm install -g @marp-team/marp-cli`
- Or configure npm to use a different directory (recommended): [npm docs](https://docs.npmjs.com/resolving-eacces-permissions-errors-when-installing-packages-globally)

**Marp command not found after installation**:
- Make sure the global npm bin directory is in your PATH
- Try `npx @marp-team/marp-cli` instead of `marp`

---
