{ pkgs } : [
	"     , PRINT, exec, ${pkgs.hyprshot}/bin/hyprshot -m region --clipboard-only"
	"$mod1, R, exec, ${pkgs.rofi-wayland}/bin/rofi -show-icons -show drun"
	"$mod1, RETURN, exec, ${pkgs.alacritty}/bin/alacritty"

	"$mod1, SPACE, togglefloating"
	"$mod1, F, fullscreen"
	"$mod2, X, killactive"

	"$mod1, 1, workspace, 1"
	"$mod1, 2, workspace, 2"
	"$mod1, 3, workspace, 3"
	"$mod1, 4, workspace, 4"
	"$mod1, 5, workspace, 5"
	"$mod1, 6, workspace, 6"
	"$mod1, 7, workspace, 7"
	"$mod1, 8, workspace, 8"
	"$mod1, 9, workspace, 9"
	"$mod1, Q, workspace, 10"

	"$mod1, w, movefocus, u"
	"$mod1, a, movefocus, l"
	"$mod1, s, movefocus, d"
	"$mod1, d, movefocus, r"
	"$mod1, apostrophe, togglespecialworkspace, magic"


	"$mod2, 1, movetoworkspace, 1"
	"$mod2, 2, movetoworkspace, 2"
	"$mod2, 3, movetoworkspace, 3"
	"$mod2, 4, movetoworkspace, 4"
	"$mod2, 5, movetoworkspace, 5"
	"$mod2, 6, movetoworkspace, 6"
	"$mod2, 7, movetoworkspace, 7"
	"$mod2, 8, movetoworkspace, 8"
	"$mod2, 9, movetoworkspace, 9"
	"$mod2, Q, movetoworkspace, 10"
	"$mod2, apostrophe, movetoworkspace, special:magic"
]
