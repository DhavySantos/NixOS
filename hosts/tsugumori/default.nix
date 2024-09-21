{ inputs, pkgs, ... } : {
	imports = [
		inputs.sops-nix.nixosModules.sops
	];

	### XSERVER SECTION
	services.xserver.videoDrivers = [ "amdgpu" "modesetting" ];
	services.xserver.xkb.variant = "abnt2";
	services.xserver.xkb.layout = "br";
	services.xserver.enable = true;

	hardware.graphics = {
		extraPackages32 = [ pkgs.driversi686Linux.amdvlk ];
		extraPackages = [ pkgs.amdvlk ];
		enable32Bit = true;
		enable = true;
	};

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
