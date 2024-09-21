{ pkgs, ... } : {
	imports = [
		./configs/alacritty
		./configs/hyprland
		./configs/mangohud
		./configs/xremap
		./configs/neovim
		./configs/waybar
		./configs/stylix
		./configs/tmux
		./configs/rofi
		./configs/zsh
		./configs/git
	];

	home.packages = with pkgs; [
		vesktop
	];

	programs = {
		firefox.enable = true;
		lazygit.enable = true;
		btop.enable = true;
	};

	home.homeDirectory = "/home/tanikaze";
	home.stateVersion = "24.11";
	home.username = "tanikaze";

	nixpkgs.config.allowUnfree = true;
}
