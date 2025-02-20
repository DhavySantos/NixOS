{ pkgs, ... } : let

wallpaper = pkgs.fetchurl {
  url = "https://gruvbox-wallpapers.pages.dev/wallpapers/irl/village.jpg";
  hash = "sha256-t3ItqKeewcpGLoyFG4ch23stzGpaujFfANM++Aj3SDM";
};

in {
  imports = [ ./waybar.nix ];

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
      "6, monitor:HDMI-A-1,"
      "7, monitor:HDMI-A-1,"
      "8, monitor:HDMI-A-1,"
      "9, monitor:HDMI-A-1,"

      "11, monitor:HDMI-A-2,"
      "12, monitor:HDMI-A-2,"
      "13, monitor:HDMI-A-2,"
      "14, monitor:HDMI-A-2,"
      "15, monitor:HDMI-A-2,"
      "16, monitor:HDMI-A-2,"
      "17, monitor:HDMI-A-2,"
      "18, monitor:HDMI-A-2,"
      "19, monitor:HDMI-A-2,"
    ];

    bindm = [
      "$MOD1, mouse:273, resizewindow"
      "$MOD1, mouse:272, movewindow"
    ];

    input.kb_layout = "br";
    general.allow_tearing = true;

    bind = import ./keybinds.nix { inherit pkgs; };

    exec-once = (with pkgs; [
      "${waybar}/bin/waybar -c ~/.config/waybar/config"
      "${hyprpaper}/bin/hyprpaper"
    ]);

    windowrulev2 = [
      "nofocus, class:^$, xwayland:1, floating:1, fullscreen:0, pinned:0"
      "suppressevent maximize, noshadow, class:.*"

      "workspace 20, monitor 1, floating, fullscreen, class:^(gamescope|steam_app_\\d+)$"
      "workspace special:magic, class:^(discord|vesktop|Spotify)$"
    ];
  };
}
