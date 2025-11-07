# 📖 Usage Guide

## Table of Contents
- [Initial Setup](#initial-setup)
- [Daily Usage](#daily-usage)
- [Tool Categories](#tool-categories)
- [Tips and Tricks](#tips-and-tricks)
- [Troubleshooting](#troubleshooting)

## Initial Setup

### 1. Install Nix

If you don't have Nix installed yet:

```bash
sh <(curl -L https://nixos.org/nix/install) --daemon
```

### 2. Enable Flakes

Add this to `~/.config/nix/nix.conf` (create if it doesn't exist):

```
experimental-features = nix-command flakes
```

### 3. Clone and Configure

```bash
# Clone the repository
git clone https://github.com/biapy/nix-home-manager-modern-console.git
cd nix-home-manager-modern-console

# Edit home.nix with your username and home directory
vim home.nix
# or
nano home.nix
```

Update these lines:
```nix
home.username = "your-actual-username";
home.homeDirectory = "/home/your-actual-username";
```

Also update your Git configuration in `modules/development.nix` or override in `home.nix`:
```nix
programs.git = {
  userName = "Your Name";
  userEmail = "your.email@example.com";
};
```

### 4. Install Home Manager and Apply Configuration

```bash
# If you don't have home-manager installed
nix run home-manager/master -- switch --flake .

# Or if you already have home-manager
home-manager switch --flake .
```

## Daily Usage

### Core Utilities

#### File Searching
```bash
# Fast file search (fd instead of find)
fd pattern                    # Find files matching pattern
fd -e py                      # Find all Python files
fd -H node_modules            # Search hidden files
fd -E '*.pyc'                 # Exclude patterns

# Content search (ripgrep instead of grep)
rg "search term"              # Search in all files
rg -t py "def "               # Search in Python files only
rg -i "case insensitive"      # Case-insensitive search
rg --files-with-matches "TODO" # Only show filenames
```

#### Better File Listing
```bash
# eza instead of ls
eza -la --icons               # Long format with icons
eza -T                        # Tree view
eza --git                     # Show git status
eza -snew                     # Sort by newest

# Aliases available (if shell module is enabled):
ll                            # Detailed listing
la                            # All files including hidden
lt                            # Tree view (2 levels)
```

#### Disk Usage
```bash
# Modern du and df
duf                           # Better df
dust                          # Better du
ncdu                          # Interactive disk usage
```

#### Directory Navigation
```bash
# zoxide (smart cd)
z project                     # Jump to frequently used directory
zi                            # Interactive directory selection
z foo bar                     # Jump to directory matching "foo" and "bar"
```

#### File Viewing
```bash
# bat instead of cat
bat file.py                   # Syntax highlighted output
bat -A file.sh                # Show non-printable characters
bat file1.txt file2.txt       # Multiple files
```

### Development Tools

#### Git Workflow
```bash
# Status and diffs
git st                        # Status (alias)
git df                        # Diff (alias)
git dc                        # Diff cached (alias)

# Committing
git cm "message"              # Commit with message
git ca                        # Commit amend
git cane                      # Commit amend no edit

# Logging
git lg                        # Pretty graph log
git ll                        # Log with stats
git lol                       # One-line log
git last                      # Show last commit

# Stashing
git ss                        # Stash save
git sl                        # Stash list
git sp                        # Stash pop

# Undo
git undo                      # Undo last commit (keep changes)

# Using lazygit (TUI)
lazygit                       # Interactive git interface
```

#### GitHub CLI
```bash
gh repo view                  # View current repo
gh pr list                    # List pull requests
gh pr create                  # Create PR
gh issue list                 # List issues
gh issue create               # Create issue
```

#### JSON/YAML Processing
```bash
# jq for JSON
echo '{"name":"John","age":30}' | jq .
curl api.example.com | jq '.data'
jq '.[] | select(.active == true)' data.json

# yq for YAML
yq eval '.key' file.yaml
yq eval '.key = "new value"' -i file.yaml
```

#### Markdown Viewing
```bash
glow README.md                # Render markdown
glow -p README.md             # Page mode
glow -s dark README.md        # Dark theme
```

### Text Processing

#### Field Extraction
```bash
# tuc (better cut)
echo "a:b:c:d" | tuc -d ":" -f 2,3
cat data.csv | tuc -d "," -f 1,3-5
```

#### Batch Renaming
```bash
# f2 - powerful rename tool
f2 -f "old" -r "new"          # Dry run (preview)
f2 -f "old" -r "new" -x       # Execute rename
f2 -f "\.txt" -r ".md" -x     # Rename extensions
f2 -f "{{f}}" -r "{{f}}_backup" -x  # Add suffix
```

#### Fuzzy Finding
```bash
# fzf - interactive filtering
history | fzf                 # Search history
cat file.txt | fzf            # Filter file content
vim $(fzf)                    # Open file in vim using fzf

# Keyboard shortcuts (if shell module enabled):
# Ctrl+R - Search command history
# Ctrl+T - Search files
# Alt+C  - Change directory
```

#### Quick Help
```bash
# tldr - simplified man pages
tldr tar                      # Get quick examples
tldr rsync                    # Common use cases
tldr --update                 # Update cache
```

### System Monitoring

#### Process Monitoring
```bash
btop                          # Modern top (recommended)
htop                          # Interactive top
glances                       # System overview
procs                         # Modern ps
```

#### System Information
```bash
neofetch                      # System info with ASCII art
fastfetch                     # Faster alternative
inxi -Fxz                     # Detailed system info
```

#### Hardware Monitoring
```bash
cyme                          # USB devices
lspci                         # PCI devices
sensors                       # Temperature/voltage
smartctl -a /dev/sda          # Disk health
```

### File Management

#### File Managers
```bash
ranger                        # Vim-like file manager
nnn                           # Fast, minimal file manager
lf                            # Terminal file manager
mc                            # Midnight Commander
```

#### File Synchronization
```bash
# rsync
rsync -avz source/ dest/      # Sync directories
rsync -avz --progress src/ dst/  # With progress

# rclone (cloud sync)
rclone config                 # Configure cloud storage
rclone sync local remote:     # Sync to cloud
rclone ls remote:             # List remote files

# restic (backups)
restic init                   # Initialize repository
restic backup ~/              # Backup home directory
restic snapshots              # List snapshots
```

#### Safe File Operations
```bash
trash-put file.txt            # Move to trash (safe delete)
trash-list                    # List trashed files
trash-restore                 # Restore from trash
trash-empty                   # Empty trash
```

### Networking

#### Network Scanning
```bash
# nmap
nmap 192.168.1.1              # Scan host
nmap 192.168.1.0/24           # Scan network
nmap -p 80,443 192.168.1.1    # Scan specific ports
rustscan 192.168.1.1          # Fast port scan
```

#### DNS Queries
```bash
# dog (modern dig)
dog example.com               # DNS lookup
dog example.com MX            # Query MX records
dog @8.8.8.8 example.com      # Use specific DNS server
```

#### Network Monitoring
```bash
bandwhich                     # Bandwidth by process (needs sudo)
nethogs                       # Network traffic per process
gping google.com              # Ping with graph
trippy google.com             # Modern traceroute
```

#### HTTP Testing
```bash
# httpie
http GET https://api.example.com
http POST https://api.example.com name=John
http --download https://example.com/file.zip

# xh (faster httpie alternative)
xh get https://api.example.com
xh post https://api.example.com name=John
```

### Web Browsing

#### Terminal Browsers
```bash
lynx https://example.com      # Classic browser
w3m https://example.com       # Alternative browser
links2 https://example.com    # Another option
```

#### RSS Feeds
```bash
newsboat                      # Open RSS reader
# Press 'r' to reload all feeds
# Press 'o' to open article
# Press 'q' to quit
```

#### Video Downloads
```bash
yt-dlp https://youtube.com/watch?v=xxx     # Download video
yt-dlp -x --audio-format mp3 URL           # Download as MP3
yt-dlp -F URL                              # List formats
yt-dlp -f best URL                         # Best quality
```

### Shell Enhancements

#### History Search
```bash
# atuin
atuin search "git commit"     # Search history
# Ctrl+R - Interactive search (if enabled)

# mcfly
# Ctrl+R - Smart history search
```

#### Terminal Multiplexing
```bash
# tmux
tmux                          # Start new session
tmux attach                   # Attach to session
# Ctrl+b % - Split vertically
# Ctrl+b " - Split horizontally
# Ctrl+b hjkl - Navigate panes

# zellij
zellij                        # Modern alternative
```

#### Cheatsheets
```bash
navi                          # Interactive cheatsheet
cheat tar                     # View cheat sheet
```

## Tips and Tricks

### 1. Combining Tools

```bash
# Find and process files
fd -e log | xargs bat         # View all log files

# Search and edit
vim $(rg -l "TODO")           # Edit files containing TODO

# Process JSON from API
curl api.example.com | jq '.data' | fzf
```

### 2. Shell Aliases

Add custom aliases in `home.nix`:

```nix
home.shellAliases = {
  update = "home-manager switch --flake ~/nix-home-manager-modern-console";
  cleanup = "nix-collect-garbage -d";
  myproject = "cd ~/Projects/myproject";
};
```

### 3. Git Workflow Optimization

```bash
# Quick daily workflow
git st                        # Check status
git add -p                    # Stage changes interactively
git cm "feat: add feature"    # Commit
git lg                        # Review history
git push                      # Push changes

# Using lazygit for visual workflow
lazygit                       # All operations in TUI
```

### 4. Efficient File Navigation

```bash
# Navigate with zoxide
z proj                        # Jump to project
zi                            # Interactive selection

# Find and navigate
cd $(fd -t d project | fzf)   # Find and cd to directory
```

### 5. System Maintenance

```bash
# Update everything
nix flake update
home-manager switch --flake .

# Clean up old generations
nix-collect-garbage -d

# Check what's installed
home-manager packages
```

## Troubleshooting

### Issue: Command not found after installation

**Solution:** Make sure to restart your shell or source the profile:
```bash
source ~/.profile
# or
source ~/.nix-profile/etc/profile.d/hm-session-vars.sh
```

### Issue: Git credentials not working

**Solution:** Configure git credentials:
```bash
git config --global credential.helper store
# or for ssh
ssh-keygen -t ed25519 -C "your.email@example.com"
gh auth login
```

### Issue: Tmux colors not working

**Solution:** Make sure your terminal supports 256 colors:
```bash
echo $TERM  # Should be something like xterm-256color
export TERM=xterm-256color
```

### Issue: Some tools not available

**Solution:** Check if the category is enabled in `home.nix`:
```nix
modern-console = {
  core-utils.enable = true;  # Make sure this is true
  # ... etc
};
```

### Issue: Configuration changes not applying

**Solution:** Rebuild and switch:
```bash
home-manager switch --flake .

# If that fails, try
home-manager switch --flake . --show-trace
```

### Getting Help

```bash
# TLDR pages for quick help
tldr <command>

# Man pages for detailed info
man <command>

# Command-specific help
<command> --help

# Cheatsheets
cheat <command>
navi                          # Interactive cheatsheets
```

## Next Steps

1. Customize `home.nix` to your preferences
2. Explore each tool's configuration in `modules/`
3. Add your own packages and configurations
4. Share your improvements!

For more information, see the [README](README.md).
