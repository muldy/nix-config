{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

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

  nixos-hardware = { 
  	url = "github:NixOS/nixos-hardware/master";
	};

  };

  outputs = { self, nix-darwin, nixpkgs, home-manager, nix-homebrew
    , homebrew-core, homebrew-cask, homebrew-bundle, nixos-hardware, ... }@inputs: 
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      # Expose the package set, including overlays, for convenience.
      darwinPackages = self.darwinConfigurations."MacBook-Pro".pkgs;
    in
    {
      #t14g4
      nixosConfigurations.t14g4 = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
	        
          ./hosts/thinkpad-t14-gen4/hardware-configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };
      #t440p
      nixosConfigurations.t440p= nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          nixos-hardware.nixosModules.lenovo-thinkpad-t440p
	        ./hosts/nix-config-t440p/hardware-configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };
      #x260
      nixosConfigurations.x260= nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
	        ./hosts/nix-config-x260/hardware-configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };
      #server-nixos
      nixosConfigurations.nixos= nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
	        ./hosts/server-nixos/hardware-configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };
     
      #muldys.MacBook.Pro
      darwinConfigurations."muldys-MacBook-Pro" = nix-darwin.lib.darwinSystem {
        system = "x86_64-darwin";
        modules = [
          ./hosts/muldys-MacBook-Pro/darwin-configuration.nix
  
          # This hooks in Home Manager
          home-manager.darwinModules.home-manager # Define your Home Manager user config inline or from file
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.muldy = import ./hosts/muldys-MacBook-Pro/home.nix;
          }
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
            enable = true;
            user = "muldy";
	    autoMigrate = true;
            
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

      #MacBook.Pro
      darwinConfigurations.MacBook-Pro = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = 
        [ 
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
