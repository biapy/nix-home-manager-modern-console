{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.modern-console.networking;
in
{
  options.modern-console.networking = {
    enable = mkEnableOption "networking and security tools";
  };

  config = mkIf cfg.enable {
    # 🌐 Networking & Security Tools

    home.packages = with pkgs; [
      # 🔍 nmap - Network exploration tool and security scanner
      # Homepage: https://nmap.org/
      nmap

      # 🌐 Network utilities
      # dog - Modern dig alternative (command-line DNS client)
      # Homepage: https://dns.lookup.dog/
      dog

      # 🔌 bandwhich - Terminal bandwidth utilization tool
      # Homepage: https://github.com/imsnif/bandwhich
      bandwhich

      # 📡 trippy - Network diagnostic tool (modern traceroute)
      # Homepage: https://github.com/fujiapple852/trippy
      trippy

      # 🔐 Security tools
      # rustscan - Fast port scanner
      # Homepage: https://github.com/RustScan/RustScan
      rustscan

      # 🌍 httpie - User-friendly HTTP client
      # Homepage: https://httpie.io/
      httpie

      # 🚀 curlie - Frontend to curl with HTTPie-like interface
      # Homepage: https://github.com/rs/curlie
      curlie

      # 📥 aria2 - Multi-protocol download utility
      # Homepage: https://aria2.github.io/
      aria2

      # 🔗 mtr - Network diagnostic tool (traceroute + ping)
      # Homepage: https://www.bitwizard.nl/mtr/
      mtr

      # 🌐 websocat - WebSocket client/server
      # Homepage: https://github.com/vi/websocat
      websocat

      # 📊 gping - Ping with graph
      # Homepage: https://github.com/orf/gping
      gping

      # 🔍 sshx - Fast, collaborative terminal sharing
      # Note: Not available in standard nixpkgs yet

      # 🌍 localhost.run alternatives - tunneling
      # ngrok alternative: bore
      # Homepage: https://github.com/ekzhang/bore
      bore-cli

      # 🔐 SSH utilities
      # ssh-audit - SSH server & client auditing
      # Homepage: https://github.com/jtesta/ssh-audit
      ssh-audit

      # 🌐 whoami - Tool for retrieving your public IP and other info
      # Note: Simple curl alternatives work, but including for completeness

      # 📡 netcat utilities
      # ncat - Modern netcat implementation (part of nmap)
      # Already included with nmap

      # 🔒 TLS/SSL tools
      # mkcert - Make locally trusted development certificates
      # Homepage: https://github.com/FiloSottile/mkcert
      mkcert
    ];

    # 🔧 SSH Configuration with best practices
    programs.ssh = {
      enable = true;
      
      # Global SSH configuration
      extraConfig = ''
        # Security settings
        HashKnownHosts yes
        
        # Connection settings
        TCPKeepAlive yes
        ServerAliveInterval 60
        ServerAliveCountMax 3
        
        # Compression
        Compression yes
        
        # Use SSH agent
        AddKeysToAgent yes
        
        # Prevent SSH from trying different auth methods
        PreferredAuthentications publickey,keyboard-interactive,password
      '';
    };
  };
}
