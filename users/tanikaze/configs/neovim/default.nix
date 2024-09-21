{ pkgs, inputs, ... } : {
	home.packages = with pkgs; [ ripgrep ];

	home.file.".config/nvim/lua/tanikaze" = {
		source = "${inputs.neovim}/lua/tanikaze";
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
