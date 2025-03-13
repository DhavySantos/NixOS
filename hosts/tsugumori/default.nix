{ self, inputs, pkgs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    inputs.disko.nixosModules.disko
    "${self}/users/tanikaze"
    ./config/services.nix
    ./config/pipewire.nix
    ./config/xserver.nix
    ./hardware.nix
    ./disko.nix
  ];

  home-manager.extraSpecialArgs = { inherit inputs self; };
  home-manager.backupFileExtension = "backup";

  users.users.tanikaze = {
    extraGroups = [ "wheel" ];
    isNormalUser = true;
  };

  environment.systemPackages = with pkgs; [
    p7zip unzip unrar zip lact droidcam
    pulsemixer
  ];

  fonts.packages = with pkgs; [
    CascadiaCode-NerdFont
  ];

  programs.gamescope.enable = true;
  programs.nix-ld.enable = true;
  programs.steam.enable = true;
  programs.dconf.enable = true;
  programs.nh.enable = true;

  environment.pathsToLink = [ "/share/zsh" ];

  time.timeZone = "America/Sao_Paulo";
  i18n.defaultLocale = "en_US.UTF-8";
  console.keyMap = "br-abnt2";

  security.sudo.wheelNeedsPassword = false;
  security.polkit.enable = true;

  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.enable = true;

  powerManagement.cpuFreqGovernor = "performance";

  boot.tmp.cleanOnBoot = true;
  boot.tmp.tmpfsSize = "100%";
  boot.tmp.useTmpfs = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.overlays = [ inputs.nixverse.overlays.default ];
  nixpkgs.config.allowUnfree = true;
  networking.hostName = "tsugumori";
  system.stateVersion = "24.11";
}
