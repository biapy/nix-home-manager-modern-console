# 🏠 nix-home-manager-modern-console

A comprehensive [Home Manager](https://github.com/nix-community/home-manager) configuration featuring modern command-line and TUI tools for daily use, software development, and system administration.

## ✨ Features

This configuration provides a curated collection of modern console tools organized by category:

### 🔧 Core Utilities
Modern alternatives to traditional Unix tools:
- **ripgrep** (`rg`) - Fast recursive grep ([GitHub](https://github.com/BurntSushi/ripgrep))
- **fd** - Simple, fast find alternative ([GitHub](https://github.com/sharkdp/fd))
- **eza** - Modern ls replacement with colors and icons ([GitHub](https://github.com/eza-community/eza))
- **bat** - Cat clone with syntax highlighting ([GitHub](https://github.com/sharkdp/bat))
- **duf** - Better disk usage display ([GitHub](https://github.com/muesli/duf))
- **dust** - Intuitive du alternative ([GitHub](https://github.com/bootandy/dust))
- **zoxide** - Smarter cd command ([GitHub](https://github.com/ajeetdsouza/zoxide))
- **procs** - Modern ps replacement ([GitHub](https://github.com/dalance/procs))
- **bottom** - Graphical process monitor ([GitHub](https://github.com/ClementTsang/bottom))
- And many more!

### 🛠️ Development Tools
Essential tools for software development:
- **Git** with best-practice configuration and useful aliases
- **delta** - Better git diff viewer ([GitHub](https://github.com/dandavison/delta))
- **lazygit** - Simple terminal UI for git ([GitHub](https://github.com/jesseduffield/lazygit))
- **gh** - GitHub CLI ([Homepage](https://cli.github.com/))
- **just** - Modern command runner ([GitHub](https://github.com/casey/just))
- **direnv** - Environment switcher ([Homepage](https://direnv.net/))
- **jq/yq** - JSON/YAML processors
- **glow** - Terminal markdown renderer ([GitHub](https://github.com/charmbracelet/glow))

### 🌐 Networking Tools
Network exploration and security:
- **nmap** - Network scanner ([Homepage](https://nmap.org/))
- **dog** - Modern DNS client ([Homepage](https://dns.lookup.dog/))
- **bandwhich** - Terminal bandwidth monitor ([GitHub](https://github.com/imsnif/bandwhich))
- **httpie** - User-friendly HTTP client ([Homepage](https://httpie.io/))
- **rustscan** - Fast port scanner ([GitHub](https://github.com/RustScan/RustScan))
- **gping** - Ping with graph ([GitHub](https://github.com/orf/gping))
- **mkcert** - Local development certificates ([GitHub](https://github.com/FiloSottile/mkcert))

### 📝 Text Processing
Advanced text manipulation tools:
- **tuc** - Modern cut alternative ([GitHub](https://github.com/riquito/tuc))
- **f2** - Batch file renaming ([GitHub](https://github.com/ayoisaiah/f2))
- **miller** - CSV/JSON/data processor ([Homepage](https://miller.readthedocs.io/))
- **fzf** - Fuzzy finder ([GitHub](https://github.com/junegunn/fzf))
- **tealdeer** - Fast tldr client ([GitHub](https://github.com/dbrgn/tealdeer))
- **pandoc** - Universal document converter ([Homepage](https://pandoc.org/))
- **vale** - Prose linter ([Homepage](https://vale.sh/))

### 📊 System Monitoring
Monitor and diagnose your system:
- **btop** - Resource monitor ([GitHub](https://github.com/aristocratos/btop))
- **cyme** - Modern lsusb ([GitHub](https://github.com/tuna-f1sh/cyme))
- **htop** - Interactive process viewer ([Homepage](https://htop.dev/))
- **glances** - Cross-platform monitoring ([Homepage](https://nicolargo.github.io/glances/))
- **neofetch/fastfetch** - System information tools
- **lsof** - List open files

### 📁 File Management
Efficient file operations:
- **ranger/nnn/lf** - Terminal file managers
- **rclone** - Cloud storage sync ([Homepage](https://rclone.org/))
- **rsync** - Fast file transfer
- **restic** - Secure backup program ([Homepage](https://restic.net/))
- **trash-cli** - Command-line trash utility
- **watchexec** - Execute commands on file changes ([GitHub](https://github.com/watchexec/watchexec))

### 🌐 Web Browsing
Terminal web browsers and utilities:
- **lynx** - Classic terminal browser ([Homepage](https://lynx.invisible-island.net/))
- **w3m** - Text-based web browser
- **newsboat** - RSS/Atom feed reader ([Homepage](https://newsboat.org/))
- **yt-dlp** - Video downloader ([GitHub](https://github.com/yt-dlp/yt-dlp))
- **mpv** - Media player ([Homepage](https://mpv.io/))

### 🐚 Shell Enhancements
Modern shell tools and configurations:
- **starship** - Fast customizable prompt ([Homepage](https://starship.rs/))
- **atuin** - Magical shell history ([Homepage](https://atuin.sh/))
- **tmux** - Terminal multiplexer with vim-like bindings
- **zellij** - Modern terminal workspace ([Homepage](https://zellij.dev/))
- **shellcheck** - Shell script linter ([Homepage](https://www.shellcheck.net/))
- **asciinema** - Terminal session recorder ([Homepage](https://asciinema.org/))

## 🚀 Quick Start

### Prerequisites

1. Install [Nix](https://nixos.org/download.html) with flakes enabled:
   ```bash
   sh <(curl -L https://nixos.org/nix/install) --daemon
   ```

2. Enable flakes by adding to `~/.config/nix/nix.conf`:
   ```
   experimental-features = nix-command flakes
   ```

### Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/biapy/nix-home-manager-modern-console.git
   cd nix-home-manager-modern-console
   ```

2. Edit `home.nix` and set your username and home directory:
   ```nix
   home.username = "your-username";
   home.homeDirectory = "/home/your-username";
   ```

3. Build and activate the configuration:
   ```bash
   nix run home-manager/master -- switch --flake .
   ```

   Or if you already have home-manager installed:
   ```bash
   home-manager switch --flake .
   ```

## 🎛️ Customization

### Enable/Disable Categories

Each category can be individually enabled or disabled in `home.nix`:

```nix
modern-console = {
  core-utils.enable = true;        # Core utilities
  development.enable = true;       # Development tools
  networking.enable = true;        # Networking tools
  text-processing.enable = true;   # Text processing
  system-monitoring.enable = true; # System monitoring
  file-management.enable = true;   # File management
  web-browsing.enable = true;      # Web browsers
  shell.enable = true;             # Shell enhancements
};
```

### Git Configuration

Update your git credentials in `modules/development.nix`:

```nix
programs.git = {
  userName = "Your Name";
  userEmail = "your.email@example.com";
};
```

Or override in `home.nix`:

```nix
programs.git = {
  userName = "Your Name";
  userEmail = "your.email@example.com";
};
```

### Additional Packages

Add custom packages in `home.nix`:

```nix
home.packages = with pkgs; [
  your-favorite-package
  another-package
];
```

## 📚 Module Structure

```
.
├── flake.nix                          # Nix flake configuration
├── home.nix                           # Main home-manager configuration
└── modules/
    ├── core-utils.nix                 # Modern Unix tool alternatives
    ├── development.nix                # Development tools & Git config
    ├── networking.nix                 # Networking & security tools
    ├── text-processing.nix            # Text manipulation tools
    ├── system-monitoring.nix          # System monitoring tools
    ├── file-management.nix            # File managers & sync tools
    ├── web-browsing.nix               # Terminal browsers & utilities
    └── shell.nix                      # Shell enhancements & configs
```

## 🎯 Usage Examples

### Core Utilities

```bash
# Fast file search
fd pattern

# Recursive grep
rg "search term"

# Better ls
eza -la --icons

# Disk usage
duf
dust

# Smart directory navigation
z project-name  # Jump to frequently used directory

# Better cat with syntax highlighting
bat file.py
```

### Development

```bash
# Git shortcuts (via aliases)
git st           # Status
git lg           # Pretty log graph
git cm "message" # Commit with message

# GitHub CLI
gh pr list
gh issue create

# JSON/YAML processing
echo '{"key":"value"}' | jq .
yq eval '.key' file.yaml

# Markdown rendering
glow README.md

# Code searching across all repos
rg "function" --type rust
```

### Text Processing

```bash
# Modern cut
echo "a:b:c:d" | tuc -d ":" -f 2,3

# Batch rename files
f2 -f "old" -r "new" -x

# CSV processing
csvstat data.csv
mlr --csv cut -f name,age data.csv

# Interactive filtering
cat file.txt | fzf

# TLDR pages (simplified man pages)
tldr tar
```

### System Monitoring

```bash
# Modern top
btop

# USB devices
cyme

# Interactive process viewer
htop

# System information
neofetch
fastfetch
```

## 🔧 Maintenance

### Update packages:
```bash
nix flake update
home-manager switch --flake .
```

### Garbage collection:
```bash
nix-collect-garbage -d
```

### Rollback to previous generation:
```bash
home-manager generations
home-manager switch --switch-generation <number>
```

## 👨‍💻 Development

This project uses [devenv](https://devenv.sh/) for a consistent development environment.

### Setup Development Environment

1. **Install devenv**:
   ```bash
   nix profile install --accept-flake-config github:cachix/devenv/latest
   ```

2. **Enter development shell**:
   ```bash
   # Option 1: Manual activation
   devenv shell
   
   # Option 2: Use direnv (automatic activation)
   direnv allow
   ```

### Development Commands

```bash
# List all available tasks
task --list

# Common operations
task switch              # Apply configuration
task format              # Format all code
task lint                # Run linters
task security:secrets    # Scan for secrets

# Validation
nix flake check         # Check Nix syntax
task switch --dry-run   # Test without applying
```

### What's Included

The development environment provides:
- ✅ **Task runner** - go-task for common operations
- ✅ **Formatters** - nixpkgs-fmt, mdformat, shfmt
- ✅ **Linters** - shellcheck, markdownlint
- ✅ **Git hooks** - commitizen, gitleaks
- ✅ **Testing tools** - home-manager, nixos-rebuild

### Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for detailed guidelines on:
- Adding new tools
- Testing changes
- Code style
- Pull request process

**Quick contribution checklist:**
```bash
# 1. Make your changes

# 2. Format and lint
task format && task lint

# 3. Check for issues
nix flake check
task security:secrets

# 4. Test configuration
task switch --dry-run

# 5. Commit with conventional format
git commit -m "✨ feat(category): description"
```

## 📝 Git Best Practices Included

This configuration includes git best practices:
- ✅ Helpful aliases for common operations
- ✅ Better diff viewing with delta
- ✅ Automatic cleanup and pruning
- ✅ Conflict resolution with diff3
- ✅ Rebase by default for cleaner history
- ✅ Comprehensive global gitignore
- ✅ Default branch set to 'main'

## 🤝 Contributing

Contributions are welcome! See [CONTRIBUTING.md](CONTRIBUTING.md) for detailed guidelines.

**Quick start for contributors:**
1. Fork and clone the repository
2. Set up the development environment with `devenv shell` or `direnv allow`
3. Make your changes
4. Run `task format && task lint`
5. Test with `task switch --dry-run`
6. Submit a pull request

Feel free to:
- Add new tools
- Improve configurations
- Fix bugs
- Update documentation

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

Thanks to all the amazing open-source projects and their maintainers that make modern console work a joy!

## 📖 Additional Resources

- [CONTRIBUTING.md](CONTRIBUTING.md) - Contribution guidelines and development setup
- [AGENTS.md](AGENTS.md) - Guidelines for AI coding agents
- [TOOLS.md](TOOLS.md) - Complete tool reference
- [USAGE.md](USAGE.md) - Detailed usage examples
- [Home Manager Manual](https://nix-community.github.io/home-manager/)
- [Nix Package Search](https://search.nixos.org/packages)
- [NixOS Wiki](https://nixos.wiki/)
- [Modern Unix Tools List](https://github.com/ibraheemdev/modern-unix)
- [devenv Documentation](https://devenv.sh/)
