{ pkgs, ... } : [
  "$MOD2, N, exec, ${pkgs.google-chrome}/bin/google-chrome-stable --incognito"
  "$MOD1, N, exec, ${pkgs.google-chrome}/bin/google-chrome-stable"
  "$MOD2, RETURN, exec, ${pkgs.kitty}/bin/kitty -o shell ${pkgs.tmux}/bin/tmux"
  "$MOD1, RETURN, exec, ${pkgs.kitty}/bin/kitty"

  "     , PRINT, exec, ${pkgs.hyprshot}/bin/hyprshot -m window -m active --clipboard-only"
  "SHIFT, PRINT, exec, ${pkgs.hyprshot}/bin/hyprshot -m region --clipboard-only"
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

  "$MOD1, F1, workspace, 6"
  "$MOD1, F2, workspace, 7"
  "$MOD1, F3, workspace, 8"
  "$MOD1, F4, workspace, 9"
  "$MOD1, F5, workspace, 10"

  "$MOD2, 1, movetoworkspace, 1"
  "$MOD2, 2, movetoworkspace, 2"
  "$MOD2, 3, movetoworkspace, 3"
  "$MOD2, 4, movetoworkspace, 4"
  "$MOD2, 5, movetoworkspace, 5"

  "$MOD2, F1, movetoworkspace, 6"
  "$MOD2, F2, movetoworkspace, 7"
  "$MOD2, F3, movetoworkspace, 8"
  "$MOD2, F4, movetoworkspace, 9"
  "$MOD2, F5, movetoworkspace, 10"
]
