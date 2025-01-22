{
  services.polybar.script = "polybar mybar &";
  services.polybar.enable = true;
  services.polybar.config = {
    colors = {
      background = "#282828";
      background-alt = "#504945";
      foreground = "#d5c4a1";
      foreground-alt = "#fbf1c7";
      color1 = "#fb4934";
      color2 = "#fe8019";
      color3 = "#fabd2f";
      color4 = "#b8bb26";
      color5 = "#8ec07c";
      color6 = "#83a598";
      color7 = "#d3869b";
      color8 = "#d65d0e";
    };

    "bar/HDMI-A-0" = {
      monitor = "HDMI-A-0";
      font-0 = "CaskaydiaCoveNerdFont:style=bold:size=10";
      width = "100%";
      height = 26;
      bottom = true;
      separator = "/";
      background = "\${colors.background}";
      foreground = "\${colors.foreground}";
      separator-foreground = "\${colors.background-alt}";
      module-margin = 1;
      padding-right = 1;
      padding-left = 2;
      border-size = 0;
      modules-left = [ "date" "xworkspaces" ];
      modules-center = [ "title" ];
      modules-right = [ "tray" ];
    };

    "bar/HDMI-A-1" = {
      monitor = "HDMI-A-1";
      font-0 = "CaskaydiaCoveNerdFont:style=bold:size=10";
      width = "100%";
      height = 26;
      bottom = true;
      separator = "/";
      background = "\${colors.background}";
      foreground = "\${colors.foreground}";
      separator-foreground = "\${colors.background-alt}";
      module-margin = 1;
      padding-right = 1;
      padding-left = 2;
      border-size = 0;
      modules-left = [ "date" "xworkspaces" ];
      modules-center = [ "title" ];
      modules-right = [ ];
    };

    "module/date" = {
      type = "internal/date";
      interval = 1;
      date = "%d/%m/%Y%";
      time = "%H:%M:%S";
      label = "%time%";
      format = "<label>";
    };

    "module/tray" = {
      type = "internal/tray";
      format-margin = "0px";
      tray-spacing = "4px";
    };

    "module/title" = {
      type = "internal/xwindow";
      format = "<label>";

      label = "%title%";
      label-maxlen = 50;

      label-empty = "Empty";
      label-empty-foreground = "\${colors.color6}";

      format-background = "\${colors.background}";
      format-foreground = "\${colors.foreground}";
    };

    "module/xworkspaces" = {
      type = "internal/xworkspaces";
      group-by-monitor = true;
      pin-workspaces = true;
      enable-click = false;
      label = "%name%";

      # Urgent
      label-urgent = "%name%";
      label-urgent-foreground = "\${colors.foreground}";
      label-urgent-background = "\${colors.background}";
      label-urgent-underline = "\${colors.color1}";
      label-urgent-padding = 1;

      # Occupied
      label-occupied = "%name%";
      label-occupied-foreground = "\${colors.foreground}";
      label-occupied-background = "\${colors.background}";
      label-occupied-underline = "\${colors.background}";
      label-occupied-padding = 1;

      # Active
      label-active = "%name%";
      label-active-foreground = "\${colors.foreground}";
      label-active-background = "\${colors.background-alt}";
      label-active-underline = "\${colors.color3}";
      label-active-padding = 1;
    };
  };
}
