{ pkgs, ... } : {

  imports = [
    ./config/mangohud.nix
    ./config/polybar.nix
    ./config/stylix.nix
    ./config/xremap.nix
    ./config/kitty.nix
    ./config/i3wm.nix
    ./config/tmux.nix
    ./config/zsh.nix
  ];

  home.homeDirectory = "/home/tanikaze";
  home.stateVersion = "24.11";
  home.username = "tanikaze";

  home.sessionVariables.EDITOR = "nvim";
  stylix.targets.neovim.enable = false;
  programs.neovim.enable = true;

  programs.git.extraConfig.user.email = "dhavyzhn@gmail.com"; 
  programs.git.extraConfig.init.defaultBranch = "maim";
  programs.git.extraConfig.user.name = "Dhavy Santos"; 
  programs.git.enable = true;

  programs.lazygit.enable = true;
  programs.btop.enable = true;

  home.packages = with pkgs; [
    ( import ../../packages/awakened_poe_trade.nix { inherit pkgs; } )
    vesktop google-chrome
    path-of-building
    spotify
  ];

  nixpkgs.config.allowUnfree = true;
}
