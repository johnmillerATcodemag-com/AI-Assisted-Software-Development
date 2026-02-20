# Welcome to the AIASD Toolkit Setup!

Hey there, future AI-assisted software developer!

You are about to set up the tools that will install everything you'll need for the AI-Assisted Software Development environment. This guide will walk you through installing everything.

## What You're Building

By the end of this guide, you'll have a complete AI-assisted software development environment that includes:

## Essential Tools

- **Git** - The version control system that many developers use to manage code changes and collaborate with others
- **GitHub Account** - Your online code repository and portfolio
- **GitHub CLI** - Command-line for working with GitHub without a browser
- **Visual Studio Code** - A powerful, free code editor with tons of features and extensions

## VS Code Extensions

- **GitHub Copilot Chat Extension** - AI chat features powered by Copilot
- **Mermaid Preview** - Mermaid diagram previewer for Visual Studio Code
- **multi-command** - Used for a multi-step keybinding to preview markdown and open in a new window.

## Your Journey Ahead

**Time Investment**: About 30-45 minutes for the essential tools
**Difficulty**: Beginner
**Dependencies**: Tools are installed in order so each one builds on the previous ones

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

## 1. Git

### Why do you need it?

The primary reason is to share files and collaborate with others. We'll spend a lot of time working together on code, and Git is the foundation that this collaboration is built on.

### Official Resources

