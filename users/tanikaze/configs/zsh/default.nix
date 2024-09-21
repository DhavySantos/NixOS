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

	programs.fzf.enable = true;
	programs.fzf.enableZshIntegration = true;

	programs.zoxide.enableZshIntegration = true;
	programs.zoxide.options = [ "--cmd=cd" ];
	programs.zoxide.enable = true;

}
