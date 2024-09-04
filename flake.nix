{
  description = "Nixos config flake";

  inputs = {
    neovim-nvchad-flake.url = "https://flakehub.com/f/dko1905/neovim-nvchad-flake/0.1.19.tar.gz";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, neovim-nvchad-flake, ... }@inputs: 
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations.t14g4 = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/thinkpad-t14-gen4/configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };
  };
}
