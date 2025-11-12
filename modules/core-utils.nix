{
  config,
  pkgs,
  lib,
  ...
}:

with lib;

let
  cfg = config.modern-console.core-utils;
in
{
  options.modern-console.core-utils = {
    enable = mkEnableOption ''
      modern core utilities that provide better alternatives to classic Unix tools.

      This module includes modern replacements for common command-line tools like
      `ls`, `cat`, `grep`, `find`, `du`, `df`, and many others. These tools offer
      improved performance, better defaults, and enhanced user interfaces with features
      like syntax highlighting, better formatting, and more intuitive options.

      **Key tools included:**
      - `ripgrep` - Fast recursive regex search
      - `fd` - Simple and fast alternative to `find`
      - `eza` - Modern `ls` replacement with colors and icons
      - `bat` - `cat` with syntax highlighting and Git integration
      - `zoxide` - Smarter `cd` command that learns your habits
      - `duf` - Better disk usage display than `df`
      - `dust` - Intuitive disk usage analyzer (better `du`)

      All tools are configured with sensible defaults and shell integrations.
    '';
  };

  config = mkIf cfg.enable {
    # 🔧 Modern Core Utilities - Better alternatives to classic Unix tools

    home.packages = with pkgs; [
      # 🔍 ripgrep - Modern grep alternative (recursively searches directories for a regex pattern)
      # Homepage: https://github.com/BurntSushi/ripgrep
      ripgrep

      # 🔎 fd - Modern find alternative (simple, fast and user-friendly alternative to find)
      # Homepage: https://github.com/sharkdp/fd
      fd

      # 📊 duf - Modern df alternative (disk usage/free utility with a better interface)
      # Homepage: https://github.com/muesli/duf
      duf

      # 💿 dust - Modern du alternative (more intuitive version of du)
      # Homepage: https://github.com/bootandy/dust
      du-dust

      # 📁 eza - Modern ls alternative (replacement for ls with more features and colors)
      # Homepage: https://github.com/eza-community/eza
      eza

      # 🐱 bat - Modern cat alternative (cat clone with syntax highlighting and Git integration)
      # Homepage: https://github.com/sharkdp/bat
      bat

      # 🦀 zoxide - Modern cd alternative (smarter cd command inspired by z and autojump)
      # Homepage: https://github.com/ajeetdsouza/zoxide
      zoxide

      # 🔗 procs - Modern ps alternative (replacement for ps written in Rust)
      # Homepage: https://github.com/dalance/procs
      procs

      # 📋 bottom (btm) alias as btop - Modern top alternative (graphical process/system monitor)
      # Homepage: https://github.com/ClementTsang/bottom
      bottom

      # 🗜️ ouch - Unified compression/decompression tool (handles multiple formats)
      # Homepage: https://github.com/ouch-org/ouch
      ouch

      # 📝 sd - Modern sed alternative (intuitive find & replace CLI)
      # Homepage: https://github.com/chmln/sd
      sd

      # 🔢 Choose - Modern cut/awk alternative (human-friendly alternative to cut and sometimes awk)
      # Homepage: https://github.com/theryangeary/choose
      choose

      # 🌳 broot - Modern tree alternative (new way to see and navigate directory trees)
      # Homepage: https://github.com/Canop/broot
      broot

      # ⚡ hyperfine - Command-line benchmarking tool
      # Homepage: https://github.com/sharkdp/hyperfine
      hyperfine

      # 🔐 age - Modern encryption tool (simple, modern alternative to GPG)
      # Homepage: https://github.com/FiloSottile/age
      age

      # 🧹 tokei - Count lines of code quickly
      # Homepage: https://github.com/XAMPPRocky/tokei
      tokei

      # 📦 xh - Friendly and fast tool for sending HTTP requests (modern HTTPie alternative)
      # Homepage: https://github.com/ducaale/xh
      xh
    ];

    # Configure bat with better defaults
    programs.bat = {
      enable = true;
      config = {
        theme = "TwoDark";
        pager = "less -FR";
      };
    };

    # Configure eza with aliases
    programs.eza = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
      git = true;
      icons = true;
    };

    # Configure zoxide
    programs.zoxide = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
    };

    # Configure broot
    programs.broot = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
    };
  };
}
