{ config, pkgs, ... }:

{
  services.picom.backend = "glx";
  services.picom.shadow = false;
  services.picom.enable = true;
  services.picom.vSync = true;

  xsession.windowManager.i3.enable = true;
  xsession.windowManager.i3.config = {
    keybindings = let modifier = config.xsession.windowManager.i3.config.modifier; in {
      "Print" = "exec ${pkgs.maim}/bin/maim -s | ${pkgs.xclip}/bin/xclip -selection clipboard -t image/png";
      "${modifier}+r" = "exec ${pkgs.rofi}/bin/rofi -show drun -show-icons";
      "${modifier}+Return" = "exec ${pkgs.kitty}/bin/kitty";
      "${modifier}+Shift+x" = "kill";

      "${modifier}+w" = "focus up";
      "${modifier}+a" = "focus left";
      "${modifier}+s" = "focus down";
      "${modifier}+d" = "focus right";

      "${modifier}+Shift+w" = "move up";
      "${modifier}+Shift+a" = "move left";
      "${modifier}+Shift+s" = "move down";
      "${modifier}+Shift+d" = "move right";

      "${modifier}+h" = "split h";
      "${modifier}+v" = "split v";

      "${modifier}+Shift+f" = "floating toggle";
      "${modifier}+space" = "focus mode_toggle";
      "${modifier}+f" = "fullscreen toggle";

      "${modifier}+q" = "workspace number 0";
      "${modifier}+1" = "workspace number 1";
      "${modifier}+2" = "workspace number 2";
      "${modifier}+3" = "workspace number 3";
      "${modifier}+4" = "workspace number 4";
      "${modifier}+5" = "workspace number 5";

      "${modifier}+Shift+1" = "move container to workspace number 1";
      "${modifier}+Shift+2" = "move container to workspace number 2";
      "${modifier}+Shift+3" = "move container to workspace number 3";
      "${modifier}+Shift+4" = "move container to workspace number 4";
      "${modifier}+Shift+5" = "move container to workspace number 5";

      "${modifier}+F1" = "workspace number 6";
      "${modifier}+F2" = "workspace number 7";
      "${modifier}+F3" = "workspace number 8";
      "${modifier}+F4" = "workspace number 9";
      "${modifier}+F5" = "workspace number 10";

      "${modifier}+Shift+F1" = "move container to workspace number 6";
      "${modifier}+Shift+F2" = "move container to workspace number 7";
      "${modifier}+Shift+F3" = "move container to workspace number 8";
      "${modifier}+Shift+F4" = "move container to workspace number 9";
      "${modifier}+Shift+F5" = "move container to workspace number 10";

      "${modifier}+Shift+c" = "reload";
      "${modifier}+Shift+r" = "restart";
    };

    modifier = "Mod4";

    window = {
      titlebar = false;
    };

    floating = {
      titlebar = false;
    };

    gaps = {
      inner = 5;
      outer = 5;
    };

    startup = [
      { command = "--no-startup-id ${pkgs.feh}/bin/feh --bg-fill ${config.stylix.image}"; }
    ];
  };

  xsession.windowManager.i3.extraConfig = ''
    for_window [class="awakened-poe-trade"] floating enable, move to workspace 10
    for_window [class="(steam_apps*|gamescope)"] move workspace number 10

    workspace 1 output HDMI-A-0
    workspace 2 output HDMI-A-0
    workspace 3 output HDMI-A-0
    workspace 4 output HDMI-A-0
    workspace 5 output HDMI-A-0

    workspace 6 output HDMI-A-1
    workspace 7 output HDMI-A-1
    workspace 8 output HDMI-A-1
    workspace 9 output HDMI-A-1
    workspace 10 output HDMI-A-1
  '';
}
