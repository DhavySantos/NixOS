{ self, inputs, pkgs, ... } : {

  imports = [
    inputs.home-manager.nixosModules.home-manager
    inputs.disko.nixosModules.disko
    "${self}/users/tanikaze"
    ./config/pipewire.nix
    ./config/network.nix
    ./config/xserver.nix
    ./hardware.nix
    ./disko.nix
  ];

  users.users.tanikaze = {
    extraGroups = [ "wheel" "uinput" "input" "gamemode" ];
    isNormalUser = true;
  };

  environment.systemPackages = (with pkgs; [
    vulkan-loader vulkan-headers vulkan-tools
    p7zip unzip unrar dunst
  ]);

  fonts.packages = (with pkgs; [
    CascadiaCode
  ]);

  programs.gamemode.settings.custom.start = "${pkgs.libnotify}/bin/notify-send \"GameMode started\"";
  programs.gamemode.settings.custom.end = "${pkgs.libnotify}/bin/notify-send \"GameMode ended\"";
  programs.gamemode.settings.general.renice = 20;
  programs.gamemode.enable = true;

  programs.gamescope.enable = true;
  programs.dconf.enable = true;
  programs.steam.enable = true;
  programs.nh.enable = true;

  environment.pathsToLink = [ "/share/zsh" ];
  time.timeZone = "America/Sao_Paulo";
  i18n.defaultLocale = "en_US.UTF-8";
  console.keyMap = "br-abnt2";

  security.sudo.wheelNeedsPassword = false;
  security.polkit.enable = true;

  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.overlays = [ self.outputs.overlays.default ];
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "24.11";
}
