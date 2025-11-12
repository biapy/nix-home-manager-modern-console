{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.modern-console.shell;
in
{
  options.modern-console.shell = {
    enable = mkEnableOption ''
      modern shell enhancements and utilities.
      
      This module provides tools to enhance your shell experience including
      beautiful prompts, smart history search, terminal multiplexers, and
      shell utilities. It configures both Bash and Zsh with sensible defaults,
      productivity aliases, and integrations.
      
      **Key features:**
      - **Prompts:** Starship (with custom theme), powerline-go
      - **History:** Atuin (magical shell history), mcfly
      - **Multiplexers:** tmux, zellij, screen (with vim-like bindings)
      - **Utilities:** navi (cheatsheets), fzf alternative (skim)
      - **Development:** shellcheck, shfmt for linting/formatting
      - **Recording:** asciinema, vhs for terminal recordings
      - **Colorizers:** grc, ccze for colorful output
      
      Bash and Zsh are configured with history management, completion,
      syntax highlighting (Zsh), and productivity aliases.
    '';
  };

  config = mkIf cfg.enable {
    # 🐚 Shell Enhancements & Utilities

    home.packages = with pkgs; [
      # 🎨 Shell prompts
      # starship - Minimal, fast, and customizable prompt
      # Homepage: https://starship.rs/
      starship

      # 🌈 powerline-go - Beautiful and useful prompt generator
      # Homepage: https://github.com/justjanne/powerline-go
      powerline-go

      # 🔧 Shell utilities
      # atuin - Magical shell history
      # Homepage: https://atuin.sh/
      atuin

      # 📝 mcfly - Smart shell history search
      # Homepage: https://github.com/cantino/mcfly
      mcfly

      # 🎯 navi - Interactive cheatsheet tool
      # Homepage: https://github.com/denisidoro/navi
      navi

      # 🔍 skim - Fuzzy finder (Rust alternative to fzf)
      # Homepage: https://github.com/lotabout/skim
      skim

      # 🎨 Terminal multiplexers and session managers
      # tmux - Terminal multiplexer
      # Homepage: https://github.com/tmux/tmux
      tmux

      # 🚀 zellij - Modern terminal workspace
      # Homepage: https://zellij.dev/
      zellij

      # 📺 screen - Terminal multiplexer (classic)
      # Homepage: https://www.gnu.org/software/screen/
      screen

      # 🎭 Shell plugins and frameworks are language-specific
      # For zsh: oh-my-zsh, prezto, zinit
      # For bash: bash-it
      # These are typically managed separately

      # 🔧 Shell linting and formatting
      # shellcheck - Shell script static analysis tool
      # Homepage: https://www.shellcheck.net/
      shellcheck

      # 📝 shfmt - Shell script formatter
      # Homepage: https://github.com/mvdan/sh
      shfmt

      # 🎯 Task runners
      # task - Task runner and build tool
      # Homepage: https://taskfile.dev/
      go-task

      # 🔨 make - Build automation tool
      # Usually pre-installed

      # 📊 Performance and profiling
      # time - Time command execution
      # Usually built-in

      # ⏱️ ptime - Better time command
      # Not readily available in nixpkgs

      # 🎨 Terminal enhancements
      # tmate - Instant terminal sharing
      # Homepage: https://tmate.io/
      tmate

      # 📋 Terminal clipboard utilities
      # xclip - CLI clipboard for X11
      # Homepage: https://github.com/astrand/xclip
      xclip

      # 📋 wl-clipboard - CLI clipboard for Wayland
      # Homepage: https://github.com/bugaevc/wl-clipboard
      wl-clipboard

      # 🎨 Colorizers
      # grc - Generic colouriser
      # Homepage: https://github.com/garabik/grc
      grc

      # 🌈 ccze - Robust log colorizer
      # Homepage: https://github.com/cornet/ccze
      ccze

      # 📊 Terminal recording and playback
      # asciinema - Record and share terminal sessions
      # Homepage: https://asciinema.org/
      asciinema

      # 🎬 vhs - Write terminal GIFs as code
      # Homepage: https://github.com/charmbracelet/vhs
      vhs

      # 🔧 Terminal information
      # tput - Terminal capability interface
      # Usually pre-installed

      # 🎨 Fonts and icons (requires terminal support)
      # nerd-fonts - Iconic font aggregator
      # Note: Fonts are system-level, not in home packages
    ];

    # 🎨 Starship prompt configuration
    programs.starship = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      enableFishIntegration = true;

      settings = {
        # Prompt format
        format = lib.concatStrings [
          "$username"
          "$hostname"
          "$directory"
          "$git_branch"
          "$git_state"
          "$git_status"
          "$cmd_duration"
          "$line_break"
          "$python"
          "$rust"
          "$golang"
          "$nodejs"
          "$java"
          "$nix_shell"
          "$character"
        ];

        # Character symbols
        character = {
          success_symbol = "[➜](bold green)";
          error_symbol = "[➜](bold red)";
        };

        # Directory
        directory = {
          truncation_length = 3;
          truncate_to_repo = true;
          style = "bold cyan";
        };

        # Git branch
        git_branch = {
          symbol = "🌱 ";
          style = "bold purple";
        };

        # Git status
        git_status = {
          conflicted = "🏳";
          ahead = "⇡\${count}";
          behind = "⇣\${count}";
          diverged = "⇕⇡\${ahead_count}⇣\${behind_count}";
          untracked = "🤷";
          stashed = "📦";
          modified = "📝";
          staged = "✅";
          renamed = "👅";
          deleted = "🗑";
        };

        # Command duration
        cmd_duration = {
          min_time = 500;
          format = "took [$duration](bold yellow)";
        };

        # Language versions with emoji
        python.symbol = "🐍 ";
        rust.symbol = "🦀 ";
        golang.symbol = "🐹 ";
        nodejs.symbol = "⬢ ";
        java.symbol = "☕ ";

        # Nix shell indicator
        nix_shell = {
          symbol = "❄️ ";
          format = "via [$symbol$state]($style) ";
        };
      };
    };

    # 🐚 Bash configuration
    programs.bash = {
      enable = true;
      enableCompletion = true;

      historyControl = [ "ignoredups" "ignorespace" ];
      historyIgnore = [ "ls" "cd" "exit" ];

      shellOptions = [
        "histappend"
        "checkwinsize"
        "extglob"
        "globstar"
        "checkjobs"
      ];

      shellAliases = {
        # Navigation shortcuts
        ".." = "cd ..";
        "..." = "cd ../..";
        "...." = "cd ../../..";

        # Safety nets
        rm = "rm -i";
        cp = "cp -i";
        mv = "mv -i";

        # Colorful output
        grep = "grep --color=auto";
        egrep = "egrep --color=auto";
        fgrep = "fgrep --color=auto";

        # Shortcuts
        h = "history";
        c = "clear";

        # Git shortcuts (if not using git aliases)
        g = "git";
        gs = "git status";
        ga = "git add";
        gc = "git commit";
        gp = "git push";
        gl = "git pull";
      };

      initExtra = ''
        # Better history search
        bind '"\e[A": history-search-backward'
        bind '"\e[B": history-search-forward'
        
        # Enable ** recursive globbing
        shopt -s globstar
        
        # Case-insensitive completion
        bind 'set completion-ignore-case on'
        
        # Immediate history append
        PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
      '';
    };

    # 🐚 Zsh configuration (if users prefer zsh)
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      history = {
        size = 10000;
        save = 10000;
        ignoreDups = true;
        ignoreSpace = true;
        share = true;
      };

      shellAliases = {
        # Navigation shortcuts
        ".." = "cd ..";
        "..." = "cd ../..";
        "...." = "cd ../../..";

        # Safety nets
        rm = "rm -i";
        cp = "cp -i";
        mv = "mv -i";

        # Shortcuts
        h = "history";
        c = "clear";

        # Git shortcuts
        g = "git";
        gs = "git status";
        ga = "git add";
        gc = "git commit";
        gp = "git push";
        gl = "git pull";
      };

      initExtra = ''
        # Vi mode
        bindkey -v
        
        # Better history search
        bindkey '^R' history-incremental-search-backward
        
        # Edit command line
        autoload -Uz edit-command-line
        zle -N edit-command-line
        bindkey '^X^E' edit-command-line
      '';
    };

    # 📦 Tmux configuration
    programs.tmux = {
      enable = true;
      clock24 = true;
      keyMode = "vi";
      terminal = "screen-256color";
      historyLimit = 10000;

      extraConfig = ''
        # Enable mouse support
        set -g mouse on
        
        # Start window numbering at 1
        set -g base-index 1
        set -g pane-base-index 1
        
        # Renumber windows when one is closed
        set -g renumber-windows on
        
        # Increase scrollback buffer
        set -g history-limit 50000
        
        # Set escape time to 0
        set -sg escape-time 0
        
        # Enable true color
        set -ga terminal-overrides ",*256col*:Tc"
        
        # Better splitting
        bind | split-window -h -c "#{pane_current_path}"
        bind - split-window -v -c "#{pane_current_path}"
        
        # Vim-like pane navigation
        bind h select-pane -L
        bind j select-pane -D
        bind k select-pane -U
        bind l select-pane -R
        
        # Reload config
        bind r source-file ~/.config/tmux/tmux.conf \; display "Config reloaded!"
        
        # Copy mode bindings
        bind-key -T copy-mode-vi v send-keys -X begin-selection
        bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
      '';
    };

    # 📚 Atuin (shell history) configuration
    programs.atuin = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;

      settings = {
        auto_sync = true;
        sync_frequency = "5m";
        sync_address = "https://api.atuin.sh";
        search_mode = "fuzzy";
        filter_mode = "global";
        style = "compact";
        inline_height = 20;
        show_preview = true;
      };
    };

    # 🔧 Additional shell configuration
    home.sessionVariables = {
      # Editor
      EDITOR = "vim";
      VISUAL = "vim";

      # Pager
      PAGER = "less";
      LESS = "-R";

      # Colors in man pages
      LESS_TERMCAP_mb = "\\e[1;32m";
      LESS_TERMCAP_md = "\\e[1;32m";
      LESS_TERMCAP_me = "\\e[0m";
      LESS_TERMCAP_se = "\\e[0m";
      LESS_TERMCAP_so = "\\e[01;33m";
      LESS_TERMCAP_ue = "\\e[0m";
      LESS_TERMCAP_us = "\\e[1;4;31m";
    };
  };
}
