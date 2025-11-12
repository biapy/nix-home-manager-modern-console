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
      # Home Manager module for integration into other configurations
      # Usage in your flake.nix:
      #   inputs.modern-console.url = "github:biapy/nix-home-manager-modern-console";
      #   homeConfigurations.youruser = home-manager.lib.homeManagerConfiguration {
      #     modules = [ inputs.modern-console.homeManagerModules.default ];
      #   };
      homeManagerModules = {
        default = ./home.nix;

        # Individual modules can also be imported separately
        core-utils = ./modules/core-utils.nix;
        development = ./modules/development.nix;
        networking = ./modules/networking.nix;
        text-processing = ./modules/text-processing.nix;
        system-monitoring = ./modules/system-monitoring.nix;
        file-management = ./modules/file-management.nix;
        web-browsing = ./modules/web-browsing.nix;
        shell = ./modules/shell.nix;
      };

      # Example Home Manager configuration for testing
      homeConfigurations = {
        # Default configuration - replace 'username' with your actual username
        "username" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          modules = [
            self.homeManagerModules.default
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
          nil # Nix language server
        ];

        shellHook = ''
          echo "🏠 Modern Console & TUI Tools - Home Manager Module"
          echo ""
          echo "Available commands:"
          echo "  nixpkgs-fmt .       - Format Nix files"
          echo "  home-manager build  - Build the configuration"
          echo "  home-manager switch - Apply the configuration"
          echo ""
          echo "This is a Home Manager module. Import it in your flake:"
          echo "  inputs.modern-console.url = \"github:biapy/nix-home-manager-modern-console\";"
          echo "  modules = [ inputs.modern-console.homeManagerModules.default ];"
        '';
      };

      # Formatter for 'nix fmt'
      formatter.${system} = pkgs.nixpkgs-fmt;
    };
}
