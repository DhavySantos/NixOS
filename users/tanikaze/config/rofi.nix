{ lib, config, ... } : let

style = with config.lib.stylix.colors; ''
* {
	background:     #${base01}FF;
	background-alt: #${base02}FF;
	foreground:     #${base05}FF;
	selected:       #${base07}FF;
	active:         #${base0C}FF;
	urgent:         #${base08}FF;
}

${builtins.readFile ../files/rofi.rasi}
'';

in {
	programs.rofi.enable = true;
	programs.rofi.extraConfig = {
		modi = "drun";
		show-icons = true;
		display-drun = " ";
		drun-display-format = "{name}";
		window-format = "{w} · {c} · {t}";
		font = "CaskaydiaCove Nerd Font 10";
	};

	programs.rofi.theme = lib.mkForce "style.rasi";

	home.file.".config/rofi/style.rasi" = {
		text = "${style}";
		recursive = true;
	};
}

