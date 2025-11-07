# 🛠️ Complete Tools Reference

This document provides a comprehensive reference of all tools included in this configuration, organized by category with emojis, descriptions, and homepage links.

## 📑 Table of Contents
- [Core Utilities](#-core-utilities)
- [Development Tools](#️-development-tools)
- [Networking Tools](#-networking-tools)
- [Text Processing](#-text-processing)
- [System Monitoring](#-system-monitoring)
- [File Management](#-file-management)
- [Web Browsing](#-web-browsing)
- [Shell Enhancements](#-shell-enhancements)

---

## 🔧 Core Utilities

Modern alternatives to traditional Unix command-line tools.

| Tool | Replaces | Description | Homepage |
|------|----------|-------------|----------|
| 🔍 **ripgrep** (`rg`) | `grep` | Fast recursive search tool | [GitHub](https://github.com/BurntSushi/ripgrep) |
| 🔎 **fd** | `find` | Simple, fast, user-friendly find alternative | [GitHub](https://github.com/sharkdp/fd) |
| 📊 **duf** | `df` | Better disk usage/free utility | [GitHub](https://github.com/muesli/duf) |
| 💿 **dust** | `du` | More intuitive disk usage analyzer | [GitHub](https://github.com/bootandy/dust) |
| 📁 **eza** | `ls` | Modern ls with colors and icons | [GitHub](https://github.com/eza-community/eza) |
| 🐱 **bat** | `cat` | Cat with syntax highlighting and Git integration | [GitHub](https://github.com/sharkdp/bat) |
| 🦀 **zoxide** | `cd` | Smarter cd that learns your habits | [GitHub](https://github.com/ajeetdsouza/zoxide) |
| 🔗 **procs** | `ps` | Modern process viewer | [GitHub](https://github.com/dalance/procs) |
| 📋 **bottom** (`btm`) | `top` | Graphical process/system monitor | [GitHub](https://github.com/ClementTsang/bottom) |
| 🗜️ **ouch** | `tar`, `unzip` | Unified compression/decompression | [GitHub](https://github.com/ouch-org/ouch) |
| 📝 **sd** | `sed` | Intuitive find & replace CLI | [GitHub](https://github.com/chmln/sd) |
| 🔢 **choose** | `cut`, `awk` | Human-friendly text column selector | [GitHub](https://github.com/theryangeary/choose) |
| 🌳 **broot** | `tree` | Better way to navigate directory trees | [GitHub](https://github.com/Canop/broot) |
| ⚡ **hyperfine** | `time` | Command-line benchmarking tool | [GitHub](https://github.com/sharkdp/hyperfine) |
| 🔐 **age** | `gpg` | Simple, modern encryption tool | [GitHub](https://github.com/FiloSottile/age) |
| 🧹 **tokei** | `cloc` | Fast code line counter | [GitHub](https://github.com/XAMPPRocky/tokei) |
| 📦 **xh** | `curl`, `httpie` | Fast HTTP client | [GitHub](https://github.com/ducaale/xh) |

---

## 🛠️ Development Tools

Essential tools for software development and Git best practices.

### Git Tools

| Tool | Description | Homepage |
|------|-------------|----------|
| 🔀 **delta** | Syntax-highlighting pager for git and diff | [GitHub](https://github.com/dandavison/delta) |
| 📊 **lazygit** | Simple terminal UI for git | [GitHub](https://github.com/jesseduffield/lazygit) |
| 🔍 **gitui** | Blazing fast terminal UI for git | [GitHub](https://github.com/extrawurst/gitui) |
| 🌳 **tig** | Text-mode interface for git | [Homepage](https://jonas.github.io/tig/) |
| 📝 **gitmux** | Git status in tmux status bar | [GitHub](https://github.com/arl/gitmux) |
| 📊 **onefetch** | Git repository summary in terminal | [GitHub](https://github.com/o2sh/onefetch) |
| 🔍 **difftastic** | Structural diff tool | [GitHub](https://github.com/Wilfred/difftastic) |

### GitHub

| Tool | Description | Homepage |
|------|-------------|----------|
| 🔧 **gh** | Official GitHub CLI tool | [Homepage](https://cli.github.com/) |

### Build & Task Tools

| Tool | Description | Homepage |
|------|-------------|----------|
| 🔨 **just** | Modern command runner | [GitHub](https://github.com/casey/just) |
| 📦 **direnv** | Environment switcher for the shell | [Homepage](https://direnv.net/) |

### Data Processing

| Tool | Description | Homepage |
|------|-------------|----------|
| 🔍 **jq** | Command-line JSON processor | [Homepage](https://stedolan.github.io/jq/) |
| 🔧 **yq** | Command-line YAML processor | [GitHub](https://github.com/mikefarah/yq) |

### Documentation

| Tool | Description | Homepage |
|------|-------------|----------|
| 📊 **glow** | Render markdown in the terminal | [GitHub](https://github.com/charmbracelet/glow) |
| 🎨 **mdcat** | Sophisticated markdown rendering | [GitHub](https://github.com/swsnr/mdcat) |

### Editors

| Tool | Description | Homepage |
|------|-------------|----------|
| 📝 **micro** | Modern terminal-based text editor | [Homepage](https://micro-editor.github.io/) |

### Performance

| Tool | Description | Homepage |
|------|-------------|----------|
| 🚀 **cargo-flamegraph** | Stack trace visualizer | [GitHub](https://github.com/flamegraph-rs/flamegraph) |

---

## 🌐 Networking Tools

Network exploration, security, and diagnostics.

### Network Scanning

| Tool | Description | Homepage |
|------|-------------|----------|
| 🔍 **nmap** | Network exploration and security scanner | [Homepage](https://nmap.org/) |
| 🔐 **rustscan** | Fast port scanner | [GitHub](https://github.com/RustScan/RustScan) |
| 🔒 **ssh-audit** | SSH server & client security auditing | [GitHub](https://github.com/jtesta/ssh-audit) |

### DNS & HTTP

| Tool | Description | Homepage |
|------|-------------|----------|
| 🌐 **dog** | Modern DNS client (dig alternative) | [Homepage](https://dns.lookup.dog/) |
| 🌍 **httpie** | User-friendly HTTP client | [Homepage](https://httpie.io/) |
| 🚀 **curlie** | HTTPie-like frontend to curl | [GitHub](https://github.com/rs/curlie) |

### Network Monitoring

| Tool | Description | Homepage |
|------|-------------|----------|
| 🔌 **bandwhich** | Terminal bandwidth utilization tool | [GitHub](https://github.com/imsnif/bandwhich) |
| 📡 **trippy** | Modern traceroute tool | [GitHub](https://github.com/fujiapple852/trippy) |
| 🔗 **mtr** | Network diagnostic tool (traceroute + ping) | [Homepage](https://www.bitwizard.nl/mtr/) |
| 📊 **gping** | Ping with a graph | [GitHub](https://github.com/orf/gping) |

### File Transfer

| Tool | Description | Homepage |
|------|-------------|----------|
| 📥 **aria2** | Multi-protocol download utility | [Homepage](https://aria2.github.io/) |

### Tunneling & Certificates

| Tool | Description | Homepage |
|------|-------------|----------|
| 🌍 **bore-cli** | Tunnel tool for exposing localhost | [GitHub](https://github.com/ekzhang/bore) |
| 🔒 **mkcert** | Make locally trusted development certificates | [GitHub](https://github.com/FiloSottile/mkcert) |

### WebSocket

| Tool | Description | Homepage |
|------|-------------|----------|
| 🌐 **websocat** | WebSocket client/server | [GitHub](https://github.com/vi/websocat) |

---

## 📝 Text Processing

Advanced text manipulation and processing tools.

### Text Extraction & Manipulation

| Tool | Description | Homepage |
|------|-------------|----------|
| ✂️ **tuc** | Cut text like never before | [GitHub](https://github.com/riquito/tuc) |
| 🏷️ **f2** | Command-line batch renaming tool | [GitHub](https://github.com/ayoisaiah/f2) |
| 📝 **grex** | Generate regex from test cases | [GitHub](https://github.com/pemistahl/grex) |
| 🔤 **recode** | Charset converter | [GitHub](https://github.com/rrthomas/recode) |

### Data Processing

| Tool | Description | Homepage |
|------|-------------|----------|
| 📊 **csvkit** | Suite of CSV utilities | [Homepage](https://csvkit.readthedocs.io/) |
| 📋 **miller** (`mlr`) | Process CSV, JSON, and other formats | [Homepage](https://miller.readthedocs.io/) |
| 🔢 **jless** | Command-line JSON viewer | [GitHub](https://github.com/PaulJuliusMartinez/jless) |
| 📊 **visidata** | Terminal spreadsheet multitool | [Homepage](https://www.visidata.org/) |

### Document Conversion

| Tool | Description | Homepage |
|------|-------------|----------|
| 📄 **pandoc** | Universal document converter | [Homepage](https://pandoc.org/) |

### Search & Filter

| Tool | Description | Homepage |
|------|-------------|----------|
| 🔍 **fzf** | Command-line fuzzy finder | [GitHub](https://github.com/junegunn/fzf) |
| 🎯 **peco** | Simplistic interactive filtering tool | [GitHub](https://github.com/peco/peco) |

### Documentation

| Tool | Description | Homepage |
|------|-------------|----------|
| 🔤 **tealdeer** (`tldr`) | Fast TLDR client (simplified man pages) | [GitHub](https://github.com/dbrgn/tealdeer) |
| 📖 **cheat** | Interactive cheatsheet viewer | [GitHub](https://github.com/cheat/cheat) |

### Writing & Linting

| Tool | Description | Homepage |
|------|-------------|----------|
| ✏️ **vale** | Syntax-aware linter for prose | [Homepage](https://vale.sh/) |
| 🎨 **prettier** | Code formatter for multiple languages | [Homepage](https://prettier.io/) |

### PDF & Media

| Tool | Description | Homepage |
|------|-------------|----------|
| 🔍 **pdfgrep** | Search PDFs for text | [Homepage](https://pdfgrep.org/) |
| 📄 **poppler_utils** | PDF utilities (pdftotext, etc.) | [Homepage](https://poppler.freedesktop.org/) |
| 🖼️ **imagemagick** | Image manipulation CLI | [Homepage](https://imagemagick.org/) |

### Fun & Decorative

| Tool | Description | Homepage |
|------|-------------|----------|
| 🔠 **figlet** | ASCII art text generator | [Homepage](http://www.figlet.org/) |
| 🌈 **lolcat** | Rainbow text colorizer | [GitHub](https://github.com/busyloop/lolcat) |
| 📊 **termgraph** | Draw graphs in terminal | [GitHub](https://github.com/mkaz/termgraph) |
| 🔤 **ascii** | Show ASCII table | [Homepage](http://www.catb.org/~esr/ascii/) |

---

## 📊 System Monitoring

Monitor and diagnose your system performance and hardware.

### Process Monitors

| Tool | Description | Homepage |
|------|-------------|----------|
| 📊 **btop** | Modern resource monitor | [GitHub](https://github.com/aristocratos/btop) |
| 💻 **htop** | Interactive process viewer | [Homepage](https://htop.dev/) |
| 🎨 **glances** | Cross-platform monitoring tool | [Homepage](https://nicolargo.github.io/glances/) |
| 📈 **gotop** | Terminal graphical activity monitor | [GitHub](https://github.com/xxxserxxx/gotop) |
| 📊 **nmon** | Performance monitoring tool | [Homepage](http://nmon.sourceforge.net/) |

### System Information

| Tool | Description | Homepage |
|------|-------------|----------|
| 🖥️ **neofetch** | System information with ASCII art | [GitHub](https://github.com/dylanaraps/neofetch) |
| 🎨 **fastfetch** | Faster neofetch alternative | [GitHub](https://github.com/fastfetch-cli/fastfetch) |
| 📊 **inxi** | Full system information script | [GitHub](https://github.com/smxi/inxi) |
| 🖥️ **screenfetch** | System info with ASCII art | [GitHub](https://github.com/KittyKatt/screenFetch) |

### Hardware Monitoring

| Tool | Description | Homepage |
|------|-------------|----------|
| 🔌 **cyme** | Modern lsusb (list USB devices) | [GitHub](https://github.com/tuna-f1sh/cyme) |
| 🌡️ **nvtop** | NVIDIA GPU process monitor | [GitHub](https://github.com/Syllo/nvtop) |
| 🔋 **acpi** | Battery and thermal information | [Homepage](https://sourceforge.net/projects/acpiclient/) |
| 🌡️ **lm_sensors** | Hardware monitoring (temp, voltage, fans) | [GitHub](https://github.com/lm-sensors/lm-sensors) |
| 💾 **smartmontools** | Hard drive health monitoring | [Homepage](https://www.smartmontools.org/) |
| 🔍 **dmidecode** | DMI/SMBIOS table decoder | [Homepage](https://www.nongnu.org/dmidecode/) |

### I/O & Network Monitoring

| Tool | Description | Homepage |
|------|-------------|----------|
| 📊 **sysstat** | Performance monitoring tools (sar, iostat) | [GitHub](https://github.com/sysstat/sysstat) |
| 💾 **iotop** | I/O monitoring | [Homepage](http://guichaz.free.fr/iotop/) |
| 🌐 **nethogs** | Network bandwidth per process | [GitHub](https://github.com/raboof/nethogs) |
| 📊 **dstat** | Versatile resource statistics | [Homepage](http://dag.wiee.rs/home-made/dstat/) |

### Debugging & Tracing

| Tool | Description | Homepage |
|------|-------------|----------|
| 🔍 **strace** | System call tracer | [Homepage](https://strace.io/) |
| 🔧 **ltrace** | Library call tracer | [Homepage](https://ltrace.org/) |
| 🐛 **gdb** | GNU debugger | [Homepage](https://www.gnu.org/software/gdb/) |
| 🔍 **lsof** | List open files | [GitHub](https://github.com/lsof-org/lsof) |

### Benchmarking & Stress Testing

| Tool | Description | Homepage |
|------|-------------|----------|
| 📊 **sysbench** | System performance benchmark | [GitHub](https://github.com/akopytov/sysbench) |
| 💻 **stress** | Stress testing tool | [Homepage](https://people.seas.harvard.edu/~apw/stress/) |
| 🎯 **stress-ng** | Modernized stress tool | [GitHub](https://github.com/ColinIanKing/stress-ng) |

### Hardware Info

| Tool | Description | Homepage |
|------|-------------|----------|
| 🔍 **pciutils** | PCI utilities (lspci) | [Homepage](https://mj.ucw.cz/sw/pciutils/) |
| 🔌 **usbutils** | USB utilities (lsusb) | [Homepage](http://www.linux-usb.org/) |

---

## 📁 File Management

File managers, synchronization, and manipulation tools.

### File Managers

| Tool | Description | Homepage |
|------|-------------|----------|
| 📂 **ranger** | Vim-inspired file manager | [Homepage](https://ranger.github.io/) |
| 🎯 **nnn** | Blazing-fast terminal file manager | [GitHub](https://github.com/jarun/nnn) |
| 🦀 **lf** | Terminal file manager in Go | [GitHub](https://github.com/gokcehan/lf) |
| 🎨 **mc** | Midnight Commander (dual-pane) | [Homepage](https://midnight-commander.org/) |

### File Search

| Tool | Description | Homepage |
|------|-------------|----------|
| 🔍 **mlocate** | Fast file search with database | [Homepage](https://pagure.io/mlocate) |
| 🔎 **plocate** | Much faster locate | [Homepage](https://plocate.sesse.net/) |

### Synchronization & Backup

| Tool | Description | Homepage |
|------|-------------|----------|
| 🗂️ **rsync** | Fast incremental file transfer | [Homepage](https://rsync.samba.org/) |
| ☁️ **rclone** | Sync files to cloud storage | [Homepage](https://rclone.org/) |
| 📦 **restic** | Fast, secure backup program | [Homepage](https://restic.net/) |
| 📊 **borgbackup** | Deduplicating backup program | [Homepage](https://www.borgbackup.org/) |

### Compression & Archives

| Tool | Description | Homepage |
|------|-------------|----------|
| 🔐 **p7zip** | 7-Zip file archiver | [Homepage](https://p7zip.sourceforge.net/) |
| 🗜️ **unzip** | Extraction utility for .zip | [Homepage](http://www.info-zip.org/UnZip.html) |
| 📦 **zip** | Compression utility | [Homepage](http://www.info-zip.org/Zip.html) |
| 🔧 **atool** | Archive tool wrapper | [Homepage](https://www.nongnu.org/atool/) |

### Disk Usage

| Tool | Description | Homepage |
|------|-------------|----------|
| 📊 **ncdu** | NCurses disk usage analyzer | [Homepage](https://dev.yorhel.nl/ncdu) |

### File Operations

| Tool | Description | Homepage |
|------|-------------|----------|
| 🗑️ **trash-cli** | Command-line trash utility | [GitHub](https://github.com/andreafrancia/trash-cli) |
| 🔍 **tree** | Display directory tree | [Homepage](http://mama.indstate.edu/users/ice/tree/) |

### Diff & Merge

| Tool | Description | Homepage |
|------|-------------|----------|
| 📊 **diff-so-fancy** | Good-looking diffs | [GitHub](https://github.com/so-fancy/diff-so-fancy) |
| 🔍 **colordiff** | Colored diff output | [Homepage](https://www.colordiff.org/) |

### File Watchers

| Tool | Description | Homepage |
|------|-------------|----------|
| 📝 **watchexec** | Execute commands when files change | [GitHub](https://github.com/watchexec/watchexec) |
| 🔄 **entr** | Run commands when files change | [Homepage](https://eradman.com/entrproject/) |
| 🎯 **inotify-tools** | File system event monitoring | [GitHub](https://github.com/inotify-tools/inotify-tools) |

### File Integrity & Hashing

| Tool | Description | Homepage |
|------|-------------|----------|
| 🔧 **rhash** | Calculate/verify hash sums | [GitHub](https://github.com/rhash/RHash) |
| 📊 **xxhash** | Extremely fast hash algorithm | [GitHub](https://github.com/Cyan4973/xxHash) |

### Metadata & Conversion

| Tool | Description | Homepage |
|------|-------------|----------|
| 🎨 **exiftool** | Read/write file metadata | [Homepage](https://exiftool.org/) |
| 📄 **dos2unix** | Line ending converters | [Homepage](https://waterlan.home.xs4all.nl/dos2unix.html) |
| 🔍 **mediainfo** | Media file information | [Homepage](https://mediaarea.net/MediaInfo) |
| 🎬 **ffmpeg** | Media file converter/processor | [Homepage](https://ffmpeg.org/) |

---

## 🌐 Web Browsing

Terminal web browsers and related utilities.

### Web Browsers

| Tool | Description | Homepage |
|------|-------------|----------|
| 🦎 **lynx** | Classic terminal web browser | [Homepage](https://lynx.invisible-island.net/) |
| 🌍 **w3m** | Text-based web browser | [Homepage](http://w3m.sourceforge.net/) |
| 🔍 **links2** | Text and graphics browser | [Homepage](http://links.twibright.com/) |
| 🎯 **elinks** | Advanced text web browser | [Homepage](http://elinks.or.cz/) |

### HTML Processing

| Tool | Description | Homepage |
|------|-------------|----------|
| 📄 **html-xml-utils** | HTML/XML manipulation utilities | [Homepage](https://www.w3.org/Tools/HTML-XML-utils/) |
| 🔍 **pup** | Parse HTML at command line | [GitHub](https://github.com/ericchiang/pup) |
| 🌐 **htmlq** | jq for HTML | [GitHub](https://github.com/mgdm/htmlq) |

### RSS/Feed Readers

| Tool | Description | Homepage |
|------|-------------|----------|
| 📰 **newsboat** | RSS/Atom feed reader | [Homepage](https://newsboat.org/) |
| 📡 **rsstail** | Monitor RSS feeds | [Homepage](https://www.vanheusden.com/rsstail/) |

### Media

| Tool | Description | Homepage |
|------|-------------|----------|
| 🌐 **yt-dlp** | Download videos from YouTube and others | [GitHub](https://github.com/yt-dlp/yt-dlp) |
| 🎬 **mpv** | Media player | [Homepage](https://mpv.io/) |

### Terminal Image Viewers

| Tool | Description | Homepage |
|------|-------------|----------|
| 🖼️ **viu** | View images in terminal | [GitHub](https://github.com/atanunq/viu) |
| 🎨 **chafa** | Terminal graphics/image viewer | [Homepage](https://hpjansson.org/chafa/) |
| 📊 **timg** | Terminal image viewer | [GitHub](https://github.com/hzeller/timg) |

---

## 🐚 Shell Enhancements

Modern shell tools, prompts, and utilities.

### Prompts

| Tool | Description | Homepage |
|------|-------------|----------|
| 🎨 **starship** | Fast, customizable prompt | [Homepage](https://starship.rs/) |
| 🌈 **powerline-go** | Beautiful prompt generator | [GitHub](https://github.com/justjanne/powerline-go) |

### History

| Tool | Description | Homepage |
|------|-------------|----------|
| 🔧 **atuin** | Magical shell history | [Homepage](https://atuin.sh/) |
| 📝 **mcfly** | Smart shell history search | [GitHub](https://github.com/cantino/mcfly) |

### Navigation & Search

| Tool | Description | Homepage |
|------|-------------|----------|
| 🎯 **navi** | Interactive cheatsheet tool | [GitHub](https://github.com/denisidoro/navi) |
| 🔍 **skim** | Fuzzy finder (Rust fzf alternative) | [GitHub](https://github.com/lotabout/skim) |

### Terminal Multiplexers

| Tool | Description | Homepage |
|------|-------------|----------|
| 🎨 **tmux** | Terminal multiplexer | [GitHub](https://github.com/tmux/tmux) |
| 🚀 **zellij** | Modern terminal workspace | [Homepage](https://zellij.dev/) |
| 📺 **screen** | Terminal multiplexer (classic) | [Homepage](https://www.gnu.org/software/screen/) |

### Linting & Formatting

| Tool | Description | Homepage |
|------|-------------|----------|
| 🔧 **shellcheck** | Shell script static analysis | [Homepage](https://www.shellcheck.net/) |
| 📝 **shfmt** | Shell script formatter | [GitHub](https://github.com/mvdan/sh) |

### Task Runners

| Tool | Description | Homepage |
|------|-------------|----------|
| 🎯 **go-task** | Task runner and build tool | [Homepage](https://taskfile.dev/) |

### Terminal Sharing

| Tool | Description | Homepage |
|------|-------------|----------|
| 🎨 **tmate** | Instant terminal sharing | [Homepage](https://tmate.io/) |

### Clipboard

| Tool | Description | Homepage |
|------|-------------|----------|
| 📋 **xclip** | CLI clipboard for X11 | [GitHub](https://github.com/astrand/xclip) |
| 📋 **wl-clipboard** | CLI clipboard for Wayland | [GitHub](https://github.com/bugaevc/wl-clipboard) |

### Colorizers

| Tool | Description | Homepage |
|------|-------------|----------|
| 🎨 **grc** | Generic colouriser | [GitHub](https://github.com/garabik/grc) |
| 🌈 **ccze** | Robust log colorizer | [GitHub](https://github.com/cornet/ccze) |

### Recording

| Tool | Description | Homepage |
|------|-------------|----------|
| 📊 **asciinema** | Record and share terminal sessions | [Homepage](https://asciinema.org/) |
| 🎬 **vhs** | Write terminal GIFs as code | [GitHub](https://github.com/charmbracelet/vhs) |

---

## 📚 Additional Resources

### Learning Resources
- [Modern Unix Tools](https://github.com/ibraheemdev/modern-unix) - Comprehensive list of modern Unix tools
- [Command Line Text Processing](https://github.com/learnbyexample/Command-line-text-processing) - Text processing tutorials
- [The Art of Command Line](https://github.com/jlevy/the-art-of-command-line) - Command line mastery guide

### Configuration References
- [Nix Pills](https://nixos.org/guides/nix-pills/) - Learn Nix in depth
- [Home Manager Manual](https://nix-community.github.io/home-manager/) - Official documentation
- [NixOS Wiki](https://nixos.wiki/) - Community wiki

### Tool Collections
- [awesome-cli-apps](https://github.com/agarrharr/awesome-cli-apps) - Curated CLI applications
- [terminals-are-sexy](https://github.com/k4m4/terminals-are-sexy) - Terminal tools and resources
- [awesome-shell](https://github.com/alebcay/awesome-shell) - Command-line frameworks and tools

---

**Total Tools**: 150+ modern command-line tools organized across 8 categories! 🎉
