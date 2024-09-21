{
	description = "NixOS Configuration Flake";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

		home-manager = {
			url = "github:nix-community/home-manager/master";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { nixpkgs, home-manager, ... } @inputs : {
		nixosConfigurations.tsugumori = nixpkgs.lib.nixosSystem {
			specialArgs = { inherit inputs; };
			modules = [ ./hosts/tsugumori ];
			system = "x86_64-linux";
		};

		homeConfigurations.tanikaze = home-manager.lib.homeManagerConfiguration {
			extraSpecialArgs = { inherit inputs; };
			modules = [ ./users/tanikaze ];
		};
	};
}
