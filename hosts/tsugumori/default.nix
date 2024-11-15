{ inputs, pkgs, lib, system, ... } : {
	imports = [
		./config/hardware.nix
    ./config/pipewire.nix
    ./config/display.nix
    ./config/network.nix
	];

	fonts.packages  = [
		(import ../../pkgs/caskaydiacove.nix { inherit pkgs; } )
	];

  ### USERS SECTION
	users.users.tanikaze = {
		extraGroups = [ "wheel" "uinput" "input"];
		description = "tanikaze";
		isNormalUser = true;
	};

	### ENVIRONMENT SECTION
	environment.systemPackages = with pkgs; [
		vulkan-loader vulkan-headers vulkan-tools
		pulsemixer pulseaudio wl-clipboard
		unzip unrar
  ];

  powerManagement.cpuFreqGovernor = "performance";

	programs = {
    gamescope.enable = true;
    gamemode.enable = true;
		nix-ld.enable = true;
		dconf.enable = true;
		steam.enable = true;
		nh.enable = true;
	};

	time.timeZone = "America/Sao_Paulo";
	i18n.defaultLocale = "en_US.UTF-8";
	console.keyMap = "br-abnt2";

	### SECURITY SECTION
	security.sudo.wheelNeedsPassword = false;
	security.polkit.enable = true;

	### BOOT SECTION
	boot.loader.efi.canTouchEfiVariables = true;
	boot.loader.systemd-boot.enable = true;

	### NIX CONFIGURATION SECTION
	nix.settings.experimental-features = [ "nix-command" "flakes" ];
	system.stateVersion = "24.11";
}

