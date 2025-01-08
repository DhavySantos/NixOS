{ pkgs, ... } : {
  services.displayManager.autoLogin.user = "tanikaze";
  services.displayManager.autoLogin.enable = true;

  systemd.services."autovt@tty1".enable = false;
  systemd.services."getty@tty1".enable = false;

  xdg.portal.extraPortals = with pkgs; [
    xdg-desktop-portal-hyprland
    xdg-desktop-portal-gtk
  ];

  xdg.portal.enable = true;

  environment.systemPackages = with pkgs; [
    dunst libnotify wl-clipboard
  ];

  services.displayManager.sddm.enable = true;
  programs.hyprland.xwayland.enable = true;
  programs.hyprland.enable = true;

  services.xserver.videoDrivers = [ "amdgpu" "modesetting" ];
  services.xserver.xkb.variant = "abnt2";
  services.xserver.xkb.layout = "br";
  services.xserver.enable = true;
  hardware.uinput.enable = true;

  environment.variables = {
    ROC_ENABLE_PRE_VEGA = "1";
  };

  hardware.graphics = {
    extraPackages = with pkgs; [ rocmPackages.clr.icd ];
    enable32Bit = true;
    enable = true;
  };
}
