{ inputs, pkgs, lib, ... } : {
	imports = [
		inputs.sops-nix.nixosModules.sops
		./hardware.nix
	];

	### ENVIRONMENT SECTION
	environment.systemPackages = with pkgs; [
		vulkan-loader vulkan-headers vulkan-tools
		pulsemixer pulseaudio wl-clipboard
		lact unzip unrar home-manager
	];

	fonts.packages = [
		( import ../../pkgs/caskaydiacove.nix { inherit pkgs; })
	];

	programs = {
		dconf.enable = true;
		nix-ld.enable = true;
		steam.enable = true;
		nh.enable = true;
		firefox.enable = true;
	};

	time.timeZone = "America/Sao_Paulo";
	i18n.defaultLocale = "en_US.UTF-8";
	console.keyMap = "br-abnt2";

	### SERVICES SECTION
	systemd.services.lact = {
		enable = true;
		after = ["multi-user.target"];
		wantedBy = ["multi-user.target"];
		description = "AMDGPU Control Daemon";
		serviceConfig.ExecStart = "${pkgs.lact}/bin/lact daemon";
	};

	### DISPLAY MANAGER SECTION
	services.displayManager.autoLogin.user = "tanikaze";
	services.displayManager.autoLogin.enable = true;

	systemd.services."autovt@tty1".enable = false;
	systemd.services."getty@tty1".enable = false;

	services.displayManager.sddm.enable = true;
	programs.hyprland.xwayland.enable = true;
	programs.hyprland.enable = true;

	### PIPEWIRE SECTION
	hardware.pulseaudio.enable = false;
	security.rtkit.enable = true;

	services.pipewire = {
		alsa.support32Bit = true;
		pulse.enable = true;
		alsa.enable = true;
		jack.enable = true;
		enable = true;
	};

	### XSERVER SECTION
	services.xserver.videoDrivers = [ "amdgpu" "modesetting" ];
	services.xserver.xkb.variant = "abnt2";
	services.xserver.xkb.layout = "br";
	services.xserver.enable = true;
	hardware.uinput.enable = true;

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

	users.groups.uinput.members = [ "tanikaze" ];
	users.groups.input.members = [ "tanikaze" ];

	### SECURITY SECTION
	security.sudo.wheelNeedsPassword = false;
	security.polkit.enable = true;

	### NETWORKING SECTION
	networking.nftables.ruleset = builtins.readFile ./files/nftables.ini;
	networking.nftables.enable = true;

	networking.nameservers = lib.mkForce [ "1.1.1.1" "8.8.8.8" ];
	networking.networkmanager.enable = true;
	networking.hostName = "tsugumori";

	networking.firewall.enable = false;
	networking.nat.enable = false;

	boot.kernel.sysctl = { "net.ipv4.conf.all.forwarding" = true; };

	services.udev.extraRules = ''
		SUBSYSTEM=="net", ACTION=="add", ATTR{address}=="18:c0:4d:f4:a7:a6", NAME="wan0"
		SUBSYSTEM=="net", ACTION=="add", ATTR{address}=="00:e0:4c:68:06:61", NAME="lan0"
	'';

	### BOOT SECTION
	boot.loader.efi.canTouchEfiVariables = true;
	boot.loader.systemd-boot.enable = true;

	### NIX CONFIGURATION SECTION
	nix.settings.experimental-features = [ "nix-command" "flakes" ];
	system.stateVersion = "24.11";
}
