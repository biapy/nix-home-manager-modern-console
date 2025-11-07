# 🏠 Example Home Manager Configuration
#
# This is an example configuration showing how to customize the modern console tools.
# Copy this file to ~/.config/home-manager/home.nix or use it as reference.

{ config, pkgs, lib, ... }:

{
  # Import the modern console modules
  imports = [
    # Adjust path if you cloned to a different location
    ./home.nix
  ];

  # 👤 User Information - REQUIRED: Set your username and home directory
  home.username = "johndoe";  # Replace with your username
  home.homeDirectory = "/home/johndoe";  # Replace with your home directory

  # 🎨 Customize which tool categories to enable
  # All categories are enabled by default, but you can disable any you don't want
  modern-console = {
    core-utils.enable = true;          # Modern alternatives to Unix tools
    development.enable = true;         # Dev tools and git configuration
    networking.enable = true;          # Network and security tools
    text-processing.enable = true;     # Text manipulation tools
    system-monitoring.enable = true;   # System monitoring tools
    file-management.enable = true;     # File managers and sync tools
    web-browsing.enable = true;        # Terminal web browsers
    shell.enable = true;               # Shell enhancements
  };

  # ✏️ Override git configuration
  programs.git = {
    userName = "John Doe";
    userEmail = "john.doe@example.com";
    
    # Add your own aliases (these are in addition to the defaults)
    aliases = {
      # Your custom aliases here
      wip = "commit -am 'WIP'";
      publish = "push -u origin HEAD";
    };
  };

  # 📦 Add your own packages
  home.packages = with pkgs; [
    # Add any additional packages you want
    # vim
    # emacs
    # your-favorite-tool
  ];

  # 🎨 Customize shell prompt (optional)
  # The default starship configuration is already quite nice,
  # but you can override it here
  programs.starship.settings = {
    # Your custom starship configuration
    # See: https://starship.rs/config/
  };

  # 🐚 Choose your preferred shell (bash is enabled by default)
  # Uncomment to use zsh instead:
  # programs.bash.enable = lib.mkForce false;
  # programs.zsh.enable = true;

  # 🔧 Additional environment variables
  home.sessionVariables = {
    # EDITOR = "nvim";  # Use neovim if you prefer
    # Your custom environment variables
  };

  # This value should not be changed
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
