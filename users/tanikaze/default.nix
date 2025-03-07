{ pkgs, ...}:

{
  home-manager.users.tanikaze = {
    imports = [
      ./config/hyprland.nix
      ./config/theme.nix
      ./config/shell.nix
    ];

    home.sessionVariables = {
      EDITOR = "nvim";
    };

    home.packages = with pkgs; [
      vesktop google-chrome
    ];

    programs.git.enable = true;
    programs.git.extraConfig = {
      init.defaultBranch = "main";
      user = {
        email = "DhavyZhn@gmail.com";
        name = "Dhavy Santos";
      };
    };

    programs.lazygit.enable = true;
    programs.yazi.enable = true;
    programs.btop.enable = true;

    home.homeDirectory = "/home/tanikaze";
    home.stateVersion = "24.11";
    home.username = "tanikaze";

    nixpkgs.config.allowUnfree = true;
  };
}
