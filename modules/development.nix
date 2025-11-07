{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.modern-console.development;
in
{
  options.modern-console.development = {
    enable = mkEnableOption "development tools and git configuration";
  };

  config = mkIf cfg.enable {
    # 🛠️ Development Tools - Essential tools for software development

    home.packages = with pkgs; [
      # 🔧 Git-related tools
      # gh - GitHub CLI (official GitHub command line tool)
      # Homepage: https://cli.github.com/
      gh

      # 🔀 git-delta - Better git diff viewer with syntax highlighting
      # Homepage: https://github.com/dandavison/delta
      delta

      # 📊 lazygit - Simple terminal UI for git commands
      # Homepage: https://github.com/jesseduffield/lazygit
      lazygit

      # 🔍 gitui - Blazing fast terminal UI for git
      # Homepage: https://github.com/extrawurst/gitui
      gitui

      # 📝 gitmux - Git in your tmux status bar
      # Homepage: https://github.com/arl/gitmux
      gitmux

      # 🌳 tig - Text-mode interface for git
      # Homepage: https://jonas.github.io/tig/
      tig

      # 🔨 Build & Development tools
      # just - Command runner (better make alternative)
      # Homepage: https://github.com/casey/just
      just

      # 📦 direnv - Environment switcher for the shell
      # Homepage: https://direnv.net/
      direnv

      # 🔍 jq - Command-line JSON processor
      # Homepage: https://stedolan.github.io/jq/
      jq

      # 🔧 yq - Command-line YAML processor
      # Homepage: https://github.com/mikefarah/yq
      yq-go

      # 📊 glow - Markdown renderer for the terminal
      # Homepage: https://github.com/charmbracelet/glow
      glow

      # 🎨 mdcat - Sophisticated Markdown rendering for the terminal
      # Homepage: https://github.com/swsnr/mdcat
      mdcat

      # 🔍 difftastic - Structural diff tool
      # Homepage: https://github.com/Wilfred/difftastic
      difftastic

      # 📝 Code editors and utilities
      # micro - Modern terminal-based text editor
      # Homepage: https://micro-editor.github.io/
      micro

      # 🌐 License management
      # licensee - Detect license of project
      # Homepage: https://github.com/licensee/licensee
      # Note: Not available in nixpkgs, skipping

      # 📊 onefetch - Git repository summary in terminal
      # Homepage: https://github.com/o2sh/onefetch
      onefetch

      # 🚀 Performance and profiling
      # flamegraph - Stack trace visualizer
      # Homepage: https://github.com/flamegraph-rs/flamegraph
      # Note: Available via cargo-flamegraph
      cargo-flamegraph
    ];

    # 🔧 Git Configuration with Best Practices
    programs.git = {
      enable = true;
      
      # IMPORTANT: Users MUST set these values in their home.nix
      # Example:
      #   programs.git.userName = "Your Name";
      #   programs.git.userEmail = "your.email@example.com";
      userName = mkDefault "CHANGE-ME";
      userEmail = mkDefault "CHANGE-ME@example.com";

      # 📝 Git aliases for productivity
      aliases = {
        # Short aliases
        st = "status";
        co = "checkout";
        br = "branch";
        ci = "commit";
        cm = "commit -m";
        ca = "commit --amend";
        cane = "commit --amend --no-edit";
        
        # Logging
        lg = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
        ll = "log --pretty=format:'%C(yellow)%h%Cred%d %Creset%s%Cblue [%cn]' --decorate --numstat";
        lol = "log --graph --decorate --pretty=oneline --abbrev-commit";
        lola = "log --graph --decorate --pretty=oneline --abbrev-commit --all";
        
        # Diff
        df = "diff";
        dc = "diff --cached";
        
        # Stash
        sl = "stash list";
        sa = "stash apply";
        ss = "stash save";
        sp = "stash pop";
        
        # Undo last commit but keep changes
        undo = "reset HEAD~1 --mixed";
        
        # Show last commit
        last = "log -1 HEAD --stat";
        
        # List all aliases
        aliases = "config --get-regexp alias";
        
        # Show contributors
        contributors = "shortlog --summary --numbered";
        
        # Amend to last commit
        amend = "commit --amend --reuse-message=HEAD";
        
        # Interactive rebase
        rb = "rebase";
        rbi = "rebase -i";
        rbc = "rebase --continue";
        rba = "rebase --abort";
      };

      # 🎨 Better git diff with delta
      delta = {
        enable = true;
        options = {
          navigate = true;
          line-numbers = true;
          side-by-side = true;
          syntax-theme = "Dracula";
          features = "decorations";
          decorations = {
            commit-decoration-style = "bold yellow box ul";
            file-style = "bold yellow ul";
            file-decoration-style = "none";
          };
        };
      };

      # ⚙️ Git Configuration - Best Practices
      extraConfig = {
        # Core settings
        core = {
          editor = "vim";
          autocrlf = "input";
          whitespace = "trailing-space,space-before-tab";
          pager = "delta";
        };

        # Color settings
        color = {
          ui = "auto";
          branch = "auto";
          diff = "auto";
          status = "auto";
        };

        # Push settings
        push = {
          default = "simple";
          followTags = true;
          autoSetupRemote = true;
        };

        # Pull settings
        pull = {
          rebase = true;
        };

        # Fetch settings
        fetch = {
          prune = true;
          pruneTags = true;
        };

        # Rebase settings
        rebase = {
          autoStash = true;
          autoSquash = true;
        };

        # Merge settings
        merge = {
          conflictstyle = "diff3";
          tool = "vimdiff";
        };

        # Diff settings
        diff = {
          colorMoved = "default";
          algorithm = "histogram";
        };

        # Branch settings
        branch = {
          autoSetupRebase = "always";
        };

        # Status settings
        status = {
          showUntrackedFiles = "all";
        };

        # Help settings
        help = {
          autocorrect = 1;
        };

        # Init settings
        init = {
          defaultBranch = "main";
        };

        # Credential helper
        credential = {
          helper = "cache --timeout=3600";
        };

        # URL shortcuts for common services
        url = {
          "git@github.com:" = {
            insteadOf = "gh:";
          };
          "git@gitlab.com:" = {
            insteadOf = "gl:";
          };
        };
      };

      # 🚫 Global gitignore
      ignores = [
        # OS files
        ".DS_Store"
        "Thumbs.db"
        "Desktop.ini"
        
        # Editor files
        "*~"
        "*.swp"
        "*.swo"
        ".vscode/"
        ".idea/"
        "*.sublime-*"
        
        # Build artifacts
        "*.o"
        "*.pyc"
        "*.class"
        "*.log"
        ".gradle/"
        "build/"
        "dist/"
        "target/"
        
        # Dependencies
        "node_modules/"
        "vendor/"
        ".bundle/"
        
        # Environment
        ".env"
        ".env.local"
        ".direnv/"
        
        # Backup files
        "*.bak"
        "*.backup"
      ];
    };

    # 📂 direnv integration
    programs.direnv = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };

    # 📊 GitHub CLI configuration
    programs.gh = {
      enable = true;
      settings = {
        git_protocol = "ssh";
        editor = "vim";
        prompt = "enabled";
        pager = "less";
      };
    };

    # 🎨 Glow (Markdown viewer) configuration
    programs.glow = {
      enable = true;
    };
  };
}
