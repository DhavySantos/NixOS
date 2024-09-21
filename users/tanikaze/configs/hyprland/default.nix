{ pkgs, ... } : {
	wayland.windowManager.hyprland = {
		enable = true;

		settings = {
			"$mod1" = "SUPER";
			"$mod2" = "SUPER SHIFT";
			"$monitor" = "HDMI-A-1";

			monitor = "$monitor, 1920x1080, 0x0, 1";

			decoration.rounding = 6;
			input.kb_layout = "br";

			windowrulev2 = (import ./windowrules.nix);
			bind = (import ./keybinds.nix { inherit pkgs; });
			exec-once = (import ./execonce.nix { inherit pkgs; });
			bindm = [ "$mod1, mouse:272, movewindow" "$mod1, mouse:273, resizewindow" ];
		};
	};
}
