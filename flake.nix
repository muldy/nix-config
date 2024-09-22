{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    nix-homebrew = { url = "github:zhaofengli-wip/nix-homebrew"; };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
     nvchad = {
      url = "github:dko1905/neovim-nvchad-flake";
    };
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
    homebrew-bundle = {
      url = "github:homebrew/homebrew-bundle";
      flake = false;
    };

  };

  outputs = { self, nix-darwin, nixpkgs, home-manager, nix-homebrew
    , homebrew-core, homebrew-cask, homebrew-bundle, ... }@inputs: 
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      # Expose the package set, including overlays, for convenience.
      darwinPackages = self.darwinConfigurations."MacBook-Pro".pkgs;
    in
    {
      nixosConfigurations.t14g4 = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/thinkpad-t14-gen4/hardware-configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };
      darwinConfigurations.MacBook-Pro = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [ 
        ./hosts/MacBook-Pro/configuration.nix 
	home-manager.darwinModules.home-manager
            {
              # `home-manager` config
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.muldy = import ./hosts/MacBook-Pro/home.nix;
            }
      nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
          enable = true;
          # Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta 2
          enableRosetta = true;
          user = "muldy";
          
          taps = {
            "homebrew/homebrew-core" = homebrew-core;
            "homebrew/homebrew-cask" = homebrew-cask;
            "homebrew/homebrew-bundle" = homebrew-bundle;
          };
          mutableTaps = false;
          };
      }
	];
      };
      # Expose the package set, including overlays, for convenience.
      darwinPackages = self.darwinConfigurations."MacBook-Pro".pkgs;
  };
}