- Download: [https://git-scm.com/downloads](https://git-scm.com/downloads)
- Learn Git: [https://learngitbranching.js.org/](https://learngitbranching.js.org/) (interactive tutorial - highly recommended!)
- Documentation: [https://git-scm.com/doc](https://git-scm.com/doc)


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

**Option C — Using Winget** (Built into Windows 10/11)

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

The GitHub CLI (Command Line Interface) lets you do GitHub things right from your terminal without opening a web browser. We'll use it to automate the creation of issues and PRs.

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
   - ``Ctrl+` `` (Windows) or ``Cmd+` `` (Mac) - Toggle integrated terminal
   - `Ctrl+P` (Windows) or `Cmd+P` (Mac) - Quick file open

### Useful Key binding

This key binding opens markdown files in a side-by-side preview and copies the editor to a new window for easier review. Add this to your `keybindings.json` file:

```json
{
  "key": "ctrl+shift+alt+x",
  "command": "extension.multiCommand.execute",
  "args": {
    "sequence": [
      "markdown.showPreviewToSide",
      "workbench.action.copyEditorToNewWindow"
    ]
  },
  "when": "editorLangId == markdown || resourceExtname == .mdc"
}
```

**To add this key binding**:

1. Open VS Code
2. Press `Ctrl+K Ctrl+S` (Windows/Linux) or `Cmd+K Cmd+S` (Mac) to open Key bindings
3. Click the "Open Keybindings (JSON)" icon in the top right
4. Add the above object to the array in `keybindings.json`

This requires the `multiCommand` extension and triggers when editing Markdown files (`editorLangId == markdown`) or files with the `.mdc` extension (Marp markdown files).

---

## 5. GitHub Copilot Extension

### Why do you need it?

Copilot is the interface between you and the power of AI in your coding workflow. It helps you write code faster, learn new languages, and get unstuck when you're facing a problem. It's like having an expert programmer sitting next to you, ready to help at any moment.

Copilot helps by:

- **Writing code for you** - describe what you want, and it writes it
- **Completing your thoughts** - start typing and Copilot finishes the code
- **Explaining code** - ask it to explain any code you don't understand
- **Debugging help** - it can spot and fix common errors
- **Learning accelerator** - see how an expert would solve problems

**Note**: GitHub Copilot is free for students and open-source contributors but requires a subscription for most users. There's a free trial available!

### Why Visual Studio Code?
Visual Studio Code is where we will live for most of the course.

- Information: [https://github.com/features/copilot](https://github.com/features/copilot)
- Pricing: [https://github.com/features/copilot#pricing](https://github.com/features/copilot#pricing)
- Getting started: [https://docs.github.com/en/copilot/quickstart](https://docs.github.com/en/copilot/quickstart)
- Student benefits: [https://education.github.com/](https://education.github.com/) (free Copilot!)

---

### Get GitHub Copilot Access

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

In the course we use GH CLI to automate AI operations.

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
   gh copilot suggest "find all JavaScript files modified in the last week"
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

## Mermaid Preview Extension

### Why Mermaid Preview?

Mermaid is a powerful tool for creating diagrams and visualizations using simple text syntax. The Mermaid Preview extension allows you to see these diagrams rendered directly in Visual Studio Code, making it easier to visualize complex concepts and workflows without leaving your code editor.

### Official Resources

- Extension: [https://marketplace.visualstudio.com/items?itemName=vstirbu.vscode-mermaid-preview](https://marketplace.visualstudio.com/items?itemName=vstirbu.vscode-mermaid-preview)
- Mermaid documentation: [https://mermaid-js.github.io/mermaid/#/](https://mermaid-js.github.io/mermaid/#/)

### Installation

1. Open Visual Studio Code
2. Go to the Extensions view (`Ctrl+Shift+X` or `Cmd+Shift+X`)
3. Search for "Mermaid Preview"
4. Click "Install"
5. Once installed, you can open a Mermaid file and use the preview feature to visualize your diagrams.

### Usage

1. Create a new file with the `.mmd` extension (e.g., `diagram.mmd`)
2. Write your Mermaid syntax in the file. For example:

```mermaid
graph TD
    A[Start] --> B{Is it working?}
    B -- Yes --> C[Great!]
    B -- No --> D[Fix it]
    D --> B
```

3. To preview the diagram, right-click in the editor and select "Preview Mermaid Diagram" or use the command palette (`Ctrl+Shift+P` or `Cmd+Shift+P`) and search for "Mermaid: Preview Diagram".

### Troubleshooting

- If the preview doesn't render, make sure your Mermaid syntax is correct (check the Mermaid documentation for reference).
- Ensure that the extension is properly installed and enabled in VS Code.
- If you encounter performance issues with large diagrams, try simplifying the diagram or breaking it into smaller parts.

---

## multi-command Extension

### Why multi-command?

The multi-command extension allows you to execute multiple commands in sequence with a single keybinding. This is particularly useful for automating repetitive tasks, such as opening a markdown preview and copying the editor to a new window for easier review.

### Official Resources

- Extension: [https://marketplace.visualstudio.com/items?itemName=ryuta46.multi-command](https://marketplace.visualstudio.com/items?itemName=ryuta46.multi-command)

### Installation

1. Open Visual Studio Code
2. Go to the Extensions view (`Ctrl+Shift+X` or `Cmd+Shift+X`)
3. Search for "multi-command"
4. Click "Install"

### Configuration

To set up a multi-command keybinding, you need to add a configuration to your `settings.json` file. For example, to create a keybinding that opens a markdown preview and copies the editor to a new window, you can add the following configuration:

```json
"multiCommand.commands": [
    {
        "command": "extension.multiCommand.execute",
        "sequence": [
            "markdown.showPreviewToSide",
            "workbench.action.copyEditorToNewWindow"
        ]
    }
]
```

### Usage

1. After adding the configuration, you can create a keybinding for this multi-command. For example, you can add the following to your `keybindings.json` file:

```json
{
    "key": "ctrl+shift+alt+x",
    "command": "extension.multiCommand.execute",
    "when": "editorLangId == markdown || resourceExtname == .mdc"
}
```
2. This keybinding will trigger the multi-command when you are editing a markdown file (`.md` or `.mdc`).

### Troubleshooting

- If the multi-command doesn't execute, ensure that both the `multi-command` extension is installed and that your `settings.json` and `keybindings.json` configurations are correct.
- Make sure that the commands in the sequence are valid and available in your version of VS Code.
- If you encounter issues with specific commands in the sequence, try testing them individually to identify any potential conflicts or errors.
