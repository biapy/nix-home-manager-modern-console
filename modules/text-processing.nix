{
  config,
  pkgs,
  lib,
  ...
}:

with lib;

let
  cfg = config.modern-console.text-processing;
in
{
  options.modern-console.text-processing = {
    enable = mkEnableOption ''
      text processing and manipulation tools.

      This module provides tools for text manipulation, structured data processing,
      fuzzy finding, document conversion, and text utilities. It covers everything
      from simple text cutting to complex CSV/JSON processing and document conversion.

      **Key features:**
      - **Text Manipulation:** tuc, f2 (batch renaming), sd (modern sed)
      - **Structured Data:** miller, csvkit for CSV/JSON processing
      - **Interactive Tools:** fzf (fuzzy finder), peco, jless (JSON viewer)
      - **Document Conversion:** pandoc (universal converter), poppler_utils
      - **Cheatsheets:** tealdeer (tldr), cheat for quick command references
      - **Linting:** vale for prose linting, prettier for formatting
      - **Utilities:** figlet (ASCII art), grex (regex generator)
      - **Spreadsheets:** visidata (terminal spreadsheet tool)
      - **PDF Tools:** pdfgrep for searching PDFs
      - **Visualization:** termgraph for drawing graphs

      fzf is configured with fd integration, sensible defaults, and
      shell integrations for Ctrl+R history search and file finding.
    '';
  };

  config = mkIf cfg.enable {
    # 📝 Text Processing & Manipulation Tools

    home.packages = with pkgs; [
      # ✂️ tuc - Cut text (and more) like never before
      # Homepage: https://github.com/riquito/tuc
      tuc

      # 🏷️ f2 - Command-line batch renaming tool
      # Homepage: https://github.com/ayoisaiah/f2
      f2

      # 📊 csvkit - Suite of utilities for working with CSV
      # Homepage: https://csvkit.readthedocs.io/
      csvkit

      # 📋 miller (mlr) - Tool for processing CSV, JSON, and other formats
      # Homepage: https://miller.readthedocs.io/
      miller

      # 🔤 tealdeer (tldr) - Fast TLDR client (simplified man pages)
      # Homepage: https://github.com/dbrgn/tealdeer
      tealdeer

      # 📖 cheat - Create and view interactive cheatsheets
      # Homepage: https://github.com/cheat/cheat
      cheat

      # 🔍 fzf - Command-line fuzzy finder
      # Homepage: https://github.com/junegunn/fzf
      fzf

      # 🎯 peco - Simplistic interactive filtering tool
      # Homepage: https://github.com/peco/peco
      peco

      # 🔢 jless - Command-line JSON viewer
      # Homepage: https://github.com/PaulJuliusMartinez/jless
      jless

      # 📄 pandoc - Universal document converter
      # Homepage: https://pandoc.org/
      pandoc

      # ✏️ vale - Syntax-aware linter for prose
      # Homepage: https://vale.sh/
      vale

      # 🎨 prettier - Code formatter (useful for JSON, YAML, Markdown)
      # Homepage: https://prettier.io/
      nodePackages.prettier

      # 🔠 figlet - ASCII art text generator
      # Homepage: http://www.figlet.org/
      figlet

      # 🌈 lolcat - Rainbow text colorizer
      # Homepage: https://github.com/busyloop/lolcat
      lolcat

      # 📝 grex - Generate regular expressions from test cases
      # Homepage: https://github.com/pemistahl/grex
      grex

      # 🔤 recode - Charset converter
      # Homepage: https://github.com/rrthomas/recode
      recode

      # 📊 VisiData - Terminal spreadsheet multitool
      # Homepage: https://www.visidata.org/
      visidata

      # 🔍 pdfgrep - Search PDFs for text
      # Homepage: https://pdfgrep.org/
      pdfgrep

      # 📄 poppler_utils - PDF utilities (pdftotext, etc.)
      # Homepage: https://poppler.freedesktop.org/
      poppler_utils

      # 🖼️ ImageMagick - Image manipulation CLI
      # Homepage: https://imagemagick.org/
      imagemagick

      # 📊 termgraph - Draw graphs in terminal
      # Homepage: https://github.com/mkaz/termgraph
      python3Packages.termgraph

      # 🔤 ascii - Show ASCII table
      # Homepage: http://www.catb.org/~esr/ascii/
      ascii
    ];

    # 🔍 fzf configuration
    programs.fzf = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      enableFishIntegration = true;

      defaultCommand = "fd --type f --hidden --follow --exclude .git";
      defaultOptions = [
        "--height 40%"
        "--layout=reverse"
        "--border"
        "--inline-info"
      ];

      fileWidgetCommand = "fd --type f --hidden --follow --exclude .git";
      changeDirWidgetCommand = "fd --type d --hidden --follow --exclude .git";
    };

    # 📋 Tealdeer (tldr) configuration
    # Auto-update the cache
    home.activation.updateTldr = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      $DRY_RUN_CMD ${pkgs.tealdeer}/bin/tldr --update || true
    '';
  };
}
