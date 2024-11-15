{ pkgs, ... } : let

neovim = pkgs.fetchFromGitHub {
  sha256 = "sha256-XtRgnbHj6I96F0ilEHg+C3g0x/J8q97QeQTchmHloTE=";
	rev = "ae24d3e6d374c96616c82cb2dd16dbbdf3e53075";
	owner = "DhavySantos";
	repo = "Neovim";
};

in {
	home.packages = with pkgs; [ ripgrep ];

	home.file.".config/nvim/lua/tanikaze" = {
		source = "${neovim}/lua/tanikaze";
		recursive = true;
	};

	stylix.targets.neovim.enable = false;

	programs.neovim.extraLuaConfig = ''
		require("tanikaze");
	'';

	programs.neovim = {
		defaultEditor = true;
		vimAlias = true;
		viAlias = true;
		enable = true;
	};
}
