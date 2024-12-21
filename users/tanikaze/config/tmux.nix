{ pkgs, ... } : {
	programs.tmux = {
		extraConfig = builtins.readFile ../files/tmux.conf;
		shell = "${pkgs.zsh}/bin/zsh";
		enable = true;
	};
}
