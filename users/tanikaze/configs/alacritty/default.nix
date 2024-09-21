{ lib, pkgs, ... } :

let

font = "CaskaydiaCove Nerd Font";

in

{
	programs.alacritty.enable = true;

	programs.alacritty.settings.font = {
		normal = { family = lib.mkForce font; style = lib.mkForce "SemiBold"; };
		italic = { family = lib.mkForce font; style = lib.mkForce "BoldItalic"; };
		bold = { family = lib.mkForce font; style = lib.mkForce "Bold"; };
	};

	programs.alacritty.settings.env = {
		term = "xterm-256color";
	};

	programs.alacritty.settings.shell = {
		program = "${pkgs.tmux}/bin/tmux";
		args = [ ];
	};

	programs.alacritty.settings.window = {
		padding = { x = 10; y = 10; };
	};
}
