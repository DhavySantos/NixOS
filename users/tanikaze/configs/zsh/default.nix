{ config, ... } : {
	programs.zsh = {
		syntaxHighlighting.enable = true;
		autosuggestion.enable = true;
		enableCompletion = true;
		enable = true;

		history.path = "${config.xdg.dataHome}/.zsh/history";
		history.size = 10000;


		oh-my-zsh.plugins = [ "git" "fzf" ];
		oh-my-zsh.enable = true;

		envExtra = "export ZSH_COMPDUMP=\"\${ZDOTDIR:-\${ZSH}}/.zcompdump-\${SHORT_HOST}-\${ZSH_VERSION}\"";
	};
}
