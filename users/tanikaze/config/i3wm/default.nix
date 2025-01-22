{ pkgs, ... } : let

wallpaper = pkgs.fetchurl {
  url = "https://gruvbox-wallpapers.pages.dev/wallpapers/irl/village.jpg";
  hash = "sha256-t3ItqKeewcpGLoyFG4ch23stzGpaujFfANM++Aj3SDM";
};

mod = "Mod4";

in {
  imports = [
    ./polybar.nix
  ];

  home.file.".xprofile".text = ''
    ${pkgs.xorg.xrandr}/bin/xrandr --newmode "1920x1080R" 138.50 1920 1968 2000 2080 1080 1083 1088 1111 +hsync -vsyn
    ${pkgs.xorg.xrandr}/bin/xrandr --addmode HDMI-A-1 1920x1080R
    ${pkgs.xorg.xrandr}/bin/xrandr --output HDMI-A-0 --mode 1920x1080
    ${pkgs.xorg.xrandr}/bin/xrandr --output HDMI-A-1 --mode 1920x1080R --above HDMI-A-0
  '';

  services.picom.backend = "glx";
  services.picom.enable = true;
  services.picom.shadow = false;
  services.picom.vSync = true;

  xsession.windowManager.i3.enable = true;
  xsession.windowManager.i3.config = {
    defaultWorkspace = "workspace number 1";
    keybindings = import ./keybinds.nix { inherit mod pkgs; };
    modifier = "${mod}";
    bars = [];

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
      { command = "sleep 2 && ${pkgs.feh}/bin/feh --bg-fill ${wallpaper}"; }
      { command = "${pkgs.polybar}/bin/polybar -c ~/.config/polybar/config.ini HDMI-A-0"; }
      { command = "${pkgs.polybar}/bin/polybar -c ~/.config/polybar/config.ini HDMI-A-1"; }
    ];
  };

  xsession.windowManager.i3.extraConfig = ''
    for_window [class="awakened-poe-trade"] floating enable, move to workspace 0
    for_window [class="(steam_apps*|gamescope)"] move workspace number 0
  '';
}
