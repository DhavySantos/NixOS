{ pkgs, config, ... } : {
	programs.zsh = {
		syntaxHighlighting.enable = true;
		autosuggestion.enable = true;
		enableCompletion = true;
		enable = true;

    shellAliases = {
      ls = "${pkgs.eza}/bin/eza";
      ip = "ip -c";
    };

		envExtra = "export ZSH_COMPDUMP=\"\${ZDOTDIR:-\${ZSH}}/.zcompdump-\${SHORT_HOST}-\${ZSH_VERSION}\"";
		history.path = "${config.xdg.dataHome}/.zsh/history";
		history.size = 10000;
	};

	programs.fzf.enableZshIntegration = true;
	programs.fzf.enable = true;

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
