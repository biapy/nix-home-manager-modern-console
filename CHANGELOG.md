# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.0.0] - 2025-11-07

### 🎉 Initial Release

This is the first release of the Modern Console & TUI Tools Home Manager configuration!

### ✨ Added

#### 🔧 Core Utilities Module
- Modern Unix tool alternatives: ripgrep, fd, eza, bat, duf, dust, zoxide, procs, bottom
- Compression tools: ouch
- Text manipulation: sd, choose
- Navigation: broot
- Utilities: hyperfine, age, tokei, xh

#### 🛠️ Development Module
- Git configuration with best practices
- Git tools: delta, lazygit, gitui, tig, gitmux, onefetch, difftastic
- GitHub CLI (gh)
- Build tools: just, direnv
- Data processors: jq, yq-go
- Documentation: glow, mdcat
- Editor: micro
- Performance: cargo-flamegraph

#### 🌐 Networking Module
- Network scanning: nmap, rustscan, ssh-audit
- DNS & HTTP: dog, httpie, curlie
- Monitoring: bandwhich, trippy, mtr, gping
- File transfer: aria2
- Tunneling: bore-cli
- Certificates: mkcert
- WebSocket: websocat

#### 📝 Text Processing Module
- Text manipulation: tuc, f2, grex, recode
- Data processing: csvkit, miller, jless, visidata
- Document conversion: pandoc
- Search & filter: fzf, peco
- Documentation: tealdeer, cheat
- Linting: vale, prettier
- PDF tools: pdfgrep, poppler_utils
- Media: imagemagick
- Fun tools: figlet, lolcat, termgraph, ascii

#### 📊 System Monitoring Module
- Process monitors: btop, htop, glances, gotop, nmon
- System info: neofetch, fastfetch, inxi, screenfetch
- Hardware monitoring: cyme, nvtop, acpi, lm_sensors, smartmontools, dmidecode
- I/O monitoring: sysstat, iotop, nethogs, dstat
- Debugging: strace, ltrace, gdb, lsof
- Benchmarking: sysbench, stress, stress-ng
- Hardware info: pciutils, usbutils

#### 📁 File Management Module
- File managers: ranger, nnn, lf, mc
- File search: mlocate, plocate
- Synchronization: rsync, rclone, restic, borgbackup
- Compression: p7zip, unzip, zip, atool
- Disk usage: ncdu
- File operations: trash-cli, tree
- Diff tools: diff-so-fancy, colordiff
- File watchers: watchexec, entr, inotify-tools
- Hashing: rhash, xxhash
- Metadata: exiftool, dos2unix, mediainfo, ffmpeg

#### 🌐 Web Browsing Module
- Browsers: lynx, w3m, links2, elinks
- HTML processing: html-xml-utils, pup, htmlq
- RSS readers: newsboat, rsstail
- Media: yt-dlp, mpv
- Image viewers: viu, chafa, timg

#### 🐚 Shell Module
- Prompts: starship, powerline-go
- History: atuin, mcfly
- Navigation: navi, skim
- Multiplexers: tmux, zellij, screen
- Linting: shellcheck, shfmt
- Task runners: go-task
- Sharing: tmate
- Clipboard: xclip, wl-clipboard
- Colorizers: grc, ccze
- Recording: asciinema, vhs

#### 📚 Documentation
- Comprehensive README.md with feature overview and quick start
- Detailed USAGE.md with examples for all tool categories
- Complete TOOLS.md reference with 150+ tools
- CONTRIBUTING.md guide for contributors
- Example configuration file
- Makefile with convenience commands
- EditorConfig for consistent formatting

#### 🎯 Features
- Modular organization with 8 categories
- Enable/disable individual categories
- Git best practices and useful aliases
- Modern shell configurations (bash, zsh)
- Nix flakes support
- UTF-8 emoji annotations throughout
- Homepage links for all tools
- Clean code organization

### 🔧 Configuration Highlights

- **Git Configuration**: 30+ useful aliases, delta integration, best-practice settings
- **Shell Integration**: Starship prompt, atuin history, tmux configuration
- **Tool Integrations**: bat themes, eza colors, fzf with fd integration
- **Safety Features**: Trash-cli instead of rm, interactive file operations
- **Developer Experience**: direnv, just, comprehensive git workflow

### 📦 Total Package Count
- 150+ modern command-line tools
- Organized across 8 functional categories
- All configurable via simple enable/disable options

### 🎨 Design Principles
- Clean code with clear organization
- UTF-8 emojis for visual navigation
- Homepage links for all tools
- Best practices built-in
- Modular and extensible architecture

---

## Version History

### How to Use This Changelog

This changelog tracks all significant changes to the project. Each version includes:
- **Added**: New features, tools, or modules
- **Changed**: Updates to existing functionality
- **Deprecated**: Features that will be removed in future versions
- **Removed**: Features that have been removed
- **Fixed**: Bug fixes
- **Security**: Security-related changes

### Contributing

When contributing, please update this changelog following the [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) format.

[Unreleased]: https://github.com/biapy/nix-home-manager-modern-console/compare/v1.0.0...HEAD
[1.0.0]: https://github.com/biapy/nix-home-manager-modern-console/releases/tag/v1.0.0
