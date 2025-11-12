# 🤝 Contributing to Modern Console Configuration

Thank you for your interest in contributing! This project aims to provide a comprehensive, well-organized collection of modern command-line tools for Home Manager users.

## 📋 Table of Contents
- [Development Environment](#development-environment)
- [How to Contribute](#how-to-contribute)
- [Adding New Tools](#adding-new-tools)
- [Improving Documentation](#improving-documentation)
- [Testing Changes](#testing-changes)
- [Code Style](#code-style)
- [Pull Request Process](#pull-request-process)

## 🛠️ Development Environment

This project uses [devenv](https://devenv.sh/) to provide a consistent development environment with all necessary tools.

### Quick Setup

1. **Install devenv** (if not already installed):
   ```bash
   nix profile install --accept-flake-config github:cachix/devenv/latest
   ```

2. **Clone the repository**:
   ```bash
   git clone https://github.com/biapy/nix-home-manager-modern-console.git
   cd nix-home-manager-modern-console
   ```

3. **Enter the development environment**:
   ```bash
   # Option 1: Manual activation
   devenv shell
   
   # Option 2: Use direnv (recommended)
   direnv allow
   # Now the environment activates automatically when you cd into the directory
   ```

### Available Commands

The devenv provides a task runner with common operations:

```bash
# List all available tasks
task --list

# Common development tasks
task switch              # Apply home-manager configuration
task format              # Format all code (Nix, Markdown, Shell)
task lint                # Run all linters
task security:secrets    # Scan for secrets

# Testing
nix flake check         # Validate flake syntax
task switch --dry-run   # Test configuration without applying
```

### What's Included

The development environment includes:
- ✅ **go-task** - Task runner for common operations
- ✅ **home-manager** & **nixos-rebuild** - Build and deploy tools
- ✅ **Formatters** - nixpkgs-fmt, mdformat, shfmt
- ✅ **Linters** - shellcheck, markdownlint, nixpkgs-fmt check
- ✅ **Git hooks** - commitizen (conventional commits), gitleaks (secret scanning)
- ✅ **Security** - gitleaks for detecting secrets in commits

### Git Commit Messages

Git hooks enforce [Conventional Commits](https://www.conventionalcommits.org/) format:

```
type(scope): description

[optional body]
[optional footer]
```

When you commit, **commitizen** will interactively prompt you for:
- Commit type (feat, fix, docs, etc.)
- Scope (optional)
- Description
- Body (optional)
- Breaking changes (optional)

**Or use gitmoji + conventional commits** (see AGENTS.md for details):

```bash
git commit -m "✨ feat(core-utils): add ripgrep for fast searching"
```

## 🚀 How to Contribute

There are many ways to contribute:
- 🔧 Add new modern tools
- 📝 Improve documentation
- 🐛 Fix bugs or configuration issues
- 💡 Suggest improvements
- 🎨 Enhance existing configurations
- ✅ Add or improve tests

## 🛠️ Adding New Tools

### 1. Choose the Right Module

Tools are organized into categories in the `modules/` directory:
- **core-utils.nix** - Modern alternatives to Unix tools (ls, cat, grep, etc.)
- **development.nix** - Development tools, git, build tools
- **networking.nix** - Network tools, security scanners, HTTP clients
- **text-processing.nix** - Text manipulation, search, formatting
- **system-monitoring.nix** - System info, process monitors, diagnostics
- **file-management.nix** - File managers, sync tools, backups
- **web-browsing.nix** - Terminal browsers, RSS readers, media tools
- **shell.nix** - Shell enhancements, prompts, multiplexers

### 2. Add the Tool to the Appropriate Module

Edit the relevant module file and add your tool following this pattern:

```nix
# 🔧 Tool Name - Brief description
# Homepage: https://example.com/tool
packageName
```

**Important Guidelines:**
- ✅ Use UTF-8 emojis (pick relevant ones)
- ✅ Include the tool's homepage URL
- ✅ Provide a clear, concise description
- ✅ Verify the package exists in nixpkgs
- ✅ Place the tool in a logical location within the module
- ✅ Maintain alphabetical or logical ordering

**Example:**

```nix
# 🔍 ripgrep - Fast recursive search tool
# Homepage: https://github.com/BurntSushi/ripgrep
ripgrep
```

### 3. Update Documentation

When adding a tool, update these files:

#### A. TOOLS.md
Add an entry to the tools reference:

```markdown
| 🔍 **ripgrep** (`rg`) | `grep` | Fast recursive search tool | [GitHub](https://github.com/BurntSushi/ripgrep) |
```

#### B. USAGE.md (if applicable)
Add usage examples if the tool has common use cases:

```markdown
### ripgrep - Fast Search

```bash
rg "search term"              # Search in all files
rg -t py "def "               # Search in Python files
```
\```

#### C. README.md (if it's a major addition)
Update the features section if adding a significant new tool category.

### 4. Testing the Addition

Before submitting, test that:
1. The package name is correct
2. The module syntax is valid
3. The tool can be installed successfully

```bash
# Test building the configuration
nix flake check

# Test installing the specific module
home-manager switch --flake .
```

## 📝 Improving Documentation

Good documentation is crucial! You can help by:

### Fixing Errors
- Typos and grammar issues
- Broken links
- Incorrect command examples

### Adding Examples
- Common use cases
- Configuration snippets
- Integration examples

### Improving Clarity
- Better explanations
- More detailed instructions
- Additional context

## 🧪 Testing Changes

### Using devenv (Recommended)

```bash
# Enter development environment
devenv shell
# or if using direnv, just cd into the directory

# Format your code
task format

# Run linters
task lint

# Check for secrets
task security:secrets

# Validate Nix syntax
nix flake check

# Test configuration (dry-run)
task switch --dry-run

# Apply configuration for testing
task switch
```

### Without devenv

```bash
# Format Nix code
nix fmt

# Check flake syntax
nix flake check

# Test home-manager build
home-manager build --flake .

# Apply and test
home-manager switch --flake .
```

### Local Testing

1. Clone your fork:
```bash
git clone https://github.com/YOUR-USERNAME/nix-home-manager-modern-console.git
cd nix-home-manager-modern-console
```

2. Make your changes

3. Test the configuration:
```bash
# Check syntax
nix flake check

# Build without activating
home-manager build --flake .

# Apply and test
home-manager switch --flake .
```

4. Test the specific tool you added:
```bash
# Verify it's installed
which tool-name

# Test basic functionality
tool-name --version
tool-name --help
```

## 🎨 Code Style

### Nix Code Style

- Use 2 spaces for indentation
- Follow existing formatting patterns
- Keep lines under 100 characters when possible
- Use meaningful variable names
- Add comments for complex configurations

**Example:**

```nix
# Good
programs.git = {
  enable = true;
  userName = "Your Name";
  aliases = {
    st = "status";
    co = "checkout";
  };
};

# Avoid
programs.git={enable=true;userName="Your Name";aliases={st="status";co="checkout";};};
```

### Documentation Style

- Use clear, concise language
- Include code examples
- Use emojis consistently (one per major section/tool)
- Format code blocks with proper syntax highlighting
- Include links to official documentation

### Commit Messages

Follow conventional commit format:

```
type(scope): brief description

Detailed explanation if needed
```

**Types:**
- `feat`: New feature or tool
- `fix`: Bug fix
- `docs`: Documentation changes
- `refactor`: Code refactoring
- `style`: Formatting changes
- `test`: Adding tests
- `chore`: Maintenance tasks

**Examples:**
```
feat(core-utils): add ripgrep with configuration

Add ripgrep as a modern grep alternative with syntax highlighting
and .gitignore integration.

docs(usage): add ripgrep usage examples

fix(development): correct git delta configuration
```

## 📥 Pull Request Process

### Before Submitting

1. ✅ **Test your changes locally**
   ```bash
   task format  # Format code
   task lint    # Run linters
   nix flake check
   ```

2. ✅ **Update relevant documentation**
3. ✅ **Follow the code style guidelines**
4. ✅ **Make commits with conventional commit format**
   - If using devenv, commitizen will guide you
   - Or manually follow gitmoji + conventional commits format
5. ✅ **Scan for secrets**
   ```bash
   task security:secrets
   ```
6. ✅ **Rebase on latest main if needed**

### Submitting the PR

1. **Fork** the repository
2. **Create** a branch for your feature:
   ```bash
   git checkout -b feat/add-awesome-tool
   ```
3. **Commit** your changes with clear messages
4. **Push** to your fork:
   ```bash
   git push origin feat/add-awesome-tool
   ```
5. **Open** a Pull Request with:
   - Clear title describing the change
   - Description of what was added/changed
   - Why the change is beneficial
   - Testing steps you performed

### PR Template

When opening a PR, include:

```markdown
## Description
Brief description of changes

## Type of Change
- [ ] New tool addition
- [ ] Configuration improvement
- [ ] Documentation update
- [ ] Bug fix
- [ ] Other (please describe)

## Tool Information (if applicable)
- **Tool Name**: 
- **Category**: 
- **Homepage**: 
- **Why it's useful**: 

## Testing
- [ ] Tested locally with `home-manager switch`
- [ ] Tool works as expected
- [ ] Documentation updated
- [ ] No syntax errors

## Checklist
- [ ] Code follows project style
- [ ] Documentation is updated
- [ ] Commit messages are clear
- [ ] Changes are focused and minimal
```

### Review Process

- Maintainers will review your PR
- Address any feedback or requested changes
- Once approved, your PR will be merged
- Your contribution will be acknowledged!

## 🎯 Good First Issues

New to the project? Look for issues labeled:
- `good first issue`
- `documentation`
- `help wanted`

Some easy contributions:
- Fix typos in documentation
- Add usage examples for existing tools
- Improve README clarity
- Add missing tool descriptions
- Test tools and report issues

## 💡 Suggesting Tools

Not ready to add a tool yourself? Open an issue with:

```markdown
**Tool Name**: ripgrep
**Category**: core-utils
**Homepage**: https://github.com/BurntSushi/ripgrep
**Description**: Fast recursive search tool
**Why it's useful**: Much faster than grep, respects .gitignore

**Additional Context**:
(Any other relevant information)
```

## 🏆 Recognition

Contributors are recognized in several ways:
- Listed in PR descriptions and commit messages
- Mentioned in release notes for significant contributions
- Community appreciation and thanks! 🎉

## 📞 Questions?

- Open an issue for discussion
- Tag maintainers if you need help
- Check existing issues and PRs first

## 📜 Code of Conduct

### Our Standards

- Be respectful and inclusive
- Welcome newcomers
- Accept constructive criticism
- Focus on what's best for the community
- Show empathy toward others

### Unacceptable Behavior

- Harassment or discriminatory language
- Trolling or insulting comments
- Personal or political attacks
- Publishing others' private information
- Unprofessional conduct

## 📄 License

By contributing, you agree that your contributions will be licensed under the same license as the project (MIT License).

---

Thank you for contributing to make command-line work better for everyone! 🚀
