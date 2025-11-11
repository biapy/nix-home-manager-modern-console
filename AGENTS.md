# 🤖 AI Agents Guide

> **Purpose**: Instructions for AI coding agents working on the nix-home-manager-modern-console project.

This document provides guidelines for AI agents (like GitHub Copilot, Claude, GPT-4, etc.) to maintain consistency, quality, and best practices when contributing to this Home Manager module collection.

---

## 📋 Table of Contents

- [Project Overview](#-project-overview)
- [Commit Standards](#-commit-standards)
- [Code Style & Standards](#-code-style--standards)
- [Module Structure](#-module-structure)
- [Documentation Standards](#-documentation-standards)
- [Testing & Validation](#-testing--validation)
- [Common Tasks](#-common-tasks)

---

## 🎯 Project Overview

**Type**: Nix Home Manager module collection  
**Purpose**: Provide curated modern CLI/TUI tools as a reusable flake module  
**Target Users**: NixOS and Home Manager users seeking modern console tools

### Key Characteristics

- **Modular**: Tools organized by category (core-utils, development, networking, etc.)
- **Optional**: Each module can be enabled/disabled independently
- **Documented**: Every tool includes homepage, description, and emoji
- **Reusable**: Exposed as a flake with `homeManagerModules` output

---

## 🎭 Commit Standards

### Gitmoji + Conventional Commits

Follow the [Gitmoji](https://gitmoji.dev/) specification combined with [Conventional Commits](https://www.conventionalcommits.org/):

```
<gitmoji> <type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

### Common Commit Patterns

#### Adding Features
```bash
✨ feat(core-utils): add ripgrep-all for searching in PDFs
✨ feat(development): add rust-analyzer language server
```

#### Bug Fixes
```bash
🐛 fix(shell): correct starship configuration syntax
🐛 fix(networking): resolve bandwhich permission issue
```

#### Documentation
```bash
📝 docs(readme): add installation instructions for standalone usage
📝 docs(tools): update jq usage examples
```

#### Configuration Changes
```bash
🔧 chore(flake): update nixpkgs input to latest unstable
🔧 chore(modules): refactor option definitions for consistency
```

#### Refactoring
```bash
♻️ refactor(shell): simplify bash configuration structure
♻️ refactor(all): extract common patterns to shared module
```

#### Performance
```bash
⚡️ perf(development): lazy-load language servers
```

#### Module Changes
```bash
🗃️ feat(database): add new database tools module
🔥 chore(legacy): remove deprecated tools from system-monitoring
```

#### Testing & CI
```bash
✅ test: add flake check validation
👷 ci: add GitHub Actions workflow for checks
```

### Gitmoji Quick Reference

| Emoji | Code | Usage |
|-------|------|-------|
| ✨ | `:sparkles:` | New features or tools |
| 🐛 | `:bug:` | Bug fixes |
| 📝 | `:memo:` | Documentation |
| 🔧 | `:wrench:` | Configuration files |
| ♻️ | `:recycle:` | Refactoring |
| ⚡️ | `:zap:` | Performance improvements |
| 🔥 | `:fire:` | Remove code or files |
| ✅ | `:white_check_mark:` | Tests |
| 🚀 | `:rocket:` | Deployment/release |
| 🔒️ | `:lock:` | Security fixes |
| ⬆️ | `:arrow_up:` | Upgrade dependencies |
| ⬇️ | `:arrow_down:` | Downgrade dependencies |
| 💚 | `:green_heart:` | Fix CI build |
| 👷 | `:construction_worker:` | Add/update CI |

---

## 📐 Code Style & Standards

### Nix Code Style

#### Formatting
- **Indentation**: 2 spaces (no tabs)
- **Line Length**: Aim for 80-100 characters, max 120
- **Formatter**: Use `nixpkgs-fmt` (run via `nix fmt`)

#### Naming Conventions
```nix
# Module options: kebab-case
options.modern-console.core-utils = { ... };

# Variables: camelCase
let
  configPath = "${config.home.homeDirectory}/.config";
  toolList = [ ... ];
in

# Package names: Use exact nixpkgs attribute names
home.packages = with pkgs; [
  ripgrep  # Correct
  du-dust  # Correct (hyphenated in nixpkgs)
  # NOT: rg, dust-du
];
```

#### Option Definitions

Use `lib.mkEnableOption` for boolean options:

```nix
options.modern-console.shell = {
  enable = mkEnableOption "modern shell enhancements and utilities";
};
```

For options with defaults:

```nix
options.modern-console.development = {
  enable = mkEnableOption "development tools and utilities";
  
  gitUserName = mkOption {
    type = types.str;
    default = "Your Name";
    description = "Git user name for commits";
    example = "John Doe";
  };
};
```

#### Conditional Configuration

Always use `mkIf` for conditional blocks:

```nix
config = mkIf cfg.enable {
  home.packages = with pkgs; [ ... ];
  
  programs.git = mkIf cfg.enableGit {
    enable = true;
    # ...
  };
};
```

---

## 🗂️ Module Structure

### Standard Module Template

```nix
{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.modern-console.module-name;
in
{
  options.modern-console.module-name = {
    enable = mkEnableOption "description of module category";
    
    # Additional options if needed
  };

  config = mkIf cfg.enable {
    # 📦 Category Name - Brief category description
    
    home.packages = with pkgs; [
      # 🔧 tool-name - One-line description
      # Homepage: https://example.com/tool
      package-name
      
      # More tools...
    ];
    
    # Program-specific configurations
    programs.toolname = {
      enable = true;
      # Configuration...
    };
  };
}
```

### Module Categories

Current modules and their purposes:

```nix
modules/
├── core-utils.nix        # Modern Unix tool alternatives (ls, cat, grep, etc.)
├── development.nix       # Dev tools, git, language tools, build systems
├── file-management.nix   # File managers, sync, backup tools
├── networking.nix        # Network tools, scanners, HTTP clients
├── shell.nix            # Shell enhancements, prompts, multiplexers
├── system-monitoring.nix # System info, resource monitors
├── text-processing.nix  # Text manipulation, search, formatting
└── web-browsing.nix     # Terminal browsers, RSS, media players
```

**Guideline**: If adding a tool that doesn't fit existing categories, propose a new module rather than forcing it into an inappropriate category.

---

## 📚 Documentation Standards

### NixDoc Format

Use [nixdoc](https://github.com/nix-community/nixdoc) compatible documentation:

```nix
options.modern-console.development = {
  enable = lib.mkEnableOption "development tools and utilities";
  
  gitUserName = lib.mkOption {
    type = types.str;
    default = "Your Name";
    description = lib.mdDoc ''
      Git user name for commits.
      
      This will be set globally in your git configuration.
    '';
    example = "Jane Developer";
  };
};
```

### Tool Documentation Format

Every tool entry must include:

1. **Emoji** - Relevant visual indicator (🔧🐛📝🌐etc.)
2. **Tool Name** - Actual command name
3. **Description** - Brief one-line purpose
4. **Homepage** - Official project URL

```nix
# 🔍 ripgrep - Modern grep alternative (recursive regex search)
# Homepage: https://github.com/BurntSushi/ripgrep
ripgrep
```

### Emoji Selection Guide

Choose emojis that represent the tool's function:

- 🔍🔎 - Search tools (grep, find, etc.)
- 📊📈 - Monitoring, stats, graphs
- 🐱🦀 - Alternative tools (bat, rust-based tools)
- 🌐🌍 - Network tools
- 🔧⚙️ - Configuration, utilities
- 📝✏️ - Text editors, processors
- 🚀⚡️ - Performance, fast tools
- 🔐🔒 - Security, encryption
- 💾💿 - Storage, disk tools
- 🖥️💻 - System tools, terminals

### Comment Style

```nix
# Single-line comments for brief explanations

# Multi-line comments when detailed explanation is needed.
# Keep lines under 80 characters.
# Prefer clarity over brevity.

# ⚠️ Use warning emoji for important notes
# ⚠️ IMPORTANT: This setting affects system-wide configuration

# ℹ️ Use info emoji for helpful tips
# ℹ️ NOTE: This tool requires additional setup
```

---

## ✅ Testing & Validation

### Before Committing

Run these checks:

```bash
# Format Nix code
nix fmt

# Check flake syntax and evaluation
nix flake check

# Show flake structure
nix flake show

# Test build (replace 'username' with actual user)
nix build .#homeConfigurations.username.activationPackage
```

### Flake Check Requirements

The `nix flake check` must pass. Common issues:

```nix
# ❌ BAD: Invalid option type
options.myOption = {
  type = types.str;  # Missing lib.types
};

# ✅ GOOD: Correct namespace
options.myOption = {
  type = lib.types.str;
};
```

### Testing Individual Modules

Create a test configuration:

```nix
# test.nix
{ pkgs, ... }:
{
  imports = [ ./modules/core-utils.nix ];
  
  modern-console.core-utils.enable = true;
  
  home = {
    username = "testuser";
    homeDirectory = "/home/testuser";
    stateVersion = "24.05";
  };
}
```

Test with:
```bash
nix build --impure --expr '
  (import <nixpkgs> {}).callPackage <home-manager/modules> {
    configuration = ./test.nix;
  }
'
```

---

## 🔨 Common Tasks

### Adding a New Tool

1. **Identify the appropriate module** based on tool category
2. **Add package entry** with proper documentation:

```nix
# 🔍 ripgrep-all - ripgrep that can search in PDFs, E-Books, Office docs
# Homepage: https://github.com/phiresky/ripgrep-all
ripgrep-all
```

3. **Test the addition**:
```bash
nix flake check
```

4. **Commit with proper message**:
```bash
git add modules/text-processing.nix
git commit -m "✨ feat(text-processing): add ripgrep-all for document search"
```

### Adding a New Module

1. **Create module file**: `modules/new-category.nix`

```nix
{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.modern-console.new-category;
in
{
  options.modern-console.new-category = {
    enable = mkEnableOption "new category description";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      # Tools here
    ];
  };
}
```

2. **Import in `home.nix`**:

```nix
imports = [
  # ... existing imports
  ./modules/new-category.nix
];
```

3. **Add to flake outputs**:

```nix
homeManagerModules = {
  # ... existing modules
  new-category = ./modules/new-category.nix;
};
```

4. **Document in README.md**
5. **Test and commit**:

```bash
nix flake check
git add modules/new-category.nix home.nix flake.nix
git commit -m "✨ feat(modules): add new-category module for X tools"
```

### Updating Tool Configuration

When adding program-specific config (not just packages):

```nix
config = mkIf cfg.enable {
  home.packages = with pkgs; [ git ];
  
  programs.git = {
    enable = true;
    userName = lib.mkDefault "Your Name";
    userEmail = lib.mkDefault "your.email@example.com";
    
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
    };
    
    aliases = {
      st = "status";
      co = "checkout";
      br = "branch";
    };
  };
};
```

**Important**: Use `lib.mkDefault` for values users should override.

### Deprecating/Removing Tools

1. **Document reason** in commit message
2. **Check for dependents** (other configs that import this)
3. **Use proper commit type**:

```bash
git commit -m "🔥 chore(networking): remove deprecated tool-name

Tool-name has been superseded by better-tool and is no longer maintained.
Users should migrate to better-tool which provides similar functionality."
```

---

## 🎯 Best Practices

### Clean Code Principles

1. **Single Responsibility**: Each module handles one category
2. **DRY (Don't Repeat Yourself)**: Extract common patterns
3. **KISS (Keep It Simple)**: Prefer simple, clear code over clever tricks
4. **Explicit over Implicit**: Make intentions clear
5. **Fail Fast**: Use assertions for invariants

### Nix-Specific Best Practices

```nix
# ✅ GOOD: Use `with lib;` at module level
with lib;

let
  cfg = config.modern-console.module-name;
in
{
  options = { ... };
}

# ❌ BAD: Multiple `with` statements
with lib; with pkgs; with builtins;
```

```nix
# ✅ GOOD: Use `with pkgs;` for package lists
home.packages = with pkgs; [
  ripgrep
  fd
  bat
];

# ❌ BAD: Fully qualified each time
home.packages = [
  pkgs.ripgrep
  pkgs.fd
  pkgs.bat
];
```

```nix
# ✅ GOOD: Use lib.mkDefault for overridable defaults
programs.git.userName = lib.mkDefault "Your Name";

# ❌ BAD: Hard-coded values users can't override
programs.git.userName = "Your Name";
```

### Module Hygiene

- **No side effects**: Modules should be pure
- **No global state**: Use module options
- **Conditional imports**: Use `imports = lib.optionals condition [ ./module.nix ];`
- **Namespace properly**: Use `modern-console.*` prefix for all options

### Security Considerations

```nix
# ⚠️ Never commit secrets
# ❌ BAD
programs.git = {
  extraConfig = {
    github.token = "ghp_xxxxxxxxxxxx";
  };
};

# ✅ GOOD: Use environment variables or external files
programs.git = {
  extraConfig = {
    # Token should be set via environment or credential helper
  };
};
```

---

## 🔍 Common Pitfalls

### 1. Missing `lib` Import

```nix
# ❌ BAD
mkEnableOption "description"  # Error: mkEnableOption not found

# ✅ GOOD
lib.mkEnableOption "description"
# OR with `with lib;`
mkEnableOption "description"
```

### 2. Wrong Package Names

```nix
# ❌ BAD
home.packages = [ pkgs.dust ];  # Package is actually du-dust

# ✅ GOOD
home.packages = [ pkgs.du-dust ];

# Check package names with:
# nix search nixpkgs dust
```

### 3. Forgotten `config.` Prefix

```nix
# ❌ BAD
config = mkIf cfg.enable {
  programs.git.userName = modern-console.development.gitUserName;
};

# ✅ GOOD
config = mkIf cfg.enable {
  programs.git.userName = config.modern-console.development.gitUserName;
};
```

### 4. Incorrect String Interpolation

```nix
# ❌ BAD
home.file.".config/tool/config".text = "path = $HOME/.local";

# ✅ GOOD
home.file.".config/tool/config".text = ''
  path = ${config.home.homeDirectory}/.local
'';
```

---

## 📖 Further Reading

- [Nix Pills](https://nixos.org/guides/nix-pills/) - Deep dive into Nix
- [NixOS Wiki](https://nixos.wiki/wiki/Home_Manager) - Home Manager documentation
- [nixpkgs Manual](https://nixos.org/manual/nixpkgs/stable/) - Package and module system
- [Nix Style Guide](https://nix.dev/contributing/documentation/style-guide) - Official style guide
- [Gitmoji](https://gitmoji.dev/) - Commit emoji reference
- [Conventional Commits](https://www.conventionalcommits.org/) - Commit message format

---

## 🤝 Agent Responsibilities

When working on this project, AI agents should:

- ✅ **Follow commit conventions** (gitmoji + conventional commits)
- ✅ **Format code** with `nixpkgs-fmt` before committing
- ✅ **Validate** with `nix flake check`
- ✅ **Document tools** with emoji, description, and homepage
- ✅ **Use `lib.mkDefault`** for user-overridable values
- ✅ **Test changes** before proposing
- ✅ **Write clear commit messages** explaining "why", not just "what"
- ✅ **Maintain consistency** with existing code style
- ✅ **Update documentation** when adding features
- ❌ **Never commit secrets** or sensitive data
- ❌ **Never break backward compatibility** without major version bump
- ❌ **Never add unmaintained tools** without noting deprecation risk

---

## 📞 Questions?

If uncertain about:
- **Module placement**: Propose new module if no good fit
- **Breaking changes**: Document in commit message and changelog
- **Security implications**: Err on side of caution, ask for review
- **Performance impact**: Note in PR description for human review

---

## 📋 Maintaining This Document

**⚠️ IMPORTANT**: AI agents MUST keep this document up to date!

When working on this project, if you:
- **Discover new best practices** → Add them to the relevant section
- **Identify new common pitfalls** → Document them in "Common Pitfalls"
- **Create new patterns or conventions** → Add examples and explanations
- **Change project structure** → Update "Module Structure" section
- **Modify commit format requirements** → Update "Commit Standards"
- **Add new tools or dependencies** → Update relevant sections
- **Learn from mistakes or issues** → Document the lesson learned

### Update Procedure

1. **Make changes** to AGENTS.md in the same commit as related code changes
2. **Update "Last Updated"** field to current date (YYYY-MM-DD format)
3. **Increment version** following semver:
   - Patch (1.0.X): Minor clarifications, typo fixes
   - Minor (1.X.0): New sections, significant additions
   - Major (X.0.0): Breaking changes to conventions
4. **Commit format**: `docs(agents): 📝 update <what changed>`

Example:
```bash
# When adding new best practice
git add AGENTS.md
git commit -m "docs(agents): 📝 update with new module testing pattern"
```

**Self-Improvement**: This document is a living guide that should evolve with the project. Every AI agent contributes to making it better for future agents.

---

**Version**: 1.1.0  
**Last Updated**: 2025-11-11  
**Maintained by**: Project Contributors and AI Agents

