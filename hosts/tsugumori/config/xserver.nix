{ pkgs, ... } : {
  systemd.services."autovt@tty1".enable = false;
  systemd.services."getty@tty1".enable = false;
  services.displayManager.sddm.enable = true;

  services.xserver.windowManager.i3.package = pkgs.i3-gaps;
  services.xserver.windowManager.i3.enable = true;

  programs.hyprland.xwayland.enable = true;
  programs.hyprland.enable = true;

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
