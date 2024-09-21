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

	programs.starship.enableZshIntegration = true;
	programs.starship.enable = true;
	programs.starship.settings = {
		format = "$os$directory$git_branch$package$rust$fill\n $character";
		add_newline = true;

		character.success_symbol = "[󱞩](bold green)";
		character.error_symbol = "[󱞩](bold red)";

		fill.symbol = " ";

		os.disabled = false;
		os.symbols.NixOS = " ";
	};
}
