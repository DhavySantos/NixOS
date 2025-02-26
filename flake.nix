{
  description = "Flake Nixos Configuration";

  inputs = {
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    stylix.url = "github:danth/stylix/release-24.11";
    disko.url = "github:nix-community/disko/master";
    xremap.url = "github:xremap/nix-flake/master";
    neovim.url = "github:dhavysantos/neovim";
  };

  outputs = { self, nixpkgs, flake-parts, ... } @inputs :
  flake-parts.lib.mkFlake { inherit inputs; } {
    systems = [ "x86_64-linux" "aarch64-linux" ];

    flake.nixosConfigurations.tsugumori = nixpkgs.lib.nixosSystem rec {
      specialArgs = { inherit self system inputs; };
      modules = [ ./hosts/tsugumori ];
      system = "x86_64-linux";
    };

    flake.overlays.default = final: prev: let
      system = prev.stdenv.hostPlatform.system;
      packages = self.packages.${system};
    in

    {
      CascadiaCode = packages.CascadiaCode;
      neovim = inputs.neovim.packages.${system}.default;
    };

    flake.homeManagerModules.waybar = { pkgs, ... } : {
      imports = [ ./modules/home/waybar ];
    };

    perSystem = { pkgs, system, ... } : {
      packages.CascadiaCode = import ./packages/CascadiaCode.nix { inherit pkgs; };
    };
  };
}
