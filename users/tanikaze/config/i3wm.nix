{ pkgs, ... } : let

mod = "Mod4";
wallpaper = pkgs.fetchurl {
  url = "https://gruvbox-wallpapers.pages.dev/wallpapers/irl/village.jpg";
  hash = "sha256-t3ItqKeewcpGLoyFG4ch23stzGpaujFfANM++Aj3SDM";
};

in {
  services.picom.backend = "glx";
  services.picom.enable = true;
  services.picom.shadow= false;
  services.picom.vSync = true;

  xsession.windowManager.i3.enable = true;
  xsession.windowManager.i3.config = {
    defaultWorkspace = "workspace number 1";
    modifier = "${mod}";

    window.titlebar = false;
    gaps.inner = 5;
    gaps.outer = 5;

    bars = [];

    keybindings = {
      "Print" = "exec ${pkgs.maim}/bin/maim -s | ${pkgs.xclip}/bin/xclip -selection clipboard -t image/png";
      "${mod}+Return" = "exec ${pkgs.kitty}/bin/kitty -o font_size=11";
      "${mod}+r" = "exec ${pkgs.rofi}/bin/rofi -show drun -show-icons";
      "${mod}+Shift+x" = "kill";

      "${mod}+w" = "focus up";
      "${mod}+a" = "focus left";
      "${mod}+s" = "focus down";
      "${mod}+d" = "focus right";

      "${mod}+Shift+w" = "move up";
      "${mod}+Shift+a" = "move left";
      "${mod}+Shift+s" = "move down";
      "${mod}+Shift+d" = "move right";

      "${mod}+h" = "split h";
      "${mod}+v" = "split v";

      "${mod}+Shift+f" = "floating toggle";
      "${mod}+space" = "focus mode_toggle";
      "${mod}+f" = "fullscreen toggle";

      "${mod}+q" = "workspace number 0";
      "${mod}+1" = "workspace number 1";
      "${mod}+2" = "workspace number 2";
      "${mod}+3" = "workspace number 3";
      "${mod}+4" = "workspace number 4";
      "${mod}+5" = "workspace number 5";
      "${mod}+6" = "workspace number 6";
      "${mod}+7" = "workspace number 7";
      "${mod}+8" = "workspace number 8";
      "${mod}+9" = "workspace number 9";
      "${mod}+0" = "workspace number 10";

      "${mod}+Shift+q" = "move container to workspace number 0";
      "${mod}+Shift+1" = "move container to workspace number 1";
      "${mod}+Shift+2" = "move container to workspace number 2";
      "${mod}+Shift+3" = "move container to workspace number 3";
      "${mod}+Shift+4" = "move container to workspace number 4";
      "${mod}+Shift+5" = "move container to workspace number 5";
      "${mod}+Shift+6" = "move container to workspace number 6";
      "${mod}+Shift+7" = "move container to workspace number 7";
      "${mod}+Shift+8" = "move container to workspace number 8";
      "${mod}+Shift+9" = "move container to workspace number 9";
      "${mod}+Shift+0" = "move container to workspace number 10";

      "${mod}+apostrophe" = "scratchpad show";

      "${mod}+Shift+c" = "reload";
      "${mod}+Shift+r" = "restart";
    };

    startup = [
      { command = "${pkgs.xorg.xrandr}/bin/xrandr --output HDMI-A-0 --mode \"1920x1080\""; }
      { command = "${pkgs.polybar}/bin/polybar mybar -c ~/.config/polybar/config.ini"; }
      { command = "${pkgs.feh}/bin/feh --bg-fill ${wallpaper}"; }
    ];
  };

  xsession.windowManager.i3.extraConfig = ''
    for_window [class="awakened-poe-trade"] floating enable, move to workspace 0

    for_window [class="steam_apps*"] move workspace number 0
    for_window [class="gamescope"] move workspace number 0

    for_window [class="(discord|vesktop)"] move absolute position 10 10
    for_window [class="(discord|vesktop)"] resize set 1900 1035
    for_window [class="(discord|vesktop)"] sticky enable
  '';
}
