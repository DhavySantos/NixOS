{
	description = "NixOS Configuration Flake";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
	};

	outputs = { nixpkgs, ... } @inputs : {
		nixosConfigurations.tsugumori = nixpkgs.lib.nixosSystem {
			specialArgs = { inherit inputs; };
			modules = [ ./hosts/tsugumori ];
		};
	};
}
