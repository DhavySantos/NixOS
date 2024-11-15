{ ... } : {
	services.displayManager.autoLogin.user = "tanikaze";
	services.displayManager.autoLogin.enable = true;

	systemd.services."autovt@tty1".enable = false;
	systemd.services."getty@tty1".enable = false;

	services.displayManager.sddm.enable = true;
	programs.hyprland.xwayland.enable = true;
	programs.hyprland.enable = true;

	services.xserver.videoDrivers = [ "amdgpu" "modesetting" ];
	services.xserver.xkb.variant = "abnt2";
	services.xserver.xkb.layout = "br";
	services.xserver.enable = true;
	hardware.uinput.enable = true;

	hardware.graphics = {
		enable32Bit = true;
		enable = true;
	};
}
