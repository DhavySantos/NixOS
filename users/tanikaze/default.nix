{ pkgs, ...}:

{
  home-manager.users.tanikaze = {
    imports = [
      ./config/theme.nix
      ./config/shell.nix
      ./config/i3wm.nix
    ];

    home.sessionVariables = {
      EDITOR = "nvim";
    };

    home.packages = with pkgs; [
      vesktop google-chrome spotify
      lutris winetricks wineWowPackages.stable
    ];

    programs.git.enable = true;
    programs.git.extraConfig = {
      init.defaultBranch = "main";
      user = {
        email = "DhavyZhn@gmail.com";
        name = "Dhavy Santos";
      };
    };

    programs.neovim = {
      defaultEditor = true;
      vimAlias = true;
      viAlias = true;
      enable = true;
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
