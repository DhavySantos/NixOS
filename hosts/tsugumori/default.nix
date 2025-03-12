{ self, inputs, pkgs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    "${self}/users/tanikaze"
    ./config/pipewire.nix
    ./config/xserver.nix
    ./hardware.nix
  ];

  home-manager.extraSpecialArgs = { inherit inputs self; };
  home-manager.backupFileExtension = "backup";

  users.users.tanikaze = {
    extraGroups = [ "wheel" ];
    isNormalUser = true;
  };

  environment.systemPackages = with pkgs; [
    p7zip unzip unrar zip pulsemixer
  ];

  fonts.packages = with pkgs; [
    CascadiaCode-NerdFont
  ];

  programs.gamescope.args = [ "-e" "-f" "-w 1920" "-h 1080" ];
  programs.gamescope.enable = true;

  programs.steam.enable = true;
  programs.dconf.enable = true;

  environment.pathsToLink = [ "/share/zsh" ];
  time.timeZone = "America/Sao_Paulo";
  i18n.defaultLocale = "en_US.UTF-8";
  console.keyMap = "br-abnt2";

  security.sudo.wheelNeedsPassword = false;
  security.polkit.enable = true;

  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.enable = true;

  powerManagement.cpuFreqGovernor = "performance";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.overlays = [ inputs.nixverse.overlays.default ];
  nixpkgs.config.allowUnfree = true;

  networking.hostName = "tsugumori";
  system.stateVersion = "24.11";
}
