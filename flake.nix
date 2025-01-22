{
  description = "NixOS Configuration Flake";
  inputs = {
    home-manager.url = "github:Nix-Community/home-manager/release-24.11";
    xremap.url = "github:xremap/nix-flake/release-24-.11";
    nixpkgs.url = "github:NixOS/NixPkgs/release-24.11";
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
    nixosConfigurations = {
      tsugumori = nixpkgs.lib.nixosSystem  {
        specialArgs = { inherit inputs; };
        modules = [ ./hosts/tsugumori ];
        inherit pkgs;
      };

      liveiso = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [ ./hosts/liveiso ];
        inherit pkgs;
      };
    };
  };
}
