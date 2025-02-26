{ self, pkgs, inputs, ... } : {
  home-manager.extraSpecialArgs = { inherit self inputs; };
  home-manager.useUserPackages = true;
  home-manager.useGlobalPkgs = true;

  home-manager.users.tanikaze = {
    imports = [
      ./config/xremap.nix
      ./config/shell.nix
      ./config/theme.nix
      ./config/hyprland
    ];

    home.homeDirectory = "/home/tanikaze";
    home.stateVersion = "24.11";
    home.username = "tanikaze";

    home.sessionVariables = {
      EDITOR = "nvim";
    };

    programs.git.enable = true;
    programs.git.extraConfig = {
      user.email = "dhavysantos@gmail.com";
      init.defaultBranch = "main";
      user.name = "Dhavy Santos";
      pull.rebase = false;
    };

    programs = {
      lazygit.enable = true;
      btop.enable = true;
      yazi.enable = true;
    };

    home.packages = (with pkgs; [
      vesktop google-chrome neovim
      droidcam
    ]);

    nixpkgs.config.allowUnfree = true;
  };
}
