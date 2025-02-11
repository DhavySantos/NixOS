{ config, lib, ... } : let
  colors = with config.lib.stylix.colors; ''
    @define-color background-alt #${base02};
    @define-color background #${base01};

    @define-color foreground-alt #${base04};
    @define-color foreground #${base07};
    @define-color text #${base07};

    @define-color yellow #${base0A};
    @define-color blue #${base0D};
    @define-color red #${base08};
  '';
in {
  programs.waybar.style = lib.mkForce ''${colors}${builtins.readFile ../../files/waybar.css}'';
  programs.waybar.enable = true;

  programs.waybar.settings.main = {
    position = "bottom";
    layer = "top";
    heigh = 24;

    modules-left = [ "custom/system" "hyprland/workspaces" ];
    modules-center = [ "hyprland/window" ];
    modules-right = [ "tray" "clock" ];

    "hyprland/workspaces" = {
      format = "{icon}";
      format-icons."10" = "󰊗 ";
      format-icons."20" = "󰊗 ";
    };

    "tray" = {
      icon-size = 16;
      spacing = 4;
    };

    "clock" = {
      interval = 60;
      format = "{:%H:%M}";
      tooltip-format = "{:%Y-%m-%s}";
    };

    "custom/system" = {
      format = " ";
    };
  };
}
