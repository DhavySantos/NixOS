{ config, lib, ... } : with lib; {
  options.modules.waybar = {
    enable = mkOption {
      description = "Enable Waybar";
      type = types.bool;
      default = false;
    };

    font = mkOption {
      description = "Waybar Font Family";
      default = "CaskaydiaCove Nerd Font";
      type = types.str;
    };

    alpha = mkOption {
      description = "Waybar background Alpha factor";
      type = types.float;
      default = 1.0;
    };

    scale = mkOption {
      description = "Waybar Scale Factor";
      type = types.float;
      default = 1.0;
    };

    colors = mkOption {
      description = "Waybar colors";
      default = { };

      type = types.submodule {
        options = {
          accent = mkOption {
            type = types.str;
            default = "#83a598";
            description = "Accent color";
          };

          background = mkOption {
            type = types.str;
            default = "#282828";
            description = "Background color";
          };

          background-alt = mkOption {
            type = types.str;
            default = "#3c3836";
            description = "Alternative background color";
          };

          text = mkOption {
            type = types.str;
            default = "#bdae93";
            description = "Text color";
          };

          urgent = mkOption {
            type = types.str;
            default = "#fb4934";
            description = "Urgent color";
          };
        };
      };
    };

  };

  config.programs.waybar = mkIf config.modules.waybar.enable {
    style = mkForce (with config.modules.waybar; ''
      @define-color background-alt ${colors.background-alt};
      @define-color background ${colors.background};

      @define-color accent ${colors.accent};
      @define-color urgent ${colors.urgent};
      @define-color text ${colors.text};

      * {
        font-family: "${font}";
        font-weight: bold;
        padding: 0px;
        margin: 0px;
      }

      window#waybar {
        all:unset;
      }

      tooltip {
        background: alpha(@background, ${builtins.toString alpha});
        border: ${builtins.toString (1.0 * scale)}px solid alpha(@text, ${builtins.toString alpha});
        font-size: ${builtins.toString (14.0 * scale)}px;
      }

      tooltip label {
        color: @text;
      }

      .modules-left {
        border-radius: ${builtins.toString (6.0 * scale)}px;
        margin-bottom: ${builtins.toString (6.0 * scale)}px;
        margin-left: ${builtins.toString (6.0 * scale)}px;
      }

      .modules-center {
        border-radius: ${builtins.toString (6.0 * scale)}px;
        margin-bottom: ${builtins.toString (6.0 * scale)}px;
        margin-right: ${builtins.toString (6.0 * scale)}px;
        margin-left: ${builtins.toString (6.0 * scale)}px;
      }

      .modules-right {
        border-radius: ${builtins.toString (6.0 * scale)}px;
        margin-bottom: ${builtins.toString (6.0 * scale)}px;
        margin-right: ${builtins.toString (6.0 * scale)}px;
      }

      #custom-system {
        border-radius: ${builtins.toString (6.0 * scale)}px 0px 0px ${builtins.toString (6.0 * scale)}px;
        padding-right: ${builtins.toString (6.0 * scale)}px;
        padding-left: ${builtins.toString (6.0 * scale)}px;

        background: alpha(@background-alt, ${builtins.toString alpha});
        color: @accent;

        font-size: ${builtins.toString (12.0 * scale)}px;
      }

      #tray {
        border-radius: ${builtins.toString (10.0 * scale)}px;

        background: alpha(@background, ${builtins.toString alpha});
        padding-right: ${builtins.toString (6.0 * scale)}px;
        padding-left: ${builtins.toString (6.0 * scale)}px;
      }

      #clock {
        border-radius: 0px ${builtins.toString (6.0 * scale)}px ${builtins.toString (6.0 * scale)}px 0px;
        padding-right: ${builtins.toString (6.0 * scale)}px;
        padding-left: ${builtins.toString (6.0 * scale)}px;

        background: alpha(@background, ${builtins.toString alpha});
        font-size: ${builtins.toString (12.0 * scale)}px;
        color: @text;
      }

      #workspaces {
        border-radius: ${builtins.toString (6.0 * scale)}px;
        padding-right: ${builtins.toString (8.0 * scale)}px;
        padding-left: ${builtins.toString (6.0 * scale)}px;

        background: alpha(@background, ${builtins.toString alpha});
        font-size: ${builtins.toString (14.0 * scale)}px;
      }

      #workspaces button {
        border-radius: ${builtins.toString (6.0 * scale)}px;
        margin-right: ${builtins.toString (4.0 * scale)}px;
        margin-left: ${builtins.toString (4.0 * scale)}px;

        background: alpha(@background, 0);
        color: @text;
      }

      #workspaces button.empty {
        color: @background-alt;
      }

      #workspaces button.active {
        color: @accent;
      }

      #workspaces button.urgent {
        color: @urgent;
      }
    '');
    settings.main = {
      reload_style_on_change = true;
      position = "bottom";
      layer = "top";
      height = 24;

      modules-left = [ "custom/system" "clock" ];
      modules-center = [ "hyprland/workspaces" ];
      modules-right = [ "tray" ];

      "custom/system" = {
        exec = "nix-store --query --requisites /run/current-system | wc -l";
        tooltip-format = "Packages: {}";
        format = " ";
      };

      "clock" = {
        tooltip-format = "{:%Y/%m/%d}";
        format = "{:%I:%M:%S %p}";
        interval = 1;
      };

      "tray" = {
        icon-size =  16;
        spacing =  4;
      };

      "hyprland/workspaces" = {
        format = "{icon}";
        
        persistent-workspaces = {
          "HDMI-A-1" = [ 1 2 3 4 5 ];
          "HDMI-A-2" = [ 6 7 8 9 10 ];
        };

        format-icons = {
          default = "󰝥";
          active = "󰝥";
        };
      };
    };

    enable = true;
  };
}
