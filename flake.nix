{
  description = "Nixos Flake Configuration";

  inputs = {
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    stylix.url = "github:danth/stylix/release-24.11";
    nixverse.url = "github:dhavysantos/nixverse";
    disko.url = "github:nix-community/disko";
  };

  outputs = { self, nixpkgs, ... } @inputs: {
    nixosConfigurations = {
      tsugumori = nixpkgs.lib.nixosSystem rec {
        specialArgs = { inherit self system inputs;};
        modules = [ ./hosts/tsugumori ];
        system = "x86_64-linux";
      };
    };
  };
}
