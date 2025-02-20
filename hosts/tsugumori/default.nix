{ pkgs, flakePath, inputs, ... } : {
  imports = [
    inputs.disko.nixosModules.disko
    "${flakePath}/users/tanikaze"

    ./config/hardware.nix
    ./config/pipewire.nix
    ./config/xserver.nix
    ./config/network.nix
    ./config/docker
    ./disko.nix
  ];

  ### ENVIRONMENT SECTION
  environment.systemPackages = (with pkgs; [
    vulkan-loader vulkan-headers vulkan-tools
  ]);

  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = true;
      AllowUsers = [ "tanikaze" ];
      PermitRootLogin = "no";
      X11Forwarding = true;
    };
  };

  fonts.packages = [
    (import ../../packages/caskaydia_cove_nf.nix { inherit pkgs; })
  ];

  programs = {
    gamescope.enable = true;
    steam.enable = true;
    nh.enable = true;
  };

  powerManagement.cpuFreqGovernor = "performance";
  environment.pathsToLink = [ "/share/zsh" ];
  time.timeZone = "America/Sao_Paulo";
  i18n.defaultLocale = "en_US.UTF-8";
  console.keyMap = "br-abnt2";

  ### SECURITY SECTION
  security.sudo.wheelNeedsPassword = false;
  security.polkit.enable = true;

  ### BOOT SECTION
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.enable = true;
  boot.tmp.tmpfsSize = "100%";
  boot.tmp.cleanOnBoot = true;
  boot.tmp.useTmpfs = true;

  ### NIX CONFIGURATION SECTION
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "24.11";
}
