{ pkgs, ... } :

let

	neovim = pkgs.fetchFromGitHub {
		sha256 = "L/TX53R+pWmsrx4E1AbDTyWrNubKfSkfNpQtlN6CeN0=";
		rev = "7c2aec6922e585b150ab354325677268db4a80e6";
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
