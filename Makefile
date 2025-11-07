# 🏠 Modern Console Configuration - Makefile
# Convenience commands for managing the home-manager configuration

.PHONY: help switch build check update clean rollback list-generations format

help: ## Show this help message
	@echo "🏠 Modern Console Configuration - Available commands:"
	@echo ""
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2}'
	@echo ""

switch: ## Apply the configuration (home-manager switch)
	@echo "🔄 Applying home-manager configuration..."
	home-manager switch --flake .

build: ## Build the configuration without activating
	@echo "🔨 Building home-manager configuration..."
	home-manager build --flake .

check: ## Check the flake configuration for errors
	@echo "✅ Checking flake configuration..."
	nix flake check

update: ## Update flake inputs
	@echo "📦 Updating flake inputs..."
	nix flake update
	@echo "✅ Flake inputs updated!"
	@echo "💡 Run 'make switch' to apply updates"

clean: ## Clean up old generations and garbage collect
	@echo "🧹 Cleaning up old generations..."
	home-manager expire-generations "-7 days"
	@echo "🗑️  Running garbage collection..."
	nix-collect-garbage -d
	@echo "✅ Cleanup complete!"

rollback: ## List generations and rollback if needed
	@echo "📋 Recent generations:"
	@home-manager generations | head -10
	@echo ""
	@echo "💡 To rollback: home-manager switch --rollback"
	@echo "💡 Or: home-manager switch --switch-generation <number>"

list-generations: ## List all home-manager generations
	@echo "📋 Home Manager generations:"
	@home-manager generations

format: ## Format Nix files
	@echo "🎨 Formatting Nix files..."
	@find . -name "*.nix" -not -path "./.*" -exec nixpkgs-fmt {} \;
	@echo "✅ Formatting complete!"

test: ## Test the configuration (build + check)
	@echo "🧪 Testing configuration..."
	@make check
	@make build
	@echo "✅ Tests passed!"

info: ## Show system information
	@echo "📊 System Information:"
	@echo ""
	@echo "Nix version:"
	@nix --version
	@echo ""
	@echo "Home Manager version:"
	@home-manager --version
	@echo ""
	@echo "Current generation:"
	@home-manager generations | head -1

dev: ## Enter development shell with all tools
	@echo "🛠️  Entering development shell..."
	nix develop

.DEFAULT_GOAL := help
