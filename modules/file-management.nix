{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.modern-console.file-management;
in
{
  options.modern-console.file-management = {
    enable = mkEnableOption ''
      file management and synchronization tools.
      
      This module provides comprehensive file management capabilities including
      terminal file managers, backup tools, archiving utilities, file watchers,
      and synchronization tools. It includes both traditional and modern tools
      for all file-related operations.
      
      **Key features:**
      - **File Managers:** ranger, nnn, lf, mc (configured with plugins)
      - **Search & Indexing:** mlocate, plocate for fast file searches
      - **Synchronization:** rsync, rclone (cloud), borgbackup
      - **Backup:** restic, borg (deduplicating backups)
      - **Archiving:** ouch, p7zip, zip/unzip, atool (universal wrapper)
      - **Watchers:** watchexec, entr, inotify-tools
      - **Utilities:** trash-cli (safe deletion), tree, exiftool
      - **Media:** ffmpeg, mediainfo for file conversion and inspection
      
      File managers are configured with sensible defaults and shell aliases
      provide safer file operations (interactive prompts for rm/cp/mv).
    '';
  };

  config = mkIf cfg.enable {
    # 📁 File Management & Synchronization Tools

    home.packages = with pkgs; [
      # 📂 File managers
      # ranger - Vim-inspired file manager
      # Homepage: https://ranger.github.io/
      ranger

      # 🎯 nnn - Blazing-fast terminal file manager
      # Homepage: https://github.com/jarun/nnn
      nnn

      # 🦀 lf - Terminal file manager written in Go
      # Homepage: https://github.com/gokcehan/lf
      lf

      # 🎨 mc - Midnight Commander (classic dual-pane file manager)
      # Homepage: https://midnight-commander.org/
      mc

      # 🔍 File search and indexing
      # locate/mlocate - Fast file search using database
      # Homepage: https://pagure.io/mlocate
      mlocate

      # 🔎 plocate - Much faster locate
      # Homepage: https://plocate.sesse.net/
      plocate

      # 🗂️ File synchronization
      # rsync - Fast incremental file transfer
      # Homepage: https://rsync.samba.org/
      rsync

      # ☁️ rclone - Sync files to cloud storage
      # Homepage: https://rclone.org/
      rclone

      # 📦 restic - Fast, secure backup program
      # Homepage: https://restic.net/
      restic

      # 🔐 Encryption and compression
      # p7zip - 7-Zip file archiver
      # Homepage: https://p7zip.sourceforge.net/
      p7zip

      # 🗜️ unzip - Extraction utility for .zip archives
      # Homepage: http://www.info-zip.org/UnZip.html
      unzip

      # 📦 zip - Compression utility
      # Homepage: http://www.info-zip.org/Zip.html
      zip

      # 🔧 atool - Archive tool wrapper
      # Homepage: https://www.nongnu.org/atool/
      atool

      # 🎯 gzip/gunzip - GNU compression utilities
      # Already in most systems

      # 📊 ncdu - NCurses Disk Usage analyzer
      # Homepage: https://dev.yorhel.nl/ncdu
      ncdu

      # 🔍 dua - Disk Usage Analyzer (modern ncdu)
      # Homepage: https://github.com/Byron/dua-cli
      du-dust # Already in core-utils, but worth noting

      # 🔧 File manipulation
      # rename - Perl-based file renaming utility
      # Homepage: http://plasmasturm.org/code/rename/
      # Note: We already have f2 which is better

      # 🗑️ trash-cli - Command-line trash utility
      # Homepage: https://github.com/andreafrancia/trash-cli
      trash-cli

      # 🔍 tree - Display directory tree
      # Homepage: http://mama.indstate.edu/users/ice/tree/
      tree

      # 📊 File comparison and merging
      # diff-so-fancy - Good-looking diffs
      # Homepage: https://github.com/so-fancy/diff-so-fancy
      diff-so-fancy

      # 🔧 meld - Visual diff and merge tool (GUI but can be useful)
      # Homepage: https://meldmerge.org/
      # Skipping GUI tools

      # 🔍 colordiff - Colored diff output
      # Homepage: https://www.colordiff.org/
      colordiff

      # 📝 File watchers
      # watchexec - Execute commands when files change
      # Homepage: https://github.com/watchexec/watchexec
      watchexec

      # 🔄 entr - Run arbitrary commands when files change
      # Homepage: https://eradman.com/entrproject/
      entr

      # 🎯 inotify-tools - File system event monitoring
      # Homepage: https://github.com/inotify-tools/inotify-tools
      inotify-tools

      # 🔧 File integrity
      # rhash - Calculate/verify hash sums
      # Homepage: https://github.com/rhash/RHash
      rhash

      # 📊 xxHash - Extremely fast hash algorithm
      # Homepage: https://github.com/Cyan4973/xxHash
      xxhash

      # 🔍 File type identification
      # file - Determine file type
      # Usually pre-installed

      # 🎨 exiftool - Read/write metadata in files
      # Homepage: https://exiftool.org/
      exiftool

      # 📄 File converters
      # dos2unix/unix2dos - Line ending converters
      # Homepage: https://waterlan.home.xs4all.nl/dos2unix.html
      dos2unix

      # 🔍 mediainfo - Display media file information
      # Homepage: https://mediaarea.net/MediaInfo
      mediainfo

      # 🎬 ffmpeg - Media file converter and processor
      # Homepage: https://ffmpeg.org/
      ffmpeg

      # 📊 Archiving
      # borg - Deduplicating backup program
      # Homepage: https://www.borgbackup.org/
      borgbackup
    ];

    # Configure ranger with better defaults
    programs.ranger = {
      enable = true;

      extraConfig = ''
        # Use external image previews
        set preview_images true
        set preview_images_method kitty
        
        # Show hidden files
        set show_hidden true
        
        # Sort options
        set sort natural
        set sort_case_insensitive true
        
        # Which viewmode should be used?
        set viewmode miller
        
        # Draw borders
        set draw_borders both
        
        # Use Unicode ellipsis character
        set unicode_ellipsis true
        
        # Abbreviate $HOME with ~ in the titlebar
        set tilde_in_titlebar true
        
        # Open files with rifle
        set open_all_images true
      '';
    };

    # Configure nnn
    programs.nnn = {
      enable = true;
      package = pkgs.nnn.override { withNerdIcons = true; };

      bookmarks = {
        d = "~/Documents";
        D = "~/Downloads";
        p = "~/Projects";
        h = "~";
      };

      extraPackages = with pkgs; [
        ffmpeg
        mediainfo
        sxiv # Image viewer (optional)
      ];

      plugins = {
        src = "${pkgs.nnn}/share/plugins";
        mappings = {
          p = "preview-tui";
          d = "diffs";
          v = "imgview";
        };
      };
    };

    # Shell aliases for file management
    home.shellAliases = {
      # Safer file operations
      cp = "cp -iv";
      mv = "mv -iv";
      rm = "rm -Iv";

      # Use trash instead of rm for safety
      trash = "trash-put";

      # Directory navigation
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";

      # List files with eza (if available in core-utils)
      ll = "eza -l --group-directories-first --icons";
      la = "eza -la --group-directories-first --icons";
      lt = "eza --tree --level=2 --icons";

      # Disk usage
      du1 = "du -h --max-depth=1";
      duf = "${pkgs.duf}/bin/duf";

      # Find
      fd = "${pkgs.fd}/bin/fd";
    };
  };
}
