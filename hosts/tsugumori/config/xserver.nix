{ pkgs, ... }:

{
  services.displayManager.autoLogin.user = "tanikaze";
  services.displayManager.defaultSession = "none+i3";
  services.displayManager.autoLogin.enable = true;

  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.displayManager.setupCommands = ''
    ${pkgs.xorg.xrandr}/bin/xrandr --newmode "1920x1080R" 138.50 1920 1968 2000 2080 1080 1083 1088 1111 +hsync -vsync
    ${pkgs.xorg.xrandr}/bin/xrandr --addmode HDMI-A-1 "1920x1080R"
    ${pkgs.xorg.xrandr}/bin/xrandr --output HDMI-A-1 --mode "1920x1080R"
    ${pkgs.xorg.xrandr}/bin/xrandr --output HDMI-A-0 --primary --mode "1920x1080" --below HDMI-A-1
  '';

  services.xserver.desktopManager.xterm.enable = false;
  services.xserver.windowManager.i3.enable = true;

  systemd.services."autovt@tty1".enable = false;
  systemd.services."getty@tty1".enable = false;

  environment.pathsToLink = [ "/libexec" ];

  services.xserver.videoDrivers = [ "amdgpu" ];
  services.xserver.xkb.variant = "abnt2";
  services.xserver.xkb.layout = "br";
  services.xserver.enable = true;
  hardware.uinput.enable = true;

  hardware.graphics = {
    enable32Bit = true;
    enable = true;
  };
}
