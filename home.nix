{ config, pkgs, lib, ... }:

{
  # 🏠 Modern Console & TUI Tools - Home Manager Configuration
  # A comprehensive collection of modern command-line tools for daily use,
  # software development, and system administration.

  imports = [
    ./modules/core-utils.nix
    ./modules/development.nix
    ./modules/networking.nix
    ./modules/text-processing.nix
    ./modules/system-monitoring.nix
    ./modules/file-management.nix
    ./modules/web-browsing.nix
    ./modules/shell.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should manage.
  # ⚠️ IMPORTANT: You MUST change these values before using this configuration!
  home.username = lib.mkDefault "your-username";
  home.homeDirectory = lib.mkDefault "/home/your-username";

  # ⚠️ IMPORTANT: You MUST also set your Git credentials!
  # Override in this file or in modules/development.nix:
  #   programs.git.userName = "Your Name";
  #   programs.git.userEmail = "your.email@example.com";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  home.stateVersion = "24.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # 🎨 Enable all modern console tool categories by default
  # Set any to false to disable that category
  modern-console = {
    core-utils.enable = lib.mkDefault true;
    development.enable = lib.mkDefault true;
    networking.enable = lib.mkDefault true;
    text-processing.enable = lib.mkDefault true;
    system-monitoring.enable = lib.mkDefault true;
    file-management.enable = lib.mkDefault true;
    web-browsing.enable = lib.mkDefault true;
    shell.enable = lib.mkDefault true;
  };

  # 📦 Additional packages that don't fit into specific categories
  home.packages = with pkgs; [
    # Basic necessities
    curl
    wget
  ];

  # 🔧 Global environment variables
  home.sessionVariables = {
    EDITOR = "vim";
    VISUAL = "vim";
  };
}
