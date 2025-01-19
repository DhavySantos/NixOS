{ pkgs, ... } : let
  wallpaper = pkgs.fetchurl {
    url = "https://gruvbox-wallpapers.pages.dev/wallpapers/irl/village.jpg";
    hash = "sha256-t3ItqKeewcpGLoyFG4ch23stzGpaujFfANM++Aj3SDM";
  };
in {
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
      "1, monitor:HDMI-A-1, "
      "2, monitor:HDMI-A-1, "
      "3, monitor:HDMI-A-1, "
      "4, monitor:HDMI-A-1, "
      "5, monitor:HDMI-A-1, "
      "6, monitor:HDMI-A-1, "
      "7, monitor:HDMI-A-1, "
      "8, monitor:HDMI-A-1, "
      "9, monitor:HDMI-A-1, "
      "10, monitor:HDMI-A-1, "

      "11, monitor:HDMI-A-2, "
      "12, monitor:HDMI-A-2, "
      "13, monitor:HDMI-A-2, "
      "14, monitor:HDMI-A-2, "
      "15, monitor:HDMI-A-2, "
      "16, monitor:HDMI-A-2, "
      "17, monitor:HDMI-A-2, "
      "18, monitor:HDMI-A-2, "
      "19, monitor:HDMI-A-2, "
      "20, monitor:HDMI-A-2, "
    ];

    bindm = [
      "$MOD1, mouse:273, resizewindow"
      "$MOD1, mouse:272, movewindow"
    ];

    input.kb_layout = "br";

    bind = [
      "$MOD2, N, exec, ${pkgs.google-chrome}/bin/google-chrome-stable --incognito"
      "$MOD1, N, exec, ${pkgs.google-chrome}/bin/google-chrome-stable"
      "$MOD1, RETURN, exec, ${pkgs.kitty}/bin/kitty"

      ",PRINT, exec, ${pkgs.hyprshot}/bin/hyprshot -m region --clipboard-only"
      "$MOD1, R, exec, ${pkgs.rofi-wayland}/bin/rofi -show-icons -show drun"
      "$MOD2, F, togglefloating"
      "$MOD1, J, togglesplit"
      "$MOD2, X, killactive"

      "$MOD1, w, movefocus, u"
      "$MOD1, a, movefocus, l"
      "$MOD1, s, movefocus, d"
      "$MOD1, d, movefocus, r"

      "$MOD2, apostrophe, movetoworkspace, special:magic"
      "$MOD1, apostrophe, togglespecialworkspace, magic"

      "$MOD1, 1, workspace, 1"
      "$MOD1, 2, workspace, 2"
      "$MOD1, 3, workspace, 3"
      "$MOD1, 4, workspace, 4"
      "$MOD1, 5, workspace, 5"
      "$MOD1, 6, workspace, 6"
      "$MOD1, 7, workspace, 7"
      "$MOD1, 8, workspace, 8"
      "$MOD1, 9, workspace, 9"
      "$MOD1, Q, workspace, 10"

      "$MOD2, 1, movetoworkspace, 1"
      "$MOD2, 2, movetoworkspace, 2"
      "$MOD2, 3, movetoworkspace, 3"
      "$MOD2, 4, movetoworkspace, 4"
      "$MOD2, 5, movetoworkspace, 5"
      "$MOD2, 6, movetoworkspace, 6"
      "$MOD2, 7, movetoworkspace, 7"
      "$MOD2, 8, movetoworkspace, 8"
      "$MOD2, 9, movetoworkspace, 9"
      "$MOD2, Q, movetoworkspace, 10"

      "$MOD1, F1, workspace, 11"
      "$MOD1, F2, workspace, 12"
      "$MOD1, F3, workspace, 13"
      "$MOD1, F4, workspace, 14"
      "$MOD1, F5, workspace, 15"
      "$MOD1, F6, workspace, 16"
      "$MOD1, F7, workspace, 17"
      "$MOD1, F8, workspace, 18"
      "$MOD1, F9, workspace, 19"
      "$MOD1, F10, workspace, 20"

      "$MOD2, F1, movetoworkspace, 11"
      "$MOD2, F2, movetoworkspace, 12"
      "$MOD2, F3, movetoworkspace, 13"
      "$MOD2, F4, movetoworkspace, 14"
      "$MOD2, F5, movetoworkspace, 15"
      "$MOD2, F6, movetoworkspace, 16"
      "$MOD2, F7, movetoworkspace, 17"
      "$MOD2, F8, movetoworkspace, 18"
      "$MOD2, F9, movetoworkspace, 19"
      "$MOD2, F10, movetoworkspace, 20"
    ];

    windowrulev2 = [
      "nofocus, class:^$, xwayland:1, floating:1, fullscreen:0, pinned:0"
      "suppressevent maximize, noshadow, class:.*"

      "workspace 10, monitor 1, floating, fullscreen, class:^(gamescope|steam_app_\\d+)$"
      "workspace special:magic, class:^(discord|vesktop|Spotify)$"
    ];
  };
}
