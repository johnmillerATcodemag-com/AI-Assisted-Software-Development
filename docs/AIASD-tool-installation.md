# Tool Installation Guide

**GitHub Account • Visual Studio Code • GitHub Copilot Extension • GitHub Copilot CLI • Mob.sh**

This guide provides download and installation instructions for Windows and macOS, along with links to official documentation for each tool.

---

## 0. Create a GitHub Account

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

## 1. Visual Studio Code

### 🔗 Official Resources

- Download: [https://code.visualstudio.com/download](https://code.visualstudio.com/download)
- Documentation: [https://code.visualstudio.com/docs](https://code.visualstudio.com/docs)

---

### Windows Installation

1. Download the Windows installer:
   [https://code.visualstudio.com/download](https://code.visualstudio.com/download)
2. Run the installer and follow the setup wizard.
3. Launch **Visual Studio Code**.
4. (Optional) Add VS Code to your PATH during installation for CLI usage.

---

### macOS Installation

1. Download the macOS `.zip` package:
   [https://code.visualstudio.com/download](https://code.visualstudio.com/download)
2. Extract the archive.
3. Move **Visual Studio Code.app** to `/Applications`.
4. Launch VS Code from Spotlight or the Applications folder.

---

## 2. GitHub Copilot Extension for Visual Studio Code

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

## 3. GitHub Copilot CLI

### 🔗 Official Resources

- Copilot CLI Documentation: `https://docs.github.com/en/copilot/github-copilot-in-the-cli` [(docs.github.com)](https://www.bing.com/search?q="https%3A%2F%2Fdocs.github.com%2Fen%2Fcopilot%2Fgithub-copilot-in-the-cli")
- GitHub CLI (required): [https://cli.github.com/](https://cli.github.com/)

---

### Windows Installation

1. Install **GitHub CLI** (required):
   `https://github.com/cli/cli/releases/latest` [(github.com)](https://www.bing.com/search?q="https%3A%2F%2Fgithub.com%2Fcli%2Fcli%2Freleases%2Flatest")
   Download the `.msi` installer.
2. Authenticate GitHub CLI:
   ```sh
   gh auth login
   ```
3. Install the Copilot CLI extension:
   ```sh
   gh extension install github/gh-copilot
   ```
4. Verify installation:
   ```sh
   gh copilot --help
   ```

---

### macOS Installation

1. Install **GitHub CLI** using Homebrew:
   ```sh
   brew install gh
   ```
   Or download from [https://cli.github.com/](https://cli.github.com/)
2. Authenticate GitHub CLI:
   ```sh
   gh auth login
   ```
3. Install the Copilot CLI extension:
   ```sh
   gh extension install github/gh-copilot
   ```
4. Verify installation:
   ```sh
   gh copilot --help
   ```

---

## 4. Mob.sh (Mob Programming Tool)

### 🔗 Official Resources

- Project Page: [https://mob.sh](https://mob.sh)
- GitHub Repository: `https://github.com/remotemobprogramming/mob` [(github.com)](https://www.bing.com/search?q="https%3A%2F%2Fgithub.com%2Fremotemobprogramming%2Fmob")
- Documentation: [https://mob.sh/docs/](https://mob.sh/docs/)

---

### Windows Installation

Mob.sh runs via Git Bash, WSL, or any POSIX‑compatible shell.

**Option A — Using Git Bash**

1. Install Git for Windows (includes Git Bash):
   [https://git-scm.com/download/win](https://git-scm.com/download/win)
2. Install Mob via script:
   ```sh
   curl -s https://mob.sh/install.sh | sh
   ```
3. Verify installation:
   ```sh
   mob version
   ```

**Option B — Using WSL**

1. Install WSL:
   ```powershell
   wsl --install
   ```
2. Inside WSL, install Mob:
   ```sh
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
