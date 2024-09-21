{ pkgs, ... } :

let

	neovim = pkgs.fetchFromGitHub {
		sha256 = "n0zsYDNqmBWAqvIAGJn0i9jMPUiKkA0TKOcD5ra2lJU=";
		rev = "71fc83766ca80e678baa3ce78416fb6003a1e3d9";
		owner = "DhavySantos";
		repo = "Neovim";
	};

in

{
	home.packages = with pkgs; [ ripgrep ];

	home.file.".config/nvim/lua/tanikaze" = {
		source = "${neovim}/lua/tanikaze";
		recursive = true;
	};

	stylix.targets.neovim.enable = false;

	programs.neovim.extraLuaConfig = ''
		require("tanikaze.core.options");
		require("tanikaze.core.lazynvim");
		require("tanikaze.core.colorscheme");
	'';

	programs.neovim = {
		defaultEditor = true;
		vimAlias = true;
		viAlias = true;
		enable = true;
	};
}
