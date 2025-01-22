{ pkgs, mod, ...} : {
  "Print" = "exec ${pkgs.maim}/bin/maim -s | ${pkgs.xclip}/bin/xclip -selection clipboard -t image/png";
  "${mod}+Return" = "exec ${pkgs.kitty}/bin/kitty -o font_size=11";
  "${mod}+r" = "exec ${pkgs.rofi}/bin/rofi -show drun -show-icons";
  "${mod}+Shift+x" = "kill";

  "${mod}+w" = "focus up";
  "${mod}+a" = "focus left";
  "${mod}+s" = "focus down";
  "${mod}+d" = "focus right";

  "${mod}+Shift+w" = "move up";
  "${mod}+Shift+a" = "move left";
  "${mod}+Shift+s" = "move down";
  "${mod}+Shift+d" = "move right";

  "${mod}+h" = "split h";
  "${mod}+v" = "split v";

  "${mod}+Shift+f" = "floating toggle";
  "${mod}+space" = "focus mode_toggle";
  "${mod}+f" = "fullscreen toggle";

  "${mod}+q" = "workspace number 0";
  "${mod}+1" = "workspace number 1";
  "${mod}+2" = "workspace number 2";
  "${mod}+3" = "workspace number 3";
  "${mod}+4" = "workspace number 4";
  "${mod}+5" = "workspace number 5";
  "${mod}+6" = "workspace number 6";
  "${mod}+7" = "workspace number 7";
  "${mod}+8" = "workspace number 8";
  "${mod}+9" = "workspace number 9";
  "${mod}+0" = "workspace number 10";

  "${mod}+Shift+q" = "move container to workspace number 0";
  "${mod}+Shift+1" = "move container to workspace number 1";
  "${mod}+Shift+2" = "move container to workspace number 2";
  "${mod}+Shift+3" = "move container to workspace number 3";
  "${mod}+Shift+4" = "move container to workspace number 4";
  "${mod}+Shift+5" = "move container to workspace number 5";
  "${mod}+Shift+6" = "move container to workspace number 6";
  "${mod}+Shift+7" = "move container to workspace number 7";
  "${mod}+Shift+8" = "move container to workspace number 8";
  "${mod}+Shift+9" = "move container to workspace number 9";
  "${mod}+Shift+0" = "move container to workspace number 10";

  "${mod}+F11" = "workspace number 11";
  "${mod}+F12" = "workspace number 12";
  "${mod}+F13" = "workspace number 13";
  "${mod}+F14" = "workspace number 14";
  "${mod}+F15" = "workspace number 15";
  "${mod}+F16" = "workspace number 16";
  "${mod}+F17" = "workspace number 17";
  "${mod}+F18" = "workspace number 18";
  "${mod}+F19" = "workspace number 19";
  "${mod}+F20" = "workspace number 20";

  "${mod}+Shift+F1" = "move container to workspace number 1";
  "${mod}+Shift+F2" = "move container to workspace number 2";
  "${mod}+Shift+F3" = "move container to workspace number 3";
  "${mod}+Shift+F4" = "move container to workspace number 4";
  "${mod}+Shift+F5" = "move container to workspace number 5";
  "${mod}+Shift+F6" = "move container to workspace number 6";
  "${mod}+Shift+F7" = "move container to workspace number 7";
  "${mod}+Shift+F8" = "move container to workspace number 8";
  "${mod}+Shift+F9" = "move container to workspace number 9";
  "${mod}+Shift+F10" = "move container to workspace number 10";

  "${mod}+Shift+c" = "reload";
  "${mod}+Shift+r" = "restart";
}
