{ pkgs, ... } : {
	programs.tmux = {
		extraConfig = builtins.readFile ./tmux.conf;
		shell = "${pkgs.zsh}/bin/zsh";
		prefix = "M-m";
		enable = true;
	};
}
