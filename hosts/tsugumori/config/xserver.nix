{
  services.displayManager.autoLogin.user = "tanikaze";
  services.displayManager.autoLogin.enable = true;
  services.displayManager.lightdm.enable = true;

  services.xserver.displayManager.defaultSession = "nonde+i3";
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
