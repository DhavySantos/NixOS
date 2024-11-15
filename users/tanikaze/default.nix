{ pkgs, ... } : {

  imports = [
		./config/gitconfig.nix
		./config/hyprland.nix
    ./config/stylix.nix
    ./config/xremap.nix
		./config/waybar.nix
		./config/neovim.nix
		./config/kitty.nix
		./config/tmux.nix
		./config/rofi.nix
		./config/zsh.nix
	];

  home.packages = with pkgs; [
    vesktop spotify prismlauncher
  ];

  programs = {
    chromium.enable = true;
    lazygit.enable = true;
    yazi.enable = true;
    btop.enable = true;
  };

  programs.chromium.extensions = [
    { id = "eimadpbcbfnmbkopoojfekhnkhdbieeh"; } # DARK READER
    { id = "lokpenepehfdekijkebhpnpcjjpngpnd"; } # YouTube Ad Auto-Skipper
    { id = "hpnelpabemhjfjgiibgkliipaehnfcjk"; } # Youtube Video Skip Ad Trigger
  ];

  home.homeDirectory = "/home/tanikaze";
  home.stateVersion = "24.11";
  home.username = "tanikaze";
  
  nixpkgs.config.allowUnfree = true;
}
