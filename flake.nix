{
  description = "🏠 Modern Console & TUI Tools - Home Manager Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      # Home Manager configuration
      homeConfigurations = {
        # Default configuration - replace 'username' with your actual username
        "username" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          
          modules = [
            ./home.nix
          ];
        };
      };

      # Standalone home-manager configuration for easier testing
      # Usage: nix run .#homeConfigurations.username.activationPackage
      
      # Development shell for working with this configuration
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          home-manager
          git
          nixpkgs-fmt
          nil  # Nix language server
        ];
        
        shellHook = ''
          echo "🏠 Modern Console & TUI Tools - Home Manager Configuration"
          echo ""
          echo "Available commands:"
          echo "  nixpkgs-fmt .       - Format Nix files"
          echo "  home-manager build  - Build the configuration"
          echo "  home-manager switch - Apply the configuration"
          echo ""
          echo "To customize, edit home.nix and set your username and home directory."
        '';
      };

      # Formatter for 'nix fmt'
      formatter.${system} = pkgs.nixpkgs-fmt;
    };
}
