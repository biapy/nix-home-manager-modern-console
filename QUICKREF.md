# 📇 Quick Reference Card

A compact reference for the most commonly used tools and commands.

## 🚀 Installation

```bash
# Clone
git clone https://github.com/biapy/nix-home-manager-modern-console.git
cd nix-home-manager-modern-console

# Edit home.nix with your username
vim home.nix

# Apply
home-manager switch --flake .
```

## 🔥 Most Used Commands

### File Operations
```bash
fd pattern              # Find files
rg "text"               # Search in files
eza -la                 # List files (better ls)
bat file.txt            # View file (better cat)
z project               # Jump to directory
```

### Development
```bash
lazygit                 # Git TUI
gh pr list              # GitHub CLI
jq '.' data.json        # Process JSON
glow README.md          # View markdown
```

### System
```bash
btop                    # System monitor
duf                     # Disk usage
dust                    # Directory size
cyme                    # USB devices
```

### Text Processing
```bash
fzf                     # Fuzzy finder
tldr command            # Quick help
tuc -d: -f2             # Cut fields
f2 -f old -r new -x     # Rename files
```

### Networking
```bash
dog domain.com          # DNS lookup
nmap 192.168.1.1        # Scan network
bandwhich               # Network usage
gping google.com        # Ping with graph
```

## ⌨️ Shell Shortcuts (if enabled)

```bash
Ctrl+R                  # Search history (atuin/fzf)
Ctrl+T                  # Find files (fzf)
Alt+C                   # Change directory (fzf)
```

## 🎯 Common Workflows

### Quick Search
```bash
fd -e py | xargs rg "class"    # Find Python classes
```

### Git Flow
```bash
git st                  # Status
git add -p              # Stage interactively
git cm "message"        # Commit
git lg                  # View log
```

### File Management
```bash
ranger                  # File manager
trash-put file.txt      # Safe delete
rsync -avz src/ dst/    # Sync directories
```

### System Check
```bash
btop                    # Overview
neofetch                # System info
duf                     # Disk space
```

## 📦 Update System

```bash
make update             # Update packages
make switch             # Apply changes
make clean              # Cleanup old generations
```

## 🔧 Customization

Edit `home.nix`:
```nix
modern-console = {
  core-utils.enable = true;
  development.enable = true;
  networking.enable = false;     # Disable category
  # ... etc
};
```

## 📚 Get Help

```bash
tldr command            # Quick examples
man command             # Full manual
command --help          # Command help
cheat command           # Cheatsheet
```

## 🆘 Troubleshooting

```bash
# Rebuild if something breaks
home-manager switch --flake .

# Check what changed
home-manager generations

# Rollback if needed
home-manager switch --rollback
```

## 🔗 Quick Links

- 📖 [Full README](README.md)
- 📚 [Usage Guide](USAGE.md)
- 🛠️ [Tools Reference](TOOLS.md)
- 🤝 [Contributing](CONTRIBUTING.md)

## 💡 Pro Tips

1. **Aliases**: Add custom aliases in `home.nix`
2. **Zoxide**: Use `z` for smart directory jumping
3. **Bat**: Use as MANPAGER: `export MANPAGER="sh -c 'col -bx | bat -l man -p'"`
4. **FZF**: Combine with other tools: `vim $(fzf)`
5. **Starship**: Customize prompt in `home.nix`

---

For detailed information, see the [complete documentation](README.md).
