{ pkgs, inputs, ... } : {
  imports = [
    inputs.disko.nixosModules.disko
      ./config/hardware.nix
      ./config/pipewire.nix
      ./config/display.nix
      ./config/network.nix
      ./disko.nix
  ];

  ### USERS SECTION
  users.users.tanikaze = {
    extraGroups = [ "wheel" "uinput" "input" "gamemode"];
    description = "tanikaze";
    isNormalUser = true;
  };

  ### ENVIRONMENT SECTION
  environment.systemPackages = with pkgs; [
    vulkan-loader vulkan-headers vulkan-tools
    rocmPackages.rocm-smi home-manager
  ];

  fonts.packages = [
    ( import ../../packages/caskaydia_cove_nf.nix { inherit pkgs; } )
  ];

  programs = {
    gamescope.enable = true;
    gamemode.enable = true;
    nix-ld.enable = true;
    steam.enable = true;
    dconf.enable = true;
    nh.enable = true;
  };

  programs.gamemode.settings = {
    general = {
      renice = 10;
    };
  };

  time.timeZone = "America/Sao_Paulo";
  i18n.defaultLocale = "en_US.UTF-8";
  console.keyMap = "br-abnt2";

  ### SECURITY SECTION
  security.sudo.wheelNeedsPassword = false;
  security.polkit.enable = true;

  ### BOOT SECTION
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.enable = true;

  ### NIX CONFIGURATION SECTION
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "24.11";
}
