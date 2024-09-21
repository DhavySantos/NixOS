{ inputs, ... } : {
	imports = [
		inputs.sops-nix.nixosModules.sops
	];

	### USERS SECTION
	users.users.tanikaze = {
		isNormalUser = true;
		description = "tanikaze";
		extraGroups = [ "wheel" ];
	};

	### NETWORKING SECTION
	networking.networkmanager.enable = true;
	networking.hostname = "tsugumori";

	### BOOT SECTION
	boot.loader.efi.canTouchEfiVariables = true;
	boot.loader.systemd-boot.enable = true;

	### NIX CONFIGURATION SECTION
	nix.settings.experimental-features = [ "nix-command" "flakes" ];
	system.stateVersion = "24.11";
}
