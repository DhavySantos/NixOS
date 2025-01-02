{ pkgs, ... } : {
  systemd.services."autovt@tty1".enable = false;
  systemd.services."getty@tty1".enable = false;

  xdg.portal.extraPortals = with pkgs; [ xdg-desktop-portal-gtk xdg-desktop-portal-hyprland ];
  xdg.portal.enable = true;

  environment.systemPackages = with pkgs; [
    dunst libnotify wl-clipboard xclip
  ];

  services.xserver.windowManager.i3.package = pkgs.i3-gaps;
  services.xserver.windowManager.i3.enable = true;

  services.displayManager.sddm.enable = true;
  programs.hyprland.xwayland.enable = true;
  programs.hyprland.enable = true;

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
