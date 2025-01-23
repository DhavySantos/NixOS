{ pkgs, modulesPath, ... } : {
  imports = [
    "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
  ];

  environment.systemPackages = (with pkgs; [
    git neovim yazi
  ]);

  networking.networkmanager.enable = true;
  networking.wireless.enable = false;

  time.timeZone = "America/Sao_Paulo";
  i18n.defaultLocale = "en_US.UTF-8";
  console.keyMap = "br-abnt2";

  boot.tmp.tmpfsSize = "100%";
  boot.tmp.cleanOnBoot = true;
  boot.tmp.useTmpfs = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
