{ config, lib, ... } : let

colors = config.lib.stylix.colors;

styles = with colors; ''
@define-color base00 #${base00}; @define-color base01 #${base01}; @define-color base02 #${base02}; @define-color base03 #${base03};
@define-color base04 #${base04}; @define-color base05 #${base05}; @define-color base06 #${base06}; @define-color base07 #${base07};

@define-color base08 #${base08}; @define-color base09 #${base09}; @define-color base0A #${base0A}; @define-color base0B #${base0B};
@define-color base0C #${base0C}; @define-color base0D #${base0D}; @define-color base0E #${base0E}; @define-color base0F #${base0F};

${builtins.readFile ../files/waybar.css}
'';

in {

	programs.waybar.style = lib.mkForce "${styles}";
	programs.waybar.enable = true;

	programs.waybar.settings.mainBar = {
		output = [ "HDMI-A-1" ];
		position = "bottom";
		name = "mainBar";
		layer = "top";
		height = 34;

		modules-left = [
			"custom/system"
			"hyprland/workspaces"
			# "clock#timeg"
			# "clock#date"
		];

		modules-center = [
			"hyprland/window"
		];

		modules-right = [
			"pulseaudio"
			"cpu"
			"memory"
			"group/minimized"
		];

		"hyprland/workspaces" = {
			format = "{icon}";
			format-icons = {
				"10" = "󰖺";
			};
		};

		"hyprland/window" = {
			format = "{title}";
		};

		"memory" = {
			format = "<span color=\"#${colors.base0A}\">   </span>{used:0.1f}GiB ";
			interval = 1;
		};

		"cpu" = {
			format = "<span color=\"#${colors.base0A}\">   </span>{usage}%";
			interval = 1;
		};

		"pulseaudio" = {
			format = "<span color=\"#${colors.base0A}\">   </span>{volume}%";
		};

		"clock#time" = {
			interval = 1;
			format = "<span color=\"#${colors.base0A}\">  </span>{:%H:%M:%S}";
		};

		"clock#date" = {
			interval = 60;
			format = "<span color=\"#${colors.base0A}\">  </span>{:%d/%m/%Y}";
		};

		"tray" = {
			icon-size = 14;
			spacing = 2;
		};

		"group/minimized" = {
			orientation = "horizontal";
				modules = ["custom/expand" "tray"];
				drawer = {
					transition-left-to-right = false;
					children-class = "minimized";
					transition-duration = 500;
				};
		};

		"custom/expand" = {
			tooltip = false;
			format = "";
		};

		"custom/system" = {
			format = "  ";
		};
	};
}

