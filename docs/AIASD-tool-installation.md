# Tool Installation Guide

**Required Tools:** Git • GitHub Account • GitHub CLI • Visual Studio Code • GitHub Copilot Extension • GitHub Copilot CLI • Mob.sh

**Optional Tools:** Pandoc • Marp CLI

This guide provides download and installation instructions for Windows and macOS, along with links to official documentation for each tool. **Tools are ordered by dependencies** — install them in sequence for the smoothest setup experience.

---

## 1. Git

### 🔗 Official Resources

- Download: [https://git-scm.com/downloads](https://git-scm.com/downloads)
- Documentation: [https://git-scm.com/doc](https://git-scm.com/doc)

---

### Windows Installation

**Option A — Direct Download**

1. Download the Windows installer:
   [https://git-scm.com/download/win](https://git-scm.com/download/win)
2. Run the installer and follow the setup wizard.
3. Choose "Git Bash Here" and "Git GUI Here" context menu options.
4. Select your preferred default editor (VS Code recommended).
5. Choose "Git from the command line and also from 3rd-party software".

**Option B — Using Chocolatey**

- Chocolatey: [https://chocolatey.org/](https://chocolatey.org/)
- Installation Guide: [https://chocolatey.org/install](https://chocolatey.org/install)

```powershell
choco install git
```

**Option C — Using Winget**

- Winget: [https://learn.microsoft.com/en-us/windows/package-manager/](https://learn.microsoft.com/en-us/windows/package-manager/)
- Installation: Pre-installed on Windows 10/11

```powershell
winget install --id Git.Git
```

### macOS Installation

**Option A — Using Homebrew** (recommended)

- Homebrew: [https://brew.sh/](https://brew.sh/)
- Installation Guide: [https://docs.brew.sh/Installation](https://docs.brew.sh/Installation)

```bash
brew install git
```

**Option B — Direct Download**

1. Download the macOS installer:
   [https://git-scm.com/download/mac](https://git-scm.com/download/mac)
2. Run the installer and follow the setup wizard.

### Verification

```bash
git --version
```

---

## 2. Create a GitHub Account

### 🔗 Official Resources

- GitHub Sign‑Up: [https://github.com/signup](https://github.com/signup)
- GitHub Documentation: [https://docs.github.com/](https://docs.github.com/)

---

### Steps to Create an Account

1. Navigate to the GitHub sign‑up page:
   [https://github.com/signup](https://github.com/signup)

2. Enter your **email address** and click **Continue**.

3. Create a **password** and click **Continue**.

4. Choose a **username** and click **Continue**.

5. Complete the **human verification** challenge.

6. Choose whether to receive product updates.

7. Verify your email by entering the **code** sent to your inbox.

8. Your GitHub account is now created — you can sign in at [https://github.com/login](https://github.com/login).

---

## 3. GitHub CLI

### 🔗 Official Resources

- Download: [https://cli.github.com/](https://cli.github.com/)
- Documentation: [https://cli.github.com/manual/](https://cli.github.com/manual/)

---

### Windows Installation

**Option A — Direct Download**

1. Download the Windows installer:
   [https://github.com/cli/cli/releases/latest](https://github.com/cli/cli/releases/latest)
   Download the `.msi` installer.
2. Run the installer and follow the setup wizard.

**Option B — Using Chocolatey**

- Chocolatey: [https://chocolatey.org/](https://chocolatey.org/)
- Installation Guide: [https://chocolatey.org/install](https://chocolatey.org/install)

```powershell
choco install gh
```

**Option C — Using Winget**

```powershell
winget install --id GitHub.cli
```

### macOS Installation

**Option A — Using Homebrew** (recommended)

- Homebrew: [https://brew.sh/](https://brew.sh/)
- Installation Guide: [https://docs.brew.sh/Installation](https://docs.brew.sh/Installation)

```bash
brew install gh
```

**Option B — Direct Download**

1. Download from [https://cli.github.com/](https://cli.github.com/)
2. Follow the installation instructions for your system.

### Authentication Setup

```bash
gh auth login
```

Follow the prompts to authenticate with your GitHub account.

### Verification

```bash
gh --version
gh auth status
```

---

## 4. Visual Studio Code

### 🔗 Official Resources

- Download: [https://code.visualstudio.com/download](https://code.visualstudio.com/download)
- Documentation: [https://code.visualstudio.com/docs](https://code.visualstudio.com/docs)

---

### Windows Installation

**Option A — Direct Download**

1. Download the Windows installer:
   [https://code.visualstudio.com/download](https://code.visualstudio.com/download)
2. Run the installer and follow the setup wizard.
3. Check "Add to PATH" for command line usage.
4. Launch **Visual Studio Code**.

**Option B — Using Chocolatey**

```powershell
choco install vscode
```

**Option C — Using Winget**

```powershell
winget install --id Microsoft.VisualStudioCode
```

### macOS Installation

**Option A — Direct Download**

1. Download the macOS `.zip` package:
   [https://code.visualstudio.com/download](https://code.visualstudio.com/download)
2. Extract the archive.
3. Move **Visual Studio Code.app** to `/Applications`.
4. Launch VS Code from Spotlight or the Applications folder.

**Option B — Using Homebrew**

```bash
brew install --cask visual-studio-code
```

### Verification

```bash
code --version
```

---

## 5. GitHub Copilot Extension for Visual Studio Code

### 🔗 Official Resources

- Extension Marketplace: `https://marketplace.visualstudio.com/items?itemName=GitHub.copilot` [(marketplace.visualstudio.com)](https://www.bing.com/search?q="https%3A%2F%2Fmarketplace.visualstudio.com%2Fitems%3FitemName%3DGitHub.copilot")
- Documentation: [https://docs.github.com/en/copilot](https://docs.github.com/en/copilot)

---

### Windows Installation

1. Open **Visual Studio Code**.
2. Go to **Extensions** (`Ctrl+Shift+X`).
3. Search for **GitHub Copilot**.
4. Click **Install**.
5. Sign in with your GitHub account.

---

### macOS Installation

1. Open **Visual Studio Code**.
2. Navigate to **Extensions** (`Cmd+Shift+X`).
3. Search for **GitHub Copilot**.
4. Click **Install**.
5. Sign in with your GitHub account.

---

## 6. GitHub Copilot CLI

### 🔗 Official Resources

- Copilot CLI Documentation: [https://docs.github.com/en/copilot/github-copilot-in-the-cli](https://docs.github.com/en/copilot/github-copilot-in-the-cli)
- **Prerequisite**: GitHub CLI (installed in step 3)

---

### Installation (Windows & macOS)

**Prerequisites Check**:

```bash
gh auth status  # Verify GitHub CLI is authenticated
```

**Install Copilot CLI Extension**:

```bash
gh extension install github/gh-copilot
```

**Verify Installation**:

```bash
gh copilot --help
```

**Basic Usage**:

```bash
gh copilot suggest "git command to undo last commit"
gh copilot explain "git reset --hard HEAD~1"
```

---

## 7. Mob.sh (Mob Programming Tool)

### 🔗 Official Resources

- Project Page: [https://mob.sh](https://mob.sh)
- GitHub Repository: `https://github.com/remotemobprogramming/mob` [(github.com)](https://www.bing.com/search?q="https%3A%2F%2Fgithub.com%2Fremotemobprogramming%2Fmob")
- Documentation: [https://mob.sh/docs/](https://mob.sh/docs/)

---

### Windows Installation

**Prerequisite**: Git (installed in step 1)

Mob.sh runs via Git Bash, WSL, or any POSIX‑compatible shell. It can be installed using the Chocolatey package manager.

**Option A — Using Chocolatey** (easiest)

```powershell
choco install mob.sh
```

**Option B — Using Git Bash**

1. Open Git Bash (included with Git for Windows)
2. Install Mob via script:
   ```bash
   curl -s https://mob.sh/install.sh | sh
   ```
3. Verify installation:
   ```bash
   mob version
   ```

**Option C — Using WSL**

- WSL (Windows Subsystem for Linux): [https://learn.microsoft.com/en-us/windows/wsl/](https://learn.microsoft.com/en-us/windows/wsl/)
- Installation Guide: [https://learn.microsoft.com/en-us/windows/wsl/install](https://learn.microsoft.com/en-us/windows/wsl/install)

1. Install WSL:
   ```powershell
   wsl --install
   ```
2. Inside WSL, install Mob:
   ```bash
   curl -s https://mob.sh/install.sh | sh
   ```

---

### macOS Installation

1. Install via Homebrew:
   ```sh
   brew install mob
   ```
2. Verify installation:
   ```sh
   mob version
   ```

---

## 8. Pandoc (CLI Command) [OPTIONAL]

### 🔗 Official Resources

- Download: [https://pandoc.org/installing.html](https://pandoc.org/installing.html)
- Documentation: [https://pandoc.org/MANUAL.html](https://pandoc.org/MANUAL.html)
- User Guide: [https://pandoc.org/getting-started.html](https://pandoc.org/getting-started.html)

---

### Windows Installation

**Option A — Direct Download**

1. Download the Windows installer:
   [https://github.com/jgm/pandoc/releases/latest](https://github.com/jgm/pandoc/releases/latest)
2. Run the `.msi` installer and follow the setup wizard.

**Option B — Using Chocolatey**

```powershell
choco install pandoc
```

**Option C — Using Winget**

```powershell
winget install --id JohnMacFarlane.Pandoc
```

### macOS Installation

**Option A — Using Homebrew** (recommended)

```bash
brew install pandoc
```

**Option B — Direct Download**

1. Download the macOS package:
   [https://github.com/jgm/pandoc/releases/latest](https://github.com/jgm/pandoc/releases/latest)
2. Run the `.pkg` installer.

### Verification

```bash
pandoc --version
```

**Basic Usage**:

```bash
# Convert Markdown to PDF
pandoc input.md -o output.pdf

# Convert slides to PowerPoint using project defaults
pandoc --defaults=slides-to-pptx input.md -o output.pptx
```

---

## 9. Marp CLI (Markdown Variant) [OPTIONAL]

### 🔗 Official Resources

- Project Page: [https://marp.app/](https://marp.app/)
- Marp CLI Documentation: [https://github.com/marp-team/marp-cli](https://github.com/marp-team/marp-cli)
- Getting Started: [https://marpit.marp.app/](https://marpit.marp.app/)

---

### Prerequisites

- **Node.js**: [https://nodejs.org/](https://nodejs.org/) (required for npm installation)

### Windows Installation

**Option A — Using npm** (recommended)

- Node.js: [https://nodejs.org/en/download/](https://nodejs.org/en/download/)
- npm: Included with Node.js

```bash
npm install -g @marp-team/marp-cli
```

**Option B — Using Chocolatey**

```powershell
choco install nodejs
npm install -g @marp-team/marp-cli
```

**Option C — Using Winget**

```powershell
winget install --id OpenJS.NodeJS
npm install -g @marp-team/marp-cli
```

### macOS Installation

**Option A — Using npm** (recommended)

```bash
# Install Node.js first
brew install node

# Install Marp CLI
npm install -g @marp-team/marp-cli
```

**Option B — Direct Node.js Download**

1. Download Node.js: [https://nodejs.org/en/download/](https://nodejs.org/en/download/)
2. Install the `.pkg` package
3. Install Marp CLI:
   ```bash
   npm install -g @marp-team/marp-cli
   ```

### Verification

```bash
marp --version
node --version
npm --version
```

**Basic Usage**:

```bash
# Convert Marp slides to HTML
marp slides.md

# Convert to PDF
marp slides.md --pdf

# Convert to PowerPoint
marp slides.md --pptx

# Watch for changes
marp slides.md --watch
```

---
