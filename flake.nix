{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
     nvchad-config = {
      url = "git+https://codeberg.org/daniel_chesters/nvchad_config";
      flake = false;
    };

  };

  outputs = { self, nixpkgs, ... }@inputs: 
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
