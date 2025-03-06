{ config, pkgs, ... }:

{
  programs.tmux.shell = "${pkgs.zsh}/bin/zsh";
  programs.tmux.enable = true;
  programs.tmux.extraConfig = ''
    # Set Options
    set -g default-terminal "screen-256color"
    set -g terminal-overrides "xterm*:Tc"
    set -g detach-on-destroy off
    set -g mouse on

    # Create and Switch Between Windows
    bind -n M-t new-window -c "#{pane_current_path}"
    bind -n M-q previous-window
    bind -n M-e next-window
    bind -n M-k killp

    # Create and Swtich Between Sessions
    bind -n M-T new-session -c "#{pane_current_path}"
    bind -n M-Q switch-client -p
    bind -n M-E switch-client -n
    bind -n M-K kill-session

    # Set To Rename to Current Path
    set-option -g automatic-rename-format "#{b:pane_current_path}"
    set-option -g automatic-rename on
    set-option -g status-interval 1
  '';

  programs.kitty.enable = true;
  programs.kitty.settings = {
    shell = "${pkgs.tmux}/bin/tmux new -A -s default";
    font_family = "CaskaydiaCove Nerd Font";
    confirm_os_window_close = 0;
    window_margin_width = 10;
    font_size = 10;
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
    format = "$os$directory$git_branch$package$rust$fill\n$character";
    add_newline = true;

    character.success_symbol = " [󱞩](bold green)";
    character.error_symbol = " [󱞩](bold red)";

    fill.symbol = " ";

    os.disabled = false;
    os.symbols.NixOS = " ";
  };
}
