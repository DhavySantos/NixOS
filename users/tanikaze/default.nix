{ pkgs, ... } : {

  imports = [
    ./config/hyprland.nix
    ./config/mangohud.nix
    ./config/waybar.nix
    ./config/xremap.nix
    ./config/shell.nix
    ./config/theme.nix
  ];

  home.homeDirectory = "/home/tanikaze";
  home.stateVersion = "24.11";
  home.username = "tanikaze";

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.git.extraConfig = {
    user.email = "dhavysantos@gmail.com";
    user.name = "Dhavy Santos";
    init.defaultBranch = "main";
  };

  programs = {
    lazygit.enable = true;
    btop.enable = true;
    yazi.enable = true;
  };

  home.packages = with pkgs; [
    vesktop google-chrome spotify
  ];

  nixpkgs.config.allowUnfree = true;
}
