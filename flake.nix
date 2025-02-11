{
  description = "First flake";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    nvf,
    ...
  } @ inputs: let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations = {
      desktop = lib.nixosSystem {
        specialArgs = {inherit inputs;};
        inherit system;
        modules = [
          ./hosts/desktop/desktop.nix
        ];
      };
    };
    homeConfigurations = {
      desktop = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {inherit inputs;};
        modules = [
          ./modules/home-manager/home.nix
          nvf.homeManagerModules.default
          inputs.spicetify-nix.homeManagerModules.default
        ];
      };
    };
  };
}
