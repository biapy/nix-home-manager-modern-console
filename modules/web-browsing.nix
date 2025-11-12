{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.modern-console.web-browsing;
in
{
  options.modern-console.web-browsing = {
    enable = mkEnableOption ''
      terminal web browsers and related tools.
      
      This module provides terminal-based web browsers, RSS readers, HTML
      processing tools, media downloaders, and terminal image viewers.
      All tools are configured for optimal terminal-based web browsing
      and content consumption.
      
      **Key features:**
      - **Browsers:** lynx, w3m, links2, elinks (configured with vi keys)
      - **RSS Readers:** newsboat with sample feeds and vim-like bindings
      - **HTML Tools:** pup, htmlq for parsing and extracting HTML content
      - **Media Downloads:** yt-dlp for downloading videos from various sites
      - **Media Playback:** mpv with youtube-dl integration
      - **Image Viewers:** viu, chafa, timg for terminal image display
      - **Utilities:** html-xml-utils for HTML manipulation
      
      Lynx is configured with UTF-8 support, vi keybindings, and cookie
      acceptance. Newsboat includes default tech news feeds and is configured
      with vim-like navigation and automatic reload every 30 minutes.
      mpv is configured for high-quality playback with hardware decoding.
    '';
  };

  config = mkIf cfg.enable {
    # 🌐 Web Browsing & Related Tools

    home.packages = with pkgs; [
      # 🌐 chawan - Terminal web browser with modern features
      # Homepage: https://sr.ht/~bptato/chawan/
      # Note: chawan is not yet available in nixpkgs stable
      # Users can add it manually if available in their nixpkgs version

      # 🦎 lynx - Classic terminal web browser
      # Homepage: https://lynx.invisible-island.net/
      lynx

      # 🌍 w3m - Text-based web browser
      # Homepage: http://w3m.sourceforge.net/
      w3m

      # 🔍 links2 - Text and graphics web browser
      # Homepage: http://links.twibright.com/
      links2

      # 🎯 elinks - Advanced text web browser
      # Homepage: http://elinks.or.cz/
      elinks

      # 📄 HTML utilities
      # html-xml-utils - HTML and XML manipulation utilities
      # Homepage: https://www.w3.org/Tools/HTML-XML-utils/
      html-xml-utils

      # 🔍 pup - Parsing HTML at the command line
      # Homepage: https://github.com/ericchiang/pup
      pup

      # 🌐 htmlq - Like jq but for HTML
      # Homepage: https://github.com/mgdm/htmlq
      htmlq

      # 📰 RSS/Feed readers
      # newsboat - RSS/Atom feed reader
      # Homepage: https://newsboat.org/
      newsboat

      # 📡 Feed manipulation
      # rsstail - Monitor RSS feeds
      # Homepage: https://www.vanheusden.com/rsstail/
      rsstail

      # 🌐 Web scraping and automation
      # yt-dlp - Download videos from YouTube and other sites
      # Homepage: https://github.com/yt-dlp/yt-dlp
      yt-dlp

      # 📹 youtube-dl alternative is yt-dlp (above)

      # 🎬 mpv - Media player (can play web videos)
      # Homepage: https://mpv.io/
      mpv

      # 🖼️ Terminal image viewers
      # viu - View images in terminal
      # Homepage: https://github.com/atanunq/viu
      viu

      # 🎨 chafa - Terminal graphics/image viewer
      # Homepage: https://hpjansson.org/chafa/
      chafa

      # 📊 timg - Terminal image viewer
      # Homepage: https://github.com/hzeller/timg
      timg
    ];

    # Configure lynx
    programs.lynx = {
      enable = true;

      # Lynx configuration
      settings = {
        accept_all_cookies = true;
        character_set = "utf-8";
        display_charset = "utf-8";
        assume_charset = "utf-8";

        # VI-like key bindings
        vi_keys = true;

        # Show cursor
        show_cursor = true;

        # Number links
        number_links = true;

        # Default homepage
        startfile = "https://www.google.com";
      };
    };

    # Configure newsboat (RSS reader)
    programs.newsboat = {
      enable = true;

      # Default feeds (user should customize)
      urls = [
        {
          url = "https://news.ycombinator.com/rss";
          tags = [ "tech" "news" ];
          title = "Hacker News";
        }
        {
          url = "https://lobste.rs/rss";
          tags = [ "tech" "programming" ];
          title = "Lobsters";
        }
      ];

      extraConfig = ''
        # General settings
        auto-reload yes
        reload-time 30
        reload-threads 4
        download-retries 4
        download-timeout 30
        
        # Display
        show-read-feeds no
        show-read-articles yes
        
        # Vim-like keybindings
        bind-key j down
        bind-key k up
        bind-key l open
        bind-key h quit
        
        # Browser
        browser "${pkgs.lynx}/bin/lynx %u"
        
        # Feed display
        articlelist-format "%4i %f %D %?T?|%-17T| ?%t"
        feedlist-format "%4i %n %11u %t"
        
        # Colors
        color listnormal cyan default
        color listfocus black yellow standout bold
        color listnormal_unread blue default
        color listfocus_unread yellow default bold
        color info red black bold
        color article white default
        
        # Highlighting
        highlight all "---.*---" yellow
        highlight feedlist ".*(0/0))" black
        highlight article "(^Feed:.*|^Title:.*|^Author:.*)" cyan default bold
        highlight article "(^Link:.*|^Date:.*)" default default
        highlight article "https?://[^ ]+" green default
      '';
    };

    # Configure mpv for playing web videos
    programs.mpv = {
      enable = true;

      config = {
        # Use hardware decoding when available
        hwdec = "auto";

        # Better quality
        profile = "high-quality";

        # Save position on quit
        save-position-on-quit = true;

        # OSD settings
        osd-level = 1;
        osd-duration = 2000;

        # Screenshot settings
        screenshot-format = "png";
        screenshot-png-compression = 8;
        screenshot-directory = "~/Pictures/mpv-screenshots";

        # Youtube-dl integration
        ytdl = true;
        ytdl-format = "bestvideo[height<=?1080]+bestaudio/best";
      };

      bindings = {
        # Additional key bindings
        "WHEEL_UP" = "seek 10";
        "WHEEL_DOWN" = "seek -10";
        "Alt+RIGHT" = "add video-rotate 90";
        "Alt+LEFT" = "add video-rotate -90";
      };
    };

    # Shell aliases for web browsing
    home.shellAliases = {
      # Quick web searches
      google = "lynx https://www.google.com/search?q=";

      # Download videos
      dl-video = "yt-dlp";
      dl-audio = "yt-dlp -x --audio-format mp3";

      # Quick web access
      web = "lynx";
      news = "newsboat";
    };
  };
}
