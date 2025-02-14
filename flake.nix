{
  description = "NixOS Configuration Flake";

  inputs = {
    home-manager.url = "github:Nix-Community/home-manager/release-24.11";
    nixpkgs.url = "github:NixOS/NixPkgs/release-24.11";
    stylix.url = "github:danth/stylix/release-24.11";
    xremap.url = "github:xremap/nix-flake/master";
    neovim.url = "github:DhavySantos/NeoVim";

    schemes = {
      url = "github:tinted-theming/schemes";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, home-manager, ... } @inputs : let

  flakePath = self.outPath;

  pkgs = import nixpkgs {
    config.allowUnfree = true;
    system = "x86_64-linux";
  };

  in {
    nixosConfigurations = {
      tsugumori = nixpkgs.lib.nixosSystem  {
        specialArgs = { inherit inputs flakePath; };
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
