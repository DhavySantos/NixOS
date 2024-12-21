{
  description = "NixOS Configuration Flake";
  inputs = {
    home-manager.url = "github:Nix-Community/home-manager/release-24.11";
    nixpkgs.url = "github:NixOS/NixPkgs/release-24.11";
    disko.url = "github:Nix-Community/disko";
    xremap.url = "github:xremap/nix-flake";
    stylix.url = "github:danth/stylix";
  };

  outputs = { nixpkgs, home-manager, ... } @inputs :

  let
    pkgs = import nixpkgs {
      config.allowUnfree = true;
      system = "x86_64-linux";
    };
  in

  {
    nixosConfigurations.tsugumori = nixpkgs.lib.nixosSystem  {
      specialArgs = { inherit inputs; };
      modules = [ ./systems/tsugumori ];
      inherit pkgs;
    };

    homeConfigurations.tanikaze = home-manager.lib.homeManagerConfiguration {
      extraSpecialArgs = { inherit inputs; };
      modules = [ ./users/tanikaze ];
      inherit pkgs;
    };
  };
}
