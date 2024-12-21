{ pkgs, ... } : {
  services.displayManager.autoLogin.user = "tanikaze";
  services.displayManager.autoLogin.enable = true;

  systemd.services."autovt@tty1".enable = false;
  systemd.services."getty@tty1".enable = false;

  services.xserver.windowManager.i3.package = pkgs.i3-gaps;
  services.xserver.windowManager.i3.enable = true;

  services.xserver.displayManager.lightdm.enable = true;
  services.displayManager.defaultSession = "none+i3";

  services.xserver.videoDrivers = [ "amdgpu" "modesetting" ];
  services.xserver.xkb.variant = "abnt2";
  services.xserver.xkb.layout = "br";
  services.xserver.enable = true;
  hardware.uinput.enable = true;

  hardware.graphics = {
    enable32Bit = true;
    enable = true;
  };
}
