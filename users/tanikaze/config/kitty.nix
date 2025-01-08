{ pkgs, ... } : {
  programs.kitty.enable = true;
  programs.kitty.settings = {
    shell = "${pkgs.tmux}/bin/tmux new -A -s Default";
    font_family = "Cascadia Code NF";
    confirm_os_window_close = "0";
    window_margin_width = "10";
  };
}
