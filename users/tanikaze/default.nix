{ pkgs, ...}:

{
  home-manager.users.tanikaze = {
    imports = [
      ./config/hyprland.nix
      ./config/shell.nix
      ./config/theme.nix
    ];

    home.sessionVariables = {
      EDITOR = "nvim";
    };

    home.packages = with pkgs; [
      vesktop google-chrome
    ];

    programs.lazygit.enable = true;
    programs.yazi.enable = true;
    programs.btop.enable = true;

    home.homeDirectory = "/home/tanikaze";
    home.stateVersion = "24.11";
    home.username = "tanikaze";

    nixpkgs.config.allowUnfree = true;
  };
}
