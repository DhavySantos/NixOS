{ ... } : {
	imports = [
		./configs/alacritty
		./configs/hyprland
		./configs/mangohud
		./configs/neovim
		./configs/waybar
		./configs/rofi
		./configs/zsh
	];

	home.homeDirectory = "/home/tanikaze";
	home.stateVersion = "24.11";
	home.username = "tanikaze";

	nixpkgs.config.allowUnfree = true;
}
