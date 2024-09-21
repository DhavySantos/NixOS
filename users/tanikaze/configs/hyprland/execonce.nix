{ pkgs } : [
	"${pkgs.swww}/bin/swww-daemon"
	"${pkgs.swww}/bin/swww img ~/.config/wallpaper.png"
	"${pkgs.waybar}/bin/waybar -c ~/.config/waybar/config"
	"${pkgs.mpvpaper}/bin/mpvpaper -vs -o \"no-audio loop\" $monitor ~/.config/wallpaper.mp4"
]
