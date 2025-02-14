{ pkgs, config, ... } : {
  programs.tmux = {
		extraConfig = builtins.readFile ../files/tmux.conf;
		shell = "${pkgs.zsh}/bin/zsh";
		enable = true;
	};

  programs.kitty.enable = true;
  programs.kitty.settings = {
    shell = "${pkgs.tmux}/bin/tmux new -A -s Default";
    font_family = "CaskaydiaCove Nerd Font";
    confirm_os_window_close = "0";
    window_margin_width = "10";
  };

  programs.direnv.enableZshIntegration = true;
  programs.direnv.silent = true;
  programs.direnv.enable = true;

  programs.zsh = {
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    enable = true;

    shellAliases = {
      nix-shell = "nix-shell --run ${pkgs.zsh}/bin/zsh";
      ls = "${pkgs.eza}/bin/eza";
      ip = "ip -4 -c";
    };

    history.path = "${config.xdg.dataHome}/.cache/zsh_history";
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
