{ self, pkgs, ... } : let

wallpaper = pkgs.fetchurl {
  url = "https://i.imgur.com/5ALLimu.jpeg";
  hash = "sha256-7/lzW5BfpC1yF1NwOXnTZ/+IXMavK+Vd71bYQBfUqEA=";
};

in {
  imports = [ self.homeManagerModules.waybar ];

  stylix.targets.waybar.enable = false;

  modules.waybar.enable = true;
  modules.waybar.alpha = 0.8;

  services.hyprpaper.enable = true;
  services.hyprpaper.settings = {
    wallpapers = [ "HDMI-A-1,${builtins.toString wallpaper}" ];
    preload = [ ( builtins.toString wallpaper ) ];
  };

  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.settings = {
    "$MOD2" = "SUPER SHIFT";
    "$MOD1" = "SUPER";

    monitor = [
      "HDMI-A-2, modeline 138.50 1920 1968 2000 2080 1080 1083 1088 1111 +hsync -vsync, 0x0, 1"
      "HDMI-A-1, 1920x1080, 0x1080, 1"
    ];

    workspace = [
      "1, monitor:HDMI-A-1,"
      "2, monitor:HDMI-A-1,"
      "3, monitor:HDMI-A-1,"
      "4, monitor:HDMI-A-1,"
      "5, monitor:HDMI-A-1,"
      "6, monitor:HDMI-A-2,"
      "7, monitor:HDMI-A-2,"
      "8, monitor:HDMI-A-2,"
      "9, monitor:HDMI-A-2,"
      "10, monitor:HDMI-A-2,"
    ];

    bindm = [
      "$MOD1, mouse:273, resizewindow"
      "$MOD1, mouse:272, movewindow"
    ];

    decoration.rounding = 10;

    input.kb_layout = "br";

    general.allow_tearing = true;
    general.gaps_out = 10;
    general.gaps_in = 10;


    bind = import ./keybinds.nix { inherit pkgs; };

    exec-once = (with pkgs; [
      "${waybar}/bin/waybar -c ~/.config/waybar/config"
      "${hyprpaper}/bin/hyprpaper"
    ]);

    windowrulev2 = [
      "nofocus, class:^$, xwayland:1, floating:1, fullscreen:0, pinned:0"
      "suppressevent maximize, noshadow, class:.*"

      "workspace 10, monitor 1, floating, fullscreen, class:^(gamescope|steam_app_\\d+|Minecraft*)$"
      "workspace special:magic, class:^(discord|vesktop|Spotify)$"
    ];
  };
}
