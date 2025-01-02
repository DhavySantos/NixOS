{ pkgs, ... } : let

wallpaper = pkgs.fetchurl {
  url = "https://gruvbox-wallpapers.pages.dev/wallpapers/irl/village.jpg";
  hash = "sha256-t3ItqKeewcpGLoyFG4ch23stzGpaujFfANM++Aj3SDM";
};

in {
  services.hyprpaper.enable = true;
  services.hyprpaper.settings = {
    preload = [
      ( builtins.toString wallpaper )
    ];

    wallpapers = [
      "HDMI-A-1,${builtins.toString wallpaper}"
    ];
  };

  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.settings = {
    "$MOD1" = "SUPER";
    "$MOD2" = "SUPER SHIFT";

    monitor = "HDMI-A-1, 1920x1080, 0x0, 1";

    bindm = [
      "$MOD1, mouse:272, movewindow"
      "$MOD1, mouse:273, resizewindow"
    ];

    input.kb_layout = "br";

    bind = [
      "$MOD1, RETURN, exec, ${pkgs.kitty}/bin/kitty -o shell ${pkgs.tmux}/bin/tmux new -A -s Dash"
      ",PRINT, exec, ${pkgs.hyprshot}/bin/hyprshot -m region --clipboard-only"
      "$MOD1, R, exec, ${pkgs.rofi-wayland}/bin/rofi -show-icons -show drun"
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
    ];

    windowrulev2 = [
      "nofocus,class:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      "suppressevent maximize, class:.*"

      "workspace special:magic, class:vesktop"
      "workspace special:magic, class:discord"
      "workspace special:magic, class:Spotify"

      "workspace 10,class:gamescope"
      "fullscreen,class:gamescope"
      "monitor 1,class:gamescope"
    ];
  };
}
