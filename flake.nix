{
	description = "NixOS Configuration Flake";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

		home-manager = {
			url = "github:nix-community/home-manager/master";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		stylix = {
			url = "github:danth/stylix/master";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		sops-nix = {
			url = "github:Mic92/sops-nix/master";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		xremap = {
			url = "github:xremap/nix-flake/master";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { nixpkgs, home-manager, ... } @inputs :

	let

	pkgs = import nixpkgs {
		config.allowUnfree = true;
		system = "x86_64-linux";
	};

	in

	{
		nixosConfigurations.tsugumori = nixpkgs.lib.nixosSystem {
			specialArgs = { inherit inputs; };
			modules = [ ./hosts/tsugumori ];
			inherit pkgs;
		};

		homeConfigurations.tanikaze = home-manager.lib.homeManagerConfiguration {
			extraSpecialArgs = { inherit inputs; };
			modules = [ ./users/tanikaze ];
			inherit pkgs;
		};

		devShells.x86_64-linux.rust = (import ./shells/rust.nix { inherit pkgs; });
	};
}
